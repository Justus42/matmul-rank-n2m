"""Brent-equation SAT encoder over GF(2) for <n,k,m> with optionally fixed coefficients.

Coefficient layout follows verfahren/README.md: u is n x k, v is k x m, w is n x m (not transposed).
A fixed coefficient is given as 0/1; a free one as None.
"""
import itertools, random
from pysat.solvers import Cadical153


class Enc:
    def __init__(self, native_xor=False):
        self.nv = 0
        self.native = native_xor
        self.xors = []
        self.clauses = []
        self.andcache = {}

    def new(self):
        self.nv += 1
        return self.nv

    def AND(self, lits):
        lits = tuple(sorted(set(lits)))
        if len(lits) == 1:
            return lits[0]
        if lits in self.andcache:
            return self.andcache[lits]
        a = self.new()
        for l in lits:
            self.clauses.append([-a, l])
        self.clauses.append([a] + [-l for l in lits])
        self.andcache[lits] = a
        return a

    def xor_eq(self, lits, rhs):
        """XOR of lits == rhs (0/1)."""
        lits = list(lits)
        if self.native and lits:
            self.xors.append((lits, rhs))
            return
        if not lits:
            if rhs:
                self.clauses.append([])  # unsat
            return
        while len(lits) > 4:
            chunk, lits = lits[:3], lits[3:]
            t = self.new()
            self._xor_small(chunk + [t], 0)  # t = xor(chunk)
            lits.append(t)
        self._xor_small(lits, rhs)

    def _xor_small(self, lits, rhs):
        n = len(lits)
        for signs in itertools.product([0, 1], repeat=n):
            # forbid assignments with parity != rhs; assignment bit b_i = signs[i]
            if sum(signs) % 2 != rhs:
                self.clauses.append([(-l if s else l) for l, s in zip(lits, signs)])


def build(n, k, m, r, fixed=None, enc=None):
    """fixed: optional dict (t,'u'|'v'|'w',a,b) -> 0/1. Returns (enc, var maps)."""
    fixed = fixed or {}
    enc = enc or Enc()
    U, V, W = {}, {}, {}
    for t in range(r):
        for i in range(n):
            for j in range(k):
                U[t, i, j] = fixed.get((t, 'u', i, j), None)
                if U[t, i, j] is None:
                    U[t, i, j] = ('v', enc.new())
        for j in range(k):
            for l in range(m):
                V[t, j, l] = fixed.get((t, 'v', j, l), None)
                if V[t, j, l] is None:
                    V[t, j, l] = ('v', enc.new())
        for i in range(n):
            for l in range(m):
                W[t, i, l] = fixed.get((t, 'w', i, l), None)
                if W[t, i, l] is None:
                    W[t, i, l] = ('v', enc.new())
    for i, j, j2, l, i2, l2 in itertools.product(range(n), range(k), range(k), range(m), range(n), range(m)):
        rhs = 1 if (i == i2 and j == j2 and l == l2) else 0
        lits = []
        for t in range(r):
            fac = [U[t, i, j], V[t, j2, l], W[t, i2, l2]]
            if any(f == 0 for f in fac):
                continue
            vs = [f[1] for f in fac if f != 1]
            if not vs:
                rhs ^= 1
                continue
            lits.append(enc.AND(vs))
        enc.xor_eq(lits, rhs)
    return enc, (U, V, W)


def decode(model, n, k, m, r, maps):
    U, V, W = maps
    s = set(l for l in model if l > 0)
    val = lambda x: x if x in (0, 1) else (1 if x[1] in s else 0)
    prods = []
    for t in range(r):
        u = [[val(U[t, i, j]) for j in range(k)] for i in range(n)]
        v = [[val(V[t, j, l]) for l in range(m)] for j in range(k)]
        w = [[val(W[t, i, l]) for l in range(m)] for i in range(n)]
        prods.append((u, v, w))
    return prods


def check(prods, n, k, m, p=2):
    for i, j, j2, l, i2, l2 in itertools.product(range(n), range(k), range(k), range(m), range(n), range(m)):
        s = sum(u[i][j] * v[j2][l] * w[i2][l2] for u, v, w in prods) % p
        if s != (1 if (i == i2 and j == j2 and l == l2) else 0) % p:
            return False
    return True
