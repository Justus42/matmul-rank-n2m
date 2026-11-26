module

public import YangBounds.Statements
public import YangBounds.Lemma13Prime

@[expose] public section

/-!
# Theorem A (“Satz A”): the four remaining cases for `⟨4,2,4⟩` of length 25

Task S2-14 (stage 2, round 4, track A, role: formaliser).
Claim file: `behauptungen/B-008.md`.

Source: `lean/prosa/s2_444_spurA_r2.md` (task S2-05), Section 3 (Satz A, Folgerung A1, A2)
and Section 4 (Lemma 13′, application table). The underlying
lemmas are Yang's (arXiv:2609.14393v3), formalised in `YangN4Haupt.lean` and
`YangN4Lemma13.lean`.

## Prose statement (Section 3)

> **Satz A.** Hat ⟨4,2,4⟩ über einem Körper eine Zerlegung der Länge 25, so gilt in der
> Normalform (über dem algebraischen Abschluss, für jedes zulässige u_0):
> ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}.
> Außerdem ist rk Φ = 12 + rk H, …

## Translation

* “Normalform, zulässiges u_0” is a decomposition `alg : BilinearAlgorithm K 4 2 4 25` with
  (N1) `SN1` and (N2) `SN2` (definitions in `YangN4Haupt.lean`, prose `yang_n4.md`,
  Lemma 6). Every admissible `u_0` gives such a decomposition after the change of basis R3,
  and conversely; so “for every admissible `u_0`” is “for every `alg` with (N1), (N2)”.
  `n = d + 1` with `d = 3` (the implicit argument `d := 3` of the `YangN4Haupt` objects).
* `Q = ker W / J` is `Kbar alg`, `F_i` is `Fq alg i` (`i : Fin 3`, prose `i = 1, 2, 3`),
  `L` is `Lq alg`, `H` is `Hq alg`, `rk f` is `finrank K (LinearMap.range f)`.
* `ρ` is any number with `IsGreatest (Set.range (rkComb (Fq alg))) ρ` (the maximum of
  `rk(∑ γ_i F_i)`; it exists by `exists_isGreatest_rkComb`).
