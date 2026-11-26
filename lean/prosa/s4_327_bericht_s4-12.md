# S4-12: Prüferbericht zu B-021 (Aussagen S4-07-A bis S4-07-E, ⟨3,2,7⟩)

- Auftrag: S4-12, Rolle Prüfer. Datum 26.11.2026. Zeiten aus den Git-Zeitstempeln dieses Zweigs (`claude/project-thread-j87qfz`).
- Geprüft wird B-021 in der Fassung von `behauptungen/B-021.md` gegen das Artefakt `lean/prosa/s4_327_spurA_r2_bau.md`, Stand 961f6c0 (auf main unverändert, `git diff 961f6c0 HEAD` leer).
- Ich setze keinen Status. Die Urteile unten sind Prüfurteile im Sinn von Protokoll 5.4; den Status setzt der Orchestrator.

---

## 0. Offenlegung

**Gedächtnis.** Eingeblendet wurden mir, bevor ich etwas gelesen habe, der Index `team/silo/MEMORY.md` des Projektgedächtnisses (Projektbeschreibung, Regeln zu Orchestrator, Stufe 4, Fremdmodell, Prüferaufträgen und Literaturwache; er verweist auf die Einträge `verfahren-datenformat` und `lean-project-ci`, deren Inhalt mir nicht eingeblendet wurde). Das habe ich im Thread gemeldet, bevor ich gelesen habe. Nach dem ersten Lesen wurden mir zusätzlich die Einzeleinträge `hk-verfahren-a10`, `pruefer-abgleich-s1-20`, `lean-upper-3x2x6` und `verfahren-randfaelle-s1-04` eingeblendet (Dateien unter `verfahren/`, Prüfprogramme, Lean-Datei zu 3×2×6, Formatregeln). Keiner dieser Texte enthält ein Urteil zu B-021 oder zu R-327. Ich habe sie nicht benutzt. Ich habe nichts ins Gedächtnis geschrieben.

**Bloße Spuren (Protokoll 5.4), nicht nachgelesen:**
- Artefakt Zeile 6: nennt `STATUS.md`, `LOG.md`, `behauptungen/B-017.md` bis `B-019.md`, die Prüfberichte `lean/prosa/s4_327_bericht_s4-01.md` bis `s4-03.md` („Offenlegung und Urteile im Logbuch“) und die Statuszeilen von `pruefvermerke/B-001.md` und `B-006.md`.
- Artefakt Zeile 41 (L-3): B-017 bis B-019 seien „von je einem Prüfer bestätigt“. Zeile 155: B-006 „laut Prüfvermerk geprüft“.
- `git log` zu `lean/prosa/yang_n3.md` (um den Stand festzustellen) zeigte die Commit-Zeile „Merge pull request #81: S2-50 Prüferbericht B-016“.
- Ein `ls lean/prosa/` (um den Dateinamen meiner Lieferung zu wählen) zeigte Dateinamen, darunter `s4_327_spurA_r2_ausschluss.md`, `s4_327_axiome_s4-09.md`, `yang_n3_pruefung.md`, `yang_n4_pruefung.md` und weitere `*_bericht_*`- und `*_pruefung*`-Dateien. Keine davon habe ich geöffnet.

Alle diese Spuren betreffen andere Behauptungen als B-021 oder nennen nur Dateinamen. Ein Urteil zu B-021 habe ich nicht gesehen. Ein erwünschtes Ergebnis wurde mir nicht genannt.

**Gelesen:** `CLAUDE.md`, `PROTOKOLL.md` nur Abschnitt 5, `behauptungen/B-021.md`, `lean/prosa/s4_327_spurA_r2_bau.md` ganz (einschließlich Anhang A), `lean/prosa/yang_n3.md` ganz. Sonst nichts aus dem Repo. Insbesondere nicht `verfahren/` (deshalb konnte ich `sanity.py` und `struk.py` des Artefakts nicht laufen lassen) und nicht die Quellen zum Restfall R-327 (S3-03, S3-04, B-017 bis B-019).

**Unterscheidung.** In jedem Abschnitt steht, was ich **selbst nachvollzogen** habe (Schritt für Schritt auf Papier oder durch eigenes Programm) und was ich **nur gelesen** habe.

---

## 1. Ergebnis in Kürze

| Teil | Urteil | Bedingungen, unter denen das Urteil gilt |
|---|---|---|
| **D** (bedingter Ausschluss) | **hält** | Erster Satz: folgt aus B(iii), C und (C′), Schritt für Schritt nachvollzogen. Der zweite Satz („Gleichwertig gesagt …“) ist nur unter der zusätzlichen Voraussetzung gleichwertig, dass jede Normalform im Restfall R-327 liegt (B-017); diese Voraussetzung steht nicht im Wortlaut von D (Abschnitt 2.4). |
| **A** (Umformulierung) | **hält** | Keine. Über jedem Körper, für jedes r und m. |
| **B** (Zerlegungssatz) | **hält** | Restfall-Daten rk L = 6 = q, dim N = 3, dim S = 1 (aus R-327, von mir nicht geprüft, im Wortlaut von B genannt als „im Restfall R-327“). B(i) braucht davon nichts. |
| **C** (Gestalt bei e = 3) | **hält** | B und dieselben Restfall-Daten. |
| **E** (Satz X) | **hält** | R_K(⟨3,2,6⟩) ≥ 30 über demselben Körper K. Diese Voraussetzung steht im Artefakt (Abschnitt 5, L-3), aber nicht im Wortlaut von E in B-021 (Abschnitt 6.3). |

Kein Gegenbeispiel gefunden. Die eigene Nachrechnung (Abschnitt 7) bestätigt den Kernschritt von D an 5 514 Lagen mit (INJ5) ohne Ausnahme und zeigt an einem echten Verfahren, dass die Rechnung nicht blind ist.

Was ich nicht beurteilen kann: ob der Restfall R-327 (B-017 bis B-019) richtig ist und ob R(⟨3,2,6⟩) ≥ 30 gilt. Beides ist Eingabe, nicht Gegenstand von B-021.

---

## 2. Teilaussage D, zuerst und für sich

### 2.1 Was D sagt

Lage von S4-07-C: Normalform (R1 algebraischer Abschluss, R2, Lemma A, Skalierung a_0 = 1) eines Verfahrens der Länge 34 für ⟨3,2,7⟩ im Restfall R-327 mit e = 3, also dim w·P_2 = 6 und J = w·P_2 ⊕ ⟨u⟩. (INJ5) im Wortlaut der Behauptungsdatei: „aus w·F + u·G = 0 (als Vektor in K^34) mit deg F ≤ 5 und deg G ≤ 3 folgt F = 0 und G = 0.“ Behauptet wird: Diese Lage zusammen mit (INJ5) ist unmöglich.

