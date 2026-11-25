import YangBounds.SatzC444Kern
import Mathlib.Algebra.DualNumber
import Mathlib.RingTheory.Localization.FractionRing

/-!
# Satz C and Folgerung C1 (repaired, generic) for `⟨4,2,4⟩` at the generic point

Task S2-26 (stage 2, round 7, track A, role: formaliser). Status of every statement in this
file: `behauptet`. Nothing here is `geprüft` before the check of protocol section 5.1.

Sources: prose `lean/prosa/s2_444_spurA_r4.md` (task S2-16), Sections 3 and 4; review
`lean/prosa/s2_444_spurA_r4_pruefung.md` (task S2-22), repair R-C1 and Section 4 (route via the
function field and a derivation).

## The generic normal form

For a decomposition `alg` of `⟨4,2,4⟩` over a field `K` let `GField K` be the field of rational
functions over `K` in the 20 entries of a `4 × 4` matrix `S` and a `2 × 2` matrix `T` (the
variables `Var 3` of `YangN4Haupt`, the same variables as in the proof of Lemma 6), and let
`Sg K`, `Tg K` be these generic matrices. The **generic normal form** is

  `genAlg K alg := changeBasis (alg.baseChange (GField K)) (Sg K) (Tg K) _ _`,

the change of basis R3 of Lemma 6 at the generic point. In the prose notation its point
`p = e_0` is the generic point `p = (T₀₀, T₀₁)` (the row `0` of `T`) and its `u_0` is the
generic column `0` of `S`. Every statement “for `p` (and `u_0`) in a nonempty Zariski open set”
about the normal form corresponds to the statement at this generic point.

## Main results

* `genSN1`, `genSN2`: if no `α_t` is the zero form, the generic normal form satisfies (N1) and
  (N2) (Lemma 6 at the generic point).
* `satzC_generisch` (**Satz C at the generic point**): for every field `K` and every
  decomposition of length `r ≤ 25`, the generic normal form is not symmetric:
  `¬ SatzB444.IsSymm (genAlg K alg)`. (`IsSymm` is the predicate of `SatzB444.lean`, with
  `μ_t = 0` allowed.)
* `folgerungC1_generisch` (**Folgerung C1, repaired as R-C1**): for every decomposition of
  length 25 over any field, the generic normal form satisfies (N1), (N2), lies in the case
  `(rk L, rk H) = (5, 8)` and is not symmetric. This is the composition of Satz C with
  `satzB_unbedingt` and `satzB_symm_unbedingt`.

## Deviations from the prose (documented)

1. The prose defines “symmetric” by a nonempty open set of points `p` (with invertible `M_p`).
   Here symmetric means `IsSymm` **at the generic point** (the matrix `e` and the `μ_t` are
   rational functions). The prose Step 0 (rational choice of `M_p` from a symmetry on an open
   set) is not formalised; it is not needed for R-C1, because Satz B, applied over the field
   `GField K`, gives the symmetry directly at the generic point.
2. The derivation used is `∂/∂T₀₁` on `GField K`, constructed from a ring homomorphism into the
   dual numbers (`IsLocalization.lift`), not the dual numbers `K[ε]/(ε²)` of the prose.
3. (N2) at the generic point is proved with minors: for every support of `β(w)` an invertible
   `4 × 4` minor at some point gives a nonzero polynomial with coefficients in `K`, which does
   not vanish at the generic point.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzC444

open Module YangN4Haupt MvPolynomial Matrix
open YangN3Teil2 (outer outer_apply basisVec changeBasis changeBasis_alpha_apply
  changeBasis_beta_apply mul_unitMatrix_mul sum_smul_outer outer_basisVec
  linearForm_eq_zero_of_unitMatrix exists_vecMul_ne_zero removeZeroAlpha)

universe u

/-! ## Linear algebra: an injective matrix has an invertible square row-submatrix -/

