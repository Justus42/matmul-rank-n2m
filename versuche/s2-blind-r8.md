# S2-33: Blind-Sucher Runde 8 zu ⟨4,2,4⟩

Auftrag S2-33, Stufe 2, Runde 8, Rolle Blind-Sucher. Datum 25.11.2026.
Alle Aussagen dieses Berichts haben den Status **behauptet**, soweit nicht ausdrücklich „vermutet“ dasteht. Nichts hier ist geprüft.

## 1. Ergebnis in Kürze

- Kein Beweis von R(⟨4,2,4⟩) ≥ 26 und kein Verfahren mit 25 Produkten.
- **Reduktionslemma (behauptet, über jedem Körper):** Sei T′ die Einschränkung von ⟨4,2,4⟩ auf die Hyperebene x₀₀ + x₁₁ = 0 im Raum der 4×2-Matrizen X. Wenn R(T′) ≥ 25, dann R(⟨4,2,4⟩) ≥ 26. Umgekehrt gilt R(T′) ≤ 25 (aus dem Verfahren `verfahren/4x2x4-r26-s001.json`, siehe 3.3). Die Frage 25 oder 26 ist damit auf die hinreichende Frage „hat T′ Rang 24 oder 25?“ zurückgeführt.
- **Zweite Stufe (behauptet):** Wenn R(T″) ≥ 24 für jede Einschränkung T″ = T′|_{m=0} mit einer Linearform m vom Matrixrang 2 auf den 2×4-Matrizen Y, dann R(T′) ≥ 25. Hier fehlt die Einteilung der Paare (ℓ, m) in Bahnen.
- **Rechnerischer Hinweis (kein Beleg):** Eine Flip-Graph-Suche über 𝔽₂ fand für T′ von vier verschiedenen 25er-Startpunkten aus in je 9,5 Minuten kein Verfahren mit 24 Produkten. Zur Kontrolle fand dieselbe Suche das bekannte Optimum 20 für ⟨3,2,4⟩ und 24 für die Einschränkung auf x₀₀ = 0 in Sekunden. Das stützt die Vermutung R(T′) = 25 nur schwach.

## 2. Ansatz: Gewichte aus Abflachungen plus eine Substitution

Schreibweise: X ist 4×2 mit Einträgen x_{ik}, Y ist 2×4 mit Einträgen y_{kj}, das Produkt C = XY ist 4×4. Ein Verfahren vom Rang r ist eine Zerlegung
XY = Σ_{t=1}^{r} u_t(X) · v_t(Y) · W_t
mit Linearformen u_t, v_t und Matrizen W_t ∈ K^{4×4}. Jede Linearform u_t schreibe ich als u_t(X) = Σ U_t[i,k] x_{ik} mit einer 4×2-Matrix U_t und setze rk u_t := Rang von U_t ∈ {1, 2}. Ebenso rk v_t ∈ {1,2} über die 2×4-Matrix V_t.

### 2.1 Gewichtslemma (behauptet, jeder Körper)

Für jede Zerlegung von ⟨4,2,4⟩ gilt Σ_t rk u_t ≥ 32 und Σ_t rk v_t ≥ 32.

Beweis. Der Tensor ist T = Σ_{i,k,j} e_{ik} ⊗ f_{kj} ⊗ g_{ij} in A ⊗ B ⊗ C mit A = K⁴ ⊗ K² (Indizes i, k), B = K² ⊗ K⁴ (k, j), C = K⁴ ⊗ K⁴ (i, j). Ich fasse T als Matrix mit Zeilenindex (i aus A, ganz B) und Spaltenindex (k aus A, ganz C) auf. Der Eintrag zu Zeile (i, (k′, j)) und Spalte (k, (i′, j′)) ist 1 genau für i = i′, k = k′, j = j′, sonst 0. Jede Zeile und jede Spalte enthält genau eine 1, es ist eine Permutationsmatrix der Größe 32, Rang 32 über jedem Körper. Ein Summand u ⊗ v ⊗ W mit U = Σ_{l=1}^{s} p_l ⊗ κ_l (s = rk u, p_l ∈ K⁴, κ_l ∈ K²) wird zur Matrix Σ_l (p_l ⊗ v)(κ_l ⊗ W)ᵀ vom Rang höchstens s. Die Rangfunktion ist subadditiv, also 32 ≤ Σ_t rk u_t. Für v genauso mit der Gruppierung (j aus B, ganz A) gegen (k aus B, ganz C). ∎

