# Bericht S5-06: Prüfung der Glieder K-21 bis K-31

Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit `d6469d8`, Glieder K-21 bis K-31 (Zeilen 379 bis 549).
Rolle: Prüfer. Dieser Bericht setzt keinen Status. Er enthält je Glied ein Urteil in den Formen „bestätigt“, „nicht bestätigt“ oder „offen“.

Zeilenangaben beziehen sich auf die Datei im Stand `d6469d8` (gelesen mit `git show d6469d8:lean/prosa/s5_327_kette.md | sed -n …`).

---

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet.**

1. Der Index `MEMORY.md` des Projektgedächtnisses. Er enthält Angaben zum Ziel des Projekts (exakter Tensorrang von ⟨n,2,m⟩, genannt werden 4×2×4, 3×2×7, 4×2×5 und Lean für 3×2×6), zu Rollen und Rechten des Orchestrators, zu Stufe 4 und ihrem Budget, zum Fremdmodell und zur Bridge, zu Arbeitsregeln für Prüfer und Sucher, zur Literaturwache und Verweise auf die Einträge „verfahren-datenformat“ und „lean-project-ci“. Er enthält keine Aussage über Prüfurteile, Status oder den Inhalt der Glieder K-21 bis K-31.
2. Zwei Einzeleinträge: „aussagen-abgleich-n3“ (Hinweise zur Bridge und zum lokalen Lean-Bau, Import `YangBounds.Statements`) und „gemini-bridge“ (Bridge-Freigabe fehlt, Zeitlimit 60 s, Hinweise zur Unabhängigkeit). Keine Urteile zu dieser Kette.
3. Im Sitzungskontext standen die Namen dreier Projektdateien (`A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md`), nur die Namen.

**Über die Positivliste hinaus gesehen.**

1. `ls` im Wurzelverzeichnis des Repos: nur die Namen der Dateien und Verzeichnisse (darunter `STATUS.md`, `LOG.md`, `archiv`, `behauptungen`, `pruefvermerke`, `versuche`, `erkundung`, `pruefer`, `entwurf`, `ergebnisse`, `lit`, `verfahren`). Kein Inhalt.
2. `git status` und `git rev-parse HEAD`: „HEAD detached from refs/heads/main“, Hash `8ce8481`. Außerdem die Zahl der Einträge in `lean/prosa/` (53), keine Namen.
3. Die Überschriften der Abschnitte von `PROTOKOLL.md` (eine Zeile je Abschnitt, um Abschnitt 5 zu finden). Kein Text außerhalb von Abschnitt 5.
4. Beim Suchen der Wortlaut-Zeilen in den Zeilen 109 bis 378 hat mein `grep` neben den Überschriften und Wortlaut-Anfängen auch die **ersten Zeilen der Beweise** der Glieder K-1, K-2, K-3, K-4, K-5, K-6, K-7, K-10, K-11, K-12, K-13, K-14, K-15, K-16, K-17, K-18, K-19, K-20 angezeigt, teils abgeschnitten. Vollständig sichtbar waren die einzeiligen Beweise von K-8, K-9, K-10 und K-14. Ich habe diese Beweise nicht geprüft und nicht benutzt. Gelesen habe ich bewusst nur die Wortlaute von K-3, K-7, K-12, K-13, K-14, K-19 (die Glieder, die mein Block voraussetzt).
5. Ein `grep` nach der Tabellenzeile von K-27 lief versehentlich über die ganze Datei und zeigte aus dem gesperrten Teil ab Zeile 807 einen Zeilenanfang (Zeile 955): „| K-27 bis K-29 | `lean/pr“, abgeschnitten nach 30 Zeichen. Mehr habe ich aus diesem Teil nicht gesehen.
6. Kein Urteil, kein Prüfvermerk und kein Statuseintrag zu irgendeinem Glied war für mich sichtbar. Ich weiß nicht, was von meinem Urteil abhängt, außer dem, was die Datei selbst über den Aufbau der Kette sagt (Zeilen 12 bis 108 und 753 bis 806).

---

## 1. Vorgehen

- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` Abschnitt 5, Zeilen 12 bis 108, 379 bis 549 und 753 bis 806 der Kettendatei, dazu die Wortlaute von K-3 (Z. 136), K-7 (Z. 186 bis 195), K-12 (Z. 241), K-13 (Z. 255 bis 258), K-14 (Z. 264 bis 270), K-19 (Z. 337 bis 341).
- Jedes Glied Schritt für Schritt nachvollzogen, mit Abgleich der Voraussetzungsliste gegen das, was der Beweis tatsächlich benutzt.
- Nachgerechnet mit einem eigenen Programm (Python 3, sympy 1.14, nur exakte Arithmetik), siehe Anhang A: alle Rechenidentitäten aus K-22, K-24, K-25 (c), K-26, K-27 (a); die Dimensionen dim P_d und die Gleichungen P_{d+1} = P_d + a_1·P_d + a_2·P_d für d ≤ 3; dim g_0·P_1 = 3 und dim g_0·P_2 = 6; der Homogenisierungs- und Dehomogenisierungsschritt aus K-29 und K-31 (20 Zufallsfälle und ein Koszul-Fall); ein Modellfall zu K-30 (b): Liegen alle Trägerpunkte auf einem zerfallenden Kegelschnitt ℓ_1ℓ_2 = 0, dann sind j, a_1·j, a_2·j für j = w·(ℓ_1ℓ_3) linear abhängig. Alle Prüfungen bestanden.
- Eine Rechnung mit einem echten Verfahren der Länge 34 war nicht möglich und ist für diese Glieder nicht nötig: Ihre Aussagen sind Folgerungen aus den vorausgesetzten Wortlauten.

