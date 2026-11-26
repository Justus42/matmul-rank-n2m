import YangBounds.Statements
import YangBounds.SatzB444Poly
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure

/-!
# Satz B for `⟨4,2,4⟩` at length 25: the cases (4,7) and (5,7) are impossible

Task S2-15 (stage 2, round 4, track A, role: formaliser).

Sources: prose `lean/prosa/s2_444_spurA_r2.md` (task S2-05), Sections 2, 5, 6, 7.
Formalised is a simpler version with Lemma V′ (one admissible `u_0` with a common kernel
forces the symmetry): Lemma V′
instead of Lemma V, and Satz B for **every** admissible `u_0` (every normalized decomposition),
not only for a generic one.

## Setting (notation of `YangN4Haupt.lean`, `d = 3`, `m = 4`)

* `alg : BilinearAlgorithm K 4 2 4 r` with (N1) `SN1` and (N2) `SN2`. A normalized
  decomposition *is* the choice of an admissible pair `(p, u_0)` after the change of basis R3
  (`p = e_0`, `u_i = e_i`), so “for every admissible `u_0`” is “for every `alg` with (N1),
  (N2)”.
* `a_t = (α_t(e_{i,0}))_i ∈ K⁴` is `avecs alg t`; the vector `b_t` of the prose appears only
  through the linear form `y ↦ β_t(emb y)`, `emb y = (0; y)`.
* `Ψ(u, y)_t = (a_t·u) β_t(emb y)`; `f_i = φ alg i`, `J = J alg`, `F_i = Fq alg i`,
  `L = Lq alg`, `H = Hq alg` (all from `YangN4Haupt.lean`), `rk f = finrank (range f)`.
* **Symmetric** (`IsSymm alg`, prose Folgerung V1): there are a linear automorphism `e` of
  `K⁴` (the matrix `G` of the prose) and scalars `μ_t` with
  `β_t(emb (e y)) = μ_t · (a_t·y)` for all `t`, `y` (this is `Gᵀ b_t = μ_t a_t`).
  We do **not** require `μ_t ≠ 0`; see “Deviations” below.

## Main results

* `lemmaV'` (**Lemma V′**): (N1), (N2) and a common kernel vector
  `0 ≠ x ∈ ker F_1 ∩ ker F_2 ∩ ker F_3` give `IsSymm alg`.
* `noProd_I` (**Lemma S, part 1, second half**): in the symmetric case the space `I` of
  quadratic forms `q` with `μ_t q(a_t) = 0` for all `t` contains no product of two nonzero
  linear forms.
* `finrank_I_add_rkL_le` (**Lemma S, part 1, first half**, as an inequality):
  `dim I + rk L ≤ 6`.
* `eight_le_rkH` (**Lemma S, what Satz B needs**): symmetric, (N1), (N2) and `dim I ≤ 2`
  give `rk H ≥ 8`.
* `eight_le_rkH_of_four_le_rkL`: symmetric, (N1), (N2), `rk L ≥ 4` give `rk H ≥ 8`
  (covers parts 2 and 3 of the prose Lemma S, in the direction needed).
* `satzB` (**Satz B**, B-009): for every normalized decomposition of length 25 over any field,
  `(rk L, rk H) ∈ {(3,6), (5,8)}`; `satzB_symm`: in the case (3,6) it is symmetric.
* `satzB_global`: every decomposition of length 25 over any field `K` has a normalized form over
  `AlgebraicClosure K` (of the same length 25) with `(rk L, rk H) ∈ {(3,6), (5,8)}`.

## Hypotheses taken from the parallel task S2-14 (not axioms, not `sorry`)

Satz B uses two results of task S2-14 (Satz A and the consequence of Lemma 13′). As required by
the task, they are **explicit hypotheses** of the theorems, written in exactly the form and
notation reported by S2-14 (`SatzA444.SatzAStatement` and the statement of
`SatzA444.exists_common_kernel`), but as definitions of this file:

* `SatzAHyp K` (= `SatzA444.SatzAStatement K`): for every `alg : BilinearAlgorithm K 4 2 4 25`
  with (N1), (N2) and every `ρ` with
  `IsGreatest (Set.range (rkComb (Fq alg))) ρ`:
  `ρ = 3 ∧ ((rk L, rk H) = (3,6) ∨ (rk L, rk H) = (4,7) ∨ (rk L, rk H) = (5,7) ∨
  (rk L, rk H) = (5,8))`.
* `CommonKernelHyp K` (= the statement of `SatzA444.exists_common_kernel`, universally
  quantified): for every `alg : BilinearAlgorithm K 4 2 4 25` with (N1), (N2):
  if `(rk L, rk H) = (3,6) ∨ (rk L, rk H) = (4,7) ∨ (rk L, rk H) = (5,7)`, then
  `∃ x : Fin 4 → K, x ≠ 0 ∧ ∀ i, Fq alg i x = 0`.

In round 5 the hypotheses are discharged by `SatzA444.satzA_statement`-style proofs of S2-14.

## Deviations from the prose (documented; the statements are unchanged or stronger)

