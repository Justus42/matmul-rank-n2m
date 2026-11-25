# Antwort GPT 6.2 Sol zu S2-23 (Prüfung B-013)

- Modell: openai/gpt-6.2-sol (gpt-6.2-sol-20261117), Betreiber OpenAI laut OpenRouter, über die Bridge, Batch
- Auftrag: `gpt_auftrag.md` (wörtlich gesendet, ohne Urteil des Prüfers)
- Batch openrouter:batch-1795619946-Fk1gxuFeVRQVzVVGMDly, abgegeben 25.11.2026 16:19, fertig 16:30 (MEZ laut Bridge)
- Denkstufe high, Tokens: Eingabe 45 776, Ausgabe 9 030 (davon Denken 4 519), Kosten laut OpenRouter 0,09 US-$, finish_reason stop
- Text unten wörtlich.

---

## I. Folgerung C2 und Lemma P

### 1. Folgerung C2 (§ 4) — **hält mit benannter Reparatur**

**Satz C liefert die Nicht-Symmetrie, nicht die Rangrechnung.** Über \(\bar K\) ist die Menge der zulässigen \(p\), bei denen eine invertierbare Matrix \(M_p\) die verlangten Proportionalitäten erfüllt, konstruierbar: Die Proportionalitäten sind Minorenbedingungen, die Invertierbarkeit ist eine offene Bedingung, und man projiziert auf den \(p\)-Raum. Wäre diese Menge dicht, enthielte sie in dem irreduziblen Parameterraum eine nichtleere offene Menge. Genau das schließt Satz C aus. Ist Nicht-Symmetrie auf einer offenen Menge bereits Teil der Prämisse wie in B-013, ist Satz C für diesen Schritt entbehrlich. Aus den Rangzahlen \((5,8)\) allein folgt Nicht-Symmetrie hier nicht.

**Die Stelle „nach V′“ lässt sich ohne den fehlenden Text reparieren.** Fixiere ein zulässiges \(p\) und ein zulässiges \(u_0\). Gäbe es \(0\ne x_0\in N(u_0)\), so wäre durch
\[
\Psi(u,x_0)=\Psi(u_0,G u)
\]
eine lineare Abbildung \(G:K^4\to U\) definiert. Sie ist eindeutig und injektiv, weil \(\Psi\) nichtsingulär ist, und daher invertierbar. Koordinate \(t\) liefert als Gleichung von Linearformen in \(u\)
\[
b_t(x_0)\,a_t=a_t(u_0)\,(b_t\circ G).
\]
Rechts steht eine von null verschiedene Linearform: \(a_t(u_0)\ne0\), \(b_t\ne0\) und \(G\) ist invertierbar. Also ist \(b_t\circ G\) ein von null verschiedenes Vielfaches von \(a_t\). Das ist Symmetrie **an diesem \(p\)**. Die Kontraposition gibt \(N(u_0)=0\) für **jedes** zulässige \(u_0\) an einem nicht symmetrischen \(p\).

Lemma V aus Runde 2 enthält die Konstruktion von \(G\) bereits in Schritt 1. Sein **Satzwortlaut** allein reicht an dieser Stelle aber nicht: Er setzt einen generisch nichttrivialen Kern voraus, nicht einen Kern an einem einzigen \(u_0\). Die Koordinatenrechnung schließt genau diese Quantorenlücke; V′ ist für B-013 nicht nötig.

Satz A gibt \(\rho=3\). Für **jeden** Maximierer \(\gamma\) ist daher \(\ker F_\gamma\) eindimensional, und Lemma 13′ bzw. `sDim_table` gibt \(s\le1\). Wäre \(s=0\), so läge diese Kernlinie in \(N(u_0)\). Folglich \(s=1\). Satz B dient der generischen Reduktion auf die Restfälle und liefert die Symmetrie im Fall \((3,6)\); bei festem \((5,8)\) braucht die Rechnung nur Satz A, Lemma 13′ und den obigen Kernschluss. **Der Ausschluss in Satz E ist lokal und von Satz C unabhängig:** Satz C wird gebraucht, um die lokale Nicht-Symmetrie für eine hypothetische Zerlegung auf einer offenen Menge zu erzwingen, nicht für den Widerspruch in Unterfall A.

