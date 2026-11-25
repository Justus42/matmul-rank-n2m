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

---

## 25.11.2026 (Stufe 2, Runde 2, Auftrag S2-07)

Rolle: Literaturwächter. Durchgang nach Protokoll Abschnitt 7, dazu die gezielte Frage aus Runde 1 nach dem Grenzrang (border rank) von ⟨2,4,4⟩ = ⟨4,2,4⟩. Werkzeuge: alphaXiv (Suche und Volltexte), Websuche, `git ls-remote`, Abruf von Webseiten über einen Abruf-Agenten. Alle Befunde haben den Status **behauptet** (Suche eines Agenten, keine Prüfung nach Abschnitt 5). Bei jeder Aussage steht, ob ich die Stelle selbst gelesen habe („gelesen“) oder sie nur aus einer Zusammenfassung oder einem Zitat kenne („zitiert“).

### Ergebnis für die Abbruchregel 3

**Keines der Ziele ist anderswo gelöst gefunden worden.** Kein Verfahren mit 25 Produkten und keine Schranke 26 für ⟨4,2,4⟩, keine Lösung von 3×2×7 oder 4×2×5. Abbruchregel 3 greift nicht.

### Pflichtpunkte nach Abschnitt 7

- **Repo fallnlove/mm325_proof:** `git ls-remote` zeigt weiter genau `759cf4a8524d4212e7832046204c90b9361ba2bb` auf `main`. Keine neuen Commits.
- **arXiv:2609.14393 (Yang)** und **arXiv:2609.22054 (Tsyganov u. a.):** keine neue Fassung bei alphaXiv gefunden. Die arXiv-Versionsliste habe ich in diesem Durchgang nicht ausgelesen (arxiv.org per curl gesperrt). Der Stand v3 bzw. v1 aus dem Eintrag von heute früh gilt also nur als nicht widerlegt.
- **Wangs Repo** github.com/wcgbg/tensor-rank-lower-bound: `HEAD` weiter `9db3d215267932ba3e8801a10655a2d538ed13d8`.
- **Neue Arbeiten seit dem letzten Eintrag (alphaXiv, ab 20.11.2026):** nichts zu unseren Formaten. Gesichtet ohne Bezug: 2611.31155 (Rang-23-Verfahren 3×3, schon bekannt), „The Matrix Multiplication Exponent Is Nine Fourths“ (schon bekannt), „VP and VNP Are Different“ (24.11.2026, Schaltkreiskomplexität), 2611.30721 (Partitionsrang über endlichen Körpern).

### Gezielte Frage: Grenzrang von ⟨2,4,4⟩

**Antwort: Der Grenzrang ist nicht bestimmt. Die Literatur gibt 22 ≤ R̲(⟨2,4,4⟩) ≤ 24.** Damit liegt der Grenzrang sicher **unter** dem Rang, denn der Rang ist mindestens 25 (Yang v3, im Projekt B-007). Für ⟨4,2,4⟩ gilt also R̲ ≤ 24 < 25 ≤ R ≤ 26, eine Lücke von mindestens 1 und höchstens 4.

