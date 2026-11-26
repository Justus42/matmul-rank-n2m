# S5-22: Sammelzweig `portierung` nach `main`, Zweitlauf auf `main`

Auftrag S5-22 (Stufe 5, Spur P, Runde 6, Portierungsauftrag), erweitert durch die Entscheidungen
des Repository-Eigentümers vom 26.11.2026 zur Einreichung (weitergereicht vom Orchestrator).
Dieser Bericht ist die Zieldatei. Er setzt keinen Status und enthält kein Prüfurteil.

## 1. Ergebnis in Kürze

- Erster Merge: PR #167 `portierung` (f75d77c) → `main`, Merge-Commit
  `fc7d9e18c043b6883b8814f3b23db8cdadcae00c`, Commit-Zeit 2026-11-26T17:21:48Z.
- Angaben des Eigentümers auf `portierung`: PR #168 (Commits `4e2c720`, `5543553`), Merge
  `72e593fcfff60ca45da79872f9aebb4b1f4f3f63`.
- Zweiter Merge: PR #169 `portierung` (72e593f) → `main`, Merge-Commit
  **`676cdf5deb786e81a66342606d4dd2b6f919745e`**, Commit-Zeit 2026-11-26T17:35:31Z.
- Auf `676cdf5…` sind `lean-project.yml` und `zweitlauf.yml` grün (Abschnitt 4). Das ist der
  letzte Commit auf `main`, der die Dateien der Einreichung enthält. Danach kam auf `main` nur
  dieser Bericht dazu (eigener PR), der nur `lean/prosa/s5_merge_s5-22.md` anlegt.
- Alle Merges mit Merge-Commit, ohne Squash, ohne Rebase, ohne Force-Push. Keine Konflikte.
- Der Zweig `portierung` besteht weiter (Stand `72e593f`). Der Zweig `lean-4.19` ist unverändert
  (`71240f81988ae10323af035c3273a45b5038ac3a`).

## 2. Geschützte Dateien

Beide Merges ändern keine der Dateien `STATUS.md`, `LOG.md`, `pruefvermerke/`, `behauptungen/`,
`PROTOKOLL.md`, `CLAUDE.md`, `README.md`, `ergebnisse/`:

```
$ git diff --stat a496be6 fc7d9e1 -- STATUS.md LOG.md pruefvermerke behauptungen PROTOKOLL.md CLAUDE.md README.md ergebnisse
(keine Ausgabe)
$ git diff --quiet f8759b1 676cdf5 -- STATUS.md LOG.md pruefvermerke behauptungen PROTOKOLL.md CLAUDE.md README.md ergebnisse && echo geschützt-unverändert
geschützt-unverändert
```

(`a496be6` und `f8759b1` sind die ersten Eltern der beiden Merge-Commits, also `main` davor.)

## 3. Diff-Vergleich unter `lean/`

```
$ git diff --stat f75d77c fc7d9e1 -- lean ':!lean/prosa'
(keine Ausgabe)
$ git diff 72e593f 676cdf5 -- lean ':!lean/prosa' | wc -l
0
$ git diff --stat f75d77c 676cdf5 -- lean ':!lean/prosa'
 lean/formalization.yaml | 66 ++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 31 deletions(-)
```

Ergebnis: `main` unterscheidet sich unter `lean/` (ohne `lean/prosa/`) nach dem ersten Merge nicht
von `portierung` bei `f75d77c`, und nach dem zweiten Merge nicht von `portierung` bei `72e593f`.
Gegenüber `f75d77c` unterscheidet sich nur `lean/formalization.yaml` (Angaben des Eigentümers,
Abschnitt 5). Keine `.lean`-Datei hat sich geändert.

## 4. Läufe in Actions auf `main`

`zweitlauf.yml` startet auf `main` nicht von selbst (Push-Auslöser nur für `portierung`). Er wurde
je per `workflow_dispatch` auf `main` mit der Eingabe `ref` = voller SHA des Merge-Commits
gestartet. Keine Workflow-Datei wurde geändert.

| Commit | Workflow | Lauf | Job | Ergebnis | Zeit (UTC) |
| --- | --- | --- | --- | --- | --- |
| `fc7d9e1` | `lean-project.yml` (push) | 45867097707 | 140072619434 | success | 17:21:55–17:24:23 |
| `fc7d9e1` | `zweitlauf.yml` (dispatch) | 45867114483 | 140072685305 | success | 17:22:03–17:33:31 |
| `676cdf5` | `lean-project.yml` (push) | 45869038515 | 140079318183 | success | 17:35:37–17:38:21 |
| `676cdf5` | `zweitlauf.yml` (dispatch) | 45869043624 | 140079342228 | success | 17:35:40–17:46:35 |

Zusätzlich lief `zweitlauf-b016.yml` auf `fc7d9e1` (Lauf 45867097917, success).

### 4.1 `lean-project.yml` auf `676cdf5` (Job 140079318183), wörtlich

```
shared definitions and imports identical
Build completed successfully (4271 jobs).
SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
SORRY: 0 'sorry' token(s) in the sources outside comments
INTENDED: 1 declaration(s) and 1 token(s) in the Palomar Challenge (MatMulRank/Challenge.lean), deliberate hole, not counted above
  lean/MatMulRank/Challenge.lean:94
  lean/MatMulRank/Challenge.lean:95
AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Upper4x2x4.rank_four_two_four_le_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Gleich444.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
TOTAL: STANDARD=65
```

