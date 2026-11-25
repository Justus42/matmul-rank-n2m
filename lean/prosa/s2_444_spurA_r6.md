# S2-24: Unterfall B des Restfalls (5,8) für ⟨4,2,4⟩ bei Länge 25, Bericht der Spur A, Runde 6

- Auftrag: S2-24 (Stufe 2, Runde 6), Rolle Beweissucher, Spur A. Unterfall B in beide Richtungen angreifen: ausschließen oder ein Verfahren mit 25 Produkten bauen (Protokoll 0.3, Abschnitt 3; Vorgabe von Justus vom 25.11.2026).
- Datum: 25.11.2026
- Status aller Aussagen dieses Berichts: **behauptet** (Beweise eines Agenten, von niemandem geprüft), wo ausdrücklich gesagt: **vermutet**. Nichts hier ist geprüft im Sinn von Abschnitt 5 des Protokolls. „Beweis“ heißt hier Prosa-Beweis.
- Grundlage: `lean/prosa/yang_n4.md` (Bezeichnungen, Lemmata 8, 9, Folgerung 7), `lean/prosa/s2_444_spurA_r2.md` (S2-05: Ψ, Satz A, Folgerung A2), `lean/prosa/s2_444_spurA_r4.md` (S2-16: Satz C, Folgerung C2, Lemma P, Satz E, Abschnitt 5.3), `behauptungen/B-007.md` bis `B-013.md`, `versuche/` (alle Dateien, insbesondere `V-S2-16-f-daten-58.md`, `s2-blind-r4.md`, `s2-blind-r5.md`).
- Kein Fremdmodell benutzt.
- Code: `versuche/s2-24/klassen_lemma.py` (Python, exakte Arithmetik in 𝔽_q, keine Gleitkommazahlen). Ausgabe: `versuche/s2-24/klassen_lemma_ausgabe.txt`.

---

## 1. Ergebnis in Kürze

1. **Satz F (neu): Unterfall B ist unmöglich.** Der Beweis (Abschnitt 5) ist ein Zählargument. Er braucht keine Suche und keine Rechnung.
   - Von unten: Zwei Terme t ≠ t′ einer Zerlegung der Länge 25 im Fall (5,8), deren Punkte a_t(p) ⊗ b_t(p) und a_{t′}(p) ⊗ b_{t′}(p) für alle p projektiv zusammenfallen, sind sehr speziell (Lemma K). Höchstens zwei Terme fallen so zusammen. Für generisches p gibt es deshalb **mindestens 13 verschiedene Punkte** [a_t(p) ⊗ b_t(p)] (Lemma Z). Das braucht nur die Minimalität (B-007, geprüft) und dim Ĵ_p = 9 = dim ker W.
   - Von oben: In Unterfall B liegen die a_t auf einer verdrehten Kubik, die b_t ebenso, und die Parameter (τ_t, σ_t) liegen auf zwei Kurven in ℙ¹ × ℙ¹ vom Bigrad (d, 1) und (1, e) mit d, e ≤ 3 (aus (B2) und (B3) von S2-16). Zwei verschiedene solche Kurven schneiden sich in höchstens d·e + 1 ≤ **10** Punkten.
   - 13 > 10. Also fallen die beiden Kurven zusammen, dann ist d = e = 1, und die Zerlegung ist an der Stelle p symmetrisch. Das widerspricht Folgerung C2 aus S2-16.
2. **Folgerung F1: Der Restfall (5,8) ist ausgeschlossen**, über jedem Körper, wenn die Aussagen von S2-16 halten (Satz C mit Folgerung C2, Lemma P, Satz E, Abschnitt 5.3). Zusammen mit Satz A (B-008), Satz B (B-009) und Folgerung C1 (B-012) folgt dann: **⟨4,2,4⟩ hat über keinem Körper eine Zerlegung der Länge 25, also R(⟨4,2,4⟩) ≥ 26.** Mit B-010 wäre der Rang 26. Das ist eine Kette von Behauptungen. Status: **behauptet**, nicht geprüft. Sie steht in `behauptungen/B-014.md`.
3. **Vermutung B aus S2-16 ist damit überholt.** Sie wird nicht gebraucht. Der offene Fall d = e = 3 aus S2-16 Abschnitt 5.4 erledigt sich mit derselben Zählung (10 < 13). Die Frage, ob die Kubiken vom engen Paar D abhängen, spielt keine Rolle: Ich nehme ein festes D und ein festes E.
4. **Richtung zwei (Bau eines Verfahrens):** In Unterfall B gibt es nach Satz F keine Zerlegung. Eine parametrisierte Suche auf den Kubiken würde eine leere Menge absuchen. Ich habe sie deshalb nicht gerechnet. Abschnitt 7 sagt, an welchen Stellen der Kette ein 25er-Verfahren noch stecken könnte, falls ein Prüfer eine der Voraussetzungen widerlegt.
5. **Gegenprobe (exakt, erschöpfend):** Der algebraische Kern von Lemma K gilt über 𝔽₂, 𝔽₃, 𝔽₅ für alle Paare linearer Abbildungen K² → Kⁿ mit n ≤ 4 (je nach Körper, Abschnitt 6). Keine Ausnahme.

