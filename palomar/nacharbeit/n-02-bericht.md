# N-02: Prüfung von README.md, lean/README.md und ergebnisse/rang-444.md gegen das Repo

- Rolle: Prüfer (Nacharbeit außerhalb der Runden)
- Geprüfter Stand: `main` bei `5d813c73f357616d4ce39890eceaa25e2aca96d6`, die drei Dateien `README.md`, `lean/README.md`, `ergebnisse/rang-444.md` in dieser Fassung
- Zeilenangaben beziehen sich auf diese Fassung
- Dieser Bericht setzt kein Statuswort. Er sagt nur, welche Angaben mit dem Repo übereinstimmen und welche nicht

## 0. Eingeblendetes Projektgedächtnis und andere Spuren

Eingeblendet war der Index `MEMORY.md` des Projektgedächtnisses (Projekt, Regeln des Orchestrators, Fremdmodell, Domains, Zweig `lean-4.19` „wird nie verändert“, Verweise auf `verfahren-datenformat` und `lean-project-ci` ohne deren Inhalt). Dazu drei Einzeleinträge: `aussagen-abgleich-n3` (Bridge-Hinweis, lokaler Lean-Bau über das GitHub-Release), `git-regeln` (Regeln für Commits und Pull Requests seit Protokoll 0.2) und `gemini-bridge` (Bridge-Freigaben, Zeitlimit). Keiner dieser Einträge enthält ein Prüfurteil oder einen Status. Keiner beschreibt Lean 4.19 oder das Paket mm325 als aktuellen Stand. Ich habe nichts ins Gedächtnis geschrieben.

Weitere Spuren, die ich offenlege:

- Der Auftrag enthielt die Nachricht von Justus, dass er „Rang von 4×2×4 gleich 26“ (B-034) als Ergebnis freigibt. Damit kannte ich den Zweck der Texte.
- `behauptungen/B-034.md` (Positivliste) enthält das Wort „bewiesen“. `palomar/BELEGE.md` Abschnitt 8 gibt den Inhalt von `review.notes` wieder („Aussagen-Abgleich … erledigt“).
- Ein `git grep` nach `import MatrixMultiplicationLowerBound` über die Commits `62c3dc6` und `71240f8` hat ungewollt einzelne Zeilen aus `lean/prosa/auflage7_entkopplung_s4-26.md`, `lean/prosa/a7_textaenderung.md` und `lean/prosa/a7_zweitlauf_bericht.md` angezeigt (Beschreibungen der Importzeilen, kein Urteil). Ich habe diese Dateien danach nicht geöffnet und stütze keinen Befund auf sie.
- Gesperrte Dateien (`STATUS.md`, `LOG.md`, `pruefvermerke/`, `archiv/`, `lean/prosa/`, `palomar/nacharbeit/`, auch `versuche/`) habe ich nicht gelesen. Bei Dateien, die die Texte dort nennen, habe ich nur geprüft, ob es sie gibt (`git ls-tree`).

## 1. Ergebnis in Kürze

Fünf Angaben stimmen nicht oder sind ungenau (Abschnitt 2). Hinzu kommen fünf Hinweise ohne sachlichen Fehler (Abschnitt 3). Zwölf Angaben lassen sich mit meiner Positivliste nicht entscheiden (Abschnitt 4). Alles andere stimmt mit dem Repo und den Job-Logs überein (Abschnitt 5). Das gilt für Satzname und Wortlaut, Versionen, alle Dateipfade, Commits, Läufe, Jobs und Zahlen. Die Anleitung zum Nachprüfen in `lean/README.md` lief lokal durch (Abschnitt 6). Die Vorgaben aus Punkt 1 der Anweisung sind eingehalten (Abschnitt 7).

## 2. Befunde

### F1: `README.md` Z. 16, obere Schranke für ⟨4,2,5⟩

