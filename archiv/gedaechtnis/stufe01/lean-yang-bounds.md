---
name: lean-yang-bounds
description: S1-01 Lean-Projekt lean/ (yang_bounds) für Yang v3: Definitionen, Zielsätze, drei offene sorry; PR #15 gemergt
metadata:
  type: project
  modified: 2026-11-25T01:05:23.353Z
---

Stand 25.11.2026 (S1-01, Stufe 1 Runde 1, PR #15, Merge ed591d1):
- lean/ ist ein Lake-Projekt `yang_bounds`: Lean 4.19.0, mathlib c44e0c8, `mm325_lower_bound` = fallnlove/mm325_proof@759cf4a per Git-URL (keine Kopie). lake-manifest.json gepinnt.
- YangBounds/Basic.lean: `BilinearAlgorithm K n l m r`, `tensorRank` (Nat.find, Existenz bewiesen), `tensorRank_three_two_eq` (= matrixTensorRank der Abhängigkeit), `tpsr_lower_bound`.
- YangBounds/Statements.lean: offene sorry (Tag `OPEN(S1-01)`): `yang_theorem_one`, `yang_theorem_two`, `hopcroft_kerr_three_two_six` (≤30). Folgerungen `rank_three_two_six`, `rank_four_two_four_ge` daraus ohne weiteres sorry.
- Lokaler Build: mathlib aus Quellen ~15 min, dann ~1 min. Workflow (A-11) baut lean/ noch nicht, das ist ein späterer Auftrag.
- Für den HK-sorry: verfahren/3x2x6-r30-hk71.json hat ring Z.

Verwandt: [[lean-build-cloud]], [[mm325-lizenz]]
