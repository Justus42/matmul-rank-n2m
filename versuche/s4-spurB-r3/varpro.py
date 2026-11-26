#!/usr/bin/env python3
"""Variable-projection search for <3,2,m> schemes in the constrained normal form (S4-16).

Heuristic, floating point, only to *find* candidates; exactness comes later
(rounding.py, exact.py). Encoding is identical for every m and R:

  product r: u_r (3x2), v_r (2xm), w_r (3xm);  AB = sum_r u_r(A) v_r(B) w_r.

Vorgaben (constraints), each a switch:
  --sn1  u_r[0][0] = 1                                   (SN1 after scaling)
  --k1   v_r[1][m-2] = kappa_r u_r[1][0], v_r[1][m-3] = kappa_r u_r[2][0],
         kappa_r := v_r[1][m-1]                           (K1 of Satz K, S4-08)
  (K2 is handled by lmsearch.py in the polishing stage, --k2 there)

Given u and v, the best w is a linear least-squares problem; it is eliminated
(variable projection, Golub-Pereyra with Kaufman's Jacobian). Levenberg-Marquardt
runs on the free entries of u and v only. A Tikhonov term reg*|theta|^2 is lowered
to 0 during each try. Fixed parameters (for the rounding stage) are given as a dict
index -> value.
"""
import argparse
import json
import sys
import time

import numpy as np

n, k = 3, 2


def mm_matrix(m):
    """T as a matrix (rows: (a,b) = (i*2+j, j'*m+l), cols: c = i'*m+l')."""
    T = np.zeros((n * k, k * m, n * m))
    for i in range(n):
        for j in range(k):
            for l in range(m):
                T[i * k + j, j * m + l, i * m + l] = 1.0
    return T.reshape(n * k * k * m, n * m)


