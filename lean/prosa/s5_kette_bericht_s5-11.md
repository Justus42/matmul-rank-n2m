# Prüfbericht S5-11: Glieder K-21 bis K-31 der Kette zu ⟨3,2,7⟩

Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit `d6469d8`, Zeilen 379 bis 549 (Abschnitte 5 und 6, Glieder K-21 bis K-31).
Rolle: Prüfer nach Protokoll Abschnitt 5. Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Eingeblendetes Projektgedächtnis.** Mir war zu Beginn der Index des Projektgedächtnisses eingeblendet (`MEMORY.md`). Er enthält Projektregeln: Ziel des Projekts (exakter Tensorrang von ⟨n,2,m⟩, darunter 3×2×7), Protokollfassung 0.6, Rechte und Grenzen des Orchestrators, Budget von Stufe 4, Regeln zu Prüfern und unabhängigen Suchern, Fremdmodell über die Gemini-Bridge, Literaturwache, Freigabe von Domains, und Verweise auf die Einträge `verfahren-datenformat` und `lean-project-ci`. Außerdem wurden zwei Einzeleinträge eingeblendet: `gemini-bridge` (Repo nicht in der Bridge freigegeben, Zeitlimit 60 s) und `aussagen-abgleich-n3` (Bridge-Hinweis, lokaler Lean-Bau mit `import YangBounds.Statements`). Keiner dieser Einträge nennt ein Urteil, einen Status oder einen Befund zu K-21 bis K-31 oder zu einem anderen Glied der Kette.

**Gesehenes über die Positivliste hinaus.**
- Die Arbeitsanweisung des Orchestrators selbst. Sie sagt, dass andere Prüfer unabhängig an derselben Datei arbeiten. Ein erwünschtes Ergebnis nennt sie nicht.
- Die Namen der Dateien im gemeinsamen Projektordner (`A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md`), nur als Liste in der Sitzungsbeschreibung, nicht den Inhalt.
- Von `PROTOKOLL.md` die Liste aller Überschriften der Ebene 2 (Abschnitte 1 bis 11), weil ich damit die Zeilen von Abschnitt 5 gesucht habe. Gelesen habe ich nur Abschnitt 5.
- Aus `git status` die Angabe „HEAD detached from refs/heads/main“, aus `git rev-parse` den Kurzhash des ausgecheckten Stands (`1425198`). Keine Commit-, Zweig- oder PR-Listen.
- Um die Aussagen der vorausgesetzten Glieder zu finden, habe ich in den Zeilen 109 bis 378 nur die Überschriftszeilen der Form `### K-n (…)` ausgegeben. Dabei sah ich die Titel von K-1 bis K-20 (zum Beispiel „K-15 (Lemma 10, Kern von Φ, und die Grundungleichung (G))“). Danach habe ich von K-3, K-7, K-12, K-13, K-14 und K-19 nur Wortlaut und Voraussetzungszeile gelesen, jeweils bis vor die Zeile „Beweis“. Beweise dieser Glieder habe ich nicht gesehen.
- Die Zeilen 1 bis 11, 550 bis 752 und ab 807 habe ich nicht gelesen. Die Datei liegt zum Lesen nach Zeilen als Kopie in meinem Arbeitsordner; über sie lief kein grep.

**Hilfsmittel.** Keine Subagenten, keine Fremdmodell-Anfragen. Ein eigenes Prüfprogramm in Python (Anhang A), nur ganze Zahlen, `fractions.Fraction` und Restklassen modulo p.

## 1. Rahmen und benutzte Wortlaute

Rahmen der Abschnitte 5 und 6 (Zeilen 381 und 494): F Körper, K algebraischer Abschluss, V Verfahren der Länge 34 für ⟨3,2,7⟩ über K, (S, T) ∈ 𝒢*, V̂ die Normalform zu (S, T). Nach K-12 (Wortlaut, Zeile 241) erfüllt V̂ (SN1), (SN2), α̂_t(e_00) = 1, D(e_00) = Einheitsmatrix, f_0 = ℬ, f_i(x) = a_i·f_0(x). Nach K-19 (Zeile 339): dim Q = 6, rk L = 6, rk H = 4, dim N = 3, Δ = 2, dim Ŝ = 1.

Als gegeben benutzt (nur Wortlaut): K-3 (Zeile 136), K-7 (D1), (D2), (T1) bis (T5) (Zeilen 186 bis 193), K-12 (Zeile 241), K-13 (Zeile 255 f.), K-14 (i) bis (iv) (Zeilen 264 bis 268), K-19 (Zeilen 337 bis 339).

Allgemeine Bemerkung zur Schreibweise, die ich bei allen Gliedern benutze: Ein Polynom f ∈ 𝒜 wirkt auf v ∈ K^34 durch (f·v)_t = f(ξ(t))·v_t. Für f = a_i stimmt das mit dem komponentenweisen Produkt mit dem Vektor a_i überein, weil a_i(t) die i-te Koordinate von ξ(t) ist und a_0 = 1. Die Abbildung f ↦ f·v ist linear und multiplikativ: (fg)·v = f·(g·v). Daraus folgt v·P_{d+1} = v·P_d + a_1·(v·P_d) + a_2·(v·P_d), weil P_{d+1} = P_d + a_1P_d + a_2P_d als Räume formaler Polynome. Das benutze ich unten als „(Stufung)“. Nirgends wird verlangt, dass die a-Punkte ξ(t) verschieden sind; zusammenfallende Punkte ändern an keinem Schritt etwas. Nirgends wird durch 2 oder eine andere ganze Zahl geteilt; die Kette arbeitet über dem algebraisch abgeschlossenen K, in jeder Charakteristik.

## 2. Nachrechnung je Glied

### K-21 (Zeilen 383 bis 396)

**Aussage und Voraussetzungen.** Vier Teile (a) bis (d) über J, K′, f_0(N), f_0(Ŝ). Liste: K-7 (T3), (T4), K-12, K-14 (i), K-19.

**Nachrechnung.**
1. (a), Zeile 393. Für x ∈ U ist Zeile 0 von x null, Zeile 1 sei y. Nach K-12 ist f_0 = ℬ, also f_0(x)_t = β̂_t(x). Linearität von β̂_t in der Basis e_{0k}, e_{1k} gibt β̂_t(x) = Σ_k x_{0k}·β̂_t(e_{0k}) + Σ_k y_k·β̂_t(e_{1k}) = Σ_k y_k·q_k(t). Also f_0(U) = span(q_1, …, q_7) = J. Nach K-14 (i) (gilt wegen (SN1)) ist dim J = m = 7, also sind die sieben Erzeuger linear unabhängig. Folgt.
2. (b), Zeile 394. (T3) gibt dim K′ = r − 3m = 34 − 21 = 13. rk L ist die Dimension des Bildes von L in Q, also heißt rk L = 6 = dim Q, dass L surjektiv ist. Nach K-14 (i) liegen f_1(U), f_2(U) und J in K′, also ist J + f_1(U) + f_2(U) ⊆ K′, und sein Bild in Q = K′/J ist im L = Q. Ein Unterraum, der J enthält und Q ganz trifft, ist ganz K′. Mit f_i(x) = a_i·f_0(x) (K-12) ist f_i(U) = a_i·J. Also K′ = J + a_1·J + a_2·J. Folgt.
3. (c), Zeile 395. N = ker F_1 ∩ ker F_2 mit F_i(x) = [f_i(x)] ∈ K′/J; also x ∈ N genau dann, wenn f_i(x) = a_i·f_0(x) ∈ J für i = 1, 2. Weil f_0 : U → J surjektiv ist (Schritt 1), ist f_0(N) = {j ∈ J : a_1·j ∈ J, a_2·j ∈ J}: „⊆“ direkt, „⊇“ weil jedes solche j = f_0(x) mit x ∈ U ist und dieses x dann in N liegt. Nach (T4) ist f_0 injektiv, also dim f_0(N) = dim N = 3 (K-19). Folgt.
4. (d), Zeile 396. Ŝ = {x ∈ N : f_1(x), f_2(x) ∈ f_0(N)}. Wie in Schritt 3 mit N statt U und f_0(N) statt J: f_0(Ŝ) = {j ∈ f_0(N) : a_i·j ∈ f_0(N)}. dim f_0(Ŝ) = dim Ŝ = 1 wegen der Injektivität aus (T4) und K-19. Folgt.

**Voraussetzungsliste.** Vollständig. Benutzt sind (T3), (T4), K-12 (f_0 = ℬ, f_i = a_i·f_0), K-14 (i) (dim J = 7 und f_i(U) ⊆ K′), K-19 (dim Q, rk L, dim N, dim Ŝ).

