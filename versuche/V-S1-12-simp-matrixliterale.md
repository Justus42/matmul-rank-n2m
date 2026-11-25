# V-S1-12: Korrektheit des 3×2×6-Verfahrens direkt mit simp und ring

- Ziel: `hopcroft_kerr_three_two_six` (Rang von 3×2×6 höchstens 30 über jedem Körper), Stufe 1, Auftrag S1-12.
- Idee: Koeffizienten von `verfahren/3x2x6-r30-hk71.json` als Matrixliterale `!![...]` mit Einträgen im Körper `K` hinschreiben, `alpha k`, `beta k` als Linearformen daraus, dann `ext s t`, `fin_cases s <;> fin_cases t` und `simp [Fin.sum_univ_succ, U, V, W] <;> ring` für alle 18 Einträge von C.
- Woran es scheiterte: Lean 4.19.0 bricht ab mit „(deterministic) timeout at `whnf`, maximum number of heartbeats (200000) has been reached“ im `simp`-Schritt. Auch eine schrittweise Variante (erst `Fin.sum_univ_succ`, dann `Matrix.cons_val_succ`, `Matrix.of_apply`) blieb nach 32 s bei einem einzigen Eintrag stecken: Indizes wie `Fin.succ 2` in den inneren Vektoren wurden von `simp` nicht ausgewertet, `ring` sah unausgewertete Terme `Matrix.of ![...] 0 (Fin.succ 2)`.
- Was man daraus lernt: Die 30fache Summe nicht im Körper ausrechnen. Erfolgreich war: die Tensoridentität `∑ r, u r i j * v r p q * w r s t = [i = s ∧ j = p ∧ q = t]` über ℤ mit `decide +kernel` prüfen (14 s, keine zusätzlichen Axiome), dann allgemein über die Summen über (i, j, p, q) auf den Körper übertragen (`lean/YangBounds/Upper3x2x6.lean`).
- Runde und Datum: Stufe 1, Runde 3, 25.11.2026.
