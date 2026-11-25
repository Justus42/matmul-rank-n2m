<!-- S2-19: Grundlage des Auftrags an das Fremdmodell (openai/gpt-6.2-sol, Denkstufe high, Batch über die Bridge, 25.11.2026, Kennung openrouter:batch-1795617729-Ylxsu1rXq2A1w9t9rena). Die tatsächlich gesendete Fassung enthielt denselben Fragenkatalog, dieselbe Behauptung, dieselben Prosa-Abschnitte und alle hier stehenden Lean-Definitionen und Satzaussagen wörtlich; zusätzlich ausgelassen waren dort die Beweise der Lemmata 6, 8, 9, 10, 11, 13 in der Prosa, die Beweise der benutzten Lean-Hilfssätze (nur Aussagen) und der Schulalgorithmus. Aus SatzA444.lean gingen alle Definitionen und Satzaussagen mit, Beweise nur für lemma13Prime_statement, satzA_inequalities, satzA, satzA_statement, satzA_exists, satzA_global, corollaryA1 und cases_A1_iff; aus Lemma13Prime.lean der Kopfkommentar (Abschnitt „Form used here“), sDim und die Aussagen von lemma13Prime und exists_common_kernel_of_sDim_eq_zero. Ein eigenes Urteil des Prüfers enthielt der Auftrag nicht. -->

Du bist ein unabhängiger Prüfer für einen Aussagen-Abgleich zwischen einer mathematischen Prosa-Behauptung und Lean-4-Sätzen (Lean 4.19.0, mathlib-Revision c44e0c8). Du kannst nichts ausführen; urteile aus dem Text.

FRAGE: Sind die Lean-Sätze SatzA444.satzA, SatzA444.satzA_statement (mit der Definition SatzAStatement) und SatzA444.satzA_global, zusammen mit Lemma13Prime.lemma13Prime, SatzA444.lemma13Prime_statement, SatzA444.exists_common_kernel, SatzA444.corollaryA1 und SatzA444.corollaryA2, wirklich die behauptete Aussage B-008 (unten)?

Prüfe insbesondere und beantworte jeden Punkt mit JA / NEIN / TEILWEISE und Begründung:
1. Format: Ist es wirklich <4,2,4> (4×2-Matrix mal 2×4-Matrix), und ist BilinearAlgorithm eine treue Definition einer Zerlegung der Länge r (A·B = Σ α_t(A) β_t(B) C_t)?
2. Länge: Ist es wirklich Länge 25?
3. Körper: Gilt die Aussage über jedem Körper (auch Charakteristik 2, endliche Körper)? Ist der Übergang zum algebraischen Abschluss in satzA_global korrekt modelliert?
4. Zahlen: Sind ρ = 3 und die Fälle (rk L, rk H) ∈ {(3,6),(4,7),(5,7),(5,8)} korrekt wiedergegeben? Sind L, H, F_i, Q, ρ (IsGreatest über rkComb) treu zu den Prosa-Definitionen? Insbesondere: F_i, L, H landen in (K^25)/J statt in Q = ker W / J – ändert das die Ränge?
5. Normalform: Entsprechen SN1 und SN2 den Bedingungen (N1), (N2) der Prosa? Ist „für jedes zulässige u_0" durch die Allquantifizierung über alle Algorithmen mit SN1, SN2 abgedeckt?
6. Versteckte Zusatzannahmen oder leer wahre Aussagen: Gibt es Voraussetzungen, die unerfüllbar sein könnten (außer der offenen Frage, ob es überhaupt eine Zerlegung der Länge 25 gibt)? Gilt satzA_global für jede Zerlegung der Länge 25 und nicht nur für Normalformen? Was folgt daraus, dass satzA_global das alg' nicht ausdrücklich mit alg verknüpft?
7. Lemma 13′: Die Prosa sagt rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉ mit s = dim(F_2(ker F_1) + F_3(ker F_1)) nach Basiswechsel mit rk F_1 = ρ; Lean sagt 3ρ + 2s + rk L ≤ 2 rk H mit s = dim Σ_i F_i(ker Σ γ_j F_j) für einen Maximierer γ. Ist das gleichwertig (Rundung, Basiswechsel)?
8. Folgerungen A1, A2 und exists_common_kernel: treu zur Prosa (soweit formalisiert)? Was fehlt gegenüber B-008?
9. Gesamturteil: Ist der Lean-Satz die behauptete Aussage? Nenne alle Abweichungen, auch kleine.

