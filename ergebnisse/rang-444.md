# The tensor rank of ⟨4,2,4⟩ is 26 over every field: a machine-checked proof

*First version 25 November 2026 (lower bound in Lean 4.19.0); updated 26 November 2026 (statement "= 26" as one Lean theorem, Lean 4.36.0). Both approved as results of this repository by the repository owner. Not reviewed by a human mathematician.*

## 1. Statement

Let R_K(⟨n,l,m⟩) be the tensor rank of the bilinear map that multiplies an n×l matrix by an l×m matrix over a field K, i.e. the smallest r such that there are linear forms α_t, β_t and matrices C_t (t = 1, …, r) with A·B = Σ_t α_t(A) β_t(B) C_t for all A, B.

**Claim.** For every field K, R_K(⟨4,2,4⟩) = 26.

The claim is one Lean 4 theorem, verbatim (`lean/MatMulRank/Challenge.lean`, line 94, statement; `lean/MatMulRank/Solution.lean`, line 89, proof):

```lean
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26
```

in namespace `MatMulRank`. `MatMulRank.tensorRank K n l m` (same file) is the infimum (`sInf`) of the lengths `r` for which a `MatMulRank.BilinearAlgorithm K n l m r` exists; that structure is exactly a decomposition as above, with `A * B` the ordinary Mathlib matrix product. The set of lengths is not empty (schoolbook algorithm), so the infimum is the least length. The only hypothesis is `[Field K]`: no characteristic, finiteness or algebraic-closedness assumption. The file `Challenge.lean` imports only Mathlib and states the theorem with `sorry` on purpose (statement file of the Palomar registry); the proof is in `Solution.lean`.

The Solution transfers the project theorem `YangBounds.Gleich444.rank_four_two_four_eq_26` (`lean/YangBounds/Gleich444.lean`, line 27) along `MatMulRank.tensorRank_eq_yangBounds`, which proves that the rank notion of the Challenge equals the project's (`YangBounds.tensorRank`, defined with `Nat.find` in `lean/YangBounds/Basic.lean`). `Gleich444` combines two theorems:

- **Lower bound 26: to our knowledge the first proof of this bound (literature checks of 25/26 November 2026 and of 26 November 2026).** `YangBounds.Transponiert444.rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4` (`lean/YangBounds/Transponiert444.lean`, line 660). Proof outline in Section 3.
- **Upper bound 26: known.** R(⟨4,2,4⟩) ≤ 26 follows from the formula ⌈(3nm + max(n,m))/2⌉ of Hopcroft and Kerr [HK71]. In Lean: `YangBounds.Upper4x2x4.rank_four_two_four_le_26 (K : Type u) [Field K] : tensorRank K 4 2 4 ≤ 26` (`lean/YangBounds/Upper4x2x4.lean`, line 189), an explicit algorithm with 26 products taken from the scheme `verfahren/4x2x4-r26-s001.json` (coefficients in {−1, 0, 1} ⊂ ℤ, hence valid over every field). Its tensor identity over ℤ is checked by the Lean kernel (`decide +kernel`). Independently of Lean, the same scheme was accepted by two independently written exact-arithmetic checkers (Python and Rust).

Previously known: 25 ≤ R(⟨4,2,4⟩) ≤ 26, the lower bound being Yang's [Yang26, Theorem 2: R(⟨n,2,m⟩) ≥ (n+2)m + n − 3 for m ≥ n ≥ 4].

## 2. Verification record

### 2.1 Current state (Lean 4.36.0)

