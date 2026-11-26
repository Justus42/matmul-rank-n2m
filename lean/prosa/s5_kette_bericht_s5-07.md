# Bericht S5-07: Prüfung der Glieder K-32 bis K-41

Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit d6469d8 (die Datei ist auf `main` zum Zeitpunkt der Prüfung, Commit 8ce8481, unverändert gegenüber d6469d8). Geprüft: K-32 bis K-41 und die „Prüfung der Quantoren“ (Zeilen 550 bis 752). Glieder mit kleinerer Nummer wurden nach ihrem Wortlaut als gegeben genommen.

Rolle: Prüfer. Dieser Bericht setzt keinen Status.

---

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet** (automatisch, nicht angefordert):

1. Der Index des Projektgedächtnisses. Inhalt: Repo-Adresse, Ziel des Projekts (exakter Tensorrang von ⟨n,2,m⟩, Formate 4×2×4, 3×2×7, 4×2×5, Lean für 3×2×6), Protokollversion 0.6, Rechte und Grenzen des Orchestrators, Angaben zu Stufe 4 (Budget, Fremdmodell GPT 6.2 Sol über die Bridge), Regeln für Aufträge an Prüfer und unabhängige Sucher, Literaturwache, Hinweise auf Einträge „verfahren-datenformat“ und „lean-project-ci“. Der Index sagt ausdrücklich, dass dort nichts über Behauptungen, Beweise, Status oder Rundenverlauf steht. Ich habe darin kein Urteil über die geprüfte Kette gefunden.
2. Zwei Einzeleinträge („aussagen-abgleich-n3“: Hinweise zur Bridge und zum lokalen Lean-Bau; „gemini-bridge“: Bridge-Freigabe und Zeitlimit). Kein Urteil über die geprüfte Kette.

**Über die Positivliste hinaus gesehen:**

- Die Überschriftenzeilen aller Abschnitte von `PROTOKOLL.md` (eine Suche nach `^## `, um Abschnitt 5 zu finden). Gelesen habe ich nur Abschnitt 5.
- Ausgaben von `git status` (Kopf losgelöst, Arbeitsbaum sauber), `git rev-parse` (8ce8481), `git cat-file -t d6469d8`, `git fetch origin main` (ohne Ausgabe) und `git diff --quiet d6469d8 HEAD -- lean/prosa/s5_327_kette.md` (Ergebnis: gleich). Kein `git log`, keine Commit-, PR- oder Zweigliste.
- Die Zahl der Einträge in `lean/prosa/` (53), nicht ihre Namen; die Prüfung, dass meine Zieldatei noch nicht existiert.
- Aus den Zeilen 109 bis 549 habe ich per Skript nur die Abschnitte von der Überschrift bis vor „**Beweis**“ der Glieder K-1, K-2, K-4, K-5, K-6, K-8, K-10, K-11, K-12, K-18, K-19, K-21, K-22, K-23, K-24, K-25, K-27, K-28, K-29, K-30, K-31 ausgegeben, also Wortlaut und Voraussetzungszeile. Ein erster Skriptlauf hat die Wortlaute aller Glieder aus 109 bis 549 in eine Zwischendatei geschrieben; ausgegeben wurden davon nur Zeilenzahl und Dateigröße, gelesen habe ich sie nicht.
- Im Kontext dieses Threads standen die Namen einiger Dateien des Projektordners (A-01/LIZENZEN.md, a07/verfahren-README.md, schranken/QUELLEN.md) und der Thread-Titel.

**Spuren früherer Prüfungen** (Protokoll 5.4, nur offengelegt): Die Überschriften „K-32 (Lemma F, berichtigt)“ und „K-37 (… berichtigter Wortlaut von S4-27-C)“ zeigen, dass es frühere Fassungen und Prüfungen gab. Deren Inhalt kenne ich nicht. Der Auftrag sagt, dass andere Prüfer unabhängig an derselben Datei arbeiten. Ein Urteil über diese Glieder habe ich vor meinem eigenen nicht gesehen.

---

## 1. Vorgehen

Jedes Glied wurde Schritt für Schritt von Hand nachvollzogen. Zusätzlich habe ich ein eigenes Python-Programm geschrieben (exakte Arithmetik: `sympy` über ℚ, Gauß-Elimination über F_p mit p = 2³¹ − 1, keine Gleitkommazahlen). Es prüft:

- **K-32:** Für 2944 zufällige Paare von 3×2-Matrizen ≠ 0 (darunter gezielt Vielfache und Paare vom Rang 1 mit gleichem Spaltenraum): Alle drei Minoren von (α·pᵀ | α′·pᵀ) sind genau dann das Nullpolynom, wenn (I) oder (II) gilt, und jeder nicht verschwindende Minor ist homogen vom Grad 2. Ergebnis: ohne Ausnahme.
- **K-33:** Für zufällige ganzzahlige α, S, T: Die Koeffizientenmatrix von α′ aus der Definition α′(A) = α(SAT) ist Sᵀα Tᵀ, die Formeln für a(t), b(t) stimmen, und (c_1, c_2) = 0 gilt genau bei Rang 1. Ergebnis: ohne Ausnahme.
- **K-34 Schritt 1:** Die 238×63-Matrix M_{S,T} wurde für konstruierte Daten aufgestellt (Punkte ξ(t), Vektor w, J = w·P_2 ⊕ weitere Zufallsvektoren, zufälliger Basiswechsel in J). Bei dim w·P_2 = 6 ergab sich rk M = 60, bei dim w·P_2 = 5 (Träger von w auf einem Kegelschnitt) rk M = 59, jeweils dreimal. Das passt zu e + 3 = rk M − 54.
- **K-37:** Die Gleichungen (P′), (Q′), (Q_0′) wurden mit ξ(z) = (0, 0) und einer allgemeinen Richtung ℓ* als lineares System in den Unbekannten 𝔱(Monom), 𝔫(Monom), w(z) (Monome bis Grad 4, β_z symbolisch) aufgestellt und gelöst. Jede Lösung hat w(z) = 0.

Das Programm liegt nicht im Repo (Auftrag: genau eine Datei). Es ist ein Plausibilitätstest. Die Urteile beruhen auf der Prüfung von Hand.

---

## 2. Urteile je Glied

### K-32 (Lemma F, berichtigt): **bestätigt**

Wortlaut, Voraussetzungen und Beweis passen. Die drei Fälle (α Rang 2, α′ Rang 2, beide Rang 1) decken alle Paare von Matrizen ≠ 0 ab. Die Rechnung mit λ(p_1), λ(p_2), λ(p_1 + p_2) ist richtig. Im Rang-1-Fall wird K unendlich gebraucht (K-1 (a), (b)), und das steht in der Liste.

Kleine Ungenauigkeit:
- Z. 556: „genau eine der beiden Aussagen“. Dass (1) und (2) einander ausschließen, sagt der Beweis nicht ausdrücklich. Es folgt sofort: Bei (2) liegt V(α, α′) in der Nullstellenmenge eines Polynoms ≠ 0, die nach K-1 (a) nicht ganz K^{1×2} ist. K-1 (a) steht in der Liste.

### K-33 (a-Punkte unter Basiswechsel): **bestätigt**

Die Formeln für a(t) und b(t) folgen aus K-10 und der Skalierung (1.3). Ich habe sie auch nachgerechnet (Abschnitt 1). (i) bis (v) sind richtig bewiesen. In (iii) ist die Gerade ℒ_t durch S und α_t bestimmt, und der Schluss „gleicher a-Punkt ⇔ p̃ ∈ K·p“ nutzt richtig, dass p ↦ Sᵀα_tpᵀ bei Rang 2 injektiv ist und beide Vektoren die erste Koordinate ≠ 0 haben (SN1 für beide Paare).

Kleine Ungenauigkeiten:
- Z. 573: „Für einen Spaltenvektor a(t) := … gilt“ ist sprachlich schief. Gemeint ist die Definition von a(t), b(t) aus 1.4 für die Normalform zu (S, T).
- In (iii) heißt die lineare Form λ_t. Der Buchstabe λ ist in K-32 (I) und in (iv) schon als Skalar belegt. Verwechslungsgefahr, kein Fehler.

### K-34 (Lemma O): **bestätigt**

Schritt 1: Kern von Ξ ≅ f_0(N) nach K-21 (a), (c), Γ(ker Ξ³) = f_0(N) + a_1·f_0(N) + a_2·f_0(N) = w·P_2 nach K-23 (b) (mit P_2 = P_1 + a_1P_1 + a_2P_1), und e + 3 = rk M_{S,T} − 54 (9 − (63 − rk M)). Mit e ≤ 3 heißt e = 3 genau rk M ≥ 60. Schritt 2: Die Einträge sind rationale Funktionen mit Nenner, der D = det T · Π_t s_0ᵀα_tpᵀ teilt, also gilt 𝒢_3 = 𝒢* ∩ R. Schritt 3: K-1 (c) ist mit X = 𝒢 = {det S · det T ≠ 0} anwendbar, und ein Punkt aus R ∩ R′ liegt nach K-11 in 𝒢* und damit in 𝒢_3 ∩ 𝒢_gen. Die Bezeichnung m_{tt′} ist sinnvoll, weil nach K-18 (c) alle α_t ≠ 0 sind (in der Liste).

