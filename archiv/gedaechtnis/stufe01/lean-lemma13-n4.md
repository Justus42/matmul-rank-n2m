---
name: lean-lemma13-n4
description: S1-15 Lean-Beweis von Yangs Lemma 13 (n≥4, reparierte Fassung), PR #26 gemergt, ohne sorry, Schnittstelle Lemma13Statement für S1-16
metadata:
  type: project
  modified: 2026-11-25T06:00:28.092Z
---

Stand 25.11.2026: S1-15 erledigt, `lean/YangBounds/YangN4Lemma13.lean` auf main (PR #26, Merge 28b2fb3), Status behauptet.
- Kein sorry, nur propext/Classical.choice/Quot.sound, Actions grün (Lauf 45556807369).
- Hauptsatz `YangBounds.YangN4Lemma13.lemma13_statement : Lemma13Statement K U Q`; Definitionen skewSpace/skewExt/sumMap/Lemma13Statement zeichengleich mit S1-16 (YangN4Haupt.lean) abgestimmt. Dazu `lemma13_of_gamma` (jedes γ) und `lemma11` (Prosa Lemma 11).
- Die Reparatur über Q/im F₁ trägt, kein Befund für Abbruchregel 4.
- Abweichung vom Prosa-Beweis: Lemma 11 per Induktion zusammen mit Lemma 13 statt über μ.
- Lokaler Bau: CI mit mathlib-Cache ist schneller (2,5 min) als lokaler Quellbau (~20 min), PR früh pushen lohnt.

Verwandt: [[yang-n4-prosa]], [[pruefung-yang-n4]], [[lean-build-cloud]]
