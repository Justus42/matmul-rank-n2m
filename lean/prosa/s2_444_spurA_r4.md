# S2-16: Die Restfälle (3,6) und (5,8) für ⟨4,2,4⟩ bei Rang 25, Bericht der Spur A, Runde 4

- Auftrag: S2-16 (Stufe 2, Runde 4), Rolle Beweissucher, Spur A. Ein Restfall darf in beide Richtungen angegriffen werden (Protokoll 0.3, Abschnitt 3).
- Datum: 25.11.2026
- Status aller Aussagen dieses Berichts: **behauptet** (Beweise und Rechnungen eines Agenten, von niemandem geprüft), wo ausdrücklich gesagt: **vermutet**. Nichts hier ist geprüft im Sinn von Abschnitt 5 des Protokolls. Die Wörter „bewiesen“ und „gelöst“ kommen deshalb nicht vor; „Beweis“ heißt hier Prosa-Beweis.
- Grundlage: `lean/prosa/yang_n4.md` (Bezeichnungen, Lemma 8, Folgerung 7), `lean/prosa/s2_444_spurA_r2.md` (S2-05: Satz A, Satz B, Lemmata 13′, V, S, Modelle), `lean/prosa/s2_444_spurA_r2_pruefung.md` (S2-09: Reparatur R1, Fassung V′ von Lemma V), `behauptungen/B-007.md`, `B-008.md`, `B-009.md`. `versuche/` gelesen.
- Kein Fremdmodell benutzt.
- Code und Ausgaben: `versuche/s2-16/` (eigener Code, Python, exakte Arithmetik: sympy über ℚ, GF(2³¹), ℤ/(2⁶¹−1); keine Gleitkommazahlen).

---

## 1. Ergebnis in Kürze

1. **Satz C (neu): Über keinem Körper hat ⟨4,2,4⟩ eine symmetrische Zerlegung der Länge 25.** „Symmetrisch“ heißt wie in Folgerung V1 von S2-05: Für p aus einer nichtleeren offenen Menge gibt es eine invertierbare Matrix G_p mit G_pᵀ b_t(p) ∥ a_t(p) für alle Terme t. Der Beweis (Abschnitt 3) leitet die Zerlegungsgleichung an zwei benachbarten Stellen p und p + εd ab und erhält eine Identität (Kl), in der nur die Punkte a_t(p) vorkommen. Eine Quadrik durch alle a_t(p) gibt es bei Länge 25 immer (dim Ĵ ≤ 9 < 10), und (Kl) verbietet sie. Die Identität (Kl) habe ich exakt nachgerechnet: an Strassens Verfahren über ℚ und an den 14 symmetrischen Verfahren der Länge 26 über 𝔽₂ aus S2-05.
2. **Folgerung: Der Fall (3,6) ist über jedem Körper ausgeschlossen.** Nach Satz B (B-009) ist eine Zerlegung im Fall (3,6) symmetrisch, nach Satz C gibt es keine solche. Damit bleibt von Yangs vier Restfällen nur **(5,8)**.
3. **Fall (5,8), eingegrenzt.** Ist die Zerlegung symmetrisch, greift Satz C. Sonst ist nach V′ (S2-09) der gemeinsame Kern N(u_0) für jedes zulässige u_0 null, und nach Lemma 13′ ist s = 1. Daraus folgt eine Büschelstruktur (Lemma P, Abschnitt 5.1): Die Kernvektoren k(γ) der F_γ spannen einen Raum K* der Dimension 2 (Unterfall A) oder 3 (Unterfall B).
4. **Satz E (neu): Unterfall A ist unmöglich.** Dort ist Ψ auf K⁴ × K* eine „enge“ nichtsinguläre Abbildung nach K⁵. Nach Kronecker ist sie die Multiplikation kubischer mit linearen binären Formen. Daraus folgt: Alle a_t liegen auf einer verdrehten Kubik, alle b_t auf einer rationalen Kurve vom Grad 4, mit demselben Parameter σ_t. Dann liegen die a_t ⊗ b_t in einem Raum der Dimension ≤ 8, aber dim Ĵ = 9 (Abschnitt 5.2).
5. **Offen bleibt genau ein Unterfall:** (5,8), nicht symmetrisch, s = 1, Unterfall B, und zwar für die Zerlegung und für ihre Transponierte zugleich (Abschnitt 5.3). Dort liegen alle b_t auf einer verdrehten Kubik, und alle a_t ebenso. Die Gradzählung aus Satz E ergibt hier genau 9 und schließt nichts aus. Was fehlt, steht in Abschnitt 5.4.
6. **Richtung zwei (Bau eines Verfahrens):** Im Fall (3,6) gibt es nach Satz C kein Verfahren. Die Modelle M1, M3 und K(0,1,2,5) aus S2-05 sind symmetrisch (a_t = b_t). Keine Zerlegung, die auf einer offenen Menge von p symmetrisch ist, setzt sie fort. Für (5,8) ist nur noch der Unterfall B möglich. Er gibt eine konkrete Gestalt der Daten vor (Abschnitt 6), eine Suche danach habe ich in dieser Runde nicht gerechnet. Ein Verfahren mit 25 Produkten habe ich nicht gefunden.
7. **Daten (Abschnitt 7):** In allen 14 Verfahren der Länge 26 mit ρ = 3 über 𝔽₂ hängt G_p nicht von p ab. 19 der 26 Matrizen A_t haben Rang 1. Die Verfahren sind fast invariant unter der Involution (A, B, C) ↦ (G⁻¹BᵀJ, JAᵀGᵀ, Cᵀ): 25 der 26 Terme gehen in Terme über, 7 Terme bleiben fest.

Für die Abbruchregel: Satz C mit seiner Folgerung schließt einen benannten Fall der Fallunterscheidung aus, (3,6). Fortschritt nach Regel 2 b) wird es erst nach Bestätigung durch Prüfer und Fremdmodell. Die Behauptungen stehen in `behauptungen/B-012.md` (Satz C) und `behauptungen/B-013.md` (Lemma P und Satz E).

