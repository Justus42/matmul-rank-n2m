import YangBounds.YangN4Lemma13

/-!
# Lemma 13′: a sharpening of Yang's Lemma 13

Task S2-14 (stage 2, round 4, track A, role: formaliser). Status of every statement in this
file: `behauptet` (nothing here is `geprüft` before the statement check of protocol 5.1).

Source: `lean/prosa/s2_444_spurA_r2.md` (task S2-05), Section 4, "Lemma 13′", checked in
`lean/prosa/s2_444_spurA_r2_pruefung.md` (task S2-09), Section 2.4. Lemma 13 itself is Yang's
(arXiv:2609.14393v3); the sharpening by the term `s` is from S2-05.

## Statement (prose, Section 4, for `d = 3`)

Let `U`, `Q` be finite-dimensional, `F_1, F_2, F_3 : U → Q` linear, `L`, `H`, `ρ` as in
Lemma 13. After the change of basis of Lemma 13, Step 1, `rk F_1 = ρ`. Let
`s := dim(F_2(ker F_1) + F_3(ker F_1))`. Then `rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉`.

## Form used here (no change of basis in the statement)

The change of basis replaces `F_1` by `G = ∑ γ_i F_i` for a `γ` with `rk G = ρ`. The
statement is formulated without the change of basis, with

  `s(γ) := dim ∑_i F_i(ker G)`   (`sDim G F` below, the sum over **all** `i`).

This is the prose `s` for the changed basis: on `ker G` the new `F′_1 = G` vanishes, and the
other new maps `F′_2, F′_3` together with `G` span the same space as `F_1, F_2, F_3`, so
`F′_2(ker G) + F′_3(ker G) = ∑_i F_i(ker G)` (proved below as an inequality `≤`, which is the
direction needed for the bound).

The ceiling is removed by doubling: for natural numbers,
`rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉` is equivalent to `3ρ + 2s + rk L ≤ 2 rk H`
(`rk L ≥ ρ` is not needed for this direction). The Lean statement is the doubled form, for a
general number `e + 2` of maps (the prose has `e = 1`):

  `(e + 2)·rk G + 2·s(γ) + e·rk L ≤ 2·rk H`.

For `e = 1` this is `3ρ + 2s + rk L ≤ 2 rk H`; with `s ≥ 0` it gives back Lemma 13.

## Main results

* `lemma13Prime_core`: the count with `F 0` in the role of `F_1` (prose `s` literally).
* `lemma13Prime_of_gamma`: for every `γ ≠ 0`.
* `lemma13Prime`: with `ρ` the maximum and a maximising `γ` (also for `γ = 0`).
* `Lemma13PrimeStatement`, `lemma13Prime_statement`: the statement for `d = 3` as a `Prop`,
  in the notation of `YangN4Haupt.lean` (for use as a hypothesis by task S2-15).
* `exists_common_kernel_of_sDim_eq_zero`: if `rk G < dim U` and `s(γ) = 0`, the `F_i` have a
  common kernel vector `x ≠ 0` (prose remark "s = 0 heißt: k liegt im gemeinsamen Kern").

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace Lemma13Prime

open Module YangN4Lemma13

universe u v w

variable {K : Type u} [Field K] {U : Type v} [AddCommGroup U] [Module K U]
  {Q : Type w} [AddCommGroup Q] [Module K Q]

/-- `s(γ) = dim ∑_i F_i(ker G)` for a linear map `G` (in the application `G = ∑ γ_i F_i`). -/
noncomputable def sDim {d : ℕ} (G : U →ₗ[K] Q) (F : Fin d → U →ₗ[K] Q) : ℕ :=
  finrank K (⨆ i, (LinearMap.ker G).map (F i) : Submodule K Q)

/-! ## The core count with `F 0` distinguished -/

section Core

variable [FiniteDimensional K Q] {e : ℕ}

/-- The prose `s` for `F 0` in the role of `F_1`: `dim ∑_{j ≥ 1} F_j(ker F_0)`. -/
noncomputable def sCore (F : Fin (e + 2) → U →ₗ[K] Q) : ℕ :=
  finrank K (⨆ j : Fin (e + 1), (LinearMap.ker (F 0)).map (F j.succ) : Submodule K Q)

