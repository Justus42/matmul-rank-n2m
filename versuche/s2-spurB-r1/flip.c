/*
 * Flip-graph random walk for the matrix multiplication tensor <N,K,M>
 * (default <4,2,4>), in the style of Kauers and Moosbauer (2023),
 * written from the description in their paper, no code copied.
 *
 * Coefficient domains:
 *   p >= 2 prime : arithmetic in GF(p)
 *   p == 0       : arithmetic in Z, flips and merges only with scalars +-1,
 *                  coefficients bounded by --cap in absolute value
 *
 * A term is u (N*K entries, linear form in A), v (K*M, form in B),
 * w (N*M, contribution to C, not transposed: w[i][l] belongs to C[i][l]).
 * The scheme is correct iff sum_r u_r (x) v_r (x) w_r equals the tensor
 * T[(i,j)][(j',l)][(i',l')] = [i=i'][j=j'][l=l'].
 *
 * Search: start from the standard algorithm (N*K*M terms). Random flips;
 * after every flip, reductions (two terms with two proportional factors are
 * merged, terms with a zero factor are dropped). If no reduction happens for
 * --plateau flips, a plus transition (rank + 1) is applied, as long as the
 * rank stays <= best + --slack. Every time a scheme of rank <= --report is
 * reached it is verified exactly and its invariant is logged; a scheme of
 * rank <= --target is written to a file and the program stops.
 *
 * Usage: flip p seed seconds [--target t] [--report r] [--plateau L]
 *             [--slack s] [--cap c] [--out file] [--start file]
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#ifndef NN
#define NN 4
#endif
#ifndef KK
#define KK 2
#endif
#ifndef MM
#define MM 4
#endif
#define LA (NN * KK)
#define LB (KK * MM)
#define LC (NN * MM)
#define MAXL 64
#define MAXR 128

static int P = 2;   /* 0 = integers */
static int CAP = 1; /* coefficient bound for p = 0 */
static const int LEN[3] = {LA, LB, LC};

typedef struct {
    int f[3][MAXL];
    uint64_t k[3]; /* hash of the normalised factor, 0 for the zero vector */
} Term;

static Term S[MAXR];
static int R;

static uint64_t rs;
static inline uint64_t rnd(void) {
    rs ^= rs << 13;
    rs ^= rs >> 7;
    rs ^= rs << 17;
    return rs;
}
static inline int rndint(int n) { return (int)(rnd() % (uint64_t)n); }

static inline int md(int x) {
    if (P == 0) return x;
    x %= P;
    return x < 0 ? x + P : x;
}
static int inv(int a) {
    for (int x = 1; x < P; x++)
        if (md(a * x) == 1) return x;
    return 0;
}
static int iszero(const int *x, int n) {
    for (int i = 0; i < n; i++)
        if (x[i]) return 0;
    return 1;
}
/* returns lambda != 0 with y = lambda * x, or 0 */
static int prop(const int *x, const int *y, int n) {
    int i = 0;
    while (i < n && x[i] == 0) i++;
    if (i == n) return 0;
    if (y[i] == 0) return 0;
    int lam;
    if (P == 0) {
        if (y[i] == x[i]) lam = 1;
        else if (y[i] == -x[i]) lam = -1;
        else return 0;
    } else {
        lam = md(y[i] * inv(x[i]));
    }
    for (int k = 0; k < n; k++)
        if (md(lam * x[k]) != md(y[k])) return 0;
    return lam;
}
/* y = y + c * x, fails (returns 0) if the cap is exceeded for p = 0 */
static int axpy_ok(const int *x, const int *y, int c, int n) {
    if (P != 0) return 1;
    for (int k = 0; k < n; k++) {
        int z = y[k] + c * x[k];
        if (z > CAP || z < -CAP) return 0;
    }
    return 1;
}
static void axpy(const int *x, int *y, int c, int n) {
    for (int k = 0; k < n; k++) y[k] = md(y[k] + c * x[k]);
}

