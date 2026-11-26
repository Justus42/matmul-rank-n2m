# S4-19: Prüfbericht zu B-026 (Satz R und Gestalt im Unterfall (M21), Fall e = 3, ⟨3,2,7⟩)

- Auftrag: S4-19, Protokoll 0.6, Stufe 4. Rolle: Prüfer. Datum 26.11.2026. Zweig `claude/project-thread-2vz0pc`.
- Geprüft: `behauptungen/B-026.md` gegen das Artefakt `lean/prosa/s4_327_spurA_r3_e3.md` (SHA-256 `2ce95a89ec9d8ae834d9ca5f4ebedc3b524e4a8e44823dcb098cc463fe3ee6b4`, stimmt mit der Angabe in B-026 überein).
- Dieser Bericht setzt keinen Status. Er enthält Urteile je Teilaussage; den Status setzt der Orchestrator.
- Kein Subagent, kein Fremdmodell, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben.

---

## 0. Offenlegung

**Eingeblendete Gedächtniseinträge.** Vor dem Lesen eingeblendet war der Index des Projektgedächtnisses (`MEMORY.md`): Angaben zu Repo, Protokollversion 0.6, Rollen von Orchestrator und Koordinator, Fremdmodell, Prüferaufträgen, Literaturwache, Merge-Hinweisen. Er verweist auf die Einzeleinträge `verfahren-datenformat` und `lean-project-ci` (Inhalt nicht eingeblendet). Während der Arbeit wurden zusätzlich die Einzeleinträge `pruefer-abgleich-s1-20`, `pruefer-rust`, `pruefer-python-s1-07` und `hk-verfahren-a10` eingeblendet (Prüfprogramme und Verfahrensdateien aus Stufe 1). Keiner dieser Einträge enthält etwas zu B-026, zu Satz R oder zu einem Urteil über eine Behauptung aus Stufe 4. Für die Prüfung habe ich sie nicht benutzt.

**Gelesen** (nur Positivliste, Stand `main` 6a4d586): `CLAUDE.md`; `PROTOKOLL.md` nur Abschnitt 5; `behauptungen/B-026.md`; `lean/prosa/s4_327_spurA_r3_e3.md` ganz; `lean/prosa/s4_327_spurA_r2_bau.md` nur Abschnitte 1 bis 4; `lean/prosa/yang_n3.md` ganz. Nicht gelesen: alles andere, insbesondere `STATUS.md`, `LOG.md`, `pruefvermerke/`, `archiv/`, `versuche/`, Abschnitt 0 und 5 bis 9 von `s4_327_spurA_r2_bau.md`.

**Spuren nach Protokoll 5.4** (nicht nachgelesen):
- Artefakt Abschnitt 2 und B-026: „Status dort: behauptet, B-017 bis B-019 von je einem Prüfer bestätigt“. Das ist ein Hinweis auf Urteile zu anderen Behauptungen (dem Restfall R-327), nicht zu B-026.
- Artefakt Kopf: Verweise auf `STATUS.md`, `LOG.md`, `versuche/` und auf Zusammenfassungen im Logbuch, die der Beweissucher gelesen hat.
- Verweise auf S4-07-D, S4-07-V, (INJ5), S4-07 Abschnitt 6 und 7: Diese Stellen liegen außerhalb meiner Positivliste. Was davon die Prüfung berührt, steht in Abschnitt 3.
- Ein Urteil zu B-026 selbst habe ich nicht gesehen. Ein erwünschtes Ergebnis war mir nicht genannt.

---

## 1. Ergebnis in Kürze

| Teilaussage | Urteil | Art |
|---|---|---|
| A, Satz R: a_1·K″ ⊆ K″, a_2·K″ ⊆ K″ | **hält** | selbst nachvollzogen, Schritt 3 unabhängig ohne Koszul nachgerechnet, numerisch gegengeprüft |
| A, Gleichwertigkeit mit A·w + A·u = K″, dim = 21, w·P_5 + u·P_3 = w·P_4 ⊕ u·P_2 | **hält** | selbst nachvollzogen |
| A, „benutzt nur (A), (C), (D), (V1) bis (V4), dim(w·P_2) = 6; nicht (B), nicht (INJ5)“ | **hält** (mit Zusatz: a_0 = 1 wird benutzt, gehört zur Normalform) | selbst nachvollzogen |
| A, Körper und Charakteristik: jede Charakteristik | **hält**; der Beweis braucht nicht einmal algebraischen Abschluss | selbst nachvollzogen, numerisch in Charakteristik 2, 7, 11, 101, 32003 |
| B (i) mathematischer Inhalt | **hält**, mit (INJ5) gelesen als „ε injektiv auf P_5 ⊕ P_3“ | selbst nachvollzogen |
| B (i) Zusatz „das ist S4-07-D“ | **nicht entscheidbar** (S4-07 Abschnitt 6 nicht auf der Positivliste) | nur gelesen |
| B (ii) | **hält** | selbst nachvollzogen |
| B (iii) | **hält** | selbst nachvollzogen |
| C (i) | **hält** | selbst nachvollzogen |
| C (ii) | **hält** | selbst nachvollzogen; die Summenformel folgt sogar direkt aus Σ d_p = 21 |
| C (iii) | **hält** | selbst nachvollzogen |
| C (iv) | **hält** | selbst nachvollzogen |

Kein Gegenbeispiel gefunden. Keine Lücke, die eine Teilaussage gefährdet. Kleinere Unschärfen in Abschnitt 4.

---

## 2. Satz R (Aussage S4-14-A), für sich

### 2.1 Rahmen und Voraussetzungen

Vektoren in K^34, „·“ komponentenweise, a_0 = (1, …, 1). J = span(q_1, …, q_7), K′ = ker W, K″ = K′ + a_1K′ + a_2K′. Lage im Fall e = 3: w mit w·P_2 ⊆ J (V4) und dim(w·P_2) = 6, J = w·P_2 ⊕ ⟨u⟩.

