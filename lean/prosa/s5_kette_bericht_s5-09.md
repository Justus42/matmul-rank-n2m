# Bericht S5-09: Prüfung der Glieder K-1 bis K-12

Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit `d6469d8`, Glieder K-1 bis K-12 (Zeilen 109 bis 248), dazu die Begriffe (Zeilen 12 bis 108) und die Liste der Glieder (Zeilen 753 bis 806). Zeilenangaben unten beziehen sich auf diesen Stand der Datei.

Rolle: Prüfer. Dieser Bericht setzt keinen Status. Er gibt je Glied eine Nachrechnung und ein Urteil (bestätigt, nicht bestätigt, offen).

---

## 0. Offenlegung

**Aus einem Projektgedächtnis eingeblendet.** Zu Beginn der Sitzung war mir der Index des Projektgedächtnisses (`MEMORY.md`) eingeblendet. Er enthält Angaben zum Projekt (Repo, Ziel, Fassung des Protokolls, Rechte und Grenzen des Orchestrators, Stufe 4 mit Format 3×2×7, Budgetangaben zu Stufe 4, Regeln zu Fremdmodellen, Literaturwache, Merge-Hinweise) und Verweise auf zwei Einzeleinträge. Später wurden mir zwei Einzeleinträge eingeblendet: `gemini-bridge.md` (Hinweise zur Bridge für Fremdmodell-Anfragen) und `aussagen-abgleich-n3.md` (Hinweise zur Bridge und zum lokalen Lean-Bau). Keiner dieser Texte enthält eine Aussage, ein Urteil oder einen Status zu einem der Glieder K-1 bis K-12 oder zur Kette. Der Auftrag des Orchestrators nannte, dass andere Prüfer unabhängig an derselben Datei arbeiten. Ein erwünschtes Ergebnis wurde nicht genannt.

**Über die Positivliste hinaus gesehen.**
- Die Ausgabe von `git status` im frischen Klon („HEAD detached from refs/heads/main“, Arbeitsbaum sauber).
- Die Liste der Abschnittsüberschriften von `PROTOKOLL.md` (Abschnitte 1 bis 11, nur die Titel), um Abschnitt 5 zu finden. Gelesen habe ich nur Abschnitt 5.
- Die Namen dreier Dateien im gemeinsamen Projektordner (`A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md`), weil die Sitzungsumgebung sie aufzählt. Inhalte habe ich nicht gelesen.
- Ein Befehl, der Zweige und den letzten Commit gezeigt hätte, wurde von der Umgebung abgelehnt und hat nichts ausgegeben.
- Beim Anlegen meines Zweigs habe ich `main` geholt und geprüft, dass mein Berichtsname noch frei ist. Dabei habe ich keine anderen Dateien gelesen.

Andere Teile der Kette, andere Berichte, `STATUS.md`, `LOG.md`, `pruefvermerke/` und die Git-Historie habe ich nicht gelesen.

---

## 1. Vorgehen

Ich habe jedes Glied für sich gelesen: Wortlaut, Zeile „Voraussetzungen“, jeden Beweisschritt. Begriffe habe ich nur aus den Zeilen 12 bis 108 genommen. Vorausgesetzte Glieder mit kleinerer Nummer habe ich nur in ihrem Wortlaut benutzt.

Wo eine Aussage rechnerisch prüfbar ist, habe ich mit einem eigenen Programm in exakter Arithmetik nachgerechnet (Python, Körper ℚ mit `fractions.Fraction`, Primkörper GF(2), GF(3), GF(5), GF(7), GF(101), Körper GF(4) und GF(8) über eigene Polynomarithmetik, keine Gleitkommazahlen). Das Programm steht in Anhang A, seine Ausgabe in Anhang B. Alle 40 Einzelprüfungen liefen ohne Abweichung durch. Rechenzeit insgesamt etwa eine Minute auf einem Kern.

Rechnungen über endlichen Körpern ersetzen bei Gliedern, die einen unendlichen Körper voraussetzen, keinen Beweis. Sie dienen der Suche nach Gegenbeispielen in Randfällen (kleine Charakteristik, Charakteristik 2) und zeigen, wo die Voraussetzung „unendlich“ gar nicht gebraucht wird.

---

## 2. Die Glieder

### K-1 (Polynome über unendlichen Körpern), Zeilen 111 bis 124

**Wortlaut und Voraussetzungen.** Drei Aussagen über einen unendlichen Körper K. Voraussetzungen: keine. Das stimmt: Der Beweis benutzt nur Grundtatsachen über Polynome (Zahl der Nullstellen, Nullteilerfreiheit).

**Nachrechnung (a), Zeile 120.**
1. Fall n = 1: Ein Polynom P ≠ 0 vom Grad d hat höchstens d Nullstellen in K. Weil K unendlich ist, gibt es einen Wert x mit P(x) ≠ 0. Bei d = 0 ist P eine Konstante ≠ 0, dann ist jede Stelle recht.
2. Schritt n − 1 → n: Man ordnet P nach Potenzen von x_n, P = Σ_j P_j(x_1, …, x_{n−1})·x_n^j. Weil P ≠ 0, ist ein Koeffizient P_j ≠ 0. Nach Induktionsannahme gibt es x′ ∈ K^{n−1} mit P_j(x′) ≠ 0.
3. Dann ist P(x′, x_n) ein Polynom in x_n, dessen Koeffizient bei x_n^j den Wert P_j(x′) ≠ 0 hat. Es ist also nicht das Nullpolynom, und Schritt 1 liefert x_n.
Das ist vollständig.

**Nachrechnung (b), Zeile 121.** K[x_1, …, x_n] ist ein Integritätsbereich. Ein Produkt endlich vieler Faktoren ≠ 0 ist ≠ 0 (Induktion über die Zahl der Faktoren). Vollständig.

**Nachrechnung (c), Zeile 122.**
1. Zariski-offen heißt nach 1.3: U_i = {x ∈ X : nicht alle f ∈ M_i verschwinden in x} für eine Menge M_i von Polynomen. (Liest man „offen“ als offen in K^n und U_i ⊆ X, ergibt sich dieselbe Beschreibung.)
2. Weil U_i ≠ ∅, gibt es x_i ∈ U_i und ein f_i ∈ M_i mit f_i(x_i) ≠ 0. Also ist f_i nicht das Nullpolynom.
3. Jede Stelle x ∈ X mit f_i(x) ≠ 0 liegt in U_i, denn dort verschwindet nicht jedes Element von M_i. Also {x ∈ X : f_i(x) ≠ 0} ⊆ U_i.
4. Nach (b) ist f_1·f_2·h ≠ 0. Nach (a) gibt es x ∈ K^n mit f_1(x)·f_2(x)·h(x) ≠ 0. Dann h(x) ≠ 0, also x ∈ X, und nach 3. x ∈ U_1 ∩ U_2.
5. Der Durchschnitt zweier offener Mengen {Nicht-Verschwinden von M_1} ∩ {Nicht-Verschwinden von M_2} ist die Menge, auf der nicht alle Produkte f·g (f ∈ M_1, g ∈ M_2) verschwinden, also wieder offen. Der Beweis sagt das nur in einem Satz, es ist aber Standard und richtig.

**Anwendung, Zeile 124.** h = det S · det T ist ein Polynom in den 13 Koordinaten und nicht das Nullpolynom (an (I, I) ist der Wert 1). Also ist 𝒢 von der Form in (c). Richtig.

**Randfälle.** Leere Mengen sind durch „nicht leer“ ausgeschlossen. Die Voraussetzung „X nicht leer“ ist neben h ≠ 0 überflüssig, aber unschädlich.

**Ungenauigkeiten im Wortlaut (keine Lücken).**
- (c) sagt nicht, ob U_1, U_2 offen in X (Teilraumtopologie) oder offen in K^n sind. Beide Lesarten führen zum selben Beweis.
- Zeile 122, letzter Satz: dass der Durchschnitt offen ist, wird ohne Begründung gesagt (siehe Schritt 5).

**Urteil K-1: bestätigt.**

### K-2 (Interpolation), Zeilen 126 bis 132

**Wortlaut und Voraussetzungen.** K beliebiger Körper, Π ⊆ K² endlich. Voraussetzungen: keine. Das stimmt.

**Nachrechnung, Zeile 132.**
1. Zu ξ′ ∈ Π mit ξ′ ≠ ξ gibt es eine Koordinate i mit ξ_i ≠ ξ′_i. λ_{ξ′} := a_i − ξ′_i ist ein Polynom vom Grad 1 mit λ_{ξ′}(ξ′) = 0 und λ_{ξ′}(ξ) = ξ_i − ξ′_i ≠ 0.
2. Das Produkt Π_{ξ′≠ξ} λ_{ξ′}(ξ) ist ein Produkt von Körperelementen ≠ 0, also ≠ 0. Die Division ist erlaubt.
3. χ_ξ(ξ) = 1, weil Zähler und Nenner übereinstimmen. Für ξ″ ∈ Π ∖ {ξ} enthält der Zähler den Faktor λ_{ξ″}, der an ξ″ verschwindet. Also χ_ξ(ξ″) = 0.
4. Ist Π = {ξ}, dann sind beide Produkte leer und χ_ξ = 1. Das erfüllt die Aussage.
5. Für φ : Π → K ist Σ_ξ φ(ξ)·χ_ξ an jeder Stelle ξ″ ∈ Π gleich φ(ξ″) nach 3.
Keine Annahme über die Charakteristik oder die Größe von K wird benutzt. Für Π = ∅ ist die Aussage leer, und die leere Funktion ist die Einschränkung des Nullpolynoms.

**Rechnung.** Anhang A, `check_K2`: Über GF(2), GF(3), GF(5) für je 200 zufällige Mengen Π (bis 6 Punkte) habe ich χ_ξ genau nach der Formel des Beweises gebildet und an allen Punkten von Π ausgewertet. Keine Abweichung.

**Ungenauigkeiten im Wortlaut.**
- Das Zeichen Π steht in Zeile 132 zugleich für die Menge und für das Produkt. Lesbar, aber missverständlich.
- χ_ξ ist durch K-2 nicht eindeutig festgelegt (Wahl der Koordinate i). Begriffe, die χ_ξ benutzen (1.4: M_ξ := χ_ξ·K″), hängen davon nicht ab, weil nach K-6 (i) nur die Werte von χ_ξ auf Π zählen. Das sollte einmal gesagt werden.

