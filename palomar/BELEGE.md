# Belege zu den Palomar-Anforderungen P-1 bis P-51

Auftrag S5-14, Stufe 5, Runde 3, Spur P (Portierungsauftrag). Zweig `claude/project-thread-5xtt3a`,
abgezweigt von `portierung` bei `4cad1ca2250fbdf7bd1369f7b411581895e5e10b`. Ziel des Pull Requests
ist `portierung`.

Diese Datei belegt jede Anforderung aus `palomar/ANFORDERUNGEN.md` einzeln. Ein Beleg ist ein
Befehl mit seiner wörtlichen Ausgabe. „erfüllt“ steht nur dort, wo ein Befehl und seine Ausgabe
hier abgedruckt sind. Nichts hier ist ein Prüfurteil im Sinne von Protokoll Abschnitt 5, und
nichts setzt einen Status.

## 0. Geprüfter Stand und Werkzeuge

| Gegenstand | Wert |
| --- | --- |
| Geprüfter Commit (Code-Stand) | `24845d3324bc3019aafed5781df85f5b89f3a755` auf `claude/project-thread-5xtt3a`. Der Commit dieser Datei ändert nur `palomar/BELEGE.md`; der Merge nach `portierung` bringt genau diesen Code-Stand dorthin |
| PalomarPolicy | `5bd35cddcfc940532bb5f55e399d68b49b0986a5` (dieselbe Fassung wie in `palomar/ANFORDERUNGEN.md`), `git clone https://github.com/PalomarRegistry/PalomarPolicy.git` |
| PalomarSubmission | `046554302064b2c83c2b924bea6db87fc5900c68` (dieselbe Fassung), `git clone https://github.com/PalomarRegistry/PalomarSubmission.git` |
| Lean | `Lean (version 4.36.0, x86_64-unknown-linux-gnu, commit 611c117bfaf7b7ae1cfcf246ce6fba31e8f509e9, Release)`, Archiv `lean-4.36.0-linux.zip` aus dem GitHub-Release, mit `elan toolchain link` eingebunden (elan selbst erreicht `release.lean-lang.org` nicht, Proxy 403) |
| Lake | `Lake version 5.0.0-src+611c117 (Lean version 4.36.0)` |
| Lizenzerkennung | `licensee` 10.0.0 laut `Gemfile` von PalomarSubmission, mit `bundle install` (rubygems.org) in ein Verzeichnis außerhalb des Repos geholt |

Zwei Arbeitskopien des Commits `24845d3`, beide mit `git clone --no-local` aus dem lokalen Repo und
`git checkout 24845d3…`:

- **unberührt**: kein `lake`-Aufruf, kein `.lake`. Darauf liefen alle Prüfungen der Dateien
  (Palomar prüft den Klon vor jedem Bau).
- **gebaut**: `lake exe cache get` und `lake build` (Abschnitt 1.4). Darauf liefen nur die
  Prüfungen, die die geholten Abhängigkeiten brauchen (Mathlib-Toolchain, Abhängigkeitsliste,
  Herkunft der Challenge-Quellen, LFS in den Abhängigkeiten).

Palomars Prüfcode lief lokal: ein Treiberskript außerhalb des Repos ruft die Funktionen aus
`scripts/verify_submission.py` und `scripts/submission_contract.py` von PalomarSubmission auf,
dieselben, die Palomars `prepare()` vor jedem Bau aufruft. Ersetzt ist nur das Klonen von GitHub:
Das Skript bekommt die beiden Arbeitskopien. Es gab keinen Aufruf von palomar-registry.org oder
submit.palomar-registry.org und keine Einreichung. `package_allowlist` holt dabei die offiziellen
Mathlib-Tags von github.com in die Arbeitskopie der Abhängigkeit (Remote `palomar-official`,
danach wieder entfernt).

## 1. Bau

### 1.1 Mathlib-Cache (Schritt 1)

Befehl im Verzeichnis `lean/` auf `portierung` (`4cad1ca`), Start 2026-11-26T15:39:53Z:

```
$ lake exe cache get
…
✔ [61/61] Built cache:exe (865ms)
Current branch: HEAD
Using cache from origin: (some leanprover-community/mathlib4)
Attempting to download 9117 file(s) from leanprover-community/mathlib4 cache at https://cache.mathlib.org/mathlib4-master
…
Downloaded: 9117 file(s) [attempted 9117/9117 = 100%, 608 KB/s]
Still decompressing downloaded files...
Decompressed 9117 file(s)
Already decompressed 9117 file(s)
```

Exit 0, Ende 2026-11-26T15:41:11Z. Der Cache lädt. (Ein einzelner `curl https://cache.mathlib.org/`
kurz zuvor bekam noch `CONNECT tunnel failed, response 403`.) Mathlib wurde nicht aus den
Quellen gebaut.

### 1.2 Stand je Modul

Gebaut in Importreihenfolge mit `lake build YangBounds.<Modul>`, nach jeder Korrektur erneut, bis
`lake build YangBounds.Transponiert444` und dann `lake build` (alle Bauziele: Bibliotheken
`YangBounds` und `MatMulRank`) mit Exit 0 endeten. Endstand im frischen Klon: Abschnitt 1.4.

