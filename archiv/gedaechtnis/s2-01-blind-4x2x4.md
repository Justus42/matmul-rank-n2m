---
name: s2-01-blind-4x2x4
description: S2-01 Blindsuche 4x2x4 Runde 1, PR #34 gemergt: F2-Flipsuche nur 26, Lemma M zur inneren Substitution offen
metadata:
  type: project
  modified: 2026-11-25T07:45:11.431Z
---

S2-01 (25.11.2026), PR #34 gemergt (8b2417a), Datei versuche/s2-blind-r1.md plus Code in versuche/s2-blind-r1/.
- Flip-Graph GF(2) (flip.c): Rang 26 ~2,2 Mio. mal, ~145 000 verschiedene Verfahren, nie 25. GF(3)-Variante (flip3.c) kommt vom Standardverfahren nicht unter 32, aufgegeben.
- Substitution: r >= 16 + S_mid (innerer Index auf 1, <4,1,4>). Bei 31 267 von 31 272 Rang-26-Verfahren S_mid = 10 (scharf), 5 mit 9. Offenes Lemma M: jede 25er Zerlegung hat S_mid >= 10.
- Fehlerfallen Flipsuche: nach Plus-Übergang nicht sofort reduzieren; Plateau-Schwelle klein (3e5–1e6).
- Blindheit nur teilweise: Projektgedächtnis lieferte Literaturstand automatisch.

**Why:** Grundlage für weitere Stufe-2-Aufträge zu 4x2x4.
**How to apply:** Nächste Schritte laut Datei: GF(2)-Zertifikat per Fallunterscheidung + SAT, Lemma M1 (Zahl der Rang-2-Faktoren). Verwandt: [[wache-stufe2-4x2x4]]