### 2.2 Benutzte Voraussetzungen, Schritt für Schritt (selbst nachvollzogen)

Der Beweis steht in Artefakt 6.1 und 6.2. Er benutzt:

- (V1) (C′): c_i·j ≡ a_i·κ(j) mod K′ für j ∈ J, i = 1, 2, mit einer gemeinsamen linearen Abbildung κ : J → K′. Herleitung aus (C) mit a_0 = 1 (Artefakt Abschnitt 2) nachgerechnet: a_i·p_k − b_i·q_k = a_i·κ_k − c_i·q_k. κ ist wohldefiniert, weil q_1, …, q_7 linear unabhängig sind (dim J = 7, G4).
- (V2) aus C: K′ = w·P_3 ⊕ u·P_1 mit dim w·P_3 = 10, dim u·P_1 = 3, und K″ = w·P_4 ⊕ u·P_2 mit dim 15 + 6. Daraus folgt, was der Beweis „eindeutig“ nennt: Jeder Vektor in K″ ist auf genau eine Weise w·F + u·G mit **Polynomen** deg F ≤ 4, deg G ≤ 2 (die Auswertung P_4 → w·P_4 ist injektiv, weil dim w·P_4 = 15 = dim P_4; ebenso für u·P_2, K′).
- (V3) aus B(iii): Θ : J³_0 → K^34/K′ injektiv, dim J³_0 = 8.
- (V4) aus C, Abschnitt 4.2: ker L ⊆ (w·P_2)², also verschwinden j_1, j_2 für (j_0, j_1, j_2) ∈ J³_0 außerhalb des Trägers von w.
- (V5) (INJ5).

Die Schritte:

1. c_i·w ∈ K′ + a_i·K′ ⊆ K″, also c_i·w = w·C_i + u·E_i, deg C_i ≤ 4, deg E_i ≤ 2, eindeutig nach (V2). ✔
2. w·a_1 ∈ J (w·P_2 ⊆ J), also ebenso c_i·w·a_1 ∈ K″. Als Vektor ist c_i·w·a_1 = w·(a_1C_i) + u·(a_1E_i); zugleich = w·C′ + u·E′ mit kleinen Graden. Die Differenz ist eine Relation mit Graden ≤ 5 und ≤ 3. (INJ5) gibt a_1C_i = C′, a_1E_i = E′ als Polynome, also deg C_i ≤ 3, deg E_i ≤ 1. ✔ (Grade: ist C_i ≠ 0, so deg(a_1C_i) = deg C_i + 1.)
3. Mit w·a_1² ∈ J ebenso: deg C_i ≤ 2, E_i konstant. Die Grade passen: deg(a_1²C_i) ≤ 5, deg(a_1²E_i) ≤ 3. ✔
4. Für G ∈ P_2: κ(w·G) = w·F_G + u·g_G eindeutig (V2, in K′). (C′) heißt w·(C_iG − a_iF_G) + u·(E_iG − a_ig_G) ∈ K′. Die Grade sind ≤ 4 und ≤ 2, also liegt der Vektor in K″, und wegen der Eindeutigkeit in K″ (V2) müssen die Polynome C_iG − a_iF_G und E_iG − a_ig_G selbst Grad ≤ 3 bzw. ≤ 1 haben. Das gibt C_i^{(2)}·G^{(2)} = a_i·F_G^{(3)} und E_i·G^{(2)} = a_i·g_G^{(1)}, mit denselben F_G, g_G für i = 1, 2 (κ hängt nicht von i ab). ✔ Dieser Schritt braucht (INJ5) nicht.
5. G = a_1²: a_1²·(a_2C_1^{(2)} − a_1C_2^{(2)}) = 0 in K[a_1, a_2] (nachgerechnet: a_2·(erste) und a_1·(zweite) haben dieselbe rechte Seite a_1a_2F). Nullteilerfrei, also a_2C_1^{(2)} = a_1C_2^{(2)}; da a_1, a_2 teilerfremd sind, C_1^{(2)} = a_1h, C_2^{(2)} = a_2h mit h ∈ S¹ ∪ {0}. Für E: a_2E_1 = a_1E_2 mit Konstanten, also E_1 = E_2 = 0. ✔
6. Also c_i·w = w·(a_ih + ℓ_i), ℓ_i ∈ P_1, d. h. c_i = a_ih + ℓ_i auf dem Träger von w. ✔
7. Abschluss: Für (j_0, j_1, j_2) ∈ J³_0 gilt nach (V4) komponentenweise Θ(j) = (a_1h + ℓ_1)j_1 + (a_2h + ℓ_2)j_2 (außerhalb des Trägers von w sind beide Seiten 0) = −h·j_0 + ℓ_1j_1 + ℓ_2j_2 ∈ P_1·J = K′. Also Θ(J³_0) ⊆ K′, im Widerspruch zu (V3), weil dim J³_0 = 8 > 0. ✔

6.1 (triviale Lösungen verletzen (D′)) habe ich ebenfalls nachgerechnet: c_i = ℓ_i + a_iμ, Θ(j) = ℓ_1j_1 + ℓ_2j_2 + μ(a_1j_1 + a_2j_2) = ℓ_1j_1 + ℓ_2j_2 − μj_0 ∈ K′. ✔ Für D selbst wird 6.1 nicht gebraucht; der Abschluss von 6.2 wiederholt das Argument.

### 2.3 Über welchen Körpern

Die Normalform lebt über dem algebraischen Abschluss (R1); yang_n3 Lemma A braucht nur einen unendlichen Körper. Die Schritte 1 bis 7 benutzen nur, dass K[a_1, a_2] ein faktorieller Ring ist, und gelten über jedem Körper. Weil ein Verfahren über K auch eines über dem Abschluss ist (yang_n3 R1, nachvollzogen), schließt D Verfahren über jedem Körper aus, deren Normalform über dem Abschluss e = 3 und (INJ5) hat.

### 2.4 Stillschweigende oder nicht im Wortlaut stehende Voraussetzungen

