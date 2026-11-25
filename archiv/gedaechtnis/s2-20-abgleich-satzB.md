---
name: s2-20-abgleich-satzB
description: S2-20 (25.11.2026): Aussagen-Abgleich B-009, Rangteil geprüft, Symmetrie-Zusatz μ_t≠0 bleibt behauptet; PR #51 gemergt
metadata:
  type: project
  modified: 2026-11-25T14:50:24.591Z
---

S2-20, Stufe 2 Runde 5, Spur A, Prüfer. Bericht in `behauptungen/B-009.md`, PR #51 gemergt (dfb6976).
- Prüfer und GPT 6.2 Sol (Batch, high, 7 min, 0,05 $) unabhängig: `SatzB444.satzB_unbedingt` (SatzB444Final.lean, PR #49, Merge 1ca01a5) = Kernaussage B-009, jeder Körper, jedes zulässige u_0. Actions grün auf main, Lauf 45635237494, nur Standard-Axiome.
- Abweichungen A1: `IsSymm` erlaubt μ_t = 0 (Prosa V1 verlangt μ_t ≠ 0), A2: `satzB_global` nur Existenzform ohne Bezug zu alg (unschädlich).
- B-009 Status: Rangteil geprüft, Zusatz μ_t ≠ 0 behauptet. README-Übersicht nicht angefasst (Orchestrator).
- Lokaler Lean-Bau aus Quellen dauerte ~35 min (1722 Module für SatzB444). `ZMod 2` hat im Importbaum keine Field-Instanz; für Probe `[Field F] [Fintype F] [CharP F 2]` nehmen.

Verwandt: [[s2-15-satzB-lean]], [[lean-build-cloud]], [[gemini-bridge]]