| Aussage | Quelle und Stelle | gelesen? |
|---|---|---|
| R̲(⟨2,4,4⟩) ≤ 24 | Smirnov, *The bilinear complexity and practical algorithms for matrix multiplication*, Comput. Math. Math. Phys. 53(12) (2013) 1781–1795 | **zitiert**: Original nicht gelesen (nicht erreichbar). Zitiert in Conner, Harper, Landsberg, arXiv:1911.07981, S. 3, Absatz nach Satz 1.4: „Smirnov [28] … also proved R̲(M⟨244⟩) ≤ 24, and R̲(M⟨255⟩) ≤ 38“ (**gelesen**). Ebenso Dumitriu u. a., arXiv:2610.13905, Tabelle 1, Zeile ⟨2,4,4⟩, Spalte „vs. [56–58]“: 24 (**gelesen**), und README von github.com/nliskij/border-rank, Tabelle „Stored bounds“: „(2,4,4) \| 26 \| 1 \| 25 \| 24 \| 1“ (über Abruf-Agenten gelesen) |
| R̲(⟨2,4,4⟩) ≤ 25 durch eigenes APA-Verfahren (Grad 6, Restglieder nur in ε³ und ε⁶), gewonnen aus einem exakten 26er mit einem nilpotenten Glied | Dumitriu, Holtz, Hsu, Liskij, Moran, Schneider, Schwartz, Yuan, *Fast and Stable Arbitrary Precision Approximate Matrix Multiplication*, arXiv:2610.13905 v1 (09.10.2026), Tabelle 1 und Abschn. 2.1–2.2 (Satz 2.1, 2.2, Algorithmus 1) | **gelesen**. Schlechter als Smirnov |
| **R̲(⟨2,4,4⟩) ≥ 22** | Conner, Harper, Landsberg, *New lower bounds for matrix multiplication and det₃*, arXiv:1911.07981 v1, Satz 1.4 (2), Tabelle, Zeile n = 4: „22 = 4² + 6“; Beweis durch erschöpfende Rechnersuche mit Grenz-Apolarität (Abschn. 7.3, letzter Satz) | **gelesen** (Satzaussage; die Rechnung selbst nicht nachvollzogen). Später als Forum Math. Pi 11 (2023) e17 erschienen (Angabe aus arXiv:2609.12121, Lit. [9]) |
| vorher nur R̲(⟨2,n,n⟩) ≥ n² + 1, hier 17 | Lickteig 1984, so in arXiv:1911.07981, S. 3 | zitiert |
| Koszul-Flattenings geben für ⟨2,4,4⟩ nur ≥ 14 | Landsberg, Ottaviani, arXiv:1112.6007, Satz 1.1: R̲(M⟨m,n,l⟩) ≥ nl(n+m−1)/m für n ≤ m; beste Einsetzung m = n = 4, l = 2 ergibt 14 (eigene Rechnung) | **gelesen** |

**Lücke zwischen Rang und Grenzrang bei ⟨2,n,n⟩ und ⟨2,2,n⟩ (soweit gefunden):**

| Format | Rang | Grenzrang | Quellen |
|---|---|---|---|
| ⟨2,2,2⟩ | 7 | 7 | Landsberg 2006; arXiv:1911.07981 (**gelesen**) |
| ⟨2,2,3⟩ | 11 | 10 | Rang: Hopcroft–Kerr 1971 (zitiert in arXiv:2610.13905 S. 2, **gelesen**); Grenzrang: Bini u. a. 1979/80 oben, arXiv:1911.07981 Satz 1.3 unten (**gelesen**) |
| ⟨2,2,n⟩ | 7n/2 aufgerundet (Shitov, laut Yang v3, zitiert) | 3n ≤ R̲ ≤ 3n + 1 für n ≤ 7 | arXiv:1911.07981 nach Satz 1.3 (**gelesen**), obere Schranke Smirnov |
| ⟨2,3,3⟩ | 15 | 14 | Rang: Yang v3 bzw. Hopcroft–Kerr; Grenzrang: arXiv:1911.07981 Satz 1.4 (1) (**gelesen**) |
| ⟨2,4,4⟩ | 25 oder 26 | 22 bis 24 | siehe oben |
| ⟨2,5,5⟩ | ≥ 35 (Yang), ≤ 40 (HK-Formel) | 32 ≤ R̲ ≤ 38 | arXiv:1911.07981 Satz 1.4 (2) und S. 3 (**gelesen**) |

Ab ⟨2,2,3⟩ ist in jedem Fall mit bekanntem Rang der Grenzrang echt kleiner. Eine allgemeine Aussage über die Größe der Lücke bei ⟨n,2,m⟩ habe ich nicht gefunden.

Zu unseren anderen Zielen nebenbei (alle aus arXiv:2610.13905 Tabelle 1, **gelesen**): R̲(⟨2,3,7⟩) ≤ 33 (Smirnov), R̲(⟨2,4,5⟩) ≤ 31 (neu in dieser Arbeit, Anhang B), R̲(⟨2,3,6⟩) ≤ 28 (Smirnov).

