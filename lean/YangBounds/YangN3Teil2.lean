module

public import YangBounds.Basic
public import Mathlib.Algebra.MvPolynomial.Funext
public import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
public import Mathlib.LinearAlgebra.Matrix.ToLin
public import Mathlib.LinearAlgebra.Matrix.Nondegenerate
public import Mathlib.LinearAlgebra.Determinant
public import Mathlib.LinearAlgebra.Basis.VectorSpace

@[expose] public section

/-!
# Yang v3, Theorem 1 (`n = 3`), part 2: strong normalization

Task S1-10 (stage 1, round 3, role: formaliser).

Source of the proof: `lean/prosa/yang_n3.md` (task S1-02), which works out the proof of
J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*,
arXiv:2609.14393v3, Lemma 6 (case `k = 3`, `l = 2`). The result is Yang's, not ours.

Section 9 of the prose file cuts the formalisation into three independent parts. This file is
**part 2: Lemma A (strong normalization) together with the reductions R2 and R3**:

* R2 (`removeZeroAlpha`): terms with `α_r = 0` can be dropped; the length does not grow.
* R3 (`changeBasis`): for invertible `S`, `T` the triple
  `(α_r(S A T), β_r(T⁻¹ B), S⁻¹ C_r)` is again a decomposition of the same length.
* Lemma A (`lemmaA`): over an infinite field, if no `α_r` is the zero form, a change of
  basis R3 makes the decomposition strongly normalized (SN1 and SN2 of the prose, section 5).
* `exists_stronglyNormalized`: R2 and Lemma A combined. Over an infinite field every
  decomposition of length `r` gives a strongly normalized one of length `r' ≤ r`.

Part 2 needs nothing from parts 1 and 3, so no hypotheses from them appear here.

The definition `StronglyNormalized` states SN1 and SN2 literally in terms of the fields
`alpha`, `beta` of `BilinearAlgorithm` (no auxiliary notions), so that part 3 can be
connected to it by unfolding:

* (SN1) `α_r(e_{0,0}) ≠ 0` for all `r`, i.e. `D(e_{0,0})` is invertible;
* (SN2) for every `v ≠ 0` the three vectors `f_i(v) = (α_r(e_{i,0}) · β_r(v))_r`,
  `i = 0, 1, 2`, are linearly independent.

Here `e_{i,j}` is `unitMatrix i j` from `YangBounds.Basic`.

## Deviation from the prose proof (steps 3 and 4 of Lemma A)

The prose takes, for every support `Σ`, a non-vanishing `3 × 3` minor of `M_Σ(p)`. Here we
instead fix a left inverse `G_Σ` of the injective map `a ↦ D(a p_Σ) ℬ(v_Σ)` and use the
polynomial `p ↦ det(G_Σ ∘ (a ↦ D(a p) ℬ(v_Σ)))`, which is `1` at `p_Σ`. If it does not vanish
at `p`, the map `a ↦ D(a p) ℬ(v)` is injective for every `v` with support `Σ`. This avoids
choosing rows and has the same role in the proof. Further, the basis change is chosen
generically as well: the polynomial in the entries of `(S, T)` contains the factors `det S`
and `det T`, so no explicit basis completion (prose step 5) is needed; `u = S e_0` and
`p = (row 0 of T)` play the roles of the prose.
-/

namespace YangBounds
namespace YangN3Teil2

open Matrix

universe u

variable {K : Type u} [Field K]

/-! ## Polynomial functions -/

section PolyFun

variable {σ : Type*}

/-- `f` is a polynomial function: the evaluation of a multivariate polynomial. -/
def IsPolyFun (f : (σ → K) → K) : Prop :=
  ∃ P : MvPolynomial σ K, ∀ x, MvPolynomial.eval x P = f x

/-- A polynomial function that does not vanish everywhere. -/
def IsNonzeroPolyFun (f : (σ → K) → K) : Prop :=
  IsPolyFun f ∧ ∃ x, f x ≠ 0

theorem IsPolyFun.const (c : K) : IsPolyFun (σ := σ) (fun _ => c) :=
  ⟨MvPolynomial.C c, fun x => by simp⟩

theorem IsPolyFun.coord (s : σ) : IsPolyFun (fun x : σ → K => x s) :=
  ⟨MvPolynomial.X s, fun x => by simp⟩

