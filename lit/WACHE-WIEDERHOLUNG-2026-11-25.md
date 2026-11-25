# Wiederholte Literaturwache zu R(⟨4,2,4⟩) = 26, Suchprotokoll

Auftrag: Wiederholung der Literaturwache nach der Bedingung von Justus vom 25.11.2026, 22:42 UTC. Frage: Ist für ⟨2,4,4⟩ (gleichwertig ⟨4,2,4⟩, ⟨4,4,2⟩) irgendwo der Tensorrang 26 oder eine untere Schranke 26 bewiesen oder behauptet, oder gibt es ein Verfahren mit 25 Multiplikationen über irgendeinem Körper? Welche Schranken sind veröffentlicht?

Regeln für dieses Protokoll: Jede Suchanfrage steht im Wortlaut, mit Werkzeug und Trefferzahl. Jede geöffnete Quelle steht mit Link und der einschlägigen Stelle. Uhrzeiten stehen nicht im Text, sie sind aus den Git-Zeitstempeln der Commits dieses Zweigs abzulesen. Eigentreffer auf Justus42/matmul-rank-n2m zählen nicht. Keine Fremdmodell-Anfragen.

Ausführender Thread meldet als Modellbezeichnung: claude-opus-5-5.

## Suchprotokoll

(wird fortlaufend ergänzt)

### Vorab: Erreichbarkeit

Werkzeug Bash/curl, Abruf mit Statuscode: export.arxiv.org/api, arxiv.org/abs/2609.14393, fmm.univ-lille.fr/2x4x4.html, api.semanticscholar.org, api.openalex.org, mathoverflow.net, scholar.google.com. Alle sieben: Code 000 (vom Proxy der Umgebung nicht durchgelassen). Folge: Google Scholar ist nicht direkt durchsuchbar. Gesucht wurde mit dem Werkzeug WebSearch (Websuche), alphaXiv (Suchindex über arXiv) und einem Abruf-Werkzeug für einzelne Seiten. Ein vollständiges Durchblättern der arXiv-Listings ist damit nicht möglich; ersatzweise alphaXiv-Suche nach Aktualität.

### Websuche, Block 1 (Werkzeug WebSearch)

Trefferlisten wörtlich nach Titel/URL zusammengefasst. „Eigentreffer“ = Justus42/matmul-rank-n2m.

| Nr. | Anfrage (wörtlich) | Modus | Treffer | Art der Treffer |
|---|---|---|---|---|
| W1 | `rank of 2x4x4 matrix multiplication tensor` | standard | 10 | arXiv: 0808.2688 (maximaler Rang 2-Schichten), 1607.01668 (Übersicht Tensorzerlegung), 1705.09652 (Grenzträgerrang 2×2), 2410.20538, 2209.11040, 2408.15728, 2609.05648 (maximaler Rang 4×4×4 über 𝔽₂), 1306.0708. Keiner nennt ⟨2,4,4⟩ im Titel. |
| W2 | `"<2,4,4>" matrix multiplication rank lower bound` | standard | 10 | arXiv 2603.07280 (Wang, v1, v2, v3, v5 und ohne Version), 1112.6007, 1206.1530, 1706.04225, 2610.01639 („Lower Bound of 22 for 3x3 Matrix Multiplication over the Integers“) |
| W3 | `"4x2x4" matrix multiplication 26 multiplications optimal` | standard | 10 | fmm.univ-lille.fr/2x4x4.html (⟨2×4×4:26⟩), 1804.04102, 2603.18699, 2506.13242 (mehrere Fassungen), eprint.iacr.org/2026/849, fmm 4x17x26, 2210.04045 |
| W4 | `"25 multiplications" 4x4 by 4x2 matrix multiplication` | standard | 10 | 2506.13242, 2210.04045, mapleprimes-Beitrag 230205 (4×4-Ergebnis), 2603.18699, DrIsSc09 (Waterloo), Wikipedia Strassen. Kein Treffer zu einem 25-Produkt-Verfahren für ⟨2,4,4⟩ im Titel. |
| W5 | `Hopcroft Kerr bound optimal n×2×m matrix multiplication rank proof 2026` | extended | 10 | arXiv 2609.14393 (Yang, HTML, v1, PDF), alphaXiv 2609.22054 (TPSR26), 2606.13408 (Lacelle, v1, aktuell, PDF), pith.science-Review zu 2609.22054, caisc2026 Verifiable Problems, 2603.07280v1 |
| W6 | `"⟨4,2,4⟩" OR "<4,2,4>" tensor rank matrix multiplication` | standard | 10 | 2210.01183, 2506.13242, 2209.11040, 1607.01668, 2506.18713, 1705.09379, 1409.2908, 2311.01630, 1508.01110. Nichts mit ⟨4,2,4⟩ im Titel. |
| W7 | `tensor rank "4×2×4" matrix multiplication lower bound 26` | extended | 10 | **Eigentreffer** github.com/Justus42/matmul-rank-n2m (zählt nicht); 2603.07280v3; par.nsf.gov 10486995 und 10486993; 1609.07476; 2006.02374; 1912.11927; Cambridge Forum-Artikel „new lower bounds for matrix multiplication and det3“; ToC v011a011 |
| W8 | `"<4,4,2>" OR "4x4x2" matrix multiplication rank 26 25` | standard | 10 | 2210.04045, 2506.13242, 2603.18699, fmm 2x4x4, fmm 4x17x26, fmm 4x4x4, 2603.02398, fmm 4x15x26, 2306.00882 |
| W9 | `2x4x4 matrix multiplication border rank 24 Smirnov` | standard | 10 | 1911.07981 (Conner/Harper/Landsberg, Grenzrang), 1705.09652, par.nsf.gov 10486993, core.ac.uk, 1112.6007, 2610.26563, 1305.0779, math/0407224 |
| W10 | `papers citing "New lower bounds on tensor rank of (n,2,m) matrix multiplication"` | extended | 10 | 2609.14393 (HTML, PDF), alphaXiv „The Matrix Multiplication Exponent Is Nine Fourths“, **Eigentreffer** Justus42/matmul-rank-n2m, 2603.07280v3, ToC v011a011, 2603.07280v1, 1206.1530, par.nsf.gov 10486993, Cambridge Forum |

