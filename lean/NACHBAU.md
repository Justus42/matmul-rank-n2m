# Nachbau des Lean-Beweises zu 3×2×5 (Auftrag A-02)

- Rolle: Formalisierer, Runde 2, Stufe 0
- Datum: 25.11.2026
- Gesamtstatus dieses Berichts: **behauptet** (lokaler Lauf in einer Cloud-Sitzung; maßgeblich ist nach Protokoll 5.1 Punkt 4 erst der Build in GitHub Actions, Auftrag A-11)

## Ergebnis in Kürze

| Prüfpunkt | Ergebnis | Status |
|---|---|---|
| `lake build` am Commit `759cf4a` | durchgelaufen, Exit-Code 0, nur Stil-Warnungen | behauptet |
| `sorry` | keine Warnung „declaration uses 'sorry'“, kein `sorry` im Quelltext | behauptet |
| `#print axioms` für die zehn Sätze aus `Audit.lean` | jeweils nur `propext`, `Classical.choice`, `Quot.sound` | behauptet |
| Axiome aller 312 Kernel-Deklarationen des Moduls (eigene Prüfung) | Vereinigung = `propext`, `Classical.choice`, `Quot.sound`; keine eigene `axiom`-Deklaration | behauptet |
| Ausgabe von `Audit.lean` gegen `verification.txt` | Wort für Wort gleich | behauptet |
| SHA-256 der Lean-Datei gegen `verification.txt` | **passt nicht** (Befund aus A-01 bestätigt) | behauptet |

Was dieser Bericht **nicht** prüft: ob der Lean-Satz dieselbe Aussage hat wie Satz 1 im Paper arXiv:2609.22054. Das ist Auftrag A-03.

## Lizenz und was im Repo liegt

Das Repo `fallnlove/mm325_proof` hat keine Lizenz (siehe `lit/LIZENZEN.md`, A-01). Nach Protokoll 11.3 wurde nichts daraus in unser Repo kopiert. Der Klon und der Build lagen ausschließlich außerhalb des Repos. Unten zitierte Satzaussagen sind Ausgaben von `#check`, also kurze Zitate zum Zweck der Prüfung, kein übernommener Code.

## Umgebung

| Teil | Stand |
|---|---|
| Fremdes Repo | `https://github.com/fallnlove/mm325_proof`, Commit `759cf4a8524d4212e7832046204c90b9361ba2bb` (einziger Commit, 18.09.2026) |
| Lean | 4.19.0 (`commit 6caaee842e94`, Release), Lake 5.0.0-6caaee8 |
| Lean-Archiv | `lean-4.19.0-linux.tar.zst` aus den GitHub-Releases von `leanprover/lean4`, SHA-256 `6fe3ce97a58f44e2b3567d455b994eacec5bfe9ae7774f2a573444480ba813fe` |
| mathlib | `c44e0c8ee63ca166450922a373c7409c5d26b00b` (Tag v4.19.0) |
| Weitere Pakete | genau die Revisionen aus `lake-manifest.json` des Repos (batteries `f5d04a9`, aesop `5d50b08`, Qq `fa4f7f1`, plausible `77e08ed`, proofwidgets `c491918`, importGraph `e6a9f0f`, LeanSearchClient `2507836`, Cli `02dbd02`), nach dem Bau einzeln mit `git rev-parse` abgeglichen |
| Rechner | Cloud-Container, 4 Kerne, 15 GB RAM, Linux x86_64 |

### Abweichungen vom üblichen Weg (mit Grund)

1. **Toolchain:** `elan` konnte die Toolchain nicht laden, weil `releases.lean-lang.org` aus der Sitzung gesperrt ist (Proxy 403). Ich habe dasselbe Release-Archiv von GitHub geladen und mit `elan toolchain link leanprover/lean4:v4.19.0 …` eingebunden. Die Versionsausgabe oben zeigt, dass es die verlangte Version ist.
2. **mathlib-Cache:** `lake exe cache get` scheiterte, weil `lakecache.blob.core.windows.net` gesperrt ist (Proxy 403). mathlib und die übrigen Pakete wurden deshalb **aus den Quellen gebaut**, nur die vom Beweis importierten Module (1.493 Build-Schritte).
3. **`lake update`:** Ich habe einmal versehentlich `lake update --keep-toolchain` gestartet. Es hat `lake-manifest.json` nur umformatiert, die Revisionen blieben gleich. Die Datei wurde vor dem Build mit `git checkout lake-manifest.json` auf den Stand des Commits zurückgesetzt. Der Arbeitsbaum des Klons war beim Build sauber (`git status` zeigt nur den Ordner `.lake/`).

