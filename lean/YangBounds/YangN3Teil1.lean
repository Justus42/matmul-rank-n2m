module

public import YangBounds.Basic
public import YangBounds.CeilBound
public import Mathlib.FieldTheory.RatFunc.Basic

@[expose] public section

/-!
# Yang v3, Theorem 1, part 1: reduction to infinite fields (step R1)

Task S1-09 (stage 1, round 3, role: formaliser).

Source: J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*,
arXiv:2609.14393v3 (12.10.2026), Section 2 ("otherwise we can replace 𝔽 with its algebraic
closure"). The result is Yang's, this file only formalises a step of his proof
(protocol section 9). Prose template: `lean/prosa/yang_n3.md`, section 3, step R1, and the
cut into three independent parts in section 9 of that file ("Teil 1: R1 (Körpererweiterung)
für sich").

Step R1 of the prose: if `L` is a field extension of `K`, every decomposition of length `r`
over `K` is a decomposition of length `r` over `L` (the coefficients are mapped by
`algebraMap K L`). Hence `R_L ≤ R_K`, and a lower bound over `L` is a lower bound over `K`.
As infinite extension we take the field of rational functions `RatFunc K` (prose: "der Körper
der rationalen Funktionen F(t)"), which lies in the same universe as `K`.

Main results:

* `BilinearAlgorithm.baseChange`: an algorithm over `K` gives an algorithm of the same length
  over every field `L` with `[Algebra K L]`.
* `tensorRank_baseChange_le`: `R_L(⟨n,l,m⟩) ≤ R_K(⟨n,l,m⟩)`.
* `le_tensorRank_of_infinite`: a lower bound for algorithms over all infinite fields (in the
  universe of `K`) is a lower bound for `R_K`.
* `yang_theorem_one_of_infinite`: the statement of `yang_theorem_one` (Statements.lean) for
  every field `K`, under the explicit hypothesis that `24 m + 2 ≤ 5 r` holds for every
  algorithm of length `r` over every infinite field. This hypothesis is what parts 2 and 3
  (`YangN3Teil2.lean`, `YangN3Teil3.lean`) together are meant to supply. It is a hypothesis
  of the theorem, not an axiom and not a `sorry`.
* `yang_theorem_one_algorithm_of_infinite`: the same for a single algorithm.

The hypothesis is stated for algorithms without any normalisation (no condition on the
`alpha k`), exactly as in the prose: R1 comes first, R2 and R3 (part 2) are applied over the
infinite field afterwards.
-/

namespace YangBounds

open scoped BigOperators

universe u v

section BaseChange

variable {K : Type u} [Field K] {L : Type v} [Field L] [Algebra K L]
variable {n l m r : ℕ}

/-- The extension of a `K`-linear form on `a × b` matrices to an `L`-linear form, by its
coefficients: `A ↦ ∑ i j, φ(f(e_{ij})) * A i j` with `φ = algebraMap K L`. -/
noncomputable def extendForm {a b : ℕ} (f : Matrix (Fin a) (Fin b) K →ₗ[K] K) :
    Matrix (Fin a) (Fin b) L →ₗ[L] L :=
  ∑ i : Fin a, ∑ j : Fin b, algebraMap K L (f (unitMatrix i j)) • entryForm i j

theorem extendForm_apply {a b : ℕ} (f : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (A : Matrix (Fin a) (Fin b) L) :
    extendForm (L := L) f A = ∑ i : Fin a, ∑ j : Fin b, algebraMap K L (f (unitMatrix i j)) * A i j := by
  simp [extendForm, LinearMap.coeFn_sum, Finset.sum_apply, entryForm, Algebra.smul_def]

/-- On matrices with entries from `K`, the extended form is the image of the original one. -/
theorem extendForm_map {a b : ℕ} (f : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (A : Matrix (Fin a) (Fin b) K) :
    extendForm (L := L) f (A.map (algebraMap K L)) = algebraMap K L (f A) := by
  rw [extendForm_apply]
  conv_rhs => rw [Matrix.matrix_eq_sum_single A]
  simp only [map_sum, Matrix.map_apply]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  have h : Matrix.single i j (A i j) = A i j • (unitMatrix i j : Matrix _ _ K) := by
    ext i' j'
    by_cases h1 : i' = i
    · subst h1
      by_cases h2 : j' = j
      · subst h2
        simp [Matrix.single, unitMatrix]
      · simp [Matrix.single, unitMatrix, h2, Ne.symm h2]
    · simp [Matrix.single, unitMatrix, h1, Ne.symm h1]
  rw [h, LinearMap.map_smul, smul_eq_mul, map_mul, mul_comm]

/-- The product of two matrix units, entry by entry. -/
theorem unitMatrix_mul_unitMatrix_apply {a b c : ℕ} (i : Fin a) (j j' : Fin b) (k : Fin c)
    (x : Fin a) (y : Fin c) :
    ((unitMatrix i j : Matrix (Fin a) (Fin b) K) * (unitMatrix j' k : Matrix (Fin b) (Fin c) K)) x y =
      if x = i ∧ j = j' ∧ y = k then 1 else 0 := by
  simp only [Matrix.mul_apply, unitMatrix, Matrix.of_apply, mul_ite, mul_one, mul_zero]
  by_cases hx : x = i <;> by_cases hj : j = j' <;> by_cases hy : y = k <;>
    simp [hx, hj, hy, @eq_comm _ j' j, Finset.sum_ite_eq', Finset.sum_ite_eq]

/-- The coefficient equations of a decomposition (prose, R1, "Für Lean"):
`∑_r a_{r,ij} b_{r,j'k} c_{r,xy} = [x = i][j = j'][y = k]`. -/
theorem BilinearAlgorithm.coeff_equation (alg : BilinearAlgorithm K n l m r) (i : Fin n)
    (j j' : Fin l) (k : Fin m) (x : Fin n) (y : Fin m) :
    ∑ t : Fin r, alg.alpha t (unitMatrix i j) * alg.beta t (unitMatrix j' k) * alg.coeff t x y =
      if x = i ∧ j = j' ∧ y = k then 1 else 0 := by
  have h := congrFun (congrFun (alg.correct (unitMatrix i j) (unitMatrix j' k)) x) y
  rw [unitMatrix_mul_unitMatrix_apply] at h
  rw [h, Matrix.sum_apply]
  simp [Matrix.smul_apply, smul_eq_mul]

/-- **Step R1.** An algorithm of length `r` over `K` is an algorithm of length `r` over every
extension field `L`: the linear forms are extended by their coefficients and the matrices
`coeff t` are mapped entrywise by `algebraMap K L`. -/
noncomputable def BilinearAlgorithm.baseChange (alg : BilinearAlgorithm K n l m r)
    (L : Type v) [Field L] [Algebra K L] : BilinearAlgorithm L n l m r where
  alpha t := extendForm (alg.alpha t)
  beta t := extendForm (alg.beta t)
  coeff t := (alg.coeff t).map (algebraMap K L)
  correct A B := by
    ext x y
    simp only [Matrix.sum_apply, Matrix.smul_apply, Matrix.map_apply, smul_eq_mul,
      extendForm_apply]
    -- left side: sum over the middle index
    have lhs : (A * B) x y = ∑ i : Fin n, ∑ j : Fin l, ∑ j' : Fin l, ∑ k : Fin m,
        A i j * B j' k * algebraMap K L (if x = i ∧ j = j' ∧ y = k then (1 : K) else 0) := by
      rw [Matrix.mul_apply, Finset.sum_eq_single x]
      · refine Finset.sum_congr rfl fun j _ => ?_
        rw [Finset.sum_eq_single j]
        · rw [Finset.sum_eq_single y]
          · simp
          · intro k _ hk
            simp [Ne.symm hk]
          · simp
        · intro j' _ hj'
          apply Finset.sum_eq_zero
          intro k _
          simp [Ne.symm hj']
        · simp
      · intro i _ hi
        apply Finset.sum_eq_zero
        intro j _
        apply Finset.sum_eq_zero
        intro j' _
        apply Finset.sum_eq_zero
        intro k _
        simp [Ne.symm hi]
      · simp
    rw [lhs]
    simp_rw [← alg.coeff_equation, map_sum, map_mul, Finset.mul_sum, Finset.sum_mul]
    -- reorder the sums on the right: `t, j', k, i, j` to `i, j, j', k, t`
    conv_rhs =>
      rw [Finset.sum_comm]
      enter [2, j']
      rw [Finset.sum_comm]
      enter [2, k]
      rw [Finset.sum_comm]
      enter [2, i]
      rw [Finset.sum_comm]
    conv_rhs =>
      enter [2, j']
      rw [Finset.sum_comm]
      enter [2, i]
      rw [Finset.sum_comm]
    conv_rhs =>
      rw [Finset.sum_comm]
      enter [2, i]
      rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ =>
      Finset.sum_congr rfl fun j' _ => Finset.sum_congr rfl fun k _ =>
        Finset.sum_congr rfl fun t _ => ?_
    ring

@[simp]
theorem BilinearAlgorithm.baseChange_coeff (alg : BilinearAlgorithm K n l m r) (t : Fin r) :
    (alg.baseChange L).coeff t = (alg.coeff t).map (algebraMap K L) := rfl

/-- The extended linear forms agree with the original ones on matrices over `K`. -/
theorem BilinearAlgorithm.baseChange_alpha_map (alg : BilinearAlgorithm K n l m r) (t : Fin r)
    (A : Matrix (Fin n) (Fin l) K) :
    (alg.baseChange L).alpha t (A.map (algebraMap K L)) = algebraMap K L (alg.alpha t A) :=
  extendForm_map _ _

theorem BilinearAlgorithm.baseChange_beta_map (alg : BilinearAlgorithm K n l m r) (t : Fin r)
    (B : Matrix (Fin l) (Fin m) K) :
    (alg.baseChange L).beta t (B.map (algebraMap K L)) = algebraMap K L (alg.beta t B) :=
  extendForm_map _ _

/-- A linear form is zero after base change iff it was zero before (prose, R2:
the order R1 before R2 does not matter). -/
theorem extendForm_eq_zero_iff {a b : ℕ} (f : Matrix (Fin a) (Fin b) K →ₗ[K] K) :
    extendForm (L := L) f = 0 ↔ f = 0 := by
  constructor
  · intro h
    ext A
    have h' := extendForm_map (L := L) f A
    rw [h, LinearMap.zero_apply, eq_comm, map_eq_zero_iff _ (algebraMap K L).injective] at h'
    simpa using h'
  · rintro rfl
    simp [extendForm]

/-- **R1, rank form.** `R_L(⟨n,l,m⟩) ≤ R_K(⟨n,l,m⟩)` for every extension field `L` of `K`. -/
theorem tensorRank_baseChange_le (K : Type u) [Field K] (L : Type v) [Field L] [Algebra K L]
    (n l m : ℕ) : tensorRank L n l m ≤ tensorRank K n l m := by
  obtain ⟨alg⟩ := tensorRank_attained (K := K) (n := n) (l := l) (m := m)
  exact tensorRank_le (alg.baseChange L)

end BaseChange

/-! ## An infinite extension in the same universe -/

section Infinite

/-- The field of rational functions over `K` is infinite. -/
theorem infinite_ratFunc (K : Type u) [Field K] : Infinite (RatFunc K) :=
  Infinite.of_injective _ (RatFunc.algebraMap_injective K)

/-- Every field has an infinite extension field in the same universe. -/
theorem exists_infinite_extension (K : Type u) [Field K] :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L), Infinite L :=
  ⟨RatFunc K, inferInstance, inferInstance, infinite_ratFunc K⟩

variable {n l m : ℕ}

/-- **R1, transfer of lower bounds.** If every algorithm for `⟨n,l,m⟩` over every infinite
field (in the universe of `K`) has length at least `c`, then `c ≤ R_K(⟨n,l,m⟩)`. -/
theorem le_tensorRank_of_infinite {c : ℕ}
    (h : ∀ (L : Type u) [Field L] [Infinite L] (r : ℕ), BilinearAlgorithm L n l m r → c ≤ r)
    (K : Type u) [Field K] : c ≤ tensorRank K n l m := by
  obtain ⟨L, _, _, _⟩ := exists_infinite_extension K
  rw [le_tensorRank_iff]
  intro r alg
  exact h L r (alg.baseChange L)

/-- The same for an arbitrary predicate on the length, single algorithm form. -/
theorem algorithm_bound_of_infinite {P : ℕ → Prop}
    (h : ∀ (L : Type u) [Field L] [Infinite L] (r : ℕ), BilinearAlgorithm L n l m r → P r)
    (K : Type u) [Field K] {r : ℕ} (alg : BilinearAlgorithm K n l m r) : P r := by
  obtain ⟨L, _, _, _⟩ := exists_infinite_extension K
  exact h L r (alg.baseChange L)

end Infinite

/-! ## Yang's Theorem 1 from the case of infinite fields -/

section Yang

/-- **Yang v3, Theorem 1, from infinite fields (step R1).** Fix `m`. If every algorithm of
length `r` for `⟨3,2,m⟩` over every infinite field (in universe `u`) satisfies
`24 m + 2 ≤ 5 r`, then the same holds for every algorithm over every field `K : Type u`. -/
theorem yang_theorem_one_algorithm_of_infinite (m : ℕ)
    (hinf : ∀ (L : Type u) [Field L] [Infinite L] (r : ℕ),
      BilinearAlgorithm L 3 2 m r → 24 * m + 2 ≤ 5 * r)
    (K : Type u) [Field K] {r : ℕ} (alg : BilinearAlgorithm K 3 2 m r) :
    24 * m + 2 ≤ 5 * r :=
  algorithm_bound_of_infinite (P := fun r => 24 * m + 2 ≤ 5 * r) hinf K alg

/-- **Yang v3, Theorem 1, from infinite fields (step R1), rank form.** Under the hypothesis
`hinf` of `yang_theorem_one_algorithm_of_infinite`, the conclusion of `yang_theorem_one`
(Statements.lean) holds: `⌈(24m+2)/5⌉ ≤ R_K(⟨3,2,m⟩)` for every field `K : Type u`. The
hypothesis `3 ≤ m` of `yang_theorem_one` is not needed for this step. -/
theorem yang_theorem_one_of_infinite (m : ℕ)
    (hinf : ∀ (L : Type u) [Field L] [Infinite L] (r : ℕ),
      BilinearAlgorithm L 3 2 m r → 24 * m + 2 ≤ 5 * r)
    (K : Type u) [Field K] :
    ⌈((24 * m + 2 : ℚ) / 5)⌉₊ ≤ tensorRank K 3 2 m := by
  rw [le_tensorRank_iff]
  intro r alg
  exact (ceil_bound_iff m r).mpr (yang_theorem_one_algorithm_of_infinite m hinf K alg)

end Yang

end YangBounds