Kleine Ungenauigkeiten:
- Z. 602: „Die Einträge von M_{S,T} sind 0, ±1 und …“. Einträge ±1 kommen nicht vor. Die Einträge sind 0, ±q_k(t) und a_i(t)·q_k(t). Das ändert nichts, weil auch Konstanten die Form (Polynom)/D haben.
- 𝒢_gen hängt von der Wahl je eines nicht verschwindenden Minors m_{tt′} ab. Die Wahl muss in K-34, K-35 und K-39 dieselbe sein. Das ist stillschweigend so gemeint (K-39 verweist auf dieselben m_{tt′}). Für K-35 genügt ohnehin jede Wahl.

### K-35 (Satz G in allgemeiner Normalform): **bestätigt**

(GM) folgt in beiden Fällen e = 3 und e = 2 aus K-28/K-29 bzw. K-30/K-31, dazu K-24 und K-25 (d). (G0) folgt aus K-33 (v) und der Wahl von 𝒢_gen. (G1) ist K-33 (i). Die Zählung in Schritt 3 und 4 ist richtig: 13 = Σ_{T_ξ ⊆ Y}(|T_ξ| − d_ξ) ≤ |Y|/2 und 8 = dim Θ(J³_0) ≤ |Ω| geben zusammen mit |Y| + |Ω| = 34 überall Gleichheit. (G4) folgt aus Θ(J³_0) = K^Ω ⊆ 𝒜·w und K-6 (iv). (G5) folgt, weil die Einschränkung w·P_3 → K^Y injektiv ist (w·P_3 ∩ K^Ω ⊆ K′ ∩ K^Ω = 0) und über K^{Π_1} faktorisiert.

Dass α_t ≠ 0 ist (nötig für K-32), folgt schon aus (S, T) ∈ 𝒢*: (SN1) verlangt α_t(s_0p) ≠ 0.

Kleine Ungenauigkeiten:
- Z. 616 nennt „K-25 (d)“. Schritt 4 (Z. 622) benutzt auch K-25 (c) (Θ(j) = c_1·j_1 + c_2·j_2). Das Glied steht in der Liste, der Teil (c) nicht.
- Z. 619: m_{tt′} ist nur für t < t′ erklärt. Für t > t′ ist m_{t′t} gemeint. V(α, α′), (I) und (II) sind symmetrisch, also ohne Folgen.

### K-36 (die Operatoren τ und ν auf Y): **bestätigt**

(a) folgt aus (G0), (G2), (GM) und K-6 (i), (iii). (b): Aus K^{T_ξ} ⊆ M_ξ + b_0·M_ξ und |T_ξ| = 2d_ξ folgen die direkte Summe und die Injektivität von b_0 auf M_ξ. Damit sind τ_ξ, ν_ξ wohldefiniert und linear. (c): Die Rechnung b_0·(τ_ξ(j_ξ) + κ_ξ) ∈ M_ξ ∩ b_0·M_ξ = 0 ist richtig, ebenso die Vertauschbarkeit mit 𝒜.

Kleine Ungenauigkeiten:
- Z. 648: Der Satz ist verdoppelt und unfertig: „Multipliziere K^34 = K″ + b_0·K′ (K-24) mit χ_ξ: K^34 = K″ + b_0·K′ (GM) mit χ_ξ: …“. Gemeint ist eine einzige Multiplikation mit χ_ξ. Der Verweis auf K-24 steht nicht in der Liste (Z. 645). Dieselbe Aussage steht aber in (GM), das in der Liste steht.
- Z. 649: „j ∈ K′“ für j ∈ J wird benutzt, steht aber nicht in der Liste. Es folgt aus K-22 (a_i·j ∈ K′ mit i = 0, a_0 = 1) oder aus K-21 (b). Die Liste nennt K-22 nur „in der Form“ dreier anderer Aussagen.

### K-37 (lokaler Widerspruch): **bestätigt**

