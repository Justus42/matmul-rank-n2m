# S2-19: Antwort des Fremdmodells (wörtlich)

- Modell: openai/gpt-6.2-sol über OpenRouter (Betreiber OpenAI), Denkstufe high, Batch über die Bridge
- Kennung: openrouter:batch-1795617729-Ylxsu1rXq2A1w9t9rena, abgegeben 25.11.2026 15:42, fertig 15:43 (Zeit der Bridge)
- Tokens: Eingabe 17.719, Ausgabe 4.783 (davon Denken 2.392), Kosten laut OpenRouter 0,04 US-$, finish_reason stop
- Auftrag: `gpt_auftrag.md` in diesem Ordner (siehe Kopfvermerk dort)

---

**Gesamtbefund:** Die Lean-Sätze treffen den numerischen Kern von B-008. Sie sind aber keine wortgetreue Vollformalisierung: `satzA_global` verknüpft die ausgegebene Normalform nicht ausdrücklich mit der Eingabezerlegung, und der Isomorphismus aus A1 ist nicht als Lean-Satz formuliert. Ich beurteile den vorgelegten Text, nicht die Kompilierbarkeit oder die ausgelassenen Beweise.

1. **Format — JA.** `BilinearAlgorithm K 4 2 4 25` multipliziert eine \(4\times2\)- mit einer \(2\times4\)-Matrix und liefert eine \(4\times4\)-Matrix. `alpha` und `beta` sind \(K\)-lineare Formen, `coeff` sind die festen \(C_t\), und `correct` fordert genau (Z) für alle \(A,B\). Die Definition fordert weder, dass alle Summanden von null verschieden sind, noch dass die Länge minimal ist. Beides gehört auch nicht zur Identität (Z).

