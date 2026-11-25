"""S2-09: independent numerical checks of lean/prosa/s2_444_spurA_r2.md (Lemma 13', Lemma V, Lemma S).

Written from the definitions in lean/prosa/yang_n4.md without looking at versuche/s2-spurA-r2/*.py
(only the file format of the scheme lists was read).

Usage (from this directory):
  python3 pruefe.py schemes            # real rank-26 schemes from the repo (Z and GF(2))
  python3 pruefe.py modelle            # synthetic symmetric data for Lemma S (incl. special planes)
  python3 pruefe.py l13                # random abstract triples for Lemma 13'
All ranks are exact in the computing field; "generic" values come from random points and are
correct with high probability only. Every random choice is repeated and the maximum is taken.
"""
import json
import random
import sys

from gf import GF2k, GFpk, PrimeField, P61, POLY32, rank, nullspace, det

REPO = '../..'


# ---------------------------------------------------------------- loading

def load_json(path):
    d = json.load(open(path))
    out = []
    for pr in d['products']:
        out.append(([[int(x) for x in r] for r in pr['u']],
                    [[int(x) for x in r] for r in pr['v']],
                    [[int(x) for x in r] for r in pr['w']]))
    return [out]


def load_hex(path):
    res = []
    for line in open(path):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        v = [int(x, 16) for x in line.split()]
        terms = []
        for t in range(0, len(v), 3):
            a, b, c = v[t:t + 3]
            terms.append(([[(a >> (2 * i + k)) & 1 for k in range(2)] for i in range(4)],
                          [[(b >> (4 * k + j)) & 1 for j in range(4)] for k in range(2)],
                          [[(c >> (4 * i + j)) & 1 for j in range(4)] for i in range(4)]))
        res.append(terms)
    return res


def load_f3(path, limit=None):
    """Output of flip3.c (S2-01): blocks 'R=r' followed by r lines 'ap/an bp/bn cp/cn' (hex masks)."""
    res, cur, need = [], None, 0
    for line in open(path):
        line = line.strip()
        if line.startswith('R='):
            need, cur = int(line[2:].split()[0]), []
            continue
        if cur is None or not line:
            continue
        a, b, c = [tuple(int(h, 16) for h in x.split('/')) for x in line.split()]
        val = lambda m, bit: ((m[0] >> bit) & 1) - ((m[1] >> bit) & 1)
        cur.append(([[val(a, 2 * i + k) for k in range(2)] for i in range(4)],
                    [[val(b, 4 * k + j) for j in range(4)] for k in range(2)],
                    [[val(c, 4 * i + j) for j in range(4)] for i in range(4)]))
        if len(cur) == need:
            res.append(cur)
            cur = None
            if limit and len(res) >= limit:
                break
    return res


def brent_ok(F, terms, transpose_c):
    for i in range(4):
        for k in range(2):
            for k2 in range(2):
                for j in range(4):
                    for i2 in range(4):
                        for j2 in range(4):
                            s = 0
                            for A, B, C in terms:
                                c = C[j2][i2] if transpose_c else C[i2][j2]
                                s = F.add(s, F.mul(F.from_int(A[i][k] * B[k2][j]), F.from_int(c)))
                            want = 1 if (i == i2 and k == k2 and j == j2) else 0
                            if s != F.from_int(want):
                                return False
    return True


# ---------------------------------------------------------------- Yang quantities

def cols_to_rows(cols):
    return [list(c) for c in cols]


def mat_cols(F, a, bt, i):
    """columns of f_i = Psi(e_i, .) in coordinates: column j = (a_t[i] * bt_t[j])_t."""
    return [[F.mul(a[t][i], bt[t][j]) for t in range(len(a))] for j in range(4)]


def comb(F, mats, gam):
    out = []
    for j in range(4):
        col = [0] * len(mats[0][0])
        for g, M in zip(gam, mats):
            if g:
                col = [F.add(x, F.mul(g, y)) for x, y in zip(col, M[j])]
        out.append(col)
    return out


def rk_mod_J(F, J, cols):
    return rank(F, cols_to_rows(J + cols)) - len(J)


def kernel_mod_J(F, J, Mcols):
    """{x in K^4 : M x in J}: solve M x - J y = 0, return x-parts."""
    r = len(J[0])
    rows = [[Mcols[j][t] for j in range(4)] + [F.neg(J[k][t]) for k in range(len(J))] for t in range(r)]
    ns = nullspace(F, rows, 4 + len(J))
    xs = [v[:4] for v in ns]
    return [x for x in xs if any(x)]