| Nr. | Modul | Stand | Änderung in S5-14 |
| --- | --- | --- | --- |
| 1 | YangBounds.Basic | baut | Beweis von `standardAlgorithm.correct` (`simp` → `simp only [ite_true, and_self]; rfl`); neuer Hilfssatz `entryForm_apply` |
| 2 | YangBounds.CeilBound | baut | keine |
| 3 | YangBounds.YangN3Teil1 | baut | `LinearMap.coeFn_sum` → `FunLike.coe_sum`, `entryForm` → `entryForm_apply` in einem `simp` |
| 4 | YangBounds.YangN3Teil2 | baut | Beweis in `exists_suppPoly`: `Pi.single j 1` explizit in die `if`-Form umgeschrieben |
| 5 | YangBounds.YangN3Teil3 | baut | `Pi.prod` → `Function.prod_apply`; `le_or_lt` → `le_or_gt`; drei Beweisschritte (`field_simp` + `simp`, `π_eq_zero_iff` über `show`/`rw`, `finrank_Kbar` über `rfl`-Gleichung statt `simp only [Kbar, π]`) |
| 6 | YangBounds.YangN3 | baut | keine |
| 7 | YangBounds.Upper3x2x6 | baut | keine |
| 8 | YangBounds.YangN4Lemma13 | baut | `LinearMap.coeFn_sum` → `FunLike.coe_sum` (drei Stellen) |
| 9 | YangBounds.YangN4Haupt | baut | `LinearMap.coeFn_sum` → `FunLike.coe_sum` bzw. `LinearMap.sum_apply`; `finrank_Kbar`, `lemma8'` über Gleichungen per Definition statt `simp only [π]`; `field_simp` + `simp`; `Pi.single` wie in Nr. 4 |
| 10 | YangBounds.Statements | baut | keine |
| 11 | YangBounds.Lemma13Prime | baut | `LinearMap.coeFn_sum` → `FunLike.coe_sum` |
| 12 | YangBounds.SatzA444 | baut | keine |
| 13 | YangBounds.SatzB444Poly | baut | Schreibweise `coeff m p` → `p.coeff m` (Wortlaut von drei Aussagen, Abschnitt 1.3); `Finsupp.degree_add` → `map_add`; `unfold Finsupp.degree` → `rw [Finsupp.degree_apply]`; `Finsupp.single_eq_of_ne` → `Finsupp.single_apply, if_neg` |
| 14 | YangBounds.SatzB444 | baut | keine |
| 15 | YangBounds.SatzB444Final | baut | keine |
| 16 | YangBounds.SatzE444 | baut | zwei Beweisschritte (`eq_div_iff` statt `field_simp`); `open Fin.NatCast in` vor einem `obtain` (die Umwandlung `ℕ → Fin 4` ist in dieser Mathlib keine globale Instanz mehr) |
| 17 | YangBounds.SatzE444Buendel | baut | keine |
| 18 | YangBounds.LemmaP444 | baut | `Set.MapsTo … Tm.HasEigenvalue` → `Set.MapsTo … {μ \| Tm.HasEigenvalue μ}` (im Beweis); `le_or_lt` → `le_or_gt` |
| 19 | YangBounds.SatzC444Kern | baut | keine |
| 20 | YangBounds.SatzC444Generisch | baut | ein `simp only [RingHom.mapMatrix_apply, …]` durch `change` mit demselben Ziel ersetzt |
| 21 | YangBounds.Endsatz444 | baut | keine |
| 22 | YangBounds.Bruecke444 | baut | wie Nr. 20 |
| 23 | YangBounds.SatzF444 | baut | vier überzählige Taktiken entfernt (`ring` nach schließendem `field_simp`, ein `simp only`) |
| 24 | YangBounds.LemmaK444 | baut | Schreibweise `coeff m p` → `p.coeff m` (Wortlaut von zwei Aussagen, Abschnitt 1.3); `coeff_add` → `MvPolynomial.coeff_add` (jetzt `protected`); `Pi.smul_apply` bei Matrixzeilen durch `show … from rfl` ersetzt |
| 25 | YangBounds.LemmaZ444 | baut | ein wirkungsloses `simp only at hprod` entfernt |
| 26 | YangBounds.Transponiert444 | baut | Typangabe `Matrix (Fin 2) (Fin 2) L` bei `Mrot'`/`Mrot` im Beweis von `transNF_SN2`; `field_simp` + `simp` |
| – | YangBounds.S4BedingterAusschluss | baut | `coeff 0 G` → `G.coeff 0` (nur im Beweis) |
| – | MatMulRank.Challenge | baut, mit dem gewollten `sorry` | keine |
| – | MatMulRank.Definitions | baut | keine |
| – | MatMulRank.Solution | baut | keine |
| – | Wurzelmodul `YangBounds` (`lean/YangBounds.lean`) | übersetzt mit `lake env lean YangBounds.lean`, Exit 0; kein Bauziel (Glob `YangBounds.+`) | keine |
| – | `lean/Zweitlauf/B016Aussage.lean` | `lake env lean`, Exit 0, Axiome des Endsatzes `[propext, Classical.choice, Quot.sound]` | keine |
| – | `lean/Axioms.lean` | importiert das Wurzelmodul; mit vorübergehend gebautem Wurzelmodul (Commit `4b2826e`) `lake env lean Axioms.lean` Exit 0, 62 Berichte, alle `[propext, Classical.choice, Quot.sound]`. Auf dem Endstand ist das Wurzelmodul wieder kein Bauziel (Grund: Abschnitt 1.5), dort braucht `Axioms.lean` erst `lake env lean -o .lake/build/lib/lean/YangBounds.olean YangBounds.lean` | keine |

Erste Fehlermeldungen vor den Korrekturen (lokal, `lake build YangBounds.Transponiert444` auf
`4cad1ca` nach dem Cache): `Basic.lean:104:6: unsolved goals`, `YangN3Teil1.lean:66:20: Unknown
constant LinearMap.coeFn_sum`, `SatzB444Poly.lean:61:48: Function expected at coeff`,
`YangN4Lemma13`: `Unknown constant LinearMap.coeFn_sum`; weitere Module zeigten ihre Fehler erst,
als die Vorgänger bauten.

### 1.3 Geänderter Wortlaut von Aussagen und Definitionen

Keine Definition der Kette ist geändert. In Mathlib v4.36.0 ist `MvPolynomial` ein
`AddMonoidAlgebra`, und die Funktion `MvPolynomial.coeff m p` gibt es nicht mehr; der Koeffizient
heißt `p.coeff m` (dieselbe Abbildung, nur Argument-Reihenfolge und Punkt-Schreibweise). Ohne
Änderung las Lean `coeff` als neue implizite Variable. Betroffen sind fünf Aussagen:

| Datei, Satz | alter Wortlaut | neuer Wortlaut |
| --- | --- | --- |
| `SatzB444Poly.lean`, `coeff_lin` | `coeff (Finsupp.single l 1) (lin y) = y l` | `(lin y).coeff (Finsupp.single l 1) = y l` |
| `SatzB444Poly.lean`, `eq_lin_of_isHomogeneous_one` | `g = lin (fun l => coeff (Finsupp.single l 1) g)` | `g = lin (fun l => g.coeff (Finsupp.single l 1))` |
| `SatzB444Poly.lean`, `eq_C_of_mul` | `g = C (coeff 0 g)` | `g = C (g.coeff 0)` |
| `LemmaK444.lean`, `coeff_lin` | `coeff (Finsupp.single i 1) (lin a) = a i` | `(lin a).coeff (Finsupp.single i 1) = a i` |
| `LemmaK444.lean`, `coeff_lin_mul_lin` | `coeff m00 (lin a * lin b) = a 0 * b 0 ∧ coeff m11 (lin a * lin b) = a 1 * b 1 ∧ coeff m01 (lin a * lin b) = a 0 * b 1 + a 1 * b 0` | `(lin a * lin b).coeff m00 = a 0 * b 0 ∧ (lin a * lin b).coeff m11 = a 1 * b 1 ∧ (lin a * lin b).coeff m01 = a 0 * b 1 + a 1 * b 0` |

Neu hinzugekommen ist ein Satz (keine Änderung eines bestehenden):
`YangBounds.entryForm_apply (i : Fin a) (j : Fin b) (M : Matrix (Fin a) (Fin b) K) : entryForm i j M = M i j := rfl`
in `Basic.lean`, weil `simp [entryForm]` mit dem Modulsystem die Anwendung nicht mehr auswertet.

Alle Änderungen: `git diff 4cad1ca 24845d3 -- lean/YangBounds`.

### 1.4 Endstand im frischen Klon

Arbeitskopie „gebaut“ (Abschnitt 0), Commit `24845d3`, im Verzeichnis `lean/`:

