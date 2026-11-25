# S2-30: Antwort des Fremdmodells (wörtlich)

- Modell: openai/gpt-6.2-sol (Version openai/gpt-6.2-sol-20261117) über OpenRouter in der Gemini-Bridge, Betreiber OpenAI, Denkstufe high, Batch.
- Auftrag: openrouter:batch-1795626022-rTVbfO1NH8n2022ylcFE, abgegeben 25.11.2026 17:00 UTC, fertig 17:06 UTC. Tokens: Eingabe 6.969, Ausgabe 8.063 (davon Denken 3.534). Kosten laut OpenRouter 0,05 US-$. finish_reason: stop.
- Was das Modell bekam: Fragen 1 bis 6 (siehe Bericht `lean/prosa/s2_444_spurA_r8_abgleich_b012.md`, Abschnitt 6), das Feld „Aussage“ von B-012 wörtlich, die Reparatur R-C1 im Wortlaut von B-012, Abschnitt 2 und 4 der Prosa `lean/prosa/s2_444_spurA_r4.md` wörtlich, Abschnitt 3 mit 3.1 und 3.2 wörtlich und 3.3 bis 3.5 leicht gekürzt (Formeln vollständig), alle benutzten Lean-Definitionen wörtlich (ohne Beweisfelder), die Aussagen von `satzB_unbedingt`, `satzB_symm_unbedingt`, `satzC_kern`, `genSN1`, `genSN2`, `satzC_generisch`, `alpha_ne_zero_of_length_25`, `folgerungC1_generisch`, `folgerungC1_nicht36` wörtlich und die Abweichungsliste aus der Moduldoku des Formalisierers. Kein Prüfurteil, kein Urteil des Prüfers.

---

**Kurzbefund:** Format \(\langle4,2,4\rangle\), Termzahl 25 und die Quantifizierung über beliebige Grundkörper stimmen. Lean schließt Symmetrie **am generischen Punkt** aus und liefert dort das Rangpaar \((5,8)\). Der Ausschluss generischer Symmetrie ist mathematisch äquivalent zu Satz C in B-012. Die dafür nötige Brücke zur offenen Menge über \(\bar K\) steht aber nicht in den vorgelegten Lean-Aussagen. Auch R-C1 ist eine Folgerung der generischen Sätze, nicht deren wörtlicher Inhalt.

## 1. Was die vier Lean-Sätze genau sagen

Ein `BilinearAlgorithm K 4 2 4 r` ist eine Identität
\[
AB=\sum_{t=0}^{r-1}\alpha_t(A)\beta_t(B)C_t
\]
für alle \(A\in K^{4\times2}\), \(B\in K^{2\times4}\), mit linearen Formen \(\alpha_t,\beta_t\) und \(C_t\in K^{4\times4}\). Die Werte der Formen auf den Eintragsmatrizen sind genau die Einträge der Prosa-Matrizen \(A_t,B_t\); die Paarung ist die **eintragsweise** Paarung. Die Definition zählt \(r\) Summandenplätze und verlangt für sich genommen weder Nichtnullheit noch Minimalität.

**Körper, Basiswechsel und Auswertungspunkt.** Setze \(F=K(s_{ij},t_{kl})\), den rationalen Funktionenkörper in den 16 Einträgen von \(S\) und den vier Einträgen von \(T\). `baseChange` überträgt die Koeffizienten der Formen und der Ausgabematrizen nach \(F\). Danach setzt `genAlg`
\[
\alpha'_t(A)=\alpha_t(SAT),\qquad
\beta'_t(B)=\beta_t(T^{-1}B),\qquad C'_t=S^{-1}C_t.
\]
Schreibe \(u_i=Se_i\) und \(p=(T_{00},T_{01})^{\mathsf T}\), also die erste **Zeile** von \(T\), als Spaltenvektor notiert. Dann ist
\[
v=T^{-1}e_1=\frac{1}{\det T}(-T_{01},T_{00})^{\mathsf T}
=\frac{Jp}{\det T}.
\]
Hier ist \(e_1\) wegen der Nullindizierung der **zweite** Einheitsvektor. `emb(z)` ist \(e_1z^{\mathsf T}\). Mit \(a_t=A_tp\) und \(b_t=B_t^{\mathsf T}Jp\) folgt daher
\[
\operatorname{avecs}_t=S^{\mathsf T}a_t,\qquad
\beta'_t(\operatorname{emb}(z))=\frac{b_t^{\mathsf T}z}{\det T}.
\]
Insbesondere ist das Normalform-\(u_0\) die erste **Spalte** von \(S\).

