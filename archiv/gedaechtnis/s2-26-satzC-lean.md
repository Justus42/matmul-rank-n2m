---
name: s2-26-satzC-lean
description: S2-26 (25.11.2026): Satz C und C1 (R-C1) generisch in Lean ohne sorry, PR #59 gemergt; Weg über Frac(K[S,T]) und Derivation
metadata:
  type: project
  modified: 2026-11-25T16:20:52.558Z
---

S2-26, Stufe 2 Runde 7, Spur A, Formalisierer. PR #59 gemergt (Merge 0563469), Actions-Lauf auf main 45653961790: SORRY 0, STANDARD=12. Status behauptet, Aussagen-Abgleich offen (Frist Ende Runde 8).
- Dateien: `lean/YangBounds/SatzC444Kern.lean` (`satzC_kern`: Körper mit Derivation, Länge r ≤ 25, Symmetrie an (p,v) ⇒ False), `lean/YangBounds/SatzC444Generisch.lean` (`genAlg` = changeBasis mit generischen S,T über GField K = Frac(K[Var 3]); `genSN1`, `genSN2`, `satzC_generisch`, `folgerungC1_generisch`: SN1 ∧ SN2 ∧ (5,8) ∧ ¬IsSymm für Länge 25).
- Abweichung: Symmetrie am generischen Punkt statt auf offener Menge; Prosa-Schritt 0 (rationale M_p) nicht formalisiert, für R-C1 nicht nötig.
- Lean-Praxis: DualNumber-olean musste extra gebaut werden (`lake build Mathlib.Algebra.DualNumber`); `map_add` auf RingHom in DualNumber gibt Typklassen-Timeout, `RingHom.map_add` benutzen; in Namensraum IsDeriv `_root_.map_sum` schreiben.

Verwandt: [[s2-22-pruefung-b012]], [[s2-18-satzB-unbedingt]], [[lean-build-cloud]]