Dieselben Zeilen stehen im Job 140072619434 auf `fc7d9e1`.

### 4.2 `zweitlauf.yml` auf `676cdf5` (Job 140079342228), wörtlich

```
CHECKED COMMIT: 676cdf5deb786e81a66342606d4dd2b6f919745e
olean/ilean/trace files in fresh checkout: 0
Lean (version 4.36.0, x86_64-unknown-linux-gnu, commit 611c117bfaf7b7ae1cfcf246ce6fba31e8f509e9, Release)
leanchecker: /home/runner/.elan/toolchains/leanprover--lean4---v4.36.0/bin/leanchecker
project modules (32):
L4C-SUMMARY|checked=32|ok=32|failed=0
  26 ≤ YangBounds.tensorRank K 4 2 4
'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
YangBounds.Gleich444.rank_four_two_four_eq_26 : ∀ (K : Type u_1) [inst : Field K], YangBounds.tensorRank K 4 2 4 = 26
'YangBounds.Gleich444.rank_four_two_four_eq_26' depends on axioms: [propext, Classical.choice, Quot.sound]
MatMulRank.rank_four_two_four_eq_26 : ∀ (K : Type u_1) [inst : Field K], MatMulRank.tensorRank K 4 2 4 = 26
'MatMulRank.rank_four_two_four_eq_26' depends on axioms: [propext, Classical.choice, Quot.sound]
L4C-FRESH|YangBounds.Transponiert444|exit=0
```

Im Job 140072685305 auf `fc7d9e1` stehen dieselben Zeilen mit
`CHECKED COMMIT: fc7d9e18c043b6883b8814f3b23db8cdadcae00c`.

## 5. Angaben des Eigentümers (PR #168 an `portierung`)

Umgesetzt nach den sechs Punkten der Nachricht des Eigentümers vom 26.11.2026:

1. `project.authors` und `project.responsible_maintainers` je genau
   `{name: "Justus Jeserigk", github: "Justus42"}`.
2. Herkunft „original“ (Fassung A aus `palomar/s5-08-bericht.md` Abschnitt 6): Eintrag „Lower
   bound 26 for the tensor rank of <4,2,4> over every field“ mit `type: original-proof`,
   `relationship: other`; Quelle Yang `relationship: background`. Palomars Code leitet
   `result_origin: original` ab.
3. `versuche/s2-19-abgleich/Check.lean` per `git mv` in `Check.lean.txt` umbenannt, Inhalt
   unverändert (SHA-256 `47bc69ff…e588` vorher und nachher), Erklärung in
   `versuche/s2-19-abgleich/HINWEIS-Check.txt`. Kein Workflow verweist auf den alten Namen.
   Den alten Namen nennen weiter: die Datei selbst (Zeile 7), `pruefvermerke/B-008.md` (nicht
   geändert, Stand von `main`), `palomar/s5-08-bericht.md`, `palomar/ANFORDERUNGEN.md` Z. 246
   und 276 sowie frühere Abschnitte von `palomar/BELEGE.md` als Beschreibung des damaligen Stands.
4. Beschreibung: „To our knowledge, the lower bound 26 is new (literature search recorded in lit/
   of this repository)“.
5. `review.notes`: Der Aussagen-Abgleich der Aussage „= 26“ durch einen Prüfer und durch GPT 6.2
   Sol ist als erledigt eingetragen, mit Verweis auf `LOG.md`, `pruefvermerke/B-034.md`,
   `lean/prosa/s5_abgleich_s5-20.md` und `versuche/s5-r5-sol-b034/gpt_antwort.md`.
6. `automation`: Modellnamen nur, soweit `LOG.md` sie nennt: `claude-opus-5-5`
   („Gemeldetes Modell“), „Claude Fable 5.2“ (Co-Autor eines Commits), `openai/gpt-6.2-sol`,
   `gemini-4-carbon`. `claude-fable-5-2` als Modell des Orchestrators ist in `LOG.md` nicht
   belegt und entfallen; die übrigen Sitzungen heißen allgemein „Claude models (Anthropic)“.

Dazu `palomar/BELEGE.md` Abschnitt 8 (Ausgabe von Palomars Prüfcode auf `4e2c720`:
`inspect_lean_sources` 35 Dateien, `issues: []`; `load_formalization_metadata` OK;
`normalized_provenance` `result_origin: original`), die Zeilen P-13, P-29, P-32, P-35 bis P-39
und die Zählung (erfüllt 39, nicht erfüllt 0, Eigentümer 3: P-47 bis P-49), und
`palomar/ANFORDERUNGEN.md` Zeile 5 bis 9 (Gegenstand ist `MatMulRank.rank_four_two_four_eq_26`).

## 6. Grenzen eingehalten

Keine `.lean`-Datei geändert, keine Workflow-Datei geändert, `README.md`, `ergebnisse/`,
`STATUS.md`, `LOG.md`, `pruefvermerke/`, `behauptungen/` nicht geändert. Kein Tag, kein Release,
keine Einreichung, kein Aufruf des Einreichformulars, keine Verbindung zu palomar-registry.org.
Kein Fremdmodell. Nichts ins Projektgedächtnis geschrieben.

## 7. Verbrauch

0 Subagenten (nur der Thread selbst), 0 Fremdmodell-Anfragen. Pull Requests #167, #168, #169 und
der PR dieses Berichts.
