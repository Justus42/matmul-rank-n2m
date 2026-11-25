#!/usr/bin/env python3
"""S3-02: residual cases of the stage-2 case analysis for <n,2,m> at length r.

Pure integer enumeration (no floating point, no external packages).

Normal form of Yang (arXiv:2609.14393v3, prose lean/prosa/yang_n4.md):
  d = n - 1 maps F_1..F_d : U -> Q, dim U = m, dim Q = r - (n+1) m,
  L : U^d -> Q, H = skew extension of L, rho = max rk(sum gamma_i F_i),
  s = dim sum_i F_i(ker G) for a maximiser G (Lemma 13').

A "case" is a tuple (rho, rkL, rkH) together with the admissible range of s.
Every condition below is labelled with its source; the set CORE is exactly the
set used in Satz A (lean/prosa/s2_444_spurA_r2.md, Section 3, items 1-8).

Usage:
  python3 s3-02-restfaelle.py            # self-tests + tables for 4x2x4 and 4x2x5
  python3 s3-02-restfaelle.py n m r      # case list for one orientation
"""

import sys


def ceil_div(a, b):
    return -((-a) // b)


def conditions(n, m, r, rho, L, H):
    """Return dict label -> bool for the tuple (rho, rkL=L, rkH=H)."""
    d = n - 1
    dimQ = r - (n + 1) * m
    c = {}
    # trivial ranges (Satz A item 8 names dim U^{wedge 3}, dim Q^3)
    c["dimQ>=0 (Lemma 4.1(iii))"] = dimQ >= 0
    c["0<=rho<=m"] = 0 <= rho <= m
    c["rkL<=dimQ (im L in Q, item 1)"] = 0 <= L <= dimQ
    c["rkH<=dim U^wedge d"] = 0 <= H <= d * (d - 1) // 2 * m
    c["rkH<=d*dimQ"] = H <= d * dimQ
    # inequality (2) of Yang (= (1)), item 2
    c["(2): d(r-(n+2)m) >= rkH-rkL"] = d * (r - (n + 2) * m) >= H - L
    # Lemma 13 (Yang, repaired), item 3
    c["Lemma 13: 2rkH >= d rho + (d-2) rkL"] = 2 * H >= d * rho + (d - 2) * L
    # Lemma 14 (needs m >= n-1), item 4
    if m >= n - 1:
        c["Lemma 14: rho >= n-1"] = rho >= n - 1
    # Lemma 8', item 6
    c["Lemma 8': rkL >= n-1"] = L >= n - 1
    # Lemma 11 (11'), item 7
    c["Lemma 11: 2rkH >= (n-2) rkL"] = 2 * H >= (n - 2) * L
    # Lemma 15(a), item 8
    c["Lemma 15(a): rkL <= d rho"] = L <= d * rho
    # Lemma 15(b) (n >= 3, alg. closed), item 8:
    # rkL = d*rho  =>  rho = m and rkL = d*m
    if n >= 3:
        c["Lemma 15(b)"] = (L != d * rho) or (rho == m and L == d * m)
    return c


EXTRA = {
    # valid but not used in Satz A; reported separately
    "rho<=rkL": lambda n, m, r, rho, L, H: rho <= L,
    "rkH<=d*rkL": lambda n, m, r, rho, L, H: H <= (n - 1) * L,
}


def s_max(n, m, r, rho, L, H):
    """Largest s allowed by Lemma 13' (doubled form, Lean lemma13Prime):
    d*rho + 2 s + (d-2) rkL <= 2 rkH, plus 0 <= s <= min((d-1)(m-rho), rkL)."""
    d = n - 1
    by13 = (2 * H - d * rho - (d - 2) * L)
    if by13 < 0:
        return None
    return min(by13 // 2, (d - 1) * (m - rho), L)


def cases(n, m, r, use_extra=False):
    out = []
    dimQ = r - (n + 1) * m
    if dimQ < 0:
        return out
    d = n - 1
    for rho in range(0, m + 1):
        for L in range(0, dimQ + 1):
            for H in range(0, d * d * m + d * dimQ + 1):
                c = conditions(n, m, r, rho, L, H)
                if not all(c.values()):
                    continue
                if use_extra and not all(f(n, m, r, rho, L, H) for f in EXTRA.values()):
                    continue
                out.append((rho, L, H, s_max(n, m, r, rho, L, H)))
    return out


def slack(n, m, r, L, H):
    """Slack of inequality (1): rkL + d dimQ - (d m + rkH)."""
    d = n - 1
    return L + d * (r - (n + 1) * m) - d * m - H


def table(n, m, r):
    cs = cases(n, m, r)
    print(f"<{n},2,{m}>, r = {r}: dim Q = {r - (n + 1) * m}, {len(cs)} case(s)")
    print("  rho rkL rkH  s<=  slack(1)")
    for rho, L, H, s in cs:
        print(f"  {rho:3d} {L:3d} {H:3d}  {s:3d}  {slack(n, m, r, L, H):4d}")
    ce = cases(n, m, r, use_extra=True)
    if ce != cs:
        print(f"  with extra bounds {list(EXTRA)}: {len(ce)} case(s)")
    return cs


def yang_bound(n, m):
    return (n + 2) * m + n - 3


def first_r(n, m):
    r = (n + 1) * m
    while not cases(n, m, r):
        r += 1
    return r


def selftest():
    ok = True
    # 1. Probe: <4,2,4>, r = 25 must give exactly the Satz A list with the s table
    got = cases(4, 4, 25)
    want = [(3, 3, 6, 0), (3, 4, 7, 0), (3, 5, 7, 0), (3, 5, 8, 1)]
    print("Probe <4,2,4>, r=25:", got, "OK" if got == want else "MISMATCH")
    ok &= got == want
    # 2. r = 24 must be empty (Yang's Satz 2, R >= 25)
    ok &= cases(4, 4, 24) == []
    print("Probe <4,2,4>, r=24: empty", cases(4, 4, 24) == [])
    # 3. Yang's bound reproduced for m >= n >= 4 (first r with a case)
    for n in range(4, 8):
        for m in range(n, n + 4):
            fr = first_r(n, m)
            if fr != yang_bound(n, m):
                print(f"  first r for <{n},2,{m}> = {fr}, Yang {yang_bound(n, m)}  MISMATCH")
                ok = False
    print("Probe first r = Yang bound for 4<=n<=7, n<=m<=n+3:", ok)
    # 4. Lemma 13' doubled form equals the ceiling form of the prose for d = 3
    for rho in range(0, 6):
        for L in range(rho, 10):
            for H in range(0, 20):
                for s in range(0, 5):
                    a = 3 * rho + 2 * s + L <= 2 * H
                    b = H >= 2 * rho + s + ceil_div(L - rho, 2)
                    if a != b:
                        ok = False
    print("Probe Lemma 13' forms agree:", ok)
    return ok


if __name__ == "__main__":
    if len(sys.argv) == 4:
        table(*map(int, sys.argv[1:]))
        sys.exit(0)
    if not selftest():
        print("SELFTEST FAILED")
        sys.exit(1)
    print()
    table(4, 4, 25)
    print()
    table(4, 5, 31)
    print()
    table(5, 4, 31)
    print()
    print("first r with a case: <4,2,5> as n=4,m=5:", first_r(4, 5),
          "; as n=5,m=4:", first_r(5, 4))
    for r in (30, 32):
        print(f"<4,2,5> n=4,m=5, r={r}: {len(cases(4, 5, r))} case(s); "
              f"n=5,m=4: {len(cases(5, 4, r))} case(s)")
