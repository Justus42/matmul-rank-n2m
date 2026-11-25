Du bist unabhängiger Prüfer eines mathematischen Prosa-Beweises. Deine Aufgabe: den Beweis widerlegen wollen, nicht bestätigen. Prüfe jeden Schritt einzeln.

Gegenstand: Behauptung B-013 (Datei behauptungen/B-013.md, unten), Artefakt: der Prosa-Beweis in lean/prosa/s2_444_spurA_r4.md, die Teile zum Fall (5,8): Abschnitt 4 (Folgerung C2), Abschnitt 5.1 (Lemma P), 5.2 (Satz E), dazu 5.3 und 5.4. Die Bezeichnungen stammen aus lean/prosa/s2_444_spurA_r2.md und lean/prosa/yang_n4.md. Der in Lean geprüfte Bestand steht in lean/YangBounds/SatzA444.lean (unter anderem corollaryA2 und sDim_table). Alle Dateien folgen unten wörtlich und ungekürzt.

Kontext: Es geht um Zerlegungen (Tensorrang) des Matrixmultiplikationstensors <4,2,4> der Länge 25 über einem beliebigen Körper. Die Behauptungen B-008 (Satz A), B-009 (Satz B) und B-012 (Satz C) gelten hier als Voraussetzungen; du sollst sie nicht prüfen, aber sagen, wo B-013 von ihnen abhängt. Eine Fassung "V′" von Lemma V aus einem anderen Bericht (S2-09) wird zitiert, ihr Text liegt dir nicht vor; beurteile, ob B-013 sie wirklich braucht oder ob Lemma V aus s2_444_spurA_r2.md Abschnitt 5 genügt.

Beantworte in drei Teilen, jeweils mit Urteil "hält", "hält mit benannter Reparatur" oder "Lücke" (mit genauer Stelle):
1. Erzwingt der Fall (5,8) wirklich s = 1 und Nicht-Symmetrie (Folgerung C2)? Welche Rolle spielt Satz C (B-012)? Ist Satz E von Satz C unabhängig?
2. Ist die Fallunterscheidung in Lemma P in die Unterfälle A (dim K* = 2) und B (dim K* = 3) vollständig? Prüfe besonders Schritt (2) (Büschel von Geraden, Gradargument über die duale Kurve, auch in Charakteristik p) und Schritt (4) (Kronecker-Normalform).
3. Hält der Ausschluss von Unterfall A (Satz E, Schritte A2 bis A8)? Prüfe besonders A2 (Lemma 8, Inklusion J ⊆ V_5), A3 (enge nichtsinguläre Abbildung K^4 × K^2 → K^5 ist nach Kronecker ein L_4^T-Block), A4 (Hankel-Matrix vom Rang ≤ 1 ⇔ Auswertung in einem Punkt), A5, A7 und die Gradzählung A8.
Achte auf Körperannahmen (Charakteristik 2 und 3, kleine endliche Körper, Übergang zum algebraischen Abschluss), auf Genericity-Annahmen bei der Wahl von p und u_0, auf entartete Lagen, und darauf, ob die benutzten Lean-Aussagen (corollaryA2, sDim_table) wirklich das sagen, was der Prosa-Beweis benutzt.
4. Ist die offene Lücke für Unterfall B in Abschnitt 5.4 (Vermutung B) korrekt und vollständig beschrieben? Stimmen die Schnittzahl der Kurven vom Bigrad (d,1) und (1,e), der Schluss auf d = e = 3 und die Bemerkung zur Abhängigkeit der Kubiken vom engen Paar D?
5. Was bräuchte eine Lean-Fassung von Lemma P und Satz E (fehlende mathlib-Bausteine, mögliche elementare Umgehungen)?

Gib am Ende ein Gesamturteil in einem Satz. Antworte auf Deutsch.

========== Datei behauptungen/B-013.md ==========
# B-013: Struktur des Restfalls (5,8) für ⟨4,2,4⟩ bei Länge 25; Unterfall A ist unmöglich (Lemma P, Satz E)

- Aussage: Sei eine Zerlegung von ⟨4,2,4⟩ der Länge 25 über einem Körper im Fall (rk L, rk H) = (5,8) und nicht symmetrisch (im Sinn von B-012). Dann gilt für p aus einer nichtleeren offenen Menge und jedes zulässige generische u_0 in Yangs Normalform über K̄: N(u_0) = 0 und s = 1 (Folgerung C2). Lemma P: Es gibt γ* ≠ 0 mit F_{γ*} k(γ) = 0 für alle generischen γ (k(γ) erzeugt ker F_γ). Der Raum K* = span{k(γ)} hat Dimension 2 (Unterfall A: F_γ(K*) ⊆ K·q für alle γ) oder 3 (Unterfall B: rk F_{γ*} = 1, F_γ(K*) in einem festen zweidimensionalen Raum). Satz E: Unterfall A tritt nicht auf. Folgerung: Die Zerlegung und ihre Transponierte liegen beide in Unterfall B, und alle a_t(p) sowie alle b_t(p) liegen auf verdrehten Kubiken.
- Status: **behauptet**
- Herkunft: S2-16 (Stufe 2, Runde 4, Spur A), `lean/prosa/s2_444_spurA_r4.md` Abschnitt 5.
- Artefakt: Prosa-Beweis `lean/prosa/s2_444_spurA_r4.md` Abschnitte 5.1 (Lemma P), 5.2 (Satz E), 5.3 (Unterfall B). Rechnungen zu abstrakten Tripeln: `versuche/s2-16/buesche_*.py`. Kein Lean-Satz.
- Prüfung: keine. Vorgeschlagen: Prüfer, Schwerpunkte Kronecker-Argumente (5.1 Schritt 4, 5.2 (A3)), Hankel-Aussage (A4), Inklusion J ⊆ V_5 (A2).
- Aussagen-Abgleich: entfällt, solange es keinen Lean-Satz gibt.
- Bemerkungen: Hängt an B-008, B-009 (Lemma 13′, V′ aus S2-09) und B-012. Der Fall (5,8) ist damit nicht ausgeschlossen: Unterfall B bleibt offen (Vermutung B im Bericht, Abschnitt 5.4, Status vermutet). Abstrakte Tripel F_i ohne die Struktur Ψ erreichen die Zahlen von (5,8) mit s = 1 in beiden Unterfällen; Lemma P und Satz E brauchen also die Nichtsingularität von Ψ. Den Status setzt der Orchestrator.

========== Datei lean/prosa/s2_444_spurA_r4.md ==========
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

========== Datei lean/prosa/s2_444_spurA_r2.md ==========
# S2-05: Yangs Restfälle für ⟨4,2,4⟩ bei Rang 25, Bericht der Spur A, Runde 2

- Auftrag: S2-05 (Stufe 2, Runde 2), Rolle Beweissucher, Spur A
- Datum: 25.11.2026
- Status aller Aussagen dieses Berichts: **behauptet** (Beweise und Rechnungen eines Agenten, von niemandem geprüft), wo ausdrücklich gesagt: **vermutet**. Nichts hier ist geprüft im Sinn von Abschnitt 5 des Protokolls.
- Grundlage: `lean/prosa/yang_n4.md` (S1-03, Bezeichnungen und Lemmata) und `lean/prosa/s2_444_spurA_r1.md` Abschnitt 7 (S2-02). Kein Fremdmodell benutzt.
- Code und Ausgaben: `versuche/s2-spurA-r2/` (eigener Code, Python, exakte Arithmetik in endlichen Körpern, keine Gleitkommazahlen)

---

## 1. Ergebnis in Kürze

1. **Die vier Restfälle stimmen.** Die Herleitung aus S2-02 ist richtig. Sie steht in Abschnitt 3 lückenlos ausgeschrieben (Satz A): Hat ⟨4,2,4⟩ eine Zerlegung der Länge 25, dann gilt in Yangs Normalform ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}. In drei der vier Fälle ist Yangs Ungleichung (1) eine Gleichung.
2. **Zwei Fälle sind ausgeschlossen, über jedem Körper:** (4,7) und (5,7) (Satz B, Abschnitt 7). Der Beweis braucht drei neue Bausteine:
   - **Lemma 13′** (Abschnitt 4): eine Verschärfung von Yangs Lemma 13 um den Term s, der misst, wie die anderen F_i den Kern von F_1 abbilden.
   - **Lemma V** (Abschnitt 5): Haben die F_i bei ρ = 3 einen gemeinsamen Kern, dann ist die Zerlegung in Yangs Daten „symmetrisch“: Es gibt eine invertierbare Matrix G mit a_t ∥ Gᵀb_t für alle Terme.
   - **Lemma S** (Abschnitt 6): Im symmetrischen Fall rechnet man rk H mit Polynomen aus. Für rk L = 4 und rk L = 5 ist dann rk H = 8.
3. **Offen bleiben (3,6) und (5,8).** Über beide ist jetzt mehr bekannt (Abschnitt 8): Im Fall (3,6) ist die Zerlegung zwingend symmetrisch, im Fall (5,8) ist Q = Bild von L und s ≤ 1. Ich habe beide Fälle nicht ausgeschlossen.
4. **Gegenbeispiel zu einem Ansatz:** Für (3,6) und (5,8) gibt es Modelle der „F-Daten“ (Vektoren a_t, b_t, wie sie in Yangs Beweis vorkommen), die alle Lemmata von Yang und alle neuen Lemmata dieses Berichts erfüllen (Abschnitt 8.3). Wer diese Fälle ausschließen will, muss also mehr von der Zerlegung benutzen als die Abbildungen F_i, etwa die Abbildung g oder die Matrizen C_t.
5. **Gegenproben an echten Verfahren mit 26 Termen** (Abschnitt 9): Alle Ungleichungen, auch Lemma 13′, gelten an 25 Verfahren über 𝔽₂ und einem über ℤ. Bei ρ = 3 ist Lemma 13′ dort scharf, und alle 16 gefundenen Verfahren mit ρ = 3 sind symmetrisch im Sinn von Lemma V. Unter 2500 zufälligen 26er-Verfahren über 𝔽₂ gab es kein Verfahren mit ρ = 3, das nicht symmetrisch ist.
6. **Lemma M aus S2-01** (Abschnitt 10): Lemma M ist logisch gleichwertig mit dem Ziel R_F ≥ 26 und daher für sich keine Vereinfachung. Die fünf Ausnahmen mit S_mid = 9 habe ich nachgezählt (stimmt). Sie zeigen: Ein Beweis von Lemma M muss die Länge 25 wesentlich benutzen, denn bei Länge 26 ist S_mid = 9 möglich. Widerlegt ist Lemma M dadurch nicht. Einen Zusammenhang zwischen S_mid und Yangs Größen habe ich in den Daten nicht gefunden.
7. **Grenzrang** (Hinweis des Orchestrators aus S2-07): Alle Argumente hier benutzen exakte Gleichungen der Zerlegung (Nichtsingularität, Eigenvektoren über algebraisch abgeschlossenem Körper, exakte Ränge). Sie sind keine Grenzrang-Argumente. Das muss so sein, denn der Grenzrang liegt bei höchstens 24 (laut Literatur).

---

## 2. Rahmen und Bezeichnungen

Alles wie in `lean/prosa/yang_n4.md`, mit n = m = 4 und r = 25. Kurz:

- K algebraisch abgeschlossen (Lemma R1 dort: Eine Zerlegung über einem Körper ist eine über seinem algebraischen Abschluss). Kein α_t ist 0, Normalform (N1), (N2) nach Lemma 6.
- Zerlegung: A·B = Σ_t α_t(A) β_t(B) C_t. D(A) = diag(α_t(A)), ℬ(B) = (β_t(B))_t, W(s) = Σ s_t C_t.
- U = {x ∈ K^{2×4} : Zeile 0 von x ist 0}, dim U = 4. f_i(x) = D(e_{i,0})ℬ(x). J = f_0(U). Q = ker W / J, dim Q = r − 20 = 5.
- F_i : U → Q, F_i(x) = f_i(x) + J (i = 1, 2, 3). L(u_1,u_2,u_3) = Σ F_i(u_i). H die schiefe Erweiterung von L auf U^{∧3}. ρ = max_γ rk(Σ γ_i F_i).
- g wie in yang_n4.md Abschnitt 4, Φ wie in Abschnitt 5.

Zusätzlich benutze ich eine Schreibweise, die nicht von der Wahl der Basis u_0, …, u_3 abhängt. Lemma 6 wählt einen Zeilenvektor p ∈ K^{1×2} und eine Basis u_0, u_1, u_2, u_3 von K⁴ so, dass nach dem Basiswechsel R3 gilt: α′_t(e_{i,0}) = α_t(u_i·p). Für u ∈ K⁴ und x ∈ U (in den neuen Koordinaten) sei

  **Ψ(u, x) := D′(u′)·ℬ′(x) ∈ K^r**, wobei u′ = Σ_i γ_i e_{i,0} mit u = Σ_i γ_i u_i,

also Ψ(u_i, x) = f_i(x). In den alten Koordinaten ist Ψ(u, x)_t = α_t(u·p)·β_t(v·w), wobei v ∈ K² mit p·v = 0 und w die Zeile 1 von x ist. Ψ ist bilinear und hängt nur von p ab, nicht von u_0. Dann gilt:

- J = Ψ(u_0, U), f_i = Ψ(u_i, ·), F_i(x) = Ψ(u_i, x) + J.
- **(Ψ1) Ψ ist nichtsingulär:** Ψ(u, x) ≠ 0 für u ≠ 0, x ≠ 0. Das ist Folgerung 7 (aus N2), angewandt auf x ∈ U.
- Setzt man a_t := (α_t(u_i·p))_{i} ∈ K⁴ (Koordinaten bezüglich u_0, …, u_3) und b_t ∈ K⁴ so, dass β′_t(x) = b_t·w für x ∈ U mit Zeile 1 gleich w, dann ist **Ψ(u, x)_t = (a_t·u)(b_t·w)** (u in Koordinaten).
- Ĵ := Ψ(K⁴, U) (Spann aller Werte) = J + f_1(U) + f_2(U) + f_3(U). Es ist Ĵ ⊆ ker W (Lemma 4.1(i)) und **rk L = dim Ĵ − 4**, denn im L = (Σ_{i≥1} f_i(U) + J)/J = Ĵ/J.

**Wahl von p und u_0.** Lemma 6 Schritt 4 liefert: Die zulässigen Paare (u_0, p) bilden eine nichtleere Zariski-offene Menge. Ich halte ein p fest, für das (N2) gilt und für das α_t(·⊗p) für kein t identisch verschwindet. Dann ist u_0 zulässig genau dann, wenn Π_t α_t(u_0·p) ≠ 0. Die zulässigen u_0 bilden eine offene dichte Menge O_p ⊆ K⁴, und u_1, u_2, u_3 ergänzen u_0 beliebig zu einer Basis. Yangs Beweis und alle folgenden Aussagen gelten für **jedes** u_0 ∈ O_p. Größen, die von u_0 abhängen (ρ, rk H, N), schreibe ich bei Bedarf als ρ(u_0), rk H(u_0), N(u_0).

Bemerkung zur Basisunabhängigkeit: ρ und rk H hängen nur von u_0 ab, nicht von der Ergänzung u_1, u_2, u_3. Ein Wechsel der Ergänzung ersetzt (F_1, F_2, F_3) durch Σ_j ξ_{ij} F_j mit ξ ∈ GL_3 (Vielfache von u_0 ändern F_i nicht, weil Ψ(u_0, x) ∈ J). Nach Lemma 13 Schritt 1 in yang_n4.md bleiben rk L, ρ und rk H dabei gleich.

