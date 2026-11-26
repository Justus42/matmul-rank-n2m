#!/usr/bin/env python3
"""Hensel lifting of a GF(2) scheme from flip.c to a scheme over Q (S4-22).

Own code. x = all coefficients (u, v, w of every product). F(x) = Brent residuals over Z.
Starting from the GF(2) scheme x_0 (entries 0/1, F(x_0) = 0 mod 2), step t finds
d in {0,1}^N with  J(x_0) d = -F(x)/2^t  (mod 2)  and sets x <- x + 2^t d, so that
F(x) = 0 mod 2^(t+1). J(x_0) mod 2 is the Jacobian of the Brent equations at x_0.
Free variables are set to 0. Zero entries of x_0 get the lowest pivot priority, so that as
few zeros as possible become nonzero. After K steps every coordinate is turned into a
fraction a/b by rational reconstruction modulo 2^K (|a|, b <= sqrt(2^(K-1))), and the result
is checked EXACTLY over Q with fractions.Fraction. Only integers and fractions, no floats.

Usage: python3 hensel.py <flip-output.txt> <index> <out.json> <id> [K]
"""
import json
import sys
from fractions import Fraction

from lift import read_schemes, solve_gf2


def ratrec(a, mod):
    """Rational reconstruction: a = p/q mod `mod` with |p|, q <= sqrt(mod/2); None if none."""
    import math
    bound = math.isqrt(mod // 2)
    r0, r1, s0, s1 = mod, a % mod, 0, 1
    while r1 > bound:
        q = r0 // r1
        r0, r1 = r1, r0 - q * r1
        s0, s1 = s1, s0 - q * s1
    if s1 == 0 or abs(s1) > bound:
        return None
    if math.gcd(r1, abs(s1)) != 1:
        return None
    return Fraction(r1, s1)


def main():
    path, idx, out, ident = sys.argv[1], int(sys.argv[2]), sys.argv[3], sys.argv[4]
    K = int(sys.argv[5]) if len(sys.argv) > 5 else 48
    (n, k, m, R, P), prods = read_schemes(path)[idx]
    assert P == 2
    d0, d1, d2 = n * k, k * m, n * m
    dims = (d0, d1, d2)
    # coordinate list: zeros first (low bits, low pivot priority), then ones
    coords = [(r, t, e) for r in range(R) for t in range(3) for e in range(dims[t])]
    x0 = {c: prods[c[0]][c[1]][c[2]] % 2 for c in coords}
    order = sorted(coords, key=lambda c: x0[c])
    pos = {c: q for q, c in enumerate(order)}
    eqs = []
    for i in range(n):
        for j in range(k):
            for j2 in range(k):
                for l in range(m):
                    for i2 in range(n):
                        for l2 in range(m):
                            eqs.append((i * k + j, j2 * m + l, i2 * m + l2, 1 if (i == i2 and j == j2 and l == l2) else 0))
    # Jacobian mod 2 at x0 as bit rows
    jac = []
    for A, Bi, C, want in eqs:
        mask = 0
        for r in range(R):
            a, b, c = x0[(r, 0, A)], x0[(r, 1, Bi)], x0[(r, 2, C)]
            if b and c:
                mask ^= 1 << pos[(r, 0, A)]
            if a and c:
                mask ^= 1 << pos[(r, 1, Bi)]
            if a and b:
                mask ^= 1 << pos[(r, 2, C)]
        jac.append(mask)
    x = dict(x0)

    def resid():
        out_ = []
        for A, Bi, C, want in eqs:
            s = 0
            for r in range(R):
                a = x[(r, 0, A)]
                if a:
                    b = x[(r, 1, Bi)]
                    if b:
                        s += a * b * x[(r, 2, C)]
            out_.append(s - want)
        return out_

    mod = 2
    for t in range(1, K):
        F = resid()
        assert all(f % mod == 0 for f in F)
        rows = [(jac[e], ((-F[e] // mod) % 2)) for e in range(len(eqs))]
        sol = solve_gf2(rows, len(order))
        if sol is None:
            print(f"lifting stops at step {t}: linear system mod 2 inconsistent")
            return 1
        dsol = sol[0]
        for c in coords:
            if (dsol >> pos[c]) & 1:
                x[c] += mod
        mod *= 2
    F = resid()
    assert all(f % mod == 0 for f in F)
    nz = sum(1 for c in coords if x[c] % mod)
    q = {}
    for c in coords:
        v = ratrec(x[c] % mod, mod)
        if v is None:
            print(f"rational reconstruction fails at {c} (mod 2^{K}); {nz} nonzero coordinates")
            return 2
        q[c] = v
    # exact check over Q
    bad = 0
    for A, Bi, C, want in eqs:
        s = sum(q[(r, 0, A)] * q[(r, 1, Bi)] * q[(r, 2, C)] for r in range(R))
        if s != want:
            bad += 1
    hmax = max(max(abs(v.numerator), v.denominator) for v in q.values())
    print(f"reconstructed over Q: {bad} violated equations, max height {hmax}, nonzeros {sum(1 for v in q.values() if v)}")
    if bad:
        return 3
    fs = lambda v: str(v.numerator) if v.denominator == 1 else f"{v.numerator}/{v.denominator}"
    ring = "Z" if all(v.denominator == 1 for v in q.values()) else "Q"
    js = {"format_version": 1, "id": ident, "n": n, "k": k, "m": m, "rank": R, "ring": ring,
          "origin": {"source": "eigene Suche",
                     "method": f"Flip-Graph-Suche über GF(2) ab dem Standardverfahren (versuche/s4-spurB-r4/flip.c), Datei {path.split('/')[-1]}, Verfahren {idx}; Hensel-Hebung modulo 2^{K} und rationale Rekonstruktion (hensel.py)",
                     "created": "2026-11-26", "created_by": "Verfahrenssucher, S4-22"},
          "notes": "Status behauptet. Gefunden ohne Kenntnis eines anderen Verfahrens.",
          "products": [{"u": [[fs(q[(r, 0, i * k + j)]) for j in range(k)] for i in range(n)],
                        "v": [[fs(q[(r, 1, j * m + l)]) for l in range(m)] for j in range(k)],
                        "w": [[fs(q[(r, 2, i * m + l)]) for l in range(m)] for i in range(n)]}
                       for r in range(R)]}
    with open(out, "w", encoding="utf-8") as fh:
        json.dump(js, fh, ensure_ascii=False, indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
