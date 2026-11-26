# Bericht S5-19: Prüfung des neuen Wortlauts von K-40

Rolle: Prüfer. Gegenstand: Glied K-40 in `lean/prosa/s5_327_k40.md` (Stand fa1b7aa), Wortlaut Zeilen 49–53, Beweis Zeilen 68–88, dazu die Wortlaute Zeilen 101–111. Zitierte Glieder aus `lean/prosa/s5_327_kette.md` (Stand d6469d8) werden mit ihrem Wortlaut als gegeben genommen. Den Status setzt der Orchestrator; dieser Bericht enthält nur Urteile je Teil.

## 0. Offenlegung

**Eingeblendete Einträge des Projektgedächtnisses.** Mir waren drei Einträge eingeblendet:

1. Der Index `MEMORY.md` (Projekt, Ziel, Regeln der Stufe 5, Arbeitsweise des Orchestrators, Hinweise zu Bridge, Merge und Literaturwache, Verweise auf `verfahren-datenformat` und `lean-project-ci`). Er enthält nach eigener Angabe nichts über Behauptungen oder Prüfstände, und ich habe darin nichts über K-40 oder ein Urteil zu K-40 gesehen. Er nennt allgemein, dass die Kette „zu 3×2×7 ohne Lean“ gefestigt werden soll.
2. `gemini-bridge.md` (Bridge-Freigaben, Zeitlimit, Hinweis zur Unabhängigkeit beim Fremdmodell).
3. `aussagen-abgleich-n3.md` (Bridge-Hinweis, lokaler Lean-Bau).

Keiner der Einträge enthält ein Urteil zu K-40 oder das erwünschte Ergebnis. Ich habe nichts ins Gedächtnis geschrieben.

**Was ich außerhalb der Positivliste gesehen habe.**
- Aus `PROTOKOLL.md` habe ich mit `grep -n "^## "` die Abschnittsüberschriften gelesen, um Abschnitt 5 abzugrenzen (Zeilen 206–260). Sonst nichts aus dem Protokoll.
- Ich habe `git status` und `git rev-parse HEAD origin/main` ausgeführt (beide zeigten `dc1c993`) und geprüft, dass die Commits fa1b7aa und d6469d8 vorhanden sind. Kein `git log`.
- Ich habe `s5_327_kette.md` (Stand d6469d8) in eine Notizdatei außerhalb des Repos geschrieben, aber nur die freigegebenen Zeilenbereiche ausgegeben. Bei `s5_327_k40.md` habe ich ebenso nur die freigegebenen Bereiche ausgegeben, dazu einmal die ersten 70 Zeichen der Zeilen 101, 103, 107, 111, 113, 114, 120, 122, 130, 131, 149, um die Zeilennummern zu sichern; alle liegen in freigegebenen Bereichen.
- Der Dateiname `s5_kette_bericht_*` ist mir aus dem Auftrag bekannt; Inhalte solcher Dateien habe ich nicht gesehen. Die Datei für diesen Bericht gab es auf `main` noch nicht.
- Die Zeilen 130–149 von `s5_327_k40.md` (Tabelle der Zitate) nennen Zeile 381 der Kette als Rahmen von K-23 und Zeile 616 (Liste von K-35). Zeile 616 war freigegeben, Zeile 381 nicht; ich habe sie nicht gelesen.

## 1. Was geprüft wird

**Wortlaut K-40 (Zeilen 49–53), kurz:** V Verfahren der Länge 34 für ⟨3,2,7⟩ über F, aufgefasst über K = F̄.
- (a) Für jedes (S, T) ∈ 𝒢* gibt es in der Normalform V̂ ein v ∈ Ŝ, v ≠ 0; für jedes solche v sind w = f_0(v) und e = dim(w·P_2) − 3 nach K-23 erklärt, e ∈ {2, 3}, und weder e noch Σ hängt von v ab. 𝒢_3 ist wohldefiniert, und (S, T) ∉ 𝒢_3 ⇔ e = 2 (für (S, T) ∈ 𝒢*).
- (b) 𝒢_3 ≠ ∅.