static int inv_tab[64];
static uint64_t nkey(const int *x, int n) {
    int i = 0;
    while (i < n && x[i] == 0) i++;
    if (i == n) return 0;
    int c = P ? inv_tab[x[i]] : (x[i] > 0 ? 1 : -1);
    uint64_t h = 1469598103934665603ULL;
    for (int k = 0; k < n; k++) {
        h ^= (uint64_t)(md(x[k] * c) + 1000);
        h *= 1099511628211ULL;
    }
    return h | 1;
}
static void setkeys(Term *t) {
    for (int s = 0; s < 3; s++) t->k[s] = nkey(t->f[s], LEN[s]);
}

static void del(int i) {
    S[i] = S[R - 1];
    R--;
}

/* merge all pairs of terms with two proportional factors; drop zero terms */
static int reduce(void) {
    int changed = 0, again = 1;
    while (again) {
        again = 0;
        for (int i = 0; i < R && !again; i++)
            for (int s = 0; s < 3; s++)
                if (S[i].k[s] == 0) {
                    del(i);
                    again = changed = 1;
                    break;
                }
        for (int i = 0; i < R && !again; i++)
            for (int j = i + 1; j < R && !again; j++) {
                int l[3];
                int eq = (S[i].k[0] == S[j].k[0]) + (S[i].k[1] == S[j].k[1]) + (S[i].k[2] == S[j].k[2]);
                if (eq < 2) continue;
                for (int s = 0; s < 3; s++) l[s] = S[i].k[s] == S[j].k[s] ? prop(S[i].f[s], S[j].f[s], LEN[s]) : 0;
                for (int s = 0; s < 3 && !again; s++) {
                    int a = (s + 1) % 3, b = (s + 2) % 3;
                    if (l[a] && l[b]) {
                        /* S[j] = la x (x) lb y (x) z' = x (x) y (x) (la*lb) z' */
                        int c = md(l[a] * l[b]);
                        if (!axpy_ok(S[j].f[s], S[i].f[s], c, LEN[s])) continue;
                        axpy(S[j].f[s], S[i].f[s], c, LEN[s]);
                        setkeys(&S[i]);
                        del(j);
                        again = changed = 1;
                    }
                }
            }
    }
    return changed;
}

/* one random flip: random term i, random factor s, random partner j with
   proportional factor s; returns 1 if done */
static int flip(void) {
    int js[MAXR];
    for (int tries = 0; tries < 2000; tries++) {
        int i = rndint(R), s = rndint(3), nj = 0;
        for (int j = 0; j < R; j++)
            if (j != i && S[j].k[s] == S[i].k[s]) js[nj++] = j;
        if (!nj) continue;
        int j = js[rndint(nj)];
        int lam = prop(S[i].f[s], S[j].f[s], LEN[s]);
        if (!lam) continue;
        int a = (s + 1) % 3, b = (s + 2) % 3;
        if (rnd() & 1) { int t = a; a = b; b = t; }
        int mu;
        if (P == 0) mu = (rnd() & 1) ? 1 : -1;
        else mu = 1 + rndint(P - 1);
        /* S[i] = x, y, z ; S[j] = lam x, y', z'
           new S[i].a = y + mu lam y' ; new S[j].b = z' - mu z */
        int c1 = md(mu * lam), c2 = md(-mu);
        if (!axpy_ok(S[j].f[a], S[i].f[a], c1, LEN[a])) continue;
        if (!axpy_ok(S[i].f[b], S[j].f[b], c2, LEN[b])) continue;
        axpy(S[j].f[a], S[i].f[a], c1, LEN[a]);
        axpy(S[i].f[b], S[j].f[b], c2, LEN[b]);
        setkeys(&S[i]);
        setkeys(&S[j]);
        return 1;
    }
    return 0;
}

/* plus transition: x(x)y(x)z + x'(x)y'(x)z' =
   (x - x')(x)y(x)z + x'(x)y(x)z + x'(x)y'(x)z'   ... then flip-able */
