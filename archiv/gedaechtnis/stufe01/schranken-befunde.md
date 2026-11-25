---
name: schranken-befunde
description: Literaturbefunde Stufe 0 zu Schranken ⟨n,2,m⟩, v. a. Zahlbereich der oberen Schranke 32 bei ⟨4,2,5⟩
metadata:
  type: project
  modified: 2026-11-24T23:41:48.649Z
---

Stand 25.11.2026 (Thread „Schrankentabelle und Quellen prüfen", A-04..A-06, Datei lit/QUELLEN.md auf Branch claude/project-thread-ginp7u):
- Obere Schranke 32 für ⟨4,2,5⟩ stammt von AlphaEvolve (arXiv:2506.13131), Verfahren über ½ℤ, also nur Charakteristik ≠ 2. In Char. 2 bleibt 33 (Hopcroft-Kerr). Perminov (arXiv:2603.02398, Abschn. 7.4) findet in ℤ/ℤ₂/ℤ₃ nur 33.
- Untere Schranke 30 für ⟨3,2,6⟩ beruht nur auf Yang v3, nicht auf der Lean-Fassung von Tsyganov u. a. (die ergibt nur ≥29).
- Shitov ⟨2,2,m⟩: ResearchGate-DOI 10.13140/RG.2.2.29432.61441, Original nicht gelesen.
- Aus der Cloud-Umgebung sind arxiv.org und doi.org per curl gesperrt; alphaXiv-Tools und web-fetch funktionieren.

**Why:** Ändert die Ausgangstabelle im Protokoll (Lücke bei 4×2×5 nur außerhalb Char. 2).
**How to apply:** Bei Arbeit an 4×2×5 oder Tabelle immer den Zahlbereich mitführen. Verwandt: [[projekt-matmul]]