2. **Länge — JA.** `Fin 25` indiziert genau 25 Summanden. In `satzA_exists` liefert die Normalisierung zunächst eine Länge \(r'\le25\). Die bereits formulierte untere Schranke `yang_theorem_two_algorithm` liefert \(25\le r'\), also \(r'=25\). `satzA_global` gibt somit ebenfalls einen Algorithmus mit genau 25 Summanden aus.

3. **Körper — JA.** Die Sätze für bereits normalisierte Algorithmen setzen nur `[Field K]` voraus. `satzA_global` nimmt auch über einem endlichen Körper eine beliebige Eingabezerlegung an und wechselt vor der Normalisierung zu `AlgebraicClosure K`. `baseChange` modelliert R1 korrekt: Es setzt die Formen über ihre Werte auf den Matrixeinheiten linear fort und bildet die \(C_t\) eintragsweise ab. Die Zerlegungsidentität bleibt durch Bilinearität erhalten. Charakteristik \(2\) ist eingeschlossen: `skewSpace` verlangt die verschwindende Diagonale ausdrücklich, nicht nur \(c_{ji}=-c_{ij}\). Der Satz behauptet nicht, dass \(\rho\) beim Körperwechsel unverändert bleibt; das wird auch nicht benötigt. Zur fehlenden Verknüpfung des endgültigen Zeugen mit der Eingabe siehe Punkt 6.

4. **Zahlen und Räume — JA.** \(\rho=3\) und alle vier Rangpaare stimmen exakt. `satzA` gibt zusätzlich \(\dim Q=5\) aus; `SatzAStatement` enthält nur \(\rho=3\) und die Rangdisjunktion. `emb` parametrisiert \(U\) durch die zweite Zeile, `φ` ist \(f_i|_U\), und `J` ist \(f_0(U)\). `Fq` verwendet mit `i.succ` genau die Prosaindizes \(1,2,3\); `Lq` summiert die drei Beiträge und `Hq` wendet diese Summe zeilenweise auf die alternierende Matrix an. `IsGreatest` über `rkComb` fordert ein **erreichtes Maximum** über alle Koeffizientenvektoren.

   Der größere Zielraum ändert keinen Rang: Aus (Z) folgt \(f_i(U)\subseteq\ker W\), insbesondere \(J\subseteq\ker W\). Daher ist
   \[
   \ker W/J\;\hookrightarrow\;K^{25}/J
   \]
   injektiv, mit Bild `Kbar`. `Fq`, `Lq` und `Hq` sind die Prosaabbildungen gefolgt von dieser Einbettung beziehungsweise ihrer komponentenweisen Version. Das erhält Kerne, Bilddimensionen und auch die Ränge aller Linearkombinationen der \(F_i\).

5. **Normalform und „für jedes zulässige \(u_0\)“ — JA, inhaltlich.** `SN1` ist genau (N1), und `SN2` ist genau (N2), einschließlich der Quantifizierung über alle von null verschiedenen \(2\times4\)-Matrizen, nicht nur über \(U\). Für jedes zulässige \(u_0\) und jede Basisergänzung liefert der Prosa-Basiswechsel einen Algorithmus mit `SN1` und `SN2`. Auf jeden solchen Algorithmus lässt sich `satzA_statement` anwenden. Damit ist die Rangbehauptung für jedes zulässige \(u_0\) abgedeckt. Nicht ausdrücklich formalisiert sind in diesen Signaturen die Parameter \(p,u_0\), die zulässige offene Menge oder die Unabhängigkeit von der Basisergänzung; die universelle Rangbehauptung benötigt keine davon als eigene Aussage.

6. **Zusatzannahmen und mögliche Leerheit — TEILWEISE.** `satzA_global` gilt für **jede** Eingabezerlegung der Länge 25; die Eingabe muss nicht normalisiert sein. Für die lokalen Sätze sind `SN1` und `SN2` echte Voraussetzungen, die eine konkrete Eingabe verfehlen kann. Über einem endlichen Grundkörper garantiert der Ausschnitt keine Normalform *über diesem Körper*. Über dem algebraischen Abschluss liefert `satzA_exists` dagegen bedingt auf die Existenz der Eingabe einen normalisierten Zeugen der Länge 25. Auch die Maximierer-Voraussetzung ist nicht leer: Die Rangmenge ist nichtleer und durch \(\dim U=4\) beschränkt. Die vier Fälle sind mögliche Rangpaare, keine Behauptung, dass jeder Fall realisiert wird.

   Die Einschränkung liegt in der **Aussage** von `satzA_global`: Der Beweis beginnt mit `alg.baseChange`, aber die Schlussformel fordert keine Relation zwischen `alg'` und `alg`. Ein und derselbe geeignete Zeuge könnte die Schlussformel für alle Eingaben erfüllen. Der Satz allein zertifiziert also nicht, dass sein Zeuge durch den R3-Basiswechsel aus der konkreten Eingabe hervorgeht. Das schmälert nicht die universelle Rangaussage aus Punkt 5 für alle tatsächlich aus der Eingabe gewonnenen Normalformen.

7. **Lemma 13′ — JA.** Schreibe \(G=\sum_i\gamma_iF_i\) für einen Maximierer. Bei \(\rho>0\) ist \(\gamma\ne0\) und kann zur ersten Zeile einer invertierbaren Basiswechselmatrix ergänzt werden. Dann gilt \(F'_1=G\). Auf \(\ker G\) verschwindet \(F'_1\); weil der Wechsel invertierbar ist, gilt sogar die Gleichheit
   \[
   F'_2(\ker G)+F'_3(\ker G)=\sum_i F_i(\ker G).
   \]
   Die neue Familie hat denselben Rang von \(L\); bei \(H\) wird der Familienwechsel durch invertierbare Koordinatenwechsel auf dem alternierenden Urbildraum und dem Zielraum ausgeglichen, auch in Charakteristik \(2\). Bei \(\rho=0\) sind alle \(F_i=0\), sodass kein Basiswechsel nötig ist.

   Weil \(G\) über \(x\mapsto(\gamma_i x)_i\) durch \(L\) faktorisiert, ist \(\operatorname{rk}L\ge\rho\). Für ganzzahlige Ränge ist daher die Ungleichung mit der Decke exakt äquivalent zu
   \[
   3\rho+2s+\operatorname{rk}L\le 2\operatorname{rk}H.
   \]
   Es geht keine Rundungsinformation verloren. Der abstrakte Lean-Satz ist allgemeiner in der Zahl der Abbildungen (\(e+2\)); `lemma13Prime_statement` ist die Spezialisierung auf drei Abbildungen und gilt für jeden Maximierer.

8. **A1, A2 und gemeinsamer Kern — TEILWEISE.**
   - **A1, Surjektivität:** `corollaryA1` formalisiert sie als Bildgleichheit mit \(\operatorname{im}L\times Q^3\). Der erste Faktor liegt dabei im größeren Quotienten, der zweite ist bereits auf `Kbar³` eingeschränkt. Die Voraussetzung \(\operatorname{rk}H=\operatorname{rk}L+3\) wählt unter den vier Rangpaaren genau \((3,6),(4,7),(5,8)\) aus.
   - **A1, Isomorphismus:** Der konkrete Isomorphismus \(\ker L\to Q^3/\operatorname{im}H\) fehlt als Lean-Aussage. Er folgt mathematisch aus der Surjektivität und `ker_Φ`: Für die Surjektivität nimmt man ein Urbild von \((0,q)\); für die Injektivität ergänzt man ein \(u\), dessen zweite Komponente modulo \(\operatorname{im}H\) null ist, um ein \(c\), sodass \(\Phi(u,c)=0\). Dann ist \(u=0\). Die Rangformel für \(\Phi\) ist separat formuliert; die Gleichheitsfälle und der Spielraum \(1\) in \((5,7)\) folgen daraus, sind aber nicht eigens als solche formuliert.
   - **A2:** Die in B-008 verlangte Gleichheit \(\widehat J=\ker W\) steht genau da. Der zusätzliche Lean-Satzteil über \(g\) quantifiziert nur über \(U\), während die Prosa alle \(2\times4\)-Matrizen nennt. Die volle Aussage folgt aus \(W(g(x))=0\) für alle \(x\) und der Gleichheit, steht aber nicht in `corollaryA2`.
   - **Gemeinsamer Kern:** `exists_common_kernel` trifft die Prosa-Anwendung für \((3,6),(4,7),(5,7)\): Es gibt einen **von null verschiedenen** gemeinsamen Kernvektor. Für \((5,8)\) gibt `sDim_table` nur \(s\le1\), wie in der Prosa. Das ist eine Zusatzfolgerung und kein Ersatz für die zweite Hälfte von A1.

9. **Gesamturteil — TEILWEISE.** Der numerische Satz A ist treu formalisiert, einschließlich der Anwendung auf jede zulässige Normalform. Die Unterschiede bei Quotientenzielräumen, Indizierung und Rundung ändern die mathematische Aussage nicht. `satzA` nennt zusätzlich \(\dim Q=5\), und das abstrakte Lemma 13′ ist allgemeiner als die Dreierfassung der Prosa. **B-008 als Ganzes ist in den gezeigten Sätzen aber nicht vollständig ausgesprochen:** Es fehlen der explizite Bezug des globalen Zeugen zur konkreten Eingabe und der A1-Isomorphismus. Daneben sind der Zusatz zu A2 für \(g\) nur auf \(U\) und die Aussage über Gleichheit beziehungsweise Spielraum nur indirekt erfasst. Die Kerngleichheit von A2 selbst fehlt nicht.
