#!/usr/bin/env python3
"""Normal form (SN1)+(K1) of a known scheme for a GIVEN small change of basis (S, T) (S4-16).
Exact over Q (fractions). Prints dim N, the exact Brent check, (SN1)/(K1) and the
heights/denominators of u, v, w in the normal form.
Usage: python3 nf_klein.py <scheme.json> "[[S row 0], ...]" "[[T row 0], ...]"
"""
import sys, random
sys.path.insert(0,'.')
from fractions import Fraction as F
import nf_check as N
from exact import load_json, brent_errors, check_k1
d,sch=load_json(sys.argv[1]); m=d['m']
S=[[F(x) for x in r] for r in eval(sys.argv[2])]; T=[[F(x) for x in r] for r in eval(sys.argv[3])]
class _Unused:
    def __init__(s): s.r=random.Random(0); s.first=True
    def randint(s,a,b):
        return s.r.randint(a,b)
# monkeypatch: use given S,T
orig=N.normal_form
def nf(scheme,m,rng):
    sch2=N.transform(scheme,S,T)
    out=[]
    for (u,v,w) in sch2:
        a=u[0][0]; out.append(([[x/a for x in r] for r in u],v,[[x*a for x in r] for r in w]))
    return out
s1=nf(sch,m,None)
# compute N etc as in nf_check
M=[[v[1][l] for l in range(m)] for (u,v,w) in s1]; lam=[u[1][0] for (u,v,w) in s1]; mu=[u[2][0] for (u,v,w) in s1]
rows=[]
for r in range(len(s1)):
    rows.append([lam[r]*M[r][l] for l in range(m)]+[-M[r][l] for l in range(m)]+[F(0)]*m)
    rows.append([mu[r]*M[r][l] for l in range(m)]+[F(0)]*m+[-M[r][l] for l in range(m)])
ker=N.nullspace(rows,3*m); print('dimN',len(ker))
vec=ker[0]; x0,y1,y2=vec[:m],vec[m:2*m],vec[2*m:]
cols=[]
for l in range(m):
    e=[F(int(q==l)) for q in range(m)]
    if len(cols)<m-3 and N.rank(cols+[e,y2,y1,x0],m)==len(cols)+4: cols.append(e)
cols+=[y2,y1,x0]; Q=N.transpose(cols); QiT=N.transpose(N.inverse(Q))
s2=[(u,N.matmul(v,Q),N.matmul(w,QiT)) for (u,v,w) in s1]
# scale v so that largest entry 1
print('brent',brent_errors(s2,m),'K1',check_k1(s2,m))
for name,idx in (('u',0),('v',1),('w',2)):
    h=max(max(abs(x.numerator),x.denominator) for p in s2 for r in p[idx] for x in r)
    dn=sorted({x.denominator for p in s2 for r in p[idx] for x in r})
    print(name,'height',h,'denoms',dn[:20])
print([[str(x) for x in r] for r in s2[0][0]],[[str(x) for x in r] for r in s2[0][1]])
