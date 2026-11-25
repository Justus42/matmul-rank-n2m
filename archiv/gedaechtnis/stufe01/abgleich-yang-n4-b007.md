---
name: abgleich-yang-n4-b007
description: S1-19 Aussagen-Abgleich yang_theorem_two und rank_four_two_four_ge in behauptungen/B-007.md, PR #30 gemergt, Prüfer und GPT bestätigen
metadata:
  type: project
  modified: 2026-11-25T06:11:39.397Z
---

Stand 25.11.2026 (S1-19, Stufe 1 Runde 5): `behauptungen/B-007.md` (R_K(⟨4,2,4⟩) ≥ 25) angelegt, PR #30 gemergt (Merge 7b04255). Status bleibt behauptet.
- Prüfer und Fremdmodell (openai/gpt-6.2-sol, high, Batch) bestätigen beide unabhängig: yang_theorem_two = Yang v3 Satz 2, rank_four_two_four_ge = B-007, Definitionen BilinearAlgorithm/tensorRank treu. GPT-Vorbehalt: grep-Importprüfung nicht erschöpfend, Actions-Lauf typprüft.
- Offen für geprüft: sorry in yang_theorem_two ersetzen, Actions grün, #print axioms ohne sorryAx.
- Praxis: Die Bridge (ask_openrouter) darf Justus42/matmul-rank-n2m NICHT per repo/files lesen ("Repo nicht freigegeben"); Inhalte wörtlich in den prompt schreiben. Batch war in ~1 min fertig.
- Lean-Werkzeugkette lokal nicht ladbar (elan-Releases 403 am Proxy); mathlib-Quellen über raw.githubusercontent.com lesbar.

Verwandt: [[lean-yang-n4-haupt]], [[lean-yang-bounds]], [[gemini-bridge]]
