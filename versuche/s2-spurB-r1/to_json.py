#!/usr/bin/env python3
"""Convert a scheme dump of flip.c into the scheme format of verfahren/README.md.

Usage: to_json.py dump.txt out.json ring source method created_by [notes]

The dump starts with "n k m rank p", followed by one line per product:
u (n*k entries) | v (k*m entries) | w (n*m entries), all row-major.
For p >= 2 the entries are reduced to 0..p-1 and written as integers;
ring must then be GF(p). For p = 0 the entries are integers (ring Z).
"""
import json
import os
import sys


def main():
    dump, out, ring, source, method, created_by = sys.argv[1:7]
    notes = sys.argv[7] if len(sys.argv) > 7 else None
    with open(dump) as f:
        head = f.readline().split()
        n, k, m, rank, p = map(int, head)
        products = []
        for _ in range(rank):
            parts = f.readline().split("|")
            u, v, w = ([int(x) for x in part.split()] for part in parts)
            assert len(u) == n * k and len(v) == k * m and len(w) == n * m

            def mat(x, rows, cols):
                return [[str(x[r * cols + c]) for c in range(cols)] for r in range(rows)]

            products.append({"u": mat(u, n, k), "v": mat(v, k, m), "w": mat(w, n, m)})
    ident = os.path.basename(out)[: -len(".json")]
    doc = {
        "format_version": 1,
        "id": ident,
        "n": n,
        "k": k,
        "m": m,
        "rank": rank,
        "ring": ring,
        "origin": {
            "source": source,
            "method": method,
            "created": "2026-11-25",
            "created_by": created_by,
        },
    }
    if notes:
        doc["notes"] = notes
    doc["products"] = products
    with open(out, "w", encoding="utf-8") as f:
        f.write("{\n")
        keys = [key for key in doc if key != "products"]
        for key in keys:
            f.write(f"  {json.dumps(key)}: {json.dumps(doc[key], ensure_ascii=False)},\n")
        f.write('  "products": [\n')
        for i, pr in enumerate(products):
            sep = "," if i + 1 < len(products) else ""
            f.write("    " + json.dumps(pr, separators=(",", ":")) + sep + "\n")
        f.write("  ]\n}\n")


if __name__ == "__main__":
    main()
