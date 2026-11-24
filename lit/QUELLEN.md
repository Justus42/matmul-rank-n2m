# Quellen

Jede Quelle mit: Fundstelle, was wir daraus verwenden, ob selbst gelesen oder nur zitiert gesehen.

Letzte Bearbeitung: 25.11.2026, Aufträge A-04, A-05, A-06 (Rolle Literaturwächter, Stufe 0, Runde 1).

## Quellenliste

| Kürzel | Fundstelle | Verwendet für | Stand |
|---|---|---|---|
| HK71 | J. E. Hopcroft, L. R. Kerr, *On minimizing the number of multiplications necessary for matrix multiplication*, SIAM J. Appl. Math. 20(1) (1971), 30–36, doi:10.1137/0120004 | obere Schranke ⌈(3nm + max(n,m))/2⌉ für ⟨n,2,m⟩ | Original nicht gelesen (Verlagsseite). Formel übereinstimmend zitiert in Yang26 (S. 1), TPSR26 (S. 2) und Lacelle26 (Abschnitt 7) |
| Yang26 | Jason Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393 [cs.CC], eingereicht 13.09.2026, aktuelle Fassung v3 vom 12.10.2026 | untere Schranken (Satz 1 und Satz 2) | **Volltext v3 gelesen** (8 Seiten) am 25.11.2026. Daten von v1 und v2 auf der arXiv-Seite nicht ausgelesen |
| TPSR26 | Askar Tsyganov, Uliana Parkina, Sergey Samsonov, Maxim Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054 [cs.CC, cs.DS], v1 vom 18.09.2026 (am 25.11.2026 einzige Fassung); Lean: github.com/fallnlove/mm325_proof | Rang von ⟨3,2,5⟩, Lean-Vorlage | **Volltext v1 gelesen** (7 Seiten). Repo nicht geöffnet (A-01, A-02) |
| Shitov26 | Yaroslav Shitov, *Determining the tensor rank of (2, 2, m) matrix multiplication with GPT-5.6 Sol.*, 2026, doi:10.13140/RG.2.2.29432.61441 (DOI-Präfix von ResearchGate) | Ausgangspunkt von Yang: R(⟨2,2,m⟩) ≥ 7m/2 | **Fundstelle geklärt** (A-06), wörtlich gleich zitiert in Yang26 [6] und TPSR26. Dokument selbst nicht gelesen: DOI-Auflösung schlug am 25.11.2026 fehl. Kein arXiv-Gegenstück gefunden. Yang26 Abschnitt 2 gibt den Beweis vollständig wieder |
| AE25 | A. Novikov, N. Vũ, M. Eisenberger u. a., *AlphaEvolve: A coding agent for scientific and algorithmic discovery*, arXiv:2506.13131, v1 vom 16.06.2025; Daten: github.com/google-deepmind/alphaevolve_results, Notebook `mathematical_results.ipynb` | **obere Schranke 32 für ⟨2,4,5⟩, also ⟨4,2,5⟩** (A-05) | Tabelle 2 und 3 gelesen. Notebook geladen und Abschnittstitel sowie Koeffizienten gesichtet, nicht nachgerechnet |
| Perm26 | Andrew I. Perminov, *Fast Matrix Multiplication in Small Formats: Discovering New Schemes with an Open-Source Flip Graph Framework*, arXiv:2603.02398, v1 vom 02.03.2026 | Zahlbereich der Schranke 32 bei ⟨2,4,5⟩ | Abschnitt 7.4 gelesen |
| Lacelle26 | Benoit Lacelle, *A catalog of fast matrix multiplication algorithms with exhaustive derivations*, arXiv:2606.13408, v3 vom 14.08.2026 | Hinweis auf Konstruierbarkeit der Hopcroft-Kerr-Formel | Abschnitte 1–3, 7 und 10 gelesen |
| Wang26 | Chengu Wang, *Automated Lower Bounds for Tensor Rank over Finite Fields*, arXiv:2603.07280; Code: github.com/wcgbg/tensor-rank-lower-bound | Zertifikate über endlichen Körpern | Auszüge gelesen, in dieser Runde nicht geprüft |
| Bl99 | M. Bläser, *Lower bounds for the multiplicative complexity of matrix multiplication*, computational complexity 8(3) (1999), 203–226 | ältere untere Schranke, von Yang26 übertroffen | nur zitiert gesehen |

## A-04: Abgleich der Tabelle in Abschnitt 2 des Protokolls

Alle Ergebnisse dieses Abschnitts haben den Status **behauptet**: Ein Agent hat sie aus den Quellen gelesen, eine Prüfung nach Abschnitt 5 fand nicht statt.

### Formeln

