# Belege zu den Palomar-Anforderungen P-1 bis P-51

Angelegt in Auftrag S5-14 (Stufe 5, Runde 3), Nachtrag S5-16 (Runde 4), **nachgeführt in Auftrag
S5-21** (Stufe 5, Runde 5, Spur P, Portierungsauftrag). Zweig `claude/project-thread-b5jw6l`,
abgezweigt von `portierung` bei `023a21a` (Merge von S5-16). Ziel des Pull Requests ist
`portierung`.

**Was S5-21 nachführt.** Seit S5-17 (Merge `03d49c7`) lautet die Aussage der Challenge
`MatMulRank.rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26`. Die Belege
von S5-14 und S5-16 bezogen sich auf die frühere Aussage `26 ≤ tensorRank K 4 2 4` (Commits
`24845d3` und `9c364ba`). In S5-21 sind **alle** Befehle dieser Datei neu gelaufen, auf einem
frischen Klon des Commits `6d44bb1` (Abschnitt 0). Ausnahme sind nur die Abschnitte 1.1 bis 1.3:
Sie beschreiben den Verlauf der Portierung in S5-14 und sind als solcher stehen geblieben. Die
Ausgaben von S5-14 und S5-16 stehen weiter in der Git-Historie dieser Datei (Stand `023a21a`).

**Nachtrag S5-22** (Stufe 5, Runde 6): Der Repository-Eigentümer hat am 26.11.2026 die ihm
vorbehaltenen Angaben gemacht. Sie stehen jetzt in `lean/formalization.yaml`, und
`versuche/s2-19-abgleich/Check.lean` heißt `Check.lean.txt`. Palomars Prüfcode ist dafür auf dem
Commit `4e2c720` neu gelaufen (Abschnitt 8). Die Zeilen P-13, P-29, P-32, P-35 bis P-39 in
Abschnitt 4 und die Zählung sind nachgeführt; alle übrigen Zeilen gelten unverändert mit ihrem Beleg
auf `6d44bb1`, weil Lean-Code, `comparator.json`, Lakefile, Manifest und Toolchain sich nicht
geändert haben.

**Nachtrag N-01** (Nacharbeit vor der Einreichung): Nach den neuen Importlisten aus N-06 und der
überarbeiteten `lean/formalization.yaml` sind Bau, Berichte, `leanchecker`, Comparator mit NanoDa,
`con-ron` und Palomars Prüffunktionen auf dem Commit `a1e0deb` neu gelaufen (Abschnitt 9). Die
Abschnitte 0 bis 8 bleiben als Belege ihres Stands stehen; Abschnitt 4 ist nicht nachgeführt.

Diese Datei belegt jede Anforderung aus `palomar/ANFORDERUNGEN.md` einzeln. Ein Beleg ist ein
Befehl mit seiner wörtlichen Ausgabe. „erfüllt“ steht nur dort, wo ein Befehl und seine Ausgabe
hier abgedruckt sind. Nichts hier ist ein Prüfurteil im Sinne von Protokoll Abschnitt 5, und
nichts setzt einen Status.

## 0. Geprüfter Stand und Werkzeuge

| Gegenstand | Wert |
| --- | --- |
| Geprüfter Commit | `6d44bb1d5ec0e560f1cf5f8746e15c3ea9c52c55` auf `claude/project-thread-b5jw6l` (Commit-Zeit 2026-11-26T16:53:07Z). Gegenüber `portierung` bei `023a21a` geändert: nur `lean/formalization.yaml` und `.github/workflows/zweitlauf.yml` (Abschnitt 5). Lean-Code, `comparator.json`, Lakefile, Manifest und Toolchain sind dieselben wie auf `023a21a`. Der spätere Commit dieser Datei ändert nur `palomar/BELEGE.md` |
| PalomarPolicy | `5bd35cddcfc940532bb5f55e399d68b49b0986a5` (dieselbe Fassung wie in `palomar/ANFORDERUNGEN.md`), `git clone https://github.com/PalomarRegistry/PalomarPolicy.git` am 2026-11-26 gegen 16:55Z |
| PalomarSubmission | `046554302064b2c83c2b924bea6db87fc5900c68` (dieselbe Fassung), `git clone https://github.com/PalomarRegistry/PalomarSubmission.git`; `toolchains.json` Minimum `v4.35.0-rc2` |
| Lean | `Lean (version 4.36.0, x86_64-unknown-linux-gnu, commit 611c117bfaf7b7ae1cfcf246ce6fba31e8f509e9, Release)`, Archiv `lean-4.36.0-linux.zip` aus dem GitHub-Release, mit `elan toolchain link` eingebunden |
| Lake | `Lake version 5.0.0-src+611c117 (Lean version 4.36.0)` |
| elan | `elan-x86_64-unknown-linux-gnu.tar.gz` v4.2.3 aus dem GitHub-Release, SHA-256 `df0b2b3a…a8b2`, gleich dem Wert in PalomarSubmission `.github/workflows/submission.yml` Z. 209 |
| bwrap | `bubblewrap 0.9.0` (Ubuntu-Paket); Palomar baut v0.12.0 aus den Quellen |
| Lizenzerkennung | `licensee` 10.0.0 laut `Gemfile` von PalomarSubmission, mit `bundle install` (rubygems.org) außerhalb des Repos |

Keine Domain war gesperrt, die für diese Läufe nötig war. Benutzt wurden `github.com` (Klone,
Releases, `git ls-remote`), `cache.mathlib.org` (`lake exe cache get`) und `rubygems.org`.
`release.lean-lang.org` wurde nicht angefragt (Toolchain aus dem GitHub-Release).

Zwei Arbeitskopien des Commits `6d44bb1`, beide mit `git clone --no-local` aus dem lokalen Repo und
`git checkout 6d44bb1…`, danach `git status --porcelain` leer:

- **unberührt**: kein `lake`-Aufruf, kein `.lake`. Darauf liefen alle Prüfungen der Dateien
  (Palomar prüft den Klon vor jedem Bau).
- **gebaut**: `lake exe cache get` und `lake build` (Abschnitt 1.4). Darauf liefen Bau, Berichte,
  `leanchecker`, Comparator und die Prüfungen, die die geholten Abhängigkeiten brauchen.

Palomars Prüfcode lief lokal: ein Treiberskript außerhalb des Repos ruft die Funktionen aus
`scripts/verify_submission.py`, `scripts/submission_contract.py` und
`scripts/source_requirements.py` von PalomarSubmission auf, dieselben, die Palomars `prepare()` und
`execute` aufrufen. Ersetzt ist nur das Klonen von GitHub: Das Skript bekommt die beiden
Arbeitskopien; die Quellabhängigkeiten der Challenge liefert `lake env lean --src-deps` wie in
`lean_source_dependencies` (Z. 4833–4865), aber ohne Palomars Sandbox. Es gab keinen Aufruf von
palomar-registry.org oder submit.palomar-registry.org, keinen Aufruf des Einreichformulars und
keine Einreichung. `package_allowlist` holt dabei die offiziellen Mathlib-Tags von github.com in
die Arbeitskopie der Abhängigkeit (Remote `palomar-official`, danach mit `git remote remove`
wieder entfernt).

## 1. Bau

### 1.1 bis 1.3 Verlauf der Portierung (Stand S5-14, nicht neu gelaufen)

Die folgenden drei Unterabschnitte sind wörtlich aus S5-14 übernommen. Sie beschreiben, wie die
Kette auf Lean 4.36.0 kam, und beziehen sich auf `4cad1ca` und `24845d3`. Seitdem sind zwei Module
hinzugekommen (S5-17): `YangBounds.Upper4x2x4` und `YangBounds.Gleich444`; beide bauen auf
`6d44bb1` (Abschnitte 1.4 und 1.5). Ihr Wortlaut steht in `lean/prosa/s5_portierung_s5-17.md`
Abschnitt 3.

#### 1.1 Mathlib-Cache (Schritt 1)

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

#### 1.2 Stand je Modul

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

#### 1.3 Geänderter Wortlaut von Aussagen und Definitionen

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

### 1.4 Frischer Klon: Cache, Bau, Berichte (S5-21)

Arbeitskopie „gebaut“, Commit `6d44bb1`, im Verzeichnis `lean/`:

```
commit: 6d44bb1d5ec0e560f1cf5f8746e15c3ea9c52c55
start: 2026-11-26T16:54:00Z
$ lean --version
Lean (version 4.36.0, x86_64-unknown-linux-gnu, commit 611c117bfaf7b7ae1cfcf246ce6fba31e8f509e9, Release)
Lake version 5.0.0-src+611c117 (Lean version 4.36.0)
$ lake exe cache get
info: mathlib: materializing new dependency
info: mathlib: fetching revision 'fc4f59e577feb1a4956671bc04ac18aaaf8cd842' from https://github.com/leanprover-community/mathlib4
info: mathlib: checking out revision 'fc4f59e577feb1a4956671bc04ac18aaaf8cd842'
…
Current branch: HEAD
Using cache from origin: (some leanprover-community/mathlib4)
Attempting to download 9117 file(s) from leanprover-community/mathlib4 cache at https://cache.mathlib.org/mathlib4-master
Downloaded: 9117 file(s) [attempted 9117/9117 = 100%, 431 KB/s]
Still decompressing downloaded files...
Decompressed 9117 file(s)
Already decompressed 9117 file(s)
exit 0
cache end: 2026-11-26T16:55:06Z
$ lake build
…
✔ [4224/4271] Built YangBounds.Upper4x2x4 (10s)
info: YangBounds/Transponiert444.lean:678:0: 'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
✔ [4266/4271] Built YangBounds.Gleich444 (798ms)
✔ [4269/4271] Built MatMulRank.Solution (859ms)
Build completed successfully (4271 jobs).
exit 0
build end: 2026-11-26T16:56:09Z
```

Danach die Schritte des Workflows `lean-project.yml` mit denselben Befehlen auf diesem Bau
(`build.log` ist die Ausgabe von `lake build` oben):

```
$ git status --porcelain    # nach cache get und build
[exit 0]
$ grep -cE "^(✖|error)" build.log
0
$ grep "declaration uses" build.log
warning: MatMulRank/Challenge.lean:94:8: declaration uses `sorry`
$ shared definitions
shared definitions and imports identical
$ python3 ../.github/scripts/lean_report.py sorry-report . build.log
========================================================================
SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
SORRY: 0 'sorry' token(s) in the sources outside comments
INTENDED: 1 declaration(s) and 1 token(s) in the Palomar Challenge (MatMulRank/Challenge.lean), deliberate hole, not counted above
  lean/MatMulRank/Challenge.lean:94
  lean/MatMulRank/Challenge.lean:95
========================================================================
[exit 0]
$ python3 ../.github/scripts/lean_report.py gen-check . MainAxioms.lean && lake env lean MainAxioms.lean
[exit 0]
$ python3 ../.github/scripts/lean_report.py axiom-report axioms.txt | grep TOTAL
TOTAL: STANDARD=65
$ grep -c '^AXIOM-RESULT' axioms.txt
65
$ grep '^AXIOM-RESULT' axioms.txt | grep -vc '|propext, Classical.choice, Quot.sound$'
0
$ grep -c 'sorryAx\|ofReduceBool' axioms.txt
0
$ grep -E 'AXIOM-RESULT\|(MatMulRank|YangBounds\.(Gleich444|Upper4x2x4|Transponiert444)\.rank)' axioms.txt
AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26_of_vielePunkte|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26_of_hyp'|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.tensorRank_eq_yangBounds|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Upper4x2x4.rank_four_two_four_le_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Gleich444.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
```

Alle 65 Hauptsätze der Liste in `lean_report.py` hängen nur von `propext`, `Classical.choice`,
`Quot.sound` ab, darunter der Satz der Solution `MatMulRank.rank_four_two_four_eq_26`, die beiden
Sätze `YangBounds.Gleich444.rank_four_two_four_eq_26` und
`YangBounds.Upper4x2x4.rank_four_two_four_le_26` und der Endsatz der unteren Schranke
`YangBounds.Transponiert444.rank_four_two_four_ge_26`. Das einzige `sorry` ist das gewollte der
Challenge (jetzt Zeile 94 und 95, vorher 95 und 96).

**`#print axioms` wie im ergänzten Zweitlauf** (Schritt „#print axioms for the final theorem and
the statement 26“ in `zweitlauf.yml` dieses Commits, dieselben Befehle lokal):

