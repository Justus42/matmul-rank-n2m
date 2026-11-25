#!/usr/bin/env python3
"""CNF encoder and decoder for matrix multiplication schemes <n,k,m> over GF(p), p in {2,3}.

Written for job S2-06 (search for a rank-25 scheme of <4,2,4>). Own code, nothing copied.

Encode:
  sat444.py encode --p P --rank R [--n 4 --k 2 --m 4] [--sym none|T] [--fixed F]
                   [--brk] --cnf out.cnf --map out.map

Decode a solver model and verify it independently of the CNF:
  sat444.py decode out.map solver_output.txt > scheme.txt

Conventions as in verfahren/README.md: product r contributes
  w_r[i][l] * (sum_ij u_r[i][j] A[i][j]) * (sum_jl v_r[j][l] B[j][l])  to C[i][l],
and the Brent equations read
  sum_r u_r[i][j] v_r[j'][l] w_r[i'][l'] = [i=i'][j=j'][l=l']   for all six indices.

Element encoding: an element x of GF(p) is a list of p-1 literals; literal c-1 is true
iff x = c (c = 1..p-1); x = 0 iff all are false. At most one is true.

Symmetry T (only for n = m): the involution
  sigma(u, v, w) = (v^T, u^T, w^T)
maps every scheme of <n,k,n> to a scheme of <n,k,n> (C = AB  <=>  C^T = B^T A^T).
A sigma-invariant scheme of rank R consists of F products with sigma(P) = P up to
scaling and (R - F)/2 pairs {P, sigma(P)}. A fixed product satisfies v = lambda u^T,
w = w^T with lambda = +-1; the sign can be moved into w, so v = u^T and w = w^T
without loss of generality (see the report, section 2).

--brk adds one symmetry breaking constraint that is sound for the claim "no scheme of
  this shape": the base products of the pairs are strictly increasing in the lexicographic
  order of their coefficient bit vectors (pairs may be renumbered freely, and two pairs of a
  minimal scheme never share a base product). See versuche/s2-spurB-r2.md, section 2.
"""
import argparse
import itertools
import sys


class CNF:
    def __init__(self):
        self.nv = 0
        self.clauses = []

    def new(self):
        self.nv += 1
        return self.nv

    def add(self, cl):
        self.clauses.append(cl)

    def write(self, path, comments):
        with open(path, "w") as f:
            for c in comments:
                f.write("c " + c + "\n")
            f.write(f"p cnf {self.nv} {len(self.clauses)}\n")
            for cl in self.clauses:
                f.write(" ".join(map(str, cl)) + " 0\n")


def new_elem(cnf, p):
    lits = [cnf.new() for _ in range(p - 1)]
    for a, b in itertools.combinations(lits, 2):
        cnf.add([-a, -b])
    return tuple(lits)


def not_eq(x, a):
    """Literals whose disjunction says x != a (assuming at-most-one on x)."""
    if a == 0:
        return list(x)
    return [-x[a - 1]]


def gate(cnf, p, x, y, op):
    """Return new element z = op(x, y) mod p, defined by the full truth table."""
    z = tuple(cnf.new() for _ in range(p - 1))
    for a in range(p):
        for b in range(p):
            f = op(a, b) % p
            base = not_eq(x, a) + not_eq(y, b)
            for c in range(1, p):
                cnf.add(base + ([z[c - 1]] if c == f else [-z[c - 1]]))
    return z


def fix_value(cnf, x, a):
    for c in range(1, len(x) + 1):
        cnf.add([x[c - 1]] if c == a else [-x[c - 1]])


def lex_less(cnf, xs, ys):
    """Strict lexicographic order xs < ys on bit vectors (lists of literals)."""
    # e_i: prefix up to i-1 equal. Standard encoding with auxiliary equality chain.
    eq_prev = None
    clauses_or = []
    for i, (a, b) in enumerate(zip(xs, ys)):
        lt = cnf.new()  # lt -> prefix equal and a=0, b=1
        cnf.add([-lt, -a])
        cnf.add([-lt, b])
        if eq_prev is not None:
            cnf.add([-lt, eq_prev])
        clauses_or.append(lt)
        e = cnf.new()  # e -> prefix (incl. i) equal
        cnf.add([-e, -a, b])
        cnf.add([-e, a, -b])
        if eq_prev is not None:
            cnf.add([-e, eq_prev])
        eq_prev = e
    cnf.add(clauses_or)


