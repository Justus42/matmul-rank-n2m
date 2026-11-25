---
name: s2-22-pruefung-b012
description: S2-22 (25.11.2026): Prüfung B-012 Satz C, Prüfer und GPT 6.2 Sol: Satz C hält, C1 nur generisch (Reparatur R-C1); PR #55 gemergt
metadata:
  type: project
  modified: 2026-11-25T15:20:54.743Z
---

S2-22, Stufe 2 Runde 6, Spur A, Prüfer. PR #55 gemergt (fe7b183). Bericht `lean/prosa/s2_444_spurA_r4_pruefung.md`, Code `versuche/s2-22/kl_pruef.py` (ohne sympy, GF(2^61−1)/GF(2^31), duale Zahlen).
- Beide unabhängig (GPT high Batch, 2 min, 0,06 $): Satz C hält. Folgerung C1 hat Lücke: Fall auf zulässiger Menge nicht konstant begründet. Reparatur R-C1: generisch (offene dichte Menge von p bzw. (p,u_0)) liegt jede 25er im Fall (5,8); einzelne (3,6)-Normalformen nicht ausgeschlossen.
- Lean-IsSymm (μ_t=0) reicht, wenn an allen p einer offenen Menge; einzelner Zeuge nicht (GPT-Gegenbeispiel: Strassen mit gespaltenem Term).
- Lean-Weg: Funktionenkörper K̄(s), Derivation; schwerste Teile: rationale M_p/Ableitung und Übergang einzelner IsSymm-Zeuge → generische Aussage (SN2 am generischen Punkt). Char-2-Schritt geht ohne Wurzeln.
- Praxis: Bridge lehnt prompt_file für dieses Repo weiter ab, Prompt inline (~30 KB ok).

Verwandt: [[s2-16-restfaelle-36-58]], [[s2-20-abgleich-satzB]], [[gemini-bridge]]
