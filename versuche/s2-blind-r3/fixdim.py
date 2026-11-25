"""Fixed-space dimensions of the sigma-action on the u, v, w factor spaces (GF(2)), per class triple."""
import numpy as np
from math import lcm
from symsat import cls4, cls2, sigma_mats, order

def rank2(M):
    A = M.copy() % 2; r = 0; N, K = A.shape
    for c in range(K):
        piv = [i for i in range(r, N) if A[i, c]]
        if not piv: continue
        A[[r, piv[0]]] = A[[piv[0], r]]
        for i in range(N):
            if i != r and A[i, c]: A[i] ^= A[r]
        r += 1
    return r

def fixdim(L, Rm, shape):
    N = shape[0] * shape[1]; M = np.zeros((N, N), int)
    for p in range(N):
        X = np.zeros(shape, int); X.flat[p] = 1
        M[:, p] = ((L @ X @ Rm + X) % 2).flatten()
    return N - rank2(M)

C4 = ['I', '3a', '3b', '5', '7a', '7b']
for P in C4:
    for Q in ['I', '3']:
        for R in C4:
            o = lcm(order(cls4(P)), order(cls2(Q)), order(cls4(R)))
            if o not in (3, 5, 7): continue
            a, b, c, d, e, f = sigma_mats(cls4(P), cls2(Q), cls4(R))
            print(P, Q, R, 'ord', o, 'fix u,v,w', fixdim(a, b, (4, 2)), fixdim(c, d, (2, 4)), fixdim(e, f, (4, 4)))
