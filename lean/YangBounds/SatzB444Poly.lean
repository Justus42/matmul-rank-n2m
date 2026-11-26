module

public import Mathlib.RingTheory.MvPolynomial.Homogeneous
public import Mathlib.RingTheory.MvPolynomial.MonomialOrder.DegLex
public import Mathlib.RingTheory.Polynomial.UniqueFactorization
public import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
public import Mathlib.LinearAlgebra.LinearIndependent.Lemmas

@[expose] public section

/-!
# Polynomial algebra for Lemma S (task S2-15)

Task S2-15 (stage 2, round 4, track A, role: formaliser).

This file contains the facts about the polynomial ring `R = K[x_0, x_1, x_2, x_3]` that the
proof of Lemma S (prose `lean/prosa/s2_444_spurA_r2.md`, Section 6) needs, in the form used in
`SatzB444.lean`:

* `lin y = ∑ y_l x_l`, the linear form of a vector `y ∈ K⁴`;
* in the domain `R`, `totalDegree (f * g) = totalDegree f + totalDegree g` (via the deglex
  leading monomial);
* a nonzero linear form is irreducible, hence prime (`R` is a UFD);
* if `f` is a nonzero linear form and `f * g` is homogeneous of degree 2, then `g` is a linear
  form;
* **the syzygy lemma `syz`**: let `I` be a space of quadratic forms with `dim I ≤ 2` that
  contains no product of two nonzero linear forms. If `Q_0, …, Q_3 ∈ I` and
  `∑ x_i Q_i = 0`, then all `Q_i` are zero.

`syz` replaces the computation with linear syzygies (`Syz₁`) in Lemma S, parts 2 to 4 of the
prose; see `SatzB444.lean` for how it is used and for the deviation from the prose.

No `sorry`, no own axiom.
-/

namespace YangBounds
namespace SatzB444Poly

open MvPolynomial Module

universe u

variable {K : Type u} [Field K]

/-- The polynomial ring `K[x_0, x_1, x_2, x_3]`. -/
abbrev Poly (K : Type u) [Field K] := MvPolynomial (Fin 4) K

/-- The linear form `ℓ_y = ∑_l y_l x_l` of a vector `y ∈ K⁴`. -/
noncomputable def lin : (Fin 4 → K) →ₗ[K] Poly K where
  toFun y := ∑ l, C (y l) * X l
  map_add' y z := by simp [add_mul, Finset.sum_add_distrib]
  map_smul' c y := by
    simp only [Pi.smul_apply, smul_eq_mul, C_mul, RingHom.id_apply, Finset.smul_sum,
      smul_eq_C_mul, mul_assoc]

theorem lin_apply (y : Fin 4 → K) : lin y = ∑ l, C (y l) * X l := rfl

@[simp] theorem eval_lin (v y : Fin 4 → K) : eval v (lin y) = ∑ l, y l * v l := by
  simp [lin_apply]

