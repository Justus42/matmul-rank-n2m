"""Random test of the refined Lemma 13 (d = 3):  rk H >= 2 rho + s + ceil((rk L - rho)/2)
for abstract linear maps F_1, F_2, F_3 : K^m -> K^q (no Yang structure), over Z/(2^61-1).
Families: random; common 3-dim image; common kernel; images in a common subspace + kernel."""
import random
from felder import PrimeField, rank, left_kernel
F = PrimeField()
R = lambda: F.rand()

def mat(rows, cols): return [[R() for _ in range(cols)] for _ in range(rows)]
def mul(A, B): return [[sum(A[i][k] * B[k][j] for k in range(len(B))) % F.P for j in range(len(B[0]))] for i in range(len(A))]
def col(A, j): return [A[i][j] for i in range(len(A))]

def quantities(Fs, m, q):
    cols = lambda A: [col(A, j) for j in range(m)]
    rkL = rank(F, cols(Fs[0]) + cols(Fs[1]) + cols(Fs[2]))
    comb = lambda g: [[(g[0] * a + g[1] * b + g[2] * c) % F.P for a, b, c in zip(r0, r1, r2)] for r0, r1, r2 in zip(*Fs)]
    rho = max(rank(F, cols(comb([R(), R(), R()]))) for _ in range(3))
    z = [0] * q
    neg = lambda v: [(-x) % F.P for x in v]
    Hc = []
    for j in range(m):
        Hc.append(col(Fs[1], j) + neg(col(Fs[0], j)) + z)
        Hc.append(col(Fs[2], j) + z + neg(col(Fs[0], j)))
        Hc.append(z + col(Fs[2], j) + neg(col(Fs[1], j)))
    rkH = rank(F, Hc)
    xi = [[R() for _ in range(3)] for _ in range(3)]
    Fp = [comb(x) for x in xi]
    ker = left_kernel(F, cols(Fp[0]))          # w with sum_j w_j col_j = 0
    img = [[sum(w[j] * Fp[a][i][j] for j in range(m)) % F.P for i in range(q)] for w in ker for a in (1, 2)]
    s = rank(F, img) if img else 0
    ok = rkH >= 2 * rho + s + (rkL - rho + 1) // 2
    return rkL, rho, rkH, s, ok

random.seed(3)
m, q = 4, 5
bad = 0
for trial in range(300):
    kind = trial % 4
    if kind == 0:
        Fs = [mat(q, m) for _ in range(3)]
    elif kind == 1:   # common 3-dim image
        B = mat(q, 3); Fs = [mul(B, mat(3, m)) for _ in range(3)]
    elif kind == 2:   # common kernel
        P = mat(3, m); Fs = [mul(mat(q, 3), P) for _ in range(3)]
    else:             # each of rank <= 3 with random structure: F_i = X_i Y_i, inner dim random 2..3
        k = random.choice([2, 3]); Fs = [mul(mat(q, k), mat(k, m)) for _ in range(3)]
    res = quantities(Fs, m, q)
    if not res[-1]:
        bad += 1
        print('VERLETZT', kind, res)
print('Verletzungen:', bad, 'von 300')
