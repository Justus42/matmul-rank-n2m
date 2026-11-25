---
name: s2-15-satzB-lean
description: S2-15 (25.11.2026): Satz B, Lemma V′, Lemma S (rk H ≥ 8) in Lean ohne sorry, PR #48 gemergt; Hypothesen passen zu S2-14
metadata:
  type: project
  modified: 2026-11-25T14:24:49.547Z
---

S2-15, Stufe 2 Runde 4, Spur A, PR #48 gemergt (c42939b), Actions-Lauf 45632519420 grün, nur Standard-Axiome. Status behauptet, Aussagen-Abgleich (5.1 Punkt 3) offen, Frist Ende Runde 5.
- Dateien: `lean/YangBounds/SatzB444.lean`, `lean/YangBounds/SatzB444Poly.lean`.
- Hypothesen `SatzAHyp K` (= SatzA444.SatzAStatement) und `CommonKernelHyp K` (= exists_common_kernel). Lokal geprüft: `SatzA444.satzA_statement K` und `SatzA444.exists_common_kernel` erfüllen sie direkt, das Zusammensetzen für Runde 5 ist also zwei Zeilen.
- Abweichung von der Prosa: R1 nicht nötig (Gewichtung mit μ_t), Lemma S Teil 3 (generisches u_0) ersetzt durch neues Argument mit N1 + Syzygien-Lemma (UFD), nur rk H ≥ 8 formalisiert.
- Lean-Hinweis: großer Beweis braucht `set_option maxHeartbeats 1600000 in` vor dem Doc-Kommentar.

Verwandt: [[s2-09-pruefung-spurA]], [[lean-build-cloud]]
