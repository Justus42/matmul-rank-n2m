# Bericht S5-18: Prüfung des Glieds K-40 (neuer Wortlaut)

Rolle: Prüfer. Gegenstand: `lean/prosa/s5_327_k40.md` (Stand fa1b7aa), Zeilen 49–53 (Wortlaut), 55–66 (Voraussetzungen), 68–88 (Beweis), 101–111, 113–122, 130–149; dazu die zitierten Wortlaute aus `lean/prosa/s5_327_kette.md` (Stand d6469d8). Den Status setzt nur der Orchestrator; dieser Bericht enthält kein Statuswort als Urteil.

## 0. Offenlegung

**Eingeblendete Einträge des Projektgedächtnisses.** Mir waren eingeblendet:

1. Der Index `MEMORY.md` des Projektgedächtnisses (Projekt, Repo, Protokollfassung 0.7, Rechte und Grenzen des Orchestrators, Stufe 5 mit Spur P und Spur K samt Budgetangaben, Hinweise zur Freigabeliste, zum Fremdmodell, zur Vergabe an Prüfer, zur Literaturwache, Verweise auf `verfahren-datenformat` und `lean-project-ci`). Er enthält nach meiner Lesung keine Aussage über K-40, über ein Prüfurteil oder über das erwünschte Ergebnis.
2. Der Einzeleintrag `aussagen-abgleich-n3` (Hinweise zur Gemini-Bridge und zum lokalen Lean-Bau).
3. Der Einzeleintrag `gemini-bridge` (Freigabe der Bridge, Zeitlimit).

Keiner dieser Einträge nennt ein Urteil zu K-40 oder zur Kette. Ich habe nichts ins Gedächtnis geschrieben.

**Was ich gelesen habe.** `CLAUDE.md`; `PROTOKOLL.md` Abschnitt 5; die genannten Zeilenbereiche beider Dateien, ausgegeben per Zeilenfilter aus den Commits fa1b7aa und d6469d8. Nicht gelesen: STATUS.md, LOG.md, `pruefvermerke/`, `archiv/`, `palomar/`, Berichte `s5_kette_bericht_*`, Verzeichnislisten, Git-Historie.

**Spuren und Nebenbeobachtungen.**
- Beim Vergleich mit `main` meldete git, dass `lean/prosa/s5_327_k40.md` auf `main` nicht existiert; ich habe die Datei deshalb aus Commit fa1b7aa gelesen. `lean/prosa/s5_327_kette.md` auf `main` ist inhaltsgleich mit d6469d8.
- Die Zeilen 721–750 der Kette enthalten den bisherigen Wortlaut von K-40 und die bisherige Prüfung der Quantoren. Sie standen auf meiner Positivliste. Ein Prüfurteil zu K-40 habe ich dort nicht gesehen.
- Die Tabelle in Zeile 134 der K-40-Datei verweist auf Zeile 381 der Kette (Rahmen von Abschnitt 5). Diese Zeile ist nicht auf meiner Positivliste und ich habe sie nicht gelesen. Ich stütze mich für den Rahmen von Abschnitt 5 auf Zeile 494 („Rahmen wie in Abschnitt 5: V̂ ist eine Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ über K = F̄“) und auf 1.4 (Zeile 91).
- Den Vorspann von K-33 (vor Zeile 577) und die Wortlaute von K-8, K-18 und K-38 habe ich nicht gelesen (nicht auf der Liste). Wo das eine Rolle spielt, steht es unten.

## 1. Teil (a): Schritt-für-Schritt-Nachrechnung

**Wortlaut (Z. 52).** Für jedes (S, T) ∈ 𝒢* gibt es in der Normalform V̂ ein v ∈ Ŝ, v ≠ 0; für jedes solche v sind w = f_0(v) und e = dim(w·P_2) − 3 nach K-23 erklärt, e ∈ {2, 3}; e und Σ hängen nicht von v ab; 𝒢_3 ist wohldefiniert, und für (S, T) ∈ 𝒢* gilt (S, T) ∉ 𝒢_3 ⟺ e = 2.