```
$ cat ZweitlaufAxioms.lean
import YangBounds.Transponiert444
import YangBounds.Gleich444
import MatMulRank.Solution
#check @YangBounds.Transponiert444.rank_four_two_four_ge_26
#print axioms YangBounds.Transponiert444.rank_four_two_four_ge_26
#check @YangBounds.Gleich444.rank_four_two_four_eq_26
#print axioms YangBounds.Gleich444.rank_four_two_four_eq_26
#check @MatMulRank.rank_four_two_four_eq_26
#print axioms MatMulRank.rank_four_two_four_eq_26
$ lake env lean ZweitlaufAxioms.lean
YangBounds.Transponiert444.rank_four_two_four_ge_26 : ∀ (K : Type u_1) [inst : Field K],
  26 ≤ YangBounds.tensorRank K 4 2 4
'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
YangBounds.Gleich444.rank_four_two_four_eq_26 : ∀ (K : Type u_1) [inst : Field K], YangBounds.tensorRank K 4 2 4 = 26
'YangBounds.Gleich444.rank_four_two_four_eq_26' depends on axioms: [propext, Classical.choice, Quot.sound]
MatMulRank.rank_four_two_four_eq_26 : ∀ (K : Type u_1) [inst : Field K], MatMulRank.tensorRank K 4 2 4 = 26
'MatMulRank.rank_four_two_four_eq_26' depends on axioms: [propext, Classical.choice, Quot.sound]
[exit 0]
```

### 1.5 leanchecker (S5-21)

`leanchecker` aus der Toolchain 4.36.0, wie in `zweitlauf.yml`, über jedes `.olean` der beiden
Projektbibliotheken (Arbeitskopie „gebaut“, Commit `6d44bb1`), danach `--fresh` auf die Solution:

```
$ for m in <alle Module unter .lake/build/lib/lean>; do lake env leanchecker $m; done
start: 2026-11-26T16:56:38Z
L4C-RESULT|MatMulRank.Challenge|exit=0|3s
L4C-RESULT|MatMulRank.Definitions|exit=0|3s
L4C-RESULT|MatMulRank.Solution|exit=0|3s
L4C-RESULT|YangBounds.Basic|exit=0|4s
L4C-RESULT|YangBounds.Bruecke444|exit=0|3s
L4C-RESULT|YangBounds.CeilBound|exit=0|3s
L4C-RESULT|YangBounds.Endsatz444|exit=0|3s
L4C-RESULT|YangBounds.Gleich444|exit=0|3s
L4C-RESULT|YangBounds.Lemma13Prime|exit=0|3s
L4C-RESULT|YangBounds.LemmaK444|exit=0|3s
L4C-RESULT|YangBounds.LemmaP444|exit=0|4s
L4C-RESULT|YangBounds.LemmaZ444|exit=0|4s
L4C-RESULT|YangBounds.S4BedingterAusschluss|exit=0|3s
L4C-RESULT|YangBounds.SatzA444|exit=0|3s
L4C-RESULT|YangBounds.SatzB444|exit=0|4s
L4C-RESULT|YangBounds.SatzB444Final|exit=0|4s
L4C-RESULT|YangBounds.SatzB444Poly|exit=0|3s
L4C-RESULT|YangBounds.SatzC444Generisch|exit=0|5s
L4C-RESULT|YangBounds.SatzC444Kern|exit=0|4s
L4C-RESULT|YangBounds.SatzE444|exit=0|3s
L4C-RESULT|YangBounds.SatzE444Buendel|exit=0|3s
L4C-RESULT|YangBounds.SatzF444|exit=0|4s
L4C-RESULT|YangBounds.Statements|exit=0|4s
L4C-RESULT|YangBounds.Transponiert444|exit=0|3s
L4C-RESULT|YangBounds.Upper3x2x6|exit=0|11s
L4C-RESULT|YangBounds.Upper4x2x4|exit=0|8s
L4C-RESULT|YangBounds.YangN3|exit=0|4s
L4C-RESULT|YangBounds.YangN3Teil1|exit=0|3s
L4C-RESULT|YangBounds.YangN3Teil2|exit=0|3s
L4C-RESULT|YangBounds.YangN3Teil3|exit=0|4s
L4C-RESULT|YangBounds.YangN4Haupt|exit=0|4s
L4C-RESULT|YangBounds.YangN4Lemma13|exit=0|3s
L4C-SUMMARY|checked=32|ok=32|failed=0
end: 2026-11-26T16:58:40Z
$ lake env leanchecker --fresh MatMulRank.Solution
fresh start: 2026-11-26T16:58:40Z
L4C-FRESH|MatMulRank.Solution|exit=0|321s
fresh end: 2026-11-26T17:04:01Z
```

`--fresh` prüft alle Deklarationen der Umgebung der Solution neu, also auch die ganze Kette, die
beiden neuen Module und alle importierten Module von Mathlib. Das Wurzelmodul `YangBounds` ist
weiter kein Bauziel (S5-14, Abschnitt 1.5 in der Fassung `24845d3`) und taucht deshalb nicht auf.

### 1.6 Was der Bau nicht zeigt

- Der Bau lief nicht ohne Netz (P-12).
- Kein Lauf von Palomars `execute` mit äußerer Sandbox, kanonischer Challenge unter Modul-Alias
  (`compile_canonical_challenge`) und `bwrap` v0.12.0. Das geschieht erst bei der Einreichung.
- Die Läufe in GitHub Actions nach dem Merge stehen in Abschnitt 7.

### 1.7 Comparator und NanoDa (S5-21)

**Bezug.** Alle Läufe dieses Abschnitts beziehen sich auf den Commit `6d44bb1` (Arbeitskopie
„gebaut“). Die Dateien `lean/MatMulRank/Challenge.lean`, `lean/MatMulRank/Solution.lean` und
`lean/comparator.json` sind unverändert benutzt; sie sind byte-gleich mit `023a21a`.

**Woher die Werkzeuge kommen.** Palomar baut Comparator und NanoDa nicht selbst. Laut
PalomarSubmission `0465543…`, `.github/workflows/submission.yml` (Schritt „Install the submitted
Lean toolchain“): „The submitted toolchain judges the submission: its `lake comparator`,
`leanexport`, `leanchecker` and bundled kernels. Nothing else is built.“
`scripts/verify_submission.py` Z. 68: `PROTECTED_KERNELS = (("nanoda", "nanoda_bin"), ("con-ron",
"con-ron"))`.

```
$ curl -sSfL -o elan.tar.gz https://github.com/leanprover/elan/releases/download/v4.2.3/elan-x86_64-unknown-linux-gnu.tar.gz
$ sha256sum elan.tar.gz
df0b2b3a439961ffcbb3985214365ffe40f49bc871df04dff268c7d8e21ca8b2  elan.tar.gz
$ curl -sSfL -o lean.zip https://github.com/leanprover/lean4/releases/download/v4.36.0/lean-4.36.0-linux.zip
$ unzip -q lean.zip && ls lean-4.36.0-linux/bin
beam-daemon cadical clang con-leche con-ron lake ld.lld lean lean-beam lean-beam-mcp lean4lean leanc leanchecker leanchecker-paranoid leanexport leanir leanmake leantar llvm-ar nanoda_bin
$ elan toolchain link leanprover/lean4:v4.36.0 …/lean-4.36.0-linux
$ sha256sum lake leanexport nanoda_bin con-ron /usr/bin/bwrap
42678ccbc2605e2f892540dc7236e009fdd1224e823d104dfd72725d2f1a52d2  lake
8298d4412a1f8986b5dbfd1d9925211778d8d320fc47b72040c8fdfdd5b603d5  leanexport
8241c5e6baa29490aa118d382f97961b208ae730fdb96545c2abed74c9ece5a8  nanoda_bin
4e5616d94374cae37324dad2594f6230c2bb2297240249fc78ff508f3bc5acef  con-ron
e318903862396f96de3df57264e0158682b952fd3fb53ac23d876413e7b30f71  /usr/bin/bwrap
$ grep -n 4e5616d9…acef PalomarSubmission/checker-revisions.json
8:      "binary_sha256": "4e5616d94374cae37324dad2594f6230c2bb2297240249fc78ff508f3bc5acef"
(ebenso Z. 14, 20, 26)
```

Die Hashes sind dieselben wie in S5-16. Der Hash von `con-ron` ist der `binary_sha256` in
`checker-revisions.json` von PalomarSubmission.

Konfiguration für die Läufe (außerhalb des Repos, `comparator-nanoda.json`): die vier Schlüssel
von `lean/comparator.json` unverändert, dazu wie bei Palomar (`protected_comparator_config`,
`verify_submission.py` Z. 1207–1235) der Schlüssel `external_kernels` mit NanoDa:

```json
{
  "challenge_module": "MatMulRank.Challenge",
  "solution_module": "MatMulRank.Solution",
  "theorem_names": [
    "MatMulRank.rank_four_two_four_eq_26"
  ],
  "permitted_axioms": [
    "propext",
    "Quot.sound",
    "Classical.choice"
  ],
  "external_kernels": {
    "nanoda": [
      "/root/.elan/toolchains/leanprover--lean4---v4.36.0/bin/nanoda_bin"
    ]
  }
}
```

**Lauf A: `lake comparator` baut und exportiert selbst** (in `lean/`, mit Sandbox `bwrap`,
Start 2026-11-26T16:57:02Z):

```
$ lake comparator --config comparator-nanoda.json
Resolving dependencies
Building MatMulRank.Challenge
⚠ [2128/2129] Replayed MatMulRank.Challenge
warning: MatMulRank/Challenge.lean:94:8: declaration uses `sorry`
Build completed successfully (2129 jobs).
Exporting #[Quot, Quot.mk, Quot.lift, Quot.ind, MatMulRank.rank_four_two_four_eq_26, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.mul, Nat.pow, Nat.gcd, Nat.div, Nat.mod, Nat.beq, Nat.ble, Nat.land, Nat.lor, Nat.xor, Nat.shiftLeft, Nat.shiftRight, String.ofList, Char.ofNat, List, eagerReduce, Nat, String, String.mk, Char, optParam, autoParam, semiOutParam, outParam] from MatMulRank.Challenge
Building MatMulRank.Solution
… (Bau der Solution, Warnungen und Axiom-Ausgaben der Kette)
Build completed successfully (4265 jobs).
Exporting #[… dieselbe Liste …] from MatMulRank.Solution
Running nanoda kernel on solution
nanoda kernel accepts the solution
Running Lean default kernel on solution
Lean default kernel accepts the solution
Your solution is okay!

real	1m15.141s
exit=0
```

Im ganzen Protokoll von Lauf A steht `sorry` genau einmal, in Zeile 4 (`Challenge.lean:94:8`, die
gewollte Lücke der Challenge). Exportiert wird aus Challenge und Solution derselbe Satz
`MatMulRank.rank_four_two_four_eq_26`.

**Lauf B: wie Palomars Richter, aus Exporten.** Palomar exportiert Challenge und Solution mit
`leanexport <Modul> -- <Ziele>` (`export_module`, Z. 5356–5385; Ziele aus
`comparator_export_targets`, Z. 5343–5353, gleich der Liste aus Lauf A) und ruft dann
`lake comparator --config … --challenge-from-export … --solution-from-export …` in einem leeren
Verzeichnis mit `PATH` nur auf Toolchain und Systemverzeichnisse (`judge_exports`, Z. 5491–5545).
Start 2026-11-26T16:58:28Z:

```
$ T="Quot Quot.mk Quot.lift Quot.ind MatMulRank.rank_four_two_four_eq_26 propext Quot.sound Classical.choice Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight String.ofList Char.ofNat List eagerReduce Nat String String.mk Char optParam autoParam semiOutParam outParam"
$ lake env $B/leanexport MatMulRank.Challenge -- $T > challenge.export   # exit=0
$ lake env $B/leanexport MatMulRank.Solution -- $T > solution.export     # exit=0
$ sha256sum *.export; stat -c '%s %n' *.export
0abc445b9368069384a097f10937139b22b1c1f7589551f2a313e424a4105ce7  challenge.export
2b9f8c7f0506aae95a9c562ba52b973ce9151bba733068b63d69e5859f3204c6  solution.export
7621188 challenge.export
210799799 solution.export
$ cd <leeres Verzeichnis> && env -i PATH=$B:/usr/bin:/bin HOME=… TMPDIR=… LEAN_ABORT_ON_PANIC=1 \
    COMPARATOR_BWRAP=/usr/bin/bwrap $B/lake comparator --config comparator-nanoda.json \
    --challenge-from-export challenge.export --solution-from-export solution.export
Running nanoda kernel on solution
nanoda kernel accepts the solution
Running Lean default kernel on solution
Lean default kernel accepts the solution
Your solution is okay!

real	0m53.586s
exit=0
```

**con-ron** (Palomar spielt ihn nach Lean und NanoDa nach, `replay_con_ron`, Z. 5216:
`[binary, "--jobs=2", "--verified", solution_export]`):

