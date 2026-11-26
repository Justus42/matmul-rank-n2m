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
2. **Modelle mit N ≠ 0 und Ŝ ≠ 0.** In echten kleinen Verfahren ist N stets 0 (nach (G) ist N ≠ 0 erst bei r < 5m erzwungen, siehe 3.3). K-13, K-16, K-17 und K-20 benutzen aber nur: die Diagonalmatrizen D(e_{i0}) mit (SN1), ein injektives ℬ, U, J = f_0(U) und Abbildungen nach Q = K′/J, deren Ränge mit denen nach K^r/J übereinstimmen (J ⊆ K′ ⊆ K^r). Ich wähle deshalb a_1, a_2 ∈ K^r (normiert a_0 = 1) mit wenigen a-Punkten (große Fasern, entartete Lagen) und die q-Vektoren als v·P_2 = {v, a_1v, a_2v, a_1²v, a_1a_2v, a_2²v} (eventuell mit Zufallsvektoren ergänzt). Das erzwingt N ⊇ v·P_1 und Ŝ ∋ v. (SN2) wird exakt geprüft.
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
- zum Vergleich r = 35 (dim Q = 7): 13 Fälle bleiben; die Schranke ist also bei 34 scharf in dem Sinn, dass erst dort die Fallunterscheidung auf einen Fall zusammenfällt.

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

**Rechnung.** (a) in allen echten Verfahren und Modellen erfüllt (ρ über GF(p) durch Durchlaufen aller γ ∈ GF(p)², über ℚ exakt als generischer Rang: ein von 0 verschiedener Minor des Büschels (1, t) hat Grad ≤ m, also erreichen unter m + 2 Werten von t einer den generischen Rang; dazu γ = (0, 1)). Fälle mit rk L = 2ρ (Prämisse von (b)) traten in den Modellen 44-mal auf und in vielen echten Verfahren; in allen war ρ = m, auch über GF(p) und ℚ, die nicht algebraisch abgeschlossen sind. Eine Gegenprobe zur Notwendigkeit der Abgeschlossenheit habe ich nicht gesucht; der Beweis braucht sie nur für den Eigenvektor in Schritt 7.

**Urteil K-20: bestätigt.** Kleine Ungenauigkeiten: unerklärtes d, F statt K in der Definition von ρ, (D1) nicht in der Liste, Zwischenschritt N = 0 ⇒ ρ = m nicht ausgeschrieben. K-20 geht laut Z. 30 und Z. 806 nicht in den Endsatz ein; das habe ich in der Tabelle Z. 753 bis 806 bestätigt gefunden (K-20 hat „benutzt von: –“).

---

## 4. Zusammenfassung der Rechnung

ERGEBNISSE_PLATZHALTER

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

ANHANG_PLATZHALTER
