# S2-23: Prüfung von B-013 (Lemma P und Satz E, Fall (5,8) für ⟨4,2,4⟩ bei Länge 25)

- Auftrag: S2-23 (Stufe 2, Runde 6, Spur A), Rolle Prüfer
- Datum: 25.11.2026
- Behauptung: `behauptungen/B-013.md`
- Artefakt: `lean/prosa/s2_444_spurA_r4.md` (S2-16, PR 47), Abschnitte 2, 4 (Folgerung C2) und 5.1 bis 5.4. Bezeichnungen aus `lean/prosa/s2_444_spurA_r2.md` und `lean/prosa/yang_n4.md`. Lean-Bestand: `lean/YangBounds/SatzA444.lean` (corollaryA2, finrank_JHat, sDim_table, Lemma13Prime).
- Gelesen habe ich nur Protokoll, CLAUDE.md, Behauptung, Artefakt, die beiden Grundlagenberichte und den Lean-Bestand. Keine früheren Prüfberichte, keine Prüfvermerke, nicht LOG.md. Die in S2-16 zitierte Fassung V′ von Lemma V (aus dem Prüfbericht S2-09) habe ich deshalb nicht gelesen; Abschnitt 2 zeigt, dass sie für Satz E nicht gebraucht wird.
- Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter, Bridge, Batch, Denkstufe high). Es bekam Behauptung, Artefakt, beide Grundlagenberichte und SatzA444.lean wörtlich und ungekürzt, ohne mein Urteil (`versuche/s2-23-pruefung/gpt_auftrag.md`, Antwort `gpt_antwort.md`). Ergebnis in Abschnitt 7.
- Eigene Rechnungen: `versuche/s2-23-pruefung/` (Python, exakte Arithmetik in endlichen Körpern, keine Gleitkommazahlen).
- Status von B-013 bleibt **behauptet**. Ein Prosa-Beweis kann nach Protokoll 5.1 nicht geprüft werden.

---

## 1. Urteil in Kürze

| Teil | Frage | Urteil |
|---|---|---|
| 1 | Erzwingt (5,8) s = 1 und Nicht-Symmetrie? | **hält mit benannter Reparatur** (R1: V′ durch Lemma V plus Halbstetigkeit ersetzen). Nicht-Symmetrie folgt nur mit Satz C (B-012). |
| 2 | Ist die Teilung in Unterfall A und B vollständig? | **hält mit benannter Reparatur** (R2: ein Satz zum Gradargument in Lemma P Schritt 2; R2b: Begründung der Blockzählung in Schritt 4) |
| 3 | Ist Unterfall A ausgeschlossen (Satz E)? | **hält** (R3, R4 sind Klarstellungen ohne neue Idee) |
| 4 | Ist die Lücke in Unterfall B (5.4) richtig beschrieben? | **richtig verortet, mit zwei Korrekturen der Darstellung** (Abschnitt 5). Das Fremdmodell schlägt einen Schluss vor, der die Lücke schließt; ich habe ihn nachvollzogen und keinen Fehler gefunden (Abschnitt 7.2). Das ist eine **neue Behauptung**, nicht Teil von B-013. |

Satz E selbst hängt nicht von Satz C ab: Er setzt Nicht-Symmetrie an der Stelle p voraus. Satz C wird nur gebraucht, um aus „Fall (5,8)“ auf „nicht symmetrisch auf einer offenen Menge von p“ zu schließen (Folgerung C2), also für die Aussage „vom Fall (5,8) bleibt nur Unterfall B“.

Ich habe kein Gegenbeispiel gefunden. Die eigenen Rechnungen (Abschnitt 6) bestätigen die drei rechnerisch prüfbaren Schritte A3, A4, A8 und die Schnittzahl aus 5.4.

---

## 2. Teil 1: s = 1 und Nicht-Symmetrie im Fall (5,8)

**Schritt C2a (Nicht-Symmetrie auf offener Menge).** Die Menge S der zulässigen p, an denen eine invertierbare M mit M b_t(p) ∈ K·a_t(p) für alle t existiert, ist die Projektion der konstruierbaren Menge {(p, M) : det M ≠ 0, alle 2×2-Minoren von [M b_t(p) | a_t(p)] verschwinden}. Nach Chevalley ist S konstruierbar. Ist S dicht in der (irreduziblen) Menge der zulässigen p, so enthält S eine nichtleere offene Menge, und das ist genau die Voraussetzung von Satz C. Sonst ist das Komplement des Abschlusses von S eine nichtleere offene Menge P_ns. Der Schluss ist richtig. **Er braucht Satz C (B-012).** Ohne Satz C bleibt eine Zerlegung, die auf einer offenen Menge von p symmetrisch ist, im Fall (5,8) übrig.

