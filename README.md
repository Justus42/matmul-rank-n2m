# matmul-rank-n2m

How many multiplications are needed, at minimum, to multiply an n×2 matrix by a 2×m matrix?

This repository works on the exact tensor rank of the small matrix multiplication formats ⟨n,2,m⟩ over arbitrary fields. Lower bounds here count only as machine-checked Lean proofs; upper bounds count only as schemes confirmed by two independent exact checkers (for ⟨4,2,4⟩ the upper bound is also a Lean theorem).

**Status:** R(⟨4,2,4⟩) = 26 over every field, stated and proved as one Lean theorem, `MatMulRank.rank_four_two_four_eq_26`, on Lean 4.36.0 with Mathlib v4.36.0 (see the table and [the note](ergebnisse/rang-444.md)). Stage 5 has ended: the Lean library was ported from Lean 4.19.0 to Lean 4.36.0, and the files for an entry in the Palomar registry were prepared in `lean/`. Nothing has been submitted to Palomar. The rank of ⟨3,2,7⟩ is open (34 ≤ R ≤ 35). See [STATUS.md](STATUS.md).

## Targets

| Format | Lower bound | Upper bound | State |
|---|---|---|---|
| ⟨3,2,6⟩ | 30 | 30 | settled by Yang (v3); Lean formalization of Yang's bound in this repository (status geprüft). The theorem is Yang's |
| ⟨4,2,4⟩ | **26** | 26 | **rank 26 over every field**, Lean theorem `MatMulRank.rank_four_two_four_eq_26` (status geprüft). Lower bound: to our knowledge the first proof (literature checks of 25 and 26 November 2026). Upper bound: the known value of the formula of Hopcroft–Kerr (technical report 1969, journal 1971), who also conjectured it to be optimal but proved no lower bound for this format. See [the note](ergebnisse/rang-444.md) |
| ⟨3,2,7⟩ | 34 | 35 | open |
| ⟨4,2,5⟩ | 31 | 32 (fields of characteristic ≠ 2); 33 (characteristic 2) | open. The scheme with 32 products has coefficients in ½ℤ; for characteristic 2 the best upper bound found in the literature check is 33 (Hopcroft–Kerr formula), see `lit/QUELLEN.md` |

### ⟨4,2,4⟩ in Lean

The statement, in `lean/MatMulRank/Challenge.lean` (line 94), with the definitions `MatMulRank.BilinearAlgorithm` and `MatMulRank.tensorRank` of the same file, which imports only Mathlib:

```lean
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26
```

The Challenge file states the theorem with `sorry` on purpose: this is the format of the Palomar registry. The proof is in `lean/MatMulRank/Solution.lean`. It transfers the project theorem `YangBounds.Gleich444.rank_four_two_four_eq_26`, which combines

- the lower bound `YangBounds.Transponiert444.rank_four_two_four_ge_26` (`26 ≤ tensorRank K 4 2 4`, `lean/YangBounds/Transponiert444.lean`), and
- the upper bound `YangBounds.Upper4x2x4.rank_four_two_four_le_26` (`tensorRank K 4 2 4 ≤ 26`, `lean/YangBounds/Upper4x2x4.lean`): an explicit algorithm with 26 products, taken from the scheme `verfahren/4x2x4-r26-s001.json` (coefficients in {−1, 0, 1}), whose tensor identity is checked by the Lean kernel. The same scheme was accepted by two independently written exact checkers. The value 26 is the known upper bound of Hopcroft and Kerr (Cornell technical report 69-44, 1969, Theorem 1; SIAM J. Appl. Math. 1971). In that report they conjectured that their algorithm is optimal for all formats p×2 by 2×n (p. 28), which for ⟨4,2,4⟩ means 26; they proved lower bounds only for 2×2 by 2×n and 3×2 by 2×3 (see [the note](ergebnisse/rang-444.md), Section 1).

Machine checks on commit `a1e0deb6d5ef38032d64c5b3813ec7a96a49ace0` (Lean 4.36.0, Mathlib v4.36.0 = commit `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`):

- `lean-project.yml`, run 45886015262, job 140136780218: build successful, no `sorry` except the intended one in the Challenge, and `MatMulRank.rank_four_two_four_eq_26`, `YangBounds.Gleich444.rank_four_two_four_eq_26`, `YangBounds.Upper4x2x4.rank_four_two_four_le_26` and `YangBounds.Transponiert444.rank_four_two_four_ge_26` depend only on the axioms `propext`, `Classical.choice`, `Quot.sound`.
- `zweitlauf.yml`, run 45886019141, job 140141105711: fresh checkout without build artefacts, build, kernel re-check with `leanchecker` of the Lean 4.36.0 toolchain, 32 of 32 project modules OK, the same axioms, and `leanchecker --fresh` on `YangBounds.Transponiert444` with exit 0.

Between `a1e0deb` and the commit that added these run numbers, only `README.md`, `lean/README.md`, `ergebnisse/rang-444.md` and `palomar/BELEGE.md` changed; no Lean file, no Lake file, no workflow and no other file of the Palomar entry. The first runs of the Lean 4.36.0 state were on commit `676cdf5` (run 45869038515, job 140079318183, and run 45869043624, job 140079342228); since then the import lists of `YangBounds/Basic.lean` and `YangBounds/S4BedingterAusschluss.lean` were re-determined from this project's own build (task N-06; no statement, definition or proof changed) and `lean/formalization.yaml` was revised (task N-01). The statement of the Challenge was compared with the claim "R_K(⟨4,2,4⟩) = 26 for every field K" by one reviewing model instance and, independently, by a model of another family (GPT 6.2 Sol). Both found that it matches; their reservations are recorded in `pruefvermerke/B-034.md`. Human review: none.

