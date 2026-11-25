"""Small exact finite fields GF(p^k) for the S2-23 checks (own code, no external sources)."""
import itertools

class GF:
    """GF(p^k) with elements encoded as integers 0..q-1 (base-p digits = coefficients)."""
    def __init__(self, p, k=1, modpoly=None):
        self.p, self.k, self.q = p, k, p ** k
        self.mod = modpoly  # list of k+1 coefficients, low to high, monic
        q = self.q
        self.add_t = [[self._add(a, b) for b in range(q)] for a in range(q)]
        self.mul_t = [[self._mul(a, b) for b in range(q)] for a in range(q)]
        self.neg_t = [self._neg(a) for a in range(q)]
        self.inv_t = [0] * q
        for a in range(1, q):
            for b in range(1, q):
                if self.mul_t[a][b] == 1:
                    self.inv_t[a] = b
        assert all(self.inv_t[a] for a in range(1, q)), "not a field"

    def _digits(self, a):
        return [(a // self.p ** i) % self.p for i in range(self.k)]

    def _num(self, d):
        return sum(c * self.p ** i for i, c in enumerate(d))

    def _add(self, a, b):
        return self._num([(x + y) % self.p for x, y in zip(self._digits(a), self._digits(b))])

    def _neg(self, a):
        return self._num([(-x) % self.p for x in self._digits(a)])

    def _mul(self, a, b):
        da, db = self._digits(a), self._digits(b)
        prod = [0] * (2 * self.k)
        for i, x in enumerate(da):
            for j, y in enumerate(db):
                prod[i + j] = (prod[i + j] + x * y) % self.p
        if self.k > 1:
            for deg in range(2 * self.k - 1, self.k - 1, -1):
                c = prod[deg]
                if c:
                    for i in range(self.k + 1):
                        prod[deg - self.k + i] = (prod[deg - self.k + i] - c * self.mod[i]) % self.p
        return self._num(prod[: self.k])

    def add(self, a, b): return self.add_t[a][b]
    def sub(self, a, b): return self.add_t[a][self.neg_t[b]]
    def mul(self, a, b): return self.mul_t[a][b]
    def inv(self, a): return self.inv_t[a]
    def elems(self): return range(self.q)


def fields():
    return {
        "GF(2)": GF(2), "GF(3)": GF(3), "GF(5)": GF(5), "GF(7)": GF(7),
        "GF(4)": GF(2, 2, [1, 1, 1]),          # x^2 + x + 1
        "GF(8)": GF(2, 3, [1, 1, 0, 1]),       # x^3 + x + 1
        "GF(9)": GF(3, 2, [1, 0, 1]),          # x^2 + 1 (irreducible mod 3)
    }


def rank(F, M):
    """Rank of a matrix (list of rows) over F, Gauss elimination."""
    M = [row[:] for row in M]
    r = 0
    rows, cols = len(M), len(M[0]) if M else 0
    for c in range(cols):
        piv = next((i for i in range(r, rows) if M[i][c]), None)
        if piv is None:
            continue
        M[r], M[piv] = M[piv], M[r]
        iv = F.inv(M[r][c])
        M[r] = [F.mul(iv, x) for x in M[r]]
        for i in range(rows):
            if i != r and M[i][c]:
                f = M[i][c]
                M[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(M[i], M[r])]
        r += 1
    return r
