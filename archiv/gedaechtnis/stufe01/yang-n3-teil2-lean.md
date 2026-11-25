---
name: yang-n3-teil2-lean
description: S1-10 Lean-Teil 2 (Lemma A starke Normalisierung mit R2, R3) in lean/YangBounds/YangN3Teil2.lean, sorry-frei, PR #23 gemergt
metadata:
  type: project
  modified: 2026-11-25T05:32:43.463Z
---

Stand 25.11.2026 (S1-10, Stufe 1 Runde 3, PR #23, Merge 747a2ad): `lean/YangBounds/YangN3Teil2.lean`, Namespace `YangBounds.YangN3Teil2`. Kein sorry, Axiome nur propext/Classical.choice/Quot.sound. Status behauptet.
- `StronglyNormalized alg` (SN1: `alpha k (unitMatrix 0 0) ≠ 0`; SN2: `v ≠ 0 → LinearIndependent K (fun i k => alpha k (unitMatrix i 0) * beta k v)`).
- `exists_stronglyNormalized [Infinite K] alg : ∃ r' ≤ r, ∃ alg', StronglyNormalized alg'` – das braucht der Zusammenbau mit Teil 1 (Körpererweiterung) und Teil 3 (SN als Hypothese).
- Auch `changeBasis` (R3), `removeZeroAlpha` (R2), `lemmaA`.
- Lakefile: `globs = ["YangBounds.+"]` kam aus S1-09, baut alle Teile.

Verwandt: [[yang-n3-prosa]], [[lean-yang-bounds]], [[lean-build-cloud]]