* The statement for normalized decompositions holds over **every** field `K` (no algebraic
  closure is used in these steps). The passage from an arbitrary decomposition over `K` to a
  normalized one over `AlgebraicClosure K` of the same length 25 is `satzA_exists`
  (it uses R1, R2, Lemma 6 and Yang's Theorem 2 for the length).
* `Φ` is `Φ alg` with values in `(Fin 25 → K) ⧸ J × (Fin 3 → Q)`; `im L × Q³` is
  `(range Lq).prod ⊤`.
* `Ĵ = Ψ(K⁴, U) = J + f_1(U) + f_2(U) + f_3(U)` is `JHat alg = ⨆ i : Fin 4, range (φ alg i)`.

## Main results

* `SatzAStatement K`, `satzA_statement`: Theorem A for normalized decompositions, as a `Prop`
  usable as a hypothesis (task S2-15), and its proof.
* `satzA`: the same as a theorem with explicit arguments, plus `dim Q = 5`.
* `satzA_global`: the prose statement as written: any decomposition of length 25 over any
  field has a normal form over the algebraic closure in which the conclusion holds.
* `satzA_exists`: from any decomposition of length 25 over any field to a normalized one over
  the algebraic closure, for which Theorem A holds.
* `finrank_range_Φ`: `rk Φ = 12 + rk H` (for every normalized decomposition of `⟨4,2,m⟩`…
  here stated for `⟨4,2,4⟩`, length 25).
* `corollaryA1`: in the cases (3,6), (4,7), (5,8), `Φ` maps onto `im L × Q³`.
* `finrank_JHat`, `corollaryA2`: `dim Ĵ = rk L + 4`; if `rk L = 5` then `Ĵ = ker W`, and
  `g(U) ⊆ Ĵ`.
* `Lemma13PrimeStatement`, `lemma13Prime_statement`: Lemma 13′ for `d = 3` in the notation of
  `YangN4Haupt.lean`, as a `Prop` and its proof.
* `sDim_table`: the application table of Lemma 13′ (prose Section 4): `s = 0` in the cases
  (3,6), (4,7), (5,7) and `s ≤ 1` in the case (5,8).
* `exists_common_kernel`: in the cases (3,6), (4,7), (5,7) the maps `F_1, F_2, F_3` have a
  common kernel vector `x ≠ 0` (`N ≠ 0`, the hypothesis (b) of Lemma V).

Not formalised (not needed for Satz B): the second half of Folgerung A1 (the isomorphism
`ker L → Q³ / im H`), and the remark “Ungleichung (1) ist in (3,6), (4,7), (5,8) eine
Gleichung” beyond `rk Φ = 12 + rk H` and A1.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzA444

open Module YangN4Haupt

universe u v w

/-! ## Lemma 13′ in the notation of `YangN4Haupt.lean` (`d = 3`) -/

/-- **Statement of Lemma 13′** (prose Section 4, `d = 3`, doubled form without ceiling), for a
field `K` and spaces `U`, `Q`: if `U`, `Q` are finite-dimensional, `F : Fin 3 → U → Q` linear,
`ρ` the maximum of `rk(∑ γ_i F_i)` and `γ` a maximiser, then
`3ρ + 2 s + rk L ≤ 2 rk H` with `s = dim ∑_i F_i(ker ∑_j γ_j F_j)`.

(Equivalent for natural numbers to `rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉`.) -/
def Lemma13PrimeStatement (K : Type u) [Field K] (U : Type v) (Q : Type w)
    [AddCommGroup U] [Module K U] [AddCommGroup Q] [Module K Q] : Prop :=
  FiniteDimensional K U → FiniteDimensional K Q →
  ∀ (F : Fin 3 → U →ₗ[K] Q) (ρ : ℕ),
    IsGreatest (Set.range fun γ : Fin 3 → K => finrank K (LinearMap.range (∑ i, γ i • F i))) ρ →
    ∀ γ : Fin 3 → K, finrank K (LinearMap.range (∑ i, γ i • F i)) = ρ →
      3 * ρ + 2 * finrank K (⨆ i, (LinearMap.ker (∑ j, γ j • F j)).map (F i) : Submodule K Q) +
          finrank K (LinearMap.range (sumMap F)) ≤
        2 * finrank K (LinearMap.range (skewExt (sumMap F)))

/-- **Lemma 13′** (`d = 3`) holds for all `K`, `U`, `Q`. -/
theorem lemma13Prime_statement (K : Type u) [Field K] (U : Type v) (Q : Type w)
    [AddCommGroup U] [Module K U] [AddCommGroup Q] [Module K Q] :
    Lemma13PrimeStatement K U Q := by
  intro _ _ F ρ hρ γ hγ
  have h : (1 + 2) * ρ + 2 * Lemma13Prime.sDim (∑ i, γ i • F i) F +
      1 * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F))) :=
    Lemma13Prime.lemma13Prime (e := 1) F ρ hρ γ hγ
  unfold Lemma13Prime.sDim at h
  omega

/-! ## Satz A -/

section SatzA

variable {K : Type u} [Field K]

/-- **Statement of Satz A** (prose Section 3) for normalized decompositions over `K`:
for every decomposition `alg` of `⟨4,2,4⟩` of length 25 with (N1) and (N2) and every `ρ`
that is the maximum of `rk(∑ γ_i F_i)`: `ρ = 3` and
`(rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}`. -/
def SatzAStatement (K : Type u) [Field K] : Prop :=
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