omit [FiniteDimensional K Q] in
theorem sumMap_eq_zero_add (F : Fin (e + 2) → U →ₗ[K] Q) (u : Fin (e + 2) → U) :
    sumMap F u = F 0 (u 0) + ∑ i : Fin (e + 1), F i.succ (u i.succ) := by
  rw [sumMap_apply, Fin.sum_univ_succ]

omit [FiniteDimensional K Q] in
/-- `H(γ(a))_0 = -∑_j F_{j+1}(a_j)`. -/
theorem H_gammaElt_zero (F : Fin (e + 2) → U →ₗ[K] Q) (a : Fin (e + 1) → U) :
    skewExt (sumMap F) ⟨gammaElt a, gammaElt_mem a⟩ 0 = -∑ j, F j.succ (a j) := by
  rw [skewExt_apply, sumMap_eq_zero_add]
  simp

omit [FiniteDimensional K Q] in
/-- `H(γ(a))_{i+1} = F_0(a_i)`. -/
theorem H_gammaElt_succ (F : Fin (e + 2) → U →ₗ[K] Q) (a : Fin (e + 1) → U) (i : Fin (e + 1)) :
    skewExt (sumMap F) ⟨gammaElt a, gammaElt_mem a⟩ i.succ = F 0 (a i) := by
  rw [skewExt_apply, sumMap_eq_zero_add]
  simp

