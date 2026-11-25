"""Exact finite-field arithmetic for the S2-09 check (written independently of versuche/s2-spurA-r2).

Two fields:
  PrimeField(p)  : Z/p, used for schemes over Z (p = 2^61 - 1)
  GF2k(k, poly)  : GF(2^k), used for schemes over GF(2); poly is checked for irreducibility (Rabin test)
Linear algebra: rank, nullspace (right kernel) by Gaussian elimination.
"""
import random


class PrimeField:
    def __init__(self, p):
        self.p = p
        self.char = p

    def add(self, a, b):
        return (a + b) % self.p

    def sub(self, a, b):
        return (a - b) % self.p

    def neg(self, a):
        return (-a) % self.p

    def mul(self, a, b):
        return (a * b) % self.p

    def inv(self, a):
        assert a % self.p != 0
        return pow(a, self.p - 2, self.p)

    def from_int(self, n):
        return n % self.p

    def rand(self, rng):
        return rng.randrange(self.p)


def _clmul(a, b):
    r = 0
    while b:
        if b & 1:
            r ^= a
        a <<= 1
        b >>= 1
    return r


def _pmod(a, m):
    dm = m.bit_length()
    while a.bit_length() >= dm:
        a ^= m << (a.bit_length() - dm)
    return a


def _pgcd(a, b):
    while b:
        a, b = b, _pmod(a, b)
    return a