**Urteil K-2: bestätigt.**

### K-3 (Koszul im Grad 2), Zeilen 134 bis 142

**Wortlaut und Voraussetzungen.** K beliebiger Körper, jede Charakteristik. Voraussetzungen: keine. Das stimmt, der Beweis ist reine lineare Algebra und Teilbarkeit in K[X_0, X_1, X_2].

**Nachrechnung, Zeilen 140 bis 142.**
1. dim 𝒮_2 = 6, also dim 𝒮_2³ = 18. dim 𝒮_3 = 10.
2. Die Abbildung μ : (Φ_i) ↦ Σ X_iΦ_i ist surjektiv: Jedes Monom vom Grad 3 enthält eine Variable X_i und ist X_i mal ein Monom vom Grad 2. Also dim ℛ = dim ker μ = 18 − 10 = 8.
3. δ_K ist auf 𝒮_1³ (Dimension 9) definiert. Einsetzen: X_0(Ψ_{01}X_1 + Ψ_{02}X_2) + X_1(−Ψ_{01}X_0 + Ψ_{12}X_2) + X_2(−Ψ_{02}X_0 − Ψ_{12}X_1) = 0, jeder Term hebt sich mit einem anderen weg. Also im δ_K ⊆ ℛ.
4. Kern: Erste Komponente null heißt Ψ_{01}X_1 = −Ψ_{02}X_2. X_2 ist prim in 𝒮 und teilt X_1 nicht, also X_2 | Ψ_{01}. Weil Ψ_{01} Grad 1 hat (oder null ist), Ψ_{01} = cX_2 mit c ∈ K. Einsetzen gibt Ψ_{02} = −cX_1 (Kürzen von X_2 im Integritätsbereich).
5. Zweite Komponente null: −cX_2X_0 + Ψ_{12}X_2 = 0, also Ψ_{12} = cX_0. Die dritte Komponente ist dann cX_1X_0 − cX_0X_1 = 0, also kein weiterer Zwang. Kern = {(cX_2, −cX_1, cX_0)}, Dimension 1.
6. Rangsatz: dim im δ_K = 9 − 1 = 8 = dim ℛ, mit 3. also im δ_K = ℛ.
7. Mit Ψ_{ii} := 0 und Ψ_{ki} := −Ψ_{ik}: Σ_k Ψ_{0k}X_k = Ψ_{01}X_1 + Ψ_{02}X_2, Σ_k Ψ_{1k}X_k = −Ψ_{01}X_0 + Ψ_{12}X_2, Σ_k Ψ_{2k}X_k = −Ψ_{02}X_0 − Ψ_{12}X_1. Das sind genau die drei Komponenten von δ_K.
8. Charakteristik: In Charakteristik 2 ist Ψ_{ki} = −Ψ_{ik} = Ψ_{ik}. Die Forderung Ψ_{ii} = 0 wird getrennt gestellt und erfüllt. Keiner der Schritte 1 bis 7 teilt durch eine ganze Zahl.

**Rechnung.** Anhang A, `check_K3`: Über ℚ, GF(2), GF(3), GF(5) habe ich die Matrix von μ (10×18) und die Bilder von δ_K (9 Vektoren in 𝒮_2³) aufgestellt. Ergebnis in allen vier Körpern: Rang von μ gleich 10, dim ℛ = 8, Rang von δ_K gleich 8, Bild von δ_K in ℛ. Das bestätigt die Zählung auch in Charakteristik 2 und 3.

**Urteil K-3: bestätigt.**

### K-4 (Geraden und Kegelschnitte), Zeilen 144 bis 155

**Wortlaut und Voraussetzungen.** K unendlich. Voraussetzungen: K-1. Benutzt wird K-1 (a) in (a), Zeile 153 („h = 0 (K-1 (a))“). Weitere Glieder werden nicht benutzt. P_1, P_2 stammen aus 1.4.

**Nachrechnung (a), Zeile 153.**
1. λ = l_0 + l_1a_1 + l_2a_2 mit (l_1, l_2) ≠ (0, 0). Die Lösungsmenge ist ℒ = {ξ_0 + sδ : s ∈ K} mit einer Lösung ξ_0 und δ = (−l_2, l_1) ≠ 0. Die Zuordnung s ↦ ξ_0 + sδ ist injektiv, drei verschiedene Punkte entsprechen drei verschiedenen s.
2. s ↦ g(ξ_0 + sδ) ist ein Polynom vom Grad ≤ 2 in s mit drei verschiedenen Nullstellen, also das Nullpolynom. Damit verschwindet g auf ganz ℒ.
3. Affiner Koordinatenwechsel a′_1 := λ, a′_2 := eine affine Form, deren linearer Teil zusammen mit (l_1, l_2) eine Basis bildet. Der Wechsel ist invertierbar und erhält den Grad.
4. Division durch a′_1 in K[a′_1, a′_2]: g = a′_1·g′ + h(a′_2), mit h(a′_2) = g(0, a′_2) in neuen Koordinaten und deg g′ ≤ 1. Die Punkte (0, s) sind genau die Punkte von ℒ, also h(s) = 0 für alle s ∈ K nach 2.
5. h hat Grad ≤ 2 und unendlich viele Nullstellen, also h = 0 (der Text beruft sich auf K-1 (a); es genügen schon die drei Nullstellen aus der Voraussetzung, dann braucht (a) die Unendlichkeit von K gar nicht).
6. Zurück transformiert: g = λ·g′ mit deg g′ ≤ 1.

**Nachrechnung (b), Zeile 154.**
1. Angenommen, drei verschiedene Nullstellen von g liegen auf ℒ = {λ = 0}. Nach (a) ist g = λ·g′ mit g′ ∈ P_1.
2. g′ ≠ 0, sonst g = 0. Im Integritätsbereich ist deg g = deg λ + deg g′, also deg g′ = 1.
3. Homogenisierung ist multiplikativ: X_0²·g(X/X_0) = (X_0·λ(X/X_0))·(X_0·g′(X/X_0)) = λ̂·ĝ′, zwei Formen vom Grad 1, keine davon eine Einheit. Also ist ĝ zerlegbar. Widerspruch.
4. „Insbesondere“: auf jeder Geraden höchstens zwei Nullstellen, also nicht unendlich viele.

**Nachrechnung (c), Zeile 155.**
1. Angenommen, g, g′ ∈ P_2 sind linear unabhängig und verschwinden an ξ_1, …, ξ_5.
2. Die Gerade ℒ_{12} durch ξ_1 ≠ ξ_2 existiert. Weil K unendlich ist, hat sie einen Punkt η ∉ {ξ_1, ξ_2}.
3. Die Bedingung λg(η) + μg′(η) = 0 ist eine lineare Gleichung in (λ, μ), hat also eine Lösung (λ, μ) ≠ (0, 0). h := λg + μg′ ≠ 0 wegen linearer Unabhängigkeit.
4. h verschwindet an ξ_1, ξ_2, η, drei verschiedenen Punkten von ℒ_{12}. Nach (a): h = λ_{12}·h′ mit h′ ∈ P_1.
5. ξ_3, ξ_4, ξ_5 liegen nicht auf ℒ_{12} (sonst wären ξ_1, ξ_2, ξ_j kollinear), also λ_{12}(ξ_j) ≠ 0 und h′(ξ_j) = 0 für j = 3, 4, 5.
6. Ist h′ konstant, dann ist h′ = 0 (es verschwindet in ξ_3). Hat h′ Grad 1, liegen ξ_3, ξ_4, ξ_5 auf der Geraden {h′ = 0}, gegen die Voraussetzung. Also h′ = 0, h = 0, Widerspruch zu 3.

**Rechnung.** Anhang A, `check_K4`, `check_K4c_Q`:
- (a) über GF(5) und GF(4) für alle g ∈ P_2 und alle Geraden, über GF(7) und GF(8) für 5000 zufällige g: Wo g an mindestens drei Punkten einer Geraden verschwindet, verschwindet es auf der ganzen Geraden und liegt in λ·P_1. Keine Abweichung.
- (b) über GF(4), GF(5), GF(7): Zerlegbare quadratische Formen habe ich als Produkte zweier Linearformen vollständig aufgezählt. Für jedes g vom Grad 2 mit nicht zerlegbarer Homogenisierung (13640 über GF(5), 3402 über GF(4), 4569 zufällige über GF(7)) liegen auf keiner Geraden drei Nullstellen.
- (c) über GF(4), GF(5), GF(7), GF(8): alle (oder 6000 zufällige) Fünfermengen in allgemeiner Lage, und 236 zufällige Fünfermengen über ℚ: Der Raum der Kegelschnitte durch die fünf Punkte hat Dimension höchstens 1 (über ℚ jeweils genau 1).
Die Rechnungen über endlichen Körpern zeigen, dass (a) bis (c) dort ebenfalls gelten, sobald K mindestens drei Elemente hat. Das stimmt mit dem Beweis überein: Unendlichkeit wird nur für den dritten Punkt η in (c) und in (a) Schritt 5 benutzt, und beides kommt mit drei Elementen aus.

**Ungenauigkeiten im Wortlaut.**
- In (c) steht λ einmal für einen Skalar (λ, μ) und zugleich für Geradengleichungen (λ, λ_{12}). Lesbar, aber unglücklich.
- In (a) ist die Berufung auf K-1 (a) nicht nötig (siehe Schritt 5).

**Urteil K-4: bestätigt.**

### K-5 (homogene Polynome in zwei Variablen), Zeilen 157 bis 163

**Wortlaut und Voraussetzungen.** K unendlich, Q ≠ 0 homogen vom Grad d. Voraussetzungen: keine. Das stimmt.