Für die Abbruchregel: Satz F schließt einen benannten Fall der Fallunterscheidung aus (Unterfall B von (5,8)), und mit S2-16 den Fall (5,8) selbst. Fortschritt nach Regel 2 b) wird das erst, wenn ein Prüfer und ein Fremdmodell B-014 unabhängig bestätigen.

---

## 2. Rahmen und Bezeichnungen

Alles wie in S2-16 Abschnitt 2 (`lean/prosa/s2_444_spurA_r4.md`): K algebraisch abgeschlossen (Lemma R1), Zerlegung

  A·B = Σ_{t<25} α_t(A) β_t(B) C_t,  α_t(A) = Σ A_t[i,k] A[i,k],  β_t(B) = Σ B_t[k,j] B[k,j],

mit A_t ∈ K^{4×2}, B_t ∈ K^{2×4}, J = [[0, −1], [1, 0]] und

  a_t(p) := A_t p ∈ K⁴,  b_t(p) := B_tᵀ J p ∈ K⁴  (p ∈ K²).

W : K^{25} → K^{4×4}, W(s) = Σ s_t C_t, dim ker W = 25 − 16 = 9. Für p ∈ K² ist

  Ĵ_p := span{ ((a_t(p)·u)(b_t(p)·w))_t : u, w ∈ K⁴ } ⊆ ker W

(S2-16 Abschnitt 2, Grundidentität (D) mit p′ = p). Es ist rk L = dim Ĵ_p − 4 (S2-05 Abschnitt 2).

**Minimalität.** Kein A_t und kein B_t ist null, und keine zwei Terme t ≠ t′ haben zugleich A_{t′} = λA_t und B_{t′} = μB_t. Sonst ließen sich Terme streichen oder zusammenlegen (im zweiten Fall: α_{t′}β_{t′}C_{t′} = λμ α_tβ_t C_{t′}, ersetze C_t durch C_t + λμC_{t′} und streiche t′), und es gäbe eine Zerlegung der Länge 24, im Widerspruch zu B-007 (R ≥ 25 über jedem Körper, geprüft). Insbesondere ist a_t(p) ≠ 0 und b_t(p) ≠ 0 für p außerhalb endlich vieler Geraden.

**Was ich aus S2-16 übernehme (alles behauptet, dort bewiesen):**

- (V1) Folgerung C2: Im Fall (5,8) gibt es eine nichtleere offene Menge P_ns ⊆ K² zulässiger p, an denen **keine** invertierbare Matrix M mit M b_t(p) ∈ K·a_t(p) für alle t existiert. Für p ∈ P_ns gilt N(u_0) = 0 und s = 1. (Stützt sich auf Satz C, B-012.)
- (V2) Lemma P und Satz E (B-013): Für p ∈ P_ns (nach Verkleinern) liegt die Zerlegung in Unterfall B, und ebenso ihre Transponierte.
- (V3) Abschnitt 5.3 von S2-16, (B1) bis (B3). Ich schreibe die Beweise in Abschnitt 4 vollständig aus, damit Satz F ohne S2-16 Abschnitt 5.3 lesbar ist.

**Fall (5,8) heißt hier:** rk L = 5 für p aus einer nichtleeren offenen Menge, also dim Ĵ_p = 9 und damit

  **Ĵ_p = ker W für alle p aus einer nichtleeren offenen Menge P_9.**   (G)

(Ĵ_p ⊆ ker W und beide haben Dimension 9. Das ist Folgerung A2 aus S2-05.) Die zulässigen p mit rk L = 5 bilden eine solche Menge, weil dim Ĵ_p unterhalb stetig ist und der Fall für generisches p feststeht.

Projektive Punkte schreibe ich [v] für v ≠ 0. Für einen Raum D ⊆ K⁴ ist D^⊥ := {a ∈ K⁴ : a·u = 0 für alle u ∈ D}.

---

## 3. Lemma K und Lemma Z: viele verschiedene Punkte a_t ⊗ b_t

### 3.1 Lemma K (zwei Faktorisierungen einer quadratischen Rang-1-Abbildung)

**Lemma K.** Sei K ein beliebiger Körper, n ≥ 1, und seien X, Y, X′, Y′ ∈ K^{n×2}, alle ≠ 0, mit

  (Xp) ⊗ (Yp) = (X′p) ⊗ (Y′p)  als Polynomidentität in p ∈ K².   (K)

Dann gilt genau einer der beiden Fälle:
- (i) X′ = λX und Y′ = λ⁻¹Y für ein λ ≠ 0;
- (ii) X = x l_1ᵀ, Y = w l_2ᵀ, X′ = λ x l_2ᵀ, Y′ = λ⁻¹ w l_1ᵀ mit x, w ∈ Kⁿ ∖ {0}, λ ≠ 0 und linear unabhängigen l_1, l_2 ∈ K².

*Beweis.* Die Komponenten von Xp, Yp, X′p, Y′p sind Linearformen in K[p_1, p_2], einem faktoriellen Ring. Wegen (K) und X, Y ≠ 0 ist X′, Y′ ≠ 0 und Xp ≠ 0 ≠ Yp als Polynomvektoren.