1. **Zweiter Satz von D.** „Gleichwertig gesagt: Jedes Verfahren der Länge 34 für ⟨3,2,7⟩ hat in jeder Normalform e ≤ 2, oder es verletzt (INJ5).“ Hier fehlt der Zusatz „im Restfall R-327“. e ist nur definiert, wenn dim S = 1 (w = j_v für v ∈ S). Gleichwertig zum ersten Satz ist der zweite also nur unter der Voraussetzung, dass jede Normalform im Restfall liegt (B-017, Artefakt 1.1). Im Artefakt ist das in L-3 offen genannt, im Wortlaut von D nicht. Am ersten Satz ändert das nichts. Außerdem benutzt der zweite Satz e ≠ 0 (Artefakt 3.1, nachgerechnet: e = 0 gäbe S = N) und e ≤ 3 (dim P_2 = 6).
2. **(INJ5) hängt nicht von der Wahl von u ab.** u ist nur bis auf u′ = λu + w·φ (φ ∈ P_2, λ ≠ 0) bestimmt. Das Artefakt sagt nicht, dass (INJ5) davon unabhängig ist. Ich habe es nachgeprüft: w·F + u′·G = w·(F + φG) + u·(λG), und (F, G) ↦ (F + φG, λG) ist bijektiv auf {deg F ≤ 5, deg G ≤ 3}. Also ist (INJ5) für u genau dann wahr, wenn für u′. Die Aussage ist damit wohldefiniert.
3. **„Eindeutig“ in Schritt 1 bis 3** stützt sich auf die vollen Dimensionen aus C (V2). Das Artefakt sagt das ausdrücklich erst in Schritt 4 („Wegen 4.1“); benutzt wird es schon ab Schritt 1. Kein Fehler, nur nicht ausgeschrieben.
4. **Restfall-Daten** (rk L = 6 = q, also K′ = J + a_1J + a_2J; dim N = 3; dim S = 1) kommen über B und C herein. Sie stehen im Wortlaut von B („im Restfall R-327“) und sind in L-3 offen genannt. Geprüft habe ich sie nicht (nicht auf meiner Liste).

### 2.5 Urteil zu D

**Hält.** Der erste Satz folgt Schritt für Schritt aus B(iii), C und (C′) zusammen mit (INJ5) im Wortlaut der Behauptungsdatei; über jedem Körper. Vorbehalt zum zweiten Satz wie in 2.4 Punkt 1. Selbst nachvollzogen: alle Schritte 1 bis 7 und 6.1, dazu Abschnitt 7.2 numerisch.

Anmerkung, kein Einwand: D ist eine Implikation. Ob (INJ5) bei einem echten Verfahren je gelten kann, sagt D nicht. In meinen Lagen (die die Dimensionen aus C erfüllen, aber nicht alle Brent-Gleichungen) gilt (INJ5) in 5 514 von 29 597 Fällen; die Bedingung ist also auf der Ebene der Lagen nicht leer.

---

## 3. Teilaussage A (Umformulierung)

**Selbst nachvollzogen.** Einsetzen der Basismatrizen: e_{i0}e_{1k} = 0 und e_{i1}e_{0k} = 0 geben (A) und (B); e_{i0}e_{0k} = e_{ik} = e_{i1}e_{1k} geben W(a_i·p_k) = W(b_i·q_k) = e_{ik}, daraus (C) und, weil die e_{ik} eine Basis von K^{3×m} sind, (D). Umkehrung: Aus (D) und dim K′ = r − 3m folgt K′ ⊕ span(b_i·q_k) = K^r, W ist durch W|_{K′} = 0, W(b_i·q_k) = e_{ik} wohldefiniert mit ker W = K′, und alle vier Gruppen gelten (die dritte über W(a_ip_k) = W(b_iq_k) + W(a_ip_k − b_iq_k) = e_{ik}). Da die Identität bilinear ist und die vier Gruppen alle Paare von Basismatrizen abdecken, ist das ein Verfahren. Keine Voraussetzung an K, r oder m.

**Nachgerechnet** (Abschnitt 7.1): An zufällig transformierten Verfahren für ⟨3,2,7⟩ gelten (A) bis (D) mit K′ = ker W; aus K′ und den b_i·q_k allein rekonstruiert das eigene Programm W und damit genau die ursprünglichen C_t, und die Brent-Gleichungen gelten. Nach Störung eines Koeffizienten von β scheitern (A) und (C).

**Urteil: hält.**

---

## 4. Teilaussage B (Zerlegungssatz)

**(i) Selbst nachvollzogen.** Aus (D): K^34 = K′ + Σ_i b_i·J. Für j ∈ J: b_0·j ∈ b_0·K′ (J ⊆ K′); für i = 1, 2: b_i·j = c_i·j + b_0·(a_i·j) mit c_i·j ∈ K′ + a_i·K′ ⊆ K″ nach (C′) und a_i·j ∈ K′ nach (A). Also K^34 = K″ + b_0·K′ und dim K″ ≥ 34 − 13 = 21. Kleine Ungenauigkeit: Das Artefakt begründet mit „a_0·J + a_1·J + a_2·J = K′“; gebraucht wird nur „⊆“, das aus (A) folgt. (i) braucht also nur (A), (C), (D) und a_0 = 1, keine Restfall-Daten.

**(ii) Selbst nachvollzogen**, mit einer anderen Begründung für einen Teilschritt. w := j_v = f_0(v) für v ∈ S \ {0}; f_i(v) = a_i·w, weil a_0 = 1. Die Gleichung f_0(N) = span(w, a_1w, a_2w) übernimmt das Artefakt aus S3-03/S3-04 (nicht auf meiner Liste). Ich habe sie aus `yang_n3.md` hergeleitet: f_0(S) + f_1(S) + f_2(S) ⊆ f_0(N) nach Definition von S, Dimension ≥ dim S + 2 = 3 nach Lemma B, und dim f_0(N) = dim N = 3 (G4), also Gleichheit. dim w·P_1 = 3 nach (SN2). w·P_2 ⊆ J, weil N = {y : a_i·j_y ∈ J} (F_i(x) = [a_i·j_x] = 0 in Q = K′/J). Benutzt: dim N = 3, dim S = 1 (Restfall).

**(iii) Selbst nachvollzogen.** Nach (D) ist (j_i) ↦ [Σ b_i·j_i] von J³ nach K^34/K′ injektiv. Auf J³_0 ist Σ b_i·j_i = b_0·(j_0 + a_1j_1 + a_2j_2) + c_1j_1 + c_2j_2 = Θ(j). dim J³_0 = 21 − 13 = 8 braucht, dass (j_i) ↦ Σ a_i·j_i auf K′ surjektiv ist, also K′ = J + a_1J + a_2J; das ist rk L = 6 = q (Restfall), und diese Umrechnung habe ich nachvollzogen (im L = (J + a_1J + a_2J)/J). K′ ⊕ Θ(J³_0) ⊆ K″ wegen c_i·j ∈ K′ + a_i·K′.

**Nachgerechnet** (Abschnitt 7.3): An einem echten Verfahren der Länge 39 für ⟨3,2,7⟩ ist Θ mit den echten c_i injektiv modulo K′ (Rang 3 = dim J³_0), mit trivialen c_i (6.1) dagegen 0.

