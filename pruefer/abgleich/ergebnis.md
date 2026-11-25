| Nr. | Fall | Regel | Erwartung | Python | Rust | Ergebnis | Nebenprüfungen |
|---|---|---|---|---|---|---|---|
| 1 | `verfahren/3x2x6-r30-hk71.json` Projektdatei unter verfahren/ | 7 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 2 | `verfahren/3x2x5-r25-hk71.json` Projektdatei unter verfahren/ | 7 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 3 | `strassen-z` Strassen wie in Abschnitt 7 | 7 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 4 | `strassen-q` Strassen über Q | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 5 | `strassen-gf2` Strassen über GF(2) | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 6 | `strassen-gf3` Strassen über GF(3) | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 7 | `strassen-gf-gross` Strassen über GF(2^64-59), größte Primzahl unter 2^64 | 9.6.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 8 | `strassen-gf-m61` Strassen über GF(2^61-1) | 9.6.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 9 | `strassen-q-brueche` Strassen über Q, M1 mit u·2 und w·1/2, Nenner 2 | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 10 | `strassen-q-riesig` Strassen über Q, M1 mit Faktor 10^5000 und 1/10^5000 (5001 Stellen) | 9.5.4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 11 | `strassen-z-riesig` Strassen über Z plus zwei Produkte mit ±10^5000, die sich aufheben | 9.5.4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 12 | `strassen-q-nenner-gross` Strassen über Q, Nenner 1000003·1000033 (Hinweis Primteiler) | 9.7.7 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 13 | `strassen-q-nullformen` Strassen über Q mit -0, 0/5, -0/5, 1/1, 2/2 | 9.5.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 14 | `strassen-z-minusnull` Strassen über Z mit -0 | 9.5.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 15 | `strassen-nullprodukt` Strassen plus ein Produkt mit u ganz null (Hinweiszeile) | 6 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 16 | `naiv-2x2x2` Schulmethode 2x2x2 | 7 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 17 | `naiv-3x2x5` Schulmethode 3x2x5 | 7 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 18 | `naiv-1x3x2-q` Schulmethode 1x3x2 über Q, k ungleich 2 | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 19 | `eins-z` 1x1x1 mit einem Produkt | 7 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 20 | `eins-gf2-drei` 1x1x1 über GF(2), Koeffizient 3 ≡ 1 | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 21 | `eins-gf5-minusvier` 1x1x1 über GF(5), Koeffizient -4 ≡ 1 | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 22 | `strassen-gf2-vorzeichen` Vorzeichenfehler aus Abschnitt 7 über GF(2): -1 ≡ 1, also richtig | 4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 23 | `optional-alle` claim, notes und derived_from gesetzt | 9.2.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 24 | `notes-nbsp` notes nur aus geschütztem Leerzeichen U+00A0 (nicht eines der vier Leerraumzeichen) | 9.2.4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 25 | `escape-koeffizient` Koeffizient als "\u0031" | 9.1.4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 26 | `escape-schluessel` Schlüssel "\u0075" statt "u" | 9.1.4 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 27 | `surrogat-paar` gültiges Surrogat-Paar in notes | 9.1.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 28 | `leerraum-danach` Leerraum nach dem JSON-Wert | 9.1.1 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 29 | `kompakt` JSON ohne jeden Leerraum | 9.1.1 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 30 | `datum-zukunft` Datum in der Zukunft | 9.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 31 | `datum-schalttag` Schalttag 2024 | 9.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 32 | `datum-2000-02-29` Schalttag 2000 (durch 400 teilbar) | 9.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 33 | `datum-0001` kleinstes Jahr 0001 | 9.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 34 | `datum-9999` größtes Datum | 9.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 35 | `datum-1900-02-29` kein Schalttag 1900 | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 36 | `datum-02-30` 30. Februar | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 37 | `datum-monat-13` Monat 13 | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 38 | `datum-monat-00` Monat 00 | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 39 | `datum-tag-00` Tag 00 | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 40 | `datum-11-31` 31. November | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 41 | `datum-kurz` ohne führende Nullen | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 42 | `datum-0000` Jahr 0000 | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 43 | `datum-uhrzeit` mit Uhrzeit | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 44 | `datum-schraegstrich` Schrägstriche | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 45 | `datum-arabisch` arabisch-indische Ziffern | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 46 | `datum-vollbreit` Vollbreit-Ziffern im Jahr | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 47 | `datum-leerzeichen` angehängtes Leerzeichen | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 48 | `strassen-vorzeichen` Vorzeichenfehler aus Abschnitt 7 (M2, w[1][1] = 1) | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 49 | `strassen-q-vorzeichen` derselbe Fehler über Q | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 50 | `strassen-gf3-vorzeichen` derselbe Fehler über GF(3) | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 51 | `strassen-ohne-m7` Strassen ohne M7, rank 6 | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 52 | `strassen-q-falscher-bruch` Strassen über Q, M1 mit u·2 und w·1/3 | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 53 | `strassen-w-transponiert` Strassen mit transponiert gespeichertem w | 2 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 54 | `eins-zwei` 1x1x1 mit Koeffizient 2 | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 55 | `eins-gf3-zwei` 1x1x1 über GF(3) mit Koeffizient 2 | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 56 | `eins-null` 1x1x1 mit Koeffizient 0 (Nullprodukt und falsch) | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 57 | `eins-gf2-zwei` 1x1x1 über GF(2), Koeffizient 2 ≡ 0 | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 58 | `strassen-gf-gross-minus1` GF(2^64-59), -1 in M2 als p-1 geschrieben | 9.6.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 59 | `strassen-gf-gross-falsch` GF(2^64-59), M2 mit p-2 statt -1 | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 60 | `hk71-3x2x5-gestoert` Verfahren aus verfahren/3x2x5-r25-hk71.json mit einem auf 0 gesetzten w-Koeffizienten | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 61 | `hk71-3x2x6-gestoert` Verfahren aus verfahren/3x2x6-r30-hk71.json mit einem auf 0 gesetzten w-Koeffizienten | 7 | ABGELEHNT 1 | ABGELEHNT 1 | ABGELEHNT 1 | gleich |  |
| 62 | `utf8-ungueltig` ungültiges UTF-8-Byte 0xFF in origin.method | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 63 | `utf8-ueberlang` überlange UTF-8-Folge C0 AF | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 64 | `bom` Byte-Order-Mark am Anfang | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 65 | `utf16` Datei in UTF-16LE ohne BOM | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 66 | `nachlauf` Text nach dem JSON-Wert | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 67 | `zwei-objekte` zwei JSON-Objekte hintereinander | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 68 | `nan` n = NaN | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 69 | `infinity` m = Infinity | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 70 | `minus-infinity` k = -Infinity | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 71 | `kommentar` Zeilenkommentar | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 72 | `kommentar-block` Blockkommentar | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 73 | `komma-hinten-objekt` nachgestelltes Komma im Objekt | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 74 | `komma-hinten-liste` nachgestelltes Komma in products | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 75 | `leer` leere Datei | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 76 | `nur-leerraum` nur Leerraum | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 77 | `abgeschnitten` abgeschnittene Datei (endet vor origin) | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 78 | `einfache-anfuehrung` einfache Anführungszeichen | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 79 | `steuerzeichen-roh` rohes Tabulatorzeichen in einer Zeichenkette | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 80 | `doppelt-oben` ring doppelt (gleicher Wert) | 9.1.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 81 | `doppelt-oben-anders` rank doppelt, zweiter Wert richtig | 9.1.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 82 | `doppelt-origin` origin.method doppelt | 9.1.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 83 | `doppelt-produkt` u im ersten Produkt doppelt | 9.1.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 84 | `doppelt-escape` n doppelt, einmal als "\u006e" | 9.1.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 85 | `surrogat-hoch` einzelnes hohes Surrogat in notes | 9.1.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 86 | `surrogat-tief` einzelnes tiefes Surrogat in notes | 9.1.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 87 | `surrogat-vertauscht` Surrogat-Paar in falscher Reihenfolge | 9.1.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 88 | `surrogat-schluessel` einzelnes Surrogat in einem (unbekannten) Schlüssel | 9.1.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 89 | `oben-liste` oberster Wert Liste | 9.1.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 90 | `oben-liste-objekt` Strassen in eine Liste gepackt | 9.1.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 91 | `oben-string` oberster Wert Zeichenkette | 9.1.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 92 | `oben-zahl` oberster Wert Zahl | 9.1.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 93 | `oben-null` oberster Wert null | 9.1.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 94 | `oben-true` oberster Wert true | 9.1.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 95 | `tief-verschachtelt` notes als Liste mit 100000 Ebenen | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 96 | `tief-verschachtelt-offen` 100000 öffnende Klammern ohne Ende | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 97 | `fehlt-format_version` format_version fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 98 | `fehlt-id` id fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 99 | `fehlt-n` n fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 100 | `fehlt-k` k fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 101 | `fehlt-m` m fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 102 | `fehlt-rank` rank fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 103 | `fehlt-ring` ring fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 104 | `fehlt-origin` origin fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 105 | `fehlt-products` products fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 106 | `fehlt-source` origin.source fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 107 | `fehlt-method` origin.method fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 108 | `fehlt-created` origin.created fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 109 | `fehlt-created_by` origin.created_by fehlt | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 110 | `fehlt-produkt-u` u fehlt in products[3] | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 111 | `fehlt-produkt-v` v fehlt in products[3] | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 112 | `fehlt-produkt-w` w fehlt in products[3] | 6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 113 | `zusatz-oben` unbekannter Schlüssel oben | 9.2.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 114 | `zusatz-origin` unbekannter Schlüssel in origin | 9.2.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 115 | `zusatz-produkt` unbekannter Schlüssel in einem Produkt | 9.2.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 116 | `zusatz-grossschreibung` Schlüssel Ring zusätzlich zu ring | 9.2.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 117 | `zusatz-status` Schlüssel status (Abschnitt 1) | 9.2.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 118 | `int-punkt` n = 2.0 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 119 | `int-exponent` n = 2e0 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 120 | `int-exponent-gross` m = 2E0 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 121 | `int-string` k = "2" | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 122 | `int-true` n = true | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 123 | `int-false` m = false | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 124 | `int-null` rank = null | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 125 | `int-null-n` n = null | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 126 | `int-null-fv` format_version = null | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 127 | `int-true-fv` format_version = true (true == 1 in Python) | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 128 | `int-liste` n = [2] | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 129 | `int-objekt` n als Objekt | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 130 | `int-null-wert` n = 0 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 131 | `int-negativ` m = -2 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 132 | `int-minus-null` n = -0 (JSON-Ganzzahl, Wert 0) | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 133 | `rank-null` rank = 0 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 134 | `fv-2` format_version = 2 (Schritt 2) | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 135 | `fv-0` format_version = 0 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 136 | `fv-punkt` format_version = 1.0 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 137 | `int-riesig` n = 10^30 (Form passt nicht) | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 138 | `int-1e400` n = 1e400 | 9.2.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 139 | `int-fuehrende-null` n = 02 (in JSON ungültig) | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 140 | `int-plus` n = +2 (in JSON ungültig) | 9.1.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 141 | `origin-string` origin als Zeichenkette | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 142 | `origin-liste` origin als Liste | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 143 | `origin-null` origin = null | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 144 | `origin-zahl` origin.source als Zahl | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 145 | `origin-wert-null` origin.method = null | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 146 | `origin-wert-liste` origin.created_by als Liste | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 147 | `origin-datum-zahl` origin.created als Zahl | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 148 | `claim-null` claim = null | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 149 | `notes-null` notes = null | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 150 | `derived-null` origin.derived_from = null | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 151 | `claim-zahl` claim als Zahl | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 152 | `notes-liste` notes als Liste | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 153 | `notes-true` notes = true | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 154 | `ring-null` ring = null | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 155 | `id-null` id = null | 9.2.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 156 | `leer-source` origin.source leer | 9.2.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 157 | `leer-method` origin.method nur Leerzeichen | 9.2.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 158 | `leer-created_by` origin.created_by nur Tab, CR, LF | 9.2.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 159 | `leer-derived` origin.derived_from leer | 9.2.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 160 | `leer-claim` claim leer | 9.2.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 161 | `leer-notes` notes nur Leerraum | 9.2.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 162 | `leer-created` origin.created leer | 9.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 163 | `derived-form-falsch` derived_from ohne id-Form | 9.2.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 164 | `derived-bindestrich` derived_from ohne Kurzname | 9.2.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 165 | `derived-gross` derived_from mit Großbuchstaben | 9.2.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 166 | `derived-endung` derived_from mit .json | 9.2.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 167 | `derived-fuehrende-null` derived_from mit führender Null | 9.2.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 168 | `derived-unbekannt` derived_from in id-Form, Verfahren existiert nicht (9.2.5: nicht geprüft) | 9.2.5 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 169 | `products-objekt` products als Objekt | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 170 | `products-null` products = null | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 171 | `produkt-liste` ein Produkt als Liste | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 172 | `produkt-null` ein Produkt = null | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 173 | `form-u-zeilen` u mit 1 statt 2 Zeilen | 6.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 174 | `form-v-spalten` v mit 3 statt 2 Spalten | 6.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 175 | `form-w-zeilen` w mit 3 statt 2 Zeilen | 6.5 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 176 | `form-ungleich` ungleich lange Zeilen in u | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 177 | `form-leere-zeile` leere Zeile in u | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 178 | `form-leer` u leer | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 179 | `form-flach` u als flache Liste | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 180 | `form-string` u als Zeichenkette | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 181 | `form-tiefer` Koeffizient als Liste | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 182 | `koeff-zahl` Koeffizient als JSON-Zahl 1 | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 183 | `koeff-zahl-0` Koeffizient als JSON-Zahl 0 | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 184 | `koeff-null` Koeffizient null | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 185 | `koeff-true` Koeffizient true | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 186 | `u-null` u = null | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 187 | `zeile-null` Zeile von v = null | 9.2.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 188 | `rank-zu-klein` rank 7, aber 8 Produkte | 6.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 189 | `rank-zu-gross` rank 7, aber 6 Produkte | 6.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 190 | `products-leer` products leer, rank 7 | 6.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 191 | `endung-gross` Endung .JSON | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 192 | `endung-keine` keine Endung | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 193 | `endung-txt` Endung .txt | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 194 | `endung-doppelt` Endung .json.json, id ohne zweite Endung | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 195 | `id-ungleich` id anders als Dateiname | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 196 | `id-gross-klein` id unterscheidet sich in der Groß-/Kleinschreibung | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 197 | `id-leerzeichen` id mit angehängtem Leerzeichen | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 198 | `id-fuehrende-null` führende Null bei n | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 199 | `id-rank-null` führende Null bei rank | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 200 | `id-kurz-anfang` Kurzname beginnt mit Bindestrich | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 201 | `id-kurz-ende` Kurzname endet mit Bindestrich | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 202 | `id-kurz-doppel` zwei Bindestriche im Kurznamen | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 203 | `id-kurz-gross` Großbuchstabe im Kurznamen | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 204 | `id-kurz-unterstrich` Unterstrich im Kurznamen | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 205 | `id-kurz-umlaut` ß im Kurznamen | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 206 | `id-kurz-leer` leerer Kurzname | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 207 | `id-ohne-kurz` ohne Kurzname | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 208 | `id-n-falsch` Dateiname sagt n = 3, Datei n = 2 | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 209 | `id-rank-falsch` Dateiname sagt rank 8, Datei 7 | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 210 | `id-grosses-x` großes X | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 211 | `id-vollbreit` Vollbreit-Ziffer für n | 9.4.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 212 | `id-kurz-ziffern` Kurzname nur Ziffer 0 | 9.4.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 213 | `id-kurz-bindestriche` Kurzname mit einzelnen Bindestrichen | 9.4.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 214 | `koeff-newline` Koeffizient "1\n" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 215 | `koeff-vollbreit` Vollbreit-Ziffer 1 | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 216 | `koeff-arabisch` arabisch-indische Ziffer 1 | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 217 | `koeff-unterstrich` Koeffizient "1_0" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 218 | `koeff-plus` Koeffizient "+1" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 219 | `koeff-fuehrende-null` Koeffizient "01" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 220 | `koeff-dezimal` Koeffizient "1.0" über Q | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 221 | `koeff-exponent` Koeffizient "1e0" über Q | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 222 | `koeff-leerzeichen-vorn` Koeffizient " 1" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 223 | `koeff-leerzeichen-hinten` Koeffizient "1 " | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 224 | `koeff-leer` leerer Koeffizient | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 225 | `koeff-minus-minus` Koeffizient "--1" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 226 | `koeff-minus-allein` Koeffizient "-" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 227 | `koeff-nenner-null` Koeffizient "1/0" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 228 | `koeff-nenner-negativ` Koeffizient "1/-1" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 229 | `koeff-nenner-fuehrend` Koeffizient "1/01" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 230 | `koeff-nenner-leer` Koeffizient "1/" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 231 | `koeff-zaehler-leer` Koeffizient "/1" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 232 | `koeff-doppelbruch` Koeffizient "1/1/1" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 233 | `koeff-nul-zeichen` Koeffizient "1\u0000" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 234 | `koeff-hex` Koeffizient "0x1" | 9.5.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 235 | `koeff-bruch-z` Koeffizient "2/2" über Z (9.5.3) | 9.5.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 236 | `koeff-bruch-z-ganz` Koeffizient "1/1" über Z (9.5.3) | 9.5.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 237 | `koeff-bruch-gf` Koeffizient "1/1" über GF(2) (9.5.3) | 9.5.3 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 238 | `koeff-bruch-q` Koeffizient "2/2" über Q | 9.5.2 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 239 | `ring-gf02` GF(02) | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 240 | `ring-gf-leer` GF( 2) | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 241 | `ring-klein` gf(2) | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 242 | `ring-leer-hinten` GF(2) mit Leerzeichen | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 243 | `ring-z-klein` z | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 244 | `ring-r` R (reelle Zahlen) | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 245 | `ring-leer` leerer ring | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 246 | `ring-gf` GF() | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 247 | `ring-gf-ohne-klammer` GF2 | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 248 | `ring-zp` Z/2 | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 249 | `ring-gf4` GF(4), keine Primzahl | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 250 | `ring-gf1` GF(1) | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 251 | `ring-gf0` GF(0) | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 252 | `ring-gf-minus` GF(-2) | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 253 | `ring-gf-561` GF(561), Carmichael-Zahl | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 254 | `ring-gf-spsp` GF(3215031751), starke Pseudoprimzahl zu den Basen 2, 3, 5, 7 | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 255 | `ring-gf-spsp-gross` GF(3825123056546413051), starke Pseudoprimzahl zu den Basen 2 bis 23 | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 256 | `ring-gf-quadrat` GF(4294967291^2), Quadrat einer Primzahl knapp unter 2^64 | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 257 | `ring-gf-2hoch64-minus1` GF(2^64-1), keine Primzahl | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 258 | `ring-gf-2hoch64` GF(2^64) | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 259 | `ring-gf-ueber-2hoch64` GF(2^64+13), Primzahl über der Grenze | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 260 | `ring-gf-riesig` GF(10^40-1) | 9.6.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 261 | `ring-gf-arabisch` GF mit arabisch-indischer Ziffer 2 | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 262 | `ring-gf-vollbreit` GF mit Vollbreit-Ziffer 2 | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 263 | `ring-q-klein` q | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 264 | `ring-gf2-klammer-eckig` GF[2] | 9.6.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 265 | `mehrere-fehler` drei Formatfehler zugleich | 9.7.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 266 | `falsch-und-fehlerhaft` Gleichungen verletzt und ungültiges Datum: FEHLERHAFT, nicht ABGELEHNT | 9.7.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 267 | `falsch-und-koeff` Gleichungen verletzt und ein Koeffizient "1 " im letzten Produkt | 9.7.4 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 268 | `koeff-zeilenumbruch-mitte` Koeffizient "1\n2" (Grund einzeilig?) | 9.7.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 269 | `ring-zeilenumbruch` ring mit Zeilenvorschub und dem Wort ANGENOMMEN | 9.7.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 270 | `aufruf-ohne-argument` kein Argument | 9.7.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 271 | `aufruf-zwei-argumente` zwei Argumente | 9.7.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 272 | `aufruf-leeres-argument` ein leeres Argument | 9.7.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 273 | `datei-fehlt` Datei existiert nicht | 9.7.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 274 | `datei-ist-ordner` Pfad ist ein Ordner | 9.7.2 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 275 | `pfad-relativ` Aufruf mit Dateiname ohne Ordner | 9.7.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 276 | `pfad-mit-punkten` Pfad mit .. | 9.7.3 | ANGENOMMEN 0 | ANGENOMMEN 0 | ANGENOMMEN 0 | gleich |  |
| 277 | `dateiname-kein-utf8` Dateiname mit Byte 0xFF (kein UTF-8), Inhalt Strassen | 9.4.1 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
| 278 | `dateiname-zeilenvorschub` Dateiname mit Zeilenvorschub, Inhalt Strassen | 9.7.6 | FEHLERHAFT 2 | FEHLERHAFT 2 | FEHLERHAFT 2 | gleich |  |