```
$ lake exe cache get        # 2026-11-26T15:54Z bis 15:55:47Z
info: mathlib: materializing new dependency
info: mathlib: fetching revision 'fc4f59e577feb1a4956671bc04ac18aaaf8cd842' from https://github.com/leanprover-community/mathlib4
info: mathlib: checking out revision 'fc4f59e577feb1a4956671bc04ac18aaaf8cd842'
…
No files to download
Decompressed 9116 already-cached file(s)
Completed successfully in 36985 ms!
cache exit 0
$ lake build                # 15:55:47Z bis 15:57:21Z
…
info: YangBounds/Transponiert444.lean:678:0: 'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
✔ [4265/4267] Built MatMulRank.Solution (1.2s)
Build completed successfully (4267 jobs).
build exit 0
$ grep -E "^(✖|error)" build.log | wc -l
0
$ grep "declaration uses" build.log
warning: MatMulRank/Challenge.lean:95:8: declaration uses `sorry`
```

Die Schritte des Workflows `lean-project.yml` mit denselben Befehlen auf diesem Bau
(`lean_report.py` in der Fassung dieses Auftrags):

```
$ diff <(block MatMulRank/Challenge.lean) <(block MatMulRank/Definitions.lean) && diff <(hdr …) <(hdr …)
shared definitions and imports identical
$ python3 ../.github/scripts/lean_report.py sorry-report . build.log
========================================================================
SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
SORRY: 0 'sorry' token(s) in the sources outside comments
INTENDED: 1 declaration(s) and 1 token(s) in the Palomar Challenge (MatMulRank/Challenge.lean), deliberate hole, not counted above
  lean/MatMulRank/Challenge.lean:95
  lean/MatMulRank/Challenge.lean:96
========================================================================
$ python3 ../.github/scripts/lean_report.py gen-check . MainAxioms.lean && lake env lean MainAxioms.lean
…
'MatMulRank.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
AXIOM-RESULT|MatMulRank.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
'MatMulRank.tensorRank_eq_yangBounds' depends on axioms: [propext, Classical.choice, Quot.sound]
AXIOM-RESULT|MatMulRank.tensorRank_eq_yangBounds|propext, Classical.choice, Quot.sound
$ python3 ../.github/scripts/lean_report.py axiom-report axioms.txt | grep TOTAL
TOTAL: STANDARD=62
```

Alle 62 Hauptsätze der Liste in `lean_report.py`, darunter
`YangBounds.Transponiert444.rank_four_two_four_ge_26` und `MatMulRank.rank_four_two_four_ge_26`,
hängen nur von `propext`, `Classical.choice`, `Quot.sound` ab.

### 1.5 leanchecker

`leanchecker` aus der Toolchain 4.36.0, wie in `zweitlauf.yml`, über jedes `.olean` der
Projektbibliotheken (lokale Arbeitskopie, Stand `4b2826e`, gleicher Lean-Code wie `24845d3`):

```
$ for m in <alle Module unter .lake/build/lib/lean>; do lake env leanchecker $m; done
L4C-RESULT|MatMulRank.Challenge|exit=0|5s
L4C-RESULT|MatMulRank.Definitions|exit=0|5s
L4C-RESULT|MatMulRank.Solution|exit=0|4s
L4C-RESULT|YangBounds|exit=139|4s
L4C-RESULT|YangBounds.Basic|exit=0|5s
L4C-RESULT|YangBounds.Bruecke444|exit=0|5s
L4C-RESULT|YangBounds.CeilBound|exit=0|3s
L4C-RESULT|YangBounds.Endsatz444|exit=0|4s
L4C-RESULT|YangBounds.Lemma13Prime|exit=0|4s
L4C-RESULT|YangBounds.LemmaK444|exit=0|4s
L4C-RESULT|YangBounds.LemmaP444|exit=0|5s
L4C-RESULT|YangBounds.LemmaZ444|exit=0|5s
L4C-RESULT|YangBounds.S4BedingterAusschluss|exit=0|5s
L4C-RESULT|YangBounds.SatzA444|exit=0|4s
L4C-RESULT|YangBounds.SatzB444|exit=0|4s
L4C-RESULT|YangBounds.SatzB444Final|exit=0|4s
L4C-RESULT|YangBounds.SatzB444Poly|exit=0|5s
L4C-RESULT|YangBounds.SatzC444Generisch|exit=0|5s
L4C-RESULT|YangBounds.SatzC444Kern|exit=0|4s
L4C-RESULT|YangBounds.SatzE444|exit=0|4s
L4C-RESULT|YangBounds.SatzE444Buendel|exit=0|5s
L4C-RESULT|YangBounds.SatzF444|exit=0|4s
L4C-RESULT|YangBounds.Statements|exit=0|4s
L4C-RESULT|YangBounds.Transponiert444|exit=0|4s
L4C-RESULT|YangBounds.Upper3x2x6|exit=0|12s
L4C-RESULT|YangBounds.YangN3|exit=0|4s
L4C-RESULT|YangBounds.YangN3Teil1|exit=0|5s
L4C-RESULT|YangBounds.YangN3Teil2|exit=0|4s
L4C-RESULT|YangBounds.YangN3Teil3|exit=0|5s
L4C-RESULT|YangBounds.YangN4Haupt|exit=0|6s
L4C-RESULT|YangBounds.YangN4Lemma13|exit=0|4s
```

30 Module mit Exit 0. Das Wurzelmodul `YangBounds` (nur Importe, keine Deklaration) brachte
`leanchecker` zum Absturz (Exit 139, Speicherzugriffsfehler, zweimal wiederholt). Es war nur in
diesem Zwischenstand ein Bauziel; weil `zweitlauf.yml` jedes gebaute Modul prüft, hätte das den
Zweitlauf rot gemacht. Deshalb ist die Glob-Erweiterung mit Commit `24845d3` zurückgenommen.

`leanchecker --fresh MatMulRank.Solution`: `lake env leanchecker --fresh MatMulRank.Solution` (lokale Arbeitskopie, Stand `24845d3`, Start 2026-11-26T15:54Z) endete mit Exit 0 nach 440 s, ohne Ausgabe. `--fresh` prüft alle Deklarationen der Umgebung der Solution neu, also auch die ganze Kette und die gebrauchten Teile von Mathlib

### 1.6 Was der Bau nicht zeigt

- Comparator und NanoDa (Palomars Vergleich von Challenge und Solution, P-23, P-26) liefen
  nicht. Sie sind nicht in PalomarSubmission enthalten, sondern werden dort aus eigenen
  Repos geholt und in einer Sandbox gebaut. Ob `MatMulRank.rank_four_two_four_ge_26` in
  Challenge und Solution gleich elaboriert, ist damit offen.
- Der Bau in GitHub Actions auf diesem Stand ist nicht Teil dieses Auftrags (Fertig-Kriterium
  der Spur P). Er läuft nach dem Merge nach `portierung` automatisch.
- Der Bau lief nicht ohne Netz (P-12).

## 2. Ausgaben von Palomars Prüfcode

Treiberskript (außerhalb des Repos) mit den Funktionen von PalomarSubmission `0465543…`;
Arbeitskopie „unberührt“ für die Dateiprüfungen, „gebaut“ für die Abhängigkeiten.
Start 2026-11-26T15:57:51Z. Wörtliche Ausgabe:

```
--- supported_toolchain(lean/lean-toolchain)
OK {"toolchain": "leanprover/lean4:v4.36.0", "release_tag": "v4.36.0"}
--- validate_preservable_git_checkout(repo) [submodules, LFS]
OK 
--- tree_size(repo) <= MAX_SOURCE_BYTES
OK {"bytes": 7951814, "max": 524288000, "ok": true}
--- lakefile checks as in prepare()
OK {"lakefile": "lakefile.toml", "bytes": 656, "max": 1048576}
--- inspect_lean_sources(repo)
OK {"evidence": {"schema_version": 1, "module_required": true, "maximum_lines": 10000, "files_checked": 34}, "issues": ["versuche/s2-19-abgleich/Check.lean must begin with the module header keyword (ordinary comments may precede it)"]}
--- reject_committed_build_artifacts(repo)
OK 
--- manifest_packages(lean)
OK [{"name": "mathlib", "manifest_name": "mathlib", "repository": "leanprover-community/mathlib4", "url": "https://github.com/leanprover-community/mathlib4", "revision": "fc4f59e577feb1a4956671bc04ac18aaaf8cd842"}, {"name": "plausible", "manifest_name": "plausible", "repository": "leanprover-community/plausible", "url": "https://github.com/leanprover-community/plausible", "revision": "054b228ce0ac61d767c6e71ba73a24728f191b72"}, {"name": "LeanSearchClient", "manifest_name": "LeanSearchClient", "repository": "leanprover-community/LeanSearchClient", "url": "https://github.com/leanprover-community/LeanSearchClient", "revision": "4fb58e749ef3fc0395fe274f6cab70c2ea85f1c9"}, {"name": "importGraph", "manifest_name": "importGraph", "repository": "leanprover-community/import-graph", "url": "https://github.com/leanprover-community/import-graph", "revision": "8370c640afcd1cc3fb1cb9bf1560cc66eafee5e0"}, {"name": "proofwidgets", "manifest_name": "proofwidgets", "repository": "leanprover-community/ProofWidgets4", "url": "https://github.com/leanprover-community/ProofWidgets4", "revision": "2f0f3520daeac2d9310ff25b7a877a0e5cdaa203"}, {"name": "aesop", "manifest_name": "aesop", "repository": "leanprover-community/aesop", "url": "https://github.com/leanprover-community/aesop", "revision": "66ff77cf0c4c898799e4b94d14db55f7a02d0c5a"}, {"name": "Qq", "manifest_name": "Qq", "repository": "leanprover-community/quote4", "url": "https://github.com/leanprover-community/quote4", "revision": "ff055a2fcc835935e0ae607339b455a5f5896b4b"}, {"name": "batteries", "manifest_name": "batteries", "repository": "leanprover-community/batteries", "url": "https://github.com/leanprover-community/batteries", "revision": "b4b25a3886a16daacaf6615c2eea7170a6e8f458"}, {"name": "Cli", "manifest_name": "Cli", "repository": "leanprover/lean4-cli", "url": "https://github.com/leanprover/lean4-cli", "revision": "50810f72af7618bee62fe9800dc26e806c188703"}]
--- load_comparator_config(lean/comparator.json)
OK {"challenge_module": "MatMulRank.Challenge", "solution_module": "MatMulRank.Solution", "theorem_names": ["MatMulRank.rank_four_two_four_ge_26"], "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]}
--- load_formalization_metadata(lean/formalization.yaml)
FAIL FormalizationValidationError: formalization.yaml field project.authors must be a nonempty list
  issue: formalization.yaml field project.authors must be a nonempty list
  issue: formalization.yaml field project.responsible_maintainers must be a nonempty list
  issue: formalization.yaml sources for a source-based result must include a formalizes, adapts, or independently-proves relationship
--- repository_license_file(repo)
OK {"file": "LICENSE"}
--- detect_spdx_identifier(LICENSE) [licensee 10.0.0 via bundler]
OK "Apache-2.0"
--- check_mathlib_toolchain(built project)
OK [{"revision": "fc4f59e577feb1a4956671bc04ac18aaaf8cd842", "toolchain": "leanprover/lean4:v4.36.0"}]
--- shadowing_dependency(challenge_module)
OK {"challenge_module": "MatMulRank.Challenge", "shadowing_dependency": null}
--- package_allowlist(built project) [allowed-challenge-repositories.json, official revisions]
OK {"Cli": ["leanprover-community/mathlib4", "high"], "aesop": ["leanprover-community/mathlib4", "high"], "Qq": ["leanprover-community/mathlib4", "high"], "proofwidgets": ["leanprover-community/mathlib4", "high"], "importGraph": ["leanprover-community/mathlib4", "high"], "plausible": ["leanprover-community/mathlib4", "high"], "mathlib": ["leanprover-community/mathlib4", "high"], "batteries": ["leanprover-community/mathlib4", "high"], "LeanSearchClient": ["leanprover-community/mathlib4", "high"]}
--- audit_challenge_sources(Challenge, lean --src-deps)
OK {"source_count": 5, "dependencies": [{"repository": "leanprover-community/mathlib4", "provenance": "allowlisted"}], "untrusted_sources": [], "trust_level": "high"}
--- Challenge size (MAX_CHALLENGE_BYTES, MAX_CHALLENGE_LINES)
OK {"bytes": 4378, "max_bytes": 102400, "lines": 98, "max_lines": 1000}
```

`load_formalization_metadata` mit zwei vorbereiteten Fassungen (Kopien außerhalb des Repos):
Fassung A „original“ und Fassung B „source-based“ wie in `palomar/s5-08-bericht.md` Abschnitt 6,
dazu in beiden `authors: ["Example Person"]` und `responsible_maintainers: ["Example Person"]`
als Platzhalter nur für diesen Test:

```
<checkout>/lean/formalization.yaml FAIL formalization.yaml field project.authors must be a nonempty list ['formalization.yaml field project.authors must be a nonempty list', 'formalization.yaml field project.responsible_maintainers must be a nonempty list', 'formalization.yaml sources for a source-based result must include a formalizes, adapts, or independently-proves relationship']
<tmp>/A/formalization.yaml OK {"result_origin": null}
<tmp>/B/formalization.yaml OK {"result_origin": null}
```

Damit scheitert `formalization.yaml` genau an den drei Angaben, die nur der
Repository-Eigentümer macht, und an nichts anderem.

## 3. Befehle und Ausgaben

Arbeitskopie „unberührt“, Commit `24845d3` (Blöcke E0 bis E14), außer E2 und den Abhängigkeiten in
E5, die die geholten Pakete brauchen (Arbeitskopie „gebaut“, gleicher Commit).