Neu gegenüber früheren Wachen und noch zu öffnen: 2610.01639, 2609.05648, 2603.18699, 2506.13242, eprint.iacr.org/2026/849, 2610.26563, pith.science-Review, 2603.02398.

### Websuche, Block 2 (Werkzeug WebSearch)

| Nr. | Anfrage (wörtlich) | Modus | Treffer | Art der Treffer |
|---|---|---|---|---|
| W11 | `exact rank matrix multiplication small formats Lean formalization lower bound 2026` | extended | 9 | github.com/AIV5/mmrank21 (Lean, 3×3 ≥ 21 über jedem Körper laut Titel), alphaXiv 2609.18722, MathWorld, arXiv 2610.11823v3 („The rank of 3×3 matrix multiplication over 𝔽₂ is 23“), **Eigentreffer** Justus42/matmul-rank-n2m, lilting.ch (9/4-Arbeit), pith.science 2609.22054, zwei Nachrichtenseiten zur 9/4-Arbeit |
| W12 | `Alekseyev "matrix multiplication" 2xnxm bilinear complexity lower bound` | standard | 10 | mathnet.ru cheb433, uzku1262, arXiv 2609.22054, 2603.07280v1/v2, 1206.1530, journal-vniispk.ru 176320 („On Bilinear Complexity of Multiplying 2×2-Matrix by 2×m-Matrix over Finite Field“), 1003.4679, 1112.6007 |
| W13 | `site:mathoverflow.net rank matrix multiplication tensor 2x4 4x4 lower bound` | standard | 10 | **kein einziger Treffer auf mathoverflow.net**; stattdessen arXiv 2603.07280 (v1, v2, v5), 1706.04225, core.ac.uk, 1206.1530, 1705.09652, 1804.09124, 2306.01718, 2609.14393 |
| W14 | `flip graph SAT search matrix multiplication 2x4x4 rank 25 scheme` | extended | 10 | doi 10.1145/3815436.3815455, 2212.01175 (Kauers/Moosbauer), ACM Arai u. a., 2506.22113, 2511.10786, 2502.04514, ACM Kauers/Moosbauer, 2510.19787, Chen/Kauers. Kein Treffer zu einem 25-Produkt-Verfahren für ⟨2,4,4⟩ im Titel. |
| W15 | `"multiplicative complexity" "2 × 4" "4 × 4" matrices 26` | standard | 10 | fmm 2x4x4, 2506.13242, 2603.18699, cs/0703059 (Landsberg), 2609.06725, fmm 2x4x26, 2210.04045 |

