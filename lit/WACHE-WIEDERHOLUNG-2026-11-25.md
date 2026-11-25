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
