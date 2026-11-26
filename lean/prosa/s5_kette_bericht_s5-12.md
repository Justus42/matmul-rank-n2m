# Prüfbericht S5-12: Glieder K-32 bis K-35 der Kette zu ⟨3,2,7⟩

Rolle: Prüfer. Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit `d6469d8`, Glieder K-32, K-33, K-34, K-35 (Zeilen 550 bis 625). Zeilenangaben beziehen sich auf diesen Stand. Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Eingeblendet aus dem Projektgedächtnis.** Zu Beginn der Sitzung war mir der Index des Projektgedächtnisses eingeblendet. Er nennt das Repo, das Ziel des Projekts (exakter Tensorrang von ⟨n,2,m⟩, darunter 3×2×7), Regeln zur Rolle des Orchestrators, zu Stufe 4 und zu ihrem Budget, zum Fremdmodell und zur Gemini-Bridge, zu Prüfaufträgen (genaue Dateipfade, nur Abschnitt 5 des Protokolls), zur Bezeichnung „blind“ und „unabhängiger Sucher (nicht blind)“, zu Literaturwachen und erreichbaren Servern, sowie Verweise auf zwei Einträge (Datenformat der Verfahren, Actions-Workflow für lean/). Während der Arbeit wurden mir zwei weitere Einträge eingeblendet: „gemini-bridge“ (Bridge nicht für dieses Repo freigegeben, Zeitlimit) und „aussagen-abgleich-n3“ (Hinweise zur Bridge und zum lokalen Lean-Bau). Keiner dieser Texte enthält ein Urteil, einen Befund oder einen Stand zu K-32 bis K-35 oder zu einer anderen Behauptung. Der Index sagt ausdrücklich, dass dort nichts über Behauptungen, Beweise oder Status steht.

**Was ich über die Positivliste hinaus gesehen habe.**

- Der Auftrag selbst nennt die Existenz weiterer Prüfberichte zu derselben Datei (Dateimuster `s5_kette_bericht_*`) und dass andere Prüfer parallel arbeiten. Ich habe keine solche Datei geöffnet und kenne kein Urteil.
- Die Projektübersicht der Plattform nennt die Dateinamen `A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md` im gemeinsamen Projektordner. Nicht geöffnet.
- `git status` zeigte nach dem Klonen „HEAD detached from refs/heads/main“. Keine Historie, kein Log, keine Zweigliste gelesen.
- Um die Glieder K-1 bis K-31 nach Zeilen zu finden, habe ich aus den Zeilen 109 bis 549 nur die Überschriftenzeilen (`### K-…`) mit Zeilennummer ausgeben lassen. Dabei habe ich die Titel aller Glieder K-1 bis K-31 gesehen, auch die der Glieder, die mein Block nicht voraussetzt (K-3, K-4, K-5, K-7, K-8, K-9, K-13 bis K-17, K-20, K-22, K-26). Die Titel enthalten keine Urteile. Danach habe ich von K-1, K-2, K-6, K-10, K-11, K-12, K-18, K-19, K-21, K-23, K-24, K-25, K-27, K-28, K-29, K-30, K-31 jeweils nur Wortlaut und Voraussetzungen gelesen, bis vor die Zeile „**Beweis.**“.
- Für das gezielte Lesen nach Zeilen habe ich den Stand `d6469d8` der Datei als Kopie in meinen Arbeitsordner geschrieben. Gelesen habe ich daraus nur die erlaubten Zeilen (12 bis 108, 550 bis 627, 753 bis 806 und die genannten Aussagen).
- Vom Protokoll habe ich nur Abschnitt 5 ausgegeben.

Ich habe kein Prüfurteil zu diesen Gliedern gesehen und wusste nicht, welches Ergebnis erwünscht ist.

## 1. Ergebnis im Überblick

| Glied | Urteil | Echte Lücken | Kleine Ungenauigkeiten |
|---|---|---|---|
| K-32 | bestätigt | keine | „genau eine“ wird im Beweis nicht eigens begründet (eine Zeile mit K-1 (a)) |
| K-33 | bestätigt | keine | Einleitung „Für einen Spaltenvektor a(t) := …“ ist eine Formel, keine Definition; in (v) ist α_t, α_{t′} ≠ 0 (für K-32) nur stillschweigend aus (SN1) |
| K-34 | bestätigt | keine | „0, ±1“ als Einträge von M_{S,T} stimmt nicht wörtlich (es sind 0, ±q_k(t), a_i(t)q_k(t)); die Menge X in K-1 (c) wird nicht genannt |
| K-35 | bestätigt | keine | Schritt 4 benutzt K-25 (c), die Voraussetzungszeile nennt nur K-25 (d) |

Rechnerische Gegenproben (Anhang A bis C, exakte Arithmetik) fanden kein Gegenbeispiel.

## 2. Gemeinsamer Rahmen (Zeile 552)

Zeile 552 legt fest: V ist ein Verfahren der Länge 34 für ⟨3,2,7⟩ über F, aufgefasst über K = F̄. Nach K-18 (c) ist kein α_t die Nullform und 𝒢* ≠ ∅. K ist als algebraischer Abschluss unendlich. Jede von 0 verschiedene 3×2-Matrix hat Rang 1 oder 2. Das alles folgt aus dem Wortlaut von K-18 (c) und ist richtig.

## 3. K-32 (Lemma F, berichtigt), Zeilen 554 bis 569

### 3.1 Aussage und Voraussetzungen

Aussage: Für α, α′ ∈ K^{3×2}, beide ≠ 0, gilt genau eine von (1) „V(α, α′) = K^{1×2} und (I) oder (II)“ und (2) „ein Minor m ist nicht das Nullpolynom, homogen vom Grad 2, und V(α, α′) liegt in Z(m)“. Zusatz: (I) oder (II) ⇒ V = K^{1×2}. Voraussetzungen: K unendlich, K-1 (a), (b).

### 3.2 Nachrechnung