---

## 2. Rahmen und Bezeichnungen

Alles wie in `lean/prosa/yang_n4.md` und S2-05 Abschnitt 2, mit n = m = 4, r = 25, K algebraisch abgeschlossen (Lemma R1). Zusätzlich brauche ich die Abhängigkeit von p ausdrücklich. Das ist dieselbe Zerlegung, nur ohne Basiswechsel geschrieben.

- Die Zerlegung ist A·B = Σ_t α_t(A) β_t(B) C_t mit α_t(A) = Σ_{i,k} A_t[i,k] A[i,k] und β_t(B) = Σ_{k,j} B_t[k,j] B[k,j], also A_t ∈ K^{4×2}, B_t ∈ K^{2×4}.
- J := [[0, −1], [1, 0]], ω(p, p′) := pᵀ J p′ für p, p′ ∈ K² (alternierend, ω(p,p) = 0, ω(p,p′) ≠ 0 für unabhängige p, p′).
- **a_t(p) := A_t p ∈ K⁴** und **b_t(p) := B_tᵀ J p ∈ K⁴**. Beide sind linear in p. Mit v_p := Jp gilt p·v_p = 0. Das ist bis auf die Basis die Lage aus S2-05: Ψ_p(u, w)_t = α_t(u pᵀ) β_t(v_p wᵀ) = (a_t(p)·u)(b_t(p)·w).
- **Grundidentität (D).** Für A = u pᵀ und B = v′ wᵀ ist A·B = (p·v′) u wᵀ. Mit v′ = J p′ folgt für alle p, p′ ∈ K² und u, w ∈ K⁴:

  Σ_t (a_t(p)·u)(b_t(p′)·w) C_t = ω(p, p′) · u wᵀ.   (D)

  Für p′ = p ist das die bekannte Aussage Ĵ_p ⊆ ker W.
- Ĵ_p := span{Ψ_p(u, w)}. Es ist dim Ĵ_p = dim span{a_t(p) ⊗ b_t(p)} (die Abbildung X ↦ (a_t(p)ᵀ X b_t(p))_t hat das Bild Ĵ_p) und rk L = dim Ĵ_p − 4 (S2-05). Wegen Ĵ_p ⊆ ker W und dim ker W = 25 − 16 = 9 gilt **dim span{a_t(p) ⊗ b_t(p)} ≤ 9**.
- **Zulässiges p** wie in S2-05 Abschnitt 2 mit Reparatur R1 aus S2-09: (N2) gilt, α_t(·⊗p) ≢ 0 und β_t(v_p⊗·) ≢ 0 für alle t. Das ist eine nichtleere offene Bedingung. Für zulässiges p ist a_t(p) ≠ 0 und b_t(p) ≠ 0 für alle t. Zulässige u_0 erfüllen a_t(p)·u_0 ≠ 0 für alle t (N1).
- Kein Term ist überflüssig: Wäre A_t = 0 oder B_t = 0, gäbe es eine Zerlegung der Länge 24, im Widerspruch zu B-007 (geprüft).

**Symmetrisch** (wie Folgerung V1 in S2-05, hier mit der Abhängigkeit von p): Es gibt eine nichtleere offene Menge P ⊆ K² und zu jedem p ∈ P eine invertierbare Matrix M_p mit M_p b_t(p) ∈ K·a_t(p) für alle t. (In S2-05 heißt M_p = G_pᵀ.)

---

## 3. Satz C: Keine symmetrische Zerlegung der Länge 25

**Satz C.** Über keinem Körper hat ⟨4,2,4⟩ eine symmetrische Zerlegung der Länge 25.

### 3.1 Schritt 0: M_p und μ_t(p) als rationale Funktionen

Die Bedingung „M b_t(p) ∈ K·a_t(p) für alle t“ ist linear in M: alle 2×2-Minoren der 4×2-Matrix [M b_t(p) | a_t(p)] verschwinden. Die Koeffizienten sind Polynome in p. Über dem Funktionenkörper K(p) (etwa p = (1, s)) hat der Lösungsraum eine Basis M_1(p), …, M_k(p) aus Polynommatrizen. Außerhalb endlich vieler s ist der Lösungsraum an der Stelle p genau span{M_i(p)}. Nach Voraussetzung enthält er für p in einer offenen Menge eine invertierbare Matrix. Also ist das Polynom det(Σ_i c_i M_i(p)) in den Variablen (c, p) nicht das Nullpolynom, und es gibt Konstanten c ∈ K^k, für die det(Σ c_i M_i(p)) als Polynom in p nicht null ist. Setze **M_p := Σ c_i M_i(p)**, **H_p := M_p⁻¹**. Dann gibt es rationale Funktionen μ_t(p) mit

  M_p b_t(p) = μ_t(p) a_t(p), also **b_t(p) = μ_t(p) H_p a_t(p)**,   (S)

nämlich μ_t(p) = (M_p b_t(p))_i / a_t(p)_i für ein i mit a_t(p)_i ≢ 0. Kein μ_t ist die Nullfunktion, sonst wäre b_t(p) = 0 für alle p, also B_t = 0. Halte ein zulässiges p fest, an dem M_p und alle μ_t definiert sind, det M_p ≠ 0 und μ_t(p) ≠ 0 für alle t gilt. Solche p bilden eine nichtleere offene Menge.

### 3.2 Schritt 1: zwei Fassungen von (D)

Setze (S) an der Stelle p′ in (D) ein: b_t(p′)·w = μ_t(p′)(a_t(p′)·H_{p′}ᵀ w). Mit w = H_{p′}⁻ᵀ w̃:

  Σ_t μ_t(p′)(a_t(p)·u)(a_t(p′)·w̃) C_t = ω(p, p′) · u w̃ᵀ H_{p′}⁻¹.   (E1)

