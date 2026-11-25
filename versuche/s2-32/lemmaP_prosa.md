# S2-32: Lemma P, elementare Fassung für die Lean-Formalisierung

Status: behauptet. Grundlage: Lemma P in S2-16 (lean/prosa/s2_444_spurA_r4.md, Abschnitt 5.1) mit den Reparaturen R2, R2b aus dem Prüfbericht S2-23; Schritt 2 (Büschel) nach dem elementaren Vorschlag des Fremdmodells (Endlichkeit auf einer Geraden, dann Schubfach); Schritt 4 (Kronecker) ersetzt durch ein Eigenwertargument.

## Rahmen (genau die Lean-Aussage)

K ist ein **unendlicher** Körper. U = K⁴, Q ein K-Vektorraum, F_1, F_2, F_3 : U → Q linear, F_γ := Σ γ_i F_i für γ ∈ K³ (linear in γ). Voraussetzungen:

- (H1) rk F_γ ≤ 3 für alle γ, und Ω := {γ : rk F_γ = 3} ist nicht leer. (Satz A: ρ = 3.)
- (H2) Für γ ∈ Ω ist s(γ) := dim Σ_i F_i(ker F_γ) = 1. (Folgerung C2c aus N = 0, in Lean `sDim_eq_one`.)
- (H3) dim Σ_i F_i(U) = 5. (rk L = 5 im Fall (5,8).)

K* := Σ_{γ ∈ Ω} ker F_γ (Summe über **alle** γ ∈ Ω).

**Lemma P.** Es gibt γ* ≠ 0 mit F_{γ*}(K*) = 0, und es gilt genau einer der Fälle
- **A:** dim K* = 2 und es gibt q ≠ 0 mit F_i(K*) ⊆ K·q für i = 1, 2, 3;
- **B:** dim K* = 3, rk F_{γ*} = 1, und es gibt Q_2 ⊆ Q, dim Q_2 = 2, mit F_i(K*) ⊆ Q_2 für i = 1, 2, 3.

(Lean: `UnterfallAVoll ∨ UnterfallB`.)

## Beweis

**Schritt 0 (Bezeichnungen).** Für einen Unterraum S ⊆ U sei D(S) := {δ ∈ K³ : F_δ(S) = 0}, ein Unterraum. Für γ ∈ Ω ist dim ker F_γ = 4 − 3 = 1, ker F_γ = K·k_γ mit k_γ ≠ 0, und D(γ) := D(ker F_γ) = {δ : F_δ k_γ = 0}.

**Schritt 1.** Für γ ∈ Ω gilt γ ∈ D(γ) und dim D(γ) = 2. *Beweis:* Die Abbildung e: δ ↦ F_δ k_γ = Σ δ_i F_i k_γ hat das Bild Σ_i K·F_i k_γ = Σ_i F_i(ker F_γ), nach (H2) der Dimension 1, und den Kern D(γ). Also dim D(γ) = 3 − 1. γ ∈ D(γ) ist klar.

**Schritt 2.** Sind γ, γ' ∈ Ω und γ' ∈ D(γ), so ist ker F_γ = ker F_{γ'} und D(γ) = D(γ'). *Beweis:* γ' ∈ D(γ) heißt ker F_γ ⊆ ker F_{γ'}; beide haben Dimension 1. *Folgerung 2':* Sind γ, γ' ∈ Ω mit D(γ) ≠ D(γ'), so ist D(γ) ∩ D(γ') eine Gerade (zwei verschiedene 2-dimensionale Unterräume von K³), und sie enthält keinen Punkt von Ω (sonst wären nach Schritt 2 beide Ebenen gleich der Ebene dieses Punktes).

**Schritt 3 (Endlichkeit auf Geraden).** Ist γ ∈ Ω und δ ∈ K³ beliebig, so ist {t ∈ K : γ + tδ ∉ Ω} endlich. *Beweis:* Sei C ein Komplement von ker F_γ in U, dim C = 3, F_γ|_C injektiv, und g : Q → C linear mit g ∘ F_γ|_C = id_C. Sei M := g ∘ F_δ|_C ∈ End(C). Ist γ + tδ ∉ Ω, so ist rk F_{γ+tδ} < 3 = dim C (H1), also (F_γ + tF_δ)|_C nicht injektiv: es gibt x ∈ C, x ≠ 0, mit F_γ x + t F_δ x = 0. Anwenden von g: x + t Mx = 0, also t ≠ 0 und Mx = (−1/t)x. Also ist −1/t ein Eigenwert von M. M hat nur endlich viele Eigenwerte (Nullstellen des Minimalpolynoms), und t ↦ −1/t ist injektiv.

