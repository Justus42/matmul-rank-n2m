# S4-20: Prüfbericht zu B-027 (3×2×7, Länge 34, Fall e ≤ 2)

- Auftrag: S4-20, Stufe 4, Rolle Prüfer. Datum 26.11.2026. Zweig `claude/project-thread-p4h6ww`. Zeiten aus den Git-Zeitstempeln dieses Zweigs.
- Geprüft wird `behauptungen/B-027.md` gegen das Artefakt `lean/prosa/s4_327_spurA_r3_e2.md`. Stand von `main`: 3b50f8c. SHA-256 des Artefakts nachgerechnet: `da162a03afdd1896f9c0451efec93b859cd937c92ba47e78cc60bf201d8eea64`, wie in B-027 angegeben. Der Wortlaut von E2-A, E2-B und E2-D in B-027 stimmt Zeile für Zeile mit Abschnitt 0.1 des Artefakts überein (maschinell verglichen).
- Ich setze keinen Status. Die Urteile unten sind Prüfurteile im Sinne von Protokoll Abschnitt 5, der Status ist Sache des Orchestrators.
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, kein Gedächtniseintrag geschrieben.

---

## 0. Offenlegung

**Eingeblendete Gedächtniseinträge.** Vor dem ersten Lesen: der Index des Projektgedächtnisses (`MEMORY.md`, „Projekt: Matrizen-Multiplikation“). Er enthält Regeln, Rollen und Abläufe (Protokollfassung 0.6, Stufe 4 und ihr Budget, Fremdmodell-Regeln, Vorgaben für Prüferaufträge, Merge-Hinweise, Literaturwache, Netzfreigaben). Er nennt keine Behauptung, keinen Beweis, keinen Status und kein Prüfurteil. Er verweist auf die Einzeleinträge `verfahren-datenformat` und `lean-project-ci`, deren Inhalt mir nicht eingeblendet wurde. Während der Arbeit (nach dem ersten Befehl im Repo) wurden zusätzlich eingeblendet: `pruefer-abgleich-s1-20`, `pruefer-rust`, `pruefer-python-s1-07`, `hk-verfahren-a10`, `verfahren-randfaelle-s1-04`. Sie handeln von den Prüfprogrammen für Verfahrensdateien und vom Verfahrensformat aus Stufe 1, nicht von B-027 oder 3×2×7 bei Länge 34. Ich habe keinen davon für die Prüfung benutzt. Dem Orchestrator habe ich den Index vor dem Lesen gemeldet.

**Gelesen (nur Positivliste):** `CLAUDE.md`; `PROTOKOLL.md`, nur Abschnitt 5 (die Gliederung der Überschriften habe ich per `grep` gesehen, um Abschnitt 5 zu finden); `behauptungen/B-027.md`; `lean/prosa/s4_327_spurA_r3_e2.md` (ganz); `lean/prosa/s4_327_spurA_r2_bau.md`, Abschnitte 0 bis 3 (Abschnitt 0 steht vor Abschnitt 1 und enthält die Aussagen S4-07-A bis -E; die Überschriftenliste der übrigen Abschnitte habe ich per `grep` gesehen, nicht deren Text); `lean/prosa/yang_n3.md` (ganz). Nicht geöffnet: `STATUS.md`, `LOG.md`, `pruefvermerke/`, `archiv/`, `versuche/`, andere Dateien in `lean/prosa/`.

**Bloße Spuren nach Protokoll 5.4** (nicht nachgelesen):
- Verzeichnisliste von `behauptungen/` und `lean/prosa/` (per `ls`), darin Dateinamen wie `yang_n3_pruefung.md`, `s4_327_bericht_s4-01.md` bis `-13.md`, `s4_327_axiome_s4-09.md`.
- Betreffzeilen der letzten Commits auf `main` (per `git log`), darunter „Runde 4 vergeben, Literaturwache vor Runde 4 eingetragen, Lesart (g)“ und „S4-16: Bericht versuche/s4-spurB-r3.md (Positivprobe bei 35 nicht bestanden)“. Zur Herkunft: Mein erster Stand war veraltet, ich habe auf 3b50f8c nachgezogen. Die Dateien der Positivliste sind auf beiden Ständen gleich (per `git diff` geprüft).
- In `s4_327_spurA_r2_bau.md`, Kopf und Abschnitt 0.3 (L-3): B-017 bis B-019 seien „von je einem Prüfer bestätigt“; im Kopf werden Statuszeilen von `pruefvermerke/B-001.md` und `B-006.md` und Prüfberichte S4-01 bis S4-03 als gelesen genannt.
- Im Artefakt: Verweise auf S4-06 (A1 bis A3), S4-11 (Satz G(e)) und Dateien unter `versuche/`.
- Die Statusangaben „behauptet“ in beiden Artefakten stammen von deren Verfassern.

Ein Urteil zu B-027 oder ein erwünschtes Ergebnis habe ich nicht gesehen.

---

## 1. Ergebnis in Kürze

| Teilaussage | Urteil | selbst nachvollzogen? |
|---|---|---|
| E2-A (e ∈ {2, 3}) | **hält** | ja, Zeile für Zeile, einschließlich Lemma B aus `yang_n3.md` |
| E2-B, Teil 1 (Kegelschnitt, ≥ 9 Punkte) | **hält** | ja; Rechnung bestätigt |
| E2-B, Teil 2 (Zerlegungen, Dimensionen) | **hält** | ja; Rechnung bestätigt |
| E2-B, Teil 3 (ker L) | **hält**, mit einer im Text unbegründeten, aber richtigen Dimensionsaussage (3.3) | ja; Rechnung bestätigt |
| E2-B, Teil 4 (Träger, \|Σ\| ≥ 22, \|Z\| ≤ 12) | **hält** | ja (nur von Hand, nicht rechenbar ohne echtes Verfahren) |
| E2-B, Teil 5 (u·g_0) | **hält** | ja; Rechnung bestätigt |
| Hilfssatz S (Syzygien) | **hält**, über jedem Körper | ja; über GF(2) und GF(3) für alle Basen, über GF(5), GF(7), GF(10007) stichprobenweise |
| Hilfssatz T (Teilbarkeit) | **hält** | ja; dieselben Rechnungen |
| E2-D (bedingter Ausschluss unter (INJ-B)) | **hält**, wenn (INJ-B) mit F, G_1, G_2 als **formalen** Polynomen gelesen wird (Abschnitt 5.1). In der Lesart „P_d = Unterraum von K^34“ trägt der Beweis nicht; für diese Lesart **nicht entscheidbar** | ja, Schritte 1 bis 7 und E2-C; Rechnung an 2 229 eigenen Lagen mit (INJ-B) bestätigt den Kern |

Alle Aussagen gelten für Verfahren über **beliebigen Körpern**; gerechnet wird in einer Normalform über dem algebraischen Abschluss K. Nirgends wird die Charakteristik benutzt (Abschnitt 6). Ein Gegenbeispiel habe ich nicht gefunden (Abschnitt 7).

