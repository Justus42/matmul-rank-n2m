# N-07: Abschrift aus TR 69-44 (Hopcroft und Kerr, 1969)

Rolle: Prüfer. Gegenstand: Wortlaut von Theorem 1 (gedruckte Seite 8) und der Stellen zu Optimalität und einzelnen Formaten auf den gedruckten Seiten 27 und 28.

## 0. Offenlegung

Eingeblendet waren mir aus dem Projektgedächtnis:

- der Index `MEMORY.md` des Projekts (Repo, Ziel mit den Formaten 4×2×4, 3×2×7, 4×2×5 und 3×2×6, Regeln zur Rolle des Orchestrators, zu Prüferaufträgen, zum Fremdmodell, zur Literaturwache, Verweise auf `verfahren-datenformat` und `lean-project-ci`). Er enthält nichts über TR 69-44, Theorem 1 oder eine Vermutung.
- die Einzeleinträge `gemini-bridge` (Bridge-Freigaben, Zeitlimit), `aussagen-abgleich-n3` (Bridge und lokaler Lean-Bau) und `git-regeln` (Commit- und PR-Regeln). Keiner davon betrifft den Gegenstand dieses Auftrags.

Weitere Spuren:

- Die Nachricht von Justus am Anfang des Threads nennt einen Bericht „N-05“, den ich nicht sehen soll. Ich kenne nur diese Bezeichnung, nicht seinen Inhalt oder Dateinamen. Ich habe ihn nicht geöffnet und `palomar/` nicht aufgelistet.
- Um Abschnitt 5 von `PROTOKOLL.md` zu finden, habe ich die Liste der Abschnittsüberschriften (Zeilen mit `## `) ausgegeben. Darüber hinaus habe ich nur Abschnitt 5 gelesen.
- Die Seite des Handles nennt zwei Dateien: das PDF und eine PostScript-Fassung `69-44.ps`. Beim Herunterladen wurde die PostScript-Datei mitgeladen; ich habe sie ungelesen gelöscht.
- Keine Sekundärquelle, kein SIAM-Artikel, kein Fremdmodell, keine Subagenten.

## 1. Quelle

- Handle: https://hdl.handle.net/1813/5902 (leitet auf ecommons.cornell.edu weiter)
- Datei: `https://ecommons.cornell.edu/bitstreams/85a69e16-f009-4cd9-bc67-c5208131d051/download`, weitergeleitet auf `cf003.cdn.4science.cloud`, Dateiname `69-44.pdf`
- Größe: 994 044 Byte, PDF 1.2, 34 Seiten, jede Seite ein Schwarzweiß-Scan (CCITT, 600 dpi), keine Textebene
- SHA-256: `93cfdd571ecfb8e2ea7c9aa3fd78b9389b75bb56899b8b706dc05c2ae2d99b48`
- Gelesen: die eingebetteten Seitenbilder in voller Auflösung (600 dpi), in Streifen geschnitten, Formelzeile zusätzlich vergrößert.

Seitenzuordnung (aufgedruckte Seitenzahl gegen PDF-Seite): gedruckte Seite 8 = PDF-Seite 10, gedruckte Seite 27 = PDF-Seite 29, gedruckte Seite 28 = PDF-Seite 30.

Das PDF liegt nicht im Repo.

## 2. Abschrift

Schreibweise: Die Schreibmaschine setzt „kleiner oder gleich“ als unterstrichenes `<` und „größer oder gleich“ als unterstrichenes `>`. Ich gebe sie als `≤` und `≥` wieder. Indizes stehen als `a_ij`. Silbentrennungen am Zeilenende sind aufgelöst und mit `|` als Zeilenende nicht markiert; die Zeilenumbrüche des Scans sind nicht übernommen.

### 2.1 Theorem 1, gedruckte Seite 8 (PDF-Seite 10)

> Theorem 1: Let A be a p×2 matrix whose elements are indeterminants a_ij, 1≤i≤p, 1≤j≤2 and let X be a 2×n matrix whose elements are indeterminants x_jk, 1≤j≤2, 1≤k≤n. Then ⌈ (3pn + max (n,p))/2⌉ multiplications are sufficient to compute AX without making use of commutativity.

Unsichere Stellen:

- [unsicher: Form der Klammern um den Bruch] Gedruckt sind eine linke Klammer, die wie `⌈` aussieht (senkrechter Strich mit Haken oben), und eine rechte, die wie `⌉` aussieht. Ich lese sie als Aufrundungsklammern ⌈ ⌉. Abrundungsklammern ⌊ ⌋ würden einen Haken unten zeigen; den sehe ich nicht.
- [unsicher: Satzzeichen nach `x_jk`] Hinter `x_jk` steht ein hochgestelltes Zeichen, das ein Komma oder ein Apostroph sein kann. Hinter `a_ij` steht ein tiefgestelltes Komma.
- „indeterminants“ ist so gedruckt (nicht „indeterminates“).
- Zwischen `max` und `(n,p)` steht ein Leerzeichen, ebenso zwischen `⌈` und `(3pn`.

