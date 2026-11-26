# Die Kette zu R(⟨3,2,7⟩) ≥ 35 in einem Beweis (S5-01)

> **Hinweis vorab.** Die hier zusammengeführte Kette hat den Status **behauptet**. Sie ist kein Ergebnis und wird nicht als Ergebnis bezeichnet. Diese Datei nennt zu keinem einzelnen Glied einen Status und kein Urteil. Den Status setzt nur der Orchestrator.

- Auftrag: S5-01, Stufe 5, Spur K. Rolle: Beweissucher, hier nur Zusammenführung, kein neuer Beweisangriff.
- Datum: 26.11.2026. Beginn und Ende stehen in den Git-Zeitstempeln des Zweigs `claude/project-thread-8cqad1`.
- Zweck: Jedes Glied der Kette, aus der R_F(⟨3,2,7⟩) ≥ 35 für jeden Körper F folgen würde, mit vollständigem Wortlaut, allen Voraussetzungen und vollständigem Beweis. Die Datei soll **für sich allein lesbar** sein. Alle Bezeichnungen und Hilfsaussagen stehen hier. Verweise auf andere Dateien des Repos stehen nur in den Zeilen „Herkunft“ und dienen der Nachverfolgung. Für das Verständnis braucht man sie nicht.
- Kein Lean, keine Subagenten, kein Fremdmodell. Eine Rechnung (unter 1 Sekunde) zur Kontrolle von Glied K-19.

---

## 0. Lesehinweise

**Aufbau.** Abschnitt 1 erklärt alle Begriffe. Abschnitt 2 enthält Hilfssätze aus Algebra und Geometrie (Glieder K-1 bis K-6). Abschnitt 3 enthält die Grundlagen über Verfahren, Basiswechsel und Normalform (K-7 bis K-12). Abschnitt 4 enthält Yangs Maschine für n = 3 und den Restfall (K-13 bis K-20). Abschnitt 5 übersetzt in Koordinaten (K-21 bis K-27). Abschnitt 6 bestimmt die Gestalt und zeigt Satz R in den Fällen e = 3 und e = 2 (K-28 bis K-31). Abschnitt 7 behandelt allgemeine Normalformen (K-32 bis K-35). Abschnitt 8 zeigt, dass keine Normalform e = 3 hat (K-36 bis K-38). Abschnitt 9 zeigt, dass jedes Verfahren der Länge 34 eine Normalform mit e = 3 hat (K-39, K-40). Abschnitt 10 ist der Endsatz (K-41) mit einer Prüfung der Quantoren. Abschnitt 11 ist die Liste der Glieder mit ihren Abhängigkeiten. Abschnitt 12 nennt die Änderungen gegenüber Stufe 4, Abschnitt 13 die offenen Stellen, Abschnitt 14 die Herkunft.

**Gang des Beweises in fünf Sätzen.** Ein Verfahren der Länge 34 hat nach starker Normalisierung (K-11) eine Normalform, und in jeder Normalform liegt man im Restfall (K-19). Daraus entsteht ein Vektor w und eine Zahl e ∈ {2, 3} (K-23). Für jedes Verfahren der Länge 34 gibt es eine Normalform mit e = 3 (K-40, über eine unendliche Familie von Normalformen mit e = 2 und einen festen Kegelschnitt). Keine Normalform hat e = 3 (K-38, über eine allgemeine Normalform und einen lokalen Widerspruch an einem Rang-2-Index). Also gibt es kein Verfahren der Länge 34 (K-41), und mit der unteren Schranke 34 (K-18) folgt R_F(⟨3,2,7⟩) ≥ 35.

**Form eines Glieds.** Jedes Glied hat eine Nummer K-n, einen Wortlaut, eine Zeile „Voraussetzungen“ und einen Beweis. Die Zeile „Voraussetzungen“ nennt alle anderen Glieder, die der Beweis benutzt, und alle Annahmen des Wortlauts. Ein Glied mit dem Zusatz **(zitiert)** würde nicht bewiesen, sondern mit Fundstelle übernommen. In dieser Fassung ist kein Glied der Kette zitiert. Literatur steht nur als Fundstelle bei K-18 und wird nicht benutzt. Jedes Glied soll einzeln beurteilbar sein: Wer ein Glied prüft, darf die Wortlaute der vorausgesetzten Glieder als gegeben nehmen.

**Glied K-20** ist für den Endsatz nicht nötig. Es steht hier, weil es zur Beschreibung des Restfalls gehört (Größe ρ). Kein anderes Glied benutzt es.

**Feste Konventionen.**

- „·“ zwischen zwei Vektoren in K^r ist das komponentenweise Produkt. Vektoren in K^r sind Funktionen auf der Indexmenge {1, …, r}. Für v ∈ K^r und einen Unterraum X ⊆ K^r ist v·X := {v·x : x ∈ X}.
- Für eine Indexmenge X ⊆ {1, …, r} ist K^X der Unterraum der Vektoren, die außerhalb X verschwinden, und v|_X die Einschränkung von v auf X. Für einen Unterraum M ist M|_X := {v|_X : v ∈ M}.
- Matrizen e_{ij} haben eine 1 an der Stelle (i, j) und sonst 0. Die Größe ergibt sich aus dem Zusammenhang, wo nötig steht sie oben: e_{ij}^{(3×2)}, e_{ij}^{(2×2)}.
- Zeilen von A ∈ F^{3×2} heißen 0, 1, 2, Spalten 0, 1. Zeilen von B ∈ F^{2×m} heißen 0, 1, Spalten 1, …, m.
- rk einer linearen Abbildung ist die Dimension ihres Bildes.

---

## 1. Begriffe

### 1.1 Verfahren, Rang, Brent-Gleichungen

Sei F ein Körper, m ≥ 1, r ≥ 0. Ein **Verfahren der Länge r für ⟨3,2,m⟩ über F** besteht aus Linearformen α_t : F^{3×2} → F, Linearformen β_t : F^{2×m} → F und Matrizen C_t ∈ F^{3×m} (t = 1, …, r), so dass

  AB = Σ_{t=1}^{r} α_t(A)·β_t(B)·C_t  für alle A ∈ F^{3×2}, B ∈ F^{2×m}.            (Z)

**R_F(⟨3,2,m⟩)** ist die kleinste Länge eines Verfahrens über F (der Tensorrang).

Die Identität (Z) ist bilinear in (A, B). Sie gilt deshalb genau dann, wenn sie für alle Paare von Basismatrizen gilt:

  Σ_t α_t(e_{ij})·β_t(e_{kl})·C_t = e_{ij}·e_{kl}  für alle i ∈ {0,1,2}, j, k ∈ {0,1}, l ∈ {1, …, m}.   (**Brent-Gleichungen**)

Rechts steht e_{il} ∈ F^{3×m}, falls j = k, und 0 sonst.

**Koeffizientenmatrix.** Jede Linearform α auf F^{3×2} schreibt sich eindeutig als α(X) = Σ_{i,j} α_{ij} X_{ij}. Die Matrix (α_{ij}) ∈ F^{3×2} heißt wieder α. Der **Rang von α_t** ist der Rang dieser Matrix. Für einen Spaltenvektor x ∈ F^3 und einen Zeilenvektor p ∈ F^{1×2} ist xp ∈ F^{3×2} und α(xp) = xᵀ·α·pᵀ.

### 1.2 Yangs Bezeichnungen (für ein Verfahren der Länge r)

- D(A) ∈ F^{r×r} ist die Diagonalmatrix mit den Einträgen α_1(A), …, α_r(A). D ist linear in A. Für einen Vektor v ist D(A)·v = (α_t(A)·v_t)_t.
- ℬ(B) := (β_1(B), …, β_r(B)) ∈ F^r. ℬ ist linear.
- W : F^r → F^{3×m}, W(v) := Σ_t v_t·C_t. W ist linear. **K′ := ker W.**
- (Z) ist gleichwertig zu **W(D(A)·ℬ(B)) = AB** für alle A, B (Z′).
- f_i : F^{2×m} → F^r, **f_i(x) := D(e_{i0}^{(3×2)})·ℬ(x)** für i = 0, 1, 2.
- g : F^{2×m} → F^r, g(x) := D(e_{01}^{(3×2)})·ℬ(x) − D(e_{00}^{(3×2)})·ℬ(e_{01}^{(2×2)}·x). Dabei ist e_{01}^{(2×2)}·x die Matrix, deren Zeile 0 die Zeile 1 von x ist und deren Zeile 1 null ist.
- **U** := {x ∈ F^{2×m} : Zeile 0 von x ist null}. dim U = m.
- **J := f_0(U).**
- **Q := K′/J** (sobald J ⊆ K′ gezeigt ist, Glied K-14). Für y ∈ K′ ist [y] seine Klasse in Q.
- F_i : U → Q, F_i(x) := [f_i(x)] für i = 1, 2.
- ℓ : U × U → K′, ℓ(u_1, u_2) := f_1(u_1) + f_2(u_2). L : U × U → Q, L(u_1, u_2) := [ℓ(u_1, u_2)] = F_1(u_1) + F_2(u_2). **rk L := dim im L.**
- H : U → Q × Q, H(x) := (F_2(x), −F_1(x)). **rk H := dim im H.** **N := ker H = ker F_1 ∩ ker F_2.** Also dim N = m − rk H.
- Φ : U × U × U → im L × Q × Q, Φ(u_1, u_2, x) := ([ℓ(u_1, u_2)], [−g(u_1) + f_2(x)], [−g(u_2) − f_1(x)]).
- **Δ := 2·rk H − rk L.**
- **Ŝ** := {x ∈ N : f_1(x) ∈ f_0(N) und f_2(x) ∈ f_0(N)}. (In den Quellen heißt dieser Raum S. Der Buchstabe S bezeichnet hier nur die Basiswechselmatrix.)
- ρ := max{rk(γ_1F_1 + γ_2F_2) : (γ_1, γ_2) ∈ F²} (nur in Glied K-20).

**Starke Normalisierung.**

- **(SN1)** D(e_{00}) ist invertierbar, das heißt α_t(e_{00}) ≠ 0 für alle t.
- **(SN2)** Für jedes x ∈ F^{2×m} mit x ≠ 0 sind f_0(x), f_1(x), f_2(x) linear unabhängig.

### 1.3 Basiswechsel und Normalform

Sei V = (α_t, β_t, C_t)_{t=1..r} ein Verfahren über einem Körper K. Für S ∈ GL_3(K), T ∈ GL_2(K) ist **V^{(S,T)}** das Verfahren

  α′_t(A) := α_t(S·A·T),  β′_t(B) := β_t(T^{−1}·B),  C′_t := S^{−1}·C_t.

(Dass das ein Verfahren ist, ist Glied K-10.) Die Spalten von S heißen s_0, s_1, s_2, die Zeilen von T heißen p (erste Zeile) und p′ (zweite Zeile).

Ab Abschnitt 3 ist **F ein beliebiger Körper und K ein algebraischer Abschluss von F.** Ein Verfahren über F ist auch eines über K (Glied K-8). Sei V ein Verfahren der Länge r für ⟨3,2,m⟩ über K.

- 𝒢 := GL_3(K) × GL_2(K), als Teilmenge von K^{9+4} mit der Zariski-Topologie (offen sind die Mengen {x ∈ 𝒢 : nicht alle f ∈ M verschwinden in x} für Mengen M von Polynomen).
- **𝒢*** := {(S, T) ∈ 𝒢 : V^{(S,T)} erfüllt (SN1) und (SN2)}.
- Für (S, T) ∈ 𝒢* ist die **Normalform zu (S, T)** das Verfahren V̂, das aus V^{(S,T)} = (α′_t, β′_t, C′_t) durch **Skalierung** entsteht: α̂_t := α′_t / α′_t(e_{00}), β̂_t := β′_t, Ĉ_t := α′_t(e_{00})·C′_t.
- **Eine Normalform von V** ist die Normalform zu irgendeinem (S, T) ∈ 𝒢*. Alle Aussagen „in jeder Normalform“ meinen: für jedes (S, T) ∈ 𝒢*.

### 1.4 Koordinaten in einer Normalform (m = 7, r = 34)

Sei V̂ eine Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ über K. Alle Begriffe aus 1.2 werden für V̂ gebildet (also D, ℬ, W, K′, f_i, J, Q, L, H, N, Ŝ von V̂).

- a_i := (α̂_t(e_{i0}))_t ∈ K^34 und b_i := (α̂_t(e_{i1}))_t ∈ K^34 für i = 0, 1, 2. Nach der Skalierung ist **a_0 = 1** (der Vektor aus lauter Einsen). Die Koeffizientenmatrix von α̂_t hat die Spalten a(t) := (1, a_1(t), a_2(t))ᵀ und b(t) := (b_0(t), b_1(t), b_2(t))ᵀ.
- Der **a-Punkt** von t ist ξ(t) := (a_1(t), a_2(t)) ∈ K². Π ist die Menge der verschiedenen a-Punkte. Die **Faser** über ξ ∈ Π ist T_ξ := {t : ξ(t) = ξ}.
- p_k := (β̂_t(e_{0k}))_t und q_k := (β̂_t(e_{1k}))_t für k = 1, …, 7.
- **c_i := b_i − a_i·b_0** für i = 1, 2. **ω_{ik} := a_i·b_k − a_k·b_i** für 0 ≤ i, k ≤ 2. Es ist ω_{0k} = c_k für k = 1, 2.
- **P_d** ist der Raum der formalen Polynome vom Grad ≤ d in zwei Variablen (dim P_d = (d+1)(d+2)/2). 𝒜 := K[a_1, a_2] ist der Polynomring. Ein Polynom f ∈ 𝒜 wirkt auf K^34 durch f·v := (f(ξ(t))·v_t)_t. Für v ∈ K^34 ist **v·P_d := {f·v : f ∈ P_d}** (ein Unterraum von K^34, das Bild von P_d) und 𝒜·v := {f·v : f ∈ 𝒜}. Ein Unterraum M ⊆ K^34 heißt **𝒜-Modul**, wenn a_1·M ⊆ M und a_2·M ⊆ M.
- **K″ := K′ + a_1·K′ + a_2·K′.**
- **J³_0** := {(j_0, j_1, j_2) ∈ J³ : j_0 + a_1·j_1 + a_2·j_2 = 0}, und für j = (j_0, j_1, j_2) ∈ J³_0 ist **Θ(j) := b_0·j_0 + b_1·j_1 + b_2·j_2**.
- π und κ: siehe K-22. w und e: siehe K-23. u (bei e = 3) und u_1, u_2 (bei e = 2): siehe K-28 und K-30. 𝒢_gen und 𝒢_3: siehe K-34. Y, Ω, Π_1: siehe K-35. τ, ν: siehe K-36.
- **Σ := {t : w_t ≠ 0}**, der Träger von w.
- **Y := {t : α̂_t hat Rang 1}**, **Ω := {t : α̂_t hat Rang 2}**. (In den Quellen zu e = 3 heißt Ω „Z“.)
- χ_ξ ∈ 𝒜 für ξ ∈ Π: siehe K-2. M_ξ := χ_ξ·K″, d_ξ := dim M_ξ.

**Unterschiedliche Bedeutungen gleicher Buchstaben, die hier vermieden sind:** K ist der Körper, K′ und K″ sind Unterräume von K^34. Die Bedingungen (A) bis (D) sind die Brent-Gruppen (K-22). (T1) bis (T5) sind Grundtatsachen über Verfahren (K-7), in den Quellen G1 bis G4. (G0) bis (G5) sind die Eigenschaften aus Satz G (K-35). In den Quellen heißen die Operatoren τ, ν aus K-36 „B_p“, „N_p“ und die Abbildung η aus K-37 „φ_z“; die Buchstaben B, N, φ sind hier anders belegt.

---

## 2. Hilfssätze aus Algebra und Geometrie

### K-1 (Polynome über unendlichen Körpern)

**Wortlaut.** Sei K ein unendlicher Körper.
 (a) Ein Polynom P ∈ K[x_1, …, x_n] mit P ≠ 0 hat eine Stelle x ∈ K^n mit P(x) ≠ 0.
 (b) Das Produkt endlich vieler von 0 verschiedener Polynome ist ≠ 0.
 (c) Ist X ⊆ K^n eine nicht leere Zariski-offene Menge der Form X = {x : h(x) ≠ 0} mit h ≠ 0 und sind U_1, U_2 ⊆ X Zariski-offen und nicht leer, dann ist U_1 ∩ U_2 offen und nicht leer.

**Voraussetzungen.** Keine.

**Beweis.** (a) Induktion über n. Für n = 1 hat ein Polynom ≠ 0 vom Grad d höchstens d Nullstellen, K ist unendlich. Für n > 1 schreibe P = Σ_j P_j(x_1, …, x_{n−1})·x_n^j mit einem P_j ≠ 0. Nach Induktion gibt es x′ mit P_j(x′) ≠ 0. Dann ist P(x′, x_n) ein Polynom ≠ 0 in x_n, und der Fall n = 1 gibt x_n.
(b) Polynomringe über Körpern sind nullteilerfrei.
(c) Eine offene Menge U_i ≠ ∅ enthält eine Menge {x : f_i(x) ≠ 0} ∩ X mit f_i ≠ 0 (U_i ist das Komplement einer Nullstellenmenge {x ∈ X : f(x) = 0 für alle f ∈ M_i}, und weil U_i ≠ ∅ ist, ist ein f_i ∈ M_i nicht das Nullpolynom; jede Stelle mit f_i ≠ 0 liegt in U_i). Nach (b) ist f_1·f_2·h ≠ 0, nach (a) gibt es x mit f_1(x)f_2(x)h(x) ≠ 0. Dann x ∈ U_1 ∩ U_2. Der Durchschnitt zweier offener Mengen ist offen. ∎

Anwendung: 𝒢 = {(S, T) : det S · det T ≠ 0} ⊆ K^13 ist von der Form in (c).

### K-2 (Interpolation)

**Wortlaut.** Sei K ein Körper und Π ⊆ K² endlich. Zu jedem ξ ∈ Π gibt es χ_ξ ∈ 𝒜 = K[a_1, a_2] mit χ_ξ(ξ) = 1 und χ_ξ(ξ′) = 0 für alle ξ′ ∈ Π ∖ {ξ}. Folglich ist jede Funktion Π → K die Einschränkung eines Polynoms.

**Voraussetzungen.** Keine.

**Beweis.** Für ξ′ ≠ ξ unterscheiden sich ξ und ξ′ in einer Koordinate, etwa der i-ten. Setze λ_{ξ′} := a_i − ξ′_i. Dann λ_{ξ′}(ξ′) = 0 und λ_{ξ′}(ξ) ≠ 0. Setze χ_ξ := Π_{ξ′ ≠ ξ} λ_{ξ′} / Π_{ξ′ ≠ ξ} λ_{ξ′}(ξ). Eine Funktion φ : Π → K ist die Einschränkung von Σ_ξ φ(ξ)·χ_ξ. ∎

### K-3 (Koszul im Grad 2)

