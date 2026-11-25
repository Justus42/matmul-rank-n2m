# Prüfprogramm 2 (Rust, Auftrag A-09)

Status: **behauptet**. Das Programm ist geschrieben und an Testfällen gelaufen. Angepasst an Abschnitt 9 des Formats in Auftrag S1-08 (25.11.2026). Als Prüfprogramm nach Abschnitt 5.2 des Protokolls zählt es erst zusammen mit Programm 1 (A-08); ob es selbst richtig rechnet, hat noch niemand außer seinem Verfasser nachgesehen.

Unabhängigkeit: Die Verfasser von A-09 und S1-08 haben Code, Zweig und Pull Request von Programm 1 (`pruefer/python/`) nicht angesehen. Grundlage waren nur `PROTOKOLL.md` und `verfahren/README.md` (Formatversion 1 mit Abschnitt 9 und 10).

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

## Randfälle (Abschnitt 9 des Formats)

Seit Auftrag S1-08 (25.11.2026) richtet sich das Programm nach Abschnitt 9 von `verfahren/README.md`. Die früheren eigenen Auslegungen aus A-09 gelten nicht mehr, wo Abschnitt 9 etwas festlegt. Geändert hat S1-08 gegenüber A-09:

1. Unbekannte Schlüssel in `origin` sind FEHLERHAFT (9.2.1). Vorher waren sie dort erlaubt.
2. Zeichenketten in `origin`, `claim` und `notes`, die leer sind oder nur aus Leerzeichen, Tabulator, Zeilenvorschub und Wagenrücklauf bestehen, sind FEHLERHAFT (9.2.4).
3. `origin.derived_from` muss die Form einer `id` haben (9.2.5).
4. Jahr `0000` im Datum ist FEHLERHAFT (9.3).
5. Der Kurzname im Dateinamen beginnt und endet nicht mit einem Bindestrich und enthält keine zwei Bindestriche hintereinander (9.4.2).
6. Ein Byte-Order-Mark am Dateianfang wird mit eigenem Grund als FEHLERHAFT gemeldet (9.1.1). Vorher war es ebenfalls FEHLERHAFT, aber mit der Meldung des JSON-Lesers.
7. Steuerzeichen aus der Datei oder dem Pfad (etwa ein Zeilenvorschub in einem Koeffizienten) erscheinen in der Ausgabe als `\u{a}` usw. Vorher konnte ein solcher Grund die erste Zeile auf zwei Zeilen verteilen; das Ergebnis (erstes Wort, Rückgabewert) war richtig, aber Abschnitt 9.7.6 wurde verletzt.

Unverändert und mit Abschnitt 9 im Einklang: doppelte Schlüssel FEHLERHAFT (9.1.2), einzelne Surrogate FEHLERHAFT (9.1.3, der JSON-Leser `serde_json` lehnt sie ab), Ganzzahlfelder nur als JSON-Ganzzahlen ohne Punkt und Exponent (9.2.2), `null` bei optionalen Schlüsseln FEHLERHAFT (9.2.3), gültiges Kalenderdatum (9.3), Endung genau `.json` (9.4.1), `"-0"`, `"0/5"`, `"-0/5"` erlaubt (9.5.2), Bruchstrich bei `Z` und `GF(p)` FEHLERHAFT (9.5.3), beliebig große Zähler und Nenner (9.5.4), `GF(p)` nur für 2 ≤ p < 2^64 mit deterministischem Miller-Rabin-Test (9.6.2), Dateiname in der FEHLERHAFT-Zeile als letzter Teil des Pfads (9.7.3), keine Hinweiszeilen bei FEHLERHAFT (9.7.6).

Weiter selbst entschieden, von Abschnitt 9 freigestellt:

- Reihenfolge der Prüfungen wie in Abschnitt 6; innerhalb von Schritt 6 zuerst `ring`, dann jeder Koeffizient. Nach 9.7.4 ist nur das Ergebnis FEHLERHAFT festgelegt, nicht der genannte Grund.
- Nenner werden bis 10^6 durch Probedivision zerlegt. Bleibt ein größerer zusammengesetzter Rest, nennt ein eigener Hinweis ihn unzerlegt (9.7.7).
- Bei ABGELEHNT werden bis zu 20 verletzte Gleichungen als `VERLETZT`-Zeilen aufgeführt (9.7.5).

## Tests

`cargo test` lief am 25.11.2026 (S1-08) mit 41 Tests ohne Fehler: 7 Einheitstests in `src/main.rs`, 34 Ende-zu-Ende-Tests in `tests/integration.rs`. Die Ende-zu-Ende-Tests rufen das fertige Programm auf und prüfen erstes Wort, Rückgabewert und bei FEHLERHAFT, dass keine weitere Zeile folgt.

Feste Testdateien unter `tests/daten/` (aus A-09):

