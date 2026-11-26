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


U_FIRST = False
STRUCT = True
STRUCT_D = [4, 6, 3, 8, 2, 12]
LADDER = [(1, 0.5), (2, 0.3), (4, 0.15), (12, 0.05), (50, 0.01), (200, 0.002), (1000, 1e-4)]
PHASES = [
    [Fraction(0)],
    [Fraction(0), Fraction(1), Fraction(-1)],
    [Fraction(0), Fraction(1), Fraction(-1), Fraction(2), Fraction(-2), Fraction(1, 2), Fraction(-1, 2)],
    SIMPLE,
]


def nearest_in(val, values):
    return min((abs(val - float(f)), f) for f in values)


def round_once(vp, x, time_limit, rnd, log, max_tries=10, init=None):
    """One rounding pass from the float point x (full parameter vector)."""
    fixed, frac, bad = {}, {}, set()
    t0 = time.time()
    vp.set_fixed({})
    z = x.copy()
    prio = []
    if init is not None:
        z, fixed, frac, prio = init
        fixed, frac = dict(fixed), dict(frac)
        vp.set_fixed(fixed)
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
            f = Fraction(xfull[q]).limit_denominator(1000)
            if abs(xfull[q] - float(f)) < 1e-11:
                fixed[q], frac[q], changed = float(f), f, True
        if changed:
            vp.set_fixed(fixed)
            z = xfull[vp.free]
            continue
        ok = False
        ufree = [q for q in free if vp.names[q][0] == "u"]
        pfree = [q for q in prio if q not in fixed]
        pool = pfree if pfree else (ufree if (U_FIRST and ufree) else free)
        if not pfree and STRUCT and ufree:
            pool = ufree
        cands = []
        for q in pool:
            for lvl, (D, tol) in enumerate(LADDER):
                f = Fraction(xfull[q]).limit_denominator(D)
                d = abs(xfull[q] - float(f))
                if d < tol and (lvl, q) not in bad:
                    cands.append((lvl, d * (1 + 0.2 * rnd.random()), q, f))
                    break
        cands.sort()
        for lvl, d, q, f in cands[:max_tries]:
            res_ = continuation(vp, z, fixed, {q: float(f)}, steps=3)
            if res_ is not None:
                z, fixed = res_
                frac[q] = f
                ok = True
                break
            bad.add((lvl, q))
        vp.set_fixed(fixed)
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


def continuation(vp, z, fixed, targets, steps=10, log=print):
    """Move the parameters in `targets` (index -> value) gradually from their current
    values to the targets, re-solving after each step. Returns (z, fixed) or None."""
    xfull = vp.expand(z)
    start = {q: xfull[q] for q in targets}
    for s_ in range(1, steps + 1):
        trial = dict(fixed)
        for q, t in targets.items():
            trial[q] = start[q] + (t - start[q]) * s_ / steps
        vp.set_fixed(trial)
        z2 = np.array([xfull[p] for p in vp.free])
        z2, res, it = vp.lm(z2, 60, 30.0, 0.0, rho=0.0, tol=1e-28)
        if res > 1e-8:
            vp.set_fixed(fixed)
            return None
        xfull = vp.expand(z2)
    if res > 1e-10:
        vp.set_fixed(fixed)
        return None
    return z2, trial


def groups(vals, tol=1e-6):
    """Cluster equal values; returns list of (value, [indices])."""
    out = []
    for i, v in sorted(enumerate(vals), key=lambda t: t[1]):
        if out and abs(out[-1][0] - v) < tol:
            out[-1][1].append(i)
        else:
            out.append((v, [i]))
    return out