**Wortlaut.** Sei K ein Körper, 𝒮 := K[X_0, X_1, X_2] und 𝒮_d der Raum der Formen vom Grad d. Sind Φ_0, Φ_1, Φ_2 ∈ 𝒮_2 mit X_0Φ_0 + X_1Φ_1 + X_2Φ_2 = 0, dann gibt es Formen Ψ_{ik} ∈ 𝒮_1 (0 ≤ i, k ≤ 2) mit Ψ_{ii} = 0, Ψ_{ki} = −Ψ_{ik} und Φ_i = Σ_k Ψ_{ik}·X_k für i = 0, 1, 2. Das gilt in jeder Charakteristik.

**Voraussetzungen.** Keine.

**Beweis.** Sei ℛ := {(Φ_0, Φ_1, Φ_2) ∈ 𝒮_2³ : Σ X_iΦ_i = 0}. Die Abbildung 𝒮_2³ → 𝒮_3, (Φ_i) ↦ Σ X_iΦ_i, ist surjektiv (jedes Monom vom Grad 3 ist durch ein X_i teilbar). Also dim ℛ = 18 − 10 = 8.

Sei δ_K : 𝒮_1³ → 𝒮_2³, (Ψ_{01}, Ψ_{02}, Ψ_{12}) ↦ (Ψ_{01}X_1 + Ψ_{02}X_2, −Ψ_{01}X_0 + Ψ_{12}X_2, −Ψ_{02}X_0 − Ψ_{12}X_1). Einsetzen zeigt Σ X_i·(i-te Komponente) = 0, also liegt das Bild in ℛ. Kern: Aus der ersten Komponente Ψ_{01}X_1 = −Ψ_{02}X_2 folgt im faktoriellen Ring 𝒮, dass X_2 die Form Ψ_{01} teilt, also Ψ_{01} = cX_2 und Ψ_{02} = −cX_1 mit c ∈ K. Aus der zweiten Komponente −cX_2X_0 + Ψ_{12}X_2 = 0 folgt Ψ_{12} = cX_0. Umgekehrt liegt (cX_2, −cX_1, cX_0) im Kern. Der Kern hat also Dimension 1, das Bild Dimension 9 − 1 = 8 = dim ℛ. Also ist δ_K surjektiv auf ℛ. Mit Ψ_{ii} := 0 und Ψ_{ki} := −Ψ_{ik} für i < k sind die drei Komponenten genau Σ_k Ψ_{ik}X_k. ∎

### K-4 (Geraden und Kegelschnitte)

**Wortlaut.** Sei K ein unendlicher Körper. Eine affine Gerade ist eine Menge ℒ = {ξ ∈ K² : λ(ξ) = 0} mit λ ∈ P_1 vom Grad genau 1. Für g ∈ P_2 sei ĝ(X_0, X_1, X_2) := X_0²·g(X_1/X_0, X_2/X_0) die Homogenisierung (eine Form vom Grad 2).
 (a) Verschwindet g ∈ P_2 an drei verschiedenen Punkten einer affinen Geraden ℒ = {λ = 0}, dann verschwindet g auf ganz ℒ, und g = λ·g′ mit g′ ∈ P_1.
 (b) Sei g ∈ P_2 vom Grad 2 mit irreduzibler Homogenisierung ĝ. Dann liegen keine drei verschiedenen Nullstellen von g in K² auf einer affinen Geraden. Insbesondere hat g auf keiner affinen Geraden unendlich viele Nullstellen.
 (c) Seien ξ_1, …, ξ_5 ∈ K² verschieden, keine drei auf einer affinen Geraden. Dann hat {g ∈ P_2 : g(ξ_1) = … = g(ξ_5) = 0} höchstens Dimension 1.

**Voraussetzungen.** K-1.

**Beweis.** (a) Schreibe ℒ = {ξ_0 + s·δ : s ∈ K} mit δ ≠ 0. Dann ist s ↦ g(ξ_0 + sδ) ein Polynom vom Grad ≤ 2 mit drei Nullstellen, also null. Wähle eine invertierbare affine Koordinatentransformation, nach der λ = a′_1 ist. In den neuen Koordinaten ist g = a′_1·g′ + h(a′_2) mit h ∈ K[a′_2] (Division durch a′_1). Es ist h(s) = g(0, s) = 0 für alle s ∈ K, also h = 0 (K-1 (a)). Zurück transformiert: g = λ·g′, und g′ hat Grad ≤ 1.
(b) Lägen drei Nullstellen auf ℒ = {λ = 0}, dann g = λ·g′ nach (a), mit g′ ≠ 0 (sonst g = 0) vom Grad ≤ 1 (Grad von g ist 2, also Grad von g′ genau 1). Dann ĝ = λ̂·ĝ′ mit den Homogenisierungen λ̂, ĝ′ vom Grad 1. Das widerspricht der Irreduzibilität.
(c) Angenommen, g und g′ sind linear unabhängig und verschwinden an den fünf Punkten. Wähle auf der affinen Geraden ℒ_{12} durch ξ_1 und ξ_2 einen dritten Punkt η (K ist unendlich). Es gibt (λ, μ) ≠ (0, 0) mit h := λg + μg′ und h(η) = 0, und h ≠ 0. h verschwindet an ξ_1, ξ_2, η, also h = λ_{12}·h′ mit der Gleichung λ_{12} von ℒ_{12} und h′ ∈ P_1 (nach (a)). Die Punkte ξ_3, ξ_4, ξ_5 liegen nicht auf ℒ_{12} (keine drei kollinear), also h′(ξ_3) = h′(ξ_4) = h′(ξ_5) = 0. Ist h′ eine Konstante, dann h′ = 0. Hat h′ Grad 1, dann liegen ξ_3, ξ_4, ξ_5 auf einer Geraden, Widerspruch. Also h′ = 0 und h = 0, Widerspruch. ∎

### K-5 (homogene Polynome in zwei Variablen)

**Wortlaut.** Sei K ein unendlicher Körper, P¹(K) die Menge der Geraden durch 0 in K² (Klassen [p] von Vektoren p ≠ 0 bis auf Faktoren ≠ 0), und Q ∈ K[p_1, p_2] homogen vom Grad d ≥ 0 mit Q ≠ 0. Dann hängt „Q(p) ≠ 0“ nur von [p] ab, Q verschwindet an höchstens d + 1 Elementen von P¹(K), und **{[p] ∈ P¹(K) : Q(p) ≠ 0} ist unendlich.**

**Voraussetzungen.** Keine.

**Beweis.** Q(λp) = λ^d·Q(p). Schreibe Q = Σ_{i=0}^{d} q_i·p_1^i·p_2^{d−i}. Ist [p] = [x : 1], dann Q(p) = 0 genau dann, wenn q(x) := Q(x, 1) = Σ q_i x^i = 0. q ist nicht das Nullpolynom (sonst alle q_i = 0), hat also höchstens d Nullstellen. Die übrigen Elemente von P¹(K) sind die [x : 1] und [1 : 0]. Also verschwindet Q an höchstens d + 1 Elementen. Die [x : 1], x ∈ K, sind paarweise verschieden und unendlich viele. ∎

### K-6 (Zerlegung eines 𝒜-Moduls nach Fasern)

**Wortlaut.** Sei K ein Körper, r ≥ 1, und seien Punkte ξ(t) ∈ K² für t = 1, …, r gegeben. 𝒜 = K[a_1, a_2] wirke auf K^r durch f·v := (f(ξ(t))·v_t)_t. Seien Π, T_ξ, χ_ξ wie in 1.4 und K-2. Sei M ⊆ K^r ein 𝒜-Modul. Dann gilt:
 (i) χ_ξ·v ist der Vektor, der auf T_ξ gleich v und sonst 0 ist. Jedes f ∈ 𝒜 wirkt auf K^{T_ξ} als der Skalar f(ξ).
 (ii) M = ⊕_{ξ∈Π} M_ξ mit M_ξ := χ_ξ·M = M ∩ K^{T_ξ}.
 (iii) Ist X eine Vereinigung von Fasern, dann M ∩ K^X = ⊕_{T_ξ ⊆ X} M_ξ, und die Einschränkung M → M|_X bildet ⊕_{T_ξ⊆X} M_ξ bijektiv auf M|_X ab; dim M|_X = Σ_{T_ξ ⊆ X} dim M_ξ.
 (iv) Für v ∈ K^r ist χ_ξ·(𝒜·v) = K·(χ_ξ·v).

**Voraussetzungen.** K-2.

**Beweis.** (i) χ_ξ(ξ(t)) ist 1 für t ∈ T_ξ und 0 sonst. Auf T_ξ ist ξ(t) = ξ, also f(ξ(t)) = f(ξ).
(ii) Weil M ein 𝒜-Modul ist, gilt χ_ξ·M ⊆ M, und χ_ξ·M ⊆ K^{T_ξ}. Umgekehrt ist v = χ_ξ·v für v ∈ M ∩ K^{T_ξ}. Für v ∈ M ist v = Σ_ξ χ_ξ·v, weil die Fasern die Indexmenge zerlegen. Die Summe ist direkt, weil die Träger disjunkt sind.
(iii) Folgt aus (ii): Ein v ∈ M ist genau dann in K^X, wenn χ_ξ·v = 0 für T_ξ ⊄ X. Die Einschränkung auf X ist auf ⊕_{T_ξ⊆X} M_ξ injektiv, und für v ∈ M ist v|_X = (Σ_{T_ξ⊆X} χ_ξ·v)|_X.
(iv) Nach (i) ist χ_ξ·(f·v) = f(ξ)·χ_ξ·v. ∎

---

## 3. Verfahren, Basiswechsel, Normalform

### K-7 (Grundtatsachen über Verfahren)

**Wortlaut.** Sei V ein Verfahren der Länge r für ⟨3,2,m⟩ über einem Körper K, mit den Bezeichnungen aus 1.2. Dann gilt:
 (D1) D(A)·D(A′) = D(A′)·D(A) für alle A, A′.
 (D2) W(D(A)·ℬ(y)) = A·y für alle A ∈ K^{3×2}, y ∈ K^{2×m}.
 (T1) ℬ ist injektiv.
 (T2) W ist surjektiv.
 (T3) dim K′ = r − 3m. Insbesondere r ≥ 3m.
 (T4) Gilt (SN1), dann ist f_0 injektiv.
 (T5) W(f_i(x)) = e_{i0}^{(3×2)}·x, die 3×m-Matrix, deren Zeile i die Zeile 0 von x ist und deren übrige Zeilen null sind.

**Voraussetzungen.** Nur (Z).

**Beweis.** (D1): Diagonalmatrizen vertauschen. (D2): Das ist (Z′). (T1): Aus ℬ(B) = 0 folgt AB = W(D(A)·0) = 0 für alle A. Mit A = e_{00} und A = e_{01} folgt, dass beide Zeilen von B null sind. (T2): e_{il}^{(3×m)} = e_{i0}^{(3×2)}·e_{0l}^{(2×m)} = W(D(e_{i0})ℬ(e_{0l})) liegt im Bild, und diese Matrizen bilden eine Basis. (T3): Rangsatz mit (T2). (T4): f_0 = D(e_{00})∘ℬ, D(e_{00}) invertierbar, ℬ injektiv nach (T1). (T5): (D2) mit A = e_{i0}. ∎

### K-8 (R1: Körpererweiterung)

**Wortlaut.** Ist F ⊆ K eine Körpererweiterung und V ein Verfahren der Länge r für ⟨3,2,m⟩ über F, dann ist V, mit denselben Koeffizienten der α_t, β_t und denselben C_t, ein Verfahren der Länge r über K. Rang und Proportionalität der Koeffizientenmatrizen α_t ändern sich dabei nicht, und α_t = 0 über K genau dann, wenn α_t = 0 über F.

**Voraussetzungen.** Keine.

**Beweis.** Die Brent-Gleichungen (1.1) sind Gleichungen zwischen den Koeffizienten. Sie gelten über F, also über K. Über K folgen aus ihnen (Z) für alle A, B über K, weil (Z) bilinear ist. Der Rang einer Matrix über F ändert sich bei Körpererweiterung nicht. ∎

### K-9 (R2: Nullformen streichen)

**Wortlaut.** Ist α_t = 0 für ein t, dann ist V ohne den Index t ein Verfahren der Länge r − 1.

**Voraussetzungen.** Keine.

**Beweis.** Der Summand t trägt in (Z) nichts bei. ∎

### K-10 (R3: Basiswechsel)

**Wortlaut.** Für S ∈ GL_3(K) und T ∈ GL_2(K) ist V^{(S,T)} (1.3) ein Verfahren derselben Länge. Die Koeffizientenmatrix von α′_t ist Sᵀ·α_t·Tᵀ. Insbesondere sind Rang, Proportionalität und gleiche Spaltenräume der α′_t dieselben wie bei den α_t, und α′_t = 0 genau dann, wenn α_t = 0. Es gilt α′_t(e_{i0}) = s_iᵀ·α_t·pᵀ und α′_t(e_{i1}) = s_iᵀ·α_t·p′ᵀ, wobei s_i die Spalten von S und p, p′ die Zeilen von T sind.

**Voraussetzungen.** Keine.

**Beweis.** Σ_t α_t(SAT)·β_t(T^{−1}B)·S^{−1}C_t = S^{−1}·(SAT)(T^{−1}B) = AB. Weiter α′_t(A) = Σ_{ij}(α_t)_{ij}(SAT)_{ij} = Spur(α_tᵀSAT) = Spur((Sᵀα_tTᵀ)ᵀA), also ist Sᵀα_tTᵀ die Koeffizientenmatrix. Multiplikation mit invertierbaren Matrizen von links und rechts erhält Rang, Proportionalität und (bis auf den festen Isomorphismus Sᵀ) die Spaltenräume. Schließlich S·e_{i0}·T = s_i·p und S·e_{i1}·T = s_i·p′, und α_t(s_i p) = s_iᵀα_tpᵀ (1.1). ∎

### K-11 (Lemma A′: starke Normalisierung, mit Polynom)

**Wortlaut.** Sei K unendlich und V ein Verfahren der Länge r ≥ 1 für ⟨3,2,m⟩ über K, in dem kein α_t die Nullform ist. Dann gibt es ein Polynom Λ(s_0, p) ≠ 0 in den fünf Koordinaten von s_0 ∈ K³ (Spalte) und p ∈ K^{1×2}, das in p homogen ist, mit folgender Eigenschaft: Ist Λ(s_0, p) ≠ 0, S ∈ GL_3(K) eine Matrix mit erster Spalte s_0 und T ∈ GL_2(K) eine Matrix mit erster Zeile p, dann erfüllt V^{(S,T)} (SN1) und (SN2). Aus Λ(s_0, p) ≠ 0 folgt α_t(s_0p) ≠ 0 für alle t, insbesondere s_0 ≠ 0 und p ≠ 0. Insbesondere ist 𝒢* ≠ ∅.

**Voraussetzungen.** K-1, K-7 (D2), K-10.

**Beweis.**
*Schritt 1.* Für jedes t ist (s_0, p) ↦ α_t(s_0 p) = Σ_{ij}(α_t)_{ij}(s_0)_i p_j ein Polynom, dessen Koeffizienten die Einträge von α_t sind. Es ist ≠ 0, weil α_t ≠ 0. Es ist in p homogen vom Grad 1. Setze Λ_1(s_0, p) := Π_t α_t(s_0 p).
*Schritt 2.* Für v ∈ K^{2×m} sei supp(v) := {t : ℬ(v)_t ≠ 0}. Für Σ ⊆ {1, …, r} und p sei M_Σ(p) die |Σ|×3-Matrix mit den Einträgen α_t(e_i p) (t ∈ Σ, i = 0, 1, 2; e_i ∈ K³ der i-te Einheitsvektor). Ihre Einträge sind linear in p. Der t-te Eintrag von D(xp)·ℬ(v) ist α_t(xp)·ℬ(v)_t. Also ist x ↦ D(xp)·ℬ(v) (K³ → K^r) genau dann injektiv, wenn M_{supp(v)}(p) Rang 3 hat. Ist v ≠ 0 und pv ≠ 0 (Zeile in K^{1×m}), dann ist x ↦ D(xp)·ℬ(v) injektiv: Aus D(xp)ℬ(v) = 0 folgt mit (D2) 0 = (xp)v = x·(pv), also x = 0.
*Schritt 3.* Sei 𝒮 die endliche Menge der Teilmengen Σ, die als supp(v) für ein v ≠ 0 vorkommen. Zu Σ ∈ 𝒮 wähle v_Σ ≠ 0 mit supp(v_Σ) = Σ und p_Σ mit p_Σ v_Σ ≠ 0. Nach Schritt 2 hat M_Σ(p_Σ) Rang 3, also hat ein 3×3-Minor q_Σ(p) von M_Σ(p) an p_Σ einen Wert ≠ 0. q_Σ ist ein Polynom ≠ 0 in p, homogen vom Grad 3.
*Schritt 4.* Setze Λ := Λ_1·Π_{Σ∈𝒮} q_Σ. Nach K-1 (b) ist Λ ≠ 0, und Λ ist in p homogen. Sei Λ(s_0, p) ≠ 0. Dann ist α_t(s_0 p) ≠ 0 für alle t, und für jedes v ≠ 0 ist q_{supp(v)}(p) ≠ 0, also x ↦ D(xp)·ℬ(v) injektiv.
*Schritt 5.* Seien S mit Spalten s_0, s_1, s_2 und T mit erster Zeile p invertierbar. Nach K-10 ist α′_t(e_{i0}) = α_t(s_i p), also D′(e_{i0}) = D(s_i p), und ℬ′(v) = ℬ(T^{−1}v). (SN1): D′(e_{00}) = D(s_0 p) ist invertierbar. (SN2): Sei v ≠ 0 und Σ_i γ_i f′_i(v) = 0, also D((Σ_i γ_i s_i)p)·ℬ(T^{−1}v) = 0. Weil T^{−1}v ≠ 0, folgt aus Schritt 4 Σ_i γ_i s_i = 0, also γ = 0.
*Zusatz.* Nach K-1 (a) gibt es (s_0, p) mit Λ(s_0, p) ≠ 0. Dann ist s_0 ≠ 0 und p ≠ 0 (wegen α_1(s_0 p) ≠ 0), man ergänzt zu invertierbaren S, T, und (S, T) ∈ 𝒢*. ∎

Die Bedingung Λ(s_0, p) ≠ 0 hängt nur von der ersten Spalte von S und der ersten Zeile von T ab. Die übrigen Spalten von S und die zweite Zeile von T sind beliebig, solange S und T invertierbar sind.

### K-12 (Skalierung; Eigenschaften einer Normalform)

**Wortlaut.** Sei V ein Verfahren der Länge r für ⟨3,2,m⟩ über K und (S, T) ∈ 𝒢*. Die Normalform V̂ zu (S, T) (1.3) ist ein Verfahren der Länge r über K, das (SN1) und (SN2) erfüllt, mit α̂_t(e_{00}) = 1 für alle t. Die Koeffizientenmatrix von α̂_t ist ein von 0 verschiedenes Vielfaches von Sᵀα_tTᵀ, hat also denselben Rang wie α_t. In V̂ ist D(e_{00}) die Einheitsmatrix, f_0 = ℬ, und f_i(x) = a_i·f_0(x) für i = 0, 1, 2 (mit a_i aus 1.4).

**Voraussetzungen.** K-10.