Folge: In einem Verfahren mit 25 Produkten haben mindestens 7 der u_t den Rang 2 (und mindestens 7 der v_t). Das Lemma ist eine Standardabflachung und für sich keine neue Schranke. Für die W_t gilt dasselbe mit Σ rk W_t ≥ 32 (Gruppierung (A, j) gegen (B, i)), das hilft wegen rk W_t ≤ 4 nicht.

### 2.2 Reduktionslemma (behauptet, jeder Körper)

Die Symmetrien (X, Y, C) ↦ (PXQ⁻¹, QYR, PCR) mit P, R ∈ GL₄, Q ∈ GL₂ lassen ⟨4,2,4⟩ fest und wirken auf die Linearformen u ↔ U durch U ↦ P⁻ᵀ U Qᵀ. Alle Linearformen vom Rang 2 liegen deshalb in einer Bahn, Vertreter ℓ(X) = x₀₀ + x₁₁.

Sei R(⟨4,2,4⟩) ≤ 25. Nach 2.1 hat ein Summand t einen Faktor u_t vom Rang 2. Schränkt man X auf die Hyperebene {u_t = 0} ein, verschwindet Summand t, also hat die Einschränkung höchstens Rang 24. Wegen der Symmetrie ist diese Einschränkung zu T′ := ⟨4,2,4⟩|_{ℓ=0} isomorph. Also R(T′) ≤ 24. Kontraposition: **R(T′) ≥ 25 ⟹ R(⟨4,2,4⟩) ≥ 26.** ∎

Für Linearformen vom Rang 1 ist die Lage anders: Auf x₀₀ = 0 zerfällt ⟨4,2,4⟩ in ⟨3,2,4⟩ (Zeilen 1 bis 3, Rang 20) und die vier Produkte x₀₁·y₁ⱼ, also Rang höchstens 24. Die Suche fand 24 sofort. Deshalb trägt nur die Rang-2-Bahn, und genau dafür sorgt das Gewichtslemma.

### 2.3 Zweite Stufe (behauptet bis auf die Bahnfrage)

Die Abflachung aus 2.1 für v, auf T′ angewandt (Zeilen: j aus B mal Basis des 7-dimensionalen Raums {ℓ = 0}), hat Rang 28 (exakt nachgerechnet, `flat.py`, Rang mod 1000003, Matrix mit Einträgen 0, ±1; eine Einschränkung um eine Dimension auf der A-Seite streicht genau 4 Zeilen der Permutationsmatrix, daher 32 − 4 = 28 über jedem Körper). Hat T′ ein Verfahren mit 24 Produkten, so hat wegen 28 > 24 ein Summand ein v_t vom Rang 2, und T″ := T′|_{v_t=0} hat Rang höchstens 23. Also:

**Wenn R(T′|_{m=0}) ≥ 24 für jede Linearform m vom Rang 2 auf Y, dann R(T′) ≥ 25 und damit R(⟨4,2,4⟩) ≥ 26.**

Offen ist, in wie viele Bahnen die Paare (ℓ, m) unter dem Stabilisator von ℓ zerfallen (über unendlichen Körpern womöglich mit Parametern). Die w-Abflachung von T″ hat bei 254 zufälligen m vom Rang 2 stets Rang 26; mit 23 Summanden und rk W ≤ 4 folgt daraus nichts. Eine dritte Stufe mit reinen Abflachungen trägt nicht: die Lücke zwischen Abflachungsrang und Zielrang schrumpft je Stufe um etwa 3 (32 gegen 25, 28 gegen 24, 24 bis 26 gegen 23). Für die Restfälle braucht es ein anderes Argument.