Die Voraussetzungen (V1) bis (V4) und die Ableitung von (A), (C), (D) aus den Brent-Gleichungen habe ich gegen S4-07 Abschnitt 1 und 2 und `yang_n3.md` (G1 bis G4, Lemma A) gelesen. Die Herleitung von (A), (C), (D) in S4-07 Abschnitt 2 habe ich nachvollzogen (Einsetzen der Basismatrizen e_{i0}, e_{i1} und e_{0k}, e_{1k}; W(a_i·p_k) = e_{ik} = W(b_i·q_k)). (V2) folgt auch aus G3 in `yang_n3.md`: dim ker W = 34 − 21 = 13. (V3) und dim N = 3, dim S = 1 aus R-327 habe ich nicht geprüft; sie sind nach B-026 ausdrücklich übernommen und nicht Gegenstand dieser Prüfung.

### 2.2 Die Schritte

**Schritt 1 (dim K″ = 21, K″ = w·P_4 ⊕ u·P_2, K^34 = K″ ⊕ b_0·K′): hält.**
K′ = J + a_1J + a_2J = w·P_3 + u·P_1 ist richtig (J = w·P_2 + K·u, a_0 = 1). Die Zählung 13 ≤ 10 + 3 erzwingt Gleichheit und Direktheit. Untere Schranke: Aus (D) ist K^34 = K′ + Σ_i b_i·J. Für j ∈ J gibt (C) mit i = 0 und a_0 = 1: π(j) ∈ b_0·j + K′; dann (C) für i: b_i·j ∈ a_i·π(j) + K′ ⊆ b_0·(a_i·j) + a_i·K′ + K′, und a_i·j ∈ K′ nach (A). Für i = 0 ist b_0·j ∈ b_0·K′ wegen J ⊆ K′. Also K^34 = K″ + b_0·K′, dim K″ ≥ 21. Zusammen mit dim K″ ≤ 15 + 6 folgt alles Behauptete; insbesondere ist b_0· auf K′ injektiv und K″ ∩ b_0·K′ = 0. Die Bijektivität von ε : P_4 ⊕ P_2 → K″ folgt aus dim(w·P_4) = 15 = dim P_4 und dim(u·P_2) = 6 = dim P_2.

*Lesart von P_d.* Das Artefakt nennt P_d „Polynome vom Grad ≤ d“ in A = K[a_1, a_2], S4-07 definiert P_d als Raum der ausgewerteten Vektoren in K^34. Wegen dim(w·P_3) = 10 = Anzahl der Monome ist die Auswertung f ↦ w·f auf den formalen Polynomen vom Grad ≤ 3 injektiv, ebenso u· auf Grad ≤ 1. Beide Lesarten sind deshalb hier gleichwertig, und der Schluss „als Polynom gleich 0“ in Schritt 2 ist berechtigt.

**Schritt 2 (Gestalt von J³_0, dim = 8): hält.**
Die Zerlegung j_i = w·φ_i + s_i·u ist eindeutig. Σ a_i·j_i = w·(φ_0 + a_1φ_1 + a_2φ_2) + u·(s_0 + s_1a_1 + s_2a_2) mit Graden ≤ 3 bzw. ≤ 1; Injektivität von ε auf P_3 ⊕ P_1 gibt die Polynomidentität und s_0 = s_1 = s_2 = 0 (u, a_1u, a_2u unabhängig). dim J³_0 = 21 − 13 = 8 aus der Surjektivität J³ → K′ (V3).

**Schritt 3 (Koszul): hält, in jeder Charakteristik.**
Homogenisierung: X_0Φ_0 + X_1Φ_1 + X_2Φ_2 = X_0³·(φ_0 + a_1φ_1 + a_2φ_2)(X_1/X_0, X_2/X_0) = 0. Das ist richtig, weil alle φ_i Grad ≤ 2 haben. X_0, X_1, X_2 ist in S = K[X_0, X_1, X_2] eine reguläre Folge über jedem Körper (sogar über jedem kommutativen Ring), der Koszul-Komplex ist daher exakt, und weil er graduiert ist, darf man die Ψ_{ik} homogen vom Grad 1 wählen. Mit Ψ antisymmetrisch und Φ_i = Σ_k Ψ_{ik}X_k ist Σ X_iΦ_i = 0 automatisch, die Vorzeichenkonvention ist also stimmig. Dehomogenisieren mit X_0 = 1 = a_0 gibt φ_i = Σ_k ψ_{ik}a_k. Die Rechnung Θ(j) = Σ_i b_i·w·Σ_k ψ_{ik}a_k = −Σ_{i<k} ψ_{ik}·ω_{ik}·w habe ich nachgerechnet (b_ia_k − b_ka_i = −ω_{ik}).

*Gleichwertigkeit mit der Dimensionsaussage.* Die Koszul-Darstellung liefert einen Raum der Dimension 9 − 1 = 8 (drei Ψ_{ik} ∈ S_1 modulo dem Bild von S_0 aus Λ³), genau dim J³_0 = 8 aus Schritt 2. Die Stelle ist also nicht nur richtig, sondern beschreibt J³_0 vollständig.

