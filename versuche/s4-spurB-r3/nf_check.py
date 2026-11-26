#!/usr/bin/env python3
"""Is the constrained normal form (SN1) + (K1) admissible for a known scheme over Q? (S4-16)

Exact over Q (fractions.Fraction). Steps:
 1. random integer change of basis (S, T) (R3 of lean/prosa/yang_n3.md):
      u'(A) = u(S A T), v'(B) = v(T^-1 B), w' = S^-1 w
 2. check (SN1) u'_r[0][0] != 0 for all r, rescale u_r /= u_r[0][0], w_r *= u_r[0][0]
 3. with M[r][l] = v_r[1][l], Lam = diag(u_r[1][0]), Mu = diag(u_r[2][0]) compute
      N = {x : Lam M x in im M and Mu M x in im M}
    (dim N must be >= 1); pick x0 in N, y1, y2 with Lam M x0 = M y1, Mu M x0 = M y2
 4. if x0, y1, y2 are linearly independent: column change Q = [.., y2, y1, x0]
      v''_r[j] = v_r[j] Q, w''_r = w_r Q^-T
    then (K1) holds by construction; everything is re-checked exactly
 5. the transformed scheme is written to a JSON file (format of verfahren/README.md)
Usage: python3 nf_check.py <scheme.json> <out.json> [seed] [tries]
"""
import json
import random
import sys
from fractions import Fraction

from exact import brent_errors, check_k1, check_k2, fstr, load_json

n, k = 3, 2


