import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Dimension.RankNullity
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Pi
import Mathlib.Algebra.BigOperators.Fin

/-!
# Yang v3, Lemma 13 (case `n ≥ 4`)

Task S1-15 (stage 1, round 4, role: formaliser).

Source of the proof: `lean/prosa/yang_n4.md` (task S1-03), Section 6, "Lemma 13", in the
form over the quotient `Q / im F₁`. The lemma is Yang's (J. Yang, *New lower bounds
on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393v3, Lemma 13),
not ours. This file follows the argument of the prose file (over the quotient), not the one
printed in the paper.

## Statement (prose, Section 6, "Aussage (abstrakt, so formalisieren)")

Let `U`, `Q` be finite-dimensional, `d ≥ 2`, `F₁, …, F_d : U → Q` linear,
`L(u) = Σ_i F_i(u_i)` on `U^d`, `H` the skew extension of `L`, `ρ = max_γ rk(Σ_i γ_i F_i)`.
Then `2·rk H ≥ d·ρ + (d−2)·rk L`.

## Translation of the prose notation

* Indices run over `Fin d` and start at `0`; the prose index `1` is `0` here, the prose
  indices `2, …, d` are `Fin.succ i` for `i : Fin (d-1)`.
* `V^{∧d}` is `skewSpace K V d`: families `c : Fin d → Fin d → V` with `c i i = 0` and
  `c j i = -c i j` (the zero diagonal is required explicitly, as in the prose; this matters
  in characteristic 2).
* The skew extension of `lam : V^d → Y` is `skewExt lam : V^{∧d} → Y^d`,
  `c ↦ (lam (c i))_i`, where `c i` is row `i`.
* `L` is `sumMap F`, `H` is `skewExt (sumMap F)`.
* `rk f` is `finrank K (LinearMap.range f)`.
* `ρ` is given by `IsGreatest (Set.range fun γ => rk (∑ i, γ i • F i)) ρ`, i.e. `ρ` is attained
  and is an upper bound (prose Section 9, last hint).

The definitions `skewSpace`, `skewExt`, `sumMap` and the proposition `Lemma13Statement` are
written character for character as agreed with the parallel task S1-16
(`YangN4Haupt.lean`), so that the main proof can use `lemma13_statement` directly.

## Main results

* `lemma13_of_gamma`: for every `γ`, `d·rk(Σ γ_i F_i) + (d−2)·rk L ≤ 2·rk H` (this is the
  statement for every `γ`, hence in particular for a maximising one).
* `lemma13`: the statement with `ρ` as in the prose.
* `lemma13_statement : Lemma13Statement K U Q` for all `K`, `U`, `Q`.
* `lemma11_sumMap`, `lemma11`: prose Lemma 11, `2·rk h ≥ (d−1)·rk λ`, as a by-product.

## Deviation from the prose proof (documented, the statement is unchanged)

* Lemma 11 is **not** proved with the map `μ` of the prose. It is proved by induction on `d`
  together with Lemma 13: the core count of Lemma 13 (prose Steps 2 to 4) for `d` needs only
  Lemma 11 for `d − 1`, and Lemma 11 for `d` follows from Lemma 13 for `d` with `γ` a unit
  vector of maximal `rk F_k`, because `rk L ≤ Σ_i rk F_i ≤ d·rk F_k`. This avoids computing
  the dimension of `V^{∧d}`.
* Step 1 (w.l.o.g. `ρ = rk F₁`) uses an invertible matrix `ξ` whose row `0` is `γ` and whose
  other rows are unit vectors (`ξ i = e_{τ i}` with `τ` the transposition of `0` and an index
  `k` with `γ_k ≠ 0`). The inequalities `rk L ≤ rk L'` and `rk H' ≤ rk H` (enough for the
  bound) are proved for an arbitrary invertible `ξ` as in the prose (`ξᵀ c ξ`, zero diagonal
  via a pairing argument valid in characteristic 2).
* Step 4 uses the rank–nullity identity `rk H = dim π(im H) + dim(im H ∩ ker π)` and only the inclusions `im H̄ ⊆ π(im H)` and `(im F₁)^{d−1} ⊆ p(im H ∩ ker π)`.
* `FiniteDimensional K U` is not needed for the proof; it is kept in `Lemma13Statement` as in
  the prose.
-/

namespace YangBounds
namespace YangN4Lemma13

open Module

universe u v w

/-! ## Definitions (agreed interface with S1-16) -/