theorem exists_submatrix_det_ne_zero {L : Type u} [Field L] {r n : ℕ}
    (N : Matrix (Fin r) (Fin n) L) (hN : ∀ a, N *ᵥ a = 0 → a = 0) :
    ∃ f : Fin n → Fin r, (N.submatrix f id).det ≠ 0 := by
  classical
  -- the rows span `L^n`
  have hspan : Submodule.span L (Set.range N) = ⊤ := by
    by_contra hne
    obtain ⟨g, hg0, hle⟩ := Submodule.exists_le_ker_of_lt_top _ (lt_top_iff_ne_top.mpr hne)
    apply hg0
    have hx : N *ᵥ (fun i => g (basisVec i)) = 0 := by
      funext k
      have h := hle (Submodule.subset_span ⟨k, rfl⟩)
      rw [LinearMap.mem_ker, LinearMap.pi_apply_eq_sum_univ g] at h
      simp only [Matrix.mulVec, dotProduct, Pi.zero_apply]
      rw [← h]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [smul_eq_mul]
      rfl
    have h0 := hN _ hx
    refine LinearMap.ext fun y => ?_
    rw [LinearMap.pi_apply_eq_sum_univ g y, LinearMap.zero_apply]
    refine Finset.sum_eq_zero fun i _ => ?_
    have := congrFun h0 i
    simp only [Pi.zero_apply] at this
    rw [show (fun j => if i = j then (1 : L) else 0) = basisVec i from rfl, this, smul_zero]
  obtain ⟨b, hbsub, hbspan, hbli⟩ := exists_linearIndependent L (Set.range N)
  have hbfin : b.Finite := (Set.finite_range N).subset hbsub
  haveI : Fintype b := hbfin.fintype
  have hcard : Fintype.card b = n := by
    have h1 := finrank_span_eq_card hbli
    rw [Subtype.range_coe, hbspan, hspan, finrank_top, Module.finrank_fin_fun] at h1
    exact h1.symm
  let e : Fin n ≃ b := (Fintype.equivFinOfCardEq hcard).symm
  have hmem : ∀ i, ∃ k, N k = (e i : Fin n → L) := fun i => hbsub (e i).2
  choose f hf using hmem
  refine ⟨f, ?_⟩
  have hli' : LinearIndependent L (fun i => N (f i)) := by
    have : (fun i => N (f i)) = (Subtype.val : b → Fin n → L) ∘ e := by
      funext i
      exact hf i
    rw [this]
    exact hbli.comp e e.injective
  have hu : IsUnit (N.submatrix f id) := by
    rw [← Matrix.linearIndependent_rows_iff_isUnit]
    exact hli'
  exact ((Matrix.isUnit_iff_isUnit_det _).mp hu).ne_zero

/-! ## The function field of the generic point -/

section Generic

variable (K : Type u) [Field K]

/-- Polynomials over `K` in the entries of `S` and `T`. -/
abbrev GPoly := MvPolynomial (Var 3) K

/-- The field of rational functions in the entries of `S` and `T`. -/
abbrev GField := FractionRing (GPoly K)

/-- The generic point: every variable as an element of `GField K`. -/
noncomputable def xg : Var 3 → GField K := fun w => algebraMap (GPoly K) (GField K) (X w)

/-- Evaluation of polynomials over `K` at a point of `GField K`. -/
noncomputable def evL (x : Var 3 → GField K) : GPoly K →+* GField K :=
  eval₂Hom (algebraMap K (GField K)) x

theorem algebraMap_C (c : K) :
    algebraMap (GPoly K) (GField K) (C c) = algebraMap K (GField K) c := by
  rw [IsScalarTower.algebraMap_apply K (GPoly K) (GField K), MvPolynomial.algebraMap_eq]

theorem evL_xg : evL K (xg K) = algebraMap (GPoly K) (GField K) := by
  apply MvPolynomial.ringHom_ext
  · intro c
    simp only [evL, coe_eval₂Hom, eval₂_C, algebraMap_C]
  · intro w
    simp only [evL, coe_eval₂Hom, eval₂_X, xg]

theorem poly_eq_zero_of_algebraMap {P : GPoly K}
    (h : algebraMap (GPoly K) (GField K) P = 0) : P = 0 :=
  IsFractionRing.injective (GPoly K) (GField K) (by rw [h, map_zero])

theorem algebraMap_ne_zero_of_eval {P : GPoly K} (pt : Var 3 → K) (h : eval pt P ≠ 0) :
    algebraMap (GPoly K) (GField K) P ≠ 0 := by
  intro h0
  apply h
  rw [poly_eq_zero_of_algebraMap K h0, map_zero]

theorem xg_ne_zero (w : Var 3) : xg K w ≠ 0 :=
  algebraMap_ne_zero_of_eval K (fun _ => 1) (by simp)

