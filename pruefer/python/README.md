# Prüfprogramm 1 (Python), Auftrag A-08

Rechnet eine Verfahrensdatei im Format aus `verfahren/README.md` (Formatversion 1) exakt nach: ganze Zahlen, `fractions.Fraction` oder ganze Zahlen mod p. Keine Gleitkommazahlen, auch nicht beim Einlesen. Nur Python-Standardbibliothek, getestet mit Python 3.13.

Status dieses Programms: **behauptet**. Es ist eines der beiden Programme nach Protokoll 5.2. Ein Verfahren gilt erst als geprüft, wenn auch das zweite Programm (`pruefer/rust/`, A-09) es annimmt. Der Verfasser hat Programm 2 nicht gesehen.

## Aufruf

```
python3 pruefer.py <datei.json>
```

Ausgabe auf der Standardausgabe, erste Zeile genau eine von

```
ANGENOMMEN <id> <n>x<k>x<m> rank=<rank> ring=<ring>
ABGELEHNT <id> <Anzahl> von <Gesamt> Gleichungen verletzt, erste: i=.. j=.. j'=.. l=.. i'=.. l'=.. Wert=.. erwartet=..
FEHLERHAFT <Dateiname> <Grund>
```

Rückgabewert 0, 1 oder 2. Die sechs Indizes gehören zur Gleichung Σ_r u_r[i][j] · v_r[j'][l] · w_r[i'][l'] aus Abschnitt 2 des Formats, `Wert` ist die berechnete Summe (bei GF(p) reduziert auf 0…p−1).

Weitere Zeilen, ohne Einfluss auf das Ergebnis:

- `VERLETZT ...` weitere verletzte Gleichungen, höchstens 10 insgesamt
- `HINWEIS products[r].u ist ganz null ...` (ebenso für `v`, `w`)
- `HINWEIS Primteiler der Nenner: ...` bei Zahlbereich `Q`; `keine`, wenn alle Koeffizienten ganz sind

## Tests

```
cd pruefer/python
python3 -m unittest discover -s tests
```

27 Tests, darunter:

- `tests/daten/2x2x2-r7-strassen69.json`: Strassens Beispiel aus `verfahren/README.md`, wörtlich kopiert. Ergebnis ANGENOMMEN, auch über GF(2) und GF(3)
- `tests/daten/2x2x2-r7-strassen69-falsch.json`: dasselbe mit dem Vorzeichenfehler aus Abschnitt 7 des Formats (M2, `w[1][1]` = 1). Ergebnis ABGELEHNT mit genau 2 verletzten Gleichungen, wie dort vorhergesagt. Über GF(2) richtigerweise ANGENOMMEN, weil der Fehler 2 = 0 ist
- Schulmethode für mehrere rechteckige Formate; dieselbe mit transponiertem `w` wird abgelehnt (prüft die Richtung von `w`)
- Brüche über `Q` und deren Primteiler, Nullprodukte
- je ein Fall für jede FEHLERHAFT-Bedingung aus den Schritten 1 bis 6

## Entscheidungen, wo das Format schweigt

Diese Punkte hat der Verfasser festgelegt. Weicht Programm 2 hier ab, kann dieselbe Datei unterschiedlich beurteilt werden; das ist dann eine Formatfrage für den Orchestrator, kein Rechenfehler.

1. Strenger als das Format verlangt, alles FEHLERHAFT: doppelte JSON-Schlüssel; JSON-Zahlen mit Punkt oder Exponent sowie `NaN`/`Infinity` irgendwo in der Datei; `true`/`false` als Ganzzahl; unbekannte Schlüssel auch in `origin` und in den Produkten (nicht nur oben); `origin`-Werte, die keine Zeichenketten sind; `origin.created` nicht in der Form JJJJ-MM-TT (nur die Form, kein Kalendertest); `claim`/`notes`, die keine Zeichenketten sind.
2. Dateiname: verglichen wird der letzte Teil des Pfads. Zahlen im Dateinamen ohne führende Null.
3. `"-0"` passt zum regulären Ausdruck und gilt als 0.
4. GF(p): p wird mit einem Miller-Rabin-Test geprüft, der unterhalb 3,3·10^24 sicher ist. Größere p lehnt das Programm als FEHLERHAFT ab („zu groß“), statt zu raten. Für das Projekt genügen kleine p.
5. Die Primteiler der Nenner werden aus dem kleinsten gemeinsamen Vielfachen aller gekürzten Nenner bestimmt. Einen Restfaktor über 10^12, den das Programm nicht sicher zerlegen kann, nennt es als Restfaktor.
6. Hinweiszeilen erscheinen auch bei ABGELEHNT.
7. Falsche Anzahl von Argumenten: `FEHLERHAFT`, Rückgabewert 2.
