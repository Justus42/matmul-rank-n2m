---
name: s2-05-restfaelle-444
description: S2-05 (25.11.2026): Yang-Restfälle 4x2x4 r=25, (4,7),(5,7) ausgeschlossen (behauptet), offen (3,6),(5,8); PR #38 gemergt
metadata:
  type: project
  modified: 2026-11-25T08:52:12.883Z
---

S2-05, Stufe 2 Runde 2, Spur A, PR #38 gemergt (545a8d6). Bericht `lean/prosa/s2_444_spurA_r2.md`, Code `versuche/s2-spurA-r2/`. Alles Status behauptet.
- Satz A: vier Restfälle (rkL,rkH) mit rho=3 bestätigt.
- Neu: Lemma 13' (rkH >= 2rho + s + ceil((rkL-rho)/2), s = dim F2(kerF1)+F3(kerF1)), Lemma V (gemeinsamer Kern N≠0 bei rho=3 ⇒ symmetrisch: G^T b_t ∥ a_t), Lemma S (symmetrisch ⇒ rkH=8 bei rkL∈{4,5}, Polynomring/Koszul). Satz B: (4,7),(5,7) unmöglich; (3,6) zwingend symmetrisch; (5,8) offen (Ĵ = ker W, s≤1).
- Modelle (Momentenkurve) realisieren (3,6),(5,8) in F-Daten: Ausschluss braucht g/C_t/p-Familie.
- Daten r=26: alle rho=3-Verfahren (nur Char. 2 gefunden) symmetrisch, L13' scharf. Lemma M ⇔ Ziel (keine Vereinfachung).
- Ganzzahlige Flipsuche (spurB flip.c p=0) kam in 280 s nur auf 27.

**How to apply:** Runde 3: Prüfer für Satz B (Generizität), dann (3,6) über g/Folgerung A1 angreifen. Verwandt: [[s2-02-spurA-f2-wang]], [[s2-01-blind-4x2x4]]
