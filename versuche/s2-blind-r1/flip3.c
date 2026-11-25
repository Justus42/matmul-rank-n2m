// Flip-graph random walk over GF(3) for the matrix multiplication tensor <N,K,M>.
// A vector over GF(3) is stored as two bitmasks (p = coordinates equal to +1, n = equal to -1).
// Usage: ./flip3 seed seconds target plateau N K M extra restart
// Prints every scheme of rank <= target (after exact verification mod 3) to stdout.
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

typedef uint32_t u32;
typedef struct { u32 p, n; } V;
#define MAXR 64
static int N = 4, K = 2, M = 4;
static V F[3][MAXR]; // F[0]=a, F[1]=b, F[2]=c
static int R;
static uint64_t rs;
static inline uint64_t rnd(void) { rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }

static inline V add(V x, V y) {
  V r;
  r.p = (x.p & ~y.p & ~y.n) | (y.p & ~x.p & ~x.n) | (x.n & y.n);
  r.n = (x.n & ~y.p & ~y.n) | (y.n & ~x.p & ~x.n) | (x.p & y.p);
  return r;
}
static inline V neg(V x) { V r = {x.n, x.p}; return r; }
static inline int isz(V x) { return !(x.p | x.n); }
static inline int eq(V x, V y) { return x.p == y.p && x.n == y.n; }
// proportional: returns 1 if y == x, -1 if y == -x, 0 otherwise
static inline int prop(V x, V y) { if (eq(x, y)) return 1; if (x.p == y.n && x.n == y.p) return -1; return 0; }

static int TT[32][32][32];
static void build_target(void) {
  memset(TT, 0, sizeof TT);
  for (int i = 0; i < N; i++) for (int k = 0; k < K; k++) for (int j = 0; j < M; j++)
    TT[i * K + k][k * M + j][i * M + j] = 1;
}
static inline int coef(V x, int i) { return (x.p >> i & 1) ? 1 : (x.n >> i & 1) ? 2 : 0; }
static int verify(void) {
  static int S[32][32][32];
  memset(S, 0, sizeof S);
  for (int t = 0; t < R; t++)
    for (int x = 0; x < N * K; x++) { int ca = coef(F[0][t], x); if (!ca) continue;
      for (int y = 0; y < K * M; y++) { int cb = coef(F[1][t], y); if (!cb) continue;
        for (int z = 0; z < N * M; z++) { int cc = coef(F[2][t], z); if (cc) S[x][y][z] = (S[x][y][z] + ca * cb * cc) % 3; } } }
  for (int x = 0; x < N * K; x++) for (int y = 0; y < K * M; y++) for (int z = 0; z < N * M; z++)
    if (S[x][y][z] != TT[x][y][z]) return 0;
  return 1;
}
static void del(int t) { R--; for (int f = 0; f < 3; f++) F[f][t] = F[f][R]; }

static void reduce_all(void) {
  int changed = 1;
  while (changed) {
    changed = 0;
    for (int i = 0; i < R && !changed; i++) {
      if (isz(F[0][i]) || isz(F[1][i]) || isz(F[2][i])) { del(i); changed = 1; break; }
      for (int j = i + 1; j < R && !changed; j++) {
        for (int f = 0; f < 3; f++) {
          int g = (f + 1) % 3, h = (f + 2) % 3;
          int s1 = prop(F[f][i], F[f][j]), s2 = prop(F[g][i], F[g][j]);
          if (s1 && s2) { // term j = (s1 s2) * x y z_j  -> merge into h-factor of i
            V w = F[h][j]; if (s1 * s2 < 0) w = neg(w);
            F[h][i] = add(F[h][i], w); del(j); changed = 1; break;
          }
        }
      }
    }
  }
}
static void print_scheme(FILE *f) {
  fprintf(f, "R=%d (each factor as +mask/-mask in hex)\n", R);
  for (int t = 0; t < R; t++) fprintf(f, "%x/%x %x/%x %x/%x\n", F[0][t].p, F[0][t].n, F[1][t].p, F[1][t].n, F[2][t].p, F[2][t].n);
  fflush(f);
}
static void init_standard(void) {
  R = 0;
  for (int i = 0; i < N; i++) for (int k = 0; k < K; k++) for (int j = 0; j < M; j++) {
    V a = {1u << (i * K + k), 0}, b = {1u << (k * M + j), 0}, c = {1u << (i * M + j), 0};
    F[0][R] = a; F[1][R] = b; F[2][R] = c; R++;
  }
}

