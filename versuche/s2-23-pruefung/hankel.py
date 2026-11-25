"""Check of step (A4) in Satz E (S2-16): a 4x2 Hankel matrix (h_{i+j}), h in K^5, has rank <= 1
iff h = 0 or h = c * (alpha^{4-k} beta^k)_k for some c != 0 and (alpha:beta) in P^1(K).
Exhaustive over small fields, including characteristic 2 and 3."""
from gf import fields, rank
import itertools

for name, F in fields().items():
    q = F.q
    rank1 = set()
    for h in itertools.product(range(q), repeat=5):
        M = [[h[i + j] for j in range(2)] for i in range(4)]
        if rank(F, M) <= 1:
            rank1.add(h)
    ev = {(0,) * 5}
    pts = [(1, b) for b in range(q)] + [(0, 1)]
    for (a, b) in pts:
        for c in range(1, q):
            v = []
            for k in range(5):
                x = c
                for _ in range(4 - k): x = F.mul(x, a)
                for _ in range(k): x = F.mul(x, b)
                v.append(x)
            ev.add(tuple(v))
    ok = rank1 == ev
    print(f"{name}: rank<=1 Hankel vectors {len(rank1)}, zero+c*ev_sigma {len(ev)}, "
          f"expected 1+(q-1)(q+1) = {1 + (q - 1) * (q + 1)}, equal: {ok}")
    assert ok
print("A4 bestaetigt in allen Testkoerpern")