*Folgerung 3'.* Ist P ⊆ K³ ein Unterraum der Dimension 2 mit einem Punkt γ ∈ P ∩ Ω, so gibt es nur endlich viele Geraden K·η ⊆ P mit η ≠ 0, η ∉ Ω. *Beweis:* P = span(γ, ε). Ein η = aγ + bε ≠ 0 mit b = 0 liegt in Ω (rk F_{aγ} = rk F_γ für a ≠ 0). Mit a = 0 ist K·η = K·ε. Sonst ist K·η = K·(γ + (b/a)ε) und γ + (b/a)ε ∉ Ω, nach Schritt 3 für endlich viele Werte b/a.

**Schritt 4 (eine unendliche Familie verschiedener Ebenen).** Wähle γ_0 ∈ Ω (H1) und δ ∉ D(γ_0) (Schritt 1: D(γ_0) ≠ K³). Sei γ_t := γ_0 + tδ und T := {t : γ_t ∈ Ω}. Nach Schritt 3 ist K \ T endlich, also T unendlich, und 0 ∈ T. Für t ≠ s in T gilt D(γ_t) ≠ D(γ_s): Sonst lägen γ_t, γ_s, also γ_0 und δ in D(γ_t); aus γ_0 ∈ D(γ_t) folgt mit Schritt 2 D(γ_0) = D(γ_t) ∋ δ, Widerspruch.

**Schritt 5 (Existenz von γ*).** Für t ∈ T, t ≠ 0, ist ℓ_t := D(γ_t) ∩ D(γ_0) nach 2' eine Gerade in D(γ_0) ohne Punkt von Ω. Nach 3' (mit γ_0 ∈ D(γ_0)) gibt es davon nur endlich viele. Schubfach: Es gibt η* ≠ 0 und eine unendliche Menge T* ⊆ T \ {0} mit ℓ_t = K·η* für alle t ∈ T*. Behauptung: η* ∈ D(γ) für jedes γ ∈ Ω. Sonst: Für t ∈ T* ist D(γ) ≠ D(γ_t) (denn η* ∈ D(γ_t)), also m_t := D(γ) ∩ D(γ_t) nach 2' eine Gerade in D(γ) ohne Punkt von Ω. Die Zuordnung t ↦ m_t ist auf T* injektiv: Aus m_t = m_s mit t ≠ s folgt m_t ⊆ D(γ_t) ∩ D(γ_s), und das ist (zwei verschiedene Ebenen, beide enthalten η*) genau K·η*; also m_t = K·η* und η* ∈ D(γ), Widerspruch. Also gäbe es unendlich viele solche Geraden in D(γ), im Widerspruch zu 3' (γ ∈ D(γ)). Setze γ* := η*. Dann ist F_{γ*}(ker F_γ) = 0 für jedes γ ∈ Ω, also F_{γ*}(K*) = 0.

**Schritt 6.** m := dim K* ≥ 2: ker F_{γ_0} ≠ ker F_{γ_t} für t ∈ T, t ≠ 0 (sonst D(γ_0) = D(γ_t)), zwei verschiedene Geraden in K*. Folglich ist γ* ∉ Ω (sonst ker F_{γ*} eindimensional ⊇ K*), und kein γ ∈ Ω ist Vielfaches von γ*.

