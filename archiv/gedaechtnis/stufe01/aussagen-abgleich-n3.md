---
name: aussagen-abgleich-n3
description: S1-18 (25.11.2026) Aussagen-Abgleich yang_theorem_one und rank_three_two_six, beide bestätigt (Prüfer + gpt-6.2-sol), behauptungen/B-006.md, PR #32 gemergt
metadata:
  type: project
  modified: 2026-11-25T06:28:49.903Z
---

S1-18, 25.11.2026, PR #32 gemergt (Merge 25492a5). Datei `behauptungen/B-006.md` (Rang ⟨3,2,6⟩ = 30), Status behauptet, Entscheidung über geprüft beim Orchestrator.
- Prüfer und Fremdmodell `openai/gpt-6.2-sol` (high, Batch) bestätigen: `yang_theorem_one` = Yang v3 Satz 1; `rank_three_two_six` = R_K(⟨3,2,6⟩)=30 über jedem Körper. Nur Standard-Axiome lokal.
- Nebenbefund: veraltete „(open)“-Kommentare in Statements.lean und Upper3x2x6.lean.
- Bridge-Hinweis: Das Repo matmul-rank-n2m ist in der Bridge NICHT freigegeben (`repo`/`files` scheitern). Dateien wörtlich in `prompt` einfügen. Batch war nach ~1 min fertig.
- Lean lokal: Toolchain über GitHub-Release, mathlib-Bau für YangBounds.Statements lief diesmal schnell (Cache-Ordner fehlte nicht?); Prüfdatei braucht `import YangBounds.Statements` (YangBounds.olean wird nicht gebaut bei Teilziel).

Verwandt: [[lean-yang-n3-zusammensetzung]], [[lean-upper-3x2x6]], [[lean-build-cloud]]
