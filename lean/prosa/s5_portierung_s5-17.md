# S5-17: Obere Schranke 26 für ⟨4,2,4⟩ in Lean und Aussage „Rang gleich 26“ (Bericht)

Auftrag S5-17, Stufe 5, Runde 4, Spur P (Portierungsauftrag mit Formalisierung). Zweig
`claude/project-thread-2y5tl9`, abgezweigt von `portierung` bei `9c364ba`. Ziel des Pull
Requests ist `portierung`. 0 Subagenten, 0 Fremdmodell-Anfragen.

## 1. Kurzfassung

- Neu: `lean/YangBounds/Upper4x2x4.lean` mit dem Verfahren aus B-010
  (`verfahren/4x2x4-r26-s001.json`, 26 Produkte, Koeffizienten in {−1, 0, 1}) und dem Satz
  `YangBounds.Upper4x2x4.rank_four_two_four_le_26 : tensorRank K 4 2 4 ≤ 26` für jeden Körper.
- Neu: `lean/YangBounds/Gleich444.lean` mit `YangBounds.Gleich444.rank_four_two_four_eq_26 :
  tensorRank K 4 2 4 = 26`, aus der neuen oberen und der vorhandenen unteren Schranke.
- Die Aussage der Challenge lautet jetzt „Rang gleich 26“:
  `MatMulRank.rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26`.
  Die Solution beweist sie; `comparator.json` nennt den neuen Namen; `lean_report.py` führt
  die drei neuen Sätze im Axiom-Bericht.
- Frischer lokaler Bau (neuer Klon, `lake exe cache get`, `lake build`) mit Exit 0, einziges
  `sorry` das gewollte der Challenge, `#print axioms` für alle neuen Sätze und den Endsatz nur
  `propext`, `Classical.choice`, `Quot.sound` (Abschnitt 4).
- Kein `native_decide`, kein `ofReduceBool`, kein eigenes Axiom. Die Challenge importiert
  weiter nur die vier Mathlib-Module von vorher und hat 97 Zeilen.

## 2. Beweisweg

Muster wie `YangBounds/Upper3x2x6.lean` (S1-12):

1. Die Tabellen `u`, `v`, `w` (je 26 Einträge) sind maschinell aus
   `verfahren/4x2x4-r26-s001.json` erzeugt (SHA-256
   `3a8a92145de7f220f6d12edd0666cc58bc631ca6e3512d67c59eb5ef3d955ae4`, gleich dem Wert in
   `behauptungen/B-010.md`), ein Eintrag je Produkt in der Reihenfolge der Datei, Bedeutung nach
   `verfahren/README.md` Abschnitt 2. Das Erzeugerskript hat dabei die Tensoridentität für alle
   1024 Indextupel in Python mit ganzen Zahlen nachgerechnet (nur Kontrolle, kein Beleg nach 5.2).
2. `tensor_identity`: über ℤ ist `∑ r, u r i j * v r p q * w r s t` gleich `1` für `i = s`,
   `j = p`, `q = t` und sonst `0`, für alle 1024 Tupel, geprüft vom Kern mit `decide +kernel`
   (kein `native_decide`, kein Zusatzaxiom).
3. `algorithm K : BilinearAlgorithm K 4 2 4 26`: Koeffizienten über den Ringhomomorphismus
   ℤ → K, Korrektheit aus der Tensoridentität durch Ausmultiplizieren. Keine Annahme über die
   Charakteristik.
4. `rank_four_two_four_le_26 := tensorRank_le (algorithm K)`.
5. `rank_four_two_four_eq_26 := le_antisymm (Upper4x2x4.rank_four_two_four_le_26 K)
   (Transponiert444.rank_four_two_four_ge_26 K)`.
6. In der Solution: `rw [tensorRank_eq_yangBounds]`, dann der Satz aus 5.

## 3. Neue und geänderte Aussagen und Definitionen (Wortlaut)

Keine vorhandene Aussage und keine vorhandene Definition der Kette ist im Wortlaut geändert.
Der gemeinsame Definitionsblock von `Challenge.lean` und `Definitions.lean`
(`BilinearAlgorithm`, `tensorRank`) ist unverändert. `lean/MatMulRank/Definitions.lean` ist
unverändert, weil die Challenge dieselben Importe behält.

### 3.1 Challenge (`lean/MatMulRank/Challenge.lean`), geändert

Alt:

```lean
theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 := by
  sorry
```

Neu:

```lean
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26 := by
  sorry
```

Dazu angepasst: Titelzeile des Moduldokuments („is at least 26“ → „is 26“), Abschnitt „The
claim“, der Docstring des Satzes, und in „Limitations“ ist der Punkt „Only the lower bound is
stated …“ entfallen; der Satz zu `sInf ∅ = 0` nennt jetzt `tensorRank K 4 2 4 = 26` statt
`26 ≤ tensorRank K 4 2 4` (mit leerer Menge wäre auch die neue Aussage falsch, nicht leer
wahr).

