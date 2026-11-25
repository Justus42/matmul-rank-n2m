# Prüfprogramm 1 (Python), Auftrag A-08

Angepasst an Abschnitt 9 und 10 von `verfahren/README.md` im Auftrag S1-07 (25.11.2026). Der Verfasser von S1-07 hat Programm 2 (`pruefer/rust/`) weder als Code noch als Zweig oder Pull Request gesehen.

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

Rückgabewert 0, 1 oder 2. Bei falscher Anzahl von Argumenten lautet die erste Zeile `FEHLERHAFT - <Grund>` (Abschnitt 9.7.1). Rückgabewert 3 gibt es nur bei einem Fehler im Programm selbst (siehe unten). Die sechs Indizes gehören zur Gleichung Σ_r u_r[i][j] · v_r[j'][l] · w_r[i'][l'] aus Abschnitt 2 des Formats, `Wert` ist die berechnete Summe (bei GF(p) reduziert auf 0…p−1).

Weitere Zeilen, ohne Einfluss auf das Ergebnis:

- `VERLETZT ...` weitere verletzte Gleichungen, höchstens 10 insgesamt
- `HINWEIS products[r].u ist ganz null ...` (ebenso für `v`, `w`)
- `HINWEIS Primteiler der Nenner: ...` bei Zahlbereich `Q`; `keine`, wenn alle Koeffizienten ganz sind

## Tests

```
cd pruefer/python
python3 -m unittest discover -s tests
```

89 Tests (Stand S1-07), darunter:

- `tests/daten/2x2x2-r7-strassen69.json`: Strassens Beispiel aus `verfahren/README.md`, wörtlich kopiert. Ergebnis ANGENOMMEN, auch über GF(2) und GF(3)
- `tests/daten/2x2x2-r7-strassen69-falsch.json`: dasselbe mit dem Vorzeichenfehler aus Abschnitt 7 des Formats (M2, `w[1][1]` = 1). Ergebnis ABGELEHNT mit genau 2 verletzten Gleichungen, wie dort vorhergesagt. Über GF(2) richtigerweise ANGENOMMEN, weil der Fehler 2 = 0 ist
- Schulmethode für mehrere rechteckige Formate; dieselbe mit transponiertem `w` wird abgelehnt (prüft die Richtung von `w`)
- Brüche über `Q` und deren Primteiler, Nullprodukte
- je ein Fall für jede FEHLERHAFT-Bedingung aus den Schritten 1 bis 6
- Klassen `Test91Json` bis `Test97Output`: für jede Regel aus Abschnitt 9 des Formats mindestens ein Testfall, benannt nach der Nummer der Regel (etwa `test_913_lone_surrogates`). Jeder FEHLERHAFT-Fall prüft auch, dass genau eine Zeile ausgegeben wird (9.7.6)
- `test_976_one_line_despite_control_characters`, `test_976_one_line_despite_file_name`: Steuerzeichen in Koeffizienten, Freitexten, `ring`, `id` und im Dateinamen brechen die FEHLERHAFT-Zeile nicht um (Nachfrage des Orchestrators zu 9.7.6)
- `TestProjectSchemes`: die beiden Dateien `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` werden ANGENOMMEN

## Randfälle

Maßgeblich ist Abschnitt 9 von `verfahren/README.md` (Auftrag S1-04). Das Programm folgt ihm seit Auftrag S1-07 in allen Punkten. Im Einzelnen, mit der Stelle im Code:

| Regel | Umsetzung |
|---|---|
| 9.1.1 | UTF-8 streng dekodiert; Byte-Order-Mark ausdrücklich abgelehnt; `NaN`, `Infinity`, `-Infinity`, Gleitkommazahlen, Kommentare, nachgestellte Kommas und weiterer Inhalt nach dem JSON-Wert werden von `json.loads` mit `parse_constant`/`parse_float` abgelehnt |
| 9.1.2 | `object_pairs_hook` lehnt doppelte Schlüssel in jedem Objekt ab, verglichen nach dem Dekodieren |
| 9.1.3 | `_reject_lone_surrogates` durchsucht nach dem Laden alle Schlüssel und Zeichenketten nach U+D800 bis U+DFFF. Gültige Paare hat `json` schon zu einem Zeichen zusammengesetzt |
| 9.1.4, 9.1.5 | dekodierte Werte zählen; oberste Ebene muss ein Objekt sein |
| 9.2.1 | genau die erlaubten Schlüssel oben, in `origin` und in Produkten |
| 9.2.2 | Ganzzahlfelder nur als JSON-Ganzzahl (kein `bool`), Wert ≥ 1 |
| 9.2.3, 9.2.4 | `_check_text`: `claim`, `notes` und alle Werte in `origin` sind Zeichenketten mit mindestens einem Zeichen außer Leerzeichen, Tabulator, LF, CR. `null` ist keine Zeichenkette |
| 9.2.5 | `derived_from` muss zum `id`-Muster passen (`ID_RE`) |
| 9.2.6 | Form von `products`, `u`, `v`, `w` (Schritt 5), Koeffizienten nur Zeichenketten |
| 9.3 | `check_date`: Muster mit ASCII-Ziffern, dann `datetime.date`, also gregorianisch mit Jahr 1 bis 9999 |
| 9.4.1 | letzter Teil des Pfads, Endung genau `.json`, `id` gleich dem Rest |
| 9.4.2 | `ID_RE` mit `fullmatch`: Zahlen ohne führende Null, Kurzname ohne Bindestrich am Rand und ohne doppelten Bindestrich |
| 9.5.1 | alle Muster mit `fullmatch` und `[0-9]` (nicht `\d`, nicht `$`) |
| 9.5.2, 9.5.3 | `"-0"`, `"0/5"`, `"-0/5"` sind 0; Bruchstrich nur bei `Q` |
| 9.5.4 | `sys.set_int_max_str_digits(0)` beim Laden des Moduls. Ohne das bricht Python bei Zahlen ab 4301 Stellen mit `ValueError` ab |
| 9.6.1 | `Z`, `Q` oder `GF(p)` mit `fullmatch` |
| 9.6.2 | p ≥ 2^64 ist FEHLERHAFT. Darunter Miller-Rabin mit den ersten 13 Primzahlen als Basen; das ist bis 3,3·10^24 sicher, also im ganzen erlaubten Bereich |
| 9.7.1 | falsche Anzahl von Argumenten: `FEHLERHAFT - <Grund>`, Rückgabewert 2 |
| 9.7.2, 9.7.3 | nicht lesbare Datei (auch Ordner): FEHLERHAFT mit dem letzten Teil des Pfads |
| 9.7.4 | alle Prüfungen der Schritte 1 bis 6 laufen vor der Rechnung; ABGELEHNT nur ohne jeden solchen Fehler |
| 9.7.6 | bei FEHLERHAFT nur eine Zeile, Hinweise nur bei ANGENOMMEN und ABGELEHNT. `one_line` ersetzt in Dateiname und Grund alle nicht druckbaren Zeichen durch `\xNN`, `\uNNNN` oder `\UNNNNNNNN`, damit kein Steuerzeichen die Zeile umbricht (etwa der Koeffizient `"1\n"` oder ein Dateiname mit Zeilenvorschub) |
| 9.7.7 | Primteiler der Nenner per Probedivision bis 10^6 und Primtest; einen Rest, der so nicht zerlegt wird, nennt die Zeile als Restfaktor |

## Entscheidungen, wo auch Abschnitt 9 schweigt

1. Ein Fehler im Programm selbst (eine unerwartete Ausnahme) führt zur ersten Zeile `INTERNER-FEHLER <Dateiname> <Ausnahme>` und Rückgabewert 3. Grund: Python beendet sich bei einer nicht abgefangenen Ausnahme mit Rückgabewert 1, und das sähe aus wie ABGELEHNT. Mit den Tests ist dieser Fall nur künstlich auslösbar.
2. Der Grund in der FEHLERHAFT-Zeile und die `VERLETZT`-Zeilen sind freier Text (9.7.5). Das Programm nennt bei ABGELEHNT die Anzahl der verletzten Gleichungen und höchstens 10 davon.