*Unabhängige Gegenrechnung ohne Koszul* (selbst durchgeführt): Aus φ_0 + a_1φ_1 + a_2φ_2 = 0 mit deg φ_i ≤ 2 folgt im Grad 3: a_1φ_1^{(2)} + a_2φ_2^{(2)} = 0, und weil a_1, a_2 im Polynomring teilerfremd sind (faktoriell, jede Charakteristik): φ_1^{(2)} = a_2h, φ_2^{(2)} = −a_1h mit h homogen vom Grad 1. Also φ_1 = ℓ_1 + a_2h, φ_2 = ℓ_2 − a_1h, φ_0 = −a_1ℓ_1 − a_2ℓ_2 mit ℓ_i ∈ P_1 (Dimension 3 + 3 + 2 = 8). Einsetzen:
 Θ(j) = w·[ℓ_1(b_1 − a_1b_0) + ℓ_2(b_2 − a_2b_0) + h(a_2b_1 − a_1b_2)] = ω_{01}·(wℓ_1) + ω_{02}·(wℓ_2) − ω_{12}·(wh).
Das ist dieselbe Gestalt wie im Artefakt (genau mit ψ_{01} = −ℓ_1, ψ_{02} = −ℓ_2, ψ_{12} = h, antisymmetrisch fortgesetzt; dann ist φ_i = Σ_k ψ_{ik}a_k), und es wird nichts über den Körper benutzt.

**Schritt 4 (ω_{ik}·J ⊆ K″): hält.**
a_k·(a_iπ(j) − b_ij) − a_i·(a_kπ(j) − b_kj) = a_ib_kj − a_kb_ij = ω_{ik}·j; beide Klammern liegen nach (C) in K′, also das Ganze in a_kK′ + a_iK′ ⊆ K″ (a_0K′ = K′). π ist nach (V1) wohldefiniert, (C) gilt nach Linearität für alle j ∈ J.

**Schritt 5 (K″ = K′ ⊕ Θ(J³_0)): hält.**
ψ_{ik}·w ∈ w·P_1 ⊆ J, also Θ(j) ∈ K″ nach Schritt 3 und 4. Injektivität von (j_i) ↦ [Σ b_i j_i] auf J³ modulo K′ folgt aus (D) zusammen mit (V1) (die q_k sind eine Basis, ihre 21 Bilder b_i·q_k sind modulo K′ unabhängig). Also dim Θ(J³_0) = 8, Θ(J³_0) ∩ K′ = 0, und aus 13 + 8 = 21 = dim K″ folgt die Gleichheit.

**Schritt 6 (Abschluss): hält.**
a_l·Θ(j) = −Σ_{i<k} ω_{ik}·(w·a_lψ_{ik}) mit a_lψ_{ik} ∈ P_2, also w·a_lψ_{ik} ∈ w·P_2 ⊆ J (V4), und nach Schritt 4 liegt jeder Summand in K″. Mit a_l·K′ ⊆ K″ (Definition) und Schritt 5 folgt a_l·K″ ⊆ K″. Das ist der Kern des Beweises und richtig: Er braucht genau w·P_2 ⊆ J, also die Bedingung aus (V4), und e = 3 nur über Schritt 1 und 2.

### 2.3 Gleichwertige Formen: hält

- Abgeschlossenheit ⇒ A·w + A·u ⊆ K″ (w, u ∈ J ⊆ K″), und K″ = w·P_4 + u·P_2 ⊆ A·w + A·u gilt immer. Umgekehrt ist A·w + A·u ein A-Modul.
- dim(A·w + A·u) = 21 ⇔ A·w + A·u = K″, weil K″ ⊆ A·w + A·u immer und dim K″ = 21 (Schritt 1, ohne Satz R).
- w·P_5 + u·P_3 = K″ + a_1K″ + a_2K″; Gleichheit mit K″ ist genau die Abgeschlossenheit.
- Relationsraum in P_5 ⊕ P_3: 21 + 10 − 21 = 10. Nachgerechnet.

Die Gleichwertigkeiten gelten in jeder Lage im Fall e = 3 unabhängig davon, ob Satz R gilt; sie benutzen nur Schritt 1.

### 2.4 Was wird benutzt, was stillschweigend

- Benutzt: (A) (in Schritt 1, folgt auch aus V3), (C) für i = 0, 1, 2, (D) (Schritt 1 und 5), (V1) (π wohldefiniert, Schritt 5), (V2), (V3) (Schritt 1, 2), (V4) mit w·P_2 ⊆ J (Schritt 6), dim(w·P_2) = 6.
- Zusätzlich und nicht in der Liste von Aussage A genannt: **a_0 = (1, …, 1)** (Schritt 1 bei (C) mit i = 0, Schritt 3 beim Dehomogenisieren). Das gehört zur Definition der „Lage“ (Normalform, Skalierung) und ist im Wortlaut von B-026 über „Lage im Fall e = 3 … mit a_0 = (1, …, 1)“ enthalten. Kein Mangel, nur genauer benannt.
- Nicht benutzt: (B), (INJ5), dim N = 3 und dim S = 1 (diese nur über V4), algebraischer Abschluss, Charakteristik.
- **Körper:** Der Beweis gilt wörtlich über jedem Körper K, über dem die Lage-Daten mit (A), (C), (D), (V1) bis (V4) vorliegen. Der algebraische Abschluss kommt nur aus dem Rahmen (Normalform nach R1 und Lemma A). Die Aussage „über jedem Körper, soweit der Restfall für jeden Körper gilt“ ist damit richtig begründet: Ein Verfahren über K liefert nach R1 eines über dem Abschluss mit derselben Länge, auf das Satz R anwendbar ist.

### 2.5 Nachrechnung und Suche nach Gegenbeispielen

Eigenes Programm (Python 3, numpy, exakte Arithmetik in GF(p) und GF(2^m), keine Gleitkommazahlen; nicht aus dem Artefakt übernommen). Für eine Konfiguration (a_1, a_2, w, u) baut es J = span(w·P_2, u), K′ = J + a_1J + a_2J (damit gilt (A)), löst die Bedingung (C) als lineares System in den Unbekannten π(q_k) und b_0, b_1, b_2 (340 Unbekannte), wählt zufällige Lösungen und prüft auf ihnen die Zwischenaussagen des Beweises, die (D) **nicht** brauchen:

- dim J³_0 = 8 (Schritt 2),
- ω_{ik}·J ⊆ K″ (Schritt 4),
- Θ(J³_0) ⊆ K″ (Schritt 5, erster Teil),
- a_l·Θ(J³_0) ⊆ K″ (Schritt 6),
- dazu den Rang von {b_i·q_k} modulo K′ (Satz R sagt: ist K″ nicht abgeschlossen, kann dieser Rang nie 21 sein, also (D) nie gelten).

Gegenproben, dass die Prüfungen nicht blind sind (`negtest.py`, auf L*): Mit zufälligen b_i, die (C) **nicht** erfüllen, liegt keiner der 8 Vektoren Θ in K″, der Rang von Θ modulo K′ ist 8 und der Rang von {b_i·q_k} modulo K′ ist 21. Die Tests unterscheiden also.

Lage L* aus Anhang B des Artefakts (`lstar.py`, SHA-256 der JSON-Zeile `9be20eab…22ef7`, stimmt mit der Angabe überein), über GF(32003): dim J = 7, dim K′ = 13, dim K″ = 21, dim(K″ + a_1K″ + a_2K″) = 21, dim(w·P_4) = 15, dim(u·P_2) = 6, dim N = 3, dim J³_0 = 8; alle Prüfungen der Schritte 4 bis 6 bestanden. Gestalt C auf L*: 20 a-Punkte, Σ d_p = 21, |T_p| ≤ 2d_p überall, Σ(2d_p − |T_p|) = 8, 17 a-Punkte im Träger von w (zwischen 15 und 21).

Rechenblock 1 (`block1.sh`), drei Arten von Konfigurationen: *generic* (34 verschiedene Punkte, w und u mit vollem Träger, also K″ nicht abgeschlossen), *m21* (Punkte und Träger so gebaut, dass A·w + A·u = K″ gilt, darunter Punkte mit u parallel zu w und mit d_p = 2), *mixed* (17 bis 33 verschiedene Punkte, teilweise Träger, dim(K″ + a_1K″ + a_2K″) zwischen 21 und 31). Gezählt sind nur Konfigurationen mit dim J = 7, dim K′ = 13, dim K″ = 21; „verworfen“ sind die übrigen. Je Konfiguration zwei zufällige Lösungen von (C).

| Körper | Art | geprüft | davon K″ abgeschlossen | verworfen | Verstöße gegen Schritt 2, 4, 5, 6 | max. Rang Θ mod K′ | max. Rang {b_i·q_k} mod K′ |
|---|---|---|---|---|---|---|---|
| GF(2^6) | generic | 162 | 0 | 0 | 0 | 0 | 13 |
| GF(2^6) | m21 | 286 | 286 | 7 | 0 | 0 | 13 |
| GF(2^6) | mixed | 181 | 1 | 3 | 0 | 0 | 13 |
| GF(2^8) | generic | 158 | 0 | 0 | 0 | 0 | 13 |
| GF(2^8) | m21 | 280 | 280 | 3 | 0 | 0 | 13 |
| GF(2^8) | mixed | 171 | 1 | 2 | 0 | 0 | 13 |
| GF(7) | generic | 244 | 0 | 0 | 0 | 0 | 13 |
| GF(7) | m21 | 359 | 359 | 171 | 0 | 0 | 13 |
| GF(7) | mixed | 283 | 1 | 5 | 0 | 0 | 13 |
| GF(11) | m21 | 313 | 313 | 79 | 0 | 0 | 13 |
| GF(101) | generic | 218 | 0 | 0 | 0 | 0 | 13 |
| GF(101) | m21 | 535 | 535 | 10 | 0 | 0 | 13 |
| GF(101) | mixed | 284 | 2 | 1 | 0 | 0 | 13 |
| GF(32003) | generic | 218 | 0 | 0 | 0 | 0 | 13 |
| GF(32003) | m21 | 509 | 509 | 3 | 0 | 0 | 13 |
| GF(32003) | mixed | 275 | 1 | 1 | 0 | 0 | 13 |

Zusammen 4 476 Konfigurationen in den Charakteristiken 2, 7, 11, 101 und 32003. In allen gilt dim J³_0 = 8, ω_{ik}·J ⊆ K″, Θ(J³_0) ⊆ K″ und a_l·Θ(J³_0) ⊆ K″. In keiner nicht abgeschlossenen Konfiguration (generic, mixed mit dim > 21) erreicht der Rang von {b_i·q_k} modulo K′ den Wert 21, den (D) verlangt; Satz R sagt genau das voraus. Ein Gegenbeispiel zu Satz R habe ich nicht gefunden.

Nebenbefund ohne Urteil (betrifft nicht B-026, sondern die Vermutung S4-14-V1 des Artefakts, die nicht Teil von B-026 ist): Auch in den abgeschlossenen Konfigurationen war der Rang von Θ modulo K′ stets 0, obwohl dort der Raum {m ∈ K″ : a_l·m ∈ K″} die volle Dimension 21 hat. Der Rang von {b_i·q_k} modulo K′ war in allen Konfigurationen höchstens 13.

Was die Rechnung nicht leistet: Sie prüft die Schritte des Beweises an Daten, die (A) und (C) erfüllen, aber an keinem Verfahren, denn ein Verfahren der Länge 34 ist nicht bekannt. Die Rechnung ist eine Gegenprobe, kein Beweis; das Urteil zu Satz R stützt sich auf das Nachvollziehen in 2.2.

---

## 3. Folgerungen (Aussage S4-14-B)

