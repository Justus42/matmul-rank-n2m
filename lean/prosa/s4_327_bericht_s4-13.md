# S4-13: Prüfbericht zu B-022, B-023, B-024 (Strukturaussagen zum Restfall von ⟨3,2,7⟩ bei Länge 34)

- Auftrag: S4-13, Protokoll 0.6, Stufe 4, Rolle Prüfer. Datum: 26.11.2026.
- Gelesen (nur Positivliste, Stand `main` 35e2449): `CLAUDE.md`, `PROTOKOLL.md` Abschnitt 5, `behauptungen/B-022.md`, `B-023.md`, `B-024.md`, `lean/prosa/s4_327_spurA_r2_ausschluss.md` (Stand 8c96b57, unverändert auf `main`), `versuche/s4-blind-r2.md` (Stand bc9c772, unverändert), `versuche/s4-spurB-r2.md` und `versuche/s4-spurB-r2/` (Stand b9c134c, unverändert), `lean/prosa/yang_n3.md`.
- Kein Subagent, kein Fremdmodell, kein Kontakt nach außen, kein Gedächtniseintrag geschrieben. Ein Rechenblock unter 1 Sekunde (Abschnitt 8).
- Ich setze keinen Status. Die Urteile unten sind Prüferurteile je Teilaussage.

---

## 0. Offenlegung

### 0.1 Eingeblendete Gedächtniseinträge

1. Vor jeder Lektüre: der Index `team/silo/MEMORY.md`. Er nennt die Einzeleinträge `verfahren-datenformat` und `lean-project-ci` nur mit Namen, ihr Inhalt wurde nicht eingeblendet. Inhalt des Index: Projektangaben, Regeln für den Orchestrator, Fremdmodell-Hinweise. Nichts zu B-022 bis B-024, keine Urteile, keine Zählerstände. Gemeldet im Thread vor dem ersten Lesen.
2. Während der Arbeit (nach dem Lesen der Artefakte, vor dem Schreiben der Urteile) zwei Einzeleinträge:
   - `aussagen-abgleich-n3`: Hinweise zur Bridge (Repo dort nicht freigegeben) und zum lokalen Lean-Bau.
   - `gemini-bridge`: Hinweise zur Bridge, Ausgabengrenze von Gemini, ein Plan für einen „S1-05 Nachtrag“ zu `yang_n3.md` mit Dateiname `lean/prosa/yang_n3_pruefung.md`.
   Keiner der beiden enthält ein Urteil zu B-022, B-023 oder B-024 oder ein erwünschtes Ergebnis. Den genannten Prüfbericht zu `yang_n3.md` habe ich nicht gelesen.

### 0.2 Spuren nach Protokoll 5.4 (nicht nachgelesen)

- `s4_327_spurA_r2_ausschluss.md` (B-022) nennt im Kopf die Dateien `lean/prosa/s4_327_bericht_s4-01.md` bis `s4-03.md`, `behauptungen/B-017.md` bis `B-019.md`, und in Abschnitt 2.1 „S4-01 (Abschnitt 3.12) und S4-02 (T4)“ mit dem Stichwort „r′ ≤ r“. In Abschnitt 3 nennt sie B-018, B-019, Lemma 15(b) und `yang_n4.md`.
- `s4-spurB-r2.md` (B-024) nennt `behauptungen/B-017.md`, `erkundung/s3-04-restfaelle-327.md` (Abschnitt 4, Probe 4 und Abschnitt 5.1, auf den der Beweis von Satz K verweist), `versuche/s4-blind-r1.md`, Verfahrensdateien in `verfahren/` und Prüfprogramme in `pruefer/`.
- `s4-blind-r2.md` (B-023) gibt den Gedächtnisindex und vier Einzeleinträge wörtlich wieder (`hk-verfahren-a10`, `lean-upper-3x2x6`, `git-regeln`, `verfahren-randfaelle-s1-04`). Darin stehen Datei- und Formathinweise, keine Urteile zu B-022 bis B-024.
- `git log` auf `yang_n3.md` zeigte die Commit-Nachricht „Merge pull request #81: S2-50 Prüferbericht B-016“.

Keine dieser Spuren enthält ein Urteil zu B-022, B-023 oder B-024. Ich habe keine der genannten Dateien geöffnet. Die Programme in `versuche/s4-spurB-r2/` lesen Verfahrensdateien aus `verfahren/`. Weil diese nicht auf der Positivliste stehen, habe ich die Programme **nicht** ausgeführt, nur gelesen (Abschnitt 5.5).

---

## 1. Ergebnis in Kürze

| Behauptung | Teilaussage | Urteil | Stelle |
|---|---|---|---|
| B-022 | A1 | hält | Abschnitt 3.1 |
| B-022 | A2 (mit G und B) | hält | 3.2 |
| B-022 | A3 | hält | 3.3 |
| B-022 | A4 (G und B) | hält | 3.4 |
| B-022 | A5 | hält | 3.5 |
| B-022 | A6 | hält | 3.6 |
| B-023 | Satz G (a) bis (g) | hält, jede Teilaussage | 4 |
| B-024 | K1 | hält | 5.2 |
| B-024 | K2 | **hält nicht in der wörtlichen Fassung**. Der Beweis trägt sie nur nach der zusätzlichen Skalierung a_r[0][0] = 1, die nicht zu den erlaubten Basiswechseln gehört. Berichtigte Fassung hält | 5.3 |
| B-024 | K3 | hält | 5.4 |
| B-024 | Basiswechsel „B ↦ BP, C ↦ CP“ | Schreibfehler, Existenz unberührt | 5.1 |

Die drei Texte widersprechen einander in der Sache nicht. B-023 (Satz G) und B-022 (A1, A2, A4) sagen im Kern dasselbe, B-022 ist an mehreren Stellen stärker (A3, A4 über Π, A5, A6), B-023 an einer (Teil (d)). B-024 ist eine schwächere Koordinatenfassung eines Teils von A2 bzw. Satz G (c), (e), mit der genannten Normierungslücke in K2. Abgleich in Abschnitt 6.