```
### E0 commit
$ git rev-parse HEAD
24845d3324bc3019aafed5781df85f5b89f3a755
[exit 0]

### E1 toolchain
$ cat lean/lean-toolchain
leanprover/lean4:v4.36.0
[exit 0]

$ cat <PalomarSubmission>/toolchains.json
{
  "schema_version": 2,
  "minimum": "v4.35.0-rc2"
}
[exit 0]

### E2 Mathlib revision and its toolchain
$ python3 -c 'import json;[print(p["name"],p["type"],p["url"],p["rev"],p.get("inputRev")) for p in json.load(open("lean/lake-manifest.json"))["packages"]]'
mathlib git https://github.com/leanprover-community/mathlib4 fc4f59e577feb1a4956671bc04ac18aaaf8cd842 fc4f59e577feb1a4956671bc04ac18aaaf8cd842
plausible git https://github.com/leanprover-community/plausible 054b228ce0ac61d767c6e71ba73a24728f191b72 main
LeanSearchClient git https://github.com/leanprover-community/LeanSearchClient 4fb58e749ef3fc0395fe274f6cab70c2ea85f1c9 main
importGraph git https://github.com/leanprover-community/import-graph 8370c640afcd1cc3fb1cb9bf1560cc66eafee5e0 main
proofwidgets git https://github.com/leanprover-community/ProofWidgets4 2f0f3520daeac2d9310ff25b7a877a0e5cdaa203 main
aesop git https://github.com/leanprover-community/aesop 66ff77cf0c4c898799e4b94d14db55f7a02d0c5a master
Qq git https://github.com/leanprover-community/quote4 ff055a2fcc835935e0ae607339b455a5f5896b4b master
batteries git https://github.com/leanprover-community/batteries b4b25a3886a16daacaf6615c2eea7170a6e8f458 main
Cli git https://github.com/leanprover/lean4-cli 50810f72af7618bee62fe9800dc26e806c188703 v4.36.0
[exit 0]

$ git -C lean/.lake/packages/mathlib rev-parse HEAD
fatal: cannot change to 'lean/.lake/packages/mathlib': No such file or directory
[exit 128]

$ cat lean/.lake/packages/mathlib/lean-toolchain
cat: lean/.lake/packages/mathlib/lean-toolchain: No such file or directory
[exit 1]

$ git ls-remote --tags https://github.com/leanprover-community/mathlib4 refs/tags/v4.36.0
fc4f59e577feb1a4956671bc04ac18aaaf8cd842	refs/tags/v4.36.0
[exit 0]

### E3 lakefile
$ ls -la lean/lakefile.toml lean/lakefile.lean
ls: cannot access 'lean/lakefile.lean': No such file or directory
-rw-r--r-- 1 root root 656 Nov 26 15:57 lean/lakefile.toml
[exit 2]

$ python3 -c 'import tomllib;d=tomllib.load(open("lean/lakefile.toml","rb"));print(d["name"],[r["name"] for r in d["require"]],[l["name"] for l in d["lean_lib"]])'
yang_bounds ['mathlib'] ['YangBounds', 'MatMulRank']
[exit 0]

### E4 manifest committed and unchanged by lake
$ git ls-files lean/lake-manifest.json lean/lakefile.toml lean/lean-toolchain
lean/lake-manifest.json
lean/lakefile.toml
lean/lean-toolchain
[exit 0]

$ git status --porcelain -- lean/lake-manifest.json lean/lakefile.toml lean/lean-toolchain
[exit 0]

### E5 submodules, LFS
$ test -e .gitmodules && echo present || echo "no .gitmodules"
no .gitmodules
[exit 0]

$ git ls-files -s | awk '$1=="160000"' | wc -l
0
[exit 0]

$ git ls-files -z | git check-attr --stdin -z filter | tr "\0" "\n" | paste - - - | awk "\$3==\"lfs\"" | wc -l
0
[exit 0]

$ for d in lean/.lake/packages/*; do n=$(git -C $d ls-files -z | git -C $d check-attr --stdin -z filter | tr "\0" "\n" | paste - - - | awk "\$3==\"lfs\"" | wc -l); echo "$(basename $d) lfs=$n"; done
fatal: cannot change to 'lean/.lake/packages/*': No such file or directory
fatal: cannot change to 'lean/.lake/packages/*': No such file or directory
* lfs=0
[exit 0]

### E6 compiled artifacts outside .git and .lake
$ find . \( -name .git -o -name .lake \) -prune -o -type f \( -iname '*.olean' -o -iname '*.ilean' -o -iname '*.a' -o -iname '*.bc' -o -iname '*.dll' -o -iname '*.dylib' -o -iname '*.o' -o -iname '*.obj' -o -iname '*.so' -o -iname '*.trace' \) -print | wc -l
0
[exit 0]

### E7 size without .git and .lake
$ du -sb --exclude=.git --exclude=.lake . | cut -f1
7951814
[exit 0]

### E8 symbolic links
$ find . \( -name .git -o -name .lake \) -prune -o -type l -print | wc -l
0
[exit 0]

### E9 Lean files: count, module header, longest file
$ find . \( -name .git -o -name .lake \) -prune -o -name '*.lean' -type f -print | wc -l
34
[exit 0]

$ find . \( -name .git -o -name .lake \) -prune -o -name '*.lean' -type f -print | while read f; do grep -m1 -v '^\s*\(--.*\)\?$' "$f" | grep -q '^module\b' || echo "no module header: $f"; done
no module header: ./versuche/s2-19-abgleich/Check.lean
[exit 0]

$ find . \( -name .git -o -name .lake \) -prune -o -name '*.lean' -type f -print0 | xargs -0 wc -l | sort -n | tail -3
   941 ./lean/YangBounds/LemmaZ444.lean
  1416 ./lean/YangBounds/YangN4Haupt.lean
 13979 total
[exit 0]

### E10 Challenge
$ wc -lc lean/MatMulRank/Challenge.lean
  98 4378 lean/MatMulRank/Challenge.lean
[exit 0]

$ grep -n 'import' lean/MatMulRank/Challenge.lean
3:public import Mathlib.Algebra.Field.Defs
4:public import Mathlib.Algebra.Module.LinearMap.Defs
5:public import Mathlib.Data.Matrix.Mul
6:public import Mathlib.Order.Lattice.Nat
13:This is the statement file (Challenge) for the Palomar registry. It imports only Mathlib.
[exit 0]

$ grep -n -B1 '^structure\|^noncomputable def\|^def\|^theorem' lean/MatMulRank/Challenge.lean
68-tensors of rank one. -/
69:structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
--
80-convention `sInf ∅ = 0` is never used. -/
81:noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ :=
--
94-`26 ≤ R_K(⟨4, 2, 4⟩)`. -/
95:theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 := by
[exit 0]

$ ls -d lean/.lake/packages/*/MatMulRank lean/.lake/packages/*/MatMulRank.lean
ls: cannot access 'lean/.lake/packages/*/MatMulRank': No such file or directory
ls: cannot access 'lean/.lake/packages/*/MatMulRank.lean': No such file or directory
[exit 2]

### E11 comparator.json
$ cat lean/comparator.json
{
  "challenge_module": "MatMulRank.Challenge",
  "solution_module": "MatMulRank.Solution",
  "theorem_names": ["MatMulRank.rank_four_two_four_ge_26"],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]
}
[exit 0]

$ python3 -c 'import json;d=json.load(open("lean/comparator.json"));print(sorted(d))'
['challenge_module', 'permitted_axioms', 'solution_module', 'theorem_names']
[exit 0]

### E12 formalization.yaml
$ python3 -c 'import yaml;d=yaml.safe_load(open("lean/formalization.yaml"));p=d["project"];print("version",d.get("version"));print("name",len(p["name"]));print("description",len(p["description"]));print("authors",p["authors"]);print("maintainers",p["responsible_maintainers"]);print("license",p["license"]);print("classification",d["classification"]);print("methods",[m["method"] for m in d["automation"]["methods"]]);print("review.status",d["review"]["status"]);print("sources",[(s.get("type"),s["relationship"]) for s in d["sources"]]);print("repository" in d, [r["id"] for r in d.get("related_formalizations",[])])'
version v0.4
name 78
description 1042
authors []
maintainers []
license Apache-2.0
classification {'arxiv': ['cs.CC', 'math.AG', 'math.RA'], 'msc2020': ['68Q17', '15A69', '14N07']}
methods ['agent', 'other', 'other']
review.status agent-reviewed
sources [(None, 'TODO-REPOSITORY-OWNER'), ('paper', 'TODO-REPOSITORY-OWNER'), ('paper', 'background'), ('paper', 'background'), ('other', 'other')]
False ['https://github.com/fallnlove/mm325_proof']
[exit 0]

$ wc -c lean/formalization.yaml
7036 lean/formalization.yaml
[exit 0]

### E13 licence file
$ ls | grep -iE '^(LICENSE|LICENCE|COPYING|UNLICENSE|OFL)(\.md|\.markdown|\.txt)?$'
LICENSE
[exit 0]

$ head -3 LICENSE; wc -l LICENSE
                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/
201 LICENSE
[exit 0]

### E14 Lean files outside lean/
$ find . \( -name .git -o -name .lake -o -path ./lean \) -prune -o -name '*.lean' -print
./versuche/s2-19-abgleich/Check.lean
[exit 0]
```