Zusätzlich muss P_ns mit der offenen Menge geschnitten werden, auf der (rk L, max rk H) = (5,8) gilt. rk L(p) = dim span{a_t(p) ⊗ b_t(p)} − 4 nimmt seinen größten Wert auf einer offenen dichten Menge an; zwei nichtleere offene Mengen der irreduziblen Menge K² schneiden sich. Das steht in C2 nicht ausdrücklich, ist aber Routine.

**Schritt C2b (N(u_0) = 0).** S2-16 zitiert V′ aus S2-09 für die Aussage „N(u_0) = 0 für **jedes** zulässige u_0“. Für Lemma P und Satz E wird nur „für generisches u_0“ gebraucht, und das folgt ohne V′:

- x ∈ N(u_0) heißt: Für j = 0, …, 3 gibt es y_j ∈ U mit Ψ(e_j, x) = Ψ(u_0, y_j). Das ist ein lineares Gleichungssystem in (x, y_0, …, y_3) mit Koeffizienten, die polynomial in u_0 sind. Da Ψ(u_0, ·) injektiv ist (Ψ1), ist die Projektion der Lösungsmenge auf x injektiv, also dim N(u_0) = dim(Lösungsraum). „dim ≥ 1“ ist ein Rangabfall, also Zariski-abgeschlossen in u_0.
- Ist N(u_0) ≠ 0 für alle u_0 aus einer dichten Teilmenge von O_p, dann für alle u_0 ∈ O_p, und Lemma V (S2-05 Abschnitt 5) mit (a) aus ρ = 3 und (b) liefert Symmetrie an der Stelle p, im Widerspruch zu p ∈ P_ns.
- Also ist N(u_0) = 0 auf einer offenen dichten Teilmenge von O_p.

**Reparatur R1:** In Folgerung C2 „nach V′: N(u_0) = 0 für jedes zulässige u_0“ ersetzen durch „nach Lemma V und der Abgeschlossenheit von {u_0 : N(u_0) ≠ 0}: N(u_0) = 0 für u_0 aus einer offenen dichten Teilmenge von O_p“. Abschnitt 5 von S2-16 setzt ohnehin „u_0 zulässig und generisch“ voraus. Danach hängt B-013 nicht mehr an V′.

*Kürzere Alternative (vom Fremdmodell, von mir nachgerechnet):* Ist 0 ≠ x_0 ∈ N(u_0) für ein einziges zulässiges u_0, so definiert Ψ(u, x_0) = Ψ(u_0, Gu) eine lineare, injektive, also invertierbare Abbildung G : K⁴ → U (aus Gu = 0 folgt Ψ(u, x_0) = 0, also u = 0). Koordinate t: (a_t·u)(b_t·x_0) = (a_t·u_0)(b_t·Gu) für alle u, also b_t∘G = ((b_t·x_0)/(a_t·u_0))·a_t, und b_t∘G ≠ 0. Das ist Symmetrie an der Stelle p. Damit gilt N(u_0) = 0 sogar für **jedes** zulässige u_0, wie in C2 behauptet, ohne V′ und ohne Lemma V.

**Schritt C2c (s = 1).** Für jedes γ mit rk F_γ = 3 = ρ ist γ ein Maximierer, und `SatzA444.sDim_table` (zweiter Teil, ohne Fallvoraussetzung) gibt s(γ) ≤ 1, mit s(γ) := dim Σ_i F_i(ker F_γ). Das ist genau die Größe, die Lemma P benutzt: der Rang der Abbildung δ ↦ F_δ k(γ) (der Summand F_γ k(γ) = 0 trägt nichts bei). s(γ) = 0 hieße F_i k(γ) = 0 für alle i, also k(γ) ∈ N(u_0) = 0. Also s(γ) = 1. Die Lean-Aussage sagt das, was gebraucht wird; die Folgerung „s = 0 ⇒ gemeinsamer Kern“ steht als `Lemma13Prime.exists_common_kernel_of_sDim_eq_zero` im Bestand (benutzt in `exists_common_kernel`). Hinweis: `sDim_table` ist für eine normalisierte Zerlegung formuliert, also für ein festes zulässiges (u_0, p) nach Basiswechsel. Das passt zu Lemma P, das u_0 und p festhält.

**Ergebnis Teil 1:** hält mit Reparatur R1. Abhängigkeiten: B-008 (Satz A: ρ = 3, (5,8)), Lemma 13′ (geprüft in Lean über `sDim_table`), Lemma V aus S2-05 (Teil von B-009, Symmetrie-Teil dort), und für die Nicht-Symmetrie B-012.

---

## 3. Teil 2: Lemma P und die Vollständigkeit der Unterfälle

