"""S2-16: structure of the 14 rho=3 rank-26 F2 schemes: normalize G to an F2 matrix,
then test global invariance under the twisted transpose."""
import sys, random, itertools
sys.path.insert(0, '../s2-spurA-r2')
from felder import GF2k
from yang_groessen import load_f2
import numpy as np
from gp_abh import Gsol, F

def mat_inv_f2(M):
    n = len(M); A = [list(r) + [int(i == j) for j in range(n)] for i, r in enumerate(M)]
    for c in range(n):
        piv = next((i for i in range(c, n) if A[i][c]), None)
        if piv is None: return None
        A[c], A[piv] = A[piv], A[c]
        for i in range(n):
            if i != c and A[i][c]:
                A[i] = [x ^ y for x, y in zip(A[i], A[c])]
    return [r[n:] for r in A]

def mm(X, Y):
    return [[sum(X[i][k] * Y[k][j] for k in range(len(Y))) % 2 for j in range(len(Y[0]))] for i in range(len(X))]

def T(X): return [list(r) for r in zip(*X)]

if __name__ == "__main__":
    random.seed(1)
    schemes = load_f2('../s2-spurA-r2/daten/rho3_rang26_f2.txt')
    for k, terms in enumerate(schemes):
        Fterms = [([[F.from_int(x) for x in r] for r in A], [[F.from_int(x) for x in r] for r in B], C) for A, B, C in terms]
        g = Gsol(Fterms, [F.rand(), F.rand()])[0]
        # normalize: divide by first nonzero entry -> should be 0/1
        nz = next(x for x in g if x)
        iv = F.inv(nz)
        g = [F.mul(x, iv) for x in g]
        assert all(x in (0, 1) for x in g), g
        G = [g[4*i:4*i+4] for i in range(4)]
        # relation: G a_t(p) ∝ b_t(v_p), a_t(p)=A p, b_t(v)=B^T v, v_p = J p, J=[[0,1],[1,0]] (char 2)
        J = [[0, 1], [1, 0]]
        # canonical form of a term: (A, B, C) -> (A, B' = B G^{-T}?) we test invariance of term set under
        # tau(A,B,C) = (G^{-1} B^T J, J A^T G^T, C^T) [candidate]; check if decomposition, and set equality
        Gi = mat_inv_f2(G)
        key = lambda A, B, C: (tuple(map(tuple, A)), tuple(map(tuple, B)), tuple(map(tuple, C)))
        S = set(key(*t) for t in terms)
        best = None
        for P, Q in [(Gi, None)]:
            pass
        imgs = []
        for A, B, C in terms:
            A2 = mm(mm(Gi, T(B)), J)
            B2 = mm(mm(J, T(A)), T(G))
            imgs.append((A2, B2))
        # compare (A,B) pairs only (C fixed by uniqueness)
        SAB = set((key(A, B, [[0]])[:2]) for A, B, _ in terms)
        hit = sum(1 for A2, B2 in imgs if (tuple(map(tuple, A2)), tuple(map(tuple, B2))) in SAB)
        fixed = sum(1 for (A, B, _), (A2, B2) in zip(terms, imgs) if A2 == A and B2 == B)
        print(k + 1, 'G=', G, 'images in set:', hit, '/26, fixed terms:', fixed)