**Vorbemerkung: „die“ Normalform ist eindeutig.** Nach 1.3 (Z. 86) entsteht V̂ aus V^{(S,T)} durch eine fest vorgeschriebene Skalierung (Division durch α′_t(e_00), das nach (SN1) ≠ 0 ist). Zu (S, T) ∈ 𝒢* gehört also genau ein V̂. Damit ist „in der Normalform zu (S, T)“ eindeutig. Das benutzt der Beweis stillschweigend; es folgt aus der Definition.

**(a.1) K unendlich.** Ist K = {k_1, …, k_n}, dann n ≥ 2 ≥ 1, und h(x) = Π(x − k_i) + 1 hat Grad n ≥ 1 und h(k_i) = 1 ≠ 0 für alle i. Widerspruch zur algebraischen Abgeschlossenheit. Nachgerechnet, richtig. Der Zusatz „Also gelten die Glieder, die ‚K unendlich‘ voraussetzen (K-4, K-39)“ ist für K-4 genau richtig (Z. 146: „Sei K ein unendlicher Körper“). Der Wortlaut von K-39 (Z. 714) nennt „K unendlich“ nicht als Voraussetzung, sondern „V wie in Abschnitt 7“; das ist eine kleine Ungenauigkeit in der Begründung, ohne Folgen (siehe (b)).

**(a.2) Existenz.**
1. V ist ein Verfahren der Länge 34 für ⟨3,2,7⟩ über F, aufgefasst über K (Wortlaut Z. 51). Damit ist V ein Verfahren über K, wie K-12 (Z. 241: „Sei V ein Verfahren der Länge r für ⟨3,2,m⟩ über K und (S, T) ∈ 𝒢*“) verlangt; r = 34, m = 7. Dass V über K ein Verfahren ist, ist der Inhalt von K-8 (siehe 4.1).
2. K-12 liefert: V̂ ist ein Verfahren der Länge 34 über K mit (SN1), (SN2). Der Wortlaut von K-12 sagt „Verfahren der Länge r über K“ ohne „für ⟨3,2,m⟩“; das Format ergibt sich aus 1.3 (α̂_t auf K^{3×2}, β̂_t auf K^{2×m}, Ĉ_t ∈ K^{3×m}). Außerdem sagt K-19 ausdrücklich (Z. 337): „Insbesondere gilt das für jede Normalform eines Verfahrens der Länge 34 (K-12).“ Die Voraussetzung von K-19 ist also gedeckt.
3. K-19 (Z. 339): dim Ŝ = 1, Ŝ der Raum aus 1.2 für V̂. Nach 1.4 (Z. 91) werden alle Begriffe aus 1.2 für V̂ gebildet, also ist es derselbe Raum Ŝ wie in K-23. Wegen dim Ŝ = 1 > 0 gibt es v ∈ Ŝ, v ≠ 0.
4. Damit ist die Bedingung des Wortlauts von K-23 (Z. 423, „In V̂ sei v ∈ Ŝ mit v ≠ 0“) erfüllt. V̂ ist eine Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ über K = F̄, also im Rahmen nach Z. 494/1.4. K-23 (e) (Z. 428): e ∈ {2, 3}.

Ergebnis: richtig.

**(a.3) Unabhängigkeit von v.** Sei v′ ∈ Ŝ, v′ ≠ 0. Ich prüfe beide angegebenen Wege.
- Direkt: dim Ŝ = 1 und v ≠ 0 ⇒ Ŝ = K·v ⇒ v′ = c·v, c ≠ 0 (wegen v′ ≠ 0). f_0 linear (1.2: f_0(x) = D(e_00)·ℬ(x), ℬ linear) ⇒ w′ = c·w.
- Über K-23 (a): „w ist bis auf einen Faktor ≠ 0 eindeutig“ liefert w′ = c·w, c ≠ 0. Die Lesart „über alle zulässigen v“ ist die natürliche; der direkte Weg macht den Schritt aber unabhängig von dieser Lesart.
- Für g ∈ P_2 ist g·(c·w) = (g(ξ(t))·c·w_t)_t = c·(g·w) (Definition 1.4, Z. 97). Also w′·P_2 = c·(w·P_2) = w·P_2, weil w·P_2 ein Unterraum und c ≠ 0 ist. Damit gleiches e. Träger: c·w_t ≠ 0 ⟺ w_t ≠ 0, also gleiches Σ.

