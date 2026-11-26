module

public import YangBounds.Bruecke444

@[expose] public section

/-!
# Lemma K and Folgerung K1 (two factorisations of a quadratic rank-one map)

Task S2-45 (stage 2, round 10, track A, role: formaliser).
Claim file: `behauptungen/B-014.md` (Lemma K is a step of Lemma Z there).

Source: prose `lean/prosa/s2_444_spurA_r6.md` (task S2-24), Section 3.1. In the case `rk X = 1`
the argument runs over polynomials, not pointwise. Here the whole proof runs in the integral
domain `K[p₀, p₁]` (`MvPolynomial (Fin 2) K`) and with the coefficients of quadratic forms, so
it holds over **every** field, finite fields included.

## Setting

For `X : Matrix (Fin n) (Fin 2) K` the vector `Xp` has the linear forms `lin (X i)` as entries,
`lin a = a₀ p₀ + a₁ p₁`. Hypothesis (K) of the prose,

  `(Xp) ⊗ (Yp) = (X'p) ⊗ (Y'p)` as a polynomial identity in `p`,

is `PolyEq X Y X' Y'`. The equivalent coefficient form over `K` is `QuadEq` (`polyEq_iff_quadEq`).

## Main results

* `lemmaK` (**Lemma K**): for every field `K`, every `n` and `X, Y ≠ 0` with (K), either
  (i) `X' = c X`, `Y' = c⁻¹ Y` with `c ≠ 0` (`FallI`), or
  (ii) `X = x l₁ᵀ`, `Y = w l₂ᵀ`, `X' = c x l₂ᵀ`, `Y' = c⁻¹ w l₁ᵀ` with `x, w ≠ 0`, `c ≠ 0` and
  `l₁, l₂` linearly independent (`FallII`).
* `lemmaK_exklusiv`: (i) and (ii) exclude each other.
* `folgerungK1` (**Folgerung K1**): for fixed `X, Y ≠ 0` the solutions of (K) form at most two
  orbits under `(X', Y') ↦ (c X', c⁻¹ Y')`: of three solutions `(X, Y)`, `(X', Y')`,
  `(X'', Y'')` two lie in one orbit.
* `LemmaKStatement K`, `FolgerungK1Statement K` (named propositions) with `lemmaKStatement`,
  `folgerungK1Statement`.
* Connection to the generic normal form (`SatzC444Generisch.lean`, `Bruecke444.lean`):
  `polyEq_of_eval` (an identity at a point `p` whose evaluation map `K[p₀,p₁] → L` is injective
  gives (K)), `aeval_prow_injective` and `aeval_prowL_injective` (the generic point
  `p = (T₀₀, T₀₁)` of `genAlg` over `GField K` and of `genAlgL` over `GBar K` is such a point),
  and `lemmaK_generisch`, `lemmaK_generischL`, `folgerungK1_generisch`,
  `folgerungK1_generischL`: Lemma K and K1 with the hypothesis as an identity at the generic
  point. `polyEq_of_forall` gives (K) from an identity at all points of an infinite field.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace LemmaK444

open MvPolynomial Matrix

universe u v

section Kern

variable {K : Type u} [Field K]

/-! ## Linear forms in `K[p₀, p₁]` -/

/-- The linear form `p ↦ a·p = a₀ p₀ + a₁ p₁` as a polynomial in `K[p₀, p₁]`. -/
noncomputable def lin (a : Fin 2 → K) : MvPolynomial (Fin 2) K :=
  C (a 0) * X 0 + C (a 1) * X 1

/-- The determinant of the `2 × 2` matrix with rows `a`, `b`. -/
def det2 (a b : Fin 2 → K) : K := a 0 * b 1 - a 1 * b 0

theorem lin_smul (c : K) (a : Fin 2 → K) : lin (c • a) = C c * lin a := by
  simp only [lin, Pi.smul_apply, smul_eq_mul, map_mul]
  ring

theorem lin_sub (a b : Fin 2 → K) : lin (a - b) = lin a - lin b := by
  simp only [lin, Pi.sub_apply, map_sub]
  ring

private theorem single_ne_single : (Finsupp.single (0 : Fin 2) 1 : Fin 2 →₀ ℕ) ≠
    Finsupp.single 1 1 := by
  intro h
  have := DFunLike.congr_fun h 0
  simp at this

theorem lin_eq_monomial (a : Fin 2 → K) :
    lin a = monomial (Finsupp.single 0 1) (a 0) + monomial (Finsupp.single 1 1) (a 1) := by
  simp only [lin, C_mul_X_eq_monomial]

