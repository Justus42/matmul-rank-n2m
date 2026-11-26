#!/usr/bin/env python3
"""CNF encoder/decoder for <3,2,m> schemes over GF(2) with the normal-form ansatz (S4-08).

encode: python3 sat327.py encode OUT.cnf --m 7 --rank 34 [--sn1] [--k1] [--k2] [--lex]
decode: python3 sat327.py decode OUT.cnf SOLVER_OUTPUT OUT.json
        (re-checks all Brent equations over GF(2) with plain integers, independent of the CNF)

Variables: u_r[i][j] (3x2, A side), v_r[j][l] (2xm, B side), w_r[i][l] (3xm, C side, not
transposed). Brent: XOR_r u_r[i][j] v_r[j'][l] w_r[i'][l'] = [i=i'][j=j'][l=l'].

Ansatz (report, Section 3), 0-based column indices, e7 -> l = m-1, e6 -> m-2, e5 -> m-3:
  --sn1 : u_r[0][0] = 1 for all r
  --k1  : v_r[1][m-2] = u_r[1][0] AND v_r[1][m-1];  v_r[1][m-3] = u_r[2][0] AND v_r[1][m-1]
  --k2  : over GF(2) only the mixed vector (lam*mu*kap)_r has to lie in col(M), M[r][l] = v_r[1][l]
          (lam^2 kap = lam kap and mu^2 kap = mu kap are columns of M by --k1):
          exists y in GF(2)^m with XOR_l v_r[1][l] y_l = u_r[1][0] u_r[2][0] v_r[1][m-1] for all r
  --lex : products sorted lexicographically (non-strict) by the bit vector (u, v), which
          only removes permutations of the products.
"""
import json
import sys


class CNF:
    def __init__(self):
        self.n = 0
        self.clauses = []

    def var(self):
        self.n += 1
        return self.n

    def add(self, c):
        self.clauses.append(c)

    def AND(self, a, b):
        z = self.var()
        self.add([-z, a])
        self.add([-z, b])
        self.add([z, -a, -b])
        return z

    def XOR(self, a, b):
        z = self.var()
        self.add([-z, a, b])
        self.add([-z, -a, -b])
        self.add([z, -a, b])
        self.add([z, a, -b])
        return z

    def EQ_AND(self, z, a, b):
        self.add([-z, a])
        self.add([-z, b])
        self.add([z, -a, -b])

    def xor_chain_equal(self, lits, val):
        if not lits:
            assert val == 0
            return
        acc = lits[0]
        for x in lits[1:]:
            acc = self.XOR(acc, x)
        self.add([acc] if val else [-acc])

    def lex_leq(self, a, b):
        """a <=_lex b for bit vectors (MSB first)."""
        # e_k: prefixes equal up to k
        eq = None
        for i, (x, y) in enumerate(zip(a, b)):
            # if prefix equal then x <= y : clause (-eq, -x, y)
            if eq is None:
                self.add([-x, y])
            else:
                self.add([-eq, -x, y])
            if i == len(a) - 1:
                break
            e = self.var()
            # e -> prefix eq and x == y ; only need e <- (eq and x==y)
            if eq is None:
                self.add([e, x, y])
                self.add([e, -x, -y])
            else:
                self.add([e, -eq, x, y])
                self.add([e, -eq, -x, -y])
            eq = e