**(i) hält, mit einer Einschränkung beim Zusatz.** (INJ5) ist in meinen Dateien nicht definiert; das Artefakt benutzt in Abschnitt 5 die Lesart „ε ist auf P_5 ⊕ P_3 injektiv“. Mit dieser Lesart ist dim(w·P_5 + u·P_3) = 21 + 10 = 31 > 21, im Widerspruch zur gleichwertigen Form von Satz R; also gibt es keine Lage im Fall e = 3 mit (INJ5), und da jede Lage Normalform eines Verfahrens der Länge 34 ist, kein solches Verfahren. Der Zusatz „das ist S4-07-D“ und ob (INJ5) in S4-07 genau so definiert ist, liegt außerhalb meiner Positivliste: **nicht entscheidbar**.

**(ii) hält.** Ein solches Paar (F, G) widerspricht w·P_5 + u·P_3 = w·P_4 ⊕ u·P_2. „In dieser Lage“ ist so zu lesen: Daten (a, w, u) mit dieser Eigenschaft kommen von keinem Verfahren der Länge 34.

**(iii) hält.** Direkt aus Satz R. Die Formulierung von (M21) als dim(A·w + A·u) = 21 (Aussage B) und als dim(w·P_5 + u·P_3) = 21 (Artefakt, Abschnitt 0) sind nach 2.3 gleichwertig.

---

## 4. Gestalt im Unterfall (M21) (Aussage S4-14-C)

**(i) hält.** Zu verschiedenen Punkten p ∈ K² gibt es e_p ∈ A mit e_p(p) = 1, e_p(p′) = 0 (Produkt von Linearformen, die p′ trennen; jeder Körper). Als Vektor ist e_p die Indikatorfunktion von T_p, Σ_p e_p = 1, e_pe_{p′} = 0. Jeder A-Untermodul zerfällt daher als ⊕_p e_p·M. Auf K^{T_p} wirken a_1, a_2 als Skalare, also e_p·(A·w + A·u) = span(e_p·w, e_p·u) = M_p. Mit Satz R: Σ d_p = 21. K^34 = M ⊕ b_0·K′ aus Schritt 1.

**(ii) hält.** e_p·K′ ⊆ e_p·M = M_p (K′ ⊆ M), also K^{T_p} = M_p + b_0·e_pK′ ⊆ M_p + b_0·M_p und |T_p| ≤ 2d_p. Die Summenformel folgt aus (iii), aber auch direkt: Σ_p (2d_p − |T_p|) = 2·21 − 34 = 8, weil die T_p alle 34 Indizes zerlegen. Nebenbei folgt aus |T_p| ≤ 2d_p, dass kein Index außerhalb von Träger(w) ∪ Träger(u) liegt (dort wäre d_p = 0), in Übereinstimmung mit S4-07 Abschnitt 4.4, Punkt 1.

**(iii) hält.** β zerfällt nach Punkten, weil b_0 mit e_p vertauscht. Auf K′ ist β injektiv (b_0·K′ ∩ M = 0 und b_0· injektiv auf K′, beides aus Schritt 1), dim K^34/M = 13 = dim K′, also β surjektiv, ker β = ⊕ ker β_p = N_0 mit dim 8, N_0 ∩ K′ = 0, M = K′ ⊕ N_0. A-Stabilität, weil a_l auf jedem K^{T_p} skalar wirkt. dim ker β_p = 2d_p − |T_p| aus der Surjektivität der β_p.

**(iv) hält.** A·w = span(e_p·w : p im Träger von w), jedes e_p·w ≠ 0 und die e_p·w haben disjunkte Träger, also ist dim A·w die Anzahl dieser Punkte. w·P_4 ⊆ A·w ⊆ M gibt 15 ≤ Anzahl ≤ 21.

**Kleinere Unschärfen (ohne Einfluss auf die Urteile).**
1. Aussage C (i) schreibt M_p ⊆ K^{T_p}, in der Zerlegung M = ⊕_p M_p ist M_p über e_p mit einem Unterraum von K^34 identifiziert. Unschädlich.
2. In der Liste der benutzten Voraussetzungen von Aussage A fehlt a_0 = 1 (siehe 2.4); sie steckt in der Definition der Lage.
3. „A·v := ∪_d v·P_d“ ist als Vereinigung einer aufsteigenden Kette ein Unterraum; richtig, aber erst durch die Monotonie.

---

## 5. Rechenblöcke

Ein Block, auf 4 Kernen (4 Python-Prozesse nebeneinander, je vier Läufe nacheinander), Zeiten UTC.

| Block | Zeit | Inhalt | Commit davor / danach |
|---|---|---|---|
| 1 | 11:26:34 bis 11:31:06 | `block1.sh` (16 Läufe `run.py`, je 60 oder 90 s) | davor a70809f (11:24:26), danach der Commit, der diesen Abschnitt einführt |

Kleine Einzelläufe außerhalb des Blocks, jeweils unter 20 s auf 1 Kern: `run.py p32003 generic 1 20` (Probelauf, 72 Konfigurationen, Ergebnis wie in der Tabelle), `lstar.py`, `negtest.py` (zwischen 11:25 und 11:26, zusammen mit Block 1 unter 30 Minuten). Ein erster Aufruf von `block1.sh` mit GF(3) wurde vor dem Start geändert (GF(3) hat nur 9 Punkte, die Erzeugung verschiedener Punkte wäre nicht fertig geworden), ersetzt durch GF(11).

---

## 6. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs (erster Commit a70809f, 11:24:26 UTC).

---

## Anhang: Programme

Python 3.13, numpy 2.5. Aufruf aus einem Verzeichnis mit allen Dateien und `L.json` (die JSON-Zeile aus Anhang B des Artefakts ohne Zeilenende): `python3 run.py <Körper> <Art> <Startwert> <Sekunden>` mit Körper `p<Primzahl>`, `2^6` oder `2^8`; `python3 lstar.py`; `python3 negtest.py`.

### fld.py

SHA-256 `997119a1708b658fd68a08baa1d7b1434b86230c9421838aa9abdd9dbdf0606b`