**Folgerung für Spur B (vermutet):** Die numerische Probe in `versuche/s2-spurB-r1.md` Abschnitt 3 (Näherungen mit 25 Gliedern und wachsenden Koeffizienten) passt zur Literatur, sagt aber nichts Neues: Wegen R̲ ≤ 24 gibt es sogar Näherungsfolgen mit 24 Gliedern. Gleitkommasuchen über ℝ mit 25 Gliedern werden deshalb fast sicher in solche Grenzfolgen laufen. Ein Hinweis auf ein exaktes 25er-Verfahren lässt sich aus kleinen Residuen nur gewinnen, wenn die Koeffizienten beschränkt bleiben. Für exakte Suchen empfiehlt sich, Koeffizienten zu beschränken oder über endlichen Körpern zu suchen.

**Folgerung für Spur A (vermutet):** Jede Schranke R(⟨4,2,4⟩) ≥ 26 muss eine Methode benutzen, die Rang und Grenzrang unterscheidet (Substitution wie bei Yang, Zertifikate über endlichen Körpern). Methoden, die nur den Grenzrang beschränken (Flattenings, Grenz-Apolarität), kommen höchstens bis 24.

### Veröffentlichte SAT- oder Flip-Graph-Ergebnisse mit 25 Produkten für ⟨2,4,4⟩

**Kein exaktes Verfahren mit 25 gefunden.** Die einzige Arbeit, die gezielt Flip-Graphen für ⟨2,4,4⟩ mit Ziel 25 einsetzt, ist arXiv:2610.13905 (Abschn. 2.2: Perminovs Flip-Graph-Programm über 𝔽₂ oder 𝔽₃, Hensel-Anhebung, eine Woche auf 23 Threads). Sie sucht exakte 26er mit einem nilpotenten Glied und erhält daraus **nur ein Näherungsverfahren** mit 25, kein exaktes (**gelesen**). Keine SAT-Arbeit zu ⟨2,4,4⟩ mit 25 gefunden. Stand der Kataloge wie im Eintrag „vor Beginn von Stufe 2“.

### Einschränkungen

- Smirnov 2013 nicht im Original gelesen. Die Zahl 24 stützt sich auf drei unabhängige Zitate (CHL 2019, Dumitriu u. a. 2026, README nliskij). Der Abruf von mathnet.ru unter `zvmmf10181` lieferte eine andere Smirnov-Arbeit (⟨2,7,2⟩ mit 22, Zh. Vychisl. Mat. Mat. Fiz. 55:4, 2015). Ob Smirnovs 24er-Verfahren explizit veröffentlicht ist, bleibt offen.
- Die Rechnung hinter R̲ ≥ 22 (arXiv:1911.07981, Code unter math.tamu.edu/~jml/bapolaritycode.html) nicht nachvollzogen. Neuere Grenzrang-Schranken für ⟨2,4,4⟩ (nach 2019) nicht gefunden; arXiv:2609.12121 (Mańdziuk, Grenz-Apolarität jenseits der schwachen Form) behandelt ⟨2,4,4⟩ nicht (**gelesen**, Einleitung und Abschn. 6).
- Der Dateibaum von github.com/nliskij/border-rank war für den Abruf gesperrt (robots), nur das README wurde gelesen.

---

## 25.11.2026 (Stufe 2, Runde 3, Auftrag S2-13)

Rolle: Literaturwächter. Durchgang nach Protokoll Abschnitt 7, dazu die Nachprüfung des Hinweises von Justus vom 25.11.2026 zu den Veröffentlichungen im Repo openai/math. Werkzeuge: `git clone` und `git ls-remote` öffentlicher Repos, `pdftotext`, LaTeX-Quellen aus openai/math, alphaXiv-Suche. Alle Befunde haben den Status **behauptet** (Suche eines Agenten, keine Prüfung nach Abschnitt 5). Bei jeder Aussage steht, ob ich die Stelle selbst gelesen („gelesen“) oder nur per Textsuche durchsucht habe („durchsucht“). ω = 9/4 selbst wurde nicht nachgeprüft, das Projekt baut nicht darauf auf.

### Ergebnis für die Abbruchregel 3

**Keines der Ziele ist anderswo gelöst gefunden worden.** Kein Verfahren mit 25 Produkten und keine Schranke 26 für ⟨4,2,4⟩, keine Lösung von 3×2×7 oder 4×2×5, auch nicht in openai/math. Abbruchregel 3 greift nicht.