Antworte auf Deutsch, strukturiert nach den Punkten 1 bis 9.

=================== BEHAUPTUNG B-008 (wörtlich) ===================
Aussage: Hat ⟨4,2,4⟩ über einem Körper K eine Zerlegung (Z) der Länge 25, so gilt in Yangs Normalform über dem algebraischen Abschluss von K, für jedes zulässige u_0: ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}. Bezeichnungen wie in lean/prosa/yang_n4.md (Q = ker W / J, F_i, L, H, ρ). Dazu Folgerung A1 (in (3,6), (4,7), (5,8) ist Φ surjektiv auf im L × Q³ und ker L → Q³/im H ein Isomorphismus) und A2 (rk L = 5 ⇒ Ĵ = ker W).

=================== PROSA: Definitionen aus lean/prosa/yang_n4.md, Abschnitte 0 bis 4 (wörtlich) ===================
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

=================== PROSA: yang_n4.md, Lemma 10 bis Folgerung (1),(2) und Lemma 13 (wörtlich) ===================
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


=================== PROSA: lean/prosa/s2_444_spurA_r2.md Abschnitte 2 bis 4 (wörtlich) ===================
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


=================== LEAN: YangBounds/Basic.lean, Kopf und Definitionen (Beweise des Schulalgorithmus ausgelassen) ===================
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Nat.Find
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Logic.Equiv.Fin.Basic
import MatrixMultiplicationLowerBound25

/-!
# Bilinear algorithms and the tensor rank of `⟨n, l, m⟩`

Task S1-01 (stage 1, round 1). Status of every statement in this project: `behauptet`.

This file contains the definitions on which the formalisation of
J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*,
arXiv:2609.14393v3 (12.10.2026), builds.

Definition used by Yang (Section 1): an `R`-rank decomposition of `⟨k, l, m⟩` is a list of
linear maps `α_r : F^{k×l} → F`, `β_r : F^{l×m} → F` and matrices `C_r ∈ F^{k×m}`
(`0 ≤ r < R`) such that `A B = ∑_r α_r(A) β_r(B) C_r` for all `A`, `B`.
`R(⟨k, l, m⟩)` is the smallest `R` for which a decomposition exists.

`BilinearAlgorithm K n l m r` is exactly such a decomposition of length `r` over the field `K`,
and `tensorRank K n l m` is the smallest such `r`.

For `n = 3`, `l = 2` the structure coincides field by field with
`MatrixMultiplicationLowerBound.MatrixAlgorithm` from the external dependency
`fallnlove/mm325_proof` (commit `759cf4a`), which is imported, not copied
(protocol section 11.3). `tensorRank_three_two_eq` connects the two rank notions.
-/

namespace YangBounds

open scoped BigOperators

universe u

/-- A bilinear algorithm of length `r` for `⟨n, l, m⟩` matrix multiplication over `K`:
linear forms `alpha k` on `n × l` matrices, linear forms `beta k` on `l × m` matrices and
fixed `n × m` matrices `coeff k` with `A * B = ∑ k, (alpha k A * beta k B) • coeff k`
for all `A`, `B`. Here `A * B` is the ordinary mathlib matrix product. -/
structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
  alpha : Fin r → (Matrix (Fin n) (Fin l) K →ₗ[K] K)
  beta : Fin r → (Matrix (Fin l) (Fin m) K →ₗ[K] K)
  coeff : Fin r → Matrix (Fin n) (Fin m) K
  correct : ∀ (A : Matrix (Fin n) (Fin l) K) (B : Matrix (Fin l) (Fin m) K),
    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k

variable {K : Type u} [Field K]

/-- The linear form `M ↦ M i j`. -/
def entryForm {a b : ℕ} (i : Fin a) (j : Fin b) : Matrix (Fin a) (Fin b) K →ₗ[K] K where
  toFun M := M i j
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- The matrix unit with a `1` at position `(i, j)`. -/
def unitMatrix {a b : ℕ} (i : Fin a) (j : Fin b) : Matrix (Fin a) (Fin b) K :=
  Matrix.of fun i' j' => if i' = i ∧ j' = j then 1 else 0