**Nachrechnung, Zeile 163.**
1. Homogenität: Q(λp) = λ^d·Q(p). Für λ ≠ 0 ist Q(λp) = 0 genau dann, wenn Q(p) = 0. „Q(p) ≠ 0“ hängt nur von [p] ab.
2. P¹(K) besteht aus den Klassen [x : 1] (zweite Koordinate ≠ 0, auf 1 skaliert) und der einen Klasse [1 : 0]. Die [x : 1] sind paarweise verschieden.
3. Q(x, 1) = Σ q_i x^i =: q(x). Weil Q ≠ 0, ist ein q_i ≠ 0, also q nicht das Nullpolynom, Grad ≤ d, höchstens d Nullstellen. Zusammen mit [1 : 0] höchstens d + 1 Nullstellen in P¹(K).
4. Unendlich viele [x : 1], davon höchstens d mit Q = 0, also unendlich viele mit Q ≠ 0. Dieser letzte Abzug steht im Beweis nicht ausdrücklich, folgt aber unmittelbar aus 3.
Randfall d = 0: Q ist eine Konstante ≠ 0 und verschwindet nirgends. Die Schranke 1 gilt.

**Rechnung.** Anhang A, `check_K5`: Über GF(2) und GF(5) für alle Q vom Grad d ≤ 3: höchstens d + 1 Nullstellen in P¹, und das Nichtverschwinden ist unter Skalierung invariant.

**Ungenauigkeiten im Wortlaut.**
- „Die übrigen Elemente von P¹(K) sind die [x : 1] und [1 : 0]“ ist schief formuliert. Gemeint ist: P¹(K) besteht genau aus diesen.
- Der Schluss „unendlich viele minus höchstens d“ ist nicht ausgeschrieben.

**Urteil K-5: bestätigt.**

### K-6 (Zerlegung eines 𝒜-Moduls nach Fasern), Zeilen 165 bis 178

**Wortlaut und Voraussetzungen.** K beliebig, r ≥ 1, Punkte ξ(t), 𝒜 wirkt punktweise, M ein 𝒜-Modul im Sinn von 1.4 (Unterraum mit a_1·M ⊆ M und a_2·M ⊆ M). Voraussetzungen: K-2. Benutzt wird K-2 für die Existenz von χ_ξ.

**Vorbemerkung zu einem unausgesprochenen Schritt.** Die Wirkung f ↦ (v ↦ f·v) ist ein Ringhomomorphismus von 𝒜 in die Diagonalmatrizen: (fg)·v = f·(g·v), (f + g)·v = f·v + g·v, die Konstante c wirkt als Multiplikation mit c. Ist M ein Unterraum mit a_1·M ⊆ M und a_2·M ⊆ M, dann folgt durch Induktion über Monome und Linearkombinationen f·M ⊆ M für jedes f ∈ 𝒜. Der Beweis in Zeile 176 benutzt genau das („Weil M ein 𝒜-Modul ist, gilt χ_ξ·M ⊆ M“), sagt es aber nicht. Das ist eine kleine Lücke im Wortlaut, keine echte.

**Nachrechnung.**
- (i), Zeile 175: Für t ∈ T_ξ ist ξ(t) = ξ, also χ_ξ(ξ(t)) = 1. Für t ∉ T_ξ ist ξ(t) ∈ Π ∖ {ξ}, also χ_ξ(ξ(t)) = 0 nach K-2. Also ist χ_ξ·v auf T_ξ gleich v und sonst 0. Auf Vektoren mit Träger in T_ξ wirkt f als Multiplikation mit f(ξ).
- (ii), Zeile 176: χ_ξ·M ⊆ M (Vorbemerkung) und χ_ξ·M ⊆ K^{T_ξ} (nach (i)). Umgekehrt ist für v ∈ M ∩ K^{T_ξ} nach (i) v = χ_ξ·v ∈ χ_ξ·M. Also χ_ξ·M = M ∩ K^{T_ξ}. Die Fasern T_ξ zerlegen {1, …, r}, also v = Σ_ξ χ_ξ·v. Die Summe ist direkt, weil die Träger disjunkt sind.
- (iii), Zeile 177: Ist X eine Vereinigung von Fasern, dann ist jede Faser entweder in X enthalten oder zu X disjunkt (Fasern sind paarweise disjunkt). Ein v ∈ M liegt genau dann in K^X, wenn alle Anteile χ_ξ·v mit T_ξ ⊄ X null sind. Mit (ii) folgt M ∩ K^X = ⊕_{T_ξ⊆X} M_ξ. Einschränkung auf X ist auf Vektoren mit Träger in X injektiv. Sie ist surjektiv auf M|_X, weil v|_X = (Σ_{T_ξ⊆X} χ_ξ·v)|_X und dieser Vektor in ⊕_{T_ξ⊆X} M_ξ liegt. Die Dimensionsformel folgt.
- (iv), Zeile 178: χ_ξ·(f·v) = f·(χ_ξ·v) = f(ξ)·χ_ξ·v nach (i). Also χ_ξ·(𝒜·v) ⊆ K·(χ_ξ·v). Mit f = c konstant erhält man jedes Vielfache. Gleichheit.

**Randfälle.** M = {0}: alle M_ξ = {0}, alle Aussagen gelten. X = ∅: leere Summe, M|_∅ = {0}. Eine einzige Faser: χ_ξ = 1.

**Rechnung.** Anhang A, `check_K6`: Über GF(2), GF(5), GF(7), je 150 zufällige Fälle mit r ≤ 9, wiederholten Punkten (Fasern mit mehreren Indizes) und zufälligen Moduln (Abschluss erzeugender Vektoren unter a_1, a_2): Summe der dim M_ξ gleich dim M, χ_ξ·M ⊆ M, dim M|_X = Σ_{T_ξ⊆X} dim M_ξ für zufällige Vereinigungen X von Fasern, und χ_ξ·(𝒜·v) = K·(χ_ξ·v). Keine Abweichung.

**Ungenauigkeiten im Wortlaut.**
- Der Schritt von „a_1·M ⊆ M, a_2·M ⊆ M“ zu „f·M ⊆ M für alle f ∈ 𝒜“ fehlt (Vorbemerkung).
- „Seien Π, T_ξ, χ_ξ wie in 1.4“: 1.4 definiert diese Begriffe für eine Normalform mit r = 34. Gemeint ist die gleiche Definition für die hier gegebenen Punkte ξ(t). Lesbar.

**Urteil K-6: bestätigt.**

### K-7 (Grundtatsachen über Verfahren), Zeilen 184 bis 197

**Wortlaut und Voraussetzungen.** V Verfahren der Länge r für ⟨3,2,m⟩ über einem Körper K, Bezeichnungen aus 1.2. Voraussetzungen: „Nur (Z)“. Benutzt werden (Z) und die Definitionen aus 1.2 (D, ℬ, W, K′, f_i, SN1). Kein anderes Glied. Die Tabelle in Abschnitt 11 führt bei K-7 „–“, passend.

**Nachrechnung, Zeile 197.**
- (D1): D(A), D(A′) sind Diagonalmatrizen, diese vertauschen.
- (D2): W(D(A)·ℬ(y)) = Σ_t α_t(A)·β_t(y)·C_t = Ay nach (Z). Das ist (Z′).
- (T1): ℬ ist linear. Aus ℬ(B) = 0 folgt nach (D2) AB = W(0) = 0 für alle A. Für A = e_{00} ist Zeile 0 von AB die Zeile 0 von B. Für A = e_{01} ist Zeile 0 von AB die Zeile 1 von B. Beide Zeilen sind null, B = 0.
- (T2): e_{i0}^{(3×2)}·e_{0l}^{(2×m)} = e_{il}^{(3×m)}, nach (D2) gleich W(D(e_{i0})ℬ(e_{0l})). Diese 3m Matrizen bilden eine Basis von K^{3×m}, also ist W surjektiv.
- (T3): Rangsatz für W : K^r → K^{3×m}: dim ker W = r − 3m. Dimension ≥ 0 gibt r ≥ 3m.
- (T4): f_0 = D(e_{00})∘ℬ. D(e_{00}) ist unter (SN1) invertierbar, ℬ nach (T1) injektiv.
- (T5): (D2) mit A = e_{i0}^{(3×2)}. Das Produkt e_{i0}·x hat als Zeile i die Zeile 0 von x und sonst Nullen.

**Rechnung.** Anhang A, `check_K7_K10_K12`: Für Verfahren der Form „Standardalgorithmus mit 6m Produkten plus zwei sich aufhebende Paare von Produkten, dann zufälliger Basiswechsel“ über ℚ (m = 1, 2), GF(2) (m = 2), GF(3) (m = 3): Brent-Gleichungen erfüllt, Rang von ℬ gleich 2m (T1), Rang von W gleich 3m (T2), dim K′ = r − 3m (T3), W(f_i(x)) = e_{i0}·x für zufällige x (T5). Keine Abweichung.

**Urteil K-7: bestätigt.**

### K-8 (R1: Körpererweiterung), Zeilen 199 bis 205

**Wortlaut und Voraussetzungen.** Voraussetzungen: keine. Das stimmt.

**Nachrechnung, Zeile 205.**
1. Die Brent-Gleichungen sind polynomiale Gleichungen in den Koeffizienten von α_t, β_t, C_t mit ganzzahligen Koeffizienten. Gelten sie in F, gelten sie wörtlich in K ⊇ F.
2. Nach 1.1 ist (Z) über K gleichwertig zu den Brent-Gleichungen, weil beide Seiten bilinear in (A, B) sind.
3. Rang: Der Rang einer Matrix über F ist die Größe eines größten nicht verschwindenden Minors. Minoren sind Elemente von F und ändern sich bei Erweiterung nicht.
4. α_t = 0 genau dann, wenn alle Koeffizienten null sind. Das hängt nicht vom Körper ab.
5. Proportionalität: Der Beweis sagt dazu nichts ausdrücklich. Sie folgt aus 3., wenn man „α_s und α_t proportional“ als „die beiden Koeffizientenvektoren sind linear abhängig“ liest, denn das ist eine Rangbedingung an die 2×6-Matrix aus beiden Vektoren. Liest man es als „α_s = c·α_t mit c ∈ K“ und ist α_t ≠ 0, dann ist c der Quotient zweier Einträge aus F, liegt also in F.

**Ungenauigkeiten im Wortlaut.**
- Der Begriff „Proportionalität“ ist in Abschnitt 1 nicht definiert, und der Beweis begründet diesen Teil nicht ausdrücklich (siehe 5.).

**Urteil K-8: bestätigt.**

### K-9 (R2: Nullformen streichen), Zeilen 207 bis 213

**Nachrechnung, Zeile 213.** Ist α_t = 0, dann ist α_t(A)·β_t(B)·C_t = 0 für alle A, B. Ohne diesen Summanden bleibt (Z) gültig, und es bleiben r − 1 Indizes.