**Beweis.** Sei c_t := α′_t(e_{00}) ≠ 0 (SN1 für V^{(S,T)}). Σ_t (α′_t/c_t)(A)·β′_t(B)·(c_tC′_t) = AB. α̂_t(e_{00}) = 1, also (SN1). Für V̂ ist D̂(A) = D′(e_{00})^{−1}D′(A) und ℬ̂ = ℬ′, also f̂_i = D′(e_{00})^{−1}f′_i. Lineare Unabhängigkeit bleibt unter der invertierbaren Matrix D′(e_{00})^{−1} erhalten: (SN2). Die Aussage über die Koeffizientenmatrix folgt aus K-10. Schließlich D̂(e_{00}) = I und D̂(e_{i0}) = Diagonalmatrix mit Diagonale a_i, also f̂_i(x) = a_i·ℬ̂(x). ∎

---

## 4. Yangs Maschine für n = 3 und der Restfall

In K-13 bis K-17 ist V ein Verfahren der Länge r für ⟨3,2,m⟩ über einem beliebigen Körper K, m ≥ 1, mit den Bezeichnungen aus 1.2. Die Voraussetzungen (SN1), (SN2) stehen jeweils dabei.

### K-13 (Lemma B: Dimensionszuwachs)

**Wortlaut.** V erfülle (SN1) und (SN2). Dann gilt für jeden Unterraum X ⊆ K^{2×m} mit X ≠ 0:
  dim(f_0(X) + f_1(X) + f_2(X)) ≥ dim X + 2.

**Voraussetzungen.** (SN1), (SN2), K-7 (T4).

**Beweis.** Sei P_i := D(e_{i0})·D(e_{00})^{−1} (diagonal). Dann f_i = P_i∘f_0. Sei E_j ⊆ K^r (j = 0, …, r) der Raum der Vektoren, deren Einträge mit Index > j null sind. 0 = E_0 ⊂ E_1 ⊂ … ⊂ E_r = K^r, dim E_j = j, und jede Diagonalmatrix bildet jedes E_j in sich ab. Weil f_0 injektiv ist (T4) und X ≠ 0, ist f_0(X) ≠ 0. Sei j minimal mit 𝒳 := f_0(X) ∩ E_j ≠ 0 (j ≥ 1). Dann ist dim 𝒳 = 1: 𝒳 ∩ E_{j−1} = 0, und E_j/E_{j−1} hat Dimension 1. Also 𝒳 = span{f_0(v)} mit v ∈ X, v ≠ 0. Sei 𝒯 := span{f_0(v), f_1(v), f_2(v)}. Nach (SN2) ist dim 𝒯 = 3. Weil f_i(v) = P_if_0(v) ∈ E_j, ist 𝒯 ⊆ E_j. Also f_0(X) ∩ 𝒯 ⊆ f_0(X) ∩ E_j = 𝒳 ⊆ 𝒯, das heißt f_0(X) ∩ 𝒯 = 𝒳. Damit dim(f_0(X) + 𝒯) = dim X + 3 − 1. Weil f_0(X) + 𝒯 ⊆ f_0(X) + f_1(X) + f_2(X), folgt die Behauptung. ∎

### K-14 (Lemma C, D, E: Inklusionen und Vertauschungen)

**Wortlaut.** V erfülle (SN1).
 (i) Für x ∈ U sind f_0(x), f_1(x), f_2(x), g(x) in K′. Insbesondere J = f_0(U) ⊆ K′, dim J = m, Q = K′/J ist erklärt, und dim Q = r − 4m.
 (ii) (Lemma D) Für jedes x ∈ K^{2×m} ist D(e_{10})·f_2(x) − D(e_{20})·f_1(x) = 0.
 (iii) (Lemma E) Für alle i und y ist D(e_{i0})·f_0(y) = D(e_{00})·f_i(y).
 (iv) Für y ∈ U und i ∈ {0, 1, 2} ist e_{i0}^{(3×2)}·y = 0, und e_{i0}^{(3×2)}·e_{01}^{(2×2)} = e_{i1}^{(3×2)}.

**Voraussetzungen.** (SN1), K-7.

**Beweis.** (i) Nach (T5) ist W(f_i(x)) die Matrix mit der Zeile 0 von x in Zeile i, für x ∈ U also 0. W(g(x)) = e_{01}x − e_{00}(e_{01}^{(2×2)}x) = e_{01}x − e_{01}x = 0 nach (D2), weil e_{00}^{(3×2)}e_{01}^{(2×2)} = e_{01}^{(3×2)}. dim J = m nach (T4), dim K′ = r − 3m nach (T3). (ii) Beide Terme sind D(e_{10})D(e_{20})ℬ(x) nach (D1). (iii) (D1). (iv) Matrixrechnung. ∎

### K-15 (Lemma 10, Kern von Φ, und die Grundungleichung (G))

**Wortlaut.** V erfülle (SN1). Dann ist Φ (1.2) wohldefiniert und linear, ker Φ = {(0, 0, x) : x ∈ N}, und

  **2m + rk H ≤ rk L + 2·dim Q.**                                                  (G)

**Voraussetzungen.** (SN1), K-7, K-14.

**Name.** In den Quellen heißt die erste Aussage „Lemma F (= Paper Lemma 10)“. Der Name Lemma F bezeichnet in dieser Datei nur das spätere Glied über Paare von Formen (Abschnitt 7).

**Beweis.** Wohldefiniert nach K-14 (i). „⊇“: Φ(0, 0, x) = (0, F_2(x), −F_1(x)) = 0 für x ∈ N. „⊆“: Sei Φ(u_1, u_2, x) = 0. Dann gibt es y_0, y_1, y_2 ∈ U mit

 ℓ(u_1, u_2) = f_0(y_0),  −g(u_1) + f_2(x) = f_0(y_1),  −g(u_2) − f_1(x) = f_0(y_2).

Bilde D(e_{01})·(erste) + D(e_{10})·(zweite) + D(e_{20})·(dritte). Links fallen die x-Terme nach K-14 (ii) weg. Es bleibt

 D(e_{01})[D(e_{10})ℬ(u_1) + D(e_{20})ℬ(u_2)] − D(e_{10})[D(e_{01})ℬ(u_1) − D(e_{00})ℬ(e_{01}u_1)] − D(e_{20})[D(e_{01})ℬ(u_2) − D(e_{00})ℬ(e_{01}u_2)],

und nach (D1) heben sich die Terme mit D(e_{01})D(e_{i0}) weg: Links steht D(e_{00})[D(e_{10})ℬ(e_{01}u_1) + D(e_{20})ℬ(e_{01}u_2)]. Rechts steht nach (D1) D(e_{00})[D(e_{01})ℬ(y_0) + D(e_{10})ℬ(y_1) + D(e_{20})ℬ(y_2)]. Kürze die invertierbare Matrix D(e_{00}) (SN1) und wende W an, mit (D2):

 e_{10}e_{01}u_1 + e_{20}e_{01}u_2 = e_{01}y_0 + e_{10}y_1 + e_{20}y_2.

Nach K-14 (iv) ist das e_{11}u_1 + e_{21}u_2 = e_{01}y_0. Links steht eine 3×m-Matrix mit Zeile 0 gleich null, Zeile 1 gleich Zeile 1 von u_1, Zeile 2 gleich Zeile 1 von u_2. Rechts ist nur Zeile 0 von null verschieden. Also sind die Zeilen 1 von u_1 und u_2 null, und weil u_1, u_2 ∈ U, ist u_1 = u_2 = 0. Dann Φ(0, 0, x) = (0, F_2(x), −F_1(x)) = 0, also x ∈ N.

(G): Rangsatz für Φ: dim im Φ = 3m − dim N, und dim im Φ ≤ rk L + 2·dim Q. Mit dim N = m − rk H folgt (G). ∎

### K-16 (Lemma H)

**Wortlaut.** V erfülle (SN1). Dann gilt dim Ŝ ≥ dim N − Δ.

**Voraussetzungen.** (SN1), K-7 (T4), K-14 (ii), (iii).

**Beweis.** Sei x ∈ N. Dann F_1(x) = F_2(x) = 0, also f_1(x), f_2(x) ∈ J = f_0(U). Weil f_0 injektiv ist, gibt es eindeutige σ_1(x), σ_2(x) ∈ U mit f_0(σ_1(x)) = f_2(x) und f_0(σ_2(x)) = −f_1(x). σ := (σ_1, σ_2) : N → U × U ist linear.
*Schritt 1: σ(N) ⊆ ker L.* Nach K-14 (ii), (iii): 0 = D(e_{10})f_2(x) − D(e_{20})f_1(x) = D(e_{10})f_0(σ_1x) + D(e_{20})f_0(σ_2x) = D(e_{00})[f_1(σ_1x) + f_2(σ_2x)]. Kürzen von D(e_{00}) gibt ℓ(σ(x)) = 0, also L(σ(x)) = 0.
*Schritt 2: N × N ⊆ ker L.* L(a, b) = F_1(a) + F_2(b) = 0 für a, b ∈ N.
*Schritt 3: Ŝ = σ^{−1}(N × N).* Für x ∈ N liegt f_2(x) = f_0(σ_1x) genau dann in f_0(N), wenn σ_1(x) ∈ N (f_0 injektiv); ebenso f_1(x) = f_0(−σ_2x).
*Schritt 4.* Die von σ induzierte Abbildung N/Ŝ → ker L/(N × N) ist injektiv. Also dim N − dim Ŝ ≤ dim ker L − 2·dim N = (2m − rk L) − 2(m − rk H) = Δ. ∎

### K-17 (Lemma I)

**Wortlaut.** V erfülle (SN1) und (SN2). Dann gilt Δ ≥ min(2, dim N).

**Voraussetzungen.** (SN1), (SN2), K-13, K-16.

**Beweis.** Ist Ŝ = 0, dann gibt K-16 Δ ≥ dim N. Ist Ŝ ≠ 0: f_0(Ŝ) ⊆ f_0(N) (weil Ŝ ⊆ N), und f_1(Ŝ), f_2(Ŝ) ⊆ f_0(N) nach Definition von Ŝ. Mit K-13 für X = Ŝ: dim Ŝ + 2 ≤ dim f_0(N) = dim N. Mit K-16: Δ ≥ dim N − dim Ŝ ≥ 2. ∎

### K-18 (untere Schranke 34 und ihre Folgen)

**Wortlaut.**
 (a) Jedes Verfahren der Länge r für ⟨3,2,7⟩ über einem Körper, das (SN1) und (SN2) erfüllt, hat r ≥ 34.
 (b) R_F(⟨3,2,7⟩) ≥ 34 für jeden Körper F.
 (c) Ist V ein Verfahren der Länge 34 für ⟨3,2,7⟩ über F, dann ist kein α_t die Nullform, und für V über K = F̄ ist 𝒢* ≠ ∅.

**Voraussetzungen.** K-8, K-9, K-10, K-11, K-14 (i), K-15, K-17.

**Beweis.** (a) Hier m = 7 und dim Q = r − 28 ≥ 0 (K-14 (i)). Angenommen r ≤ 33, also dim Q ≤ 5. Wegen rk L ≤ dim Q gibt (G): 14 + rk H ≤ 3·dim Q ≤ 15, also rk H ≤ 1 und dim N = 7 − rk H ≥ 6. K-17 gibt Δ ≥ 2, also rk L ≤ 2·rk H − 2 ≤ 0. Dann rk L = 0, und (G) gibt 14 ≤ 14 + rk H ≤ 2·dim Q ≤ 10. Widerspruch.
(b) Sei V ein Verfahren der Länge r über F. Nach K-8 ist es eines über K = F̄. Nach K-9 gibt es eines der Länge r′ ≤ r über K ohne Nullformen, mit r′ ≥ 1 (für r′ = 0 wäre AB = 0 für alle A, B). K ist unendlich. Nach K-11 gibt es (S, T) mit (SN1), (SN2) für das gestrichene Verfahren, und nach K-10 hat V^{(S,T)} dieselbe Länge r′. Nach (a) ist r ≥ r′ ≥ 34.
(c) Wäre α_t = 0, gäbe K-9 ein Verfahren der Länge 33 über F, im Widerspruch zu (b). Nach K-8 ist auch über K kein α_t die Nullform, und K-11 gibt 𝒢* ≠ ∅. ∎

**Fundstelle in der Literatur (nicht benutzt).** (b) ist Satz 1 von J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393v3 (12.10.2026), für m = 7: ⌈(24·7+2)/5⌉ = 34. Es folgt auch aus Satz 1 von A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054v1 (18.09.2026): R > 24m/5 = 33,6. Die Kette benutzt diese Zitate nicht, sondern (a) bis (c).

### K-19 (der Restfall)

**Wortlaut.** Sei V̂ ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper, das (SN1) und (SN2) erfüllt. Insbesondere gilt das für jede Normalform eines Verfahrens der Länge 34 (K-12). Dann gilt:

  dim Q = 6,  rk L = 6,  rk H = 4,  dim N = 3,  Δ = 2,  dim Ŝ = 1.

**Voraussetzungen.** (SN1), (SN2), K-12 (nur für den Zusatz über Normalformen), K-13, K-14 (i), K-15, K-16, K-17.

**Beweis.** dim Q = 34 − 28 = 6 (K-14 (i)). (G) lautet 14 + rk H ≤ rk L + 12, also

 rk H ≤ rk L − 2.                                                                   (1)

Wegen rk L ≤ dim Q = 6 folgt rk H ≤ 4, also dim N = 7 − rk H ≥ 3. K-17 gibt Δ ≥ 2, also

 rk L + 2 ≤ 2·rk H.                                                                 (2)

Aus (1) und (2): rk L + 2 ≤ 2·rk H ≤ 2·rk L − 4, also rk L ≥ 6. Mit rk L ≤ 6 ist rk L = 6. Dann rk H ≤ 4 nach (1) und rk H ≥ 4 nach (2). Also rk H = 4, dim N = 3, Δ = 8 − 6 = 2. K-16 gibt dim Ŝ ≥ 3 − 2 = 1. Also Ŝ ≠ 0, und K-13 für X = Ŝ gibt dim Ŝ + 2 ≤ dim(f_0(Ŝ) + f_1(Ŝ) + f_2(Ŝ)) ≤ dim f_0(N) = 3 (wie im Beweis von K-17). Also dim Ŝ = 1. ∎

**Rechnung zur Kontrolle (kein Teil des Beweises).** Das Programm `erkundung/s3-04-restfaelle-327.py` (Python 3, nur ganze Zahlen, ohne Abhängigkeiten, SHA-256 `83de52bca9f8a2c996dc1140388c0869d2673a6c7ad246e2df8253bd3de4a711`) zählt für ⟨3,2,7⟩ bei Länge 34 alle ganzzahligen Quadrupel (ρ, rk L, rk H, s) in den Bereichen 0 ≤ ρ ≤ 7, 0 ≤ rk L ≤ 6, 0 ≤ rk H ≤ 7, 0 ≤ s ≤ 7 − ρ vollständig ab und behält die, die alle seine Bedingungen erfüllen. Seine Bedingungen sind mehr als die oben benutzten: (G), rk L ≤ dim Q, Lemma I (K-17), dazu rk H ≥ ρ, rk L ≤ 2ρ, „rk L = 2ρ ⇒ ρ = 7“ (K-20), Lemma 8′ (rk L ≥ 2), Lemma 14 (ρ ≥ 2), Lemma 11 (2 rk H ≥ rk L), rk H = ρ + s und triviale Schranken. Aufruf `python3 erkundung/s3-04-restfaelle-327.py`, am 26.11.2026 um 14:53:28 UTC in diesem Auftrag laufen gelassen, Laufzeit unter 1 Sekunde. Die Ausgabe für diese Rolle lautet wörtlich:

```
== Main: <3,2,7>, r = 34, role n=3 (A is 3x2, U has dim 7) ==
<3,2,7> r=34 q=6 d=2: 1 residual (rho,rkL,rkH) cases
  rho=4 rkL=6 rkH=4 s in [0]  dimN=3 Delta=2 dimS in [1]
   same role without the n=3 conditions of Yang Section 4.1:
  rho=3 rkL=5 rkH=3 s in [0]
  rho=4 rkL=6 rkH=4 s in [0]
```

Gefolgert wird daraus nur: Die Rechnung stimmt mit dem Ergebnis von K-19 (rk L = 6, rk H = 4, dim N = 3, Δ = 2, dim Ŝ = 1) und von K-20 (ρ = 4) überein. Der Beweis von K-19 oben braucht das Programm nicht. Die zweite Liste zeigt, dass ohne Lemma I (K-17) ein weiterer Fall (3, 5, 3) bliebe.

### K-20 (die Größe ρ im Restfall; für den Endsatz nicht gebraucht)

**Wortlaut.** Sei K algebraisch abgeschlossen und V̂ wie in K-19 über K. Dann ist ρ = 4. Genauer gilt allgemein für jedes Verfahren über einem Körper mit (SN1), (SN2) und d = 2:
 (a) rk H ≥ ρ und rk L ≤ 2ρ;
 (b) (Lemma 15(b) für d = 2) ist K algebraisch abgeschlossen und rk L = 2ρ, dann ρ = m.

**Voraussetzungen.** (SN1), (SN2), K-7 (T4), K-14 (i), K-19. Für (b) zusätzlich: K algebraisch abgeschlossen.

**Beweis.** (a) Für jedes γ ist N = ker F_1 ∩ ker F_2 ⊆ ker(γ_1F_1 + γ_2F_2), also rk(γ_1F_1 + γ_2F_2) ≤ m − dim N = rk H. im L = im F_1 + im F_2 und rk F_i ≤ ρ, also rk L ≤ 2ρ.
(b) Gleichheit rk L = 2ρ erzwingt rk F_1 = rk F_2 = ρ und im F_1 ∩ im F_2 = 0. Für σ := F_1 + F_2 ist dann ker σ = N, also m − dim N = rk σ ≤ ρ, also dim N ≥ m − ρ = dim ker F_i. Wegen N ⊆ ker F_i folgt N = ker F_1 = ker F_2. Sei v ∈ N und i ∈ {1, 2}. Wegen F_i(v) = 0 ist f_i(v) = f_0(u_i) mit u_i ∈ U, also ℬ(u_i) = D(e_{00})^{−1}D(e_{i0})ℬ(v). Für {i, j} = {1, 2} folgt mit (D1) f_j(u_i) = D(e_{j0})D(e_{00})^{−1}D(e_{i0})ℬ(v) = f_i(u_j), also F_j(u_i) = F_i(u_j) ∈ im F_j ∩ im F_i = 0, also u_i ∈ ker F_j = N. Damit f_i(N) ⊆ f_0(N) für i = 1, 2. Angenommen N ≠ 0. Die Diagonalmatrix P_1 := D(e_{10})D(e_{00})^{−1} bildet 𝒱 := f_0(N) in sich ab (P_1f_0(N) = f_1(N)). Über dem algebraisch abgeschlossenen K hat P_1|_𝒱 einen Eigenvektor f_0(s) mit s ∈ N, s ≠ 0, P_1f_0(s) = λf_0(s). Dann f_1(s) − λf_0(s) = 0, im Widerspruch zu (SN2). Also N = 0 und ρ = m.
Restfall: rk L = 6, rk H = 4 (K-19), also 3 ≤ ρ ≤ 4 nach (a). Wäre ρ = 3, dann rk L = 2ρ, und (b) gäbe ρ = 7. Also ρ = 4. ∎

