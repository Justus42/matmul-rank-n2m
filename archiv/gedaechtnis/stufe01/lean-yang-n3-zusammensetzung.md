---
name: lean-yang-n3-zusammensetzung
description: S1-13 (25.11.2026): Yang Satz 1 aus Teil 1-3 in YangN3.lean zusammengesetzt, Statements ohne sorry außer Satz 2, PR #27
metadata:
  type: project
  modified: 2026-11-25T05:56:18.124Z
---

S1-13, 25.11.2026, PR #27 gemergt (Merge d9d1e04), Actions „Build lean/ and report axioms“ grün. Status behauptet.
- `lean/YangBounds/YangN3.lean`: `YangN3.yang_n3_infinite`, `YangN3.yang_theorem_one_proof`. Schnittstelle Teil2→Teil3: SN1 identisch (e32 = abbrev unitMatrix), SN2 per `sn2_family_eq` (funext, fin_cases, simp [f_apply, avec, bvec]).
- Importzyklus Teil1→Statements gelöst: `ceil_bound_iff` unverändert nach `lean/YangBounds/CeilBound.lean` verschoben; Teil1 importiert CeilBound.
- Statements.lean: `yang_theorem_one` und `hopcroft_kerr_three_two_six` ohne sorry, nur `yang_theorem_two` offen. `rank_three_two_six` nur Standard-Axiome.
- Lokaler Build: mathlib aus Quellen dauerte hier nur ~10 min auf 4 Kernen.

**How to apply:** Wer Satz 2 (n≥4) einsetzt, importiert die YangN4-Datei in Statements analog; Teile dürfen Statements nicht importieren (Zyklus). Verwandt: [[lean-yang-bounds]], [[lean-upper-3x2x6]], [[lean-build-cloud]]
