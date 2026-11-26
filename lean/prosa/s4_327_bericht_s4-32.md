# S4-32: Prüfbericht zu B-029 (Aussagen S4-27-B, S4-27-C, S4-27-D)

Auftrag S4-32, Rolle Prüfer, Stufe 4. Geprüft wird `behauptungen/B-029.md` gegen die Quelle `lean/prosa/s4_327_spurA_r5_m21.md` (SHA-256 der gelesenen Fassung c4838c5e9e9b82eda119f11945159bf0510f0fee205b7a8d5af4ee8e89b36f6f, stimmt mit der Angabe in B-029 überein). Dieser Bericht setzt keinen Status. Urteile: **bestätigt**, **nicht bestätigt** (mit Stelle) oder **offen**.

---

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet** (ohne dass ich es angefordert habe):

- Der Index `MEMORY.md` des Projektgedächtnisses. Inhalt: Ziel und Regeln des Projekts, Rechte und Grenzen des Orchestrators, Budget von Stufe 4 (6 Runden), Vorgaben für Prüferaufträge, Fremdmodell, Netzzugang, Hinweise zum Mergen. Über B-029, S4-27 oder ein Prüfurteil steht dort nichts.
- Vier Einzeleinträge, beim ersten Befehl im Repo eingeblendet: `hk-verfahren-a10` (Verfahrensdateien 3×2×5 und 3×2×6), `lean-upper-3x2x6` (Lean-Datei für R(3×2×6) ≤ 30), `pruefer-abgleich-s1-20` (Abgleichwerkzeug der Prüfprogramme), `verfahren-randfaelle-s1-04` (Randfälle des Verfahrensformats). Keiner betrifft B-029.

**Was ich außerhalb der Positivliste gesehen habe:**

- Beim Lesen von `lean/prosa/s4_327_spurA_r4_m21.md` habe ich Abschnitt 1 ganz gelesen (Zeilen 24 bis 50), also auch den Wortlaut von S4-21-C (Satz K), S4-21-D (Satz L), S4-21-E, Vermutung S4-21-V, die Folgerung aus S4-21-V und die Lücke L-21. Das war gegen den Auftrag (nur Vorbemerkung und Aussagen A und B). Es sind Aussagen, keine Urteile; benutzt habe ich davon nur den Wortlaut von L-21 zur Einordnung des zweiten Satzes von S4-27-D (Abschnitt 4.3 unten).
- Zur Orientierung habe ich die Überschriftenzeilen der fünf Prosa-Dateien der Liste ausgeben lassen (Abschnittstitel, Namen der Anhangprogramme), darunter Titel wie „Nachrechnung von S4-21 (Aussage S4-27-A)“ und „Rechnung (Aussage S4-27-E)“ aus der Quelle. Inhalte dieser Abschnitte habe ich nicht gelesen.
- Die Ausgabe von `git log --oneline -3` auf `main` zeigte die Commit-Betreffe „Vor Runde 6: Gedächtnisdurchsicht“ und „Runde 5 abgeschlossen: S4-29 eingetragen, B-031 angelegt, Zähler Spur A 2 von 3, Budget 5 von 6“. Das ist ein Zähler- und Budgetstand; ein Urteil zu B-029 enthält er nicht.
- In `lean/prosa/s4_327_spurA_r3_e3.md`, Abschnitt 2, steht die Klammer „B-017 bis B-019 von je einem Prüfer bestätigt“. Das betrifft andere Behauptungen.
- Der Auftrag nennt einen zweiten, unabhängigen Prüfer derselben Behauptung. Ein Urteil zu B-029 habe ich vor meinem Urteil nicht gesehen, und ein erwünschtes Ergebnis war mir nicht genannt.