### Pflichtpunkte nach Abschnitt 7

- **Repo fallnlove/mm325_proof:** `git ls-remote` zeigt weiter `759cf4a8524d4212e7832046204c90b9361ba2bb`. Keine neuen Commits.
- **arXiv:2609.14393 (Yang)** und **arXiv:2609.22054 (Tsyganov u. a.):** in der alphaXiv-Suche ab 24.11.2026 keine neue Fassung aufgetaucht. Versionslisten nicht ausgelesen (arxiv.org per curl gesperrt). Stand v3 bzw. v1 gilt weiter nur als nicht widerlegt.
- **Wangs Repo** github.com/wcgbg/tensor-rank-lower-bound: `HEAD` weiter `9db3d215267932ba3e8801a10655a2d538ed13d8`.
- **Neue Arbeiten seit dem letzten Eintrag (alphaXiv ab 24.11.2026, Stichworte tensor rank, matrix multiplication, lower bound, border rank, bilinear complexity):** nichts zu unseren Formaten. Gesichtet ohne Bezug: „The Matrix Multiplication Exponent Is Nine Fourths“ (schon bekannt, siehe unten), „VP and VNP Are Different“ (schon bekannt), 2611.31963 (nichtkommutativer Rang), 2611.31807 (rangerhaltende lineare Abbildungen).

### Neue beobachtete Quelle: Repo openai/math

Auf Entscheidung von Justus vom 25.11.2026 wird das Repo **github.com/openai/math** ab jetzt bei jedem Durchgang mitgeprüft: neue Commits, neue Familien in `CONTENTS.md`, neue Verzeichnisse in `preprints/`.

- Geprüfter Stand: Commit `3344da59991ed94f9ba711217b29c1d760badfa6` vom 24.11.2026, 16:18 (UTC−8), „Merge pull request #6 from openai/codex/update-11-24“. Das ist zugleich `HEAD` laut `git ls-remote` am 25.11.2026 um 11:50 UTC, also derselbe Stand, den Justus angibt.
- Lizenz: Apache-2.0 (Datei `LICENSE` gelesen), eingetragen in `lit/LIZENZEN.md`.
- **Hinweis an den Orchestrator:** Die verbindliche Liste der beobachteten Quellen steht nur in `PROTOKOLL.md` Abschnitt 7. `lit/WACHE.md` hat keine eigene Quellenliste. Die Aufnahme ist deshalb nur hier vermerkt. `PROTOKOLL.md` habe ich nicht geändert.

### Nachprüfung des Hinweises von Justus (Status dort: behauptet)

Grundlage: vollständiger Klon (ohne Blobs) von openai/math am Commit `3344da5`, daraus `CONTENTS.md`, die LaTeX-Quellen und die PDFs der unten genannten Arbeiten.

#### Punkt 1: Umfang des Repos und Treffer

