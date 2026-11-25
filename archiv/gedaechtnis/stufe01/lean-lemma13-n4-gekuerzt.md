---
name: lean-lemma13-n4
description: S1-15 Lean-Datei zu Yangs Lemma 13 (n≥4), PR #26, Schnittstelle Lemma13Statement für S1-16
metadata:
  type: project
  modified: 2026-11-25T18:41:32.118Z
---

S1-15, `lean/YangBounds/YangN4Lemma13.lean` (PR #26, Merge 28b2fb3).
- Hauptsatz `YangBounds.YangN4Lemma13.lemma13_statement : Lemma13Statement K U Q`; Definitionen skewSpace/skewExt/sumMap/Lemma13Statement zeichengleich mit S1-16 (YangN4Haupt.lean) abgestimmt. Dazu `lemma13_of_gamma` (jedes γ) und `lemma11` (Prosa Lemma 11).
- Vorgehen: Lemma 11 per Induktion zusammen mit Lemma 13 statt über μ.
- Lokaler Bau: CI mit mathlib-Cache ist schneller (2,5 min) als lokaler Quellbau (~20 min), PR früh pushen lohnt.
Verwandt: [[yang-n4-prosa]], [[lean-build-cloud]]