```python
# exact finite-field linear algebra, own implementation (S4-19 reviewer)
import numpy as np
class GFp:
    def __init__(s,p): s.p=p; s.q=p; s.char=p
    def add(s,x,y): return (x+y)%s.p
    def sub(s,x,y): return (x-y)%s.p
    def mul(s,x,y): return (np.asarray(x,dtype=np.int64)*np.asarray(y,dtype=np.int64))%s.p
    def inv(s,x): return pow(int(x),s.p-2,s.p)
    def rand(s,rng,shape,nonzero=False):
        return rng.integers(1 if nonzero else 0,s.p,shape)
class GF2m:
    # GF(2^m) with primitive polynomial poly (integer bitmask incl. x^m)
    def __init__(s,m,poly):
        s.m=m; s.q=1<<m; s.char=2
        s.exp=np.zeros(2*s.q,dtype=np.int64); s.log=np.zeros(s.q,dtype=np.int64)
        x=1
        for i in range(s.q-1):
            s.exp[i]=x; s.log[x]=i; x<<=1
            if x&s.q: x^=poly
        assert len(set(s.exp[:s.q-1].tolist()))==s.q-1, 'poly not primitive'
        for i in range(s.q-1,2*s.q): s.exp[i]=s.exp[i-(s.q-1)]
    def add(s,x,y): return np.bitwise_xor(x,y)
    sub=add
    def mul(s,x,y):
        x=np.asarray(x,dtype=np.int64); y=np.asarray(y,dtype=np.int64)
        x,y=np.broadcast_arrays(x,y)
        r=s.exp[s.log[x]+s.log[y]]
        return np.where((x==0)|(y==0),0,r)
    def inv(s,x): return int(s.exp[(s.q-1-s.log[int(x)])%(s.q-1)])
    def rand(s,rng,shape,nonzero=False):
        return rng.integers(1 if nonzero else 0,s.q,shape)
def rref(F,M):
    M=np.array(M,dtype=np.int64).copy()
    if M.ndim==1: M=M[None,:]
    rows,cols=M.shape; r=0; piv=[]
    for c in range(cols):
        if r==rows: break
        nz=np.nonzero(M[r:,c])[0]
        if len(nz)==0: continue
        k=r+nz[0]
        if k!=r: M[[r,k]]=M[[k,r]]
        M[r]=F.mul(M[r],F.inv(M[r,c]))
        col=M[:,c].copy(); col[r]=0
        nzr=np.nonzero(col)[0]
        if len(nzr): M[nzr]=F.sub(M[nzr],F.mul(col[nzr][:,None],M[r][None,:]))
        piv.append(c); r+=1
    return M[:r],piv
def rank(F,M):
    M=np.atleast_2d(np.array(M,dtype=np.int64))
    if M.size==0: return 0
    return len(rref(F,M)[1])
def null(F,M):
    # rows x with M x = 0 (x as row vector, M rows are equations)
    M=np.atleast_2d(np.array(M,dtype=np.int64))
    n=M.shape[1]; R,piv=rref(F,M)
    free=[c for c in range(n) if c not in piv]
    out=np.zeros((len(free),n),dtype=np.int64)
    for i,f in enumerate(free):
        out[i,f]=1
        for j,c in enumerate(piv): out[i,c]=F.sub(0,R[j,f])
    return out
def matmul(F,A,B):
    A=np.atleast_2d(A); B=np.atleast_2d(B)
    out=np.zeros((A.shape[0],B.shape[1]),dtype=np.int64)
    for k in range(A.shape[1]):
        out=F.add(out,F.mul(A[:,k][:,None],B[k][None,:]))
    return out
def inspan(F,B,v):
    return rank(F,np.vstack([B,v]))==rank(F,B)
```

### satzr.py

SHA-256 `fb1638da12d965da92b2c8769d1c940d132acadc3b4aa5fe342413bae4188664`

