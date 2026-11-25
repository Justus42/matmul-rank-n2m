"""S2-16: Does the symmetry matrix G_p (G a_t(p) = mu_t b_t(v_p)) depend on p?
Exact arithmetic in GF(2^31) for the 14 rho=3 rank-26 schemes over F2 (S2-05 data).
Reports: ranks of A_t, B_t; dim of solution space for G per p; dim span{G_p} over many p."""
import sys, random
sys.path.insert(0, '../s2-spurA-r2')
from felder import GF2k, rank, left_kernel
from yang_groessen import load_f2, verify

F = GF2k()

def dot(x, y):
    s = 0
    for a, b in zip(x, y):
        s ^= F.mul(a, b)
    return s

def rk01(M):
    return rank(F, [[F.from_int(x) for x in r] for r in M])

def Gsol(terms, p):
    vp = [p[1], p[0]]  # char 2: (-p1, p0)
    a = [[dot(A[i], p) for i in range(4)] for A, _, _ in terms]
    b = [[F.mul(vp[0], B[0][j]) ^ F.mul(vp[1], B[1][j]) for j in range(4)] for _, B, _ in terms]
    r = len(terms)
    nunk = 16 + r
    rows = []
    for t in range(r):
        for i in range(4):
            row = [0] * nunk
            for j in range(4):
                row[4 * i + j] = a[t][j]
            row[16 + t] = b[t][i]
            rows.append(row)
    cols = [list(c) for c in zip(*rows)]
    sol = left_kernel(F, cols)
    return [s[:16] for s in sol]

def main():
    random.seed(5)
    schemes = load_f2('../s2-spurA-r2/daten/rho3_rang26_f2.txt')
    for k, terms in enumerate(schemes):
        rA = [rk01(A) for A, _, _ in terms]
        rB = [rk01(B) for _, B, _ in terms]
        Fterms = [([[F.from_int(x) for x in r] for r in A], [[F.from_int(x) for x in r] for r in B], C) for A, B, C in terms]
        Gs = []
        dims = set()
        for _ in range(8):
            p = [F.rand(), F.rand()]
            sol = Gsol(Fterms, p)
            dims.add(len(sol))
            Gs.extend(sol)
        print(k + 1, 'rkA=1:', rA.count(1), 'rkB=1:', rB.count(1), 'solDim per p:', dims,
              'dim span G_p over 8 p:', rank(F, Gs))


if __name__ == "__main__":
    main()