---
## 5. Koordinaten in einer Normalform

In K-21 bis K-27 ist F ein Körper, K ein algebraischer Abschluss von F, V ein Verfahren der Länge 34 für ⟨3,2,7⟩ über K, (S, T) ∈ 𝒢* und V̂ die Normalform zu (S, T). Alle Bezeichnungen aus 1.2 und 1.4 sind für V̂ gebildet. Nach K-12 erfüllt V̂ (SN1) und (SN2), a_0 = 1, f_0 = ℬ und f_i = a_i·f_0. Nach K-19 gilt in V̂: dim Q = 6, rk L = 6, dim N = 3, dim Ŝ = 1.

### K-21 (die Räume J, K′, f_0(N), f_0(Ŝ))

**Wortlaut.** In V̂ gilt:
 (a) Für x ∈ U mit Zeile 1 gleich y = (y_1, …, y_7) ist f_0(x) = Σ_k y_k·q_k. Also J = span(q_1, …, q_7), und q_1, …, q_7 sind linear unabhängig (dim J = 7).
 (b) dim K′ = 13 und **K′ = J + a_1·J + a_2·J**.
 (c) f_0(N) = {j ∈ J : a_1·j ∈ J und a_2·j ∈ J}, und dim f_0(N) = 3.
 (d) f_0(Ŝ) = {j ∈ f_0(N) : a_1·j ∈ f_0(N) und a_2·j ∈ f_0(N)}, und dim f_0(Ŝ) = 1.

**Voraussetzungen.** K-7 (T3), (T4), K-12, K-14 (i), K-19.

**Beweis.** (a) f_0(x)_t = ℬ̂(x)_t = β̂_t(x) = Σ_k y_k·β̂_t(e_{1k}) = Σ_k y_k·q_k(t), weil Zeile 0 von x null ist. Also J = f_0(U) = span(q_k). Nach K-14 (i) ist dim J = 7, also sind die sieben Erzeuger unabhängig.
(b) dim K′ = 34 − 21 = 13 nach (T3). rk L = 6 = dim Q heißt, dass L : U × U → Q surjektiv ist. Also K′ = J + f_1(U) + f_2(U) = J + a_1·J + a_2·J, weil f_i(x) = a_i·f_0(x) und f_0(U) = J.
(c) x ∈ U liegt genau dann in N = ker F_1 ∩ ker F_2, wenn f_1(x) = a_1·f_0(x) ∈ J und f_2(x) = a_2·f_0(x) ∈ J. Wende f_0 an. dim f_0(N) = dim N = 3, weil f_0 injektiv ist (T4).
(d) x ∈ N liegt genau dann in Ŝ, wenn f_1(x) = a_1·f_0(x) ∈ f_0(N) und f_2(x) = a_2·f_0(x) ∈ f_0(N). dim f_0(Ŝ) = dim Ŝ = 1. ∎

### K-22 (die Brent-Gruppen (A) bis (D) und die Bedingung (C′))

**Wortlaut.** In V̂ sei W(v) = Σ_t v_t·Ĉ_t und K′ = ker W. Für alle i ∈ {0, 1, 2} und k ∈ {1, …, 7} gilt:
 **(A)** a_i·q_k ∈ K′.
 **(B)** b_i·p_k ∈ K′.
 **(C)** a_i·p_k − b_i·q_k ∈ K′.
 **(D)** Die 21 Vektoren b_i·q_k sind modulo K′ linear unabhängig, und K^34 = K′ ⊕ span{b_i·q_k : i, k}.
Sei π : J → K^34 die lineare Abbildung mit π(q_k) = p_k (wohldefiniert nach K-21 (a)) und **κ(j) := π(j) − b_0·j**. Dann gilt für alle j ∈ J und i ∈ {0, 1, 2}: a_i·j ∈ K′, b_i·π(j) ∈ K′, a_i·π(j) − b_i·j ∈ K′, **κ(j) ∈ K′**, und

 **(C′) c_i·j − a_i·κ(j) ∈ K′ für i = 1, 2.**

**Voraussetzungen.** K-7 (T3), K-12 (V̂ ist ein Verfahren), K-21 (a), Brent-Gleichungen (1.1).

**Beweis.** Die Brent-Gleichungen für V̂ lauten Σ_t α̂_t(e_{ij})·β̂_t(e_{kl})·Ĉ_t = e_{ij}·e_{kl}. Mit den Bezeichnungen aus 1.4 ist α̂_t(e_{i0}) = a_i(t), α̂_t(e_{i1}) = b_i(t), β̂_t(e_{0k}) = p_k(t), β̂_t(e_{1k}) = q_k(t). Die linke Seite ist also W(Vektor · Vektor):
- e_{i0}·e_{1k} = 0 gibt W(a_i·q_k) = 0, das ist (A).
- e_{i1}·e_{0k} = 0 gibt W(b_i·p_k) = 0, das ist (B).
- e_{i0}·e_{0k} = e_{ik}^{(3×7)} gibt W(a_i·p_k) = e_{ik}.
- e_{i1}·e_{1k} = e_{ik}^{(3×7)} gibt W(b_i·q_k) = e_{ik}.
Aus den letzten beiden folgt W(a_i·p_k − b_i·q_k) = 0, das ist (C). Die 21 Matrizen e_{ik} bilden eine Basis von K^{3×7}. Ist Σ λ_{ik}·b_i·q_k ∈ K′, dann 0 = Σ λ_{ik}·e_{ik}, also λ = 0. Das ist die Unabhängigkeit modulo K′. Wegen dim K′ = 34 − 21 (K-7 (T3)) ist K′ ⊕ span{b_i·q_k} = K^34.
Die Aussagen für j ∈ J folgen aus (A), (B), (C) durch lineare Fortsetzung (j = Σ y_k q_k, π(j) = Σ y_k p_k). Mit i = 0 und a_0 = 1 sagt (C): π(j) − b_0·j ∈ K′, also κ(j) ∈ K′. Für i = 1, 2 ist b_i = c_i + a_i·b_0, also
 a_i·π(j) − b_i·j = a_i·b_0·j + a_i·κ(j) − c_i·j − a_i·b_0·j = a_i·κ(j) − c_i·j ∈ K′.
Das ist (C′). ∎

### K-23 (der Vektor w und die Zahl e)

**Wortlaut.** In V̂ sei v ∈ Ŝ mit v ≠ 0 und **w := f_0(v)**. Dann gilt:
 (a) w ∈ J, w ≠ 0, und w ist bis auf einen Faktor ≠ 0 eindeutig.
 (b) **f_0(N) = w·P_1**, und dim w·P_1 = 3.
 (c) **w·P_2 ⊆ J** und **w·P_3 ⊆ K′**.
 (d) w·P_2 = f_0(N) + f_1(N) + f_2(N).
 (e) **e := dim(w·P_2) − 3** liegt in {2, 3}.

**Voraussetzungen.** (SN2), K-12, K-13, K-19, K-21.

**Beweis.** (a) w ∈ f_0(Ŝ) ⊆ f_0(N) ⊆ J. dim Ŝ = 1, also ist v bis auf einen Faktor eindeutig, und w ≠ 0, weil f_0 injektiv ist.
(b) a_i·w = f_i(v) ∈ f_0(N) für i = 1, 2 (K-21 (d)). Also w·P_1 = span(w, a_1·w, a_2·w) ⊆ f_0(N). Nach (SN2) sind f_0(v), f_1(v), f_2(v), also w, a_1·w, a_2·w, linear unabhängig. Wegen dim f_0(N) = 3 ist f_0(N) = w·P_1.
(c) Nach K-21 (c) ist a_i·j ∈ J für j ∈ f_0(N) = w·P_1. Also w·P_2 = w·P_1 + a_1·(w·P_1) + a_2·(w·P_1) ⊆ J. Dann w·P_3 = w·P_2 + a_1·(w·P_2) + a_2·(w·P_2) ⊆ J + a_1·J + a_2·J = K′ (K-21 (b)).
(d) f_i(N) = a_i·f_0(N) = a_i·(w·P_1) (K-12), und P_1 + a_1P_1 + a_2P_1 = P_2.
(e) Nach K-13 für X = N (N ≠ 0, dim N = 3) ist dim(f_0(N) + f_1(N) + f_2(N)) ≥ 5, also e ≥ 2 nach (d). w·P_2 ist das Bild von P_2, dim P_2 = 6, also e ≤ 3. ∎

### K-24 (Zerlegungssatz)

**Wortlaut.** In V̂ gilt **K^34 = K″ + b_0·K′**, und dim K″ ≥ 21.

**Voraussetzungen.** K-21 (b), K-22.

**Beweis.** Nach (D) ist K^34 = K′ + Σ_{i=0}^{2} b_i·J. Es ist b_0·J ⊆ b_0·K′. Für i = 1, 2 und j ∈ J ist b_i·j = c_i·j + b_0·(a_i·j). Nach (C′) ist c_i·j ∈ a_i·κ(j) + K′ ⊆ a_i·K′ + K′ ⊆ K″, und a_i·j ∈ K′ nach K-22, also b_0·(a_i·j) ∈ b_0·K′. Mit K′ ⊆ K″ folgt K^34 = K″ + b_0·K′. Wegen dim b_0·K′ ≤ dim K′ = 13 ist dim K″ ≥ 34 − 13 = 21. ∎

### K-25 (die Bedingung (D′))

**Wortlaut.** In V̂ gilt:
 (a) dim J³_0 = 8.
 (b) Die Abbildung J³ → K^34/K′, (j_0, j_1, j_2) ↦ [b_0·j_0 + b_1·j_1 + b_2·j_2], ist injektiv.
 (c) Für j ∈ J³_0 ist Θ(j) = c_1·j_1 + c_2·j_2.
 (d) Θ : J³_0 → K^34 ist injektiv, **Θ(J³_0) ∩ K′ = 0** und dim Θ(J³_0) = 8.

**Voraussetzungen.** K-21 (a), (b), K-22 (D).

**Beweis.** (a) Die Abbildung J³ → K′, (j_i) ↦ j_0 + a_1·j_1 + a_2·j_2, ist nach K-21 (b) surjektiv. Ihr Kern ist J³_0, also dim J³_0 = 21 − 13 = 8.
(b) Schreibe j_i = Σ_k y_{ik}·q_k. Dann Σ_i b_i·j_i = Σ_{i,k} y_{ik}·b_i·q_k. Liegt das in K′, dann ist y = 0 nach (D).
(c) Σ_i b_i·j_i = b_0·j_0 + Σ_{i=1,2} (c_i + a_i·b_0)·j_i = b_0·(j_0 + a_1·j_1 + a_2·j_2) + c_1·j_1 + c_2·j_2, und der erste Summand ist 0.
(d) Folgt aus (a) und (b), weil Θ die Einschränkung der Abbildung aus (b) (vor dem Übergang zur Klasse) auf J³_0 ist. ∎

### K-26 (ω_{ik}·J ⊆ K″)

**Wortlaut.** In V̂ gilt ω_{ik}·j ∈ K″ für alle j ∈ J und 0 ≤ i, k ≤ 2.

**Voraussetzungen.** K-22 (C) in der Form a_i·π(j) − b_i·j ∈ K′.

**Beweis.** Ausmultiplizieren gibt
 a_k·(a_i·π(j) − b_i·j) − a_i·(a_k·π(j) − b_k·j) = a_i·b_k·j − a_k·b_i·j = ω_{ik}·j,
denn die Terme a_i·a_k·π(j) heben sich weg. Die linke Seite liegt in a_k·K′ + a_i·K′ ⊆ K″ (mit a_0·K′ = K′ ⊆ K″). ∎

### K-27 (Abschlusslemma)

**Wortlaut.** In V̂ gelte dim K″ = 21 und

 **(KS)** Zu jedem (j_0, j_1, j_2) ∈ J³_0 gibt es ψ_{ik} ∈ P_1 (0 ≤ i, k ≤ 2) mit ψ_{ii} = 0, ψ_{ki} = −ψ_{ik} und j_i = w·(Σ_k ψ_{ik}·a_k) für i = 0, 1, 2 (mit a_0 = 1).

Dann gilt:
 (a) Θ(j) = −Σ_{i<k} ψ_{ik}·ω_{ik}·w für j ∈ J³_0.
 (b) Θ(J³_0) ⊆ K″ und **K″ = K′ ⊕ Θ(J³_0)**.
 (c) **K″ ist ein 𝒜-Modul**: a_1·K″ ⊆ K″ und a_2·K″ ⊆ K″.
 (d) **J³_0 ⊆ (w·P_2)³.**

**Voraussetzungen.** dim K″ = 21, (KS), K-23 (b), (c), K-25 (d), K-26.

**Beweis.** (a) Θ(j) = Σ_i b_i·w·Σ_k ψ_{ik}a_k = w·Σ_{i,k} ψ_{ik}·b_i·a_k = w·Σ_{i<k} ψ_{ik}·(b_i·a_k − b_k·a_i) = −Σ_{i<k} ψ_{ik}·ω_{ik}·w, wegen ψ_{ki} = −ψ_{ik}, ψ_{ii} = 0 und b_ia_k − b_ka_i = −ω_{ik}.
(b) ψ_{ik}·w ∈ w·P_1 ⊆ J (K-23), also ω_{ik}·(ψ_{ik}·w) ∈ K″ (K-26), und Θ(j) ∈ K″ nach (a). Nach K-25 (d) ist Θ(J³_0) ∩ K′ = 0 und dim Θ(J³_0) = 8. Wegen K′ ⊆ K″ und 13 + 8 = 21 = dim K″ ist K″ = K′ ⊕ Θ(J³_0).
(c) Sei l ∈ {1, 2}. a_l·K′ ⊆ K″ nach Definition von K″. Für j ∈ J³_0 ist a_l·Θ(j) = −Σ_{i<k} ω_{ik}·(a_l·ψ_{ik}·w), und a_l·ψ_{ik}·w ∈ w·P_2 ⊆ J (K-23 (c)), also liegt jeder Summand nach K-26 in K″. Mit (b): a_l·K″ = a_l·K′ + a_l·Θ(J³_0) ⊆ K″.
(d) Σ_k ψ_{ik}·a_k ∈ P_2. ∎

---

## 6. Gestalt und Satz R in den Fällen e = 3 und e = 2

Rahmen wie in Abschnitt 5: V̂ ist eine Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ über K = F̄.

### K-28 (Gestalt bei e = 3)

**Wortlaut.** In V̂ gelte e = 3, also dim w·P_2 = 6. Wähle u ∈ J mit **J = w·P_2 ⊕ K·u**. Dann gilt:
 (a) **K′ = w·P_3 ⊕ u·P_1**, dim w·P_3 = 10, dim u·P_1 = 3.
 (b) **K″ = w·P_4 ⊕ u·P_2**, dim w·P_4 = 15, dim u·P_2 = 6, **dim K″ = 21**.
 (c) Die Abbildung ε : P_4 ⊕ P_2 → K″, (F, G) ↦ w·F + u·G, ist bijektiv. Insbesondere ist sie auf P_3 ⊕ P_1 injektiv.
 (d) **K^34 = K″ ⊕ b_0·K′**, und dim b_0·K′ = 13.

**Voraussetzungen.** K-21 (a), (b), K-23 (c), K-24.

**Beweis.** u existiert, weil w·P_2 ⊆ J (K-23), dim J = 7 und dim w·P_2 = 6.
(a) K′ = J + a_1·J + a_2·J = (w·P_2 + a_1·w·P_2 + a_2·w·P_2) + (K·u + K·a_1u + K·a_2u) = w·P_3 + u·P_1. Also 13 ≤ dim w·P_3 + dim u·P_1 ≤ dim P_3 + dim P_1 = 10 + 3. Gleichheit überall: Die Auswertungen P_3 → w·P_3 und P_1 → u·P_1 sind injektiv, und die Summe ist direkt.
(b) K″ = K′ + a_1·K′ + a_2·K′ = w·P_4 + u·P_2 nach (a). Also dim K″ ≤ 15 + 6 = 21, und dim K″ ≥ 21 nach K-24. Gleichheit überall.
(c) ε ist surjektiv nach (b), und dim(P_4 ⊕ P_2) = 21 = dim K″.
(d) K^34 = K″ + b_0·K′ (K-24) und 34 = 21 + 13 ≥ dim K″ + dim b_0·K′. Also ist die Summe direkt und dim b_0·K′ = 13. ∎

### K-29 (Satz R bei e = 3)

**Wortlaut.** In V̂ gelte e = 3. Dann gilt (KS) aus K-27, und dim K″ = 21. Folglich gelten die Aussagen (a) bis (d) von K-27: K″ = K′ ⊕ Θ(J³_0), K″ ist ein 𝒜-Modul, J³_0 ⊆ (w·P_2)³.

**Voraussetzungen.** K-3, K-27, K-28.

**Beweis.** Sei (j_0, j_1, j_2) ∈ J³_0 und j_i = w·φ_i + s_i·u mit φ_i ∈ P_2, s_i ∈ K (K-28). Dann
 0 = Σ_i a_i·j_i = w·(φ_0 + a_1φ_1 + a_2φ_2) + u·(s_0 + s_1a_1 + s_2a_2),
mit φ_0 + a_1φ_1 + a_2φ_2 ∈ P_3 und s_0 + s_1a_1 + s_2a_2 ∈ P_1. Nach K-28 (c) ist ε auf P_3 ⊕ P_1 injektiv. Also gilt als formales Polynom φ_0 + a_1φ_1 + a_2φ_2 = 0 und s_0 + s_1a_1 + s_2a_2 = 0, also s_0 = s_1 = s_2 = 0.
Setze Φ_i(X_0, X_1, X_2) := X_0²·φ_i(X_1/X_0, X_2/X_0) ∈ 𝒮_2 (𝒮 = K[X_0, X_1, X_2]). Dann ist X_0Φ_0 + X_1Φ_1 + X_2Φ_2 = X_0³·(φ_0 + a_1φ_1 + a_2φ_2)(X_1/X_0, X_2/X_0) = 0. K-3 gibt Ψ_{ik} ∈ 𝒮_1 mit Ψ_{ii} = 0, Ψ_{ki} = −Ψ_{ik} und Φ_i = Σ_k Ψ_{ik}X_k. Setze ψ_{ik}(a_1, a_2) := Ψ_{ik}(1, a_1, a_2) ∈ P_1. Einsetzen von (X_0, X_1, X_2) = (1, a_1, a_2) gibt φ_i = Σ_k ψ_{ik}·a_k mit a_0 = 1. Also j_i = w·φ_i = w·Σ_k ψ_{ik}a_k. Das ist (KS). dim K″ = 21 nach K-28 (b). ∎

### K-30 (Gestalt bei e = 2)

