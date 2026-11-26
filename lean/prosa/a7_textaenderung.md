# A7-T: Textänderung zum Paket `mm325_proof` in README und `ergebnisse/rang-444.md`

Auftrag A7-T, Abschluss von Auflage 7 aus Stufe 2. Ausgangsstand: `main` bei `7a5c077`. Dieser Bericht setzt keinen Status.

## 0. Offenlegung und Grundlage

- Eingeblendet war der Index des Projektgedächtnisses und während der Arbeit die Einzeleinträge `mm325-lizenz` und `git-regeln`. Benutzt habe ich daraus nichts für den Wortlaut.
- Anweisung des repository owner (LOG.md, Punkt 3 der Nachricht vom 26.11.2026): „README und `ergebnisse/rang-444.md` nennen das Paket dann nicht mehr als Voraussetzung des Beweises.“ Und (13:16 UTC): „Danach folgen wie besprochen der wiederholte Zweitlauf durch einen Prüfer und erst dann die Textänderung in README und `ergebnisse/rang-444.md`.“ Mit dem Start von Stufe 5 (LOG.md): „Schließe zuerst Auflage 7 ab, falls Zweitlauf oder Textänderung noch offen sind.“ Diese ausdrückliche Anweisung geht für genau diese Stellen der Regel „`ergebnisse/` bleibt unverändert“ (PROTOKOLL Abschnitt 3, Stufe 4 und 5) vor.
- Grundlage der neuen Angaben, selbst nachgesehen:
  - Job 139956567190 (Lauf 45833618872, Workflow „Second run (fresh build + lean4checker)“), über die GitHub-API: `conclusion: success`, 13:54:04 bis 14:14:26 UTC. Im Log selbst gelesen: `TARGET_SHA: 62c3dc60b44680e9367fbe3052f287c8f7e8f882`, `L4C-SUMMARY|checked=29|ok=29|failed=0`, `'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]`, `L4C-FRESH|YangBounds.Transponiert444|exit=0`. Die Zeilen „Build completed successfully.“, „0 lines with sorry/error“ und die Zahl 28 der Projektmodule übernehme ich aus dem Prüfbericht `lean/prosa/a7_zweitlauf_bericht.md` (PR 143); den Anfang des Logs hat mir das Werkzeug nicht ausgegeben.
  - Importkette auf `7a5c077` (enthält 62c3dc6, `lean/` seither unverändert): transitive Hülle der `import`-Zeilen ab `YangBounds.Transponiert444`: 26 Projektmodule, außerhalb des Projekts nur `Mathlib`. `import MatrixMultiplicationLowerBound25` steht nur in `lean/YangBounds/BrueckeMM325.lean`.
  - Einzige Beweisänderung gegenüber `ce94c42` (`SatzB444.lean` Zeile 414): aus dem Umbaubericht `lean/prosa/auflage7_entkopplung_s4-26.md` und dem Prüfbericht.

## 1. Geänderte Stellen

Nur `README.md` und `ergebnisse/rang-444.md`. Die übrige README ist unverändert. Alle neuen Sätze sagen nur, dass die Kette des Endsatzes das Paket nicht mehr importiert, und nennen den Lauf dazu. Keine neue mathematische Aussage, kein Status, nichts zu 3×2×7 oder Stufe 4 und 5.

### `README.md`, Zeile 25 → 25

**Alt:**

```
The proof depends on the imported Lean package `fallnlove/mm325_proof`. One public catalogue line already states this bound without proof; see "Related claims" in [the note](ergebnisse/rang-444.md).
```

**Neu:**

```
Since commit `62c3dc6` no module in the import chain of this theorem imports the Lean package `fallnlove/mm325_proof`; the link to that package lives in the separate file `lean/YangBounds/BrueckeMM325.lean`, which the theorem does not import. Repeated fresh-checkout build of `62c3dc6` with kernel re-check by lean4checker v4.19.0, 29 of 29 modules OK, and only the axioms `propext`, `Classical.choice`, `Quot.sound` (run 45833618872, job 139956567190). One public catalogue line already states this bound without proof; see "Related claims" in [the note](ergebnisse/rang-444.md).
```

### `ergebnisse/rang-444.md`, Zeile 31 → 31

**Alt:**

```
| External Lean dependency | `fallnlove/mm325_proof` (package `mm325_lower_bound`) at `759cf4a8524d4212e7832046204c90b9361ba2bb`, imported via Lake, not copied; that repository states no license |
```

