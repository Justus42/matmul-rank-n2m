#!/usr/bin/env python3
"""Which pairs of products in a flip.c dump share a factor up to sign/scalar?
Usage: struktur.py dump.txt   (works over Q: proportional with any rational)"""
import sys
from fractions import Fraction


def prop(x, y):
    i = next((k for k, a in enumerate(x) if a), None)
    if i is None or not y[i]:
        return False
    lam = Fraction(y[i], x[i])
    return all(Fraction(b) == lam * a for a, b in zip(x, y))


with open(sys.argv[1]) as f:
    n, k, m, R, p = map(int, f.readline().split())
    terms = [[list(map(int, part.split())) for part in f.readline().split("|")] for _ in range(R)]
names = "uvw"
pairs = []
for i in range(R):
    for j in range(i + 1, R):
        for s in range(3):
            if prop(terms[i][s], terms[j][s]):
                pairs.append((i, j, names[s]))
print(f"Rang {R}: {len(pairs)} Paare mit gemeinsamem Faktor (bis auf Skalar)")
for i, j, s in pairs:
    print(f"  Produkt {i+1:2d} und {j+1:2d}: gleiches {s}")