def matmul(A, B):
    return [[sum(A[i][t] * B[t][j] for t in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]


def inverse(A):
    N_ = len(A)
    M = [list(A[i]) + [Fraction(int(i == j)) for j in range(N_)] for i in range(N_)]
    for c in range(N_):
        p = next((i for i in range(c, N_) if M[i][c] != 0), None)
        if p is None:
            return None
        M[c], M[p] = M[p], M[c]
        iv = 1 / M[c][c]
        M[c] = [x * iv for x in M[c]]
        for i in range(N_):
            if i != c and M[i][c] != 0:
                f = M[i][c]
                M[i] = [x - f * y for x, y in zip(M[i], M[c])]
    return [row[N_:] for row in M]


def transpose(A):
    return [list(r) for r in zip(*A)]


def nullspace(rows, ncol):
    M = [list(r) for r in rows]
    piv = []
    rk = 0
    for c in range(ncol):
        p = next((i for i in range(rk, len(M)) if M[i][c] != 0), None)
        if p is None:
            continue
        M[rk], M[p] = M[p], M[rk]
        iv = 1 / M[rk][c]
        M[rk] = [x * iv for x in M[rk]]
        for i in range(len(M)):
            if i != rk and M[i][c] != 0:
                f = M[i][c]
                M[i] = [x - f * y for x, y in zip(M[i], M[rk])]
        piv.append(c)
        rk += 1
    free = [c for c in range(ncol) if c not in piv]
    basis = []
    for f in free:
        x = [Fraction(0)] * ncol
        x[f] = Fraction(1)
        for i, c in enumerate(piv):
            x[c] = -M[i][f]
        basis.append(x)
    return basis


def rank(rows, ncol):
    return ncol - len(nullspace(rows, ncol)) if rows else 0


def transform(scheme, S, T):
    """u'(A) = u(SAT): coefficient matrix u' = S^T u T^T ; v' = T^-T v ; w' = S^-1 w."""
    Si, Ti = inverse(S), inverse(T)
    out = []
    for (u, v, w) in scheme:
        u2 = matmul(matmul(transpose(S), u), transpose(T))
        v2 = matmul(transpose(Ti), v)
        w2 = matmul(Si, w)
        out.append((u2, v2, w2))
    return out


def normal_form(scheme, m, rng, lo=-40, hi=40):
    R = len(scheme)
    while True:
        S = [[Fraction(rng.randint(lo, hi)) for _ in range(3)] for _ in range(3)]
        T = [[Fraction(rng.randint(lo, hi)) for _ in range(2)] for _ in range(2)]
        if inverse(S) is not None and inverse(T) is not None:
            break
    sch = transform(scheme, S, T)
    if any(u[0][0] == 0 for (u, v, w) in sch):
        return None, "SN1 fails for this (S,T)"
    sch2 = []
    for (u, v, w) in sch:
        a = u[0][0]
        sch2.append(([[x / a for x in row] for row in u], v, [[x * a for x in row] for row in w]))
    sch = sch2
    M = [[v[1][l] for l in range(m)] for (u, v, w) in sch]
    lam = [u[1][0] for (u, v, w) in sch]
    mu = [u[2][0] for (u, v, w) in sch]
    # unknowns (x, y1, y2) in Q^{3m}:  Lam M x - M y1 = 0,  Mu M x - M y2 = 0
    rows = []
    for r in range(R):
        rows.append([lam[r] * M[r][l] for l in range(m)] + [-M[r][l] for l in range(m)] + [Fraction(0)] * m)
        rows.append([mu[r] * M[r][l] for l in range(m)] + [Fraction(0)] * m + [-M[r][l] for l in range(m)])
    ker = nullspace(rows, 3 * m)
    dimN = len(ker)  # M injective, so the x-part determines y1, y2
    info = {"S": [[fstr(x) for x in r] for r in S], "T": [[fstr(x) for x in r] for r in T], "dimN": dimN}
    if dimN == 0:
        return None, f"dim N = 0 {info}"
    # take a random element of N
    coef = [Fraction(rng.randint(1, 5)) for _ in ker]
    vec = [sum(c * b[q] for c, b in zip(coef, ker)) for q in range(3 * m)]
    x0, y1, y2 = vec[:m], vec[m:2 * m], vec[2 * m:]
    if rank([x0, y1, y2], m) < 3:
        return None, f"x0, y1, y2 dependent {info}"
    # complete to a basis: Q columns = (e_* ..., y2, y1, x0)
    cols = []
    for l in range(m):
        e = [Fraction(int(q == l)) for q in range(m)]
        if rank(cols + [e, y2, y1, x0], m) == len(cols) + 4 and len(cols) < m - 3:
            cols.append(e)
    cols += [y2, y1, x0]
    Q = transpose(cols)  # m x m, column l = cols[l]
    QiT = transpose(inverse(Q))
    out = []
    for (u, v, w) in sch:
        out.append((u, matmul(v, Q), matmul(w, QiT)))
    return out, info


def to_json(scheme, ident, m, notes, parent):
    return {
        "format_version": 1, "id": ident, "n": 3, "k": 2, "m": m, "rank": len(scheme), "ring": "Q",
        "origin": {"source": "exakter Basiswechsel des bekannten Verfahrens " + parent + " (keine neue Suche)",
                   "method": "nf_check.py (S4-16)", "created": "2026-11-26",
                   "created_by": "Verfahrenssucher, S4-16", "derived_from": parent},
        "notes": notes,
        "products": [{"u": [[fstr(x) for x in r] for r in u], "v": [[fstr(x) for x in r] for r in v],
                      "w": [[fstr(x) for x in r] for r in w]} for (u, v, w) in scheme],
    }


def main():
    path, out = sys.argv[1], sys.argv[2]
    seed = int(sys.argv[3]) if len(sys.argv) > 3 else 1
    tries = int(sys.argv[4]) if len(sys.argv) > 4 else 20
    d, sch = load_json(path)
    m = d["m"]
    print(f"{path}: m={m} R={len(sch)} brent errors before: {brent_errors(sch, m)}")
    rng = random.Random(seed)
    for t in range(tries):
        res, info = normal_form(sch, m, rng)
        if res is None:
            print(f"  try {t}: {info}")
            continue
        be = brent_errors(res, m)
        sn1, k1 = check_k1(res, m)
        k2 = check_k2(res, m)
        print(f"  try {t}: {info} -> brent errors {be}, SN1 {sn1}, K1 {k1}, K2 {k2}")
        if be == 0 and sn1 and k1:
            ident = out.rsplit("/", 1)[-1][:-5]
            with open(out, "w", encoding="utf-8") as fh:
                json.dump(to_json(res, ident, m, f"Normalform (SN1)+(K1) von {d['id']}, S={info['S']}, T={info['T']}", d['id']),
                          fh, ensure_ascii=False, indent=1)
            print(f"  written {out}")
            return 0
    return 1


if __name__ == "__main__":
    sys.exit(main())
