# S4-17: Blind-Suche zu R(⟨3,2,7⟩), Runde 3

Rolle: Blind-Sucher. Gelesen im Repo: nur `CLAUDE.md`. Alle eigenen Aussagen sind als **vermutet** oder **behauptet** gekennzeichnet.

## 0. Offenlegung eingeblendeter Gedächtniseinträge

(wird ergänzt)

## 1. Problemstellung

(wird ergänzt)

## 2. Literaturstand (Netzrecherche 26.11.2026, Sitzungsbeginn)

Suchprotokoll (wörtlich):
1. Websuche „bilinear complexity multiplication 3x2 by 2xn matrices lower bound Hopcroft Kerr Alekseev“
2. Websuche „tensor rank <2,3,n> matrix multiplication exact rank 5n lower bound“
3. Websuche „Yang lower bound R(<3,2,m>) ≥ 24m/5 matrix multiplication arXiv“
4. Websuche (erweitert) „"3,2,7" OR "2,3,7" matrix multiplication rank 34 35 bilinear algorithm flip graph“
5. Gelesen (alphaXiv-Text): arXiv:2609.22054, arXiv:2609.14393, arXiv:2603.07280 (v11), arXiv:2603.02398.

Gefundene Aussagen aus der Literatur (Wiedergabe, nicht von mir geprüft):

| Quelle | Aussage | Wert für m = 7 |
|---|---|---|
| Hopcroft, Kerr 1971 (zitiert in 2609.14393) | R(⟨n,2,m⟩) ≤ ⌈(3nm + max(n,m))/2⌉ | ≤ 35 |
| J. Yang, arXiv:2609.14393 | R_K(⟨3,2,m⟩) ≥ ⌈24m/5⌉ über jedem Körper K | ≥ ⌈33,6⌉ = 34 |
| Tsyganov, Parkina, Samsonov, Rakhuba, arXiv:2609.22054 | R_K(⟨3,2,m⟩) > 24m/5 (strikt), mit Lean-4-Prüfung | ≥ 34 (keine Verbesserung, da 33,6 nicht ganz) |
| Ja'Ja', Takche (zitiert in 2603.07280) | R_{F₂}(⟨3,2,n⟩) ≥ ⌈105n/23⌉ | ≥ 32 |
| Perminov, arXiv:2603.02398, Abschnitt 5.2 | verwendet (2,3,7 : 35) als bestes bekanntes Verfahren | ≤ 35 |
| Bläser (zitiert in 2609.14393) | R(⟨2,n,m⟩) ≥ nm + n + m − 1 | ≥ 30 |

Folgerung aus der Literatur (**behauptet**, nur aus den Zitaten zusammengesetzt): 34 ≤ R(⟨3,2,7⟩) ≤ 35 über jedem Körper. Offen ist genau, ob 34 erreichbar ist. Einen Artikel, der 3×2×7 abschließend klärt, habe ich nicht gefunden.

Zum Verständnis des Abstands: Yangs Argument liefert mit h = dim ker W = R − 3m die Ungleichung 5h ≥ 9m. Für m = 7 heißt das h ≥ 12,6, also h ≥ 13, also R ≥ 34. Für R ≥ 35 bräuchte man h ≥ 14. Der Fall h = 13 ist kein Gleichheitsfall von 5h ≥ 9m (65 > 63). Die Gleichheitsfall-Technik aus 2609.22054 greift deshalb für m = 7 nicht unmittelbar (**behauptet**).