**Gelesen** (Positivliste): `CLAUDE.md`; `PROTOKOLL.md` Abschnitt 5; `behauptungen/B-029.md`; Quelle Abschnitte 3, 5, 6, 7; `behauptungen/B-030.md`; `lean/prosa/s4_327_spurA_r4_m21.md` Abschnitte 1 bis 5 (siehe oben); `behauptungen/B-026.md`; `lean/prosa/s4_327_spurA_r3_e3.md` Abschnitte 1 bis 4; `lean/prosa/s4_327_spurA_r2_bau.md` Abschnitte 1 bis 4; `lean/prosa/yang_n3.md` Abschnitte 3 bis 5. Nicht gelesen: Abschnitt 4 der Quelle, `STATUS.md`, `LOG.md`, `pruefvermerke/`, `archiv/`, Berichte und Abgleiche zu S4-27.

---

## 1. Ergebnis in Kürze

| Aussage | Urteil |
|---|---|
| S4-27-B (Festlegung von κ auf Y) | **bestätigt** |
| S4-27-C (lokaler Widerspruch) | **bestätigt**, mit einer Präzisierung des Worts „allein“ (Abschnitt 3.5) |
| S4-27-D, erster Satz (Ausschluss von e = 3), bedingt auf die Grundlagen in Abschnitt 2 der Quelle | **bestätigt** (bedingt, wie formuliert) |
| S4-27-D, zweiter Satz („Gleichwertig: L-21 … geschlossen, ohne S4-21-V“) | **bestätigt** in der Lesart „der Fall e = 3, für den L-21 offen war, ist ohne S4-21-V erledigt“; S4-21-V selbst wird nicht bewiesen (Abschnitt 4.3) |
| Angaben in Abschnitt 2 der Quelle, was benutzt wird | **bestätigt**; der Beweis braucht nicht mehr, als in B-030, B-026 und den älteren Dateien wörtlich steht (Abschnitt 5) |
| Körperangabe | **bestätigt**: keine Division durch ganze Zahlen, nur durch c_1(z) oder c_2(z) ≠ 0 und Interpolation an endlich vielen verschiedenen Punkten über dem algebraischen Abschluss |

Ich habe keinen Fehler gefunden. Jeder Schritt in den Abschnitten 3, 5, 6 und 7 der Quelle ist von Hand nachgerechnet; der letzte Eliminationsschritt von S4-27-C zusätzlich mit einem eigenen Programm in exakter rationaler Arithmetik (Anhang).

---

## 2. Rahmen und Bezeichnungen (Abschnitt 3 der Quelle)

**Was „Normalform wie in S4-21-B (ii)“ heißt.** Ein Verfahren der Länge 34 für ⟨3,2,7⟩ über F, übertragen auf den algebraischen Abschluss K (R1), nach Basiswechsel R3 mit (S, T) aus der dichten offenen Menge von Satz G (ii), mit (SN1), (SN2) und skaliert auf a_0 = 1. Weil es wieder ein Verfahren ist (R3 und die Skalierung erhalten die Identität), gelten dort die vier Gruppen der Brent-Gleichungen, also (A) bis (D) mit K′ = ker W (S4-07, Abschnitt 2). In ihr gilt nach B-030: e = 3, (M21), c_1 = c_2 = 0 auf Y (G1), |T_p| = 2d_p auf Y (G2), K″ = K′ ⊕ K^Z (G3), jedes z ∈ Z ist ein eigener a-Punkt mit einem Index, w(z) ≠ 0 und c(z) ≠ (0, 0) (G4).

**Nachgerechnet:**