## Build

```
timeout 1800 lake build MatrixMultiplicationLowerBound25
```

- Ein Rechenblock: 14 min 34 s Wanduhr (51 min 56 s CPU), innerhalb der Grenze von 30 Minuten auf 4 Kernen.
- Letzte Zeilen: `⚠ [1492/1493] Built MatrixMultiplicationLowerBound25` und `Build completed successfully.`, Exit-Code 0.
- Das Warnzeichen ⚠ kommt von 9 Warnungen in `MatrixMultiplicationLowerBound25.lean`, alle Linter- oder Stilhinweise:
  - 3 × `try 'simp at h' instead of 'simpa using h'` (Linter `unnecessarySimpa`)
  - 3 × `Used tac1 <;> tac2 where (tac1; tac2) would suffice`
  - 3 × `automatically included section variable(s) unused in theorem …` (bei `finrank_range_sum_smulRight_le`, `finrank_range_weighted_sum_le` und einem privaten Hilfssatz `isolate_finite`)
  - keine Warnung `declaration uses 'sorry'`, keine Fehler
- `verification.txt` sagt ebenfalls „style warnings only“. Das passt.

## Axiom-Prüfung

### 1. Mitgelieferte `Audit.lean`

`lake env lean Audit.lean` lief mit Exit-Code 0 (5 s). Alle zehn geprüften Sätze hängen nur von den drei Standard-Axiomen ab:

| Satz | Axiome |
|---|---|
| `MatrixMultiplicationLowerBound.theorem_one` | propext, Classical.choice, Quot.sound |
| `MatrixMultiplicationLowerBound.theorem_one_rational` | dieselben |
| `MatrixMultiplicationLowerBound.theorem_one_rounded` | dieselben |
| `MatrixMultiplicationLowerBound.matrix_algorithm_rank_strict` | dieselben |
| `MatrixMultiplicationLowerBound.rank_325_ge25` | dieselben |
| `MatrixMultiplicationLowerBound.matrix_algorithm_rank_ge25` | dieselben |
| `MatrixMultiplicationLowerBound.Decomposition.toMatrixAlgorithm` | dieselben |
| `MatrixMultiplicationLowerBound.decomposition_iff_matrixAlgorithm` | dieselben |
| `MatrixMultiplicationLowerBound.rank_eq` | dieselben |
| `MatrixMultiplicationLowerBound.theorem_one_tensorRank` | dieselben |

Die gesamte Ausgabe (`#check` und `#print axioms`) ist **zeichengleich** mit dem entsprechenden Abschnitt von `verification.txt` (per `diff` geprüft).

### 2. Eigene Prüfung über das ganze Modul

Eine eigene Prüfdatei (außerhalb beider Repos, nicht eingecheckt) hat alle Konstanten des Moduls `MatrixMultiplicationLowerBound25` aufgezählt und für jede `Lean.collectAxioms` aufgerufen:

- 538 Konstanten im Modul. Davon sind 226 Hilfsdeklarationen des alten Code-Generators (Namensteile `_at`, `_spec`, `_elambda` usw.). 51 davon stehen in der Umgebung als `axiom`. Das ist ein bekanntes Verhalten des Compilers in Lean 4.19 für Spezialisierungen. Sie werden vom Kernel nicht geprüft und tauchen in keiner Axiom-Liste eines Satzes auf (siehe nächster Punkt).
- 312 Kernel-Deklarationen, davon 227 Sätze. Keine davon ist eine `axiom`-Deklaration.
- Vereinigung der Axiome über alle 312 Kernel-Deklarationen: `propext`, `Classical.choice`, `Quot.sound`. Insbesondere kein `sorryAx` und kein `Lean.ofReduceBool` (also kein `native_decide`).

Ein `grep` im Quelltext auf `sorry`, `axiom`, `native_decide`, `implemented_by`, `extern`, `unsafe`, `ofReduceBool` und `set_option` fand nichts.

Nicht gemacht: ein unabhängiger Nachprüfer wie `lean4checker`. Er ist im Toolchain-Archiv 4.19.0 nicht enthalten. Das wäre eine sinnvolle Ergänzung für A-11.

## Prüfsumme in `verification.txt`