**(1)** dim D(γ) = 2 folgt aus s(γ) = 1. Für γ′ auf der Geraden ℙ(D(γ)) mit rk F_{γ′} = 3 gilt k(γ) ∈ ker F_{γ′} = K·k(γ′). Solche γ′ sind generisch auf der Geraden, weil die Gerade den Punkt γ mit Rang 3 enthält, also nicht ganz im Entartungsort {rk ≤ 2} liegt. Richtig.

**(2)** Γ := Abschluss des Bildes der rationalen Abbildung γ ↦ [D(γ)] ∈ ℙ²* (D(γ) ist Kern einer Matrix, deren Einträge rational in γ sind). Γ ist irreduzibel. Γ ist kein Punkt (sonst lägen alle generischen γ auf einer Geraden) und nicht zweidimensional (die Faser über [D(γ)] enthält eine offene Teilmenge einer Geraden). Also ist Γ eine Kurve. Das Gradargument ist richtig, braucht aber einen Satz mehr, als dasteht:

- Das Bild der offenen Menge G der „guten“ γ ist konstruierbar und dicht in Γ, also enthält es eine offene dichte Teilmenge von Γ. Der Rest Γ_schlecht ist endlich.
- Für generisches γ ist die duale Gerade γ* eine generische Gerade in ℙ²*. Sie trifft Γ in deg Γ verschiedenen Punkten (auch in Charakteristik p: Die Geraden, die Γ an einem glatten Punkt berühren oder durch einen singulären Punkt gehen, bilden eine echte abgeschlossene Teilmenge; das gilt auch für „seltsame“ Kurven in Charakteristik p, deren Tangenten alle durch einen Punkt gehen, solange Γ keine Gerade ist) und meidet die endliche Menge Γ_schlecht.
- Jeder dieser Schnittpunkte ist also [D(γ_i)] mit γ_i ∈ G, und γ ∈ ℙ(D(γ_i)). Mit (1) folgt D(γ) = D(γ_i) für alle i, also deg Γ = 1.

**Reparatur R2:** In Schritt (2) den Satz ergänzen „eine generische Gerade meidet die endlich vielen Punkte von Γ, die nicht von der Form [D(γ′)] mit gutem γ′ sind“. Ohne ihn ist nicht gesagt, warum jede der deg Γ Geraden durch γ eine echte Gerade der Familie ist.

**(3)** In der Basis mit γ* = e_3 ist D(γ) = span(γ, e_3), also hängt k(γ) nur von λ = (γ_1 : γ_2) ab. Die rationale Abbildung λ ↦ [k_λ] von ℙ¹ nach ℙ(U) setzt sich zu einem Morphismus fort (glatte Kurve), und die Gleichungen F_3 k_λ = 0, (λ_1F_1 + λ_2F_2)k_λ = 0 sind abgeschlossen, gelten also für alle λ. k_λ konstant ⇒ F_1k = F_2k = F_3k = 0 ⇒ k ∈ N = 0. dim K* = 4 ⇒ F_3 = 0, also f_3(U) ⊆ f_0(U) in der Normalform mit u_3 = u*; das widerspricht Lemma 9 (yang_n4.md) mit S = U. Ebenso ist rk F_3 ≥ 1. Richtig.

**(4)** Kronecker-Form des 5 × dim K*-Bündels P(λ) = (λ_1F_1 + λ_2F_2)|_{K*}. Ich habe die Fallanalyse nachgezählt:

- Für generisches λ ist ker P(λ) ⊆ ker F_γ|_{K*} = K·k_λ (weil F_3|_{K*} = 0 und rk F_γ = 3). Also hat das Bündel genau **einen** Block L_ε (die Anzahl der L-Blöcke ist die generische Kerndimension). ε = 0 (Nullspalte) wäre ein gemeinsamer Kern, also ε ≥ 1.
- Die Kernvektoren eines L_ε-Blocks spannen ε + 1 Dimensionen auf; Spalten in L_η^T-Blöcken oder regulären Blöcken tragen zum generischen Kern nichts bei. Da die k_λ ganz K* aufspannen, ist ε + 1 = dim K*, und es gibt keine weiteren Spalten. Übrig sind nur Nullzeilen (L_0^T).
- dim K* = 2: ein L_1-Block (eine Zeile), Bild in einer festen Geraden K·q, q ≠ 0. dim K* = 3: ein L_2-Block (zwei Zeilen), Bild in festem Q_2, dim 2. Mit F_3(K*) = 0: rk F_3 ≤ 1, also = 1.

Die Fallunterscheidung ist vollständig, ein dritter Fall bleibt nicht.

