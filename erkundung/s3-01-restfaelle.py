#!/usr/bin/env python3
"""S3-01: residual cases of the stage-2 case analysis for <n,2,m> at length r.

Exact integer arithmetic only. No external dependencies.

Invariants of Yang's normal form (notation of lean/prosa/yang_n4.md):
  d   = n - 1            number of maps F_1..F_d : U -> Q
  q   = dim Q = r - (n+1) m
  rho = max_gamma rk(sum gamma_i F_i)
  l   = rk L,  h = rk H,  s = dim sum_i F_i(ker G)  (Lemma 13', G a maximiser)

Layer A (Satz A, B-008) uses exactly the inequalities of the stage-2 derivation:
  (Q)   q >= 0, l <= q                         Lemma 4.1(iii), im L in Q
  (2)   h - l <= d (r - (n+2) m)               Yang (2)
  (13)  2h >= d rho + (d-2) l                  Lemma 13
  (11)  2h >= (d-1) l                          Lemma 11 (n-2 = d-1)
  (14)  rho >= d       if m >= d               Lemma 14
  (8')  l >= d                                 Lemma 8'
  (15a) l <= d rho                             Lemma 15(a)
  (15b) l == d rho  =>  rho == m and l == d m  Lemma 15(b), d >= 2, alg. closed
  (box) 0 <= rho <= m, 0 <= h <= min(m d(d-1)/2, d q)
Extra constraints (valid, not used in stage 2; switch --extra):
  (X1)  rho <= l          (sum gamma_i F_i(x) = L(gamma_1 x, ..., gamma_d x))
  (X2)  h <= d l          (H(c)_i = L(c_{i,:}) lies in im L)
Layer B annotation (Lemma 13', B-009 / Lean Lemma13Prime.lemma13Prime):
  d rho + 2 s + (d-2) l <= 2 h,  0 <= s <= min(l, (d-1)(m - rho))
  s_max == 0 and rho < m  =>  common kernel N != 0 (exists_common_kernel_of_sDim_eq_zero)
"""
import argparse
import itertools


def layer_a(n, m, r, extra=False):
    d = n - 1
    q = r - (n + 1) * m
    if q < 0:
        return []
    slack = d * (r - (n + 2) * m)
    hbox = min(m * d * (d - 1) // 2, d * q)
    out = []
    for rho in range(0, m + 1):
        if m >= d and rho < d:            # (14)
            continue
        for l in range(0, q + 1):         # (Q)
            if l < d:                     # (8')
                continue
            if l > d * rho:               # (15a)
                continue
            if l == d * rho and not (rho == m and l == d * m):   # (15b)
                continue
            if extra and rho > l:         # (X1)
                continue
            for h in range(0, hbox + 1):  # (box)
                if h - l > slack:         # (2)
                    continue
                if 2 * h < d * rho + (d - 2) * l:   # (13)
                    continue
                if 2 * h < (d - 1) * l:   # (11)
                    continue
                if extra and h > d * l:   # (X2)
                    continue
                out.append((rho, l, h))
    return out


def layer_a_second(n, m, r, extra=False):
    """Independent second evaluation: closed-form interval for h per (rho, l)."""
    d = n - 1
    q = r - (n + 1) * m
    res = set()
    if q < 0:
        return res
    lo_rho = d if m >= d else 0
    for rho, l in itertools.product(range(lo_rho, m + 1), range(d, q + 1)):
        ok15 = l < d * rho or (l == d * rho and rho == m and l == d * m)
        if not ok15 or (extra and rho > l):
            continue
        hlo = max(-(-(d * rho + (d - 2) * l) // 2), -(-((d - 1) * l) // 2), 0)
        hhi = min(l + d * (r - (n + 2) * m), m * d * (d - 1) // 2, d * q)
        if extra:
            hhi = min(hhi, d * l)
        for h in range(hlo, hhi + 1):
            res.add((rho, l, h))
    return res


def s_info(n, m, case):
    d = n - 1
    rho, l, h = case
    smax = min((2 * h - d * rho - (d - 2) * l) // 2, l, (d - 1) * (m - rho))
    gap1 = (l + d * (r_global - (n + 1) * m)) - (d * m + h)   # slack in (1)
    return smax, gap1


r_global = None


def report(n, m, r, extra):
    global r_global
    r_global = r
    a = layer_a(n, m, r, extra)
    b = layer_a_second(n, m, r, extra)
    assert set(a) == b, (sorted(set(a) ^ b))
    d = n - 1
    print(f"<{n},2,{m}> r={r}  d={d}  dim Q={r-(n+1)*m}  slack(2)={d*(r-(n+2)*m)}"
          f"  extra={'on' if extra else 'off'}  cases={len(a)}")
    print("  rho  rkL  rkH  s_max  N!=0 forced  slack(1)")
    for c in a:
        smax, gap1 = s_info(n, m, c)
        forced = "yes" if (smax == 0 and c[0] < m) else ("trivial(rho=m)" if c[0] == m else "no")
        print(f"  {c[0]:3d}  {c[1]:3d}  {c[2]:3d}  {smax:5d}  {forced:12s}  {gap1:3d}")
    return a


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--extra", action="store_true")
    args = ap.parse_args()
    for (n, m, r) in [(4, 4, 25), (4, 4, 26), (4, 5, 31), (5, 4, 31)]:
        report(n, m, r, args.extra)
        print()
    # self-tests
    known = {(3, 3, 6), (3, 4, 7), (3, 5, 7), (3, 5, 8)}
    for ex in (False, True):
        got = set(layer_a(4, 4, 25, ex))
        assert got == known, got
    # 26-term data from lean/prosa/s2_444_spurA_r2.md section 9: (rho, rkL, rkH)
    data26 = {(4, 6, 11), (4, 6, 10), (3, 6, 8)}
    assert data26 <= set(layer_a(4, 4, 26, True))
    # Yang's theorem: no case below the bound (n >= 4, m >= n)
    for n in range(4, 8):
        for m in range(n, 9):
            assert layer_a(n, m, (n + 2) * m + n - 4) == [], (n, m)
    print("self-tests passed: <4,2,4> r=25 gives exactly", sorted(known))


if __name__ == "__main__":
    main()