*Schritt 1: Xp und X′p sind über K(p) proportional.* Wähle j mit (Yp)_j ≠ 0 (als Polynom). Aus (K) folgt für alle i: (Xp)_i (Yp)_j = (X′p)_i (Y′p)_j. Wäre (Y′p)_j = 0, so wäre Xp = 0. Also ist Xp · (Yp)_j = X′p · (Y′p)_j mit zwei Polynomen ≠ 0, das heißt Xp und X′p sind über dem Funktionenkörper K(p) proportional, und alle 2×2-Minoren verschwinden: (Xp)_i (X′p)_{i′} = (Xp)_{i′} (X′p)_i für alle i, i′, als Polynome und damit an jeder Stelle p. Ebenso für Y und Y′.

*Schritt 2: Fallunterscheidung nach dem Rang von X.*
- rk X = 2. Dann sind die Spalten Xe_1, Xe_2 linear unabhängig. Aus Schritt 1 an den Stellen p = e_1, e_2, e_1 + e_2 (über dem Integritätsbereich ausgewertet, die Identität (Xp)_i(X′p)_{i′} = (Xp)_{i′}(X′p)_i gilt an jeder Stelle) folgt X′e_1 = λ_1Xe_1, X′e_2 = λ_2Xe_2, X′(e_1+e_2) = λ_3X(e_1+e_2) mit Skalaren λ_k (Xe_k ≠ 0), also λ_1 = λ_2 = λ_3 wegen der Unabhängigkeit. Also X′ = λX, λ ≠ 0. Einsetzen in (K): (Xp) ⊗ (Yp − λY′p) = 0, mit Xp ≠ 0 also Y = λY′. Fall (i).
- rk X = 1, X = x l_1ᵀ. Dann ist Xp = x (l_1·p), und nach Schritt 1 ist X′p für jedes p mit l_1·p ≠ 0 ein Vielfaches von x, also für alle p (abgeschlossene Bedingung). Also X′ = x l_1′ᵀ (Skalar in l_1′ gezogen). (K) wird zu x ⊗ [(l_1·p) Yp − (l_1′·p) Y′p] = 0, also

  (l_1·p) · Yp = (l_1′·p) · Y′p.   (K′)

  Ist l_1′ ∥ l_1, so ist X′ = λX und aus (K′) folgt Y′ = λ⁻¹Y. Fall (i). Sonst sind l_1·p und l_1′·p teilerfremde Primelemente in K[p_1, p_2]. Aus (K′) folgt, dass l_1′·p jede Komponente von Yp teilt. Die Komponenten haben Grad ≤ 1, also (Yp)_k = w_k (l_1′·p): **Y = w l_1′ᵀ**. Ebenso **Y′ = w′ l_1ᵀ**, und (K′) gibt w = w′. Mit l_2 := l_1′ (bis auf Skalar) ist das Fall (ii).
- rk X = 0 ist ausgeschlossen (X ≠ 0).

Die Fälle schließen sich aus: In (ii) sind X und X′ nicht proportional. ∎

**Folgerung K1.** Für feste X, Y ≠ 0 bilden die Lösungen (X′, Y′) von (K) höchstens zwei Bahnen unter (X′, Y′) ↦ (λX′, λ⁻¹Y′): die Bahn von (X, Y) und, falls rk X = rk Y = 1 mit verschiedenen Zeilenräumen, die Bahn des „Tauschs“ (x l_2ᵀ, w l_1ᵀ). Gegenprobe in Abschnitt 6.

### 3.2 Lemma Z (mindestens 13 verschiedene Punkte)

Zwei Terme t, t′ heißen **verbunden**, t ∼ t′, wenn [a_t(p) ⊗ b_t(p)] = [a_{t′}(p) ⊗ b_{t′}(p)] für alle p aus einer nichtleeren offenen Menge gilt. Die Bedingung „a_t(p) ⊗ b_t(p) und a_{t′}(p) ⊗ b_{t′}(p) linear abhängig“ ist eine polynomiale Bedingung an p ∈ ℙ¹. Sie gilt also entweder für alle p oder für endlich viele [p]. ∼ ist eine Äquivalenzrelation.

**Lemma Z.** Eine Zerlegung von ⟨4,2,4⟩ der Länge 25 erfülle (G). Dann hat jede Klasse von ∼ höchstens zwei Elemente. Folglich gibt es mindestens 13 Klassen, und für alle p außerhalb endlich vieler Punkte von ℙ¹ sind unter den 25 Punkten [a_t(p) ⊗ b_t(p)] mindestens 13 paarweise verschieden.

*Beweis.* Sei S eine Klasse und t_0 ∈ S. Für t ∈ S und p aus einer offenen Menge gilt a_t(p) ⊗ b_t(p) = κ_t(p) · a_{t_0}(p) ⊗ b_{t_0}(p) mit κ_t(p) ∈ K ∖ {0} (beide Seiten ≠ 0 für generisches p).

