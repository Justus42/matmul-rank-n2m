"""S2-28: independent checks for Lemma Z (B-014) on minimal decompositions
of <2,2,2> (Strassen, rank 7) and <2,2,3> (rank 11), exact arithmetic in GF(P).
Format: A B = sum_t alpha_t(A) beta_t(B) C_t, a_t(p) = A_t p, b_t(p) = B_t^T J p.
Checks: (G) J_p = ker W at random p; classes of 'same point for all p' have size <= 2;
number of distinct points [a_t(p) (x) b_t(p)] at random p; projection of ker W
onto pairs of coordinates. Also random equivalent transforms (P,Q,R in GL)."""
import random
P = 2**31 - 1
random.seed(28)

def inv(x): return pow(x % P, P - 2, P)

def rank(rows):
    m = [list(r) for r in rows]; rk = 0
    ncol = len(m[0]) if m else 0
    for c in range(ncol):
        piv = next((i for i in range(rk, len(m)) if m[i][c] % P), None)
        if piv is None: continue
        m[rk], m[piv] = m[piv], m[rk]
        iv = inv(m[rk][c]); m[rk] = [x * iv % P for x in m[rk]]
        for i in range(len(m)):
            if i != rk and m[i][c] % P:
                f = m[i][c]; m[i] = [(x - f * y) % P for x, y in zip(m[i], m[rk])]
        rk += 1
    return rk

def kernel(rows, ncol):
    m = [list(r) for r in rows]; piv_cols = []; rk = 0
    for c in range(ncol):
        piv = next((i for i in range(rk, len(m)) if m[i][c] % P), None)
        if piv is None: continue
        m[rk], m[piv] = m[piv], m[rk]
        iv = inv(m[rk][c]); m[rk] = [x * iv % P for x in m[rk]]
        for i in range(len(m)):
            if i != rk and m[i][c] % P:
                f = m[i][c]; m[i] = [(x - f * y) % P for x, y in zip(m[i], m[rk])]
        piv_cols.append(c); rk += 1
    free = [c for c in range(ncol) if c not in piv_cols]
    basis = []
    for fc in free:
        v = [0] * ncol; v[fc] = 1
        for i, pc in enumerate(piv_cols): v[pc] = (-m[i][fc]) % P
        basis.append(v)
    return basis

def matmul(X, Y):
    return [[sum(X[i][k] * Y[k][j] for k in range(len(Y))) % P for j in range(len(Y[0]))] for i in range(len(X))]
def T(X): return [list(r) for r in zip(*X)]
def E(n, m, i, j):
    M = [[0] * m for _ in range(n)]; M[i][j] = 1; return M
def lin(*pairs):
    n, m = len(pairs[0][1]), len(pairs[0][1][0])
    M = [[0] * m for _ in range(n)]
    for c, X in pairs:
        for i in range(n):
            for j in range(m): M[i][j] = (M[i][j] + c * X[i][j]) % P
    return M

def strassen():
    e = lambda i, j: E(2, 2, i, j)
    terms = [
        (lin((1, e(0, 0)), (1, e(1, 1))), lin((1, e(0, 0)), (1, e(1, 1))), lin((1, e(0, 0)), (1, e(1, 1)))),
        (lin((1, e(1, 0)), (1, e(1, 1))), e(0, 0), lin((1, e(1, 0)), (-1, e(1, 1)))),
        (e(0, 0), lin((1, e(0, 1)), (-1, e(1, 1))), lin((1, e(0, 1)), (1, e(1, 1)))),
        (e(1, 1), lin((1, e(1, 0)), (-1, e(0, 0))), lin((1, e(0, 0)), (1, e(1, 0)))),
        (lin((1, e(0, 0)), (1, e(0, 1))), e(1, 1), lin((-1, e(0, 0)), (1, e(0, 1)))),
        (lin((1, e(1, 0)), (-1, e(0, 0))), lin((1, e(0, 0)), (1, e(0, 1))), e(1, 1)),
        (lin((1, e(0, 1)), (-1, e(1, 1))), lin((1, e(1, 0)), (1, e(1, 1))), e(0, 0)),
    ]
    return 2, 2, terms

def s223():
    n, m = 2, 3
    terms = []
    for A, B, C in strassen()[2]:
        B3 = [B[0] + [0], B[1] + [0]]; C3 = [C[0] + [0], C[1] + [0]]
        terms.append((A, B3, C3))
    for i in range(2):
        for k in range(2):
            terms.append((E(2, 2, i, k), E(2, 3, k, 2), E(2, 3, i, 2)))
    return n, m, terms

def check_decomp(n, m, terms, trials=3):
    for _ in range(trials):
        A = [[random.randrange(P) for _ in range(2)] for _ in range(n)]
        B = [[random.randrange(P) for _ in range(m)] for _ in range(2)]
        lhs = matmul(A, B)
        rhs = [[0] * m for _ in range(n)]
        for At, Bt, Ct in terms:
            al = sum(At[i][k] * A[i][k] for i in range(n) for k in range(2)) % P
            be = sum(Bt[k][j] * B[k][j] for k in range(2) for j in range(m)) % P
            for i in range(n):
                for j in range(m): rhs[i][j] = (rhs[i][j] + al * be * Ct[i][j]) % P
        if lhs != rhs: return False
    return True