**Benutzte Begriffe aus Abschnitt 1 der Kette:** Verfahren (1.1), Ŝ, N, f_0 (1.2), (SN1), (SN2), V^{(S,T)}, 𝒢, 𝒢*, Normalform (1.3), P_d, Wirkung f·v, ξ(t), Σ, Y, Ω (1.4).

## 2. Teil (a), Schritt für Schritt

**(a.1) K ist unendlich.** Sei K = {k_1, …, k_n} endlich; n ≥ 2, weil 0 ≠ 1 in K. Das Polynom h(x) = Π_i (x − k_i) + 1 hat Grad n ≥ 1 und h(k_j) = 0 + 1 = 1 ≠ 0 für jedes j. Ein nichtkonstantes Polynom ohne Nullstelle widerspricht der algebraischen Abgeschlossenheit. Also ist K unendlich. Damit ist die Rahmenbedingung „Sei K ein unendlicher Körper“ von K-4 (Zeile 146) erfüllt. Nachgerechnet, richtig.

Nebenbemerkung: Der Satz in Zeile 57, dass K-11, K-34, K-39 dieselbe Tatsache über K-1 und K-5 benutzen, liegt außerhalb meiner Positivliste und wird für K-40 nicht gebraucht. Nicht geprüft.

**(a.2) Existenz von v.**
- V ist ein Verfahren über F; aufgefasst über K ist es ein Verfahren über K (K-8, siehe 1.3 Zeile 82 und Zeile 552). Damit ist 𝒢* für V erklärt (1.3, Zeile 85).
- Für (S, T) ∈ 𝒢* liefert **K-12** (Zeile 241), mit r = 34, m = 7: V̂ ist ein Verfahren der Länge 34 über K mit (SN1), (SN2). Dass V̂ wieder ein Verfahren *für ⟨3,2,7⟩* ist, sagt der Wortlaut von K-12 nicht ausdrücklich („ein Verfahren der Länge r über K“). Es folgt aber aus der Definition 1.3: α̂_t wirkt auf K^{3×2}, β̂_t auf K^{2×7}, Ĉ_t ∈ K^{3×7}. Außerdem deckt der Wortlaut von **K-19** (Zeile 337) diesen Fall ausdrücklich: „Insbesondere gilt das für jede Normalform eines Verfahrens der Länge 34 (K-12).“ Kleine Ungenauigkeit im Zitat, keine Lücke.
- **K-19** (Zeilen 337–339) liefert dim Ŝ = 1, Ŝ gebildet für V̂ (1.4, Zeile 91). Also existiert v ∈ Ŝ, v ≠ 0.
- Damit ist die Annahme von **K-23** (Zeile 423) „In V̂ sei v ∈ Ŝ mit v ≠ 0“ erfüllt. Der Rahmen von K-23 (V̂ Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ über K = F̄) ist erfüllt, soweit ich ihn sehen kann: Zeile 494 sagt „Rahmen wie in Abschnitt 5: V̂ ist eine Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ über K = F̄“, und 1.4 (Zeile 91) hat dieselbe Form. Zeile 381 selbst habe ich nicht gesehen (nicht freigegeben).
- **K-23 (e)** (Zeile 428): e = dim(w·P_2) − 3 ∈ {2, 3}. Richtig zitiert.

Ergebnis: Die Existenzaussage und e ∈ {2, 3} folgen. Nachgerechnet.