Die Fortsetzungsabbildung η ist wohldefiniert. Die drei Gleichungsgruppen (P_i), (Q_0), (Q_i) habe ich einzeln nachgerechnet, einschließlich der Vorzeichen (Q_i entsteht aus b_i = c_i + a_i·b_0 und Einsetzen von (Q_0)). Die Kombination mit ε, das Einsetzen von j = w·G (G ∈ P_2, also w·G ∈ J) und die vier Werte sind richtig: 𝔱(ℓ*²) = 0, 𝔫(ℓ*²) = 0, 𝔱(ℓ*) = 0 und 𝔱(ℓ*) = w(z). Das Programm aus Abschnitt 1 bestätigt, dass das System w(z) = 0 erzwingt. Alle Ausdrücke liegen in K″|_Y, weil dieser Raum unter 𝒜 abgeschlossen ist (K-36 (a)).

Kleine Ungenauigkeit:
- Z. 667: „beide Räume haben Dimension 13 (K-36 (a))“. K-36 (a) gibt nur dim K″|_Y = 13. dim K′ = 13 steht in K-21 (b), das nicht in der Liste steht. Es folgt aber aus der Liste: K″ = K′ ⊕ K^Ω (G3), dim K″ = 21 (GM), |Ω| = 8 (G2).

### K-38 (Ausschluss von e = 3): **bestätigt**

Der Schluss K-34 → (S, T) ∈ 𝒢* ∩ 𝒢_gen → K-35 (G2), (G4) → K-37 ist richtig.

Kleine Ungenauigkeit (Liste):
- Z. 704: K-37 hat einen bedingten Wortlaut („Es gelten die folgenden Voraussetzungen …“). Um K-37 anzuwenden, braucht man K-12, K-22, K-23 (c) und K-36. Die stehen nicht in der Liste von K-38. Der Wortlaut von K-37 sagt selbst, dass seine Voraussetzungen „alle aus den genannten Gliedern folgen“, und diese Glieder liegen alle in der Kette. Ein logisches Loch ist das nicht. Nach der Regel „die Zeile Voraussetzungen nennt alle anderen Glieder, die der Beweis benutzt“ (Z. 18) ist die Liste aber unvollständig.

### K-39 (eine unendliche Familie allgemeiner Normalformen): **bestätigt**

Die Wahl von s_* mit Λ(s_*, ·) ≠ 0 (über einen Koeffizienten c_μ und K-1 (a)) ist richtig. Q ist homogen und ≠ 0 (K-1 (b)), K-5 gibt unendlich viele [p], und „Q(p) ≠ 0“ hängt nur von [p] ab (K-5). Damit ist die Wahl des Vertreters gleichgültig. K-11 gibt (S, T_p) ∈ 𝒢*, die Minoren geben 𝒢_gen. Keine Beanstandung.

### K-40 (jedes Verfahren der Länge 34 hat eine Normalform mit e = 3): **bestätigt**

Der Widerspruchsbeweis ist schlüssig. Schubfach über die Träger Σ_p, Unabhängigkeit der a-Punkte auf Y von p (K-33 (ii)), |Π_1| ≥ 7 (G5), dann K-4 (b), (c): alle g_0^{(p)} sind proportional zu einem festen g*. Danach liegen die Punkte ξ_p(z) für z ∈ Ω auf der festen Geraden ℒ_z (K-33 (iii)). Sie sind paarweise verschieden (K-33 (iii), zweiter Teil, mit p̃ ∉ K·p für [p̃] ≠ [p]), und alle sind Nullstellen von g* (G4 und K-30 (a)). Das widerspricht K-4 (b).

Kleine Ungenauigkeit (Liste):
- Z. 725 nennt K-35 (G4), (G5). Schritt 3 (Z. 730) benutzt auch K-35 (G2) für Ω ≠ ∅.

### K-41 (Endsatz): **bestätigt**

Der Schluss aus den zitierten Gliedern passt nach ihrem Wortlaut genau zusammen. K-38 und K-40 haben dieselbe Voraussetzung („Sei V ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F, aufgefasst über K = F̄“) und reden über dieselbe Menge 𝒢_3(V). Diese hängt nur von V und K ab, nicht von der Wahl der Minoren in 𝒢_gen. Das eine sagt 𝒢_3 = ∅, das andere 𝒢_3 ≠ ∅. Zusammen mit K-18 (b) (Länge ≥ 34) folgt, dass jedes Verfahren über F mindestens die Länge 35 hat. Der Wortlaut „für jeden Körper F“ wird gedeckt, weil F in K-38 und K-40 beliebig ist und nur K = F̄ unendlich sein muss.

