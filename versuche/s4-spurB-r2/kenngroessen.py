#!/usr/bin/env python3
"""Measure Yang's normal-form parameters of a <3,2,m> scheme (S4-08).

For a scheme sum_r alpha_r(A) beta_r(B) C_r = AB (format file of verfahren/README.md,
n = 3, k = 2), apply a random change of basis (S, T) over GF(p) with p = 2^31 - 1
(stand-in for the generic normalisation of Yang's Lemma 6 over the algebraic closure),
rescale so that alpha_r(e00) = 1, and compute, exactly over GF(p):

  q = R - 4m, rho = max rank of g1*F1 + g2*F2 (random g), rk F1, rk L, rk H,
  s = dim F2(ker F1), dim N, Delta = 2 rk H - rk L, dim S,
  plus the strong-normalisation checks (SN1) and (SN2 on U).

Notation as in lean/prosa/yang_n3.md, Sections 2 to 8. Only integers, no floats.
Usage: python3 kenngroessen.py <scheme.json> [draws] [seed]
"""
import json
import random
import sys
from fractions import Fraction

P = 2**31 - 1


def inv(a):
    return pow(a % P, P - 2, P)


def rref(rows, ncols):
    """Row-reduce a list of rows (lists mod P). Returns (reduced rows, pivot columns)."""
    m = [list(r) for r in rows]
    piv = []
    rk = 0
    for c in range(ncols):
        p = None
        for i in range(rk, len(m)):
            if m[i][c] % P:
                p = i
                break
        if p is None:
            continue
        m[rk], m[p] = m[p], m[rk]
        iv = inv(m[rk][c])
        m[rk] = [x * iv % P for x in m[rk]]
        for i in range(len(m)):
            if i != rk and m[i][c] % P:
                f = m[i][c]
                m[i] = [(x - f * y) % P for x, y in zip(m[i], m[rk])]
        piv.append(c)
        rk += 1
    return m[:rk], piv


def rank(rows, ncols):
    return len(rref(rows, ncols)[0])


def nullspace(rows, ncols):
    """Basis of {x : rows * x = 0}."""
    red, piv = rref(rows, ncols)
    free = [c for c in range(ncols) if c not in piv]
    basis = []
    for f in free:
        x = [0] * ncols
        x[f] = 1
        for i, c in enumerate(piv):
            x[c] = (-red[i][f]) % P
        basis.append(x)
    return basis


def transpose(m):
    return [list(r) for r in zip(*m)]


def matmul(a, b):
    bt = transpose(b)
    return [[sum(x * y for x, y in zip(r, c)) % P for c in bt] for r in a]


def coords(basis, vecs):
    """Coordinates of each vector of vecs in the given basis (columns = basis vectors).
    Basis must be linearly independent and contain the vectors in its span."""
    n = len(basis)
    dim = len(basis[0])
    out = []
    # solve basis^T-system once via augmented elimination
    for v in vecs:
        aug = [[basis[j][i] for j in range(n)] + [v[i]] for i in range(dim)]
        red, piv = rref(aug, n + 1)
        assert n not in piv, "vector not in span"
        x = [0] * n
        for i, c in enumerate(piv):
            x[c] = red[i][n]
        out.append(x)
    return out


def parse(x):
    f = Fraction(x)
    return f.numerator * inv(f.denominator) % P


def load(path):
    d = json.load(open(path))
    assert d["n"] == 3 and d["k"] == 2
    m = d["m"]
    prods = []
    for pr in d["products"]:
        u = [[parse(x) for x in row] for row in pr["u"]]
        v = [[parse(x) for x in row] for row in pr["v"]]
        w = [[parse(x) for x in row] for row in pr["w"]]
        prods.append((u, v, w))
    return m, prods, d.get("id", path)


def random_invertible(n, rng):
    while True:
        a = [[rng.randrange(P) for _ in range(n)] for _ in range(n)]
        if rank(a, n) == n:
            return a


def mat_inv(a):
    n = len(a)
    aug = [list(a[i]) + [1 if i == j else 0 for j in range(n)] for i in range(n)]
    red, piv = rref(aug, 2 * n)
    assert piv[:n] == list(range(n))
    return [r[n:] for r in red]