Vertauscht man in (D) die Rollen von p und p′ und setzt (S) an der Stelle p ein, erhält man nach Umbenennen von u und w̃:

  Σ_t μ_t(p)(a_t(p)·u)(a_t(p′)·w̃) C_t = ω(p′, p) · w̃ uᵀ H_p⁻¹ = −ω(p, p′) · w̃ uᵀ H_p⁻¹.   (E2)

(E1) und (E2) gelten für alle u, w̃ und für p, p′ aus einer offenen Menge, also als Identitäten rationaler Funktionen in (p, p′).

### 3.3 Schritt 2: Ableitung, die Identität (Kl)

Ziehe (E2) von (E1) ab:

  Σ_t (μ_t(p′) − μ_t(p))(a_t(p)·u)(a_t(p′)·w̃) C_t = ω(p, p′)[u w̃ᵀ H_{p′}⁻¹ + w̃ uᵀ H_p⁻¹].

Setze p′ = p + εd mit d ∈ K², ω(p, d) ≠ 0, und rechne in K[ε]/(ε²) (alle Nenner sind an der Stelle p ungleich null, also ist das Einsetzen erlaubt). Mit δ_t := (Ableitung von μ_t an der Stelle p in Richtung d) ist die linke Seite ε Σ_t δ_t (a_t(p)·u)(a_t(p)·w̃) C_t, die rechte ε ω(p,d)(u w̃ᵀ + w̃ uᵀ) H_p⁻¹, jeweils plus O(ε²). Der Koeffizient von ε gibt:

  **Σ_t δ_t (a_t(p)·u)(a_t(p)·w̃) C_t = ω(p, d) · (u w̃ᵀ + w̃ uᵀ) · M_p**   für alle u, w̃ ∈ K⁴.   (Kl)

Die Identität (Kl) gilt für jede symmetrische Zerlegung von ⟨n,2,n⟩, jeder Länge und in jeder Charakteristik (mit K^n statt K⁴). Gegenproben in Abschnitt 3.6.

### 3.4 Schritt 3: eine Quadrik durch alle a_t(p)

Wegen (S) und μ_t(p) ≠ 0 ist a_t(p) ⊗ b_t(p) = μ_t(p)(I ⊗ H_p)(a_t(p) ⊗ a_t(p)). Also

  dim span{a_t(p) ⊗ a_t(p)} = dim span{a_t(p) ⊗ b_t(p)} = dim Ĵ_p ≤ 9.

Die Vektoren x ⊗ x (x ∈ K⁴) spannen in jeder Charakteristik einen Raum der Dimension 10 auf (die symmetrischen Tensoren). Also gibt es eine Matrix Q ∈ K^{4×4} mit

  a_t(p)ᵀ Q a_t(p) = 0 für alle t, aber q(x) := xᵀ Q x ist nicht die Nullform.

### 3.5 Schritt 4: der Widerspruch

Setze in (Kl) u = e_i, w̃ = e_j, multipliziere mit Q_{ij} und summiere über i, j. Links steht Σ_t δ_t (a_t(p)ᵀ Q a_t(p)) C_t = 0. Rechts steht ω(p, d)(Q + Qᵀ) M_p. Da ω(p, d) ≠ 0 und M_p invertierbar ist, folgt

  **Q + Qᵀ = 0.**

Q + Qᵀ ist die Matrix der Polarform von q, also hat q die Polarform null.
- Charakteristik ≠ 2: Dann ist q(x) = ½ xᵀ(Q + Qᵀ)x = 0, Widerspruch.
- Charakteristik 2: Eine quadratische Form mit Polarform null hat keine gemischten Glieder, q(x) = Σ c_i x_i². Über dem algebraisch abgeschlossenen K ist q = ℓ² mit der Linearform ℓ(x) = Σ c_i^{1/2} x_i ≠ 0. Dann ist ℓ(a_t(p)) = 0 für alle t. Sei ℓ(x) = l·x. Für A = l pᵀ ist α_t(A) = lᵀ A_t p = ℓ(a_t(p)) = 0 für alle t, also A·B = 0 für alle B nach der Zerlegungsgleichung. Aber A·B = l (pᵀB) ≠ 0 für passendes B. Widerspruch.

Also gibt es keine symmetrische Zerlegung der Länge 25. ∎

**Bemerkung C′ (allgemeines n, behauptet).** Derselbe Beweis zeigt für ⟨n,2,n⟩: Ist eine Zerlegung der Länge r symmetrisch, dann liegt keine Quadrik durch alle a_t(p), also n(n+1)/2 ≤ dim Ĵ_p ≤ r − n², das heißt **r ≥ n² + n(n+1)/2 = (3n² + n)/2**. Das ist genau die Hopcroft-Kerr-Zahl ⌈(3nm + max(n,m))/2⌉ für n = m. Symmetrische Verfahren kommen also nie unter die bekannte obere Schranke. Für n = 2 und n = 3 ist das mit den bekannten Rängen 7 und 15 verträglich. Strassens Verfahren ist symmetrisch (Abschnitt 3.6) und erreicht die Schranke 7.

**Wie belastbar ist das?** Status behauptet. Kritische Stellen für einen Prüfer:
1. Schritt 0: die rationale Wahl von M_p (Lösungsraum über K(p), Existenz einer invertierbaren Kombination mit konstanten Koeffizienten). Ohne sie wäre die Ableitung von μ_t nicht erklärt.
2. Schritt 2: Vorzeichen und Umbenennung in (E2). Die Gegenprobe über ℚ (Strassen) prüft genau die Vorzeichen.
3. Schritt 4 in Charakteristik 2: Polarform null ⇒ Quadrat einer Linearform; danach das elementare Argument mit A = l pᵀ.
4. Die Anwendung: dass die Symmetrie aus Satz B für p aus einer offenen Menge gilt, nicht nur für ein einzelnes p (Abschnitt 4).

