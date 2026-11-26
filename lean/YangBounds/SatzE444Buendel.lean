module

public import YangBounds.SatzE444

@[expose] public section

/-!
# Lemma P for `⟨4,2,4⟩`, case (5,8): the sub-cases A and B, and what remains

Task S2-27 (stage 2, round 7, track A, role: formaliser).
Claim file: `behauptungen/B-013.md`.

Source: prose `lean/prosa/s2_444_spurA_r4.md` (task S2-16), Folgerung C2 (Section 4) and
Lemma P (Section 5.1).

## What is formalised here

* `Fc alg γ = ∑ γ_i F_i`, `Omega alg = {γ : rk F_γ = 3}` (the maximisers, `ρ = 3` by Satz A),
  `Kstern alg = ∑_{γ ∈ Ω} ker F_γ` (the prose `K* = span{k(γ)}`, here without choosing kernel
  vectors and for **all** maximisers, not only generic ones).
* `UnterfallAVoll alg` and `UnterfallB alg`: the two sub-cases of Lemma P as stated in the prose
  (with `γ*`, `F_{γ*}(K*) = 0`, and `q`, resp. `rk F_{γ*} = 1` and `Q_2`). `UnterfallB` is the
  named predicate a later theorem has to exclude.
* `NichtSymmetrisch alg := ¬ SatzB444.IsSymm alg`: the non-symmetry at the given normal form.
  In the prose it comes from Satz C (B-012, task S2-26). Here it is an **explicit hypothesis**
  of the theorems that need it.
* Folgerung C2 without V′ (coordinate version): `N = 0` from
  `NichtSymmetrisch` (`commonKernel_trivial`, via `SatzB444.lemmaV'`), and `s = 1` for every
  maximiser (`sDim_eq_one`), with `dim ker F_γ = 1` (`finrank_ker_Fc`).
* `LemmaPStatement K`: Lemma P (the dichotomy) as a statement. **It is not proved in this
  task.** The theorems `dichotomie`, `nur_unterfallB` and `nur_unterfallB_global` take it as an
  explicit hypothesis (not `sorry`, not an axiom).
* `nur_unterfallB`: from Lemma P, non-symmetry and Satz E (proved in `SatzE444.lean`, without
  any hypothesis): in the case (5,8) only sub-case B remains.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzE444Buendel

open Module YangN4Haupt SatzA444 SatzE444

universe u

section Defs

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- `F_γ = ∑_i γ_i F_i : U → Q`. -/
noncomputable def Fc (γ : Fin 3 → K) : (Fin 4 → K) →ₗ[K] (Fin r → K) ⧸ J (d := 3) alg :=
  ∑ i, γ i • Fq (d := 3) alg i

/-- `Ω`: the `γ` with `rk F_γ = 3` (for length 25 the maximal rank is `ρ = 3`, Satz A). -/
def Omega : Set (Fin 3 → K) :=
  {γ | finrank K (LinearMap.range (Fc alg γ)) = 3}

/-- `K* = ∑_{γ ∈ Ω} ker F_γ` (prose: `K* = span{k(γ)}`). -/
noncomputable def Kstern : Submodule K (Fin 4 → K) :=
  ⨆ γ ∈ Omega alg, LinearMap.ker (Fc alg γ)

/-- **Sub-case A** of Lemma P as in the prose (Section 5.1): `dim K* = 2`, a `γ* ≠ 0` with
`F_{γ*}(K*) = 0`, and `q ≠ 0` with `F_i(K*) ⊆ K·q` for `i = 1, 2, 3`. -/
def UnterfallAVoll : Prop :=
  finrank K (Kstern alg) = 2 ∧
    ∃ γs : Fin 3 → K, γs ≠ 0 ∧ Kstern alg ≤ LinearMap.ker (Fc alg γs) ∧
      ∃ q : (Fin r → K) ⧸ J (d := 3) alg, q ≠ 0 ∧
        ∀ (i : Fin 3), ∀ x ∈ Kstern alg, Fq (d := 3) alg i x ∈ K ∙ q