| Angabe von Justus | Befund | wie geprüft |
|---|---|---|
| rund 760 Verzeichnisse in `preprints/` | **stimmt**: 761 | `git ls-tree` gezählt |
| 375 Familien in `CONTENTS.md` | **stimmt**: 375 nummerierte Familien, Nummern 001 bis 380, es fehlen 045, 061, 070, 123, 163 | gezählt |
| Bezug zu Matrixmultiplikation, Tensorrang, Grenzrang, bilinear haben nur Familie 107 und 379 | **stimmt im Kern, mit einer Ergänzung**: Ein Stichworttreffer „matrix multiplication“ ist auch **Familie 135** („Homogeneous depth-five lower bounds for iterated matrix multiplication“, Schaltkreise der Tiefe fünf für iterierte Produkte, kein Tensorrang). Weitere Treffer auf „bilinear“ und „tensor“ (z. B. Familie 130 „Finite tensor savings and exact Fourier circuits“, Familie 108 Grenz-Determinantenkomplexität) betreffen keine Matrixmultiplikation. Ohne Bezug zu unseren Zielen | Stichwortsuche in `CONTENTS.md` und Verzeichnisnamen (durchsucht) |
| Familie 107: ω ≤ 9/4 über ℂ, ω < 2,258 in Charakteristik 0, rechteckige Exponenten, ω < 2,3711 über jedem Körper | **stimmt**: Kurzfassung nennt ω ≤ 9/4 über ℂ, α > 0,465 in Charakteristik 0, ω < 2,258 außer in endlich vielen positiven Charakteristiken, ω < 2,371054886006746 über jedem Körper | `CONTENTS.md` Familie 107 (gelesen) |
| „die vier Arbeiten der Familie 107“ | **weicht ab**: In `CONTENTS.md` stehen unter Familie 107 **drei** Arbeiten: „An Upper Bound of 9/4 for the Matrix Multiplication Exponent“ (02.10.2026), „Complex Matrix Multiplication Below 2.258 and Rectangular Bounds“ (24.09.2026, als „secondary writeup“), „Staggered extraction for exact matrix multiplication over every field“ (24.09.2026). Vermutlich hat Justus die 9/4-Arbeit vom 24.11. mitgezählt | gelesen |
| Familie 379: untere Schranke 9/4 und Begleitarbeit „Euclidean geometry in the asymptotic spectrum of tensors“ | **stimmt, ist aber unvollständig**: Familie 379 („Euclidean tensor geometry and its applications to complexity and combinatorics“) umfasst **sieben** Arbeiten. Die übrigen fünf (Valiant-Hierarchie, Hamiltonkreis und Permanente, Fourier-Transformation, Ganzzahlmultiplikation auf Bändern, Sunflowers) haben laut Titel und Kurzfassung keinen Bezug zum Rang fester Formate | gelesen (Titel und Kurzfassungen), Volltexte der fünf nicht durchsucht |
| keine Arbeit bestimmt den exakten Rang eines festen kleinen Formats, zu ⟨n,2,m⟩ steht nichts | **stimmt für die durchsuchten Arbeiten**. Gesucht in den LaTeX-Quellen der drei Arbeiten von Familie 107, der 9/4-Arbeit, der Begleitarbeit und von „Finite tensor savings“ nach ⟨a,b,c⟩ mit festen Zahlen, „a×b×c“, „border rank of“, „tensor rank of“, Hopcroft, Smirnov, Alekseev, Laderman, Bläser. Einzige Treffer mit festen Formaten: Strassens 7 für 2×2 (Einleitungen), triviale Formate wie ⟨1,m,1⟩, ⟨5,1,5⟩ und ein Hilfstensor mit Grenzrang 3 (Coppersmith-Winograd), alles als Baustein der Asymptotik | durchsucht |
| keine expliziten Verfahren für kleine Formate | **stimmt** für dieselben Arbeiten | durchsucht |

#### Punkt 2: Was die 9/4-Arbeit für feste Formate sagt

Arbeit: „The matrix multiplication exponent is nine fourths“, OpenAI, Ausgabe vom 24.11.2026, `preprints/The-matrix-multiplication-exponent-is-nine-fourths-November-24-2026/paper.pdf`. Gelesen: Abschnitt 1.1 und 1.5 sowie Abschnitt 2.4 (Beweise beider Korollare). Abschnitt 1.2 bis 1.4 nur überflogen.

- **Korollar 1.2 (gelesen, stimmt):** Für jedes n ≥ 2 und jeden Körper F ist der geometrische Grenzrang von T_n mindestens n^(9/4), der asymptotische Rang über F gleich n^(9/4), und jeder formale arithmetische Schaltkreis braucht mindestens ⌈n^(9/4)/2⌉ nichtskalare Multiplikations- oder Divisionsgatter. **Kleine Ungenauigkeit bei Justus:** Die Aussage „ein exaktes bilineares Verfahren braucht mindestens ⌈n^(9/4)⌉ Produkte“ steht nicht im Korollar selbst, sondern im Satz direkt danach („In particular …“). Inhaltlich stimmt sie.
- **Korollar 1.3 (gelesen, stimmt):** Für alle positiven ganzen a, b, c sind geometrischer Grenzrang und asymptotischer Rang über F von T_{a,b,c} mindestens max{ab, bc, ca, (abc)^(3/4)}. Dazu 1/2 ≤ α_F ≤ 2/3. Beweis in Abschnitt 2.4: ab, bc, ca sind die Ränge der drei Abflachungen; (abc)^(3/4) kommt aus T_{a,b,c} ⊗ T_{b,c,a} ⊗ T_{c,a,b} ≅ T_{abc} und Korollar 1.2.
- **Rechnung von Justus für unsere Formate (nachgerechnet, stimmt):**

