"""Exhaustive SAT search over GF(2) for <n,2,m> decompositions that are invariant under a cyclic
symmetry g = (P, Q, R) in GL_n x GL_2 x GL_m of prime order d.

Action on a product (u, v, w) (layout of verfahren/README.md, w not transposed):
    sigma(u, v, w) = (P^T u Q^{-T}, Q^T v R^{-T}, P^{-1} w R)
A decomposition is invariant iff it is a union of sigma-orbits. Over GF(2) a nonzero rank-one tensor
determines its three factors, so a term is fixed iff each factor is fixed.

Ansatz: a orbits of size d (free representative) plus f fixed terms, a*d + f = r.
Usage: python3 symsat.py n m r CASE f [timeout_s] [seed]
"""
import itertools, sys, time, json, random
import numpy as np
from pysat.solvers import Cadical153
from brent import Enc, check

def inv2(M):
    n = M.shape[0]
    A = np.concatenate([M % 2, np.eye(n, dtype=int)], axis=1)
    r = 0
    for c in range(n):
        p = next(i for i in range(r, n) if A[i, c])
        A[[r, p]] = A[[p, r]]
        for i in range(n):
            if i != r and A[i, c]:
                A[i] ^= A[r]
        r += 1
    return A[:, n:]

def comp(poly):
    """companion matrix over GF(2) of monic poly given as list of low coefficients c0..c_{k-1}."""
    k = len(poly)
    M = np.zeros((k, k), dtype=int)
    for i in range(1, k):
        M[i, i - 1] = 1
    M[:, k - 1] = poly
    return M

def blk(*Ms):
    n = sum(M.shape[0] for M in Ms)
    out = np.zeros((n, n), dtype=int); o = 0
    for M in Ms:
        s = M.shape[0]; out[o:o+s, o:o+s] = M; o += s
    return out

I1 = np.eye(1, dtype=int); I2 = np.eye(2, dtype=int)
OM = comp([1, 1])            # x^2+x+1, order 3
C5 = comp([1, 1, 1, 1])      # x^4+x^3+x^2+x+1, order 5
C7a = comp([1, 1, 0])        # x^3+x+1, order 7
C7b = comp([1, 0, 1])        # x^3+x^2+1, order 7
C15 = comp([1, 1, 0, 0])     # x^4+x+1, order 15

def cls4(name):
    return {'I': np.eye(4, dtype=int), '3a': blk(OM, I2), '3b': blk(OM, OM), '5': C5,
            '7a': blk(C7a, I1), '7b': blk(C7b, I1), '15': C15}[name]

def cls2(name):
    return {'I': I2, '3': OM}[name]

def order(M):
    X = M.copy(); k = 1
    while not np.array_equal(X % 2, np.eye(M.shape[0], dtype=int)):
        X = X @ M % 2; k += 1
    return k

def sigma_mats(P, Q, R):
    return P.T % 2, inv2(Q).T, Q.T % 2, inv2(R).T, inv2(P), R % 2

def act(term, mats):
    a, b, c, d_, e, f = mats
    u, v, w = term
    return (a @ u @ b % 2, c @ v @ d_ % 2, e @ w @ f % 2)

# symbolic linear forms: a coefficient is a frozenset of base variable ids (XOR), or const via set with 0 id? use frozenset; empty=0
def lin_act(term, mats):
    """term: (u,v,w) arrays of frozensets. Apply linear action symbolically."""
    a, b, c, d_, e, f = mats
    def mm(L, X, Rm):
        n1, n2 = X.shape
        out = np.empty((L.shape[0], Rm.shape[1]), dtype=object)
        for i in range(L.shape[0]):
            for j in range(Rm.shape[1]):
                s = frozenset()
                for p in range(n1):
                    if not L[i, p]: continue
                    for q in range(n2):
                        if Rm[q, j]:
                            s = s ^ X[p, q]
                out[i, j] = s
        return out
    u, v, w = term
    return (mm(a, u, b), mm(c, v, d_), mm(e, w, f))