def build(m, R, sn1, k1, k2, lex):
    n, k = 3, 2
    c = CNF()
    U = [[[c.var() for j in range(k)] for i in range(n)] for r in range(R)]
    V = [[[c.var() for l in range(m)] for j in range(k)] for r in range(R)]
    W = [[[c.var() for l in range(m)] for i in range(n)] for r in range(R)]
    meta = {"m": m, "R": R, "U": U, "V": V, "W": W, "sn1": sn1, "k1": k1, "k2": k2, "lex": lex}
    if sn1:
        for r in range(R):
            c.add([U[r][0][0]])
    if k1:
        for r in range(R):
            c.EQ_AND(V[r][1][m - 2], U[r][1][0], V[r][1][m - 1])
            c.EQ_AND(V[r][1][m - 3], U[r][2][0], V[r][1][m - 1])
    if k2:
        y = [c.var() for l in range(m)]
        meta["y"] = y
        for r in range(R):
            lm = c.AND(U[r][1][0], U[r][2][0])
            rhs = c.AND(lm, V[r][1][m - 1])
            lits = [c.AND(V[r][1][l], y[l]) for l in range(m)]
            # XOR(lits) xor rhs = 0
            c.xor_chain_equal(lits + [rhs], 0)
    # Brent equations
    PUV = {}
    for r in range(R):
        for i in range(n):
            for j in range(k):
                for jp in range(k):
                    for l in range(m):
                        PUV[r, i, j, jp, l] = c.AND(U[r][i][j], V[r][jp][l])
    for i in range(n):
        for j in range(k):
            for jp in range(k):
                for l in range(m):
                    for ip in range(n):
                        for lp in range(m):
                            val = 1 if (i == ip and j == jp and l == lp) else 0
                            lits = [c.AND(PUV[r, i, j, jp, l], W[r][ip][lp]) for r in range(R)]
                            c.xor_chain_equal(lits, val)
    if lex:
        for r in range(R - 1):
            a = [x for row in U[r] for x in row] + [x for row in V[r] for x in row]
            b = [x for row in U[r + 1] for x in row] + [x for row in V[r + 1] for x in row]
            c.lex_leq(a, b)
    return c, meta


def encode(argv):
    out = argv[0]
    opts = argv[1:]
    m = int(opts[opts.index("--m") + 1])
    R = int(opts[opts.index("--rank") + 1])
    c, meta = build(m, R, "--sn1" in opts, "--k1" in opts, "--k2" in opts, "--lex" in opts)
    with open(out, "w") as f:
        f.write(f"p cnf {c.n} {len(c.clauses)}\n")
        for cl in c.clauses:
            f.write(" ".join(map(str, cl)) + " 0\n")
    json.dump(meta, open(out + ".map.json", "w"))
    print(f"{out}: vars={c.n} clauses={len(c.clauses)}")


def decode(argv):
    cnf, solout, outjson = argv
    meta = json.load(open(cnf + ".map.json"))
    val = {}
    for line in open(solout):
        if line.startswith("v "):
            for t in line.split()[1:]:
                x = int(t)
                if x:
                    val[abs(x)] = 1 if x > 0 else 0
    m, R = meta["m"], meta["R"]
    g = lambda v: val.get(v, 0)
    prods = []
    for r in range(R):
        u = [[g(x) for x in row] for row in meta["U"][r]]
        v = [[g(x) for x in row] for row in meta["V"][r]]
        w = [[g(x) for x in row] for row in meta["W"][r]]
        prods.append((u, v, w))
    bad = 0
    for i in range(3):
        for j in range(2):
            for jp in range(2):
                for l in range(m):
                    for ip in range(3):
                        for lp in range(m):
                            s = sum(p[0][i][j] * p[1][jp][l] * p[2][ip][lp] for p in prods) % 2
                            want = 1 if (i == ip and j == jp and l == lp) else 0
                            bad += s != want
    print(f"Brent equations violated over GF(2): {bad}")
    d = {"n": 3, "k": 2, "m": m, "rank": R, "ring": "GF(2)",
         "products": [{"u": [[str(x) for x in row] for row in u], "v": [[str(x) for x in row] for row in v],
                       "w": [[str(x) for x in row] for row in w]} for u, v, w in prods]}
    json.dump(d, open(outjson, "w"))
    return bad


if __name__ == "__main__":
    if sys.argv[1] == "encode":
        encode(sys.argv[2:])
    else:
        sys.exit(1 if decode(sys.argv[2:]) else 0)
