# Levenberg-Marquardt search for rank-R decompositions of <n,k,m> over R or C.
import numpy as np, sys, time
def mm_tensor(n,k,m):
    T=np.zeros((n*k,k*m,n*m))
    for i in range(n):
        for j in range(k):
            for l in range(m):
                T[i*k+j, j*m+l, i*m+l]=1
    return T
def run(n,k,m,R,seed,iters=3000,cplx=False,lam_reg=0.0):
    rng=np.random.default_rng(seed)
    T=mm_tensor(n,k,m); I,J,K=T.shape
    dt=complex if cplx else float
    def rnd(*s):
        x=rng.standard_normal(s)
        if cplx: x=x+1j*rng.standard_normal(s)
        return x*0.5
    U,V,W=rnd(I,R),rnd(J,R),rnd(K,R)
    mu=1.0
    t=T.astype(dt).ravel()
    def resid(U,V,W):
        return np.einsum('ir,jr,kr->ijk',U,V,W).ravel()-t
    r=resid(U,V,W); f=np.vdot(r,r).real+lam_reg*(np.sum(abs(U)**2)+np.sum(abs(V)**2)+np.sum(abs(W)**2))
    for it in range(iters):
        # Jacobian
        JU=np.einsum('jr,kr,ia->ijkar',V,W,np.eye(I)).reshape(I*J*K,I*R)
        JV=np.einsum('ir,kr,jb->ijkbr',U,W,np.eye(J)).reshape(I*J*K,J*R)
        JW=np.einsum('ir,jr,kc->ijkcr',U,V,np.eye(K)).reshape(I*J*K,K*R)
        Jm=np.hstack([JU,JV,JW])
        x=np.concatenate([U.ravel(),V.ravel(),W.ravel()])
        g=Jm.conj().T@r+lam_reg*x
        H=Jm.conj().T@Jm+lam_reg*np.eye(len(x))
        while True:
            dx=np.linalg.solve(H+mu*np.eye(len(x)),-g)
            xn=x+dx
            Un=xn[:I*R].reshape(I,R);Vn=xn[I*R:I*R+J*R].reshape(J,R);Wn=xn[I*R+J*R:].reshape(K,R)
            rn=resid(Un,Vn,Wn); fn=np.vdot(rn,rn).real+lam_reg*np.vdot(xn,xn).real
            if fn<f:
                U,V,W,r,f=Un,Vn,Wn,rn,fn; mu=max(mu/3,1e-12); break
            mu*=4
            if mu>1e12: break
        if mu>1e12: break
        if np.vdot(r,r).real<1e-26: break
    res=np.sqrt(np.vdot(r,r).real)
    nrm=max(np.abs(U).max(),np.abs(V).max(),np.abs(W).max())
    return res,nrm,it,(U,V,W)
if __name__=="__main__":
    n,k,m,R,s0,s1=map(int,sys.argv[1:7]); cplx=len(sys.argv)>7 and sys.argv[7]=='c'
    lam=float(sys.argv[8]) if len(sys.argv)>8 else 0.0
    for s in range(s0,s1):
        t0=time.time();res,nrm,it,_=run(n,k,m,R,s,cplx=cplx,lam_reg=lam)
        print(f"seed={s} res={res:.3e} maxcoef={nrm:.2e} it={it} t={time.time()-t0:.1f}",flush=True)
