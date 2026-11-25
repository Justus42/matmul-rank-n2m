import numpy as np, sys, time
from lm import mm_tensor
def als(T,R,seed,iters=20000,cplx=False,lam0=1e-2,lamend=1e-9):
    rng=np.random.default_rng(seed); I,J,K=T.shape
    def rnd(*s):
        x=rng.standard_normal(s)
        if cplx: x=x+1j*rng.standard_normal(s)
        return x*0.5
    U,V,W=rnd(I,R),rnd(J,R),rnd(K,R)
    T1=T.reshape(I,J*K); T2=T.transpose(1,0,2).reshape(J,I*K); T3=T.transpose(2,0,1).reshape(K,I*J)
    kr=lambda A,B:(A[:,None,:]*B[None,:,:]).reshape(-1,A.shape[1])
    for it in range(iters):
        lam=lam0*(lamend/lam0)**(it/iters)
        G=(V.conj().T@V)*(W.conj().T@W); U=np.linalg.solve(G+lam*np.eye(R),(T1@kr(V,W).conj()).T).T
        G=(U.conj().T@U)*(W.conj().T@W); V=np.linalg.solve(G+lam*np.eye(R),(T2@kr(U,W).conj()).T).T
        G=(U.conj().T@U)*(V.conj().T@V); W=np.linalg.solve(G+lam*np.eye(R),(T3@kr(U,V).conj()).T).T
    res=np.linalg.norm(np.einsum('ir,jr,kr->ijk',U,V,W)-T)
    return res,max(abs(U).max(),abs(V).max(),abs(W).max()),(U,V,W)
if __name__=="__main__":
    R,s0,s1=map(int,sys.argv[1:4]); cplx=len(sys.argv)>4 and sys.argv[4]=='c'
    T=mm_tensor(4,2,4)
    for s in range(s0,s1):
        t0=time.time(); res,nrm,_=als(T,R,s,cplx=cplx)
        print(f"R={R} seed={s} res={res:.3e} max={nrm:.2e} t={time.time()-t0:.1f}",flush=True)