- Y und Z sind Vereinigungen ganzer Fasern: Nach Satz G (i) hat jedes α_t Rang 1 oder 2 (26 + 8 = 34), und nach (ii) trägt jeder a-Punkt von Z nur seinen einen Index. Also ist „p ⊆ Y“ sinnvoll und K″|_Y = ⊕_{p⊆Y} M_p, sobald K″ = ⊕_p M_p.
- K″ ist ein A-Modul: Nach S4-07, Abschnitt 4.1, ist K″ = w·P_4 ⊕ u·P_2 mit dim K″ = 21 und K″ ⊆ A·w + A·u; (M21) sagt dim(A·w + A·u) = 21, also Gleichheit. Dann ist e_p·K″ ⊆ K″, und aus Σ_p e_p = 1, e_p·e_q = 0 (p ≠ q) als Vektoren folgt K″ = ⊕_p e_p·K″.
- e_p existiert: endlich viele verschiedene Punkte in K², K unendlich; Lagrange-Interpolation durch Produkte trennender Linearformen.
- Die Fortsetzungsabbildung: Die Einschränkung K′ → K″|_Y hat Kern K′ ∩ K^Z = 0 (G3). dim K′ = 13 (V2), dim K″|_Y = Σ_{p⊆Y} d_p = 13 (wörtlich in Satz G (ii); gleichwertig 21 − 8, weil nach (G3) K^Z ⊆ K″ und daher d_z = 1). Also ist sie bijektiv, E ist erklärt, und für x ∈ K′ gilt x(z) = φ_z(x|_Y). **Richtig.**

---

## 3. S4-27-B und S4-27-C

### 3.1 S4-27-B: Zerlegung K^{T_p} = M_p ⊕ b_0·M_p — bestätigt

Multiplikation von K^34 = K″ + b_0·K′ (S4-07, 3.2) mit e_p gibt K^{T_p} = M_p + b_0·(e_p·K′), und e_p·K′ ⊆ e_p·K″ = M_p. Also K^{T_p} ⊆ M_p + b_0·M_p ⊆ K^{T_p}. Mit (G2): 2d_p = |T_p| = dim(M_p + b_0·M_p) ≤ dim M_p + dim(b_0·M_p) ≤ 2d_p. Gleichheit überall: Die Summe ist direkt, und m ↦ b_0·m ist auf M_p injektiv. B_p, N_p sind durch die eindeutige Zerlegung b_0²·m = b_0·m′ + m″ wohldefiniert und linear.

### 3.2 S4-27-B (i) und (ii) — bestätigt

j ∈ J ⊆ K′ ⊆ K″, κ(j) ∈ K′ (Definition aus (C) mit i = 0), b_0·π(j) = Σ y_k b_0·p_k ∈ K′ ((B) mit i = 0). Mit π(j) = b_0·j + κ(j):
e_p·b_0·π(j) = b_0²·j_p + b_0·κ_p = b_0·(B_pj_p + κ_p) − N_pj_p.
Links steht ein Element von M_p, also liegt b_0·(B_pj_p + κ_p) in M_p ∩ b_0·M_p = 0; Injektivität gibt κ_p = −B_pj_p und dann e_p·b_0·π(j) = −N_pj_p. Für alle Fasern über Y zusammen sind das (i) und (ii).

Vertauschbarkeit: Ein Polynom g wirkt auf K^{T_p} als Skalar g(p), M_p ist darunter stabil, B_p und N_p sind linear. **Richtig.**

### 3.3 S4-27-C: die Gleichungen (P_i), (Q_0), (Q_i) — bestätigt

Sei z ∈ Z mit c(z) ≠ 0, φ := φ_z, β_z := b_0(z), j_Y := j|_Y. Da j, κ(j) ∈ K′: j(z) = φ(j_Y), κ(j)(z) = −φ(B·j_Y) (nach B (i)).

