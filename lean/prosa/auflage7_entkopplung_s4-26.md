# S4-26: Endsatz zu ⟨4,2,4⟩ vom Paket `mm325_proof` entkoppeln (Auflage 7)

Wartungsauftrag in Runde 5 von Stufe 4, Inhalt nach Punkt 3 der Nachricht des repository owner vom 26.11.2026, 11:40 UTC. Ausgangsstand: `main` bei `66f11ab`. Status setzt nur der Orchestrator.

## Was verschoben wurde

| vorher | nachher |
|---|---|
| `lean/YangBounds/Basic.lean` Zeile 5: `import MatrixMultiplicationLowerBound25` | entfernt; an seiner Stelle die 21 Mathlib-Importe des Paketmoduls, die `Basic.lean` noch nicht selbst hatte (siehe unten) |
| `lean/YangBounds/Basic.lean` Zeilen 24–27, Hinweis im Modulkommentar | ersetzt durch den Hinweis, dass `Basic.lean` das Paket nicht importiert und die Brücke in `BrueckeMM325.lean` liegt |
| `lean/YangBounds/Basic.lean` Zeilen 125–153: `BilinearAlgorithm.toMatrixAlgorithm`, `BilinearAlgorithm.ofMatrixAlgorithm`, `tensorRank_three_two_eq`, `tpsr_lower_bound` | wörtlich unverändert in der neuen Datei `lean/YangBounds/BrueckeMM325.lean`, gleiche Namen im Namensraum `YangBounds` |
| `lean/Axioms.lean` Zeilen 7 und 8: `#print axioms YangBounds.tensorRank_three_two_eq`, `#print axioms YangBounds.tpsr_lower_bound` | entfernt; stehen in der neuen Datei `lean/AxiomsMM325.lean` (importiert nur `YangBounds.BrueckeMM325`) |

Unverändert: `lakefile.toml`, `lake-manifest.json` (Paket `mm325_lower_bound` bei `759cf4a8…` bleibt Abhängigkeit, Mathlib bei `c44e0c8`), `lean/YangBounds.lean` (Wurzelmodul, importiert `BrueckeMM325` nicht), alle übrigen Lean-Dateien, alle Sätze und Beweise, `.github/workflows/*`, `.github/scripts/lean_report.py`.

`BrueckeMM325.lean` wird weiter gebaut: Die Bibliothek `YangBounds` erfasst über das Muster `YangBounds.+` jede Datei unter `lean/YangBounds/`, und `lean_report.py gen-check` importiert ebenfalls jede dieser Dateien.

### Warum die Mathlib-Importe in `Basic.lean`

Bisher bekamen `Basic.lean` und alle Dateien dahinter über `MatrixMultiplicationLowerBound25` dessen Mathlib-Importe mit. Damit kein nachfolgender Beweis eine Mathlib-Datei verliert, stehen genau diese Importe jetzt direkt in `Basic.lean`. Liste der Importe des Paketmoduls (`fallnlove/mm325_proof@759cf4a`, Datei `MatrixMultiplicationLowerBound25.lean`, Zeilen 1–23, außerhalb des Repos gelesen, nichts kopiert außer den Modulnamen): `Mathlib.LinearAlgebra.FiniteDimensional.Basic`, `Mathlib.Tactic.FinCases`, `Mathlib.Tactic.Ring`, `Mathlib.LinearAlgebra.Quotient.Basic`, `Mathlib.Tactic.Abel`, `Mathlib.LinearAlgebra.FiniteDimensional.Lemmas`, `Mathlib.Algebra.Module.Submodule.Lattice`, `Mathlib.Algebra.Module.Pi`, `Mathlib.Algebra.Field.Basic`, `Mathlib.LinearAlgebra.Dual.Lemmas`, `Mathlib.LinearAlgebra.Pi`, `Mathlib.Algebra.Polynomial.Roots`, `Mathlib.LinearAlgebra.Dimension.Constructions`, `Mathlib.Tactic.LinearCombination`, `Mathlib.Tactic.FieldSimp`, `Mathlib.Tactic.Push`, `Mathlib.LinearAlgebra.Basis.Prod`, `Mathlib.LinearAlgebra.StdBasis`, `Mathlib.LinearAlgebra.BilinearMap`, `Mathlib.FieldTheory.RatFunc.Basic`, `Mathlib.Data.Matrix.Mul`, `Mathlib.Data.Nat.Find`, `Mathlib.Tactic.NormNum`. Die beiden vorletzten hatte `Basic.lean` schon.

