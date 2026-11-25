"""For given decompositions and a generic p: a_t = A_t p, b_t = B_t^T v_p (v_p with p(v_p) = 0).
Reports
  dimS   = dim span{a_t (x) b_t}           (= 4 + rk L)
  rho    = generic rank defect on the A side (Yang's rho)
  rhoT   = the same with the roles of a and b exchanged (rho of the transposed decomposition)
  sym    = dimension of {(G, mu) : G a_t = mu_t b_t for all t} and whether a random element has det G != 0
Usage: python3 symmetrie.py json|f2 file
"""
import sys, random
from felder import PrimeField, GF2k, rank, left_kernel
from yang_groessen import load_json, load_f2, verify


def dot(F, x, y):
    s = 0
    for a, b in zip(x, y):
        s = F.add(s, F.mul(a, b))
    return s


def det4(F, M):
    # Gaussian elimination determinant
    M = [row[:] for row in M]
    d = 1
    for c in range(4):
        piv = next((i for i in range(c, 4) if M[i][c]), None)
        if piv is None:
            return 0
        if piv != c:
            M[c], M[piv] = M[piv], M[c]
            d = F.neg(d)
        d = F.mul(d, M[c][c])
        iv = F.inv(M[c][c])
        for i in range(c + 1, 4):
            if M[i][c]:
                f = F.mul(M[i][c], iv)
                M[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(M[i], M[c])]
    return d


def analyse(F, terms):
    terms = [([[F.from_int(x) for x in r] for r in A], [[F.from_int(x) for x in r] for r in B],
              [[F.from_int(x) for x in r] for r in C]) for A, B, C in terms]
    assert verify(F, terms)
    r = len(terms)
    p = [F.rand(), F.rand()]
    vp = [F.neg(p[1]), p[0]]
    a = [[dot(F, A[i], p) for i in range(4)] for A, _, _ in terms]
    b = [[F.add(F.mul(vp[0], B[0][j]), F.mul(vp[1], B[1][j])) for j in range(4)] for _, B, _ in terms]
    dimS = rank(F, [[F.mul(a[t][i], b[t][j]) for i in range(4) for j in range(4)] for t in range(r)])

    def rho_of(a, b):
        u0 = [F.rand() for _ in range(4)]
        best = 0
        for _ in range(3):
            u = [F.rand() for _ in range(4)]
            X = [[F.mul(dot(F, a[t], u0), b[t][j]) for t in range(r)] for j in range(4)]
            Y = [[F.mul(dot(F, a[t], u), b[t][j]) for t in range(r)] for j in range(4)]
            best = max(best, rank(F, X + Y) - 4)
        return best
    rho, rhoT = rho_of(a, b), rho_of(b, a)
    # unknowns: G (16, row-major), mu_t (r). equation for each t, i: sum_j G[i][j] a_t[j] - mu_t b_t[i] = 0
    rows = []
    nunk = 16 + r
    for t in range(r):
        for i in range(4):
            row = [0] * nunk
            for j in range(4):
                row[4 * i + j] = a[t][j]
            row[16 + t] = F.neg(b[t][i])
            rows.append(row)
    # solution space = right kernel = left kernel of transpose
    cols = [list(c) for c in zip(*rows)]
    sol = left_kernel(F, cols)  # vectors s with sum_k s_k cols[k] = 0  <=> rows . s = 0
    inv = False
    if sol:
        for _ in range(3):
            coeff = [F.rand() for _ in sol]
            v = [0] * nunk
            for c, s in zip(coeff, sol):
                v = [F.add(x, F.mul(c, y)) for x, y in zip(v, s)]
            G = [v[4 * i:4 * i + 4] for i in range(4)]
            if det4(F, G):
                inv = True
                break
    return dict(r=r, dimS=dimS, rho=rho, rhoT=rhoT, symDim=len(sol), G_invertierbar=inv)


if __name__ == '__main__':
    random.seed(11)
    mode, path = sys.argv[1], sys.argv[2]
    F, schemes = (PrimeField(), load_json(path)) if mode == 'json' else (GF2k(), load_f2(path))
    for k, s in enumerate(schemes):
        print(k + 1, analyse(F, s))
