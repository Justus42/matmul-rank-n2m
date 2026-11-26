# Lean project `yang_bounds`

Lean 4.36.0 (`lean-toolchain`: `leanprover/lean4:v4.36.0`) with Mathlib v4.36.0 (commit
`fc4f59e577feb1a4956671bc04ac18aaaf8cd842`, pinned in `lakefile.toml` and `lake-manifest.json`).
Mathlib is the only direct dependency. Two libraries:

* `YangBounds`: the formalisation of Yang's bounds for `⟨n,2,m⟩` and the proof that the tensor
  rank of `⟨4,2,4⟩` is 26 over every field.
* `MatMulRank`: the files for an entry in the Palomar registry (Challenge, shared definitions,
  Solution).

The main theorem:

```lean
-- lean/MatMulRank/Challenge.lean, line 94 (statement, with `sorry` on purpose)
-- lean/MatMulRank/Solution.lean, line 89 (proof)
theorem MatMulRank.rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26
```

It is proved from `YangBounds.Gleich444.rank_four_two_four_eq_26`, which combines the lower bound
`YangBounds.Transponiert444.rank_four_two_four_ge_26` with the upper bound
`YangBounds.Upper4x2x4.rank_four_two_four_le_26`. The note
[`ergebnisse/rang-444.md`](../ergebnisse/rang-444.md) states the result and its checks; the
status of every statement is recorded in `pruefvermerke/README.md` (German), not here. Yang's
theorems formalised here remain Yang's theorems (protocol section 9).

Rules for this directory: no `sorry` and no own axioms in finished work, every main theorem gets
an axiom report, and the build in GitHub Actions is authoritative. The only `sorry` is the
intended one in the Palomar Challenge `MatMulRank/Challenge.lean`; the workflow reports it
separately as `INTENDED`.

## Layout

| File | Content |
|---|---|
| `lakefile.toml`, `lean-toolchain`, `lake-manifest.json` | Lean 4.36.0, Mathlib v4.36.0, default targets `YangBounds` and `MatMulRank` |
| `MatMulRank/Challenge.lean` | Palomar statement file: `MatMulRank.BilinearAlgorithm`, `MatMulRank.tensorRank` and the theorem `MatMulRank.rank_four_two_four_eq_26` with `sorry`; imports only Mathlib |
| `MatMulRank/Definitions.lean` | the definition block of the Challenge, character for character, with the same imports, for the Solution |
| `MatMulRank/Solution.lean` | `tensorRank_eq_yangBounds` (the two rank notions agree) and the proof of `MatMulRank.rank_four_two_four_eq_26`; also keeps the former Challenge statement `MatMulRank.rank_four_two_four_ge_26` |
| `comparator.json` | Palomar comparator configuration: Challenge and Solution module, theorem name, permitted axioms `propext`, `Quot.sound`, `Classical.choice` |
| `formalization.yaml` | Palomar metadata of the entry (sources, AI disclosure, review status) |
| `YangBounds/Basic.lean` | definitions `BilinearAlgorithm`, `tensorRank`, schoolbook algorithm |
| `YangBounds/Statements.lean`, `CeilBound.lean` | Yang's two bounds, the upper bound for ⟨3,2,6⟩, and the consequences |
| `YangBounds/YangN3Teil1.lean` … `YangN3Teil3.lean`, `YangN3.lean` | proof of Yang's Theorem 1 |
| `YangBounds/YangN4Lemma13.lean`, `YangN4Haupt.lean` | proof of Yang's Theorem 2 (Lemma 13 by a different argument) |
| `YangBounds/Upper3x2x6.lean` | explicit algorithm with 30 products for ⟨3,2,6⟩ |
| `YangBounds/Bruecke444.lean`, `Endsatz444.lean`, `SatzA444.lean`, `Lemma13Prime.lean`, `SatzB444*.lean`, `SatzC444*.lean`, `LemmaP444.lean`, `SatzE444*.lean`, `LemmaK444.lean`, `LemmaZ444.lean`, `SatzF444.lean`, `Transponiert444.lean` | the chain of the lower bound 26 for ⟨4,2,4⟩, ending in `Transponiert444.rank_four_two_four_ge_26` (outline in `ergebnisse/rang-444.md`, section 3) |
| `YangBounds/Upper4x2x4.lean` | explicit algorithm with 26 products for ⟨4,2,4⟩ from `verfahren/4x2x4-r26-s001.json`, tensor identity checked by the kernel (`decide +kernel`), `rank_four_two_four_le_26` |
| `YangBounds/Gleich444.lean` | `rank_four_two_four_eq_26`: `tensorRank K 4 2 4 = 26` |
| `YangBounds/S4BedingterAusschluss.lean` | a conditional statement for ⟨3,2,7⟩ from stage 4, not part of the ⟨4,2,4⟩ chain |
| `YangBounds.lean` | library root (not a build target: the glob `YangBounds.+` covers only the submodules) |
| `Axioms.lean` | `#print axioms` list from earlier stages; it imports the root module, so it is not the authoritative axiom report (see "Build and check") |
| `Zweitlauf/B016Aussage.lean` | the lower bound restated in a fresh file, checked by `.github/workflows/zweitlauf-b016.yml` |
| `NACHBAU.md` | report of task A-02 (rebuild of the ⟨3,2,5⟩ proof in stage 0, German); not part of this project |
| `prosa/` | prose proofs, reviews and task reports (German) |

