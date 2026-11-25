# S2-01: Blindsuche zum Rang von ⟨4,2,4⟩, Runde 1

Stand: 25.11.2026. Bearbeiter: Thread „Rang von 4×2×4 blind angehen“.

## Ergebnis in einem Absatz

Kein Verfahren mit 25 Multiplikationen gefunden, kein Beweis von R ≥ 26. Eine Flip-Graph-Suche über GF(2) erreicht Rang 26 zuverlässig (rund 2,2 Millionen Ankünfte auf Rang 26, rund 145 000 verschiedene Verfahren, alle exakt geprüft), aber nie 25. Über GF(3) kommt dieselbe Suche in der gegebenen Zeit nicht einmal unter 32 und taugt in dieser Form nichts. An den gefundenen 26er Verfahren fällt eine Struktur auf: Fast alle sind für die Substitution „inneren Index von 2 auf 1 drücken“ scharf, das heißt 10 Terme fallen weg und 16 bleiben für ⟨4,1,4⟩. Daraus ergibt sich eine Beweisstrategie mit einem klar benannten offenen Lemma (Abschnitt 5). Status aller Aussagen unten: vermutet oder behauptet, nichts davon geprüft.

## 1. Was ich gelesen habe und was nicht

Im Repo habe ich nur `CLAUDE.md` gelesen und die Namen der Ordner auf oberster Ebene gesehen. `PROTOKOLL.md`, `LOG.md`, `STATUS.md`, `lit/`, `lean/`, `versuche/`, `verfahren/` und `behauptungen/` habe ich nicht geöffnet.

Offenlegung: Die Sitzung hat mir beim Start automatisch Notizen aus dem Projektgedächtnis mitgegeben. Daraus kannte ich ohne eigenes Zutun den Literaturstand: obere Schranke 26 über Z, Z_2 und Q (Kataloge, AlphaTensor, AlphaEvolve), untere Schranke 25 aus Yang v3, über F2 eine Kette von Zertifikatsarbeiten aus 2026 zu kleineren Formaten, aber nicht zu ⟨2,4,4⟩. Ganz blind war ich also nicht. Eigene Literaturrecherche habe ich nicht gemacht, weil die Notizen die Frage nach dem Stand schon beantworteten und die Zeit in die Rechnung gehen sollte.

## 2. Bezeichnungen

⟨4,2,4⟩ = Σ_{i,k,j} a_{ik} ⊗ b_{kj} ⊗ c_{ij} mit i, j ∈ {1..4}, k ∈ {1,2}. Invariant geschrieben: A = U⊗V*, B = V⊗W*, C = W⊗U* mit dim U = dim W = 4, dim V = 2, und der Tensor ist die Kontraktion der drei Identitäten. Ein Faktor a_t ∈ A ist eine 4×2-Matrix, b_t eine 2×4-Matrix, c_t eine 4×4-Matrix.

## 3. Rechnung 1: Flip-Graph-Suche über GF(2)

### Verfahren

Programm `s2-blind-r1/flip.c` (C, eigener Code, keine fremden Quellen). Zufallsweg im Flip-Graphen nach Kauers und Moosbauer, aus dem Gedächtnis nachgebaut:

- Start: Standardverfahren mit 32 Termen.
- Flip: Teilen zwei Terme einen Faktor x, dann x⊗y_i⊗z_i + x⊗y_j⊗z_j = x⊗(y_i+y_j)⊗z_i + x⊗y_j⊗(z_j+z_i).
- Reduktion: Stimmen zwei Terme in zwei Faktoren überein, werden sie zu einem verschmolzen (oder fallen beide weg).
- Plus-Übergang gegen Plateaus: x⊗y⊗z + x'⊗y'⊗z' = (x+x')⊗y⊗z + x'⊗y⊗z + x'⊗y'⊗z', erlaubt bis zum besten Rang plus 2 bis 4.
- Rücksprung auf ein Verfahren besten Rangs, wenn der Weg zu lange darüber bleibt.
- Jedes Verfahren wird nach jeder Reduktion exakt gegen den Zieltensor geprüft (Bitmasken über GF(2), keine Gleitkommazahlen). Kein einziger Prüffehler.

Zwei Fehler meiner ersten Fassung, beide behoben und hier vermerkt, damit sie niemand wiederholt: (1) Nach einem Plus-Übergang darf man nicht sofort reduzieren, weil die zwei neuen Terme absichtlich zwei Faktoren teilen und die Reduktion den Übergang sofort zurücknimmt. (2) Die Plateau-Schwelle muss klein sein (3·10^5 bis 10^6 Versuche), sonst bleibt der Weg bei 27 oder 28 hängen.

