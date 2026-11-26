/* Exact flip-graph search for matrix multiplication schemes <n,k,m> (S4-22).
 *
 * Own code, written for this task. Idea after Kauers and Moosbauer, "Flip graphs for
 * matrix multiplication" (arXiv:2212.01175); no code taken from there.
 *
 * A scheme is a list of rank-one tensors s * a (x) b (x) c with a in F^{nk} (u, A side),
 * b in F^{km} (v, B side), c in F^{nm} (w, C side, not transposed: c[i*m+l] = w[i][l]).
 * It is correct iff sum_r s_r a_r (x) b_r (x) c_r equals the matrix multiplication
 * tensor exactly. Arithmetic is exact: modulo a prime P (P >= 2), or over Z (P = 0) with
 * every coefficient bounded by |x| <= B (a flip that would exceed the bound is rejected).
 * No floating point number enters the scheme.
 *
 * Start: the standard algorithm with n*k*m products. No knowledge of any other scheme.
 * Moves: flip  s_i x(x)y_i(x)z_i + s_j x(x)y_j(x)z_j
 *            = x(x)(s_i y_i + l s_j y_j)(x)z_i + s_j x(x)y_j(x)(z_j - l z_i),
 *        for two products sharing a factor x (in any of the three positions), with
 *        l in F^* (mod P) or l = +-1 (over Z). After every flip all reductions are applied:
 *        a product with a zero factor is dropped, two products that agree in two factors
 *        are merged. A reduction lowers the length by at least one.
 *        If no reduction happened for L flips, a plus transition (length + 1) is done
 *        (only while the length is below the limit given by --plusmax).
 * Each scheme written to the output was checked exactly against the tensor in this
 * program; the Python side (check.py) checks it again with fractions.Fraction.
 *
 * Usage: flip n k m P B target seed seconds L plusmax outfile [maxout]
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAXR 200
#define MAXD 64
typedef struct { int s; int f[3][MAXD]; } Term;

static int N, K, M, P, B, D[3], SMALL = 1;
static Term T[MAXR + 8];
static int R;
static unsigned long long rs;
static unsigned long long rnd(void) { rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }

static int md(long x) { if (!P) return (int)x; x %= P; if (x < 0) x += P; return (int)x; }
static int inv(int a) { long r = 1, b = a, e = P - 2; while (e) { if (e & 1) r = r * b % P; b = b * b % P; e >>= 1; } return (int)r; }

/* canonical form of a vector: first nonzero entry 1 (mod P) or positive (Z).
   returns the factor t with v_old = t * v_new, or 0 if v is zero. */
static int canon(int *v, int d) {
  int q = 0; while (q < d && v[q] == 0) q++;
  if (q == d) return 0;
  int t = v[q];
  if (P) { int iv = inv(t); for (int i = q; i < d; i++) v[i] = (int)((long)v[i] * iv % P); return t; }
  if (t < 0) { for (int i = q; i < d; i++) v[i] = -v[i]; return -1; }
  return 1;
}
static int mul(int a, int b) { return P ? (int)((long)a * b % P) : a * b; }
static int same(const int *x, const int *y, int d) { return memcmp(x, y, sizeof(int) * d) == 0; }
static int bounded(const int *v, int d) { if (P) return 1; for (int i = 0; i < d; i++) if (v[i] > B || v[i] < -B) return 0; return 1; }

static void standard(void) {
  R = 0;
  for (int i = 0; i < N; i++) for (int j = 0; j < K; j++) for (int l = 0; l < M; l++) {
    Term *t = &T[R++]; memset(t, 0, sizeof(Term)); t->s = 1;
    t->f[0][i * K + j] = 1; t->f[1][j * M + l] = 1; t->f[2][i * M + l] = 1;
  }
}

/* exact check: sum of all terms equals the tensor */
static int verify(void) {
  static long acc[MAXD][MAXD][MAXD];
  memset(acc, 0, sizeof(acc));
  for (int r = 0; r < R; r++) for (int a = 0; a < D[0]; a++) if (T[r].f[0][a])
    for (int b = 0; b < D[1]; b++) if (T[r].f[1][b])
      for (int c = 0; c < D[2]; c++) if (T[r].f[2][c])
        acc[a][b][c] += (long)T[r].s * T[r].f[0][a] * T[r].f[1][b] * T[r].f[2][c];
  for (int i = 0; i < N; i++) for (int j = 0; j < K; j++) for (int j2 = 0; j2 < K; j2++)
    for (int l = 0; l < M; l++) for (int i2 = 0; i2 < N; i2++) for (int l2 = 0; l2 < M; l2++) {
      long want = (i == i2 && j == j2 && l == l2) ? 1 : 0;
      long got = acc[i * K + j][j2 * M + l][i2 * M + l2];
      if (P) { got %= P; if (got < 0) got += P; }
      if (got != want) return 0;
    }
  return 1;
}

static void removeTerm(int i) { T[i] = T[R - 1]; R--; }