Gemeinsame Voraussetzung aller drei Aussagen ist der Restfall (rk L = 6, dim N = 3, dim S = 1), den das Artefakt in Abschnitt 2 aus `yang_n3.md` herleitet. Diese Herleitung habe ich nachgerechnet (Abschnitt 2 unten). Sie stützt sich auf die Lemmata B, G, H, I und Ungleichung (G) aus `yang_n3.md`; davon habe ich Lemma B, G, H und I Schritt für Schritt nachvollzogen, Lemma F und (G) nur gelesen.

---

## 2. Grundlage: Normalform und Restfall

**Normalform** (Artefakt 1.1, S4-07 1.1): R1 (Übergang zu K = algebraischer Abschluss; die Brent-Gleichungen sind ein endliches Gleichungssystem in den Koeffizienten), R2 (bei Länge 34 keine Nullform, sonst Länge 33 < 34 = ⌈(24·7 + 2)/5⌉, Yang-Schranke aus `yang_n3.md`), Lemma A (braucht einen unendlichen Körper; K ist unendlich), Skalierung α_t(e_{00}) = 1. Die Skalierung ersetzt f_i durch D^{−1}f_i mit invertierbarer Diagonalmatrix D; Injektivität, (SN1), (SN2) und alle Dimensionen bleiben erhalten (S4-07 1.1). Nachvollzogen.

**Restfall** (Artefakt Abschnitt 2), nachgerechnet: m = 7, R = 34, q = 6. Aus (G): 14 + rk H ≤ rk L + 12, also rk H ≤ rk L − 2 ≤ 4 (rk L ≤ q), dim N = 7 − rk H ≥ 3. Lemma I: Δ ≥ 2, also rk L + 2 ≤ 2 rk H ≤ 2 rk L − 4, rk L ≥ 6, also rk L = 6, rk H = 4, dim N = 3, Δ = 2. Lemma H: dim S ≥ 1. Beweis von Lemma I (Fall S ≠ 0, Lemma B auf S): dim S + 2 ≤ dim N = 3, also dim S = 1. Richtig. Aus rk L = 6 = dim(K′/J) folgt K′ = J + a_1J + a_2J, weil im L = (J + f_1(U) + f_2(U))/J und f_i(U) = a_i·J. Richtig.

**f_0(N) = w·P_1.** Das Artefakt übernimmt es aus S4-07 3.1, dort steht nur „also“. Die Lücke ist klein und schließt sich so: Für v ∈ S ist f_0(v) ∈ f_0(N), und f_1(v), f_2(v) ∈ f_0(N) nach Definition von S, also w·P_1 = span(w, a_1w, a_2w) ⊆ f_0(N). Links steht Dimension 3 (SN2), rechts dim N = 3 (f_0 injektiv). Also Gleichheit. Weiter f_i(N) = a_i·f_0(N) ⊆ J, weil N = ker F_1 ∩ ker F_2. Damit w·P_2 = w·P_1 + a_1·w·P_1 + a_2·w·P_1 ⊆ J.

---

## 3. E2-A: e ∈ {2, 3}

### 3.1 Schritt 1: Warum e nur Werte von 0 bis 3 annehmen kann

e := dim(w·P_2) − 3. Untere Grenze: w·P_1 ⊆ w·P_2 und dim w·P_1 = 3 nach (SN2) (w = f_0(v), v ≠ 0, und a_i·w = f_i(v)). Also e ≥ 0. Obere Grenze: w·P_2 ist das Bild des Raums der Polynome vom Grad ≤ 2 in zwei Variablen (6 Monome) unter g ↦ w·g(a), also dim ≤ 6 und e ≤ 3.

**Begründung im Text:** S4-07, 3.1 schreibt „e ∈ {0, 1, 2, 3}“ ohne Begründung. Das Artefakt begründet in Abschnitt 3 die obere Grenze mit „dim w·P_2 ≤ dim P_2 = 6“. Ungenau: Liest man P_2 wie in 1.2 als Unterraum von K^34, gilt nur dim P_2 ≤ 6; das genügt. Die untere Grenze 0 steht nicht im Text, wird für E2-A aber auch nicht gebraucht, weil Lemma B direkt e ≥ 2 gibt. e ist wohldefiniert, weil w bis auf einen Faktor feststeht (dim S = 1). **Hält.**

### 3.2 Schritt 2: Ausschluss von e = 0

Der Ausschluss steht in S4-07 3.1; das Artefakt verweist nur darauf, schließt e = 0 aber mit seinem eigenen Argument (Lemma B) ohnehin mit aus. Das Argument aus S4-07: Bei e = 0 ist w·P_2 = w·P_1 = f_0(N). Für x ∈ N ist dann f_i(x) = a_i·f_0(x) ∈ a_i·f_0(N) ⊆ w·P_2 = f_0(N), also x ∈ S. Somit S = N, im Widerspruch zu dim S = 1 < 3 = dim N.

**Benutzte Eigenschaften von S:** die Definition S = {x ∈ N : f_1(x), f_2(x) ∈ f_0(N)} und **dim S < dim N**, hier dim S = 1 aus dem Restfall. Daneben braucht der Schluss f_0(N) = w·P_1, und dafür (Abschnitt 2 oben) dim S ≥ 1 (es gibt v ≠ 0 in S) und dim N = 3. **Schlüssig, hält.**

### 3.3 Schritt 3: Lemma B schließt e = 1 aus

Lemma B (`yang_n3.md`, Abschnitt 5) verlangt nur, dass die Zerlegung stark normalisiert ist (SN1, SN2), und gilt für jeden Unterraum S ≠ 0 von F^{2×m}, über jedem Körper. Ich habe den Beweis nachvollzogen: X = f_0(S) ∩ E_j mit minimalem j ist eindimensional, X = span f_0(v); T = span(f_0(v), f_1(v), f_2(v)) ⊆ E_j, dim T = 3 (SN2); f_0(S) ∩ T = X; also dim(f_0(S) + T) = dim S + 2. Richtig.

Anwendung im Artefakt: auf den Unterraum N (dim 3, also ≠ 0) in der skalierten Normalform (stark normalisiert, siehe Abschnitt 2). f_0(N) + f_1(N) + f_2(N) = w·P_1 + a_1·w·P_1 + a_2·w·P_1 = w·P_2. Lemma B gibt dim w·P_2 ≥ 3 + 2 = 5, also e ≥ 2. Damit sind e = 0 und e = 1 ausgeschlossen. Die Voraussetzungen von Lemma B sind erfüllt. **Hält.**

**Urteil E2-A: hält.** Selbst nachvollzogen. Die Aussage gilt in jeder Normalform eines Verfahrens der Länge 34 über einem beliebigen Körper, unter dem Restfall aus Abschnitt 2.

---

## 4. E2-B: Gestalt bei e = 2