**Urteil: hält**, unter den Restfall-Daten rk L = 6, dim N = 3, dim S = 1, die der Wortlaut mit „im Restfall R-327“ voraussetzt.

---

## 5. Teilaussage C (Gestalt im Fall e = 3)

**Selbst nachvollzogen:**
- K′ = J + a_1J + a_2J = w·P_3 + u·P_1, also 13 ≤ 10 + 3 und überall Gleichheit; K″ = w·P_4 + u·P_2 mit 21 ≤ 15 + 6 und Gleichheit nach B(i); K^34 = K″ ⊕ b_0·K′ aus 21 + 13 = 34. ✔
- Folgerungen über Punkte: dim w·P_4 = 15 verlangt mindestens 15 verschiedene a-Punkte im Träger von w, nicht auf einer Quartik; dim u·P_2 = 6 entsprechend 6 Punkte, nicht auf einem Kegelschnitt. ✔
- 4.2: f_0(N) = w·P_1, f_0(S) = ⟨w⟩, ker L = {(w(ℓ_1 + a_2h), w(ℓ_2 − a_1h))}, Dimension 8 = 2m − rk L. Die Rechnung (Koeffizient von u muss 0 sein, quadratische Anteile mit a_1q_1 + a_2q_2 = 0) nachvollzogen; sie benutzt die Eindeutigkeit in K′ = w·P_3 ⊕ u·P_1. ✔
- 4.3: U/N ≅ S² ⊕ K (Dimension 7 − 3), Q ≅ S³ ⊕ S¹ (Dimension 4 + 2 = 6 = q); F_1, F_2 sind Multiplikation mit x bzw. y. Jede Kombination s·x + t·y ≠ 0 ist injektiv auf S² ⊕ K, also Rang 4 und Kern N. Blockgrößen 4×3 und 2×1, das sind L^T_3 und L^T_1 in der Konvention L_ε = ε×(ε+1). rk L = 6, rk H = 4 passen. Das Symbol ρ im Tripel (ρ, rk L, rk H) ist in meinen Dateien nicht definiert; ich habe nur rk L und rk H geprüft. ✔
- 4.4: (1) jeder Index liegt im Träger von w oder u (sonst verschwände an t ganz K′ ⊕ span(b_iq_k) = K^34). (2) 10 Vektoren aus w·P_3 und 18 Vektoren b_i·w·G sind nach (D) unabhängig und verschwinden außerhalb des Trägers von w, also ≥ 28 Produkte dort. (3) K″ = K′ ⊕ Θ(J³_0) aus 13 + 8 = 21; Θ verschwindet auf Z_1; also u·P_2 = u·P_1 auf Z_1, u ≠ 0 dort nach (1), also dim P_2 = dim P_1 auf den a-Punkten von Z_1; da je d + 1 verschiedene Punkte für P_d unabhängige Bedingungen stellen, höchstens 3 Punkte. Auf Z_1 ist K^{Z_1} = u·(P_1 + b_0P_1)|_{Z_1}, je Faser höchstens 2-dimensional, also |Z_1| ≤ 6. (4) mindestens 6 − 3 = 3 gemeinsame a-Punkte. ✔

**Urteil: hält**, unter B und den Restfall-Daten.

---

## 6. Teilaussage E (Satz X)

### 6.1 Beweis, selbst nachvollzogen

- Basiswechsel β_t(B) ↦ β_t(BG), C_t ↦ C_tG^{−1}: wieder ein Verfahren; s·B·h^T wird s·B·(hG^T)^T. Mit hG^T = e_7 ist h = e_7. ✔
- Zerlegung in (i), (ii), (iv) (und (iii)): aus den Spaltenblöcken von AB mit B_H = 0 bzw. b = 0 nachgerechnet. ✔
- (a): Die α_t ⊗ β^H_t (t ∈ T_H) spannen einen Raum der Dimension |T_H| − d auf; Ausdrücken durch eine Basis aus ihnen gibt ein Verfahren der Länge |T_H| − d für ⟨3,2,6⟩. Also |T_H| − d ≥ 30, d. h. d + n ≤ 4. ✔
- (b): (ii) heißt (x_t[i′])_t ∈ V^⊥ für jede Zeile i′, also x_t = Σ_l λ^l_t μ_l. Der T_H-Anteil von (iv) ist Σ_l N_l ⊗ μ_l mit N_l ∈ K^6 ⊗ K^2 vom Rang ≤ 2. Die übrigen n Terme sind Rang 1. ⟨3,2,1⟩ hat Rang 6 (Abflachung A ↦ (b ↦ Ab) injektiv). Also 6 ≤ 2d + n. ✔
- n ≤ 2 aus 6 ≤ 2(4 − n) + n. Zusatz n = 2 ⇒ d = 2, n = 1 ⇒ d = 3, n = 0 ⇒ d ∈ {3, 4} nachgerechnet. ✔
- n zählt auch Indizes mit β_t = 0 (s_t = 0). Das passt zum Wortlaut („s_t ∈ K^{1×2}“ erlaubt 0) und zum Beweis (β^H_t = 0). ✔
- „Insbesondere“: 4 bzw. 3 Produkte, die nur die siebte Spalte lesen, haben β_t = s_t·B·e_7^T, also n ≥ 3 > 2. ✔

### 6.2 Nachgerechnet

Am transformierten Verfahren der Länge 39 (Abschnitt 7.3) für elf Richtungen h: (a) |T_H| − d ≥ 30 und (b) 6 ≤ 2d + n und d + n ≤ 39 − 30 gelten in allen Fällen (Werte n ∈ {0, 2, 4, 6}). Das prüft die Ungleichungen (a) und (b) an einem Beispiel, nicht den Satz für Länge 34.

### 6.3 Voraussetzungen

Gebraucht wird nur **R_K(⟨3,2,6⟩) ≥ 30** über demselben Körper K (die Gleichheit „= 30“ aus dem Artefakt wird nicht benutzt) und R(⟨3,2,1⟩) = 6 (nachvollzogen). Die erste Voraussetzung steht im Artefakt (Abschnitt 5 „Voraussetzungen“, L-3), **im Wortlaut von E in B-021 aber nicht**; dort heißt es nur „Sei K ein beliebiger Körper“. Geprüft habe ich sie nicht. `yang_n3.md` behauptet sie über jedem Körper (⌈(24·6 + 2)/5⌉ = 30), mit eigenem Status. E braucht den Restfall nicht und keinen unendlichen Körper.

**Urteil: hält**, bedingt durch R_K(⟨3,2,6⟩) ≥ 30.

---

## 7. Eigene Nachrechnung

Alle Programme habe ich selbst geschrieben (Python 3, numpy, ganze Zahlen modulo der Primzahl p = 1 000 003, keine Gleitkommazahlen), ohne den Code des Artefakts zu benutzen. Sie stehen in Anhang B.

