---
name: lean-yang-n4-haupt
description: S1-16: YangN4Haupt.lean mit Lemma 13 als Hypothese, PR #28; Schnittstelle und Lean-Tipps
metadata:
  type: project
  modified: 2026-11-25T18:41:50.360Z
---

S1-16 (Stufe 1 Runde 4): `lean/YangBounds/YangN4Haupt.lean`, PR #28.
- Satz `YangBounds.YangN4Haupt.yang_theorem_two_of_lemma13 (h13 : ∀ L [Field L] (U Q : Type u) …, Lemma13Statement L U Q)` hat als Schluss die Aussage von `yang_theorem_two`.
- Schnittstelle (skewSpace, skewExt, sumMap, Lemma13Statement) zeichengleich mit S1-15 (PR #26, `YangN4Lemma13.lemma13_statement`). Einsetzen: `yang_theorem_two_of_lemma13 (fun L _ U Q _ _ _ _ => YangN4Lemma13.lemma13_statement (K := L) U Q)`.
- Lean-Tipp: `lake build` erfasst neue Module per Glob erst, wenn sie beim Start existieren; `lake env lean Datei.lean` ist der schnelle Weg (~15 s nach mathlib-Bau).
Verwandt: [[lean-yang-bounds]], [[yang-n4-prosa]], [[lean-build-cloud]]