Arbeitskopie „gebaut“:

```
### E2 Mathlib revision and its toolchain
$ python3 -c 'import json;[print(p["name"],p["type"],p["url"],p["rev"],p.get("inputRev")) for p in json.load(open("lean/lake-manifest.json"))["packages"]]'
mathlib git https://github.com/leanprover-community/mathlib4 fc4f59e577feb1a4956671bc04ac18aaaf8cd842 fc4f59e577feb1a4956671bc04ac18aaaf8cd842
plausible git https://github.com/leanprover-community/plausible 054b228ce0ac61d767c6e71ba73a24728f191b72 main
LeanSearchClient git https://github.com/leanprover-community/LeanSearchClient 4fb58e749ef3fc0395fe274f6cab70c2ea85f1c9 main
importGraph git https://github.com/leanprover-community/import-graph 8370c640afcd1cc3fb1cb9bf1560cc66eafee5e0 main
proofwidgets git https://github.com/leanprover-community/ProofWidgets4 2f0f3520daeac2d9310ff25b7a877a0e5cdaa203 main
aesop git https://github.com/leanprover-community/aesop 66ff77cf0c4c898799e4b94d14db55f7a02d0c5a master
Qq git https://github.com/leanprover-community/quote4 ff055a2fcc835935e0ae607339b455a5f5896b4b master
batteries git https://github.com/leanprover-community/batteries b4b25a3886a16daacaf6615c2eea7170a6e8f458 main
Cli git https://github.com/leanprover/lean4-cli 50810f72af7618bee62fe9800dc26e806c188703 v4.36.0
[exit 0]

$ git -C lean/.lake/packages/mathlib rev-parse HEAD
fc4f59e577feb1a4956671bc04ac18aaaf8cd842
[exit 0]

$ cat lean/.lake/packages/mathlib/lean-toolchain
leanprover/lean4:v4.36.0
[exit 0]

$ git ls-remote --tags https://github.com/leanprover-community/mathlib4 refs/tags/v4.36.0
fc4f59e577feb1a4956671bc04ac18aaaf8cd842	refs/tags/v4.36.0
[exit 0]

$ for d in lean/.lake/packages/*; do n=$(git -C $d ls-files -z | git -C $d check-attr --stdin -z filter | tr "\0" "\n" | paste - - - | awk "\$3==\"lfs\"" | wc -l); echo "$(basename $d) lfs=$n"; done
Cli lfs=0
LeanSearchClient lfs=0
Qq lfs=0
aesop lfs=0
batteries lfs=0
importGraph lfs=0
mathlib lfs=0
plausible lfs=0
proofwidgets lfs=0
```

Namensregel für Modulnamen (P-17), Regex aus `Pol/CONTRIBUTING.md` Z. 249–250:

```
$ python3 -c "import re;r=re.compile(r\"[A-Za-z_][A-Za-z0-9_']*\")
for m in ['MatMulRank.Challenge','MatMulRank.Solution']: print(m, all(r.fullmatch(c) for c in m.split('.')))
print('distinct', 'MatMulRank.Challenge'!='MatMulRank.Solution')"
MatMulRank.Challenge True
MatMulRank.Solution True
distinct True
```

## 4. Stand je Anforderung

Kürzel: **erfüllt** (mit Beleg), **nicht erfüllt** (mit Beleg), **braucht Bau** (hier: braucht
einen Lauf, der lokal nicht stattfand), **Eigentümer** (braucht eine Angabe des
Repository-Eigentümers), **redaktionell** (nur Palomars KI-Prüfung entscheidet, nicht vorab
belegbar), **Hinweis** (keine prüfbare Anforderung).