Gemeinsame Grundlage aller drei sind die Lemmata aus `yang_n3.md` (Status dort: behauptet). Ich habe die benutzten Lemmata nachvollzogen (Abschnitt 2) und keinen Fehler gefunden. Die Urteile oben gelten relativ zu dieser Grundlage.

---

## 2. Grundlage: `yang_n3.md`

Benutzt werden von allen drei Texten: Lemma A (starke Normalisierung, nur für die Existenz der Normalform und in A5), G1 bis G4, Lemma B (Dimensionszuwachs), Lemma C (Inklusionen, q = R − 4m), Lemma F mit Ungleichung (G), Lemma H, Lemma I.

Selbst nachvollzogen (Zeile für Zeile gelesen und die Rechnungen von Hand nachgerechnet): G1 bis G4, R3, Lemma B (Fahnenargument), Lemma C, D, E, Lemma F (die Rechnung mit D(e_{0,1}), D(e_{1,0}), D(e_{2,0}) und das Kürzen von D(e_{0,0})), Folgerung (G), Lemma G, Lemma H (die induzierte Abbildung N/σ⁻¹(N×N) → ker L/(N×N) ist injektiv, daraus dim N − dim S ≤ Δ), Lemma I. Lemma A habe ich gelesen und die Schritte 1 bis 5 nachvollzogen. Kein Fehler gefunden.

Für die Prüfung wichtig: Ab Abschnitt 6 von `yang_n3.md` wird nur die starke Normalisierung (SN1), (SN2) benutzt, kein unendlicher und kein algebraisch abgeschlossener Körper. Die Existenz der Normalform (Lemma A) braucht einen unendlichen Körper und dass kein α_r die Nullform ist.

---

## 3. B-022 (Strukturaussagen A1 bis A6)

Bezeichnungen wie im Artefakt: d_i, d′_i Diagonalen von D(e_{i,0}), D(e_{i,1}); s = d₁/d₀, t = d₂/d₀, r_i = d′_i/d₀; J = f₀(U); y ⊙ Pol_k.

### 3.1 A1: hält

Selbst nachgerechnet (Artefakt Abschnitt 3): Aus (G) mit m = 7, q = 6: rk H ≤ rk L − 2 ≤ 4, also dim N ≥ 3. Lemma I: Δ ≥ 2. Zusammen rk L + 2 ≤ 2 rk H ≤ 2 rk L − 4, also rk L ≥ 6, mit rk L ≤ q = 6 Gleichheit, dann rk H = 4, Δ = 2, dim N = 3. Lemma H: dim S ≥ 1. Lemma B auf S mit f₀(S) + f₁(S) + f₂(S) ⊆ f₀(N): dim S ≤ 1.

Anmerkungen:
- Der Zusatz „L surjektiv, also J + s⊙J + t⊙J = ker W“ stimmt: im L = (J + f₁(U) + f₂(U))/J ⊆ ker W/J, beide Dimension 6, und f₁(U) = s⊙J, f₂(U) = t⊙J.
- Die Liste der benutzten Lemmata nennt Lemma G. Es wird in der Rechnung nicht gebraucht (Lemma I genügt). Unschädlich.
- Gilt sogar für jeden Körper, sobald die Zerlegung stark normalisiert ist. Die Formulierung „schon für K unendlich“ ist also richtig, aber nicht scharf.

### 3.2 A2: hält

Selbst nachvollzogen, Schritt für Schritt (Artefakt Abschnitt 4):
- (a), (b): f₀(N) = {y ∈ J : s⊙y, t⊙y ∈ J}, f₀(S) = ⟨y₀⟩. y₀, s⊙y₀, t⊙y₀ liegen in f₀(N) (Definition von S) und sind nach (SN2) unabhängig, also f₀(N) = y₀ ⊙ Pol₁.
- (c): f₀(N) + s⊙f₀(N) + t⊙f₀(N) ⊆ J, das ist y₀ ⊙ Pol₂.
- (d): ≥ 5 aus Lemma B für N, ≤ 6 = dim Pol₂.
- (f) Unterfall G: ker W = y₀ ⊙ Pol₃ + ⟨w, s⊙w, t⊙w⟩ (aus A1-Zusatz und Pol₂ + s·Pol₂ + t·Pol₂ = Pol₃). Dimensionsvergleich 13 ≤ 10 + 3 erzwingt dim y₀ ⊙ Pol₃ = 10 und Direktheit. Die Aussage „für jedes w ∈ J außerhalb“ stimmt, der Beweis benutzt nichts über w außer w ∉ y₀ ⊙ Pol₂.
- (g) Unterfall B: ker ev₂ = K·g₀, Grad genau 2 weil ev₁ injektiv. ker ev₃ ⊇ g₀·Pol₁ (Dimension 3), also dim y₀ ⊙ Pol₃ ≤ 7, und 13 ≤ 7 + 6 erzwingt Gleichheit und Direktheit.

Stillschweigend: nichts. Algebraische Abgeschlossenheit wird in A2 nicht benutzt. A2 gilt für jede stark normalisierte Zerlegung der Länge 34 über jedem Körper.

### 3.3 A3: hält

Selbst nachvollzogen (Artefakt Abschnitt 5). G₀ ist nicht durch X₀ teilbar (Grad von g₀ genau 2), also ist bei einer Zerlegung G₀ = ℓ₁ℓ₂ keiner der Faktoren proportional zu X₀. Mit ℓ₃ nicht proportional zu ℓ₂ ist h = deh(ℓ₁ℓ₃) nicht proportional zu g₀, also y = y₀ ⊙ h ≠ 0 in J, und sein Träger liegt auf der echten Geraden {ℓ₂ = 0}. Das verletzt (SN2) in der Form aus Artefakt 2.2, die ich ebenfalls nachgerechnet habe ((c₀ + c₁s + c₂t) ⊙ y = 0 ist genau die lineare Abhängigkeit von f₀(x), f₁(x), f₂(x)). Der Fall der doppelten Geraden (ℓ₁ ∝ ℓ₂) ist abgedeckt.