### 2. Lemma P (§ 5.1) — **hält mit benannter Reparatur**

- **Schritt (1) hält.** Auf der Rang-\(3\)-Menge \(\Omega\subset\mathbb P^2\) hat \(\delta\mapsto F_\delta k(\gamma)\) Rang \(s=1\). Also ist \(D(\gamma)\) zweidimensional. Treffen sich zwei der zugehörigen Geraden in einem Punkt von \(\Omega\), so erzeugen beide Kernvektoren dort dieselbe Kernlinie. Damit sind auch die beiden Geraden gleich.
- **Schritt (2): Das Gradargument ist richtig, aber die Familie und ihr Abschluss müssen unterschieden werden.** Die Zuordnung \(\gamma\mapsto D(\gamma)\) ist auf geeigneten Minorenkarten rational, also ist ihr Bild konstruierbar und sein reduzierter Abschluss irreduzibel. Ein nulldimensionaler Abschluss kann \(\Omega\) nicht überdecken; ein zweidimensionaler Abschluss würde bedeuten, dass das Bild eine offene Menge der dualen Ebene enthält, im Widerspruch zur Eindeutigkeit aus (1). Im Kurvenfall fehlen im Bild höchstens endlich viele Punkte des Abschlusses. Eine allgemeine duale Gerade vermeidet diese Punkte, die singulären Punkte und die Tangenten. Letztere bilden höchstens eine eindimensionale Familie; das gilt auch in positiver Charakteristik, ohne Separabilitätsannahme an die Gaußabbildung. Auf einer solchen Geraden zählt der Grad tatsächlich **verschiedene** Schnittpunkte. Also ist er eins.

  **Elementare Reparatur ohne duale Kurve:** Fixiere eine Familiengerade \(L_0\). Jede andere Familiengerade trifft sie außerhalb von \(\Omega\), und \(L_0\setminus\Omega\) ist endlich, weil ein \(3\times3\)-Minor auf \(L_0\) nicht identisch verschwindet. Die Familie ist unendlich, da sie \(\Omega\) überdeckt. Somit gehen unendlich viele ihrer Geraden durch denselben Punkt \([\gamma^*]\) auf \(L_0\). Jede Familiengerade, die nicht durch diesen Punkt ginge, hätte unendlich viele verschiedene Schnittpunkte mit diesen Geraden, alle außerhalb von \(\Omega\). Das widerspricht derselben Minorenrechnung auf dieser Geraden.
- **Schritt (3) hält mit präzisiertem Geltungsbereich.** Der Kern hängt auf der Rang-\(3\)-Menge nur vom Büschelparameter \(\lambda\) ab. Für die Folgerungen genügt die Aussage für generische \(\lambda\); an Ausnahmeparametern darf man nicht ohne Weiteres einen eindeutig bestimmten Kernvektor behaupten. Ein konstanter generischer Kern wäre ein gemeinsamer Kern. Wäre \(K^*=U\), so wäre \(F_{\gamma^*}=0\), entgegen Lemma 9 mit \(S=U\) und \(u^*\) als Ergänzungsvektor zu \(u_0\). Also bleiben genau die Dimensionen \(2\) und \(3\).
- **Schritt (4): „Spannt drei Dimensionen auf, ist also vom Grad 2“ ist für sich kein gültiger Schluss.** Mit Kronecker lautet das fehlende Argument: Der eingeschränkte Büschel hat über dem Funktionenkörper Kerndimension eins, denn er enthält den generischen Kern und sitzt in der vollen Abbildung vom Rang \(3\). Er hat somit genau einen rechten singulären Block. Beim Block \(L_\epsilon\) spannen die generischen Kernvektoren genau dessen \(\epsilon+1\) Spaltenrichtungen auf. Da sie per Definition ganz \(K^*\) aufspannen, verbraucht dieser Block alle Spalten; es bleiben nur Nullzeilen. Damit erhält man \(L_1\) bzw. \(L_2\), mit gemeinsamem Bildraum der Dimension \(1\) bzw. \(2\). In Dimension \(3\) folgt schließlich aus \(F_{\gamma^*}(K^*)=0\) und \(F_{\gamma^*}\ne0\), dass \(\operatorname{rk}F_{\gamma^*}=1\).