### 7.1 A an echten Verfahren (`testA.py`, Startwerte 1 und 2)

Standardverfahren für ⟨3,2,7⟩ (Länge 42), zufälliger Basiswechsel auf allen drei Seiten und zufällige Skalierung je Produkt. Ausgabe: Brent 0 Fehler, dim ker W = 21, (A, B, C, D) = (wahr, wahr, wahr, wahr), aus K′ rekonstruiertes C: Brent 0 Fehler und gleich dem ursprünglichen C. Nach Störung eines β-Koeffizienten: (A, B, C, D) = (falsch, wahr, falsch, wahr).

### 7.2 Kernschritt von D an Lagen (`testD.py`, Rechenblock 1)

Gegenstand: genau die Aussage von 6.2 als Aussage über Lagen. Erzeugt werden 34 a-Punkte, w, u mit Z_1 (bis zu 6 Indizes auf bis zu 3 Punkten, w = 0 dort) in vier Arten: allgemeine Punkte mit Fasern; kleine Gitter (viele kollineare Punkte); Punkte auf wenigen Geraden; Punkte auf Graphen vom Grad 3 oder 4 plus einige freie Punkte; Z_1-Punkte teils auf Punkten des Trägers von w. Gefiltert auf dim w·P_2 = 6, dim J = 7, dim K′ = 13, dim K″ = 21. Dann: (INJ5) als Rang von [w·P_5; u·P_3] = 31; vollständiger Lösungsraum V_C von (C′); für **jeden** Basisvektor von V_C: liegt (c_1, c_2) auf dem Träger von w in {(a_1h + ℓ_1, a_2h + ℓ_2)}? Und Rang von Θ(J³_0) modulo K′ über alle Basislösungen.

Ergebnis (4 Läufe zu 150 s, Startwerte 11 bis 14): 50 517 Versuche, 29 597 zulässige Lagen, davon **5 514 mit (INJ5)**. In **allen** 5 514 Lagen sind alle Lösungen auf dem Träger von w trivial und Θ(J³_0) ⊆ K′. **Kein Gegenbeispiel.** In den 24 083 Lagen ohne (INJ5) war das Ergebnis ebenso (meist dim V_C = 57, vereinzelt 58 bis 60); das betrifft Vermutung S4-07-V, nicht B-021. dim N war in allen zulässigen Lagen 3, dim J³_0 immer 8.

### 7.3 Gegenprobe gegen Blindheit (`strassen.py`, `control.py`, `testE.py`)

Weil `verfahren/` nicht auf meiner Liste steht, habe ich selbst ein echtes Verfahren gebaut: ⟨3,2,7⟩ aus drei Blöcken (Strassen für die Zeilen 0 und 1 von A, je zwei Spalten von B, dazu 4 Standardprodukte für Zeile 2) und 6 Standardprodukten für die letzte Spalte, Länge 39, zufällig transformiert und auf a_0 = 1 skaliert. Brent 0 Fehler, (A) bis (D) gelten, dim J³_0 = 3. Mit den echten c_i: Rang von Θ modulo K′ = 3 (voll); mit trivialen c_i nach 6.1: 0. Die Rechnung erkennt also nicht triviale Lösungen, wo es sie gibt.

### 7.4 Programme des Artefakts

Aus dem Artefakt herausgeschnitten; alle zehn SHA-256-Summen stimmen. `fam.py 11` und `vc.py` laufen und geben die Werte aus Abschnitt 7.2 des Artefakts wieder (dim V_C = 57, Rang (D′) 0; Projektion auf c hat Rang 8 und liegt in P_1² + {(a_1μ, a_2μ)}). `sanity.py`, `struk.py`, `search1.py`, `noninj.py` habe ich nicht laufen lassen (die ersten beiden brauchen Dateien aus `verfahren/`, die anderen betreffen nur Vermutung S4-07-V). Diese Programme stützen keine der Aussagen A bis E, sie betreffen Abschnitt 7 des Artefakts.

---

## 8. Nur gelesen, nicht nachvollzogen

- Restfall R-327 und alle Angaben, die das Artefakt aus S3-03, S3-04 und B-017 bis B-019 übernimmt (rk L = 6 = q, dim N = 3, dim S = 1, Δ = 2, (ρ, rk L, rk H) = (4, 6, 4)). Nachvollzogen habe ich nur, was daraus folgt.
- R_K(⟨3,2,6⟩) ≥ 30 (B-006, `yang_n3.md`). `yang_n3.md` habe ich gelesen und die für B benutzten Teile (R1, Lemma A als Normalform, G4, Lemma B, Definitionen von N, S, L, H) nachvollzogen, den Satz selbst nicht geprüft.
- Abschnitte 7 und 8 des Artefakts (Bauversuch, Vermutung, Ansatzpunkte) gehören nicht zu B-021.

---

## 9. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine. Nichts ins Projektgedächtnis geschrieben.
- Rechenblöcke: zwei, beide weit unter 30 Minuten auf höchstens 4 Kernen.
  - Block 0, zwischen den Commits 29191c8 (09:55:06 UTC) und 3fe49a9 (09:57:37 UTC): `testA.py` und `control.py` (je unter 5 s), Probelauf `testD.py 1 20` (20 s, 1 Kern).
  - Block 1, nach Commit 3fe49a9: `testD.py` mit vier Startwerten zu je 150 s parallel auf 4 Kernen (09:57:39 bis 10:00:10 UTC), danach ohne Commit dazwischen `testE.py` und die Programme des Artefakts (je unter 30 s), Ende etwa 10:01 UTC. Zusammen etwa 3½ Minuten.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs.

---

## Anhang B: eigene Programme

### gf.py

SHA-256 `d87f129e43ccef8ff82e73d8151c9b57106505a65d534d5fca1a572710018ac4`

