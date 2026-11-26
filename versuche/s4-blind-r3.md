# S4-17: Blind-Suche zu R(⟨3,2,7⟩), Runde 3

Rolle: Blind-Sucher. Gelesen im Repo: nur `CLAUDE.md`. Alle eigenen Aussagen sind als **vermutet** oder **behauptet** gekennzeichnet.

## 0. Offenlegung eingeblendeter Gedächtniseinträge

(wird ergänzt)

## 1. Problemstellung

(wird ergänzt)

## 2. Literaturstand (Netzrecherche 26.11.2026, Sitzungsbeginn)

Suchprotokoll (wörtlich):
1. Websuche „bilinear complexity multiplication 3x2 by 2xn matrices lower bound Hopcroft Kerr Alekseev“
2. Websuche „tensor rank <2,3,n> matrix multiplication exact rank 5n lower bound“
3. Websuche „Yang lower bound R(<3,2,m>) ≥ 24m/5 matrix multiplication arXiv“
4. Websuche (erweitert) „"3,2,7" OR "2,3,7" matrix multiplication rank 34 35 bilinear algorithm flip graph“
5. Gelesen (alphaXiv-Text): arXiv:2609.22054, arXiv:2609.14393, arXiv:2603.07280 (v11), arXiv:2603.02398.

Gefundene Aussagen aus der Literatur (Wiedergabe, nicht von mir geprüft):

| Quelle | Aussage | Wert für m = 7 |
|---|---|---|
| Hopcroft, Kerr 1971 (zitiert in 2609.14393) | R(⟨n,2,m⟩) ≤ ⌈(3nm + max(n,m))/2⌉ | ≤ 35 |
| J. Yang, arXiv:2609.14393 | R_K(⟨3,2,m⟩) ≥ ⌈24m/5⌉ über jedem Körper K | ≥ ⌈33,6⌉ = 34 |
| Tsyganov, Parkina, Samsonov, Rakhuba, arXiv:2609.22054 | R_K(⟨3,2,m⟩) > 24m/5 (strikt), mit Lean-4-Prüfung | ≥ 34 (keine Verbesserung, da 33,6 nicht ganz) |
| Ja'Ja', Takche (zitiert in 2603.07280) | R_{F₂}(⟨3,2,n⟩) ≥ ⌈105n/23⌉ | ≥ 32 |
| Perminov, arXiv:2603.02398, Abschnitt 5.2 | verwendet (2,3,7 : 35) als bestes bekanntes Verfahren | ≤ 35 |
| Bläser (zitiert in 2609.14393) | R(⟨2,n,m⟩) ≥ nm + n + m − 1 | ≥ 30 |

Folgerung aus der Literatur (**behauptet**, nur aus den Zitaten zusammengesetzt): 34 ≤ R(⟨3,2,7⟩) ≤ 35 über jedem Körper. Offen ist genau, ob 34 erreichbar ist. Einen Artikel, der 3×2×7 abschließend klärt, habe ich nicht gefunden.

Zum Verständnis des Abstands: Yangs Argument liefert mit h = dim ker W = R − 3m die Ungleichung 5h ≥ 9m. Für m = 7 heißt das h ≥ 12,6, also h ≥ 13, also R ≥ 34. Für R ≥ 35 bräuchte man h ≥ 14. Der Fall h = 13 ist kein Gleichheitsfall von 5h ≥ 9m (65 > 63). Die Gleichheitsfall-Technik aus 2609.22054 greift deshalb für m = 7 nicht unmittelbar (**behauptet**).

## 3. Obere Schranke: eigenes Verfahren mit 35 Produkten über ℤ

**Behauptet:** R_K(⟨3,2,7⟩) ≤ 35 für jeden Körper K (allgemeiner: für jeden kommutativen Ring mit Eins).