theorem IsPolyFun.add {f g : (σ → K) → K} (hf : IsPolyFun f) (hg : IsPolyFun g) :
    IsPolyFun (fun x => f x + g x) := by
  obtain ⟨P, hP⟩ := hf
  obtain ⟨Q, hQ⟩ := hg
  exact ⟨P + Q, fun x => by simp [hP, hQ]⟩

theorem IsPolyFun.mul {f g : (σ → K) → K} (hf : IsPolyFun f) (hg : IsPolyFun g) :
    IsPolyFun (fun x => f x * g x) := by
  obtain ⟨P, hP⟩ := hf
  obtain ⟨Q, hQ⟩ := hg
  exact ⟨P * Q, fun x => by simp [hP, hQ]⟩

theorem IsPolyFun.sum {ι : Type*} (s : Finset ι) {f : ι → (σ → K) → K}
    (h : ∀ i ∈ s, IsPolyFun (f i)) : IsPolyFun (fun x => ∑ i ∈ s, f i x) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using IsPolyFun.const (σ := σ) (0 : K)
  | @insert a s ha ih =>
    simp only [Finset.sum_insert ha]
    exact (h _ (Finset.mem_insert_self _ _)).add
      (ih fun i hi => h i (Finset.mem_insert_of_mem hi))