1. *Zeile 563, V als Nullstellenmenge.* Die Spalten αpᵀ, α′pᵀ ∈ K³ sind genau dann linear abhängig, wenn die 3×2-Matrix (αpᵀ | α′pᵀ) Rang ≤ 1 hat, also wenn alle drei 2×2-Minoren verschwinden. Jeder Eintrag von αpᵀ ist (αpᵀ)_i = α_{i0}p_1 + α_{i1}p_2, linear und homogen in p. Ein Minor ist eine Differenz zweier Produkte von je zwei solchen Einträgen, also homogen vom Grad 2 oder das Nullpolynom. Richtig.
2. *Zeile 563, Fallunterscheidung.* Ist ein m_i nicht das Nullpolynom, dann liegt V ⊆ Z(m_i), weil V der gemeinsame Nullstellenort ist. Das ist (2). Sind alle m_i das Nullpolynom, dann verschwinden sie überall, und V = K^{1×2}. Richtig.
3. *Ausschließlichkeit („genau eine“).* Der Beweis begründet sie nicht eigens. Sie folgt so: Gilt (2), dann gibt es nach K-1 (a) (K unendlich) ein p mit m(p) ≠ 0, also p ∉ V, also V ≠ K^{1×2}, und (1) gilt nicht. Das benutzt nur die genannte Voraussetzung K-1 (a). Ich werte das als kleine Auslassung, nicht als Lücke. Für die späteren Glieder (K-34) wird ohnehin nur die Richtung „weder (I) noch (II) ⇒ ein Minor ist nicht das Nullpolynom“ gebraucht, und die folgt direkt aus der Fallunterscheidung in Schritt 2 zusammen mit Schritt 4 bis 6.
4. *Zeile 564 bis 566, α hat Rang 2.* Rang 2 heißt: die beiden Spalten von α sind linear unabhängig, also ist p ↦ αpᵀ injektiv, also αpᵀ ≠ 0 für p ≠ 0. Weil alle Minoren als Polynome verschwinden, sind αpᵀ und α′pᵀ für jedes p abhängig. Mit αpᵀ ≠ 0 gibt es genau ein λ(p) mit α′pᵀ = λ(p)αpᵀ (für p ≠ 0). Für p_1 = (1,0), p_2 = (0,1) sind p_1, p_2, p_1 + p_2 alle ≠ 0. Linearität von p ↦ α′pᵀ gibt λ(p_1)αp_1ᵀ + λ(p_2)αp_2ᵀ = λ(p_1+p_2)(αp_1ᵀ + αp_2ᵀ). Weil αp_1ᵀ, αp_2ᵀ unabhängig sind, folgt durch Koeffizientenvergleich λ(p_1) = λ(p_1+p_2) = λ(p_2) =: λ. Dann stimmen α′ und λα auf beiden Basisvektoren überein, also Spalte für Spalte, also α′ = λα. Aus α′ ≠ 0 folgt λ ≠ 0. Das ist (I). Richtig.
5. *Zeile 567, α′ hat Rang 2.* Die Lage ist symmetrisch in α, α′ (die Abhängigkeit zweier Vektoren ist symmetrisch). Also α = λ′α′, λ′ ≠ 0 wegen α ≠ 0, und α′ = (λ′)^{-1}α. Richtig.
6. *Zeile 568, beide Rang 1.* Rang 1 heißt α = xyᵀ mit x ∈ K³∖{0}, y ∈ K²∖{0}. Dann αpᵀ = x·(yᵀpᵀ) = (y·p)x. Ebenso α′pᵀ = (y′·p)x′. Die Linearformen y·p, y′·p sind nicht das Nullpolynom (y, y′ ≠ 0), ihr Produkt nach K-1 (b) auch nicht, also gibt es nach K-1 (a) ein p mit (y·p)(y′·p) ≠ 0. Für dieses p sind (y·p)x und (y′·p)x′ zwei von 0 verschiedene abhängige Vektoren, also Kx = Kx′. Der Spaltenraum von α ist Kx (Rang 1, die Spalten sind y_1x, y_2x), der von α′ ist Kx′. Also (II). Richtig.
7. *Vollständigkeit der Fälle.* α, α′ ≠ 0 haben je Rang 1 oder 2. Die drei Fälle „α Rang 2“, „α′ Rang 2“, „beide Rang 1“ decken alles ab. Richtig.
8. *Zeile 569, Umkehrung.* Bei (I) ist α′pᵀ = λαpᵀ, also abhängig. Bei (II) ist α = xyᵀ, α′ = x″y′ᵀ mit x″ ∈ Kx, also liegen beide Vektoren in Kx und sind abhängig. Also V = K^{1×2}. Richtig.

### 3.3 Randfälle

- (I) und (II) können zugleich gelten (zwei proportionale Rang-1-Matrizen). Das stört nicht, weil „genau eine“ sich auf (1) und (2) bezieht.
- α Rang 2, α′ = αM mit M ∈ GL_2 nicht skalar: gleiches Bild, aber nicht proportional. Dann gilt weder (I) noch (II), und die Aussage verlangt (2). Nachgerechnet: Ein Minor ist dann nicht das Nullpolynom (V besteht aus den p, für die pᵀ Eigenvektor von M ist). Teil des Programms in Anhang A (Fall `kind == 1`).
- α Rang 2, α′ Rang 1 mit Spalte im Bild von α: weder (I) noch (II), und tatsächlich (2). Anhang A (Fall `kind == 4`).
- Charakteristik 2 und 3: Die Aussage „alle Minoren sind das Nullpolynom ⇔ (I) oder (II)“ ist eine Aussage über Polynome und gilt nach der Rechnung oben über jedem Körper. Erschöpfend über GF(2) und GF(3) nachgerechnet (Anhang A). Nebenbei: Weil ein von 0 verschiedenes binäres quadratisches Formpolynom höchstens 2 projektive Nullstellen hat und P¹(K) mindestens 3 Punkte hat, ist auch die Ausschließlichkeit über jedem Körper richtig. Die Voraussetzung „K unendlich“ ist also stärker als nötig, aber zutreffend.

### 3.4 Urteil K-32

**Bestätigt.** Kleine Ungenauigkeit: Die Ausschließlichkeit („genau eine“) wird im Beweis nicht ausgeschrieben; sie folgt in einer Zeile aus K-1 (a), die in der Voraussetzungszeile steht.

## 4. K-33 (a-Punkte unter Basiswechsel), Zeilen 571 bis 589

### 4.1 Aussage und Voraussetzungen

Für (S, T) ∈ 𝒢* gelten die Formeln für a(t), b(t) mit Nenner s_0ᵀα_tpᵀ ≠ 0 und die Aussagen (i) bis (v). Voraussetzungen: K-10, K-12, (SN1) für V^{(S,T)}, für (v) die Bezeichnung V(α, α′) aus K-32.

### 4.2 Nachrechnung

1. *Zeile 584, Formeln.* Nach K-10 (Wortlaut) ist α′_t(e_{i0}) = s_iᵀα_tpᵀ und α′_t(e_{i1}) = s_iᵀα_tp′ᵀ. Also ist der Vektor (α′_t(e_{i0}))_{i=0,1,2} = Sᵀα_tpᵀ (die i-te Zeile von Sᵀ ist s_iᵀ), ebenso (α′_t(e_{i1}))_i = Sᵀα_tp′ᵀ. (SN1) für V^{(S,T)} sagt α′_t(e_{00}) = s_0ᵀα_tpᵀ ≠ 0. Die Skalierung in 1.3 teilt α′_t durch α′_t(e_{00}); nach 1.4 ist a(t) = (α̂_t(e_{i0}))_i und b(t) = (α̂_t(e_{i1}))_i. Das gibt die beiden Formeln. Die erste Koordinate von a(t) ist 1. Richtig. Zusätzlich habe ich α′_t direkt aus der Definition α′_t(A) = α_t(SAT) berechnet (nicht über die Formel aus K-10) und die Formeln bestätigt (Anhang B, Teil „formula“).
   Wortlaut: „Für einen Spaltenvektor a(t) := (1, a_1(t), a_2(t))ᵀ … gilt“ liest sich wie eine neue Definition. Gemeint ist der Vektor aus 1.4. Kleine sprachliche Ungenauigkeit.