### 3.6 Gegenproben (exakt)

- `versuche/s2-16/klee.py` (sympy über ℚ, p = (1, s) symbolisch): Strassens Verfahren für ⟨2,2,2⟩. Die Matrizen C_t werden aus den A_t, B_t durch exaktes Lösen bestimmt. Ergebnis: Lösungsraum für M_p über ℚ(s) eindimensional, M_p = [[0,−1],[1,0]] konstant, (Kl) gilt identisch in s, ebenso die Gleichung nullter Ordnung Σ_t μ_t a_t a_tᵀ ⊗ C_t = 0, und dim span{a_t a_tᵀ} = 3 = dim Sym²(K²). Ausgabe: `klee_ausgabe.txt`.
- `versuche/s2-16/klee_f2.py` (GF(2³¹), Ableitung mit dualen Zahlen): die 14 Verfahren der Länge 26 mit ρ = 3 aus `versuche/s2-spurA-r2/daten/rho3_rang26_f2.txt`. In allen 14 gilt (Kl) exakt, 19 der 26 Funktionen μ_t sind nicht konstant (die Ableitung wird also wirklich gebraucht), und dim span{a_t ⊗ a_t} = 10, wie Satz C für symmetrische Verfahren verlangt. Ausgabe: `klee_f2_ausgabe.txt`.

In Charakteristik 2 prüft die zweite Rechnung keine Vorzeichen. Die erste prüft sie über ℚ.

---

## 4. Folgerungen für die Restfälle

**Folgerung C1 (Fall (3,6) ausgeschlossen, behauptet).** Hat ⟨4,2,4⟩ über einem Körper eine Zerlegung der Länge 25, so liegt sie in Yangs Normalform nicht im Fall (3,6).

*Beweis.* Nach Satz B (B-009, mit R1 und V′ aus S2-09) ist eine Zerlegung im Fall (3,6) für jedes zulässige p symmetrisch. Die zulässigen p bilden eine nichtleere offene Menge, in der der Fall (rk L, rk H) überall derselbe ist. Satz C schließt das aus. ∎

Zusammen mit Satz A (B-008) und Satz B (B-009): **Eine Zerlegung der Länge 25 liegt im Fall (5,8) und ist nicht symmetrisch.**

**Folgerung C2 ((5,8) ist nicht symmetrisch, behauptet).** Sei die Zerlegung im Fall (5,8). Die Menge der zulässigen p, an denen eine invertierbare M_p wie oben existiert, ist konstruierbar (Projektion einer konstruierbaren Menge, Chevalley). Wäre sie dicht, enthielte sie eine offene Menge, und Satz C gäbe einen Widerspruch. Also gibt es eine nichtleere offene Menge P_ns zulässiger p ohne Symmetrie. Für p ∈ P_ns gilt nach V′ (S2-09): **N(u_0) = 0 für jedes zulässige u_0**, und nach Lemma 13′ (rk H = 8 ≥ 7 + s): **s = 1**.

**Folgerung C3 (Modelle).** Die Modelle M1, M3 und K(0,1,2,5) aus S2-05 Abschnitt 8.3 haben a_t = b_t und sind damit an ihrer Stelle p symmetrisch. Keine Zerlegung der Länge 25, die auf einer offenen Menge von p symmetrisch ist, setzt eines davon fort. Ein Modell an einer einzelnen Stelle p ist kein generischer Punkt. Ganz ausgeschlossen sind diese Modelle deshalb nur unter dieser Zusatzannahme.

---

## 5. Der Fall (5,8)

In diesem Abschnitt ist p ∈ P_ns fest (Folgerung C2), u_0 zulässig und generisch, und es gilt N(u_0) = 0, s = 1, ρ = 3, rk L = 5, rk H = 8. Schreibweise wie in S2-05: F_γ := Σ_{i=1}^3 γ_i F_i : U → Q, und für u ∈ K⁴ mit Koordinaten (γ_0, γ) ist F_γ(x) = Ψ(u, x) + J, J = Ψ(u_0, U). Für generisches γ ist rk F_γ = 3 und ker F_γ = K·k(γ).

### 5.1 Lemma P (Büschel)

**Lemma P.** Es gibt γ* ≠ 0 mit F_{γ*} k(γ) = 0 für alle generischen γ. Der Raum K* := span{k(γ)} hat Dimension 2 oder 3, und F_{γ*}(K*) = 0. Genauer, in einer Basis mit γ* = e_3:
- **Unterfall A (dim K* = 2):** Es gibt q ∈ Q, q ≠ 0, mit F_γ(K*) ⊆ K·q für alle γ.
- **Unterfall B (dim K* = 3):** rk F_{γ*} = 1, und F_γ(K*) liegt für alle γ in einem festen Raum Q_2 der Dimension 2.

*Beweis.* (1) Für generisches γ sei D(γ) := {δ ∈ K³ : F_δ k(γ) = 0}. Wegen s = 1 (Lemma 13′ mit F_1 := F_γ, s = 0 hieße k(γ) ∈ N) ist dim D(γ) = 3 − 1 = 2. D(γ) hängt nur von k(γ) ab. Ist γ′ ein generischer Punkt der Geraden ℙ(D(γ)), dann ist k(γ) ∈ ker F_{γ′}, also k(γ′) = k(γ) und D(γ′) = D(γ). Die Geraden ℙ(D(γ)) bilden eine Familie, und durch einen generischen Punkt γ geht genau eine davon: Lägen auf γ zwei verschiedene, ℙ(D(γ_1)) und ℙ(D(γ_2)), so wäre k(γ_1) = k(γ) = k(γ_2), also D(γ_1) = D(γ_2).

