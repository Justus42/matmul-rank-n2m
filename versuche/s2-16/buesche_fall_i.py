"""S2-16: abstract triples, pencil structure (Lemma P) + case (i) of the kernel of H':
F'_1 x = F'_2 x = 0 for one x in U/K*. Does (rho, rkL, rkH, s, dimN) = (3,5,8,1,0) occur?"""
import random, sys, io, contextlib
sys.path.insert(0, '../s2-spurA-r2')
with contextlib.redirect_stdout(io.StringIO()):
    from buesche_test import rho, rkL, rkH, s_val, dimN, F, P, R
from collections import Counter

random.seed(13)
cnt = Counter()
for _ in range(300):
    # U basis: e0,e1 (K*), e2 = x-lift, e3 = y-lift; Q basis: q=e0, then Q' = e1..e4
    lam = [[R(), R()], [R(), R()], [0, 0]]
    Fs = []
    for i in range(3):
        M = [[0] * 4 for _ in range(5)]
        M[0][0], M[0][1] = lam[i]
        for c in (2, 3):
            M[0][c] = R()
            for r in range(1, 5):
                M[r][c] = 0 if (c == 2 and i in (0, 1)) else R()
        Fs.append(M)
    cnt[(rho(Fs), rkL(Fs), rkH(Fs), s_val(Fs), dimN(Fs))] += 1
print('(rho, rkL, rkH, (s, dim ker), dimN):', dict(cnt))