- (P_i): Aus (C) mit i = 1, 2 und π(j) = b_0j + κ(j) folgt a_i·κ(j) − c_i·j ∈ K′ (ich habe die Rechnung a_i·p_k − b_i·q_k = a_i·κ_k − c_i·q_k nachgeprüft). x := c_i·j − a_i·κ(j) ∈ K′. x|_Y = a_i·B·j_Y wegen (G1). x(z) = c_i(z)φ(j_Y) + z_iφ(B·j_Y). Gleichsetzen mit φ(x|_Y): c_i(z)φ(j_Y) = φ((a_i − z_i)·B·j_Y). **Richtig.**
- (Q_0): x := b_0·π(j) ∈ K′ ((B), i = 0), x|_Y = −N·j_Y (B (ii)). π(j)(z) = β_zφ(j_Y) − φ(B·j_Y) = φ((β_z − B)·j_Y), punktweise ausgewertet (π(j) selbst muss nicht in K′ liegen; das wird auch nicht benutzt). Also β_zφ((β_z − B)j_Y) + φ(N·j_Y) = 0. **Richtig.**
- (Q_i): x := b_i·π(j) ∈ K′ ((B), i = 1, 2), b_i = c_i + a_i·b_0. x|_Y = −a_i·N·j_Y. x(z) = (c_i(z) + z_iβ_z)·φ((β_z − B)j_Y). Mit (Q_0) für den Anteil z_iβ_z: c_i(z)φ((β_z − B)j_Y) + φ((a_i − z_i)·N·j_Y) = 0. **Richtig.**

### 3.4 S4-27-C: Richtung, Einsetzen, vier Werte — bestätigt

- e ∈ K² mit e·c(z) = 1 existiert; L := e_1(a_1 − z_1) + e_2(a_2 − z_2) hat Grad 1 und L(z) = 0. Die Linearkombinationen (P), (Q) sind richtig gebildet.
- j = w·G, G ∈ P_2: w·G ∈ J (w·P_2 ⊆ J). Für jedes Polynom g ist w·g ∈ K″ (A-Modul), also g·ω ∈ K″|_Y, und m, β, n sind lineare Funktionale. Für deg g ≤ 3 ist w·g ∈ K′ (w·P_3 ⊆ K′), also m(g) = w(z)·g(z). (P′), (Q′), (Q_0′) folgen mit der Vertauschbarkeit aus B. Die benutzten Grade: L·G mit deg G ≤ 2 hat Grad ≤ 3, also bleibt m(G) im zulässigen Bereich deg ≤ 3 (in (P′), (Q′), (Q_0′) kommt m nur mit G ∈ P_2 vor).
- Vier Werte: (1) G = L in (P′): β(L²) = w(z)L(z) = 0. (2) G = L² in (Q_0′) (Grad 2, zulässig): n(L²) = 0. (3) G = L in (Q′): β(L) = n(L²) = 0. (4) G = 1 in (P′): β(L) = w(z). Also w(z) = 0. **Richtig.**
- Eigene Gegenrechnung (Anhang): Das lineare System (P′), (Q′), (Q_0′) für alle G aus der Monombasis von P_2, mit Unbekannten β(Monom), n(Monom) für Monome vom Grad ≤ 3 und W = w(z), erzwingt W = 0 in 300 von 300 zufälligen Wahlen von z, c(z), β_z (exakt über ℚ). Lässt man eine der drei Gruppen weg, ist W in 0 von 300 Fällen erzwungen. Das bestätigt auch die Bemerkung der Quelle, dass jede Gruppe gebraucht wird, für diesen Schlussschritt.

### 3.5 Präzisierung zu „aus (B) und (C) allein“

Wörtlich benutzt der Beweis neben (B) (i = 0, 1, 2) und (C) (i = 0, 1, 2, über (C′) und κ) auch die Voraussetzungen der Normalform: (G1), (G2), (G3), dim K′ = 13, w·P_2 ⊆ J, w·P_3 ⊆ K′, K^34 = K″ + b_0·K′ und dass K″ ein A-Modul ist. Diese stecken in „Es liege eine Normalform wie in S4-21-B (ii) vor“ und in S4-07, Abschnitte 3.1, 3.2 und 4.1. Ich lese „allein“ als „von den Brent-Gruppen werden zusätzlich zur Normalform nur (B) und (C) gebraucht, nicht (D) und nicht u oder Θ“. In dieser Lesart ist der Satz richtig. Gruppe (A) wird nicht direkt benutzt, nur über die übernommenen Strukturaussagen.