```python
# own exact linear algebra mod a prime (independent of the artifact's ff.py)
import numpy as np
p = 1000003
def red(M):
    """row echelon (reduced) of M mod p; returns (R, pivots)"""
    A = np.array(M, dtype=np.int64) % p
    if A.ndim == 1: A = A.reshape(1, -1)
    rows, cols = A.shape
    piv = []; r = 0
    for c in range(cols):
        if r == rows: break
        nz = np.flatnonzero(A[r:, c])
        if nz.size == 0: continue
        k = r + nz[0]
        if k != r: A[[r, k]] = A[[k, r]]
        A[r] = A[r] * pow(int(A[r, c]), p - 2, p) % p
        col = A[:, c].copy(); col[r] = 0
        idx = np.flatnonzero(col)
        if idx.size:
            A[idx] = (A[idx] - np.outer(col[idx], A[r])) % p
        piv.append(c); r += 1
    return A[:r], piv
def rk(M):
    M = np.asarray(M)
    if M.size == 0: return 0
    return len(red(M)[1])
def ker(M, n=None):
    """basis (rows) of {x : M x = 0}"""
    M = np.asarray(M, dtype=np.int64)
    if M.size == 0:
        return np.eye(n, dtype=np.int64)
    n = M.shape[1]
    R, piv = red(M)
    free = [c for c in range(n) if c not in set(piv)]
    out = []
    for f in free:
        v = np.zeros(n, dtype=np.int64); v[f] = 1
        for i, c in enumerate(piv): v[c] = (-R[i, f]) % p
        out.append(v)
    return np.array(out, dtype=np.int64).reshape(len(out), n)
def mons(x, y, d, homog=False):
    out = []
    for t in range(d + 1):
        if homog and t != d: continue
        for i in range(t + 1):
            out.append(pow_vec(x, i) * pow_vec(y, t - i) % p)
    return out
def pow_vec(v, e):
    r = np.ones_like(v)
    for _ in range(e): r = r * v % p
    return r
```

### testA.py

SHA-256 `de35b6eb92838bb758706f9ba9a3443718dc91523c7241c0e7651359fc4b0f71`

```python
# Check of S4-07-A on transformed standard algorithms for <3,2,m> (own code)
import numpy as np, sys
from gf import *
BASE = None
rng = np.random.default_rng(int(sys.argv[1]) if len(sys.argv) > 1 else 1)
def inv(M):
    n = len(M); R, piv = red(np.hstack([M % p, np.eye(n, dtype=np.int64)]))
    assert piv[:n] == list(range(n)); return R[:, n:]
def rinv(n):
    while True:
        M = rng.integers(0, p, (n, n))
        if rk(M) == n: return M
def scheme(m):
    if BASE is not None: U, V, C = BASE(m)
    else:
      U, V, C = [], [], []
      for i in range(3):
        for j in range(2):
            for k in range(m):
                u = np.zeros((3, 2), np.int64); u[i, j] = 1
                v = np.zeros((2, m), np.int64); v[j, k] = 1
                c = np.zeros((3, m), np.int64); c[i, k] = 1
                U.append(u); V.append(v); C.append(c)
    S, T, G = rinv(3), rinv(2), rinv(m)
    Si, Ti, Gi = inv(S), inv(T), inv(G)
    U2, V2, C2 = [], [], []
    for u, v, c in zip(U, V, C):
        l, mu = int(rng.integers(1, p)), int(rng.integers(1, p))
        nu = pow(l * mu % p, p - 2, p)
        U2.append(S.T @ u % p @ T.T % p * l % p)
        V2.append(Ti.T @ v % p @ G.T % p * mu % p)
        C2.append(Si @ c % p @ Gi % p * nu % p)
    return U2, V2, C2
def brent(U, V, C, m):
    T = np.zeros((6, 2 * m, 3 * m), np.int64)
    for u, v, c in zip(U, V, C):
        T = (T + np.einsum('a,b,c->abc', u.reshape(-1), v.reshape(-1), c.reshape(-1))) % p
    want = np.zeros_like(T)
    for i in range(3):
        for j in range(2):
            for k in range(m):
                want[i * 2 + j, j * m + k, i * m + k] = 1
    return int(np.count_nonzero(T != want))
def conds(U, V, Kp, m):
    r = len(U)
    a = [np.array([U[t][i, 0] for t in range(r)]) for i in range(3)]
    b = [np.array([U[t][i, 1] for t in range(r)]) for i in range(3)]
    pk = [np.array([V[t][0, k] for t in range(r)]) for k in range(m)]
    qk = [np.array([V[t][1, k] for t in range(r)]) for k in range(m)]
    kd = rk(Kp)
    inK = lambda v: rk(np.vstack([Kp, v])) == kd
    cA = all(inK(a[i] * qk[k] % p) for i in range(3) for k in range(m))
    cB = all(inK(b[i] * pk[k] % p) for i in range(3) for k in range(m))
    cC = all(inK((a[i] * pk[k] - b[i] * qk[k]) % p) for i in range(3) for k in range(m))
    BQ = np.array([b[i] * qk[k] % p for i in range(3) for k in range(m)])
    cD = rk(np.vstack([Kp, BQ])) == kd + 3 * m
    return cA, cB, cC, cD, BQ
m = 7
U, V, C = scheme(m); r = len(U)
print('brent original', brent(U, V, C, m))
Wm = np.array([c.reshape(-1) for c in C])          # r x 3m ; W(v) = v @ Wm
Kp = ker(Wm.T)                                       # rows v with v @ Wm = 0
print('dim kerW', Kp.shape[0], '= r-3m', r - 3 * m)
cA, cB, cC, cD, BQ = conds(U, V, Kp, m)
print('forward (A,B,C,D):', cA, cB, cC, cD)
# converse: rebuild W from K' and the b_i q_k only, then C_t := W(e_t)
basis = np.vstack([Kp, BQ])                          # r x r, invertible by (D)
img = np.vstack([np.zeros((Kp.shape[0], 3 * m), np.int64), np.eye(3 * m, dtype=np.int64)])
# W as matrix M with basis @ M = img  ->  M = basis^{-1} img
M = inv(basis) @ img % p
C3 = [M[t].reshape(3, m) for t in range(r)]
print('brent rebuilt', brent(U, V, C3, m), ' same C:', all((x == y).all() for x, y in zip(C, C3)))
# negative test: perturb one beta coefficient -> some condition must fail, and the rebuilt C must fail Brent
V4 = [v.copy() for v in V]; V4[5][1, 3] = (V4[5][1, 3] + 1) % p
cA, cB, cC, cD, BQ4 = conds(U, V4, Kp, m)
print('perturbed (A,B,C,D) with old K\':', cA, cB, cC, cD)
```

### strassen.py

SHA-256 `7cb1a1e36124ac408a9b6d6f0a58077c7a1d7cce165bb881d35bfdee7f229501`