---

## 3. Satz A: Die vier Restfälle

**Satz A.** Hat ⟨4,2,4⟩ über einem Körper eine Zerlegung der Länge 25, so gilt in der Normalform (über dem algebraischen Abschluss, für jedes zulässige u_0):

  ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}.

Außerdem ist rk Φ = 12 + rk H, und Ungleichung (1) aus yang_n4.md ist in den Fällen (3,6), (4,7), (5,8) eine Gleichung, im Fall (5,7) hat sie den Spielraum 1.

*Beweis.* Nach R1, R2, Lemma 6 sei K algebraisch abgeschlossen, kein α_t = 0, (N1) und (N2) gelten. Mit R2 wird die Länge nicht größer. Ist sie dabei kleiner als 25 geworden, widerspricht das Yangs Satz 2 (R ≥ 25, B-007, geprüft). Also ist r = 25 und kein α_t ist 0. Alle Ungleichungen in ℤ:

1. dim Q = r − (n+1)m = 25 − 20 = **5** (Lemma 4.1(iii)). Da im L ⊆ Q: **rk L ≤ 5**.
2. Gleichung (2): (n−1)(r − (n+2)m) = 3·(25 − 24) = 3 ≥ rk H − rk L, also **rk H ≤ rk L + 3**.
3. Lemma 13 (d = n − 1 = 3): **2 rk H ≥ 3ρ + rk L**.
4. Lemma 14 (braucht m ≥ n − 1, hier 4 ≥ 3): **ρ ≥ 3**.
5. Aus 2 und 3: 2 rk L + 6 ≥ 2 rk H ≥ 3ρ + rk L, also rk L ≥ 3ρ − 6. Mit 1: 3ρ − 6 ≤ 5, also ρ ≤ 11/3, ρ ≤ 3. Mit 4: **ρ = 3**.
6. Lemma 8′: rk L ≥ n − 1 = 3. Mit 1: **rk L ∈ {3, 4, 5}**.
7. Für jedes rk L: rk H liegt zwischen ⌈(9 + rk L)/2⌉ (aus 3) und rk L + 3 (aus 2). Lemma 11 (rk H ≥ rk L) gibt nichts Neues.
   - rk L = 3: 6 ≤ rk H ≤ 6, also rk H = 6.
   - rk L = 4: ⌈6,5⌉ = 7 ≤ rk H ≤ 7, also rk H = 7.
   - rk L = 5: 7 ≤ rk H ≤ 8, also rk H ∈ {7, 8}.
8. Die übrigen Lemmata schließen nichts aus: Lemma 15(a) gibt rk L ≤ 3ρ = 9, Lemma 15(b) setzt rk L = 3ρ = 9 voraus und greift nie. Damit greift auch Lemma 9 nicht. Die Obergrenzen dim U^{∧3} = 12 und dim Q³ = 15 für rk H liegen über allen Werten.

Zu Φ: Lemma 10 gibt ker Φ = {0} × ker H, also rk Φ = dim(U³ × U^{∧3}) − dim ker H = 12 + 12 − (12 − rk H) = 12 + rk H. Φ bildet in im L × Q³ ab (Dimension rk L + 15). Spielraum: rk L + 15 − 12 − rk H = rk L + 3 − rk H, also 0 bei (3,6), (4,7), (5,8) und 1 bei (5,7). ∎

**Folgerung A1 (Starrheit, behauptet).** In den Fällen (3,6), (4,7), (5,8) ist Φ surjektiv auf im L × Q³. Insbesondere ist die Abbildung ker L → Q³ / im H, u ↦ (−g(u_i) + J)_i mod im H, ein Isomorphismus. (Beweis: Surjektivität aus der Dimensionsgleichheit. Für jedes q ∈ Q³ gibt es (u, c) mit L(u) = 0 und (−g(u_i) + H(c)_i)_i = q. Injektivität aus Lemma 10. Die Dimensionen sind 12 − rk L = 15 − rk H.) In den folgenden Beweisen brauche ich das nicht, es ist ein möglicher Hebel für die offenen Fälle.

**Folgerung A2.** Ist rk L = 5, dann ist Ĵ = ker W (beide haben Dimension 9, Ĵ ⊆ ker W). Insbesondere liegen dann auch alle Vektoren g(x), x ∈ K^{2×4}, in Ĵ.

---

## 4. Lemma 13′: Verschärfung von Lemma 13

**Lemma 13′ (abstrakt, d = 3).** Seien U, Q endlichdimensional, F_1, F_2, F_3 : U → Q linear, L, H, ρ wie in Lemma 13. Nach dem Basiswechsel aus Lemma 13 Schritt 1 sei rk F_1 = ρ. Setze

  s := dim( F_2(ker F_1) + F_3(ker F_1) ).

Dann gilt

  **rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉.**

*Beweis.* Genau wie Lemma 13 in yang_n4.md (Schritte 2 bis 4), nur wird dim H(Γ) genauer gezählt. Γ ⊆ U^{∧3} sind die c mit c_{23} = c_{32} = 0. Frei sind c_{12} und c_{13} in U, also dim Γ = 2 dim U. Für c ∈ Γ:

  H(c) = ( F_2 c_{12} + F_3 c_{13}, −F_1 c_{12}, −F_1 c_{13} ).

(Komponente i ist L(c_{i,:}): L(0, c_{12}, c_{13}), L(c_{21}, 0, 0) = −F_1 c_{12}, L(c_{31}, 0, 0) = −F_1 c_{13}.)

Kern von H auf Γ: F_1 c_{12} = 0, F_1 c_{13} = 0 und F_2 c_{12} + F_3 c_{13} = 0. Das ist der Kern der Abbildung Ξ : (ker F_1)² → Q, (x, y) ↦ F_2 x + F_3 y, und rk Ξ = s. Also dim(ker H ∩ Γ) = 2 dim ker F_1 − s = 2(dim U − ρ) − s, und

  dim H(Γ) = 2 dim U − 2(dim U − ρ) + s = 2ρ + s.

Wie in Lemma 13 ist H(Γ) ⊆ im H ∩ ker π (die Komponenten 2 und 3 liegen in im F_1), π(im H) = im H̄ und 2 rk H̄ ≥ rk L̄ = rk L − ρ (Lemma 11 mit d − 1 = 2). Also

  rk H ≥ dim(im H ∩ ker π) + dim π(im H) ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉,

wobei die Rundung erlaubt ist, weil rk H̄ eine ganze Zahl ist. ∎

Bemerkungen:
- Lemma 13 (d = 3) folgt mit s ≥ 0: 2 rk H ≥ 4ρ + rk L − ρ = 3ρ + rk L.
- Für m = 4, ρ = 3 ist ker F_1 eindimensional, ker F_1 = span(k), und s = dim span(F_2 k, F_3 k) ∈ {0, 1, 2}.
- **s = 0 heißt: k liegt im gemeinsamen Kern N := ker F_1 ∩ ker F_2 ∩ ker F_3.** (F_1, F_2, F_3 spannen nach dem Basiswechsel denselben Raum auf wie vorher, N ändert sich nicht.)
- Gegenprobe: an 300 zufälligen abstrakten Tripeln (F_1, F_2, F_3) aus vier Familien (`test_l13v.py`) und an allen 26er-Verfahren aus Abschnitt 9 nie verletzt.

**Anwendung bei r = 25 (ρ = 3, m = 4):** rk H ≥ 6 + s + ⌈(rk L − 3)/2⌉, also

| Fall | Schranke aus 13′ | Folgerung |
|---|---|---|
| (3,6) | rk H ≥ 6 + s | s = 0, also N ≠ 0 |
| (4,7) | rk H ≥ 7 + s | s = 0, also N ≠ 0 |
| (5,7) | rk H ≥ 7 + s | s = 0, also N ≠ 0 |
| (5,8) | rk H ≥ 7 + s | s ≤ 1 |

---

## 5. Lemma V: Gemeinsamer Kern erzwingt Symmetrie

Für u_0 ∈ O_p sei N(u_0) := {x ∈ U : Ψ(u, x) ∈ Ψ(u_0, U) für alle u ∈ K⁴}. Das ist genau der gemeinsame Kern der F_i, die zu u_0 gehören (für u = u_0 ist die Bedingung leer, für u = u_1, u_2, u_3 heißt sie F_i(x) = 0, dazwischen linear).

**Lemma V.** Sei K algebraisch abgeschlossen, Ψ : K⁴ × U → K^r bilinear und nichtsingulär (Ψ1), dim U = 4. Es gelte:

- (a) Für Paare (u, u′) aus einer offenen dichten Teilmenge von K⁴ × K⁴ ist dim(Ψ(u, U) + Ψ(u′, U)) = 7.
- (b) Für u′ aus einer offenen dichten Teilmenge O ⊆ K⁴ ist N(u′) ≠ 0.

Dann gibt es eine invertierbare lineare Abbildung G : K⁴ → U mit

  **Ψ(u, G u′) = Ψ(u′, G u) für alle u, u′ ∈ K⁴.**

*Beweis.* Für u, u′ ∈ K⁴ sei I(u, u′) := {(x, x′) ∈ U² : Ψ(u, x) = Ψ(u′, x′)}. Die Abbildung U² → K^r, (x, x′) ↦ Ψ(u, x) − Ψ(u′, x′), hat das Bild Ψ(u, U) + Ψ(u′, U). Unter (a) ist also dim I(u, u′) = 8 − 7 = 1.

*Schritt 1 (eine lineare Abbildung zu festem u′).* Sei u′ ∈ O und v′ ∈ N(u′), v′ ≠ 0. Für jedes u ist Ψ(u, v′) ∈ Ψ(u′, U). Da Ψ(u′, ·) injektiv ist (Ψ1, u′ ≠ 0), gibt es genau ein φ(u) ∈ U mit Ψ(u, v′) = Ψ(u′, φ(u)), und φ ist linear (beide Seiten linear in u, Ψ(u′, ·) injektiv). φ ist injektiv: Aus φ(u) = 0 folgt Ψ(u, v′) = 0, mit v′ ≠ 0 also u = 0. Also ist φ invertierbar (dim K⁴ = dim U = 4). Mit u = u′ folgt φ(u′) = v′.

*Schritt 2 (v(u) ist zu φ(u) proportional).* Sei u ∈ O so, dass (u, u′) zur offenen Menge aus (a) gehört, und v(u) ∈ N(u), v(u) ≠ 0. Dann liegen zwei Elemente in I(u, u′):
- (v′, φ(u)), denn Ψ(u, v′) = Ψ(u′, φ(u));
- (y, v(u)) für ein y ∈ U, denn Ψ(u′, v(u)) ∈ Ψ(u, U).
Beide sind ≠ 0. Da I(u, u′) eindimensional ist, sind sie proportional, insbesondere ist v(u) ein Vielfaches ≠ 0 von φ(u). Das gilt für alle u aus einer offenen dichten Menge.

*Schritt 3 (unabhängig von u′).* Sei u″ ∈ O ein zweiter Punkt, φ″ die Abbildung aus Schritt 1 zu u″. Nach Schritt 2 ist v(u) für u aus einer offenen dichten Menge zugleich Vielfaches von φ(u) und von φ″(u). Also ist jeder Vektor einer offenen dichten Menge ein Eigenvektor von M := φ^{−1}φ″. Die Vektoren y mit My ∧ y = 0 bilden eine Zariski-abgeschlossene Menge; sie enthält eine dichte Menge, also alle y. Eine lineare Abbildung, für die jeder Vektor ein Eigenvektor ist, ist ein Vielfaches der Identität. Also φ″ = c·φ mit c ≠ 0.

*Schritt 4 (Symmetrie).* Setze G := φ (zu einem festen u′ ∈ O). Für jedes u″ ∈ O ist nach Schritt 1 Ψ(u, φ″(u″)) = Ψ(u, v″) = Ψ(u″, φ″(u)) für alle u, mit v″ = φ″(u″). Mit φ″ = cG und Division durch c: Ψ(u, Gu″) = Ψ(u″, Gu) für alle u ∈ K⁴ und alle u″ ∈ O. Beide Seiten sind bilinear in (u, u″), also Polynome, die auf der dichten Menge K⁴ × O übereinstimmen. Also überall. ∎

**Folgerung V1 (Koordinatenform).** In Koordinaten ist Ψ(u, x)_t = (a_t·u)(b_t·w). Die Gleichung aus Lemma V heißt (a_t·u)(b_t·G u′) = (a_t·u′)(b_t·G u) für alle u, u′ (G als Matrix auf den Koordinaten w). Die Matrix a_t (Gᵀb_t)ᵀ vom Rang ≤ 1 ist also symmetrisch. Da a_t ≠ 0 (wegen N1: a_t·u_0 ≠ 0) und b_t ≠ 0 (sonst wäre β_t(v·w) = 0 für alle w und das generisch gewählte v; dann ist β_t = 0 und der Term überflüssig, Widerspruch zu R ≥ 25), folgt

  **Gᵀ b_t = μ_t a_t mit μ_t ≠ 0, für alle t.**

Das nenne ich „symmetrisch“. Es ist eine Eigenschaft der Zerlegung und von p, nicht von u_0.

---

## 6. Lemma S: rk H im symmetrischen Fall

**Lemma S.** Die Zerlegung sei symmetrisch (Folgerung V1), u_0 ∈ O_p. Sei R = K[x_0, x_1, x_2, x_3], R_d die Formen vom Grad d, und

  I := {q ∈ R_2 : q(a_t) = 0 für alle t}.

Dann gilt:
1. dim I = 6 − rk L, und I enthält kein Produkt zweier Linearformen ≠ 0.
2. Ist rk L = 5, so ist rk H = 8.
3. Ist rk L = 4, so ist rk H = 8 für alle u_0 aus einer offenen dichten Teilmenge von O_p.
4. Ist rk L = 3, so ist rk H = 8 − dim Syz₁, wobei Syz₁ der Raum der linearen Syzygien (l_1, l_2, l_3) mit Σ l_k q̄_k = 0 ist, q_1, q_2, q_3 eine Basis von I und q̄ = q mod x_0 (Einschränkung auf die Ebene x_0 = 0), l_k Linearformen in x_1, x_2, x_3.

Dabei sind die Koordinaten so gewählt, dass u_0, u_1, u_2, u_3 die Einheitsvektoren sind (Yangs Normalform). Die Linearform zu u ist ℓ_u(x) = u·x, also ℓ_{u_i} = x_i.

*Beweis.* *Umrechnung.* Mit Gᵀb_t = μ_t a_t ist b_t·(Gy) = (Gᵀb_t)·y = μ_t a_t·y, also Ψ(u, Gy)_t = μ_t (a_t·u)(a_t·y). Ersetzt man x ∈ U durch y = G^{−1}x (eine feste Bijektion von U, angewandt auf jedes Argument der F_i und jeden Eintrag von c ∈ U^{∧3}) und skaliert die Koordinate t von K^r mit μ_t^{−1} (eine invertierbare Diagonalabbildung), dann ändern sich rk L, ρ und rk H nicht. Danach ist

  Ψ(u, y)_t = (a_t·u)(a_t·y) = (ℓ_u ℓ_y)(a_t),

der Wert des Produkts zweier Linearformen im Punkt a_t. Da die Produkte ℓ_uℓ_y ganz R_2 aufspannen, ist Ĵ = ev(R_2) ≅ R_2 / I mit ev(q) = (q(a_t))_t. J = Ψ(u_0, U) = ev(x_0·R_1).

