# Stufe 5, Runde 5: Antwort des Fremdmodells zum Aussagen-Abgleich B-034 (wörtlich)

- Modell: openai/gpt-6.2-sol, Betreiber OpenAI laut OpenRouter, Denkstufe high, Batch. Anfrage des Orchestrators nach 5.5, Nr. 1 von 4 in Stufe 5 (die eine für Spur P).
- Batch openrouter:batch-1795711860-xothKGbjihV4e3USCcdQ, abgegeben 26.11.2026 16:51 UTC, fertig 16:58 UTC (die Bridge zeigt die Zeiten in MEZ: 17:51, 17:58).
- Tokens: Eingabe 1.940, Ausgabe 2.117 (davon Denken 1.167), gesamt 4.057. Kosten laut OpenRouter 0,01 US-$. finish_reason: stop (vollständig).
- Datenregel laut Bridge: Batch, laut OpenRouter kein Training (Konto-Regel und Betreiber aus provider.only); kein ZDR, 30 Tage gespeichert, USA.
- Auftrag: vom Orchestrator gestellt. Mitgegeben laut Orchestrator wörtlich: `lean/MatMulRank/Challenge.lean` (`portierung`, 03d49c7) und die behauptete Aussage in Worten. Nicht mitgegeben: Urteil des Prüfers, erwünschtes Ergebnis.
- Abgeholt vom Orchestrator um 17:03 UTC; von der Schreibhand mit `batch_job` der Bridge ohne `save_to` erneut abgerufen und mit dem weitergereichten Wortlaut verglichen (gleich). Text unverändert übernommen.

---

stimmt überein

1. **Matrixgrößen und Indexreihenfolge.** Aus den Typen in `correct` folgt: `A` hat `n` Zeilen und `l` Spalten, `B` hat `l` Zeilen und `m` Spalten, und jedes `coeff k` hat das Ausgabeformat `n × m`. In `tensorRank K 4 2 4` ist `2` also die kontrahierte Dimension. Berechnet wird das gewöhnliche Produkt einer \(4\times2\)- mit einer \(2\times4\)-Matrix, in dieser Reihenfolge.

2. **Körper.** Der Satz hat die Parameter `(K : Type u) [Field K]` und ist universumspolymorph. Er gilt der Aussage nach für jeden kommutativen Körper, ohne Zusatzannahme etwa an Charakteristik, Kardinalität oder algebraische Abgeschlossenheit. Alle Formen und Koeffizienten liegen über \(K\) selbst, nicht über einer Körpererweiterung. Ein einziges, für alle Körper einheitliches Verfahren wird nicht verlangt.

3. **Zahl und Rangbegriff.** Die rechte Seite ist die natürliche Zahl `26`. `alpha k` und `beta k` sind \(K\)-lineare Formen auf den beiden getrennten Eingaberäumen. Für jeden Index `k : Fin r` wird ihr Wertepaar multipliziert; `• coeff k` skaliert dann die feste Ausgabematrix. Gezählt werden damit die \(r\) Produkte der beiden eingabeabhängigen Linearformen, nicht Additionen oder Multiplikationen mit festen Skalaren. Das ist die bilineare Multiplikationszahl, nicht die Gesamtzahl aller arithmetischen Operationen.

4. **`sInf`, Minimum und Leere.** Die Menge unter `sInf` enthält genau die natürlichen Zahlen `r`, für die `Nonempty (BilinearAlgorithm K n l m r)` gilt. Eine nichtleere Teilmenge von \(\mathbb N\) hat ein kleinstes Element, und ihr `sInf` ist dieses Element. Die Menge ist hier tatsächlich nicht leer: Für jedes Tripel \((i,j,k)\) kann man die Koordinatenformen \(A\mapsto A_{ij}\) und \(B\mapsto B_{jk}\) mit der Ausgabematrixeinheit \(E_{ik}\) verwenden. Das liefert \(4\cdot2\cdot4=32\) Summanden. Mathlibs Konvention `sInf ∅ = 0` würde die behauptete Gleichheit im Leerfall **falsch**, nicht trivial wahr machen. Auch Länge null funktioniert hier nicht: Geeignete Eingabematrixeinheiten haben ein von null verschiedenes Produkt. Die Gleichheit mit `26` besagt somit beides: Ein Verfahren der Länge 26 existiert, und keines kürzerer Länge existiert.

5. **Vergleich mit einer Tensorzerlegung.** Bezeichnet man die Eingaberäume mit \(U,V\) und den Ausgaberaum mit \(W\), entspricht jeder Summand dem reinen Tensor \(\alpha_k\otimes\beta_k\otimes C_k\) in \(U^*\otimes_K V^*\otimes_K W\). Da die Räume endlichdimensional sind, bestimmt die Auswertung auf Paaren von Basismatrizen den Tensor eindeutig. `correct` ist daher genau die Gleichheit mit dem Matrixmultiplikationstensor, auch über endlichen Körpern. Die Struktur verlangt allerdings nicht, dass alle \(r\) Summanden von null verschieden sind. Ihre Bewohntheit entspricht einer Zerlegung in **höchstens** \(r\) nichtverschwindende Rang-eins-Tensoren: Kürzere Zerlegungen lassen sich mit Nullsummanden auffüllen. Gegenüber einer Anforderung von **genau** \(r\) nichtverschwindenden Summanden ist das eine Lockerung, die das Minimum nicht ändert. Insbesondere muss `coeff k` keinen Matrixrang eins haben; der Rang eins bezieht sich auf den gesamten Tensor-Summanden.

**Vorbehalte.** `BilinearAlgorithm` enthält konkrete Daten samt Korrektheitsbeleg; erst `Nonempty` macht daraus die für die Rangdefinition benötigte Existenzaussage. `noncomputable` ändert deren Bedeutung nicht. Der Abgleich betrifft nur den Inhalt des Satzes: Das `sorry` liefert weder die obere noch die untere Schranke als geprüften Beweis.
