# S5-10: Prüfbericht zu den Gliedern K-13 bis K-20

Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit d6469d8 (gelesen mit `git show d6469d8:lean/prosa/s5_327_kette.md`), Zeilen 249 bis 378 (Abschnitt 4 der Datei). Rolle: Prüfer nach Abschnitt 5 des Protokolls. Dieser Bericht setzt keinen Status.

Zeilenangaben „Z. n“ beziehen sich auf diese Datei in diesem Stand.

---

## 0. Offenlegung

**Aus einem Projektgedächtnis eingeblendet** waren mir zu Beginn der Sitzung:

- der Index `MEMORY.md` des Projektgedächtnisses. Er enthält organisatorische Regeln (Rollen, Bridge zum Fremdmodell, Merge-Praxis, Literaturwache, Vorgaben von Justus zu Prüferaufträgen), das Projektziel „exakter Tensorrang von ⟨n,2,m⟩ (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6)“ und den Hinweis, dass Stufe 4 und 5 sich auf 3×2×7 beziehen. Er enthält nach meiner Lektüre kein Urteil, keinen Status und keinen Zwischenstand zu K-13 bis K-20 oder zur Kette.
- während der Arbeit zwei Einzeleinträge, die die Umgebung automatisch einblendete: `gemini-bridge` (technische Hinweise zur Bridge, Repo dort nicht freigegeben) und `aussagen-abgleich-n3` (Bridge und lokaler Lean-Bau). Auch diese enthalten kein Urteil zu meinem Gegenstand.
- Aus dem Index und dem Auftrag selbst weiß ich, dass die Kette als Ganzes R_F(⟨3,2,7⟩) ≥ 35 zeigen soll (das steht auch in den Lesehinweisen Z. 16 und 18, die auf meiner Positivliste stehen). Was von meinem Urteil abhängt oder welches Urteil erwünscht ist, wusste ich nicht.

**Über die Positivliste hinaus gesehen:**

- Um Abschnitt 5 des Protokolls zu finden, habe ich die Überschriftenzeilen von `PROTOKOLL.md` ausgegeben (Titel der Abschnitte 1 bis 11, keine Inhalte außer Abschnitt 5).
- Die Aussagen der Vorgänger habe ich aus den Zeilen 109 bis 248 mit einem Filter ausgegeben, der je Glied die Zeilen von der Überschrift bis vor „**Beweis.**“ zeigt. Dadurch habe ich auch die Wortlaute von K-1 bis K-6 gesehen (nicht als Voraussetzung meines Blocks genannt), aber keinen Beweis.
- `git status` zeigte „HEAD detached from refs/heads/main“. Ich habe einmal Hash und Zeitstempel von HEAD abgefragt (`git show -s --format='%H %cI' HEAD`, ohne Commit-Nachricht), geprüft, dass d6469d8 Vorfahre von HEAD ist, und dass die Datei auf HEAD mit dem Stand d6469d8 übereinstimmt. Weitere Historie, Commit-, PR- oder Zweiglisten habe ich nicht angesehen.
- Das Programm `erkundung/s3-04-restfaelle-327.py`, das K-19 als Kontrollrechnung nennt (Z. 353), habe ich nicht geöffnet und nicht ausgeführt.
- Keine Datei `s5_kette_bericht_*`, nichts aus `pruefvermerke/`, `behauptungen/`, `STATUS.md`, `LOG.md`, `versuche/`, `archiv/`, `erkundung/`, `palomar/`.

Keine Subagenten, keine Fremdmodell-Anfragen.

---

## 1. Vorgehen

Je Glied: Wortlaut und Quantoren, Liste der Voraussetzungen gegen die im Beweis tatsächlich benutzten Tatsachen, dann jeder Beweisschritt in eigenen Worten mit Zeilenangabe. Die Wortlaute von K-7 bis K-12 (Z. 184 bis 244) habe ich als gegeben genommen, ebenso innerhalb des Blocks die Wortlaute der früheren Glieder, wenn ein späteres sie nennt.

Rechnerische Gegenprobe (Programme im Anhang, Python 3, nur exakte Arithmetik: ganze Zahlen modulo p, `fractions.Fraction` für ℚ, eigene Arithmetik für GF(4)):

1. **Echte Verfahren.** Naives Verfahren (Länge 6m) und ein Verfahren mit Strassen-Blöcken (für m = 2 Länge 11), verändert durch zufällige gültigkeitserhaltende Schritte (Term aufspalten in α, β oder C; Paar (α, β, C), (α, β, −C) hinzufügen), dann zufälliger Basiswechsel (S, T) nach 1.3, bis (SN1) und (SN2) gelten. Die Brent-Gleichungen werden für jedes Verfahren nachgerechnet. Körper GF(2), GF(3), GF(5), GF(7), ℚ; m = 1, 2, 3. Aus den Definitionen in 1.2 werden K′, J, Q, rk L, rk H, N, Δ, Ŝ, ρ, ker Φ berechnet und alle Aussagen von K-13 bis K-17 und K-20 (a) geprüft.
2. **Modelle mit N ≠ 0 und Ŝ ≠ 0.** In echten kleinen Verfahren ist N stets 0 (nach (G) ist N ≠ 0 erst bei r < 5m erzwungen, siehe 3.3). K-13, K-16, K-17 und K-20 benutzen aber nur: die Diagonalmatrizen D(e_{i0}) mit (SN1), ein injektives ℬ, U, J = f_0(U) und Abbildungen nach Q = K′/J, deren Ränge mit denen nach K^r/J übereinstimmen (J ⊆ K′ ⊆ K^r). Ich wähle deshalb a_1, a_2 ∈ K^r (normiert a_0 = 1) mit wenigen a-Punkten (große Fasern, entartete Lagen) und die q-Vektoren als v·P_2 = {v, a_1v, a_2v, a_1²v, a_1a_2v, a_2²v} (eventuell mit Zufallsvektoren ergänzt). Bei m ≥ 6 (ganz v·P_2 unter den q-Vektoren) erzwingt das, dass N das Urbild von v·P_1 enthält und Ŝ das Urbild von v. (SN2) wird exakt geprüft.
3. **Ganzzahlige Fallunterscheidung** für K-18 (a) und K-19: vollständige Aufzählung aller (rk L, rk H, dim Ŝ).

(SN2) wird exakt so geprüft: f_0(x), f_1(x), f_2(x) sind genau dann linear abhängig, wenn es c ≠ 0 in K³ mit (c_0D(e_{00}) + c_1D(e_{10}) + c_2D(e_{20}))ℬ(x) = 0 gibt, also ℬ(x) auf Z_c := {t : c·(α_t(e_{00}), α_t(e_{10}), α_t(e_{20})) = 0} getragen ist. Weil ℬ injektiv ist, gilt (SN2) genau dann, wenn für jedes c die Zeilen von ℬ außerhalb Z_c Rang 2m haben. Die maximalen Z_c sind die „Ebenen“ durch zwei unabhängige Punkte; das Programm prüft alle. Über GF(p) mit p^{2m} ≤ 5000 wurde das zusätzlich durch Durchlaufen aller x ≠ 0 bestätigt.

---

## 2. Rahmen des Abschnitts (Z. 249 bis 251)

Z. 251 legt fest: In K-13 bis K-17 ist V ein Verfahren der Länge r für ⟨3,2,m⟩ über einem **beliebigen** Körper K, m ≥ 1. Das weicht vom Wortlaut von 1.3 ab („Ab Abschnitt 3 ist … K ein algebraischer Abschluss von F“). Für K-13 bis K-17 ist das unschädlich: Die Beweise benutzen keine Eigenschaft eines algebraisch abgeschlossenen Körpers, die schwächere Lesart (beliebiger Körper) ist bewiesen, und der algebraisch abgeschlossene Fall ist darin enthalten. K-18 (a) und K-19 sagen ausdrücklich „über einem Körper“, K-20 sagt ausdrücklich, wo K algebraisch abgeschlossen sein muss. **Kleine Ungenauigkeit im Wortlaut** (Doppelbelegung von K), keine Lücke.

---

## 3. Die Glieder

### 3.1 K-13 (Lemma B), Z. 253 bis 260

**Wortlaut.** Für V mit (SN1), (SN2) und jeden Unterraum X ≠ 0 von K^{2×m}: dim(f_0(X) + f_1(X) + f_2(X)) ≥ dim X + 2. Quantoren eindeutig: V fest, X beliebig, Körper beliebig (Z. 251).

**Voraussetzungen (Z. 258):** (SN1), (SN2), K-7 (T4). Benutzt werden tatsächlich: (SN1) (Invertierbarkeit von D(e_{00})), (SN2) für ein v ≠ 0, (T4). Die Vertauschbarkeit von Diagonalmatrizen wird nicht gebraucht. Die Liste ist vollständig.

**Nachrechnung.**

1. (Z. 260, „Sei P_i …“) Nach (SN1) ist D(e_{00}) invertierbar, also ist P_i := D(e_{i0})D(e_{00})^{−1} erklärt und diagonal. Es gilt P_i f_0(x) = D(e_{i0})D(e_{00})^{−1}D(e_{00})ℬ(x) = D(e_{i0})ℬ(x) = f_i(x). Also f_i = P_i∘f_0.
2. („Sei E_j …“) E_j = Vektoren mit Einträgen null ab Index j+1. Das ist eine volle Fahne mit dim E_j = j. Eine Diagonalmatrix multipliziert jede Koordinate mit einem Skalar, erhält also Träger und damit jedes E_j.
3. („Weil f_0 injektiv …“) (T4) mit (SN1): f_0 injektiv, also f_0(X) ≠ 0 und dim f_0(X) = dim X.
4. („Sei j minimal …“) Weil f_0(X) ∩ E_r = f_0(X) ≠ 0 und f_0(X) ∩ E_0 = 0, gibt es ein kleinstes j ≥ 1 mit 𝒳 := f_0(X) ∩ E_j ≠ 0. Nach Minimalität ist 𝒳 ∩ E_{j−1} = f_0(X) ∩ E_{j−1} = 0. Also bildet die Projektion E_j → E_j/E_{j−1} den Raum 𝒳 injektiv in einen Raum der Dimension 1 ab: dim 𝒳 = 1.
5. 𝒳 = span{w} mit w ≠ 0, w ∈ f_0(X), also w = f_0(v) mit v ∈ X, und v ≠ 0, weil w ≠ 0.
6. („Sei 𝒯 …“) Nach (SN2), angewandt auf v ≠ 0, ist dim 𝒯 = 3.
7. („Weil f_i(v) = P_if_0(v) ∈ E_j …“) f_0(v) ∈ E_j, und P_i erhält E_j (Schritt 2), also f_i(v) ∈ E_j und 𝒯 ⊆ E_j.
8. f_0(X) ∩ 𝒯 ⊆ f_0(X) ∩ E_j = 𝒳. Umgekehrt ist 𝒳 = span{f_0(v)} ⊆ 𝒯 und ⊆ f_0(X). Also f_0(X) ∩ 𝒯 = 𝒳, Dimension 1.
9. Dimensionsformel: dim(f_0(X) + 𝒯) = dim f_0(X) + 3 − 1 = dim X + 2 (mit Schritt 3).
10. Weil v ∈ X, liegt 𝒯 in f_0(X) + f_1(X) + f_2(X), also auch f_0(X) + 𝒯. Daraus folgt die Behauptung.

Jeder Schritt folgt. Charakteristik spielt keine Rolle (nur Fahnen und Dimensionen).

