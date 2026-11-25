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

---

## 25.11.2026 (vor Beginn von Stufe 2)

Rolle: Literaturwächter. Durchgang nach Protokoll Abschnitt 7, ergänzt um eine gezielte Suche für Stufe 2 (Rang von ⟨4,2,4⟩, gleichwertig ⟨2,4,4⟩ und ⟨4,4,2⟩). Werkzeuge: alphaXiv (Suche und Volltexte), Websuche, Abruf der arXiv-Abstract-Seiten und der FMM-Lille-Seiten über einen Abruf-Agenten, `git clone` öffentlicher Repos. arxiv.org ist per curl aus der Umgebung weiter gesperrt. Alle Befunde dieses Eintrags haben den Status **behauptet** (Suche eines Agenten, keine Vollständigkeit garantiert, keine Prüfung nach Abschnitt 5).

### Ergebnis für die Abbruchregel 3

**Der Rang von ⟨4,2,4⟩ ist nirgends als bestimmt gefunden worden.** Kein Verfahren mit 25 Multiplikationen und keine untere Schranke 26 tauchte auf, weder über beliebigen Körpern noch über 𝔽₂, ℤ oder ℚ. Abbruchregel 3 greift nach diesem Durchgang nicht. Ebenso nicht gefunden: eine Lösung von 3×2×7 oder 4×2×5.

### Pflichtpunkte nach Abschnitt 7

- **arXiv:2609.14393 (Yang):** weiterhin **v3 vom 12.10.2026**. Abstract-Seite zeigt „This version: v3 2026-10-12“, alphaXiv liefert dieselbe Fassung. Die Versionsliste mit den Daten von v1 und v2 war wieder nicht auslesbar.
- **arXiv:2609.22054 (Tsyganov u. a.):** weiterhin nur **v1 vom 18.09.2026**.
- **Repo fallnlove/mm325_proof:** weiterhin genau ein Commit, `759cf4a8524d4212e7832046204c90b9361ba2bb` vom 18.09.2026. Keine neuen Commits.
- **arXiv:2603.07280 (Wang):** weiterhin **v11 vom 29.08.2026**. Code-Repo github.com/wcgbg/tensor-rank-lower-bound: letzter Commit `9db3d21` vom 29.10.2026, Lizenz MIT.
- **Neue Arbeiten in cs.CC zu „tensor rank“, „matrix multiplication“, „lower bound“ seit dem letzten Eintrag (heute früher):** nur eine neue, ohne Bezug zu unseren Formaten: *The Matrix Multiplication Exponent Is Nine Fourths* (OpenAI, auf alphaXiv mit Datum 25.11.2026). Asymptotik, Nicht-Ziel. Außerdem bereits bekannt und ohne Bezug: 2611.09716, 2611.04175, 2611.31155.

### Für Stufe 2

#### Bekannte Verfahren für ⟨2,4,4⟩ mit 26 oder weniger

| Quelle | Rang | Zahlbereich | Bemerkung |
|---|---|---|---|
| Hopcroft und Kerr 1971 (HK71) | 26 | jeder Körper (Formel ⌈(3·4·4 + 4)/2⌉ = 26) | Original nicht gelesen. Lacelle26 (arXiv:2606.13408, Abschn. 7) baut die HK-Verfahren maschinell geprüft mit ganzzahligen Koeffizienten nach, auch ⟨2,4,4⟩ (Familie „square ⟨2,n,n⟩, n ≤ 16“: 14 von 14 erreichen die Formel) |
| FMM-Lille (fmm.univ-lille.fr/2x4x4.html) | 26 | auf der Seite nicht angegeben | einziger Eintrag für 2×4×4, Quelle HK71. Keine untere Schranke genannt |
| Perminov, github.com/dronperminov/FastMatrixMultiplication (Stand Commit `f70078c` vom 16.11.2026, MIT-Lizenz) | 26 | ZT (Koeffizienten −1, 0, 1), damit über jedem Ring | `docs/ranks.md`: ⟨2,4,4⟩ bester Rang 26 über ZT, ℤ **und** ℚ. Mehrere Verfahren mit 26 (u. a. `schemes/results/ZT/2x4x4_m26_ZT.json`, additionsreduziert mit 81 Additionen). Kein Verfahren mit 25 in irgendeinem Unterordner |
| AlphaTensor (Fawzi u. a. 2022) | 26 | ZT | bei Perminov als `schemes/known/alpha_tensor/2x4x4_m26_ZT.json` abgelegt, also keine Verbesserung durch AlphaTensor |
| AlphaEvolve (AE25, Tabelle 3) | 26 | – | laut `lit/QUELLEN.md`: bester bekannter Rang 26, AlphaEvolve erreicht 26, keine Verbesserung |