Hier gibt es keine Ausnahme in Charakteristik \(2\) oder \(3\). Alle offenen Mengen und generischen Wahlen sind über dem **algebraischen Abschluss** zu verstehen; es wird nicht behauptet, dass sie über einem kleinen Ausgangskörper rationale Punkte besitzen.

## II. Satz E und der verbleibende Unterfall B

### 3. Satz E (§ 5.2, A2–A8) — **hält**

| Stelle | Prüfung |
|---|---|
| **A2** | \(V_5\) muss als **linearer Spann** der Werte verstanden werden. Im Quotienten modulo \(J\) liegen diese Werte in \(Kq\), also ist \(V_5\subseteq J+K\hat q\). Weil \(q\ne0\), hat der rechte Raum Dimension \(5\). Yangs Lemma 8 ist auf \(S=K^*\subseteq U\) in der gegebenen Normalform anwendbar und gibt \(\dim V_5\ge2+3=5\). Die Gleichheit und damit \(J\subseteq V_5\) folgen. |
| **A3** | Der \(5\times4\)-Büschel ist für **jeden** projektiven Parameter injektiv, auch im Unendlichen. Das schließt rechte singuläre Blöcke aus. Ein nichtleerer regulärer Block hätte eine homogene Determinante positiven Grades mit einer Nullstelle über \(\bar K\), ist also ebenfalls ausgeschlossen. Jeder verbleibende linke Block trägt genau eine Zeile mehr als Spalten bei, auch ein reiner Nullzeilenblock. Da der Überschuss eins beträgt, gibt es genau einen Block, und wegen der vier Spalten ist es \(L_4^{\mathsf T}\). Die Identifikation mit \(S^3\times S^1\to S^4\) verwendet Monombasen, keine durch die Charakteristik gefährdeten Binomialkoeffizienten. |
| **A4** | Für \(h_0\ne0\) liefern die Minoren mit der ersten Zeile \(h_{i+1}=(h_1/h_0)h_i\); dies ist ein skalares Vielfaches der Auswertung bei \([1:h_1/h_0]\). Für \(h_0=0\) liefern die benachbarten Minoren nacheinander \(h_1^2=h_2^2=h_3^2=0\); nur \(h_4\) kann übrig bleiben, entsprechend \([0:1]\). Die Umkehrung folgt direkt aus der Faktorisierung der Auswertung eines Produkts. |
| **A5–A6** | Eine auf \(V_5\) verschwindende Koordinate verschwindet wegen A2 auf \(J\); mit \(a_t(u_0)\ne0\) würde daraus \(b_t=0\). Also ist \(\lambda_t\ne0\), und die nichtverschwindende Rang-eins-Faktorisierung liefert die Proportionalität für \(a_t\). Keine zusätzliche Generizität der einzelnen \(\sigma_t\) ist nötig. |
| **A7–A8** | \(y\mapsto h_y=\Lambda^{-1}\Psi(u_0,y)\) ist linear. A7 gibt \(b_t\) proportional zur Auswertungsform am **selben** Parameter wie \(a_t\); diese Form ist an jedem benutzten Parameter von null verschieden. Global ist nur eine Darstellung durch Formen vom Grad \(4\) nötig, keine nichtentartete Kurve vom exakten Grad \(4\). Die Tensoren werden durch die acht Koeffizientenvektoren der binären Monome vom Grad \(7\) aufgespannt. Das widerspricht \(\dim\hat J=5+4=9\), auch bei wiederholten Parametern und in kleiner Charakteristik. |

### 4. §§ 5.3–5.4 — **hält mit benannter Reparatur; der als offen bezeichnete Schluss lässt sich ergänzen**

**§ 5.3.** B1–B2 sind dieselbe enge Büschelrechnung wie A3–A4. In B2 ist eine verschwindende Koordinate wegen \(u_0\in D\), \(a_t(u_0)\ne0\) und \(b_t\ne0\) ausgeschlossen. Für B3 muss man beim Transponieren den Parameter mitwechseln: An der Stelle \(Jp\) sind die beiden Punktlisten der transponierten Zerlegung \(b_t(p)\) und \(-a_t(p)\), projektiv also genau die vertauschten Listen. Man schneidet die entsprechenden zulässigen offenen Mengen. \(\dim\hat J\) bleibt gleich, und Punkt-Symmetrie ist unter Vertauschung invariant. Damit sind Lemma P und Satz E auch auf der Gegenseite anwendbar.