**Rechnung.** In allen 92 echten Verfahren und in allen Modellen keine Verletzung. Vollständig über alle Unterräume X ≠ 0 von K^{2×m} geprüft, wenn ihre Zahl ≤ 3000 ist: z. B. GF(2) mit m = 3 (alle 2824 Unterräume von GF(2)^6, Charakteristik 2), GF(5) mit m = 2 (1119), GF(3) mit m = 2 (211); sonst 60 Zufallsunterräume je Verfahren und in den Modellen zusätzlich X = N und X = Ŝ.

**Urteil K-13: bestätigt.**

### 3.2 K-14 (Lemma C, D, E), Z. 262 bis 272

**Wortlaut.** (i) Für x ∈ U liegen f_0(x), f_1(x), f_2(x), g(x) in K′; J ⊆ K′, dim J = m, Q erklärt, dim Q = r − 4m. (ii) D(e_{10})f_2(x) − D(e_{20})f_1(x) = 0 für alle x. (iii) D(e_{i0})f_0(y) = D(e_{00})f_i(y). (iv) e_{i0}^{(3×2)}y = 0 für y ∈ U, und e_{i0}^{(3×2)}e_{01}^{(2×2)} = e_{i1}^{(3×2)}.

**Quantoren.** In (iii) steht „für alle i und y“ ohne Bereich; gemeint ist i ∈ {0, 1, 2}, y ∈ K^{2×m}. Kleine Ungenauigkeit im Wortlaut. (ii), (iii) und (iv) gelten auch ohne (SN1); nur (i) braucht (SN1) (für dim J = m).

**Voraussetzungen (Z. 270):** (SN1), K-7. Benutzt: (T3), (T4), (T5), (D1), (D2). Vollständig.

**Nachrechnung.**

1. (i), f_i (Z. 272, „Nach (T5) …“): (T5) sagt W(f_i(x)) = e_{i0}^{(3×2)}x, die Matrix mit Zeile 0 von x in Zeile i. Für x ∈ U ist Zeile 0 null, also W(f_i(x)) = 0, f_i(x) ∈ ker W = K′.
2. (i), g: W ist linear. W(g(x)) = W(D(e_{01})ℬ(x)) − W(D(e_{00})ℬ(e_{01}^{(2×2)}x)) = e_{01}^{(3×2)}x − e_{00}^{(3×2)}e_{01}^{(2×2)}x nach (D2). Matrixrechnung: e_{00}^{(3×2)}e_{01}^{(2×2)} = e_{01}^{(3×2)} (die einzige 1 von e_{00} sitzt in Spalte 0, die einzige 1 von e_{01}^{(2×2)} in Zeile 0, Produkt hat eine 1 bei (0, 1)). Also W(g(x)) = 0. Das gilt sogar für alle x, nicht nur für x ∈ U.
3. dim J = m: U hat Dimension m (Zeile 1 frei), f_0 ist nach (T4) injektiv. dim K′ = r − 3m nach (T3). Mit J ⊆ K′: dim Q = r − 3m − m = r − 4m.
4. (ii): f_2(x) = D(e_{20})ℬ(x), f_1(x) = D(e_{10})ℬ(x). Beide Terme sind D(e_{10})D(e_{20})ℬ(x), nach (D1) gleich, Differenz null.
5. (iii): D(e_{i0})D(e_{00})ℬ(y) = D(e_{00})D(e_{i0})ℬ(y) nach (D1).
6. (iv): e_{i0}^{(3×2)}y hat in Zeile i die Zeile 0 von y, sonst null; für y ∈ U null. e_{i0}^{(3×2)}e_{01}^{(2×2)}: 1 bei (i, 0) mal 1 bei (0, 1) gibt 1 bei (i, 1).

**Rechnung.** In allen 92 echten Verfahren: W(f_i(U)) = 0, W(g(U)) = 0, dim J = m, dim Q = r − 4m, (ii) und (iii) für alle Basisvektoren, (T5) für alle Basisvektoren. Keine Abweichung.

**Urteil K-14: bestätigt.** Kleine Ungenauigkeit: Bereich von i, y in (iii).

### 3.3 K-15 (Kern von Φ, Grundungleichung (G)), Z. 274 bis 298

**Wortlaut.** Unter (SN1): Φ ist wohldefiniert und linear, ker Φ = {(0, 0, x) : x ∈ N}, und 2m + rk H ≤ rk L + 2·dim Q. Φ ist in 1.2 als Abbildung U × U × U → im L × Q × Q erklärt.

**Voraussetzungen (Z. 280):** (SN1), K-7, K-14. Benutzt: K-14 (i), (ii), (iv); (D1), (D2); (SN1). Vollständig.

**Nachrechnung.**

1. Wohldefiniert (Z. 284): Für u_1, u_2, x ∈ U liegen f_1(u_1), f_2(u_2), g(u_i), f_i(x) nach K-14 (i) in K′, die Klassen in Q sind erklärt; die erste Komponente [ℓ(u_1,u_2)] = L(u_1,u_2) liegt per Definition in im L. Linear, weil f_i, g linear sind und die Klassenabbildung linear ist.
2. „⊇“ (Z. 284): ℓ(0,0) = 0 und g(0) = 0, also Φ(0,0,x) = (0, F_2(x), −F_1(x)), und für x ∈ N = ker F_1 ∩ ker F_2 ist das 0.
3. „⊆“, Übersetzung (Z. 284 bis 286): Φ(u_1,u_2,x) = 0 heißt, dass die drei Vektoren ℓ(u_1,u_2), −g(u_1)+f_2(x), −g(u_2)−f_1(x) in J = f_0(U) liegen; das gibt y_0, y_1, y_2 ∈ U wie angegeben.
4. Linearkombination (Z. 288): Multipliziere die erste Gleichung mit D(e_{01}), die zweite mit D(e_{10}), die dritte mit D(e_{20}) und addiere. Die x-Terme links sind D(e_{10})f_2(x) − D(e_{20})f_1(x) = 0 nach K-14 (ii). Vorzeichen nachgerechnet: zweite Gleichung liefert +D(e_{10})f_2(x), dritte −D(e_{20})f_1(x).
5. Ausschreiben (Z. 290): Mit ℓ(u_1,u_2) = D(e_{10})ℬ(u_1) + D(e_{20})ℬ(u_2) und g(u) = D(e_{01})ℬ(u) − D(e_{00})ℬ(e_{01}^{(2×2)}u) ergibt sich genau der Ausdruck in Z. 290.
6. Kürzen (Z. 292): D(e_{01})D(e_{10})ℬ(u_1) − D(e_{10})D(e_{01})ℬ(u_1) = 0 nach (D1), ebenso für u_2. Es bleibt D(e_{10})D(e_{00})ℬ(e_{01}u_1) + D(e_{20})D(e_{00})ℬ(e_{01}u_2) = D(e_{00})[D(e_{10})ℬ(e_{01}u_1) + D(e_{20})ℬ(e_{01}u_2)] (D1). Rechts: D(e_{01})D(e_{00})ℬ(y_0) + … = D(e_{00})[D(e_{01})ℬ(y_0) + D(e_{10})ℬ(y_1) + D(e_{20})ℬ(y_2)] (D1).
7. (Z. 292 bis 294) D(e_{00}) ist nach (SN1) invertierbar und wird gekürzt. W angewandt, (D2) termweise: e_{10}(e_{01}^{(2×2)}u_1) + e_{20}(e_{01}^{(2×2)}u_2) = e_{01}y_0 + e_{10}y_1 + e_{20}y_2. (In Z. 294 fehlen die Größenangaben an e_{01}; aus dem Zusammenhang eindeutig.)
8. (Z. 296) K-14 (iv): e_{10}y_1 = e_{20}y_2 = 0 (y_1, y_2 ∈ U), e_{10}e_{01}^{(2×2)} = e_{11}, e_{20}e_{01}^{(2×2)} = e_{21} (Assoziativität). Also e_{11}u_1 + e_{21}u_2 = e_{01}y_0. Links: Zeile 1 = Zeile 1 von u_1, Zeile 2 = Zeile 1 von u_2, Zeile 0 = 0. Rechts: nur Zeile 0 (= Zeile 1 von y_0). Vergleich der Zeilen 1 und 2: Zeile 1 von u_1 und von u_2 ist null. Da u_i ∈ U auch Zeile 0 null hat, ist u_1 = u_2 = 0.
9. Dann ist Φ(0,0,x) = (0, F_2(x), −F_1(x)) = 0, also x ∈ N.
10. (G) (Z. 298): dim(U³) = 3m, dim ker Φ = dim N (die Abbildung N → ker Φ, x ↦ (0,0,x) ist bijektiv). Rangsatz: dim im Φ = 3m − dim N ≤ dim(im L × Q × Q) = rk L + 2 dim Q. Mit dim N = m − rk H (Rangsatz für H, 1.2) folgt 3m − m + rk H ≤ rk L + 2 dim Q, also (G).

**Rechnung.** In allen 92 echten Verfahren wurde ker Φ als Unterraum von U³ direkt aus der Definition berechnet (Bedingung „alle drei Komponenten in J“): dim ker Φ = dim N, jeder Kernvektor hat u_1 = u_2 = 0. In diesen Verfahren ist N = 0, die Aussage „Φ injektiv“ ist dort trotzdem nicht leer. (G) gilt in allen Fällen. K-15 benutzt die Brent-Gleichungen über (D2), deshalb sind die Modelle aus 1.2 für K-15 nicht aussagekräftig und wurden dafür nicht benutzt. Anmerkung: Aus (G) und rk L ≤ dim Q folgt rk H ≤ 3(r − 4m) − 2m, N ≠ 0 ist also erst bei r < 5m erzwungen. Kleine echte Verfahren mit N ≠ 0 habe ich nicht gefunden (vollständige Suche über alle (S, T) ∈ GL_3(GF(2)) × GL_2(GF(2)) für das naive und das Strassen-Verfahren mit m = 2, 3: N = 0 in allen Fällen mit (SN1), (SN2)).

**Urteil K-15: bestätigt.** Kleine Ungenauigkeit: fehlende Größenangaben an e_{01} in Z. 292 bis 296.

### 3.4 K-16 (Lemma H), Z. 300 bis 310

**Wortlaut.** Unter (SN1): dim Ŝ ≥ dim N − Δ.

**Voraussetzungen (Z. 304):** (SN1), K-7 (T4), K-14 (ii), (iii). Benutzt werden außerdem die Rangsatz-Identitäten aus 1.2 (dim N = m − rk H, dim U = m) und, nur damit Q, F_i, N, L überhaupt erklärt sind, K-14 (i) (J ⊆ K′, f_i(U) ⊆ K′; in 1.2 ist Q ausdrücklich erst „sobald J ⊆ K′ gezeigt ist, Glied K-14“ erklärt). **Kleine Ungenauigkeit in der Liste:** K-14 (i) fehlt. Sie ist Voraussetzung für die Definitionen, nicht für einen Beweisschritt, und K-14 als Ganzes ist in der Tabelle Z. 774 vermerkt (K-16 benutzt K-7, K-14).

**Nachrechnung.**

