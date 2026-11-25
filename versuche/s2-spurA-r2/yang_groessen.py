"""Yang's quantities (rk L, rho, rk H, dim Q, rk Phi) for a given decomposition of <4,2,4>.

Conventions follow lean/prosa/yang_n4.md: term t has alpha_t(A) = sum A_t[i][k] A[i][k] (A_t 4x2),
beta_t(B) = sum B_t[k][j] B[k][j] (B_t 2x4), and C_t (4x4) with sum_t alpha_t(A) beta_t(B) C_t = A B.

Generic choices (p, u_0, u_1..u_3, gamma) are random elements of a large finite field; all ranks are exact
in that field. Ranks at random points equal the generic ranks with high probability (Schwartz-Zippel);
results are reported with that caveat (status behauptet).

Usage:
  python3 yang_groessen.py json  <file.json> [trials]       (decomposition over Z, computed mod 2^61-1)
  python3 yang_groessen.py f2    <file.txt>  [trials]       (lines of hex triples from flip.c, computed in GF(2^31))
"""
import sys, json, random
from felder import PrimeField, GF2k, rank, left_kernel

N = M = 4


def load_json(path):
    d = json.load(open(path))
    out = []
    for pr in d['products']:
        A = [[int(x) for x in row] for row in pr['u']]
        B = [[int(x) for x in row] for row in pr['v']]
        C = [[int(x) for x in row] for row in pr['w']]
        out.append((A, B, C))
    return [out]


def load_f2(path):
    schemes = []
    for line in open(path):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        v = [int(x, 16) for x in line.split()]
        terms = []
        for a, b, c in zip(v[0::3], v[1::3], v[2::3]):
            A = [[(a >> (i * 2 + k)) & 1 for k in range(2)] for i in range(4)]
            B = [[(b >> (k * 4 + j)) & 1 for j in range(4)] for k in range(2)]
            C = [[(c >> (i * 4 + j)) & 1 for j in range(4)] for i in range(4)]
            terms.append((A, B, C))
        schemes.append(terms)
    return schemes


def verify(F, terms):
    # sum_t A_t[i][k] B_t[k'][j] C_t[i'][j'] == [i=i'][k=k'][j=j']
    for i in range(4):
        for k in range(2):
            for kk in range(2):
                for j in range(4):
                    for ii in range(4):
                        for jj in range(4):
                            s = 0
                            for A, B, C in terms:
                                s = F.add(s, F.mul(F.mul(A[i][k], B[kk][j]), C[ii][jj]))
                            want = 1 if (i == ii and k == kk and j == jj) else 0
                            if s != F.from_int(want):
                                return False
    return True


def dot(F, x, y):
    s = 0
    for a, b in zip(x, y):
        s = F.add(s, F.mul(a, b))
    return s