### Gegenproben

Mit demselben Programm über GF(2) in je 20 bis 60 Sekunden erreicht: ⟨2,2,2⟩ Rang 7, ⟨2,2,3⟩ Rang 11, ⟨3,2,3⟩ Rang 15, ⟨3,2,4⟩ Rang 20, ⟨3,2,5⟩ Rang 25. Das sind jeweils die aus der Literatur bekannten oberen Schranken. Die Suche ist also nicht grundsätzlich zu schwach für dieses Format.

### Läufe für ⟨4,2,4⟩, Ziel 25

Alle Läufe im Vordergrund, 4 Prozesse parallel, jeder Block unter 10 Minuten, insgesamt rund 40 Minuten Wandzeit auf 4 Kernen.

| Block | Samen | Laufzeit je Prozess | bester Rang | Ankünfte auf Rang 26 | verschiedene 26er Verfahren |
|---|---|---|---|---|---|
| Einstellung (fehlerhafte Fassung) | 11–14, 21–24, 31–34, 41–44 | 170–540 s | 26 (selten), sonst 27–28 | wenige | nicht gezählt |
| Hauptlauf 1 | 101–104 | 550 s | 26 | 698 289 | nicht gezählt |
| Hauptlauf 2 | 301–304 | 540 s | 26 | 1 522 228 | 144 895 |
| Abzug für Analyse | 401–404 | 200 s | 26 | – | 31 272 gespeichert |

„Verschiedene Verfahren“ heißt exakt verschieden als Termmenge (Hashwert über die sortierten Terme), nicht bis auf Symmetrie. Die Symmetriegruppe von ⟨4,2,4⟩ über GF(2) hat Ordnung in der Größenordnung |GL4(F2)|²·|GL2(F2)|·2 ≈ 4,9·10^9, die 145 000 Verfahren können also in sehr wenigen Bahnen liegen. Die Zahl sagt nur, dass der Weg sich bewegt und nicht an einer Stelle festsitzt.

Ergebnis: Rang 25 nie erreicht. Status: **vermutet**, dass R_F2(⟨4,2,4⟩) = 26. Die Suche ist ein Indiz, kein Beweis: Ein Zufallsweg kann eine Zusammenhangskomponente des Flip-Graphen nie verlassen, und ob alle 25er Verfahren (falls es sie gibt) in einer anderen Komponente liegen, weiß ich nicht.

## 4. Rechnung 2: Flip-Graph-Suche über GF(3)

Grund: Ein 25er Verfahren könnte wie bei AlphaEvolves 32er Verfahren für ⟨4,2,5⟩ den Koeffizienten ½ brauchen und wäre dann über GF(2) unsichtbar. Programm `s2-blind-r1/flip3.c`, Vektoren über GF(3) als zwei Bitmasken, Flips mit Faktor ±1, Gleichheit von Faktoren bis auf Vorzeichen, exakte Prüfung modulo 3.

Gegenproben: ⟨2,2,2⟩ erreicht 7, ⟨3,2,3⟩ erreicht 15. Aber ⟨3,2,5⟩ bleibt nach 25 s bei 30, und ⟨4,2,4⟩ bleibt in 4 × 540 s bei 32: Vom Standardverfahren aus findet der Weg keine einzige Reduktion unter 32.

Status: **aufgegeben** in dieser Form. Vermuteter Grund: Über GF(3) gibt es mehr Flips pro Paar und weniger zufällige Übereinstimmungen in zwei Faktoren, die Reduktionen werden selten. Abhilfe für eine nächste Runde: nicht vom Standardverfahren starten, sondern von einem ganzzahligen 26er Verfahren modulo 3, oder gezielt Reduktionen suchen (für jedes Paar mit gemeinsamem Faktor prüfen, ob ein Flip eine Reduktion möglich macht), statt rein zufällig zu flippen.

## 5. Untere Schranke: Substitution an den gefundenen Verfahren getestet

### Drei einfache Substitutionen

Für jede Zerlegung T = Σ_{t=1}^r a_t⊗b_t⊗c_t gibt es drei Arten, ⟨4,2,4⟩ auf ein kleineres Format zu projizieren. Ich habe sie selbst hergeleitet; jede ist eine Rechnung von wenigen Zeilen, aber von niemandem geprüft:

1. **Zeile streichen.** Wähle x ∈ U, y ∈ U* mit y(x) ≠ 0. Die Projektion A → A/(x⊗V*), C → C/(W⊗y) bildet T auf ⟨3,2,4⟩ ab (die Paarung ker y → U/x ist genau dann ein Isomorphismus, wenn y(x) ≠ 0). Terme mit a_t ∈ x⊗V* oder c_t ∈ W⊗y fallen weg. Also r ≥ R(⟨3,2,4⟩) + S_row. Mit R(⟨3,2,4⟩) = 20 (Literatur, von mir nicht nachgeprüft) folgt r ≥ 20 + S_row.
2. **Spalte streichen.** Dasselbe auf der W-Seite, Ziel ⟨4,2,3⟩, r ≥ 20 + S_col.
3. **Inneren Index auf 1 drücken.** Wähle l ∈ V*, m ∈ V mit l(m) ≠ 0. Projektion A → A/(U⊗l), B → B/(m⊗W*) bildet T auf ⟨4,1,4⟩ ab. Terme mit a_t ∈ U⊗l oder b_t ∈ m⊗W* fallen weg. R(⟨4,1,4⟩) = 16 über jedem Körper (Abflachung, elementar). Also r ≥ 16 + S_mid.

Dabei ist S jeweils die größte Zahl wegfallender Terme über alle erlaubten Paare. Für ein 25er Verfahren müsste gelten: S_row ≤ 5, S_col ≤ 5 und S_mid ≤ 9.

### Messung an 31 272 Verfahren vom Rang 26 über GF(2)

Programm `s2-blind-r1/analyse.py`, prüft jedes Verfahren erneut exakt und zählt.

| Größe | Verteilung |
|---|---|
| S_row | 4: 7 309, 5: 13 576, 6: 10 387 |
| S_col | 4: 7 246, 5: 13 592, 6: 10 434 |
| max(S_row, S_col) | 4: 1 310, 5: 13 758, 6: 16 204 |
| S_mid | 9: 5, 10: 31 267 |

Weitere Beobachtung: In den häufigsten Verfahren sind 20 der 26 Faktoren a_t Matrizen vom Rang 1, ebenso 19 bis 20 der b_t.

Lesart:

- Die Zeilen- und Spaltensubstitution ist nur bei rund der Hälfte der Verfahren scharf (S = 6). Sie ist als allgemeiner Beweisweg für 26 wenig aussichtsreich.
- Die innere Substitution ist bei 31 267 von 31 272 Verfahren scharf: 10 Terme fallen weg, 16 bleiben. Diese Verfahren haben also fast alle die Gestalt „⟨4,1,4⟩ mit 16 Termen plus 10 Korrekturterme“.
- Fünf Verfahren haben S_mid = 9 (gespeichert in `s2-blind-r1/beispiele-rang26-f2.txt`). Sie zeigen, dass „S_mid ≥ r − 16“ keine allgemeine Eigenschaft jeder Zerlegung ist. Für r = 25 bräuchte man aber S_mid ≥ 10 = r − 15, also mehr als bei diesen Ausnahmen. Ein Widerspruch zur Strategie unten ist das nicht, aber eine Warnung.

### Beweisstrategie mit offenem Lemma

Ziel: R(⟨4,2,4⟩) ≥ 26 über einem Körper F (zuerst F = GF(2)).

**Lemma M (offen, Status vermutet).** In jeder Zerlegung von ⟨4,2,4⟩ über F mit 25 Termen gibt es l ∈ V*, m ∈ V mit l(m) ≠ 0, sodass mindestens 10 Terme a_t ∈ U⊗l oder b_t ∈ m⊗W* erfüllen.

Aus Lemma M folgt sofort 25 ≥ 16 + 10, Widerspruch, also R ≥ 26. Warum ich das Lemma für angreifbar halte:

- Über GF(2) hat V nur drei Richtungen. Jeder Faktor a_t ist entweder vom Rang 2 oder vom Rang 1 mit einer von drei inneren Richtungen l; ebenso b_t mit einer von drei Richtungen m. Ein 25er Verfahren wird so in höchstens 4 × 4 Klassen (Rang 2 oder Richtung 1, 2, 3 für a; dasselbe für b) eingeteilt, und Lemma M ist eine Aussage über diese Klassengrößen. Teil-Lemma M1, das man zuerst angehen sollte: Höchstens wenige a_t und b_t haben Rang 2. Hier sind es typischerweise 6 von 26. Rang-2-Faktoren a_t ∈ U⊗V* bilden eine offene Bahn, und ein Abzählargument über die Abflachung T_B : B* → A⊗C könnte eine obere Schranke für ihre Zahl liefern.
- Die Ausnahmen mit S_mid = 9 bei Rang 26 sollte man genau ansehen: Wo stehen dort die Rang-2-Faktoren? Lässt sich bei ihnen die Substitution durch eine zweite (Zeile oder Spalte) ergänzen? Die Daten liegen bei.
- Die Folge der bekannten exakten Werte passt durchweg zur Formel von Hopcroft und Kerr ⌈(3nm + max(n,m))/2⌉: ⟨2,2,2⟩ = 7, ⟨2,2,4⟩ = 14, ⟨3,2,3⟩ = 15, ⟨3,2,5⟩ = 25. Für ⟨4,2,4⟩ ergibt die Formel 26. Status: **vermutet**, dass R = 26 über jedem Körper. Der Unterschied 25 gegen 26 entspricht genau dem Summanden max(n,m)/2 = 2 gegenüber der allgemeinen Schranke 3nm/2 + 1 = 25. Bei ⟨2,2,4⟩ ist dieser Summand bewiesen (14 statt 13); die Beweistechnik für ⟨2,2,m⟩ wäre die erste Stelle, nach einem übertragbaren Argument zu suchen. Diese Beweise habe ich in dieser Runde nicht gelesen.

## 6. Was ich für den aussichtsreichsten nächsten Schritt halte

1. **GF(2)-Zertifikat statt Zufallssuche.** Die Flip-Suche kann 25 nur finden, nicht ausschließen. Für einen Ausschluss über GF(2) würde ich die Klasseneinteilung aus Abschnitt 5 als Fallunterscheidung nehmen: Fixiere mit Symmetrie die Anzahlen und Richtungen der Rang-1-Faktoren a_t, b_t, und löse in jedem Fall das verbleibende System mit einem SAT-Löser über GF(2) (Brent-Gleichungen, 25 Terme, a 8 Bit, b 8 Bit, c 16 Bit). Ohne die Fallunterscheidung ist ein SAT-Ansatz für 25 × 32 Unbekannte vermutlich zu groß, mit Symmetriebrechung über die drei Richtungen von V eventuell nicht.
2. **Lemma M1 zuerst**: obere Schranke für die Zahl der Rang-2-Faktoren a_t in einer 25er Zerlegung. Das ist ein kleines, in sich geschlossenes Problem.
3. **Charakteristik ungleich 2**: Ein 25er Verfahren mit ½ ist durch diese Runde nicht ausgeschlossen. Wer das prüfen will, braucht eine bessere Suche über GF(3) oder GF(5) (Abschnitt 4) oder eine Suche über Q mit exaktem Nachrechnen.

## 7. Dateien

- `s2-blind-r1/flip.c`: Flip-Graph-Suche über GF(2). Aufruf `./flip seed sekunden ziel plateau N K M extra restart`, mit Umgebungsvariable `DUMP=datei` werden verschiedene Verfahren besten Rangs geschrieben. Übersetzen mit `gcc -O2 -o flip flip.c`.
- `s2-blind-r1/flip3.c`: dasselbe über GF(3).
- `s2-blind-r1/analyse.py`: exakte Prüfung und Substitutionszählung für abgezogene Verfahren.
- `s2-blind-r1/beispiele-rang26-f2.txt`: vier 26er Verfahren über GF(2) und die fünf Verfahren mit S_mid = 9. Format im Kopf der Datei. Prüfbar mit `analyse.py`.

Die rund 31 000 abgezogenen Verfahren habe ich nicht eingecheckt (zu groß, jederzeit mit Samen 401 bis 404 und 200 s neu erzeugbar; die genaue Folge hängt aber an der Laufzeit, also nicht bitgenau reproduzierbar).

## 8. Statusübersicht

| Aussage | Status |
|---|---|
| Rang-26-Verfahren über GF(2) existieren (hier rund 145 000 verschiedene gefunden) | behauptet (Prüfung im Programm, nicht unabhängig) |
| Flip-Suche über GF(2) erreicht in rund 40 Minuten auf 4 Kernen nie Rang 25 | behauptet |
| R_F2(⟨4,2,4⟩) = 26 | vermutet |
| R(⟨4,2,4⟩) = 26 über jedem Körper | vermutet |
| Drei Substitutionsschranken r ≥ 20 + S_row, 20 + S_col, 16 + S_mid | behauptet (Herleitung oben, ungeprüft) |
| Lemma M | vermutet, offen |
| Flip-Suche über GF(3) in dieser Form | aufgegeben |