### alphaXiv-Suchen (Werkzeug alphaXiv discover_papers)

| Nr. | Schlüsselwörter (wörtlich) | Frage (wörtlich) | Einstellung | Treffer |
|---|---|---|---|---|
| X1 | `<2,4,4>`, `tensor rank`, `matrix multiplication` | „tensor rank of <2,4,4> matrix multiplication, lower bound 26 or algorithm with 25 multiplications“ | Aufwand 8, Standard | 11: 2609.22054, 2609.14393, 2610.26563, 2611.09716, 2610.13905, 2602.11041, 2610.10593, 2609.12027, 2603.18699, 2510.19787, 2610.01639 |
| X2 | `matrix multiplication`, `lower bound`, `tensor rank` | „new lower bounds on the rank of small matrix multiplication tensors“ | Aufwand 8, nach Aktualität | 16: 2609.14393, 2609.06725, 2609.22054, 2609.18722, 2610.01639, 2609.12121, 2610.11823, 2609.13596, 2609.06588, 2607.28676, 2609.32388, 2603.07280, 2510.19787, 2602.11041, 2610.13971, 2608.09708 |
| X3 | `(n,2,m)`, `matrix multiplication`, `Hopcroft-Kerr` | „rank of (n,2,m) matrix multiplication, Hopcroft-Kerr bound optimality“ | Aufwand 8, Standard | 12: 2609.22054, 2609.14393, 2610.01639, 2609.06725, 2609.06588, 2609.32388, 2610.13971, 2606.13408, 2511.20317, 2510.19787, 2602.21797, 2508.01748 |

Keiner der Titel und keine der Kurzfassungen nennt ⟨2,4,4⟩, ⟨4,2,4⟩ oder ⟨4,4,2⟩.

### Geöffnete Quellen, Teil 1 (Werkzeug alphaXiv answer_pdf_queries, Volltext-PDF-Seiten)

**Q1. Yang26, arXiv:2609.14393, gelesen als v3 („arXiv:2609.14393v3 [cs.CC] 12 Oct 2026“, Seite 1 des PDF).** Alle acht Seiten geliefert. Einschlägige Stelle, S. 1, wörtlich: „Additionally, Theorem 2 proves R(⟨4, 2, 4⟩) ≥ 25 and R(⟨4, 2, 5⟩) ≥ 31, which are each one away from the current upper bounds [4] [5].“ Abschnitt 4.2.1 (S. 7) beweist für n = 4 genau r ≥ 6m + 1, also 25 bei m = 4. Keine Aussage, dass 26 bewiesen oder die Frage anders als offen sei. Keine neue Fassung über v3 hinaus im Werkzeug sichtbar.

**Q2. Tomar, arXiv:2610.11823 v3 (19.10.2026), „The rank of 3 × 3 matrix multiplication over 𝔽₂ is 23“.** Neu gegenüber früheren Wachen. Betrifft nur ⟨3,3,3⟩ über 𝔽₂. In den gelieferten Seiten (1–3, 5–7, 9, 11, 15, 17–18) kein ⟨2,4,4⟩. Nebenbefund: Lemma 4.3 erwähnt ⟨2,2,2⟩, sonst keine anderen Formate. Referenz [D’Am26]: „I. D’Ambrosio, The exact 𝔽₂-rank of 2 × 3 by 3 × 4 matrix multiplication, Zenodo, 2026“ (Format ⟨2,3,4⟩, nicht unseres; noch zu prüfen, ob dort ⟨2,4,4⟩ vorkommt).

**Q3. Kauers/Wood, arXiv:2510.19787 v1, „Exploring the Meta Flip Graph“.** Tabelle Figure 4 (S. 9) listet nur verbesserte Formate (346, 257, 347, 446, 258, 267, 348, 357, 456, 268, 277, 358, 457, 556, 368, 377, 458, 467, 557, 566, 378, 477, 558, 567, 388, 568, 577, 667). **⟨2,4,4⟩ kommt nicht vor**, also keine Verbesserung unter 26. S. 4 wörtlich: „it is fair to believe that for most of the formats (n, m, p) near (2, 2, 2), the currently best known upper bounds for the rank are actually sharp.“ Das ist eine Vermutung, kein Beweis.