/-- `V^{∧d}`: alternating `d × d` families with entries in `V` and zero diagonal. -/
def skewSpace (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V] (d : ℕ) :
    Submodule K (Fin d → Fin d → V) where
  carrier := {c | (∀ i, c i i = 0) ∧ ∀ i j, c j i = -c i j}
  add_mem' := by
    rintro a b ⟨ha1, ha2⟩ ⟨hb1, hb2⟩
    refine ⟨fun i => ?_, fun i j => ?_⟩
    · simp [ha1 i, hb1 i]
    · simp only [Pi.add_apply, ha2 i j, hb2 i j, neg_add]
  zero_mem' := ⟨fun _ => rfl, fun _ _ => by simp⟩
  smul_mem' := by
    rintro x a ⟨ha1, ha2⟩
    exact ⟨fun i => by simp [ha1 i], fun i j => by simp [ha2 i j]⟩

variable {K : Type u} [Field K]

/-- The skew extension `h(c) = (λ(c_{1,:}), …, λ(c_{d,:}))` of `lam : V^d → Y`. -/
def skewExt {V : Type v} [AddCommGroup V] [Module K V] {Y : Type w} [AddCommGroup Y]
    [Module K Y] {d : ℕ} (lam : (Fin d → V) →ₗ[K] Y) : skewSpace K V d →ₗ[K] (Fin d → Y) :=
  LinearMap.pi fun i => lam ∘ₗ LinearMap.proj i ∘ₗ (skewSpace K V d).subtype

/-- `L(u) = Σ_i F_i(u_i)`. -/
def sumMap {V : Type v} [AddCommGroup V] [Module K V] {Y : Type w} [AddCommGroup Y]
    [Module K Y] {d : ℕ} (F : Fin d → V →ₗ[K] Y) : (Fin d → V) →ₗ[K] Y :=
  ∑ i, F i ∘ₗ LinearMap.proj i

/-- Lemma 13 of the prose file, Section 6, abstract form, with `ρ` the maximum of
`rk(Σ_i γ_i F_i)` over all `γ`. -/
def Lemma13Statement (K : Type u) [Field K] (U : Type v) (Q : Type w) [AddCommGroup U]
    [Module K U] [AddCommGroup Q] [Module K Q] : Prop :=
  FiniteDimensional K U → FiniteDimensional K Q → ∀ d, 2 ≤ d → ∀ (F : Fin d → U →ₗ[K] Q) (ρ : ℕ),
    IsGreatest (Set.range fun γ : Fin d → K => finrank K (LinearMap.range (∑ i, γ i • F i))) ρ →
    d * ρ + (d - 2) * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F)))

/-! ## Basic facts -/

section Basic

variable {V : Type v} [AddCommGroup V] [Module K V] {Y : Type w} [AddCommGroup Y] [Module K Y]

@[simp] theorem skewExt_apply {d : ℕ} (lam : (Fin d → V) →ₗ[K] Y) (c : skewSpace K V d)
    (i : Fin d) : skewExt lam c i = lam (c.1 i) := rfl

theorem sumMap_apply {d : ℕ} (F : Fin d → V →ₗ[K] Y) (u : Fin d → V) :
    sumMap F u = ∑ i, F i (u i) := by
  simp [sumMap, LinearMap.coeFn_sum, Finset.sum_apply]

theorem mem_skewSpace {d : ℕ} {c : Fin d → Fin d → V} :
    c ∈ skewSpace K V d ↔ (∀ i, c i i = 0) ∧ ∀ i j, c j i = -c i j := Iff.rfl

/-- Rank–nullity for the restriction of `f` to a subspace `R`. -/
theorem finrank_map_add_finrank_inf_ker {M N : Type*} [AddCommGroup M] [Module K M]
    [AddCommGroup N] [Module K N] [FiniteDimensional K M] (f : M →ₗ[K] N) (R : Submodule K M) :
    finrank K (R.map f) + finrank K (R ⊓ LinearMap.ker f : Submodule K M) = finrank K R := by
  have h := LinearMap.finrank_range_add_finrank_ker (f.domRestrict R)
  rw [LinearMap.range_domRestrict, LinearMap.ker_domRestrict] at h
  rw [← h]
  congr 1
  have : (LinearMap.ker f).comap R.subtype = (R ⊓ LinearMap.ker f).comap R.subtype := by
    ext x
    simp
  rw [this]
  exact ((Submodule.comapSubtypeEquivOfLe inf_le_left).finrank_eq).symm

/-- `rk L ≤ Σ_i rk F_i`. -/
theorem finrank_range_sumMap_le [FiniteDimensional K Y] :
    ∀ (d : ℕ) (F : Fin d → V →ₗ[K] Y),
      finrank K (LinearMap.range (sumMap F)) ≤ ∑ i, finrank K (LinearMap.range (F i))
  | 0, F => by
    have : sumMap F = 0 := LinearMap.ext fun u => by simp [sumMap_apply]
    simp [this]
  | d + 1, F => by
    have ih := finrank_range_sumMap_le d (fun i : Fin d => F i.succ)
    have hle : LinearMap.range (sumMap F) ≤
        LinearMap.range (F 0) ⊔ LinearMap.range (sumMap fun i : Fin d => F i.succ) := by
      rintro _ ⟨u, rfl⟩
      rw [sumMap_apply, Fin.sum_univ_succ]
      refine Submodule.add_mem_sup ⟨u 0, rfl⟩ ⟨Fin.tail u, ?_⟩
      rw [sumMap_apply]
      rfl
    rw [Fin.sum_univ_succ]
    calc finrank K (LinearMap.range (sumMap F))
        ≤ finrank K (LinearMap.range (F 0) ⊔ LinearMap.range (sumMap fun i : Fin d => F i.succ) :
            Submodule K Y) := Submodule.finrank_mono hle
      _ ≤ finrank K (LinearMap.range (F 0)) +
            finrank K (LinearMap.range (sumMap fun i : Fin d => F i.succ)) :=
          Submodule.finrank_add_le_finrank_add_finrank _ _
      _ ≤ _ := Nat.add_le_add_left ih _