## 3. Rechnungen

Alle Rechnungen über 𝔽₂, eigene Programme (Anhang), 4 Kerne, jeder Block unter 10 Minuten, zusammen unter 30 Minuten Rechenzeit je Block.

### 3.1 Kontrolle der Suche

Flip-Graph-Zufallswanderung über 𝔽₂ mit Plus-Übergängen (eigene Umsetzung der Idee von Kauers und Moosbauer, kein fremder Code), Startpunkte durch Einschränkung bzw. Quotientenbildung aus `verfahren/4x2x4-r26-s001.json` modulo 2.

| Tensor | Start | Ziel | Ergebnis |
|---|---|---|---|
| ⟨3,2,4⟩ (Zeile 3 gestrichen) | 22 | 20 | gefunden nach 380 160 Schritten (Optimum 20 laut HK/Yang) |
| ⟨4,2,4⟩ auf x₀₀ = 0 | 26 | 24 | gefunden nach 5 661 Schritten |
| ⟨4,2,4⟩ | 26 | 25 | nicht gefunden (60 s, erwartet) |

### 3.2 Hauptsuche: T′ mit 24 Produkten

Das 26er-Verfahren hat über 𝔽₂ genau sechs Summanden mit rk u_t = 2 (Summanden 3, 4, 5, 12, 14, 15 bei Zählung ab 0), und Σ rk u_t = 32: das Gewichtslemma ist an diesem Verfahren scharf. Einschränkung auf {u_t = 0} gibt jeweils ein Verfahren für T′ mit 25 Produkten.

| Start (Summand t) | Ziel | Laufzeit | Ergebnis |
|---|---|---|---|
| 3 | 24 | 570 s | nicht gefunden, bester Rang 25 |
| 4 | 24 | 570 s | nicht gefunden, bester Rang 25 |
| 5 | 24 | 570 s | nicht gefunden, bester Rang 25 |
| 12 | 24 | 570 s | nicht gefunden, bester Rang 25 |

Status: **vermutet** R(T′) = 25 über 𝔽₂. Eine erfolglose Suche ist kein Beleg.

### 3.3 Obere Schranke R(T′) ≤ 25

Über 𝔽₂ nachgerechnet (Prüfung des Ergebnisses in `drv.py` gegen den Tensor). Über ℚ gilt dasselbe, weil die Einschränkung eines ganzzahligen Verfahrens auf {u_t = 0} wieder ein Verfahren ist und u_t mit Rang 2 über 𝔽₂ auch über ℚ Rang 2 hat. Über anderen Körpern nicht einzeln nachgesehen.

## 4. Sackgassen

1. **SAT direkt über 𝔽₂** (CryptoMiniSat mit XOR-Klauseln, ein Summand je 8+8+16 bzw. 8+8+12 Variablen): fand schon ⟨3,2,4⟩ mit Rang 20 in 2 Minuten nicht. Für eine untere Schranke (Unerfüllbarkeit bei 25) aussichtslos in 30 Minuten. Abgebrochen.
2. **Substitution auf der Ausgabeseite** (Quotient C/⟨W⟩ für W vom Rang 1 bis 3): Suchläufe mit Ziel 24 blieben bei 26 hängen (Start ohne Reduktion, also schwacher Test). Selbst wenn diese Quotienten Rang ≥ 25 hätten, folgt nichts für alle W, und das W-Gewicht (Σ rk W_t ≥ 32) erzwingt keine bestimmte Bahn. Nicht weiter verfolgt.
3. **Substitution mit Rang-1-Formen auf X oder Y:** trägt nicht, Rang der Einschränkung ist 24 (2.2).
4. **Reine Abflachungen:** höchstens 32 Spalten, liefern allein nicht einmal 25; nur als Gewichtszähler brauchbar.
5. **Suche nach 25 für ⟨4,2,4⟩ selbst:** nur als Kontrolle 60 s, nicht ernsthaft betrieben (Schwerpunkt untere Schranke).