/* apply all reductions; returns number of removed products */
static int reduceAll(void) {
  int removed = 0, changed = 1;
  while (changed) {
    changed = 0;
    for (int i = 0; i < R && !changed; i++) {
      if (T[i].s == 0) { removeTerm(i); removed++; changed = 1; break; }
      for (int j = i + 1; j < R && !changed; j++) {
        int e0 = same(T[i].f[0], T[j].f[0], D[0]);
        int e1 = same(T[i].f[1], T[j].f[1], D[1]);
        int e2 = same(T[i].f[2], T[j].f[2], D[2]);
        if (e0 + e1 + e2 >= 2) {
          int k = !e0 ? 0 : (!e1 ? 1 : 2);   /* the free factor (any, if all equal) */
          int tmp[MAXD]; int ok = 1;
          for (int q = 0; q < D[k]; q++) tmp[q] = md((long)T[i].s * T[i].f[k][q] + (long)T[j].s * T[j].f[k][q]);
          if (!bounded(tmp, D[k])) ok = 0;
          if (!ok) continue;
          int t = canon(tmp, D[k]);
          if (t == 0) { removeTerm(j); removeTerm(i); removed += 2; }
          else { memcpy(T[i].f[k], tmp, sizeof(int) * D[k]); T[i].s = t; removeTerm(j); removed++; }
          changed = 1;
        }
      }
    }
  }
  return removed;
}

/* pick a random pair of products sharing a factor: random product i, random position k,
   uniform among the partners j of i at position k; up to 64 tries. */
static int pick(int *pi_, int *pj_, int *pk_) {
  static int cand[MAXR];
  for (int t = 0; t < 64; t++) {
    int i = (int)(rnd() % R), k = (int)(rnd() % 3), c = 0;
    for (int j = 0; j < R; j++) if (j != i && same(T[i].f[k], T[j].f[k], D[k])) cand[c++] = j;
    if (c) { *pi_ = i; *pj_ = cand[rnd() % c]; *pk_ = k; return 1; }
  }
  return 0;
}

/* cheap test whether products i or j now allow a reduction */
static int needsReduce(int i, int j) {
  if (T[i].s == 0 || T[j].s == 0) return 1;
  for (int r = 0; r < R; r++) {
    if (r != i) { int e = same(T[i].f[0], T[r].f[0], D[0]) + same(T[i].f[1], T[r].f[1], D[1]) + same(T[i].f[2], T[r].f[2], D[2]); if (e >= 2) return 1; }
    if (r != j) { int e = same(T[j].f[0], T[r].f[0], D[0]) + same(T[j].f[1], T[r].f[1], D[1]) + same(T[j].f[2], T[r].f[2], D[2]); if (e >= 2) return 1; }
  }
  return 0;
}

static int lastI, lastJ;
/* one random flip; returns 1 if done */
static int flip(void) {
  int i, j, k;
  if (!pick(&i, &j, &k)) return 0;
  lastI = i; lastJ = j;
  int k1 = (k + 1) % 3, k2 = (k + 2) % 3;
  if (rnd() & 1) { int t = k1; k1 = k2; k2 = t; }
  int lam = P ? 1 + (int)(rnd() % (P - 1)) : ((rnd() & 1) ? 1 : -1);
  int Y[MAXD], Z[MAXD];
  for (int a = 0; a < D[k1]; a++) Y[a] = md((long)T[i].s * T[i].f[k1][a] + (long)lam * T[j].s * T[j].f[k1][a]);
  for (int a = 0; a < D[k2]; a++) Z[a] = md((long)T[j].f[k2][a] - (long)lam * T[i].f[k2][a]);
  if (!P && SMALL) {
    /* over Z: prefer the sign of l that gives the smaller coefficients (L1 norm); with
       probability 1/8 keep the random sign */
    int Y2[MAXD], Z2[MAXD]; long n1 = 0, n2 = 0;
    for (int a = 0; a < D[k1]; a++) { Y2[a] = T[i].s * T[i].f[k1][a] - lam * T[j].s * T[j].f[k1][a]; n1 += abs(Y[a]); n2 += abs(Y2[a]); }
    for (int a = 0; a < D[k2]; a++) { Z2[a] = T[j].f[k2][a] + lam * T[i].f[k2][a]; n1 += abs(Z[a]); n2 += abs(Z2[a]); }
    if (n2 < n1 && (rnd() & 7)) { memcpy(Y, Y2, sizeof(Y2)); memcpy(Z, Z2, sizeof(Z2)); }
  }
  if (!bounded(Y, D[k1]) || !bounded(Z, D[k2])) return 0;
  int ty = canon(Y, D[k1]), tz = canon(Z, D[k2]);
  memcpy(T[i].f[k1], Y, sizeof(int) * D[k1]); T[i].s = ty;          /* ty = 0 marks removal */
  memcpy(T[j].f[k2], Z, sizeof(int) * D[k2]); T[j].s = tz ? mul(T[j].s, tz) : 0;
  return 1;
}

