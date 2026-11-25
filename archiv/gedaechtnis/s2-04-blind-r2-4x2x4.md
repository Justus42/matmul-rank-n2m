---
name: s2-04-blind-r2-4x2x4
description: S2-04 Blindsuche 4x2x4 Runde 2, PR #39 gemergt: ALS R/C nie 25 (Residuum 1), SAT GF(2) mit Symmetrie zu schwach, Lemma tau
metadata:
  type: project
  modified: 2026-11-25T09:04:15.522Z
---

S2-04 (25.11.2026), PR #39 gemergt (37ba635), Bericht versuche/s2-blind-r2.md, Code versuche/s2-blind-r2/.
- Regularisiertes ALS über R und C: Rang 26 in 18/146 (R) bzw. 12/25 (C) Starts, Rang 25 in 326 Starts nie; Residuen genau 1, √2, √3, Koeffizienten beschränkt auch bei λ→1e-14. Status vermutet.
- SAT GF(2) (pycryptosat, XOR nativ) mit Symmetrie c4/c2/τ: selbst Rang 26 nicht in 5 min; alle 25er-Läufe Zeitgrenze.
- Lemma τ (behauptet): τ-invariante Verfahren (u,v,w)->(vᵀ,uᵀ,wᵀ) in Char 2 brauchen ≥4 feste Produkte, ungerader Rang ≥5.
- Komplexes ALS: Normalgleichung mit G, nicht Gᵀ (Fehlerfalle).

**How to apply:** Vorschläge: Grenzrang-Test über C mit ε-Starts aus 26ern, Lemma τ prüfen lassen, SAT erst an Rang 26 kalibrieren. Verwandt: [[s2-01-blind-4x2x4]], [[spurb-r1-4x2x4]]