Vorab zur Schreibweise: Das Artefakt benutzt P_d in zwei Bedeutungen, als Unterraum von K^34 (Abschnitt 1.2) und als Raum formaler Polynome vom Grad ≤ d (etwa „bis auf einen Faktor genau ein Polynom g_0 ∈ P_2“, „die Abbildung P_2² → K^34 ist injektiv“, „u·P_2 hat Dimension 12“). In E2-B ist aus dem Zusammenhang immer klar, welche gemeint ist, und beide Lesarten führen zu denselben Aussagen. Für (INJ-B) ist der Unterschied wesentlich (Abschnitt 5.1).

### 4.1 Teil 1 (Kegelschnitt)

- Kern der Auswertung g ↦ w·g auf den formalen Polynomen vom Grad ≤ 2: Dimension 6 − 5 = 1, erzeugt von g_0. g_0 hat Grad genau 2, sonst wäre dim w·P_1 ≤ 2. Richtig.
- Irreduzibilität (Artefakt 4.1): Zerfiele die Homogenisierung G_0 = ℓ_1ℓ_2, so ist kein Faktor ein Vielfaches von X_0. Mit h := ℓ_1ℓ_3 (dehomogenisiert, ℓ_3 nicht proportional zu ℓ_2) ist h nicht proportional zu g_0 (eindeutige Faktorzerlegung), also j := w·h ≠ 0, j ∈ w·P_2 ⊆ J. Auf dem Träger von j ist g_0 = 0 und ℓ_1 ≠ 0, also ℓ_2 = 0: Der Träger liegt auf einer affinen Geraden c_0 + c_1a_1 + c_2a_2 = 0 mit (c_1, c_2) ≠ 0, also c_0 j + c_1 a_1 j + c_2 a_2 j = 0, Widerspruch zu (SN2) für f_0^{−1}(j). Richtig.
- Glatt: Ein singulärer Punkt eines irreduziblen ebenen Kegelschnitts ergäbe mit jedem weiteren Kurvenpunkt eine Gerade mit Schnittmultiplizität ≥ 3 > 2, also eine Geradenkomponente. Gilt in jeder Charakteristik. Richtig.
- Parametrisierung durch eine Basis φ_0, φ_1, φ_2 von S², Skalierung φ_0(θ_t) = 1 (braucht Quadratwurzeln, K algebraisch abgeschlossen), ĝ(θ_t) = g(a(t)) auf Σ, P_d → S^{2d} surjektiv mit Kern g_0·P_{d−2} (projektive Normalität des Kegelschnitts, Dimensionen (d+1)(d+2)/2 − d(d−1)/2 = 2d + 1), Auswertung von S^n an k verschiedenen Punkten von P¹ hat Rang min(n + 1, k). Alles richtig.
- „Mindestens 9 verschiedene Punkte“: aus dim w·P_4 = 9 (Teil 2, ohne Zirkel: Teil 2 benutzt aus Teil 1 nur die Parametrisierung). w·P_4 ist das Bild von S^8 unter Auswertung an den θ_t mal w_t ≠ 0, Rang = min(9, Zahl der verschiedenen Punkte). Verschiedene a-Punkte entsprechen verschiedenen θ. Richtig.

**Hält.** Rechnung (Abschnitt 7.2): in allen 25 092 eigenen zulässigen Lagen dim ker = 1, g_0 vom Grad 2, ≥ 9 verschiedene Punkte.

### 4.2 Teil 2 (Zerlegungen)

K′ = J + a_1J + a_2J = w·P_3 + u·P_1, Schranken dim w·P_3 ≤ dim S^6 = 7 (w·g hängt nur von ĝ ab, weil w außerhalb Σ verschwindet) und dim u·P_1 ≤ 6, zusammen 13 = dim K′. Also Gleichheit und direkte Summe. Ebenso K″ = w·P_4 + u·P_2 mit ≤ 9 + 12 = 21 und dim K″ ≥ 21 aus dem Zerlegungssatz. Den Zerlegungssatz (S4-07 3.2) und (D′) (S4-07 3.3) habe ich nachgerechnet: K^34 = K′ + Σ_i b_i·J nach (D); b_i·j = c_i·j + b_0·(a_i·j) mit c_i·j ∈ K′ + a_iK′ nach (C′) und a_i·j ∈ K′ nach (A). dim J³_0 = 21 − 13 = 8, Θ injektiv modulo K′ nach (D), Θ(J³_0) ⊆ K″ nach (C′). Daraus K″ = K′ ⊕ Θ(J³_0) und K^34 = K″ ⊕ b_0·K′ durch Dimensionszählung. Die Umformulierung S4-07-A (Brent-Gleichungen mit Basismatrizen, (A) bis (D), (C′)) habe ich ebenfalls nachgerechnet.

Die Injektivität von P_2² → K^34 ist hier eine Aussage über formale Polynome (12 = 2·6). **Hält.** Rechnung: in allen Lagen dim w·P_3 = 7, dim w·P_4 = 9, dim u·P_1 = 6, dim u·P_2 = 12, beide Summen direkt und gleich K′ bzw. K″.

### 4.3 Teil 3 (ker L)

Der u-Anteil fällt weg (direkte Summe w·P_3 ⊕ u·P_1, u-Anteil injektiv auf P_1²): γ_{1l}a_1 + γ_{2l}a_2 = γ_l als Polynome erzwingt γ = 0. Dann lautet die Bedingung φ_1ĝ_1 + φ_2ĝ_2 ∈ φ_0·S^4 in S^6 (w·P_3 ≅ S^6, weil dim w·P_3 = 7). Die angegebene Lösungsschar (φ_0L_1 + φ_2H, φ_0L_2 − φ_1H) erfüllt sie (nachgerechnet: φ_1(φ_0L_1 + φ_2H) + φ_2(φ_0L_2 − φ_1H) = φ_0(φ_1L_1 + φ_2L_2)).

**Stelle mit fehlender Begründung:** Das Artefakt sagt nur „9 Parameter mit einem Überlapp …, also Dimension 8“. Dass der Überlapp **genau** eindimensional ist, wird nicht begründet. Es ist aber richtig: Aus φ_0L_1 + φ_2H = 0 und φ_0L_2 − φ_1H = 0 folgt φ_0 | φ_1H und φ_0 | φ_2H, nach Hilfssatz T also φ_0 | H, H = φ_0c, und dann L_1 = −φ_2c, L_2 = φ_1c. (φ_0 und φ_2 müssen nicht teilerfremd sein, etwa bei (s², st, t²) und φ_0 = st; deshalb braucht man T und nicht nur Teilerfremdheit.) Damit ist der Raum 8-dimensional, liegt in ker L (j_i = w·g_i ∈ w·P_2 ⊆ J, a_1j_1 + a_2j_2 ∈ w·P_2 ⊆ J), und dim ker L = 14 − 6 = 8 gibt Gleichheit. „J³_0 ⊆ (w·P_2)³“: j_0 = −w(a_1g_1 + a_2g_2) mit Form φ_0(φ_1L_1 + φ_2L_2), also in w·P_2. Auch das steht nur als „insbesondere“ da, stimmt aber. Θ(J³_0) verschwindet auf Z, weil j_1, j_2 Vielfache von w sind. **Hält.** Rechnung: In allen Lagen ist der direkt berechnete ker L 8-dimensional und gleich dem Raum der Formel.

