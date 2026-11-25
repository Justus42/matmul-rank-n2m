# Antwort GPT 6.2 Sol (wörtlich)

Batch openrouter:batch-1795626738-VGftyKNVuB676USP0Qcv, abgegeben 25.11.2026 18:12, fertig 18:13 (Bridge-Zeit), Betreiber OpenAI, Denkstufe high, Tokens: Eingabe 3.453, Ausgabe 5.023 (davon Denken 2.009), Kosten 0,03 US-$, finish_reason stop.

---

**Gesamturteil: Der Beweis hält.** Lemma P ist unter (H1)–(H3) über jedem unendlichen Körper bewiesen. Die beiden entscheidenden Punkte in Schritt 8 — \(p_1(Z)=K^*\) und die paarweise Verschiedenheit der Quotienten \(b_t/a_t\) — folgen wie behauptet. Für Lean würde ich einige Zwischenschlüsse explizit machen und in Schritt 8(c) den Endomorphismus anders benennen als die bereits verwendete Indexmenge \(T\). Eine inhaltliche Reparatur ist nicht nötig.

## Prüfung der Schritte 0–10

**0 — hält.** \(D(S)\) ist ein Unterraum, weil die Bedingung \(F_\delta x=0\) für jedes \(x\in S\) linear in \(\delta\) ist. Für \(\gamma\in\Omega\) liefert Rang-Nullität \(\dim\ker F_\gamma=1\). Daher genügt es, \(F_\delta\) auf einem von null verschiedenen Erzeuger \(k_\gamma\) zu testen.

**1 — hält.** Das Bild von \(\delta\mapsto F_\delta k_\gamma\) ist genau \(\sum_i F_i(\ker F_\gamma)\): Die Bilder der drei Standardbasisvektoren sind \(F_i k_\gamma\), und diese erzeugen den genannten Raum. Nach (H2) hat das Bild Dimension \(1\), also der Kern Dimension \(2\). Ferner liegt \(\gamma\) in diesem Kern.

**2 — hält.** Die Inklusion zweier eindimensionaler Kerne ist eine Gleichheit; gleiche Kerne definieren gleiche \(D\)-Ebenen. Für 2′ schneiden sich zwei verschiedene Ebenen in \(K^3\) in einer Geraden. Läge ein \(\eta\in\Omega\) in ihrem Schnitt, so wären nach Schritt 2 beide Ebenen gleich \(D(\eta)\).

**3 — hält.** Ein Linksinverses \(g\) existiert: Invertiere \(F_\gamma|_C\) auf seinem Bild und erweitere die Abbildung linear auf \(Q\). Für das Argument würde es sogar genügen, sie auf den endlichdimensionalen Raum \(F_\gamma(C)+F_\delta(C)\) zu erweitern. Ist \(\gamma+t\delta\notin\Omega\), so ist der Rang nach (H1) kleiner als \(3\); die Einschränkung auf \(C\) ist also nicht injektiv. Damit folgt für \(t\ne 0\) tatsächlich der Eigenwert \(-1/t\in K\). Es wird nicht vorausgesetzt, dass das Minimalpolynom über \(K\) zerfällt: Seine **in \(K\) liegenden** Nullstellen sind endlich. Alternativ gilt unmittelbar
\[
\{t:\gamma+t\delta\notin\Omega\}\subseteq
\{t:\det(I_C+tM)=0\},
\]
und das Polynom rechts hat konstanten Term \(1\) und Grad höchstens \(3\). Eine Umkehrung dieser Inklusion wird nicht gebraucht.

Auch **3′** hält: Bis auf \(K\varepsilon\) hat jede Gerade in \(P\) einen Vertreter der Form \(\gamma+t\varepsilon\). Der Rang ist unter Multiplikation des Parameters mit einem von null verschiedenen Skalar invariant, sodass Schritt 3 auf diese Vertreter anwendbar ist.

**4 — hält.** \(T\) ist kofinit und damit unendlich. Falls zwei Indizes \(t\ne s\) dieselbe \(D\)-Ebene lieferten, enthielte diese die Differenz \((t-s)\delta\), also \(\delta\), und dann auch \(\gamma_0=\gamma_t-t\delta\). Schritt 2 identifiziert die Ebene mit \(D(\gamma_0)\), im Widerspruch zur Wahl von \(\delta\).

**5 — hält.** Die Abbildung \(t\mapsto\ell_t\) auf \(T\setminus\{0\}\) hat nach 3′ nur endlich viele mögliche Werte. Wären alle Fasern endlich, wäre auch \(T\setminus\{0\}\) endlich. Also gibt es die behauptete unendliche Faser \(T^*\).