- Wortlaut: `| ⟨4,2,5⟩ | 31 | 32 | open |`. Dazu Z. 5: „over arbitrary fields“.
- Was stimmt: Nach `lit/QUELLEN.md` Z. 39 und Z. 43 gilt die obere Schranke 32 nur über Körpern der Charakteristik ≠ 2. Das Verfahren aus AE25 hat Koeffizienten in ½ℤ. Über Körpern der Charakteristik 2 ist die beste bekannte obere Schranke 33 (HK71). Z. 43 dort: „Die Zeile 4×2×5 sollte lauten: untere Schranke 31 (alle Körper); obere Schranke 32 für Charakteristik ≠ 2 (AE25), 33 für Charakteristik 2 (HK71).“ Dasselbe sagen `lit/WACHE.md` Z. 88 und Z. 482 und `lit/WACHE-2026-11-26-S5.md` Z. 106 (Zenodo 24561737).
- Zur Einordnung: Z. 60 sagt, dass die übrigen Zeilen aus der Literatur stammen und noch nicht alle nachgeprüft sind. Die Zahl 32 steht trotzdem ohne Einschränkung des Körpers in einer Tabelle, die nach Z. 5 für beliebige Körper gilt.

### F2: `README.md` Z. 99, Titel der Arbeit von Wang

- Wortlaut: „C. Wang, *Automated Lower Bounds for Tensor Rank over Finite Fields*, arXiv:2603.07280“.
- Was stimmt: Die aktuelle Fassung heißt „Automated Lower Bounds for Bilinear Complexity over Finite Fields“. Belege: `lit/WACHE.md` Z. 34 und die Abstract-Seite `export.arxiv.org/abs/2603.07280`, die ich am 26.11.2026 abgerufen habe. Der alte Titel steht noch in `lit/QUELLEN.md` Z. 18.

### F3: `ergebnisse/rang-444.md` Z. 37, „the three theorems above“

- Wortlaut: „`#print axioms` for the three theorems above: only `propext`, `Classical.choice`, `Quot.sound`“.
- Was stimmt: Die Zeile darüber (Z. 36) nennt vier Sätze. Der Zweitlauf (Job 140079342228) gibt `#print axioms` für drei davon aus: `YangBounds.Transponiert444.rank_four_two_four_ge_26`, `YangBounds.Gleich444.rank_four_two_four_eq_26` und `MatMulRank.rank_four_two_four_eq_26`. `YangBounds.Upper4x2x4.rank_four_two_four_le_26` fehlt dort. Der Text sagt nicht, welche drei gemeint sind. Er sollte sie nennen. Im Lauf `lean-project.yml` (Job 140079318183) stehen alle vier nur mit den Standard-Axiomen.

### F4: `lean/README.md` Z. 101–103, erwartete Ausgabe

- Wortlaut: „The expected result: "Build completed successfully", one warning `MatMulRank/Challenge.lean:94:8: declaration uses 'sorry'` (the intended hole of the Challenge), "SORRY: 0" twice, …“
- Was stimmt: Genau eine Warnung betrifft `sorry`, die angegebene. Der Bau gibt aber 124 Warnungen aus, im Job 140079318183 und in meinem lokalen Lauf gleich viele. Die übrigen sind Linter- und Veraltungswarnungen, etwa „This simp argument is unused“ oder „`push_neg` has been deprecated“. „one warning“ lässt sich als „nur eine Warnung“ lesen. Besser wäre „one `sorry` warning“.

### F5: `lean/README.md` Z. 92–101, „These are the steps of the workflow“

- Wortlaut: Befehlsblock aus fünf Schritten, danach „These are the steps of the workflow `.github/workflows/lean-project.yml`“.
- Was stimmt: Der Workflow hat zwei Schritte mehr. Der Schritt „Shared definitions of Challenge and Solution are identical (S5-08)“ (Z. 86–94 des Workflows) steht im Block nicht. Er wird erst unter „Palomar entry“ erwähnt. Auch der Schritt `lean_report.py axiom-report` (Z. 112–113 des Workflows) fehlt, obwohl der Text danach dessen Ergebnis erwartet („for every main theorem only the axioms …“). Ohne `axiom-report` sieht man nur die Rohausgabe von `#print axioms`. Die angegebenen Befehle stimmen und laufen (Abschnitt 6), die Liste ist nur unvollständig.

