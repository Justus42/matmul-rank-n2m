# ENTWURF, NICHT FREIGEGEBEN: Ergebnis-Notiz ⟨4,2,4⟩

> **Entwurf. Nicht freigegeben. Weder als Ergebnis bezeichnen noch veröffentlichen, bevor Justus freigibt.**
>
> - Auftrag: S2-59 (Stufe 2, nach Runde 11), im Auftrag des Orchestrators. Datum: 25.11.2026.
> - Grundlage: `STATUS.md`, `pruefvermerke/README.md`, `pruefvermerke/B-014.md`, `pruefvermerke/B-016.md`, `behauptungen/B-010.md`, `behauptungen/B-014.md` bis `B-016.md`, `lit/QUELLEN.md`, `lit/LIZENZEN.md`, Lean-Quellen unter `lean/YangBounds/`, Prosa unter `lean/prosa/`, alles auf `main` bei 6466d4d. An den Lean-Quellen hat sich seit c3c3884 nichts geändert (`git diff c3c3884 6466d4d -- lean/YangBounds` ist leer).
> - Die Notiz geht nicht über `STATUS.md` hinaus. Status dort: B-016 und B-010 **geprüft**. Teile der Prosa (unten Abschnitt 5) sind nur **behauptet**.
> - Offen vor einer Freigabe: (1) der Zweitlauf aus Runde 12 (`pruefvermerke/B-016-zweitlauf.md`), Platzhalter `[…]` unten; (2) die genauen Claude-Modellversionen im KI-Hinweis, die trägt Justus ein; (3) ob die Notiz Yangs Lemma 13 (Befund L5, siehe Abschnitt 3) so erwähnen soll.
> - Quellen: nur, was in `lit/QUELLEN.md` belegt ist. Bei Hopcroft-Kerr steht dort „Original nicht gelesen“, die Formel ist dreifach übereinstimmend zitiert. Die Notiz zitiert HK71 deshalb nur für den bekannten Wert 26, und der Wert ist hier zusätzlich mit einem eigenen Verfahren über ℤ nachgeprüft (B-010).
> - Sprache: Der Kopf ist deutsch (Repo-Regel), die Notiz englisch (Auftrag).

---

## A machine-checked lower bound: the tensor rank of ⟨4,2,4⟩ is 26 over every field

*Draft, 25 November 2026. Not released. Not reviewed by a human mathematician.*

### 1. Statement

Let R_K(⟨n,l,m⟩) be the tensor rank of the bilinear map that multiplies an n×l matrix by an l×m matrix over a field K, i.e. the smallest r such that there are linear forms α_t, β_t and matrices C_t (t = 1, …, r) with A·B = Σ_t α_t(A) β_t(B) C_t for all A, B.

**Claim.** For every field K, R_K(⟨4,2,4⟩) = 26.

- **Lower bound 26 (new here).** Machine-checked in Lean 4. The final theorem, verbatim (`lean/YangBounds/Transponiert444.lean`, line 655):

  ```lean
  theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4
  ```

  in namespace `YangBounds.Transponiert444`. `tensorRank K n l m` (`lean/YangBounds/Basic.lean`) is defined as the least `r` for which a `BilinearAlgorithm K n l m r` exists; that structure is exactly a decomposition as above, with `A * B` the ordinary mathlib matrix product. The only hypothesis is `[Field K]`: no characteristic, finiteness or algebraic-closedness assumption.
- **Upper bound 26 (known).** R(⟨4,2,4⟩) ≤ 26 follows from the formula ⌈(3nm + max(n,m))/2⌉ of Hopcroft and Kerr [HK71]. Independently of that, the scheme `verfahren/4x2x4-r26-s001.json` in this repository (26 products, coefficients in {−1, 0, 1} ⊂ ℤ, hence valid over every field) was accepted by two independently written exact-arithmetic checkers (Python and Rust).
- There is **no single Lean theorem for the equality**; it is the combination of the two items above.