1. **Lemma V′ instead of Lemma V**: only
   linear algebra at one point `u_0`, no Zariski density.
2. **R1 is not needed.** The prose needs `μ_t ≠ 0` (hence `b_t ≠ 0`, a condition on the choice of
   `p`) only to rescale the coordinates. Here the coordinate `t` is weighted by `μ_t` instead
   (`I` is defined with `μ_t q(a_t) = 0`), so terms with `μ_t = 0` simply drop out of `I`.
   Lemma V′ is proved without any condition on `β_t`.
3. **Lemma S without generic `u_0` and without `Syz₁`.** The prose computes
   `rk H = 8 − dim Syz₁` and needs, for `rk L = 4`, that the restrictions `q̄_1, q̄_2` to the
   plane `x_0 = 0` are coprime, which holds only for generic `u_0` (part 3, the hardest part,
   algebraic geometry of a complete intersection). Here only `rk H ≥ 8` is proved, directly
   for the given `u_0`, by a different argument that uses (N1): if `c ∈ ker H`, the quadrics
   `P_1, P_2, P_3` of the three components and `Z = ∑ x_i z_i` (with `f_0(z_i)` the
   `J`-parts) satisfy the polynomial identity `x_0 Z + x_1 P_1 + x_2 P_2 + x_3 P_3 = 0`;
   `P_i ∈ I` gives `x_0(a_t) Z(a_t) = 0`, and (N1) `x_0(a_t) ≠ 0` gives `Z ∈ I`. The syzygy
   lemma `SatzB444Poly.syz` (`dim I ≤ 2`, no product in `I`, `K[x_0,…,x_3]` a UFD) gives
   `P_i = 0`, and then `c` lies in a 4-dimensional space. This is a **new argument, not in the
   prose**; it makes Satz B hold for every admissible `u_0`.
   The upper bound `rk H ≤ 8` and part 4 (`rk H = 8 − dim Syz₁`) are not formalised; Satz B
   does not need them.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzB444

open Module YangN4Haupt SatzB444Poly MvPolynomial

universe u

/-! ## The hypotheses from task S2-14 -/

/-- **Hypothesis: Satz A** (statement of `SatzA444.SatzAStatement` of task S2-14, verbatim). -/
def SatzAHyp (K : Type u) [Field K] : Prop :=
  ∀ alg : BilinearAlgorithm K 4 2 4 25, SN1 (d := 3) alg → SN2 (d := 3) alg →
    ∀ ρ : ℕ, IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) ρ →
      ρ = 3 ∧
      ((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))

/-- **Hypothesis: common kernel from Lemma 13′** (statement of
`SatzA444.exists_common_kernel` of task S2-14, quantified over all `alg`). -/
def CommonKernelHyp (K : Type u) [Field K] : Prop :=
  ∀ alg : BilinearAlgorithm K 4 2 4 25, SN1 (d := 3) alg → SN2 (d := 3) alg →
    ((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7)) →
    ∃ x : Fin 4 → K, x ≠ 0 ∧ ∀ i, Fq (d := 3) alg i x = 0

/-! ## Basic objects -/

section Objects

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- `a_t = (α_t(e_{i,0}))_i`. -/
def avecs (t : Fin r) : Fin 4 → K := fun i => alg.alpha t (eA (d := 3) i 0)

theorem φ_apply_apply (i : Fin 4) (y : Fin 4 → K) (t : Fin r) :
    φ (d := 3) alg i y t = avecs alg t i * alg.beta t (emb y) := rfl

/-- (N1) in coordinates: `a_t,0 ≠ 0`. -/
theorem avecs_zero_ne (h1 : SN1 (d := 3) alg) (t : Fin r) : avecs alg t 0 ≠ 0 := h1 t

theorem emb_ne_zero {y : Fin 4 → K} (hy : y ≠ 0) : (emb y : Matrix (Fin 2) (Fin 4) K) ≠ 0 := by
  intro h
  apply hy
  apply emb_injective (K := K) (m := 4)
  rw [h, map_zero]

/-- **(Ψ1)** from (N2): if `(a_t·u) β_t(emb y) = 0` for all `t` and `y ≠ 0`, then `u = 0`
(prose Section 2, Folgerung 7 applied to `U`). -/
theorem psi_nonsing (h2 : SN2 (d := 3) alg) (u y : Fin 4 → K) (hy : y ≠ 0)
    (h : ∀ t, (∑ i, u i * avecs alg t i) * alg.beta t (emb y) = 0) : u = 0 := by
  have hli := h2 (emb y) (emb_ne_zero hy)
  rw [Fintype.linearIndependent_iff] at hli
  funext i
  apply hli u
  funext t
  have := h t
  simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply]
  rw [← this, Finset.sum_mul]
  refine Finset.sum_congr rfl fun j _ => ?_
  show u j * (alg.alpha t (eA (d := 3) j 0) * alg.beta t (emb y)) = _
  simp only [avecs]
  ring

