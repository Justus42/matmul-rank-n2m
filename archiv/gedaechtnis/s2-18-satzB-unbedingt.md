---
name: s2-18-satzB-unbedingt
description: S2-18 (25.11.2026): Satz B ohne Hypothesen in lean/YangBounds/SatzB444Final.lean, PR #49 gemergt, Actions auf main grün (Lauf 45635237494)
metadata:
  type: project
  modified: 2026-11-25T14:39:28.288Z
---

S2-18, Stufe 2 Runde 5, Spur A, Formalisierer. PR #49 gemergt (Merge 1ca01a5), Actions-Lauf auf main Nr. 30, id 45635237494, grün; 0 sorry, nur propext/Classical.choice/Quot.sound. Status behauptet (Aussagen-Abgleich läuft separat).
- Neue Sätze im Namensraum `YangBounds.SatzB444`: `satzB_unbedingt`, `satzB_symm_unbedingt`, `satzB_global_unbedingt`, dazu `satzAHyp_holds`, `commonKernelHyp_holds`. Aussagen wörtlich die von satzB/satzB_symm/satzB_global ohne die Binder hA, hN (maschinell nach Leerraum-Normalisierung verglichen).
- Hypothesen passten ohne Anpassung: SatzAHyp K := SatzA444.satzA_statement K, CommonKernelHyp K := fun alg h1 h2 hc => SatzA444.exists_common_kernel alg h1 h2 hc.
- Die drei Sätze stehen in MAIN_THEOREMS von .github/scripts/lean_report.py und in lean/Axioms.lean; Wurzelmodul importiert SatzB444Final.

Verwandt: [[s2-15-satzB-lean]], [[s2-14-lean-satzA]]
