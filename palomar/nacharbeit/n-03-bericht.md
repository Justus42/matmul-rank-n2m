# N-03: Beweisweg und Quellennotizen in `lean/formalization.yaml` gegen die Lean-Kette

Rolle: Prüfer. Auftrag N-03 des Orchestrators (Nacharbeit außerhalb der Runden auf Anweisung von Justus). Stand: `main` bei Commit `676cdf5deb786e81a66342606d4dd2b6f919745e`. Geprüft werden nur Angaben, die sich am Lean-Code (und an der JSON-Datei des Verfahrens) ablesen lassen. Die Mathematik der Beweise prüfe ich nicht nach. Statuswörter setze ich nicht.

## 0. Offenlegung

**Eingeblendete Einträge des Projektgedächtnisses.** Mir waren eingeblendet:

- der Index `MEMORY.md` (Projekt, Regeln der Fassung 0.7, Rollen von Orchestrator und Threads, Fremdmodell, Domainfreigaben, Hinweise zu Prüferaufträgen, Literaturwache, Verweise auf `verfahren-datenformat` und `lean-project-ci`),
- `aussagen-abgleich-n3.md` (Bridge-Hinweis, lokaler Lean-Bau),
- `lean-build-cloud.md` (Lean 4.19 und Mathlib-Cache in der Cloud, Workflows),
- `lean-yang-bounds.md` (Projekt `yang_bounds`, Lean 4.19.0, Abhängigkeit `mm325_lower_bound`, S1-01),
- `lean-yang-n3-zusammensetzung.md` (S1-13, YangN3.lean, Importzyklus),
- `lean-project-ci.md` (S1-14, Workflow `lean-project.yml`, `lean_report.py`).

Keiner dieser Einträge enthält ein Prüfurteil zu `formalization.yaml`. Die Einträge zu Lean 4.19 und `mm325` sind laut Auftrag veraltet. Ich habe sie nicht benutzt, maßgeblich war der Code beim Commit `676cdf5`.

**Kenntnis vom Zusammenhang.** Der Auftrag enthielt die Nachricht von Justus mit drei Prüfaufträgen „vor dem neuen SHA“. Daraus ist erkennbar, dass der Bericht vor einer neuen Fassung des Palomar-Eintrags gebraucht wird. Ein erwünschtes Ergebnis war nicht genannt.

**Außerhalb der Positivliste gesehen.** Beim Prüfen des Zielpfads habe ich `ls palomar/` ausgeführt und dabei nur die drei Dateinamen `ANFORDERUNGEN.md`, `BELEGE.md`, `s5-08-bericht.md` gesehen, keinen Inhalt. `git fetch` und `git rev-parse` zeigten mir nur Commit-Hashes (Kopf von `main`: `5d813c7`), keine Historie. Sonst habe ich nur Dateien der Positivliste gelesen, `formalization.yaml` nur in den Zeilen 1–3, 9–27 und 36–92 und `PROTOKOLL.md` nur Abschnitt 5.

**Spuren früherer Arbeit.** Die Lean-Dateien nennen in Kommentaren Auftragsnummern (S1-01 bis S5-17), Behauptungsdateien (`behauptungen/B-007` bis `B-014`) und Prosa-Dateien unter `lean/prosa/` und `versuche/`. Zeile 2 von `formalization.yaml` nennt die Aufträge S5-08 und S5-21. Prüfurteile habe ich dort nicht gesehen.

**Hilfsmittel.** Für den Vergleich der Koeffizienten habe ich ein kurzes Python-Skript mit ganzzahliger Arithmetik geschrieben (nicht im Repo). Es liest die JSON-Datei und die drei Tabellen `u`, `v`, `w` aus `Upper4x2x4.lean`. Lean habe ich nicht gebaut. Die Import-Hülle von `MatMulRank/Solution.lean` habe ich aus den `import`-Zeilen bestimmt.

## 1. Die tatsächliche Kette im Lean-Code

So geht der Beweis nach dem Code, von der Challenge abwärts:

1. `MatMulRank.rank_four_two_four_eq_26` (`MatMulRank/Solution.lean`, Z. 89) über `tensorRank_eq_yangBounds` (Z. 63) auf `YangBounds.Gleich444.rank_four_two_four_eq_26` (`Gleich444.lean`, Z. 27). Das ist `le_antisymm` aus der oberen und der unteren Schranke.
2. Obere Schranke: `YangBounds.Upper4x2x4.rank_four_two_four_le_26` (`Upper4x2x4.lean`, Z. 189) mit dem Verfahren `algorithm` (Z. 157) und `tensor_identity` (Z. 135, `decide +kernel`).
3. Untere Schranke: `Transponiert444.rank_four_two_four_ge_26` (`Transponiert444.lean`, Z. 660), dann `LemmaZ444.rank_four_two_four_ge_26_of_transponiertEng` (`LemmaZ444.lean`, Z. 896), dann `rank_four_two_four_ge_26_of_lemmaK` (Z. 833):
   - Längen unter 25 schließt `yang_theorem_two_algorithm` aus (Yangs Satz 2, `Statements.lean`).
   - Für Länge 25 bildet `Bruecke444.genAlgL` (`Bruecke444.lean`, Z. 277) die generische Normalform: Basiswechsel mit generischen Matrizen `S` (4×4) und `T` (2×2) über dem Körper der rationalen Funktionen `GField K = K(S, T)` in 20 Variablen, gelesen über dessen algebraischem Abschluss `GBar K` (Z. 239).
   - `Bruecke444.bruecke` (Z. 505): `genAlgL alg` erfüllt (N1), (N2), liegt im Fall (5,8) und ist nicht symmetrisch. Dabei kommt die Nichtsymmetrie aus Satz C am generischen Punkt (`SatzC444Generisch.satzC_generisch`, Z. 564, mit einer Derivation `∂/∂T₀₁` auf `K(S, T)`), über `isSymm_descent` auf `GBar K` übertragen. Der Fall (5,8) kommt aus Satz B (`SatzB444Final.satzB_unbedingt`: nur (3,6) oder (5,8)); (3,6) ist symmetrisch (`satzB_symm_unbedingt`) und damit ausgeschlossen. Satz B stützt sich auf Satz A (`SatzA444`: ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}) und auf Lemma 13′ (`Lemma13Prime.lean`).
   - `Bruecke444.bruecke_unterfallB` (Z. 528): Lemma P (`LemmaP444.nur_unterfallB'`) teilt den Fall (5,8) in die Unterfälle A und B. Unterfall A schließt Satz E aus (`SatzE444.satzE`), es bleibt Unterfall B.
   - `SatzF444.satzF` (Z. 769): Unterfall B mit (B3′) `TransponiertEng` und (Z′) `VielePunkte _ 11` erzwingt Symmetrie. Das widerspricht der Nichtsymmetrie. (Z′) liefert Lemma Z (`LemmaZ444.lemmaZ_bruecke_11`, 13 Punkte, mit Lemma K aus `LemmaK444.lean`). (B3′) liefert die transponierte Zerlegung am selben Punkt (`Transponiert444.transponiertEng_genAlgL`, Z. 604), für die wieder Satz B, Lemma P und Satz E gelten.

Die Import-Hülle von `MatMulRank/Solution.lean` besteht aus genau den 30 Modulen der Positivliste ohne `Challenge.lean`. Kein Modul davon importiert `mm325` oder `MatrixMultiplicationLowerBound25`. Nur Kommentare in `Basic.lean` (Z. 7–9, 51–54) nennen die frühere Abhängigkeit.

## 2. Angaben in der Beschreibung (Zeilen 9–27)

