import YangBounds.Basic
import YangBounds.CeilBound
import YangBounds.YangN3
import YangBounds.Upper3x2x6
import YangBounds.YangN4Lemma13
import YangBounds.YangN4Haupt
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Data.Rat.Floor
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

/-!
# Target statements of stage 1 (Yang v3)

Task S1-01. Status of every statement in this file: `behauptet` (claims taken from the paper)
or `vermutet`; nothing here is `geprüft`.

Source: J. Yang, arXiv:2609.14393v3 (12.10.2026), Section 1:

* Theorem 1. For `m ≥ 3`, `R(⟨3, 2, m⟩) ≥ ⌈(24m + 2) / 5⌉`.
* Theorem 2. For `m ≥ n ≥ 4`, `R(⟨n, 2, m⟩) ≥ (n + 2) m + (n − 3)`.
* Abstract: both hold "over arbitrary fields".
* Consequences named in the paper: `R(⟨3, 2, 6⟩) = 30` (with the Hopcroft–Kerr upper bound)
  and `R(⟨4, 2, 4⟩) ≥ 25`.

Since S1-17 no proof in this file is open (no `sorry`); `lean/README.md` lists where each
proof lives. The consequences are derived from the main statements.
-/

namespace YangBounds

universe u

/-! ## Yang's two lower bounds -/

/-- **Yang v3, Theorem 1.** For every field `K` and every `m ≥ 3`:
`R_K(⟨3, 2, m⟩) ≥ ⌈(24m + 2) / 5⌉`. -/
theorem yang_theorem_one (K : Type u) [Field K] (m : ℕ) (hm : 3 ≤ m) :
    ⌈((24 * m + 2 : ℚ) / 5)⌉₊ ≤ tensorRank K 3 2 m :=
  -- S1-13: assembled from parts 1 to 3 in `YangBounds/YangN3.lean`
  YangN3.yang_theorem_one_proof K m hm

/-- **Yang v3, Theorem 2.** For every field `K` and all `m ≥ n ≥ 4`:
`R_K(⟨n, 2, m⟩) ≥ (n + 2) m + (n − 3)`. (Natural-number subtraction is harmless
because `n ≥ 4`.) -/
theorem yang_theorem_two (K : Type u) [Field K] (n m : ℕ) (hn : 4 ≤ n) (hnm : n ≤ m) :
    (n + 2) * m + (n - 3) ≤ tensorRank K n 2 m :=
  -- S1-17: main proof from S1-16 (`YangBounds/YangN4Haupt.lean`) with Lemma 13 from S1-15
  -- (`YangBounds/YangN4Lemma13.lean`) inserted for its hypothesis
  YangN4Haupt.yang_theorem_two_of_lemma13
    (fun L _ U Q _ _ _ _ => YangN4Lemma13.lemma13_statement (K := L) U Q) K n m hn hnm

/-! ## Upper bound needed for `⟨3, 2, 6⟩` -/

/-- **Hopcroft–Kerr 1971 for `⟨3, 2, 6⟩`:** an algorithm with 30 products over every field.
Not part of Yang's paper (only cited there). -/
theorem hopcroft_kerr_three_two_six (K : Type u) [Field K] :
    tensorRank K 3 2 6 ≤ 30 :=
  -- S1-13: explicit algorithm from S1-12 in `YangBounds/Upper3x2x6.lean`
  Upper3x2x6.hopcroft_kerr_three_two_six K

/-! ## Equivalent forms (proved from the definitions) -/

-- `ceil_bound_iff` (the ceiling in Theorem 1 as an integer inequality) was moved unchanged
-- to `YangBounds/CeilBound.lean` (S1-13) to avoid an import cycle; it is imported above.

/-- Theorem 1 for every individual algorithm (no rank notion involved). -/
theorem yang_theorem_one_algorithm (K : Type u) [Field K] (m : ℕ) (hm : 3 ≤ m) {r : ℕ}
    (alg : BilinearAlgorithm K 3 2 m r) : 24 * m + 2 ≤ 5 * r :=
  (ceil_bound_iff m r).mp ((yang_theorem_one K m hm).trans (tensorRank_le alg))

/-- Theorem 2 for every individual algorithm (no rank notion involved). -/
theorem yang_theorem_two_algorithm (K : Type u) [Field K] (n m : ℕ) (hn : 4 ≤ n) (hnm : n ≤ m)
    {r : ℕ} (alg : BilinearAlgorithm K n 2 m r) : (n + 2) * m + (n - 3) ≤ r :=
  (yang_theorem_two K n m hn hnm).trans (tensorRank_le alg)

/-! ## Consequences (derived from the statements above) -/

/-- `R_K(⟨3, 2, 6⟩) ≥ 30` over every field, from Theorem 1 with `m = 6`. -/
theorem rank_three_two_six_ge (K : Type u) [Field K] : 30 ≤ tensorRank K 3 2 6 := by
  have h := (ceil_bound_iff 6 _).mp (yang_theorem_one K 6 (by norm_num))
  omega

/-- **Consequence:** `R_K(⟨3, 2, 6⟩) = 30` over every field. -/
theorem rank_three_two_six (K : Type u) [Field K] : tensorRank K 3 2 6 = 30 :=
  le_antisymm (hopcroft_kerr_three_two_six K) (rank_three_two_six_ge K)

/-- **Consequence:** `R_K(⟨4, 2, 4⟩) ≥ 25` over every field, from Theorem 2 with `n = m = 4`. -/
theorem rank_four_two_four_ge (K : Type u) [Field K] : 25 ≤ tensorRank K 4 2 4 := by
  simpa using yang_theorem_two K 4 4 le_rfl le_rfl

/-- `R_K(⟨4, 2, 5⟩) ≥ 31` over every field, from Theorem 2 with `n = 4`, `m = 5`
(named in the paper; not a stage-1 target). -/
theorem rank_four_two_five_ge (K : Type u) [Field K] : 31 ≤ tensorRank K 4 2 5 := by
  simpa using yang_theorem_two K 4 5 le_rfl (by norm_num)

end YangBounds