### 2.2 Gedruckte Seite 27 (PDF-Seite 29), Stellen zu einzelnen Formaten

> Lemma 12: If an algorithm for the 3×2 by 2×3 case has eight or more multiplications not equivalent to a_31β, then the algorithm has at least 15 multiplications.

> Proof: At least one group of the corollary to Lemma 11 must have two or more multiplications, and the proof follows immediately from Lemma 11.

> Theorem 6: Any algorithm for the 3×2 by 2×3 case requires 15 multiplications.

> Proof: The algorithm requires at least 11 multiplications to compute the first two rows by Theorem 5. If one of these is equivalent to a_31β, then the theorem is true by Lemma 8 [unsicher: 8]. If none of the multiplications is equivalent to a_31β, then the theorem is true by Lemma 12.

### 2.3 Gedruckte Seiten 27 bis 28, die Vermutung

Satz davor (Seite 27, letzter Satz des Beweises von Theorem 6):

> If none of the multiplications is equivalent to a_31β, then the theorem is true by Lemma 12.

Die Stelle selbst (Seite 27 unten, fortgesetzt auf Seite 28 oben):

> A detailed case analysis of the 3×2 by 2×4 case seems to indicate that 19 multiplications are required rather than the 20 of Theorem 1. However, we conjecture that 20 are required and the algorithm of Theorem 1 is optimal for all n and p.

Satz danach (Seite 28):

> We now turn our attention to matrix multiplication in which the multiplication operation is commutative.

Zur Lesbarkeit: Alle Wörter dieser Stelle sind sicher lesbar. „seems“, „conjecture“ und „optimal“ stehen genau so da. Auf Seite 27 endet die Zeile mit „However,“ und Seite 28 beginnt mit „we conjecture“ in Kleinschreibung.

### 2.4 Gedruckte Seite 28 (PDF-Seite 30), weitere Stellen zu einzelnen Formaten

> A method due to Robert Wagner [4] will be described which computes A × X, where A is an m×2 matrix and X is a 2×n matrix, using only mn+m+n multiplications.

> Clearly this algorithm requires just mn+ m + n multiplications. If we set m=2 and compare this with the minimal bound for non-commutative multiplication, we find that Wagner's method requires fewer multiplications for all n≥5. Thus we have the following theorem:

> Theorem 7: The minimum number of multiplications necessary for matrix multiplication is less for the commutative case than for the non-commutative case.

Unsichere Stellen: In „n≥5“ ist der Strich unter `>` deutlich zu sehen, ich lese ≥. Die Zeile „mn+ m + n“ hat die Leerzeichen so wie gedruckt.

Weitere Sätze mit „conjecture“, „believe“, „seems“ oder „optimal“ gibt es auf den Seiten 27 und 28 nicht.

## 3. Bedeutung in heutiger Schreibweise (getrennt von der Abschrift)

Die Autoren zählen Multiplikationen ohne Kommutativität, also bilineare Verfahren; das entspricht dem Tensorrang von ⟨p,2,n⟩.

- **Theorem 1:** Für das Produkt einer p×2- mit einer 2×n-Matrix genügen ⌈(3pn + max(n,p))/2⌉ Multiplikationen, also R(⟨p,2,n⟩) ≤ ⌈(3pn + max(n,p))/2⌉. Für 4×2×4 (p = n = 4) ergibt die Formel ⌈(48 + 4)/2⌉ = 26.
- **Lemma 12 und Theorem 6:** Für 3×2×3 sind 15 Multiplikationen nötig, R(⟨3,2,3⟩) ≥ 15; die Formel aus Theorem 1 ergibt dort ⌈(27 + 3)/2⌉ = 15, also Gleichheit.
- **Satz „A detailed case analysis …“:** Für 3×2×4 deutet eine Fallunterscheidung der Autoren auf 19 nötige Multiplikationen statt der 20, die die Formel aus Theorem 1 ergibt (⌈(36 + 4)/2⌉ = 20); dies ist keine bewiesene Aussage.
- **Vermutung:** Die Autoren vermuten, dass für 3×2×4 20 Multiplikationen nötig sind und dass die Formel aus Theorem 1 für alle n und p optimal ist, also R(⟨p,2,n⟩) = ⌈(3pn + max(n,p))/2⌉; für 4×2×4 hieße das Rang 26.
- **Wagners Verfahren und Theorem 7:** Mit Kommutativität genügen für m×2 mal 2×n schon mn + m + n Multiplikationen; für m = 2 und n ≥ 5 ist das weniger als die nichtkommutative Schranke, weshalb kommutative Verfahren (nicht bilinear) weniger brauchen. Das betrifft nicht den Tensorrang.
