# V-S2-03: Suche nach einem Verfahren mit 25 Produkten für ⟨4,2,4⟩ (Spur B, Runde 1)

- Ziel: Stufe 2, Spur B. Ein Verfahren mit 25 Multiplikationen für ⟨4,2,4⟩ (gleichwertig ⟨2,4,4⟩), geprüft nach Protokoll 5.2
- Ergebnis: **kein Fund.** Kein Verfahren mit 25 Produkten über 𝔽₂, 𝔽₃, 𝔽₅ oder ℤ (Koeffizienten −1, 0, 1) gefunden. Numerisch über ℝ keine exakte Zerlegung mit 25 Gliedern
- Nebenergebnis: ein eigenes Verfahren mit 26 Produkten über ℤ, `verfahren/4x2x4-r26-s001.json`, Status **behauptet** (beide Prüfprogramme ANGENOMMEN, siehe Abschnitt 1). Das ist der bekannte beste Wert, kein neues Ergebnis
- Runde und Datum: Stufe 2, Runde 1, 25.11.2026, Auftrag S2-03, Verfahrenssucher
- Rechenaufwand: vier Blöcke zu je höchstens 30 Minuten auf 4 Kernen (29, 28, 21 und 21 Minuten), dazu kurze Probeläufe unter 5 Minuten. Nichts läuft weiter

Gelesen vor Beginn: `PROTOKOLL.md` (0.2), `CLAUDE.md`, `STATUS.md`, `LOG.md`, `versuche/` (nur `V-S1-12`, ohne Bezug), `lit/WACHE.md` Abschnitt „Für Stufe 2“, `verfahren/README.md`, READMEs beider Prüfprogramme.

---

## 1. Startpunkt: eigenes Verfahren mit 26 Produkten

Statt ein 26er-Verfahren aus einem fremden Katalog zu übernehmen (das hätte einen Eintrag in `lit/LIZENZEN.md` gebraucht, der nicht zu diesem Auftrag gehört), habe ich die Flip-Graph-Suche aus Abschnitt 2 von der Schulmethode (32 Produkte) aus laufen lassen, über ℤ mit Koeffizienten in {−1, 0, 1}. Zwei von vier Läufen erreichten 26 nach 8,4 und 34,4 Millionen Schritten (Samen 1 und 4, je 180 Sekunden), keiner kam unter 26.

Wörtliche Ausgaben der beiden Prüfprogramme (Stand `main` 50d2b34, Rust mit `cargo build --release`):

```
$ python3 pruefer/python/pruefer.py verfahren/4x2x4-r26-s001.json
ANGENOMMEN 4x2x4-r26-s001 4x2x4 rank=26 ring=Z
Rückgabe 0
$ pruefer/rust/target/release/pruefer verfahren/4x2x4-r26-s001.json
ANGENOMMEN 4x2x4-r26-s001 4x2x4 rank=26 ring=Z
Rückgabe 0
```

Gegenprobe: dieselbe Datei mit einem Eintrag von `w` in Produkt 1 auf 0 gesetzt (nur im Arbeitsordner, nicht im Repo) ergab bei beiden `ABGELEHNT 4x2x4-r26-s001 4 von 1024 Gleichungen verletzt`, Rückgabe 1.

Das Verfahren ist also über jedem Ring richtig, sofern beide Prüfprogramme richtig rechnen. Den Status setzt nicht dieser Bericht, sondern eine Behauptungsdatei nach 5.2.

## 2. Methode 1: Flip-Graph-Wanderung

Code: `s2-spurB-r1/flip.c` (eigener Code nach der Beschreibung von Kauers und Moosbauer 2023, nichts übernommen).

- Zahlbereiche: 𝔽_p für eine Primzahl p, oder ℤ mit Skalaren ±1 und Koeffizientenschranke 1
- Flip: zwei Produkte mit proportionalem Faktor (u, v oder w) tauschen Anteile aus, der Rang bleibt gleich. Danach Reduktion: zwei Produkte mit zwei proportionalen Faktoren werden zusammengelegt, Produkte mit Nullfaktor gestrichen
- Plus-Übergang: gibt es `--plateau` Schritte lang keine Reduktion, wird ein Produkt in zwei zerlegt (Rang + 1), solange der Rang unter „bester Rang + `--slack`“ bleibt, sonst Rücksprung auf den Ausgangspunkt
- `--drift 1`: jedes neu erreichte Verfahren vom besten Rang wird neuer Rücksprungpunkt
- Jedes neu erreichte Verfahren vom Rang ≤ 26 wird exakt nachgerechnet (Programmfehler hätte zum Abbruch geführt, kam nicht vor) und mit einem Hash als Menge normierter Produkte gezählt. Dazu eine grobe Invariante: die sortierte Liste der Tripel (Rang u, Rang v, Rang w) der Produkte. Verschiedene Invarianten heißen sicher nicht äquivalent, gleiche Invarianten sagen nichts
- Etwa 1 Million Schritte pro Sekunde und Kern

