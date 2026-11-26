#!/usr/bin/env python3
"""Acceptance test of S4-22 for flip-graph finds over Z, the same at length 35 and 34.

For scheme number <index> of a flip.c output file with P = 0 (integer coefficients):
 1. write it as JSON in the format of verfahren/README.md (ring "Z"),
 2. check all Brent equations exactly with fractions.Fraction (exact.py of S4-16),
 3. Annahmebedingung (SN1)+(K1): try to bring it into the normal form exactly over Q with
    nf_check.normal_form of S4-16 (random integer basis change (S, T), then column change),
    and re-check the transformed scheme exactly,
 4. measure the Kenngroessen (q, rho, rk F1, rk L, rk H, s, dim N, Delta, dim S) exactly over
    GF(2^31 - 1) after random (S, T), with kenngroessen.measure of S4-08.
The Kenngroessen are only measured and compared afterwards; they never restrict the search.
Uses only own project code (versuche/s4-spurB-r3, versuche/s4-spurB-r2) and no floats.

Usage: python3 annahme.py <flip-output.txt> <index> <out.json> <id> [nf-tries]
       python3 annahme.py <scheme.json> - - <id> [nf-tries]
"""
import json
import os
import random
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "s4-spurB-r3"))
sys.path.insert(0, os.path.join(HERE, "..", "s4-spurB-r2"))
from exact import brent_errors, check_k1, load_json  # noqa: E402
import nf_check  # noqa: E402
import kenngroessen  # noqa: E402
from lift import read_schemes  # noqa: E402


def to_json(n, k, m, prods, path, ident, src, idx):
    js = {"format_version": 1, "id": ident, "n": n, "k": k, "m": m, "rank": len(prods), "ring": "Z",
          "origin": {"source": "eigene Suche",
                     "method": f"Flip-Graph-Suche über Z mit Koeffizientenschranke ab dem Standardverfahren (versuche/s4-spurB-r4/flip.c), Datei {src}, Verfahren {idx}",
                     "created": "2026-11-26", "created_by": "Verfahrenssucher, S4-22"},
          "notes": "Status behauptet. Gefunden ohne Kenntnis eines anderen Verfahrens.",
          "products": [{"u": [[str(a[i * k + j]) for j in range(k)] for i in range(n)],
                        "v": [[str(b[j * m + l]) for l in range(m)] for j in range(k)],
                        "w": [[str(c[i * m + l]) for l in range(m)] for i in range(n)]}
                       for a, b, c in prods]}
    with open(path, "w", encoding="utf-8") as fh:
        json.dump(js, fh, ensure_ascii=False, indent=1)


def main():
    src, out, ident = sys.argv[1], sys.argv[3], sys.argv[4]
    idx = int(sys.argv[2]) if sys.argv[2] != "-" else 0
    tries = int(sys.argv[5]) if len(sys.argv) > 5 else 8
    if src.endswith(".json"):          # already a JSON scheme (e.g. from hensel.py)
        out = src
        d, sch = load_json(out)
        m = d["m"]
    else:
        (n, k, m, R, P), prods = read_schemes(src)[idx]
        assert P == 0 and n == 3 and k == 2
        to_json(n, k, m, prods, out, ident, os.path.basename(src), idx)
        _, sch = load_json(out)
    bad = brent_errors(sch, m)
    print(f"{ident}: R={len(sch)} exact Brent check over Q: {bad} violated equations")
    if bad:
        return 3
    rng = random.Random(1)
    nf = None
    for t in range(tries):
        res = nf_check.normal_form(sch, m, rng)
        info = res[1] if isinstance(res, tuple) else res
        if isinstance(res, tuple) and res[0] is not None:
            nf = res[0]
            break
    if nf is not None:
        bad2 = brent_errors(nf, m)
        sn1, k1 = check_k1(nf, m)
        print(f"  (SN1)+(K1) over Q: reached, exact re-check {bad2} violated, SN1={sn1}, K1={k1}")
    else:
        print(f"  (SN1)+(K1) over Q: not reached in {tries} tries; last: {info}")
    _, prods_k, _ = kenngroessen.load(out)
    vals = kenngroessen.measure(m, prods_k, random.Random(7))
    print(f"  Kenngroessen: {vals}")
    return 0 if nf is not None else 1


if __name__ == "__main__":
    sys.exit(main())