```
$ $B/con-ron --jobs=2 --verified solution.export
con-ron: 1 inductive blocks modelled in-process: Lean.Syntax (30 generated records, checked by the fold as declarations and not counted as records of the file)
con-ron: accepted 27008 declarations (--verified)

real	0m37.820s
exit=0
```

**Gegenprobe** (zeigt, dass der Vergleich die Axiome prüft): dieselben Exporte, Konfiguration
`control-axioms.json` wie oben, nur `permitted_axioms` ohne `Classical.choice`:

```
$ … lake comparator --config control-axioms.json --challenge-from-export challenge.export --solution-from-export solution.export
error: Illegal axiom detected: 'Classical.choice'
exit=1
```

Ende aller Läufe dieses Abschnitts: 2026-11-26T17:00:17Z.

**Was diese Läufe nicht zeigen.** Sie sind kein Lauf von Palomars Prüfcode `execute`. Es
fehlen: Palomars äußere Sandbox um Bau und Export; der Bau der Challenge aus einer kanonischen
Kopie unter einem Modul-Alias (`compile_canonical_challenge`, Z. 6320–6335); `bwrap` v0.12.0
statt 0.9.0; ein Bau ohne Netz. Der Bau in Lauf A nutzte die vorher gebauten Module
(„Replayed“). Kein Aufruf von palomar-registry.org oder submit.palomar-registry.org.

## 2. Ausgaben von Palomars Prüfcode (S5-21)

Treiberskript (außerhalb des Repos) mit den Funktionen von PalomarSubmission `0465543…`;
Arbeitskopie „unberührt“ für die Dateiprüfungen, „gebaut“ für die Abhängigkeiten. Aufruf
`python3 driver.py <unberührt> <gebaut> <Toolchain> <bundle> <Fassung A> <Fassung B>`, Start
2026-11-26T16:56:49Z. Wörtliche Ausgabe:

```
--- supported_toolchain(lean/lean-toolchain)
OK {"toolchain": "leanprover/lean4:v4.36.0", "release_tag": "v4.36.0"}
--- validate_preservable_git_checkout(repo) [submodules, LFS]
OK 
--- tree_size(repo) <= MAX_SOURCE_BYTES
OK {"bytes": 8032869, "max": 524288000, "ok": true}
--- lakefile checks as in prepare()
OK {"lakefile": "lakefile.toml", "bytes": 656, "max": 1048576}
--- inspect_lean_sources(repo)
OK {"evidence": {"schema_version": 1, "module_required": true, "maximum_lines": 10000, "files_checked": 36}, "issues": ["versuche/s2-19-abgleich/Check.lean must begin with the module header keyword (ordinary comments may precede it)"]}
--- reject_committed_build_artifacts(repo)
OK 
--- manifest_packages(lean)
OK [{"name": "mathlib", "manifest_name": "mathlib", "repository": "leanprover-community/mathlib4", "url": "https://github.com/leanprover-community/mathlib4", "revision": "fc4f59e577feb1a4956671bc04ac18aaaf8cd842"}, {"name": "plausible", "manifest_name": "plausible", "repository": "leanprover-community/plausible", "url": "https://github.com/leanprover-community/plausible", "revision": "054b228ce0ac61d767c6e71ba73a24728f191b72"}, {"name": "LeanSearchClient", "manifest_name": "LeanSearchClient", "repository": "leanprover-community/LeanSearchClient", "url": "https://github.com/leanprover-community/LeanSearchClient", "revision": "4fb58e749ef3fc0395fe274f6cab70c2ea85f1c9"}, {"name": "importGraph", "manifest_name": "importGraph", "repository": "leanprover-community/import-graph", "url": "https://github.com/leanprover-community/import-graph", "revision": "8370c640afcd1cc3fb1cb9bf1560cc66eafee5e0"}, {"name": "proofwidgets", "manifest_name": "proofwidgets", "repository": "leanprover-community/ProofWidgets4", "url": "https://github.com/leanprover-community/ProofWidgets4", "revision": "2f0f3520daeac2d9310ff25b7a877a0e5cdaa203"}, {"name": "aesop", "manifest_name": "aesop", "repository": "leanprover-community/aesop", "url": "https://github.com/leanprover-community/aesop", "revision": "66ff77cf0c4c898799e4b94d14db55f7a02d0c5a"}, {"name": "Qq", "manifest_name": "Qq", "repository": "leanprover-community/quote4", "url": "https://github.com/leanprover-community/quote4", "revision": "ff055a2fcc835935e0ae607339b455a5f5896b4b"}, {"name": "batteries", "manifest_name": "batteries", "repository": "leanprover-community/batteries", "url": "https://github.com/leanprover-community/batteries", "revision": "b4b25a3886a16daacaf6615c2eea7170a6e8f458"}, {"name": "Cli", "manifest_name": "Cli", "repository": "leanprover/lean4-cli", "url": "https://github.com/leanprover/lean4-cli", "revision": "50810f72af7618bee62fe9800dc26e806c188703"}]
--- load_comparator_config(lean/comparator.json)
OK {"challenge_module": "MatMulRank.Challenge", "solution_module": "MatMulRank.Solution", "theorem_names": ["MatMulRank.rank_four_two_four_eq_26"], "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]}
--- load_formalization_metadata(lean/formalization.yaml)
FAIL FormalizationValidationError: formalization.yaml field project.authors must be a nonempty list
  issue: formalization.yaml field project.authors must be a nonempty list
  issue: formalization.yaml field project.responsible_maintainers must be a nonempty list
  issue: formalization.yaml sources for a source-based result must include a formalizes, adapts, or independently-proves relationship
--- load_formalization_metadata(/tmp/w/yaml/A/formalization.yaml)
OK {"result_origin": null}
--- load_formalization_metadata(/tmp/w/yaml/B/formalization.yaml)
OK {"result_origin": null}
--- repository_license_file(repo)
OK {"file": "LICENSE"}
--- detect_spdx_identifier(LICENSE) [licensee 10.0.0 via bundler]
OK "Apache-2.0"
--- check_mathlib_toolchain(built project)
OK [{"revision": "fc4f59e577feb1a4956671bc04ac18aaaf8cd842", "toolchain": "leanprover/lean4:v4.36.0"}]
--- shadowing_dependency(challenge_module)
OK {"challenge_module": "MatMulRank.Challenge", "shadowing_dependency": null}
--- package_allowlist(built project) [allowed-challenge-repositories.json, official revisions]
OK {"batteries": ["leanprover-community/mathlib4", "high"], "Qq": ["leanprover-community/mathlib4", "high"], "aesop": ["leanprover-community/mathlib4", "high"], "Cli": ["leanprover-community/mathlib4", "high"], "mathlib": ["leanprover-community/mathlib4", "high"], "plausible": ["leanprover-community/mathlib4", "high"], "importGraph": ["leanprover-community/mathlib4", "high"], "proofwidgets": ["leanprover-community/mathlib4", "high"], "LeanSearchClient": ["leanprover-community/mathlib4", "high"]}
--- audit_challenge_sources(Challenge, lean --src-deps)
OK {"source_count": 5, "dependencies": [{"repository": "leanprover-community/mathlib4", "provenance": "allowlisted"}], "untrusted_sources": [], "trust_level": "high"}
--- Challenge size (MAX_CHALLENGE_BYTES, MAX_CHALLENGE_LINES)
OK {"bytes": 4374, "max_bytes": 102400, "lines": 97, "max_lines": 1000}
```

Die beiden letzten Aufrufe von `load_formalization_metadata` vor `repository_license_file` laufen
auf zwei vorbereiteten Fassungen der neuen `lean/formalization.yaml` (Kopien außerhalb des Repos):
Fassung A „original“ und Fassung B „source-based“ wie in `palomar/s5-08-bericht.md` Abschnitt 6,
dazu in beiden `authors: ["Example Person"]` und `responsible_maintainers: ["Example Person"]`
als Platzhalter nur für diesen Test. In Fassung A heißt der Eintrag mit `type: original-proof`
hier „Tensor rank 26 of <4,2,4> over every field“ (in S5-08 „Lower bound 26 …“, passend zur
früheren Aussage). Der Unterschied zur Datei im Repo:

```
$ diff lean/formalization.yaml A/formalization.yaml
34c34
<   authors: []
---
>   authors: ["Example Person"]
37c37
<   responsible_maintainers: []
---
>   responsible_maintainers: ["Example Person"]
45,46c45,48
<   - title: "TODO-REPOSITORY-OWNER: origin of the result (original or source-based), see palomar/s5-08-bericht.md section 6"
<     relationship: "TODO-REPOSITORY-OWNER"
---
>   - title: "Tensor rank 26 of <4,2,4> over every field"
>     type: original-proof
>     relationship: other
>     note: "First presented in this repository (literature check of 25/26 November 2026)."
52c54
<     relationship: "TODO-REPOSITORY-OWNER"
---
>     relationship: background
$ diff lean/formalization.yaml B/formalization.yaml
34c34
<   authors: []
---
>   authors: ["Example Person"]
37c37
<   responsible_maintainers: []
---
>   responsible_maintainers: ["Example Person"]
45,46d44
<   - title: "TODO-REPOSITORY-OWNER: origin of the result (original or source-based), see palomar/s5-08-bericht.md section 6"
<     relationship: "TODO-REPOSITORY-OWNER"
52c50
<     relationship: "TODO-REPOSITORY-OWNER"
---
>     relationship: adapts
```

Damit scheitert `lean/formalization.yaml` genau an den drei Angaben, die nur der
Repository-Eigentümer macht, und an nichts anderem; die nachgeführten Felder (Abschnitt 5)
bestehen Palomars Lader in beiden Fassungen.

## 3. Befehle und Ausgaben (S5-21)

Arbeitskopie „unberührt“, Commit `6d44bb1`, Blöcke E0 bis E14. Aufruf je Befehl mit
`bash -c`, danach der Exit-Code.