/-- **Core count of Lemma 13′** (prose Section 4): with `F 0` in the role of `F_1`,
`(e+1)·rk F_0 + s + rk H̄ ≤ rk H`, where `H̄` is the skew extension for the maps
`F_{j+1} mod im F_0` (`quotF F`). -/
theorem core_count_prime (F : Fin (e + 2) → U →ₗ[K] Q) :
    (e + 1) * finrank K (LinearMap.range (F 0)) + sCore F +
        finrank K (LinearMap.range (skewExt (sumMap (quotF F)))) ≤
      finrank K (LinearMap.range (skewExt (sumMap F))) := by
  have hmk0 : ∀ x, (LinearMap.range (F 0)).mkQ (F 0 x) = 0 := fun x =>
    (Submodule.Quotient.mk_eq_zero _).mpr ⟨x, rfl⟩
  have hLb : ∀ u : Fin (e + 2) → U,
      (LinearMap.range (F 0)).mkQ (sumMap F u) = sumMap (quotF F) (Fin.tail u) := fun u => by
    rw [sumMap_eq_zero_add, map_add, hmk0, zero_add, map_sum, sumMap_apply]
    rfl
  -- the projection `π` onto the components `1, …, e+1` modulo `im F_0`
  let π : (Fin (e + 2) → Q) →ₗ[K] (Fin (e + 1) → Q ⧸ LinearMap.range (F 0)) :=
    LinearMap.pi fun i : Fin (e + 1) =>
      (LinearMap.range (F 0)).mkQ ∘ₗ (LinearMap.proj i.succ : (Fin (e + 2) → Q) →ₗ[K] Q)
  have hπ : ∀ y i, π y i = (LinearMap.range (F 0)).mkQ (y i.succ) := fun _ _ => rfl
  have hrn := finrank_map_add_finrank_inf_ker π (LinearMap.range (skewExt (sumMap F)))
  -- `im H̄ ⊆ π(im H)`
  have h1 : LinearMap.range (skewExt (sumMap (quotF F))) ≤
      (LinearMap.range (skewExt (sumMap F))).map π := by
    rintro _ ⟨cb, rfl⟩
    refine ⟨skewExt (sumMap F) ⟨extZero cb.1, extZero_mem cb.2⟩, ⟨_, rfl⟩, ?_⟩
    funext i
    rw [hπ, skewExt_apply, skewExt_apply, hLb]
    rfl
  -- the space `T = H(Γ)`
  let Θ : (Fin (e + 1) → U) →ₗ[K] (Fin (e + 2) → Q) :=
    { toFun := fun a => skewExt (sumMap F) ⟨gammaElt a, gammaElt_mem a⟩
      map_add' := fun a b => by
        rw [← map_add]
        congr 1
        apply Subtype.ext
        funext i j
        refine Fin.cases ?_ (fun i => ?_) i <;> refine Fin.cases ?_ (fun j => ?_) j <;>
          simp [add_comm]
      map_smul' := fun c a => by
        rw [RingHom.id_apply, ← map_smul]
        congr 1
        apply Subtype.ext
        funext i j
        refine Fin.cases ?_ (fun i => ?_) i <;> refine Fin.cases ?_ (fun j => ?_) j <;>
          simp }
  have hΘ : ∀ a, Θ a = skewExt (sumMap F) ⟨gammaElt a, gammaElt_mem a⟩ := fun _ => rfl
  have hT : LinearMap.range Θ ≤
      LinearMap.range (skewExt (sumMap F)) ⊓ LinearMap.ker π := by
    rintro _ ⟨a, rfl⟩
    refine ⟨⟨_, (hΘ a).symm⟩, ?_⟩
    rw [SetLike.mem_coe, LinearMap.mem_ker]
    funext i
    rw [hπ, hΘ, H_gammaElt_succ, hmk0]
    rfl
  -- `dim T ≥ (e+1)·rk F_0 + s`, through the projection `p` onto the components `1, …, e+1`
  let p : (Fin (e + 2) → Q) →ₗ[K] (Fin (e + 1) → Q) :=
    LinearMap.pi fun i : Fin (e + 1) => (LinearMap.proj i.succ : (Fin (e + 2) → Q) →ₗ[K] Q)
  have hp : ∀ y i, p y i = y i.succ := fun _ _ => rfl
  have hTp := finrank_map_add_finrank_inf_ker p (LinearMap.range Θ)
  let ι : (Fin (e + 1) → LinearMap.range (F 0)) →ₗ[K] (Fin (e + 1) → Q) :=
    LinearMap.pi fun i : Fin (e + 1) => (LinearMap.range (F 0)).subtype ∘ₗ
      (LinearMap.proj i : (Fin (e + 1) → LinearMap.range (F 0)) →ₗ[K] LinearMap.range (F 0))
  have hι : Function.Injective ι := by
    intro z z' hz
    funext i
    exact Subtype.ext (congrFun hz i)
  have h2 : LinearMap.range ι ≤ (LinearMap.range Θ).map p := by
    rintro _ ⟨z, rfl⟩
    choose a ha using fun i => (z i).2
    refine ⟨Θ a, ⟨a, rfl⟩, ?_⟩
    funext i
    rw [hp, hΘ, H_gammaElt_succ, ha]
    rfl
  have h3 : finrank K (LinearMap.range ι) = (e + 1) * finrank K (LinearMap.range (F 0)) := by
    rw [LinearMap.finrank_range_of_inj hι, Module.finrank_pi_fintype]
    simp
  -- `S × 0 ⊆ T ∩ ker p`
  set S : Submodule K Q := ⨆ j : Fin (e + 1), (LinearMap.ker (F 0)).map (F j.succ) with hS
  let σ : Q →ₗ[K] (Fin (e + 2) → Q) := LinearMap.single K (fun _ : Fin (e + 2) => Q) 0
  have hσ : Function.Injective σ := by
    intro y y' h
    have := congrFun h 0
    simpa [σ] using this
  have h4 : S.map σ ≤ LinearMap.range Θ ⊓ LinearMap.ker p := by
    rw [Submodule.map_le_iff_le_comap, hS]
    refine iSup_le fun j => ?_
    rintro _ ⟨x, hx, rfl⟩
    rw [SetLike.mem_coe, LinearMap.mem_ker] at hx
    have hΘx : Θ (-(Pi.single j x)) = σ (F j.succ x) := by
      funext i
      refine Fin.cases ?_ (fun i => ?_) i
      · rw [hΘ, H_gammaElt_zero]
        simp only [Pi.neg_apply, map_neg, Finset.sum_neg_distrib, neg_neg]
        rw [Finset.sum_eq_single j (fun b _ hb => by simp [Pi.single_apply, hb])
          (fun h => absurd (Finset.mem_univ _) h)]
        simp [σ]
      · rw [hΘ, H_gammaElt_succ]
        by_cases hij : i = j
        · subst hij
          simp [σ, hx]
        · simp [σ, Pi.single_apply, hij, Fin.succ_ne_zero]
    refine ⟨⟨_, hΘx⟩, ?_⟩
    rw [SetLike.mem_coe, LinearMap.mem_ker]
    funext i
    rw [hp]
    simp [σ, Fin.succ_ne_zero]
  have h5 : finrank K (S.map σ) = finrank K S :=
    LinearEquiv.finrank_eq (Submodule.equivMapOfInjective σ hσ S).symm
  have h6 := Submodule.finrank_mono h1
  have h7 := Submodule.finrank_mono h2
  have h8 := Submodule.finrank_mono h4
  have h9 := Submodule.finrank_mono hT
  have hs : sCore F = finrank K S := rfl
  omega

