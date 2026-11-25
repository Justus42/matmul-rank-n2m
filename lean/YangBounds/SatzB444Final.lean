import YangBounds.SatzA444
import YangBounds.SatzB444

/-!
# Satz B for `⟨4,2,4⟩` at length 25 without hypotheses

Task S2-18 (stage 2, round 5, track A, role: formaliser).

`SatzB444.lean` (task S2-15) proves `satzB`, `satzB_symm` and `satzB_global` under the two
explicit hypotheses `SatzAHyp K` and `CommonKernelHyp K`. Both are discharged here by the
results of task S2-14 in `SatzA444.lean`:

* `SatzAHyp K` by `SatzA444.satzA_statement K` (a proof of `SatzA444.SatzAStatement K`, whose
  definition is the same proposition);
* `CommonKernelHyp K` by `SatzA444.exists_common_kernel`, applied to every `alg`.

Each theorem below has, character for character, the statement of the corresponding theorem in
`SatzB444.lean` with the binders `(hA : SatzAHyp _)` and `(hN : CommonKernelHyp _)` deleted.
The file lives in the same namespace and opens the same namespaces as `SatzB444.lean`, so every
name in the statements resolves to the same constant.
-/

namespace YangBounds
namespace SatzB444

open Module YangN4Haupt SatzB444Poly MvPolynomial

universe u

/-! ## The two hypotheses are theorems -/

/-- `SatzAHyp K` holds over every field (by Satz A, task S2-14). -/
theorem satzAHyp_holds (K : Type u) [Field K] : SatzAHyp K :=
  SatzA444.satzA_statement K

/-- `CommonKernelHyp K` holds over every field (by Lemma 13′, task S2-14). -/
theorem commonKernelHyp_holds (K : Type u) [Field K] : CommonKernelHyp K :=
  fun alg h1 h2 hcase => SatzA444.exists_common_kernel alg h1 h2 hcase

/-! ## Satz B without hypotheses -/

section SatzBUnbedingt

variable {K : Type u} [Field K]

/-- **Satz B** (B-009) without hypotheses: statement of `satzB` without `hA` and `hN`. -/
theorem satzB_unbedingt (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg) :
    (finrank K (LinearMap.range (Lq (d := 3) alg)),
        finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
      (finrank K (LinearMap.range (Lq (d := 3) alg)),
        finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8) :=
  satzB (satzAHyp_holds K) (commonKernelHyp_holds K) alg h1 h2

/-- **Satz B, second part,** without hypotheses: statement of `satzB_symm` without `hN`. -/
theorem satzB_symm_unbedingt (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (h : (finrank K (LinearMap.range (Lq (d := 3) alg)),
        finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6)) : IsSymm alg :=
  satzB_symm (commonKernelHyp_holds K) alg h1 h2 h

end SatzBUnbedingt

/-- **Satz B over every field** without hypotheses: statement of `satzB_global` without `hA`
and `hN`. -/
theorem satzB_global_unbedingt (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      (((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (3, 6) ∧
          IsSymm alg') ∨
        (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8)) :=
  satzB_global K (satzAHyp_holds (AlgebraicClosure K))
    (commonKernelHyp_holds (AlgebraicClosure K)) alg

/-! ## Axiom check (printed in every build log, also in GitHub Actions)

Expected for each: `[propext, Classical.choice, Quot.sound]`. -/

#print axioms satzAHyp_holds
#print axioms commonKernelHyp_holds
#print axioms satzB_unbedingt
#print axioms satzB_symm_unbedingt
#print axioms satzB_global_unbedingt

end SatzB444
end YangBounds