**(a.3) Unabhängigkeit von v.** Seien v, v′ ∈ Ŝ ∖ {0}. Wegen dim Ŝ = 1 ist v′ = c·v mit c ∈ K, und c ≠ 0, weil v′ ≠ 0. f_0 ist linear (1.2, f_0(x) = D(e_{00})·ℬ(x), beides linear in x), also w′ = c·w. Für g ∈ P_2 und jedes t ist (g·w′)_t = g(ξ(t))·c·w_t = c·(g·w)_t, also g·w′ = c·(g·w). Da w·P_2 ein Unterraum ist und c ≠ 0, folgt w′·P_2 = c·(w·P_2) = w·P_2. Damit ist e gleich. Wegen c ≠ 0 ist w′_t ≠ 0 ⇔ w_t ≠ 0, also ist Σ gleich. Der Beweis führt sowohl den Weg über K-23 (a) („bis auf einen Faktor ≠ 0 eindeutig“) als auch den direkten Weg über dim Ŝ = 1 an. Der direkte Weg braucht nur K-19 und die Linearität von f_0 und ist unabhängig davon, wie man „bis auf einen Faktor eindeutig“ in K-23 (a) liest. Beide tragen. Nachgerechnet, im Anhang zusätzlich an Zahlen geprüft.

Es wird hier stillschweigend benutzt, dass die Normalform zu (S, T) eindeutig durch (S, T) bestimmt ist. Das stimmt nach Definition 1.3 (Zeilen 76–78, 86): V^{(S,T)} ist durch Formeln gegeben, die Skalierung ebenso. Also hängen ξ(t), Ŝ, f_0 und damit e und Σ nur von (S, T) und der Wahl von v ab, und die Wahl von v ist mit (a.3) beseitigt.

**(a.4) Wohldefiniertheit von 𝒢_3 und die Äquivalenz.** 𝒢_3 = {(S, T) ∈ 𝒢* : in der Normalform zu (S, T) ist e = 3} (K-34, Zeile 593). Nach (a.2), (a.3) ist e eine Funktion auf 𝒢*. Für (S, T) ∈ 𝒢*: (S, T) ∉ 𝒢_3 ⇔ e ≠ 3 ⇔ e = 2, weil e ∈ {2, 3}. Richtig.

**Urteil (a): bestätigt.**

## 3. Teil (b), Schritt für Schritt

**Annahme und Verneinung.** Angenommen 𝒢_3 = ∅. Dann gilt für jedes (S, T) ∈ 𝒢*: (S, T) ∉ 𝒢_3, also nach (a) e = 2. Die Verneinung ist richtig gebildet: „∃ (S, T) ∈ 𝒢* mit e = 3“ verneint ist „∀ (S, T) ∈ 𝒢*: e ≠ 3“, und das ist mit e ∈ {2, 3} gleich „∀: e = 2“.

**Familie aus K-39.** Rahmen von K-39 (Zeile 714): „Sei V wie in Abschnitt 7“, und Abschnitt 7 (Zeile 552) ist genau der Rahmen von K-40. K-39 liefert S invertierbar, 𝒫 ⊆ P¹(K) unendlich und für jedes [p] ∈ 𝒫 einen Vertreter p und T_p ∈ GL_2(K) mit erster Zeile p und (S, T_p) ∈ 𝒢* ∩ 𝒢_gen. Für jedes [p] wird ein solches Paar (p, T_p) fest gewählt. Weil p die erste Zeile einer invertierbaren Matrix ist, gilt p ≠ 0; für [p] ≠ [p̃] folgt daraus p̃ ∉ K·p (sonst p̃ = c·p mit c ≠ 0, also [p̃] = [p]). Dies wird in Schritt 3 gebraucht und ist richtig.