```
### E0 commit
$ git rev-parse HEAD
6d44bb1d5ec0e560f1cf5f8746e15c3ea9c52c55
[exit 0]

### E1 toolchain
$ cat lean/lean-toolchain
leanprover/lean4:v4.36.0
[exit 0]

$ cat /tmp/w/PalomarSubmission/toolchains.json
{
  "schema_version": 2,
  "minimum": "v4.35.0-rc2"
}
[exit 0]

### E2 manifest
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

$ git ls-remote --tags https://github.com/leanprover-community/mathlib4 refs/tags/v4.36.0
fc4f59e577feb1a4956671bc04ac18aaaf8cd842	refs/tags/v4.36.0
[exit 0]

### E3 lakefile
$ ls -la lean/lakefile.toml lean/lakefile.lean
ls: cannot access 'lean/lakefile.lean': No such file or directory
-rw-r--r-- 1 root root 656 Nov 26 16:54 lean/lakefile.toml
[exit 2]

$ python3 -c 'import tomllib;d=tomllib.load(open("lean/lakefile.toml","rb"));print(d["name"],[r["name"] for r in d["require"]],[l["name"] for l in d["lean_lib"]])'
yang_bounds ['mathlib'] ['YangBounds', 'MatMulRank']
[exit 0]

### E4 manifest committed
$ git ls-files lean/lake-manifest.json lean/lakefile.toml lean/lean-toolchain
lean/lake-manifest.json
lean/lakefile.toml
lean/lean-toolchain
[exit 0]

### E5 submodules, LFS
$ test -e .gitmodules && echo present || echo 'no .gitmodules'
no .gitmodules
[exit 0]

$ git ls-files -s | awk '$1=="160000"' | wc -l
0
[exit 0]

$ git ls-files -z | git check-attr --stdin -z filter | tr '\0' '\n' | paste - - - | awk '$3=="lfs"' | wc -l
0
[exit 0]

### E6 compiled artifacts
$ find . \( -name .git -o -name .lake \) -prune -o -type f \( -iname '*.olean' -o -iname '*.ilean' -o -iname '*.a' -o -iname '*.bc' -o -iname '*.dll' -o -iname '*.dylib' -o -iname '*.o' -o -iname '*.obj' -o -iname '*.so' -o -iname '*.trace' \) -print | wc -l
0
[exit 0]

### E7 size
$ du -sb --exclude=.git --exclude=.lake . | cut -f1
8032869
[exit 0]

### E8 symlinks
$ find . \( -name .git -o -name .lake \) -prune -o -type l -print | wc -l
0
[exit 0]

### E9 Lean files
$ find . \( -name .git -o -name .lake \) -prune -o -name '*.lean' -type f -print | wc -l
36
[exit 0]

$ find . \( -name .git -o -name .lake \) -prune -o -name '*.lean' -type f -print | while read f; do grep -m1 -v '^\s*\(--.*\)\?$' "$f" | grep -q '^module\b' || echo "no module header: $f"; done
no module header: ./versuche/s2-19-abgleich/Check.lean
[exit 0]

$ find . \( -name .git -o -name .lake \) -prune -o -name '*.lean' -type f -print0 | xargs -0 wc -l | sort -n | tail -3
   941 ./lean/YangBounds/LemmaZ444.lean
  1416 ./lean/YangBounds/YangN4Haupt.lean
 14219 total
[exit 0]

### E10 Challenge
$ wc -lc lean/MatMulRank/Challenge.lean
  97 4374 lean/MatMulRank/Challenge.lean
[exit 0]

$ grep -n 'import' lean/MatMulRank/Challenge.lean
3:public import Mathlib.Algebra.Field.Defs
4:public import Mathlib.Algebra.Module.LinearMap.Defs
5:public import Mathlib.Data.Matrix.Mul
6:public import Mathlib.Order.Lattice.Nat
13:This is the statement file (Challenge) for the Palomar registry. It imports only Mathlib.
[exit 0]

$ grep -n -B1 '^structure\|^noncomputable def\|^def\|^theorem' lean/MatMulRank/Challenge.lean
67-tensors of rank one. -/
68:structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
--
79-convention `sInf ∅ = 0` is never used. -/
80:noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ :=
--
93-matrix over `K` is 26: `R_K(⟨4, 2, 4⟩) = 26`. -/
94:theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26 := by
[exit 0]

$ grep -n 'sorry' lean/MatMulRank/Challenge.lean
95:  sorry
[exit 0]

### E11 comparator.json
$ cat lean/comparator.json
{
  "challenge_module": "MatMulRank.Challenge",
  "solution_module": "MatMulRank.Solution",
  "theorem_names": ["MatMulRank.rank_four_two_four_eq_26"],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]
}
[exit 0]

$ python3 -c 'import json;d=json.load(open("lean/comparator.json"));print(sorted(d))'
['challenge_module', 'permitted_axioms', 'solution_module', 'theorem_names']
[exit 0]

### E12 formalization.yaml
$ python3 -c 'import yaml;d=yaml.safe_load(open("lean/formalization.yaml"));p=d["project"];print("version",d.get("version"));print("name",len(p["name"]),repr(p["name"]));print("description",len(p["description"]));print("authors",p["authors"]);print("maintainers",p["responsible_maintainers"]);print("license",p["license"]);print("classification",d["classification"]);print("methods",[m["method"] for m in d["automation"]["methods"]]);print("review.status",d["review"]["status"]);print("sources",[(s.get("type"),s["relationship"]) for s in d["sources"]]);print("repository" in d, [r["id"] for r in d.get("related_formalizations",[])])'
version v0.4
name 69 'The tensor rank of 4x2x4 matrix multiplication is 26 over every field'
description 1198
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
8340 lean/formalization.yaml
[exit 0]

### E13 licence
$ ls | grep -iE '^(LICENSE|LICENCE|COPYING|UNLICENSE|OFL)(\.md|\.markdown|\.txt)?$'
LICENSE
[exit 0]

$ head -3 LICENSE; wc -l LICENSE
                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/
201 LICENSE
[exit 0]

### E14 Lean outside lean/
$ find . \( -name .git -o -name .lake -o -path ./lean \) -prune -o -name '*.lean' -print
./versuche/s2-19-abgleich/Check.lean
[exit 0]

$ grep -rn --include='*.lean' -E 'native_decide|ofReduceBool|^\s*axiom ' lean/MatMulRank lean/YangBounds | grep -v '^\S*:[0-9]*:\s*--' | head
lean/YangBounds/SatzB444.lean:94:No `sorry`, no own axiom, no `native_decide`.
lean/YangBounds/LemmaP444.lean:31:No `sorry`, no own axiom, no `native_decide`.
lean/YangBounds/Bruecke444.lean:62:No `sorry`, no own axiom, no `native_decide`.
lean/YangBounds/Upper3x2x6.lean:35:   integers, checked by the Lean kernel (`decide +kernel`; this is not `native_decide`, it adds
lean/YangBounds/SatzC444Generisch.lean:57:No `sorry`, no own axiom, no `native_decide`.
lean/YangBounds/Endsatz444.lean:67:No `sorry`, no own axiom, no `native_decide`.
lean/YangBounds/YangN4Haupt.lean:53:No `sorry`, no own axiom, no `native_decide`. `#print axioms yang_theorem_two_of_lemma13`:
lean/YangBounds/S4BedingterAusschluss.lean:93:No `sorry`, no own axiom, no `native_decide`.
lean/YangBounds/Lemma13Prime.lean:52:No `sorry`, no own axiom, no `native_decide`.
lean/YangBounds/SatzE444.lean:63:No `sorry`, no own axiom, no `native_decide`.
[exit 0]
```

Die letzte Suche in E14 zeigt nur die ersten zehn Treffer (`head`). Alle Treffer stehen in
Kommentaren, keiner ist Code: kein `native_decide`, kein `ofReduceBool`, kein `axiom` (dazu
Abschnitt 1.4: 0 Treffer für `sorryAx` und `ofReduceBool` in den Axiom-Ausgaben). Gegenprobe
ohne Kommentare (`/- … -/` und `--` entfernt), Arbeitskopie „unberührt“:

```
$ python3 check_code.py
# check_code.py:
import re,glob
n=0;bad=[]
for f in glob.glob('lean/MatMulRank/*.lean')+glob.glob('lean/YangBounds/*.lean'):
    s=open(f).read()
    code=re.sub(r'/-.*?-/','',s,flags=re.S); code=re.sub(r'--.*','',code)
    for m in re.finditer(r'native_decide|ofReduceBool|^\s*axiom ',s,re.M): n+=1
    for m in re.finditer(r'native_decide|ofReduceBool|^\s*axiom ',code,re.M): bad.append(f)
print("hits",n,"in code",bad)
# Ausgabe:
hits 18 in code []
```

Arbeitskopie „gebaut“ (gleicher Commit), Abhängigkeiten:

```
$ git -C lean/.lake/packages/mathlib rev-parse HEAD
fc4f59e577feb1a4956671bc04ac18aaaf8cd842
[exit 0]

$ cat lean/.lake/packages/mathlib/lean-toolchain
leanprover/lean4:v4.36.0
[exit 0]

$ git -C lean/.lake/packages/mathlib remote
origin
[exit 0]

$ for d in lean/.lake/packages/*; do n=$(git -C $d ls-files -z | git -C $d check-attr --stdin -z filter | tr '\0' '\n' | paste - - - | awk '$3=="lfs"' | wc -l); echo "$(basename $d) lfs=$n"; done
Cli lfs=0
LeanSearchClient lfs=0
Qq lfs=0
aesop lfs=0
batteries lfs=0
importGraph lfs=0
mathlib lfs=0
plausible lfs=0
proofwidgets lfs=0
[exit 0]

$ ls -d lean/.lake/packages/*/MatMulRank lean/.lake/packages/*/MatMulRank.lean
ls: cannot access 'lean/.lake/packages/*/MatMulRank': No such file or directory
ls: cannot access 'lean/.lake/packages/*/MatMulRank.lean': No such file or directory
[exit 2]

$ git status --porcelain
[exit 0]
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

## 4. Stand je Anforderung (S5-21, Commit `6d44bb1`)

Kürzel: **erfüllt** (mit Beleg in dieser Datei), **nicht erfüllt** (mit Beleg),
**Eigentümer** (braucht eine Angabe oder Handlung des Repository-Eigentümers),
**Palomar** (nur Palomars redaktionelle KI-Prüfung entscheidet, nicht vorab belegbar),
**entfällt**, **Hinweis** (keine prüfbare Anforderung). „neu belegt“ heißt: Der Beleg hängt von
Challenge, Solution, `comparator.json`, `formalization.yaml` oder den neuen Modulen ab und ist in
S5-21 neu gelaufen. Alle übrigen Zeilen sind ebenfalls neu gelaufen, ihr Ergebnis ist gleich
geblieben.