**Wortlaut.** In V̂ gelte e = 2, also dim w·P_2 = 5. Dann gilt:
 (a) Der Kern der Auswertung P_2 → K^34, g ↦ w·g, ist K·g_0 mit einem g_0 ∈ P_2 vom Grad genau 2. Für jedes t ∈ Σ ist g_0(ξ(t)) = 0.
 (b) Die Homogenisierung ĝ_0 = X_0²·g_0(X_1/X_0, X_2/X_0) ist irreduzibel (kein Produkt zweier Linearformen über K).
 (c) Wähle u_1, u_2 ∈ J mit **J = w·P_2 ⊕ K·u_1 ⊕ K·u_2** und setze u·P_d := {u_1·G_1 + u_2·G_2 : G_1, G_2 ∈ P_d}. Dann ist **K′ = w·P_3 ⊕ u·P_1** mit dim w·P_3 = 7 und dim u·P_1 = 6, und (G_1, G_2) ↦ u_1G_1 + u_2G_2 ist auf P_1² injektiv. Der Kern der Auswertung P_3 → K^34, f ↦ w·f, ist **g_0·P_1**.
 (d) **K″ = w·P_4 ⊕ u·P_2** mit dim w·P_4 = 9, dim u·P_2 = 12, **dim K″ = 21**, und **K^34 = K″ ⊕ b_0·K′**.

**Voraussetzungen.** (SN2), K-12, K-21, K-23, K-24.

**Beweis.** (a) dim P_2 = 6 und dim w·P_2 = 5, also hat der Kern Dimension 1. Sei g_0 ein Erzeuger. Weil dim w·P_1 = 3 = dim P_1 (K-23 (b)), ist der Kern ∩ P_1 = 0, also hat g_0 Grad genau 2. w·g_0 = 0 heißt w_t·g_0(ξ(t)) = 0 für alle t, also g_0(ξ(t)) = 0 für t ∈ Σ.
(b) Angenommen ĝ_0 = ℓ_1·ℓ_2 mit Linearformen ℓ_1, ℓ_2 ∈ 𝒮_1. Keine von beiden ist ein Vielfaches von X_0, sonst wäre g_0 = ĝ_0(1, a_1, a_2) das Produkt einer Konstanten mit einem Polynom vom Grad ≤ 1. Wähle ℓ_3 ∈ 𝒮_1, nicht proportional zu ℓ_2, und setze h := (ℓ_1ℓ_3)(1, a_1, a_2) ∈ P_2. Wäre h = λ·g_0, dann ℓ_1ℓ_3 = λℓ_1ℓ_2 (Homogenisierung ist injektiv auf P_2), also λ ≠ 0 und ℓ_3 = λℓ_2, Widerspruch. Also h ∉ K·g_0 und j := w·h ≠ 0 nach (a). j ∈ w·P_2 ⊆ J. Ist j_t ≠ 0, dann w_t ≠ 0, also g_0(ξ(t)) = 0 nach (a), und ℓ_1(1, ξ(t)) ≠ 0 (weil h(ξ(t)) ≠ 0), also ℓ_2(1, ξ(t)) = 0. Sei λ_2 := ℓ_2(1, a_1, a_2) ∈ P_1. Weil ℓ_2 kein Vielfaches von X_0 ist, hat λ_2 Grad genau 1, und λ_2·j = 0. Schreibe λ_2 = μ_0 + μ_1a_1 + μ_2a_2 mit (μ_1, μ_2) ≠ (0, 0). Dann μ_0·j + μ_1·a_1j + μ_2·a_2j = 0. Es ist j = f_0(x) mit x ∈ U, x ≠ 0, und a_ij = f_i(x) (K-12). Das widerspricht (SN2).
(c) Die Erzeuger u_1, u_2 existieren, weil w·P_2 ⊆ J (K-23), dim J = 7. Nach K-21 (b) ist K′ = J + a_1·J + a_2·J = w·P_3 + u·P_1, denn w·P_2 + a_1·(w·P_2) + a_2·(w·P_2) = w·P_3 und (K·u_1 + K·u_2) + a_1·(K·u_1 + K·u_2) + a_2·(K·u_1 + K·u_2) = u·P_1. Der Kern der Auswertung P_3 → K^34 enthält g_0·P_1 (w·(g_0f) = (w·g_0)·f = 0), und g_0·P_1 hat Dimension 3 (Multiplikation mit g_0 ≠ 0 ist im Polynomring injektiv). Also dim w·P_3 ≤ 10 − 3 = 7. dim u·P_1 ≤ 6. Wegen dim K′ = 13 gilt überall Gleichheit: dim w·P_3 = 7, der Kern ist genau g_0·P_1, u·P_1 hat Dimension 6 (Injektivität auf P_1²), und die Summe ist direkt.
(d) K″ = K′ + a_1·K′ + a_2·K′ = w·P_4 + u·P_2. Der Kern der Auswertung P_4 → K^34 enthält g_0·P_2 (Dimension 6), also dim w·P_4 ≤ 15 − 6 = 9, und dim u·P_2 ≤ 12. Also dim K″ ≤ 21, und dim K″ ≥ 21 nach K-24. Gleichheit überall. K^34 = K″ + b_0·K′ (K-24) mit 21 + 13 = 34, also direkt. ∎

### K-31 (Satz R bei e = 2)

**Wortlaut.** In V̂ gelte e = 2. Dann gilt (KS) aus K-27, und dim K″ = 21. Folglich gelten die Aussagen (a) bis (d) von K-27: K″ = K′ ⊕ Θ(J³_0), K″ ist ein 𝒜-Modul, J³_0 ⊆ (w·P_2)³.

**Voraussetzungen.** K-3, K-27, K-30.

**Beweis.** Sei (j_0, j_1, j_2) ∈ J³_0, j_i = w·φ_i + u_1·s_{i1} + u_2·s_{i2} mit φ_i ∈ P_2, s_{il} ∈ K. Dann
 0 = Σ_i a_i·j_i = w·(φ_0 + a_1φ_1 + a_2φ_2) + Σ_l u_l·(s_{0l} + s_{1l}a_1 + s_{2l}a_2).
Der erste Summand liegt in w·P_3, der zweite in u·P_1. Nach K-30 (c) ist die Summe direkt und der u-Anteil auf P_1² injektiv. Also s_{0l} + s_{1l}a_1 + s_{2l}a_2 = 0 als Polynom, alle s_{il} = 0, und w·(φ_0 + a_1φ_1 + a_2φ_2) = 0. Nach K-30 (c) ist φ_0 + a_1φ_1 + a_2φ_2 = g_0·(λ_0 + λ_1a_1 + λ_2a_2) mit λ_i ∈ K. Setze φ′_i := φ_i − λ_i·g_0 ∈ P_2. Dann w·φ′_i = w·φ_i (w·g_0 = 0), und φ′_0 + a_1φ′_1 + a_2φ′_2 = 0 als Polynom. Setze Φ′_i := X_0²·φ′_i(X_1/X_0, X_2/X_0) ∈ 𝒮_2. Dann X_0Φ′_0 + X_1Φ′_1 + X_2Φ′_2 = X_0³·(φ′_0 + a_1φ′_1 + a_2φ′_2)(X_1/X_0, X_2/X_0) = 0. K-3 gibt Ψ_{ik} ∈ 𝒮_1 mit Ψ_{ii} = 0, Ψ_{ki} = −Ψ_{ik}, Φ′_i = Σ_k Ψ_{ik}X_k. Mit ψ_{ik} := Ψ_{ik}(1, a_1, a_2) ∈ P_1 und Einsetzen von (1, a_1, a_2) ist φ′_i = Σ_k ψ_{ik}a_k (a_0 = 1). Also j_i = w·φ′_i = w·Σ_k ψ_{ik}a_k. Das ist (KS). dim K″ = 21 nach K-30 (d). ∎

---

## 7. Allgemeine Normalformen

In K-32 bis K-35 ist V ein Verfahren der Länge 34 für ⟨3,2,7⟩ über F, aufgefasst über K = F̄ (K-8). Nach K-18 (c) ist kein α_t die Nullform, und 𝒢* ≠ ∅. Jedes α_t hat also Rang 1 oder 2.

### K-32 (Lemma F, berichtigt)

**Wortlaut.** Seien α, α′ ∈ K^{3×2} zwei **von 0 verschiedene** Matrizen und V(α, α′) := {p ∈ K^{1×2} : α·pᵀ und α′·pᵀ sind linear abhängig}. Dann gilt genau eine der beiden Aussagen:
 (1) V(α, α′) = K^{1×2}, und es gilt (I) α′ = λ·α für ein λ ∈ K mit λ ≠ 0, oder (II) α und α′ haben beide Rang 1 und denselben Spaltenraum.
 (2) Einer der drei 2×2-Minoren der 3×2-Matrix (α·pᵀ | α′·pᵀ) ist als Polynom in p nicht das Nullpolynom. Er ist homogen vom Grad 2 in p, und **V(α, α′) liegt in seiner Nullstellenmenge**.
Gilt (I) oder (II), dann ist V(α, α′) = K^{1×2}.

**Voraussetzungen.** K unendlich, K-1 (a), (b).

**Beweis.** V(α, α′) ist die gemeinsame Nullstellenmenge der drei 2×2-Minoren m_1, m_2, m_3 von (α·pᵀ | α′·pᵀ). Jeder ist ein Polynom in p, homogen vom Grad 2 (jeder Eintrag ist linear in p). Ist ein m_i nicht das Nullpolynom, dann gilt (2). Sind alle drei das Nullpolynom, dann ist V(α, α′) = K^{1×2}, und es bleibt (I) oder (II) zu zeigen.
*α hat Rang 2.* Dann ist p ↦ α·pᵀ injektiv, also α·pᵀ ≠ 0 für p ≠ 0, und es gibt λ(p) ∈ K mit α′·pᵀ = λ(p)·α·pᵀ. Für linear unabhängige p_1, p_2 sind α·p_1ᵀ, α·p_2ᵀ unabhängig, und
 λ(p_1)·αp_1ᵀ + λ(p_2)·αp_2ᵀ = α′(p_1 + p_2)ᵀ = λ(p_1 + p_2)·(αp_1ᵀ + αp_2ᵀ)
gibt λ(p_1) = λ(p_1 + p_2) = λ(p_2). Mit p_1 = (1, 0), p_2 = (0, 1) folgt α′ = λ·α für λ := λ(p_1). Weil α′ ≠ 0, ist λ ≠ 0: (I).
*α′ hat Rang 2.* Ebenso mit vertauschten Rollen: α = λ′·α′ mit λ′ ≠ 0, weil α ≠ 0. Also α′ = (λ′)^{−1}·α: (I).
*Beide haben Rang 1.* Schreibe α = x·yᵀ, α′ = x′·y′ᵀ mit x, x′ ∈ K³ ∖ {0} und y, y′ ∈ K² ∖ {0}. Dann α·pᵀ = (y·p)·x mit y·p := y_1p_1 + y_2p_2. Das Polynom (y·p)(y′·p) ist ≠ 0 (K-1 (b)), wähle p mit (y·p)(y′·p) ≠ 0 (K-1 (a)). Aus der Abhängigkeit von (y·p)·x ≠ 0 und (y′·p)·x′ ≠ 0 folgt K·x = K·x′: (II).
Umgekehrt ist bei (I) α′pᵀ = λ·αpᵀ und bei (II) sind αpᵀ, α′pᵀ beide in der Geraden K·x. ∎

### K-33 (a-Punkte unter Basiswechsel)

**Wortlaut.** Sei (S, T) ∈ 𝒢* mit den Spalten s_0, s_1, s_2 von S und den Zeilen p, p′ von T, und V̂ die Normalform. Für einen Spaltenvektor a(t) := (1, a_1(t), a_2(t))ᵀ und b(t) := (b_0(t), b_1(t), b_2(t))ᵀ gilt
 a(t) = Sᵀα_tpᵀ / (s_0ᵀα_tpᵀ),  b(t) = Sᵀα_tp′ᵀ / (s_0ᵀα_tpᵀ),  mit s_0ᵀα_tpᵀ ≠ 0.
Weiter gilt:
 (i) **(c_1(t), c_2(t)) = (0, 0) genau dann, wenn α_t Rang 1 hat.**
 (ii) Hat α_t Rang 1, α_t = x·yᵀ, dann ist a(t) = Sᵀx / (s_0ᵀx). **Der a-Punkt von t hängt nur von S ab, nicht von T.**
 (iii) Hat α_t Rang 2, dann ist ℒ_t := {ξ ∈ K² : (1, ξ)ᵀ ∈ Sᵀ·α_t·K²} eine affine Gerade (die Nullstellenmenge eines λ_t ∈ P_1 vom Grad genau 1), und ξ(t) ∈ ℒ_t. Sind (S, T) und (S, T̃) in 𝒢* mit ersten Zeilen p und p̃, dann hat t in beiden Normalformen genau dann denselben a-Punkt, wenn p̃ ∈ K·p.
 (iv) Ist α_{t′} = λ·α_t mit λ ≠ 0, dann a(t′) = a(t) und b(t′) = b(t), also stimmen b_0, c_1, c_2 an t und t′ überein.
 (v) ξ(t) = ξ(t′) gilt genau dann, wenn p ∈ V(α_t, α_{t′}) (K-32).

**Voraussetzungen.** K-10, K-12, (SN1) für V^{(S,T)}; für (v) die Bezeichnung V(α, α′) aus K-32.

**Beweis.** Nach K-10 ist α′_t(e_{i0}) = s_iᵀα_tpᵀ und α′_t(e_{i1}) = s_iᵀα_tp′ᵀ, also (α′_t(e_{i0}))_i = Sᵀα_tpᵀ und (α′_t(e_{i1}))_i = Sᵀα_tp′ᵀ. (SN1) für V^{(S,T)} ist s_0ᵀα_tpᵀ ≠ 0. Die Skalierung teilt durch α′_t(e_{00}) = s_0ᵀα_tpᵀ.
(i) Die Koeffizientenmatrix von α̂_t hat die Spalten a(t) und b(t) und denselben Rang wie α_t (K-12). Es ist b(t) − b_0(t)·a(t) = (0, c_1(t), c_2(t))ᵀ. Ist c(t) = 0, dann b(t) = b_0(t)a(t), Rang 1. Ist der Rang 1, dann b(t) = μ·a(t) (a(t) ≠ 0), Vergleich der ersten Koordinate gibt μ = b_0(t), also c(t) = 0.
(ii) α_tpᵀ = (y·p)·x, also a(t) = (y·p)Sᵀx / ((y·p)·s_0ᵀx), und y·p ≠ 0, s_0ᵀx ≠ 0 wegen s_0ᵀα_tpᵀ ≠ 0.
(iii) E := Sᵀ·α_t·K² ist ein Unterraum der Dimension 2 (Rang 2, S invertierbar), also E = {X ∈ K³ : n·X = 0} mit n ≠ 0. a(t) ∈ E hat erste Koordinate 1. ℒ_t = {ξ : n_0 + n_1ξ_1 + n_2ξ_2 = 0}. Wäre (n_1, n_2) = (0, 0), dann n_0 ≠ 0 und ℒ_t = ∅, aber ξ(t) ∈ ℒ_t. Also hat λ_t := n_0 + n_1a_1 + n_2a_2 Grad 1. Zum Zweiten: Die a-Punkte sind gleich genau dann, wenn Sᵀα_tpᵀ und Sᵀα_tp̃ᵀ proportional sind (beide haben erste Koordinate ≠ 0). Weil p ↦ Sᵀα_tpᵀ injektiv und linear ist, heißt das p̃ ∈ K·p.
(iv) Zähler und Nenner werden beide mit λ multipliziert.
(v) ξ(t) = ξ(t′) heißt a(t) = a(t′), also sind Sᵀα_tpᵀ und Sᵀα_{t′}pᵀ proportional (beide haben erste Koordinate ≠ 0), also linear abhängig. Umgekehrt sind zwei abhängige Vektoren mit erster Koordinate ≠ 0 proportional, und nach Teilen durch die erste Koordinate gleich. Weil Sᵀ invertierbar ist, ist das gleichwertig zur Abhängigkeit von α_tpᵀ und α_{t′}pᵀ. ∎

### K-34 (Lemma O)

**Bezeichnungen.** Für jedes Paar t < t′, für das weder (I) noch (II) aus K-32 gilt, sei m_{tt′} ein Minor wie in K-32 (2). **𝒢_gen** := {(S, T) ∈ 𝒢 : m_{tt′}(p) ≠ 0 für alle diese Paare}, wobei p die erste Zeile von T ist. **𝒢_3** := {(S, T) ∈ 𝒢* : in der Normalform zu (S, T) ist e = 3}.

**Wortlaut.** Ist 𝒢_3 ≠ ∅, dann ist 𝒢_3 ∩ 𝒢_gen ≠ ∅.

**Voraussetzungen.** K-1, K-10, K-11, K-12, K-18 (c), K-19, K-21, K-23, K-32, K-33.

**Beweis.** *Schritt 1 (e als Rang).* Sei (S, T) ∈ 𝒢*. In der Normalform sei Q_T die 34×7-Matrix mit den Spalten q_k. Nach K-21 (a) hat sie Rang 7. Sei Ξ : (K^7)³ → (K^34)², (y, y′, y″) ↦ (a_1·Q_Ty − Q_Ty′, a_2·Q_Ty − Q_Ty″). Ist Ξ(y, y′, y″) = 0, dann sind y′, y″ durch y bestimmt (Q_T injektiv), und Q_Ty ∈ {j ∈ J : a_1j, a_2j ∈ J} = f_0(N) (K-21 (c)). Also bildet (y, y′, y″) ↦ Q_Ty den Kern von Ξ bijektiv auf f_0(N) ab, und dim ker Ξ = 3. Sei Ξ³ := Ξ × Ξ × Ξ auf ((K^7)³)³ ≅ K^63, mit dim ker Ξ³ = 9, und Γ : ((K^7)³)³ → K^34, ((y_0, ·, ·), (y_1, ·, ·), (y_2, ·, ·)) ↦ Q_Ty_0 + a_1·Q_Ty_1 + a_2·Q_Ty_2. Dann ist Γ(ker Ξ³) = f_0(N) + a_1·f_0(N) + a_2·f_0(N) = w·P_2 (K-23 (b)). Sei M_{S,T} die Matrix der Abbildung (Ξ³, Γ) : K^63 → K^{204} × K^34. Ihr Kern ist ker Ξ³ ∩ ker Γ. Also
 e + 3 = dim Γ(ker Ξ³) = 9 − dim(ker Ξ³ ∩ ker Γ) = 9 − (63 − rk M_{S,T}) = rk M_{S,T} − 54.