| Item | Value |
|---|---|
| Repository | github.com/Justus42/matmul-rank-n2m |
| Checked commit | `676cdf5deb786e81a66342606d4dd2b6f919745e` on `main`. Between this commit and the commit that added this version of the note, no Lean file, no Lake file, no workflow and no file of the Palomar entry changed |
| Toolchain | `leanprover/lean4:v4.36.0` (Lean 4.36.0, commit `611c117bfaf7b7ae1cfcf246ce6fba31e8f509e9`) |
| Mathlib | tag v4.36.0, commit `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`; no other direct dependency |
| Build and axioms (GitHub Actions) | workflow `.github/workflows/lean-project.yml`, run 45869038515, job 140079318183 (17:35–17:38 UTC, 26 November 2026): success, "Build completed successfully (4271 jobs).", "SORRY: 0" in the build log and in the sources outside comments; the only `sorry` is the intended one of the Challenge (`MatMulRank/Challenge.lean:94`, reported separately as `INTENDED`). `MatMulRank.rank_four_two_four_eq_26`, `YangBounds.Gleich444.rank_four_two_four_eq_26`, `YangBounds.Upper4x2x4.rank_four_two_four_le_26` and `YangBounds.Transponiert444.rank_four_two_four_ge_26` depend only on `propext`, `Classical.choice`, `Quot.sound` (all 65 reported main theorems: "TOTAL: STANDARD=65") |
| Second build, fresh checkout, kernel re-check | workflow `.github/workflows/zweitlauf.yml`, run 45869043624, job 140079342228 (17:35–17:46 UTC): "CHECKED COMMIT: 676cdf5deb786e81a66342606d4dd2b6f919745e", 0 olean/ilean/trace files in the fresh checkout, `leanchecker` shipped with the Lean 4.36.0 toolchain over every project module: 32 of 32 OK; `#print axioms` for the three theorems above: only `propext`, `Classical.choice`, `Quot.sound`; `leanchecker --fresh` on `YangBounds.Transponiert444`: exit 0 |
| Statement check | the statement of `MatMulRank.rank_four_two_four_eq_26` with the definitions of the Challenge was compared with the claim by one reviewing model instance (Claude) and, independently, by GPT 6.2 Sol (OpenAI): both "matches". Reservations as recorded: the reviewer did not read `Definitions.lean` itself and relied on the identity check in the job log; the comparator was not part of that job; GPT 6.2 Sol saw only the Challenge file |
| Palomar comparator | local runs by an agent, outside Palomar's sandbox, with the Lean 4.36.0 toolchain from the GitHub release: `lake comparator` with the Lean kernel and NanoDa accepted the Solution against the Challenge, also from exports as Palomar's judge does it, and `con-ron` accepted the Solution export (`palomar/BELEGE.md`, section 1.7, on commit `6d44bb1`, whose Lean files and `comparator.json` are those of `676cdf5`) |
| Human review | none |

Details: `pruefvermerke/B-034.md`, `lean/prosa/s5_abgleich_s5-20.md`, `versuche/s5-r5-sol-b034/gpt_antwort.md`, `lean/prosa/s5_merge_s5-22.md`.

### 2.2 Earlier state (Lean 4.19.0, lower bound only)

The first version of this note (25 November 2026) rested on the lower bound alone, on Lean 4.19.0; the equality then combined it with the known upper bound outside Lean. That state is kept on the branch `lean-4.19` (commit `71240f81988ae10323af035c3273a45b5038ac3a`).