```python
# S4-19 reviewer check of Satz R (S4-14-A): own implementation.
# For a configuration (a1,a2,w,u) in the e=3 shape, solve condition (C) for (pi, b_0, b_1, b_2)
# with (A) built in (K' = J + a1 J + a2 J), and test the steps of the proof on random solutions.
import numpy as np, sys, json, time
from fld import *
def mons(d): return [(i,t-i) for t in range(d+1) for i in range(t+1)]
def pw(F,v,k):
    out=np.ones_like(v)
    for _ in range(k): out=F.mul(out,v)
    return out
def mono(F,a1,a2,m): return F.mul(pw(F,a1,m[0]),pw(F,a2,m[1]))
def span_mul(F,a1,a2,v,d): return [F.mul(v,mono(F,a1,a2,m)) for m in mons(d)]
def analyse(F,a1,a2,w,u,rng,nsol=2):
    r=len(a1); one=np.ones(r,dtype=np.int64)
    Q=np.array(span_mul(F,a1,a2,w,2)+[u])           # q_1..q_7 (basis of J if rank 7)
    res={}
    res['dimJ']=rank(F,Q)
    if res['dimJ']!=7: return res
    Kp=rref(F,np.vstack([Q,F.mul(a1,Q),F.mul(a2,Q)]))[0]; res['dimK1']=Kp.shape[0]
    if Kp.shape[0]!=13: return res
    K2=rref(F,np.vstack([Kp,F.mul(a1,Kp),F.mul(a2,Kp)]))[0]; res['dimK2']=K2.shape[0]
    res['dimK3']=rank(F,np.vstack([K2,F.mul(a1,K2),F.mul(a2,K2)]))
    res['dimwP4']=rank(F,np.array(span_mul(F,a1,a2,w,4))); res['dimuP2']=rank(F,np.array(span_mul(F,a1,a2,u,2)))
    res['dimM5']=rank(F,np.array(span_mul(F,a1,a2,w,5)+span_mul(F,a1,a2,u,3)))
    # dim N = {j in J: a_l j in J}
    AnnJ=null(F,Q)   # rows orth to J
    NN=null(F,np.vstack([matmul(F,AnnJ,F.mul(a1,Q).T),matmul(F,AnnJ,F.mul(a2,Q).T)]))
    res['dimN']=NN.shape[0]
    # socle-type space Soc = {m in K'': a_l m in K''}
    Ann2=null(F,K2)
    Soc=null(F,np.vstack([matmul(F,Ann2,F.mul(a1,K2).T),matmul(F,Ann2,F.mul(a2,K2).T)]))
    res['dimSoc']=Soc.shape[0]
    if K2.shape[0]!=21: return res
    Ann=null(F,Kp)  # 21 rows, each y with y.v=0 for v in K'
    A=[one,a1,a2]
    nun=10*r; eqs=[]
    for i in range(3):
        for k in range(7):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,k*r:(k+1)*r]=F.mul(Ann,A[i][None,:])                         # y * a_i * p_k
            blk[:,7*r+i*r:7*r+(i+1)*r]=F.sub(0,F.mul(Ann,Q[k][None,:]))       # - y * q_k * b_i
            eqs.append(blk)
    V=null(F,np.vstack(eqs)); res['dimSolC']=V.shape[0]
    # J^3_0 in coordinates c (3x7)
    Mcols=np.vstack([F.mul(A[i],Q[k]) for i in range(3) for k in range(7)])   # 21 x r
    J30=null(F,Mcols.T); res['dimJ30']=J30.shape[0]
    worst={}
    for s in range(nsol):
        x=matmul(F,F.rand(rng,(1,V.shape[0])),V)[0]
        Pm=x[:7*r].reshape(7,r); Bm=x[7*r:].reshape(3,r)
        # sanity: (C) holds
        for i in range(3):
            for k in range(7):
                assert inspan(F,Kp,F.sub(F.mul(A[i],Pm[k]),F.mul(Bm[i],Q[k])))
        Th=[]
        for c in J30:
            c=c.reshape(3,7); v=np.zeros(r,dtype=np.int64)
            for i in range(3): v=F.add(v,F.mul(Bm[i],matmul(F,c[i][None,:],Q)[0]))
            Th.append(v)
        Th=np.array(Th)
        chk={}
        chk['Theta_in_K2']=all(inspan(F,K2,t) for t in Th)
        chk['aTheta_in_K2']=all(inspan(F,K2,F.mul(a,t)) for a in (a1,a2) for t in Th)
        om_ok=True
        for i in range(3):
            for k in range(i+1,3):
                om=F.sub(F.mul(A[i],Bm[k]),F.mul(A[k],Bm[i]))
                for q in Q: om_ok&=inspan(F,K2,F.mul(om,q))
        chk['omegaJ_in_K2']=om_ok
        chk['rankTheta_modK1']=rank(F,np.vstack([Kp,Th]))-13
        chk['rank_bq_modK1']=rank(F,np.vstack([Kp]+[F.mul(Bm[i],Q[k])[None,:] for i in range(3) for k in range(7)]))-13
        for kk,vv in chk.items():
            if isinstance(vv,bool): worst[kk]=worst.get(kk,True) and vv
            else: worst[kk]=max(worst.get(kk,0),vv)
    res.update(worst)
    return res
```

### run.py

SHA-256 `23d98900e68761eeaf11ae2d46a62ad8a6a3f8ee9bf6a8d7d67aeeb4cf3ac9ab`

```python
import numpy as np, sys, json, time
from fld import *
from satzr import analyse
def field(name):
    if name.startswith('p'): return GFp(int(name[1:]))
    if name=='2^6': return GF2m(6,0b1000011)
    if name=='2^8': return GF2m(8,0x11d)
def pts_distinct(F,rng,n):
    seen=set(); out=[]
    while len(out)<n:
        p=tuple(int(x) for x in F.rand(rng,2))
        if p not in seen: seen.add(p); out.append(p)
    return out
def gen(F,rng,kind):
    r=34
    if kind=='generic':
        P=pts_distinct(F,rng,34) if F.q*F.q>=60 else [tuple(int(x) for x in F.rand(rng,2)) for _ in range(34)]
        a1=np.array([p[0] for p in P]);a2=np.array([p[1] for p in P])
        return a1,a2,F.rand(rng,r,True),F.rand(rng,r,True)
    if kind=='m21':   # nw w-points (u=0 or parallel or independent), rest u-only; |T_p|<=2 d_p, sum 34
        while True:
            nw=int(rng.integers(15,22)); nu=21-nw
            n2=int(rng.integers(0,nu+1)) ; nz=nu-n2   # n2 points with independent u inside w-points
            P=pts_distinct(F,rng,nw+nz)
            roles=['2']*n2+['w']*(nw-n2)+['z']*nz
            d=[2 if x=='2' else 1 for x in roles]
            lo=[2 if x==2 else 1 for x in d]; hi=[2*x for x in d]
            if sum(lo)<=34<=sum(hi): break
        sz=lo[:]; rest=34-sum(sz)
        while rest>0:
            i=int(rng.integers(0,len(sz)))
            if sz[i]<hi[i]: sz[i]+=1; rest-=1
        a1=[];a2=[];w=[];u=[]
        for p,role,s in zip(P,roles,sz):
            par=int(F.rand(rng,1,True)[0]); usepar=rng.random()<0.5
            for _ in range(s):
                a1.append(p[0]);a2.append(p[1])
                wv=int(F.rand(rng,1,True)[0])
                if role=='z': w.append(0);u.append(int(F.rand(rng,1,True)[0]))
                elif role=='2': w.append(wv);u.append(int(F.rand(rng,1,True)[0]))
                else: w.append(wv);u.append(int(F.mul(wv,par)) if usepar else 0)
        return np.array(a1),np.array(a2),np.array(w),np.array(u)
    if kind=='mixed':   # 34 indices on fewer points, partial supports
        npt=int(rng.integers(17,34))
        P=pts_distinct(F,rng,npt)
        idx=list(range(npt))+list(rng.integers(0,npt,34-npt))
        a1=np.array([P[i][0] for i in idx]);a2=np.array([P[i][1] for i in idx])
        w=F.rand(rng,34,True); u=F.rand(rng,34,True)
        w[rng.random(34)<0.1]=0; u[rng.random(34)<0.6]=0
        return a1,a2,w,u
if __name__=='__main__':
    fname=sys.argv[1]; kind=sys.argv[2]; seed=int(sys.argv[3]); tl=float(sys.argv[4])
    F=field(fname); rng=np.random.default_rng(seed); t0=time.time(); stats={}
    while time.time()-t0<tl:
        a1,a2,w,u=gen(F,rng,kind)
        res=analyse(F,a1,a2,w,u,rng)
        if res.get('dimK2')!=21:
            key=('skip',res.get('dimJ'),res.get('dimK1'),res.get('dimK2'))
        else:
            key=(res['dimK3'],res['dimN'],res['dimSoc'],res['dimSolC'],res['dimJ30'],res['Theta_in_K2'],res['aTheta_in_K2'],res['omegaJ_in_K2'],res['rankTheta_modK1'],res['rank_bq_modK1'])
        stats[key]=stats.get(key,0)+1
    print('field',fname,'kind',kind,'seed',seed)
    print('key = (dim K''+aK'', dimN, dimSoc, dimSol(C), dimJ30, Th in K'', aTh in K'', omega J in K'', rankTheta mod K1, rank b_i q_k mod K1)')
    for k in sorted(stats,key=str): print(k,stats[k])
```