/-- The schoolbook algorithm with one product `A i k * B k j` for every triple `(i, k, j)`,
indexed through an enumeration of `Fin n × Fin l × Fin m`. -/
noncomputable def standardAlgorithm (K : Type u) [Field K] (n l m : ℕ) :
    BilinearAlgorithm K n l m (Fintype.card (Fin n × Fin l × Fin m)) where
  alpha k := entryForm ((Fintype.equivFin _).symm k).1 ((Fintype.equivFin _).symm k).2.1
  beta k := entryForm ((Fintype.equivFin _).symm k).2.1 ((Fintype.equivFin _).symm k).2.2
  coeff k := unitMatrix ((Fintype.equivFin _).symm k).1 ((Fintype.equivFin _).symm k).2.2
  correct A B := by
    rw [Equiv.sum_comp (Fintype.equivFin (Fin n × Fin l × Fin m)).symm
      (fun t => (entryForm t.1 t.2.1 A * entryForm t.2.1 t.2.2 B) • unitMatrix t.1 t.2.2)]
    ext a b
    simp only [Matrix.mul_apply, Matrix.sum_apply, Matrix.smul_apply, entryForm,
...
noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ := by
  classical
  exact Nat.find (exists_bilinearAlgorithm K n l m)

variable {n l m r : ℕ}

=================== LEAN: YangBounds/YangN3Teil1.lean, extendForm und baseChange (Definitionen) ===================
noncomputable def extendForm {a b : ℕ} (f : Matrix (Fin a) (Fin b) K →ₗ[K] K) :
    Matrix (Fin a) (Fin b) L →ₗ[L] L :=
  ∑ i : Fin a, ∑ j : Fin b, algebraMap K L (f (unitMatrix i j)) • entryForm i j

theorem extendForm_apply {a b : ℕ} (f : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (A : Matrix (Fin a) (Fin b) L) :
    extendForm (L := L) f A = ∑ i : Fin a, ∑ j : Fin b, algebraMap K L (f (unitMatrix i j)) * A i j := by
  simp [extendForm, LinearMap.coeFn_sum, Finset.sum_apply, entryForm, Algebra.smul_def]
/-- **Step R1.** An algorithm of length `r` over `K` is an algorithm of length `r` over every
extension field `L`: the linear forms are extended by their coefficients and the matrices
`coeff t` are mapped entrywise by `algebraMap K L`. -/
noncomputable def BilinearAlgorithm.baseChange (alg : BilinearAlgorithm K n l m r)
    (L : Type v) [Field L] [Algebra K L] : BilinearAlgorithm L n l m r where
  alpha t := extendForm (alg.alpha t)
  beta t := extendForm (alg.beta t)
  coeff t := (alg.coeff t).map (algebraMap K L)
  correct A B := by ... (Beweis ausgelassen)

=================== LEAN: YangBounds/YangN3Teil3.lean, Definition emb ===================
/-- Parametrisation of `U`: `y ↦` the `2 × m` matrix with row 0 zero and row 1 equal to `y`. -/
def emb : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K where
  toFun y := Matrix.of ![0, y]
  map_add' y z := by ext i j; fin_cases i <;> simp
  map_smul' c y := by ext i j; fin_cases i <;> simp


=================== LEAN: YangBounds/YangN4Haupt.lean, Zeilen 60-126 und 195-210 (schiefe Erweiterung, Lemma13Statement, rkComb) ===================
namespace YangBounds
namespace YangN4Haupt

open Module

universe u v w

/-! ## Skew-symmetric matrices, skew extension, and the statement of Lemma 13 -/

section Skew

variable (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V]

/-- `V^{∧d}`: the `d × d` matrices `c` with entries in `V` such that `c_{i,i} = 0` and
`c_{j,i} = -c_{i,j}` (prose Section 4; the diagonal condition is required explicitly, which
matters in characteristic 2). -/
def skewSpace (d : ℕ) : Submodule K (Fin d → Fin d → V) where
  carrier := {c | (∀ i, c i i = 0) ∧ ∀ i j, c j i = -c i j}
  zero_mem' := ⟨fun _ => rfl, fun _ _ => by simp⟩
  add_mem' := by
    rintro a b ⟨ha1, ha2⟩ ⟨hb1, hb2⟩
    refine ⟨fun i => by simp [ha1 i, hb1 i], fun i j => ?_⟩
    simp only [Pi.add_apply, ha2 i j, hb2 i j, neg_add]
  smul_mem' := by
    rintro c a ⟨ha1, ha2⟩
    refine ⟨fun i => by simp [ha1 i], fun i j => ?_⟩
    simp only [Pi.smul_apply, ha2 i j, smul_neg]

variable {K V}

/-- The skew extension `h : V^{∧d} → Y^d`, `h(c) = (λ(c_{1,:}), …, λ(c_{d,:}))`, of a linear
map `λ : V^d → Y` (prose Section 4). -/
def skewExt {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ}
    (lam : (Fin d → V) →ₗ[K] Y) : skewSpace K V d →ₗ[K] (Fin d → Y) :=
  LinearMap.pi fun i => lam ∘ₗ (LinearMap.proj i) ∘ₗ (skewSpace K V d).subtype

@[simp] theorem skewExt_apply {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ}
    (lam : (Fin d → V) →ₗ[K] Y) (c : skewSpace K V d) (i : Fin d) :
    skewExt lam c i = lam ((c : Fin d → Fin d → V) i) := rfl

/-- `L(u_1, …, u_d) = ∑ F_i(u_i)` on `U^d`. -/
def sumMap {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ} (F : Fin d → V →ₗ[K] Y) :
    (Fin d → V) →ₗ[K] Y :=
  ∑ i, F i ∘ₗ LinearMap.proj i

@[simp] theorem sumMap_apply {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ}
    (F : Fin d → V →ₗ[K] Y) (u : Fin d → V) : sumMap F u = ∑ i, F i (u i) := by
  simp [sumMap]

end Skew

/-- **Statement of Lemma 13** (prose `lean/prosa/yang_n4.md`, Section 6, repaired form), for a
field `K` and spaces `U`, `Q`: if `U`, `Q` are finite-dimensional, `d ≥ 2`,
`F_1, …, F_d : U → Q` are linear, `L = sumMap F`, `H = skewExt L`, and `ρ` is the maximum of
`rk(∑ γ_i F_i)` over `γ ∈ K^d`, then `2·rk H ≥ d·ρ + (d−2)·rk L`.

This is a `Prop`, used only as a hypothesis; it is proved (or not) in `YangN4Lemma13.lean`. -/
def Lemma13Statement (K : Type u) [Field K] (U : Type v) (Q : Type w)
    [AddCommGroup U] [Module K U] [AddCommGroup Q] [Module K Q] : Prop :=
  FiniteDimensional K U → FiniteDimensional K Q →
  ∀ (d : ℕ), 2 ≤ d → ∀ (F : Fin d → U →ₗ[K] Q) (ρ : ℕ),
    IsGreatest (Set.range fun γ : Fin d → K => finrank K (LinearMap.range (∑ i, γ i • F i))) ρ →
    d * ρ + (d - 2) * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F)))