---

## 2. Urteile je Glied

### Abschnittsrahmen (Z. 381)

Der Rahmen (F, K = algebraischer Abschluss, V der Länge 34 für ⟨3,2,7⟩ über K, (S, T) ∈ 𝒢*, V̂ Normalform) und die daraus übernommenen Tatsachen (SN1), (SN2), a_0 = 1, f_0 = ℬ, f_i = a_i·f_0 (K-12) sowie dim Q = 6, rk L = 6, dim N = 3, dim Ŝ = 1 (K-19) stimmen mit den Wortlauten von K-12 und K-19 überein. Die algebraische Abgeschlossenheit von K wird in K-21 bis K-31 nirgends benutzt.

### K-21 (Z. 383 bis 396): **bestätigt**

- (a) f_0(x)_t = β̂_t(x) = Σ_k y_k·q_k(t) für x ∈ U ist richtig (f_0 = ℬ nach K-12). dim J = m = 7 nach K-14 (i), also sind die sieben Erzeuger unabhängig.
- (b) dim K′ = r − 3m = 13 nach (T3). Surjektivität von L folgt aus rk L = dim Q = 6. Daraus K′ = J + f_1(U) + f_2(U); dabei wird f_i(U) ⊆ K′ und J ⊆ K′ aus K-14 (i) benutzt, das gelistet ist. Mit f_i = a_i·f_0 folgt K′ = J + a_1·J + a_2·J.
- (c), (d) Richtig, weil f_0 : U → J bijektiv ist (Surjektivität nach Definition von J, Injektivität nach (T4)); die Mengengleichheiten folgen in beiden Richtungen. Dimensionen aus K-19.
- Voraussetzungsliste vollständig.

### K-22 (Z. 398 bis 419): **bestätigt**

- Die vier Typen von Brent-Gleichungen sind richtig ausgewertet (e_{i0}e_{1k} = 0, e_{i1}e_{0k} = 0, e_{i0}e_{0k} = e_{i1}e_{1k} = e_{ik}).
- (D): Unabhängigkeit modulo K′ folgt, weil W die 21 Vektoren b_i·q_k auf die Basis e_{ik} abbildet; zusammen mit dim K′ = 13 folgt die direkte Summe.
- π ist wohldefiniert, weil q_1, …, q_7 eine Basis von J sind (K-21 (a)). κ(j) ∈ K′ ist (C) mit i = 0 und a_0 = 1. Die Umformung zu (C′) habe ich nachgerechnet (Anhang A).
- Voraussetzungsliste vollständig (a_0 = 1 über K-12).

### K-23 (Z. 421 bis 436): **bestätigt**

- (a) bis (e) folgen wie angegeben. In (c) wird benutzt, dass die Wirkung von 𝒜 multiplikativ ist ((fg)·w = f·(g·w)) und P_{d+1} = P_d + a_1·P_d + a_2·P_d (nachgerechnet). In (e) ist K-13 mit X = N anwendbar, weil V̂ (SN1) und (SN2) erfüllt (K-12) und N ≠ 0.
- e hängt nicht von der Wahl von v ab, weil w bis auf einen Faktor ≠ 0 bestimmt ist. Das steht nicht ausdrücklich da, folgt aber aus (a).
- Kleine Ungenauigkeit, siehe U1.