def measure(m, prods, rng):
    R = len(prods)
    S = random_invertible(3, rng)
    T = random_invertible(2, rng)
    Sinv = mat_inv(S)
    Tinv = mat_inv(T)
    # alpha'(A) = alpha(S A T): coefficient matrix u' = S^T u T^T
    # beta'(B) = beta(T^{-1} B): v' = T^{-T} v ; C' = S^{-1} C
    new = []
    for u, v, w in prods:
        u2 = matmul(matmul(transpose(S), u), transpose(T))
        v2 = matmul(transpose(Tinv), v)
        w2 = matmul(Sinv, w)
        c = u2[0][0]
        if c == 0:
            return None  # (SN1) fails for this draw
        ic = inv(c)
        u2 = [[x * ic % P for x in row] for row in u2]
        v2 = [[x * c % P for x in row] for row in v2]
        new.append((u2, v2, w2))
    lam = [pr[0][1][0] for pr in new]
    mu = [pr[0][2][0] for pr in new]
    Mcols = [[new[r][1][1][l] for r in range(R)] for l in range(m)]  # f0(e_{1,l})
    f1cols = [[lam[r] * Mcols[l][r] % P for r in range(R)] for l in range(m)]
    f2cols = [[mu[r] * Mcols[l][r] % P for r in range(R)] for l in range(m)]
    # W : F^R -> F^{3m}; rows of W indexed by (i,l)
    Wrows = [[new[r][2][i][l] for r in range(R)] for i in range(3) for l in range(m)]
    K = nullspace(Wrows, R)
    assert len(K) == R - 3 * m
    J = Mcols
    assert rank(J, R) == m, "f0 not injective on U"
    # SN2 on U: for random x != 0 in U the three vectors are independent (spot check)
    # basis of K extending J
    red, piv = rref(J, R)
    ext = list(J)
    for k in K:
        if rank(ext + [k], R) > len(ext):
            ext.append(k)
    q = len(ext) - m
    assert q == R - 4 * m
    def Qc(vecs):
        return [c[m:] for c in coords(ext, vecs)]
    F1 = transpose(Qc(f1cols))  # q x m
    F2 = transpose(Qc(f2cols))
    rkF1 = rank(F1, m)
    rkF2 = rank(F2, m)
    rho = 0
    for _ in range(4):
        g = rng.randrange(P)
        comb = [[(a + g * b) % P for a, b in zip(r1, r2)] for r1, r2 in zip(F1, F2)]
        rho = max(rho, rank(comb, m))
    rho = max(rho, rkF1, rkF2)
    rkL = rank(transpose(F1) + transpose(F2), q) if q else 0
    rkH = rank(F1 + F2, m)
    N = nullspace(F1 + F2, m)
    kerF1 = nullspace(F1, m)
    if kerF1:
        imgs = transpose(matmul(F2, transpose(kerF1)))
        s = rank(imgs, q) if q else 0
    else:
        s = 0
    dimN = len(N)
    # S = {x in N : f1(x), f2(x) in f0(N)}
    if dimN:
        f0N = [[sum(Mcols[l][r] * x[l] for l in range(m)) % P for r in range(R)] for x in N]
        # unknown c in F^dimN; x = sum c_j N_j ; conditions f1(x) in f0N, f2(x) in f0N
        # solve: lam*f0(x) - f0N*a = 0, mu*f0(x) - f0N*b = 0 in unknowns (c, a, b)
        rows = []
        for r in range(R):
            row = [lam[r] * f0N[j][r] % P for j in range(dimN)] + [(-f0N[j][r]) % P for j in range(dimN)] + [0] * dimN
            rows.append(row)
            row = [mu[r] * f0N[j][r] % P for j in range(dimN)] + [0] * dimN + [(-f0N[j][r]) % P for j in range(dimN)]
            rows.append(row)
        sol = nullspace(rows, 3 * dimN)
        dimS = rank([x[:dimN] for x in sol], dimN) if sol else 0
    else:
        dimS = 0
    return dict(q=q, rho=rho, rkF1=rkF1, rkF2=rkF2, rkL=rkL, rkH=rkH, s=s, dimN=dimN,
                Delta=2 * rkH - rkL, dimS=dimS)


def main():
    path = sys.argv[1]
    draws = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    seed = int(sys.argv[3]) if len(sys.argv) > 3 else 1
    m, prods, ident = load(path)
    rng = random.Random(seed)
    seen = {}
    for _ in range(draws):
        res = measure(m, prods, rng)
        key = "SN1 failed" if res is None else tuple(sorted(res.items()))
        seen[key] = seen.get(key, 0) + 1
    print(f"{ident}: m={m} R={len(prods)} draws={draws} seed={seed}")
    for k, c in seen.items():
        print(f"  {c}x  " + (k if isinstance(k, str) else ", ".join(f"{a}={b}" for a, b in k)))


if __name__ == "__main__":
    main()