## Definitions

* `BilinearAlgorithm K n l m r`: linear forms `alpha k` on `Matrix (Fin n) (Fin l) K`,
  linear forms `beta k` on `Matrix (Fin l) (Fin m) K`, matrices `coeff k` in
  `Matrix (Fin n) (Fin m) K` (`k : Fin r`), with
  `A * B = ∑ k, (alpha k A * beta k B) • coeff k` for all `A`, `B` (ordinary Mathlib product).
  This is Yang's "R-rank decomposition of ⟨k,l,m⟩" (Section 1) word for word. `YangBounds` and
  `MatMulRank` define the same structure.
* `YangBounds.tensorRank K n l m` is `Nat.find` of the existence of an algorithm;
  `MatMulRank.tensorRank K n l m` is `sInf` of the set of lengths of algorithms. Both are the
  smallest length, and `MatMulRank.tensorRank_eq_yangBounds` proves that they are equal. The set
  is never empty (schoolbook algorithm), so no default value is used.
* `K : Type u` with `[Field K]` only: arbitrary fields, any universe, no assumption on the
  characteristic or on cardinality.

## Main statements

| Lean name | Statement | Source |
|---|---|---|
| `YangBounds.yang_theorem_one` | `3 ≤ m → ⌈(24m+2)/5⌉₊ ≤ tensorRank K 3 2 m` | Yang v3, Theorem 1 |
| `YangBounds.yang_theorem_two` | `4 ≤ n → n ≤ m → (n+2)·m + (n−3) ≤ tensorRank K n 2 m` | Yang v3, Theorem 2 |
| `YangBounds.hopcroft_kerr_three_two_six` | `tensorRank K 3 2 6 ≤ 30` | Hopcroft–Kerr 1971 (cited by Yang) |
| `YangBounds.rank_three_two_six` | `tensorRank K 3 2 6 = 30` | Yang v3, Section 1 |
| `YangBounds.rank_four_two_four_ge` | `25 ≤ tensorRank K 4 2 4` | Yang v3, Section 1 |
| `YangBounds.rank_four_two_five_ge` | `31 ≤ tensorRank K 4 2 5` | Yang v3, Section 1 |
| `YangBounds.Transponiert444.rank_four_two_four_ge_26` | `26 ≤ tensorRank K 4 2 4` | this repository |
| `YangBounds.Upper4x2x4.rank_four_two_four_le_26` | `tensorRank K 4 2 4 ≤ 26` | value of the formula of Hopcroft–Kerr (technical report 1969, journal 1971), algorithm `verfahren/4x2x4-r26-s001.json` |
| `YangBounds.Gleich444.rank_four_two_four_eq_26` | `tensorRank K 4 2 4 = 26` | this repository |
| `MatMulRank.rank_four_two_four_eq_26` | `tensorRank K 4 2 4 = 26` with the Challenge definitions | this repository |

The full list of main theorems whose axioms are reported is `MAIN_THEOREMS` in
`.github/scripts/lean_report.py`.

## Build and check

```
cd lean
lake exe cache get        # Mathlib build cache; do not run `lake update`
lake build 2>&1 | tee build.log
python3 ../.github/scripts/lean_report.py sorry-report . build.log
python3 ../.github/scripts/lean_report.py gen-check . MainAxioms.lean
lake env lean MainAxioms.lean 2>&1 | tee axioms.txt
python3 ../.github/scripts/lean_report.py axiom-report axioms.txt
```