**§ 5.4 bis zur Schnittzahl.** Die Projektion von \(D^\perp\) liefert auf der Kubik der \(a_t\) ein Paar binärer Kubiken. Nach Kürzen des gemeinsamen Faktors ergibt sich eine Abbildung vom Grad \(1\le d\le3\); sie ist nicht konstant, da die Kubik \(\mathbb P^3\) aufspannt. An den Datenpunkten ist die ursprüngliche Projektion definiert, weil \(a_t|_D\ne0\). Entsprechend erhält man rückwärts einen Grad \(1\le e\le3\). Die Graphen haben die angegebenen Bigrade, und ihre Schnittzahl ist \(de+1\), **mit Vielfachheiten**. Inseparabilität kann die Zahl verschiedener Schnittpunkte nur verkleinern. Stimmen die Graphen überein, ist \(d=e=1\); die Parametertransformation induziert dann eine projektive lineare Abbildung zwischen den beiden Kubiken und damit Punkt-Symmetrie. Sind die Graphen verschieden, erzwingen mindestens neun verschiedene Datenpaare \(de+1\ge9\), also tatsächlich \(d=e=3\).

**Die fehlende Ergänzung steht in § 5.4 nach „Dazu kommt“.** Man braucht weder eine zusätzliche Annahme über sechs Punkte noch eine Vermutung über die Variation der Kubiken:

1. Schon **ein** enges Paar auf jeder Seite liefert beide Graphen. Daher bestimmt jedes beobachtete \(\tau_t\) sein \(\sigma_t\) und umgekehrt. Aus mindestens neun verschiedenen Paaren folgen also **mindestens neun verschiedene Punkte auf jeder Kubik**.
2. Damit ist die Kubik unabhängig vom engen Paar. Elementar genügen hier sieben gemeinsame Punkte: Die definierenden Quadriken einer verdrehten Kubik schneiden auf einer zweiten Kubik Formen vom Grad \(6\) aus. Verschwinden sie an sieben verschiedenen Punkten, verschwinden sie auf der ganzen zweiten Kubik. Die definierenden Quadriken schneiden die erste Kubik mengentheoretisch aus; folglich stimmen die Kurven überein. Die Sechs-Punkte-Bemerkung des Berichts ist in linear allgemeiner Lage richtig, wird aber nicht benötigt. Die **Parametrisierungen** sind nicht kanonisch: Man fixiert für jede der beiden Kurven eine und rechnet die anderen per \(\mathrm{PGL}_2\) in diese um.
3. In diesen festen Parametern liefern alle engen Paare \(D\) dieselbe Abbildung \(\tau\mapsto\sigma\). Zwei Abbildungen vom Grad höchstens \(3\), die an den mindestens neun verschiedenen \(\tau_t\) übereinstimmen, haben eine identisch verschwindende Kreuzdifferenz: Diese ist eine binäre Form vom Grad höchstens \(6\).
4. Im nicht symmetrischen Fall hat diese feste Abbildung Grad \(3\). Ihr teilerfremdes Paar kubischer Formen ist bis auf gemeinsamen Skalar eindeutig. Die Restriktion der Linearformen auf die fest parametrisierte verdrehte Kubik identifiziert den vierdimensionalen Raum auf der \(u\)-Seite mit \(S^3\); der dabei von \(D\) erzeugte zweidimensionale Raum ist genau der Spann dieses Paars. **Also ist \(D\) eindeutig.** Dennoch liefert § 5.3 ein solches \(D(u_0)\ni u_0\) für \(u_0\) aus einer nichtleeren offenen Menge bei **festem \(p\)**. Die Punktlisten bleiben dabei fest. Ein festes zweidimensionales \(D\) kann diese offene Menge nicht enthalten.