**Reparatur R2b:** S2-16 begründet Schritt (4) mit „k_λ spannt drei Dimensionen auf, ist als Polynom in λ also vom Grad 2“. Das ist so kein Schluss. Die Begründung muss wie oben lauten: genau ein L-Block (generischer Kern eindimensional, weil ker P(λ) ⊆ ker F_γ), dessen ε + 1 Spalten ganz K* ausfüllen. Das Fremdmodell beanstandet dieselbe Stelle mit derselben Reparatur.

Zu Schritt (2) gibt das Fremdmodell zusätzlich einen elementaren Beweis ohne duale Kurve (Abschnitt 7), der für eine Lean-Fassung besser geeignet ist.

**Ergebnis Teil 2:** hält mit Reparaturen R2 und R2b.

---

## 4. Teil 3: Satz E (Unterfall A ist unmöglich)

**(A2)** Für x ∈ K* und u = γ_0 u_0 + Σ γ_i u_i ist Ψ(u, x) = γ_0 Ψ(u_0, x) + (Urbild von F_γ(x)) ∈ J + K·q̂. Also V_5 := span Ψ(K⁴, K*) ⊆ J + K·q̂, und dim(J + K·q̂) = 5, weil q ≠ 0 in Q = ker W / J. Lemma 8 (yang_n4.md) mit S = K* ⊆ U ⊆ K^{2×4} gibt dim Σ_i f_i(K*) ≥ 2 + 3 = 5, und Σ_i f_i(K*) = span Ψ(K⁴, K*). Also V_5 = J + K·q̂ ⊇ J. Lemma 8 setzt (N1), (N2) für die Normalform zu (u_0, p) voraus; die gelten für zulässiges u_0. Richtig. (q̂ ∈ ker W ist richtig; dass ker W = Ĵ ist, steht in `SatzA444.corollaryA2`, wird hier aber nicht einmal gebraucht.)

**(A3)** Das Bündel x ↦ Ψ(·, x)|: K⁴ → V_5, x ∈ K* ≅ K², besteht aus 5×4-Matrizen, die nach (Ψ1) für jedes x ≠ 0 über K̄ injektiv sind. Kronecker: keine L_ε-Blöcke (auch keine Nullspalten), keine regulären Blöcke (ihre Determinante ist eine binäre Form positiven Grades und hat über K̄ eine Nullstelle), also nur L_η^T-Blöcke mit Σ η_i = 4 Spalten und Σ(η_i + 1) = 5 Zeilen, also genau ein Block L_4^T. L_4^T ist die Multiplikation S³ × S¹ → S⁴ in Monombasen. Die Kronecker-Form gilt über jedem algebraisch abgeschlossenen Körper, jede Charakteristik. Richtig. Rechnerisch bestätigt (Abschnitt 6, `kronecker.py`).

**(A4)** Die Matrix der Bilinearform (f, l) ↦ λ_t(f·l) in den Monombasen s^{3−i}t^i und s^{1−j}t^j ist (h_{i+j}) mit h_k = λ_t(s^{4−k}t^k); Binomialkoeffizienten treten nicht auf. Eine 4×2-Hankel-Matrix hat genau dann Rang ≤ 1, wenn h = 0 oder h = c·(α^{4−k}β^k)_k: Ist die erste Spalte ≠ 0 und die zweite ein Vielfaches r davon, dann h_{k+1} = r h_k und h_0 ≠ 0 (sonst wäre die erste Spalte 0), also Auswertung in (1 : r); symmetrisch mit vertauschten Spalten, und der Fall h = (0,0,0,0,h_4) ist der Punkt im Unendlichen. Gilt in jeder Charakteristik. Erschöpfend nachgezählt über GF(2), GF(3), GF(4), GF(5), GF(7), GF(8), GF(9) (`hankel.py`). Richtig.

**(A5)** J ⊆ V_5 = Λ(S⁴). Ist λ_t = 0, so verschwindet Koordinate t auf V_5 ⊇ J, also (a_t·u_0)(b_t·y) = 0 für alle y, mit (N1) b_t = 0, Widerspruch (b_t ≠ 0, weil kein Term überflüssig ist, B-007). Richtig.

**(A6)** Aus (a_t·u)(b_t·x) = c_t f_u(σ_t) ι(x)(σ_t) auf K⁴ × K*: Die rechte Seite ist ein Produkt zweier von null verschiedener Linearformen (Auswertung auf S³ bzw. S¹ ist ≠ 0, c_t ≠ 0). Also ist auch b_t|_{K*} ≠ 0, und die Faktoren sind einzeln proportional: a_t ∝ α(σ_t). **Klarstellung R3:** Der Schluss braucht, dass b_t auf K* nicht verschwindet; das folgt aus c_t ≠ 0, sollte aber dastehen. α ist die Komposition von φ⁻¹ mit der Momentenkurve vom Grad 3, also eine verdrehte Kubik (in jeder Charakteristik eine Einbettung).