def run(n, m, r, Pn, Qn, Rn, f, timeout=None, seed=0, verbose=True):
    k = 2
    P, Q, R = cls4(Pn) if n == 4 else None, cls2(Qn), cls4(Rn) if m == 4 else None
    d = max(order(P), order(Q), order(R))
    from math import lcm
    d = lcm(order(P), order(Q), order(R))
    assert (r - f) % d == 0 and r >= f
    a = (r - f) // d
    mats = sigma_mats(P, Q, R)
    import os
    use_cad = os.environ.get('SOLVER') == 'cadical'
    enc = Enc(native_xor=not use_cad)
    def fresh(shape):
        X = np.empty(shape, dtype=object)
        for idx in itertools.product(*[range(s) for s in shape]):
            X[idx] = frozenset([enc.new()])
        return X
    terms = []
    for _ in range(a):
        t = (fresh((n, k)), fresh((k, m)), fresh((n, m)))
        for _ in range(d):
            terms.append(t)
            t = lin_act(t, mats)
        # t should equal original after d steps (symbolically)
    fixed_terms = []
    for _ in range(f):
        t = (fresh((n, k)), fresh((k, m)), fresh((n, m)))
        s = lin_act(t, mats)
        for X, Y in zip(t, s):
            for idx in np.ndindex(X.shape):
                diff = X[idx] ^ Y[idx]
                if diff:
                    enc.xor_eq([x for x in diff], 0)
        terms.append(t)
    # materialize each coefficient as a literal (or const 0)
    cache = {}
    def lit(fs):
        if not fs: return 0
        if len(fs) == 1: return ('v', next(iter(fs)))
        if fs in cache: return cache[fs]
        y = enc.new()
        enc.xor_eq(list(fs) + [y], 0)
        cache[fs] = ('v', y)
        return cache[fs]
    U = {}; V = {}; W = {}
    for t, (u, v, w) in enumerate(terms):
        for i in range(n):
            for j in range(k): U[t, i, j] = lit(u[i, j])
        for j in range(k):
            for l in range(m): V[t, j, l] = lit(v[j, l])
        for i in range(n):
            for l in range(m): W[t, i, l] = lit(w[i, l])
    for i, j, j2, l, i2, l2 in itertools.product(range(n), range(k), range(k), range(m), range(n), range(m)):
        rhs = 1 if (i == i2 and j == j2 and l == l2) else 0
        lits = []
        for t in range(r):
            fac = [U[t, i, j], V[t, j2, l], W[t, i2, l2]]
            if any(x == 0 for x in fac): continue
            lits.append(enc.AND([x[1] for x in fac]))
        enc.xor_eq(lits, rhs)
    def finish(res, dt, model_t):
        prods = None
        if res:
            model = set(i for i, b in enumerate(model_t) if b)
            val = lambda x: 0 if x == 0 else (1 if x[1] in model else 0)
            prods = []
            for t in range(r):
                u = [[val(U[t, i, j]) for j in range(k)] for i in range(n)]
                v = [[val(V[t, j, l]) for l in range(m)] for j in range(k)]
                w = [[val(W[t, i, l]) for l in range(m)] for i in range(n)]
                prods.append((u, v, w))
            assert check(prods, n, k, m)
        return res, dt, prods, enc.nv, len(enc.clauses)
    t0 = time.time()
    if use_cad:
        # CNF route with DRAT proof (for independent checking with drat-trim)
        from pysat.formula import CNF
        CNF(from_clauses=enc.clauses).to_file(os.environ['CNF_OUT'])
        cs = Cadical153(bootstrap_with=enc.clauses, with_proof=True)
        res = cs.solve()
        dt = time.time() - t0
        if res is False:
            with open(os.environ['CNF_OUT'] + '.drat', 'w') as fh:
                fh.write('\n'.join(cs.get_proof()) + '\n')
        model_t = None
        if res:
            mt = cs.get_model(); model_t = [False] * (enc.nv + 1)
            for x in mt:
                if x > 0: model_t[x] = True
        cs.delete()
        return finish(res, dt, model_t)
    import pycryptosat
    s = pycryptosat.Solver(threads=1, time_limit=timeout if timeout else 1e9)
    s.add_clauses(enc.clauses)
    if os.environ.get('FIX_STANDARD'):
        # self-test: fix orbit representatives to the 32 terms of the standard algorithm.
        # Over GF(2), d*T = T for odd d, so the union of the sigma-orbits is an invariant decomposition.
        assert a == n * k * m and f == 0
        var = 1
        for i0 in range(n):
            for j0 in range(k):
                for l0 in range(m):
                    for (rows, cols, pos) in ((n, k, (i0, j0)), (k, m, (j0, l0)), (n, m, (i0, l0))):
                        for p in range(rows):
                            for q in range(cols):
                                s.add_clause([var if (p, q) == pos else -var]); var += 1
    for lits, rhs in enc.xors:
        s.add_xor_clause(lits, bool(rhs))
    res, model_t = s.solve()
    dt = time.time() - t0
    return finish(res, dt, model_t)

if __name__ == '__main__':
    n, m, r = map(int, sys.argv[1:4]); case = sys.argv[4].split(','); f = int(sys.argv[5])
    to = float(sys.argv[6]) if len(sys.argv) > 6 else None
    res, dt, prods, nv, nc = run(n, m, r, case[0], case[1], case[2], f, to)
    print(json.dumps({'n': n, 'm': m, 'r': r, 'case': case, 'f': f, 'result': {True: 'SAT', False: 'UNSAT', None: 'TIMEOUT'}[res],
                      'sec': round(dt, 1), 'vars': nv, 'clauses': nc}))
    if prods:
        print(json.dumps(prods))
