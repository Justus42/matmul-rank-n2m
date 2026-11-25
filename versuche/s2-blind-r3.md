# S2-08: Blind-Sucher Stufe 2, Runde 3 (4×2×4, 25 oder 26?)

Datum: 25.11.2026 · Rolle: Blind-Sucher · Auftrag S2-08 vom Orchestrator · Code und Rohdaten: `versuche/s2-blind-r3/`

## Ergebnis in drei Sätzen

Es wurde kein Verfahren mit 25 Produkten gefunden. Neu ist eine vollständige Fallliste für Zerlegungen über GF(2), die unter einer zyklischen Symmetrie ungerader Ordnung (3, 5 oder 7) aus GL₄ × GL₂ × GL₄ invariant sind. Für eine der Symmetrien der Ordnung 7 sind alle Fälle UNSAT (Status **behauptet**), für viele weitere Teilfälle ebenso; offen bleiben die Fälle mit wenigen Fixtermen und Ordnung 5.

Der Gesamtstand ändert sich dadurch nicht: als geprüft gilt weiter nur R(⟨4,2,4⟩) ≥ 25.

## 1. Gewählter Ansatz und Abgrenzung

Der Auftrag nannte lokale Suche, numerische Optimierung und SAT mit Symmetrieansatz als naheliegend. Ich habe zwei Dinge versucht:

1. **Hebung von 3×2×4 nach 4×2×4** (Abschnitt 2): eine Zerlegung von ⟨4,2,4⟩ zerfällt beim Abspalten einer Zeile in eine Zerlegung von ⟨3,2,4⟩ plus lineare und bilineare Nebenbedingungen. Die Idee war, Saatzerlegungen von ⟨3,2,4⟩ zu heben. Nach 2 Minuten war klar, dass ich keine schnelle Quelle für Saatzerlegungen habe. Ich habe den Ansatz deshalb zurückgestellt.
2. **Symmetrie ungerader Ordnung** (Abschnitt 3). Das ist ein SAT-Ansatz mit Symmetrie, also nur teilweise abseits des Naheliegenden. Er unterscheidet sich aber von einer Involution wie A ↔ Bᵀ: Die Bahnen haben Länge 3, 5 oder 7, die Gruppe wirkt nicht durch Vertauschen, und die Fallliste ist über Konjugationsklassen vollständig. Ich habe ihn gewählt, weil er pro Fall eine abgeschlossene Aussage liefert und nicht nur „nichts gefunden“.

Einen eigenen Beweisansatz für 26 habe ich nur angerissen (Abschnitt 4). Er bringt keinen Fortschritt über 25 hinaus.

## 2. Hebung 3×2×4 → 4×2×4 (zurückgestellt)

Man spaltet Zeile 3 ab: A = A′ ⊕ A₃ (Zeilen 0–2 und Zeile 3 von A), ebenso C = C′ ⊕ C₃. Ein Produkt (u, v, w) zerfällt in u = (u′, x) mit x ∈ F², und w = (w′, y) mit y ∈ F⁴. Die Brent-Gleichungen zerfallen dann in vier Blöcke:

- (1) Σ u′⊗v⊗w′ = ⟨3,2,4⟩
- (2) Σ u′⊗v⊗y = 0
- (3) Σ x⊗v⊗w′ = 0
- (4) Σ x⊗v⊗y = ⟨1,2,4⟩

Daraus folgen elementare Bedingungen, alle mit Status **behauptet**:

- Mindestens R(⟨3,2,4⟩) ≥ 20 Produkte haben u′ ≠ 0 und w′ ≠ 0. Grund: (1) und Yangs Schranke für n = 3, die in Stufe 1 in Lean formalisiert wurde.
- Mindestens 8 Produkte haben x ≠ 0 und y ≠ 0. Grund: (4), denn ⟨1,2,4⟩ ist in B konzis und hat deshalb Rang 8.
- Bei r = 25 gibt es deshalb für jede Wahl der abgespaltenen Zeile mindestens 3 Produkte, bei denen alle vier Teile u′, x, w′ und y ungleich null sind.
- **Kernbedingung:** Hält man (u′, v, w′) fest, liegen die vier Spalten y[·][k] im Kern der Matrix mit den Spalten u′_t ⊗ v_t. Die zwei Spalten x[·][j] liegen im Kern der Matrix mit den Spalten v_t ⊗ w′_t. Sind die 20 Rang-1-Matrizen u′_t⊗v_t einer minimalen Saat linear unabhängig, dann ist y = 0 auf der Saat. Dann muss (4) allein aus den höchstens 5 übrigen Produkten kommen, und das ist wegen Rang 8 unmöglich. Taugliche Saaten haben deshalb **linear abhängige** Paare u′⊗v.

