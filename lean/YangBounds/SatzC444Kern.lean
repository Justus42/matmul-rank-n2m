import YangBounds.SatzB444Final

/-!
# Satz C for `⟨4,2,4⟩`: the algebraic core (identity (Kl), quadric, contradiction)

Task S2-26 (stage 2, round 7, track A, role: formaliser).

Sources: prose `lean/prosa/s2_444_spurA_r4.md` (task S2-16), Section 3 (Satz C).

## What is proved here

`satzC_kern`: Let `F` be a field with a derivation `D : F → F` (additive, Leibniz rule; given as
the structure `IsDeriv`). Let `alg` be a decomposition of `⟨4,2,4⟩` over `F` of length `r ≤ 25`
whose linear forms are constant (`D` kills `α_t(e_{ij})` and `β_t(e_{ij})`). Let `p, v ∈ F²` with
`p·v = 0` and `(Dp)·v ≠ 0`. Suppose the decomposition is symmetric at the point `(p, v)`:
there are an injective linear map `E` of `F⁴` and scalars `μ_t` with

  `β_t(v (E x)ᵀ) = μ_t · α_t(x pᵀ)` for all `t` and `x`,                         (S)

and that every term with `β_t(v ·ᵀ) = 0` also has `β_t((Dv) ·ᵀ) = 0`. Then `False`.

This is the prose proof of Satz C (Steps 1 to 4) at one point of a field with a derivation,
in a function-field form: instead of `p` and `p + εd` with dual numbers, the
equation (S) is differentiated with `D` (product rule). In the prose notation
`a_t(p) = A_t p`, `b_t(p) = B_tᵀ J p`; here the point `v` plays the role of `J p` (any `v` with
`p·v = 0`), and `E` is `Mᵀ` up to the choice of coordinates.

## Deviations from the prose (documented; the statement is not weaker)

1. **No rational choice of `M_p` (Step 0).** The derivation acts on the given `E` and `μ_t`; no
   rational functions are needed. The field `F` is, in the application, the function field of
   the generic point (file `SatzC444Generisch.lean`).
2. **`μ_t ≠ 0` is not assumed**. Terms with `μ_t = 0` have
   `β_t(v ·ᵀ) = 0`; the hypothesis `hb` then gives `β_t((Dv) ·ᵀ) = 0`, and these terms drop out
   of (Kl) and of the spanning argument. At the generic point `hb` holds because such a `β_t`
   is the zero form.
3. **The quadric is found in the space of `q` with `μ_t q(a_t) = 0`** (the image of
   `q ↦ (μ_t q(a_t))_t` lies in `ker W`, of dimension `r − 16 ≤ 9`, while the quadratic forms have
   dimension 10). This avoids the identification `span{a_t ⊗ a_t} ≅ span{a_t ⊗ b_t}`.
4. **Characteristic 2 without square roots**: from `Q + Qᵀ = 0` the
   form `q` is additive; it vanishes on the `a_t` with `μ_t ≠ 0`, which span `F⁴`; hence `q = 0`.
   This argument is uniform in the characteristic.
5. **Any length `r ≤ 25`**, no reference to B-007.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzC444

open Module YangN4Haupt Matrix
open YangN3Teil2 (outer outer_apply outer_mul outer_smul_right basisVec)

universe u

/-! ## Derivations, given by two equations -/

section Deriv

variable {F : Type u} [Field F]

/-- `D : F → F` is a derivation: additive and with the Leibniz rule. -/
structure IsDeriv (D : F → F) : Prop where
  add : ∀ a b, D (a + b) = D a + D b
  mul : ∀ a b, D (a * b) = a * D b + D a * b

variable {D : F → F}

theorem IsDeriv.map_zero (hD : IsDeriv D) : D 0 = 0 := by
  have h := hD.add 0 0
  rw [add_zero] at h
  linear_combination -h

