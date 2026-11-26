# N-05: Technischer Bericht TR 69-44 von Hopcroft und Kerr

Rolle: Prüfer. Auftrag N-05 (dritter Anlauf), Nacharbeit außerhalb der Runden.
Gegenstand: Was der Technische Bericht TR 69-44 beweist, verglichen mit der Quellennotiz und der Beschreibung in `lean/formalization.yaml` (Commit 676cdf5deb786e81a66342606d4dd2b6f919745e).

Alle Angaben dieses Berichts sind beim Lesen entstanden und ungeprüft. Den Status setzt der Orchestrator.

## 0. Offenlegung

**Eingeblendete Einträge des Projektgedächtnisses:**

1. Der Index `MEMORY.md` vollständig. Er nennt unter anderem das Ziel des Projekts (Formate 4×2×4, 3×2×7, 4×2×5, Lean für 3×2×6), die Protokollfassung 0.7, die Regeln für Stufe 5 (Spuren P und K, Budget), die Rechte und Grenzen des Orchestrators, das Fremdmodell und die Bridge, die Anweisungen von Justus zu Prüferaufträgen, zur Bezeichnung „blind“ und zu den freigegebenen Domains, die Literaturwache und Verweise auf die Einträge `verfahren-datenformat` und `lean-project-ci`.
2. Der Einzeleintrag `hk-verfahren-a10` mit dem Wortlaut: „A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 (cac2c55).“ und einem Hinweis zum Datenformat. Er nennt Verfahrensdateien mit der Kennung „hk71“ und dem Zahlbereich ℤ.

Ich habe nichts ins Gedächtnis geschrieben.

**Sonst gesehen, außerhalb der Positivliste:**

- Beim Anlegen des Zweigs der Betreff des letzten Commits auf `main`: „Nacharbeit: N-01, N-03, N-04 und Vergabe N-02 eingetragen“.
- Beim Anlegen dieser Datei die Dateinamen `n-02-bericht.md`, `n-03-bericht.md`, `n-04-bericht.md` in `palomar/nacharbeit/`. Geöffnet habe ich keine davon.
- Der Auftrag selbst nannte vorab, dass die Notiz in den Zeilen 57–69 sagt, der Originalartikel sei nicht gelesen worden. Ein Urteil zum Ergebnis enthielt er nicht.
- Die Namen der Projektdateien (`A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md`) standen im Sitzungskontext. Geöffnet habe ich keine.

Gelesen habe ich: `CLAUDE.md`, `PROTOKOLL.md` Abschnitt 5, `lean/formalization.yaml` beim genannten Commit nur die Zeilen 13–27 und 40–84, `lit/QUELLEN.md` und den Bericht TR 69-44.

## 1. Die gelesene Quelle

- Eintragsseite: https://hdl.handle.net/1813/5902, weitergeleitet auf ecommons.cornell.edu. Dort zwei Dateien: `69-44.pdf` und `69-44.ps`. Gelesen habe ich das PDF (34 PDF-Seiten, 994 044 Byte, SHA-256 `93cfdd571ecfb8e2ea7c9aa3fd78b9389b75bb56899b8b706dc05c2ae2d99b48`). Die PostScript-Datei habe ich geladen, aber nicht gelesen.
- Das PDF ist ein Scan ohne Textebene. Ich habe alle Seiten als Bilder gelesen, ganz.
- Aufbau: PDF-Seite 1 Titelblatt, Seite 2 leer, Seiten 3–31 die gezählten Seiten 1–29 des Berichts, Seiten 32–34 leer. **Seitenangaben unten sind die gedruckten Seitenzahlen des Berichts (S.)**, in Klammern die PDF-Seite. Gedruckte Seite = PDF-Seite − 2.
- Abkürzung: Der Bericht nennt das Format „p × 2 by 2 × n“. Das ist ⟨p,2,n⟩ in der Schreibweise des Repos.

## 2. Hauptbefund zur unteren Schranke

**Der Bericht beweist keine untere Schranke für 4×2×4 und keine für p×2×n mit p, n ≥ 3 außer für 3×2×3.** Er beweist untere Schranken nur für ⟨2,2,n⟩ (und ⟨n,2,2⟩) und für ⟨3,2,3⟩. Für alle anderen p und n, also auch für 4×2×4, äußert er nur eine **Vermutung**:

