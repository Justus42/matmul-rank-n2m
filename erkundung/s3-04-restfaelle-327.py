#!/usr/bin/env python3
"""S3-04: enumerate the residual cases of the stage-2 case analysis (Satz A type)
for the format <n,2,m> at an assumed length r.

Exact integer arithmetic only. No external dependencies.

Notation as in lean/prosa/yang_n4.md and lean/prosa/s2_444_spurA_r2.md:
  d = n - 1 maps F_1..F_d : U -> Q, dim U = m, q = dim Q = r - (n+1) m,
  rho = max rank of a combination of the F_i, rkL = rank L, rkH = rank H,
  s = dim sum_{j>=2} F_j(ker F_1) after the basis change with rk F_1 = rho.

Usage:
  python3 s3-04-restfaelle-327.py            # probe and main computation
  python3 s3-04-restfaelle-327.py N M R      # one role, verbose
"""
import sys


def ceil_div(a, b):
    return -((-a) // b)


def conditions(n, m, r, rho, rkL, rkH, s, satzB=False):
    """Return the name of the first violated condition, or None.

    Every condition is listed with its source. 'n3' marks conditions that only
    hold for n = 3 (Yang v3, Section 4.1, lean/prosa/yang_n3.md)."""
    d = n - 1
    q = r - (n + 1) * m
    # --- ranges (trivial bounds) ---
    if q < 0:
        return "4.1(iii): q >= 0"
    if not (0 <= rho <= m):
        return "trivial: 0 <= rho <= m"
    if rho > rkL:
        return "trivial: rho <= rk L"
    if rkL > q:
        return "4.1(iii): rk L <= dim Q"
    if rkH > d * (d - 1) // 2 * m:
        return "trivial: rk H <= dim U^(wedge d)"
    if rkH > d * rkL:
        return "trivial: rk H <= d * rk L"
    if s < 0 or s > (d - 1) * (m - rho) or s > rkL:
        return "trivial: 0 <= s <= min((d-1)(m-rho), rk L)"
    # --- Yang, Lemma 10 / (2) ---
    if (n - 1) * (r - (n + 2) * m) < rkH - rkL:
        return "(2): (n-1)(r-(n+2)m) >= rk H - rk L"
    # --- Lemma 11 ---
    if 2 * rkH < (d - 1) * rkL:
        return "Lemma 11: 2 rk H >= (d-1) rk L"
    # --- Lemma 13' (contains Lemma 13 for s = 0), needs d >= 2 ---
    if d >= 2 and 2 * rkH < d * rho + 2 * s + (d - 2) * rkL:
        return "Lemma 13': 2 rk H >= d rho + 2 s + (d-2) rk L"
    # --- Lemma 14, needs m >= n-1 ---
    if m >= n - 1 and rho < n - 1:
        return "Lemma 14: rho >= n-1 (m >= n-1)"
    # --- Lemma 8' ---
    if m >= 1 and rkL < n - 1:
        return "Lemma 8': rk L >= n-1"
    # --- Lemma 15(a) ---
    if rkL > d * rho:
        return "Lemma 15(a): rk L <= d rho"
    # --- Lemma 15(b), needs n >= 3, K alg. closed ---
    if n >= 3 and rkL == d * rho and not (rho == m and rkL == d * m):
        return "Lemma 15(b): rk L = d rho => rho = m"
    # --- n = 3 only (Yang v3 Section 4.1) ---
    if n == 3:
        # d = 2: rk H = m - dim N exactly, and rk H = rho + s exactly
        if rkH != rho + s:
            return "n3: rk H = rho + s (d = 2 exact)"
        dimN = m - rkH
        delta = 2 * rkH - rkL
        if delta < min(2, dimN):
            return "n3 Lemma I: Delta >= min(2, dim N)"
    # --- Satz B (only n = m = 4, rho = 3); optional ---
    if satzB:
        if not (n == 4 and m == 4 and rho == 3):
            return None
        if s == 0:  # Lemma V: symmetric; Lemma S
            if rkL == 5 and rkH != 8:
                return "Satz B (Lemma V+S): rk L = 5 => rk H = 8"
            if rkL == 4 and rkH != 8:
                return "Satz B (Lemma V+S): rk L = 4 => rk H = 8 (generic u0)"
    return None


def residual(n, m, r, satzB=False):
    """List of (rho, rkL, rkH, [s values]) that survive all conditions."""
    d = n - 1
    q = r - (n + 1) * m
    out = []
    if q < 0:
        return out
    for rho in range(0, m + 1):
        for rkL in range(0, q + 1):
            for rkH in range(0, d * (d - 1) // 2 * m + 1):
                ss = [s for s in range(0, (d - 1) * max(m - rho, 0) + 1)
                      if conditions(n, m, r, rho, rkL, rkH, s, satzB) is None]
                if ss:
                    out.append((rho, rkL, rkH, ss))
    return out


def n3_extra(m, rho, rkL, rkH):
    """Derived quantities for n = 3: dim N, Delta, range of dim S (Lemma H, B)."""
    dimN = m - rkH
    delta = 2 * rkH - rkL
    lo = max(0, dimN - delta)  # Lemma H
    S = [k for k in range(lo, dimN + 1) if k == 0 or k + 2 <= dimN]  # Lemma B
    return dimN, delta, S


def min_feasible_r(n, m, rmax=200):
    for r in range(0, rmax):
        if residual(n, m, r):
            return r
    return None


def show(n, m, r, satzB=False):
    res = residual(n, m, r, satzB)
    print(f"<{n},2,{m}> r={r} q={r-(n+1)*m} d={n-1}"
          f"{' +SatzB' if satzB else ''}: {len(res)} residual (rho,rkL,rkH) cases")
    for rho, rkL, rkH, ss in res:
        extra = ""
        if n == 3:
            dimN, delta, S = n3_extra(m, rho, rkL, rkH)
            extra = f"  dimN={dimN} Delta={delta} dimS in {S}"
        print(f"  rho={rho} rkL={rkL} rkH={rkH} s in {ss}{extra}")
    return res


def check_known_data():
    """Tuples measured on real decompositions (from the repo) must survive."""
    ok = True
    # lean/prosa/s2_444_spurA_r2.md Section 9: <4,2,4>, r = 26, (rho, rkL, rkH, s)
    for t in [(4, 6, 11, 0), (4, 6, 10, 0), (3, 6, 8, 0)]:
        c = conditions(4, 4, 26, *t)
        print(f"  <4,2,4> r=26 {t}: {'ok' if c is None else 'VIOLATES ' + c}")
        ok &= c is None
    # lean/prosa/yang_n3.md Section 12: <3,2,5> r=25 rkL=5 rkH=4; <3,2,6> r=30 rkL=6 rkH=6
    # rho and s were not recorded there; require some admissible rho, s.
    for (m, r, rkL, rkH) in [(5, 25, 5, 4), (6, 30, 6, 6)]:
        good = [(rho, s) for rho in range(m + 1) for s in range(2 * m + 1)
                if conditions(3, m, r, rho, rkL, rkH, s) is None]
        print(f"  <3,2,{m}> r={r} rkL={rkL} rkH={rkH}: admissible (rho,s) = {good}")
        ok &= bool(good)
    return ok


def main():
    if len(sys.argv) == 4:
        n, m, r = map(int, sys.argv[1:])
        show(n, m, r)
        return
    print("== Probe 1: <4,2,4>, r = 25 (expected B-008: rho=3, (3,6),(4,7),(5,7),(5,8)) ==")
    res = show(4, 4, 25)
    got = sorted((rkL, rkH) for rho, rkL, rkH, _ in res)
    exp = [(3, 6), (4, 7), (5, 7), (5, 8)]
    assert got == exp and all(rho == 3 for rho, *_ in res), got
    print("  -> matches B-008")
    print("== Probe 2: <4,2,4>, r = 25 with Satz B (expected B-009: (3,6),(5,8)) ==")
    res = show(4, 4, 25, satzB=True)
    got = sorted({(rkL, rkH) for rho, rkL, rkH, _ in res})
    assert got == [(3, 6), (5, 8)], got
    print("  -> matches B-009")
    print("== Probe 3: smallest feasible r equals Yang's bounds ==")
    for n, m, yang in [(3, 5, 25), (3, 6, 30), (3, 7, 34), (4, 4, 25), (4, 5, 31), (5, 5, 37)]:
        rmin = min_feasible_r(n, m)
        print(f"  <{n},2,{m}>: smallest r with a residual case = {rmin}, Yang = {yang}")
        assert rmin == yang
    print("== Probe 4: data of real decompositions survive ==")
    assert check_known_data()
    print()
    print("== Main: <3,2,7>, r = 34, role n=3 (A is 3x2, U has dim 7) ==")
    show(3, 7, 34)
    print("   same role without the n=3 conditions of Yang Section 4.1:")
    for t in residual_without_n3(3, 7, 34):
        print(f"  rho={t[0]} rkL={t[1]} rkH={t[2]} s in {t[3]}")
    print("== Main: <7,2,3>, r = 34, role n=7 (transposed, U has dim 3) ==")
    res = show(7, 3, 34)
    print(f"   with s: {sum(len(t[3]) for t in res)} (rho,rkL,rkH,s) tuples")
    print(f"   smallest r with a residual case in role n=7, m=3: {min_feasible_r(7, 3)}")
    pairs = sorted({(rho, rkL) for rho, rkL, rkH, _ in res})
    print(f"   distinct (rho, rkL): {pairs}")


def residual_without_n3(n, m, r):
    """Same as residual(), but the n = 3 block (Yang 4.1) switched off."""
    global conditions
    orig = conditions

    def cond(n_, m_, r_, rho, rkL, rkH, s, satzB=False):
        c = orig(n_, m_, r_, rho, rkL, rkH, s, satzB)
        if c is not None and c.startswith("n3"):
            return None
        return c
    conditions = cond
    try:
        return residual(n, m, r)
    finally:
        conditions = orig


if __name__ == "__main__":
    main()