*Schritt 1: κ_t ist konstant.* Sei pr_S : K^{25} → K^S die Projektion auf die Koordinaten t ∈ S. Für jeden Vektor in Ĵ_p ist die Koordinate t gleich (a_t(p)·u)(b_t(p)·w) = κ_t(p) · (a_{t_0}(p)·u)(b_{t_0}(p)·w). Also ist pr_S(Ĵ_p) ⊆ K · (κ_t(p))_{t∈S}, und Gleichheit gilt, weil (a_{t_0}(p)·u)(b_{t_0}(p)·w) ≠ 0 für passende u, w. Für p ∈ P_9 ist Ĵ_p = ker W nach (G), also ist pr_S(Ĵ_p) = pr_S(ker W) eine feste Gerade, unabhängig von p. Damit ist der Vektor (κ_t(p))_{t∈S} bis auf einen Faktor konstant, und weil κ_{t_0} = 1, ist jedes κ_t(p) = κ_t eine Konstante ≠ 0 auf einer offenen Menge von p.

*Schritt 2.* Also gilt (A_t p) ⊗ (B_tᵀJp) = κ_t (A_{t_0}p) ⊗ (B_{t_0}ᵀJp) auf einer offenen Menge, als Identität quadratischer Polynome in p also überall. Das ist (K) mit X = A_{t_0}, Y = κ_t B_{t_0}ᵀJ, X′ = A_t, Y′ = B_tᵀJ (ein Skalar an Y ändert an Fall (i) und (ii) nichts). Fall (i) heißt A_t = λA_{t_0}, B_t = μB_{t_0} (J invertierbar), für t ≠ t_0 ausgeschlossen durch die Minimalität. Also ist jedes t ∈ S ∖ {t_0} der Tausch von t_0 im Sinn von (ii), und nach Folgerung K1 liegen zwei solche t, t″ in derselben Bahn: A_{t″} = λA_t, B_{t″} = μB_t, wieder ausgeschlossen. Also |S ∖ {t_0}| ≤ 1.

*Zählen.* 25 Terme in Klassen der Größe ≤ 2 ergeben mindestens 13 Klassen. Für zwei Terme aus verschiedenen Klassen fallen die Punkte nur für endlich viele [p] zusammen. Für p außerhalb dieser endlich vielen Punkte sind die Punkte von Vertretern der Klassen paarweise verschieden. ∎

Bemerkungen:
- Lemma Z braucht nur die Minimalität (B-007) und (G). Es gilt also in jedem Unterfall von (5,8), auch ohne Lemma P.
- Eine Klasse der Größe 2 besteht aus zwei Termen mit A_t = x l_1ᵀ, A_{t′} = x l_2ᵀ (beide „x-rein“ im Sinn von `versuche/s2-blind-r5.md`) und B-Seiten vom Rang 1 mit gemeinsamem Vektor w. Das passt zu Satz R dort (höchstens zwei reine Produkte je Richtung), wird hier aber nicht gebraucht.
- Ohne (G) gilt Schritt 1 nicht: Dann kann κ_t(p) von p abhängen, und Klassen bis zur Größe 4 sind möglich (Rang eines Tensors in K² ⊗ K² ⊗ K^{16}). Die Bedingung (G) ist der Punkt, an dem der Fall (5,8) eingeht.

---

## 4. Die Struktur von Unterfall B, ausgeschrieben (aus S2-16 Abschnitt 5.3)

Halte p ∈ P_ns ∩ P_9 fest, an dem (V2) für die Zerlegung und für ihre Transponierte gilt. Schreibe a_t, b_t für a_t(p), b_t(p) und Ψ(u, w)_t := (a_t·u)(b_t·w) für u, w ∈ K⁴. Ψ ist nichtsingulär: Ψ(u, w) ≠ 0 für u ≠ 0 ≠ w (Folgerung 7, (Ψ1) in S2-05, mit w als Koordinaten der Zeile 1 von x ∈ U). S^d sind die binären Formen vom Grad d.

**(B0) Ein enges Paar auf der Seite von u.** In Unterfall B ist rk F_{γ*} = 1 (Lemma P, B-013). Mit dem zu γ* gehörenden Vektor u* und D := span(u_0, u*) ist Ψ(D, K⁴) = Ψ(u_0, K⁴) + Ψ(u*, K⁴) = J + f_*(U), also dim Ψ(D, K⁴) = 4 + rk F_{γ*} = 5. Außerdem a_t·u_0 ≠ 0 für alle t (N1).

**(B1) Kronecker.** Die Abbildungen Ψ(u, ·) : K⁴ → Ψ(D, K⁴) ≅ K⁵ für u ∈ D ≅ K² bilden ein Matrizenbüschel vom Format 5×4, das für jedes u ≠ 0 injektiv ist. Nach der Kronecker-Normalform (K algebraisch abgeschlossen, jede Charakteristik) enthält es keinen L_ε-Block (der hätte überall einen Kern) und keinen regulären Block (der würde für ein u singulär). Es bleiben Blöcke L_ηᵀ vom Format (η + 1) × η mit Σ η_i = 4 (Spalten) und Σ(η_i + 1) = 5 (Zeilen), also genau ein Block L_4ᵀ. Das ist die Multiplikation S¹ × S³ → S⁴. Es gibt also Isomorphismen ι_D : D → S¹, g_D : K⁴ → S³, Λ_D : S⁴ → Ψ(D, K⁴) mit Ψ(u, w) = Λ_D(ι_D(u) · g_D(w)).