### 4.4 Teil 4 (Träger)

- Index mit w_t = 0 und u_1(t) = u_2(t) = 0: Dann verschwinden dort J, K′ und alle b_i·q_k, im Widerspruch zu K^34 = K′ ⊕ span(b_i·q_k). Richtig.
- |Σ| ≥ 22: w·P_3 (7, in K′) und die 15 Vektoren b_i·w·g (g aus einer Basis von P_2 modulo g_0) sind zusammen linear unabhängig, weil (j_0, j_1, j_2) ↦ Σ b_i·j_i nach (D) injektiv modulo K′ ist, und alle verschwinden auf Z. Richtig.
- (u·P_2)|_Z = (u·P_1)|_Z: u·P_2 ⊆ K″ = K′ ⊕ Θ(J³_0); auf Z verschwinden Θ(J³_0) und w·P_3, also (u·P_2)|_Z ⊆ (u·P_1)|_Z. Richtig.
- |Z| ≤ 12: K^Z = (K″ + b_0·K′)|_Z = (u·P_1)|_Z + b_0|_Z·(u·P_1)|_Z. Richtig.

**Hält.** Nur von Hand geprüft; die Aussagen brauchen (D) und die echten c_i, die meine konstruierten Lagen nicht haben.

### 4.5 Teil 5 (u·g_0)

u_l·g_0 ∈ u·P_2 ⊆ K″, verschwindet auf Σ, und (g_0, 0), (0, g_0) sind in P_2² linear unabhängig, also nach Teil 2 auch die Bilder. Daraus |Z| ≥ 2 und ein Z-Punkt mit g_0 ≠ 0. **Hält.** Rechnung: in allen Lagen bestätigt.

**Urteil E2-B: hält (alle fünf Teile).**

---

## 5. E2-D: bedingter Ausschluss unter (INJ-B)

### 5.1 Lesart von (INJ-B)

Wortlaut (B-027 und Artefakt 0.1 gleich): „Aus w·F + u_1G_1 + u_2G_2 = 0 mit F ∈ P_5 und G_1, G_2 ∈ P_3 folgt F ∈ g_0·P_3 und G_1 = G_2 = 0.“

- **Lesart A (formale Polynome):** F, G_1, G_2 sind Polynome vom Grad ≤ 5 bzw. ≤ 3, die Gleichung ist eine Gleichung in K^34 nach Auswertung, die Folgerung gilt für die Polynome. Diese Lesart braucht der Beweis: In Schritt 2 wird aus „a_jE_i − E′ = 0“ auf „E_i ∈ P_1²“ geschlossen, und aus „a_jC_i − C′ ∈ g_0·P_3“ auf eine Gleichung zwischen binären Formen. Beides sind Gradargumente für formale Polynome. Auch „g_0·P_3“ und „Polynom g_0“ zeigen auf diese Lesart.
- **Lesart B (Unterräume von K^34 wie in Artefakt 1.2):** Dann sagt „G_1 = G_2 = 0“ nur, dass die ausgewerteten Vektoren verschwinden. Das ist schwächer, und Schritt 2 lässt sich daraus nicht führen. Lesart A impliziert Lesart B, nicht umgekehrt.

Ich prüfe E2-D in Lesart A. Für Lesart B ist E2-D durch den Text nicht gezeigt; ob sie trotzdem gilt, ist mit dem Artefakt **nicht entscheidbar**.

Selbst ergänzt: (INJ-B) hängt nicht von der Wahl der Ergänzung u_1, u_2 ab. Ersetzt man u_l durch u′_l = Σ_k m_{lk}u_k + w·h_l (M invertierbar, h_l ∈ P_2), so entsprechen sich die Relationen über G = M^T G′ und F = F′ + Σ h_lG′_l (Grad ≤ 5), und G′ = 0 genau dann, wenn G = 0, und dann F = F′. Die Bedingung ist also eine Eigenschaft der Normalform, nicht der Basiswahl.

### 5.2 Hilfssatz S (Syzygien)

Nachvollzogen: Die Aussage ist invariant unter GL_3-Basiswechsel von S² (Koszul-Syzygien transformieren mit Λ²). Für (s², st, t²): Relationen mit Koeffizienten in S^4 bilden den Kern von (S^4)³ → S^6, Dimension 15 − 7 = 8 (die Abbildung ist surjektiv). σ_1 = (t, −s, 0), σ_2 = (0, t, −s) sind Relationen, S³σ_1 ⊕ S³σ_2 ist direkt und 8-dimensional, also der ganze Kern. Die drei Koszul-Syzygien sind s·σ_1, t·σ_2, t·σ_1 + s·σ_2 (nachgerechnet), und mit Koeffizienten aus S² erzeugen sie alle acht Basiselemente (nachgerechnet wie im Text). Der Koeffizientenvergleich am Ende (M = −C, L_1 = −B, L_2 = A) stimmt. Gilt über **jedem Körper**, wie behauptet. **Hält.** Rechnung: keine Ausnahme unter allen 168 Basen über GF(2), allen 11 232 Basen über GF(3), 463 bzw. 510 zufälligen Basen über GF(5) bzw. GF(7) und 299 über GF(10007). Negativprobe: Für Tripel vom Rang < 3 über GF(2) schlägt die Prüfung in 176 von 344 Fällen an, sie ist also nicht blind.

### 5.3 Hilfssatz T (Teilbarkeit)

Nachvollzogen für K algebraisch abgeschlossen (so wird er benutzt): φ_0, φ_1, φ_2 haben keine gemeinsame Nullstelle; zwei verschiedene Nullstellen von φ_0 → F verschwindet an beiden; φ_0 = λ² → ein φ_j ist nicht durch λ teilbar, also λ² | F. Beide Fassungen (φ_jF und φ_jφ_lF) richtig. Über einem beliebigen Körper gilt T ebenso (ist φ_0 irreduzibel, ist es prim und teilt φ_1 nicht). **Hält.** Rechnung: in denselben Durchläufen für n = 0, …, 8 und beide Fassungen bestätigt, einschließlich φ_0 mit Doppelnullstelle und irreduziblem φ_0 über endlichen Körpern.

### 5.4 Der Beweis, Schritt für Schritt (Artefakt 6.3)

