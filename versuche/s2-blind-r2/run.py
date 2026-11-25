import sys, json
from symsat import *
F=Fmt(4,2,4)
c4=F.perm((1,2,3,0),(0,1),(1,2,3,0))
c2=compose(c4,c4)
tau=F.tau()
sw=F.perm((1,0,3,2),(1,0),(1,0,3,2))   # swap j combined with row/col pair swap
idj=F.perm((1,0,3,2),(0,1),(1,0,3,2))
grp={'c4':([c4],{'1':[],'2':[c2],'4':[c4]}),
     'tau':([tau],{'1':[],'2':[tau]}),
     'c2':([c2],{'1':[],'2':[c2]}),
     'sw':([sw],{'1':[],'2':[sw]}),
     'c4tau':([c4,tau],None)}
name=sys.argv[1]; spec=sys.argv[2]; tl=float(sys.argv[3])
gens,st=grp[name]
# spec like "4x6,1x1": 6 free orbits (trivial stab) ... we encode as orbitsize x count
orbs=[]
for part in spec.split(','):
    sz,cnt=part.split('x')
    # stabilizer key = group order / orbit size
    G=closure(gens,F.N); key=str(len(G)//int(sz))
    orbs+= [st[key]]*int(cnt)
R,sat,dt,out,nv=solve(F,gens,orbs,tl=tl)
ok=verify(F,out) if out else None
print(f"{name} {spec} R={R} sat={sat} t={dt:.1f} verified={ok}",flush=True)
if out: json.dump(out,open(f"sol_{name}_{spec}.json","w"))