def encode(args):
    n, k, m, p, R = args.n, args.k, args.m, args.p, args.rank
    cnf = CNF()
    # base products
    sym = args.sym
    F = args.fixed if sym == "T" else 0
    if sym == "T":
        assert n == m, "symmetry T needs n = m"
        assert (R - F) % 2 == 0 and F >= 0
        P = (R - F) // 2
    else:
        P = R
    products = []  # list of (u, v, w), each a dict index -> element
    kinds = []
    bases = []
    for r in range(F):
        u = {(i, j): new_elem(cnf, p) for i in range(n) for j in range(k)}
        w = {}
        for i in range(n):
            for l in range(i, m):
                w[(i, l)] = new_elem(cnf, p)
                w[(l, i)] = w[(i, l)]
        v = {(j, l): u[(l, j)] for j in range(k) for l in range(m)}
        products.append((u, v, w))
        kinds.append("fixed")
    for r in range(P):
        u = {(i, j): new_elem(cnf, p) for i in range(n) for j in range(k)}
        v = {(j, l): new_elem(cnf, p) for j in range(k) for l in range(m)}
        w = {(i, l): new_elem(cnf, p) for i in range(n) for l in range(m)}
        products.append((u, v, w))
        kinds.append("base")
        bases.append((u, v, w))
        if sym == "T":
            u2 = {(i, j): v[(j, i)] for i in range(n) for j in range(k)}
            v2 = {(j, l): u[(l, j)] for j in range(k) for l in range(m)}
            w2 = {(i, l): w[(l, i)] for i in range(n) for l in range(m)}
            products.append((u2, v2, w2))
            kinds.append("partner")
    assert len(products) == R

    def flat(prod):
        u, v, w = prod
        out = []
        for key in sorted(u):
            out += list(u[key])
        for key in sorted(v):
            out += list(v[key])
        for key in sorted(w):
            out += list(w[key])
        return out

    if args.brk and len(bases) > 1:
        # Strict lexicographic order on the coefficient bit vectors of the base products.
        # Sound: renumbering the pairs maps solutions to solutions, and two pairs of a
        # scheme of minimal rank never have the same base product.
        for a, b in zip(bases, bases[1:]):
            lex_less(cnf, flat(a), flat(b))

    mul = lambda a, b: a * b
    add = lambda a, b: a + b
    # u*v shared over the w index
    neq = 0
    for i in range(n):
        for j in range(k):
            for j2 in range(k):
                for l in range(m):
                    uv = [gate(cnf, p, pr[0][(i, j)], pr[1][(j2, l)], mul) for pr in products]
                    for i2 in range(n):
                        for l2 in range(m):
                            delta = 1 if (i == i2 and j == j2 and l == l2) else 0
                            acc = None
                            for r, pr in enumerate(products):
                                t = gate(cnf, p, uv[r], pr[2][(i2, l2)], mul)
                                acc = t if acc is None else gate(cnf, p, acc, t, add)
                            fix_value(cnf, acc, delta)
                            neq += 1
    comments = [
        f"S2-06 sat444.py: <{n},{k},{m}> rank {R} over GF({p}), sym={sym}, fixed={F}, pairs={P if sym == 'T' else 0}, brk={args.brk}",
        f"Brent equations: {neq}",
    ]
    cnf.write(args.cnf, comments)
    with open(args.map, "w") as f:
        f.write(f"{n} {k} {m} {R} {p}\n")
        for kind, (u, v, w) in zip(kinds, products):
            parts = []
            for d, rows, cols in ((u, n, k), (v, k, m), (w, n, m)):
                parts.append(" ".join(",".join(map(str, d[(a, b)])) for a in range(rows) for b in range(cols)))
            f.write(kind + " | " + " | ".join(parts) + "\n")
    print(f"vars={cnf.nv} clauses={len(cnf.clauses)} eqs={neq}", file=sys.stderr)


def decode(mapfile, model_file):
    true = set()
    with open(model_file) as f:
        for line in f:
            if line.startswith("v "):
                for x in line.split()[1:]:
                    xi = int(x)
                    if xi > 0:
                        true.add(xi)
            elif line.startswith("s ") and "UNSATISFIABLE" in line:
                print("UNSAT", file=sys.stderr)
                sys.exit(1)

    def val(lits):
        vals = [c + 1 for c, x in enumerate(lits) if x in true]
        assert len(vals) <= 1
        return vals[0] if vals else 0

    with open(mapfile) as f:
        n, k, m, R, p = map(int, f.readline().split())
        prods = []
        for _ in range(R):
            parts = f.readline().strip().split(" | ")[1:]
            prods.append([[val(tuple(map(int, e.split(",")))) for e in part.split()] for part in parts])
    # independent check of the Brent equations
    bad = 0
    for i, j, j2, l, i2, l2 in itertools.product(range(n), range(k), range(k), range(m), range(n), range(m)):
        s = sum(u[i * k + j] * v[j2 * m + l] * w[i2 * m + l2] for u, v, w in prods) % p
        if s != (1 if (i == i2 and j == j2 and l == l2) else 0):
            bad += 1
    if bad:
        print(f"BUG: {bad} equations violated", file=sys.stderr)
        sys.exit(3)
    print(f"{n} {k} {m} {R} {p}")
    for u, v, w in prods:
        print(" ".join(map(str, u)), "|", " ".join(map(str, v)), "|", " ".join(map(str, w)))
    print("OK: all Brent equations hold", file=sys.stderr)


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)
    e = sub.add_parser("encode")
    e.add_argument("--n", type=int, default=4)
    e.add_argument("--k", type=int, default=2)
    e.add_argument("--m", type=int, default=4)
    e.add_argument("--p", type=int, required=True)
    e.add_argument("--rank", type=int, required=True)
    e.add_argument("--sym", default="none", choices=["none", "T"])
    e.add_argument("--fixed", type=int, default=0)
    e.add_argument("--brk", action="store_true")
    e.add_argument("--cnf", required=True)
    e.add_argument("--map", required=True)
    d = sub.add_parser("decode")
    d.add_argument("map")
    d.add_argument("model")
    a = ap.parse_args()
    if a.cmd == "encode":
        assert a.p in (2, 3)
        encode(a)
    else:
        decode(a.map, a.model)


if __name__ == "__main__":
    main()