| Datei | SHA-256 |
|---|---|
| `MatrixMultiplicationLowerBound25.lean` (eingecheckt, 90.729 Bytes) | `b1ec8c87dbdff3de92effa9b41de0a0c3ba61001525fea1eaa853aec51e8ed79` |
| laut `verification.txt` („Source SHA256“) | `9d3ebc3afefa314f04166608d45cde4c4f9c50727c7a9765b969981c1d38d298` |
| `Audit.lean` (zum Vergleich) | `523eca9956ea4dbb0d03da16272eb353791061eda46769b6a99e24cce307dba9` |

Der Befund aus A-01 bestätigt sich: Die Prüfsumme in `verification.txt` gehört nicht zur eingecheckten Datei. Für unser Projekt ist das unerheblich, weil der eigene Build die eingecheckte Datei am festen Commit geprüft hat und die Audit-Ausgabe zeichengleich ist. Vermutet (ohne Beleg): `verification.txt` wurde an einem früheren Stand erzeugt, die Datei danach noch geändert, etwa an Kommentaren oder Formatierung. Für die Satzaussagen spielt das keine Rolle, weil sie oben aus dem eigenen Lauf stammen.

## Satzaussagen aus dem eigenen Lauf (für A-03)

Aus `#check` im eigenen Lauf, wörtlich:

```
MatrixMultiplicationLowerBound.theorem_one.{u_2} (K : Type u_2) [Field K] (mcols : ℕ) (hm : 0 < mcols) :
  24 * mcols < 5 * MatrixMultiplicationLowerBound.matrixMultiplicationRank K mcols
MatrixMultiplicationLowerBound.rank_325_ge25.{u_2} (K : Type u_2) [Field K] :
  25 ≤ MatrixMultiplicationLowerBound.matrixMultiplicationRank K 5
MatrixMultiplicationLowerBound.matrix_algorithm_rank_ge25.{u_1} {K : Type u_1} [Field K] {r : ℕ}
  (α : Fin r → Matrix (Fin 3) (Fin 2) K →ₗ[K] K) (β : Fin r → Matrix (Fin 2) (Fin 5) K →ₗ[K] K)
  (C : Fin r → Matrix (Fin 3) (Fin 5) K)
  (h : ∀ (A : Matrix (Fin 3) (Fin 2) K) (B : Matrix (Fin 2) (Fin 5) K), A * B = ∑ k, ((α k) A * (β k) B) • C k) : 25 ≤ r
```

Hinweise für den Prüfer, ohne Urteil:

- `matrix_algorithm_rank_ge25` ist die Aussage, die am wenigsten von den eigenen Definitionen des Repos abhängt: Sie spricht nur über mathlib-Matrizen, Linearformen und die gewöhnliche Matrixmultiplikation. Jede bilineare Darstellung von 3×2 mal 2×5 über einem beliebigen Körper K braucht mindestens 25 Produkte.
- `matrixMultiplicationRank` und `matrixTensorRank` sind im Repo als kleinstes r mit einer Zerlegung definiert (`Nat.find`). `rank_eq` sagt, dass beide gleich sind. Ob diese Definition dem Tensorrang im Paper entspricht, entscheidet A-03.
- Wie schon in A-01 notiert: `theorem_one` ist für allgemeines m schwächer als Yangs Schranke ⌈(24m+2)/5⌉, für m = 5 stimmen beide mit 25 überein.

## Nachvollziehen

```
git clone https://github.com/fallnlove/mm325_proof && cd mm325_proof
git checkout 759cf4a8524d4212e7832046204c90b9361ba2bb
# Toolchain leanprover/lean4:v4.19.0 (über elan oder wie oben aus den GitHub-Releases)
lake exe cache get        # wo erlaubt; sonst entfällt dieser Schritt und mathlib wird gebaut
lake build MatrixMultiplicationLowerBound25
lake env lean Audit.lean
sha256sum MatrixMultiplicationLowerBound25.lean
```

## Folgerung für Stufe 0

- Fertig-Kriterium „Lean-Build grün“: lokal erfüllt, Status behauptet. Maßgeblich ist der Lauf in GitHub Actions (A-11), dort sollte der mathlib-Cache erreichbar sein.
- Fertig-Kriterium „Axiom-Bericht liegt vor“: dieser Bericht.
- Kein Hinweis auf einen Fundamentfehler nach Abbruchregel 4. Die falsche Prüfsumme in `verification.txt` betrifft nur die Dokumentation des fremden Repos, nicht den Beweis.
