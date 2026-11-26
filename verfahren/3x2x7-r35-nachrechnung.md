# S4-04: Nachrechnung des Verfahrens mit 35 Produkten für 3×2×7

Auftrag S4-04, Stufe 4, Runde 1, Rolle Verfahrenssucher. Datum 26.11.2026.

**Status: behauptet.** Den Status setzt nur der Orchestrator. Dieser Bericht hält nur fest, was gebaut und welche Läufe gemacht wurden.

## Ergebnis

- Datei: `verfahren/3x2x7-r35-hk71.json`, Commit `90322c544c180f50c4c257e6aea3e4305cb83487` (Zweig `claude/project-thread-4xw3te`)
- SHA-256 der Datei: `8a2445a69882095c4ac794ab3caf4aff59e657dc94919f87086b41c4b47c29ef`
- 35 Produkte für C = A·B mit A 3×2 und B 2×7, Zahlbereich `"Z"`
- Beide Prüfprogramme geben `ANGENOMMEN` mit Rückgabewert 0 aus (wörtlich unten)

## Zahlbereich

`ring` ist `"Z"`: alle Koeffizienten sind ganze Zahlen (in `u` und `w` aus −2, −1, 0, 1, 2, in `v` aus −1, 0, 1). Nach Abschnitt 4 von `verfahren/README.md` gilt das Verfahren damit über ℤ und folglich über jedem Körper jeder Charakteristik, auch Charakteristik 2 und 3. Es gibt keine Nenner, also keine ausgenommenen Charakteristiken.

## Herkunft

Eigener Bau nach dem Bauplan von Hopcroft und Kerr (1971), genauso wie `3x2x5-r25-hk71` und `3x2x6-r30-hk71`. Es wurden **keine fremden Daten übernommen**. Die Datei aus dronperminov/FastMatrixMultiplication wurde weder geladen noch gelesen, aus solven-eu/matmulcatalog ebenfalls nichts. Deshalb gibt es keinen neuen Eintrag in `lit/LIZENZEN.md`. Das Original HK71 hat der Verfasser nicht gelesen; die Diagonalverfahren stammen aus der Datei `3x2x5-r25-hk71.json`.

35 = (3·3·7 + 7)/2 ist die Hopcroft-Kerr-Zahl ⌈(3pn + max(n,p))/2⌉ für p = 3, n = 7.

## Konstruktion

1. **Ergänzung von A.** Ā = M·A mit 7 Zeilen, M = [e0; e1; e2; e0+e1; e1+e2; e0+e1+e2; e2]. Für jedes l bilden die Zeilen l−1, l, l+1 (zyklisch mod 7) von M eine 3×3-Matrix mit Determinante ±1. Das Bauskript prüft das für alle 7 Fenster.
2. **Paarung.** Zeile r von Ā (x_r) gehört zu Spalte r von B (y_r).
3. **Diagonalen, Produkte 1 bis 14.** Zeile r berechnet x_r·y_r mit 2 Produkten nach Diagonalverfahren 1, 2, 1, 2, 1, 2, 3 für r = 0 … 6. Mit x = (a, b), y = (c, d):
   - Verfahren 1: b(c+d) und (a−b)c
   - Verfahren 2: a(c+d) und (a−b)d, letzteres mit Vorzeichen −1
   - Verfahren 3: ac und bd
4. **Nachbarpaare, Produkte 15 bis 35.** Für jedes zyklische Paar (r, r+1), in der Reihenfolge (0,1), (1,2), …, (6,0), kommen 3 Produkte dazu. Zusammen mit den 4 Diagonalprodukten der beiden Zeilen spannen sie x_r·y_{r+1} und x_{r+1}·y_r auf (zusammen ein 2×2×2-Produkt mit 7 Multiplikationen). Die 3 Produkte wurden durch erschöpfende Suche über alle Linearformen mit Koeffizienten −1, 0, 1 in den lokalen Koordinaten (a_r, b_r, a_{r+1}, b_{r+1}) und (c_r, d_r, c_{r+1}, d_{r+1}) bestimmt: Jeder Kandidat wird modulo des Raums aus den 4 Diagonalformen und den 2 Zielformen reduziert, Kandidaten mit gleichem Bild werden gruppiert, und aus einer Gruppe werden 3 genommen, deren Spann mit den Diagonalformen die Zielformen enthält. Bei mehreren Treffern wurde der mit der kleinsten Summe der Beträge gewählt. Die Paartypen sind (1,2), (2,1), (1,2), (2,1), (1,2), (2,3), (3,1).
5. **Rücklösen.** Spalte l von C ist A·y_l. Aus den Produkten liegen x_{l−1}·y_l, x_l·y_l und x_{l+1}·y_l vor, das sind die Einträge von (Fenster von M)·A·y_l. Das Fenster ist ganzzahlig invertierbar.
6. **w.** Statt die Rücklösung von Hand einzusetzen, wurde w für jeden der 21 Einträge von C durch exakte Gauß-Elimination über ℚ (Python `fractions.Fraction`) aus den 35 Bilinearformen bestimmt. Alle Werte sind ganz.

