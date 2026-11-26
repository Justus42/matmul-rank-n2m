#!/usr/bin/env python3
"""Numerical search for <3,2,m> schemes of length R in a constrained normal form (S4-16).

The search is only a heuristic to *find* candidates. Every candidate is turned into
exact rationals by rounding.py and checked exactly (fractions.Fraction) by exact.py.

Encoding (same for every R and m; columns of B and C are 0-based, l = 0..m-1):
  u_r (3x2), v_r (2xm), w_r (3xm), product r contributes u_r(A) * v_r(B) * w_r.

Constraints ("Vorgaben") that can be switched on:
  --sn1   u_r[0][0] = 1 for every r                                   (SN1 + scaling)
  --k1    v_r[1][m-1] = kappa_r, v_r[1][m-2] = kappa_r u_r[1][0],
          v_r[1][m-3] = kappa_r u_r[2][0]                              (K1 of Satz K)
          (needs --sn1; column m-1 is "e7", m-2 "e6", m-3 "e5" for m = 7)
  --k2    the three vectors (kappa lam^2), (kappa lam mu), (kappa mu^2) lie in
          J = span of the columns of M = (v_r[1][l])_{r,l}; witnesses y_t in R^m are
          extra unknowns (K2 of Satz K)
  --fix FILE   JSON list of [name, value] pairs: parameters held fixed (used by the
               rounding stage; names as in param_names())

The free parameters are optimised with Levenberg-Marquardt, with an optional Tikhonov
term reg*|x|^2 that is lowered to 0 during the run.
"""
import argparse
import json
import sys
import time

import numpy as np

n, k = 3, 2


def mm_tensor(m):
    T = np.zeros((n * k, k * m, n * m))
    for i in range(n):
        for j in range(k):
            for l in range(m):
                T[i * k + j, j * m + l, i * m + l] = 1.0
    return T


class Model:
    """Maps a vector of free parameters to full factors (U, V, W) and back."""

    def __init__(self, m, R, sn1, k1, k2):
        self.m, self.R, self.sn1, self.k1, self.k2 = m, R, sn1, k1, k2
        if k1 and not sn1:
            raise SystemExit("--k1 needs --sn1")
        if k2 and not k1:
            raise SystemExit("--k2 needs --k1")
        names = []
        for r in range(R):
            for i in range(n):
                for j in range(k):
                    if sn1 and (i, j) == (0, 0):
                        continue
                    names.append(("u", r, i, j))
            for j in range(k):
                for l in range(m):
                    if k1 and j == 1 and l in (m - 2, m - 3):
                        continue
                    names.append(("v", r, j, l))
            for i in range(n):
                for l in range(m):
                    names.append(("w", r, i, l))
        if k2:
            for t in range(3):
                for l in range(m):
                    names.append(("y", t, 0, l))
        self.names = names
        self.index = {nm: q for q, nm in enumerate(names)}
        self.N = len(names)

    def full(self, x):
        m, R = self.m, self.R
        U = np.zeros((R, n, k))
        V = np.zeros((R, k, m))
        W = np.zeros((R, n, m))
        Y = np.zeros((3, m))
        for q, (t, r, a, b) in enumerate(self.names):
            if t == "u":
                U[r, a, b] = x[q]
            elif t == "v":
                V[r, a, b] = x[q]
            elif t == "w":
                W[r, a, b] = x[q]
            else:
                Y[r, b] = x[q]
        if self.sn1:
            U[:, 0, 0] = 1.0
        if self.k1:
            kap = V[:, 1, m - 1]
            V[:, 1, m - 2] = kap * U[:, 1, 0]
            V[:, 1, m - 3] = kap * U[:, 2, 0]
        return U, V, W, Y


def build_maps(model):
    """Precompute index arrays to scatter x into U, V, W quickly."""
    m, R = model.m, model.R
    iu, iv, iw, iy = [], [], [], []
    for q, (t, r, a, b) in enumerate(model.names):
        if t == "u":
            iu.append((q, r * n * k + a * k + b))
        elif t == "v":
            iv.append((q, r * k * m + a * m + b))
        elif t == "w":
            iw.append((q, r * n * m + a * m + b))
        else:
            iy.append((q, r * m + b))
    return [np.array(z, dtype=int).reshape(-1, 2) for z in (iu, iv, iw, iy)]