Gescheitert ist der Ansatz an der Saat: Ein reines SAT-Modell für ⟨3,2,4⟩ mit Rang 20 über GF(2) (16 648 Variablen, CaDiCaL) fand in 2 Minuten keine Lösung. Für eine Saatquelle bräuchte es eine Flip-Suche für ⟨3,2,4⟩, also lokale Suche. Status des Ansatzes: **vermutet** (Idee ohne Beleg). Die Kernbedingung könnte aber als Filter für eine spätere Spur nützen.

## 3. Zerlegungen mit Symmetrie ungerader Ordnung über GF(2)

### 3.1 Aufbau

Ein Gruppenelement g = (P, Q, R) ∈ GL₄(2) × GL₂(2) × GL₄(2) bildet Zerlegungen auf Zerlegungen ab. Im Format von `verfahren/README.md` (w nicht transponiert) wirkt es so:

σ(u, v, w) = (Pᵀ u Q⁻ᵀ, Qᵀ v R⁻ᵀ, P⁻¹ w R)

Die Formel wurde nachgerechnet: σ bildet für drei Testelemente das Standardverfahren mit 32 Produkten wieder auf ein gültiges Verfahren ab.

Über GF(2) bestimmt ein Rang-1-Tensor ungleich null seine drei Faktoren eindeutig. Deshalb ist ein Produkt genau dann fix, wenn jeder Faktor fix ist. Hat g Primordnung d, so ist eine invariante Zerlegung eine Vereinigung von a Bahnen der Länge d und f Fixprodukten, mit a·d + f = r.

SAT-Modell: Für jede Bahn gibt es einen freien Vertreter. Die übrigen Bahnglieder sind lineare Bilder davon (als XOR kodiert). Fixprodukte sind frei, mit der linearen Nebenbedingung σ(t) = t. Dazu kommen alle 1024 Brent-Gleichungen. Nullprodukte sind erlaubt, das Modell fragt also nach Rang ≤ r. Gelöst wurde mit CryptoMiniSat (pycryptosat, XOR nativ, 1 Thread, 90 s pro Fall). Ein Kontrolllauf lief mit CaDiCaL 1.5.3 (pysat) auf der reinen CNF.

### 3.2 Fallliste

Konjugiert man g komponentenweise, ändert sich nur die Basis. Also genügt je eine Konjugationsklasse pro Komponente. Verwendete Klassen über GF(2):

- GL₄(2), Ordnung 3: `3a` = Ω ⊕ I₂ und `3b` = Ω ⊕ Ω, mit Ω der Begleitmatrix von x²+x+1.
- GL₄(2), Ordnung 5: `5`, Begleitmatrix von x⁴+x³+x²+x+1.
- GL₄(2), Ordnung 7: `7a` = Begleitmatrix von x³+x+1, ergänzt um 1; `7b` ebenso mit x³+x²+1.
- GL₂(2), Ordnung 3: `3` = Ω.

Zusätzlich wird die Transposition (A, B, C) ↦ (Bᵀ, Aᵀ, Cᵀ) ausgenutzt. Außerdem erzeugen g und g⁻¹ dieselbe Gruppe, und `7a`⁻¹ ist zu `7b` konjugiert.

Elementar unmöglich, ohne Rechnung (**behauptet**): Hat einer der drei Faktorräume keinen Fixvektor ungleich null, gibt es keine Fixprodukte, also f = 0. Bei d = 3 ist 25 nicht durch 3 teilbar. Das schließt 10 der 17 Klassen-Tripel der Ordnung 3 aus: (I,I,3b), (I,3,I), (I,3,3a), (I,3,3b), (3a,I,3b), (3a,3,I), (3b,I,I), (3b,I,3a), (3b,I,3b) und (3b,3,I). Die Dimensionen der Fixräume stehen in `s2-blind-r3/logs/fixdim.txt` (erzeugt von `fixdim.py`).

Gerechnet wurden die verbleibenden Fälle für r = 25:

| Symmetrie (P,Q,R) | Ordnung | mögliche f | UNSAT | Zeitgrenze 90 s |
|---|---|---|---|---|
| (7a, I, I) | 7 | 4, 11, 18, 25 | **alle** | – |
| (7a, I, 7a) | 7 | 4, 11, 18, 25 | 11, 18, 25 | 4 |
| (7a, I, 7b) | 7 | 4, 11, 18, 25 | 11, 18, 25 | 4 |
| (5, I, I) | 5 | 0 | – | 0 |
| (5, I, 5) | 5 | 0 | – | 0 |
| (3a, I, I) | 3 | 1, 4, …, 25 | 13–25 | 1–10 |
| (3a, I, 3a) | 3 | 1, 4, …, 25 | 13–25 | 1–10 |
| (3a, 3, 3a) | 3 | 1, 4, …, 25 | 16–25 | 1–13 |
| (3a, 3, 3b) | 3 | 1, 4, …, 25 | 16–25 | 1–13 |
| (3b, 3, 3b) | 3 | 1, 4, …, 25 | – | alle |

