"""S2-16: abstract triples with the pencil structure AND a kernel element of H' (see report, Satz D):
does (rho, rkL, rkH, s, dimN) = (3, 5, 8, 1, 0) occur? Exact arithmetic in Z/P."""
import random, sys
sys.path.insert(0, '../s2-spurA-r2')
from felder import PrimeField, rank
from buesche_test import rho, rkL, rkH, s_val, dimN, F, P, R
from collections import Counter

def solve2(Mcols, targets):
    # find 4x2 matrix X with X @ v_k = targets_k for basis v_1, v_2 (columns of Mcols, 2x2)
    (a, b), (c, d) = Mcols  # v1=(a,c)?? we pass v1, v2 as tuples
    raise NotImplementedError

def lin_map_from(v1, v2, t1, t2):
    # X (4x2) with X v1 = t1, X v2 = t2 ; v1, v2 in K^2
    det = (v1[0] * v2[1] - v1[1] * v2[0]) % P
    di = pow(det, P - 2, P)
    # inverse of V = [v1 v2] (columns): V^{-1} = 1/det [[v2[1], -v2[0]], [-v1[1], v1[0]]]
    Vi = [[v2[1] * di % P, (-v2[0]) * di % P], [(-v1[1]) * di % P, v1[0] * di % P]]
    T = [[t1[r], t2[r]] for r in range(4)]
    return [[(T[r][0] * Vi[0][j] + T[r][1] * Vi[1][j]) % P for j in range(2)] for r in range(4)]

def mv(X, v): return [sum(X[r][j] * v[j] for j in range(len(v))) % P for r in range(len(X))]

random.seed(11)
cnt = Counter()
for _ in range(200):
    c12, c13, c23 = [R(), R()], [R(), R()], [R(), R()]
    F1 = [[R(), R()] for _ in range(4)]
    w = [R(), R()]
    # F2: F2 c23 = -F1 c13, F2 w random
    t = mv(F1, c13)
    F2 = lin_map_from(c23, w, [(-x) % P for x in t], [R() for _ in range(4)])
    # F3: F3 c13 = -F2 c12, F3 c23 = F1 c12
    F3 = lin_map_from(c13, c23, [(-x) % P for x in mv(F2, c12)], mv(F1, c12))
    Fp = [F1, F2, F3]
    lam = [[R(), R()], [R(), R()], [0, 0]]
    Fs = []
    for i in range(3):
        M = [[0] * 4 for _ in range(5)]
        M[0][0], M[0][1] = lam[i]
        for c in (2, 3):
            M[0][c] = R()
            for r in range(4):
                M[1 + r][c] = Fp[i][r][c - 2]
        Fs.append(M)
    cnt[(rho(Fs), rkL(Fs), rkH(Fs), s_val(Fs), dimN(Fs))] += 1
print('(rho, rkL, rkH, (s, dim ker), dimN):', dict(cnt))
