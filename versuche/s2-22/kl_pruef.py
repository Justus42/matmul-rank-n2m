"""S2-22 (reviewer, independent code): exact check of identity (Kl) and of the
quadric step of Satz C (B-012) on symmetric decompositions of <n,2,n>.

No code from versuche/s2-16 is used. Exact arithmetic only:
  * GF(P), P = 2^61 - 1 (characteristic != 2, checks signs)
  * GF(2^31) = GF(2)[x]/(x^31 + x^3 + 1) (characteristic 2)
Derivatives are taken with dual numbers a + b*eps, eps^2 = 0.

For a decomposition (A_t, B_t, C_t) with A*B = sum_t alpha_t(A) beta_t(B) C_t,
alpha_t(A) = sum A_t[i,k] A[i,k], beta_t(B) = sum B_t[k,j] B[k,j]:
  a_t(p) = A_t p,  b_t(p) = B_t^T J p,  J = [[0,-1],[1,0]],  omega(p,q) = p^T J q.
"""
import json, random, sys

# ---------------------------------------------------------------- fields
class GFp:
    P = (1 << 61) - 1
    def __init__(s, v): s.v = v % GFp.P
    def __add__(s, o): return GFp(s.v + o.v)
    def __sub__(s, o): return GFp(s.v - o.v)
    def __mul__(s, o): return GFp(s.v * o.v)
    def __neg__(s): return GFp(-s.v)
    def inv(s):
        assert s.v
        return GFp(pow(s.v, GFp.P - 2, GFp.P))
    def iszero(s): return s.v == 0
    def __eq__(s, o): return s.v == o.v
    @staticmethod
    def rand(): return GFp(random.randrange(GFp.P))
    @staticmethod
    def of_int(n): return GFp(n)
    def __repr__(s): return str(s.v)

MOD31 = (1 << 31) | (1 << 3) | 1
def _clmul(a, b):
    r = 0
    while b:
        if b & 1: r ^= a
        a <<= 1; b >>= 1
    return r
def _red(a):
    for i in range(a.bit_length() - 1, 30, -1):
        if a >> i & 1: a ^= MOD31 << (i - 31)
    return a
class GF2k:
    def __init__(s, v): s.v = v
    def __add__(s, o): return GF2k(s.v ^ o.v)
    __sub__ = __add__
    def __neg__(s): return s
    def __mul__(s, o): return GF2k(_red(_clmul(s.v, o.v)))
    def inv(s):
        assert s.v
        r, b, e = GF2k(1), s, (1 << 31) - 2
        while e:
            if e & 1: r = r * b
            b = b * b; e >>= 1
        return r
    def iszero(s): return s.v == 0
    def __eq__(s, o): return s.v == o.v
    @staticmethod
    def rand(): return GF2k(random.randrange(1 << 31))
    @staticmethod
    def of_int(n): return GF2k(n & 1)
    def __repr__(s): return hex(s.v)

def check_gf2k_irreducible():
    # x^(2^31) == x mod f and f has no root in GF(2) => f irreducible (31 prime)
    x = GF2k(2); y = x
    for _ in range(31): y = y * y
    return y == x and (MOD31 & 1) == 1 and bin(MOD31).count("1") % 2 == 1

class Dual:
    """a + b eps over a base field F."""
    def __init__(s, a, b): s.a, s.b = a, b
    def __add__(s, o): return Dual(s.a + o.a, s.b + o.b)
    def __sub__(s, o): return Dual(s.a - o.a, s.b - o.b)
    def __mul__(s, o): return Dual(s.a * o.a, s.a * o.b + s.b * o.a)
    def inv(s):
        ia = s.a.inv()
        return Dual(ia, -(s.b * ia * ia))

# ---------------------------------------------------------------- linear algebra
def rref_kernel(rows, ncols, F):
    """Kernel basis of the matrix given by rows (lists of F)."""
    M = [r[:] for r in rows]
    piv = []; r = 0
    for c in range(ncols):
        pr = next((i for i in range(r, len(M)) if not M[i][c].iszero()), None)
        if pr is None: continue
        M[r], M[pr] = M[pr], M[r]
        iv = M[r][c].inv(); M[r] = [x * iv for x in M[r]]
        for i in range(len(M)):
            if i != r and not M[i][c].iszero():
                f = M[i][c]; M[i] = [x - f * y for x, y in zip(M[i], M[r])]
        piv.append(c); r += 1
        if r == len(M): break
    free = [c for c in range(ncols) if c not in piv]
    basis = []
    for fc in free:
        v = [F.of_int(0)] * ncols; v[fc] = F.of_int(1)
        for i, pc in enumerate(piv): v[pc] = -M[i][fc]
        basis.append(v)
    return basis, M[:r], piv