| Nr. | Zeile | Wortlaut (gekürzt) | Urteil | Fundstelle im Lean-Code |
|---|---|---|---|---|
| D1 | 12 | „The tensor rank of 4x2x4 matrix multiplication is 26 over every field“ | stimmt | `MatMulRank.rank_four_two_four_eq_26` (`Challenge.lean` Z. 94, `Solution.lean` Z. 89): `tensorRank K 4 2 4 = 26` für `(K : Type u) [Field K]` |
| D2 | 14–16 | Definition von `R_K(<n,l,m>)` als kleinste Zahl r von Produkten in `A*B = sum_{k<r} alpha_k(A) beta_k(B) C_k`, `alpha_k, beta_k` Linearformen, `C_k` feste Matrizen | stimmt | `MatMulRank.BilinearAlgorithm` (`Challenge.lean` Z. 68–73): Felder `alpha`, `beta` (Linearformen), `coeff` (n×m-Matrizen), `correct`; `tensorRank` als `sInf` (Z. 80). Gleichheit mit der Projektdefinition (`Nat.find`, `Basic.lean` Z. 127): `tensorRank_eq_yangBounds` (`Solution.lean` Z. 63) |
| D3 | 16–18 | „proves in Lean 4 with Mathlib that R_K(<4,2,4>) = 26 for every field K, with no assumption on the characteristic, finiteness or algebraic closedness of K“ | stimmt | einzige Annahme ist `[Field K]`, beliebiges Universum `u` (`Challenge.lean` Z. 94, `Gleich444.lean` Z. 27). Ob der Beweis ohne `sorry` und nur mit Standard-Axiomen durchgeht, sieht man am Quelltext nicht; das zeigt nur der Build. Im Quelltext der Kette steht kein `sorry` außer dem gewollten in `Challenge.lean` Z. 95 |
| D4 | 18–19 | „The upper bound 26 is the known value of Hopcroft and Kerr (1971)“ | am Code nicht entscheidbar | Literaturangabe. Die Kommentare in `Upper4x2x4.lean` (Z. 18–19) und `Challenge.lean` (Z. 39) sagen dasselbe |
| D5 | 19–21 | „proved by an explicit algorithm with 26 products and integer coefficients in {-1, 0, 1}“ | stimmt | `Upper4x2x4.u`, `v`, `w` (Z. 44, 74, 104), `Fin 26`. Alle Einträge sind −1, 0 oder 1. Die drei Tabellen stimmen Eintrag für Eintrag mit `verfahren/4x2x4-r26-s001.json` überein (26 Produkte, `"ring": "Z"`, Werte nur −1, 0, 1, SHA-256 `3a8a9214…5ae4` wie in `Upper4x2x4.lean` Z. 20–21 angegeben) |
| D6 | 20–21 | „found by the project's own search“ | stimmt (an der JSON-Datei) | `origin.source` der JSON-Datei: „eigene Suche (Flip-Graph-Wanderung nach Kauers und Moosbauer 2023, ohne fremden Code)“, `created_by`: „Verfahrenssucher, S2-03“. Im Lean-Code selbst steht nur der Verweis auf die Datei |
| D7 | 21 | „and checked by the Lean kernel“ | stimmt | `Upper4x2x4.tensor_identity` (Z. 135–138): Tensoridentität über `ℤ` für alle 1024 Indextupel, `decide +kernel` (kein `native_decide`). Mit der Abbildung `ℤ → K` wird daraus die Korrektheit über jedem Körper (`algorithm`, Z. 157–185). Eine eigene Nachrechnung mit ganzen Zahlen ergab ebenfalls 0 Abweichungen |
| D8 | 21–22 | „To our knowledge, the lower bound 26 is new (literature search recorded in lit/)“ | am Code nicht entscheidbar | Literaturfrage, `lit/` ist nicht in meiner Positivliste |
| D9 | 22 | „the previously known lower bound was 25 (J. Yang, arXiv:2609.14393, Theorem 2, which the development also formalises)“ | Formalisierung: stimmt. „previously known“: am Code nicht entscheidbar | `YangBounds.yang_theorem_two` (`Statements.lean` Z. 49): `(n + 2) * m + (n - 3) ≤ tensorRank K n 2 m` für `4 ≤ n ≤ m`, bewiesen über `YangN4Haupt.yang_theorem_two_of_lemma13` und `YangN4Lemma13.lemma13_statement`. Für `n = m = 4`: `rank_four_two_four_ge` (25, Z. 92) |
| D10 | 23 | „The proof of the lower bound follows Yang's normal-form method for <n,2,m>“ | stimmt nur zum Teil | Yangs Normalform (N1), (N2) steht in `YangN4Haupt.lean` (`SN1` Z. 344, `SN2` Z. 348) und wird benutzt. Der Beweis der 26 besteht aber überwiegend aus Schritten, die nach den Kommentaren nicht von Yang sind: Satz A bis F, Lemma 13′, Lemma P, K und Z, die Brücke, die transponierte Zerlegung (Dateien `SatzA444` bis `Transponiert444`; dort jeweils „Sources: prose `lean/prosa/s2_444_…`“). „follows Yang's method“ unterschlägt das. Vorschlag siehe unten |
| D11 | 24–25 | „a decomposition of length 25 is moved over an algebraically closed field into a generic normal form“ | stimmt im Ergebnis, Reihenfolge und Mittel ungenau | `Bruecke444.genAlgL` (Z. 277): erst Basiswechsel mit generischen `S`, `T` über `K(S, T)` (`SatzC444Generisch.genAlg`, Z. 258), dann Übergang zu `GBar K = AlgebraicClosure K(S, T)` (Z. 239). Nicht `AlgebraicClosure K`. Die Nichtsymmetrie wird über dem nicht algebraisch abgeschlossenen Körper `K(S, T)` mit einer Derivation bewiesen und dann durch einen Abstiegsschluss (`descent`, `isSymm_descent`) auf den Abschluss übertragen |
| D12 | 25–26 | „and excluded case by case (four residual rank cases, a symmetric case, and two sub-cases of the case (5,8))“ | stimmt nicht in der Form | Die Aufzählung stellt drei Gruppen nebeneinander, die im Code ineinander liegen. Satz A (`SatzA444.satzA`) lässt die vier Rangfälle (3,6), (4,7), (5,7), (5,8) übrig. Satz B (`SatzB444Final.satzB_unbedingt`) schließt (4,7) und (5,7) aus und zeigt, dass (3,6) symmetrisch ist (`satzB_symm_unbedingt`). Der symmetrische Fall ist also kein weiterer Fall neben den vier, sondern der Fall (3,6). Ausgeschlossen wird er durch Satz C (Nichtsymmetrie am generischen Punkt). Der Fall (5,8) zerfällt nach Lemma P in die Unterfälle A und B. A schließt Satz E aus. B wird nicht direkt ausgeschlossen: Satz F zeigt mit Lemma Z und der transponierten Zerlegung, dass B Symmetrie erzwingt, und das widerspricht wieder Satz C. Die Zählung „vier, eins, zwei“ ergibt so keine sieben getrennten Fälle |
| D13 | 26–27 | „carried out by AI models directed by the repository owner; no human mathematician has reviewed the proof“ | am Code nicht entscheidbar | — |