Ergebnis: richtig. (Exakte Gegenprobe auf Zufallsdaten im Anhang, Teil „scale“.)

**(a.4) 𝒢_3 wohldefiniert, Gleichwertigkeit.** Nach (a.2), (a.3) ist e eine Funktion von (S, T) ∈ 𝒢* allein. 𝒢_3 = {(S, T) ∈ 𝒢* : e = 3} (K-34, Z. 593) ist also wohldefiniert. Wegen e ∈ {2, 3}: (S, T) ∈ 𝒢* ∖ 𝒢_3 ⟺ e ≠ 3 ⟺ e = 2. Richtig.

**Urteil zu (a): bestätigt.**

## 2. Teil (b): Schritt-für-Schritt-Nachrechnung

**Annahme.** 𝒢_3 = ∅. Nach (a.4): für jedes (S, T) ∈ 𝒢* ist e = 2 in der Normalform. Das ist genau die Verneinung von (b), weil e nach (a) für jedes (S, T) ∈ 𝒢* erklärt ist und in {2, 3} liegt. Richtig.

**Anwendung von K-39.** K-39 (Z. 714) verlangt „V wie in Abschnitt 7“, d. h. (Z. 552) V Verfahren der Länge 34 für ⟨3,2,7⟩ über F, aufgefasst über K = F̄. Das ist wörtlich der Wortlaut von K-40. Die weiteren Sätze in Z. 552 („Nach K-18 (c) …“) sind Folgerungen, keine zusätzlichen Annahmen. K-39 liefert: S invertierbar, 𝒫 ⊆ P¹(K) unendlich, zu jedem [p] ∈ 𝒫 ein Vertreter p und T_p ∈ GL_2(K) mit erster Zeile p und (S, T_p) ∈ 𝒢* ∩ 𝒢_gen. Insbesondere ist 𝒢* ≠ ∅; K-18 (c) wird in K-40 nicht gebraucht.

**Aufbau für jedes [p] ∈ 𝒫 (Z. 80).**
- V̂_p ist die (eindeutige) Normalform zu (S, T_p); nach (a) gibt es v_p ≠ 0 in Ŝ von V̂_p; w^{(p)} := f_0(v_p), Σ_p := Träger. Σ_p ist nach (a) unabhängig von der Wahl von v_p, also ist [p] ↦ Σ_p eine wohlbestimmte Abbildung (bei fest gewähltem Vertreter p und T_p).
- e = 2 in V̂_p (Annahme). K-30 (Z. 525–527) gilt im Rahmen Z. 494 (V̂ Normalform eines Verfahrens der Länge 34 über K = F̄) mit dem w aus K-23; V̂_p erfüllt das. Also: ker(g ↦ w^{(p)}·g) = K·g_0^{(p)}, g_0^{(p)} vom Grad genau 2 (insbesondere ≠ 0), g_0^{(p)}(ξ_p(t)) = 0 für t ∈ Σ_p; ĝ_0^{(p)} irreduzibel.
- K-35 (Z. 607): Voraussetzung (S, T) ∈ 𝒢* ∩ 𝒢_gen, V̂ die Normalform; erfüllt für (S, T_p). Σ in K-35 ist der Träger des w aus K-23 für V̂_p, also Σ_p. Y und Ω sind in K-35 über den Rang der α_t von V erklärt („nach K-12 dieselben Mengen für α̂_t“), hängen also nicht von p ab. Richtig.
- Den Hinweis Z. 149 (K-35 nennt die Existenz von w nicht selbst) teile ich: In K-40 wird K-35 nur auf V̂_p angewandt, in denen w nach (a) erklärt ist. Kein Problem für K-40.

