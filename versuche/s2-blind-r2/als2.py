# ALS for rank 25: phase1 regularized, phase2 tiny regularisation to see border behaviour
import numpy as np, sys, time
from lm import mm_tensor
from als import als
T=mm_tensor(4,2,4)
R=int(sys.argv[1]); s0,s1=int(sys.argv[2]),int(sys.argv[3]); cplx=sys.argv[4]=='c'; lamend=float(sys.argv[5])
for s in range(s0,s1):
    res,nrm,_=als(T,R,s,iters=30000,cplx=cplx,lam0=1e-2,lamend=lamend)
    print(f"R={R} c={cplx} lamend={lamend} seed={s} res={res:.4e} max={nrm:.3e}",flush=True)
