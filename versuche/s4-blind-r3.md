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

## 4. Untere Schranke: was ein Verfahren mit 34 Produkten erfüllen müsste

Ziel war, die Lücke 34/35 von unten zu schließen. Das ist mir **nicht** gelungen. Was ich habe, ist eine Strukturaussage über ein hypothetisches Verfahren mit 34 Produkten und eine Beobachtung, warum reines Dimensionszählen nicht reicht.

### 4.1 Umformulierung (behauptet, elementar)

Ein Verfahren der Länge r für ⟨3,2,m⟩ ist dasselbe wie Linearformen α_ρ auf F^{3×2}, β_ρ auf F^{2×m} und eine lineare Abbildung W: F^r → F^{3×m} mit W(Ψ(A⊗B)) = AB, wobei Ψ(A⊗B) := (α_ρ(A)·β_ρ(B))_ρ ∈ F^r. Mit μ: F^{3×2}⊗F^{2×m} → F^{3×m} (Multiplikation) gilt dann ker Ψ ⊆ ker μ und Ψ(ker μ) ⊆ K := ker W. Da W surjektiv ist, ist dim K = r − 3m. Für m = 7 und r = 34 also dim K = 13.

Für einen Zeilenvektor p ∈ F^{1×2} sei U^p := {B ∈ F^{2×m} : pB = 0} (Dimension m) und 𝒟^p := {α(up) : u ∈ F^3} mit α(A) := (α_ρ(A))_ρ. Für u ∈ F^3 und x ∈ U^p ist (up)x = u(px) = 0, also liegt Ψ(F^3 p ⊗ U^p) = 𝒟^p · β(U^p) (komponentenweises Produkt) in K.

### 4.2 Satz (behauptet): Struktur eines Verfahrens mit 34 Produkten

Annahme: Es gibt ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F. Nach Übergang zum algebraischen Abschluss (die Länge bleibt) und der starken Normierung aus Yang, arXiv:2609.14393v3, Lemma 6, gilt mit den Bezeichnungen dort (U, f_i, g, J = f_0(U), F_i = f_i + J, L, H, N, S, Δ), n = 3, m = 7:

1. rk L = dim(K/J) = 6, also K = J + f_1(U) + f_2(U). Für generisches p heißt das K = 𝒟^p · β(U^p): die 21 Produkte spannen genau 13 Dimensionen auf, und diese 13 Dimensionen sind ganz K.
2. rk H = 4, dim N = 3, Δ = 2.
3. dim S = 1. Ist S = ⟨x⟩, dann ist f_0(N) = ⟨f_0(x), f_1(x), f_2(x)⟩.
4. Die Abbildung Φ aus Yangs Lemma 10 ist surjektiv auf (K/J)^3.
5. Dasselbe gilt mit vertauschten Spalten von A (und Zeilen von B). Insbesondere gilt K = 𝒟_0·J_p = 𝒟_1·J_q mit 𝒟_c := ⟨α(e_{i,c}) : i⟩, J_p := β(Zeile 0 = 0), J_q := β(Zeile 1 = 0). Dazu ist F^34 = K ⊕ 𝒟_1·J_p = K ⊕ 𝒟_0·J_q, und beide Summanden 𝒟_1·J_p und 𝒟_0·J_q haben die volle Dimension 21.

Beweis. Ich verwende Yangs Lemmata 6, 8, 10 und 12 als gegeben (nicht von mir geprüft, nur nachgelesen). Mit h' := dim K/J = r − 4m = 6:

