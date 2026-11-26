module

public import YangBounds.LemmaP444
public import YangBounds.SatzC444Generisch

@[expose] public section

/-!
# The final theorem `R(⟨4,2,4⟩) ≥ 26`, assembled from the existing theorems and two hypotheses

Task S2-36 (stage 2, round 9, track A, role: formaliser, slot “Zusammensetzen”).

## The final theorem

`rank_four_two_four_ge_26_of` states, in the rank notion of `Basic.lean` and in the form of
`rank_four_two_four_ge` (`Statements.lean`, B-007):

  for every field `K : Type u`, `26 ≤ tensorRank K 4 2 4`,

under exactly two named hypotheses, which are propositions (not `sorry`, not axioms):

* `BrueckeStatement K` (bridge, task S2-35), needed only for **algebraically closed** `K`:
  every decomposition of length 25 over `K` yields a decomposition of length 25 over some
  algebraically closed field `L` (same universe) with (N1), (N2) and not symmetric.
* `UnterfallBStatement L` (sub-case B, task S2-34), for every algebraically closed `L`:
  a normalized decomposition of length 25 over `L` in the case `(5,8)` that is not symmetric is
  not in sub-case B (`SatzE444Buendel.UnterfallB`).

The bridge is deliberately weaker than “(N1), (N2), case (5,8) and not symmetric”: the case
`(5,8)` is derived here (`fall58_of_nichtSymmetrisch`) from Satz B (`satzB_unbedingt`,
`satzB_symm_unbedingt`), which hold over every field. The bridge is also only required over
algebraically closed fields: the passage from an arbitrary field `K` (finite fields included)
to `AlgebraicClosure K` is done here by the base change R1 (`BilinearAlgorithm.baseChange`),
i.e. “the rank does not increase under field extension” (`tensorRank_baseChange_le`).

## How the chain closes

For `alg : BilinearAlgorithm K 4 2 4 25` over any field `K`:

1. `alg.baseChange (AlgebraicClosure K)` is a decomposition of length 25 over the algebraically
   closed field `AlgebraicClosure K` (R1, proved, `YangN3Teil1.lean`).
2. The bridge gives an algebraically closed `L` and `alg'` over `L` with (N1), (N2) and
   `NichtSymmetrisch alg'` (hypothesis).
3. Satz B gives the case `(5,8)` for `alg'` (proved, no hypothesis).
4. `LemmaP444.nur_unterfallB'` (Lemma P, Satz E, Folgerung C2; proved, needs `[IsAlgClosed L]`,
   which also supplies the `[Infinite L]` of `lemmaP`) gives `UnterfallB alg'`.
5. The sub-case-B hypothesis says `¬ UnterfallB alg'`. Contradiction.

Lengths `r < 25` are excluded by Yang's Theorem 2 (`yang_theorem_two_algorithm`, B-007).
No step assumes `[Infinite K]`, a characteristic or finiteness of `K`.

The conclusion speaks about the given decomposition: `keine_zerlegung_25_of` derives `False`
from an arbitrary `alg : BilinearAlgorithm K 4 2 4 25`, and the rank form is proved through
`le_tensorRank_iff` for every algorithm. The existential in the bridge is only a premise.

## An alternative route without the bridge

`rank_four_two_four_ge_26_of_unendlich` needs a single hypothesis instead,
`RestfallUnendlichStatement L` for every **infinite** field `L`: a normalized, non-symmetric
decomposition of length 25 in the case `(5,8)` is neither in the full sub-case A nor in
sub-case B. Then the generic normal form of `SatzC444Generisch.lean` (`folgerungC1_generisch`
over the infinite field `GField K`) closes the chain without any bridge. This shows where the
bridge is needed at all: only because Satz E (`satzE`) and the planned exclusion of sub-case B
use `[IsAlgClosed _]`, while the generic point lives in `GField K`, which is not algebraically
closed, and (N2) and non-symmetry do not pass automatically to an algebraic closure.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace Endsatz444

open Module YangN4Haupt SatzE444Buendel

universe u

/-! ## The two hypotheses -/