def struct_stage(vp, x, rnd, log, D=4):
    """Exact gauge and moduli fixing for the U side (rank-1 alpha_r = a b^T):
    b-points u_r[0][1] and a-points (u_r[1][0], u_r[2][0]); first an affine change
    (gauge: two b-points to 0, 1; three a-points to (0,0), (1,0), (0,1)), then the
    remaining points to nearby simple fractions, each by continuation."""
    R = vp.R
    idx = {(r, a): q for q, (t, r, a) in enumerate(vp.names) if t == "u"}
    U = np.zeros((R, 6))
    U[:, 0] = 1.0
    for (r, a), q in idx.items():
        U[r, a] = x[q]
    rank1 = [r for r in range(R) if np.linalg.matrix_rank(U[r].reshape(3, 2), 1e-7) == 1]
    vp.set_fixed({})
    z = x.copy()
    fixed = {}
    frac = {}
    # b-points
    gb = groups([U[r, 1] for r in rank1])
    if len(gb) >= 2:
        v0, v1 = gb[0][0], gb[-1][0]
        for DD in (D, 2 * D, 4 * D, 8 * D, 16 * D):
            tgt = {}
            for v, members in gb:
                t = (v - v0) / (v1 - v0)
                f = Fraction(t).limit_denominator(DD)
                for i in members:
                    tgt[idx[(rank1[i], 1)]] = f
            if len({f for f in tgt.values()}) == len(gb):
                break
        else:
            log("  b-points collide after rounding")
            return None
        res = continuation(vp, z, fixed, {q: float(f) for q, f in tgt.items()}, log=log)
        if res is None:
            log("  b-point continuation failed")
            return None
        z, fixed = res
        frac.update(tgt)
        log(f"  b-points fixed: {sorted(set(str(f) for f in tgt.values()))}")
    # a-points
    xfull = vp.expand(z)
    pts = [(xfull[idx[(r, 2)]], xfull[idx[(r, 4)]]) for r in rank1]
    ga = []
    for i, p in enumerate(pts):
        for g in ga:
            if abs(g[0][0] - p[0]) < 1e-6 and abs(g[0][1] - p[1]) < 1e-6:
                g[1].append(i)
                break
        else:
            ga.append((p, [i]))
    if len(ga) >= 3:
        P = np.array([g[0] for g in ga])
        # pick three points spanning a large triangle
        best = None
        for i in range(len(P)):
            for j in range(i + 1, len(P)):
                for kk in range(j + 1, len(P)):
                    d1, d2 = P[j] - P[i], P[kk] - P[i]
                    ar = abs(d1[0] * d2[1] - d1[1] * d2[0])
                    if best is None or ar > best[0]:
                        best = (ar, i, j, kk)
        _, i0, i1, i2 = best
        Mx = np.column_stack([P[i1] - P[i0], P[i2] - P[i0]])
        Mi = np.linalg.inv(Mx)
        tgt = None
        for DD in (1, 2, 3, 4, 6, 8):
            tri = [tuple(Fraction(c).limit_denominator(DD) for c in P[g]) for g in (i0, i1, i2)]
            det = (tri[1][0] - tri[0][0]) * (tri[2][1] - tri[0][1]) - (tri[1][1] - tri[0][1]) * (tri[2][0] - tri[0][0])
            if det != 0:
                tgt = {}
                for gi, (f0, f1) in zip((i0, i1, i2), tri):
                    for i in ga[gi][1]:
                        tgt[idx[(rank1[i], 2)]] = f0
                        tgt[idx[(rank1[i], 4)]] = f1
                break
        if tgt is None:
            return None
        log(f"  a-point gauge: three points to {[tuple(str(c) for c in t) for t in tri]}")
        res = continuation(vp, z, fixed, {q: float(f) for q, f in tgt.items()}, steps=20, log=log)
        if res is None:
            log("  a-point continuation failed")
            return None
        z, fixed = res
        frac.update(tgt)
        log("  a-points fixed")
    prio = [idx[(r, a)] for r in rank1 for a in (2, 4)]
    return z, fixed, frac, prio


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
        init = None
        if STRUCT:
            init = struct_stage(vp, x, rnd, log, D=STRUCT_D[attempt % len(STRUCT_D)])
            if init is None:
                attempt += 1
                continue
        frac = round_once(vp, x, time_limit - (time.time() - t0), rnd, log, init=init)
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