- Lemma 10 und Rangsatz (Gleichung (1) bei Yang): 2m + rk H ≤ rk L + 2h', also 14 + rk H ≤ rk L + 12.
- rk L ≤ h' = 6. Daraus folgt rk H ≤ 4. Weil H auf U^{∧2} ≅ U definiert ist und Kern N hat, ist dim N = 7 − rk H ≥ 3.
- Yang zeigt Δ = 2 rk H − rk L ≥ min(2, dim N) = 2.
- Aus 2 rk H ≥ rk L + 2 und rk H ≤ rk L − 2 folgt rk L + 2 ≤ 2 rk L − 4, also rk L ≥ 6. Zusammen mit rk L ≤ 6 gilt rk L = 6. Dann folgt rk H ≤ 4 und 2 rk H ≥ 8, also rk H = 4, dim N = 3 und Δ = 2. Damit sind Punkt 1 (L surjektiv auf K/J) und Punkt 2 gezeigt.
- Lemma 12: dim S ≥ dim N − Δ = 1. Lemma 8 auf S ≠ 0 angewandt: dim S + 2 ≤ dim(f_0(S)+f_1(S)+f_2(S)) ≤ dim f_0(N) = 3, also dim S = 1. Ist S = ⟨x⟩, dann sind f_0(x), f_1(x), f_2(x) nach starker Normierung linear unabhängig und liegen in f_0(N), das Dimension 3 hat. Das ist Punkt 3.
- Punkt 4: Der Definitionsbereich von Φ hat Dimension 2m + m = 21, der Kern ist 0 ⊕ N mit Dimension 3. Das Bild hat also Dimension 18 = rk L + 2h' = dim (K/J)^3.
- Punkt 1, Umformulierung: Nach der Normierung ist e_{i,0} = u_i p für eine generische Zeile p und eine Basis u_0, u_1, u_2. Dann ist J + f_1(U) + f_2(U) = Σ_i α(u_i p)·β(U^p) = 𝒟^p·β(U^p). Die Normierungsbedingungen sind offen und dicht in p. Deshalb gilt die Aussage für generisches p.
- Punkt 5: Die Vertauschung der Spalten von A und der Zeilen von B ist eine Symmetrie des Tensors. Sie ändert W nicht, also auch K nicht. Die Normierungsbedingungen für beide Spalten sind gleichzeitig generisch erfüllbar (dieselbe generische Wahl von u_0 und zwei generische Zeilen p, p'). Für die Zerlegung F^34 = K ⊕ 𝒟_1·J_p: W bildet α(e_{i1})·β(x) für x ∈ U^{(1,0)} (Zeile 0 von x ist null, Zeile 1 ist v) auf e_{i1}x = e_i v ab. Das sind 21 Bilder, die F^{3×7} aufspannen. Also hat 𝒟_1·J_p Dimension 21 und schneidet K nur in 0, und 21 + 13 = 34. Für 𝒟_0·J_q gilt das genauso. ∎

Lücken: Die Lemmata 6, 8, 10 und 12 von Yang habe ich nur nachgelesen, nicht unabhängig geprüft. Lemma 6 setzt einen unendlichen Körper voraus. Der Übergang zum algebraischen Abschluss ist zulässig, weil ein Verfahren über F auch eines über dem Abschluss ist.

### 4.3 Beobachtung (behauptet): Punkt 1 allein ist kein Widerspruch

1. Mein eigenes Verfahren mit 35 Produkten (Abschnitt 3) erfüllt die Entsprechung von Punkt 1 mit Gleichheit: dim K = 14, und für drei zufällige p ist dim 𝒟^p·β(U^p) = 14 = dim K. Dasselbe gilt für dim Ψ(ker μ) = 14 und dim Bild Ψ = 35. Das habe ich numerisch per Matrixrang mit ganzzahligen Eingangsdaten und Toleranz 1e-8 gerechnet. Auch das Verfahren mit 35 Produkten ist also in diesem Sinn „straff“. Die Straffheit allein unterscheidet 34 nicht von 35.
2. Reines Zählen von dim(𝒟·J) für einen 3-dimensionalen Raum 𝒟 von Diagonalmatrizen und einen 7-dimensionalen Raum J reicht nicht für 13 oder mehr. Polynom-Modell: Die Koordinaten sind Auswertungen in r Punkten allgemeiner Lage der Ebene, 𝒟 = ⟨1, x, y⟩ und J = ⟨1, x, y, x², xy, y², x³⟩. Dann ist 𝒟·J ⊆ Polynome vom Grad ≤ 3 plus ⟨x⁴, x³y⟩, also hat 𝒟·J Dimension 12. Die starke Normierung (d·w ≠ 0 für d ≠ 0, w ≠ 0) ist bei genügend vielen Punkten in allgemeiner Lage erfüllt. Ein Beweis von R ≥ 35 muss also die Kopplung der beiden Spalten von A ausnutzen, so wie Yang es mit g tut (Punkt 5 und die Bedingung α(e_{i0})·β(q) − α(e_{i1})·β(p) ∈ K). Eine Schranke allein aus dim 𝒟^p J^p reicht nicht.

### 4.4 Gescheiterte Ansätze (mit Grund)

- **Gleichheitsfall-Technik aus 2609.22054 auf m = 7 übertragen:** Sie greift nicht unmittelbar. Bei m = 7 und r = 34 ist 5h ≥ 9m mit h = 13 nicht scharf (65 > 63). Die verschärfte Ungleichung 4m + Δ ≤ 5h' aus Yang v3 wird bei h' = 6 zu 30 ≥ 30, ist also scharf. Daraus kommt die Struktur in 4.2, aber kein Widerspruch.
- **Substitution einer Spalte von B:** Sie liefert nur R(⟨3,2,m⟩) ≥ R(⟨3,2,m−1⟩) + 2, also mit R(⟨3,2,6⟩) = 30 (Yang v3) nur 32. Für 35 bräuchte man +5 je Spalte, und das ist im Wesentlichen schon die volle Vermutung.
- **Theorem 2 von Yang über die Permutation ⟨7,2,3⟩:** Es ist nicht anwendbar, weil es m ≥ n verlangt. Die Gleichung (2) ohne Lemma 14 liefert nur r ≥ 29.

## 5. Rechenblöcke

### Block 1 (Vorversuche, 09:55–09:57 UTC laut Systemuhr, insgesamt unter 30 min, 1–2 Kerne)

Eigenes C-Programm `fg.c` (Flip-Graph-Zufallslauf, Quelltext im Anhang A). Es lief zuerst als Test auf ⟨2,2,2⟩ (erreicht 7), ⟨3,2,2⟩ (11), ⟨3,2,3⟩ (15) und ⟨3,2,4⟩ (20) über GF(2). Danach lief es über ℤ mit Koeffizienten in {−1,0,1} für ⟨3,2,3⟩ (15) und ⟨3,2,4⟩ (20). Daraus entstand das Verfahren in Abschnitt 3.

### Block 2 (09:57:43–10:22:43 UTC, 25 min, 4 Kerne): Suche nach 34

Vier Läufe zu je 1500 s, Ziel Rang 34:

| Lauf | Ring | Start | Plateau-Länge L | Schritte | Ergebnis |
|---|---|---|---|---|---|
| g11 | GF(2) | Verfahren mit 35 (mod 2) | 200 000 | 29 832 104 | 35 |
| g12 | GF(2) | Verfahren mit 35 (mod 2) | 1 000 000 | 29 727 244 | 35 |
| g13 | GF(2) | Standardverfahren mit 42 | 300 000 | 18 732 254 | 42 (keine Verkleinerung) |
| g14 | ℤ, Koeffizienten in {−1,0,1} | Verfahren mit 35 | 300 000 | 29 529 605 | 35 |

Ergebnis: Kein Verfahren mit 34 Produkten gefunden. Das ist **kein** Beweis, dass es keines gibt. Lauf g13 zeigt, dass mein Zufallslauf vom Standardverfahren aus zu schwach ist: Er kehrt nach jedem Plateau zum besten Stand zurück und kommt aus 42 nicht heraus. Für 3×2×7 taugt er nur als lokale Suche um das Verfahren mit 35. Gegenüber den Läufen in der Literatur (Perminov: Wochen auf 20 Kernen, Milliarden Schritte) ist der Aufwand klein.