### 3.2 Solution (`lean/MatMulRank/Solution.lean`)

Unverändert im Wortlaut, weiter vorhanden: `MatMulRank.rank_four_two_four_ge_26 (K : Type u)
[Field K] : 26 ≤ tensorRank K 4 2 4`, `MatMulRank.tensorRank_eq_yangBounds`, die beiden
Umwandlungen. Nur der Docstring von `rank_four_two_four_ge_26` sagt jetzt „statement of the
Challenge up to S5-17“. Neuer Import `YangBounds.Gleich444`.

Neu:

```lean
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26
```

(Name `MatMulRank.rank_four_two_four_eq_26`, wörtlich die Aussage der Challenge.)

### 3.3 Neu in `lean/YangBounds/Upper4x2x4.lean` (Namensraum `YangBounds.Upper4x2x4`)

```lean
def u : Fin 26 → Fin 4 → Fin 2 → ℤ
def v : Fin 26 → Fin 2 → Fin 4 → ℤ
def w : Fin 26 → Fin 4 → Fin 4 → ℤ
theorem tensor_identity :
    ∀ (i : Fin 4) (j p : Fin 2) (q : Fin 4) (s : Fin 4) (t : Fin 4),
      ∑ r : Fin 26, u r i j * v r p q * w r s t = if i = s ∧ j = p ∧ q = t then 1 else 0
def intForm {a b : ℕ} (M : Fin a → Fin b → ℤ) : Matrix (Fin a) (Fin b) K →ₗ[K] K
theorem intForm_apply {a b : ℕ} (M : Fin a → Fin b → ℤ) (A : Matrix (Fin a) (Fin b) K) :
    intForm M A = ∑ i, ∑ j, (M i j : K) * A i j
def algorithm (K : Type u) [Field K] : BilinearAlgorithm K 4 2 4 26
theorem rank_four_two_four_le_26 (K : Type u) [Field K] :
    tensorRank K 4 2 4 ≤ 26
```

`intForm` und `intForm_apply` haben denselben Wortlaut wie in `Upper3x2x6` (eigener
Namensraum, keine Abhängigkeit zwischen den beiden Modulen).

### 3.4 Neu in `lean/YangBounds/Gleich444.lean` (Namensraum `YangBounds.Gleich444`)

```lean
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26
```

### 3.5 Weitere Dateien

- `lean/comparator.json`: `"theorem_names": ["MatMulRank.rank_four_two_four_ge_26"]` →
  `"theorem_names": ["MatMulRank.rank_four_two_four_eq_26"]`. Sonst unverändert.
- `.github/scripts/lean_report.py`: drei Einträge in `MAIN_THEOREMS` ergänzt
  (`YangBounds.Upper4x2x4.rank_four_two_four_le_26`,
  `YangBounds.Gleich444.rank_four_two_four_eq_26`, `MatMulRank.rank_four_two_four_eq_26`).
  Die neuen Module werden ohne Änderung mit importiert, weil das Skript alle Dateien unter
  `YangBounds/` einliest.
- `lean/README.md`: zwei Zeilen in der Dateitabelle.
- `.github/workflows/lean-project.yml`: unverändert; der Abgleich der Definitionen, der
  `sorry`-Bericht und der Axiom-Bericht laufen wie bisher.

## 4. Frischer lokaler Bau (Befehl und Ausgabe)

Toolchain: Lean 4.36.0 aus dem GitHub-Release `lean-4.36.0-linux.tar.zst` (Commit
`611c117bfaf7`), mit `elan toolchain link` eingebunden. Grund: `elan` lädt Toolchains von
`releases.lean-lang.org`, das aus dieser Sitzung gesperrt ist (Proxy, `CONNECT tunnel failed,
response 403`). Das ist die einzige gesperrte Domain, auf die ich gestoßen bin;
`cache.mathlib.org` und `github.com` waren erreichbar. Actions wurde nicht als Ersatz benutzt.

Neuer Klon des Zweigs bei Commit `ad6dba940fe1624ecfafec50593c3644e6d9df38` (Lean-Stand des
Pull Requests; der spätere Commit fügt nur diesen Bericht und `lean/README.md` hinzu). Skript:
`lake exe cache get`, `lake build`, Abgleich der Definitionen wie in `lean-project.yml`,
`lean_report.py sorry-report`, `gen-check` mit `lake env lean`, `axiom-report`, dazu eine Datei
mit `#print axioms` für die neuen Sätze. Ausgabe gekürzt nur um die `::notice`-Zeilen der
übrigen Hauptsätze:

```
commit: ad6dba940fe1624ecfafec50593c3644e6d9df38
start: 2026-11-26T16:18:04Z
$ lake exe cache get
No files to download
Decompressed 9116 already-cached file(s)
Completed successfully in 32358 ms!
exit 0
$ lake build
exit 0
Build completed successfully (4271 jobs).
13:warning: MatMulRank/Challenge.lean:94:8: declaration uses `sorry`
$ shared definitions diff
shared definitions and imports identical
$ lean_report.py sorry-report
========================================================================
SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
SORRY: 0 'sorry' token(s) in the sources outside comments
INTENDED: 1 declaration(s) and 1 token(s) in the Palomar Challenge (MatMulRank/Challenge.lean), deliberate hole, not counted above
  lean/MatMulRank/Challenge.lean:94
  lean/MatMulRank/Challenge.lean:95
========================================================================
$ lean_report.py gen-check + lake env lean
exit 0
$ lean_report.py axiom-report
TOTAL: STANDARD=65
AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.tensorRank_eq_yangBounds|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Upper4x2x4.rank_four_two_four_le_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Gleich444.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
$ lake env lean Neu.lean
'YangBounds.Upper4x2x4.tensor_identity' depends on axioms: [propext, Classical.choice, Quot.sound]
'YangBounds.Upper4x2x4.rank_four_two_four_le_26' depends on axioms: [propext, Classical.choice, Quot.sound]
'YangBounds.Gleich444.rank_four_two_four_eq_26' depends on axioms: [propext, Classical.choice, Quot.sound]
'MatMulRank.rank_four_two_four_eq_26' depends on axioms: [propext, Classical.choice, Quot.sound]
'MatMulRank.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
exit 0
$ grep native_decide / ofReduceBool / axiom in new files
YangBounds/Upper4x2x4.lean:29:   integers, checked by the Lean kernel (`decide +kernel`; this is not `native_decide`, it adds
end: 2026-11-26T16:20:47Z
```

Der einzige Treffer der letzten Suche ist ein Kommentar. Die Datei `Neu.lean` enthielt:

```lean
import YangBounds.Upper4x2x4
import YangBounds.Gleich444
import MatMulRank.Solution
#print axioms YangBounds.Upper4x2x4.tensor_identity
#print axioms YangBounds.Upper4x2x4.rank_four_two_four_le_26
#print axioms YangBounds.Gleich444.rank_four_two_four_eq_26
#print axioms MatMulRank.rank_four_two_four_eq_26
#print axioms MatMulRank.rank_four_two_four_ge_26
```

`decide +kernel` für `tensor_identity`: das ganze Modul `Upper4x2x4` baute in 6,8 s.
`leanchecker` und Comparator habe ich nicht laufen lassen (nicht Teil des Auftrags).

## 5. Was in Dateien anderer Aufträge nachzuführen ist (nicht angefasst)

Diese Dateien ändert S5-16 in derselben Runde oder sie gehören nicht zu meinem Auftrag:

- `lean/formalization.yaml`:
  - Kopfkommentar: „Palomar entry of MatMulRank.rank_four_two_four_ge_26“ → `…_eq_26`.
  - `project.name`: „… is at least 26 over every field“ → „… is 26 over every field“.
  - `project.description`: „proves … that R_K(<4,2,4>) >= 26“ und „Together with the upper
    bound 26 of Hopcroft and Kerr (1971), which is not formalised here, this gives
    R_K(<4,2,4>) = 26“ stimmen nicht mehr. Die obere Schranke ist jetzt formalisiert
    (`YangBounds/Upper4x2x4.lean`, Verfahren aus eigener Suche S2-03 mit dem Wert von
    Hopcroft und Kerr).
  - `sources`, Eintrag Hopcroft–Kerr, `note`: „Not formalised here and not part of the
    compared statement“ stimmt nicht mehr; die Schranke 26 ist Teil der Aussage und durch ein
    eigenes Verfahren mit 26 Produkten bewiesen (nicht aus dem Artikel übernommen).
  - `review.notes`: nennt nur den Satz zur unteren Schranke; die neue Aussage der Challenge
    hat noch keinen Aussagen-Abgleich nach 5.1.
- `.github/workflows/zweitlauf.yml`: `FINAL_THEOREM:
  YangBounds.Transponiert444.rank_four_two_four_ge_26` (Zeile 42) und der Kommentar in Zeile
  11. Ob der Zweitlauf künftig `MatMulRank.rank_four_two_four_eq_26` oder
  `YangBounds.Gleich444.rank_four_two_four_eq_26` prüfen soll, entscheidet der Orchestrator.
- `palomar/BELEGE.md`: Belege zu `comparator.json` (Abschnitt mit `theorem_names`), zum
  Axiom-Bericht und zur Challenge-Zeile 95 nennen den alten Satz; die Zeilennummer des
  gewollten `sorry` ist jetzt 94.
- `palomar/ANFORDERUNGEN.md` Zeile 6 nennt als Endsatz die untere Schranke.
- Der Aussagen-Abgleich nach 5.1 Punkt 3 für die geänderte Challenge (ein Prüfer und ein
  Fremdmodell) steht aus.