**Ungenauigkeit im Wortlaut.** Der Wortlaut nennt den Rahmen (V Verfahren der Länge r für ⟨3,2,m⟩ über einem Körper) nicht selbst, er ergibt sich aus dem Zusammenhang von Abschnitt 3.

**Urteil K-9: bestätigt.**

### K-10 (R3: Basiswechsel), Zeilen 215 bis 221

**Wortlaut und Voraussetzungen.** Voraussetzungen: keine. Benutzt wird nur (Z) und die Definition in 1.3. Das stimmt.

**Nachrechnung, Zeile 221.**
1. Formate: SAT ∈ K^{3×2}, T^{−1}B ∈ K^{2×m}, S^{−1}C_t ∈ K^{3×m}.
2. Σ_t α_t(SAT)·β_t(T^{−1}B)·S^{−1}C_t = S^{−1}·Σ_t α_t(SAT)β_t(T^{−1}B)C_t = S^{−1}·(SAT)(T^{−1}B) nach (Z) = AB. Also ist V^{(S,T)} ein Verfahren, Länge r.
3. Koeffizientenmatrix: α′_t(A) = Σ_{ij}(α_t)_{ij}(SAT)_{ij} = Spur(α_tᵀSAT). Mit Spur(XY) = Spur(YX): Spur(Tα_tᵀSA) = Spur((Sᵀα_tTᵀ)ᵀA). Weil Spur(MᵀA) = Σ M_{ij}A_{ij}, ist Sᵀα_tTᵀ die Koeffizientenmatrix.
4. α ↦ Sᵀα Tᵀ ist eine invertierbare lineare Abbildung von K^{3×2} auf sich. Sie erhält den Rang, die lineare Abhängigkeit zweier Matrizen (Proportionalität) und bildet 0 genau auf 0 ab.
5. Spaltenraum von Sᵀα_tTᵀ = Sᵀ·(Spaltenraum von α_t), weil Tᵀ invertierbar ist. Also haben α′_s und α′_t genau dann gleiche Spaltenräume, wenn α_s und α_t gleiche Spaltenräume haben.
6. S·e_{i0}·T: e_{i0} = e_i·(1, 0) mit dem Einheitsvektor e_i ∈ K³. S·e_i = s_i, (1, 0)·T = p. Also S e_{i0} T = s_i p, und ebenso S e_{i1} T = s_i p′. Nach 1.1 ist α_t(s_i p) = s_iᵀα_tpᵀ.

**Rechnung.** Anhang A, `basechange` und `check_K7_K10_K12`: Die Koeffizientenmatrizen von α′_t und β′_t habe ich durch Auswerten auf den Basismatrizen gebildet, also unabhängig von der Formel Sᵀα_tTᵀ. Über ℚ, GF(2), GF(3) mit zufälligen S, T: V^{(S,T)} erfüllt die Brent-Gleichungen, die Koeffizientenmatrix stimmt mit Sᵀα_tTᵀ überein, Ränge stimmen überein, α′_t(e_{i0}) = s_iᵀα_tpᵀ und α′_t(e_{i1}) = s_iᵀα_tp′ᵀ. Keine Abweichung, auch in Charakteristik 2.

**Ungenauigkeit im Wortlaut.** „gleiche Spaltenräume der α′_t dieselben wie bei den α_t“ meint die Gleichheitsbeziehung zwischen Spaltenräumen, nicht die Spaltenräume selbst (diese werden mit Sᵀ abgebildet). Der Beweis sagt das in der Klammer richtig.

**Urteil K-10: bestätigt.**

### K-11 (Lemma A′: starke Normalisierung, mit Polynom), Zeilen 223 bis 237

**Wortlaut und Voraussetzungen.** K unendlich, V Verfahren der Länge r ≥ 1, kein α_t ist die Nullform. Es gibt ein Polynom Λ ≠ 0 in den fünf Koordinaten von (s_0, p), homogen in p, so dass für alle S ∈ GL_3(K) mit erster Spalte s_0 und alle T ∈ GL_2(K) mit erster Zeile p aus Λ(s_0, p) ≠ 0 folgt: V^{(S,T)} erfüllt (SN1) und (SN2). Die Quantoren sind eindeutig: „es gibt Λ“ außen (Λ hängt nur von V ab), „für alle (s_0, p), S, T“ innen. Voraussetzungen: K-1, K-7 (D2), K-10. Benutzt werden K-1 (a), (b), K-7 (D2), K-10 (Formel α′_t(e_{i0}) = α_t(s_i p) und Definition von β′_t). Dazu die Annahmen des Wortlauts (K unendlich in Zusatz, r ≥ 1 in Zusatz, α_t ≠ 0 in Schritt 1). Alles steht in der Liste.

**Nachrechnung.**
- *Schritt 1, Zeile 230.* α_t(s_0 p) = Σ_{ij}(α_t)_{ij}(s_0)_i p_j. Die Monome (s_0)_i p_j sind paarweise verschieden, also sind die Koeffizienten des Polynoms genau die Einträge von α_t. Wegen α_t ≠ 0 ist das Polynom ≠ 0. Es ist homogen vom Grad 1 in p. Λ_1 := Π_t α_t(s_0 p).
- *Schritt 2, Zeile 231.* Weil α_t linear ist, gilt α_t(xp) = Σ_i x_i α_t(e_i p). Der t-te Eintrag von D(xp)·ℬ(v) ist α_t(xp)·ℬ(v)_t. Für t ∉ supp(v) ist er null. Für t ∈ supp(v) ist er null genau dann, wenn (M_{supp(v)}(p)·x)_t = 0. Also ist der Kern von x ↦ D(xp)ℬ(v) der Kern von M_{supp(v)}(p), und Injektivität ist gleichwertig zu Rang 3. Zweite Aussage: Aus D(xp)ℬ(v) = 0 folgt mit (D2) 0 = W(D(xp)ℬ(v)) = (xp)v = x·(pv). Das ist das äußere Produkt der Spalte x mit der Zeile pv ≠ 0, also x = 0.
- *Schritt 3, Zeile 232.* 𝒮 ist eine Menge von Teilmengen von {1, …, r}, also endlich. Zu Σ ∈ 𝒮 gibt es v_Σ ≠ 0 mit supp = Σ. Eine Zeile j von v_Σ ist ≠ 0, also hat p_Σ := e_jᵀ (j-ter Einheitszeilenvektor) p_Σ v_Σ ≠ 0. Nach Schritt 2 hat M_Σ(p_Σ) Rang 3, also gibt es drei Zeilen, deren 3×3-Determinante an p_Σ nicht verschwindet. Diese Determinante q_Σ(p) ist ein Polynom in p, dessen Einträge linear in p sind, also homogen vom Grad 3, und es ist ≠ 0, weil es einen Wert ≠ 0 hat. (Nebenbei folgt |Σ| ≥ 3.)
- *Schritt 4, Zeile 233.* Λ := Λ_1·Π_Σ q_Σ ist nach K-1 (b) ≠ 0 und als Produkt homogener Polynome in p homogen in p. Ist Λ(s_0, p) ≠ 0, dann ist jeder Faktor ≠ 0: α_t(s_0 p) ≠ 0 für alle t, und für v ≠ 0 ist supp(v) ∈ 𝒮, also q_{supp(v)}(p) ≠ 0, also hat M_{supp(v)}(p) Rang 3, und nach Schritt 2 ist x ↦ D(xp)ℬ(v) injektiv.
- *Schritt 5, Zeile 234.* Nach K-10 ist α′_t(e_{i0}) = s_iᵀα_tpᵀ = α_t(s_i p), also D′(e_{i0}) = D(s_i p). Nach der Definition in 1.3 ist ℬ′(v) = ℬ(T^{−1}v). (SN1): D′(e_{00}) = D(s_0 p) hat Diagonaleinträge α_t(s_0 p) ≠ 0. (SN2): Sei v ≠ 0 und Σ_i γ_i f′_i(v) = 0. Weil D linear in A ist und Σ_i γ_i (s_i p) = (Σ_i γ_i s_i)p, ist das D((Σγ_i s_i)p)·ℬ(T^{−1}v) = 0. T^{−1}v ≠ 0, also nach Schritt 4 Σ_i γ_i s_i = 0. Die Spalten von S sind linear unabhängig, also γ = 0.
- *Zusatz, Zeile 235.* Λ ≠ 0 und K unendlich, also gibt es nach K-1 (a) (s_0, p) mit Λ(s_0, p) ≠ 0. Wegen r ≥ 1 ist α_1(s_0 p) ≠ 0, also s_0 ≠ 0 und p ≠ 0. Ein Vektor ≠ 0 lässt sich zu einer Basis ergänzen, also gibt es invertierbare S mit erster Spalte s_0 und T mit erster Zeile p. Nach Schritt 5 ist (S, T) ∈ 𝒢*.
- *Bemerkung, Zeile 237.* Richtig: In Schritt 5 gehen nur s_0 und p in die Bedingung ein. s_1, s_2 kommen nur über die Invertierbarkeit von S hinein, die zweite Zeile von T nur über T^{−1}, das in Schritt 4 durch „für alle v ≠ 0“ abgedeckt ist.

**Rechnung.** Anhang A, `check_K11`, `sn_check_direct`, `check_K11_bad`. Für Verfahren mit m = 1 (r = 8) über ℚ und GF(101) und m = 2 (r = 14) über ℚ:
- Ich habe die Menge 𝒮 aller Träger von Vektoren ≠ 0 in im ℬ vollständig aufgezählt und geprüft, dass jeder Träger mindestens drei Elemente hat (Folge von Schritt 3).
- Für zufällige (s_0, p) habe ich das Kriterium des Beweises (alle Faktoren von Λ ≠ 0) ausgewertet und unabhängig davon (SN1) und (SN2) für V^{(S,T)} geprüft, mit einem anderen Weg: (SN2) scheitert genau dann, wenn es y ≠ 0 in K³ und v ≠ 0 mit D′(Σ y_i e_{i0})·ℬ′(v) = 0 gibt. Dafür habe ich alle Teilmengen Z ⊆ {1, …, r} als mögliche Nullstellenmenge des y-Teils durchlaufen und mit Rängen geprüft, ob y und v existieren. Diese Prüfung ist reine lineare Algebra und gilt deshalb auch über dem algebraischen Abschluss. In allen 34 Fällen mit Λ(s_0, p) ≠ 0 waren (SN1) und (SN2) erfüllt.
- Gegenprobe: Für den Standardalgorithmus mit m = 1 und p = (0, 1) verschwindet ein Faktor q_Σ, und die unabhängige Prüfung findet tatsächlich ein Scheitern von (SN2). Für ein allgemeines (s_0, p) besteht sie.