*Teil 1.* dim Ĵ = 10 − dim I und rk L = dim Ĵ − 4, also dim I = 6 − rk L. Wäre ℓ_u ℓ_y ∈ I mit u, y ≠ 0, dann wäre Ψ(u, y) = 0, Widerspruch zu (Ψ1). Insbesondere ist I ∩ x_0·R_1 = 0.

*Rechnung für H.* Ĵ/J ≅ R_2/(x_0 R_1 + I) ≅ R′_2 / Ī mit R′ = K[x_1, x_2, x_3] und Ī = {q̄ : q ∈ I}, q̄(x_1,x_2,x_3) = q(0,x_1,x_2,x_3). Wegen I ∩ x_0 R_1 = 0 ist dim Ī = dim I. F_i(y) ist die Klasse von x_i·ℓ_y, also von x_i·ℓ̄_y mit ℓ̄_y = ℓ_y mod x_0 ∈ R′_1. Für c ∈ U^{∧3} mit Einträgen c_{ij} (Linearformen c̄_{ij} ∈ R′_1 nach Einschränkung) ist

  H(c) = ( x_2 c̄_{12} + x_3 c̄_{13}, −x_1 c̄_{12} + x_3 c̄_{23}, −x_1 c̄_{13} − x_2 c̄_{23} )  mod Ī³.

Sei H̃ diese Abbildung ohne „mod Ī³“, H̃ : (R′_1)³ → (R′_2)³ (die Komponenten von c in Richtung x_0 tragen nichts bei). Dann:

- *im H̃ = {(y_1, y_2, y_3) ∈ (R′_2)³ : x_1 y_1 + x_2 y_2 + x_3 y_3 = 0}.* „⊆“: Σ_i x_i H̃(c)_i = Σ_{i,j} x_i x_j c̄_{ij} = 0, weil c̄_{ii} = 0 und c̄_{ji} = −c̄_{ij} (in jeder Charakteristik). Dimensionen: Der Kern von H̃ ist eindimensional. Aus x_2 c̄_{12} = −x_3 c̄_{13} folgt x_3 | c̄_{12}, also c̄_{12} = λx_3, c̄_{13} = −λx_2. Aus der zweiten Komponente folgt c̄_{23} = λx_1, und die dritte ist dann erfüllt. Also rk H̃ = 9 − 1 = 8. Die Abbildung (R′_2)³ → R′_3, y ↦ Σ x_i y_i, ist surjektiv (jedes Monom vom Grad 3 enthält ein x_i), ihr Kern hat Dimension 18 − 10 = 8. Damit Gleichheit.
- rk H = dim(im H̃ + Ī³) − dim Ī³ = 8 − dim(im H̃ ∩ Ī³).
- Schreibt man y_i = Σ_k α_{ik} q̄_k (q_k Basis von I), so heißt Σ_i x_i y_i = 0 genau Σ_k l_k q̄_k = 0 mit l_k := Σ_i α_{ik} x_i, und α ↦ (l_k) ist bijektiv. Also **dim(im H̃ ∩ Ī³) = dim Syz₁(q̄_1, …)**, der Raum der linearen Syzygien. Das ist Teil 4.

*Teil 2 (rk L = 5).* Ī = K·q̄ mit q̄ ≠ 0. Aus l·q̄ = 0 folgt l = 0 (R′ nullteilerfrei). Also Syz₁ = 0 und rk H = 8.

*Teil 3 (rk L = 4).* I = span(q_1, q_2). Sind q̄_1, q̄_2 in R′ teilerfremd, dann folgt aus l_1 q̄_1 = −l_2 q̄_2, dass q̄_2 | l_1, also l_1 = 0 (Grad), dann l_2 = 0. Also rk H = 8. Bleibt: q̄_1, q̄_2 sind teilerfremd für generisches u_0.
 - q_1, q_2 sind in R teilerfremd: Sonst hätten sie (als linear unabhängige Formen vom Grad 2) einen gemeinsamen linearen Faktor m, q_1 = m·k_1 mit einer Linearform k_1, und I enthielte ein Produkt zweier Linearformen, Widerspruch zu Teil 1.
 - Dann ist V(q_1, q_2) ⊆ ℙ³ eine Kurve (reine Dimension 1) und enthält nur endlich viele Geraden. Haben q̄_1, q̄_2 einen gemeinsamen Faktor, so enthält V(q_1, q_2) ∩ {ℓ_{u_0} = 0} eine Kurve in der Ebene, also eine Komponente von V(q_1, q_2) liegt ganz in der Ebene {ℓ_{u_0} = 0}. Die Ebenen, die eine der endlich vielen Komponenten ganz enthalten, bilden eine echte abgeschlossene Teilmenge des dualen ℙ³ (eine Kurve liegt in höchstens einer Ebene, wenn sie nicht eine Gerade ist; Ebenen durch eine Gerade bilden eine Gerade im dualen Raum). Für u_0 außerhalb davon sind q̄_1, q̄_2 teilerfremd.
 ∎

---

## 7. Satz B: Die Fälle (4,7) und (5,7) sind unmöglich

**Satz B.** Hat ⟨4,2,4⟩ über einem Körper eine Zerlegung der Länge 25, so gilt in Yangs Normalform (über dem algebraischen Abschluss, mit generischem p und generischem u_0):

  (rk L, rk H) ∈ {(3,6), (5,8)},

und im Fall (3,6) ist die Zerlegung symmetrisch im Sinn von Folgerung V1.

*Beweis.* Halte p wie in Abschnitt 2 fest. rk L = dim Ĵ − 4 hängt nicht von u_0 ab. rk H(u_0) ist der Rang einer Matrix, deren Einträge polynomial in u_0 sind (mit einer festen Ergänzung u_1, u_2, u_3, die für u_0 aus einer offenen dichten Menge eine Basis ist). Sein größter Wert h wird auf einer offenen dichten Menge O′ angenommen. Für u_0 ∈ O_p ∩ O′ liefert Satz A: ρ(u_0) = 3 und (rk L, h) ist einer der vier Fälle. Der Fall ist für alle diese u_0 derselbe.

Angenommen, (rk L, h) ist (3,6), (4,7) oder (5,7). Nach Lemma 13′ (Tabelle in Abschnitt 4) ist dann für jedes u_0 ∈ O_p ∩ O′ s = 0, also N(u_0) ≠ 0. Die Voraussetzungen von Lemma V sind erfüllt:
- (Ψ1) gilt (Folgerung 7).
- (a): Für u′ ∈ O_p ist ρ(u′) = 3, und rk F_u (zu u′) = dim(Ψ(u, U) + Ψ(u′, U)) − 4 erreicht für u aus einer offenen dichten Menge den Wert 3. Also ist dim(Ψ(u,U) + Ψ(u′,U)) = 7 auf einer offenen dichten Menge von Paaren.
- (b): N(u′) ≠ 0 für u′ ∈ O_p ∩ O′.

Also ist die Zerlegung symmetrisch. Lemma S gibt dann:
- bei rk L = 4: rk H(u_0) = 8 für generisches u_0, also h = 8. Widerspruch zu (2): rk H ≤ rk L + 3 = 7. (Der Fall (4,7) fällt, und es gibt überhaupt keinen Fall mit rk L = 4.)
- bei rk L = 5: rk H = 8, Widerspruch zu h = 7. (Der Fall (5,7) fällt.)
- bei rk L = 3: kein Widerspruch, aber die Zerlegung ist symmetrisch. ∎

**Wie belastbar ist das?** Status behauptet. Die kritischen Stellen für einen Prüfer:
1. Die Generizitätsargumente (Wahl von p, u_0 in offenen dichten Mengen, Übertragung von „für generisches u_0“ auf „für alle u_0 in O_p ∩ O′“). Ich halte sie für richtig, aber sie sind die Art Stelle, an der man sich leicht vertut.
2. Lemma V Schritt 2: Es braucht, dass I(u, u′) genau eindimensional ist. Das kommt aus ρ = 3 (nicht nur ρ ≤ 3) und aus (Ψ1).
3. Lemma S Teil 3: das Argument über Ebenenschnitte von V(q_1, q_2). Teil 2 braucht das nicht.
4. Lemma 13′ ist eine direkte Abwandlung von Lemma 13 und numerisch gegengeprüft.

Für eine Lean-Formalisierung (später) ist Lemma 13′ leicht (reine lineare Algebra wie Lemma 13). Lemma V und Lemma S brauchen Zariski-Argumente und Polynomringe. Das ist deutlich mehr Arbeit als Yangs Satz 2.

---

## 8. Die offenen Fälle (3,6) und (5,8)

### 8.1 Was über (3,6) bekannt ist (behauptet)

- Die Zerlegung ist symmetrisch (Satz B): Gᵀb_t = μ_t a_t.
- rk L = ρ = 3: Alle F_i bilden in denselben dreidimensionalen Raum im L ab.
- I (Quadriken durch alle a_t) ist dreidimensional, enthält kein Produkt zweier Linearformen, und seine Einschränkung auf eine generische Ebene hat genau zwei linear unabhängige lineare Syzygien (Lemma S Teil 4 mit rk H = 6).
- Φ ist ein Isomorphismus auf im L × Q³ (Folgerung A1).
- **Vermutet:** Die Punkte a_t liegen auf einer verdrehten Kubik (oder einer Entartung davon). Grund: Drei Kegelschnitte mit zwei linearen Syzygien sind nach Hilbert-Burch die 2×2-Minoren einer 3×2-Matrix aus Linearformen. Das habe ich nicht zu Ende geführt.
- Genau dieses Bild realisiert das Modell M1 (Abschnitt 8.3).

### 8.2 Was über (5,8) bekannt ist (behauptet)

- rk L = 5 = dim Q, also Ĵ = ker W (Folgerung A2). Alle Vektoren g(x), alle Ψ(u,x) und überhaupt alle Vektoren (α_t(A)β_t(B))_t mit AB = 0 liegen in Ĵ.
- Lemma 13′: s ≤ 1.
- Φ ist ein Isomorphismus auf im L × Q³ (Folgerung A1).
- Ob die Zerlegung symmetrisch sein muss, weiß ich nicht. Ist sie es, liegen alle a_t auf einer irreduziblen Quadrik (Lemma S Teil 1, dim I = 1).

### 8.3 Gegenbeispiel zum Ansatz „nur F-Daten“ (behauptet, exakt nachgerechnet)

Frage: Lassen sich (3,6) und (5,8) allein mit Eigenschaften der Abbildungen F_i ausschließen, also mit Aussagen über Vektoren a_t, b_t, wie sie in Ψ vorkommen? Antwort: Nein. Es gibt Modelle (`modelle.py`, `monomkurven.py`, exakt in ℤ/(2⁶¹ − 1)):

| Modell | a_t = b_t für t = 1, …, 25 (s_t = 2, …, 26) | dim Ĵ | rk L | ρ | rk H |
|---|---|---|---|---|---|
| M1 | (1, s_t, s_t², s_t³) | 7 | 3 | 3 | 6 |
| M3 | 23 Punkte (1, s, s², s³), 2 zufällige Punkte | 9 | 5 | 3 | 8 |
| K(0,1,2,5) | (1, s_t, s_t², s_t⁵) | 9 | 5 | 3 | 8 |
| M2 | 24 Punkte (1, s, s², s³), 1 zufälliger Punkt | 8 | 4 | 3 | 8 |

In allen Modellen gilt (Ψ1) (bei den Momentenpunkten exakt: u(s)w(s) verschwindet an mindestens 7 Stellen, hat Grad ≤ 6, ist also 0), ρ ≤ 3 ist exakt geprüft (alle 4×4-Minoren als Polynome vom Grad ≤ 4 in γ verschwinden auf einem 5×5×5-Gitter, also identisch), und ρ ≥ 3, rk L, rk H sind an zufälligen Stellen berechnet. M1 und die Modelle mit rk L = 5 erfüllen alle Ungleichungen aus Satz A, Lemma 13′ und Lemma S. Wählt man dazu ker W als irgendeinen 9-dimensionalen Raum über Ĵ und g generisch, ist auch die Aussage von Lemma 10 erfüllt (die Dimensionen erlauben das, weil rk H − rk L ≤ 3).

M2 zeigt nebenbei Lemma S Teil 3 am Beispiel (rk L = 4 erzwingt rk H = 8). Unter den Monomkurven (Exponenten 0 ≤ e ≤ 7) gibt es kein Modell für (4,7) oder (5,7), passend zu Satz B.

Folgerung: **Wer (3,6) oder (5,8) ausschließen will, muss die Abbildung g (also die Teile α_t(·⊗p′) und β_t(v′⊗·) der Zerlegung), die Matrizen C_t oder die Abhängigkeit von p benutzen.** Kandidaten (vermutet):
- Folgerung A1 (Φ ist ein Isomorphismus) zusammen mit der genauen Form von g im symmetrischen Fall.
- Die Familie über p: Für jedes generische p liegen die a_t(p) = A_t p im Fall (3,6) auf einer Kubik. Wie sich diese Kubiken mit p bewegen, ist eine starke Bedingung an die Matrizen A_t.
- Die Transposition (A ↔ Bᵀ): Sie führt zu einer zweiten Normalform mit demselben rk L. Die Daten zeigen ρᵀ = ρ in allen Beispielen.

---

## 9. Gegenproben an echten Verfahren mit 26 Termen

Für r = 26 gilt dim Q = 6, und alle Lemmata müssen auch dort stimmen. Ich habe Yangs Größen an echten Zerlegungen ausgerechnet (`yang_groessen.py`): p, u_0, …, u_3, γ zufällig in einem großen Körper, Ränge exakt in diesem Körper. Für Verfahren über ℤ rechne ich in ℤ/(2⁶¹ − 1), für Verfahren über 𝔽₂ in GF(2³¹) (Modul x³¹ + x³ + 1). Zufällige Stellen liefern die generischen Ränge mit hoher Wahrscheinlichkeit, nicht sicher.

Jede Rechnung prüft zuerst die Zerlegung im Rechenkörper exakt nach, dann, dass alle f_i(x) und g(x) in ker W liegen, und dann Lemma 10 (rk Φ = 12 + rk H).

| Verfahren | Anzahl | rk L | ρ | ρᵀ | rk H | dim N | s | symmetrisch |
|---|---|---|---|---|---|---|---|---|
| `verfahren/4x2x4-r26-s001.json` (ℤ) | 1 | 6 | 4 | 4 | 11 | 0 | 0 | nein |
| S2-01 Beispiel 1 (𝔽₂) | 1 | 6 | 4 | 4 | 10 | 0 | 0 | nein |
| S2-01 Beispiele 2 bis 4 und die fünf Ausnahmen mit S_mid = 9 (𝔽₂) | 8 | 6 | 3 | 3 | 8 | 1 | 0 | ja |
| neue Stichprobe, ρ = 3 (𝔽₂) | 14 | 6 | 3 | 3 | 8 | 1 | 0 | ja |

(Beispiel 2 und Ausnahme 1 aus S2-01 sind dieselbe Zeile, also 7 verschiedene Verfahren in der dritten Zeile.)

Stichprobe: Mit `flip.c` aus S2-01 (Samen 501, 120 s) habe ich 9 637 Verfahren der Länge 26 über 𝔽₂ erzeugt und 2 500 verschiedene zufällig ausgewählt. Ergebnis (`daten/symmetrie_stichprobe2500.txt`): 2 486 mit ρ = 4 (nicht symmetrisch), 14 mit ρ = 3, alle 14 symmetrisch mit eindeutigem G. Die 14 Verfahren liegen in `daten/rho3_rang26_f2.txt`.

