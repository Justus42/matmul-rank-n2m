# S2-28: Antwort des Fremdmodells (wörtlich)

- Modell: openai/gpt-6.2-sol (Version openai/gpt-6.2-sol-20261117), Betreiber OpenAI laut OpenRouter, Denkstufe high, Batch.
- Batch openrouter:batch-1795621743-Shw4g2JyXlvFpQNb4aNT, abgegeben 25.11.2026 15:49 UTC, fertig 15:53 UTC (die Bridge zeigt die Zeiten in MEZ: 16:49, 16:53).
- Tokens: Eingabe 14 977, Ausgabe 9 327 (davon Denken 4 052). Kosten laut OpenRouter 0,06 US-$. finish_reason: stop (vollständig).
- Auftrag: `gpt_auftrag.md`.

---

**Gesamtbefund:** Unter den vorgegebenen Voraussetzungen trägt der Ausschluss von Unterfall B und damit von \((5,8)\). Die wichtigste ausgelassene Schlussfolgerung steht in (B3): Aus der Transposition folgt zunächst nur \(\operatorname{rk}L'=5\); für \(\operatorname{rk}H'=8\) müssen Satz A und Satz B ausdrücklich angewandt werden. In Lemma K ist außerdem ein Dichtheitsargument zu ersetzen, damit der geschriebene Beweis auch über endlichen Körpern gilt.

## 1. Lemma K über beliebigen Körpern — JA

Die Aussage ist richtig, einschließlich Charakteristik \(2\) und \(3\). Vorausgesetzt ist eine **Polynomidentität**, wie im Lemma angegeben. Schritt 1 liefert die verschwindenden Minoren als Polynomidentitäten. Im Rang-2-Fall sind die Auswertungen bei \(e_1,e_2,e_1+e_2\) in jeder Charakteristik zulässig; der Vergleich der Koeffizienten zweier unabhängiger Spalten erzwingt denselben Skalar.

