---
name: s2-27-satzE-lean
description: S2-27 (25.11.2026): Satz E (Unterfall A unmöglich) in Lean ohne sorry, PR #60 gemergt, Actions-Lauf 45658431578 grün, SORRY 0; Lemma P nur als Hypothese
metadata:
  type: project
  modified: 2026-11-25T16:55:25.282Z
---

S2-27, Stufe 2 Runde 7, Spur A, Formalisierer. PR #60 gemergt (b8cee48), Actions-Lauf auf main 45658431578 grün, SORRY: 0, nur Standard-Axiome. Status B-013 bleibt behauptet.
- `lean/YangBounds/SatzE444.lean`: `finrank_JHat_le_eight` (Rahmen nach Prüfbericht S2-23 Abschn. 8.1), `UnterfallA` (schwach: K* dim 2, F_i(K*) ⊆ K·q), `rkL_le_four_of_unterfallA`, `satzE` (Fall (5,8) ⇒ ¬UnterfallA), `satzE_global`. Braucht nur rk L = 5 und IsAlgClosed, keine Nicht-Symmetrie, kein s = 1.
- Beweis: Kette u^0..u^3 per Dimensionszählung + Wurzel-Induktion statt Kronecker; Punktlemma pro Koordinate statt Hankel; Ĵ ⊆ span von 8 Vektoren.
- `lean/YangBounds/SatzE444Buendel.lean`: `Omega`, `Kstern`, `UnterfallAVoll`, `UnterfallB`, `NichtSymmetrisch := ¬SatzB444.IsSymm`, `commonKernel_trivial`, `sDim_eq_one`, `LemmaPStatement` (NICHT bewiesen, nur Hypothese), `nur_unterfallB(_global)`.
- Offen: Lemma P (Existenz γ*, Dimension K* ∈ {2,3}, Q2). Elementarer Weg: Minor-Endlichkeit auf Geraden + Schubfach (GPT-Vorschlag im Prüfbericht).
- Anschluss an S2-26: `SatzC444.satzC_generisch` liefert ¬IsSymm für `genAlg` (generischer Punkt, kein alg. abgeschlossener Körper), Verkettung mit satzE braucht Übergang zum Abschluss.

Verwandt: [[s2-23-pruefung-b013]], [[lean-build-cloud]]