## 3. Hinweise ohne sachlichen Fehler

- **H1, `ergebnisse/rang-444.md` Z. 57:** „The only proof change against the first parent `ce94c42` is one proof step in `lean/YangBounds/SatzB444.lean` (statements and definitions unchanged)“. Das stimmt für die Beweise der Kette: `git diff ce94c42 62c3dc6 -- lean/YangBounds/SatzB444.lean` zeigt eine geänderte Zeile. Außerdem hat `62c3dc6` in `Basic.lean` den Import `MatrixMultiplicationLowerBound25` durch 21 Mathlib-Importe ersetzt. Die drei Deklarationen zum Paket (`toMatrixAlgorithm`, `ofMatrixAlgorithm` und `tensorRank_three_two_eq`, dazu `tpsr_lower_bound`) sind unverändert in die neue Datei `BrueckeMM325.lean` gewandert, und `AxiomsMM325.lean` ist neu. Das ist keine Beweisänderung, könnte aber genannt werden.
- **H2, `ergebnisse/rang-444.md` Z. 101:** „unchanged at the repository's head `5ed2ee9…` (checked 25 November 2026)“. Als datierte Angabe stimmt das. Der Kopf von solven-eu/matmulcatalog ist inzwischen `409563ec…` (`lit/WACHE-2026-11-26-S5.md` Z. 68). Ich habe `docs/LOWER_BOUNDS.md` Z. 90 und `paper/theory/RANK_KNOWLEDGE.md` Z. 297 bei `409563ec` über raw.githubusercontent.com nachgelesen: wörtlich gleich wie bei `5ed2ee9`.
- **H3, `lean/README.md` Z. 114:** „This workflow starts on `main` only by `workflow_dispatch`“. Für Pushes auf `main` stimmt das, denn `push` gilt nur für `portierung`. Zusätzlich startet der Workflow bei Pull Requests, die `.github/workflows/zweitlauf.yml` ändern (Z. 31–33 des Workflows).
- **H4, `ergebnisse/rang-444.md` Z. 77:** „at least 13 in the prose; the Lean chain uses 11“. Lean beweist auch 13: `LemmaZ444.lemmaZ_generisch_unbedingt` (Z. 884) und `lemmaZ_bruecke` (Z. 791). Die Kette verwendet die abgeschwächte Fassung mit 11 (`lemmaZ_bruecke_11`, Z. 809; `Transponiert444` Z. 620 und 628). Die Angabe stimmt, kann aber so gelesen werden, als gebe es 13 nur in der Prosa.
- **H5, `ergebnisse/rang-444.md` Z. 56:** „built `main` at `667df45…`“. Lauf 45706606136 lief auf dem Zweig `claude/project-thread-yeetox` (Kopf `d20aa11`) und hat ausdrücklich `667df45` ausgecheckt. Das zeigt die Log-Zeile „CHECKED COMMIT: 667df45edbfdfb72eb9e1e88a492d36e6553d09c“. `667df45` liegt auf der First-Parent-Linie von `main`. Die Angabe stimmt also.

## 4. Mit meiner Positivliste nicht entscheidbar