Nach K-23 (e) ist e ≤ 3. Also ist e = 3 genau dann, wenn rk M_{S,T} ≥ 60, also wenn ein 60×60-Minor von M_{S,T} nicht verschwindet.
*Schritt 2 (Polynome).* Die Einträge von M_{S,T} sind 0, ±1 und Produkte von a_i(t) = s_iᵀα_tpᵀ / s_0ᵀα_tpᵀ (K-33) mit q_k(t) = β_t(T^{−1}e_{1k}) = β_t(adj(T)·e_{1k}) / det T (K-10, K-12), sowie die q_k(t) selbst. Sei D(S, T) := det T · Π_t s_0ᵀα_tpᵀ, ein Polynom in den Einträgen von S und T. Jeder Eintrag ist von der Form (Polynom)/D, denn jeder Nenner s_0ᵀα_tpᵀ, det T und s_0ᵀα_tpᵀ·det T teilt D. Jeder 60×60-Minor μ ist also von der Form μ̃/D^{60} mit einem Polynom μ̃. Sei R := {(S, T) ∈ 𝒢 : D(S, T)·μ̃(S, T) ≠ 0 für ein μ}. R ist Zariski-offen in 𝒢. Auf 𝒢* ist D ≠ 0 ((SN1) und det T ≠ 0), also ist dort μ ≠ 0 genau dann, wenn μ̃ ≠ 0. Mit Schritt 1: **𝒢_3 = 𝒢* ∩ R.**
*Schritt 3.* Sei 𝒢_3 ≠ ∅. Dann ist R ≠ ∅. Sei Λ das Polynom aus K-11 (anwendbar nach K-18 (c)) und h := Λ(s_0, p)·Π m_{tt′}(p), ein Polynom in den Einträgen von S und T. Es ist ≠ 0 (K-1 (b); Λ ≠ 0 nach K-11, jedes m_{tt′} ≠ 0). Also ist R′ := {(S, T) ∈ 𝒢 : h(S, T) ≠ 0} offen und nach K-1 (a), (b) (angewandt auf h·det S·det T ≠ 0) nicht leer. Nach K-1 (c) ist R ∩ R′ ≠ ∅. Für (S, T) ∈ R ∩ R′ gilt Λ(s_0, p) ≠ 0, also (S, T) ∈ 𝒢* (K-11), also (S, T) ∈ 𝒢* ∩ R = 𝒢_3, und m_{tt′}(p) ≠ 0 für alle Paare, also (S, T) ∈ 𝒢_gen. ∎

### K-35 (Satz G in allgemeiner Normalform)

**Wortlaut.** Sei (S, T) ∈ 𝒢* ∩ 𝒢_gen und V̂ die Normalform. Sei **Y** := {t : α_t hat Rang 1}, **Ω** := {t : α_t hat Rang 2} (nach K-12 dieselben Mengen für α̂_t), Σ := {t : w_t ≠ 0}. Dann gilt:
 **(G0)** Jede Faser T_ξ liegt ganz in Y oder ganz in Ω. Auf einer Faser in Ω sind a, b, also b_0, c_1, c_2 konstant.
 **(G1)** c_1 = c_2 = 0 auf Y, und (c_1(z), c_2(z)) ≠ (0, 0) für jedes z ∈ Ω.
 **(G2)** Für jede Faser T_ξ ⊆ Y ist |T_ξ| = 2·d_ξ (mit d_ξ = dim χ_ξ·K″), Σ_{T_ξ ⊆ Y} d_ξ = 13, |Y| = 26, |Ω| = 8.
 **(G3)** K′ ∩ K^Ω = 0, **K″ = K′ ⊕ K^Ω**, Θ(J³_0) = K^Ω.
 **(G4)** Für jedes z ∈ Ω ist T_{ξ(z)} = {z} und w(z) ≠ 0. Insbesondere Ω ⊆ Σ.
 **(G5)** Die Menge Π_1 := {ξ(t) : t ∈ Y ∩ Σ} hat mindestens 7 Elemente.
 **(GM)** dim K″ = 21, K″ ist ein 𝒜-Modul, K″ = K′ ⊕ Θ(J³_0), J³_0 ⊆ (w·P_2)³, und K^34 = K″ + b_0·K′.

**Voraussetzungen.** K-2, K-6, K-12, K-23, K-24, K-25 (d), K-27, K-28, K-29, K-30, K-31, K-32, K-33.

**Beweis.** *Schritt 0 (was aus Abschnitt 6 gebraucht wird).* Nach K-23 (e) ist e ∈ {2, 3}. In beiden Fällen gilt nach K-28 und K-29 bzw. K-30 und K-31: dim K″ = 21, K″ ist ein 𝒜-Modul, K″ = K′ ⊕ Θ(J³_0), J³_0 ⊆ (w·P_2)³ (K-27), und dim w·P_3 ≥ 7 (10 bzw. 7). Außerdem K^34 = K″ + b_0·K′ (K-24) und dim Θ(J³_0) = 8 (K-25). Das ist (GM).
*Schritt 1 (G0).* Seien t ≠ t′ in derselben Faser. Nach K-33 (v) ist p ∈ V(α_t, α_{t′}). Weil (S, T) ∈ 𝒢_gen, ist m_{tt′}(p) ≠ 0 für jedes Paar, das weder (I) noch (II) erfüllt, also p ∉ V(α_t, α_{t′}) für diese Paare (K-32 (2)). Also erfüllt das Paar (I) oder (II). Bei (I) haben α_t, α_{t′} denselben Rang, bei (II) beide Rang 1. Eine Faser mit einem Index aus Y und einem aus Ω ist also unmöglich. In einer Faser in Ω gilt für jedes Paar (I) (weil (II) Rang 1 verlangt), und nach K-33 (iv) sind a, b dort konstant.
*Schritt 2 (G1).* K-33 (i).
*Schritt 3 (Zählung).* K″ ist ein 𝒜-Modul. Nach K-6 (ii) ist K″ = ⊕_ξ M_ξ, M_ξ = χ_ξ·K″ ⊆ K^{T_ξ}, Σ_ξ d_ξ = 21. Multipliziere K^34 = K″ + b_0·K′ mit χ_ξ: K^{T_ξ} = M_ξ + b_0·χ_ξ·K′ ⊆ M_ξ + b_0·M_ξ (χ_ξK′ ⊆ χ_ξK″ = M_ξ). Also |T_ξ| ≤ 2·d_ξ. Für T_ξ ⊆ Ω ist b_0 auf T_ξ konstant (G0), also b_0·M_ξ ⊆ M_ξ und |T_ξ| ≤ d_ξ ≤ |T_ξ|, also d_ξ = |T_ξ| und M_ξ = K^{T_ξ}. Summiere: 13 = 34 − 21 = Σ_ξ (|T_ξ| − d_ξ) = Σ_{T_ξ ⊆ Y} (|T_ξ| − d_ξ) ≤ Σ_{T_ξ ⊆ Y} |T_ξ|/2 = |Y|/2. Also |Y| ≥ 26 und |Ω| = 34 − |Y| ≤ 8.
*Schritt 4 (Θ lebt auf Ω).* Für j ∈ J³_0 ist Θ(j) = c_1·j_1 + c_2·j_2 (K-25 (c)), und c_1, c_2 verschwinden auf Y. Also Θ(J³_0) ⊆ K″ ∩ K^Ω = ⊕_{T_ξ ⊆ Ω} M_ξ (K-6 (iii), Ω ist nach (G0) eine Vereinigung von Fasern) = ⊕_{T_ξ ⊆ Ω} K^{T_ξ} = K^Ω. Also 8 = dim Θ(J³_0) ≤ |Ω|. Mit Schritt 3: |Ω| = 8, |Y| = 26, Θ(J³_0) = K^Ω, und in Schritt 3 gilt überall Gleichheit. Weil jeder Summand |T_ξ| − d_ξ ≤ |T_ξ|/2 ist und die Summe gleich Σ |T_ξ|/2, ist |T_ξ| = 2d_ξ für jede Faser in Y, und Σ_{T_ξ ⊆ Y} d_ξ = 26/2 = 13. Mit K″ = K′ ⊕ Θ(J³_0): K″ = K′ ⊕ K^Ω, also K′ ∩ K^Ω = 0. Das sind (G2) und (G3).
*Schritt 5 (G4).* c_1, c_2 sind auf jeder Faser konstant (auf Fasern in Y gleich 0, auf Fasern in Ω nach (G0)). Nach K-2 gibt es C_1, C_2 ∈ 𝒜 mit c_i = C_i·1 (1 der Vektor aus Einsen), also c_i·v = C_i·v für alle v. Für j ∈ J³_0 ist j_i = w·φ_i mit φ_i ∈ P_2 (K-27 (d)), also Θ(j) = (C_1φ_1 + C_2φ_2)·w ∈ 𝒜·w. Also K^Ω = Θ(J³_0) ⊆ 𝒜·w. Für eine Faser T_ξ ⊆ Ω folgt K^{T_ξ} = χ_ξ·K^Ω ⊆ χ_ξ·(𝒜·w) = K·(χ_ξ·w) (K-6 (iv)). Also |T_ξ| = 1 und w ≠ 0 auf T_ξ.
*Schritt 6 (G5).* Die Einschränkung w·P_3 → K^Y, v ↦ v|_Y, hat den Kern w·P_3 ∩ K^Ω ⊆ K′ ∩ K^Ω = 0 (w·P_3 ⊆ K′, K-23 (c)). Ihr Bild hat also Dimension dim w·P_3 ≥ 7. Für t ∈ Y ist (w·f)_t = w_t·f(ξ(t)); das ist 0, wenn t ∉ Σ, und hängt sonst nur von f(ξ(t)) mit ξ(t) ∈ Π_1 ab. Die Einschränkung von w·f auf Y hängt also nur von (f(ξ))_{ξ∈Π_1} ab, und das Bild hat Dimension ≤ |Π_1|. Also |Π_1| ≥ 7. ∎

---

## 8. Kein Verfahren hat eine Normalform mit e = 3

In K-36 und K-37 ist V wie in Abschnitt 7, (S, T) ∈ 𝒢* ∩ 𝒢_gen, V̂ die Normalform, und Y, Ω wie in K-35. Für x ∈ K^34 ist x|_Y ∈ K^Y die Einschränkung. Ein Polynom g ∈ 𝒜 wirkt auf K^Y durch g·y := (g(ξ(t))·y_t)_{t∈Y}.

### K-36 (die Operatoren τ und ν auf Y)

**Wortlaut.**
 (a) Y ist eine Vereinigung von Fasern, **K″|_Y = ⊕_{T_ξ ⊆ Y} M_ξ** (als Unterraum von K^Y, mit M_ξ = χ_ξ·K″ ⊆ K^{T_ξ}), dim K″|_Y = 13, und jedes g ∈ 𝒜 wirkt auf M_ξ als der Skalar g(ξ). Insbesondere ist K″|_Y unter 𝒜 abgeschlossen.
 (b) Für jede Faser T_ξ ⊆ Y gilt **K^{T_ξ} = M_ξ ⊕ b_0·M_ξ**, und die Multiplikation mit b_0 ist auf M_ξ injektiv. Es gibt also eindeutige lineare Abbildungen τ_ξ, ν_ξ : M_ξ → M_ξ mit

 b_0²·m = b_0·τ_ξ(m) − ν_ξ(m) für alle m ∈ M_ξ.

(c) Seien τ, ν : K″|_Y → K″|_Y die Abbildungen, die auf M_ξ als τ_ξ bzw. ν_ξ wirken. Dann gilt für jedes j ∈ J:
 (i) **κ(j)|_Y = −τ(j|_Y)**,
 (ii) **(b_0·π(j))|_Y = −ν(j|_Y)**.
τ und ν vertauschen mit der Wirkung jedes g ∈ 𝒜.

**Voraussetzungen.** K-6, K-22 (B) in der Form b_0·π(j) ∈ K′, κ(j) ∈ K′, π(j) = b_0·j + κ(j); K-35 (G0), (G2), (GM).

**Beweis.** (a) Nach (G0) ist Y eine Vereinigung von Fasern. K″ ist ein 𝒜-Modul (GM), also gibt K-6 (iii) K″|_Y = ⊕_{T_ξ ⊆ Y} M_ξ und dim K″|_Y = Σ_{T_ξ ⊆ Y} d_ξ = 13 (G2). Die Wirkung als Skalar ist K-6 (i).
(b) Multipliziere K^34 = K″ + b_0·K′ (K-24) mit χ_ξ: K^34 = K″ + b_0·K′ (GM) mit χ_ξ: K^{T_ξ} = M_ξ + b_0·χ_ξ·K′ ⊆ M_ξ + b_0·M_ξ, weil χ_ξ·K′ ⊆ χ_ξ·K″ = M_ξ. Also |T_ξ| ≤ dim(M_ξ + b_0·M_ξ) ≤ 2·d_ξ = |T_ξ| (G2). Gleichheit überall: Die Summe ist direkt, dim b_0·M_ξ = d_ξ, also ist m ↦ b_0·m auf M_ξ injektiv. Für m ∈ M_ξ liegt b_0²·m in K^{T_ξ} und hat eine eindeutige Zerlegung b_0·m′ + m″ mit m′, m″ ∈ M_ξ (m′ eindeutig wegen der Injektivität). Setze τ_ξ(m) := m′, ν_ξ(m) := −m″. Beide sind linear.
Sei j ∈ J und T_ξ ⊆ Y. Es ist j ∈ K′ ⊆ K″ und κ(j) ∈ K′ ⊆ K″, also j_ξ := χ_ξ·j ∈ M_ξ und κ_ξ := χ_ξ·κ(j) ∈ M_ξ. Weiter b_0·π(j) ∈ K′ ⊆ K″, also χ_ξ·(b_0·π(j)) ∈ M_ξ. Mit π(j) = b_0·j + κ(j):
 χ_ξ·(b_0·π(j)) = b_0²·j_ξ + b_0·κ_ξ = b_0·(τ_ξ(j_ξ) + κ_ξ) − ν_ξ(j_ξ).
Die linke Seite und ν_ξ(j_ξ) liegen in M_ξ, also liegt b_0·(τ_ξ(j_ξ) + κ_ξ) in M_ξ ∩ b_0·M_ξ = 0. Wegen der Injektivität ist κ_ξ = −τ_ξ(j_ξ), und dann χ_ξ·(b_0·π(j)) = −ν_ξ(j_ξ). Weil (x|_Y) die Summe der χ_ξ·x über die Fasern in Y ist, folgen (i) und (ii).
(c) Ein g ∈ 𝒜 wirkt auf M_ξ als Skalar g(ξ), und τ_ξ, ν_ξ sind linear. ∎

### K-37 (lokaler Widerspruch; berichtigter Wortlaut von S4-27-C)

**Wortlaut.** Es gelten die folgenden Voraussetzungen über die Normalform V̂ (die alle aus den genannten Gliedern folgen):
 (N) V̂ ist eine Normalform mit a_0 = 1 (K-12);
 (B), (C′) und die Zerlegung π(j) = b_0·j + κ(j) mit κ(j) ∈ K′ (K-22);
 w·P_2 ⊆ J und w·P_3 ⊆ K′ (K-23 (c));
 K″ ist ein 𝒜-Modul, und K^34 = K″ + b_0·K′ (K-35 (GM));
 (G0) bis (G3) aus K-35;
 die Operatoren τ, ν aus K-36.
Dann gilt für jedes z ∈ Ω: **w(z) = 0.**

**Voraussetzungen.** K-12, K-22, K-23 (c), K-35 (G0) bis (G3), (GM), K-36.

**Beweis.** *Fortsetzungsabbildung.* Die Einschränkung K′ → K″|_Y, x ↦ x|_Y, ist injektiv (ihr Kern ist K′ ∩ K^Ω = 0 nach (G3)), und beide Räume haben Dimension 13 (K-36 (a)). Sie ist also bijektiv. Sei E : K″|_Y → K′ ihre Umkehrung, z ∈ Ω fest, und η : K″|_Y → K, η(y) := E(y)(z). η ist linear, und **für jedes x ∈ K′ ist x(z) = η(x|_Y).**
Schreibe z_i := a_i(z), β_z := b_0(z), c_i(z) für die Werte an z, und für j ∈ J: j_Y := j|_Y ∈ K″|_Y. Nach K-36 (c) (i) ist κ(j)|_Y = −τ(j_Y), also j(z) = η(j_Y) und κ(j)(z) = −η(τ(j_Y)), weil j und κ(j) in K′ liegen. Damit
 π(j)(z) = β_z·j(z) + κ(j)(z) = η((β_z − τ)(j_Y)).

*Drei Gleichungsgruppen.* Für alle j ∈ J und i = 1, 2:

**(P_i) c_i(z)·η(j_Y) = η((a_i − z_i)·τ(j_Y)).** Nach (C′) ist x := c_i·j − a_i·κ(j) ∈ K′. Auf Y ist c_i = 0 (G1), also x|_Y = −a_i·κ(j)|_Y = a_i·τ(j_Y). An z ist x(z) = c_i(z)·η(j_Y) + z_i·η(τ(j_Y)). Aus x(z) = η(x|_Y) folgt (P_i).

**(Q_0) β_z²·η(j_Y) − β_z·η(τ(j_Y)) + η(ν(j_Y)) = 0.** Nach (B) ist x := b_0·π(j) ∈ K′, nach K-36 (c) (ii) x|_Y = −ν(j_Y). An z ist x(z) = β_z·π(j)(z) = β_z·η((β_z − τ)(j_Y)). Aus x(z) = η(x|_Y) folgt (Q_0).

**(Q_i) c_i(z)·η((β_z − τ)(j_Y)) + η((a_i − z_i)·ν(j_Y)) = 0.** Nach (B) ist x := b_i·π(j) ∈ K′. Mit b_i = c_i + a_i·b_0 ist x = c_i·π(j) + a_i·(b_0·π(j)). Auf Y ist c_i = 0, also x|_Y = a_i·(b_0π(j))|_Y = −a_i·ν(j_Y). An z ist x(z) = (c_i(z) + z_i·β_z)·η((β_z − τ)(j_Y)). Aus x(z) = η(x|_Y) folgt c_i(z)·η((β_z − τ)j_Y) + z_i·β_z·η((β_z − τ)j_Y) + η(a_i·ν(j_Y)) = 0. Nach (Q_0) ist β_z·η((β_z − τ)j_Y) = −η(ν(j_Y)). Einsetzen gibt (Q_i).

*Eine Richtung.* Nach (G1) ist (c_1(z), c_2(z)) ≠ (0, 0). Wähle (ε_1, ε_2) ∈ K² mit ε_1c_1(z) + ε_2c_2(z) = 1 und setze
 ℓ* := ε_1·(a_1 − z_1) + ε_2·(a_2 − z_2) ∈ P_1, also ℓ*(z) = 0, wobei ℓ*(z) den Wert an der Stelle ξ(z) = (z_1, z_2) meint.
ε_1·(P_1) + ε_2·(P_2) und ε_1·(Q_1) + ε_2·(Q_2) geben für alle j ∈ J:
 (P) η(j_Y) = η(ℓ*·τ(j_Y)),
 (Q) η((β_z − τ)(j_Y)) + η(ℓ*·ν(j_Y)) = 0.

*Einsetzen von j = w·G.* Sei ω := w|_Y ∈ K″|_Y. Für g ∈ 𝒜 setze 𝔪(g) := η(g·ω), 𝔱(g) := η(τ(g·ω)), 𝔫(g) := η(ν(g·ω)). Für g ∈ P_3 ist w·g ∈ K′ (w·P_3 ⊆ K′) und (w·g)|_Y = g·ω, also **𝔪(g) = (w·g)(z) = w(z)·g(z)**. Für G ∈ P_2 ist w·G ∈ J (w·P_2 ⊆ J) mit (w·G)_Y = G·ω. Weil τ und ν mit 𝒜 vertauschen, werden (P), (Q), (Q_0) zu
 (P′) 𝔱(ℓ*·G) = w(z)·G(z),
 (Q′) β_z·w(z)·G(z) − 𝔱(G) + 𝔫(ℓ*·G) = 0,
 (Q_0′) β_z²·w(z)·G(z) − β_z·𝔱(G) + 𝔫(G) = 0,