**(B2) Hankel.** Sei λ_t die t-te Koordinate von Λ_D, eine Linearform auf S⁴. Die Bilinearform (l, g) ↦ λ_t(l·g) auf S¹ × S³ ist (u, w) ↦ (a_t·u)(b_t·w), u ∈ D, hat also Rang ≤ 1. Ihre Matrix ist die Hankel-Matrix (h_{i+j}) vom Format 2×4, h_k = λ_t(s^{4−k}t^k). Rang ≤ 1 heißt: (h_0, …, h_4) ist geometrisch, also λ_t = c_t · ev_{σ_t} mit c_t ∈ K und einem Punkt σ_t ∈ ℙ¹ (der Punkt im Unendlichen eingeschlossen). Ist c_t = 0, dann (a_t·u)(b_t·w) = 0 für alle u ∈ D und alle w, mit b_t ≠ 0 also a_t ⊥ D ∋ u_0, gegen (N1). Also c_t ≠ 0 und

  (a_t·u)(b_t·w) = c_t · ι_D(u)(σ_t) · g_D(w)(σ_t)  für u ∈ D, w ∈ K⁴.

Daraus:
- **b_t ∝ ν_D(σ_t)**, wobei ν_D(σ) ∈ K⁴ der Vektor mit ν_D(σ)·w = g_D(w)(σ) ist. Da g_D ein Isomorphismus ist, ist σ ↦ [ν_D(σ)] eine verdrehte Kubik in ℙ³ (Bild der Momentenkurve unter einer projektiven Transformation), insbesondere injektiv.
- **[a_t|_D] = [ev_{σ_t} ∘ ι_D]** in ℙ(D*). Die Abbildung σ ↦ [ev_σ ∘ ι_D] ist ein Isomorphismus ℙ¹ → ℙ(D*). Also ist σ_t = π_D([a_t]), wobei π_D : ℙ³ ∖ ℙ(D^⊥) → ℙ(D*) ≅ ℙ¹ die Einschränkung auf D ist, also die Projektion von der Geraden ℙ(D^⊥) aus. [a_t] liegt nicht auf ℙ(D^⊥), denn a_t·u_0 ≠ 0.

**(B3) Dieselbe Struktur auf der anderen Seite.** Die Transponierte (A_t, B_t, C_t) ↦ (B_tᵀ, A_tᵀ, C_tᵀ) ist eine Zerlegung von ⟨4,2,4⟩ der Länge 25. Für sie gilt a′_t(p) = B_tᵀp = −b_t(Jp) und b′_t(p) = A_tJp = a_t(Jp). Ihre Abbildung Ψ′ an der Stelle p ist Ψ an der Stelle Jp mit vertauschten Argumenten (bis auf das Vorzeichen), und ker W′ = ker W (C_tᵀ statt C_t). Sie liegt im Fall (5,8) und ist nicht symmetrisch (die Bedingung M b_t ∥ a_t ist mit M⁻¹ symmetrisch in a und b). Nach (V2) liegt sie in Unterfall B. (B0) bis (B2) für die Transponierte, zurückübersetzt (wähle p so, dass die Bedingungen an p für die Zerlegung und an J⁻¹p für die Transponierte gelten; beides sind nichtleere offene Mengen), ergeben einen Raum E ⊆ K⁴ der Dimension 2 auf der Seite von w und einen Isomorphismus g_E : K⁴ → S³ mit:
- **a_t ∝ ν_E(τ_t)**, ν_E(τ)·u = g_E(u)(τ), eine verdrehte Kubik in ℙ³;
- **τ_t = π_E([b_t])**, die Projektion von der Geraden ℙ(E^⊥) aus, und [b_t] ∉ ℙ(E^⊥).

---

## 5. Satz F: Unterfall B ist unmöglich

**Satz F.** Eine Zerlegung von ⟨4,2,4⟩ der Länge 25 im Fall (5,8), die nicht symmetrisch ist, liegt nicht in Unterfall B (für sich und ihre Transponierte zugleich).

*Beweis.* Angenommen doch. Wähle p wie in Abschnitt 4 und zusätzlich außerhalb der endlich vielen Ausnahmepunkte von Lemma Z (möglich: endlich viele Bedingungen, jede schließt nur eine echte abgeschlossene Teilmenge von ℙ¹ aus, K ist unendlich).

*Schritt 1: zwei Abbildungen ℙ¹ → ℙ¹.* Setze

  φ := π_D ∘ ν_E : ℙ¹ → ℙ¹,  ψ := π_E ∘ ν_D : ℙ¹ → ℙ¹.

In Koordinaten ist π_D ∘ ν_E gegeben durch zwei binäre Formen vom Grad 3 (die Werte von ν_E(τ) auf einer Basis von D). Nach Kürzen eines gemeinsamen Faktors (er entsteht genau an den Punkten der Kubik auf ℙ(D^⊥)) ist φ = [f : g] mit teilerfremden f, g vom Grad d ≤ 3. Ebenso ψ mit Grad e ≤ 3. φ ist auf ganz ℙ¹ ein Morphismus, und an jeder Stelle τ mit ν_E(τ) ∉ ℙ(D^⊥) stimmt φ(τ) mit π_D(ν_E(τ)) überein. Nach (B2) und (B3) gilt für alle t:

  σ_t = π_D([a_t]) = π_D(ν_E(τ_t)) = φ(τ_t),  τ_t = π_E([b_t]) = π_E(ν_D(σ_t)) = ψ(σ_t).