/* plus transition: a(x)b(x)c + a'(x)b'(x)c' = (a-a')(x)b(x)c + a'(x)b(x)c + a'(x)b'(x)c' */
static int plus(void) {
  if (R + 1 > MAXR) return 0;
  int i = (int)(rnd() % R), j = (int)(rnd() % R);
  if (i == j) return 0;
  int k = (int)(rnd() % 3), k1 = (k + 1) % 3, k2 = (k + 2) % 3;
  int X[MAXD];
  /* s_i a_i b_i c_i = s_i (a_i - t a_j) b_i c_i + s_i t a_j b_i c_i ; take t = 1 */
  for (int a = 0; a < D[k]; a++) X[a] = md((long)T[i].f[k][a] - T[j].f[k][a]);
  if (!bounded(X, D[k])) return 0;
  Term nt = T[i];
  memcpy(nt.f[k], T[j].f[k], sizeof(int) * D[k]);
  int tx = canon(X, D[k]);
  if (!tx) return 0;
  memcpy(T[i].f[k], X, sizeof(int) * D[k]); T[i].s = mul(T[i].s, tx);
  T[R++] = nt;
  (void)k1; (void)k2;
  return 1;
}

static void dump(FILE *fo) {
  fprintf(fo, "scheme %d %d %d %d %d\n", N, K, M, R, P);
  for (int r = 0; r < R; r++) {
    for (int a = 0; a < D[0]; a++) fprintf(fo, "%d ", T[r].f[0][a]);
    fprintf(fo, "| ");
    for (int b = 0; b < D[1]; b++) fprintf(fo, "%d ", T[r].f[1][b]);
    fprintf(fo, "| ");
    for (int c = 0; c < D[2]; c++) fprintf(fo, "%d ", md((long)T[r].s * T[r].f[2][c]));
    fprintf(fo, "\n");
  }
  fprintf(fo, "end\n");
  fflush(fo);
}

int main(int argc, char **argv) {
  if (argc < 12) { fprintf(stderr, "usage: flip n k m P B target seed seconds L plusmax outfile [maxout]\n"); return 2; }
  N = atoi(argv[1]); K = atoi(argv[2]); M = atoi(argv[3]); P = atoi(argv[4]); B = atoi(argv[5]);
  int target = atoi(argv[6]); rs = 0x9E3779B97F4A7C15ULL ^ (unsigned long long)atoll(argv[7]) * 2654435761ULL;
  double secs = atof(argv[8]); long L = atol(argv[9]); int plusmax = atoi(argv[10]);
  if (getenv("FLIP_RANDSIGN")) SMALL = 0;
  FILE *fo = fopen(argv[11], "a"); int maxout = argc > 12 ? atoi(argv[12]) : 1;
  D[0] = N * K; D[1] = K * M; D[2] = N * M;
  if (D[0] > MAXD || D[1] > MAXD || D[2] > MAXD) return 2;
  for (int i = 0; i < 20; i++) rnd();
  standard();
  if (!verify()) { fprintf(stderr, "start wrong\n"); return 3; }
  int best = R, nout = 0; long since = 0, steps = 0, flips = 0;
  time_t t0 = time(NULL);
  Term bestT[MAXR + 8]; int bestR = R; memcpy(bestT, T, sizeof(Term) * R);
  printf("start R=%d P=%d B=%d target=%d seed=%s\n", R, P, B, target, argv[7]); fflush(stdout);
  while (difftime(time(NULL), t0) < secs) {
    for (int it = 0; it < 1000; it++) {
      steps++;
      if (!flip()) { since++; continue; }
      flips++;
      int rem = needsReduce(lastI, lastJ) ? reduceAll() : 0;
      if (rem) since = 0; else since++;
      if (R < best) {
        best = R;
        if (!verify()) { fprintf(stderr, "BUG: scheme wrong at R=%d\n", R); return 4; }
        printf("t=%.0fs steps=%ld R=%d\n", difftime(time(NULL), t0), steps, R); fflush(stdout);
        bestR = R; memcpy(bestT, T, sizeof(Term) * R);
      }
      if (R <= target) {
        if (!verify()) { fprintf(stderr, "BUG at output\n"); return 4; }
        dump(fo); nout++;
        printf("FOUND R=%d at t=%.0fs steps=%ld (output %d)\n", R, difftime(time(NULL), t0), steps, nout); fflush(stdout);
        if (nout >= maxout) { fclose(fo); return 0; }
        /* continue from a fresh random walk from the found scheme: force a plus transition */
        while (!plus()) ;
        since = 0;
      }
      if (since > L) {
        if (R < plusmax) { if (plus()) since = 0; }
        else { R = bestR; memcpy(T, bestT, sizeof(Term) * R); since = 0; }
      }
    }
  }
  printf("timeout best=%d steps=%ld flips=%ld\n", best, steps, flips);
  fclose(fo);
  return 1;
}