def rank(rows, ncols, F):
    return ncols - len(rref_kernel(rows, ncols, F)[0]) if rows else 0

def solve(rows, rhs, ncols, F):
    """One solution x of rows*x = rhs, or None."""
    aug = [r + [b] for r, b in zip(rows, rhs)]
    _, R, piv = rref_kernel(aug, ncols + 1, F)
    if ncols in piv: return None
    x = [F.of_int(0)] * ncols
    for i, pc in enumerate(piv): x[pc] = R[i][ncols]
    return x

def det(Mat, F):
    M = [r[:] for r in Mat]; n = len(M); d = F.of_int(1)
    for c in range(n):
        pr = next((i for i in range(c, n) if not M[i][c].iszero()), None)
        if pr is None: return F.of_int(0)
        if pr != c: M[c], M[pr] = M[pr], M[c]; d = -d
        d = d * M[c][c]; iv = M[c][c].inv()
        for i in range(c + 1, n):
            f = M[i][c] * iv; M[i] = [x - f * y for x, y in zip(M[i], M[c])]
    return d

# ---------------------------------------------------------------- data
def load_json(path):
    d = json.load(open(path))
    n, m = d["n"], d["m"]
    alg = []
    for pr in d["products"]:
        A = [[int(x) for x in row] for row in pr["u"]]
        B = [[int(x) for x in row] for row in pr["v"]]
        C = [[int(x) for x in row] for row in pr["w"]]
        alg.append((A, B, C))
    return n, m, alg

def load_f2_lines(path):
    algs = []
    for line in open(path):
        if line.startswith("#") or not line.strip(): continue
        tok = [int(x, 16) for x in line.split()]
        alg = []
        for t in range(0, len(tok), 3):
            a, b, c = tok[t:t + 3]
            A = [[(a >> (i * 2 + k)) & 1 for k in range(2)] for i in range(4)]
            B = [[(b >> (k * 4 + j)) & 1 for j in range(4)] for k in range(2)]
            C = [[(c >> (i * 4 + j)) & 1 for j in range(4)] for i in range(4)]
            alg.append((A, B, C))
        algs.append(alg)
    return algs

STRASSEN = [  # Strassen 1969, A*B = C, products in the form alpha(A) beta(B) C_t
    ([[1, 0], [0, 1]], [[1, 0], [0, 1]], [[1, 0], [0, 1]]),
    ([[0, 0], [1, 1]], [[1, 0], [0, 0]], [[0, 0], [1, -1]]),
    ([[1, 0], [0, 0]], [[0, 1], [0, -1]], [[0, 1], [0, 1]]),
    ([[0, 0], [0, 1]], [[-1, 0], [1, 0]], [[1, 0], [1, 0]]),
    ([[1, 1], [0, 0]], [[0, 0], [0, 1]], [[-1, 1], [0, 0]]),
    ([[-1, 0], [1, 0]], [[1, 1], [0, 0]], [[0, 0], [0, 1]]),
    ([[0, 1], [0, -1]], [[0, 0], [1, 1]], [[1, 0], [0, 0]]),
]

def brent_ok(alg, n, m, F):
    """Exact check of the Brent equations over F."""
    for i in range(n):
        for k in range(2):
            for k2 in range(2):
                for j in range(m):
                    for i2 in range(n):
                        for j2 in range(m):
                            s = F.of_int(0)
                            for A, B, C in alg:
                                s = s + F.of_int(A[i][k]) * F.of_int(B[k2][j]) * F.of_int(C[i2][j2])
                            want = F.of_int(1 if (k == k2 and i == i2 and j == j2) else 0)
                            if not s == want: return False
    return True

# ---------------------------------------------------------------- the check
def vec_a(A, p, F): return [F.of_int(A[i][0]) * p[0] + F.of_int(A[i][1]) * p[1] for i in range(len(A))]
def vec_b(B, p, F):
    Jp = [-p[1], p[0]]  # J p
    return [F.of_int(B[0][j]) * Jp[0] + F.of_int(B[1][j]) * Jp[1] for j in range(len(B[0]))]

