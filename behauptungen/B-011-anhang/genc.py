#!/usr/bin/env python3
"""Independent CNF generator for <n,l,m> decompositions over GF(2),
optionally with the transpose symmetry sigma(u,v,w) = (v^T, u^T, w^T) (n == m).

Written by the S2-11 reviewer without looking at sat444.py.

Tensor: T = sum_{i,j,k} a_{ij} (x) b_{jk} (x) c_{ik}.
A decomposition of length R: sum_r u_r (x) v_r (x) w_r = T over GF(2),
u_r in GF(2)^{n x l}, v_r in GF(2)^{l x m}, w_r in GF(2)^{n x m}.

Usage:
  genc.py encode n l m R [--sym F] [--lex] --cnf X.cnf --map X.json
  genc.py decode X.json SOLVER_OUTPUT     (verifies the scheme independently)
"""
import argparse, itertools, json, sys


class CNF:
    def __init__(self):
        self.nv = 0
        self.cl = []

    def new(self):
        self.nv += 1
        return self.nv

    def add(self, c):
        self.cl.append(c)


def idx_A(n, l, m):
    return [(i, j) for i in range(n) for j in range(l)]


def idx_B(n, l, m):
    return [(j, k) for j in range(l) for k in range(m)]


def idx_C(n, l, m):
    return [(i, k) for i in range(n) for k in range(m)]


def target(n, l, m):
    """T[a][b][c] as a dict over index tuples."""
    T = {}
    for a in idx_A(n, l, m):
        for b in idx_B(n, l, m):
            for c in idx_C(n, l, m):
                i, j = a
                j2, k = b
                i2, k2 = c
                T[(a, b, c)] = 1 if (j == j2 and i == i2 and k == k2) else 0
    return T


PI = None  # permutation of the middle index; None = identity (M = I)


def pi(j):
    return j if PI is None else PI[j]


def sigma(n, l, m, u, v, w):
    """sigma_M(u,v,w) = (v^T M, M^{-1} u^T, w^T) with M the permutation matrix
    of PI (M[t][j] = 1 iff t = pi(j)); PI = None gives (v^T, u^T, w^T)."""
    assert n == m
    u2 = {(i, j): v[(pi(j), i)] for (i, j) in idx_A(n, l, m)}
    v2 = {(j, k): u[(k, pi(j))] for (j, k) in idx_B(n, l, m)}
    w2 = {(i, k): w[(k, i)] for (i, k) in idx_C(n, l, m)}
    return u2, v2, w2


def check_sigma_invariance(n, l, m):
    """Check sigma(T) == T, by applying sigma to each elementary term."""
    terms = set()
    for i in range(n):
        for j in range(l):
            for k in range(m):
                terms.add(((i, j), (j, k), (i, k)))
    for (a, b, c) in terms:
        u = {x: int(x == a) for x in idx_A(n, l, m)}
        v = {x: int(x == b) for x in idx_B(n, l, m)}
        w = {x: int(x == c) for x in idx_C(n, l, m)}
        u2, v2, w2 = sigma(n, l, m, u, v, w)
        a2 = [x for x in u2 if u2[x]]
        b2 = [x for x in v2 if v2[x]]
        c2 = [x for x in w2 if w2[x]]
        assert len(a2) == len(b2) == len(c2) == 1
        assert (a2[0], b2[0], c2[0]) in terms, "sigma does not preserve T"
    return True


