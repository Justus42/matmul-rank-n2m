# Verfahren

Hier liegen Multiplikationsverfahren als Datendateien, eine Datei pro Verfahren. Diese Datei legt das Datenformat fest (Auftrag A-07). Die Prüfprogramme aus A-08 und A-09 lesen genau dieses Format und nichts sonst.

Stand: erste Fassung, Formatversion 1, 25.11.2026. Annahmen, die Justus bestätigen oder ändern sollte, sind mit **[Annahme]** markiert und am Ende gesammelt.

---

## 1. Was eine Datei behauptet

Eine Verfahrensdatei behauptet: Mit den angegebenen `rank` Produkten lässt sich das Produkt C = A·B einer n×k-Matrix A mit einer k×m-Matrix B berechnen, über dem angegebenen Zahlbereich. Im Projekt ist immer k = 2.

Die Datei selbst trägt **keinen** Status. Ob ein Verfahren geprüft ist, steht allein in der zugehörigen Datei unter `behauptungen/` (Prüfung nach Abschnitt 5.2 des Protokolls). Eine Datei in diesem Ordner hat zunächst höchstens den Status behauptet. **[Annahme]**

## 2. Mathematische Bedeutung

Jedes Produkt r = 1, …, R besteht aus drei Koeffizientenmatrizen:

| Feld | Größe | Bedeutung |
|---|---|---|
| `u` | n×k | Linearform in den Einträgen von A: a_r = Σ u[i][j] · A[i][j] |
| `v` | k×m | Linearform in den Einträgen von B: b_r = Σ v[j][l] · B[j][l] |
| `w` | n×m | Beitrag des Produkts zu C: C[i][l] += w[i][l] · (a_r · b_r) |

Wichtig: `w` ist **nicht transponiert**. `w[i][l]` gehört zum Eintrag C[i][l] in Zeile i, Spalte l. (In Teilen der Literatur, etwa bei AlphaTensor, wird der dritte Faktor transponiert gespeichert. Wer ein Verfahren von dort übernimmt, muss umrechnen.)

Das Verfahren ist richtig genau dann, wenn für alle Indizes gilt:

```
Σ_r  u_r[i][j] · v_r[j'][l] · w_r[i'][l']  =  1, falls i = i', j = j', l = l'
                                           =  0  sonst
```

mit i, i' aus 0…n−1, j, j' aus 0…k−1, l, l' aus 0…m−1. Das sind (nk)·(km)·(nm) Gleichungen. Gerechnet wird exakt im angegebenen Zahlbereich (siehe Abschnitt 4), niemals mit Gleitkommazahlen.

Indizes zählen ab 0, Matrizen werden zeilenweise gespeichert: `u[i]` ist Zeile i, `u[i][j]` der Eintrag in Zeile i, Spalte j.

## 3. Dateiformat

- JSON nach RFC 8259, Kodierung UTF-8 **[Annahme]**
- Dateiendung `.json`
- Schlüssel englisch, weil Programme sie lesen (CLAUDE.md, Punkt 10) **[Annahme]**
- Unbekannte Schlüssel auf oberster Ebene sind ein Fehler. Zusätzliche Angaben gehören nach `notes` oder `origin`

### Felder

| Schlüssel | Typ | Pflicht | Inhalt |
|---|---|---|---|
| `format_version` | Ganzzahl | ja | immer `1` für diese Fassung |
| `id` | Zeichenkette | ja | gleich dem Dateinamen ohne `.json` (siehe Abschnitt 5) |
| `n` | Ganzzahl ≥ 1 | ja | Zeilen von A und C |
| `k` | Ganzzahl ≥ 1 | ja | Spalten von A, Zeilen von B; im Projekt immer `2` |
| `m` | Ganzzahl ≥ 1 | ja | Spalten von B und C |
| `rank` | Ganzzahl ≥ 1 | ja | Anzahl der Produkte; muss gleich der Länge von `products` sein |
| `ring` | Zeichenkette | ja | Zahlbereich, siehe Abschnitt 4 |
| `origin` | Objekt | ja | Herkunft, siehe unten |
| `claim` | Zeichenkette | nein | Nummer der Behauptung, etwa `"B-005"` |
| `notes` | Zeichenkette | nein | freier Text, deutsch |
| `products` | Liste | ja | genau `rank` Einträge, jeder ein Objekt mit `u`, `v`, `w` |

### Koeffizienten

Jeder Koeffizient ist eine **Zeichenkette**, keine JSON-Zahl. Damit kann keine JSON-Bibliothek sie stillschweigend in Gleitkommazahlen verwandeln. **[Annahme]**