**(A7)** Für y ∈ U ist Ψ(u_0, y) ∈ J ⊆ V_5, also = Λ(h_y) mit y ↦ h_y linear und injektiv (Ψ(u_0, ·) injektiv, Λ Isomorphismus). Koordinate t: (a_t·u_0)(b_t·y) = c_t h_y(σ_t), also b_t = (c_t / (a_t·u_0)) β(σ_t). Richtig.

**(A8)** Die Koordinaten von α(σ) ⊗ β(σ) sind binäre Formen vom Grad 3 + 4 = 7, also liegt span{α(σ) ⊗ β(σ) : σ ∈ ℙ¹} in einem Raum der Dimension ≤ 8. Und dim span{a_t ⊗ b_t} = dim Ĵ: Ĵ ist das Bild von X ↦ (a_tᵀ X b_t)_t, dessen Rang die Dimension des Spanns der Funktionale a_t ⊗ b_t ist (Zeilenrang = Spaltenrang). `SatzA444.finrank_JHat` gibt dim Ĵ = rk L + 4 = 9. Widerspruch. Richtig. **Klarstellung R4:** Die Gleichung dim Ĵ = dim span{a_t ⊗ b_t} steht nicht in Lean; sie ist eine Zeile lineare Algebra, braucht aber in einer Lean-Fassung einen eigenen Hilfssatz (Abschnitt 8).

**Abhängigkeiten von Satz E:** nur Lemma P (also s = 1 und N = 0 für generisches u_0), (Ψ1) = Folgerung 7, Lemma 8, (N1), dim Ĵ = 9. Nicht von Satz C, nicht von V′, nicht von Satz B außer über Satz A (Fall (5,8)).

**Körperannahmen.** Alles läuft über dem algebraischen Abschluss K̄ (Lemma R1), Lemma 9 braucht ihn, Kronecker braucht ihn für die regulären Blöcke. Kleine endliche Grundkörper sind damit abgedeckt, da nur K̄ gebraucht wird. Charakteristik 2 und 3: Keine Division, keine Binomialkoeffizienten in A4, Gradargument in Lemma P Schritt 2 gilt mit R2 in jeder Charakteristik. Ich habe keine Stelle gefunden, die in kleiner Charakteristik versagt.

**Ergebnis Teil 3:** hält.

---

## 5. Unterfall B und Vermutung B (Abschnitt 5.3 und 5.4)

**5.3 (B1), (B2)** sind die gespiegelten Schritte A3 bis A5 für das Bündel u ↦ Ψ(u, ·)|_U, u ∈ D = span(u_0, u*): dim Ψ(D, U) = 4 + rk F_{u*} = 5 = 2 + 4 − 1, nichtsingulär, also L_4^T, und c′_t ≠ 0 wegen a_t·u_0 ≠ 0. Richtig.

**5.3 (B3)** Die Transponierte (A_t, B_t, C_t) ↦ (B_tᵀ, A_tᵀ, C_tᵀ) hat an der Stelle p′ = Jp die Vektoren a′_t = b_t(p), b′_t = −a_t(p) (nachgerechnet: a′_t(p′) = B_tᵀ J p = b_t(p), b′_t(p′) = A_t J J p = −a_t(p)). Also sind die Punktmengen dieselben mit vertauschten Rollen, dim Ĵ ist gleich, und Nicht-Symmetrie an p ist Nicht-Symmetrie der Transponierten an Jp. Die offenen Mengen P_ns und J⁻¹P′_ns schneiden sich. Richtig.

**5.4.** Die Beschreibung der Lücke ist richtig. Im Einzelnen:

- σ_t = π_D(a_t), und auf der Kubik der a_t ist π_D (Projektion von der Geraden D^⊥ aus) ein Morphismus vom Grad d_D = 3 − (Schnittvielfachheit von D^⊥ mit der Kubik) ∈ {1, 2, 3}. a_t liegt nie auf D^⊥, weil a_t·u_0 ≠ 0.
- Der Graph einer Abbildung vom Grad d und der transponierte Graph einer Abbildung vom Grad e schneiden sich in ℙ¹ × ℙ¹ in d·e + 1 Punkten (mit Vielfachheit), außer sie fallen zusammen (dann d = e = 1). Das ist die Anzahl der Fixpunkte von ψ∘φ. Mindestens 9 verschiedene Paare (τ_t, σ_t) folgen aus dim span{a_t ⊗ b_t} = 9. Also d·e + 1 ≥ 9, und wegen d, e ≤ 3 bleibt nur d = e = 3 (d·e = 8 ist unmöglich). Richtig; die Schnittzahl ist in `gradzahl.py` an Zufallsabbildungen nachgezählt.
- **Korrektur 1 (Darstellung):** Der Satz „Dazu kommt: Die Kubiken und ihre Parameter müssen für verschiedene enge Paare D dieselben sein“ beschreibt keine zusätzliche Lücke des Bigradarguments. Für das Argument genügen **ein** enges Paar D (für die b-Seite) und **ein** enges Paar E der Transponierten (für die a-Seite): σ_t = π_D(α_E(τ_t)) und τ_t = π_E(β_D(σ_t)), beide mit festen Daten. Die Unabhängigkeit von D braucht erst der vorgeschlagene Weg über die Variation von u_0.
- **Korrektur 2 (Darstellung):** Im Fall „Graphen fallen zusammen“ (d = e = 1) ist die Zerlegung an der Stelle p selbst symmetrisch (b_t ∝ G a_t, weil zwei verdrehte Kubiken mit Möbius-verwandten Parametern sich um ein G ∈ GL_4 unterscheiden). Das widerspricht schon p ∈ P_ns; Satz C wird dafür nicht gebraucht. Vermutung B hängt also, anders als dort formuliert, nur über C2 an Satz C.
- Was vom Fall (5,8) übrig bleibt, ist damit genau: nicht symmetrisch, s = 1, Unterfall B für Zerlegung und Transponierte, und für jedes Paar (D, E) Projektionsgrad d_D = e_E = 3 mit mindestens 9 und höchstens 10 verschiedenen Paaren (τ_t, σ_t) auf beiden Graphen. Das ist vollständig beschrieben; Vermutung B selbst ist **vermutet**, nicht gezeigt.

---

## 6. Eigene Rechnungen (exakt)

In `versuche/s2-23-pruefung/` (eigener Code, keine fremden Quellen). Aufrufe aus diesem Ordner: `python3 hankel.py`, `python3 kronecker.py`, `python3 gradzahl.py`. Laufzeit zusammen unter 5 Sekunden auf einem Kern.

| Datei | Prüft | Ergebnis |
|---|---|---|
| `hankel.py` | A4: Hankel 4×2 vom Rang ≤ 1 ⇔ 0 oder c·ev_σ | erschöpfend über GF(2), GF(3), GF(4), GF(5), GF(7), GF(8), GF(9): beide Mengen gleich, je 1 + (q−1)(q+1) Elemente |
| `kronecker.py` | A3: nichtsinguläres 5×4-Bündel ⇒ ein L_4^T-Block | GF(10007): 300 Zufallsbündel, Nichtsingularität über dem Abschluss per ggT der 4×4-Minoren entschieden, alle mit minimalem Linkskern-Grad 4 (eindimensional). Gegenprobe L_3^T ⊕ regulärer Block: singulär, Grad 3. GF(7): 5 nichtsinguläre Bündel, genau p + 1 Funktionale vom Rang ≤ 1 (projektiv), wie die Normalform verlangt |
| `gradzahl.py` | A8 und 5.3, 5.4 | Modell von Unterfall A (α Grad 3, β Grad 4, 25 Punkte): dim span{a_t ⊗ b_t} = 8 in 20 von 20 Läufen. Analogon S³ × S² → S⁵: 9. Fixpunkte von ψ∘φ: nie mehr als d·e + 1 |

Gegenbeispielsuche: Die Schritte A2 bis A8 sind zwingend; ein Gegenbeispiel müsste eine der Voraussetzungen verletzen (Nichtsingularität über K̄, (N1), b_t ≠ 0). Die Modelle M3 und K(0,1,2,5) aus S2-05 (rk L = 5) sind symmetrisch und fallen nicht unter Satz E. Echte Zerlegungen der Länge 25 gibt es nicht als Daten. Ein Gegenbeispiel habe ich nicht gefunden.

---

## 7. Fremdmodell

GPT 6.2 Sol, Batch, Denkstufe high. Auftrag und vollständige Antwort: `versuche/s2-23-pruefung/gpt_auftrag.md`, `gpt_antwort.md`.

### 7.1 Urteil des Fremdmodells

| Teil | Urteil GPT 6.2 Sol | Übereinstimmung mit mir |
|---|---|---|
| Folgerung C2 | hält mit benannter Reparatur (V′ durch direkte Koordinatenrechnung ersetzen) | ja; seine Reparatur ist kürzer als R1 und zeigt die stärkere Aussage, ich habe sie übernommen (Abschnitt 2) |
| Lemma P | hält mit benannter Reparatur (Schritt 2 Abschluss und Bild unterscheiden, Schritt 4 Blockzählung begründen) | ja, deckt sich mit R2 und R2b |
| Satz E (A2 bis A8) | hält | ja |
| 5.3, 5.4 | hält mit Reparatur, und der offene Fall d = e = 3 lässt sich schließen | Beschreibung der Lücke: ja. Zum Schließen siehe 7.2 |
| Abhängigkeit von Satz C | Satz E ist von Satz C unabhängig, Satz C nur für die Nicht-Symmetrie in C2 | ja |
| Lean | `corollaryA2` liefert J ⊆ V_5 nicht (braucht es auch nicht), `sDim_table` gibt s ≤ 1, nicht s = 1; Kronecker und Chevalley sollten elementar umgangen werden | ja, siehe Abschnitt 8 |

