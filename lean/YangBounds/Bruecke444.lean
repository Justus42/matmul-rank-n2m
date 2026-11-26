module

public import YangBounds.SatzC444Generisch
public import YangBounds.LemmaP444
public import YangBounds.Endsatz444
public import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
public import Mathlib.Algebra.MvPolynomial.Funext
public import Mathlib.LinearAlgebra.Matrix.ToLinearEquiv

@[expose] public section

/-!
# The bridge to an algebraically closed field for `⟨4,2,4⟩`

Task S2-35 (stage 2, round 9, track A, role: formaliser).

Prose: `lean/prosa/s2_444_spurA_r9_bruecke.md`.

## The problem

`SatzC444.folgerungC1_generisch` gives, for every decomposition `alg` of length 25 over any
field `K`, a decomposition `genAlg alg` over `F = GField K = K(S, T)` with (N1), (N2), case
`(5, 8)` and not symmetric. `SatzE444.satzE` and `LemmaP444.nur_unterfallB'` need
`[IsAlgClosed K]`. `F` is not algebraically closed, and neither (N2) (a statement for all
`w` over the field) nor the non-symmetry (a non-existence statement) is a priori stable under
a field extension.

## The bridge

Let `L = AlgebraicClosure F` and `ι = algebraMap F L`. The decomposition over `L` is

  `genAlgL alg := changeBasis (alg.baseChange L) (Sg.map ι) (Tg.map ι)`,

the same generic change of basis, read in `L`. Its forms take on `F`-matrices the `ι`-images
of the forms of `genAlg alg` (`genAlgL_alpha_map`, `genAlgL_beta_map`).

* (N1): immediate (`genSN1L`).
* (N2): the proof of `genSN2` carries over (`genInjL`, `genSN2L`). The minor polynomial
  of `SatzC444.genInj` has coefficients in `K` and depends on `w` only through the support
  `{t | β_t(w) ≠ 0}`; it is nonzero because of a good point `p₀` over `L`, hence it does not
  vanish at the generic point `ι (T₀₀, T₀₁)`.
* Not symmetric (`nichtSymm_genAlgL`): a symmetry over `L` is a solution `(E, μ)` of a linear
  system with coefficients in `F` together with `det E ≠ 0`. Writing the coordinates of a
  solution in an `F`-basis `ω` of their `F`-span splits it into `F`-solutions `(E_k, μ_k)`;
  `det (∑ c_k E_k)` is a polynomial over `F` which is nonzero at `c = ω`, so it is nonzero at
  some `c ∈ F^n` because `F` is infinite (`descent`). This gives a symmetry over `F`,
  against `SatzC444.satzC_generisch`.
* Case `(5, 8)` over `L`: `satzB_unbedingt` over `L`, the case `(3, 6)` being symmetric by
  `satzB_symm_unbedingt`.

## Main results

* `bruecke`: for every field `K` and every decomposition of length 25 over `K`, the
  decomposition `genAlgL alg` over the algebraically closed field `GBar K` satisfies (N1),
  (N2), lies in the case `(5, 8)` and is not symmetric.
* `bruecke_exists`: the same as an existence statement over some algebraically closed field.
* `bruecke_unterfallB`, `bruecke_nicht_unterfallA`: `nur_unterfallB'` and `satzE` applied.
* `brueckeStatement`: `Endsatz444.BrueckeStatement K` for every field `K`.
* `rank_four_two_four_ge_26_of_unterfallB`: the final theorem of `Endsatz444` with the bridge
  hypothesis discharged; only the sub-case B hypothesis (task S2-34) remains.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace Bruecke444

open Module YangN4Haupt MvPolynomial Matrix SatzC444
open YangN3Teil2 (outer outer_apply basisVec changeBasis changeBasis_alpha_apply
  changeBasis_beta_apply mul_unitMatrix_mul sum_smul_outer exists_vecMul_ne_zero)

universe u v

/-! ## Descent of a linear system with an open condition -/