### K-24 (Z. 438 bis 444): **bestätigt**

- Aus (D) folgt K^34 = K′ + Σ_i b_i·J, denn span{b_i·q_k : k} = b_i·J. b_0·J ⊆ b_0·K′ wegen J ⊆ K′ (K-21 (b)). Die Zerlegung b_i·j = c_i·j + b_0·(a_i·j) und die Einordnung von c_i·j über (C′) sind richtig (nachgerechnet). dim K″ ≥ 34 − 13.
- Voraussetzungsliste vollständig.

### K-25 (Z. 446 bis 459): **bestätigt**

- (a) Das Bild der Abbildung J³ → K^34 ist genau J + a_1·J + a_2·J = K′, also Kern der Dimension 21 − 13 = 8.
- (b) Folgt aus (D) und der Basis q_k.
- (c) Nachgerechnet.
- (d) Liegt Θ(j) in K′, dann ist j = 0 nach (b); das gibt Injektivität und Θ(J³_0) ∩ K′ = 0.
- Voraussetzungsliste vollständig.

### K-26 (Z. 461 bis 469): **bestätigt**

- Die Identität a_k·(a_i·π(j) − b_i·j) − a_i·(a_k·π(j) − b_k·j) = ω_{ik}·j habe ich für alle neun Paare (i, k) nachgerechnet. Die linke Seite liegt in a_k·K′ + a_i·K′ ⊆ K″.
- Kleine Ungenauigkeit, siehe U2.

### K-27 (Z. 471 bis 494): **bestätigt**

- (a) Nachgerechnet, einschließlich des Vorzeichens (b_i a_k − b_k a_i = −ω_{ik}).
- (b) ψ_{ik}·w ∈ w·P_1 ⊆ w·P_2 ⊆ J (K-23 (c)), dann K-26; mit K-25 (d) und dim K″ = 21 folgt die direkte Zerlegung.
- (c) a_l·ψ_{ik}·w ∈ w·P_2 ⊆ J, dann K-26; mit (b) folgt a_l·K″ ⊆ K″.
- (d) Σ_k ψ_{ik}·a_k ∈ P_2.
- (KS) ist invariant unter Skalierung von w (ψ mitskalieren), die Aussage hängt also nicht von der Wahl von v in K-23 ab.
- Kleine Ungenauigkeit, siehe U3.

### K-28 (Z. 496 bis 510): **bestätigt**

- u existiert (dim J = 7, dim w·P_2 = 6, w·P_2 ⊆ J).
- (a) K′ = w·P_3 + u·P_1 mit dim ≤ 10 + 3 = 13 = dim K′; daraus Injektivität beider Auswertungen und Direktheit.
- (b) K″ = w·P_4 + u·P_2, dim ≤ 21, und ≥ 21 nach K-24; Gleichheit überall.
- (c) Surjektiv nach (b) und dim(P_4 ⊕ P_2) = 21.
- (d) Aus K-24, dim K″ = 21 und dim b_0·K′ ≤ 13.
- Die Aussagen gelten für jede Wahl von u. Voraussetzungsliste vollständig (e = 3 kommt aus der Definition in K-23, das über K-23 (c) gelistet ist).

### K-29 (Z. 512 bis 521): **bestätigt**

- Die Zerlegung j_i = w·φ_i + s_i·u ist nach K-28 möglich. Die Gleichung Σ a_i·j_i = 0 und die Injektivität von ε auf P_3 ⊕ P_1 (K-28 (c)) geben φ_0 + a_1φ_1 + a_2φ_2 = 0 als formales Polynom und s_i = 0.
- Homogenisierung: X_0Φ_0 + X_1Φ_1 + X_2Φ_2 ist die Homogenisierung vom Grad 3 von φ_0 + a_1φ_1 + a_2φ_2, also 0 (nachgerechnet). K-3 ist anwendbar (Φ_i ∈ 𝒮_2). Dehomogenisierung bei X_0 = 1 ist ein Ringhomomorphismus, erhält Ψ_{ii} = 0 und Ψ_{ki} = −Ψ_{ik} und gibt φ_i = Σ_k ψ_{ik}·a_k (nachgerechnet).
- Die Voraussetzungen von K-27 (dim K″ = 21 und (KS)) sind damit erfüllt.
- Voraussetzungsliste vollständig.