end Basic

/-! ## Step 1: change of basis with an invertible matrix `ξ` -/

section Mix

variable {U : Type v} [AddCommGroup U] [Module K U] {Q : Type w} [AddCommGroup Q] [Module K Q]
variable {d : ℕ}

/-- `F'_i = Σ_j ξ_{i,j} F_j`. -/
def mixF (ξ : Matrix (Fin d) (Fin d) K) (F : Fin d → U →ₗ[K] Q) : Fin d → U →ₗ[K] Q :=
  fun i => ∑ j, ξ i j • F j

/-- `(uξ)_j = Σ_i u_i ξ_{i,j}`. -/
def mixU (ξ : Matrix (Fin d) (Fin d) K) (u : Fin d → U) : Fin d → U :=
  fun j => ∑ i, ξ i j • u i

theorem mixF_apply (ξ : Matrix (Fin d) (Fin d) K) (F : Fin d → U →ₗ[K] Q) (i : Fin d) (x : U) :
    mixF ξ F i x = ∑ j, ξ i j • F j x := by
  simp [mixF, LinearMap.coeFn_sum, Finset.sum_apply]

/-- `L'(u) = L(uξ)`. -/
theorem sumMap_mixF (ξ : Matrix (Fin d) (Fin d) K) (F : Fin d → U →ₗ[K] Q) (u : Fin d → U) :
    sumMap (mixF ξ F) u = sumMap F (mixU ξ u) := by
  simp only [sumMap_apply, mixF_apply, mixU, map_sum, map_smul]
  exact Finset.sum_comm

theorem range_sumMap_mixF_le (ξ : Matrix (Fin d) (Fin d) K) (F : Fin d → U →ₗ[K] Q) :
    LinearMap.range (sumMap (mixF ξ F)) ≤ LinearMap.range (sumMap F) := by
  rintro _ ⟨u, rfl⟩
  exact ⟨mixU ξ u, (sumMap_mixF ξ F u).symm⟩

/-- `Σ_b ξ'_{b,a} Σ_i ξ_{i,b} y_i = y_a` if `ξ ξ' = 1`. -/
theorem sum_smul_sum_smul_of_mul_eq_one {M : Type w} [AddCommGroup M] [Module K M]
    {ξ ξ' : Matrix (Fin d) (Fin d) K} (h : ξ * ξ' = 1) (y : Fin d → M) (a : Fin d) :
    ∑ b, ξ' b a • ∑ i, ξ i b • y i = y a := by
  simp_rw [Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm]
  simp_rw [← Finset.sum_smul]
  have : ∀ i, ∑ b, ξ' b a * ξ i b = (ξ * ξ') i a := fun i => by
    rw [Matrix.mul_apply]
    exact Finset.sum_congr rfl fun b _ => mul_comm _ _
  simp_rw [this, h, Matrix.one_apply, ite_smul, one_smul, zero_smul]
  simp

theorem mixF_mixF {ξ ξ' : Matrix (Fin d) (Fin d) K} (h : ξ' * ξ = 1) (F : Fin d → U →ₗ[K] Q) :
    mixF ξ' (mixF ξ F) = F := by
  funext i
  ext x
  simp only [mixF_apply, Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm]
  simp_rw [← Finset.sum_smul, ← Matrix.mul_apply, h, Matrix.one_apply, ite_smul, one_smul,
    zero_smul]
  simp

/-- The skew family `ξᵀ c ξ`. -/
def mixC (ξ : Matrix (Fin d) (Fin d) K) (c : Fin d → Fin d → U) : Fin d → Fin d → U :=
  fun b => ∑ i, ξ i b • mixU ξ (c i)

theorem mixC_apply (ξ : Matrix (Fin d) (Fin d) K) (c : Fin d → Fin d → U) (a b : Fin d) :
    mixC ξ c a b = ∑ i, ∑ k, (ξ i a * ξ k b) • c i k := by
  simp [mixC, mixU, Finset.sum_apply, Finset.smul_sum, smul_smul]