def apply(F, Mcols, x):
    r = len(Mcols[0])
    out = [0] * r
    for j in range(4):
        if x[j]:
            out = [F.add(o, F.mul(x[j], c)) for o, c in zip(out, Mcols[j])]
    return out


def yang_data(F, a, bt, rng, tries=3):
    """a: list of a_t in coordinates w.r.t. basis u_0..u_3; bt: list of b_t (w-coordinates).
    Returns rkL, rho, rkH, dimN, s (for a random generic gamma*) using Q replaced by Jhat/J."""
    r = len(a)
    f = [mat_cols(F, a, bt, i) for i in range(4)]
    J = f[0]
    assert rank(F, cols_to_rows(J)) == 4
    jhat = rank(F, cols_to_rows(f[0] + f[1] + f[2] + f[3]))
    rkL = jhat - 4
    rho = 0
    for _ in range(tries):
        g = [F.rand(rng) for _ in range(3)]
        rho = max(rho, rk_mod_J(F, J, comb(F, f[1:], g)))
    # H
    Z = [0] * r
    hcols = []
    for j in range(4):
        hcols.append(f[2][j] + [F.neg(x) for x in f[1][j]] + Z)           # c12 = e_j
        hcols.append(f[3][j] + Z + [F.neg(x) for x in f[1][j]])           # c13 = e_j
        hcols.append(Z + f[3][j] + [F.neg(x) for x in f[2][j]])           # c23 = e_j
    J3 = []
    for k in range(3):
        for c in J:
            v = [0] * (3 * r)
            v[k * r:(k + 1) * r] = c
            J3.append(v)
    rkH = rank(F, cols_to_rows(J3 + hcols)) - 12
    # common kernel N
    rows = []
    for i in (1, 2, 3):
        pass
    # unknowns x (4), y1,y2,y3 (4 each): f_i x - J y_i = 0
    eqs = []
    for idx, i in enumerate((1, 2, 3)):
        for t in range(r):
            row = [f[i][j][t] for j in range(4)] + [0] * 12
            for k in range(4):
                row[4 + 4 * idx + k] = F.neg(J[k][t])
            eqs.append(row)
    dimN = len(nullspace(F, eqs, 16))
    # s for a random gamma* of rank rho, completed randomly to a basis
    s = None
    for _ in range(tries):
        while True:
            xi = [[F.rand(rng) for _ in range(3)] for _ in range(3)]
            if det(F, xi) != 0:
                break
        Fp = [comb(F, f[1:], xi[k]) for k in range(3)]
        if rk_mod_J(F, J, Fp[0]) != rho:
            continue
        ker = kernel_mod_J(F, J, Fp[0])
        imgs = [apply(F, Fp[1], x) for x in ker] + [apply(F, Fp[2], x) for x in ker]
        s = rank(F, cols_to_rows(J + imgs)) - 4 if imgs else 0
        break
    return dict(rkL=rkL, rho=rho, rkH=rkH, dimN=dimN, s=s)


def symmetry_space(F, a, bt):
    """Solutions G (4x4, G maps u-coordinates to w) of G^T b_t parallel to a_t for all t."""
    eqs = []
    for at, b in zip(a, bt):
        # (G^T b)_i = sum_j G[j][i] b_j ; unknown index G[j][i] -> 4*j + i
        for i in range(4):
            for k in range(i + 1, 4):
                row = [0] * 16
                for j in range(4):
                    row[4 * j + i] = F.add(row[4 * j + i], F.mul(b[j], at[k]))
                    row[4 * j + k] = F.sub(row[4 * j + k], F.mul(b[j], at[i]))
                eqs.append(row)
    return nullspace(F, eqs, 16)


def has_invertible(F, basis, rng):
    if not basis:
        return False
    for _ in range(4):
        G = [0] * 16
        for v in basis:
            c = F.rand(rng)
            G = [F.add(x, F.mul(c, y)) for x, y in zip(G, v)]
        if det(F, [G[4 * j:4 * j + 4] for j in range(4)]) != 0:
            return True
    return False


MON2 = [(i, j) for i in range(4) for j in range(i, 4)]          # 10 quadratic monomials
MON2p = [(i, j) for i in range(1, 4) for j in range(i, 4)]       # 6 in x1..x3
MON3p = [(i, j, k) for i in range(1, 4) for j in range(i, 4) for k in range(j, 4)]  # 10 cubics