## 5. Vorschläge

1. Prüfer und Fremdmodell auf das Reduktionslemma 2.2 mit dem Gewichtslemma 2.1 ansetzen. Beides ist kurz und sollte sich direkt in Lean schreiben lassen (Permutationsmatrix, Subadditivität des Rangs, Symmetrie auf die Rang-2-Bahn).
2. Die eigentliche Arbeit ist R(T′) ≥ 25 für T′ = ⟨4,2,4⟩|_{x₀₀+x₁₁=0}. Das ist ein kleinerer Tensor (7 × 8 × 16) als ⟨4,2,4⟩. Möglich wären Yang-artige Argumente direkt auf T′ oder eine Einteilung der Paare (ℓ, m) nach 2.3. Über 𝔽₂ und 𝔽₃ könnte ein Zertifikat nach Wang26 für T′ leichter sein als für ⟨4,2,4⟩ (eine Dimension weniger, Symmetrien bleiben teilweise erhalten).
3. Falls die Spur A schon eine Fallunterscheidung hat: prüfen lassen, ob einer ihrer Fälle T′ entspricht. Das habe ich als Blind-Sucher nicht nachgesehen.

## 6. Offenlegung (Blindheit)

- **Gelesen und benutzt:** `PROTOKOLL.md`, `CLAUDE.md`, `lit/QUELLEN.md` (Abschnitte Quellenliste und A-04 bis A-06), `verfahren/4x2x4-r26-s001.json` (als Startpunkt der Suche).
- **Gesehen, nicht geöffnet:** die Liste der Dateinamen unter `versuche/` (beim Anlegen dieses Berichts). CLAUDE.md Regel 7 verlangt, `versuche/` vor einem Ansatz zu lesen; der Auftrag als Blind-Sucher verbietet es. Ich bin dem Auftrag gefolgt.
- **Automatisch eingeblendet:** das Projektgedächtnis mit Kurzfassungen der Spur A: Namen der Behauptungen B-007 bis B-014, Stichworte „Satz C/E/F“, „Unterfall A/B“, „Fall (5,8)“, „Lemma K/Z“, „Graphen vom Bigrad“, „Lemma P“, Zählung „13 > 10“, sowie Kurzfassungen früherer Blind-Berichte (nur Dateinamen und PR-Nummern). Ich habe diese Stichworte nicht benutzt und keinen der genannten Sätze nachvollzogen. Mein Ansatz (Gewichtsabflachung plus eine Substitution) hat keinen erkennbaren Bezug zu ihnen, einen unbewussten Einfluss kann ich nicht ausschließen.
- Nicht gelesen: `lean/prosa/`, `behauptungen/`, `LOG.md`, `STATUS.md`, Inhalte unter `versuche/`.
- Kein Fremdmodell benutzt.

## Anhang: Programme

Abhängigkeiten: Python 3, gcc. `drv.py` liest das 26er-Verfahren aus dem Repo, `red2.py A 24 <seed> <sekunden> <i>` startet die Suche aus 3.2, `flat.py` rechnet die Abflachungsränge.

### flip2.c

