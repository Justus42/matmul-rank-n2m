---
name: lean-yang-n4-haupt
description: S1-16 Lean-Hauptbeweis Yang Satz 2 (n≥4) in YangN4Haupt.lean, Lemma 13 als Hypothese, kein sorry, PR #28
metadata:
  type: project
  modified: 2026-11-25T06:01:02.540Z
---

Stand 25.11.2026 (S1-16, Stufe 1 Runde 4): `lean/YangBounds/YangN4Haupt.lean`, PR #28, Status behauptet.
- Satz `YangBounds.YangN4Haupt.yang_theorem_two_of_lemma13 (h13 : ∀ L [Field L] (U Q : Type u) …, Lemma13Statement L U Q)` liefert wörtlich die Aussage von `yang_theorem_two`. Kein sorry, nur Standard-Axiome (lokal).
- Schnittstelle (skewSpace, skewExt, sumMap, Lemma13Statement) zeichengleich mit S1-15 (PR #26, `YangN4Lemma13.lemma13_statement`). Einsetzen geht ohne Brücke: `yang_theorem_two_of_lemma13 (fun L _ U Q _ _ _ _ => YangN4Lemma13.lemma13_statement (K := L) U Q)` lokal geprüft.
- Nächster Schritt: sorry von `yang_theorem_two` in Statements.lean so ersetzen (Import-Reihenfolge beachten: Statements importiert die Teile noch nicht).
- Lean-Tipp: `lake build` erfasst neue Module per Glob erst, wenn sie beim Start existieren; `lake env lean Datei.lean` ist der schnelle Prüfweg (~15 s nach mathlib-Bau).

Verwandt: [[lean-yang-bounds]], [[yang-n4-prosa]], [[lean-build-cloud]]