def sym_constraints(alg, p, F, n):
    """Rows of the linear system in vec(M) (n x n, row-major) for M b_t in K a_t."""
    rows = []
    for A, B, _ in alg:
        a, b = vec_a(A, p, F), vec_b(B, p, F)
        for i in range(n):
            for j in range(i + 1, n):
                # (M b)_i a_j - (M b)_j a_i = 0
                r = [F.of_int(0)] * (n * n)
                for l in range(n):
                    r[i * n + l] = r[i * n + l] + b[l] * a[j]
                    r[j * n + l] = r[j * n + l] - b[l] * a[i]
                rows.append(r)
    return rows

def check(alg, n, F, label, out):
    zero = F.of_int(0)
    r = len(alg)
    # generic p, d
    p = [F.rand(), F.rand()]; d = [F.rand(), F.rand()]
    om = p[1] * d[0] - p[0] * d[1]   # omega(p, d) = p^T J d, J d = (-d_1, d_0)
    rows0 = sym_constraints(alg, p, F, n)
    ker0, _, _ = rref_kernel(rows0, n * n, F)
    k = len(ker0)
    res = {"label": label, "r": r, "dim_sol": k}
    if k == 0:
        res["symmetric"] = False; out.append(res); return res
    c = [F.rand() for _ in range(k)]
    M0 = [sum((ci * v[idx] for ci, v in zip(c, ker0)), zero) for idx in range(n * n)]
    Mm = [M0[i * n:(i + 1) * n] for i in range(n)]
    if det(Mm, F).iszero():
        res["symmetric"] = False; out.append(res); return res
    res["symmetric"] = True
    # first order: L(p+eps d) (M0 + eps M1) = 0  <=>  L0 M1 = -L1 M0
    # L is linear in p, so L1 = L(d)-part: rows(p+d) - rows(p) gives L(d) since rows are bilinear?
    # rows are quadratic in p (a_t and b_t both linear), so compute L1 by dual numbers.
    pd = [Dual(p[0], d[0]), Dual(p[1], d[1])]
    rowsD = []
    for A, B, _ in alg:
        a = [Dual(F.of_int(A[i][0]), zero) * pd[0] + Dual(F.of_int(A[i][1]), zero) * pd[1] for i in range(n)]
        Jp = [Dual(-pd[1].a, -pd[1].b), pd[0]]
        b = [Dual(F.of_int(B[0][j]), zero) * Jp[0] + Dual(F.of_int(B[1][j]), zero) * Jp[1] for j in range(n)]
        for i in range(n):
            for j in range(i + 1, n):
                rr = [Dual(zero, zero)] * (n * n)
                for l in range(n):
                    rr[i * n + l] = rr[i * n + l] + b[l] * a[j]
                    rr[j * n + l] = rr[j * n + l] - b[l] * a[i]
                rowsD.append(rr)
    L1M0 = [sum((x.b * y for x, y in zip(rr, M0)), zero) for rr in rowsD]
    M1 = solve(rows0, [-x for x in L1M0], n * n, F)
    if M1 is None:
        res["first_order_solvable"] = False; out.append(res); return res
    res["first_order_solvable"] = True
    MD = [[Dual(M0[i * n + l], M1[i * n + l]) for l in range(n)] for i in range(n)]
    # mu_t and delta_t
    avs, deltas, mus = [], [], []
    for A, B, _ in alg:
        a = [Dual(F.of_int(A[i][0]), zero) * pd[0] + Dual(F.of_int(A[i][1]), zero) * pd[1] for i in range(n)]
        Jp = [Dual(-pd[1].a, -pd[1].b), pd[0]]
        b = [Dual(F.of_int(B[0][j]), zero) * Jp[0] + Dual(F.of_int(B[1][j]), zero) * Jp[1] for j in range(n)]
        Mb = [sum((MD[i][l] * b[l] for l in range(n)), Dual(zero, zero)) for i in range(n)]
        i0 = next(i for i in range(n) if not a[i].a.iszero())
        mu = Mb[i0] * a[i0].inv()
        # consistency: Mb == mu a exactly in dual numbers
        for i in range(n):
            e = Mb[i] - mu * a[i]
            assert e.a.iszero() and e.b.iszero(), "M b_t not proportional to a_t to first order"
        avs.append([x.a for x in a]); mus.append(mu.a); deltas.append(mu.b)
    res["mu_all_nonzero"] = all(not m_.iszero() for m_ in mus)
    res["delta_nonzero"] = sum(1 for x in deltas if not x.iszero())
    # (Kl): sum_t delta_t a_ti a_tj C_t == omega (E_ij + E_ji) M0, all i, j
    ok = True
    for i in range(n):
        for j in range(n):
            lhs = [[zero] * n for _ in range(n)]
            for (A, B, C), a, dl in zip(alg, avs, deltas):
                f = dl * a[i] * a[j]
                for x in range(n):
                    for y in range(n):
                        if C[x][y]: lhs[x][y] = lhs[x][y] + f * F.of_int(C[x][y])
            E = [[F.of_int(1 if (x, y) in ((i, j),) else 0) + F.of_int(1 if (x, y) == (j, i) else 0)
                  for y in range(n)] for x in range(n)]
            rhs = [[om * sum((E[x][z] * Mm[z][y] for z in range(n)), zero) for y in range(n)] for x in range(n)]
            if any(not (lhs[x][y] == rhs[x][y]) for x in range(n) for y in range(n)): ok = False
    res["Kl"] = ok
    # zero order: sum_t mu_t a_ti a_tj C_t == 0
    ok0 = True
    for i in range(n):
        for j in range(n):
            for x in range(n):
                for y in range(n):
                    s = zero
                    for (A, B, C), a, mu_ in zip(alg, avs, mus):
                        if C[x][y]: s = s + mu_ * a[i] * a[j] * F.of_int(C[x][y])
                    if not s.iszero(): ok0 = False
    res["order0"] = ok0
    # dimensions: span{a_t (x) a_t}, span{a_t (x) b_t}
    res["dim_aa"] = rank([[a[i] * a[j] for i in range(n) for j in range(n)] for a in avs], n * n, F)
    bvs = [vec_b(B, p, F) for _, B, _ in alg]
    res["dim_ab"] = rank([[a[i] * b[j] for i in range(n) for j in range(n)] for a, b in zip(avs, bvs)], n * n, F)
    res["bound_C'"] = n * (n + 1) // 2
    out.append(res)
    return res