| Nr. | Stand | Beleg (alle auf Commit `6d44bb1`) |
| --- | --- | --- |
| P-1 | erfüllt | E1: `leanprover/lean4:v4.36.0`; `toolchains.json` Minimum `v4.35.0-rc2`; Abschnitt 2 `supported_toolchain` OK, `release_tag` `v4.36.0` |
| P-2 | erfüllt | E2: Mathlib-Revision `fc4f59e…` = Tag `v4.36.0` (`git ls-remote`); Abhängigkeiten: deren `lean-toolchain` `leanprover/lean4:v4.36.0`; Abschnitt 2 `check_mathlib_toolchain` OK |
| P-3 | erfüllt | E1, E4: `lean/lean-toolchain` liegt im gewählten Projekt `lean` und ist eingecheckt |
| P-4 | erfüllt | E3: nur `lean/lakefile.toml` (656 Byte), `lakefile.lean` fehlt, TOML lesbar; Abschnitt 2 „lakefile checks“ OK |
| P-5 | erfüllt | E4: Manifest eingecheckt; Abschnitt 1.4 und „Abhängigkeiten“ in Abschnitt 3: nach `lake exe cache get` und `lake build` `git status --porcelain` leer; Bau ohne `lake update` mit Exit 0 |
| P-6 | erfüllt | E2: neun Git-Pakete, alle `https://github.com/owner/repo` ohne `.git`, Abfrage oder Fragment, `rev` je 40 Hexzeichen; Abschnitt 2 `manifest_packages` OK |
| P-7 | erfüllt | E5: keine `.gitmodules`, 0 Einträge mit Modus 160000; Abschnitt 2 `validate_preservable_git_checkout` OK |
| P-8 | erfüllt | E5: 0 Dateien mit `filter=lfs` im Repo; in allen neun Abhängigkeiten `lfs=0`; Abschnitt 2 `validate_preservable_git_checkout` OK |
| P-9 | erfüllt | E6: 0 Dateien mit den genannten Endungen außerhalb `.git`/`.lake`; Abschnitt 2 `reject_committed_build_artifacts` OK |
| P-10 | erfüllt | E7: 8.032.869 Byte; Abschnitt 2 `tree_size` 8.032.869 ≤ 524.288.000 |
| P-11 | erfüllt | E2: alle Abhängigkeiten öffentlich auf github.com, `mm325_proof` nicht im Manifest; Abschnitt 2 `package_allowlist` OK (alle neun Pakete gehören zur Mathlib-Schließung, offizielle Revision geprüft) |
| P-12 | Hinweis | Abschnitt 1.4: Cache etwa 1 min, Bau etwa 1 min (4 Kerne); ein Lauf ohne Netz fand nicht statt |
| P-13 | erfüllt (S5-22) | Abschnitt 8 `inspect_lean_sources` auf `4e2c720`: 35 Dateien geprüft, `issues: []`; `find` außerhalb von `lean/` findet keine `.lean`-Datei mehr. `versuche/s2-19-abgleich/Check.lean` ist auf Entscheidung des Eigentümers in `Check.lean.txt` umbenannt (Inhalt gleich, Umbenennung 100 %), Erklärung in `versuche/s2-19-abgleich/HINWEIS-Check.txt`. Früherer Stand auf `6d44bb1`: einziger Befund diese Datei |
| P-14 | erfüllt | E9: längste Datei `lean/YangBounds/YangN4Haupt.lean` mit 1.416 Zeilen; Abschnitt 2 `inspect_lean_sources` meldet keine Überlänge (Grenze 10.000) |
| P-15 | erfüllt | E8: 0 symbolische Verknüpfungen außerhalb `.git`/`.lake` |
| P-16 | erfüllt, neu belegt | Abschnitt 1.4: alle Module bauen mit `module`, `public import` und `@[expose] public section`, auch `Upper4x2x4` und `Gleich444`; die Solution sieht alle gebrauchten Deklarationen (Comparator Lauf A baut sie, Abschnitt 1.7) |
| P-17 | erfüllt | Abschnitt 3 (Regex) und E11: `MatMulRank.Challenge` ≠ `MatMulRank.Solution`, jede Komponente passt |
| P-18 | erfüllt, neu belegt | E9/E10: `lean/MatMulRank/Challenge.lean` und `Solution.lean` liegen im Projekt, keine Verknüpfungen (E8); Abschnitt 1.4 und 1.7: Lake baut beide aus diesen Dateien |
| P-19 | erfüllt, neu belegt | E10: 97 Zeilen, 4.374 Byte; Abschnitt 2 „Challenge size“ (Grenzen 1.000 Zeilen, 102.400 Byte); auch unter der Warnschwelle 300 Zeilen / 32 KiB |
| P-20 | erfüllt, neu belegt | E10: vier `public import Mathlib.…`; Abschnitt 2 `audit_challenge_sources` mit `lean --src-deps`: `source_count` 5, `untrusted_sources: []`, `trust_level: high`, einzige Herkunft `leanprover-community/mathlib4` |
| P-21 | erfüllt, neu belegt | Abschnitt 2 `shadowing_dependency`: `null` für `MatMulRank.Challenge`; Abschnitt 3 „Abhängigkeiten“: kein `MatMulRank` an der Wurzel eines Pakets |
| P-22 | Palomar | E10: nur Mathlib-Importe; vor `structure BilinearAlgorithm` (Z. 68), `def tensorRank` (Z. 80) und `theorem rank_four_two_four_eq_26` (Z. 94) endet je ein Docstring in der Zeile davor; die Modul-Dokumentation nennt Aussage und Grenzen. Ob das genügt, entscheidet Palomars KI-Prüfung |
| P-23 | erfüllt, neu belegt | Abschnitt 1.7, Läufe A und B: `lake comparator` vergleicht Challenge und Solution für `MatMulRank.rank_four_two_four_eq_26` und meldet „Your solution is okay!“, Exit 0. Damit sind die erreichten Deklarationen, auch `tensorRank` mit `exists_bilinearAlgorithm`, in beiden Exporten gleich; sonst käme „Const does not match between challenge and target“. Rest bei Palomar: kanonische Challenge in `execute` |
| P-24 | erfüllt, neu belegt | E11: genau die vier Pflichtschlüssel, `theorem_names` `["MatMulRank.rank_four_two_four_eq_26"]`; Abschnitt 2 `load_comparator_config` OK |
| P-25 | erfüllt, neu belegt | E11: `permitted_axioms` = `propext`, `Quot.sound`, `Classical.choice`; Abschnitt 1.4: `MatMulRank.rank_four_two_four_eq_26` (Solution) hängt genau von diesen ab |
| P-26 | erfüllt, neu belegt | Abschnitt 1.4: `MatMulRank.rank_four_two_four_eq_26` `[propext, Classical.choice, Quot.sound]`, 0 Treffer für `sorryAx` und `ofReduceBool` in allen 65 Axiom-Ausgaben, einziges `sorry` das gewollte der Challenge; `leanchecker` über alle 32 Module und `--fresh` auf die Solution (Abschnitt 1.5). Abschnitt 1.7: Comparator meldet „nanoda kernel accepts the solution“, „Lean default kernel accepts the solution“, „Your solution is okay!“ (Exit 0); con-ron „accepted 27008 declarations“; Gegenprobe ohne `Classical.choice` scheitert mit „Illegal axiom detected“ |
| P-27 | erfüllt, neu belegt | E11: `lean/comparator.json` im gewählten Projekt, endet auf `.json`, eine Konfiguration |
| P-28 | entfällt | E11: kein `definition_names` |
| P-29 | erfüllt, neu belegt (S5-22) | Abschnitt 8: 8.460 Byte, `version v0.4`; `load_formalization_metadata` OK ohne Befund |
| P-30 | erfüllt, neu belegt | E12: `project.name` „The tensor rank of 4x2x4 matrix multiplication is 26 over every field“, 69 Zeichen (Grenze 300) |
| P-31 | erfüllt, neu belegt | E12: `project.description` 1.198 Zeichen (Grenze 10.000) |
| P-32 | erfüllt (S5-22) | Abschnitt 8: `authors` = `[{name: "Justus Jeserigk", github: "Justus42"}]` nach Angabe des Eigentümers; Palomars Lader OK |
| P-33 | erfüllt | E12: `license Apache-2.0`; Abschnitt 2 `detect_spdx_identifier` → `"Apache-2.0"` |
| P-34 | erfüllt, neu belegt | E12: `arxiv [cs.CC, math.AG, math.RA]`, `msc2020 [68Q17, 15A69, 14N07]`; Abschnitt 2: Fassungen A und B bestehen Palomars Lader. Die Auswahl ist ein Vorschlag (S5-08) |
| P-35 | erfüllt, neu belegt (S5-22) | Abschnitt 8: `methods` `agent`, `other`, `other`; Modellnamen nur, soweit `LOG.md` sie nennt (`claude-opus-5-5`, „Claude Fable 5.2“, `openai/gpt-6.2-sol`, `gemini-4-carbon`), sonst allgemein „Claude models (Anthropic)“; Lader OK |
| P-36 | erfüllt, neu belegt (S5-22) | Abschnitt 8: `review.status agent-reviewed`; `review.notes` nennt den Aussagen-Abgleich für „= 26“ durch Prüfer und Fremdmodell als erledigt (Belege `pruefvermerke/B-034.md`, `lean/prosa/s5_abgleich_s5-20.md`, `versuche/s5-r5-sol-b034/gpt_antwort.md` auf `main`); Lader OK |
| P-37 | erfüllt (S5-22) | Abschnitt 8: `responsible_maintainers` = `[{name: "Justus Jeserigk", github: "Justus42"}]` nach Angabe des Eigentümers; `normalized_provenance` gibt denselben Eintrag zurück |
| P-38 | erfüllt (S5-22) | Abschnitt 8: alle `sources` mit `title` und `relationship` aus der Liste: `original-proof`/`other`, Yang `background`, Hopcroft–Kerr `background`, Shitov `background`, matmulcatalog `other`; Lader OK |
| P-39 | erfüllt (S5-22) | Abschnitt 8: `normalized_provenance` → `result_origin: original` (Fassung A nach Entscheidung des Eigentümers, Yang `background`) |
| P-40 | erfüllt | E12: Schlüssel `repository` fehlt (`False`) |
| P-41 | erfüllt | E12: ein Eintrag mit `id` `https://github.com/fallnlove/mm325_proof` |
| P-42 | Palomar | Modul-Dokumentation der Challenge und `formalization.yaml` nennen Aussage, Grenzen, Quellen und KI-Beteiligung; `lean/README.md` nennt die Palomar-Dateien nicht. Nicht geändert |
| P-43 | erfüllt | E13: genau eine Lizenzdatei `LICENSE`, 201 Zeilen, Apache License 2.0; Abschnitt 2 `repository_license_file` OK, `detect_spdx_identifier` `Apache-2.0` = `project.license` |
| P-44 | Palomar | nicht vorab belegbar |
| P-45 | Palomar | nicht vorab belegbar |
| P-46 | Palomar | nicht vorab belegbar |
| P-47 | Eigentümer | Berechtigung des Einreichers |
| P-48 | Eigentümer | Anmeldung im Browser; kein Agent legt Tag oder Gist an |
| P-49 | Eigentümer | Angaben bei der Einreichung: `Justus42/matmul-rank-n2m`, voller Commit-SHA, Projekt `lean`, Konfiguration `lean/comparator.json` |
| P-50 | Hinweis | – |
| P-51 | Hinweis | Pfade `lean` und `lean/comparator.json` stehen; Modulnamen `MatMulRank.Challenge`, `MatMulRank.Solution` |

Zählung (Stand S5-22, Commit `4e2c720`): erfüllt 39 (P-1 bis P-11, P-13 bis P-21, P-23 bis P-27,
P-29 bis P-41, P-43); nicht erfüllt 0; Eigentümer 3 (P-47, P-48, P-49, die Einreichung selbst);
Palomar 5 (P-22, P-42, P-44, P-45, P-46); entfällt 1 (P-28); Hinweis 3 (P-12, P-50, P-51).
Zusammen 51.

Frühere Zählung (Stand S5-21): erfüllt 34 (P-1 bis P-11, P-14 bis P-21, P-23 bis P-27, P-29 bis P-31,
P-33 bis P-36, P-40, P-41, P-43); nicht erfüllt 1 (P-13, Entscheidung beim Eigentümer);
Eigentümer 7 (P-32, P-37, P-38, P-39, P-47, P-48, P-49); Palomar 5 (P-22, P-42, P-44, P-45,
P-46); entfällt 1 (P-28); Hinweis 3 (P-12, P-50, P-51). Zusammen 51.

## 5. Änderungen dieses Auftrags (S5-21)

| Datei | Änderung |
| --- | --- |
| `lean/formalization.yaml` | Kopfkommentar nennt `MatMulRank.rank_four_two_four_eq_26`; `project.name` „… is 26 over every field“ (69 Zeichen); `project.description`: „R_K(<4,2,4>) = 26“, obere Schranke durch eigenes Verfahren mit 26 Produkten bewiesen und vom Kern geprüft, untere Schranke wie bisher (1.198 Zeichen); Quelle Hopcroft–Kerr: `note` sagt jetzt, dass die Schranke 26 Teil der verglichenen Aussage ist, aber nicht durch Formalisierung der Konstruktion des Artikels bewiesen wird (`relationship: background` unverändert); `review.notes`: neue Sätze, neue Aussage der Challenge, frühere Aussagen-Abgleiche betreffen nur die untere Schranke, der Abgleich für „= 26“ ist ein eigener Schritt. Nicht angefasst: `project.authors`, `project.responsible_maintainers`, die Herkunft (die beiden `TODO-REPOSITORY-OWNER`-Stellen in `sources`) und alle übrigen Felder |
| `.github/workflows/zweitlauf.yml` | neue Variable `EXTRA_THEOREMS` mit `YangBounds.Gleich444.rank_four_two_four_eq_26` und `MatMulRank.rank_four_two_four_eq_26`; der Schritt `#print axioms` importiert zusätzlich `YangBounds.Gleich444` und `MatMulRank.Solution` (nicht die Challenge, sie deklariert denselben Namen) und gibt `#check` und `#print axioms` für `FINAL_THEOREM` und beide neuen Sätze aus; Kopfkommentar Punkt 3 ergänzt. `FINAL_THEOREM` und der Schritt `leanchecker --fresh` sind unverändert |
| `palomar/BELEGE.md` | diese Datei |

Nicht geändert: alle Lean-Dateien (darunter die Dateien, die in dieser Runde ein Prüfer liest:
`lean/MatMulRank/Challenge.lean`, `lean/MatMulRank/Solution.lean`, `lean/YangBounds/Gleich444.lean`,
`lean/YangBounds/Upper4x2x4.lean`, `lean/YangBounds/Basic.lean`, `lean/comparator.json`),
`versuche/s2-19-abgleich/Check.lean` (P-13, Frage beim Eigentümer), `palomar/ANFORDERUNGEN.md`
(Zeile 6 nennt als Endsatz noch die untere Schranke, außerhalb meines Auftrags),
`lean/README.md`, `.github/workflows/lean-project.yml`, `.github/scripts/lean_report.py`.

## 6. Liste für den Orchestrator: Stand aller Anforderungen

**Erfüllt mit Beleg (34):** P-1 bis P-11, P-14 bis P-21, P-23 bis P-27, P-29 bis P-31,
P-33 bis P-36, P-40, P-41, P-43. Die Belege, die von Challenge, Solution, `comparator.json`,
`formalization.yaml` oder den neuen Modulen abhängen, sind P-16, P-18, P-19, P-20, P-21, P-23,
P-24, P-25, P-26, P-27, P-29, P-30, P-31, P-34, P-35, P-36 und stehen in Abschnitt 4 mit dem
Commit `6d44bb1`.

**Brauchen Angaben oder Handlungen des Eigentümers (7, dazu die Entscheidung zu P-13):**

- P-13: `versuche/s2-19-abgleich/Check.lean` hat keinen Modulkopf; Palomars eigener Code meldet
  genau diese Datei. Ob ein Auftrag sie anpassen oder entfernen darf, entscheidet der Eigentümer
  (Frage offen). Bis dahin **nicht erfüllt**.
- P-32 Autoren, P-37 verantwortliche Betreuer: leere Listen, Palomars Lader lehnt ab.
- P-38, P-39: Herkunft „original“ oder „source-based“ (zwei `TODO-REPOSITORY-OWNER` in
  `sources`); beide vorbereiteten Fassungen bestehen den Lader.
- P-47 Berechtigung, P-48 Anmeldung, P-49 Angaben bei der Einreichung (Repository, voller
  Commit-SHA, Projekt `lean`, Konfiguration `lean/comparator.json`).

**Kann nur Palomar entscheiden (5):** P-22 (Docstrings, keine versteckten Annahmen), P-42
(erzählender Teil), P-44 (Forschungsinteresse, Notability), P-45 (Ausschlussliste), P-46
(Prüfschritte der Rubrik). Dazu als Rest bei P-23 und P-26: Palomars eigenes `execute` mit
äußerer Sandbox und kanonischer Challenge läuft erst bei der Einreichung.

**Nicht erfüllt (1):** P-13, Grund wie oben: die einzige Lean-Datei ohne Modulkopf liegt
außerhalb von `lean/` und gehört zu keinem Auftrag der Spur P.