Zum Vergleich aus derselben Tabelle bei Perminov: ⟨2,4,5⟩ hat über ℚ Rang 32, über ZT und ℤ nur 33. Das ist das Muster, das schon A-05 für 4×2×5 festgestellt hat. Für ⟨2,4,4⟩ gibt es diesen Unterschied nicht: 26 überall.

Flip-Graph- und verwandte Suchen ohne Fortschritt bei ⟨2,4,4⟩: Kauers und Moosbauer (Flip-Graph 2023), Kauers und Wood (Meta-Flip-Graph, arXiv:2510.19787), Perminov (ternärer Meta-Flip-Graph, arXiv:2511.20317; Serendipitous Product, arXiv:2606.02480), GPU-Suche über 𝔽₂ (Medley u. a., arXiv:2609.17533 v2 vom 26.10.2026, nur quadratische Formate). Keine dieser Arbeiten meldet 25 für ⟨2,4,4⟩. Ob sie das Format überhaupt gezielt durchsucht haben, ist bei Kauers/Moosbauer und Kauers/Wood nicht nachgelesen worden. Lacelle26 verwendet ⟨2,4,4⟩ = 26 als Baustein und nennt keine Verbesserung (Stand 12.07.2026).

**Folgerung für Spur B (vermutet):** Ein Verfahren mit 25 ist in keinem öffentlichen Katalog. Die großen Flip-Graph-Suchen laufen meist über 𝔽₂ oder ZT. Wenn es ein Verfahren mit 25 gibt, dann vermutlich nur mit Koeffizienten außerhalb von ℤ₍₂₎, etwa mit ½ wie bei ⟨2,4,5⟩ : 32. Siehe auch den nächsten Abschnitt: Eine untere Schranke 26 über 𝔽₂ würde genau das erzwingen.

#### Bekannte untere Schranken für ⟨2,4,4⟩

| Schranke | Körper | Quelle | Bemerkung |
|---|---|---|---|
| 23 | algebraisch abgeschlossen, damit jeder Körper | Bläser 1999 (Bl99): R(⟨k,l,m⟩) ≥ kl + lm + k − l + m − 3, hier R(⟨2,n,m⟩) ≥ nm + n + m − 1 = 23 | so zitiert in Yang26 S. 1 und Wang26 |
| 23 | 𝔽₂ | Ja'Ja' und Takche 1985 | in Wangs Repo `summary/prev_results_matrix/prev_results.csv` als bisher beste 𝔽₂-Schranke für `n244` eingetragen |
| **25** | **jeder Körper** | Yang26 v3, Satz 2 mit n = m = 4: 6·4 + 1 = 25 | beste gefundene untere Schranke, auch über 𝔽₂ (Rang über 𝔽₂ ist mindestens der Rang über dem algebraischen Abschluss). In Stufe 1 formalisiert, Status dort behauptet |

Hopcroft und Kerr haben passende untere Schranken nur für ⟨2,2,n⟩ und ⟨2,3,3⟩ (über 𝔽₂) bewiesen, laut Lacelle26 Abschn. 7.5 und Wang26. Für ⟨2,4,4⟩ gibt es von ihnen keine.

Alekseev und Smirnov haben die exakten Ränge kleiner Formate mit einem Faktor 2×2 bestimmt (u. a. *On the exact and approximate bilinear complexities of multiplication of 4×2 and 2×2 matrices*, also ⟨4,2,2⟩; Alekseev zu m×2 mal 2×2 und über endlichen Körpern). Nur über Suchtreffer (mathnet.ru, MaRDI) gesehen, nicht gelesen. Diese Arbeiten betreffen ⟨n,2,2⟩, nicht ⟨4,2,4⟩.

#### Zertifikatsmethoden über 𝔽₂: Stand der Technik im Herbst 2026

Über 𝔽₂ hat sich 2026 eine Werkzeugkette gebildet, die kleine Formate exakt löst:

1. **Wang, arXiv:2603.07280** (v11): Unterraum-Tabelle über Orbits der ersten Faktoren, dynamische Programmierung mit vier Techniken, Zertifikat mit unabhängigem Prüfer. Code MIT-lizenziert.
2. **D'Ambrosio, Zenodo 2026** (doi:10.5281/zenodo.21895176, nur zitiert gesehen): Kapazitäten und Profile der ersten Faktoren. Ergebnis: **R_{𝔽₂}(⟨2,3,4⟩) = 20**.
3. **Wang, arXiv:2609.06725** (v2, 11.09.2026): R_{𝔽₂}(⟨3,3,3⟩) ≥ 21, außerdem **R_{𝔽₃}(⟨2,3,3⟩) = 15**. Code: github.com/wcgbg/matrix-multiplication-n333r21f2 (MIT).
4. **Rudich und Rousseau, arXiv:2610.01639**: R_{𝔽₂}(⟨3,3,3⟩) ≥ 22, **in Lean**, mit formalisierter Übertragung auf Verfahren mit ganzzahligen Koeffizienten.
5. **Tomar, arXiv:2610.11823** (v3, 19.10.2026): **R_{𝔽₂}(⟨3,3,3⟩) = 23**, Zertifikate in Lean 4 geprüft, eine Fassung nur mit den drei Standard-Axiomen. Das ist der 3×3-Fall aus dem Nachbarfeld, den `lit/QUELLEN.md` noch als „Preprint mit der Behauptung“ führt.

**Bezug zu ⟨2,4,4⟩:**

- Für ⟨2,4,4⟩ ist der Raum der ersten Faktoren 𝔽₂^{2×4}. Wangs Tabelle 9 zählt dafür nur **86 Orbits** von Unterräumen über 𝔽₂ (91 über 𝔽₃). Zum Vergleich: ⟨3,3,3⟩ hat 496, und dort hat die Kette den Rang über 𝔽₂ exakt bestimmt. Das Format liegt also rechnerisch weit im machbaren Bereich der Methode.
- Wang hat ⟨2,4,4⟩ in seinem Repo **nicht** zertifiziert: In `certs/matrix/` fehlt `n244`, es gibt nur den Eintrag der alten Schranke 23. Warum, steht nirgends. Vermutet: Die reine Tabelle kam nicht über bekannte Schranken hinaus, oder das Format wurde nicht versucht.
- **Was eine 𝔽₂-Schranke leisten würde:** R_{𝔽₂}(⟨2,4,4⟩) ≥ 26 schlösse jedes Verfahren mit 25 aus, dessen Koeffizienten in ℤ (oder allgemeiner in ℤ₍₂₎, also mit ungeraden Nennern) liegen, und zwar durch Reduktion modulo 2 (Hopcroft-Kerr-Argument, bei Rudich und Rousseau in Lean). **Für das Ziel des Protokolls (Rang über beliebigen Körpern) reicht das nicht**, weil ein Verfahren mit 25 über ℚ mit ½ in den Koeffizienten möglich bliebe. Für Spur A wäre es ein Teilergebnis, für Spur B ein Wegweiser (nur Charakteristik ≠ 2 oder Nenner 2 durchsuchen).
- Ebenso denkbar (vermutet): dieselbe Kette über 𝔽₃, wie bei R_{𝔽₃}(⟨2,3,3⟩) = 15.

#### Frühere Versuche, 25 zu erreichen oder 26 zu beweisen

Gezielt gesucht (Websuche, alphaXiv) nach Arbeiten, die ⟨4,2,4⟩, ⟨2,4,4⟩ oder ⟨4,4,2⟩ mit 25 oder eine Schranke 26 behandeln. **Nichts gefunden** außer den oben genannten Katalogeinträgen mit 26 und Yangs Schranke 25. Yang26 nennt 4×2×4 ausdrücklich „one away from the current upper bounds“. Keine Notiz, kein Preprint und kein Repo zu einer Lean-Fassung von Yang v3 außerhalb dieses Projekts gefunden.

### Einschränkungen

- Kein vollständiger Durchgang der arXiv-Listen von cs.CC, sondern Suche über alphaXiv und Websuche.
- Die FMM-Lille-Startseite wurde nur bis zu den Zeilen 2×21×31 ausgelesen. Die Zeilen 4×2×4 und 4×4×2 wurden dort nicht gesehen, die Detailseite 2×4×4 schon.
- D'Ambrosio (Zenodo), Alekseev/Smirnov, HK71 und Ja'Ja'/Takche wurden nicht im Original gelesen.
- Ob Kauers/Moosbauer, Kauers/Wood oder AlphaEvolve ⟨2,4,4⟩ über ℚ mit gebrochenen Koeffizienten gezielt durchsucht haben, ist offen.
- Die Seite caisc2026.github.io/verifiable-problems wurde in diesem Durchgang nicht erneut versucht.