**Objekte je p.** V̂_p Normalform zu (S, T_p). Nach (a) existiert v_p; w^{(p)}, Σ_p sind erklärt, Σ_p hängt nicht von v_p ab. Nach der Annahme ist e = 2 in V̂_p.
- **K-30** (Zeilen 525–527), Rahmen Zeile 494 (V̂ Normalform eines Verfahrens der Länge 34 über K = F̄): erfüllt. Die Bedingung „In V̂ gelte e = 2“: erfüllt. K-30 spricht von „w“ ohne Wahl; da die Aussage (a) von K-30 nur den Kern von g ↦ w·g und die Menge Σ benutzt und beide sich unter w ↦ c·w (c ≠ 0) nicht ändern (Kern: g·(cw) = 0 ⇔ g·w = 0), ist es gleich, welches erlaubte w man nimmt. Mit w = w^{(p)} liefert K-30 (a) ein g_0^{(p)} vom Grad genau 2 mit g_0^{(p)}(ξ_p(t)) = 0 für alle t ∈ Σ_p, und K-30 (b) die Irreduzibilität der Homogenisierung.
- **K-35** (Zeile 607): Voraussetzung (S, T_p) ∈ 𝒢* ∩ 𝒢_gen: erfüllt nach K-39. Rahmen: Abschnitt 7 (Zeile 552), erfüllt. Y und Ω sind über den Rang der Koeffizientenmatrix von α_t (des Verfahrens V, nicht V̂_p) erklärt; der Rang einer festen Matrix hängt nicht von p ab. Also sind Y, Ω für alle p dieselben. (G4) und (G5) benutzen w nur über Σ bzw. über „w(z) ≠ 0“, also nur über den Träger, der nach (a.3) nicht von der Wahl abhängt. Hier gibt es keine Mehrdeutigkeit.

**Schritt 1 (Schubfach).** Die Abbildung [p] ↦ Σ_p geht von der unendlichen Menge 𝒫 in die Potenzmenge von {1, …, 34} mit 2^34 Elementen. Sie ist wohldefiniert, weil T_p fest gewählt ist und Σ_p nach (a) nicht von v_p abhängt. Eine Abbildung einer unendlichen Menge in eine endliche Menge hat eine unendliche Faser. Also gibt es Σ* und 𝒫* ⊆ 𝒫 unendlich mit Σ_p = Σ* auf 𝒫*. Richtig.

**Schritt 2 (fester Kegelschnitt).**
1. Für t ∈ Y gilt nach **K-33 (ii)** (Zeile 577) a(t) = Sᵀx/(s_0ᵀx) mit α_t = x·yᵀ; der a-Punkt „hängt nur von S ab, nicht von T“. Da alle Paare (S, T_p) dasselbe S haben und in 𝒢* liegen, ist ξ_p(t) =: ξ(t) für t ∈ Y unabhängig von p. (Die Formel ist homogen vom Grad 0 in x, also auch unabhängig von der Wahl der Zerlegung α_t = x·yᵀ.) Den Einleitungssatz von K-33 vor Zeile 577 habe ich nicht gesehen; die Tabelle (Zeile 141) nennt als Voraussetzung (S, T_p) ∈ 𝒢*, und (S, T_p) ∈ 𝒢* ∩ 𝒢_gen ist hier sogar mehr. Ich sehe keinen Anlass zu einem Zweifel, kann den Einleitungssatz aber nicht abgleichen.
2. Für [p] ∈ 𝒫*: {ξ_p(t) : t ∈ Y ∩ Σ_p} = {ξ(t) : t ∈ Y ∩ Σ*} =: Π_1. Das ist genau das Π_1 aus K-35 (G5) für V̂_p. Nach (G5) hat es mindestens 7 Elemente. Richtig.
3. Für t ∈ Y ∩ Σ* ⊆ Σ_p ist g_0^{(p)}(ξ_p(t)) = g_0^{(p)}(ξ(t)) = 0 (K-30 (a)). Also verschwindet g_0^{(p)} auf Π_1, für jedes [p] ∈ 𝒫*. Richtig.
4. g* := g_0^{(p_1)} für ein festes [p_1] ∈ 𝒫* (𝒫* ≠ ∅, da unendlich). g* hat Grad 2, irreduzible Homogenisierung (K-30 (a), (b) für V̂_{p_1}). **K-4 (b)** (Zeile 148), mit K unendlich nach (a.1): keine drei verschiedenen Nullstellen von g* liegen auf einer affinen Geraden. Π_1 besteht aus Nullstellen von g* (Punkt 3 für p_1), also liegen keine drei verschiedenen Punkte von Π_1 auf einer affinen Geraden. Richtig.
5. Fünf verschiedene Punkte ξ_1, …, ξ_5 ∈ Π_1 (möglich wegen |Π_1| ≥ 7). **K-4 (c)** (Zeile 149): der Raum 𝒱 := {g ∈ P_2 : g(ξ_i) = 0, i = 1..5} hat Dimension ≤ 1. g* ∈ 𝒱 und g* ≠ 0 (Grad 2), also dim 𝒱 = 1 und 𝒱 = K·g*. Jedes g_0^{(p)}, [p] ∈ 𝒫*, liegt in 𝒱 (Punkt 3), ist ≠ 0 (Grad 2), also g_0^{(p)} = λ_p·g* mit λ_p ≠ 0. Dann haben g_0^{(p)} und g* dieselben Nullstellen. Richtig.
   Hier wird benutzt, dass P_2 für alle p derselbe Raum formaler Polynome ist und g(ξ) die gewöhnliche Auswertung in ξ ∈ K² (1.4, Zeile 97). Das stimmt; nur die Wirkung auf K^34 hängt über ξ(t) von V̂_p ab, nicht der Raum P_2.