Das Bauskript war ein Wegwerf-Skript in der Sitzung und liegt nicht im Repo, wie bei A-10. Laufzeit des Baus etwa 58 Sekunden auf einem Kern. Nach Abschnitt 5.2 zählt das Bauskript nicht als Prüfung.

## Läufe

Umgebung: Python 3.13.18; cargo 1.97.0 (c980f4866 2026-06-30), rustc 1.97.0 (2d8144b78 2026-07-07). Die Prüfprogramme sind unverändert, Stand `main` bei Commit `2335284fc7616aba0e5b557a3adea820fe2ece7f`. Geprüfter Datei-Stand: Commit `90322c544c180f50c4c257e6aea3e4305cb83487`. Aufrufe aus der Wurzel des Repos.

### Programm 1, Python

```
$ python3 pruefer/python/pruefer.py verfahren/3x2x7-r35-hk71.json
ANGENOMMEN 3x2x7-r35-hk71 3x2x7 rank=35 ring=Z
```

Rückgabewert: 0

### Programm 2, Rust

```
$ (cd pruefer/rust && cargo build --release)
   Compiling pruefer-rust v0.1.0 (/home/user/matmul-rank-n2m/pruefer/rust)
    Finished `release` profile [optimized] target(s) in 9.49s
$ pruefer/rust/target/release/pruefer verfahren/3x2x7-r35-hk71.json
ANGENOMMEN 3x2x7-r35-hk71 3x2x7 rank=35 ring=Z
```

Rückgabewert: 0

Beide Ausgaben haben keine Hinweiszeilen, also kein Produkt mit ganz null `u`, `v` oder `w`.

### Gegenprobe

Eine Kopie mit einem absichtlichen Vorzeichenfehler (`products[0].w[0][0]` von `1` auf `-1`, außerhalb des Repos) lehnen beide Programme ab:

```
$ python3 pruefer/python/pruefer.py <kopie>/3x2x7-r35-hk71.json
ABGELEHNT 3x2x7-r35-hk71 2 von 1764 Gleichungen verletzt, erste: i=0 j=1 j'=0 l=0 i'=0 l'=0 Wert=-2 erwartet=0
VERLETZT i=0 j=1 j'=1 l=0 i'=0 l'=0 Wert=-1 erwartet=1
```

Rückgabewert: 1

```
$ pruefer/rust/target/release/pruefer <kopie>/3x2x7-r35-hk71.json
ABGELEHNT 3x2x7-r35-hk71 2 von 1764 Gleichungen verletzt, erste: i=0 j=1 j'=0 l=0 i'=0 l'=0 Wert=-2 Soll=0
VERLETZT i=0 j=1 j'=0 l=0 i'=0 l'=0 Wert=-2 Soll=0
VERLETZT i=0 j=1 j'=1 l=0 i'=0 l'=0 Wert=-1 Soll=1
```

Rückgabewert: 1

1764 = (3·2)·(2·7)·(3·7) Gleichungen, wie in Abschnitt 2 des Formats.

## Hinweise für den Orchestrator

- Am Format und an den Programmen ist nichts aufgefallen, das nicht passt.
- Beide Programme hat derselbe Agent (dieser Verfahrenssucher) aufgerufen. Geschrieben wurden sie von verschiedenen Subagenten (A-08, A-09, S1-07, S1-08). Ob das für Abschnitt 5.2 reicht oder ob ein Prüfer die Läufe wiederholen soll, entscheidet der Orchestrator.

## Verbrauch

0 Subagenten, 0 Fremdmodell-Anfragen. Dauer aus den Git-Zeitstempeln der Commits auf dem Zweig.