**Entfällt (1):** P-28 (kein `definition_names`). **Hinweis (3):** P-12 (Bau ohne Netz nicht
gelaufen), P-50, P-51.

Weitere offene Punkte, die keine Anforderung sind:

1. Der Aussagen-Abgleich nach Protokoll 5.1 für die Challenge mit „= 26“ (ein Prüfer und ein
   Fremdmodell) ist nicht Teil dieser Datei; `review.notes` nennt ihn als eigenen Schritt und
   ist danach erneut nachzuführen.
2. `palomar/ANFORDERUNGEN.md` Zeile 6 nennt als Gegenstand noch den Endsatz der unteren Schranke.
3. `lean/README.md` erwähnt die Palomar-Dateien nicht (betrifft P-42).
4. `lean/Axioms.lean` importiert das Wurzelmodul, das kein Bauziel ist.
5. Warnungen im Bau (keine Fehler): veraltetes `push_neg`, ungenutzte `simp`-Argumente,
   veraltete Namen.

## 7. Commits, Zeiten, Actions, Verbrauch

**S5-21** (Zweig `claude/project-thread-b5jw6l`, abgezweigt von `portierung` bei `023a21a`):

| Commit | Zeit (UTC, Commit-Zeit) | Betreff |
| --- | --- | --- |
| `6d44bb1` | 2026-11-26T16:53:07Z | S5-21 formalization.yaml und Zweitlauf auf die Aussage Rang gleich 26 nachgeführt |
| (dieser Bericht) | siehe Git | S5-21 Belege zu den Palomar-Anforderungen auf den Stand von portierung |

Rechenblöcke S5-21: `lake exe cache get` (16:54:00Z bis 16:55:06Z), `lake build` (bis 16:56:09Z),
Berichte und Palomars Prüfcode (16:56Z bis 16:57Z), `leanchecker` über alle Module (16:56:38Z bis
16:58:40Z), Comparator Lauf A, Exporte, Lauf B, con-ron, Gegenprobe (16:57:02Z bis 17:00:17Z),
`leanchecker --fresh` (2026-11-26T16:58:40Z bis 2026-11-26T17:04:01Z). Kein Block über 30 Minuten. Keine Subagenten, keine
Fremdmodell-Anfrage. Eingeblendet war in S5-21 der Index des Projektgedächtnisses und ein
Einzeleintrag zu den Git-Regeln; keine Prüfurteile. Nichts ins Gedächtnis geschrieben.

**Actions auf `portierung` nach dem Merge:** siehe Bericht an den Orchestrator (Lauf- und
Jobnummern stehen erst nach dem Merge fest und sind deshalb nicht in dieser Datei).