static void plus(void) {
    if (R + 1 >= MAXR) return;
    for (int tries = 0; tries < 100; tries++) {
        int i = rndint(R), j = rndint(R);
        if (i == j) continue;
        int s = rndint(3);
        if (P == 0) {
            int ok = 1;
            for (int k = 0; k < LEN[s]; k++) {
                int z = S[i].f[s][k] - S[j].f[s][k];
                if (z > CAP || z < -CAP) ok = 0;
            }
            if (!ok) continue;
        }
        Term t = S[i];
        memcpy(t.f[s], S[j].f[s], sizeof(int) * LEN[s]);
        axpy(S[j].f[s], S[i].f[s], md(-1), LEN[s]);
        setkeys(&S[i]);
        setkeys(&t);
        S[R++] = t;
        return;
    }
}

static int verify(void) {
    static int T[LA][LB][LC];
    memset(T, 0, sizeof T);
    for (int r = 0; r < R; r++)
        for (int a = 0; a < LA; a++) {
            if (!S[r].f[0][a]) continue;
            for (int b = 0; b < LB; b++) {
                if (!S[r].f[1][b]) continue;
                int ab = S[r].f[0][a] * S[r].f[1][b];
                for (int c = 0; c < LC; c++) T[a][b][c] += ab * S[r].f[2][c];
            }
        }
    for (int i = 0; i < NN; i++)
        for (int j = 0; j < KK; j++)
            for (int j2 = 0; j2 < KK; j2++)
                for (int l = 0; l < MM; l++)
                    for (int i2 = 0; i2 < NN; i2++)
                        for (int l2 = 0; l2 < MM; l2++) {
                            int want = (i == i2 && j == j2 && l == l2);
                            if (md(T[i * KK + j][j2 * MM + l][i2 * MM + l2]) != md(want)) return 0;
                        }
    return 1;
}

/* matrix rank over GF(p) (or over Q for p = 0, via fraction-free elimination
   on small ints, sufficient here because entries are tiny) */
static int mrank(const int *x, int rows, int cols) {
    long m[16][16];
    for (int r = 0; r < rows; r++)
        for (int c = 0; c < cols; c++) m[r][c] = x[r * cols + c];
    int rk = 0;
    for (int c = 0; c < cols && rk < rows; c++) {
        int piv = -1;
        for (int r = rk; r < rows; r++)
            if ((P ? md((int)m[r][c]) : m[r][c]) != 0) { piv = r; break; }
        if (piv < 0) continue;
        for (int k = 0; k < cols; k++) { long t = m[rk][k]; m[rk][k] = m[piv][k]; m[piv][k] = t; }
        for (int r = 0; r < rows; r++) {
            if (r == rk) continue;
            if (P) {
                int f = md((int)m[r][c] * inv(md((int)m[rk][c])));
                for (int k = 0; k < cols; k++) m[r][k] = md((int)(m[r][k] - f * m[rk][k]));
            } else {
                long a = m[rk][c], b = m[r][c];
                for (int k = 0; k < cols; k++) m[r][k] = a * m[r][k] - b * m[rk][k];
            }
        }
        rk++;
    }
    return rk;
}

/* invariant: sorted multiset of (rank u, rank v, rank w) codes */
static void invariant(char *buf) {
    int codes[MAXR];
    for (int r = 0; r < R; r++)
        codes[r] = mrank(S[r].f[0], NN, KK) * 100 + mrank(S[r].f[1], KK, MM) * 10 + mrank(S[r].f[2], NN, MM);
    for (int a = 0; a < R; a++)
        for (int b = a + 1; b < R; b++)
            if (codes[b] < codes[a]) { int t = codes[a]; codes[a] = codes[b]; codes[b] = t; }
    buf[0] = 0;
    for (int r = 0; r < R; r++) sprintf(buf + strlen(buf), "%03d%s", codes[r], r + 1 < R ? "," : "");
}