theorem coeff_lin (a : Fin 2 → K) (i : Fin 2) : coeff (Finsupp.single i 1) (lin a) = a i := by
  rw [lin_eq_monomial, coeff_add, coeff_monomial, coeff_monomial]
  fin_cases i
  · simp [single_ne_single]
    intro h
    exact absurd h.symm single_ne_single
  · simp [single_ne_single.symm]
    intro h
    exact absurd h single_ne_single

theorem lin_eq_zero_iff (a : Fin 2 → K) : lin a = 0 ↔ a = 0 := by
  constructor
  · intro h
    funext i
    rw [← coeff_lin a i, h, coeff_zero, Pi.zero_apply]
  · rintro rfl
    simp [lin]

theorem lin_injective : Function.Injective (lin (K := K)) := by
  intro a b h
  rw [← sub_eq_zero, ← lin_eq_zero_iff, lin_sub, h, sub_self]

/-- The three monomials of degree 2 in `p₀, p₁`. -/
noncomputable abbrev m00 : Fin 2 →₀ ℕ := Finsupp.single 0 2
noncomputable abbrev m11 : Fin 2 →₀ ℕ := Finsupp.single 1 2
noncomputable abbrev m01 : Fin 2 →₀ ℕ := Finsupp.single 0 1 + Finsupp.single 1 1

private theorem m00_ne_m11 : m00 ≠ m11 := by
  intro h
  have := DFunLike.congr_fun h 0
  simp at this

private theorem m00_ne_m01 : m00 ≠ m01 := by
  intro h
  have := DFunLike.congr_fun h 0
  simp at this

private theorem m11_ne_m01 : m11 ≠ m01 := by
  intro h
  have := DFunLike.congr_fun h 1
  simp at this

theorem lin_mul_lin (a b : Fin 2 → K) :
    lin a * lin b = monomial m00 (a 0 * b 0) + monomial m01 (a 0 * b 1 + a 1 * b 0) +
      monomial m11 (a 1 * b 1) := by
  have h00 : monomial m00 (a 0 * b 0) = C (a 0 * b 0) * X 0 ^ 2 := by
    rw [C_mul_X_pow_eq_monomial]
  have h11 : monomial m11 (a 1 * b 1) = C (a 1 * b 1) * X 1 ^ 2 := by
    rw [C_mul_X_pow_eq_monomial]
  have h01 : monomial m01 (a 0 * b 1 + a 1 * b 0) =
      C (a 0 * b 1 + a 1 * b 0) * (X 0 * X 1) := by
    rw [X, X, monomial_mul, one_mul, C_mul_monomial, mul_one]
  rw [h00, h11, h01, lin, lin]
  simp only [map_mul, map_add]
  ring

theorem coeff_lin_mul_lin (a b : Fin 2 → K) :
    coeff m00 (lin a * lin b) = a 0 * b 0 ∧ coeff m11 (lin a * lin b) = a 1 * b 1 ∧
      coeff m01 (lin a * lin b) = a 0 * b 1 + a 1 * b 0 := by
  rw [lin_mul_lin]
  simp only [coeff_add, coeff_monomial]
  refine ⟨?_, ?_, ?_⟩
  · simp [m00_ne_m01.symm, m00_ne_m11.symm]
  · simp [m00_ne_m11, m11_ne_m01.symm]
  · simp [m00_ne_m01, m11_ne_m01]

/-- A product of two linear forms is determined by its three coefficients. -/
theorem lin_mul_lin_eq_iff (a b c d : Fin 2 → K) :
    lin a * lin b = lin c * lin d ↔
      a 0 * b 0 = c 0 * d 0 ∧ a 1 * b 1 = c 1 * d 1 ∧
        a 0 * b 1 + a 1 * b 0 = c 0 * d 1 + c 1 * d 0 := by
  constructor
  · intro h
    obtain ⟨h1, h2, h3⟩ := coeff_lin_mul_lin a b
    obtain ⟨h1', h2', h3'⟩ := coeff_lin_mul_lin c d
    rw [h] at h1 h2 h3
    exact ⟨h1.symm.trans h1', h2.symm.trans h2', h3.symm.trans h3'⟩
  · rintro ⟨h1, h2, h3⟩
    rw [lin_mul_lin, lin_mul_lin, h1, h2, h3]

/-! ## The rank-one step (polynomial form)

If `a, b` are linearly independent and `(a·p)(d·p) = (b·p)(c·p)` as polynomials, then
`c = μ a` and `d = μ b`. In the prose: `l₁·p` is a prime element not dividing `l₁'·p`. Here the
coefficient comparison and an explicit identity replace the divisibility argument. -/

