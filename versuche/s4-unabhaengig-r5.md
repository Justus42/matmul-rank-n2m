# S4-29: Rang von ⟨3,2,7⟩, unabhängiger Sucher, Runde 5

Rolle: unabhängiger Sucher (nicht blind, siehe Abschnitt 0). Gelesen im Repo: nur `CLAUDE.md`.
Alle eigenen Aussagen sind als **vermutet** oder **behauptet** gekennzeichnet. Status setzt der Orchestrator.

## 0. Offenlegung eingeblendeter Gedächtniseinträge

(wird ausgefüllt)

## 1. Problemstellung

## 2. Literatur

Gefunden über eine allgemeine Netzsuche (Suchanfragen wörtlich: „lower bound bilinear complexity multiplication n×2 by 2×m matrices Hopcroft Kerr optimal“ und „tensor rank 2x3x7 matrix multiplication 35 multiplications lower bound“, github.com ausgeschlossen, damit keine Seiten dieses Repos erscheinen). Offenlegung: Die beiden folgenden arXiv-Nummern stehen auch im eingeblendeten Gedächtnisindex (Abschnitt 0). Ich habe sie unabhängig davon über die Suche gefunden und lese sie als öffentliche Literatur.

- A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054v1 (18.9.2026). Satz 1: über jedem Körper ist R(⟨3,2,m⟩) > 24m/5. Ich habe den Beweis vollständig gelesen und Schritt für Schritt nachvollzogen (Abschnitt 4.1). Für m = 7 folgt R ≥ ⌈33,6⌉ = 34.
- J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393 (laut Tsyganov et al.: R(⟨3,2,m⟩) ≥ ⌈24m/5⌉, R(⟨n,2,m⟩) ≥ (n+2)m für n ≥ 4). Nicht selbst gelesen, nur aus dem Zitat bei Tsyganov et al. und der Suchzusammenfassung bekannt.
- J. E. Hopcroft, L. R. Kerr, SIAM J. Appl. Math. 20 (1971) 30–36: obere Schranke R(⟨p,2,n⟩) ≤ ⌈(3pn + max(p,n))/2⌉, für ⟨3,2,7⟩ also 35.
- Ja'Ja' und Takche (1985): über F₂ R(⟨3,2,m⟩) ≥ ⌈105m/23⌉, für m = 7 also 32. Bläser (1999): allgemeine Schranke, schwächer.

Stand der Literatur nach meiner Suche: 34 ≤ R(⟨3,2,7⟩) ≤ 35 über jedem Körper. Einen Beleg für die genaue Zahl habe ich nicht gefunden.

## 3. Obere Schranke

## 4. Untere Schranke

## 5. Gescheiterte Ansätze

## 6. Rechenblöcke und Verbrauch

- Block 1 (12:35–12:50 UTC, 1 Kern): numerische Suche (Levenberg-Marquardt mit Rundung auf {−1,0,1}) nach ganzzahligen Teilverfahren für ⟨3,2,3⟩ mit Rang 15. Exakte reelle Lösungen gefunden (etwa 1 von 20 Startwerten), das Runden auf ganze Zahlen ist in keinem Lauf gelungen. Kein Ergebnis.
- Block 2 (12:51–13:02 UTC, bis 4 Kerne): (a) simuliertes Abkühlen über Produkte mit Faktoren aus höchstens zwei Variablen und Koeffizienten ±1, (b) Levenberg-Marquardt mit Ansatz zyklischer Symmetrie (Z/3 auf Zeilen von A und Spalten von B, 5 Bahnen) und schrittweisem Runden. Keine ganzzahlige Lösung für ⟨3,2,3⟩ mit Rang 15 gefunden; Methode (a) fand zur Kontrolle nicht einmal Strassens ⟨2,2,2⟩ mit 7, ist also zu schwach. Ergebnis: Eigenbau der Teilverfahren aufgegeben, siehe Abschnitt 5.