1. (Z. 306) x ∈ N heißt [f_1(x)] = [f_2(x)] = 0 in Q, also f_1(x), f_2(x) ∈ J = f_0(U). Wegen der Injektivität von f_0 (T4) gibt es genau ein σ_1(x) ∈ U mit f_0(σ_1(x)) = f_2(x) und genau ein σ_2(x) ∈ U mit f_0(σ_2(x)) = −f_1(x). Linearität folgt aus der Eindeutigkeit.
2. Schritt 1 (Z. 307): K-14 (ii): 0 = D(e_{10})f_2(x) − D(e_{20})f_1(x) = D(e_{10})f_0(σ_1x) + D(e_{20})f_0(σ_2x) (Einsetzen). K-14 (iii) mit i = 1, 2: = D(e_{00})f_1(σ_1x) + D(e_{00})f_2(σ_2x). Kürzen von D(e_{00}) (SN1): ℓ(σ_1x, σ_2x) = 0, erst recht L(σx) = 0.
3. Schritt 2 (Z. 308): Für a, b ∈ N ist F_1(a) = 0 und F_2(b) = 0, also L(a, b) = 0.
4. Schritt 3 (Z. 309): Für x ∈ N: f_2(x) = f_0(σ_1x) ∈ f_0(N) ⇔ σ_1x ∈ N (Injektivität: aus f_0(σ_1x) = f_0(n) folgt σ_1x = n). f_1(x) = f_0(−σ_2x) ∈ f_0(N) ⇔ −σ_2x ∈ N ⇔ σ_2x ∈ N. Also Ŝ = {x ∈ N : σ(x) ∈ N × N} = σ^{−1}(N × N).
5. Schritt 4 (Z. 310): Nach Schritt 1 und 2 ist die Komposition N → ker L → ker L/(N × N) erklärt; ihr Kern ist nach Schritt 3 genau Ŝ. Also ist N/Ŝ → ker L/(N × N) injektiv: dim N − dim Ŝ ≤ dim ker L − 2 dim N. dim ker L = 2m − rk L (L ist auf U × U der Dimension 2m erklärt). Einsetzen: (2m − rk L) − 2(m − rk H) = 2 rk H − rk L = Δ.

**Rechnung.** Echte Verfahren: 92 Fälle, alle mit N = 0 (dort trivial). Modelle mit N ≠ 0: Fälle mit dim N = 1, 2 und dim N = 3, dim Ŝ = 1 über GF(3), GF(5), GF(7), ℚ (Zahlen in Abschnitt 4). In allen gilt dim Ŝ ≥ dim N − Δ. Ŝ wurde direkt aus der Definition (x ∈ N, f_1(x), f_2(x) ∈ f_0(N)) berechnet, nicht über σ.

**Urteil K-16: bestätigt.** Kleine Ungenauigkeit: K-14 (i) fehlt in der Liste der Voraussetzungen.

### 3.5 K-17 (Lemma I), Z. 312 bis 318

**Wortlaut.** Unter (SN1), (SN2): Δ ≥ min(2, dim N).

**Voraussetzungen (Z. 316):** (SN1), (SN2), K-13, K-16. Benutzt genau diese. (Dass Ŝ ein Unterraum ist, folgt aus der Definition, weil f_1, f_2 linear und f_0(N) ein Unterraum ist; K-13 verlangt einen Unterraum.)

**Nachrechnung.**

1. (Z. 318) Fall Ŝ = 0: K-16 gibt Δ ≥ dim N ≥ min(2, dim N).
2. Fall Ŝ ≠ 0: f_0(Ŝ) ⊆ f_0(N), weil Ŝ ⊆ N. f_1(Ŝ), f_2(Ŝ) ⊆ f_0(N) nach Definition von Ŝ (punktweise, also auch für die Bildräume). Also f_0(Ŝ) + f_1(Ŝ) + f_2(Ŝ) ⊆ f_0(N).
3. K-13 mit X = Ŝ (Unterraum ≠ 0): dim Ŝ + 2 ≤ dim(f_0(Ŝ)+f_1(Ŝ)+f_2(Ŝ)) ≤ dim f_0(N) ≤ dim N. Der Text schreibt „= dim N“; das gilt nach (T4), gebraucht wird nur „≤“, das ohne (T4) gilt. Also ist (T4) nicht nötig und das Fehlen von K-7 in der Liste keine Lücke.
4. K-16: Δ ≥ dim N − dim Ŝ ≥ 2 ≥ min(2, dim N).

**Rechnung.** In allen echten Verfahren und Modellen gilt Δ ≥ min(2, dim N), und in allen Fällen mit Ŝ ≠ 0 gilt dim Ŝ + 2 ≤ dim N (z. B. dim N = 3, dim Ŝ = 1, Δ = 3).

**Urteil K-17: bestätigt.**

### 3.6 K-18 (untere Schranke 34 und Folgen), Z. 320 bis 333

**Wortlaut.** (a) Jedes Verfahren der Länge r für ⟨3,2,7⟩ über einem Körper mit (SN1), (SN2) hat r ≥ 34. (b) R_F(⟨3,2,7⟩) ≥ 34 für jeden Körper F. (c) Ein Verfahren der Länge 34 über F hat keine Nullform α_t, und für V über K = F̄ ist 𝒢* ≠ ∅. Quantoren eindeutig: (a) jeder Körper, (b) jeder Körper F, (c) V über F, dann V über dem algebraischen Abschluss K (1.3).

**Voraussetzungen (Z. 327):** K-8, K-9, K-10, K-11, K-14 (i), K-15, K-17. Zusätzlich benutzt, ohne Nennung: „ein algebraisch abgeschlossener Körper ist unendlich“ (Z. 330, „K ist unendlich“) und die Existenz eines algebraischen Abschlusses. Beides ist Standardwissen der Algebra und kein Glied der Kette. **Kleine Ungenauigkeit**, keine Lücke.

**Nachrechnung (a)** (Z. 329):

1. m = 7, K-14 (i): dim Q = r − 28; als Dimension ≥ 0.
2. Annahme r ≤ 33: dim Q ≤ 5.
3. rk L ≤ dim Q, weil im L ⊆ Q.
4. (G) aus K-15: 14 + rk H ≤ rk L + 2 dim Q ≤ 3 dim Q ≤ 15, also rk H ≤ 1, dim N = 7 − rk H ≥ 6.
5. K-17: Δ ≥ min(2, dim N) = 2, also rk L ≤ 2 rk H − 2 ≤ 0, also rk L = 0.
6. (G) erneut: 14 ≤ 14 + rk H ≤ 0 + 2 dim Q ≤ 10. Widerspruch. Also r ≥ 34.

Meine vollständige Abzählung (Anhang A, `enumerate_cases`) aller ganzzahligen (rk L, rk H, dim Ŝ) mit 0 ≤ rk L ≤ dim Q, 0 ≤ rk H ≤ 7, 0 ≤ dim Ŝ ≤ dim N unter (G), K-17, K-16 und der K-13-Folgerung (dim Ŝ ≥ 1 ⇒ dim Ŝ + 2 ≤ dim N) ergibt für r = 28, …, 33 jeweils **keinen** zulässigen Fall. Das stimmt mit (a) überein.

**Nachrechnung (b)** (Z. 330):

1. V Länge r über F. K-8: dasselbe V ist ein Verfahren der Länge r über K = F̄.
2. K-9 so oft anwenden, wie es Nullformen gibt (endlich oft): Verfahren der Länge r′ ≤ r über K ohne Nullformen.
3. r′ ≥ 1: Bei r′ = 0 wäre die Summe in (Z) leer, also AB = 0 für alle A, B; aber e_{00}^{(3×2)}e_{01}^{(2×m)} = e_{01}^{(3×m)} ≠ 0 (m = 7 ≥ 1).
4. K unendlich (algebraisch abgeschlossen). K-11 (K unendlich, r′ ≥ 1, keine Nullform) gibt (S, T) mit (SN1), (SN2) für das gestrichene Verfahren V′ („Insbesondere ist 𝒢* ≠ ∅“, für V′).
5. K-10: V′^{(S,T)} ist ein Verfahren der Länge r′ über K.
6. (a) über dem Körper K: r′ ≥ 34. Also r ≥ 34, und weil V beliebig war, R_F ≥ 34.

**Nachrechnung (c)** (Z. 331):

1. Ist α_t = 0 über F, gibt K-9 ein Verfahren der Länge 33 über F, im Widerspruch zu (b) (für denselben Körper F).
2. K-8: α_t = 0 über K genau dann, wenn über F. Also keine Nullform über K.
3. K-11 für V über K (K unendlich, r = 34 ≥ 1, keine Nullform): 𝒢* ≠ ∅.

Die Literaturstelle Z. 333 ist als „nicht benutzt“ markiert und wird im Beweis nicht gebraucht. Die dort genannte Zahl ⌈(24·7+2)/5⌉ = ⌈170/5⌉ = 34 und 24·7/5 = 33,6 habe ich nachgerechnet; die Quellen selbst habe ich nicht geprüft (nicht Teil des Auftrags).

**Urteil K-18: bestätigt.** Kleine Ungenauigkeit: „algebraisch abgeschlossene Körper sind unendlich“ wird benutzt, nicht genannt.

### 3.7 K-19 (Restfall), Z. 335 bis 364

**Wortlaut.** V̂ Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper mit (SN1), (SN2): dim Q = 6, rk L = 6, rk H = 4, dim N = 3, Δ = 2, dim Ŝ = 1. Zusatz: Das gilt für jede Normalform eines Verfahrens der Länge 34 (K-12). Quantoren eindeutig; der Zusatz folgt, weil K-12 sagt, dass jede Normalform ein Verfahren derselben Länge 34 über K mit (SN1), (SN2) ist.

**Voraussetzungen (Z. 341):** (SN1), (SN2), K-12 (nur Zusatz), K-13, K-14 (i), K-15, K-16, K-17. Benutzt genau diese, dazu die Identität dim N = m − rk H aus 1.2.

**Nachrechnung** (Z. 343 bis 351):

1. dim Q = 34 − 4·7 = 6 (K-14 (i)).
2. (G) mit m = 7, dim Q = 6: 14 + rk H ≤ rk L + 12, also (1) rk H ≤ rk L − 2.
3. rk L ≤ dim Q = 6, mit (1): rk H ≤ 4, dim N = 7 − rk H ≥ 3.
4. K-17: Δ ≥ min(2, dim N) = 2, also (2) rk L + 2 ≤ 2 rk H.
5. (2) und (1): rk L + 2 ≤ 2 rk H ≤ 2(rk L − 2) = 2 rk L − 4, also rk L ≥ 6. Mit rk L ≤ 6: rk L = 6.
6. (1): rk H ≤ 4; (2): 8 ≤ 2 rk H, rk H ≥ 4. Also rk H = 4, dim N = 3, Δ = 8 − 6 = 2.
7. K-16: dim Ŝ ≥ 3 − 2 = 1, also Ŝ ≠ 0.
8. K-13 mit X = Ŝ wie im Beweis von K-17: dim Ŝ + 2 ≤ dim f_0(N) ≤ 3, also dim Ŝ ≤ 1. Zusammen dim Ŝ = 1.

**Eigene Abzählung der Fallunterscheidung.** Für m = 7, r = 34 (dim Q = 6) habe ich alle 7·8 = 56 Paare (rk L, rk H) ∈ {0..6} × {0..7} und dazu alle dim Ŝ ∈ {0..dim N} durchlaufen. Unter (G), rk L ≤ dim Q, K-17, K-16 und der K-13-Folgerung bleibt genau ein Fall:

  (rk L, rk H, dim N, Δ, dim Ŝ) = (6, 4, 3, 2, 1).

Das ist der Wortlaut von K-19. Gegenproben durch Weglassen je einer Bedingung (Anhang D):