**Kleine Ungenauigkeiten.** Zeile 393 schreibt „ℬ̂(x)“; dieses Zeichen ist nirgends erklärt, gemeint ist ℬ für V̂ (nach 1.4 sind alle Begriffe für V̂ gebildet). In (d) wird die Injektivität von f_0 nicht noch einmal genannt.

**Urteil: bestätigt.**

### K-22 (Zeilen 398 bis 419)

**Aussage und Voraussetzungen.** (A) bis (D) für i ∈ {0,1,2}, k ∈ {1,…,7}; π, κ; die Folgerungen für j ∈ J und (C′). Liste: K-7 (T3), K-12, K-21 (a), Brent-Gleichungen.

**Nachrechnung.**
1. Zeile 411. Die Brent-Gleichungen gelten für V̂, weil V̂ nach K-12 ein Verfahren ist. Mit α̂_t(e_{i0}) = a_i(t), α̂_t(e_{i1}) = b_i(t), β̂_t(e_{0k}) = p_k(t), β̂_t(e_{1k}) = q_k(t) (Definitionen 1.4) ist Σ_t α̂_t(X)β̂_t(Y)Ĉ_t = W(u·v) mit den passenden Vektoren u, v. Richtig.
2. Zeilen 412 bis 415. Matrixprodukte: e_{i0}e_{1k} = 0 (innere Indizes 0 ≠ 1), e_{i1}e_{0k} = 0, e_{i0}e_{0k} = e_{ik}, e_{i1}e_{1k} = e_{ik}. Daraus W(a_i·q_k) = 0 (A), W(b_i·p_k) = 0 (B), W(a_i·p_k) = W(b_i·q_k) = e_{ik}. Richtig.
3. Zeile 416. Differenz gibt (C). Richtig.
4. Zeile 416, (D). W bildet die 21 Vektoren b_i·q_k auf die 21 Basismatrizen e_{ik} von K^{3×7} ab. Aus Σλ_{ik}b_iq_k ∈ K′ folgt Σλ_{ik}e_{ik} = 0, also λ = 0. Damit sind die 21 Vektoren linear unabhängig und ihr Spann schneidet K′ nur in 0. dim K′ = 34 − 21 nach (T3), also K′ ⊕ span = K^34. Richtig.
5. Zeile 417. π ist wohldefiniert, weil q_1, …, q_7 eine Basis von J sind (K-21 (a)). Für j = Σy_kq_k ist π(j) = Σy_kp_k, und das komponentenweise Produkt ist bilinear. Aus (A), (B), (C) folgen a_i·j ∈ K′, b_i·π(j) ∈ K′, a_i·π(j) − b_i·j ∈ K′ durch Linearkombination. Richtig.
6. Zeile 417. Mit i = 0 und a_0 = 1 (K-12: α̂_t(e_00) = 1) wird die dritte Aussage zu π(j) − b_0·j = κ(j) ∈ K′. Richtig.
7. Zeilen 417 bis 419, (C′). Nach Definition c_i = b_i − a_i·b_0, also b_i = c_i + a_i·b_0, und π(j) = κ(j) + b_0·j. Einsetzen: a_i·π(j) − b_i·j = a_i·κ(j) + a_i·b_0·j − c_i·j − a_i·b_0·j = a_i·κ(j) − c_i·j. Diese Größe liegt nach Schritt 5 in K′, also auch ihr Negatives c_i·j − a_i·κ(j). Richtig. Die Identität ist in Anhang A, Teil 1, über ℤ nachgerechnet, gilt also in jeder Charakteristik.

**Voraussetzungsliste.** Vollständig (a_0 = 1 stammt aus K-12, das genannt ist).

**Rechnerische Gegenprobe.** Anhang A, Teil 3: an einem echten Verfahren für ⟨3,2,7⟩ der Länge 39 (dreimal Strassen plus naive Produkte), nach zufälligem Basiswechsel und Skalierung, über ℚ, GF(5), GF(7), GF(101): (A), (B), (C), (D), κ(j) ∈ K′ und (C′) gelten. Die Zahl 34 geht nur über dim K′ = r − 21 ein.

**Urteil: bestätigt.**

### K-23 (Zeilen 421 bis 436)

**Aussage und Voraussetzungen.** v ∈ Ŝ, v ≠ 0, w := f_0(v); (a) bis (e). Liste: (SN2), K-12, K-13, K-19, K-21.

**Nachrechnung.**
1. (a), Zeile 432. Ŝ ⊆ N ⊆ U, also w ∈ f_0(Ŝ) ⊆ f_0(N) ⊆ f_0(U) = J. dim Ŝ = 1 (K-19), also ist v bis auf einen Faktor ≠ 0 bestimmt und mit ihm w (f_0 linear). w ≠ 0: Der Beweis sagt „weil f_0 injektiv ist“. Das folgt hier aus K-21 (a) (f_0(x) = Σy_kq_k mit unabhängigen q_k, und v ∈ U, v ≠ 0 hat y ≠ 0) und ebenso aus (SN2) (f_0(v) ist Teil einer unabhängigen Familie). Beides steht in der Liste. Folgt.
2. (b), Zeile 433. a_i·w = a_i·f_0(v) = f_i(v) (K-12). Nach K-21 (d) liegt w ∈ f_0(Ŝ), also a_i·w ∈ f_0(N). w·P_1 = span(w, a_1w, a_2w) ⊆ f_0(N). (SN2) für v ≠ 0: f_0(v), f_1(v), f_2(v), also w, a_1w, a_2w, sind unabhängig, dim w·P_1 = 3 = dim f_0(N) (K-21 (c)). Gleichheit. Folgt.
3. (c), Zeile 434. Nach K-21 (c) gilt a_i·j ∈ J für j ∈ f_0(N) = w·P_1. Mit (Stufung): w·P_2 = w·P_1 + a_1(w·P_1) + a_2(w·P_1) ⊆ J. Wieder (Stufung): w·P_3 ⊆ J + a_1J + a_2J = K′ (K-21 (b)). Folgt.
4. (d), Zeile 435. f_i(N) = a_i·f_0(N) (K-12) = a_i·(w·P_1); Summe über i = 0, 1, 2 ist nach (Stufung) w·P_2. Folgt.
5. (e), Zeile 436. K-13 gilt für V̂ (erfüllt (SN1), (SN2) nach K-12) und X = N ≠ 0, dim N = 3: dim(f_0(N)+f_1(N)+f_2(N)) ≥ 5, mit (d) also dim w·P_2 ≥ 5, e ≥ 2. w·P_2 ist Bild von P_2 (dim 6), also e ≤ 3. Folgt.

**Quantoren.** e hängt nur von V̂ ab, nicht von der Wahl von v: w ist nach (a) bis auf einen Faktor ≠ 0 bestimmt, und w·P_2 ändert sich bei Skalierung nicht. Der Wortlaut sagt das nicht ausdrücklich, es folgt aber aus (a).

**Voraussetzungsliste.** Vollständig in der Sache. Kleine Ungenauigkeit: Die Begründung „f_0 injektiv“ (Zeile 432) verweist nicht auf ihre Quelle (K-7 (T4) oder (T1) steht nicht in der Liste); sie ist aber aus K-21 (a) oder (SN2) gedeckt, die beide genannt sind.

**Urteil: bestätigt.**

### K-24 (Zeilen 438 bis 444)

**Aussage.** K^34 = K″ + b_0·K′ und dim K″ ≥ 21. Liste: K-21 (b), K-22.

**Nachrechnung.**
1. Zeile 444. Nach (D) ist K^34 = K′ + span{b_iq_k} = K′ + Σ_i b_i·J, weil b_i·J = span_k(b_i·q_k) (J = span q_k, Multiplikation linear).
2. J ⊆ K′ (K-21 (b)), also b_0·J ⊆ b_0·K′.
3. Für i = 1, 2 und j ∈ J: b_i·j = c_i·j + b_0·(a_i·j). Nach (C′) ist c_i·j ∈ a_i·κ(j) + K′, κ(j) ∈ K′ (K-22), also c_i·j ∈ a_i·K′ + K′ ⊆ K″. a_i·j ∈ K′ (K-22), also b_0·(a_i·j) ∈ b_0·K′.
4. Mit K′ ⊆ K″ folgt K^34 ⊆ K″ + b_0·K′. b_0·K′ ist das Bild von K′ unter einer linearen Abbildung, also ein Unterraum mit dim ≤ 13. dim K″ ≥ 34 − 13 = 21.

**Gegenprobe.** Anhang A, Teil 3: K^r = K″ + b_0·K′ und dim K″ ≥ 21 am Verfahren der Länge 39 über ℚ, GF(5), GF(7), GF(101) (dort dim K″ = 21).

**Urteil: bestätigt.**

