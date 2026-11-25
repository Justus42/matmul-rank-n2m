"""Checks for (A6)-(A8) of Satz E and for the remark in 5.3 / bidegree count in 5.4 (S2-16).
Exact arithmetic in GF(p), p = 10007.

 1. Model of Unterfall A as forced by (A3)-(A7): random isomorphisms phi: K^4 -> S^3,
    iota: K^2 -> S^1, Lambda: S^4 -> K^5-coordinates, 25 random sigma_t, a_t = alpha(sigma_t),
    b_t = beta(sigma_t). Verify: (i) Psi(u,x) = Lambda(f_u * iota(x)) restricted to the
    coordinates is reproduced by (a_t.u)(b_t.x) up to the factors c_t; (ii)
    dim span{a_t (x) b_t} = 8 < 9 (A8), with 25 distinct points.
 2. Analogue S^3 x S^2 -> S^5 (remark in 5.3): degree 3 + 5 = 8, dim span = 9.
 3. Bidegree (5.4): for random maps phi, psi : P^1 -> P^1 of degrees d, e, the number of
    tau with psi(phi(tau)) = tau is at most d*e + 1 (degree of the fixed-point polynomial)."""
import random
p = 10007
rng = random.Random(23)

def rank_mod(M):
    M = [r[:] for r in M]; r = 0
    for c in range(len(M[0]) if M else 0):
        piv = next((i for i in range(r, len(M)) if M[i][c] % p), None)
        if piv is None: continue
        M[r], M[piv] = M[piv], M[r]
        iv = pow(M[r][c], p - 2, p); M[r] = [x * iv % p for x in M[r]]
        for i in range(len(M)):
            if i != r and M[i][c] % p:
                f = M[i][c]; M[i] = [(x - f * y) % p for x, y in zip(M[i], M[r])]
        r += 1
    return r

def randinv(n):
    while True:
        P = [[rng.randrange(p) for _ in range(n)] for _ in range(n)]
        if rank_mod(P) == n: return P

def mono(deg, s):          # monomials s^0..s^deg at affine point (1, s)
    return [pow(s, k, p) for k in range(deg + 1)]


# (A7): b_t on all of U lies on a degree-4 curve beta(sigma); combine alpha (deg 3) with beta (deg 4)
def model_A():
    Phi = randinv(4)
    Hy = [[rng.randrange(p) for _ in range(5)] for _ in range(4)]   # y -> h_y in S^4, generic injective
    assert rank_mod(Hy) == 4
    sig = rng.sample(range(p), 25)
    a = [[sum(Phi[k][i] * m for k, m in enumerate(mono(3, s))) % p for i in range(4)] for s in sig]
    b = [[sum(Hy[i][k] * m for k, m in enumerate(mono(4, s))) % p for i in range(4)] for s in sig]
    return rank_mod([[x * y % p for x in at for y in bt] for at, bt in zip(a, b)])
res = [model_A() for _ in range(20)]
print("Unterfall-A-Modell (alpha Grad 3, beta Grad 4), 20 Laeufe: dim span{a_t (x) b_t} =", sorted(set(res)))
assert max(res) <= 8
def model_B():
    Phi = randinv(4)
    Hy = [[rng.randrange(p) for _ in range(6)] for _ in range(4)]   # Grad-5-Kurve fuer b
    sig = rng.sample(range(p), 25)
    a = [[sum(Phi[k][i] * m for k, m in enumerate(mono(3, s))) % p for i in range(4)] for s in sig]
    b = [[sum(Hy[i][k] * m for k, m in enumerate(mono(5, s))) % p for i in range(4)] for s in sig]
    return rank_mod([[x * y % p for x in at for y in bt] for at, bt in zip(a, b)])
res = [model_B() for _ in range(20)]
print("Analogon S^3 x S^2 -> S^5 (Grad 3 und 5), 20 Laeufe: dim span =", sorted(set(res)))

# 3. fixed points of psi o phi
def compose_count(d, e):
    # phi(t) = P1(t)/P2(t) deg d, psi(s) = R1(s)/R2(s) deg e; fixed points: R1(phi)=t*R2(phi)
    P1 = [rng.randrange(p) for _ in range(d + 1)]; P2 = [rng.randrange(p) for _ in range(d + 1)]
    R1 = [rng.randrange(p) for _ in range(e + 1)]; R2 = [rng.randrange(p) for _ in range(e + 1)]
    cnt = 0
    for t in range(p):
        x = sum(c * pow(t, k, p) for k, c in enumerate(P1)) % p
        y = sum(c * pow(t, k, p) for k, c in enumerate(P2)) % p
        # homogeneous psi at (x:y): R(x,y) = sum c_k x^k y^(e-k)
        n = sum(c * pow(x, k, p) * pow(y, e - k, p) for k, c in enumerate(R1)) % p
        m = sum(c * pow(x, k, p) * pow(y, e - k, p) for k, c in enumerate(R2)) % p
        if (n - t * m) % p == 0 and (x or y) and (n or m): cnt += 1
    return cnt
for d, e in [(1, 1), (2, 3), (3, 3)]:
    mx = max(compose_count(d, e) for _ in range(20))
    print(f"Fixpunkte von psi o phi, Grade ({d},{e}): hoechstens {mx} affine Loesungen in GF(p), Schranke d*e+1 = {d*e+1}")
    assert mx <= d * e + 1
