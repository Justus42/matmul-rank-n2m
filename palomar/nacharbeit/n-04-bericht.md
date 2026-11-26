# N-04: Frühe Lean-Dateien im Vergleich mit fallnlove/mm325_proof

Auftrag N-04 (Prüfer, Nacharbeit außerhalb der Runden). Bericht vom 26.11.2026.
Frage: Enthalten unsere frühen Lean-Dateien Passagen, die aus `fallnlove/mm325_proof` übernommen sind?
Ob eine Übernahme zulässig wäre, entscheidet dieser Bericht nicht. Er meldet den Befund mit Belegen.

## 0. Offenlegung: eingeblendete Gedächtniseinträge und Gesehenes außerhalb der Positivliste

Eingeblendet waren mir aus dem Projektgedächtnis:

1. Der Index `MEMORY.md` vollständig (Projektziel, Regeln zu Protokoll 0.7 und Stufe 5, Hinweise zu Fremdmodell, Bridge, Prüferaufträgen, Literaturwache, Merge-Ablauf, Verweise auf `verfahren-datenformat` und `lean-project-ci`).
2. Der Einzeleintrag `mm325-lizenz`: mm325_proof hat keine Lizenz, nur extern klonen oder als Lake-Abhängigkeit einbinden, nicht ins Repo kopieren; Nebenbefund zur SHA-256 in `verification.txt`.
3. Der Einzeleintrag `gemini-bridge`: Bridge-Freigaben und Zeitgrenze.
4. Der Einzeleintrag `lean-build-cloud`: Lean und mathlib in der Cloud-Sitzung bauen.
5. Der Einzeleintrag `aussagen-abgleich-n3`: Hinweise zu Bridge und lokalem Lean-Bau.

Keiner dieser Einträge enthält ein Urteil zur Frage dieses Auftrags. Eintrag 2 nennt die Lizenzlage, die auch in `lit/LIZENZEN.md` steht (Positivliste). Ich habe nichts ins Gedächtnis geschrieben.

Gesehen außerhalb der Positivliste, ohne es gezielt zu lesen:

- Die Kopfzeile von `CLAUDE.md` und die Überschriftenliste aller Abschnitte von `PROTOKOLL.md` (per `grep` auf Überschriften, um Abschnitt 5 und 11.3 zu finden).
- Den Betreff des Commits `5d813c7` (Spitze von `main` beim Start: „Merge pull request #171: N-01 README, lean/README und Ergebnistext").
- Die Betreffzeilen und Zeitstempel der acht genannten Erst-Commits (per `git log -1`), damit die Erstfassungen zugeordnet werden konnten.
- Die Dateinamen in `palomar/` (`ANFORDERUNGEN.md`, `BELEGE.md`, `s5-08-bericht.md`), beim Anlegen des Zielordners. Inhalte nicht gelesen.
- Der Klon unseres Repos war flach. Ich habe `git fetch --unshallow` ausgeführt, damit die Erst-Commits erreichbar sind. Damit liegt die ganze Historie lokal vor. Gelesen habe ich daraus nur die genannten Dateien in den genannten Commits.
- Der Auftrag selbst zitiert eine Nachricht von Justus mit zwei weiteren Prüfaufträgen (Beweisweg in `lean/formalization.yaml`; TR 69-44 von Hopcroft und Kerr) und spricht von einem „neuen SHA". Mehr weiß ich darüber nicht.
- Kommentare in den gelesenen Lean-Dateien nennen andere Aufträge (S1-01, S4-26, S5-03, S5-08) und ihre Änderungen. Das gehört zu den Dateien der Positivliste.

## 1. Gegenstand und Stände

Fremde Seite: `https://github.com/fallnlove/mm325_proof`, Commit `759cf4a8524d4212e7832046204c90b9361ba2bb`, am 26.11.2026 ohne Anmeldung geklont nach `/tmp/claude-0/n04/mm325` (außerhalb unseres Repos). Verglichen wurde die einzige Beweisdatei `MatrixMultiplicationLowerBound25.lean` (2.303 Zeilen, 20.821 Token ohne Kommentare, 170 Deklarationen nach meinem Muster), dazu `Audit.lean`, `lakefile.toml` und `lake-manifest.json` von Hand. SHA-256 der Beweisdatei: `b1ec8c87dbdff3de92effa9b41de0a0c3ba61001525fea1eaa853aec51e8ed79`.

Unsere Seite, drei Stände:

| Stand | Quelle | Dateien |
|---|---|---|
| Erstfassungen | `89c2a38` (Basic, Statements, YangBounds, Axioms, lakefile, Manifest), `f7a59b9` (YangN3Teil1), `d0e7f23` (YangN3Teil2), `e527f1b` (YangN3Teil3), `374c17c` (Upper3x2x6), `a5e302c` (CeilBound, YangN3), `48cbce3` (YangN4Lemma13), `78da4b9` (YangN4Haupt) | 12 Lean-Dateien, 2 Lake-Dateien |
| Zweig `lean-4.19` | `71240f8` | dieselben 12 Lean-Dateien, dazu `YangBounds/BrueckeMM325.lean`, `AxiomsMM325.lean`, Lake-Dateien |
| `main` | `676cdf5deb786e81a66342606d4dd2b6f919745e` | dieselben 12 Lean-Dateien, Lake-Dateien |

`BrueckeMM325.lean` und `AxiomsMM325.lean` gibt es in keinem der acht Erst-Commits und nicht auf `main`. Ihre Erstfassung lag nicht auf der Positivliste. Der Inhalt der Brücke steht aber schon in der Erstfassung von `Basic.lean` (`89c2a38`, Zeilen 125 bis 153).

## 2. Verfahren

Das Programm steht im Anhang. Es läuft mit Python 3 ohne fremde Pakete.

1. **Gleiche lange Zeilen:** Kommentare entfernt, Leerraum zusammengefasst, Zeilen mit mindestens 25 Zeichen; gesucht sind maximale Folgen gleicher Zeilen.
2. **Token-Läufe roh:** Kommentare entfernt, Lean-Text in Token zerlegt (Bezeichner, Zahlen, Einzelzeichen), alle gemeinsamen Läufe ab 12 Token.
3. **Token-Läufe normalisiert:** wie 2, aber jeder Bezeichner außer Schlüsselwörtern und Taktiknamen wird zu `ID`, jede Zahl zu `N`; Läufe ab 30 Token. Das findet auch Abschriften mit umbenannten Bezeichnern und geänderter Einrückung.
4. **Gleiche Deklarationsnamen:** letzter Namensteil jeder `def`, `theorem`, `lemma`, `structure`, `abbrev`, `instance` auf beiden Seiten.
5. **Gleiche Beweisskripte:** jede Deklaration samt Beweis normalisiert wie in 3; gemeldet wird völlige Gleichheit ab 15 Token.
6. **Kommentare und Docstrings:** gemeinsame Wort-8-Gramme nur im Kommentartext (`kommentare.py`).
7. **Gemeinsame Bezeichner:** jeder Deklarationsname der fremden Datei, der irgendwo in unseren Dateien als Bezeichner oder Namensteil vorkommt (`namen.py`).

**Selbsttest:** Ich habe 21 Zeilen der fremden Datei (Zeilen 1090 bis 1110) mit umbenannten Bezeichnern (`finrank_` zu `dim_`, `D.H` zu `D.Hx`) in eine Testdatei gesetzt. Verfahren 3 fand einen Lauf von 178 Token über alle 21 Zeilen, Verfahren 5 meldete zwei gleiche Deklarationen. Die Testdatei wurde danach gelöscht. Eine Abschrift dieser Art wäre also gefunden worden.

Danach habe ich jeden Treffer der Verfahren 1 bis 5 und 7 auf beiden Seiten von Hand angesehen.

## 3. Befund in Kürze

- In keinem der drei Stände findet der Vergleich eine Passage aus Beweiscode, Definitionen oder Kommentaren, die aus der fremden Datei abgeschrieben ist. Verfahren 3 und 5 (Abschrift mit Umbenennung) finden außerhalb der Importliste nichts über 32 Token, und keine Deklaration ist nach Normalisierung gleich.
- **(a) Wörtlich gleich** ist genau eine Passage: die Liste der Mathlib-Importe in `YangBounds/Basic.lean` auf `lean-4.19` und `main` (21 Zeilen). Sie ist die Importliste der fremden Datei in derselben Reihenfolge. Ein Kommentar direkt darüber nennt die Herkunft. Die Erstfassung hat diese Liste nicht.
- **(b) Aus Mathematik oder Lean-Üblichkeit:** die Struktur `BilinearAlgorithm` (gleiche Feldnamen und gleiche Korrektheitsgleichung wie `MatrixAlgorithm`, laut Kommentar absichtlich, damit die Brücke feldweise passt), das Schema `tensorRank` / `_attained` / `_le` mit `Nat.find`, und einige Zeilen aus Mathlib-Standardschreibweise.
- **(c) Nur gleiche Namen:** `J`, `H`, `finrank_J` in `YangN3Teil3.lean` und `YangN4Haupt.lean`, mit anderer Definition und anderem Beweis.
- Die Brücke hat das fremde Paket importiert (Lake-`require` mit fester URL und festem Commit), nicht kopiert. Sie benutzt fünf fremde Namen. Kommentare in `Basic.lean`, `BrueckeMM325.lean`, `AxiomsMM325.lean` und `lakefile.toml` nennen die Herkunft.

## 4. Treffer im Einzelnen

Zeilenangaben sind Zeilennummern der jeweiligen Datei im genannten Stand. „F" ist `MatrixMultiplicationLowerBound25.lean`.

### 4.1 Klasse (a): wörtlich oder fast wörtlich gleich

**A1. Importliste in `Basic.lean`**

| Stand | unsere Zeilen | F-Zeilen | Länge |
|---|---|---|---|
| Erstfassung `89c2a38` | nicht vorhanden (die Datei importiert dort `MatrixMultiplicationLowerBound25` selbst, Zeile 5) | – | – |
| `lean-4.19` `71240f8` | 8 bis 27 und 28 | 1 bis 20 und 23 | 21 Zeilen, 41 Token am Stück (Verfahren 2) |
| `main` `676cdf5` | 10 bis 30, jeweils mit `public import` statt `import` | 1 bis 20 und 23 | 21 Zeilen |

Die beiden übrigen Importe von F (Zeilen 21 und 22: `Mathlib.Data.Matrix.Mul`, `Mathlib.Data.Nat.Find`) stehen bei uns schon in den Zeilen 1 und 2 (`lean-4.19`) bzw. 3 und 4 (`main`). Damit ist unsere Liste die vollständige Importliste von F in derselben Reihenfolge. Der Kommentar direkt darüber (`lean-4.19` Zeilen 5 bis 7, `main` Zeilen 7 bis 9) sagt:

> `-- S4-26 (condition 7): the Mathlib modules below are exactly the Mathlib imports of the`
> `-- former dependency module `MatrixMultiplicationLowerBound25` that this file no longer`
> `-- imports, so that every downstream file sees the same Mathlib environment as before.`

Inhalt sind nur Namen von Mathlib-Modulen, kein Beweis- oder Definitionstext. Ob eine solche Liste schutzfähig ist, entscheide ich nicht.

**Weitere wörtliche Treffer** sind einzelne Zeilen aus Mathlib-Standardschreibweise, alle unter (b) eingeordnet (Abschnitt 4.2, B3).

### 4.2 Klasse (b): gleich, weil Mathematik oder Lean-Üblichkeit es nahelegen

**B1. Struktur `BilinearAlgorithm` gegen `MatrixAlgorithm`.** Unsere Struktur hat dieselben vier Feldnamen (`alpha`, `beta`, `coeff`, `correct`) und dieselbe Gleichung wie F, aber für allgemeine `n`, `l` statt `3`, `2`.

| Stand | unsere Zeilen | F-Zeilen |
|---|---|---|
| Erstfassung `89c2a38` | 40 bis 45 | 2217 bis 2221 |
| `lean-4.19` | 63 bis 68 | 2217 bis 2221 |
| `main` | 67 bis 72 | 2217 bis 2221 |

Längster roher Token-Lauf: 23 Token, nämlich die Korrektheitsgleichung.

Unsere Seite (`main` Zeile 72):
> `    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k`

F Zeile 2221:
> `  correct : ∀ A B, A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k`

Die Gleichung ist die Definition einer Rang-Zerlegung in Mathlib-Schreibweise. Die gleichen Feldnamen und die gleiche Reihenfolge sind gewollt: Der Docstring der Erstfassung (`89c2a38` Zeilen 24 bis 27) sagt, die Struktur stimme für `n = 3`, `l = 2` „field by field" mit `MatrixAlgorithm` überein, damit die Brücke einfach `⟨alg.alpha, alg.beta, alg.coeff, alg.correct⟩` schreiben kann. Bei uns stehen anders als in F die Typen von `A` und `B` ausdrücklich im Binder.

**B2. Rangbegriff über `Nat.find`.** Unser Schema `exists_bilinearAlgorithm` / `tensorRank` / `tensorRank_attained` / `tensorRank_le` (`main` Zeilen 121 bis 140, `lean-4.19` 112 bis 131, Erstfassung 89 bis 108) entspricht dem Schema `exists_matrixAlgorithm` / `matrixTensorRank` / `matrixTensorRank_attained` / `matrixTensorRank_le` in F (Zeilen 2266 bis 2284; dasselbe Schema auch in F 2163 bis 2178 für `matrixMultiplicationRank`). Gleich sind die Namensendungen `_attained` und `_le` und die drei Beweiszeilen `classical` / `exact Nat.find …`, `Nat.find_spec …`, `Nat.find_min' … ⟨alg⟩`. Längster roher Lauf: 12 Token (`: ℕ) : ℕ := by classical exact Nat.find (`). So definiert man in Lean das Minimum einer nichtleeren Menge natürlicher Zahlen. Die Beispielzerlegung, die die Menge nichtleer macht, ist bei uns anders geschrieben (`standardAlgorithm` mit eigenen Hilfsdefinitionen `entryForm` und `unitMatrix` und `Equiv.sum_comp`) als in F (`exists_decomposition`, F 2130 bis 2159, mit lokalen `let` und Umweg über `fromMatrixAlgorithm`). Verfahren 3 fand dort keinen gemeinsamen Lauf ab 30 Token.

**B3. Einzelne Zeilen aus Mathlib-Standardschreibweise** (alle drei Stände, Zeilen hier für `main`):

| unsere Datei, Zeilen | F-Zeilen | gemeinsamer Text | Länge |
|---|---|---|---|
| `YangN3Teil3.lean` 212 bis 214 | 668 bis 670 | Typklassen-Binder `[AddCommGroup V] [Module K V] [FiniteDimensional K V] [AddCommGroup …` | 16 Token roh, 31 normalisiert |
| `YangN4Lemma13.lean` 489, 528 f., 562, 576 | 670 | `[AddCommGroup Q] [Module K Q] [FiniteDimensional K Q]` | 14 Token |
| `YangN4Lemma13.lean` 134 f. | 883 bis 885 | Variablenbinder `{… : Type*} [AddCommGroup …] [Module K …] …` | 30 Token normalisiert |
| `YangN3Teil3.lean` 619 f. | 1223 f. | `:= by rintro _ ⟨x, hx, rfl⟩` | 12 Token |
| `YangN3Teil3.lean` 658 | 1001 | `apply Submodule.finrank_mono` | 1 Zeile |
| `YangN3Teil3.lean` 84, 90, 118; `YangN4Haupt.lean` 352, 358, 485, 891 | 2054, 2064 | Typangabe `→ₗ[K] Matrix (Fin 2) (Fin …` bzw. `(Fin 3) (Fin …` | 12 Token |
| `YangN3Teil2.lean` 237, 338 | 1651 | Typangabe `(Fin 3 → K) →ₗ[K] (Fin …` | 16 Token |
| `CeilBound.lean` 27 | 2191 | `(by norm_num : (0 : ℚ) < 5)` | 12 Token |
| `Basic.lean` (Erstfassung 139 bis 142, `lean-4.19` Brücke 42 bis 45) | 2290 bis 2293 | Beweisgerüst `apply le_antisymm` / `· obtain ⟨alg⟩ := …_attained (…) (…)` / `exact …` | 12 Token roh, 32 normalisiert |
| Erstfassungen und `lean-4.19`: Importzeilen in `Statements`, `CeilBound`, `Upper3x2x6`, `YangN3Teil1`, `YangN3Teil3`, `YangN4Lemma13`, `YangN4Haupt` | 2 bis 23 | einzelne `import Mathlib.…`-Zeilen | je 1 Zeile |

Der letzte Beweisgerüst-Treffer liegt in der Brücke (`tensorRank_three_two_eq`). Er hat die Form von F `rank_eq` (F 2289 bis 2295): Gleichheit zweier Ränge durch `le_antisymm` und je eine Umwandlung in beide Richtungen. Bei uns stehen andere Namen und andere Umwandlungen (`BilinearAlgorithm.ofMatrixAlgorithm`, `alg.toMatrixAlgorithm`, die selbst nur Anonymer-Konstruktor-Einzeiler sind). Das ist der übliche Beweis einer solchen Gleichheit.

### 4.3 Klasse (c): nur gleiche Namen

| unser Name, Datei und Zeile (`main`) | F-Name, Zeile | Vergleich |
|---|---|---|
| `def J` in `YangN3Teil3.lean` 381 und `YangN4Haupt.lean` 371 | `def J`, 1068 | bei uns `LinearMap.range (φ alg 0)`, ein Unterraum von `Fin r → K` (Docstring „`J = f_0(U)`"); in F `LinearMap.range (D.YH hD)`, ein Unterraum von `D.H` |
| `def H` in `YangN3Teil3.lean` 396 | `def H`, 1061 | bei uns eine lineare Abbildung `U → Q²`, `(F_2(x), −F_1(x))`; in F der Kern der Ausgabeabbildung, ein Unterraum |
| `theorem finrank_J` in `YangN3Teil3.lean` 452 und `YangN4Haupt.lean` 511 | `theorem finrank_J`, 1098 | Aussage beide Male „Dimension von `J` ist `m`". Beweis bei uns eine Zeile `rw [J, LinearMap.finrank_range_of_inj (φ0_injective alg h1), Module.finrank_fin_fun]`; in F zwei Zeilen mit `have h := …; exact h.trans finrank_row`. Verfahren 5 meldet keine Gleichheit |

Die Namen `J` und `H` kommen nach den Docstrings beider Seiten aus der Notation der jeweiligen Paper. Die Gegenstücke stehen in F in einem anderen Rahmen (Struktur `Decomposition` mit Koordinatenmodell, F Zeilen 56 bis 60), den unsere Dateien nirgends benutzen.

Weitere Namen der fremden Datei, die bei uns als Bezeichner vorkommen (Verfahren 7), sind einbuchstabige Variablen oder allgemeine Wörter: `Q`, `X`, `Y`, `s`, `t`, `z`, `map`. Von Hand angesehen: andere Bedeutung, kein gemeinsamer Text darum.

### 4.4 Kommentare und Docstrings

Verfahren 6 findet in keinem Stand ein gemeinsames Wort-8-Gramm im Kommentartext. Unsere Docstrings sind eigenständig formuliert.

### 4.5 Unterschiede zwischen den Ständen

- Erstfassungen gegen `lean-4.19`: Die Beweisdateien stimmen in den Treffern überein, nur die Zeilennummern verschieben sich um wenige Zeilen. Neu auf `lean-4.19` ist die Importliste A1. Die Brücke ist aus `Basic.lean` in `BrueckeMM325.lean` gewandert (Kommentar dort: „moved here unchanged from the end of `YangBounds/Basic.lean`"). Verfahren 1 bis 5 geben für die Brücke dieselben Treffer wie für die Erstfassung von `Basic.lean`.
- `lean-4.19` gegen `main`: Die Portierung schreibt `public import` statt `import` und `module` an den Dateianfang. Die Importliste A1 steht unverändert in `main` (Zeilen 10 bis 30). Die Brücke fehlt auf `main`. Die Treffer B3 bleiben, mit verschobenen Zeilen. Auf `main` meldet Verfahren 1 bei den übrigen Dateien keine gleichen Importzeilen mehr, weil sie jetzt `public import` lauten. Inhaltlich sind es dieselben Module.

## 5. Die Brücke: Import, keine Kopie

- **Einbindung:** `lean/lakefile.toml` in `89c2a38` und `71240f8` hat ein `[[require]]` mit `name = "mm325_lower_bound"`, `git = "https://github.com/fallnlove/mm325_proof"`, `rev = "759cf4a8524d4212e7832046204c90b9361ba2bb"`. Der Kommentar dazu: „External dependency, referenced by Git URL at a fixed commit (protocol 11.3: the repository has no license, so nothing from it is copied here)." `lake-manifest.json` in beiden Ständen führt das Paket mit derselben URL und demselben Commit. Auf `main` (`676cdf5`) hat `lakefile.toml` kein `require` auf mm325_proof mehr, nur noch mathlib (`fc4f59e…`, Tag v4.36.0), und das Manifest nennt es nicht.
- **Import:** In der Erstfassung importiert `Basic.lean` (Zeile 5) das Modul `MatrixMultiplicationLowerBound25`. Auf `lean-4.19` importiert nur `BrueckeMM325.lean` (Zeile 2) es. Keine andere der verglichenen Dateien importiert es oder öffnet den Namensraum `MatrixMultiplicationLowerBound`. `grep` auf diesen Namensraum findet in den übrigen Dateien nichts.
- **Benutzte fremde Namen** (alle voll qualifiziert): die Struktur `MatrixAlgorithm`, `matrixTensorRank`, `matrixTensorRank_attained`, `matrixTensorRank_le`, `matrix_algorithm_rank_strict`. Die Brücke definiert damit `BilinearAlgorithm.toMatrixAlgorithm`, `BilinearAlgorithm.ofMatrixAlgorithm`, `tensorRank_three_two_eq` und `tpsr_lower_bound`. Die beiden Umwandlungen sind Einzeiler mit anonymem Konstruktor. `tpsr_lower_bound` reicht nur unsere Daten an `matrix_algorithm_rank_strict` weiter. Der fremde Beweis steckt im importierten Paket und ist nicht in unseren Dateien.
- `AxiomsMM325.lean` (`lean-4.19`) ruft nur `#print axioms` für `tensorRank_three_two_eq` und `tpsr_lower_bound` auf.
- Der Name `toMatrixAlgorithm` kommt auch in F vor (`Decomposition.toMatrixAlgorithm`, F 2237), dort für einen anderen Ausgangstyp und mit anderem Rumpf. Unser `BilinearAlgorithm.toMatrixAlgorithm` hat dasselbe Ziel `MatrixAlgorithm` und folgt Mathlibs Namensregel `to<Ziel>`.

## 6. Nennen Kommentare die Herkunft?

Ja, an jeder Stelle mit Bezug zum fremden Paket:

- `Basic.lean`, Erstfassung `89c2a38` Zeilen 24 bis 27: „… coincides field by field with `MatrixMultiplicationLowerBound.MatrixAlgorithm` from the external dependency `fallnlove/mm325_proof` (commit `759cf4a`), which is imported, not copied (protocol section 11.3)."
- `BrueckeMM325.lean` (`lean-4.19`) Zeilen 5 bis 17: derselbe Satz und „This is the only file of the project that imports the dependency."
- `tpsr_lower_bound` (Erstfassung Zeilen 146 bis 148, Brücke Zeilen 49 bis 51) nennt Tsyganov, Parkina, Samsonov, Rakhuba (arXiv:2609.22054) und sagt: „The proof is the one of the dependency (`matrix_algorithm_rank_strict`)."
- Importliste A1: Kommentar wie in 4.1 zitiert.
- `lakefile.toml`: Kommentar wie in Abschnitt 5 zitiert.
- `Basic.lean` auf `main` Zeilen 51 bis 54 sagt, die Brücke sei mit Auftrag S5-03 entfernt worden und bleibe „reachable via the tag `lean-4.19`". Nebenbeobachtung: Verglichen habe ich den Zweig `lean-4.19`. Ob es auch einen Tag dieses Namens gibt, habe ich nicht nachgesehen.

Die übrigen zehn Dateien (Statements, YangBounds, Axioms, YangN3Teil1 bis 3, Upper3x2x6, CeilBound, YangN3, YangN4Lemma13, YangN4Haupt) nennen das fremde Paket nicht. Nach dem Vergleich enthalten sie auch keinen Text daraus außer den in 4.2 und 4.3 genannten Zeilen.

## 7. Grenzen

- Verglichen wurde nur mit `MatrixMultiplicationLowerBound25.lean` als Quelltext. `Audit.lean` (25 Zeilen, nur `#check` und `#print axioms`) und die Lake-Dateien habe ich von Hand angesehen. Unser `lakefile.toml` gleicht dem fremden nur in der mathlib-Zeile mit derselben Revision (`c44e0c8…`), die das fremde Paket vorgibt.
- Zwischenfassungen zwischen den Erst-Commits und den beiden Endständen lagen nicht auf der Positivliste und wurden nicht verglichen.
- Eine Übernahme nur der Beweisidee ohne gemeinsamen Text erkennt ein Textvergleich nicht. Die Mathematik beider Arbeiten ist verwandt (Rang von ⟨3, 2, m⟩, Dimensionszählung über Unterräume und Quotienten). Strukturelle Ähnlichkeiten dieser Art, etwa „dim Q + 4m = R" in `YangN3Teil3.lean` `finrank_Kbar` (`main` Zeile 457) und F `finrank_Q_add` (Zeile 1104), sind mit anderem Beweistext geschrieben: bei uns über `finrank_map_mkQ_add` und `ker W`, in F über `finrank_quotient_add_finrank` und `finrank_H_add`.
- Schwellen: Verfahren 2 ab 12, Verfahren 3 ab 30 Token. Kürzere gemeinsame Läufe habe ich nicht einzeln angesehen. Der Selbsttest zeigt, dass eine umbenannte Abschrift von 21 Zeilen weit über der Schwelle liegt.

## 8. Wiederholung

```
git clone https://github.com/fallnlove/mm325_proof.git mm325
git -C mm325 checkout 759cf4a8524d4212e7832046204c90b9361ba2bb
# Dateien unserer drei Stände per `git show <commit>:<pfad>` in ours/first, ours/l419, ours/main ablegen
python3 -I vergleich.py mm325/MatrixMultiplicationLowerBound25.lean ours/first ours/l419 ours/main
python3 -I namen.py     mm325/MatrixMultiplicationLowerBound25.lean ours/first ours/l419 ours/main
python3 -I kommentare.py mm325/MatrixMultiplicationLowerBound25.lean ours/first ours/l419 ours/main
```

Laufzeit jeweils unter 10 Sekunden.

## Anhang A: `vergleich.py`

```python
#!/usr/bin/env python3
"""Compare Lean files of our project with a foreign Lean file.

Usage: python3 -I vergleich.py FOREIGN.lean DIR [DIR ...]

Methods
  1. common runs of normalised lines (whitespace collapsed), ignoring lines
     shorter than MINLINE characters; reports runs >= 1 long line
  2. token n-grams, raw tokens (identifiers kept), comments removed
  3. token n-grams with identifiers and numerals replaced by placeholders
  4. names of declarations (def/theorem/lemma/structure/abbrev/...) in both
  5. per-declaration bodies: identical bodies after identifier normalisation
"""
import re, sys, os, collections

MINLINE = 25
NRAW = 12
NNORM = 30

KEYWORDS = set("""
theorem lemma def structure abbrev instance class noncomputable private protected
where by fun let have show from exact intro intros rintro obtain refine apply
rw rwa simp simp_all simpa only at with match if then else do return
calc constructor cases rcases induction ext funext congr use exists
omega linarith nlinarith ring ring_nf field_simp norm_num decide positivity
exact_mod_cast push_cast norm_cast assumption contradiction exfalso
by_contra by_cases push_neg trivial rfl change conv conv_lhs conv_rhs
classical namespace end section variable open scoped universe import
set_option attribute local using generalizing fin_cases interval_cases
specialize subst unfold dsimp convert gcongr aesop tauto split_ifs
left right absurd mod_cast at this Type Sort Prop forall
""".split())

tok_re = re.compile(r"""
   (?P<id>[A-Za-z_À-ɏͰ-Ͽᴀ-ᶿ℀-⅏][A-Za-z0-9_'!?.À-ɏͰ-Ͽ₀-ₜᴀ-ᶿ℀-⅏]*)
 | (?P<num>\d+)
 | (?P<ws>\s+)
 | (?P<op>.)
""", re.X)

def strip_comments(s):
    out, i, depth = [], 0, 0
    n = len(s)
    while i < n:
        if s.startswith('/-', i):
            depth += 1; i += 2; continue
        if depth and s.startswith('-/', i):
            depth -= 1; i += 2; continue
        if depth:
            if s[i] == '\n': out.append('\n')
            i += 1; continue
        if s.startswith('--', i):
            j = s.find('\n', i)
            i = n if j < 0 else j
            continue
        out.append(s[i]); i += 1
    return ''.join(out)

def tokens(text, normalise):
    """List of (token, line) for comment-free text."""
    res = []
    for ln, line in enumerate(text.split('\n'), 1):
        for m in tok_re.finditer(line):
            k = m.lastgroup
            if k == 'ws': continue
            t = m.group()
            if normalise:
                if k == 'id' and t not in KEYWORDS: t = 'ID'
                elif k == 'num': t = 'N'
            res.append((t, ln))
    return res

def norm_line(l):
    return ' '.join(l.split())

def line_runs(fa, la, fb, lb):
    """Maximal runs of equal long normalised lines (comments removed)."""
    A = [norm_line(x) for x in la]; B = [norm_line(x) for x in lb]
    idx = collections.defaultdict(list)
    for j, x in enumerate(B):
        if len(x) >= MINLINE: idx[x].append(j)
    runs = []
    seen = set()
    for i, x in enumerate(A):
        if len(x) < MINLINE: continue
        for j in idx.get(x, []):
            if (i, j) in seen: continue
            k = 0; longk = 0
            while i+k < len(A) and j+k < len(B) and A[i+k] == B[j+k]:
                seen.add((i+k, j+k))
                if len(A[i+k]) >= MINLINE: longk += 1
                k += 1
            runs.append((longk, k, i+1, j+1, x))
    return runs

def ngram_matches(ta, tb, n):
    """Maximal common token runs of length >= n. Returns (len, lineA0, lineA1, lineB0, lineB1)."""
    if len(ta) < n or len(tb) < n: return []
    sa = [t for t, _ in ta]; sb = [t for t, _ in tb]
    idx = collections.defaultdict(list)
    for j in range(len(sb)-n+1):
        idx[tuple(sb[j:j+n])].append(j)
    out, covered = [], set()
    for i in range(len(sa)-n+1):
        for j in idx.get(tuple(sa[i:i+n]), []):
            if (i, j) in covered: continue
            if i > 0 and j > 0 and sa[i-1] == sb[j-1]: continue
            k = 0
            while i+k < len(sa) and j+k < len(sb) and sa[i+k] == sb[j+k]:
                covered.add((i+k, j+k)); k += 1
            out.append((k, ta[i][1], ta[i+k-1][1], tb[j][1], tb[j+k-1][1], ' '.join(sa[i:i+min(k,40)])))
    out.sort(reverse=True)
    return out

decl_re = re.compile(r'^\s*(?:@\[[^\]]*\]\s*)?(?:noncomputable\s+|private\s+|protected\s+)*(theorem|lemma|def|structure|abbrev|instance|class|inductive)\s+([^\s:({\[]+)', re.M)

def decls(text):
    return [(m.group(2), m.group(1), text[:m.start()].count('\n')+1) for m in decl_re.finditer(text)]

def decl_bodies(text):
    """Split comment-free text at declarations; body = normalised tokens."""
    ms = list(decl_re.finditer(text))
    res = {}
    for k, m in enumerate(ms):
        end = ms[k+1].start() if k+1 < len(ms) else len(text)
        body = text[m.start():end]
        nt = tuple(t for t, _ in tokens(body, True))
        res[m.group(2)] = (nt, text[:m.start()].count('\n')+1)
    return res

def main():
    foreign = sys.argv[1]
    ftext = open(foreign, encoding='utf-8').read()
    fclean = strip_comments(ftext)
    fl = fclean.split('\n')
    fraw = tokens(fclean, False); fnorm = tokens(fclean, True)
    fdecl = decls(ftext); fnames = {d[0].split('.')[-1]: d for d in fdecl}
    ffull = {d[0]: d for d in fdecl}
    fbodies = decl_bodies(fclean)
    print(f'# foreign: {foreign}: {len(ftext.splitlines())} lines, {len(fraw)} tokens, {len(fdecl)} declarations')
    for d in sys.argv[2:]:
        print(f'\n######## directory {d}')
        for name in sorted(os.listdir(d)):
            p = os.path.join(d, name)
            if not name.endswith('.lean'): continue
            text = open(p, encoding='utf-8').read()
            clean = strip_comments(text)
            ta = tokens(clean, False); tn = tokens(clean, True)
            print(f'\n=== {name}: {len(text.splitlines())} lines, {len(ta)} tokens')
            runs = line_runs(name, clean.split('\n'), foreign, fl)
            runs = [r for r in runs if r[0] >= 1]
            runs.sort(reverse=True)
            print(f'  [1] equal long lines (>= {MINLINE} chars, ws-normalised): {sum(1 for r in runs)} runs; longest:')
            for r in runs[:8]:
                print(f'      {r[0]} long / {r[1]} total lines  ours L{r[2]}  foreign L{r[3]}  | {r[4][:90]}')
            for n, tk, lab in ((NRAW, ta, 'raw'), (NNORM, tn, 'normalised')):
                ms = ngram_matches(tk, fraw if lab == 'raw' else fnorm, n)
                cov = set()
                for k, a0, a1, b0, b1, s in ms:
                    cov.update(range(a0, a1+1))
                print(f'  [{2 if lab=="raw" else 3}] token runs >= {n} ({lab}): {len(ms)} maximal runs, lines of ours touched: {len(cov)}; longest:')
                for k, a0, a1, b0, b1, s in ms[:6]:
                    print(f'      {k} tok  ours L{a0}-{a1}  foreign L{b0}-{b1} | {s[:110]}')
            od = decls(text)
            common = [(o, fnames[o[0].split('.')[-1]]) for o in od if o[0].split('.')[-1] in fnames]
            print(f'  [4] declarations: {len(od)}; same final name as a foreign declaration: {len(common)}')
            for o, f in common:
                print(f'      ours {o[1]} {o[0]} (L{o[2]})  ~ foreign {f[1]} {f[0]} (L{f[2]})')
            ob = decl_bodies(clean)
            same = []
            for on, (otoks, oline) in ob.items():
                for fn, (ftoks, fline) in fbodies.items():
                    if len(otoks) >= 15 and otoks[1:] == ftoks[1:]:
                        same.append((on, oline, fn, fline, len(otoks)))
            print(f'  [5] declarations with identical normalised text (>= 15 tokens): {len(same)}')
            for s in same:
                print(f'      ours {s[0]} L{s[1]} == foreign {s[2]} L{s[3]} ({s[4]} tok)')

if __name__ == '__main__':
    main()
```

## Anhang B: `namen.py`

```python
import re,sys,os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from vergleich import decls, strip_comments
f=open(sys.argv[1],encoding='utf-8').read()
fn={d[0].split('.')[-1] for d in decls(f)}
for d in sys.argv[2:]:
  hits={}
  for n in sorted(os.listdir(d)):
    if not n.endswith('.lean'): continue
    t=strip_comments(open(os.path.join(d,n),encoding='utf-8').read())
    ids=set(re.findall(r"[A-Za-z_Ͱ-Ͽ][A-Za-z0-9_'Ͱ-Ͽ₀-₉]*",t))
    parts=set()
    for i in ids: parts.update(i.split('.'))
    for x in sorted(fn & parts): hits.setdefault(x,[]).append(n)
  print('##',d)
  for k,v in sorted(hits.items()): print(' ',k,':',', '.join(v))
```

## Anhang C: `kommentare.py`

```python
"""Word 8-grams over comment/docstring text only (ours vs foreign)."""
import re,sys,os
def comments(s):
    out=[]
    for m in re.finditer(r'/-.*?-/|--[^\n]*', s, re.S): out.append(m.group())
    return ' '.join(out)
def words(s): return re.findall(r"[A-Za-z0-9_']+", s.lower())
N=8
f=words(comments(open(sys.argv[1],encoding='utf-8').read()))
fg={tuple(f[i:i+N]) for i in range(len(f)-N+1)}
for d in sys.argv[2:]:
  for n in sorted(os.listdir(d)):
    if not n.endswith('.lean'): continue
    w=words(comments(open(os.path.join(d,n),encoding='utf-8').read()))
    hits=[' '.join(w[i:i+N]) for i in range(len(w)-N+1) if tuple(w[i:i+N]) in fg]
    print(d,n,len(hits),hits[:5])
```