theorem mixC_mem (ξ : Matrix (Fin d) (Fin d) K) {c : Fin d → Fin d → U}
    (hc : c ∈ skewSpace K U d) : mixC ξ c ∈ skewSpace K U d := by
  obtain ⟨hdiag, hskew⟩ := hc
  refine ⟨fun a => ?_, fun a b => ?_⟩
  · rw [mixC_apply]
    have hpair : ∑ p : Fin d × Fin d, (ξ p.1 a * ξ p.2 a) • c p.1 p.2 = 0 := by
      refine Finset.sum_ninvolution Prod.swap (fun p => ?_) (fun p hp => ?_)
        (fun _ => Finset.mem_univ _) (fun _ => rfl)
      · simp only [Prod.fst_swap, Prod.snd_swap]
        rw [hskew p.1 p.2, smul_neg, mul_comm, add_neg_cancel]
      · intro hswap
        apply hp
        have : p.1 = p.2 := by
          have := congrArg Prod.fst hswap
          simpa using this.symm
        rw [this, hdiag]
        simp
    rw [← Finset.univ_product_univ, Finset.sum_product] at hpair
    exact hpair
  · rw [mixC_apply, mixC_apply, Finset.sum_comm, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [hskew i k, smul_neg, mul_comm]

/-- `rk H' ≤ rk H` for `F' = ξ F`, if `ξ ξ' = 1`. -/
theorem finrank_range_skewExt_mixF_le [FiniteDimensional K Q] {ξ ξ' : Matrix (Fin d) (Fin d) K}
    (h : ξ * ξ' = 1) (F : Fin d → U →ₗ[K] Q) :
    finrank K (LinearMap.range (skewExt (sumMap (mixF ξ F)))) ≤
      finrank K (LinearMap.range (skewExt (sumMap F))) := by
  let N : (Fin d → Q) →ₗ[K] (Fin d → Q) :=
    LinearMap.pi fun a => ∑ b, ξ' b a • (LinearMap.proj b : (Fin d → Q) →ₗ[K] Q)
  have hN : ∀ z a, N z a = ∑ b, ξ' b a • z b := fun z a => by
    simp [N, LinearMap.coeFn_sum, Finset.sum_apply]
  have hle : LinearMap.range (skewExt (sumMap (mixF ξ F))) ≤
      (LinearMap.range (skewExt (sumMap F))).map N := by
    rintro _ ⟨c, rfl⟩
    refine ⟨skewExt (sumMap F) ⟨mixC ξ c.1, mixC_mem ξ c.2⟩, ⟨_, rfl⟩, ?_⟩
    funext a
    rw [hN]
    simp only [skewExt_apply]
    have hrow : ∀ b, sumMap F (mixC ξ c.1 b) = ∑ i, ξ i b • sumMap F (mixU ξ (c.1 i)) := by
      intro b
      simp [mixC, map_sum, map_smul]
    simp_rw [hrow]
    exact (sum_smul_sum_smul_of_mul_eq_one h (fun i => sumMap F (mixU ξ (c.1 i))) a).trans
      (sumMap_mixF ξ F (c.1 a)).symm
  exact (Submodule.finrank_mono hle).trans (Submodule.finrank_map_le _ _)

end Mix

/-! ## Steps 2 to 4: the core count, with distinguished index `0` -/

section Core

variable {U : Type v} [AddCommGroup U] [Module K U] {Q : Type w} [AddCommGroup Q] [Module K Q]
variable {d : ℕ}

/-- Extension of `c̄ ∈ U^{∧d}` by a zero row and column `0`. -/
def extZero (cb : Fin d → Fin d → U) : Fin (d + 1) → Fin (d + 1) → U :=
  fun i j => Fin.cases (motive := fun _ => U) 0
    (fun i' => Fin.cases (motive := fun _ => U) 0 (fun j' => cb i' j') j) i

@[simp] theorem extZero_zero_left (cb : Fin d → Fin d → U) (j : Fin (d + 1)) :
    extZero cb 0 j = 0 := rfl

@[simp] theorem extZero_succ_zero (cb : Fin d → Fin d → U) (i : Fin d) :
    extZero cb i.succ 0 = 0 := rfl

@[simp] theorem extZero_succ_succ (cb : Fin d → Fin d → U) (i j : Fin d) :
    extZero cb i.succ j.succ = cb i j := rfl

theorem extZero_mem {cb : Fin d → Fin d → U} (h : cb ∈ skewSpace K U d) :
    extZero cb ∈ skewSpace K U (d + 1) := by
  obtain ⟨hdiag, hskew⟩ := h
  refine ⟨fun i => ?_, fun i j => ?_⟩
  · refine Fin.cases ?_ (fun i => ?_) i
    · rfl
    · simp [hdiag i]
  · refine Fin.cases ?_ (fun i => ?_) i <;> refine Fin.cases ?_ (fun j => ?_) j
    · simp
    · simp
    · simp
    · simp [hskew i j]

/-- The element of `Γ` with row `0` equal to `-a` and column `0` equal to `a`. -/
def gammaElt (a : Fin d → U) : Fin (d + 1) → Fin (d + 1) → U :=
  fun i j => Fin.cases (motive := fun _ => U)
    (Fin.cases (motive := fun _ => U) 0 (fun j' => -a j') j)
    (fun i' => Fin.cases (motive := fun _ => U) (a i') (fun _ => 0) j) i

@[simp] theorem gammaElt_zero_zero (a : Fin d → U) : gammaElt a 0 0 = 0 := rfl
@[simp] theorem gammaElt_zero_succ (a : Fin d → U) (j : Fin d) :
    gammaElt a 0 j.succ = -a j := rfl
@[simp] theorem gammaElt_succ_zero (a : Fin d → U) (i : Fin d) :
    gammaElt a i.succ 0 = a i := rfl
@[simp] theorem gammaElt_succ_succ (a : Fin d → U) (i j : Fin d) :
    gammaElt a i.succ j.succ = 0 := rfl

theorem gammaElt_mem (a : Fin d → U) : gammaElt a ∈ skewSpace K U (d + 1) := by
  refine ⟨fun i => ?_, fun i j => ?_⟩
  · refine Fin.cases ?_ (fun i => ?_) i <;> simp
  · refine Fin.cases ?_ (fun i => ?_) i <;> refine Fin.cases ?_ (fun j => ?_) j <;> simp

/-- `F̄_i = F_{i+1} mod im F_0`, maps into `Q̄ = Q / im F_0`. -/
def quotF (F : Fin (d + 1) → U →ₗ[K] Q) : Fin d → U →ₗ[K] Q ⧸ LinearMap.range (F 0) :=
  fun i => (LinearMap.range (F 0)).mkQ ∘ₗ F i.succ

variable [FiniteDimensional K Q]

/-- The core count (prose Steps 2 to 4), with `F 0` in the role of `F₁`, `L̄ = sumMap (quotF F)`
and `H̄ = skewExt L̄`: `rk L ≤ rk L̄ + rk F 0` and `d · rk F 0 + rk H̄ ≤ rk H`. -/
theorem core_count (F : Fin (d + 1) → U →ₗ[K] Q) :
    finrank K (LinearMap.range (sumMap F)) ≤
        finrank K (LinearMap.range (sumMap (quotF F))) + finrank K (LinearMap.range (F 0)) ∧
      d * finrank K (LinearMap.range (F 0)) +
          finrank K (LinearMap.range (skewExt (sumMap (quotF F)))) ≤
        finrank K (LinearMap.range (skewExt (sumMap F))) := by
  have hmk0 : ∀ x, (LinearMap.range (F 0)).mkQ (F 0 x) = 0 := fun x =>
    (Submodule.Quotient.mk_eq_zero _).mpr ⟨x, rfl⟩
  -- row decomposition of `L`
  have hL : ∀ u : Fin (d + 1) → U,
      sumMap F u = F 0 (u 0) + ∑ i : Fin d, F i.succ (u i.succ) := fun u => by
    rw [sumMap_apply, Fin.sum_univ_succ]
  have hLb : ∀ u : Fin (d + 1) → U,
      (LinearMap.range (F 0)).mkQ (sumMap F u) = sumMap (quotF F) (Fin.tail u) := fun u => by
    rw [hL, map_add, hmk0, zero_add, map_sum, sumMap_apply]
    rfl
  constructor
  · -- `rk L ≤ rk L̄ + rk F₁`
    have h := finrank_map_add_finrank_inf_ker (LinearMap.range (F 0)).mkQ
      (LinearMap.range (sumMap F))
    have h1 : (LinearMap.range (sumMap F)).map (LinearMap.range (F 0)).mkQ ≤
        LinearMap.range (sumMap (quotF F)) := by
      rintro _ ⟨_, ⟨u, rfl⟩, rfl⟩
      exact ⟨Fin.tail u, (hLb u).symm⟩
    have h2 : (LinearMap.range (sumMap F) ⊓ LinearMap.ker (LinearMap.range (F 0)).mkQ :
        Submodule K Q) ≤ LinearMap.range (F 0) := by
      intro x hx
      have := hx.2
      rwa [Submodule.ker_mkQ] at this
    have := Submodule.finrank_mono h1
    have := Submodule.finrank_mono h2
    omega
  · -- `d · rk F₁ + rk H̄ ≤ rk H`
    let π : (Fin (d + 1) → Q) →ₗ[K] (Fin d → Q ⧸ LinearMap.range (F 0)) :=
      LinearMap.pi fun i : Fin d =>
        (LinearMap.range (F 0)).mkQ ∘ₗ (LinearMap.proj i.succ : (Fin (d + 1) → Q) →ₗ[K] Q)
    have hπ : ∀ y i, π y i = (LinearMap.range (F 0)).mkQ (y i.succ) := fun _ _ => rfl
    have h := finrank_map_add_finrank_inf_ker π (LinearMap.range (skewExt (sumMap F)))
    -- `im H̄ ⊆ π(im H)`
    have h1 : LinearMap.range (skewExt (sumMap (quotF F))) ≤
        (LinearMap.range (skewExt (sumMap F))).map π := by
      rintro _ ⟨cb, rfl⟩
      refine ⟨skewExt (sumMap F) ⟨extZero cb.1, extZero_mem cb.2⟩, ⟨_, rfl⟩, ?_⟩
      funext i
      rw [hπ, skewExt_apply, skewExt_apply, hLb]
      rfl
    -- `(im F₁)^d ⊆ p(im H ∩ ker π)`
    let p : (Fin (d + 1) → Q) →ₗ[K] (Fin d → Q) :=
      LinearMap.pi fun i : Fin d => (LinearMap.proj i.succ : (Fin (d + 1) → Q) →ₗ[K] Q)
    let ι : (Fin d → LinearMap.range (F 0)) →ₗ[K] (Fin d → Q) :=
      LinearMap.pi fun i : Fin d => (LinearMap.range (F 0)).subtype ∘ₗ
        (LinearMap.proj i : (Fin d → LinearMap.range (F 0)) →ₗ[K] LinearMap.range (F 0))
    have hι : Function.Injective ι := by
      intro z z' hz
      funext i
      exact Subtype.ext (congrFun hz i)
    have h2 : LinearMap.range ι ≤
        (LinearMap.range (skewExt (sumMap F)) ⊓ LinearMap.ker π : Submodule K _).map p := by
      rintro _ ⟨z, rfl⟩
      choose a ha using fun i => (z i).2
      have hH : ∀ i : Fin d,
          skewExt (sumMap F) ⟨gammaElt a, gammaElt_mem a⟩ i.succ = F 0 (a i) := by
        intro i
        rw [skewExt_apply, hL]
        simp
      refine ⟨skewExt (sumMap F) ⟨gammaElt a, gammaElt_mem a⟩, ⟨⟨_, rfl⟩, ?_⟩, ?_⟩
      · rw [SetLike.mem_coe, LinearMap.mem_ker]
        funext i
        simp only [hπ, hH, hmk0, Pi.zero_apply]
      · funext i
        change skewExt (sumMap F) ⟨gammaElt a, gammaElt_mem a⟩ i.succ = ((z i : _) : Q)
        rw [hH, ha]
    have h3 : finrank K (LinearMap.range ι) = d * finrank K (LinearMap.range (F 0)) := by
      rw [LinearMap.finrank_range_of_inj hι, Module.finrank_pi_fintype]
      simp
    have h4 := Submodule.finrank_mono h1
    have h5 := (Submodule.finrank_mono h2).trans (Submodule.finrank_map_le _ _)
    omega

/-- Prose Steps 2 to 4 combined with Lemma 11 for `e + 1` maps (hypothesis `h11`):
`(e+2)·rk F 0 + e·rk L ≤ 2·rk H` for `e + 2` maps. -/
theorem core_ineq {e : ℕ} (F : Fin (e + 2) → U →ₗ[K] Q)
    (h11 : e * finrank K (LinearMap.range (sumMap (quotF F))) ≤
        2 * finrank K (LinearMap.range (skewExt (sumMap (quotF F))))) :
    (e + 2) * finrank K (LinearMap.range (F 0)) + e * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  obtain ⟨hL, hH⟩ := core_count F
  have hel := Nat.mul_le_mul_left e hL
  rw [Nat.mul_add] at hel
  nlinarith

end Core

/-! ## Step 1 together with the core: Lemma 13 for every `γ`, and Lemma 11 -/

section Main

variable {U : Type v} [AddCommGroup U] [Module K U]

/-- A matrix with row `0` equal to `γ` and row `i ≠ 0` equal to the unit vector `e_{τ i}`,
`τ` the transposition of `0` and `k`. It is invertible if `γ k ≠ 0`. -/
def rowMatrix {d : ℕ} (γ : Fin (d + 1) → K) (k : Fin (d + 1)) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) K :=
  fun i j => if i = 0 then γ j else if j = Equiv.swap 0 k i then 1 else 0