Warum 𝔽₃ und 𝔽₅ wichtig sind: Ein Verfahren mit 25 Produkten über ℤ[½] (Nenner 2, wie AlphaEvolve bei ⟨4,2,5⟩) ergäbe modulo 3 und modulo 5 je ein Verfahren mit höchstens 25 Produkten über 𝔽₃ und 𝔽₅. Wegen der unteren Schranke 25 (Yang v3, über jedem Körper) wären es genau 25. Die Suche über 𝔽₃ und 𝔽₅ deckt diese Familie also als notwendige Bedingung ab. 𝔽₂ deckt die Verfahren mit Koeffizienten in ℤ₍₂₎ ab.

### Block 1 (06:46 bis 07:15 UTC, 1700 s je Prozess)

Alle vier Prozesse starten bei einem 26er-Verfahren, Plateau 10⁶, Slack 1, ohne Drift.

| Prozess | Körper | Start | Schritte | bester Rang | verschiedene 26er | Invarianten |
|---|---|---|---|---|---|---|
| 1 | 𝔽₂ | 26er aus 𝔽₂-Lauf | 6,31·10⁸ | 26 | 96 | 24 |
| 2 | 𝔽₃ | `z26_seed1` mod 3 | 6,14·10⁸ | 26 | 729 | 23 |
| 3 | 𝔽₃ | `z26_seed4` mod 3 | 6,02·10⁸ | 26 | 1010 | 73 |
| 4 | ℤ (±1) | `z26_seed4` | 7,12·10⁸ | 26 | 77 | 32 |

### Block 2 (07:16 bis 07:44 UTC, 1700 s je Prozess)

Plateau 3·10⁵, mit Drift.

| Prozess | Körper | Start | Slack | Schritte | bester Rang | verschiedene 26er |
|---|---|---|---|---|---|---|
| 1 | 𝔽₂ | `z26_seed4` mod 2 | 2 | 6,52·10⁸ | 26 | 96 |
| 2 | 𝔽₃ | `z26_seed1` mod 3 | 2 | 6,33·10⁸ | 26 | 729 |
| 3 | 𝔽₅ | `z26_seed1` mod 5 | 1 | 5,87·10⁸ | 26 | 15625 |
| 4 | 𝔽₂ | Schulmethode, Neustart alle 3·10⁶ Schritte | 1 | 5,58·10⁷ | 26 | 3 |

Zusammen: rund 4,4·10⁹ Flip-Schritte, über 6000 Plus-Übergänge. **Kein Verfahren mit 25 Produkten.** Protokolle unter `s2-spurB-r1/daten/b1/` und `daten/b2/` (`*-protokoll.txt`). Die Zeilen `SCHEME` je erreichtem 26er (zusammen 2,6 MB) sind wegen der Regel „große Zwischenergebnisse gehören nicht ins Repo“ weggelassen; ihre Zählung steht in `daten/b1/auswertung.txt`, `daten/b2/auswertung.txt` und `daten/auswertung_b1_b2.txt`. Mit den Aufrufen aus Abschnitt 6 und denselben Samen lassen sie sich neu erzeugen.

### Was die Wanderung über die Struktur zeigt