```c
// GF(2) flip graph random walk with plus transitions (own code, after Kauers-Moosbauer / Arai et al. idea)
// stdin: nA nB nC R target seed maxsteps plateau Rmax ; then R lines u v w
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
typedef uint32_t m_t;
static uint64_t rs;
static inline uint64_t rnd(){rs^=rs<<13;rs^=rs>>7;rs^=rs<<17;return rs;}
#define MAXR 80
int R; m_t F[3][MAXR];
static void del(int i){R--; for(int f=0;f<3;f++) F[f][i]=F[f][R];}
static int reduce(){
  for(int i=0;i<R;i++) if(!F[0][i]||!F[1][i]||!F[2][i]){del(i);return 1;}
  for(int i=0;i<R;i++) for(int j=i+1;j<R;j++)
    for(int f=0;f<3;f++){int g=(f+1)%3,h=(f+2)%3;
      if(F[g][i]==F[g][j]&&F[h][i]==F[h][j]){F[f][i]^=F[f][j]; del(j); return 1;}}
  return 0;
}
int main(){
  int nA,nB,nC,target,Rmax; unsigned long long seed; long long maxsteps, plateau;
  if(scanf("%d %d %d %d %d %llu %lld %lld %d",&nA,&nB,&nC,&R,&target,&seed,&maxsteps,&plateau,&Rmax)!=9) return 1;
  for(int i=0;i<R;i++) if(scanf("%u %u %u",&F[0][i],&F[1][i],&F[2][i])!=3) return 1;
  rs=seed*2654435761ULL+12345; for(int k=0;k<10;k++)rnd();
  while(reduce());
  long long since=0; int best=R;
  int cand[MAXR*3][2];
  for(long long steps=0; steps<maxsteps; steps++){
    if(since>plateau && R<Rmax){ // plus transition
      int i=rnd()%R,j=rnd()%R; if(i==j) continue;
      int f=rnd()%3,g=(f+1)%3,h=(f+2)%3;
      // x_i y_i z_i + x_j y_j z_j = (x_i+x_j) y_i z_i + x_j y_i z_i + x_j y_j z_j
      F[f][R]=F[f][j]; F[g][R]=F[g][i]; F[h][R]=F[h][i]; F[f][i]^=F[f][j]; R++;
      while(reduce());
      since=0; continue;
    }
    since++;
    int i=rnd()%R; int nc=0;
    for(int j=0;j<R;j++) if(j!=i) for(int f=0;f<3;f++) if(F[f][i]==F[f][j]){cand[nc][0]=j;cand[nc][1]=f;nc++;}
    if(!nc) continue;
    int c=rnd()%nc; int j=cand[c][0], f=cand[c][1];
    int g=(f+1)%3,h=(f+2)%3; if(rnd()&1){int t=g;g=h;h=t;}
    F[g][i]^=F[g][j]; F[h][j]^=F[h][i];
    int r0=R; while(reduce());
    if(R<r0) since=0;
    if(R<best){best=R; fprintf(stderr,"rank %d at %lld\n",R,steps);}
    if(R<=target){
      printf("OK %d steps %lld\n",R,steps);
      for(int k=0;k<R;k++) printf("%u %u %u\n",F[0][k],F[1][k],F[2][k]);
      return 0;}
  }
  printf("FAIL best %d\n",best); return 0;
}
```

### drv.py

