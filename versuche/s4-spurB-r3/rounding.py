#!/usr/bin/env python3
"""Turn a floating-point candidate into an exact rational scheme (S4-16).

Works in the variable-projection parametrisation of varpro.py (free entries of u and v
under the same Vorgaben (SN1), (K1)); w is never rounded but computed at the end by an
exact linear solve over Q (fractions.Fraction): given exact u, v, the Brent equations
are linear in w.

Rounding loop: among the free parameters choose the one closest to a "simple" value
(0, +-1, +-2, +-1/2, ...), hold it fixed, re-solve with Levenberg-Marquardt; keep the
fix if the residual stays below 1e-10, otherwise undo it and mark the parameter.
Parameters that land within 1e-9 of a simple value are fixed without a test.
At the end every u, v entry is a fixed rational number, w is solved exactly, and the
whole scheme is checked exactly (exact.brent_errors, exact.check_k1).

Usage: python3 rounding.py <candidate.json> <out.json> [time] [seed]
"""
import json
import random
import sys
import time
from fractions import Fraction

import numpy as np

import varpro
from exact import brent_errors, check_k1, check_k2, fstr

n, k = 3, 2
SIMPLE = sorted({Fraction(p, q) for p in range(-5, 6) for q in range(1, 6)},
                key=lambda f: (abs(f.numerator) + f.denominator, f))
WEIGHT = {f: 1.0 + 0.5 * (abs(f.numerator) + f.denominator - 1) for f in SIMPLE}


def nearest(val):
    best = None
    for f in SIMPLE:
        d = abs(val - float(f)) * WEIGHT[f]
        if best is None or d < best[0]:
            best = (d, f)
    return best


def exact_w(m, R, Ufr, Vfr):
    """Solve sum_r K[r, ab] W[r, c] = T[ab, c] exactly. Returns W (R x 3m) or None."""
    nab = n * k * k * m
    K = [[Ufr[r][a] * Vfr[r][b] for a in range(n * k) for b in range(k * m)] for r in range(R)]
    # system: for each column c, Kt * w_c = T_c ; Kt is nab x R. Eliminate once on [Kt | T].
    T = [[Fraction(0)] * (n * m) for _ in range(nab)]
    for i in range(n):
        for j in range(k):
            for l in range(m):
                T[(i * k + j) * (k * m) + j * m + l][i * m + l] = Fraction(1)
    rows = [[K[r][ab] for r in range(R)] + T[ab] for ab in range(nab)]
    piv = []
    rk = 0
    for c in range(R):
        p = next((i for i in range(rk, nab) if rows[i][c] != 0), None)
        if p is None:
            continue
        rows[rk], rows[p] = rows[p], rows[rk]
        iv = 1 / rows[rk][c]
        rows[rk] = [x * iv for x in rows[rk]]
        for i in range(nab):
            if i != rk and rows[i][c] != 0:
                f = rows[i][c]
                rows[i] = [x - f * y for x, y in zip(rows[i], rows[rk])]
        piv.append(c)
        rk += 1
    for i in range(rk, nab):
        if any(x != 0 for x in rows[i][R:]):
            return None
    W = [[Fraction(0)] * (n * m) for _ in range(R)]
    for i, c in enumerate(piv):
        W[c] = rows[i][R:]
    return W


def to_scheme(m, R, Ufr, Vfr, W):
    sch = []
    for r in range(R):
        u = [[Ufr[r][i * k + j] for j in range(k)] for i in range(n)]
        v = [[Vfr[r][j * m + l] for l in range(m)] for j in range(k)]
        w = [[W[r][i * m + l] for l in range(m)] for i in range(n)]
        sch.append((u, v, w))
    return sch


def exact_factors(vp, fixed_frac):
    """Exact u, v from the fixed parameters, including (SN1) and (K1)."""
    m, R = vp.m, vp.R
    Ufr = [[Fraction(0)] * (n * k) for _ in range(R)]
    Vfr = [[Fraction(0)] * (k * m) for _ in range(R)]
    for q, (t, r, a) in enumerate(vp.names):
        if t == "u":
            Ufr[r][a] = fixed_frac[q]
        else:
            Vfr[r][a] = fixed_frac[q]
    for r in range(R):
        if vp.sn1:
            Ufr[r][0] = Fraction(1)
        if vp.k1:
            kap = Vfr[r][2 * m - 1]
            Vfr[r][2 * m - 2] = kap * Ufr[r][2]
            Vfr[r][2 * m - 3] = kap * Ufr[r][4]
    return Ufr, Vfr


U_FIRST = True
PHASES = [
    [Fraction(0)],
    [Fraction(0), Fraction(1), Fraction(-1)],
    [Fraction(0), Fraction(1), Fraction(-1), Fraction(2), Fraction(-2), Fraction(1, 2), Fraction(-1, 2)],
    SIMPLE,
]


def nearest_in(val, values):
    return min((abs(val - float(f)), f) for f in values)


