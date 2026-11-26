#!/usr/bin/env python3
"""Numerical search (Levenberg-Marquardt over R) for <3,2,7> schemes, S4-08.

Sample search only (floating point); a hit would have to be rationalised and
checked exactly afterwards. Modes:

  free   : plain decomposition of rank R (positive control at R = 35)
  k1     : rank R with the residual-case ansatz of the report, Section 3:
           (SN1) u_r[0][0] = 1 for every product,
           (K1)  v_r[1][6] = u_r[1][0] * v_r[1][7],  v_r[1][5] = u_r[2][0] * v_r[1][7],
           (K2)  the vectors (lam^2 kap), (lam mu kap), (mu^2 kap) lie in J = col(M),
                 with witnesses y (3 x 7 extra unknowns), where M[r][l] = v_r[1][l],
                 lam_r = u_r[1][0], mu_r = u_r[2][0], kap_r = v_r[1][7].
Indices: u is 3x2 (A side), v is 2x7 (B side), w is 3x7 (C side, not transposed),
sum_r u[i][j] v[j'][l] w[i'][l'] = [i=i'][j=j'][l=l'].

Usage: python3 lm_normalform.py MODE R SEED ITERS TIMELIMIT_SECONDS
Prints one line per restart: seed, final residual norm, max |coefficient|.
"""
import sys
import time
import numpy as np

n, k, m = 3, 2, 7
NA, NB, NC = n * k, k * m, n * m


def target():
    T = np.zeros((NA, NB, NC))
    for i in range(n):
        for j in range(k):
            for l in range(m):
                T[i * k + j, j * m + l, i * m + l] = 1.0
    return T


T0 = target()


def idx_u(i, j):
    return i * k + j


def idx_v(j, l):
    return j * m + l


def residual_and_jac(x, R, mode):
    U = x[: R * NA].reshape(R, NA)
    V = x[R * NA: R * (NA + NB)].reshape(R, NB)
    W = x[R * (NA + NB): R * (NA + NB + NC)].reshape(R, NC)
    nvar = x.size
    T = np.einsum("ra,rb,rc->abc", U, V, W)
    res = [(T - T0).ravel()]
    # Jacobian of the Brent part
    JU = np.einsum("rb,rc,ad->abcrd", V, W, np.eye(NA)).reshape(NA * NB * NC, R * NA)
    JV = np.einsum("ra,rc,bd->abcrd", U, W, np.eye(NB)).reshape(NA * NB * NC, R * NB)
    JW = np.einsum("ra,rb,cd->abcrd", U, V, np.eye(NC)).reshape(NA * NB * NC, R * NC)
    Jb = np.hstack([JU, JV, JW, np.zeros((NA * NB * NC, nvar - R * (NA + NB + NC)))])
    jac = [Jb]
    if mode == "k1":
        offU, offV = 0, R * NA
        rows = []
        vals = []
        lam = U[:, idx_u(1, 0)]
        mu = U[:, idx_u(2, 0)]
        kap = V[:, idx_v(1, 6)]
        M = V[:, m:2 * m]  # row 1 of v
        # SN1
        for r in range(R):
            row = np.zeros(nvar)
            row[offU + r * NA + idx_u(0, 0)] = 1.0
            rows.append(row)
            vals.append(U[r, idx_u(0, 0)] - 1.0)
        # K1 (column indices 0-based: l = 6 is e7, l = 5 is e6, l = 4 is e5)
        for r in range(R):
            for col, coef in ((5, idx_u(1, 0)), (4, idx_u(2, 0))):
                row = np.zeros(nvar)
                row[offV + r * NB + idx_v(1, col)] = 1.0
                row[offU + r * NA + coef] = -kap[r]
                row[offV + r * NB + idx_v(1, 6)] = -U[r, coef]
                rows.append(row)
                vals.append(V[r, idx_v(1, col)] - U[r, coef] * kap[r])
        # K2 witnesses
        offY = R * (NA + NB + NC)
        Y = x[offY:offY + 3 * m].reshape(3, m)
        targets = [(lam * lam * kap, (2, 0, 1)), (lam * mu * kap, (1, 1, 1)), (mu * mu * kap, (0, 2, 1))]
        for t, (tgt, (el, em, ek)) in enumerate(targets):
            My = M @ Y[t]
            for r in range(R):
                row = np.zeros(nvar)
                # d/dM
                for l in range(m):
                    row[offV + r * NB + idx_v(1, l)] += Y[t, l]
                    row[offY + t * m + l] += M[r, l]
                # minus target lam^el mu^em kap
                L, Mu, Ka = lam[r], mu[r], kap[r]
                row[offU + r * NA + idx_u(1, 0)] -= el * L ** max(el - 1, 0) * Mu ** em * Ka if el else 0.0
                row[offU + r * NA + idx_u(2, 0)] -= em * L ** el * Mu ** max(em - 1, 0) * Ka if em else 0.0
                row[offV + r * NB + idx_v(1, 6)] -= L ** el * Mu ** em
                rows.append(row)
                vals.append(My[r] - tgt[r])
        jac.append(np.array(rows))
        res.append(np.array(vals))
    return np.concatenate(res), np.vstack(jac)


def run(mode, R, seed, iters, tlimit):
    rng = np.random.default_rng(seed)
    nvar = R * (NA + NB + NC) + (3 * m if mode == "k1" else 0)
    x = rng.normal(scale=0.5, size=nvar)
    lmb = 1e-2
    t0 = time.time()
    r, J = residual_and_jac(x, R, mode)
    f = r @ r
    for it in range(iters):
        if time.time() - t0 > tlimit:
            break
        g = J.T @ r
        A = J.T @ J
        while True:
            try:
                dx = np.linalg.solve(A + lmb * np.eye(nvar), -g)
            except np.linalg.LinAlgError:
                lmb *= 10
                continue
            x2 = x + dx
            r2, J2 = residual_and_jac(x2, R, mode)
            f2 = r2 @ r2
            if f2 < f:
                x, r, J, f = x2, r2, J2, f2
                lmb = max(lmb / 3, 1e-12)
                break
            lmb *= 4
            if lmb > 1e12:
                break
        if f < 1e-24 or lmb > 1e12:
            break
    return f ** 0.5, np.abs(x).max(), it, x


def main():
    mode, R, seed, iters, tlimit = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), float(sys.argv[5])
    res, mx, it, x = run(mode, R, seed, iters, tlimit)
    print(f"mode={mode} R={R} seed={seed} iters={it} residual={res:.3e} max|x|={mx:.3e}", flush=True)
    if res < 1e-8:
        np.save(f"hit_{mode}_{R}_{seed}.npy", x)


if __name__ == "__main__":
    main()