/* hash of the scheme as an unordered set of normalised terms */
static uint64_t hterm(const Term *t) {
    uint64_t h = 1469598103934665603ULL;
    int cu, cv;
    {
        int i = 0;
        while (!t->f[0][i]) i++;
        cu = P ? inv(t->f[0][i]) : (t->f[0][i] > 0 ? 1 : -1);
        i = 0;
        while (!t->f[1][i]) i++;
        cv = P ? inv(t->f[1][i]) : (t->f[1][i] > 0 ? 1 : -1);
    }
    int cw = P ? inv(md(cu * cv)) : cu * cv;
    int sc[3] = {cu, cv, cw};
    for (int s = 0; s < 3; s++)
        for (int k = 0; k < LEN[s]; k++) {
            h ^= (uint64_t)(md(t->f[s][k] * sc[s]) + 1000);
            h *= 1099511628211ULL;
        }
    return h;
}
static uint64_t hscheme(void) {
    uint64_t s = 0, x = 0;
    for (int r = 0; r < R; r++) {
        uint64_t h = hterm(&S[r]);
        s += h;
        x ^= h * 0x9E3779B97F4A7C15ULL;
    }
    return s ^ (x << 1);
}

static void dump(FILE *f) {
    fprintf(f, "%d %d %d %d %d\n", NN, KK, MM, R, P);
    for (int r = 0; r < R; r++) {
        for (int s = 0; s < 3; s++) {
            for (int k = 0; k < LEN[s]; k++) fprintf(f, "%d ", S[r].f[s][k]);
            fprintf(f, s < 2 ? "| " : "\n");
        }
    }
}
static int load(const char *fn) {
    FILE *f = fopen(fn, "r");
    if (!f) return 0;
    int n, k, m, p;
    if (fscanf(f, "%d %d %d %d %d", &n, &k, &m, &R, &p) != 5) return 0;
    if (n != NN || k != KK || m != MM) return 0;
    for (int r = 0; r < R; r++)
        for (int s = 0; s < 3; s++) {
            for (int q = 0; q < LEN[s]; q++) {
                int v;
                if (fscanf(f, "%d", &v) != 1) return 0;
                S[r].f[s][q] = md(v);
            }
            char bar[4];
            if (s < 2 && fscanf(f, "%3s", bar) != 1) return 0;
        }
    fclose(f);
    for (int r = 0; r < R; r++) setkeys(&S[r]);
    return 1;
}

static void standard(void) {
    R = 0;
    for (int i = 0; i < NN; i++)
        for (int j = 0; j < KK; j++)
            for (int l = 0; l < MM; l++) {
                memset(&S[R], 0, sizeof(Term));
                S[R].f[0][i * KK + j] = 1;
                S[R].f[1][j * MM + l] = 1;
                S[R].f[2][i * MM + l] = 1;
                setkeys(&S[R]);
                R++;
            }
}