theorem prop_of_det2 {a b c d : Fin 2 → K} (hD : det2 a b ≠ 0)
    (h : lin a * lin d = lin b * lin c) : ∃ μ : K, c = μ • a ∧ d = μ • b := by
  obtain ⟨E1, E2, E3⟩ := (lin_mul_lin_eq_iff a d b c).1 h
  unfold det2 at hD
  set D := a 0 * b 1 - a 1 * b 0 with hDdef
  set N := c 0 * b 1 - c 1 * b 0 with hN
  refine ⟨N / D, ?_, ?_⟩
  · funext i
    fin_cases i
    · have key : D * (D * c 0 - N * a 0) = 0 := by
        rw [hDdef, hN]
        linear_combination (-(a 1) ^ 2 * b 0) * E1 + (-(a 0) ^ 2 * b 0) * E2 +
          (a 0 * a 1 * b 0) * E3
      have h0 := (mul_eq_zero.1 key).resolve_left hD
      show c 0 = N / D * a 0
      rw [div_mul_eq_mul_div, eq_div_iff hD]
      linear_combination h0
    · have key : D * (D * c 1 - N * a 1) = 0 := by
        rw [hDdef, hN]
        linear_combination (-(a 1) ^ 2 * b 1) * E1 + (-(a 0) ^ 2 * b 1) * E2 +
          (a 0 * a 1 * b 1) * E3
      have h0 := (mul_eq_zero.1 key).resolve_left hD
      show c 1 = N / D * a 1
      rw [div_mul_eq_mul_div, eq_div_iff hD]
      linear_combination h0
  · funext i
    fin_cases i
    · have key : D * (D * d 0 - N * b 0) = 0 := by
        rw [hDdef, hN]
        linear_combination (b 1 * (a 0 * b 1 - 2 * a 1 * b 0)) * E1 + (-(a 0) * b 0 ^ 2) * E2 +
          (a 1 * b 0 ^ 2) * E3
      have h0 := (mul_eq_zero.1 key).resolve_left hD
      show d 0 = N / D * b 0
      rw [div_mul_eq_mul_div, eq_div_iff hD]
      linear_combination h0
    · have key : D * (D * d 1 - N * b 1) = 0 := by
        rw [hDdef, hN]
        linear_combination (-(a 1) * b 1 ^ 2) * E1 + (-(b 0) * (2 * a 0 * b 1 - a 1 * b 0)) * E2 +
          (a 0 * b 1 ^ 2) * E3
      have h0 := (mul_eq_zero.1 key).resolve_left hD
      show d 1 = N / D * b 1
      rw [div_mul_eq_mul_div, eq_div_iff hD]
      linear_combination h0

/-- Two vectors of `K²` with vanishing determinant: the second is a multiple of the first. -/
theorem exists_smul_of_det2_eq_zero {a b : Fin 2 → K} (ha : a ≠ 0) (hD : det2 a b = 0) :
    ∃ c : K, b = c • a := by
  unfold det2 at hD
  by_cases h0 : a 0 = 0
  · have h1 : a 1 ≠ 0 := by
      intro h1
      apply ha
      funext i
      fin_cases i
      · exact h0
      · exact h1
    refine ⟨b 1 / a 1, ?_⟩
    funext i
    fin_cases i
    · show b 0 = b 1 / a 1 * a 0
      rw [h0, mul_zero]
      rw [h0, zero_mul, zero_sub, neg_eq_zero] at hD
      exact (mul_eq_zero.1 hD).resolve_left h1
    · show b 1 = b 1 / a 1 * a 1
      rw [div_mul_cancel₀ _ h1]
  · refine ⟨b 0 / a 0, ?_⟩
    funext i
    fin_cases i
    · show b 0 = b 0 / a 0 * a 0
      rw [div_mul_cancel₀ _ h0]
    · show b 1 = b 0 / a 0 * a 1
      rw [div_mul_eq_mul_div, eq_div_iff h0]
      linear_combination hD

theorem det2_smul_left (c : K) (a b : Fin 2 → K) : det2 (c • a) b = c * det2 a b := by
  simp only [det2, Pi.smul_apply, smul_eq_mul]
  ring

theorem det2_self (a : Fin 2 → K) : det2 a a = 0 := by
  simp only [det2]
  ring

theorem det2_swap (a b : Fin 2 → K) : det2 b a = -det2 a b := by
  simp only [det2]
  ring