**Schritt 3 (wandernder Punkt).**
1. **K-35 (G2)** (Zeile 610), auf irgendein V̂_p angewandt: |Ω| = 8, also gibt es z ∈ Ω; Ω hängt nicht von p ab. Richtig.
2. **K-35 (G4)** (Zeile 612) für jedes V̂_p: w^{(p)}(z) ≠ 0, also z ∈ Σ_p = Σ* für [p] ∈ 𝒫*. Richtig.
3. K-30 (a): g_0^{(p)}(ξ_p(z)) = 0; mit g_0^{(p)} = λ_p·g*, λ_p ≠ 0: g*(ξ_p(z)) = 0. Richtig.
4. **K-33 (iii)** (Zeile 578): α_z hat Rang 2 (z ∈ Ω). ℒ_z := {ξ ∈ K² : (1, ξ)ᵀ ∈ Sᵀ·α_z·K²} ist eine affine Gerade, Nullstellenmenge eines λ_z ∈ P_1 vom Grad genau 1 — das ist genau der Begriff „affine Gerade“ aus K-4 (Zeile 146). ξ_p(z) ∈ ℒ_z. Die definierende Formel enthält nur S und α_z, also ist ℒ_z für alle p dieselbe Menge. Richtig.
5. Zweiter Satz von K-33 (iii): Für (S, T_p), (S, T_p̃) ∈ 𝒢* mit ersten Zeilen p, p̃ gilt ξ_p(z) = ξ_p̃(z) ⇔ p̃ ∈ K·p. Für [p] ≠ [p̃] in 𝒫* ist p̃ ∉ K·p (siehe oben), also ξ_p(z) ≠ ξ_p̃(z). Die Abbildung 𝒫* → ℒ_z, [p] ↦ ξ_p(z), ist injektiv, ihr Bild also unendlich. Richtig.
6. Alle diese Punkte sind Nullstellen von g* auf ℒ_z. g* hat Grad 2 und irreduzible Homogenisierung; K-4 (b), zweiter Satz („hat g auf keiner affinen Geraden unendlich viele Nullstellen“), widerspricht. (Schon drei Werte von p würden nach dem ersten Satz von K-4 (b) genügen.) Richtig.

Also ist die Annahme falsch, 𝒢_3 ≠ ∅.