*Schritt 2: zwei Kurven in ℙ¹ × ℙ¹.* Die Paare (τ_t, σ_t) liegen also auf

  Γ_1 := {(τ, σ) : σ = φ(τ)} = V(σ_1 g(τ) − σ_2 f(τ)),  Γ_2 := {(τ, σ) : τ = ψ(σ)}.

Γ_1 ist irreduzibel (das Polynom σ_1 g − σ_2 f ist linear in σ und primitiv, weil f, g teilerfremd sind) und hat die Klasse d·h_1 + h_2, wobei h_1 die Klasse einer Faser {τ = const} und h_2 die einer Faser {σ = const} ist (h_1² = h_2² = 0, h_1·h_2 = 1). Ebenso ist Γ_2 irreduzibel mit Klasse h_1 + e·h_2. Das gilt in jeder Charakteristik.

*Schritt 3: Zählen.* Sind Γ_1 und Γ_2 verschieden, so haben sie keine gemeinsame Komponente, und nach dem Satz von Bézout auf ℙ¹ × ℙ¹ schneiden sie sich in höchstens

  Γ_1 · Γ_2 = (d h_1 + h_2)(h_1 + e h_2) = d·e + 1 ≤ 10

Punkten. Andererseits bestimmt das Paar (τ_t, σ_t) die Punkte [a_t] = [ν_E(τ_t)] und [b_t] = [ν_D(σ_t)], also auch [a_t ⊗ b_t]. Nach Lemma Z gibt es an der Stelle p mindestens 13 verschiedene Punkte [a_t ⊗ b_t], also mindestens 13 verschiedene Paare (τ_t, σ_t) in Γ_1 ∩ Γ_2. Da 13 > 10, ist **Γ_1 = Γ_2**.

*Schritt 4: dann ist die Zerlegung an der Stelle p symmetrisch.* Aus Γ_1 = Γ_2 folgt: Die Projektion Γ_1 → ℙ¹_σ hat Grad 1 (Γ_2 · h_2 = 1) und zugleich Grad d (Γ_1 · h_2 = d). Also d = 1 und ebenso e = 1, φ ist ein Automorphismus von ℙ¹, φ = ψ⁻¹, und σ_t = φ(τ_t) für alle t. Die Abbildungen τ ↦ ν_D(φ(τ)) und τ ↦ ν_E(τ) sind beide verdrehte Kubiken, als Abbildungen K² → K⁴ homogen vom Grad 3 und jeweils ein Isomorphismus S³* ≅ K⁴ hinter der Momentenabbildung m(τ) = (τ_1³, τ_1²τ_2, τ_1τ_2², τ_2³). Schreibe φ als Matrix Φ ∈ GL_2. Dann ist m(Φτ) = Sym³(Φ) m(τ) mit invertierbarem Sym³(Φ) (die induzierte Abbildung auf den kubischen Monomen; invertierbar, weil Φ⁻¹ die Umkehrung liefert), also

  ν_D(φ(τ)) = N_D Sym³(Φ) m(τ),  ν_E(τ) = N_E m(τ)

mit invertierbaren 4×4-Matrizen N_D, N_E. Mit G := N_D Sym³(Φ) N_E⁻¹ ∈ GL_4 folgt [b_t] = [ν_D(σ_t)] = [G ν_E(τ_t)] = [G a_t] für alle t, also M b_t ∈ K·a_t mit M := G⁻¹ invertierbar. Das widerspricht p ∈ P_ns (V1). ∎

**Folgerung F1 (Fall (5,8) ausgeschlossen, behauptet).** Hat ⟨4,2,4⟩ über einem Körper eine Zerlegung der Länge 25, so liegt sie nicht im Fall (5,8).

*Beweis.* Im Fall (5,8) ist die Zerlegung nach Satz C (B-012) nicht symmetrisch, und es gibt P_ns (V1). Nach Lemma P und Satz E (B-013) liegen die Zerlegung und ihre Transponierte für p in einer nichtleeren offenen Menge in Unterfall B. Satz F schließt das aus. ∎

**Folgerung F2 (R(⟨4,2,4⟩) ≥ 26, behauptet).** Über keinem Körper hat ⟨4,2,4⟩ eine Zerlegung der Länge 25. Mit B-007 und B-010 (beide geprüft) wäre der Rang von ⟨4,2,4⟩ über jedem Körper genau 26.

*Beweis.* Eine Zerlegung der Länge ≤ 24 gibt es nicht (B-007). Eine der Länge 25 liegt nach Satz A (B-008) in einem der Fälle (3,6), (4,7), (5,7), (5,8). (4,7) und (5,7) schließt Satz B aus (B-009), (3,6) Folgerung C1 (B-012), (5,8) Folgerung F1. ∎

