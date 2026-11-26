module

public import MatMulRank.Definitions
public import YangBounds.Transponiert444
public import YangBounds.Gleich444

@[expose] public section

/-!
# Solution: proof of the Challenge `MatMulRank.rank_four_two_four_eq_26`

The definitions `MatMulRank.BilinearAlgorithm` and `MatMulRank.tensorRank` come from
`MatMulRank/Definitions.lean`, which repeats the definitions of the Challenge with the same
imports. This file proves the Challenge theorem from the project's theorem
`YangBounds.Gleich444.rank_four_two_four_eq_26`, which combines the lower bound
`YangBounds.Transponiert444.rank_four_two_four_ge_26` with the upper bound
`YangBounds.Upper4x2x4.rank_four_two_four_le_26` (explicit algorithm with 26 products).
The former Challenge statement `rank_four_two_four_ge_26` (lower bound only) is kept below
with unchanged wording.

The bridge: the structures `MatMulRank.BilinearAlgorithm` and `YangBounds.BilinearAlgorithm`
have the same fields with the same types, so algorithms convert in both directions without
change of length. The project defines `YangBounds.tensorRank` with `Nat.find`, the Challenge
defines `MatMulRank.tensorRank` with `sInf`; both are the least length of an algorithm, and
`tensorRank_eq_yangBounds` proves that they are equal for all `K, n, l, m`.
-/

namespace MatMulRank

universe u

section Conversion

variable {K : Type u} [Field K] {n l m r : ℕ}

/-- An algorithm in the sense of the Challenge, read as one in the sense of the project. -/
def BilinearAlgorithm.toYangBounds (alg : BilinearAlgorithm K n l m r) :
    YangBounds.BilinearAlgorithm K n l m r where
  alpha := alg.alpha
  beta := alg.beta
  coeff := alg.coeff
  correct := fun A B => alg.correct A B

/-- An algorithm in the sense of the project, read as one in the sense of the Challenge. -/
def BilinearAlgorithm.ofYangBounds (alg : YangBounds.BilinearAlgorithm K n l m r) :
    BilinearAlgorithm K n l m r where
  alpha := alg.alpha
  beta := alg.beta
  coeff := alg.coeff
  correct := fun A B => alg.correct A B

end Conversion

/-- The set in the definition of `tensorRank` is not empty. -/
theorem tensorRank_set_nonempty (K : Type u) [Field K] (n l m : ℕ) :
    {r : ℕ | Nonempty (BilinearAlgorithm K n l m r)}.Nonempty := by
  obtain ⟨alg⟩ := YangBounds.tensorRank_attained (K := K) (n := n) (l := l) (m := m)
  refine ⟨YangBounds.tensorRank K n l m, ?_⟩
  rw [Set.mem_ofPred_eq]
  exact ⟨BilinearAlgorithm.ofYangBounds alg⟩

/-- The tensor rank of the Challenge equals the tensor rank of the project. -/
theorem tensorRank_eq_yangBounds (K : Type u) [Field K] (n l m : ℕ) :
    tensorRank K n l m = YangBounds.tensorRank K n l m := by
  unfold tensorRank
  apply le_antisymm
  · -- `sInf ≤ R`: the project's minimal algorithm is an algorithm of the Challenge.
    obtain ⟨alg⟩ := YangBounds.tensorRank_attained (K := K) (n := n) (l := l) (m := m)
    apply Nat.sInf_le
    rw [Set.mem_ofPred_eq]
    exact ⟨BilinearAlgorithm.ofYangBounds alg⟩
  · -- `R ≤ sInf`: the infimum is attained, and that algorithm is one of the project.
    have hmem := Nat.sInf_mem (tensorRank_set_nonempty K n l m)
    rw [Set.mem_ofPred_eq] at hmem
    obtain ⟨alg⟩ := hmem
    exact YangBounds.tensorRank_le (BilinearAlgorithm.toYangBounds alg)

/-- **Lower bound for `⟨4, 2, 4⟩`** (statement of the Challenge up to S5-17). Proof: the
project's theorem
`YangBounds.Transponiert444.rank_four_two_four_ge_26`, transported along
`tensorRank_eq_yangBounds`. -/
theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 := by
  rw [tensorRank_eq_yangBounds]
  exact YangBounds.Transponiert444.rank_four_two_four_ge_26 K

/-- **The tensor rank of `⟨4, 2, 4⟩`** (statement of the Challenge). Proof: the project's
theorem `YangBounds.Gleich444.rank_four_two_four_eq_26`, transported along
`tensorRank_eq_yangBounds`. -/
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26 := by
  rw [tensorRank_eq_yangBounds]
  exact YangBounds.Gleich444.rank_four_two_four_eq_26 K

end MatMulRank