### lstar.py

SHA-256 `ca0511f4ed6518182468b7df8c4540ba26dcd2ef7851103b10d1efe01b09fc42`

```python
import numpy as np, json
from fld import *
from satzr import analyse
d=json.load(open('L.json')); F=GFp(d['P'])
a1,a2,w,u=[np.array(d[k]) for k in ('a1','a2','w','u')]
rng=np.random.default_rng(5)
res=analyse(F,a1,a2,w,u,rng,nsol=4); print(res)
# Gestalt C on L*
pts=list(dict.fromkeys(zip(a1.tolist(),a2.tolist())))
dp=[];Tp=[]
for p in pts:
    idx=[t for t in range(34) if (a1[t],a2[t])==p]
    dp.append(rank(F,np.array([w[idx],u[idx]]))); Tp.append(len(idx))
print('points',len(pts),'sum d_p',sum(dp),'max(|T_p|-2d_p)',max(t-2*x for t,x in zip(Tp,dp)),'sum(2d_p-|T_p|)',sum(2*x-t for t,x in zip(Tp,dp)))
print('a-points in supp w',len({p for t,p in enumerate(zip(a1.tolist(),a2.tolist())) if w[t]!=0}))
```

### negtest.py

SHA-256 `0532b6cdfbd16a5c4f8e2a55c89f264b9db5ce1298629f7e00af52648a9bea94`

```python
# non-blindness: random b (not solving (C)) must give Theta outside K'' ; random vector outside K'' detected
import numpy as np, json
from fld import *
from satzr import mons, span_mul
d=json.load(open('L.json')); F=GFp(d['P']); rng=np.random.default_rng(9)
a1,a2,w,u=[np.array(d[k]) for k in ('a1','a2','w','u')]
Q=np.array(span_mul(F,a1,a2,w,2)+[u]); one=np.ones(34,dtype=np.int64); A=[one,a1,a2]
Kp=rref(F,np.vstack([Q,F.mul(a1,Q),F.mul(a2,Q)]))[0]; K2=rref(F,np.vstack([Kp,F.mul(a1,Kp),F.mul(a2,Kp)]))[0]
Mcols=np.vstack([F.mul(A[i],Q[k]) for i in range(3) for k in range(7)]); J30=null(F,Mcols.T)
B=F.rand(rng,(3,34)); Th=[]
for c in J30:
    c=c.reshape(3,7); v=np.zeros(34,dtype=np.int64)
    for i in range(3): v=F.add(v,F.mul(B[i],matmul(F,c[i][None,:],Q)[0]))
    Th.append(v)
print('random b: Theta in K2?',[inspan(F,K2,t) for t in Th].count(True),'of',len(Th),'; rank Theta mod K1',rank(F,np.vstack([Kp,np.array(Th)]))-13,'; rank b q mod K1',rank(F,np.vstack([Kp]+[F.mul(B[i],Q[k])[None,:] for i in range(3) for k in range(7)]))-13)
```

### block1.sh

SHA-256 `c0ffadf53cb9e173ea973beb0c18df87ddc81d79679135826aa217edf64c7c84`

```bash
#!/bin/bash
cd "$(dirname "$0")"
run(){ python3 run.py $1 $2 $3 $4 > out_$1_$2_$3.txt 2>&1; }
( run p32003 generic 11 60; run p32003 m21 12 90; run p32003 mixed 13 60; run p7 m21 31 60 ) &
( run p101 generic 21 60; run p101 m21 22 90; run p101 mixed 23 60; run p7 mixed 33 60 ) &
( run 2^6 generic 41 60; run 2^6 m21 42 90; run 2^6 mixed 43 60; run p7 generic 32 60 ) &
( run 2^8 generic 51 60; run 2^8 m21 52 90; run 2^8 mixed 53 60; run p11 m21 61 60 ) &
wait
date -u +%H:%M:%S > block1_end.txt
```

