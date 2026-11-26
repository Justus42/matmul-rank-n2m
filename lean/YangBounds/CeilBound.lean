module

public import Mathlib.Algebra.Order.Floor.Semiring
public import Mathlib.Data.Rat.Floor
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Linarith

@[expose] public section

/-!
# The ceiling in Yang's Theorem 1 as an integer inequality

Task S1-13 (stage 1, round 4).

`ceil_bound_iff` was moved here unchanged (same name, same statement, same proof) from
`YangBounds/Statements.lean`. Reason: `YangN3Teil1.lean` used it and therefore imported
`Statements.lean`; now `Statements.lean` imports the assembled proof `YangN3.lean`, which imports
`YangN3Teil1.lean`. Without the move this would be an import cycle. `Statements.lean` imports
this file, so the lemma is still available there under the name `YangBounds.ceil_bound_iff`.
-/

namespace YangBounds

/-- The ceiling in Theorem 1 as an integer inequality. -/
theorem ceil_bound_iff (m R : ℕ) :
    ⌈((24 * m + 2 : ℚ) / 5)⌉₊ ≤ R ↔ 24 * m + 2 ≤ 5 * R := by
  rw [Nat.ceil_le, div_le_iff₀ (by norm_num : (0 : ℚ) < 5)]
  constructor
  · intro h
    have h' : ((24 * m + 2 : ℕ) : ℚ) ≤ ((5 * R : ℕ) : ℚ) := by push_cast; linarith
    exact_mod_cast h'
  · intro h
    have h' : ((24 * m + 2 : ℕ) : ℚ) ≤ ((5 * R : ℕ) : ℚ) := by exact_mod_cast h
    push_cast at h'
    linarith

end YangBounds
