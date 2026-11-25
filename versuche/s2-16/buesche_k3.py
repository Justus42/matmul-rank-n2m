"""S2-16: abstract triples for the sub-case dim K* = 3 of Lemma P:
F_3 has rank 1 with kernel K* = span(e0,e1,e2); (l1 F_1 + l2 F_2)|K* is the Kronecker block L_2
with image Q_2 = span(q1,q2); everything else random. Which (rho, rkL, rkH, s, dimN) occur?"""
import random, sys
sys.path.insert(0, '../s2-spurA-r2')
from buesche_test import rho, rkL, rkH, s_val, dimN, F, P, R
from collections import Counter

def make():
    Fs = []
    L2 = [ [[1,0,0],[0,1,0]], [[0,1,0],[0,0,1]] ]
    # random change of basis in Q (5x5) and K* (3x3) to avoid special coordinates is not needed for ranks
    for i in range(3):
        M = [[0] * 4 for _ in range(5)]
        for c in range(3):
            for r in range(5):
                if i < 2:
                    M[r][c] = L2[i][r][c] if r < 2 else 0
                else:
                    M[r][c] = 0
        for r in range(5):
            M[r][3] = R()
        Fs.append(M)
    return Fs

random.seed(17)
cnt = Counter()
for _ in range(300):
    Fs = make()
    cnt[(rho(Fs), rkL(Fs), rkH(Fs), s_val(Fs), dimN(Fs))] += 1
print('(rho, rkL, rkH, (s, dim ker), dimN):', dict(cnt))