**Vorschläge (Englisch) zu D10 bis D12**, als ein Ersatz für die Zeilen 23–26 bis „(5,8))“:

> The proof of the lower bound builds on Yang's normal form (N1), (N2) for <n,2,m> and extends it with new steps. Lengths below 25 are excluded by Yang's Theorem 2. A decomposition of length 25 is put into a generic normal form over the field of rational functions K(S, T) and read over its algebraic closure. There, Theorem A leaves four rank cases (3,6), (4,7), (5,7), (5,8); Theorem B excludes (4,7) and (5,7) and shows that (3,6) is symmetric; Theorem C shows that the generic normal form is not symmetric. The case (5,8) splits into two sub-cases: sub-case A is excluded by Theorem E, and in sub-case B Theorem F, with Lemma Z and the transposed decomposition, forces a symmetry, which Theorem C excludes.

Wenn die Kurzform bleiben soll, genügt als kleinste Berichtigung von D12:

> … and excluded case by case: four rank cases remain, of which two are excluded directly, one is symmetric (excluded by non-symmetry at the generic point), and the case (5,8) splits into two sub-cases.

## 3. Angaben in Klassifikation und Quellen (Zeilen 36–92)

| Nr. | Zeile | Wortlaut (gekürzt) | Urteil | Fundstelle |
|---|---|---|---|---|
| Q1 | 37–38 | arXiv-Klassen, MSC2020 | am Code nicht entscheidbar | — |
| Q2 | 41–44 | Quelle „Lower bound 26 … over every field“, `original-proof`, Literaturprüfung in `lit/` | Titel: stimmt (Aussage `Transponiert444.rank_four_two_four_ge_26`, Z. 660, `[Field K]`). Rest: am Code nicht entscheidbar | — |
| Q3 | 45–49 | Yang, arXiv:2609.14393, „version 3 of 12 October 2026; normal form (N1), (N2), Theorem 2, Lemma 13“ | stimmt, soweit am Code ablesbar | Die Lean-Dateien nennen dieselbe Fassung „arXiv:2609.14393v3 (12.10.2026)“ (`Basic.lean` Z. 40–41, `Statements.lean` Z. 21, `YangN4Haupt.lean` Z. 19–20). (N1), (N2) = `SN1`, `SN2` (`YangN4Haupt.lean` Z. 344, 348). Ob die Fassung im Archiv so heißt, ist nicht am Code entscheidbar |
| Q4 | 52–53 | „Yang's Theorem 2 gives R(<n,2,m>) >= (n+2)m + n - 3 for m >= n >= 4, i.e. the bound 25 for <4,2,4>“ | stimmt | `yang_theorem_two` (`Statements.lean` Z. 49–50), `rank_four_two_four_ge` (Z. 92): 25 |
| Q5 | 53 | „it is formalised in this repository (YangBounds.yang_theorem_two)“ | stimmt | Name und Namensraum wie angegeben (`Statements.lean` Z. 33, 49) |
| Q6 | 54 | „and used to exclude lengths below 25“ | stimmt | `LemmaZ444.rank_four_two_four_ge_26_of_lemmaK` (Z. 833–844): `yang_theorem_two_algorithm K 4 4 …` gibt `25 ≤ r`, dann `r = 25` |
| Q7 | 54 | „The proof of the bound 26 uses Yang's normal form.“ | stimmt | `genAlgL` erfüllt `SN1`, `SN2` (`Bruecke444.bruecke`, Z. 505). `genAlg` ist nach dem Kommentar „the change of basis R3 of Lemma 6 at the generic point“ (`SatzC444Generisch.lean` Z. 26) |
| Q8 | 54–55 | „One step of the written proof of Yang's Lemma 13 could not be followed“ | am Code nicht entscheidbar | Der Code sagt nur: „This file follows the argument of the prose file (over the quotient), not the one printed in the paper“ (`YangN4Lemma13.lean` Z. 21–22). Dass ein Schritt nicht nachvollziehbar war, steht im Code nicht |
| Q9 | 55–56 | „the formalisation proves the same statement by a different argument (YangBounds/YangN4Lemma13.lean)“ | Datei und „different argument“: stimmt. „same statement“: am Code nicht entscheidbar | `YangN4Lemma13.Lemma13Statement` (Z. 110) und `lemma13_statement` (Z. 602): `d·ρ + (d−2)·rk L ≤ 2·rk H` für `d ≥ 2`, ρ als Maximum. Der Kommentar nennt das „Lemma 13 of the prose file, Section 6, abstract form“ (Z. 108); ob das wörtlich Yangs Lemma 13 ist, sieht man nur am Artikel. Abweichungen des Beweises sind in Z. 56–70 aufgeführt (Lemma 11 anders bewiesen, Schritt 1 mit Matrix `ξ`, Schritt 4 über Rang-Defekt) |
| Q10 | 51–56 | Notiz zu Yang insgesamt | unvollständig (keine falsche Angabe) | Die Notiz nennt Lemma 13 nur für Satz 2. Im Beweis der 26 wird zusätzlich eine Verschärfung benutzt, Lemma 13′ (`Lemma13Prime.lean`, „a sharpening of Yang's Lemma 13 … the sharpening by the term `s` is from S2-05“, Z. 8–13), über `SatzA444.sDim_table` und `exists_common_kernel` in Satz B. Vorschlag zum Anhängen: „The proof of the bound 26 also uses a sharpening of Lemma 13 by an additional term (Lemma 13′, YangBounds/Lemma13Prime.lean), which is not in Yang's paper.“ |
| Q11 | 64 | Hopcroft–Kerr: „Upper bound ceil((3nm + max(n,m))/2), which gives R(<4,2,4>) <= 26“ | Formel: am Code nicht entscheidbar. Rechnung: stimmt | ⌈(3·4·4 + 4)/2⌉ = 26. Der Lean-Code nennt keine Formel, nur „the value 26 is the known upper bound of Hopcroft and Kerr 1971“ (`Upper4x2x4.lean` Z. 18–19). Der Artikel wird in einem eigenen Auftrag gelesen |
| Q12 | 64–65 | „The upper bound 26 is part of the compared statement.“ | stimmt | Die Challenge sagt `= 26` (`Challenge.lean` Z. 94), nicht nur `≥ 26` |
| Q13 | 65–68 | „not proved by formalising the construction of the article: YangBounds/Upper4x2x4.lean gives an explicit algorithm with 26 products (verfahren/4x2x4-r26-s001.json, found by the project's own search), and the kernel checks its tensor identity“ | stimmt | wie D5 bis D7 |
| Q14 | 68–69 | „The original article was not read; the formula is cited identically by Yang … and other sources.“ | am Code nicht entscheidbar | — |
| Q15 | 70–75 | Shitov, Ausgangspunkt von Yangs Methode, „not read; cited after Yang“ | am Code nicht entscheidbar | Shitov kommt in der Lean-Kette nicht vor |
| Q16 | 76–84 | matmulcatalog, Zeile 90 und `RANK_KNOWLEDGE.md` Z. 297 | am Code nicht entscheidbar | — |
| Q17 | 87–91 | mm325_proof: Lean-Formalisierung des Rangs von <3,2,5> von Tsyganov, Parkina, Samsonov, Rakhuba (arXiv:2609.22054) | am Code nicht entscheidbar | — |
| Q18 | 91 | „It served as a template in early stages of this repository“ | stimmt nicht in der Form | `Basic.lean` Z. 51–54 sagt mehr als „template“: „This file does not import the former external dependency `fallnlove/mm325_proof`. The connection to it (`tensorRank_three_two_eq`, `tpsr_lower_bound`) lived in `YangBounds/BrueckeMM325.lean` …, which task S5-03 removed“. Ebenso Z. 7–9 (Mathlib-Importe des früheren Abhängigkeitsmoduls `MatrixMultiplicationLowerBound25`). mm325_proof war also früher eine Abhängigkeit des Projekts, mit einem eigenen Brückenmodul. Ob es außerdem Vorlage war, ist am Code nicht entscheidbar (das prüft ein eigener Auftrag) |
| Q19 | 91–92 | „it is not a dependency of this entry (no module of the submitted chain imports it)“ | stimmt | Die Import-Hülle von `MatMulRank/Solution.lean` (30 Module, siehe Abschnitt 1) enthält kein Modul aus mm325_proof. Nur ein Kommentar in `Basic.lean` nennt es. Ob die Lake-Konfiguration das Paket noch lädt, kann ich nicht sehen (`lakefile`, `lake-manifest.json` sind nicht in der Positivliste) |

**Vorschlag (Englisch) zu Q18:**

> Lean formalisation of the rank of <3,2,5> by Tsyganov, Parkina, Samsonov and Rakhuba (arXiv:2609.22054). In early stages this repository depended on it (a bridge module, removed in a later task); it is not a dependency of this entry (no module of the submitted chain imports it).

## 4. Liste der Abweichungen

1. **D12** (Z. 25–26): Die Aufzählung „four residual rank cases, a symmetric case, and two sub-cases of the case (5,8)“ stellt ineinander liegende Fälle nebeneinander. Der symmetrische Fall ist der Rangfall (3,6), und Unterfall B wird über Symmetrie ausgeschlossen, nicht für sich. Vorschlag in Abschnitt 2.
2. **D10** (Z. 23): „follows Yang's normal-form method“ unterschlägt, dass der größte Teil der Kette aus eigenen Schritten besteht (Satz A bis F, Lemma 13′, P, K, Z, Brücke, transponierte Zerlegung). Vorschlag in Abschnitt 2.
3. **D11** (Z. 24–25): Die Reihenfolge ist umgekehrt. Erst kommt die generische Normalform über `K(S, T)`, dann der algebraische Abschluss dieses Körpers (nicht der von `K`). Die Nichtsymmetrie wird vor dem Abschluss bewiesen. Im Ergebnis stimmt die Angabe. Vorschlag in Abschnitt 2.
4. **Q18** (Z. 91): mm325_proof war nach `Basic.lean` früher eine Abhängigkeit mit eigenem Brückenmodul, nicht nur eine Vorlage. Vorschlag in Abschnitt 3.
5. **Q10** (Z. 51–56), Lücke ohne falsche Angabe: Lemma 13′, eine Verschärfung von Yangs Lemma 13, die nicht bei Yang steht, wird im Beweis der 26 benutzt und nicht genannt. Vorschlag in Abschnitt 3.

Am Code bestätigt sind: Name und Aussage des Satzes, „over every field“ ohne Zusatzannahme, die Definition des Tensorrangs, das Verfahren mit 26 Produkten und Koeffizienten in {−1, 0, 1} (identisch mit der JSON-Datei), die Prüfung der Tensoridentität durch den Kern mit `decide +kernel`, Name, Aussage und Verwendung von `YangBounds.yang_theorem_two`, die Datei `YangN4Lemma13.lean` mit eigenem Beweisweg und dass keine Datei der Kette mm325_proof importiert.

Am Code nicht entscheidbar sind alle Literatur- und Herkunftsangaben (D4, D8, D13, Q1, Q8, Q11 Formel, Q14 bis Q17) und die Frage, ob `Lemma13Statement` wörtlich Yangs Lemma 13 ist (Q9).

## 5. Nebenbefund

Die Kommentare in `Endsatz444.lean` (Z. 29–34, 38–50) beschreiben einen Weg über `AlgebraicClosure K` mit Basiswechsel R1. Diesen Weg nimmt die eingereichte Kette nicht. Sie geht über `LemmaZ444` und `Bruecke444.genAlgL` und benutzt aus `Endsatz444` nur `fall58_of_nichtSymmetrisch` (in `Transponiert444.lean` Z. 487). Für `formalization.yaml` hat das keine Folge. Wer aber die Kette an den Dateikommentaren nachliest, kann den falschen Weg für den eingereichten halten.