**Urteil S4-27-B: bestätigt. Urteil S4-27-C: bestätigt** (mit der Lesart oben). Beide Aussagen sind für jede Normalform wie in S4-21-B (ii) gezeigt, über dem algebraischen Abschluss K, in jeder Charakteristik. Da (G4) in einer solchen Normalform w(z) ≠ 0 und c(z) ≠ 0 für jedes z ∈ Z verlangt und Z acht Elemente hat, sagt S4-27-C insbesondere, dass es eine solche Normalform nicht gibt; das ist logisch in Ordnung und genau der Inhalt von S4-27-D.

---

## 4. S4-27-D

### 4.1 Beweisgang (Abschnitt 7 der Quelle) — bestätigt

Angenommen, ein Verfahren der Länge 34 über F hat in einer Normalform e = 3. Satz G (B-030) setzt genau das voraus und liefert eine dichte offene, also nicht leere Menge von (S, T) (G = GL_3 × GL_2 ist irreduzibel), deren Normalform die Gestalt (ii) hat. Dort gelten (B) und (C), weil die Normalform wieder ein Verfahren mit K′ = ker W ist. Z hat 8 Elemente; für z ∈ Z ist nach (G4) w(z) ≠ 0 und c(z) ≠ 0, nach S4-27-C aber w(z) = 0. Widerspruch. **Richtig.**

### 4.2 Quantoren

- **Verfahren und Körper:** jedes Verfahren der Länge 34 über jedem Körper F, unter der ausdrücklichen Bedingung, dass die übernommenen Aussagen (Restfall, S4-07, Satz R, Satz G samt Lemma O und Lemma F) über jedem Körper gelten. Die neuen Schritte (Abschnitte 3, 5, 6) dividieren nur durch c_1(z) oder c_2(z) (≠ 0) und benutzen Interpolation an endlich vielen verschiedenen Punkten über dem unendlichen Körper K. Keine Division durch eine ganze Zahl. Der Übergang F → K ist R1: Ein Verfahren über F ist eines über K, also folgt die Nichtexistenz über F aus der über K.
- **Normalformen:** „in irgendeiner Normalform e = 3“ ist genau die Voraussetzung von Satz G. Der Beweis benutzt dann nur die eine, von Satz G gelieferte Normalform. Normalform heißt dabei, wie in S4-21 Abschnitt 1 und S4-07 Abschnitt 1.1: über K, nach R3 mit (SN1), (SN2), skaliert auf a_0 = 1. R2 entfällt, weil Länge 34 die untere Schranke ist.
- **Bedingtheit:** Die Aussage ist im Wortlaut ausdrücklich bedingt auf Abschnitt 2 der Quelle. Unbedingt gezeigt ist sie mit diesem Bericht nicht.

### 4.3 Zweiter Satz von S4-27-D

„Gleichwertig: Die Lücke L-21 aus S4-21 (und damit der Unterfall (M21) aus S4-14) ist geschlossen, ohne Vermutung S4-21-V zu benutzen.“

- S4-21-V wird im Beweis von S4-27-B, -C, -D nirgends benutzt (nachgeprüft: keine Stelle in den Abschnitten 3, 5, 6, 7 beruft sich auf V oder auf Aussagen über (C′) mit c als Unbekannter). Satz K und Satz L werden ebenfalls nicht benutzt.
- Der Unterfall (M21) ist nach S4-14-B (iii) der einzige Unterfall von e = 3; der Ausschluss von e = 3 erledigt ihn.
- L-21 lautet in S4-21 „Offen ist genau S4-21-V“. S4-27-D beweist S4-21-V nicht, sondern macht V für den Ausschluss überflüssig. „Geschlossen“ ist deshalb im Sinn von „der Fall, für den L-21 die offene Stelle war, ist erledigt“ zu lesen, nicht als „S4-21-V ist gezeigt“. In dieser Lesart **bestätigt**. „Gleichwertig“ ist sprachlich ungenau (der erste Satz ist die stärkere, eigentliche Aussage), ändert am Inhalt aber nichts.