2. *Zeile 585, (i).* Nach 1.4 hat die Koeffizientenmatrix von α̂_t die Spalten a(t) und b(t), und nach K-12 hat sie denselben Rang wie α_t. Es ist b(t) − b_0(t)a(t) = (b_0 − b_0·1, b_1 − b_0a_1, b_2 − b_0a_2)ᵀ = (0, c_1(t), c_2(t))ᵀ nach der Definition c_i = b_i − a_i·b_0. Ist c(t) = 0, dann ist b(t) = b_0(t)a(t), Rang ≤ 1, und wegen a(t) ≠ 0 (erste Koordinate 1) genau 1. Hat die Matrix Rang 1, dann ist b(t) ein Vielfaches μa(t) von a(t) ≠ 0; die erste Koordinate gibt μ = b_0(t), also c(t) = 0. Rang 0 ist wegen a(t) ≠ 0 ausgeschlossen. Richtig.
3. *Zeile 586, (ii).* α_t = xyᵀ ⇒ α_tpᵀ = (y·p)x. Dann a(t) = (y·p)Sᵀx / ((y·p)s_0ᵀx). Aus s_0ᵀα_tpᵀ = (y·p)(s_0ᵀx) ≠ 0 folgt y·p ≠ 0 und s_0ᵀx ≠ 0, also darf man kürzen: a(t) = Sᵀx/(s_0ᵀx). Das hängt von S und x ab; x ist bis auf einen Faktor bestimmt, und die Formel ist in x homogen vom Grad 0. Also hängt der a-Punkt nur von S ab (für jedes T mit (S, T) ∈ 𝒢*). Richtig. Nachgerechnet mit zwei verschiedenen T (Anhang B, Teil „ii“).
4. *Zeile 587, (iii), erster Teil.* Rang 2 und S invertierbar ⇒ E := Sᵀα_tK² hat Dimension 2, ist also Kern einer Linearform n ≠ 0 auf K³. ℒ_t = {ξ : (1, ξ) ∈ E} = {ξ : n_0 + n_1ξ_1 + n_2ξ_2 = 0}. a(t) = Sᵀα_tpᵀ/(…) liegt in E und hat erste Koordinate 1, also ξ(t) ∈ ℒ_t, also ℒ_t ≠ ∅. Wäre (n_1, n_2) = 0, dann wäre n_0 ≠ 0 (n ≠ 0) und ℒ_t leer. Also hat λ_t = n_0 + n_1a_1 + n_2a_2 Grad genau 1, und ℒ_t ist eine affine Gerade. Richtig. Nachgerechnet mit n = Kreuzprodukt der Bildspalten (Anhang B, „iii_line“).
5. *Zeile 587, (iii), zweiter Teil.* Gleicher a-Punkt bei (S, T) und (S, T̃) ⇔ Sᵀα_tpᵀ/(erste Koordinate) = Sᵀα_tp̃ᵀ/(erste Koordinate) ⇔ die beiden Vektoren (beide ≠ 0, erste Koordinate ≠ 0) sind proportional. Weil p ↦ Sᵀα_tpᵀ linear und injektiv ist (Rang 2, S invertierbar), ist das gleichwertig zu p̃ ∈ K·p: aus Sᵀα_tp̃ᵀ = c·Sᵀα_tpᵀ folgt p̃ = cp; umgekehrt gibt p̃ = cp (c ≠ 0, weil p̃ als Zeile einer invertierbaren Matrix ≠ 0 ist) proportionale Vektoren. Richtig. Nachgerechnet mit proportionalen und nicht proportionalen ersten Zeilen (Anhang B, „iii_T“). Randfall Rang 1 ist ausgenommen, und dort gilt wegen (ii) Gleichheit für jedes T̃; der Wortlaut beschränkt (iii) richtig auf Rang 2.
6. *Zeile 588, (iv).* α_{t′} = λα_t mit λ ≠ 0: Zähler und Nenner beider Formeln bekommen den Faktor λ. Also a(t′) = a(t), b(t′) = b(t), und b_0, c_1, c_2 sind Funktionen von a und b. Richtig.
7. *Zeile 589, (v).* ξ(t) = ξ(t′) ⇔ a(t) = a(t′) (erste Koordinate jeweils 1). Gleichheit ⇒ Sᵀα_tpᵀ und Sᵀα_{t′}pᵀ proportional ⇒ abhängig. Umgekehrt: zwei abhängige Vektoren, beide mit erster Koordinate ≠ 0, sind proportional mit Faktor ≠ 0, und nach Teilen durch die erste Koordinate gleich. Sᵀ invertierbar ⇒ Abhängigkeit von Sᵀu, Sᵀu′ ⇔ Abhängigkeit von u, u′. Also ⇔ α_tpᵀ, α_{t′}pᵀ abhängig ⇔ p ∈ V(α_t, α_{t′}). Richtig. Die Bezeichnung V(α, α′) aus K-32 setzt α, α′ ≠ 0 voraus; das gilt hier, weil (SN1) s_0ᵀα_tpᵀ ≠ 0 für alle t gibt. Der Beweis sagt das nicht; kleine Ungenauigkeit. Nachgerechnet, auch mit absichtlich gebauten Partnern mit gleichem a-Punkt (α_{t′}pᵀ ∥ α_tpᵀ, aber α_{t′} nicht proportional zu α_t) und mit α_{t′} = α_tM (Anhang B, „v“).

### 4.3 Voraussetzungen

Benutzt: K-10 (Formeln und Koeffizientenmatrix), K-12 (Rang von α̂_t), (SN1), Definitionen aus 1.3 und 1.4, Bezeichnung aus K-32. Alle genannt. Nichts Undefiniertes.

### 4.4 Urteil K-33

**Bestätigt.** Kleine Ungenauigkeiten: die Einleitung „Für einen Spaltenvektor a(t) := …“ (Formel, keine Definition); α_t, α_{t′} ≠ 0 in (v) nur stillschweigend aus (SN1).

## 5. K-34 (Lemma O), Zeilen 591 bis 603

### 5.1 Aussage und Voraussetzungen

Bezeichnungen (Zeile 593): Für jedes Paar t < t′, das weder (I) noch (II) erfüllt, ist m_{tt′} ein Minor wie in K-32 (2). 𝒢_gen = {(S, T) ∈ 𝒢 : m_{tt′}(p) ≠ 0 für alle diese Paare}. 𝒢_3 = {(S, T) ∈ 𝒢* : e = 3 in der Normalform}. Aussage: 𝒢_3 ≠ ∅ ⇒ 𝒢_3 ∩ 𝒢_gen ≠ ∅. Voraussetzungen: K-1, K-10, K-11, K-12, K-18 (c), K-19, K-21, K-23, K-32, K-33.

### 5.2 Nachrechnung