class GF2k:
    def __init__(self, k, poly):
        self.k = k
        self.poly = poly
        self.char = 2
        assert poly.bit_length() == k + 1
        assert self._irreducible(), "modulus is not irreducible"

    def _powx2(self, e):
        # x^(2^e) mod poly
        r = 2
        for _ in range(e):
            r = _pmod(_clmul(r, r), self.poly)
        return r

    def _irreducible(self):
        k = self.k
        if self._powx2(k) != 2:
            return False
        primes = [q for q in range(2, k + 1) if k % q == 0 and all(q % d for d in range(2, q))]
        for q in primes:
            h = self._powx2(k // q) ^ 2
            if _pgcd(self.poly, h) != 1:
                return False
        return True

    def add(self, a, b):
        return a ^ b

    sub = add

    def neg(self, a):
        return a

    def mul(self, a, b):
        return _pmod(_clmul(a, b), self.poly)

    def inv(self, a):
        assert a != 0
        # a^(2^k - 2)
        r, base, e = 1, a, (1 << self.k) - 2
        while e:
            if e & 1:
                r = self.mul(r, base)
            base = self.mul(base, base)
            e >>= 1
        return r

    def from_int(self, n):
        return n & 1

    def rand(self, rng):
        return rng.randrange(1 << self.k)


def rref(F, rows, ncols):
    """Row-reduce a copy of rows (list of lists). Returns (reduced rows, pivot columns)."""
    M = [list(r) for r in rows]
    piv = []
    rr = 0
    for c in range(ncols):
        if rr >= len(M):
            break
        sel = None
        for i in range(rr, len(M)):
            if M[i][c] != 0:
                sel = i
                break
        if sel is None:
            continue
        M[rr], M[sel] = M[sel], M[rr]
        iv = F.inv(M[rr][c])
        M[rr] = [F.mul(iv, x) for x in M[rr]]
        for i in range(len(M)):
            if i != rr and M[i][c] != 0:
                f = M[i][c]
                M[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(M[i], M[rr])]
        piv.append(c)
        rr += 1
    return M[:rr], piv


def rank(F, rows, ncols=None):
    if not rows:
        return 0
    if ncols is None:
        ncols = len(rows[0])
    return len(rref(F, rows, ncols)[1])


def nullspace(F, rows, ncols):
    """Basis of {x : rows * x = 0}."""
    R, piv = rref(F, rows, ncols) if rows else ([], [])
    free = [c for c in range(ncols) if c not in piv]
    basis = []
    for f in free:
        x = [0] * ncols
        x[f] = F.from_int(1)
        for i, p in enumerate(piv):
            x[p] = F.neg(R[i][f])
        basis.append(x)
    return basis


def det(F, M):
    n = len(M)
    A = [list(r) for r in M]
    d = F.from_int(1)
    for c in range(n):
        sel = None
        for i in range(c, n):
            if A[i][c] != 0:
                sel = i
                break
        if sel is None:
            return 0
        if sel != c:
            A[c], A[sel] = A[sel], A[c]
            d = F.neg(d)
        d = F.mul(d, A[c][c])
        iv = F.inv(A[c][c])
        for i in range(c + 1, n):
            if A[i][c] != 0:
                f = F.mul(A[i][c], iv)
                A[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(A[i], A[c])]
    return d


P61 = (1 << 61) - 1
# x^32 + x^22 + x^2 + x + 1
POLY32 = (1 << 32) | (1 << 22) | (1 << 2) | (1 << 1) | 1


class GFpk:
    """GF(p^k) for small p, elements as tuples of k coefficients (low degree first).
    The modulus is found by a seeded random search and checked by the Rabin irreducibility test."""

    def __init__(self, p, k, seed=1):
        self.p, self.k, self.char = p, k, p
        rng = random.Random(seed)
        while True:
            m = [rng.randrange(p) for _ in range(k)] + [1]
            if m[0] and self._irred(m):
                break
        self.mod = m

    # polynomial helpers on lists (low degree first)
    def _trim(self, a):
        while a and a[-1] == 0:
            a.pop()
        return a

    def _pmul(self, a, b):
        if not a or not b:
            return []
        r = [0] * (len(a) + len(b) - 1)
        for i, x in enumerate(a):
            if x:
                for j, y in enumerate(b):
                    r[i + j] = (r[i + j] + x * y) % self.p
        return self._trim(r)

    def _pmod(self, a, m):
        a = list(a)
        dm = len(m) - 1
        inv = pow(m[-1], self.p - 2, self.p)
        while len(a) - 1 >= dm and a:
            c = (a[-1] * inv) % self.p
            sh = len(a) - 1 - dm
            for i, y in enumerate(m):
                a[sh + i] = (a[sh + i] - c * y) % self.p
            self._trim(a)
        return a

    def _pgcd(self, a, b):
        a, b = self._trim(list(a)), self._trim(list(b))
        while b:
            a, b = b, self._pmod(a, b)
        return a

    def _xpow(self, e, m):
        # x^(p^e) mod m
        r = [0, 1]
        for _ in range(e):
            base, res, n = r, [1], self.p
            while n:
                if n & 1:
                    res = self._pmod(self._pmul(res, base), m)
                base = self._pmod(self._pmul(base, base), m)
                n >>= 1
            r = res
        return r

    def _irred(self, m):
        k = len(m) - 1
        x = [0, 1]
        if self._trim(self._pmod(self._sub(self._xpow(k, m), x), m)):
            return False
        for q in [q for q in range(2, k + 1) if k % q == 0 and all(q % d for d in range(2, q))]:
            g = self._pgcd(m, self._sub(self._xpow(k // q, m), x))
            if len(g) > 1:
                return False
        return True

    def _sub(self, a, b):
        n = max(len(a), len(b))
        a = list(a) + [0] * (n - len(a))
        b = list(b) + [0] * (n - len(b))
        return self._trim([(x - y) % self.p for x, y in zip(a, b)])

    # field interface; 0 is the int 0, other elements are tuples
    def _norm(self, a):
        a = self._trim(list(a))
        return tuple(a) if a else 0

    def _l(self, a):
        return [] if a == 0 else list(a)

    def add(self, a, b):
        n = self.k
        x, y = self._l(a), self._l(b)
        x += [0] * (n - len(x)); y += [0] * (n - len(y))
        return self._norm([(u + v) % self.p for u, v in zip(x, y)])

    def neg(self, a):
        return self._norm([(-u) % self.p for u in self._l(a)])

    def sub(self, a, b):
        return self.add(a, self.neg(b))

    def mul(self, a, b):
        if a == 0 or b == 0:
            return 0
        return self._norm(self._pmod(self._pmul(list(a), list(b)), self.mod))

    def inv(self, a):
        assert a != 0
        e = self.p ** self.k - 2
        r, base = (1,), a
        while e:
            if e & 1:
                r = self.mul(r, base)
            base = self.mul(base, base)
            e >>= 1
        return r

    def from_int(self, n):
        return self._norm([n % self.p])

    def rand(self, rng):
        return self._norm([rng.randrange(self.p) for _ in range(self.k)])