Herkunft: eigener Flip-Graph-Zufallslauf (Kauers-Moosbauer-Flips und Plus-Übergänge, Koeffizienten auf {−1,0,1} beschränkt, Rechnung über ℤ) für ⟨3,2,3⟩ mit 15 Produkten und ⟨3,2,4⟩ mit 20 Produkten, danach Zusammensetzen entlang der Spalten von B (Spalten 1–3 und 4–7). Das ist dieselbe Zerlegung 35 = 15 + 20, die auch die Hopcroft-Kerr-Schranke für m = 7 trägt. Es ist also kein neuer Wert, nur ein eigenständig erzeugter und geprüfter Zeuge.

Prüfung: Ein Python-Skript (Text unten) rechnet alle 6·14·21 = 1764 Brent-Gleichungen ganzzahlig nach. Ergebnis: `rank 35, wrong entries 0 of 1764, coefficients [-1, 0, 1]`. Da die Identität über ℤ gilt und nur Koeffizienten −1, 0, 1 vorkommen, gilt sie nach Bild in jedem Körper.

Schreibweise: A = (a_ij) ist 3×2, B = (b_jk) ist 2×7, C = AB = (c_ik). Zeile „P = (Form in A)·(Form in B) → Σ ± c_ik“ heißt: Produkt P geht mit dem angegebenen Vorzeichen in die genannten Einträge von C ein, also c_ik = Σ_P (Koeffizient von c_ik bei P)·P.

```
P01 = (- a12) * (- b22 + b23)  ->  c11 - c13 - c31 + c33
P02 = (a21 + a22) * (- b23)  ->  c21 - c23
P03 = (- a31 - a32) * (- b21 + b22 - b23)  ->  - c11 + c12 + c13 + c22 + c31 - c32 - c33
P04 = (a12 - a22) * (- b12 + b22)  ->  c12 + c13 - c32 - c33
P05 = (- a12 - a31 - a32) * (- b11 + b21 - b22 + b23)  ->  - c11 + c12 + c13 + c22 + c31 - c33
P06 = (- a12 + a22 - a32) * (b21 + b23)  ->  c12 + c13 + c21 + c22 - c32 - c33
P07 = (a12 + a21 + a32) * (- b11 - b23)  ->  - c12 - c13 - c21 - c22
P08 = (- a11 - a12 - a31 - a32) * (b11)  ->  - c11 + c12 + c13 + c22
P09 = (a11) * (b12 - b13)  ->  c12 + c22
P10 = (- a12 - a32) * (- b11 + b21)  ->  - c12 - c13 - c21 - c22 - c31 + c33
P11 = (- a31) * (- b11 + b12 - b13 + b21 - b22 + b23)  ->  - c12 - c13 - c22 + c33
P12 = (- a12 + a22 + a31) * (b12 + b21 - b22 + b23)  ->  - c12 - c13 - c22 + c32 + c33
P13 = (a11 - a21 + a31) * (- b11 - b13)  ->  - c12 - c13 - c22
P14 = (a21) * (b13 - b23)  ->  c12 + c13 + c22 + c23
P15 = (a11 + a12 - a21 - a22) * (b12)  ->  - c22
P16 = (a32) * (b14 - b15 - b16 - b24 + b25 + b26)  ->  c25 - c26 + c35
P17 = (a21 + a32) * (- b15 - b27)  ->  - c25 + c26 + c34 + c36 - c37
P18 = (- a12) * (- b14 + b15 + b24 - b25)  ->  c15 - c16
P19 = (a21 - a31) * (b15 + b17)  ->  c14 + c15 - c16 + c24 + c34 + c36 - c37
P20 = (a22 - a32) * (b25 + b27)  ->  c25 - c26
P21 = (- a11 - a12) * (- b15 - b16)  ->  c15 - c17 - c24
P22 = (- a31 - a32) * (- b14 + b15 + b16)  ->  c24 + c34
P23 = (- a11 - a12 + a21 - a31) * (- b14 + b15 + b24 + b27)  ->  - c14 - c15 + c16 - c24
P24 = (a21 + a22) * (- b27)  ->  c24 + c25 - c27
P25 = (a11 - a21 + a31) * (b14 + b17 - b24 - b27)  ->  c14 + c15 - c16 + c24 + c34 + c36
P26 = (a11 - a21 + a31 + a32) * (b14 - b15 - b16 - b24 - b27)  ->  - c24 - c34 - c36
P27 = (- a12 + a22) * (b25 + b26 + b27)  ->  c26
P28 = (- a11 - a12) * (b14 + b16)  ->  - c14 - c24
P29 = (- a11 + a21) * (- b15 - b16 - b17)  ->  - c14 - c15 + c16 + c17 - c24 - c34 - c36
P30 = (- a32) * (b14 - b16 - b24 + b26)  ->  c25 - c26 + c35 - c36
P31 = (a21) * (- b17 + b27)  ->  c14 + c15 - c16 - c17 + c24 - c27 + c34 + c36 - c37
P32 = (- a12) * (b15 + b16 - b25 - b26)  ->  c16 + c26
P33 = (- a31 - a32) * (- b15)  ->  c34 + c35 - c37
P34 = (- a11 - a12 + a21 + a22 - a31 - a32) * (- b24 - b27)  ->  - c24
P35 = (a12 + a21) * (b15 + b16 + b27)  ->  - c14 - c15 + c16 + c17 + c26
```