These are the build and report steps of the workflow `.github/workflows/lean-project.yml`.
The workflow also checks, before the build, that the definition block of
`MatMulRank/Challenge.lean` and `MatMulRank/Definitions.lean` and their import lines are
identical (step "Shared definitions of Challenge and Solution are identical"; see "Palomar
entry" below). The expected result: "Build completed successfully"; exactly one `sorry`
warning, `MatMulRank/Challenge.lean:94:8: declaration uses 'sorry'` (the intended hole of the
Challenge), besides linter and deprecation warnings that do not concern `sorry`; "SORRY: 0"
twice; and from `axiom-report` for every main theorem only the axioms `propext`,
`Classical.choice`, `Quot.sound` ("TOTAL: STANDARD=65"). `palomar/BELEGE.md`, section 1.4,
records such a local run with commands and output, section 9 the same on the commit named
below.

GitHub Actions is authoritative (protocol 5.1 item 4). Runs on commit
`@@W@@`:

* `.github/workflows/lean-project.yml`, run @@LPRUN@@, job @@LPJOB@@: success.
* `.github/workflows/zweitlauf.yml` (fresh checkout, no build artefacts, `leanchecker` of the
  toolchain over every project module, `#print axioms`, `leanchecker --fresh` on
  `YangBounds.Transponiert444`), run @@ZWRUN@@, job @@ZWJOB@@: success, 32 of 32 modules OK.
  On `main` this workflow is not started by a push; it runs by `workflow_dispatch` (input `ref`),
  on pushes to the branch `portierung`, and on pull requests that change the workflow file.

Between `@@WS@@` and the commit that added these run numbers only text files changed
(`README.md`, this file, `ergebnisse/rang-444.md`, `palomar/BELEGE.md`). The first runs of the
Lean 4.36.0 state were on commit `676cdf5` (run 45869038515, job 140079318183, and run
45869043624, job 140079342228). Since then task N-06 re-determined the import list of
`YangBounds/Basic.lean` from this project's own build (now only `Mathlib.Data.Matrix.Basic`;
`YangBounds/S4BedingterAusschluss.lean` imports `Mathlib.Tactic.LinearCombination` itself), with
no statement, definition or proof changed, and task N-01 revised `formalization.yaml`.

## Palomar entry

The entry is prepared, not submitted; only the repository owner submits. The files are
`MatMulRank/Challenge.lean`, `MatMulRank/Definitions.lean`, `MatMulRank/Solution.lean`,
`comparator.json` and `formalization.yaml`. Palomar's requirements are listed in
`palomar/ANFORDERUNGEN.md` and evidenced one by one in `palomar/BELEGE.md` (both German).

How to check them:

* The Challenge imports only Mathlib, and its definition block is identical to
  `MatMulRank/Definitions.lean`; the workflow `lean-project.yml` checks this (log line "shared
  definitions and imports identical").
* Palomar compares Challenge and Solution with `lake comparator` of the submitted toolchain,
  configured by `comparator.json`. `palomar/BELEGE.md`, sections 1.7 and 9, record local runs by an
  agent with the Lean 4.36.0 toolchain from the GitHub release: `lake comparator` with the Lean
  kernel and NanoDa ("Your solution is okay!"), the same from exports as Palomar's judge does it,
  `con-ron` on the Solution export, and a control run that rejects a forbidden axiom. These runs
  were outside Palomar's sandbox; section 1.7 lists what they do not show.
  Section 9 repeats them on commit `@@WS@@`.
* Palomar's own check functions (toolchain, Lean sources, `comparator.json`,
  `formalization.yaml`, licence) ran locally on the files: `palomar/BELEGE.md`, sections 2, 8 and 9.

## Earlier state: Lean 4.19.0

Up to stage 5 this project ran on Lean 4.19.0 with mathlib `c44e0c8ee63ca166450922a373c7409c5d26b00b`.
The final theorem was the lower bound `YangBounds.Transponiert444.rank_four_two_four_ge_26`
alone, and the project depended on the Lean package `fallnlove/mm325_proof` (package
`mm325_lower_bound`, no license, `lit/LIZENZEN.md`). Up to commit `ce94c42`
`YangBounds/Basic.lean` imported it; commit `62c3dc6` replaced that import by the 21 Mathlib
imports of the former dependency module, and from then on only a separate bridge module
(`YangBounds/BrueckeMM325.lean`) imported the package; no module in the import chain of the final
theorem did.
Stage 5 ported the library to Lean 4.36.0 on the branch `portierung`, removed the bridge and the
dependency, added the upper bound and the Palomar files, and merged the result into `main`.
Task N-06 then re-determined the import list of `Basic.lean` from this project's own build.
Statements and definitions of the chain kept their content; changes of wording are listed in
`palomar/BELEGE.md`, section 1.3, and in the port reports `prosa/s5_portierung_s5-03.md` and
`prosa/s5_portierung_s5-17.md`. The Lean 4.19.0 state stays on the branch `lean-4.19` (commit
`71240f81988ae10323af035c3273a45b5038ac3a`), which is not changed.