def quantities(F, terms, trials=3):
    terms = [([[F.from_int(x) for x in r] for r in A], [[F.from_int(x) for x in r] for r in B],
              [[F.from_int(x) for x in r] for r in C]) for A, B, C in terms]
    assert verify(F, terms), 'decomposition does not verify'
    r = len(terms)
    # ker W: relations among the C_t
    Crow = [[C[i][j] for i in range(4) for j in range(4)] for _, _, C in terms]
    kerW = left_kernel(F, Crow)
    best = None
    for _ in range(trials):
        p = [F.rand(), F.rand()]
        vp = [F.neg(p[1]), p[0]]                 # p.vp = 0
        # v' with p.v' = 1, p' with p'.vp = 1, p'.v' = 0
        det = F.sub(F.mul(p[0], p[0]), F.mul(p[1], F.neg(p[1])))  # p0*p0 + p1*p1 (det of [[p],[vp]^T-ish])
        if det == 0:
            continue
        idet = F.inv(det)
        v1 = [F.mul(p[0], idet), F.mul(p[1], idet)]                # p.v1 = 1, and vp-orthogonal choice
        # p' : p'.vp = 1, p'.v1 = 0  -> solve 2x2
        # p' = (x, y): x*vp0 + y*vp1 = 1, x*v10 + y*v11 = 0
        a11, a12, a21, a22 = vp[0], vp[1], v1[0], v1[1]
        dd = F.sub(F.mul(a11, a22), F.mul(a12, a21))
        idd = F.inv(dd)
        pp = [F.mul(a22, idd), F.mul(F.neg(a21), idd)]
        a = [[dot(F, A[i], p) for i in range(4)] for A, _, _ in terms]          # alpha_t(u (x) p) = a_t . u
        a2 = [[dot(F, A[i], pp) for i in range(4)] for A, _, _ in terms]        # alpha_t(u (x) p')
        b = [[F.add(F.mul(vp[0], B[0][j]), F.mul(vp[1], B[1][j])) for j in range(4)] for _, B, _ in terms]
        b2 = [[F.add(F.mul(v1[0], B[0][j]), F.mul(v1[1], B[1][j])) for j in range(4)] for _, B, _ in terms]
        u = [[F.rand() for _ in range(4)] for _ in range(4)]                    # u_0..u_3
        au = [[dot(F, a[t], u[i]) for t in range(r)] for i in range(4)]         # D(e_{i,0}) diagonals
        if any(x == 0 for x in au[0]):
            continue                                                            # N1 fails, retry
        a2u0 = [dot(F, a2[t], u[0]) for t in range(r)]
        bw = [[b[t][j] for t in range(r)] for j in range(4)]                    # B(x) for x = vp (x) e_j
        b2w = [[b2[t][j] for t in range(r)] for j in range(4)]
        f = [[[F.mul(au[i][t], bw[j][t]) for t in range(r)] for j in range(4)] for i in range(4)]
        J = f[0]
        rJ = rank(F, J)
        assert rJ == 4
        # everything in ker W ?
        rk_kerW = len(kerW)
        allf = [v for i in range(4) for v in f[i]]
        g = [[F.sub(F.mul(a2u0[t], bw[j][t]), F.mul(au[0][t], b2w[j][t])) for t in range(r)] for j in range(4)]
        assert rank(F, kerW + allf + g) == rk_kerW, 'f or g not in ker W'
        dimQ = rk_kerW - 4
        rkL = rank(F, J + allf[4:]) - 4
        rho = 0
        for _ in range(4):
            gam = [F.rand() for _ in range(3)]
            comb = [[0] * r for _ in range(4)]
            for i in range(1, 4):
                for j in range(4):
                    comb[j] = [F.add(x, F.mul(gam[i - 1], y)) for x, y in zip(comb[j], f[i][j])]
            rho = max(rho, rank(F, J + comb) - 4)
        # H on U^{wedge 3} = (c12, c13, c23) in U^3; components:
        # H1 = F2 c12 + F3 c13, H2 = -F1 c12 + F3 c23, H3 = -F1 c13 - F2 c23  (all mod J)
        zero = [0] * r
        def stack(x, y, z): return x + y + z
        cols = []
        for j in range(4):
            cols.append(stack(f[2][j], [F.neg(x) for x in f[1][j]], zero))          # c12 = e_j
            cols.append(stack(f[3][j], zero, [F.neg(x) for x in f[1][j]]))          # c13 = e_j
            cols.append(stack(zero, f[3][j], [F.neg(x) for x in f[2][j]]))          # c23 = e_j
        J3 = [stack(v, zero, zero) for v in J] + [stack(zero, v, zero) for v in J] + [stack(zero, zero, v) for v in J]
        rkH = rank(F, J3 + cols) - 12
        # Phi(u, c) = (L(u), (-g(u_i) + H(c)_i))  mod J in each of the 4 components
        def st4(w, x, y, z): return w + x + y + z
        J4 = ([st4(v, zero, zero, zero) for v in J] + [st4(zero, v, zero, zero) for v in J]
              + [st4(zero, zero, v, zero) for v in J] + [st4(zero, zero, zero, v) for v in J])
        phicols = []
        for i in range(1, 4):
            for j in range(4):
                comp = [zero, zero, zero]
                comp[i - 1] = [F.neg(x) for x in g[j]]
                phicols.append(st4(f[i][j], *comp))
        for c in cols:
            phicols.append(st4(zero, c[:r], c[r:2 * r], c[2 * r:]))
        rkPhi = rank(F, J4 + phicols) - 16
        # common kernel N of F_1..F_3 and s = dim(F'_2(ker F'_1) + F'_3(ker F'_1)) for a random rotation
        def kernel_mod_J(vecs):
            ker = left_kernel(F, vecs + J)
            return [k[:4] for k in ker if any(k[:4])]
        def apply(fi, w):
            v = [0] * r
            for j in range(4):
                if w[j]:
                    v = [F.add(x, F.mul(w[j], y)) for x, y in zip(v, fi[j])]
            return v
        stackN = [sum((f[i][j] for i in range(1, 4)), []) for j in range(4)]
        J3N = [[0] * (r * k) + v + [0] * (r * (2 - k)) for k in range(3) for v in J]
        kerN = left_kernel(F, stackN + J3N)
        dimN = rank(F, [k[:4] for k in kerN])
        xi = [[F.rand() for _ in range(3)] for _ in range(3)]
        fp = [[[0] * r for _ in range(4)] for _ in range(3)]
        for a_ in range(3):
            for i in range(1, 4):
                for j in range(4):
                    fp[a_][j] = [F.add(x, F.mul(xi[a_][i - 1], y)) for x, y in zip(fp[a_][j], f[i][j])]
        k1 = kernel_mod_J(fp[0])
        img = [apply(fp[1], w) for w in k1] + [apply(fp[2], w) for w in k1]
        s_ = rank(F, J + img) - 4 if img else 0
        res = dict(r=r, dimQ=dimQ, rkL=rkL, rho=rho, rkH=rkH, rkPhi=rkPhi, dimN=dimN, s=s_,
                   rkF1=rank(F, J + fp[0]) - 4)
        if best is None:
            best = res
        else:
            for k in ('rkL', 'rho', 'rkH', 'rkPhi', 's'):
                best[k] = max(best[k], res[k])
    return best