Im Rang-1-Fall ist die Begründung „also für alle \(p\) (abgeschlossene Bedingung)“ über einem endlichen Körper so nicht ausreichend. Elementare Reparatur: Wähle \(q\) mit \(l_1(q)=1\). Für jedes \(v\in\ker l_1\) liegen sowohl \(X'q\) als auch \(X'(q+v)\) in \(Kx\); also liegt auch \(X'v\) in \(Kx\). Da \(K^2=Kq\oplus\ker l_1\), folgt \(X'=x(l'_1)^{\mathsf T}\).

Danach trägt der Teilbarkeitsbeweis: Sind \(l_1,l'_1\) nicht proportional, sind sie teilerfremde lineare Polynome. Aus \((K')\) folgt \(Y=w(l'_1)^{\mathsf T}\), \(Y'=w'l_1^{\mathsf T}\) und durch Kürzen \(w=w'\). Fall (ii) ist mit Fall (i) unvereinbar, weil \(X'\) in (ii) nicht proportional zu \(X\) ist.

## 2. Lemma Z, Konstanz von \(\kappa_t\) und Gewinnung von (G) — JA

Aus (D) mit \(p'=p\) folgt \(\widehat J_p\subseteq\ker W\). Mit unabhängigen \(p,p'\) liefert (D) auch die Surjektivität von \(W\): Alle Matrizen \(uw^{\mathsf T}\) liegen im Bild und spannen den Zielraum auf. Also ist \(\dim\ker W=9\). An zulässigen Stellen mit \(\operatorname{rk}L=5\) ergibt die Rangformel aus Teil C \(\dim\widehat J_p=9\), somit \(\widehat J_p=\ker W\). Der Rang-9-Ort ist offen: Die Matrix der linearisierten Abbildung \(\Psi_p\) hat polynomiale Einträge, und Rang \(9\) ist der maximal mögliche Rang. Für (G) wird \(\operatorname{rk}H=8\) nicht gebraucht.

Für die Konstanz gilt auf dem gemeinsamen offenen Ort:
\[
\operatorname{pr}_S(\widehat J_p)
 = K(\kappa_t(p))_{t\in S}
 = \operatorname{pr}_S(\ker W).
\]
Die erste Gleichheit folgt, weil **jeder Erzeuger** \(\Psi_p(u,w)\) auf ein Vielfaches des angegebenen Vektors projiziert und für geeignete \(u,w\) dieses Vielfache nicht null ist. Die Prosa sollte hier von Erzeugern sprechen, nicht jeden Vektor von \(\widehat J_p\) als einzelnen Wert \(\Psi_p(u,w)\) behandeln. Die feste Gerade hat genau einen Vektor mit \(t_0\)-Koordinate \(1\); damit sind alle \(\kappa_t\) konstant. Die daraus gewonnene Gleichheit auf einer nichtleeren offenen Menge ist über dem algebraisch abgeschlossenen Arbeitskörper eine Polynomidentität.

## 3. Klassengröße und Minimalitätsargument — JA

Die Zusammenlegung ist korrekt:
\[
\alpha_t\beta_t C_t+\alpha_{t'}\beta_{t'}C_{t'}
=\alpha_t\beta_t(C_t+\lambda\mu C_{t'}).
\]
Auch wenn der neue Ausgabefaktor null ist, erhält man eine Zerlegung mit **höchstens** 24 Termen, im Widerspruch zu B-007.

Für die Anwendung von K1 kann man den wechselnden Skalar explizit auf die linke Seite bringen: Setze \(X_t=A_t\), \(Y_t=B_t^{\mathsf T}J\). Alle normierten Paare \((X_t,\kappa_t^{-1}Y_t)\) derselben Klasse faktorisieren dann genau dasselbe Polynomtensorprodukt. Nach K1 gibt es höchstens zwei Skalierungsbahnen. Zwei Terme in derselben Bahn hätten zugleich proportionale \(A\)- und proportionale \(B\)-Matrizen, da \(J\) invertierbar ist. Also enthält jede Bahn höchstens einen Term und jede Klasse höchstens zwei.

## 4. Mindestens 13 verschiedene Punkte an derselben Stelle — JA

Wähle einen Vertreter pro Klasse. Für zwei Vertreter verschiedener Klassen ist mindestens ein \(2\times2\)-Minor ihrer beiden Tensorvektoren ein **nichtnulles homogenes Polynom** in \(p\). Andernfalls wären ihre projektiven Punkte auf dem gemeinsamen Nichtnullort identisch, und sie gehörten derselben Klasse an. Die Nullstellen eines solchen Minors bilden eine endliche Teilmenge von \(\mathbb P^1\).

Vereinige diese Ausnahmemengen über alle Vertreterpaare und füge die Nullstellen der einzelnen Faktoren \(a_t(p),b_t(p)\) hinzu. Außerhalb dieser **einen** endlichen Menge sind alle Vertreter gleichzeitig paarweise verschieden. Ihre Anzahl ist mindestens \(\lceil25/2\rceil=13\).

## 5. (B0) bis (B2) — JA

- **(B0):** Weil \(\gamma^*\ne0\), ist \(u^*\) unabhängig von \(u_0\). In \(Q=\ker W/J\) ist das Bild von \(\Psi(u^*,\cdot)\) gerade \(\operatorname{im}F_{\gamma^*}\). Daher hat der Spann der Werte auf \(D\times K^4\) Dimension \(\dim J+\operatorname{rk}F_{\gamma^*}=4+1=5\). Hier wird genau die Rang-1-Aussage von Lemma P in Unterfall B benutzt. (N1) liefert \(a_t\cdot u_0\ne0\).
- **(B1):** Nach \((\Psi1)\) ist jeder nichttriviale Parameterwert des \(5\times4\)-Büschels injektiv. Ein rechter singulärer Block ist damit ausgeschlossen. Ein regulärer Block positiver Größe ist ebenfalls ausgeschlossen: Seine homogene Determinante hat über dem algebraischen Abschluss eine projektive Nullstelle. Jeder verbleibende Block \(L_\eta^{\mathsf T}\) trägt genau eine Zeile mehr als Spalten bei. Die Differenz \(5-4=1\) erzwingt genau einen Block, mit \(\eta=4\). Dieser ist das Multiplikationsbüschel \(S^1\times S^3\to S^4\).
- **(B2):** Für die Hankelmatrix mit Zeilen \((h_0,h_1,h_2,h_3)\) und \((h_1,h_2,h_3,h_4)\) gilt: Ist \(h_0\ne0\), erzwingt Rang \(\le1\) die Folge \(h_i=h_0r^i\), also Auswertung bei \([1:r]\). Ist \(h_0=0\) und die erste Zeile nicht null, liegt der erste Nichtnulleintrag der zweiten Zeile eine Spalte weiter links als derjenige der ersten Zeile; das widerspricht Rang \(\le1\). Folglich bleibt bei \(h_0=0\) nur \(h_4\), also Auswertung bei \([0:1]\) oder die Nullform. Die Nullform ist wegen \(a_t\cdot u_0\ne0\) und \(b_t\ne0\) ausgeschlossen. Die beiden nichtnullen Faktoren der resultierenden Rang-1-Bilinearform liefern **für denselben** Parameter \(\sigma_t\) sowohl \([b_t]=[\nu_D(\sigma_t)]\) als auch \([a_t|_D]=[\operatorname{ev}_{\sigma_t}\circ\iota_D]\). Beim Auswerten homogener Formen ist ein Repräsentant von \(\sigma_t\) zu wählen; dessen Skalierung ändert die projektiven Aussagen nicht.

## 6. (B3), einschließlich der Transponierten — JA, mit einem ausgelassenen Rangschritt

Die transponierte Zerlegung erhält man, indem man die ursprüngliche Formel auf \(Y^{\mathsf T},X^{\mathsf T}\) anwendet und das Ergebnis transponiert. An der Stelle \(q\) gilt wegen \(J^2=-I\)
\[
a'_t(q)=-b_t(Jq),\qquad b'_t(q)=a_t(Jq),\qquad
\Psi'_q(u,w)=-\Psi_{Jq}(w,u).
\]
Auch in Charakteristik \(2\) gelten diese Identitäten. Aus \(W'=\mathrm{transpose}\circ W\) folgt \(\ker W'=\ker W\).

**Der fehlende Rangschritt:** Auf dem nichtleeren offenen Ort \(Jq\in P_9\) ist \(\dim\widehat J'_q=9\), also an zulässigen \(q\) nach der Rangformel \(\operatorname{rk}L'=5\). Satz A lässt dann nur \((5,7)\) und \((5,8)\) zu; Satz B schließt \((5,7)\) aus. Erst damit ist die Anwendung von C2, Lemma P und Satz E auf die Transponierte gerechtfertigt. Lemma P und Satz E sind auf beide Zerlegungen separat anzuwenden; Unterfall B muss nicht als transpositionsinvariant vorausgesetzt werden.

An den zulässigen Stellen ist die punktweise Symmetriebedingung unter Vertauschung der Seiten und Ersetzung von \(M\) durch \(M^{-1}\) äquivalent. Das Vorzeichen ist projektiv ohne Bedeutung. Die offenen Bedingungen an \(p\) und an \(q=J^{-1}p\) sind gleichzeitig erfüllbar, weil \(J\) ein linearer Automorphismus ist. Schließlich liefert (B2) für die Transponierte **ein und denselben** Parameter für \([b'_t(q)]\) auf ihrer Kubik und für \([a'_t(q)|_E]\) unter ihrer Projektion. Zurückübersetzt ist das genau \([a_t(p)]=[\nu_E(\tau_t)]\) und \(\tau_t=\pi_E([b_t(p)])\).

## 7. Satz F, Schritt 1: Projektionen und Grade — JA

Präzise ist \(\phi\) die **Fortsetzung** der zunächst nur rational definierten Komposition \(\pi_D\circ\nu_E\). Die beiden kubischen Formen erhält man, indem man \(\nu_E\) auf einer Basis von \(D\) auswertet. Verwendet man die über \(\iota_D\) von \(s,t\) zurückgeholte Basis, so ist die Zielkoordinate genau der in (B2) verwendete Parameter \(\sigma\). Eine andere Basis erfordert einen entsprechenden Zielkoordinatenwechsel.

Die zwei kubischen Formen sind linear unabhängig: Eine lineare Relation würde die Kubik in eine Hyperebene legen, was wegen des Isomorphismus \(g_E\) und der Unabhängigkeit der kubischen Monome unmöglich ist. Nach Kürzen ihres homogenen ggT erhält man zwei teilerfremde Formen desselben Grades \(d\le3\). Sie haben keine gemeinsame projektive Nullstelle; \(d=0\) würde der ursprünglichen linearen Unabhängigkeit widersprechen. Also ist \(1\le d\le3\), und ebenso \(1\le e\le3\).

Die Kubik darf das Projektionszentrum treffen: Dort war die ursprüngliche Komposition nicht definiert, die gekürzte Darstellung aber schon. Keiner der benutzten Punkte \([a_t]\) liegt im Zentrum, weil \(a_t\cdot u_0\ne0\). Somit stimmt die Fortsetzung an allen \(\tau_t\) mit der ursprünglichen Projektion überein und \(\sigma_t=\phi(\tau_t)\). Entsprechend gilt \(\tau_t=\psi(\sigma_t)\).

## 8. Satz F, Schritte 2 und 3: Graphen und Schnittschranke — JA

Jeder Graph ist als Schema isomorph zu seiner Quell-\(\mathbb P^1\), also irreduzibel und reduziert. Die angegebene Gleichung von \(\Gamma_1\) definiert tatsächlich den Graphen: Auf den offenen Mengen \(f\ne0\) bzw. \(g\ne0\) bestimmt sie die Zielkoordinate eindeutig. Der Bigrad ist \((d,1)\), für \(\Gamma_2\) entsprechend \((1,e)\).

Sind die Graphen verschieden, haben sie keine gemeinsame Komponente. Ihre Schnittzahl ist \(de+1\); jeder verschiedene gemeinsame Punkt trägt mindestens \(1\) zur Schnittzahl bei. Das gilt auch bei Inseparabilität, die die Multiplizitäten ändern kann, nicht aber die Schranke \(de+1\le10\) für die Zahl verschiedener Punkte.

Jedes Paar \((\tau_t,\sigma_t)\) bestimmt beide projektiven Faktoren und damit den projektiven Tensorpunkt. Daher müssen 13 verschiedene Tensorpunkte von mindestens 13 verschiedenen Paaren stammen. Für diese Zählrichtung braucht man nicht einmal die Injektivität der beiden Kubikparametrisierungen.

## 9. Satz F, Schritt 4: Gleichheit der Graphen und Widerspruch — JA

Aus \(\Gamma_1=\Gamma_2\) folgt durch Vergleich der Divisorklassen \((d,1)=(1,e)\), also \(d=e=1\). Hier wird der **Grad der Morphismen**, nicht die Zahl der Punkte einer Faser, verglichen. Ein Frobenius-Morphismus kann auf geometrischen Punkten bijektiv sein; das macht seinen Graphen nicht zum Graphen eines inversen Morphismus.

Schreibe \(\phi=[\Phi]\) mit \(\Phi\in\mathrm{GL}_2(K)\). Die Substitution \(\tau\mapsto\Phi\tau\) auf den kubischen Monomen liefert eine invertierbare Matrix \(T_\Phi\) mit \(m(\Phi\tau)=T_\Phi m(\tau)\); die inverse Substitution kommt von \(\Phi^{-1}\). Das ist auch in Charakteristik \(3\) korrekt: Man benutzt die Monomkoordinaten, keine durch Binomialkoeffizienten normierte Darstellung. Damit gilt für \(G=N_DT_\Phi N_E^{-1}\):
\[
[b_t(p)]=[G a_t(p)]\quad\text{für alle }t.
\]
Also erfüllt \(M=G^{-1}\) an der **einen gewählten Stelle \(p\)** die in Teil B definierte Matrixbedingung. Das widerspricht C2, weil \(p\in P_{\rm ns}\) liegt. Nur Satz C ohne C2 anzuführen wäre hier nicht genug: Eine einzelne symmetrische Stelle wäre noch keine symmetrische Zerlegung im definierten Sinn.

## 10. Generizität, \(u_0\) und Körperwechsel — JA, mit einer Präzisierung

Man arbeitet zuerst über dem algebraischen Abschluss. Eine Zerlegung über dem Ausgangskörper bleibt dort eine Zerlegung; die Rangbedingungen werden in der Normalform über diesem Arbeitskörper interpretiert. Insbesondere muss eine nichtleere generische Menge **keinen** Punkt über einem endlichen Ausgangskörper enthalten.

Für die Wahl von \(p\) kann man alle Bedingungen in der affinen Ebene schneiden: die zulässigen Rang- und C2-Orte für beide Zerlegungen, für die Transponierte mittels \(q=J^{-1}p\) zurückgezogen, sowie das Komplement der endlich vielen Ausnahmegeraden aus Lemma Z. Das ist ein endlicher Schnitt nichtleerer offener Mengen in der irreduziblen affinen Ebene. Man muss nicht behaupten, dass jede in der Prosa gewählte offene Teilmenge selbst als Menge in \(\mathbb P^1\) formuliert ist.

**Danach** wählt man zulässige, generische \(u_0\) für Lemma P, separat für die beiden Zerlegungen. Weder müssen diese beiden Wahlen übereinstimmen, noch müssen \(D,E\) mit \(p\) in einer Familie gewählt werden. \(N(u_0)=0\) und \(s=1\) kommen aus der vorausgesetzten C2; die Ungleichung in Lemma 13′ allein würde nur \(s\le1\) liefern.

## 11. Folgerung F1 — JA

Für eine hypothetische Zerlegung im Fall \((5,8)\) liefert C2 den offenen Ort ohne punktweise Symmetrie. Auf diesem Ort greifen für generisches zulässiges \(u_0\) Lemma P und Satz E, also Unterfall B. Für die Transponierte wiederholt man dieselbe Anwendung, **nachdem** ihr Fall \((5,8)\) wie in Antwort 6 aus Satz A und Satz B bestimmt wurde. Am gemeinsamen generischen Ort greift Satz F. Damit ist F1 unter genau den vorgegebenen Voraussetzungen bewiesen; die bloße Gleichheit \(\dim\widehat J'=\dim\widehat J\) hätte den Einsatz von Lemma P und Satz E für die Transponierte noch nicht gerechtfertigt.

## 12. Urteil und konkrete Reparaturen

| Aussage | Urteil | Was im Beweis ausdrücklich festzuhalten ist |
|---|---|---|
| **Lemma K** | **Hält mit Reparatur des Beweises.** | Ersetze das Dichtheitsargument im Rang-1-Fall durch \(q,q+v\) für \(v\in\ker l_1\), wie in Antwort 1. |
| **Lemma Z** | **Hält.** | Zeige die Projektionsformel zuerst für die Erzeuger und dann für ihren Spann. Normiere die Paare mit \(\kappa_t^{-1}\), um K1 auf eine einzige Faser anzuwenden. Formuliere die generische Aussage über dem algebraisch abgeschlossenen Arbeitskörper. |
| **Satz F** | **Hält mit benannter Ergänzung.** | Ergänze in (B3) \(\dim\widehat J'=9\Rightarrow\operatorname{rk}L'=5\xRightarrow{\text{A und B}}\operatorname{rk}H'=8\). Definiere \(\phi,\psi\) als Fortsetzungen nach Kürzung und verwende die durch \(\iota_D,\iota_E\) festgelegten Zielkoordinaten. Die Graphenzählung erfolgt am gemeinsamen generischen \(p\), nicht an einem beliebigen Ausnahmepunkt. |
| **F1** | **Hält nach derselben Ergänzung.** | Wende C2, Lemma P und Satz E auf beide Zerlegungen an und schneide die offenen Orte nach Rückzug durch \(J^{-1}\). Unterfall B für die Transponierte ist keine zusätzliche Voraussetzung. |

## 13. Lean 4: schwierigste Stellen und elementare Ersatzargumente

**Satz F ist der aufwendigste der drei Beweise**, wenn man Kronecker-Normalform und Schnitttheorie direkt formalisiert. Beides lässt sich vermeiden. Bei Lemma Z ist vor allem die Schnittstelle zwischen generischem Rang, Polynomidentität und simultaner Wahl von \(p\) aufwendig. Lemma K ist dagegen überwiegend elementare lineare Algebra und Polynomalgebra.

**Ersatz für Bézout.** Schreibe \(\psi\circ\phi=[F:G]\), indem man die beiden homogenen Darstellungen ineinander einsetzt. \(F,G\) haben Grad \(de\) und keine gemeinsame projektive Nullstelle: Ein gemeinsamer Nullpunkt würde auf einen Basispunkt einer der beiden Darstellungen führen. Gemeinsame Graphenpunkte entsprechen Fixpunkten der Komposition, also Nullstellen von
\[
H(\tau)=\tau_2F(\tau)-\tau_1G(\tau).
\]
Ist \(H\ne0\), hat es höchstens \(de+1\) verschiedene projektive Nullstellen. Das folgt durch Dehomogenisieren und gesondertes Prüfen des Punkts im Unendlichen. Ist \(H=0\), folgt aus der Teilerfremdheit von \(\tau_1,\tau_2\), dass \(F=\tau_1h,\ G=\tau_2h\). Da \(F,G\) keinen gemeinsamen projektiven Nullpunkt haben und der Körper algebraisch abgeschlossen ist, ist \(h\) konstant. Damit ist \(de=1\). So entfallen sowohl Bézout als auch der Vergleich von Divisorklassen.

**Ersatz für Kronecker in genau diesem Format.** Normalisiere das Büschel \(sP_0+tP_1\) zu \(P_0=\binom{I_4}{0}\), \(P_1=\binom{A}{b}\). Der Raum
\[
N=\bigcap_{i=0}^3\ker(bA^i)
\]
ist nach Cayley–Hamilton \(A\)-invariant. Wäre er nicht null, hätte \(A|_N\) einen Eigenvektor \(v\) zum Eigenwert \(\lambda\), und \((-\lambda P_0+P_1)v=0\) widerspräche der Injektivität. Wähle nun \(0\ne v\in\bigcap_{i=0}^2\ker(bA^i)\); dann ist \(bA^3v\ne0\). Die Vektoren \(v,Av,A^2v,A^3v\) sind unabhängig: Auf eine lineare Relation wendet man nacheinander \(b,bA,bA^2,bA^3\) an und eliminiert die Koeffizienten vom letzten zum ersten. Setze \(y_j=P_0A^jv\) für \(0\le j\le3\) und \(y_4=P_1A^3v\). Die \(y_j\) bilden eine Zielbasis, weil \(y_4\) eine nichtverschwindende letzte Koordinate hat. In diesen Basen gilt
\[
(sP_0+tP_1)A^jv=s\,y_j+t\,y_{j+1}\qquad(0\le j\le3),
\]
also genau die gesuchte Multiplikationsform.

Für **Lemma Z** kann man die generische Wahl mit endlich vielen expliziten Nichtnullbedingungen an Minoren umsetzen, statt Äquivalenzklassen und Kollisionen über abstrakte Zariski-Topologie zu verfolgen. Für **Lemma K** lässt sich sogar der Teilbarkeitsschritt vereinfachen: Werte \((K')\) bei unabhängigen \(l_1,l'_1\) auf den beiden Kernlinien aus. Das zeigt, dass \(Y\) bzw. \(Y'\) durch \(l'_1\) bzw. \(l_1\) faktorisiert. Auswertung an einem \(p\) mit \(l_1(p)=l'_1(p)=1\) identifiziert dann die beiden Vektorfaktoren, auch über \(\mathbb F_2\).