| Format | ab, bc, ca | (abc)^(3/4) | Maximum | bekannte untere Schranke für den Rang |
|---|---|---|---|---|
| ⟨4,2,4⟩ | 8, 8, 16 | 32^(3/4) ≈ 13,45 | 16 | 25 (Yang v3, B-007) |
| ⟨3,2,7⟩ | 6, 14, 21 | 42^(3/4) ≈ 16,53 | 21 | 34 (Yang v3, ⌈(24·7+2)/5⌉) |
| ⟨4,2,5⟩ | 8, 10, 20 | 40^(3/4) ≈ 15,91 | 20 | 31 (Yang v3, (4+2)·5+4−3) |

  In allen drei Fällen ist das Maximum die Abflachungsschranke ca = n·m. Der Vergleich mit Bläser (23), Conner/Harper/Landsberg (Grenzrang ≥ 22) und Yang (25) bei ⟨4,2,4⟩ stimmt mit den Einträgen oben überein.
- Weitere Angaben zu festen Größen in der Arbeit (gelesen, ohne Bezug zu uns): Abschnitt 1.5 nennt Bläsers Rangschranke 5/2·n² − 3n für T_n und Landsberg/Michałek; Abschnitt 2.4 sagt, Korollar 1.2 widerspreche bei n = 2^8 einer Grenzrang-Abschätzung aus Suns Preprint (Fassung 1). Nur quadratische Formate.

#### Punkt 3: Folgerung für Spur A (vermutet)

**Stimmt.** Die Methode der Arbeit beschränkt nur Grenzrang und asymptotischen Rang. Für ⟨2,4,4⟩ gilt asymptotischer Rang ≤ Grenzrang ≤ 24 (Smirnov, zitiert, siehe Eintrag S2-07). Keine Schranke dieser Art kann daher über 24 hinaus, also weder 25 noch 26 für den Rang liefern. Das deckt sich mit der Folgerung aus S2-07. Ein Leseauftrag für Spur A lohnt nicht.

#### Punkt 4: Folgerung für Spur B

**Stimmt.** Keine expliziten Verfahren für kleine Formate in den durchsuchten Arbeiten.

#### Punkt 5: Prüfstand der Quelle

**Stimmt.** Die Arbeiten sind Preprints im Repo, ohne Peer-Review. Das README der 9/4-Arbeit sagt wörtlich, die Lean-Entwicklung beweise den Exponenten 9/4 „for division-free circuits computing formal polynomial identities over every field“ (gelesen). Kleine Auffälligkeit: Das README verweist für den Formalisierungsumfang auf `lean/docs/107.md`, obwohl die Arbeit zu Familie 379 gehört; es gibt auch `lean/docs/379.md`. Für uns ohne Folgen.

### Ergänzung zum bisherigen Eintrag „Asymptotik, Nicht-Ziel“

Die Einordnung bleibt richtig. Die 9/4-Arbeit liefert für feste Formate nur Korollar 1.3, und das ist bei allen drei Zielen schwächer als die längst bekannten Schranken. Der Volltext ist jetzt in den maßgeblichen Stellen gelesen (Abschnitt 1.1, 1.5, 2.4).

### Abweichungen von den Angaben von Justus, zusammengefasst

1. Familie 107 hat drei Arbeiten, nicht vier.
2. Familie 379 hat sieben Arbeiten. Für uns zählen nur die zwei, die Justus nennt.
3. Familie 135 ist ein weiterer Stichworttreffer „matrix multiplication“ (iterierte Produkte, Tiefe-5-Schaltkreise), ohne Bezug zu Tensorrang.
4. Die Schranke ⌈n^(9/4)⌉ für bilineare Verfahren steht im Text nach Korollar 1.2, nicht im Korollar.

Alles andere, insbesondere die Tabelle und die Folgerungen für Spur A und B, stimmt.