/-- **Sub-case B** of Lemma P as in the prose (Section 5.1): `dim K* = 3`, a `γ* ≠ 0` with
`F_{γ*}(K*) = 0` and `rk F_{γ*} = 1`, and a two-dimensional `Q_2 ⊆ Q` with `F_i(K*) ⊆ Q_2`
for `i = 1, 2, 3`. This is the predicate a later theorem has to exclude. -/
def UnterfallB : Prop :=
  finrank K (Kstern alg) = 3 ∧
    ∃ γs : Fin 3 → K, γs ≠ 0 ∧ Kstern alg ≤ LinearMap.ker (Fc alg γs) ∧
      finrank K (LinearMap.range (Fc alg γs)) = 1 ∧
      ∃ Q2 : Submodule K ((Fin r → K) ⧸ J (d := 3) alg), finrank K Q2 = 2 ∧
        ∀ (i : Fin 3), ∀ x ∈ Kstern alg, Fq (d := 3) alg i x ∈ Q2

/-- **Non-symmetry hypothesis** (prose Section 2, “symmetrisch”; in the prose it follows from
Satz C, B-012, formalised separately in task S2-26): there is no automorphism `G` of `K⁴` and no
scalars `μ_t` with `β_t(emb (G y)) = μ_t (a_t·y)` for all `t`, `y`. -/
def NichtSymmetrisch : Prop := ¬ SatzB444.IsSymm alg

/-- The full sub-case A implies the weak form excluded by Satz E. -/
theorem unterfallA_of_voll (h : UnterfallAVoll alg) : UnterfallA alg := by
  obtain ⟨hdim, -, -, -, q, -, hq⟩ := h
  exact ⟨Kstern alg, q, hdim, hq⟩

end Defs

/-! ## Folgerung C2 (without V′): `N = 0`, `dim ker F_γ = 1`, `s = 1` -/