/-- `∑_{i,j} φ(e_{ij}) U_i W_j` as a polynomial. -/
noncomputable def polyForm {a b : ℕ} (φ : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (U : Fin a → GPoly K) (W : Fin b → GPoly K) : GPoly K :=
  ∑ i, ∑ j, C (φ (unitMatrix i j)) * (U i * W j)

theorem evL_polyForm (x : Var 3 → GField K) {a b : ℕ} (φ : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (U : Fin a → GPoly K) (W : Fin b → GPoly K) :
    evL K x (polyForm K φ U W) =
      extendForm (L := GField K) φ (outer (fun i => evL K x (U i)) (fun j => evL K x (W j))) := by
  rw [extendForm_apply]
  simp only [polyForm, map_sum, map_mul, outer_apply]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  simp [evL]

theorem eval_polyForm (pt : Var 3 → K) {a b : ℕ} (φ : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (U : Fin a → GPoly K) (W : Fin b → GPoly K) :
    eval pt (polyForm K φ U W) = φ (outer (fun i => eval pt (U i)) (fun j => eval pt (W j))) := by
  rw [form_outer]
  simp only [polyForm, map_sum, map_mul, eval_C]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-! ### The generic matrices -/

/-- The generic `4 × 4` matrix `S`. -/
noncomputable def Sg : Matrix (Fin 4) (Fin 4) (GField K) := matS (d := 3) (xg K)

/-- The generic `2 × 2` matrix `T`. -/
noncomputable def Tg : Matrix (Fin 2) (Fin 2) (GField K) := matT (d := 3) (xg K)

theorem det_Sg_ne_zero : (Sg K).det ≠ 0 := by
  classical
  have h : Sg K = (algebraMap (GPoly K) (GField K)).mapMatrix
      (matS (d := 3) (fun w => (X w : GPoly K))) := by
    ext i j; rfl
  rw [h, ← RingHom.map_det]
  apply algebraMap_ne_zero_of_eval K
    (Sum.elim (fun ab => (1 : Matrix (Fin 4) (Fin 4) K) ab.1 ab.2) 0)
  rw [RingHom.map_det]
  have h1 : (eval (Sum.elim (fun ab => (1 : Matrix (Fin 4) (Fin 4) K) ab.1 ab.2)
      0)).mapMatrix (matS (d := 3) (fun w => (X w : GPoly K))) = 1 := by
    ext i j
    simp [matS]
  rw [h1, Matrix.det_one]
  exact one_ne_zero

theorem det_Tg_ne_zero : (Tg K).det ≠ 0 := by
  classical
  have h : Tg K = (algebraMap (GPoly K) (GField K)).mapMatrix
      (matT (d := 3) (fun w => (X w : GPoly K))) := by
    ext i j; rfl
  rw [h, ← RingHom.map_det]
  apply algebraMap_ne_zero_of_eval K
    (Sum.elim 0 (fun ab => (1 : Matrix (Fin 2) (Fin 2) K) ab.1 ab.2))
  rw [RingHom.map_det]
  have h1 : (eval (Sum.elim 0
      (fun ab => (1 : Matrix (Fin 2) (Fin 2) K) ab.1 ab.2))).mapMatrix
        (matT (d := 3) (fun w => (X w : GPoly K))) = 1 := by
    ext i j
    simp [matT]
  rw [h1, Matrix.det_one]
  exact one_ne_zero

theorem isUnit_det_Sg : IsUnit (Sg K).det := isUnit_iff_ne_zero.mpr (det_Sg_ne_zero K)

theorem isUnit_det_Tg : IsUnit (Tg K).det := isUnit_iff_ne_zero.mpr (det_Tg_ne_zero K)

/-- The generic point `p = (T₀₀, T₀₁)` (row `0` of `T`). -/
noncomputable def prow : Fin 2 → GField K := fun j => xg K (Sum.inr (0, j))

/-- The point `v = T⁻¹ e_1` (it satisfies `p·v = 0`). -/
noncomputable def vT : Fin 2 → GField K := fun i => (Tg K)⁻¹ i 1

theorem Tg_inv_apply (i j : Fin 2) :
    (Tg K)⁻¹ i j = ((Tg K).det)⁻¹ * (Matrix.adjugate (Tg K)) i j := by
  rw [Matrix.inv_def, Matrix.smul_apply, smul_eq_mul, Ring.inverse_eq_inv']

theorem vT_zero : vT K 0 = ((Tg K).det)⁻¹ * -(xg K (Sum.inr (0, 1))) := by
  rw [vT, Tg_inv_apply, Matrix.adjugate_fin_two]
  simp [Tg, matT]

theorem vT_one : vT K 1 = ((Tg K).det)⁻¹ * xg K (Sum.inr (0, 0)) := by
  rw [vT, Tg_inv_apply, Matrix.adjugate_fin_two]
  simp [Tg, matT]

theorem prow_dot_vT : prow K ⬝ᵥ vT K = 0 := by
  have h := congrFun (congrFun (Matrix.mul_nonsing_inv (Tg K) (isUnit_det_Tg K)) 0) 1
  rw [Matrix.mul_apply, Matrix.one_apply_ne (by decide)] at h
  exact h

/-! ### The generic normal form -/

variable {K}

/-- **The generic normal form** of `alg`: the change of basis R3 of Lemma 6 with the generic
matrices `S`, `T`, after extending the field to `GField K`. -/
noncomputable def genAlg {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r) :
    BilinearAlgorithm (GField K) 4 2 4 r :=
  changeBasis (alg.baseChange (GField K)) (Sg K) (Tg K) (isUnit_det_Sg K) (isUnit_det_Tg K)

variable {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

theorem baseChange_alpha (t : Fin r) :
    (alg.baseChange (GField K)).alpha t = extendForm (alg.alpha t) := rfl

theorem baseChange_beta (t : Fin r) :
    (alg.baseChange (GField K)).beta t = extendForm (alg.beta t) := rfl

theorem unitMatrix_map {a b : ℕ} (i : Fin a) (j : Fin b) :
    (unitMatrix i j : Matrix (Fin a) (Fin b) K).map (algebraMap K (GField K)) = unitMatrix i j := by
  ext x y
  simp only [Matrix.map_apply, unitMatrix, Matrix.of_apply]
  split_ifs <;> simp

theorem baseChange_alpha_unit (t : Fin r) (i : Fin 4) (j : Fin 2) :
    (alg.baseChange (GField K)).alpha t (unitMatrix i j) =
      algebraMap K (GField K) (alg.alpha t (unitMatrix i j)) := by
  rw [← unitMatrix_map, BilinearAlgorithm.baseChange_alpha_map]

theorem baseChange_beta_unit (t : Fin r) (i : Fin 2) (j : Fin 4) :
    (alg.baseChange (GField K)).beta t (unitMatrix i j) =
      algebraMap K (GField K) (alg.beta t (unitMatrix i j)) := by
  rw [← unitMatrix_map, BilinearAlgorithm.baseChange_beta_map]

/-- `∑_i x_i (a_t)_i` of the generic normal form is `α_t((S x) pᵀ)`. -/
theorem genAlg_avecs (t : Fin r) (x : Fin 4 → GField K) :
    ∑ i, x i * SatzB444.avecs (genAlg alg) t i =
      (alg.baseChange (GField K)).alpha t (outer (Sg K *ᵥ x) (prow K)) := by
  rw [← sum_smul_outer, map_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_smul, smul_eq_mul]
  simp only [SatzB444.avecs, genAlg, changeBasis_alpha_apply, mul_unitMatrix_mul]
  rfl

/-- `β_t(emb z)` of the generic normal form is `β_t(v zᵀ)` with `v = T⁻¹ e_1`. -/
theorem genAlg_beta_emb (t : Fin r) (z : Fin 4 → GField K) :
    (genAlg alg).beta t (emb z) = (alg.baseChange (GField K)).beta t (outer (vT K) z) := by
  simp only [genAlg, changeBasis_beta_apply]
  congr 1
  ext i k
  simp [Matrix.mul_apply, Fin.sum_univ_two, emb_apply_zero, emb_apply_one, vT]

/-! ### (N1) and (N2) at the generic point -/

/-- **(N1) at the generic point.** -/
theorem genSN1 (hα : ∀ t, alg.alpha t ≠ 0) : SN1 (d := 3) (genAlg alg) := by
  intro k
  show (genAlg alg).alpha k (unitMatrix 0 0) ≠ 0
  rw [genAlg, changeBasis_alpha_apply, mul_unitMatrix_mul]
  obtain ⟨i0, j0, hij⟩ : ∃ i j, alg.alpha k (unitMatrix i j) ≠ 0 := by
    by_contra h
    push_neg at h
    exact hα k (linearForm_eq_zero_of_unitMatrix _ h)
  have e : (alg.baseChange (GField K)).alpha k (outer (fun x => Sg K x 0) (fun y => Tg K 0 y)) =
      algebraMap (GPoly K) (GField K) (polyForm K (alg.alpha k)
        (fun i => X (Sum.inl (i, 0))) (fun j => X (Sum.inr (0, j)))) := by
    rw [← evL_xg, evL_polyForm, baseChange_alpha]
    congr 2
    all_goals
      funext i
      simp [evL, xg, Sg, Tg, matS, matT]
  rw [e]
  apply algebraMap_ne_zero_of_eval K (Sum.elim (fun ab => basisVec i0 ab.1)
    (fun ab => basisVec j0 ab.2))
  rw [eval_polyForm]
  simp only [eval_X, Sum.elim_inl, Sum.elim_inr]
  rw [outer_basisVec]
  exact hij

/-- At the generic point `p`, the map `a ↦ (α_t(a pᵀ) β_t(w))_t` is injective for every
`w ≠ 0`. -/
theorem genInj (w : Matrix (Fin 2) (Fin 4) (GField K)) (hw : w ≠ 0) :
    Function.Injective (lmap (d := 3) (alg.baseChange (GField K)) (prow K) w) := by
  classical
  set algL := alg.baseChange (GField K) with halgL
  obtain ⟨p0, hp0⟩ := exists_vecMul_ne_zero hw
  have hinj0 := lmap_injective (d := 3) algL hp0
  let N : (Fin 2 → GField K) → Matrix (Fin r) (Fin 4) (GField K) := fun p k a =>
    if algL.beta k w ≠ 0 then algL.alpha k (outer (basisVec a) p) else 0
  have hNa : ∀ p a k, (N p *ᵥ a) k =
      if algL.beta k w ≠ 0 then algL.alpha k (outer a p) else 0 := by
    intro p a k
    simp only [Matrix.mulVec, dotProduct, N]
    split_ifs with h
    · rw [linearForm_outer_eq_sum' (algL.alpha k) a p]
      refine Finset.sum_congr rfl fun i _ => ?_
      ring
    · simp
  have hN : ∀ p a, lmap (d := 3) algL p w a = 0 ↔ N p *ᵥ a = 0 := by
    intro p a
    constructor
    · intro h
      funext k
      have hk := congrFun h k
      rw [lmap_apply, Pi.zero_apply] at hk
      rw [hNa, Pi.zero_apply]
      split_ifs with hb
      · exact (mul_eq_zero.mp hk).resolve_right hb
      · rfl
    · intro h
      funext k
      have hk := congrFun h k
      rw [hNa, Pi.zero_apply] at hk
      rw [lmap_apply, Pi.zero_apply]
      by_cases hb : algL.beta k w = 0
      · rw [hb, mul_zero]
      · rw [if_pos hb] at hk
        rw [hk, zero_mul]
  have hinjN0 : ∀ a, N p0 *ᵥ a = 0 → a = 0 := by
    intro a ha
    apply hinj0
    rw [(hN p0 a).mpr ha, map_zero]
  obtain ⟨f, hf⟩ := exists_submatrix_det_ne_zero (N p0) hinjN0
  -- the minor as a polynomial with coefficients in `K`
  let Npoly : Matrix (Fin 4) (Fin 4) (GPoly K) := fun i a =>
    if algL.beta (f i) w ≠ 0 then
      polyForm K (alg.alpha (f i)) (fun i' => if a = i' then 1 else 0)
        (fun j => X (Sum.inr (0, j)))
    else 0
  have hev : ∀ x : Var 3 → GField K, (evL K x).mapMatrix Npoly =
      (N (fun j => x (Sum.inr (0, j)))).submatrix f id := by
    intro x
    ext i a
    simp only [RingHom.mapMatrix_apply, Matrix.map_apply, Matrix.submatrix_apply, id, Npoly, N]
    split_ifs with hb
    · rw [evL_polyForm, halgL, baseChange_alpha]
      have hU : (fun i' => evL K x (if a = i' then 1 else 0)) = basisVec a := by
        funext i'
        simp only [YangN3Teil2.basisVec]
        split_ifs <;> simp
      have hW : (fun j => evL K x (X (Sum.inr (0, j)))) = fun j => x (Sum.inr (0, j)) := by
        funext j
        simp [evL]
      rw [hU, hW]
    · exact map_zero _
  let x0 : Var 3 → GField K := Sum.elim 0 (fun ab => p0 ab.2)
  have hP0 : evL K x0 Npoly.det ≠ 0 := by
    rw [RingHom.map_det, hev]
    exact hf
  have hPne : Npoly.det ≠ 0 := fun h => hP0 (by rw [h, map_zero])
  have hgen : ((N (prow K)).submatrix f id).det ≠ 0 := by
    have h := hev (xg K)
    rw [show (fun j => xg K (Sum.inr (0, j))) = prow K from rfl] at h
    rw [← h, ← RingHom.map_det, evL_xg]
    intro h0
    exact hPne (poly_eq_zero_of_algebraMap K h0)
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro a ha
  have hNa0 : N (prow K) *ᵥ a = 0 := (hN _ a).mp ha
  have hsub : (N (prow K)).submatrix f id *ᵥ a = 0 := by
    funext i
    have := congrFun hNa0 (f i)
    simp only [Matrix.mulVec, dotProduct, Matrix.submatrix_apply, id, Pi.zero_apply] at this ⊢
    exact this
  exact Matrix.eq_zero_of_mulVec_eq_zero hgen hsub

/-- **(N2) at the generic point.** -/
theorem genSN2 : SN2 (d := 3) (genAlg alg) := by
  intro v hv
  rw [Fintype.linearIndependent_iff]
  intro g hg
  have hT := isUnit_det_Tg K
  have hS := isUnit_det_Sg K
  have hw : (Tg K)⁻¹ * v ≠ 0 := by
    intro h0
    apply hv
    rw [← Matrix.one_mul v, ← Matrix.mul_nonsing_inv (Tg K) hT, Matrix.mul_assoc, h0,
      Matrix.mul_zero]
  have hinj := genInj alg _ hw
  have hL : lmap (d := 3) (alg.baseChange (GField K)) (prow K) ((Tg K)⁻¹ * v) (Sg K *ᵥ g) = 0 := by
    funext k
    have hk := congrFun hg k
    simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply, fv_apply_apply,
      genAlg, changeBasis_alpha_apply, changeBasis_beta_apply, mul_unitMatrix_mul] at hk
    rw [Pi.zero_apply, ← hk, lmap_apply, ← sum_smul_outer, map_sum, Finset.sum_mul]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [map_smul, smul_eq_mul, mul_assoc]
    rfl
  have hSg : Sg K *ᵥ g = 0 := hinj (hL.trans (map_zero _).symm)
  have hg0 : g = 0 := by
    have := congrArg (fun y => (Sg K)⁻¹ *ᵥ y) hSg
    simpa [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul _ hS] using this
  intro i
  simp [hg0]

end Generic

/-! ## The derivation `∂/∂T₀₁` on `GField K` -/

section Derivation

variable (K : Type u) [Field K] (w0 : Var 3)

/-- `f ↦ f + ε ∂f/∂X_{w0}` on polynomials, with values in the dual numbers over `GField K`. -/
noncomputable def φ0 : GPoly K →+* DualNumber (GField K) :=
  eval₂Hom ((TrivSqZeroExt.inlHom (GField K) (GField K)).comp (algebraMap K (GField K)))
    (fun w => TrivSqZeroExt.inl (xg K w) + if w = w0 then TrivSqZeroExt.inr 1 else 0)

theorem fst_φ0 (f : GPoly K) : (φ0 K w0 f).fst = algebraMap (GPoly K) (GField K) f := by
  induction f using MvPolynomial.induction_on with
  | C c =>
    simp [φ0, algebraMap_C]
  | add p q hp hq =>
    rw [RingHom.map_add, TrivSqZeroExt.fst_add, hp, hq, RingHom.map_add]
  | mul_X p w hp =>
    rw [RingHom.map_mul, TrivSqZeroExt.fst_mul, hp, RingHom.map_mul]
    congr 1
    simp only [φ0, coe_eval₂Hom, eval₂_X, TrivSqZeroExt.fst_add, TrivSqZeroExt.fst_inl, xg]
    split_ifs <;> simp

theorem φ0_units (y : nonZeroDivisors (GPoly K)) : IsUnit (φ0 K w0 y) := by
  rw [TrivSqZeroExt.isUnit_iff_isUnit_fst, fst_φ0, isUnit_iff_ne_zero]
  exact IsFractionRing.to_map_ne_zero_of_mem_nonZeroDivisors y.2

/-- `φ0` extended to the fraction field. -/
noncomputable def ψ : GField K →+* DualNumber (GField K) :=
  IsLocalization.lift (M := nonZeroDivisors (GPoly K)) (φ0_units K w0)

theorem ψ_algebraMap (f : GPoly K) : ψ K w0 (algebraMap (GPoly K) (GField K) f) = φ0 K w0 f :=
  IsLocalization.lift_eq _ f

theorem fst_ψ (z : GField K) : (ψ K w0 z).fst = z := by
  have h : ((TrivSqZeroExt.fstHom (GField K) (GField K) (GField K)).toRingHom.comp (ψ K w0)) =
      RingHom.id (GField K) := by
    apply IsLocalization.ringHom_ext (nonZeroDivisors (GPoly K))
    refine RingHom.ext fun f => ?_
    show (ψ K w0 (algebraMap (GPoly K) (GField K) f)).fst = algebraMap (GPoly K) (GField K) f
    rw [ψ_algebraMap, fst_φ0]
  exact congrArg (fun F : GField K →+* GField K => F z) h

/-- The derivation `∂/∂X_{w0}` on `GField K`. -/
noncomputable def Dg (z : GField K) : GField K := (ψ K w0 z).snd

theorem isDeriv_Dg : IsDeriv (Dg K w0) where
  add a b := by simp only [Dg, RingHom.map_add, TrivSqZeroExt.snd_add]
  mul a b := by
    simp only [Dg, RingHom.map_mul, TrivSqZeroExt.snd_mul, fst_ψ, smul_eq_mul, op_smul_eq_mul]

theorem Dg_algebraMap (c : K) : Dg K w0 (algebraMap K (GField K) c) = 0 := by
  rw [← algebraMap_C, Dg, ψ_algebraMap]
  simp [φ0]

theorem Dg_xg (w : Var 3) : Dg K w0 (xg K w) = if w = w0 then 1 else 0 := by
  rw [xg, Dg, ψ_algebraMap]
  simp only [φ0, coe_eval₂Hom, eval₂_X, TrivSqZeroExt.snd_add, TrivSqZeroExt.snd_inl, zero_add]
  split_ifs <;> simp

end Derivation

/-! ## Satz C and Folgerung C1 at the generic point -/

section Main

variable {K : Type u} [Field K]

/-- If `β_t(v zᵀ) = 0` for all `z` at `v = T⁻¹ e_1`, then `β_t = 0`. -/
theorem beta_eq_zero_of_vT {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r) (t : Fin r)
    (h : ∀ z, (alg.baseChange (GField K)).beta t (outer (vT K) z) = 0) : alg.beta t = 0 := by
  apply linearForm_eq_zero_of_unitMatrix
  have hk : ∀ k : Fin 4, alg.beta t (unitMatrix 0 k) = 0 ∧ alg.beta t (unitMatrix 1 k) = 0 := by
    intro k
    have hm : outer (vT K) (basisVec k) =
        vT K 0 • (unitMatrix 0 k : Matrix (Fin 2) (Fin 4) (GField K)) +
          vT K 1 • (unitMatrix 1 k : Matrix (Fin 2) (Fin 4) (GField K)) := by
      ext i l
      by_cases hkl : k = l
      · subst hkl
        fin_cases i <;> simp [outer_apply, unitMatrix, basisVec]
      · fin_cases i <;> simp [outer_apply, unitMatrix, basisVec, hkl, Ne.symm hkl]
    have hz := h (basisVec k)
    rw [hm, map_add, map_smul, map_smul, baseChange_beta_unit, baseChange_beta_unit,
      smul_eq_mul, smul_eq_mul] at hz
    set c0 := alg.beta t (unitMatrix 0 k)
    set c1 := alg.beta t (unitMatrix 1 k)
    have hv0 := vT_zero K
    have hv1 := vT_one K
    rw [hv0, hv1] at hz
    have hdet := det_Tg_ne_zero K
    have hlin : -(xg K (Sum.inr (0, 1))) * algebraMap K (GField K) c0 +
        xg K (Sum.inr (0, 0)) * algebraMap K (GField K) c1 = 0 := by
      have hz' : ((Tg K).det)⁻¹ * (-(xg K (Sum.inr (0, 1))) * algebraMap K (GField K) c0 +
          xg K (Sum.inr (0, 0)) * algebraMap K (GField K) c1) = 0 := by
        linear_combination hz
      rcases mul_eq_zero.mp hz' with h0 | h0
      · exact absurd h0 (inv_ne_zero hdet)
      · exact h0
    have hpoly : -(X (Sum.inr (0, 1)) : GPoly K) * C c0 + X (Sum.inr (0, 0)) * C c1 = 0 := by
      apply poly_eq_zero_of_algebraMap K
      rw [map_add, map_mul, map_mul, map_neg, algebraMap_C, algebraMap_C]
      exact hlin
    have e1 := congrArg (eval (Sum.elim 0 (fun ab => if ab.2 = 0 then (1 : K) else 0))) hpoly
    have e0 := congrArg (eval (Sum.elim 0 (fun ab => if ab.2 = 1 then (1 : K) else 0))) hpoly
    simp at e0 e1
    exact ⟨e0, e1⟩
  intro i k
  fin_cases i
  · exact (hk k).1
  · exact (hk k).2

/-- **Satz C at the generic point** (B-012, Satz C, in the generic form of the review,
Section 4): over every field `K`, the generic normal form of a decomposition of `⟨4,2,4⟩` of
length `r ≤ 25` is not symmetric. -/
theorem satzC_generisch {r : ℕ} (hr : r ≤ 25) (alg : BilinearAlgorithm K 4 2 4 r) :
    ¬ SatzB444.IsSymm (genAlg alg) := by
  classical
  rintro ⟨e, μ, he⟩
  set w0 : Var 3 := Sum.inr (0, 1) with hw0
  have hD := isDeriv_Dg K w0
  set algL := alg.baseChange (GField K) with halgL
  have hS := isUnit_det_Sg K
  let E : (Fin 4 → GField K) →ₗ[GField K] (Fin 4 → GField K) :=
    e.toLinearMap ∘ₗ Matrix.mulVecLin (Sg K)⁻¹
  refine satzC_kern algL hD hr ?_ ?_ (prow K) (vT K) (prow_dot_vT K) ?_ ?_ E ?_ μ ?_
  · intro t i j
    rw [baseChange_alpha_unit, Dg_algebraMap]
  · intro t i j
    rw [baseChange_beta_unit, Dg_algebraMap]
  · -- `(Dp)·v = v_1 = (T⁻¹)₁₁ = T₀₀ / det T ≠ 0`
    have hDp : (fun j => Dg K w0 (prow K j)) = fun j => if j = 1 then 1 else 0 := by
      funext j
      rw [prow, Dg_xg, hw0]
      simp only [Sum.inr.injEq, Prod.mk.injEq, true_and]
    rw [hDp]
    show (∑ j, (if j = 1 then (1 : GField K) else 0) * vT K j) ≠ 0
    rw [Fin.sum_univ_two, if_neg (by decide), if_pos rfl, zero_mul, one_mul, zero_add, vT_one]
    exact mul_ne_zero (inv_ne_zero (det_Tg_ne_zero K)) (xg_ne_zero K _)
  · intro t hv z
    have h0 := beta_eq_zero_of_vT alg t hv
    rw [halgL, baseChange_beta, h0]
    simp [extendForm]
  · intro x y hxy
    have h1 : (Sg K)⁻¹ *ᵥ x = (Sg K)⁻¹ *ᵥ y := e.injective hxy
    have h2 := congrArg (fun z => Sg K *ᵥ z) h1
    simpa [Matrix.mulVec_mulVec, Matrix.mul_nonsing_inv _ hS] using h2
  · intro t x
    have h := he t ((Sg K)⁻¹ *ᵥ x)
    rw [genAlg_beta_emb, genAlg_avecs, Matrix.mulVec_mulVec, Matrix.mul_nonsing_inv _ hS,
      Matrix.one_mulVec] at h
    exact h

/-- A decomposition of length 25 has no zero form `α_t` (otherwise R2 gives one of length 24,
against Yang's bound `R ≥ 25`, B-007). -/
theorem alpha_ne_zero_of_length_25 (alg : BilinearAlgorithm K 4 2 4 25) (t : Fin 25) :
    alg.alpha t ≠ 0 := by
  classical
  intro ht
  have h := yang_theorem_two_algorithm K 4 4 (le_refl _) (le_refl _) (removeZeroAlpha alg)
  norm_num at h
  have key : ∀ s : Finset (Fin 25), t ∉ s → s.card < 25 := by
    intro s hs
    have hsub : s ⊆ Finset.univ.erase t := fun k hk =>
      Finset.mem_erase.mpr ⟨fun h' => hs (h' ▸ hk), Finset.mem_univ _⟩
    have := Finset.card_le_card hsub
    rw [Finset.card_erase_of_mem (Finset.mem_univ _), Finset.card_univ, Fintype.card_fin] at this
    omega
  exact absurd h (not_le.mpr (key _ (by simp [ht])))

/-- **Folgerung C1, repaired (R-C1), at the generic point.** For every decomposition of
`⟨4,2,4⟩` of length 25 over any field `K`, the generic normal form satisfies (N1) and (N2),
lies in the case `(rk L, rk H) = (5, 8)` and is not symmetric. -/
theorem folgerungC1_generisch (alg : BilinearAlgorithm K 4 2 4 25) :
    SN1 (d := 3) (genAlg alg) ∧ SN2 (d := 3) (genAlg alg) ∧
      (finrank (GField K) (LinearMap.range (Lq (d := 3) (genAlg alg))),
        finrank (GField K) (LinearMap.range (Hq (d := 3) (genAlg alg)))) = (5, 8) ∧
      ¬ SatzB444.IsSymm (genAlg alg) := by
  have h1 := genSN1 alg (alpha_ne_zero_of_length_25 alg)
  have h2 := genSN2 alg
  have hC := satzC_generisch (le_refl 25) alg
  rcases SatzB444.satzB_unbedingt (genAlg alg) h1 h2 with h | h
  · exact absurd (SatzB444.satzB_symm_unbedingt (genAlg alg) h1 h2 h) hC
  · exact ⟨h1, h2, h, hC⟩

/-- **Folgerung C1 (R-C1), short form:** at the generic point the case is not `(3, 6)`. -/
theorem folgerungC1_nicht36 (alg : BilinearAlgorithm K 4 2 4 25) :
    (finrank (GField K) (LinearMap.range (Lq (d := 3) (genAlg alg))),
      finrank (GField K) (LinearMap.range (Hq (d := 3) (genAlg alg)))) ≠ (3, 6) := by
  rw [(folgerungC1_generisch alg).2.2.1]
  decide

end Main

/-! ## Axiom check (printed in every build log, also in GitHub Actions)

Expected for each: `[propext, Classical.choice, Quot.sound]`. -/

#print axioms satzC_kern
#print axioms genSN1
#print axioms genSN2
#print axioms satzC_generisch
#print axioms folgerungC1_generisch
#print axioms folgerungC1_nicht36

end SatzC444
end YangBounds
