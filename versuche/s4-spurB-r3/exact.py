#!/usr/bin/env python3
"""Exact helpers (fractions.Fraction only, no floats) for <3,2,m> schemes (S4-16).

scheme = list of products (u, v, w), u: 3x2, v: 2xm, w: 3xm, entries Fraction.
"""
import json
from fractions import Fraction

n, k = 3, 2


def brent_errors(scheme, m):
    """Number of violated Brent equations, computed exactly."""
    bad = 0
    for i in range(n):
        for j in range(k):
            for j2 in range(k):
                for l in range(m):
                    for i2 in range(n):
                        for l2 in range(m):
                            s = Fraction(0)
                            for (u, v, w) in scheme:
                                a = u[i][j]
                                if a:
                                    b = v[j2][l]
                                    if b:
                                        c = w[i2][l2]
                                        if c:
                                            s += a * b * c
                            want = 1 if (i == i2 and j == j2 and l == l2) else 0
                            if s != want:
                                bad += 1
    return bad


def load_json(path):
    with open(path, encoding="utf-8") as fh:
        d = json.load(fh)
    conv = lambda M: [[Fraction(x) for x in row] for row in M]
    sch = [(conv(p["u"]), conv(p["v"]), conv(p["w"])) for p in d["products"]]
    return d, sch


def fstr(x):
    x = Fraction(x)
    return str(x.numerator) if x.denominator == 1 else f"{x.numerator}/{x.denominator}"


def check_k1(scheme, m):
    """(SN1) with scaling and (K1) exactly: u[0][0] = 1, v[1][m-2] = kappa u[1][0],
    v[1][m-3] = kappa u[2][0] with kappa = v[1][m-1]."""
    sn1 = all(u[0][0] == 1 for (u, v, w) in scheme)
    k1 = all(v[1][m - 2] == v[1][m - 1] * u[1][0] and v[1][m - 3] == v[1][m - 1] * u[2][0]
             for (u, v, w) in scheme)
    return sn1, k1


def solve_linear(rows, rhs):
    """Solve rows * x = rhs exactly (Fractions); returns one solution or None."""
    ncol = len(rows[0])
    M = [list(r) + [b] for r, b in zip(rows, rhs)]
    piv = []
    rk = 0
    for c in range(ncol):
        p = next((i for i in range(rk, len(M)) if M[i][c] != 0), None)
        if p is None:
            continue
        M[rk], M[p] = M[p], M[rk]
        iv = 1 / M[rk][c]
        M[rk] = [x * iv for x in M[rk]]
        for i in range(len(M)):
            if i != rk and M[i][c] != 0:
                f = M[i][c]
                M[i] = [x - f * y for x, y in zip(M[i], M[rk])]
        piv.append(c)
        rk += 1
    for i in range(rk, len(M)):
        if M[i][-1] != 0:
            return None
    x = [Fraction(0)] * ncol
    for i, c in enumerate(piv):
        x[c] = M[i][-1]
    return x


def check_k2(scheme, m):
    """(K2): kappa*lam^2, kappa*lam*mu, kappa*mu^2 lie in the column span of M."""
    M = [[v[1][l] for l in range(m)] for (u, v, w) in scheme]
    ok = []
    for el, em in ((2, 0), (1, 1), (0, 2)):
        t = [v[1][m - 1] * u[1][0] ** el * u[2][0] ** em for (u, v, w) in scheme]
        ok.append(solve_linear(M, t) is not None)
    return all(ok)