theorem IsDeriv.map_one (hD : IsDeriv D) : D 1 = 0 := by
  have h := hD.mul 1 1
  simp only [mul_one, one_mul] at h
  linear_combination -h

/-- `D` as an additive map. -/
def IsDeriv.toAddMonoidHom (hD : IsDeriv D) : F →+ F where
  toFun := D
  map_zero' := hD.map_zero
  map_add' := hD.add

theorem IsDeriv.map_sum (hD : IsDeriv D) {ι : Type*} (s : Finset ι) (f : ι → F) :
    D (∑ i ∈ s, f i) = ∑ i ∈ s, D (f i) :=
  _root_.map_sum hD.toAddMonoidHom f s

theorem IsDeriv.map_neg (hD : IsDeriv D) (a : F) : D (-a) = -D a :=
  _root_.map_neg hD.toAddMonoidHom a

theorem IsDeriv.map_sub (hD : IsDeriv D) (a b : F) : D (a - b) = D a - D b :=
  _root_.map_sub hD.toAddMonoidHom a b

theorem IsDeriv.map_dotProduct (hD : IsDeriv D) {n : ℕ} (x y : Fin n → F) :
    D (x ⬝ᵥ y) = x ⬝ᵥ (fun i => D (y i)) + (fun i => D (x i)) ⬝ᵥ y := by
  simp only [dotProduct, hD.map_sum, hD.mul, Finset.sum_add_distrib]

theorem IsDeriv.basisVec (hD : IsDeriv D) {n : ℕ} (b : Fin n) :
    (fun j => D (basisVec b j)) = (0 : Fin n → F) := by
  funext j
  simp only [YangN3Teil2.basisVec, Pi.zero_apply]
  split_ifs
  · exact hD.map_one
  · exact hD.map_zero

end Deriv

/-! ## Linear forms on outer products -/

section Outer

variable {F : Type u} [Field F]

theorem outer_eq_sum {a b : ℕ} (x : Fin a → F) (y : Fin b → F) :
    outer x y = ∑ i, ∑ j, (x i * y j) • (unitMatrix i j : Matrix (Fin a) (Fin b) F) := by
  ext k l
  simp only [outer_apply, Matrix.sum_apply, Matrix.smul_apply, unitMatrix, Matrix.of_apply,
    smul_eq_mul, mul_ite, mul_one, mul_zero, ite_and]
  rw [Finset.sum_eq_single k]
  · rw [Finset.sum_eq_single l]
    · simp
    · intro j _ hj
      simp [Ne.symm hj]
    · simp
  · intro i _ hi
    apply Finset.sum_eq_zero
    intro j _
    simp [Ne.symm hi]
  · simp