section C2

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- **`N = 0`** (coordinate version of C2b): at a non-symmetric normal form
the maps `F_1, F_2, F_3` have no common kernel vector. -/
theorem commonKernel_trivial (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hns : NichtSymmetrisch alg) (x : Fin 4 → K) (hx : ∀ i, Fq (d := 3) alg i x = 0) :
    x = 0 := by
  by_contra h0
  exact hns (SatzB444.lemmaV' alg h1 h2 x h0 hx)

theorem Fc_eq (γ : Fin 3 → K) : Fc alg γ = ∑ i, γ i • Fq (d := 3) alg i := rfl

/-- For `γ ∈ Ω`, `ker F_γ` is one-dimensional. -/
theorem finrank_ker_Fc {γ : Fin 3 → K} (hγ : γ ∈ Omega alg) :
    finrank K (LinearMap.ker (Fc alg γ)) = 1 := by
  have h := LinearMap.finrank_range_add_finrank_ker (Fc alg γ)
  have h3 : finrank K (LinearMap.range (Fc alg γ)) = 3 := hγ
  rw [Module.finrank_fin_fun] at h
  omega

/-- **`s = 1`** (C2c): for a normalized decomposition of length 25 with no
common kernel vector, every `γ ∈ Ω` has `s(γ) = dim ∑_i F_i(ker F_γ) = 1`. -/
theorem sDim_eq_one (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (hN : ∀ x : Fin 4 → K, (∀ i, Fq (d := 3) alg i x = 0) → x = 0)
    {γ : Fin 3 → K} (hγ : γ ∈ Omega alg) :
    Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) = 1 := by
  -- `γ` is a maximiser: `ρ = 3` by Satz A
  obtain ⟨ρ, hρ⟩ := exists_isGreatest_rkComb (Fq (d := 3) alg)
  obtain ⟨hρ3, -⟩ := satzA alg h1 h2 ρ hρ
  have hγ3 : rkComb (Fq (d := 3) alg) γ = 3 := hγ
  have hmax : IsGreatest (Set.range (rkComb (Fq (d := 3) alg)))
      (rkComb (Fq (d := 3) alg) γ) := by
    subst hρ3; rw [hγ3]; exact hρ
  have hle := (sDim_table alg h1 h2 γ hmax).2
  -- `s = 0` would put the kernel line into `N`
  have hne : Lemma13Prime.sDim (∑ i, γ i • Fq (d := 3) alg i) (Fq (d := 3) alg) ≠ 0 := by
    intro h0
    have hk := finrank_ker_Fc alg hγ
    obtain ⟨x, hxk, hx0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot (by
      intro hb
      rw [hb, finrank_bot] at hk
      exact absurd hk (by norm_num) : LinearMap.ker (Fc alg γ) ≠ ⊥)
    apply hx0
    apply hN x
    intro i
    unfold Lemma13Prime.sDim at h0
    rw [Submodule.finrank_eq_zero] at h0
    have : Fq (d := 3) alg i x ∈
        (⨆ j, (LinearMap.ker (∑ k, γ k • Fq (d := 3) alg k)).map (Fq (d := 3) alg j) :
          Submodule K _) :=
      (le_iSup (fun j => (LinearMap.ker (∑ k, γ k • Fq (d := 3) alg k)).map
        (Fq (d := 3) alg j)) i) (Submodule.mem_map_of_mem hxk)
    rw [h0] at this
    exact (Submodule.mem_bot K).1 this
  omega

end C2

/-! ## Lemma P as a statement, and what follows from it -/

section LemmaP

/-- **Statement of Lemma P** (prose Section 5.1): for
every normalized decomposition of `⟨4,2,4⟩` of length 25 over `K` (algebraically closed in the
application) in the case (5,8) with `N = 0`, the space `K*` is in sub-case A or in sub-case B.
**Not proved in this task**; used only as an explicit hypothesis. -/
def LemmaPStatement (K : Type u) [Field K] : Prop :=
  ∀ alg : BilinearAlgorithm K 4 2 4 25, SN1 (d := 3) alg → SN2 (d := 3) alg →
    (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8) →
    (∀ x : Fin 4 → K, (∀ i, Fq (d := 3) alg i x = 0) → x = 0) →
    UnterfallAVoll alg ∨ UnterfallB alg

variable {K : Type u} [Field K]

/-- **Dichotomy** (prose Section 5.1, Folgerung C2 + Lemma P), assuming Lemma P and
non-symmetry. -/
theorem dichotomie (hP : LemmaPStatement K) (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hns : NichtSymmetrisch alg) : UnterfallAVoll alg ∨ UnterfallB alg :=
  hP alg h1 h2 hcase (commonKernel_trivial alg h1 h2 hns)

/-- **Only sub-case B remains** (prose Sections 5.2, 5.3): over an algebraically closed field,
assuming Lemma P and non-symmetry, a normalized decomposition of length 25 in the case (5,8)
is in sub-case B. Satz E (`SatzE444.satzE`) is used without hypotheses. -/
theorem nur_unterfallB [IsAlgClosed K] (hP : LemmaPStatement K)
    (alg : BilinearAlgorithm K 4 2 4 25) (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hns : NichtSymmetrisch alg) : UnterfallB alg := by
  rcases dichotomie hP alg h1 h2 hcase hns with hA | hB
  · exact absurd (unterfallA_of_voll alg hA) (satzE alg h1 h2 hcase)
  · exact hB

/-- **Global form**: every decomposition of `⟨4,2,4⟩` of length 25 over any field `K` has a
normal form over the algebraic closure (length 25, (N1), (N2)) which, assuming Lemma P over the
algebraic closure, is in sub-case B whenever it is in the case (5,8) and not symmetric. -/
theorem nur_unterfallB_global (K : Type u) [Field K]
    (hP : LemmaPStatement (AlgebraicClosure K)) (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      ((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8) →
        NichtSymmetrisch alg' → UnterfallB alg') := by
  obtain ⟨alg', h1, h2⟩ := satzA_exists K alg
  exact ⟨alg', h1, h2, fun hc hns => nur_unterfallB hP alg' h1 h2 hc hns⟩

end LemmaP

end SatzE444Buendel
end YangBounds

/-! ## Axiom check (output appears in the build log) -/

#print axioms YangBounds.SatzE444Buendel.sDim_eq_one
#print axioms YangBounds.SatzE444Buendel.commonKernel_trivial
#print axioms YangBounds.SatzE444Buendel.dichotomie
#print axioms YangBounds.SatzE444Buendel.nur_unterfallB
#print axioms YangBounds.SatzE444Buendel.nur_unterfallB_global
