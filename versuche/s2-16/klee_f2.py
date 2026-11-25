"""S2-16: check identity (Kl) exactly in GF(2^31) on the 14 symmetric rank-26 schemes over F2 (rho = 3).
(Kl): sum_t delta_t (a_t.u)(a_t.w) C_t = omega(p,d) (u w^T + w u^T) M   with M b_t(p) = mu_t(p) a_t(p),
p = (1, s), d = (0, 1), delta_t = d mu_t/ds; derivative via dual numbers (x + y eps, eps^2 = 0).
Also reports dim span{a_t (x) a_t} (must be 10 for a symmetric scheme by Satz C)."""
import sys, random
sys.path.insert(0, '../s2-spurA-r2')
from felder import GF2k, rank, left_kernel
from yang_groessen import load_f2, verify

F = GF2k()
mul, add, inv = F.mul, F.add, F.inv

def dmul(x, y): return (mul(x[0], y[0]), add(mul(x[0], y[1]), mul(x[1], y[0])))
def dadd(x, y): return (add(x[0], y[0]), add(x[1], y[1]))
def dinv(x):
    i = inv(x[0]); return (i, mul(mul(i, i), x[1]))  # char 2: -x1/x0^2 = x1/x0^2

random.seed(3)
schemes = load_f2('../s2-spurA-r2/daten/rho3_rang26_f2.txt')
for k, terms in enumerate(schemes):
    s0 = F.rand()
    p = [(1, 0), (s0, 1)]            # dual numbers: p = (1, s0 + eps)
    Jp = [p[1], p[0]]                 # J = [[0,1],[1,0]]
    a = [[ (lambda r: dadd(dmul((F.from_int(r[0]),0), p[0]), dmul((F.from_int(r[1]),0), p[1])))(A[i]) for i in range(4)] for A, _, _ in terms]
    b = [[ dadd(dmul((F.from_int(B[0][j]),0), Jp[0]), dmul((F.from_int(B[1][j]),0), Jp[1])) for j in range(4)] for _, B, _ in terms]
    # solve M (4x4, over the field at eps=0) with M b_t ∥ a_t: unknowns M (16) and mu_t
    r = len(terms)
    rows = []
    for t in range(r):
        for i in range(4):
            row = [0] * (16 + r)
            for j in range(4):
                row[4 * i + j] = b[t][j][0]
            row[16 + t] = a[t][i][0]
            rows.append(row)
    sol = left_kernel(F, [list(c) for c in zip(*rows)])
    assert len(sol) == 1
    M = [sol[0][4 * i:4 * i + 4] for i in range(4)]
    # G constant (checked in gp_abh.py), so M is valid for all p: mu_t(p) = (M b_t(p))_i / a_t(p)_i as dual number
    mu = []
    for t in range(r):
        Mb = [ (lambda i: (lambda acc: acc)( __import__('functools').reduce(dadd, [dmul((M[i][j],0), b[t][j]) for j in range(4)], (0,0)) ))(i) for i in range(4)]
        i0 = next(i for i in range(4) if a[t][i][0])
        m = dmul(Mb[i0], dinv(a[t][i0]))
        # check parallel to first order
        for i in range(4):
            assert dmul(m, a[t][i]) == Mb[i], 'not parallel to first order'
        mu.append(m)
    delta = [m[1] for m in mu]
    a0 = [[x[0] for x in at] for at in a]
    C = [[[F.from_int(x) for x in row] for row in Ct] for _, _, Ct in terms]
    ok = True
    for i in range(4):
        for j in range(4):
            lhs = [[0] * 4 for _ in range(4)]
            for t in range(r):
                c = mul(delta[t], mul(a0[t][i], a0[t][j]))
                if c:
                    for x in range(4):
                        for y in range(4):
                            lhs[x][y] = add(lhs[x][y], mul(c, C[t][x][y]))
            # rhs = (e_i e_j^T + e_j e_i^T) M, omega = p0 d1 + p1 d0 = 1
            rhs = [[0] * 4 for _ in range(4)]
            for y in range(4):
                rhs[i][y] = add(rhs[i][y], M[j][y])
                rhs[j][y] = add(rhs[j][y], M[i][y])
            ok &= (lhs == rhs)
    dimaa = rank(F, [[mul(a0[t][x], a0[t][y]) for x in range(4) for y in range(x, 4)] for t in range(r)])
    print(k + 1, 'identity (Kl):', ok, ' nonconstant mu_t:', sum(1 for d in delta if d), ' dim span a_t(x)a_t:', dimaa)