theorem form_outer {a b : ℕ} (φ : Matrix (Fin a) (Fin b) F →ₗ[F] F) (x : Fin a → F)
    (y : Fin b → F) : φ (outer x y) = ∑ i, ∑ j, x i * y j * φ (unitMatrix i j) := by
  rw [outer_eq_sum, map_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [map_smul, smul_eq_mul]

theorem outer_zero_left {a b : ℕ} (y : Fin b → F) : outer (0 : Fin a → F) y = 0 := by
  ext i j; simp

/-- Product rule for a constant linear form on outer products. -/
theorem IsDeriv.form_outer {D : F → F} (hD : IsDeriv D) {a b : ℕ}
    (φ : Matrix (Fin a) (Fin b) F →ₗ[F] F) (hφ : ∀ i j, D (φ (unitMatrix i j)) = 0)
    (x : Fin a → F) (y : Fin b → F) :
    D (φ (outer x y)) =
      φ (outer (fun i => D (x i)) y) + φ (outer x (fun j => D (y j))) := by
  rw [SatzC444.form_outer, SatzC444.form_outer, SatzC444.form_outer, hD.map_sum,
    ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [hD.map_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [hD.mul, hφ i j, hD.mul]
  ring

end Outer

/-! ## The identity (D) and the core of Satz C -/

section Core

variable {F : Type u} [Field F] {r : ℕ} (alg : BilinearAlgorithm F 4 2 4 r)

/-- **(D)** for `⟨4,2,4⟩`: `∑_t α_t(u qᵀ) β_t(z wᵀ) C_t = (q·z) u wᵀ`. -/
theorem identD (u : Fin 4 → F) (q z : Fin 2 → F) (w : Fin 4 → F) :
    ∑ t, (alg.alpha t (outer u q) * alg.beta t (outer z w)) • alg.coeff t =
      (q ⬝ᵥ z) • outer u w := by
  rw [← alg.correct, outer_mul]
  have h : q ᵥ* outer z w = (q ⬝ᵥ z) • w := by
    ext l
    simp only [Matrix.vecMul, dotProduct, outer_apply, Pi.smul_apply, smul_eq_mul,
      Finset.sum_mul]
    refine Finset.sum_congr rfl fun j _ => ?_
    ring
  rw [h, outer_smul_right]

/-- The quadratic form `q_Q(x) = ∑_{a,b} Q_{ab} x_a x_b`. -/
def qf (Q : Matrix (Fin 4) (Fin 4) F) (x : Fin 4 → F) : F :=
  ∑ a, ∑ b, Q a b * (x a * x b)

theorem qf_add (Q : Matrix (Fin 4) (Fin 4) F) (x y : Fin 4 → F) :
    qf Q (x + y) = qf Q x + qf Q y + ∑ a, ∑ b, (Q a b + Q b a) * (x a * y b) := by
  have h1 : ∀ a b, Q a b * ((x + y) a * (x + y) b) =
      Q a b * (x a * x b) + Q a b * (y a * y b) + Q a b * (x a * y b) +
        Q a b * (y a * x b) := by
    intro a b; simp only [Pi.add_apply]; ring
  have h2 : ∑ a, ∑ b, Q a b * (y a * x b) = ∑ a, ∑ b, Q b a * (x a * y b) := by
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
    ring
  have h3 : ∑ a, ∑ b, (Q a b + Q b a) * (x a * y b) =
      ∑ a, ∑ b, Q a b * (x a * y b) + ∑ a, ∑ b, Q b a * (x a * y b) := by
    rw [← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun a _ => ?_
    rw [← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun b _ => ?_
    ring
  simp only [qf, h1, Finset.sum_add_distrib]
  rw [h3, h2]
  ring

theorem qf_smul (Q : Matrix (Fin 4) (Fin 4) F) (c : F) (x : Fin 4 → F) :
    qf Q (c • x) = c ^ 2 * qf Q x := by
  simp only [qf, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
  ring

theorem qf_basisVec (Q : Matrix (Fin 4) (Fin 4) F) (i : Fin 4) : qf Q (basisVec i) = Q i i := by
  simp [qf, YangN3Teil2.basisVec]

/-- The 10 coordinates of an upper triangular `4 × 4` matrix. -/
abbrev UTIdx := {ij : Fin 4 × Fin 4 // ij.1 ≤ ij.2}

theorem card_UTIdx : Fintype.card UTIdx = 10 := by decide

/-- Upper triangular matrices, parametrised by their 10 entries. -/
def UT : (UTIdx → F) →ₗ[F] Matrix (Fin 4) (Fin 4) F where
  toFun c := Matrix.of fun i j => if h : i ≤ j then c ⟨(i, j), h⟩ else 0
  map_add' c c' := by
    ext i j
    simp only [Matrix.of_apply, Pi.add_apply, Matrix.add_apply]
    split_ifs <;> simp
  map_smul' a c := by
    ext i j
    simp only [Matrix.of_apply, Pi.smul_apply, Matrix.smul_apply, RingHom.id_apply]
    split_ifs <;> simp

theorem UT_apply (c : UTIdx → F) (i j : Fin 4) :
    UT c i j = if h : i ≤ j then c ⟨(i, j), h⟩ else 0 := rfl

/-- An upper triangular matrix `Q` with `Q + Qᵀ = 0` and zero diagonal is zero. -/
theorem UT_eq_zero (c : UTIdx → F) (hs : ∀ i j, UT c i j + UT c j i = 0)
    (hd : ∀ i, UT c i i = 0) : c = 0 := by
  funext ⟨⟨i, j⟩, h⟩
  have h' : i ≤ j := h
  show c ⟨(i, j), h⟩ = 0
  rcases lt_or_eq_of_le h' with hlt | rfl
  · have h1 := hs i j
    have h2 : UT c j i = 0 := by
      rw [UT_apply, dif_neg (not_le.mpr hlt)]
    rw [h2, add_zero, UT_apply, dif_pos h'] at h1
    exact h1
  · have h1 := hd i
    rw [UT_apply, dif_pos le_rfl] at h1
    exact h1

/-- Entry `(i, j)` of `∑_{a,b} Q_{ab} (e_a X_bᵀ + e_b X_aᵀ)`. -/
theorem contr_entry (Q : Matrix (Fin 4) (Fin 4) F) (X : Fin 4 → Fin 4 → F) (i j : Fin 4) :
    (∑ a, ∑ b, Q a b • (outer (basisVec a) (X b) + outer (basisVec b) (X a))) i j =
      ∑ b, (Q i b + Q b i) * X b j := by
  simp only [Matrix.sum_apply, Matrix.smul_apply, Matrix.add_apply, outer_apply, smul_eq_mul,
    YangN3Teil2.basisVec, mul_add, Finset.sum_add_distrib, add_mul]
  congr 1
  · rw [Finset.sum_eq_single i]
    · simp
    · intro a _ ha
      simp [ha]
    · simp
  · rw [Finset.sum_comm, Finset.sum_eq_single i]
    · simp
    · intro b _ hb
      simp [hb]
    · simp

variable {D : F → F}

/-- **Satz C, algebraic core** (prose Section 3, Steps 1 to 4, at one point of a field with a
derivation). See the module documentation. -/
theorem satzC_kern (hD : IsDeriv D) (hr : r ≤ 25)
    (hα : ∀ t i j, D (alg.alpha t (unitMatrix i j)) = 0)
    (hβ : ∀ t i j, D (alg.beta t (unitMatrix i j)) = 0)
    (p v : Fin 2 → F) (hpv : p ⬝ᵥ v = 0) (hc : (fun j => D (p j)) ⬝ᵥ v ≠ 0)
    (hb : ∀ t, (∀ z, alg.beta t (outer v z) = 0) →
      ∀ z, alg.beta t (outer (fun j => D (v j)) z) = 0)
    (E : (Fin 4 → F) →ₗ[F] (Fin 4 → F)) (hE : Function.Injective E) (μ : Fin r → F)
    (hS : ∀ t x, alg.beta t (outer v (E x)) = μ t * alg.alpha t (outer x p)) : False := by
  classical
  -- the constant `c = p·Dv = -(Dp·v) ≠ 0`
  have hc' : p ⬝ᵥ (fun j => D (v j)) ≠ 0 := by
    have h0 : D (p ⬝ᵥ v) = 0 := by rw [hpv, hD.map_zero]
    rw [hD.map_dotProduct] at h0
    intro h
    apply hc
    linear_combination h0 - h
  have hcrel : (fun j => D (p j)) ⬝ᵥ v = -(p ⬝ᵥ (fun j => D (v j))) := by
    have h0 : D (p ⬝ᵥ v) = 0 := by rw [hpv, hD.map_zero]
    rw [hD.map_dotProduct] at h0
    linear_combination h0
  set Dp : Fin 2 → F := fun j => D (p j) with hDp
  set Dv : Fin 2 → F := fun j => D (v j) with hDv
  -- notation: `a_t = (α_t(e_a pᵀ))_a`, columns of `E` and their derivatives
  set av : Fin r → Fin 4 → F := fun t a => alg.alpha t (outer (basisVec a) p) with hav
  set Ec : Fin 4 → Fin 4 → F := fun b => E (basisVec b) with hEc
  set Ec' : Fin 4 → Fin 4 → F := fun b k => D (E (basisVec b) k) with hEc'
  -- (S') : the derivative of (S) at `x = e_b`
  have hS' : ∀ t b, alg.beta t (outer Dv (Ec b)) + alg.beta t (outer v (Ec' b)) =
      μ t * alg.alpha t (outer (basisVec b) Dp) + D (μ t) * av t b := by
    intro t b
    have h := congrArg D (hS t (basisVec b))
    rw [hD.form_outer _ (hβ t), hD.mul, hD.form_outer _ (hα t), hD.basisVec,
      outer_zero_left, map_zero, zero_add] at h
    exact h
  -- terms with `μ_t = 0`
  have hzero : ∀ t, μ t = 0 → (∀ z, alg.beta t (outer Dv z) = 0) ∧ ∀ b, D (μ t) * av t b = 0 := by
    intro t ht
    have hsurj : Function.Surjective E := LinearMap.injective_iff_surjective.mp hE
    have hv0 : ∀ z, alg.beta t (outer v z) = 0 := by
      intro z
      obtain ⟨x, rfl⟩ := hsurj z
      rw [hS, ht, zero_mul]
    have hDv0 := hb t hv0
    refine ⟨hDv0, fun b => ?_⟩
    have h := hS' t b
    rw [hDv0, hv0, zero_add,
      show μ t * alg.alpha t (outer (basisVec b) Dp) = 0 by rw [ht, zero_mul], zero_add] at h
    exact h.symm
  -- (Kl) for `u = e_a`, `x = e_b`
  have hKl : ∀ a b, ∑ t, (D (μ t) * (av t a * av t b)) • alg.coeff t =
      (p ⬝ᵥ Dv) • (outer (basisVec a) (Ec b) + outer (basisVec b) (Ec a)) := by
    intro a b
    have key : ∀ t, D (μ t) * (av t a * av t b) =
        alg.alpha t (outer (basisVec a) p) * alg.beta t (outer Dv (Ec b)) +
          alg.alpha t (outer (basisVec a) p) * alg.beta t (outer v (Ec' b)) -
          alg.alpha t (outer (basisVec b) Dp) * alg.beta t (outer v (Ec a)) := by
      intro t
      have h1 := hS' t b
      have h2 := hS t (basisVec a)
      simp only [hav] at h1 ⊢
      linear_combination (-alg.alpha t (outer (basisVec a) p)) * h1 +
        alg.alpha t (outer (basisVec b) Dp) * h2
    simp_rw [key, sub_smul, add_smul, Finset.sum_sub_distrib, Finset.sum_add_distrib]
    rw [identD, identD, identD, hpv, hcrel, zero_smul, add_zero, neg_smul, sub_neg_eq_add,
      smul_add]
  -- the quadric: the map `c ↦ (μ_t q(a_t))_t` lands in `ker W`
  let ev : (UTIdx → F) →ₗ[F] (Fin r → F) :=
    { toFun := fun c t => μ t * qf (UT c) (av t)
      map_add' := fun c c' => by
        funext t
        simp only [map_add, Pi.add_apply, qf, Matrix.add_apply, add_mul, Finset.sum_add_distrib,
          mul_add]
      map_smul' := fun a c => by
        funext t
        simp only [map_smul, Pi.smul_apply, qf, Matrix.smul_apply, smul_eq_mul,
          RingHom.id_apply, Finset.mul_sum]
        refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
        ring }
  have hev : LinearMap.range ev ≤ LinearMap.ker (W (d := 3) alg) := by
    rintro _ ⟨c, rfl⟩
    rw [LinearMap.mem_ker]
    show ∑ t, (μ t * qf (UT c) (av t)) • alg.coeff t = 0
    have h1 : ∀ t, μ t * qf (UT c) (av t) =
        ∑ a, ∑ b, UT c a b * (alg.alpha t (outer (basisVec a) p) *
          alg.beta t (outer v (Ec b))) := by
      intro t
      simp only [qf, Finset.mul_sum, hEc, hS, hav]
      refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
      ring
    simp_rw [h1, Finset.sum_smul]
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun a _ => ?_
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun b _ => ?_
    simp_rw [← smul_smul (UT c a b)]
    rw [← Finset.smul_sum, identD, hpv, zero_smul, smul_zero]
  have hdimW : finrank F (LinearMap.ker (W (d := 3) alg)) + 16 = r := G3 (d := 3) (m := 4) alg
  have hrange : finrank F (LinearMap.range ev) ≤ 9 := by
    have := Submodule.finrank_mono hev
    omega
  have hker : LinearMap.ker ev ≠ ⊥ := by
    intro h
    have h1 := LinearMap.finrank_range_add_finrank_ker ev
    rw [h, finrank_bot, Module.finrank_fintype_fun_eq_card, card_UTIdx] at h1
    omega
  obtain ⟨c, hcker, hc0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hker
  rw [LinearMap.mem_ker] at hcker
  set Q := UT c with hQ
  have hq0 : ∀ t, μ t * qf Q (av t) = 0 := fun t => congrFun hcker t
  -- every term of the contracted (Kl) vanishes
  have hDq : ∀ t, D (μ t) * qf Q (av t) = 0 := by
    intro t
    by_cases ht : μ t = 0
    · have h := (hzero t ht).2
      simp only [qf, Finset.mul_sum]
      refine Finset.sum_eq_zero fun a _ => Finset.sum_eq_zero fun b _ => ?_
      have : D (μ t) * (Q a b * (av t a * av t b)) = Q a b * ((D (μ t) * av t a) * av t b) := by
        ring
      rw [this, h a, zero_mul, mul_zero]
    · rw [(mul_eq_zero.mp (hq0 t)).resolve_left ht, mul_zero]
  -- contract (Kl) with `Q`: `(Q + Qᵀ) Eᵀ = 0`
  have hsum : ∑ a, ∑ b, Q a b • ∑ t, (D (μ t) * (av t a * av t b)) • alg.coeff t = 0 := by
    have h1 : ∀ t, ∑ a, ∑ b, Q a b • ((D (μ t) * (av t a * av t b)) • alg.coeff t) = 0 := by
      intro t
      simp_rw [smul_smul, ← Finset.sum_smul]
      have e : ∑ a, ∑ b, Q a b * (D (μ t) * (av t a * av t b)) = D (μ t) * qf Q (av t) := by
        simp only [qf, Finset.mul_sum]
        refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
        ring
      rw [e, hDq t, zero_smul]
    calc ∑ a, ∑ b, Q a b • ∑ t, (D (μ t) * (av t a * av t b)) • alg.coeff t
        = ∑ a, ∑ t, ∑ b, Q a b • ((D (μ t) * (av t a * av t b)) • alg.coeff t) := by
          refine Finset.sum_congr rfl fun a _ => ?_
          simp_rw [Finset.smul_sum]
          exact Finset.sum_comm
      _ = ∑ t, ∑ a, ∑ b, Q a b • ((D (μ t) * (av t a * av t b)) • alg.coeff t) :=
          Finset.sum_comm
      _ = 0 := Finset.sum_eq_zero fun t _ => h1 t
  have hcontr : ∑ a, ∑ b, Q a b •
      (outer (basisVec a) (Ec b) + outer (basisVec b) (Ec a)) = 0 := by
    have h : (p ⬝ᵥ Dv) • ∑ a, ∑ b, Q a b •
        (outer (basisVec a) (Ec b) + outer (basisVec b) (Ec a)) = 0 := by
      simp_rw [Finset.smul_sum, smul_comm (p ⬝ᵥ Dv) (Q _ _), ← hKl]
      exact hsum
    exact (smul_eq_zero.mp h).resolve_left hc'
  have hEsum : ∀ y : Fin 4 → F, E y = ∑ b, y b • Ec b := by
    intro y
    rw [LinearMap.pi_apply_eq_sum_univ E y]
    rfl
  have hsym : ∀ i b, Q i b + Q b i = 0 := by
    intro i
    have hrow : E (fun b => Q i b + Q b i) = 0 := by
      rw [hEsum]
      funext j
      simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply]
      rw [← contr_entry, hcontr]
      rfl
    have h0 : (fun b => Q i b + Q b i) = 0 := hE (by rw [hrow, map_zero])
    intro b
    exact congrFun h0 b
  -- the `a_t` with `μ_t ≠ 0` span `F⁴`
  have hzeroDv : ∀ t z, μ t = 0 → alg.beta t (outer Dv z) = 0 := fun t z ht => (hzero t ht).1 z
  let Vs : Submodule F (Fin 4 → F) := Submodule.span F {x | ∃ t, μ t ≠ 0 ∧ av t = x}
  have hV : Vs = ⊤ := by
    refine (eq_top_or_lt_top Vs).resolve_right fun hlt => ?_
    obtain ⟨f, hf0, hle⟩ := Submodule.exists_le_ker_of_lt_top Vs hlt
    set l : Fin 4 → F := fun i => f (basisVec i) with hl
    have hfl : ∀ x, f x = ∑ i, x i * l i := by
      intro x
      rw [LinearMap.pi_apply_eq_sum_univ f x]
      rfl
    have hal : ∀ t, μ t ≠ 0 → alg.alpha t (outer l p) = 0 := by
      intro t ht
      have hmem : av t ∈ Vs := Submodule.subset_span ⟨t, ht, rfl⟩
      have h := hle hmem
      rw [LinearMap.mem_ker, hfl] at h
      rw [linearForm_outer_eq_sum' (alg.alpha t) l p, ← h]
      refine Finset.sum_congr rfl fun i _ => ?_
      simp only [hav]
      ring
    have hlz : ∀ z : Fin 4 → F, outer l z = 0 := by
      intro z
      have h := identD alg l p Dv z
      rw [Finset.sum_eq_zero] at h
      · exact (smul_eq_zero.mp h.symm).resolve_left hc'
      · intro t _
        by_cases ht : μ t = 0
        · rw [hzeroDv t z ht, mul_zero, zero_smul]
        · rw [hal t ht, zero_mul, zero_smul]
    have hl0 : l = 0 := funext fun i => by
      have h := congrFun (congrFun (hlz (fun _ => 1)) i) 0
      simpa using h
    apply hf0
    refine LinearMap.ext fun x => ?_
    rw [hfl, hl0]
    simp
  -- `q` is additive, vanishes on the `a_t` with `μ_t ≠ 0`, hence everywhere
  have hqV : ∀ x ∈ Vs, qf Q x = 0 := by
    intro x hx
    induction hx using Submodule.span_induction with
    | mem x hx =>
      obtain ⟨t, ht, rfl⟩ := hx
      exact (mul_eq_zero.mp (hq0 t)).resolve_left ht
    | zero => simp [qf]
    | add x y _ _ hx hy =>
      rw [qf_add, hx, hy]
      simp [hsym]
    | smul a x _ hx => rw [qf_smul, hx, mul_zero]
  have hd : ∀ i, Q i i = 0 := by
    intro i
    rw [← qf_basisVec Q i]
    apply hqV
    rw [hV]
    exact Submodule.mem_top
  exact hc0 (UT_eq_zero c hsym hd)

end Core

end SatzC444
end YangBounds
