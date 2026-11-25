// Flip-graph random walk over GF(2) for the matrix multiplication tensor <N,K,M>.
// Default <4,2,4>. Kauers-Moosbauer style: flips, reductions, plus transitions.
// Usage: ./flip seed seconds target [plateau] [N K M]
// Prints any scheme with rank <= target (after exact verification) to stdout.
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

static int N = 4, K = 2, M = 4;
#define MAXR 64
typedef uint32_t u32;
static u32 A[MAXR], B[MAXR], C[MAXR];
static int R;

static uint64_t rs;
static inline uint64_t rnd(void) { rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }

// target tensor T[a-bit][b-bit] = c mask
static u32 TT[32][32];
static void build_target(void) {
  memset(TT, 0, sizeof TT);
  for (int i = 0; i < N; i++) for (int k = 0; k < K; k++) for (int j = 0; j < M; j++)
    TT[i * K + k][k * M + j] ^= 1u << (i * M + j);
}
static int verify(void) {
  static u32 S[32][32];
  memset(S, 0, sizeof S);
  for (int t = 0; t < R; t++)
    for (int x = 0; x < N * K; x++) if (A[t] >> x & 1)
      for (int y = 0; y < K * M; y++) if (B[t] >> y & 1) S[x][y] ^= C[t];
  for (int x = 0; x < N * K; x++) for (int y = 0; y < K * M; y++) if (S[x][y] != TT[x][y]) return 0;
  return 1;
}
// exact (not symmetry-reduced) fingerprint of the current scheme: sorted packed terms, FNV hash
static int cmpu(const void *x, const void *y) { uint64_t a = *(const uint64_t *)x, b = *(const uint64_t *)y; return a < b ? -1 : a > b; }
#define HBITS 24
static uint64_t *htab; static long distinct; static FILE *dumpf; static long dumpmax = 50000;
static void record_scheme(void) {
  uint64_t t[MAXR]; for (int i = 0; i < R; i++) t[i] = ((uint64_t)A[i] << 48) | ((uint64_t)B[i] << 32) | C[i];
  qsort(t, R, 8, cmpu);
  uint64_t h = 1469598103934665603ull; for (int i = 0; i < R; i++) { h ^= t[i]; h *= 1099511628211ull; h ^= h >> 29; }
  if (!h) h = 1;
  uint64_t k = h & ((1ull << HBITS) - 1);
  while (htab[k]) { if (htab[k] == h) return; k = (k + 1) & ((1ull << HBITS) - 1); }
  if (distinct < (1l << (HBITS - 1))) { htab[k] = h; distinct++;
    if (dumpf && distinct <= dumpmax) { for (int i = 0; i < R; i++) fprintf(dumpf, "%x %x %x%c", A[i], B[i], C[i], i == R - 1 ? '\n' : ' '); } }
}
static void del(int t) { R--; A[t] = A[R]; B[t] = B[R]; C[t] = C[R]; }

// try to reduce: any two terms equal in two factors get merged. Repeat until none.
static void reduce_all(void) {
  int changed = 1;
  while (changed) {
    changed = 0;
    for (int i = 0; i < R && !changed; i++) {
      if (!A[i] || !B[i] || !C[i]) { del(i); changed = 1; break; }
      for (int j = i + 1; j < R; j++) {
        if (A[i] == A[j] && B[i] == B[j]) { C[i] ^= C[j]; del(j); changed = 1; break; }
        if (A[i] == A[j] && C[i] == C[j]) { B[i] ^= B[j]; del(j); changed = 1; break; }
        if (B[i] == B[j] && C[i] == C[j]) { A[i] ^= A[j]; del(j); changed = 1; break; }
      }
    }
  }
}
static void print_scheme(FILE *f) {
  fprintf(f, "R=%d\n", R);
  for (int t = 0; t < R; t++) fprintf(f, "%x %x %x\n", A[t], B[t], C[t]);
  fflush(f);
}
static void init_standard(void) {
  R = 0;
  for (int i = 0; i < N; i++) for (int k = 0; k < K; k++) for (int j = 0; j < M; j++) {
    A[R] = 1u << (i * K + k); B[R] = 1u << (k * M + j); C[R] = 1u << (i * M + j); R++;
  }
}