int main(int argc, char **argv) {
  uint64_t seed = argc > 1 ? strtoull(argv[1], 0, 10) : 1;
  double secs = argc > 2 ? atof(argv[2]) : 60;
  int target = argc > 3 ? atoi(argv[3]) : 25;
  long plateau = argc > 4 ? atol(argv[4]) : 300000;
  if (argc > 7) { N = atoi(argv[5]); K = atoi(argv[6]); M = atoi(argv[7]); }
  int extra = argc > 8 ? atoi(argv[8]) : 2;
  long restart = argc > 9 ? atol(argv[9]) : 30 * plateau;
  rs = seed * 0x9E3779B97F4A7C15ull + 777; for (int i = 0; i < 10; i++) rnd();
  build_target(); init_standard();
  static V best_F[3][MAXR]; int bR = R, best = R;
  memcpy(best_F, F, sizeof F);
  long since = 0, away = 0; unsigned long long steps = 0, plus = 0, restarts = 0;
  long hist[MAXR] = {0};
  time_t t0 = time(0);
  while (1) {
    steps++;
    if ((steps & 0xFFFFF) == 0 && difftime(time(0), t0) > secs) break;
    int i = rnd() % R, j = rnd() % R;
    if (i == j) continue;
    int f = rnd() % 3, s = 0;
    for (int tries = 0; tries < 3; tries++, f = (f + 1) % 3) if ((s = prop(F[f][i], F[f][j]))) break;
    if (!s) {
      since++; away++;
      if (since > plateau && R < best + extra) {
        int a = i, b = j;
        int w = rnd() % 3;
        // x y z + x' y' z' = (x - x') y z + x' y z + x' y' z'
        for (int g = 0; g < 3; g++) F[g][R] = F[g][a];
        F[w][R] = F[w][b];
        F[w][a] = add(F[w][a], neg(F[w][b]));
        R++; plus++; since = 0;
      }
      if (R > best && away > restart) { memcpy(F, best_F, sizeof F); R = bR; since = 0; away = 0; restarts++; }
      continue;
    }
    int g = (f + 1) % 3, h = (f + 2) % 3;
    if (rnd() & 1) { g = (f + 2) % 3; h = (f + 1) % 3; }
    // make shared factor identical: move sign of term j into its g-factor
    if (s < 0) { F[f][j] = F[f][i]; F[g][j] = neg(F[g][j]); }
    if (rnd() & 1) { int t = i; i = j; j = t; }
    // x y_i z_i + x y_j z_j = x (y_i + l y_j) z_i + x y_j (z_j - l z_i), l in {1,2}
    V yj = F[g][j], zi = F[h][i];
    if (rnd() & 1) { yj = neg(yj); zi = neg(zi); }
    F[g][i] = add(F[g][i], yj);
    F[h][j] = add(F[h][j], neg(zi));
    since++; away++;
    int oldR = R;
    if (isz(F[g][i]) || isz(F[h][j])) reduce_all();
    else {
      int hit = 0;
      for (int q = 0; q < 2 && !hit; q++) { int u = q ? j : i;
        for (int v = 0; v < R && !hit; v++) if (v != u) {
          int c = (prop(F[0][u], F[0][v]) != 0) + (prop(F[1][u], F[1][v]) != 0) + (prop(F[2][u], F[2][v]) != 0);
          if (c >= 2) hit = 1;
        } }
      if (hit) reduce_all();
    }
    if (R < oldR) {
      since = 0; if (R <= best) away = 0;
      if (!verify()) { fprintf(stderr, "VERIFY FAIL\n"); return 1; }
      hist[R]++;
      if (R < best) fprintf(stderr, "seed %llu: rank %d at step %llu\n", (unsigned long long)seed, R, steps);
      if (R <= best) { best = R; memcpy(best_F, F, sizeof F); bR = R; if (R <= target) print_scheme(stdout); }
    }
  }
  fprintf(stderr, "seed %llu done: best %d steps %llu plus %llu restarts %llu\n", (unsigned long long)seed, best, steps, plus, restarts);
  fprintf(stderr, "reductions arriving at rank r:");
  for (int r = 0; r < MAXR; r++) if (hist[r]) fprintf(stderr, " %d:%ld", r, hist[r]);
  fprintf(stderr, "\n");
  memcpy(F, best_F, sizeof F); R = bR;
  if (verify()) { fprintf(stderr, "best scheme verified mod 3:\n"); print_scheme(stderr); }
  return 0;
}