/-- The integer inequalities of Satz A (prose Section 3, items 1 to 6) for a normalized
decomposition: `dim Q = 5`, `rk L ≤ 5`, `rk H ≤ rk L + 3`, `3ρ + rk L ≤ 2 rk H`, `ρ ≥ 3`,
`rk L ≥ 3`. -/
theorem satzA_inequalities (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (ρ : ℕ) (hρ : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) ρ) :
    finrank K (Kbar (d := 3) alg) = 5 ∧
    finrank K (LinearMap.range (Lq (d := 3) alg)) ≤ 5 ∧
    finrank K (LinearMap.range (Hq (d := 3) alg)) ≤
      finrank K (LinearMap.range (Lq (d := 3) alg)) + 3 ∧
    3 * ρ + finrank K (LinearMap.range (Lq (d := 3) alg)) ≤
      2 * finrank K (LinearMap.range (Hq (d := 3) alg)) ∧
    3 ≤ ρ ∧ 3 ≤ finrank K (LinearMap.range (Lq (d := 3) alg)) := by
  -- item 1: `dim Q = 25 − 20 = 5`, and `im L ⊆ Q`
  have hq := finrank_Kbar (d := 3) alg h1
  have hLQ : finrank K (LinearMap.range (Lq (d := 3) alg)) ≤ finrank K (Kbar (d := 3) alg) :=
    Submodule.finrank_mono (range_Lq_le_Kbar alg)
  -- item 2: inequality (1), `3·4 + rk H ≤ rk L + 3·dim Q`
  have hI := ineq1 (d := 3) alg h1
  -- item 3: Lemma 13 with `d = 3`
  have h13 : 3 * ρ + (3 - 2) * finrank K (LinearMap.range (Lq (d := 3) alg)) ≤
      2 * finrank K (LinearMap.range (Hq (d := 3) alg)) :=
    YangN4Lemma13.lemma13_statement (K := K) (Fin 4 → K) ((Fin 25 → K) ⧸ J (d := 3) alg)
      inferInstance inferInstance 3 (by norm_num) (Fq alg) ρ hρ
  -- item 4: Lemma 14 (`m = 4 ≥ d = 3`)
  have h14 := lemma14 (d := 3) alg h1 h2 (by norm_num) hρ
  -- item 6: Lemma 8′
  have h8 := lemma8' (d := 3) alg h1 h2 (by norm_num)
  refine ⟨by omega, by omega, by omega, by omega, h14, h8⟩

/-- **Satz A** (prose Section 3) for normalized decompositions, with `dim Q = 5`. -/
theorem satzA (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (ρ : ℕ) (hρ : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) ρ) :
    ρ = 3 ∧ finrank K (Kbar (d := 3) alg) = 5 ∧
      ((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8)) := by
  obtain ⟨hq, hL5, h2', h13, h14, h8⟩ := satzA_inequalities alg h1 h2 ρ hρ
  simp only [Prod.mk.injEq]
  -- items 5 and 7: `ρ = 3`, then the case list
  refine ⟨by omega, hq, by omega⟩

/-- **Satz A** holds over every field (statement form for use as a hypothesis). -/
theorem satzA_statement (K : Type u) [Field K] : SatzAStatement K := by
  intro alg h1 h2 ρ hρ
  obtain ⟨hρ3, -, hcases⟩ := satzA alg h1 h2 ρ hρ
  exact ⟨hρ3, hcases⟩