„Irreduzibel ⇒ glatt“: Ein singulärer ebener Kegelschnitt über einem algebraisch abgeschlossenen Körper ist ein Kegel über einer binären quadratischen Form und zerfällt. Das gilt in jeder Charakteristik, auch 2.

Benutzt: K algebraisch abgeschlossen (für das Zerfallen). Über einem nicht abgeschlossenen Körper liefert dasselbe Argument nur „g₀ zerfällt nicht über dem Grundkörper“, weil (SN2) über dem Grundkörper nicht (SN2) über dem Abschluss ergibt. Das ist mit (V) gedeckt.

### 3.4 A4: hält

Selbst nachvollzogen (Artefakt Abschnitt 6).
- Unterfall G: Die Bilder unter W von (B1), (B2) sind nach Identität (I) die Vektoren e_i ⊗ (Basis von K^{1×7}), also eine Basis von K^{3×7}. Zusammen mit der Basis (K1), (K2) von ker W folgt, dass die 34 Vektoren eine Basis von K³⁴ sind. (K1), (B1) haben Träger in Σ und sind 28 unabhängige Vektoren, also |Σ| ≥ 28.
- Π-Aussagen: Die Projektion auf K^Π ist surjektiv, (K1), (B1) gehen auf 0, also spannen w|_Π ⊙ (1, s, t, r₀, r₁, r₂)|_Π ganz K^Π auf. Daraus w_τ ≠ 0. Die Zeilen (1, s_τ, t_τ, r₀τ, r₁τ, r₂τ) sind α_τ(e_{0,0}), α_τ(e_{1,0}), α_τ(e_{2,0}), α_τ(e_{0,1}), α_τ(e_{1,1}), α_τ(e_{2,1}), geteilt durch d₀,τ. Sie haben vollen Rang |Π|, also sind die α_τ (τ ∈ Π) linear unabhängig. Die B-Seite: f₀(x_v)|_Π = φ(v)·w|_Π, also β_τ(e₁ ⊗ v) = φ(v) w_τ/d₀,τ. Stimmt.
- Unterfall B: 7 + 15 + 6 + 6 = 34 Vektoren, gleiche Schlussweise, |Σ| ≥ 22. Stimmt.

Identität (I), W(r_i ⊙ y) = e_i ⊗ v(y), habe ich aus (Z′) nachgerechnet und zusätzlich an einer Probe (Abschnitt 8) bestätigt. Stillschweigend: nichts. Algebraische Abgeschlossenheit wird nicht benutzt.

Die „Folgerung (Polynomraum der Dimension 28)“ nach dem Beweis gehört nicht zur Aussage. Die Zählung 10 + 18 = 28 und die Bigrade (3,0), (2,1) habe ich nachgerechnet, sie stimmen.

### 3.5 A5: hält

Selbst nachvollzogen (Artefakt 7.1).
- (i) Für festes p ist P(·, p) ≠ 0 genau dann, wenn alle u ↦ α_τ(up) ≠ 0 sind (verletzt höchstens eine Klasse [p] je τ mit Rang a_τ = 1) und Π q_{Σ′}(p) ≠ 0 (binäre Form ≠ 0, endlich viele projektive Nullstellen). Dann gibt es u über dem unendlichen K. Stimmt.
- (ii) Die Übersetzung J′ = d′₀ ⊙ Ĵ_p, k_p = T⁻¹e₁ mit p·k_p = (TT⁻¹)_{0,1} = 0, X_p = span(d′₀, d′₁, d′₂) = d′₀ ⊙ Pol₁(s′, t′), also Pol_k(s′, t′) = (d′₀)^{−k} ⊙ X_p^{⊙k}, und z_p = y′₀ ⊙ (d′₀)^{−3}: Ich habe beide Inklusionen nachgerechnet (y′₀ ⊙ Pol₂ = d′₀ ⊙ z_p ⊙ X_p^{⊙2} ⊆ d′₀ ⊙ Ĵ_p; y′₀ ⊙ Pol₃ = z_p ⊙ X_p^{⊙3} ⊆ ker W′ = ker W). Die Formeln D′(e_{0,0}) = D(up) und f′₀(x_v) = d′₀ ⊙ ℬ(k_p v) habe ich zusätzlich an einer Probe bestätigt (Abschnitt 8).

Anmerkungen:
- „mit Träger Σ wie in A4“ meint das Σ der zu (u, p) normalisierten Zerlegung. Es hängt von p (und womöglich von u) ab. Die Aussage legt das mit „zu einem passend gewählten u“ offen.
- Benutzt wird, dass kein α_τ die Nullform ist. Das folgt aus der Schranke R ≥ 34 über K (Artefakt 2.1, als Lücke Q selbst offengelegt). Das ist eine äußere Voraussetzung, nicht stillschweigend.

### 3.6 A6: hält

Selbst nachvollzogen (Artefakt 7.2). Schubfachschluss über endlich viele (Unterfall, Π). Im Unterfall G sind b_τ(p) = β_τ^⊤ k_p für τ ∈ Π alle Vielfache von φ und ≠ 0. Rang 2 gegen Rang 1: Das Urbild einer Geraden unter der injektiven Abbildung k ↦ β_τ^⊤ k ist höchstens eindimensional, also höchstens eine Klasse [p]. Rang 2: aus drei paarweise nicht proportionalen p folgt c₁ = c₂ = c₃, also β_τ′ = c₁β_τ, weil k_p ganz K² durchläuft. Rang 1: x_τ ∝ x_τ′. Stimmt. Für |Π| ≤ 1 ist die Aussage leer, das widerspricht nichts.

---

## 4. B-023 (Satz G): hält in allen Teilen