- ohne K-16: (6, 4, 3, 2, 0) und (6, 4, 3, 2, 1). K-16 wird also für dim Ŝ = 1 gebraucht, wie im Beweis (Schritt 7).
- ohne die K-13-Folgerung: zusätzlich dim Ŝ = 2, 3. Gebraucht für Schritt 8.
- ohne K-17 (aber mit K-16 und der K-13-Folgerung): weiterhin nur (6, 4, 3, 2, 1). Das ist folgerichtig, denn K-17 ist aus genau diesen beiden Bedingungen bewiesen. Der Satz in Z. 364 („ohne Lemma I (K-17) bliebe ein weiterer Fall (3, 5, 3)“) bezieht sich auf das Bedingungssystem des dort genannten Programms, das ich nicht gesehen habe; ich kann ihn deshalb nicht nachprüfen. Er ist ausdrücklich nicht Teil des Beweises und berührt das Urteil nicht.
- zum Vergleich r = 35 (dim Q = 7): 15 Fälle bleiben; die Schranke ist also bei 34 scharf in dem Sinn, dass erst dort die Fallunterscheidung auf einen Fall zusammenfällt.

Zur „Rechnung zur Kontrolle“ (Z. 353 bis 364): nicht Teil des Beweises, Programm von mir nicht gesehen. Meine eigene Abzählung kommt ohne ρ zum selben Tupel für (rk L, rk H, dim N, Δ, dim Ŝ).

**Urteil K-19: bestätigt.**

### 3.8 K-20 (ρ im Restfall), Z. 366 bis 376

**Wortlaut.** K algebraisch abgeschlossen, V̂ wie in K-19 über K: ρ = 4. Allgemein für Verfahren mit (SN1), (SN2) „und d = 2“: (a) rk H ≥ ρ, rk L ≤ 2ρ; (b) K algebraisch abgeschlossen und rk L = 2ρ ⇒ ρ = m.

**Quantoren und Begriffe.**

- „d = 2“ (Z. 368) und „Lemma 15(b) für d = 2“ (Z. 370): Der Buchstabe d ist in Abschnitt 1 nicht für diese Bedeutung erklärt (in 1.4 bezeichnet d den Grad in P_d). Aus dem Zusammenhang (⟨3,2,m⟩, zwei Abbildungen F_1, F_2) ist d = 2 die stets erfüllte Bedingung „n − 1 = 2“. **Kleine Ungenauigkeit im Wortlaut** (unerklärter Buchstabe); für den Inhalt ohne Folgen, weil der Abschnitt ohnehin nur ⟨3,2,m⟩ behandelt.
- ρ ist in 1.2 als Maximum über (γ_1, γ_2) ∈ F² erklärt, K-20 spricht vom Körper K. Gemeint ist der Körper des Verfahrens. Kleine Ungenauigkeit in der Schreibweise.
- (a) braucht (SN2) nicht, nur (SN1) (damit Q erklärt ist). Unschädlich.

**Voraussetzungen (Z. 372):** (SN1), (SN2), K-7 (T4), K-14 (i), K-19, für (b) K algebraisch abgeschlossen. Der Beweis von (b) beruft sich ausdrücklich auf (D1) („mit (D1)“, Z. 375); K-7 ist genannt, aber auf (T4) eingeschränkt. Die benutzte Tatsache ist nur, dass Diagonalmatrizen vertauschen. **Kleine Ungenauigkeit in der Liste.** Außerdem benutzt: Rangsatz und die Dimensionsformel für Summen von Unterräumen, ρ ≤ m (trivial, F_i ist auf U der Dimension m erklärt).

**Nachrechnung (a)** (Z. 374):

1. Für jedes γ: N = ker F_1 ∩ ker F_2 ⊆ ker(γ_1F_1 + γ_2F_2), also rk(γ_1F_1 + γ_2F_2) = m − dim ker(…) ≤ m − dim N = rk H. Maximum über γ: ρ ≤ rk H.
2. im L = im F_1 + im F_2 (L(u_1,u_2) = F_1(u_1) + F_2(u_2)). rk F_1 ≤ ρ (γ = (1, 0)), rk F_2 ≤ ρ (γ = (0, 1)). Also rk L ≤ rk F_1 + rk F_2 ≤ 2ρ.

**Nachrechnung (b)** (Z. 375):

1. rk L = dim(im F_1 + im F_2) = rk F_1 + rk F_2 − dim(im F_1 ∩ im F_2) ≤ 2ρ. Gleichheit erzwingt rk F_1 = rk F_2 = ρ und im F_1 ∩ im F_2 = 0.
2. σ := F_1 + F_2. Aus σ(x) = 0 folgt F_1(x) = −F_2(x) ∈ im F_1 ∩ im F_2 = 0, also x ∈ N; umgekehrt N ⊆ ker σ. Also ker σ = N.
3. m − dim N = rk σ ≤ ρ (γ = (1, 1)), also dim N ≥ m − ρ = dim ker F_i (Schritt 1). Mit N ⊆ ker F_i folgt N = ker F_1 = ker F_2.
4. v ∈ N, i ∈ {1, 2}: F_i(v) = 0 heißt f_i(v) ∈ J = f_0(U), also f_i(v) = f_0(u_i) mit u_i ∈ U, d. h. D(e_{00})ℬ(u_i) = D(e_{i0})ℬ(v), also ℬ(u_i) = D(e_{00})^{−1}D(e_{i0})ℬ(v) (SN1).
5. {i, j} = {1, 2}: f_j(u_i) = D(e_{j0})D(e_{00})^{−1}D(e_{i0})ℬ(v). Dieser Ausdruck ist symmetrisch in i, j, weil Diagonalmatrizen vertauschen. Also f_j(u_i) = f_i(u_j), und F_j(u_i) = F_i(u_j) (u_i, u_j ∈ U).
6. F_j(u_i) ∈ im F_j, F_i(u_j) ∈ im F_i, also beide in im F_1 ∩ im F_2 = 0. Also u_i ∈ ker F_j = N (Schritt 3). Damit f_i(v) = f_0(u_i) ∈ f_0(N): f_1(N), f_2(N) ⊆ f_0(N).
7. Annahme N ≠ 0. P_1 := D(e_{10})D(e_{00})^{−1} bildet 𝒱 := f_0(N) in f_1(N) ⊆ 𝒱 ab (P_1f_0 = f_1, siehe K-13 Schritt 1). 𝒱 ≠ 0 (T4). Über algebraisch abgeschlossenem K hat der Endomorphismus P_1|_𝒱 einen Eigenvektor w ∈ 𝒱, w ≠ 0, w = f_0(s), s ∈ N, s ≠ 0. P_1f_0(s) = λf_0(s) heißt f_1(s) = λf_0(s): f_0(s), f_1(s) linear abhängig, Widerspruch zu (SN2). Also N = 0.
8. N = 0 gibt mit Schritt 3 ker F_1 = 0, rk F_1 = m, und rk F_1 = ρ (Schritt 1): ρ = m. (Der Text sagt nur „Also N = 0 und ρ = m“; der Schluss von N = 0 auf ρ = m ist dieser eine Zwischenschritt.)

**Nachrechnung Restfall** (Z. 376): K-19: rk L = 6, rk H = 4. (a): ρ ≤ rk H = 4 und 2ρ ≥ rk L = 6, also 3 ≤ ρ ≤ 4. Bei ρ = 3 wäre rk L = 6 = 2ρ, (b) (K algebraisch abgeschlossen) gäbe ρ = m = 7 ≠ 3. Also ρ = 4.

**Rechnung.** (a) in allen echten Verfahren und Modellen erfüllt (ρ über GF(p) durch Durchlaufen aller γ ∈ GF(p)², über ℚ exakt als generischer Rang: ein von 0 verschiedener Minor des Büschels (1, t) hat Grad ≤ m, also erreichen unter m + 2 Werten von t einer den generischen Rang; dazu γ = (0, 1)). Fälle mit rk L = 2ρ (Prämisse von (b)) traten in 82 der 92 echten Verfahren und in 44 Modellen auf; in allen war ρ = m, auch über GF(p) und ℚ, die nicht algebraisch abgeschlossen sind. Eine Gegenprobe zur Notwendigkeit der Abgeschlossenheit habe ich nicht gesucht; der Beweis braucht sie nur für den Eigenvektor in Schritt 7.

**Urteil K-20: bestätigt.** Kleine Ungenauigkeiten: unerklärtes d, F statt K in der Definition von ρ, (D1) nicht in der Liste, Zwischenschritt N = 0 ⇒ ρ = m nicht ausgeschrieben. K-20 geht laut Z. 30 und Z. 806 nicht in den Endsatz ein; das habe ich in der Tabelle Z. 753 bis 806 bestätigt gefunden (K-20 hat „benutzt von: –“).

---

## 4. Zusammenfassung der Rechnung

Alle Läufe am 26.11.2026 in dieser Sitzung, jeder Rechenblock unter 30 Minuten (Laufzeiten: Anhang A 12 s, Anhang B 5 min, Anhang C 13 min, Anhang D unter 1 s, Anhang E 4 s). In keinem Lauf trat eine Verletzung einer geprüften Aussage auf (Liste `failures` jeweils leer, Zähler `failures: 0`).

**A. Echte Verfahren** (`check_k13_k20.py 1`): 92 Verfahren mit (SN1), (SN2) und nachgerechneten Brent-Gleichungen: GF(2) 5, GF(3) 15, GF(5) 24, GF(7) 24, ℚ 24; m = 1, 2, 3; Längen r = 6 bis 27, darunter das Strassen-Verfahren der Länge 11 für ⟨3,2,2⟩ (dim Q = 3, rk L = 3, rk H = 2, Δ = 1). Geprüft: (T5), K-14 (i) bis (iii), K-15 (ker Φ direkt berechnet, dim ker Φ = dim N, u_1 = u_2 = 0), (G), K-16, K-17, K-13 (vollständig über alle Unterräume, wenn ≤ 3000, sonst 60 Zufallsunterräume), K-20 (a). (SN2) über GF(p) mit p^{2m} ≤ 5000 zusätzlich durch Durchlaufen aller x bestätigt (keine Abweichung zwischen beiden Prüfungen). In allen echten Verfahren ist N = 0 (Grund: siehe 3.3).

**B. Modelle** (`synthetic.py 2`): 55 Modelle über GF(2), GF(3), GF(5), ℚ, m = 2, 3, 4, 6, 7, mit dim N ∈ {0, 1, 2, 3}; zwei Modelle über ℚ mit dim N = 3, dim Ŝ = 1. K-13 (bei kleinen Räumen vollständig), K-16, K-17, K-20 (a) ohne Verletzung. Prämisse rk L = 2ρ von K-20 (b) 44-mal, stets ρ = m.

**C. Modelle mit Ŝ ≠ 0** (`focused.py 3`): 20 Modelle mit dim N = 3, dim Ŝ = 1 über GF(5) (4), GF(7) (8), ℚ (8), m = 6, 7. Beispiele: (rk L, rk H, dim N, Δ, dim Ŝ, ρ) = (3, 3, 3, 3, 1, 3), (5, 4, 3, 3, 1, 4), (4, 4, 3, 4, 1, 3). Über GF(3) und GF(4) fand dieser Lauf keine Modelle mit (SN2).

**E. Charakteristik 2** (`char2.py 5`): 6 Modelle über GF(4) mit dim N = 3, dim Ŝ = 1, m = 6 und 7, r = 30 bis 39. Für m = 7 ergaben sich genau die Zahlen des Restfalls: rk L = 6, rk H = 4, dim N = 3, Δ = 2, dim Ŝ = 1, ρ = 4. Dort ist K-16 mit Gleichheit erfüllt (dim Ŝ = dim N − Δ) und K-17 mit Gleichheit (Δ = 2). Das ist ein Modell, kein Verfahren (die Brent-Gleichungen sind dort nicht gestellt), zeigt aber, dass die Aussagen K-13, K-16, K-17, K-20 (a) an der Grenze in Charakteristik 2 nicht verletzt werden.