(2) Die Familie ist eine Kurve Γ in der dualen Ebene: Ein einzelner Punkt von Γ hieße, eine Gerade enthält alle generischen γ. Eine zweidimensionale Familie hieße, durch jeden Punkt gehen unendlich viele Geraden der Familie. Durch einen generischen Punkt gehen deg Γ Geraden von Γ (eine generische Gerade der dualen Ebene schneidet die reduzierte Kurve Γ transversal, in jeder Charakteristik). Also ist deg Γ = 1, und Γ ist ein Büschel von Geraden durch einen festen Punkt ℙ(γ*). Damit liegt γ* in jedem D(γ), also F_{γ*} k(γ) = 0.

(3) In der Basis mit γ* = e_3 hängt k(γ) nur von λ = (γ_1 : γ_2) ab: k_λ. Es gilt F_3 k_λ = 0 und (λ_1F_1 + λ_2F_2) k_λ = 0 für alle λ ∈ ℙ¹. k_λ ist nicht konstant, sonst wäre k ∈ N(u_0). Also dim K* ≥ 2. dim K* = 4 hieße F_3 = 0, im Widerspruch zu Lemma 9 (yang_n4.md). Also dim K* ∈ {2, 3}.

(4) Das Bündel P(λ) := (λ_1F_1 + λ_2F_2)|_{K*} hat für jedes λ einen Kernvektor, der sich mit λ bewegt. Kronecker-Normalform (über algebraisch abgeschlossenem K, jede Charakteristik): Ein gemeinsamer Kernvektor ist ausgeschlossen (er läge in N). Bei dim K* = 2 bleibt nur ein L_1-Block mit Nullzeilen, also ein gemeinsames eindimensionales Bild K·q. Bei dim K* = 3 spannt der Kernvektor k_λ drei Dimensionen auf, ist als Polynom in λ also vom Grad 2 (minimaler Index 2). Andere Blöcke als L_2 und Nullzeilen sind dann nicht möglich (ein L_1-Block gäbe nur zwei Dimensionen, eine Nullspalte einen gemeinsamen Kern). Also ist das gemeinsame Bild Q_2 des L_2-Blocks zweidimensional. Wegen F_3(K*) = 0 und dim K* = 3 ist rk F_3 ≤ 1, nach Lemma 9 also = 1. ∎

In der Sprache von S2-05: Der Punkt γ* entspricht einer Geraden ℓ(u_0) = span(u_0, u*) in ℙ³. k(γ) ist auf jeder Ebene durch ℓ(u_0) konstant.

### 5.2 Satz E: Unterfall A ist unmöglich

**Satz E.** Im Fall (5,8) ohne Symmetrie tritt Unterfall A nicht auf.

*Beweis.* (A2) Für x ∈ K* und jedes u liegt Ψ(u, x) in J + K·q̂ (q̂ ein Urbild von q in ker W), denn F_γ(x) ∈ K·q, und Ψ(u_0, x) ∈ J. Also V_5 := Ψ(K⁴, K*) ⊆ J + K·q̂, ein Raum der Dimension 5. Nach Lemma 8 (yang_n4.md, S = K*) ist dim V_5 ≥ 2 + 3 = 5. Also **V_5 = J + K·q̂ ⊇ J**.

(A3) Die Einschränkung Ψ : K⁴ × K* → V_5 ist nichtsingulär (Folgerung 7). Das Bündel x ↦ Ψ(·, x), x ∈ K* ≅ K², besteht aus 5×4-Matrizen, die für jedes x ≠ 0 injektiv sind. Nach Kronecker besteht es aus einem einzigen Block L₄ᵀ: Ein L_ε-Block hätte überall einen Kern, ein regulärer Block würde irgendwo singulär, und die Zeilenbilanz 5 = Σ(η_i + 1) bei Σ η_i = 4 erzwingt genau einen Block. L₄ᵀ ist die Multiplikation einer binären Form vom Grad 3 mit einer Linearform. Es gibt also Isomorphismen φ : K⁴ → S³ (u ↦ f_u), ι : K* → S¹ und Λ : S⁴ → V_5 mit

  Ψ(u, x) = Λ(f_u · ι(x)) für u ∈ K⁴, x ∈ K*.

(S^d sind die binären Formen vom Grad d.)

(A4) Sei λ_t := (t-te Koordinate) ∘ Λ ∈ (S⁴)*. Dann ist (f, l) ↦ λ_t(f·l) auf S³ × S¹ gleich (u, x) ↦ (a_t·u)(b_t·x), hat also Rang ≤ 1. Ihre Matrix ist die Hankel-Matrix (h_{i+j}) vom Format 4×2 mit h_k = λ_t(s^{4−k}t^k). Rang ≤ 1 heißt: λ_t = 0 oder λ_t = c_t · ev_{σ_t} (Auswertung in einem Punkt σ_t ∈ ℙ¹, auch dem Punkt im Unendlichen).

(A5) λ_t ≠ 0 für alle t: Wegen J ⊆ V_5 hat jeder Vektor Ψ(u_0, y) die Form Λ(h) mit einer Form h vom Grad 4. Wäre λ_t = 0, dann (a_t·u_0)(b_t·y) = 0 für alle y, mit a_t·u_0 ≠ 0 (N1) also b_t = 0. Widerspruch.

(A6) Also (a_t·u)(b_t·x) = c_t f_u(σ_t) ι(x)(σ_t), und damit **a_t ∝ α(σ_t)** mit α(σ) := (u ↦ f_u(σ)): Alle a_t liegen auf einer verdrehten Kubik (Grad 3 in σ).

(A7) Für y ∈ U sei h_y ∈ S⁴ mit Ψ(u_0, y) = Λ(h_y) (A5). Koordinate t: (a_t·u_0)(b_t·y) = c_t h_y(σ_t). Also **b_t ∝ β(σ_t)** mit β(σ) := (y ↦ h_y(σ)), Grad 4 in σ.