- **Untere Schranke für n = 3.** Yang26 Satz 1: für m ≥ 3 gilt R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉, über beliebigen Körpern. Wortlaut stimmt mit dem Protokoll überein.
- **Untere Schranke für n ≥ 4.** Yang26 Satz 2: für m ≥ n ≥ 4 gilt R(⟨n,2,m⟩) ≥ (n+2)m + (n−3), über beliebigen Körpern. Stimmt überein.
- **Obere Schranke.** Yang26 S. 1 nennt R(⟨n,2,m⟩) ≤ ⌈(3nm + max(n,m))/2⌉ nach HK71. Stimmt überein. Das Original wurde nicht gelesen.

### Zeilen der Tabelle

| Format | Protokoll | Befund | Bemerkung |
|---|---|---|---|
| 3×2×5 | 25 / 25 | bestätigt | Untere Schranke doppelt belegt: Yang26 Satz 1 (⌈122/5⌉ = 25) und TPSR26 Satz 1 mit Folgerung 1 (R > 24m/5 = 24). Nur TPSR26 hat eine Lean-Fassung. Obere: HK-Formel (45+5)/2 = 25 |
| 3×2×6 | 30 / 30 | bestätigt, mit Hinweis | Yang26 sagt ausdrücklich R(⟨3,2,6⟩) = 30. **Die untere Schranke 30 stützt sich nur auf Yang26 v3.** TPSR26 ergibt für m = 6 nur R > 28,8, also ≥ 29. Die Lean-Fassung von TPSR26 deckt 3×2×6 deshalb nicht ab |
| 3×2×7 | 34 / 35 | bestätigt | Untere ⌈170/5⌉ = 34 (Yang26). Obere (63+7)/2 = 35 (HK). AE25 Tabelle 3 führt ⟨2,3,7⟩ ebenfalls mit bestem bekannten Rang 35. Rechnerisch aus den Formeln, nicht in einer Arbeit als Zeile genannt |
| 4×2×4 | 25 / 26 | bestätigt | Yang26 S. 1 nennt R(⟨4,2,4⟩) ≥ 25 wörtlich. Obere (48+4)/2 = 26. AE25 Tabelle 3: ⟨2,4,4⟩ bester bekannter Rang 26 |
| 4×2×5 | 31 / 32 | **zu präzisieren** | Untere 31 von Yang26 wörtlich genannt, über allen Körpern. Obere 32 gilt nach heutigem Stand **nur über Körpern mit Charakteristik ≠ 2**, siehe A-05. Über Körpern der Charakteristik 2 ist die beste gefundene obere Schranke 33 (HK) |

### Vorschlag zur Korrektur der Tabelle (Entscheidung beim Orchestrator bzw. Justus)

Die Zeile 4×2×5 sollte lauten: untere Schranke 31 (alle Körper); obere Schranke 32 für Charakteristik ≠ 2 (AE25), 33 für Charakteristik 2 (HK71). Das Format hat also nur außerhalb von Charakteristik 2 eine Lücke von genau 1.

Die Zeile 3×2×6 sollte vermerken, dass die untere Schranke 30 allein auf Yang26 v3 beruht und nicht auf der Lean-Fassung von TPSR26.

## A-05: Quelle der oberen Schranke 32 für ⟨4,2,5⟩

Status: **behauptet**.

- **Quelle:** AE25, Tabelle 2 (S. 9) und Tabelle 3 (S. 34): ⟨2,4,5⟩, bisher bester Rang 33 nach HK71 (dortige Referenz [42]), AlphaEvolve 32. Der Rang ist unter Vertauschung der drei Formatgrößen gleich, also gilt dieselbe Zahl für ⟨4,2,5⟩. Yang26 zitiert für die oberen Schranken von 4×2×4 und 4×2×5 genau HK71 [4] und AE25 [5].
- **Woher kam die 33:** HK-Formel ⌈(3·4·5 + 5)/2⌉ = ⌈32,5⌉ = 33. Die Notiz im Protokoll ist also richtig: HK allein ergibt 33, die 32 stammt nicht von Hopcroft und Kerr.
- **Zahlbereich:** Das Notebook von AE25 überschreibt das Verfahren mit „Rank-32 decomposition of <2,4,5> over 0.5*Z“. Die Koeffizienten enthalten ±1/2. Das Verfahren in dieser Form gilt damit über jedem Körper, in dem 2 invertierbar ist, also über ℚ, ℝ, ℂ und allen Körpern mit Charakteristik ≠ 2. **Über Körpern der Charakteristik 2 ist es in dieser Form ungültig.**
- **Bestätigung des Zahlbereichs:** Perm26 Abschnitt 7.4 schreibt, dass der beste bekannte rationale Rang für 2×4×5 bei 32 liegt (AE25), Suchen in eingeschränkten Koeffizientenringen (ℤ_T, ℤ₂, ℤ₃) aber nur 33 erreichen. Ein Verfahren mit 32 über ℤ oder über ℤ₂ ist dort nicht bekannt.
- **Offen:** Ob nach März 2026 jemand ein Verfahren mit 32 über ℤ oder über 𝔽₂ gefunden hat, ist nicht geprüft. Lacelle26 und die Kataloge FMM-Lille (fmm.univ-lille.fr) und Perminov (github.com/dronperminov/FastMatrixMultiplication) wurden dafür nicht eingesehen.
- **Nachrechnen:** Das Verfahren aus dem Notebook wurde in dieser Runde nicht nachgerechnet. Es gehört nach Abschnitt 5.2 zu Auftrag A-10 (zwei unabhängige Prüfprogramme). Vor jeder Übernahme der Daten ist nach CLAUDE.md Regel 9 die Lizenz des Repos google-deepmind/alphaevolve_results in `lit/LIZENZEN.md` zu klären.