**D. Ganzzahlige Fallunterscheidung** (`enum_variants.py`): für m = 7 kein Fall bei r = 28 bis 33, genau ein Fall (6, 4, 3, 2, 1) bei r = 34, 15 Fälle bei r = 35. Weglassen je einer Bedingung bei r = 34: siehe 3.7.

**Grenzen der Rechnung.** K-15 ist nur an echten Verfahren mit N = 0 geprüft (dort Injektivität von Φ). K-18 und K-19 sind Aussagen über Verfahren der Länge 33 oder 34 für ⟨3,2,7⟩, die ich nicht erzeugen kann; für sie gibt es nur die Abzählung D. K-20 (b) habe ich nur mit erfüllter Prämisse und N = 0 gesehen. Zufallssuche ersetzt keinen Beweis; die Urteile beruhen auf der Nachrechnung in Abschnitt 3.

---

## 5. Urteile

| Glied | Urteil | echte Lücke | kleine Ungenauigkeiten im Wortlaut oder in der Liste |
|---|---|---|---|
| K-13 | bestätigt | keine | keine |
| K-14 | bestätigt | keine | Bereich von i, y in (iii) nicht angegeben (Z. 267) |
| K-15 | bestätigt | keine | Größenangaben an e_{01} fehlen (Z. 292 bis 296) |
| K-16 | bestätigt | keine | K-14 (i) fehlt in der Liste (Z. 304), nötig für die Definition von Q, F_i, N, L |
| K-17 | bestätigt | keine | „= dim N“ statt nötigem „≤“ (Z. 318), dadurch kein Bedarf an (T4) |
| K-18 | bestätigt | keine | „algebraisch abgeschlossen ⇒ unendlich“ benutzt, nicht genannt (Z. 330) |
| K-19 | bestätigt | keine | Satz über „(3, 5, 3) ohne K-17“ (Z. 364) von mir nicht nachprüfbar, nicht Teil des Beweises |
| K-20 | bestätigt | keine | „d = 2“ unerklärt (Z. 368, 370); ρ in 1.2 über F statt K; (D1) nicht in der Liste (Z. 372); N = 0 ⇒ ρ = m nicht ausgeschrieben |

Rahmen (Z. 251): „beliebiger Körper K“ weicht von der Festlegung in 1.3 ab (K = algebraischer Abschluss). Unschädlich, weil die Beweise für jeden Körper gelten.

Abhängigkeiten: Die Voraussetzungszeilen des Blocks stimmen mit den Zeilen der Tabelle Z. 769 bis 776 überein (K-13: K-7; K-14: K-7; K-15: K-7, K-14; K-16: K-7, K-14; K-17: K-13, K-16; K-18: K-8, K-9, K-10, K-11, K-14, K-15, K-17; K-19: K-12, K-13, K-14, K-15, K-16, K-17; K-20: K-7, K-14, K-19). Jedes Glied benutzt nur Glieder mit kleinerer Nummer.

---

## Anhang

Die Programme liegen nur hier im Bericht (eine Datei je Auftrag). Aufruf jeweils aus einem Verzeichnis, das die Dateien enthält.

### Anhang A: `check_k13_k20.py`

Aufruf: `python3 check_k13_k20.py 1`. SHA-256 `e3462004f06bd59aaa88d5920e1ea0d17b80f5e96d1a8cd883ad27e9b33a659a`.