(A8) Damit ist a_t ⊗ b_t ein Vielfaches von v(σ_t) := α(σ_t) ⊗ β(σ_t). Jede Koordinate von v(σ) ist eine binäre Form vom Grad 7. Also liegt v(σ) für alle σ in einem Raum der Dimension ≤ dim S⁷ = 8:

  dim span{a_t ⊗ b_t} ≤ 8.

Im Fall (5,8) ist aber dim span{a_t ⊗ b_t} = dim Ĵ = rk L + 4 = 9. Widerspruch. ∎

Bemerkung: Ohne die Inklusion J ⊆ V_5 aus (A2) ginge (A5) und (A7) nicht. Sie ist der Punkt, an dem Unterfall B sich anders verhält.

### 5.3 Was in Unterfall B bleibt (behauptet)

Sei Unterfall B. Dann ist rk F_{u*} = 1 für u* zu γ*, also hat D := span(u_0, u*) die Eigenschaft **dim Ψ(D, U) = 5**: ein enges Paar auf der Seite von u.

- (B1) Wie in (A3), mit vertauschten Rollen: Ψ : D × U → Ψ(D, U) ist nichtsingulär und eng (2 + 4 − 1 = 5), nach Kronecker also Ψ(u, y) = Λ_D(ι_D(u) · g_D(y)) mit Isomorphismen ι_D : D → S¹, g_D : U → S³, Λ_D : S⁴ → Ψ(D, U).
- (B2) Wie in (A4) und (A5): Die Koordinaten λ′_t sind c′_t ev_{σ_t} mit c′_t ≠ 0 (sonst wäre a_t ⊥ D ∋ u_0, gegen N1). Also **liegen alle b_t auf der verdrehten Kubik σ ↦ (y ↦ g_D(y)(σ))**, und a_t eingeschränkt auf D ist zu ev_{σ_t} ∘ ι_D proportional.
- (B3) Die transponierte Zerlegung (A, B, C) ↦ (Bᵀ, Aᵀ, Cᵀ) ist wieder eine Zerlegung der Länge 25, mit demselben dim Ĵ = 9 und ebenfalls nicht symmetrisch (die Bedingung M b_t ∥ a_t ist symmetrisch in a und b). Satz A, B, Lemma P und Satz E gelten für sie genauso. Also liegt auch sie in Unterfall B, und **auch alle a_t liegen auf einer verdrehten Kubik**. Auf der Seite von w gibt es ebenfalls enge Paare E ⊂ U, dim Ψ(K⁴, E) = 5.

Die Gradzählung aus (A8) gibt hier nichts. Ein Anhaltspunkt dafür: Wäre Ψ auf K⁴ × K* (dim K* = 3, eng: 4 + 3 − 1 = 6) die Multiplikation S³ × S² → S⁵, dann lägen a_t auf einer Kurve vom Grad 3 und b_t auf einer Kurve vom Grad 5, also a_t ⊗ b_t in einem Raum der Dimension ≤ 9. Das ist genau dim Ĵ. (Ob jede enge nichtsinguläre Abbildung K⁴ × K³ → K⁶ diese Multiplikation ist, habe ich nicht geklärt.)

### 5.4 Woran Unterfall B hängt (vermutet)

Folgende Aussage würde Unterfall B schließen. Ich halte sie für den nächsten Schritt, gezeigt habe ich sie nicht:

**Vermutung B.** In Unterfall B (für Zerlegung und Transponierte) ist die Korrespondenz zwischen dem Parameter τ_t von a_t auf seiner Kubik und dem Parameter σ_t von b_t auf seiner Kubik ein Isomorphismus ℙ¹ → ℙ¹. Dann ist b_t ∝ G a_t mit einem festen G, also symmetrisch, und Satz C gibt den Widerspruch.

Begründung der Vermutung, mit der genauen Lücke: Nach (B2) ist für jedes enge Paar D der Parameter σ_t das Bild von a_t unter der Projektion π_D von der Geraden D^⊥ aus, eingeschränkt auf die Kubik der a_t also eine Abbildung vom Grad d_D ≤ 3. Nach (B3) gilt dasselbe in der Gegenrichtung mit einem Grad e ≤ 3. Die Paare (τ_t, σ_t) liegen also auf zwei irreduziblen Kurven vom Bigrad (d_D, 1) und (1, e) in ℙ¹ × ℙ¹. Diese schneiden sich in höchstens d_D·e + 1 Punkten, außer sie fallen zusammen, und dann ist d_D = e = 1. Verschiedene Paare (τ_t, σ_t) gibt es mindestens 9 (sonst wäre dim span{a_t ⊗ b_t} < 9). Das schließt alle Fälle mit d_D·e ≤ 7 aus. **Offen ist der Fall d_D = e = 3** (die Geraden D^⊥ und E^⊥ treffen die Kubiken nicht). Dazu kommt: Die Kubiken und ihre Parameter müssen für verschiedene enge Paare D dieselben sein. Das ist klar, wenn mindestens 6 verschiedene b-Punkte und 6 verschiedene a-Punkte vorkommen, sonst nicht. Ein möglicher Weg: Variiert man u_0, so variiert das enge Paar D(u_0) ∋ u_0, während die a_t und b_t fest bleiben. Für d_D = 3 bestimmt die Abbildung π_D auf der Kubik die Gerade D^⊥ eindeutig (drei Punkte einer verdrehten Kubik spannen eine Ebene auf). Damit wäre D konstant, im Widerspruch zu u_0 ∈ D(u_0). Diesen Schluss habe ich nicht sauber zu Ende geführt, weil er voraussetzt, dass die Korrespondenz τ_t ↦ σ_t schon durch die Daten festgelegt ist (zwei verschiedene Graphen vom Bigrad (3,1) schneiden sich in höchstens 6 Punkten, 7 gemeinsame Paare genügen also; 9 sind da). Das ist der erste Punkt für Runde 5.

### 5.5 Gegenprobe: F-Daten allein reichen für (5,8) nicht (behauptet, exakt gerechnet)

