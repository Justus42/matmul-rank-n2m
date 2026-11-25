---
name: s2-14-lean-satzA
description: S2-14 (25.11.2026): Lemma 13′ und Satz A (B-008) in Lean ohne sorry, PR #45 gemergt, Schnittstellen für Satz B
metadata:
  type: project
  modified: 2026-11-25T14:03:26.502Z
---

S2-14, Stufe 2 Runde 4, Spur A, Formalisierer. PR #45 gemergt (9a49624), Actions grün (Lauf 45629108828), kein sorry, nur Standard-Axiome. Zweig claude/project-thread-bwshn1. Status behauptet (Aussagen-Abgleich nach 5.1 Punkt 3 offen, Frist Ende Runde 5).
- `lean/YangBounds/Lemma13Prime.lean`: Lemma 13′ abstrakt für e+2 Abbildungen, verdoppelte Form (e+2)ρ + 2s + e·rkL ≤ 2rkH, s = finrank (⨆ i, (ker G).map (F i)), G = ∑ γ_i F_i. Basisfrei, Beweis über mixF/rowMatrix aus YangN4Lemma13.
- `lean/YangBounds/SatzA444.lean` (Notation YangN4Haupt, d := 3): SatzAStatement/satzA_statement, satzA_global (Prosa-Form), Lemma13PrimeStatement, sDim_table, exists_common_kernel (Fälle (3,6),(4,7),(5,7) ⇒ N ≠ 0), corollaryA1 (range Φ = (range Lq).prod ⊤), corollaryA2 (rkL=5 ⇒ JHat = ker W).
- Lehre: Die Kurzform „rk H ≤ rk L + 2“ für s = 0 ist falsch, sie verliert (3,6); richtig ist die Fallliste (Lean hat es gezeigt).
- Axiom-Bericht: `#print axioms` am Dateiende, Ausgabe steht im Build-Log (Actions), kein Eingriff in das gemeinsame lean_report.py.
- Nicht formalisiert: Iso-Teil von A1 (ker L → Q³/im H), für Satz B nicht nötig.

Verwandt: [[s2-05-restfaelle-444]], [[s2-09-pruefung-spurA]], [[lean-lemma13-n4]], [[lean-build-cloud]]
