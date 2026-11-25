"""S2-16: exact symbolic check (sympy, char 0) of identity (Kl) from the report:
  sum_t delta_t (a_t(p).u)(a_t(p).w) C_t = omega(p,d) (u w^T + w u^T) H_p^{-1}
for a decomposition of <n,2,n> that is symmetric in Yang's sense: G_p^T b_t(p) = mu_t(p) a_t(p).
p = (1, s), d = (0, 1) -> delta_t = d mu_t / ds, omega(p,d) = p^T J d.
Conventions: alpha_t(A)=<A_t,A>, beta_t(B)=<B_t,B>, a_t(p)=A_t p, b_t(p)=B_t^T J p, J=[[0,-1],[1,0]]."""
import sympy as sp
from itertools import product

s = sp.symbols('s')
J = sp.Matrix([[0, -1], [1, 0]])

def solve_C(AB, n, m):
    r = len(AB)
    # unknown C_t entries: r*n*m; equations: for (i,k,kk,j) sum_t A_t[i,k]B_t[kk,j] C_t = [k==kk] E_ij
    rows, rhs = [], []
    for i, k, kk, j in product(range(n), range(2), range(2), range(m)):
        coef = [AB[t][0][i, k] * AB[t][1][kk, j] for t in range(r)]
        for ii, jj in product(range(n), range(m)):
            row = [0] * (r * n * m)
            for t in range(r):
                row[t * n * m + ii * m + jj] = coef[t]
            rows.append(row)
            rhs.append(1 if (k == kk and i == ii and j == jj) else 0)
    M = sp.Matrix(rows); b = sp.Matrix(rhs)
    sol, params = M.gauss_jordan_solve(b)
    sol = sol.subs({p_: 0 for p_ in params})
    return [sp.Matrix(n, m, list(sol[t * n * m:(t + 1) * n * m])) for t in range(r)]

def analyse(T, n):
    p = sp.Matrix([1, s]); d = sp.Matrix([0, 1])
    a = [At * p for At, _, _ in T]
    b = [Bt.T * J * p for _, Bt, _ in T]
    # unknown G (n x n): G^T b_t parallel a_t  <=>  (G^T b_t) a_t^T symmetric ... use 2x2 minors of [G^T b_t, a_t]
    g = sp.symbols('g0:%d' % (n * n))
    G = sp.Matrix(n, n, g)
    eqs = []
    for t in range(len(T)):
        v = G.T * b[t]
        for i in range(n):
            for j in range(i + 1, n):
                eqs.append(sp.expand(v[i] * a[t][j] - v[j] * a[t][i]))
    Mx = sp.Matrix([[sp.diff(e, gi) for gi in g] for e in eqs])
    ns = Mx.nullspace(simplify=True)
    print('dim solution space for G over Q(s):', len(ns))
    if not ns:
        return
    Gp = sp.Matrix(n, n, list(sp.simplify(ns[0])))
    print('G_p =', Gp, ' det =', sp.factor(Gp.det()))
    mu = []
    for t in range(len(T)):
        v = Gp.T * b[t]
        i = next(i for i in range(n) if sp.simplify(a[t][i]) != 0)
        mu.append(sp.simplify(v[i] / a[t][i]))
        assert sp.simplify(v - mu[-1] * a[t]) == sp.zeros(n, 1)
    delta = [sp.diff(m_, s) for m_ in mu]
    H = (Gp.T).inv()
    om = (p.T * J * d)[0]
    ok = True
    for i, j in product(range(n), range(n)):
        u = sp.zeros(n, 1); u[i] = 1
        w = sp.zeros(n, 1); w[j] = 1
        lhs = sp.zeros(n, n)
        for t, (_, _, Ct) in enumerate(T):
            lhs += delta[t] * (a[t].dot(u)) * (a[t].dot(w)) * Ct
        rhs = om * (u * w.T + w * u.T) * H.inv()
        if sp.simplify(lhs - rhs) != sp.zeros(n, n):
            ok = False
            print('mismatch at', i, j, sp.simplify(lhs - rhs))
    print('identity (Kl) holds:', ok)
    # also the zero-order identity sum mu_t a a^T C = 0
    z = True
    for i, j in product(range(n), range(n)):
        lhs = sp.zeros(n, n)
        for t, (_, _, Ct) in enumerate(T):
            lhs += mu[t] * a[t][i] * a[t][j] * Ct
        z &= sp.simplify(lhs) == sp.zeros(n, n)
    print('order-0 identity holds:', z)
    print('dim span a_t a_t^T:', sp.Matrix([[sp.simplify(a[t][i] * a[t][j]) for i in range(n) for j in range(i, n)] for t in range(len(T))]).subs(s, sp.Rational(7, 3)).rank())

if __name__ == '__main__':
    E = lambda i, j: sp.Matrix(2, 2, lambda x, y: 1 if (x, y) == (i, j) else 0)
    A11, A12, A21, A22 = E(0, 0), E(0, 1), E(1, 0), E(1, 1)
    B11, B12, B21, B22 = A11, A12, A21, A22
    AB = [(A11 + A22, B11 + B22), (A21 + A22, B11), (A11, B12 - B22), (A22, B21 - B11),
          (A11 + A12, B22), (A21 - A11, B11 + B12), (A12 - A22, B21 + B22)]
    Cs = solve_C(AB, 2, 2)
    T = [(A, B, C) for (A, B), C in zip(AB, Cs)]
    print('Strassen C:', Cs)
    analyse(T, 2)