Bezeichnungen des Artefakts: Normierung α_t(e₀₀) = 1, also p_i = s bzw. t aus B-022, z_i = r_i, J = b(K^m) = ℬ(U) = f₀(U) (wegen der Normierung), H = ker W, J_k = {y ∈ J : 𝒫^k y ⊆ J}.

Zur Normierung: Die Reskalierung α_t ↦ α_t/α_t(e₀₀), C_t ↦ α_t(e₀₀)·C_t ist eine Zerlegung derselben Länge, ℬ bleibt gleich, f_i wird koordinatenweise mit einer invertierbaren Diagonale multipliziert, (SN2) bleibt erhalten. Die im Artefakt selbst gestellte Prüffrage („liefert Lemma 6 gleichzeitig α_t(e₀₀) = 1 und starke Normierung?“) ist damit mit Ja beantwortet. Die Satzaussage setzt die Normierung ohnehin als Voraussetzung.

Benutzte Tatsachen aus Abschnitt 3 des Artefakts, selbst nachgerechnet: (R1) bis (R4) aus (Z) mit A = e_{ij} und B = [0; v] bzw. [v; 0]; (C4): Die Abbildung K³ ⊗ J₀ → K^{3×m}, (c, y) ↦ W(Σ c_i z_i y) = Σ c_i e_i ⊗ v(y), ist injektiv, also dim 𝒯J₀ = 3 dim J₀ und 𝒯J₀ ∩ H = 0. Y-Gl.1 ist (G) mit rk H = m − n₀ und s = rk L; Y-L8 ist Lemma B; Y-L12 ist Lemma H. Die Nebenbemerkung, τ : N → ker L sei injektiv, stimmt (σ(x) = 0 heißt f₁(x) = f₂(x) = 0, nach (SN2) also x = 0), wird aber nicht gebraucht.

- **(a)** hält. Gleiche Rechnung wie A1, nur in den Größen n₀, s. 𝒫J ⊆ H und gleiche Dimension ergibt 𝒫J = H.
- **(b)** hält.
- **(c)** hält. Der Schritt S = J₂ ist richtig: Für y ∈ J gilt 𝒫y ⊆ J₁ ⇔ 𝒫y ⊆ J und 𝒫²y ⊆ J ⇔ 𝒫²y ⊆ J (wegen 1 ∈ 𝒫). Dann Y-L12 (≥ 1) und Y-L8 (≤ 1), und 𝒫ω = J₁ aus dim 𝒫ω = 3.
- **(d)** hält. Für y ∈ J₃ und ℓ ∈ 𝒫 ist ℓy ∈ J (wegen y ∈ J₁) und 𝒫²(ℓy) ⊆ 𝒫³y ⊆ J, also ℓy ∈ J₂ = ⟨ω⟩, im Widerspruch zu dim 𝒫y = 3. Ein invarianter Unterraum läge in J₃. 𝒫²ω ⊆ J₁ hieße J₁ invariant.
- **(e)** hält. Y-L8 auf J₁.
- **(f)** hält. Fall A wie A2(f). Fall B wie A2(g). „Grad ≤ 2“ ist richtig, aber schwächer als nötig: Q₀ hat Grad genau 2, weil die Auswertung auf Grad ≤ 1 injektiv ist (dim 𝒫ω = 3).
- **(g)** hält. 𝒫³ω ⊆ H, 𝒯𝒫²ω ∩ H = 0 nach (C4), also direkt, 28 bzw. 22 Vektoren mit Träger in Σ. Fall A: Injektivität der gewichteten Auswertung auf Grad ≤ 3 heißt keine Kubik durch alle Punkte, also mindestens 10 verschiedene Punkte. Fall B: Q₀ verschwindet auf allen Punkten.

Körper: Der Beweis von Satz G benutzt nur die Normierung, keinen unendlichen Körper. Die Annahme „K unendlich“ in Abschnitt 3 des Artefakts dient nur der Existenz der Normierung. Für die Existenz braucht man außerdem, dass kein α_t die Nullform ist (das liefert die Schranke R ≥ 34, im Artefakt nicht genannt). Für die Satzaussage, die die Normierung voraussetzt, ist das ohne Belang. Für die Zusammenfassung in Abschnitt 2 des Artefakts („Hat ⟨3,2,7⟩ eine Zerlegung der Länge 34 über einem Körper K, dann …“) ist es eine stillschweigende Voraussetzung. Diese Zusammenfassung gehört nicht zu B-023.

Nicht zur Behauptung gehören die Abschnitte 5.2 (Ansätze 3 bis 5, „vermutet“) und die Bemerkung „Symmetrie“. Ich habe sie nicht geprüft.

---

## 5. B-024 (Satz K)

Bezeichnungen der Quelle: a_r (3×2), b_r (2×7), w_r (3×7), Spalten 1 bis 7. Ich schreibe β_r(x_v) = Σ_l b_r[1][l] v_l für die Matrix x_v mit Zeile 0 gleich 0 und Zeile 1 gleich v, also ℬ(U) = {(Σ_l b_r[1][l] y_l)_r}. In Yangs Bezeichnung ist f₀(x_v)_r = a_r[0][0]·β_r(x_v), f_i(x_v)_r = a_r[i][0]·β_r(x_v).

### 5.1 Der Basiswechsel

Die Existenz eines Spaltenwechsels, der (SN1), (SN2) erhält und x₀, y₁, y₂ auf e₇, e₆, e₅ bringt, ist richtig. Die Schreibweise „B ↦ BP, C ↦ CP“ stimmt so nicht: Ersetzt man in den Koeffizienten b_r ↦ b_r P und w_r ↦ w_r P, ergibt die Summe A B P^⊤P statt AB. Richtig ist zum Beispiel b_r ↦ b_r P, w_r ↦ w_r P^{−⊤}. An einer Probe nachgerechnet (Abschnitt 8): Die wörtliche Fassung verletzt 294 der 1764 Gleichungen, die berichtigte keine. Für den Satz zählt nur die Existenz, das ist ein Schreibfehler.

### 5.2 K1: hält