### K-25 (Zeilen 446 bis 459)

**Aussage.** (a) dim J³_0 = 8, (b) Injektivität von (j_i) ↦ [Σb_ij_i], (c) Θ(j) = c_1j_1 + c_2j_2, (d) Θ injektiv, Θ(J³_0) ∩ K′ = 0, dim 8. Liste: K-21 (a), (b), K-22 (D).

**Nachrechnung.**
1. (a), Zeile 456. Die Abbildung J³ → K^34, (j_i) ↦ j_0 + a_1j_1 + a_2j_2, hat Bild J + a_1J + a_2J = K′ (K-21 (b)); sie ist also eine Surjektion J³ → K′. dim J³ = 21 (K-21 (a)), Kern J³_0, dim J³_0 = 21 − 13 = 8. Folgt.
2. (b), Zeile 457. j_i = Σ_k y_{ik}q_k, Σ_ib_ij_i = Σ y_{ik}b_iq_k. Liegt das in K′, so y = 0 nach (D), also j = 0. Folgt.
3. (c), Zeile 458. b_i = c_i + a_ib_0 für i = 1, 2 einsetzen: Σb_ij_i = b_0(j_0 + a_1j_1 + a_2j_2) + c_1j_1 + c_2j_2, erster Summand 0 auf J³_0. Über ℤ nachgerechnet (Anhang A, Teil 1). Folgt.
4. (d), Zeile 459. Θ ist die Abbildung aus (b) vor der Klassenbildung, eingeschränkt auf J³_0. Ist Θ(j) ∈ K′, dann j = 0 nach (b). Daraus: Kern von Θ ist 0, Θ(J³_0) ∩ K′ = 0 (liegt Θ(j) in K′, ist j = 0 und Θ(j) = 0), dim Θ(J³_0) = dim J³_0 = 8. Folgt.

**Gegenprobe.** Anhang A, Teil 3: (b), (c), (d) und die Beziehung dim J³_0 = 21 − dim(J + a_1J + a_2J) am Verfahren der Länge 39 (dort ist man nicht im Restfall, J + a_1J + a_2J hat Dimension 18, J³_0 Dimension 3).

**Urteil: bestätigt.**

### K-26 (Zeilen 461 bis 469)

**Aussage.** ω_{ik}·j ∈ K″ für j ∈ J, 0 ≤ i, k ≤ 2. Liste: K-22 (C) in der Form a_i·π(j) − b_i·j ∈ K′.

**Nachrechnung.**
1. Zeilen 467 bis 469. a_k(a_iπ − b_ij) − a_i(a_kπ − b_kj) = a_ka_iπ − a_kb_ij − a_ia_kπ + a_ib_kj = (a_ib_k − a_kb_i)j = ω_{ik}j. Über ℤ für alle neun Paare (auch i = 0 oder k = 0) nachgerechnet (Anhang A, Teil 1).
2. Zeile 469. a_iπ(j) − b_ij ∈ K′ für alle i ∈ {0,1,2} (K-22, Wortlaut ausdrücklich für i = 0 eingeschlossen). Also liegt die linke Seite in a_k·K′ + a_i·K′. Für a_0 = 1 ist a_0·K′ = K′ ⊆ K″, für l = 1, 2 ist a_l·K′ ⊆ K″ nach Definition. Folgt.

**Voraussetzungsliste.** Kleine Ungenauigkeit: a_0 = 1 (K-12, bzw. die Festsetzung in 1.4) wird benutzt, steht aber nicht in der Liste. Ohne a_0 = 1 bliebe nur a_0·K′, und a_0·K′ ⊆ K″ wäre nicht gezeigt; in der Normalform ist das gedeckt.

**Gegenprobe.** Anhang A, Teil 3: ω_{ik}·q_l ∈ K″ für alle i, k, l am Verfahren der Länge 39.

**Urteil: bestätigt.**

### K-27 (Zeilen 471 bis 488)

**Aussage.** Unter dim K″ = 21 und (KS): (a) Formel für Θ, (b) Θ(J³_0) ⊆ K″ und K″ = K′ ⊕ Θ(J³_0), (c) K″ ist 𝒜-Modul, (d) J³_0 ⊆ (w·P_2)³. Liste: dim K″ = 21, (KS), K-23 (b), (c), K-25 (d), K-26.

**Nachrechnung.**
1. (a), Zeile 485. Für j ∈ J³_0 wähle ψ nach (KS). Θ(j) = Σ_i b_i·j_i = Σ_i b_i·w·(Σ_kψ_{ik}a_k) = w·Σ_{i,k}ψ_{ik}b_ia_k (alles komponentenweise, kommutativ; ψ_{ik} wirkt als ψ_{ik}(ξ(t))). Die Diagonale fällt weg (ψ_{ii} = 0). Die Terme mit i > k werden durch Umbenennen und ψ_{ki} = −ψ_{ik} zu −Σ_{i<k}ψ_{ik}b_ka_i. Also Σ_{i<k}ψ_{ik}(b_ia_k − b_ka_i) = −Σ_{i<k}ψ_{ik}ω_{ik}. Über ℤ mit allgemeinen ψ_{01}, ψ_{02}, ψ_{12} nachgerechnet (Anhang A, Teil 1). Folgt.
2. (b), Zeile 486. ψ_{ik}·w ∈ w·P_1 ⊆ J (K-23 (b), (c)). K-26 mit j := ψ_{ik}·w gibt ω_{ik}·(ψ_{ik}·w) ∈ K″. Nach (a) ist Θ(j) eine Summe solcher Terme, also in K″. Nach K-25 (d) ist Θ(J³_0) ∩ K′ = 0 und dim Θ(J³_0) = 8. K′ ⊆ K″ nach Definition, dim K′ = 13. Also ist K′ ⊕ Θ(J³_0) ein Unterraum von K″ der Dimension 21 = dim K″, also gleich K″. Folgt.
3. (c), Zeile 487. Für l ∈ {1,2}: a_l·K′ ⊆ K″ nach Definition. Für j ∈ J³_0: a_l·Θ(j) = −Σ_{i<k}ω_{ik}·((a_lψ_{ik})·w). a_lψ_{ik} ∈ P_2, also (a_lψ_{ik})·w ∈ w·P_2 ⊆ J (K-23 (c)), und K-26 gibt jeden Summanden in K″. Mit (b) ist a_l·K″ = a_l·K′ + a_l·Θ(J³_0) ⊆ K″. Folgt.
4. (d), Zeile 488. Σ_kψ_{ik}a_k ∈ P_2, weil ψ_{ik} ∈ P_1 und a_k ∈ P_1 (a_0 = 1). Also j_i ∈ w·P_2. Folgt.

**Quantoren.** In (KS) hängen die ψ_{ik} von j ab und sind nicht eindeutig; (a) gilt für jede zulässige Wahl, und (b), (c) benutzen (a) nur für eine Wahl je j. Das ist in Ordnung. w ist der Vektor aus K-23 zu derselben Normalform.

**Voraussetzungsliste.** Kleine Lücke in der Liste, keine in der Sache: Schritt (b) benutzt dim K′ = 13 (K-21 (b) oder K-7 (T3)). Weder K-21 noch K-7 steht in der Voraussetzungszeile (Zeile 483) oder in der Tabellenzeile zu K-27 (Zeile 785, „K-23, K-25, K-26“). Die Tatsache ist in K-21 (b), einem Glied mit kleinerer Nummer, bewiesen. Ebenso wird a_0 = 1 (K-12) in (a) und (d) benutzt, ohne genannt zu sein.

**Urteil: bestätigt** (mit dem Hinweis zur Liste).

### K-28 (Zeilen 496 bis 510)

**Aussage.** Bei e = 3 und J = w·P_2 ⊕ K·u: (a) K′ = w·P_3 ⊕ u·P_1 mit Dimensionen 10 und 3, (b) K″ = w·P_4 ⊕ u·P_2 mit 15, 6, dim K″ = 21, (c) ε bijektiv, auf P_3 ⊕ P_1 injektiv, (d) K^34 = K″ ⊕ b_0·K′, dim b_0·K′ = 13. Liste: K-21 (a), (b), K-23 (c), K-24.

