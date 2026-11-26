import YangBounds.Basic
import MatrixMultiplicationLowerBound25

/-!
# Bridge to the external dependency `mm325_proof`

Task S4-26 (condition 7): moved here unchanged from the end of `YangBounds/Basic.lean`.

For `n = 3`, `l = 2` the structure `BilinearAlgorithm` coincides field by field with
`MatrixMultiplicationLowerBound.MatrixAlgorithm` from the external dependency
`fallnlove/mm325_proof` (commit `759cf4a`), which is imported, not copied
(protocol section 11.3). `tensorRank_three_two_eq` connects the two rank notions.

This is the only file of the project that imports the dependency. No file of the chain of
the final theorem `YangBounds.Transponiert444.rank_four_two_four_ge_26` imports it, and the
library root `YangBounds.lean` does not import it either. It is still built as part of the
library (`lakefile.toml` glob `YangBounds.+`). Axiom report: `lean/AxiomsMM325.lean`.
-/

namespace YangBounds

universe u

variable {K : Type u} [Field K]

variable {m r : ℕ}

/-! ## Connection to the external dependency `mm325_proof` -/

/-- For `⟨3, 2, m⟩` our algorithms are the `MatrixAlgorithm`s of the dependency. -/
def BilinearAlgorithm.toMatrixAlgorithm (alg : BilinearAlgorithm K 3 2 m r) :
    MatrixMultiplicationLowerBound.MatrixAlgorithm K m r :=
  ⟨alg.alpha, alg.beta, alg.coeff, alg.correct⟩

/-- Converse direction of `BilinearAlgorithm.toMatrixAlgorithm`. -/
def BilinearAlgorithm.ofMatrixAlgorithm (alg : MatrixMultiplicationLowerBound.MatrixAlgorithm K m r) :
    BilinearAlgorithm K 3 2 m r :=
  ⟨alg.alpha, alg.beta, alg.coeff, alg.correct⟩

/-- Our rank of `⟨3, 2, m⟩` equals `matrixTensorRank` of the dependency. -/
theorem tensorRank_three_two_eq (K : Type u) [Field K] (m : ℕ) :
    tensorRank K 3 2 m = MatrixMultiplicationLowerBound.matrixTensorRank K m := by
  apply le_antisymm
  · obtain ⟨alg⟩ := MatrixMultiplicationLowerBound.matrixTensorRank_attained (K := K) (mcols := m)
    exact tensorRank_le (BilinearAlgorithm.ofMatrixAlgorithm alg)
  · obtain ⟨alg⟩ := tensorRank_attained (K := K) (n := 3) (l := 2) (m := m)
    exact MatrixMultiplicationLowerBound.matrixTensorRank_le alg.toMatrixAlgorithm

/-- Theorem 1 of Tsyganov, Parkina, Samsonov, Rakhuba (arXiv:2609.22054), `R > 24m/5`,
transported from the dependency to `tensorRank`. This is weaker than Yang's Theorem 1.
The proof is the one of the dependency (`matrix_algorithm_rank_strict`). -/
theorem tpsr_lower_bound (K : Type u) [Field K] (m : ℕ) (hm : 0 < m) :
    24 * m < 5 * tensorRank K 3 2 m := by
  obtain ⟨alg⟩ := tensorRank_attained (K := K) (n := 3) (l := 2) (m := m)
  exact MatrixMultiplicationLowerBound.matrix_algorithm_rank_strict hm
    alg.alpha alg.beta alg.coeff alg.correct

end YangBounds