/-- **Bridge** (hypothesis for task S2-35). Over the field `K`, every decomposition of `⟨4,2,4⟩`
of length 25 yields a decomposition `alg'` of length 25 over some algebraically closed field
`L` (in the universe of `K`) that satisfies (N1), (N2) and is not symmetric.
The final theorem uses it only for algebraically closed `K` (namely `AlgebraicClosure K`). -/
def BrueckeStatement (K : Type u) [Field K] : Prop :=
  ∀ _alg : BilinearAlgorithm K 4 2 4 25,
    ∃ (L : Type u) (_ : Field L) (_ : IsAlgClosed L) (alg' : BilinearAlgorithm L 4 2 4 25),
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧ NichtSymmetrisch alg'

/-- **Sub-case B is impossible** (hypothesis for task S2-34). Over the field `L` (algebraically
closed in the application), no normalized decomposition of `⟨4,2,4⟩` of length 25 in the case
`(rk L, rk H) = (5,8)` that is not symmetric is in sub-case B. -/
def UnterfallBStatement (L : Type u) [Field L] : Prop :=
  ∀ alg : BilinearAlgorithm L 4 2 4 25, SN1 (d := 3) alg → SN2 (d := 3) alg →
    (finrank L (LinearMap.range (Lq (d := 3) alg)),
      finrank L (LinearMap.range (Hq (d := 3) alg))) = (5, 8) →
    NichtSymmetrisch alg → ¬ UnterfallB alg

/-! ## Satz B: non-symmetry forces the case (5,8) -/

/-- Over every field, a normalized decomposition of length 25 that is not symmetric is in the
case `(5,8)` (Satz B, `satzB_unbedingt`; the case `(3,6)` is symmetric by
`satzB_symm_unbedingt`). -/
theorem fall58_of_nichtSymmetrisch {L : Type u} [Field L] (alg : BilinearAlgorithm L 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg) (hns : NichtSymmetrisch alg) :
    (finrank L (LinearMap.range (Lq (d := 3) alg)),
      finrank L (LinearMap.range (Hq (d := 3) alg))) = (5, 8) := by
  rcases SatzB444.satzB_unbedingt alg h1 h2 with h | h
  · exact absurd (SatzB444.satzB_symm_unbedingt alg h1 h2 h) hns
  · exact h

/-! ## The algebraically closed step -/

/-- Over an algebraically closed field, sub-case B being impossible means that there is no
normalized, non-symmetric decomposition of length 25 at all (Satz B, Lemma P, Satz E). -/
theorem kein_normalisiertes_of {L : Type u} [Field L] [IsAlgClosed L]
    (hB : UnterfallBStatement L) (alg' : BilinearAlgorithm L 4 2 4 25)
    (h1 : SN1 (d := 3) alg') (h2 : SN2 (d := 3) alg') (hns : NichtSymmetrisch alg') : False := by
  have hcase := fall58_of_nichtSymmetrisch alg' h1 h2 hns
  exact hB alg' h1 h2 hcase hns (LemmaP444.nur_unterfallB' alg' h1 h2 hcase hns)

/-! ## The final theorem -/

/-- **No decomposition of length 25 over `K`** (single field form, weakest hypotheses): the bridge
is needed only over `AlgebraicClosure K`, sub-case B only over algebraically closed fields. -/
theorem keine_zerlegung_25_of' (K : Type u) [Field K]
    (hBr : BrueckeStatement (AlgebraicClosure K))
    (hB : ∀ (L : Type u) [Field L] [IsAlgClosed L], UnterfallBStatement L)
    (alg : BilinearAlgorithm K 4 2 4 25) : False := by
  obtain ⟨L, hL, hLc, alg', h1, h2, hns⟩ := hBr (alg.baseChange (AlgebraicClosure K))
  exact kein_normalisiertes_of (hB L) alg' h1 h2 hns

/-- **No decomposition of length 25** over any field `K`, from the two hypotheses. -/
theorem keine_zerlegung_25_of
    (hBr : ∀ (K : Type u) [Field K] [IsAlgClosed K], BrueckeStatement K)
    (hB : ∀ (L : Type u) [Field L] [IsAlgClosed L], UnterfallBStatement L)
    (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) : False :=
  keine_zerlegung_25_of' K (hBr (AlgebraicClosure K)) hB alg

/-- Every algorithm for `⟨4,2,4⟩` over `K` has length at least 26 (single algorithm form). -/
theorem algorithm_ge_26_of
    (hBr : ∀ (K : Type u) [Field K] [IsAlgClosed K], BrueckeStatement K)
    (hB : ∀ (L : Type u) [Field L] [IsAlgClosed L], UnterfallBStatement L)
    (K : Type u) [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r) : 26 ≤ r := by
  have h25 := yang_theorem_two_algorithm K 4 4 (le_refl _) (le_refl _) alg
  norm_num at h25
  by_contra hlt
  have hr : r = 25 := by omega
  subst hr
  exact keine_zerlegung_25_of hBr hB K alg

/-- **Final theorem (conditional):** `R_K(⟨4,2,4⟩) ≥ 26` over every field `K`, in the rank notion
of `Basic.lean`, assuming the bridge (S2-35) over algebraically closed fields and the exclusion
of sub-case B (S2-34) over algebraically closed fields. -/
theorem rank_four_two_four_ge_26_of
    (hBr : ∀ (K : Type u) [Field K] [IsAlgClosed K], BrueckeStatement K)
    (hB : ∀ (L : Type u) [Field L] [IsAlgClosed L], UnterfallBStatement L)
    (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 := by
  rw [le_tensorRank_iff]
  intro r alg
  exact algorithm_ge_26_of hBr hB K alg

/-- The final theorem with the hypotheses only at the field `K`: the bridge over
`AlgebraicClosure K`. -/
theorem rank_four_two_four_ge_26_of' (K : Type u) [Field K]
    (hBr : BrueckeStatement (AlgebraicClosure K))
    (hB : ∀ (L : Type u) [Field L] [IsAlgClosed L], UnterfallBStatement L) :
    26 ≤ tensorRank K 4 2 4 := by
  rw [le_tensorRank_iff]
  intro r alg
  have h25 := yang_theorem_two_algorithm K 4 4 (le_refl _) (le_refl _) alg
  norm_num at h25
  by_contra hlt
  have hr : r = 25 := by omega
  subst hr
  exact keine_zerlegung_25_of' K hBr hB alg

/-! ## Reduction to algebraically closed fields (“the rank does not increase under extension”) -/

/-- A lower bound on the rank over every algebraically closed field (in universe `u`) holds over
every field `K : Type u` (R1 with `L = AlgebraicClosure K`). -/
theorem le_tensorRank_of_algClosed {n l m c : ℕ}
    (h : ∀ (L : Type u) [Field L] [IsAlgClosed L], c ≤ tensorRank L n l m)
    (K : Type u) [Field K] : c ≤ tensorRank K n l m :=
  (h (AlgebraicClosure K)).trans
    (YangBounds.tensorRank_baseChange_le K (AlgebraicClosure K) n l m)

/-! ## Alternative route over infinite fields, without the bridge -/

/-- **Residual case over an infinite field** (single hypothesis of the alternative route): no
normalized, non-symmetric decomposition of length 25 in the case `(5,8)` is in the full
sub-case A or in sub-case B. -/
def RestfallUnendlichStatement (L : Type u) [Field L] : Prop :=
  ∀ alg : BilinearAlgorithm L 4 2 4 25, SN1 (d := 3) alg → SN2 (d := 3) alg →
    (finrank L (LinearMap.range (Lq (d := 3) alg)),
      finrank L (LinearMap.range (Hq (d := 3) alg))) = (5, 8) →
    NichtSymmetrisch alg → ¬ UnterfallAVoll alg ∧ ¬ UnterfallB alg

/-- The polynomial ring of the generic point is infinite. -/
theorem infinite_GPoly (K : Type u) [Field K] : Infinite (SatzC444.GPoly K) :=
  Infinite.of_injective
    (fun n : ℕ => MvPolynomial.monomial (Finsupp.single (Sum.inr (0, 1) : Var 3) n) (1 : K))
    ((MvPolynomial.monomial_left_injective one_ne_zero).comp
      (Finsupp.single_injective (Sum.inr (0, 1) : Var 3)))

/-- The field `GField K` of the generic point is infinite. -/
theorem infinite_GField (K : Type u) [Field K] : Infinite (SatzC444.GField K) := by
  haveI := infinite_GPoly K
  exact Infinite.of_injective (algebraMap (SatzC444.GPoly K) (SatzC444.GField K))
    (IsFractionRing.injective (SatzC444.GPoly K) (SatzC444.GField K))

/-- **Alternative final theorem (conditional), single hypothesis:** if the residual case is
impossible over every infinite field, then `R_K(⟨4,2,4⟩) ≥ 26` over every field `K`. The
generic normal form (`folgerungC1_generisch`) replaces the bridge, Lemma P (`dichotomie'`)
needs only `[Infinite _]`. -/
theorem rank_four_two_four_ge_26_of_unendlich
    (hR : ∀ (L : Type u) [Field L] [Infinite L], RestfallUnendlichStatement L)
    (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 := by
  rw [le_tensorRank_iff]
  intro r alg
  have h25 := yang_theorem_two_algorithm K 4 4 (le_refl _) (le_refl _) alg
  norm_num at h25
  by_contra hlt
  have hr : r = 25 := by omega
  subst hr
  haveI := infinite_GField K
  obtain ⟨h1, h2, hcase, hns⟩ := SatzC444.folgerungC1_generisch alg
  have hAB := LemmaP444.dichotomie' (SatzC444.genAlg alg) h1 h2 hcase hns
  obtain ⟨hnA, hnB⟩ := hR (SatzC444.GField K) (SatzC444.genAlg alg) h1 h2 hcase hns
  rcases hAB with hA | hB
  · exact hnA hA
  · exact hnB hB

/-! ## Axiom check (printed in every build log, also in GitHub Actions)

Expected for each: `[propext, Classical.choice, Quot.sound]`. -/

#print axioms fall58_of_nichtSymmetrisch
#print axioms kein_normalisiertes_of
#print axioms keine_zerlegung_25_of'
#print axioms keine_zerlegung_25_of
#print axioms algorithm_ge_26_of
#print axioms rank_four_two_four_ge_26_of
#print axioms rank_four_two_four_ge_26_of'
#print axioms le_tensorRank_of_algClosed
#print axioms rank_four_two_four_ge_26_of_unendlich

end Endsatz444
end YangBounds