**Woran F2 hängt.** Geprüft sind B-007, B-010, im Kern B-008 und B-009 (Rangteil; der Zusatz μ_t ≠ 0 in B-009 ist behauptet, wird aber in Satz C nicht gebraucht, dort wird μ_t ≠ 0 eigens hergeleitet). **Nur behauptet** sind B-012 (Satz C, C1, C2), B-013 (Lemma P, Satz E, Unterfall B für die Transponierte) und B-014 (dieser Bericht). F2 ist deshalb **behauptet** und nichts weiter. Die Prüfungen von B-012 und B-013 laufen in Runde 6 (S2-22, S2-23).

---

## 6. Gegenprobe zu Lemma K (exakt, erschöpfend)

`versuche/s2-24/klassen_lemma.py` zählt alle Paare (X, Y) von n×2-Matrizen ≠ 0 über 𝔽_q auf, gruppiert sie nach den Koeffizienten der quadratischen Abbildung p ↦ (Xp) ⊗ (Yp) und prüft in jeder Faser: höchstens zwei Bahnen unter (X, Y) ↦ (λX, λ⁻¹Y), und bei zwei Bahnen haben beide die Tauschgestalt aus Lemma K (ii). Exakte Arithmetik modulo q. Ausgabe (`klassen_lemma_ausgabe.txt`):

| n | q | Fasern ≠ 0 | höchstens Bahnen je Faser | Fasern mit 2 Bahnen (alle Tauschgestalt) |
|---|---|---|---|---|
| 2 | 2 | 198 | 2 | 27 |
| 2 | 3 | 3 008 | 2 | 192 |
| 2 | 5 | 95 184 | 2 | 2 160 |
| 3 | 2 | 3 822 | 2 | 147 |
| 3 | 3 | 262 964 | 2 | 2 028 |
| 4 | 2 | 64 350 | 2 | 675 |

Rechenzeit: 6 Sekunden auf einem Kern. Die Rechnung prüft nur den algebraischen Kern von Lemma K über kleinen Primkörpern, nicht Lemma Z und nicht Satz F. Lemma K ist über jedem Körper formuliert, der Beweis benutzt nur, dass K[p_1, p_2] faktoriell ist.

Die übrigen Schritte von Satz F (Bézout auf ℙ¹ × ℙ¹, Kronecker, Hankel) sind Standardsätze. Eine Rechnung dazu habe ich nicht angelegt.

---

## 7. Richtung zwei: ein Verfahren mit 25 Produkten?

- **In Unterfall B gibt es nach Satz F keines.** Der Auftrag sah vor, die a_t und b_t auf den Kubiken zu parametrisieren und die Gleichungen zu lösen. Nach Abschnitt 5 hätte dieses System höchstens 10 verschiedene Paare (τ_t, σ_t), braucht aber mindestens 13. Eine Suche würde eine leere Menge absuchen. Ich habe sie nicht gerechnet. Das ist kein gescheiterter Ansatz, deshalb keine Datei in `versuche/`.
- **Wo ein 25er-Verfahren noch leben könnte**, falls die Kette einen Fehler hat. Für einen Verfahrenssucher in einer späteren Runde (vermutet):
  1. Ist Satz C (B-012) falsch, dann vor allem im Fall (3,6), der nach Satz B symmetrisch ist: a_t(p) und b_t(p) projektiv durch eine invertierbare Matrix verbunden. Dort wäre die Gestalt aus S2-16 Abschnitt 8.1 (Punkte auf einer verdrehten Kubik) der Ansatz.
  2. Ist Lemma P falsch (etwa die Büschelaussage in Schritt (2) oder die Kronecker-Aussage in Schritt (4)), dann im Fall (5,8) ohne enges Paar D. Dort greifen Satz E und Satz F nicht. Lemma Z gilt aber weiter: Jede Zerlegung der Länge 25 im Fall (5,8) hat für generisches p mindestens 13 verschiedene Punkte a_t(p) ⊗ b_t(p), und Klassen der Größe 2 haben die Tauschgestalt.
  3. Die Modelle aus S2-05 Abschnitt 8.3 (M1, M3, K(0,1,2,5)) sind nur F-Daten an einer Stelle p, keine Zerlegungen. Sie sind symmetrisch und berühren Unterfall B nicht.

---

## 8. Die Hinweise der Blind-Sucher

- **Satz R (`versuche/s2-blind-r5.md`, behauptet):** höchstens zwei x-reine Produkte je Richtung. Lemma Z zeigt im Fall (5,8) etwas Verwandtes, aber anderes: Fallen zwei Terme in a ⊗ b für alle p zusammen, dann sind beide x-rein mit derselben Richtung x und auf der B-Seite rein mit demselben w. Satz R wird für Satz F nicht gebraucht. Unterfall B erzwingt nach (B2) auch keine reinen Produkte: Ein Term mit A_t vom Rang 2 hat a_t(p) auf der Geraden Bild(A_t), die die Kubik für jedes p in einem Punkt trifft. Ich sehe keinen Weg, wie Satz R in Unterfall B mehr gibt als Satz F.
- **ρ = 4 (`versuche/s2-blind-r4.md`, vermutet):** würde R ≥ 26 direkt geben (ρ = 3 ist nach Satz A notwendig). Mit Satz F wird das nicht gebraucht. Ich habe die Vermutung nicht weiter verfolgt.

---