/-- Every linear function of finitely many variables is a polynomial function. -/
theorem IsPolyFun.of_linear [Fintype σ] [DecidableEq σ] (f : (σ → K) → K)
    (hadd : ∀ x y, f (x + y) = f x + f y) (hsmul : ∀ (c : K) x, f (c • x) = c * f x) :
    IsPolyFun f := by
  let F : (σ → K) →ₗ[K] K :=
    { toFun := f
      map_add' := hadd
      map_smul' := hsmul }
  refine ⟨∑ s, MvPolynomial.C (f fun j => if s = j then 1 else 0) * MvPolynomial.X s,
    fun x => ?_⟩
  have hF : f x = F x := rfl
  rw [hF, F.pi_apply_eq_sum_univ x]
  simp [F, mul_comm]

/-- The determinant of a matrix of polynomial functions is a polynomial function. -/
theorem IsPolyFun.det {n : Type*} [Fintype n] [DecidableEq n] (M : n → n → (σ → K) → K)
    (h : ∀ i j, IsPolyFun (M i j)) :
    IsPolyFun (fun x => (Matrix.of fun i j => M i j x).det) := by
  choose P hP using h
  refine ⟨(Matrix.of P).det, fun x => ?_⟩
  rw [RingHom.map_det]
  congr 1
  ext i j
  simp [hP]

/-- Over an infinite field, the product of two polynomial functions that do not vanish
everywhere does not vanish everywhere (`MvPolynomial.funext`). -/
theorem IsNonzeroPolyFun.mul [Infinite K] {f g : (σ → K) → K} (hf : IsNonzeroPolyFun f)
    (hg : IsNonzeroPolyFun g) : IsNonzeroPolyFun (fun x => f x * g x) := by
  obtain ⟨⟨P, hP⟩, x, hx⟩ := hf
  obtain ⟨⟨Q, hQ⟩, y, hy⟩ := hg
  have hP0 : P ≠ 0 := by
    rintro rfl
    apply hx
    rw [← hP]
    simp
  have hQ0 : Q ≠ 0 := by
    rintro rfl
    apply hy
    rw [← hQ]
    simp
  refine ⟨IsPolyFun.mul ⟨P, hP⟩ ⟨Q, hQ⟩, ?_⟩
  by_contra hcon
  push_neg at hcon
  apply mul_ne_zero hP0 hQ0
  apply MvPolynomial.funext
  intro z
  simp [hP, hQ, hcon z]

theorem IsNonzeroPolyFun.prod [Infinite K] {ι : Type*} (s : Finset ι) {f : ι → (σ → K) → K}
    (h : ∀ i ∈ s, IsNonzeroPolyFun (f i)) : IsNonzeroPolyFun (fun x => ∏ i ∈ s, f i x) := by
  classical
  induction s using Finset.induction_on with
  | empty =>
    simp only [Finset.prod_empty]
    exact ⟨IsPolyFun.const 1, fun _ => 0, one_ne_zero⟩
  | @insert a s ha ih =>
    simp only [Finset.prod_insert ha]
    exact (h _ (Finset.mem_insert_self _ _)).mul
      (ih fun i hi => h i (Finset.mem_insert_of_mem hi))

end PolyFun

/-! ## Outer products and matrix units -/

/-- The outer product `a p` of a column `a` and a row `p` (a matrix of rank `≤ 1`). -/
def outer {a b : ℕ} (u : Fin a → K) (p : Fin b → K) : Matrix (Fin a) (Fin b) K :=
  Matrix.of fun i j => u i * p j

/-- The standard basis vector `e_i` (in the form used by `LinearMap.pi_apply_eq_sum_univ`). -/
def basisVec {a : ℕ} (i : Fin a) : Fin a → K := fun j => if i = j then 1 else 0

@[simp] theorem outer_apply {a b : ℕ} (u : Fin a → K) (p : Fin b → K) (i : Fin a) (j : Fin b) :
    outer u p i j = u i * p j := rfl

theorem outer_add_left {a b : ℕ} (u v : Fin a → K) (p : Fin b → K) :
    outer (u + v) p = outer u p + outer v p := by
  ext i j; simp [add_mul]

theorem outer_smul_left {a b : ℕ} (c : K) (u : Fin a → K) (p : Fin b → K) :
    outer (c • u) p = c • outer u p := by
  ext i j; simp [mul_assoc]

theorem outer_add_right {a b : ℕ} (u : Fin a → K) (p q : Fin b → K) :
    outer u (p + q) = outer u p + outer u q := by
  ext i j; simp [mul_add]

theorem outer_smul_right {a b : ℕ} (c : K) (u : Fin a → K) (p : Fin b → K) :
    outer u (c • p) = c • outer u p := by
  ext i j; simp; ring

theorem outer_mul {a b m : ℕ} (u : Fin a → K) (p : Fin b → K) (w : Matrix (Fin b) (Fin m) K) :
    outer u p * w = outer u (p ᵥ* w) := by
  ext i l
  simp [Matrix.mul_apply, Matrix.vecMul, dotProduct, Finset.mul_sum, mul_assoc]

theorem sum_smul_outer {a b c : ℕ} (S : Matrix (Fin a) (Fin c) K) (g : Fin c → K)
    (p : Fin b → K) :
    ∑ i, g i • outer (fun x => S x i) p = outer (S *ᵥ g) p := by
  ext x y
  simp [Matrix.sum_apply, Matrix.mulVec, dotProduct, Finset.sum_mul]
  exact Finset.sum_congr rfl fun i _ => by ring

theorem outer_basisVec {a b : ℕ} (i : Fin a) (j : Fin b) :
    outer (basisVec i) (basisVec j) = (unitMatrix i j : Matrix (Fin a) (Fin b) K) := by
  ext x y
  simp only [outer_apply, basisVec, unitMatrix, Matrix.of_apply]
  by_cases hx : i = x <;> by_cases hy : j = y <;> simp [hx, hy, eq_comm]

theorem mul_unitMatrix_mul {a b : ℕ} (S : Matrix (Fin a) (Fin a) K)
    (T : Matrix (Fin b) (Fin b) K) (i : Fin a) (j : Fin b) :
    S * unitMatrix i j * T = outer (fun x => S x i) (fun y => T j y) := by
  ext x y
  simp [Matrix.mul_apply, unitMatrix, ite_and, Finset.sum_ite_eq', Finset.sum_mul]

/-- A linear form on matrices that vanishes on all matrix units is zero. -/
theorem linearForm_eq_zero_of_unitMatrix {a b : ℕ} (φ : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (h : ∀ i j, φ (unitMatrix i j) = 0) : φ = 0 := by
  ext M
  have hM : M = ∑ i, ∑ j, M i j • (unitMatrix i j : Matrix (Fin a) (Fin b) K) := by
    ext x y
    simp [Matrix.sum_apply, unitMatrix, ite_and]
  rw [hM]
  simp [map_sum, h]

/-- `α(u p) = ∑ₐ u_a α(e_a p)`. -/
theorem linearForm_outer_eq_sum {b : ℕ} (φ : Matrix (Fin 3) (Fin b) K →ₗ[K] K)
    (u : Fin 3 → K) (p : Fin b → K) :
    φ (outer u p) = ∑ x, u x * φ (outer (basisVec x) p) := by
  let F : (Fin 3 → K) →ₗ[K] K :=
    { toFun := fun u => φ (outer u p)
      map_add' := fun u v => by simp [outer_add_left]
      map_smul' := fun c u => by simp [outer_smul_left] }
  have hF : φ (outer u p) = F u := rfl
  rw [hF, F.pi_apply_eq_sum_univ u]
  rfl

/-! ## Reduction R3: change of basis -/

/-- **R3.** For invertible `S`, `T`, the decomposition `(α_r(S A T), β_r(T⁻¹ B), S⁻¹ C_r)`. -/
noncomputable def changeBasis {n l m r : ℕ} (alg : BilinearAlgorithm K n l m r)
    (S : Matrix (Fin n) (Fin n) K) (T : Matrix (Fin l) (Fin l) K)
    (hS : IsUnit S.det) (hT : IsUnit T.det) : BilinearAlgorithm K n l m r where
  alpha k :=
    { toFun := fun A => alg.alpha k (S * A * T)
      map_add' := fun A A' => by simp [Matrix.mul_add, Matrix.add_mul]
      map_smul' := fun c A => by simp [Matrix.mul_smul, Matrix.smul_mul] }
  beta k :=
    { toFun := fun B => alg.beta k (T⁻¹ * B)
      map_add' := fun B B' => by simp [Matrix.mul_add]
      map_smul' := fun c B => by simp [Matrix.mul_smul] }
  coeff k := S⁻¹ * alg.coeff k
  correct A B := by
    have h := alg.correct (S * A * T) (T⁻¹ * B)
    have e : S * A * T * (T⁻¹ * B) = S * (A * B) := by
      rw [Matrix.mul_assoc (S * A) T, ← Matrix.mul_assoc T, Matrix.mul_nonsing_inv T hT,
        Matrix.one_mul, Matrix.mul_assoc]
    rw [e] at h
    calc A * B = S⁻¹ * (S * (A * B)) := by
          rw [← Matrix.mul_assoc, Matrix.nonsing_inv_mul S hS, Matrix.one_mul]
      _ = _ := by
          rw [h, Matrix.mul_sum]
          simp [Matrix.mul_smul]

@[simp] theorem changeBasis_alpha_apply {n l m r : ℕ} (alg : BilinearAlgorithm K n l m r)
    (S : Matrix (Fin n) (Fin n) K) (T : Matrix (Fin l) (Fin l) K)
    (hS : IsUnit S.det) (hT : IsUnit T.det) (k : Fin r) (A : Matrix (Fin n) (Fin l) K) :
    (changeBasis alg S T hS hT).alpha k A = alg.alpha k (S * A * T) := rfl

@[simp] theorem changeBasis_beta_apply {n l m r : ℕ} (alg : BilinearAlgorithm K n l m r)
    (S : Matrix (Fin n) (Fin n) K) (T : Matrix (Fin l) (Fin l) K)
    (hS : IsUnit S.det) (hT : IsUnit T.det) (k : Fin r) (B : Matrix (Fin l) (Fin m) K) :
    (changeBasis alg S T hS hT).beta k B = alg.beta k (T⁻¹ * B) := rfl

/-! ## Reduction R2: dropping zero forms -/

open Classical in
/-- **R2.** Drop every term with `α_r = 0`. -/
noncomputable def removeZeroAlpha {n l m r : ℕ} (alg : BilinearAlgorithm K n l m r) :
    BilinearAlgorithm K n l m (Finset.univ.filter fun k => alg.alpha k ≠ 0).card :=
  let s := Finset.univ.filter fun k => alg.alpha k ≠ 0
  { alpha := fun i => alg.alpha (s.equivFin.symm i)
    beta := fun i => alg.beta (s.equivFin.symm i)
    coeff := fun i => alg.coeff (s.equivFin.symm i)
    correct := fun A B => by
      rw [alg.correct A B]
      have h1 : ∑ i : Fin s.card, (alg.alpha (s.equivFin.symm i) A *
            alg.beta (s.equivFin.symm i) B) • alg.coeff (s.equivFin.symm i) =
          ∑ k ∈ s, (alg.alpha k A * alg.beta k B) • alg.coeff k := by
        rw [Equiv.sum_comp s.equivFin.symm
          (fun x : s => (alg.alpha x A * alg.beta x B) • alg.coeff x)]
        exact Finset.sum_coe_sort s (fun k => (alg.alpha k A * alg.beta k B) • alg.coeff k)
      rw [h1, Finset.sum_filter_of_ne]
      intro k _ hk h0
      apply hk
      simp [h0] }

open Classical in
theorem removeZeroAlpha_alpha_ne_zero {n l m r : ℕ} (alg : BilinearAlgorithm K n l m r)
    (i : Fin _) : (removeZeroAlpha alg).alpha i ≠ 0 := by
  classical
  exact (Finset.mem_filter.mp ((Finset.filter (fun k => alg.alpha k ≠ 0)
    Finset.univ).equivFin.symm i).2).2

open Classical in
theorem removeZeroAlpha_length_le {n l m r : ℕ} (alg : BilinearAlgorithm K n l m r) :
    (Finset.univ.filter fun k => alg.alpha k ≠ 0).card ≤ r :=
  (Finset.card_filter_le _ _).trans (by simp)

/-! ## Strong normalization -/

/-- **Strongly normalized** (prose section 5):
(SN1) `α_r(e_{0,0}) ≠ 0` for all `r`, i.e. `D(e_{0,0})` is invertible;
(SN2) for `v ≠ 0` the vectors `f_i(v) = D(e_{i,0}) ℬ(v)`, `i = 0, 1, 2`, are linearly
independent. -/
def StronglyNormalized {m r : ℕ} (alg : BilinearAlgorithm K 3 2 m r) : Prop :=
  (∀ k, alg.alpha k (unitMatrix 0 0) ≠ 0) ∧
  ∀ v : Matrix (Fin 2) (Fin m) K, v ≠ 0 →
    LinearIndependent K (fun i : Fin 3 => fun k => alg.alpha k (unitMatrix i 0) * alg.beta k v)

section LemmaA

variable {m r : ℕ} (alg : BilinearAlgorithm K 3 2 m r)

/-- The support `supp(v) = {r : ℬ(v)_r ≠ 0}`. -/
noncomputable def supp (w : Matrix (Fin 2) (Fin m) K) : Finset (Fin r) := by
  classical
  exact Finset.univ.filter fun k => alg.beta k w ≠ 0

/-- The map `a ↦ D(a p) ℬ(w)` from `F³` to `F^R` (prose, Lemma A, step 2). -/
def lmap (p : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K) : (Fin 3 → K) →ₗ[K] (Fin r → K) where
  toFun a k := alg.alpha k (outer a p) * alg.beta k w
  map_add' a b := by ext k; simp [outer_add_left, add_mul]
  map_smul' c a := by ext k; simp [outer_smul_left, mul_assoc]

@[simp] theorem lmap_apply (p : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K) (a : Fin 3 → K)
    (k : Fin r) : lmap alg p w a k = alg.alpha k (outer a p) * alg.beta k w := rfl

theorem lmap_add_left (p q : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K) :
    lmap alg (p + q) w = lmap alg p w + lmap alg q w := by
  ext a k; simp [outer_add_right, add_mul]

theorem lmap_smul_left (c : K) (p : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K) :
    lmap alg (c • p) w = c • lmap alg p w := by
  ext a k; simp [outer_smul_right, mul_assoc]

/-- **Lemma A, step 2b.** If `p w ≠ 0`, then `a ↦ D(a p) ℬ(w)` is injective. -/
theorem lmap_injective {p : Fin 2 → K} {w : Matrix (Fin 2) (Fin m) K} (hpw : p ᵥ* w ≠ 0) :
    Function.Injective (lmap alg p w) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro a ha
  have h1 : outer a p * w = 0 := by
    rw [alg.correct]
    apply Finset.sum_eq_zero
    intro k _
    have hk : alg.alpha k (outer a p) * alg.beta k w = 0 := congrFun ha k
    simp [hk]
  rw [outer_mul] at h1
  obtain ⟨l, hl⟩ : ∃ l, (p ᵥ* w) l ≠ 0 := by
    by_contra h
    push_neg at h
    exact hpw (funext h)
  funext i
  have hi : a i * (p ᵥ* w) l = 0 := by
    simpa only [outer_apply, Matrix.zero_apply] using congrFun (congrFun h1 i) l
  exact (mul_eq_zero.mp hi).resolve_right hl

/-- **Lemma A, step 2a (support form).** Injectivity of `a ↦ D(a p) ℬ(w)` depends on `w`
only through its support. -/
theorem lmap_injective_of_supp {p : Fin 2 → K} {w w' : Matrix (Fin 2) (Fin m) K}
    (h : supp alg w = supp alg w') (hinj : Function.Injective (lmap alg p w)) :
    Function.Injective (lmap alg p w') := by
  classical
  have h' : ∀ k, alg.beta k w = 0 ↔ alg.beta k w' = 0 := by
    intro k
    have hk := Finset.ext_iff.mp h k
    simp only [supp, Finset.mem_filter, Finset.mem_univ, true_and] at hk
    exact not_iff_not.mp hk
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot'] at hinj ⊢
  intro a ha
  apply hinj a
  funext k
  have hk : alg.alpha k (outer a p) * alg.beta k w' = 0 := congrFun ha k
  simp only [lmap_apply, Pi.zero_apply, mul_eq_zero] at hk ⊢
  rcases hk with hk | hk
  · exact Or.inl hk
  · exact Or.inr ((h' k).mpr hk)

theorem exists_vecMul_ne_zero {w : Matrix (Fin 2) (Fin m) K} (hw : w ≠ 0) :
    ∃ p : Fin 2 → K, p ᵥ* w ≠ 0 := by
  obtain ⟨j, l, hjl⟩ : ∃ j l, w j l ≠ 0 := by
    by_contra h
    push_neg at h
    exact hw (Matrix.ext h)
  refine ⟨basisVec j, fun h => hjl ?_⟩
  have := congrFun h l
  simpa [Matrix.vecMul, dotProduct, basisVec] using this

/-- The variables of the generic basis change: the entries of `S` (3 × 3) and `T` (2 × 2). -/
abbrev Var := (Fin 3 × Fin 3) ⊕ (Fin 2 × Fin 2)

/-- The matrix `S` with entries `x`. -/
def matS (x : Var → K) : Matrix (Fin 3) (Fin 3) K := Matrix.of fun i j => x (Sum.inl (i, j))

/-- The matrix `T` with entries `x`. -/
def matT (x : Var → K) : Matrix (Fin 2) (Fin 2) K := Matrix.of fun i j => x (Sum.inr (i, j))

/-- Column `0` of `S`, the vector `u` of the prose. -/
def colS (x : Var → K) : Fin 3 → K := fun a => x (Sum.inl (a, 0))

/-- Row `0` of `T`, the row `p` of the prose. -/
def rowT (x : Var → K) : Fin 2 → K := fun j => x (Sum.inr (0, j))

theorem rowT_add (x y : Var → K) : rowT (x + y) = rowT x + rowT y := rfl

theorem rowT_smul (c : K) (x : Var → K) : rowT (c • x) = c • rowT x := rfl

/-- **Lemma A, steps 2 and 3 (one support).** For every possible support `Σ` there is a
polynomial function `φ` of the variables, not vanishing everywhere, such that `φ x ≠ 0`
implies that `a ↦ D(a p) ℬ(w)` is injective for `p = rowT x` and every `w ≠ 0` with
support `Σ`. -/
theorem exists_suppPoly [Infinite K] (sp : Finset (Fin r)) :
    ∃ φ : (Var → K) → K, IsNonzeroPolyFun φ ∧ ∀ x, φ x ≠ 0 →
      ∀ w : Matrix (Fin 2) (Fin m) K, w ≠ 0 → supp alg w = sp →
        Function.Injective (lmap alg (rowT x) w) := by
  classical
  by_cases hex : ∃ w : Matrix (Fin 2) (Fin m) K, w ≠ 0 ∧ supp alg w = sp
  · obtain ⟨w0, hw0, hs0⟩ := hex
    obtain ⟨p0, hp0⟩ := exists_vecMul_ne_zero hw0
    have hinj0 := lmap_injective alg hp0
    obtain ⟨G, hG⟩ := LinearMap.exists_leftInverse_of_injective (lmap alg p0 w0)
      (LinearMap.ker_eq_bot.mpr hinj0)
    have hdet : ∀ x : Var → K, LinearMap.det (G ∘ₗ lmap alg (rowT x) w0) =
        (Matrix.of fun i j =>
          G (lmap alg (rowT x) w0 (fun j' => if j' = j then 1 else 0)) i).det := by
      intro x
      rw [← LinearMap.det_toMatrix']
      congr 1
      ext i j
      simp only [LinearMap.toMatrix'_apply, LinearMap.coe_comp, Function.comp_apply, Matrix.of_apply]
      have hs : (Pi.single j 1 : Fin 3 → K) = fun j' => if j' = j then 1 else 0 := by
        funext j'
        simp [Pi.single_apply]
      rw [hs]
    refine ⟨fun x => LinearMap.det (G ∘ₗ lmap alg (rowT x) w0), ⟨?_, ?_⟩, ?_⟩
    · simp only [hdet]
      apply IsPolyFun.det
      intro i j
      apply IsPolyFun.of_linear
      · intro x y
        simp [rowT_add, lmap_add_left]
      · intro c x
        simp [rowT_smul, lmap_smul_left]
    · refine ⟨Sum.elim 0 (fun ab => if ab.1 = 0 then p0 ab.2 else 0), ?_⟩
      have hrow : rowT (Sum.elim 0 (fun ab => if ab.1 = 0 then p0 ab.2 else 0)) = p0 := by
        funext j; simp [rowT]
      simp only [hrow, hG, LinearMap.det_id]
      exact one_ne_zero
    · intro x hx w hw hs
      have hcomp : Function.Injective (G ∘ₗ lmap alg (rowT x) w0) := by
        rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
        intro a ha
        have hmat := Matrix.eq_zero_of_mulVec_eq_zero
          (M := LinearMap.toMatrix' (G ∘ₗ lmap alg (rowT x) w0))
          (by rwa [LinearMap.det_toMatrix']) (v := a)
          (by rw [← Matrix.toLin'_apply, Matrix.toLin'_toMatrix']; exact ha)
        exact hmat
      have hL : Function.Injective (lmap alg (rowT x) w0) := by
        intro a b hab
        apply hcomp
        simp [hab]
      exact lmap_injective_of_supp alg (hs0.trans hs.symm) hL
  · refine ⟨fun _ => 1, ⟨IsPolyFun.const 1, 0, one_ne_zero⟩, ?_⟩
    intro x _ w hw hs
    exact absurd ⟨w, hw, hs⟩ hex

/-- **Lemma A, step 1.** `(S, T) ↦ α_r(S e_{0,0} T) = α_r(u p)` is a polynomial function that
does not vanish everywhere if `α_r ≠ 0`. -/
theorem alpha_isNonzeroPolyFun (k : Fin r) (hk : alg.alpha k ≠ 0) :
    IsNonzeroPolyFun (fun x : Var → K => alg.alpha k (outer (colS x) (rowT x))) := by
  classical
  refine ⟨?_, ?_⟩
  · have hfun : (fun x : Var → K => alg.alpha k (outer (colS x) (rowT x))) =
        fun x => ∑ a, x (Sum.inl (a, 0)) * alg.alpha k (outer (basisVec a) (rowT x)) := by
      funext x
      exact linearForm_outer_eq_sum (alg.alpha k) (colS x) (rowT x)
    rw [hfun]
    apply IsPolyFun.sum
    intro a _
    apply (IsPolyFun.coord _).mul
    apply IsPolyFun.of_linear
    · intro x y; simp [rowT_add, outer_add_right]
    · intro c x; simp [rowT_smul, outer_smul_right]
  · obtain ⟨i, j, hij⟩ : ∃ i j, alg.alpha k (unitMatrix i j) ≠ 0 := by
      by_contra h
      push_neg at h
      exact hk (linearForm_eq_zero_of_unitMatrix _ h)
    refine ⟨Sum.elim (fun ab => if i = ab.1 then 1 else 0) (fun ab => if j = ab.2 then 1 else 0),
      ?_⟩
    have hcol : colS (Sum.elim (fun ab => if i = ab.1 then 1 else 0)
        (fun ab => if j = ab.2 then 1 else 0) : Var → K) = basisVec i := rfl
    have hrow : rowT (Sum.elim (fun ab => if i = ab.1 then 1 else 0)
        (fun ab => if j = ab.2 then 1 else 0) : Var → K) = basisVec j := rfl
    simp only [hcol, hrow, outer_basisVec]
    exact hij

theorem detS_isNonzeroPolyFun : IsNonzeroPolyFun (fun x : Var → K => (matS x).det) := by
  classical
  refine ⟨IsPolyFun.det _ fun i j => IsPolyFun.coord _, ?_⟩
  refine ⟨Sum.elim (fun ab => (1 : Matrix (Fin 3) (Fin 3) K) ab.1 ab.2) 0, ?_⟩
  have h1 : matS (Sum.elim (fun ab => (1 : Matrix (Fin 3) (Fin 3) K) ab.1 ab.2) 0) = 1 := by
    ext i j; simp [matS]
  show (matS _).det ≠ 0
  rw [h1, Matrix.det_one]
  exact one_ne_zero

theorem detT_isNonzeroPolyFun : IsNonzeroPolyFun (fun x : Var → K => (matT x).det) := by
  classical
  refine ⟨IsPolyFun.det _ fun i j => IsPolyFun.coord _, ?_⟩
  refine ⟨Sum.elim 0 (fun ab => (1 : Matrix (Fin 2) (Fin 2) K) ab.1 ab.2), ?_⟩
  have h1 : matT (Sum.elim 0 (fun ab => (1 : Matrix (Fin 2) (Fin 2) K) ab.1 ab.2)) = 1 := by
    ext i j; simp [matT]
  show (matT _).det ≠ 0
  rw [h1, Matrix.det_one]
  exact one_ne_zero

/-- **Lemma A** (= Yang v3, Lemma 6, case `k = 3`, `l = 2`). Over an infinite field, if no
`α_r` is the zero form, then some change of basis R3 makes the decomposition strongly
normalized. -/
theorem lemmaA [Infinite K] (h : ∀ k, alg.alpha k ≠ 0) :
    ∃ (S : Matrix (Fin 3) (Fin 3) K) (T : Matrix (Fin 2) (Fin 2) K)
      (hS : IsUnit S.det) (hT : IsUnit T.det),
      StronglyNormalized (changeBasis alg S T hS hT) := by
  classical
  choose φ hφ hφinj using fun sp : Finset (Fin r) => exists_suppPoly alg sp
  have hall := detS_isNonzeroPolyFun.mul (detT_isNonzeroPolyFun.mul
    ((IsNonzeroPolyFun.prod Finset.univ fun k _ => alpha_isNonzeroPolyFun alg k (h k)).mul
      (IsNonzeroPolyFun.prod Finset.univ fun sp _ => hφ sp)))
  obtain ⟨x, hx⟩ := hall.2
  simp only [ne_eq, mul_eq_zero, not_or, Finset.prod_eq_zero_iff, Finset.mem_univ, true_and,
    not_exists] at hx
  obtain ⟨hxS, hxT, hxα, hxφ⟩ := hx
  have hS : IsUnit (matS x).det := isUnit_iff_ne_zero.mpr hxS
  have hT : IsUnit (matT x).det := isUnit_iff_ne_zero.mpr hxT
  refine ⟨matS x, matT x, hS, hT, ?_, ?_⟩
  · -- (SN1)
    intro k
    rw [changeBasis_alpha_apply, mul_unitMatrix_mul]
    exact hxα k
  · -- (SN2)
    intro v hv
    rw [Fintype.linearIndependent_iff]
    intro g hg
    have hw : (matT x)⁻¹ * v ≠ 0 := by
      intro h0
      apply hv
      rw [← Matrix.one_mul v, ← Matrix.mul_nonsing_inv (matT x) hT, Matrix.mul_assoc, h0,
        Matrix.mul_zero]
    have hinj := hφinj _ x (hxφ _) ((matT x)⁻¹ * v) hw rfl
    have hL : lmap alg (rowT x) ((matT x)⁻¹ * v) (matS x *ᵥ g) = 0 := by
      funext k
      have hk := congrFun hg k
      simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply,
        changeBasis_alpha_apply, changeBasis_beta_apply, mul_unitMatrix_mul] at hk
      rw [Pi.zero_apply, ← hk, lmap_apply, ← sum_smul_outer, map_sum, Finset.sum_mul]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [map_smul, smul_eq_mul, mul_assoc]
      rfl
    have hSg : matS x *ᵥ g = 0 := hinj (hL.trans (map_zero _).symm)
    have hg0 : g = 0 := by
      have := congrArg (fun y => (matS x)⁻¹ *ᵥ y) hSg
      simpa [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul _ hS] using this
    intro i
    simp [hg0]

/-- **R2 and Lemma A combined.** Over an infinite field, every decomposition of `⟨3,2,m⟩` of
length `r` yields a strongly normalized decomposition of length `r' ≤ r`. -/
theorem exists_stronglyNormalized [Infinite K] (alg : BilinearAlgorithm K 3 2 m r) :
    ∃ r' ≤ r, ∃ alg' : BilinearAlgorithm K 3 2 m r', StronglyNormalized alg' := by
  classical
  obtain ⟨S, T, hS, hT, hSN⟩ :=
    lemmaA (removeZeroAlpha alg) (removeZeroAlpha_alpha_ne_zero alg)
  exact ⟨_, removeZeroAlpha_length_le alg, _, hSN⟩

end LemmaA

end YangN3Teil2
end YangBounds