> S. 27–28 (PDF 29–30): „A detailed case analysis of the 3×2 by 2×4 case seems to indicate that 19 multiplications are required rather than the 20 of Theorem 1. However, we conjecture that 20 are required and the algorithm of Theorem 1 is optimal for all n and p.“

Für 4×2×4 besagt diese Vermutung, dass 26 Multiplikationen nötig sind. Sie ist im Bericht nicht bewiesen.

Damit berührt der Bericht die Sätze „the previously known lower bound was 25“ und „To our knowledge, the lower bound 26 is new“ **nicht durch einen Beweis**. Er berührt sie aber durch die Vermutung: Die Zahl 26 als untere Schranke für ⟨4,2,4⟩ ist im Bericht von 1969 als vermuteter Wert enthalten. Die Beschreibung sollte das erwähnen (Vorschlag in Abschnitt 6).

Geltungsbereich der Vermutung, wie der Bericht seine Klasse von Verfahren festlegt (Abschnitt 4): Programme aus Multiplikation, Addition und Subtraktion mit ganzzahligen Konstanten, ohne Kommutativität der Multiplikation, ohne Division. Die Beweise werden modulo 2 geführt.

## 3. Titel, Autoren, Nummer, Datum, Verhältnis zum SIAM-Artikel

- Titelblatt (PDF 1): „On Minimizing the Number of Multiplications Necessary for Matrix Multiplication“, „J. E. Hopcroft“, „L. R. Kerr“, „Technical Report No. 69-44“, „September 1969“, „Department of Computer Science, Cornell University, Ithaca, New York 14850“.
- S. 1 (PDF 3), Fußnote: „This research has been supported in part by National Science Foundation Grant GJ-96.“
- Der Bericht erwähnt keine Zeitschrift und keinen SIAM-Artikel. Ein Verhältnis zu SIAM J. Appl. Math. 20(1) (1971), 30–36 geht aus dem Bericht selbst nicht hervor. Gleich ist nur der Titel (abgesehen von der Großschreibung) und die Autoren. Den SIAM-Artikel habe ich nicht gelesen. Ob er denselben Inhalt hat, ist offen.

## 4. Obere Schranken

**Satz 1** (S. 8, PDF 10):

> „Theorem 1: Let A be a p×2 matrix whose elements are indeterminants a_ij, 1≤i≤p, 1≤j≤2 and let X be a 2×n matrix whose elements are indeterminants x_jk, 1≤j≤2, 1≤k≤n. Then ⌈(3pn + max(n,p))/2⌉ multiplications are sufficient to compute AX without making use of commutativity.“

- Die Formel steht wörtlich auch in der Zusammenfassung (S. 1, PDF 3: „in ⌈(3pn+max(n,p))/2⌉ multiplications without use of commutativity“) und in der Einleitung (S. 2, PDF 4). Benennung: p×2 mal 2×n, also mit p statt n und n statt m. Inhaltlich ist es die Formel ⌈(3nm + max(n,m))/2⌉ für ⟨n,2,m⟩.
- **Für 4×2×4:** p = n = 4 ergibt ⌈(48 + 4)/2⌉ = 26. Der Bericht nennt die Zahl 26 nicht ausdrücklich.
- **Art der Verfahren:** Jedes Produkt ist eine Linearform in den a_ij mal eine Linearform in den x_jk (Produkte A bis G auf S. 3, PDF 5, zum Beispiel „A(a_i,x_k) = a_i2 (x_1k+x_2k)“, „G(a_i,a_j,x_k,x_l) = (a_j1+a_i2)(x_1k − x_2l)“). Das sind bilineare Verfahren. Die Ausgaben sind Summen solcher Produkte. Kommutativität wird nicht benutzt.
- **Zahlbereich:** Der Bericht nennt für Satz 1 keinen Ring und keinen Körper. Die Einträge sind „indeterminants“. Die Produkte A bis G haben Koeffizienten ±1. Für p < n benutzt der Beweis Linearformen ℓ_i aus Lemma 1 (S. 5–6, PDF 7–8), deren Koeffizienten so gewählt werden, dass gewisse Determinanten ≠ 0 sind; aus welchem Bereich die Koeffizienten stammen, sagt der Bericht nicht. Für p = n (also 4×2×4) entfallen diese Linearformen (n − p = 0). Das ist meine Lesart des Beweises, keine Aussage des Berichts.
- **Vollständigkeit der Konstruktion:** Beim Grundbaustein schreibt der Bericht auf S. 10 (PDF 12): „Several cases exist. We treat only the case where …“. Die übrigen Fälle sind nicht ausgeführt.
- Weitere Angaben zu oberen Schranken: S. 4–5 (PDF 6–7) das Beispiel 3×2 mal 2×3 mit 15 Multiplikationen („All told 15 multiplications are used.“). S. 14–15 (PDF 16–17) Bemerkungen zu größeren Formaten (8×15 mal 15×8 mit 689 gegenüber 8×16 mal 16×8 mit 686; 8×8 mal 8×7 mit 344 gegenüber 343). S. 28 (PDF 30) das Verfahren von Robert Wagner mit „mn+m+n“ Multiplikationen für m×2 mal 2×n, **mit** Kommutativität.

