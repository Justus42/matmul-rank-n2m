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