## A-06: Fundstelle von Shitovs Beweis für ⟨2,2,m⟩

Status: **behauptet**.

- Yaroslav Shitov, *Determining the tensor rank of (2, 2, M) matrix multiplication with GPT-5.6 Sol.*, 2026, https://doi.org/10.13140/RG.2.2.29432.61441.
- Beide Arbeiten (Yang26 Literatur [6], TPSR26 Literaturliste) zitieren sie mit derselben DOI. Das Präfix 10.13140 gehört zu ResearchGate. Es ist also ein dort hochgeladenes Manuskript ohne Begutachtung.
- Inhalt laut Yang26: R(⟨2,2,m⟩) ≥ 7m/2 über beliebigen Körpern. Das trifft die HK-Schranke ⌈7m/2⌉, also R(⟨2,2,m⟩) = ⌈7m/2⌉. Yang26 Abschnitt 2 gibt den Beweis „mit leichter Vereinfachung“ vollständig wieder (Lemma 3 mit Dimensionsvergleich).
- Das Manuskript selbst wurde nicht gelesen. Die DOI-Auflösung schlug am 25.11.2026 aus dieser Umgebung fehl. Eine arXiv-Fassung wurde bei einer Websuche nicht gefunden.

## Weitere Befunde beim Lesen

- **Satz 1 von TPSR26 und von Yang26 sind nicht gleich.** TPSR26 behauptet R(⟨3,2,m⟩) > 24m/5 für alle m ≥ 1. Yang26 v3 behauptet das stärkere ⌈(24m+2)/5⌉ für m ≥ 3. Laut Yang26 S. 1 zeigte eine frühe Fassung von Yang nur ⌈24m/5⌉, TPSR26 verbesserte das, und v3 verbesserte es weiter. Beim Aussagen-Abgleich in A-03 ist der Lean-Satz deshalb mit TPSR26 Satz 1 zu vergleichen, nicht mit Yang26.
- **Normalisierung in Yang26:** Der Beweis nimmt ohne Einschränkung einen unendlichen Körper an, durch Übergang zum algebraischen Abschluss (Abschnitt 2). Lemma 9 setzt einen algebraisch abgeschlossenen Körper voraus. TPSR26 begründet den Übergang ausdrücklich (Erweiterung auf K(t)). Für Stufe 1 ist das eine Stelle, die die Formalisierung sauber abdecken muss. Status: vermutet, keine Lücke festgestellt.
- **HK-Formel konstruktiv:** Lacelle26 Abschnitt 7 berichtet, das HK-Paper von 1971 enthalte nicht für alle Fälle eine ausgeführte Konstruktion, und legt maschinell geprüfte ganzzahlige Verfahren vor, die die Formel bei 459 von 465 Formaten ⟨2,p,n⟩ mit 3 ≤ p ≤ 32 erreichen. Die sechs Ausnahmen sind große Formate. Für unsere Formate (⟨2,3,5⟩, ⟨2,3,6⟩, ⟨2,3,7⟩, ⟨2,4,4⟩) ist das kein Problem, aber es spricht dafür, die HK-Verfahren in A-10 nicht aus dem Originalpaper, sondern aus einer Quelle mit ausgeschriebenen Koeffizienten zu nehmen. Status: behauptet.

## Offene Quellenfragen

- Gibt es inzwischen ein Verfahren mit 32 für ⟨2,4,5⟩ über ℤ oder über 𝔽₂? (Kataloge FMM-Lille und Perminov ansehen)
- Datum von Yang26 v1 und v2 (arXiv-Versionsliste)
- Shitov26 im Original lesen (ResearchGate, ggf. über Justus)
- Lizenz von google-deepmind/alphaevolve_results für `lit/LIZENZEN.md`
- Gibt es bereits eine Lean-Fassung von Yang v3? Bei der Sichtung am 25.11.2026 keine gefunden, in dieser Runde nicht erneut gesucht

## Nachbarfeld, bewusst nicht unser Ziel

3×3×3: untere Schranken 21 (alle Körper, Lean-Repo AIV5/mmrank21), 22 über den ganzen Zahlen (arXiv:2610.01639), über dem Zweierkörper ein Preprint mit der Behauptung „exakt 23" (arXiv:2610.11823). Viele Gruppen aktiv.
