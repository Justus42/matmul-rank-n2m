#!/usr/bin/env python3
"""Lift a GF(2) scheme from flip.c to an integer scheme with coefficients in {-1, 0, 1} (S4-22).

Own code. Every nonzero entry 1 of the GF(2) scheme becomes 1 - 2*d with d in {0, 1}
(so +1 or -1), zero entries stay 0. A sign pattern can be correct over Z only if it is
correct modulo 4. Modulo 4, (1-2a)(1-2b)(1-2c) = 1 - 2(a+b+c), so the Brent equations mod 4
become a LINEAR system over GF(2) in the d's:
    sum over the monomials of an equation of (d_a + d_b + d_c) = F(1)/2   (mod 2),
where F(1) is the integer residual of the all-plus pattern (even, because the scheme is
correct mod 2). We solve it exactly over GF(2) (Python integers as bit rows), then test
random points of the affine solution space EXACTLY over Z (Python integers, no floats).
The first pattern with residual 0 is written as a JSON file in the format of
verfahren/README.md with ring "Z".

Usage: python3 lift.py <flip-output.txt> <index> <out.json> <id> [tries] [seed]
"""
import json
import random
import sys


def read_schemes(path):
    out, cur, hdr = [], None, None
    for line in open(path):
        line = line.strip()
        if line.startswith("scheme"):
            hdr = list(map(int, line.split()[1:])); cur = []
        elif line == "end":
            out.append((hdr, cur)); cur = None
        elif cur is not None:
            a, b, c = line.split("|")
            cur.append((list(map(int, a.split())), list(map(int, b.split())), list(map(int, c.split()))))
    return out


def equations(n, k, m, prods):
    """For each Brent equation (a, b, c): list of monomials (r, a, b, c) with all three
    entries nonzero, and the wanted value."""
    eqs = []
    for i in range(n):
        for j in range(k):
            for j2 in range(k):
                for l in range(m):
                    for i2 in range(n):
                        for l2 in range(m):
                            A, Bi, C = i * k + j, j2 * m + l, i2 * m + l2
                            mons = [r for r, (a, b, c) in enumerate(prods) if a[A] and b[Bi] and c[C]]
                            want = 1 if (i == i2 and j == j2 and l == l2) else 0
                            eqs.append((A, Bi, C, mons, want))
    return eqs


def residual_int(eqs, prods):
    bad = 0
    for A, Bi, C, mons, want in eqs:
        s = sum(prods[r][0][A] * prods[r][1][Bi] * prods[r][2][C] for r in mons)
        if s != want:
            bad += 1
    return bad


def solve_gf2(rows, nvar):
    """rows: list of (bitmask, rhs). Returns (particular solution, kernel basis) or None."""
    piv = {}  # pivot column -> (mask, rhs)
    for mask, rhs in rows:
        for c, (pm, pr) in piv.items():
            if mask >> c & 1:
                mask ^= pm; rhs ^= pr
        if mask == 0:
            if rhs:
                return None
            continue
        c = mask.bit_length() - 1
        for c2 in list(piv):
            pm, pr = piv[c2]
            if pm >> c & 1:
                piv[c2] = (pm ^ mask, pr ^ rhs)
        piv[c] = (mask, rhs)
    x0 = 0
    for c, (pm, pr) in piv.items():
        if pr:
            x0 |= 1 << c
    free = [c for c in range(nvar) if c not in piv]
    kern = []
    for f in free:
        v = 1 << f
        for c, (pm, pr) in piv.items():
            if pm >> f & 1:
                v |= 1 << c
        kern.append(v)
    return x0, kern


def main():
    path, idx, out, ident = sys.argv[1], int(sys.argv[2]), sys.argv[3], sys.argv[4]
    tries = int(sys.argv[5]) if len(sys.argv) > 5 else 2000
    rng = random.Random(int(sys.argv[6]) if len(sys.argv) > 6 else 1)
    (n, k, m, R, P), prods = read_schemes(path)[idx]
    assert P == 2 and len(prods) == R
    # variables: one per nonzero entry
    var = {}
    for r, f in enumerate(prods):
        for t in range(3):
            for e, x in enumerate(f[t]):
                if x % 2:
                    var[(r, t, e)] = len(var)
    plus = [tuple([x % 2 for x in f[t]] for t in range(3)) for f in prods]
    eqs = equations(n, k, m, plus)
    rows = []
    for A, Bi, C, mons, want in eqs:
        f1 = len(mons) - want
        assert f1 % 2 == 0, "not a GF(2) scheme"
        mask = 0
        for r in mons:
            for key in ((r, 0, A), (r, 1, Bi), (r, 2, C)):
                mask ^= 1 << var[key]
        rows.append((mask, (f1 // 2) % 2))
    sol = solve_gf2(rows, len(var))
    if sol is None:
        print(f"no sign lift: the mod-4 system is inconsistent ({len(var)} signs)")
        return 1
    x0, kern = sol
    print(f"signs={len(var)} kernel dim={len(kern)}")
    for t in range(tries):
        x = x0
        if t:
            for v in kern:
                if rng.random() < 0.5:
                    x ^= v
        cand = []
        for r, f in enumerate(prods):
            cand.append(tuple([(-1 if (x >> var[(r, tt, e)]) & 1 else 1) if f[tt][e] % 2 else 0
                               for e in range(len(f[tt]))] for tt in range(3)))
        bad = residual_int(eqs, cand)
        if bad == 0:
            print(f"lift found at try {t}: exact over Z, 0 violated equations")
            js = {"format_version": 1, "id": ident, "n": n, "k": k, "m": m, "rank": R, "ring": "Z",
                  "origin": {"source": "eigene Suche",
                             "method": f"Flip-Graph-Suche über GF(2) ab dem Standardverfahren (versuche/s4-spurB-r4/flip.c), Datei {path.split('/')[-1]}, Verfahren {idx}; Vorzeichenhebung nach Z (lift.py, Versuch {t})",
                             "created": "2026-11-26", "created_by": "Verfahrenssucher, S4-22"},
                  "notes": "Status behauptet. Gefunden ohne Kenntnis eines anderen Verfahrens.",
                  "products": [{"u": [[str(a[i * k + j]) for j in range(k)] for i in range(n)],
                                "v": [[str(b[j * m + l]) for l in range(m)] for j in range(k)],
                                "w": [[str(c[i * m + l]) for l in range(m)] for i in range(n)]}
                               for a, b, c in cand]}
            with open(out, "w", encoding="utf-8") as fh:
                json.dump(js, fh, ensure_ascii=False, indent=1)
            return 0
    print(f"no exact lift in {tries} random sign patterns (mod 4 solvable)")
    return 2


if __name__ == "__main__":
    sys.exit(main())