0. *Zeile 593, m_{tt′} ist wohldefiniert.* Nach K-18 (c) sind α_t, α_{t′} ≠ 0, also ist K-32 anwendbar. Erfüllt das Paar weder (I) noch (II), dann gilt (1) nicht, also nach K-32 (2): Es gibt einen Minor, der nicht das Nullpolynom ist. (Diese Richtung folgt schon aus dem Beweis von K-32 ohne die Ausschließlichkeit.) Richtig.
1. *Zeile 599, Q_T hat Rang 7.* K-21 (a): q_1, …, q_7 sind linear unabhängig. Richtig.
2. *Zeile 599, Kern von Ξ.* Ξ(y, y′, y″) = 0 heißt a_1·Q_Ty = Q_Ty′ und a_2·Q_Ty = Q_Ty″. Also j := Q_Ty ∈ J mit a_1j, a_2j ∈ J (J = Bild von Q_T, K-21 (a)). Nach K-21 (c) ist diese Menge f_0(N). Umgekehrt: Zu j ∈ f_0(N) gibt es eindeutige y, y′, y″ mit Q_Ty = j, Q_Ty′ = a_1j, Q_Ty″ = a_2j (Q_T injektiv). Also ist (y, y′, y″) ↦ Q_Ty eine Bijektion ker Ξ → f_0(N), linear, und dim ker Ξ = dim f_0(N) = 3 (K-21 (c)). Richtig.
3. *Zeile 599, Ξ³ und Γ.* ker Ξ³ = (ker Ξ)³, Dimension 9. Γ bildet ((y_0,·,·), (y_1,·,·), (y_2,·,·)) auf Q_Ty_0 + a_1Q_Ty_1 + a_2Q_Ty_2 ab. Auf ker Ξ³ durchlaufen Q_Ty_0, Q_Ty_1, Q_Ty_2 unabhängig voneinander ganz f_0(N). Also Γ(ker Ξ³) = f_0(N) + a_1f_0(N) + a_2f_0(N). Mit K-23 (b), f_0(N) = w·P_1, und weil a_i·(g·w) = (a_ig)·w, ist das w·(P_1 + a_1P_1 + a_2P_1) = w·P_2. Richtig. (Gleichwertig K-23 (d) mit f_i = a_if_0 aus K-12.)
4. *Zeile 599 bis 600, Rangformel.* M_{S,T} ist die Matrix von (Ξ³, Γ): K^63 → K^{204} × K^{34} (204 = 3·2·34). Ihr Kern ist ker Ξ³ ∩ ker Γ, also dim = 63 − rk M. Γ eingeschränkt auf ker Ξ³ hat Kern ker Ξ³ ∩ ker Γ, also dim Γ(ker Ξ³) = 9 − (63 − rk M) = rk M − 54. Mit e + 3 = dim w·P_2 (Definition K-23 (e)) folgt e + 3 = rk M − 54. Richtig. Rechnerisch geprüft (Anhang C): In Testfällen mit dim F = 3 (F := {j ∈ J : a_1j, a_2j ∈ J}) und dim(F + a_1F + a_2F) = 6 ergab sich rk M = 60, mit dim(F + a_1F + a_2F) = 5 (Punkte auf einem Kegelschnitt) rk M = 59, und die allgemeine Identität dim(F + a_1F + a_2F) = rk M − 63 + 3·dim F hielt in allen Fällen, auch bei dim F = 0.
5. *Zeile 601, e = 3 ⇔ rk M ≥ 60.* K-23 (e) gibt e ≤ 3, also rk M ≤ 60. Also e = 3 ⇔ rk M = 60 ⇔ rk M ≥ 60 ⇔ ein 60×60-Minor ≠ 0 (M hat 238 Zeilen und 63 Spalten, solche Minoren existieren). Richtig. Hinweis: Außerhalb von Normalformen kann rk M größer sein (in Anhang C rk M = 63 bei dim F = 0); das betrifft die Aussage nicht, weil Schritt 1 nur auf 𝒢* angewandt wird.
6. *Zeile 602, Einträge.* Die Zeilen von Ξ haben die Einträge a_i(t)q_k(t) und −q_k(t), die Zeilen von Γ die Einträge q_k(t) und a_i(t)q_k(t), sonst 0. Der Text sagt „0, ±1 und Produkte … sowie die q_k(t) selbst“. Einträge ±1 kommen nicht vor, wohl aber −q_k(t). Das ändert nichts an der Form (Polynom)/D. Kleine Ungenauigkeit.
   a_i(t) = s_iᵀα_tpᵀ/s_0ᵀα_tpᵀ (K-33). q_k(t) = β̂_t(e_{1k}) = β′_t(e_{1k}) = β_t(T^{-1}e_{1k}) (1.3, Skalierung lässt β fest), und T^{-1} = adj(T)/det T, β_t linear, also q_k(t) = β_t(adj(T)e_{1k})/det T mit polynomialem Zähler (linear in den Einträgen von T). Die Nenner s_0ᵀα_tpᵀ·det T und det T teilen D = det T·Π_t s_0ᵀα_tpᵀ. Also ist jeder Eintrag = (festes Polynom)/D, und jeder 60×60-Minor ist eine Summe von Produkten von 60 Einträgen, also μ̃/D^{60} mit einem festen Polynom μ̃. Richtig.
7. *Zeile 602, R und 𝒢_3 = 𝒢* ∩ R.* R = 𝒢 ∖ Z({Dμ̃}) ist nach der Definition in 1.3 Zariski-offen in 𝒢. Auf 𝒢* ist D ≠ 0 ((SN1): s_0ᵀα_tpᵀ = α′_t(e_{00}) ≠ 0; det T ≠ 0). Dort ist also μ ≠ 0 ⇔ μ̃ ≠ 0 ⇔ Dμ̃ ≠ 0. Mit Schritt 5: (S, T) ∈ 𝒢* hat e = 3 ⇔ ein μ ≠ 0 ⇔ (S, T) ∈ R. Also 𝒢_3 = 𝒢* ∩ R. Richtig.
8. *Zeile 603, R′.* Λ aus K-11 ist anwendbar: K unendlich, kein α_t die Nullform (K-18 (c)), r = 34 ≥ 1. Λ ≠ 0, jedes m_{tt′} ≠ 0 als Polynom in p; als Polynome in den 13 Einträgen von (S, T) bleiben sie ≠ 0. Nach K-1 (b) ist h ≠ 0 und auch h·det S·det T ≠ 0; nach K-1 (a) gibt es eine Stelle, an der dieses Produkt ≠ 0 ist, und diese liegt in 𝒢 ∩ {h ≠ 0} = R′. Also R′ ≠ ∅, offen. (Gibt es kein Paar, ist das leere Produkt 1.) Richtig.
9. *Zeile 603, Durchschnitt.* K-1 (c) mit X = 𝒢 = {det S·det T ≠ 0} ⊆ K^{13} (nicht leer, Form {h_X ≠ 0} mit h_X ≠ 0), U_1 = R, U_2 = R′. R und R′ sind offen in 𝒢 und, weil 𝒢 selbst offen in K^{13} ist, auch offen in K^{13}. Also R ∩ R′ ≠ ∅. Der Text nennt X nicht ausdrücklich; die Wahl ist aber eindeutig. Kleine Ungenauigkeit.
10. *Zeile 603, Schluss.* Für (S, T) ∈ R ∩ R′ ist Λ(s_0, p) ≠ 0, s_0 erste Spalte von S, p erste Zeile von T, S, T invertierbar, also V^{(S,T)} erfüllt (SN1), (SN2) (K-11), also (S, T) ∈ 𝒢*, also ∈ 𝒢* ∩ R = 𝒢_3. Und m_{tt′}(p) ≠ 0 für alle Paare, also ∈ 𝒢_gen. Richtig.

### 5.3 Dichte-Argument

Die Aussage ist eine reine Existenzaussage. Benutzt werden genau zwei nichtleere offene Mengen in der offenen Menge 𝒢 = {det S·det T ≠ 0}; R ist nichtleer, weil 𝒢_3 ⊆ R nach Annahme nichtleer ist; R′ ist nichtleer nach K-1 (a), (b). Der Durchschnitt zweier solcher Mengen ist nach K-1 (c) nichtleer. Sauber begründet.

### 5.4 Voraussetzungen

Benutzt: K-1 (a), (b), (c), K-10 (über K-33 und die Formel für β′), K-11, K-12 (f_i = a_if_0, über K-23), K-18 (c), K-21 (a), (c), K-23 (b), (e), K-32, K-33, Definitionen aus 1.3. K-19 wird nicht unmittelbar benutzt, ist aber über K-21 und K-23 Grundlage. Alle genannt.

### 5.5 Urteil K-34

**Bestätigt.** Kleine Ungenauigkeiten: „0, ±1“ bei den Einträgen von M_{S,T}; X in K-1 (c) nicht genannt.

## 6. K-35 (Satz G in allgemeiner Normalform), Zeilen 605 bis 624

### 6.1 Aussage und Voraussetzungen

Für (S, T) ∈ 𝒢* ∩ 𝒢_gen gelten (G0) bis (G5) und (GM). Voraussetzungen: K-2, K-6, K-12, K-23, K-24, K-25 (d), K-27, K-28, K-29, K-30, K-31, K-32, K-33.

### 6.2 Nachrechnung

