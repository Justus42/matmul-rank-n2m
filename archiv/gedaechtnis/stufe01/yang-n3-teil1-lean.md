---
name: yang-n3-teil1-lean
description: S1-09 Teil 1 (R1 Körpererweiterung) in lean/YangBounds/YangN3Teil1.lean, sorry-frei, PR #21 gemergt; Schnittstelle-Hypothese hinf
metadata:
  type: project
  modified: 2026-11-25T05:28:57.478Z
---

Stand 25.11.2026 (S1-09, Stufe 1 Runde 3, PR #21, Merge ea6b650). Status behauptet.
- `lean/YangBounds/YangN3Teil1.lean`: `BilinearAlgorithm.baseChange`, `tensorRank_baseChange_le` (R_L ≤ R_K), `exists_infinite_extension` (RatFunc K), `yang_theorem_one_of_infinite`.
- Schnittstelle für Teil 2/3: Hypothese `hinf : ∀ (L : Type u) [Field L] [Infinite L] (r : ℕ), BilinearAlgorithm L 3 2 m r → 24 * m + 2 ≤ 5 * r` (ohne Normalisierung). Liefert `⌈(24m+2)/5⌉₊ ≤ tensorRank K 3 2 m` ohne `3 ≤ m`.
- lakefile.toml: `globs = ["YangBounds.+"]` ergänzt, damit Module ohne Import aus YangBounds.lean gebaut werden.
- Kein sorry, #print axioms nur propext/Classical.choice/Quot.sound (lokal).

Verwandt: [[lean-yang-bounds]], [[yang-n3-prosa]], [[lean-build-cloud]]