```python
#!/usr/bin/env python3
"""Exact-arithmetic checks for chain links K-13 .. K-20 (<3,2,m> schemes).

Fields: GF(p) (integers mod p) and Q (fractions.Fraction). No floats.
Schemes: naive, Strassen-block based, modified by random validity-preserving
moves (splitting a term, adding a cancelling pair), then a random basis change
(S, T) until (SN1) and (SN2) hold. All objects of Section 1.2 are computed
from their definitions and the statements of K-13 .. K-20 are tested.
"""
import itertools
import random
import sys
from fractions import Fraction


# ---------------------------------------------------------------- fields
class GF:
    def __init__(self, p):
        self.p = p
        self.name = "GF(%d)" % p
        self.finite = True

    def c(self, x):
        return x % self.p

    def add(self, a, b):
        return (a + b) % self.p

    def sub(self, a, b):
        return (a - b) % self.p

    def mul(self, a, b):
        return (a * b) % self.p

    def neg(self, a):
        return (-a) % self.p

    def inv(self, a):
        assert a % self.p != 0
        return pow(a, self.p - 2, self.p)

    def iszero(self, a):
        return a % self.p == 0

    def rand(self, rng):
        return rng.randrange(self.p)

    def elements(self):
        return list(range(self.p))


class QQ:
    name = "Q"
    finite = False

    def c(self, x):
        return Fraction(x)

    def add(self, a, b):
        return a + b

    def sub(self, a, b):
        return a - b

    def mul(self, a, b):
        return a * b

    def neg(self, a):
        return -a

    def inv(self, a):
        assert a != 0
        return 1 / Fraction(a)

    def iszero(self, a):
        return a == 0

    def rand(self, rng):
        return Fraction(rng.randint(-3, 3))


# ---------------------------------------------------------------- linear algebra
def rref(Fd, M, ncols):
    """Row-reduce a list of rows (copy). Returns (rows, pivot columns)."""
    A = [list(r) for r in M]
    piv = []
    row = 0
    for col in range(ncols):
        pr = None
        for i in range(row, len(A)):
            if not Fd.iszero(A[i][col]):
                pr = i
                break
        if pr is None:
            continue
        A[row], A[pr] = A[pr], A[row]
        iv = Fd.inv(A[row][col])
        A[row] = [Fd.mul(iv, x) for x in A[row]]
        for i in range(len(A)):
            if i != row and not Fd.iszero(A[i][col]):
                f = A[i][col]
                A[i] = [Fd.sub(x, Fd.mul(f, y)) for x, y in zip(A[i], A[row])]
        piv.append(col)
        row += 1
        if row == len(A):
            break
    return A[:row], piv


def rank_cols(Fd, cols, dim):
    """Rank of a list of column vectors of length dim."""
    if not cols:
        return 0
    return len(rref(Fd, cols, dim)[0])


def nullspace(Fd, M, ncols):
    """Basis of {c : M c = 0}, M given as list of rows."""
    R, piv = rref(Fd, M, ncols) if M else ([], [])
    free = [j for j in range(ncols) if j not in piv]
    basis = []
    for fj in free:
        v = [Fd.c(0)] * ncols
        v[fj] = Fd.c(1)
        for i, pc in enumerate(piv):
            v[pc] = Fd.neg(R[i][fj])
        basis.append(v)
    return basis


def matvec(Fd, Mcols, c):
    """Mcols: list of columns; returns sum c_j col_j."""
    n = len(Mcols[0])
    out = [Fd.c(0)] * n
    for cj, col in zip(c, Mcols):
        if Fd.iszero(cj):
            continue
        out = [Fd.add(o, Fd.mul(cj, x)) for o, x in zip(out, col)]
    return out


def transpose(cols, n):
    return [[col[i] for col in cols] for i in range(n)]


def kernel_mod(Fd, imgs, sub, n):
    """imgs: list of k column vectors (length n) = images of basis vectors.
    sub: list of column vectors spanning a subspace S.  Returns a basis of
    {c in K^k : sum c_j imgs_j in S} (as coordinate vectors)."""
    k = len(imgs)
    cols = imgs + sub
    if not cols:
        return []
    rows = transpose(cols, n)
    ns = nullspace(Fd, rows, len(cols))
    vecs = [v[:k] for v in ns]
    if not vecs:
        return []
    R, _ = rref(Fd, vecs, k)
    return R


def in_span(Fd, v, basis, n):
    return rank_cols(Fd, basis + [v], n) == rank_cols(Fd, basis, n)


# ---------------------------------------------------------------- schemes
# alpha: 3x2 matrix (list of rows), beta: 2xm, C: 3xm.
def zeros(a, b, Fd):
    return [[Fd.c(0)] * b for _ in range(a)]


def E(a, b, i, j, Fd):
    M = zeros(a, b, Fd)
    M[i][j] = Fd.c(1)
    return M


def naive(m, Fd):
    T = []
    for i in range(3):
        for j in range(2):
            for l in range(m):
                T.append((E(3, 2, i, j, Fd), E(2, m, j, l, Fd), E(3, m, i, l, Fd)))
    return T


def lin(Fd, shape, terms):
    a, b = shape
    M = zeros(a, b, Fd)
    for coef, (i, j) in terms:
        M[i][j] = Fd.add(M[i][j], Fd.c(coef))
    return M


def strassen_block(m, Fd, rows=(0, 1)):
    """<3,2,m>: Strassen on rows `rows` of A and column pairs of B, rest naive."""
    r0, r1 = rows
    other = [i for i in range(3) if i not in rows][0]
    T = []
    l = 0
    while l + 1 < m:
        c0, c1 = l, l + 1
        A = lambda terms: lin(Fd, (3, 2), terms)
        B = lambda terms: lin(Fd, (2, m), terms)
        C = lambda terms: lin(Fd, (3, m), terms)
        a11, a12, a21, a22 = (r0, 0), (r0, 1), (r1, 0), (r1, 1)
        b11, b12, b21, b22 = (0, c0), (0, c1), (1, c0), (1, c1)
        c11, c12, c21, c22 = (r0, c0), (r0, c1), (r1, c0), (r1, c1)
        T += [
            (A([(1, a11), (1, a22)]), B([(1, b11), (1, b22)]), C([(1, c11), (1, c22)])),
            (A([(1, a21), (1, a22)]), B([(1, b11)]), C([(1, c21), (-1, c22)])),
            (A([(1, a11)]), B([(1, b12), (-1, b22)]), C([(1, c12), (1, c22)])),
            (A([(1, a22)]), B([(1, b21), (-1, b11)]), C([(1, c11), (1, c21)])),
            (A([(1, a11), (1, a12)]), B([(1, b22)]), C([(-1, c11), (1, c12)])),
            (A([(1, a21), (-1, a11)]), B([(1, b11), (1, b12)]), C([(1, c22)])),
            (A([(1, a12), (-1, a22)]), B([(1, b21), (1, b22)]), C([(1, c11)])),
        ]
        l += 2
    if l < m:
        for i in rows:
            for j in range(2):
                T.append((E(3, 2, i, j, Fd), E(2, m, j, l, Fd), E(3, m, i, l, Fd)))
    for j in range(2):
        for ll in range(m):
            T.append((E(3, 2, other, j, Fd), E(2, m, j, ll, Fd), E(3, m, other, ll, Fd)))
    return T


def madd(Fd, X, Y, s=1):
    return [[Fd.add(x, Fd.mul(Fd.c(s), y)) for x, y in zip(rx, ry)] for rx, ry in zip(X, Y)]


def mrand(Fd, a, b, rng):
    return [[Fd.rand(rng) for _ in range(b)] for _ in range(a)]


def mmul(Fd, X, Y):
    return [[_dot(Fd, X[i], [Y[k][j] for k in range(len(Y))])
             for j in range(len(Y[0]))] for i in range(len(X))]


def _dot(Fd, u, v):
    s = Fd.c(0)
    for a, b in zip(u, v):
        s = Fd.add(s, Fd.mul(a, b))
    return s


def mT(X):
    return [list(r) for r in zip(*X)]


def minv(Fd, X):
    n = len(X)
    aug = [list(X[i]) + [Fd.c(1 if i == j else 0) for j in range(n)] for i in range(n)]
    R, piv = rref(Fd, aug, 2 * n)
    if piv[:n] != list(range(n)) or len(R) < n:
        return None
    return [r[n:] for r in R]


def brent_ok(Fd, T, m):
    for i in range(3):
        for j in range(2):
            for k in range(2):
                for l in range(m):
                    S = zeros(3, m, Fd)
                    for (al, be, C) in T:
                        f = Fd.mul(al[i][j], be[k][l])
                        if not Fd.iszero(f):
                            S = madd(Fd, S, [[Fd.mul(f, x) for x in row] for row in C])
                    target = E(3, m, i, l, Fd) if j == k else zeros(3, m, Fd)
                    if any(not Fd.iszero(Fd.sub(S[a][b], target[a][b]))
                           for a in range(3) for b in range(m)):
                        return False
    return True


def random_moves(Fd, T, m, rng, nmoves):
    T = list(T)
    for _ in range(nmoves):
        kind = rng.randrange(4)
        if kind == 0:  # split alpha
            t = rng.randrange(len(T))
            al, be, C = T[t]
            a1 = mrand(Fd, 3, 2, rng)
            T[t] = (a1, be, C)
            T.append((madd(Fd, al, a1, -1), be, C))
        elif kind == 1:  # split beta
            t = rng.randrange(len(T))
            al, be, C = T[t]
            b1 = mrand(Fd, 2, m, rng)
            T[t] = (al, b1, C)
            T.append((al, madd(Fd, be, b1, -1), C))
        elif kind == 2:  # split C
            t = rng.randrange(len(T))
            al, be, C = T[t]
            c1 = mrand(Fd, 3, m, rng)
            T[t] = (al, be, c1)
            T.append((al, be, madd(Fd, C, c1, -1)))
        else:  # cancelling pair
            al, be, C = mrand(Fd, 3, 2, rng), mrand(Fd, 2, m, rng), mrand(Fd, 3, m, rng)
            T.append((al, be, C))
            T.append((al, be, [[Fd.neg(x) for x in r] for r in C]))
    return T


def basis_change(Fd, T, S, Tm):
    """V^{(S,T)}: alpha' = S^T alpha T^T, beta'(B)=beta(T^{-1}B) -> coeff (T^{-1})^T beta,
    C' = S^{-1} C."""
    Si, Ti = minv(Fd, S), minv(Fd, Tm)
    out = []
    for al, be, C in T:
        out.append((mmul(Fd, mmul(Fd, mT(S), al), mT(Tm)),
                    mmul(Fd, mT(Ti), be),
                    mmul(Fd, Si, C)))
    return out


# ---------------------------------------------------------------- objects of 1.2
class Obj:
    pass


def build(Fd, T, m):
    o = Obj()
    o.Fd, o.T, o.m, o.r = Fd, T, m, len(T)
    r = o.r
    alpha = lambda t, i, j: T[t][0][i][j]
    o.a = {(i, j): [alpha(t, i, j) for t in range(r)] for i in range(3) for j in range(2)}
    # B-matrix: columns indexed by (k,l) -> k*m+l, column = calB(e_kl)
    o.Bcols = [[T[t][1][k][l] for t in range(r)] for k in range(2) for l in range(m)]
    # W: r columns, each vec(C_t) of length 3m
    o.Wcols = [[T[t][2][i][l] for i in range(3) for l in range(m)] for t in range(r)]
    o.Wrows = transpose(o.Wcols, 3 * m)
    diag = lambda d, v: [Fd.mul(x, y) for x, y in zip(d, v)]
    o.diag = diag
    o.f = {i: [diag(o.a[(i, 0)], col) for col in o.Bcols] for i in range(3)}
    # g(x) = D(e01) B(x) - D(e00) B(e01^{2x2} x); e01 x: row0 <- row1 of x
    gcols = []
    for k in range(2):
        for l in range(m):
            first = diag(o.a[(0, 1)], o.Bcols[k * m + l])
            if k == 1:
                second = diag(o.a[(0, 0)], o.Bcols[0 * m + l])
            else:
                second = [Fd.c(0)] * r
            gcols.append([Fd.sub(x, y) for x, y in zip(first, second)])
    o.g = gcols
    o.Uidx = [m + l for l in range(m)]  # row-1 coordinates
    o.fU = {i: [o.f[i][j] for j in o.Uidx] for i in range(3)}
    o.gU = [o.g[j] for j in o.Uidx]
    o.Kp = nullspace(Fd, o.Wrows, r)
    o.J = o.fU[0]
    o.dJ = rank_cols(Fd, o.J, r)
    o.dQ = len(o.Kp) - o.dJ
    return o


def sn1(o):
    return all(not o.Fd.iszero(x) for x in o.a[(0, 0)])


def sn2(o):
    """(SN2) for all x != 0: f0(x), f1(x), f2(x) lin. indep.
    Equivalent: for every c != 0 in K^3, the rows of B outside
    Z_c = {t : c.a(t) = 0} have rank 2m.  Exact check via maximal flats."""
    Fd, r, m = o.Fd, o.r, o.m
    pts = [[o.a[(i, 0)][t] for i in range(3)] for t in range(r)]
    Brows = transpose(o.Bcols, r)

    def ok_on(Z):
        rows = [Brows[t] for t in range(r) if t not in Z]
        return rank_cols(Fd, rows, 2 * m) == 2 * m if rows else False

    if rank_cols(Fd, pts, 3) <= 2:
        return False  # some c kills all t, complement empty
    planes = set()
    for s in range(r):
        for u in range(s + 1, r):
            if rank_cols(Fd, [pts[s], pts[u]], 3) == 2:
                Z = frozenset(t for t in range(r)
                              if rank_cols(Fd, [pts[s], pts[u], pts[t]], 3) == 2)
                planes.add(Z)
    return all(ok_on(Z) for Z in planes)


def sn2_bruteforce(o):
    """Only for GF(p): enumerate all x != 0."""
    Fd, m = o.Fd, o.m
    for x in itertools.product(Fd.elements(), repeat=2 * m):
        if all(v == 0 for v in x):
            continue
        vs = [matvec(Fd, o.f[i], list(x)) for i in range(3)]
        if rank_cols(Fd, vs, o.r) < 3:
            return False
    return True


def invariants(o):
    Fd, r, m = o.Fd, o.r, o.m
    J, dJ = o.J, o.dJ
    F1, F2 = o.fU[1], o.fU[2]
    o.rkL = rank_cols(Fd, F1 + F2 + J, r) - dJ
    # H : U -> Q x Q, x -> (F2 x, -F1 x)
    Hcols = [F2[j] + [Fd.neg(x) for x in F1[j]] for j in range(m)]
    J2 = [v + [Fd.c(0)] * r for v in J] + [[Fd.c(0)] * r + v for v in J]
    o.rkH = rank_cols(Fd, Hcols + J2, 2 * r) - 2 * dJ
    o.Ncoords = kernel_mod(Fd, Hcols, J2, 2 * r)  # coords in U
    o.dimN = len(o.Ncoords)
    o.Delta = 2 * o.rkH - o.rkL
    # S-hat
    f0N = [matvec(Fd, o.fU[0], c) for c in o.Ncoords]
    o.f0N = f0N
    if o.Ncoords:
        f1N = [matvec(Fd, F1, c) for c in o.Ncoords]
        f2N = [matvec(Fd, F2, c) for c in o.Ncoords]
        stacked = [a + b for a, b in zip(f1N, f2N)]
        sub = [v + [Fd.c(0)] * r for v in f0N] + [[Fd.c(0)] * r + v for v in f0N]
        sc = kernel_mod(Fd, stacked, sub, 2 * r)
        o.Shat = [matvec(Fd, [list(c) for c in o.Ncoords], s) for s in sc]
    else:
        o.Shat = []
    o.dimShat = len(o.Shat)
    # rho
    def rk_pencil(g1, g2):
        cols = [[Fd.add(Fd.mul(g1, x), Fd.mul(g2, y)) for x, y in zip(F1[j], F2[j])]
                for j in range(m)]
        return rank_cols(Fd, cols + J, r) - dJ
    if Fd.finite:
        o.rho = max(rk_pencil(g1, g2) for g1 in Fd.elements() for g2 in Fd.elements())
    else:
        # exact generic rank: a nonzero minor of the pencil (1,t) has degree <= m,
        # so among m+2 values of t at least one attains the generic rank.
        vals = [rk_pencil(Fd.c(1), Fd.c(t)) for t in range(m + 2)] + [rk_pencil(Fd.c(0), Fd.c(1))]
        o.rho = max(vals)
    o.rkF1 = rk_pencil(Fd.c(1), Fd.c(0))
    o.rkF2 = rk_pencil(Fd.c(0), Fd.c(1))
    o.rk_pencil = rk_pencil
    return o


def phi_kernel(o):
    """ker Phi as subspace of U^3 (coords 3m)."""
    Fd, r, m = o.Fd, o.r, o.m
    F1, F2, G = o.fU[1], o.fU[2], o.gU
    Z = [Fd.c(0)] * r
    neg = lambda v: [Fd.neg(x) for x in v]
    cols = []
    for j in range(m):   # u1
        cols.append(F1[j] + neg(G[j]) + Z)
    for j in range(m):   # u2
        cols.append(F2[j] + Z + neg(G[j]))
    for j in range(m):   # x
        cols.append(Z + F2[j] + neg(F1[j]))
    sub = ([v + Z + Z for v in o.J] + [Z + v + Z for v in o.J] + [Z + Z + v for v in o.J])
    return kernel_mod(Fd, cols, sub, 3 * r)


def all_subspaces(Fd, n):
    """All nonzero subspaces of GF(p)^n, enumerated as reduced row echelon forms."""
    out = []
    els = Fd.elements()
    for d in range(1, n + 1):
        for piv in itertools.combinations(range(n), d):
            # free positions: row i, column c > piv[i], c not a pivot
            free = [(i, c) for i in range(d) for c in range(piv[i] + 1, n) if c not in piv]
            for vals in itertools.product(els, repeat=len(free)):
                R = [[Fd.c(0)] * n for _ in range(d)]
                for i in range(d):
                    R[i][piv[i]] = Fd.c(1)
                for (i, c), v in zip(free, vals):
                    R[i][c] = v
                out.append(R)
    return out


def count_subspaces(p, n):
    tot = 0
    for d in range(1, n + 1):
        for piv in itertools.combinations(range(n), d):
            free = sum(1 for i in range(d) for c in range(piv[i] + 1, n) if c not in piv)
            tot += p ** free
    return tot


# ---------------------------------------------------------------- the checks
STATS = {"schemes": 0, "fail": []}


def fail(msg):
    STATS["fail"].append(msg)
    print("FAIL:", msg)


def check_scheme(Fd, T, m, label, rng, exhaustive_X=False):
    o = build(Fd, T, m)
    r = o.r
    assert brent_ok(Fd, T, m), "invalid scheme"
    s1, s2 = sn1(o), sn2(o)
    if Fd.finite and Fd.p ** (2 * m) <= 5000:
        s2b = sn2_bruteforce(o)
        if s2b != s2:
            fail("%s: SN2 flat-check %s vs brute force %s" % (label, s2, s2b))
    if not (s1 and s2):
        return None
    STATS["schemes"] += 1
    invariants(o)
    # ---- K-7 sanity used throughout
    # (T5): W(f_i(x)) = e_{i0} x
    for i in range(3):
        for k in range(2):
            for l in range(m):
                w = matvec(Fd, o.Wcols, o.f[i][k * m + l])
                exp = [Fd.c(0)] * (3 * m)
                if k == 0:
                    exp[i * m + l] = Fd.c(1)
                if w != exp:
                    fail("%s: T5" % label)
    # ---- K-14
    for i in range(3):
        for v in o.fU[i]:
            if matvec(Fd, o.Wcols, v) != [Fd.c(0)] * (3 * m):
                fail("%s: K-14(i) f_%d(U) not in K'" % (label, i))
    for v in o.gU:
        if matvec(Fd, o.Wcols, v) != [Fd.c(0)] * (3 * m):
            fail("%s: K-14(i) g(U) not in K'" % label)
    if o.dJ != m:
        fail("%s: K-14(i) dim J != m" % label)
    if o.dQ != r - 4 * m:
        fail("%s: K-14(i) dim Q != r-4m" % label)
    for j in range(2 * m):  # (ii) and (iii)
        lhs = [Fd.sub(Fd.mul(a, x), Fd.mul(b, y)) for a, x, b, y in
               zip(o.a[(1, 0)], o.f[2][j], o.a[(2, 0)], o.f[1][j])]
        if any(not Fd.iszero(z) for z in lhs):
            fail("%s: K-14(ii)" % label)
        for i in range(3):
            l1 = o.diag(o.a[(i, 0)], o.f[0][j])
            l2 = o.diag(o.a[(0, 0)], o.f[i][j])
            if l1 != l2:
                fail("%s: K-14(iii)" % label)
    # ---- K-15
    kp = phi_kernel(o)
    if len(kp) != o.dimN:
        fail("%s: K-15 dim ker Phi %d != dim N %d" % (label, len(kp), o.dimN))
    for v in kp:
        if any(not Fd.iszero(z) for z in v[:2 * m]):
            fail("%s: K-15 kernel vector with u1/u2 != 0" % label)
        if not in_span(Fd, v[2 * m:], [list(c) for c in o.Ncoords], m):
            fail("%s: K-15 kernel x not in N" % label)
    if o.dimN != m - o.rkH:
        fail("%s: dim N != m - rk H" % label)
    if not (2 * m + o.rkH <= o.rkL + 2 * o.dQ):
        fail("%s: (G) violated" % label)
    # ---- K-16
    if not (o.dimShat >= o.dimN - o.Delta):
        fail("%s: K-16 violated" % label)
    # ---- K-17
    if not (o.Delta >= min(2, o.dimN)):
        fail("%s: K-17 violated" % label)
    # the K-13 consequence used in K-17/K-19
    if o.dimShat > 0 and not (o.dimShat + 2 <= o.dimN):
        fail("%s: dim S^ + 2 <= dim N violated" % label)
    # ---- K-13: subspaces X
    n = 2 * m
    if exhaustive_X:
        Xs = all_subspaces(Fd, n)
    else:
        Xs = []
        for _ in range(60):
            d = rng.randint(1, n)
            R, _ = rref(Fd, [[Fd.rand(rng) for _ in range(n)] for _ in range(d)], n)
            if R:
                Xs.append(R)
    nX = 0
    for X in Xs:
        imgs = [matvec(Fd, o.f[i], x) for i in range(3) for x in X]
        if rank_cols(Fd, imgs, r) < len(X) + 2:
            fail("%s: K-13 violated for X of dim %d" % (label, len(X)))
        nX += 1
    # ---- K-20 (a)
    if not (o.rkH >= o.rho and o.rkL <= 2 * o.rho):
        fail("%s: K-20(a) violated" % label)
    rec = dict(label=label, field=Fd.name, m=m, r=r, dQ=o.dQ, rkL=o.rkL, rkH=o.rkH,
               dimN=o.dimN, Delta=o.Delta, dimS=o.dimShat, rho=o.rho, nX=nX,
               eq20b=(o.rkL == 2 * o.rho), rho_eq_m=(o.rho == m))
    return rec


def make(Fd, base, m, rng, nmoves, tries=400):
    T0 = base(m, Fd)
    T1 = random_moves(Fd, T0, m, rng, nmoves)
    assert brent_ok(Fd, T1, m)
    for _ in range(tries):
        S = mrand(Fd, 3, 3, rng)
        Tm = mrand(Fd, 2, 2, rng)
        if minv(Fd, S) is None or minv(Fd, Tm) is None:
            continue
        T2 = basis_change(Fd, T1, S, Tm)
        o = build(Fd, T2, m)
        if sn1(o) and sn2(o):
            return T2
    return None


def main(seed=1):
    rng = random.Random(seed)
    recs = []
    fields = [GF(2), GF(3), GF(5), GF(7), QQ()]
    for Fd in fields:
        for m in (1, 2, 3):
            for base_name, base in (("naive", naive), ("strassen", strassen_block)):
                for nm in (0, 1, 3, 6):
                    T = make(Fd, base, m, rng, nm)
                    if T is None:
                        continue
                    exh = Fd.finite and count_subspaces(Fd.p, 2 * m) <= 3000
                    rec = check_scheme(Fd, T, m, "%s/%s/m=%d/moves=%d" % (Fd.name, base_name, m, nm),
                                       rng, exhaustive_X=exh)
                    if rec:
                        recs.append(rec)
    return recs


def enumerate_cases(m, r):
    """All integer (rkL, rkH, s) allowed by: rkL <= q, (G), K-17, K-16, K-13
    (s >= 1 => s + 2 <= dim N), 0 <= s <= dim N, 0 <= rkH <= m."""
    q = r - 4 * m
    out = []
    if q < 0:
        return out
    for rkL in range(0, q + 1):
        for rkH in range(0, m + 1):
            dimN = m - rkH
            Delta = 2 * rkH - rkL
            if not (2 * m + rkH <= rkL + 2 * q):
                continue
            if not (Delta >= min(2, dimN)):
                continue
            for s in range(0, dimN + 1):
                if s < dimN - Delta:
                    continue
                if s >= 1 and s + 2 > dimN:
                    continue
                out.append((rkL, rkH, dimN, Delta, s))
    return out


if __name__ == "__main__":
    seed = int(sys.argv[1]) if len(sys.argv) > 1 else 1
    print("== integer case analysis (K-18(a), K-19), m = 7 ==")
    for r in range(28, 36):
        print("r=%d q=%d cases (rkL,rkH,dimN,Delta,dimS):" % (r, r - 28), enumerate_cases(7, r))
    print("== schemes ==")
    recs = main(seed)
    for rec in recs:
        print(rec)
    print("schemes checked:", STATS["schemes"], "failures:", len(STATS["fail"]))
```