/-- **Symmetric** (prose Folgerung V1, `Gᵀ b_t = μ_t a_t`): there are an automorphism `e` of
`K⁴` and scalars `μ_t` with `β_t(emb (e y)) = μ_t (a_t · y)`. -/
def IsSymm : Prop :=
  ∃ (e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K)) (μ : Fin r → K),
    ∀ t y, alg.beta t (emb (e y)) = μ t * ∑ i, y i * avecs alg t i

end Objects

/-! ## Lemma V′ -/

section LemmaV

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- **Lemma V′**: under (N1), (N2),
a common kernel vector `x ≠ 0` of `F_1, F_2, F_3` (that is, `N(u_0) ≠ 0`) forces the
symmetry. -/
theorem lemmaV' (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg) (x : Fin 4 → K) (hx : x ≠ 0)
    (hN : ∀ i, Fq (d := 3) alg i x = 0) : IsSymm alg := by
  classical
  -- `f_j(x) ∈ J = f_0(U)` for every `j`
  have hz : ∀ j : Fin 4, ∃ z, φ (d := 3) alg 0 z = φ (d := 3) alg j x := by
    intro j
    refine Fin.cases ⟨x, rfl⟩ (fun i => ?_) j
    have h0 := hN i
    have : φ (d := 3) alg i.succ x ∈ J (d := 3) alg := by
      rw [← π_eq_zero_iff]
      exact h0
    obtain ⟨z, hz⟩ := this
    exact ⟨z, hz⟩
  choose z hz using hz
  -- `φ(u) = ∑ u_j z_j`
  let g : (Fin 4 → K) →ₗ[K] (Fin 4 → K) :=
    { toFun := fun u => ∑ j, u j • z j
      map_add' := fun u v => by simp [add_smul, Finset.sum_add_distrib]
      map_smul' := fun c u => by simp [Finset.smul_sum, smul_smul] }
  have hg : ∀ u, g u = ∑ j, u j • z j := fun _ => rfl
  -- key identity: `a_t,0 β_t(emb (g u)) = (a_t·u) β_t(emb x)`
  have key : ∀ u t, avecs alg t 0 * alg.beta t (emb (g u)) =
      (∑ i, u i * avecs alg t i) * alg.beta t (emb x) := by
    intro u t
    have h := congrFun (congrArg (φ (d := 3) alg 0) (hg u)) t
    rw [map_sum] at h
    simp only [map_smul] at h
    rw [Finset.sum_apply] at h
    simp only [Pi.smul_apply, smul_eq_mul, hz] at h
    rw [← φ_apply_apply, h, Finset.sum_mul]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [φ_apply_apply]
    ring
  have hinj : Function.Injective g := by
    rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
    intro u hu
    apply psi_nonsing alg h2 u x hx
    intro t
    rw [← key u t, hu, map_zero, map_zero, mul_zero]
  refine ⟨LinearEquiv.ofInjectiveEndo g hinj, fun t => alg.beta t (emb x) / avecs alg t 0, ?_⟩
  intro t y
  have hk := key y t
  have ha := avecs_zero_ne alg h1 t
  show alg.beta t (emb (g y)) = _
  field_simp
  rw [mul_comm, hk]
  ring

end LemmaV

/-! ## Lemma S -/

section LemmaS

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- The quadratic forms: `R_2 = span {x_i x_j : i ≤ j}`. -/
noncomputable def R2 : Submodule K (Poly K) :=
  Submodule.span K (Set.range fun p : {p : Fin 4 × Fin 4 // p.1 ≤ p.2} => X p.1.1 * X p.1.2)

theorem X_mul_X_mem_R2 (i j : Fin 4) : (X i * X j : Poly K) ∈ R2 := by
  rcases le_total i j with h | h
  · exact Submodule.subset_span ⟨⟨(i, j), h⟩, rfl⟩
  · rw [mul_comm]
    exact Submodule.subset_span ⟨⟨(j, i), h⟩, rfl⟩

theorem X_mul_lin_mem_R2 (i : Fin 4) (y : Fin 4 → K) : X i * lin y ∈ (R2 : Submodule K (Poly K)) := by
  rw [lin_apply, Finset.mul_sum]
  refine Submodule.sum_mem _ fun l _ => ?_
  have : (X i * (C (y l) * X l) : Poly K) = y l • (X i * X l) := by
    rw [smul_eq_C_mul]; ring
  rw [this]
  exact Submodule.smul_mem _ _ (X_mul_X_mem_R2 i l)

theorem finrank_R2_le : finrank K (R2 : Submodule K (Poly K)) ≤ 10 :=
  (finrank_range_le_card _).trans (by decide)

instance : FiniteDimensional K (R2 : Submodule K (Poly K)) :=
  FiniteDimensional.span_of_finite K (Set.finite_range _)

theorem isHomogeneous_of_mem_R2 {q : Poly K} (hq : q ∈ R2) : q.IsHomogeneous 2 := by
  have : (R2 : Submodule K (Poly K)) ≤ homogeneousSubmodule (Fin 4) K 2 := by
    rw [R2, Submodule.span_le]
    rintro _ ⟨p, rfl⟩
    exact (isHomogeneous_X K p.1.1).mul (isHomogeneous_X K p.1.2)
  exact this hq

/-- The weighted evaluation `q ↦ (μ_t q(a_t))_t`. -/
noncomputable def evμ (μ : Fin r → K) : Poly K →ₗ[K] (Fin r → K) where
  toFun q t := μ t * eval (avecs alg t) q
  map_add' p q := by funext t; simp [mul_add]
  map_smul' c q := by funext t; simp [smul_eq_C_mul]; ring

theorem evμ_apply (μ : Fin r → K) (q : Poly K) (t : Fin r) :
    evμ alg μ q t = μ t * eval (avecs alg t) q := rfl

/-- The space `I` of quadratic forms `q` with `μ_t q(a_t) = 0` for all `t`. -/
noncomputable def Iμ (μ : Fin r → K) : Submodule K (Poly K) :=
  R2 ⊓ LinearMap.ker (evμ alg μ)

instance (μ : Fin r → K) : FiniteDimensional K (Iμ alg μ) :=
  Submodule.finiteDimensional_of_le inf_le_left

variable {alg}

/-- In the symmetric case, `f_k(e y)` is the weighted evaluation of `x_k ℓ_y`. -/
theorem φ_e {e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K)} {μ : Fin r → K}
    (he : ∀ t y, alg.beta t (emb (e y)) = μ t * ∑ i, y i * avecs alg t i) (k : Fin 4)
    (y : Fin 4 → K) : φ (d := 3) alg k (e y) = evμ alg μ (X k * lin y) := by
  funext t
  rw [φ_apply_apply, he, evμ_apply, eval_mul, eval_X, eval_lin]
  ring

theorem φ_eq {e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K)} {μ : Fin r → K}
    (he : ∀ t y, alg.beta t (emb (e y)) = μ t * ∑ i, y i * avecs alg t i) (k : Fin 4)
    (y : Fin 4 → K) : φ (d := 3) alg k y = evμ alg μ (X k * lin (e.symm y)) := by
  rw [← φ_e he, LinearEquiv.apply_symm_apply]

/-- **Lemma S, part 1 (no products).** In the symmetric case, under (N2), `I` contains no
product of two nonzero linear forms. -/
theorem noProd_I (h2 : SN2 (d := 3) alg) {e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K)} {μ : Fin r → K}
    (he : ∀ t y, alg.beta t (emb (e y)) = μ t * ∑ i, y i * avecs alg t i) :
    NoProd (Iμ alg μ) := by
  intro y y' hy hy' hmem
  have hker : evμ alg μ (lin y * lin y') = 0 := hmem.2
  have hey' : e y' ≠ 0 := by
    intro h0; apply hy'; rw [← e.symm_apply_apply y', h0, map_zero]
  apply hy
  apply psi_nonsing alg h2 y (e y') hey'
  intro t
  have := congrFun hker t
  rw [evμ_apply, eval_mul, eval_lin, eval_lin, Pi.zero_apply] at this
  rw [he]
  calc (∑ i, y i * avecs alg t i) * (μ t * ∑ i, y' i * avecs alg t i)
      = μ t * ((∑ l, y l * avecs alg t l) * ∑ l, y' l * avecs alg t l) := by ring
    _ = 0 := this

/-- `rk L + dim J = dim (im ℓ + J)`. -/
theorem rkL_add_four (h1 : SN1 (d := 3) alg) :
    finrank K (LinearMap.range (Lq (d := 3) alg)) + 4 =
      finrank K (LinearMap.range (ell (d := 3) alg) ⊔ J (d := 3) alg : Submodule K (Fin r → K)) := by
  have hLq : LinearMap.range (Lq (d := 3) alg) =
      (LinearMap.range (ell (d := 3) alg)).map (π (d := 3) alg) := by
    rw [← LinearMap.range_comp]
    rfl
  have hker : LinearMap.ker (π (d := 3) alg) = J (d := 3) alg := Submodule.ker_mkQ _
  have h1' := YangN4Lemma13.finrank_map_add_finrank_inf_ker (π (d := 3) alg)
    (LinearMap.range (ell (d := 3) alg))
  rw [hker] at h1'
  have h2' := Submodule.finrank_sup_add_finrank_inf_eq (LinearMap.range (ell (d := 3) alg))
    (J (d := 3) alg)
  have hJ : finrank K (J (d := 3) alg) = 4 := finrank_J (d := 3) alg h1
  rw [hLq]
  omega

/-- **Lemma S, part 1 (dimension), as an inequality:** `dim I + rk L ≤ 6`. -/
theorem finrank_I_add_rkL_le (h1 : SN1 (d := 3) alg) {e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K)}
    {μ : Fin r → K} (he : ∀ t y, alg.beta t (emb (e y)) = μ t * ∑ i, y i * avecs alg t i) :
    finrank K (Iμ alg μ) + finrank K (LinearMap.range (Lq (d := 3) alg)) ≤ 6 := by
  -- rank–nullity for `evμ` on `R_2`
  let f := (evμ alg μ).domRestrict R2
  have hrn := LinearMap.finrank_range_add_finrank_ker f
  have hrange : LinearMap.range f = (R2 : Submodule K (Poly K)).map (evμ alg μ) :=
    LinearMap.range_domRestrict _ _
  have hI : Iμ alg μ = (LinearMap.ker f).map (R2 : Submodule K (Poly K)).subtype := by
    ext q
    constructor
    · rintro ⟨hq, hk⟩
      exact ⟨⟨q, hq⟩, hk, rfl⟩
    · rintro ⟨⟨q', hq'⟩, hk, rfl⟩
      exact ⟨hq', hk⟩
  have hIf : finrank K (Iμ alg μ) = finrank K (LinearMap.ker f) := by
    rw [hI, Submodule.finrank_map_subtype_eq]
  -- `im ℓ + J ⊆ evμ(R_2)`
  have hle : (LinearMap.range (ell (d := 3) alg) ⊔ J (d := 3) alg : Submodule K (Fin r → K)) ≤
      (R2 : Submodule K (Poly K)).map (evμ alg μ) := by
    have hφ : ∀ k y, φ (d := 3) alg k y ∈ (R2 : Submodule K (Poly K)).map (evμ alg μ) := by
      intro k y
      rw [φ_eq he]
      exact ⟨_, X_mul_lin_mem_R2 k _, rfl⟩
    apply sup_le
    · rintro _ ⟨u, rfl⟩
      rw [ell_apply]
      exact Submodule.sum_mem _ fun i _ => hφ _ _
    · rintro _ ⟨y, rfl⟩
      exact hφ 0 y
  have hmono := Submodule.finrank_mono hle
  have hL := rkL_add_four h1 (alg := alg)
  have h10 := finrank_R2_le (K := K)
  rw [hrange] at hrn
  have : finrank K (R2 : Submodule K (Poly K)) = finrank K (R2 : Submodule K (Poly K)) := rfl
  omega

/-- The map `(c_{12}, c_{13}, c_{23}) ↦ c ∈ U^{∧3}`. -/
def σ : (Fin 3 → Fin 4 → K) →ₗ[K] skewSpace K (Fin 4 → K) 3 where
  toFun w := ⟨![![0, w 0, w 1], ![-w 0, 0, w 2], ![-w 1, -w 2, 0]], by
    refine ⟨fun i => ?_, fun i j => ?_⟩
    · fin_cases i <;> rfl
    · fin_cases i <;> fin_cases j <;> simp⟩
  map_add' w w' := by
    apply Subtype.ext
    funext i j
    fin_cases i <;> fin_cases j <;> simp <;> abel
  map_smul' c w := by
    apply Subtype.ext
    funext i j
    fin_cases i <;> fin_cases j <;> simp

/-- Evaluation of a linear form at a point, coordinates. -/
theorem eval_lin_four (v y : Fin 4 → K) :
    eval v (lin y) = y 0 * v 0 + y 1 * v 1 + y 2 * v 2 + y 3 * v 3 := by
  rw [eval_lin, Fin.sum_univ_four]

/-- Dimension count: a linear map on `(K⁴)³` whose kernel meets the kernel of a map to `K⁴`
only in `0` has rank at least `8`. -/
theorem eight_le_of_ker {W : Type*} [AddCommGroup W] [Module K W]
    (f : (Fin 3 → Fin 4 → K) →ₗ[K] W) (κ : (Fin 3 → Fin 4 → K) →ₗ[K] (Fin 4 → K))
    (h : ∀ w, f w = 0 → κ w = 0 → w = 0) {n : ℕ} (hn : finrank K (LinearMap.range f) ≤ n) :
    8 ≤ n := by
  have hm := YangN4Lemma13.finrank_map_add_finrank_inf_ker κ (LinearMap.ker f)
  have hbot : (LinearMap.ker f ⊓ LinearMap.ker κ : Submodule K _) = ⊥ := by
    rw [eq_bot_iff]
    intro w hw
    rw [Submodule.mem_inf, LinearMap.mem_ker, LinearMap.mem_ker] at hw
    rw [Submodule.mem_bot]
    exact h w hw.1 hw.2
  rw [hbot, finrank_bot] at hm
  have h4 : finrank K ((LinearMap.ker f).map κ) ≤ 4 := by
    have := Submodule.finrank_le ((LinearMap.ker f).map κ)
    simpa using this
  have hrn := LinearMap.finrank_range_add_finrank_ker f
  have h12 : finrank K (Fin 3 → Fin 4 → K) = 12 := by rw [Module.finrank_pi_fintype]; simp
  omega

set_option maxHeartbeats 1600000 in
/-- **Lemma S, the part Satz B needs:** symmetric, (N1), (N2) and `dim I ≤ 2` give
`rk H ≥ 8`. -/
theorem eight_le_rkH (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    {e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K)} {μ : Fin r → K}
    (he : ∀ t y, alg.beta t (emb (e y)) = μ t * ∑ i, y i * avecs alg t i)
    (hdim : finrank K (Iμ alg μ) ≤ 2) :
    8 ≤ finrank K (LinearMap.range (Hq (d := 3) alg)) := by
  classical
  let H' := (Hq (d := 3) alg) ∘ₗ σ
  -- the linear map `w ↦ (w'_0(0), w'_1(0), w'_2(0), w'_0(3))` with `w' = e⁻¹ w`
  let κ : (Fin 3 → Fin 4 → K) →ₗ[K] (Fin 4 → K) :=
    { toFun := fun w => ![e.symm (w 0) 0, e.symm (w 1) 0, e.symm (w 2) 0, e.symm (w 0) 3]
      map_add' := fun w w' => by funext l; fin_cases l <;> simp
      map_smul' := fun c w => by funext l; fin_cases l <;> simp }
  -- main step: `ker H' ∩ ker κ = 0`
  have hmain : ∀ w, H' w = 0 → κ w = 0 → w = 0 := by
    intro w hw hκ
    -- the `J`-parts
    have hrow : ∀ i : Fin 3, ∃ z, φ (d := 3) alg 0 z =
        ell (d := 3) alg (((σ w : skewSpace K (Fin 4 → K) 3) : Fin 3 → Fin 3 → Fin 4 → K) i) := by
      intro i
      have h0 := congrFun hw i
      change Lq (d := 3) alg _ = 0 at h0
      rw [Lq_apply, π_eq_zero_iff] at h0
      obtain ⟨z, hz⟩ := h0
      exact ⟨z, hz⟩
    choose z hz using hrow
    set w' : Fin 3 → Fin 4 → K := fun j => e.symm (w j)
    set z' : Fin 3 → Fin 4 → K := fun j => e.symm (z j)
    have hwe : ∀ j, w j = e (w' j) := fun j => (e.apply_symm_apply _).symm
    have hze : ∀ j, z j = e (z' j) := fun j => (e.apply_symm_apply _).symm
    -- the quadrics `P_i` and `Z`
    set P0 : Poly K := X 2 * lin (w' 0) + X 3 * lin (w' 1) - X 0 * lin (z' 0)
    set P1 : Poly K := -(X 1 * lin (w' 0)) + X 3 * lin (w' 2) - X 0 * lin (z' 1)
    set P2 : Poly K := -(X 1 * lin (w' 1)) - X 2 * lin (w' 2) - X 0 * lin (z' 2)
    set Zq : Poly K := X 1 * lin (z' 0) + X 2 * lin (z' 1) + X 3 * lin (z' 2)
    have hφe : ∀ k y, φ (d := 3) alg k (e y) = evμ alg μ (X k * lin y) := φ_e he
    have hP0 : evμ alg μ P0 = 0 := by
      have h := hz 0
      rw [ell_apply, Fin.sum_univ_three] at h
      simp only [σ, LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
        Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, map_zero, zero_add] at h
      simp only [P0, map_sub, map_add, ← hφe, ← hwe, ← hze, Fin.succ_zero_eq_one,
        Fin.succ_one_eq_two] at h ⊢
      rw [h]
      have e3 : (Fin.succ (2 : Fin 3) : Fin 4) = 3 := rfl
      rw [e3]
      abel
    have hP1 : evμ alg μ P1 = 0 := by
      have h := hz 1
      rw [ell_apply, Fin.sum_univ_three] at h
      simp only [σ, LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
        Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, map_zero, add_zero,
        map_neg] at h
      simp only [P1, map_sub, map_add, map_neg, ← hφe, ← hwe, ← hze, Fin.succ_zero_eq_one,
        Fin.succ_one_eq_two] at h ⊢
      have e3 : (Fin.succ (2 : Fin 3) : Fin 4) = 3 := rfl
      rw [e3] at h
      rw [h]
      abel
    have hP2 : evμ alg μ P2 = 0 := by
      have h := hz 2
      rw [ell_apply, Fin.sum_univ_three] at h
      simp only [σ, LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
        Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, map_zero, add_zero,
        map_neg] at h
      simp only [P2, map_sub, map_add, map_neg, ← hφe, ← hwe, ← hze, Fin.succ_zero_eq_one,
        Fin.succ_one_eq_two] at h ⊢
      rw [h]
      abel
    have hid : X 0 * Zq + X 1 * P0 + X 2 * P1 + X 3 * P2 = 0 := by
      simp only [Zq, P0, P1, P2]; ring
    -- `Z ∈ I` by (N1)
    have hZ : evμ alg μ Zq = 0 := by
      funext t
      have ht := congrArg (eval (avecs alg t)) hid
      have q0 := congrFun hP0 t
      have q1 := congrFun hP1 t
      have q2 := congrFun hP2 t
      rw [evμ_apply, Pi.zero_apply] at q0 q1 q2
      rw [evμ_apply]
      simp only [eval_add, eval_mul, eval_X, map_zero] at ht
      have : avecs alg t 0 * (μ t * eval (avecs alg t) Zq) = 0 := by
        calc avecs alg t 0 * (μ t * eval (avecs alg t) Zq)
            = μ t * (avecs alg t 0 * eval (avecs alg t) Zq + avecs alg t 1 * eval (avecs alg t) P0
              + avecs alg t 2 * eval (avecs alg t) P1 + avecs alg t 3 * eval (avecs alg t) P2)
              - avecs alg t 1 * (μ t * eval (avecs alg t) P0)
              - avecs alg t 2 * (μ t * eval (avecs alg t) P1)
              - avecs alg t 3 * (μ t * eval (avecs alg t) P2) := by ring
          _ = 0 := by rw [ht, q0, q1, q2]; ring
      rw [Pi.zero_apply]
      exact (mul_eq_zero.mp this).resolve_left (avecs_zero_ne alg h1 t)
    have hmemR : ∀ q, q ∈ ({Zq, P0, P1, P2} : Set (Poly K)) → q ∈ (R2 : Submodule K (Poly K)) := by
      have hX := X_mul_lin_mem_R2 (K := K)
      intro q hq
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hq
      rcases hq with rfl | rfl | rfl | rfl
      · exact Submodule.add_mem _ (Submodule.add_mem _ (hX _ _) (hX _ _)) (hX _ _)
      · exact Submodule.sub_mem _ (Submodule.add_mem _ (hX _ _) (hX _ _)) (hX _ _)
      · exact Submodule.sub_mem _ (Submodule.add_mem _ (Submodule.neg_mem _ (hX _ _)) (hX _ _))
          (hX _ _)
      · exact Submodule.sub_mem _ (Submodule.sub_mem _ (Submodule.neg_mem _ (hX _ _)) (hX _ _))
          (hX _ _)
    have hQ : ∀ i, ![Zq, P0, P1, P2] i ∈ Iμ alg μ := by
      intro i
      fin_cases i
      · exact ⟨hmemR _ (by simp), hZ⟩
      · exact ⟨hmemR _ (by simp), hP0⟩
      · exact ⟨hmemR _ (by simp), hP1⟩
      · exact ⟨hmemR _ (by simp), hP2⟩
    have hsum : ∑ i, X i * ![Zq, P0, P1, P2] i = 0 := by
      rw [Fin.sum_univ_four]
      exact hid
    have hzero := syz (Iμ alg μ) (fun q hq => isHomogeneous_of_mem_R2 hq.1) hdim
      (noProd_I h2 he) _ hQ hsum
    have hP0z : P0 = 0 := hzero 1
    have hP1z : P1 = 0 := hzero 2
    have hP2z : P2 = 0 := hzero 3
    -- read off the coefficients by evaluating at points with `v_0 = 0`
    have ev0 : ∀ v : Fin 4 → K, eval v P0 = 0 := fun v => by rw [hP0z, map_zero]
    have ev1 : ∀ v : Fin 4 → K, eval v P1 = 0 := fun v => by rw [hP1z, map_zero]
    have ev2 : ∀ v : Fin 4 → K, eval v P2 = 0 := fun v => by rw [hP2z, map_zero]
    have a1 := ev0 ![0, 0, 1, 0]
    have a2 := ev0 ![0, 0, 0, 1]
    have a3 := ev0 ![0, 1, 1, 0]
    have a4 := ev0 ![0, 1, 0, 1]
    have a5 := ev0 ![0, 0, 1, 1]
    have b1 := ev1 ![0, 0, 0, 1]
    have b2 := ev1 ![0, 1, 0, 1]
    have c1 := ev2 ![0, 0, 1, 0]
    simp only [P0, P1, P2, eval_sub, eval_add, eval_neg, eval_mul, eval_X, eval_lin_four,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
      Matrix.tail_cons, Matrix.cons_val_three] at a1 a2 a3 a4 a5 b1 b2 c1
    have hκ0 := congrFun hκ 0
    have hκ1 := congrFun hκ 1
    have hκ2 := congrFun hκ 2
    have hκ3 := congrFun hκ 3
    simp only [κ, LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, Matrix.cons_val_three,
      Pi.zero_apply] at hκ0 hκ1 hκ2 hκ3
    have hw'0 : w' 0 = 0 := by
      funext l; fin_cases l
      · exact hκ0
      · simp only [Fin.isValue, Fin.mk_one, Pi.zero_apply]; linear_combination a3 - a1
      · simp only [Fin.isValue, Fin.reduceFinMk, Pi.zero_apply]; linear_combination a1
      · exact hκ3
    have hw'1 : w' 1 = 0 := by
      funext l; fin_cases l
      · exact hκ1
      · simp only [Fin.isValue, Fin.mk_one, Pi.zero_apply]; linear_combination a4 - a2
      · simp only [Fin.isValue, Fin.reduceFinMk, Pi.zero_apply]
        linear_combination a5 - a1 - a2 - hκ3
      · simp only [Fin.isValue, Fin.reduceFinMk, Pi.zero_apply]; linear_combination a2
    have hw'2 : w' 2 = 0 := by
      funext l; fin_cases l
      · exact hκ2
      · simp only [Fin.isValue, Fin.mk_one, Pi.zero_apply]
        linear_combination b2 - b1 + hκ3 + (a3 - a1)
      · simp only [Fin.isValue, Fin.reduceFinMk, Pi.zero_apply]; linear_combination -c1
      · simp only [Fin.isValue, Fin.reduceFinMk, Pi.zero_apply]; linear_combination b1
    funext j
    rw [hwe j]
    fin_cases j
    · simp [hw'0]
    · simp [hw'1]
    · simp [hw'2]
  exact eight_le_of_ker H' κ hmain (Submodule.finrank_mono (LinearMap.range_comp_le_range _ _))

/-- **Lemma S for `rk L ≥ 4`** (parts 1 to 3 of the prose, in the direction needed): in the
symmetric case, under (N1), (N2), `rk L ≥ 4` gives `rk H ≥ 8`. -/
theorem eight_le_rkH_of_four_le_rkL (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hs : IsSymm alg) (hL : 4 ≤ finrank K (LinearMap.range (Lq (d := 3) alg))) :
    8 ≤ finrank K (LinearMap.range (Hq (d := 3) alg)) := by
  obtain ⟨e, μ, he⟩ := hs
  have := finrank_I_add_rkL_le h1 he
  exact eight_le_rkH h1 h2 he (by omega)

end LemmaS

/-! ## Satz B -/

section SatzB

variable {K : Type u} [Field K]

/-- **Satz B** (B-009, prose Section 7, in a stronger form): for every
normalized decomposition of `⟨4,2,4⟩` of length 25 over any field (every admissible pair
`(p, u_0)`), `(rk L, rk H)` is `(3,6)` or `(5,8)`. The cases (4,7) and (5,7) are impossible.
Hypotheses: Satz A and the common-kernel consequence of Lemma 13′ (task S2-14). -/
theorem satzB (hA : SatzAHyp K) (hN : CommonKernelHyp K) (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg) :
    (finrank K (LinearMap.range (Lq (d := 3) alg)),
        finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
      (finrank K (LinearMap.range (Lq (d := 3) alg)),
        finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8) := by
  obtain ⟨ρ, hρ⟩ := exists_isGreatest_rkComb (Fq (d := 3) alg)
  obtain ⟨-, hcase⟩ := hA alg h1 h2 ρ hρ
  rcases hcase with h | h | h | h
  · exact Or.inl h
  · exfalso
    obtain ⟨x, hx, hNx⟩ := hN alg h1 h2 (Or.inr (Or.inl h))
    have hs := lemmaV' alg h1 h2 x hx hNx
    simp only [Prod.mk.injEq] at h
    have := eight_le_rkH_of_four_le_rkL h1 h2 hs (by omega)
    omega
  · exfalso
    obtain ⟨x, hx, hNx⟩ := hN alg h1 h2 (Or.inr (Or.inr h))
    have hs := lemmaV' alg h1 h2 x hx hNx
    simp only [Prod.mk.injEq] at h
    have := eight_le_rkH_of_four_le_rkL h1 h2 hs (by omega)
    omega
  · exact Or.inr h

/-- **Satz B, second part:** in the case (3,6) the decomposition is symmetric. -/
theorem satzB_symm (hN : CommonKernelHyp K) (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (h : (finrank K (LinearMap.range (Lq (d := 3) alg)),
        finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6)) : IsSymm alg := by
  obtain ⟨x, hx, hNx⟩ := hN alg h1 h2 (Or.inl h)
  exact lemmaV' alg h1 h2 x hx hNx

/-- **Satz B over every field:** every decomposition of `⟨4,2,4⟩` of length 25 over a field `K`
has a normalized form (N1), (N2) of length 25 over the algebraic closure of `K` with
`(rk L, rk H) ∈ {(3,6), (5,8)}`, symmetric in the case (3,6). The hypotheses are Satz A and the
common-kernel consequence of Lemma 13′ over the algebraic closure. -/
theorem satzB_global (K : Type u) [Field K] (hA : SatzAHyp (AlgebraicClosure K))
    (hN : CommonKernelHyp (AlgebraicClosure K)) (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      (((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (3, 6) ∧
          IsSymm alg') ∨
        (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8)) := by
  obtain ⟨r', hr', alg', h1, h2⟩ :=
    exists_normalized (d := 3) (alg.baseChange (AlgebraicClosure K))
  have hge := yang_theorem_two_algorithm (AlgebraicClosure K) 4 4 (le_refl _) (le_refl _) alg'
  have hr : r' = 25 := by norm_num at hge; omega
  subst hr
  refine ⟨alg', h1, h2, ?_⟩
  rcases satzB hA hN alg' h1 h2 with h | h
  · exact Or.inl ⟨h, satzB_symm hN alg' h1 h2 h⟩
  · exact Or.inr h

end SatzB

/-! ## Axiom check (printed in every build log, also in GitHub Actions)

Expected for each: `[propext, Classical.choice, Quot.sound]`. -/

#print axioms satzB
#print axioms satzB_symm
#print axioms satzB_global
#print axioms lemmaV'
#print axioms eight_le_rkH
#print axioms eight_le_rkH_of_four_le_rkL
#print axioms finrank_I_add_rkL_le
#print axioms noProd_I
#print axioms SatzB444Poly.syz

end SatzB444
end YangBounds
