"""S2-09: search for a counterexample to Lemma V among monomial-curve models
a_t = (s^e0, s^e1, s^e2, s^e3), b_t = (s^f0, ..., s^f3), s_t = 2..26 (25 terms), exact in Z/(2^61-1).
Lemma V predicts: if rho = 3 (generic) and N != 0 (generic u_0), the data is symmetric
(G^T b_t parallel a_t with invertible G). Prints every model with rho = 3 and N != 0 and its symmetry status.
(Psi1, the nonsingularity, is not checked here; a hit would need that check before it counts.)
"""
import itertools
import random
from gf import PrimeField, P61, det, nullspace, rank
from pruefe import yang_data, symmetry_space, has_invertible, sum_

F = PrimeField(P61)
rng = random.Random(11)
S = list(range(2, 27))
exps = [e for e in itertools.combinations(range(0, 8), 4) if e[0] == 0]
count = hits = viol = 0
for ea in exps:
    for eb in exps:
        pts_a = [[pow(s, e, P61) for e in ea] for s in S]
        pts_b = [[pow(s, e, P61) for e in eb] for s in S]
        while True:
            Ub = [[F.rand(rng) for _ in range(4)] for _ in range(4)]
            if det(F, Ub) != 0:
                break
        a = [[sum_(F, [F.mul(pt[k], Ub[k][i]) for k in range(4)]) for i in range(4)] for pt in pts_a]
        if any(x[0] == 0 for x in a):
            continue
        d = yang_data(F, a, pts_b, rng, tries=2)
        count += 1
        if d['rho'] == 3 and d['dimN'] > 0:
            hits += 1
            sym = has_invertible(F, symmetry_space(F, a, pts_b), rng)
            if not sym:
                viol += 1
            print(ea, eb, d, 'symmetric' if sym else 'NOT SYMMETRIC')
print(f'models: {count}, with rho=3 and N!=0: {hits}, of these not symmetric: {viol}')