jeweils für alle G ∈ P_2.

*Vier Werte.*
1. (P′) mit G = ℓ*: 𝔱(ℓ*²) = w(z)·ℓ*(z) = 0.
2. (Q_0′) mit G = ℓ*²: β_z²·w(z)·ℓ*(z)² − β_z·𝔱(ℓ*²) + 𝔫(ℓ*²) = 0, mit 1 also **𝔫(ℓ*²) = 0**.
3. (Q′) mit G = ℓ*: β_z·w(z)·ℓ*(z) − 𝔱(ℓ*) + 𝔫(ℓ*²) = 0, also **𝔱(ℓ*) = 0**.
4. (P′) mit G = 1: **𝔱(ℓ*) = w(z)**.
Aus 3 und 4 folgt w(z) = 0. ∎

**Hinweis zum Wortlaut.** Der Beweis benutzt e = 3 nicht. Er benutzt aber, über K-35, K″ als 𝒜-Modul und dim K″ = 21. Diese stehen in K-35 (GM) und kommen dort aus K-29 (e = 3) oder K-31 (e = 2). Die Kette wendet K-37 nur in K-38 an, also bei e = 3.

### K-38 (Ausschluss von e = 3)

**Wortlaut.** Sei V ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F, aufgefasst über K = F̄. Dann ist **𝒢_3 = ∅**: Keine Normalform von V hat e = 3.

**Voraussetzungen.** K-8, K-18 (c), K-34, K-35, K-37.

**Beweis.** Angenommen 𝒢_3 ≠ ∅. Nach K-34 gibt es (S, T) ∈ 𝒢_3 ∩ 𝒢_gen ⊆ 𝒢* ∩ 𝒢_gen. Nach K-35 (G2) ist |Ω| = 8, wähle z ∈ Ω. Nach (G4) ist w(z) ≠ 0. Nach K-37 ist w(z) = 0. Widerspruch. ∎

---

## 9. Jedes Verfahren hat eine Normalform mit e = 3

### K-39 (eine unendliche Familie allgemeiner Normalformen)

**Wortlaut.** Sei V wie in Abschnitt 7. Es gibt eine invertierbare Matrix S und eine unendliche Menge 𝒫 ⊆ P¹(K) mit folgender Eigenschaft: Zu jedem [p] ∈ 𝒫 gibt es einen Vertreter p und ein T_p ∈ GL_2(K) mit erster Zeile p, so dass (S, T_p) ∈ 𝒢* ∩ 𝒢_gen.

**Voraussetzungen.** K-1 (a), (b), K-5, K-11, K-18 (c), K-32, K-34 (Bezeichnung 𝒢_gen).

**Beweis.** Kein α_t ist die Nullform (K-18 (c)). Sei Λ(s_0, p) das Polynom aus K-11. Schreibe Λ = Σ_μ c_μ(s_0)·p^μ als Polynom in p mit Koeffizienten c_μ ∈ K[s_0]. Weil Λ ≠ 0, ist ein c_μ ≠ 0, und nach K-1 (a) gibt es s_* ∈ K³ mit c_μ(s_*) ≠ 0. Dann ist Λ(s_*, ·) ≠ 0 als Polynom in p, homogen (K-11). Es gibt also p mit Λ(s_*, p) ≠ 0 (K-1 (a)), und nach K-11 ist dann s_* ≠ 0. Ergänze s_* zu einer invertierbaren Matrix S mit erster Spalte s_*.
Sei Q(p) := Λ(s_*, p)·Π m_{tt′}(p), das Produkt über alle Paare t < t′, die weder (I) noch (II) aus K-32 erfüllen. Q ist ein Produkt homogener Polynome ≠ 0, also homogen und ≠ 0 (K-1 (b)). Nach K-5 ist 𝒫 := {[p] ∈ P¹(K) : Q(p) ≠ 0} unendlich. Zu [p] ∈ 𝒫 wähle einen Vertreter p (dann p ≠ 0) und ergänze ihn zu T_p ∈ GL_2(K) mit erster Zeile p. Wegen Λ(s_*, p) ≠ 0 ist (S, T_p) ∈ 𝒢* (K-11), und wegen m_{tt′}(p) ≠ 0 für alle Paare ist (S, T_p) ∈ 𝒢_gen. ∎

### K-40 (jedes Verfahren der Länge 34 hat eine Normalform mit e = 3)

**Wortlaut.** Sei V ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F, aufgefasst über K = F̄. Dann ist **𝒢_3 ≠ ∅**.

**Voraussetzungen.** K-4 (b), (c), K-23 (e), K-30 (a), (b), K-33 (ii), (iii), K-35 (G4), (G5), K-39.

**Beweis.** Angenommen 𝒢_3 = ∅. Dann hat nach K-23 (e) jede Normalform e = 2. Seien S, 𝒫 und T_p wie in K-39. Für [p] ∈ 𝒫 sei V̂_p die Normalform zu (S, T_p), w^{(p)}, Σ_p := {t : w^{(p)}_t ≠ 0}, g_0^{(p)} wie in K-30 (a) für V̂_p, und ξ_p(t) der a-Punkt von t in V̂_p. Y und Ω hängen nicht von p ab (Rang von α_t).
*Schritt 1 (Schubfach).* Es gibt nur endlich viele Teilmengen von {1, …, 34}, und 𝒫 ist unendlich. Also gibt es Σ* und eine unendliche Teilmenge 𝒫* ⊆ 𝒫 mit Σ_p = Σ* für alle [p] ∈ 𝒫*.
*Schritt 2 (ein fester Kegelschnitt).* Für t ∈ Y hängt ξ_p(t) nach K-33 (ii) nur von S ab, schreibe ξ(t). Für [p] ∈ 𝒫* ist Π_1 := {ξ(t) : t ∈ Y ∩ Σ*} also dieselbe Menge, und nach K-35 (G5) hat sie mindestens 7 Elemente. Nach K-30 (a) verschwindet g_0^{(p)} auf Π_1 (für t ∈ Σ* = Σ_p). Nach K-30 (a), (b) hat g_0^{(p)} Grad 2 und eine irreduzible Homogenisierung. Nach K-4 (b) liegen keine drei Punkte von Π_1 auf einer affinen Geraden. Wähle fünf Punkte von Π_1. Nach K-4 (c) liegt jedes g_0^{(p)}, [p] ∈ 𝒫*, in einem Raum der Dimension ≤ 1. Fixiere [p_1] ∈ 𝒫* und g* := g_0^{(p_1)}. Dann ist g_0^{(p)} = λ_p·g* mit λ_p ≠ 0 für alle [p] ∈ 𝒫*. g* hat Grad 2 und eine irreduzible Homogenisierung.
*Schritt 3 (ein wandernder Punkt).* Wähle z ∈ Ω (Ω ≠ ∅ nach K-35 (G2)). Nach K-35 (G4) ist z ∈ Σ_p = Σ* für alle [p] ∈ 𝒫*, also g_0^{(p)}(ξ_p(z)) = 0 (K-30 (a)) und damit g*(ξ_p(z)) = 0. Nach K-33 (iii) liegt ξ_p(z) auf der affinen Geraden ℒ_z, die nur von S und α_z abhängt, und verschiedene [p] ∈ 𝒫* geben verschiedene Punkte ξ_p(z). Also hat g* unendlich viele Nullstellen auf der affinen Geraden ℒ_z. Das widerspricht K-4 (b). ∎

---

## 10. Endsatz

### K-41 (R_F(⟨3,2,7⟩) ≥ 35)

**Wortlaut.** Für jeden Körper F ist **R_F(⟨3,2,7⟩) ≥ 35**.

**Voraussetzungen.** K-8, K-18 (b), (c), K-38, K-40.

**Beweis.** Nach K-18 (b) hat jedes Verfahren für ⟨3,2,7⟩ über F mindestens die Länge 34. Angenommen, es gibt eines der Länge 34. Fasse es über K = F̄ auf (K-8). Nach K-18 (c) ist 𝒢* ≠ ∅, und alle Begriffe der Abschnitte 5 bis 9 sind erklärt. Nach K-40 ist 𝒢_3 ≠ ∅, nach K-38 ist 𝒢_3 = ∅. Widerspruch. Also hat jedes Verfahren mindestens die Länge 35. ∎

### Prüfung der Quantoren

- K-38 sagt: **Für jedes** Verfahren V der Länge 34 über einem Körper F und **jedes** (S, T) ∈ 𝒢* hat die Normalform zu (S, T) nicht e = 3. Der Beweis nimmt ein beliebiges Element von 𝒢_3 an und erzeugt daraus mit K-34 ein Element von 𝒢_3 ∩ 𝒢_gen, also für dasselbe V eine andere Normalform. Der Widerspruch entsteht in dieser zweiten Normalform. Das reicht, weil die Aussage „𝒢_3 = ∅“ heißt.
- K-40 sagt: **Für jedes** Verfahren V der Länge 34 gibt es **ein** (S, T) ∈ 𝒢* mit e = 3. Der Beweis nimmt an, dass **alle** Normalformen von V e = 2 haben (nach K-23 (e) ist das die Verneinung), und benutzt das für **unendlich viele** Normalformen (S, T_p) mit festem S.
- K-41 verbindet beide für dasselbe V: 𝒢_3(V) ≠ ∅ und 𝒢_3(V) = ∅.
- Die Zahl e ist für jede einzelne Normalform erklärt (K-23 (a): w ist bis auf einen Faktor eindeutig, e hängt nicht von der Wahl von v ab). „e = 3 in der Normalform zu (S, T)“ ist also eine Eigenschaft von (S, T).
- Der Körper: F ist beliebig. Alle Schritte nach K-8 finden über K = F̄ statt. Benutzt wird von K nur, dass er unendlich ist (K-1, K-4, K-5, K-11, K-39), und in K-20 (b) die algebraische Abgeschlossenheit. K-20 ist für den Endsatz nicht nötig. Keine Division durch eine ganze Zahl kommt vor, und K-3 gilt in jeder Charakteristik.

---
## 11. Liste der Glieder mit Abhängigkeiten

Die Spalte „benutzt“ nennt die Glieder aus der Zeile „Voraussetzungen“ des Glieds. Die Spalte „benutzt von“ ist die Umkehrung. Die Spalte „Endsatz“ sagt, ob das Glied über eine Kette von Abhängigkeiten in K-41 eingeht.

| Glied | Gegenstand | benutzt | benutzt von | Endsatz |
|---|---|---|---|---|
| K-1 | Polynome über unendlichen Körpern | – | K-4, K-11, K-32, K-34, K-39 | ja |
| K-2 | Interpolation | – | K-6, K-35 | ja |
| K-3 | Koszul im Grad 2 | – | K-29, K-31 | ja |
| K-4 | Geraden und Kegelschnitte | K-1 | K-40 | ja |
| K-5 | homogene Polynome in zwei Variablen | – | K-39 | ja |
| K-6 | Zerlegung eines 𝒜-Moduls nach Fasern | K-2 | K-35, K-36 | ja |
| K-7 | Grundtatsachen über Verfahren | – | K-11, K-13, K-14, K-15, K-16, K-20, K-21, K-22 | ja |
| K-8 | R1: Körpererweiterung | – | K-18, K-38, K-41 | ja |
| K-9 | R2: Nullformen streichen | – | K-18 | ja |
| K-10 | R3: Basiswechsel | – | K-11, K-12, K-18, K-33, K-34 | ja |
| K-11 | Lemma A′: starke Normalisierung, mit Polynom | K-1, K-7, K-10 | K-18, K-34, K-39 | ja |
| K-12 | Skalierung; Eigenschaften einer Normalform | K-10 | K-19, K-21, K-22, K-23, K-30, K-33, K-34, K-35, K-37 | ja |
| K-13 | Lemma B: Dimensionszuwachs | K-7 | K-17, K-19, K-23 | ja |
| K-14 | Lemma C, D, E: Inklusionen und Vertauschungen | K-7 | K-15, K-16, K-18, K-19, K-20, K-21 | ja |
| K-15 | Lemma 10, Kern von Φ, und die Grundungleichung (G) | K-7, K-14 | K-18, K-19 | ja |
| K-16 | Lemma H | K-7, K-14 | K-17, K-19 | ja |
| K-17 | Lemma I | K-13, K-16 | K-18, K-19 | ja |
| K-18 | untere Schranke 34 und ihre Folgen | K-8, K-9, K-10, K-11, K-14, K-15, K-17 | K-34, K-38, K-39, K-41 | ja |
| K-19 | der Restfall | K-12, K-13, K-14, K-15, K-16, K-17 | K-20, K-21, K-23, K-34 | ja |
| K-20 | die Größe ρ im Restfall; für den Endsatz nicht gebraucht | K-7, K-14, K-19 | – | nein |
| K-21 | die Räume J, K′, f_0(N), f_0(Ŝ) | K-7, K-12, K-14, K-19 | K-22, K-23, K-24, K-25, K-28, K-30, K-34 | ja |
| K-22 | die Brent-Gruppen (A) bis (D) und die Bedingung (C′) | K-7, K-12, K-21 | K-24, K-25, K-26, K-36, K-37 | ja |
| K-23 | der Vektor w und die Zahl e | K-12, K-13, K-19, K-21 | K-27, K-28, K-30, K-34, K-35, K-37, K-40 | ja |
| K-24 | Zerlegungssatz | K-21, K-22 | K-28, K-30, K-35 | ja |
| K-25 | die Bedingung (D′) | K-21, K-22 | K-27, K-35 | ja |
| K-26 | ω_{ik}·J ⊆ K″ | K-22 | K-27 | ja |
| K-27 | Abschlusslemma | K-23, K-25, K-26 | K-29, K-31, K-35 | ja |
| K-28 | Gestalt bei e = 3 | K-21, K-23, K-24 | K-29, K-35 | ja |
| K-29 | Satz R bei e = 3 | K-3, K-27, K-28 | K-35 | ja |
| K-30 | Gestalt bei e = 2 | K-12, K-21, K-23, K-24 | K-31, K-35, K-40 | ja |
| K-31 | Satz R bei e = 2 | K-3, K-27, K-30 | K-35 | ja |
| K-32 | Lemma F, berichtigt | K-1 | K-33, K-34, K-35, K-39 | ja |
| K-33 | a-Punkte unter Basiswechsel | K-10, K-12, K-32 | K-34, K-35, K-40 | ja |
| K-34 | Lemma O | K-1, K-10, K-11, K-12, K-18, K-19, K-21, K-23, K-32, K-33 | K-38, K-39 | ja |
| K-35 | Satz G in allgemeiner Normalform | K-2, K-6, K-12, K-23, K-24, K-25, K-27, K-28, K-29, K-30, K-31, K-32, K-33 | K-36, K-37, K-38, K-40 | ja |
| K-36 | die Operatoren τ und ν auf Y | K-6, K-22, K-35 | K-37 | ja |
| K-37 | lokaler Widerspruch; berichtigter Wortlaut von S4-27-C | K-12, K-22, K-23, K-35, K-36 | K-38 | ja |
| K-38 | Ausschluss von e = 3 | K-8, K-18, K-34, K-35, K-37 | K-41 | ja |
| K-39 | eine unendliche Familie allgemeiner Normalformen | K-1, K-5, K-11, K-18, K-32, K-34 | K-40 | ja |
| K-40 | jedes Verfahren der Länge 34 hat eine Normalform mit e = 3 | K-4, K-23, K-30, K-33, K-35, K-39 | K-41 | ja |
| K-41 | R_F(⟨3,2,7⟩) ≥ 35 | K-8, K-18, K-38, K-40 | – | ja |

Nicht im Endsatz: K-20.

Jedes Glied benutzt nur Glieder mit kleinerer Nummer.

---

## 12. Änderungen gegenüber Stufe 4

Für jede Änderung steht der alte Wortlaut (wörtlich aus der genannten Quelle; Statusangaben darin sind durch […] ersetzt), der neue Wortlaut oder die neue Stelle, und der Grund. Die Quellen sind in Abschnitt 14 genannt.

### 12.1 Lemma F: Formen ungleich null, „liegt in“ statt „ist“

**Alt** (`lean/prosa/s4_327_spurA_r4_m21.md`, Abschnitt 5.1, wörtlich in B-030): „Für t ≠ t′ sei V_{tt′} := {p ∈ K^{1×2} : die Vektoren α_t pᵀ und α_{t′} pᵀ sind linear abhängig}, eine abgeschlossene Menge (2×2-Minoren). **Es ist V_{tt′} = K^{1×2} genau dann, wenn (I) α_{t′} = λ·α_t für ein λ ∈ K, oder (II) beide Rang 1 haben und dieselbe Spalte K·x.**“ Dazu in derselben Quelle: „Jedes solche V_{tt′} ist die Nullstellenmenge eines vom Nullpolynom verschiedenen 2×2-Minors in p“. In `lean/prosa/s4_327_spurA_r5_e2.md`, Abschnitt 5.1: „Sonst ist V_{tt′} die Nullstellenmenge eines von null verschiedenen 2×2-Minors von (α_tpᵀ | α_{t′}pᵀ), eines homogenen Polynoms vom Grad 2 in p, also eine Vereinigung von höchstens zwei Geraden durch 0.“

**Neu:** K-32. Die beiden Matrizen sind ausdrücklich ≠ 0, in (I) ist λ ≠ 0, und V(α, α′) **liegt in** der Nullstellenmenge eines von null verschiedenen Minors.

**Grund.** (1) Ist α_t = 0 und α_{t′} ≠ 0, dann ist V_{tt′} = K^{1×2}, aber weder (I) (α_{t′} = λ·0 ist falsch) noch (II) gilt. Der alte Wortlaut ist ohne die Voraussetzung α_t, α_{t′} ≠ 0 falsch. Im Beweis wird sie im Fall „α_{t′} hat Rang 2, α_t Rang 1“ gebraucht (α_t = λ′α_{t′} mit λ′ ≠ 0). In der Kette ist sie erfüllt, weil kein α_t die Nullform ist (K-18 (c)). (2) V_{tt′} ist die gemeinsame Nullstellenmenge aller drei Minoren. Sie liegt in der Nullstellenmenge jedes einzelnen, ist ihr aber im Allgemeinen nicht gleich. Gebraucht wird nur „liegt in“.

### 12.2 S4-27-C: die tatsächlich benutzten Voraussetzungen

**Alt** (`lean/prosa/s4_327_spurA_r5_m21.md`, Abschnitt 1): „**Aussage S4-27-C (lokaler Widerspruch, […]).** Es liege eine Normalform wie in S4-21-B (ii) vor. Dann gibt es keinen Index z ∈ Z mit w(z) ≠ 0 und (c_1(z), c_2(z)) ≠ (0, 0). Genauer: Für jedes z ∈ Z mit (c_1(z), c_2(z)) ≠ (0, 0) folgt aus (B) und (C) allein w(z) = 0.“