int main(int argc, char **argv) {
  uint64_t seed = argc > 1 ? strtoull(argv[1], 0, 10) : 1;
  double secs = argc > 2 ? atof(argv[2]) : 60;
  int target = argc > 3 ? atoi(argv[3]) : 25;
  long plateau = argc > 4 ? atol(argv[4]) : 200000;
  if (argc > 7) { N = atoi(argv[5]); K = atoi(argv[6]); M = atoi(argv[7]); }
  int extra = argc > 8 ? atoi(argv[8]) : 2;
  long restart = argc > 9 ? atol(argv[9]) : 50 * plateau;
  long away = 0; unsigned long long restarts = 0;
  rs = seed * 0x9E3779B97F4A7C15ull + 12345; for (int i = 0; i < 10; i++) rnd();
  build_target();
  init_standard();
  htab = calloc(1ull << HBITS, 8);
  if (getenv("DUMP")) dumpf = fopen(getenv("DUMP"), "w");
  // keep best scheme for restarts
  static u32 bA[MAXR], bB[MAXR], bC[MAXR]; int bR;
  memcpy(bA, A, sizeof A); memcpy(bB, B, sizeof B); memcpy(bC, C, sizeof C); bR = R;
  int best = R;
  long since = 0; unsigned long long steps = 0, plus = 0;
  long hist[MAXR] = {0};
  time_t t0 = time(0);
  while (1) {
    steps++;
    if ((steps & 0xFFFFF) == 0 && difftime(time(0), t0) > secs) break;
    // choose random pair sharing a factor
    int i = rnd() % R, j = rnd() % R;
    if (i == j) continue;
    int typ = -1;
    u32 *X, *Y, *Z; // X shared, flip Y and Z
    if (A[i] == A[j]) typ = 0; else if (B[i] == B[j]) typ = 1; else if (C[i] == C[j]) typ = 2;
    if (typ < 0) {
      since++; away++;
      if (since > plateau && R < best + extra) {
        // plus transition on a random pair with no shared factor
        int a = rnd() % R, b = rnd() % R; if (a == b) continue;
        if (A[a] == A[b] || B[a] == B[b] || C[a] == C[b]) continue;
        int w = rnd() % 3;
        // x y z + x' y' z' = (x+x') y z + x' y z + x' y' z'
        if (w == 0) { A[R] = A[b]; B[R] = B[a]; C[R] = C[a]; A[a] ^= A[b]; }
        else if (w == 1) { B[R] = B[b]; A[R] = A[a]; C[R] = C[a]; B[a] ^= B[b]; }
        else { C[R] = C[b]; A[R] = A[a]; B[R] = B[a]; C[a] ^= C[b]; }
        R++; plus++; since = 0; // no reduce here: the two new terms share two factors by design
      }
      if (R > best && away > restart) { // back to a best-rank scheme
        memcpy(A, bA, sizeof A); memcpy(B, bB, sizeof B); memcpy(C, bC, sizeof C); R = bR; since = 0; away = 0; restarts++;
      }
      continue;
    }
    if (typ == 0) { X = A; Y = B; Z = C; } else if (typ == 1) { X = B; Y = A; Z = C; } else { X = C; Y = A; Z = B; }
    (void)X;
    // x y_i z_i + x y_j z_j = x (y_i + y_j) z_i + x y_j (z_j + z_i)
    if (rnd() & 1) { int t = i; i = j; j = t; }
    Y[i] ^= Y[j]; Z[j] ^= Z[i];
    since++; away++;
    int oldR = R;
    // local reduction check for i and j
    if (!Y[i] || !Z[j]) { reduce_all(); }
    else {
      for (int s = 0; s < 2; s++) {
        int u = s ? j : i;
        for (int v = 0; v < R; v++) if (v != u) {
          if ((A[u] == A[v]) + (B[u] == B[v]) + (C[u] == C[v]) >= 2) { reduce_all(); s = 2; break; }
        }
      }
    }
    if (R < oldR) {
      since = 0; if (R <= best) away = 0;
      if (!verify()) { fprintf(stderr, "VERIFY FAIL\n"); return 1; }
      hist[R]++;
      if (R == best || R < best) record_scheme();
      if (R < best || (R == best && R <= target)) {
        if (R < best) fprintf(stderr, "seed %llu: rank %d at step %llu\n", (unsigned long long)seed, R, steps);
        best = R < best ? R : best;
        memcpy(bA, A, sizeof A); memcpy(bB, B, sizeof B); memcpy(bC, C, sizeof C); bR = R;
        if (R <= target) { print_scheme(stdout); }
      }
    }
  }
  fprintf(stderr, "seed %llu done: best %d steps %llu plus %llu restarts %llu\n", (unsigned long long)seed, best, steps, plus, restarts);
  fprintf(stderr, "distinct schemes recorded at best rank (exact, hash-based): %ld\n", distinct);
  fprintf(stderr, "reductions arriving at rank r:");
  for (int r = 0; r < MAXR; r++) if (hist[r]) fprintf(stderr, " %d:%ld", r, hist[r]);
  fprintf(stderr, "\n");
  if (verify() || 1) { R = bR; memcpy(A, bA, sizeof A); memcpy(B, bB, sizeof B); memcpy(C, bC, sizeof C);
    if (verify()) { fprintf(stderr, "best scheme verified:\n"); print_scheme(stderr); } }
  return 0;
}