Was das zeigt (behauptet bzw. vermutet):
- Alle Ungleichungen gelten, auch Lemma 13′. Bei ρ = 3 ist Lemma 13′ scharf: 8 = 2·3 + 0 + ⌈3/2⌉. Lemma 13 allein gäbe nur rk H ≥ 7,5.
- Das Muster von Satz B (s = 0 ⇒ N ≠ 0 ⇒ symmetrisch) tritt bei r = 26 tatsächlich auf, und zwar genau bei ρ = 3.
- **Vermutet:** ρ = 3 erzwingt immer Symmetrie. Kein Gegenbeispiel in 2 509 Verfahren. Bewiesen ist das nur, wenn N ≠ 0 (Lemma V).
- Eine Verschärfung von Lemma 13 als reine Funktion von (ρ, rk L) kann an der Stelle (ρ, rk L) = (3, 6) nicht über rk H ≥ 8 hinausgehen, wegen dieser Beispiele (Charakteristik 2).
- Einschränkung: Es gibt nur ein Verfahren über ℤ. Weitere ganzzahlige 26er habe ich in drei Läufen von je 280 s nicht erreicht (bestes Ergebnis 27). Alle ρ = 3-Beispiele sind aus Charakteristik 2.

---

## 10. Lemma M aus S2-01

Lemma M (S2-01, vermutet): In jeder Zerlegung von ⟨4,2,4⟩ über F mit 25 Termen gibt es l ∈ V*, m ∈ V mit l(m) ≠ 0, sodass mindestens 10 Terme a_t ∈ U⊗l oder b_t ∈ m⊗W* erfüllen.

1. **Lemma M ist gleichwertig mit dem Ziel.** Aus Lemma M folgt R_F ≥ 26 (Substitution auf ⟨4,1,4⟩, Rang 16). Umgekehrt folgt Lemma M aus R_F ≥ 26, weil es dann keine Zerlegung der Länge 25 gibt und die Aussage leer ist. Lemma M ist also für sich keine Vereinfachung. Hilfreich wäre nur eine Fassung, die man unabhängig vom Ziel beweisen kann.
2. **Die Ausnahmen nachgezählt.** Mit eigenem Code (`smid.py`) habe ich S_mid für die Beispiele aus S2-01 neu gezählt. Ergebnis wie in S2-01: Beispiele 1, 3, 4 haben S_mid = 10, die fünf Ausnahmen haben S_mid = 9 (Beispiel 2 ist dieselbe Zeile wie Ausnahme 1). Bei vier der fünf Ausnahmen killt jedes der sechs Paare (l, m) genau 9 Terme. Alle Verfahren sind über 𝔽₂ gültig (nachgerechnet).
3. **Was die Ausnahmen bedeuten.** Bei Länge 26 kommt S_mid = 9 vor. Eine Aussage „S_mid ≥ 10“ gilt also nicht für alle Zerlegungen der Länge ≤ 26. Ein Beweis von Lemma M muss deshalb die Länge 25 wesentlich benutzen und kann nicht von einer Eigenschaft ausgehen, die bei 26 Termen auch gilt. Widerlegt ist Lemma M damit nicht: Für Länge 25 gibt es keine Daten.
4. **Zusammenhang mit Yangs Größen.** Die fünf Ausnahmen haben ρ = 3 und sind symmetrisch. Die 14 Verfahren mit ρ = 3 aus der neuen Stichprobe haben aber alle S_mid = 10. Einen Zusammenhang zwischen S_mid und (ρ, rk L, rk H) sehe ich nicht. S_mid hängt an den rationalen Richtungen der Faktoren vom Rang 1 (über 𝔽₂ nur drei Richtungen in V), Yangs Argument an einer generischen Richtung p. Beide Ansätze greifen an verschiedenen Stellen an.
5. Empfehlung: Lemma M nicht weiter als eigene Spur verfolgen. Es bleibt eine Umformulierung des Ziels.

---

## 11. Grenzrang

Der Orchestrator hat aus S2-07 weitergegeben: Der Grenzrang von ⟨4,2,4⟩ liegt zwischen 22 und 24 (Literatur). Ein Argument, das nur den Grenzrang beschränkt, kommt nicht über 24.

Die Argumente dieses Berichts sind keine Grenzrang-Argumente. Sie benutzen Gleichheiten, die beim Grenzübergang verloren gehen: die exakte Nichtsingularität (Ψ1) aus (N2), Eigenvektoren (Lemma 9 in Yangs Beweis, hier nicht gebraucht), exakte Ranggleichheiten (dim I(u,u′) = 1 in Lemma V) und Teilbarkeit in Polynomringen (Lemma S). Schon Yangs Schranke 25 liegt über dem Grenzrang. Für die zwei offenen Fälle muss das so bleiben.

---

## 12. Statusübersicht

| Aussage | Status |
|---|---|
| Satz A: Bei r = 25 gilt ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)} | behauptet (Herleitung Abschnitt 3; bestätigt S2-02) |
| Folgerung A1, A2 | behauptet |
| Lemma 13′ | behauptet (Beweis Abschnitt 4, numerisch gegengeprüft) |
| Lemma V | behauptet |
| Lemma S | behauptet |
| Satz B: Die Fälle (4,7) und (5,7) sind unmöglich, über jedem Körper; im Fall (3,6) ist die Zerlegung symmetrisch | behauptet |
| Fall (3,6) ausgeschlossen | offen |
| Fall (5,8) ausgeschlossen | offen |
| ρ = 3 erzwingt Symmetrie (ohne Annahme N ≠ 0) | vermutet |
| Im Fall (3,6) liegen die a_t auf einer verdrehten Kubik | vermutet |
| F-Daten allein schließen (3,6) und (5,8) nicht aus (Modelle M1, M3) | behauptet (exakte Rechnung) |
| Lemma M ist gleichwertig mit R_F ≥ 26 | behauptet (Abschnitt 10, eine Zeile) |
| Lemma M | vermutet, unverändert offen |
| R(⟨4,2,4⟩) ≥ 26 | offen |

---

## 13. Vorschläge für Runde 3 (vermutet)

1. **Prüfer für Satz B.** Ein Prüfer sollte Lemma 13′, Lemma V, Lemma S und den Beweis von Satz B lesen, Schwerpunkt auf die Generizitätsargumente (Abschnitt 7, Punkte 1 bis 3). Wenn Satz B hält, ist Lemma 13′ ein guter erster Kandidat für Lean, weil es Yangs Lemma 13 im Repo direkt erweitert.
2. **Fall (3,6) angreifen.** Dort ist die Struktur am stärksten festgelegt (symmetrisch, rk L = ρ, a_t vermutlich auf einer Kubik, Φ Isomorphismus). Ansatz: die Abbildung g im symmetrischen Fall ausschreiben und Folgerung A1 auswerten. Wahrscheinlich hilft es, die Wirkung von p ↦ a_t(p) = A_t p mitzunehmen.
3. **Fall (5,8) angreifen.** Hier ist Ĵ = ker W. Zuerst klären, ob ρ = 3 auch dort Symmetrie erzwingt (dann liegen die a_t auf einer Quadrik).
4. **Für Spur B:** Ein Verfahren der Länge 25 müsste in Yangs Normalform ρ = 3 haben und in einem der Fälle (3,6) oder (5,8) liegen. Im Fall (3,6) ist es symmetrisch. Eine Suche könnte sich darauf beschränken, etwa auf Verfahren mit der Symmetrie Gᵀb_t ∥ a_t für generisches p.

---

## 14. Dateien

In `versuche/s2-spurA-r2/` (eigener Code, keine fremden Quellen):

- `felder.py`: exakte Arithmetik in ℤ/P und GF(2³¹), Rang und Linkskern
- `yang_groessen.py`: rk L, ρ, rk H, rk Φ, dim Q, dim N, s für eine gegebene Zerlegung; prüft die Zerlegung, ker W, Lemma 10 und alle Ungleichungen
- `symmetrie.py`: dim Ĵ, ρ, ρᵀ und Lösungsraum von G a_t = μ_t b_t
- `smid.py`: unabhängige Nachzählung von S_mid
- `modelle.py`, `monomkurven.py`: Modelle aus Abschnitt 8.3
- `test_l13v.py`: Zufallstest von Lemma 13′
- `daten/`: Ausgaben aller Läufe, die 14 Verfahren mit ρ = 3 (`rho3_rang26_f2.txt`) und die Auszählung der Stichprobe

Aufrufe (aus `versuche/s2-spurA-r2/`): `python3 yang_groessen.py json ../../verfahren/4x2x4-r26-s001.json`, `python3 yang_groessen.py f2 ../s2-blind-r1/beispiele-rang26-f2.txt`, `python3 symmetrie.py f2 daten/rho3_rang26_f2.txt`, `python3 modelle.py`, `python3 monomkurven.py`, `python3 test_l13v.py`, `python3 smid.py ../s2-blind-r1/beispiele-rang26-f2.txt`.

Rechenzeit dieser Runde: unter 20 Minuten auf 4 Kernen insgesamt (Flip-Läufe: einmal 120 s über 𝔽₂, dreimal 280 s über ℤ ohne Treffer, viermal 150 s über ℤ ohne Treffer; Auswertungen unter 3 Minuten). Nichts läuft im Hintergrund weiter.

========== Datei lean/prosa/yang_n4.md ==========
# Prosa-Beweis: R(⟨n,2,m⟩) ≥ (n+2)·m + n − 3 für m ≥ n ≥ 4 (Yang v3, Satz 2)

- Auftrag: S1-03 (Stufe 1, Runde 1), Rolle Beweissucher
- Quelle: Jason Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393v3 vom 12.10.2026, Volltext über alphaXiv gelesen am 25.11.2026. Abschnitte 1, 3 und 4 (ohne 4.1, das ist der Fall n = 3)
- Der Satz ist Yangs Satz. Diese Datei arbeitet seinen Beweis so aus, dass ein Formalisierer ihn ohne das Paper umsetzen kann
- Status: **behauptet**. Kein Prüfer und kein Fremdmodell hat diese Ausarbeitung gelesen
- Ergebnis der Durchsicht in einem Satz: Ich habe **keine mathematische Lücke und keinen Fehler** gefunden, der die Aussage gefährdet. Gefunden habe ich sieben Darstellungslücken (L1 bis L7). Die schwerste ist L5: Der Beweis von Lemma 13 ist im Paper in der vorliegenden Form falsch aufgeschrieben, lässt sich aber reparieren. Die Reparatur steht in Abschnitt 6

Bezeichnungen der Lemmata folgen dem Paper (Lemma 6, Folgerung 7, Lemma 8 usw.), damit man beide Texte nebeneinanderlegen kann. Was im Paper fehlt oder anders steht, ist mit **[Lücke Lx]** markiert und in Abschnitt 10 gesammelt.

---

## 0. Aussage

**Satz (Yang v3, Satz 2).** Sei K ein Körper und seien n, m natürliche Zahlen mit m ≥ n ≥ 4. Gibt es K-lineare Abbildungen α_0, …, α_{r−1} : K^{n×2} → K, β_0, …, β_{r−1} : K^{2×m} → K und Matrizen C_0, …, C_{r−1} ∈ K^{n×m} mit

  A·B = Σ_{t<r} α_t(A) · β_t(B) · C_t  für alle A ∈ K^{n×2}, B ∈ K^{2×m},   (Z)

dann gilt r ≥ (n+2)·m + n − 3.

Insbesondere R_K(⟨4,2,4⟩) ≥ 25 und R_K(⟨4,2,5⟩) ≥ 31.

Hinweis für die Formalisierung: Die robusteste Fassung ist die Aussage über eine gegebene Zerlegung (Z), ohne eigenen Rangbegriff, wie `matrix_algorithm_rank_strict` bei Tsyganov u. a. (siehe `behauptungen/B-001.md`).

---

## 1. Bezeichnungen

Alle Indizes beginnen bei 0. Zeilen von A ∈ K^{n×2} heißen 0, …, n−1, Spalten 0, 1.

- e_{i,j} ist die Matrix mit einer 1 an der Stelle (i,j) und sonst 0. Die Form ergibt sich aus dem Zusammenhang; wo es darauf ankommt, steht sie dabei: e_{i,j}^{(n×2)} oder e_{i,j}^{(2×2)}.
- D(A) ∈ K^{r×r} ist die Diagonalmatrix diag(α_0(A), …, α_{r−1}(A)). D ist linear in A. Alle D(A) sind diagonal und **vertauschen deshalb untereinander**.
- ℬ(B) ∈ K^r ist der Vektor (β_0(B), …, β_{r−1}(B)). ℬ ist linear.
- W : K^r → K^{n×m}, W(t) = Σ_t t_t·C_t. W ist linear.
- Damit lautet (Z): **W(D(A)·ℬ(B)) = A·B** für alle A, B.   (Z′)

Gleichwertigkeit von (Z) und (Z′): D(A)ℬ(B) ist der Vektor mit Einträgen α_t(A)β_t(B), und W davon ist die rechte Seite von (Z).

Für einen Unterraum X ⊆ K^r und eine Matrix M ∈ K^{r×r} ist M·X = {Mx : x ∈ X}. Für eine lineare Abbildung F ist rk F = dim im F.

---

## 2. Reduktionen (ohne Einschränkung)

### 2.1 Algebraisch abgeschlossener Grundkörper

**Lemma R1.** Ist L ⊇ K eine Körpererweiterung und hat ⟨n,2,m⟩ über K eine Zerlegung (Z) der Länge r, dann auch über L.

*Beweis.* Man setzt α_t, β_t L-linear fort (dieselben Koeffizienten bezüglich der Standardbasis) und behält C_t. Beide Seiten von (Z) sind L-bilinear in (A, B). Sie stimmen auf allen Paaren (e_{i,j}, e_{k,l}) überein, weil das Paare über K sind. Also stimmen sie überall überein. ∎

Folgerung: Es genügt, den Satz für L = algebraischer Abschluss von K zu zeigen. **Ab hier ist K algebraisch abgeschlossen**, insbesondere unendlich.

**[Lücke L2]** Das Paper sagt „ohne Einschränkung ist 𝔽 unendlich (sonst ersetze 𝔽 durch seinen algebraischen Abschluss)“. Gebraucht wird später (Lemma 9, nur im Fall n = 4) wirklich „algebraisch abgeschlossen“, nicht nur „unendlich“. Lemma R1 steht im Paper nicht, es ist ein Standardschritt.

### 2.2 Keine Nullformen α_t

**Lemma R2.** Ist α_t = 0 für ein t, so ist (Z) ohne den Summanden t wieder eine Zerlegung, mit Länge r − 1.

Folgerung: Es genügt, den Satz für Zerlegungen zu zeigen, in denen **kein α_t die Nullform ist**. (Eine untere Schranke für die kürzere Länge ist eine für die längere.) Formal: Induktion über r oder Herausfiltern der Indizes mit α_t ≠ 0.

### 2.3 Basiswechsel

**Lemma R3.** Seien S ∈ GL_n(K), T ∈ GL_2(K). Setze

  α′_t(A) := α_t(S^{−1}·A·T),  β′_t(B) := β_t(T^{−1}·B),  C′_t := S·C_t.

Dann ist (α′, β′, C′) wieder eine Zerlegung (Z) derselben Länge r, und α′_t = 0 genau dann, wenn α_t = 0.

*Beweis.* Σ α′_t(A)β′_t(B)C′_t = S·Σ α_t(S^{−1}AT)β_t(T^{−1}B)C_t = S·(S^{−1}AT)(T^{−1}B) = AB. ∎

