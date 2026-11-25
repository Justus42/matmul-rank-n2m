"""Exact finite-field arithmetic and linear algebra (no floating point).

Two fields:
  PrimeField(P)  : Z/P, P prime (default 2^61-1), characteristic != 2
  GF2k()         : GF(2^31) with modulus x^31 + x^3 + 1 (primitive trinomial), characteristic 2
Elements are Python ints. Only what the analysis needs.
"""
import random


class PrimeField:
    def __init__(self, P=(1 << 61) - 1):
        self.P = P
        self.char = P

    def add(self, a, b): return (a + b) % self.P
    def sub(self, a, b): return (a - b) % self.P
    def neg(self, a): return (-a) % self.P
    def mul(self, a, b): return (a * b) % self.P
    def inv(self, a):
        assert a % self.P
        return pow(a, self.P - 2, self.P)
    def from_int(self, z): return z % self.P
    def rand(self): return random.randrange(self.P)


class GF2k:
    K = 31
    MOD = (1 << 31) | (1 << 3) | 1

    def __init__(self):
        self.char = 2

    def add(self, a, b): return a ^ b
    sub = add
    def neg(self, a): return a
    def mul(self, a, b):
        r = 0
        while b:
            if b & 1:
                r ^= a
            b >>= 1
            a <<= 1
            if a >> self.K:
                a ^= self.MOD
        return r
    def inv(self, a):
        assert a
        e = (1 << self.K) - 2
        r, x = 1, a
        while e:
            if e & 1:
                r = self.mul(r, x)
            x = self.mul(x, x)
            e >>= 1
        return r
    def from_int(self, z): return z & 1
    def rand(self): return random.randrange(1 << self.K)


def rank(F, rows):
    """Rank of a matrix given as list of rows (lists of field elements)."""
    M = [list(r) for r in rows if any(r)]
    if not M:
        return 0
    ncol = len(M[0])
    r = 0
    for c in range(ncol):
        piv = next((i for i in range(r, len(M)) if M[i][c]), None)
        if piv is None:
            continue
        M[r], M[piv] = M[piv], M[r]
        iv = F.inv(M[r][c])
        M[r] = [F.mul(iv, x) for x in M[r]]
        for i in range(len(M)):
            if i != r and M[i][c]:
                f = M[i][c]
                M[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(M[i], M[r])]
        r += 1
        if r == len(M):
            break
    return r


def left_kernel(F, rows):
    """Basis of {s : sum_t s_t rows[t] = 0}."""
    n = len(rows)
    ncol = len(rows[0])
    # augment with identity, row reduce
    M = [list(rows[t]) + [1 if j == t else 0 for j in range(n)] for t in range(n)]
    r = 0
    for c in range(ncol):
        piv = next((i for i in range(r, n) if M[i][c]), None)
        if piv is None:
            continue
        M[r], M[piv] = M[piv], M[r]
        iv = F.inv(M[r][c])
        M[r] = [F.mul(iv, x) for x in M[r]]
        for i in range(n):
            if i != r and M[i][c]:
                f = M[i][c]
                M[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(M[i], M[r])]
        r += 1
    return [row[ncol:] for row in M[r:]]


def transpose(M):
    return [list(c) for c in zip(*M)]