Was nachfolgende Dateien jetzt nicht mehr sehen, sind nur die eigenen Deklarationen des Pakets (Namensräume `MatrixMultiplicationLowerBound` und `MM325`, darunter einige `@[simp]`-Lemmata über seine eigenen Typen). Keine Lean-Datei unter `lean/` außer der Brücke nennt einen dieser Namen (Suche nach `MatrixMultiplicationLowerBound`, `MM325`, `matrixMul`, `colUnit`, `pencilMinor`, `mapVec`, `pairBasis`, `Decomposition`: keine Treffer außerhalb der Brücke). Ob ein `simp`-Aufruf stillschweigend eines der Paket-Lemmata benutzt hat, entscheidet der Bau im Actions-Lauf.

## Importkette des Endsatzes

Endsatz: `YangBounds.Transponiert444.rank_four_two_four_ge_26` in `lean/YangBounds/Transponiert444.lean`. Ermittelt aus den `import`-Zeilen der Quelltexte (transitive Hülle innerhalb von `lean/YangBounds/`, Importe außerhalb des Projekts gesammelt).

**Vorher (`main` bei `66f11ab`):** 26 Projektmodule: `Basic`, `Bruecke444`, `CeilBound`, `Endsatz444`, `Lemma13Prime`, `LemmaK444`, `LemmaP444`, `LemmaZ444`, `SatzA444`, `SatzB444`, `SatzB444Final`, `SatzB444Poly`, `SatzC444Generisch`, `SatzC444Kern`, `SatzE444`, `SatzE444Buendel`, `SatzF444`, `Statements`, `Transponiert444`, `Upper3x2x6`, `YangN3`, `YangN3Teil1`, `YangN3Teil2`, `YangN3Teil3`, `YangN4Haupt`, `YangN4Lemma13` (jeweils mit Präfix `YangBounds.`). Einziger Import außerhalb von Mathlib: `MatrixMultiplicationLowerBound25`, importiert von `YangBounds.Basic`. Über `Basic` hing damit jede Datei der Kette am Paket (z. B. `Transponiert444 → SatzF444 → LemmaP444 → SatzE444Buendel → SatzE444 → SatzA444 → Statements → Basic → MatrixMultiplicationLowerBound25`).

**Nachher (dieser PR):** dieselben 26 Projektmodule. Importe außerhalb von Mathlib: keine. Kein Modul der Kette importiert `MatrixMultiplicationLowerBound25`. Da Mathlib das Paket nicht importiert (das Paket hängt umgekehrt von Mathlib ab), importiert die Kette das Paket weder direkt noch indirekt. `YangBounds.BrueckeMM325` ist nicht in der Kette.

Zur Gegenprobe: Wurzelmodul `YangBounds` (27 Module, Kette plus Wurzel): kein Paketimport. `YangBounds.S4BedingterAusschluss`: kein Paketimport. `YangBounds.BrueckeMM325`: importiert `YangBounds.Basic` und `MatrixMultiplicationLowerBound25`, als einzige Datei des Projekts. Außerdem importieren nur `lean/AxiomsMM325.lean` (neu) und `lean/YangBounds/Basic.lean` (im Kommentar) den Namen `BrueckeMM325`, also kein Modul der Kette.

Nachrechnen ohne Lean: für jedes Modul die Zeilen `^import` lesen und die Hülle bilden; die `import`-Zeilen aller Dateien stehen in den ersten Zeilen der Dateien unter `lean/YangBounds/`.

## Was sonst das Paket nennt

Nicht geändert, weil außerhalb des Auftrags oder für einen grünen Lauf nicht nötig:

- `.github/workflows/zweitlauf.yml` (Zeilen 7, 137, 147, 152): prüft mit lean4checker auch die Module des Pakets unter `.lake/packages/mm325_lower_bound/.lake/build`. Das Paket wird weiter gebaut (wegen `BrueckeMM325.lean`), der Schritt bleibt also lauffähig. Für den Endsatz selbst prüft der Schritt danach mehr als nötig, das ist unschädlich. Die Axiom-Zeile dort importiert nur `YangBounds.Transponiert444` und ist vom Umbau nicht betroffen.
- `.github/workflows/lean-build.yml`: der alte, getrennte Bau des fremden Repos. Unberührt.
- `.github/workflows/lean-project.yml` Zeile 7: Kommentar über `lean-build.yml`. Unberührt.
- `lean/README.md` Zeilen 24, 26 („bridge to the dependency“ bei `Basic.lean`), 36–41 (Abschnitt zur Abhängigkeit), 54–58 und 132 (`tensorRank_three_two_eq`, `tpsr_lower_bound` in `Axioms.lean`): nach dem Umbau in den Zeilen 26 und 132 veraltet. Nicht geändert (README-Dateien außerhalb des Auftrags, strengere Lesart); Nachtrag gehört in einen eigenen Auftrag.
- `lean/NACHBAU.md`: historischer Nachbau des fremden Repos (A-02). Unberührt.
- `README.md` Zeile 25 und `ergebnisse/rang-444.md` Zeilen 31, 58, 84: nennen das Paket als Voraussetzung des Beweises. Nach Vorgabe des repository owner in einem getrennten Auftrag nach dem wiederholten Zweitlauf zu ändern; hier unberührt.
- `STATUS.md` Zeile 257 („`lean/Axioms.lean` importiert das Wurzelmodul …“) und Zeile 253 (Auflage 7): Sache des Orchestrators.

Nach den Quelltexten importiert keine weitere Lean-Datei unter `lean/` das Paket oder nennt die vier verschobenen Deklarationen. Der Bau zeigt aber, dass trotzdem mehr am Paket hängt (nächster Abschnitt).

## Befund: Der Endsatz hängt über ein `simp`-Lemma des Pakets mehr am Paket als die Brücke

Lauf von `.github/workflows/lean-project.yml` auf diesem PR (Commit `b546caf`): Lauf 45820627478, Job 139911775768, **rot**. Wörtlich aus dem Log:

```
✖ [1752/1765] Building YangBounds.SatzB444
error: ././././YangBounds/SatzB444.lean:414:54: simp made no progress
```

Die Stelle, `lean/YangBounds/SatzB444.lean` Zeile 414:

```
  have h12 : finrank K (Fin 3 → Fin 4 → K) = 12 := by simp
```

Bisher hat `simp` das mit einem `@[simp]`-Lemma des Pakets geschlossen, sehr wahrscheinlich `MatrixMultiplicationLowerBound.Decomposition.finrank_output : finrank K (Output K mcols) = 3 * mcols` (Paketdatei Zeile 1086). `Output K mcols` ist dort ein `abbrev` für `Fin 3 → Fin mcols → K`, das Lemma greift also auf genau diesen Ausdruck. Ohne das Paket findet die Mathlib-`simp`-Menge keinen Schritt. Die Mathlib-Umgebung ist dieselbe wie vorher (siehe oben), es fehlt nur das Lemma des Pakets.

`SatzB444` liegt in der Kette des Endsatzes (`Transponiert444 → … → SatzB444Final → SatzB444`). Der Endsatz hing also nicht nur über den Import in `Basic.lean`, sondern über einen Beweisschritt am Paket. Die Stelle zu ändern hieß, einen Beweis zu ändern. Nach der Vorgabe des repository owner („Hängt mehr am Paket als diese Brücke, berichte, statt umzubauen“) wurde zunächst berichtet und nicht gemergt. Am 26.11.2026, 13:16 UTC hat der repository owner erlaubt, Beweisschritte zu ändern, die ohne das Paket nicht mehr bauen, unter vier Bedingungen: nur Beweiskörper, Ersatz nur durch Mathlib; Bau wiederholen bis grün und jede Stelle mit Datei, Zeile, altem und neuem Wortlaut auflisten; bei mehr als einem lokalen Ersatz je Stelle oder mehr als zehn Stellen berichten statt weiterbauen; Abschluss von Auflage 7 außerhalb der Plätze von Runde 6. Ergebnis im nächsten Abschnitt.