### Einschränkungen

- Familie 107 und die Begleitarbeit nur per Textsuche in den LaTeX-Quellen durchsucht, nicht gelesen. Die fünf übrigen Arbeiten der Familie 379 nur nach Titel und Kurzfassung.
- Kein vollständiger Durchgang der arXiv-Listen von cs.CC, sondern alphaXiv-Suche.

---

## 25.11.2026, 21:38 bis 21:55 UTC (Stufe 2, Runde 12, Auftrag S2-58)

Auftrag: Punkt 5 der Nachricht von Justus vom 25.11.2026, 21:37 UTC. Gezielte Suche, ob der Rang von ⟨4,2,4⟩ (gleichwertig ⟨2,4,4⟩, ⟨4,4,2⟩) schon als 26 bewiesen oder eine untere Schranke 26 veröffentlicht ist. Dazu die Pflichtpunkte nach Abschnitt 7. Keine Fremdmodell-Anfrage.

### Ergebnis

**Nicht gefunden.** Keine Quelle beweist R(⟨4,2,4⟩) ≥ 26 oder R(⟨4,2,4⟩) = 26, und keine Quelle widerspricht der Schranke 26 (kein Verfahren mit 25 Produkten). Bester veröffentlichter Stand außerhalb dieses Repos unverändert:

| | Wert | Quelle |
|---|---|---|
| untere Schranke | 25, über beliebigen Körpern | Yang26 (arXiv:2609.14393 v3), Satz 2 mit n = m = 4: (4+2)·4 + 4 − 3 = 25 |
| obere Schranke | 26 | HK71; FMM-Lille führt ⟨2×4×4:26⟩ mit Quelle Hopcroft und Kerr 1971 |

Die einzigen Treffer mit „26“ zu diesem Format sind **Eigentreffer**: das öffentliche Repo Justus42/matmul-rank-n2m und dessen Pull Request #65 („S2-36: Endsatz R(<4,2,4>) ≥ 26 …“), beide von der Websuche indexiert. Sie zählen nicht als Fremdquelle. Status dieses Eintrags: behauptet (Suche eines Agenten, keine Vollständigkeit garantiert).

### Suchbegriffe

- alphaXiv (Sortierung nach Aktualität, ohne Datumsgrenze): „tensor rank“, „matrix multiplication“, „<2,4,4>“, „4x2x4“, „lower bound“; zweite Suche „(n,2,m) matrix multiplication“ ab 20.11.2026; dritte Suche „border rank“, „<2,4,4>“ (Sortierung nach Bedeutung)
- Websuche: `tensor rank "4x2x4" OR "<2,4,4>" matrix multiplication rank 26 lower bound`; `"2x4x4" OR "4x4x2" matrix multiplication rank 26 Hopcroft Kerr optimal bilinear`; `Lean formal proof tensor rank matrix multiplication 4×2×4 26 lower bound 2026`; `"matrix multiplication" "is 26" rank "⟨2,4,4⟩" OR "(4,2,4)" OR "4 × 2 × 4" tensor rank exact`; `fmm.univ-lille.fr 2x4x4 26 Sedoglavic catalogue`
- GitHub-Suche (Repos und Code): „matrix multiplication tensor rank lower bound“, `tensorRank "4 2 4" language:lean`, `"26 ≤" tensorRank`

### Gesichtete Quellen