theorem rowMatrix_isUnit {d : ℕ} (γ : Fin (d + 1) → K) {k : Fin (d + 1)} (hk : γ k ≠ 0) :
    IsUnit (rowMatrix γ k).det := by
  rw [← Matrix.isUnit_iff_isUnit_det, ← Matrix.mulVec_injective_iff_isUnit]
  intro v w hvw
  have hrow : ∀ i, i ≠ 0 → ∀ x : Fin (d + 1) → K,
      (rowMatrix γ k).mulVec x i = x (Equiv.swap 0 k i) := by
    intro i hi x
    simp [Matrix.mulVec, dotProduct, rowMatrix, hi]
  have hne : ∀ j, j ≠ k → v j = w j := by
    intro j hj
    have hτ : Equiv.swap 0 k j ≠ 0 := by
      intro h0
      apply hj
      have := congrArg (Equiv.swap 0 k) h0
      simpa using this
    have := congrFun hvw (Equiv.swap 0 k j)
    rwa [hrow _ hτ, hrow _ hτ, Equiv.swap_apply_self] at this
  funext j
  by_cases hj : j = k
  · rw [hj]
    have h0 : ∑ j, γ j * v j = ∑ j, γ j * w j := by
      have := congrFun hvw 0
      simpa [Matrix.mulVec, dotProduct, rowMatrix] using this
    rw [← sub_eq_zero, ← Finset.sum_sub_distrib] at h0
    rw [Finset.sum_eq_single k (fun b _ hb => by rw [hne b hb, sub_self])
      (fun h => absurd (Finset.mem_univ _) h)] at h0
    rw [← mul_sub, mul_eq_zero] at h0
    exact sub_eq_zero.mp (h0.resolve_left hk)
  · exact hne j hj

