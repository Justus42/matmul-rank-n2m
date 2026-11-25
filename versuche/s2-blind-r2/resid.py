import numpy as np
from lm import mm_tensor
from als import als
T=mm_tensor(4,2,4)
for s in range(6):
    res,nrm,(U,V,W)=als(T,25,s,iters=20000)
    E=T-np.einsum('ir,jr,kr->ijk',U,V,W)
    idx=np.argwhere(abs(E)>1e-3)
    print(s,round(res,4),[ (tuple(x),round(E[tuple(x)],3)) for x in idx][:6], 'svals mode1',np.round(np.linalg.svd(E.reshape(8,-1),compute_uv=False)[:3],3))
