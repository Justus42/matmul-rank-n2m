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