- **Yang26**, [arXiv:2609.14393](https://arxiv.org/abs/2609.14393): Abstract-Seite zeigt weiter „This version: v3 2026-10-12“. Keine neue Fassung. Abstract nennt (n+2)m + n − 3 für m ≥ n ≥ 4, also 25 bei ⟨4,2,4⟩.
- **TPSR26**, [arXiv:2609.22054](https://arxiv.org/abs/2609.22054): nur ⟨3,2,m⟩, in alphaXiv weiter nur v1.
- **Wang26**, [arXiv:2603.07280](https://arxiv.org/html/2603.07280v6) (HTML v6 gelesen): Tabelle enthält 2,2,2 bis 3,4,4, aber **kein ⟨2,4,4⟩**. Hauptkörper 𝔽₂.
- **FMM-Lille (Sedoglavic)**, [fmm.univ-lille.fr](https://fmm.univ-lille.fr/) und [2x4x4.html](https://fmm.univ-lille.fr/2x4x4.html): Zeile „<2×4×4:26> 26 32 Hopcroft and Kerr 1971“. Keine Spalte und keine Aussage zu unteren Schranken oder Optimalität. Kein Datum, Version `9aa936f7ba6c86ddcbd7b192420bfbe097198481`, Hinweis „underlying data are currently reconstructed“. Kein Koeffizientenring genannt.
- **Lacelle26**, [arXiv:2606.13408 v3](https://arxiv.org/html/2606.13408v3) (Katalog, 14.08.2026): keine Aussage zu ⟨2,4,4⟩ gefunden. Nur die ersten rund 40 000 Zeichen wörtlich gelesen, Rest nur als Zusammenfassung.
- **Bläser, Landsberg, Conner/Harper/Landsberg, Alekseyev, Hopcroft-Kerr:** keine neue Arbeit dieser Autoren zu ⟨2,4,4⟩ in den Suchen. Neue Treffer zu Grenzrang (z. B. [arXiv:2609.12121](https://www.alphaxiv.org/abs/2609.12121), Grenzrang jenseits der schwachen Border-Apolarity) nennen in der Kurzfassung kein ⟨2,4,4⟩. Grenzrang ist ohnehin höchstens 24 (siehe Eintrag S2-07) und kann 26 nicht liefern.
- **Repo [Oxelra-AI/Qiushi-Engine-Matmul-Research](https://github.com/Oxelra-AI/Qiushi-Engine-Matmul-Research)** (Treffer der GitHub-Suche, Commit `4649c03201e1974ee2f97b7de53c5f96e17cf3a8` vom 17.09.2026): nur 3×3 über 𝔽₂ (≥ 21). Kein Bezug zu ⟨2,4,4⟩.
- **Neue Arbeiten seit dem letzten Eintrag (alphaXiv ab 20.11.2026):** nur schon bekannte Treffer (9/4-Arbeit, VP ≠ VNP, 2611.31155, 2611.31963) sowie 2611.30757 (Semidefinite Optimierung) und 2611.30721 (Partition-Rang). Nichts zu ⟨n,2,m⟩.

### Pflichtpunkte nach Abschnitt 7

`git ls-remote` am 25.11.2026 um 21:38 UTC:

- **fallnlove/mm325_proof:** `759cf4a8524d4212e7832046204c90b9361ba2bb`, unverändert.
- **openai/math:** `3344da59991ed94f9ba711217b29c1d760badfa6`, unverändert seit dem Eintrag S2-13. Damit keine neuen Familien in `CONTENTS.md` und keine neuen Verzeichnisse in `preprints/`; die Durchsicht aus S2-13 (kein ⟨n,2,m⟩, keine feste Rangschranke) gilt weiter.
- **wcgbg/tensor-rank-lower-bound:** `9db3d215267932ba3e8801a10655a2d538ed13d8`, unverändert.
- **arXiv:2609.14393** v3, **arXiv:2609.22054** v1, siehe oben.

### Einschränkungen

- arxiv.org und fmm.univ-lille.fr sind aus der Umgebung per curl gesperrt. Beide Seiten wurden über einen Abruf-Agenten gelesen; die Angaben oben stammen aus dessen Bericht mit wörtlichen Zitaten.
- Die Seite [caisc2026.github.io/verifiable-problems](https://caisc2026.github.io/verifiable-problems/?problem=matrix-multiplication-tensor-rank) zeigt beim Abruf nur „Loading…“ (Inhalt per JavaScript). Wie schon in Runde 2 nicht gelesen. Ob dort ⟨2,4,4⟩ als offen oder gelöst geführt wird, ist unbekannt.
- FMM-Lille-Startseite nur bis etwa ⟨2×21×31⟩ gelesen, die Zeile ⟨2×4×4⟩ war enthalten.
- Shitov26 (ResearchGate) nicht erneut gesucht; betrifft nur ⟨2,2,m⟩.
- Kein vollständiger Durchgang der arXiv-Listen von cs.CC, sondern alphaXiv- und Websuche.