1. c_i·w ∈ K″ aus (C′) mit j = w; eindeutige Darstellung w·C_i + u·E_i nach E2-B Teil 2. Richtig.
2. w·a_j ∈ J, also c_i·w·a_j ∈ K″; die Differenz der beiden Darstellungen ist eine Relation mit Graden ≤ 5 und ≤ 3. Nach (INJ-B), Lesart A: a_jE_i = E′ als Polynome, also E_i ∈ P_1²; a_jC_i − C′ ∈ g_0·P_3, also φ_jĈ_i = φ_0Ĉ′ in S^10 (Ĉ_i ∈ S^8). Für j = 1, 2 und Hilfssatz T: φ_0 | Ĉ_i, also C_i ∈ P_3 modulo g_0·P_2. Richtig.
3. Ebenso mit w·a_ja_l ∈ w·P_2 ⊆ J: E_i konstant, C_i ∈ P_2 modulo g_0. Richtig. (Ĉ_i bezeichnet hier die Form vom Grad 6, in Schritt 2 die vom Grad 8; Schreibweise doppelt belegt, inhaltlich richtig.)
4. Für g ∈ P_2: c_i·w·g = w·(C_ig) + u·(E_ig) ist die eindeutige Darstellung in K″; κ(w·g) = w·F_g + u·H_g ∈ K′. Ein Element w·A + u·B von K″ liegt genau dann in K′, wenn Â ∈ φ_0·S^6 und B ∈ P_1² (aus der Direktheit, nachgerechnet). Also Ĉ_iĝ − φ_iF̂_g ∈ φ_0·S^6 und E_ig − a_iH_g ∈ P_1², mit **denselben** F_g, H_g für i = 1, 2. Richtig.
5. g = a_1²: Grad-2-Anteile E_1a_1² = a_1H^{(1)}, E_2a_1² = a_2H^{(1)}, also E_1 = E_2 = 0. Richtig; hier wird die Kopplung über dasselbe κ benutzt.
6. ĝ = (φ_1 + λφ_2)² ist teilerfremd zu φ_0 für alle bis auf höchstens zwei λ (an einer Nullstelle von φ_0 verschwinden φ_1, φ_2 nicht beide); K ist unendlich, und P_2 → S^4 ist surjektiv. Daraus φ_0 | φ_2Ĉ_1 − φ_1Ĉ_2 und mit Hilfssatz S Ĉ_i = φ_0L_i + φ_iM, also C_i = ℓ_i + a_iμ modulo g_0. Richtig.
7. c_i·w = w·C_i, also c_i = ℓ_i + a_iμ auf Σ (g_0 verschwindet dort). E2-C (Artefakt Abschnitt 5, nicht Teil von B-027, von mir mitgeprüft): j_0, j_1, j_2 sind nach E2-B Teil 3 Vielfache von w; auf Σ ist Θ(j) = ℓ_1j_1 + ℓ_2j_2 − μj_0, auf Z sind beide Seiten 0; also Θ(J³_0) ⊆ P_1·J = K′, Widerspruch zu (D′). Richtig.

Die Gleichwertigkeit im zweiten Satz von E2-D folgt mit E2-A. „Dann gibt es kein Verfahren“ heißt: Ein Verfahren mit einer solchen Normalform führt auf einen Widerspruch.

**Urteil E2-D: hält in Lesart A** (einschließlich der Hilfssätze S und T). In Lesart B nicht entscheidbar.

Rechnung zum Kern (Abschnitt 7.2): Die Schritte 1 bis 6 benutzen nur (C′), die Gestalt aus E2-B Teil 2 und (INJ-B), nicht (D′) und kein echtes Verfahren. Sie sagen also voraus: In jeder zulässigen Lage mit e = 2, in der (INJ-B) gilt, liegt jede Lösung von (C′) auf Σ im trivialen Raum. In allen 2 229 eigenen zulässigen Lagen mit (INJ-B) ist das so.

---

## 6. Über welchen Körpern, was wird stillschweigend benutzt

- **Körper:** Alle drei Aussagen sind für Verfahren über beliebigen Körpern formuliert und werden in einer Normalform über dem algebraischen Abschluss K bewiesen. Das ist zulässig (R1). Die Charakteristik wird nirgends benutzt: keine Division durch ganze Zahlen, Glattheit irreduzibler Kegelschnitte, projektive Normalität, Hilfssätze S und T und die Auswertungsränge gelten in jeder Charakteristik. In Charakteristik 2 habe ich die Stellen eigens durchgesehen (Quadratwurzeln existieren in K, der Kegelschnitt xz = y² ist glatt).
- **Stillschweigend benutzt:**
  1. K ist algebraisch abgeschlossen (Zerfall in Linearformen in 4.1, Skalierung φ_0(θ_t) = 1) und unendlich (Lemma A, Wahl von λ in Schritt 6).
  2. f_0(N) = w·P_1 (nur „also“ in S4-07 3.1; oben in Abschnitt 2 ergänzt).
  3. Der Überlapp in E2-B Teil 3 ist genau eindimensional (oben 4.3, folgt aus Hilfssatz T).
  4. Die Doppelbedeutung von P_d (Unterraum von K^34 oder formale Polynome). In E2-B harmlos, in (INJ-B) entscheidend (Abschnitt 5.1).
  5. Die untere Schranke R(⟨3,2,7⟩) ≥ 34 über jedem Körper (für R2) und der Restfall aus `yang_n3.md` (Abschnitt 2).
  6. Die unbenutzte Bedingung (B) und die Gleichungen für b_0 werden nicht gebraucht (Artefakt L-1c). Das schwächt keine der Aussagen.

---

## 7. Rechnungen und Gegenbeispielsuche

### 7.1 Vorgehen

Eigener Code (Anhang), unabhängig von den Programmen des Artefakts geschrieben (deren Text habe ich gelesen, aber nicht benutzt). Exakte Arithmetik modulo p, Gauß-Elimination in 64-Bit-Ganzzahlen. Andere Primzahl als das Artefakt (10007 statt 32003), eigener Lagengenerator.

- `hilfs.py`: Hilfssätze S und T für Basen φ von S² über GF(p).
- `lagen.py`: Lagen mit e = 2: Σ-Punkte auf einem Kegelschnitt aus einer zufälligen Basis φ (9 bis |Σ| verschiedene Punkte, Rest als Fasern), Z mit 2 bis 12 Indizes auf höchstens 3 Punkten (u allgemein), 3 + 3 Punkten (u_1 bzw. u_2 allein) oder bis zu 6 Punkten; w ≠ 0 genau auf Σ; u auf Σ zufällig, halb null oder null. Zulässig heißt dim J = 7, dim K′ = 13, dim K″ = 21. Geprüft werden: dim N, dim ker L, Teil 1 (dim ker = 1, Grad 2, ≥ 9 Punkte), Teil 2 (alle Dimensionen und Direktheit), Teil 3 (ker L gleich dem Raum der Formel), Teil 5, (INJ-B) in Lesart A (Kern von (F, G_1, G_2) ↦ w·F + u_1G_1 + u_2G_2 gleich g_0·P_3 × 0 × 0), Lösungsraum von (C′) und ob seine Projektion auf (c_1, c_2)|_Σ im trivialen Raum liegt. Kontrollen: Die 8 trivialen Richtungen werden immer gefunden (Rang der Projektion 8), und das Teilsystem nur für i = 1 hat in manchen Lagen nicht triviale Lösungen, der Löser sieht also Lösungen, wenn es welche gibt.

### 7.2 Ergebnisse (Rechenblock 1)

Hilfssätze: wie in 5.2 und 5.3, keine Ausnahme.

Lagen (vier Läufe je 240 s, Saaten 11 und 12 mit mindestens 9, Saaten 13 und 14 mit mindestens 14 verschiedenen Σ-Punkten):