1. **Die 26er-Verfahren sind fast starr.** In den gefundenen 26er-Verfahren über ℤ und 𝔽₂ teilen nur 3 oder 4 Paare von Produkten einen Faktor (`s2-spurB-r1/struktur.py`, etwa `z26_seed1`: Produkte 7 und 20 gleiches v, 9 und 18 gleiches v, 18 und 23 gleiches u). Nur dort sind Flips möglich.
2. **Die erreichbare Komponente auf Rang 26 ist winzig und hat genau q⁶ Elemente.** Ab `z26_seed1` erreicht die Wanderung über 𝔽₃ genau 729 = 3⁶ und über 𝔽₅ genau 15625 = 5⁶ verschiedene 26er-Verfahren, in Block 1 und Block 2 mit verschiedenem Samen dieselbe Zahl. Über 𝔽₂ sind es 96. Das spricht für eine sechsparametrige Familie, die die Flips nur innerhalb ihrer selbst bewegen (vermutet, nicht nachgerechnet).
3. **Die Plus-Übergänge führen nicht aus der Familie heraus.** Über 6000 Ausflüge auf Rang 27 und 28 kehrten stets in dieselbe Rang-26-Familie zurück (die Zahl der verschiedenen 26er blieb exakt q⁶). Auch der Start bei einem anderen 26er (`z26_seed4` statt des 𝔽₂-Laufs) ergab über 𝔽₂ fast dieselbe Menge: 96 und 96 Verfahren, zusammen nur 99.
4. **Von der Schulmethode aus ist 26 selten.** Über 𝔽₂ erreichte ein Lauf mit Neustarts in 5,6·10⁷ Schritten 26 einmal, mit nur 3 verschiedenen 26ern. In den Probeläufen kamen über ℤ 2 von 4 Läufen auf 26, über 𝔽₂ 1 von 4 (je 90 bis 180 Sekunden).
5. Folgerung (vermutet): Die gewöhnliche Flip-Graph-Wanderung ist für ⟨4,2,4⟩ auf Rang 26 fast blockiert. Dass Katalogsuchen mit Flip-Graphen dort nie unter 26 kamen (`lit/WACHE.md`), passt dazu. Mehr Rechenzeit mit derselben Methode verspricht wenig.

## 3. Methode 2: numerische Probe über ℝ (kein Beleg)

Code: `s2-spurB-r1/als.py`, Levenberg-Marquardt auf allen Faktoren zugleich, mit kleiner Ridge-Strafe (`REG`, alle 200 Schritte durch 10 geteilt) oder ohne. Gleitkomma, also nach Protokoll kein Beleg für irgendetwas. Es misst nur, wie nah Zufallsstarts einer exakten Zerlegung kommen. Residuum = quadrierte Frobenius-Norm von T − Σ u⊗v⊗w, `maxabs` = größter Betrag eines Faktoreintrags.

Kalibrierung an ⟨2,2,2⟩ mit Rang 7: Residuum 10⁻¹³ bis 10⁻¹⁶ in jedem Lauf.

### Block 3 (07:46 bis 08:07 UTC), je 1500 Iterationen

| Rang | Läufe | Residuum < 10⁻¹⁰ | Residuum zwischen 10⁻¹⁰ und 0,5 | Residuum ≥ 0,5 (meist genau 1 oder 2) |
|---|---|---|---|---|
| 26 | 58 | 2 (bestes 6,6·10⁻¹⁸, maxabs 1,28) | 33 | 23 |
| 25 | 45 | 0 | 4 (bestes 8,3·10⁻⁵ mit maxabs 37) | 41 |

### Block 4 (08:07 bis 08:28 UTC), Rang 25, je 6000 Iterationen

20 Läufe, alle mit Residuum ≥ 1.

### Deutung (vermutet)

- Rang 26 wird numerisch exakt erreicht, mit beschränkten Koeffizienten. Die Methode ist also scharf genug, um ein Verfahren dieser Größe zu finden.
- Rang 25 wurde nie exakt erreicht. Die kleinsten Residuen bei Rang 25 gingen mit großen Koeffizienten einher (maxabs 37 und 19). Das ist das typische Bild einer Näherung, deren Koeffizienten bei kleiner werdendem Fehler wachsen, also eher Grenzrang als Rang. Es könnte heißen, dass der Grenzrang von ⟨4,2,4⟩ höchstens 25 ist, während der Rang 26 bleibt. Das ist mit 65 Läufen und Gleitkomma nur ein Hinweis.
- Die vielen Läufe mit Residuum genau 1 oder 2 sind lokale Minima, in denen ein oder zwei Einträge des Tensors fehlen.

## 4. Was nicht versucht wurde

- SAT-Formulierung der Brent-Gleichungen über 𝔽₂ oder 𝔽₃ für Rang 25
- Ansätze mit erzwungener Symmetrie (etwa die Vertauschung A ↔ Bᵀ, die ⟨4,2,4⟩ wegen n = m besitzt: 25 = 1 Fixprodukt + 12 Paare)
- Anheben von 𝔽_p nach ℤ oder ℚ (es gab nichts anzuheben)
- Flip-Graph über ℤ mit Koeffizientenschranke 2 und über 𝔽₇
- Fremdmodelle (nicht nötig, kein kritischer Punkt im Sinn der Sperre in `STATUS.md`)

## 5. Empfehlung für die nächste Runde