## 5. Untere Schranken im Einzelnen

### 5.1 Klasse der Verfahren und Koeffizientenbereich

S. 15 (PDF 17):

> „We consider algorithms consisting of a sequence of instructions of the form f_i = g_i ∘ h_i where ∘ stands for one of the binary operations – multiplication, addition or subtraction. Each f_i is a new variable and each g_i and h_i is either a fixed integer, a previously computed f_j (i.e. j<i) or an input variable.“

> „In proving that certain matrix multiplication algorithms are optimal with respect to the number of multiplications, we will assume that the elements of the matrix are binary numbers and addition and multiplication are modulo two. We can do this since, given an algorithm that works for integers, by taking all constants modulo two we have an algorithm for binary numbers with no more multiplications. Thus the optimal algorithm for matrix multiplication with integer elements has at least as many multiplications as for binary. The converse may not be true …“

Daraus:

- **Keine Division.** Erlaubt sind nur Multiplikation, Addition, Subtraktion.
- **Konstanten ganzzahlig.** Konstanten wie 1/2 oder Elemente eines beliebigen Körpers sind in dieser Klasse nicht vorgesehen.
- **Beweise über GF(2).** Die unteren Schranken werden für Rechnung modulo 2 bewiesen und gelten dann für die ganzzahlige Klasse. Über ℚ, ℝ, ℂ oder beliebigen Körpern mit beliebigen Konstanten behauptet der Bericht keine untere Schranke.
- **Ohne Kommutativität.**

S. 16 (PDF 18) die Rückführung auf bilineare Form:

> „Since we do not have commutativity we can assume a more restricted general form for the optimal program. The general form of the optimal algorithm computes each y_ij as a linear sum of m_i's where each m_i is of the form α · β, where α is a linear sum of a_ij's and β is a linear sum of x_ij's.“

Die Schranken betreffen damit in der Sache bilineare Verfahren über GF(2), also den bilinearen Rang über GF(2). Diese Gleichsetzung ist meine Lesart; der Bericht spricht von „multiplications“, nicht von „rank“.

Hilfsmittel: Satz 2 (S. 17, PDF 19), von Winograd übernommen, ist über einem Körper 𝔉 formuliert („any algorithm computing Ax requires at least p multiplications or divisions“). Er wird im Bericht innerhalb der GF(2)-Rechnung benutzt.

### 5.2 Die bewiesenen unteren Schranken

| Stelle | Aussage im Bericht | Format |
|---|---|---|
| Lemma 5, S. 17–18 (PDF 19–20) | „Any program for a_21 x_2i, a_21 x_1i + a_22 x_2i, 1 ≤ i ≤ n requires 3n multiplications.“ | Hilfsaussage |
| Satz 4, S. 23–24 (PDF 25–26) | „Let A be a 2 × 2 matrix and X a 2 × n matrix. Any algorithm P for A×X not making use of commutativity requires [7n/2] multiplications.“ Der Beweis endet mit „m ≥ 7n/2“. | ⟨2,2,n⟩ |
| Satz 5, S. 24 (PDF 26) | „The optimal algorithm for matrix multiplication with non-commutative elements has ⌈7n/2⌉ multiplications for the 2 × 2 times 2 × n case (and similarly for the n × 2 times 2 × 2 case).“ | ⟨2,2,n⟩, ⟨n,2,2⟩ |
| Satz 6, S. 27 (PDF 29) | „Any algorithm for the 3×2 by 2×3 case requires 15 multiplications.“ | ⟨3,2,3⟩ |

Hinweise dazu:

- In Satz 4 ist die Klammer um 7n/2 im Scan nicht sicher als Aufrundung zu lesen; Satz 5 schreibt die Aufrundung deutlich.
- Die Zusammenfassung (S. 1) nennt Optimalität „for the special cases p = 1 or 2, n = 1,2,⋯ and p = 3, n = 3“. Einen eigenen Satz für p = 1 habe ich im Bericht nicht gefunden.
- Zwei Beweisschritte für 3×2×3 sind im Bericht nicht ausgeführt: Lemma 9, S. 25–26 (PDF 27–28): „It can be shown that what remains requires 9 multiplications“; Lemma 10, S. 26 (PDF 28): „For each case it can be shown that after setting a_22 = α, which costs one multiplication, the remainder requires 12 multiplications.“
- Die Lemmata 8 bis 12 zählen Typen von Linearformen über GF(2) (zum Beispiel S. 27: „seven groups of six multiplications each, which covers all 42 types of multiplications not equivalent to a_31 β“).

### 5.3 Aussagen zu 4×2×4 und allgemein p×2×n

- **Bewiesen:** nichts für 4×2×4. Für p×2×n nur die Fälle p ≤ 2 (laut Zusammenfassung, mit Satz 5 für p = 2) und p = n = 3.
- **Vermutet:** Optimalität des Verfahrens aus Satz 1 „for all n and p“ (S. 28, Zitat in Abschnitt 2). Dazu die Anmerkung, eine Fallanalyse für 3×2×4 „seems to indicate that 19 multiplications are required rather than the 20“. Der Wortlaut ist so im Bericht; er stellt die Vermutung 20 der Fallanalyse 19 entgegen.
- Satz 7 (S. 28, PDF 30) betrifft nur den Vergleich mit dem kommutativen Fall: „The minimum number of multiplications necessary for matrix multiplication is less for the commutative case than for the non-commutative case.“

## 6. Vergleich mit `lean/formalization.yaml` und Vorschläge

Zeilenangaben beziehen sich auf die Datei beim Commit 676cdf5.

### 6.1 Was nach dem Bericht nicht stimmt oder zu berichtigen ist

1. **Zeile 57–69, letzter Satz „The original article was not read; the formula is cited identically by Yang (arXiv:2609.14393) and other sources.“** Für den SIAM-Artikel bleibt das richtig. Die Formel ist jetzt aber im Technischen Bericht TR 69-44 selbst gelesen (Satz 1, S. 8). Der Satz sollte das sagen.
2. **Zeile 57–69, Quelle nur als SIAM-Artikel 1971.** Die gelesene Fassung ist der Bericht vom September 1969. Er sollte als Fundstelle genannt werden, mit dem Hinweis, dass der SIAM-Artikel nicht verglichen wurde.
3. **Zeile 57–69, „Upper bound ceil((3nm + max(n,m))/2)“.** Inhaltlich stimmt das mit Satz 1 überein (mit p, n statt n, m). Der Bericht nennt keinen Körper; die Formel ist eine Aussage über Verfahren ohne Kommutativität mit Einträgen als Unbestimmten. Kein Fehler, aber die Notiz kann genauer sagen, wo die Formel steht.
4. **Datei-Zeilen 18–19, „The upper bound 26 is the known value of Hopcroft and Kerr (1971)“.** Der Bericht gibt die Formel 1969; die Zahl 26 nennt er nicht ausdrücklich, sie folgt für p = n = 4. Die Jahreszahl 1971 bezieht sich auf den nicht gelesenen Artikel. Kein Widerspruch, aber ergänzungsbedürftig.
5. **Datei-Zeilen 21–22, „To our knowledge, the lower bound 26 is new … the previously known lower bound was 25“.** Nach dem Bericht nicht falsch: Er beweist keine untere Schranke für 4×2×4. Es fehlt aber, dass Hopcroft und Kerr 1969 die Optimalität ihres Verfahrens für alle p und n **vermutet** haben (S. 28), für 4×2×4 also den Wert 26. Wer den Bericht kennt, liest die Beschreibung sonst so, als sei die 26 nie zuvor als Wert genannt worden.
6. **Datei-Zeilen 76–84, Eintrag matmulcatalog: „R(<2,4,4>) >= 26 (Hopcroft-Kerr)“.** Der Bericht TR 69-44 enthält keine solche untere Schranke, nur die Vermutung auf S. 28. Das kann die Notiz jetzt sagen.