| Item | Value |
|---|---|
| Lean source state | commit `c3c3884028c840d0afd9c14944394aee21fd5729` |
| Toolchain | `leanprover/lean4:v4.19.0` (Lean 4.19.0, commit 6caaee842e94; Lake 5.0.0-6caaee8) |
| mathlib | `c44e0c8ee63ca166450922a373c7409c5d26b00b` |
| External Lean package | `fallnlove/mm325_proof` (package `mm325_lower_bound`) at `759cf4a8524d4212e7832046204c90b9361ba2bb`, a Lake dependency of `lean/`, not copied; that repository states no license. Up to commit `ce94c42` the module `YangBounds.Basic` imported it; from commit `62c3dc6` on, only a separate bridge module imported it, and no module in the import chain of the final theorem did. Stage 5 removed the bridge and the dependency |
| First build (GitHub Actions) | run 45699204903, job 139504538345: green, no `sorry` in build log or source; `#print axioms YangBounds.Transponiert444.rank_four_two_four_ge_26`: only `propext`, `Classical.choice`, `Quot.sound` |
| Statement check | one reviewing model instance (Claude) and, independently, GPT 6.2 Sol (OpenAI): the Lean statement says R_K(⟨4,2,4⟩) ≥ 26 for every field K |
| Second build, fresh checkout | workflow `zweitlauf.yml`, run 45706606136, job 139530090202, built `main` at `667df45edbfdfb72eb9e1e88a492d36e6553d09c`: no project build artefacts in the checkout, only the official mathlib cache; "Build completed successfully.", 0 lines with `sorry`, 0 lines with `error`; lean4checker tag v4.19.0 (commit `e11f65c651edd58d68ba260015d2bfde5102cd7f`), 27 of 27 modules OK; `--fresh` on `YangBounds.Transponiert444`: exit 0 |
| Repeated second build after removing the package from the chain | same workflow, run 45833618872, job 139956567190 (26 November 2026), commit `62c3dc60b44680e9367fbe3052f287c8f7e8f882`: build successful, 0 `sorry`, lean4checker 29 of 29 modules OK, only the standard axioms, `--fresh` exit 0. The only proof change against the first parent `ce94c42` is one proof step in `lean/YangBounds/SatzB444.lean` (statements and definitions unchanged); report `lean/prosa/a7_zweitlauf_bericht.md` |
| Statement in a fresh file | `lean/Zweitlauf/B016Aussage.lean` (outside the library); run 45708303302, job 139535849738 on `main` at `ad10846`: with `pp.notation false` the statement reads `∀ (K : Type) [inst : Field K], LE.le 26 (YangBounds.tensorRank K 4 2 4)`; axioms `propext`, `Classical.choice`, `Quot.sound` |
| Second environment | local build in a separate cloud container (mathlib built from source), commit `64554f9cba2d1731932184b01eaae3714304b790`: `lake build` exit 0, 0 `sorry`, standard axioms. **Reported by the session that ran it; its build log is not in the repository.** |
| Human review | none |

Details: `pruefvermerke/B-016.md` and `pruefvermerke/B-016-zweitlauf.md`.

### 2.3 The port

