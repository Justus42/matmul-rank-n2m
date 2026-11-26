# Antwort des Fremdmodells zu B-029 (S4-27-B, C, D), Stufe 4, Runde 6

Wörtlich abgeholt von der Schreibhand mit `batch_job` am 26.11.2026 um etwa 13:27 UTC. Kopf der Bridge und Antworttext unverändert. Zeiten im Kopf in Ortszeit (MEZ, UTC+1): abgegeben 13:15 UTC, fertig 13:22 UTC.

Den Auftragstext hat der Orchestrator gestellt. Laut Orchestrator enthielt er S4-27-B, C, D und die Beweise aus den Abschnitten 3, 5, 6, 7 der Quelle `lean/prosa/s4_327_spurA_r5_m21.md` wörtlich. Die Voraussetzungen hatte der Orchestrator selbst als Liste zusammengestellt, aus Abschnitt 2 von B-029 und den Bezeichnungen, also nicht wörtlich aus dem Repo. S4-27-D war darin als „die Voraussetzungen sind nicht gleichzeitig erfüllbar“ gefasst. Der Auftrag nannte keine Urteile und kein gewünschtes Ergebnis. Der Auftragstext selbst liegt nicht im Repo.

---

Modell: openai/gpt-6.2-sol
Betreiber: OpenAI (laut OpenRouter)
Batch: Auftrag openrouter:batch-1795698947-pgF8OgwNW9RGvgO1RH1f, abgegeben 26.11.2026, 14:15, fertig 26.11.2026, 14:22
Eingelesene Dateien: speichert OpenRouter nicht (siehe Abgabe-Meldung)
Tokens: Eingabe 3.515 · Ausgabe 4.501 (davon Denken 2.989) · gesamt 8.016
Kosten laut OpenRouter: 0,03 US-$
Datenregel: Batch: laut OpenRouter kein Training (Konto-Regel und Betreiber aus provider.only); kein ZDR, 30 Tage gespeichert, USA
Denkstufe: high
finish_reason: stop (vollständig)

---

**S4-27-B: folgt.**  
**S4-27-C: folgt unter der angegebenen Normalform mit (C′).** Der wörtliche Zusatz „aus (B) und (C) allein“ ist **nicht entscheidbar aus dem Text**, weil keine Voraussetzung namens (C) definiert ist. Falls damit (C′) gemeint ist und „allein“ auch die Normalform ausschließen soll, **folgt er nicht**.  
**S4-27-D: folgt.**

### Fortsetzungsabbildung und S4-27-B

Die Fortsetzungsabbildung ist korrekt begründet: Nach (G3) ist die Einschränkung auf \(Y\) auf \(K'\) injektiv und hat dasselbe Bild wie die Einschränkung von \(K''\) auf \(Y\), weil der Summand \(K^Z\) dort verschwindet. Insbesondere haben zwei Vektoren aus \(K'\) mit gleichem \(Y\)-Anteil auch auf \(Z\) dieselben Werte.