**Symmetrie.** `IsSymm` verlangt eine invertierbare lineare Abbildung mit Matrix \(E\) und Skalare \(\mu_t\), sodass für alle \(t,y\)
\[
\frac{b_t^{\mathsf T}Ey}{\det T}=\mu_t y^{\mathsf T}S^{\mathsf T}a_t.
\]
Das ist genau \(M b_t=\lambda_t a_t\) mit \(M=S^{-\mathsf T}E^{\mathsf T}\in\mathrm{GL}_4(F)\) und \(\lambda_t=(\det T)\mu_t\); auch die Umkehrung gilt. Die Transposition ist also richtig. \(\mu_t=0\) ist erlaubt, entsprechend der Prosa-Bedingung \(M b_t\in F a_t\). Sind \(a_t,b_t\) beide ungleich null, ist der Skalar ohnehin ungleich null.

**Normalform und Ränge.** `SN1` fordert \(a_t^{\mathsf T}u_0\ne0\) für jedes \(t\). `SN2` fordert für **jede** nichttriviale \(2\times4\)-Matrix \(X\) über \(F\), dass die vier Vektoren
\[
\bigl((a_t^{\mathsf T}u_i)\beta'_t(X)\bigr)_t,\qquad i=0,1,2,3,
\]
linear unabhängig sind. Die Quantifizierung ist nicht auf Matrizen der Form `emb(z)` beschränkt.

Für die Ränge setze \(V=F^4\), \(U=F^r\) und
\[
\phi_i(z)=\left((a_t^{\mathsf T}u_i)\frac{b_t^{\mathsf T}z}{\det T}\right)_t,\qquad
J_0=\operatorname{im}\phi_0,\qquad Q=U/J_0.
\]
\(J_0\) ist der in Lean `J` genannte Unterraum, **nicht** die \(2\times2\)-Matrix \(J\) der Prosa. Mit \(F_i=\phi_{i+1}\bmod J_0\) für \(i=0,1,2\) sind die beiden Abbildungen
\[
L(x_0,x_1,x_2)=\sum_i F_i(x_i),\qquad
H(c)_i=\sum_j F_j(c_{ij}).
\]
Dabei geht \(L:V^3\to Q\), und \(H\) geht vom Raum der \(V\)-wertigen Matrizen mit \(c_{ii}=0,\ c_{ji}=-c_{ij}\) nach \(Q^3\). Die Ränge sind jeweils **Bilddimensionen über \(F\)**. Unter `SN2` ist \(\dim J_0=4\), und \(\sum_i\operatorname{im}\phi_i=\widehat J_p\). Also gilt tatsächlich
\[
\operatorname{rk}L=\dim\widehat J_p-4
=\dim\operatorname{span}\{a_t(p)\otimes b_t(p)\}-4.
\]
Für \(\operatorname{rk}H\) ist die obige alternierende Zeilenerweiterung der genaue Vergleichsmaßstab. Der zitierte Prosa-Ausschnitt definiert \(H\) nicht selbst; ein unabhängiger Abgleich mit der externen Definition in S2-05 muss daher diese Formel prüfen, nicht nur das Zahlenpaar.

Damit lauten die vier Sätze:

- **`satzC_generisch`:** Für jeden Körper \(K\) und jede solche Zerlegung mit \(r\le25\) gibt es über \(F\) am generischen \(p\) kein \(M\in\mathrm{GL}_4(F)\) mit \(M b_t(p)\in F a_t(p)\) für alle \(t\). Der Längenbereich ist größer als der von B-012.
- **`folgerungC1_generisch`:** Bei genau 25 Summanden erfüllt die generisch transformierte Zerlegung `SN1` und `SN2`, hat die eben definierten Ränge \((5,8)\) und ist dort nicht symmetrisch.
- **`folgerungC1_nicht36`:** Bei genau 25 Summanden ist das Rangpaar derselben generischen Normalform nicht \((3,6)\). Der Satz sagt nichts über einzelne spezialisierte Punkte.
- **`satzC_kern`:** Sei \(F\) ein beliebiger Körper mit einer additiven, die Leibnizregel erfüllenden Abbildung \(D:F\to F\). Für eine Zerlegung mit \(r\le25\) vernichte \(D\) alle Eintragskoeffizienten der \(\alpha_t,\beta_t\). Seien \(p,v\in F^2\) mit \(p^{\mathsf T}v=0\) und \(D(p)^{\mathsf T}v\ne0\). Für jedes \(t\) werde ferner verlangt: Falls \(\beta_t(vz^{\mathsf T})=0\) für alle \(z\), dann auch \(\beta_t(D(v)z^{\mathsf T})=0\) für alle \(z\). Unter diesen Voraussetzungen gibt es keine injektive, also invertierbare, lineare Abbildung \(E:F^4\to F^4\) und keine Skalare \(\mu_t\) mit
  \[
  \beta_t(v(Ex)^{\mathsf T})=\mu_t\alpha_t(xp^{\mathsf T})\quad\text{für alle }t,x.
  \]
  Der Kernsatz postuliert weder eine offene Menge noch eine Ableitung der Ausgabekoeffizienten \(C_t\).

## 2. Generische Nichtsymmetrie gegenüber Satz C in B-012

**Mathematisch sind die beiden Ausschlüsse äquivalent**, aber nicht schon durch Ausfalten der Definitionen. Für Lean \(\Rightarrow\) Prosa muss man zeigen: Geometrische Symmetrie auf einer nichtleeren offenen Menge liefert eine invertierbare Lösung über dem Funktionenkörper, obwohl die punktweisen Lösungen zunächst nur über \(\bar K\) existieren und nicht rational gewählt wurden.

Dazu betrachtet man das homogene lineare System in den Einträgen von \(M\) **und** den Unbekannten \(\lambda_t\):
\[
M b_t(p)-\lambda_t a_t(p)=0.
\]
Über \(K(p_0,p_1)\) wählt man eine Kernbasis. Nach Einschränkung auf eine nichtleere offene Menge spezialisieren sich deren Elemente zu einer Basis des jeweiligen Lösungskerns: Man hält dazu einen rangbestimmenden Minor ungleich null und vermeidet die Nenner. Die Determinante des \(M\)-Anteils einer allgemeinen Linearkombination ist ein Polynom in den Kombinationskoeffizienten mit rationalen Koeffizienten in \(p\). Gibt es auf einer nichtleeren geometrisch offenen Menge invertierbare Lösungen, kann dieses Polynom nicht identisch null sein. Der Funktionenkörper \(K(p_0,p_1)\) ist auch für endliches \(K\) unendlich. Daher gibt es eine invertierbare Lösung schon dort, und damit über \(F\). Das widerspricht Lean.

Umgekehrt kann eine invertierbare Lösung über \(F\) auf \(K(p_0,p_1)\) zurückgeführt werden: Die Kernbasis über dem kleineren Körper bleibt nach Körpererweiterung eine Kernbasis, und ein dort identisch verschwindendes Determinantenpolynom kann nach Erweiterung nicht plötzlich ungleich null werden. Eine rationale invertierbare Lösung spezialisiert sich dann außerhalb ihrer Nenner und der Nullstellen ihrer Determinante. Das Argument zeigt sogar: **Bei generischer Nichtsymmetrie gibt es eine nichtleere geometrisch offene Menge, an deren keinem Punkt eine invertierbare Lösung existiert.** Es schließt nicht jede einzelne Spezialisierung aus.

Diese Brücke ist in den vorgelegten Aussagen **nicht formalisiert**. Dass Satz B direkt über \(F\) angewandt werden kann, erklärt, warum die Lean-Fassung von C1 sie nicht benötigt. Es ersetzt sie aber nicht für den Abgleich mit B-012.

## 3. C1, R-C1 und „an allen \(p\) einer offenen Menge“

`folgerungC1_generisch` ist die **Funktionenkörperfassung** von R-C1. Sie ist nicht die unreparierte Lesart von C1, die \((3,6)\) an jedem zulässigen Punkt ausschließen würde. Und sie quantifiziert nicht selbst über alle Punkte einer offenen Menge.

Für die geometrische R-C1 kann man den Übergang so begründen:

1. Man nimmt die offene Menge punktweiser Nichtsymmetrie aus Abschnitt 2 und schneidet sie mit der offenen Menge, auf der alle \(a_t,b_t\) ungleich null sind. Letztere ist nichtleer, wenn kein entsprechender Termkoeffizient null ist; dafür kann man den im Bericht genannten Ausschluss der Länge 24 verwenden.
2. Auch `SN2` kann man auf einer nichtleeren offenen Menge in \(p\) sicherstellen. Nach Rückgängigmachen der invertierbaren Basiswechsel scheitert `SN2` genau dann, wenn es \(u\ne0\) und \(B\ne0\) gibt mit \((a_t(p)^{\mathsf T}u)\beta_t(B)=0\) für alle \(t\). Für jede Teilmenge \(I\) der Terme prüft man also getrennt, ob \(a_t(p)^{\mathsf T}u=0\) für \(t\in I\) und \(\beta_t(B)=0\) für \(t\notin I\) jeweils eine nichttriviale Lösung haben. Das sind Rangbedingungen. Die endlich vielen schlechten Fälle sind geschlossen und treten am generischen Punkt nicht auf. Insbesondere ist hier die Übertragung von `SN2` auf geometrische Punkte gerechtfertigt, nicht bloß vorausgesetzt.
3. Für jedes \(p\) im Schnitt kann man über \(\bar K\) ein zulässiges \(u_0\) wählen und \(u_0,p\) zu den betreffenden invertierbaren Matrizen \(S,T\) ergänzen. Die beiden angegebenen Sätze B gelten dann punktweise: Sie liefern die Alternative \((3,6)\) oder \((5,8)\), und \((3,6)\) würde punktweise Symmetrie erzwingen. Somit gilt \((5,8)\) dort für **jede** solche zulässige Wahl von \(u_0\) und der Basisergänzungen.

Das beweist die gewünschte offene Fassung als mathematische Folgerung, ohne aus einem Rang am gemeinsamen generischen Punkt eine unberechtigte Aussage über *alle* Basiswahlen abzulesen. Die offene Menge ist dicht; sie muss nicht der gesamte zulässige Ort sein. „An einzelnen zulässigen \(p\) nicht ausgeschlossen“ bedeutet hier, dass der Schluss sie nicht erfasst, nicht dass solche Ausnahmen nachgewiesen wären.

## 4. Was den Status „geprüft“ bekommen kann

Unmittelbar für den verlangten Aussagen-Abgleich geeignet ist folgende Formulierung:

> Für jeden Körper \(K\) und jede Zerlegung der Matrixmultiplikation \(\langle4,2,4\rangle\) mit 25 Summanden gilt: Nach Skalarerweiterung auf \(K(s_{ij},t_{kl})\) und dem Basiswechsel \(\alpha'_t(A)=\alpha_t(SAT)\), \(\beta'_t(B)=\beta_t(T^{-1}B)\), \(C'_t=S^{-1}C_t\) erfüllt die Zerlegung `SN1` und `SN2`. Die Bildränge der oben beschriebenen Quotientenabbildung \(L\) und ihrer alternierenden Erweiterung \(H\) sind \((5,8)\). Am generischen Punkt \(p=(T_{00},T_{01})^{\mathsf T}\) gibt es über diesem Funktionenkörper kein invertierbares \(M\) mit \(M b_t(p)\in K(s_{ij},t_{kl})\,a_t(p)\) für alle \(t\). Der letzte Ausschluss gilt auch für Zerlegungen mit \(r\le25\).

Das ist der direkt Lean-gedeckte Teil. Der Status nach Protokoll 5.1 setzt zusätzlich die beiden verlangten unabhängigen Bestätigungen voraus; CI allein leistet diesen Abgleich nicht.

Die geometrische Form von Satz C und R-C1 sind durch die beschriebenen Brücken **mathematisch ableitbar**, aber nicht als solche in den vorgelegten Lean-Sätzen geprüft. Im Statusfeld würde ich sie daher ohne gesonderte Prüfung der Brücken nicht als Lean-geprüft führen. Die unreparierte C1-Lesart für jeden zulässigen Einzelpunkt bleibt durch diese Sätze unbelegt. Gleiches gilt für die weiteren C2-Aussagen über \(N(u_0)\) und \(s\), deren Definitionen hier nicht vorliegen.

## 5. Reicht das für die weitere Ausschlusskette?

**Ja, sofern der nächste Schritt den generischen bzw. offen-geometrischen Fall \((5,8)\) ohne Symmetrie ausschließt.** Er muss nicht zusätzlich zeigen, dass es keine außergewöhnlichen Punkte mit anderem Rangpaar gibt. Aber er muss seine Voraussetzungen an den Punkten anwenden, an denen Rangpaar und Nichtsymmetrie zugleich gesichert sind.

- Braucht der nächste Schritt einen algebraisch abgeschlossenen Körper, kann man eine hypothetische Zerlegung von \(K\) nach \(\bar K\) übertragen und das offene Argument dort anwenden. Ein Widerspruch dort genügt. \(K(s_{ij},t_{kl})\) ist dagegen nicht automatisch algebraisch abgeschlossen.
- Über endlichem \(K\) muss die nichtleere geometrisch offene Menge keinen \(K\)-rationalen Punkt haben. Auch die konstante Wahl im Prosa-Schritt 0 darf nicht mit der bloßen Unendlichkeit des **Funktionenkörpers** begründet werden, wenn die Konstanten in \(K\) liegen sollen. Im Bericht ist an dieser Stelle der Übergang zum algebraisch abgeschlossenen Körper relevant.
- Zusätzliche generische Voraussetzungen müssen auf einer gemeinsamen nichtleeren offenen Menge erfüllt sein. Aussagen für speziell vorgeschriebene Punkte, für alle zulässigen Punkte oder für Größen wie \(N(u_0)\) und \(s\) brauchen ihre eigenen Übergänge. Wird später wieder eine Ableitung benötigt, sollte man insbesondere in positiver Charakteristik nicht ungeprüft annehmen, dass sie sich auf einen algebraischen Abschluss des Funktionenkörpers fortsetzt.

## 6. Prüfung auf Definitionsfallen

- **Format und Indizes:** \(4\times2\) mal \(2\times4\) ergibt \(4\times4\). `emb` benutzt die zweite Zeile, `avecs` die erste Spalte der Eingabematrix, und die Kombination erzeugt tatsächlich \(p^{\mathsf T}v=e_0^{\mathsf T}e_1=0\). Mit der angegebenen Matrix \(J\) ist das Vorzeichen von \(v=Jp/\det T\) korrekt.
- **Symmetrie und Nullvektoren:** Die Lean-Definition ist auch für \(a_t=0\) korrekt: Sie verlangt dann \(Mb_t=0\). Die bloße Minorenbedingung aus Prosa-Schritt 0 wäre bei \(a_t=0\) hingegen zu schwach. Auf dem zulässigen Ort ist das kein Problem; das lineare System mit \(\lambda_t\) vermeidet es ganz.
- **Kernhypothesen:** Die Ableitungsbedingung ist nicht künstlich leer. Bei \(D=\partial/\partial T_{01}\) gilt \(D(p)^{\mathsf T}v=T_{00}/\det T\ne0\), und die ursprünglichen Eintragskoeffizienten sind konstant. Die Zusatzbedingung `hb` folgt mathematisch bereits aus `hβ`, indem man die Gleichungen \(\beta_t(ve_j^{\mathsf T})=0\) ableitet. `hE` schließt die triviale Nullabbildung aus.
- **Ränge und Charakteristik:** Die explizite Nulldiagonale in `skewSpace` ist gerade in Charakteristik 2 wesentlich; bloße Schiefsymmetrie würde dort den falschen Raum liefern. Die Dimension \(25-16=9\) für \(\ker W\) ist konsistent: Die Zerlegungsidentität bringt alle elementaren \(4\times4\)-Ausgabematrizen ins Bild von \(W\).
- **Nichtnullheit und Körper:** `SN1` wird in C1 nicht nur als möglicherweise unerfüllbare Hypothese vorausgesetzt, sondern für `genAlg` mitbehauptet. Auch `SN2` ist dort Teil der Konklusion. Die Sätze verwenden beliebige Grundkörper, keine versteckte Charakteristikannahme und keine implizite algebraische Abgeschlossenheit.

**Gesamturteil:** Der Lean-Kern trifft den generischen mathematischen Inhalt; es gibt keinen erkennbaren Format-, Längen-, Index- oder Transpositionsfehler. Der wesentliche Unterschied ist die Quantifizierung: Funktionenkörper in Lean, geometrisch offene Menge in B-012. Diese Lücke lässt sich schließen, ist aber in den gezeigten Sätzen nicht selbst formalisiert. Für eine nachfolgende Ausschlusskette auf einer offenen Menge reicht die reparierte Fassung; für einen Ausschluss an jedem zulässigen Einzelpunkt nicht.