**Neu:** K-37. Der Wortlaut zählt alle benutzten Voraussetzungen auf: die Eigenschaften der Normalform (a_0 = 1), (B), (C′) mit κ(j) ∈ K′, w·P_2 ⊆ J, w·P_3 ⊆ K′, K″ als 𝒜-Modul, K^34 = K″ + b_0·K′, (G0) bis (G3) aus Satz G und die Operatoren τ, ν aus K-36 (dort wird (G2) gebraucht). „Aus (B) und (C) allein“ ist gestrichen.

**Grund.** Der Beweis benutzt die Fortsetzungsabbildung K′ → K″|_Y (braucht (G0), (G3), K″ als 𝒜-Modul und dim K″|_Y = 13), die Operatoren τ, ν (brauchen K^34 = K″ + b_0K′ und (G2)), c_i = 0 auf Y (G1), j = w·G ∈ J für G ∈ P_2 und 𝔪(g) = w(z)g(z) für g ∈ P_3 (braucht w·P_3 ⊆ K′).

### 12.3 Restfall ohne Programm, ohne ρ, ohne Lemma 15(b)

**Alt:** B-017: „**Rolle n = 3** (A ist 3×2, B ist 2×7, dim U = 7, dim Q = 34 − 28 = 6): Es bleibt **genau ein Restfall**, **(ρ, rk L, rk H) = (4, 6, 4)**, mit s = 0, dim N = 3, Δ = 2 und dim S = 1.“ Gestützt auf das Programm `erkundung/s3-04-restfaelle-327.py`, auf Lemma 15(b) (B-018) und auf die Übertragung von Lemma I zwischen zwei Rahmen (B-019).

**Neu:** K-19 beweist rk L = 6, rk H = 4, dim N = 3, Δ = 2, dim Ŝ = 1 von Hand, nur aus (G) (K-15), rk L ≤ dim Q, Lemma H (K-16), Lemma I (K-17) und Lemma B (K-13). Das Programm ist nur noch Kontrolle. ρ = 4 steht in K-20, das kein anderes Glied benutzt. Lemma 15(b) steht als K-20 (b) mit Beweis, wird aber nicht gebraucht.

**Grund.** Die Kette braucht ρ und s nicht. B-018 (Lemma 15(b)) und B-019 (Brücke zwischen den Rahmen von `yang_n3.md` und `yang_n4.md`) sind nicht mehr nötig, weil diese Datei nur einen Rahmen hat (Abschnitt 1.2: H(x) = (F_2(x), −F_1(x))).

### 12.4 Untere Schranke 34 hergeleitet statt zitiert

**Alt:** `lean/prosa/s4_327_spurA_r2_bau.md`, Abschnitt 1.1: „die Länge wird dabei nicht größer, und da 34 die untere Schranke ist, bleibt sie 34“, mit Yangs Satz 1 als Quelle.

**Neu:** K-18 leitet R_F(⟨3,2,7⟩) ≥ 34 aus K-15 und K-17 her und folgert daraus, dass kein α_t die Nullform ist. Die Literatur steht bei K-18 nur als Fundstelle.

### 12.5 Ein Begriff der Normalform

**Alt:** In `s4_327_spurA_r2_bau.md`, Abschnitt 1.1, ist die Normalform „nach R1 und R2 …, Lemma A … und der Skalierung“; in `s4_327_spurA_r4_m21.md`, Abschnitt 1, „Normalform zu (S, T)“ mit (S, T) ∈ G*; in `s4_327_spurA_r5_e2.md`, Abschnitt 1, ebenso. B-025 zitiert: „„Normalform“ heißt: nach R1 (algebraisch abgeschlossener Körper), R2, Lemma A aus `yang_n3.md` und der Skalierung α_t(e_{00}) = 1 (Abschnitt 1.1).“

**Neu:** Abschnitt 1.3: Normalform zu (S, T) für jedes (S, T) ∈ 𝒢*, mit 𝒢* über (SN1), (SN2) erklärt. R2 (Streichen) ist nicht Teil der Normalform. Bei Länge 34 gibt es nichts zu streichen (K-18 (c)).

**Grund.** Die Quantoren in K-38, K-40 und K-41 („jede Normalform“, „eine Normalform“) beziehen sich so alle auf dieselbe Menge 𝒢*.

### 12.6 P_d als formale Polynome

**Alt:** `s4_327_spurA_r2_bau.md`, Abschnitt 1.2: „P_d := span{a_1^μ a_2^ν : μ + ν ≤ d} ⊆ K^34 (Polynome vom Grad ≤ d in den a-Koordinaten, ausgewertet an den 34 a-Punkten).“

**Neu:** Abschnitt 1.4: P_d ist der Raum der formalen Polynome, v·P_d ist sein Bild in K^34. Aussagen wie dim w·P_3 = 10 heißen: Die Auswertung P_3 → K^34, f ↦ w·f, ist injektiv.

**Grund.** In K-29 und K-31 wird aus w·(Polynom) = 0 auf eine Gleichung zwischen formalen Polynomen geschlossen. Das ist nur mit der formalen Lesart sauber ausgedrückt. Die Quellen S4-14 und S4-28 rechnen schon so.

### 12.7 Fallunterscheidung über e allein

**Alt:** B-025: „Im Restfall R-327 (B-017) liegt jede Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ in genau einem der drei benannten Fälle 1. „e = 3 mit (INJ5)“, 2. „e = 3 ohne (INJ5)“ (e = 3 und (INJ5) verletzt), 3. „e ≤ 2“.“

**Neu:** K-23 (e): e ∈ {2, 3} in jeder Normalform (E2-A aus `s4_327_spurA_r3_e2.md`, Abschnitt 3, mit Lemma B). Die Kette unterscheidet nur e = 3 und e = 2. (INJ5), (INJ-B), S4-07-D, S4-14-B, E2-D und die Vermutungen V1, V2, S4-21-V, E2-V kommen nicht vor.

### 12.8 Satz R mit gemeinsamem Abschlusslemma

**Alt:** Zwei getrennte Beweise, `s4_327_spurA_r3_e3.md`, Abschnitt 4 (Satz R, Schritte 1 bis 6) und `s4_327_spurA_r5_e2.md`, Abschnitt 4 (Satz R bei e = 2, Schritte 0 bis 4).

**Neu:** Der gemeinsame Teil (Schritte 4 bis 6 bzw. 2 bis 4) steht einmal als K-27 mit der Bedingung (KS). K-29 und K-31 zeigen nur (KS) und dim K″ = 21. Neu in K-27 (d) ist die ausdrückliche Folgerung J³_0 ⊆ (w·P_2)³.

### 12.9 Gestalt bei e = 2 ohne Parametrisierung des Kegelschnitts

**Alt:** `s4_327_spurA_r3_e2.md`, Abschnitt 4.1: „ein irreduzibler ebener Kegelschnitt über einem algebraisch abgeschlossenen Körper ist glatt …“, „**Parametrisierung.** C_0 ≅ P¹ …“, „Die Abbildung P_d → S^{2d}, g ↦ ĝ, ist surjektiv mit Kern g_0·P_{d−2} (Kegelschnitte sind projektiv normal …)“, und in 4.2 „Es ist dim w·P_3 ≤ dim S^6 = 7“.

**Neu:** K-30 (c), (d): dim w·P_3 ≤ 7 und dim w·P_4 ≤ 9 folgen daraus, dass g_0·P_1 bzw. g_0·P_2 im Kern der Auswertung liegen. Glattheit und Parametrisierung werden nicht gebraucht. Der Kern auf P_3 ist dann genau g_0·P_1 (wie in `s4_327_spurA_r5_e2.md`, Abschnitt 4, Schritt 0).

**Neuer Beweisschritt** gegenüber den Quellen: die obere Schranke dim w·P_4 ≤ 15 − 6 in K-30 (d).

### 12.10 Kegelschnitte elementar

**Alt:** `s4_327_spurA_r5_e2.md`, Abschnitt 7, Schritt 1: „Zwei verschiedene irreduzible Kegelschnitte haben höchstens 4 gemeinsame Punkte (Begründung: … Parametrisierung P¹ ≅ C̄ … Nullstellensatz …)“, Schritt 3: „Dann liegt ℓ_z ganz in C̄*, und die lineare Gleichung von ℓ_z teilt G* (Nullstellensatz, ℓ_z ist irreduzibel).“

**Neu:** K-4 (a) bis (c) und K-40, Schritte 2 und 3. Statt „zwei irreduzible Kegelschnitte haben höchstens 4 gemeinsame Punkte“ wird benutzt: Durch fünf Punkte, von denen keine drei kollinear sind, geht höchstens ein Kegelschnitt bis auf einen Faktor (K-4 (c)), und die fünf Punkte sind nicht kollinear, weil g_0 eine irreduzible Homogenisierung hat (K-4 (b)). Dafür braucht man |Π_1| ≥ 5; K-35 (G5) gibt 7. Statt Nullstellensatz und Projektivierung: K-4 (b) direkt auf der affinen Geraden ℒ_z (K-33 (iii)).

**Neue Beweisschritte** gegenüber den Quellen: K-4 vollständig, und dass ℒ_z eine affine Gerade ist (K-33 (iii)).

### 12.11 Lemma O ohne den Hauptsatz der Eliminationstheorie

**Alt:** `s4_327_spurA_r4_m21.md`, Abschnitt 1: „**Aussage S4-21-A (Offenheit von e = 3, […]).** G* ist Zariski-offen und nicht leer. Die Menge {(S, T) ∈ G* : e = 3 in der Normalform zu (S, T)} ist Zariski-offen in GL_3 × GL_2. Ist sie nicht leer, ist sie dicht.“ Der Beweis der Offenheit von G* benutzt, dass die Projektion G × P^{13} → G abgeschlossen ist.

**Neu:** K-34: „Ist 𝒢_3 ≠ ∅, dann ist 𝒢_3 ∩ 𝒢_gen ≠ ∅.“ Der Beweis zeigt 𝒢_3 = 𝒢* ∩ R mit einer offenen Menge R und schneidet R mit der offenen Menge {Λ ≠ 0} ∩ 𝒢_gen ⊆ 𝒢* aus K-11 (K-1 (c)). Ob 𝒢* selbst offen ist, wird nicht gebraucht. Statt „irreduzibel, also dicht“ steht K-1 (c).

**Grund.** Die Kette braucht nur einen Punkt in 𝒢_3 ∩ 𝒢_gen. Der Hauptsatz der Eliminationstheorie (Bilder unter Projektionen mit projektivem Faktor sind abgeschlossen) wird dafür nicht gebraucht.

**Neuer Beweisschritt** gegenüber den Quellen: K-34, Schritte 2 und 3.

### 12.12 Satz G für beide Fälle in einem Glied, Teil (i) gestrichen

**Alt:** `s4_327_spurA_r4_m21.md`, Abschnitt 1, Aussage S4-21-B (ii): „Es gibt eine dichte offene Menge von (S, T), so dass in der Normalform zu (S, T) mit Y := {t : rk α_t = 1}, Z := {t : rk α_t = 2} gilt: e = 3 und (M21); c_1 = c_2 = 0 auf Y; die 8 Indizes in Z liegen auf 8 verschiedenen a-Punkten, jeder davon trägt nur diesen einen Index, w ist dort ≠ 0, und (c_1(z), c_2(z)) ≠ (0, 0); die Fasern über den a-Punkten von Y haben |T_p| = 2·d_p mit Σ_{p ⊆ Y} d_p = 13; K′ ∩ K^Z = 0, K″ = K′ ⊕ K^Z und Θ(J³_0) = K^Z.“ Dazu `s4_327_spurA_r5_e2.md`, Abschnitt 1, Aussage S4-28-B (i) bis (v) für e = 2.

**Neu:** K-35 gilt für jedes (S, T) ∈ 𝒢* ∩ 𝒢_gen, bei e = 3 und e = 2. Die Existenz eines solchen (S, T) mit e = 3 steht getrennt in K-34. S4-21-B (i) (Aussagen über das Ausgangsverfahren: Klassen der Größe 2 oder 4, Unabhängigkeit der C_t, paarweise nicht proportionale Rang-2-Formen) ist gestrichen, weil kein Glied es braucht. Z heißt jetzt Ω. Im Beweis von (G4) wird J³_0 ⊆ (w·P_2)³ (K-27 (d)) benutzt statt „ker L ⊆ (w·P_2)²“ aus `s4_327_spurA_r2_bau.md`, Abschnitt 4.2.

### 12.13 Lemma A′ als eigenes Glied

**Alt:** `s4_327_spurA_r5_e2.md`, Abschnitt 5.2: „Nach dem Beweis von Lemma A in `yang_n3.md` (Schritte 1 bis 5) gibt es ein Polynom P(u, p) ≠ 0 …“, und „Fixiere eine invertierbare Matrix S mit erster Spalte u_*“.

**Neu:** K-11 nennt das Polynom Λ im Wortlaut, einschließlich „aus Λ(s_0, p) ≠ 0 folgt s_0 ≠ 0 und p ≠ 0“. K-39 begründet damit, dass s_* ≠ 0 ist und zu einer invertierbaren Matrix ergänzt werden kann. Diese Begründung fehlte in der Quelle.

### 12.14 Zweite Sätze von S4-27-D und S4-28-C gestrichen

**Alt** (`s4_327_spurA_r5_m21.md`, Abschnitt 1): „Gleichwertig: Die Lücke L-21 aus S4-21 (und damit der Unterfall (M21) aus S4-14) ist geschlossen, ohne Vermutung S4-21-V zu benutzen.“ (`s4_327_spurA_r5_e2.md`, Abschnitt 1): „Gleichwertig: Jedes Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F hat eine Normalform (über dem algebraischen Abschluss von F) mit e = 3; nach S4-21-A ist dann die Menge der (S, T) mit e = 3 sogar dicht und offen.“

**Neu:** K-38 und K-40 haben je nur einen Satz: 𝒢_3 = ∅ bzw. 𝒢_3 ≠ ∅.

**Grund.** Die zweiten Sätze sprechen über Lücken früherer Dateien oder über Dichte. Beides braucht die Kette nicht.

### 12.15 Umbenennungen

| in den Quellen | in dieser Datei | Grund |
|---|---|---|
| G1 bis G4 (Grundtatsachen, `yang_n3.md`) | (T1) bis (T5) (K-7) | Zusammenstoß mit (G1) bis (G4) aus Satz G |
| S (Unterraum von N) | Ŝ | S ist die Basiswechselmatrix |
| Lemma F (Yangs Lemma 10) | K-15 „Lemma 10“ | Lemma F ist K-32 |
| Z (Rang-2-Indizes, S4-21, S4-27) | Ω | Z ist in S4-15 das Komplement des Trägers von w |
| B_p, N_p (S4-27-B) | τ_ξ, ν_ξ | B und N sind anders belegt |
| φ_z (S4-27) | η | φ_i sind Polynome in K-29 |
| e = (e_1, e_2), L (S4-27, Abschnitt 6) | (ε_1, ε_2), ℓ* | e ist die Zahl aus K-23, L die Abbildung aus 1.2 |
| β(g), m(g), n(g) (S4-27) | 𝔱(g), 𝔪(g), 𝔫(g) | β_t sind die Formen des Verfahrens |
| e_p, M_p, d_p, T_p | χ_ξ, M_ξ, d_ξ, T_ξ | p ist die erste Zeile von T |
| u_0 (erste Spalte von S, S4-21) | s_0 | u ist der Vektor aus K-28 |
| P (Polynom aus Lemma A, S4-28) | Λ | P_d sind Polynomräume |

### 12.16 Nicht ausgenutzte Beobachtung (kein Teil der Kette)

Der Beweis von K-37 benutzt e = 3 nicht. Zusammen mit K-35 (gilt bei e = 2 ebenso) ergäbe er unmittelbar, dass keine Normalform in 𝒢* ∩ 𝒢_gen existiert, ohne K-34, K-39 und K-40. Diese Datei ändert die Kette nicht in diese Richtung, weil der Auftrag eine Zusammenführung ist und kein neuer Beweisgang. Die Beobachtung ist hier nur festgehalten.

---

## 13. Offene Stellen

Beim Zusammenführen habe ich **keine Stelle** gefunden, an der ein Beweisschritt fehlt oder ein Wortlaut nicht zu seinem Beweis passt, außer den beiden in 12.1 und 12.2 berichtigten Wortlauten.

Stellen, an denen diese Datei einen anderen Beweisweg geht als die Quellen (kein Lückenschluss, aber ohne Vorprüfung), sind in Abschnitt 12 als „neuer Beweisschritt“ markiert: K-4, K-19, K-30 (c), (d), K-33 (iii), K-34. Dazu kommen kleinere Ergänzungen: K-11 (Zusatz s_0 ≠ 0), K-18 (Herleitung statt Zitat), K-27 (d).

---

## 14. Herkunft

Die Glieder stammen aus folgenden Dateien des Repos (nur zur Nachverfolgung; das Verständnis braucht sie nicht):

| Glieder | Quelle |
|---|---|
| 1.1, 1.2, K-7 bis K-17, K-20 | `lean/prosa/yang_n3.md` (R1, R2, R3, G1 bis G4, Lemma A, B, C, D, E, Lemma 10, H, I), `lean/prosa/yang_n4.md` (Lemma 15 (b), nur K-20) |
| K-18 | eigene Herleitung aus K-15, K-17; Literatur: arXiv:2609.14393v3, Satz 1; arXiv:2609.22054v1, Satz 1 |
| K-19 | `erkundung/s3-04-restfaelle-327.md`, Abschnitt 5.1, und `erkundung/s3-03-restfaelle-327.md`; Programm `erkundung/s3-04-restfaelle-327.py` (B-017) |
| 1.3, 1.4, K-21 bis K-26 | `lean/prosa/s4_327_spurA_r2_bau.md`, Abschnitte 1 bis 3 (S4-07-A, -B) |
| K-27 bis K-29 | `lean/prosa/s4_327_spurA_r3_e3.md`, Abschnitt 4 (Satz R, S4-14-A); `lean/prosa/s4_327_spurA_r2_bau.md`, Abschnitt 4.1 |
| K-23 (e), K-30 | `lean/prosa/s4_327_spurA_r3_e2.md`, Abschnitte 3 und 4.1, 4.2 (E2-A, E2-B) |
| K-31 | `lean/prosa/s4_327_spurA_r5_e2.md`, Abschnitt 4 (S4-28-A) |
| K-32 bis K-35 | `lean/prosa/s4_327_spurA_r4_m21.md`, Abschnitte 3 bis 5 (Lemma O, Lemma F, Satz G); `lean/prosa/s4_327_spurA_r5_e2.md`, Abschnitte 5, 6 (S4-28-B) |
| K-36 bis K-38 | `lean/prosa/s4_327_spurA_r5_m21.md`, Abschnitte 3, 5 bis 7 (S4-27-B, -C, -D) |
| K-11, K-39, K-40 | `lean/prosa/s4_327_spurA_r5_e2.md`, Abschnitte 5.2, 7 (S4-28-C) |
| K-1 bis K-6 | Standardaussagen, hier mit eigenem Beweis; K-6 nach `s4_327_spurA_r3_e3.md`, Abschnitt 5 (C (i)) |
