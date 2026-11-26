module

public import YangBounds.Upper4x2x4
public import YangBounds.Transponiert444

@[expose] public section

/-!
# The tensor rank of `⟨4, 2, 4⟩` is 26 over every field

Task S5-17 (stage 5, track P, round 4).

`rank_four_two_four_eq_26` combines the upper bound
`YangBounds.Upper4x2x4.rank_four_two_four_le_26` (explicit algorithm with 26 products,
`YangBounds/Upper4x2x4.lean`) with the lower bound
`YangBounds.Transponiert444.rank_four_two_four_ge_26` (final theorem of the chain for
`⟨4, 2, 4⟩`). Neither statement is changed.
-/

namespace YangBounds

namespace Gleich444

universe u

/-- **The tensor rank of `⟨4, 2, 4⟩`.** For every field `K`, `R_K(⟨4, 2, 4⟩) = 26`. -/
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26 :=
  le_antisymm (Upper4x2x4.rank_four_two_four_le_26 K)
    (Transponiert444.rank_four_two_four_ge_26 K)

end Gleich444

end YangBounds