/-! ## Abstract linear algebra for Lemma 15 -/

...

/-- The family `γ ↦ rk(∑ γ_i F_i)`. -/
noncomputable def rkComb (F : Fin d → U →ₗ[K] Q) (γ : Fin d → K) : ℕ :=
  finrank K (LinearMap.range (∑ i, γ i • F i))

theorem rkComb_le (F : Fin d → U →ₗ[K] Q) (γ : Fin d → K) : rkComb F γ ≤ finrank K U :=
  LinearMap.finrank_range_le _

/-- The maximum `ρ` exists. -/
theorem exists_isGreatest_rkComb (F : Fin d → U →ₗ[K] Q) :
    ∃ ρ, IsGreatest (Set.range (rkComb F)) ρ := by
  refine ⟨sSup (Set.range (rkComb F)), Nat.sSup_mem ⟨_, ⟨0, rfl⟩⟩ ⟨finrank K U, ?_⟩,
    fun x hx => le_csSup ⟨finrank K U, ?_⟩ hx⟩
  · rintro _ ⟨γ, rfl⟩; exact rkComb_le F γ
  · rintro _ ⟨γ, rfl⟩; exact rkComb_le F γ


=================== LEAN: YangBounds/YangN4Haupt.lean, Zeilen 300-389 (Objekte, vollständig) ===================
/-! ## The objects of the proof for `⟨d+1, 2, m⟩` (prose Sections 1, 3, 4) -/