Selbst nachgerechnet, **ohne** Skalierung: Mit x₀ ∈ S, y₁, y₂ ∈ N, f₁(x₀) = f₀(y₁), f₂(x₀) = f₀(y₂) und x₀, y₁, y₂ ↦ e₇, e₆, e₅ gilt a_r[1][0]·b_r[1][7] = a_r[0][0]·b_r[1][6], also b_r[1][6] = κ_r a_r[1][0], und ebenso b_r[1][5] = κ_r a_r[2][0], mit κ_r = b_r[1][7]/a_r[0][0] (a_r[0][0] ≠ 0 nach (SN1)). Dass {x₀, y₁, y₂} eine Basis von N ist, folgt aus (SN2) für x₀ und dim N = 3 (der Beweis sagt „Gleichheit in Lemma B“, gemeint ist dasselbe). Die Kette für dim N = 3, dim S = 1 verweist auf eine Datei, die nicht auf meiner Liste steht. Ich habe sie stattdessen als A1 (Abschnitt 3.1) selbst nachgerechnet.

### 5.3 K2: hält nicht in der wörtlichen Fassung

**Was der Beweis zeigt.** Wegen e₆, e₅ ∈ N liegen f₁(e₆), f₂(e₆), f₂(e₅) in Yangs J = f₀(U). Ohne Skalierung ist f₁(e₆)_r = a_r[1][0]·b_r[1][6] = κ_r a_r[1][0]² und f₀(U) = {(a_r[0][0]·β_r(x_v))_r}. Daraus folgt

  (κ_r λ_r² · a_r[0][0])_r = (b_r[1][7] λ_r²)_r ∈ ℬ(U),

und ebenso für λμ und μ². Die wörtliche Fassung verlangt dagegen (κ_r λ_r²)_r ∈ ℬ(U), also einen um den Faktor a_r[0][0]⁻¹ anders gewichteten Vektor. Beide stimmen nur überein, wenn a_r[0][0] = 1 für alle r. Der Beweis setzt das mit „Nach Skalierung auf a_r[0][0] = 1“ voraus. Diese Skalierung (α_r ↦ c_r α_r, C_r ↦ C_r/c_r) gehört aber nicht zu dem in der Aussage erlaubten Basiswechsel P.

**Warum die wörtliche Fassung nicht zu retten ist.** Die Voraussetzung von Satz K (stark normalisiert, Länge 34) bleibt unter jeder Umskalierung α_r ↦ c_r α_r, C_r ↦ C_r/c_r (c_r ≠ 0) erhalten. Dabei ändern sich b_r, λ_r, μ_r, ℬ(U), N und S nicht, wohl aber κ_r ↦ κ_r/c_r. Jedes P, das K1 und K3 erfüllt, legt die Spalten 5, 6, 7 bis auf einen gemeinsamen Faktor fest (e₇ erzeugt S, und K1 bestimmt e₆, e₅ aus e₇, weil f₀ injektiv ist). Gälte die wörtliche Fassung von K2 für alle Umskalierungen, so lägen alle Vektoren (b_r[1][7] λ_r²/(c_r a_r[0][0]))_r in ℬ(U), über einem Körper mit mindestens 3 Elementen also alle Einheitsvektoren e_r mit r im Träger von (b_r[1][7] λ_r²)_r. Dieser Träger hat mindestens 9 Elemente: In der skalierten Form spannen f₀(e₆), f₁(e₆), f₂(e₆) = λz, λ²z, λμz (z = (b_r[1][7])_r) einen dreidimensionalen Unterraum J₀ ⊆ J auf ((SN2), e₆ ∈ N), nach Identität (I) bzw. (C4) sind die 9 Vektoren r_i ⊙ y (y aus einer Basis von J₀) linear unabhängig, und alle haben ihren Träger in supp(λz) = supp(λ²z). Also wäre dim ℬ(U) ≥ 9 > 7. Widerspruch.

Folgerung: Gibt es überhaupt eine Zerlegung, die die Voraussetzung erfüllt, dann gibt es auch eine (eine Umskalierung davon), für die die wörtliche Fassung von K2 falsch ist. Die wörtliche Fassung von K2 als allgemeine Aussage ist also gleichwertig dazu, dass es keine stark normalisierte Zerlegung der Länge 34 gibt (über Körpern mit mindestens 3 Elementen). Das ist gerade die offene Frage. Ein konkretes Gegenbeispiel kann ich deshalb nicht angeben, aber der Beweis trägt die Aussage nicht, und als Strukturaussage ist sie falsch gewichtet. Über GF(2) ist a_r[0][0] = 1 erzwungen, dort stimmt die wörtliche Fassung.

**Berichtigte Fassung (hält, selbst nachgerechnet):** Nach dem Basiswechsel P gilt (a_r[0][0] κ_r λ_r²)_r, (a_r[0][0] κ_r λ_r μ_r)_r, (a_r[0][0] κ_r μ_r²)_r ∈ ℬ(U). Gleichwertig: Nach zusätzlicher Umskalierung auf a_r[0][0] = 1 (die (SN1), (SN2), K1 und K3 erhält) gilt K2 wörtlich. Der SAT-Kodierer `sat327.py` (Schalter `--sn1 --k1 --k2`) kodiert genau diese skalierte Fassung, er ist von der Abweichung also nicht betroffen.

### 5.4 K3: hält

N = span(e₅, e₆, e₇) und S = span(e₇) sind die Wahl der Basis. Unabhängigkeit von z, λz, μz mit z = (κ_r): f₀(e₇), f₁(e₇), f₂(e₇) sind (a_r[0][0]² κ_r)_r ⊙ (1, λ, μ). Nach (SN2) unabhängig, und die Multiplikation mit der nirgends verschwindenden Diagonale (a_r[0][0]²) ändert das nicht. Gilt also auch ohne Skalierung. (Die Quelle schreibt „Λz, μz“ für λ ⊙ z, μ ⊙ z.)

### 5.5 Folgerung für beliebige Körper (nicht Teil der Aussage) und Programme