**Nachrechnung.**
1. Zeile 506 (Existenz von u). w·P_2 ⊆ J (K-23 (c)), dim J = 7 (K-21 (a)), dim w·P_2 = 6. Jedes u ∈ J \ w·P_2 tut es. Die Aussagen gelten für jede solche Wahl.
2. (a), Zeile 507. K′ = J + a_1J + a_2J (K-21 (b)). Mit J = w·P_2 + Ku und (Stufung) ist das w·P_3 + span(u, a_1u, a_2u) = w·P_3 + u·P_1. Dann 13 = dim K′ ≤ dim w·P_3 + dim u·P_1 ≤ dim P_3 + dim P_1 = 10 + 3 = 13. Gleichheit in beiden Ungleichungen: dim w·P_3 = 10 (Auswertung P_3 → K^34 injektiv), dim u·P_1 = 3, und dim(X + Y) = dim X + dim Y heißt X ∩ Y = 0. Folgt.
3. (b), Zeile 508. K″ = K′ + a_1K′ + a_2K′ = w·P_4 + u·P_2 durch (Stufung) auf beide Summanden. dim K″ ≤ 15 + 6 = 21, und dim K″ ≥ 21 (K-24). Gleichheit: dim w·P_4 = 15, dim u·P_2 = 6, Summe direkt. Folgt.
4. (c), Zeile 509. ε hat Bild w·P_4 + u·P_2 = K″, Urbildraum Dimension 21 = dim K″, also bijektiv. Einschränkung auf den Teilraum P_3 ⊕ P_1 bleibt injektiv. Folgt.
5. (d), Zeile 510. K^34 = K″ + b_0K′ (K-24), dim K″ = 21, dim b_0K′ ≤ dim K′ = 13. 34 ≤ dim K″ + dim b_0K′ ≤ 34. Also dim b_0K′ = 13 und K″ ∩ b_0K′ = 0. Folgt.

**Voraussetzungsliste.** Vollständig. e = 3 bedeutet dim w·P_2 = 6 nach der Definition in K-23 (e).

**Urteil: bestätigt.**

### K-29 (Zeilen 512 bis 521)

**Aussage.** Bei e = 3 gelten (KS) und dim K″ = 21, also K-27 (a) bis (d). Liste: K-3, K-27, K-28.

**Nachrechnung.**
1. Zeile 518. Für (j_0, j_1, j_2) ∈ J³_0 gibt J = w·P_2 ⊕ Ku (Wahl aus K-28) eine Darstellung j_i = w·φ_i + s_i·u, φ_i ∈ P_2, s_i ∈ K. (Die φ_i sind wegen der Injektivität der Auswertung auf P_2 bei e = 3 sogar eindeutig; das wird nicht gebraucht.)
2. Zeilen 519 bis 520. 0 = Σa_ij_i = w·(φ_0 + a_1φ_1 + a_2φ_2) + u·(s_0 + s_1a_1 + s_2a_2), mit dem ersten Polynom in P_3 und dem zweiten in P_1. Das ist ε(φ_0 + a_1φ_1 + a_2φ_2, s_0 + s_1a_1 + s_2a_2) = 0. ε ist auf P_3 ⊕ P_1 injektiv (K-28 (c)), also sind beide Polynome formal null. Aus dem zweiten folgt s_0 = s_1 = s_2 = 0 (Koeffizientenvergleich). Folgt.
3. Zeile 521. Φ_i := X_0²·φ_i(X_1/X_0, X_2/X_0) ist eine Form vom Grad 2 (oder 0), weil deg φ_i ≤ 2. X_0Φ_0 + X_1Φ_1 + X_2Φ_2 = X_0³·(φ_0 + (X_1/X_0)φ_1 + (X_2/X_0)φ_2)(X_1/X_0, X_2/X_0) = X_0³·0 = 0 (Rechnung im Funktionenkörper K(X_0,X_1,X_2), Ergebnis ein Polynom). K-3 liefert Ψ_{ik} ∈ 𝒮_1 mit Ψ_{ii} = 0, Ψ_{ki} = −Ψ_{ik}, Φ_i = Σ_kΨ_{ik}X_k. Einsetzen von X_0 = 1 ist ein Ringhomomorphismus 𝒮 → K[a_1, a_2] und gibt Φ_i(1,a_1,a_2) = φ_i und ψ_{ik} := Ψ_{ik}(1,a_1,a_2) ∈ P_1 mit denselben Symmetrien; also φ_i = Σ_kψ_{ik}a_k mit a_0 = 1. Folgt.
4. j_i = w·φ_i = w·Σ_kψ_{ik}a_k, das ist (KS). dim K″ = 21 aus K-28 (b). Die Voraussetzungen von K-27 sind erfüllt, K-27 (a) bis (d) gelten. Folgt.

**Gegenprobe.** Anhang A, Teil 2: Über ℚ, GF(2), GF(3), GF(5) ist der Kern von P_2³ → P_3, φ ↦ Σa_iφ_i, 8-dimensional und gleich dem Raum der Tripel Σ_kψ_{ik}a_k mit antisymmetrischem ψ ∈ P_1 (der ebenfalls Dimension 8 hat). Das deckt den Schritt 3 einschließlich Charakteristik 2 ab und passt zu dim J³_0 = 8 aus K-25 (a).

**Voraussetzungsliste.** Vollständig.

**Urteil: bestätigt.**

### K-30 (Zeilen 523 bis 536)

**Aussage.** Bei e = 2: (a) Kern der Auswertung auf P_2 ist K·g_0, deg g_0 = 2, g_0 verschwindet auf ξ(Σ); (b) ĝ_0 irreduzibel; (c) K′ = w·P_3 ⊕ u·P_1, dim 7 und 6, Injektivität auf P_1², Kern auf P_3 ist g_0·P_1; (d) K″ = w·P_4 ⊕ u·P_2, dim 9 und 12, dim K″ = 21, K^34 = K″ ⊕ b_0K′. Liste: (SN2), K-12, K-21, K-23, K-24.

**Nachrechnung.**
1. (a), Zeile 533. Auswertung P_2 → K^34 hat Bild w·P_2 der Dimension 5, Kern Dimension 6 − 5 = 1, Erzeuger g_0. Auf P_1 ist die Auswertung injektiv (dim w·P_1 = 3 = dim P_1, K-23 (b)), also g_0 ∉ P_1, Grad genau 2. w·g_0 = 0 heißt g_0(ξ(t))·w_t = 0 für alle t, also g_0(ξ(t)) = 0 für w_t ≠ 0. Folgt.
2. (b), Zeile 534. Annahme ĝ_0 = ℓ_1ℓ_2.
   - Ist ℓ_1 = cX_0 (c ≠ 0, weil ĝ_0 ≠ 0), so g_0 = ĝ_0(1,a_1,a_2) = c·ℓ_2(1,a_1,a_2) vom Grad ≤ 1, Widerspruch zu (a). Ebenso für ℓ_2.
   - ℓ_3 ∈ 𝒮_1 nicht proportional zu ℓ_2 (insbesondere ℓ_3 ≠ 0), h := (ℓ_1ℓ_3)(1,a_1,a_2) ∈ P_2. Die Homogenisierung in Grad 2 ist auf P_2 injektiv und kehrt das Einsetzen X_0 = 1 für Formen vom Grad 2 um. Aus h = λg_0 folgt ℓ_1ℓ_3 = λℓ_1ℓ_2, also ℓ_3 = λℓ_2 (𝒮 nullteilerfrei, ℓ_1 ≠ 0), Widerspruch. Also h ∉ Kg_0, und j := w·h ≠ 0 nach (a).
   - j ∈ w·P_2 ⊆ J. Ist j_t ≠ 0, dann w_t ≠ 0 und h(ξ(t)) ≠ 0; nach (a) ist ℓ_1(1,ξ(t))·ℓ_2(1,ξ(t)) = g_0(ξ(t)) = 0 und ℓ_1(1,ξ(t)) ≠ 0 (Faktor von h(ξ(t))), also ℓ_2(1,ξ(t)) = 0. Für j_t = 0 ist nichts zu zeigen. Also λ_2·j = 0 mit λ_2 = ℓ_2(1,a_1,a_2) = μ_0 + μ_1a_1 + μ_2a_2, (μ_1,μ_2) ≠ 0, weil ℓ_2 kein Vielfaches von X_0 ist.
   - j = f_0(x) mit x ∈ U (J = f_0(U)), x ≠ 0 weil j ≠ 0; a_i·j = f_i(x) (K-12). Also μ_0f_0(x) + μ_1f_1(x) + μ_2f_2(x) = 0 mit nicht allen μ null, Widerspruch zu (SN2). Folgt.