| Datei | Erwartung | Ergebnis |
|---|---|---|
| `2x2x2-r7-strassen69.json` (Strassen aus `verfahren/README.md`) | ANGENOMMEN | ANGENOMMEN |
| `2x2x2-r7-strassen69-falsch.json` (Produkt 1, `w[1][1]` von -1 auf 1) | ABGELEHNT, 2 Gleichungen | ABGELEHNT, 2 von 64, i=1 j=0/1 j'=0 l=0 i'=1 l'=1 Wert=2 |
| `2x2x2-r7-strassen69-falsch-gf2.json` (dieselbe falsche Fassung über GF(2)) | ANGENOMMEN, da -1 = 1 | ANGENOMMEN |
| `2x2x2-r7-strassen69-falsch-gf3.json` | ABGELEHNT | ABGELEHNT |
| `2x2x2-r7-strassen69-q.json` (Produkte umskaliert mit 2 und 1/2, 3 und 1/3) | ANGENOMMEN, Nenner 2, 3 | ANGENOMMEN, Hinweis 2, 3 |

Tests aus A-09, die Dateien zur Laufzeit erzeugen: die Schulmethode für 3×2×5, 4×2×4, 1×3×2 und 2×1×3 (angenommen), dieselbe mit transponiertem `w` (bei 2×2×2 abgelehnt, bei 2×2×3 FEHLERHAFT wegen der Form), jede der 84 einzelnen Koeffizientenänderungen an Strassen (jedes Mal abgelehnt), je ein Fall für die FEHLERHAFT-Gründe aus den Schritten 1 bis 6 und der JSON-Block aus Abschnitt 7 von `verfahren/README.md` unverändert (angenommen).

Tests aus S1-08, je Regel aus Abschnitt 9 eine Testfunktion, gebaut durch Textersetzung an der Strassen-Datei:

| Test | Regel | Fälle (Auswahl) |
|---|---|---|
| `r9_1_1_json_text` | 9.1.1 | BOM, ungültiges UTF-8, Text oder zweiter Wert nach dem JSON-Wert, Seitenvorschub und geschütztes Leerzeichen danach (FEHLERHAFT); Leerraum nach RFC 8259 davor und danach (ANGENOMMEN); `NaN`, `Infinity`, `-Infinity`, Zeilen- und Blockkommentar, nachgestellte Kommas in Objekt, Liste und `products` (FEHLERHAFT) |
| `r9_1_2_duplicate_keys` | 9.1.2 | doppelter Schlüssel oben, in `origin`, in einem Produkt, und als Escape `"\u006e"` neben `"n"` |
| `r9_1_3_lone_surrogates` | 9.1.3 | `\ud800`, `\udc00`, vertauschtes Paar, Surrogat im Schlüssel (FEHLERHAFT); gültiges Paar (ANGENOMMEN) |
| `r9_1_4_escapes_decode` | 9.1.4 | Escape im Schlüssel `u`, im Koeffizienten, in `id` und `ring` (ANGENOMMEN); Escape `\n` im Koeffizienten (FEHLERHAFT) |
| `r9_1_5_top_level_object` | 9.1.5 | Liste, Zeichenkette, Zahl, `null`, `true` |
| `r9_2_1_unknown_keys` | 9.2.1 | Zusatzschlüssel oben, in `origin` (auch `Source` und `claim`), im Produkt, `derived_from` oben (FEHLERHAFT); alle elf und alle fünf Schlüssel (ANGENOMMEN) |
| `r9_2_2_integer_fields` | 9.2.2 | für alle fünf Ganzzahlfelder: `2.0`, `2e0`, `2E0`, `"2"`, `true`, `false`, `null`, Liste, `0`, negativ, `-0`, 2^64, 10^29 |
| `r9_2_3_types_and_null` | 9.2.3 | falsche Typen und `null` in `origin`, `claim`, `notes`, `derived_from`, `id`, `ring`; `origin` als `null`, Zeichenkette, Liste, Zahl (FEHLERHAFT); ohne `notes` (ANGENOMMEN) |
| `r9_2_4_blank_strings` | 9.2.4 | `""`, Leerzeichen, Tabulator, Zeilenvorschub, Wagenrücklauf, Mischung in `source`, `method`, `created_by`, `notes`, `claim`, `derived_from` (FEHLERHAFT); geschütztes Leerzeichen und `" x "` (ANGENOMMEN) |
| `r9_2_5_derived_from` | 9.2.5 | vier gültige Formen (ANGENOMMEN); 18 ungültige, darunter führende Null, Endung `.json`, Bindestriche am Rand oder doppelt, Großbuchstaben, Nicht-ASCII |
| `r9_2_6_products_and_matrices` | 9.2.6 | Produkt `null`, Liste, Zeichenkette; `w` fehlt oder `null`; Zeile `null`; Eintrag `null`; ungleich lange Zeilen; Zahl als Eintrag; flache Liste; verschachtelte Liste; zusätzliche leere Zeile; `products` als Objekt oder `null` |
| `r9_3_dates` | 9.3 | acht gültige Daten, darunter `2000-02-29`, `0001-01-01`, `9999-12-31` und ein Datum in der Zukunft (ANGENOMMEN); 24 ungültige, darunter `2026-02-30`, `1900-02-29`, `2100-02-29`, `2026-13-01`, `2026-1-5`, `0000-01-01`, `2026-11-25T10:00`, Ziffern außerhalb von ASCII, fünfstelliges Jahr |
| `r9_4_1_file_name_and_id` | 9.4.1, 9.7.3 | Pfad mit Unterordnern (Zeile nennt nur den Dateinamen); Endungen `.JSON`, `.Json`, `.json.bak`, `.json `, keine, `.jsonl`; `id` mit Endung, Leerzeichen, Großbuchstaben, anderer Dateiname |
| `r9_4_2_id_pattern` | 9.4.2 | führende Nullen in allen vier Zahlen bei passender `id`; neun falsche Kurznamen; Zahlen ungleich `m` oder `rank` (FEHLERHAFT); fünf gültige Kurznamen (ANGENOMMEN) |
| `r9_5_coefficients` | 9.5.1 bis 9.5.4 | 22 falsche Schreibweisen über `Q`, darunter `"1\n"`, `"1_0"`, arabisch-indische und vollbreite Ziffern; `"-0"`, `"0/5"`, `"-0/5"`, `"1/1"`, `"2/2"` (ANGENOMMEN); `"1/1"`, `"2/1"`, `"0/1"`, `"-0/1"` über `Z`, `GF(2)`, `GF(3)` (FEHLERHAFT); Bruch mit 60-stelligem Zähler und Nenner (ANGENOMMEN), 60-stellige ganze Zahl (ABGELEHNT) |
| `r9_6_rings` | 9.6.1, 9.6.2 | 29 falsche Schreibweisen oder Nicht-Primzahlen, darunter `GF(02)`, `GF( 2)`, `gf(2)`, `GF(2) `, `z`, `GF(561)`, `GF(3215031751)` (FEHLERHAFT); `GF(2)`, `GF(3)`, `GF(5)`, `GF(1000003)`, `GF(18446744073709551557)` (größte Primzahl unter 2^64), `Q` (ANGENOMMEN); 2^64 − 1, 2^64, 2^64 + 13 (prim, aber zu groß), eine 39-stellige Zahl (FEHLERHAFT) |
| `r9_7_1_arguments` | 9.7.1 | kein Argument, zwei Argumente: erste Zeile `FEHLERHAFT - `, Rückgabewert 2 |
| `r9_7_2_unreadable_files` | 9.7.2 | nicht vorhandene Datei, Verzeichnis statt Datei, leere Datei |
| `r9_7_4_malformed_wins_over_wrong_equations` | 9.7.4 | falsche Strassen-Fassung mit zusätzlich ungültigem Datum, Zusatzschlüssel in `origin`, leerem `claim`, `GF(4)`, `"-1/1"`: jedes Mal FEHLERHAFT, nie ABGELEHNT |
| `r9_7_6_no_hints_when_malformed` | 9.7.6 | Datei mit zwei Hinweiszeilen; mit Formatfehler nur noch eine Zeile |
| `r9_7_7_denominator_hint` | 9.7.7 | Nenner 1000003 · 1000033 (Rest unzerlegt genannt), Nenner 360 (vollständig 2, 3, 5) |
| `verfahren_files_of_the_project_accepted` | | `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ANGENOMMEN, erste Zeile wörtlich) |

## Nachrechnung der Projektdateien (S1-08)

Am 25.11.2026 mit dem Stand dieses Auftrags, `main` auf Commit a5d351b, gebaut mit `cargo build --release`:

```
$ ./target/release/pruefer ../../verfahren/3x2x5-r25-hk71.json
ANGENOMMEN 3x2x5-r25-hk71 3x2x5 rank=25 ring=Z
Rückgabewert: 0
$ ./target/release/pruefer ../../verfahren/3x2x6-r30-hk71.json
ANGENOMMEN 3x2x6-r30-hk71 3x2x6 rank=30 ring=Z
Rückgabewert: 0
```

Das ist ein Lauf eines der beiden Programme. Als Prüfung nach Abschnitt 5.2 des Protokolls zählt er nur zusammen mit Programm 1.

## Abhängigkeiten und Lizenzen

Eigener Code steht unter der Lizenz des Repos (Apache 2.0). Fremder Code wird nicht kopiert, sondern als Abhängigkeit über crates.io eingebunden (Protokoll 11.3, Verweis statt Kopie); die genauen Fassungen hält `Cargo.lock` fest.

| Crate | Zweck | Lizenz |
|---|---|---|
| num-bigint 0.4, num-rational 0.4, num-integer 0.1, num-traits 0.2 | ganze Zahlen und Brüche beliebiger Größe | MIT oder Apache 2.0 |
| serde 1, serde_json 1 | JSON lesen | MIT oder Apache 2.0 |

Indirekte Abhängigkeiten stehen ebenfalls unter MIT, Apache 2.0 oder Unlicense (unicode-ident zusätzlich Unicode-3.0).