Abstrakte Tripel F_1, F_2, F_3 : K⁴ → K⁵ (ohne die Struktur Ψ) mit der Büschelstruktur aus Lemma P erreichen (ρ, rk L, rk H, s, dim N) = (3, 5, 8, 1, 0):
- Unterfall A, allgemein: rk H = 9 (200 von 200 Zufallstripeln, `buesche_test.py`).
- Unterfall A mit einem Kernelement von H′ vom Typ (i) (Abschnitt 8.2): (3, 5, 8, 1, 0) in 300 von 300 (`buesche_fall_i.py`).
- Unterfall B mit L_2-Block: (3, 5, 8, 1, 0) in 300 von 300 (`buesche_k3.py`).
- Gegenprobe zu Abschnitt 8.2: Unterfall A mit einem Kernelement von H′ vom Typ (ii) gibt rk L = 4 in 200 von 200 (`buesche_modell.py`), wie dort gezeigt.

Lemma P und Satz E brauchen also wirklich die Bilinearform Ψ und ihre Nichtsingularität, nicht nur die Abbildungen F_i. Das ist als gescheiterter Ansatz in `versuche/V-S2-16-f-daten-58.md` abgelegt.

---

## 6. Richtung zwei: ein Verfahren mit 25 Produkten?

- **(3,6):** Nach Folgerung C1 gibt es dort kein Verfahren. Eine Suche entfällt.
- **(5,8):** Ein Verfahren der Länge 25 müsste nach Abschnitt 5 so aussehen (alles für generisches p):
  - nicht symmetrisch, N(u_0) = 0 für alle zulässigen u_0, s = 1;
  - Unterfall B für die Zerlegung und ihre Transponierte: Die Punkte a_t(p) liegen auf einer verdrehten Kubik, die Punkte b_t(p) ebenso, und es gibt enge Paare D (dim Ψ(D, U) = 5) auf der Seite von u und E (dim Ψ(K⁴, E) = 5) auf der Seite von w;
  - nach Abschnitt 5.4 (vermutet) mit Projektionsgrad 3 zwischen den beiden Kubiken.

  Das ist ein endlich parametrisierter Ansatz für die F-Daten an einer Stelle p (25 Parameter σ_t, zwei Kubiken, ein Grad-3-Zusammenhang). Er sagt aber nichts darüber, wie die Daten von p abhängen. Eine Suche danach habe ich in dieser Runde nicht gerechnet, weil die Vermutung B ihn vielleicht ganz ausschließt. Erst B prüfen, dann suchen.
- **Die bisherigen Modelle** (M1, M3, K(0,1,2,5), alle mit a_t = b_t) sind symmetrisch an ihrer Stelle p. Sie liegen in keinem der beiden Unterfälle von Abschnitt 5 (dort ist die Zerlegung nicht symmetrisch). Folgerung C3 sagt, welche Fortsetzungen ausgeschlossen sind.
- Ein Verfahren mit 25 Produkten habe ich nicht gefunden und nicht gesucht.

---

## 7. Daten: die symmetrischen Verfahren der Länge 26 (Charakteristik 2)

An den 14 Verfahren aus `versuche/s2-spurA-r2/daten/rho3_rang26_f2.txt` (`gp_abh.py`, `struktur.py`, exakt in GF(2³¹)):

| Größe | Wert in allen 14 Verfahren |
|---|---|
| Lösungsraum von G a_t(p) ∥ b_t(p) für ein festes p | Dimension 1 |
| dim span{G_p} über 8 zufällige p | 1, also **G_p hängt nicht von p ab** |
| Anzahl der A_t vom Rang 1, der B_t vom Rang 1 | je 19 von 26 |
| Terme, die die Involution (A, B, C) ↦ (G⁻¹BᵀJ, JAᵀGᵀ, Cᵀ) in einen Term des Verfahrens überführt | 25 von 26 |
| davon feste Terme | 7, genau die 7 Terme mit A_t vom Rang 2 (nachgezählt) |
| dim span{a_t ⊗ a_t} | 10 (wie Satz C verlangt) |

Bemerkungen:
- Bei konstantem G und G = I nach Basiswechsel hat jeder Term eine von zwei Formen: (A, c·J⁻ᵀAᵀ) mit A vom Rang 2, oder (x yᵀ, z xᵀ) mit A vom Rang 1. Das passt zu 7 + 19.
- Die Involution ist eine Symmetrie des Tensors ⟨4,2,4⟩ mit der schiefen Form J auf dem mittleren Index. Sie ist nicht die Involution σ(u,v,w) = (vᵀ,uᵀ,wᵀ) aus S2-06 und B-011 (dort ohne J). Nach Satz C kommt ein Verfahren, das unter ihr Term für Term symmetrisch ist (konstantes G), über keinem Körper unter 26. Eine SAT-Suche mit dieser Involution ist daher für Länge 25 zwecklos.
- Der 26. Term geht nicht genau in einen Term über. Das habe ich nicht weiter untersucht.

---

## 8. Nebenrechnungen

### 8.1 Ansatz aus dem zurückgezogenen Auftrag: verdrehte Kubik im Fall (3,6)

Der vermutete Ansatz 1 aus dem Auftrag (Hilbert-Burch, Punkte auf einer verdrehten Kubik) wird für den Ausschluss von (3,6) nicht mehr gebraucht. Satz C braucht nur eine einzige Quadrik durch alle a_t(p), und die gibt es bei Länge 25 immer. Der Ansatz bleibt **vermutet**. Er beschreibt die Gestalt, die eine symmetrische Zerlegung hätte, wenn es sie gäbe.

Ansatz 2 aus dem Auftrag (hängt G_p von p ab?): An den Daten hängt G_p nicht von p ab (Abschnitt 7). Für Satz C ist die Frage gleichgültig, weil der Beweis beliebige rationale G_p zulässt.

### 8.2 Zerlegung von rk H in Unterfall A (behauptet)