**Schritt 1 (Schubfach).** Die Abbildung 𝒫 → Potenzmenge von {1, …, 34}, [p] ↦ Σ_p, hat eine endliche Zielmenge (2^34 Elemente), 𝒫 ist unendlich. Also ist eine Faser unendlich: es gibt Σ* und 𝒫* ⊆ 𝒫 unendlich mit Σ_p = Σ* auf 𝒫*. Richtig.

**Schritt 2 (fester Kegelschnitt).**
1. K-33 (ii) (Z. 577): für α_t vom Rang 1, α_t = x·yᵀ, ist a(t) = Sᵀx/(s_0ᵀx), „hängt nur von S ab, nicht von T“. Da alle (S, T_p) dasselbe S haben, ist ξ_p(t) = ξ(t) für t ∈ Y unabhängig von p. Ich habe die Formel aus der Definition 1.3 nachgerechnet: Koeffizientenmatrix von α′_t ist Sᵀα_tTᵀ (stimmt mit K-12 überein); bei α_t = x yᵀ ist sie (Sᵀx)(Ty)ᵀ, Spalte 0 ist (Ty)_0·Sᵀx, Skalierung durch α′_t(e_00) = (s_0ᵀx)(Ty)_0 ergibt a(t) = Sᵀx/(s_0ᵀx). Richtig (exakte Gegenprobe im Anhang, Teile „K12“, „K33ii“). Anmerkung: Den Vorspann von K-33 vor Z. 577 habe ich nicht gesehen; K-40 nutzt K-33 nur für (S, T_p) ∈ 𝒢*, und die Formel in (ii) ist ohnehin T-frei.
2. Für [p] ∈ 𝒫*: Π_1 aus K-35 (G5) für V̂_p ist {ξ_p(t) : t ∈ Y ∩ Σ_p} = {ξ(t) : t ∈ Y ∩ Σ*}. Diese Menge hängt nicht von p ab und hat nach (G5) mindestens 7 Elemente. Richtig.
3. K-30 (a): g_0^{(p)} verschwindet an ξ_p(t) = ξ(t) für t ∈ Y ∩ Σ* ⊆ Σ_p, also auf Π_1. Richtig.
4. g* := g_0^{(p_1)}: Grad 2, irreduzible Homogenisierung (K-30 (a), (b) für p_1). K-4 (b) (K unendlich nach (a.1)): keine drei verschiedenen Nullstellen von g* auf einer affinen Geraden; Π_1 ⊆ Nullstellen von g*, also keine drei verschiedenen Punkte von Π_1 auf einer affinen Geraden. Richtig.
5. Fünf verschiedene Punkte ξ_1, …, ξ_5 ∈ Π_1 (möglich, |Π_1| ≥ 7). K-4 (c): Raum R := {g ∈ P_2 : g(ξ_i) = 0} hat dim ≤ 1. g* ∈ R, g* ≠ 0 ⇒ R = K·g*. Jedes g_0^{(p)}, [p] ∈ 𝒫*, liegt in R (verschwindet auf Π_1 ⊇ {ξ_i}), also g_0^{(p)} = λ_p g*, λ_p ≠ 0 wegen g_0^{(p)} ≠ 0. Dann g_0^{(p)}(ξ) = 0 ⟺ g*(ξ) = 0. Richtig.

