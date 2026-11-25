---
name: lean-satz2-eingesetzt
description: S1-17 (25.11.2026): yang_theorem_two in Statements.lean eingesetzt, kein sorry mehr im Lean-Projekt, PR #29 gemergt
metadata:
  type: project
---

S1-17, 25.11.2026, PR #29 gemergt (Merge 46f1038). Status behauptet.
- Statements.lean importiert YangN4Lemma13 und YangN4Haupt; YangN4Haupt importiert Statements nicht mehr (war ungenutzt). Nichts verschoben.
- Actions-Lauf 45558450190: 0 sorry, alle 6 Hauptsätze nur propext/Classical.choice/Quot.sound.
- Offener Nebenbefund: `lean/Axioms.lean` importiert das Wurzelmodul `YangBounds`, das `lake build` (globs YangBounds.+) nicht baut; `lake env lean Axioms.lean` scheitert. Workaround: Kopie mit `import YangBounds.Statements`.
- Nächster Schritt laut Protokoll: Aussagen-Abgleich (5.1 Punkt 3), erst dann geprüft.

Verwandt: [[lean-yang-n4-haupt]], [[lean-lemma13-n4]], [[lean-yang-n3-zusammensetzung]], [[lean-build-cloud]]
