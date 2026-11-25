#!/usr/bin/env python3
"""Summarise flip.c logs of one or more blocks.

Usage: auswerten.py logdir [logdir ...]
For every log: field/ring, steps, best rank, plus transitions, distinct
schemes of rank <= 26 (by hash), and distinct invariants (sorted multiset of
(rank u, rank v, rank w) per product). Invariants are a coarse lower bound
for the number of orbits under the symmetry group: schemes with different
invariants are certainly inequivalent, equal invariants say nothing.
"""
import collections
import glob
import os
import sys


def main():
    per_field = collections.defaultdict(lambda: {"hashes": set(), "inv": collections.Counter(), "steps": 0, "best": 99, "files": 0, "plus": 0})
    for d in sys.argv[1:]:
        for fn in sorted(glob.glob(os.path.join(d, "*.log"))):
            p = None
            hashes, invs = set(), collections.Counter()
            end = None
            with open(fn) as f:
                for line in f:
                    if line.startswith("SCHEME"):
                        parts = dict(x.split("=", 1) for x in line.split()[1:])
                        hashes.add((parts["rank"], parts["hash"]))
                        invs[(parts["rank"], parts["inv"])] += 1
                    elif line.startswith("END"):
                        end = dict(x.split("=", 1) for x in line.split()[1:])
            if end is None:
                print(f"{fn}: kein END (abgebrochen?)")
                continue
            p = end["p"]
            print(f"{fn}: p={p} seed={end['seed']} steps={end['steps']} best={end['best']} plus={end['plusses']} distinct_schemes={len(hashes)} distinct_invariants={len(invs)}")
            agg = per_field[p]
            agg["hashes"] |= hashes
            agg["inv"].update(invs)
            agg["steps"] += int(end["steps"])
            agg["best"] = min(agg["best"], int(end["best"]))
            agg["files"] += 1
            agg["plus"] += int(end["plusses"])
    print()
    for p, agg in sorted(per_field.items()):
        name = "Z" if p == "0" else f"GF({p})"
        ranks = collections.Counter(r for r, _ in agg["hashes"])
        print(f"{name}: Prozesse={agg['files']} Schritte={agg['steps']:.3e} bester Rang={agg['best']} Plus-Übergänge={agg['plus']} "
              f"verschiedene Verfahren je Rang={dict(sorted(ranks.items()))} verschiedene Invarianten={len(agg['inv'])}")
        top = agg["inv"].most_common(5)
        for (r, inv), cnt in top:
            short = collections.Counter(inv.split(","))
            print(f"   Rang {r}, {cnt}x: " + " ".join(f"{k}:{v}" for k, v in sorted(short.items())))


if __name__ == "__main__":
    main()