**Urteil S4-27-D: bestätigt** (bedingt auf die Grundlagen in Abschnitt 2 der Quelle, wie formuliert).

---

## 5. Benutzte Voraussetzungen und ob der Beweis mehr braucht

Benutzt (als Voraussetzung übernommen, nicht selbst geprüft):

| Voraussetzung | wörtlich in | benutzt in |
|---|---|---|
| (G1) c_1 = c_2 = 0 auf Y | B-030, Satz G (ii) | (P_i), (Q_i) |
| (G2) \|T_p\| = 2d_p, Σ_{p⊆Y} d_p = 13 | B-030, Satz G (ii) | S4-27-B; Fortsetzungsabbildung |
| (G3) K′ ∩ K^Z = 0, K″ = K′ ⊕ K^Z | B-030, Satz G (ii) | Fortsetzungsabbildung |
| (G4) Z: 8 eigene a-Punkte je mit einem Index, w ≠ 0, c ≠ 0 | B-030, Satz G (ii) | S4-27-D; Y, Z als Fasermengen |
| Satz G (i): Rang 1 oder 2, 26 + 8 | B-030 | Y ∪ Z = alle Indizes |
| e = 3 und (M21) in der Normalform | B-030, Satz G (ii) | K″ ist A-Modul |
| Existenz der Normalform (dichte offene Menge, Lemma O, Lemma F) | B-030 | S4-27-D |
| K″ = w·P_4 ⊕ u·P_2, dim 21, K^34 = K″ ⊕ b_0·K′, w·P_3 ⊆ K′ | S4-07 Abschnitt 4.1; B-026 Satz R, Schritt 1 | S4-27-B, -C |
| w·P_2 ⊆ J | S4-07 Abschnitt 3.1; B-026 (V4) | S4-27-C |
| dim K′ = 13 | B-026 (V2); S4-07 1.2 | Fortsetzungsabbildung |
| (B), (C), (C′), κ | S4-07 Abschnitt 2 | S4-27-B, -C |
| R1, R3, Lemma A, (SN1), (SN2), Skalierung | yang_n3 Abschnitte 3, 5; S4-07 1.1 | Rahmen, S4-27-D |

**Braucht der Beweis mehr, als dort wörtlich steht?** Nein. Zwei Kleinigkeiten, die nicht wörtlich dastehen, aber unmittelbar aus wörtlich Stehendem folgen:

1. Dass K″ ein A-Modul ist, steht in Satz G (ii) nur als „(M21)“. Mit S4-07 4.1 (K″ = w·P_4 ⊕ u·P_2, dim 21) folgt K″ = A·w + A·u (Abschnitt 2 oben). Satz R (B-026) sagt es auch direkt.
2. Dass Y und Z aus ganzen Fasern bestehen, folgt aus (G4) und Satz G (i) (Abschnitt 2 oben).

Die Angabe der Quelle, Satz R werde „nur über Satz G“ benutzt, ist in diesem Sinn richtig: Was von Satz R gebraucht wird, steckt in (M21) aus Satz G (ii) zusammen mit S4-07 4.1. Nicht benutzt werden: Satz K, Satz L, S4-14-V1, S4-14-V2, S4-21-V, der Vektor u (außer in den übernommenen Aussagen), Θ und (D) (außer in den übernommenen Aussagen). Das deckt sich mit Abschnitt 2 der Quelle.

---

## 6. Verbrauch

Keine Subagenten, keine Fremdmodell-Anfragen. Ein Rechenblock unter 2 Sekunden auf einem Kern (Anhang). Die Zeiten stehen in den Git-Zeitstempeln.

---

## Anhang: elim.py (Python 3, exakte rationale Arithmetik, keine Gleitkommazahlen)

Aufruf `python3 elim.py 32 300`. Ausgabe:

```
('P', 'Q', 'Q0') W forced to 0 in 300 of 300
('Q', 'Q0') W forced to 0 in 0 of 300
('P', 'Q0') W forced to 0 in 0 of 300
('P', 'Q') W forced to 0 in 0 of 300
```