**Randfälle, gezielt gesucht.**
- *Charakteristik.* Kein Schritt dividiert durch eine ganze Zahl; benutzt werden nur Unendlichkeit von K (a.1) und die zitierten Glieder. Charakteristik 2 macht keinen Unterschied an den Stellen von K-40.
- *Wahl der Vertreter p.* K-39 legt pro [p] einen Vertreter fest; K-33 (iii) wird mit genau diesen ersten Zeilen angewandt. Kein Vertreterwechsel, keine Lücke.
- *λ_p = 0.* Ausgeschlossen, da g_0^{(p)} Grad 2 hat. Sonst wäre Schritt 3, Punkt 3 nicht tragfähig; hier ist er es.
- *Weniger als 5 Punkte in Π_1 / drei kollinear.* Durch (G5) und K-4 (b) ausgeschlossen. Der Anhang zeigt an einem Beispiel, dass ohne die Bedingung „keine drei auf einer Geraden“ der Raum in K-4 (c) Dimension 2 haben kann; die Bedingung wird also wirklich gebraucht und ist hier erfüllt.
- *z ∈ Y statt Ω.* Nicht möglich, z wird aus Ω genommen; für t ∈ Y würde der Punkt gerade nicht wandern (K-33 (ii)). Der Beweis nimmt den richtigen Index.
- *Leeres 𝒢*.* Für (a) bedeutungslos (Allaussage), für (b) liefert K-39 Elemente von 𝒢*.

**Urteil (b): bestätigt.**

## 4. Vollständigkeit der Voraussetzungsliste (Zeilen 55–66)

Benutzt werden: der Rahmen (Zeile 552), K unendlich (eigener Beweis in (a.1)), K-4 (b), (c), K-12, K-19, K-23 (a), (e), K-30 (a), (b), K-33 (ii), (iii), K-34 (Bezeichnung), K-35 (G2), (G4), (G5), K-39. Alle stehen in der Liste, mit richtigen Zeilennummern (146, 148, 149; 241; 337–339; 423, 424, 428; 525–527; 577, 578; 593; 607, 610, 612, 613; 714 — einzeln abgeglichen).

Nicht in der Liste:
- **K-8** (ein Verfahren über F ist eines über K). Es steht im Wortlaut von K-40 in Klammern („aufgefasst über … K = F̄ (K-8)“), in der Tabelle der Zitate (Zeile 132: „Wortlaut von K-40 mit K-8“) und wird in (a.2) gebraucht, damit K-12 auf V als Verfahren über K anwendbar ist. Nach der Formregel der Kette (Zeile 18: „Die Zeile ‚Voraussetzungen‘ nennt alle anderen Glieder, die der Beweis benutzt“) gehört es in die Liste; ebenso in die Spalte „benutzt“ der Tabelle in Zeile 120. Mathematisch ist nichts offen, da K-8 im Rahmen (Zeile 552) schon enthalten ist; es ist eine formale Unvollständigkeit der Liste. **Kleine Ungenauigkeit, keine Lücke.**
- Die Definitionen aus 1.2–1.4 (insbesondere: die Normalform ist durch (S, T) eindeutig bestimmt) sind Begriffe, keine Glieder, und müssen nach Zeile 18 nicht genannt werden.

## 5. Wortlaute in den Zeilen 101–111

**Zeile 103, neuer Beweis von K-41.** Gelesen relativ zu den Wortlauten, die mir vorliegen (K-18 und K-38 selbst lagen nicht in meiner Liste; ich nehme sie so, wie sie in Zeile 742 und 746 der Kette beschrieben werden). Logik: K-18 (b) gibt Länge ≥ 34; Annahme Länge 34; über K auffassen (K-8); K-40 (a) macht 𝒢_3 wohldefiniert; K-40 (b) gibt 𝒢_3 ≠ ∅; K-38 gibt 𝒢_3 = ∅ — für dasselbe V und dasselbe K. Widerspruch, also Länge ≥ 35 für jedes Verfahren, also R_F ≥ 35. Schlüssig. Der Satz „Nach K-18 (c) ist 𝒢* ≠ ∅“ wird nicht gebraucht (𝒢_3 ≠ ∅ aus K-40 (b) enthält es), schadet aber nicht. Die Verwendung von K-40 entspricht genau dessen Wortlaut (a) und (b). **Bestätigt** (soweit K-18 und K-38 betroffen sind: nicht in meinem Umfang).