3. (c), Zeile 535. u_1, u_2 existieren (dim J − dim w·P_2 = 2). K′ = J + a_1J + a_2J = w·P_3 + u·P_1 durch (Stufung). g_0·P_1 ⊆ P_3 (deg g_0 = 2) liegt im Kern der Auswertung, weil w·(g_0f) = f·(g_0·w) = 0; dim g_0·P_1 = 3 (Multiplikation mit g_0 ≠ 0 injektiv). Also dim w·P_3 ≤ 7, dim u·P_1 ≤ dim P_1² = 6, und 13 = dim K′ ≤ 13. Gleichheit überall: dim w·P_3 = 7, also Kern Dimension 3 und damit gleich g_0·P_1; (G_1,G_2) ↦ u_1G_1 + u_2G_2 injektiv auf P_1²; Summe direkt. Folgt.
4. (d), Zeile 536. K″ = w·P_4 + u·P_2 (Stufung; a_l·(u·P_1) ⊆ u·P_2 und die Summe ergibt u·P_2). g_0·P_2 ⊆ P_4, Dimension 6, im Kern; dim w·P_4 ≤ 9, dim u·P_2 ≤ 12, dim K″ ≤ 21, ≥ 21 nach K-24. Gleichheit: dim w·P_4 = 9, dim u·P_2 = 12, direkt, dim K″ = 21. K^34 = K″ + b_0K′ mit dim b_0K′ ≤ 13 und 21 + 13 = 34, also direkt (und dim b_0K′ = 13). Folgt.

**Randfälle.** Zusammenfallende a-Punkte: unerheblich, Schritt 2 argumentiert punktweise über t. Doppelgerade ĝ_0 = ℓ² ist durch die Annahme ĝ_0 = ℓ_1ℓ_2 mit ℓ_1 = ℓ_2 erfasst; Schritt 2 gilt auch dann. Charakteristik 2: Es wird nirgends durch 2 geteilt; über dem algebraisch abgeschlossenen K ist „irreduzibel“ für eine quadratische Form genau „kein Produkt zweier Linearformen“.

**Gegenprobe.** Anhang A, Teil 4: 34 Punkte auf dem irreduziblen Kegelschnitt a_1a_2 = 1 mit Gewichten w ≠ 0, über ℚ und GF(101): dim w·P_d = 1, 3, 5, 7, 9 für d = 0, …, 4, und der Kern der Auswertung auf P_3 ist g_0·P_1. Das sind genau die Zahlen aus (c) und (d).

**Voraussetzungsliste.** Vollständig.

**Urteil: bestätigt.**

### K-31 (Zeilen 538 bis 546)

**Aussage.** Bei e = 2 gelten (KS) und dim K″ = 21, also K-27 (a) bis (d). Liste: K-3, K-27, K-30.

**Nachrechnung.**
1. Zeilen 544 bis 545. j_i = w·φ_i + u_1s_{i1} + u_2s_{i2} nach der Zerlegung J = w·P_2 ⊕ Ku_1 ⊕ Ku_2 (K-30 (c)). 0 = Σa_ij_i = w·(φ_0 + a_1φ_1 + a_2φ_2) + Σ_l u_l·(s_{0l} + s_{1l}a_1 + s_{2l}a_2).
2. Zeile 546. Erster Summand in w·P_3, zweiter in u·P_1. Direkte Summe (K-30 (c)): beide null. Injektivität von (G_1,G_2) ↦ u_1G_1 + u_2G_2 auf P_1²: s_{0l} + s_{1l}a_1 + s_{2l}a_2 = 0 als Polynom, alle s_{il} = 0. Und w·(φ_0 + a_1φ_1 + a_2φ_2) = 0. Folgt.
3. Zeile 546. φ_0 + a_1φ_1 + a_2φ_2 ∈ P_3 liegt im Kern der Auswertung auf P_3, der nach K-30 (c) g_0·P_1 ist: = g_0·(λ_0 + λ_1a_1 + λ_2a_2). φ′_i := φ_i − λ_ig_0 ∈ P_2 (deg g_0 = 2). w·φ′_i = w·φ_i, weil w·g_0 = 0. Σa_iφ′_i = Σa_iφ_i − g_0Σλ_ia_i = 0 formal. Folgt.
4. Zeile 546. Homogenisieren, K-3, Einsetzen X_0 = 1 wie bei K-29 Schritt 3. φ′_i = Σ_kψ_{ik}a_k mit antisymmetrischem ψ ∈ P_1. j_i = w·φ_i = w·φ′_i = w·Σψ_{ik}a_k: (KS). dim K″ = 21 nach K-30 (d). K-27 anwendbar. Folgt.

**Gegenprobe.** Anhang A, Teil 2: Für sieben Polynome g_0 vom Grad 2 je Körper (vier zufällige, dazu a_1(a_1+1), (a_1 − a_2)², a_1a_2), über ℚ, GF(2), GF(3), GF(5): Jedes φ ∈ P_2³ mit Σa_iφ_i ∈ g_0·P_1 führt nach Abzug von λ_ig_0 auf ein Tripel mit antisymmetrischem ψ; die Lösungen bilden modulo (Kg_0)³ einen Raum der Dimension 8, passend zu dim J³_0 = 8. Für diesen Schritt wird die Irreduzibilität aus K-30 (b) nicht gebraucht (auch die reduziblen g_0 bestehen).

**Voraussetzungsliste.** Vollständig. Bemerkung: K-30 (b) wird in K-31 nicht benutzt; benutzt werden K-30 (c), (d).

**Urteil: bestätigt.**

## 3. Zusammenfassung

| Glied | Urteil | kleine Ungenauigkeiten (keine Lücken in der Sache) |
|---|---|---|
| K-21 | bestätigt | Zeichen ℬ̂ (Zeile 393) nicht erklärt; Injektivität in (d) nicht erneut genannt |
| K-22 | bestätigt | – |
| K-23 | bestätigt | „f_0 injektiv“ (Zeile 432) ohne Quelle, gedeckt durch K-21 (a) und (SN2); Unabhängigkeit von e von der Wahl von v nur implizit |
| K-24 | bestätigt | – |
| K-25 | bestätigt | – |
| K-26 | bestätigt | a_0 = 1 (K-12) benutzt, nicht in der Liste |
| K-27 | bestätigt | dim K′ = 13 (K-21 (b)) und a_0 = 1 (K-12) benutzt, weder in Zeile 483 noch in der Tabelle (Zeile 785) |
| K-28 | bestätigt | – |
| K-29 | bestätigt | – |
| K-30 | bestätigt | dim b_0K′ = 13 in (d) nur implizit |
| K-31 | bestätigt | – |

Echte Lücken habe ich in K-21 bis K-31 nicht gefunden. Gegenbeispiele in Randfällen (Charakteristik 2, kleine Charakteristik, zusammenfallende a-Punkte, reduzible und doppelte Kegelschnitte) habe ich gesucht und keine gefunden; die benutzten Identitäten gelten über ℤ.

Grenzen der rechnerischen Gegenprobe: Ein Verfahren der Länge 34 ist nicht bekannt, deshalb prüft Teil 3 die längenunabhängigen Aussagen an einem Verfahren der Länge 39, wo die Zahl 34 durch r ersetzt ist. Über GF(2) und GF(3) fand das Programm keinen Basiswechsel mit (SN1) für dieses Verfahren (über GF(2) ist das wegen der Formen e_{00}, e_{10}, e_{00}+e_{10} unmöglich); dort laufen nur Teil 1 (über ℤ) und Teil 2. Das berührt die Kette nicht, weil sie über dem unendlichen Körper K arbeitet.

## Anhang A: Prüfprogramm

Python 3, ohne Zusatzpakete, aufgerufen mit `python3 -I pruef.py`. Laufzeit etwa 2 Sekunden. Letzte Ausgabezeile: `ALL CHECKS PASSED: True`.