Erlaubte Schreibweisen (regulärer Ausdruck):

```
-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?
```

Also `"0"`, `"1"`, `"-1"`, `"3/2"`, `"-1/4"`. Nicht erlaubt: `"+1"`, `"01"`, `"1.5"`, `"1e2"`, Leerzeichen, Nenner `0`. Brüche müssen nicht gekürzt sein; die Prüfprogramme kürzen selbst. Ganze Zahlen ohne Bruchstrich sind erlaubt und üblich.

### Herkunft (`origin`)

| Schlüssel | Pflicht | Inhalt |
|---|---|---|
| `source` | ja | Quelle mit Fundstelle (Arbeit, Seite, Satz) oder `"eigene Suche"` |
| `method` | ja | wie die Datei entstand, etwa `"von Hand aus HK71, Abschnitt 3 übertragen"` oder `"Suchprogramm X, Lauf Y"` |
| `created` | ja | Datum im Format JJJJ-MM-TT |
| `created_by` | ja | Rolle und Auftrag, etwa `"Verfahrenssucher, A-10"` |
| `derived_from` | nein | `id` eines anderen Verfahrens, aus dem dieses umgeformt wurde |

## 4. Zahlbereich (`ring`)

| Wert | Koeffizienten | Prüfung rechnet in | Das Verfahren gilt dann |
|---|---|---|---|
| `"Z"` | nur ganze Zahlen | ℤ | über jedem Körper (und jedem Ring) |
| `"Q"` | Brüche erlaubt | ℚ | über jedem Körper, dessen Charakteristik keinen Nenner teilt |
| `"GF(p)"`, p Primzahl, etwa `"GF(2)"` | nur ganze Zahlen, werden mod p reduziert | ℤ/pℤ | über jedem Körper der Charakteristik p |

Bei `"Q"` geben die Prüfprogramme zusätzlich die Primteiler aller (gekürzten) Nenner aus. Das ist die Liste der Charakteristiken, für die das Verfahren **nicht** belegt ist.

Erweiterungskörper wie GF(4) sind in Formatversion 1 nicht vorgesehen. **[Annahme]** Sollte die Verfahrenssuche sie brauchen, kommt eine Formatversion 2.

## 5. Dateinamen

```
<n>x<k>x<m>-r<rank>-<kurzname>.json
```

Kurzname aus Kleinbuchstaben, Ziffern und Bindestrich, etwa die Quelle (`hk71`) oder eine laufende Nummer (`s001`). Beispiele:

- `3x2x5-r25-hk71.json`
- `4x2x4-r25-s001.json`

Der Teil vor dem Kurznamen muss zu `n`, `k`, `m` und `rank` in der Datei passen. Die Prüfprogramme prüfen das.

## 6. Was die Prüfprogramme tun

Beide Programme (A-08, A-09) prüfen unabhängig voneinander in dieser Reihenfolge:

1. Datei ist gültiges JSON in UTF-8, alle Pflichtfelder da, keine unbekannten Schlüssel oben
2. `format_version` ist `1`
3. `id` gleich Dateiname, Dateiname passt zu `n`, `k`, `m`, `rank`
4. `rank` gleich Länge von `products`
5. jedes `u` hat n Zeilen zu je k Einträgen, jedes `v` k Zeilen zu je m, jedes `w` n Zeilen zu je m
6. jeder Koeffizient passt zum regulären Ausdruck aus Abschnitt 3; bei `"Z"` und `"GF(p)"` kein Bruchstrich; bei `"GF(p)"` ist p eine Primzahl
7. alle Gleichungen aus Abschnitt 2 gelten exakt im Zahlbereich aus Abschnitt 4

Ausgabe auf der Standardausgabe, erste Zeile genau eine dieser drei:

```
ANGENOMMEN <id> <n>x<k>x<m> rank=<rank> ring=<ring>
ABGELEHNT <id> <Grund>
FEHLERHAFT <Dateiname> <Grund>
```

Rückgabewert: `0` bei ANGENOMMEN, `1` bei ABGELEHNT (Datei lesbar, Gleichungen verletzt), `2` bei FEHLERHAFT (Schritte 1 bis 6). Bei ABGELEHNT nennt das Programm mindestens eine verletzte Gleichung mit allen sechs Indizes und dem berechneten Wert. **[Annahme]**

Hinweise ohne Einfluss auf das Ergebnis, ab Zeile 2:

- Produkte, in denen `u`, `v` oder `w` ganz null ist (das Verfahren käme mit weniger Produkten aus)
- bei `"Q"` die Primteiler der Nenner (Abschnitt 4)

Aufruf: ein Dateipfad als einziges Argument. Mehrere Dateien prüft man mit mehreren Aufrufen.

## 7. Beispiel: Strassen, ⟨2,2,2⟩ mit 7 Produkten

Dateiname wäre `2x2x2-r7-strassen69.json`. Es dient nur der Anschauung und als erster Testfall für die Prüfprogramme. Die Produkte sind

- M1 = (A00 + A11)(B00 + B11), geht in C00 und C11
- M2 = (A10 + A11) B00, geht in C10, mit Minus in C11
- M3 = A00 (B01 − B11), geht in C01 und C11
- M4 = A11 (B10 − B00), geht in C00 und C10
- M5 = (A00 + A01) B11, geht mit Minus in C00, in C01
- M6 = (A10 − A00)(B00 + B01), geht in C11
- M7 = (A01 − A11)(B10 + B11), geht in C00

```json
{
  "format_version": 1,
  "id": "2x2x2-r7-strassen69",
  "n": 2, "k": 2, "m": 2,
  "rank": 7,
  "ring": "Z",
  "origin": {
    "source": "V. Strassen, Gaussian elimination is not optimal, Numer. Math. 13 (1969), 354-356",
    "method": "von Hand übertragen",
    "created": "2026-11-25",
    "created_by": "Verfahrenssucher, A-07 (Beispiel)"
  },
  "products": [
    {"u": [["1","0"],["0","1"]],  "v": [["1","0"],["0","1"]],  "w": [["1","0"],["0","1"]]},
    {"u": [["0","0"],["1","1"]],  "v": [["1","0"],["0","0"]],  "w": [["0","0"],["1","-1"]]},
    {"u": [["1","0"],["0","0"]],  "v": [["0","1"],["0","-1"]], "w": [["0","1"],["0","1"]]},
    {"u": [["0","0"],["0","1"]],  "v": [["-1","0"],["1","0"]], "w": [["1","0"],["1","0"]]},
    {"u": [["1","1"],["0","0"]],  "v": [["0","0"],["0","1"]],  "w": [["-1","1"],["0","0"]]},
    {"u": [["-1","0"],["1","0"]], "v": [["1","1"],["0","0"]],  "w": [["0","0"],["0","1"]]},
    {"u": [["0","1"],["0","-1"]], "v": [["0","0"],["1","1"]],  "w": [["1","0"],["0","0"]]}
  ]
}
```

Status dieses Beispiels: **behauptet**. Der Verfasser dieser Datei hat es mit einem Wegwerf-Skript nachgerechnet; das zählt nach Abschnitt 5.2 des Protokolls nicht als Prüfung. Ein absichtlich falscher Vorzeichenwechsel (in M2 `w[1][1]` von `"-1"` auf `"1"`) verletzt 2 Gleichungen und taugt als Gegenprobe für die Prüfprogramme.

## 8. Gesammelte Annahmen

Diese Punkte hat der Verfasser selbst entschieden. Sie gelten, bis Justus sie bestätigt oder ändert.

1. JSON statt eines eigenen Textformats. Grund: beide Prüfsprachen haben fertige JSON-Leser, das senkt die Fehlerquelle „eigener Parser".
2. Englische Schlüssel, deutsche Freitexte in `notes` und `origin`.
3. Koeffizienten als Zeichenketten, nicht als JSON-Zahlen.
4. Allgemeines k im Format, obwohl das Projekt nur k = 2 braucht. Kostet nichts und erlaubt Tests mit bekannten Verfahren anderer Formate.
5. Dichte Speicherung (volle Matrizen statt nur der Einträge ungleich null). Bei den Projektgrößen (größte Ziele 4×2×5 und 3×2×7, höchstens 35 Produkte) bleiben die Dateien klein, und die Prüfprogramme werden einfacher.
6. Der dritte Faktor `w` ist nicht transponiert (Abschnitt 2).
7. Kein Status in der Verfahrensdatei; der Status lebt in `behauptungen/`.
8. Nur ℤ, ℚ und Primkörper GF(p); keine Erweiterungskörper.
9. Ausgabeformat und Rückgabewerte der Prüfprogramme wie in Abschnitt 6.
10. Keine Prüfsumme in der Datei. Welche Fassung geprüft wurde, belegt der Git-Commit, der in der Behauptungsdatei steht.