| Saat | Lagen | zulässig | davon (INJ-B) | alle Prüfungen zu Teil 1, 2, 3, 5 | c auf Σ trivial | Teilsystem i = 1 nicht trivial |
|---|---|---|---|---|---|---|
| 11 | 9 714 | 6 286 | 505 | wahr | in allen | 253 |
| 12 | 9 641 | 6 271 | 458 | wahr | in allen | 269 |
| 13 | 9 672 | 6 266 | 635 | wahr | in allen | 0 |
| 14 | 9 668 | 6 269 | 631 | wahr | in allen | 0 |
| zusammen | 38 695 | 25 092 | 2 229 | wahr | in allen | 522 |

In allen zulässigen Lagen: dim N = 3, dim ker L = 8, dim V_C = 57 (eine Lage 65, auch dort c auf Σ trivial). Unzulässige Lagen scheitern an dim J < 7, dim K′ < 13 oder dim K″ < 21.

### 7.3 Gegenbeispielsuche, Bewertung

- Gesucht habe ich (a) Basen φ, für die Hilfssatz S oder T versagt, (b) zulässige Lagen mit e = 2, in denen eine Aussage aus E2-B Teil 1, 2, 3 oder 5 versagt, (c) zulässige Lagen mit (INJ-B) und nicht trivialer Lösung von (C′) auf Σ. Nichts gefunden.
- Grenzen: Die Lagen sind konstruiert, keine Verfahren; (D), (B) und b_0 sind nicht eingebaut. E2-A (Lemma B auf echte Verfahren) und E2-B Teil 4 lassen sich so nicht prüfen; dort stützt sich mein Urteil allein auf die Handprüfung. Die Rechnung ist kein Beweis und ersetzt keinen.
- Aus dem Ergebnis, dass auch in den 22 863 zulässigen Lagen ohne (INJ-B) alle Lösungen trivial sind, folgt nichts über B-027; es betrifft die Vermutung E2-V, die nicht Teil von B-027 ist.

---

## 8. Selbst nachvollzogen und nur gelesen

- **Selbst nachvollzogen:** E2-A mit allen drei Schritten und Lemma B; der Restfall (Arithmetik und Lemmata G, H, I); E2-B Teile 1 bis 5; Hilfssätze S und T; E2-D Schritte 1 bis 7; E2-C; S4-07-A, Zerlegungssatz, (D′); die Unabhängigkeit von (INJ-B) von der Wahl von u.
- **Nur gelesen, nicht unabhängig geprüft:** Lemma F und Ungleichung (G) aus `yang_n3.md`; Lemma A (starke Normalisierung) aus `yang_n3.md`; die Standardtatsachen der algebraischen Geometrie (projektive Normalität des Kegelschnitts, Kegelschnitt ≅ P¹) habe ich als bekannt genommen und nur auf ihre Charakteristikfreiheit hin durchgesehen.
- **Nicht geprüft:** die Programme und Rechenergebnisse des Artefakts (Abschnitt 8 und Anhang A dort). Sie tragen zu B-027 nichts bei.

---

## 9. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Rechenblock 1: 11:27:12 bis 11:36:20 UTC (Wandzeit etwa 9 Minuten; Hilfssatz über GF(3) etwa 3 Minuten auf einem Kern, dann vier Lagen-Läufe parallel je 240 s auf 4 Kernen, dann drei kurze Läufe zu den Hilfssätzen). Vorher Commit ba08ee0 (11:26:20 UTC), danach der Commit mit diesem Bericht. Kein weiterer Block.

---

## Anhang: Programme (Python 3, numpy, exakte Arithmetik modulo p)

Aufrufe aus einem Verzeichnis mit allen drei Dateien: `python3 hilfs.py 2 all`, `python3 hilfs.py 2 neg`, `python3 hilfs.py 3 all`, `python3 hilfs.py 5 600`, `python3 hilfs.py 7 600`, `python3 hilfs.py 10007 300`, `python3 lagen.py <Saat> 240 <min. Punkte>` mit (11, 9), (12, 9), (13, 14), (14, 14). Die Zahl der Lagen hängt von der Rechnergeschwindigkeit ab.

### la.py

SHA-256 `8c34105d5a90bda77141ad7dd038dc6b649d2cc90e8f638b1841334c661a4fa8`

```python
# own modular linear algebra (S4-20), independent of the artifact's ff.py
import numpy as np
def rref(M, p):
    A = np.array(M, dtype=np.int64) % p
    if A.ndim == 1: A = A[None, :]
    rows, cols = A.shape; r = 0; piv = []
    for c in range(cols):
        if r == rows: break
        k = None
        for i in range(r, rows):
            if A[i, c]: k = i; break
        if k is None: continue
        if k != r: A[[r, k]] = A[[k, r]]
        A[r] = A[r] * pow(int(A[r, c]), p - 2, p) % p
        f = A[:, c].copy(); f[r] = 0
        nz = np.nonzero(f)[0]
        if len(nz): A[nz] = (A[nz] - np.outer(f[nz], A[r])) % p
        piv.append(c); r += 1
    return A[:r], piv
def rank(M, p):
    M = np.asarray(M)
    if M.size == 0: return 0
    return len(rref(M, p)[1])
def kernel(M, p):
    """right kernel: rows x with M x = 0"""
    M = np.asarray(M, dtype=np.int64)
    n = M.shape[1]
    R, piv = rref(M, p) if M.shape[0] else (np.zeros((0, n), dtype=np.int64), [])
    free = [c for c in range(n) if c not in piv]
    N = np.zeros((len(free), n), dtype=np.int64)
    for a, f in enumerate(free):
        N[a, f] = 1
        for i, c in enumerate(piv): N[a, c] = (-R[i, f]) % p
    return N
```

### hilfs.py

SHA-256 `19b2b2838b78e0794f5584e2d382d1baec272573a1c34bb21ef26dc6c0c81381`