Im ersten Schritt von S4-27-B ist die mit „Satz G (ii) und S4-21, 5.4“ zitierte Faseridentität ausdrücklich als zusätzliche Voraussetzung gegeben. Aus ihr und \(e_pK'\subseteq M_p\) folgt
\[
K^{T_p}=M_p+b_0M_p.
\]
Nach (G2) hat die linke Seite Dimension \(2d_p\), während beide Summanden höchstens Dimension \(d_p\) haben. Damit ist die Summe direkt und die Multiplikation mit \(b_0\) auf \(M_p\) injektiv. Die eindeutige lineare Zerlegung von \(b_0^2m\) liefert \(B_p,N_p\) mit dem angegebenen Vorzeichen.

Im nächsten Schritt stellt die Voraussetzung (B) für \(i=0\) sicher, dass \(e_p(b_0\pi(j))\in M_p\) liegt. Daher muss in
\[
e_p(b_0\pi(j))=b_0(B_pj_p+\kappa_p)-N_pj_p
\]
der Anteil in \(b_0M_p\) verschwinden. Das ergibt erst \(\kappa_p=-B_pj_p\), dann \(e_p(b_0\pi(j))=-N_pj_p\). Auch die Vertauschbarkeit folgt: Auf jeder Faser wirkt \(g\) als der Skalar \(g(p)\). Hier fehlt keine Voraussetzung.

### S4-27-C: lokale Folgerung und genauer Wortlaut

Die Gleichungen \((P_i),(Q_0),(Q_i)\) sind korrekt, einschließlich der Vorzeichen beim Einsetzen von \((Q_0)\) in \((Q_i)\). Die Wahl von \(e\) setzt nur \(c(z)\ne0\) voraus. In den „Vier Werten“ werden lediglich \(G=1,L,L^2\in P_2\) eingesetzt: Man erhält der Reihe nach \(\beta(L^2)=0\), \(n(L^2)=0\), \(\beta(L)=0\) und \(\beta(L)=w(z)\). Damit ist der lokale Schluss gültig. Die Aussagen über \(m(g)\) für Grad \(3\) sind korrekt, werden für diesen Schluss aber nicht benötigt.

**Alternative Herleitung ohne die Funktionale \(\beta\) und \(n\).** Setze \(h=e_1c_1+e_2c_2\). Dann gilt \(h|_Y=0\), \(h(z)=1\) und \(L(z)=0\). Für \(j,Lj\in J\) liefern (C′) und (B) die beiden Vektoren
\[
h j-L\kappa(j)\in K',\qquad
h\pi(j)+L b_0\pi(j)\in K'.
\]
Nach S4-27-B und der Vertauschbarkeit mit \(L\) stimmen ihre \(Y\)-Anteile mit denen von \(-\kappa(Lj)\) bzw. \(b_0\pi(Lj)\) überein. Da alle diese Vektoren in \(K'\) liegen, sind sie schon auf ganz \(Y\cup Z\) gleich. Auswertung an \(z\) ergibt
\[
j(z)=-\kappa(Lj)(z),\qquad
\pi(j)(z)=b_0(z)\pi(Lj)(z).
\]
Für \(j=Lw\) liefert die erste Gleichung \(\kappa(L^2w)(z)=0\), also auch \(\pi(L^2w)(z)=0\), weil \(L^2w(z)=0\). Die zweite liefert dann \(\pi(Lw)(z)=0\), also \(\kappa(Lw)(z)=0\). Mit \(j=w\) ergibt die erste schließlich \(w(z)=0\).

**Die genaue Lücke im Wortlaut** liegt im letzten Satz der Aussage, nicht in der Rechnung: Der Beweis verwendet an der Stelle „Herleitung von \((P_i)\)“ ausdrücklich **(C′)**, nicht ein definiertes **(C)**. Falls (C) für \(b_i j-a_i\pi(j)\in K'\) steht, ist es wegen \(b_i j-a_i\pi(j)=c_i j-a_i\kappa(j)\) genau (C′). Der Beweis verwendet außerdem den Normalformrahmen, insbesondere (G1) für das Verschwinden von \(c_i\) auf \(Y\) und (G3) für die Bestimmung der Werte auf \(Z\).

Ein Gegenbeispiel zur Lesart *ohne Normalformrahmen*: Wähle paarweise verschiedene \(a_1(t)\), setze \(a_2=b_0=b_2=0\), \(\pi=0\) und \(b_1=w=e_1\), wobei \(e_1\) der erste Koordinatenvektor ist. Nimm für \(J,K',K''\) die Koordinatenräume auf den ersten \(7,13,21\) Indizes und wähle \(Z\) mit \(1\in Z\). Dann gelten (B) und (C′), denn \(b_i\pi(j)=0\) und \(c_i j\in K'\). Auch die Bedingungen an \(wP_2,wP_3\) gelten. Trotzdem ist \(c_1(1)=w(1)=1\). Hier fehlt insbesondere (G3).

### S4-27-D

Da \(|Z|=8\), kann man \(z\in Z\) wählen. (G4) liefert \(c(z)\ne0\) und \(w(z)\ne0\), während die bewiesene lokale Folgerung \(w(z)=0\) liefert. D folgt daher unabhängig von der unklaren Bezeichnung „(C)“. Weitere stillschweigende Voraussetzungen sind für die Beweise nicht nötig.