def encode(n, l, m, R, fixed, lex, cnfpath, mappath):
    S = CNF()
    IA, IB, IC = idx_A(n, l, m), idx_B(n, l, m), idx_C(n, l, m)
    slots = []  # each slot: (u, v, w) dicts of variable ids
    kinds = []
    bases = []
    if fixed is None:
        for r in range(R):
            u = {x: S.new() for x in IA}
            v = {x: S.new() for x in IB}
            w = {x: S.new() for x in IC}
            slots.append((u, v, w)); kinds.append("free")
            bases.append(r)
    else:
        assert n == m
        check_sigma_invariance(n, l, m)
        assert (R - fixed) % 2 == 0 and 0 <= fixed <= R
        # fixed slots: sigma(t) = t, i.e. u = v^T, w = w^T (over GF(2) no scalars)
        for r in range(fixed):
            u = {x: S.new() for x in IA}
            v = {(j, k): u[(k, pi(j))] for (j, k) in IB}
            w = {}
            for (i, k) in IC:
                if (k, i) in w:
                    w[(i, k)] = w[(k, i)]
                else:
                    w[(i, k)] = S.new()
            # sanity: sigma maps the slot onto itself literally
            assert sigma(n, l, m, u, v, w) == (u, v, w)
            slots.append((u, v, w)); kinds.append("fix")
        for p in range((R - fixed) // 2):
            u = {x: S.new() for x in IA}
            v = {x: S.new() for x in IB}
            w = {x: S.new() for x in IC}
            slots.append((u, v, w)); kinds.append("base")
            bases.append(len(slots) - 1)
            slots.append(sigma(n, l, m, u, v, w)); kinds.append("partner")
    assert len(slots) == R

    # Brent equations
    T = target(n, l, m)
    for a in IA:
        for b in IB:
            uv = []
            for (u, v, w) in slots:
                y = S.new()  # y <-> u[a] & v[b]
                S.add([-y, u[a]]); S.add([-y, v[b]]); S.add([y, -u[a], -v[b]])
                uv.append(y)
            for c in IC:
                ts = []
                for r, (u, v, w) in enumerate(slots):
                    t = S.new()  # t <-> uv & w[c]
                    S.add([-t, uv[r]]); S.add([-t, w[c]]); S.add([t, -uv[r], -w[c]])
                    ts.append(t)
                # XOR chain: acc_0 = ts[0]; acc_{q} = acc_{q-1} xor ts[q]
                acc = ts[0]
                for t in ts[1:]:
                    z = S.new()
                    # z <-> acc xor t
                    S.add([-z, acc, t]); S.add([-z, -acc, -t])
                    S.add([z, -acc, t]); S.add([z, acc, -t])
                    acc = z
                S.add([acc] if T[(a, b, c)] else [-acc])

    # optional strict lex order of pair bases (or of all products if no sym)
    if lex and len(bases) > 1:
        def vec(s):
            u, v, w = slots[s]
            # deliberately: w first, then v, then u
            return [w[x] for x in IC] + [v[x] for x in IB] + [u[x] for x in IA]
        for s1, s2 in zip(bases, bases[1:]):
            x, y = vec(s1), vec(s2)
            eq = None  # None means "true"
            for xt, yt in zip(x, y):
                # if equal so far then x_t <= y_t
                S.add(([-eq] if eq else []) + [-xt, yt])
                e2 = S.new()
                # eq & (x_t == y_t) -> e2
                S.add(([-eq] if eq else []) + [xt, yt, e2])
                S.add(([-eq] if eq else []) + [-xt, -yt, e2])
                eq = e2
            S.add([-eq])  # strict

    with open(cnfpath, "w") as f:
        f.write(f"p cnf {S.nv} {len(S.cl)}\n")
        for c in S.cl:
            f.write(" ".join(map(str, c)) + " 0\n")
    ser = lambda d: [[list(k), val] for k, val in d.items()]
    with open(mappath, "w") as f:
        json.dump({"n": n, "l": l, "m": m, "R": R, "fixed": fixed, "pi": PI,
                   "slots": [[ser(u), ser(v), ser(w)] for (u, v, w) in slots],
                   "kinds": kinds}, f)
    print(f"vars={S.nv} clauses={len(S.cl)}")


def decode(mappath, solpath):
    M = json.load(open(mappath))
    n, l, m = M["n"], M["l"], M["m"]
    global PI
    PI = M.get("pi")
    val = {}
    for line in open(solpath):
        if line.startswith("v "):
            for x in line.split()[1:]:
                x = int(x)
                if x != 0:
                    val[abs(x)] = 1 if x > 0 else 0
    sch = []
    for (u, v, w) in M["slots"]:
        sch.append(tuple({tuple(k): val.get(var, 0) for k, var in d} for d in (u, v, w)))
    T = target(n, l, m)
    bad = 0
    for (a, b, c), t in T.items():
        s = sum(u[a] * v[b] * w[c] for (u, v, w) in sch) % 2
        bad += (s != t)
    print("brent_violations", bad)
    if M["fixed"] is not None:
        # independent check of the symmetry: multiset of sigma-images equals the scheme
        key = lambda t: tuple(tuple(sorted(d.items())) for d in t)
        A = sorted(key(t) for t in sch)
        B = sorted(key(sigma(n, l, m, *t)) for t in sch)
        print("sigma_invariant", A == B,
              "fixed_points", sum(key(t) == key(sigma(n, l, m, *t)) for t in sch))
    for (u, v, w) in sch:
        print("U", "".join(str(u[x]) for x in idx_A(n, l, m)),
              "V", "".join(str(v[x]) for x in idx_B(n, l, m)),
              "W", "".join(str(w[x]) for x in idx_C(n, l, m)))
    return bad == 0


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    sp = ap.add_subparsers(dest="cmd")
    e = sp.add_parser("encode")
    e.add_argument("n", type=int); e.add_argument("l", type=int); e.add_argument("m", type=int)
    e.add_argument("R", type=int)
    e.add_argument("--sym", type=int, default=None, help="number of fixed products")
    e.add_argument("--lex", action="store_true")
    e.add_argument("--swapmid", action="store_true", help="M = [[0,1],[1,0]] (only l == 2)")
    e.add_argument("--cnf", required=True); e.add_argument("--map", required=True)
    d = sp.add_parser("decode")
    d.add_argument("map"); d.add_argument("sol")
    a = ap.parse_args()
    if a.cmd == "encode":
        if a.swapmid:
            assert a.l == 2
            PI = [1, 0]
        encode(a.n, a.l, a.m, a.R, a.sym, a.lex, a.cnf, a.map)
    else:
        sys.exit(0 if decode(a.map, a.sol) else 1)