/-- **Lemma 13′ with `F 0` in the role of `F_1`** (doubled form):
`(e+2)·rk F_0 + 2·s + e·rk L ≤ 2·rk H`. -/
theorem lemma13Prime_core (F : Fin (e + 2) → U →ₗ[K] Q) :
    (e + 2) * finrank K (LinearMap.range (F 0)) + 2 * sCore F +
        e * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  have hc := core_count_prime F
  have hL := (core_count F).1
  have h11 : e * finrank K (LinearMap.range (sumMap (quotF F))) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap (quotF F)))) := by
    simpa using lemma11_sumMap (e + 1) _ (quotF F)
  have hel := Nat.mul_le_mul_left e hL
  rw [Nat.mul_add] at hel
  nlinarith

end Core

/-! ## Change of basis: every `γ ≠ 0` -/

section Gamma

theorem mixF_rowMatrix_ne_zero {d : ℕ} (γ : Fin (d + 1) → K) (k : Fin (d + 1))
    (F : Fin (d + 1) → U →ₗ[K] Q) {i : Fin (d + 1)} (hi : i ≠ 0) :
    mixF (rowMatrix γ k) F i = F (Equiv.swap 0 k i) := by
  simp [mixF, rowMatrix, hi, ite_smul]

/-- `∑_i F_i(ker G) ⊆ ∑_{j ≥ 1} F′_j(ker G)` for the changed basis `F′ = ξ F` with row `0`
of `ξ` equal to `γ` (so `F′_0 = G`). -/
theorem iSup_map_le_iSup_map_mixF {e : ℕ} (γ : Fin (e + 2) → K) {k : Fin (e + 2)}
    (hk : γ k ≠ 0) (F : Fin (e + 2) → U →ₗ[K] Q) :
    (⨆ i, (LinearMap.ker (∑ i, γ i • F i)).map (F i) : Submodule K Q) ≤
      ⨆ j : Fin (e + 1), (LinearMap.ker (∑ i, γ i • F i)).map (mixF (rowMatrix γ k) F j.succ) := by
  set G : U →ₗ[K] Q := ∑ i, γ i • F i with hG
  set R : Submodule K Q :=
    ⨆ j : Fin (e + 1), (LinearMap.ker G).map (mixF (rowMatrix γ k) F j.succ) with hR
  have hne : ∀ x ∈ LinearMap.ker G, ∀ i, i ≠ k → F i x ∈ R := by
    intro x hx i hik
    have hτ : Equiv.swap 0 k i ≠ 0 := by
      intro h0
      apply hik
      have := congrArg (Equiv.swap 0 k) h0
      simpa using this
    obtain ⟨j, hj⟩ := Fin.exists_succ_eq.2 hτ
    have hF : mixF (rowMatrix γ k) F j.succ = F i := by
      rw [mixF_rowMatrix_ne_zero γ k F (Fin.succ_ne_zero j), hj, Equiv.swap_apply_self]
    have : (mixF (rowMatrix γ k) F j.succ) x ∈ R :=
      (le_iSup (fun j : Fin (e + 1) =>
        (LinearMap.ker G).map (mixF (rowMatrix γ k) F j.succ)) j) ⟨x, hx, rfl⟩
    rwa [hF] at this
  refine iSup_le fun i => ?_
  rintro _ ⟨x, hx, rfl⟩
  by_cases hik : i = k
  · subst hik
    have hGx : G x = 0 := hx
    have hsum : γ i • F i x = -∑ l ∈ Finset.univ.erase i, γ l • F l x := by
      rw [eq_neg_iff_add_eq_zero,
        Finset.add_sum_erase _ (fun l => γ l • F l x) (Finset.mem_univ i)]
      simpa [hG, LinearMap.coeFn_sum, Finset.sum_apply] using hGx
    have hmem : γ i • F i x ∈ R := by
      rw [hsum]
      refine R.neg_mem (R.sum_mem fun l hl => R.smul_mem _ ?_)
      exact hne x hx l (Finset.ne_of_mem_erase hl)
    have := R.smul_mem (γ i)⁻¹ hmem
    rwa [smul_smul, inv_mul_cancel₀ hk, one_smul] at this
  · exact hne x hx i hik

