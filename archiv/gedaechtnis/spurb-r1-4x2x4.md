---
name: spurb-r1-4x2x4
description: S2-03 (25.11.2026) Spur B Runde 1: kein 25er für 4x2x4; Flip-Graph-Befund (starre 26er, q^6-Komponenten), PR #36 gemergt
metadata:
  type: project
  modified: 2026-11-25T08:30:04.455Z
---

S2-03, 25.11.2026, PR #36 gemergt (5bfa2d5). Bericht `versuche/s2-spurB-r1.md`, Code `versuche/s2-spurB-r1/` (flip.c, als.py), Verfahren `verfahren/4x2x4-r26-s001.json` (Z, beide Prüfer ANGENOMMEN, Status behauptet).
- Kein 25er über F2, F3, F5, Z(±1) nach ~4,4·10^9 Flips in 2 Blöcken; numerisch über R Rang 26 exakt, Rang 25 nie (nur Näherungen mit wachsenden Koeffizienten).
- 26er sind fast starr (3–4 Flip-Paare), Rang-26-Komponente genau q^6 Elemente, Plus-Übergänge kehren stets zurück. Flip-Graph-Wanderung für 4x2x4 lohnt kaum weiter.
- `.gitignore` schließt *.log aus; große SCHEME-Listen nicht ins Repo.
- Empfohlen: SAT mit Symmetrie A↔Bᵀ über F3, viele unabhängige 26er-Familien mit größerem Slack, Literatur zum Grenzrang von <2,4,4>.

**How to apply:** Vor neuer Spur-B-Arbeit Bericht lesen; flip.c ist wiederverwendbar (-DNN -DKK -DMM). Verwandt: [[wache-stufe2-4x2x4]]