**Q4. Lacelle, arXiv:2606.13408 v3 (Entwurf 17.08.2026).** Einschlägige Stellen:
- S. 9, Beispiel ⟨4,8,12⟩:272, wörtlich: „Taking the serendipitous product with ⟨2, 4, 2⟩ and using R(⟨2, 4, 2⟩) = 14 and R(⟨2, 4, 4⟩) = 26, …“. **Dieses „= 26“ ist nach der Konvention des Katalogs der beste bekannte Rang (SOTA) über ℚ, keine Behauptung des exakten Tensorrangs:** Abschnitt 10.1 (S. 32) definiert „‚SOTA‘ means the lowest known rank“, und Abschnitt 7.5 (S. 26) sagt wörtlich: „The construction is an upper-bound realisation; Hopcroft–Kerr proved matching lower bounds only for ⟨2, 2, n⟩ and ⟨2, 3, 3⟩. … Lower bounds beyond Hopcroft–Kerr’s own remain out of scope.“
- S. 29, wörtlich: „the Kronecker pair ⟨2, 4, 4⟩=26 ⊗ ⟨6, 3, 3⟩=40 gives 1040“, ebenfalls Katalograng.
- S. 36: Untere Schranken („lower-bound registry“) sind laut Text „not yet surfaced in the comparison tables“.
Bewertung: Lacelle behauptet nicht, dass R(⟨2,4,4⟩) = 26 bewiesen ist; die Schreibweise mit „=“ ist Katalogsprache für die obere Schranke. Kein Verfahren mit 25.

**Q5. Rudich/Rousseau, arXiv:2610.01639 v1, „Lower Bound of 22 for 3 × 3 Matrix Multiplication over Z“.** Nur ⟨3,3,3⟩. Kein ⟨2,4,4⟩ in den gelieferten Seiten 1–3, 5–15. Referenz [51] nennt Wang arXiv:2603.07280 „version 10 (30 Jul 2026)“, also eine neuere Fassung als die in Wache S2-58 gelesene v6. Muss neu geöffnet werden.

### Geöffnete Quellen, Teil 2 (Werkzeug alphaXiv answer_pdf_queries)

**Q6. Wang, arXiv:2603.07280, gelesen als v11 („arXiv:2603.07280v11 [cs.CC] 29 Aug 2026“).** Neuer als die in Wache S2-58 gelesene v6. Theorem 1 (S. 2): nur R_𝔽₂(⟨3,3,3⟩) ≥ 20, R_𝔽₂(⟨3,3,4⟩) ≥ 25, R_𝔽₂(⟨3,4,4⟩) ≥ 29. Tabelle 3 (S. 16, „Matrix multiplication tensor rank over 𝔽₂“) führt ⟨2,2,2⟩, ⟨2,2,3⟩, ⟨2,2,4⟩, ⟨2,3,3⟩, ⟨2,3,4⟩ (19/19/20), ⟨3,3,3⟩, ⟨3,3,4⟩, ⟨3,4,4⟩. **⟨2,4,4⟩ steht nicht in der Tabelle.** Tabelle 9 (S. 24) nennt für das Format 2×4 ohne Transposition 86 Bahnen über 𝔽₂ und 91 über 𝔽₃, also wäre ⟨2,4,4⟩ dem Verfahren rechnerisch zugänglich; ein Ergebnis dafür wird nicht berichtet.

**Q7. TPSR26, arXiv:2609.22054, gelesen als v1 (18.09.2026).** Nur ⟨3,2,m⟩. Zu n = 4 nur das Zitat von Yang in der Einleitung (S. 1): „R_K(⟨n, 2, m⟩) ≥ (n + 2)m for n ≥ 4“ (nach der frühen Yang-Fassung). Keine Aussage zu 26. Keine neuere Fassung im Werkzeug.

**Q8. AlphaEvolve, arXiv:2506.13131 v1.** Tabelle 3 (S. 34), Zeile wörtlich: „⟨2, 4, 4⟩ 26 [93] 26“ ([93] = Smirnov 2013). Kein Verfahren mit 25; AlphaEvolve erreicht 26 wieder.

**Q9. Kauers/Moosbauer, arXiv:2212.01175 v1, „Flip graphs for matrix multiplication“.** Tabelle 1 (S. 10), Zeile wörtlich: „(2, 4, 4) any 26 [11] 26“ ([11] = Hopcroft/Kerr 1971). S. 1 wörtlich (Stand 2022): „Also for multiplying a 2 × 2 matrix with a 2 × p matrix and for multiplying a 2 × 3 matrix with a 3 × 3 matrix, optimal algorithms are known [11]. For all other formats, the known upper and lower bounds do not match.“
