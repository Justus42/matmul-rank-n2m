# Lean project `yang_bounds` (stage 1)

Task S1-01 (stage 1, round 1, role: formaliser). This project is the base on which the
formalisation of Yang v3 is built:

> J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*,
> arXiv:2609.14393v3 (12.10.2026).

The results formalised here are Yang's theorems, not ours (protocol section 9).

**Status of every statement in this project: `behauptet` or `vermutet`. Nothing is `geprüft`.**
Since task S1-17 the project contains no `sorry` (see "Open proofs" below). The stage-1
completion criterion (build without `sorry`, axiom check, statement check, green build in
GitHub Actions) is **not** yet met: the statement check of protocol 5.1 item 3 is still open,
and the status changes only through that check.

Rules for this directory (unchanged): no `sorry` and no own axioms in finished work, every
main theorem gets a `#print axioms` check, the build in GitHub Actions is authoritative.
`NACHBAU.md` is the report of task A-02 and is not part of this project.

## Layout

| File | Content |
|---|---|
| `lakefile.toml`, `lean-toolchain`, `lake-manifest.json` | Lean 4.19.0, mathlib `c44e0c8` (tag v4.19.0), dependency `mm325_lower_bound` |
| `YangBounds/Basic.lean` | definitions (`BilinearAlgorithm`, `tensorRank`), schoolbook algorithm, bridge to the dependency |
| `YangBounds/Statements.lean` | Yang's two bounds, the upper bound for ⟨3,2,6⟩, and the consequences |
| `YangBounds/CeilBound.lean` | `ceil_bound_iff` (moved out of `Statements.lean` in S1-13 to avoid an import cycle) |
| `YangBounds/YangN3Teil1.lean` … `YangN3Teil3.lean`, `YangN3.lean` | proof of Theorem 1 (S1-09 to S1-11, assembled in S1-13) |
| `YangBounds/YangN4Lemma13.lean` | Lemma 13 in the repaired form (S1-15) |
| `YangBounds/YangN4Haupt.lean` | main proof of Theorem 2 with Lemma 13 as a hypothesis (S1-16) |
| `YangBounds/Upper3x2x6.lean` | explicit algorithm with 30 products for ⟨3,2,6⟩ (S1-12) |
| `YangBounds.lean` | library root |
| `Axioms.lean` | `#print axioms` for all main statements (not part of the library) |

## Dependency `fallnlove/mm325_proof`

The repository has no license (`lit/LIZENZEN.md`, A-01). Following protocol 11.3 it is a
Lake dependency by Git URL at commit `759cf4a8524d4212e7832046204c90b9361ba2bb`; no code
from it is copied into this repository. `lake-manifest.json` pins it together with mathlib
and all transitive packages at exactly the revisions of the dependency's own manifest.

## Definitions

* `BilinearAlgorithm K n l m r`: linear forms `alpha k` on `Matrix (Fin n) (Fin l) K`,
  linear forms `beta k` on `Matrix (Fin l) (Fin m) K`, matrices `coeff k` in
  `Matrix (Fin n) (Fin m) K` (`k : Fin r`), with
  `A * B = ∑ k, (alpha k A * beta k B) • coeff k` for all `A`, `B` (ordinary mathlib product).
  This is Yang's "R-rank decomposition of ⟨k,l,m⟩" (Section 1) word for word.
* `tensorRank K n l m`: `Nat.find` of the existence of an algorithm, i.e. the smallest length.
  Existence comes from the schoolbook algorithm `standardAlgorithm`, proved here, so the
  minimum is genuine (no default value). Sanity check `tensorRank_le_mul`: `R ≤ n·l·m`.
* `K : Type u` with `[Field K]` only: arbitrary fields, any universe, no assumption on the
  characteristic or on cardinality.
* For `n = 3`, `l = 2`, `BilinearAlgorithm` has exactly the fields of the dependency's
  `MatrixAlgorithm`. `tensorRank_three_two_eq` proves
  `tensorRank K 3 2 m = MatrixMultiplicationLowerBound.matrixTensorRank K m`, and
  `tpsr_lower_bound` transports the dependency's theorem `24 m < 5 R` (Tsyganov et al.,
  arXiv:2609.22054, Theorem 1) to our rank, with the dependency's proof.

## Target statements

