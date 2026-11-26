# S4-06: Ausschluss des Restfalls (4, 6, 4) für ⟨3,2,7⟩ bei Länge 34 (Stufe 4, Runde 2, Spur A)

- Auftrag: S4-06, Protokoll 0.6, Stufe 4, Runde 2, Spur A. Rolle: Beweissucher.
- Datum: 26.11.2026. Dauer aus den Git-Zeitstempeln des Zweigs `claude/project-thread-fg12mx`.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md`, `STATUS.md`, `LOG.md` (Ende), `versuche/s4-blind-r1.md`, `erkundung/s3-08-einschaetzung-327.md`, `behauptungen/B-017.md` bis `B-019.md`, die Abschnitte der Prüfberichte `lean/prosa/s4_327_bericht_s4-01.md` bis `s4-03.md` zur Länge nach dem Normalisieren, `lean/prosa/yang_n3.md`, `lean/prosa/yang_n4.md`. Keine Datei, die in Runde 2 neu entstanden ist.
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Eingeblendet wurden mir der Gedächtnisindex und die Einzeleinträge `git-regeln` und `lean-upper-3x2x6` (Regel- und Dateihinweise). Ich habe sie nicht benutzt.
- Rechnungen: keine Rechenblöcke. Alles in dieser Datei ist Handrechnung.
- **Status aller Aussagen: behauptet** (wo ich einen Beweis ausgeschrieben habe) oder **vermutet** (ausdrücklich so markiert). Nichts ist geprüft. Den Status setzt nur der Orchestrator.

---

## 0. Ergebnis in Kürze

**Der Restfall ist nicht ausgeschlossen.** Ich habe keinen Widerspruch gefunden. Die Untergrenze 35 ist durch diese Datei nicht gezeigt.

Gezeigt habe ich (Status behauptet) eine Reihe von Strukturaussagen über eine hypothetische Zerlegung der Länge 34, die über das hinausgehen, was in `versuche/s4-blind-r1.md` (Abschnitt 4.2) und in den Restfall-Rechnungen steht. Die wichtigsten:

1. Der Restfall folgt **allein aus dem Rahmen `yang_n3.md`** (Lemmata B, F, G, H, I). Lemma 15(b), der Rahmen `yang_n4.md` und die Übertragung B-019 werden dafür nicht gebraucht. (Aussage A1)
2. **Polynomstruktur:** In jeder Normalform gibt es einen Vektor y₀ mit f₀(N) = y₀·⟨1, s, t⟩ und y₀·⟨Polynome vom Grad ≤ 2 in s, t⟩ ⊆ J. Danach gibt es genau zwei Unterfälle: G (J = y₀·Pol₂ ⊕ ⟨w⟩) und B (die Punkte auf dem Träger von y₀ liegen auf einem glatten Kegelschnitt). (Aussagen A2, A3)
3. **Trägerschranke:** Im Unterfall G hat y₀ mindestens 28 von 34 Einträgen ungleich 0, im Unterfall B mindestens 22. Im Unterfall G sind die höchstens 6 übrigen Produkte sehr eingeschränkt. (Aussage A4)
4. **Variation der Normierung:** Die Struktur gilt, in Objekten ausgedrückt, die nur von der Zeilenrichtung p abhängen, für alle bis auf endlich viele Richtungen p. Daraus folgt eine Bedingung an die B-Seite der übrigen Zeilen. (Aussagen A5, A6)

Sechs Ansätze für den letzten Schritt (Widerspruch) sind gescheitert. Die Stellen stehen in Abschnitt 9. Die Lücke, an der alles hängt, heißt hier **Lücke Λ** (Abschnitt 8).

---

## 1. Aussagen im Wortlaut (für eine Behauptungsdatei)

Gemeinsame Voraussetzung **(V)** für A1 bis A4: K ist algebraisch abgeschlossen. Gegeben ist eine Zerlegung (Z) von ⟨3,2,7⟩ über K der Länge 34 im Sinn von `yang_n3.md`, Abschnitt 1, die **stark normalisiert** ist (SN1, SN2 aus `yang_n3.md`, Abschnitt 5). Bezeichnungen wie in `yang_n3.md`, Abschnitte 2, 6, 8 (U, f_i, J, Q, F_i, L, H, N, S, Δ), dazu die Bezeichnungen aus Abschnitt 2 dieser Datei (s, t, r_i, Pol_k, Produkt ⊙).

- **A1 (Restfall aus `yang_n3` allein).** Unter (V), aber schon für K unendlich: rk L = 6 = dim Q, rk H = 4, dim N = 3, Δ = 2, dim S = 1. Benutzt werden nur Ungleichung (G), Lemma G, Lemma H, Lemma I und Lemma B aus `yang_n3.md`.
- **A2 (Polynomstruktur).** Unter (V): Es gibt y₀ ∈ K³⁴, y₀ ≠ 0, mit f₀(N) = y₀ ⊙ Pol₁ und y₀ ⊙ Pol₂ ⊆ J. Es gilt dim(y₀ ⊙ Pol₂) ∈ {5, 6}, und es gilt genau einer der Unterfälle:
  - **G:** dim(y₀ ⊙ Pol₂) = 6. Dann J = y₀ ⊙ Pol₂ ⊕ ⟨w⟩ für jedes w ∈ J außerhalb von y₀ ⊙ Pol₂, dim(y₀ ⊙ Pol₃) = 10, und ker W = y₀ ⊙ Pol₃ ⊕ ⟨w, s⊙w, t⊙w⟩ (direkte Summe).
  - **B:** dim(y₀ ⊙ Pol₂) = 5. Dann gibt es ein Polynom g₀ vom Grad genau 2 mit y₀ ⊙ g₀ = 0, J = y₀ ⊙ Pol₂ ⊕ ⟨w₁, w₂⟩, dim(y₀ ⊙ Pol₃) = 7, und ker W = y₀ ⊙ Pol₃ ⊕ ⟨w_j, s⊙w_j, t⊙w_j : j = 1, 2⟩ (direkte Summe).
- **A3 (Unterfall B nur mit glattem Kegelschnitt).** Unter (V) im Unterfall B ist die Homogenisierung von g₀ eine irreduzible quadratische Form. Alle Punkte (s_τ, t_τ) mit y₀,τ ≠ 0 liegen also auf einem glatten Kegelschnitt, nicht auf zwei Geraden.
- **A4 (Trägerschranke).** Unter (V) sei Σ := {τ : y₀,τ ≠ 0} und Π := {0, …, 33} ∖ Σ.
  - Im Unterfall G ist |Σ| ≥ 28, also |Π| ≤ 6. Genauer bilden die 34 Vektoren aus y₀ ⊙ Pol₃ (10), ⟨w, s⊙w, t⊙w⟩ (3), r_i ⊙ y₀ ⊙ Pol₂ (i = 0, 1, 2; 18) und r_i ⊙ w (3) eine Basis von K³⁴. Für τ ∈ Π gilt w_τ ≠ 0, die Formen α_τ (τ ∈ Π) sind linear unabhängig, und die Linearformen v ↦ β_τ(e₁ ⊗ v) (τ ∈ Π) auf K⁷ sind alle Vielfache einer einzigen Linearform.
  - Im Unterfall B ist |Σ| ≥ 22.
- **A5 (nur die Richtung p zählt).** Sei K algebraisch abgeschlossen und (α, β, C) eine Zerlegung von ⟨3,2,7⟩ der Länge 34. Für alle bis auf endlich viele Zeilen p ∈ P(K^{1×2}) gibt es u ∈ K³ so, dass der Basiswechsel aus `yang_n3.md`, Lemma A, Schritt 5, zu (u, p) eine stark normalisierte Zerlegung derselben Länge liefert. Für jedes solche p gilt mit k_p ≠ 0, p·k_p = 0, X_p := {(α_τ(u′p))_τ : u′ ∈ K³} und Ĵ_p := {(β_τ(k_p v))_τ : v ∈ K^{1×7}}: Es gibt z_p ∈ K³⁴ mit Träger Σ wie in A4 und z_p ⊙ X_p^{⊙2} ⊆ Ĵ_p, z_p ⊙ X_p^{⊙3} ⊆ ker W, mit den Dimensionen aus A2 (z_p zu einem passend gewählten u; ob z_p von der Wahl von u abhängt, ist offen, Lücke A5-iii).
- **A6 (Bündel der Restzeilen).** Unter den Voraussetzungen von A5 gibt es eine Menge Π ⊆ {0, …, 33} und unendlich viele p, für die der Unterfall G mit diesem Π vorliegt, oder unendlich viele p mit Unterfall B. Im ersten Fall gilt für die 2×7-Matrizen β_τ (τ ∈ Π): Entweder sind alle β_τ Vielfache einer einzigen Matrix β* vom Rang 2, oder alle haben die Form c_τ ⊗ x₀ mit festem x₀ ∈ K^{1×7}.

**Lücke Λ (nicht gezeigt):** Aus A1 bis A6 folgt kein Widerspruch, den ich ausschreiben könnte. Ob der Restfall vorkommt, bleibt offen.

---

## 2. Rahmen, Voraussetzungen, Bezeichnungen

### 2.1 Reduktion auf eine stark normalisierte Zerlegung der Länge 34

Sei F ein beliebiger Körper und (α, β, C) eine Zerlegung von ⟨3,2,7⟩ über F der Länge 34. Ziel eines Ausschlussbeweises wäre ein Widerspruch.

1. **Körper.** Nach `yang_n3.md` R1 ist dieselbe Zerlegung auch eine über dem algebraischen Abschluss K von F, mit derselben Länge. K ist unendlich.
2. **Keine Nullformen.** Ist α_τ = 0 für ein τ, so gibt das Streichen dieses Terms (R2) eine Zerlegung der Länge ≤ 33 über K. Das widerspricht der Schranke R_K(⟨3,2,7⟩) ≥ 34 (Yang Satz 1 für m = 7; laut Protokoll Abschnitt 2 folgt sie in diesem Repo aus B-002). **Also ist kein α_τ die Nullform, und die Länge bleibt 34.** Das ist die Ergänzung, die S4-01 (Abschnitt 3.12) und S4-02 (T4) als „r′ ≤ r“ benennen: Bei Länge 34 ist r′ = r erzwungen. Benutzt wird dabei nur die Schranke 34, keine weitere Aussage.
   - Gleiches Argument: kein β_τ ist die Nullform, und kein C_τ ist 0 (sonst Länge 33).
3. **Normalisierung.** Nach `yang_n3.md` Lemma A (braucht nur K unendlich und keine Nullform α_τ) gibt es S ∈ GL₃, T ∈ GL₂, nach deren Basiswechsel (R3) die Zerlegung stark normalisiert ist. Die Länge bleibt 34.

Ab Abschnitt 3 ist die Zerlegung stark normalisiert, über K algebraisch abgeschlossen, Länge R = 34, m = 7. Dann gilt dim ker W = 34 − 21 = 13, dim J = 7, q = dim Q = 34 − 28 = 6 (`yang_n3.md`, G3, Lemma C).

### 2.2 Vektoren als Funktionen auf den Indizes

Vektoren in K³⁴ sind Funktionen auf {0, …, 33}. x ⊙ y ist das eintragsweise Produkt, x⁻¹ das eintragsweise Inverse (wo definiert). Diagonalmatrizen D wirken als D·y = d ⊙ y mit dem Diagonalvektor d.

- d_i := Diagonale von D(e_{i,0}), d′_i := Diagonale von D(e_{i,1}) (i = 0, 1, 2). Nach (SN1) hat d₀ keinen Eintrag 0.
- s := d₁ ⊙ d₀⁻¹, t := d₂ ⊙ d₀⁻¹, r_i := d′_i ⊙ d₀⁻¹. Dann f₁ = s ⊙ f₀, f₂ = t ⊙ f₀ (das ist G6 bzw. P_i in `yang_n3.md`, Lemma B).
- Für ein Polynom g(s, t) mit Koeffizienten in K ist g(s, t) ∈ K³⁴ der Vektor (g(s_τ, t_τ))_τ. Pol_k := Raum der Polynome in zwei Variablen vom Grad ≤ k (dim Pol₁ = 3, Pol₂ = 6, Pol₃ = 10). Für y ∈ K³⁴ ist y ⊙ Pol_k := {y ⊙ g(s, t) : g ∈ Pol_k}.
- Für einen Unterraum Y ⊆ K³⁴ ist s⊙Y := {s ⊙ y : y ∈ Y}.
- Der Punkt zum Index τ ist P_τ := (s_τ, t_τ) ∈ K², homogen (1 : s_τ : t_τ) ∈ P².

**Umformulierung von (SN2).** Für x ≠ 0 sind f₀(x), f₁(x), f₂(x) genau dann linear abhängig, wenn es (c₀, c₁, c₂) ≠ 0 gibt mit (c₀ + c₁s + c₂t) ⊙ f₀(x) = 0, das heißt wenn alle Punkte P_τ mit f₀(x)_τ ≠ 0 auf einer Geraden c₀ + c₁X + c₂Y = 0 liegen. **(SN2) sagt also: Kein Vektor y ≠ 0 aus f₀(K^{2×7}) hat seinen Träger auf einer Geraden.** (Ist (c₁, c₂) = (0, 0), so ist c₀ ≠ 0 und y = 0.)

### 2.3 Zwei Identitäten aus (Z′)

Sei x_v ∈ U die Matrix mit Zeile 0 gleich 0 und Zeile 1 gleich v ∈ K^{1×7}. Für jedes y ∈ J gibt es genau ein v =: v(y) mit f₀(x_v) = y (f₀ injektiv, G4). Aus (Z′) W(D(A)ℬ(B)) = AB mit B = x_v:

- A = e_{i,0}: AB = 0, also W(d_i ⊙ ℬ(x_v)) = 0. Mit ℬ(x_v) = d₀⁻¹ ⊙ y: **W(y) = W(s⊙y) = W(t⊙y) = 0** für y ∈ J. (Das ist Lemma C.)
- A = e_{i,1}: AB ist die 3×7-Matrix mit Zeile i gleich v und sonst 0, kurz e_i ⊗ v. Also **W(r_i ⊙ y) = e_i ⊗ v(y)** für y ∈ J, i = 0, 1, 2.   (I)

Die Abbildung y ↦ v(y) ist ein Isomorphismus J → K^{1×7}.

---

## 3. A1: Der Restfall folgt aus `yang_n3` allein

*Beweis.* Alle Zitate aus `yang_n3.md`. rk L ≤ q = 6, weil L nach Q geht.

1. Ungleichung (G): 2m + rk H ≤ rk L + 2q, also 14 + rk H ≤ rk L + 12, also rk H ≤ rk L − 2 ≤ 4.
2. dim N = m − rk H ≥ 3 (Dimensionsformel für H, N = ker H).
3. Lemma I: Δ ≥ min(2, dim N) = 2, also 2·rk H ≥ rk L + 2.
4. Aus 1 und 3: rk L + 2 ≤ 2 rk H ≤ 2 rk L − 4, also rk L ≥ 6. Mit rk L ≤ 6: rk L = 6. Dann rk H ≤ 4 (Schritt 1) und 2 rk H ≥ 8 (Schritt 3): rk H = 4, Δ = 2, dim N = 3.
5. Lemma H: dim S ≥ dim N − Δ = 1. Also S ≠ 0, und der Beweis von Lemma I (Lemma B auf S) gibt dim S + 2 ≤ dim f₀(N) = 3. Also dim S = 1. ∎

Diese Rechnung steht in gleicher Form schon in `versuche/s4-blind-r1.md`, Abschnitt 4.2. Neu ist nur der Hinweis, wozu das reicht: Es werden weder ρ noch Lemma 15(b) (B-018) noch die Übertragung von Lemma I in den Rahmen `yang_n4` (B-019) gebraucht. Für alles Weitere in dieser Datei auch nicht. Wer ρ will: ρ ≤ rk H = 4, weil jede Kombination γ₁F₁ + γ₂F₂ über H faktorisiert, und ρ ≥ 4 braucht Lemma 15(a), (b). Ich benutze ρ nirgends.

Zusatz: **L ist surjektiv** (rk L = 6 = q), also J + s⊙J + t⊙J = ker W (denn im L = (J + f₁(U) + f₂(U))/J ⊆ ker W/J, und beide Seiten haben Dimension 6).

---

## 4. A2: Polynomstruktur

*Beweis.*

(a) **f₀(N) und f₀(S).** Nach Definition ist N = {x ∈ U : f₁(x), f₂(x) ∈ J}, also mit J_N := f₀(N): J_N = {y ∈ J : s⊙y ∈ J, t⊙y ∈ J}, dim J_N = 3 (f₀ injektiv). Ebenso f₀(S) = {y ∈ J_N : s⊙y ∈ J_N, t⊙y ∈ J_N}, dim 1. Sei y₀ ≠ 0 ein Erzeuger von f₀(S).

(b) **J_N = y₀ ⊙ Pol₁.** y₀, s⊙y₀, t⊙y₀ liegen in J_N (Definition von S) und sind linear unabhängig ((SN2) für x₀ = f₀⁻¹(y₀) ≠ 0). Da dim J_N = 3, ist J_N = span(y₀, s⊙y₀, t⊙y₀) = y₀ ⊙ Pol₁.

(c) **y₀ ⊙ Pol₂ ⊆ J.** Jedes Element von J_N liegt in J, und s⊙J_N, t⊙J_N ⊆ J nach (a). Also J ⊇ J_N + s⊙J_N + t⊙J_N = y₀ ⊙ (Pol₁ + s·Pol₁ + t·Pol₁) = y₀ ⊙ Pol₂.

(d) **dim(y₀ ⊙ Pol₂) ∈ {5, 6}.** Höchstens 6 = dim Pol₂. Mindestens 5 nach `yang_n3.md` Lemma B für den Unterraum N ≠ 0: dim(f₀(N) + f₁(N) + f₂(N)) ≥ dim N + 2, und die linke Seite ist y₀ ⊙ Pol₂.

(e) **Auswertungsabbildung.** Sei ev_k : Pol_k → K³⁴, g ↦ y₀ ⊙ g(s, t). Ihr Kern sind die Polynome vom Grad ≤ k, die auf allen Punkten P_τ mit τ ∈ Σ (Träger von y₀) verschwinden. ev₁ ist injektiv nach (b).

(f) **Unterfall G** (ev₂ injektiv). Sei w ∈ J ∖ y₀⊙Pol₂. Aus dim J = 7 folgt J = y₀ ⊙ Pol₂ ⊕ ⟨w⟩. Dann ist ker W = J + s⊙J + t⊙J (Zusatz in Abschnitt 3) = y₀ ⊙ Pol₃ + ⟨w, s⊙w, t⊙w⟩, denn Pol₂ + s·Pol₂ + t·Pol₂ = Pol₃. Es ist dim(y₀ ⊙ Pol₃) ≤ 10, und 13 = dim ker W ≤ 10 + 3. Also gilt überall Gleichheit: dim(y₀ ⊙ Pol₃) = 10 (ev₃ injektiv, kein Polynom vom Grad ≤ 3 verschwindet auf allen P_τ, τ ∈ Σ), und die Summe ist direkt.

(g) **Unterfall B** (dim y₀ ⊙ Pol₂ = 5). Dann ist ker ev₂ = K·g₀ mit g₀ ≠ 0. Nach (e) ist g₀ ∉ Pol₁, also hat g₀ Grad genau 2. J = y₀ ⊙ Pol₂ ⊕ ⟨w₁, w₂⟩. Wie in (f): ker W = y₀ ⊙ Pol₃ + ⟨w_j, s⊙w_j, t⊙w_j⟩. Der Kern von ev₃ enthält g₀·Pol₁ (Dimension 3, weil g₀ ≠ 0 und Pol ein Integritätsbereich ist), also dim(y₀ ⊙ Pol₃) ≤ 7, und 13 ≤ 7 + 6. Also Gleichheit: dim(y₀ ⊙ Pol₃) = 7, ker ev₃ = g₀·Pol₁, und die Summe ist direkt. ∎

**Bemerkung (Vergleich mit S4-05).** Unterfall G ist genau die Form, die `versuche/s4-blind-r1.md` (Abschnitt 5) als Relaxierung mit zwei Gewichten w₁, w₂ angesetzt hat (dort J = w₁·Pol₂ + ⟨w₂⟩). Dort ist gezeigt, dass die Bedingungen aus Lemma 2 von Tsyganov u. a. allein in dieser Form erfüllbar sind. A2 sagt umgekehrt: Jede echte Zerlegung im Restfall hat (im Unterfall G) genau diese Form. Damit entscheiden Bedingungen, die nur J, s, t und ker W betreffen, den Fall nicht. Gebraucht wird Information, die außerhalb dieser Abstraktion liegt. A4 bis A6 holen solche Information herein (die Vektoren r_i, also die zweite Spalte von A, und die Variation von p).

---

## 5. A3: Im Unterfall B kein Geradenpaar

*Beweis.* Sei G₀(X₀, X₁, X₂) := X₀² g₀(X₁/X₀, X₂/X₀) die Homogenisierung, eine quadratische Form. Da g₀ Grad genau 2 hat, ist G₀ nicht durch X₀ teilbar. Alle Punkte (1 : s_τ : t_τ), τ ∈ Σ, liegen auf {G₀ = 0}.

Angenommen, G₀ ist reduzibel. Da K algebraisch abgeschlossen ist, ist G₀ = ℓ₁ℓ₂ mit Linearformen ℓ₁, ℓ₂ (möglicherweise proportional), und keine ist ein Vielfaches von X₀. Wähle eine Linearform ℓ₃, die nicht proportional zu ℓ₂ ist. Sei h(s, t) die Dehomogenisierung von ℓ₁ℓ₃, ein Polynom vom Grad ≤ 2. Es ist nicht proportional zu g₀ (sonst ℓ₁ℓ₃ ∝ ℓ₁ℓ₂, also ℓ₃ ∝ ℓ₂). Also ist y := y₀ ⊙ h(s, t) ≠ 0 (ker ev₂ = K·g₀), und y ∈ J ⊆ f₀(K^{2×7}).

Träger von y: τ ∈ Σ mit ℓ₁(1, s_τ, t_τ) ≠ 0. Für diese τ ist ℓ₂(1, s_τ, t_τ) = 0, weil P_τ auf {ℓ₁ℓ₂ = 0} liegt. Also liegt der Träger von y auf der Geraden {ℓ₂ = 0} (eine echte Gerade, da ℓ₂ kein Vielfaches von X₀ ist und (c₁, c₂) ≠ 0). Das widerspricht (SN2) in der Form aus 2.2.

Also ist G₀ irreduzibel. Über algebraisch abgeschlossenem K ist ein singulärer ebener Kegelschnitt ein Geradenpaar oder eine doppelte Gerade. Also ist {G₀ = 0} ein glatter Kegelschnitt. ∎

Folgerung: Im Unterfall B liegen alle Punkte P_τ, τ ∈ Σ, auf einem glatten Kegelschnitt C₀. Auf C₀ ≅ P¹ werden Formen vom Grad k zu binären Formen vom Grad 2k; das passt zu dim(y₀ ⊙ Pol₂) = 5 und dim(y₀ ⊙ Pol₃) = 7.

**Lücke B (offen):** Den Unterfall B mit glattem Kegelschnitt habe ich nicht ausgeschlossen. Ein Versuch mit (SN2) scheitert: Ein Vektor y₀ ⊙ h mit Träger auf einer Geraden bräuchte ein h, das auf mindestens |Σ| − 2 ≥ 20 Punkten von C₀ verschwindet, nach Bézout aber verschwindet ein h ∉ K·g₀ auf höchstens 4 Punkten von C₀ (mit Vielfachheit; mehrfache Indizes zum selben Punkt zählen hier nur einmal, die Abschätzung bleibt in jedem Fall weit entfernt).

---

## 6. A4: Trägerschranke

*Beweis im Unterfall G.* Sei V₆ := {v(y₀ ⊙ g) : g ∈ Pol₂} ⊆ K^{1×7}, Dimension 6 (ev₂ injektiv, v Isomorphismus), und v_w := v(w). Dann ist K^{1×7} = V₆ ⊕ ⟨v_w⟩.

Betrachte die 34 Vektoren

- (K1) y₀ ⊙ Pol₃ (10 Stück, Basis), (K2) w, s⊙w, t⊙w (3),
- (B1) r_i ⊙ y₀ ⊙ g für i = 0, 1, 2 und g aus einer Basis von Pol₂ (18), (B2) r_i ⊙ w für i = 0, 1, 2 (3).

(K1) und (K2) bilden nach A2(f) eine Basis von ker W. Nach (I) ist W(r_i ⊙ y₀ ⊙ g) = e_i ⊗ v(y₀⊙g) und W(r_i ⊙ w) = e_i ⊗ v_w. Diese 21 Bilder sind e_i ⊗ (Basis von K^{1×7}), also eine Basis von K^{3×7}. Eine lineare Relation zwischen allen 34 Vektoren ergibt nach Anwenden von W, dass die Koeffizienten von (B1), (B2) null sind, dann wegen der Basis von ker W auch die von (K1), (K2). **Also bilden die 34 Vektoren eine Basis von K³⁴.**

(K1) und (B1) haben ihren Träger in Σ und sind 28 linear unabhängige Vektoren. Also **|Σ| ≥ 28**, |Π| ≤ 6.

Projektion auf die Koordinaten in Π: (K1) und (B1) werden 0, also spannen die Projektionen von (K2) und (B2) ganz K^Π auf. Das sind w|_Π ⊙ (1, s, t, r₀, r₁, r₂)|_Π.
- Daraus folgt w_τ ≠ 0 für alle τ ∈ Π (sonst wäre die Koordinate τ nicht erreichbar).
- Die sechs Vektoren 1, s, t, r₀, r₁, r₂, eingeschränkt auf Π, spannen K^Π auf. Ihre τ-Einträge sind α_τ(e_{0,0})/d₀,τ, …, α_τ(e_{2,1})/d₀,τ, also bis auf den Faktor 1/d₀,τ die sechs Koordinaten von α_τ. Eine lineare Relation Σ_{τ∈Π} c_τ α_τ = 0 gäbe einen Vektor (c_τ d₀,τ)_τ ≠ 0 in K^Π, der auf alle sechs Vektoren senkrecht steht. Also sind **die α_τ, τ ∈ Π, linear unabhängig**.

Zeilen in Π: Für v ∈ K^{1×7} ist ℬ(x_v) = d₀⁻¹ ⊙ f₀(x_v), und f₀(x_v) ∈ J = y₀⊙Pol₂ ⊕ ⟨w⟩. Auf Π ist y₀ = 0, also ist f₀(x_v)|_Π = φ(v)·w|_Π mit der Koordinatenform φ (Koeffizient von w). Also **β_τ(e₁ ⊗ v) = φ(v)·w_τ/d₀,τ für alle τ ∈ Π**: Die Linearformen v ↦ β_τ(e₁ ⊗ v), τ ∈ Π, sind Vielfache der einen Form φ. ∎

*Beweis im Unterfall B.* Wie oben mit V₅ := v(y₀ ⊙ Pol₂) (Dimension 5), (K1) 7 Vektoren, (B1) 15 Vektoren, (K2) und (B2) je 6. Die 28 + 6 = 34 Vektoren bilden eine Basis, (K1) und (B1) liegen in K^Σ: **|Σ| ≥ 22**. ∎

**Folgerung (Polynomraum der Dimension 28, Unterfall G).** Schreibt man α_τ als 3×2-Matrix a_τ, so sind die Einträge von y₀ ⊙ g(s,t) und r_i ⊙ y₀ ⊙ g(s,t) (bis auf den gemeinsamen Faktor y₀,τ/d₀,τ³) Werte kubischer Formen in den sechs Einträgen von a_τ, nämlich genau der Formen, die in der Spalte 0 mindestens den Grad 2 haben (Bigrad (3,0) und (2,1) in Spalte 0 und Spalte 1). Dieser Raum P₀ hat Dimension 10 + 18 = 28. A4 sagt: **Die Auswertung von P₀ an den Matrizen a_τ, τ ∈ Σ, ist injektiv.**

---

## 7. A5 und A6: Variation der Normierung

### 7.1 A5

*Beweis.* (i) **Gute Richtungen.** In `yang_n3.md`, Lemma A, Schritt 4 ist P(u, p) = Π_τ α_τ(up) · Π_{Σ′∈𝒮} q_{Σ′}(p) ein Polynom ≠ 0, und jede Stelle mit P ≠ 0 liefert nach Schritt 5 eine stark normalisierte Zerlegung. Für festes p ist P(·, p) als Polynom in u genau dann ≠ 0, wenn jedes Polynom u ↦ α_τ(up) ≠ 0 ist (das heißt a_τ·p ≠ 0, mit a_τ als 3×2-Matrix und p als Spalte geschrieben) und Π q_{Σ′}(p) ≠ 0. Die erste Bedingung verletzt höchstens eine Klasse [p] je τ (wenn a_τ Rang 1 hat), die zweite nur die Nullstellen einer binären Form ≠ 0 (q_{Σ′} ist homogen in p und ≠ 0), also endlich viele Klassen. Für jedes andere p gibt es u mit P(u, p) ≠ 0, weil K unendlich ist. Die Länge bleibt 34 (Basiswechsel).

(ii) **Übersetzung.** Im Basiswechsel zu (u, p) (Schritt 5: S hat die Spalten u₀ = u, u₁, u₂, T hat die erste Zeile p) gilt D′(e_{i,0}) = D(u_i p) und ℬ′(x) = ℬ(T⁻¹x). Für x ∈ U, x = e₁ ⊗ v (Zeile 1 gleich v), ist T⁻¹x = (T⁻¹e₁) ⊗ v, und k_p := T⁻¹e₁ erfüllt p·k_p = (T T⁻¹)_{0,1} = 0. Also ist J′ = d′₀ ⊙ Ĵ_p mit d′₀ := (α_τ(u p))_τ, und Pol_k(s′, t′) = (d′₀)^{−k} ⊙ X_p^{⊙k}, wobei X_p^{⊙k} der Spann der k-fachen Produkte von Vektoren aus X_p ist (s′ = (α_τ(u₁p)/α_τ(up))_τ usw., und X_p = span(d′₀, d′₀⊙s′, d′₀⊙t′)). Mit z_p := y₀′ ⊙ (d′₀)^{−3}:
  - y₀′ ⊙ Pol₂ = (d′₀)^{−2} ⊙ y₀′ ⊙ X_p^{⊙2}, und das liegt in J′ = d′₀ ⊙ Ĵ_p, also z_p ⊙ X_p^{⊙2} ⊆ Ĵ_p;
  - y₀′ ⊙ Pol₃ = z_p ⊙ X_p^{⊙3} ⊆ ker W′ = ker W (W′ = S⁻¹∘W).
  Die Dimensionen übertragen sich, weil Multiplikation mit dem nirgends verschwindenden d′₀ injektiv ist. Träger von z_p = Träger von y₀′.

(iii) **Abhängigkeit von u.** Ĵ_p, X_p und ker W hängen nur von p ab. Ob auch z_p (bis auf einen Faktor) nur von p abhängt, habe ich **nicht gezeigt** (Lücke A5-iii): In invarianter Form ist (d′₀)^{−1} ⊙ f₀′(N′) = {ŷ ∈ Ĵ_p : (d′_i/d′₀) ⊙ ŷ ∈ Ĵ_p für i = 1, 2}, und diese Bedingung enthält noch d′₀, also u. Meine erste Fassung von A5 hat die Unabhängigkeit von u behauptet; das nehme ich zurück. Für A6 wird sie nicht gebraucht: A6 benutzt nur, dass es zu jedem guten p **ein** u gibt, und arbeitet mit diesem. ∎

### 7.2 A6

*Beweis.* Unendlich viele Klassen [p] sind gut (A5(i)), K ist unendlich. Jedem guten p (mit gewähltem u) ordnen wir den Unterfall (G oder B) und Π_p zu. Es gibt nur endlich viele Werte, also hat eine unendliche Menge 𝒫 guter Klassen denselben Unterfall und dasselbe Π.

Sei der Unterfall G und τ, τ′ ∈ Π. Für p ∈ 𝒫 sind nach A4 (im normalisierten Rahmen, zurückübersetzt mit 7.1(ii)) die Vektoren b_τ(p) := β_τ^⊤ k_p ∈ K⁷ (die Form v ↦ β_τ(k_p v)) und b_τ′(p) proportional, und beide ≠ 0 (w_τ ≠ 0 und d′₀ ohne Nullen). Dabei hängt k_p linear von p ab (in Koordinaten k_p = (−p₁, p₀)).

- Hat β_τ Rang 2, so ist p ↦ b_τ(p) injektiv. Hat β_τ′ Rang 1, β_τ′ = c ⊗ x, so ist b_τ′(p) ∈ K·x für alle p, und b_τ(p) ∈ K·x gilt für höchstens eine Klasse [p]. Widerspruch zur Unendlichkeit von 𝒫. Also haben alle β_τ (τ ∈ Π) denselben Rang.
- **Alle Rang 2.** Wähle drei paarweise nicht proportionale p₁, p₂, p₃ ∈ 𝒫, p₃ = a p₁ + b p₂ mit a, b ≠ 0. Dann b_τ′(p_j) = c_j b_τ(p_j), und aus der Linearität b_τ′(p₃) = a c₁ b_τ(p₁) + b c₂ b_τ(p₂) = c₃ (a b_τ(p₁) + b b_τ(p₂)). Da b_τ(p₁), b_τ(p₂) linear unabhängig sind (Rang 2), folgt c₁ = c₂ = c₃, also b_τ′ = c₁ b_τ als lineare Abbildungen, also β_τ′ = c₁ β_τ.
- **Alle Rang 1.** β_τ = c_τ ⊗ x_τ, b_τ(p) = (c_τ·k_p) x_τ. Proportionalität für ein p mit c_τ·k_p ≠ 0 ≠ c_τ′·k_p gibt x_τ ∝ x_τ′. ∎

**Was A6 nicht leistet:** Im Fall „alle Rang 2“ ist der Anteil der Π-Terme β* ⊗ (Σ_{τ∈Π} c_τ α_τ ⊗ C_τ), ein Tensor vom Rang |Π| in zwei Faktoren. Wegen der Minimalität der Länge 34 muss dieser Rang genau |Π| sein (die α_τ sind nach A4 ohnehin unabhängig). Daraus folgt nichts Widersprüchliches.

---

## 8. Lücke Λ: Wo der Ausschluss hängt

Nach A1 bis A6 sieht eine Zerlegung der Länge 34 im Unterfall G für jede gute Richtung p so aus:

- 34 Matrizen a_τ ∈ K^{3×2}. Mit λ_τ := a_τ p und μ_τ := a_τ p′ (p′ ergänzt p zur Basis) ist z_p ⊙ (Formen vom Grad 2 in λ) ⊆ Ĵ_p, z_p ⊙ (kubische Formen in λ) ⊆ ker W, und W(z_p ⊙ Q(λ) ⊙ (μ·u)) = c·u ⊗ v_Q (aus (I), c = p′·k_p ≠ 0).
- Der Träger Σ_p von z_p hat mindestens 28 Elemente, die höchstens 6 übrigen Zeilen haben nach A4 und A6 eine sehr einfache B-Seite.

Diese Struktur ist für **eine** Richtung p widerspruchsfrei: Sie beschreibt nur die Einschränkung der Zerlegung auf B ∈ k_p ⊗ K^{1×7}, und der dort entstehende Tensor A ↦ (A k_p) ⊗ v hat Rang 21. Eine Zerlegung dieses Teiltensors mit 34 Termen in genau dieser Form lässt sich leicht hinschreiben (vermutet, nicht ausgeführt: man nimmt 28 Punkte in allgemeiner Lage auf Σ und wählt W auf der Basis aus A4 passend). Ein Widerspruch kann also nur aus der **Verträglichkeit über mehrere Richtungen p** kommen, also aus der vollen Tensoridentität. Genau diesen Schritt habe ich nicht geschafft. Das ist Lücke Λ.

Die Struktur, die eine solche Verträglichkeit liefern müsste, ist (vermutet, als Arbeitsprogramm):
- Für alle p ∈ 𝒫 liegt z_p ⊙ X_p^{⊙3} im **festen** 13-dimensionalen Raum ker W, und z_p ⊙ X_p^{⊙2} im **festen** 14-dimensionalen Raum ℬ(K^{2×7}).
- Die 28-dimensionalen Räume P_p (kubische Formen auf K^{3×2}, die in der Richtung „Spalte p“ mindestens Grad 2 haben) müssen an den Punkten a_τ, τ ∈ Σ_p, injektiv ausgewertet werden, für unendlich viele p. Zwei verschiedene p ergeben P_p ⊕ P_p′ = alle 56 kubischen Formen, ausgewertet an nur 34 Punkten.

---

## 9. Gescheiterte Ansätze (mit Stelle des Scheiterns)

1. **Invarianz von f₀(N) unter s und t** (Weg aus `versuche/s4-blind-r1.md`, Lücke L3): Wäre s⊙J_N, t⊙J_N ⊆ J_N, so gäbe es einen gemeinsamen Eigenvektor und (SN2) wäre verletzt (wie Lemma 9 in `yang_n4.md`). **Scheitert:** A2 zeigt J_N = y₀⊙Pol₁, und s⊙J_N ⊆ J_N hieße y₀ ⊙ Pol₂ ⊆ y₀ ⊙ Pol₁, also dim S = 3 statt 1. Die Invarianz ist im Restfall also nicht nur unbewiesen, sondern **falsch** (behauptet, folgt aus A1 und A2).

2. **Nur J, s, t und ker W benutzen** (Abstraktion von Tsyganov u. a., Lemma 2): **Scheitert grundsätzlich.** A2 zeigt, dass jede echte Zerlegung im Unterfall G genau die Form der erfüllbaren Relaxierung aus `versuche/s4-blind-r1.md`, Abschnitt 5, hat. Ohne die zweite Spalte von A (die Vektoren r_i) oder die Variation von p ist der Fall nicht zu entscheiden.

3. **Zählung mit ker L und Φ** (Gleichheit in Lemma H, ker L = N² + σ(N), Φ surjektiv): Ich habe in beiden Unterfällen nachgezählt, dass diese Gleichheiten sich aus A2 schon ergeben. Im Unterfall B zum Beispiel: Die Paare (q₁, q₂) ∈ (Pol₂/Kg₀)² mit s q₁ + t q₂ ∈ Pol₂ + g₀Pol₁ bilden einen Raum der Dimension 10 − 2 = 8 = dim ker L. **Scheitert:** kein Widerspruch, keine neue Bedingung.

4. **Rang der Kombinationen F_γ** (ρ = 4, Kern = N): Im Unterfall G hat γ₁F₁ + γ₂F₂ auf J/J_N das Bild λ₁·(homogene Quadriken) plus γ-Bild von w, Rang 3 + 1 = 4; im Unterfall B 2 + 2 = 4 für allgemeines γ. **Scheitert:** mit A2 verträglich.

5. **(SN2) gegen Unterfall B:** schließt das Geradenpaar aus (A3), aber nicht den glatten Kegelschnitt (Abschnitt 5, Lücke B).

6. **Variation von p über die Träger** (A6): ergibt nur, dass die höchstens 6 Restzeilen eine gemeinsame B-Richtung haben. **Scheitert:** Der Π-Anteil hat dann Rang |Π|, was der Minimalität nicht widerspricht. Auch Π = ∅ ist durch nichts ausgeschlossen.

7. **Infinitesimale Variation p + εq** (Koeffizienten von ε in z(ε) ⊙ c(λ + εκ) ∈ ker W): Ich habe nur den Koeffizienten von ε¹ angesehen. Er gibt W(z₁ ⊙ (λ·u)³) = −3c·u ⊗ v_{(λ·u)²} für den Ableitungsvektor z₁ (Charakteristik ≠ 3). **Scheitert:** eine weitere Identität, kein Widerspruch. Die Wahl von z(ε) als Polynom in ε (über K(ε)) habe ich nicht ausgeschrieben. Status vermutet.

8. **Bündelgrade auf P¹** (die Räume Ĵ_p bilden ein Bündel O(−1)⁷ ⊂ O³⁴, darin z_p ⊙ X_p^{⊙2} ein Teilbündel vom Rang 6): **Scheitert:** Injektive Abbildungen O(a)⁶ → O(−1)⁷ gibt es für jedes a ≤ −1, die Grade widersprechen sich nicht. Status vermutet (nur überschlagen).

---

## 10. Liste der Lücken

| Nr. | Stelle | Art |
|---|---|---|
| Λ | Abschnitt 8 | **Hauptlücke**: kein Widerspruch aus A1 bis A6. Der Restfall ist nicht ausgeschlossen |
| B | Abschnitt 5 | Unterfall B mit glattem Kegelschnitt nicht ausgeschlossen |
| A5-iii | Abschnitt 7.1 | Ob z_p von der Wahl von u abhängt, ist offen; A6 braucht es nicht |
| Q | Abschnitt 2.1 | A1 bis A6 setzen die Schranke R ≥ 34 über jedem Körper (Yang Satz 1, im Repo B-002) und die Lemmata aus `yang_n3.md` als gegeben voraus; ich habe sie nicht nachgeprüft |

Charakteristik: A1 bis A6 benutzen keine Division durch 2 oder 3. Nur Ansatz 7 in Abschnitt 9 braucht Charakteristik ≠ 3.

## 11. Status

| Aussage | Status |
|---|---|
| A1, A2, A3, A4 | behauptet (ausgeschrieben) |
| A5 | behauptet (Teile (i), (ii) ausgeschrieben; die Frage A5-iii gehört nicht zur Aussage) |
| A6 | behauptet |
| Restfall (4, 6, 4) unmöglich, R(⟨3,2,7⟩) ≥ 35 | **nicht gezeigt** (Lücke Λ) |
| Arbeitsprogramm in Abschnitt 8, Ansätze 7 und 8 | vermutet |