```python
# scheme for <3,2,m>: Strassen on rows 0,1 of A for column pairs of B, standard otherwise
import numpy as np
from gf import p
def E(sh, entries):
    M = np.zeros(sh, np.int64)
    for (i, j, c) in entries: M[i, j] = (M[i, j] + c) % p
    return M
def base(m):
    U, V, C = [], [], []
    pairs = [(2 * q, 2 * q + 1) for q in range(m // 2)]
    for (k0, k1) in pairs:
        A = lambda *e: E((3, 2), e); B = lambda *e: E((2, m), e); Cm = lambda *e: E((3, m), e)
        prods = [
         (A((0,0,1),(1,1,1)), B((0,k0,1),(1,k1,1)), Cm((0,k0,1),(1,k1,1))),
         (A((1,0,1),(1,1,1)), B((0,k0,1)),           Cm((1,k0,1),(1,k1,-1))),
         (A((0,0,1)),         B((0,k1,1),(1,k1,-1)), Cm((0,k1,1),(1,k1,1))),
         (A((1,1,1)),         B((1,k0,1),(0,k0,-1)), Cm((0,k0,1),(1,k0,1))),
         (A((0,0,1),(0,1,1)), B((1,k1,1)),           Cm((0,k0,-1),(0,k1,1))),
         (A((1,0,1),(0,0,-1)),B((0,k0,1),(0,k1,1)),  Cm((1,k1,1))),
         (A((0,1,1),(1,1,-1)),B((1,k0,1),(1,k1,1)),  Cm((0,k0,1))),
        ]
        for u, v, c in prods: U.append(u); V.append(v); C.append(c)
        for j in range(2):
            for k in (k0, k1):
                U.append(E((3, 2), [(2, j, 1)])); V.append(E((2, m), [(j, k, 1)])); C.append(E((3, m), [(2, k, 1)]))
    if m % 2:
        k = m - 1
        for i in range(3):
            for j in range(2):
                U.append(E((3, 2), [(i, j, 1)])); V.append(E((2, m), [(j, k, 1)])); C.append(E((3, m), [(i, k, 1)]))
    return U, V, C
```

### control.py

SHA-256 `e3527026ec868ab70db3aec8b86d38c597296c3be010d109d9ad2a15801b84a0`

```python
# Positive control: on a real scheme for <3,2,7> (Strassen blocks, length 39, randomly transformed),
# (D') must hold, so the Theta computation used in testD.py must report full rank (not blind).
import numpy as np, sys
from gf import *
import strassen
seed = sys.argv[1] if len(sys.argv) > 1 else '3'
sys.argv = ['x', seed]
src = open('testA.py').read().split("m = 7")[0]
exec(src); BASE = strassen.base
m = 7; U, V, C = scheme(m); r = len(U)
for t in range(r):                               # scaling alpha_t(e00) = 1
    s = int(U[t][0, 0]); si = pow(s, p - 2, p); U[t] = U[t] * si % p; C[t] = C[t] * s % p
print('length', r, 'brent', brent(U, V, C, m))
a = [np.array([U[t][i, 0] for t in range(r)]) for i in range(3)]
b = [np.array([U[t][i, 1] for t in range(r)]) for i in range(3)]
J = np.array([[V[t][1, k] for t in range(r)] for k in range(m)])
Kp = ker(np.array([c.reshape(-1) for c in C]).T)
print('A-conditions', conds(U, V, Kp, m)[:4])
c1, c2 = (b[1] - a[1] * b[0]) % p, (b[2] - a[2] * b[0]) % p
Z = ker(np.hstack([J.T, (a[1] * J % p).T, (a[2] * J % p).T]))
Th = np.array([(c1 * (z[m:2*m] @ J % p) + c2 * (z[2*m:] @ J % p)) % p for z in Z])
print('dim J^3_0', Z.shape[0], ' rank Theta mod K\'', rk(np.vstack([Kp, Th])) - Kp.shape[0])
l1, l2, mu = [sum(int(rng.integers(0, p)) * f for f in (np.ones(r, np.int64), a[1], a[2])) % p for _ in range(3)]
d1, d2 = (l1 + a[1] * mu) % p, (l2 + a[2] * mu) % p
KJ = red(np.vstack([J, a[1] * J % p, a[2] * J % p]))[0]
Th0 = np.array([(d1 * (z[m:2*m] @ J % p) + d2 * (z[2*m:] @ J % p)) % p for z in Z])
print('trivial c (6.1): rank Theta mod (J+a1J+a2J)', rk(np.vstack([KJ, Th0])) - KJ.shape[0])
```

### testD.py

SHA-256 `2302b69247d2f7eac87aac97e26a5b54cc6c59d3d94f13e5ab924555146c0e1b`