Zusammen: 59 Läufe, 29 UNSAT, 30 Zeitgrenze, keiner SAT. Die Rohdaten liegen unter `s2-blind-r3/logs/r25_*.txt`.

**Behauptung S2-08-a** (Status **behauptet**): Über GF(2) gibt es keine Zerlegung von ⟨4,2,4⟩ mit höchstens 25 Produkten, die unter g = (C₇ ⊕ 1, I₂, I₄) invariant ist. Gleiches gilt für (I₄, I₂, C₇ ⊕ 1) wegen der Transposition und für die Klasse 7b, weil sie dieselbe Gruppe erzeugt.

Belege dafür:

- CryptoMiniSat liefert UNSAT für f = 4, 11, 18, 25. Der schwerste Fall f = 4 brauchte 64 s.
- CaDiCaL liefert unabhängig UNSAT für f = 4 auf der reinen CNF in 34 s, mit DRAT-Beweis.
  - CNF: 3,2 MB, SHA-256 `b2149141…6ff6a`
  - DRAT: 58 MB, SHA-256 `48843799…de86e7`
  - Beide Dateien liegen nicht im Repo, weil sie zu groß sind. Sie lassen sich neu erzeugen mit `SOLVER=cadical CNF_OUT=<datei> python3 symsat.py 4 4 25 7a,I,I 4`.
- **drat-trim wurde nicht ausgeführt.** Den Bau aus dem Quellrepo hat die Plattform in dieser Sitzung verweigert. Der Beweis ist also nicht nachgeprüft.

Für Rang 28 mit derselben Symmetrie (f = 0) ist das Modell ebenfalls sofort UNSAT. Das deutet auf einen einfachen strukturellen Grund hin, den ich nicht gefunden habe.

### 3.3 Selbsttest und Kalibrierung (Schwachstellen)

**Selbsttest der Kodierung:** Über GF(2) gilt d·T = T für ungerades d. Die Vereinigung der σ-Bahnen der 32 Standardprodukte ist deshalb eine invariante Zerlegung vom Rang 32·d. Für (7a,I,I), (7a,I,7b), (5,I,5), (3a,3,3a) und (3b,3,3b) wurden die Bahnvertreter darauf festgelegt (`FIX_STANDARD=1`). Der Löser meldet SAT, und das dekodierte Verfahren besteht die interne Nachrechnung. Die Bahnkodierung lässt also echte Lösungen zu. Der Zweig mit den **Fixprodukten** ist in dieser Weise nicht positiv getestet.

**Kalibrierung:** Kein Symmetriefall hat bei Rang 26 bis 30 ein Verfahren gefunden:

- (3a,I,I) mit r = 26 und f = 2, sowie mit r = 28 und f = 1: jeweils Zeitgrenze nach 280 bzw. 400 s
- (3a,I,3a) mit r = 28 und f = 1: Zeitgrenze nach 400 s
- (5,I,5) und (5,I,I) mit r = 30: Zeitgrenze nach 280 s
- (7a,I,7a) mit r = 26 und f = 5: Zeitgrenze nach 400 s

Ob überhaupt eine 26er-Zerlegung mit einer dieser Symmetrien existiert, weiß ich deshalb nicht. Eine Zeitgrenze bei r = 25 ist darum **kein** Hinweis auf Nichtexistenz. Die UNSAT-Fälle sind dagegen vollständige Aussagen über ihre Ansatzklasse, sofern die Kodierung stimmt.

## 4. Eigener Beweisansatz für 26 (nur angerissen)

Die Zeilenschnitt-Bilanz aus Abschnitt 2 gilt über jedem Körper und für jede Zeile, jede Spalte von B und, zyklisch gelesen, auch für C. Ich hatte gehofft, durch Summieren über alle Schnitte einen Widerspruch bei r = 25 zu erzwingen. Die Schranken pro Schnitt (≥ 20 und ≥ 8) sind aber zu schwach: Ein Produkt mit u und v vom Rang 2 zählt in fast jedem Schnitt in beiden Gruppen. Einfache Substitution (ein Produkt über den Kern seines u-Faktors entfernen) bringt ebenfalls nichts. Die Einschränkung von ⟨4,2,4⟩ auf eine Hyperebene von A hat höchstens Rang 24, weil ⟨3,2,4⟩ plus ⟨1,1,4⟩ höchstens 20 + 4 ergibt. Status: **vermutet** bzw. ohne Ergebnis.

