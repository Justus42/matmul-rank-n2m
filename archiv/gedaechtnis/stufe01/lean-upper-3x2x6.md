---
name: lean-upper-3x2x6
description: S1-12 (25.11.2026): Lean-Beweis R(3x2x6) ≤ 30 über jedem Körper in lean/YangBounds/Upper3x2x6.lean, PR #24 gemergt; Technik decide +kernel
metadata:
  type: project
  modified: 2026-11-25T05:35:42.213Z
---

S1-12, 25.11.2026: `lean/YangBounds/Upper3x2x6.lean`, PR #24 gemergt (Merge edb6814). Status behauptet.
- Satz `YangBounds.Upper3x2x6.hopcroft_kerr_three_two_six (K) [Field K] : tensorRank K 3 2 6 ≤ 30`, gleiche Aussage wie das sorry in Statements.lean (per rfl-Typvergleich geprüft). Einsetzen: `import YangBounds.Upper3x2x6`, dann `Upper3x2x6.hopcroft_kerr_three_two_six K`.
- Axiome nur propext, Classical.choice, Quot.sound.
- Technik, die trägt: Tensoridentität über ℤ (`∑ r, u*v*w = [i=s ∧ j=p ∧ q=t]`) mit `decide +kernel` (14 s, kein Zusatzaxiom), dann allgemeiner Übertrag in den Körper. Direktes simp/ring über Matrixliterale mit 30 Produkten läuft in Heartbeat-Timeouts (versuche/V-S1-12-simp-matrixliterale.md).

**How to apply:** Für weitere explizite Verfahren (z. B. 3x2x5 r25) dasselbe Muster nehmen. Verwandt: [[lean-yang-bounds]], [[hk-verfahren-a10]], [[lean-build-cloud]]