Im ersten Lauf hatte Lake, weil `SatzB444` nicht baute, die davon abhängigen Module (`SatzB444Final`, `SatzC444Kern`, `SatzC444Generisch`, `SatzE444`, `SatzE444Buendel`, `LemmaP444`, `Endsatz444`, `Bruecke444`, `SatzF444`, `LemmaK444`, `LemmaZ444`, `Transponiert444`) nicht übersetzt. Ob dort weitere Schritte stillschweigend Lemmata des Pakets benutzen, zeigte erst der Lauf nach der Änderung (unten): keine. Eine Textsuche nach `finrank K (Fin … → …)` in `lean/YangBounds/` findet nur noch `SatzE444.lean` Zeile 156, und dort ist der Beweis mit `Module.finrank_pi_fintype` und `Module.finrank_fin_fun` ausgeschrieben, ohne Paket. Das ist kein Nachweis.

Gebaut hatten im ersten Lauf unter anderem `YangBounds.Basic` (ohne Paket), `YangBounds.BrueckeMM325`, `YangBounds.S4BedingterAusschluss`, `YangBounds.Statements`, `YangBounds.YangN4Haupt`, `YangBounds.SatzA444`.

## Geänderte Beweisstellen

Genau eine Stelle. Keine Satzaussage und keine Definition geändert, nur der Beweiskörper eines `have` innerhalb eines Beweises; der Ersatz benutzt nur Mathlib (`Module.finrank_pi_fintype`, dasselbe Lemma wie schon in `SatzE444.lean` Zeile 157).

| Datei | Zeile | alter Wortlaut | neuer Wortlaut |
|---|---|---|---|
| `lean/YangBounds/SatzB444.lean` | 414 | `  have h12 : finrank K (Fin 3 → Fin 4 → K) = 12 := by simp` | `  have h12 : finrank K (Fin 3 → Fin 4 → K) = 12 := by rw [Module.finrank_pi_fintype]; simp` |

Mit dieser einen Änderung baut die ganze Bibliothek ohne das Paket in der Kette (Lauf unten). Weitere Stellen gab es nicht.

## Lauf

Maßgeblich ist der Lauf von `.github/workflows/lean-project.yml` (Job „Build lean/ and report axioms“).

- Rot, ohne die Beweisänderung: Lauf 45820627478 / Job 139911775768 (Commit `b546caf`) und Lauf 45821296681 / Job 139913920194 (Commit `67538f5`, nur Bericht geändert), beide mit `SatzB444.lean:414:54: simp made no progress`.
- Grün, mit der Beweisänderung: Lauf 45827654513 / Job 139935849007 (PR-Kopf `72a4208`, geprüfter Merge-Stand `04fd39a`). Wörtlich aus dem Log:

```
✔ [1748/1765] Built YangBounds.BrueckeMM325
ℹ [1764/1765] Built YangBounds.Transponiert444
SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
SORRY: 0 'sorry' token(s) in the sources outside comments
'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26|propext, Quot.sound, Classical.choice
TOTAL: STANDARD=60
```

Lauf- und Job-Nummer des Laufs auf `main` nach dem Merge meldet der Thread dem Orchestrator; sie stehen nicht in dieser Datei, weil jeder Commit hier den Lauf neu startet. Dieser Bericht selbst startet auf dem PR noch einen Lauf; gemergt wird erst, wenn auch der grün ist.

Verbrauch: keine Subagenten, keine Fremdmodell-Anfragen, kein lokaler Lean-Bau (nur Lesen der Quelltexte und ein Klon von `fallnlove/mm325_proof` außerhalb des Repos zum Lesen der Importliste und der `simp`-Lemmata), drei Actions-Läufe bis zu diesem Stand.