Auch die zweite, davon zu unterscheidende Abbildung \(t\mapsto m_t\) ist unter der Widerspruchsannahme injektiv: Für verschiedene \(t,s\in T^*\) sind \(D(\gamma_t)\) und \(D(\gamma_s)\) verschieden und enthalten beide \(K\eta^*\); ihr Schnitt ist daher **genau** \(K\eta^*\). Aus \(m_t=m_s\) folgte, dass diese gemeinsame Gerade in \(K\eta^*\) liegt und folglich gleich \(K\eta^*\) ist. Das widerspricht \(\eta^*\notin D(\gamma)\). Somit widersprechen die unendlich vielen \(m_t\) der Folgerung 3′ in \(D(\gamma)\). Der so gewonnene Parameter \(\gamma^*=\eta^*\ne0\) vernichtet jeden Summanden von \(K^*\), also auch deren Summe.

**6 — hält.** Zwei verschiedene \(D\)-Ebenen können nicht vom selben Kern stammen. Daher enthält \(K^*\) zwei verschiedene Geraden und hat Dimension mindestens \(2\). Weil \(F_{\gamma^*}\) diesen Raum vernichtet, kann \(\gamma^*\) nicht zu \(\Omega\) gehören. Die Ranginvarianz unter nichtnullen Skalaren schließt dann auch jedes Vielfache von \(\gamma^*\) aus \(\Omega\) aus; der Nullparameter liegt ohnehin nicht in \(\Omega\).

**7 — hält.** Für Lean lässt sich die Auswahl endlich formulieren: Wähle fünf verschiedene Indizes in \(T\). Die fünf zugehörigen Vektoren in \(K^4\) erfüllen eine nichttriviale lineare Relation. Wähle als \(t_1\) einen Index mit nichtverschwindendem Koeffizienten und löse nach \(k_{t_1}\) auf. Damit ist genau die benötigte Span-Aussage bewiesen; es wird nicht behauptet, dass eine beliebige Wahl von \(t_1\) genügt.

Danach darf \(t_0\ne t_1\) beliebig in \(T\) gewählt werden. In einer linearen Relation zwischen \(\gamma_A,\gamma_B,\gamma^*\) würde ein nichtverschwindender Koeffizient von \(\gamma_A\) erzwingen, dass \(\gamma_A\in\operatorname{span}(\gamma_B,\gamma^*)\subseteq D(\gamma_B)\) liegt. Schritte 2 und 4 schließen das aus. Die restlichen beiden Koeffizienten verschwinden, weil \(\gamma^*\ne0\) und \(\gamma_B\notin K\gamma^*\). Damit liegt eine Basis vor.

**8 — hält.** Die Darstellung auf \(K^*\) folgt aus der Basis und \(F_{\gamma^*}|_{K^*}=0\). Rang-Nullität für \(\Phi\) liefert \(\dim W+\dim Z=2m\).

- **(a)** Für \(k\in\ker F_\gamma\) gilt \(a_\gamma Ak+b_\gamma Bk=0\), also \((a_\gamma k,b_\gamma k)\in Z\). Ist \(a_\gamma=0\), so liegt \(\gamma\) in \(\operatorname{span}(\gamma_B,\gamma^*)\subseteq D(\gamma_B)\). Für \(\gamma\in\Omega\) ergibt das \(D(\gamma)=D(\gamma_B)\). Die behauptete Kontraposition stimmt.
- **(b)** Ist \(D(\gamma)\ne D(\gamma_B)\), so kann man durch \(a_\gamma\ne0\) teilen: \((k,(b_\gamma/a_\gamma)k)\in Z\) für jeden \(k\in\ker F_\gamma\). Somit enthält \(p_1(Z)\) diese Kernlinien, insbesondere alle \(k_t\) mit \(t\ne t_1\). **Weil \(p_1(Z)\) ein Unterraum ist**, enthält es nach Schritt 7 auch \(k_{t_1}\). Ist \(D(\gamma)=D(\gamma_B)\), so liefert Schritt 2 \(\ker F_\gamma=Kk_{t_1}\). Damit enthält \(p_1(Z)\) tatsächlich die Kernlinien für **alle** \(\gamma\in\Omega\), nicht nur für die gewählte Parametergerade. Also \(p_1(Z)=K^*\).
- **(c)** Unter \(\dim Z\le m\) ist die nach (b) surjektive Projektion bijektiv. Nenne den daraus definierten Endomorphismus \(E\), um ihn von der Indexmenge \(T\) zu unterscheiden. Der eindeutige Lift von \(k_t\) ist für \(t\ne t_1\) das Paar \((k_t,(b_t/a_t)k_t)\), also \(Ek_t=(b_t/a_t)k_t\). Bei gleichen Quotienten hätten \(\gamma_t/a_t\) und \(\gamma_s/a_s\) dieselben ersten beiden Basiskoordinaten. Ihre Differenz läge in \(K\gamma^*\), also läge \(\gamma_t\) in \(\operatorname{span}(\gamma_s,\gamma^*)\subseteq D(\gamma_s)\). Schritte 2 und 4 erzwingen \(t=s\). Damit hätte \(E\) unendlich viele verschiedene Eigenwerte in \(K\), was in endlicher Dimension unmöglich ist. Folglich \(\dim Z\ge m+1\) und \(\dim W\le m-1\).
- **(d)** Der Kern von \(A|_{K^*}\) ist genau die in \(K^*\) enthaltene Kernlinie von \(A\). Also hat \(A(K^*)\subseteq W\) Dimension \(m-1\), und es folgt \(\dim W=m-1\).