/-- Three vectors of `K²`: if `u ≠ 0` is parallel to `v` and to `w`, then `v ∥ w`. -/
theorem det2_eq_zero_of_trans {u v w : Fin 2 → K} (hu : u ≠ 0) (hv : det2 u v = 0)
    (hw : det2 u w = 0) : det2 v w = 0 := by
  simp only [det2] at hv hw
  have k0 : det2 v w * u 0 = 0 := by
    simp only [det2]
    linear_combination (-(w 0)) * hv + v 0 * hw
  have k1 : det2 v w * u 1 = 0 := by
    simp only [det2]
    linear_combination (-(w 1)) * hv + v 1 * hw
  by_contra hvw
  apply hu
  funext k
  fin_cases k
  · exact (mul_eq_zero.1 k0).resolve_left hvw
  · exact (mul_eq_zero.1 k1).resolve_left hvw

/-- Equal rank-one matrices `x lᵀ = y mᵀ` with `x ≠ 0` have parallel row vectors. -/
theorem det2_eq_zero_of_vecMulVec_eq {n : ℕ} {x y : Fin n → K} {l m : Fin 2 → K}
    (hx : x ≠ 0) (h : vecMulVec x l = vecMulVec y m) : det2 l m = 0 := by
  obtain ⟨i, hi⟩ : ∃ i, x i ≠ 0 := by
    by_contra hc
    push_neg at hc
    exact hx (funext hc)
  have hrow : x i • l = y i • m := by
    funext k
    have := congrFun (congrFun h i) k
    simpa [vecMulVec_apply] using this
  have : x i * det2 l m = 0 := by
    rw [← det2_smul_left, hrow, det2_smul_left, det2_self, mul_zero]
  exact (mul_eq_zero.1 this).resolve_left hi

/-! ## Lemma K -/

variable {n : ℕ}

/-- **Hypothesis (K)**: `(Xp) ⊗ (Yp) = (X'p) ⊗ (Y'p)` as an identity of polynomials in
`p = (p₀, p₁)`. Row `i` of `X` is the coefficient vector of the entry `(Xp)_i`. -/
def PolyEq (X Y X' Y' : Matrix (Fin n) (Fin 2) K) : Prop :=
  ∀ i j, lin (X i) * lin (Y j) = lin (X' i) * lin (Y' j)

/-- Hypothesis (K) in coefficient form over `K` (the three coefficients of `p₀²`, `p₁²`,
`p₀ p₁` of every entry of the two quadratic maps). -/
def QuadEq (X Y X' Y' : Matrix (Fin n) (Fin 2) K) : Prop :=
  ∀ i j, X i 0 * Y j 0 = X' i 0 * Y' j 0 ∧ X i 1 * Y j 1 = X' i 1 * Y' j 1 ∧
    X i 0 * Y j 1 + X i 1 * Y j 0 = X' i 0 * Y' j 1 + X' i 1 * Y' j 0

theorem polyEq_iff_quadEq (X Y X' Y' : Matrix (Fin n) (Fin 2) K) :
    PolyEq X Y X' Y' ↔ QuadEq X Y X' Y' :=
  forall_congr' fun _ => forall_congr' fun _ => lin_mul_lin_eq_iff _ _ _ _

/-- Case (i) of Lemma K: `X' = c X`, `Y' = c⁻¹ Y` with `c ≠ 0`. -/
def FallI (X Y X' Y' : Matrix (Fin n) (Fin 2) K) : Prop :=
  ∃ c : K, c ≠ 0 ∧ X' = c • X ∧ Y' = c⁻¹ • Y

/-- Case (ii) of Lemma K: `X = x l₁ᵀ`, `Y = w l₂ᵀ`, `X' = c x l₂ᵀ`, `Y' = c⁻¹ w l₁ᵀ` with
`x, w ≠ 0`, `c ≠ 0` and `l₁, l₂` linearly independent (`det2 l₁ l₂ ≠ 0`). -/
def FallII (X Y X' Y' : Matrix (Fin n) (Fin 2) K) : Prop :=
  ∃ (x w : Fin n → K) (l₁ l₂ : Fin 2 → K) (c : K), x ≠ 0 ∧ w ≠ 0 ∧ det2 l₁ l₂ ≠ 0 ∧ c ≠ 0 ∧
    X = vecMulVec x l₁ ∧ Y = vecMulVec w l₂ ∧ X' = c • vecMulVec x l₂ ∧
      Y' = c⁻¹ • vecMulVec w l₁

theorem exists_row_ne_zero {X : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0) : ∃ i, X i ≠ 0 := by
  by_contra h
  push_neg at h
  exact hX (funext h)

