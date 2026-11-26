module

public import YangBounds.Basic
public import YangBounds.Transponiert444

@[expose] public section

/-!
# S2-56: the final statement for `⟨4,2,4⟩`, restated in a fresh file

This file is not part of the library `YangBounds` (it is not matched by the glob of the
lakefile). It is checked with `lake env lean` by the workflow `.github/workflows/zweitlauf-b016.yml`.

It declares no notation and opens no namespace. Every name is written out in full.
-/

/-- The statement asked for, as an `example`. -/
example (K : Type) [Field K] : 26 ≤ YangBounds.tensorRank K 4 2 4 :=
  YangBounds.Transponiert444.rank_four_two_four_ge_26 K

/-- The same statement as a named theorem, so that its axioms can be printed. -/
theorem B016Aussage.rank_four_two_four_ge_26 (K : Type) [Field K] :
    26 ≤ YangBounds.tensorRank K 4 2 4 :=
  YangBounds.Transponiert444.rank_four_two_four_ge_26 K

-- What do the names resolve to?
#check @YangBounds.tensorRank
#print YangBounds.tensorRank
#print YangBounds.BilinearAlgorithm
#check @YangBounds.Transponiert444.rank_four_two_four_ge_26
#check @B016Aussage.rank_four_two_four_ge_26

-- The statement without notation.
set_option pp.notation false in
#check @B016Aussage.rank_four_two_four_ge_26

set_option pp.notation false in
#check @YangBounds.Transponiert444.rank_four_two_four_ge_26

-- The statement fully elaborated (types of the numerals, the `≤` instance).
set_option pp.all true in
#check @B016Aussage.rank_four_two_four_ge_26

set_option pp.all true in
#check @YangBounds.Transponiert444.rank_four_two_four_ge_26

-- `≤` here is definitionally `Nat.le`, and the numerals are the usual natural numbers.
example (K : Type) [Field K] :
    (26 ≤ YangBounds.tensorRank K 4 2 4) = Nat.le 26 (YangBounds.tensorRank K 4 2 4) := rfl
example : (26 : Nat) = Nat.succ 25 := rfl
example : (4 : Nat) = Nat.succ (Nat.succ (Nat.succ (Nat.succ Nat.zero))) := rfl
example : (2 : Nat) = Nat.succ (Nat.succ Nat.zero) := rfl

-- Axioms.
#print axioms YangBounds.Transponiert444.rank_four_two_four_ge_26
#print axioms B016Aussage.rank_four_two_four_ge_26