**9 — hält.** (H3) ist hier die einzige **zusätzliche** Hypothese; gebraucht werden natürlich die zuvor bewiesenen Aussagen \(F_{\gamma^*}(K^*)=0\), \(F_i(K^*)\subseteq W\) und \(\dim W=m-1\). Bei \(m=4\) wäre \(K^*=U\), und der Gesamtbildraum hätte Dimension höchstens \(3\), entgegen (H3). Bei \(m=3\) ist der Rang von \(F_{\gamma^*}\) höchstens \(1\). Wäre er null, dann kämen auf einem eindimensionalen Komplement \(Kx\) von \(K^*\) nur die beiden Bildrichtungen \(Ax,Bx\) hinzu: Die Basis aus Schritt 7 liefert \(F_i x\in\operatorname{span}(Ax,Bx)\) für alle \(i\). Der Gesamtbildraum hätte somit Dimension höchstens \(2+2=4\), erneut entgegen (H3). Der Rang ist also genau \(1\).

**10 — hält.** Nach Schritten 6 und 9 bleiben genau \(m=2\) und \(m=3\). Mit \(\dim W=m-1\) liefert \(W\) im ersten Fall die Gerade \(Kq\), im zweiten den Raum \(Q_2\). Die Fälle schließen sich wegen ihrer verschiedenen Werte von \(\dim K^*\) aus.

## Gegenproben

Unter allen Voraussetzungen ergibt sich kein Gegenbeispiel zu den Zwischenaussagen. Dass die Schranken in Schritt 9 ohne (H3) tatsächlich scheitern können, zeigen zwei Büschel mit Parameter \((a,b,c)\), beide unabhängig von \(c\):

- Für
  \[
  F_{(a,b,c)}(x_0,x_1,x_2,x_3)
  =(ax_0+bx_1,\ ax_1+bx_2,\ ax_2+bx_3)
  \]
  gilt \(\Omega=\{(a,b,c):(a,b)\ne(0,0)\}\), aber \(m=4\). Für \((a,b)=(1,t)\) sind die Kernlinien durch \(((-t)^3,t^2,-t,1)\) erzeugt; diese Vektoren spannen über einem unendlichen Körper \(K^4\) auf. Der Gesamtbildraum hat Dimension \(3\).
- Für
  \[
  F_{(a,b,c)}(x_0,x_1,x_2,z)
  =(ax_0+bx_1,\ ax_1+bx_2,\ az,\ bz)
  \]
  gilt dieselbe Beschreibung von \(\Omega\), nun aber \(K^*=\{z=0\}\) und \(m=3\): Die Kernvektoren \((t^2,-t,1,0)\) für \((a,b)=(1,t)\) spannen diesen Raum auf. Ein Parameter vernichtet \(K^*\) genau dann, wenn \(a=b=0\); seine Abbildung ist dann null. Der Gesamtbildraum hat Dimension \(4\).

In beiden Beispielen gelten (H1) und (H2): Auf einer Rang-3-Kernlinie sind \(F_1k,F_2k\) wegen \(aF_1k+bF_2k=0\) abhängig, aber nicht beide null, da \(F_1,F_2\) keinen gemeinsamen nichttrivialen Kern haben; \(F_3=0\). Die Beispiele widerlegen also genau die entsprechenden Schlüsse **ohne** (H3), nicht den vorgelegten Beweis. Algebraische Abgeschlossenheit wird an keiner Stelle benötigt.
