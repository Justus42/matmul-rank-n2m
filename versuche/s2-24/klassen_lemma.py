#!/usr/bin/env python3
"""Exhaustive exact check of the core of Lemma K (report S2-24, section 3).

For linear maps a, b : K^2 -> K^n (n x 2 matrices X, Y) let
    P(X, Y) := coefficients of the quadratic map p |-> (X p) (x) (Y p),
an element of K^{n*n*3} (monomials p1^2, p1 p2, p2^2).

Claim (Lemma K, core): if P(X, Y) = P(X', Y') != 0, then either
  (i)  X' = lam X and Y' = lam^{-1} Y for some lam != 0, or
  (ii) X = x l1^T, Y = w l2^T, X' = lam x l2^T, Y' = lam^{-1} w l1^T
       with l1, l2 linearly independent (the "swap").
Equivalently: every nonzero fibre of P consists of at most two orbits of the
torus (X, Y) -> (lam X, lam^{-1} Y), and two orbits occur only as in (ii).

The script enumerates all pairs (X, Y) over GF(q) for small n, q, groups them
by P(X, Y), and checks the claim on every fibre. Exact integer arithmetic mod q.
"""
import itertools
import sys
from collections import defaultdict


def mats(n, q):
    for entries in itertools.product(range(q), repeat=2 * n):
        yield tuple(tuple(entries[2 * i:2 * i + 2]) for i in range(n))


def P(X, Y, q):
    out = []
    for xi in X:
        for yj in Y:
            # (xi . p)(yj . p) = xi0 yj0 p1^2 + (xi0 yj1 + xi1 yj0) p1 p2 + xi1 yj1 p2^2
            out.append(xi[0] * yj[0] % q)
            out.append((xi[0] * yj[1] + xi[1] * yj[0]) % q)
            out.append(xi[1] * yj[1] % q)
    return tuple(out)


def scale(X, lam, q):
    return tuple(tuple(v * lam % q for v in row) for row in X)


def rank1_factor(X, q):
    """If X (n x 2) has rank 1, return the row-space vector l (normalised) else None."""
    rows = [r for r in X if any(r)]
    if not rows:
        return None
    r0 = rows[0]
    for r in rows[1:]:
        if (r0[0] * r[1] - r0[1] * r[0]) % q:
            return None
    # normalise l so that its first nonzero entry is 1
    inv = pow(r0[0] if r0[0] else r0[1], q - 2, q)
    return (r0[0] * inv % q, r0[1] * inv % q)


def check(n, q):
    fib = defaultdict(list)
    for X in mats(n, q):
        if not any(any(r) for r in X):
            continue
        for Y in mats(n, q):
            if not any(any(r) for r in Y):
                continue
            fib[P(X, Y, q)].append((X, Y))
    units = range(1, q)
    max_orbits = 0
    n_two = 0
    for key, lst in fib.items():
        if not any(key):
            raise AssertionError("nonzero X, Y with P = 0 (impossible over a field)")
        # torus orbits
        seen = set()
        reps = []
        for X, Y in lst:
            if (X, Y) in seen:
                continue
            reps.append((X, Y))
            for lam in units:
                seen.add((scale(X, lam, q), scale(Y, pow(lam, q - 2, q), q)))
        if len(seen) != len(lst):
            raise AssertionError("orbit bookkeeping")
        max_orbits = max(max_orbits, len(reps))
        if len(reps) > 2:
            raise AssertionError(f"fibre with {len(reps)} orbits: {reps}")
        if len(reps) == 2:
            n_two += 1
            (X, Y), (X2, Y2) = reps
            l1, l2 = rank1_factor(X, q), rank1_factor(Y, q)
            m1, m2 = rank1_factor(X2, q), rank1_factor(Y2, q)
            ok = (None not in (l1, l2, m1, m2)) and l1 != l2 and m1 == l2 and m2 == l1
            if not ok:
                raise AssertionError(f"two orbits not of swap shape: {reps}")
    return len(fib), max_orbits, n_two


def main():
    cases = [(2, 2), (2, 3), (2, 5), (3, 2), (3, 3), (4, 2)]
    if len(sys.argv) > 1 and sys.argv[1] == "--quick":
        cases = cases[:4]
    for n, q in cases:
        nf, mo, n2 = check(n, q)
        print(f"n={n} q={q}: {nf} nonzero fibres, max torus orbits per fibre = {mo}, "
              f"fibres with 2 orbits = {n2} (all of swap shape)")
    print("Lemma K core: OK in all cases")


if __name__ == "__main__":
    main()
