# Prüfung: Prosa-Beweis R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉ (`lean/prosa/yang_n3.md`)

- Auftrag: S1-05, Stufe 1, Runde 2
- Rolle: Prüfer (Protokoll Abschnitt 4). Gelesen: PROTOKOLL.md, CLAUDE.md, die Behauptung, das Artefakt `lean/prosa/yang_n3.md` (Stand main a5d351b), Yang v3 (arXiv:2609.14393v3, Volltext über alphaXiv, 25.11.2026). Für Abschnitt 10 des Artefakts zusätzlich die Satzaussage in `lean/NACHBAU.md`, für die Zahlenprobe die beiden Dateien in `verfahren/`. Nicht gelesen: LOG.md, STATUS.md, `lean/prosa/yang_n4.md`, andere Prüfurteile.
- Datum: 25.11.2026
- Behauptung: Für jeden Körper F und jedes m ≥ 3 gilt R_F(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉.
- Status der Behauptung nach dieser Prüfung: **behauptet** (unverändert). Ein Prosa-Beweis kann nach Abschnitt 5.1 nicht den Status geprüft bekommen, das kann nur die Lean-Fassung.

---

## 1. Urteil

**Keine Einwände.** Ich habe jeden Schritt von R1 bis zum Abschluss selbst nachgerechnet und keinen Fehler und keine Lücke gefunden, die die Aussage oder ihren Beweis berührt. Auch die Nebenbehauptungen halte ich für richtig:

- Die Schranke gilt über **jedem** Körper. Gebraucht wird nur ein unendlicher Erweiterungskörper (in Lemma A), kein algebraischer Abschluss.
- Die Herleitung funktioniert schon für **m ≥ 2**.
- Die Korrekturen U-1 bis U-6 am Paper stimmen in der Sache. Zu U-5 habe ich eine Anmerkung zur Wortwahl (A-1).

Abschnitt 4 sammelt Anmerkungen, die keine Einwände sind. Für die Formalisierung nützlich ist vor allem A-3: Lemma F braucht nur SN1, SN2 wird allein in Lemma B benutzt.

Kein echter Fehler, also auch keine Meldung nach Abbruchregel 4.

---

## 2. Schritt für Schritt

Die Nummern folgen dem Artefakt.

| Stelle | Ergebnis | Was ich nachgerechnet habe |
|---|---|---|
| §1 Satz, Definition | richtig | Die Definition (Z) stimmt wörtlich mit Yangs Abschnitt 1 überein. Bei ganzem R ist R ≥ ⌈(24m+2)/5⌉ gleichwertig zu 5R ≥ 24m+2. |
| §2 (D1), (D2) | richtig | (D2) folgt aus (Z') durch Linearität in B. |
| R1 | richtig | (Z) ist bilinear, also gleichwertig zu den endlich vielen Koeffizientengleichungen Σ_r a_{r,ij} b_{r,j'l} c_{r,i'l'} = [i=i'][j=j'][l=l'] (über Basismatrizen). Sie bleiben unter jedem Ringhomomorphismus F → K erhalten. Also R_K ≤ R_F. |
| R2 | richtig | Streichen eines Terms mit α_r = 0 ändert die Summe nicht. Die Reihenfolge R1 vor R2 ist unkritisch, weil α_r über K genau dann null ist, wenn es über F null ist. |
| R3 | richtig | Σ α_r(SAT) β_r(T⁻¹B) S⁻¹C_r = S⁻¹·(SAT)(T⁻¹B) = AB. D'(A) = D(SAT), ℬ' = ℬ(T⁻¹·), W' = S⁻¹∘W. |
| U-1 | richtig | Yang schreibt in Abschnitt 2 wörtlich (α_r(S⁻¹AT), β_r(T⁻¹B), S⁻¹C_r). Das ergibt S⁻¹·(S⁻¹AT)(T⁻¹B) = S⁻²AB. Die Alternative (α_r(S⁻¹AT), β_r(T⁻¹B), S C_r) ergibt AB. |
| G1 bis G4 | richtig | G1: Mit A = e_{0,0} und A = e_{0,1} erhält man die Zeilen 0 und 1 von B als Zeile 0 von AB. G2: e_{i,l} = e_{i,0}e_{0,l}. G3: Dimensionsformel, dim F^{3×m} = 3m. G4: D(e_{0,0}) invertierbar und ℬ injektiv. |
| Lemma A, Schritt 1 | richtig | α_r(up) = Σ a_{r,ij} u_i p_j. Die Monome u_i p_j sind paarweise verschieden, also ist das Polynom genau dann null, wenn α_r = 0. Das Produkt P_1 ist ungleich null, weil der Polynomring nullteilerfrei ist. |
| Lemma A, 2a | richtig | Eintrag r von D(ap)ℬ(v) ist α_r(ap)·ℬ(v)_r, und α_r(ap) = Σ_i a_i α_r(e_i p) = (M_Σ(p) a)_r. Injektiv genau dann, wenn der Kern trivial ist, also Rang 3. |
| Lemma A, 2b | richtig | W(D(ap)ℬ(v)) = (ap)v = a(pv) nach (D2). Ein äußeres Produkt a·(pv) mit pv ≠ 0 ist nur für a = 0 null. |
| Lemma A, Schritt 3 | richtig | 𝒮 ist endlich, weil es eine Menge von Teilmengen von {0, …, R−1} ist (steht so im Artefakt). Zu v_Σ ≠ 0 gibt es eine Spalte ≠ 0 und dazu p_Σ mit p_Σ v_Σ ≠ 0. Ein Minor, der an einer Stelle nicht verschwindet, ist nicht das Nullpolynom. Wichtig und richtig: M_Σ(p) hängt nur von Σ und p ab, nicht von v. Deshalb gilt die Wahl für alle v mit demselben Träger. |
| Lemma A, Schritt 4 | richtig | Ein Polynom ≠ 0 über einem unendlichen Körper hat eine Nichtnullstelle. Für v ≠ 0 ist supp(v) ∈ 𝒮 (supp(v) ist nicht leer nach G1, das wird aber nicht einmal gebraucht). |
| Lemma A, Schritt 5 | richtig | e_{i,0}^{(3×2)}T hat als Zeile i die erste Zeile p von T. Also S e_{i,0} T = (S e_i) p = u_i p. Mit R3: D'(e_{i,0}) = D(u_i p). SN2: D ist linear in A, also Σ γ_i D(u_i p) = D((Σγ_i u_i)p). Schritt 4 für w = T⁻¹v ≠ 0 gibt Σ γ_i u_i = 0. |
| Lemma B | richtig | f_i = P_i f_0 mit diagonalem P_i. Diagonalmatrizen erhalten jedes E_j. X ∩ E_{j−1} = 0 nach Minimalität, also X ↪ E_j/E_{j−1}, dim X = 1. T ⊆ E_j, also f_0(S) ∩ T ⊆ X ⊆ T, Gleichheit. dim(f_0(S)+T) = dim S + 3 − 1. Stimmt mit Yangs Lemma 8 für k = 3 überein. |
| Lemma C | richtig | W(f_i(x)) = e_{i,0}x hat als Zeile i die Zeile 0 von x. W(g(x)) = e_{0,1}x − e_{0,0}^{(3×2)}e_{0,1}^{(2×2)}x = 0, und das sogar für alle x, nicht nur für x ∈ U. q = (R−3m) − m. |
| Definitionen ℓ, L, h, H, N, Φ | richtig | Stimmt mit Yangs Abschnitt 4 für n = 3 überein, wenn man x ∈ U mit c_{1,2} = x identifiziert (siehe A-1). Φ_1 = −g(u_1) + f_2(x), Φ_2 = −g(u_2) − f_1(x) entspricht Yangs −g(u_i) + h(c)_i. |
| Lemma D, E | richtig | Beide folgen direkt aus (D1). |
| Lemma F | richtig | Linke Seite selbst ausmultipliziert: D(e_{0,1})D(e_{i,0})ℬ(u_i) und −D(e_{i,0})D(e_{0,1})ℬ(u_i) heben sich auf. Die x-Terme ergeben D(e_{1,0})f_2(x) − D(e_{2,0})f_1(x) = 0. Es bleibt +D(e_{i,0})D(e_{0,0})ℬ(e_{0,1}u_i) für i = 1, 2, mit Vorzeichen +, weil −g(u_i) den Term −(−D(e_{0,0})ℬ(e_{0,1}u_i)) enthält. Rechte Seite mit Lemma E. Nach Kürzen und W: e_{1,1}u_1 + e_{2,1}u_2 = e_{0,1}y_0, denn e_{i,0}^{(3×2)}e_{0,1}^{(2×2)} = e_{i,1}^{(3×2)} und e_{i,0}y = 0 für y ∈ U. Zeilenvergleich gibt u_1 = u_2 = 0. |
| Grundungleichung (G) | richtig | dim(U²×U) = 3m, dim ker Φ = dim N = m − rk H, im Φ ⊆ im L × Q × Q. |
| Lemma G | richtig | Die beiden Koordinatenprojektionen bilden im H auf im F_2 und im(−F_1) = im F_1 ab, also rk H ≥ max(rk F_1, rk F_2) ≥ (rk F_1 + rk F_2)/2 ≥ rk L/2. Das ist Yangs Lemma 11 für d = 2, ohne die Abbildung μ. Die alte Schranke 5R ≥ 24m folgt wie angegeben. |
| Lemma H | richtig | σ ist wohldefiniert und linear, weil f_0 : U → J bijektiv ist. Schritt 1: D(e_{1,0})f_0(σ_1x) + D(e_{2,0})f_0(σ_2x) = D(e_{1,0})f_2(x) − D(e_{2,0})f_1(x) = 0, dann Lemma E und Kürzen. Das Vorzeichen in σ_2 (f_0(σ_2x) = −f_1(x)) ist genau das, das ℓ(σ(x)) = 0 ergibt. Schritt 3: f_0 injektiv. Schritt 4: Der Kern von N → ker L → ker L/(N×N) ist σ⁻¹(N×N) = S. dim ker L = 2m − rk L, dim N = m − rk H. |
| Lemma I | richtig | S ≠ 0: f_0(S) ⊆ f_0(N) wegen S ⊆ N, f_1(S), f_2(S) ⊆ f_0(N) nach Definition. Lemma B gilt für jeden Unterraum ≠ 0 von F^{2×m}. dim f_0(N) = dim N. |
| Abschluss, Fall 1 | richtig | rk L ≤ 2 rk H − 2, also rk H ≥ rk L/2 + 1. 2m ≤ q/2 − 1 + 2q, also 4m + 2 ≤ 5q = 5R − 20m. |
| Abschluss, Fall 2 | richtig | Aus Δ ≤ 1 und Δ ≥ min(2, dim N) folgt min(2, dim N) ≤ 1, also dim N ≤ 1 und dim N = min(2, dim N) ≤ Δ. Dann 2m + (m−1) ≤ rk L + 2q ≤ 3q, also 3R ≥ 15m − 1, R ≥ 5m. |
| U-6 | richtig | Yang: „Otherwise, dim(N) ≤ 2, so rk(H) ≥ m − 2“, dann 3m − 2 ≤ 3(r − 4m), r ≥ 5m − 2/3. Schwächer als nötig, aber richtig. |

---

## 3. Die besonders zu prüfenden Stellen

### 3.1 Abweichungen und Korrekturen am Paper (U-1 bis U-6)

Ich habe jede Stelle im Volltext von Yang v3 nachgesehen.

| Nr. | Steht so im Paper? | Korrektur richtig? |
|---|---|---|
| U-1 | ja, Abschnitt 2 | ja (Rechnung oben) |
| U-2 | ja, „otherwise we can replace 𝔽 with its algebraic closure“ ohne Begründung | ja |
| U-3 | ja, Lemma 6 „non-constant polynomial“ | ja, „nicht das Nullpolynom“ genügt |
| U-4 | ja, Lemma 6 „apply a change of basis that maps u_i p ↦ e_{i,0}“ | ja, T mit erster Zeile p leistet das |
| U-5 | ja, Abschnitt 4.1 „Note that h(x) = (−f_2(x), f_1(x))“ | in der Sache ja, Wortwahl siehe A-1 |
| U-6 | ja, Abschnitt 4.1 letzter Fall | ja |

Keine der sechs Stellen berührt die Gültigkeit. Weitere Abweichungen des Artefakts vom Paper (Lemma G direkt statt über μ, Lemma F mit expliziten y_0, y_1, y_2 statt Rechnung in Nebenklassen) sind gleichwertig oder genauer als das Paper.

### 3.2 Aussage zum Körper

Richtig. Yang v3 sagt im Abstract „over arbitrary fields“, Satz 1 selbst nennt keinen Körper. Für n = 3 benutzt Abschnitt 4.1 des Papers nur Lemma 8 (über Lemma 6). Lemma 9 (algebraisch abgeschlossen) wird nur in Lemma 15 benutzt, Korollar 7 nur in Lemma 14, beide in Abschnitt 4.2 (n ≥ 4). Lemma 6 braucht nur, dass ein Polynom ≠ 0 eine Nichtnullstelle hat, also einen unendlichen Körper. Mit R1 und K = F(t) oder dem algebraischen Abschluss gilt die Schranke damit über jedem Körper, auch über endlichen.

### 3.3 Nebenbehauptung m ≥ 2

Richtig. Ich habe jeden Schritt auf versteckte Annahmen über m durchgesehen. U, J, Q, Φ, Lemma A bis I sind für jedes m ≥ 1 definiert und gültig. Gebraucht wird m ≥ 2 nur am Ende von Fall 2 (25m ≥ 24m + 2). Für m = 1 liefert Fall 2 nur R ≥ 5, die Aussage ⌈26/5⌉ = 6 folgt dort also nicht aus diesem Beweis (sie ist für m = 1 trotzdem wahr, weil ⟨3,2,1⟩ Rang 6 hat, das ist aber ein anderes Argument). Plausibilitätsprobe für m = 2: Die Schranke ergibt 10, der bekannte Rang von ⟨3,2,2⟩ ≅ ⟨2,2,3⟩ ist 11, kein Widerspruch.

### 3.4 Abschnitt 10 (Verhältnis zum Lean-Satz von Tsyganov u. a.)

Die Rechnung stimmt. ⌈(24m+1)/5⌉ ≠ ⌈(24m+2)/5⌉ genau dann, wenn 5 | 24m+1, also 4m ≡ 4 (mod 5), also m ≡ 1 (mod 5). Die Tabelle für m = 3, 4, 5, 6, 7, 11 habe ich nachgerechnet (15/15, 20/20, 25/25, 30/29, 34/34, 54/53). Die zugrunde gelegte Lean-Aussage „24 * mcols < 5 * rank“ für 0 < mcols steht wörtlich in `lean/NACHBAU.md`. Siehe auch A-2.

---

## 4. Anmerkungen (keine Einwände)

**A-1 (U-5, Wortwahl).** „widerspricht im Vorzeichen der eigenen Definition“ ist zu stark. Das Vorzeichen hängt davon ab, wie man x ∈ U mit einer schiefsymmetrischen Matrix c ∈ U^{∧2} identifiziert. Mit x = c_{1,2} (Zeilen (0, x) und (−x, 0)) ergibt sich (f_2(x), −f_1(x)) wie im Artefakt. Mit x = c_{2,1} ergibt sich Yangs (−f_2(x), f_1(x)). Das Paper legt die Identifikation nicht fest. Besser: „Das Vorzeichen hängt von der Identifikation U ≅ U^{∧2} ab und ist unerheblich.“ Das Fremdmodell hat diesen Punkt unabhängig ebenso bemerkt (Abschnitt 6).

**A-2 (nicht im Artefakt, Ungenauigkeit im Paper).** Yang schreibt in der Einleitung, Tsyganov u. a. hätten R > ⌈24m/5⌉ gezeigt, und das sei gleichwertig zu R ≥ (24m+1)/5. Das ist nicht gleichwertig: Für m = 6 ergäbe R > ⌈144/5⌉ = 29 schon R ≥ 30. Gemeint ist offenbar R > 24m/5. Das Artefakt stützt Abschnitt 10 zu Recht auf die Lean-Aussage 24m < 5r und nicht auf diesen Satz des Papers. Für den Beweis von Satz 1 ohne Belang, aber wichtig, falls jemand 3×2×6 mit dem Satz von Tsyganov u. a. begründen will: Das geht nicht.

**A-3 (für die Formalisierung).** Lemma F braucht nur SN1 (Kürzen von D(e_{0,0})), nicht SN2. SN2 wird im ganzen Beweis nur in Lemma B benutzt. Teil 3 aus Abschnitt 9 des Artefakts lässt sich deshalb noch feiner schneiden: Lemmata C bis H und die Ungleichung (G) unter SN1 allein, Lemma B unter SN1 und SN2.

**A-4 (Lemma 10 im Paper).** Yang schreibt „D(e_{0,1})Φ_0 + Σ D(e_{i,0})Φ_i = 0“. Das ist so nicht sinnvoll, weil Φ_i in K/J liegt und Diagonalmatrizen J nicht erhalten. Gemeint ist die Rechnung mit Vertretern, wie das Artefakt sie mit y_0, y_1, y_2 ausführt. Keine Lücke, das Artefakt macht es richtig.

**A-5 (Kleinigkeit zu R1, „Für Lean“).** Die Koeffizientengleichungen bleiben unter jedem Ringhomomorphismus erhalten, Injektivität wird dafür nicht gebraucht (ein Körperhomomorphismus ist ohnehin injektiv).

**A-6 (Lemma C).** g(x) ∈ ker W gilt für alle x ∈ F^{2×m}, nicht nur für x ∈ U. Ohne Folgen.

---

## 5. Zahlenprobe (kein Beweis)

Unabhängig von der Zahlenprobe des Artefakts habe ich ein eigenes Wegwerf-Skript geschrieben (Python, `fractions`, eigene Gauß-Elimination, nicht im Repo). Es führt an beiden HK-Verfahren aus `verfahren/` je drei zufällige ganzzahlige Basiswechsel nach R3 durch (mit D(e_{0,0}) invertierbar), prüft danach die Identität (Z) für alle Basismatrizen und rechnet die Zwischengrößen aus. N und S werden dabei direkt als Lösungsräume bestimmt, nicht über rk H.

| Verfahren | R | m | dim ker W | q | rk L | rk H | dim N | Δ | rk Φ | dim S |
|---|---|---|---|---|---|---|---|---|---|---|
| `3x2x5-r25-hk71` (3 Basiswechsel) | 25 | 5 | 10 | 5 | 5 | 4 | 1 | 3 | 14 | 0 |
| `3x2x6-r30-hk71` (3 Basiswechsel) | 30 | 6 | 12 | 6 | 6 | 6 | 0 | 6 | 18 | 0 |

Bestanden: (Z) nach Basiswechsel; f_i(U), g(U) ⊆ ker W; dim ker W = R − 3m; dim J = m; q = R − 4m; rk Φ = 3m − dim N (Lemma F, ohne SN2, passend zu A-3); dim N aus rk H gleich dim N direkt; (G); 2 rk H ≥ rk L; dim S ≥ dim N − Δ; Δ ≥ min(2, dim N); 5R ≥ 24m + 2. Die Werte stimmen mit der Tabelle in Abschnitt 12 des Artefakts überein. SN2 und Lemma B sind nicht geprüft (Aussagen über alle v ≠ 0).

---

## 6. Fremdmodell (Gemini Bridge)

Getrennt von meinem Urteil. Dem Fremdmodell wurde mein Urteil nicht gezeigt.

- Modell: `gemini-4-carbon`, Denkstufe **low**, 25.11.2026. Ein Versuch mit Denkstufe medium brach nach 60 s ab (Grenze des Werkzeugs), Ergebnis unbekannt.
- Eingabe: Die Bridge darf dieses Repo nicht lesen („nicht freigegeben“). Ich habe deshalb die Abschnitte 1 bis 8 des Artefakts **in gekürzter Form selbst zusammengefasst** und in den Auftrag eingefügt (ohne Abschnitt 0, ohne „Für Lean“-Absätze, Beweisschritte verdichtet). Das Fremdmodell hat also nicht das Artefakt wörtlich gesehen, und das Paper hatte es nicht. Fragen: 13 Fragen nach jedem Schritt, Antwort JA, NEIN oder TEILWEISE.
- Antwort, zusammengefasst:
  - Fragen 1, 2, 4 bis 12: **JA**. Lemma F hat es selbst ausmultipliziert und bestätigt, ebenso die Zählung in Lemma H, beide Fälle des Abschlusses, U-1, die Aussage zum Körper und m ≥ 2 (mit dem Zusatz, dass der Beweis genau bei m = 1 scheitert).
  - Frage 3 (Lemma A): **NEIN**. Begründung: Die Endlichkeit von 𝒮 sei nicht begründet, und dass u ≠ 0 und p ≠ 0 aus P_1(u, p) ≠ 0 folgt, fehle. Beides steht im Artefakt (Schritt 3: „Es gibt nur endlich viele Teilmengen Σ ⊆ {0, …, R−1}“; Schritt 4: „Insbesondere up ≠ 0, also u ≠ 0 und p ≠ 0“). Beides ist in meiner Kürzung weggefallen. Der Einwand trifft also meine Zusammenfassung, nicht das Artefakt.
  - Frage 13: **TEILWEISE**. Keine weiteren mathematischen Fehler. Hinweise: U-5 hängt von der Identifikation U ≅ U^{∧2} ab (wie A-1), und e_{0,1} steht in Lemma F für zwei Matrixgrößen (im Artefakt angekündigt, beim Nachrechnen alles richtig).
  - Gesamturteil des Fremdmodells: „mathematisch vollständig korrekt … bis auf die fehlende Ein-Satz-Begründung für die Endlichkeit von 𝒮“.
- Einschränkung: Niedrige Denkstufe und eine von mir gekürzte Eingabe machen dieses Gegenlesen schwächer als vom Protokoll gemeint. Wer es strenger will: das Artefakt wörtlich per Batch-Auftrag der Bridge mit hoher Denkstufe (kein 60-s-Limit, Antwort bis 24 h), oder Justus reicht es selbst weiter (Protokoll Abschnitt 4).

---

## 7. Was diese Prüfung nicht leistet

- Keine Prüfung nach Abschnitt 5.1. Der Status bleibt **behauptet**, bis eine Lean-Fassung 5.1 besteht.
- Satz 2 (n ≥ 4) und `lean/prosa/yang_n4.md` sind nicht Teil dieses Auftrags.
- Das Lean-Repo von Tsyganov u. a. habe ich nicht gelesen, nur dessen Satzaussage aus `lean/NACHBAU.md`.