### Anhang B: `synthetic.py`

Aufruf: `python3 synthetic.py 2 (importiert check_k13_k20.py)`. SHA-256 `5c7cdca543dc32e4abc8b13bea50630deaaab9b1a55db8bbda560ab3f1981e91`.

```python
#!/usr/bin/env python3
"""Synthetic models for K-13, K-16, K-17, K-20 with N != 0 and S^ != 0.

These links use only: diagonal D(e_{i0}) with (SN1), an injective calB,
U = {row 0 = 0}, J = f_0(U), and maps into K^r/J (ranks into Q = K'/J
equal ranks into K^r/J because J <= K' <= K^r).  So we choose
a_1, a_2 in K^r (a_0 = 1, i.e. normalised D(e_00) = Id) and calB freely,
with q-vectors (calB on U) built as polynomial multiples of a vector v,
which forces N != 0.  (SN2) is checked exactly.
"""
import random, sys, itertools
sys.path.insert(0, '.')
from check_k13_k20 import (GF, QQ, rank_cols, kernel_mod, matvec, rref,
                           all_subspaces, count_subspaces, in_span)

def mono_vectors(Fd, a1, a2, v, deg):
    out = []
    for d in range(deg + 1):
        for i in range(d + 1):
            j = d - i
            w = list(v)
            for _ in range(i):
                w = [Fd.mul(x, y) for x, y in zip(a1, w)]
            for _ in range(j):
                w = [Fd.mul(x, y) for x, y in zip(a2, w)]
            out.append(w)
    return out

class Model:
    pass

def make_model(Fd, rng, r, m, mode):
    M = Model(); M.Fd, M.r, M.m = Fd, r, m
    rnd = lambda: Fd.rand(rng)
    if Fd.finite:
        # few distinct a-points so that fibres are large (degenerate positions)
        npts = rng.randint(2, min(Fd.p * Fd.p, 9))
        pts = [(rnd(), rnd()) for _ in range(npts)]
        lab = [rng.randrange(npts) for _ in range(r)]
    else:
        npts = rng.randint(2, 9)
        pts = [(Fd.c(rng.randint(-3, 3)), Fd.c(rng.randint(-3, 3))) for _ in range(npts)]
        lab = [rng.randrange(npts) for _ in range(r)]
    M.a1 = [pts[l][0] for l in lab]
    M.a2 = [pts[l][1] for l in lab]
    v = [rnd() for _ in range(r)]
    if mode == "P2":           # q-span = v * P_2 (+ random), forces S^ != 0
        qs = mono_vectors(Fd, M.a1, M.a2, v, 2)[:m]
    elif mode == "module":       # q-span = v * P_d (truncated), forces N != 0
        qs = mono_vectors(Fd, M.a1, M.a2, v, 3)
        rng.shuffle(qs)
        qs = qs[:m]
    elif mode == "two":       # two generators
        w = [rnd() for _ in range(r)]
        qs = mono_vectors(Fd, M.a1, M.a2, v, 1) + mono_vectors(Fd, M.a1, M.a2, w, 1)
        qs = qs[:m]
    else:                      # random
        qs = [[rnd() for _ in range(r)] for _ in range(m)]
    while len(qs) < m:
        qs.append([rnd() for _ in range(r)])
    ps = [[rnd() for _ in range(r)] for _ in range(m)]
    M.Bcols = ps + qs               # columns: row-0 coords then row-1 coords (= U)
    return M

def objects(M):
    Fd, r, m = M.Fd, M.r, M.m
    if rank_cols(Fd, M.Bcols, r) != 2 * m:
        return False
    mul = lambda a, v: [Fd.mul(x, y) for x, y in zip(a, v)]
    M.f = {0: M.Bcols, 1: [mul(M.a1, c) for c in M.Bcols], 2: [mul(M.a2, c) for c in M.Bcols]}
    M.fU = {i: M.f[i][m:] for i in range(3)}
    return True

def sn2(M):
    Fd, r, m = M.Fd, M.r, M.m
    pts = [[Fd.c(1), M.a1[t], M.a2[t]] for t in range(r)]
    Brows = [[c[t] for c in M.Bcols] for t in range(r)]
    if rank_cols(Fd, pts, 3) <= 2:
        return False
    planes = set()
    for s in range(r):
        for u in range(s + 1, r):
            if rank_cols(Fd, [pts[s], pts[u]], 3) == 2:
                planes.add(frozenset(t for t in range(r)
                                     if rank_cols(Fd, [pts[s], pts[u], pts[t]], 3) == 2))
    for Z in planes:
        rows = [Brows[t] for t in range(r) if t not in Z]
        if not rows or rank_cols(Fd, rows, 2 * m) < 2 * m:
            return False
    return True

def invariants(M):
    Fd, r, m = M.Fd, M.r, M.m
    J = M.fU[0]; dJ = rank_cols(Fd, J, r)
    F1, F2 = M.fU[1], M.fU[2]
    M.rkL = rank_cols(Fd, F1 + F2 + J, r) - dJ
    neg = lambda v: [Fd.neg(x) for x in v]
    Z = [Fd.c(0)] * r
    Hcols = [F2[j] + neg(F1[j]) for j in range(m)]
    J2 = [v + Z for v in J] + [Z + v for v in J]
    M.rkH = rank_cols(Fd, Hcols + J2, 2 * r) - 2 * dJ
    M.Nc = kernel_mod(Fd, Hcols, J2, 2 * r)
    M.dimN = len(M.Nc)
    M.Delta = 2 * M.rkH - M.rkL
    f0N = [matvec(Fd, J, c) for c in M.Nc]
    if M.Nc:
        st = [matvec(Fd, F1, c) + matvec(Fd, F2, c) for c in M.Nc]
        sub = [v + Z for v in f0N] + [Z + v for v in f0N]
        sc = kernel_mod(Fd, st, sub, 2 * r)
        M.Shat = [matvec(Fd, [list(c) for c in M.Nc], s) for s in sc]  # U-coords
    else:
        M.Shat = []
    M.dimS = len(M.Shat)
    def rkp(g1, g2):
        cols = [[Fd.add(Fd.mul(g1, x), Fd.mul(g2, y)) for x, y in zip(F1[j], F2[j])] for j in range(m)]
        return rank_cols(Fd, cols + J, r) - dJ
    if Fd.finite:
        M.rho = max(rkp(a, b) for a in Fd.elements() for b in Fd.elements())
    else:
        M.rho = max([rkp(Fd.c(1), Fd.c(t)) for t in range(m + 2)] + [rkp(Fd.c(0), Fd.c(1))])
    M.rkF1, M.rkF2 = rkp(Fd.c(1), Fd.c(0)), rkp(Fd.c(0), Fd.c(1))
    return M

FAILS = []
def check(M, label, rng, exhaustive):
    Fd, r, m = M.Fd, M.r, M.m
    if not (M.dimS >= M.dimN - M.Delta):
        FAILS.append((label, "K-16"))
    if not (M.Delta >= min(2, M.dimN)):
        FAILS.append((label, "K-17"))
    if M.dimS > 0 and not (M.dimS + 2 <= M.dimN):
        FAILS.append((label, "K-17 step"))
    if not (M.rkH >= M.rho and M.rkL <= 2 * M.rho):
        FAILS.append((label, "K-20(a)"))
    n = 2 * m
    # K-13 on subspaces: exhaustive if small, else random + N + S^ (embedded in K^{2m})
    if exhaustive:
        Xs = all_subspaces(Fd, n)
    else:
        Xs = []
        for _ in range(40):
            d = rng.randint(1, n)
            R, _ = rref(Fd, [[Fd.rand(rng) for _ in range(n)] for _ in range(d)], n)
            if R: Xs.append(R)
    emb = lambda u: [Fd.c(0)] * m + list(u)
    for B in (M.Nc, M.Shat):
        if B:
            Xs.append([emb(u) for u in B])
    for X in Xs:
        imgs = [matvec(Fd, M.f[i], x) for i in range(3) for x in X]
        if rank_cols(Fd, imgs, r) < len(X) + 2:
            FAILS.append((label, "K-13 dim X=%d" % len(X)))
    return len(Xs)

def main(seed):
    rng = random.Random(seed)
    stats = {}
    b_cases = []
    for Fd in (GF(2), GF(3), GF(5), QQ()):
        for m in (2, 3, 4, 6, 7):
            for mode in ("P2", "module", "two", "random"):
                for rep in range(4 if Fd.finite else 2):
                    r = rng.randint(3 * m, 3 * m + 8)
                    for attempt in range(200):
                        M = make_model(Fd, rng, r, m, mode)
                        if objects(M) and sn2(M):
                            break
                    else:
                        continue
                    invariants(M)
                    exh = Fd.finite and count_subspaces(Fd.p, 2 * m) <= 300
                    nX = check(M, "%s m=%d r=%d %s" % (Fd.name, m, r, mode), rng, exh)
                    key = (Fd.name, M.dimN, M.dimS)
                    stats[key] = stats.get(key, 0) + 1
                    if M.rkL == 2 * M.rho:
                        b_cases.append((Fd.name, m, r, mode, M.rho, M.dimN))
                    if M.dimS > 0:
                        print("  nontrivial:", Fd.name, "m=%d r=%d %s" % (m, r, mode), "rkL", M.rkL, "rkH", M.rkH, "dimN", M.dimN, "Delta", M.Delta, "dimS", M.dimS, "rho", M.rho, "nX", nX, flush=True)
    return stats, b_cases

if __name__ == "__main__":
    seed = int(sys.argv[1]) if len(sys.argv) > 1 else 1
    stats, b_cases = main(seed)
    print("histogram (field, dim N, dim S^) -> count")
    for k in sorted(stats): print("  ", k, stats[k])
    print("cases with rk L = 2 rho (K-20(b) premise), (field, m, r, mode, rho, dimN):")
    for c in b_cases: print("  ", c, "rho==m" if c[4] == c[1] else "RHO != m")
    print("number of K-20(b)-premise cases:", len(b_cases))
    print("failures:", FAILS)
```