| Datei, Zeile | Wortlaut (Auszug) | Fehlt mir |
| --- | --- | --- |
| `README.md` Z. 7 | „Stage 5 has ended“ | `STATUS.md`, `LOG.md` |
| `README.md` Z. 13 | „Lean formalization of Yang's bound in this repository (status geprüft)“ | `pruefvermerke/` |
| `README.md` Z. 14 | „Lean theorem `MatMulRank.rank_four_two_four_eq_26` (status geprüft)“ | `pruefvermerke/` |
| `README.md` Z. 36 | „compared … by one reviewing model instance and, independently, by … GPT 6.2 Sol. Both found that it matches; their reservations are recorded in `pruefvermerke/B-034.md`“ | `pruefvermerke/B-034.md`, `versuche/s5-r5-sol-b034/` |
| `README.md` Z. 77 | „Task sessions that reported their model reported `claude-opus-5-5` (`LOG.md`)“ | `LOG.md` |
| `lean/README.md` Z. 24 | „the status of every statement is recorded in `pruefvermerke/README.md`“ | `pruefvermerke/README.md` (nur das Vorhandensein geprüft) |
| `lean/README.md` Z. 146–148 | Portierungsberichte `prosa/s5_portierung_s5-03.md`, `prosa/s5_portierung_s5-17.md` als Belege für geänderten Wortlaut | `lean/prosa/` (vorhanden; `palomar/BELEGE.md` Abschnitt 1.3 stimmt) |
| `ergebnisse/rang-444.md` Z. 3 | „Both approved as results of this repository by the repository owner“ | Erste Freigabe vom 25.11.: `LOG.md`. Die zweite Freigabe (26.11.) stand im Auftrag in der Nachricht von Justus |
| `ergebnisse/rang-444.md` Z. 38 | Aussagen-Abgleich zu „= 26“ mit den aufgezählten Vorbehalten | `pruefvermerke/B-034.md`, `lean/prosa/s5_abgleich_s5-20.md`, `versuche/s5-r5-sol-b034/gpt_antwort.md` |
| `ergebnisse/rang-444.md` Z. 55 | Aussagen-Abgleich der unteren Schranke (Claude und GPT 6.2 Sol) | `pruefvermerke/B-016.md` |
| `ergebnisse/rang-444.md` Z. 59 | „Second environment … commit `64554f9…`: `lake build` exit 0 …“ (vom Text selbst als nicht belegt markiert) | Kein Log im Repo; `64554f9` liegt auf `main` |
| `ergebnisse/rang-444.md` Z. 79, Z. 87–93, Z. 119 | Prosa-Dateien als Ursprung der Schritte 2–6; Teile mit Status „behauptet“; Modellangaben aus `LOG.md` | `lean/prosa/`, `pruefvermerke/`, `LOG.md` |

## 5. Was stimmt (mit Beleg)

**Satz und Definitionen**
- `lean/MatMulRank/Challenge.lean` Z. 94: `theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26 := by sorry` im Namensraum `MatMulRank`. Die Datei importiert nur Mathlib (Z. 3–6). `tensorRank` ist `sInf {r | Nonempty (BilinearAlgorithm K n l m r)}`.
- `Solution.lean` Z. 89 enthält den Beweis, Z. 63 `tensorRank_eq_yangBounds` und Z. 82 `rank_four_two_four_ge_26`.
- Zeilennummern: `Gleich444.lean` Z. 27, `Transponiert444.lean` Z. 660, `Upper4x2x4.lean` Z. 189. `YangBounds.tensorRank` ist über `Nat.find` definiert (`Basic.lean` Z. 127–129).
- Der Definitionsblock zwischen `BEGIN/END SHARED DEFINITIONS` ist in `Challenge.lean` und `Definitions.lean` zeichengleich, die Kopfzeilen sind gleich. Geprüft mit denselben `sed`-Befehlen wie im Workflow.
- `comparator.json`: Challenge `MatMulRank.Challenge`, Solution `MatMulRank.Solution`, Satz `MatMulRank.rank_four_two_four_eq_26`, Axiome `propext`, `Quot.sound`, `Classical.choice`.
- Die Tabelle „Main statements“ in `lean/README.md` Z. 76–85 stimmt Satz für Satz mit `Statements.lean` Z. 41, 49, 60, 88, 92 und 97 überein, ebenso mit den drei Dateien der Gleichheit.

