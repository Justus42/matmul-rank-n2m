# Verfahren

Hier liegen Multiplikationsverfahren als Datendateien, eine Datei pro Verfahren. Diese Datei legt das Datenformat fest (Auftrag A-07). Die Prüfprogramme aus A-08 und A-09 lesen genau dieses Format und nichts sonst.

Stand: Formatversion 1, 25.11.2026, ergänzt um die Randfälle aus Auftrag S1-04 (Abschnitt 9). Die Ergänzung ändert die Formatversion nicht. Annahmen, die der Orchestrator bestätigen oder ändern sollte (Protokoll 11.1 und 11.2), sind mit **[Annahme]** markiert und am Ende gesammelt.

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
- Unbekannte Schlüssel sind überall ein Fehler: auf oberster Ebene, in `origin` und in jedem Produkt (Abschnitt 9.2). Zusätzliche Angaben gehören nach `notes`

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
| `created` | ja | gültiges Kalenderdatum im Format JJJJ-MM-TT (Abschnitt 9.3) |
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

1. Datei ist gültiges JSON in UTF-8, alle Pflichtfelder da, keine unbekannten Schlüssel (oben, in `origin`, in Produkten), alle Typen wie in Abschnitt 9
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

Diese Punkte hat der Verfasser selbst entschieden. Sie gelten als vorläufig, bis der Orchestrator sie bestätigt oder ändert. Rückfragen dazu gehen an den Orchestrator (Protokoll 11.1).

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

---

## 9. Randfälle (Auftrag S1-04)

Festgelegt am 25.11.2026 im Auftrag S1-04. Wo die Abschnitte 1 bis 8 schweigen, gilt diese Liste. Sie schließt die Fälle, die die Prüfprogramme A-08 und A-09 in ihren READMEs selbst entschieden haben. Grundsatz: Von zwei Lesarten gilt die strengere. Im Zweifel ist eine Datei FEHLERHAFT.

Drei Punkte hat der Orchestrator vorgegeben: unbekannte Zusatzschlüssel überall FEHLERHAFT (9.2.1), ungültiges Kalenderdatum FEHLERHAFT (9.3), doppelte JSON-Schlüssel FEHLERHAFT (9.1.2).

Alle Fälle dieses Abschnitts gehören zu den Schritten 1 bis 6 aus Abschnitt 6, führen also zu FEHLERHAFT mit Rückgabewert 2.

### 9.1 JSON und Kodierung

1. Die Datei ist genau ein JSON-Text nach RFC 8259 in UTF-8. FEHLERHAFT sind: ungültiges UTF-8, ein Byte-Order-Mark am Anfang, weiterer Inhalt nach dem JSON-Wert (außer Leerraum nach RFC 8259), `NaN`, `Infinity` und `-Infinity`, Kommentare, nachgestellte Kommas.
2. Doppelte Schlüssel in irgendeinem Objekt der Datei: FEHLERHAFT.
3. Eine Escape-Folge `\u` für ein einzelnes Surrogat ohne passendes Gegenstück (etwa `"\ud800"`): FEHLERHAFT.
4. Andere Escape-Folgen sind erlaubt. Maßgeblich ist der dekodierte Wert: `"1"` ist dasselbe wie `"1"`, der Schlüssel `"u"` dasselbe wie `"u"`.
5. Der oberste JSON-Wert ist ein Objekt. Alles andere (Liste, Zeichenkette, Zahl, `null`) ist FEHLERHAFT.

### 9.2 Schlüssel und Typen

1. Unbekannte Schlüssel sind überall FEHLERHAFT. Erlaubt sind auf oberster Ebene genau die elf Schlüssel aus der Feldtabelle in Abschnitt 3, in `origin` genau die fünf Schlüssel aus der Herkunftstabelle, in einem Produkt genau `u`, `v` und `w`. Weitere Angaben gehören in `notes`.
2. Ganzzahlfelder (`format_version`, `n`, `k`, `m`, `rank`) sind JSON-Zahlen ohne Dezimalpunkt und ohne Exponent. FEHLERHAFT sind etwa `2.0`, `2e0`, `"2"`, `true`, `false`, `null`. Werte unter 1 sind FEHLERHAFT (Feldtabelle).
3. `origin` ist ein Objekt. Jeder Wert in `origin` sowie `claim` und `notes` ist eine Zeichenkette. Andere Typen, auch `null`, sind FEHLERHAFT. Ein optionaler Schlüssel (`claim`, `notes`, `origin.derived_from`) darf fehlen, aber nicht den Wert `null` haben.
4. Jede vorhandene Zeichenkette in `origin`, `claim` und `notes` enthält mindestens ein Zeichen außer Leerzeichen, Tabulator, Zeilenvorschub und Wagenrücklauf. Leere oder nur aus diesen vier Zeichen bestehende Zeichenketten sind FEHLERHAFT.
5. `origin.derived_from` hat, wenn vorhanden, dieselbe Form wie eine `id` (9.4.2). Ob es ein Verfahren dieses Namens gibt, prüfen die Programme nicht.
6. `products` ist eine Liste, jeder Eintrag ein Objekt. `u`, `v` und `w` sind Listen von Listen von Zeichenketten mit genau der Form aus Schritt 5 in Abschnitt 6. Ungleich lange Zeilen, eine JSON-Zahl als Koeffizient oder `null` an irgendeiner Stelle sind FEHLERHAFT.