| Nr. | Stand | Beleg |
| --- | --- | --- |
| P-1 | erfüllt | E1: `leanprover/lean4:v4.36.0`; `toolchains.json` Minimum `v4.35.0-rc2`; Abschnitt 2 `supported_toolchain` OK, `release_tag` `v4.36.0` |
| P-2 | erfüllt | E2: Mathlib-Revision `fc4f59e…` = Tag `v4.36.0` (`git ls-remote`), deren `lean-toolchain` `leanprover/lean4:v4.36.0`; Abschnitt 2 `check_mathlib_toolchain` OK |
| P-3 | erfüllt | E1, E4: `lean/lean-toolchain` liegt im gewählten Projekt `lean` und ist eingecheckt |
| P-4 | erfüllt | E3: nur `lean/lakefile.toml` (656 Byte), `lakefile.lean` fehlt, TOML lesbar; Abschnitt 2 „lakefile checks“ OK |
| P-5 | erfüllt | E4: Manifest eingecheckt und nach `lake exe cache get` und `lake build` unverändert (`git status --porcelain` leer); Abschnitt 1.4: Bau ohne `lake update` mit Exit 0 |
| P-6 | erfüllt | E2: neun Git-Pakete, alle `https://github.com/owner/repo` ohne `.git`, Abfrage oder Fragment, `rev` je 40 Hexzeichen; Abschnitt 2 `manifest_packages` OK (prüft GitHub und vollen SHA) |
| P-7 | erfüllt | E5: keine `.gitmodules`, 0 Einträge mit Modus 160000; Abschnitt 2 `validate_preservable_git_checkout` OK |
| P-8 | erfüllt | E5: 0 Dateien mit `filter=lfs` im Repo; in allen neun Abhängigkeiten `lfs=0`; Abschnitt 2 `validate_preservable_git_checkout` OK |
| P-9 | erfüllt | E6: 0 Dateien mit den genannten Endungen außerhalb `.git`/`.lake`; Abschnitt 2 `reject_committed_build_artifacts` OK |
| P-10 | erfüllt | E7: 7.951.814 Byte; Abschnitt 2 `tree_size` 7.951.814 ≤ 524.288.000 |
| P-11 | erfüllt | E2: alle Abhängigkeiten öffentlich auf github.com, `mm325_proof` nicht im Manifest; Abschnitt 2 `package_allowlist` OK (alle neun Pakete gehören zur Mathlib-Schließung, offizielle Revision geprüft) |
| P-12 | Hinweis | Abschnitt 1.4: lokaler Bau aus dem Cache in 1 min 34 s (4 Kerne); ein Lauf ohne Netz fand nicht statt |
| P-13 | nicht erfüllt | Abschnitt 2 `inspect_lean_sources`: 34 Dateien geprüft, einziger Befund `versuche/s2-19-abgleich/Check.lean must begin with the module header keyword`; E9 dasselbe mit `grep`; E14: einzige Lean-Datei außerhalb von `lean/`. Alle 33 Dateien unter `lean/` haben den Modulkopf. Die Datei liegt außerhalb meines Bereichs (OF-1), nicht geändert |
| P-14 | erfüllt | E9: längste Datei `lean/YangBounds/YangN4Haupt.lean` mit 1.416 Zeilen; Abschnitt 2 `inspect_lean_sources` meldet keine Überlänge (Grenze 10.000) |
| P-15 | erfüllt | E8: 0 symbolische Verknüpfungen außerhalb `.git`/`.lake` |
| P-16 | erfüllt | Abschnitt 1.4: alle Module bauen mit `module`, `public import` und `@[expose] public section`; die Solution sieht alle gebrauchten Deklarationen |
| P-17 | erfüllt | Abschnitt 3 (Regex) und E11: `MatMulRank.Challenge` ≠ `MatMulRank.Solution`, jede Komponente passt |
| P-18 | erfüllt | E9/E10: `lean/MatMulRank/Challenge.lean` und `Solution.lean` liegen im Projekt, keine Verknüpfungen (E8); Abschnitt 1.4: Lake hat beide aus diesen Dateien gebaut (`Built MatMulRank.Solution`) |
| P-19 | erfüllt | E10: 98 Zeilen, 4.378 Byte; Abschnitt 2 „Challenge size“ (Grenzen 1.000 Zeilen, 102.400 Byte); auch unter der Warnschwelle 300 Zeilen / 32 KiB |
| P-20 | erfüllt | E10: vier `public import Mathlib.…`; Abschnitt 2 `audit_challenge_sources` mit `lean --src-deps`: `untrusted_sources: []`, `trust_level: high`, einzige Herkunft `leanprover-community/mathlib4` |
| P-21 | erfüllt | Abschnitt 2 `shadowing_dependency`: `null` für `MatMulRank.Challenge`; E10: kein `MatMulRank` an der Wurzel eines Pakets |
| P-22 | redaktionell | E10: nur Mathlib-Importe; vor `structure BilinearAlgorithm`, `def tensorRank` und dem Satz steht je ein Docstring (Zeilen 68, 80, 94 enden mit `-/`); Modul-Dokumentation nennt Aussage und Grenzen. Ob das genügt, entscheidet die KI-Prüfung |
| P-23 | braucht Bau | Comparator lief nicht (Abschnitt 1.6). Vorbereitet: gemeinsame Definitionen gleich (Abschnitt 1.4, `diff`) |
| P-24 | erfüllt | E11: genau die vier Pflichtschlüssel; Abschnitt 2 `load_comparator_config` OK |
| P-25 | erfüllt | E11: `permitted_axioms` = `propext`, `Quot.sound`, `Classical.choice`; Abschnitt 1.4: der verglichene Satz der Solution hängt genau von diesen ab |
| P-26 | erfüllt für Bau und Axiom-Bericht; Comparator braucht Bau | Abschnitt 1.4: `MatMulRank.rank_four_two_four_ge_26` (Solution) `[propext, Classical.choice, Quot.sound]`, kein `sorryAx`, kein `Lean.ofReduceBool`; einziges `sorry` des Baus ist das gewollte der Challenge; `leanchecker` Abschnitt 1.5. Die Bestätigung durch Comparator und NanoDa fehlt |
| P-27 | erfüllt | E11: `lean/comparator.json` im gewählten Projekt, endet auf `.json`, eine Konfiguration |
| P-28 | entfällt | E11: kein `definition_names` |
| P-29 | erfüllt | E12: 7.036 Byte, `version v0.4`; Abschnitt 2: Palomars Lader (`UniqueKeySafeLoader`) liest die Datei und meldet nur die drei Angaben des Eigentümers; Fassungen A und B bestehen |
| P-30 | erfüllt | E12: `project.name` 78 Zeichen |
| P-31 | erfüllt | E12: `project.description` 1.042 Zeichen |
| P-32 | Eigentümer (nicht erfüllt) | E12: `authors []`; Abschnitt 2: `project.authors must be a nonempty list` |
| P-33 | erfüllt | E12: `license Apache-2.0`; Abschnitt 2 `detect_spdx_identifier` → `"Apache-2.0"` |
| P-34 | erfüllt | E12: `arxiv [cs.CC, math.AG, math.RA]`, `msc2020 [68Q17, 15A69, 14N07]`; Abschnitt 2: Fassungen A und B bestehen Palomars Lader, der die Codes gegen seine Listen prüft. Die Auswahl ist ein Vorschlag (S5-08) |
| P-35 | erfüllt | E12: `methods ['agent', 'other', 'other']`; Fassungen A und B bestehen |
| P-36 | erfüllt | E12: `review.status agent-reviewed`; Fassungen A und B bestehen. Der Text von `review.notes` nennt den Bau auf Lean 4.36.0 noch als ausstehend und ist nach Actions-Lauf und Aussagen-Abgleich nachzuführen (Abschnitt 6) |
| P-37 | Eigentümer (nicht erfüllt) | E12: `maintainers []`; Abschnitt 2: `project.responsible_maintainers must be a nonempty list` |
| P-38 | Eigentümer (nicht erfüllt) | E12: zwei `relationship` sind `TODO-REPOSITORY-OWNER`; Abschnitt 2 meldet die Herkunft; Fassungen A und B bestehen |
| P-39 | Eigentümer (nicht erfüllt) | Abschnitt 2: `sources for a source-based result must include a formalizes, adapts, or independently-proves relationship`; Fassung A (original) und B (source-based) bestehen |
| P-40 | erfüllt | E12: Schlüssel `repository` fehlt (`False`) |
| P-41 | erfüllt | E12: ein Eintrag mit `id` `https://github.com/fallnlove/mm325_proof` |
| P-42 | redaktionell | Modul-Dokumentation der Challenge und `formalization.yaml` enthalten Aussage, Grenzen, Quellen und KI-Beteiligung; `lean/README.md` nennt Palomar-Dateien nicht. Nicht geändert (Text, nicht Mechanik) |
| P-43 | erfüllt | E13: genau eine Lizenzdatei `LICENSE`, 201 Zeilen, Apache License 2.0; Abschnitt 2 `repository_license_file` OK, `detect_spdx_identifier` `Apache-2.0` = `project.license` |
| P-44 | redaktionell | nicht vorab belegbar |
| P-45 | redaktionell | nicht vorab belegbar |
| P-46 | redaktionell | nicht vorab belegbar |
| P-47 | Eigentümer | Berechtigung des Einreichers |
| P-48 | Eigentümer | Anmeldung im Browser; kein Agent legt Tag oder Gist an |
| P-49 | Eigentümer | Angaben bei der Einreichung: `Justus42/matmul-rank-n2m`, voller Commit-SHA, Projekt `lean`, Konfiguration `lean/comparator.json` |
| P-50 | Hinweis | – |
| P-51 | Hinweis | Pfade `lean` und `lean/comparator.json` stehen; Modulnamen `MatMulRank.Challenge`, `MatMulRank.Solution` |

