# Literaturwache

Ein Eintrag pro Sitzung, auch wenn nichts Neues da ist. Neueste Einträge unten.

---

## 25.11.2026 (Einrichtung)

Geprüft: Websuche und arXiv zu unteren Schranken für kleine Formate.

- arXiv:2609.14393 (Yang): letzte gesehene Fassung v3 vom 12.10.2026
- arXiv:2609.22054 (Tsyganov u. a.): Fassung v1 vom 18.09.2026 gesehen
- Repo fallnlove/mm325_proof: nicht erreichbar gewesen, Stand unbekannt
- Keine Arbeit gefunden, die 4×2×4, 4×2×5 oder 3×2×7 schließt
- Keine Lean-Fassung von Yang v3 gefunden

Einschränkung: Das war eine Suche über Suchmaschine, kein vollständiger Durchgang der arXiv-Listen in cs.CC. Der erste reguläre Wachdurchgang holt das nach.

---

## 25.11.2026 (Beginn Runde 2, Stufe 0)

Rolle: Literaturwächter. Durchgang nach Protokoll Abschnitt 7. Werkzeuge: arXiv-Abstract-Seiten (über Abruf, da arxiv.org per curl aus der Umgebung gesperrt ist), alphaXiv-Suche mit Filter ab 01.09.2026, Websuche, `git clone` des Lean-Repos.

### Ergebnis für die Abbruchregel 3

**Keines der Ziele ist anderswo gelöst gefunden worden.** Weder der Rang von 4×2×4, 3×2×7 oder 4×2×5 noch eine Lean-Fassung von R(⟨3,2,6⟩) = 30 tauchte auf. Status: behauptet (Suche eines Agenten, keine Vollständigkeit garantiert).

### Beobachtete Quellen

- **arXiv:2609.14393 (Yang):** aktuelle Fassung weiterhin **v3 vom 12.10.2026**, eingereicht 13.09.2026. Keine neue Fassung. Die Abstract-Seite zeigte nur „Submitted“ und „This version“, die Daten von v1 und v2 blieben unausgelesen.
- **arXiv:2609.22054 (Tsyganov u. a.):** weiterhin nur **v1 vom 18.09.2026**.
- **Repo fallnlove/mm325_proof:** jetzt erreichbar (öffentlicher `git clone`). Genau **ein Commit**: `759cf4a8524d4212e7832046204c90b9361ba2bb`, 18.09.2026, „first commit“. Keine neuen Commits seit Erscheinen des Papers.
- **arXiv:2603.07280 (Wang):** aktuelle Fassung **v11 vom 29.08.2026**. Der Titel auf der Abstract-Seite lautet jetzt „Automated Lower Bounds for Bilinear Complexity over Finite Fields“ (in `lit/QUELLEN.md` steht der ältere Titel mit „Tensor Rank“). Die Ergebnisse betreffen über 𝔽₂ u. a. ⟨2,3,4⟩ (≥ 19), ⟨3,4,4⟩ (≥ 29), ⟨3,3,3⟩ (≥ 20). Keine Aussage zu unseren vier Formaten gefunden (Abschnittsende nur in Zusammenfassung gelesen).

### Neue Arbeiten seit dem letzten Eintrag (Thema tensor rank / matrix multiplication / lower bound)

Keine davon betrifft ⟨n,2,m⟩ mit n ≥ 3. Zur Übersicht die nächstliegenden:

| arXiv | Titel (gekürzt) | Datum | Bezug zu uns |
|---|---|---|---|
| 2609.06725 | A Lower Bound of 21 for 3×3 Matrix Multiplication over 𝔽₂ | 06.09.2026 | kein Ziel (3×3) |
| 2609.18722 | A Structural Proof of the Lower Bound 21 for 3×3 over 𝔽₂ | 16.09.2026 | kein Ziel |
| 2610.01639 | Lower Bound of 22 for 3×3 Matrix Multiplication over the Integers | 01.10.2026 | kein Ziel |
| 2610.11823 | The rank of 3×3 matrix multiplication over F2 is 23 | 08.10.2026 | kein Ziel; Methode evtl. lesenswert für Stufe 2 (vermutet) |
| 2609.05648 | Maximal rank of 4×4×4 and k×4×3 tensors over 𝔽₂ | 04.09.2026 | kein Ziel (Maximalrang, nicht Matrixmultiplikation) |
| 2611.31155 | So Many Ways to Multiply 3×3 Matrices: Rank-23 Schemes | 23.11.2026 | kein Ziel |
| 2611.09716, 2611.04175, 2610.30054, 2610.28627 | Darstellungen des Ergebnisses ω ≤ 9/4 | Okt./Nov. 2026 | Asymptotik, Nicht-Ziel |

Zusätzlich gesichtet, ohne Bezug: Alman/Li, *Asymptotic Rank Speedup Theorems, Revisited*, CCC 2026 (LIPIcs 383, Art. 36), nur asymptotischer Rang. Für obere Schranken: keine neue Arbeit gefunden, die ⟨2,4,4⟩ mit 25, ⟨2,3,7⟩ mit 34 oder ⟨2,4,5⟩ mit 31 erreicht.

### Einschränkungen

- Kein vollständiger Durchgang der arXiv-Listen von cs.CC: Die Listenseiten sind aus der Umgebung nicht direkt abrufbar. Gesucht wurde über alphaXiv (nach Datum gefiltert) und Websuche.
- Die Seite caisc2026.github.io/verifiable-problems (Problem „matrix-multiplication-tensor-rank“) lädt ihren Inhalt erst im Browser und war nicht lesbar. Beim nächsten Durchgang erneut versuchen oder Justus fragen lassen.
- Kataloge FMM-Lille und Perminov (offene Frage aus `lit/QUELLEN.md` zu 32 über ℤ oder 𝔽₂) wurden in diesem Durchgang nicht eingesehen.
