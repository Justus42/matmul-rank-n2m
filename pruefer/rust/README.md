# Prüfprogramm 2 (Rust, Auftrag A-09)

Status: **behauptet**. Das Programm ist geschrieben und an Testfällen gelaufen. Als Prüfprogramm nach Abschnitt 5.2 des Protokolls zählt es erst zusammen mit Programm 1 (A-08); ob es selbst richtig rechnet, hat noch niemand außer seinem Verfasser nachgesehen.

Unabhängigkeit: Der Verfasser hat Code, Zweig und Pull Request von Programm 1 (`pruefer/python/`) nicht angesehen. Grundlage waren nur `PROTOKOLL.md` und `verfahren/README.md` (Formatversion 1).

## Bauen und aufrufen

Benötigt Rust ab 1.70 (getestet mit rustc 1.97.0).

```
cd pruefer/rust
cargo build --release
./target/release/pruefer ../../verfahren/<datei>.json
cargo test            # Testfälle
```

Ein Dateipfad als einziges Argument. Ausgabe und Rückgabewerte wie in Abschnitt 6 von `verfahren/README.md`:

```
ANGENOMMEN <id> <n>x<k>x<m> rank=<rank> ring=<ring>      Rückgabe 0
ABGELEHNT <id> <Anzahl> von <Gesamt> Gleichungen verletzt, erste: i=.. j=.. j'=.. l=.. i'=.. l'=.. Wert=.. Soll=..   Rückgabe 1
FEHLERHAFT <Dateiname> <Grund>                           Rückgabe 2
```

Ab Zeile 2 folgen bei ABGELEHNT bis zu 20 Zeilen `VERLETZT ...` mit allen sechs Indizes, danach Hinweise `HINWEIS ...` (Produkte mit ganz nullem `u`, `v` oder `w`; bei `ring` = `Q` die Primteiler der gekürzten Nenner). Hinweise ändern das Ergebnis nicht.

## Was gerechnet wird

Für alle i, i' < n, j, j' < k, l, l' < m wird die Summe über r von `u_r[i][j] · v_r[j'][l] · w_r[i'][l']` exakt berechnet und mit 1 (falls i = i', j = j', l = l') oder 0 verglichen. Das sind alle (nk)(km)(nm) Gleichungen aus Abschnitt 2 des Formats; `w` wird nicht transponiert gelesen.

Arithmetik: Brüche aus ganzen Zahlen beliebiger Größe (`num-rational` über `num-bigint`), stets gekürzt. Bei `GF(p)` wird die ganzzahlige Summe am Ende mod p reduziert. Gleitkommazahlen kommen in keiner Rechnung vor. JSON-Zahlen mit Komma oder Exponent werden beim Einlesen nur als „keine Ganzzahl" vermerkt, ihr Wert wird verworfen.

## Auslegungen des Formats

Wo `verfahren/README.md` nichts sagt, hat der Verfasser so entschieden (Rückfragen an den Orchestrator):

1. Doppelte Schlüssel in einem JSON-Objekt: FEHLERHAFT.
2. Unbekannte Schlüssel in einem Produkt (außer `u`, `v`, `w`): FEHLERHAFT. In `origin` sind zusätzliche Schlüssel erlaubt.
3. `origin.created` muss ein gültiges Kalenderdatum JJJJ-MM-TT sein.
4. `"-0"` passt zum regulären Ausdruck und ist erlaubt.
5. Bei `GF(p)` muss p kleiner als 2^64 sein, sonst FEHLERHAFT. Der Primtest ist ein deterministischer Miller-Rabin-Test für 64-Bit-Zahlen.
6. Ein Dateiname in der FEHLERHAFT-Zeile ist der letzte Teil des Pfads, nicht der ganze Pfad.
7. Nenner werden bis 10^6 durch Probedivision zerlegt. Bleibt ein größerer zusammengesetzter Rest, nennt ein eigener Hinweis ihn unzerlegt.
8. Reihenfolge der Schritte 1 bis 6 wie in Abschnitt 6; innerhalb von Schritt 6 wird zuerst `ring`, dann jeder Koeffizient geprüft.

## Tests

`cargo test` lief am 25.11.2026 mit 17 Tests ohne Fehler (5 Einheitstests, 12 Ende-zu-Ende-Tests). Die Testdateien liegen unter `tests/daten/`:

| Datei | Erwartung | Ergebnis |
|---|---|---|
| `2x2x2-r7-strassen69.json` (Strassen aus `verfahren/README.md`) | ANGENOMMEN | ANGENOMMEN |
| `2x2x2-r7-strassen69-falsch.json` (Produkt 1, `w[1][1]` von -1 auf 1) | ABGELEHNT, 2 Gleichungen | ABGELEHNT, 2 von 64, i=1 j=0/1 j'=0 l=0 i'=1 l'=1 Wert=2 |
| `2x2x2-r7-strassen69-falsch-gf2.json` (dieselbe falsche Fassung über GF(2)) | ANGENOMMEN, da -1 = 1 | ANGENOMMEN |
| `2x2x2-r7-strassen69-falsch-gf3.json` | ABGELEHNT | ABGELEHNT |
| `2x2x2-r7-strassen69-q.json` (Produkte umskaliert mit 2 und 1/2, 3 und 1/3) | ANGENOMMEN, Nenner 2, 3 | ANGENOMMEN, Hinweis 2, 3 |

Weitere Tests erzeugen Dateien zur Laufzeit: die Schulmethode für 3×2×5, 4×2×4, 1×3×2 und 2×1×3 (angenommen), dieselbe mit transponiertem `w` (bei 2×2×2 abgelehnt, bei 2×2×3 FEHLERHAFT wegen der Form), jede der 84 einzelnen Koeffizientenänderungen an Strassen (jedes Mal abgelehnt) und je einen Fall für die FEHLERHAFT-Gründe aus den Schritten 1 bis 6. Ein Test liest den JSON-Block aus Abschnitt 7 von `verfahren/README.md` unverändert und verlangt ANGENOMMEN.

Bekannte Verfahren für 3×2×5 und 3×2×6 (Stufe 0) sind hier nicht getestet; das ist Auftrag A-10.

## Abhängigkeiten und Lizenzen

Eigener Code steht unter der Lizenz des Repos (Apache 2.0). Fremder Code wird nicht kopiert, sondern als Abhängigkeit über crates.io eingebunden (Protokoll 11.3, Verweis statt Kopie); die genauen Fassungen hält `Cargo.lock` fest.

| Crate | Zweck | Lizenz |
|---|---|---|
| num-bigint 0.4, num-rational 0.4, num-integer 0.1, num-traits 0.2 | ganze Zahlen und Brüche beliebiger Größe | MIT oder Apache 2.0 |
| serde 1, serde_json 1 | JSON lesen | MIT oder Apache 2.0 |

Indirekte Abhängigkeiten stehen ebenfalls unter MIT, Apache 2.0 oder Unlicense (unicode-ident zusätzlich Unicode-3.0).