**Schritt 3 (wandernder Punkt).**
1. K-35 (G2): |Ω| = 8, also Ω ≠ ∅; ein z ∈ Ω wird einmal, unabhängig von p, gewählt (Ω hängt nicht von p ab). Richtig. (G2) steht jetzt in der Voraussetzungsliste (Z. 65).
2. K-35 (G4) für V̂_p: w^{(p)}(z) ≠ 0, also z ∈ Σ_p = Σ* für [p] ∈ 𝒫*. Richtig.
3. K-30 (a): g_0^{(p)}(ξ_p(z)) = 0, mit Schritt 2: g*(ξ_p(z)) = 0. Richtig.
4. K-33 (iii) (Z. 578): α_z Rang 2 (z ∈ Ω) ⇒ ℒ_z = {ξ : (1, ξ)ᵀ ∈ Sᵀα_zK²} ist eine affine Gerade (Nullstellenmenge eines λ_z ∈ P_1 vom Grad genau 1) und ξ_p(z) ∈ ℒ_z. Der Begriff „affine Gerade“ in K-33 (iii) deckt sich wörtlich mit dem aus K-4 (Z. 146). ℒ_z ist nur aus S und α_z gebildet, hängt also nicht von p ab. Richtig.
5. Zweiter Satz von K-33 (iii): (S, T_p), (S, T_p̃) ∈ 𝒢* mit ersten Zeilen p, p̃ (nach K-39 sind das die gewählten Vertreter). Für [p] ≠ [p̃] ist p̃ ∉ K·p: Vertreter eines Punktes von P¹(K) sind ≠ 0, also wäre p̃ ∈ K·p gleichbedeutend mit p̃ = c·p, c ≠ 0, d. h. [p̃] = [p]. Also ξ_p(z) ≠ ξ_p̃(z). Die Abbildung 𝒫* → ℒ_z, [p] ↦ ξ_p(z), ist injektiv; 𝒫* unendlich ⇒ g* hat unendlich viele Nullstellen auf ℒ_z. Richtig (exakte Gegenprobe im Anhang, Teile „K33iii_line“, „K33iii_move“: a-Punkt liegt auf ℒ, gleiche Klasse [p] gibt gleichen a-Punkt, verschiedene Klassen verschiedene).
6. Widerspruch zu K-4 (b), „Insbesondere hat g auf keiner affinen Geraden unendlich viele Nullstellen“, angewandt auf g* (Grad 2, irreduzible Homogenisierung). Schon drei verschiedene Punkte würden genügen. Richtig.

**Randfälle, gezielt gesucht.**
- 𝒢* leer: in (a) leer erfüllt; in (b) liefert K-39 selbst Elemente von 𝒢*. Kein Problem.
- Abhängigkeit von Wahlen (Vertreter p, T_p, v_p, z, p_1, fünf Punkte): Jede Wahl wird einmal getroffen; Σ_p, Y, Ω, ℒ_z, die Nullstellenmenge von g_0^{(p)} hängen von der Wahl von v_p nicht ab. Die gleichzeitige Wahl von v_p für unendlich viele p ist eine gewöhnliche Auswahl; sie ließe sich sogar vermeiden, weil Σ_p und K·g_0^{(p)} wahlfrei sind.
- Charakteristik: Kein Schritt in K-40 dividiert durch eine ganze Zahl; benutzt wird nur K unendlich (für K-4) und der Rahmen F̄.
- Verwechslung Π_1: Die in K-40 definierte Menge Π_1 stimmt für jedes [p] ∈ 𝒫* mit der Menge Π_1 aus K-35 (G5) für V̂_p überein (Schritt 2.2). Keine Lücke.
- Quantoren von K-33 (iii): Die Aussage ist ein „genau dann“ für feste t und zwei Elemente von 𝒢* mit gleichem S; K-40 nutzt nur die Richtung „p̃ ∉ K·p ⇒ verschiedene a-Punkte“. Gedeckt.

**Urteil zu (b): bestätigt.**

## 3. Vollständigkeit der Voraussetzungsliste (Z. 55–66)

Benutzt werden im Beweis: die Annahme des Wortlauts (Rahmen Z. 552); K unendlich (Schritt (a.1)); K-12; K-19; K-23 (Wortlaut Z. 423, (a), (e)); K-34 (nur Bezeichnung); K-39; K-30 (a), (b); K-33 (ii), (iii); K-35 (Wortlaut Z. 607 für Y, Ω, Σ; (G2), (G4), (G5)); K-4 (b), (c). Alle stehen in der Liste.