```python
# Hilfssatz S and T over small prime fields, all (or many) bases of S^2
import itertools, sys, numpy as np, random
from la import rank, kernel
def mul(f, g, p):  # binary forms as coefficient lists in s^{n-i} t^i
    out = [0] * (len(f) + len(g) - 1)
    for i, a in enumerate(f):
        if a:
            for j, b in enumerate(g): out[i + j] = (out[i + j] + a * b) % p
    return out
def basis(n): return [[1 if i == k else 0 for i in range(n + 1)] for k in range(n + 1)]
def mulmat(phi, n, p):  # matrix of S^n -> S^{n+2}, F -> phi F (columns = images)
    return np.array([mul(phi, e, p) for e in basis(n)], dtype=np.int64).T
def check(phis, p):
    f0, f1, f2 = phis
    # Hilfssatz S: kernel of (C1,C2,R) -> f2 C1 - f1 C2 - f0 R in S^6, C,R in S^4
    M = np.hstack([mulmat(f2, 4, p), (-mulmat(f1, 4, p)) % p, (-mulmat(f0, 4, p)) % p]) % p
    V = kernel(M, p)[:, :10]  # projection to (C1,C2)
    gens = []
    for e in basis(2):
        gens.append(mul(f0, e, p) + [0] * 5)          # L1
        gens.append([0] * 5 + mul(f0, e, p))          # L2
        gens.append(mul(f1, e, p) + mul(f2, e, p))    # M
    G = np.array(gens, dtype=np.int64)
    rG = rank(G, p)
    okS = rank(np.vstack([V, G]), p) == rG == rank(V, p)
    # Hilfssatz T: {F in S^n : f0 | fj F (j=1,2)} == f0 S^{n-2}, and version with fj fl
    okT = True
    for n in range(0, 9):
        D = np.hstack([mulmat(f0, n, p)])  # f0*S^n inside S^{n+2}
        def divcond(m, deg):  # F in S^n with m*F in f0*S^{n+deg-2}
            A = np.array([mul(m, e, p) for e in basis(n)], dtype=np.int64).T  # S^n -> S^{n+deg}
            B = mulmat(f0, n + deg - 2, p)
            K = kernel(np.hstack([A, (-B) % p]), p)
            return K[:, :n + 1]
        sol1 = np.vstack([divcond(f1, 2), divcond(f2, 2)])
        # intersection of the two solution spaces
        def inter(X, Y):
            if len(X) == 0 or len(Y) == 0: return np.zeros((0, n + 1), dtype=np.int64)
            K = kernel(np.vstack([X, (-Y) % p]).T, p)
            return (K[:, :len(X)] @ X) % p
        S1 = inter(divcond(f1, 2), divcond(f2, 2))
        S2 = divcond(mul(f1, f1, p), 4)
        for (a, b) in [(f1, f2), (f2, f2)]:
            S2 = inter(S2, divcond(mul(a, b, p), 4))
        target = mulmat(f0, n - 2, p).T if n >= 2 else np.zeros((0, n + 1), dtype=np.int64)
        rt = rank(target, p)
        for Sx in (S1, S2):
            rs = rank(Sx, p) if len(Sx) else 0
            if rs != rt or (rs and rank(np.vstack([Sx, target]), p) != rt): okT = False
    return okS, okT
p = int(sys.argv[1]); mode = sys.argv[2]; RG = random.Random(1000 + p)
cnt = 0; bad = []
it = itertools.product(range(p), repeat=9) if mode in ('all', 'neg') else (tuple(RG.randrange(p) for _ in range(9)) for k in range(int(mode)))
for c in it:
    M = np.array(c).reshape(3, 3)
    if (rank(M, p) < 3) != (mode == 'neg'): continue
    cnt += 1
    s, t = check([list(M[0]), list(M[1]), list(M[2])], p)
    if not (s and t): bad.append((c, s, t))
print('p', p, 'bases', cnt, 'failures', len(bad), bad[:3])
```

### lagen.py

SHA-256 `2a598c5aa72aa8c8f4d867178852c86f1166120b2b85b568f16c287cf3bb423a`