### Palomar files

The entry is prepared, not submitted. Only the repository owner submits.

| File | Content |
|---|---|
| `lean/MatMulRank/Challenge.lean` | statement file: definitions and theorem, imports only Mathlib |
| `lean/MatMulRank/Definitions.lean` | the definitions of the Challenge, character for character, for the Solution |
| `lean/MatMulRank/Solution.lean` | proof of the Challenge theorem from the project library `YangBounds` |
| `lean/comparator.json` | Challenge module, Solution module, theorem name, permitted axioms |
| `lean/formalization.yaml` | metadata of the entry (sources, AI disclosure, review status) |
| `palomar/ANFORDERUNGEN.md` | Palomar's requirements, with references to Palomar's rules (German) |
| `palomar/BELEGE.md` | one piece of evidence (command and output) per requirement (German) |

How to check them: build `lean/` as described in [lean/README.md](lean/README.md), or read the two job logs above. `palomar/BELEGE.md` records local runs, by an agent and outside Palomar's sandbox, of `lake comparator` (Lean kernel and NanoDa), of `con-ron` on the export, and of Palomar's own check functions (sections 1.7, 2 and 8, and again in section 9 on commit `a1e0deb`), with commands and output.

### Earlier state (Lean 4.19.0, lower bound only)

Up to stage 5 the project ran on Lean 4.19.0 with mathlib `c44e0c8`, and the result was the lower bound `YangBounds.Transponiert444.rank_four_two_four_ge_26` alone; the equality combined it with the known upper bound outside Lean. The project then also depended on the Lean package `fallnlove/mm325_proof` (package `mm325_lower_bound`); up to commit `ce94c42` the module `YangBounds/Basic.lean` imported it; commit `62c3dc6` replaced that import by the 21 Mathlib imports of the former dependency module, after which only a separate bridge module imported the package and no module in the import chain of the final theorem did. Stage 5 removed the bridge and the dependency, and task N-06 re-determined the import list of `Basic.lean` from this project's own build (now only `Mathlib.Data.Matrix.Basic`). This state is kept on the branch [`lean-4.19`](https://github.com/Justus42/matmul-rank-n2m/tree/lean-4.19) (commit `71240f81988ae10323af035c3273a45b5038ac3a`). Its machine checks: GitHub Actions run 45699204903, job 139504538345 (source state `c3c3884`); fresh-checkout build with lean4checker v4.19.0, 27 of 27 modules OK (run 45706606136, job 139530090202, commit `667df45`); the statement in a fresh file `lean/Zweitlauf/B016Aussage.lean` (run 45708303302, job 139535849738); repeated at `62c3dc6`, 29 of 29 modules OK (run 45833618872, job 139956567190). Details in [the note](ergebnisse/rang-444.md), section 2.

One public catalogue line already states this bound without proof; see "Related claims" in [the note](ergebnisse/rang-444.md).

The other rows are taken from the literature and are not yet all re-verified here.

## Plan

0. Rebuild the existing Lean proof for ⟨3,2,5⟩ and confirm the starting table.
1. Formalize the bounds of Yang's third version in Lean.
2. Attack ⟨4,2,4⟩ from both sides: a proof of 26, or a scheme with 25.
3. A short exploration of ⟨4,2,5⟩ and ⟨3,2,7⟩: does an attack on a further format pay off?
4. A narrow attack on ⟨3,2,7⟩.
5. Port of the Lean library for the Palomar registry, and a second reading of the written ⟨3,2,7⟩ argument without Lean.

The full working rules are in [PROTOKOLL.md](PROTOKOLL.md) (German).

## How this project works

This is an experiment in AI-driven mathematical research, run by a non-mathematician.

- The mathematical work is done by AI models: an orchestrating Claude session (Anthropic) that assigns single tasks to further Claude sessions. Task sessions that reported their model reported `claude-opus-5-5` (`LOG.md`); the commit trailers mostly name Claude Opus 5.5. Models from other families are used only for cross-checks: GPT 6.2 Sol (OpenAI, via OpenRouter) for independent statement checks and second readings, and earlier a Gemini model (Google). The full AI disclosure for ⟨4,2,4⟩ is in Section 8 of [the note](ergebnisse/rang-444.md). No human mathematician has reviewed the results.
- No claim counts because a model says so. A lower bound counts only with a Lean proof that builds without `sorry`, uses only standard axioms, and whose statement was independently compared with the claim. A scheme counts only if two independently written exact-arithmetic checkers accept it.
- Failed approaches are kept in `versuche/`.
- The words "proved" and "solved" are used only for items with status **geprüft** (verified).

## Status words

| German (used in this repo) | Meaning |
|---|---|
| vermutet | idea without evidence |
| behauptet | claimed, not yet verified |
| geprüft | verified by the rules above |
| widerlegt | refuted |
| aufgegeben | stopped, with the reason recorded |

## Credit

The results this project builds on belong to their authors:

- J. E. Hopcroft, L. R. Kerr, *On minimizing the number of multiplications necessary for matrix multiplication*, Technical Report 69-44, Cornell University (1969), and SIAM J. Appl. Math. 20 (1971)
- J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393
- A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054
- C. Wang, *Automated Lower Bounds for Bilinear Complexity over Finite Fields*, arXiv:2603.07280

A Lean formalization of someone else's theorem remains their theorem.

## License

Apache License 2.0, see [LICENSE](LICENSE). Third-party material keeps its own license.
