---
name: s2-19-abgleich-b008
description: S2-19 (25.11.2026): Aussagen-Abgleich B-008 Satz A, Prüfer und GPT bestätigen Kern, B-008 geprüft außer A1-Isomorphismus; PR #52 gemergt
metadata:
  type: project
  modified: 2026-11-25T15:04:52.350Z
---

S2-19, Stufe 2 Runde 5, Spur A, Prüfer. PR #52 gemergt (8485c54). Bericht in `behauptungen/B-008.md`, Belege `versuche/s2-19-abgleich/` (Check.lean, GPT-Auftrag/-Antwort).
- B-008 jetzt **geprüft** für Kernaussage (ρ = 3, vier Fälle), A1-Surjektivität, A2. Isomorphie-Teil von A1 (ker L → Q³/im H) ohne Lean-Satz, bleibt behauptet. Übersicht behauptungen/README.md nicht nachgetragen (Orchestrator).
- Beide Prüfer (Claude, GPT 6.2 Sol high Batch, in 1 min fertig, 0,04 $) nennen dieselben Abweichungen: A1-Iso fehlt; `satzA_global` verknüpft alg' nicht mit alg (unschädlich, `satzA_statement` gilt für jede Normalform).
- Praxis: Bridge lehnt `repo`/`prompt_file` für matmul-rank-n2m weiter ab ("nicht freigegeben"), Prompt inline (~60 KB ging). Lokaler Build: Toolchain über GitHub-Release, mathlib aus Quellen für `YangBounds.SatzA444` in < 30 min auf 4 Kernen (1699 Module). `Field (ZMod 2)` braucht Import `Mathlib.Algebra.Field.ZMod`.
- Workflow lean-project.yml schlägt bei sorry NICHT fehl: immer die Zeile „SORRY: 0“ im Log prüfen.

Verwandt: [[s2-14-lean-satzA]], [[lean-build-cloud]], [[gemini-bridge]]