### K-30 (Z. 523 bis 536): **bestätigt**

- (a) Kern der Dimension 1; Grad genau 2, weil P_1 → w·P_1 injektiv ist (K-23 (b)); g_0(ξ(t)) = 0 auf Σ.
- (b) Der Widerspruchsbeweis ist vollständig: ℓ_1, ℓ_2 sind keine Vielfachen von X_0 (sonst Grad g_0 ≤ 1; das schließt auch ℓ_i = 0 ein). h = (ℓ_1ℓ_3)(1, a_1, a_2) liegt nicht in K·g_0, weil Homogenisierung P_2 → 𝒮_2 bijektiv und 𝒮 nullteilerfrei ist. Also j = w·h ≠ 0, j ∈ J. Auf dem Träger von j verschwindet λ_2, also λ_2·j = 0 mit (μ_1, μ_2) ≠ (0, 0); mit j = f_0(x), a_i·j = f_i(x) (K-12) widerspricht das (SN2). Den Mechanismus habe ich an einem Modellfall nachgerechnet (Anhang A, Teil 3). Der Fall ℓ_1 proportional zu ℓ_2 ist mit erfasst.
- (c) dim g_0·P_1 = 3, dim w·P_3 ≤ 7, dim u·P_1 ≤ 6, dim K′ = 13; Gleichheit überall gibt alle Teilaussagen, auch Kern = g_0·P_1.
- (d) dim g_0·P_2 = 6, also dim w·P_4 ≤ 9, dim u·P_2 ≤ 12, mit K-24 Gleichheit; K^34 = K″ ⊕ b_0·K′ wie in K-28 (d).
- Voraussetzungsliste vollständig. Kleine Ungenauigkeit in der Bezeichnung, siehe U4.

### K-31 (Z. 538 bis 547): **bestätigt**

- Die Direktheit von K′ = w·P_3 ⊕ u·P_1 und die Injektivität auf P_1² (K-30 (c)) geben s_{il} = 0 und w·(φ_0 + a_1φ_1 + a_2φ_2) = 0. Mit Kern = g_0·P_1 (K-30 (c)) ist φ_0 + a_1φ_1 + a_2φ_2 = g_0·(λ_0 + λ_1a_1 + λ_2a_2). Die Korrektur φ′_i = φ_i − λ_i·g_0 ändert w·φ_i nicht und macht die Summe als Polynom null. Danach wie K-29.
- dim K″ = 21 nach K-30 (d). Die Voraussetzungen von K-27 sind erfüllt.
- Voraussetzungsliste vollständig.

---

## 3. Kleine Ungenauigkeiten (keine Lücken)

- **U1 (K-23, Z. 430 und 432).** Der Beweis von (a) sagt „w ≠ 0, weil f_0 injektiv ist“. Das ist K-7 (T4), das in der Zeile „Voraussetzungen“ nicht steht. Ersatz aus der Liste: Nach K-21 (d) ist dim f_0(Ŝ) = 1 = dim Ŝ, also ist f_0 auf Ŝ injektiv. Vorschlag: „K-7 (T4)“ ergänzen oder auf K-21 (d) verweisen.
- **U2 (K-26, Z. 465 und 469).** Der Beweis benutzt a_0 = 1 („a_0·K′ = K′“). Die Liste nennt nur K-22 (C). Gedeckt durch den Abschnittsrahmen (Z. 381) und K-12. Vorschlag: „K-12 (a_0 = 1)“ ergänzen.
- **U3 (K-27, Z. 483 und 486).** Der Beweis von (b) benutzt dim K′ = 13 („13 + 8 = 21“). Diese Zahl steht in keinem gelisteten Wortlaut (K-23 (b), (c), K-25 (d), K-26), sondern in K-21 (b) bzw. K-7 (T3). Die Abhängigkeitstabelle (Z. 785) bleibt kreisfrei, weil K-21 kleiner ist. Vorschlag: „K-21 (b)“ in Z. 483 und in der Tabelle ergänzen.
- **U4 (K-30 (c), Z. 528).** Die Schreibweise u·P_d = {u_1·G_1 + u_2·G_2} überlädt die Schreibweise v·P_d aus 1.4 (Z. 97) für einen einzelnen Vektor. Sie ist an Ort und Stelle definiert und im Zusammenhang eindeutig; ein eigener Name (etwa U·P_d) wäre klarer.

