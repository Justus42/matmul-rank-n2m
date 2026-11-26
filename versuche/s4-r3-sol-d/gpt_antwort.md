# Stufe 4, Runde 3: Antwort des Fremdmodells zu S4-07-D (B-021 D) (wörtlich)

- Modell: openai/gpt-6.2-sol, Betreiber OpenAI laut OpenRouter, Denkstufe high, Batch. Anfrage des Orchestrators nach 5.5 (1 von höchstens 2 in Runde 3).
- Batch openrouter:batch-1795687520-iFCKAiiJIQ1lIli8h29y, abgegeben 26.11.2026 10:05 UTC, fertig 10:11 UTC (die Bridge zeigt die Zeiten in MEZ: 11:05, 11:11).
- Tokens: Eingabe 6.516, Ausgabe 8.161 (davon Denken 4.813), gesamt 14.677. Kosten laut OpenRouter 0,05 US-$. finish_reason: stop (vollständig).
- Datenregel laut Bridge: Batch, laut OpenRouter kein Training (Konto-Regel und Betreiber aus provider.only); kein ZDR, 30 Tage gespeichert, USA.
- Auftrag: vom Orchestrator gestellt. Mitgegeben wörtlich: Vorbemerkung und Aussagen B, C, D aus `behauptungen/B-021.md`, aus `lean/prosa/s4_327_spurA_r2_bau.md` die Abschnitte 1, 2, 3, 4.1, 4.2 und 6 (Einzelheiten im Logbuch, Nachtrag Sol-Anfrage 1). Nicht mitgegeben: Urteil des Prüfers, Zähler, Fristen, erwünschtes Ergebnis.
- Abgeholt von der Schreibhand mit `batch_job` der Bridge, ohne `save_to`, am 26.11.2026 nach 10:16 UTC. Text unverändert übernommen.

---

**Urteil:** Der erste Satz von S4-07-D **hält** unter den ausdrücklich übernommenen Voraussetzungen aus Abschnitt 1. Der zweite Satz **hält** in der Lesart, dass die Alternative **für jede Normalform einzeln** gilt. Eine normalformunabhängige Aussage über die Verletzung von (INJ5) ist damit nicht bewiesen.

Dabei lese ich (INJ5) wie formuliert: Die Gleichung \(w\cdot F+u\cdot G=0\) ist eine Gleichung **ausgewerteter Vektoren**, und die Folgerung \(F=G=0\) betrifft die **Polynome**. Genau diese Unterscheidung braucht der Beweis. Ich schreibe \(X,Y\) für die formalen Variablen, die an \(a_1,a_2\) ausgewertet werden.

## 1. Prüfung von Abschnitt 6