**Kleine Ungenauigkeit (keine Lücke):** K-8 fehlt in der Liste. Der Beweis braucht, dass V über K ein Verfahren ist (für K-12 und für die Definition von 𝒢* in 1.3), und die Tabelle Z. 132 begründet das selbst mit „Wortlaut von K-40 mit K-8“. Da der Wortlaut von K-40 „aufgefasst über … K = F̄ (K-8)“ ausdrücklich enthält und die Regel Z. 18 auch „alle Annahmen des Wortlauts“ in der Zeile „Voraussetzungen“ verlangt, wäre ein Eintrag „K-8 (nur Rahmen)“ genauer. Dasselbe gilt für die Tabelle Z. 120 („benutzt“). Den Inhalt von K-8 habe ich nicht gelesen.

**Kleine Ungenauigkeit:** Z. 61 nennt K-23 (a), (e) und die Zeilen 423, 424, 428; die Bedingung aus der Wortlautzeile 423 (Existenz von v) wird in (a.2) ausdrücklich geprüft. In Ordnung. Z. 71 stellt K-39 unter die Glieder mit Voraussetzung „K unendlich“; der Wortlaut Z. 714 nennt das nicht (ohne Folgen).

**Urteil zur Voraussetzungsliste: bestätigt bis auf die fehlende Nennung von K-8 (Ungenauigkeit im Wortlaut der Liste, keine Beweislücke).**

## 4. Wortlaute der Zeilen 101–111

**4.1 Z. 103, Beweis von K-41 (neu).** Schritte: K-18 (b) gibt Länge ≥ 34; Annahme Länge 34; über K auffassen (K-8); K-40 (a) macht e für jedes (S, T) ∈ 𝒢* erklärt und 𝒢_3 wohldefiniert; K-40 (b): 𝒢_3 ≠ ∅; K-38: 𝒢_3 = ∅; Widerspruch; also Länge ≥ 35, d. h. R_F(⟨3,2,7⟩) ≥ 35. Die Logik ist richtig, vorausgesetzt K-38 und K-40 sprechen über dasselbe V und dasselbe 𝒢_3; das sagt Z. 748. Den Wortlaut von K-18 und K-38 habe ich nicht gelesen; ich nehme für K-38 die Fassung der Quantorenprüfung Z. 746 („für jedes V … und jedes (S, T) ∈ 𝒢* hat die Normalform nicht e = 3“). Anmerkung: „Nach K-18 (c) ist 𝒢* ≠ ∅“ wird für den Widerspruch nicht gebraucht (K-40 (b) liefert es mit), schadet aber nicht. **Urteil: bestätigt**, mit dem Vorbehalt, dass K-18 und K-38 außerhalb meiner Positivliste lagen.

**4.2 Z. 107, Quantoren zu K-40.** „Für jedes V der Länge 34 gibt es ein (S, T) ∈ 𝒢* mit e = 3“ ist genau (b) (𝒢_3 ≠ ∅ nach Definition Z. 593). Die Verneinung „alle Normalformen haben e = 2“ ist richtig begründet mit (a) (aus K-12, K-19, K-23 (a), (e)). Die Verwendung für unendlich viele (S, T_p) mit festem S entspricht dem Beweis. **Urteil: bestätigt.**

**4.3 Z. 111, Punkt zur Zahl e.** Existenz über K-12, K-19, K-23; Unabhängigkeit über K-23 (a), w bis auf Faktor ≠ 0 eindeutig ⇒ w·P_2, e, Σ unabhängig. Deckt sich mit (a.2), (a.3) und ist richtig. **Urteil: bestätigt.**

**4.4 Nebenbei geprüft (Z. 113–122 und Tabelle Z. 130–147).** Die gekürzten Wortlaute in der Tabelle stimmen mit den Zeilen der Kette überein (K-12 Z. 241, K-19 Z. 337–339, K-23 Z. 423/424/428, K-34 Z. 593, K-39 Z. 714, K-30 Z. 525–527, K-33 Z. 577/578, K-35 Z. 610/612/613, K-4 Z. 148/149); ich habe keine Inhaltsänderung durch die Kürzung gefunden. Die Tabelle der Folgeänderungen ist mit der neuen Voraussetzungsliste stimmig; alle benutzten Glieder haben eine Nummer < 40. Einzige Abweichung: K-8 fehlt dort wie in der Liste (siehe 3). Der Verweis auf Z. 381 in der Tabelle (Z. 134) war für mich nicht prüfbar.

