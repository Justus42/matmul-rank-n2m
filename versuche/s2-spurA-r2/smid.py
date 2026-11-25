"""Independent recount of S_mid for GF(2) schemes (versuche/s2-blind-r1 format).
S_mid = max over l in F2^2\0, m in F2^2\0 with l.m = 1 of #{t : A_t = u l^T (rank 1, row vector l)
or B_t = m w^T (rank 1, column vector m)}.  Killing these terms maps <4,2,4> onto <4,1,4> (rank 16),
so r >= 16 + S_mid.  Also prints the per-(l,m) counts."""
import sys
from yang_groessen import load_f2

def rank1_row(A):            # A: list of rows; returns the common nonzero row if rank 1 over F2, else None
    rows = {tuple(r) for r in A if any(r)}
    return rows.pop() if len(rows) == 1 else None

def rank1_col(B):
    cols = {tuple(c) for c in zip(*B) if any(c)}
    return cols.pop() if len(cols) == 1 else None

V2 = [(1, 0), (0, 1), (1, 1)]
for k, terms in enumerate(load_f2(sys.argv[1])):
    counts = {}
    for l in V2:
        for m in V2:
            if (l[0] * m[0] + l[1] * m[1]) % 2 != 1:
                continue
            counts[(l, m)] = sum(1 for A, B, _ in terms if rank1_row(A) == l or rank1_col(B) == m)
    nA2 = sum(1 for A, _, _ in terms if rank1_row(A) is None)
    nB2 = sum(1 for _, B, _ in terms if rank1_col(B) is None)
    print(k + 1, 'r =', len(terms), 'S_mid =', max(counts.values()), 'Rang-2-Faktoren a/b:', nA2, nB2,
          'je Paar:', sorted(counts.values(), reverse=True))
