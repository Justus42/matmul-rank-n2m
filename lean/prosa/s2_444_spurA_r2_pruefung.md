# Prüfbericht S2-09: Restfälle für ⟨4,2,4⟩ bei Rang 25 (Satz A, Satz B, Lemmata 13′, V, S)

- Auftrag: S2-09 (Stufe 2, Runde 3), Rolle Prüfer nach Protokoll Abschnitt 4 und 5, Spur A
- Datum: 25.11.2026
- Geprüftes Artefakt: `lean/prosa/s2_444_spurA_r2.md` (S2-05, PR #38) auf `main`, Stand Commit 3dcc887
- Grundlage für Bezeichnungen: `lean/prosa/yang_n4.md` (Yangs Satz 2, als richtig vorausgesetzt, B-003/B-007 geprüft)
- Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, die beiden Prosa-Dateien, `behauptungen/README.md` und `B-007.md` (Vorlage), das Dateiformat der Verfahrenslisten. Nicht gelesen: `LOG.md`, `STATUS.md`, frühere Prüfurteile zu dieser Datei (es gibt keine), der Code in `versuche/s2-spurA-r2/` (bis auf die Ladefunktion für das Hex-Format).
- Offenlegung: Die Sitzung zeigte mir kurze Projektnotizen, darunter eine Zusammenfassung des Berichts S2-05 selbst. Sie enthielt nichts, was nicht im Artefakt steht.
- Fremdmodell: GPT 6.2 Sol (`openai/gpt-6.2-sol`, Denkstufe high, Batch über die Bridge), beide Texte wörtlich und ungekürzt mitgegeben, ohne mein Urteil. Ergebnis in Abschnitt 6.
- Eigener Code: `versuche/s2-09-pruefung/` (unabhängig geschrieben, exakte Arithmetik in ℤ/(2⁶¹−1), GF(2³²) und GF(3¹⁷)).

---

## 1. Urteil

| Aussage | Urteil |
|---|---|
| Satz A (vier Restfälle, ρ = 3) | **hält** |
| Folgerung A1, A2 | **hält** |
| Lemma 13′ und die Tabelle der Anwendung | **hält** |
| Lemma V | **hält mit benannter Reparatur** (R2: Voraussetzung (a) muss für das gewählte u′ einen nichtleeren Schnitt haben; in der Anwendung automatisch erfüllt) |
| Folgerung V1 (Gᵀb_t = μ_t a_t, μ_t ≠ 0) | **hält mit benannter Reparatur** (R1: b_t ≠ 0 braucht eine zusätzliche, erfüllbare Generizitätsbedingung an p) |
| Lemma S, Teile 1 bis 4 | **hält** |
| Satz B ((4,7) und (5,7) unmöglich über jedem Körper; (3,6) symmetrisch) | **hält mit den Reparaturen R1 und R2** |

Ich habe keine Lücke gefunden, die eine Aussage gefährdet. Beide Reparaturen sind Ergänzungen von je einem Satz, sie ändern keine Aussage. Das Fremdmodell kommt unabhängig zu denselben Urteilen und denselben zwei Reparaturen (Abschnitt 6). Es hat außerdem eine einfachere Fassung V′ von Lemma V gefunden, die ich nachgerechnet habe: Ein einziges zulässiges u_0 mit gemeinsamem Kern genügt für die Symmetrie. Damit wird R2 überflüssig, und Satz B gilt sogar für jedes zulässige u_0, nicht nur für generisches.

**Status:** Nach Protokoll 5.1 kann ein Prosa-Beweis nicht **geprüft** werden. Alle Aussagen bleiben **behauptet**. Dieser Bericht ist das Prüferurteil vor einer Formalisierung. Was für **geprüft** fehlt, steht in Abschnitt 7. Ich habe dafür `behauptungen/B-008.md` (Satz A) und `behauptungen/B-009.md` (Satz B) mit Status **behauptet** angelegt.

---

## 2. Nachrechnung Schritt für Schritt

Abschnittsnummern beziehen sich auf `s2_444_spurA_r2.md`. n = m = 4, r = 25, dim U = 4.

### 2.1 Rahmen (Abschnitt 2)

- Ψ(u, x)_t = α_t(u·p)·β_t(v·w) mit p·v = 0: Nach R3 mit T = Matrix mit erster Zeile p ist β′_t(x) = β_t(T⁻¹x), und für x ∈ U (Zeile 0 null, Zeile 1 = w) ist T⁻¹x = (T⁻¹e_1)·w. Aus T·(T⁻¹e_1) = e_1 folgt p·(T⁻¹e_1) = 0. Also v = T⁻¹e_1, bis auf einen Faktor durch p bestimmt. **Richtig.**
- (Ψ1) ist Folgerung 7 auf U. **Richtig.**
- rk L = dim Ĵ − 4: im L = (Σ_{i≥1} f_i(U) + J)/J, und Ĵ = Σ_{i≥0} f_i(U), weil Ψ linear in u ist. **Richtig.**
- Wahl von p und u_0: Bedingung (b) von Lemma 6 hängt nur von p ab, Bedingung (a) ist Π_t α_t(u·p) ≠ 0. Für festes gutes p sind die zulässigen u_0 also genau O_p, offen und dicht in K⁴ (nichtleer, weil Lemma 6 ein Paar liefert und α_t(·⊗p) ≢ 0 gefordert ist). **Richtig.**
- Basisunabhängigkeit: Ein Wechsel der Ergänzung u_1, u_2, u_3 ersetzt F_i durch Σ ξ_{ij}F_j (u_0-Anteile fallen modulo J weg), und Lemma 13 Schritt 1 zeigt, dass rk L, ρ, rk H gleich bleiben. **Richtig.**

### 2.2 Satz A (Abschnitt 3)

Jede Zeile nachgerechnet, alles in ℤ:

1. dim Q = 25 − 20 = 5, rk L ≤ 5. ✓
2. (2): 3·(25 − 24) = 3 ≥ rk H − rk L. ✓
3. Lemma 13 mit d = 3: 2 rk H ≥ 3ρ + rk L. ✓
4. Lemma 14 (m = 4 ≥ n − 1 = 3): ρ ≥ 3. ✓
5. 2 rk L + 6 ≥ 3ρ + rk L ⇒ rk L ≥ 3ρ − 6; mit rk L ≤ 5 folgt 3ρ ≤ 11, ρ ≤ 3, also ρ = 3. ✓
6. Lemma 8′: rk L ≥ 3. ✓
7. rk L = 3: ⌈12/2⌉ = 6 ≤ rk H ≤ 6. rk L = 4: ⌈13/2⌉ = 7 ≤ rk H ≤ 7. rk L = 5: ⌈14/2⌉ = 7 ≤ rk H ≤ 8. ✓
8. Lemma 11 (rk H ≥ rk L), 15(a) (rk L ≤ 9), 15(b) (greift nur bei rk L = 9), Obergrenzen 12 und 15: schließen nichts weiter aus. ✓

**Vollständigkeit der Fallliste:** Es gibt keine weiteren Fälle. ρ ist durch 4 und 5 eindeutig 3, rk L ∈ {3, 4, 5} ist durch 1 und 6 erzwungen, und für jedes rk L sind alle ganzzahligen rk H zwischen den Schranken aufgezählt. Die Reduktion „Länge nach R2 kleiner als 25 widerspricht B-007“ ist richtig. Satz A gilt für jedes zulässige u_0 ∈ O_p, weil Yangs Lemmata für jede zulässige Normalform gelten.

Zu Φ: rk Φ = 24 − dim ker H = 12 + rk H nach Lemma 10, Zielraum im L × Q³ mit Dimension rk L + 15, Spielraum rk L + 3 − rk H. ✓

### 2.3 Folgerung A1 und A2

- A1: In (3,6), (4,7), (5,8) ist rk Φ = rk L + 15, also Φ surjektiv auf im L × Q³. Zu q ∈ Q³ gibt es (u, c) mit Φ(u, c) = (0, q), also L(u) = 0 und (−g(u_i) + J)_i ≡ q modulo im H: surjektiv. Ist (−g(u_i) + J)_i = H(c_0) für ein u ∈ ker L, dann ist Φ(u, −c_0) = 0, nach Lemma 10 also u = 0: injektiv. Dimensionen 12 − rk L = 15 − rk H in allen drei Fällen (9, 8, 7). **Hält.**
- A2: Ĵ ⊆ ker W, dim ker W = 25 − 16 = 9 = dim Ĵ bei rk L = 5. **Hält.**

### 2.4 Lemma 13′ (Abschnitt 4)

- Γ = {c : c_{23} = c_{32} = 0}, dim Γ = 8. H(c) = (F_2c_{12} + F_3c_{13}, −F_1c_{12}, −F_1c_{13}): Komponente 2 ist L(c_{21}, c_{22}, c_{23}) = F_1(−c_{12}), Komponente 3 ist L(c_{31}, c_{32}, 0) = −F_1c_{13}. ✓
- ker(H|_Γ) = {F_1c_{12} = F_1c_{13} = 0, F_2c_{12} + F_3c_{13} = 0} = ker Ξ mit Ξ : (ker F_1)² → Q, rk Ξ = dim(F_2(ker F_1) + F_3(ker F_1)) = s. Also dim H(Γ) = 8 − (2(4 − ρ) − s) = 2ρ + s. ✓
- H(Γ) ⊆ im H ∩ ker π (Komponenten 2, 3 in im F_1), und dim im H = dim(im H ∩ ker π) + dim π(im H) (Rangsatz für π auf im H, sogar Gleichheit). π(im H) = im H̄, 2 rk H̄ ≥ rk L − ρ (Lemma 11, d = 2), Rundung zulässig. ✓
- Die Aussage gilt für **jedes** γ* mit Rang ρ und jede Ergänzung ξ, nicht nur für eine generische Wahl. s = 0 heißt F′_1k = F′_2k = F′_3k = 0, also k im gemeinsamen Kern der F′_i, und der ist gleich dem gemeinsamen Kern der F_i (ξ invertierbar). ✓
- Tabelle: (3,6): 6 ≥ 6 + s ⇒ s = 0. (4,7) und (5,7): 7 ≥ 7 + s ⇒ s = 0. (5,8): 8 ≥ 7 + s ⇒ s ≤ 1. ✓ Charakteristik spielt keine Rolle (keine Division, Γ mit c_{ii} = 0).

**Hält.**

### 2.5 Lemma V (Abschnitt 5)

- N(u′) ist der gemeinsame Kern der F_i zu u_0 = u′: für u = u_0 leer, für u_1, u_2, u_3 die Bedingung F_i(x) = 0, Linearität in u. ✓
- dim I(u, u′) = 8 − dim(Ψ(u,U) + Ψ(u′,U)) (Rangsatz). ✓
- Schritt 1: φ wohldefiniert, linear, injektiv, φ(u′) = v′. ✓
- Schritt 2: (v′, φ(u)) und (y, v(u)) liegen in I(u, u′), beide ≠ 0, also proportional mit Faktor ≠ 0. ✓
- Schritt 3: φ″(u) ∥ φ(u) für u aus einer dichten Menge ⇒ M = φ⁻¹φ″ hat jeden Vektor als Eigenvektor (abgeschlossene Bedingung My ∧ y = 0) ⇒ M = c·Id, c ≠ 0. ✓ Dass v(u) ≠ 0 frei aus N(u) gewählt wird, schadet nicht; nebenbei folgt dim N(u) = 1.
- Schritt 4: v″ = φ″(u″) = cGu″, also Ψ(u, Gu″) = Ψ(u″, Gu) auf K⁴ × (dichte Menge), als Bilinearform also überall. ✓

**Reparatur R2 (klein).** In der abstrakten Fassung verlangt (a) nur „offen dicht in K⁴ × K⁴“. Schritt 1 wählt u′ ∈ O beliebig und Schritt 2 braucht dann u mit (u, u′) in der Menge aus (a). Für ein ungünstiges u′ kann der Schnitt leer sein. Behebung: u′ (und in Schritt 3 und 4 auch u″) nur aus O ∩ O_a wählen, wobei O_a := {u′ : der Schnitt {u : (u, u′) ∈ Menge aus (a)} ist nichtleer}. O_a enthält eine offene dichte Menge (die Menge aus (a) enthält ein D(f) mit f ≢ 0; für u′ außerhalb einer echten abgeschlossenen Menge ist f(·, u′) ≢ 0). Schritt 4 braucht dann Gleichheit nur auf K⁴ × (O ∩ O_a), das ist weiter dicht. In der Anwendung (Satz B) tritt das Problem gar nicht auf: Die Menge {dim ≥ 7} ist offen, und {dim ≤ 7} ist abgeschlossen und enthält K⁴ × O_p, also ganz K⁴ × K⁴. Damit ist der Schnitt für jedes u′ ∈ O_p nichtleer (ρ(u′) = 3).

**Hält mit Reparatur R2.**

### 2.6 Folgerung V1

Die Matrix a_t(Gᵀb_t)ᵀ ist symmetrisch vom Rang ≤ 1; aus xyᵀ = yxᵀ mit x ≠ 0, y ≠ 0 folgt y = μx (Koordinate mit x_i ≠ 0 wählen, keine Division durch 2). a_t ≠ 0 wegen (N1). ✓

**Reparatur R1 (klein).** Der Bericht begründet b_t ≠ 0 mit „β_t(v·w) = 0 für alle w und das generisch gewählte v; dann ist β_t = 0“. Das stimmt so nur, wenn p (und damit v) auch so gewählt ist, dass β_t(v⊗·) ≢ 0 für jedes t. Diese Bedingung steht in der „Wahl von p“ in Abschnitt 2 nicht. Behebung: Zuerst Terme mit β_t = 0 streichen (wie R2 für α; die Länge fiele unter 25, Widerspruch zu B-007, also gibt es keine). Für β_t ≠ 0 ist {v : β_t(v⊗·) ≡ 0} ein echter Unterraum von K², also ist „β_t(v_p⊗·) ≢ 0 für alle t“ eine nichtleere offene Bedingung an p. Sie wird zur Wahl von p hinzugenommen; offene dichte Bedingungen an p lassen sich schneiden. Danach ist b_t ≠ 0, Gᵀb_t ≠ 0, also μ_t ≠ 0.

**Hält mit Reparatur R1.**

### 2.7 Lemma S (Abschnitt 6)

- Umrechnung: b_t·(Gy) = μ_t a_t·y. Der Austausch x = Gy und die Skalierung der Koordinate t mit μ_t⁻¹ bilden Ĵ und J isomorph ab. Wichtig und richtig: Danach rechnet man in Ĵ/J statt Q = ker W/J; das ist erlaubt, weil alle F_i und H nach Ĵ/J bzw. (Ĵ/J)³ abbilden und Ĵ/J ⊆ Q. ✓
- Teil 1: Die Produkte ℓ_uℓ_y spannen R_2 auf (x_ix_j sind solche Produkte, auch in Charakteristik 2), Ĵ = ev(R_2), dim I = 10 − dim Ĵ = 6 − rk L. Kein Produkt in I wegen (Ψ1), insbesondere I ∩ x_0R_1 = 0. ✓
- Rechnung für H: Ĵ/J ≅ R′_2/Ī, dim Ī = dim I. Die drei Komponenten von H̃ habe ich nachgerechnet. Kern von H̃ eindimensional (x_3 | c̄_{12} usw.), rk H̃ = 8; Koszul-Abbildung (R′_2)³ → R′_3 surjektiv, Kern 18 − 10 = 8; also im H̃ = Kern. Die Zuordnung α ↦ (l_k) ist bijektiv, und die q̄_k sind linear unabhängig. rk H = 8 − dim Syz₁. ✓ (Keine Division, gilt in jeder Charakteristik.)
- Teil 2: dim Ī = 1, Syz₁ = 0. ✓
- Teil 3: q_1, q_2 linear unabhängig und ohne gemeinsamen Faktor (ein gemeinsamer Faktor hätte Grad 1 und gäbe ein Produkt in I). V(q_1, q_2) ⊆ ℙ³ ist ein vollständiger Durchschnitt, rein eindimensional, mit endlich vielen Komponenten. q̄_i ≠ 0 (I ∩ x_0R_1 = 0). Haben q̄_1, q̄_2 einen gemeinsamen Faktor, enthält V(q_1, q_2) ∩ {ℓ_{u_0} = 0} eine Kurve, also eine ganze Komponente. Die Ebenen, die eine feste Komponente enthalten, bilden eine echte abgeschlossene Menge im dualen ℙ³ (eine Gerade: ein Büschel; eine nicht lineare ebene Kurve: eine Ebene; eine nicht ebene Kurve: keine). Für u_0 außerhalb der endlichen Vereinigung sind q̄_1, q̄_2 teilerfremd, und dann ist Syz₁ = 0. Die Ebene {ℓ_{u_0} = 0} durchläuft mit u_0 alle Ebenen, und I hängt nicht von u_0 ab (die Punkte ã_t : u ↦ α_t(u·p) sind von der Basis unabhängig). ✓
- Teil 4: unmittelbar aus der Rechnung. ✓
- „Deckt Lemma S alle symmetrischen Fälle ab?“ Ja für das, was Satz B braucht: Lemma S setzt nur die Symmetrie für das feste p und u_0 ∈ O_p voraus und behandelt jedes rk L ∈ {3, 4, 5}. Teil 3 gilt ausdrücklich nur für generisches u_0, und das ist nötig: Meine Rechnung (Abschnitt 4.2) zeigt eine Konfiguration mit rk L = 4, in der für eine spezielle Ebene rk H = 7 = 8 − dim Syz₁ herauskommt. Dort ist allerdings (N1) verletzt, weil Punkte a_t in der Ebene liegen. Satz B braucht nur den generischen Wert, also kein Problem.

**Hält.**

### 2.8 Satz B (Abschnitt 7)

- rk L hängt nicht von u_0 ab (dim Ĵ hängt nur von p ab). ✓
- rk H(u_0) = Rang der polynomialen Matrix [h-Spalten | J³-Basis] − 12; dim J = 4 für alle u_0 ≠ 0. Maximum h auf offener dichter Menge O′. O_p ∩ O′ ≠ ∅ (K⁴ irreduzibel). ✓
- Für u_0 ∈ O_p ∩ O′ gilt Satz A mit rk H = h. In (3,6), (4,7), (5,7) liefert Lemma 13′ (an diesem u_0) s = 0, also N(u_0) ≠ 0. ✓
- Voraussetzungen von Lemma V: (Ψ1) ✓; (a) siehe 2.5 (in der Anwendung für jedes u′ ∈ O_p in Ordnung) ✓; (b) auf O_p ∩ O′ ✓.
- rk L = 4: Lemma S Teil 3 gibt rk H(u_0) = 8 auf einer offenen dichten Menge, die O_p ∩ O′ trifft; dort ist aber rk H ≤ 7 nach Satz A. Widerspruch. ✓ (Satz A gilt für **jedes** u_0 ∈ O_p, deshalb genügt ein einziges generisches u_0.)
- rk L = 5, h = 7: Lemma S Teil 2 gibt rk H(u_0) = 8 für jedes u_0 ∈ O_p, Widerspruch zu h = 7. ✓
- rk L = 3: rk H = 6 für jedes u_0 ∈ O_p, also s = 0 und N ≠ 0 überall auf O_p, Lemma V gibt Symmetrie. ✓
- „Über jedem Körper“: Eine Zerlegung über K ist eine über K̄ (R1); alle Schritte laufen über K̄. Charakteristik 2 und kleine Körper: Keine Stelle dividiert durch 2 oder braucht Elemente außer den generisch gewählten in K̄ (unendlich). Die einzigen charakteristikabhängigen Stellen (c_{ii} = 0 in U^{∧3}, Symmetrie von xyᵀ, Koszul-Rechnung) habe ich einzeln nachgesehen. ✓

**Hält mit R1 und R2.**

Was Satz B genau sagt (zur Klarstellung, keine Beanstandung): Für jedes zulässige p und generisches u_0 ist (rk L, rk H) ∈ {(3,6), (5,8)}. Ein spezielles zulässiges u_0 im Fall rk L = 5 kann rk H = 7 haben, ohne dass das Satz B widerspricht.

---

## 3. Weitere Gegenbeispielsuche ohne Treffer

- Ein Fall ρ = 3 mit N ≠ 0, der nicht symmetrisch ist, würde Lemma V widerlegen. Gesucht an allen 24 Einträgen (23 verschiedene Verfahren) der Länge 26 im Repo (Abschnitt 4.1) und an 1 225 Paaren von Monomkurven (a_t, b_t) (Abschnitt 4.3): kein Fall.
- Ein symmetrischer Fall mit rk L = 4 und generischem rk H = 7 würde Lemma S Teil 3 widerlegen. In allen Modellen mit rk L = 4 war rk H = 8 (generisch).
- Ein Tripel mit rk H < 2ρ + s + ⌈(rk L − ρ)/2⌉ würde Lemma 13′ widerlegen. 14 132 Prüfungen über ℤ/10007, auch mit nicht generischen γ*: kein Fall.

---

## 4. Rechnungen (`versuche/s2-09-pruefung/`)

Eigener Code, ohne den Code von S2-05 zu sehen (nur dessen Hex-Format übernommen). Ränge exakt im Rechenkörper; generische Werte über Zufallspunkte, also mit hoher Wahrscheinlichkeit, nicht sicher (jede Wahl doppelt, Maximum genommen). Die Irreduzibilität der Moduln für GF(2³²) und GF(3¹⁷) prüft der Code (Rabin-Test).

### 4.1 Verfahren der Länge 26 (`python3 pruefe.py schemes`, Ausgabe `schemes_ausgabe.txt`)

| Quelle | Anzahl | Brent-Gleichungen | rk L | ρ | rk H | dim N | s | dim der G-Lösungen, invertierbar | Lemma 13, 13′ | Lemma S Teil 4 (8 − dim Syz₁) |
|---|---|---|---|---|---|---|---|---|---|---|
| `verfahren/4x2x4-r26-s001.json` (ℤ) | 1 | ✓ | 6 | 4 | 11 | 0 | 0 | 0, nein | ✓ ✓ | entfällt |
| `s2-blind-r1/beispiele-rang26-f2.txt` Nr. 1 (𝔽₂) | 1 | ✓ | 6 | 4 | 10 | 0 | 0 | 0, nein | ✓ ✓ | entfällt |
| dort Nr. 2 bis 9 (𝔽₂) | 8 | ✓ | 6 | 3 | 8 | 1 | 0 | 1, ja | ✓ ✓ | 8 = rk H ✓ |
| `s2-spurA-r2/daten/rho3_rang26_f2.txt` (𝔽₂) | 14 | ✓ | 6 | 3 | 8 | 1 | 0 | 1, ja | ✓ ✓ | 8 = rk H ✓ |

Damit sind die Zahlen der Tabelle in Abschnitt 9 des Artefakts unabhängig bestätigt. Alle ρ = 3-Verfahren erfüllen Lemma V (N ≠ 0 ⇒ symmetrisch), und an den symmetrischen gilt die Formel aus Lemma S Teil 4 (hier dim I = 0, also rk H = 8). Einschränkung: Alle ρ = 3-Verfahren stammen aus Charakteristik 2. Ein Versuch, Verfahren über 𝔽₃ mit `s2-blind-r1/flip3.c` zu erzeugen (4 × 150 s), kam wie in S2-01 nicht unter 32.

### 4.2 Symmetrische Modelle für Lemma S (`python3 pruefe.py modelle p61|f2|f3`, Ausgabe `modelle_ausgabe.txt`)

a_t = b_t, 25 Punkte, in ℤ/(2⁶¹−1), GF(2³²) und GF(3¹⁷) mit identischen Ergebnissen:

| Punkte | rk L | ρ | rk H | dim I | 8 − dim Syz₁ |
|---|---|---|---|---|---|
| verdrehte Kubik | 3 | 3 | 6 | 3 | 6 |
| glatte Quadrik x_0x_3 = x_1x_2 | 5 | 3 | 8 | 1 | 8 |
| Kubik ∪ Sekante (vollständiger Durchschnitt zweier Quadriken), generisches u_0 | 4 | 3 | 8 | 2 | 8 |
| dieselben Punkte, Ebene durch die Sekante (u_0 nicht zulässig, (N1) verletzt) | 4 | 3 | 7 | 2 | 7 |
| 24 Punkte auf der Kubik und 1 zufälliger | 4 | 3 | 8 | 2 | 8 |

Die Formel rk H = 8 − dim Syz₁ stimmt in allen Fällen, auch im speziellen mit rk H = 7. Das zeigt zugleich, dass Teil 3 die Generizität von u_0 wirklich braucht.

### 4.3 Suche nach einem Gegenbeispiel zu Lemma V (`python3 lemma_v_suche.py`, Ausgabe `lemma_v_suche_ausgabe.txt`)

Alle Paare von Monomkurven a_t = (s^{e_0}, …, s^{e_3}), b_t = (s^{f_0}, …, s^{f_3}) mit 0 = e_0 < e_1 < e_2 < e_3 ≤ 7 (ebenso f), s = 2, …, 26: 1 225 Modelle, davon 35 mit ρ = 3 und N ≠ 0, alle symmetrisch.

### 4.4 Lemma 13′ abstrakt (`python3 pruefe.py l13`, Ausgabe `l13_ausgabe.txt`)

400 Tripel (F_1, F_2, F_3) : K⁴ → K^q, q ∈ {3, …, 6}, aus vier Familien (zufällig von kleinem Rang, gemeinsamer Kernvektor, Bilder in im F_1), über ℤ/10007; für jedes γ* mit Rang ρ aus 38 Kandidaten geprüft: 14 132 Prüfungen, keine Verletzung.

Rechenzeit insgesamt unter 25 Minuten auf 4 Kernen. Nichts läuft weiter.

---

## 5. Antworten auf die Schwerpunktfragen des Auftrags

1. **Körperannahmen.** Alle Beweise laufen über dem algebraischen Abschluss; keiner teilt durch 2 oder durch eine andere Zahl. Kleine Körper sind durch R1 erledigt. Die Rechnungen in Charakteristik 2 und 3 stimmen mit denen in großer Charakteristik überein. Kein Einwand.
2. **Vollständigkeit der Fallliste in Satz A.** Vollständig (Abschnitt 2.2).
3. **Deckt Lemma S alle symmetrischen Fälle ab?** Ja für alle rk L ∈ {3, 4, 5}; Teil 3 nur für generisches u_0, und mehr braucht Satz B nicht (Abschnitt 2.7, 2.8).
4. **Generizitätsargumente.** Richtig, mit den beiden Ergänzungen R1 (Bedingung an p für b_t ≠ 0) und R2 (nichtleerer Schnitt in Lemma V (a)).

---

## 6. Urteil des Fremdmodells

GPT 6.2 Sol (`openai/gpt-6.2-sol`, Denkstufe high, Batch `openrouter:batch-1795607432-yAfzpah73YfoE29aqbzs`, abgegeben 12:50, fertig 12:59 MEZ, 25.11.2026). Mitgegeben wurden `yang_n4.md` und `s2_444_spurA_r2.md` wörtlich und ungekürzt mit der Bitte, die Aussagen 1 bis 6 zu widerlegen und je ein Urteil zu geben; mein Urteil kannte das Modell nicht.

| Aussage | Urteil GPT | Übereinstimmung mit Abschnitt 1 |
|---|---|---|
| Satz A | hält („vollständig als Liste notwendiger Möglichkeiten, nicht als Nachweis ihrer Realisierbarkeit“) | ja |
| Lemma 13′ samt Tabelle | hält | ja |
| Lemma V und V1 | hält mit benannter Reparatur: genau R2 (Anker u′ aus einer offenen dichten Menge, auf der P(·, u′) ≢ 0) und genau R1 (Wahl von p verschärfen) | ja |
| Lemma S, Teile 1 bis 4 | hält; Teil 3 braucht die Generizität wirklich | ja |
| Satz B | hält mit benannter Reparatur (R1, R2 und die Begründung, warum rk H(u_0) polynomial ist; die steht in Abschnitt 2.8 dieses Berichts) | ja |
| A1, A2 | hält (der Isomorphismus ist die induzierte Abbildung, nicht Φ selbst; so steht es auch im Artefakt) | ja |

Zwei Beiträge des Modells gehen über meine Prüfung hinaus. Ich habe beide selbst nachgerechnet:

1. **Gegenbeispiel zur Wahl von p ohne R1:** β(B) = B_{0,0} ist keine Nullform, verschwindet aber auf allen v·w mit v = (0, 1)ᵀ. Für ein festes p ist der Schluss „b_t = 0 ⇒ β_t = 0“ also falsch. Das bestätigt, dass R1 nötig ist. ✓
2. **Stärkere und einfachere Fassung von Lemma V (V′):** Schon ein einziges zulässiges u_0 mit 0 ≠ k ∈ N(u_0) erzwingt die Symmetrie. Schritt 1 von Lemma V gibt ein invertierbares φ mit Ψ(u, k) = Ψ(u_0, φ(u)) für alle u. In Koordinaten heißt das (a_t·u)(b_t·k) = (a_t·u_0)((φᵀb_t)·u) für alle u, also
   (b_t·k)·a_t = (a_t·u_0)·φᵀb_t.
   Mit a_t·u_0 ≠ 0 (N1) folgt φᵀb_t = μ_t a_t mit μ_t = (b_t·k)/(a_t·u_0), und μ_t ≠ 0, weil φᵀb_t ≠ 0 (nach R1 ist b_t ≠ 0). ✓ Damit werden die Schritte 2 bis 4 von Lemma V, die Voraussetzung (a) und die Reparatur R2 überflüssig. Folge für Satz B: Die Fälle (4,7) und (5,7) sind dann für **jedes** zulässige u_0 ausgeschlossen, nicht nur für generisches. (rk L = 4 ist ganz ausgeschlossen, weil rk L nicht von u_0 abhängt; bei rk L = 5 und rk H(u_0) = 7 gäbe Lemma 13′ ein N(u_0) ≠ 0, also Symmetrie, also rk H(u_0) = 8 nach Lemma S Teil 2.) Satz B gilt also in der stärkeren Form: Für jedes zulässige Paar (p, u_0) mit p nach R1 ist (rk L, rk H) ∈ {(3,6), (5,8)}.

Das Modell hat weder eine Lücke noch einen Fehler gefunden, der eine Aussage gefährdet. Prüfer und Fremdmodell stimmen in allen sechs Urteilen überein.

---

## 7. Was für den Status geprüft fehlt

Nach Protokoll 5.1 braucht **geprüft** einen Lean-Beweis ohne `sorry`, Standard-Axiome, Aussagen-Abgleich durch Prüfer und Fremdmodell und einen grünen Actions-Lauf. Konkret fehlen:

1. **Satz A** (B-008): Lean-Satz, der für eine Zerlegung der Länge 25 in Normalform ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)} ausspricht. Fast alles liegt in `lean/YangBounds/` schon vor (Lemma 8′, 10, 11, 13, 14, Gleichung (2)); nötig ist eine Fassung, die die Größen rk L, ρ, rk H nach außen gibt, statt nur r ≥ 25 zu folgern.
2. **Lemma 13′**: reine lineare Algebra wie Lemma 13, direkt formalisierbar.
3. **Lemma V**: Empfehlung, statt Lemma V die Fassung V′ aus Abschnitt 6 zu formalisieren. Sie braucht nur lineare Algebra an einem einzigen Punkt u_0 (keine Zariski-Argumente) und R1. Die Fassung aus dem Artefakt bräuchte Zariski-Dichte in K⁴, „Polynom, das auf einer dichten Menge verschwindet, ist 0“ und „jeder Vektor Eigenvektor ⇒ Skalar“ sowie R2.
4. **Lemma S**: Koszul-Rechnung in K[x_1, x_2, x_3] (Teil 4, Teil 2 einfach). Teil 3 braucht Geometrie (Komponenten eines vollständigen Durchschnitts in ℙ³). Das ist der aufwendigste Teil. Ein elementarer Ersatz (Resultanten oder ein direktes Argument, dass zwei teilerfremde Quadriken nur für endlich viele Ebenen-Büschel einen gemeinsamen Faktor nach Einschränkung haben) würde die Formalisierung stark vereinfachen.
5. **Satz B** (B-009): Zusammenbau, plus die Generizitätsargumente (Wahl von p, O_p ∩ O′).
6. Vor der Formalisierung: Fremdmodell-Gegenlesen nach Abschnitt 4 (mit diesem Bericht erledigt, siehe Abschnitt 6) und danach Aussagen-Abgleich der Lean-Sätze.