| Lean name | Statement | Source | Proof |
|---|---|---|---|
| `yang_theorem_one` | `3 ≤ m → ⌈(24m+2)/5⌉₊ ≤ tensorRank K 3 2 m` | Yang v3, Theorem 1 (`m ≥ n = 3`) | `YangN3.yang_theorem_one_proof` (S1-13) |
| `yang_theorem_two` | `4 ≤ n → n ≤ m → (n+2)·m + (n−3) ≤ tensorRank K n 2 m` | Yang v3, Theorem 2 (`m ≥ n ≥ 4`) | `YangN4Haupt.yang_theorem_two_of_lemma13` with `YangN4Lemma13.lemma13_statement` (S1-17) |
| `hopcroft_kerr_three_two_six` | `tensorRank K 3 2 6 ≤ 30` | Hopcroft–Kerr 1971 (cited by Yang) | `Upper3x2x6.hopcroft_kerr_three_two_six` (S1-13) |
| `rank_three_two_six` | `tensorRank K 3 2 6 = 30` | Yang v3, Section 1 | from the three above |
| `rank_four_two_four_ge` | `25 ≤ tensorRank K 4 2 4` | Yang v3, Section 1 | from `yang_theorem_two` |
| `rank_four_two_five_ge` | `31 ≤ tensorRank K 4 2 5` | Yang v3, Section 1 (not a stage-1 target) | from `yang_theorem_two` |
| `rank_three_two_six_ge` | `30 ≤ tensorRank K 3 2 6` | Theorem 1 with `m = 6` | from `yang_theorem_one` |
| `yang_theorem_one_algorithm`, `yang_theorem_two_algorithm` | the same bounds for every single algorithm, without a rank notion | | from the theorems |
| `ceil_bound_iff` | `⌈(24m+2)/5⌉₊ ≤ R ↔ 24m+2 ≤ 5R` | | proved |

Notes for the statement check (A-03 style), without verdict:

* Yang's Theorem 1 reads "For m ≥ 3, R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉", Theorem 2 "For m ≥ n ≥ 4,
  R(⟨n,2,m⟩) ≥ (n+2)m + (n−3)"; the abstract adds "over arbitrary fields". ⟨n,2,m⟩ is an
  `n × 2` matrix times a `2 × m` matrix; the Lean statements use exactly this orientation.
* The ceiling is stated literally over `ℚ` with `Nat.ceil`; `ceil_bound_iff` gives the
  integer form. In Theorem 2, `n - 3` is natural-number subtraction, harmless for `n ≥ 4`.
* Yang's proof assumes w.l.o.g. an infinite field and uses an algebraically closed field in
  Lemma 9 (passage to the algebraic closure). This is part of the proof, not of the
  statement; the statement here is for every field.

## Open proofs (`sorry`)

None. The three `sorry` of task S1-01 are replaced:

1. `yang_theorem_one`: by `YangN3.yang_theorem_one_proof` (task S1-13, from parts 1 to 3 of
   tasks S1-09 to S1-11).
2. `hopcroft_kerr_three_two_six`: by `Upper3x2x6.hopcroft_kerr_three_two_six` (tasks S1-12,
   S1-13; candidate `verfahren/3x2x6-r30-hk71.json` of task A-10).
3. `yang_theorem_two`: by `YangN4Haupt.yang_theorem_two_of_lemma13`, whose hypothesis (Lemma 13,
   repaired form of `lean/prosa/yang_n4.md`, Section 6) is supplied by
   `YangN4Lemma13.lemma13_statement` (task S1-17; the two files are S1-16 and S1-15).

Import structure (no cycles): `Statements.lean` imports `CeilBound`, `YangN3`, `Upper3x2x6`,
`YangN4Lemma13` and `YangN4Haupt`; none of these imports `Statements.lean`. For this,
S1-13 moved `ceil_bound_iff` to `CeilBound.lean`, and S1-17 removed the unused import of
`Statements` from `YangN4Haupt.lean`.

This says only that Lean accepts the proofs. Whether the Lean statements say what Yang's
theorems say is the statement check (protocol 5.1 item 3), which is still open; until then
every statement stays `behauptet`.

## Build

```
cd lean
lake build               # library YangBounds
lake env lean Axioms.lean
```

Where the mathlib cache is reachable, `lake exe cache get` before `lake build` saves the
mathlib build. Do not run `lake update` (it would rewrite `lake-manifest.json`).

GitHub Actions: `.github/workflows/lean-project.yml` (task S1-14, job "Build lean/ and report
axioms") builds this project and reports `sorry` and the axioms of the main theorems; the green
run there is authoritative (protocol 5.1 item 4), not a local build.

## Local build of task S1-01 (25.11.2026, cloud session, 4 cores) — status `behauptet`

Historical record of the first build, when three proofs were still open.

* Toolchain from the GitHub release archive `lean-4.19.0-linux.tar.zst` (SHA-256
  `6fe3ce97…a813fe`), linked with `elan toolchain link`; the mathlib cache was blocked, so
  mathlib was built from source: one block of 14 min 46 s for the dependency and its imports,
  then about 1 min for `YangBounds`.
* `lake build`: success. Warnings: style lints inside the dependency, and exactly three
  `declaration uses 'sorry'` in `YangBounds/Statements.lean` (the three proofs open at that time).
* `lake env lean Axioms.lean`: `tensorRank_le_mul`, `tensorRank_three_two_eq`,
  `tpsr_lower_bound`, `ceil_bound_iff` use only `propext`, `Classical.choice`, `Quot.sound`;
  the open statements and their consequences additionally show `sorryAx`.