```python
# own generator and checks for e=2 configurations (S4-20), p = 10007
import numpy as np, sys, time, random
from la import rref, rank, kernel
p = 10007; r = 34; KMIN = 9
def inv(x): return pow(int(x) % p, p - 2, p)
def mons(a1, a2, d):  # formal monomial basis of Pol_d evaluated, rows
    return np.array([[pow(int(x), i, p) * pow(int(y), k - i, p) % p for x, y in zip(a1, a2)]
                     for k in range(d + 1) for i in range(k + 1)], dtype=np.int64)
def nmons(d): return (d + 1) * (d + 2) // 2
def span(M): return rref(M, p)[0]
def make(rng):
    while True:
        Phi = [[rng.randrange(p) for _ in range(3)] for _ in range(3)]
        if rank(Phi, p) == 3: break
    nZ = rng.randrange(2, 13); nS = r - nZ; kS = rng.randrange(KMIN, nS + 1)
    pts = set(); A1 = []; A2 = []
    while len(A1) < kS:
        s, t = rng.randrange(p), rng.randrange(p)
        v = [(f[0] * s * s + f[1] * s * t + f[2] * t * t) % p for f in Phi]
        if v[0] == 0: continue
        a = (v[1] * inv(v[0]) % p, v[2] * inv(v[0]) % p)
        if a in pts: continue
        pts.add(a); A1.append(a[0]); A2.append(a[1])
    idx = list(range(kS)) + [rng.randrange(kS) for _ in range(nS - kS)]
    a1 = [A1[i] for i in idx]; a2 = [A2[i] for i in idx]
    zmode = rng.randrange(3)
    if zmode == 0:   # <=3 points, generic u
        Zp = [(rng.randrange(p), rng.randrange(p)) for _ in range(rng.randrange(1, 4))]
        zi = [rng.randrange(len(Zp)) for _ in range(nZ)]
        Uz = [[rng.randrange(1, p) for _ in range(nZ)] for _ in range(2)]
    elif zmode == 1: # 3 points for u1 only, 3 points for u2 only
        Zp = [(rng.randrange(p), rng.randrange(p)) for _ in range(6)]
        zi = [rng.randrange(6) for _ in range(nZ)]
        Uz = [[rng.randrange(1, p) if zi[k] < 3 else 0 for k in range(nZ)],
              [rng.randrange(1, p) if zi[k] >= 3 else 0 for k in range(nZ)]]
    else:            # up to 6 points, generic u
        Zp = [(rng.randrange(p), rng.randrange(p)) for _ in range(rng.randrange(1, 7))]
        zi = [rng.randrange(len(Zp)) for _ in range(nZ)]
        Uz = [[rng.randrange(1, p) for _ in range(nZ)] for _ in range(2)]
    a1 += [Zp[k][0] for k in zi]; a2 += [Zp[k][1] for k in zi]
    w = [rng.randrange(1, p) for _ in range(nS)] + [0] * nZ
    smode = rng.randrange(3)
    Us = [[rng.randrange(p) if (smode == 0 or (smode == 1 and rng.random() < .5)) else 0 for _ in range(nS)] for _ in range(2)]
    U = np.array([Us[l] + Uz[l] for l in range(2)], dtype=np.int64)
    return dict(nZ=nZ, kS=kS, zmode=zmode, smode=smode), np.array(a1), np.array(a2), np.array(w, dtype=np.int64), U
def analyse(a1, a2, w, U, nZ):
    res = {}
    Sig = np.arange(r - nZ); Z = np.arange(r - nZ, r)
    M = {d: mons(a1, a2, d) for d in range(6)}
    wP = {d: M[d] * w % p for d in range(6)}
    J = span(np.vstack([wP[2], U])); res['J'] = len(J)
    if len(J) != 7: return res
    Kp = span(np.vstack([J, J * a1 % p, J * a2 % p])); res['K1'] = len(Kp)
    if len(Kp) != 13: return res
    Kpp = span(np.vstack([Kp, Kp * a1 % p, Kp * a2 % p])); res['K2'] = len(Kpp)
    if len(Kpp) != 21: return res
    # dim N: j in J with a1 j, a2 j in J
    AJ = kernel(J, p)  # rows y with J y = 0 ... need annihilator: y.v=0 for v in J
    Ann = kernel(J, p)  # J (7x34) times y = 0 -> y annihilates rows of J
    res['N'] = len(kernel(np.vstack([(Ann * a1 % p) @ J.T % p, (Ann * a2 % p) @ J.T % p]), p))
    kerL = kernel(np.hstack([(Ann * a1 % p) @ J.T % p, (Ann * a2 % p) @ J.T % p]), p)  # coeffs (y1,y2) in basis J
    res['kerL'] = len(kerL)
    # E2-B1
    ker2 = kernel(wP[2].T, p); res['g0dim'] = len(ker2)
    g0 = ker2[0] if len(ker2) == 1 else None
    res['g0deg2'] = g0 is not None and any(g0[3:] % p)
    res['dist'] = len(set(zip(a1[Sig].tolist(), a2[Sig].tolist())))
    # E2-B2
    uP = {d: np.vstack([M[d] * U[0] % p, M[d] * U[1] % p]) for d in range(4)}
    res['wP3'] = rank(wP[3], p); res['wP4'] = rank(wP[4], p)
    res['uP1'] = rank(uP[1], p); res['uP2'] = rank(uP[2], p)
    res['K1dir'] = rank(np.vstack([wP[3], uP[1]]), p) == 13 == rank(np.vstack([Kp, wP[3], uP[1]]), p)
    res['K2dir'] = rank(np.vstack([wP[4], uP[2]]), p) == 21 == rank(np.vstack([Kpp, wP[4], uP[2]]), p)
    # E2-B3: ker L vs formula
    KL = np.hstack([kerL[:, :7] @ J % p, kerL[:, 7:] @ J % p])  # vectors (j1,j2) in K^68
    one = np.ones(r, dtype=np.int64); P1 = [one, a1 % p, a2 % p]
    F = [np.concatenate([w * l % p, 0 * w]) for l in P1] + [np.concatenate([0 * w, w * l % p]) for l in P1] + \
        [np.concatenate([w * a2 % p * h % p, (-w * a1 % p * h) % p]) for h in P1]
    F = np.array(F); rF = rank(F, p)
    res['kerLformula'] = (rF == 8 == len(KL) and rank(np.vstack([F, KL]), p) == 8)
    # E2-B5
    if g0 is not None:
        g0v = g0 @ M[2] % p
        ug = np.vstack([U[0] * g0v % p, U[1] * g0v % p])
        res['B5'] = (rank(ug, p) == 2 and not ug[:, Sig].any() and rank(np.vstack([Kpp, ug]), p) == 21)
    # INJ-B: kernel of (F,G1,G2) -> wF + u1G1 + u2G2, F in Pol5, G in Pol3
    Rel = kernel(np.vstack([wP[5], M[3] * U[0] % p, M[3] * U[1] % p]).T, p)
    n5 = nmons(5)
    gP3 = None
    if g0 is not None:  # g0 * Pol3 as formal coefficient vectors in Pol5 basis
        def polmul(c1, d1, c2, d2):
            mi = [(i, k - i) for k in range(d1 + 1) for i in range(k + 1)]
            mj = [(i, k - i) for k in range(d2 + 1) for i in range(k + 1)]
            m5 = {mm: n for n, mm in enumerate([(i, k - i) for k in range(6) for i in range(k + 1)])}
            out = np.zeros(n5, dtype=np.int64)
            for x, (i1, j1) in zip(c1, mi):
                if x:
                    for y, (i2, j2) in zip(c2, mj):
                        if y: out[m5[(i1 + i2, j1 + j2)]] = (out[m5[(i1 + i2, j1 + j2)]] + x * y) % p
            return out
        gP3 = np.array([polmul(g0, 2, e, 3) for e in np.eye(nmons(3), dtype=np.int64)])
    injb = (gP3 is not None and not Rel[:, n5:].any() and len(Rel) == rank(gP3, p) == 10
            and rank(np.vstack([gP3, Rel[:, :n5]]), p) == 10)
    res['INJB'] = injb
    # (C'): unknowns c1, c2 (34 each), kappa_k in K' (13 coords each, k=1..7)
    AK = kernel(Kp, p)  # 21 x 34 annihilator of K'
    nun = 2 * r + 7 * 13; eqs = []
    for i, ai in enumerate([a1, a2]):
        for k in range(7):
            B = np.zeros((len(AK), nun), dtype=np.int64)
            B[:, i * r:(i + 1) * r] = AK * J[k] % p
            B[:, 2 * r + 13 * k:2 * r + 13 * (k + 1)] = (-(AK * ai % p) @ Kp.T) % p
            eqs.append(B)
    V = kernel(np.vstack(eqs), p); res['dimVC'] = len(V)
    C = np.hstack([V[:, Sig], V[:, r + Sig]])
    z = np.zeros(len(Sig), dtype=np.int64)
    triv = np.array([np.concatenate([l[Sig], z]) for l in P1] + [np.concatenate([z, l[Sig]]) for l in P1] +
                    [np.concatenate([(a1 * m % p)[Sig], (a2 * m % p)[Sig]]) for m in P1])
    res['cSigma_trivial'] = rank(np.vstack([triv, C]), p) == rank(triv, p)
    res['rankC'] = rank(C, p)
    # control: only i = 1 (drop the coupling through the same kappa for i = 2)
    eq1 = np.vstack(eqs[:7])[:, list(range(r)) + list(range(2 * r, nun))]
    V1 = kernel(eq1, p); C1 = V1[:, Sig]
    t1 = np.array([l[Sig] for l in P1] + [(a1 * m % p)[Sig] for m in P1])
    res['ctrl_i1_extra'] = rank(np.vstack([t1, C1]), p) - rank(t1, p)
    return res
if __name__ == '__main__':
    seed = int(sys.argv[1]); T = float(sys.argv[2]); rng = random.Random(seed)
    if len(sys.argv) > 3: KMIN = int(sys.argv[3])
    t0 = time.time(); stats = {}; n = 0
    while time.time() - t0 < T:
        meta, a1, a2, w, U = make(rng); n += 1
        res = analyse(a1, a2, w, U, meta['nZ'])
        if res.get('K2') != 21: key = ('unzul', res.get('J'), res.get('K1'), res.get('K2'))
        else:
            key = ('zul', res['N'], res['kerL'], res['g0dim'], res['g0deg2'], res['dist'] >= 9, res['wP3'], res['wP4'], res['uP1'], res['uP2'],
                   res['K1dir'], res['K2dir'], res['kerLformula'], res.get('B5'), 'INJB' if res['INJB'] else 'nichtINJB', res['dimVC'], res['cSigma_trivial'], 'i1extra=%d' % res['ctrl_i1_extra'], 'rankC=%d' % res['rankC'])
        stats[key] = stats.get(key, 0) + 1
    print('seed', seed, 'lagen', n)
    for k, v in sorted(stats.items(), key=lambda x: -x[1]): print(v, k)
```