**Ungenauigkeiten im Wortlaut.**
- Schritt 3 sagt „ein 3×3-Minor“; gemeint ist: man wählt drei Zeilen so, dass die Determinante an p_Σ nicht verschwindet. Das ist nicht falsch, nur knapp.
- Schritt 5 benutzt die Darstellung ℬ′(v) = ℬ(T^{−1}v) aus 1.3, nicht aus K-10. Das ist eine Definition und braucht keinen Eintrag in der Liste.

**Urteil K-11: bestätigt.**

### K-12 (Skalierung; Eigenschaften einer Normalform), Zeilen 239 bis 245

**Wortlaut und Voraussetzungen.** V Verfahren über K, (S, T) ∈ 𝒢*. Voraussetzungen: K-10. Benutzt werden K-10 (V^{(S,T)} ist ein Verfahren, Koeffizientenmatrix Sᵀα_tTᵀ) und die Definitionen von 𝒢* und der Normalform in 1.3. Das stimmt.

**Nachrechnung, Zeile 245.**
1. c_t := α′_t(e_{00}) ist ≠ 0, weil (S, T) ∈ 𝒢* und damit V^{(S,T)} (SN1) erfüllt.
2. Σ_t (α′_t/c_t)(A)·β′_t(B)·(c_tC′_t) = Σ_t α′_t(A)β′_t(B)C′_t = AB nach K-10. V̂ ist ein Verfahren der Länge r.
3. α̂_t(e_{00}) = c_t/c_t = 1, also (SN1) für V̂ und D̂(e_{00}) = I.
4. D̂(A) = diag(α′_t(A)/c_t) = D′(e_{00})^{−1}D′(A), ℬ̂ = ℬ′. Also f̂_i = D̂(e_{i0})ℬ̂ = D′(e_{00})^{−1}f′_i.
5. Sind f̂_0(x), f̂_1(x), f̂_2(x) linear abhängig, dann nach Multiplikation mit der invertierbaren Matrix D′(e_{00}) auch f′_0(x), f′_1(x), f′_2(x). Also (SN2) für V̂.
6. Die Koeffizientenmatrix von α̂_t ist (1/c_t)·Sᵀα_tTᵀ (K-10), ein Vielfaches ≠ 0 von Sᵀα_tTᵀ, also gleicher Rang wie α_t.
7. f_0 = D̂(e_{00})ℬ̂ = ℬ̂. D̂(e_{i0}) = diag((α̂_t(e_{i0}))_t) = diag(a_i), also f̂_i(x) = a_i·f̂_0(x) komponentenweise.

**Rechnung.** Anhang A, `check_K7_K10_K12`: Wo (SN1) für den zufälligen Basiswechsel galt, habe ich V̂ gebildet. Über ℚ, GF(2), GF(3): V̂ erfüllt die Brent-Gleichungen, α̂_t(e_{00}) = 1, Rang von α̂_t gleich Rang von α_t, f̂_i(x) = a_i·f̂_0(x) für zufällige x. Keine Abweichung.

**Ungenauigkeit im Wortlaut.** „mit a_i aus 1.4“: 1.4 definiert a_i für eine Normalform mit m = 7, r = 34. K-12 gilt für beliebige r, m. Gemeint ist offensichtlich a_i := (α̂_t(e_{i0}))_t ∈ K^r. Lesbar.

**Urteil K-12: bestätigt.**

---

## 3. Liste der Glieder (Abschnitt 11) für K-1 bis K-12

Für jedes der Glieder K-1 bis K-12 stimmt die Spalte „benutzt“ mit der Zeile „Voraussetzungen“ überein: K-4 benutzt K-1, K-6 benutzt K-2, K-11 benutzt K-1, K-7, K-10, K-12 benutzt K-10, die übrigen keine Glieder (bei K-7 steht in der Zeile „Nur (Z)“, in der Tabelle „–“, das passt). Jedes dieser Glieder benutzt nur Glieder mit kleinerer Nummer. Innerhalb meines Blocks stimmt auch die Spalte „benutzt von“ (K-1 von K-4 und K-11, K-2 von K-6, K-7 von K-11, K-10 von K-11 und K-12). Die übrigen Einträge in „benutzt von“ betreffen Glieder außerhalb meines Blocks; die habe ich nicht gelesen und nicht geprüft.

Kein Glied in K-1 bis K-12 benutzt einen Begriff, der in den Zeilen 12 bis 108 oder im Glied selbst nicht definiert ist. Kein Glied benutzt eine Aussage, die nicht in seiner Liste steht oder als Grundtatsache der linearen Algebra durchgeht.

---

## 4. Zusammenfassung

| Glied | Urteil | Kleine Ungenauigkeiten im Wortlaut | Echte Lücken |
|---|---|---|---|
| K-1 | bestätigt | (c): Topologie von U_i nicht gesagt; Offenheit des Durchschnitts ohne Begründung | keine |
| K-2 | bestätigt | Π doppelt belegt; χ_ξ nicht eindeutig (unschädlich) | keine |
| K-3 | bestätigt | – | keine |
| K-4 | bestätigt | λ doppelt belegt in (c); Berufung auf K-1 (a) in (a) unnötig | keine |
| K-5 | bestätigt | Formulierung „die übrigen Elemente“; letzter Abzug nicht ausgeschrieben | keine |
| K-6 | bestätigt | Schritt „a_1, a_2 abgeschlossen ⇒ f·M ⊆ M für alle f“ nicht ausgeschrieben; Verweis auf 1.4 bei allgemeinem r | keine |
| K-7 | bestätigt | – | keine |
| K-8 | bestätigt | „Proportionalität“ nicht definiert und nicht eigens begründet | keine |
| K-9 | bestätigt | Rahmen im Wortlaut nicht genannt | keine |
| K-10 | bestätigt | „gleiche Spaltenräume … dieselben“ knapp formuliert | keine |
| K-11 | bestätigt | Schritt 3 „ein 3×3-Minor“ knapp | keine |
| K-12 | bestätigt | a_i „aus 1.4“ bei allgemeinem r, m | keine |

Gegenbeispiele habe ich in den geprüften Randfällen (Charakteristik 2 und 3, Körper mit 4, 5, 7, 8 Elementen, einelementige Mengen Π, leere Mengen X, Nullmodul, Nullformen in K-9) nicht gefunden.

---

## Anhang A: Prüfprogramm (Python 3, exakte Arithmetik)

Aufruf: `python3 -I pruef_k1_k12.py`. Keine fremden Bibliotheken.