**[Lücke L1]** Das Paper schreibt C′_t := S^{−1}C_t. Richtig ist S·C_t (oder man ersetzt S durch S^{−1} in α′). Reiner Schreibfehler, ohne Folgen.

---

## 3. Starke Normalisierung (Paper Abschnitt 3)

In diesem Abschnitt gilt allgemein: K unendlich, Zerlegung (Z′) von ⟨n,2,m⟩ mit n, m ≥ 1, kein α_t = 0. Das Paper formuliert für ⟨k,l,m⟩; wir brauchen nur l = 2, k = n.

Definition: f_i : K^{2×m} → K^r, **f_i(x) := D(e_{i,0}^{(n×2)})·ℬ(x)** für 0 ≤ i < n.

### Grundtatsachen (Paper Abschnitt 2, für ⟨n,2,m⟩)

**G1.** ℬ ist injektiv. *Beweis:* Aus ℬ(B) = 0 folgt AB = W(D(A)·0) = 0 für alle A, mit A = e_{0,0} und A = e_{0,1} also beide Zeilen von B gleich 0.

**G2.** W ist surjektiv. *Beweis:* e_{i,0}^{(n×2)}·e_{0,j}^{(2×m)} = e_{i,j}^{(n×m)} liegt im Bild nach (Z′), und die e_{i,j} spannen K^{n×m} auf.

**G3.** dim ker W = r − n·m (Rangsatz mit G2). Insbesondere r ≥ n·m.

**G4.** W(f_i(x)) = e_{i,0}^{(n×2)}·x (aus (Z′)). Das ist die n×m-Matrix, deren Zeile i die Zeile 0 von x ist, alle anderen Zeilen 0.

### Lemma 6 (starke Normalisierung)

**Aussage.** Nach einem Basiswechsel nach R3 gilt:
 (N1) D(e_{0,0}) ist invertierbar, das heißt α_t(e_{0,0}) ≠ 0 für alle t;
 (N2) für jedes x ∈ K^{2×m}, x ≠ 0, sind die Vektoren f_0(x), …, f_{n−1}(x) linear unabhängig.

**Beweis.**

*Schritt 1 (Reduktion auf eine Wahl von u, p).* Angenommen, es gibt u ∈ K^{n×1} und p ∈ K^{1×2} mit
 (a) α_t(u·p) ≠ 0 für alle t, und
 (b) für jedes x ≠ 0 ist die Abbildung K^{n×1} → K^r, a ↦ D(a·p)·ℬ(x), injektiv.

Dann ist u ≠ 0 (wegen (a), r ≥ 1 nach G3) und p ≠ 0. Ergänze u zu einer Basis u_0 = u, u_1, …, u_{n−1} von K^{n×1}, setze S^{−1} := Matrix mit Spalten u_0, …, u_{n−1} und wähle T ∈ GL_2 mit erster Zeile p (möglich, da p ≠ 0). Nach R3 gilt für die neue Zerlegung α′_t(e_{i,0}) = α_t(S^{−1}e_i·e_0^⊤T) = α_t(u_i·p). Also D′(e_{0,0}) = D(up), invertierbar nach (a): (N1). Für x ≠ 0 und γ ∈ K^n gilt Σγ_i f′_i(x) = D((Σγ_i u_i)·p)·ℬ(T^{−1}x). Ist das 0, so folgt mit (b) (angewandt auf T^{−1}x ≠ 0) Σγ_i u_i = 0, also γ = 0: (N2).

*Schritt 2 (Bedingung (b) hängt nur vom Träger ab).* Für x ≠ 0 sei Σ(x) := {t : ℬ(x)_t ≠ 0}. Der t-te Eintrag von D(ap)ℬ(x) ist α_t(ap)·ℬ(x)_t. Also ist a ↦ D(ap)ℬ(x) genau dann injektiv, wenn a ↦ (α_t(a·p))_{t∈Σ(x)} injektiv ist. Das ist eine |Σ(x)|×n-Matrix M_{Σ(x)}(p), deren Einträge linear in p sind. Injektiv heißt: ein n×n-Minor von M_{Σ(x)}(p) ist ≠ 0.

*Schritt 3 (für jedes einzelne x gibt es ein gutes p).* Sei x ≠ 0. Wähle p mit p·x ≠ 0 (möglich, da x eine Zeile ≠ 0 hat). Aus D(ap)ℬ(x) = 0 folgt mit (Z′) 0 = W(D(ap)ℬ(x)) = (ap)x = a·(px). Da px ≠ 0 eine Zeile ist, folgt a = 0. Also ist für dieses p die Abbildung aus (b) injektiv.

*Schritt 4 (Polynomargument).* Sei 𝒮 die endliche Menge aller Träger Σ(x), x ≠ 0. Für jedes Σ ∈ 𝒮 gibt es nach Schritt 3 ein p_Σ, für das M_Σ(p_Σ) einen Minor ≠ 0 hat. Wähle diesen Minor; als Polynom q_Σ in den zwei Koordinaten von p ist er nicht das Nullpolynom. Ebenso ist für jedes t das Polynom a_t(u,p) := α_t(u·p) in den n+2 Koordinaten von (u,p) nicht das Nullpolynom, weil α_t ≠ 0 und die Matrizen u·p (Rang ≤ 1) ganz K^{n×2} aufspannen (z. B. e_{i,j} = e_i·e_j^⊤). Das Produkt Π_t a_t · Π_{Σ∈𝒮} q_Σ ist ein Polynom ≠ 0 (Polynomring über einem Körper ist nullteilerfrei). Über einem unendlichen Körper hat es eine Stelle (u,p), an der es nicht verschwindet. Dort gelten (a) und (b) für alle x ≠ 0, weil Σ(x) ∈ 𝒮. ∎

**[Lücke L3]** Das Paper schreibt „nicht konstantes Polynom“, gemeint ist „nicht das Nullpolynom“ (ein homogenes Polynom vom Grad n ≥ 1 ≠ 0 ist ohnehin nicht konstant). Die Existenz einer gemeinsamen Nichtnullstelle über unendlichen Körpern und die Wahl von S, T in Schritt 1 lässt das Paper aus („apply a change of basis that maps u_i p ↦ e_{i,0}“). Beides ist Standard und oben ergänzt.

**Ab hier gelten (N1) und (N2).** Dann gilt außerdem:

**G5.** f_0 ist injektiv (D(e_{0,0}) invertierbar, ℬ injektiv nach G1).

**G6.** f_i = P_i·f_0 mit der Diagonalmatrix P_i := D(e_{i,0})·D(e_{0,0})^{−1}.

### Folgerung 7

**Aussage.** Für jedes γ ∈ K^n, γ ≠ 0, ist x ↦ Σ_i γ_i f_i(x) auf ganz K^{2×m} injektiv.

*Beweis.* Direkt aus (N2). ∎

### Lemma 8

**Aussage.** Für jeden Unterraum S ⊆ K^{2×m}, S ≠ 0, gilt dim(f_0(S) + f_1(S) + … + f_{n−1}(S)) ≥ dim S + (n − 1).

*Beweis.* Sei E_j ⊆ K^r der Unterraum der Vektoren, deren Einträge ab Position j null sind (also E_j = span(e_0, …, e_{j−1}), E_0 = 0, E_r = K^r). Jede Diagonalmatrix bildet jedes E_j in sich ab.

Sei j minimal mit X := f_0(S) ∩ E_j ≠ 0 (existiert, da f_0(S) ∩ E_r = f_0(S) ≠ 0 nach G5; j ≥ 1). Dann ist dim X = 1: X ∩ E_{j−1} = 0 und E_{j−1} hat in E_j Kodimension 1, also dim X ≤ 1. Schreibe X = span(f_0(v)) mit v ∈ S, v ≠ 0.

Sei T := span(f_0(v), …, f_{n−1}(v)). Nach (N2) ist dim T = n. Nach G6 ist f_i(v) = P_i f_0(v) ∈ E_j, also T ⊆ E_j. Daher f_0(S) ∩ T ⊆ f_0(S) ∩ E_j = X, und X ⊆ T. Also f_0(S) ∩ T = X, dim 1. Es folgt

 dim(f_0(S) + T) = dim f_0(S) + n − 1 = dim S + n − 1 (G5).

Da v ∈ S, ist f_0(S) + T ⊆ Σ_i f_i(S). ∎

### Lemma 9 (nur für n = 4 gebraucht)

**Aussage.** Sei K algebraisch abgeschlossen. Dann gibt es keinen Unterraum S ⊆ K^{2×m}, S ≠ 0, und keinen Index i ≠ 0 mit f_i(S) ⊆ f_0(S).

*Beweis.* Angenommen doch. Sei V := f_0(S) ≠ 0 (G5). Nach G6 ist P_i·V = f_i(S) ⊆ V, also ist P_i eingeschränkt auf V ein Endomorphismus des endlichdimensionalen Raums V ≠ 0. Über algebraisch abgeschlossenem K hat er einen Eigenvektor w = f_0(s) ∈ V, s ∈ S, s ≠ 0, mit P_i w = λ w. Dann f_i(s) − λ f_0(s) = 0. Das widerspricht Folgerung 7 mit γ = e_i − λ e_0 ≠ 0 (Koeffizient 1 bei i ≠ 0). ∎

---

## 4. Die Räume für ⟨n,2,m⟩ (Paper Abschnitt 2 und Anfang von 4)

Ab hier: n ≥ 2, m ≥ 1, (N1) und (N2) gelten.

- **U** := {x ∈ K^{2×m} : Zeile 0 von x ist 0}. dim U = m.
- **g** : K^{2×m} → K^r, g(x) := D(e_{0,1}^{(n×2)})·ℬ(x) − D(e_{0,0}^{(n×2)})·ℬ(e_{0,1}^{(2×2)}·x).
- **J** := f_0(U).
- **Q** := ker W / J (Quotientenraum; im Paper ker(W)/J).

**Lemma 4.1.**
 (i) f_i(U) ⊆ ker W für alle i.
 (ii) g(x) ∈ ker W für alle x ∈ K^{2×m}.
 (iii) dim J = m, J ⊆ ker W, dim Q = r − (n+1)·m. Insbesondere r ≥ (n+1)·m.

*Beweis.* (i) Nach G4 ist W(f_i(x)) die Matrix mit Zeile 0 von x in Zeile i; für x ∈ U ist das 0. (ii) Nach (Z′) ist W(g(x)) = e_{0,1}^{(n×2)}x − e_{0,0}^{(n×2)}(e_{0,1}^{(2×2)}x). Beide Terme sind die Matrix mit Zeile 1 von x in Zeile 0 und sonst 0. (iii) G5, (i) und G3. ∎

Für i = 1, …, n−1 sei **F_i : U → Q**, F_i(x) := f_i(x) + J. Beachte: f_0(x) + J = 0 für x ∈ U.

- **ℓ** : U^{n−1} → ker W, ℓ(u_1, …, u_{n−1}) := Σ_{1≤i<n} f_i(u_i).
- **L** : U^{n−1} → Q, L(u) := ℓ(u) + J = Σ_i F_i(u_i).
- Für einen Raum V und d ≥ 1 sei **V^{∧d}** := {c = (c_{i,j})_{1≤i,j≤d} mit c_{i,j} ∈ V : c_{i,i} = 0 und c_{j,i} = −c_{i,j} für alle i, j}. (Alternierende d×d-Matrizen mit Einträgen in V. Die Bedingung c_{i,i} = 0 ist ausdrücklich gefordert, das zählt in Charakteristik 2.) dim V^{∧d} = d(d−1)/2 · dim V.
- c_{i,:} := (c_{i,1}, …, c_{i,d}) ∈ V^d ist die i-te Zeile.
- **Schiefe Erweiterung:** Zu einer linearen Abbildung λ : V^d → Y heißt h : V^{∧d} → Y^d, h(c) := (λ(c_{1,:}), …, λ(c_{d,:})), die schiefe Erweiterung von λ.
- **h** : U^{∧(n−1)} → (ker W)^{n−1} ist die schiefe Erweiterung von ℓ, **H** : U^{∧(n−1)} → Q^{n−1} die von L. H(c) ist h(c) mit jeder Komponente modulo J.

---

## 5. Die Grundungleichung (Paper Lemma 10, Gleichungen (1) und (2))

Definiere

 **Φ** : U^{n−1} × U^{∧(n−1)} → Q × Q^{n−1},
 Φ(u, c) := ( ℓ(u) + J , ( −g(u_i) + h(c)_i + J )_{1≤i<n} ).

(Das Paper nimmt als ersten Zielraum im L ⊆ Q. Das Bild der ersten Komponente liegt in im L; für die Dimensionsrechnung nimmt man im L, nicht Q.)

### Lemma 10

**Aussage.** ker Φ = {0} × ker H.

*Beweis.* „⊇“: Φ(0, c) = (0, H(c)).

„⊆“: Sei Φ(u, c) = 0. Dann gibt es y_0, y_1, …, y_{n−1} ∈ U mit

 ℓ(u) = f_0(y_0),  −g(u_i) + h(c)_i = f_0(y_i) für 1 ≤ i < n.

Multipliziere die erste Gleichung mit D(e_{0,1}), die i-te mit D(e_{i,0}), und addiere:

 D(e_{0,1})ℓ(u) − Σ_i D(e_{i,0})g(u_i) + Σ_i D(e_{i,0})h(c)_i = D(e_{0,1})f_0(y_0) + Σ_i D(e_{i,0})f_0(y_i).   (*)

*Der h-Term ist 0:* Σ_i D(e_{i,0}) h(c)_i = Σ_{i,j} D(e_{i,0})D(e_{j,0})ℬ(c_{i,j}). Die Summanden mit i = j sind 0 (c_{i,i} = 0), die mit (i,j) und (j,i) heben sich weg (Diagonalmatrizen vertauschen, c_{j,i} = −c_{i,j}, ℬ linear).

*Linke Seite:* Mit ℓ(u) = Σ_i D(e_{i,0})ℬ(u_i) und der Definition von g:
 D(e_{0,1})Σ_i D(e_{i,0})ℬ(u_i) − Σ_i D(e_{i,0})D(e_{0,1})ℬ(u_i) + Σ_i D(e_{i,0})D(e_{0,0})ℬ(e_{0,1}u_i) = D(e_{0,0})·Σ_i D(e_{i,0})ℬ(e_{0,1}^{(2×2)}u_i).

*Rechte Seite:* D(e_{0,0})·[D(e_{0,1})ℬ(y_0) + Σ_i D(e_{i,0})ℬ(y_i)] (vertauschen).

Kürze D(e_{0,0}) (invertierbar, N1) und wende W an, mit (Z′):

 Σ_i e_{i,0}^{(n×2)}·(e_{0,1}^{(2×2)}u_i) = e_{0,1}^{(n×2)}·y_0 + Σ_i e_{i,0}^{(n×2)}·y_i.

Sei w_i die Zeile 1 von u_i (Zeile 0 ist 0, da u_i ∈ U). e_{0,1}u_i hat Zeile 0 gleich w_i, also ist die linke Seite die n×m-Matrix mit Zeile i gleich w_i (1 ≤ i < n) und Zeile 0 gleich 0. Rechts: e_{i,0}y_i = 0, weil Zeile 0 von y_i null ist; e_{0,1}y_0 hat nur Zeile 0 ≠ 0. Vergleich der Zeilen 1, …, n−1: w_i = 0, also u_i = 0 für alle i. Dann ist Φ(0, c) = (0, H(c)) = 0, also c ∈ ker H. ∎

Hinweis: Lemma 10 braucht nur (N1), nicht (N2).

### Folgerung (Gleichung (1) und (2) des Paper)