## 5. Sackgassen

- Reines SAT für ⟨3,2,4⟩ mit Rang 20 über GF(2) als Saatquelle: in 2 Minuten keine Lösung.
- SAT mit Symmetrie der Ordnung 3 und 5: Selbst bei Rang 26 bis 30 fand sich in bis zu 400 s nichts. Für Ordnung 5 ist schon die kleinste Instanz (160 freie Bits) zu schwer für CryptoMiniSat.
- Fall (3b,3,3b): Selbst f = 25, also nur Fixprodukte mit 16 freien Bits pro Produkt, erreicht die Zeitgrenze.

## 6. Vorschlag für den nächsten Schritt

1. **Prüfer für S2-08-a:** DRAT-Beweis für (7a,I,I) mit f = 4 neu erzeugen und mit drat-trim prüfen. Die Fälle f = 11, 18, 25 ebenso, sie sind in unter 1 s UNSAT. Ein zweiter Prüfer schreibt die Kodierung unabhängig nach (Wirkung σ, Fixbedingung) und vergleicht. Dann könnte S2-08-a als erstes neues geprüftes Artefakt der Spur zählen. Es betrifft allerdings nur eine Ansatzklasse.
2. **Strukturgrund für Ordnung 7 suchen:** Dass schon Rang 28 sofort UNSAT ist, spricht für ein kurzes Argument, etwa über die Singer-Bahn der 7 Vektoren ungleich null in F₂³. Ein solches Lemma wäre billiger zu prüfen als ein DRAT-Beweis.
3. **Offene Fälle** (Ordnung 7 mit f = 4, Ordnung 5 und Ordnung 3 mit kleinem f) nur nach erfolgreicher Kalibrierung bei Rang 26 weiterrechnen, sonst sind Zeitgrenzen wertlos. Würfelung über die Werte des ersten Bahnvertreters wäre der naheliegende Weg.
4. Die Hebung aus Abschnitt 2 lohnt nur, wenn eine Spur ohnehin viele ⟨3,2,4⟩-Verfahren erzeugt. Die Kernbedingung ist dann ein billiger Vorfilter.

## 7. Was ich trotz Blindheit gesehen habe

- **Projektgedächtnis:** Es wurde beim Start automatisch mitgegeben, samt dem Inhalt mehrerer verlinkter Einträge, ohne dass ich sie geöffnet habe. Darin standen Kurzfassungen der Stufe-2-Berichte S2-01, S2-03, S2-04, S2-05 und S2-06:
  - Flip-Graph über F2, F3, F5 und Z ohne 25er
  - ALS über R und C ohne 25er
  - SAT mit A ↔ Bᵀ-Symmetrie über F2, UNSAT für einige Fixpunktzahlen, mit Lemma zu τ-invarianten Verfahren
  - Lemma M zur Substitution
  - Yang-Restfälle (rkL, rkH)

  Die Wahl, **keine** Involution und **keine** Flip-Suche zu verwenden, ist davon beeinflusst. Die Sätze und Lemmata daraus habe ich nicht benutzt.
- **Sonst gesehen:**
  - Dateinamen beim Auflisten des Repos: `lean/prosa/s2_444_spurA_r1.md`, `…_r2.md`, `verfahren/4x2x4-r26-s001.json`, `lit/WACHE.md`, `versuche/`. Geöffnet habe ich keine davon.
  - Die Titel der letzten fünf Commits auf `main` (S2-04, S2-05, S2-06).
- **Gelesen habe ich nur** `PROTOKOLL.md`, `CLAUDE.md`, `verfahren/README.md`, `pruefer/README.md` und den Anfang von `pruefer/python/README.md`. `LOG.md` und `STATUS.md` habe ich nicht gelesen.

## Dateien

- `s2-blind-r3/brent.py`: CNF/XOR-Kodierer für Brent-Gleichungen über GF(2)
- `s2-blind-r3/symsat.py`: Symmetrieansatz; Aufruf `python3 symsat.py 4 4 <r> <P,Q,R> <f> [sekunden]`; Umgebungsvariablen `SOLVER=cadical CNF_OUT=…` (DRAT) und `FIX_STANDARD=1` (Selbsttest)
- `s2-blind-r3/jobs25.txt`: die 59 Fälle für Rang 25
- `s2-blind-r3/logs/`: ein JSON-Ergebnis pro Lauf (`r25_*` Rang 25, `cal_*` Kalibrierung, `drat_*` CaDiCaL-Kontrolllauf)

Kein Verfahren abgelegt, deshalb keine Prüfung durch die Prüfprogramme nötig.