def dim_ab_at(alg, n, p, F):
    avs = [vec_a(A, p, F) for A, _, _ in alg]; bvs = [vec_b(B, p, F) for _, B, _ in alg]
    return rank([[a[i] * b[j] for i in range(n) for j in range(n)] for a, b in zip(avs, bvs)], n * n, F)

if __name__ == "__main__":
    random.seed(2222)
    root = sys.argv[1] if len(sys.argv) > 1 else "../.."
    out = []
    print("GF(2^31) modulus irreducible:", check_gf2k_irreducible())
    # 1. Strassen over GF(2^61-1) and over GF(2^31)
    for F, nm in ((GFp, "GF(2^61-1)"), (GF2k, "GF(2^31)")):
        assert brent_ok(STRASSEN, 2, 2, F)
        for rep in range(3):
            print(nm, "Strassen", check(STRASSEN, 2, F, "Strassen", out))
    # 2. <4,2,4> rank 26 over Z (verfahren/4x2x4-r26-s001.json), over GF(2^61-1)
    n, m, alg = load_json(root + "/verfahren/4x2x4-r26-s001.json")
    assert brent_ok(alg, n, m, GFp)
    print("GF(2^61-1) s001", check(alg, 4, GFp, "s001", out))
    print("GF(2^31)   s001", check(alg, 4, GF2k, "s001", out))
    # 3. the 14 rank-26 schemes over GF(2) with rho = 3
    algs = load_f2_lines(root + "/versuche/s2-spurA-r2/daten/rho3_rang26_f2.txt")
    for idx, alg in enumerate(algs):
        assert brent_ok(alg, 4, 4, GF2k)
        print("GF(2^31) f2-%02d" % idx, check(alg, 4, GF2k, "f2-%d" % idx, out))
    # 4. jump of dim span{a_t(p) (x) b_t(p)} at special p (relevant for Folgerung C1)
    print("dim span{a_t(p) (x) b_t(p)}: generic p vs. the three GF(2)-rational points p")
    for idx, alg in enumerate(algs):
        gen = dim_ab_at(alg, 4, [GF2k.rand(), GF2k.rand()], GF2k)
        sp = []
        for x, y in ((1, 0), (0, 1), (1, 1)):
            q = [GF2k(x), GF2k(y)]
            nz = all(any(not v.iszero() for v in vec_a(A, q, GF2k)) and any(not v.iszero() for v in vec_b(B, q, GF2k))
                     for A, B, _ in alg)
            sp.append((dim_ab_at(alg, 4, q, GF2k), "a_t,b_t != 0" if nz else "some a_t or b_t = 0"))
        print("  f2-%02d generic %d, special %s" % (idx, gen, sp))