### 9.3 Datum

`origin.created` besteht aus genau zehn Zeichen in der Form JJJJ-MM-TT, nur ASCII-Ziffern 0 bis 9 und zwei Bindestriche. Es ist ein gültiges Datum im gregorianischen Kalender mit Jahr 0001 bis 9999 (Schaltjahre nach gregorianischer Regel). FEHLERHAFT sind etwa `2026-02-30`, `2026-13-01`, `2026-1-5`, `0000-01-01`, `2026-11-25T10:00`. Ein Datum in der Zukunft ist kein Fehler.

### 9.4 Dateiname und `id`

1. Der Dateiname ist der letzte Teil des Pfads. Er endet genau auf `.json` in Kleinbuchstaben. `id` ist byteweise gleich dem Dateinamen ohne diese Endung.
2. `id` passt vollständig zu diesem regulären Ausdruck, nur ASCII:

   ```
   ([1-9][0-9]*)x([1-9][0-9]*)x([1-9][0-9]*)-r([1-9][0-9]*)-([a-z0-9]+(-[a-z0-9]+)*)
   ```

   Die vier Zahlen sind ohne führende Null geschrieben und gleich `n`, `k`, `m` und `rank`. Der Kurzname beginnt und endet nicht mit einem Bindestrich und enthält keine zwei Bindestriche hintereinander.

### 9.5 Koeffizienten

1. Der reguläre Ausdruck aus Abschnitt 3 muss die **ganze** Zeichenkette treffen. Ein angehängter Zeilenvorschub (`"1\n"`), Ziffern außerhalb von ASCII oder Unterstriche (`"1_0"`) sind FEHLERHAFT, auch wenn eine Programmbibliothek sie als Zahl lesen würde.
2. `"-0"`, `"0/5"` und `"-0/5"` passen zum regulären Ausdruck und haben den Wert 0. `"1/1"` hat den Wert 1. Ungekürzte Brüche sind erlaubt (Abschnitt 3).
3. Bei `"Z"` und `"GF(p)"` ist jeder Bruchstrich FEHLERHAFT, auch `"2/1"`.
4. Zähler und Nenner haben keine Größengrenze. Die Programme rechnen mit beliebig großen ganzen Zahlen.

### 9.6 Zahlbereich

1. `ring` ist genau `"Z"`, `"Q"` oder `"GF(p)"` mit p in ASCII-Dezimalziffern ohne führende Null. FEHLERHAFT sind etwa `"GF(02)"`, `"GF( 2)"`, `"gf(2)"`, `"GF(2) "`, `"z"`.
2. Für `"GF(p)"` gilt 2 ≤ p < 2^64, und p ist eine Primzahl. Ein p ab 2^64 ist FEHLERHAFT, auch wenn es prim ist. Der Primtest muss in diesem Bereich sicher sein (kein Zufallstest).

### 9.7 Aufruf und Ausgabe