def quadric_ideal(F, a):
    rows = [[F.mul(at[i], at[j]) for (i, j) in MON2] for at in a]
    return nullspace(F, rows, 10)


def syz_dim(F, I):
    """dim of linear syzygies among q_bar (q restricted to x_0 = 0)."""
    qb = []
    for q in I:
        qb.append({m: q[MON2.index(m)] for m in MON2p})
    nunk = 3 * len(qb)
    if nunk == 0:
        return 0
    eqs = {m: [0] * nunk for m in MON3p}
    for k, q in enumerate(qb):
        for li in range(1, 4):                    # l_k = sum_li c_{k,li} x_li
            for (i, j), coef in q.items():
                if coef == 0:
                    continue
                m = tuple(sorted((li, i, j)))
                eqs[m][3 * k + (li - 1)] = F.add(eqs[m][3 * k + (li - 1)], coef)
    return len(nullspace(F, list(eqs.values()), nunk))


def setup(F, terms, rng):
    """Random p, random basis u_0..u_3; returns coordinates a_t, b_t (or None if N1 fails)."""
    p = [F.rand(rng), F.rand(rng)]
    v = [p[1], F.neg(p[0])]                                 # p . v = 0
    at_std = [[F.add(F.mul(F.from_int(A[i][0]), p[0]), F.mul(F.from_int(A[i][1]), p[1])) for i in range(4)]
              for A, _, _ in terms]
    bt = [[F.add(F.mul(F.from_int(B[0][j]), v[0]), F.mul(F.from_int(B[1][j]), v[1])) for j in range(4)]
          for _, B, _ in terms]
    while True:
        Ub = [[F.rand(rng) for _ in range(4)] for _ in range(4)]   # columns u_0..u_3
        if det(F, Ub) != 0:
            break
    a = [[sum_(F, [F.mul(at[k], Ub[k][i]) for k in range(4)]) for i in range(4)] for at in at_std]
    if any(x[0] == 0 for x in a):
        return None
    return a, bt


def sum_(F, xs):
    s = 0
    for x in xs:
        s = F.add(s, x)
    return s