/-- **Satz A, global form.** Every decomposition of `⟨4,2,4⟩` of length 25 over any field `K`
gives a decomposition of length 25 over the algebraic closure of `K` with (N1) and (N2)
(prose: R1, R2, Lemma 6; the length cannot drop below 25 by Yang's Theorem 2), and for every
such normalized decomposition the conclusion of Satz A holds (`satzA_statement`). -/
theorem satzA_exists (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' := by
  obtain ⟨r', hr', alg', h1, h2⟩ :=
    exists_normalized (d := 3) (alg.baseChange (AlgebraicClosure K))
  have h25 := yang_theorem_two_algorithm (AlgebraicClosure K) 4 4 le_rfl le_rfl alg'
  obtain rfl : r' = 25 := by omega
  exact ⟨alg', h1, h2⟩

/-- **Satz A, global form with conclusion** (prose Section 3, as stated there): every
decomposition of `⟨4,2,4⟩` of length 25 over any field `K` has a normal form over the
algebraic closure (length 25, (N1), (N2)) in which `ρ = 3` and
`(rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}`. -/
theorem satzA_global (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      ∀ ρ : ℕ, IsGreatest (Set.range (rkComb (Fq (d := 3) alg'))) ρ →
        ρ = 3 ∧
        ((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (3, 6) ∨
          (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (4, 7) ∨
          (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 7) ∨
          (finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
            finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8)) := by
  obtain ⟨alg', h1, h2⟩ := satzA_exists K alg
  exact ⟨alg', h1, h2, satzA_statement (AlgebraicClosure K) alg' h1 h2⟩

/-! ## `rk Φ = 12 + rk H` and Folgerung A1 -/

/-- `rk Φ = 12 + rk H` (prose Section 3, “Zu Φ”), from Lemma 10 (`ker Φ = {0} × ker H`). -/
theorem finrank_range_Φ (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg) :
    finrank K (LinearMap.range (Φ (d := 3) alg)) =
      12 + finrank K (LinearMap.range (Hq (d := 3) alg)) := by
  have hrn := LinearMap.finrank_range_add_finrank_ker (Φ (d := 3) alg)
  have hH := LinearMap.finrank_range_add_finrank_ker (Hq (d := 3) alg)
  rw [ker_Φ (d := 3) alg h1, ← (Submodule.equivMapOfInjective _ LinearMap.inr_injective
    (LinearMap.ker (Hq (d := 3) alg))).finrank_eq] at hrn
  rw [Module.finrank_prod, Module.finrank_pi_fintype] at hrn
  simp only [Module.finrank_fin_fun, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    smul_eq_mul] at hrn
  omega

/-- `im L × Q³` as a subspace of the target of `Φ`, and its dimension `rk L + 15`. -/
theorem finrank_imL_prod (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg) :
    finrank K ((LinearMap.range (Lq (d := 3) alg)).prod
        (⊤ : Submodule K (Fin 3 → Kbar (d := 3) alg))) =
      finrank K (LinearMap.range (Lq (d := 3) alg)) + 15 := by
  have hq := finrank_Kbar (d := 3) alg h1
  let ι := LinearMap.prodMap (LinearMap.range (Lq (d := 3) alg)).subtype
    (LinearMap.id : (Fin 3 → Kbar (d := 3) alg) →ₗ[K] (Fin 3 → Kbar (d := 3) alg))
  have hι : Function.Injective ι := by
    rintro ⟨a, b⟩ ⟨a', b'⟩ h
    simp only [ι, LinearMap.prodMap_apply, Prod.mk.injEq, LinearMap.id_apply] at h
    exact Prod.ext (Subtype.ext h.1) h.2
  have hr : LinearMap.range ι = (LinearMap.range (Lq (d := 3) alg)).prod ⊤ := by
    apply le_antisymm
    · rintro _ ⟨⟨a, b⟩, rfl⟩
      exact ⟨a.2, Submodule.mem_top⟩
    · rintro ⟨y, q⟩ ⟨hy, -⟩
      exact ⟨(⟨y, hy⟩, q), rfl⟩
  rw [← hr, LinearMap.finrank_range_of_inj hι, Module.finrank_prod, Module.finrank_pi_fintype]
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul]
  omega

/-- **Folgerung A1** (prose Section 3, first half): in the cases (3,6), (4,7), (5,8), `Φ` maps
onto `im L × Q³`: for every `y ∈ im L` and `q ∈ Q³` there is `(u, c)` with
`Φ(u, c) = (y, q)`. -/
theorem corollaryA1 (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (hcase : finrank K (LinearMap.range (Hq (d := 3) alg)) =
      finrank K (LinearMap.range (Lq (d := 3) alg)) + 3) :
    LinearMap.range (Φ (d := 3) alg) =
      (LinearMap.range (Lq (d := 3) alg)).prod ⊤ := by
  have hle : LinearMap.range (Φ (d := 3) alg) ≤ (LinearMap.range (Lq (d := 3) alg)).prod ⊤ := by
    rintro _ ⟨x, rfl⟩
    exact ⟨⟨x.1, rfl⟩, Submodule.mem_top⟩
  apply Submodule.eq_of_le_of_finrank_eq hle
  rw [finrank_range_Φ alg h1, finrank_imL_prod alg h1]
  omega

/-- The cases (3,6), (4,7), (5,8) of Satz A are exactly those with `rk H = rk L + 3`. -/
theorem cases_A1_iff (a b : ℕ)
    (h : (a, b) = (3, 6) ∨ (a, b) = (4, 7) ∨ (a, b) = (5, 7) ∨ (a, b) = (5, 8)) :
    b = a + 3 ↔ ((a, b) = (3, 6) ∨ (a, b) = (4, 7) ∨ (a, b) = (5, 8)) := by
  rcases h with h | h | h | h <;> obtain ⟨rfl, rfl⟩ := Prod.mk.inj h <;> decide

/-! ## Folgerung A2 -/

/-- `Ĵ = Ψ(K⁴, U) = J + f_1(U) + f_2(U) + f_3(U)` (prose Section 2). -/
def JHat {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) : Submodule K (Fin r → K) :=
  ⨆ i : Fin (d + 1), LinearMap.range (φ alg i)

theorem JHat_le_ker {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    JHat alg ≤ LinearMap.ker (W alg) :=
  iSup_le fun i => by
    rintro _ ⟨y, rfl⟩
    exact φ_mem_ker alg i y

theorem J_le_JHat {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) : J alg ≤ JHat alg :=
  le_iSup (fun i : Fin (d + 1) => LinearMap.range (φ alg i)) 0

/-- `im L = Ĵ / J` (prose Section 2: `im L = (∑_{i ≥ 1} f_i(U) + J) / J = Ĵ / J`). -/
theorem map_JHat_eq_range_Lq {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    (JHat alg).map (π alg) = LinearMap.range (Lq alg) := by
  apply le_antisymm
  · rw [JHat, Submodule.map_iSup]
    refine iSup_le fun i => ?_
    rintro _ ⟨_, ⟨y, rfl⟩, rfl⟩
    rcases Fin.eq_zero_or_eq_succ i with rfl | ⟨j, rfl⟩
    · rw [π_φ0]
      exact Submodule.zero_mem _
    · refine ⟨Pi.single j y, ?_⟩
      rw [Lq_apply, ell_apply, Finset.sum_eq_single j]
      · simp
      · intro k _ hk; simp [Pi.single_apply, hk]
      · simp
  · rintro _ ⟨u, rfl⟩
    rw [Lq_apply]
    refine Submodule.mem_map_of_mem ?_
    rw [ell_apply]
    exact Submodule.sum_mem _ fun i _ =>
      (le_iSup (fun i : Fin (d + 1) => LinearMap.range (φ alg i)) i.succ) ⟨u i, rfl⟩

/-- `dim Ĵ = rk L + m` (prose Section 2: `rk L = dim Ĵ − 4`). -/
theorem finrank_JHat {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r) (h1 : SN1 alg) :
    finrank K (JHat alg) = finrank K (LinearMap.range (Lq alg)) + m := by
  have h := YangN3Teil3.finrank_map_mkQ_add (JHat alg) (J alg) (J_le_JHat alg)
  rw [finrank_J alg h1] at h
  have hm : (JHat alg).map (J alg).mkQ = LinearMap.range (Lq alg) := map_JHat_eq_range_Lq alg
  rw [hm] at h
  omega

/-- **Folgerung A2** (prose Section 3): if `rk L = 5`, then `Ĵ = ker W`; in particular all
vectors `g(x)`, `x ∈ U`, lie in `Ĵ`. -/
theorem corollaryA2 (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (hL : finrank K (LinearMap.range (Lq (d := 3) alg)) = 5) :
    JHat (d := 3) alg = LinearMap.ker (W (d := 3) alg) ∧
      ∀ y : Fin 4 → K, gU (d := 3) alg y ∈ JHat (d := 3) alg := by
  have hJ := finrank_JHat (d := 3) alg h1
  have hW := G3 (d := 3) alg
  have heq : JHat (d := 3) alg = LinearMap.ker (W (d := 3) alg) :=
    Submodule.eq_of_le_of_finrank_eq (JHat_le_ker alg) (by omega)
  refine ⟨heq, fun y => ?_⟩
  rw [heq]
  exact gU_mem_ker alg y

/-! ## Lemma 13′ applied: the table of prose Section 4 and the common kernel -/

/-- **Application table of Lemma 13′** (prose Section 4): for a normalized decomposition of
length 25 and a maximiser `γ` of `rk(∑ γ_i F_i)`, `s = dim ∑_i F_i(ker ∑ γ_j F_j)` is `0` in
the cases (3,6), (4,7), (5,7) and at most `1` in the case (5,8). -/
theorem sDim_table (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (γ : Fin 3 → K)
    (hγ : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) (rkComb (Fq (d := 3) alg) γ)) :
    (((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7)) →
      Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) = 0) ∧
    Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) ≤ 1 := by
  set ρ := rkComb (Fq (d := 3) alg) γ with hρdef
  obtain ⟨hρ3, -, hcases⟩ := satzA alg h1 h2 ρ hγ
  have h := lemma13Prime_statement K (Fin 4 → K) ((Fin 25 → K) ⧸ J (d := 3) alg)
    inferInstance inferInstance (Fq alg) ρ hγ γ rfl
  have hs : finrank K (⨆ i, (LinearMap.ker (∑ j, γ j • Fq (d := 3) alg j)).map
      (Fq (d := 3) alg i) : Submodule K _) =
      Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) := rfl
  rw [hs] at h
  have hL : finrank K (LinearMap.range (sumMap (Fq (d := 3) alg))) =
      finrank K (LinearMap.range (Lq (d := 3) alg)) := rfl
  have hH : finrank K (LinearMap.range (skewExt (sumMap (Fq (d := 3) alg)))) =
      finrank K (LinearMap.range (Hq (d := 3) alg)) := rfl
  rw [hL, hH] at h
  simp only [Prod.mk.injEq] at hcases
  constructor
  · intro hc
    simp only [Prod.mk.injEq] at hc
    omega
  · omega

/-- **Common kernel** (prose Section 4, table, and Section 7): in the cases (3,6), (4,7),
(5,7) of Satz A, the maps `F_1, F_2, F_3` of a normalized
decomposition of length 25 have a common kernel vector: `N ≠ 0`. -/
theorem exists_common_kernel (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg)
    (hcase : ((finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (4, 7) ∨
        (finrank K (LinearMap.range (Lq (d := 3) alg)),
          finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 7))) :
    ∃ x : Fin 4 → K, x ≠ 0 ∧ ∀ i, Fq (d := 3) alg i x = 0 := by
  obtain ⟨ρ, hρ⟩ := exists_isGreatest_rkComb (Fq (d := 3) alg)
  obtain ⟨γ, hγ⟩ := hρ.1
  have hγ' : IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) (rkComb (Fq (d := 3) alg) γ) := by
    rw [hγ]; exact hρ
  have hs := (sDim_table alg h1 h2 γ hγ').1 hcase
  obtain ⟨hρ3, -⟩ := satzA alg h1 h2 ρ hρ
  refine Lemma13Prime.exists_common_kernel_of_sDim_eq_zero _ _ ?_ hs
  have : finrank K (LinearMap.range (∑ i, γ i • Fq (d := 3) alg i)) = ρ := hγ
  rw [this, Module.finrank_fin_fun]
  omega

end SatzA

end SatzA444
end YangBounds

/-! ## Axiom check (output appears in the build log) -/

#print axioms YangBounds.Lemma13Prime.lemma13Prime
#print axioms YangBounds.SatzA444.lemma13Prime_statement
#print axioms YangBounds.SatzA444.satzA
#print axioms YangBounds.SatzA444.satzA_statement
#print axioms YangBounds.SatzA444.satzA_exists
#print axioms YangBounds.SatzA444.satzA_global
#print axioms YangBounds.SatzA444.corollaryA1
#print axioms YangBounds.SatzA444.corollaryA2
#print axioms YangBounds.SatzA444.sDim_table
#print axioms YangBounds.SatzA444.exists_common_kernel