```python
import json, subprocess, sys, itertools, random
def base444():
    T=set()
    for i in range(4):
        for k in range(2):
            for j in range(4):
                T.add((2*i+k, 4*k+j, 4*i+j))
    return T, 8, 8, 16
def check(T,dims,dec):
    out={}
    for u,v,w in dec:
        for a,x in enumerate(u):
            for b,y in enumerate(v):
                for c,z in enumerate(w):
                    if x and y and z: out[(a,b,c)]=out.get((a,b,c),0)^1
    return {k for k,v in out.items() if v}==T
J=json.load(open('/home/user/matmul-rank-n2m/verfahren/4x2x4-r26-s001.json'))
def scheme26():
    dec=[]
    for p in J['products']:
        u=[int(p['u'][i][k])%2 for i in range(4) for k in range(2)]   # a=2i+k
        v=[int(p['v'][k][j])%2 for k in range(2) for j in range(4)]   # b=4k+j
        w=[int(p['w'][i][j])%2 for i in range(4) for j in range(4)]   # c=4i+j
        dec.append((u,v,w))
    return dec
T,nA,nB,nC=base444()
D=scheme26(); assert check(T,(8,8,16),D)
def tens(dec):
    out={}
    for u,v,w in dec:
        for a,x in enumerate(u):
            if x:
                for b,y in enumerate(v):
                    if y:
                        for c,z in enumerate(w):
                            if z: out[(a,b,c)]=out.get((a,b,c),0)^1
    return {k for k,v in out.items() if v}
def mat_apply(M,x):  # M: list of rows (new coords) each a list over old coords; x vector
    return [sum(r[i]*x[i] for i in range(len(x)))%2 for r in M]
def restrictA(dec, E):  # E: list of basis vectors of subspace of A (old coords) -> u' = u∘E
    return [([sum(u[i]*e[i] for i in range(len(u)))%2 for e in E],v,w) for u,v,w in dec]
def quotC(dec, Phi):    # Phi: matrix new x old, w' = Phi w
    return [(u,v,mat_apply(Phi,w)) for u,v,w in dec]
def mask(x): return sum(b<<i for i,b in enumerate(x))
def unmask(m,n): return [(m>>i)&1 for i in range(n)]
def run(dec, target, seed=1, steps=2000000000, plateau=50000, timeout=600, rmax=None, prog='./flip2'):
    dec=[d for d in dec if any(d[0]) and any(d[1]) and any(d[2])]
    nA,nB,nC=len(dec[0][0]),len(dec[0][1]),len(dec[0][2])
    inp=f"{nA} {nB} {nC} {len(dec)} {target} {seed} {steps} {plateau} {rmax or len(dec)+1}\n"+"".join(f"{mask(u)} {mask(v)} {mask(w)}\n" for u,v,w in dec)
    try:
        o=subprocess.run([prog],input=inp,capture_output=True,text=True,timeout=timeout).stdout
    except subprocess.TimeoutExpired:
        return None,'TIMEOUT'
    L=o.split('\n')
    if not L[0].startswith('OK'): return None,L[0]
    r=int(L[0].split()[1])
    res=[tuple(unmask(int(x),n) for x,n in zip(l.split(),(nA,nB,nC))) for l in L[1:1+r]]
    assert tens(res)==tens(dec), "scheme check failed"
    return res,L[0]
```

### red2.py

```python
from drv import *
import sys, json
def rk42(u):  # rank over GF2 of 4x2 matrix u[2i+k]
    rows=[(u[2*i]|(u[2*i+1]<<1)) for i in range(4)]
    rows=[r for r in rows if r]
    if not rows: return 0
    return 1 if all(r==rows[0] for r in rows) else 2
def kerbasis(u,n=8):
    p=[i for i in range(n) if u[i]][0]
    B=[]
    for i in range(n):
        if i==p: continue
        e=[0]*n; e[i]=1
        if u[i]: e[p]=1
        B.append(e)
    return B
mode=sys.argv[1]; tgt=int(sys.argv[2]); seed=int(sys.argv[3]); to=int(sys.argv[4]); idx=int(sys.argv[5])
if mode=='A':
    ts=[t for t,(u,v,w) in enumerate(D) if rk42(u)==2]
    t=ts[idx%len(ts)]
    d=restrictA(D,kerbasis(D[t][0]))
else: # C: quotient by w_t of given matrix rank
    import numpy as np
    def rkC(w):
        M=[[w[4*i+j] for j in range(4)] for i in range(4)]
        # GF2 rank
        rows=[sum(M[i][j]<<j for j in range(4)) for i in range(4)]; r=0
        for bit in range(4):
            piv=[x for x in rows if x>>bit&1]
            if not piv: continue
            p=piv[0]; rows=[x^p if (x>>bit&1) and x is not p else x for x in rows]; rows.remove(p); r+=1
        return r
    want=int(mode[1])
    ts=[t for t,(u,v,w) in enumerate(D) if rkC(w)==want]
    print('terms with rk w =',want,':',len(ts))
    t=ts[idx%len(ts)]; w=D[t][2]; p=[c for c in range(16) if w[c]][0]
    Phi=[]
    for c in range(16):
        if c==p: continue
        row=[0]*16; row[c]=1
        if w[c]: row[p]=1
        Phi.append(row)
    d=quotC(D,Phi)
d0=[x for x in d if any(x[0]) and any(x[1]) and any(x[2])]
res,msg=run(d,tgt,seed=seed,timeout=to)
print(mode,idx,'term',t,'start',len(d0),'target',tgt,msg,flush=True)
if res: json.dump(res,open(f'res2_{mode}_{idx}_{len(res)}.json','w'))
```