theorem mixF_rowMatrix_zero {Q : Type w} [AddCommGroup Q] [Module K Q] {d : ℕ}
    (γ : Fin (d + 1) → K) (k : Fin (d + 1)) (F : Fin (d + 1) → U →ₗ[K] Q) :
    mixF (rowMatrix γ k) F 0 = ∑ i, γ i • F i := by
  simp [mixF, rowMatrix]

/-- Lemma 13 for `d = e + 2` and every `γ`, from Lemma 11 for `e + 1` maps into quotients
of `Q` (hypothesis `h11`). -/
theorem step13 {Q : Type w} [AddCommGroup Q] [Module K Q] [FiniteDimensional K Q] {e : ℕ}
    (h11 : ∀ G : Fin (e + 2) → U →ₗ[K] Q,
      e * finrank K (LinearMap.range (sumMap (quotF G))) ≤
        2 * finrank K (LinearMap.range (skewExt (sumMap (quotF G)))))
    (F : Fin (e + 2) → U →ₗ[K] Q) (γ : Fin (e + 2) → K) :
    (e + 2) * finrank K (LinearMap.range (∑ i, γ i • F i)) +
        e * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  by_cases hγ : γ = 0
  · subst hγ
    have h := core_ineq F (h11 F)
    have h0 : finrank K (LinearMap.range (∑ i, (0 : Fin (e + 2) → K) i • F i)) = 0 := by
      simp
    rw [h0]
    omega
  · obtain ⟨k, hk⟩ : ∃ k, γ k ≠ 0 := by
      by_contra h
      push_neg at h
      exact hγ (funext h)
    have hdet := rowMatrix_isUnit γ hk
    have h : (e + 2) * finrank K (LinearMap.range (∑ i, γ i • F i)) +
        e * finrank K (LinearMap.range (sumMap (mixF (rowMatrix γ k) F))) ≤
        2 * finrank K (LinearMap.range (skewExt (sumMap (mixF (rowMatrix γ k) F)))) := by
      have := core_ineq (mixF (rowMatrix γ k) F) (h11 _)
      rwa [mixF_rowMatrix_zero γ k F] at this
    -- `rk L ≤ rk L'` and `rk H' ≤ rk H`
    have hL : finrank K (LinearMap.range (sumMap F)) ≤
        finrank K (LinearMap.range (sumMap (mixF (rowMatrix γ k) F))) := by
      have := range_sumMap_mixF_le (rowMatrix γ k)⁻¹ (mixF (rowMatrix γ k) F)
      rw [mixF_mixF (Matrix.nonsing_inv_mul _ hdet)] at this
      exact Submodule.finrank_mono this
    have hH : finrank K (LinearMap.range (skewExt (sumMap (mixF (rowMatrix γ k) F)))) ≤
        finrank K (LinearMap.range (skewExt (sumMap F))) :=
      finrank_range_skewExt_mixF_le (Matrix.mul_nonsing_inv _ hdet) F
    have := Nat.mul_le_mul_left e hL
    omega