**Versionen**
- `lean/lean-toolchain`: `leanprover/lean4:v4.36.0`. `lakefile.toml` und `lake-manifest.json`: Mathlib `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`, keine weitere direkte Abhängigkeit. Standardziele `YangBounds` und `MatMulRank`, Globs `YangBounds.+` und `MatMulRank.+`.
- `git ls-remote`: Mathlib `refs/tags/v4.36.0` = `fc4f59e…`, Lean `refs/tags/v4.36.0` = `611c117bfaf7b7ae1cfcf246ce6fba31e8f509e9`.

**Verfahren**
- `verfahren/4x2x4-r26-s001.json`: 26 Produkte, Ring `Z`, Koeffizienten nur −1, 0, 1. Ich habe beide Prüfprogramme laufen lassen. `python3 pruefer/python/pruefer.py …` und `pruefer/rust` (`cargo build --release`) geben beide `ANGENOMMEN 4x2x4-r26-s001 4x2x4 rank=26 ring=Z` aus, Rückgabewert 0.
- `Upper4x2x4.lean` verweist auf diese Datei und nutzt `decide +kernel` (Z. 138).
- Die Formel ⌈(3nm + max(n,m))/2⌉ ergibt für n = m = 4 den Wert 26. Yang Satz 2 ergibt für n = m = 4 den Wert 25 und für (4,5) den Wert 31. Yang Satz 1 ergibt für m = 7 den Wert 34.

**Lauf `lean-project.yml`, Lauf 45869038515, Job 140079318183**
- Commit `676cdf5…`, Zweig `main`, success, 17:35:37–17:38:21 UTC.
- Log: „shared definitions and imports identical“, „Build completed successfully (4271 jobs).“, „SORRY: 0“ zweimal, „INTENDED: 1 … (MatMulRank/Challenge.lean)“ mit Z. 94 und 95, „TOTAL: STANDARD=65“.
- Die vier genannten Sätze hängen nur von `propext`, `Classical.choice` und `Quot.sound` ab.
- Gebaut wurden 32 Projektmodule, das Wurzelmodul `YangBounds` ist nicht darunter.

**Lauf `zweitlauf.yml`, Lauf 45869043624, Job 140079342228**
- Commit `676cdf5…`, success, 17:35:40–17:46:35 UTC.
- Log: „CHECKED COMMIT: 676cdf5…“, „olean/ilean/trace files in fresh checkout: 0“.
- `leanchecker` stammt aus der Toolchain v4.36.0: „L4C-SUMMARY|checked=32|ok=32|failed=0“, „L4C-FRESH|YangBounds.Transponiert444|exit=0“.

**Frühere Läufe (Lean 4.19.0)**
- Lauf 45699204903, Job 139504538345: `c3c3884…`, success. Lean 4.19.0 commit `6caaee842e94`, Lake 5.0.0-6caaee8, Mathlib `c44e0c8…`. „SORRY: 0“ zweimal, Transponiert444 nur mit Standard-Axiomen.
- Lauf 45706606136, Job 139530090202: geprüft wurde `667df45…`. lean4checker Tag v4.19.0, Commit `e11f65c…`, 27 von 27 Modulen in Ordnung. 0 Zeilen mit `sorry` und 0 mit `error`, `--fresh` mit exit 0.
- Lauf 45708303302, Job 139535849738 auf `ad10846…`. Die Aussage mit `LE.le` lautet wörtlich wie in Z. 58, nur Standard-Axiome.
- Lauf 45833618872, Job 139956567190: geprüft wurde `62c3dc6…`. 29 von 29 Modulen in Ordnung, 0 `sorry`, `--fresh` mit exit 0.

