---
name: s2-16-restfaelle-36-58
description: S2-16 (25.11.2026): Satz C schließt symmetrische 25er aus, damit (3,6) weg; (5,8) nur noch Unterfall B offen; PR #47 gemergt
metadata:
  type: project
  modified: 2026-11-25T14:12:01.586Z
---

S2-16, Stufe 2 Runde 4, Spur A, PR #47 gemergt (9c80933). Bericht `lean/prosa/s2_444_spurA_r4.md`, Code `versuche/s2-16/`, neue `behauptungen/B-012.md`, `B-013.md` (behauptet; Übersicht README nicht nachgetragen, das macht der Orchestrator).
- Satz C (B-012): keine symmetrische Zerlegung der Länge 25 über jedem Körper. Trick: (D) an p und p+εd ableiten → Identität (Kl) Σ δ_t (a_t·u)(a_t·w)C_t = ω(uwᵀ+wuᵀ)M_p; Quadrik durch alle a_t (dim Ĵ ≤ 9) widerspricht. (Kl) exakt geprüft an Strassen (ℚ) und 14 F2-26ern. Mit B-009 ⇒ (3,6) ausgeschlossen.
- (5,8): nicht symmetrisch, s=1; Lemma P (Büschel), Satz E: Unterfall A (dim K*=2) unmöglich (Kronecker L4ᵀ, Gradzählung ≤ 8 < 9). Offen: Unterfall B (beide Seiten, Kubiken), Vermutung B, Restfall Projektionsgrad d=e=3.
- Nächste Schritte: Prüfer + GPT für B-012 (zählt dann nach 2 b)), danach Unterfall B.

Verwandt: [[s2-05-restfaelle-444]], [[s2-09-pruefung-spurA]]