/-- Prose Lemma 11 for the skew extension of `L = sumMap F`: `(d−1)·rk L ≤ 2·rk H`.
Proved by induction on `d` together with Lemma 13 (see the module docstring). -/
theorem lemma11_sumMap (d : ℕ) : ∀ (Q : Type w) [AddCommGroup Q] [Module K Q]
    [FiniteDimensional K Q] (F : Fin d → U →ₗ[K] Q),
    (d - 1) * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  refine Nat.strong_induction_on d ?_
  intro d ih Q _ _ _ F
  by_cases hd : d ≤ 1
  · have : d - 1 = 0 := by omega
    simp [this]
  obtain ⟨e, rfl⟩ : ∃ e, d = e + 2 := ⟨d - 2, by omega⟩
  have h11 : ∀ G : Fin (e + 2) → U →ₗ[K] Q,
      e * finrank K (LinearMap.range (sumMap (quotF G))) ≤
        2 * finrank K (LinearMap.range (skewExt (sumMap (quotF G)))) :=
    fun G => by simpa using ih (e + 1) (by omega) _ (quotF G)
  obtain ⟨k, -, hk⟩ := Finset.exists_max_image Finset.univ
    (fun i => finrank K (LinearMap.range (F i))) Finset.univ_nonempty
  have h := step13 h11 F (Pi.single k 1)
  have hsingle : ∑ i, (Pi.single k (1 : K) : Fin (e + 2) → K) i • F i = F k := by
    rw [Finset.sum_eq_single k (fun b _ hb => by simp [Pi.single_apply, hb])
      (fun h => absurd (Finset.mem_univ _) h)]
    simp
  rw [hsingle] at h
  have hsum := finrank_range_sumMap_le _ F
  have hsum' : ∑ i, finrank K (LinearMap.range (F i)) ≤
      (e + 2) * finrank K (LinearMap.range (F k)) := by
    calc ∑ i, finrank K (LinearMap.range (F i))
        ≤ ∑ _i : Fin (e + 2), finrank K (LinearMap.range (F k)) :=
          Finset.sum_le_sum fun i hi => hk i hi
      _ = (e + 2) * finrank K (LinearMap.range (F k)) := by simp
  rw [show e + 2 - 1 = e + 1 by omega]
  nlinarith