**Schritt 7 (Auswahl).** Sei k_t ein Erzeuger von ker F_{γ_t} (t ∈ T). Die Familie (k_t)_{t ∈ T} ist unendlich in einem endlichdimensionalen Raum, also linear abhängig; daher gibt es t_1 ∈ T mit k_{t_1} ∈ span{k_t : t ∈ T, t ≠ t_1}. Wähle t_0 ∈ T, t_0 ≠ t_1, und setze γ_A := γ_{t_0}, γ_B := γ_{t_1}, A := F_{γ_A}, B := F_{γ_B}. Dann ist (γ_A, γ_B, γ*) eine Basis von K³: Aus c_A γ_A + c_B γ_B + c* γ* = 0 mit c_A ≠ 0 folgt γ_A ∈ span(γ_B, γ*) ⊆ D(γ_B), mit Schritt 2 D(γ_A) = D(γ_B), Widerspruch zu Schritt 4; also c_A = 0; c_B ≠ 0 hieße γ_B ∈ K·γ*, Widerspruch zu Schritt 6; also c_B = 0 und c* = 0.

**Schritt 8 (Eigenwertargument statt Kronecker).** Jedes γ ∈ K³ schreibt sich γ = a_γ γ_A + b_γ γ_B + c_γ γ*, und für x ∈ K* ist F_γ x = a_γ A x + b_γ B x. Sei Φ : K* × K* → Q, (x, y) ↦ Ax + By, Z := ker Φ, W := Bild Φ = A(K*) + B(K*). Dann F_i(K*) ⊆ W für i = 1, 2, 3, und dim W + dim Z = 2m.

(a) Für γ ∈ Ω und k ∈ ker F_γ ist (a_γ k, b_γ k) ∈ Z. Ist D(γ) ≠ D(γ_B), so ist a_γ ≠ 0 (sonst γ ∈ span(γ_B, γ*) ⊆ D(γ_B), Schritt 2).

(b) Die erste Projektion p_1(Z) enthält ker F_γ für alle γ ∈ Ω: für D(γ) ≠ D(γ_B) nach (a); insbesondere alle k_t mit t ≠ t_1 (Schritt 4), also nach Schritt 7 auch k_{t_1}; und für D(γ) = D(γ_B) ist ker F_γ = ker F_{γ_B} = K·k_{t_1} (Schritt 2). Also p_1(Z) = K*.

(c) Angenommen dim Z ≤ m. Dann ist p_1|_Z : Z → K* bijektiv, und T := p_2 ∘ (p_1|_Z)^{-1} ∈ End(K*) erfüllt T k_t = (b_t/a_t) k_t für alle t ∈ T \ {t_1} (a_t := a_{γ_t} ≠ 0). Die Quotienten b_t/a_t sind paarweise verschieden: Aus b_t/a_t = b_s/a_s folgt γ_t/a_t − γ_s/a_s ∈ K·γ*, also γ_t ∈ span(γ_s, γ*) ⊆ D(γ_s), also D(γ_t) = D(γ_s) und t = s (Schritt 4). Also hätte T unendlich viele Eigenwerte, Widerspruch. Also dim Z ≥ m + 1 und dim W ≤ m − 1.

(d) dim W ≥ dim A(K*) = m − 1, denn ker(A|_{K*}) = ker F_{γ_A} (eindimensional, in K*). Also dim W = m − 1.

**Schritt 9 (m ≤ 3, und rk F_{γ*} = 1 bei m = 3).** Ist m = 4, so K* = U und Σ_i F_i(U) ⊆ W hat Dimension ≤ 3, im Widerspruch zu (H3). Ist m = 3, so ist rk F_{γ*} ≤ 1 (ker F_{γ*} ⊇ K*). Wäre F_{γ*} = 0, so wähle x ∉ K*, U = K* + K·x; F_i x = a_i A x + b_i B x + c_i F_{γ*} x ∈ span(Ax, Bx), also Σ_i F_i(U) ⊆ W + span(Ax, Bx), Dimension ≤ 2 + 2 = 4, Widerspruch zu (H3). Also rk F_{γ*} = 1.

**Schritt 10.** m = 2: W hat Dimension 1, W = K·q mit q ≠ 0, Fall A. m = 3: Q_2 := W, Dimension 2, Fall B. ∎

## Bemerkungen

- Gebraucht wird nur „K unendlich“, nicht „K algebraisch abgeschlossen“. Lemma 9 wird nicht gebraucht (ersetzt durch (H3) in Schritt 9).
- Die Aussage ist für alle γ ∈ Ω formuliert, nicht nur für generische; K* ist die Summe über alle γ ∈ Ω.