## 9. Kritische Stellen für den Prüfer

1. **Lemma Z, Schritt 1:** dass pr_S(Ĵ_p) eine von p unabhängige Gerade ist. Das braucht Ĵ_p = ker W auf einer offenen Menge (G), also rk L = 5 für generisches p. Ohne (G) bricht der Schritt.
2. **Lemma K:** Fallunterscheidung und die Teilbarkeit in K[p_1, p_2]. Die erschöpfende Rechnung (Abschnitt 6) deckt das für kleine Körper und n ≤ 4.
3. **(B3):** dass die Transponierte an einer gemeinsamen Stelle p dieselben Voraussetzungen erfüllt (Fall (5,8), nicht symmetrisch, Unterfall B) und dass die Rollen von a und b dabei genau vertauscht werden (a′_t(p) = −b_t(Jp), b′_t(p) = a_t(Jp)).
4. **Satz F, Schritt 1:** dass φ auf ganz ℙ¹ definiert ist und an τ_t mit π_D(ν_E(τ_t)) übereinstimmt, und der Grad d ≤ 3. Für Schritt 3 reicht d·e + 1 ≤ 10 < 13. Die feinere Aussage d = e = 3 aus S2-16 wird nicht gebraucht.
5. **Satz F, Schritt 2 und 3:** Klassen der Graphen in ℙ¹ × ℙ¹ und Bézout für zwei verschiedene irreduzible Kurven, in jeder Charakteristik (auch bei inseparablem φ ist die Klasse des Graphen d·h_1 + h_2 mit d = max(deg f, deg g)).
6. **Satz F, Schritt 4:** dass Γ_1 = Γ_2 eine invertierbare Matrix M mit M b_t ∥ a_t an derselben Stelle p liefert, und dass das (V1) widerspricht.

---

## 10. Statusübersicht

| Aussage | Status |
|---|---|
| Lemma K (zwei Faktorisierungen von (Xp) ⊗ (Yp)), jeder Körper | behauptet (Abschnitt 3.1; Kern erschöpfend gegengeprüft über 𝔽₂, 𝔽₃, 𝔽₅, Abschnitt 6) |
| Lemma Z: im Fall (5,8) Klassen der Größe ≤ 2, mindestens 13 verschiedene Punkte a_t(p) ⊗ b_t(p) | behauptet (B-014) |
| (B0) bis (B3): Struktur von Unterfall B, ausgeschrieben | behauptet (aus S2-16, hier vollständig ausgeschrieben) |
| Satz F: Unterfall B unmöglich | behauptet (B-014) |
| Folgerung F1: Fall (5,8) ausgeschlossen | behauptet (B-014; stützt sich auf B-012, B-013) |
| Folgerung F2: R(⟨4,2,4⟩) ≥ 26 über jedem Körper | behauptet (B-014; stützt sich auf B-007 bis B-013) |
| Vermutung B aus S2-16 | wird nicht mehr gebraucht, bleibt vermutet |
| Verfahren mit 25 Produkten | keines gefunden; in Unterfall B nach Satz F keines möglich (behauptet) |

---

## 11. Vorschläge für Runde 7 (vermutet)

1. **Prüfer und Fremdmodell für B-014** (Satz F, Lemma Z, Lemma K), getrennt von den Prüfungen von B-012 und B-013. Schwerpunkte in Abschnitt 9. Bestätigen beide, zählt das nach Regel 2 b) als Fortschritt der Spur A, mit Frist für Status geprüft bis Ende Runde 8.
2. **Lean.** Am einfachsten zuerst Lemma K (reine Polynomalgebra, ein Satz über K[p_1, p_2]) und die Minimalitätsfolgerung „Klassen der Größe ≤ 2“ unter der Voraussetzung (G). Satz F braucht Bézout auf ℙ¹ × ℙ¹ für Graphen. Für Graphen lässt sich das elementar machen: Die gemeinsamen Punkte sind die Fixpunkte von ψ ∘ φ, einer Abbildung vom Grad d·e, also die Nullstellen der binären Form τ_2 F(τ) − τ_1 G(τ) vom Grad d·e + 1, wenn ψ ∘ φ = [F : G] ≠ id. Das vermeidet Schnitttheorie. Der schwerste Teil der Formalisierung bleibt S2-16 (Kronecker, Lemma P).
3. **Ist die Kette geprüft, ist das Fertig-Kriterium von Stufe 2 erst mit einem Lean-Beweis erfüllt.** Bis dahin ist R(⟨4,2,4⟩) ≥ 26 behauptet und darf nicht als Ergebnis bezeichnet werden.

---

## 12. Dateien

- `lean/prosa/s2_444_spurA_r6.md`: dieser Bericht.
- `behauptungen/B-014.md`: Satz F mit Folgerungen F1, F2.
- `versuche/s2-24/klassen_lemma.py`: erschöpfende Gegenprobe zu Lemma K. Aufruf aus `versuche/s2-24/`: `python3 klassen_lemma.py` (Python 3, keine weiteren Pakete). Ausgabe `klassen_lemma_ausgabe.txt`.

Rechenzeit dieser Runde: 6 Sekunden auf einem Kern. Nichts läuft im Hintergrund weiter.