```python
# Check of the core step of S4-07-D (section 6.2) on configurations, own code.
# Hypotheses tested: J = wP2 (+) <u> (dim 7, dim wP2 = 6), K' = J + a1 J + a2 J (dim 13),
# K'' = K' + a1 K' + a2 K' (dim 21), (INJ5): rank [w P5 ; u P3] = 31.
# Claim tested: every solution (c1,c2,kappa) of (C') has c_i = a_i h + l_i on supp(w),
# and Theta(J^3_0) is contained in K' for every solution.
import numpy as np, sys, time
from gf import *
seed = int(sys.argv[1]); tl = float(sys.argv[2]); rng = np.random.default_rng(seed)
r = 34
def config():
    mode = int(rng.integers(0, 4))
    nZ1 = int(rng.integers(0, 7)); k = int(rng.integers(1, 4))
    if mode == 0:   # generic points, fibers
        npts = int(rng.integers(15, 29)); P1 = rng.integers(0, p, (npts, 2))
    elif mode == 1: # small grid (many collinear points)
        g = int(rng.integers(4, 8)); grid = np.array([(x, y) for x in range(g) for y in range(g)])
        npts = min(len(grid), int(rng.integers(15, 29))); P1 = grid[rng.choice(len(grid), npts, replace=False)]
    elif mode == 2: # points on a few lines
        nl = int(rng.integers(3, 6)); pts = []
        while len(pts) < 28:
            s, c = rng.integers(0, p, 2); x = int(rng.integers(0, p))
            l = int(rng.integers(0, nl)); pts.append((x, (x * (l + 1) + l * 7) % p))
        P1 = np.array(pts[:int(rng.integers(15, 29))])
    else:           # points on a cubic/quartic graph plus some extra
        d = int(rng.integers(3, 5)); co = rng.integers(0, p, d + 1)
        x = rng.integers(0, p, 22); y = np.zeros_like(x)
        for c in co: y = (y * x + c) % p
        P1 = np.vstack([np.stack([x, y], 1), rng.integers(0, p, (int(rng.integers(0, 6)), 2))])
    nW = r - nZ1
    idx = np.concatenate([np.arange(len(P1)), rng.integers(0, len(P1), max(0, nW - len(P1)))])[:nW]
    ptsW = P1[idx]
    Z1pts = rng.integers(0, p, (k, 2))
    if rng.random() < 0.5 and nZ1:   # Z1 points coincide with points of supp(w)
        Z1pts = P1[rng.integers(0, len(P1), k)]
    ptsZ = Z1pts[rng.integers(0, k, nZ1)] if nZ1 else np.zeros((0, 2), np.int64)
    pts = np.vstack([ptsW, ptsZ]).astype(np.int64)
    a1, a2 = pts[:, 0] % p, pts[:, 1] % p
    w = np.zeros(r, np.int64); w[:nW] = rng.integers(1, p, nW)
    if rng.random() < 0.3: w[:nW] = 1
    u = rng.integers(1, p, r)
    zu = int(rng.integers(0, nW)); u[rng.choice(nW, zu, replace=False)] = 0
    return a1, a2, w, u, mode, nZ1
def solve_C(a1, a2, J, Kp):
    Ann = ker(Kp); A = [a1, a2]; m = J.shape[0]; kd = Kp.shape[0]
    nun = 2 * r + m * kd; eqs = []
    for i in range(2):
        for k in range(m):
            blk = np.zeros((Ann.shape[0], nun), np.int64)
            blk[:, i * r:(i + 1) * r] = Ann * J[k] % p
            blk[:, 2 * r + kd * k:2 * r + kd * (k + 1)] = (-((Ann * A[i] % p) @ Kp.T)) % p
            eqs.append(blk)
    return ker(np.vstack(eqs))
stats = {}; t0 = time.time(); n = 0; bad = []
while time.time() - t0 < tl:
    n += 1
    a1, a2, w, u, mode, nZ1 = config()
    P2 = mons(a1, a2, 2); P3 = mons(a1, a2, 3); P5 = mons(a1, a2, 5)
    wP2 = np.array([w * f % p for f in P2])
    J = np.vstack([wP2, u])
    if rk(wP2) != 6 or rk(J) != 7: stats['J'] = stats.get('J', 0) + 1; continue
    Kp = red(np.vstack([J, a1 * J % p, a2 * J % p]))[0]
    if Kp.shape[0] != 13: stats['K1'] = stats.get('K1', 0) + 1; continue
    if rk(np.vstack([Kp, a1 * Kp % p, a2 * Kp % p])) != 21: stats['K2'] = stats.get('K2', 0) + 1; continue
    inj5 = rk(np.vstack([[w * f % p for f in P5], [u * f % p for f in P3]])) == 31
    AnnJ = ker(J)
    dimN = ker(np.vstack([(AnnJ * a1 % p) @ J.T % p, (AnnJ * a2 % p) @ J.T % p])).shape[0]
    V = solve_C(a1, a2, J, Kp)
    S = np.flatnonzero(w)
    C1, C2 = V[:, :r], V[:, r:2 * r]
    proj = np.hstack([C1[:, S], C2[:, S]])
    one = np.ones(r, np.int64); z = np.zeros(r, np.int64)
    triv = [np.concatenate([f, z]) for f in (one, a1, a2)] + [np.concatenate([z, f]) for f in (one, a1, a2)] \
         + [np.concatenate([a1 * a1 % p, a2 * a1 % p]), np.concatenate([a1 * a2 % p, a2 * a2 % p])]
    triv = np.array(triv)
    trivS = np.hstack([triv[:, S], triv[:, r + S]])
    istriv = rk(np.vstack([trivS, proj])) == rk(trivS)
    # Theta on J^3_0 for every basis solution
    Z = ker(np.hstack([J.T, (a1 * J % p).T, (a2 * J % p).T]))
    Th = [(c1 * (zz[7:14] @ J % p) + c2 * (zz[14:] @ J % p)) % p for c1, c2 in zip(C1, C2) for zz in Z]
    thr = rk(np.vstack([Kp, np.array(Th)])) - 13
    key = (mode, 'INJ5' if inj5 else 'noINJ5', 'N=%d' % dimN, 'VC=%d' % V.shape[0], 'triv' if istriv else 'NONTRIV', 'Th=%d' % thr, 'J30=%d' % Z.shape[0])
    stats[key] = stats.get(key, 0) + 1
    if inj5 and (not istriv or thr > 0): bad.append((a1.tolist(), a2.tolist(), w.tolist(), u.tolist()))
print('seed', seed, 'trials', n, 'counterexamples(INJ5 & not trivial)', len(bad))
for k_, v_ in sorted(stats.items(), key=lambda x: str(x[0])): print(' ', k_, v_)
```

### testE.py

SHA-256 `8d9de55a70ebe3cb955da1044e272aa7a5806eb6471aed6312fb4aaeae9ba2ec`

```python
# Satz X ingredients on the transformed Strassen-type scheme (length 39) for several h:
# n = #{t : beta_t = s_t B h^T}, d = dim V^perp after moving h to e_7; check (a) |T_H|-d >= 30, (b) 6 <= 2d+n.
import numpy as np, sys
from gf import *
import strassen
sys.argv = ['x', '5']
exec(open('testA.py').read().split("m = 7")[0]); BASE = strassen.base
m = 7; U, V, C = scheme(m); r = len(U)
def inv(M):
    n_ = len(M); R, piv = red(np.hstack([M % p, np.eye(n_, dtype=np.int64)])); return R[:, n_:]
# columns of B that carry a "rank-1 in direction h" product: candidates h from the beta's themselves
cands = []
for v in V:
    if rk(v) == 1:
        h = red(v)[0][0]; cands.append(h)
cands.append(rng.integers(0, p, m))
seen = set()
for h in cands:
    key = tuple(h.tolist())
    if key in seen: continue
    seen.add(key)
    # G with h G^T = e_7: take G^T = inverse of a matrix whose last row is h
    while True:
        Mx = np.vstack([rng.integers(0, p, (m - 1, m)), h])
        if rk(Mx) == m: break
    GT = inv(Mx); G = GT.T % p                       # h @ GT = e_7
    V2 = [v @ GT % p for v in V]                     # beta'(B) = beta(B G): coefficients V G^T
    C2 = [c @ inv(G) % p for c in C]
    assert brent(U, V2, C2, m) == 0
    TH = [t for t in range(r) if np.any(V2[t][:, :m - 1])]
    n = r - len(TH)
    X = np.array([np.outer(U[t].reshape(-1), V2[t][:, :m - 1].reshape(-1)).reshape(-1) % p for t in TH])
    d = len(TH) - rk(X)
    print('n', n, 'd', d, ' |T_H|-d =', len(TH) - d, '(>=30?)', len(TH) - d >= 30, ' 6<=2d+n?', 6 <= 2 * d + n, ' d+n <= r-30?', d + n <= r - 30)
```

Aufrufe aus einem Verzeichnis mit allen Dateien: `python3 testA.py 1`, `python3 testA.py 2`, `python3 control.py 3`, `python3 testD.py <Startwert> 150` für 11 bis 14, `python3 testE.py`. `control.py` und `testE.py` lesen `testA.py` als Quelltext ein (bis zur Zeile `m = 7`).
