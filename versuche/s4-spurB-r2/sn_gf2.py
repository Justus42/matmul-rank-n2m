#!/usr/bin/env python3
"""Does a <3,2,m> scheme with integer coefficients admit a strong normalisation over GF(p)
itself (small p)? (S4-08, calibration of the sub-space searched by SAT.)

(SN1) needs u in GF(p)^3, p in GF(p)^{1x2} with alpha_r(u p) != 0 for all r.
(SN2) (Lemma A, steps 2a/5 in lean/prosa/yang_n3.md): for every v != 0 in GF(p)^{2xm},
      the matrix (alpha_r(e_i p))_{r in supp(beta(v)), i=0,1,2} has rank 3.
Usage: python3 sn_gf2.py scheme.json [p]   (p prime, default 2; full enumeration of v)
"""
import itertools
import json
import sys
from fractions import Fraction


def rank_mod(rows, p):
    rows = [list(r) for r in rows]
    rk = 0
    ncols = len(rows[0]) if rows else 0
    for c in range(ncols):
        piv = next((i for i in range(rk, len(rows)) if rows[i][c] % p), None)
        if piv is None:
            continue
        rows[rk], rows[piv] = rows[piv], rows[rk]
        iv = pow(rows[rk][c], p - 2, p)
        rows[rk] = [x * iv % p for x in rows[rk]]
        for i in range(len(rows)):
            if i != rk and rows[i][c] % p:
                f = rows[i][c]
                rows[i] = [(x - f * y) % p for x, y in zip(rows[i], rows[rk])]
        rk += 1
    return rk


def main():
    d = json.load(open(sys.argv[1]))
    p = int(sys.argv[2]) if len(sys.argv) > 2 else 2
    m = d["m"]

    def red(x):
        f = Fraction(x)
        assert f.denominator % p
        return f.numerator * pow(f.denominator, p - 2, p) % p

    U = [[[red(x) for x in row] for row in pr["u"]] for pr in d["products"]]
    V = [[[red(x) for x in row] for row in pr["v"]] for pr in d["products"]]
    R = len(U)
    vecs = [x for x in itertools.product(range(p), repeat=2) if any(x)]
    us = [x for x in itertools.product(range(p), repeat=3) if any(x)]
    good = 0
    for pp in vecs:
        sn1_u = [u for u in us if all(sum(U[r][i][j] * u[i] * pp[j] for i in range(3) for j in range(2)) % p for r in range(R))]
        if not sn1_u:
            print(f"p-row {pp}: SN1 impossible")
            continue
        # SN2 for this p-row
        A = [[sum(U[r][i][j] * pp[j] for j in range(2)) % p for i in range(3)] for r in range(R)]
        fail = 0
        for v in itertools.product(range(p), repeat=2 * m):
            if not any(v):
                continue
            supp = [r for r in range(R) if sum(V[r][j][l] * v[j * m + l] for j in range(2) for l in range(m)) % p]
            if rank_mod([A[r] for r in supp], p) < 3:
                fail += 1
                if fail == 1:
                    first = v
        print(f"p-row {pp}: SN1 possible with {len(sn1_u)} vectors u; SN2 violated by {fail} vectors v" + (f" (first {first})" if fail else ""))
        if not fail:
            good += 1
    print(f"{d.get('id')}: GF({p}) strong normalisation possible for {good} of {len(vecs)} rows p")


if __name__ == "__main__":
    main()