def transform(n, m, terms):
    """random equivalent decomposition: A -> X A Y, B -> Y^{-1} B Z, C -> X C Z."""
    def rnd_inv(k):
        while True:
            M = [[random.randrange(P) for _ in range(k)] for _ in range(k)]
            if rank(M) == k: return M
    def inverse(M):
        k = len(M); aug = [M[i] + [1 if i == j else 0 for j in range(k)] for i in range(k)]
        for c in range(k):
            piv = next(i for i in range(c, k) if aug[i][c]); aug[c], aug[piv] = aug[piv], aug[c]
            iv = inv(aug[c][c]); aug[c] = [x * iv % P for x in aug[c]]
            for i in range(k):
                if i != c and aug[i][c]:
                    f = aug[i][c]; aug[i] = [(x - f * y) % P for x, y in zip(aug[i], aug[c])]
        return [r[k:] for r in aug]
    X, Y, Z = rnd_inv(n), rnd_inv(2), rnd_inv(m)
    Xi, Yi, Zi = inverse(X), inverse(Y), inverse(Z)
    out = []
    for At, Bt, Ct in terms:
        # A B = Xi (A' B') Zi with A = Xi A' Y, B = Yi B' Zi  ->  A'B' = X (AB) Z
        # alpha_t(A) = <A_t, Xi A' Y> = <Xi^T A_t Y^T, A'>
        At2 = matmul(matmul(T(Xi), At), T(Y))
        # beta_t(B) = <B_t, Yi B' Zi> = <Yi^T B_t Zi^T, B'>
        Bt2 = matmul(matmul(T(Yi), Bt), T(Zi))
        Ct2 = matmul(matmul(X, Ct), Z)
        out.append((At2, Bt2, Ct2))
    return out

J = [[0, P - 1], [1, 0]]

def points(n, m, terms, p):
    res = []
    for At, Bt, _ in terms:
        a = [sum(At[i][k] * p[k] for k in range(2)) % P for i in range(n)]
        Jp = [sum(J[k][l] * p[l] for l in range(2)) % P for k in range(2)]
        b = [sum(Bt[k][j] * Jp[k] for k in range(2)) % P for j in range(m)]
        res.append((a, b))
    return res

def tensor(a, b): return [x * y % P for x in a for y in b]

def normalize(v):
    i = next(i for i, x in enumerate(v) if x); f = inv(v[i]); return tuple(x * f % P for x in v)

def analyse(name, n, m, terms):
    r = len(terms)
    assert check_decomp(n, m, terms), name
    Wrows = [[terms[t][2][i][j] for t in range(r)] for i in range(n) for j in range(m)]
    kerW = kernel(Wrows, r)
    out = [f"== {name}: n={n}, m={m}, r={r}, dim ker W = {len(kerW)}"]
    # (G)
    gs = []
    for _ in range(3):
        p = [random.randrange(P), random.randrange(P)]
        pts = points(n, m, terms, p)
        Jrows = [[pts[t][0][i] * pts[t][1][j] % P for t in range(r)] for i in range(n) for j in range(m)]
        dJ = rank(Jrows); dsum = rank(Jrows + kerW)
        gs.append((dJ, dsum))
    out.append(f"   dim J_p, dim(J_p + ker W) at 3 random p: {gs}  -> (G) holds: {all(a == len(kerW) == b for a, b in gs)}")
    # classes (same projective point at 3 random p)
    ps = [[random.randrange(P), random.randrange(P)] for _ in range(3)]
    ptsl = [points(n, m, terms, p) for p in ps]
    keys = [tuple(normalize(tensor(*ptsl[k][t])) for k in range(3)) for t in range(r)]
    classes = {}
    for t, kk in enumerate(keys): classes.setdefault(kk, []).append(t)
    sizes = sorted(len(c) for c in classes.values())
    out.append(f"   class sizes: {sizes}, number of classes = {len(classes)}, Lemma Z bound ceil(r/2) = {(r + 1) // 2}")
    distinct = len({normalize(tensor(*pt)) for pt in ptsl[0]})
    out.append(f"   distinct points at random p: {distinct}")
    # projection of ker W onto pairs
    proj1 = [(s, t) for s in range(r) for t in range(s + 1, r) if rank([[v[s], v[t]] for v in kerW]) <= 1]
    out.append(f"   pairs (s,t) with dim pr_(s,t)(ker W) <= 1: {proj1}")
    for c in classes.values():
        if len(c) >= 2:
            s, t = c[0], c[1]
            out.append(f"   class {c}: ranks A = {[rank(terms[x][0]) for x in c]}, B = {[rank(terms[x][1]) for x in c]}")
    return out

lines = []
for name, (n, m, terms) in [("Strassen <2,2,2>", strassen()), ("Strassen+4 <2,2,3>", s223())]:
    lines += analyse(name, n, m, terms)
    for k in range(3):
        lines += analyse(f"{name}, random equivalent #{k+1}", n, m, transform(n, m, terms))
# negative control: non-minimal decomposition (duplicate a term with C split) -> class of size 2 of type (i)
n, m, terms = strassen()
At, Bt, Ct = terms[0]
half = inv(2)
dup = [(At, Bt, [[x * half % P for x in r] for r in Ct]), (At, Bt, [[x * half % P for x in r] for r in Ct])] + terms[1:]
lines += analyse("negative control: Strassen with term 1 split (r=8, not minimal)", n, m, dup)
print("\n".join(lines))