1. Genau ein Argument. Sonst ist die erste Zeile `FEHLERHAFT - <Grund>` (ein Bindestrich anstelle des Dateinamens), Rückgabewert 2.
2. Eine Datei, die nicht existiert oder nicht gelesen werden kann: FEHLERHAFT, Rückgabewert 2.
3. Der Dateiname in der FEHLERHAFT-Zeile ist der letzte Teil des Pfads.
4. Trifft irgendeine Bedingung aus den Schritten 1 bis 6 zu, ist das Ergebnis FEHLERHAFT, gleich in welcher Reihenfolge ein Programm prüft. Der Grund ist freier Text; bei mehreren Fehlern darf jedes Programm einen anderen nennen. ABGELEHNT gibt es nur bei einer Datei ohne jeden Fehler aus den Schritten 1 bis 6.
5. Maßgeblich für den Vergleich der beiden Programme sind das erste Wort der ersten Zeile und der Rückgabewert. Bei ANGENOMMEN ist die ganze erste Zeile festgelegt (Abschnitt 6) und muss bei beiden gleich sein. Wortlaut des Grundes, Anzahl der `VERLETZT`-Zeilen und die Wahl der ersten genannten verletzten Gleichung sind frei.
6. Hinweiszeilen erscheinen bei ANGENOMMEN und ABGELEHNT, nicht bei FEHLERHAFT.
7. Der Hinweis zu den Primteilern der Nenner nennt entweder alle Primteiler oder sagt ausdrücklich, welcher Restfaktor nicht zerlegt wurde. Bis zu welcher Größe ein Programm zerlegt, ist frei. Der Hinweis ändert das Ergebnis nicht.

---

## 10. Anpassungsbedarf der Prüfprogramme nach Abschnitt 9

Grundlage sind nur die READMEs der beiden Programme, nicht ihr Code. „Muss" heißt: Die README beschreibt ein Verhalten, das Abschnitt 9 widerspricht. „Prüfen" heißt: Die README schweigt dazu, das Programm muss daraufhin angesehen und getestet werden. Die Änderungen an den Programmen sind nicht Teil von S1-04.

### Programm 1, Python (`pruefer/python/`, A-08)

- **Muss:** `origin.created` als Kalenderdatum prüfen (9.3). Laut README wird nur die Form geprüft, `2026-02-30` wird angenommen.
- **Muss:** `GF(p)` mit p ≥ 2^64 als FEHLERHAFT ablehnen (9.6.2). Laut README sind p bis 3,3·10^24 erlaubt.
- Prüfen: einzelne Surrogate in `\u`-Folgen (9.1.3); Pythons `json` lässt sie in der Grundeinstellung durch.
- Prüfen: Byte-Order-Mark am Anfang (9.1.1), etwa beim Lesen mit `utf-8-sig`.
- Prüfen: nur ASCII-Ziffern in Datum, `id` und `ring` (9.3, 9.4.2, 9.6.1); `\d` in Pythons `re` trifft auch andere Ziffern.
- Prüfen: vollständiger Treffer des Koeffizienten-Ausdrucks (9.5.1); `$` in Pythons `re` lässt einen angehängten Zeilenvorschub zu.
- Prüfen: Zeichenketten ohne sichtbaren Inhalt (9.2.4), `null` bei optionalen Schlüsseln (9.2.3), Form von `derived_from` (9.2.5), Form des Kurznamens (9.4.2), Endung genau `.json` (9.4.1), Jahr 0000 (9.3).
- Prüfen: keine Hinweiszeilen bei FEHLERHAFT (9.7.6).

### Programm 2, Rust (`pruefer/rust/`, A-09)

- **Muss:** unbekannte Schlüssel in `origin` als FEHLERHAFT ablehnen (9.2.1). Laut README sind sie dort erlaubt.
- Prüfen: Typen in `origin`, `claim` und `notes`, auch `null` (9.2.3).
- Prüfen: `true`, `false` und `null` als Ganzzahl (9.2.2).
- Prüfen: falsche Anzahl von Argumenten (9.7.1) und nicht lesbare Datei (9.7.2).
- Prüfen: führende Nullen im Dateinamen und Form des Kurznamens (9.4.2), Endung genau `.json` (9.4.1).
- Prüfen: Zeichenketten ohne sichtbaren Inhalt (9.2.4), Form von `derived_from` (9.2.5), Jahr 0000 (9.3).
- Prüfen: Byte-Order-Mark und einzelne Surrogate (9.1.1, 9.1.3).
- Prüfen: keine Hinweiszeilen bei FEHLERHAFT (9.7.6).

### Beide Programme

- Für jede Regel aus Abschnitt 9 einen Testfall mit Erwartung FEHLERHAFT oder ANGENOMMEN anlegen, damit Abweichungen zwischen den Programmen auffallen.
- Die Listen der selbst entschiedenen Punkte in beiden READMEs auf Abschnitt 9 verweisen lassen.

### Bestehende Verfahrensdateien

`3x2x5-r25-hk71.json` und `3x2x6-r30-hk71.json` haben keine Zusatzschlüssel in `origin`, ein gültiges Datum und keinen Koeffizienten `"-0"`. Nach Augenschein des Verfassers verletzen sie Abschnitt 9 nicht; das ist keine Prüfung nach Abschnitt 5.2.