**Zeile 107, Quantoren zu K-40.** „Für jedes V gibt es ein (S, T) ∈ 𝒢* mit e = 3“ — das ist (b), gelesen mit der Definition von 𝒢_3. Die Verneinung „alle Normalformen haben e = 2“ ist nach (a) richtig (siehe Abschnitt 3). Die Begründung „(aus K-12, K-19 und K-23 (a), (e))“ entspricht (a.2)/(a.3). „Unendlich viele Normalformen (S, T_p) mit festem S“ entspricht dem Beweis. **Bestätigt.**

**Zeile 109/111, Quantoren zur Zahl e.** Existenz über K-12, K-19, K-23; Unabhängigkeit über K-23 (a), mit der Folgerung für w·P_2, e und Σ. Das deckt sich mit (a.2)–(a.4). **Bestätigt.**

**Tabelle der Folgeänderungen (Zeilen 113–122).** Die neue Spalte „benutzt“ für K-40 (Zeile 120) stimmt mit der Voraussetzungsliste überein, hat also dieselbe Auslassung K-8 (Abschnitt 4). Alle genannten Glieder haben kleinere Nummer als 40. Sonst keine Bemerkung.

**Tabelle der Zitate (Zeilen 130–147).** Jeder zitierte Wortlaut stimmt mit der Kette an der genannten Zeile überein; die Kürzungen („…“) lassen keine Bedingung weg, die für die Anwendung in K-40 erheblich wäre. Einzige Ungenauigkeit: Die Zeile K-12 zitiert „ist ein Verfahren der Länge r über K“, ohne „für ⟨3,2,m⟩“; das ist der Wortlaut der Kette selbst und durch K-19 („Insbesondere gilt das für jede Normalform …“) gedeckt (Abschnitt 2, (a.2)).

## 6. Gesamturteil

| Teil | Urteil | Bemerkung |
|---|---|---|
| (a) | bestätigt | — |
| (b) | bestätigt | — |
| Voraussetzungsliste | bestätigt mit kleiner Ungenauigkeit | K-8 fehlt in der Liste und in Zeile 120; mathematisch durch den Rahmen gedeckt |
| Zeilen 101–111 | bestätigt | K-18, K-38 selbst nicht in meinem Umfang |

**Echte Lücken:** keine gefunden.

**Kleine Ungenauigkeiten im Wortlaut:**
1. K-8 fehlt in der Voraussetzungsliste (Zeilen 55–66) und in der Spalte „benutzt“ (Zeile 120), obwohl der Wortlaut und die Tabelle der Zitate es benutzen.
2. K-12 sagt nur „Verfahren der Länge r über K“, K-40 (a.2) liest „für ⟨3,2,7⟩“ hinein; gedeckt durch Definition 1.3 und den Wortlaut von K-19.
3. Der K-41-Beweis (Zeile 103) enthält mit „Nach K-18 (c) ist 𝒢* ≠ ∅“ einen nicht nötigen Schritt.

**Nicht abgleichbar im Rahmen der Positivliste:** Zeile 381 (Rahmen von Abschnitt 5, zitiert für K-23) und der Einleitungssatz von K-33 vor Zeile 577. An beiden Stellen lässt das, was ich sehen kann (Zeile 494, 1.4, Zeile 578), keinen Zweifel erkennen.

## Anhang: Programm mit exakter Arithmetik

Das Programm prüft nicht K-40, sondern die linearen Tatsachen, die Schritt 2 und 3 und (a.3) an konkreten Daten über ℚ benutzen (Python, `fractions.Fraction`, keine Gleitkommazahlen).