Kleine Ungenauigkeit:
- Dass R_F(⟨3,2,7⟩) als Minimum überhaupt existiert, setzt ein Verfahren voraus (etwa das Standardverfahren der Länge 42). Das ist selbstverständlich und wird nicht erwähnt.

### Prüfung der Quantoren (Z. 744 bis 750): **bestätigt, soweit sie meinen Block betrifft**

- Die Punkte zu K-38, K-40 und K-41 geben die Wortlaute richtig wieder (für jedes V; „𝒢_3 = ∅“ bzw. „≠ ∅“; dasselbe V).
- Dass e für jede einzelne Normalform erklärt ist, stützt sich auf K-23 (a). e = dim(w·P_2) − 3 hängt nicht von der Skalierung von w ab. Das ist richtig.
- Zum Körper: In K-32 bis K-41 wird von K nur benutzt, dass er unendlich ist (über K-1, K-4, K-5, K-11). K-32 und K-34 benutzen K-1 und sind in der Aufzählung der Zeile 750 nicht genannt. Das ist eine Lücke nur in der Aufzählung, sachlich ist es abgedeckt. In meinem Block kommt keine Division durch eine ganze Zahl vor. Die Brüche |T_ξ|/2 in K-35 sind Rechnungen mit Dimensionen, nicht im Körper. Die Aussagen über K-3 und K-20 (b) liegen außerhalb meines Blocks und sind nicht geprüft.

---

## 3. Übersicht

| Glied | Urteil | Kleine Ungenauigkeiten (keine Lücken) |
|---|---|---|
| K-32 | bestätigt | Ausschluss von (1) und (2) nicht ausdrücklich begründet (Z. 556) |
| K-33 | bestätigt | Formulierung Z. 573; Buchstabe λ doppelt belegt |
| K-34 | bestätigt | „0, ±1“ in Z. 602; die Wahl von m_{tt′} ist stillschweigend fest |
| K-35 | bestätigt | K-25 (c) fehlt in Z. 616; t < t′ in Z. 619 |
| K-36 | bestätigt | doppelter Satz und K-24 nicht in der Liste (Z. 648); J ⊆ K′ nicht in der Liste (Z. 649) |
| K-37 | bestätigt | dim K′ = 13 falsch zitiert (Z. 667), aus der Liste ableitbar |
| K-38 | bestätigt | Liste Z. 704 ohne K-12, K-22, K-23 (c), K-36 (Voraussetzungen von K-37) |
| K-39 | bestätigt | – |
| K-40 | bestätigt | K-35 (G2) fehlt in Z. 725 |
| K-41 | bestätigt | Existenz des Minimums nicht erwähnt |
| Quantoren | bestätigt (Block) | Z. 750 zählt K-32, K-34 nicht auf |

Echte Lücken (ein Schritt, der nach den zitierten Wortlauten nicht folgt) habe ich in K-32 bis K-41 nicht gefunden.

---

## 4. Hinweis zur Struktur (kein Mangel eines Glieds)

Nach ihrem Wortlaut gelten K-35 und K-37 für **jedes** (S, T) ∈ 𝒢* ∩ 𝒢_gen, ohne Bedingung an e. Der Hinweis in Z. 698 sagt das für K-37 selbst. Für jedes solche (S, T) und jedes z ∈ Ω (Ω ≠ ∅ nach (G2)) gibt K-35 (G4) dann w(z) ≠ 0 und K-37 w(z) = 0. Nach den Wortlauten ist also 𝒢* ∩ 𝒢_gen = ∅, und K-39 widerspricht dem direkt. Der Endsatz folgt damit schon aus K-18, K-35, K-37 und K-39, ohne K-34, K-38 und K-40 und ohne die Fallunterscheidung nach e.

Das ist kein Fehler im Block. Es heißt aber: Das ganze Gewicht der Kette liegt auf den Wortlauten von K-35 und K-37 (und den Gliedern, auf die sie sich stützen). Die Fallunterscheidung über e (K-34, K-38, K-40) ist logisch überzählig. Wer die Kette festigt oder portiert, sollte das wissen. Zugleich sind die Aussagen der früheren Glieder, die K-35 zitiert (K-23 bis K-31), die Stellen, an denen ein Fehler den Endsatz tragen würde. Diese lagen außerhalb meines Auftrags.

---

## 5. Verbrauch

- Subagenten: keine. Fremdmodell-Anfragen: keine.
- Ein Rechenblock: Prüfprogramm (Python, exakt), Laufzeit unter zwei Minuten.
- Zeiten: siehe Git-Zeitstempel des Commits.