```python
#!/usr/bin/env python3
"""Independent exact-arithmetic checks for chain links K-21 .. K-31
(file lean/prosa/s5_327_kette.md at commit d6469d8).

Exact arithmetic only: integers, fractions.Fraction (field Q) and
integers mod p (fields GF(p)). No floating point anywhere.

Part 1  Polynomial identities over Z (hence valid in every commutative
        ring, every characteristic): K-22 (C'), K-25 (c), K-26, K-27 (a).
Part 2  The Koszul/homogenisation step of K-29 and K-31 over Q, GF(2),
        GF(3), GF(5): every phi in P_2^3 with sum a_i phi_i = 0 (e = 3),
        resp. sum a_i phi_i in g_0*P_1 (e = 2, after subtracting
        lambda_i*g_0), has the form phi_i = sum_k psi_ik a_k with
        antisymmetric psi in P_1; dimension counts 8.
Part 3  A real scheme for <3,2,7> (length 39, built from Strassen) over
        Q and GF(p): random basis change, scaling to a normal form with
        a_0 = 1, then K-21 (a), K-22 (A)-(D), (C'), K-24, K-25 (b)-(d),
        K-26 are checked numerically (they do not use r = 34 except
        through dimension constants, which are replaced by r - 21).
Part 4  Toy model for K-30: points on a conic, w supported there.
"""
import random
from fractions import Fraction
from itertools import product

random.seed(20261126)

# ---------------------------------------------------------------- fields
class Field:
    def __init__(self, p=None):
        self.p = p
    def __call__(self, x):
        if self.p is None:
            return Fraction(x)
        return x % self.p
    def inv(self, x):
        if self.p is None:
            return 1 / Fraction(x)
        if x % self.p == 0:
            raise ZeroDivisionError
        return pow(x, self.p - 2, self.p)
    def rand(self):
        if self.p is None:
            return Fraction(random.randint(-9, 9))
        return random.randrange(self.p)
    def name(self):
        return "Q" if self.p is None else f"GF({self.p})"
    def norm(self, x):
        return x if self.p is None else x % self.p


def rref(M, F):
    """Row reduced echelon form; returns (R, pivots)."""
    M = [[F(x) for x in row] for row in M]
    rows = len(M)
    cols = len(M[0]) if rows else 0
    piv = []
    r = 0
    for c in range(cols):
        pr = None
        for i in range(r, rows):
            if F.norm(M[i][c]) != 0:
                pr = i
                break
        if pr is None:
            continue
        M[r], M[pr] = M[pr], M[r]
        iv = F.inv(M[r][c])
        M[r] = [F(x * iv) for x in M[r]]
        for i in range(rows):
            if i != r and F.norm(M[i][c]) != 0:
                f = M[i][c]
                M[i] = [F(a - f * b) for a, b in zip(M[i], M[r])]
        piv.append(c)
        r += 1
        if r == rows:
            break
    return M[:r], piv


def rank(vectors, F):
    if not vectors:
        return 0
    return len(rref(vectors, F)[1])


def nullspace(M, F, ncols):
    """Basis of {x : M x = 0}."""
    if not M:
        return [[F(1) if i == j else F(0) for i in range(ncols)] for j in range(ncols)]
    R, piv = rref(M, F)
    free = [c for c in range(ncols) if c not in piv]
    basis = []
    for f in free:
        x = [F(0)] * ncols
        x[f] = F(1)
        for i, c in enumerate(piv):
            x[c] = F(-R[i][f])
        basis.append(x)
    return basis


def in_span(v, vectors, F):
    return rank(vectors + [v], F) == rank(vectors, F)


def solve(Mcols, v, F):
    """Find x with sum x_j * Mcols[j] = v, or None."""
    n = len(Mcols)
    m = len(v)
    A = [[Mcols[j][i] for j in range(n)] + [v[i]] for i in range(m)]
    R, piv = rref(A, F)
    if n in piv:
        return None
    x = [F(0)] * n
    for i, c in enumerate(piv):
        x[c] = R[i][n]
    return x


# ----------------------------------------- Part 1: identities over Z
class P:
    """Multivariate polynomial over Z, dict exponent-tuple -> int."""
    VARS = []
    def __init__(self, d=None):
        self.d = {k: v for k, v in (d or {}).items() if v != 0}
    @classmethod
    def var(cls, name):
        if name not in cls.VARS:
            cls.VARS.append(name)
        i = cls.VARS.index(name)
        e = [0] * 64
        e[i] = 1
        return P({tuple(e): 1})
    @classmethod
    def const(cls, c):
        return P({tuple([0] * 64): c})
    def __add__(self, o):
        o = o if isinstance(o, P) else P.const(o)
        d = dict(self.d)
        for k, v in o.d.items():
            d[k] = d.get(k, 0) + v
        return P(d)
    __radd__ = __add__
    def __neg__(self):
        return P({k: -v for k, v in self.d.items()})
    def __sub__(self, o):
        return self + (-(o if isinstance(o, P) else P.const(o)))
    def __rsub__(self, o):
        return (-self) + o
    def __mul__(self, o):
        o = o if isinstance(o, P) else P.const(o)
        d = {}
        for k1, v1 in self.d.items():
            for k2, v2 in o.d.items():
                k = tuple(a + b for a, b in zip(k1, k2))
                d[k] = d.get(k, 0) + v1 * v2
        return P(d)
    __rmul__ = __mul__
    def iszero(self):
        return not self.d


def part1():
    print("== Part 1: identities over Z (componentwise products commute) ==")
    V = P.var
    a1, a2, b0, b1, b2, j, pij = V("a1"), V("a2"), V("b0"), V("b1"), V("b2"), V("j"), V("pi")
    a = [P.const(1), a1, a2]
    b = [b0, b1, b2]
    c = [None, b1 - a1 * b0, b2 - a2 * b0]
    kap = pij - b0 * j
    ok = True
    # K-22 (C'): a_i*pi(j) - b_i*j == a_i*kappa(j) - c_i*j  (i = 1, 2)
    for i in (1, 2):
        lhs = a[i] * pij - b[i] * j
        rhs = a[i] * kap - c[i] * j
        ok &= (lhs - rhs).iszero()
    print("K-22 (C') identity:", ok)
    # K-25 (c): sum b_i j_i = b0*(j0+a1 j1+a2 j2) + c1 j1 + c2 j2
    j0, j1, j2 = V("j0"), V("j1"), V("j2")
    jj = [j0, j1, j2]
    lhs = b0 * j0 + b1 * j1 + b2 * j2
    rhs = b0 * (j0 + a1 * j1 + a2 * j2) + c[1] * j1 + c[2] * j2
    r25 = (lhs - rhs).iszero()
    print("K-25 (c) identity:", r25)
    ok &= r25
    # K-26: a_k (a_i pi - b_i j) - a_i (a_k pi - b_k j) == omega_ik j
    r26 = True
    for i in range(3):
        for k in range(3):
            om = a[i] * b[k] - a[k] * b[i]
            lhs = a[k] * (a[i] * pij - b[i] * j) - a[i] * (a[k] * pij - b[k] * j)
            r26 &= (lhs - om * j).iszero()
    print("K-26 identity (all 9 pairs incl. i = 0):", r26)
    ok &= r26
    # K-27 (a): sum_i b_i * w * sum_k psi_ik a_k == - sum_{i<k} psi_ik omega_ik w
    w = V("w")
    ps = {(0, 1): V("s01"), (0, 2): V("s02"), (1, 2): V("s12")}
    def psi(i, k):
        if i == k:
            return P.const(0)
        return ps[(i, k)] if i < k else -ps[(k, i)]
    lhs = P.const(0)
    for i in range(3):
        inner = P.const(0)
        for k in range(3):
            inner = inner + psi(i, k) * a[k]
        lhs = lhs + b[i] * w * inner
    rhs = P.const(0)
    for (i, k), s in ps.items():
        om = a[i] * b[k] - a[k] * b[i]
        rhs = rhs - s * om * w
    r27 = (lhs - rhs).iszero()
    print("K-27 (a) identity:", r27)
    ok &= r27
    # 1.4 remark used in K-24/K-25: omega_0k = c_k
    r14 = all((a[0] * b[k] - a[k] * b[0] - c[k]).iszero() for k in (1, 2))
    print("omega_0k = c_k:", r14)
    return ok and r14


# ------------------------- Part 2: Koszul / homogenisation (K-29, K-31)
def monos(d):
    return [(i, j) for s in range(d + 1) for i in range(s + 1) for j in [s - i]]


def polymul(f, g, F):
    h = {}
    for (e1, c1) in f.items():
        for (e2, c2) in g.items():
            e = (e1[0] + e2[0], e1[1] + e2[1])
            h[e] = F(h.get(e, 0) + c1 * c2)
    return {e: c for e, c in h.items() if F.norm(c) != 0}


def polyadd(f, g, F, s=1):
    h = dict(f)
    for e, c in g.items():
        h[e] = F(h.get(e, 0) + s * c)
    return {e: c for e, c in h.items() if F.norm(c) != 0}


def vec(f, d, F):
    return [F(f.get(m, 0)) for m in monos(d)]


def unvec(v, d):
    return {m: c for m, c in zip(monos(d), v)}

A = [{(0, 0): 1}, {(1, 0): 1}, {(0, 1): 1}]   # a_0 = 1, a_1, a_2 as polys


def psi_space(F):
    """All (phi_0,phi_1,phi_2) of the form phi_i = sum_k psi_ik a_k,
    psi antisymmetric in P_1: returns list of P_2^3 vectors (18 coords)."""
    gens = []
    for (i, k) in [(0, 1), (0, 2), (1, 2)]:
        for m in monos(1):
            phi = [dict(), dict(), dict()]
            lin = {m: F(1)}
            # psi_ik = lin, psi_ki = -lin: phi_i += lin*a_k, phi_k -= lin*a_i
            phi[i] = polyadd(phi[i], polymul(lin, A[k], F), F)
            phi[k] = polyadd(phi[k], polymul(lin, A[i], F), F, -1)
            gens.append(sum((vec(phi[t], 2, F) for t in range(3)), []))
    return gens


def part2(F):
    ok = True
    # map P_2^3 -> P_3, phi -> sum a_i phi_i
    cols = []
    for t in range(3):
        for m in monos(2):
            f = polymul({m: F(1)}, A[t], F)
            cols.append(vec(f, 3, F))
    M = [[cols[j][i] for j in range(18)] for i in range(10)]
    ker = nullspace(M, F, 18)
    Ps = psi_space(F)
    r_ps = rank(Ps, F)
    # e = 3: kernel must equal the psi-space
    same = rank(ker, F) == 8 and r_ps == 8 and rank(ker + Ps, F) == 8
    print(f"  [{F.name()}] e=3: dim ker(P_2^3 -> P_3) = {len(ker)}, dim psi-space = {r_ps}, equal: {same}")
    ok &= same
    # e = 2: several g_0 of degree exactly 2 (irreducible and reducible)
    gs = []
    for _ in range(4):
        while True:
            g = {m: F.rand() for m in monos(2)}
            g = {e: c for e, c in g.items() if F.norm(c) != 0}
            if any(sum(e) == 2 for e in g):
                break
        gs.append(g)
    # reducible: (a1)(a1 + 1), (a1 - a2)^2, a1*a2
    gs.append(polymul({(1, 0): F(1)}, {(1, 0): F(1), (0, 0): F(1)}, F))
    gs.append(polymul({(1, 0): F(1), (0, 1): F(-1)}, {(1, 0): F(1), (0, 1): F(-1)}, F))
    gs.append({(1, 1): F(1)})
    for g in gs:
        gP1 = [vec(polymul(g, {m: F(1)}, F), 3, F) for m in monos(1)]
        # kernel of P_2^3 -> P_3 / g*P_1 : columns of M plus gP1 (extra unknowns)
        M2 = [[cols[j][i] for j in range(18)] + [-gP1[l][i] for l in range(3)] for i in range(10)]
        ker2 = nullspace(M2, F, 21)
        allgood = True
        quot = []
        for x in ker2:
            phi = [unvec(x[6 * t:6 * t + 6], 2) for t in range(3)]
            lam = x[18:21]   # sum a_i phi_i = g * (lam . monos(1))
            # monos(1) = [(0,0),(0,1),(1,0)] -> coefficient of 1, a2, a1
            mon1 = monos(1)
            lam_by_a = {0: lam[mon1.index((0, 0))], 1: lam[mon1.index((1, 0))], 2: lam[mon1.index((0, 1))]}
            phip = [polyadd(phi[i], polymul(g, {(0, 0): lam_by_a[i]}, F), F, -1) for i in range(3)]
            v = sum((vec(phip[t], 2, F) for t in range(3)), [])
            s = polyadd(polyadd(polymul(A[0], phip[0], F), polymul(A[1], phip[1], F), F), polymul(A[2], phip[2], F), F)
            allgood &= (not s) and in_span(v, Ps, F)
            quot.append(sum((vec(phi[t], 2, F) for t in range(3)), []))
        # dimension of the image modulo (K g_0)^3 should be 8 (= dim J^3_0)
        g3 = []
        for t in range(3):
            z = [F(0)] * 18
            z[6 * t:6 * t + 6] = vec(g, 2, F)
            g3.append(z)
        dimq = rank(quot + g3, F) - rank(g3, F)
        print(f"  [{F.name()}] e=2, g0={sorted(g.items())}: dim ker = {len(ker2)}, "
              f"dim mod (K g0)^3 = {dimq}, every element gives antisymmetric psi: {allgood}")
        ok &= allgood and dimq == 8
    return ok


# ------------------------------ Part 3: a real scheme for <3,2,7>
def mat(r, c, F):
    return [[F(0)] * c for _ in range(r)]


def strassen():
    """Strassen <2,2,2> as list of (alpha 2x2, beta 2x2, C 2x2) over Z."""
    def E(*pairs):
        M = [[0, 0], [0, 0]]
        for (i, j, s) in pairs:
            M[i][j] += s
        return M
    return [
        (E((0, 0, 1), (1, 1, 1)), E((0, 0, 1), (1, 1, 1)), E((0, 0, 1), (1, 1, 1))),
        (E((1, 0, 1), (1, 1, 1)), E((0, 0, 1)), E((1, 0, 1), (1, 1, -1))),
        (E((0, 0, 1)), E((0, 1, 1), (1, 1, -1)), E((0, 1, 1), (1, 1, 1))),
        (E((1, 1, 1)), E((1, 0, 1), (0, 0, -1)), E((0, 0, 1), (1, 0, 1))),
        (E((0, 0, 1), (0, 1, 1)), E((1, 1, 1)), E((0, 0, -1), (0, 1, 1))),
        (E((1, 0, 1), (0, 0, -1)), E((0, 0, 1), (0, 1, 1)), E((1, 1, 1))),
        (E((0, 1, 1), (1, 1, -1)), E((1, 0, 1), (1, 1, 1)), E((0, 0, 1))),
    ]


def scheme327():
    """<3,2,7> of length 39 over Z: alpha 3x2, beta 2x7, C 3x7 (cols 0..6)."""
    S = []
    def emb(rows, colsB, a2, b2, c2):
        al = [[0, 0] for _ in range(3)]
        be = [[0] * 7 for _ in range(2)]
        C = [[0] * 7 for _ in range(3)]
        for ii, i in enumerate(rows):
            for j in range(2):
                al[i][j] = a2[ii][j]
        for k in range(2):
            for ll, l in enumerate(colsB):
                be[k][l] = b2[k][ll]
        for ii, i in enumerate(rows):
            for ll, l in enumerate(colsB):
                C[i][l] = c2[ii][ll]
        return (al, be, C)
    for blk in ([0, 1], [2, 3], [4, 5]):
        for (a2, b2, c2) in strassen():
            S.append(emb([0, 1], blk, a2, b2, c2))
        for j in range(2):          # row 2 times the 2x2 block: naive
            for l in range(2):
                al = [[0, 0], [0, 0], [0, 0]]
                al[2][j] = 1
                be = [[0] * 7 for _ in range(2)]
                be[j][blk[l]] = 1
                C = [[0] * 7 for _ in range(3)]
                C[2][blk[l]] = 1
                S.append((al, be, C))
    for i in range(3):              # column 6: naive
        for j in range(2):
            al = [[0, 0], [0, 0], [0, 0]]
            al[i][j] = 1
            be = [[0] * 7 for _ in range(2)]
            be[j][6] = 1
            C = [[0] * 7 for _ in range(3)]
            C[i][6] = 1
            S.append((al, be, C))
    return S


def brent_ok(S, F):
    for i, j, k, l in product(range(3), range(2), range(2), range(7)):
        tot = [[F(0)] * 7 for _ in range(3)]
        for (al, be, C) in S:
            f = F(al[i][j] * be[k][l])
            if F.norm(f) != 0:
                for x in range(3):
                    for y in range(7):
                        tot[x][y] = F(tot[x][y] + f * C[x][y])
        for x in range(3):
            for y in range(7):
                want = 1 if (j == k and x == i and y == l) else 0
                if F.norm(tot[x][y] - want) != 0:
                    return False
    return True


def mm(X, Y, F):
    return [[F(sum(X[i][k] * Y[k][j] for k in range(len(Y)))) for j in range(len(Y[0]))] for i in range(len(X))]


def tr(X):
    return [list(r) for r in zip(*X)]


def inv(M, F):
    n = len(M)
    A_ = [list(M[i]) + [F(1) if i == j else F(0) for j in range(n)] for i in range(n)]
    R, piv = rref(A_, F)
    if piv[:n] != list(range(n)):
        return None
    return [row[n:] for row in R]


def normal_form(S, F, tries=2000):
    for _ in range(tries):
        Sm = [[F.rand() for _ in range(3)] for _ in range(3)]
        Tm = [[F.rand() for _ in range(2)] for _ in range(2)]
        Si, Ti = inv(Sm, F), inv(Tm, F)
        if Si is None or Ti is None:
            continue
        new = []
        good = True
        for (al, be, C) in S:
            al2 = mm(mm(tr(Sm), al, F), tr(Tm), F)      # coefficient of alpha(S A T)
            be2 = mm(tr(Ti), be, F)                     # coefficient of beta(T^-1 B)
            C2 = mm(Si, C, F)
            s = al2[0][0]
            if F.norm(s) == 0:
                good = False
                break
            si = F.inv(s)
            new.append(([[F(x * si) for x in r] for r in al2], be2, [[F(x * s) for x in r] for r in C2]))
        if good:
            return new
    return None


def part3(F):
    S = scheme327()
    r = len(S)
    ok = brent_ok(S, F)
    print(f"  [{F.name()}] base scheme length {r}, Brent equations hold: {ok}")
    V = normal_form(S, F)
    if V is None:
        print(f"  [{F.name()}] no (SN1) basis change found (skipped)")
        return ok
    ok &= brent_ok(V, F)
    print(f"  [{F.name()}] transformed + scaled scheme still satisfies Brent: {ok}")
    a = [[F(al[i][0]) for (al, be, C) in V] for i in range(3)]
    b = [[F(al[i][1]) for (al, be, C) in V] for i in range(3)]
    p = [[F(be[0][k]) for (al, be, C) in V] for k in range(7)]
    q = [[F(be[1][k]) for (al, be, C) in V] for k in range(7)]
    one = all(F.norm(x - 1) == 0 for x in a[0])
    mul = lambda u, v: [F(x * y) for x, y in zip(u, v)]
    add = lambda u, v, s=1: [F(x + s * y) for x, y in zip(u, v)]
    Wm = [[F(C[x][y]) for (al, be, C) in V] for x in range(3) for y in range(7)]   # 21 x r
    Wv = lambda v: [F(sum(row[t] * v[t] for t in range(r))) for row in Wm]
    zero = lambda v: all(F.norm(x) == 0 for x in v)
    Kp = nullspace(Wm, F, r)
    res = {}
    res["a_0 = 1"] = one
    res["dim K' = r - 21"] = len(Kp) == r - 21
    # K-21 (a): f_0(x) for x in U equals sum y_k q_k; here f_0 = B-hat. dim J = 7
    res["K-21(a) dim span(q_k) = 7"] = rank(q, F) == 7
    res["K-14(i) J subset K'"] = all(zero(Wv(qk)) for qk in q)
    # K-22
    res["K-22 (A)"] = all(zero(Wv(mul(a[i], q[k]))) for i in range(3) for k in range(7))
    res["K-22 (B)"] = all(zero(Wv(mul(b[i], p[k]))) for i in range(3) for k in range(7))
    res["K-22 (C)"] = all(zero(Wv(add(mul(a[i], p[k]), mul(b[i], q[k]), -1))) for i in range(3) for k in range(7))
    bq = [mul(b[i], q[k]) for i in range(3) for k in range(7)]
    res["K-22 (D) K' (+) span b_i q_k = K^r"] = rank(Kp + bq, F) == r and rank(bq, F) == 21
    okC = True
    for _ in range(5):
        y = [F.rand() for _ in range(7)]
        j = [F(sum(y[k] * q[k][t] for k in range(7))) for t in range(r)]
        pj = [F(sum(y[k] * p[k][t] for k in range(7))) for t in range(r)]
        kap = add(pj, mul(b[0], j), -1)
        okC &= zero(Wv(kap))
        for i in (1, 2):
            ci = add(b[i], mul(a[i], b[0]), -1)
            okC &= zero(Wv(add(mul(ci, j), mul(a[i], kap), -1)))
    res["K-22 kappa(j) in K' and (C')"] = okC
    # K'' and K-24
    Kpp = Kp + [mul(a[1], v) for v in Kp] + [mul(a[2], v) for v in Kp]
    dKpp = rank(Kpp, F)
    b0K = [mul(b[0], v) for v in Kp]
    res[f"K-24 K^r = K'' + b_0 K' (dim K'' = {dKpp})"] = rank(Kpp + b0K, F) == r
    res["K-24 dim K'' >= 21"] = dKpp >= 21
    # K-26
    okW = True
    for i in range(3):
        for k in range(3):
            om = add(mul(a[i], b[k]), mul(a[k], b[i]), -1)
            for l in range(7):
                okW &= in_span(mul(om, q[l]), Kpp, F)
    res["K-26 omega_ik q_l in K''"] = okW
    # K-25: J^3_0 and Theta
    cols = []
    for i in range(3):
        for k in range(7):
            cols.append(mul(a[i], q[k]))
    M = [[cols[c][t] for c in range(21)] for t in range(r)]
    J30 = nullspace(M, F, 21)
    dJ1 = rank(cols, F)
    res[f"K-25(a)-type: dim J^3_0 = 21 - dim(J+a1J+a2J) ({len(J30)} = 21 - {dJ1})"] = len(J30) == 21 - dJ1
    okT = True
    thetas = []
    for y in J30:
        js = [[F(sum(y[7 * i + k] * q[k][t] for k in range(7))) for t in range(r)] for i in range(3)]
        th = [F(sum(b[i][t] * js[i][t] for i in range(3))) for t in range(r)]
        c1 = add(b[1], mul(a[1], b[0]), -1)
        c2 = add(b[2], mul(a[2], b[0]), -1)
        okT &= zero(add(th, add(mul(c1, js[1]), mul(c2, js[2])), -1))
        thetas.append(th)
    res["K-25(c) Theta = c1 j1 + c2 j2"] = okT
    res["K-25(d) Theta injective, Theta(J30) cap K' = 0"] = rank(Kp + thetas, F) == len(Kp) + len(J30)
    for kx, vx in res.items():
        print(f"  [{F.name()}] {kx}: {vx}")
        ok &= vx
    return ok


# ------------------------------ Part 4: toy model for K-30 (conic)
def part4(F):
    ok = True
    # irreducible conic a1*a2 = 1 (char != 2 irrelevant), points (x, 1/x)
    pts = []
    xs = list(range(1, 40)) if F.p is None else [x for x in range(1, F.p)]
    for x in xs[:34]:
        pts.append((F(x), F.inv(F(x))))
    w = [F(random.randint(1, 5)) for _ in pts]
    def evalspace(d):
        return [[F(w[t] * pts[t][0] ** i * pts[t][1] ** j) for t in range(len(pts))] for (i, j) in monos(d)]
    dims = [rank(evalspace(d), F) for d in range(5)]
    print(f"  [{F.name()}] {len(pts)} points on a1*a2=1: dim w*P_d, d=0..4: {dims}")
    ok &= dims[2] == 5 and dims[3] == 7 and dims[4] == 9
    # kernel of P_3 evaluation equals g0*P_1 with g0 = a1 a2 - 1
    E3 = evalspace(3)
    M = [[E3[c][t] for c in range(10)] for t in range(len(pts))]
    ker = nullspace(M, F, 10)
    g0 = {(1, 1): F(1), (0, 0): F(-1)}
    gP1 = [vec(polymul(g0, {m: F(1)}, F), 3, F) for m in monos(1)]
    same = rank(ker, F) == 3 and rank(ker + gP1, F) == 3
    print(f"  [{F.name()}] kernel of P_3-evaluation = g0*P_1: {same}")
    ok &= same
    return ok


if __name__ == "__main__":
    allok = part1()
    print("== Part 2: K-29 / K-31 homogenisation + Koszul step ==")
    for F in (Field(None), Field(2), Field(3), Field(5)):
        allok &= part2(F)
    print("== Part 3: scheme <3,2,7>, length 39, normal form ==")
    for F in (Field(None), Field(3), Field(5), Field(7), Field(101)):
        allok &= part3(F)
    print("== Part 4: K-30 toy model ==")
    for F in (Field(None), Field(101)):
        allok &= part4(F)
    print("ALL CHECKS PASSED:", allok)
```