1. *Zeile 607, Y und Ω.* Die Definition über α_t stimmt mit der in 1.4 (über α̂_t) überein, weil α̂_t nach K-12 denselben Rang hat. Richtig.
2. *Zeile 618, Schritt 0 (GM).* K-23 (e): e ∈ {2, 3}. Bei e = 3: K-28 (b) dim K″ = 21, K-28 (a) dim w·P_3 = 10, K-29 gibt K″ = K′ ⊕ Θ(J³_0), 𝒜-Modul, J³_0 ⊆ (w·P_2)³. Bei e = 2: K-30 (d) dim K″ = 21, K-30 (c) dim w·P_3 = 7, K-31 gibt dasselbe. K-24: K^34 = K″ + b_0·K′. K-25 (d): dim Θ(J³_0) = 8. Das ist (GM) und dim w·P_3 ≥ 7. Richtig.
3. *Zeile 619, Schritt 1 (G0).* Seien t ≠ t′ in derselben Faser, o. B. d. A. t < t′ (V(α, α′) ist symmetrisch, (I) und (II) sind symmetrisch bis auf λ ↦ λ^{-1}). K-33 (v): p ∈ V(α_t, α_{t′}). Erfüllte das Paar weder (I) noch (II), dann wäre m_{tt′}(p) ≠ 0 (𝒢_gen, mit derselben ersten Zeile p von T), aber V ⊆ Z(m_{tt′}) (K-32 (2)), Widerspruch. Also (I) oder (II). (I) erhält den Rang, (II) verlangt Rang 1 bei beiden. Also kein Paar einer Faser hat einen Index in Y und einen in Ω, und jede Faser liegt ganz in Y oder ganz in Ω. In einer Faser in Ω erfüllt jedes Paar (I), nach K-33 (iv) sind a, b, also b_0, c_1, c_2 konstant. Richtig.
4. *Zeile 620, Schritt 2 (G1).* K-33 (i) wörtlich. Richtig.
5. *Zeile 621, Schritt 3 (Zählung).* K″ ist 𝒜-Modul (GM). K-6 (ii): K″ = ⊕_ξ M_ξ, M_ξ = χ_ξK″ = K″ ∩ K^{T_ξ}, also Σ d_ξ = dim K″ = 21. Multiplikation mit χ_ξ ist linear, K-6 (i): χ_ξ·K^34 = K^{T_ξ}; χ_ξ·(b_0·k) = b_0·(χ_ξ·k) (komponentenweise Produkte vertauschen); χ_ξK′ ⊆ χ_ξK″ = M_ξ, weil K′ ⊆ K″ nach der Definition von K″. Also K^{T_ξ} = M_ξ + b_0·χ_ξK′ ⊆ M_ξ + b_0·M_ξ, und dim ≤ 2d_ξ: |T_ξ| ≤ 2d_ξ. Für T_ξ ⊆ Ω ist b_0 auf T_ξ eine Konstante β (G0), und M_ξ ⊆ K^{T_ξ}, also b_0·M_ξ = β·M_ξ ⊆ M_ξ, also |T_ξ| ≤ d_ξ ≤ |T_ξ| (d_ξ ≤ |T_ξ| wegen M_ξ ⊆ K^{T_ξ}). Summe: Die Fasern zerlegen {1, …, 34}, also Σ_ξ(|T_ξ| − d_ξ) = 34 − 21 = 13. Fasern in Ω tragen 0 bei, Fasern in Y je |T_ξ| − d_ξ ≤ |T_ξ|/2; nach (G0) gibt es keine anderen Fasern. Also 13 ≤ |Y|/2, |Y| ≥ 26, |Ω| ≤ 8. Richtig.
6. *Zeile 622, Schritt 4.* K-25 (c): Θ(j) = c_1j_1 + c_2j_2. c_1, c_2 = 0 auf Y (G1), also Θ(j) ∈ K^Ω. Θ(J³_0) ⊆ K″ nach (GM). K-6 (iii) mit X = Ω (nach (G0) Vereinigung von Fasern): K″ ∩ K^Ω = ⊕_{T_ξ ⊆ Ω} M_ξ = ⊕ K^{T_ξ} = K^Ω (Schritt 3: M_ξ = K^{T_ξ}). Also 8 = dim Θ(J³_0) ≤ dim K^Ω = |Ω| ≤ 8. Damit |Ω| = 8, |Y| = 26, Θ(J³_0) = K^Ω (8-dimensionaler Unterraum eines 8-dimensionalen Raums). In Schritt 3 ist dann 13 = Σ_Y(|T_ξ| − d_ξ) ≤ Σ_Y |T_ξ|/2 = 13, also Gleichheit in jedem Summanden: |T_ξ| = 2d_ξ für jede Faser in Y, und Σ_Y d_ξ = 26/2 = 13. Mit K″ = K′ ⊕ Θ(J³_0) = K′ ⊕ K^Ω folgt K′ ∩ K^Ω = 0. Das sind (G2), (G3). Richtig. (Probe: Σ_alle d_ξ = 13 + 8 = 21.)
   Die Voraussetzungszeile nennt K-25 (d), nicht K-25 (c). Benutzt wird beides. Kleine Ungenauigkeit in der Liste (das Glied K-25 ist genannt, nur der Teil nicht).
7. *Zeile 623, Schritt 5 (G4).* c_1, c_2 sind auf jeder Faser konstant (Y-Fasern: 0 nach (G1); Ω-Fasern: (G0)). Also sind sie Funktionen Π → K, und nach K-2 gibt es C_i ∈ 𝒜 mit c_i = C_i·1, also c_i·v = C_i·v für alle v (komponentenweise: (c_i)_t v_t = C_i(ξ(t))v_t). Für j ∈ J³_0 gilt j_i ∈ w·P_2 (K-27 (d) über (GM)), j_i = φ_i·w. Θ(j) = C_1·(φ_1·w) + C_2·(φ_2·w) = (C_1φ_1 + C_2φ_2)·w ∈ 𝒜·w. Also K^Ω = Θ(J³_0) ⊆ 𝒜·w. Für T_ξ ⊆ Ω: K^{T_ξ} = χ_ξ·K^Ω (K-6 (i), T_ξ ⊆ Ω) ⊆ χ_ξ·(𝒜·w) = K·(χ_ξ·w) (K-6 (iv)). Also |T_ξ| ≤ 1, also = 1 (Fasern sind nicht leer), und K^{T_ξ} ≠ 0 erzwingt χ_ξ·w ≠ 0, also w(z) ≠ 0 für T_ξ = {z}. Richtig.
8. *Zeile 624, Schritt 6 (G5).* Die Einschränkung w·P_3 → K^Y hat als Kern die Vektoren aus w·P_3, die auf Y verschwinden, also w·P_3 ∩ K^Ω (Y und Ω zerlegen die Indexmenge). w·P_3 ⊆ K′ (K-23 (c)) und K′ ∩ K^Ω = 0 (G3), also ist der Kern 0 und das Bild hat Dimension dim w·P_3 ≥ 7. Andererseits: (f·w)|_Y hat an t ∈ Y den Eintrag w_t f(ξ(t)); er ist 0 für t ∉ Σ und für t ∈ Σ ∩ Y eine feste Zahl w_t mal f(ξ(t)), ξ(t) ∈ Π_1. Also faktorisiert f ↦ (f·w)|_Y über die Auswertung P_3 → K^{Π_1}, f ↦ (f(ξ))_{ξ ∈ Π_1}, gefolgt von einer linearen Abbildung. Das Bild hat Dimension ≤ |Π_1|. Also |Π_1| ≥ 7. Richtig. Die Ungleichung dim (w·P_3)|_Y ≤ |Π_1| habe ich in zufälligen Lagen exakt nachgerechnet (Anhang C, 200 Fälle, keine Verletzung).

### 6.3 Randfälle und Lesart

- 𝒢_gen wird nur in Schritt 1 gebraucht. Ohne 𝒢_gen könnten Indizes verschiedener Rangklassen denselben a-Punkt haben (Anhang B, Fall „v“ mit absichtlich gleichem a-Punkt bei nicht proportionalen α). Der Wortlaut setzt 𝒢_gen richtig voraus.
- Die Aussage gilt für jede Normalform zu (S, T) ∈ 𝒢* ∩ 𝒢_gen, für e = 2 und e = 3. Keine Aussage „für allgemeine Wahl“ im Wortlaut; die Allgemeinheit steckt in der Voraussetzung (S, T) ∈ 𝒢_gen.
- Fasern der Größe 1 in Y sind nach (G2) ausgeschlossen (|T_ξ| = 2d_ξ ist gerade). Das ist eine Folgerung, kein Widerspruch.

### 6.4 Voraussetzungen

