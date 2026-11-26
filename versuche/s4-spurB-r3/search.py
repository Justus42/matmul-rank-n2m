#!/usr/bin/env python3
"""Driver: random starts -> variable projection (varpro.py) -> polishing with the full
Levenberg-Marquardt of lmsearch.py (same Vorgaben) -> candidate file (S4-16).

No knowledge of any known scheme is used: every start is a fresh normal random vector
from the given seed. A candidate (residual < 1e-11) is written as JSON with the full
factors U, V, W in floating point; rounding.py turns it into exact rationals.

Usage: python3 search.py --m 7 --R 35 --sn1 --k1 [--k2] --seed S --time SEC --out FILE
"""
import argparse
import json
import sys
import time

import numpy as np

import lmsearch
import varpro

n, k = 3, 2


def vp_to_full(vp, z):
    x = vp.expand(z)
    A, B = vp.factors(x)
    _, C, _, _ = vp.solve_w(A, B)
    R, m = vp.R, vp.m
    return A.reshape(R, n, k), B.reshape(R, k, m), C.reshape(R, n, m)


def full_to_lm(md, U, V, W, Y=None):
    x = np.zeros(md.N)
    for q, (t, r, a, b) in enumerate(md.names):
        if t == "u":
            x[q] = U[r, a, b]
        elif t == "v":
            x[q] = V[r, a, b]
        elif t == "w":
            x[q] = W[r, a, b]
        else:
            x[q] = Y[r, b] if Y is not None else 0.0
    return x


def k2_witness(U, V, m):
    """Least-squares witnesses y_t for (K2), as a start for the polishing stage."""
    M = V[:, 1, :]
    lam, mu, kap = U[:, 1, 0], U[:, 2, 0], V[:, 1, m - 1]
    Y = np.zeros((3, m))
    for t, (el, em) in enumerate(((2, 0), (1, 1), (0, 2))):
        Y[t] = np.linalg.lstsq(M, kap * lam ** el * mu ** em, rcond=None)[0]
    return Y


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--m", type=int, default=7)
    ap.add_argument("--R", type=int, default=35)
    ap.add_argument("--sn1", action="store_true")
    ap.add_argument("--k1", action="store_true")
    ap.add_argument("--k2", action="store_true")
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--time", type=float, default=600.0)
    ap.add_argument("--try-time", type=float, default=40.0)
    ap.add_argument("--polish-below", type=float, default=0.3)
    ap.add_argument("--reg", type=float, default=1e-2)
    ap.add_argument("--scale", type=float, default=1.0)
    ap.add_argument("--rho", type=float, default=1e-2)
    ap.add_argument("--decay", type=float, default=0.97)
    ap.add_argument("--hops", type=int, default=3)
    ap.add_argument("--out", required=True)
    a = ap.parse_args()
    vp = varpro.VP(a.m, a.R, a.sn1, a.k1)
    vp.set_fixed({})
    md = lmsearch.Model(a.m, a.R, a.sn1, a.k1, a.k2)
    pr = lmsearch.Problem(md, reg=0.0)
    rng = np.random.default_rng(a.seed)
    t0 = time.time()
    print(f"m={a.m} R={a.R} sn1={a.sn1} k1={a.k1} k2={a.k2} vp-params={vp.N} seed={a.seed}", flush=True)
    tr = 0
    stats = []
    while time.time() - t0 < a.time - 3:
        z = rng.normal(scale=a.scale, size=vp.N)
        best = None
        for hop in range(a.hops):
            left = a.time - (time.time() - t0)
            if left < 3:
                break
            z, res, it = vp.lm(z, 800, min(a.try_time, left), a.reg if hop == 0 else 1e-4,
                               rho=a.rho if hop == 0 else 1e-4, decay=a.decay)
            if best is None or res < best:
                best = res
            if res < a.polish_below and not a.k2:
                break
            if res < a.polish_below and a.k2:
                break
            # basin hop: perturb the stuck point and continue
            z = z + rng.normal(scale=0.3, size=vp.N)
        U, V, W = vp_to_full(vp, z)
        line = f"try {tr} vp-res {res:.3e} max {max(np.abs(U).max(), np.abs(V).max(), np.abs(W).max()):.2f}"
        final = res
        if res < a.polish_below:
            Y = k2_witness(U, V, a.m) if a.k2 else None
            x = full_to_lm(md, U, V, W, Y)
            left = a.time - (time.time() - t0)
            x, pres, pit = pr.lm(x, 300, max(1.0, min(60.0, left)), reg_sched=False)
            line += f" polish-res {pres:.3e} max {np.abs(x).max():.2f}"
            final = pres
            if pres < 1e-11:
                U2, V2, W2, Y2 = pr.factors(x)
                with open(a.out, "w") as fh:
                    json.dump({"m": a.m, "R": a.R, "sn1": a.sn1, "k1": a.k1, "k2": a.k2, "seed": a.seed,
                               "try": tr, "res": pres, "U": U2.tolist(), "V": V2.tolist(), "W": W2.tolist(),
                               "Y": Y2.tolist()}, fh)
                print(line + f" t {time.time()-t0:.0f}s", flush=True)
                print("FOUND", a.out, flush=True)
                return 0
        stats.append(final)
        print(line + f" t {time.time()-t0:.0f}s", flush=True)
        tr += 1
    print(f"NOTHING tries={tr} best={min(stats) if stats else None}", flush=True)
    return 1


if __name__ == "__main__":
    sys.exit(main())