```python
# S5-09: exact-arithmetic checks for links K-1 .. K-12 (no floating point).
# Fields: Q (fractions.Fraction), GF(p) for small primes, GF(4), GF(8).
import itertools, random
from fractions import Fraction

random.seed(20261126)

# ---------------------------------------------------------------- fields
class PrimeField:
    def __init__(self, p): self.p = p; self.name = "GF(%d)" % p
    def elems(self): return list(range(self.p))
    def add(self, a, b): return (a + b) % self.p
    def sub(self, a, b): return (a - b) % self.p
    def mul(self, a, b): return (a * b) % self.p
    def neg(self, a): return (-a) % self.p
    def inv(self, a): return pow(a, self.p - 2, self.p)
    def zero(self): return 0
    def one(self): return 1
    def iszero(self, a): return a % self.p == 0
    def rand(self): return random.randrange(self.p)

class BinField:  # GF(2^k) with modulus poly
    def __init__(self, k, mod):
        self.k, self.mod, self.q = k, mod, 1 << k; self.name = "GF(%d)" % self.q
    def elems(self): return list(range(self.q))
    def add(self, a, b): return a ^ b
    sub = add
    def neg(self, a): return a
    def mul(self, a, b):
        r = 0
        while b:
            if b & 1: r ^= a
            b >>= 1; a <<= 1
            if a & self.q: a ^= self.mod
        return r
    def inv(self, a):
        for b in range(1, self.q):
            if self.mul(a, b) == 1: return b
        raise ZeroDivisionError
    def zero(self): return 0
    def one(self): return 1
    def iszero(self, a): return a == 0
    def rand(self): return random.randrange(self.q)

class Rationals:
    name = "Q"
    def add(self, a, b): return a + b
    def sub(self, a, b): return a - b
    def mul(self, a, b): return a * b
    def neg(self, a): return -a
    def inv(self, a): return 1 / Fraction(a)
    def zero(self): return Fraction(0)
    def one(self): return Fraction(1)
    def iszero(self, a): return a == 0
    def rand(self): return Fraction(random.randint(-9, 9))

QQ = Rationals()

def rank(F, M):
    M = [list(r) for r in M]
    if not M: return 0
    rows, cols, rk = len(M), len(M[0]), 0
    for c in range(cols):
        piv = next((i for i in range(rk, rows) if not F.iszero(M[i][c])), None)
        if piv is None: continue
        M[rk], M[piv] = M[piv], M[rk]
        iv = F.inv(M[rk][c])
        M[rk] = [F.mul(iv, x) for x in M[rk]]
        for i in range(rows):
            if i != rk and not F.iszero(M[i][c]):
                f = M[i][c]
                M[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(M[i], M[rk])]
        rk += 1
    return rk

def matmul(F, A, B):
    return [[ _dot(F, A[i], [B[k][j] for k in range(len(B))]) for j in range(len(B[0]))] for i in range(len(A))]
def _dot(F, u, v):
    s = F.zero()
    for a, b in zip(u, v): s = F.add(s, F.mul(a, b))
    return s
def transpose(M): return [list(r) for r in zip(*M)]
def det3(F, M):
    a = M
    t1 = F.mul(a[0][0], F.sub(F.mul(a[1][1], a[2][2]), F.mul(a[1][2], a[2][1])))
    t2 = F.mul(a[0][1], F.sub(F.mul(a[1][0], a[2][2]), F.mul(a[1][2], a[2][0])))
    t3 = F.mul(a[0][2], F.sub(F.mul(a[1][0], a[2][1]), F.mul(a[1][1], a[2][0])))
    return F.add(F.sub(t1, t2), t3)
def inverse(F, M):
    n = len(M)
    A = [list(M[i]) + [F.one() if i == j else F.zero() for j in range(n)] for i in range(n)]
    for c in range(n):
        piv = next(i for i in range(c, n) if not F.iszero(A[i][c]))
        A[c], A[piv] = A[piv], A[c]
        iv = F.inv(A[c][c]); A[c] = [F.mul(iv, x) for x in A[c]]
        for i in range(n):
            if i != c and not F.iszero(A[i][c]):
                f = A[i][c]; A[i] = [F.sub(x, F.mul(f, y)) for x, y in zip(A[i], A[c])]
    return [r[n:] for r in A]
def rand_invertible(F, n):
    while True:
        M = [[F.rand() for _ in range(n)] for _ in range(n)]
        if rank(F, M) == n: return M

report = []
def ok(name, cond):
    report.append((name, cond)); print(("OK   " if cond else "FAIL ") + name)

# ---------------------------------------------------------------- polynomials in 2 vars (P_d)
def monos(d): return [(i, j) for s in range(d + 1) for i in range(s + 1) for j in [s - i]]
def ev(F, coeffs, mons, pt):
    s = F.zero()
    for c, (i, j) in zip(coeffs, mons):
        s = F.add(s, F.mul(c, F.mul(fpow(F, pt[0], i), fpow(F, pt[1], j))))
    return s
def fpow(F, a, e):
    r = F.one()
    for _ in range(e): r = F.mul(r, a)
    return r

# ---------------------------------------------------------------- K-2 interpolation
def check_K2(F, trials=200):
    pts = [(a, b) for a in F.elems() for b in F.elems()]
    good = True
    for _ in range(trials):
        Pi = random.sample(pts, random.randint(1, min(len(pts), 6)))
        for xi in Pi:
            # chi_xi as a function, built exactly as in the proof
            def chi(pt, xi=xi, Pi=Pi):
                num, den = F.one(), F.one()
                for xp in Pi:
                    if xp == xi: continue
                    i = 0 if xi[0] != xp[0] else 1
                    num = F.mul(num, F.sub(pt[i], xp[i])); den = F.mul(den, F.sub(xi[i], xp[i]))
                return F.mul(num, F.inv(den))
            for xp in Pi:
                want = F.one() if xp == xi else F.zero()
                if chi(xp) != want: good = False
    ok("K-2 interpolation over %s" % F.name, good)

# ---------------------------------------------------------------- K-3 Koszul degree 2
def check_K3(F):
    m2 = [e for e in itertools.product(range(3), repeat=3) if sum(e) == 2]
    m3 = [e for e in itertools.product(range(3 + 1), repeat=3) if sum(e) == 3]
    m1 = [e for e in itertools.product(range(2), repeat=3) if sum(e) == 1]
    idx3 = {e: k for k, e in enumerate(m3)}
    unit = [(1, 0, 0), (0, 1, 0), (0, 0, 1)]
    add = lambda a, b: tuple(x + y for x, y in zip(a, b))
    # map S2^3 -> S3 : (Phi_i) -> sum X_i Phi_i ; matrix 10 x 18
    cols = []
    for i in range(3):
        for e in m2:
            v = [F.zero()] * len(m3); v[idx3[add(e, unit[i])]] = F.one(); cols.append(v)
    Mmul = transpose(cols)
    rk_mul = rank(F, Mmul)
    dimR = 18 - rk_mul
    # delta_K : S1^3 -> S2^3 ; image vectors in coordinates of S2^3 (18)
    idx2 = {e: k for k, e in enumerate(m2)}
    def vec_S2_3(comp):  # comp: list of 3 dicts mono->coef
        v = [F.zero()] * 18
        for i in range(3):
            for e, c in comp[i].items(): v[6 * i + idx2[e]] = F.add(v[6 * i + idx2[e]], c)
        return v
    one, mone = F.one(), F.neg(F.one())
    imgs = []
    for which in range(3):  # Psi01, Psi02, Psi12
        for e in m1:
            comp = [dict(), dict(), dict()]
            def put(i, mono, c):
                comp[i][mono] = F.add(comp[i].get(mono, F.zero()), c)
            if which == 0:   # Psi01: + Psi01 X1 in comp0, - Psi01 X0 in comp1
                put(0, add(e, unit[1]), one); put(1, add(e, unit[0]), mone)
            if which == 1:   # Psi02: + X2 in comp0, - X0 in comp2
                put(0, add(e, unit[2]), one); put(2, add(e, unit[0]), mone)
            if which == 2:   # Psi12: + X2 in comp1, - X1 in comp2
                put(1, add(e, unit[2]), one); put(2, add(e, unit[1]), mone)
            imgs.append(vec_S2_3(comp))
    rk_delta = rank(F, imgs)
    # image inside R: Mmul * img = 0
    inside = all(all(F.iszero(x) for x in [ _dot(F, row, v) for row in Mmul]) for v in imgs)
    ok("K-3 over %s: rank(mult)=10, dim R=8, rank delta=8, im delta in R" % F.name,
       rk_mul == 10 and dimR == 8 and rk_delta == 8 and inside)

# ---------------------------------------------------------------- K-4 lines and conics (finite fields, |K|>=3)
def lines(F):
    E = F.elems(); res = []
    seen = set()
    for l1 in E:
        for l2 in E:
            if F.iszero(l1) and F.iszero(l2): continue
            for l0 in E:
                pts = frozenset((x, y) for x in E for y in E
                                if F.iszero(F.add(F.add(F.mul(l1, x), F.mul(l2, y)), l0)))
                if pts not in seen: seen.add(pts); res.append(((l0, l1, l2), pts))
    return res
M2 = monos(2)  # (i,j): a1^i a2^j ; order: 1, a2, a1, a2^2, a1a2, a1^2 (by construction)
def check_K4(F):
    E = F.elems(); L = lines(F)
    allpts = [(x, y) for x in E for y in E]
    # (a): every g in P_2 vanishing at 3 distinct points of a line vanishes on the line and lies in lambda*P_1
    good_a = True
    gs = list(itertools.product(E, repeat=6)) if len(E) <= 5 else [tuple(F.rand() for _ in range(6)) for _ in range(5000)]
    M1 = monos(1)
    for (lam, pts) in L:
        pl = sorted(pts)
        # lambda*P_1 as span of coefficient vectors in M2 basis
        l0, l1, l2 = lam
        lamc = {(0, 0): l0, (1, 0): l1, (0, 1): l2}
        span = []
        for (a, b) in M1:
            v = [F.zero()] * 6
            for (i, j), c in lamc.items():
                k = M2.index((i + a, j + b)); v[k] = F.add(v[k], c)
            span.append(v)
        rspan = rank(F, span)
        for g in gs:
            z = [p for p in pl if F.iszero(ev(F, g, M2, p))]
            if len(z) >= 3:
                if len(z) != len(pl): good_a = False
                if rank(F, span + [list(g)]) != rspan: good_a = False
    ok("K-4 (a) over %s (%s g)" % (F.name, "all" if len(E) <= 5 else "random"), good_a)
    # (b): g deg 2 with irreducible homogenisation has <=2 zeros on each line
    # homogenisation coefficients: X0^2 g(X1/X0, X2/X0) ; form deg 2 in X0,X1,X2 ; reducible iff product of two linear forms
    if len(E) <= 7:
        lin = list(itertools.product(E, repeat=3))
        def prod_form(u, v):  # u,v linear forms in X0,X1,X2 -> dict mono->coef
            d = {}
            for i in range(3):
                for j in range(3):
                    e = [0, 0, 0]; e[i] += 1; e[j] += 1; e = tuple(e)
                    d[e] = F.add(d.get(e, F.zero()), F.mul(u[i], v[j]))
            return d
        def key(d): return tuple(sorted((e, c) for e, c in d.items() if not F.iszero(c)))
        reducible = set()
        for u in lin:
            if all(F.iszero(x) for x in u): continue
            for v in lin:
                if all(F.iszero(x) for x in v): continue
                reducible.add(key(prod_form(u, v)))
        good_b = True; nirr = 0
        for g in itertools.product(E, repeat=6) if len(E) <= 5 else (tuple(F.rand() for _ in range(6)) for _ in range(5000)):
            # degree exactly 2
            if all(F.iszero(g[M2.index(m)]) for m in [(2, 0), (1, 1), (0, 2)]): continue
            hom = {}
            for c, (i, j) in zip(g, M2):
                if not F.iszero(c): hom[(2 - i - j, i, j)] = c
            if key(hom) in reducible: continue
            nirr += 1
            for (lam, pts) in L:
                if sum(1 for p in pts if F.iszero(ev(F, g, M2, p))) >= 3: good_b = False
        ok("K-4 (b) over %s (%d irreducible g checked)" % (F.name, nirr), good_b)
    # (c): five distinct points, no three collinear -> dim of conics through them <= 1
    collinear = lambda a, b, c: any(a in pts and b in pts and c in pts for (_, pts) in L)
    good_c, n5 = True, 0
    cand = list(itertools.combinations(allpts, 5))
    random.shuffle(cand)
    for five in cand[:6000]:
        if any(collinear(*t) for t in itertools.combinations(five, 3)): continue
        n5 += 1
        Mev = [[ev(F, [F.one() if k == kk else F.zero() for kk in range(6)], M2, p) for k in range(6)] for p in five]
        if 6 - rank(F, Mev) > 1: good_c = False
    ok("K-4 (c) over %s (%d five-point sets in general position)" % (F.name, n5), good_c and n5 > 0)

def check_K4c_Q(trials=300):
    good = True; n = 0
    for _ in range(trials):
        five = list({(Fraction(random.randint(-6, 6)), Fraction(random.randint(-6, 6))) for _ in range(5)})
        if len(five) < 5: continue
        def col(a, b, c): return (b[0]-a[0])*(c[1]-a[1]) - (b[1]-a[1])*(c[0]-a[0]) == 0
        if any(col(*t) for t in itertools.combinations(five, 3)): continue
        n += 1
        Mev = [[ev(QQ, [Fraction(int(k == kk)) for kk in range(6)], M2, p) for k in range(6)] for p in five]
        if 6 - rank(QQ, Mev) != 1: good = False
    ok("K-4 (c) over Q, %d random sets: dim exactly 1" % n, good and n > 0)

# ---------------------------------------------------------------- K-5
def check_K5(F, dmax=3):
    E = F.elems(); good = True
    P1 = [(x, F.one()) for x in E] + [(F.one(), F.zero())]
    for d in range(dmax + 1):
        for q in itertools.product(E, repeat=d + 1):
            if all(F.iszero(c) for c in q): continue
            def Q(p): return _dot(F, q, [F.mul(fpow(F, p[0], i), fpow(F, p[1], d - i)) for i in range(d + 1)])
            zeros = sum(1 for p in P1 if F.iszero(Q(p)))
            if zeros > d + 1: good = False
            # class invariance
            for p in P1:
                for lam in E[1:]:
                    if F.iszero(Q(p)) != F.iszero(Q((F.mul(lam, p[0]), F.mul(lam, p[1])))): good = False
    ok("K-5 over %s, all Q of degree <= %d: at most d+1 zeros on P^1, class invariance" % (F.name, dmax), good)

# ---------------------------------------------------------------- K-6
def check_K6(F, trials=150):
    good = True
    for _ in range(trials):
        r = random.randint(1, 9)
        pool = [(F.rand(), F.rand()) for _ in range(random.randint(1, 4))]
        xi = [random.choice(pool) for _ in range(r)]
        Pi = sorted(set(xi))
        T = {z: [t for t in range(r) if xi[t] == z] for z in Pi}
        act = lambda fval, v: [F.mul(fval(xi[t]), v[t]) for t in range(r)]
        a1 = lambda pt: pt[0]; a2 = lambda pt: pt[1]
        # module generated by random vectors: close under a1, a2
        gens = [[F.rand() for _ in range(r)] for _ in range(random.randint(0, 3))]
        basis = []
        queue = list(gens)
        while queue:
            v = queue.pop()
            if rank(F, basis + [v]) > rank(F, basis):
                basis.append(v); queue.append(act(a1, v)); queue.append(act(a2, v))
        dimM = rank(F, basis) if basis else 0
        def chi(z):
            return lambda pt: F.one() if pt == z else F.zero()   # values on Pi, as K-2 guarantees
        # (ii) sum of dims of chi_z M equals dim M and chi_z M subset of M
        tot = 0
        for z in Pi:
            Mz = [act(chi(z), v) for v in basis]
            rz = rank(F, Mz) if Mz else 0
            tot += rz
            if basis and rank(F, basis + Mz) != dimM: good = False
            # M ∩ K^{T_z} equals chi_z M : dim check via restriction
        if tot != dimM: good = False
        # (iii) X union of fibres: dim M|_X = sum over fibres in X
        Xf = [z for z in Pi if random.random() < 0.5]
        X = sorted(t for z in Xf for t in T[z])
        restr = [[v[t] for t in X] for v in basis]
        dX = rank(F, restr) if (restr and X) else 0
        sX = sum((rank(F, [act(chi(z), v) for v in basis]) if basis else 0) for z in Xf)
        if dX != sX: good = False
        # (iv) chi_z (A v) = K chi_z v  : A v spanned by monomials a1^i a2^j v, i+j<=len(Pi)
        v = [F.rand() for _ in range(r)]
        Av = [act(lambda pt, i=i, j=j: F.mul(fpow(F, pt[0], i), fpow(F, pt[1], j)), v) for i in range(5) for j in range(5)]
        for z in Pi:
            img = [act(chi(z), w) for w in Av]
            cz = act(chi(z), v)
            rimg = rank(F, img); rc = rank(F, [cz])
            if rimg != rc or rank(F, img + [cz]) != rimg: good = False
    ok("K-6 (ii),(iii),(iv) random modules over %s" % F.name, good)

# ---------------------------------------------------------------- Verfahren for <3,2,m>
# alpha: 3x2 coefficient matrix, beta: 2xm coefficient matrix, C: 3xm
def E(F, n, k, i, j):
    return [[F.one() if (a, b) == (i, j) else F.zero() for b in range(k)] for a in range(n)]
def lf(F, coef, X):  # linear form with coefficient matrix coef applied to X
    return _dot(F, [x for r in coef for x in r], [x for r in X for x in r])
def standard(F, m):
    V = []
    for i in range(3):
        for j in range(2):
            for l in range(m):
                V.append((E(F, 3, 2, i, j), E(F, 2, m, j, l), E(F, 3, m, i, l)))
    return V
def add_cancelling(F, V, m, k=2):
    V = list(V)
    for _ in range(k):
        a = [[F.rand() for _ in range(2)] for _ in range(3)]
        while all(F.iszero(x) for r in a for x in r): a = [[F.rand() for _ in range(2)] for _ in range(3)]
        b = [[F.rand() for _ in range(m)] for _ in range(2)]
        C = [[F.rand() for _ in range(m)] for _ in range(3)]
        V.append((a, b, C)); V.append((a, b, [[F.neg(x) for x in r] for r in C]))
    return V
def brent_ok(F, V, m):
    for i in range(3):
        for j in range(2):
            for k in range(2):
                for l in range(m):
                    S = [[F.zero()] * m for _ in range(3)]
                    for (a, b, C) in V:
                        c = F.mul(a[i][j], b[k][l])
                        if F.iszero(c): continue
                        S = [[F.add(S[x][y], F.mul(c, C[x][y])) for y in range(m)] for x in range(3)]
                    want = E(F, 3, m, i, l) if j == k else [[F.zero()] * m for _ in range(3)]
                    if S != want: return False
    return True
def basechange(F, V, S, T, m):
    Si, Ti = inverse(F, S), inverse(F, T)
    W = []
    for (a, b, C) in V:
        # alpha'(A) = alpha(S A T): coefficient matrix computed by evaluating on basis (independent of the K-10 formula)
        a2 = [[lf(F, a, matmul(F, matmul(F, S, E(F, 3, 2, i, j)), T)) for j in range(2)] for i in range(3)]
        # beta'(B) = beta(T^{-1} B): coefficient matrix by evaluation on basis
        b2 = [[lf(F, b, matmul(F, Ti, E(F, 2, m, k, l))) for l in range(m)] for k in range(2)]
        C2 = matmul(F, Si, C)
        W.append((a2, b2, C2))
    return W

def check_K7_K10_K12(F, m, trials=5):
    good7 = good10 = good12 = True
    for _ in range(trials):
        V = add_cancelling(F, standard(F, m), m)
        S0, T0 = rand_invertible(F, 3), rand_invertible(F, 2)
        V = basechange(F, V, S0, T0, m)     # a "generic looking" Verfahren
        r = len(V)
        if not brent_ok(F, V, m): good10 = False
        # K-7 (T1): Bmat r x 2m has rank 2m ; (T2): W surjective ; (T3) dim K' = r-3m
        Bmat = [[b[k][l] for k in range(2) for l in range(m)] for (a, b, C) in V]
        Wmat = [[C[i][l] for i in range(3) for l in range(m)] for (a, b, C) in V]  # rows: C_t
        if rank(F, Bmat) != 2 * m: good7 = False
        if rank(F, Wmat) != 3 * m: good7 = False
        if r - rank(F, Wmat) != r - 3 * m: good7 = False
        # (T5)/(D2): W(f_i(x)) = e_{i0} x for random x
        x = [[F.rand() for _ in range(m)] for _ in range(2)]
        for i in range(3):
            fi = [F.mul(a[i][0], lf(F, b, x)) for (a, b, C) in V]
            Wfi = [[_dot(F, fi, [C[p][q] for (a, b, C) in V]) for q in range(m)] for p in range(3)]
            want = [[x[0][q] if p == i else F.zero() for q in range(m)] for p in range(3)]
            if Wfi != want: good7 = False
        # K-10: base change; coefficient matrix S^T alpha T^T ; alpha'(e_i0) = s_i^T alpha p^T
        S, T = rand_invertible(F, 3), rand_invertible(F, 2)
        V2 = basechange(F, V, S, T, m)
        if not brent_ok(F, V2, m): good10 = False
        St, Tt = transpose(S), transpose(T)
        for (a, b, C), (a2, b2, C2) in zip(V, V2):
            if matmul(F, matmul(F, St, a), Tt) != a2: good10 = False
            if rank(F, a) != rank(F, a2): good10 = False
            p, pp = T[0], T[1]
            for i in range(3):
                si = [S[k][i] for k in range(3)]
                if a2[i][0] != _dot(F, si, [ _dot(F, a[k], p) for k in range(3)]): good10 = False
                if a2[i][1] != _dot(F, si, [ _dot(F, a[k], pp) for k in range(3)]): good10 = False
        # K-12: scaling when SN1 holds
        cs = [a2[0][0] for (a2, b2, C2) in V2]
        if any(F.iszero(c) for c in cs): continue
        Vh = [([[F.mul(F.inv(c), x) for x in row] for row in a2], b2, [[F.mul(c, x) for x in row] for row in C2])
              for c, (a2, b2, C2) in zip(cs, V2)]
        if not brent_ok(F, Vh, m): good12 = False
        if any(ah[0][0] != F.one() for (ah, _, _) in Vh): good12 = False
        for (ah, _, _), (a, _, _) in zip(Vh, V):
            if rank(F, ah) != rank(F, a): good12 = False
        x = [[F.rand() for _ in range(m)] for _ in range(2)]
        f0 = [lf(F, b, x) for (_, b, _) in Vh]
        for i in range(3):
            fi = [F.mul(ah[i][0], lf(F, b, x)) for (ah, b, _) in Vh]
            ai = [ah[i][0] for (ah, _, _) in Vh]
            if fi != [F.mul(u, v) for u, v in zip(ai, f0)]: good12 = False
    ok("K-7 (T1)-(T3),(T5) over %s, m=%d" % (F.name, m), good7)
    ok("K-10 base change, coefficient matrix, alpha'(e_i0), alpha'(e_i1) over %s, m=%d" % (F.name, m), good10)
    ok("K-12 scaling: Verfahren, alpha^(e00)=1, rank, f_i = a_i f_0 over %s, m=%d" % (F.name, m), good12)

# ---------------------------------------------------------------- K-11
def supports_of_subspace(F, Bmat):
    """All supports of nonzero vectors in the column space of Bmat (r x k), over an infinite extension.
    A set Z of zero coordinates is realisable with support exactly complement(Z) iff the subspace
    {v in im : v_t = 0, t in Z} is nonzero and no further coordinate vanishes identically on it."""
    r = len(Bmat); k = len(Bmat[0]); res = set()
    for mask in range(1 << r):
        Z = [t for t in range(r) if mask >> t & 1]
        rows = [Bmat[t] for t in Z]
        rz = rank(F, rows) if rows else 0
        if rz == k: continue           # only the zero vector
        sup = []
        for t in range(r):
            if t in Z: continue
            if rank(F, rows + [Bmat[t]]) == rz: break   # coordinate t vanishes identically -> not exact
            sup.append(t)
        else:
            res.add(frozenset(sup))
    return res

def M_Sigma(F, V, Sigma, p):
    # rows t in Sigma, entries alpha_t(e_i p) = sum_j alpha_t[i][j] p_j
    return [[_dot(F, V[t][0][i], p) for i in range(3)] for t in sorted(Sigma)]

def sn_check_direct(F, V, S, T, m):
    """Independent SN1/SN2 check for V^(S,T) via the y-side: SN2 fails iff there are y != 0 in K^3 and
    v != 0 with D(y p) B(v) = 0, i.e. some zero-set Z: rank of rows of N(p) on Z < 3 and the rows of B
    outside Z do not have full rank 2m.  Exhaustive over all subsets Z (valid over the algebraic closure)."""
    V2 = basechange(F, V, S, T, m)
    r = len(V2)
    if any(F.iszero(a[0][0]) for (a, _, _) in V2): return False, "SN1"
    Bmat = [[b[k][l] for k in range(2) for l in range(m)] for (_, b, _) in V2]
    Nmat = [[a[i][0] for i in range(3)] for (a, _, _) in V2]   # alpha'_t(e_i0), y-linear coefficients
    for mask in range(1 << r):
        Z = [t for t in range(r) if mask >> t & 1]
        out = [t for t in range(r) if not mask >> t & 1]
        if Z and rank(F, [Nmat[t] for t in Z]) == 3: continue
        if not out or rank(F, [Bmat[t] for t in out]) < 2 * m:
            # there is y != 0 vanishing on Z (rows of Z have rank < 3) and v != 0 with B(v) supported in Z
            return False, "SN2"
    return True, ""

def check_K11(F, m=1, trials=6):
    good = True; detail = []; ncrit = 0
    for trial in range(trials):
        V = add_cancelling(F, standard(F, m), m, k=1)
        V = basechange(F, V, rand_invertible(F, 3), rand_invertible(F, 2), m)
        r = len(V)
        Bmat = [[b[k][l] for k in range(2) for l in range(m)] for (_, b, _) in V]
        Ssets = supports_of_subspace(F, Bmat)
        # Step 2/3: every Sigma in the support family admits p with rank M_Sigma(p) = 3
        for Sg in Ssets:
            if len(Sg) < 3: good = False
        # random (s0,p): criterion of the proof vs. independent direct check
        for _ in range(4):
            s0 = [F.rand() for _ in range(3)]; p = [F.rand() for _ in range(2)]
            lam1 = all(not F.iszero(_dot(F, s0, [_dot(F, V[t][0][i], p) for i in range(3)])) for t in range(r))
            crit = lam1 and all(rank(F, M_Sigma(F, V, Sg, p)) == 3 for Sg in Ssets)
            # complete to invertible S, T
            while True:
                S = [[s0[0], F.rand(), F.rand()], [s0[1], F.rand(), F.rand()], [s0[2], F.rand(), F.rand()]]
                T = [p, [F.rand(), F.rand()]]
                if rank(F, S) == 3 and rank(F, T) == 2: break
                if all(F.iszero(x) for x in s0) or all(F.iszero(x) for x in p): break
            if rank(F, S) < 3 or rank(F, T) < 2: continue
            direct, why = sn_check_direct(F, V, S, T, m)
            ncrit += 1 if crit else 0
            if crit and not direct: good = False; detail.append(("crit true, direct false", why))
            # the proof claims only "crit => SN"; record whether the converse also held
        # deliberately bad p: make some q_Sigma vanish -> SN2 must fail for every s0, S
        Sg = min(Ssets, key=len)
        # choose p with rank M_Sigma(p) < 3 if possible by search over small grid
    ok("K-11 over %s, m=%d: Lambda-criterion implies SN1+SN2 (independent exhaustive check, %d cases with Lambda != 0)" % (F.name, m, ncrit), good and ncrit > 0)
    return detail

def check_K11_bad(F):
    # standard algorithm m=1: supports {(i,j,1): i=0,1,2} for fixed j ; M_Sigma(p) = p_j * I ; p=(0,1) kills Sigma_j=0
    m = 1; V = standard(F, m)
    S = [[F.one(), F.zero(), F.zero()], [F.zero(), F.one(), F.zero()], [F.zero(), F.zero(), F.one()]]
    good_bad = not sn_check_direct(F, V, S, [[F.zero(), F.one()], [F.one(), F.zero()]], m)[0]
    good_good = sn_check_direct(F, V, [[F.one(), F.one(), F.zero()], [F.one(), F.zero(), F.one()], [F.one(), F.zero(), F.zero()]],
                                [[F.one(), F.one()], [F.zero(), F.one()]], m)[0]
    ok("K-11 sanity on standard algorithm over %s: p=(0,1) fails, generic (s0,p) passes" % F.name, good_bad and good_good)

if __name__ == "__main__":
    for F in [PrimeField(2), PrimeField(3), PrimeField(5)]: check_K2(F)
    for F in [QQ, PrimeField(2), PrimeField(3), PrimeField(5)]: check_K3(F)
    F4 = BinField(2, 0b111); F8 = BinField(3, 0b1011)
    for F in [PrimeField(5), PrimeField(7), F4, F8]: check_K4(F)
    check_K4c_Q()
    for F in [PrimeField(2), PrimeField(5)]: check_K5(F)
    for F in [PrimeField(2), PrimeField(5), PrimeField(7)]: check_K6(F)
    for F, m in [(QQ, 1), (QQ, 2), (PrimeField(2), 2), (PrimeField(3), 3)]: check_K7_K10_K12(F, m)
    check_K11(QQ, m=1, trials=4)
    check_K11(PrimeField(101), m=1, trials=4)
    check_K11(QQ, m=2, trials=1)
    check_K11_bad(QQ)
    print("summary:", sum(1 for _, c in report if c), "of", len(report), "checks OK")
```