**Commits und Zweige**
- Alle genannten Commits liegen in der Geschichte von `5d813c7`: `676cdf5`, `6d44bb1`, `62c3dc6`, `ce94c42`, `c3c3884`, `667df45`, `ad10846`, `64554f9`, `71240f8`.
- `ce94c42:lean/YangBounds/Basic.lean` importiert `MatrixMultiplicationLowerBound25`. Bei `62c3dc6` importiert nur noch `YangBounds/BrueckeMM325.lean` das Paket. Bei `5d813c7` gibt es keinen Import mehr und kein mm325 im Manifest.
- Zwischen `676cdf5` und `f153c86` hat sich keine `.lean`-Datei, keine Lake-Datei, kein Workflow und keine Datei des Palomar-Eintrags geändert (`git diff --stat 676cdf5 5d813c7`).
- Zwischen `6d44bb1` und `676cdf5` hat sich außerhalb von `lean/prosa` nur `lean/formalization.yaml` geändert (dazu `palomar/`), Lean-Dateien und `comparator.json` nicht.
- Commit-Trailer bis `676cdf5`: 417 „Claude Opus 5.5“, 8 „Claude Fable 5.2“, 6 „Claude“.

**Vorgeschichte, Zweig `lean-4.19`**
- `git ls-remote`: `refs/heads/lean-4.19` = `71240f81988ae10323af035c3273a45b5038ac3a`.
- Dort: `lean-toolchain` v4.19.0, Mathlib `c44e0c8…`, `require mm325_lower_bound` von `fallnlove/mm325_proof` bei `759cf4a…`. Den Import hat nur die Brücke `BrueckeMM325.lean`.
- `lit/LIZENZEN.md` Z. 7: keine Lizenz angegeben.

**Palomar-Dateien**
- Alle sieben Dateien der Tabelle in `README.md` gibt es.
- `palomar/BELEGE.md`:
  - Abschnitt 1.3 hat die Tabelle des geänderten Wortlauts.
  - Abschnitt 1.4 enthält den lokalen Lauf mit der Challenge-Warnung (Z. 94/95) und 65 Hauptsätzen mit Standard-Axiomen.
  - Abschnitt 1.7 bezieht sich auf `6d44bb1`: „Your solution is okay!“ in Lauf A und Lauf B (aus Exporten), con-ron „accepted 27008 declarations (--verified)“. Die Gegenprobe ergibt „Illegal axiom detected: 'Classical.choice'“, dazu der Absatz „Was diese Läufe nicht zeigen“.
  - Abschnitte 2 und 8 enthalten Palomars Prüffunktionen. Abschnitt 8 lief auf `4e2c720`.
- Nirgends in den drei Dateien steht, dass etwas bei Palomar eingereicht oder angenommen ist.

**Literatur**
- Titel und Fassungen von Yang (v3), Tsyganov u. a. (v1) und Lacelle (v3) stimmen mit `lit/QUELLEN.md` und den arXiv-Abstract-Seiten überein.
- Die Angaben zu solven-eu/matmulcatalog (Z. 90, Commit `0a9f83a`, `RANK_KNOWLEDGE.md` Z. 297, kein Eintrag in `lower-bounds.json`) stimmen mit `lit/WACHE-WIEDERHOLUNG-2026-11-25.md` Z. 103–110 überein.

**Links**
- `README.md`: `ergebnisse/rang-444.md`, `STATUS.md`, `lean/README.md`, `PROTOKOLL.md`, `LICENSE` und der Zweig-Link `…/tree/lean-4.19`. Alle Ziele gibt es.
- `lean/README.md`: `../ergebnisse/rang-444.md` stimmt.

## 6. Anleitung zum Nachprüfen, lokal ausgeführt

Umgebung: elan v4.2.3 und `lean-4.36.0-linux.zip` aus den GitHub-Releases, eingebunden mit `elan toolchain link`. `lean --version` meldet Lean 4.36.0, Commit `611c117…`. Ausgeführt im Worktree von `5d813c7`, in `lean/`, genau die Befehle aus `lean/README.md` Z. 92–99:

| Schritt | Zeit (UTC) | Ergebnis |
| --- | --- | --- |
| `lake exe cache get` | 19:01:36–19:02:50 | 9117 Dateien von cache.mathlib.org; Manifest, Lakefile und Toolchain unverändert (`git status` danach: nur neue, nicht verfolgte Dateien) |
| `lake build 2>&1 \| tee build.log` | bis 19:04:10 | „Build completed successfully (4271 jobs).“, eine Warnung `declaration uses 'sorry'` (Challenge), insgesamt 124 Warnungen |
| `lean_report.py sorry-report . build.log` | | „SORRY: 0“ zweimal, „INTENDED: 1 …“ mit `Challenge.lean:94` und `:95` |
| `lean_report.py gen-check . MainAxioms.lean` | | Datei erzeugt (der Befehl gibt sie auch aus) |
| `lake env lean MainAxioms.lean` | bis 19:04:14 | exit 0, 65 Zeilen `AXIOM-RESULT`, alle `propext, Classical.choice, Quot.sound`; zusätzlich `axiom-report`: „TOTAL: STANDARD=65“ |

Keine Domain war gesperrt. Benutzt habe ich github.com (Releases, `git ls-remote`, Actions-API), cache.mathlib.org, raw.githubusercontent.com und export.arxiv.org. Den Comparator und die Prüffunktionen von Palomar habe ich nicht erneut ausgeführt. Das beschreiben die Texte nur als Verweis auf `palomar/BELEGE.md`, und dessen Inhalt habe ich nachgelesen.

## 7. Vorgaben aus Punkt 1 der Anweisung

| Vorgabe | Ergebnis |
| --- | --- |
| Satz `MatMulRank.rank_four_two_four_eq_26`, gleich 26 | ja, in allen drei Dateien wörtlich gleich |
| Lean 4.36.0 mit Mathlib v4.36.0 | ja, stimmt mit Toolchain, Manifest und Tags überein |
| aktuelle Läufe | ja, die Läufe 45869038515 und 45869043624 auf `676cdf5`; in allen drei Dateien gleich angegeben |
| Palomar-Dateien und wie man sie nachprüft | ja (zu F4 und F5 siehe Abschnitt 2) |
| Vorgeschichte mit Lean 4.19.0, nur untere Schranke, Paket mm325_proof, Zweig `lean-4.19` | ja, in allen drei Dateien. Die Angaben zum Zweig stimmen (Abschnitt 5) |
| keine Datei genannt, die es auf `main` nicht mehr gibt | eingehalten. Alle genannten Pfade gibt es bei `5d813c7` (auch die bei `c760540`, dem Stand von `main` beim Abschluss dieses Berichts; seit `5d813c7` hat sich an den drei Dateien und unter `lean/`, `.github/` und `palomar/BELEGE.md` nichts geändert) |
| „Human review: none“ | `README.md` Z. 36; `ergebnisse/rang-444.md` Z. 40 und 60 („Human review \| none“). `lean/README.md` enthält die Wendung nicht, auch nicht in der früheren Fassung bei `676cdf5` |
| „to our knowledge“ | `README.md` Z. 14; `ergebnisse/rang-444.md` Z. 21 und 113. In `lean/README.md` nicht enthalten, auch früher nicht |
| 3×2×7 nur als offen | ja: `README.md` Z. 7 und 15, `ergebnisse/rang-444.md` Z. 95. `lean/README.md` Z. 50 nennt nur eine bedingte Aussage aus Stufe 4 |
| Palomar nicht als erfolgt | ja: `README.md` Z. 7 und 40, `lean/README.md` Z. 118, `ergebnisse/rang-444.md` Z. 95 |
| die drei Dateien stimmen untereinander überein | ja, bei Satz, Zeilennummern, Versionen, Läufen, Jobs, Commits und Zweig. Kein Widerspruch gefunden |

## 8. Verbrauch

Keine Subagenten, kein Fremdmodell. Rechenblöcke: Mathlib-Cache und Bau etwa 3 Minuten, die beiden Prüfprogramme unter 1 Minute.