def checks(q):
    n, m, r = 4, 4, q['r']
    out = []
    out.append(('(1) rkPhi = 3m + rkH', q['rkPhi'] == 3 * m + q['rkH']))
    out.append(('(2) 3(r-24) >= rkH - rkL', 3 * (r - 24) >= q['rkH'] - q['rkL']))
    out.append(('L11 rkH >= rkL', q['rkH'] >= q['rkL']))
    out.append(('L13 2rkH >= 3rho + rkL', 2 * q['rkH'] >= 3 * q['rho'] + q['rkL']))
    out.append(('L14 rho >= 3', q['rho'] >= 3))
    out.append(("L8' rkL >= 3", q['rkL'] >= 3))
    out.append(('L15a rkL <= 3rho', q['rkL'] <= 3 * q['rho']))
    out.append(("L13' rkH >= 2rho + s + ceil((rkL-rho)/2)", q['rkH'] >= 2 * q['rho'] + q['s'] + (q['rkL'] - q['rho'] + 1) // 2))
    return out


if __name__ == '__main__':
    mode, path = sys.argv[1], sys.argv[2]
    trials = int(sys.argv[3]) if len(sys.argv) > 3 else 2
    random.seed(20261125)
    if mode == 'json':
        F, schemes = PrimeField(), load_json(path)
    else:
        F, schemes = GF2k(), load_f2(path)
    for idx, s in enumerate(schemes):
        q = quantities(F, s, trials)
        bad = [name for name, ok in checks(q) if not ok]
        print(idx + 1, q, 'alle Ungleichungen ok' if not bad else 'VERLETZT: ' + ', '.join(bad))