def round_once(vp, x, time_limit, rnd, log, max_tries=6):
    """One rounding pass from the float point x (full parameter vector)."""
    fixed, frac, bad = {}, {}, set()
    t0 = time.time()
    vp.set_fixed({})
    z = x.copy()
    while True:
        if time.time() - t0 > time_limit:
            log("  time limit")
            return None
        xfull = vp.expand(z)
        free = [q for q in range(vp.N) if q not in fixed]
        if not free:
            return frac
        changed = False
        for q in free:
            d, f = nearest(xfull[q])
            if d < 1e-9:
                fixed[q], frac[q], changed = float(f), f, True
        if changed:
            vp.set_fixed(fixed)
            z = xfull[vp.free]
            continue
        ok = False
        ufree = [q for q in free if vp.names[q][0] == "u"]
        pool = ufree if (U_FIRST and ufree) else free
        for ph, values in enumerate(PHASES):
            cands = []
            for q in pool:
                if (ph, q) in bad:
                    continue
                d, f = nearest_in(xfull[q], values)
                if d < 0.6:
                    cands.append((d * (1 + 0.2 * rnd.random()), q, f))
            cands.sort()
            for d, q, f in cands[:max_tries]:
                trial = dict(fixed)
                trial[q] = float(f)
                vp.set_fixed(trial)
                z2 = np.array([xfull[p] for p in vp.free])
                z2, res, it = vp.lm(z2, 15, 10.0, 0.0, rho=0.0, tol=1e-28)
                if 1e-10 <= res < 1e-5:
                    z2, res, it = vp.lm(z2, 60, 20.0, 0.0, rho=0.0, tol=1e-28)
                if res < 1e-10:
                    fixed, z, ok = trial, z2, True
                    frac[q] = f
                    break
                bad.add((ph, q))
            vp.set_fixed(fixed)
            if ok:
                break
        if not ok:
            log(f"  stuck: {len(free)} free parameters left, t {time.time()-t0:.0f}s")
            # the point is (locally) isolated: try rational reconstruction of the rest
            z, res, _ = vp.lm(z, 40, 20.0, 0.0, rho=0.0, tol=1e-30)
            xfull = vp.expand(z)
            for D in (12, 100, 1000, 10000, 10 ** 6):
                fr = dict(frac)
                for q in free:
                    fr[q] = Fraction(xfull[q]).limit_denominator(D)
                errs = max(abs(float(fr[q]) - xfull[q]) for q in free)
                if errs > 1e-9:
                    continue
                log(f"  reconstruction with denominators <= {D} (max error {errs:.1e})")
                return fr
            log(f"  no rational reconstruction (res {res:.1e}); sample: "
                + ", ".join(f"{xfull[q]:.12f}" for q in free[:6]))
            return None
        bad = {(ph, q) for (ph, q) in bad if ph > 0} if False else set()
        if len(fixed) % 20 == 0:
            log(f"  fixed {len(fixed)}/{vp.N}, t {time.time()-t0:.0f}s")


def round_candidate(cand, time_limit=600.0, seed=1, log=print):
    m, R = cand["m"], cand["R"]
    vp = varpro.VP(m, R, cand["sn1"], cand["k1"])
    U = np.array(cand["U"]).reshape(R, n * k)
    V = np.array(cand["V"]).reshape(R, k * m)
    x = np.array([U[r, a] if t == "u" else V[r, a] for (t, r, a) in vp.names])
    rnd = random.Random(seed)
    t0 = time.time()
    attempt = 0
    while time.time() - t0 < time_limit - 5:
        log(f" attempt {attempt}")
        frac = round_once(vp, x, time_limit - (time.time() - t0), rnd, log)
        attempt += 1
        if frac is None:
            continue
        Ufr, Vfr = exact_factors(vp, frac)
        W = exact_w(m, R, Ufr, Vfr)
        if W is None:
            log("  exact solve for w: inconsistent")
            continue
        return to_scheme(m, R, Ufr, Vfr, W)
    return None


def scheme_json(sch, ident, m, ring, method, notes):
    return {
        "format_version": 1, "id": ident, "n": 3, "k": 2, "m": m, "rank": len(sch), "ring": ring,
        "origin": {"source": "eigene Suche", "method": method, "created": "2026-11-26",
                   "created_by": "Verfahrenssucher, S4-16"},
        "notes": notes,
        "products": [{"u": [[fstr(x) for x in r] for r in u], "v": [[fstr(x) for x in r] for r in v],
                      "w": [[fstr(x) for x in r] for r in w]} for (u, v, w) in sch],
    }


def main():
    cpath, out = sys.argv[1], sys.argv[2]
    tl = float(sys.argv[3]) if len(sys.argv) > 3 else 600.0
    with open(cpath) as fh:
        cand = json.load(fh)
    sch = round_candidate(cand, tl, log=lambda s: print(s, flush=True))
    if sch is None:
        print("NO EXACT SCHEME")
        return 1
    m = cand["m"]
    be = brent_errors(sch, m)
    sn1, k1 = check_k1(sch, m)
    k2 = check_k2(sch, m)
    dens = sorted({x.denominator for (u, v, w) in sch for M in (u, v, w) for row in M for x in row})
    ring = "Z" if dens == [1] else "Q"
    print(f"exact check: brent errors {be}, SN1 {sn1}, K1 {k1}, K2 {k2}, denominators {dens}, ring {ring}")
    if be:
        return 1
    ident = out.rsplit("/", 1)[-1][:-5]
    method = (f"search.py (Variable Projektion + Levenberg-Marquardt ueber R, Vorgaben "
              f"sn1={cand['sn1']} k1={cand['k1']} k2={cand.get('k2')}, Saat {cand['seed']}, Versuch {cand['try']}), "
              f"rounding.py (Runden auf einfache Brueche, w exakt ueber Q geloest)")
    notes = (f"Positivprobe/Suche S4-16. Exakt nachgerechnet mit exact.py: 0 verletzte Gleichungen. "
             f"Vorgaben erfuellt: (SN1) {sn1}, (K1) {k1}, (K2) {k2}. Nenner: {dens}.")
    with open(out, "w", encoding="utf-8") as fh:
        json.dump(scheme_json(sch, ident, m, ring, method, notes), fh, ensure_ascii=False, indent=1)
    print("written", out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
