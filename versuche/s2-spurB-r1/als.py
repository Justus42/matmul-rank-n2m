#!/usr/bin/env python3
"""Numerical probe: Levenberg-Marquardt (default, METHOD=lm, ridge REG that
shrinks by 10 every 200 steps) or regularised alternating least squares
(METHOD=als) for a
real CP decomposition of the matrix multiplication tensor <n,k,m>.

This is NOT a proof of anything and NOT a search result in the sense of
the protocol (floating point). It only measures how close random ALS runs
get to an exact decomposition of a given rank, as structural information.

Usage: als.py rank seed seconds [n k m]
Prints one line per run: RUN rank=.. seed=.. iters=.. resid=.. maxabs=..
resid is the squared Frobenius norm of T - sum u (x) v (x) w,
maxabs the largest absolute factor entry (large values hint at border rank
behaviour, i.e. approximate but not exact decompositions).
"""
import os
import sys
import time

os.environ.setdefault("OMP_NUM_THREADS", "1")
os.environ.setdefault("OPENBLAS_NUM_THREADS", "1")
import numpy as np  # noqa: E402


def mm_tensor(n, k, m):
    T = np.zeros((n * k, k * m, n * m))
    for i in range(n):
        for j in range(k):
            for l in range(m):
                T[i * k + j, j * m + l, i * m + l] = 1.0
    return T


def khatri_rao(X, Y):
    # columns: kron(X[:, r], Y[:, r])
    return np.einsum("ir,jr->ijr", X, Y).reshape(-1, X.shape[1])


def run(T, R, rng, max_iter=4000):
    a, b, c = T.shape
    A = rng.standard_normal((a, R)) * 0.5
    B = rng.standard_normal((b, R)) * 0.5
    C = rng.standard_normal((c, R)) * 0.5
    T1 = T.reshape(a, b * c)
    T2 = T.transpose(1, 0, 2).reshape(b, a * c)
    T3 = T.transpose(2, 0, 1).reshape(c, a * b)
    lam = 1e-2
    resid = None
    it = 0
    for it in range(1, max_iter + 1):
        for which in range(3):
            if which == 0:
                K = khatri_rao(B, C)
                A = np.linalg.solve(K.T @ K + lam * np.eye(R), K.T @ T1.T).T
            elif which == 1:
                K = khatri_rao(A, C)
                B = np.linalg.solve(K.T @ K + lam * np.eye(R), K.T @ T2.T).T
            else:
                K = khatri_rao(A, B)
                C = np.linalg.solve(K.T @ K + lam * np.eye(R), K.T @ T3.T).T
        if it % 50 == 0:
            E = T - np.einsum("ir,jr,kr->ijk", A, B, C)
            resid = float((E * E).sum())
            lam = max(lam * 0.7, 1e-9)
            if resid < 1e-20:
                break
    E = T - np.einsum("ir,jr,kr->ijk", A, B, C)
    resid = float((E * E).sum())
    maxabs = float(max(np.abs(A).max(), np.abs(B).max(), np.abs(C).max()))
    return it, resid, maxabs


def run_lm(T, R, rng, max_iter=1500, reg=0.0):
    """Levenberg-Marquardt on all factors at once, optional ridge term."""
    a, b, c = T.shape
    x = rng.standard_normal((a + b + c) * R) * 0.5

    def split(x):
        A = x[: a * R].reshape(a, R)
        B = x[a * R : (a + b) * R].reshape(b, R)
        C = x[(a + b) * R :].reshape(c, R)
        return A, B, C

    def res(x):
        A, B, C = split(x)
        return (T - np.einsum("ir,jr,kr->ijk", A, B, C)).ravel()

    def jac(x):
        A, B, C = split(x)
        # d E[i,j,k] / d A[p,r] = - delta(i,p) B[j,r] C[k,r], block diagonal
        BC = np.einsum("jr,kr->jkr", B, C).reshape(b * c, R)
        AC = np.einsum("ir,kr->ikr", A, C).reshape(a * c, R)
        AB = np.einsum("ir,jr->ijr", A, B).reshape(a * b, R)
        JA = np.kron(np.eye(a), BC)  # rows ordered (i, j, k)
        JB = np.kron(np.eye(b), AC).reshape(b, a, c, b * R).transpose(1, 0, 2, 3).reshape(a * b * c, b * R)
        JC = np.kron(np.eye(c), AB).reshape(c, a, b, c * R).transpose(1, 2, 0, 3).reshape(a * b * c, c * R)
        return -np.hstack([JA, JB, JC])

    mu = 1.0
    e = res(x)
    f = float(e @ e) + reg * float(x @ x)
    it = 0
    for it in range(1, max_iter + 1):
        J = jac(x)
        g = J.T @ e + reg * x
        H = J.T @ J + reg * np.eye(len(x))
        while True:
            step = np.linalg.solve(H + mu * np.eye(len(x)), -g)
            xn = x + step
            en = res(xn)
            fn = float(en @ en) + reg * float(xn @ xn)
            if fn < f:
                x, e, f = xn, en, fn
                mu = max(mu / 3, 1e-12)
                break
            mu *= 4
            if mu > 1e12:
                break
        if mu > 1e12 or float(e @ e) < 1e-24:
            break
        if it % 200 == 0 and reg > 0:
            reg *= 0.1
    A, B, C = split(x)
    return it, float(e @ e), float(np.abs(x).max())


def main():
    R = int(sys.argv[1])
    seed = int(sys.argv[2])
    secs = float(sys.argv[3])
    n, k, m = (int(x) for x in sys.argv[4:7]) if len(sys.argv) > 6 else (4, 2, 4)
    T = mm_tensor(n, k, m)
    rng = np.random.default_rng(seed)
    t0 = time.time()
    runs = 0
    while time.time() - t0 < secs:
        if os.environ.get("METHOD", "lm") == "lm":
            it, resid, maxabs = run_lm(T, R, rng, max_iter=int(os.environ.get("MAXIT", "1500")), reg=float(os.environ.get("REG", "1e-3")))
        else:
            it, resid, maxabs = run(T, R, rng)
        runs += 1
        print(f"RUN rank={R} seed={seed} run={runs} iters={it} resid={resid:.3e} maxabs={maxabs:.3e}", flush=True)


if __name__ == "__main__":
    main()
