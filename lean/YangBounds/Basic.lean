import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Nat.Find
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Logic.Equiv.Fin.Basic
import MatrixMultiplicationLowerBound25

/-!
# Bilinear algorithms and the tensor rank of `⟨n, l, m⟩`

Task S1-01 (stage 1, round 1).

This file contains the definitions on which the formalisation of
J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*,
arXiv:2609.14393v3 (12.10.2026), builds.

Definition used by Yang (Section 1): an `R`-rank decomposition of `⟨k, l, m⟩` is a list of
linear maps `α_r : F^{k×l} → F`, `β_r : F^{l×m} → F` and matrices `C_r ∈ F^{k×m}`
(`0 ≤ r < R`) such that `A B = ∑_r α_r(A) β_r(B) C_r` for all `A`, `B`.
`R(⟨k, l, m⟩)` is the smallest `R` for which a decomposition exists.

`BilinearAlgorithm K n l m r` is exactly such a decomposition of length `r` over the field `K`,
and `tensorRank K n l m` is the smallest such `r`.

For `n = 3`, `l = 2` the structure coincides field by field with
`MatrixMultiplicationLowerBound.MatrixAlgorithm` from the external dependency
`fallnlove/mm325_proof` (commit `759cf4a`), which is imported, not copied
(protocol section 11.3). `tensorRank_three_two_eq` connects the two rank notions.
-/

namespace YangBounds

open scoped BigOperators

universe u

/-- A bilinear algorithm of length `r` for `⟨n, l, m⟩` matrix multiplication over `K`:
linear forms `alpha k` on `n × l` matrices, linear forms `beta k` on `l × m` matrices and
fixed `n × m` matrices `coeff k` with `A * B = ∑ k, (alpha k A * beta k B) • coeff k`
for all `A`, `B`. Here `A * B` is the ordinary mathlib matrix product. -/
structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
  alpha : Fin r → (Matrix (Fin n) (Fin l) K →ₗ[K] K)
  beta : Fin r → (Matrix (Fin l) (Fin m) K →ₗ[K] K)
  coeff : Fin r → Matrix (Fin n) (Fin m) K
  correct : ∀ (A : Matrix (Fin n) (Fin l) K) (B : Matrix (Fin l) (Fin m) K),
    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k

variable {K : Type u} [Field K]

/-- The linear form `M ↦ M i j`. -/
def entryForm {a b : ℕ} (i : Fin a) (j : Fin b) : Matrix (Fin a) (Fin b) K →ₗ[K] K where
  toFun M := M i j
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- The matrix unit with a `1` at position `(i, j)`. -/
def unitMatrix {a b : ℕ} (i : Fin a) (j : Fin b) : Matrix (Fin a) (Fin b) K :=
  Matrix.of fun i' j' => if i' = i ∧ j' = j then 1 else 0

/-- The schoolbook algorithm with one product `A i k * B k j` for every triple `(i, k, j)`,
indexed through an enumeration of `Fin n × Fin l × Fin m`. -/
noncomputable def standardAlgorithm (K : Type u) [Field K] (n l m : ℕ) :
    BilinearAlgorithm K n l m (Fintype.card (Fin n × Fin l × Fin m)) where
  alpha k := entryForm ((Fintype.equivFin _).symm k).1 ((Fintype.equivFin _).symm k).2.1
  beta k := entryForm ((Fintype.equivFin _).symm k).2.1 ((Fintype.equivFin _).symm k).2.2
  coeff k := unitMatrix ((Fintype.equivFin _).symm k).1 ((Fintype.equivFin _).symm k).2.2
  correct A B := by
    rw [Equiv.sum_comp (Fintype.equivFin (Fin n × Fin l × Fin m)).symm
      (fun t => (entryForm t.1 t.2.1 A * entryForm t.2.1 t.2.2 B) • unitMatrix t.1 t.2.2)]
    ext a b
    simp only [Matrix.mul_apply, Matrix.sum_apply, Matrix.smul_apply, entryForm,
      LinearMap.coe_mk, AddHom.coe_mk, unitMatrix, Matrix.of_apply, smul_eq_mul,
      mul_ite, mul_one, mul_zero, Fintype.sum_prod_type]
    rw [Finset.sum_eq_single a]
    · apply Finset.sum_congr rfl
      intro k _
      rw [Finset.sum_eq_single b]
      · simp
      · intro j _ hj
        simp [Ne.symm hj]
      · simp
    · intro i _ hi
      apply Finset.sum_eq_zero
      intro k _
      apply Finset.sum_eq_zero
      intro j _
      simp [Ne.symm hi]
    · simp

theorem exists_bilinearAlgorithm (K : Type u) [Field K] (n l m : ℕ) :
    ∃ r, Nonempty (BilinearAlgorithm K n l m r) :=
  ⟨_, ⟨standardAlgorithm K n l m⟩⟩

/-- `R_K(⟨n, l, m⟩)`: the smallest length of a bilinear algorithm for `⟨n, l, m⟩` over `K`.
The minimum exists because of the schoolbook algorithm. -/
noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ := by
  classical
  exact Nat.find (exists_bilinearAlgorithm K n l m)

variable {n l m r : ℕ}

theorem tensorRank_attained :
    Nonempty (BilinearAlgorithm K n l m (tensorRank K n l m)) := by
  classical
  exact Nat.find_spec (exists_bilinearAlgorithm K n l m)

theorem tensorRank_le (alg : BilinearAlgorithm K n l m r) : tensorRank K n l m ≤ r := by
  classical
  exact Nat.find_min' (exists_bilinearAlgorithm K n l m) ⟨alg⟩

/-- A lower bound on the rank is the same as a lower bound on the length of every algorithm. -/
theorem le_tensorRank_iff {c : ℕ} :
    c ≤ tensorRank K n l m ↔ ∀ r, BilinearAlgorithm K n l m r → c ≤ r := by
  constructor
  · intro h r alg
    exact h.trans (tensorRank_le alg)
  · intro h
    obtain ⟨alg⟩ := tensorRank_attained (K := K) (n := n) (l := l) (m := m)
    exact h _ alg

/-- Sanity check of the definition: the schoolbook bound `R ≤ n l m`. -/
theorem tensorRank_le_mul : tensorRank K n l m ≤ n * l * m := by
  have h := tensorRank_le (standardAlgorithm K n l m)
  simpa [Fintype.card_prod, Fintype.card_fin, Nat.mul_assoc] using h

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