```python
# Exact-arithmetic illustration of the mechanism in K-40 (b), steps 2 and 3.
# Not a proof; checks the linear-algebra facts used there on concrete data over Q.
from fractions import Fraction as Fr
from itertools import combinations

MONO = [(0,0),(1,0),(0,1),(2,0),(1,1),(0,2)]  # basis of P_2

def ev(pt):
    x, y = pt
    return [x**i * y**j for (i, j) in MONO]

def rank(rows):
    m = [list(r) for r in rows]
    rk, col = 0, 0
    ncol = len(m[0]) if m else 0
    while rk < len(m) and col < ncol:
        piv = next((i for i in range(rk, len(m)) if m[i][col] != 0), None)
        if piv is None:
            col += 1; continue
        m[rk], m[piv] = m[piv], m[rk]
        for i in range(len(m)):
            if i != rk and m[i][col] != 0:
                f = m[i][col] / m[rk][col]
                m[i] = [a - f*b for a, b in zip(m[i], m[rk])]
        rk += 1; col += 1
    return rk

def collinear(a, b, c):
    return (b[0]-a[0])*(c[1]-a[1]) - (b[1]-a[1])*(c[0]-a[0]) == 0

# irreducible conic g* = x^2 + y^2 - 1, rational points via t -> ((1-t^2)/(1+t^2), 2t/(1+t^2))
def circ(t):
    t = Fr(t); d = 1 + t*t
    return ((1 - t*t)/d, 2*t/d)

def g_star(p):
    return p[0]**2 + p[1]**2 - 1

pts = [circ(t) for t in [0, 1, 2, 3, Fr(1,2), Fr(1,3), -1]]   # 7 points, like |Pi_1| >= 7
assert all(g_star(p) == 0 for p in pts)
assert len(set(pts)) == 7
assert not any(collinear(*c) for c in combinations(pts, 3)), "K-4 (b) on the circle"
for five in combinations(pts, 5):
    assert 6 - rank([ev(p) for p in five]) == 1          # K-4 (c): kernel dim exactly 1
print("circle: 7 points, no three collinear, every 5-subset gives kernel dim 1")

# lambda_p * g* has the same zeros (step 2): scaling by nonzero c
c = Fr(-7, 3)
assert all(c*g_star(p) == 0 for p in pts)

# step 3: a line meets the irreducible conic in at most 2 points; sample many lines
cnt = 0
for a in range(-3, 4):
    for b in range(-3, 4):
        if (a, b) == (0, 0): continue
        for k in range(-3, 4):
            # line a x + b y = k ; take points on the circle from a parameter grid
            on = {p for p in (circ(Fr(s, q)) for s in range(-12, 13) for q in range(1, 7))
                  if a*p[0] + b*p[1] == k}
            assert len(on) <= 2
            cnt += 1
print("lines checked:", cnt, "- never more than 2 circle points on a line")

# edge case showing why 'no three collinear' matters for K-4 (c):
# four points on the line x = 0 plus one more -> kernel dim 2
deg = [(0, 1), (0, 2), (0, 3), (0, 4), (1, 0)]
print("degenerate 5 points (four collinear): kernel dim", 6 - rank([ev(p) for p in deg]))

# (a.3): w' = c w, c != 0 -> same support, same span of {g.w}
import random
random.seed(1)
xi = [(Fr(random.randint(-5, 5)), Fr(random.randint(-5, 5))) for _ in range(34)]
w = [Fr(random.randint(-2, 2)) for _ in range(34)]
def span_rows(w):
    return [[ev(xi[t])[k]*w[t] for t in range(34)] for k in range(6)]
w2 = [Fr(-5, 2)*x for x in w]
assert {t for t in range(34) if w[t]} == {t for t in range(34) if w2[t]}
r1, r2 = rank(span_rows(w)), rank(span_rows(w2))
assert r1 == r2 == rank(span_rows(w) + span_rows(w2))
print("(a.3): dim w.P_2 =", r1, "unchanged under w -> c w, and same subspace")
```

Ausgabe:

```
circle: 7 points, no three collinear, every 5-subset gives kernel dim 1
lines checked: 336 - never more than 2 circle points on a line
degenerate 5 points (four collinear): kernel dim 2
(a.3): dim w.P_2 = 6 unchanged under w -> c w, and same subspace
```

Laufzeit unter einer Sekunde.