## 5. Zusammenfassung

| Teil | Urteil | Bemerkung |
|---|---|---|
| K-40 (a) | bestätigt | jeder Schritt aus K-12, K-19, K-23 (a), (e) und 1.3/1.4 nachgerechnet |
| K-40 (b) | bestätigt | jeder Schritt aus K-39, K-30, K-33 (ii), (iii), K-35 (G2), (G4), (G5), K-4 (b), (c) nachgerechnet |
| Voraussetzungsliste | bestätigt bis auf Ungenauigkeit | K-8 nicht genannt, obwohl im Wortlaut und in Tabelle Z. 132 benutzt; keine Beweislücke |
| Z. 103 (K-41, Beweis) | bestätigt | Wortlaute von K-18, K-38 lagen außerhalb der Positivliste; K-18 (c) dort entbehrlich |
| Z. 107 | bestätigt | |
| Z. 111 | bestätigt | |

Echte Lücken: keine gefunden. Kleine Ungenauigkeiten: K-8 fehlt in Voraussetzungsliste und Tabelle Z. 120; Z. 71 rechnet K-39 zu den Gliedern mit Voraussetzung „K unendlich“, was im Wortlaut Z. 714 nicht steht; K-12 sagt im Wortlaut nicht „für ⟨3,2,m⟩“ (durch 1.3 und den Zusatz in K-19 Z. 337 gedeckt).

## Anhang: Programm mit exakter Arithmetik

Python, nur `fractions.Fraction`, keine Gleitkommazahlen. Es prüft auf Zufallsdaten (Saat 18) die rein linear-algebraischen Lesarten, die der Beweis benutzt: (1) Koeffizientenmatrix von α′_t ist Sᵀα_tTᵀ (K-12, aus 1.3 nachgerechnet); (2) bei Rang 1 ist der a-Punkt Sᵀx/(s_0ᵀx), unabhängig von T (K-33 (ii)); (3) bei Rang 2 liegt der a-Punkt auf ℒ = {ξ : (1, ξ)ᵀ ∈ Sᵀα K²}, ist für gleiche Klasse [p] gleich und für verschiedene Klassen verschieden (K-33 (iii)); (4) w ↦ c·w (c ≠ 0) ändert dim w·P_2 und den Träger nicht ((a.3)). Es ersetzt keinen Beweis.

Ausgabe: `{'K12': 586, 'K33ii': 200, 'K33iii_line': 1178, 'K33iii_move': 1178, 'scale': 271}` (Zahl der bestandenen Einzelproben, keine Verletzung).