Zählung: erfüllt 32 (P-1 bis P-11, P-14 bis P-21, P-24, P-25, P-27, P-29 bis P-31, P-33 bis P-36,
P-40, P-41, P-43), dazu P-26 teilweise; nicht erfüllt 1 (P-13, außerhalb von `lean/`); braucht
Bau 1 (P-23) und P-26 für Comparator; Eigentümer 7 (P-32, P-37, P-38, P-39, P-47, P-48, P-49);
redaktionell 5 (P-22, P-42, P-44, P-45, P-46); entfällt 1 (P-28); Hinweis 3 (P-12, P-50, P-51).

## 5. Änderungen dieses Auftrags

| Datei | Änderung |
| --- | --- |
| `lean/YangBounds/*.lean` (17 Dateien) | Anpassungen an Lean 4.36.0 und Mathlib v4.36.0, Abschnitt 1.2; Wortlaut Abschnitt 1.3 |
| `.github/scripts/lean_report.py` | (1) `MatMulRank.rank_four_two_four_ge_26` und `MatMulRank.tensorRank_eq_yangBounds` in der Liste der Hauptsätze; der Axiom-Bericht importiert zusätzlich `MatMulRank.Definitions` und `MatMulRank.Solution` (nicht die Challenge, weil sie denselben Satznamen deklariert). (2) Der `sorry`-Bericht führt das gewollte `sorry` der Challenge getrennt und zählt es nicht mit; `MatMulRank/` wird mit durchsucht. (3) Lean 4.36.0 schreibt „declaration uses `sorry`“ mit Backticks statt Apostrophen; das Skript suchte nur die alte Form und hätte jedes `sorry` übersehen. Es erkennt jetzt beide |
| `lean/lakefile.toml` | in Commit `4b2826e` Wurzelmodul als Bauziel, in `24845d3` zurückgenommen (Abschnitt 1.5); netto unverändert |
| `palomar/BELEGE.md` | diese Datei |

Nicht geändert: `versuche/s2-19-abgleich/Check.lean` (außerhalb des Bereichs, P-13 bleibt offen),
`lean/formalization.yaml` (Felder des Eigentümers; Text von `review.notes` siehe Abschnitt 6),
`lean/README.md`, die Workflows.

## 6. Offene Punkte

1. **P-13**: `versuche/s2-19-abgleich/Check.lean` hat keinen Modulkopf. Palomars eigener Code
   bemängelt genau diese Datei. Zu ändern nur durch einen Auftrag, der `versuche/` ändern darf
   (OF-1 aus `palomar/ANFORDERUNGEN.md`).
2. **P-32, P-37, P-38, P-39**: Autoren, verantwortliche Betreuer und die Wahl „original“ oder
   „source-based“ füllt der Repository-Eigentümer. Beide Fassungen bestehen Palomars Lader.
3. **P-23, P-26**: Comparator- und NanoDa-Lauf fehlen.
4. **Actions**: Grüner Lauf von `lean-project.yml` und `zweitlauf.yml` auf `portierung` nach dem
   Merge steht aus (Fertig-Kriterium). Lokal bauen alle Bauziele, und alle 30 gebauten Module
   bestehen `leanchecker`.
5. **`lean/formalization.yaml`, `review.notes`**: nennt den Bau auf Lean 4.36.0 und den
   Aussagen-Abgleich der Challenge als ausstehend. Nach Actions-Lauf und Abgleich nachführen.
6. **`lean/Axioms.lean`** importiert das Wurzelmodul, das kein Bauziel ist (Abschnitt 1.2).
7. **P-42**: `lean/README.md` erwähnt die Palomar-Dateien nicht.
8. Warnungen im Bau (keine Fehler): `push_neg` ist veraltet („Prefer using `push Not`“),
   ungenutzte `simp`-Argumente, veraltete Namen wie `Matrix.linearIndependent_rows_iff_isUnit`.

## 7. Commits, Zeiten, Verbrauch

| Commit | Zeit (UTC, Commit-Zeit) | Betreff |
| --- | --- | --- |
| `dd278af` | 2026-11-26T15:44:14Z | S5-14: Basic und YangN3 an Lean 4.36.0 und Mathlib v4.36.0 angepasst |
| `195974f` | 2026-11-26T15:46:17Z | S5-14: YangN4Haupt, SatzB444Poly und coeff-Schreibweise an Mathlib v4.36.0 angepasst |
| `e60c82d` | 2026-11-26T15:47:37Z | S5-14: SatzE444 und SatzC444Generisch an Mathlib v4.36.0 angepasst |
| `81c2262` | 2026-11-26T15:49:03Z | S5-14: LemmaP444, Bruecke444, LemmaK444 und SatzF444 an Mathlib v4.36.0 angepasst |
| `a66eb46` | 2026-11-26T15:50:16Z | S5-14: LemmaZ444 und Transponiert444 an Mathlib v4.36.0 angepasst |
| `4b2826e` | 2026-11-26T15:51:35Z | S5-14: Axiom- und sorry-Bericht um Palomar-Solution und Challenge ergänzt, Wurzelmodul als Bauziel |
| `24845d3` | 2026-11-26T15:54:21Z | S5-14: Wurzelmodul YangBounds wieder ohne eigenes Bauziel |
| (dieser Bericht) | siehe Git | S5-14: Belege zu den Palomar-Anforderungen |

Verbrauch: keine Subagenten, keine Fremdmodell-Anfrage. Rechenblöcke: `lake exe cache get`
(etwa 1,5 min), Bau der Kette in Stufen (je unter 1 min), frischer Klon mit Cache und Bau
(etwa 3,5 min), `leanchecker` über alle Module (etwa 3 min), `leanchecker --fresh` (siehe
Abschnitt 1.5, Zeitgrenze 25 min). Kein Block über 30 Minuten.

Eingeblendetes Projektgedächtnis: der Index (`MEMORY.md`) mit Hinweisen zum Projekt, zu Rollen,
Fremdmodell, Literaturwache und Merge-Verhalten; keine Prüfurteile. Ich habe nichts ins
Gedächtnis geschrieben.