## Anhang B: Ausgabe des Programms (gekürzt auf Teil 1, die Kopfzeilen von Teil 2 und die Schlusszeile)

```
== Part 1: identities over Z (componentwise products commute) ==
K-22 (C') identity: True
K-25 (c) identity: True
K-26 identity (all 9 pairs incl. i = 0): True
K-27 (a) identity: True
omega_0k = c_k: True
== Part 2: K-29 / K-31 homogenisation + Koszul step ==
  [Q] e=3: dim ker(P_2^3 -> P_3) = 8, dim psi-space = 8, equal: True
  …
  [GF(2)] e=3: dim ker(P_2^3 -> P_3) = 8, dim psi-space = 8, equal: True
  [GF(3)] e=3: dim ker(P_2^3 -> P_3) = 8, dim psi-space = 8, equal: True
  [GF(5)] e=3: dim ker(P_2^3 -> P_3) = 8, dim psi-space = 8, equal: True
== Part 3: scheme <3,2,7>, length 39, normal form ==
  [GF(3)] no (SN1) basis change found (skipped)
== Part 4: K-30 toy model ==
  [Q] 34 points on a1*a2=1: dim w*P_d, d=0..4: [1, 3, 5, 7, 9]
  [Q] kernel of P_3-evaluation = g0*P_1: True
  [GF(101)] 34 points on a1*a2=1: dim w*P_d, d=0..4: [1, 3, 5, 7, 9]
  [GF(101)] kernel of P_3-evaluation = g0*P_1: True
ALL CHECKS PASSED: True
```