section Objects

variable {K : Type u} [Field K] {d m r : ℕ}

/-- `e_{i,j}` as an `(d+1) × 2` matrix. -/
abbrev eA (i : Fin (d + 1)) (j : Fin 2) : Matrix (Fin (d + 1)) (Fin 2) K := unitMatrix i j

/-- The vector `(α_0(A), …, α_{r-1}(A))`; `D(A) t` is `avec alg A * t`. -/
def avec (alg : BilinearAlgorithm K (d + 1) 2 m r) (A : Matrix (Fin (d + 1)) (Fin 2) K) :
    Fin r → K :=
  fun k => alg.alpha k A

/-- `ℬ(B) = (β_0(B), …, β_{r-1}(B))`. -/
def bvec (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  LinearMap.pi alg.beta

/-- `x ↦ D(A) ℬ(x)`. -/
def prodMap (alg : BilinearAlgorithm K (d + 1) 2 m r) (A : Matrix (Fin (d + 1)) (Fin 2) K) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) where
  toFun x k := alg.alpha k A * alg.beta k x
  map_add' x y := by ext k; simp [mul_add]
  map_smul' c x := by
    ext k
    simp only [map_smul, smul_eq_mul, Pi.smul_apply, RingHom.id_apply]
    ring

/-- `f_i(x) = D(e_{i,0}) ℬ(x)` (prose Section 3). -/
def fv (alg : BilinearAlgorithm K (d + 1) 2 m r) (i : Fin (d + 1)) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  prodMap alg (eA i 0)

