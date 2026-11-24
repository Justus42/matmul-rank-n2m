# matmul-rank-n2m

How many multiplications are needed, at minimum, to multiply an n×2 matrix by a 2×m matrix?

This repository works on the exact tensor rank of the small matrix multiplication formats ⟨n,2,m⟩ over arbitrary fields. Every result here is either a machine-checked Lean proof (lower bound) or a scheme confirmed by two independent exact checkers (upper bound).

**Status: just started. No results yet.** See [STATUS.md](STATUS.md).

## Targets

| Format | Lower bound | Upper bound | State |
|---|---|---|---|
| ⟨3,2,6⟩ | 30 | 30 | settled by Yang (v3); goal: Lean formalization |
| ⟨4,2,4⟩ | 25 | 26 | open |
| ⟨3,2,7⟩ | 34 | 35 | open (gap computed from the published formulas) |
| ⟨4,2,5⟩ | 31 | 32 | open |

These numbers are taken from the literature and are not yet re-verified here. Stage 0 of the project checks them.

## Plan

0. Rebuild the existing Lean proof for ⟨3,2,5⟩ and confirm the starting table.
1. Formalize the bounds of Yang's third version in Lean.
2. Attack ⟨4,2,4⟩ from both sides: a proof of 26, or a scheme with 25.
3. ⟨3,2,7⟩.

The full working rules are in [PROTOKOLL.md](PROTOKOLL.md) (German).

## How this project works

This is an experiment in AI-driven mathematical research, run by a non-mathematician.

- The mathematical work is done by AI models: an orchestrating Claude session (Anthropic, currently Claude Fable 5.2) that assigns single tasks to sub-agents. Models from other families are used for cross-checks.
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