Die Variation verlangt keinen Rangschluss an Ausnahmeparametern: Die generische \((5,8)\)-Menge genügt. An einem fest gewählten nicht symmetrischen \(p\) mit \(\operatorname{rk}L=5\) erzwingen Satz A, \(N=0\) und Lemma 13′ sogar \(\operatorname{rk}H=8\) für jedes zulässige \(u_0\). Somit ist die ursprüngliche Lückenbeschreibung an der richtigen Stelle, aber der Grad-\(3\)-Fall bleibt nach der Ergänzung nicht offen.

## III. Lean-Fassung

### 5. Formeller Stand — **Lücke im vorgelegten Lean-Bestand**

`corollaryA2` liefert für \(\operatorname{rk}L=5\) die Gleichheit `JHat = ker W` sowie die Mitgliedschaft für `gU`. Es liefert **nicht** \(J\subseteq V_5\); dafür braucht man Lemma 8 auf dem konkreten Unterraum \(K^*\) und den Dimensionsvergleich aus A2. Für A8 genügt `finrank_JHat` zusammen mit dem Abgleich von Zeilen- und Spaltenrang der Auswertungsmatrix. `sDim_table` gilt für jeden **Rangmaximierer** und gibt \(s\le1\), nicht \(s=1\), nicht \(N=0\) und keine Aussage über offene Familien von Normalformen. `satzA_exists` liefert eine normalisierte Zerlegung, nicht die für C2 und § 5.4 benötigte Familie bei variablem \(p\) bzw. \(u_0\).

Für **Lemma P und Satz E** würde ich weder eine vollständige Kronecker-Theorie noch Chevalley und duale Kurven als Formalisierungsvoraussetzungen wählen:

- **P(1)–(3):** Rang durch Minoren ausdrücken und den elementaren Geradenbeweis verwenden. Benötigt werden nur die Geometrie zweidimensionaler Unterräume in \(K^3\), Nichtnullstellen über unendlichen Körpern und die endliche Nullstellenmenge eines nicht identisch verschwindenden Minors auf einer Geraden.
- **P(4):** In Dimension \(n=2,3\) geben die Kofaktoren von \(n-1\) generisch unabhängigen Zeilen einen polynomialen Kernvektor vom Grad \(n-1\). Weil seine generischen Werte \(K^*\) aufspannen, bilden seine \(n\) Koeffizientenvektoren eine Basis. Koeffizientenvergleich in der Büschelgleichung zeigt direkt, dass die Bilder beider Büschelmatrizen zusammen von \(n-1\) Vektoren aufgespannt werden; der generische Rang gibt die Gegenungleichung.
- **A3:** Als Ersatz für Kronecker kann man die fünf maximalen Minoren des \(5\times4\)-Büschels verwenden. Eine konstante Relation zwischen ihnen lieferte einen festen Nichtnullvektor in allen Bildern. Modulo diesem Vektor hätte man einen \(4\times4\)-Büschel konstanten Rangs \(3\). Ein homogener Kofaktoren-Kernvektor, nach Kürzen des gemeinsamen Faktors, verschwindet nirgends auf \(\mathbb P^1\). Sein Bild im ursprünglichen Büschel wäre in der festen Richtung ein Skalarpolynom positiven Grades und hätte daher eine Nullstelle – Widerspruch zur Injektivität. Also bilden die fünf Minoren eine Basis der binären Quartiken. In der Monombasis sind ihre linearen Syzygien die vier benachbarten Schiebespalten, also der Multiplikationsbüschel.
- **A4–A8:** Hier genügen endliche Koeffizientenräume, \(2\times2\)-Minoren, der Dimensionsvergleich für Unterräume und eine \(25\times16\)-Matrix für die Tensorzeilen. Für die globale Fassung kommen der parametrisierte Basiswechsel, die offenen Zulässigkeitsbedingungen und der punktweise Kernschluss aus Teil I hinzu.

Das sind die im vorgelegten Bestand noch zu implementierenden Brücken; insbesondere braucht man keine unüberprüfte Annahme, dass mathlib bereits eine verwendbare Kronecker-Normalform enthält.

**Gesamturteil:** B-013 hält mit den benannten Reparaturen, Satz E ist lokal unabhängig von Satz C, und die ergänzte Variation aus § 5.4 schließt unter den gesetzten Voraussetzungen auch Unterfall B aus; eine Lean-Verifikation dieser neuen Schritte liegt nicht vor.