Keine echte Lücke gefunden. Kein Begriff wird benutzt, der in der Datei nicht definiert ist. Die Quantoren (welches Verfahren, welche Normalform, welcher Körper) sind durch den Abschnittsrahmen in Z. 381 und Z. 494 festgelegt; Wahlfreiheiten (v in K-23, u in K-28, u_1, u_2 in K-30) beeinflussen die Aussagen nicht.

---

## 4. Übersicht

| Glied | Urteil | Hinweis |
|---|---|---|
| K-21 | bestätigt | – |
| K-22 | bestätigt | – |
| K-23 | bestätigt | U1 |
| K-24 | bestätigt | – |
| K-25 | bestätigt | – |
| K-26 | bestätigt | U2 |
| K-27 | bestätigt | U3 |
| K-28 | bestätigt | – |
| K-29 | bestätigt | – |
| K-30 | bestätigt | U4 |
| K-31 | bestätigt | – |

---

## Anhang A: Prüfprogramm (Python 3, sympy, exakte Arithmetik)

Lauf mit `python3 -I check_k21_k31.py`, Ausgabe endet mit `ALL OK` (alle Einzelprüfungen „OK“).

```python
"""Exact checks of the algebraic identities and dimension counts used in K-21 .. K-31.
All products of vectors in K^34 are componentwise, hence commutative; scalar symbols suffice
for the identities. Exact arithmetic only (sympy Rationals / integers)."""
import itertools, random
import sympy as sp

random.seed(20261126)
ok = True
def check(name, cond):
    global ok
    print(("OK   " if cond else "FAIL ") + name)
    ok &= bool(cond)

# ---- 1. identities (componentwise, one coordinate t) ----
a1, a2, b0, b1, b2, j, pij = sp.symbols('a1 a2 b0 b1 b2 j pij')
a = [sp.Integer(1), a1, a2]; b = [b0, b1, b2]
c = {i: b[i] - a[i]*b0 for i in (1, 2)}
kappa = pij - b0*j
for i in (1, 2):
    # K-22 (C'): a_i*pi(j) - b_i*j == a_i*kappa(j) - c_i*j
    check(f"K-22 (C') i={i}", sp.expand(a[i]*pij - b[i]*j - (a[i]*kappa - c[i]*j)) == 0)
    # K-24: b_i*j == c_i*j + b0*(a_i*j)
    check(f"K-24 split i={i}", sp.expand(b[i]*j - (c[i]*j + b0*a[i]*j)) == 0)
# K-25 (c)
j0, j1, j2 = sp.symbols('j0 j1 j2')
theta = b0*j0 + b1*j1 + b2*j2
check("K-25 (c)", sp.expand(theta - (b0*(j0 + a1*j1 + a2*j2) + c[1]*j1 + c[2]*j2)) == 0)
# K-26
om = lambda i, k: a[i]*b[k] - a[k]*b[i]
for i, k in itertools.product(range(3), repeat=2):
    lhs = a[k]*(a[i]*pij - b[i]*j) - a[i]*(a[k]*pij - b[k]*j)
    check(f"K-26 i={i} k={k}", sp.expand(lhs - om(i, k)*j) == 0)
# K-27 (a): with psi antisymmetric, j_i = w*sum_k psi_ik a_k
w = sp.Symbol('w')
p01, p02, p12 = sp.symbols('p01 p02 p12')
psi = [[0, p01, p02], [-p01, 0, p12], [-p02, -p12, 0]]
ji = [w*sum(psi[i][k]*a[k] for k in range(3)) for i in range(3)]
check("K-27 (KS) gives j in J^3_0 shape", sp.expand(sum(a[i]*ji[i] for i in range(3))) == 0)
th = sum(b[i]*ji[i] for i in range(3))
rhs = -sum(psi[i][k]*om(i, k)*w for i in range(3) for k in range(3) if i < k)
check("K-27 (a)", sp.expand(th - rhs) == 0)

# ---- 2. polynomial spaces ----
x1, x2, X0, X1, X2 = sp.symbols('x1 x2 X0 X1 X2')
def mons(d): return [x1**i*x2**k for i in range(d+1) for k in range(d+1-i)]
def coeffvec(f, d):
    P = sp.Poly(sp.expand(f), x1, x2)
    return [P.coeff_monomial(m) for m in mons(d)]
def rank(polys, d):
    return sp.Matrix([coeffvec(f, d) for f in polys]).rank() if polys else 0
for d in range(5):
    check(f"dim P_{d} = {(d+1)*(d+2)//2}", len(mons(d)) == (d+1)*(d+2)//2)
for d in range(4):
    gens = [m*f for m in mons(d) for f in (1, x1, x2)]
    check(f"P_{d+1} = P_{d} + a1 P_{d} + a2 P_{d}", rank(gens, d+1) == len(mons(d+1)))
g0 = x1**2 - 3*x1*x2 + x2 + 5  # some degree-2 polynomial
check("dim g0*P_1 = 3", rank([g0*m for m in mons(1)], 3) == 3)
check("dim g0*P_2 = 6", rank([g0*m for m in mons(2)], 4) == 6)

# homogenisation / dehomogenisation step of K-29, K-31
def hom(f, d): return sp.expand(X0**d*f.subs({x1: X1/X0, x2: X2/X0}, simultaneous=True))
for trial in range(20):
    phi = [sum(sp.Integer(random.randint(-5, 5))*m for m in mons(2)) for _ in range(3)]
    Phi = [hom(p, 2) for p in phi]
    lhs = sp.expand(X0*Phi[0] + X1*Phi[1] + X2*Phi[2])
    check(f"hom step trial {trial}", sp.expand(lhs - hom(phi[0] + x1*phi[1] + x2*phi[2], 3)) == 0)
# dehomogenisation of Phi_i = sum_k Psi_ik X_k gives phi_i = sum_k psi_ik a_k
L = lambda: sum(sp.Integer(random.randint(-4, 4))*v for v in (X0, X1, X2))
P01, P02, P12 = L(), L(), L()
Psi = [[sp.Integer(0), P01, P02], [-P01, sp.Integer(0), P12], [-P02, -P12, sp.Integer(0)]]
Phi = [sp.expand(sum(Psi[i][k]*[X0, X1, X2][k] for k in range(3))) for i in range(3)]
check("Koszul shape gives sum X_i Phi_i = 0", sp.expand(sum([X0, X1, X2][i]*Phi[i] for i in range(3))) == 0)
deh = lambda F: sp.expand(F.subs({X0: 1, X1: x1, X2: x2}, simultaneous=True))
for i in range(3):
    check(f"dehom i={i}", sp.expand(deh(Phi[i]) - sum(deh(Psi[i][k])*[1, x1, x2][k] for k in range(3))) == 0)
    check(f"hom(dehom(Phi_{i})) = Phi_{i}", sp.expand(hom(deh(Phi[i]), 2) - Phi[i]) == 0)

# ---- 3. numerical model of the frame of K-30 (b) ----
# points on a reducible conic l1*l2 = 0, w supported there: then lambda_2 * (w*h) = 0 with h = l1*l3,
# i.e. a linear dependency among j, a1 j, a2 j with (mu1, mu2) != 0 -- the configuration (SN2) forbids.
l1 = lambda p: 1 + 2*p[0] - p[1]
l2 = lambda p: -3 + p[0] + 4*p[1]
l3 = lambda p: 2 - p[0] + 0*p[1]
pts = []
for s in range(1, 9):
    pts.append((sp.Integer(s), 1 + 2*sp.Integer(s)))          # l1 = 0
    pts.append((sp.Integer(3) - 4*sp.Rational(s, 3), sp.Rational(s, 3)))  # l2 = 0
for p in pts: assert l1(p)*l2(p) == 0
wv = [sp.Integer(random.randint(1, 9)) for _ in pts]
jv = [wv[t]*l1(pts[t])*l3(pts[t]) for t in range(len(pts))]
lam2 = [l2(p)*jv[t] for t, p in enumerate(pts)]
check("K-30 (b) model: lambda_2 * j = 0", all(v == 0 for v in lam2))
check("K-30 (b) model: j != 0", any(v != 0 for v in jv))
M = sp.Matrix([jv, [pts[t][0]*jv[t] for t in range(len(pts))], [pts[t][1]*jv[t] for t in range(len(pts))]])
check("K-30 (b) model: j, a1 j, a2 j dependent", M.rank() < 3)

print("ALL OK" if ok else "SOME FAILED")
```

## Anhang B: Verbrauch

Keine Subagenten, keine Fremdmodell-Anfragen. Ein Rechenblock (das Programm oben) mit einer Laufzeit unter einer Minute. Die Dauer der Arbeit ergibt sich aus den Git-Zeitstempeln.