def run_schemes(extra=None):
    rng = random.Random(20261125)
    if extra:
        jobs = [(extra, 'F3', load_f3)]
    else:
        jobs = [('verfahren/4x2x4-r26-s001.json', 'Z', load_json)]
        for pth in ['versuche/s2-blind-r1/beispiele-rang26-f2.txt', 'versuche/s2-spurA-r2/daten/rho3_rang26_f2.txt']:
            jobs.append((pth, 'F2', load_hex))
    print('scheme | ring | Brent | rkL rho rkH dimN s | L13 L13prime | dimG invertible | dimI 6-rkL | 8-dimSyz')
    bad = 0
    for pth, ring, loader in jobs:
        schemes = loader(pth if ring == 'F3' else f'{REPO}/{pth}')
        for no, terms in enumerate(schemes):
            F = {'Z': lambda: PrimeField(P61), 'F2': lambda: GF2k(32, POLY32), 'F3': lambda: GF3}[ring]()
            F_chk = {'Z': PrimeField(P61), 'F2': PrimeField(2), 'F3': PrimeField(3)}[ring]
            tc = False
            ok = brent_ok(F_chk, terms, False)
            if not ok:
                ok = brent_ok(F_chk, terms, True)
                tc = True
            # two independent random setups, take max ranks
            best = None
            for rep in range(2):
                st = None
                while st is None:
                    st = setup(F, terms, rng)
                a, bt = st
                d = yang_data(F, a, bt, rng)
                if best is None or (d['rho'], d['rkH']) > (best[0]['rho'], best[0]['rkH']):
                    best = (d, a, bt)
            d, a, bt = best
            r = len(terms)
            l13 = 2 * d['rkH'] >= 3 * d['rho'] + d['rkL']
            l13p = d['rkH'] >= 2 * d['rho'] + d['s'] + -(-(d['rkL'] - d['rho']) // 2)
            G = symmetry_space(F, a, bt)
            inv = has_invertible(F, G, rng)
            I = quadric_ideal(F, a)
            pred = 8 - syz_dim(F, I) if inv else None
            # Lemma V at r = 26: rho = 3 and N != 0 must force symmetry
            lv = not (d['rho'] == 3 and d['dimN'] > 0) or inv
            ls = (pred is None) or (pred == d['rkH'])
            if not (ok and l13 and l13p and lv and ls):
                bad += 1
            print(f"{pth.split('/')[-1]}#{no+1} | {ring} r={r} | {ok}{' (C^T)' if tc else ''} | "
                  f"{d['rkL']} {d['rho']} {d['rkH']} {d['dimN']} {d['s']} | {l13} {l13p} | "
                  f"{len(G)} {inv} | {len(I)} {6 - d['rkL']} | {pred}")
    print('violations:', bad)


# ---------------------------------------------------------------- synthetic symmetric models (Lemma S)

def model(F, pts, rng, special_plane=None, ignore_n1=False):
    """Symmetric data a_t = b_t = pts (in a random basis). special_plane: if given, u_0 is chosen
    as the given linear form (vector) so that the plane {l_{u0} = 0} is that plane."""
    while True:
        Ub = [[F.rand(rng) for _ in range(4)] for _ in range(4)]
        if special_plane is not None:
            for k in range(4):
                Ub[k][0] = special_plane[k]
        if det(F, Ub) != 0:
            break
    a = [[sum_(F, [F.mul(pt[k], Ub[k][i]) for k in range(4)]) for i in range(4)] for pt in pts]
    if any(x[0] == 0 for x in a) and not ignore_n1:
        return None
    # b_t in w-coordinates: take G = identity in u-coordinates, i.e. b_t = a_t (coordinates)
    return a, [list(x) for x in a]


def run_models(field='p61'):
    F = {'p61': lambda: PrimeField(P61), 'f2': lambda: GF2k(32, POLY32), 'f3': lambda: GFpk(3, 17)}[field]()
    print('field:', field)
    rng = random.Random(7)
    R = lambda: F.rand(rng)
    cubic = lambda s: [F.from_int(1), s, F.mul(s, s), F.mul(F.mul(s, s), s)]
    out = []
    # twisted cubic, 25 points -> rkL 3
    out.append(('twisted cubic, 25 pts', [cubic(R()) for _ in range(25)], None))
    # quadric surface x0 x3 = x1 x2 (Segre), 25 pts -> rkL 5
    seg = []
    for _ in range(25):
        x, y = R(), R()
        seg.append([F.from_int(1), x, y, F.mul(x, y)])
    out.append(('smooth quadric, 25 pts', seg, None))
    # twisted cubic + secant line: complete intersection of two quadrics -> rkL 4
    s1, s2 = R(), R()
    P, Qp = cubic(s1), cubic(s2)
    pts = [cubic(R()) for _ in range(20)]
    for _ in range(5):
        lam = R()
        pts.append([F.add(x, F.mul(lam, y)) for x, y in zip(P, Qp)])
    out.append(('cubic + secant line, generic u0', pts, None))
    # special plane: a plane containing the secant line: linear form l with l(P) = l(Q) = 0
    rows = [P, Qp]
    ns = nullspace(F, rows, 4)
    c = R()
    lform = [F.add(ns[0][k], F.mul(c, ns[1][k])) for k in range(4)]
    out.append(('cubic + secant line, u0 plane through the line', pts, lform))
    # 24 cubic pts + 1 random -> rkL 4 (I = quadrics through cubic and the point: 2-dim)
    out.append(('24 cubic pts + 1 random', [cubic(R()) for _ in range(24)] + [[R() for _ in range(4)]], None))
    print('model | rkL rho rkH dimN s | dimI | 8-dimSyz | L13prime ok')
    for name, pts, sp in out:
        best = None
        for rep in range(3):
            m = None
            for _ in range(20):
                m = model(F, pts, rng, sp)
                if m is not None:
                    break
            if m is None:
                break
            a, bt = m
            d = yang_data(F, a, bt, rng)
            I = quadric_ideal(F, a)
            pred = 8 - syz_dim(F, I)
            if best is None or d['rkH'] > best[0]['rkH']:
                best = (d, I, pred)
        if best is None:
            print(f"{name} | u0 not admissible: (N1) fails, some a_t lies in the plane")
            # formula check of Lemma S part 4 anyway (needs only dim J = 4 and I meets x0*R1 trivially)
            a, bt = model(F, pts, rng, sp, ignore_n1=True)
            d = yang_data(F, a, bt, rng)
            I = quadric_ideal(F, a)
            print(f"   same plane, (N1) ignored | {d['rkL']} {d['rho']} {d['rkH']} {d['dimN']} {d['s']} | {len(I)} | {8 - syz_dim(F, I)} | formula only")
            continue
        d, I, pred = best
        l13p = d['rkH'] >= 2 * d['rho'] + d['s'] + -(-(d['rkL'] - d['rho']) // 2)
        print(f"{name} | {d['rkL']} {d['rho']} {d['rkH']} {d['dimN']} {d['s']} | {len(I)} | {pred} | {l13p}")


# ---------------------------------------------------------------- abstract Lemma 13'

def run_l13():
    F = PrimeField(10007)          # small prime on purpose: more special coincidences
    rng = random.Random(3)
    viol = 0
    n = 0
    for trial in range(400):
        dq = rng.choice([3, 4, 5, 6])
        # F_i : K^4 -> K^dq as matrices; random low-rank families
        mats = []
        kind = trial % 4
        for i in range(3):
            rk = rng.choice([1, 2, 3, 4])
            Aa = [[F.rand(rng) for _ in range(rk)] for _ in range(dq)]
            Bb = [[F.rand(rng) for _ in range(4)] for _ in range(rk)]
            M = [[sum_(F, [F.mul(Aa[x][k], Bb[k][y]) for k in range(rk)]) for y in range(4)] for x in range(dq)]
            if kind == 1 and i > 0:      # common kernel vector e_0
                for x in range(dq):
                    M[x][0] = 0
            if kind == 2 and i > 0:      # image inside im F_1
                rnd = [[F.rand(rng) for _ in range(4)] for _ in range(4)]
                M = [[sum_(F, [F.mul(mats[0][x][k], rnd[k][y]) for k in range(4)]) for y in range(4)]
                     for x in range(dq)]
            mats.append(M)
        if kind == 1:
            for x in range(dq):
                mats[0][x][0] = 0
        cols = lambda M: [[M[x][y] for x in range(dq)] for y in range(4)]
        Fm = [cols(M) for M in mats]
        rkL = rank(F, cols_to_rows(Fm[0] + Fm[1] + Fm[2]))
        Z = [0] * dq
        hcols = []
        for j in range(4):
            hcols.append(Fm[1][j] + [F.neg(x) for x in Fm[0][j]] + Z)
            hcols.append(Fm[2][j] + Z + [F.neg(x) for x in Fm[0][j]])
            hcols.append(Z + Fm[2][j] + [F.neg(x) for x in Fm[1][j]])
        rkH = rank(F, cols_to_rows(hcols))
        # rho exactly: enumerate all gamma over the small field is too much; use many random + all 0/1
        rho = 0
        cands = [[F.rand(rng) for _ in range(3)] for _ in range(30)]
        cands += [[x, y, z] for x in (0, 1) for y in (0, 1) for z in (0, 1)]
        best = None
        for g in cands:
            Mg = comb(F, Fm, g)
            rr = rank(F, cols_to_rows(Mg))
            if rr > rho:
                rho, best = rr, g
        # test every candidate gamma* that attains rho (not only a generic one)
        for g in cands:
            Mg = comb(F, Fm, g)
            if rank(F, cols_to_rows(Mg)) != rho or not any(g):
                continue
            # complete g to a basis
            while True:
                xi = [g, [F.rand(rng) for _ in range(3)], [F.rand(rng) for _ in range(3)]]
                if det(F, xi) != 0:
                    break
            Fp = [comb(F, Fm, xi[k]) for k in range(3)]
            rows = [[Fp[0][y][x] for y in range(4)] for x in range(dq)]
            ker = nullspace(F, rows, 4)
            imgs = [apply(F, Fp[1], k) for k in ker] + [apply(F, Fp[2], k) for k in ker]
            s = rank(F, cols_to_rows(imgs)) if imgs else 0
            n += 1
            if rkH < 2 * rho + s + -(-(rkL - rho) // 2):
                viol += 1
                print('VIOLATION', trial, rkL, rho, rkH, s)
    print(f'Lemma 13prime: {n} (triple, gamma*) checks, violations: {viol}')


GF3 = None

if __name__ == '__main__':
    if sys.argv[1] == 'modelle' and len(sys.argv) > 2:
        run_models(sys.argv[2])
    elif sys.argv[1] == 'f3':
        GF3 = GFpk(3, 17)
        run_schemes(sys.argv[2])
    else:
        {'schemes': run_schemes, 'modelle': run_models, 'l13': run_l13}[sys.argv[1]]()