Stage 5 ported the library from Lean 4.19.0 to Lean 4.36.0 on the branch `portierung` and merged it into `main`. Imports, syntax, Mathlib names and proof bodies changed; statements and definitions of the chain kept their content. Where the wording of a statement had to change (Mathlib's `MvPolynomial.coeff`), old and new wording are listed in `palomar/BELEGE.md`, section 1.3. The upper bound in Lean (`Upper4x2x4.lean`), the equality (`Gleich444.lean`) and the Palomar files (`lean/MatMulRank/`, `lean/comparator.json`, `lean/formalization.yaml`) were added. Reports: `lean/prosa/s5_portierung_s5-03.md`, `lean/prosa/s5_portierung_s5-17.md`, `lean/prosa/s5_merge_s5-22.md`.

## 3. Proof outline (lower bound)

The proof follows Yang's normal-form method for ⟨n,2,m⟩ [Yang26], which in turn builds on Shitov's argument for ⟨2,2,m⟩ [Shitov26]. Suppose ⟨4,2,4⟩ had a decomposition of length 25 over some field K. (Lengths below 25 are excluded by Yang's Theorem 2, formalized here as `yang_theorem_two`.)

1. **Base change and generic normal form** (`Endsatz444.lean`, `Bruecke444.lean`). The rank does not increase under field extension, so one may pass to an algebraically closed field. A generic change of basis over the algebraic closure of K(S,T) (S a generic 4×4 matrix, T a generic 2×2 matrix of indeterminates) puts the decomposition into Yang's normal form (N1), (N2). This "bridge" also shows that the normal form is not symmetric (see step 4).
2. **Four residual cases** (Satz A; `SatzA444.lean`, `Lemma13Prime.lean`). In the normal form, with Yang's maps L and H, length 25 forces ρ = 3 and (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}. This uses a sharpening (Lemma 13′) of Yang's Lemma 13. When formalizing Yang's Theorem 2, the models could not follow one step of the written proof of Lemma 13; the formalization (`YangN4Lemma13.lean`) proves the same statement by a different argument (over the quotient Q / im F₁).
3. **(4,7) and (5,7) are impossible** (Satz B; `SatzB444.lean`, `SatzB444Poly.lean`, `SatzB444Final.lean`). In case (3,6) the decomposition is "symmetric": there is an invertible G with Gᵀb_t ∥ a_t for all terms t.
4. **No symmetric decomposition of length 25** (Satz C; `SatzC444Kern.lean`, `SatzC444Generisch.lean`). Differentiating the decomposition identity at two nearby normal-form points yields an identity that forbids a quadric through all a_t; at length 25 such a quadric always exists. Hence (3,6) is excluded, and in (5,8) the decomposition is not symmetric.
5. **Case (5,8), sub-case A is impossible** (Lemma P, Satz E; `LemmaP444.lean`, `SatzE444.lean`, `SatzE444Buendel.lean`). Without symmetry, the kernel vectors of the pencil F_γ span a space of dimension 2 (sub-case A) or 3 (sub-case B). In sub-case A, a Kronecker normal form puts all a_t on a twisted cubic and all b_t on a rational quartic with a common parameter, so the a_t ⊗ b_t span at most 8 dimensions, against the 9 required.
6. **Sub-case B is impossible** (Lemma K, Lemma Z, Satz F; `LemmaK444.lean`, `LemmaZ444.lean`, `SatzF444.lean`, `Transponiert444.lean`). From below: at a generic point there are many pairwise distinct points [a_t ⊗ b_t] (at least 13 in the prose; the Lean chain uses 11), because at most two terms can coincide and only in a rigid way (Lemma K). From above: if both the decomposition and its transpose lie in sub-case B at the same point, their parameters lie on two curves in ℙ¹ × ℙ¹ of bidegrees (d,1) and (1,e) with d, e ≤ 3, which meet in at most d·e + 1 ≤ 10 points unless they coincide; coinciding curves force symmetry, contradicting step 4. `Transponiert444.lean` proves that the transposed decomposition satisfies the required hypothesis at the generic normal form, which removes the last hypothesis.

All files named in this section are in `lean/YangBounds/`. Steps 2 to 6 were first written as prose proofs by AI models (`lean/prosa/s2_444_spurA_r2.md`, `s2_444_spurA_r4.md`, `s2_444_spurA_r6.md`, `s2_444_spurA_r9_bruecke.md`) and then formalized. **Only the Lean statements carry the result.**

## 4. What the result depends on

The Lean proof depends on Lean 4 and Mathlib only. The library no longer depends on `fallnlove/mm325_proof` (see Section 2.2). The proof contains no `sorry` and no project-specific axioms; the only `sorry` in the library is the intended one in the Challenge file, which states the theorem for the comparison and is not used by the proof. Yang's Theorems 1 and 2 are formalized in the same repository as Yang's theorems.

## 5. What is not claimed

The following parts of the prose are **not** covered by a Lean statement and keep the status *behauptet* (claimed, unverified) in this repository:

- the exact shape of a coinciding pair of terms (common x and w) in Lemma K/Z;
- Satz F in its literal wording for a single normal form (Lean covers it at the generic normal form, and at a single normal form only under extra hypotheses);
- the exclusion of case (5,8) (F1) as a statement of its own (it follows from the final theorem);
- the versions "for p in a non-empty open set" (instead of "at the generic point") in Satz C and Satz F;
- in Satz A the isomorphism part of Corollary A1; in Satz B the symmetry with μ_t ≠ 0, Lemma V and the full wording of Lemma S; for Lemma P and Satz E the parts recorded as claimed in `pruefvermerke/`.

None of these is needed for the final theorem. The ⟨4,2,4⟩ result says nothing about ⟨3,2,7⟩, whose rank is open in this repository (34 ≤ R ≤ 35). The entry for the Palomar registry is prepared in `lean/`; nothing has been submitted.

## 6. Related claims

The literature check of 25/26 November 2026 (`lit/WACHE.md`, full search log in `lit/WACHE-WIEDERHOLUNG-2026-11-25.md`) found no proof of R(⟨4,2,4⟩) ≥ 26 or = 26 (in any permutation of the format, over any field) and no scheme with 25 products. The check of 26 November 2026 (`lit/WACHE-2026-11-26-S5.md`) found no publication of the lower bound 26 by others. The first check found one public statement of the bound:

- Repository github.com/solven-eu/matmulcatalog, file `docs/LOWER_BOUNDS.md`, line 90, in the list "Other notable small formats": "`R(⟨2,4,4⟩) ≥ 26` (Hopcroft-Kerr), UB 26 → tight". The line was added in commit `0a9f83a0670ac70c9d82310105faf2d9ea5956e4` of 16 June 2026 and is unchanged at the repository's head `5ed2ee9798595621db7b5393df7669f7dd3a2fd1` (checked 25 November 2026).

The entry gives no proof and no reference other than the name Hopcroft–Kerr. The same repository lists this lower bound as open elsewhere: `paper/theory/RANK_KNOWLEDGE.md`, line 297, has "open lower bound" for ⟨2,4,4⟩; the machine-readable list `docs/lower-bounds.json` has no entry for ⟨2,4,4⟩. The accompanying article by Lacelle (arXiv:2606.13408 v3, Section 7.5) states: "Hopcroft–Kerr proved matching lower bounds only for ⟨2, 2, n⟩ and ⟨2, 3, 3⟩."

## 7. Sources

- [HK71] J. E. Hopcroft, L. R. Kerr, *On minimizing the number of multiplications necessary for matrix multiplication*, SIAM J. Appl. Math. 20(1) (1971), 30–36, doi:10.1137/0120004. (Upper bound formula; the original was not read here, the formula is cited identically in [Yang26], [TPSR26] and [Lacelle26].)
- [Yang26] J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393 [cs.CC], v3 of 12 October 2026. (Normal form, Theorem 2, the bound 25.)
- [TPSR26] A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054 [cs.CC, cs.DS], v1 of 18 September 2026; Lean repository github.com/fallnlove/mm325_proof. (Lean template in the early stages and a dependency of the Lean 4.19.0 state, see Section 2.2; not a dependency of the current library.)
- [Shitov26] Y. Shitov, *Determining the tensor rank of (2, 2, m) matrix multiplication with GPT-5.6 Sol.*, 2026, doi:10.13140/RG.2.2.29432.61441. (Starting point of Yang's method; cited after [Yang26], the document itself was not read here.)
- [Lacelle26] B. Lacelle, *A catalog of fast matrix multiplication algorithms with exhaustive derivations*, arXiv:2606.13408, v3 of 14 August 2026. (Section 7.5, quoted in Section 6.)

A formalization of someone else's theorem remains their theorem. The bound 26 for ⟨4,2,4⟩ and steps 2 to 6 above are, to our knowledge, proved first in this repository; steps 1 to 6 rely on Yang's normal form.

## 8. AI disclosure

This work was done by AI models, directed by the repository owner, who is not a mathematician. An orchestrating Claude session (Anthropic) assigned single tasks to further Claude sessions, which wrote the prose proofs, the Lean formalization, the port to Lean 4.36.0, the Palomar files, the reviews and the literature checks. Model names are given only where the repository records them:

- task sessions that reported their model in the project log reported `claude-opus-5-5` (`LOG.md`); the model of the orchestrating session is not recorded there;
- commit trailers (`Co-Authored-By`) in the history up to commit `676cdf5` name "Claude Opus 5.5" (417 commits), "Claude Fable 5.2" (8 commits) and "Claude" without a version (6 commits). Commits without such a trailer name no model.

Models of other families, used only for independent cross-checks: GPT 6.2 Sol (OpenAI, `openai/gpt-6.2-sol` via OpenRouter, high reasoning effort, batch) for statement checks and as a second reader of reviews, including the statement checks of the lower bound and of the statement "= 26"; in stages 0 and 1 a Gemini model (`gemini-4-carbon`, Google) for cross-checks, until its spending limit was reached.

No human mathematician has reviewed the proof. The machine check is the Lean build and its re-checks described in Section 2; the comparison of the Lean statements with the claim was done by models. All rules, failed attempts and review records are in the repository (`PROTOKOLL.md`, `versuche/`, `pruefvermerke/`).