### Anhang C: `focused.py`

Aufruf: `python3 focused.py 3 (importiert synthetic.py, check_k13_k20.py)`. SHA-256 `f3e57803251c113b5727e055daec8fd2e53540434e0a21799bddc8d009249967`.

```python
#!/usr/bin/env python3
"""Focused synthetic runs with S^ != 0 (v * P_2 construction), incl. char 2 via GF(4)."""
import random, sys
sys.path.insert(0, '.')
import synthetic as S
from check_k13_k20 import GF, QQ

class GF4:
    """GF(4) = GF(2)[w]/(w^2+w+1); elements 0,1,2=w,3=w+1 as bit vectors."""
    p = 4; name = "GF(4)"; finite = True
    def c(self, x): return x & 3 if x >= 0 else (x % 2)   # integers map via char 2
    def add(self, a, b): return a ^ b
    def sub(self, a, b): return a ^ b
    def neg(self, a): return a
    def mul(self, a, b):
        r = 0
        for i in range(2):
            if (b >> i) & 1: r ^= a << i
        if r & 4: r ^= 0b111
        return r
    def inv(self, a):
        assert a
        for b in range(1, 4):
            if self.mul(a, b) == 1: return b
    def iszero(self, a): return a == 0
    def rand(self, rng): return rng.randrange(4)
    def elements(self): return [0, 1, 2, 3]

# sanity of GF4 arithmetic
F4 = GF4()
for a in range(4):
    for b in range(4):
        for c in range(4):
            assert F4.mul(a, F4.add(b, c)) == F4.add(F4.mul(a, b), F4.mul(a, c))
            assert F4.mul(a, F4.mul(b, c)) == F4.mul(F4.mul(a, b), c)
assert all(F4.mul(a, F4.inv(a)) == 1 for a in range(1, 4))

def run(seed):
    rng = random.Random(seed)
    hist = {}
    for Fd in (GF4(), GF(3), GF(5), GF(7), QQ()):
        for m in (6, 7):
            got = 0
            for rep in range(40):
                if got >= 4: break
                r = rng.randint(3 * m, 3 * m + 6)
                for attempt in range(300):
                    M = S.make_model(Fd, rng, r, m, "P2")
                    if S.objects(M) and S.sn2(M):
                        break
                else:
                    continue
                S.invariants(M)
                nX = S.check(M, "%s m=%d r=%d P2" % (Fd.name, m, r), rng, False)
                hist[(Fd.name, M.dimN, M.dimS)] = hist.get((Fd.name, M.dimN, M.dimS), 0) + 1
                if M.dimS > 0:
                    got += 1
                    print("  nontrivial:", Fd.name, "m=%d r=%d" % (m, r), "rkL", M.rkL, "rkH", M.rkH,
                          "dimN", M.dimN, "Delta", M.Delta, "dimS", M.dimS, "rho", M.rho,
                          "rkF1", M.rkF1, "rkF2", M.rkF2, "subspaces X tested", nX, flush=True)
    print("histogram:", sorted(hist.items()))
    print("failures:", S.FAILS)

if __name__ == "__main__":
    run(int(sys.argv[1]) if len(sys.argv) > 1 else 3)
```

### Anhang D: `enum_variants.py`

Aufruf: `python3 enum_variants.py`. SHA-256 `113bd6453a089c4595df1b175ca8d2581cb2090ad83c421f682649b092368361`.

```python
#!/usr/bin/env python3
"""Integer case analysis for <3,2,7>: r = 28..35, and r = 34 with one condition dropped."""
m = 7

def cases(r, use17=True, use16=True, use13=True):
    q = r - 4 * m
    out = []
    for rkL in range(q + 1):
        for rkH in range(m + 1):
            dimN = m - rkH
            D = 2 * rkH - rkL
            if not 2 * m + rkH <= rkL + 2 * q:          # (G), K-15
                continue
            if use17 and not D >= min(2, dimN):          # K-17
                continue
            for s in range(dimN + 1):
                if use16 and s < dimN - D:               # K-16
                    continue
                if use13 and s >= 1 and s + 2 > dimN:    # K-13 with X = S^
                    continue
                out.append((rkL, rkH, dimN, D, s))
    return out

for r in range(28, 36):
    c = cases(r)
    print("r=%d: %d case(s)" % (r, len(c)), c if len(c) <= 13 else "")
print("r=34 without K-17:", cases(34, use17=False))
print("r=34 without K-16:", cases(34, use16=False))
print("r=34 without K-13 step:", cases(34, use13=False))
```

### Anhang E: `char2.py`

Aufruf: `python3 char2.py 5 (importiert synthetic.py, focused.py)`. SHA-256 `974b7958780b4af62d0da3da391399df0c3c54e35e4fb758be999bd3de876432`.

```python
#!/usr/bin/env python3
"""Char-2 run (GF(4)) of the v*P_2 model with more coordinates and more a-points."""
import random, sys
sys.path.insert(0, '.')
import synthetic as S
from focused import GF4

def make_model_wide(Fd, rng, r, m):
    M = S.Model(); M.Fd, M.r, M.m = Fd, r, m
    pts = [(a, b) for a in Fd.elements() for b in Fd.elements()]
    rng.shuffle(pts)
    pts = pts[:rng.randint(8, 16)]
    lab = [rng.randrange(len(pts)) for _ in range(r)]
    M.a1 = [pts[l][0] for l in lab]; M.a2 = [pts[l][1] for l in lab]
    v = [Fd.rand(rng) for _ in range(r)]
    qs = S.mono_vectors(Fd, M.a1, M.a2, v, 2)[:m]
    while len(qs) < m:
        qs.append([Fd.rand(rng) for _ in range(r)])
    ps = [[Fd.rand(rng) for _ in range(r)] for _ in range(m)]
    M.Bcols = ps + qs
    return M

rng = random.Random(int(sys.argv[1]) if len(sys.argv) > 1 else 5)
F = GF4()
hist = {}
for m in (6, 7):
    got = 0
    for rep in range(30):
        if got >= 3: break
        r = rng.randint(30, 40)
        for attempt in range(100):
            M = make_model_wide(F, rng, r, m)
            if S.objects(M) and S.sn2(M):
                break
        else:
            continue
        S.invariants(M)
        nX = S.check(M, "GF(4) m=%d r=%d P2" % (m, r), rng, False)
        hist[(M.dimN, M.dimS)] = hist.get((M.dimN, M.dimS), 0) + 1
        if M.dimS > 0:
            got += 1
            print("  nontrivial: GF(4) m=%d r=%d" % (m, r), "rkL", M.rkL, "rkH", M.rkH, "dimN", M.dimN,
                  "Delta", M.Delta, "dimS", M.dimS, "rho", M.rho, "subspaces X tested", nX, flush=True)
print("histogram GF(4):", sorted(hist.items()))
print("failures:", S.FAILS)
```

