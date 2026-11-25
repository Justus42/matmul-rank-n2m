"""Abstract 'F-data' models for the four residual cases (rk L, rk H) with rho = 3, r = 25.

A model is: vectors a_t, b_t in K^4 (t = 1..25), generic u_0..u_3 in K^4.
  f_i(w) := (a_t.u_i * b_t.w)_t in K^25,  J := f_0(K^4),  F_i := f_i mod J.
This is exactly the shape of Yang's data for x in U (D(e_{i,0}) diagonal, f_i = P_i f_0).
We compute rk L, rho (max over gamma), rk H, and check:
  - Folgerung 7 on U: sum_i gamma_i f_i injective on K^4 for all gamma != 0, i.e. no rank-one matrix
    u w^T with (a_t.u)(b_t.w) = 0 for all t.  (Checked exactly, see no_rank_one().)
  - rho <= 3 exactly (all 4x4 minors of the 'mod J' matrix vanish as polynomials in gamma),
    checked by evaluation on a grid, see rho_exact().
Arithmetic: exact in Z/P, P = 2^61 - 1.
"""
import random, itertools
from felder import PrimeField, rank

F = PrimeField()


def moment(s):
    return [1, s % F.P, s * s % F.P, s * s * s % F.P]


def dot(x, y):
    return sum(a * b for a, b in zip(x, y)) % F.P


def fvecs(a, b, u):
    r = len(a)
    return [[a[t][0] * 0 + dot(a[t], u) * b[t][j] % F.P for t in range(r)] for j in range(4)]


def quantities(a, b, us):
    r = len(a)
    f = [fvecs(a, b, u) for u in us]
    J = f[0]
    assert rank(F, J) == 4
    rkL = rank(F, J + f[1] + f[2] + f[3]) - 4
    rho = 0
    for _ in range(3):
        g = [F.rand() for _ in range(3)]
        comb = [[(g[0] * x + g[1] * y + g[2] * z) % F.P for x, y, z in zip(f[1][j], f[2][j], f[3][j])] for j in range(4)]
        rho = max(rho, rank(F, J + comb) - 4)
    zero = [0] * r
    neg = lambda v: [(-x) % F.P for x in v]
    cols = []
    for j in range(4):
        cols.append(f[2][j] + neg(f[1][j]) + zero)
        cols.append(f[3][j] + zero + neg(f[1][j]))
        cols.append(zero + f[3][j] + neg(f[2][j]))
    J3 = [v + zero + zero for v in J] + [zero + v + zero for v in J] + [zero + zero + v for v in J]
    rkH = rank(F, J3 + cols) - 12
    S = rank(F, [[a[t][i] * b[t][j] % F.P for i in range(4) for j in range(4)] for t in range(r)])
    return dict(dimS=S, rkL=rkL, rho=rho, rkH=rkH)


def rho_exact_le3(a, b, us, grid=5):
    """rho <= 3 for ALL gamma in the algebraic closure: the 4x4 minors of the map w -> sum gamma_i f_i(w) mod J
    are polynomials of degree <= 4 in gamma; rank(J + comb) <= 7 for every gamma on a grid {0..grid-1}^3
    with grid >= 5 implies all those minors vanish identically (a nonzero polynomial of degree <= 4 in each
    variable cannot vanish on a 5x5x5 grid)."""
    f = [fvecs(a, b, u) for u in us]
    J = f[0]
    for g in itertools.product(range(grid), repeat=3):
        comb = [[(g[0] * x + g[1] * y + g[2] * z) % F.P for x, y, z in zip(f[1][j], f[2][j], f[3][j])] for j in range(4)]
        if rank(F, J + comb) > 7:
            return False
    return True


def symmetric_ok(a, b):
    """Sufficient exact criterion for 'no rank-one u w^T with (a_t.u)(b_t.w)=0 for all t':
    25 >= 7 of the a_t equal b_t on the moment curve with distinct parameters:
    then u(s_t) w(s_t) = 0 at >= 7 distinct points for polynomials of degree <= 3, so u w = 0."""
    pts = [t for t in range(len(a)) if a[t] == b[t] and a[t] == moment(a[t][1])]
    return len({a[t][1] for t in pts}) >= 7


if __name__ == '__main__':
    random.seed(5)
    us = [[F.rand() for _ in range(4)] for _ in range(4)]
    out = []
    # Model 1: all 25 on the moment curve, a_t = b_t
    s = list(range(2, 27))
    a = [moment(x) for x in s]
    b = [moment(x) for x in s]
    out.append(('M1: 25 Momentpunkte, a=b', a, b))
    # Model 2: 24 moment points + 1 random symmetric term a=b
    a2 = [moment(x) for x in s[:24]]
    v = [F.rand() for _ in range(4)]
    out.append(('M2: 24 Momentpunkte + 1 zufaelliges a=b', a2 + [v], a2 + [v]))
    # Model 3: 23 moment points + 2 random symmetric terms
    a3 = [moment(x) for x in s[:23]]
    v1 = [F.rand() for _ in range(4)]
    v2 = [F.rand() for _ in range(4)]
    out.append(('M3: 23 Momentpunkte + 2 zufaellige a=b', a3 + [v1, v2], a3 + [v1, v2]))
    # Model 4: 23 moment points + 1 random a=b + 1 term with b = a on the curve but a different (non-symmetric)
    w1, w2 = [F.rand() for _ in range(4)], [F.rand() for _ in range(4)]
    out.append(('M4: 24 Momentpunkte + 1 zufaelliges Paar a!=b', a2 + [w1], a2 + [w2]))
    # Model 5: 22 moment points + 3 random symmetric
    a5 = [moment(x) for x in s[:22]]
    extra = [[F.rand() for _ in range(4)] for _ in range(3)]
    out.append(('M5: 22 Momentpunkte + 3 zufaellige a=b', a5 + extra, a5 + extra))
    for name, a, b in out:
        q = quantities(a, b, us)
        q['rho<=3 exakt'] = rho_exact_le3(a, b, us)
        q['kein Rang-1 im Kern'] = symmetric_ok(a, b)
        print(name, q)
