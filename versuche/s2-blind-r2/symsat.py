# SAT search over GF(2) for <n,k,m> decompositions invariant under a permutation-type symmetry group.
# Term = vector of n*k + k*m + n*m coordinates (u, v, w as in verfahren/README.md, w not transposed).
import itertools, sys, time, json
import pycryptosat
class Fmt:
    def __init__(s,n,k,m):
        s.n,s.k,s.m=n,k,m
        s.U=lambda i,j:i*k+j
        s.V=lambda j,l:n*k+j*m+l
        s.W=lambda i,l:n*k+k*m+i*m+l
        s.N=n*k+k*m+n*m
    def perm(s,sig,rho,pi):
        g=[0]*s.N
        for i in range(s.n):
            for j in range(s.k): g[s.U(i,j)]=s.U(sig[i],rho[j])
        for j in range(s.k):
            for l in range(s.m): g[s.V(j,l)]=s.V(rho[j],pi[l])
        for i in range(s.n):
            for l in range(s.m): g[s.W(i,l)]=s.W(sig[i],pi[l])
        return tuple(g)
    def tau(s):  # needs n==m: (u,v,w) -> (v^T,u^T,w^T)
        assert s.n==s.m
        g=[0]*s.N
        for a in range(s.n):
            for b in range(s.k):
                g[s.U(a,b)]=s.V(b,a); g[s.V(b,a)]=s.U(a,b)
        for a in range(s.n):
            for b in range(s.m): g[s.W(a,b)]=s.W(b,a)
        return tuple(g)
def compose(g,h):  # apply h then g
    return tuple(g[h[c]] for c in range(len(h)))
def closure(gens,N):
    e=tuple(range(N)); G={e}; fr=[e]
    while fr:
        x=fr.pop(); 
        for g in gens:
            y=compose(g,x)
            if y not in G: G.add(y); fr.append(y)
    return sorted(G)
def cosets(G,H):
    seen=set(); reps=[]
    for g in G:
        if g in seen: continue
        reps.append(g)
        for h in H: seen.add(compose(g,h))
    return reps
def build(F,gens,orbit_stabs,extra_zero_check=True):
    """orbit_stabs: list of lists of generators of stabilizer subgroups (each list = one orbit)."""
    N=F.N; G=closure(gens,N)
    nv=[0]
    def new():
        nv[0]+=1; return nv[0]
    terms=[]; clauses=[]; xors=[]
    for stab in orbit_stabs:
        H=closure(stab,N)
        assert set(H)<=set(G)
        x=[new() for _ in range(N)]
        for h in H:   # h.x = x : new coord h(c) holds x[c], must equal x[h(c)]
            for c in range(N):
                if h[c]!=c: xors.append(([x[c],x[h[c]]],False))
        for g in cosets(G,H):
            t=[0]*N
            for c in range(N): t[g[c]]=x[c]
            terms.append(t)
    R=len(terms)
    cache={}
    def AND(vs):
        vs=tuple(sorted(set(vs)))
        if vs in cache: return cache[vs]
        p=new(); cache[vs]=p
        for v in vs: clauses.append([-p,v])
        clauses.append([p]+[-v for v in vs])
        return p
    n,k,m=F.n,F.k,F.m
    for i,j in itertools.product(range(n),range(k)):
        for j2,l in itertools.product(range(k),range(m)):
            for i2,l2 in itertools.product(range(n),range(m)):
                a,b,c=F.U(i,j),F.V(j2,l),F.W(i2,l2)
                d=(i==i2 and j==j2 and l==l2)
                xors.append(([AND([t[a],t[b],t[c]]) for t in terms],d))
    return R,terms,clauses,xors,nv[0]
def solve(F,gens,orbit_stabs,tl=600,threads=1):
    R,terms,clauses,xors,nvars=build(F,gens,orbit_stabs)
    S=pycryptosat.Solver(threads=threads,time_limit=tl)
    for c in clauses: S.add_clause(c)
    for vs,rhs in xors: S.add_xor_clause(vs,rhs)
    t0=time.time(); sat,sol=S.solve(); dt=time.time()-t0
    out=None
    if sat:
        out=[[1 if sol[v] else 0 for v in t] for t in terms]
    return R,sat,dt,out,nvars
def verify(F,terms,p=2):
    n,k,m=F.n,F.k,F.m
    for i,j,j2,l,i2,l2 in itertools.product(range(n),range(k),range(k),range(m),range(n),range(m)):
        s=sum(t[F.U(i,j)]*t[F.V(j2,l)]*t[F.W(i2,l2)] for t in terms)%p
        if s!=(1 if (i==i2 and j==j2 and l==l2) else 0): return False
    return True
