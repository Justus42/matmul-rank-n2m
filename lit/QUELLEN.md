# Quellen

Jede Quelle mit: Fundstelle, was wir daraus verwenden, ob selbst gelesen oder nur zitiert gesehen.

| Kürzel | Fundstelle | Verwendet für | Stand |
|---|---|---|---|
| HK71 | Hopcroft, Kerr, *On minimizing the number of multiplications necessary for matrix multiplication*, SIAM J. Appl. Math. 20 (1971), 30–36 | obere Schranke ⌈(3nm + max(n,m))/2⌉ | nur über Yang zitiert gesehen |
| Yang26 | Jason Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393, v1 13.09.2026, v3 12.10.2026 | untere Schranken, Lücken bei 4×2×4 und 4×2×5 | Zusammenfassung und Auszüge gelesen, Volltext offen |
| TPSR26 | Tsyganov, Parkina, Samsonov, Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054, 18.09.2026; Lean: github.com/fallnlove/mm325_proof | Rang von 3×2×5, Lean-Vorlage | Auszüge gelesen, Repo nicht geöffnet |
| Wang26 | Chengu Wang, *Automated Lower Bounds for Tensor Rank over Finite Fields*, arXiv:2603.07280; Code: github.com/wcgbg/tensor-rank-lower-bound | Zertifikate über endlichen Körpern | Auszüge gelesen |
| Shitov26 | Shitov, Beweis für ⟨2,2,m⟩ mit GPT-5.6 | Ausgangspunkt von Yang | Fundstelle offen (Auftrag A-06) |

## Offene Quellenfragen

- Woher stammt das Verfahren mit 32 Multiplikationen für 4×2×5? (A-05)
- Gibt es bereits eine Lean-Fassung von Yang v3? Bei der Sichtung am 25.11.2026 keine gefunden

## Nachbarfeld, bewusst nicht unser Ziel

3×3×3: untere Schranken 21 (alle Körper, Lean-Repo AIV5/mmrank21), 22 über den ganzen Zahlen (arXiv:2610.01639), über dem Zweierkörper ein Preprint mit der Behauptung „exakt 23" (arXiv:2610.11823). Viele Gruppen aktiv.
