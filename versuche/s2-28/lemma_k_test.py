"""S2-28: independent exhaustive check of Lemma K (B-014) over GF(4), GF(7), GF(8) for n = 2.
For all X, Y in F^{n x 2}, X, Y != 0, group by the quadratic map p -> (Xp) (x) (Yp);
in each fibre count orbits under (X, Y) -> (lam X, lam^-1 Y); expect <= 2, and with 2 orbits
the 'swap' shape X = x l1^T, Y = w l2^T, X' ~ x l2^T, Y' ~ w l1^T, l1, l2 independent."""
import itertools, sys

def make_field(q):
    if q in (2, 3, 5, 7):
        add = lambda a, b: (a + b) % q; mul = lambda a, b: (a * b) % q
        return list(range(q)), add, mul
    # GF(2^k) via polynomial basis, elements as ints
    k, poly = {4: (2, 0b111), 8: (3, 0b1011)}[q]
    def mul(a, b):
        r = 0
        while b:
            if b & 1: r ^= a
            b >>= 1; a <<= 1
            if a >> k: a ^= poly
        return r
    return list(range(q)), (lambda a, b: a ^ b), mul

def run(q, n):
    F, add, mul = make_field(q)
    nz = [x for x in F if x]
    inv = {x: next(y for y in nz if mul(x, y) == 1) for x in nz}
    mats = [m for m in itertools.product(F, repeat=2 * n) if any(m)]  # row-major n x 2
    def key(X, Y):
        out = []
        for i in range(n):
            for j in range(n):
                x0, x1, y0, y1 = X[2*i], X[2*i+1], Y[2*j], Y[2*j+1]
                out += [mul(x0, y0), add(mul(x0, y1), mul(x1, y0)), mul(x1, y1)]
        return tuple(out)
    fib = {}
    for X in mats:
        for Y in mats:
            fib.setdefault(key(X, Y), []).append((X, Y))
    def scal(c, M): return tuple(mul(c, v) for v in M)
    def rank1_rowspace(M):  # returns normalized row vector l if rank 1 else None
        rows = [M[2*i:2*i+2] for i in range(n)]
        nzr = [r for r in rows if any(r)]
        r0 = nzr[0]
        for r in nzr:
            if mul(r[0], r0[1]) != mul(r[1], r0[0]): return None
        c = inv[r0[0]] if r0[0] else inv[r0[1]]
        return (mul(c, r0[0]), mul(c, r0[1]))
    maxorb, two, bad = 0, 0, 0
    for k, lst in fib.items():
        if not any(k): continue
        seen, orbits = set(), []
        for X, Y in lst:
            if (X, Y) in seen: continue
            orb = {(scal(l, X), scal(inv[l], Y)) for l in nz}
            seen |= orb; orbits.append((X, Y))
        maxorb = max(maxorb, len(orbits))
        if len(orbits) == 2:
            two += 1
            (X, Y), (X2, Y2) = orbits
            l1, l2 = rank1_rowspace(X), rank1_rowspace(Y)
            m1, m2 = rank1_rowspace(X2), rank1_rowspace(Y2)
            ok = None not in (l1, l2, m1, m2) and l1 != l2 and m1 == l2 and m2 == l1
            if not ok: bad += 1
        elif len(orbits) > 2: bad += 1
    return len([k for k in fib if any(k)]), maxorb, two, bad

for q, n in [(4, 2), (7, 2), (8, 2), (4, 3)]:
    res = run(q, n)
    print(f"q={q} n={n}: fibres={res[0]}, max orbits per fibre={res[1]}, fibres with 2 orbits={res[2]}, violations={res[3]}")
    sys.stdout.flush()