Rangsatz für Φ, mit dim ker Φ = dim ker H und dim U^{∧(n−1)} − dim ker H = rk H:

 (n−1)·m + rk H = rk Φ ≤ rk L + (n−1)·dim Q = rk L + (n−1)(r − (n+1)m).   (1)

Umgestellt, als Aussage in ℤ:

 **(n−1)·(r − (n+2)·m) ≥ rk H − rk L.**   (2)

---

## 6. Rangschranken für H

### Lemma 11 (schiefe Erweiterung, reine lineare Algebra)

**Aussage.** Seien V, Y endlichdimensional, d ≥ 1, λ : V^d → Y linear und h seine schiefe Erweiterung. Dann gilt **2·rk h ≥ (d−1)·rk λ.**

*Beweis.* Für d = 1 ist nichts zu zeigen. Sei d ≥ 2. Definiere

 μ : V^{∧d} × V^{∧d} → (V^d)^{d−1}, μ(c, c′) := (c_{i,:} + c′_{i+1,:})_{1≤i<d}.

*μ ist injektiv.* Sei μ(c, c′) = 0, also

 c_{i,j} = −c′_{i+1,j} für 1 ≤ i ≤ d−1, 1 ≤ j ≤ d.   (R(i,j))

Zeige durch Induktion über k = 0, 1, …, d−1: c_{p,q} = 0 und c′_{p,q} = 0 für alle p, q mit |p − q| = k.
 - k = 0: Diagonale, nach Definition 0.
 - k ≥ 1, Annahme für alle kleineren Abstände. Sei p < q, q − p = k. Wegen Schiefsymmetrie genügt es, c_{p,q} und c′_{p,q} zu behandeln.
  - c_{p,q}: p ≤ d−1, also gilt R(p,q): c_{p,q} = −c′_{p+1,q}, und |q − (p+1)| = k − 1. Also 0.
  - c′_{p,q} = −c′_{q,p}. Da 1 ≤ q−1 ≤ d−1, gilt R(q−1,p): c_{q−1,p} = −c′_{q,p}, und |(q−1) − p| = k − 1. Also c′_{q,p} = 0, damit c′_{p,q} = 0.

Keine Division durch 2, gilt in jeder Charakteristik.

*μ ist bijektiv.* Beide Räume haben Dimension d(d−1)·dim V. Injektiv und gleiche endliche Dimension.

*Abschluss.* Für alle (c, c′) gilt (h(c)_i + h(c′)_{i+1})_{1≤i<d} = (λ(μ(c,c′)_i))_{1≤i<d}. Die linke Seite ist τ(h(c), h(c′)) für die feste lineare Abbildung τ : Y^d × Y^d → Y^{d−1}, τ(y, y′) = (y_i + y′_{i+1})_i. Da μ surjektiv ist, ist das Bild der rechten Seite genau (im λ)^{d−1}, Dimension (d−1)·rk λ. Das Bild der linken Seite liegt in τ(im h × im h), Dimension ≤ 2·rk h. ∎

**[Lücke L4]** Das Paper zeigt die Injektivität von μ nur an den ersten Schritten und schließt mit „repeating this process“; außerdem fehlt in der Gleichung „= 0“. Die Induktion oben ersetzt das.

Anwendung mit V = U, Y = Q, λ = L, d = n−1:  **2·rk H ≥ (n−2)·rk L.**   (11′)

### Lemma 13

Sei ρ := max_{γ ∈ K^{n−1}} rk(Σ_i γ_i F_i). (Maximum existiert, Ränge ≤ m.) Offensichtlich ρ ≤ m und rk F_i ≤ ρ für jedes i.

**Aussage (abstrakt, so formalisieren).** Seien U, Q endlichdimensional, d ≥ 2, F_1, …, F_d : U → Q linear, L(u) := Σ_i F_i(u_i) auf U^d, H die schiefe Erweiterung von L, ρ := max_γ rk(Σ γ_i F_i). Dann

 **2·rk H ≥ d·ρ + (d−2)·rk L.**

Mit d = n−1 ist das die Aussage des Paper: rk H ≥ (n−1)/2·ρ + (n−3)/2·rk L.

*Beweis.*

*Schritt 1 (ohne Einschränkung ρ = rk F_1).* Wähle γ* mit rk(Σγ*_i F_i) = ρ. Ist ρ = 0, setze ξ = I. Sonst ist γ* ≠ 0; wähle ξ ∈ GL_d(K) mit erster Zeile γ*. Setze F′_i := Σ_j ξ_{i,j} F_j, L′(u) := Σ_i F′_i(u_i), H′ die schiefe Erweiterung von L′. Dann gilt:
 - L′(u) = L(uξ) mit (uξ)_j := Σ_i u_i ξ_{i,j}. Da u ↦ uξ bijektiv ist, rk L′ = rk L.
 - Die Menge {Σγ_i F′_i} ist dieselbe wie {Σγ_i F_i} (ξ invertierbar), also ρ′ = ρ, und rk F′_1 = ρ.
 - rk H′ = rk H: Für c ∈ U^{∧d} ist ξ^⊤cξ, mit (ξ^⊤cξ)_{a,b} := Σ_{i,j} ξ_{i,a} c_{i,j} ξ_{j,b}, wieder in U^{∧d}. Schiefsymmetrie ist klar; Diagonale: (ξ^⊤cξ)_{a,a} = Σ_{i<j} ξ_{i,a}ξ_{j,a}(c_{i,j} + c_{j,i}) + Σ_i ξ_{i,a}² c_{i,i} = 0, auch in Charakteristik 2. c ↦ ξ^⊤cξ ist bijektiv (Umkehrung mit ξ^{−1}). Man rechnet nach: H(ξ^⊤cξ)_a = Σ_i ξ_{i,a} L(c_{i,:}ξ) = Σ_i ξ_{i,a} H′(c)_i. Also im H = ξ^⊤·im H′ (ξ^⊤ wirkt invertierbar auf Q^d).

Ab hier also rk F_1 = ρ.

*Schritt 2 (Zerlegung von c).* Für c ∈ U^{∧d} sei c̄ := (c_{i,j})_{2≤i,j≤d} ∈ U^{∧(d−1)} der untere Block. Sei Γ := {c ∈ U^{∧d} : c_{i,j} = 0 für alle i, j ≥ 2}; das sind die c, bei denen nur Zeile 1 und Spalte 1 besetzt sind.

*Schritt 3 (die Hilfsabbildungen).* Sei Q̄ := Q / im F_1 und π : Q^d → Q̄^{d−1}, π(y_1, …, y_d) := (y_2 + im F_1, …, y_d + im F_1). Sei L̄ : U^{d−1} → Q̄, L̄(u_2, …, u_d) := L(0, u_2, …, u_d) + im F_1, und H̄ : U^{∧(d−1)} → Q̄^{d−1} die schiefe Erweiterung von L̄.
 - im L = im F_1 + im L(0, ·), also im L̄ = im L / im F_1 und **rk L̄ = rk L − ρ**.
 - Für i ≥ 2 ist H(c)_i = L(c_{i,:}) = F_1(c_{i,1}) + L(0, c_{i,2}, …, c_{i,d}), also **π(H(c)) = H̄(c̄)** für alle c.

*Schritt 4 (Zählen).* Es gilt rk H ≥ dim(im H ∩ ker π) + dim π(im H).
 - π(im H) = im H̄ (jedes c̄ kommt vor, z. B. mit Nullen in Zeile und Spalte 1). Nach Lemma 11 mit d−1 ≥ 1: 2·rk H̄ ≥ (d−2)·rk L̄ = (d−2)(rk L − ρ).
 - H(Γ) ⊆ im H ∩ ker π, weil c̄ = 0 für c ∈ Γ. Für c ∈ Γ ist H(c)_i = F_1(c_{i,1}) für i ≥ 2, und die c_{i,1} (2 ≤ i ≤ d) sind frei in U wählbar. Die Projektion von H(Γ) auf die Komponenten 2, …, d ist also (im F_1)^{d−1}, und dim H(Γ) ≥ (d−1)·ρ.

Zusammen: 2·rk H ≥ 2(d−1)ρ + (d−2)(rk L − ρ) = d·ρ + (d−2)·rk L. ∎

**[Lücke L5]** Der Beweis im Paper ist in der vorliegenden Form nicht korrekt aufgeschrieben, die Aussage stimmt aber (Reparatur oben):
 - Γ wird als {c : c_{i,:} = 0 für alle i ≥ 2} definiert. Wegen Schiefsymmetrie ist dann auch Zeile 1 null, also Γ = {0}. Gemeint ist offenbar der Raum oben (nur Zeile 1 und Spalte 1 besetzt).
 - Unmittelbar vor Lemma 13 steht eine Definition „𝑊 := {c : c_{i,:} = 0 ∀ i > 1}“, die sonst nirgends vorkommt und mit der Abbildung W kollidiert. Vermutlich ein Überbleibsel derselben Definition.
 - Für c ∈ Γ behauptet das Paper H(c) = (0, F_1(c_{2,1}), …). Die erste Komponente ist aber Σ_{j≥2} F_j(c_{1,j}), im Allgemeinen ≠ 0. Für die Zählung ist das unerheblich, wenn man wie oben nur die Komponenten 2, …, d betrachtet.
 - L̄(u_2, …) := L(U, u_2, …) und H̄(c) := [H(c + Γ)_i]_{i≥2} sind nicht wohldefiniert, wenn man sie wörtlich liest (H(Γ)_i ≠ 0 für i ≥ 2). Gemeint ist der Übergang zum Quotienten Q / im F_1 wie oben. Nur so stimmt die Zeile „rk L̄ = rk L − rk F_1“.
 - Die Ungleichung rk H ≥ dim H(Γ) + rk H̄ ist im Paper nicht begründet. Oben folgt sie aus π(H(c)) = H̄(c̄) und H(Γ) ⊆ ker π.
 - Die Zeile „𝐻(Γ) ≥ (𝑛 − 2)𝜌“ meint dim H(Γ).

### Lemma 15

**Aussage.** (a) rk L ≤ (n−1)·ρ. (b) Ist n ≥ 3, K algebraisch abgeschlossen und rk L = (n−1)·ρ, dann ist ρ = m und rk L = (n−1)·m.

*Beweis.* (a) im L = Σ_i im F_i, also rk L ≤ Σ_i rk F_i ≤ (n−1)ρ.

(b) Gleichheit erzwingt rk F_i = ρ für alle i und dim(Σ im F_i) = Σ dim im F_i, das heißt die Summe der Bilder ist direkt; insbesondere im F_i ∩ im F_j = 0 für i ≠ j.

Sei σ := Σ_i F_i : U → Q und N := ∩_i ker F_i. Wegen der Direktheit ist ker σ = N, also rk σ = m − dim N. Nach Definition von ρ (γ = (1, …, 1)) ist rk σ ≤ ρ, also dim N ≥ m − ρ = dim ker F_i. Da N ⊆ ker F_i: **N = ker F_i für jedes i.**

Zeige f_i(N) ⊆ f_0(N) für i ≠ 0. Sei v ∈ N, 1 ≤ i ≤ n−1. Da F_i(v) = 0, ist f_i(v) ∈ J, also f_i(v) = f_0(u_i) mit u_i ∈ U. Mit G6: ℬ(u_i) = D(e_{0,0})^{−1}D(e_{i,0})ℬ(v). Für i, j ≠ 0 folgt

 f_j(u_i) = D(e_{j,0})D(e_{0,0})^{−1}D(e_{i,0})ℬ(v) = f_i(u_j)

(Diagonalmatrizen vertauschen), also F_j(u_i) = F_i(u_j). Für i ≠ j liegt das in im F_j ∩ im F_i = 0, also F_j(u_i) = 0, das heißt u_i ∈ ker F_j = N. Ein solches j ≠ i mit 1 ≤ j ≤ n−1 gibt es, weil n − 1 ≥ 2. Also f_i(v) = f_0(u_i) ∈ f_0(N).

Nach Lemma 9 ist N = 0. Dann m − ρ = dim ker F_i = dim N = 0, also ρ = m und rk L = (n−1)m. ∎

**[Lücke L6]** Im Paper steht „so u_i, u_j ∈ N“ ohne Hinweis, dass dazu N = ker F_j und ein zweiter Index j ≠ i gebraucht werden. Das ist der Grund für die Voraussetzung n ≥ 3. Knapp, aber richtig.

---

## 7. Untere Schranken für ρ und rk L

### Lemma 8′ (rk L ≥ n − 1)

**Aussage.** rk L ≥ n − 1.

*Beweis.* im L = (Σ_{i≥1} f_i(U) + J)/J = (Σ_{i≥0} f_i(U))/J, weil J = f_0(U). Lemma 8 mit S = U (≠ 0, da m ≥ 1) gibt dim Σ_{i≥0} f_i(U) ≥ m + n − 1. Abziehen von dim J = m. ∎

(Im Paper als Halbsatz „Lemma 8 (strong normalization) gives rk(L) ≥ n − 1“.)

### Lemma 14

**Aussage.** Ist m ≥ n − 1, so ist ρ ≥ n − 1. (Das Paper setzt m ≥ n voraus; gebraucht wird nur m ≥ n − 1.)

*Beweis.* 
1. *Wahl von I.* J hat Dimension m ≥ n − 1. Es gibt eine Indexmenge I ⊆ {0, …, r−1}, |I| = n − 1, so dass die Projektion J → K^I, x ↦ (x_t)_{t∈I}, surjektiv ist. (Eine Basismatrix von J, r×m, hat Rang m; wähle m linear unabhängige Zeilen und davon n − 1.)
2. *Wahl von M.* Gesucht γ ∈ K^n, γ ≠ 0, mit (Σ_{i=0}^{n−1} γ_i α_t(e_{i,0}))= 0 für alle t ∈ I. Das sind n − 1 homogene lineare Gleichungen in n Unbekannten, also gibt es eine Lösung γ ≠ 0. Setze M := Σ_i γ_i D(e_{i,0}) (diagonal, M_{t,t} = 0 für t ∈ I).
3. f′(x) := M·ℬ(x) = Σ_i γ_i f_i(x). Nach Folgerung 7 ist f′ injektiv, also dim f′(U) = m. Jeder Vektor in f′(U) hat an den Stellen I Einträge 0. Nach Lemma 4.1(i) ist f′(U) ⊆ ker W.
4. Die Projektion auf K^I, eingeschränkt auf f′(U) + J, ist surjektiv (schon auf J) und hat f′(U) im Kern. Also dim(f′(U) + J) ≥ m + (n−1).
5. F′(x) := f′(x) + J auf U hat Rang dim(f′(U) + J) − dim J ≥ n − 1.
6. Für x ∈ U ist f_0(x) + J = 0, also F′ = Σ_{i=1}^{n−1} γ_i F_i. Damit ρ ≥ rk F′ ≥ n − 1. ∎

---

## 8. Abschluss des Beweises

Gegeben die Zerlegung aus Abschnitt 0 über K mit m ≥ n ≥ 4. Nach R1, R2 und Lemma 6 genügt es, den Fall K algebraisch abgeschlossen, alle α_t ≠ 0, (N1) und (N2) zu behandeln (die Länge wird dabei nicht größer, R3 ändert sie nicht). Alle Ungleichungen in ℤ.

### Fall n ≥ 5

Aus (2) und Lemma 13 (d = n−1):

 2(n−1)(r − (n+2)m) ≥ 2 rk H − 2 rk L ≥ (n−1)ρ + (n−3) rk L − 2 rk L = (n−1)ρ + (n−5) rk L.

