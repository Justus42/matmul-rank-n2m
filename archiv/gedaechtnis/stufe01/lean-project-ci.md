---
name: lean-project-ci
description: S1-14 Workflow lean-project.yml baut lean/ in Actions mit sorry-Bericht und Axiom-Einstufung je Hauptsatz; PR #25 gemergt
metadata:
  type: project
---

Stand 25.11.2026 (S1-14, PR #25, Merge 5090735):
- `.github/workflows/lean-project.yml` baut lean/ bei PR/Push auf main (lean/**, Workflow, Skript) und per workflow_dispatch, ~2,5 min mit mathlib-Cache. Grün, solange `lake build` durchgeht; sorry lässt ihn nicht scheitern.
- `.github/scripts/lean_report.py`: Liste der Hauptsätze in MAIN_THEOREMS (Namen ändern sich? Dort nachziehen, sonst MISSING). Einstufung STANDARD/SORRY/OTHER/MISSING im Log, als Annotation und in der Job-Zusammenfassung.
- Fallstrick: Wurzelmodul `YangBounds` ist kein Build-Ziel (Glob `YangBounds.+`), also nur Untermodule importieren.
- Erster grüner Lauf: https://github.com/Justus42/matmul-rank-n2m/actions/runs/45555275380 . Ergebnis: 3 sorry (Statements.lean:34/41/49), SORRY für Satz 1, Satz 2, Rang 3x2x6=30, Rang 4x2x4>=25, HK-Schranke in Statements; STANDARD für Upper3x2x6.hopcroft_kerr_three_two_six.

Verwandt: [[lean-build-cloud]], [[lean-yang-bounds]], [[lean-upper-3x2x6]]
