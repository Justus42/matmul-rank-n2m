"""S2-16: abstract triples F_1,F_2,F_3 : K^4 -> K^5 with the pencil structure of Lemma P:
K* = span(e0,e1), F_i(K*) in K q (q = e0 of Q), F_3(K*) = 0.  Otherwise random (exact, Z/P).
Report rho, rk L, rk H, s (generic) and dim N."""
import random, sys
sys.path.insert(0, '../s2-spurA-r2')
from felder import PrimeField, rank
F = PrimeField()
P = F.P
R = lambda: random.randrange(P)

def mat(rows, cols, f): return [[f(i, j) for j in range(cols)] for i in range(rows)]

def make(variant):
    Fs = []
    for i in range(3):
        M = mat(5, 4, lambda r, c: R())   # M[r][c]: Q-row r, U-col c
        for c in (0, 1):                  # K* = span(e0,e1)
            for r in range(5):
                if r != 0: M[r][c] = 0      # image in K q, q = e_0
            if i == 2: M[0][c] = 0          # F_3(K*) = 0
        if variant == 'rk2':
            pass
        Fs.append(M)
    return Fs

def comb(Fs, g):
    return [[sum(g[i] * Fs[i][r][c] for i in range(3)) % P for c in range(4)] for r in range(5)]

def rkL(Fs):
    # L : U^3 -> Q, matrix 5 x 12
    return rank(F, [[Fs[i][r][c] for i in range(3) for c in range(4)] for r in range(5)])

def rkH(Fs):
    # H : U^{wedge 3} -> Q^3 ; c = (c12, c13, c23) in U^3 ; H(c) = (F2 c12 + F3 c13, -F1 c12 + F3 c23, -F1 c13 - F2 c23)
    cols = []
    for blk in range(3):
        for c in range(4):
            x = [0] * 4; x[c] = 1
            col = [0] * 15
            def add(comp, Fi, sgn):
                for r in range(5):
                    col[5 * comp + r] = (col[5 * comp + r] + sgn * Fs[Fi][r][c]) % P
            if blk == 0:   # c12
                add(0, 1, 1); add(1, 0, -1)
            elif blk == 1: # c13
                add(0, 2, 1); add(2, 0, -1)
            else:          # c23
                add(1, 2, 1); add(2, 1, -1)
            cols.append(col)
    return rank(F, cols)

def rho(Fs):
    return max(rank(F, comb(Fs, [R(), R(), R()])) for _ in range(3))

def s_val(Fs):
    g = [R(), R(), R()]
    M = comb(Fs, g)
    # kernel vector of M (5x4) of rank 3
    from felder import left_kernel
    MT = [list(col) for col in zip(*M)]  # 4 x 5 ; left kernel of M^T? we need right kernel of M: vectors k with M k = 0
    ker = left_kernel(F, [list(r) for r in zip(*M)])  # left kernel of M^T (4x5 rows)?? -> vectors y with sum y_c M^T[c] = 0 = M y
    k = ker[0]
    imgs = [[sum(Fs[i][r][c] * k[c] for c in range(4)) % P for r in range(5)] for i in range(3)]
    return rank(F, imgs), len(ker)

def dimN(Fs):
    rows = [[Fs[i][r][c] for c in range(4)] for i in range(3) for r in range(5)]
    return 4 - rank(F, rows)

if __name__ == "__main__":
    random.seed(7)
    from collections import Counter
    cnt = Counter()
    for _ in range(200):
        Fs = make('x')
        cnt[(rho(Fs), rkL(Fs), rkH(Fs), s_val(Fs), dimN(Fs))] += 1
    print('(rho, rkL, rkH, (s, dim ker), dimN):', dict(cnt))