- Die Folgerung direkt nach dem Beweis („Jede Zerlegung der Länge 34 über irgendeinem Körper hat nach einem Basiswechsel über einem Erweiterungskörper die Form (SN1), (K1), (K2)“) benutzt stillschweigend, dass kein α_r die Nullform ist. Das braucht Lemma A, und es folgt aus der Schranke R ≥ 34 über dem Erweiterungskörper (in B-022, Abschnitt 2.1, ausdrücklich so begründet). Mit der Berichtigung von K2 hält die Folgerung dann.
- Die Bemerkung „Über ℝ ist der Ansatz ohne Verlust“ habe ich nicht geprüft (nicht Teil der Aussage).
- Programme: `kenngroessen.py`, `sn_gf2.py`, `sat327.py`, `lm_normalform.py`, `block_lm.sh` gelesen. Sie beweisen nichts von Satz K, sie dienen der Eichung und Suche. `kenngroessen.py` setzt nach dem Basiswechsel α_r(e₀₀) = 1 und rechnet dann mit J = Spalten von b_r[1][·], also in der skalierten Form, verträglich mit 5.3. `sat327.py` kodiert (K1) als v_r[1][m−2] = u_r[1][0] ∧ v_r[1][m−1] usw. unter (SN1) u_r[0][0] = 1, also die Fassung aus 5.2, und für (K2) nur den gemischten Vektor, weil über GF(2) λ² = λ, μ² = μ gilt. Das ist richtig. Die Programme habe ich nicht ausgeführt, weil sie Dateien aus `verfahren/` lesen, die nicht auf meiner Liste stehen. Die Zahlen in Abschnitt 2 und 3.2 der Quelle (Kenngrößen, GF(2)/GF(3)-Proben) habe ich daher nicht nachgerechnet. Sie gehören nicht zu B-024.

---

## 6. Abgleich der drei Aussagen

Wörterbuch (bei Normierung a_r[0][0] = α_r(e₀₀) = 1):

| B-022 | B-023 | B-024 |
|---|---|---|
| s, t | p₁, p₂ | λ, μ |
| r_i | z_i | (a_r[i][1])_r |
| J = f₀(U) | J = b(K^m) | J = ℬ(U) (nur skaliert gleich) |
| ker W | H | ker W |
| f₀(N) | J₁ | M·N = span(z, λz, μz) |
| f₀(S) = ⟨y₀⟩ | J₂ = ⟨ω⟩ | M·S = ⟨z⟩, z = (κ_r) |
| y₀ ⊙ Pol_k | 𝒫^k ω | z ⊙ (Polynome in λ, μ) |
| Unterfall G / B | Fall A / B | nicht unterschieden |
| Σ, Π | Σ | nicht behandelt |

**Übereinstimmung.**
- A1 = Satz G (a), (b) und dim J₂ = 1 aus (c). Die Kenngrößen rk L = s = q = 6, rk H = 4, dim N = 3, Δ = 2, dim S = 1 stimmen in allen drei Texten überein (bei B-024 im Beweis, in K3 als N = span(e₅,e₆,e₇), S = span(e₇)).
- A1-Zusatz „L surjektiv“ = G (a) „𝒫J = H“.
- A2 = G (c), (e), (f). y₀ und ω sind derselbe Vektor bis auf einen Faktor (Erzeuger von f₀(S) = J₂). Fall A ↔ Unterfall G, Fall B ↔ Unterfall B, mit denselben Zerlegungen von J und ker W und denselben Dimensionen 10 bzw. 7.
- A4 (Schranken 28 und 22) = G (g). Die 28 bzw. 22 Vektoren sind dieselben ((K1)+(B1) in B-022, 𝒫³ω ⊕ 𝒯𝒫²ω in B-023).
- K1 und K3 sind die Koordinatenform von A2 (b) bzw. G (c): f₀(N) = y₀ ⊙ Pol₁ mit der Basis y₀, s⊙y₀, t⊙y₀. K2 (berichtigt) ist der quadratische Teil von A2 (c) bzw. G (e).

**Wo eine Aussage stärker ist.**
- B-022 stärker als B-023: A3 (glatter Kegelschnitt statt „auf einem Kegelschnitt“), A4 über Π (w_τ ≠ 0, α_τ unabhängig, B-Seite eine einzige Form, Basis von K³⁴), A5, A6 (nichts davon in B-023). A2 Unterfall B nennt Grad genau 2, G (f) nur Grad ≤ 2, dafür sagt G (f) „bis auf Skalar genau ein“ (in A2 nur im Beweis).
- B-023 stärker als B-022: Teil (d) (J₃ = 0, kein invarianter Unterraum ≠ 0 in J) steht nicht in A1 bis A6. Er folgt aus A1, A2 mit demselben kurzen Argument. Das Artefakt zu B-022 bemerkt in Abschnitt 9, Ansatz 1, nur den schwächeren Teil „f₀(N) ist nicht invariant“.
- B-024 ist schwächer als A2 und G: keine Fallunterscheidung, keine Aussage über ker W, keine Trägerschranke. Dafür gilt B-024 (wie A1, A2, A4 und Satz G auch) für jeden Körper, sobald die Zerlegung stark normalisiert ist.

**Körper.** B-022 setzt für A1 bis A4 algebraisch abgeschlossenes K voraus. Gebraucht wird das nur in A3. A1, A2, A4 gelten für jede stark normalisierte Zerlegung über jedem Körper, ebenso Satz G und Satz K. A5, A6 brauchen einen unendlichen Körper (A6 über A4, das für die normalisierte Zerlegung in A5 über dem algebraisch abgeschlossenen K angewandt wird). Keine der Aussagen braucht eine Bedingung an die Charakteristik.

**Widersprüche.** In der Sache keine. Die einzige Unverträglichkeit ist formal: K2 benutzt J = ℬ(U) ohne Normierung, B-022 benutzt J = f₀(U), B-023 J = ℬ(U) mit Normierung α(e₀₀) = 1. Nur in B-024 führt das zu einer falschen Aussage (Abschnitt 5.3).