variable [FiniteDimensional K Q]

/-- **Lemma 13′ for every `γ ≠ 0`** (doubled form, `e + 2` maps):
`(e+2)·rk G + 2·s(γ) + e·rk L ≤ 2·rk H` with `G = ∑ γ_i F_i`, `s(γ) = dim ∑_i F_i(ker G)`. -/
theorem lemma13Prime_of_gamma {e : ℕ} (F : Fin (e + 2) → U →ₗ[K] Q) (γ : Fin (e + 2) → K)
    (hγ : γ ≠ 0) :
    (e + 2) * finrank K (LinearMap.range (∑ i, γ i • F i)) + 2 * sDim (∑ i, γ i • F i) F +
        e * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  obtain ⟨k, hk⟩ : ∃ k, γ k ≠ 0 := by
    by_contra h
    push_neg at h
    exact hγ (funext h)
  have hdet := rowMatrix_isUnit γ hk
  have hc := lemma13Prime_core (mixF (rowMatrix γ k) F)
  have hs : sDim (∑ i, γ i • F i) F ≤ sCore (mixF (rowMatrix γ k) F) := by
    unfold sDim sCore
    rw [mixF_rowMatrix_zero γ k F]
    exact Submodule.finrank_mono (iSup_map_le_iSup_map_mixF γ hk F)
  rw [mixF_rowMatrix_zero γ k F] at hc
  have hL : finrank K (LinearMap.range (sumMap F)) ≤
      finrank K (LinearMap.range (sumMap (mixF (rowMatrix γ k) F))) := by
    have := range_sumMap_mixF_le (rowMatrix γ k)⁻¹ (mixF (rowMatrix γ k) F)
    rw [mixF_mixF (Matrix.nonsing_inv_mul _ hdet)] at this
    exact Submodule.finrank_mono this
  have hH : finrank K (LinearMap.range (skewExt (sumMap (mixF (rowMatrix γ k) F)))) ≤
      finrank K (LinearMap.range (skewExt (sumMap F))) :=
    finrank_range_skewExt_mixF_le (Matrix.mul_nonsing_inv _ hdet) F
  have hel := Nat.mul_le_mul_left e hL
  calc (e + 2) * finrank K (LinearMap.range (∑ i, γ i • F i)) + 2 * sDim (∑ i, γ i • F i) F +
        e * finrank K (LinearMap.range (sumMap F))
      ≤ (e + 2) * finrank K (LinearMap.range (∑ i, γ i • F i)) +
          2 * sCore (mixF (rowMatrix γ k) F) +
          e * finrank K (LinearMap.range (sumMap (mixF (rowMatrix γ k) F))) := by omega
    _ ≤ 2 * finrank K (LinearMap.range (skewExt (sumMap (mixF (rowMatrix γ k) F)))) := hc
    _ ≤ 2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by omega