Gesamturteil des Fremdmodells wörtlich: „B-013 hält mit den benannten Reparaturen, Satz E ist lokal unabhängig von Satz C, und die ergänzte Variation aus § 5.4 schließt unter den gesetzten Voraussetzungen auch Unterfall B aus; eine Lean-Verifikation dieser neuen Schritte liegt nicht vor.“

Damit haben Prüfer und Fremdmodell unabhängig bestätigt, dass Lemma P und Satz E mit den benannten Reparaturen halten.

### 7.2 Der Vorschlag des Fremdmodells zu Unterfall B (neue Behauptung, nicht Teil von B-013)

Das Fremdmodell schließt den in 5.4 offenen Fall d = e = 3 so (Kurzfassung, Wortlaut in `gpt_antwort.md`, Teil II.4):

1. Fixiere ein enges Paar D (b-Seite) und eines E der Transponierten (a-Seite). Die Paare (τ_t, σ_t) liegen auf dem Graphen von φ_D (σ = φ_D(τ)) und dem transponierten Graphen von ψ_E (τ = ψ_E(σ)). Also bestimmt τ_t das σ_t und umgekehrt, und aus ≥ 9 verschiedenen Paaren folgen ≥ 9 verschiedene a-Punkte und ≥ 9 verschiedene b-Punkte.
2. Zwei verdrehte Kubiken mit 7 gemeinsamen Punkten sind gleich (die Quadriken der einen schneiden auf der anderen Formen vom Grad 6 aus). Also hängt die Kubik der b_t nicht von D ab. Man fixiert eine Parametrisierung jeder Kubik.
3. In festen Parametern stimmen φ_D und φ_{D′} für zwei enge Paare an ≥ 9 Stellen τ_t überein. Ihre Kreuzdifferenz ist eine binäre Form vom Grad ≤ 6, also null: φ_D hängt nicht von D ab.
4. Im nicht symmetrischen Fall hat φ := φ_D Grad 3. Über die Identifikation K⁴ ≅ S³ (u ↦ (τ ↦ α(τ)·u)) ist φ = m_D ∘ [f_{d_1} : f_{d_2}] mit einer Basis d_1, d_2 von D und einer Möbius-Abbildung m_D. Bei Grad 3 sind f_{d_1}, f_{d_2} teilerfremd, und span(f_{d_1}, f_{d_2}) ist der Spann der Komponenten von φ, unabhängig von m_D. Also ist D eindeutig bestimmt. Nach 5.3 gibt es aber für jedes generische u_0 bei festem p ein enges Paar D(u_0) ∋ u_0. Ein festes zweidimensionales D enthält keine offene Menge von u_0. Widerspruch.

**Meine Prüfung dieses Vorschlags.** Ich habe die vier Schritte einzeln nachvollzogen und keinen Fehler gefunden:
- Schritt 1 folgt aus der Bigradrechnung in 5.4 (die ich in Abschnitt 5 bestätigt habe): σ = φ_D(τ) auf allen Paaren, also gleiche τ ⇒ gleiche Paare.
- Schritt 2: Eine verdrehte Kubik ist mengentheoretisch Schnitt ihrer drei Quadriken; deren Einschränkung auf eine zweite verdrehte Kubik hat Grad 6 im Parameter, verschwindet an 7 Stellen also identisch. Richtig, in jeder Charakteristik.
- Schritt 3: richtig (Grad ≤ 3 + 3).
- Schritt 4: Der Schluss „φ fest ⇒ span(f_{d_1}, f_{d_2}) fest ⇒ D fest“ ist richtig, weil u ↦ f_u ein Isomorphismus K⁴ → S³ ist (α spannt K⁴* auf). Die Existenz von D(u_0) für generisches u_0 bei festem p liefert 5.3 zusammen mit Satz E (Unterfall A ist für jedes generische u_0 ausgeschlossen). Die Punkte a_t(p), b_t(p) hängen nur von p ab (S2-16 Abschnitt 2), nicht von u_0.
- Grad d_D = 3 für **jedes** D: Für d_D·e < 8 gäbe die Schnittzahl einen Widerspruch, für d_D = e = 1 mit gleichen Graphen Symmetrie an p. Also d_D = 3 für alle D.