**Gegenbeispiele gesucht.** Ein Gegenbeispiel zu einer der Aussagen bräuchte eine Zerlegung der Länge 34, deren Existenz offen ist. Ich habe deshalb nach inneren Widersprüchen und nach Aussagen gesucht, die unter den Symmetrien der Voraussetzung (Basiswechsel R3, Spaltenwechsel P, Umskalierung der Produkte) nicht invariant sind. Gefunden: nur K2 (Umskalierung). Alle Aussagen in B-022 und B-023 sind unter der Umskalierung invariant (B-022 arbeitet mit f₀(U) und Quotienten d′/d₀, B-023 setzt die Normierung voraus).

---

## 7. Was ich selbst nachvollzogen und was ich nur gelesen habe

- Selbst nachvollzogen, mit Handrechnung: alle Beweisschritte von A1 bis A6, Satz G (a) bis (g), K1 bis K3, dazu die benutzten Lemmata aus `yang_n3.md` (Abschnitt 2), Identität (I), die Umformulierung von (SN2) in Artefakt 2.2, (R1) bis (R4) und (C4) in `s4-blind-r2.md`.
- An einer Probe nachgerechnet (Abschnitt 8): (I), (C4), die Übersetzungsformeln aus A5 (ii), die Wirkung der Umskalierung auf ℬ(U) und f₀(U), die Schreibweise des Spaltenwechsels.
- Nur gelesen: Lemma A in `yang_n3.md` im Detail der Polynomwahl (nachvollzogen, aber ohne eigene Rechnung), die Folgerung „Polynomraum der Dimension 28“ (Zählung nachgerechnet, die Formgleichung nicht), die Programme in `versuche/s4-spurB-r2/` (nicht ausgeführt), die gescheiterten Ansätze und Arbeitsprogramme in allen drei Artefakten (nicht Teil der Behauptungen).
- Nicht nachgelesen: die in Abschnitt 0.2 genannten Dateien, insbesondere die Kette aus S3-04, auf die der Beweis von Satz K verweist. Ich habe sie durch A1 ersetzt.

---

## 8. Rechnung

Ein Rechenblock, 09:57 UTC, Dauer unter 1 Sekunde, ein Kern, Python 3, exakt über GF(2³¹ − 1). Skript `probe.py` im Arbeitsverzeichnis der Sitzung, nicht im Repo, unten vollständig wiedergegeben. Es nimmt das Standardverfahren mit 42 Produkten für ⟨3,2,7⟩ (selbst erzeugt, keine Datei aus dem Repo) und wendet zufällige Basiswechsel an. Das prüft nur die allgemeinen Übersetzungsformeln, nichts über eine Zerlegung der Länge 34.

Ausgabe:

```
standard scheme ok: True
R3 ok: True
column change b->bP, w->wP^{-T} ok: True | literal b->bP, w->wP violated equations: 294
rescaling ok: True
identity (I) and W(s y)=W(t y)=0 ok: True
(C4): dim T J0 = 9 , dim W(T J0) = 9
beta(U) invariant under rescaling: True
f0(U) changes under rescaling: dim(f0(U)+f0'(U)) = 14
p.k_p = 0: True
normalising change ok: True
D'(e00) = D(u p): True
f0'(x_v) = d0' * beta(k_p v): True
```

<details><summary>probe.py</summary>