**Neu:**

```
| External Lean package | `fallnlove/mm325_proof` (package `mm325_lower_bound`) at `759cf4a8524d4212e7832046204c90b9361ba2bb`, a Lake dependency of `lean/`, not copied; that repository states no license. Up to commit `ce94c42` the module `YangBounds.Basic` imported it; since commit `62c3dc6` only the separate file `lean/YangBounds/BrueckeMM325.lean` imports it, and no module in the import chain of the final theorem does |
```

### `ergebnisse/rang-444.md`, Zeile – → 37

**Alt:**

(keine Zeile; neue Tabellenzeile)

**Neu:**

```
| Repeated second build after removing the package from the chain | same workflow, run 45833618872, job 139956567190 (13:54–14:14 UTC, 26 November 2026), fresh checkout of commit `62c3dc60b44680e9367fbe3052f287c8f7e8f882` (merge on `main`): "Build completed successfully.", 0 lines with `sorry`, 0 lines with `error`; lean4checker 29 of 29 modules OK (28 project modules and `MatrixMultiplicationLowerBound25`, which is still built for the separate bridge); `#print axioms` for the final theorem: only `propext`, `Classical.choice`, `Quot.sound`; `--fresh` on `YangBounds.Transponiert444`: exit 0. The only proof change against the first parent `ce94c42` is one proof step in `lean/YangBounds/SatzB444.lean` line 414 (statements and definitions unchanged); report `lean/prosa/a7_zweitlauf_bericht.md` |
```

### `ergebnisse/rang-444.md`, Zeile 58 → 59

**Alt:**

```
The Lean proof depends on Lean 4, mathlib and the imported definitions of `fallnlove/mm325_proof` (used for the link between our rank notion and theirs for n = 3). The chain of the final theorem currently depends on that package; removing this dependency is an open item for later. The proof contains no `sorry` and no project-specific axioms. Yang's Theorems 1 and 2 are formalized in the same repository as Yang's theorems.
```

**Neu:**

```
The Lean proof depends on Lean 4 and mathlib. Since commit `62c3dc6` it does not depend on `fallnlove/mm325_proof`: no module in the import chain of the final theorem imports that package. The link between our rank notion and theirs for n = 3 is kept in the separate file `lean/YangBounds/BrueckeMM325.lean`, which the final theorem does not import. The proof contains no `sorry` and no project-specific axioms. Yang's Theorems 1 and 2 are formalized in the same repository as Yang's theorems.
```

### `ergebnisse/rang-444.md`, Zeile 84 → 85

**Alt:**

```
- [TPSR26] A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054 [cs.CC, cs.DS], v1 of 18 September 2026; Lean repository github.com/fallnlove/mm325_proof. (Lean template; imported dependency.)
```

**Neu:**

```
- [TPSR26] A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054 [cs.CC, cs.DS], v1 of 18 September 2026; Lean repository github.com/fallnlove/mm325_proof. (Lean template; imported only by the separate bridge `lean/YangBounds/BrueckeMM325.lean`, not by the chain of the final theorem.)
```

Begründung je Stelle:

- `README.md` Zeile 25: Der Satz „The proof depends on the imported Lean package …“ war die einzige Stelle der README, die das Paket als Voraussetzung nennt. Ersetzt durch den Stand ab 62c3dc6 mit dem maßgeblichen Lauf. Die älteren Läufe in Zeilen 20 und 21 (Stand `c3c3884`, `667df45`) bleiben als Aufzeichnung stehen; sie sind für ihren Stand weiter richtig.
- `ergebnisse/rang-444.md` Zeile 31: „imported via Lake“ las sich als Abhängigkeit des Beweises. Neu: Lake-Abhängigkeit von `lean/`, bis `ce94c42` von `YangBounds.Basic` importiert, seit `62c3dc6` nur von der Brücke.
- `ergebnisse/rang-444.md` neue Zeile 37: Die Tabelle belegte bisher nur Läufe an Ständen, in denen die Kette das Paket importierte. Ohne den Lauf auf 62c3dc6 hätte die neue Aussage in Abschnitt 4 keinen Beleg in der Notiz. Die bisherigen Zeilen der Tabelle bleiben als Aufzeichnung unverändert.
- `ergebnisse/rang-444.md` Zeile 58 → 59 (Abschnitt 4): sagte ausdrücklich, die Kette hänge am Paket und das Entfernen sei offen. Neu: Lean 4 und mathlib, Paket nur in der getrennten Brücke.
- `ergebnisse/rang-444.md` Zeile 84 → 85 (Quelle [TPSR26]): „imported dependency“ ersetzt durch „imported only by the separate bridge …, not by the chain of the final theorem“.

## 2. Stellen, die das Paket weiter nennen

| Datei, Zeile (neu) | Wortlaut (Auszug) | Grund |
|---|---|---|
| `README.md` 25 | „no module in the import chain … imports the Lean package `fallnlove/mm325_proof`; the link … lives in … `BrueckeMM325.lean`“ | nennt das Paket gerade als nicht mehr Voraussetzung und als Gegenstand der getrennten Brücke |
| `README.md` 63 | Quelle Tsyganov u. a., arXiv:2609.22054 im Abschnitt „Credit“ | Quelle, keine Abhängigkeitsaussage; unverändert |
| `ergebnisse/rang-444.md` 31 | Zeile „External Lean package“ | Das Paket bleibt Lake-Abhängigkeit von `lean/` (`lakefile.toml`, `lake-manifest.json` unverändert), wegen der Brücke; die Lizenzangabe gehört dazu |
| `ergebnisse/rang-444.md` 36 | „27 of 27 modules OK (26 modules `YangBounds.*` and `MatrixMultiplicationLowerBound25`)“ | Aufzeichnung des Laufs 45706606136 am Stand `667df45`, für diesen Stand richtig; unverändert |
| `ergebnisse/rang-444.md` 37 | „29 of 29 modules OK (28 project modules and `MatrixMultiplicationLowerBound25`, which is still built for the separate bridge)“ | wörtlicher Befund des Laufs; der Workflow prüft das Paketmodul mit, weil es für die Brücke weiter gebaut wird |
| `ergebnisse/rang-444.md` 59 | Abschnitt 4 | nennt das Paket als nicht mehr Voraussetzung und die Brücke |
| `ergebnisse/rang-444.md` 85 | Quelle [TPSR26] mit Lean-Repository | Quelle und Vorlage; Gegenstand der Brücke |

Nicht geändert, aber zu beachten: `ergebnisse/rang-444.md` Zeile 29 nennt als „Lean source state“ `c3c3884` mit „`lean/YangBounds/` unchanged since then (checked with `git diff` up to the commit of this note)“. Das ist durch die Einschränkung auf den Commit der Notiz vom 25.11.2026 weiter richtig, `lean/YangBounds/` hat sich seither aber geändert (Basic.lean, SatzB444.lean, neue BrueckeMM325.lean). Die Zeile nennt das Paket nicht; eine Änderung gehört nicht zu diesem Auftrag. Ebenso die Datumszeile der Notiz (25.11.2026) und Zeile 20 der README (Stand `c3c3884`).

## 3. `lean/README.md` (nicht geändert)

Geprüft auf `7a5c077`:

- **Zeile 26 stimmt als veraltet:** „`YangBounds/Basic.lean` | definitions (`BilinearAlgorithm`, `tensorRank`), schoolbook algorithm, bridge to the dependency“. Die Brücke liegt seit 62c3dc6 in `YangBounds/BrueckeMM325.lean`; in der Layout-Tabelle fehlen außerdem `BrueckeMM325.lean` und `AxiomsMM325.lean`.
- **Zeile 132 ist als Aufzeichnung richtig, als Beschreibung des heutigen Stands veraltet:** Zeilen 131–133 lauten „`lake env lean Axioms.lean`: `tensorRank_le_mul`, `tensorRank_three_two_eq`, `tpsr_lower_bound`, `ceil_bound_iff` use only …“. Das beschreibt einen früheren lokalen Bau; heute stehen `tensorRank_three_two_eq` und `tpsr_lower_bound` in `lean/AxiomsMM325.lean`, nicht mehr in `lean/Axioms.lean`. Die drei `sorry` aus früherem Stand, die das Logbuch zu Zeile 132 erwähnt, stehen in Zeile 130.
- Zeile 25 („dependency `mm325_lower_bound`“) und der Abschnitt ab Zeile 36 („Dependency `fallnlove/mm325_proof`“) sind weiter richtig, weil das Paket Lake-Abhängigkeit bleibt.

## 4. Verbrauch

Keine Subagenten, keine Fremdmodell-Anfragen, kein Lean-Bau. Gelesen: Job-Daten und Log-Ende über die GitHub-API, Quelltexte im Repo.