theorem PolyEq.ne_zero {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (h : PolyEq X Y X' Y')
    (hX : X ≠ 0) (hY : Y ≠ 0) : X' ≠ 0 ∧ Y' ≠ 0 := by
  obtain ⟨i, hi⟩ := exists_row_ne_zero hX
  obtain ⟨j, hj⟩ := exists_row_ne_zero hY
  have hne : lin (X' i) * lin (Y' j) ≠ 0 := by
    rw [← h i j]
    exact mul_ne_zero (mt (lin_eq_zero_iff _).1 hi) (mt (lin_eq_zero_iff _).1 hj)
  constructor
  · rintro rfl
    apply hne
    simp [lin]
  · rintro rfl
    apply hne
    simp [lin]

theorem PolyEq.symm {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (h : PolyEq X Y X' Y') :
    PolyEq X' Y' X Y := fun i j => (h i j).symm

theorem PolyEq.trans {X Y X' Y' X'' Y'' : Matrix (Fin n) (Fin 2) K} (h : PolyEq X Y X' Y')
    (h' : PolyEq X' Y' X'' Y'') : PolyEq X Y X'' Y'' := fun i j => (h i j).trans (h' i j)

/-- **Lemma K** (prose `s2_444_spurA_r6.md` Section 3.1): over every field,
two factorisations `(Xp) ⊗ (Yp) = (X'p) ⊗ (Y'p)` with `X, Y ≠ 0` are related by case (i) or
case (ii). -/
theorem lemmaK {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0) (hY : Y ≠ 0)
    (h : PolyEq X Y X' Y') : FallI X Y X' Y' ∨ FallII X Y X' Y' := by
  obtain ⟨i0, hi0⟩ := exists_row_ne_zero hX
  obtain ⟨j0, hj0⟩ := exists_row_ne_zero hY
  set a := X i0 with ha_def
  set b := X' i0 with hb_def
  have hla : lin a ≠ 0 := mt (lin_eq_zero_iff _).1 hi0
  have hlY : lin (Y j0) ≠ 0 := mt (lin_eq_zero_iff _).1 hj0
  have hprod : lin b * lin (Y' j0) ≠ 0 := by
    rw [← h i0 j0]
    exact mul_ne_zero hla hlY
  have hlb : lin b ≠ 0 := left_ne_zero_of_mul hprod
  have hlY' : lin (Y' j0) ≠ 0 := right_ne_zero_of_mul hprod
  have hb0 : b ≠ 0 := fun hb => hlb ((lin_eq_zero_iff _).2 hb)
  -- the `2 × 2` minors of `[Xp | X'p]` vanish (prose Step 1), by cancelling `(Y'p)_{j₀} ≠ 0`
  have minor : ∀ i, lin a * lin (X' i) = lin b * lin (X i) := by
    intro i
    apply mul_right_cancel₀ hlY'
    linear_combination (-lin a) * h i j0 + lin (X i) * h i0 j0
  by_cases hD : det2 a b = 0
  · -- `X'p ∥ Xp`: case (i)
    left
    obtain ⟨c, hc⟩ := exists_smul_of_det2_eq_zero hi0 hD
    have hc0 : c ≠ 0 := by
      rintro rfl
      exact hb0 (by rw [hc, zero_smul])
    have hlbc : lin b = C c * lin a := by rw [hc, lin_smul]
    have hX' : X' = c • X := by
      funext i
      apply lin_injective
      apply mul_left_cancel₀ hla
      rw [minor i, hlbc, Pi.smul_apply, lin_smul]
      ring
    have hY' : Y = c • Y' := by
      funext j
      apply lin_injective
      apply mul_left_cancel₀ hla
      rw [h i0 j, ← hb_def, hlbc, Pi.smul_apply, lin_smul]
      ring
    refine ⟨c, hc0, hX', ?_⟩
    rw [hY', smul_smul, inv_mul_cancel₀ hc0, one_smul]
  · -- `l₁ = a`, `l₂ = b` independent: case (ii)
    right
    have hrowX : ∀ i, ∃ μ : K, X i = μ • a ∧ X' i = μ • b := fun i => prop_of_det2 hD (minor i)
    have hrowY : ∀ j, ∃ ν : K, Y' j = ν • a ∧ Y j = ν • b := fun j => prop_of_det2 hD (h i0 j)
    choose μ hμ using hrowX
    choose ν hν using hrowY
    refine ⟨μ, ν, a, b, 1, ?_, ?_, hD, one_ne_zero, ?_, ?_, ?_, ?_⟩
    · intro hμ0
      apply hi0
      have := (hμ i0).1
      rw [hμ0, Pi.zero_apply, zero_smul] at this
      exact this
    · intro hν0
      apply hj0
      have := (hν j0).2
      rw [hν0, Pi.zero_apply, zero_smul] at this
      exact this
    · funext i k
      rw [(hμ i).1, vecMulVec_apply, Pi.smul_apply, smul_eq_mul]
    · funext j k
      rw [(hν j).2, vecMulVec_apply, Pi.smul_apply, smul_eq_mul]
    · funext i k
      rw [(hμ i).2, one_smul, vecMulVec_apply, Pi.smul_apply, smul_eq_mul]
    · funext j k
      rw [(hν j).1, inv_one, one_smul, vecMulVec_apply, Pi.smul_apply, smul_eq_mul]

/-- The two cases of Lemma K exclude each other (in case (ii) `X` and `X'` are not
proportional). -/
theorem lemmaK_exklusiv {X Y X' Y' : Matrix (Fin n) (Fin 2) K} :
    ¬ (FallI X Y X' Y' ∧ FallII X Y X' Y') := by
  rintro ⟨⟨c, hc, hX', -⟩, ⟨x, w, l₁, l₂, c', hx, -, hD, hc', hX, -, hX'', -⟩⟩
  apply hD
  have h : vecMulVec x l₁ = vecMulVec ((c' / c) • x) l₂ := by
    funext i k
    have := congrFun (congrFun (hX'.symm.trans hX'') i) k
    rw [hX] at this
    simp only [Matrix.smul_apply, vecMulVec_apply, smul_eq_mul] at this ⊢
    field_simp
    linear_combination this
  exact det2_eq_zero_of_vecMulVec_eq hx h

/-! ## Folgerung K1: at most two orbits -/

/-- **Folgerung K1** (prose Section 3.1): for fixed `X, Y ≠ 0` the solutions `(X', Y')` of (K)
form at most two orbits under `(X', Y') ↦ (c X', c⁻¹ Y')`. Of three solutions `(X, Y)`,
`(X', Y')`, `(X'', Y'')`, two lie in the same orbit. -/
theorem folgerungK1 {X Y X' Y' X'' Y'' : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0) (hY : Y ≠ 0)
    (h' : PolyEq X Y X' Y') (h'' : PolyEq X Y X'' Y'') :
    FallI X Y X' Y' ∨ FallI X Y X'' Y'' ∨ FallI X' Y' X'' Y'' := by
  obtain ⟨hX', hY'⟩ := h'.ne_zero hX hY
  rcases lemmaK hX hY h' with hA | ⟨x₁, w₁, l₁, l₂, c₁, hx₁, hw₁, hD₁, hc₁, hXA, hYA, hX'A, -⟩
  · exact Or.inl hA
  rcases lemmaK hX hY h'' with hB | ⟨x₂, w₂, m₁, m₂, c₂, hx₂, hw₂, hD₂, hc₂, -, hYB, hX''B, -⟩
  · exact Or.inr (Or.inl hB)
  rcases lemmaK hX' hY' (h'.symm.trans h'') with hC |
    ⟨x₃, w₃, k₁, k₂, c₃, hx₃, hw₃, hD₃, hc₃, hX'C, -, hX''C, -⟩
  · exact Or.inr (Or.inr hC)
  exfalso
  have hl₂ : l₂ ≠ 0 := by
    rintro rfl
    apply hD₁
    simp [det2]
  have hm₂ : m₂ ≠ 0 := by
    rintro rfl
    apply hD₂
    simp [det2]
  -- `Y = w₁ l₂ᵀ = w₂ m₂ᵀ`
  have e1 : det2 l₂ m₂ = 0 := det2_eq_zero_of_vecMulVec_eq hw₁ (hYA.symm.trans hYB)
  -- `X' = c₁ x₁ l₂ᵀ = x₃ k₁ᵀ`
  have e2 : det2 l₂ k₁ = 0 := by
    refine det2_eq_zero_of_vecMulVec_eq (x := c₁ • x₁) (y := x₃) (smul_ne_zero hc₁ hx₁) ?_
    rw [← hX'C, hX'A]
    funext i k
    simp [vecMulVec_apply, mul_assoc]
  -- `X'' = c₂ x₂ m₂ᵀ = c₃ x₃ k₂ᵀ`
  have e3 : det2 m₂ k₂ = 0 := by
    refine det2_eq_zero_of_vecMulVec_eq (x := c₂ • x₂) (y := c₃ • x₃) (smul_ne_zero hc₂ hx₂) ?_
    have : c₂ • vecMulVec x₂ m₂ = c₃ • vecMulVec x₃ k₂ := hX''B.symm.trans hX''C
    funext i k
    have := congrFun (congrFun this i) k
    simpa [vecMulVec_apply, mul_assoc] using this
  have e4 : det2 m₂ k₁ = 0 := det2_eq_zero_of_trans hl₂ e1 e2
  exact hD₃ (det2_eq_zero_of_trans hm₂ e4 e3)

/-! ## Evaluation at a point -/

section Eval

variable {L : Type v} [CommRing L] [Algebra K L]

/-- The value `a·p = a₀ p₀ + a₁ p₁` at a point `p ∈ L²`. -/
def evalLin (p : Fin 2 → L) (a : Fin 2 → K) : L :=
  algebraMap K L (a 0) * p 0 + algebraMap K L (a 1) * p 1

theorem aeval_lin (p : Fin 2 → L) (a : Fin 2 → K) : aeval p (lin a) = evalLin p a := by
  simp [lin, evalLin, Algebra.smul_def]

/-- (K) holds at every point of every commutative `K`-algebra. -/
theorem PolyEq.eval {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (h : PolyEq X Y X' Y')
    (p : Fin 2 → L) (i j : Fin n) :
    evalLin p (X i) * evalLin p (Y j) = evalLin p (X' i) * evalLin p (Y' j) := by
  rw [← aeval_lin, ← aeval_lin, ← aeval_lin, ← aeval_lin, ← map_mul, ← map_mul, h i j]

/-- An identity at a point `p` whose evaluation map `K[p₀, p₁] → L` is injective (a generic
point) gives (K). -/
theorem polyEq_of_eval {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (p : Fin 2 → L)
    (hp : Function.Injective (aeval p : MvPolynomial (Fin 2) K →ₐ[K] L))
    (h : ∀ i j, evalLin p (X i) * evalLin p (Y j) = evalLin p (X' i) * evalLin p (Y' j)) :
    PolyEq X Y X' Y' := by
  intro i j
  apply hp
  rw [map_mul, map_mul, aeval_lin, aeval_lin, aeval_lin, aeval_lin]
  exact h i j

end Eval

/-- Over an infinite field, an identity at all points `p ∈ K²` gives (K). -/
theorem polyEq_of_forall [Infinite K] {X Y X' Y' : Matrix (Fin n) (Fin 2) K}
    (h : ∀ (p : Fin 2 → K) i j,
      (X i ⬝ᵥ p) * (Y j ⬝ᵥ p) = (X' i ⬝ᵥ p) * (Y' j ⬝ᵥ p)) :
    PolyEq X Y X' Y' := by
  intro i j
  apply MvPolynomial.funext
  intro p
  have hl : ∀ a : Fin 2 → K, MvPolynomial.eval p (lin a) = a ⬝ᵥ p := by
    intro a
    simp [lin, dotProduct, Fin.sum_univ_two]
  rw [map_mul, map_mul, hl, hl, hl, hl]
  exact h p i j

end Kern

/-! ## Named propositions -/

/-- **Lemma K** as a proposition about the field `K`. -/
def LemmaKStatement (K : Type u) [Field K] : Prop :=
  ∀ (n : ℕ) (X Y X' Y' : Matrix (Fin n) (Fin 2) K), X ≠ 0 → Y ≠ 0 → PolyEq X Y X' Y' →
    FallI X Y X' Y' ∨ FallII X Y X' Y'

/-- **Folgerung K1** as a proposition about the field `K`. -/
def FolgerungK1Statement (K : Type u) [Field K] : Prop :=
  ∀ (n : ℕ) (X Y X' Y' X'' Y'' : Matrix (Fin n) (Fin 2) K), X ≠ 0 → Y ≠ 0 →
    PolyEq X Y X' Y' → PolyEq X Y X'' Y'' →
      FallI X Y X' Y' ∨ FallI X Y X'' Y'' ∨ FallI X' Y' X'' Y''

theorem lemmaKStatement (K : Type u) [Field K] : LemmaKStatement K :=
  fun _ _ _ _ _ hX hY h => lemmaK hX hY h

theorem folgerungK1Statement (K : Type u) [Field K] : FolgerungK1Statement K :=
  fun _ _ _ _ _ _ _ hX hY h' h'' => folgerungK1 hX hY h' h''

/-! ## Connection to the generic normal form

The generic normal form `SatzC444.genAlg alg` lives over `GField K` and its point is
`p = SatzC444.prow K = (T₀₀, T₀₁)`; the form `Bruecke444.genAlgL alg` over `GBar K` has the
point `Bruecke444.prowL K`. Both points are generic: evaluation of `K[p₀, p₁]` there is
injective. So an identity `(Xp) ⊗ (Yp) = (X'p) ⊗ (Y'p)` with `X, Y, X', Y'` over `K`, checked
at the generic point, is hypothesis (K). -/

section Generisch

open SatzC444 Bruecke444

variable (K : Type u) [Field K]

/-- The index of the variable `T₀ⱼ`. -/
def idxT (j : Fin 2) : YangN4Haupt.Var 3 := Sum.inr (0, j)

theorem idxT_injective : Function.Injective idxT := by
  intro j j' h
  simpa [idxT] using h

theorem aeval_prow_eq :
    (aeval (prow K) : MvPolynomial (Fin 2) K →ₐ[K] GField K) =
      (IsScalarTower.toAlgHom K (GPoly K) (GField K)).comp (rename idxT) := by
  apply MvPolynomial.algHom_ext
  intro j
  simp [prow, xg, idxT]

/-- **The generic point `(T₀₀, T₀₁)` of `GField K` is algebraically independent over `K`.** -/
theorem aeval_prow_injective :
    Function.Injective (aeval (prow K) : MvPolynomial (Fin 2) K →ₐ[K] GField K) := by
  rw [aeval_prow_eq]
  exact (IsFractionRing.injective (GPoly K) (GField K)).comp (rename_injective _ idxT_injective)

theorem aeval_prowL_eq :
    (aeval (prowL (K := K)) : MvPolynomial (Fin 2) K →ₐ[K] GBar K) =
      (IsScalarTower.toAlgHom K (GField K) (GBar K)).comp (aeval (prow K)) := by
  apply MvPolynomial.algHom_ext
  intro j
  simp [prowL]

/-- **The generic point of `GBar K` is algebraically independent over `K`.** -/
theorem aeval_prowL_injective :
    Function.Injective (aeval (prowL (K := K)) : MvPolynomial (Fin 2) K →ₐ[K] GBar K) := by
  rw [aeval_prowL_eq]
  exact (ι_injective K).comp (aeval_prow_injective K)

variable {K} {n : ℕ}

/-- **Lemma K at the generic point of `GField K`.** -/
theorem lemmaK_generisch {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0) (hY : Y ≠ 0)
    (h : ∀ i j, evalLin (prow K) (X i) * evalLin (prow K) (Y j) =
      evalLin (prow K) (X' i) * evalLin (prow K) (Y' j)) :
    FallI X Y X' Y' ∨ FallII X Y X' Y' :=
  lemmaK hX hY (polyEq_of_eval _ (aeval_prow_injective K) h)

/-- **Lemma K at the generic point of `GBar K`.** -/
theorem lemmaK_generischL {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0) (hY : Y ≠ 0)
    (h : ∀ i j, evalLin (prowL (K := K)) (X i) * evalLin (prowL (K := K)) (Y j) =
      evalLin (prowL (K := K)) (X' i) * evalLin (prowL (K := K)) (Y' j)) :
    FallI X Y X' Y' ∨ FallII X Y X' Y' :=
  lemmaK hX hY (polyEq_of_eval _ (aeval_prowL_injective K) h)

/-- **Folgerung K1 at the generic point of `GField K`.** -/
theorem folgerungK1_generisch {X Y X' Y' X'' Y'' : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0)
    (hY : Y ≠ 0)
    (h' : ∀ i j, evalLin (prow K) (X i) * evalLin (prow K) (Y j) =
      evalLin (prow K) (X' i) * evalLin (prow K) (Y' j))
    (h'' : ∀ i j, evalLin (prow K) (X i) * evalLin (prow K) (Y j) =
      evalLin (prow K) (X'' i) * evalLin (prow K) (Y'' j)) :
    FallI X Y X' Y' ∨ FallI X Y X'' Y'' ∨ FallI X' Y' X'' Y'' :=
  folgerungK1 hX hY (polyEq_of_eval _ (aeval_prow_injective K) h')
    (polyEq_of_eval _ (aeval_prow_injective K) h'')

/-- **Folgerung K1 at the generic point of `GBar K`.** -/
theorem folgerungK1_generischL {X Y X' Y' X'' Y'' : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0)
    (hY : Y ≠ 0)
    (h' : ∀ i j, evalLin (prowL (K := K)) (X i) * evalLin (prowL (K := K)) (Y j) =
      evalLin (prowL (K := K)) (X' i) * evalLin (prowL (K := K)) (Y' j))
    (h'' : ∀ i j, evalLin (prowL (K := K)) (X i) * evalLin (prowL (K := K)) (Y j) =
      evalLin (prowL (K := K)) (X'' i) * evalLin (prowL (K := K)) (Y'' j)) :
    FallI X Y X' Y' ∨ FallI X Y X'' Y'' ∨ FallI X' Y' X'' Y'' :=
  folgerungK1 hX hY (polyEq_of_eval _ (aeval_prowL_injective K) h')
    (polyEq_of_eval _ (aeval_prowL_injective K) h'')

end Generisch

end LemmaK444
end YangBounds