```python
# S4-13 probe: generic identities used in B-022/B-023/B-024, checked on the standard
# 42-term scheme of <3,2,7> over GF(p) after random changes of basis. Exact arithmetic.
import random
P=2**31-1; rng=random.Random(13); m=7
def inv(a): return pow(a%P,P-2,P)
def mm(a,b): return [[sum(a[i][k]*b[k][j] for k in range(len(b)))%P for j in range(len(b[0]))] for i in range(len(a))]
def T(a): return [list(r) for r in zip(*a)]
def rank(rows):
    M=[list(r) for r in rows]; rk=0
    if not M: return 0
    for c in range(len(M[0])):
        p=next((i for i in range(rk,len(M)) if M[i][c]%P),None)
        if p is None: continue
        M[rk],M[p]=M[p],M[rk]; iv=inv(M[rk][c]); M[rk]=[x*iv%P for x in M[rk]]
        for i in range(len(M)):
            if i!=rk and M[i][c]%P:
                f=M[i][c]; M[i]=[(x-f*y)%P for x,y in zip(M[i],M[rk])]
        rk+=1
    return rk
def minv(a):
    n=len(a); M=[list(a[i])+[int(i==j) for j in range(n)] for i in range(n)]
    for c in range(n):
        p=next(i for i in range(c,n) if M[i][c]%P); M[c],M[p]=M[p],M[c]
        iv=inv(M[c][c]); M[c]=[x*iv%P for x in M[c]]
        for i in range(n):
            if i!=c and M[i][c]%P:
                f=M[i][c]; M[i]=[(x-f*y)%P for x,y in zip(M[i],M[c])]
    return [r[n:] for r in M]
def rinv(n):
    while True:
        a=[[rng.randrange(P) for _ in range(n)] for _ in range(n)]
        if rank(a)==n: return a
def E(r,c,i,j): return [[int((a,b)==(i,j)) for b in range(c)] for a in range(r)]
# standard scheme: a=e_{i,j}, b=e_{j,l}, w=e_{i,l}
S0=[(E(3,2,i,j),E(2,m,j,l),E(3,m,i,l)) for i in range(3) for j in range(2) for l in range(m)]
def ev(form,X): return sum(form[i][j]*X[i][j] for i in range(len(X)) for j in range(len(X[0])))%P
def check(S):
    bad=0
    for i in range(3):
      for j in range(2):
        for jp in range(2):
          for l in range(m):
            for ip in range(3):
              for lp in range(m):
                s=sum(a[i][j]*b[jp][l]*w[ip][lp] for a,b,w in S)%P
                bad+= s!=int(i==ip and j==jp and l==lp)
    return bad
print("standard scheme ok:",check(S0)==0)
# R3 change of basis: alpha'(A)=alpha(S A T), beta'(B)=beta(T^-1 B), C'=S^-1 C
Sm=rinv(3);Tm=rinv(2);Si=minv(Sm);Ti=minv(Tm)
S1=[(mm(mm(T(Sm),a),T(Tm)), mm(T(Ti),b), mm(Si,w)) for a,b,w in S0]
print("R3 ok:",check(S1)==0)
# column change of B and C: correct version b->b P, w->w P^{-T}; literal version b->bP, w->wP
Pm=rinv(m);PiT=T(minv(Pm))
S2=[(a,mm(b,Pm),mm(w,PiT)) for a,b,w in S1]
S2lit=[(a,mm(b,Pm),mm(w,Pm)) for a,b,w in S1]
print("column change b->bP, w->wP^{-T} ok:",check(S2)==0, "| literal b->bP, w->wP violated equations:",check(S2lit))
# rescaling alpha_r -> c_r alpha_r, C_r -> C_r/c_r
c=[rng.randrange(1,P) for _ in S2]
S3=[([[x*cr%P for x in row] for row in a],b,[[x*inv(cr)%P for x in row] for row in w]) for (a,b,w),cr in zip(S2,c)]
print("rescaling ok:",check(S3)==0)
def data(S):
    R=len(S)
    d=[[a[i][0] for a,b,w in S] for i in range(3)]       # D(e_{i,0})
    dp=[[a[i][1] for a,b,w in S] for i in range(3)]      # D(e_{i,1})
    B=lambda v:[sum(b[1][l]*v[l] for l in range(m))%P for a,b,w in S]  # beta(x_v)
    W=lambda t:[[sum(t[r]*S[r][2][i][l] for r in range(R))%P for l in range(m)] for i in range(3)]
    return d,dp,B,W
d,dp,B,W=data(S3)
assert all(d[0])  # SN1 for this draw
R=len(S3)
# identity (I): W(r_i * y) = e_i (x) v(y), y=f0(x_v), r_i=d'_i/d_0
okI=True
for _ in range(5):
    v=[rng.randrange(P) for _ in range(m)]
    y=[d[0][r]*B(v)[r]%P for r in range(R)]
    for i in range(3):
        ri=[dp[i][r]*inv(d[0][r])%P for r in range(R)]
        Wt=W([ri[r]*y[r]%P for r in range(R)])
        okI&= Wt==[[v[l] if ii==i else 0 for l in range(m)] for ii in range(3)]
        Wt=W([d[i][r]*inv(d[0][r])*y[r]%P for r in range(R)])
        okI&= Wt==[[0]*m for _ in range(3)]
print("identity (I) and W(s y)=W(t y)=0 ok:",okI)
# (C4): dim T*J0 = 3 dim J0 and T*J0 meets ker W trivially, J0 random 3-dim subspace of J
J0=[[d[0][r]*B(v)[r]%P for r in range(R)] for v in [[rng.randrange(P) for _ in range(m)] for _ in range(3)]]
TJ=[[dp[i][r]*inv(d[0][r])*y[r]%P for r in range(R)] for i in range(3) for y in J0]
Wimg=[sum(W(t),[]) for t in TJ]
print("(C4): dim T J0 =",rank(TJ),", dim W(T J0) =",rank(Wimg))
# scaling dependence: J_beta = beta(U) is invariant under rescaling, f0(U)=d0*beta(U) is not
d2,dp2,B2,W2=data(S2)
vs=[[rng.randrange(P) for _ in range(m)] for _ in range(m)]
Jb3=[B(v) for v in vs]; Jb2=[B2(v) for v in vs]
print("beta(U) invariant under rescaling:", rank(Jb3+Jb2)==m)
f03=[[d[0][r]*x[r]%P for r in range(R)] for x in Jb3]; f02=[[d2[0][r]*x[r]%P for r in range(R)] for x in Jb2]
print("f0(U) changes under rescaling: dim(f0(U)+f0'(U)) =",rank(f03+f02))
# A5(ii): J' = d0' * Jhat_p with Jhat_p={beta(k_p v)}, k_p=T^{-1}e_1, p first row of T
u=[rng.randrange(P) for _ in range(3)]; Su=[[u[0]]+[rng.randrange(P) for _ in range(2)],[u[1]]+[rng.randrange(P) for _ in range(2)],[u[2]]+[rng.randrange(P) for _ in range(2)]]
p=[rng.randrange(P),rng.randrange(P)]; Tp=[p,[rng.randrange(P),rng.randrange(P)]]
Tpi=minv(Tp); kp=[Tpi[0][1],Tpi[1][1]]
print("p.k_p = 0:",(p[0]*kp[0]+p[1]*kp[1])%P==0)
Sn=[(mm(mm(T(Su),a),T(Tp)), mm(T(minv(Tp)),b), mm(minv(Su),w)) for a,b,w in S3]
print("normalising change ok:",check(Sn)==0)
dn,dpn,Bn,Wn=data(Sn)
d0p=[ev(a,[[u[i]*p[j]%P for j in range(2)] for i in range(3)]) for a,b,w in S3]
print("D'(e00) = D(u p):",dn[0]==d0p)
ok=True
for v in vs:
    lhs=[dn[0][r]*Bn(v)[r]%P for r in range(R)]
    kv=[[kp[j]*v[l]%P for l in range(m)] for j in range(2)]
    rhs=[d0p[r]*ev(b,kv)%P for r,(a,b,w) in enumerate(S3)]
    ok&= lhs==rhs
print("f0'(x_v) = d0' * beta(k_p v):",ok)
```

</details>

---

## 9. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Rechenblöcke: 1 (unter 1 Sekunde, 09:57 UTC).
- Dauer: aus den Git-Zeitstempeln dieses Zweigs (`claude/project-thread-a25hy8`) ablesbar.