class VP:
    def __init__(self, m, R, sn1=False, k1=False):
        self.m, self.R, self.sn1, self.k1 = m, R, sn1, k1
        self.T = mm_matrix(m)
        # free entries: list of (kind, r, a) with kind 'u' (a in 0..5) or 'v' (a in 0..2m-1)
        names = []
        for r in range(R):
            for a in range(n * k):
                if sn1 and a == 0:
                    continue
                names.append(("u", r, a))
            for b in range(k * m):
                if k1 and b in (m + m - 2, m + m - 3):
                    continue
                names.append(("v", r, b))
        self.names = names
        self.N = len(names)
        self.kind = np.array([0 if t == "u" else 1 for t, _, _ in names])
        self.prod = np.array([r for _, r, _ in names])
        self.pos = np.array([a for _, _, a in names])
        self.fixed = {}

    def set_fixed(self, fixed):
        self.fixed = dict(fixed)
        self.free = np.array([q for q in range(self.N) if q not in self.fixed], dtype=int)
        self.fidx = np.array(sorted(self.fixed), dtype=int)
        self.fval = np.array([self.fixed[q] for q in sorted(self.fixed)])

    def expand(self, z):
        x = np.empty(self.N)
        x[self.free] = z
        if len(self.fidx):
            x[self.fidx] = self.fval
        return x

    def factors(self, x):
        m, R = self.m, self.R
        A = np.zeros((R, n * k))
        B = np.zeros((R, k * m))
        iu = self.kind == 0
        A[self.prod[iu], self.pos[iu]] = x[iu]
        B[self.prod[~iu], self.pos[~iu]] = x[~iu]
        if self.sn1:
            A[:, 0] = 1.0
        if self.k1:
            kap = B[:, m + m - 1]
            B[:, m + m - 2] = kap * A[:, 2]  # u[1][0] is A index 1*2+0 = 2
            B[:, m + m - 3] = kap * A[:, 4]  # u[2][0] is A index 4
        return A, B

    def solve_w(self, A, B, rho=0.0):
        """Least-squares w for given u, v; with rho > 0 a ridge term rho*|w|^2."""
        R = self.R
        K = (A[:, :, None] * B[:, None, :]).reshape(R, -1)  # R x 6*2m
        Kt = K.T
        if rho > 0:
            Phi = np.vstack([Kt, np.sqrt(rho) * np.eye(R)])
            Tt = np.vstack([self.T, np.zeros((R, self.T.shape[1]))])
        else:
            Phi, Tt = Kt, self.T
        C = np.linalg.lstsq(Phi, Tt, rcond=None)[0]
        return K, C, Phi, Tt

    def res_jac(self, z, want_jac=True, rho=0.0):
        """Returns (full residual incl. ridge part, Jacobian or None, w, Brent residual norm^2)."""
        m, R = self.m, self.R
        x = self.expand(z)
        A, B = self.factors(x)
        K, C, Phi, Tt = self.solve_w(A, B, rho)
        Res = Tt - Phi @ C
        res = Res.reshape(-1)
        nab = K.shape[1]
        brent = float((Res[:nab] ** 2).sum())
        if not want_jac:
            return res, None, C, brent
        Q, _ = np.linalg.qr(Phi)
        D = np.zeros((Phi.shape[0], self.N))
        Av = A.reshape(R, n * k)
        for q in range(self.N):
            r, a = self.prod[q], self.pos[q]
            d = np.zeros((n * k, k * m))
            if self.kind[q] == 0:
                d[a, :] = B[r]
                if self.k1 and a in (2, 4):
                    col = m + m - 2 if a == 2 else m + m - 3
                    d[:, col] += Av[r] * B[r, m + m - 1]
            else:
                d[:, a] = Av[r]
                if self.k1 and a == m + m - 1:
                    d[:, m + m - 2] += Av[r] * A[r, 2]
                    d[:, m + m - 3] += Av[r] * A[r, 4]
            D[:nab, q] = d.reshape(-1)
        Dp = D - Q @ (Q.T @ D)
        # Kaufman: J[:, q] = -kron(Dp[:, q], C[r_q, :])
        J = -(Dp[:, None, :] * C[self.prod][None, :, :].transpose(0, 2, 1)).reshape(-1, self.N)
        return res, J[:, self.free], C, brent

    def lm(self, z, iters, tlimit, reg, rho=0.0, decay=0.95, verbose=False, tol=1e-28):
        """Levenberg-Marquardt on |res|^2 + reg |z|^2; reg and the ridge rho decay by
        `decay` per iteration and are set to 0 once the Brent residual is below 1e-6.
        Returns (z, Brent residual norm, iterations)."""
        t0 = time.time()
        lmb = 1e-3
        it = 0
        brent = None
        for it in range(iters):
            if time.time() - t0 > tlimit:
                break
            r, J, _, brent = self.res_jac(z, rho=rho)
            if brent < tol:
                break
            f = r @ r
            g = J.T @ r + reg * z
            H = J.T @ J
            fobj = f + reg * (z @ z)
            accepted = False
            while lmb < 1e12:
                Hd = H + np.diag(lmb * (1.0 + np.diag(H)) + reg)
                try:
                    dz = np.linalg.solve(Hd, -g)
                except np.linalg.LinAlgError:
                    lmb *= 10
                    continue
                z2 = z + dz
                r2, _, _, b2 = self.res_jac(z2, want_jac=False, rho=rho)
                if r2 @ r2 + reg * (z2 @ z2) < fobj:
                    z, brent = z2, b2
                    lmb = max(lmb / 5, 1e-15)
                    accepted = True
                    break
                lmb *= 4
            if brent < 1e-6:
                reg, rho = 0.0, 0.0
            else:
                reg *= decay
                rho *= decay
            if verbose and it % 25 == 0:
                print(f"  it {it} res {brent**0.5:.3e} max {np.abs(z).max():.2f} lmb {lmb:.1e} reg {reg:.1e} rho {rho:.1e}",
                      flush=True)
            if not accepted and reg == 0.0 and rho == 0.0:
                break
            if not accepted:
                lmb = 1e-3
        if brent is None:
            brent = self.res_jac(z, want_jac=False)[3]
        return z, brent ** 0.5, it


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--m", type=int, default=7)
    ap.add_argument("--R", type=int, default=35)
    ap.add_argument("--sn1", action="store_true")
    ap.add_argument("--k1", action="store_true")
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--iters", type=int, default=600)
    ap.add_argument("--try-time", type=float, default=60.0)
    ap.add_argument("--time", type=float, default=600.0)
    ap.add_argument("--reg", type=float, default=1e-2)
    ap.add_argument("--scale", type=float, default=1.0)
    ap.add_argument("--out", required=True)
    ap.add_argument("--verbose", action="store_true")
    a = ap.parse_args()
    vp = VP(a.m, a.R, a.sn1, a.k1)
    vp.set_fixed({})
    rng = np.random.default_rng(a.seed)
    t0 = time.time()
    print(f"m={a.m} R={a.R} sn1={a.sn1} k1={a.k1} params={vp.N} seed={a.seed}", flush=True)
    tr = 0
    while True:
        left = a.time - (time.time() - t0)
        if left < 3:
            break
        z0 = rng.normal(scale=a.scale, size=vp.N)
        z, res, it = vp.lm(z0, a.iters, min(a.try_time, left), a.reg, rho=a.reg, verbose=a.verbose)
        print(f"try {tr} res {res:.3e} max {np.abs(z).max():.2f} iters {it} t {time.time()-t0:.0f}s", flush=True)
        if res < 1e-10:
            with open(a.out, "w") as fh:
                json.dump({"m": a.m, "R": a.R, "sn1": a.sn1, "k1": a.k1, "seed": a.seed, "try": tr,
                           "res": res, "z": z.tolist()}, fh)
            print("FOUND", a.out, flush=True)
            return 0
        tr += 1
    print("NOTHING", flush=True)
    return 1


if __name__ == "__main__":
    sys.exit(main())