### flat.py

```python
# exact flattening ranks (mod a large prime p, equals rational rank generically; integer data) for weight arguments
import itertools, random
P=1000003
def rank_mod(M):
    M=[r[:] for r in M]; r=0; n=len(M[0]) if M else 0
    for c in range(n):
        piv=None
        for i in range(r,len(M)):
            if M[i][c]%P: piv=i;break
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]; inv=pow(M[r][c],P-2,P)
        M[r]=[x*inv%P for x in M[r]]
        for i in range(len(M)):
            if i!=r and M[i][c]%P:
                f=M[i][c]; M[i]=[(a-f*b)%P for a,b in zip(M[i],M[r])]
        r+=1
    return r
# T as dict over (x=(i,k), y=(k,j), z=(i,j)) ; restriction on X via basis matrix E (list of 4x2 dict vectors), on Y via basis F
def Tsub(Ex,Fy):
    # returns tensor coefficients T'[s][t][(i,j)] for basis vectors Ex[s] (dict (i,k)->coef), Fy[t]
    T={}
    for s,ex in enumerate(Ex):
        for t,fy in enumerate(Fy):
            for (i,k),a in ex.items():
                for (k2,j),b in fy.items():
                    if k==k2: T[(s,t,i,j)]=T.get((s,t,i,j),0)+a*b
    return T
def flat_v(Ex,Fy):
    # v-weight: B* ⊇ ... we need v_t as 2x4 matrix: only valid if Y-space unrestricted
    T=Tsub(Ex,Fy); assert len(Fy)==8
    # rows (j_B, s), cols (k_B, i, j)
    rows=[(j,s) for j in range(4) for s in range(len(Ex))]; cols=[(k,i,j) for k in range(2) for i in range(4) for j in range(4)]
    ri={r:n for n,r in enumerate(rows)}; ci={c:n for n,c in enumerate(cols)}
    M=[[0]*len(cols) for _ in rows]
    for t,(k,j) in enumerate([(k,j) for k in range(2) for j in range(4)]):
        for (s,tt,i,jj),c in T.items():
            if tt==t: M[ri[(j,s)]][ci[(k,i,jj)]]+=c
    return rank_mod(M)
def flat_w(Ex,Fy):
    # w-weight cross grouping: rows (s, j_C), cols (t, i_C)
    T=Tsub(Ex,Fy)
    rows=[(s,j) for s in range(len(Ex)) for j in range(4)]; cols=[(t,i) for t in range(len(Fy)) for i in range(4)]
    ri={r:n for n,r in enumerate(rows)}; ci={c:n for n,c in enumerate(cols)}
    M=[[0]*len(cols) for _ in rows]
    for (s,t,i,j),c in T.items(): M[ri[(s,j)]][ci[(t,i)]]+=c
    return rank_mod(M)
fullX=[{(i,k):1} for i in range(4) for k in range(2)]
fullY=[{(k,j):1} for k in range(2) for j in range(4)]
print('T: flat_v',flat_v(fullX,fullY),'flat_w',flat_w(fullX,fullY))
# T' : x11 = x00  (basis: x00+x11 merged)
Xp=[{(0,0):1,(1,1):1}]+[{(i,k):1} for i in range(4) for k in range(2) if (i,k) not in [(0,0),(1,1)]]
print("T': flat_v",flat_v(Xp,fullY),'flat_w',flat_w(Xp,fullY))
Xr1=[{(i,k):1} for i in range(4) for k in range(2) if (i,k)!=(0,0)]
print("T|x00=0: flat_v",flat_v(Xr1,fullY),'flat_w',flat_w(Xr1,fullY))
```