Zu `lit/QUELLEN.md`, Zeile HK71, Spalte „Stand“ („Original nicht gelesen (Verlagsseite)“): Das gilt weiter für den SIAM-Artikel. Für den Bericht TR 69-44 ist es überholt. Die Aussage aus Lacelle26 in QUELLEN.md („das HK-Paper von 1971 enthalte nicht für alle Fälle eine ausgeführte Konstruktion“) passt zu S. 10 des Berichts („We treat only the case where …“); den SIAM-Artikel habe ich dafür nicht gesehen.

### 6.2 Vorschlag: Notiz zu Hopcroft und Kerr (ersetzt Datei-Zeilen 57–69)

```yaml
  - title: "On minimizing the number of multiplications necessary for matrix multiplication"
    authors: ["J. E. Hopcroft", "L. R. Kerr"]
    type: paper
    id: "doi:10.1137/0120004"
    location: "SIAM J. Appl. Math. 20(1) (1971), 30-36; read in the form of Cornell University, Department of Computer Science, Technical Report 69-44 (September 1969), hdl:1813/5902, Theorem 1 (p. 8) and p. 28"
    relationship: background
    note: >-
      Technical Report 69-44, Theorem 1, states that ceil((3pn + max(n,p))/2) multiplications
      are sufficient to compute the product of a p x 2 and a 2 x n matrix of indeterminates
      without commutativity; the products are of the form (linear form in A) x (linear form in X).
      For p = n = 4 this gives 26. The report names no field for this bound. The upper bound 26
      is part of the compared statement. It is not proved by formalising the construction of the
      report: YangBounds/Upper4x2x4.lean gives an explicit algorithm with 26 products
      (verfahren/4x2x4-r26-s001.json, found by the project's own search), and the kernel checks
      its tensor identity. Lower bounds in the report: ceil(7n/2) for 2 x 2 times 2 x n
      (Theorem 5) and 15 for 3 x 2 times 2 x 3 (Theorem 6), for programs using multiplication,
      addition and subtraction with integer constants and without commutativity, proved by
      reduction modulo 2. The report proves no lower bound for <4,2,4>; on p. 28 it conjectures
      that the algorithm of Theorem 1 "is optimal for all n and p". The journal article itself
      was not read and was not compared with the report.
```

### 6.3 Vorschlag: betroffene Sätze der Beschreibung (Datei-Zeilen 18–22)

Bisher:

> The upper bound 26 is the known value of Hopcroft and Kerr (1971); … To our knowledge, the lower bound 26 is new (literature search recorded in lit/ of this repository); the previously known lower bound was 25 (J. Yang, arXiv:2609.14393, Theorem 2, which the development also formalises).

Vorschlag:

> The upper bound 26 is the value of the formula ceil((3pn + max(n,p))/2) of Hopcroft and Kerr (Cornell Technical Report 69-44, 1969, Theorem 1; SIAM J. Appl. Math. 20 (1971)) for p = n = 4; … Hopcroft and Kerr conjectured in that report (p. 28) that their algorithm is optimal for all p and n, which for <4,2,4> means 26, but proved lower bounds only for 2 x 2 times 2 x n and 3 x 2 times 2 x 3, for programs with integer constants without commutativity, via reduction modulo 2. To our knowledge, a proof of the lower bound 26 for <4,2,4> is new (literature search recorded in lit/ of this repository); the previously known proved lower bound was 25 (J. Yang, arXiv:2609.14393, Theorem 2, which the development also formalises).

Ob die Lean-Aussage den Fall p = n = 4 der Vermutung im Sinn des Berichts erledigt (Klasse: ganzzahlige Konstanten, ohne Kommutativität, Rechnung modulo 2), habe ich nicht geprüft. Die Lean-Kette lag nicht auf meiner Positivliste. Der Vorschlag oben behauptet das deshalb nicht.

### 6.4 Vorschlag: Ergänzung zum Eintrag matmulcatalog (Datei-Zeilen 76–84), letzter Satz

> Hopcroft and Kerr's Technical Report 69-44 contains no such lower bound; it states optimality for all p and n only as a conjecture (p. 28). Recorded as a related claim, not as a source of the proof.

## 7. Grenzen dieses Berichts

- Der SIAM-Artikel von 1971 wurde nicht gelesen. Alle Aussagen betreffen den Bericht TR 69-44.
- Gelesen wurde ein Scan; einzelne Zeichen (Klammer in Satz 4) sind unsicher, darauf ist oben hingewiesen.
- Die Beweise des Berichts habe ich gelesen, aber nicht auf Richtigkeit geprüft.
- Das PDF liegt nicht im Repo.