**6.1 ist korrekt.** Hier ist \(P_1\cdot J\) als linearer Spann der Produkte zu verstehen; dieser ist \(K'\). Die angegebenen Lösungen erfüllen (C′). Für \(c_i=\ell_i+a_i\mu\) und \(j\in J^3_0\) ist
\[
\Theta(j)=\ell_1j_1+\ell_2j_2-\mu j_0\in K'.
\]
Die induzierte Abbildung nach \(K^{34}/K'\) ist dann null und kann auf dem achtdimensionalen \(J^3_0\) nicht injektiv sein. Auch die anschließende Formel mit \(M+s(t)I\) stimmt; sie wird für den Ausschluss nicht benötigt.

**6.2 ist in allen sechs Schritten nachvollziehbar.**

1. Mit \(j=w\) liefert (C′) unmittelbar \(c_iw\in K'+a_iK'\subseteq K''\). Nach 4.1 ist die Darstellung \(c_iw=wC_i+uE_i\) eindeutig, auch für die formalen Polynome mit den angegebenen Gradgrenzen.
2. Die Multiplikation dieser **exakten Vektorgleichung** mit \(a_1\) ist zulässig. Weil \(wa_1\in J\), liegt das Ergebnis wieder in \(K''\). Der Vergleich der beiden Darstellungen liefert eine Relation vom Grad höchstens \(5\) im \(w\)-Teil und \(3\) im \(u\)-Teil. (INJ5) ergibt \(XC_i=C'\) und \(XE_i=E'\) als Polynome. Da Multiplikation mit \(X\) den Grad eines von null verschiedenen Polynoms um eins erhöht, folgen die behaupteten Gradgrenzen.
3. Der Satz „dasselbe mit \(a_1^2C_i\) (Grad \(\le 5\)) und \(a_1^2E_i\) (Grad \(\le 3\))“ ist korrekt, **weil hier bereits die reduzierten Gradgrenzen aus Schritt 2 gelten**. Mit \(wa_1^2\in J\) folgt so \(\deg C_i\le 2\), und \(E_i\) ist konstant.
4. Die beiden Darstellungen in (C′) liegen nun innerhalb der Gradgrenzen von 4.1. Modulo \(K'\) bleiben genau die homogenen Anteile vom Grad \(4\) im \(w\)-Teil und \(2\) im \(u\)-Teil. Das liefert beide angegebenen Formgleichungen. Entscheidend ist, dass \(\kappa(wG)\) für beide Werte von \(i\) **derselbe** Vektor ist und seine Darstellung eindeutig ist.
5. Die Elimination mit \(G=X^2\) ist richtig. Im Integritätsbereich \(K[X,Y]\) darf man \(X^2\) kürzen. Aus \(YC_1^{(2)}=XC_2^{(2)}\) und der Teilerfremdheit von \(X,Y\) folgt \(C_1^{(2)}=Xh,\ C_2^{(2)}=Yh\). Aus \(YE_1=XE_2\) folgt für die Konstanten \(E_1=E_2=0\). Dafür ist keine Charakteristikannahme nötig.
6. Auf dem Träger von \(w\) darf man koordinatenweise durch \(w(t)\) teilen. Mehr als die dortige Aussage \(c_i=a_ih+\ell_i\) ist nicht gezeigt – und mehr wird nicht gebraucht.

Im Abschluss ist nach 4.2 für jedes \(j\in J^3_0\) sowohl \(j_1\) als auch \(j_2\) außerhalb des Trägers von \(w\) null. Deshalb darf man in \(\Theta(j)\) die lokale Formel für \(c_i\) verwenden. Der Term \(h(a_1j_1+a_2j_2)\) ist \(-hj_0\); alle drei resultierenden Terme liegen in \(K'\). Das widerspricht (D′). Insbesondere wird an keiner Stelle eine Kongruenz mit einem Koordinatenvektor multipliziert, als wäre \(K'\) darunter invariant.

**Ich finde in 6.1 oder 6.2 keinen nicht nachvollziehbaren Schritt unter der angegebenen (INJ5).** Die kritische Stelle ist das Zitat „Nach (INJ5) ist \(a_1C_i=C'\) und \(a_1E_i=E'\) als Polynome“: Sie braucht tatsächlich Polynominjektivität, nicht bloß Injektivität auf Räumen bereits ausgewerteter Funktionen.

## 2. Welche Vorarbeiten tragen den Schluss?

**Übernommen, nicht unabhängig geprüft:** die Existenz und Eigenschaften der Normalform nach R1, R2 und Lemma A, die dabei angeführte untere Schranke, die Zuordnung aller solchen Normalformen zu R-327 sowie die in Abschnitt 1 aus den fehlenden Quellen übernommenen Raumidentifikationen. Für D sind daraus vor allem
\[
K'=J+a_1J+a_2J
\]
und die Angaben zu \(N,S,f_i\), aus denen der Vektor \(w\) mit \(wP_1=f_0(N)\) und \(wP_2\subseteq J\) gewonnen wird, relevant. Die Skalierung selbst lässt das Verfahren unverändert; für den Ausgabekern gilt direkt \(W_{\rm neu}(v)=W_{\rm alt}(Dv)\). Die behauptete Erhaltung der extern definierten Normalformbedingungen habe ich nicht separat geprüft.

**Aus dem abgedruckten Text nachgeprüft:**

- **Abschnitt 2, insbesondere (C′) und (D):** Die vier Gruppen folgen durch Einsetzen der Basismatrizen. Die Bilder \(W(b_iq_k)=e_{ik}\) beweisen unabhängig von G4 sowohl \(\dim K'=13\) als auch \(\dim J=7\): Schon die sieben Bilder für \(i=0\) erzwingen die Unabhängigkeit der \(q_k\). (C′) folgt aus \(p_k=b_0q_k+\kappa_k\) durch die angegebene Subtraktion. Dieselben \(\kappa_k\) definieren **eine** lineare Abbildung \(\kappa\) für beide Gleichungen. Die Brent-Bedingung (B) wird in Abschnitt 6 nicht gebraucht.
- **3.1:** Aus den übernommenen Angaben zu \(S,N,f_i\) folgt \(wP_1=f_0(N)\) und \(a_i(wP_1)\subseteq J\), also \(wP_2\subseteq J\). Der Satz „also … und damit \(S=N\)“ im Ausschluss von \(e=0\) setzt eine Charakterisierung von \(S\) voraus, die im Auszug nicht angegeben ist. **D braucht diesen Ausschluss nicht**; für die Alternative genügt \(0\le e\le 3\).
- **3.2 und 3.3:** Aus (C′) folgt \(b_iJ\subseteq K''+b_0K'\); mit (D) ergibt das \(K^{34}=K''+b_0K'\) und damit \(\dim K''\ge21\). Für (D′) hat die surjektive Abbildung \(J^3\to K'\), \(j\mapsto\sum a_ij_i\), einen achtdimensionalen Kern. Auf diesem Kern stimmt \(\Theta(j)\) mit \(\sum b_ij_i\) überein. Letztere Abbildung ist modulo \(K'\) nach (D) injektiv. Die Bildinklusion in \(K''\) folgt aus (C′). Das beweist (D′) ohne die Restfallrechnung erneut zu benutzen.
- **4.1:** Beide Dimensionsargumente stimmen. Die obere Schranke \(10+3=13\) für \(wP_3+uP_1\) und die obere Schranke \(15+6=21\) für \(wP_4+uP_2\) werden jeweils erreicht. Also sind die Summen direkt, und sämtliche formalen Polynomräume bis zu den dort genannten Graden werden injektiv dargestellt. Das rechtfertigt insbesondere \(K''/K'\cong S^4\oplus S^2\). Auch \(K^{34}=K''\oplus b_0K'\) folgt durch Dimensionen, wird in 6.2 aber nicht mehr gebraucht.
- **4.2:** Der für D wichtige Schluss lässt sich direkt an \(J^3_0\) prüfen, ohne die externe Definition von \(L\) zu benötigen. Schreibe \(j_r=w\phi_r+\lambda_ru\) für \(r=1,2\). Damit \(a_1j_1+a_2j_2\in J\) liegt, muss sein \(uP_1\)-Anteil in \(Ku\) liegen. Die Unabhängigkeit von \(u,a_1u,a_2u\) erzwingt \(\lambda_1=\lambda_2=0\). Danach müssen die quadratischen Anteile \(q_1,q_2\) von \(\phi_1,\phi_2\) die **formale** Gleichung \(Xq_1+Yq_2=0\) erfüllen, weil die Auswertung mit Faktor \(w\) bis Grad \(3\) injektiv ist. Das ergibt genau \(q_1=Yh,\ q_2=-Xh\) und die angegebene Dimension \(8\). Die Rechnung zu \(N\) folgt analog aus der Direktheit in \(K'\); \(f_0(S)=Kw\) folgt schon aus der Wahl von \(w\).

Die Büschelgestalt und die Trägeranzahlen aus C werden für D nicht benutzt. Ich habe dafür keinen fehlenden Beweisschritt ergänzt und behandle sie nicht als nachgeprüft.

## 3. Körper, Wahl von \(u\) und Gegenprobe

Der lokale Ausschluss funktioniert über **jedem Körper**, über dem die benutzten Raumvoraussetzungen und (INJ5) gelten. Er verlangt weder Charakteristik null noch algebraische Abgeschlossenheit. Der algebraische Abschluss und die Normalisierung werden vorgelagert gebraucht, um die Anwendbarkeit der Voraussetzungen aus Abschnitt 1 auf die betrachteten Verfahren zu begründen. Die Rechnung selbst setzt die Koordinaten mit \(a_0=1\) voraus.

**(INJ5) hängt in einer festen Normalform nicht von der Wahl des Komplements \(u\) ab.** Für eine andere Wahl gilt
\[
\widetilde u=\lambda u+wH,\qquad \lambda\ne0,\quad \deg H\le2.
\]
Dann ist
\[
wF+\widetilde uG=w(F+HG)+u(\lambda G).
\]
Die Transformation \((F,G)\mapsto(F+HG,\lambda G)\) ist auf dem formalen Gradbereich \((\le5,\le3)\) invertierbar, gerade weil \(\deg(HG)\le5\). Auch eine von null verschiedene Skalierung von \(w\) ändert die Bedingung nicht. Das ist keine Aussage über den Wechsel zu einer anderen Normalform.

**Gegenprobe zur kritischen Gradreduktion.** Die Injektivität aus 4.1 allein reicht tatsächlich nicht. Setze etwa \(w=1\), \(a(t)=(t,t^5)\) und \(u(t)=t^{26}\) an 34 geeignet gewählten verschiedenen Stellen eines unendlichen Körpers. Die Monome bis Grad \(4\) liefern verschiedene Potenzen von \(t\); die Potenzen aus \(uP_2\) sind davon getrennt. Man kann die Stellen so wählen, dass diese Funktionen unabhängig bleiben. Trotzdem ist das formale Polynom \(Y-X^5\) von null verschieden und wertet überall zu null aus. Konkret hat man \(a_1C_i=C'\) **als Vektoren** für \(C_i=X^4\), \(C'=Y\), ohne dass \(\deg C_i\le3\) wäre. Das ist kein Matrixmultiplikationsverfahren und kein Gegenbeispiel zu D. Es zeigt aber, warum der entscheidende Schritt nicht aus 4.1 folgt und warum eine schwächere, rein vektorielle Lesart von (INJ5) den vorliegenden Beweis nicht tragen würde.

## 4. Gleichwertigkeit der beiden Sätze

Für eine **festgehaltene Normalform** im angegebenen Restfall ist \(e\le3\). Der Ausschluss
\[
\neg(e=3\ \land\ \mathrm{INJ5})
\]
ist genau die Aussage
\[
e\le2\quad\text{oder}\quad(e=3\ \text{und (INJ5) ist verletzt}).
\]
Diese Fassung lässt (INJ5) im Zweig \(e\le2\) zu Recht undefiniert. Quantifiziert man die ganze Alternative über jede Normalform, erhält man den zweiten Satz. Für diese Umformulierung muss die Restfallannahme alle gemeinten Normalformen erfassen, und „Lage von C“ muss den Zweig \(e=3\) bezeichnen. Liest man sämtliche weiteren Folgerungen von C als zusätzliche Bestandteile dieser Lage, müssten sie für die **rein logische Umformulierung** im Zweig \(e=3\) automatisch gelten. Der Beweis von 6.2 ist hier stärker: Er braucht diese weiteren Folgerungen nicht.

Liest man dagegen „oder es verletzt (INJ5)“ als globale Aussage über das Verfahren, muss man erst festlegen, in welchen Normalformen die Verletzung verlangt wird. Eine Verletzung in **mindestens einer** Normalform ist schwächer als die punktweise Alternative: Sie schließt eine weitere Normalform mit \(e=3\) und erfüllter (INJ5) nicht aus. Eine entsprechende Invarianz zwischen Normalformen ist nicht nachgewiesen.

**Schlussurteil:**
- **Erster Satz: hält.** Unter den expliziten Voraussetzungen aus Abschnitt 1 erzwingt (INJ5), dass \(\Theta\) modulo \(K'\) null ist, im Widerspruch zu (D′).
- **Zweiter Satz: hält** als Alternative in jeder Normalform einzeln, unter derselben Restfallvoraussetzung. Als Behauptung einer normalformunabhängigen Verletzung von (INJ5) ist er nicht durch den ersten Satz gedeckt.