/-- `W(t) = ∑_k t_k C_k`. -/
def W (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    (Fin r → K) →ₗ[K] Matrix (Fin (d + 1)) (Fin m) K where
  toFun t := ∑ k, t k • alg.coeff k
  map_add' s t := by simp [add_smul, Finset.sum_add_distrib]
  map_smul' c t := by simp [Finset.smul_sum, smul_smul]

/-- (N1): `D(e_{0,0})` is invertible. -/
def SN1 (alg : BilinearAlgorithm K (d + 1) 2 m r) : Prop :=
  ∀ k, alg.alpha k (eA 0 0) ≠ 0

/-- (N2): for `v ≠ 0` the vectors `f_0(v), …, f_d(v)` are linearly independent. -/
def SN2 (alg : BilinearAlgorithm K (d + 1) 2 m r) : Prop :=
  ∀ v : Matrix (Fin 2) (Fin m) K, v ≠ 0 → LinearIndependent K (fun i => fv alg i v)

/-- `y ↦ (y; 0)`: the `2 × m` matrix with row `0` equal to `y` and row `1` zero. -/
def top : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K where
  toFun y := Matrix.of ![y, 0]
  map_add' y z := by ext i j; fin_cases i <;> simp
  map_smul' c y := by ext i j; fin_cases i <;> simp

/-- `U` parametrised by `emb y = (0; y)` (from `YangN3Teil3`). -/
abbrev emb : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K := YangN3Teil3.emb

variable (alg : BilinearAlgorithm K (d + 1) 2 m r)

/-- `f_i` on `U`. -/
def φ (i : Fin (d + 1)) : (Fin m → K) →ₗ[K] (Fin r → K) := (fv alg i) ∘ₗ emb

/-- `g` on `U`: `g(x) = D(e_{0,1}) ℬ(x) − D(e_{0,0}) ℬ(e_{0,1}^{(2×2)} x)`, with
`e_{0,1}^{(2×2)} (0; y) = (y; 0)`. -/
def gU : (Fin m → K) →ₗ[K] (Fin r → K) :=
  (prodMap alg (eA 0 1)) ∘ₗ emb - (prodMap alg (eA 0 0)) ∘ₗ top

/-- `J = f_0(U)`. -/
def J : Submodule K (Fin r → K) := LinearMap.range (φ alg 0)

/-- The quotient map onto `(Fin r → K) ⧸ J`. -/
def π : (Fin r → K) →ₗ[K] (Fin r → K) ⧸ J alg := (J alg).mkQ

/-- `Q = ker W / J`, realised inside `(Fin r → K) ⧸ J`. -/
def Kbar : Submodule K ((Fin r → K) ⧸ J alg) := (LinearMap.ker (W alg)).map (π alg)

/-- `F_i : U → Q`, `F_i(x) = [f_i(x)]`, for the prose indices `i = 1, …, d` (here `i.succ`). -/
def Fq (i : Fin d) : (Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg := (π alg) ∘ₗ φ alg i.succ

/-- `ℓ(u_1, …, u_d) = ∑ f_i(u_i)`. -/
def ell : (Fin d → Fin m → K) →ₗ[K] (Fin r → K) := sumMap fun i => φ alg i.succ

/-- `L = [ℓ]`. -/
def Lq : (Fin d → Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg := sumMap (Fq alg)

/-- `H`, the skew extension of `L`. -/
def Hq : skewSpace K (Fin m → K) d →ₗ[K] (Fin d → (Fin r → K) ⧸ J alg) := skewExt (Lq alg)

end Objects

=================== LEAN: YangN4Haupt.lean, Mvec, Φ₂, Φ, Aussagen benutzter Sätze ===================
  rw [Fintype.sum_prod_type] at key
  simpa [Finset.mul_sum] using key

/-- `(u, c) ↦ −g(u_i) + h(c)_i ∈ ker W` (before passing to `Q`). -/
def Mvec (i : Fin d) : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d →ₗ[K] (Fin r → K) :=
  -(gU alg ∘ₗ LinearMap.proj i ∘ₗ LinearMap.fst K _ _) +
    ell alg ∘ₗ LinearMap.proj i ∘ₗ (skewSpace K (Fin m → K) d).subtype ∘ₗ LinearMap.snd K _ _

theorem Mvec_apply (i : Fin d) (x : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d) :
    Mvec alg i x = -(gU alg (x.1 i)) + ell alg ((x.2 : Fin d → Fin d → Fin m → K) i) := rfl

theorem Mvec_mem (i : Fin d) (x : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d) :
    Mvec alg i x ∈ LinearMap.ker (W alg) := by
  rw [Mvec_apply]
  exact Submodule.add_mem _ (Submodule.neg_mem _ (gU_mem_ker alg _)) (ell_mem_ker alg _)

/-- The second component of `Φ`, `(u, c) ↦ [−g(u_i) + h(c)_i] ∈ Q`, with values in `Kbar`. -/
def Φ₂ : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d →ₗ[K] (Fin d → Kbar alg) :=
  LinearMap.pi fun i =>
    LinearMap.codRestrict (Kbar alg) ((π alg) ∘ₗ Mvec alg i)
      (fun x => Submodule.mem_map_of_mem (Mvec_mem alg i x))

/-- `Φ(u, c) = ([ℓ(u)], ([−g(u_i) + h(c)_i])_i)` (prose Section 5). -/
def Φ : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d →ₗ[K]
    ((Fin r → K) ⧸ J alg) × (Fin d → Kbar alg) :=
  ((Lq alg) ∘ₗ LinearMap.fst K _ _).prod (Φ₂ alg)

theorem G3 : finrank K (LinearMap.ker (W alg)) + (d + 1) * m = r := by
  (Beweis ausgelassen)
theorem finrank_J (h1 : SN1 alg) : finrank K (J alg) = m := by
  (Beweis ausgelassen)
theorem finrank_Kbar (h1 : SN1 alg) : finrank K (Kbar alg) + (d + 2) * m = r := by
  (Beweis ausgelassen)
theorem range_Lq_le_Kbar : LinearMap.range (Lq alg) ≤ Kbar alg := by
  (Beweis ausgelassen)
theorem ker_Φ (h1 : SN1 alg) :
    LinearMap.ker (Φ alg) = (LinearMap.ker (Hq alg)).map (LinearMap.inr K _ _) := by
  (Beweis ausgelassen)
theorem ineq1 (h1 : SN1 alg) :
    d * m + finrank K (LinearMap.range (Hq alg)) ≤
      finrank K (LinearMap.range (Lq alg)) + d * finrank K (Kbar alg) := by
  (Beweis ausgelassen)
theorem lemma8' (h1 : SN1 alg) (h2 : SN2 alg) (hm : 1 ≤ m) :
    d ≤ finrank K (LinearMap.range (Lq alg)) := by
  (Beweis ausgelassen)
theorem lemma14 (h1 : SN1 alg) (h2 : SN2 alg) (hm : d ≤ m) {ρ : ℕ}
    (hρ : IsGreatest (Set.range (rkComb (Fq alg))) ρ) : d ≤ ρ := by
  (Beweis ausgelassen)
theorem exists_normalized [Infinite K] (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    ∃ r' ≤ r, ∃ alg' : BilinearAlgorithm K (d + 1) 2 m r', SN1 alg' ∧ SN2 alg' := by
  (Beweis ausgelassen)

=================== LEAN: YangBounds/Statements.lean, yang_theorem_two und yang_theorem_two_algorithm ===================
theorem yang_theorem_two (K : Type u) [Field K] (n m : ℕ) (hn : 4 ≤ n) (hnm : n ≤ m) :
    (n + 2) * m + (n - 3) ≤ tensorRank K n 2 m :=
  -- S1-17: main proof from S1-16 (`YangBounds/YangN4Haupt.lean`) with Lemma 13 from S1-15
  -- (`YangBounds/YangN4Lemma13.lean`) inserted for its hypothesis
  YangN4Haupt.yang_theorem_two_of_lemma13
-
theorem yang_theorem_two_algorithm (K : Type u) [Field K] (n m : ℕ) (hn : 4 ≤ n) (hnm : n ≤ m)
    {r : ℕ} (alg : BilinearAlgorithm K n 2 m r) : (n + 2) * m + (n - 3) ≤ r :=
  (yang_theorem_two K n m hn hnm).trans (tensorRank_le alg)

/-! ## Consequences (derived from the statements above) -/

=================== LEAN: YangBounds/Lemma13Prime.lean, Kopf, sDim, lemma13Prime (Aussage), exists_common_kernel_of_sDim_eq_zero (vollständig) ===================
import YangBounds.YangN4Lemma13

/-!
# Lemma 13′: a sharpening of Yang's Lemma 13

Task S2-14 (stage 2, round 4, track A, role: formaliser). Status of every statement in this
file: `behauptet` (nothing here is `geprüft` before the statement check of protocol 5.1).

Source: `lean/prosa/s2_444_spurA_r2.md` (task S2-05), Section 4, "Lemma 13′", checked in
`lean/prosa/s2_444_spurA_r2_pruefung.md` (task S2-09), Section 2.4. Lemma 13 itself is Yang's
(arXiv:2609.14393v3); the sharpening by the term `s` is from S2-05.

## Statement (prose, Section 4, for `d = 3`)

Let `U`, `Q` be finite-dimensional, `F_1, F_2, F_3 : U → Q` linear, `L`, `H`, `ρ` as in
Lemma 13. After the change of basis of Lemma 13, Step 1, `rk F_1 = ρ`. Let
`s := dim(F_2(ker F_1) + F_3(ker F_1))`. Then `rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉`.

## Form used here (no change of basis in the statement)

The change of basis replaces `F_1` by `G = ∑ γ_i F_i` for a `γ` with `rk G = ρ`. The
statement is formulated without the change of basis, with

  `s(γ) := dim ∑_i F_i(ker G)`   (`sDim G F` below, the sum over **all** `i`).

This is the prose `s` for the changed basis: on `ker G` the new `F′_1 = G` vanishes, and the
other new maps `F′_2, F′_3` together with `G` span the same space as `F_1, F_2, F_3`, so
`F′_2(ker G) + F′_3(ker G) = ∑_i F_i(ker G)` (proved below as an inequality `≤`, which is the
direction needed for the bound).

The ceiling is removed by doubling: for natural numbers,
`rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉` is equivalent to `3ρ + 2s + rk L ≤ 2 rk H`
(`rk L ≥ ρ` is not needed for this direction). The Lean statement is the doubled form, for a
general number `e + 2` of maps (the prose has `e = 1`):

  `(e + 2)·rk G + 2·s(γ) + e·rk L ≤ 2·rk H`.

For `e = 1` this is `3ρ + 2s + rk L ≤ 2 rk H`; with `s ≥ 0` it gives back Lemma 13.

## Main results

* `lemma13Prime_core`: the count with `F 0` in the role of `F_1` (prose `s` literally).
* `lemma13Prime_of_gamma`: for every `γ ≠ 0`.
* `lemma13Prime`: with `ρ` the maximum and a maximising `γ` (also for `γ = 0`).
* `Lemma13PrimeStatement`, `lemma13Prime_statement`: the statement for `d = 3` as a `Prop`,
  in the notation of `YangN4Haupt.lean` (for use as a hypothesis by task S2-15).
* `exists_common_kernel_of_sDim_eq_zero`: if `rk G < dim U` and `s(γ) = 0`, the `F_i` have a
  common kernel vector `x ≠ 0` (prose remark "s = 0 heißt: k liegt im gemeinsamen Kern").

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace Lemma13Prime

open Module YangN4Lemma13

universe u v w

variable {K : Type u} [Field K] {U : Type v} [AddCommGroup U] [Module K U]
  {Q : Type w} [AddCommGroup Q] [Module K Q]

/-- `s(γ) = dim ∑_i F_i(ker G)` for a linear map `G` (in the application `G = ∑ γ_i F_i`). -/
noncomputable def sDim {d : ℕ} (G : U →ₗ[K] Q) (F : Fin d → U →ₗ[K] Q) : ℕ :=
  finrank K (⨆ i, (LinearMap.ker G).map (F i) : Submodule K Q)

/-! ## The core count with `F 0` distinguished -/

section Core

variable [FiniteDimensional K Q] {e : ℕ}

/-- The prose `s` for `F 0` in the role of `F_1`: `dim ∑_{j ≥ 1} F_j(ker F_0)`. -/
noncomputable def sCore (F : Fin (e + 2) → U →ₗ[K] Q) : ℕ :=
  finrank K (⨆ j : Fin (e + 1), (LinearMap.ker (F 0)).map (F j.succ) : Submodule K Q)

...
/-- **Lemma 13′** (prose Section 4, doubled form, `e + 2` maps), with `ρ` the maximum of
`rk(∑ γ_i F_i)` and `γ` any maximiser: `(e+2)·ρ + 2·s(γ) + e·rk L ≤ 2·rk H`. -/
theorem lemma13Prime {e : ℕ} (F : Fin (e + 2) → U →ₗ[K] Q) (ρ : ℕ)
    (hρ : IsGreatest (Set.range fun γ : Fin (e + 2) → K =>
      finrank K (LinearMap.range (∑ i, γ i • F i))) ρ)
    (γ : Fin (e + 2) → K) (hγρ : finrank K (LinearMap.range (∑ i, γ i • F i)) = ρ) :
    (e + 2) * ρ + 2 * sDim (∑ i, γ i • F i) F + e * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  (Beweis ausgelassen)
omit [FiniteDimensional K Q] in
/-- If `rk G < dim U` and `s(γ) = 0`, then the `F_i` have a common kernel vector `x ≠ 0`
(prose Section 4, remark: "s = 0 heißt: k liegt im gemeinsamen Kern N"). -/
theorem exists_common_kernel_of_sDim_eq_zero [FiniteDimensional K U] {d : ℕ}
    (G : U →ₗ[K] Q) (F : Fin d → U →ₗ[K] Q)
    (hG : finrank K (LinearMap.range G) < finrank K U) (hs : sDim G F = 0) :
    ∃ x : U, x ≠ 0 ∧ ∀ i, F i x = 0 := by
  have hker : LinearMap.ker G ≠ ⊥ := by
    intro h
    have := LinearMap.finrank_range_add_finrank_ker G
    rw [h, finrank_bot] at this
    omega
  obtain ⟨x, hx, hx0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hker
  refine ⟨x, hx0, fun i => ?_⟩
  have hbot : (⨆ i, (LinearMap.ker G).map (F i) : Submodule K Q) = ⊥ :=
    Submodule.finrank_eq_zero.mp hs
  have : F i x ∈ (⨆ i, (LinearMap.ker G).map (F i) : Submodule K Q) :=
    (le_iSup (fun i => (LinearMap.ker G).map (F i)) i) ⟨x, hx, rfl⟩
  rw [hbot] at this
  exact (Submodule.mem_bot K).mp this

end Gamma

end Lemma13Prime
end YangBounds

=================== LEAN: YangBounds/SatzA444.lean (vollständig) ===================
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