**Frühere Aufträge an dieser Datei:** S5-14 (Commits `dd278af` bis `24845d3`, Bericht in PR #158,
Merge `9c364ba`) und S5-16 (Commit `3226b86` und `f849c32`, PR #162, Merge `023a21a`). Ihre
Tabellen und Verbrauchsangaben stehen in der Fassung dieser Datei auf `023a21a`.

## 8. Nachtrag S5-22: Angaben des Eigentümers und Palomars Prüfcode

Entscheidungen des Repository-Eigentümers vom 26.11.2026 (Projektchat, weitergereicht vom
Orchestrator), umgesetzt auf dem Zweig `claude/project-thread-n3xdco` (abgezweigt von `portierung`
bei `f75d77c`), Commit `4e2c720b886885fcb3cb5821b5445f9763adb6b1`:

| Datei | Änderung |
| --- | --- |
| `lean/formalization.yaml` | `project.authors` und `project.responsible_maintainers` je genau `{name: "Justus Jeserigk", github: "Justus42"}`; Herkunft „original“ (Fassung A aus `palomar/s5-08-bericht.md` Abschnitt 6): Eintrag „Lower bound 26 for the tensor rank of <4,2,4> over every field“ mit `type: original-proof`, `relationship: other`; Yang `relationship: background`; Beschreibung „To our knowledge, the lower bound 26 is new (literature search recorded in lit/ of this repository)“; `review.notes`: Aussagen-Abgleich für „= 26“ durch Prüfer und Fremdmodell erledigt; `automation`: Modellnamen nur, soweit `LOG.md` sie belegt; Kopfkommentar ohne Platzhalter |
| `versuche/s2-19-abgleich/Check.lean` | per `git mv` in `Check.lean.txt` umbenannt, Inhalt unverändert (SHA-256 vorher und nachher `47bc69ff…e588`) |
| `versuche/s2-19-abgleich/HINWEIS-Check.txt` | eine Zeile Erklärung zur Umbenennung |
| `palomar/ANFORDERUNGEN.md` | Zeile 5 bis 9: Gegenstand ist der Satz der Challenge `MatMulRank.rank_four_two_four_eq_26` |
| `palomar/BELEGE.md` | dieser Nachtrag, Abschnitt 4 und Zählung |

Belege für `LOG.md` (Stand `main` bei `fc7d9e1`) zu den Modellnamen: „Gemeldetes Modell:
claude-opus-5-5.“ (u. a. Z. 1895); „Co-Autor „Claude Fable 5.2““ (Z. 1919); „Modell
`openai/gpt-6.2-sol`“ (Z. 2428); „`gemini-4-carbon` über die Gemini Bridge“ (Z. 174). Den Namen
`claude-fable-5-2` als Modell des Orchestrators belegt `LOG.md` nicht; er ist deshalb entfallen,
der Orchestrator heißt allgemein „orchestrating Claude session (Anthropic)“.

Verweise auf den alten Namen `Check.lean`: kein Workflow (Befehl unten). Die Datei selbst nennt
in Zeile 7 ihren Aufruf mit dem alten Namen (Inhalt bleibt unverändert, darum der Hinweis). Weiter
nennen ihn `pruefvermerke/B-008.md` (Stand von `main`, nicht geändert), `palomar/s5-08-bericht.md`,
`palomar/ANFORDERUNGEN.md` Zeile 246 und 276 und die früheren Abschnitte dieser Datei als
Beschreibung des damaligen Stands.

Palomars Prüfcode lokal: PalomarSubmission `046554302064b2c83c2b924bea6db87fc5900c68` (frisch geklont
am 26.11.2026 gegen 17:30Z, `HEAD` unverändert gegenüber Abschnitt 0), Treiberskript außerhalb des
Repos mit den Funktionen `supported_toolchain`, `load_comparator_config`, `repository_license_file`
(`scripts/verify_submission.py`), `inspect_lean_sources` (`scripts/source_requirements.py`),
`load_formalization_metadata` und `normalized_provenance` (`scripts/submission_contract.py`), auf
einem frischen Klon (`git clone --no-local`, `git checkout 4e2c720…`, `git status --porcelain` leer,
kein `lake`-Aufruf). Nicht neu gelaufen, weil sich die betroffenen Dateien nicht geändert haben:
Bau, `leanchecker`, Comparator, `package_allowlist`, `audit_challenge_sources`, Licensee. Start
2026-11-26T17:33:40Z. Keine Verbindung zu palomar-registry.org, kein Aufruf des Einreichformulars,
keine Einreichung. Wörtliche Ausgabe:

```
--- supported_toolchain(lean/lean-toolchain)
OK "v4.36.0"
--- inspect_lean_sources(repo)
OK {"evidence": {"schema_version": 1, "module_required": true, "maximum_lines": 10000, "files_checked": 35}, "issues": []}
--- load_comparator_config(lean/comparator.json)
OK {"challenge_module": "MatMulRank.Challenge", "solution_module": "MatMulRank.Solution", "theorem_names": ["MatMulRank.rank_four_two_four_eq_26"], "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]}
--- load_formalization_metadata(lean/formalization.yaml)
OK 
--- normalized_provenance(load_formalization_metadata(lean/formalization.yaml)) [Auszug]
OK {"result_origin": "original", "responsible_maintainers": [{"name": "Justus Jeserigk", "github": "Justus42"}], "authors": [{"name": "Justus Jeserigk", "github": "Justus42"}], "sources": [["original-proof", "other"], ["paper", "background"], ["paper", "background"], ["paper", "background"], ["other", "other"]], "automation_models": [["claude-opus-5-5", "Claude Fable 5.2"], ["openai/gpt-6.2-sol"], ["gemini-4-carbon"]], "review_status": "agent-reviewed"}
--- repository_license_file(repo)
OK {"file": "LICENSE"}
```

Befehle auf demselben Klon:

```
$ git rev-parse HEAD
4e2c720b886885fcb3cb5821b5445f9763adb6b1
$ find . \( -name .git -o -name .lake -o -path ./lean \) -prune -o -name '*.lean' -print
[exit 0]
$ git diff --find-renames --stat f75d77c HEAD -- versuche/s2-19-abgleich
 versuche/s2-19-abgleich/{Check.lean => Check.lean.txt} | 0
 versuche/s2-19-abgleich/HINWEIS-Check.txt              | 1 +
 2 files changed, 1 insertion(+)
$ git diff -M --summary f75d77c HEAD -- versuche/s2-19-abgleich
 rename versuche/s2-19-abgleich/{Check.lean => Check.lean.txt} (100%)
 create mode 100644 versuche/s2-19-abgleich/HINWEIS-Check.txt
$ grep -rn "Check.lean" .github
[exit 1]
$ wc -c lean/formalization.yaml
8460 lean/formalization.yaml
```


## 9. Nachtrag N-01: alle Belege neu auf Commit `a1e0deb`

**Anlass.** Seit den Abschnitten 1.4 bis 1.7, 2 und 8 haben sich geändert: die Importlisten von
`lean/YangBounds/Basic.lean` (nur noch `Mathlib.Data.Matrix.Basic`) und
`lean/YangBounds/S4BedingterAusschluss.lean` (dazu `Mathlib.Tactic.LinearCombination`), Auftrag
N-06, Merge `49ead0184ee60a8766c163377559d0acb34a35e7`; und `lean/formalization.yaml`, Auftrag
N-01. Keine Aussage, keine Definition, kein Beweis, nicht `comparator.json`, nicht Lakefile,
Manifest oder Toolchain. Deshalb sind Bau, Berichte, `leanchecker`, Comparator mit NanoDa (Läufe A
und B), `con-ron`, Kontrolllauf und Palomars Prüffunktionen hier noch einmal gelaufen.

| Gegenstand | Wert |
| --- | --- |
| Geprüfter Commit | `a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0` auf `claude/project-thread-mr4gt5`, Elternteil `49ead01` (`main` nach N-06). Gegenüber `49ead01` geändert: `README.md`, `ergebnisse/rang-444.md`, `lean/README.md`, `lean/formalization.yaml`, `lit/QUELLEN.md` |
| Späterer Stand | Der Commit, der diesen Abschnitt hinzufügt, und der Merge nach `main` ändern gegenüber `a1e0deb` nur Textdateien: `palomar/BELEGE.md`, `README.md`, `lean/README.md`, `ergebnisse/rang-444.md` (Lauf- und Commitnummern). Keine Lean-Datei, kein Lakefile, kein Manifest, keine Toolchain, nicht `comparator.json`, nicht `formalization.yaml`, kein Workflow |
| Werkzeuge | wie Abschnitt 0: Lean 4.36.0 aus dem GitHub-Release, Lake 5.0.0-src+611c117, bwrap 0.9.0, PalomarSubmission `046554302064b2c83c2b924bea6db87fc5900c68`; `leanchecker`, `leanexport`, `nanoda_bin`, `con-ron` aus dem `bin/` der Toolchain |
| GitHub Actions auf `a1e0deb` | `lean-project.yml` per `workflow_dispatch` auf dem Zweig: Lauf 45886015262, Job 140136780218, success, „TOTAL: STANDARD=65“. `zweitlauf.yml` per `workflow_dispatch` mit `ref=a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0`: Lauf 45886019141, Job 140141105711, success: „CHECKED COMMIT: a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0“, „olean/ilean/trace files in fresh checkout: 0“, „Build completed successfully (4271 jobs).“, „L4C-SUMMARY|checked=32|ok=32|failed=0“, „L4C-FRESH|YangBounds.Transponiert444|exit=0“ |
| Zeit | 2026-11-26, 19:45:37Z bis 20:02:43Z (lokal, 4 Kerne) |

**Was neu ist gegenüber Abschnitt 1.7.** Alles wie dort, mit diesen Unterschieden: Lauf A baut
nicht neu, sondern spielt die eben in `built/` gebauten Module wieder ab („Replayed“); der Export
der Challenge ist byte-gleich mit dem früheren Lauf (SHA-256 `0abc445b…`), der Export der Solution
nicht (`1067d20d…`), weil die Importe von `Basic.lean` jetzt andere Mathlib-Module in die Umgebung
holen. `con-ron` nahm 27008 Deklarationen an. Wie in 1.7 sind diese Läufe kein Lauf von Palomars
`execute` in dessen Sandbox; sie liefen außerhalb des Repos, von einem Agenten.

**Skript** (`runall.sh`, außerhalb des Repos; frische Klone von GitHub, `untouched/` bleibt
unberührt, `built/` wird gebaut):

```bash
#!/usr/bin/env bash
# usage: runall.sh <commit> <outdir>
# Fresh clones of <commit> from GitHub, build, reports, leanchecker, comparator (A, B), con-ron,
# control run, Palomar check functions. Everything outside the repository.
set -uo pipefail
C="$1"; O="$2"
export PATH=$HOME/.elan/bin:$PATH
N=/tmp/claude-0/n01
rm -rf "$O"; mkdir -p "$O"; cd "$O"
log() { echo "$@"; }
run() { echo "\$ $*"; bash -c "$*"; echo "[exit $?]"; }
log "commit: $C"
log "start: $(date -u +%FT%TZ)"
for d in untouched built; do
  git clone -q https://github.com/Justus42/matmul-rank-n2m.git "$d" && git -C "$d" checkout -q "$C"
  echo "$d: $(git -C "$d" rev-parse HEAD), status: [$(git -C "$d" status --porcelain | wc -l) lines]"
done
cd built/lean
B="$(dirname "$(elan which lean)")"
run "lean --version"
run "lake --version"
run "lake exe cache get 2>&1 | tail -4"
log "cache end: $(date -u +%FT%TZ)"
lake build > "$O/build.log" 2>&1; echo "lake build exit $?"
log "build end: $(date -u +%FT%TZ)"
run "grep -E '^(✖|error)' $O/build.log | wc -l"
run "tail -1 $O/build.log"
run "grep 'declaration uses' $O/build.log"
run "grep -c '^warning' $O/build.log"
run "git -C .. status --porcelain"
run "python3 ../.github/scripts/lean_report.py sorry-report . $O/build.log"
python3 ../.github/scripts/lean_report.py gen-check . "$O/MainAxioms.lean" >/dev/null
lake env lean "$O/MainAxioms.lean" > "$O/axioms.txt" 2>&1; echo "axioms exit $?"
run "python3 ../.github/scripts/lean_report.py axiom-report $O/axioms.txt | grep -E 'TOTAL'"
run "grep -c '^AXIOM-RESULT' $O/axioms.txt"
run "grep '^AXIOM-RESULT' $O/axioms.txt | grep -vc '|propext, Classical.choice, Quot.sound\$'"
run "grep -E 'AXIOM-RESULT\|(MatMulRank\.rank|YangBounds\.(Gleich444|Upper4x2x4|Transponiert444)\.rank_four_two_four_(eq|le|ge)_26\|)' $O/axioms.txt"
log "--- leanchecker over all project modules: $(date -u +%FT%TZ)"
ok=0; bad=0
for f in $(cd . && ls YangBounds/*.lean MatMulRank/*.lean); do
  m="${f%.lean}"; m="${m//\//.}"
  if lake env "$B/leanchecker" "$m" > /dev/null 2>&1; then ok=$((ok+1)); else bad=$((bad+1)); echo "L4C FAIL $m"; fi
done
echo "L4C-SUMMARY|checked=$((ok+bad))|ok=$ok|failed=$bad"
log "--- leanchecker --fresh YangBounds.Transponiert444: $(date -u +%FT%TZ)"
timeout 1500 lake env "$B/leanchecker" --fresh YangBounds.Transponiert444 > /dev/null 2>&1; echo "L4C-FRESH|YangBounds.Transponiert444|exit=$?"
log "end leanchecker: $(date -u +%FT%TZ)"
sed "s#NANODA#$B/nanoda_bin#" $N/comparator-nanoda.tmpl > comparator-nanoda.json
log "--- Lauf A: lake comparator (start $(date -u +%FT%TZ))"
( time COMPARATOR_BWRAP=/usr/bin/bwrap lake comparator --config comparator-nanoda.json ) > "$O/laufA.log" 2>&1; echo "exit=$?"
grep -nE "sorry|Exporting|nanoda|kernel|okay|error|real" "$O/laufA.log" | cut -c1-200
T="Quot Quot.mk Quot.lift Quot.ind MatMulRank.rank_four_two_four_eq_26 propext Quot.sound Classical.choice Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight String.ofList Char.ofNat List eagerReduce Nat String String.mk Char optParam autoParam semiOutParam outParam"
log "--- Lauf B: exports and judge from exports (start $(date -u +%FT%TZ))"
lake env "$B/leanexport" MatMulRank.Challenge -- $T > "$O/challenge.export"; echo "challenge export exit=$?"
lake env "$B/leanexport" MatMulRank.Solution -- $T > "$O/solution.export"; echo "solution export exit=$?"
( cd "$O" && sha256sum challenge.export solution.export && stat -c '%s %n' challenge.export solution.export )
mkdir -p "$O/judge" "$O/judge/home" "$O/judge/tmp"; cp comparator-nanoda.json "$O/judge/"
python3 -c 'import json,sys; c=json.load(open(sys.argv[1])); c["permitted_axioms"]=[a for a in c["permitted_axioms"] if a!="Classical.choice"]; json.dump(c,open(sys.argv[2],"w"),indent=2)' comparator-nanoda.json "$O/judge/control-axioms.json"
( cd "$O/judge" && time env -i PATH=$B:/usr/bin:/bin HOME="$O/judge/home" TMPDIR="$O/judge/tmp" LEAN_ABORT_ON_PANIC=1 COMPARATOR_BWRAP=/usr/bin/bwrap "$B/lake" comparator --config comparator-nanoda.json --challenge-from-export "$O/challenge.export" --solution-from-export "$O/solution.export" ) 2>&1; echo "exit=$?"
log "--- con-ron"
( time "$B/con-ron" --jobs=2 --verified "$O/solution.export" ) 2>&1; echo "exit=$?"
log "--- control: permitted_axioms without Classical.choice"
( cd "$O/judge" && env -i PATH=$B:/usr/bin:/bin HOME="$O/judge/home" TMPDIR="$O/judge/tmp" LEAN_ABORT_ON_PANIC=1 COMPARATOR_BWRAP=/usr/bin/bwrap "$B/lake" comparator --config control-axioms.json --challenge-from-export "$O/challenge.export" --solution-from-export "$O/solution.export" ) 2>&1 | tail -2; echo "exit=${PIPESTATUS[0]}"
rm -f comparator-nanoda.json
run "git -C .. status --porcelain"
log "--- Palomar check functions (PalomarSubmission $(git -C $N/PalomarSubmission rev-parse HEAD))"
python3 $N/driver.py $N/PalomarSubmission "$O/untouched" "$O/built"
log "end: $(date -u +%FT%TZ)"
```

Vorlage `comparator-nanoda.tmpl` (die vier Schlüssel von `lean/comparator.json` und NanoDa wie in
1.7):

```json
{
  "challenge_module": "MatMulRank.Challenge",
  "solution_module": "MatMulRank.Solution",
  "theorem_names": [
    "MatMulRank.rank_four_two_four_eq_26"
  ],
  "permitted_axioms": [
    "propext",
    "Quot.sound",
    "Classical.choice"
  ],
  "external_kernels": {
    "nanoda": [
      "NANODA"
    ]
  }
}
```

`driver.py` ruft einzelne Funktionen von PalomarSubmission auf (kein Netz, keine Einreichung):

```python
#!/usr/bin/env python3
"""Run selected check functions of PalomarSubmission on a local checkout.

usage: driver.py <palomar_submission_dir> <untouched_checkout> <built_checkout>
No network access, no submission. Output: one block per check.
"""
import json
import sys
import traceback
from pathlib import Path

pal = Path(sys.argv[1]).resolve()
repo = Path(sys.argv[2]).resolve()
built = Path(sys.argv[3]).resolve()
sys.path.insert(0, str(pal))
sys.path.insert(0, str(pal / "scripts"))

import verify_submission as vs  # noqa: E402
import source_requirements as sr  # noqa: E402
import submission_contract as sc  # noqa: E402


def show(label, fn):
    print(f"--- {label}")
    try:
        res = fn()
        if isinstance(res, Path):
            res = str(res)
        print("OK", json.dumps(res, default=str) if res is not None else "")
        return res
    except Exception as exc:  # report, do not stop
        print("FAIL", type(exc).__name__ + ":", exc)
        for line in traceback.format_exception_only(type(exc), exc)[1:]:
            print(" ", line.rstrip())
        return None


lean = repo / "lean"
toolchain = (lean / "lean-toolchain").read_text().strip()
show("supported_toolchain(lean/lean-toolchain)", lambda: vs.supported_toolchain(toolchain))
show("validate_preservable_git_checkout(repo)", lambda: vs.validate_preservable_git_checkout(repo, "submission"))
show("tree_size(repo) <= MAX_SOURCE_BYTES",
     lambda: {"bytes": vs.tree_size(repo), "max": vs.MAX_SOURCE_BYTES,
              "ok": vs.tree_size(repo) <= vs.MAX_SOURCE_BYTES})


def inspect():
    evidence, issues = sr.inspect_lean_sources(repo)
    return {"evidence": evidence, "issues": [str(i) for i in issues]}


show("inspect_lean_sources(repo)", inspect)
show("reject_committed_build_artifacts(lean)", lambda: vs.reject_committed_build_artifacts(lean))
packages = show("manifest_packages(lean)", lambda: vs.manifest_packages(lean)) or []
show("load_comparator_config(lean/comparator.json)", lambda: vs.load_comparator_config(lean / "comparator.json"))
meta = show("load_formalization_metadata(lean/formalization.yaml) [keys]",
            lambda: sorted(sc.load_formalization_metadata(lean / "formalization.yaml").keys()))
show("normalized_provenance(load_formalization_metadata(lean/formalization.yaml))",
     lambda: sc.normalized_provenance(sc.load_formalization_metadata(lean / "formalization.yaml")))
show("repository_license_file(repo)", lambda: vs.repository_license_file(repo).name)
blean = built / "lean"
show("check_mathlib_toolchain(built project)",
     lambda: vs.check_mathlib_toolchain(blean, packages, checkout=built,
                                        project_toolchain=toolchain,
                                        project_toolchain_path="lean/lean-toolchain"))
cfg = json.loads((lean / "comparator.json").read_text())
show("shadowing_dependency(challenge_module)",
     lambda: {"challenge_module": cfg["challenge_module"],
              "shadowing_dependency": vs.shadowing_dependency(cfg["challenge_module"], packages,
                                                              source=blean, checkout=built)})
ch = lean / "MatMulRank" / "Challenge.lean"
data = ch.read_bytes()
show("Challenge size (MAX_CHALLENGE_BYTES, MAX_CHALLENGE_LINES)",
     lambda: {"bytes": len(data), "max_bytes": vs.MAX_CHALLENGE_BYTES,
              "lines": data.count(b"\n"), "max_lines": vs.MAX_CHALLENGE_LINES})
```

**Befehl und Ausgabe, vollständig:**

```
$ ./runall.sh a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0 /tmp/claude-0/n01/work
commit: a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0
start: 2026-11-26T19:45:37Z
untouched: a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0, status: [0 lines]
built: a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0, status: [0 lines]
$ lean --version
Lean (version 4.36.0, x86_64-unknown-linux-gnu, commit 611c117bfaf7b7ae1cfcf246ce6fba31e8f509e9, Release)
[exit 0]
$ lake --version
Lake version 5.0.0-src+611c117 (Lean version 4.36.0)
[exit 0]
$ lake exe cache get 2>&1 | tail -4
Decompressing 9116 already-cached file(s) (1 already decompressed)
No files to download
Decompressed 9116 already-cached file(s)
Completed successfully in 46419 ms!
[exit 0]
cache end: 2026-11-26T19:47:19Z
lake build exit 0
build end: 2026-11-26T19:48:44Z
$ grep -E '^(✖|error)' /tmp/claude-0/n01/work/build.log | wc -l
0
[exit 0]
$ tail -1 /tmp/claude-0/n01/work/build.log
Build completed successfully (4271 jobs).
[exit 0]
$ grep 'declaration uses' /tmp/claude-0/n01/work/build.log
warning: MatMulRank/Challenge.lean:94:8: declaration uses `sorry`
[exit 0]
$ grep -c '^warning' /tmp/claude-0/n01/work/build.log
124
[exit 0]
$ git -C .. status --porcelain
[exit 0]
$ python3 ../.github/scripts/lean_report.py sorry-report . /tmp/claude-0/n01/work/build.log
========================================================================
SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
SORRY: 0 'sorry' token(s) in the sources outside comments
INTENDED: 1 declaration(s) and 1 token(s) in the Palomar Challenge (MatMulRank/Challenge.lean), deliberate hole, not counted above
  lean/MatMulRank/Challenge.lean:94
  lean/MatMulRank/Challenge.lean:95
========================================================================
[exit 0]
axioms exit 0
$ python3 ../.github/scripts/lean_report.py axiom-report /tmp/claude-0/n01/work/axioms.txt | grep -E 'TOTAL'
TOTAL: STANDARD=65
[exit 0]
$ grep -c '^AXIOM-RESULT' /tmp/claude-0/n01/work/axioms.txt
65
[exit 0]
$ grep '^AXIOM-RESULT' /tmp/claude-0/n01/work/axioms.txt | grep -vc '|propext, Classical.choice, Quot.sound$'
0
[exit 1]
$ grep -E 'AXIOM-RESULT\|(MatMulRank\.rank|YangBounds\.(Gleich444|Upper4x2x4|Transponiert444)\.rank_four_two_four_(eq|le|ge)_26\|)' /tmp/claude-0/n01/work/axioms.txt
AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.rank_four_two_four_ge_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Upper4x2x4.rank_four_two_four_le_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|YangBounds.Gleich444.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
AXIOM-RESULT|MatMulRank.rank_four_two_four_eq_26|propext, Classical.choice, Quot.sound
[exit 0]
--- leanchecker over all project modules: 2026-11-26T19:48:52Z
L4C-SUMMARY|checked=32|ok=32|failed=0
--- leanchecker --fresh YangBounds.Transponiert444: 2026-11-26T19:51:40Z
L4C-FRESH|YangBounds.Transponiert444|exit=0
end leanchecker: 2026-11-26T19:58:56Z
--- Lauf A: lake comparator (start 2026-11-26T19:58:56Z)
exit=0
4:warning: MatMulRank/Challenge.lean:94:8: declaration uses `sorry`
6:Exporting #[Quot, Quot.mk, Quot.lift, Quot.ind, MatMulRank.rank_four_two_four_eq_26, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.mul, Nat.pow, Nat.gcd, Nat.div, Nat.mod, Nat.beq, Na
300:info: YangBounds/SatzA444.lean:411:0: 'YangBounds.SatzA444.exists_common_kernel' depends on axioms: [propext, Classical.choice, Quot.sound]
899:Exporting #[Quot, Quot.mk, Quot.lift, Quot.ind, MatMulRank.rank_four_two_four_eq_26, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.mul, Nat.pow, Nat.gcd, Nat.div, Nat.mod, Nat.beq, 
900:Running nanoda kernel on solution
901:nanoda kernel accepts the solution
902:Running Lean default kernel on solution
903:Lean default kernel accepts the solution
904:Your solution is okay!
906:real	1m25.906s
--- Lauf B: exports and judge from exports (start 2026-11-26T20:00:22Z)
challenge export exit=0
solution export exit=0
0abc445b9368069384a097f10937139b22b1c1f7589551f2a313e424a4105ce7  challenge.export
1067d20dc984ef4e384d7098e01a96663e06395f5553fbacdbcf4dce239dcdae  solution.export
7621188 challenge.export
210798794 solution.export
Running nanoda kernel on solution
nanoda kernel accepts the solution
Running Lean default kernel on solution
Lean default kernel accepts the solution
Your solution is okay!

real	1m7.434s
user	0m8.700s
sys	0m0.324s
exit=0
--- con-ron
con-ron: 1 inductive blocks modelled in-process: Lean.Syntax (30 generated records, checked by the fold as declarations and not counted as records of the file)
con-ron: accepted 27008 declarations (--verified)

real	0m48.772s
user	1m18.809s
sys	0m1.398s
exit=0
--- control: permitted_axioms without Classical.choice
error: Illegal axiom detected: 'Classical.choice'
exit=1
$ git -C .. status --porcelain
[exit 0]
--- Palomar check functions (PalomarSubmission 046554302064b2c83c2b924bea6db87fc5900c68)
--- supported_toolchain(lean/lean-toolchain)
OK "v4.36.0"
--- validate_preservable_git_checkout(repo)
OK 
--- tree_size(repo) <= MAX_SOURCE_BYTES
OK {"bytes": 8954128, "max": 524288000, "ok": true}
--- inspect_lean_sources(repo)
OK {"evidence": {"schema_version": 1, "module_required": true, "maximum_lines": 10000, "files_checked": 35}, "issues": []}
--- reject_committed_build_artifacts(lean)
OK 
--- manifest_packages(lean)
OK [{"name": "mathlib", "manifest_name": "mathlib", "repository": "leanprover-community/mathlib4", "url": "https://github.com/leanprover-community/mathlib4", "revision": "fc4f59e577feb1a4956671bc04ac18aaaf8cd842"}, {"name": "plausible", "manifest_name": "plausible", "repository": "leanprover-community/plausible", "url": "https://github.com/leanprover-community/plausible", "revision": "054b228ce0ac61d767c6e71ba73a24728f191b72"}, {"name": "LeanSearchClient", "manifest_name": "LeanSearchClient", "repository": "leanprover-community/LeanSearchClient", "url": "https://github.com/leanprover-community/LeanSearchClient", "revision": "4fb58e749ef3fc0395fe274f6cab70c2ea85f1c9"}, {"name": "importGraph", "manifest_name": "importGraph", "repository": "leanprover-community/import-graph", "url": "https://github.com/leanprover-community/import-graph", "revision": "8370c640afcd1cc3fb1cb9bf1560cc66eafee5e0"}, {"name": "proofwidgets", "manifest_name": "proofwidgets", "repository": "leanprover-community/ProofWidgets4", "url": "https://github.com/leanprover-community/ProofWidgets4", "revision": "2f0f3520daeac2d9310ff25b7a877a0e5cdaa203"}, {"name": "aesop", "manifest_name": "aesop", "repository": "leanprover-community/aesop", "url": "https://github.com/leanprover-community/aesop", "revision": "66ff77cf0c4c898799e4b94d14db55f7a02d0c5a"}, {"name": "Qq", "manifest_name": "Qq", "repository": "leanprover-community/quote4", "url": "https://github.com/leanprover-community/quote4", "revision": "ff055a2fcc835935e0ae607339b455a5f5896b4b"}, {"name": "batteries", "manifest_name": "batteries", "repository": "leanprover-community/batteries", "url": "https://github.com/leanprover-community/batteries", "revision": "b4b25a3886a16daacaf6615c2eea7170a6e8f458"}, {"name": "Cli", "manifest_name": "Cli", "repository": "leanprover/lean4-cli", "url": "https://github.com/leanprover/lean4-cli", "revision": "50810f72af7618bee62fe9800dc26e806c188703"}]
--- load_comparator_config(lean/comparator.json)
OK {"challenge_module": "MatMulRank.Challenge", "solution_module": "MatMulRank.Solution", "theorem_names": ["MatMulRank.rank_four_two_four_eq_26"], "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]}
--- load_formalization_metadata(lean/formalization.yaml) [keys]
OK ["automation", "classification", "project", "related_formalizations", "review", "sources", "version"]
--- normalized_provenance(load_formalization_metadata(lean/formalization.yaml))
OK {"result_origin": "original", "repository_role": "substantive-development", "responsible_maintainers": [{"name": "Justus Jeserigk", "github": "Justus42"}], "mathematical_sources": [{"title": "Lower bound 26 for the tensor rank of <4,2,4> over every field", "authors": [], "relationship": "other", "note": "First presented in this repository (literature check of 25/26 November 2026, recorded in lit/).", "type": "original-proof"}, {"title": "New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6", "authors": [{"name": "Jason Yang"}], "relationship": "background", "identifier": "arXiv:2609.14393", "location": "version 3 of 12 October 2026; normal form (N1), (N2), Theorem 2, Lemma 13", "note": "Yang's Theorem 2 gives R(<n,2,m>) >= (n+2)m + n - 3 for m >= n >= 4, i.e. the bound 25 for <4,2,4>; it is formalised in this repository (YangBounds.yang_theorem_two) and used to exclude lengths below 25. The proof of the bound 26 uses Yang's normal form. One step of the written proof of Yang's Lemma 13 could not be followed; the formalisation proves the same statement by a different argument (YangBounds/YangN4Lemma13.lean). The proof of the bound 26 also uses a sharpening of Lemma 13 by an additional term (Lemma 13', YangBounds/Lemma13Prime.lean), which is not in Yang's paper.", "type": "paper"}, {"title": "On minimizing the number of multiplications necessary for matrix multiplication", "authors": [{"name": "J. E. Hopcroft"}, {"name": "L. R. Kerr"}], "relationship": "background", "identifier": "doi:10.1137/0120004", "location": "SIAM J. Appl. Math. 20(1) (1971), 30-36; read in the form of Cornell University, Department of Computer Science, Technical Report 69-44 (September 1969), hdl:1813/5902, Theorem 1 (p. 8), Theorems 5 and 6, p. 28", "note": "Technical Report 69-44, Theorem 1, states that ceil((3pn + max(n,p))/2) multiplications are sufficient to compute the product of a p x 2 and a 2 x n matrix of indeterminates without commutativity; the products are of the form (linear form in A) x (linear form in X). For p = n = 4 this gives 26. The report names no field for this bound. The upper bound 26 is part of the compared statement. It is not proved by formalising the construction of the report: YangBounds/Upper4x2x4.lean gives an explicit algorithm with 26 products (verfahren/4x2x4-r26-s001.json, found by the project's own search), and the kernel checks its tensor identity. Lower bounds in the report: ceil(7n/2) for 2 x 2 times 2 x n (Theorem 5) and 15 for 3 x 2 times 2 x 3 (Theorem 6), for programs using multiplication, addition and subtraction with integer constants and without commutativity, proved by reduction modulo 2. The report proves no lower bound for <4,2,4>; on p. 28 it conjectures that the algorithm of Theorem 1 \"is optimal for all n and p\". The journal article itself was not read and was not compared with the report.", "type": "paper"}, {"title": "Determining the tensor rank of (2, 2, m) matrix multiplication with GPT-5.6 Sol.", "authors": [{"name": "Yaroslav Shitov"}], "relationship": "background", "identifier": "doi:10.13140/RG.2.2.29432.61441", "note": "Starting point of Yang's method. The document itself was not read; cited after Yang.", "type": "paper"}, {"title": "matmulcatalog, docs/LOWER_BOUNDS.md, line 90", "authors": [], "relationship": "other", "identifier": "https://github.com/solven-eu/matmulcatalog/blob/0a9f83a0670ac70c9d82310105faf2d9ea5956e4/docs/LOWER_BOUNDS.md", "note": "A public catalogue line states \"R(<2,4,4>) >= 26 (Hopcroft-Kerr), UB 26 -> tight\" without proof or reference beyond the name; the same repository lists this lower bound as open elsewhere (paper/theory/RANK_KNOWLEDGE.md, line 297). Hopcroft and Kerr's Technical Report 69-44 contains no such lower bound; it states optimality for all p and n only as a conjecture (p. 28). Recorded as a related claim, not as a source of the proof.", "type": "other"}], "related_formalizations": [{"identifier": "https://github.com/fallnlove/mm325_proof", "relationship": "other", "note": "Lean formalisation of the rank of <3,2,5> by Tsyganov, Parkina, Samsonov and Rakhuba (arXiv:2609.22054). Up to stage 5 this repository depended on it as a Lake package (imported first by YangBounds/Basic.lean, later only by a separate bridge module); the bridge and the dependency were removed when the library was ported to Lean 4.36.0. It is not a dependency of this entry (no module of the submitted chain imports it, and the Lake files do not require it)."}]}
--- repository_license_file(repo)
OK "LICENSE"
--- check_mathlib_toolchain(built project)
OK [{"revision": "fc4f59e577feb1a4956671bc04ac18aaaf8cd842", "toolchain": "leanprover/lean4:v4.36.0"}]
--- shadowing_dependency(challenge_module)
OK {"challenge_module": "MatMulRank.Challenge", "shadowing_dependency": null}
--- Challenge size (MAX_CHALLENGE_BYTES, MAX_CHALLENGE_LINES)
OK {"bytes": 4374, "max_bytes": 102400, "lines": 97, "max_lines": 1000}
end: 2026-11-26T20:02:43Z
```

Gegenprobe: `git status --porcelain` im gebauten Klon ist vor und nach dem Comparator leer;
`grep -vc` über die 65 `AXIOM-RESULT`-Zeilen ergibt 0 Zeilen mit anderen Axiomen (Exit 1 von
`grep` heißt hier „keine Zeile“). Der Kontrolllauf ohne `Classical.choice` lehnt ab, wie er soll.
