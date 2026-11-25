"""Search monomial-curve models a_t = (s_t^e0..s_t^e3), b_t = (s_t^d0..s_t^d3), 25 distinct s_t,
for the four residual cases.  'No rank one in the kernel' holds exactly whenever e3 + d3 < 25:
(a_t.u)(b_t.w) = u(s_t) w(s_t) with u(s) = sum u_i s^{e_i}; vanishing at 25 points forces u(s)w(s) = 0."""
import itertools, random
from modelle import F, quantities, rho_exact_le3

random.seed(7)
us = [[F.rand() for _ in range(4)] for _ in range(4)]
pts = list(range(2, 27))
targets = {(3, 6), (4, 7), (5, 7), (5, 8)}
found = {}
exps = [e for e in itertools.combinations(range(0, 8), 4) if e[0] == 0]
for e in exps:
    for d in exps:
        if d < e:
            continue
        a = [[pow(s, x, F.P) for x in e] for s in pts]
        b = [[pow(s, x, F.P) for x in d] for s in pts]
        q = quantities(a, b, us)
        key = (q['rkL'], q['rkH'])
        if q['rho'] == 3 and key in targets and key not in found:
            if rho_exact_le3(a, b, us):
                found[key] = (e, d, q)
                print(key, 'a-Exponenten', e, 'b-Exponenten', d, q, flush=True)
    if len(found) == 4:
        break
print('gefunden:', sorted(found))
