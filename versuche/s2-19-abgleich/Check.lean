import YangBounds.SatzA444
import Mathlib.Algebra.Field.ZMod

/-!
S2-19 (prover check, not part of the library): statements printed for the report,
non-vacuity of the hypotheses of Satz A, and axioms. Run from `lean/` with
`lake env lean ../versuche/s2-19-abgleich/Check.lean`.
-/

open YangBounds YangBounds.YangN4Haupt YangBounds.SatzA444

/-- `ZMod 2` is a field (instance argument `Fact (Nat.Prime 2)`). -/
instance : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩

#check @SatzA444.satzA_global
#check @SatzA444.satzA_statement
#print SatzA444.SatzAStatement
#print YangN4Haupt.SN1
#print YangN4Haupt.SN2
#print YangN4Haupt.Fq
#print YangN4Haupt.Lq
#print YangN4Haupt.Hq
#print YangN4Haupt.rkComb
#print YangBounds.BilinearAlgorithm

/-- (N1) and (N2) are satisfiable for `⟨4,2,4⟩` over the algebraic closure of `ZMod 2`
(characteristic 2) and of `ℚ`, at some length: the hypotheses `SN1`, `SN2` are not
contradictory in themselves. -/
example : ∃ r, ∃ alg : BilinearAlgorithm (AlgebraicClosure (ZMod 2)) 4 2 4 r,
    SN1 (d := 3) alg ∧ SN2 (d := 3) alg := by
  obtain ⟨r', -, alg', h1, h2⟩ :=
    exists_normalized (d := 3) (standardAlgorithm (AlgebraicClosure (ZMod 2)) 4 2 4)
  exact ⟨r', alg', h1, h2⟩

example : ∃ r, ∃ alg : BilinearAlgorithm (AlgebraicClosure ℚ) 4 2 4 r,
    SN1 (d := 3) alg ∧ SN2 (d := 3) alg := by
  obtain ⟨r', -, alg', h1, h2⟩ :=
    exists_normalized (d := 3) (standardAlgorithm (AlgebraicClosure ℚ) 4 2 4)
  exact ⟨r', alg', h1, h2⟩

/-- The hypothesis on `ρ` is always satisfiable (the maximum exists), so the conclusion
`ρ = 3 ∧ …` of `satzA_global` is not vacuous in `ρ`. -/
example (K : Type) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ ρ, IsGreatest (Set.range (rkComb (Fq (d := 3) alg))) ρ :=
  exists_isGreatest_rkComb _

/-- Satz A for the finite field `ZMod 2` and for `ℚ`, by specialisation. -/
example (alg : BilinearAlgorithm (ZMod 2) 4 2 4 25) := SatzA444.satzA_global (ZMod 2) alg
example (alg : BilinearAlgorithm ℚ 4 2 4 25) := SatzA444.satzA_global ℚ alg

/-- Consequence in the prose's words: for every normalised decomposition over the algebraic
closure (every admissible `u_0` gives one), the conclusion holds. -/
example (K : Type) [Field K] (alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25)
    (h1 : SN1 (d := 3) alg') (h2 : SN2 (d := 3) alg') (ρ : ℕ)
    (hρ : IsGreatest (Set.range (rkComb (Fq (d := 3) alg'))) ρ) : ρ = 3 :=
  (SatzA444.satzA_statement (AlgebraicClosure K) alg' h1 h2 ρ hρ).1

#print axioms SatzA444.satzA_global
#print axioms SatzA444.satzA_statement
#print axioms SatzA444.satzA
#print axioms SatzA444.lemma13Prime_statement
#print axioms Lemma13Prime.lemma13Prime
#print axioms SatzA444.corollaryA1
#print axioms SatzA444.corollaryA2
#print axioms SatzA444.exists_common_kernel
#print axioms SatzA444.sDim_table