1. **SAT mit Symmetrie über 𝔽₃** (und zum Vergleich 𝔽₂): Brent-Gleichungen für Rang 25 mit der Symmetrie A ↔ Bᵀ als Ansatz. Kleines Format (8·8·16 = 1024 Gleichungen), mit einem freien SAT-Löser (etwa kissat oder CaDiCaL, MIT-Lizenz) in 30-Minuten-Blöcken machbar. Ein UNSAT mit Symmetrieansatz schließt nur die symmetrischen Verfahren aus, das muss der Bericht dann klar sagen.
2. **Flip-Graph mit größerem Abstand nach oben**: viele unabhängige 26er-Familien aus der Schulmethode über 𝔽₃ sammeln (Neustarts) und von jeder aus mit Slack 3 bis 4 wandern, weil die einzelne Familie zu klein ist. Erwartung niedrig, Kosten gering.
3. **Grenzrang klären (Literatur)**: Ist der Grenzrang von ⟨2,4,4⟩ bekannt? Wenn er 25 oder kleiner ist, passt Abschnitt 3 dazu und sagt nichts über den Rang. Wenn er 26 wäre, wäre Spur B erledigt. Auftrag an den Literaturwächter.
4. Für Spur A ist der Befund aus Abschnitt 2 ein schwacher Hinweis zugunsten von 26 (vermutet): Die bekannten 26er sitzen isoliert, und es gibt keinen Weg durch den Flip-Graphen nach unten.

## 6. Dateien

| Datei | Inhalt |
|---|---|
| `verfahren/4x2x4-r26-s001.json` | Verfahren mit 26 Produkten über ℤ (Koeffizienten −1, 0, 1), Startpunkt und Kontrolle |
| `versuche/s2-spurB-r1/flip.c` | Flip-Graph-Wanderung (C, `gcc -O2 flip.c -o flip`; Format mit `-DNN= -DKK= -DMM=`, Standard 4, 2, 4) |
| `versuche/s2-spurB-r1/block.sh` | startet einen Block mit vier Prozessen und harter Zeitgrenze |
| `versuche/s2-spurB-r1/to_json.py` | wandelt eine Ausgabe von `flip.c` ins Format aus `verfahren/README.md` |
| `versuche/s2-spurB-r1/auswerten.py` | zählt verschiedene Verfahren und Invarianten in den Protokollen |
| `versuche/s2-spurB-r1/struktur.py` | listet Produktpaare mit gemeinsamem Faktor (rechnet über ℚ, daher nur für ℤ- und 𝔽₂-Ausgaben sinnvoll) |
| `versuche/s2-spurB-r1/als.py` | numerische Probe (Levenberg-Marquardt oder ALS, Gleitkomma) |
| `versuche/s2-spurB-r1/daten/z26_seed1.txt`, `z26_seed4.txt`, `f2_26_seed1.txt` | die drei 26er-Startverfahren als Ausgabe von `flip.c` (erstes wird zu `4x2x4-r26-s001.json`) |
| `versuche/s2-spurB-r1/daten/b1/` bis `b4/` | Protokolle der vier Blöcke (b1, b2 ohne `SCHEME`-Zeilen), Auswertungen, bei b1 auch die zuletzt besten Verfahren |

Aufrufe der Blöcke (aus `versuche/s2-spurB-r1/`, mit `OUT` und `FLIP` gesetzt, `D=daten`):

```
./block.sh b1 1700 "2 11 --start $D/f2_26_seed1.txt --plateau 1000000 --slack 1" "3 12 --start $D/z26_seed1.txt --plateau 1000000 --slack 1" "3 13 --start $D/z26_seed4.txt --plateau 1000000 --slack 1" "0 14 --start $D/z26_seed4.txt --plateau 1000000 --slack 1 --cap 1"
./block.sh b2 1700 "2 21 --start $D/z26_seed4.txt --plateau 300000 --slack 2 --drift 1" "3 22 --start $D/z26_seed1.txt --plateau 300000 --slack 2 --drift 1" "5 23 --start $D/z26_seed1.txt --plateau 300000 --slack 1 --drift 1" "2 24 --plateau 1000000 --slack 1 --restart 3000000 --drift 1"
# b3: REG=1e-3 bzw. REG=0, python3 als.py 26|25 <Samen 31..34> 1200
# b4: MAXIT=6000, REG=0 (Samen 41, 42) bzw. REG=1e-3 (43, 44), python3 als.py 25 <Samen> 1200
```

Hinweis zu Block 1: Er lief mit einer Fassung von `flip.c` ohne die Option `--drift`. Sie ist standardmäßig aus, das Verhalten ist dasselbe.

Status aller Aussagen dieses Berichts: **behauptet** (das 26er-Verfahren) oder **vermutet** (alle Deutungen in den Abschnitten 2 und 3). Eine Aussage „es gibt kein Verfahren mit 25“ macht dieser Bericht nicht.