Previously known: 25 ≤ R(⟨4,2,4⟩) ≤ 26, the lower bound being Yang's [Yang26, Theorem 2: R(⟨n,2,m⟩) ≥ (n+2)m + n − 3 for m ≥ n ≥ 4].

### 2. Verification record

| Item | Value |
|---|---|
| Repository | github.com/Justus42/matmul-rank-n2m |
| Lean source state | commit `c3c3884028c840d0afd9c14944394aee21fd5729` (unchanged in `lean/YangBounds/` up to `6466d4d`) |
| Toolchain | `leanprover/lean4:v4.19.0` |
| mathlib | `c44e0c8ee63ca166450922a373c7409c5d26b00b` |
| External Lean dependency | `fallnlove/mm325_proof` at `759cf4a8524d4212e7832046204c90b9361ba2bb` (imported via Lake, not copied; that repository states no license) |
| Build (GitHub Actions) | run 45699204903, job 139504538345: green, no `sorry` in build log or source |
| Axioms | `#print axioms YangBounds.Transponiert444.rank_four_two_four_ge_26`: only `propext`, `Classical.choice`, `Quot.sound` |
| Statement check | one reviewing model instance (Claude) and, independently, GPT 6.2 Sol (OpenAI): the Lean statement says R_K(⟨4,2,4⟩) ≥ 26 for every field K |
| Second, independent build | [pending: fresh checkout, kernel re-check, statement in a fresh file; see `pruefvermerke/B-016-zweitlauf.md`] |
| Human review | none |

### 3. Proof outline