class Problem:
    def __init__(self, model, reg=0.0, fixed=None):
        self.md = model
        self.m, self.R = model.m, model.R
        self.T = mm_tensor(self.m).reshape(-1)
        self.maps = build_maps(model)
        self.reg = reg
        self.fixed = fixed or {}
        self.free_idx = np.array([q for q in range(model.N) if q not in self.fixed], dtype=int)
        self.fix_idx = np.array(sorted(self.fixed), dtype=int)
        self.fix_val = np.array([self.fixed[q] for q in sorted(self.fixed)], dtype=float)

    def expand(self, z):
        x = np.empty(self.md.N)
        x[self.free_idx] = z
        if len(self.fix_idx):
            x[self.fix_idx] = self.fix_val
        return x

    def factors(self, x):
        m, R = self.m, self.R
        iu, iv, iw, iy = self.maps
        U = np.zeros(R * n * k)
        V = np.zeros(R * k * m)
        W = np.zeros(R * n * m)
        Y = np.zeros(3 * m)
        U[iu[:, 1]] = x[iu[:, 0]]
        V[iv[:, 1]] = x[iv[:, 0]]
        W[iw[:, 1]] = x[iw[:, 0]]
        if len(iy):
            Y[iy[:, 1]] = x[iy[:, 0]]
        U = U.reshape(R, n, k)
        V = V.reshape(R, k, m)
        W = W.reshape(R, n, m)
        Y = Y.reshape(3, m)
        if self.md.sn1:
            U[:, 0, 0] = 1.0
        if self.md.k1:
            kap = V[:, 1, m - 1].copy()
            V[:, 1, m - 2] = kap * U[:, 1, 0]
            V[:, 1, m - 3] = kap * U[:, 2, 0]
        return U, V, W, Y

    def res_jac(self, z):
        """Residual and Jacobian with respect to the free parameters z."""
        md = self.md
        m, R = self.m, self.R
        x = self.expand(z)
        U, V, W, Y = self.factors(x)
        A = U.reshape(R, -1)
        B = V.reshape(R, -1)
        C = W.reshape(R, -1)
        na, nb, nc = A.shape[1], B.shape[1], C.shape[1]
        X = np.einsum("ra,rb,rc->abc", A, B, C, optimize=True).reshape(-1)
        res = X - self.T
        # Jacobian with respect to the full A, B, C entries, per product
        # dX[a,b,c]/dA[r,a'] = delta(a,a') B[r,b] C[r,c], etc.
        BC = np.einsum("rb,rc->rbc", B, C)  # R x nb x nc
        AC = np.einsum("ra,rc->rac", A, C)
        AB = np.einsum("ra,rb->rab", A, B)
        N = md.N
        J = np.zeros((na * nb * nc, N))
        Jv = J.reshape(na, nb, nc, N)
        iu, iv, iw, iy = self.maps
        for q, pos in iu:
            r, a = divmod(pos, na)
            Jv[a, :, :, q] += BC[r]
        for q, pos in iv:
            r, b = divmod(pos, nb)
            Jv[:, b, :, q] += AC[r]
        for q, pos in iw:
            r, c = divmod(pos, nc)
            Jv[:, :, c, q] += AB[r]
        extra_r, extra_J = [], []
        if md.k1:
            # chain rule for v[1][m-2] = kap*u10, v[1][m-3] = kap*u20
            for r in range(R):
                qk = md.index[("v", r, 1, m - 1)]
                q10 = md.index[("u", r, 1, 0)]
                q20 = md.index[("u", r, 2, 0)]
                kap = V[r, 1, m - 1]
                for col, qa, aval in ((m - 2, q10, U[r, 1, 0]), (m - 3, q20, U[r, 2, 0])):
                    b = 1 * m + col
                    Jv[:, b, :, qk] += aval * AC[r]
                    Jv[:, b, :, qa] += kap * AC[r]
        if md.k2:
            Mx = V[:, 1, :]  # R x m
            lam, mu, kap = U[:, 1, 0], U[:, 2, 0], V[:, 1, m - 1]
            tg = [(2, 0), (1, 1), (0, 2)]
            for t, (el, em) in enumerate(tg):
                rr = Mx @ Y[t] - kap * lam ** el * mu ** em
                Jk = np.zeros((R, N))
                for r in range(R):
                    for l in range(m):
                        if (1, l) == (1, m - 2):
                            qk = md.index[("v", r, 1, m - 1)]
                            q10 = md.index[("u", r, 1, 0)]
                            Jk[r, qk] += Y[t, l] * U[r, 1, 0]
                            Jk[r, q10] += Y[t, l] * kap[r]
                        elif (1, l) == (1, m - 3):
                            qk = md.index[("v", r, 1, m - 1)]
                            q20 = md.index[("u", r, 2, 0)]
                            Jk[r, qk] += Y[t, l] * U[r, 2, 0]
                            Jk[r, q20] += Y[t, l] * kap[r]
                        else:
                            Jk[r, md.index[("v", r, 1, l)]] += Y[t, l]
                        Jk[r, md.index[("y", t, 0, l)]] += Mx[r, l]
                    qk = md.index[("v", r, 1, m - 1)]
                    q10 = md.index[("u", r, 1, 0)]
                    q20 = md.index[("u", r, 2, 0)]
                    Jk[r, qk] -= lam[r] ** el * mu[r] ** em
                    if el:
                        Jk[r, q10] -= kap[r] * el * lam[r] ** (el - 1) * mu[r] ** em
                    if em:
                        Jk[r, q20] -= kap[r] * em * lam[r] ** el * mu[r] ** (em - 1)
                extra_r.append(rr)
                extra_J.append(Jk)
        if extra_r:
            res = np.concatenate([res] + extra_r)
            J = np.vstack([J] + extra_J)
        J = J[:, self.free_idx]
        return res, J

    def lm(self, z, iters, tlimit, reg_sched=True, verbose=False, tol=1e-26):
        t0 = time.time()
        reg = self.reg
        lmb = 1e-3
        r, J = self.res_jac(z)
        f = r @ r
        it = 0
        for it in range(iters):
            if time.time() - t0 > tlimit:
                break
            g = J.T @ r + reg * z
            H = J.T @ J
            H[np.diag_indices_from(H)] += reg
            fobj = f + reg * (z @ z)
            accepted = False
            while lmb < 1e10:
                Hd = H.copy()
                Hd[np.diag_indices_from(Hd)] += lmb * (1.0 + np.diag(H))
                try:
                    dz = np.linalg.solve(Hd, -g)
                except np.linalg.LinAlgError:
                    lmb *= 10
                    continue
                z2 = z + dz
                r2, J2 = self.res_jac(z2)
                f2 = r2 @ r2
                if f2 + reg * (z2 @ z2) < fobj:
                    z, r, J, f = z2, r2, J2, f2
                    lmb = max(lmb / 5, 1e-15)
                    accepted = True
                    break
                lmb *= 4
            if reg_sched:
                if f < 1e-4:
                    reg = 0.0
                else:
                    reg *= 0.9
            if verbose and it % 20 == 0:
                print(f"  it {it} res {f**0.5:.3e} max {np.abs(z).max():.2f} lmb {lmb:.1e} reg {reg:.1e}",
                      flush=True)
            if f < tol or not accepted:
                break
        return z, f ** 0.5, it


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--m", type=int, default=7)
    ap.add_argument("--R", type=int, default=35)
    ap.add_argument("--sn1", action="store_true")
    ap.add_argument("--k1", action="store_true")
    ap.add_argument("--k2", action="store_true")
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--tries", type=int, default=1000)
    ap.add_argument("--iters", type=int, default=400)
    ap.add_argument("--try-time", type=float, default=60.0)
    ap.add_argument("--time", type=float, default=600.0)
    ap.add_argument("--reg", type=float, default=1e-2)
    ap.add_argument("--scale", type=float, default=0.5)
    ap.add_argument("--out", required=True)
    ap.add_argument("--verbose", action="store_true")
    a = ap.parse_args()
    md = Model(a.m, a.R, a.sn1, a.k1, a.k2)
    pr = Problem(md, reg=a.reg)
    rng = np.random.default_rng(a.seed)
    t0 = time.time()
    print(f"m={a.m} R={a.R} sn1={a.sn1} k1={a.k1} k2={a.k2} params={md.N} seed={a.seed}", flush=True)
    for tr in range(a.tries):
        left = a.time - (time.time() - t0)
        if left < 5:
            break
        z0 = rng.normal(scale=a.scale, size=md.N)
        pr.reg = a.reg
        z, res, it = pr.lm(z0, a.iters, min(a.try_time, left), verbose=a.verbose)
        print(f"try {tr} res {res:.3e} max {np.abs(z).max():.2f} iters {it} t {time.time()-t0:.0f}s", flush=True)
        if res < 1e-11:
            with open(a.out, "w") as fh:
                json.dump({"m": a.m, "R": a.R, "sn1": a.sn1, "k1": a.k1, "k2": a.k2,
                           "seed": a.seed, "try": tr, "res": res, "x": z.tolist()}, fh)
            print("FOUND", a.out, flush=True)
            return 0
    print("NOTHING", flush=True)
    return 1


if __name__ == "__main__":
    sys.exit(main())
