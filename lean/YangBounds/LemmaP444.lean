module

public import YangBounds.SatzE444Buendel
public import Mathlib.LinearAlgebra.Eigenspace.Minpoly
public import Mathlib.Data.Fintype.Pigeonhole

@[expose] public section

/-!
# Lemma P for `⟨4,2,4⟩`, case (5,8): proof of `LemmaPStatement`

Task S2-32 (stage 2, round 8, track A, role: formaliser).
Claim file: `behauptungen/B-013.md`.

Source: prose `versuche/s2-32/lemmaP_prosa.md` (elementary version of Lemma P from
`lean/prosa/s2_444_spurA_r4.md`, Section 5.1). The duality/degree argument of the prose
(step 2) is replaced by an elementary argument (finiteness of the bad points on
a line, then pigeonhole); the Kronecker normal form (step 4) is replaced by an eigenvalue
argument; Lemma 9 is replaced by `rk L = 5`.

## Main results

* `LemmaP444.main`: abstract form. `K` an infinite field, `F_1, F_2, F_3 : K⁴ → Q` with
  (H1) `rk F_γ ≤ 3` for all `γ` and `Ω ≠ ∅`, (H2) `s(γ) = 1` for `γ ∈ Ω`,
  (H3) `dim ∑_i F_i(K⁴) = 5`. Then sub-case A or sub-case B holds for `K* = ∑_{γ ∈ Ω} ker F_γ`.
* `LemmaP444.lemmaP`: `LemmaPStatement K` for every infinite field `K`
  (in particular for every algebraically closed field).
* `LemmaP444.nur_unterfallB'` and `LemmaP444.nur_unterfallB_global'`: the theorems
  `SatzE444Buendel.nur_unterfallB(_global)` without the hypothesis Lemma P.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace LemmaP444

open Module

universe u v

section Abstract

variable {K : Type u} [Field K] {Q : Type v} [AddCommGroup Q] [Module K Q]
  (F : Fin 3 → (Fin 4 → K) →ₗ[K] Q)

/-- `γ ↦ F_γ = ∑ γ_i F_i`, linear in `γ`. -/
def FcL : (Fin 3 → K) →ₗ[K] ((Fin 4 → K) →ₗ[K] Q) where
  toFun γ := ∑ i, γ i • F i
  map_add' a b := by simp only [Pi.add_apply, add_smul, Finset.sum_add_distrib]
  map_smul' c a := by
    simp only [Pi.smul_apply, smul_eq_mul, mul_smul, Finset.smul_sum, RingHom.id_apply]

theorem FcL_apply (γ : Fin 3 → K) : FcL F γ = ∑ i, γ i • F i := rfl

theorem FcL_single (i : Fin 3) : FcL F (Pi.single i 1) = F i := by
  rw [FcL_apply, Finset.sum_eq_single i]
  · simp
  · intro j _ hj; simp [Pi.single_apply, hj]
  · simp

/-- `Ω = {γ : rk F_γ = 3}`. -/
def Om : Set (Fin 3 → K) := {γ | finrank K (LinearMap.range (FcL F γ)) = 3}

/-- `K* = ∑_{γ ∈ Ω} ker F_γ`. -/
noncomputable def Ks : Submodule K (Fin 4 → K) := ⨆ γ ∈ Om F, LinearMap.ker (FcL F γ)

/-- `D(S) = {δ : F_δ(S) = 0}`. -/
def Dof (S : Submodule K (Fin 4 → K)) : Submodule K (Fin 3 → K) where
  carrier := {δ | ∀ x ∈ S, FcL F δ x = 0}
  add_mem' {a b} ha hb x hx := by
    show FcL F (a + b) x = 0
    rw [map_add, LinearMap.add_apply, ha x hx, hb x hx, add_zero]
  zero_mem' x _ := by
    show FcL F 0 x = 0
    rw [map_zero, LinearMap.zero_apply]
  smul_mem' c a ha x hx := by
    show FcL F (c • a) x = 0
    rw [map_smul, LinearMap.smul_apply, ha x hx, smul_zero]

theorem mem_Dof {S : Submodule K (Fin 4 → K)} {δ : Fin 3 → K} :
    δ ∈ Dof F S ↔ ∀ x ∈ S, FcL F δ x = 0 := Iff.rfl

/-- `D(γ) = D(ker F_γ)`. -/
def Dg (γ : Fin 3 → K) : Submodule K (Fin 3 → K) := Dof F (LinearMap.ker (FcL F γ))

/-- The hypotheses (H1), (H2), (H3) of the prose. -/
structure Hyp : Prop where
  rk_le : ∀ γ, finrank K (LinearMap.range (FcL F γ)) ≤ 3
  nonempty : (Om F).Nonempty
  sdim : ∀ γ ∈ Om F,
    finrank K (⨆ i, (LinearMap.ker (FcL F γ)).map (F i) : Submodule K Q) = 1
  rkL : finrank K (⨆ i, LinearMap.range (F i) : Submodule K Q) = 5

/-! ### Generic linear algebra -/

omit [Field K] in
theorem exists_eq_span_of_finrank_one {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] (S : Submodule K V) [FiniteDimensional K S] (h : finrank K S = 1) :
    ∃ k : V, k ≠ 0 ∧ S = K ∙ k := by
  have hS : S ≠ ⊥ := by
    intro hb
    rw [hb, finrank_bot] at h
    exact absurd h (by norm_num)
  obtain ⟨k, hk, hk0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hS
  refine ⟨k, hk0, (Submodule.eq_of_le_of_finrank_eq
    ((Submodule.span_singleton_le_iff_mem _ _).2 hk) ?_).symm⟩
  rw [finrank_span_singleton hk0, h]

