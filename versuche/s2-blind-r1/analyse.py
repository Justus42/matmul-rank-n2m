"""Analyse GF(2) schemes for <4,2,4> dumped by flip.c (one scheme per line: 'a b c a b c ...' in hex).

Index conventions (as in flip.c): a bit i*2+k (A is 4x2), b bit k*4+j (B is 2x4), c bit i*4+j (C is 4x4),
target tensor sum_{i,k,j} a_ik b_kj c_ij.

For every scheme we
  1. verify it exactly over GF(2),
  2. compute the substitution counts
     S_row = max over x in F2^4\\0, y in F2^4 with <x,y>=1 of
             #{t : a_t = x (x) v for some v}  union  #{t : c_t = y (x) w for some w}
             (killing these terms restricts to <3,2,4>, whose rank is 20, so R >= 20 + S_row)
     S_col = same for columns: b_t = v (x) z, c_t = u (x) w with <z,w>=1 (restricts to <4,2,3>)
     S_mid = a_t = u (x) l, b_t = m (x) w with <l,m>=1 (restricts to <4,1,4>, rank 16)
  3. collect the rank profile of the a-, b-, c-factors.
"""
import sys
from collections import Counter
from itertools import product

def mat(v, rows, cols):
    return [[(v >> (r * cols + c)) & 1 for c in range(cols)] for r in range(rows)]

def rank2(m):
    rows = [int(''.join(map(str, r)), 2) for r in m]
    r = 0
    for bit in reversed(range(len(m[0]))):
        piv = next((i for i in range(r, len(rows)) if rows[i] >> bit & 1), None)
        if piv is None:
            continue
        rows[r], rows[piv] = rows[piv], rows[r]
        for i in range(len(rows)):
            if i != r and rows[i] >> bit & 1:
                rows[i] ^= rows[r]
        r += 1
    return r

def rowpart(m):
    """If m has rank 1, return (row-index vector, column-index vector) as tuples, else None."""
    if rank2(m) != 1:
        return None
    rows = [i for i, r in enumerate(m) if any(r)]
    col = tuple(m[rows[0]])
    x = tuple(1 if any(r) else 0 for r in m)
    return x, col

def verify(terms):
    S = {}
    for a, b, c in terms:
        for x in range(8):
            if a >> x & 1:
                for y in range(8):
                    if b >> y & 1:
                        S[(x, y)] = S.get((x, y), 0) ^ c
    for i, k, j in product(range(4), range(2), range(4)):
        if S.get((i * 2 + k, k * 4 + j), 0) & (1 << (i * 4 + j)) == 0:
            return False
    # every entry must match exactly
    T = {}
    for i, k, j in product(range(4), range(2), range(4)):
        key = (i * 2 + k, k * 4 + j)
        T[key] = T.get(key, 0) ^ (1 << (i * 4 + j))
    keys = set(S) | set(T)
    return all(S.get(q, 0) == T.get(q, 0) for q in keys)

VEC4 = [tuple((n >> i) & 1 for i in range(4)) for n in range(1, 16)]
VEC2 = [tuple((n >> i) & 1 for i in range(2)) for n in range(1, 4)]
dot = lambda u, v: sum(p * q for p, q in zip(u, v)) % 2

def analyse(terms):
    A = [rowpart(mat(a, 4, 2)) for a, _, _ in terms]          # rows i, cols k
    B = [rowpart(mat(b, 2, 4)) for _, b, _ in terms]          # rows k, cols j
    C = [rowpart(mat(c, 4, 4)) for _, _, c in terms]          # rows i, cols j
    def best(F, G, vecs, fpart, gpart):
        m = 0
        for x in vecs:
            for y in vecs:
                if dot(x, y) != 1:
                    continue
                cnt = sum(1 for f, g in zip(F, G)
                          if (f is not None and f[fpart] == x) or (g is not None and g[gpart] == y))
                m = max(m, cnt)
        return m
    s_row = best(A, C, VEC4, 0, 0)   # a = x (x) v (x = row vector part), c = y (x) w
    s_col = best(B, C, VEC4, 1, 1)   # b = v (x) z, c = u (x) w
    s_mid = best(A, B, VEC2, 1, 0)   # a = u (x) l, b = m (x) w
    ranks = (tuple(sorted(rank2(mat(a, 4, 2)) for a, _, _ in terms)),
             tuple(sorted(rank2(mat(b, 2, 4)) for _, b, _ in terms)),
             tuple(sorted(rank2(mat(c, 4, 4)) for _, _, c in terms)))
    return s_row, s_col, s_mid, ranks

def main(paths, want=26):
    n = bad = 0
    lengths = Counter()
    srow, scol, smid, rk = Counter(), Counter(), Counter(), Counter()
    sboth = Counter()
    for p in paths:
        for line in open(p):
            w = [int(t, 16) for t in line.split()]
            terms = [tuple(w[i:i + 3]) for i in range(0, len(w), 3)]
            lengths[len(terms)] += 1
            if len(terms) != want:
                continue
            if not verify(terms):
                bad += 1
                continue
            n += 1
            a, b, c, r = analyse(terms)
            srow[a] += 1; scol[b] += 1; smid[c] += 1; sboth[max(a, b)] += 1
            rk[(Counter(r[0])[1], Counter(r[1])[1], tuple(sorted(Counter(r[2]).items())))] += 1
    print("schemes in input by rank:", dict(sorted(lengths.items())))
    print(f"rank {want}: schemes verified: {n}, failed verification: {bad}")
    print("S_row distribution:", dict(sorted(srow.items())))
    print("S_col distribution:", dict(sorted(scol.items())))
    print("max(S_row,S_col):  ", dict(sorted(sboth.items())))
    print("S_mid distribution:", dict(sorted(smid.items())))
    print("most common (#rank-1 a, #rank-1 b, c-rank counts):")
    for k, v in rk.most_common(8):
        print("  ", k, v)

if __name__ == "__main__":
    main(sys.argv[1:])