The proof follows Yang's normal-form method for ⟨n,2,m⟩ [Yang26], which in turn builds on Shitov's argument for ⟨2,2,m⟩ [Shitov26]. Suppose ⟨4,2,4⟩ had a decomposition of length 25 over some field K. (Lengths below 25 are excluded by Yang's Theorem 2, formalized here as `yang_theorem_two`.)

1. **Base change and generic normal form** (`Endsatz444.lean`, `Bruecke444.lean`). The rank does not increase under field extension, so one may pass to an algebraically closed field. A generic change of basis over the algebraic closure of K(S,T) (S a generic 4×4 matrix, T a generic 2×2 matrix of indeterminates) puts the decomposition into Yang's normal form (N1), (N2). This "bridge" also shows that the normal form is not symmetric (see step 4).
2. **Four residual cases** (Satz A; `SatzA444.lean`, `Lemma13Prime.lean`). In the normal form, with Yang's maps L and H, length 25 forces ρ = 3 and (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}. This uses a sharpening (Lemma 13′) of Yang's Lemma 13. While formalizing Yang's Theorem 2 we used a repaired proof of Lemma 13 (`YangN4Lemma13.lean`); the statement of Lemma 13 is unchanged.
3. **(4,7) and (5,7) are impossible** (Satz B; `SatzB444.lean`, `SatzB444Poly.lean`, `SatzB444Final.lean`). In case (3,6) the decomposition is "symmetric": there is an invertible G with Gᵀb_t ∥ a_t for all terms t.
4. **No symmetric decomposition of length 25** (Satz C; `SatzC444Kern.lean`, `SatzC444Generisch.lean`). Differentiating the decomposition identity at two nearby normal-form points yields an identity that forbids a quadric through all a_t; at length 25 such a quadric always exists. Hence (3,6) is excluded, and in (5,8) the decomposition is not symmetric.
5. **Case (5,8), sub-case A is impossible** (Lemma P, Satz E; `LemmaP444.lean`, `SatzE444.lean`, `SatzE444Buendel.lean`). Without symmetry, the kernel vectors of the pencil F_γ span a space of dimension 2 (sub-case A) or 3 (sub-case B). In sub-case A, a Kronecker normal form puts all a_t on a twisted cubic and all b_t on a rational quartic with a common parameter, so the a_t ⊗ b_t span at most 8 dimensions, against the 9 required.
6. **Sub-case B is impossible** (Lemma K, Lemma Z, Satz F; `LemmaK444.lean`, `LemmaZ444.lean`, `SatzF444.lean`, `Transponiert444.lean`). From below: at a generic point there are many pairwise distinct points [a_t ⊗ b_t] (at least 13 in the prose; the Lean chain uses 11), because at most two terms can coincide and only in a rigid way (Lemma K). From above: if both the decomposition and its transpose lie in sub-case B at the same point, their parameters lie on two curves in ℙ¹ × ℙ¹ of bidegrees (d,1) and (1,e) with d, e ≤ 3, which meet in at most d·e + 1 ≤ 10 points unless they coincide; coinciding curves force symmetry, contradicting step 4. `Transponiert444.lean` proves that the transposed decomposition satisfies the required hypothesis at the generic normal form, which removes the last hypothesis.

Steps 2 to 6 were first written as prose proofs by AI models (`lean/prosa/s2_444_spurA_r2.md`, `s2_444_spurA_r4.md`, `s2_444_spurA_r6.md`, `s2_444_spurA_r9_bruecke.md`) and then formalized. **Only the Lean statements carry the result.**

### 4. What the result depends on

The Lean proof depends on Lean 4, mathlib and the imported definitions of `fallnlove/mm325_proof` (used for the link between our rank notion and theirs for n = 3). It contains no `sorry` and no project-specific axioms. Yang's Theorems 1 and 2 are formalized in the same repository as Yang's theorems.

### 5. What is not claimed

The following parts of the prose are **not** covered by a Lean statement and keep the status *behauptet* (claimed, unverified) in this repository:

- the exact shape of a coinciding pair of terms (common x and w) in Lemma K/Z;
- Satz F in its literal wording for a single normal form (Lean covers it at the generic normal form, and at a single normal form only under extra hypotheses);
- the exclusion of case (5,8) (F1) as a statement of its own (it follows from the final theorem);
- the versions "for p in a non-empty open set" (instead of "at the generic point") in Satz C and Satz F;
- in Satz A the isomorphism part of Corollary A1; in Satz B the symmetry with μ_t ≠ 0, Lemma V and the full wording of Lemma S; for Lemma P and Satz E the parts recorded as claimed in `pruefvermerke/`.

None of these is needed for the final theorem.

### 6. Sources

- [HK71] J. E. Hopcroft, L. R. Kerr, *On minimizing the number of multiplications necessary for matrix multiplication*, SIAM J. Appl. Math. 20(1) (1971), 30–36, doi:10.1137/0120004. (Upper bound formula; the original was not read here, the formula is cited identically in [Yang26], [TPSR26] and Lacelle, arXiv:2606.13408.)
- [Yang26] J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393 [cs.CC], v3 of 12 October 2026. (Normal form, Theorem 2, the bound 25.)
- [TPSR26] A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054 [cs.CC, cs.DS], v1 of 18 September 2026; Lean repository github.com/fallnlove/mm325_proof. (Lean template; imported dependency.)
- [Shitov26] Y. Shitov, *Determining the tensor rank of (2, 2, m) matrix multiplication with GPT-5.6 Sol.*, 2026, doi:10.13140/RG.2.2.29432.61441. (Starting point of Yang's method; cited after [Yang26], the document itself was not read here.)

A formalization of someone else's theorem remains their theorem. The bound 26 for ⟨4,2,4⟩ and steps 2 to 6 above are new in this repository; steps 1 to 6 rely on Yang's normal form.

### 7. AI disclosure

This work was done by AI models, directed by a non-mathematician (Justus). An orchestrating session of Claude (Anthropic) assigned single tasks to Claude sub-agents, which wrote the prose proofs, the Lean formalization and the reviews. [Exact Claude model versions: to be filled in by Justus.] GPT 6.2 Sol (OpenAI) was used as a model of another family for independent statement checks and reviews; in earlier stages a Gemini model (Google) was used for some cross-checks. No human mathematician has reviewed the proof. The machine check is the Lean build described in Section 2; the statement comparison was done by models. All rules, failed attempts and review records are in the repository (`PROTOKOLL.md`, `versuche/`, `pruefvermerke/`).
