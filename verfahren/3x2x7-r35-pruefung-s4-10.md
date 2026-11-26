# Prüfung S4-10 zu B-020

- Auftrag: S4-10, Rolle Prüfer, 26.11.2026
- Geprüfte Behauptung: `behauptungen/B-020.md`
- Geprüfte Datei: `verfahren/3x2x7-r35-hk71.json`
- Checkout: frischer `git clone` von `https://github.com/Justus42/matmul-rank-n2m`, Commit `25561a6a046dfc6356051f6f9b9d7c54f4d7d564` (main, 2026-11-26 07:41:48 +0000). Letzter Commit, der die Verfahrensdatei berührt: `90322c544c180f50c4c257e6aea3e4305cb83487`.
- Einen Status setze ich nicht. Das tut nur der Orchestrator.

## 0. Was mir eingeblendet wurde, und Spuren früherer Arbeit

### 0.1 Eingeblendet

Beim Start der Sitzung wurden mir ohne mein Zutun eingeblendet:

1. Der Inhalt von `CLAUDE.md` (auf der Positivliste).
2. Kontoangaben der Plattform (die E-Mail-Adresse des Kontoinhabers). Ich gebe sie hier aus Datenschutzgründen nicht wieder. Sie betrifft die Prüfung nicht.
3. Der Index des Projektgedächtnisses, wörtlich:

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von <n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 26.11.2026 Version 0.6 (von Justus, Commit c721297, von ihm im Projektchat bestätigt).
- Person schreibt Deutsch.
- Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
- Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
- Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4 (Fassung 0.6): kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, nicht über Stufe 4 hinaus weiterarbeiten, in Stufe 4 kein anderes Format als 3×2×7. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert werden müsste.
- Protokoll 0.6, Stufe 4 (von Justus am 26.11.2026 gestartet): Budget 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5. Welche Aufträge in welcher Runde laufen dürfen, steht in Abschnitt 3, vor jeder Runde dort nachlesen. Auslegungsfragen: strengere Lesart nehmen, im Logbuch vermerken, weiterarbeiten; nur anhalten und fragen, wenn die strengere Lesart eine Spur oder die Stufe beenden würde. Justus ist nicht ständig erreichbar. README und ergebnisse/ bleiben unverändert. Threads vergeben keine eigenen Subagenten (CLAUDE.md Regel 14), das in jeden Auftrag schreiben.
- Justus am 25.11.2026: kein Zenodo-Release, kein arXiv, kein Kontakt nach außen, das entscheidet er getrennt. Im Repo heißt er „the repository owner“.
- Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
- Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
- Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
- Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
- Protokoll Abschnitt 6: Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
- Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung. Wachen mit wörtlichem Suchprotokoll und Zwischen-Commits, damit die Zeiten aus Git ablesbar sind (Wunsch von Justus, 25.11.2026).
- Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
- Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
- [[verfahren-datenformat]]: Datenformat der Verfahren
- [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht
```

4. Nach dem ersten Befehl wurden mir zusätzlich fünf Einzeleinträge des Projektgedächtnisses eingeblendet, wörtlich (ohne die Kopfzeilen mit Dateipfad):

```
name: pruefer-python-s1-07
description: S1-07 (25.11.2026): Python-Prüfer an Abschnitt 9 des Formats angepasst, PR #16 und #19 gemergt; Abgleich der beiden Prüfer noch offen

S1-07, 25.11.2026: `pruefer/python/` an Abschnitt 9 und 10 von `verfahren/README.md` angepasst. PR #16 (9440cca) und Nachtrag PR #19 (1c1d996) selbst gemergt. 27 → 89 Tests, Klassen `Test91Json` bis `Test97Output` nach Regelnummern benannt.

- Beide Muss-Punkte erledigt: Kalenderdatum über `datetime.date` (9.3), GF(p) nur p < 2^64 (9.6.2).
- Alle „Prüfen"-Punkte aus Abschnitt 10 waren tatsächlich Abweichungen: BOM, einzelne Surrogate, `match` statt `fullmatch`, `\d` statt `[0-9]`, Leerraum-Zeichenketten, `derived_from`-Form, Kurzname-Form, Hinweiszeilen bei FEHLERHAFT, `FEHLERHAFT -` bei falscher Argumentzahl.
- Drei Funde über den Auftrag hinaus, die Programm 2 genauso betreffen könnten: (1) Pythons Grenze von 4300 Stellen bei str→int ließ ein richtiges Verfahren mit 5001-stelligem Koeffizienten mit Rückgabewert 1 (= ABGELEHNT) abstürzen, jetzt `sys.set_int_max_str_digits(0)`. (2) Ein Programmfehler gibt nun Rückgabewert 3 (`INTERNER-FEHLER`), damit ein Absturz nie wie ABGELEHNT aussieht. (3) Nachfrage des Orchestrators zu 9.7.6: der Koeffizient `"1\n"` war schon sicher (`%r`), aber ein Dateiname mit Zeilenvorschub brach die FEHLERHAFT-Zeile um; `one_line()` escapet jetzt alle nicht druckbaren Zeichen.

**How to apply:** Nach Änderungen an einem Prüfer den Abgleich in `pruefer/abgleich/` laufen lassen. Verwandt: [[verfahren-randfaelle-s1-04]], [[pruefer-rust]], [[hk-verfahren-a10]]
```

```
name: pruefer-rust
description: Rust-Prüfprogramm pruefer/rust/: A-09 (PR #7), seit S1-08 (PR #17, 25.11.2026) an verfahren/README.md Abschnitt 9 angepasst

A-09 geliefert: `pruefer/rust/` (cargo build --release; Binary `pruefer`), PR #7. Exakte Brüche (num-rational/num-bigint).

S1-08 (25.11.2026), PR #17 gemergt (1265218): an Abschnitt 9 angepasst. Zusatzschlüssel in origin jetzt FEHLERHAFT, leere/Leerraum-Strings, derived_from-Form, Jahr 0000, Kurzname-Bindestriche, BOM. Fund: Steuerzeichen im Grund brachen die FEHLERHAFT-Zeile um (9.7.6), jetzt als \u{a} escaped. 41 Tests grün, je Regel aus Abschnitt 9 eine Testfunktion r9_*.

**How to apply:** Beim Python-Gegenstück (Programm 1) auf denselben Zeilenumbruch-Fall achten (Koeffizient "1\n" im Grund). Siehe [[verfahren-randfaelle-s1-04]], [[verfahren-datenformat]].
```

```
name: hk-verfahren-a10
description: A-10: Verfahrensdateien 3x2x5 r25 und 3x2x6 r30 (ring Z) liegen in verfahren/, PR #11; Formatfallen

A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 (cac2c55).

**How to apply:** Bekannte Verfahren nicht neu bauen; bei neuen Verfahrensdateien Zusatzschlüssel in origin und ungültige Daten meiden (siehe verfahren/README.md Abschnitt 9). Verwandt: [[verfahren-datenformat]]
```

```
name: verfahren-randfaelle-s1-04
description: S1-04 (25.11.2026): Randfälle des Verfahrensformats in verfahren/README.md Abschnitt 9/10 festgelegt, PR #12 gemergt

S1-04, 25.11.2026: `verfahren/README.md` um Abschnitt 9 (Randfälle, strengere Lesart) und 10 (Anpassungsbedarf der Prüfer) ergänzt, PR #12 gemergt (e8d9cb0). Formatversion bleibt 1.

- Orchestrator-Vorgaben: Zusatzschlüssel überall FEHLERHAFT (auch origin), ungültiges Kalenderdatum FEHLERHAFT, doppelte JSON-Schlüssel FEHLERHAFT. "-0", "-0/5", "0/5" bleiben erlaubt (Orchestrator bestätigt).
- GF(p): p < 2^64. Leere Zeichenketten in origin/claim/notes FEHLERHAFT, null bei optionalen Feldern FEHLERHAFT.
- Muss-Anpassungen: Python (Kalenderdatum, p ≥ 2^64 ablehnen), Rust (Zusatzschlüssel in origin ablehnen). Weitere Prüfpunkte in Abschnitt 10. Programme ändern ist getrennter Auftrag.

**How to apply:** Neue Verfahrensdateien und Prüfer-Aufträge an Abschnitt 9 ausrichten. Verwandt: [[verfahren-datenformat]], [[hk-verfahren-a10]]
```

```
name: pruefer-abgleich-s1-20
description: S1-20: Abgleichwerkzeug für Python- und Rust-Prüfer unter pruefer/abgleich/, PR #31; Bedienung und offener Formatvorschlag

S1-20, 25.11.2026: `pruefer/abgleich/` (gen_cases.py, faelle/, abgleich.py, BERICHT.md), PR #31 (90d46c1), 278 Testfälle.
- Offener Formatvorschlag beim Orchestrator: Rückgabewert 3 + `INTERNER-FEHLER` ins Format; FEHLERHAFT nur für Dateieigenschaften; Auswertung nur bei passendem Paar (ANGENOMMEN/0, ABGELEHNT/1, FEHLERHAFT/2), sonst „kein Ergebnis“.
- Beide Prüfer brauchen ~1 min für Koeffizienten mit 200 000 Stellen.

**How to apply:** Nach Änderungen an einem Prüfer `python3 pruefer/abgleich/abgleich.py` laufen lassen (Rust vorher bauen). Verwandt: [[pruefer-python-s1-07]], [[pruefer-rust]]
```

Keiner dieser Texte enthält ein Urteil zu B-020 oder zur Datei `3x2x7-r35-hk71.json`. Sie betreffen die Prüfprogramme und andere Verfahrensdateien.

### 0.2 Spuren früherer Arbeit

- Im Arbeitsverzeichnis der Sitzung lag schon ein Clone des Repos. `git fetch` meldete dort für `main` ein „forced update“ von `cbc6d61` auf `25561a6`. Ich habe den Inhalt von `cbc6d61` nicht angesehen und für die Prüfung einen eigenen frischen Clone benutzt.
- Die Commit-Nachricht des Kopfes von main lautet „Stufe 4: Runde 1 abgeschlossen, Runde 2 vergeben, Gedächtnis durchgesehen“ (sichtbar bei `git log -1`). Sie nennt kein Urteil.
- `B-020.md` nennt PR #104, Merge `0e3327f`, Commit `90322c5`.
- `origin` und `notes` der Verfahrensdatei verweisen auf `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x7-r35-nachrechnung.md`. Beide liegen nicht auf meiner Positivliste. Ich habe sie nicht gelesen.
- `pruefer/rust/Cargo.lock` hat cargo beim Bau gelesen (`--locked`). Ich selbst habe die Datei nicht geöffnet.
- Kein Urteil zu B-020 ist mir begegnet. Ich habe weder `STATUS.md`, `LOG.md`, `pruefvermerke/` noch `archiv/` geöffnet und keine Verzeichnis-, Lauf- oder Commit-Listen gelesen.

## 1. Die Aussage in Teilen

B-020 behauptet:

- T1: Die Datei hat die SHA-256 `8a2445a69882095c4ac794ab3caf4aff59e657dc94919f87086b41c4b47c29ef`.
- T2: Die Datei beschreibt das Format ⟨3,2,7⟩, also C = A·B mit A 3×2 und B 2×7, mit 35 Produkten.
- T3: Das Verfahren ist richtig über ℤ.
- T4: Daraus folgt R(⟨3,2,7⟩) ≤ 35 über ℤ.
- T5: Nach `verfahren/README.md` Abschnitt 4 gilt das über jedem Körper.

## 2. Urteile

| Teil | Urteil | Beleg |
|---|---|---|
| T1 SHA-256 | **hält** | Abschnitt 3.1 |
| T2 Format ⟨3,2,7⟩, 35 Produkte | **hält** | Abschnitt 3.4 |
| T3 richtig über ℤ | **hält** | Abschnitte 3.2, 3.3, 3.4 |
| T4 R(⟨3,2,7⟩) ≤ 35 über ℤ | **hält** | folgt aus T2 und T3: 35 Produkte, die Identität aus README Abschnitt 2 gilt exakt mit ganzzahligen Koeffizienten |
| T5 über jedem Körper | **hält** | Alle 1764 Gleichungen gelten in ℤ mit Koeffizienten aus {−2, −1, 0, 1, 2}. Unter dem Ringhomomorphismus ℤ → K gelten sie in jedem Körper K, auch in Charakteristik 2 und 3. Das entspricht der Zeile `"Z"` in README Abschnitt 4. |

Ergebnis: Alle Teile der Aussage halten. Zahlbereich laut Datei: `"ring": "Z"`, nur ganzzahlige Koeffizienten. Damit gilt das Verfahren über ℤ und über jedem Körper (und jedem kommutativen Ring).

## 3. Belege

### 3.1 SHA-256

```
$ sha256sum verfahren/3x2x7-r35-hk71.json
8a2445a69882095c4ac794ab3caf4aff59e657dc94919f87086b41c4b47c29ef  verfahren/3x2x7-r35-hk71.json
```

Stimmt Zeichen für Zeichen mit B-020 überein. Dateigröße 10606 Byte.

### 3.2 Beide Prüfprogramme auf dem frischen Checkout

Umgebung: Python 3.13.18, cargo 1.97.0 (c980f4866 2026-06-30), rustc 1.97.0 (2d8144b78 2026-07-07). Das Verzeichnis `pruefer/rust/target` gab es im frischen Clone nicht. Die Prüfprogramme habe ich nicht verändert, `git status` war danach sauber (bis auf das Bauverzeichnis `target/`).

Bau des Rust-Programms:

```
$ cd pruefer/rust && cargo build --release --locked
   Compiling num-rational v0.4.2
   Compiling pruefer-rust v0.1.0 (.../pruefer/rust)
    Finished `release` profile [optimized] target(s) in 5.44s
rc=0
$ sha256sum target/release/pruefer
f1256ff5ad61e73229e1c273647f4251c67cacd2490cd5b0734f08a53064864c  target/release/pruefer
```

(Die Ausgabe ist mit `tail -3` gekürzt, die übrigen Zeilen sind `Compiling`-Zeilen der Abhängigkeiten.)

Läufe aus dem Wurzelverzeichnis des Clones:

```
$ python3 pruefer/python/pruefer.py verfahren/3x2x7-r35-hk71.json
ANGENOMMEN 3x2x7-r35-hk71 3x2x7 rank=35 ring=Z
rc=0
$ pruefer/rust/target/release/pruefer verfahren/3x2x7-r35-hk71.json
ANGENOMMEN 3x2x7-r35-hk71 3x2x7 rank=35 ring=Z
rc=0
```

Erstes Wort und Rückgabewert passen in beiden Läufen zusammen (ANGENOMMEN/0). Beide Läufe zählen.

Exakte Arithmetik, kurz am Quelltext nachgesehen: Python benutzt `fractions` und weist JSON-Gleitkommazahlen beim Einlesen zurück (`parse_float=_reject_float`). Rust benutzt `num_rational::BigRational` und `num_bigint::BigInt`.

### 3.3 Gegenprobe mit verfälschten Kopien außerhalb des Repos

Die Kopien lagen in einem eigenen Verzeichnis außerhalb des Repos, jeweils unter dem Dateinamen `3x2x7-r35-hk71.json`, damit `id` und Dateiname weiter passen und die Ablehnung aus den Gleichungen kommt.

- V1: Produkt 1 (Zählung ab 1), `v[0][0]` von `"1"` auf `"2"`. Sonst Zeichen für Zeichen gleich. SHA-256 der Kopie `2716533169d1d041272b9b62bc5fd474ad3c295d81d5fa1595572578bfa6ab76`.
- V2: Produkt 35, `w[2][0]` von `"-1"` auf `"1"`, Datei neu als JSON geschrieben.

```
$ python3 pruefer/python/pruefer.py <gegenprobe>/v1/3x2x7-r35-hk71.json
ABGELEHNT 3x2x7-r35-hk71 4 von 1764 Gleichungen verletzt, erste: i=0 j=1 j'=0 l=0 i'=0 l'=0 Wert=1 erwartet=0
VERLETZT i=0 j=1 j'=0 l=0 i'=0 l'=6 Wert=-1 erwartet=0
VERLETZT i=0 j=1 j'=0 l=0 i'=1 l'=0 Wert=-1 erwartet=0
VERLETZT i=0 j=1 j'=0 l=0 i'=1 l'=6 Wert=1 erwartet=0
rc=1
$ pruefer/rust/target/release/pruefer <gegenprobe>/v1/3x2x7-r35-hk71.json
ABGELEHNT 3x2x7-r35-hk71 4 von 1764 Gleichungen verletzt, erste: i=0 j=1 j'=0 l=0 i'=0 l'=0 Wert=1 Soll=0
VERLETZT i=0 j=1 j'=0 l=0 i'=0 l'=0 Wert=1 Soll=0
VERLETZT i=0 j=1 j'=0 l=0 i'=0 l'=6 Wert=-1 Soll=0
VERLETZT i=0 j=1 j'=0 l=0 i'=1 l'=0 Wert=-1 Soll=0
VERLETZT i=0 j=1 j'=0 l=0 i'=1 l'=6 Wert=1 Soll=0
rc=1
$ python3 pruefer/python/pruefer.py <gegenprobe>/v2/3x2x7-r35-hk71.json
ABGELEHNT 3x2x7-r35-hk71 8 von 1764 Gleichungen verletzt, erste: i=0 j=0 j'=1 l=0 i'=2 l'=0 Wert=2 erwartet=0
VERLETZT i=0 j=0 j'=1 l=6 i'=2 l'=0 Wert=2 erwartet=0
VERLETZT i=0 j=1 j'=1 l=0 i'=2 l'=0 Wert=-2 erwartet=0
VERLETZT i=0 j=1 j'=1 l=6 i'=2 l'=0 Wert=-2 erwartet=0
VERLETZT i=2 j=0 j'=1 l=0 i'=2 l'=0 Wert=2 erwartet=0
VERLETZT i=2 j=0 j'=1 l=6 i'=2 l'=0 Wert=2 erwartet=0
VERLETZT i=2 j=1 j'=1 l=0 i'=2 l'=0 Wert=-1 erwartet=1
VERLETZT i=2 j=1 j'=1 l=6 i'=2 l'=0 Wert=-2 erwartet=0
rc=1
$ pruefer/rust/target/release/pruefer <gegenprobe>/v2/3x2x7-r35-hk71.json
ABGELEHNT 3x2x7-r35-hk71 8 von 1764 Gleichungen verletzt, erste: i=0 j=0 j'=1 l=0 i'=2 l'=0 Wert=2 Soll=0
VERLETZT i=0 j=0 j'=1 l=0 i'=2 l'=0 Wert=2 Soll=0
VERLETZT i=0 j=0 j'=1 l=6 i'=2 l'=0 Wert=2 Soll=0
VERLETZT i=0 j=1 j'=1 l=0 i'=2 l'=0 Wert=-2 Soll=0
VERLETZT i=0 j=1 j'=1 l=6 i'=2 l'=0 Wert=-2 Soll=0
VERLETZT i=2 j=0 j'=1 l=0 i'=2 l'=0 Wert=2 Soll=0
VERLETZT i=2 j=0 j'=1 l=6 i'=2 l'=0 Wert=2 Soll=0
VERLETZT i=2 j=1 j'=1 l=0 i'=2 l'=0 Wert=-1 Soll=1
VERLETZT i=2 j=1 j'=1 l=6 i'=2 l'=0 Wert=-2 Soll=0
rc=1
```

Beide Programme lehnen beide verfälschten Kopien ab (ABGELEHNT/1), mit derselben Zahl verletzter Gleichungen und denselben Indizes. Mein eigenes Skript (3.4) findet bei V1 ebenfalls 4 und bei V2 8 verletzte Gleichungen.

### 3.4 Eigene Nachrechnung an der Datei

Mit einem eigenen kurzen Skript (Python, `fractions.Fraction`, außerhalb des Repos, nicht aus den Prüfprogrammen übernommen) habe ich die Datei unabhängig von den Prüfprogrammen gelesen:

```
n,k,m,rank,ring = 3 2 7 35 Z | len(products) = 35
alle Koeffizienten ganzzahlig (kein Bruchstrich): True | Werte: [-2, -1, 0, 1, 2]
Gleichungen: 1764 verletzt: 0
Produkte mit Nullfaktor: []
```

- Kopf der Datei: `format_version` 1, `id` `3x2x7-r35-hk71`, `n` 3, `k` 2, `m` 7, `rank` 35, `ring` `"Z"`. Der Dateiname passt zu n, k, m und rank.
- Jedes Produkt hat `u` als 3×2, `v` als 2×7 und `w` als 3×7 Matrix. Das ist ⟨3,2,7⟩: A ist 3×2, B ist 2×7, C ist 3×7.
- Es sind genau 35 Produkte, keines hat einen Faktor, der ganz null ist.
- Geprüft wurden alle (3·2)·(2·7)·(3·7) = 1764 Gleichungen aus README Abschnitt 2, Σ_r u_r[i][j]·v_r[j'][l]·w_r[i'][l'] = [i=i', j=j', l=l']. Keine ist verletzt.
- Zusätzlich 200 Zufallsproben: A und B mit ganzzahligen Einträgen aus [−10⁶, 10⁶] (Startwert 20261126), C über die 35 Produkte berechnet und mit A·B verglichen. Ergebnis: 200 von 200 gleich.

## 4. Vorbehalte

- Die Zeile in `origin.source` sagt „Original HK71 nicht gelesen“. Die Herkunftsangabe habe ich nicht geprüft. Sie ist für die Richtigkeit des Verfahrens ohne Belang, weil das Verfahren selbst vollständig nachgerechnet ist.
- B-020 sagt nur „höchstens 35“. Über eine untere Schranke sagt diese Prüfung nichts.