omit [Field K] in
theorem finrank_inf_of_ne {K : Type u} [Field K] (P P' : Submodule K (Fin 3 → K))
    (hP : finrank K P = 2) (hP' : finrank K P' = 2) (hne : P ≠ P') :
    finrank K (P ⊓ P' : Submodule K (Fin 3 → K)) = 1 := by
  have h := Submodule.finrank_sup_add_finrank_inf_eq P P'
  have hle : finrank K (P ⊔ P' : Submodule K (Fin 3 → K)) ≤ 3 :=
    (Submodule.finrank_le _).trans (by rw [Module.finrank_fin_fun])
  have hlt : P < P ⊔ P' := by
    refine lt_of_le_of_ne le_sup_left fun heq => hne ?_
    have h1 : P' ≤ P := heq ▸ le_sup_right
    exact (Submodule.eq_of_le_of_finrank_eq h1 (by rw [hP, hP'])).symm
  have := Submodule.finrank_lt_finrank_of_lt hlt
  omega

/-! ### Steps 0 to 2 -/

variable {F}

theorem ne_zero_of_mem_Om {γ : Fin 3 → K} (hγ : γ ∈ Om F) : γ ≠ 0 := by
  rintro rfl
  have h : finrank K (LinearMap.range (FcL F 0)) = 3 := hγ
  rw [map_zero, LinearMap.range_zero, finrank_bot] at h
  exact absurd h (by norm_num)

theorem smul_mem_Om_iff {γ : Fin 3 → K} {c : K} (hc : c ≠ 0) : c • γ ∈ Om F ↔ γ ∈ Om F := by
  show finrank K (LinearMap.range (FcL F (c • γ))) = 3 ↔
    finrank K (LinearMap.range (FcL F γ)) = 3
  rw [map_smul, LinearMap.range_smul _ _ hc]

theorem finrank_ker_eq_one {γ : Fin 3 → K} (hγ : γ ∈ Om F) :
    finrank K (LinearMap.ker (FcL F γ)) = 1 := by
  have h := LinearMap.finrank_range_add_finrank_ker (FcL F γ)
  have h3 : finrank K (LinearMap.range (FcL F γ)) = 3 := hγ
  rw [Module.finrank_fin_fun] at h
  omega

theorem Dof_span (k : Fin 4 → K) : Dof F (K ∙ k) = LinearMap.ker ((FcL F).flip k) := by
  ext δ
  rw [mem_Dof, LinearMap.mem_ker, LinearMap.flip_apply]
  constructor
  · intro h; exact h k (Submodule.mem_span_singleton_self k)
  · intro h x hx
    obtain ⟨c, rfl⟩ := Submodule.mem_span_singleton.1 hx
    rw [map_smul, h, smul_zero]

theorem range_flip (k : Fin 4 → K) :
    LinearMap.range ((FcL F).flip k) = ⨆ i, (K ∙ k).map (F i) := by
  apply le_antisymm
  · rintro _ ⟨δ, rfl⟩
    rw [LinearMap.flip_apply, FcL_apply, LinearMap.sum_apply]
    refine Submodule.sum_mem _ fun i _ => ?_
    rw [LinearMap.smul_apply]
    exact Submodule.smul_mem _ _ (Submodule.mem_iSup_of_mem i
      (Submodule.mem_map_of_mem (Submodule.mem_span_singleton_self k)))
  · refine iSup_le fun i => ?_
    rintro _ ⟨x, hx, rfl⟩
    obtain ⟨c, rfl⟩ := Submodule.mem_span_singleton.1 hx
    refine ⟨c • (Pi.single i (1 : K) : Fin 3 → K), ?_⟩
    rw [LinearMap.flip_apply, map_smul, LinearMap.smul_apply, map_smul, FcL_single]

/-- **Step 1.** `dim D(γ) = 2` for `γ ∈ Ω`. -/
theorem finrank_Dg (H : Hyp F) {γ : Fin 3 → K} (hγ : γ ∈ Om F) : finrank K (Dg F γ) = 2 := by
  obtain ⟨k, -, hker⟩ :=
    exists_eq_span_of_finrank_one (LinearMap.ker (FcL F γ)) (finrank_ker_eq_one hγ)
  have hs := H.sdim γ hγ
  have h := LinearMap.finrank_range_add_finrank_ker ((FcL F).flip k)
  have hD : Dg F γ = LinearMap.ker ((FcL F).flip k) := by
    show Dof F (LinearMap.ker (FcL F γ)) = _
    rw [hker, Dof_span]
  have hr : finrank K (LinearMap.range ((FcL F).flip k)) = 1 := by
    rw [range_flip, ← hker, hs]
  rw [hD]
  rw [hr, Module.finrank_fin_fun] at h
  omega

theorem self_mem_Dg (γ : Fin 3 → K) : γ ∈ Dg F γ := fun _ hx => hx

/-- **Step 2.** -/
theorem ker_eq_of_mem_Dg {γ γ' : Fin 3 → K} (hγ : γ ∈ Om F) (hγ' : γ' ∈ Om F)
    (h : γ' ∈ Dg F γ) : LinearMap.ker (FcL F γ) = LinearMap.ker (FcL F γ') := by
  refine Submodule.eq_of_le_of_finrank_eq (fun x hx => h x hx) ?_
  rw [finrank_ker_eq_one hγ, finrank_ker_eq_one hγ']

theorem Dg_eq_of_mem {γ γ' : Fin 3 → K} (hγ : γ ∈ Om F) (hγ' : γ' ∈ Om F)
    (h : γ' ∈ Dg F γ) : Dg F γ = Dg F γ' := by
  unfold Dg
  rw [ker_eq_of_mem_Dg hγ hγ' h]

/-- The lines `K·η ⊆ P` with `η ∉ Ω`. -/
def badLines (P : Submodule K (Fin 3 → K)) : Set (Submodule K (Fin 3 → K)) :=
  {L | ∃ η ∈ P, η ≠ 0 ∧ η ∉ Om F ∧ L = K ∙ η}

/-- **Folgerung 2'.** -/
theorem inf_mem_badLines (H : Hyp F) {γ γ' : Fin 3 → K} (hγ : γ ∈ Om F) (hγ' : γ' ∈ Om F)
    (hne : Dg F γ ≠ Dg F γ') : Dg F γ ⊓ Dg F γ' ∈ badLines (F := F) (Dg F γ') := by
  have h1 := finrank_inf_of_ne _ _ (finrank_Dg H hγ) (finrank_Dg H hγ') hne
  obtain ⟨η, hη0, hηeq⟩ := exists_eq_span_of_finrank_one _ h1
  have hηmem : η ∈ Dg F γ ⊓ Dg F γ' := hηeq ▸ Submodule.mem_span_singleton_self η
  refine ⟨η, hηmem.2, hη0, fun hηO => hne ?_, hηeq⟩
  rw [Dg_eq_of_mem hγ hηO hηmem.1, Dg_eq_of_mem hγ' hηO hηmem.2]

theorem finrank_of_mem_badLines {P L : Submodule K (Fin 3 → K)}
    (h : L ∈ badLines (F := F) P) : finrank K L = 1 := by
  obtain ⟨η, -, hη0, -, rfl⟩ := h
  exact finrank_span_singleton hη0

/-! ### Step 3: finiteness on lines -/

/-- **Step 3.** For `γ ∈ Ω`, only finitely many points `γ + tδ` are not in `Ω`. -/
theorem finite_bad (H : Hyp F) {γ : Fin 3 → K} (hγ : γ ∈ Om F) (δ : Fin 3 → K) :
    {t : K | γ + t • δ ∉ Om F}.Finite := by
  set A := FcL F γ with hA
  set B := FcL F δ with hB
  obtain ⟨C, hC⟩ := Submodule.exists_isCompl (LinearMap.ker A)
  have hCdim : finrank K C = 3 := by
    have h := Submodule.finrank_add_eq_of_isCompl hC
    rw [finrank_ker_eq_one hγ, Module.finrank_fin_fun] at h
    omega
  have hEinj : LinearMap.ker (A ∘ₗ C.subtype) = ⊥ := by
    rw [LinearMap.ker_eq_bot']
    intro x hx
    have hxA : (x : Fin 4 → K) ∈ LinearMap.ker A := hx
    have := Submodule.disjoint_def.1 hC.disjoint x hxA x.2
    exact Subtype.ext this
  obtain ⟨g, hg⟩ := (A ∘ₗ C.subtype).exists_leftInverse_of_injective hEinj
  let M : Module.End K C := g ∘ₗ B ∘ₗ C.subtype
  have key : ∀ t : K, γ + t • δ ∉ Om F → M.HasEigenvalue (-t⁻¹) := by
    intro t ht
    have hlt : finrank K (LinearMap.range (A + t • B)) < 3 := by
      have h1 := H.rk_le (γ + t • δ)
      have h2 : FcL F (γ + t • δ) = A + t • B := by rw [map_add, map_smul]
      have ht' : finrank K (LinearMap.range (FcL F (γ + t • δ))) ≠ 3 := ht
      rw [h2] at h1 ht'
      exact lt_of_le_of_ne h1 ht'
    have hnot : LinearMap.ker ((A + t • B) ∘ₗ C.subtype) ≠ ⊥ := by
      intro hb
      have h1 := LinearMap.finrank_range_of_inj (LinearMap.ker_eq_bot.1 hb)
      have h2 := Submodule.finrank_mono (LinearMap.range_comp_le_range C.subtype (A + t • B))
      rw [h1, hCdim] at h2
      omega
    obtain ⟨x, hx, hx0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hnot
    have hx' : A x + t • B x = 0 := hx
    have hgx : g (A x) = x := LinearMap.congr_fun hg x
    have hMx : x + t • M x = 0 := by
      have := congrArg g hx'
      rw [map_add, map_smul, hgx, map_zero] at this
      exact this
    have ht0 : t ≠ 0 := by
      rintro rfl
      rw [zero_smul, add_zero] at hMx
      exact hx0 hMx
    have hMx' : M x = (-t⁻¹) • x := by
      have h1 : t • M x = -x := eq_neg_of_add_eq_zero_right hMx
      calc M x = t⁻¹ • (t • M x) := by rw [smul_smul, inv_mul_cancel₀ ht0, one_smul]
        _ = (-t⁻¹) • x := by rw [h1, smul_neg, ← neg_smul]
    exact Module.End.hasEigenvalue_of_hasEigenvector
      ⟨Module.End.mem_eigenspace_iff.2 hMx', hx0⟩
  refine ((M.finite_hasEigenvalue).preimage (f := fun t : K => -t⁻¹) ?_).subset ?_
  · intro a _ b _ hab
    simpa using hab
  · intro t ht
    exact key t ht

/-- **Folgerung 3'.** -/
theorem badLines_finite (H : Hyp F) {P : Submodule K (Fin 3 → K)} (hP : finrank K P = 2)
    {γ : Fin 3 → K} (hγP : γ ∈ P) (hγ : γ ∈ Om F) : (badLines (F := F) P).Finite := by
  have hγ0 := ne_zero_of_mem_Om hγ
  have hlt : (K ∙ γ) < P := by
    refine lt_of_le_of_ne ((Submodule.span_singleton_le_iff_mem _ _).2 hγP) fun h => ?_
    have := finrank_span_singleton (K := K) hγ0
    rw [h, hP] at this
    exact absurd this (by norm_num)
  obtain ⟨ε, hεP, hεn⟩ := SetLike.exists_of_lt hlt
  have hsup : (K ∙ γ) ⊔ (K ∙ ε) = P := by
    refine Submodule.eq_of_le_of_finrank_eq (sup_le hlt.le
      ((Submodule.span_singleton_le_iff_mem _ _).2 hεP)) ?_
    have h1 : (K ∙ γ) < (K ∙ γ) ⊔ (K ∙ ε) :=
      lt_of_le_of_ne le_sup_left fun h =>
        hεn (h ▸ Submodule.mem_sup_right (Submodule.mem_span_singleton_self ε))
    have h2 := Submodule.finrank_lt_finrank_of_lt h1
    have h3 := Submodule.finrank_mono (sup_le hlt.le
      ((Submodule.span_singleton_le_iff_mem _ _).2 hεP))
    rw [finrank_span_singleton hγ0] at h2
    rw [hP] at h3 ⊢
    omega
  refine ((Set.finite_singleton (K ∙ ε)).union
    ((finite_bad H hγ ε).image fun t => K ∙ (γ + t • ε))).subset ?_
  rintro L ⟨η, hηP, hη0, hηO, rfl⟩
  rw [← hsup] at hηP
  obtain ⟨y, hy, z, hz, rfl⟩ := Submodule.mem_sup.1 hηP
  obtain ⟨a, rfl⟩ := Submodule.mem_span_singleton.1 hy
  obtain ⟨b, rfl⟩ := Submodule.mem_span_singleton.1 hz
  by_cases ha : a = 0
  · left
    subst ha
    have hb : b ≠ 0 := by rintro rfl; simp at hη0
    rw [zero_smul, zero_add, Set.mem_singleton_iff]
    exact Submodule.span_singleton_smul_eq (IsUnit.mk0 b hb) ε
  · right
    have heq : a • γ + b • ε = a • (γ + (b / a) • ε) := by
      rw [smul_add, smul_smul, mul_div_cancel₀ _ ha]
    rw [heq] at hηO ⊢
    refine ⟨b / a, ?_, (Submodule.span_singleton_smul_eq (IsUnit.mk0 a ha) _).symm⟩
    exact fun h => hηO ((smul_mem_Om_iff ha).2 h)

/-! ### Steps 4 and 5: the infinite family of planes and the point `γ*` -/

section Family

variable (H : Hyp F) {γ₀ δ : Fin 3 → K} (hγ₀ : γ₀ ∈ Om F) (hδ : δ ∉ Dg F γ₀)
include H hγ₀ hδ

/-- **Step 4.** Distinct parameters in `T` give distinct planes. -/
theorem Dg_ne {t s : K} (hts : t ≠ s) (ht : γ₀ + t • δ ∈ Om F) (hs : γ₀ + s • δ ∈ Om F) :
    Dg F (γ₀ + t • δ) ≠ Dg F (γ₀ + s • δ) := by
  intro heq
  have hs' : γ₀ + s • δ ∈ Dg F (γ₀ + t • δ) := heq ▸ self_mem_Dg _
  have ht' := self_mem_Dg (F := F) (γ₀ + t • δ)
  have hsub : (t - s) • δ = (γ₀ + t • δ) - (γ₀ + s • δ) := by
    rw [sub_smul]; abel
  have hδ' : δ ∈ Dg F (γ₀ + t • δ) := by
    have h1 : (t - s) • δ ∈ Dg F (γ₀ + t • δ) := hsub ▸ Submodule.sub_mem _ ht' hs'
    have h2 := Submodule.smul_mem _ (t - s)⁻¹ h1
    rwa [smul_smul, inv_mul_cancel₀ (sub_ne_zero.2 hts), one_smul] at h2
  have hγ₀' : γ₀ ∈ Dg F (γ₀ + t • δ) := by
    have := Submodule.sub_mem _ ht' (Submodule.smul_mem _ t hδ')
    rwa [add_sub_cancel_right] at this
  rw [Dg_eq_of_mem ht hγ₀ hγ₀'] at hδ'
  exact hδ hδ'

theorem T_infinite [Infinite K] : {t : K | γ₀ + t • δ ∈ Om F}.Infinite := by
  have h := (finite_bad H hγ₀ δ).infinite_compl
  convert h using 1
  ext t
  simp

/-- **Step 5.** There is `γ* ≠ 0` in every plane `D(γ)`, `γ ∈ Ω`. -/
theorem exists_gstar [Infinite K] : ∃ η : Fin 3 → K, η ≠ 0 ∧ ∀ γ ∈ Om F, η ∈ Dg F γ := by
  classical
  set T := {t : K | γ₀ + t • δ ∈ Om F} with hTdef
  have hT' : (T \ {0}).Infinite := (T_infinite H hγ₀ hδ).diff (Set.finite_singleton 0)
  have hγ₀T : (0 : K) ∈ T := by simp [hTdef, hγ₀]
  have hfin := badLines_finite H (finrank_Dg H hγ₀) (self_mem_Dg γ₀) hγ₀
  have hmem : ∀ t : (T \ {0} : Set K), Dg F (γ₀ + (t : K) • δ) ⊓ Dg F γ₀ ∈
      badLines (F := F) (Dg F γ₀) := by
    intro t
    have ht := t.2
    have h0 : (0 : K) • δ = 0 := zero_smul K δ
    refine inf_mem_badLines H ht.1 hγ₀ ?_
    have := Dg_ne H hγ₀ hδ (s := 0) ht.2 ht.1 hγ₀T
    rwa [h0, add_zero] at this
  haveI : Infinite (T \ {0} : Set K) := hT'.to_subtype
  haveI : Finite (badLines (F := F) (Dg F γ₀)) := hfin.to_subtype
  let f : (T \ {0} : Set K) → badLines (F := F) (Dg F γ₀) := fun t => ⟨_, hmem t⟩
  obtain ⟨y, hy⟩ := Finite.exists_infinite_fiber f
  obtain ⟨η, -, hη0, -, hyη⟩ := y.2
  set Ts : Set K := Subtype.val '' (f ⁻¹' {y}) with hTs
  have hTsinf : Ts.Infinite :=
    (Set.infinite_coe_iff.1 hy).image Subtype.val_injective.injOn
  have hTsT : ∀ t ∈ Ts, t ∈ T ∧ t ≠ 0 ∧ Dg F (γ₀ + t • δ) ⊓ Dg F γ₀ = K ∙ η := by
    rintro _ ⟨t, ht, rfl⟩
    refine ⟨t.2.1, t.2.2, ?_⟩
    have : f t = y := ht
    rw [← hyη, ← this]
  have hηTs : ∀ t ∈ Ts, η ∈ Dg F (γ₀ + t • δ) := by
    intro t ht
    have h := (hTsT t ht).2.2
    have : η ∈ Dg F (γ₀ + t • δ) ⊓ Dg F γ₀ := h ▸ Submodule.mem_span_singleton_self η
    exact this.1
  refine ⟨η, hη0, fun γ hγ => ?_⟩
  by_contra hηγ
  have hne : ∀ t ∈ Ts, Dg F (γ₀ + t • δ) ≠ Dg F γ := fun t ht heq =>
    hηγ (heq ▸ hηTs t ht)
  have hmaps : Set.MapsTo (fun t => Dg F (γ₀ + t • δ) ⊓ Dg F γ) Ts
      (badLines (F := F) (Dg F γ)) := fun t ht =>
    inf_mem_badLines H (hTsT t ht).1 hγ (hne t ht)
  have hinj : Set.InjOn (fun t => Dg F (γ₀ + t • δ) ⊓ Dg F γ) Ts := by
    intro t ht s hs hts
    by_contra hts'
    simp only at hts
    have hpl := Dg_ne H hγ₀ hδ hts' (hTsT t ht).1 (hTsT s hs).1
    have h1 := finrank_inf_of_ne _ _ (finrank_Dg H (hTsT t ht).1) (finrank_Dg H (hTsT s hs).1)
      hpl
    have h2 : Dg F (γ₀ + t • δ) ⊓ Dg F (γ₀ + s • δ) = K ∙ η :=
      (Submodule.eq_of_le_of_finrank_eq ((Submodule.span_singleton_le_iff_mem _ _).2
        (Submodule.mem_inf.2 ⟨hηTs t ht, hηTs s hs⟩))
        (by rw [h1, finrank_span_singleton hη0])).symm
    have h3 : Dg F (γ₀ + t • δ) ⊓ Dg F γ ≤ K ∙ η := by
      rw [← h2]
      refine le_inf inf_le_left ?_
      rw [hts]
      exact inf_le_left
    have h4 := finrank_of_mem_badLines (hmaps ht)
    have h5 : Dg F (γ₀ + t • δ) ⊓ Dg F γ = K ∙ η :=
      Submodule.eq_of_le_of_finrank_eq h3 (by rw [h4, finrank_span_singleton hη0])
    have h6 : η ∈ Dg F (γ₀ + t • δ) ⊓ Dg F γ := h5 ▸ Submodule.mem_span_singleton_self η
    exact hηγ h6.2
  exact Set.infinite_of_injOn_mapsTo hinj hmaps hTsinf
    (badLines_finite H (finrank_Dg H hγ) (self_mem_Dg γ) hγ)

end Family

/-! ### The eigenvalue argument (replaces the Kronecker normal form) -/

omit [Field K] in
/-- **Step 8 (c), abstract.** Let `A, B : E → Q` with `E` finite-dimensional, such that every
`x` has a partner `y` with `A x + B y = 0`, and such that infinitely many `t` give vectors
`k_t ≠ 0`, `a_t ≠ 0` with `a_t A k_t + b_t B k_t = 0` and pairwise distinct `b_t / a_t`. Then
`Z = ker((x, y) ↦ A x + B y)` has dimension at least `dim E + 1`. -/
theorem pencil_bound {K : Type u} [Field K] {Q : Type v} [AddCommGroup Q] [Module K Q]
    {E : Type*} [AddCommGroup E] [Module K E] [FiniteDimensional K E]
    (A B : E →ₗ[K] Q) (S : Set K) (hS : S.Infinite) (a b : K → K) (k : K → E)
    (ha : ∀ t ∈ S, a t ≠ 0) (hk : ∀ t ∈ S, k t ≠ 0)
    (hab : ∀ t ∈ S, a t • A (k t) + b t • B (k t) = 0)
    (hinj : Set.InjOn (fun t => b t / a t) S) (hsurj : ∀ x, ∃ y, A x + B y = 0) :
    finrank K E + 1 ≤
      finrank K (LinearMap.ker (A ∘ₗ LinearMap.fst K E E + B ∘ₗ LinearMap.snd K E E)) := by
  set Φ := A ∘ₗ LinearMap.fst K E E + B ∘ₗ LinearMap.snd K E E with hΦdef
  have hΦ : ∀ z : E × E, Φ z = A z.1 + B z.2 := fun z => rfl
  set Z := LinearMap.ker Φ with hZ
  by_contra hle
  push_neg at hle
  let f₁ : Z →ₗ[K] E := LinearMap.fst K E E ∘ₗ Z.subtype
  let f₂ : Z →ₗ[K] E := LinearMap.snd K E E ∘ₗ Z.subtype
  have hf₁surj : Function.Surjective f₁ := by
    intro x
    obtain ⟨y, hy⟩ := hsurj x
    exact ⟨⟨(x, y), show Φ (x, y) = 0 by rw [hΦ]; exact hy⟩, rfl⟩
  have hrange : finrank K (LinearMap.range f₁) = finrank K E := by
    rw [LinearMap.range_eq_top.2 hf₁surj, finrank_top]
  have hf₁inj : Function.Injective f₁ := by
    have hkr := LinearMap.finrank_range_add_finrank_ker f₁
    rw [hrange] at hkr
    have hk0 : finrank K (LinearMap.ker f₁) = 0 := by omega
    exact LinearMap.ker_eq_bot.1 (Submodule.finrank_eq_zero.1 hk0)
  let e : Z ≃ₗ[K] E := LinearEquiv.ofBijective f₁ ⟨hf₁inj, hf₁surj⟩
  let Tm : Module.End K E := f₂ ∘ₗ e.symm.toLinearMap
  have hmaps : Set.MapsTo (fun t => b t / a t) S {μ | Tm.HasEigenvalue μ} := by
    intro t ht
    have hz : (a t • k t, b t • k t) ∈ Z := by
      show Φ _ = 0
      rw [hΦ, map_smul, map_smul]
      exact hab t ht
    have hez : e.symm (a t • k t) = ⟨_, hz⟩ := by
      rw [LinearEquiv.symm_apply_eq]
      rfl
    have h1 : Tm (a t • k t) = b t • k t := by
      show f₂ (e.symm _) = _
      rw [hez]; rfl
    rw [map_smul] at h1
    have hT : Tm (k t) = (b t / a t) • k t := by
      calc Tm (k t) = (a t)⁻¹ • (a t • Tm (k t)) := by
            rw [smul_smul, inv_mul_cancel₀ (ha t ht), one_smul]
        _ = (b t / a t) • k t := by rw [h1, smul_smul, div_eq_inv_mul]
    exact Module.End.hasEigenvalue_of_hasEigenvector
      ⟨Module.End.mem_eigenspace_iff.2 hT, hk t ht⟩
  exact Set.infinite_of_injOn_mapsTo hinj hmaps hS Tm.finite_hasEigenvalue

omit [Field K] in
theorem comb_eq {K : Type u} [Field K] (u v w : Fin 3 → K) (a1 b1 c1 a2 b2 c2 : K)
    (ha2 : a2 ≠ 0) (hb : b1 * a2 = b2 * a1) :
    a1 • u + b1 • v + c1 • w =
      (a1 / a2) • (a2 • u + b2 • v + c2 • w) + (c1 - a1 / a2 * c2) • w := by
  have hb' : a1 / a2 * b2 = b1 := by
    rw [div_mul_eq_mul_div, div_eq_iff ha2]
    linear_combination -hb
  rw [smul_add, smul_add, smul_smul, smul_smul, smul_smul, div_mul_cancel₀ a1 ha2, hb',
    sub_smul]
  abel

/-! ### Steps 6 to 10 -/

theorem Ks_le_ker {η : Fin 3 → K} (hη : ∀ γ ∈ Om F, η ∈ Dg F γ) :
    Ks F ≤ LinearMap.ker (FcL F η) :=
  iSup₂_le fun γ hγ x hx => hη γ hγ x hx

theorem ker_le_Ks {γ : Fin 3 → K} (hγ : γ ∈ Om F) : LinearMap.ker (FcL F γ) ≤ Ks F :=
  le_iSup₂ (f := fun γ (_ : γ ∈ Om F) => LinearMap.ker (FcL F γ)) γ hγ

theorem range_sum_le (W : Submodule K Q) (hW : ∀ i, ∀ x, F i x ∈ W) :
    (⨆ i, LinearMap.range (F i) : Submodule K Q) ≤ W :=
  iSup_le fun i => by rintro _ ⟨x, rfl⟩; exact hW i x

set_option maxHeartbeats 1600000 in
/-- **Main theorem (abstract Lemma P).** -/
theorem main [Infinite K] [FiniteDimensional K Q] (H : Hyp F) :
    ∃ γs : Fin 3 → K, γs ≠ 0 ∧ Ks F ≤ LinearMap.ker (FcL F γs) ∧
      ((finrank K (Ks F) = 2 ∧ ∃ q : Q, q ≠ 0 ∧ ∀ i, ∀ x ∈ Ks F, F i x ∈ K ∙ q) ∨
       (finrank K (Ks F) = 3 ∧ finrank K (LinearMap.range (FcL F γs)) = 1 ∧
        ∃ Q2 : Submodule K Q, finrank K Q2 = 2 ∧ ∀ i, ∀ x ∈ Ks F, F i x ∈ Q2)) := by
  classical
  -- Step 4: the family
  obtain ⟨γ₀, hγ₀⟩ := H.nonempty
  have hDlt : Dg F γ₀ ≠ ⊤ := by
    intro h
    have := finrank_Dg H hγ₀
    rw [h, finrank_top, Module.finrank_fin_fun] at this
    exact absurd this (by norm_num)
  obtain ⟨δ, hδ⟩ : ∃ δ, δ ∉ Dg F γ₀ := by
    by_contra h
    push_neg at h
    exact hDlt (eq_top_iff.2 fun x _ => h x)
  set γt : K → Fin 3 → K := fun t => γ₀ + t • δ with hγt
  set T := {t : K | γ₀ + t • δ ∈ Om F} with hTdef
  have hTinf : T.Infinite := T_infinite H hγ₀ hδ
  -- Step 5: `γ*`
  obtain ⟨η, hη0, hη⟩ := exists_gstar H hγ₀ hδ
  have hKsη := Ks_le_ker hη
  -- the kernel vectors `k_t`
  have hkex : ∀ t : T, ∃ k : Fin 4 → K, k ≠ 0 ∧ LinearMap.ker (FcL F (γt t)) = K ∙ k :=
    fun t => exists_eq_span_of_finrank_one _ (finrank_ker_eq_one t.2)
  choose kv hkv0 hkv using hkex
  have hkvKs : ∀ t : T, kv t ∈ Ks F := fun t =>
    ker_le_Ks t.2 ((hkv t).symm ▸ Submodule.mem_span_singleton_self (kv t))
  have hDne : ∀ t s : T, t ≠ s → Dg F (γt t) ≠ Dg F (γt s) := fun t s hts =>
    Dg_ne H hγ₀ hδ (fun h => hts (Subtype.ext h)) t.2 s.2
  -- Step 6: `dim K* ≥ 2`
  haveI : Infinite T := hTinf.to_subtype
  obtain ⟨t₁, ht₁⟩ : ∃ t₁ : T, kv t₁ ∈ Submodule.span K (kv '' (Set.univ \ {t₁})) := by
    by_contra h
    push_neg at h
    exact Module.Finite.not_linearIndependent_of_infinite kv
      (linearIndependent_iff_notMem_span.2 h)
  obtain ⟨t₀, ht₀⟩ : ∃ t₀ : T, t₀ ≠ t₁ := by
    obtain ⟨a, b, hab⟩ := exists_pair_ne T
    by_cases h : a = t₁
    · exact ⟨b, fun hb => hab (h.trans hb.symm)⟩
    · exact ⟨a, h⟩
  have hm2 : 2 ≤ finrank K (Ks F) := by
    have hne : LinearMap.ker (FcL F (γt t₀)) ≠ LinearMap.ker (FcL F (γt t₁)) := by
      intro heq
      apply hDne t₀ t₁ ht₀
      unfold Dg
      rw [heq]
    have hlt : LinearMap.ker (FcL F (γt t₀)) <
        LinearMap.ker (FcL F (γt t₀)) ⊔ LinearMap.ker (FcL F (γt t₁)) := by
      refine lt_of_le_of_ne le_sup_left fun h => hne ?_
      exact Submodule.eq_of_le_of_finrank_eq (h ▸ le_sup_right)
        (by rw [finrank_ker_eq_one t₀.2, finrank_ker_eq_one t₁.2]) |>.symm
    have h1 := Submodule.finrank_lt_finrank_of_lt hlt
    have h2 := Submodule.finrank_mono (sup_le (ker_le_Ks (γ := γt t₀) t₀.2)
      (ker_le_Ks (γ := γt t₁) t₁.2))
    rw [finrank_ker_eq_one t₀.2] at h1
    omega
  have hηO : η ∉ Om F := by
    intro h
    have := Submodule.finrank_mono hKsη
    rw [finrank_ker_eq_one h] at this
    omega
  -- Step 7: the basis `γ_A, γ_B, γ*`
  set γA := γt t₀ with hγA
  set γB := γt t₁ with hγB
  have hγAO : γA ∈ Om F := t₀.2
  have hγBO : γB ∈ Om F := t₁.2
  set A := FcL F γA with hAdef
  set B := FcL F γB with hBdef
  -- coefficient lemma: `γ ∈ span(γ_B, γ*) ⇒ γ ∈ D(γ_B)`
  have hspanB : ∀ b c : K, b • γB + c • η ∈ Dg F γB := fun b c =>
    Submodule.add_mem _ (Submodule.smul_mem _ _ (self_mem_Dg γB))
      (Submodule.smul_mem _ _ (hη γB hγBO))
  have hli : LinearIndependent K ![γA, γB, η] := by
    rw [Fintype.linearIndependent_iff]
    intro c hc
    simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons] at hc
    have hc0 : c 0 = 0 := by
      rcases eq_or_ne (c 0) 0 with h0 | h0
      · exact h0
      exfalso
      have hmem : γA ∈ Dg F γB := by
        have : γA = (-(c 0)⁻¹ * c 1) • γB + (-(c 0)⁻¹ * c 2) • η := by
          have h' : c 0 • γA = -(c 1 • γB + c 2 • η) := by
            rw [eq_neg_iff_add_eq_zero, ← add_assoc]; exact hc
          calc γA = (c 0)⁻¹ • (c 0 • γA) := by rw [smul_smul, inv_mul_cancel₀ h0, one_smul]
            _ = _ := by rw [h', smul_neg, smul_add, smul_smul, smul_smul, neg_add, ← neg_smul,
                ← neg_smul, neg_mul, neg_mul]
        rw [this]; exact hspanB _ _
      exact hDne t₁ t₀ ht₀.symm (Dg_eq_of_mem hγBO hγAO hmem)
    have hc1 : c 1 = 0 := by
      rcases eq_or_ne (c 1) 0 with h1 | h1
      · exact h1
      exfalso
      rw [hc0, zero_smul, zero_add] at hc
      have : γB = (-(c 1)⁻¹ * c 2) • η := by
        have h' : c 1 • γB = -(c 2 • η) := eq_neg_of_add_eq_zero_left hc
        calc γB = (c 1)⁻¹ • (c 1 • γB) := by rw [smul_smul, inv_mul_cancel₀ h1, one_smul]
          _ = _ := by rw [h', smul_neg, smul_smul, ← neg_smul, neg_mul]
      have hc2 : -(c 1)⁻¹ * c 2 ≠ 0 := by
        intro h0; rw [h0, zero_smul] at this; exact ne_zero_of_mem_Om hγBO this
      exact hηO ((smul_mem_Om_iff hc2).1 (this ▸ hγBO))
    have hc2 : c 2 = 0 := by
      rw [hc0, hc1, zero_smul, zero_smul, zero_add, zero_add] at hc
      exact (smul_eq_zero.1 hc).resolve_right hη0
    intro i
    fin_cases i
    · exact hc0
    · exact hc1
    · exact hc2
  have hspan := hli.span_eq_top_of_card_eq_finrank' (by simp)
  have hcoef : ∀ γ : Fin 3 → K, ∃ c : Fin 3 → K, c 0 • γA + c 1 • γB + c 2 • η = γ := by
    intro γ
    have : γ ∈ Submodule.span K (Set.range ![γA, γB, η]) := hspan ▸ Submodule.mem_top
    obtain ⟨c, hc⟩ := (Submodule.mem_span_range_iff_exists_fun K).1 this
    refine ⟨c, ?_⟩
    rw [← hc, Fin.sum_univ_three]
    simp
  choose cf hcf using hcoef
  -- `F_γ x = a A x + b B x` on `K*`
  have hFγ : ∀ γ, ∀ x ∈ Ks F, FcL F γ x = cf γ 0 • A x + cf γ 1 • B x := by
    intro γ x hx
    conv_lhs => rw [← hcf γ]
    rw [map_add, map_add, map_smul, map_smul, map_smul, LinearMap.add_apply,
      LinearMap.add_apply, LinearMap.smul_apply, LinearMap.smul_apply, LinearMap.smul_apply,
      hKsη hx, smul_zero, add_zero]
  -- `a_γ ≠ 0` off the plane `D(γ_B)`
  have ha0 : ∀ γ ∈ Om F, Dg F γ ≠ Dg F γB → cf γ 0 ≠ 0 := by
    intro γ hγ hne h0
    have hmem : γ ∈ Dg F γB := by
      rw [← hcf γ, h0, zero_smul, zero_add]; exact hspanB _ _
    exact hne (Dg_eq_of_mem hγBO hγ hmem).symm
  -- Step 8: the map `Φ`
  set m := finrank K (Ks F) with hm
  clear_value m
  set Φ : (Ks F × Ks F) →ₗ[K] Q :=
    (A ∘ₗ (Ks F).subtype) ∘ₗ LinearMap.fst K (Ks F) (Ks F) +
      (B ∘ₗ (Ks F).subtype) ∘ₗ LinearMap.snd K (Ks F) (Ks F) with hΦdef
  have hΦ : ∀ z : Ks F × Ks F, Φ z = A z.1 + B z.2 := fun z => rfl
  clear_value Φ
  set Z := LinearMap.ker Φ with hZ
  set W := LinearMap.range Φ with hW
  have hWZ : finrank K W + finrank K Z = 2 * m := by
    have := LinearMap.finrank_range_add_finrank_ker Φ
    rw [Module.finrank_prod, ← hZ, ← hW, ← hm] at this
    omega
  -- `F_i(K*) ⊆ W`
  have hFW : ∀ i, ∀ x ∈ Ks F, F i x ∈ W := by
    intro i x hx
    refine ⟨(cf (Pi.single i 1) 0 • ⟨x, hx⟩, cf (Pi.single i 1) 1 • ⟨x, hx⟩), ?_⟩
    rw [hΦ, ← FcL_single F i, hFγ _ x hx]
    simp only [Submodule.coe_smul, map_smul]
  -- elements of `Z`
  have hZmem : ∀ γ (hγ : γ ∈ Om F) k (hk : k ∈ LinearMap.ker (FcL F γ)),
      (cf γ 0 • (⟨k, ker_le_Ks hγ hk⟩ : Ks F), cf γ 1 • (⟨k, ker_le_Ks hγ hk⟩ : Ks F)) ∈ Z := by
    intro γ hγ k hk
    show Φ _ = 0
    rw [hΦ]
    simp only [Submodule.coe_smul, map_smul]
    rw [← hFγ γ k (ker_le_Ks hγ hk)]
    exact hk
  -- `p₁(Z) = K*`
  set R : Submodule K (Fin 4 → K) :=
    Z.map ((Ks F).subtype ∘ₗ LinearMap.fst K (Ks F) (Ks F)) with hR
  have hkerR : ∀ γ ∈ Om F, Dg F γ ≠ Dg F γB → LinearMap.ker (FcL F γ) ≤ R := by
    intro γ hγ hne x hx
    have ha := ha0 γ hγ hne
    have hx' : (cf γ 0)⁻¹ • x ∈ LinearMap.ker (FcL F γ) := Submodule.smul_mem _ _ hx
    refine ⟨_, hZmem γ hγ _ hx', ?_⟩
    show cf γ 0 • ((cf γ 0)⁻¹ • x) = x
    rw [smul_smul, mul_inv_cancel₀ ha, one_smul]
  have hKsR : Ks F ≤ R := by
    refine iSup₂_le fun γ hγ => ?_
    by_cases hne : Dg F γ = Dg F γB
    · have hmem : γ ∈ Dg F γB := hne ▸ self_mem_Dg γ
      rw [← ker_eq_of_mem_Dg hγBO hγ hmem, hkv t₁]
      rw [Submodule.span_singleton_le_iff_mem]
      refine Submodule.span_le.2 ?_ ht₁
      rintro _ ⟨s, hs, rfl⟩
      have hs1 : s ≠ t₁ := fun h => hs.2 h
      exact hkerR _ s.2 (hDne s t₁ hs1)
        ((hkv s).symm ▸ Submodule.mem_span_singleton_self (kv s))
    · exact hkerR γ hγ hne
  have hsurj : ∀ x : Ks F, ∃ y : Ks F,
      (A ∘ₗ (Ks F).subtype) x + (B ∘ₗ (Ks F).subtype) y = 0 := by
    intro x
    obtain ⟨z, hz, hzx⟩ := hKsR x.2
    refine ⟨z.2, ?_⟩
    have hz1 : z.1 = x := Subtype.ext hzx
    have h0 : Φ z = 0 := hz
    rw [hΦ, hz1] at h0
    exact h0
  -- (c): `dim Z ≥ m + 1`
  have hZbig : m + 1 ≤ finrank K Z := by
    set S := T \ {(t₁ : K)} with hS
    have hSmem : ∀ t ∈ S, ∃ ht : t ∈ T, (⟨t, ht⟩ : T) ≠ t₁ := fun t ht =>
      ⟨ht.1, fun h => ht.2 (by rw [← h]; rfl)⟩
    let kk : K → Ks F := fun t =>
      if ht : t ∈ T then ⟨kv ⟨t, ht⟩, hkvKs ⟨t, ht⟩⟩ else 0
    have hkk : ∀ t (ht : t ∈ T), kk t = ⟨kv ⟨t, ht⟩, hkvKs ⟨t, ht⟩⟩ := fun t ht => dif_pos ht
    have ha : ∀ t ∈ S, cf (γt t) 0 ≠ 0 := by
      intro t htS
      obtain ⟨ht, htne⟩ := hSmem t htS
      exact ha0 _ ht (hDne ⟨t, ht⟩ t₁ htne)
    have hk0 : ∀ t ∈ S, kk t ≠ 0 := by
      intro t htS h
      obtain ⟨ht, -⟩ := hSmem t htS
      rw [hkk t ht] at h
      exact hkv0 ⟨t, ht⟩ (congrArg Subtype.val h)
    have hab : ∀ t ∈ S, cf (γt t) 0 • (A ∘ₗ (Ks F).subtype) (kk t) +
        cf (γt t) 1 • (B ∘ₗ (Ks F).subtype) (kk t) = 0 := by
      intro t htS
      obtain ⟨ht, -⟩ := hSmem t htS
      rw [hkk t ht]
      show cf (γt t) 0 • A (kv ⟨t, ht⟩) + cf (γt t) 1 • B (kv ⟨t, ht⟩) = 0
      rw [← hFγ _ _ (hkvKs ⟨t, ht⟩)]
      have : kv ⟨t, ht⟩ ∈ LinearMap.ker (FcL F (γt t)) :=
        (hkv ⟨t, ht⟩).symm ▸ Submodule.mem_span_singleton_self _
      exact this
    have hinj : Set.InjOn (fun t => cf (γt t) 1 / cf (γt t) 0) S := by
      intro t htS s hsS hμ
      rcases eq_or_ne t s with hts | hts
      · exact hts
      exfalso
      obtain ⟨ht, htne⟩ := hSmem t htS
      obtain ⟨hs, hsne⟩ := hSmem s hsS
      have hat := ha t htS
      have has := ha s hsS
      simp only at hμ
      rw [div_eq_div_iff hat has] at hμ
      apply hDne ⟨s, hs⟩ ⟨t, ht⟩ (fun h => hts (congrArg Subtype.val h).symm)
      refine Dg_eq_of_mem hs ht ?_
      have hrepr : γt t = (cf (γt t) 0 / cf (γt s) 0) • γt s +
          (cf (γt t) 2 - cf (γt t) 0 / cf (γt s) 0 * cf (γt s) 2) • η := by
        calc γt t = cf (γt t) 0 • γA + cf (γt t) 1 • γB + cf (γt t) 2 • η := (hcf _).symm
          _ = _ := comb_eq γA γB η _ _ _ _ _ _ has hμ
          _ = _ := by rw [hcf (γt s)]
      show γt t ∈ Dg F (γt s)
      rw [hrepr]
      exact Submodule.add_mem _ (Submodule.smul_mem _ _ (self_mem_Dg _))
        (Submodule.smul_mem _ _ (hη _ hs))
    have := pencil_bound (A ∘ₗ (Ks F).subtype) (B ∘ₗ (Ks F).subtype) S
      (hTinf.diff (Set.finite_singleton _)) (fun t => cf (γt t) 0) (fun t => cf (γt t) 1) kk
      ha hk0 hab hinj hsurj
    rw [← hΦdef, ← hZ, ← hm] at this
    exact this
  -- (d): `dim W ≥ m − 1`
  have hWge : m - 1 ≤ finrank K W := by
    have hle : LinearMap.range (A ∘ₗ (Ks F).subtype) ≤ W := by
      rintro _ ⟨x, rfl⟩
      exact ⟨(x, 0), by rw [hΦ]; simp⟩
    have h1 := LinearMap.finrank_range_add_finrank_ker (A ∘ₗ (Ks F).subtype)
    have h2 : finrank K (LinearMap.ker (A ∘ₗ (Ks F).subtype)) = 1 := by
      rw [LinearMap.ker_comp, ← finrank_ker_eq_one hγAO]
      exact (Submodule.comapSubtypeEquivOfLe (ker_le_Ks hγAO)).finrank_eq
    have h3 := Submodule.finrank_mono hle
    omega
  have hWle : finrank K W ≤ m - 1 := by omega
  -- Step 9: `m ≤ 3`
  have hm3 : m ≤ 3 := by
    rcases le_or_gt m 3 with h | h
    · exact h
    exfalso
    have h4 : m ≤ 4 := by
      rw [hm]
      exact (Submodule.finrank_le (Ks F)).trans (by rw [Module.finrank_fin_fun])
    have hm4 : m = 4 := le_antisymm h4 h
    have htop : Ks F = ⊤ := Submodule.eq_top_of_finrank_eq (by rw [← hm, hm4,
      Module.finrank_fin_fun])
    have := Submodule.finrank_mono (range_sum_le W fun i x => hFW i x (htop ▸ Submodule.mem_top))
    rw [H.rkL] at this
    have h5 := this.trans hWle
    rw [hm4] at h5
    norm_num at h5
  refine ⟨η, hη0, hKsη, ?_⟩
  have hm23 : m = 2 ∨ m = 3 := by omega
  rcases hm23 with h2 | h3
  · -- sub-case A
    left
    refine ⟨h2, ?_⟩
    have hW1 : finrank K W = 1 := by omega
    obtain ⟨q, hq0, hWq⟩ := exists_eq_span_of_finrank_one W hW1
    exact ⟨q, hq0, fun i x hx => hWq ▸ hFW i x hx⟩
  · -- sub-case B
    right
    refine ⟨h3, ?_, W, by omega, hFW⟩
    have hker3 : 3 ≤ finrank K (LinearMap.ker (FcL F η)) := by
      have := Submodule.finrank_mono hKsη
      omega
    have hrn := LinearMap.finrank_range_add_finrank_ker (FcL F η)
    rw [Module.finrank_fin_fun] at hrn
    have hne : finrank K (LinearMap.range (FcL F η)) ≠ 0 := by
      intro h0
      have hFη : FcL F η = 0 := by
        rw [← LinearMap.range_eq_bot]
        exact Submodule.finrank_eq_zero.1 h0
      -- then `∑ F_i(U) ⊆ W + span(Ax, Bx)` for `x ∉ K*`
      have hKsne : Ks F ≠ ⊤ := by
        intro htop
        have := finrank_top K (Fin 4 → K)
        rw [← htop, ← hm, h3, Module.finrank_fin_fun] at this
        omega
      obtain ⟨x, -, hx⟩ := SetLike.exists_of_lt (lt_of_le_of_ne (le_top : Ks F ≤ ⊤) hKsne)
      have hsup : Ks F ⊔ (K ∙ x) = ⊤ := by
        apply Submodule.eq_top_of_finrank_eq
        have hlt : Ks F < Ks F ⊔ (K ∙ x) := lt_of_le_of_ne le_sup_left fun h =>
          hx (h ▸ Submodule.mem_sup_right (Submodule.mem_span_singleton_self x))
        have h1 := Submodule.finrank_lt_finrank_of_lt hlt
        have h2 := Submodule.finrank_le (Ks F ⊔ (K ∙ x))
        rw [Module.finrank_fin_fun] at h2 ⊢
        omega
      set W' := W ⊔ (K ∙ A x) ⊔ (K ∙ B x) with hW'
      have hFx : ∀ i, F i x ∈ (K ∙ A x) ⊔ (K ∙ B x) := by
        intro i
        have e := hcf (Pi.single i (1 : K))
        rw [← FcL_single F i, ← e]
        rw [map_add, map_add, map_smul, map_smul, map_smul, hFη, smul_zero, add_zero,
          LinearMap.add_apply, LinearMap.smul_apply, LinearMap.smul_apply]
        exact Submodule.add_mem_sup (Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _))
          (Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _))
      have hle : (⨆ i, LinearMap.range (F i) : Submodule K Q) ≤ W' := by
        refine range_sum_le W' fun i y => ?_
        have hy : y ∈ Ks F ⊔ (K ∙ x) := hsup ▸ Submodule.mem_top
        obtain ⟨k, hk, z, hz, rfl⟩ := Submodule.mem_sup.1 hy
        obtain ⟨c, rfl⟩ := Submodule.mem_span_singleton.1 hz
        rw [map_add, map_smul]
        refine Submodule.add_mem _ ?_ (Submodule.smul_mem _ _ ?_)
        · exact Submodule.mem_sup_left (Submodule.mem_sup_left (hFW i k hk))
        · rw [hW', sup_assoc]
          exact Submodule.mem_sup_right (hFx i)
      have h1 := Submodule.finrank_mono hle
      have h2 : finrank K W' ≤ finrank K W + 1 + 1 := by
        refine (Submodule.finrank_add_le_finrank_add_finrank _ _).trans ?_
        refine add_le_add ((Submodule.finrank_add_le_finrank_add_finrank _ _).trans
          (add_le_add le_rfl ?_)) ?_
        · exact (finrank_span_le_card ({A x} : Set Q)).trans (by simp)
        · exact (finrank_span_le_card ({B x} : Set Q)).trans (by simp)
      rw [H.rkL] at h1
      omega
    omega

end Abstract

/-! ### Application: `LemmaPStatement` -/

section Application

open YangN4Haupt SatzA444 SatzE444 SatzE444Buendel

variable {K : Type u} [Field K]

theorem FcL_eq (alg : BilinearAlgorithm K 4 2 4 25) (γ : Fin 3 → K) :
    FcL (Fq (d := 3) alg) γ = Fc alg γ := rfl

theorem range_Lq_eq (alg : BilinearAlgorithm K 4 2 4 25) :
    LinearMap.range (Lq (d := 3) alg) = ⨆ i, LinearMap.range (Fq (d := 3) alg i) := by
  apply le_antisymm
  · rintro _ ⟨u, rfl⟩
    rw [Lq_eq_sumMap, sumMap_apply]
    exact Submodule.sum_mem _ fun i _ =>
      Submodule.mem_iSup_of_mem i (LinearMap.mem_range_self _ _)
  · refine iSup_le fun i => ?_
    rintro _ ⟨x, rfl⟩
    refine ⟨Pi.single i x, ?_⟩
    rw [Lq_eq_sumMap, sumMap_apply, Finset.sum_eq_single i]
    · simp
    · intro j _ hj; simp [Pi.single_apply, hj]
    · simp

/-- The hypotheses (H1), (H2), (H3) hold for a normalized decomposition of length 25 in the
case (5,8) with `N = 0`. -/
theorem hyp_of_alg (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hN : ∀ x : Fin 4 → K, (∀ i, Fq (d := 3) alg i x = 0) → x = 0) :
    Hyp (Fq (d := 3) alg) := by
  obtain ⟨ρ, hρ⟩ := exists_isGreatest_rkComb (Fq (d := 3) alg)
  obtain ⟨hρ3, -⟩ := satzA alg h1 h2 ρ hρ
  subst hρ3
  refine ⟨fun γ => hρ.2 ⟨γ, rfl⟩, ?_, ?_, ?_⟩
  · obtain ⟨γ, hγ⟩ := hρ.1
    exact ⟨γ, hγ⟩
  · intro γ hγ
    exact sDim_eq_one alg h1 h2 hN (γ := γ) hγ
  · simp only [Prod.mk.injEq] at hcase
    rw [← range_Lq_eq]
    exact hcase.1

/-- **Lemma P** (`LemmaPStatement`) holds over every infinite field. -/
theorem lemmaP (K : Type u) [Field K] [Infinite K] : LemmaPStatement K := by
  intro alg h1 h2 hcase hN
  obtain ⟨γs, hγs0, hle, hAB⟩ := main (hyp_of_alg alg h1 h2 hcase hN)
  rcases hAB with ⟨hdim, q, hq0, hq⟩ | ⟨hdim, hrk, Q2, hQ2, hQ⟩
  · exact Or.inl ⟨hdim, γs, hγs0, hle, q, hq0, hq⟩
  · exact Or.inr ⟨hdim, γs, hγs0, hle, hrk, Q2, hQ2, hQ⟩

/-- **Dichotomy** without the hypothesis Lemma P (infinite field). -/
theorem dichotomie' [Infinite K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hns : NichtSymmetrisch alg) : UnterfallAVoll alg ∨ UnterfallB alg :=
  dichotomie (lemmaP K) alg h1 h2 hcase hns

/-- **Only sub-case B remains**, without the hypothesis Lemma P: over an algebraically closed
field, a normalized decomposition of length 25 in the case (5,8) that is not symmetric is in
sub-case B. -/
theorem nur_unterfallB' [IsAlgClosed K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hns : NichtSymmetrisch alg) : UnterfallB alg :=
  nur_unterfallB (lemmaP K) alg h1 h2 hcase hns

/-- **Global form**, without the hypothesis Lemma P. -/
theorem nur_unterfallB_global' (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      ((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8) →
        NichtSymmetrisch alg' → UnterfallB alg') :=
  nur_unterfallB_global K (lemmaP (AlgebraicClosure K)) alg

end Application

end LemmaP444
end YangBounds

/-! ## Axiom check (output appears in the build log) -/

#print axioms YangBounds.LemmaP444.main
#print axioms YangBounds.LemmaP444.lemmaP
#print axioms YangBounds.LemmaP444.dichotomie'
#print axioms YangBounds.LemmaP444.nur_unterfallB'
#print axioms YangBounds.LemmaP444.nur_unterfallB_global'