int main(int argc, char **argv) {
    if (argc < 4) {
        fprintf(stderr, "usage: flip p seed seconds [options]\n");
        return 2;
    }
    P = atoi(argv[1]);
    uint64_t seed = strtoull(argv[2], 0, 10);
    double secs = atof(argv[3]);
    int target = 25, report = 26, plateau = 200000, slack = 2;
    int drift = 0; /* 1: every new scheme of the best rank becomes the restart point */
    long long restart_every = 0; /* restart from the start scheme after this many steps */
    const char *out = "found.txt", *start = 0;
    for (int a = 4; a + 1 < argc; a += 2) {
        if (!strcmp(argv[a], "--target")) target = atoi(argv[a + 1]);
        else if (!strcmp(argv[a], "--report")) report = atoi(argv[a + 1]);
        else if (!strcmp(argv[a], "--plateau")) plateau = atoi(argv[a + 1]);
        else if (!strcmp(argv[a], "--slack")) slack = atoi(argv[a + 1]);
        else if (!strcmp(argv[a], "--cap")) CAP = atoi(argv[a + 1]);
        else if (!strcmp(argv[a], "--drift")) drift = atoi(argv[a + 1]);
        else if (!strcmp(argv[a], "--restart")) restart_every = atoll(argv[a + 1]);
        else if (!strcmp(argv[a], "--out")) out = argv[a + 1];
        else if (!strcmp(argv[a], "--start")) start = argv[a + 1];
    }
    if (P) for (int x = 1; x < P; x++) inv_tab[x] = inv(x);
    rs = seed * 0x9E3779B97F4A7C15ULL + 12345;
    if (!rs) rs = 1;
    for (int i = 0; i < 10; i++) rnd();

    if (start) {
        if (!load(start)) { fprintf(stderr, "cannot load %s\n", start); return 2; }
    } else standard();
    reduce();
    if (!verify()) { fprintf(stderr, "start scheme wrong\n"); return 2; }

    Term start_scheme[MAXR];
    int startR = R;
    memcpy(start_scheme, S, sizeof(Term) * R);
    long long run_steps = 0, runs = 1;
    Term best[MAXR];
    int bestR = R;
    memcpy(best, S, sizeof(Term) * R);
    clock_t t0 = clock();
    long long steps = 0, since = 0, plusses = 0, restarts = 0;
    long long reached[MAXR] = {0};
    /* distinct schemes of rank <= report (hash table) */
    static uint64_t seen[1 << 20];
    long long nseen = 0;
    int lastR = R;
    while (1) {
        if ((steps & 0xFFFF) == 0) {
            double el = (double)(clock() - t0) / CLOCKS_PER_SEC;
            if (el > secs) break;
        }
        steps++;
        since++;
        run_steps++;
        if (restart_every && run_steps > restart_every) {
            memcpy(S, start_scheme, sizeof(Term) * startR);
            R = startR;
            lastR = R;
            run_steps = since = 0;
            runs++;
        }
        if (!flip()) { /* no flip possible: restart from best */
            memcpy(S, best, sizeof(Term) * bestR);
            R = bestR;
            restarts++;
            continue;
        }
        if (reduce()) since = 0;
        if (R != lastR) {
            if (R < lastR) reached[R]++;
            lastR = R;
        }
        if (R <= report) {
            uint64_t h = hscheme();
            uint64_t slot = h & ((1 << 20) - 1);
            int isnew = 1;
            while (seen[slot]) {
                if (seen[slot] == h) { isnew = 0; break; }
                slot = (slot + 1) & ((1 << 20) - 1);
            }
            if (isnew && nseen < (1 << 19)) {
                seen[slot] = h;
                nseen++;
                if (!verify()) { fprintf(stderr, "BUG: wrong scheme\n"); dump(stderr); return 3; }
                char inv_[4 * MAXR + 8];
                invariant(inv_);
                printf("SCHEME rank=%d hash=%016llx inv=%s\n", R, (unsigned long long)h, inv_);
                if (drift && R == bestR) memcpy(best, S, sizeof(Term) * R);
            }
        }
        if (R < bestR) {
            if (!verify()) { fprintf(stderr, "BUG: wrong scheme\n"); dump(stderr); return 3; }
            bestR = R;
            memcpy(best, S, sizeof(Term) * R);
            printf("BEST rank=%d steps=%lld\n", R, steps);
            fflush(stdout);
            if (R <= target) {
                FILE *f = fopen(out, "w");
                dump(f);
                fclose(f);
                printf("TARGET reached\n");
                break;
            }
        }
        if (since > plateau) {
            since = 0;
            if (R < bestR + slack) { plus(); plusses++; }
            else { memcpy(S, best, sizeof(Term) * bestR); R = bestR; restarts++; }
            reduce();
            lastR = R;
        }
    }
    /* always save the best scheme */
    {
        char fn[512];
        snprintf(fn, sizeof fn, "%s.best", out);
        FILE *f = fopen(fn, "w");
        memcpy(S, best, sizeof(Term) * bestR);
        R = bestR;
        dump(f);
        fclose(f);
    }
    printf("END p=%d seed=%llu steps=%lld runs=%lld best=%d plusses=%lld restarts=%lld distinct_le_report=%lld\n", P,
           (unsigned long long)seed, steps, runs, bestR, plusses, restarts, nseen);
    for (int r = 0; r < MAXR; r++)
        if (reached[r]) printf("REACHED rank=%d times=%lld\n", r, reached[r]);
    return 0;
}