Prüfskript (Python 3, Eingabe: erste Zeile r, dann je Produkt drei durch „|“ getrennte Koeffizientenvektoren in den Reihenfolgen a_ij (i-major), b_jk (j-major), c_ik (i-major)):

```python
# Exact verification over Z of a scheme for <n,2,m>: sum_r a_r(A) b_r(B) c_r == matrix product tensor
import sys
from fractions import Fraction
fn,n,m=sys.argv[1],int(sys.argv[2]),int(sys.argv[3]); k=2
L=open(fn).read().split('\n'); r=int(L[0]); T=[]
for l in L[1:1+r]:
    T.append([list(map(int,p.split())) for p in l.split('|')[:3]])
bad=0
for a in range(n*k):
  for b in range(k*m):
    for c in range(n*m):
      i,j=divmod(a,k); j2,kk=divmod(b,m); i2,k2=divmod(c,m)
      t=int(i==i2 and j==j2 and kk==k2)
      s=sum(x[0][a]*x[1][b]*x[2][c] for x in T)
      if s!=t: bad+=1
coef=set(v for x in T for p in x for v in p)
print(f"rank {r}, wrong entries {bad} of {n*k*k*m*n*m}, coefficients {sorted(coef)}")
```

Rohdaten des Verfahrens in diesem Format:

```
35
0 -1 0 0 0 0 | 0 0 0 0 0 0 0 0 -1 1 0 0 0 0 | 1 0 -1 0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 0 0 0 | 
0 0 1 1 0 0 | 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 | 0 0 0 0 0 0 0 1 0 -1 0 0 0 0 0 0 0 0 0 0 0 | 
0 0 0 0 -1 -1 | 0 0 0 0 0 0 0 -1 1 -1 0 0 0 0 | -1 1 1 0 0 0 0 0 1 0 0 0 0 0 1 -1 -1 0 0 0 0 | 
0 1 0 -1 0 0 | 0 -1 0 0 0 0 0 0 1 0 0 0 0 0 | 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 | 
0 -1 0 0 -1 -1 | -1 0 0 0 0 0 0 1 -1 1 0 0 0 0 | -1 1 1 0 0 0 0 0 1 0 0 0 0 0 1 0 -1 0 0 0 0 | 
0 -1 0 1 0 -1 | 0 0 0 0 0 0 0 1 0 1 0 0 0 0 | 0 1 1 0 0 0 0 1 1 0 0 0 0 0 0 -1 -1 0 0 0 0 | 
0 1 1 0 0 1 | -1 0 0 0 0 0 0 0 0 -1 0 0 0 0 | 0 -1 -1 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 | 
-1 -1 0 0 -1 -1 | 1 0 0 0 0 0 0 0 0 0 0 0 0 0 | -1 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 | 
1 0 0 0 0 0 | 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 | 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 | 
0 -1 0 0 0 -1 | -1 0 0 0 0 0 0 1 0 0 0 0 0 0 | 0 -1 -1 0 0 0 0 -1 -1 0 0 0 0 0 -1 0 1 0 0 0 0 | 
0 0 0 0 -1 0 | -1 1 -1 0 0 0 0 1 -1 1 0 0 0 0 | 0 -1 -1 0 0 0 0 0 -1 0 0 0 0 0 0 0 1 0 0 0 0 | 
0 -1 0 1 1 0 | 0 1 0 0 0 0 0 1 -1 1 0 0 0 0 | 0 -1 -1 0 0 0 0 0 -1 0 0 0 0 0 0 1 1 0 0 0 0 | 
1 0 -1 0 1 0 | -1 0 -1 0 0 0 0 0 0 0 0 0 0 0 | 0 -1 -1 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 | 
0 0 1 0 0 0 | 0 0 1 0 0 0 0 0 0 -1 0 0 0 0 | 0 1 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 | 
1 1 -1 -1 0 0 | 0 1 0 0 0 0 0 0 0 0 0 0 0 0 | 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 | 
0 0 0 0 0 1 | 0 0 0 1 -1 -1 0 0 0 0 -1 1 1 0 | 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 1 0 0 | 
0 0 1 0 0 1 | 0 0 0 0 -1 0 0 0 0 0 0 0 0 -1 | 0 0 0 0 0 0 0 0 0 0 0 -1 1 0 0 0 0 1 0 1 -1 | 
0 -1 0 0 0 0 | 0 0 0 -1 1 0 0 0 0 0 1 -1 0 0 | 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 | 
0 0 1 0 -1 0 | 0 0 0 0 1 0 1 0 0 0 0 0 0 0 | 0 0 0 1 1 -1 0 0 0 0 1 0 0 0 0 0 0 1 0 1 -1 | 
0 0 0 1 0 -1 | 0 0 0 0 0 0 0 0 0 0 0 1 0 1 | 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 | 
-1 -1 0 0 0 0 | 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 | 0 0 0 0 1 0 -1 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 | 
0 0 0 0 -1 -1 | 0 0 0 -1 1 1 0 0 0 0 0 0 0 0 | 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 | 
-1 -1 1 0 -1 0 | 0 0 0 -1 1 0 0 0 0 0 1 0 0 1 | 0 0 0 -1 -1 1 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 | 
0 0 1 1 0 0 | 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 | 0 0 0 0 0 0 0 0 0 0 1 1 0 -1 0 0 0 0 0 0 0 | 
1 0 -1 0 1 0 | 0 0 0 1 0 0 1 0 0 0 -1 0 0 -1 | 0 0 0 1 1 -1 0 0 0 0 1 0 0 0 0 0 0 1 0 1 0 | 
1 0 -1 0 1 1 | 0 0 0 1 -1 -1 0 0 0 0 -1 0 0 -1 | 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 -1 0 -1 0 | 
0 -1 0 1 0 0 | 0 0 0 0 0 0 0 0 0 0 0 1 1 1 | 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 | 
-1 -1 0 0 0 0 | 0 0 0 1 0 1 0 0 0 0 0 0 0 0 | 0 0 0 -1 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 | 
-1 0 1 0 0 0 | 0 0 0 0 -1 -1 -1 0 0 0 0 0 0 0 | 0 0 0 -1 -1 1 1 0 0 0 -1 0 0 0 0 0 0 -1 0 -1 0 | 
0 0 0 0 0 -1 | 0 0 0 1 0 -1 0 0 0 0 -1 0 1 0 | 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 1 -1 0 | 
0 0 1 0 0 0 | 0 0 0 0 0 0 -1 0 0 0 0 0 0 1 | 0 0 0 1 1 -1 -1 0 0 0 1 0 0 -1 0 0 0 1 0 1 -1 | 
0 -1 0 0 0 0 | 0 0 0 0 1 1 0 0 0 0 0 -1 -1 0 | 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 | 
0 0 0 0 -1 -1 | 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 | 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 -1 | 
-1 -1 1 1 -1 -1 | 0 0 0 0 0 0 0 0 0 0 -1 0 0 -1 | 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 | 
0 1 1 0 0 0 | 0 0 0 0 1 1 0 0 0 0 0 0 0 1 | 0 0 0 -1 -1 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 | 
```
