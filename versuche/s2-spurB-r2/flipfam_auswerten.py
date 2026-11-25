#!/usr/bin/env python3
"""Summarise many independent flip.c runs (logs written by flipfam.sh).

usage: flipfam_auswerten.py DIR [DIR ...]
Per run: best rank, steps; over all runs: distinct schemes of rank 26 (by hash),
distinct invariants, and how many runs share no rank-26 scheme with any other run.
"""
import collections
import glob
import os
import re
import sys

runs = []
for d in sys.argv[1:]:
    for path in sorted(glob.glob(os.path.join(d, "*.log"))):
        best, steps, hashes, invs = None, None, set(), set()
        for line in open(path):
            m = re.match(r"SCHEME rank=(\d+) hash=(\w+) inv=(\S+)", line)
            if m and int(m.group(1)) == 26:
                hashes.add(m.group(2))
                invs.add(m.group(3))
            m = re.match(r"END .* steps=(\d+) .* best=(\d+)", line)
            if m:
                steps, best = int(m.group(1)), int(m.group(2))
        runs.append((path, best, steps, hashes, invs))

count = collections.Counter()
for _, _, _, h, _ in runs:
    for x in h:
        count[x] += 1
all_h = set(count)
all_inv = set().union(*(r[4] for r in runs)) if runs else set()
for path, best, steps, h, inv in runs:
    shared = sum(1 for x in h if count[x] > 1)
    print(f"{os.path.relpath(path)}: best={best} steps={steps} rank26_schemes={len(h)} invariants={len(inv)} shared_with_other_runs={shared}")
reach = [r for r in runs if r[1] is not None and r[1] <= 26]
print(f"runs={len(runs)} reached26={len(reach)} below26={sum(1 for r in runs if r[1] is not None and r[1] < 26)}")
print(f"distinct rank-26 schemes over all runs={len(all_h)} distinct invariants={len(all_inv)}")