```python
# Exact-arithmetic sanity checks for the steps of K-40 that are pure linear algebra.
# Not a proof; checks the reading of the cited wordings on random rational data.
from fractions import Fraction as Fr
import random, itertools
random.seed(18)
def rnd(): return Fr(random.randint(-9, 9), random.randint(1, 5))
def mat(r, c): return [[rnd() for _ in range(c)] for _ in range(r)]
def mul(A, B): return [[sum(A[i][k]*B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
def tr(A): return [list(x) for x in zip(*A)]
def det(M):
    M = [r[:] for r in M]; n = len(M); d = Fr(1)
    for i in range(n):
        p = next((k for k in range(i, n) if M[k][i] != 0), None)
        if p is None: return Fr(0)
        if p != i: M[i], M[p] = M[p], M[i]; d = -d
        d *= M[i][i]
        for k in range(i+1, n):
            f = M[k][i]/M[i][i]; M[k] = [a - f*b for a, b in zip(M[k], M[i])]
    return d
def rank(M):
    M = [r[:] for r in M]; rk = 0; cols = len(M[0]) if M else 0
    for c in range(cols):
        p = next((k for k in range(rk, len(M)) if M[k][c] != 0), None)
        if p is None: continue
        M[rk], M[p] = M[p], M[rk]
        for k in range(len(M)):
            if k != rk and M[k][c] != 0:
                f = M[k][c]/M[rk][c]; M[k] = [a - f*b for a, b in zip(M[k], M[rk])]
        rk += 1
    return rk
def E(i, j, r, c): return [[Fr(int(a == i and b == j)) for b in range(c)] for a in range(r)]
def form(alpha, X): return sum(alpha[i][j]*X[i][j] for i in range(3) for j in range(2))
def inv_ok(M): return det(M) != 0
def apoint(alpha, S, T):
    # coefficient matrix of alpha'(A) = alpha(S A T), then scaling by alpha'(e00)
    co = [[form(alpha, mul(mul(S, E(i, j, 3, 2)), T)) for j in range(2)] for i in range(3)]
    assert co == mul(mul(tr(S), alpha), tr(T))           # K-12: alpha' = S^T alpha T^T
    if co[0][0] == 0: return None
    return (co[1][0]/co[0][0], co[2][0]/co[0][0])
ok = {"K12": 0, "K33ii": 0, "K33iii_line": 0, "K33iii_move": 0, "scale": 0}
for _ in range(200):
    S = mat(3, 3)
    if not inv_ok(S): continue
    # K-33 (ii): rank-1 alpha = x y^T, a-point = S^T x / (s0^T x), independent of T
    x = mat(3, 1); y = mat(2, 1); alpha = mul(x, tr(y))
    Stx = mul(tr(S), x)
    pts = set()
    for _ in range(3):
        T = mat(2, 2)
        if not inv_ok(T): continue
        ap = apoint(alpha, S, T); ok["K12"] += 1
        if ap is None: continue
        assert ap == (Stx[1][0]/Stx[0][0], Stx[2][0]/Stx[0][0]); pts.add(ap)
    assert len(pts) <= 1; ok["K33ii"] += 1
    # K-33 (iii): rank-2 alpha, a-point on line L = {xi : (1,xi) in S^T alpha K^2}, moves with [p]
    alpha = mat(3, 2)
    if rank(alpha) != 2: continue
    M = mul(tr(S), alpha)
    def on_line(xi):
        return det([[Fr(1), M[0][0], M[0][1]], [xi[0], M[1][0], M[1][1]], [xi[1], M[2][0], M[2][1]]]) == 0
    seen = {}
    for _ in range(6):
        T = mat(2, 2)
        if not inv_ok(T): continue
        ap = apoint(alpha, S, T)
        if ap is None: continue
        assert on_line(ap); ok["K33iii_line"] += 1
        p = tuple(T[0]); key = p[1]/p[0] if p[0] != 0 else "inf"
        # same [p] with other second row must give same a-point
        T2 = [[3*v for v in T[0]], mat(1, 2)[0]]
        if inv_ok(T2):
            ap2 = apoint(alpha, S, T2)
            if ap2 is not None: assert ap2 == ap
        if key in seen: assert seen[key] == ap
        else:
            for k2, a2 in seen.items(): assert a2 != ap   # different [p] -> different a-point
            seen[key] = ap
        ok["K33iii_move"] += 1
# Schritt 0 (a.3): w -> c*w keeps dim(w*P2), ker(g -> w*g), support
mons = [(0,0),(1,0),(0,1),(2,0),(1,1),(0,2)]
for _ in range(300):
    n = 34; xi = [(rnd(), rnd()) for _ in range(n)]
    w = [rnd() if random.random() < 0.6 else Fr(0) for _ in range(n)]
    c = rnd()
    if c == 0: continue
    def img(w): return [[m_(xi[t])*w[t] for t in range(n)] for m_ in [lambda q, a=a, b=b: q[0]**a*q[1]**b for a, b in mons]]
    w2 = [c*v for v in w]
    assert rank(img(w)) == rank(img(w2))
    assert {t for t in range(n) if w[t] != 0} == {t for t in range(n) if w2[t] != 0}
    ok["scale"] += 1
print(ok)
```