Benutzt: K-2, K-6 (i) bis (iv), K-12, K-23 (c), (e), K-24, K-25 (c), (d), K-27 (d) (über K-29, K-31), K-28 (a), (b), K-29, K-30 (c), (d), K-31, K-32 (2), K-33 (i), (iv), (v), Definitionen aus 1.4 und 𝒢_gen aus K-34. Die Zeile nennt K-25 nur mit (d). Sonst vollständig. 𝒢_gen ist eine Bezeichnung aus K-34, kein Satz; die Liste in Abschnitt 11 führt K-34 nicht als Voraussetzung von K-35, was in Ordnung ist, weil nur die Bezeichnung benutzt wird.

### 6.5 Urteil K-35

**Bestätigt.** Kleine Ungenauigkeit: In der Voraussetzungszeile fehlt K-25 (c), das Schritt 4 und Schritt 5 benutzen.

## 7. Abgleich mit der Liste in Abschnitt 11 (Zeilen 753 bis 806)

Die Zeilen zu K-32 bis K-35 in der Tabelle stimmen mit den Voraussetzungszeilen der Glieder überein (K-32: K-1; K-33: K-10, K-12, K-32; K-34 und K-35 wie in den Gliedern). Jedes Glied benutzt nur Glieder mit kleinerer Nummer.

## 8. Urteile

- **K-32: bestätigt.**
- **K-33: bestätigt.**
- **K-34: bestätigt.**
- **K-35: bestätigt.**

Echte Lücken habe ich nicht gefunden. Kleine Ungenauigkeiten im Wortlaut stehen in Abschnitt 1 und bei den Gliedern.

## Anhang: Programme

Alle drei Programme sind Python 3 ohne Fremdbibliotheken und rechnen mit ganzen Zahlen, Restklassen oder `fractions.Fraction` (keine Gleitkommazahlen). Laufzeit jeweils unter 15 Sekunden.

### Anhang A: K-32

Ausgabe:

```
GF(2) exhaustive: pairs=3969, counterexamples=0
GF(3) exhaustive: pairs=529984, counterexamples=0
GF(5) random: counterexamples=0
GF(7) random: counterexamples=0
Q targeted: cases=19343, counterexamples=0
```

```python
# Check of K-32 (Lemma F) in exact arithmetic.
# For nonzero alpha, alpha2 in K^{3x2}: the three 2x2 minors of (alpha p^T | alpha2 p^T)
# are all the zero polynomial in p  <=>  (I) alpha2 = lam*alpha, lam != 0, or
# (II) both rank 1 with the same column space.
# Exhaustive over GF(2), GF(3); random over Q and GF(5), GF(7); targeted edge cases over Q.
import itertools, random
from fractions import Fraction

def minors_coeffs(a, b, mod=None):
    # a, b: 3x2 lists. u_i(p) = a[i][0] p1 + a[i][1] p2 ; v_i(p) likewise.
    # minor_{ij} = u_i v_j - u_j v_i ; coefficients of p1^2, p1 p2, p2^2.
    out = []
    for i, j in ((0, 1), (0, 2), (1, 2)):
        c11 = a[i][0]*b[j][0] - a[j][0]*b[i][0]
        c12 = a[i][0]*b[j][1] + a[i][1]*b[j][0] - a[j][0]*b[i][1] - a[j][1]*b[i][0]
        c22 = a[i][1]*b[j][1] - a[j][1]*b[i][1]
        cs = (c11, c12, c22)
        if mod: cs = tuple(c % mod for c in cs)
        out.append(cs)
    return out

def all_zero_poly(a, b, mod=None):
    return all(c == 0 for m in minors_coeffs(a, b, mod) for c in m)

def rank(a, mod=None):
    # rank of 3x2 matrix
    cols = [[a[i][0] for i in range(3)], [a[i][1] for i in range(3)]]
    def z(x): return (x % mod == 0) if mod else x == 0
    if all(z(x) for x in cols[0] + cols[1]): return 0
    # rank 2 iff some 2x2 minor nonzero
    for i, j in ((0, 1), (0, 2), (1, 2)):
        if not z(a[i][0]*a[j][1] - a[j][0]*a[i][1]): return 2
    return 1

def prop(a, b, mod=None):
    # exists lam != 0 with b = lam a  (a, b nonzero)
    fa = [a[i][k] for i in range(3) for k in range(2)]
    fb = [b[i][k] for i in range(3) for k in range(2)]
    def z(x): return (x % mod == 0) if mod else x == 0
    # b = lam a iff all 2x2 "cross" determinants fa_i fb_j - fa_j fb_i vanish (a,b nonzero)
    return all(z(fa[i]*fb[j] - fa[j]*fb[i]) for i in range(6) for j in range(6))

def same_colspace_rank1(a, b, mod=None):
    if rank(a, mod) != 1 or rank(b, mod) != 1: return False
    # column spaces: nonzero column of a and nonzero column of b dependent
    def z(x): return (x % mod == 0) if mod else x == 0
    def nzcol(m):
        for k in range(2):
            c = [m[i][k] for i in range(3)]
            if not all(z(x) for x in c): return c
    x, y = nzcol(a), nzcol(b)
    return all(z(x[i]*y[j] - x[j]*y[i]) for i in range(3) for j in range(3))

def classify_ok(a, b, mod=None):
    lhs = all_zero_poly(a, b, mod)
    rhs = prop(a, b, mod) or same_colspace_rank1(a, b, mod)
    return lhs == rhs

def mats(q):
    for e in itertools.product(range(q), repeat=6):
        if any(e):
            yield [[e[0], e[1]], [e[2], e[3]], [e[4], e[5]]]

for q in (2, 3):
    M = list(mats(q)); bad = 0; n = 0
    for a in M:
        for b in M:
            n += 1
            if not classify_ok(a, b, q): bad += 1
    print(f"GF({q}) exhaustive: pairs={n}, counterexamples={bad}")

random.seed(32)
for q in (5, 7):
    bad = 0
    for _ in range(200000):
        a = [[random.randrange(q) for _ in range(2)] for _ in range(3)]
        b = [[random.randrange(q) for _ in range(2)] for _ in range(3)]
        if rank(a, q) == 0 or rank(b, q) == 0: continue
        if not classify_ok(a, b, q): bad += 1
    print(f"GF({q}) random: counterexamples={bad}")

# targeted edge cases over Q
F = Fraction
def mul(A, B):
    return [[sum(A[i][k]*B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
def rnd(): return F(random.randint(-5, 5), random.randint(1, 4))
bad = 0; cases = 0
for _ in range(20000):
    kind = random.randrange(7)
    x = [[rnd()] for _ in range(3)]; x2 = [[rnd()] for _ in range(3)]
    y = [[rnd(), rnd()]]; y2 = [[rnd(), rnd()]]
    a2r = [[rnd(), rnd()] for _ in range(3)]
    if kind == 0:   # rank 2 and proportional
        a = a2r; lam = rnd(); b = [[lam*v for v in r] for r in a]
    elif kind == 1: # rank 2, same image, alpha2 = alpha*M with M non-scalar
        a = a2r; Mx = [[rnd(), rnd()], [rnd(), rnd()]]; b = mul(a, Mx)
    elif kind == 2: # rank 1 same column space, different row vectors
        a = mul(x, y); b = mul(x, y2)
    elif kind == 3: # rank 1, different column spaces, same row vector
        a = mul(x, y); b = mul(x2, y)
    elif kind == 4: # rank 2 vs rank 1 whose column lies in image of alpha
        a = a2r; c = mul(a, [[rnd()], [rnd()]]); b = mul(c, y)
    elif kind == 5: # rank 1 proportional
        a = mul(x, y); lam = rnd(); b = [[lam*v for v in r] for r in a]
    else:           # generic
        a = a2r; b = [[rnd(), rnd()] for _ in range(3)]
    if rank(a) == 0 or rank(b) == 0: continue
    cases += 1
    if not classify_ok(a, b): bad += 1
print(f"Q targeted: cases={cases}, counterexamples={bad}")
```