## Anhang B: Ausgabe des Programms

```
OK   K-2 interpolation over GF(2)
OK   K-2 interpolation over GF(3)
OK   K-2 interpolation over GF(5)
OK   K-3 over Q: rank(mult)=10, dim R=8, rank delta=8, im delta in R
OK   K-3 over GF(2): rank(mult)=10, dim R=8, rank delta=8, im delta in R
OK   K-3 over GF(3): rank(mult)=10, dim R=8, rank delta=8, im delta in R
OK   K-3 over GF(5): rank(mult)=10, dim R=8, rank delta=8, im delta in R
OK   K-4 (a) over GF(5) (all g)
OK   K-4 (b) over GF(5) (13640 irreducible g checked)
OK   K-4 (c) over GF(5) (753 five-point sets in general position)
OK   K-4 (a) over GF(7) (random g)
OK   K-4 (b) over GF(7) (4569 irreducible g checked)
OK   K-4 (c) over GF(7) (1369 five-point sets in general position)
OK   K-4 (a) over GF(4) (all g)
OK   K-4 (b) over GF(4) (3402 irreducible g checked)
OK   K-4 (c) over GF(4) (288 five-point sets in general position)
OK   K-4 (a) over GF(8) (random g)
OK   K-4 (c) over GF(8) (1703 five-point sets in general position)
OK   K-4 (c) over Q, 236 random sets: dim exactly 1
OK   K-5 over GF(2), all Q of degree <= 3: at most d+1 zeros on P^1, class invariance
OK   K-5 over GF(5), all Q of degree <= 3: at most d+1 zeros on P^1, class invariance
OK   K-6 (ii),(iii),(iv) random modules over GF(2)
OK   K-6 (ii),(iii),(iv) random modules over GF(5)
OK   K-6 (ii),(iii),(iv) random modules over GF(7)
OK   K-7 (T1)-(T3),(T5) over Q, m=1
OK   K-10 base change, coefficient matrix, alpha'(e_i0), alpha'(e_i1) over Q, m=1
OK   K-12 scaling: Verfahren, alpha^(e00)=1, rank, f_i = a_i f_0 over Q, m=1
OK   K-7 (T1)-(T3),(T5) over Q, m=2
OK   K-10 base change, coefficient matrix, alpha'(e_i0), alpha'(e_i1) over Q, m=2
OK   K-12 scaling: Verfahren, alpha^(e00)=1, rank, f_i = a_i f_0 over Q, m=2
OK   K-7 (T1)-(T3),(T5) over GF(2), m=2
OK   K-10 base change, coefficient matrix, alpha'(e_i0), alpha'(e_i1) over GF(2), m=2
OK   K-12 scaling: Verfahren, alpha^(e00)=1, rank, f_i = a_i f_0 over GF(2), m=2
OK   K-7 (T1)-(T3),(T5) over GF(3), m=3
OK   K-10 base change, coefficient matrix, alpha'(e_i0), alpha'(e_i1) over GF(3), m=3
OK   K-12 scaling: Verfahren, alpha^(e00)=1, rank, f_i = a_i f_0 over GF(3), m=3
OK   K-11 over Q, m=1: Lambda-criterion implies SN1+SN2 (independent exhaustive check, 15 cases with Lambda != 0)
OK   K-11 over GF(101), m=1: Lambda-criterion implies SN1+SN2 (independent exhaustive check, 15 cases with Lambda != 0)
OK   K-11 over Q, m=2: Lambda-criterion implies SN1+SN2 (independent exhaustive check, 4 cases with Lambda != 0)
OK   K-11 sanity on standard algorithm over Q: p=(0,1) fails, generic (s0,p) passes
summary: 40 of 40 checks OK
```