```python
# S4-32: independent check of the final elimination in S4-27-C (section 6, "Vier Werte").
# Unknowns: beta(mon), n(mon) for monomials of degree <= 3, W = w(z). Exact rationals.
import random, sys
from fractions import Fraction as Fr
mons=[(i,d-i) for d in range(4) for i in range(d,-1,-1)]
idx={m:k for k,m in enumerate(mons)}
NB=len(mons); NV=2*NB+1  # beta block, n block, W
def mul(p,q):
    r={}
    for a,x in p.items():
        for b,y in q.items():
            m=(a[0]+b[0],a[1]+b[1]); r[m]=r.get(m,0)+x*y
    return {m:v for m,v in r.items() if v!=0}
def ev(p,z): return sum(v*z[0]**m[0]*z[1]**m[1] for m,v in p.items())
def rank_null_W(rows):
    # Gaussian elimination; return True iff W is forced to 0 (W-unit vector in row space)
    M=[r[:] for r in rows]; piv=[]; r0=0
    for c in range(NV):
        p=next((i for i in range(r0,len(M)) if M[i][c]!=0),None)
        if p is None: continue
        M[r0],M[p]=M[p],M[r0]; inv=1/M[r0][c]; M[r0]=[x*inv for x in M[r0]]
        for i in range(len(M)):
            if i!=r0 and M[i][c]!=0:
                f=M[i][c]; M[i]=[a-f*b for a,b in zip(M[i],M[r0])]
        piv.append(c); r0+=1
    # W forced to 0 iff some reduced row equals e_W
    return any(all((x==0) for j,x in enumerate(row) if j!=NV-1) and row[NV-1]!=0 for row in M[:r0])
def run(groups,rnd):
    z=(Fr(rnd.randint(-50,50)),Fr(rnd.randint(-50,50)))
    c=(Fr(rnd.randint(-9,9)),Fr(rnd.randint(-9,9)))
    if c==(0,0): c=(Fr(1),Fr(0))
    # e with e.c=1
    e=(1/c[0],Fr(0)) if c[0]!=0 else (Fr(0),1/c[1])
    L={(1,0):e[0],(0,1):e[1],(0,0):-(e[0]*z[0]+e[1]*z[1])}
    L={m:v for m,v in L.items() if v!=0}
    bz=Fr(rnd.randint(-50,50))
    rows=[]
    for G in [{m:Fr(1)} for m in mons if sum(m)<=2]:
        Gz=ev(G,z); LG=mul(L,G)
        if 'P' in groups:
            r=[Fr(0)]*NV
            for m,v in LG.items(): r[idx[m]]+=v
            r[-1]-=Gz; rows.append(r)
        if 'Q' in groups:
            r=[Fr(0)]*NV; r[-1]+=bz*Gz
            for m,v in G.items(): r[idx[m]]-=v
            for m,v in LG.items(): r[NB+idx[m]]+=v
            rows.append(r)
        if 'Q0' in groups:
            r=[Fr(0)]*NV; r[-1]+=bz*bz*Gz
            for m,v in G.items(): r[idx[m]]-=bz*v; r[NB+idx[m]]+=v
            rows.append(r)
    return rank_null_W(rows)
rnd=random.Random(int(sys.argv[1]) if len(sys.argv)>1 else 1)
T=int(sys.argv[2]) if len(sys.argv)>2 else 200
for groups in [('P','Q','Q0'),('Q','Q0'),('P','Q0'),('P','Q')]:
    forced=sum(run(groups,rnd) for _ in range(T))
    print(groups,'W forced to 0 in',forced,'of',T)
```

Das Programm prüft nur den letzten Schritt (aus (P′), (Q′), (Q_0′) folgt w(z) = 0) als lineare Algebra über ℚ mit zufälligen Parametern. Es ersetzt die Handrechnung der übrigen Schritte nicht.
