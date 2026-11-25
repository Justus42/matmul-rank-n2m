# matmul-rank-n2m

How many multiplications are needed, at minimum, to multiply an n×2 matrix by a 2×m matrix?

This repository works on the exact tensor rank of the small matrix multiplication formats ⟨n,2,m⟩ over arbitrary fields. Every result here is either a machine-checked Lean proof (lower bound) or a scheme confirmed by two independent exact checkers (upper bound).

**Status:** stage 2 (⟨4,2,4⟩) reached its completion criterion: R(⟨4,2,4⟩) = 26 over every field, lower bound machine-checked in Lean (see the table and [the note](ergebnisse/rang-444.md)). Stage 3, a short exploration of ⟨4,2,5⟩ and ⟨3,2,7⟩, has not started yet. See [STATUS.md](STATUS.md).

## Targets

| Format | Lower bound | Upper bound | State |
|---|---|---|---|
| ⟨3,2,6⟩ | 30 | 30 | settled by Yang (v3); Lean formalization of Yang's bound in this repository (status geprüft). The theorem is Yang's |
| ⟨4,2,4⟩ | **26** | 26 | **rank 26 over every field**. Lower bound: Lean proof in this repository (status geprüft), to our knowledge the first proof (literature check of 25/26 November 2026). Upper bound: Hopcroft–Kerr (1971), scheme over ℤ re-checked here. See [the note](ergebnisse/rang-444.md) |
| ⟨3,2,7⟩ | 34 | 35 | open (gap computed from the published formulas) |
| ⟨4,2,5⟩ | 31 | 32 | open |

The lower bound 26 for ⟨4,2,4⟩ is the Lean theorem
`YangBounds.Transponiert444.rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4`
(Lean 4.19.0, mathlib `c44e0c8`, source state `c3c3884`; GitHub Actions run 45699204903, job 139504538345: no `sorry`, only the axioms `propext`, `Classical.choice`, `Quot.sound`).
Second, independent machine check: a fresh-checkout build of `667df45` with kernel re-check by lean4checker v4.19.0, 27 of 27 modules OK (run 45706606136, job 139530090202); the statement elaborated in a fresh file `lean/Zweitlauf/B016Aussage.lean` (run 45708303302, job 139535849738); and a build from source in a second environment at `64554f9`, whose log is not in the repository.
Its statement was compared with the claim by one reviewing model instance and, independently, by a model of another family (GPT 6.2 Sol). Human review: none.
The upper bound 26 is the known value of Hopcroft and Kerr (1971); the scheme `verfahren/4x2x4-r26-s001.json` (coefficients in {−1, 0, 1}) was accepted by two independently written exact checkers.
There is no single Lean theorem for "rank = 26"; the equality combines the machine-checked lower bound with the known upper bound.
The proof depends on the imported Lean package `fallnlove/mm325_proof`. One public catalogue line already states this bound without proof; see "Related claims" in [the note](ergebnisse/rang-444.md).

The other rows are taken from the literature and are not yet all re-verified here.

## Plan

0. Rebuild the existing Lean proof for ⟨3,2,5⟩ and confirm the starting table.
1. Formalize the bounds of Yang's third version in Lean.
2. Attack ⟨4,2,4⟩ from both sides: a proof of 26, or a scheme with 25.
3. A short exploration of ⟨4,2,5⟩ and ⟨3,2,7⟩: does an attack on a further format pay off?

The full working rules are in [PROTOKOLL.md](PROTOKOLL.md) (German).

## How this project works

This is an experiment in AI-driven mathematical research, run by a non-mathematician.

- The mathematical work is done by AI models: an orchestrating Claude session (Anthropic, Claude Fable 5.2 as reported by the model) that assigns single tasks to further Claude sessions (mostly Claude Opus 5.5 by their own reports and commit trailers). Models from other families are used only for cross-checks: GPT 6.2 Sol (OpenAI, via OpenRouter) for independent statement checks and second readings, and earlier a Gemini model (Google). The full AI disclosure for ⟨4,2,4⟩ is in Section 8 of [the note](ergebnisse/rang-444.md). No human mathematician has reviewed the results.
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

- J. E. Hopcroft, L. R. Kerr, *On minimizing the number of multiplications necessary for matrix multiplication*, SIAM J. Appl. Math. 20 (1971)
- J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393
- A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054
- C. Wang, *Automated Lower Bounds for Tensor Rank over Finite Fields*, arXiv:2603.07280

A Lean formalization of someone else's theorem remains their theorem.

## License

Apache License 2.0, see [LICENSE](LICENSE). Third-party material keeps its own license.