Mit ρ ≥ n−1 (Lemma 14, m ≥ n ≥ n−1), rk L ≥ n−1 (Lemma 8′) und n − 5 ≥ 0:

 ≥ (n−1)(n−1) + (n−5)(n−1) = 2(n−1)(n−3).

Teilen durch 2(n−1) > 0: r − (n+2)m ≥ n − 3. ∎

### Fall n = 4

Ziel: r ≥ 6m + 1.

1. Aus (2): 3(r − 6m) ≥ rk H − rk L. Aus (11′) mit n = 4: 2 rk H ≥ 2 rk L, also rk H ≥ rk L. Damit r ≥ 6m.
2. Angenommen r = 6m. Dann rk H − rk L ≤ 0, also rk H = rk L.
3. Lemma 13 (d = 3): 2 rk H ≥ 3ρ + rk L. Mit rk H = rk L: rk L ≥ 3ρ.
4. Lemma 15(a): rk L ≤ 3ρ. Also rk L = 3ρ, und Lemma 15(b) (n = 4 ≥ 3, K algebraisch abgeschlossen) gibt rk L = 3m.
5. Aber rk L ≤ dim Q = r − 5m = m (Lemma 4.1(iii)). Also 3m ≤ m, m = 0. Widerspruch zu m ≥ 4.

Also r ≥ 6m + 1 = (n+2)m + n − 3. ∎

Lemma 14 wird im Fall n = 4 nicht gebraucht, Lemma 9 nur dort.

---

## 9. Abhängigkeiten (für die Formalisierung)

```
R1 (Körpererweiterung)  R2 (Nullformen weg)  R3 (Basiswechsel)
        \                     |                    /
         +------------- Lemma 6 (N1, N2) ---------+
                         |        \
                    G1–G6, Folg. 7  \
                    /     |      \    \
             Lemma 8   Lemma 9   Lemma 14
                |         |          |
             Lemma 8′  Lemma 15(b)   |
                |         |          |
Lemma 4.1 -> Lemma 10 -> (1),(2)     |
                                     |
Lemma 11 (abstrakt) -> Lemma 13 (abstrakt)
                                     |
   Fall n ≥ 5: (2), 13, 14, 8′  ---- +
   Fall n = 4: (2), 11′, 13, 15(a), 15(b), 4.1(iii)
```

Reine lineare Algebra ohne Bezug zur Zerlegung, getrennt formalisierbar: Lemma 11, Lemma 13, Lemma 15(a). Alles Übrige hängt an (Z′), (N1), (N2).

Hinweise zur Umsetzung (Status vermutet, nicht ausprobiert):
- Statt Quotientenräumen kann man überall mit Dimensionen von Summen arbeiten (wie Bemerkung 4 im Paper für ⟨2,2,m⟩ vorschlägt): rk F = dim(F-Bild + J) − dim J. Das kann Quotienten in mathlib vermeiden.
- Lemma 6 Schritt 4 braucht: Ein Polynom ≠ 0 über einem unendlichen Körper hat eine Nichtnullstelle. In mathlib gibt es dafür Aussagen über `MvPolynomial` und unendliche Körper; den genauen Namen habe ich nicht geprüft. Alternative wie bei Tsyganov u. a.: Übergang zu K(t) statt Polynomargument.
- Lemma 9 braucht die Existenz eines Eigenvektors über algebraisch abgeschlossenem Körper (in mathlib vorhanden für Endomorphismen endlichdimensionaler Räume, Name nicht geprüft).
- R1 braucht den algebraischen Abschluss als Körpererweiterung und die Fortsetzung linearer Formen (Basiswechsel der Skalare).
- Die Maximumsdefinition von ρ lässt sich durch „es gibt γ* mit rk = ρ und für alle γ rk ≤ ρ“ ersetzen; Lemma 13 braucht nur das γ*, Lemma 14 und 15 nur die obere Schranke rk(Σγ_iF_i) ≤ ρ bzw. die Existenz.

---

## 10. Liste der gefundenen Lücken

Keine dieser Stellen ist eine echte mathematische Lücke im Sinne von Abbruchregel 4. Alle sind mit Standardschritten oder einer kleinen Umformulierung geschlossen. Das ist meine Einschätzung als Beweissucher, Status behauptet.

| Nr. | Stelle im Paper | Art | Schwere | Behebung |
|---|---|---|---|---|
| L1 | Abschnitt 2, Basiswechsel | Schreibfehler: C′ = S^{−1}C statt S·C | gering | R3 |
| L2 | Abschnitt 2, „WLOG 𝔽 infinite“ | Standardschritt ausgelassen; später wird algebraisch abgeschlossen gebraucht (Lemma 9), nicht nur unendlich | gering | R1, Annahme ab Abschnitt 2 |
| L3 | Lemma 6, Beweis | „non-constant“ statt „nonzero“; Nichtnullstelle über unendlichem Körper und Wahl von S, T ausgelassen | gering | Lemma 6 Schritte 1 und 4 |
| L4 | Lemma 11, Injektivität von μ | nur angedeutet („repeating this process“), „= 0“ fehlt | gering | Induktion über |p − q| |
| L5 | Lemma 13, Beweis | Γ falsch definiert (wörtlich Γ = 0), H(c) für c ∈ Γ falsch angegeben, L̄ und H̄ wörtlich nicht wohldefiniert, Hauptungleichung rk H ≥ dim H(Γ) + rk H̄ unbegründet, verwaiste Definition „𝑊 := …“ | **mittel**: der Beweis ist so nicht nachvollziehbar, die Aussage stimmt | Abschnitt 6, Schritte 2 bis 4 |
| L6 | Lemma 15, „u_i, u_j ∈ N“ | Schritt knapp; braucht N = ker F_j und n ≥ 3 | gering | Lemma 15(b) |
| L7 | Abschnitt 4.2, „Lemma 8 gives rk(L) ≥ n−1“ | Ableitung aus Lemma 8 nicht ausgeschrieben | gering | Lemma 8′ |

Nebenbefunde ohne Einfluss auf Satz 2:
- Lemma 14 braucht nur m ≥ n − 1, nicht m ≥ n. Wo im Beweis von Satz 2 m ≥ n sonst gebraucht wird, habe ich nicht gefunden: Fall n ≥ 5 nutzt m ≥ n − 1 (Lemma 14) und m ≥ 1, Fall n = 4 nur m ≥ 1. Danach gälte die Schranke schon für m ≥ n − 1 ≥ 3 bzw. m ≥ 1 bei n = 4. Das ist **vermutet** und nicht weiter geprüft; ein Prüfer sollte es gezielt nachrechnen, bevor jemand es verwendet.
- Fußnote 1 des Paper vermischt k und n („spans dimension ≥ n … u ∈ 𝔽^{k×l}“). Sie ist ein alternativer Beweis und wird hier nicht gebraucht.
- Der Fall n = 3 (Abschnitt 4.1, Lemma 12) gehört nicht zu diesem Auftrag und wurde nicht durchgesehen.

## 11. Was noch fehlt

- Prüfung dieser Ausarbeitung durch einen Prüfer und Gegenlesen durch ein Fremdmodell (Protokoll Abschnitt 4, vor jeder Formalisierung).
- Die Lean-Formalisierung selbst.

========== Datei lean/YangBounds/SatzA444.lean ==========
import YangBounds.Statements
import YangBounds.Lemma13Prime

/-!
# Theorem A (“Satz A”): the four remaining cases for `⟨4,2,4⟩` of length 25

Task S2-14 (stage 2, round 4, track A, role: formaliser). Status of every statement in this
file: `behauptet` (nothing here is `geprüft` before the statement check of protocol 5.1).
Claim file: `behauptungen/B-008.md`.

Source: `lean/prosa/s2_444_spurA_r2.md` (task S2-05), Section 3 (Satz A, Folgerung A1, A2)
and Section 4 (Lemma 13′, application table); checked in
`lean/prosa/s2_444_spurA_r2_pruefung.md` (task S2-09), Sections 2.2 to 2.4. The underlying
lemmas are Yang's (arXiv:2609.14393v3), formalised in `YangN4Haupt.lean` and
`YangN4Lemma13.lean`.

## Prose statement (Section 3)

> **Satz A.** Hat ⟨4,2,4⟩ über einem Körper eine Zerlegung der Länge 25, so gilt in der
> Normalform (über dem algebraischen Abschluss, für jedes zulässige u_0):
> ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}.
> Außerdem ist rk Φ = 12 + rk H, …

## Translation

* “Normalform, zulässiges u_0” is a decomposition `alg : BilinearAlgorithm K 4 2 4 25` with
  (N1) `SN1` and (N2) `SN2` (definitions in `YangN4Haupt.lean`, prose `yang_n4.md`,
  Lemma 6). Every admissible `u_0` gives such a decomposition after the change of basis R3,
  and conversely; so “for every admissible `u_0`” is “for every `alg` with (N1), (N2)”.
  `n = d + 1` with `d = 3` (the implicit argument `d := 3` of the `YangN4Haupt` objects).
* `Q = ker W / J` is `Kbar alg`, `F_i` is `Fq alg i` (`i : Fin 3`, prose `i = 1, 2, 3`),
  `L` is `Lq alg`, `H` is `Hq alg`, `rk f` is `finrank K (LinearMap.range f)`.
* `ρ` is any number with `IsGreatest (Set.range (rkComb (Fq alg))) ρ` (the maximum of
  `rk(∑ γ_i F_i)`; it exists by `exists_isGreatest_rkComb`).
* The statement for normalized decompositions holds over **every** field `K` (no algebraic
  closure is used in these steps). The passage from an arbitrary decomposition over `K` to a
  normalized one over `AlgebraicClosure K` of the same length 25 is `satzA_exists`
  (it uses R1, R2, Lemma 6 and Yang's Theorem 2 for the length).
* `Φ` is `Φ alg` with values in `(Fin 25 → K) ⧸ J × (Fin 3 → Q)`; `im L × Q³` is
  `(range Lq).prod ⊤`.
* `Ĵ = Ψ(K⁴, U) = J + f_1(U) + f_2(U) + f_3(U)` is `JHat alg = ⨆ i : Fin 4, range (φ alg i)`.

## Main results

* `SatzAStatement K`, `satzA_statement`: Theorem A for normalized decompositions, as a `Prop`
  usable as a hypothesis (task S2-15), and its proof.
* `satzA`: the same as a theorem with explicit arguments, plus `dim Q = 5`.
* `satzA_global`: the prose statement as written: any decomposition of length 25 over any
  field has a normal form over the algebraic closure in which the conclusion holds.
* `satzA_exists`: from any decomposition of length 25 over any field to a normalized one over
  the algebraic closure, for which Theorem A holds.
* `finrank_range_Φ`: `rk Φ = 12 + rk H` (for every normalized decomposition of `⟨4,2,m⟩`…
  here stated for `⟨4,2,4⟩`, length 25).
* `corollaryA1`: in the cases (3,6), (4,7), (5,8), `Φ` maps onto `im L × Q³`.
* `finrank_JHat`, `corollaryA2`: `dim Ĵ = rk L + 4`; if `rk L = 5` then `Ĵ = ker W`, and
  `g(U) ⊆ Ĵ`.
* `Lemma13PrimeStatement`, `lemma13Prime_statement`: Lemma 13′ for `d = 3` in the notation of
  `YangN4Haupt.lean`, as a `Prop` and its proof.
* `sDim_table`: the application table of Lemma 13′ (prose Section 4): `s = 0` in the cases
  (3,6), (4,7), (5,7) and `s ≤ 1` in the case (5,8).
* `exists_common_kernel`: in the cases (3,6), (4,7), (5,7) the maps `F_1, F_2, F_3` have a
  common kernel vector `x ≠ 0` (`N ≠ 0`, the hypothesis (b) of Lemma V).

Not formalised (not needed for Satz B): the second half of Folgerung A1 (the isomorphism
`ker L → Q³ / im H`), and the remark “Ungleichung (1) ist in (3,6), (4,7), (5,8) eine
Gleichung” beyond `rk Φ = 12 + rk H` and A1.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzA444

open Module YangN4Haupt

universe u v w

/-! ## Lemma 13′ in the notation of `YangN4Haupt.lean` (`d = 3`) -/

/-- **Statement of Lemma 13′** (prose Section 4, `d = 3`, doubled form without ceiling), for a
field `K` and spaces `U`, `Q`: if `U`, `Q` are finite-dimensional, `F : Fin 3 → U → Q` linear,
`ρ` the maximum of `rk(∑ γ_i F_i)` and `γ` a maximiser, then
`3ρ + 2 s + rk L ≤ 2 rk H` with `s = dim ∑_i F_i(ker ∑_j γ_j F_j)`.

(Equivalent for natural numbers to `rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉`.) -/
def Lemma13PrimeStatement (K : Type u) [Field K] (U : Type v) (Q : Type w)
    [AddCommGroup U] [Module K U] [AddCommGroup Q] [Module K Q] : Prop :=
  FiniteDimensional K U → FiniteDimensional K Q →
  ∀ (F : Fin 3 → U →ₗ[K] Q) (ρ : ℕ),
    IsGreatest (Set.range fun γ : Fin 3 → K => finrank K (LinearMap.range (∑ i, γ i • F i))) ρ →
    ∀ γ : Fin 3 → K, finrank K (LinearMap.range (∑ i, γ i • F i)) = ρ →
      3 * ρ + 2 * finrank K (⨆ i, (LinearMap.ker (∑ j, γ j • F j)).map (F i) : Submodule K Q) +
          finrank K (LinearMap.range (sumMap F)) ≤
        2 * finrank K (LinearMap.range (skewExt (sumMap F)))

/-- **Lemma 13′** (`d = 3`) holds for all `K`, `U`, `Q`. -/
theorem lemma13Prime_statement (K : Type u) [Field K] (U : Type v) (Q : Type w)
    [AddCommGroup U] [Module K U] [AddCommGroup Q] [Module K Q] :
    Lemma13PrimeStatement K U Q := by
  intro _ _ F ρ hρ γ hγ
  have h : (1 + 2) * ρ + 2 * Lemma13Prime.sDim (∑ i, γ i • F i) F +
      1 * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) :=
    Lemma13Prime.lemma13Prime (e := 1) F ρ hρ γ hγ
  unfold Lemma13Prime.sDim at h
  omega

/-! ## Satz A -/

section SatzA

variable {K : Type u} [Field K]

/-- **Statement of Satz A** (prose Section 3) for normalized decompositions over `K`:
for every decomposition `alg` of `⟨4,2,4⟩` of length 25 with (N1) and (N2) and every `ρ`
that is the maximum of `rk(∑ γ_i F_i)`: `ρ = 3` and
`(rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}`. -/
def SatzAStatement (K : Type u) [Field K] : Prop :=
  ∀ alg : BilinearAlgorithm K 4 2 4 25, SN1 (d := 3) alg → SN2 (d := 3) alg →
    ∀ ρ : ℕ, IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) ρ →
      ρ = 3 ∧
      ((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))