Für den Leser, der Unterfall A ohne Satz E angreifen will: Mit π_q : Q → Q/Kq gilt rk H = dim(im H ∩ (Kq)³) + rk H′. Dabei ist H′ die schiefe Erweiterung der induzierten Abbildungen F′_i : U/K* → Q/Kq. Der erste Summand ist ≥ 3, der zweite nach Lemma 13 ≥ 5. Also erzwingt rk H = 8 Gleichheit in beiden. ker H′ ist eindimensional. Ein Kernelement vom „Typ (ii)“ (zwei unabhängige Richtungen) ergäbe rk L ≤ 4 und ist ausgeschlossen. Es bleibt Typ (i): Für eine zweidimensionale Schar von γ gilt F_γ(K* + K x̂) ⊆ K q. Satz E macht diese Zählung überflüssig. Sie zeigt aber, dass rk H allein Unterfall A nicht ausschließt (Abschnitt 5.5).

---

## 9. Statusübersicht

| Aussage | Status |
|---|---|
| Identität (Kl) für symmetrische Zerlegungen von ⟨n,2,n⟩ | behauptet (Abschnitt 3.3, exakt gegengeprüft an Strassen über ℚ und 14 Verfahren über 𝔽₂) |
| Satz C: keine symmetrische Zerlegung von ⟨4,2,4⟩ der Länge 25, über jedem Körper | behauptet (B-012) |
| Bemerkung C′: symmetrische Zerlegungen von ⟨n,2,n⟩ haben Länge ≥ (3n² + n)/2 | behauptet |
| Folgerung C1: Fall (3,6) ausgeschlossen, über jedem Körper | behauptet (B-012; stützt sich auf B-008, B-009) |
| Folgerung C2: Im Fall (5,8) ist die Zerlegung nicht symmetrisch, N(u_0) = 0 und s = 1 | behauptet |
| Lemma P (Büschel), Unterfälle A und B | behauptet (B-013) |
| Satz E: Unterfall A unmöglich | behauptet (B-013) |
| Unterfall B für Zerlegung und Transponierte, a_t und b_t auf verdrehten Kubiken | behauptet (Abschnitt 5.3) |
| Vermutung B (Unterfall B erzwingt Symmetrie) | vermutet |
| Fall (5,8) ausgeschlossen | offen |
| R(⟨4,2,4⟩) ≥ 26 | offen |
| F-Daten allein schließen (5,8) mit Büschelstruktur nicht aus | behauptet (exakte Rechnung, Abschnitt 5.5) |
| G_p konstant in den 14 symmetrischen 26er-Verfahren über 𝔽₂ | behauptet (exakte Rechnung) |

---

## 10. Vorschläge für Runde 5 (vermutet)

1. **Prüfer und Fremdmodell für B-012 (Satz C und Folgerung C1).** Der Beweis ist kurz (Abschnitt 3). Schwerpunkte stehen am Ende von Abschnitt 3.5. Bestätigen beide unabhängig, zählt das nach Abbruchregel 2 b) als Fortschritt der Spur A (ein benannter Fall ausgeschlossen), mit Frist für Status geprüft bis Ende Runde 6.
2. **Lean für Satz C.** Die Identität (Kl) ist eine Rechnung mit Polynomen in zwei Veränderlichen und Matrizen. Der Schluss in Abschnitt 3.5 ist lineare Algebra. Am aufwendigsten ist Schritt 0 (rationale Wahl von M_p). Man kann ihn umgehen, wenn Satz B die Symmetrie gleich mit polynomialem G_p liefert. Folgerung C1 braucht zusätzlich B-009 in Lean (läuft in Runde 4 nach Vorrang von Justus).
3. **Unterfall B schließen** (Vermutung B, Abschnitt 5.4): zuerst zeigen, dass die Kubiken und ihre Parametrisierungen nicht vom engen Paar D abhängen, dann den Fall d_D = e = 3 durch Variation von u_0 ausschließen.
4. **Prüfer für B-013 (Lemma P, Satz E).** Schwerpunkte: die Kronecker-Argumente (Abschnitt 5.1 Schritt 4 und 5.2 (A3)), die Hankel-Aussage (A4) und die Inklusion J ⊆ V_5 (A2).

---

## 11. Dateien

In `versuche/s2-16/` (eigener Code, keine fremden Quellen; benutzt `felder.py` und die Ladefunktionen aus `versuche/s2-spurA-r2/`):

- `klee.py`: exakte symbolische Gegenprobe von (Kl) an Strassens Verfahren über ℚ (sympy). Ausgabe `klee_ausgabe.txt`.
- `klee_f2.py`: Gegenprobe von (Kl) an den 14 Verfahren der Länge 26 über 𝔽₂, Ableitung mit dualen Zahlen in GF(2³¹). Ausgabe `klee_f2_ausgabe.txt`.
- `gp_abh.py`: Abhängigkeit von G_p von p, Ränge der A_t, B_t. Ausgabe `gp_abh_ausgabe.txt`.
- `struktur.py`: G über 𝔽₂ normiert, Invarianz unter der Involution mit J. Ausgabe `struktur_ausgabe.txt`.
- `buesche_test.py`, `buesche_modell.py`, `buesche_fall_i.py`, `buesche_k3.py`: abstrakte Tripel mit Büschelstruktur (Abschnitte 5.5 und 8.2). Ausgaben `*_ausgabe.txt`.

Aufrufe (aus `versuche/s2-16/`): `python3 klee.py`, `python3 klee_f2.py`, `python3 gp_abh.py`, `python3 struktur.py`, `python3 buesche_test.py`, `python3 buesche_modell.py`, `python3 buesche_fall_i.py`, `python3 buesche_k3.py`. Benötigt: Python 3 und sympy.

Rechenzeit dieser Runde: unter 5 Minuten auf einem Kern insgesamt. Nichts läuft im Hintergrund weiter.