/-- **Lemma 13′** (prose Section 4, doubled form, `e + 2` maps), with `ρ` the maximum of
`rk(∑ γ_i F_i)` and `γ` any maximiser: `(e+2)·ρ + 2·s(γ) + e·rk L ≤ 2·rk H`. -/
theorem lemma13Prime {e : ℕ} (F : Fin (e + 2) → U →ₗ[K] Q) (ρ : ℕ)
    (hρ : IsGreatest (Set.range fun γ : Fin (e + 2) → K =>
      finrank K (LinearMap.range (∑ i, γ i • F i))) ρ)
    (γ : Fin (e + 2) → K) (hγρ : finrank K (LinearMap.range (∑ i, γ i • F i)) = ρ) :
    (e + 2) * ρ + 2 * sDim (∑ i, γ i • F i) F + e * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) := by
  by_cases hγ : γ = 0
  · -- then `ρ = 0`, all `F_i = 0`, and both sides are `0`
    subst hγ
    have hρ0 : ρ = 0 := by
      rw [← hγρ]
      simp
    have hFi : ∀ i, F i = 0 := by
      intro i
      have hle : finrank K (LinearMap.range (F i)) ≤ ρ := by
        have h' : finrank K (LinearMap.range
            (∑ j, (Pi.single i (1 : K) : Fin (e + 2) → K) j • F j)) ≤ ρ :=
          hρ.2 ⟨Pi.single i 1, rfl⟩
        have hs : ∑ j, (Pi.single i (1 : K) : Fin (e + 2) → K) j • F j = F i := by
          rw [Finset.sum_eq_single i (fun b _ hb => by simp [Pi.single_apply, hb])
            (fun h => absurd (Finset.mem_univ _) h)]
          simp
        rwa [hs] at h'
      rw [hρ0, Nat.le_zero, Submodule.finrank_eq_zero, LinearMap.range_eq_bot] at hle
      exact hle
    have hF0 : F = 0 := funext hFi
    subst hF0
    have hsum : sumMap (0 : Fin (e + 2) → U →ₗ[K] Q) = 0 :=
      LinearMap.ext fun u => by simp [sumMap_apply]
    have hs : sDim (∑ i, (0 : Fin (e + 2) → K) i • (0 : Fin (e + 2) → U →ₗ[K] Q) i)
        (0 : Fin (e + 2) → U →ₗ[K] Q) = 0 := by
      simp [sDim]
    rw [hρ0, hs, hsum, LinearMap.range_zero, finrank_bot]
    simp
  · rw [← hγρ]
    exact lemma13Prime_of_gamma F γ hγ

omit [FiniteDimensional K Q] in
/-- If `rk G < dim U` and `s(γ) = 0`, then the `F_i` have a common kernel vector `x ≠ 0`
(prose Section 4, remark: "s = 0 heißt: k liegt im gemeinsamen Kern N"). -/
theorem exists_common_kernel_of_sDim_eq_zero [FiniteDimensional K U] {d : ℕ}
    (G : U →ₗ[K] Q) (F : Fin d → U →ₗ[K] Q)
    (hG : finrank K (LinearMap.range G) < finrank K U) (hs : sDim G F = 0) :
    ∃ x : U, x ≠ 0 ∧ ∀ i, F i x = 0 := by
  have hker : LinearMap.ker G ≠ ⊥ := by
    intro h
    have := LinearMap.finrank_range_add_finrank_ker G
    rw [h, finrank_bot] at this
    omega
  obtain ⟨x, hx, hx0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hker
  refine ⟨x, hx0, fun i => ?_⟩
  have hbot : (⨆ i, (LinearMap.ker G).map (F i) : Submodule K Q) = ⊥ :=
    Submodule.finrank_eq_zero.mp hs
  have : F i x ∈ (⨆ i, (LinearMap.ker G).map (F i) : Submodule K Q) :=
    (le_iSup (fun i => (LinearMap.ker G).map (F i)) i) ⟨x, hx, rfl⟩
  rw [hbot] at this
  exact (Submodule.mem_bot K).mp this

end Gamma

end Lemma13Prime
end YangBounds