section Descent

variable {F : Type u} [Field F] [Infinite F] {L : Type v} [Field L] [Algebra F L]

/-- **Descent.** If the linear system `∑_j E_{ji} b_{tj} = μ_t a_{ti}` (coefficients in `F`)
has a solution over `L` with `det E ≠ 0`, it has one over the infinite field `F`. -/
theorem descent {r : ℕ} (a b : Fin r → Fin 4 → F) (E : Matrix (Fin 4) (Fin 4) L)
    (hE : E.det ≠ 0) (μ : Fin r → L)
    (h : ∀ t i, ∑ j, E j i * algebraMap F L (b t j) = μ t * algebraMap F L (a t i)) :
    ∃ (E₀ : Matrix (Fin 4) (Fin 4) F) (μ₀ : Fin r → F),
      E₀.det ≠ 0 ∧ ∀ t i, ∑ j, E₀ j i * b t j = μ₀ t * a t i := by
  classical
  let z : (Fin 4 × Fin 4) ⊕ Fin r → L := Sum.elim (fun p => E p.1 p.2) μ
  let V : Submodule F L := Submodule.span F (Set.range z)
  haveI : FiniteDimensional F V := FiniteDimensional.span_of_finite F (Set.finite_range z)
  let ω := Module.finBasis F V
  let c : ((Fin 4 × Fin 4) ⊕ Fin r) → Fin (finrank F V) → F := fun x =>
    ω.repr ⟨z x, Submodule.subset_span ⟨x, rfl⟩⟩
  have hz : ∀ x, z x = ∑ k, algebraMap F L (c x k) * (ω k : L) := by
    intro x
    have h0 := ω.sum_repr ⟨z x, Submodule.subset_span ⟨x, rfl⟩⟩
    have h1 := congrArg (fun v : V => (v : L)) h0
    simp only [Submodule.coe_sum, Submodule.coe_smul, Algebra.smul_def] at h1
    exact h1.symm
  have hli : LinearIndependent F (fun k => (ω k : L)) :=
    ω.linearIndependent.map' V.subtype (Submodule.ker_subtype V)
  let Ek : Fin (finrank F V) → Matrix (Fin 4) (Fin 4) F := fun k j i => c (Sum.inl (j, i)) k
  let μk : Fin (finrank F V) → Fin r → F := fun k t => c (Sum.inr t) k
  have hE' : ∀ j i, E j i = ∑ k, algebraMap F L (Ek k j i) * (ω k : L) := fun j i =>
    hz (Sum.inl (j, i))
  have hμ' : ∀ t, μ t = ∑ k, algebraMap F L (μk k t) * (ω k : L) := fun t => hz (Sum.inr t)
  -- every `(E_k, μ_k)` solves the system over `F`
  have hk : ∀ k t i, ∑ j, Ek k j i * b t j - μk k t * a t i = 0 := by
    intro k t i
    have h2 := h t i
    simp only [hE', hμ', Finset.sum_mul] at h2
    rw [Finset.sum_comm] at h2
    have hsum : ∑ k, (∑ j, Ek k j i * b t j - μk k t * a t i) • (ω k : L) = 0 := by
      simp only [Algebra.smul_def, map_sub, map_sum, map_mul, sub_mul, Finset.sum_sub_distrib,
        Finset.sum_mul]
      rw [sub_eq_zero]
      refine (Finset.sum_congr rfl fun k _ => Finset.sum_congr rfl fun j _ => ?_).trans
        (h2.trans (Finset.sum_congr rfl fun k _ => ?_))
      · ring
      · ring
    exact Fintype.linearIndependent_iff.mp hli _ hsum k
  -- the determinant polynomial
  let P : MvPolynomial (Fin (finrank F V)) F :=
    (Matrix.of fun j i => ∑ k, X k * C (Ek k j i)).det
  have hPω : aeval (fun k => (ω k : L)) P = E.det := by
    rw [AlgHom.map_det]
    congr 1
    ext j i
    simp only [AlgHom.mapMatrix_apply, Matrix.map_apply, Matrix.of_apply, map_sum, map_mul,
      aeval_X, aeval_C]
    rw [hE']
    refine Finset.sum_congr rfl fun k _ => ?_
    ring
  have hP : P ≠ 0 := by
    intro h0
    apply hE
    rw [← hPω, h0, map_zero]
  obtain ⟨c0, hc0⟩ : ∃ c0 : Fin (finrank F V) → F, eval c0 P ≠ 0 := by
    by_contra! hne
    exact hP (MvPolynomial.funext fun x => by rw [hne x, map_zero])
  refine ⟨fun j i => ∑ k, c0 k * Ek k j i, fun t => ∑ k, c0 k * μk k t, ?_, ?_⟩
  · have hdet : eval c0 P = (Matrix.of fun j i => ∑ k, c0 k * Ek k j i).det := by
      rw [RingHom.map_det]
      congr 1
      ext j i
      simp [RingHom.mapMatrix_apply, Matrix.map_apply, map_sum, map_mul, eval_X, eval_C]
    rw [hdet] at hc0
    exact hc0
  · intro t i
    calc ∑ j, (∑ k, c0 k * Ek k j i) * b t j
        = ∑ k, c0 k * ∑ j, Ek k j i * b t j := by
          simp only [Finset.sum_mul, Finset.mul_sum]
          rw [Finset.sum_comm]
          exact Finset.sum_congr rfl fun k _ => Finset.sum_congr rfl fun j _ => by ring
      _ = ∑ k, c0 k * (μk k t * a t i) :=
          Finset.sum_congr rfl fun k _ => by rw [sub_eq_zero.mp (hk k t i)]
      _ = (∑ k, c0 k * μk k t) * a t i := by
          rw [Finset.sum_mul]
          exact Finset.sum_congr rfl fun k _ => by ring

end Descent

/-! ## Linear forms on `emb` and symmetry in coordinates -/

section Coordinates

variable {F : Type u} [Field F]

/-- `φ (emb z) = ∑_j z_j φ (emb e_j)`. -/
theorem form_emb_expand (φ : Matrix (Fin 2) (Fin 4) F →ₗ[F] F) (z : Fin 4 → F) :
    φ (emb z) = ∑ j, z j * φ (emb (basisVec j)) := by
  have h := LinearMap.pi_apply_eq_sum_univ (φ ∘ₗ emb) z
  simp only [LinearMap.comp_apply, smul_eq_mul] at h
  exact h

/-- A symmetry given by a matrix `E₀` with `det E₀ ≠ 0` and the system in coordinates. -/
theorem isSymm_of_coords {r : ℕ} (B : BilinearAlgorithm F 4 2 4 r)
    (E₀ : Matrix (Fin 4) (Fin 4) F) (μ₀ : Fin r → F) (hdet : E₀.det ≠ 0)
    (h : ∀ t i, ∑ j, E₀ j i * B.beta t (emb (basisVec j)) = μ₀ t * SatzB444.avecs B t i) :
    SatzB444.IsSymm B := by
  classical
  let e : (Fin 4 → F) ≃ₗ[F] (Fin 4 → F) :=
    Matrix.toLinearEquiv' E₀ (Matrix.invertibleOfIsUnitDet E₀ (isUnit_iff_ne_zero.mpr hdet))
  refine ⟨e, μ₀, fun t y => ?_⟩
  have he : e y = E₀ *ᵥ y := rfl
  rw [he, form_emb_expand]
  calc ∑ j, (E₀ *ᵥ y) j * B.beta t (emb (basisVec j))
      = ∑ i, y i * ∑ j, E₀ j i * B.beta t (emb (basisVec j)) := by
        simp only [Matrix.mulVec, dotProduct, Finset.sum_mul, Finset.mul_sum]
        rw [Finset.sum_comm]
        exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => by ring
    _ = ∑ i, y i * (μ₀ t * SatzB444.avecs B t i) :=
        Finset.sum_congr rfl fun i _ => by rw [h t i]
    _ = μ₀ t * ∑ i, y i * SatzB444.avecs B t i := by
        rw [Finset.mul_sum]
        exact Finset.sum_congr rfl fun i _ => by ring

end Coordinates

/-- **Descent of the symmetry.** Let `B` over the infinite field `F` and `B'` over an extension
`L` have the same coordinates `a_{ti}` and `b_{tj}` up to `ι`. If `B'` is symmetric, so is
`B`. -/
theorem isSymm_descent {F : Type u} [Field F] [Infinite F] {L : Type v} [Field L] [Algebra F L]
    {r : ℕ} (B : BilinearAlgorithm F 4 2 4 r) (B' : BilinearAlgorithm L 4 2 4 r)
    (ha : ∀ t i, SatzB444.avecs B' t i = algebraMap F L (SatzB444.avecs B t i))
    (hb : ∀ t j, B'.beta t (emb (basisVec j)) = algebraMap F L (B.beta t (emb (basisVec j))))
    (hs : SatzB444.IsSymm B') : SatzB444.IsSymm B := by
  classical
  obtain ⟨e, μ, he⟩ := hs
  let E : Matrix (Fin 4) (Fin 4) L := LinearMap.toMatrix' (e : (Fin 4 → L) →ₗ[L] (Fin 4 → L))
  have hE : E.det ≠ 0 := by
    rw [LinearMap.det_toMatrix']
    exact (LinearEquiv.isUnit_det' e).ne_zero
  have hEv : ∀ y, e y = E *ᵥ y := by
    intro y
    rw [← Matrix.toLin'_apply, Matrix.toLin'_toMatrix']
    rfl
  have hcol : ∀ i j, (E *ᵥ basisVec i) j = E j i := by
    intro i j
    simp [Matrix.mulVec, dotProduct, basisVec]
  obtain ⟨E₀, μ₀, hdet, hsys⟩ := descent (fun t i => SatzB444.avecs B t i)
    (fun t j => B.beta t (emb (basisVec j))) E hE μ (by
      intro t i
      have h := he t (basisVec i)
      rw [hEv, form_emb_expand] at h
      simp only [hcol, hb] at h
      rw [h]
      congr 1
      simp [basisVec, ha])
  exact isSymm_of_coords B E₀ μ₀ hdet hsys

/-! ## The generic normal form over the algebraic closure -/

section Generic

variable (K : Type u) [Field K]

/-- The algebraic closure of the function field `K(S, T)`. -/
abbrev GBar := AlgebraicClosure (GField K)

/-- `ι : K(S, T) → GBar K`. -/
noncomputable abbrev ι : GField K →+* GBar K := algebraMap (GField K) (GBar K)

instance infinite_GField : Infinite (GField K) :=
  Infinite.of_injective (algebraMap (GPoly K) (GField K)) (IsFractionRing.injective _ _)

theorem ι_injective : Function.Injective (ι K) := (ι K).injective

/-- The generic matrix `S`, read in `GBar K`. -/
noncomputable def SgL : Matrix (Fin 4) (Fin 4) (GBar K) := (Sg K).map (ι K)

/-- The generic matrix `T`, read in `GBar K`. -/
noncomputable def TgL : Matrix (Fin 2) (Fin 2) (GBar K) := (Tg K).map (ι K)

theorem det_SgL : (SgL K).det = ι K (Sg K).det := by
  rw [RingHom.map_det]; rfl

theorem det_TgL : (TgL K).det = ι K (Tg K).det := by
  rw [RingHom.map_det]; rfl

theorem isUnit_det_SgL : IsUnit (SgL K).det := by
  rw [det_SgL, isUnit_iff_ne_zero]
  exact fun h => det_Sg_ne_zero K ((ι_injective K) (h.trans (map_zero _).symm))

theorem isUnit_det_TgL : IsUnit (TgL K).det := by
  rw [det_TgL, isUnit_iff_ne_zero]
  exact fun h => det_Tg_ne_zero K ((ι_injective K) (h.trans (map_zero _).symm))

theorem TgL_inv : (TgL K)⁻¹ = ((Tg K)⁻¹).map (ι K) := by
  apply Matrix.inv_eq_right_inv
  rw [TgL, ← Matrix.map_mul, Matrix.mul_nonsing_inv _ (isUnit_det_Tg K), Matrix.map_one _
    (map_zero _) (map_one _)]

variable {K}

/-- **The generic normal form over `GBar K`.** -/
noncomputable def genAlgL {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r) :
    BilinearAlgorithm (GBar K) 4 2 4 r :=
  changeBasis (alg.baseChange (GBar K)) (SgL K) (TgL K) (isUnit_det_SgL K) (isUnit_det_TgL K)

/-- Extension of a `K`-form in two steps `K → F → L` is the extension in one step. -/
theorem extendForm_tower {a b : ℕ} (φ : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (M : Matrix (Fin a) (Fin b) (GField K)) :
    extendForm (L := GBar K) φ (M.map (ι K)) = ι K (extendForm (L := GField K) φ M) := by
  rw [extendForm_apply, extendForm_apply, map_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [map_mul, Matrix.map_apply, IsScalarTower.algebraMap_apply K (GField K) (GBar K)]

variable {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

theorem genAlgL_alpha_map (t : Fin r) (A : Matrix (Fin 4) (Fin 2) (GField K)) :
    (genAlgL alg).alpha t (A.map (ι K)) = ι K ((genAlg alg).alpha t A) := by
  simp only [genAlgL, genAlg, changeBasis_alpha_apply, SgL, TgL]
  rw [← Matrix.map_mul, ← Matrix.map_mul]
  exact extendForm_tower _ _

theorem genAlgL_beta_map (t : Fin r) (B : Matrix (Fin 2) (Fin 4) (GField K)) :
    (genAlgL alg).beta t (B.map (ι K)) = ι K ((genAlg alg).beta t B) := by
  simp only [genAlgL, genAlg, changeBasis_beta_apply]
  rw [TgL_inv, ← Matrix.map_mul]
  exact extendForm_tower _ _

theorem unitMatrix_mapι {a b : ℕ} (i : Fin a) (j : Fin b) :
    (unitMatrix i j : Matrix (Fin a) (Fin b) (GField K)).map (ι K) = unitMatrix i j := by
  ext x y
  simp only [Matrix.map_apply, unitMatrix, Matrix.of_apply]
  split_ifs <;> simp

theorem avecs_genAlgL (t : Fin r) (i : Fin 4) :
    SatzB444.avecs (genAlgL alg) t i = ι K (SatzB444.avecs (genAlg alg) t i) := by
  simp only [SatzB444.avecs, eA]
  rw [← unitMatrix_mapι, genAlgL_alpha_map]

theorem emb_basisVec_map (j : Fin 4) :
    (emb (basisVec j) : Matrix (Fin 2) (Fin 4) (GField K)).map (ι K) = emb (basisVec j) := by
  ext x y
  fin_cases x <;> simp [emb, YangN3Teil3.emb, basisVec, apply_ite]

theorem beta_genAlgL_emb (t : Fin r) (j : Fin 4) :
    (genAlgL alg).beta t (emb (basisVec j)) = ι K ((genAlg alg).beta t (emb (basisVec j))) := by
  rw [← emb_basisVec_map, genAlgL_beta_map]

/-! ### (N1) and (N2) over `GBar K` -/

/-- **(N1) over `GBar K`.** -/
theorem genSN1L (hα : ∀ t, alg.alpha t ≠ 0) : SN1 (d := 3) (genAlgL alg) := by
  intro k
  have h := genSN1 alg hα k
  show (genAlgL alg).alpha k (unitMatrix 0 0) ≠ 0
  rw [← unitMatrix_mapι, genAlgL_alpha_map]
  intro h0
  exact h ((ι_injective K) (h0.trans (map_zero _).symm))

/-- Evaluation of polynomials over `K` at a point of `GBar K`. -/
noncomputable def evB (x : Var 3 → GBar K) : GPoly K →+* GBar K :=
  eval₂Hom (algebraMap K (GBar K)) x

theorem evB_polyForm (x : Var 3 → GBar K) {a b : ℕ} (φ : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (U : Fin a → GPoly K) (W : Fin b → GPoly K) :
    evB x (polyForm K φ U W) =
      extendForm (L := GBar K) φ (outer (fun i => evB x (U i)) (fun j => evB x (W j))) := by
  rw [extendForm_apply]
  simp only [polyForm, map_sum, map_mul, outer_apply]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  simp [evB]

/-- At the generic point the evaluation into `GBar K` is `ι ∘ algebraMap`. -/
theorem evB_xg : evB (fun w => ι K (xg K w)) = (ι K).comp (algebraMap (GPoly K) (GField K)) := by
  apply MvPolynomial.ringHom_ext
  · intro c
    simp only [evB, coe_eval₂Hom, eval₂_C, RingHom.coe_comp, Function.comp_apply, algebraMap_C]
    rw [IsScalarTower.algebraMap_apply K (GField K) (GBar K)]
  · intro w
    simp only [evB, coe_eval₂Hom, eval₂_X, RingHom.coe_comp, Function.comp_apply, xg]

/-- The generic point `p = (T₀₀, T₀₁)` read in `GBar K`. -/
noncomputable def prowL : Fin 2 → GBar K := fun j => ι K (prow K j)

/-- At the generic point `p`, the map `a ↦ (α_t(a pᵀ) β_t(w))_t` over `GBar K` is injective
for every `w ≠ 0` over `GBar K`. -/
theorem genInjL (w : Matrix (Fin 2) (Fin 4) (GBar K)) (hw : w ≠ 0) :
    Function.Injective (lmap (d := 3) (alg.baseChange (GBar K)) (prowL (K := K)) w) := by
  classical
  set algL := alg.baseChange (GBar K) with halgL
  obtain ⟨p0, hp0⟩ := exists_vecMul_ne_zero hw
  have hinj0 := lmap_injective (d := 3) algL hp0
  let N : (Fin 2 → GBar K) → Matrix (Fin r) (Fin 4) (GBar K) := fun p k a =>
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
  -- the minor as a polynomial with coefficients in `K`; it depends on `w` only through the
  -- support of `β(w)`
  let Npoly : Matrix (Fin 4) (Fin 4) (GPoly K) := fun i a =>
    if algL.beta (f i) w ≠ 0 then
      polyForm K (alg.alpha (f i)) (fun i' => if a = i' then 1 else 0)
        (fun j => X (Sum.inr (0, j)))
    else 0
  have hev : ∀ x : Var 3 → GBar K, (evB x).mapMatrix Npoly =
      (N (fun j => x (Sum.inr (0, j)))).submatrix f id := by
    intro x
    ext i a
    change evB x (Npoly i a) = N (fun j => x (Sum.inr (0, j))) (f i) a
    simp only [Npoly, N]
    split_ifs with hb
    · rw [evB_polyForm, halgL]
      have hU : (fun i' => evB x (if a = i' then 1 else 0)) = basisVec a := by
        funext i'
        simp only [YangN3Teil2.basisVec]
        split_ifs <;> simp
      have hW : (fun j => evB x (X (Sum.inr (0, j)))) = fun j => x (Sum.inr (0, j)) := by
        funext j
        simp [evB]
      rw [hU, hW]
      rfl
    · exact map_zero _
  let x0 : Var 3 → GBar K := Sum.elim 0 (fun ab => p0 ab.2)
  have hP0 : evB x0 Npoly.det ≠ 0 := by
    rw [RingHom.map_det, hev]
    exact hf
  have hPne : Npoly.det ≠ 0 := fun h => hP0 (by rw [h, map_zero])
  have hgen : ((N (prowL (K := K))).submatrix f id).det ≠ 0 := by
    have h := hev (fun w => ι K (xg K w))
    rw [show (fun j => ι K (xg K (Sum.inr (0, j)))) = prowL (K := K) from rfl] at h
    rw [← h, ← RingHom.map_det, evB_xg, RingHom.comp_apply]
    intro h0
    exact hPne (poly_eq_zero_of_algebraMap K ((ι_injective K) (h0.trans (map_zero _).symm)))
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro a ha
  have hNa0 : N (prowL (K := K)) *ᵥ a = 0 := (hN _ a).mp ha
  have hsub : (N (prowL (K := K))).submatrix f id *ᵥ a = 0 := by
    funext i
    have := congrFun hNa0 (f i)
    simp only [Matrix.mulVec, dotProduct, Matrix.submatrix_apply, id, Pi.zero_apply] at this ⊢
    exact this
  exact Matrix.eq_zero_of_mulVec_eq_zero hgen hsub

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
/-- **(N2) over `GBar K`.** -/
theorem genSN2L : SN2 (d := 3) (genAlgL alg) := by
  intro v hv
  rw [Fintype.linearIndependent_iff]
  intro g hg
  have hT := isUnit_det_TgL K
  have hS := isUnit_det_SgL K
  have hw : (TgL K)⁻¹ * v ≠ 0 := by
    intro h0
    apply hv
    rw [← Matrix.one_mul v, ← Matrix.mul_nonsing_inv (TgL K) hT, Matrix.mul_assoc, h0,
      Matrix.mul_zero]
  have hinj := genInjL alg _ hw
  have hL : lmap (d := 3) (alg.baseChange (GBar K)) (prowL (K := K)) ((TgL K)⁻¹ * v)
      (SgL K *ᵥ g) = 0 := by
    funext k
    have hk := congrFun hg k
    simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply, fv_apply_apply,
      genAlgL, changeBasis_alpha_apply, changeBasis_beta_apply, mul_unitMatrix_mul] at hk
    rw [Pi.zero_apply, ← hk, lmap_apply, ← sum_smul_outer, map_sum, Finset.sum_mul]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [map_smul, smul_eq_mul, mul_assoc]
    rfl
  have hSg : SgL K *ᵥ g = 0 := hinj (hL.trans (map_zero _).symm)
  have hg0 : g = 0 := by
    have := congrArg (fun y => (SgL K)⁻¹ *ᵥ y) hSg
    simpa [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul _ hS] using this
  intro i
  simp [hg0]

/-! ### Non-symmetry over `GBar K` -/

/-- **Non-symmetry over `GBar K`** (for every length `r ≤ 25`): a symmetry over `GBar K`
descends to one of `genAlg alg` over `K(S, T)`, against `satzC_generisch`. -/
theorem nichtSymm_genAlgL (hr : r ≤ 25) :
    SatzE444Buendel.NichtSymmetrisch (genAlgL alg) := by
  intro hs
  exact satzC_generisch hr alg (isSymm_descent (genAlg alg) (genAlgL alg)
    (avecs_genAlgL alg) (beta_genAlgL_emb alg) hs)

end Generic

/-! ## The bridge -/

section Main

variable {K : Type u} [Field K]

/-- **The bridge (S2-35).** For every field `K` and every decomposition `alg` of `⟨4,2,4⟩` of
length 25 over `K`, the decomposition `genAlgL alg` of length 25 over the algebraically closed
field `GBar K = AlgebraicClosure K(S, T)` satisfies (N1), (N2), lies in the case
`(rk L, rk H) = (5, 8)` and is not symmetric. -/
theorem bruecke (alg : BilinearAlgorithm K 4 2 4 25) :
    SN1 (d := 3) (genAlgL alg) ∧ SN2 (d := 3) (genAlgL alg) ∧
      (finrank (GBar K) (LinearMap.range (Lq (d := 3) (genAlgL alg))),
        finrank (GBar K) (LinearMap.range (Hq (d := 3) (genAlgL alg)))) = (5, 8) ∧
      SatzE444Buendel.NichtSymmetrisch (genAlgL alg) := by
  have h1 := genSN1L alg (alpha_ne_zero_of_length_25 alg)
  have h2 := genSN2L alg
  have hns := nichtSymm_genAlgL alg (le_refl 25)
  rcases SatzB444.satzB_unbedingt (genAlgL alg) h1 h2 with h | h
  · exact absurd (SatzB444.satzB_symm_unbedingt (genAlgL alg) h1 h2 h) hns
  · exact ⟨h1, h2, h, hns⟩

/-- **The bridge, existence form**: the input of `nur_unterfallB'` and `satzE`. -/
theorem bruecke_exists (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ (L : Type u) (_ : Field L), IsAlgClosed L ∧
      ∃ alg' : BilinearAlgorithm L 4 2 4 25,
        SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
        (finrank L (LinearMap.range (Lq (d := 3) alg')),
          finrank L (LinearMap.range (Hq (d := 3) alg'))) = (5, 8) ∧
        SatzE444Buendel.NichtSymmetrisch alg' :=
  ⟨GBar K, inferInstance, inferInstance, genAlgL alg, bruecke alg⟩

/-- Application: `genAlgL alg` is in sub-case B of Lemma P (`nur_unterfallB'`). -/
theorem bruecke_unterfallB (alg : BilinearAlgorithm K 4 2 4 25) :
    SatzE444Buendel.UnterfallB (genAlgL alg) := by
  obtain ⟨h1, h2, hc, hns⟩ := bruecke alg
  exact LemmaP444.nur_unterfallB' (genAlgL alg) h1 h2 hc hns

/-- Application: `genAlgL alg` is not in sub-case A (`satzE`). -/
theorem bruecke_nicht_unterfallA (alg : BilinearAlgorithm K 4 2 4 25) :
    ¬ SatzE444.UnterfallA (genAlgL alg) := by
  obtain ⟨h1, h2, hc, -⟩ := bruecke alg
  exact SatzE444.satzE (genAlgL alg) h1 h2 hc

/-- **The bridge in the form of the final theorem** (`Endsatz444.BrueckeStatement`), over
every field `K` (not only over algebraically closed ones). -/
theorem brueckeStatement (K : Type u) [Field K] : Endsatz444.BrueckeStatement K := by
  intro alg
  obtain ⟨h1, h2, -, hns⟩ := bruecke alg
  exact ⟨GBar K, inferInstance, inferInstance, genAlgL alg, h1, h2, hns⟩

/-- **Final theorem with the bridge discharged:** `R_K(⟨4,2,4⟩) ≥ 26` over every field `K`,
assuming only the exclusion of sub-case B over algebraically closed fields (task S2-34). -/
theorem rank_four_two_four_ge_26_of_unterfallB
    (hB : ∀ (L : Type u) [Field L] [IsAlgClosed L], Endsatz444.UnterfallBStatement L)
    (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 :=
  Endsatz444.rank_four_two_four_ge_26_of (fun K _ _ => brueckeStatement K) hB K

end Main

/-! ## Axiom check (printed in every build log, also in GitHub Actions)

Expected for each: `[propext, Classical.choice, Quot.sound]`. -/

#print axioms descent
#print axioms isSymm_descent
#print axioms genSN1L
#print axioms genSN2L
#print axioms nichtSymm_genAlgL
#print axioms bruecke
#print axioms bruecke_exists
#print axioms bruecke_unterfallB
#print axioms bruecke_nicht_unterfallA
#print axioms brueckeStatement
#print axioms rank_four_two_four_ge_26_of_unterfallB

end Bruecke444
end YangBounds