/-- The integer inequalities of Satz A (prose Section 3, items 1 to 6) for a normalized
decomposition: `dim Q = 5`, `rk L ≤ 5`, `rk H ≤ rk L + 3`, `3ρ + rk L ≤ 2 rk H`, `ρ ≥ 3`,
`rk L ≥ 3`. -/
theorem satzA_inequalities (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (ρ : ℕ) (hρ : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) ρ) :
    finrank K (Kbar (d := 3) alg) = 5 ∧
    finrank K (LinearMap.range (Lq (d := 3) alg)) ≤ 5 ∧
    finrank K (LinearMap.range (Hq (d := 3) alg)) ≤
      finrank K (LinearMap.range (Lq (d := 3) alg)) + 3 ∧
    3 * ρ + finrank K (LinearMap.range (Lq (d := 3) alg)) ≤
      2 * finrank K (LinearMap.range (Hq (d := 3) alg)) ∧
    3 ≤ ρ ∧ 3 ≤ finrank K (LinearMap.range (Lq (d := 3) alg)) := by
  -- item 1: `dim Q = 25 − 20 = 5`, and `im L ⊆ Q`
  have hq := finrank_Kbar (d := 3) alg h1
  have hLQ : finrank K (LinearMap.range (Lq (d := 3) alg)) ≤ finrank K (Kbar (d := 3) alg) :=
    Submodule.finrank_mono (range_Lq_le_Kbar alg)
  -- item 2: inequality (1), `3·4 + rk H ≤ rk L + 3·dim Q`
  have hI := ineq1 (d := 3) alg h1
  -- item 3: Lemma 13 with `d = 3`
  have h13 : 3 * ρ + (3 - 2) * finrank K (LinearMap.range (Lq (d := 3) alg)) ≤
      2 * finrank K (LinearMap.range (Hq (d := 3) alg)) :=
    YangN4Lemma13.lemma13_statement (K := K) (Fin 4 → K) ((Fin 25 → K) ⧸ J (d := 3) alg)
      inferInstance inferInstance 3 (by norm_num) (Fq alg) ρ hρ
  -- item 4: Lemma 14 (`m = 4 ≥ d = 3`)
  have h14 := lemma14 (d := 3) alg h1 h2 (by norm_num) hρ
  -- item 6: Lemma 8′
  have h8 := lemma8' (d := 3) alg h1 h2 (by norm_num)
  refine ⟨by omega, by omega, by omega, by omega, h14, h8⟩

/-- **Satz A** (prose Section 3) for normalized decompositions, with `dim Q = 5`. -/
theorem satzA (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (ρ : ℕ) (hρ : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) ρ) :
    ρ = 3 ∧ finrank K (Kbar (d := 3) alg) = 5 ∧
      ((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8)) := by
  obtain ⟨hq, hL5, h2', h13, h14, h8⟩ := satzA_inequalities alg h1 h2 ρ hρ
  simp only [Prod.mk.injEq]
  -- items 5 and 7: `ρ = 3`, then the case list
  refine ⟨by omega, hq, by omega⟩

/-- **Satz A** holds over every field (statement form for use as a hypothesis). -/
theorem satzA_statement (K : Type u) [Field K] : SatzAStatement K := by
  intro alg h1 h2 ρ hρ
  obtain ⟨hρ3, -, hcases⟩ := satzA alg h1 h2 ρ hρ
  exact ⟨hρ3, hcases⟩

/-- **Satz A, global form.** Every decomposition of `⟨4,2,4⟩` of length 25 over any field `K`
gives a decomposition of length 25 over the algebraic closure of `K` with (N1) and (N2)
(prose: R1, R2, Lemma 6; the length cannot drop below 25 by Yang's Theorem 2), and for every
such normalized decomposition the conclusion of Satz A holds (`satzA_statement`). -/
theorem satzA_exists (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' := by
  obtain ⟨r', hr', alg', h1, h2⟩ :=
    exists_normalized (d := 3) (alg.baseChange (AlgebraicClosure K))
  have h25 := yang_theorem_two_algorithm (AlgebraicClosure K) 4 4 le_rfl le_rfl alg'
  obtain rfl : r' = 25 := by omega
  exact ⟨alg', h1, h2⟩

/-- **Satz A, global form with conclusion** (prose Section 3, as stated there): every
decomposition of `⟨4,2,4⟩` of length 25 over any field `K` has a normal form over the
algebraic closure (length 25, (N1), (N2)) in which `ρ = 3` and
`(rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}`. -/
theorem satzA_global (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      ∀ ρ : ℕ, IsGreatest (Set.range (rkComb (Fq (d := 3) alg'))) ρ →
        ρ = 3 ∧
        ((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (3, 6) ∨
          (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (4, 7) ∨
          (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 7) ∨
          (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8)) := by
  obtain ⟨alg', h1, h2⟩ := satzA_exists K alg
  exact ⟨alg', h1, h2, satzA_statement (AlgebraicClosure K) alg' h1 h2⟩

/-! ## `rk Φ = 12 + rk H` and Folgerung A1 -/

/-- `rk Φ = 12 + rk H` (prose Section 3, “Zu Φ”), from Lemma 10 (`ker Φ = {0} × ker H`). -/
theorem finrank_range_Φ (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg) :
    finrank K (LinearMap.range (Φ (d := 3) alg)) =
      12 + finrank K (LinearMap.range (Hq (d := 3) alg)) := by
  have hrn := LinearMap.finrank_range_add_finrank_ker (Φ (d := 3) alg)
  have hH := LinearMap.finrank_range_add_finrank_ker (Hq (d := 3) alg)
  rw [ker_Φ (d := 3) alg h1, ← (Submodule.equivMapOfInjective _ LinearMap.inr_injective
    (LinearMap.ker (Hq (d := 3) alg))).finrank_eq] at hrn
  rw [Module.finrank_prod, Module.finrank_pi_fintype] at hrn
  simp only [Module.finrank_fin_fun, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    smul_eq_mul] at hrn
  omega

/-- `im L × Q³` as a subspace of the target of `Φ`, and its dimension `rk L + 15`. -/
theorem finrank_imL_prod (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg) :
    finrank K ((LinearMap.range (Lq (d := 3) alg)).prod
        (⊤ : Submodule K (Fin 3 → Kbar (d := 3) alg))) =
      finrank K (LinearMap.range (Lq (d := 3) alg)) + 15 := by
  have hq := finrank_Kbar (d := 3) alg h1
  let ι := LinearMap.prodMap (LinearMap.range (Lq (d := 3) alg)).subtype
    (LinearMap.id : (Fin 3 → Kbar (d := 3) alg) →ₗ[K] (Fin 3 → Kbar (d := 3) alg))
  have hι : Function.Injective ι := by
    rintro ⟨a, b⟩ ⟨a', b'⟩ h
    simp only [ι, LinearMap.prodMap_apply, Prod.mk.injEq, LinearMap.id_apply] at h
    exact Prod.ext (Subtype.ext h.1) h.2
  have hr : LinearMap.range ι = (LinearMap.range (Lq (d := 3) alg)).prod ⊤ := by
    apply le_antisymm
    · rintro _ ⟨⟨a, b⟩, rfl⟩
      exact ⟨a.2, Submodule.mem_top⟩
    · rintro ⟨y, q⟩ ⟨hy, -⟩
      exact ⟨(⟨y, hy⟩, q), rfl⟩
  rw [← hr, LinearMap.finrank_range_of_inj hι, Module.finrank_prod, Module.finrank_pi_fintype]
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul]
  omega

/-- **Folgerung A1** (prose Section 3, first half): in the cases (3,6), (4,7), (5,8), `Φ` maps
onto `im L × Q³`: for every `y ∈ im L` and `q ∈ Q³` there is `(u, c)` with
`Φ(u, c) = (y, q)`. -/
theorem corollaryA1 (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (hcase : finrank K (LinearMap.range (Hq (d := 3) alg)) =
      finrank K (LinearMap.range (Lq (d := 3) alg)) + 3) :
    LinearMap.range (Φ (d := 3) alg) =
      (LinearMap.range (Lq (d := 3) alg)).prod ⊤ := by
  have hle : LinearMap.range (Φ (d := 3) alg) ≤ (LinearMap.range (Lq (d := 3) alg)).prod ⊤ := by
    rintro _ ⟨x, rfl⟩
    exact ⟨⟨x.1, rfl⟩, Submodule.mem_top⟩
  apply Submodule.eq_of_le_of_finrank_eq hle
  rw [finrank_range_Φ alg h1, finrank_imL_prod alg h1]
  omega

/-- The cases (3,6), (4,7), (5,8) of Satz A are exactly those with `rk H = rk L + 3`. -/
theorem cases_A1_iff (a b : ℕ)
    (h : (a, b) = (3, 6) ∨ (a, b) = (4, 7) ∨ (a, b) = (5, 7) ∨ (a, b) = (5, 8)) :
    b = a + 3 ↔ ((a, b) = (3, 6) ∨ (a, b) = (4, 7) ∨ (a, b) = (5, 8)) := by
  rcases h with h | h | h | h <;> obtain ⟨rfl, rfl⟩ := Prod.mk.inj h <;> decide

/-! ## Folgerung A2 -/

/-- `Ĵ = Ψ(K⁴, U) = J + f_1(U) + f_2(U) + f_3(U)` (prose Section 2). -/
def JHat {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) : Submodule K (Fin r → K) :=
  ⨆ i : Fin (d + 1), LinearMap.range (φ alg i)

theorem JHat_le_ker {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    JHat alg ≤ LinearMap.ker (W alg) :=
  iSup_le fun i => by
    rintro _ ⟨y, rfl⟩
    exact φ_mem_ker alg i y

theorem J_le_JHat {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) : J alg ≤ JHat alg :=
  le_iSup (fun i : Fin (d + 1) => LinearMap.range (φ alg i)) 0

/-- `im L = Ĵ / J` (prose Section 2: `im L = (∑_{i ≥ 1} f_i(U) + J) / J = Ĵ / J`). -/
theorem map_JHat_eq_range_Lq {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    (JHat alg).map (π alg) = LinearMap.range (Lq alg) := by
  apply le_antisymm
  · rw [JHat, Submodule.map_iSup]
    refine iSup_le fun i => ?_
    rintro _ ⟨_, ⟨y, rfl⟩, rfl⟩
    rcases Fin.eq_zero_or_eq_succ i with rfl | ⟨j, rfl⟩
    · rw [π_φ0]
      exact Submodule.zero_mem _
    · refine ⟨Pi.single j y, ?_⟩
      rw [Lq_apply, ell_apply, Finset.sum_eq_single j]
      · simp
      · intro k _ hk; simp [Pi.single_apply, hk]
      · simp
  · rintro _ ⟨u, rfl⟩
    rw [Lq_apply]
    refine Submodule.mem_map_of_mem ?_
    rw [ell_apply]
    exact Submodule.sum_mem _ fun i _ =>
      (le_iSup (fun i : Fin (d + 1) => LinearMap.range (φ alg i)) i.succ) ⟨u i, rfl⟩

/-- `dim Ĵ = rk L + m` (prose Section 2: `rk L = dim Ĵ − 4`). -/
theorem finrank_JHat {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) (h1 : SN1 alg) :
    finrank K (JHat alg) = finrank K (LinearMap.range (Lq alg)) + m := by
  have h := YangN3Teil3.finrank_map_mkQ_add (JHat alg) (J alg) (J_le_JHat alg)
  rw [finrank_J alg h1] at h
  have hm : (JHat alg).map (J alg).mkQ = LinearMap.range (Lq alg) := map_JHat_eq_range_Lq alg
  rw [hm] at h
  omega

/-- **Folgerung A2** (prose Section 3): if `rk L = 5`, then `Ĵ = ker W`; in particular all
vectors `g(x)`, `x ∈ U`, lie in `Ĵ`. -/
theorem corollaryA2 (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (hL : finrank K (LinearMap.range (Lq (d := 3) alg)) = 5) :
    JHat (d := 3) alg = LinearMap.ker (W (d := 3) alg) ∧
      ∀ y : Fin 4 → K, gU (d := 3) alg y ∈ JHat (d := 3) alg := by
  have hJ := finrank_JHat (d := 3) alg h1
  have hW := G3 (d := 3) alg
  have heq : JHat (d := 3) alg = LinearMap.ker (W (d := 3) alg) :=
    Submodule.eq_of_le_of_finrank_eq (JHat_le_ker alg) (by omega)
  refine ⟨heq, fun y => ?_⟩
  rw [heq]
  exact gU_mem_ker alg y

/-! ## Lemma 13′ applied: the table of prose Section 4 and the common kernel -/

/-- **Application table of Lemma 13′** (prose Section 4): for a normalized decomposition of
length 25 and a maximiser `γ` of `rk(∑ γ_i F_i)`, `s = dim ∑_i F_i(ker ∑ γ_j F_j)` is `0` in
the cases (3,6), (4,7), (5,7) and at most `1` in the case (5,8). -/
theorem sDim_table (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (γ : Fin 3 → K)
    (hγ : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) (rkComb (Fq (d := 3) alg) γ)) :
    (((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7)) →
      Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) = 0) ∧
    Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) ≤ 1 := by
  set ρ := rkComb (Fq (d := 3) alg) γ with hρdef
  obtain ⟨hρ3, -, hcases⟩ := satzA alg h1 h2 ρ hγ
  have h := lemma13Prime_statement K (Fin 4 → K) ((Fin 25 → K) ⧸ J (d := 3) alg)
    inferInstance inferInstance (Fq alg) ρ hγ γ rfl
  have hs : finrank K (⨆ i, (LinearMap.ker (∑ j, γ j • Fq (d := 3) alg j)).map
      (Fq (d := 3) alg i) : Submodule K _) =
      Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) := rfl
  rw [hs] at h
  have hL : finrank K (LinearMap.range (sumMap (Fq (d := 3) alg))) =
      finrank K (LinearMap.range (Lq (d := 3) alg)) := rfl
  have hH : finrank K (LinearMap.range (skewExt (sumMap (Fq (d := 3) alg)))) =
      finrank K (LinearMap.range (Hq (d := 3) alg)) := rfl
  rw [hL, hH] at h
  simp only [Prod.mk.injEq] at hcases
  constructor
  · intro hc
    simp only [Prod.mk.injEq] at hc
    omega
  · omega

/-- **Common kernel** (prose Section 4, table, and Section 7): in the cases (3,6), (4,7),
(5,7) of Satz A, the maps `F_1, F_2, F_3` of a normalized
decomposition of length 25 have a common kernel vector: `N ≠ 0`. -/
theorem exists_common_kernel (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg)
    (hcase : ((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7))) :
    ∃ x : Fin 4 → K, x ≠ 0 ∧ ∀ i, Fq (d := 3) alg i x = 0 := by
  obtain ⟨ρ, hρ⟩ := exists_isGreatest_rkComb (Fq (d := 3) alg)
  obtain ⟨γ, hγ⟩ := hρ.1
  have hγ' : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) (rkComb (Fq (d := 3) alg) γ) := by
    rw [hγ]; exact hρ
  have hs := (sDim_table alg h1 h2 γ hγ').1 hcase
  obtain ⟨hρ3, -⟩ := satzA alg h1 h2 ρ hρ
  refine Lemma13Prime.exists_common_kernel_of_sDim_eq_zero _ _ ?_ hs
  have : finrank K (LinearMap.range (∑ i, γ i • Fq (d := 3) alg i)) = ρ := hγ
  rw [this, Module.finrank_fin_fun]
  omega

end SatzA

end SatzA444
end YangBounds

/-! ## Axiom check (output appears in the build log) -/

#print axioms YangBounds.Lemma13Prime.lemma13Prime
#print axioms YangBounds.SatzA444.lemma13Prime_statement
#print axioms YangBounds.SatzA444.satzA
#print axioms YangBounds.SatzA444.satzA_statement
#print axioms YangBounds.SatzA444.satzA_exists
#print axioms YangBounds.SatzA444.satzA_global
#print axioms YangBounds.SatzA444.corollaryA1
#print axioms YangBounds.SatzA444.corollaryA2
#print axioms YangBounds.SatzA444.sDim_table
#print axioms YangBounds.SatzA444.exists_common_kernel