/-- **Lemma 13** (prose Section 6), for every single `γ`:
`d · rk(Σ_i γ_i F_i) + (d − 2) · rk L ≤ 2 · rk H`. -/
theorem lemma13_of_gamma {Q : Type w} [AddCommGroup Q] [Module K Q] [FiniteDimensional K Q]
    {d : ℕ} (hd : 2 ≤ d) (F : Fin d → U →ₗ[K] Q) (γ : Fin d → K) :
    d * finrank K (LinearMap.range (∑ i, γ i • F i)) +
        (d - 2) * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  obtain ⟨e, rfl⟩ : ∃ e, d = e + 2 := ⟨d - 2, by omega⟩
  have h11 : ∀ G : Fin (e + 2) → U →ₗ[K] Q,
      e * finrank K (LinearMap.range (sumMap (quotF G))) ≤
        2 * finrank K (LinearMap.range (skewExt (sumMap (quotF G)))) :=
    fun G => by simpa using lemma11_sumMap (e + 1) _ (quotF G)
  simpa using step13 h11 F γ

/-- **Lemma 13** (prose Section 6), with `ρ = max_γ rk(Σ_i γ_i F_i)`:
`d · ρ + (d − 2) · rk L ≤ 2 · rk H`. -/
theorem lemma13 {Q : Type w} [AddCommGroup Q] [Module K Q] [FiniteDimensional K U]
    [FiniteDimensional K Q] {d : ℕ} (hd : 2 ≤ d) (F : Fin d → U →ₗ[K] Q) (ρ : ℕ)
    (hρ : IsGreatest (Set.range fun γ : Fin d → K =>
      finrank K (LinearMap.range (∑ i, γ i • F i))) ρ) :
    d * ρ + (d - 2) * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  obtain ⟨γ, hγ⟩ := hρ.1
  rw [← hγ]
  exact lemma13_of_gamma hd F γ

/-- Prose Lemma 11 for an arbitrary `lam : V^d → Y`: `(d − 1) · rk lam ≤ 2 · rk h`. -/
theorem lemma11 {Y : Type w} [AddCommGroup Y] [Module K Y] [FiniteDimensional K Y] {d : ℕ}
    (lam : (Fin d → U) →ₗ[K] Y) :
    (d - 1) * finrank K (LinearMap.range lam) ≤
      2 * finrank K (LinearMap.range (skewExt lam)) := by
  have h : sumMap (fun i => lam ∘ₗ LinearMap.single K (fun _ : Fin d => U) i) = lam := by
    refine LinearMap.ext fun u => ?_
    rw [sumMap_apply]
    simp only [LinearMap.comp_apply, LinearMap.coe_single]
    rw [← map_sum, Finset.univ_sum_single]
  have := lemma11_sumMap d Y (fun i => lam ∘ₗ LinearMap.single K (fun _ : Fin d => U) i)
  rwa [h] at this

end Main

/-- Lemma 13 in the form agreed with S1-16 (`YangN4Haupt.lean`). -/
theorem lemma13_statement (U : Type v) (Q : Type w) [AddCommGroup U] [Module K U]
    [AddCommGroup Q] [Module K Q] : Lemma13Statement K U Q :=
  fun _ _ _ hd F ρ hρ => lemma13 hd F ρ hρ

end YangN4Lemma13
end YangBounds