### Anhang B: K-33

Ausgabe:

```
checked indices: 3708
counterexamples per part: {'formula': 0, 'i': 0, 'ii': 0, 'iii_line': 0, 'iii_T': 0, 'iv': 0, 'v': 0}
```

```python
# Check of K-33 in exact rational arithmetic.
# alpha'_t is computed from the definition alpha'_t(A) = alpha_t(S A T), not from the formula of K-10.
import random
from fractions import Fraction as F
random.seed(33)

def rnd(): return F(random.randint(-6, 6), random.randint(1, 3))
def mul(A, B):
    return [[sum(A[i][k]*B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
def det2(M): return M[0][0]*M[1][1]-M[0][1]*M[1][0]
def det3(M):
    return (M[0][0]*(M[1][1]*M[2][2]-M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2]-M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1]-M[1][1]*M[2][0]))
def E(i, j, n=3, m=2):
    X = [[F(0)]*m for _ in range(n)]; X[i][j] = F(1); return X
def form(alpha, X):  # alpha(X) = sum alpha_ij X_ij
    return sum(alpha[i][j]*X[i][j] for i in range(3) for j in range(2))
def rank32(a):
    if all(v == 0 for r in a for v in r): return 0
    return 2 if any(a[i][0]*a[j][1]-a[j][0]*a[i][1] != 0 for i, j in ((0,1),(0,2),(1,2))) else 1
def dep(u, v):  # two vectors in K^3 linearly dependent
    return all(u[i]*v[j]-u[j]*v[i] == 0 for i in range(3) for j in range(3))
def rand_alpha(kind):
    if kind == 1:
        x = [[rnd()] for _ in range(3)]; y = [[rnd(), rnd()]]; return mul(x, y)
    return [[rnd(), rnd()] for _ in range(3)]

def normal_cols(alpha, S, T):
    # returns (a(t), b(t)) via definition: alpha'(e_i0) = alpha(S e_i0 T), scaled by alpha'(e_00)
    ap = [form(alpha, mul(mul(S, E(i, 0)), T)) for i in range(3)]
    bp = [form(alpha, mul(mul(S, E(i, 1)), T)) for i in range(3)]
    if ap[0] == 0: return None
    return [v/ap[0] for v in ap], [v/ap[0] for v in bp], ap[0]

def colT(M, k): return [[M[i][k]] for i in range(len(M))]
bad = {k: 0 for k in ("formula", "i", "ii", "iii_line", "iii_T", "iv", "v")}
n = 0
for _ in range(4000):
    S = [[rnd() for _ in range(3)] for _ in range(3)]
    T = [[rnd() for _ in range(2)] for _ in range(2)]
    if det3(S) == 0 or det2(T) == 0: continue
    kind = random.choice((1, 2))
    al = rand_alpha(kind)
    if rank32(al) == 0: continue
    r = normal_cols(al, S, T)
    if r is None: continue          # (SN1) fails for this index
    n += 1
    a, b, den = r
    St = [list(row) for row in zip(*S)]
    p = [T[0]]; pp = [T[1]]
    Sap = mul(mul(St, al), [[p[0][0]], [p[0][1]]])
    Sapp = mul(mul(St, al), [[pp[0][0]], [pp[0][1]]])
    s0ap = Sap[0][0]
    # formula a(t) = S^T alpha p^T / s0^T alpha p^T, b(t) likewise
    if [Sap[i][0]/s0ap for i in range(3)] != a or [Sapp[i][0]/s0ap for i in range(3)] != b or s0ap != den:
        bad["formula"] += 1
    c1 = b[1]-a[1]*b[0]; c2 = b[2]-a[2]*b[0]
    # (i)
    if ((c1, c2) == (0, 0)) != (rank32(al) == 1): bad["i"] += 1
    # (ii) rank 1: a(t) = S^T x / s0^T x, independent of T
    if rank32(al) == 1:
        x = next([al[i][k] for i in range(3)] for k in range(2) if any(al[i][k] != 0 for i in range(3)))
        Sx = [sum(S[j][i]*x[j] for j in range(3)) for i in range(3)]
        if Sx[0] == 0 or [v/Sx[0] for v in Sx] != a: bad["ii"] += 1
        T2 = [[rnd() for _ in range(2)] for _ in range(2)]
        if det2(T2) != 0:
            r2 = normal_cols(al, S, T2)
            if r2 is not None and r2[0] != a: bad["ii"] += 1
    else:
        # (iii) line: normal n of E = S^T alpha K^2 is cross product of the two image columns
        u = [Sx for Sx in zip(*mul(St, al))]
        nn = [u[0][1]*u[1][2]-u[0][2]*u[1][1], u[0][2]*u[1][0]-u[0][0]*u[1][2], u[0][0]*u[1][1]-u[0][1]*u[1][0]]
        if (nn[1], nn[2]) == (0, 0) or nn[0] + nn[1]*a[1] + nn[2]*a[2] != 0: bad["iii_line"] += 1
        # same a-point for T2 iff first rows proportional
        for prop_case in (True, False):
            lam = rnd() or F(1)
            p2 = [lam*T[0][0], lam*T[0][1]] if prop_case else [rnd(), rnd()]
            T2 = [p2, [rnd(), rnd()]]
            if det2(T2) == 0: continue
            r2 = normal_cols(al, S, T2)
            if r2 is None: continue
            same = (r2[0] == a)
            isprop = (p2[0]*T[0][1]-p2[1]*T[0][0] == 0)
            if same != isprop: bad["iii_T"] += 1
    # (iv) proportional alpha gives same a, b
    lam = rnd() or F(2)
    r3 = normal_cols([[lam*v for v in row] for row in al], S, T)
    if r3[0] != a or r3[1] != b: bad["iv"] += 1
    # (v) xi(t) = xi(t') iff p in V(alpha_t, alpha_t'); include tricky partners
    for mode in range(4):
        if mode == 0: al2 = rand_alpha(random.choice((1, 2)))
        elif mode == 1:   # partner with the same a-point built on purpose: alpha2 p^T parallel to alpha p^T
            v = [row[0] for row in mul(al, [[p[0][0]], [p[0][1]]])]
            w = [rnd(), rnd()]
            # alpha2 = v * y^T + z * y'^T with y'.p = 0
            y = [rnd(), rnd()]; yp = [-p[0][1], p[0][0]]
            z = [rnd() for _ in range(3)]
            al2 = [[v[i]*y[0]+z[i]*yp[0], v[i]*y[1]+z[i]*yp[1]] for i in range(3)]
        elif mode == 2:   # same column space rank 1 (if alpha rank 1)
            al2 = mul([[x_] for x_ in (row[0] if row[0] != 0 else row[1] for row in al)], [[rnd(), rnd()]]) if rank32(al) == 1 else rand_alpha(1)
        else:
            al2 = mul(al, [[rnd(), rnd()], [rnd(), rnd()]])
        if rank32(al2) == 0: continue
        r4 = normal_cols(al2, S, T)
        if r4 is None: continue
        same = (r4[0] == a)
        inV = dep([row[0] for row in mul(al, [[p[0][0]], [p[0][1]]])], [row[0] for row in mul(al2, [[p[0][0]], [p[0][1]]])])
        if same != inV: bad["v"] += 1
print("checked indices:", n)
print("counterexamples per part:", bad)
```

### Anhang C: K-34 Schritt 1 und K-35 Schritt 6

Ausgabe:

```
kind=e3     dimF=3 dim(F+a1F+a2F)=6 rkM=60 identity_holds=True
kind=e3     dimF=3 dim(F+a1F+a2F)=6 rkM=60 identity_holds=True
kind=e3     dimF=3 dim(F+a1F+a2F)=6 rkM=60 identity_holds=True
kind=e3     dimF=3 dim(F+a1F+a2F)=6 rkM=60 identity_holds=True
kind=e3     dimF=3 dim(F+a1F+a2F)=6 rkM=60 identity_holds=True
kind=e3     dimF=3 dim(F+a1F+a2F)=6 rkM=60 identity_holds=True
kind=conic  dimF=3 dim(F+a1F+a2F)=5 rkM=59 identity_holds=True
kind=conic  dimF=3 dim(F+a1F+a2F)=5 rkM=59 identity_holds=True
kind=conic  dimF=3 dim(F+a1F+a2F)=5 rkM=59 identity_holds=True
kind=conic  dimF=3 dim(F+a1F+a2F)=5 rkM=59 identity_holds=True
kind=conic  dimF=3 dim(F+a1F+a2F)=5 rkM=59 identity_holds=True
kind=conic  dimF=3 dim(F+a1F+a2F)=5 rkM=59 identity_holds=True
kind=random dimF=0 dim(F+a1F+a2F)=0 rkM=63 identity_holds=True
kind=random dimF=0 dim(F+a1F+a2F)=0 rkM=63 identity_holds=True
kind=random dimF=0 dim(F+a1F+a2F)=0 rkM=63 identity_holds=True
kind=random dimF=0 dim(F+a1F+a2F)=0 rkM=63 identity_holds=True
kind=random dimF=0 dim(F+a1F+a2F)=0 rkM=63 identity_holds=True
kind=random dimF=0 dim(F+a1F+a2F)=0 rkM=63 identity_holds=True
all identities hold: True
K-35 Step 6 bound violations: 0
```

```python
# Check of K-34 Step 1 (rank formula) and of K-35 Step 6 (bound by |Pi_1|) in exact rational arithmetic.
# Step 1 is pure linear algebra: for Q (34x7, rank 7), vectors a1, a2 in K^34 and
# F := {j in J : a1 j in J, a2 j in J}, J = col(Q), the matrix M of (Xi^3, Gamma) satisfies
#   dim(F + a1 F + a2 F) = rk M - 63 + 3 dim F    (= rk M - 54 when dim F = 3).
import random
from fractions import Fraction as Fr
random.seed(34)
R = 34

def rank(rows):
    A = [list(map(Fr, r)) for r in rows]
    rk = 0; ncol = len(A[0]) if A else 0
    for c in range(ncol):
        piv = next((i for i in range(rk, len(A)) if A[i][c] != 0), None)
        if piv is None: continue
        A[rk], A[piv] = A[piv], A[rk]
        for i in range(len(A)):
            if i != rk and A[i][c] != 0:
                f = A[i][c] / A[rk][c]
                A[i] = [x - f*y for x, y in zip(A[i], A[rk])]
        rk += 1
    return rk

def nullspace(rows, ncol):
    A = [list(map(Fr, r)) for r in rows]
    pivs = []; rk = 0
    for c in range(ncol):
        piv = next((i for i in range(rk, len(A)) if A[i][c] != 0), None)
        if piv is None: continue
        A[rk], A[piv] = A[piv], A[rk]
        A[rk] = [x / A[rk][c] for x in A[rk]]
        for i in range(len(A)):
            if i != rk and A[i][c] != 0:
                f = A[i][c]; A[i] = [x - f*y for x, y in zip(A[i], A[rk])]
        pivs.append(c); rk += 1
    free = [c for c in range(ncol) if c not in pivs]
    basis = []
    for fcol in free:
        v = [Fr(0)]*ncol; v[fcol] = Fr(1)
        for i, pc in enumerate(pivs): v[pc] = -A[i][fcol]
        basis.append(v)
    return basis

def monos(d): return [(i, j) for s in range(d+1) for i in range(s+1) for j in [s-i]]

def instance(kind):
    # points
    if kind == "conic":   # all points on the conic x^2 + y^2 = 1 (rational param.) -> w.P2 has dim 5
        pts = []
        for _ in range(12):
            t = Fr(random.randint(-9, 9), random.randint(1, 5))
            pts.append(((1 - t*t)/(1 + t*t), 2*t/(1 + t*t)))
    else:
        pts = [(Fr(random.randint(-5, 5)), Fr(random.randint(-5, 5))) for _ in range(14)]
    xi = [random.choice(pts) for _ in range(R)]
    a1 = [p[0] for p in xi]; a2 = [p[1] for p in xi]
    w = [Fr(random.choice([0, 0, 1, 2, -3, 5])) for _ in range(R)]
    wP2 = [[w[t]*xi[t][0]**i*xi[t][1]**j for t in range(R)] for (i, j) in monos(2)]
    extra = [[Fr(random.randint(-3, 3)) for _ in range(R)] for _ in range(3)]
    if kind == "random":
        cols = [[Fr(random.randint(-3, 3)) for _ in range(R)] for _ in range(7)]
    else:
        cols = []
        for v in wP2 + extra:
            if rank(cols + [v]) > len(cols): cols.append(v)
            if len(cols) == 7: break
    return cols, a1, a2, xi, w

def check(cols, a1, a2):
    if rank(cols) != 7: return None
    Q = cols  # 7 column vectors
    Qy = lambda y: [sum(y[k]*Q[k][t] for k in range(7)) for t in range(R)]
    # build M: columns indexed by ((y_i, y_i', y_i''))_{i=0,1,2}, 63 unknowns
    rows = []
    for blk in range(3):
        off = 21*blk
        for which, av in ((1, a1), (2, a2)):
            for t in range(R):
                row = [Fr(0)]*63
                for k in range(7):
                    row[off + k] += av[t]*Q[k][t]           # a_i * Q y
                    row[off + 7*which + k] -= Q[k][t]       # - Q y' or - Q y''
                rows.append(row)
    for t in range(R):
        row = [Fr(0)]*63
        for k in range(7):
            row[k] += Q[k][t]; row[21 + k] += a1[t]*Q[k][t]; row[42 + k] += a2[t]*Q[k][t]
        rows.append(row)
    rkM = rank(rows)
    # F directly: y with a1*Qy and a2*Qy in J
    # unknowns (y, y', y'') in K^21 with a1 Qy = Qy', a2 Qy = Qy''
    eqs = []
    for which, av in ((1, a1), (2, a2)):
        for t in range(R):
            row = [Fr(0)]*21
            for k in range(7):
                row[k] += av[t]*Q[k][t]; row[7*which + k] -= Q[k][t]
            eqs.append(row)
    ker = nullspace(eqs, 21)
    Fvecs = [Qy(v[:7]) for v in ker]
    dimF = rank(Fvecs) if Fvecs else 0
    span = Fvecs + [[a1[t]*f[t] for t in range(R)] for f in Fvecs] + [[a2[t]*f[t] for t in range(R)] for f in Fvecs]
    dimS = rank(span) if span else 0
    return dimF, dimS, rkM, dimS == rkM - 63 + 3*dimF

stats = []
for kind in ("e3", "conic", "random"):
    for _ in range(6):
        r = check(*instance(kind)[:3])
        if r: stats.append((kind,) + r)
for s in stats: print("kind=%-6s dimF=%d dim(F+a1F+a2F)=%d rkM=%d identity_holds=%s" % s)
print("all identities hold:", all(s[-1] for s in stats))

# K-35 Step 6: dim (w.P3)|_Y <= |Pi_1| where Pi_1 = {xi(t): t in Y, w_t != 0}
bad = 0
for _ in range(200):
    cols, a1, a2, xi, w = instance(random.choice(("e3", "conic")))
    Y = [t for t in range(R) if random.random() < 0.75]
    if not Y: continue
    rowsY = [[w[t]*xi[t][0]**i*xi[t][1]**j for t in Y] for (i, j) in monos(3)]
    Pi1 = {xi[t] for t in Y if w[t] != 0}
    if rank(rowsY) > len(Pi1): bad += 1
print("K-35 Step 6 bound violations:", bad)
```