Wenn der Vorschlag hält, schließt er Unterfall B für nicht symmetrische p aus, mit Satz C (B-012) also den Fall (5,8) und damit alle vier Restfälle von Satz A. Das ist eine weitreichende Aussage, sie ist nur von zwei Lesern (Fremdmodell als Urheber, ich als Prüfer) gelesen, nicht von einem unabhängigen Prüfer, der sie nicht selbst vorgeschlagen bekommen hat, und sie ist nicht in Lean. **Status: behauptet (Urheber Fremdmodell, vom Prüfer S2-23 nachvollzogen).** Empfehlung an den Orchestrator: als eigene Behauptung anlegen (Vorschlag: „Satz F, Unterfall B unmöglich“), von einem Beweissucher sauber ausschreiben lassen (insbesondere: genaue Wahl der offenen Mengen von p und u_0, Rolle der Transponierten, Fall wiederholter Parameter), dann von einem frischen Prüfer und dem Fremdmodell prüfen lassen. B-013 selbst ändert sich dadurch nicht.

---

## 8. Was eine Lean-Fassung braucht

1. **Die Rahmenaussage.** Satz E lässt sich als Aussage über eine normalisierte Zerlegung (`BilinearAlgorithm K 4 2 4 25`, `SN1`, `SN2`, K algebraisch abgeschlossen) formulieren: Gibt es einen zweidimensionalen Unterraum S ⊆ U mit dim Σ_i f_i(S) ≤ 5 und J ⊆ Σ_i f_i(S), so ist dim JHat ≤ 8. Mit `finrank_JHat` und rk L = 5 folgt der Widerspruch. Diese Fassung umgeht Lemma P ganz, weil Unterfall A genau so ein S liefert.
2. **Kronecker für den engen Fall (A3).** Mathlib hat keine Kronecker-Normalform für Matrixbündel. Elementare Umgehung: Für ein nichtsinguläres Bündel K⁴ × K² → K⁵ den Linkskern als Polynomvektor vom Grad 4 konstruieren (Cramer: die fünf maximalen Minoren) und zeigen, dass die Zeilenfunktionale die Gestalt c·ev_σ haben. Für Satz E genügt sogar weniger: Jede Koordinate λ_t ist ein Funktional auf V_5, dessen Zurückziehung auf K⁴ × K* Rang ≤ 1 hat; man braucht nur, dass diese Funktionale in einem Raum liegen, in dem die Tensoren a_t ⊗ b_t höchstens 8 Dimensionen aufspannen.
3. **Hankel (A4).** Elementar, wenige Fallunterscheidungen, in Lean direkt machbar.
4. **dim span{a_t ⊗ b_t} = dim Ĵ** (R4): Rang einer Matrix gleich Rang der Transponierten, in mathlib vorhanden (`Matrix.rank_transpose`).
5. **Lemma P.** Am schwersten: rationale Abbildungen ℙ² ⇢ ℙ²*, Grad einer ebenen Kurve, generische Gerade schneidet transversal. Nichts davon steht in mathlib in brauchbarer Form. Empfehlung: Lemma P nicht formalisieren, sondern die Existenz von K* (dim 2 oder 3) mit den Eigenschaften aus Schritt (4) direkt elementar herleiten, oder Satz E in der Fassung von Punkt 1 formalisieren und Lemma P als eigene, spätere Behauptung führen.
6. **Generizität.** Wie bei Satz B: „generisches u_0“ wird in Lean zu „es gibt ein zulässiges u_0 mit …“; dafür braucht man die Existenz einer gemeinsamen Nichtnullstelle endlich vieler Polynome ≠ 0 über einem unendlichen Körper (wie in Lemma 6 schon benutzt) und die Abgeschlossenheit von Rangbedingungen.
7. **Nicht-Symmetrie (C2).** Chevalley (Konstruierbarkeit der Projektion) fehlt in mathlib. Umgehung: Satz C direkt in der Form „Symmetrie an allen Punkten einer Zariski-dichten Menge von p ist unmöglich“ formalisieren und C2 als Fallunterscheidung über ein Polynom in p schreiben.

---

## 9. Statusvorschlag

B-013 bleibt **behauptet**. Prüfer und Fremdmodell bestätigen unabhängig: Lemma P und Satz E halten mit den Reparaturen R1 (bzw. der Koordinatenfassung aus Abschnitt 2), R2, R2b; R3 und R4 sind Klarstellungen. Für Abbruchregel 2 b) ist Satz E eine Behauptung, die einen benannten Unterfall (Unterfall A von (5,8)) ausschließt. Den Fall (5,8) selbst schließt B-013 nicht aus (Unterfall B bleibt, Vermutung B ist vermutet). Ob ein Unterfall, den erst Lemma P definiert, als „benannter Fall der Fallunterscheidung“ zählt, entscheidet der Orchestrator.
