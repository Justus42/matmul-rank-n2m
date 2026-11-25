---
name: yang-n3-teil3-lean
description: S1-11 Lean Teil 3 von Yang n=3 (lineare Algebra unter SN1/SN2) in lean/YangBounds/YangN3Teil3.lean, ohne sorry, PR #22
metadata:
  type: project
  modified: 2026-11-25T05:31:38.422Z
---

Stand 25.11.2026 (S1-11, Stufe 1 Runde 3): `lean/YangBounds/YangN3Teil3.lean`, Namensraum `YangBounds.YangN3Teil3`, PR #22. Kein sorry, nur Standard-Axiome (lokal). Status behauptet.
- Hauptsatz `yang_n3_of_stronglyNormalized alg (2 ≤ m) (SN1 alg) (SN2 alg) : 24*m+2 ≤ 5*r`.
- Schnittstelle für Teil 2 (starke Normalisierung): `SN1 alg := ∀ k, alg.alpha k (unitMatrix 0 0) ≠ 0`; `SN2 alg := ∀ v ≠ 0, LinearIndependent K ![f alg 0 v, f alg 1 v, f alg 2 v]`, `f alg i v = (α_k(unitMatrix i 0) * β_k(v))_k` (als `prodMap`/`LinearMap.pi`).
- lakefile hat seit PR #21 (S1-09, Teil 1) `globs = ["YangBounds.+"]`; neue Module werden damit mitgebaut.
- Lokaler Build: mathlib aus Quellen 15 min, danach Datei ~10 s.

Verwandt: [[yang-n3-prosa]], [[lean-yang-bounds]], [[lean-build-cloud]]