theorem coeff_lin (y : Fin 4 → K) (l : Fin 4) : (lin y).coeff (Finsupp.single l 1) = y l := by
  classical
  rw [lin_apply, coeff_sum]
  simp only [coeff_C_mul, coeff_X']
  rw [Finset.sum_eq_single l]
  · simp
  · intro b _ hb
    have : Finsupp.single b 1 ≠ Finsupp.single l 1 := by
      intro h
      exact hb (Finsupp.single_left_injective one_ne_zero h)
    simp [this]
  · simp

theorem lin_injective : Function.Injective (lin : (Fin 4 → K) → Poly K) := by
  intro y z h
  funext l
  rw [← coeff_lin y l, ← coeff_lin z l, h]

theorem lin_ne_zero {y : Fin 4 → K} (hy : y ≠ 0) : lin y ≠ 0 := by
  intro h
  apply hy
  apply lin_injective
  rw [h, map_zero]

theorem lin_isHomogeneous (y : Fin 4 → K) : (lin y).IsHomogeneous 1 := by
  rw [lin_apply]
  exact IsHomogeneous.sum _ _ _ fun l _ => isHomogeneous_C_mul_X (y l) l

theorem totalDegree_lin {y : Fin 4 → K} (hy : y ≠ 0) : (lin y).totalDegree = 1 :=
  (lin_isHomogeneous y).totalDegree (lin_ne_zero hy)

/-- In the domain `K[x_0, …, x_3]` the total degree is additive. -/
theorem totalDegree_mul_eq {f g : Poly K} (hf : f ≠ 0) (hg : g ≠ 0) :
    (f * g).totalDegree = f.totalDegree + g.totalDegree := by
  rw [← degree_degLexDegree, ← degree_degLexDegree (f := f), ← degree_degLexDegree (f := g),
    MonomialOrder.degree_mul hf hg, map_add]

/-- A monomial of degree `1` is `x_l`. -/
theorem eq_single_of_degree_eq_one {d : Fin 4 →₀ ℕ} (hd : d.degree = 1) :
    ∃ l, d = Finsupp.single l 1 := by
  classical
  rw [Finsupp.degree_apply] at hd
  have hne : d.support.Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro h
    rw [h, Finset.sum_empty] at hd
    exact zero_ne_one hd
  obtain ⟨i, hi⟩ := hne
  have hsplit := Finset.add_sum_erase d.support d hi
  rw [hd] at hsplit
  have hdi : d i ≠ 0 := Finsupp.mem_support_iff.mp hi
  have hdi1 : d i = 1 := by omega
  have hrest : ∑ x ∈ d.support.erase i, d x = 0 := by omega
  rw [Finset.sum_eq_zero_iff] at hrest
  refine ⟨i, ?_⟩
  ext j
  by_cases hj : j = i
  · subst hj
    simp [hdi1]
  · rw [Finsupp.single_apply, if_neg (Ne.symm hj)]
    by_cases hjs : j ∈ d.support
    · exact hrest j (Finset.mem_erase.mpr ⟨hj, hjs⟩)
    · exact Finsupp.notMem_support_iff.mp hjs

/-- A homogeneous polynomial of degree `1` is a linear form. -/
theorem eq_lin_of_isHomogeneous_one {g : Poly K} (hg : g.IsHomogeneous 1) :
    g = lin (fun l => g.coeff (Finsupp.single l 1)) := by
  ext d
  by_cases hd : d.degree = 1
  · obtain ⟨l, rfl⟩ := eq_single_of_degree_eq_one hd
    rw [coeff_lin]
  · rw [hg.coeff_eq_zero hd, (lin_isHomogeneous _).coeff_eq_zero hd]

/-- If `f` is a nonzero linear form and `f * g` is homogeneous of degree `2`, then `g` is
homogeneous of degree `1`. -/
theorem isHomogeneous_one_of_mul {f g : Poly K} (hf : f.IsHomogeneous 1) (hf0 : f ≠ 0)
    (h : (f * g).IsHomogeneous 2) : g.IsHomogeneous 1 := by
  by_cases hg : g = 0
  · rw [hg]; exact isHomogeneous_zero _ _ _
  have hfg : f * g ≠ 0 := mul_ne_zero hf0 hg
  have hdeg := totalDegree_mul_eq hf0 hg
  rw [h.totalDegree hfg, hf.totalDegree hf0] at hdeg
  have hgdeg : g.totalDegree = 1 := by omega
  have hsum := sum_homogeneousComponent g
  rw [hgdeg, Finset.sum_range_succ, Finset.sum_range_one, homogeneousComponent_zero] at hsum
  set c := g.coeff 0
  set g1 := homogeneousComponent 1 g
  have hg1 : g1.IsHomogeneous 1 := homogeneousComponent_isHomogeneous 1 g
  -- `f * C c = f * g - f * g1` is homogeneous of degree 1 and of degree 2
  have hA : (f * C c).IsHomogeneous 2 := by
    have : f * C c = f * g - f * g1 := by rw [← hsum]; ring
    rw [this]
    exact h.sub (hf.mul hg1)
  have hB : (f * C c).IsHomogeneous 1 := by
    simpa using hf.mul (isHomogeneous_C (σ := Fin 4) c)
  have hzero : f * C c = 0 := by
    by_contra hne
    exact absurd (hA.inj_right hB hne) (by norm_num)
  have hc : C c = (0 : Poly K) := (mul_eq_zero.mp hzero).resolve_left hf0
  rw [← hsum, hc, zero_add]
  exact hg1

/-- If `f` is a nonzero linear form and `f * g` is a linear form, then `g` is a constant. -/
theorem eq_C_of_mul {f g : Poly K} (hf : f.IsHomogeneous 1) (hf0 : f ≠ 0)
    (h : (f * g).IsHomogeneous 1) : g = C (g.coeff 0) := by
  by_cases hg : g = 0
  · rw [hg]; simp
  have hfg : f * g ≠ 0 := mul_ne_zero hf0 hg
  have hdeg := totalDegree_mul_eq hf0 hg
  rw [h.totalDegree hfg, hf.totalDegree hf0] at hdeg
  exact totalDegree_eq_zero_iff_eq_C.mp (by omega)

/-- A nonzero linear form is irreducible. -/
theorem irreducible_lin {y : Fin 4 → K} (hy : y ≠ 0) : Irreducible (lin y) := by
  have h1 := totalDegree_lin hy
  refine ⟨fun hu => ?_, fun a b hab => ?_⟩
  · obtain ⟨w, hw⟩ := hu.exists_right_inv
    have hw0 : w ≠ 0 := by rintro rfl; simp at hw
    have := totalDegree_mul_eq (lin_ne_zero hy) hw0
    rw [hw, totalDegree_one] at this
    omega
  · have ha : a ≠ 0 := by rintro rfl; exact lin_ne_zero hy (by simp [hab])
    have hb : b ≠ 0 := by rintro rfl; exact lin_ne_zero hy (by simp [hab])
    have hdeg := totalDegree_mul_eq ha hb
    rw [← hab, h1] at hdeg
    have hunit : ∀ p : Poly K, p ≠ 0 → p.totalDegree = 0 → IsUnit p := by
      intro p hp hp0
      rw [totalDegree_eq_zero_iff_eq_C.mp hp0] at hp ⊢
      have : p.coeff 0 ≠ 0 := by
        intro h0; rw [h0, C_0] at hp; exact hp rfl
      exact (isUnit_iff_ne_zero.mpr this).map C
    rcases Nat.eq_zero_or_pos a.totalDegree with h0 | h0
    · exact Or.inl (hunit a ha h0)
    · exact Or.inr (hunit b hb (by omega))

/-- A nonzero linear form is prime (`K[x_0, …, x_3]` is a UFD). -/
theorem prime_lin {y : Fin 4 → K} (hy : y ≠ 0) : Prime (lin y) :=
  (irreducible_lin hy).prime

/-- `∑ x_i (α_i q) = ℓ_α q`. -/
theorem sum_X_mul_smul (α : Fin 4 → K) (q : Poly K) :
    ∑ i, X i * (α i • q) = lin α * q := by
  rw [lin_apply, Finset.sum_mul]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [smul_eq_C_mul]
  ring

/-- `I` contains no product of two nonzero linear forms (prose Lemma S, part 1). -/
def NoProd (I : Submodule K (Poly K)) : Prop :=
  ∀ y y' : Fin 4 → K, y ≠ 0 → y' ≠ 0 → lin y * lin y' ∉ I

/-- Core of the syzygy lemma for one generator: `ℓ_α q = 0`, `q ≠ 0` gives `α = 0`. -/
theorem syz_one {q : Poly K} (hq : q ≠ 0) {α : Fin 4 → K} (h : lin α * q = 0) : α = 0 := by
  by_contra hα
  exact mul_ne_zero (lin_ne_zero hα) hq h

/-- Core of the syzygy lemma for two generators: if `q₁, q₂` are linearly independent
quadratic forms, `q₁` is not a product of two nonzero linear forms, and
`ℓ_α q₁ + ℓ_β q₂ = 0`, then `α = β = 0`. -/
theorem syz_two {q₁ q₂ : Poly K} (hq₁ : q₁.IsHomogeneous 2)
    (hind : ∀ s t : K, s • q₁ + t • q₂ = 0 → s = 0 ∧ t = 0)
    (hnp : ∀ y y' : Fin 4 → K, y ≠ 0 → y' ≠ 0 → lin y * lin y' ≠ q₁)
    {α β : Fin 4 → K} (h : lin α * q₁ + lin β * q₂ = 0) : α = 0 ∧ β = 0 := by
  have hq₁0 : q₁ ≠ 0 := by
    intro h0
    have := hind 1 0 (by simp [h0])
    exact one_ne_zero this.1
  have hq₂0 : q₂ ≠ 0 := by
    intro h0
    have := hind 0 1 (by simp [h0])
    exact one_ne_zero this.2
  by_cases hβ : β = 0
  · subst hβ
    rw [map_zero, zero_mul, add_zero] at h
    exact ⟨syz_one hq₁0 h, rfl⟩
  exfalso
  have hp := prime_lin hβ
  have hdvd : lin β ∣ lin α * q₁ := ⟨-q₂, by rw [eq_neg_of_add_eq_zero_left h]; ring⟩
  rcases hp.dvd_or_dvd hdvd with ⟨g, hg⟩ | ⟨g, hg⟩
  · -- `ℓ_α = ℓ_β · g` with `g` a constant `κ`; then `ℓ_β (κ q₁ + q₂) = 0`
    have hgC := eq_C_of_mul (lin_isHomogeneous β) (lin_ne_zero hβ)
      (by rw [← hg]; exact lin_isHomogeneous α)
    set κ := g.coeff 0
    have h2 : lin β * (κ • q₁ + (1 : K) • q₂) = 0 := by
      rw [hgC] at hg
      calc lin β * (κ • q₁ + (1 : K) • q₂) = lin α * q₁ + lin β * q₂ := by
            rw [hg, smul_eq_C_mul, one_smul]; ring
        _ = 0 := h
    have h3 : κ • q₁ + (1 : K) • q₂ = 0 :=
      (mul_eq_zero.mp h2).resolve_left (lin_ne_zero hβ)
    exact one_ne_zero (hind κ 1 h3).2
  · -- `q₁ = ℓ_β · g` with `g` a linear form: a product in `I`
    have hg1 := isHomogeneous_one_of_mul (lin_isHomogeneous β) (lin_ne_zero hβ)
      (by rw [← hg]; exact hq₁)
    set y' := fun l => g.coeff (Finsupp.single l 1)
    have hgl : g = lin y' := eq_lin_of_isHomogeneous_one hg1
    have hy' : y' ≠ 0 := by
      intro h0
      apply hq₁0
      rw [hg, hgl, h0, map_zero, mul_zero]
    exact hnp β y' hβ hy' (by rw [hg, hgl])

/-- **Syzygy lemma.** Let `I` be a subspace of quadratic forms in `K[x_0, …, x_3]` with
`dim I ≤ 2` that contains no product of two nonzero linear forms. If `Q_0, …, Q_3 ∈ I` and
`∑ x_i Q_i = 0`, then every `Q_i` is zero. -/
theorem syz (I : Submodule K (Poly K)) [FiniteDimensional K I]
    (hI2 : ∀ q ∈ I, q.IsHomogeneous 2) (hdim : finrank K I ≤ 2) (hnp : NoProd I)
    (Q : Fin 4 → Poly K) (hQ : ∀ i, Q i ∈ I) (hsum : ∑ i, X i * Q i = 0) : ∀ i, Q i = 0 := by
  classical
  by_cases hbot : ∀ q ∈ I, q = 0
  · exact fun i => hbot _ (hQ i)
  push_neg at hbot
  obtain ⟨q₁, hq₁I, hq₁0⟩ := hbot
  by_cases hone : ∀ q ∈ I, q ∈ Submodule.span K {q₁}
  · -- `I = K q₁`
    have hc : ∀ i, ∃ a : K, a • q₁ = Q i := fun i =>
      Submodule.mem_span_singleton.mp (hone _ (hQ i))
    choose α hα using hc
    have h : lin α * q₁ = 0 := by
      rw [← sum_X_mul_smul]
      simpa [hα] using hsum
    have hα0 := syz_one hq₁0 h
    intro i
    rw [← hα i, hα0, Pi.zero_apply, zero_smul]
  · push_neg at hone
    obtain ⟨q₂, hq₂I, hq₂⟩ := hone
    have hind : ∀ s t : K, s • q₁ + t • q₂ = 0 → s = 0 ∧ t = 0 := by
      intro s t hst
      by_cases ht : t = 0
      · subst ht
        rw [zero_smul, add_zero] at hst
        exact ⟨(smul_eq_zero.mp hst).resolve_right hq₁0, rfl⟩
      · exfalso
        apply hq₂
        rw [Submodule.mem_span_singleton]
        refine ⟨-(t⁻¹ * s), ?_⟩
        have : q₂ = t⁻¹ • (t • q₂) := by rw [smul_smul, inv_mul_cancel₀ ht, one_smul]
        rw [this, eq_neg_of_add_eq_zero_right hst, smul_neg, smul_smul, neg_smul]
    -- `I = span {q₁, q₂}` by dimension
    have hli : LinearIndependent K ![q₁, q₂] := by
      rw [LinearIndependent.pair_iff]
      exact hind
    let S : Submodule K (Poly K) := Submodule.span K (Set.range ![q₁, q₂])
    have hSI : S ≤ I := by
      rw [Submodule.span_le]
      rintro _ ⟨j, rfl⟩
      fin_cases j
      · exact hq₁I
      · exact hq₂I
    have hS2 : finrank K S = 2 := by
      rw [finrank_span_eq_card hli, Fintype.card_fin]
    have hSI' : Submodule.comap I.subtype S = ⊤ := by
      apply Submodule.eq_top_of_finrank_eq
      have h1 : finrank K (Submodule.comap I.subtype S) = finrank K S := by
        exact (Submodule.comapSubtypeEquivOfLe hSI).finrank_eq
      have h2 : finrank K (Submodule.comap I.subtype S) ≤ finrank K I :=
        Submodule.finrank_le _
      omega
    have hmem : ∀ q ∈ I, q ∈ S := by
      intro q hq
      have : (⟨q, hq⟩ : I) ∈ Submodule.comap I.subtype S := by rw [hSI']; trivial
      exact this
    have hc : ∀ i, ∃ c : Fin 2 → K, ∑ j, c j • ![q₁, q₂] j = Q i := fun i =>
      (Submodule.mem_span_range_iff_exists_fun K).mp (hmem _ (hQ i))
    choose c hc using hc
    have hQi : ∀ i, Q i = c i 0 • q₁ + c i 1 • q₂ := by
      intro i; rw [← hc i, Fin.sum_univ_two]; rfl
    have h : lin (fun i => c i 0) * q₁ + lin (fun i => c i 1) * q₂ = 0 := by
      rw [← sum_X_mul_smul, ← sum_X_mul_smul, ← Finset.sum_add_distrib, ← hsum]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [hQi i, mul_add]
    have hnp' : ∀ y y' : Fin 4 → K, y ≠ 0 → y' ≠ 0 → lin y * lin y' ≠ q₁ := by
      intro y y' hy hy' heq
      exact hnp y y' hy hy' (heq ▸ hq₁I)
    obtain ⟨h0, h1⟩ := syz_two (hI2 q₁ hq₁I) hind hnp' h
    intro i
    rw [hQi i]
    have e0 : c i 0 = 0 := congrFun h0 i
    have e1 : c i 1 = 0 := congrFun h1 i
    rw [e0, e1, zero_smul, zero_smul, add_zero]

end SatzB444Poly
end YangBounds
