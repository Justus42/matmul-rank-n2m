#!/usr/bin/env python3
"""Diagnostic run (S4-16, section 5.3 of the report): after struct_stage, fix u entries one by one
to fractions with denominator <= 4 and report the local dimension and the remaining non-simple u entries.
Usage: python3 diag_u.py <candidate.json>  (writes <candidate>.ufix.npy / .ufix.json next to it)"""
import sys,json,random,numpy as np
from fractions import Fraction
sys.path.insert(0,'.')
import rounding as RD, varpro
c=json.load(open(sys.argv[1])); m,R=c['m'],c['R']
vp=varpro.VP(m,R,c['sn1'],c['k1'])
U=np.array(c['U']).reshape(R,6);V=np.array(c['V']).reshape(R,-1)
x=np.array([U[r,a] if t=='u' else V[r,a] for (t,r,a) in vp.names])
def tdim(vp,z):
    r,J,_,_=vp.res_jac(z); s=np.linalg.svd(J,compute_uv=False); return J.shape[1]-(s>1e-8*s[0]).sum()
z,fixed,frac,prio=RD.struct_stage(vp,x,random.Random(1),print,D=4)
print('dim after struct',tdim(vp,z))
uq=[q for q,(t,r,a) in enumerate(vp.names) if t=='u']
while True:
    xfull=vp.expand(z)
    free=[q for q in uq if q not in fixed]
    # already simple?
    cands=sorted((abs(xfull[q]-float(Fraction(xfull[q]).limit_denominator(4))),q) for q in free)
    done=False
    for d,q in cands[:10]:
        f=Fraction(xfull[q]).limit_denominator(4)
        res=RD.continuation(vp,z,fixed,{q:float(f)},steps=5)
        if res is not None:
            z,fixed=res; frac[q]=f; done=True; break
    if not done: break
    xf=vp.expand(z)
    nonsimple=[q for q in uq if q not in fixed and abs(xf[q]-float(Fraction(xf[q]).limit_denominator(12)))>1e-9]
    print('fixed u',len([q for q in fixed if q in uq]),'dim',tdim(vp,z),'u non-simple left',len(nonsimple), 'last',q,f,flush=True)
    if not nonsimple: break
xf=vp.expand(z)
print('U values', sorted(set(str(Fraction(xf[q]).limit_denominator(100)) for q in uq)))
np.save(sys.argv[1]+'.ufix.npy',xf)
json.dump({str(q):str(f) for q,f in frac.items()},open(sys.argv[1]+'.ufix.json','w'))
