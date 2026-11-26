# S4-15: Der Restfall bei e ≤ 2 (3×2×7, Länge 34)

- Auftrag: S4-15, Stufe 4, Runde 3, Spur A (Protokoll 0.6, Abschnitt 3). Rolle: Beweissucher. Bearbeitet wird nur Lücke L-1 aus `lean/prosa/s4_327_spurA_r2_bau.md` (S4-07): der Fall e ≤ 2. Der Fall e = 3 gehört nicht zum Auftrag.
- Datum: 26.11.2026. Zweig `claude/project-thread-jfslrv`. Dauer aus den Git-Zeitstempeln.
- **Status aller Aussagen dieser Datei: behauptet oder ausdrücklich vermutet.** Den Status setzt nur der Orchestrator. Die beiden Wörter, die das Protokoll dem Status geprüft vorbehält, kommen in eigenen Aussagen nicht vor.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md`, `STATUS.md`, Ende von `LOG.md`, `versuche/README.md`, `lean/prosa/s4_327_spurA_r2_bau.md` (S4-07, ganz), `lean/prosa/s4_327_spurA_r2_ausschluss.md` (S4-06, Abschnitte 0 bis 8), `versuche/s4-blind-r2.md` (Abschnitte 0 bis 5), `versuche/s4-spurB-r2.md` (Abschnitte 1 bis 3 und 7 bis 8), `lean/prosa/yang_n3.md` (ganz), `verfahren/README.md` (Anfang). Rechendaten: `verfahren/3x2x7-r35-hk71.json`, `verfahren/3x2x6-r30-hk71.json`, `verfahren/3x2x5-r25-hk71.json` (nur für die Gegenprobe).
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Kein Lean.
- Offenlegung: Eingeblendet wurden mir der Index des Projektgedächtnisses und die Einzeleinträge `yang-n3-prosa`, `yang-n3-teil2-lean`, `yang-n3-teil3-lean` und `git-regeln` (Datei- und Regelhinweise, kein Urteil zum Restfall). Ich habe sie für die Mathematik nicht benutzt.

---

## 0. Ergebnis in Kürze

**Kein vollständiger Ausschluss, kein Verfahren.** Der Fall e ≤ 2 schrumpft auf **e = 2 mit glattem Kegelschnitt**, und dort sind alle Dimensionen erzwungen (Satz E2-A, E2-B). Für e = 2 gibt es einen **bedingten Ausschluss** (Satz E2-D): Gilt eine Injektivitätsannahme (INJ-B), dann gibt es kein Verfahren der Länge 34. Das Hindernis für den unbedingten Ausschluss steht genau benannt in Abschnitt 7. Es ist dieselbe Art Lücke wie L-2 bei e = 3. Die Rechnung über GF(32003) findet in allen 74 071 zulässigen Lagen mit e = 2 nur triviale Lösungen, **auch in Lagen, in denen (INJ-B) absichtlich verletzt ist** (Vermutung E2-V).

### 0.1 Aussagen im Wortlaut (Status behauptet)

Bezeichnungen wie in S4-07, Abschnitte 1 und 2; Kurzfassung in Abschnitt 1 dieser Datei. „Normalform“ heißt wie in S4-07, Abschnitt 1.1: Übergang zum algebraischen Abschluss (R1), Streichen von Nullformen (R2, bei Länge 34 wird nichts gestrichen), starke Normalisierung (Lemma A aus `yang_n3.md`) und Skalierung α_t(e_{00}) = 1. Die Vektoren w (Erzeuger von f_0(S)), J, K′ = ker W, K″ = K′ + a_1K′ + a_2K′, Θ und J³_0 sind wie in S4-07 erklärt, e := dim(w·P_2) − 3.

**Aussage E2-A (nur e = 2 oder e = 3).** In jeder Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ über einem beliebigen Körper gilt e ∈ {2, 3}. Der Fall e ≤ 2 ist also genau der Fall e = 2.

**Aussage E2-B (Gestalt bei e = 2).** Sei in einer solchen Normalform e = 2. Sei Σ := {t : w_t ≠ 0} und Z := {1, …, 34} ∖ Σ. Dann gilt:
1. Es gibt bis auf einen Faktor genau ein Polynom g_0 ∈ P_2 mit w·g_0 = 0. Es hat Grad genau 2, seine Homogenisierung ist irreduzibel, und alle a-Punkte der Produkte in Σ liegen auf dem glatten Kegelschnitt C_0 = {g_0 = 0}. Unter ihnen sind mindestens 9 verschiedene Punkte.
2. J = w·P_2 ⊕ ⟨u_1, u_2⟩ für jede Wahl von u_1, u_2 ∈ J, die w·P_2 zu J ergänzen. Mit u·P_d := {u_1G_1 + u_2G_2 : G_1, G_2 ∈ P_d} gilt: dim w·P_3 = 7, dim w·P_4 = 9, die Abbildung P_2² → K^34, (G_1, G_2) ↦ u_1G_1 + u_2G_2, ist injektiv, und
   K′ = w·P_3 ⊕ u·P_1 (7 + 6), K″ = w·P_4 ⊕ u·P_2 (9 + 12) = K′ ⊕ Θ(J³_0), K^34 = K″ ⊕ b_0·K′ (21 + 13).
3. ker L = {(w(ℓ_1 + a_2h), w(ℓ_2 − a_1h)) : ℓ_1, ℓ_2, h ∈ P_1} (Dimension 8). Insbesondere liegt J³_0 in (w·P_2)³, und alle Vektoren in Θ(J³_0) verschwinden auf Z.
4. Jeder Index liegt in Σ oder im Träger von u_1 oder u_2. |Σ| ≥ 22. (u·P_2)|_Z = (u·P_1)|_Z, und |Z| ≤ 2·dim (u·P_1)|_Z ≤ 12.
5. Die beiden Vektoren u_1·g_0 und u_2·g_0 sind linear unabhängig, liegen in K″ und verschwinden auf Σ. Insbesondere |Z| ≥ 2, und unter den a-Punkten von Z liegen Punkte außerhalb von C_0.

**Aussage E2-C (triviale Lösungen, für jedes e, aus S4-07 übernommen und nachgerechnet).** Ist (c_1, c_2) auf Σ von der Form c_i = ℓ_i + a_i·μ mit ℓ_1, ℓ_2, μ ∈ P_1, dann ist Θ(J³_0) ⊆ K′, im Widerspruch zu (D′).

**Aussage E2-D (bedingter Ausschluss bei e = 2).** In einer Normalform mit e = 2 gelte zusätzlich
  **(INJ-B)** Aus w·F + u_1G_1 + u_2G_2 = 0 mit F ∈ P_5 und G_1, G_2 ∈ P_3 folgt F ∈ g_0·P_3 und G_1 = G_2 = 0.
Dann gibt es kein Verfahren. Gleichwertig: Jedes Verfahren der Länge 34 für ⟨3,2,7⟩ (über einem beliebigen Körper) hat in jeder Normalform e = 3, oder es hat e = 2 und verletzt (INJ-B).

### 0.2 Vermutet (Rechnung, kein Beweis)

**Vermutung E2-V.** Bei e = 2 hat das lineare System (C′) aus S4-07 auf Σ nur triviale Lösungen c_i = ℓ_i + a_i·μ, auch ohne (INJ-B). Dann gäbe es bei e = 2 kein Verfahren der Länge 34. Beleg (Abschnitt 8): In allen 74 071 zulässigen Lagen der beiden Rechenblöcke über GF(32003), davon 34 265 mit absichtlich verletzter (INJ-B), hat (C′) die Lösungsdimension 57, die Projektion auf (c_1, c_2) hat Rang 8 und liegt im trivialen Raum, und Θ hat Rang 0 statt 8. Schon die Gleichungen von (C′) für j ∈ w·P_2 allein erzwingen das. Die Gegenprobe an den echten Verfahren für 3×2×5, 3×2×6 und 3×2×7 liefert dort vollen Rang von Θ; der Löser ist also nicht blind.

### 0.3 Lücken und Abhängigkeiten (ausdrücklich)

- **L-1a (Hindernis):** Der Schritt von (INJ-B) zu allen Lagen mit e = 2 fehlt. Genaue Stelle: Abschnitt 6.3, Schritte 2 und 3, und Abschnitt 7.
- **L-1b:** Alles hier setzt den Restfall voraus (rk L = 6, dim N = 3, dim S = 1). Er folgt nach S4-06 (A1) allein aus `yang_n3.md` (Ungleichung (G), Lemmata B, G, H, I). Ich habe diese Kette in Abschnitt 2 nachgerechnet, nicht formal geprüft. Daneben stütze ich mich auf S4-07, Abschnitte 1 bis 3 und 6.1 (Umformulierung (A) bis (D), (C′), Zerlegungssatz, (D′), triviale Lösungen). Diese Teile habe ich Zeile für Zeile nachgerechnet und in Abschnitt 1 kurz wiederholt. Sie haben Status behauptet.
- **L-1c:** Bedingung (B) (b_i·p_k ∈ K′) und die Gleichungen für b_0 benutze ich nicht. Sie sind ungenutzte Einschränkungen.

---

## 1. Rahmen und benutzte Tatsachen

### 1.1 Normalform

Gegeben ein Verfahren AB = Σ_{t=1}^{34} α_t(A)β_t(B)C_t für ⟨3,2,7⟩ über einem Körper F. Nach R1 aus `yang_n3.md` ist es auch ein Verfahren über dem algebraischen Abschluss K von F. Kein α_t ist die Nullform, sonst gäbe Streichen ein Verfahren der Länge 33 im Widerspruch zu R(⟨3,2,7⟩) ≥ 34 (S4-06, Abschnitt 2.1, Punkt 2). Lemma A aus `yang_n3.md` liefert einen Basiswechsel zu (SN1), (SN2), danach skaliert man auf α_t(e_{00}) = 1 (S4-07, Abschnitt 1.1). Alles Folgende spielt in einer solchen Normalform über K.

### 1.2 Bezeichnungen (aus S4-07, Abschnitt 1.2)

Vektoren in K^34 sind Funktionen auf den Indizes t = 1, …, 34; „·“ ist das komponentenweise Produkt. a_i := (α_t(e_{i0}))_t, b_i := (α_t(e_{i1}))_t, also a_0 = 1. q_k := (β_t(e_{1k}))_t, p_k := (β_t(e_{0k}))_t. J := span(q_1, …, q_7) = f_0(U), dim J = 7. W(v) := Σ v_tC_t, K′ := ker W, dim K′ = 13. P_d ⊆ K^34: Polynome vom Grad ≤ d in a_1, a_2, ausgewertet an den 34 a-Punkten (a_1(t), a_2(t)). Für einen Vektor v ist v·P_d := {v·f : f ∈ P_d}. K″ := K′ + a_1K′ + a_2K′. c_i := b_i − a_i·b_0 (i = 1, 2).

### 1.3 Tatsachen aus S4-07, die ich benutze (nachgerechnet)

- **(A)–(D)** (S4-07, Abschnitt 2): a_i·q_k ∈ K′; b_i·p_k ∈ K′; a_i·p_k − b_i·q_k ∈ K′; die 21 Vektoren b_i·q_k sind linear unabhängig modulo K′ und ergänzen K′ zu K^34. Herleitung: Einsetzen der Basismatrizen in die Brent-Gleichungen.
- **(C′)** (S4-07, Abschnitt 2): Mit κ_k := p_k − b_0·q_k ∈ K′ (aus (C) für i = 0) und κ(Σ y_kq_k) := Σ y_kκ_k gilt c_i·j ≡ a_i·κ(j) (mod K′) für alle j ∈ J, i = 1, 2. Rechnung: a_ip_k − b_iq_k = a_iκ_k − c_iq_k.
- **Zerlegungssatz** (S4-07, Abschnitt 3.2): K^34 = K″ + b_0·K′, also dim K″ ≥ 21. Herleitung: K^34 = K′ + Σ_i b_i·J; b_i·j = c_i·j + b_0·(a_i·j) mit c_i·j ∈ K′ + a_iK′ nach (C′) und a_i·j ∈ K′.
- **(D′)** (S4-07, Abschnitt 3.3): J³_0 := {(j_0, j_1, j_2) ∈ J³ : j_0 + a_1j_1 + a_2j_2 = 0} hat Dimension 8, Θ(j) := c_1·j_1 + c_2·j_2 = Σ_i b_i·j_i ist auf J³_0 injektiv modulo K′, und K′ ⊕ Θ(J³_0) ⊆ K″. Die Projektion (j_0, j_1, j_2) ↦ (j_1, j_2) bildet J³_0 bijektiv auf ker L = {(j_1, j_2) ∈ J² : a_1j_1 + a_2j_2 ∈ J} ab.
- **Triviale Lösungen** (S4-07, Abschnitt 6.1): Für c_i = ℓ_i + a_i·μ (ℓ_i, μ ∈ P_1) ist Θ(j) = ℓ_1j_1 + ℓ_2j_2 − μ·j_0 ∈ P_1·J = K′. Das ist Aussage E2-C. Es genügt, dass die Formel auf den Indizes gilt, an denen j_1, j_2 nicht verschwinden; bei e = 2 sind das Indizes in Σ (Aussage E2-B, Teil 3).
- **Vektor w** (S4-07, Abschnitt 3.1, und S4-06, A2): Mit S = ⟨v⟩ und w := f_0(v) gilt f_0(N) = w·P_1, dim w·P_1 = 3 (SN2), w·P_2 ⊆ J.

---

## 2. Der Restfall (nachgerechnet, behauptet)

m = 7, R = 34, q = R − 4m = 6. Aus `yang_n3.md`: (G) 2m + rk H ≤ rk L + 2q gibt rk H ≤ rk L − 2 ≤ 4, also dim N = 7 − rk H ≥ 3. Lemma I gibt Δ = 2 rk H − rk L ≥ min(2, dim N) = 2. Zusammen rk L + 2 ≤ 2 rk H ≤ 2 rk L − 4, also rk L ≥ 6, mit rk L ≤ q = 6 Gleichheit, dann rk H = 4, dim N = 3, Δ = 2. Lemma H gibt dim S ≥ 1, Lemma B auf S gibt dim S + 2 ≤ dim f_0(N) = 3, also dim S = 1. Das ist dieselbe Rechnung wie S4-06, A1.

Aus rk L = 6 = dim(K′/J) folgt **K′ = J + a_1·J + a_2·J** (im L = (J + a_1J + a_2J)/J ⊆ K′/J, gleiche Dimension).

---

## 3. Aussage E2-A: e ∈ {2, 3}

*Beweis.* f_0(N) = w·P_1, f_1(N) = a_1·f_0(N), f_2(N) = a_2·f_0(N) (f_i = a_i·f_0 nach der Skalierung). Also f_0(N) + f_1(N) + f_2(N) = w·(P_1 + a_1P_1 + a_2P_1) = w·P_2. Lemma B aus `yang_n3.md` für den Unterraum N ≠ 0 gibt dim w·P_2 ≥ dim N + 2 = 5, also e ≥ 2. Und dim w·P_2 ≤ dim P_2 = 6, also e ≤ 3. ∎

Damit sind e = 0 (S4-07 schließt ihn schon aus) und e = 1 erledigt. Dieselbe Rechnung steht in S4-06, A2(d), und in S4-11, Satz G(e).

---

## 4. Aussage E2-B: Gestalt bei e = 2

Sei ab hier e = 2, also dim w·P_2 = 5.

### 4.1 Der Kegelschnitt (Teil 1)

Die Auswertung P_2 → K^34, g ↦ w·g, hat einen Kern der Dimension 1, erzeugt von g_0. Ihr Kern sind die Polynome vom Grad ≤ 2, die auf allen a-Punkten von Σ verschwinden. Da w·P_1 Dimension 3 hat, ist g_0 ∉ P_1, also hat g_0 Grad genau 2.

**Irreduzibel.** Sei G_0(X_0, X_1, X_2) die Homogenisierung. Wäre G_0 = ℓ_1ℓ_2 mit Linearformen (K ist algebraisch abgeschlossen), dann ist keine der beiden ein Vielfaches von X_0 (sonst hätte g_0 Grad ≤ 1). Wähle eine Linearform ℓ_3, nicht proportional zu ℓ_2, und h := Dehomogenisierung von ℓ_1ℓ_3 ∈ P_2. h ist nicht proportional zu g_0, also ist j := w·h ≠ 0, und j ∈ w·P_2 ⊆ J. An jedem Index t mit j_t ≠ 0 ist w_t ≠ 0 und ℓ_1(a(t)) ≠ 0, also ℓ_2(a(t)) = 0. Der Träger von j liegt also auf der affinen Geraden {ℓ_2 = 0}. Dann sind j, a_1·j, a_2·j linear abhängig, im Widerspruch zu (SN2) für das Urbild von j unter f_0 (j ∈ J = f_0(U), und f_1 = a_1f_0, f_2 = a_2f_0). Also ist G_0 irreduzibel, und ein irreduzibler ebener Kegelschnitt über einem algebraisch abgeschlossenen Körper ist glatt (in jeder Charakteristik: Ein singulärer Kegelschnitt zerfällt in Geraden). Dieselbe Rechnung steht in S4-06, A3.

**Parametrisierung.** C_0 ≅ P¹, und die Einbettung ist die Einbettung durch die binären Formen vom Grad 2: Es gibt eine Basis φ_0, φ_1, φ_2 von S² (binäre Formen vom Grad 2 in (s, t)), so dass C_0 = {(φ_0(θ) : φ_1(θ) : φ_2(θ)) : θ ∈ P¹}. Für jeden Index t ∈ Σ wähle θ_t ∈ K² mit (1 : a_1(t) : a_2(t)) = (φ_0 : φ_1 : φ_2)(θ_t); da die erste Koordinate 1 ist, gilt φ_0(θ_t) ≠ 0, und man kann θ_t so skalieren, dass φ_0(θ_t) = 1 (K algebraisch abgeschlossen). Dann a_i(t) = φ_i(θ_t). Für g ∈ P_d sei ĝ := φ_0^d·g(φ_1/φ_0, φ_2/φ_0) ∈ S^{2d}. Dann g(a(t)) = ĝ(θ_t) für t ∈ Σ. Die Abbildung P_d → S^{2d}, g ↦ ĝ, ist surjektiv mit Kern g_0·P_{d−2} (Kegelschnitte sind projektiv normal, Dimensionen (d+1)(d+2)/2 − d(d−1)/2 = 2d + 1). Die Auswertung S^n → K^k an k verschiedenen Punkten von P¹ hat Rang min(n + 1, k).

**Zahl der Punkte.** dim w·P_4 = 9 (Abschnitt 4.2) heißt: S^8 wird an den Punkten von Σ injektiv ausgewertet, also hat Σ mindestens 9 verschiedene a-Punkte.

### 4.2 Die Zerlegungen (Teil 2)

J = w·P_2 ⊕ ⟨u_1, u_2⟩ ist nur die Wahl einer Ergänzung (dim J = 7 = 5 + 2). Dann K′ = J + a_1J + a_2J = w·P_3 + u·P_1 (P_2 + a_1P_2 + a_2P_2 = P_3 und P_0 + a_1P_0 + a_2P_0 = P_1). Es ist dim w·P_3 ≤ dim S^6 = 7 und dim u·P_1 ≤ 6, und dim K′ = 13. Also gilt überall Gleichheit: dim w·P_3 = 7, dim u·P_1 = 6, Summe direkt.

Ebenso K″ = K′ + a_1K′ + a_2K′ = w·P_4 + u·P_2, dim ≤ 9 + 12 = 21, und nach dem Zerlegungssatz dim K″ ≥ 21. Also dim w·P_4 = 9, dim u·P_2 = 12 (die Abbildung (G_1, G_2) ↦ u_1G_1 + u_2G_2 ist auf P_2² injektiv), die Summe ist direkt, und dim K″ = 21. Aus K^34 = K″ + b_0K′ und 21 + 13 = 34 folgt K^34 = K″ ⊕ b_0·K′, und b_0·K′ hat Dimension 13. Aus K′ ⊕ Θ(J³_0) ⊆ K″ und 13 + 8 = 21 folgt K″ = K′ ⊕ Θ(J³_0).

**Eindeutige Darstellung.** Jedes Element von K″ ist eindeutig w·A + u·B mit A ∈ P_4 modulo g_0·P_2 (also eindeutig als Form Â ∈ S^8) und B ∈ P_2². Es liegt genau dann in K′, wenn Â ∈ φ_0·S^6 (das Bild von P_3) und B ∈ P_1². (K′ = w·P_3 ⊕ u·P_1 sitzt verträglich in der direkten Summe.)

### 4.3 ker L (Teil 3)

Sei (j_1, j_2) ∈ ker L, j_i = w·g_i + u·γ_i mit g_i ∈ P_2, γ_i ∈ K². Dann a_1j_1 + a_2j_2 = w·(a_1g_1 + a_2g_2) + Σ_l u_l·(γ_{1l}a_1 + γ_{2l}a_2), und das soll w·g + u·γ ∈ J sein. Die Differenz w·(a_1g_1 + a_2g_2 − g) + Σ_l u_l·(γ_{1l}a_1 + γ_{2l}a_2 − γ_l) = 0 liegt in w·P_3 ⊕ u·P_1 (direkt, u-Anteil injektiv), also γ_{1l}a_1 + γ_{2l}a_2 = γ_l als Polynome, also γ_1 = γ_2 = 0. Also j_i = w·g_i, und die Bedingung lautet: ĝ_1φ_1 + ĝ_2φ_2 ∈ φ_0·S^4 (in S^6), weil w·P_3 ≅ S^6.

Lösungen: (ĝ_1, ĝ_2) = (φ_0L_1 + φ_2H, φ_0L_2 − φ_1H) mit L_i, H ∈ S². Das sind 3 + 3 + 3 = 9 Parameter mit einem Überlapp (L_1 = φ_2c, L_2 = −φ_1c, H = −φ_0c), also Dimension 8 = dim ker L (= 14 − rk L). Da dim ker L = 8 feststeht und dieser Raum 8-dimensional in ker L liegt, ist es ganz ker L. Zurückübersetzt (L_i = ℓ̂_i, H = ĥ mit ℓ_i, h ∈ P_1): g_1 = ℓ_1 + a_2h, g_2 = ℓ_2 − a_1h (modulo g_0). Alle Vektoren aus Θ(J³_0) sind c_1·w·g_1 + c_2·w·g_2, verschwinden also auf Z. ∎

### 4.4 Träger (Teil 4)

- Ein Index t mit w_t = 0 und u_1(t) = u_2(t) = 0 ist unmöglich: dann verschwänden an t alle Vektoren aus J, also aus K′ = J + a_1J + a_2J, und alle b_i·q_k, im Widerspruch zu K^34 = K′ ⊕ span(b_i·q_k).
- **|Σ| ≥ 22:** Die 7 Vektoren w·P_3 ⊆ K′ und die 15 Vektoren b_i·w·g (i = 0, 1, 2; g aus einer Basis von P_2 modulo g_0) sind nach (D) zusammen linear unabhängig (die b_i·j mit j ∈ w·P_2 sind unabhängig modulo K′), und alle verschwinden auf Z.
- **(u·P_2)|_Z = (u·P_1)|_Z:** u·P_2 ⊆ K″ = K′ ⊕ Θ(J³_0). Auf Z verschwinden Θ(J³_0) und w·P_3, also (u·P_2)|_Z ⊆ (K′)|_Z = (u·P_1)|_Z.
- **|Z| ≤ 12:** K^Z = (K″ + b_0K′)|_Z = (u·P_1)|_Z + b_0·(u·P_1)|_Z, also |Z| ≤ 2·dim (u·P_1)|_Z ≤ 12. ∎

### 4.5 Die Vektoren u·g_0 (Teil 5)

g_0 verschwindet an allen a-Punkten von Σ, also verschwinden u_1·g_0 und u_2·g_0 auf Σ. Sie liegen in u·P_2 ⊆ K″ und sind nach Teil 2 (Injektivität auf P_2²) linear unabhängig. Also hat Z mindestens zwei Indizes, und an mindestens einem Index von Z ist g_0 ≠ 0, das heißt, sein a-Punkt liegt nicht auf C_0. ∎

Folgerung (Rechnung bestätigt sie, Abschnitt 8.4): Eine Lage mit e = 2, in der alle 34 Produkte auf C_0 liegen, hat dim K″ ≤ 19 und ist unzulässig.

---

## 5. Aussage E2-C (triviale Lösungen)

Siehe Abschnitt 1.3. Ich wiederhole die Rechnung für e = 2: Sei c_i = ℓ_i + a_i·μ auf Σ und (j_0, j_1, j_2) ∈ J³_0. Nach Teil 3 sind j_1 = w·g_1, j_2 = w·g_2 und j_0 = −(a_1j_1 + a_2j_2) Vielfache von w, verschwinden also auf Z. Auf Σ ist Θ(j) = c_1j_1 + c_2j_2 = ℓ_1j_1 + ℓ_2j_2 + μ·(a_1j_1 + a_2j_2) = ℓ_1j_1 + ℓ_2j_2 − μ·j_0, auf Z sind beide Seiten 0. Also Θ(j) ∈ P_1·J = K′. Widerspruch zu (D′), weil Θ auf dem 8-dimensionalen J³_0 injektiv modulo K′ sein muss. ∎

---

## 6. Aussage E2-D (bedingter Ausschluss bei e = 2)

### 6.1 Ein Hilfssatz über binäre Formen

**Hilfssatz S (Syzygien).** Seien φ_0, φ_1, φ_2 eine Basis von S² über einem beliebigen Körper. Sind Ĉ_1, Ĉ_2 ∈ S^4 und R ∈ S^4 mit φ_2Ĉ_1 − φ_1Ĉ_2 = φ_0R, dann gibt es L_1, L_2, M ∈ S² mit Ĉ_1 = φ_0L_1 + φ_1M und Ĉ_2 = φ_0L_2 + φ_2M.

*Beweis.* Die Behauptung ist invariant unter einem Basiswechsel von S² (die Koszul-Syzygien φ_je_i − φ_ie_j spannen einen Raum auf, der nur vom Spann der φ_i abhängt). Es genügt also (φ_0, φ_1, φ_2) = (s², st, t²). Das Ideal (s², st, t²) hat den freien Syzygienmodul mit den Erzeugern σ_1 = (t, −s, 0) und σ_2 = (0, t, −s) (Hilbert–Burch, oder direkt: jede Relation x·s² + y·st + z·t² = 0 gibt s | z, t | x, …). Relationen mit Koeffizienten in S^4 bilden also S³σ_1 ⊕ S³σ_2, Dimension 8. Die Koszul-Syzygien sind s·σ_1 (für s², st), t·σ_2 (für st, t²) und t·σ_1 + s·σ_2 (für s², t²). Mit Koeffizienten aus S² erzeugen sie: S²·sσ_1 = ⟨s³, s²t, st²⟩σ_1, S²·tσ_2 = ⟨s²t, st², t³⟩σ_2, s²·(tσ_1 + sσ_2) gibt s³σ_2, t²·(tσ_1 + sσ_2) gibt t³σ_1. Das sind alle acht Basiselemente. Also ist jede Relation mit Koeffizienten in S^4 eine Kombination der Koszul-Syzygien mit Koeffizienten in S². Die gegebene Relation ist φ_0·(−R) + φ_1·(−Ĉ_2) + φ_2·Ĉ_1 = 0. Eine Koszul-Kombination A(φ_1e_0 − φ_0e_1) + B(φ_2e_0 − φ_0e_2) + C(φ_2e_1 − φ_1e_2) hat die Komponenten (Aφ_1 + Bφ_2, −Aφ_0 + Cφ_2, −Bφ_0 − Cφ_1). Vergleich: Ĉ_2 = Aφ_0 − Cφ_2, Ĉ_1 = −Bφ_0 − Cφ_1. Mit M := −C, L_1 := −B, L_2 := A folgt die Behauptung. ∎

**Hilfssatz T (Teilbarkeit).** Ist F ∈ S^n und gilt φ_0 | φ_jφ_l·F für alle j, l ∈ {1, 2} (oder φ_0 | φ_j·F für j = 1, 2), dann φ_0 | F.

*Beweis.* φ_0, φ_1, φ_2 haben keine gemeinsame Nullstelle in P¹ (sie spannen S² auf). Hat φ_0 zwei verschiedene Nullstellen, so ist an jeder ein φ_j ≠ 0, also verschwindet F dort. Ist φ_0 = λ² mit einer Linearform λ, so ist ein φ_j nicht durch λ teilbar, und aus λ² | φ_j²F bzw. λ² | φ_jF folgt λ² | F (eindeutige Primfaktorzerlegung in K[s, t]). ∎

### 6.2 Aussage

Siehe Abschnitt 0.1. Statt (INJ-B) genügt die schwächere Fassung, dass (INJ-B) für die in 6.3 auftretenden Relationen gilt; ich formuliere sie der Klarheit halber allgemein.

### 6.3 Beweis

Sei (c_1, c_2, κ) die Lösung von (C′), die das Verfahren liefert, und i ∈ {1, 2}.

1. **c_i·w ∈ K″.** w ∈ J, also c_i·w ≡ a_i·κ(w) (mod K′), und a_i·κ(w) ∈ a_iK′ ⊆ K″. Schreibe eindeutig c_i·w = w·C_i + u·E_i mit C_i ∈ P_4 (als Form Ĉ_i ∈ S^8) und E_i ∈ P_2².
2. **Grad senken, erster Schritt.** Für j ∈ {1, 2} ist w·a_j ∈ J, also c_i·w·a_j ∈ K″, also c_i·w·a_j = w·C′ + u·E′ mit C′ ∈ P_4, E′ ∈ P_2². Andererseits c_i·w·a_j = a_j·(w·C_i + u·E_i). Die Differenz ist w·(a_jC_i − C′) + u·(a_jE_i − E′) = 0 mit a_jC_i − C′ ∈ P_5 und a_jE_i − E′ ∈ P_3². **Nach (INJ-B)** ist a_jE_i = E′ ∈ P_2², also E_i ∈ P_1², und a_jC_i − C′ ∈ g_0·P_3, das heißt φ_jĈ_i = φ_0Ĉ′ in S^10. Nach Hilfssatz T ist φ_0 | Ĉ_i, also C_i ∈ P_3 (modulo g_0).
3. **Grad senken, zweiter Schritt.** w·a_ja_l ∈ w·P_2 ⊆ J, also c_i·w·a_ja_l ∈ K″, = w·C‴ + u·E‴. Mit C_i ∈ P_3, E_i ∈ P_1² ist die Differenz w·(a_ja_lC_i − C‴) + u·(a_ja_lE_i − E‴) = 0 mit Graden ≤ 5 und ≤ 3. **Nach (INJ-B)** ist a_ja_lE_i ∈ P_2², also E_i konstant (E_i ∈ K²), und φ_jφ_lĈ_i ∈ φ_0·S^8, also nach Hilfssatz T φ_0 | Ĉ_i, also C_i ∈ P_2 (modulo g_0).
4. **Vergleich der höchsten Anteile.** Für g ∈ P_2 ist w·g ∈ J und c_i·w·g = w·(C_ig) + u·(E_ig) mit C_ig ∈ P_4, E_ig ∈ P_2²: das ist die eindeutige Darstellung in K″. Schreibe κ(w·g) = w·F_g + u·H_g mit F_g ∈ P_3, H_g ∈ P_1². (C′) sagt w·(C_ig − a_iF_g) + u·(E_ig − a_iH_g) ∈ K′. Nach 4.2 (eindeutige Darstellung) heißt das: E_ig − a_iH_g ∈ P_1² und Ĉ_iĝ − φ_iF̂_g ∈ φ_0·S^6, für i = 1 und i = 2 mit denselben F_g, H_g.
5. **u-Anteil.** Mit g = a_1²: Die quadratischen Anteile geben E_1·a_1² = a_1·H^{(1)} und E_2·a_1² = a_2·H^{(1)} (H^{(1)} ∈ (S¹)² homogener linearer Anteil von H_g). Aus der ersten H^{(1)} = E_1·a_1, eingesetzt E_2·a_1² = E_1·a_1a_2, also E_1 = E_2 = 0 (Monome vergleichen).
6. **w-Anteil.** Wähle g ∈ P_2 mit ĝ teilerfremd zu φ_0 (etwa ĝ = (φ_1 + λφ_2)² mit passendem λ ∈ K; da φ_1, φ_2 an keiner Nullstelle von φ_0 beide verschwinden, schließt man nur endlich viele λ aus). Aus Ĉ_1ĝ ≡ φ_1F̂ und Ĉ_2ĝ ≡ φ_2F̂ (mod φ_0) folgt (φ_2Ĉ_1 − φ_1Ĉ_2)·ĝ ≡ 0 (mod φ_0), also φ_0 | φ_2Ĉ_1 − φ_1Ĉ_2 (ĝ teilerfremd zu φ_0). Hilfssatz S gibt Ĉ_i = φ_0L_i + φ_iM, also C_i = ℓ_i + a_i·μ (modulo g_0) mit ℓ_i, μ ∈ P_1.
7. **Abschluss.** Mit E_i = 0 ist c_i·w = w·C_i, also c_i = ℓ_i + a_i·μ auf Σ. Nach E2-C ist Θ(J³_0) ⊆ K′, Widerspruch zu (D′). ∎

**Wo (INJ-B) gebraucht wird:** nur in den Schritten 2 und 3, um aus c_i·w·a_j ∈ K″ und c_i·w·a_ja_l ∈ K″ zu schließen, dass C_i Grad ≤ 2 hat und E_i konstant ist. Das ist genau die Stelle, an der auch S4-07, Abschnitt 6.2, im Fall e = 3 (INJ5) braucht.

Bemerkung zum Vergleich mit S4-07, Abschnitt 6.2, Schritt 5: Dort wird das Teilbarkeitsargument mit homogenen Polynomen in a_1, a_2 geführt. Bei e = 2 gibt es auf dem Kegelschnitt keine homogene Zerlegung im selben Sinn; der Hilfssatz S ersetzt sie.

---

## 7. Das Hindernis (genau benannt)

Ohne (INJ-B) kann es Relationen w·F + u·G = 0 mit F ∈ P_5, G ∈ P_3² geben, die nicht trivial sind. Solche Relationen sind nicht ausgeschlossen: Der Raum w·P_5 + u·P_3 hätte ohne Relation die Dimension 11 + 20 = 31 ≤ 34, eine Zählung erzwingt also keine Relation, verbietet aber auch keine. Erst auf der nächsten Stufe (w·P_6 + u·P_4, ohne Relation 13 + 30 > 34) sind Relationen erzwungen.

Drei Wege, (INJ-B) zu umgehen, habe ich geprüft. Alle scheitern an einer genau benennbaren Stelle (Abschnitt 9). Kurz:

1. **Sättigung.** Es würde genügen, dass jeder Vektor v mit Träger in Σ und P_2·v ⊆ K″ schon in w·P_2 liegt (dann ist c_i·w ∈ w·P_2 sofort). Die Rechnung zeigt: Das ist in vielen zulässigen Lagen falsch; der Raum dieser v hat dort bis zu 19 statt 5 Dimensionen (Abschnitt 8.3). Die Trivialität kommt also nicht aus einer einzelnen Gleichung c_i·J ⊆ K″, sondern aus dem Zusammenspiel von i = 1 und i = 2 über dasselbe κ.
2. **Nur Σ.** Schränkt man (C′) auf die Koordinaten in Σ ein (dividiert durch w), so bleiben in den meisten Lagen nur triviale Lösungen, in manchen aber nicht (Abschnitt 8.3). Die Koordinaten in Z tragen also wesentlich bei; ein Beweis kann sich nicht auf den Kegelschnitt allein stützen.
3. **Graduierung.** Im graduierten Modul gr(P_•·J) ist der w-Anteil jeder Stufe nur 2-dimensional (Werte an den beiden Schnittpunkten von C_0 mit der unendlich fernen Geraden). Ein Argument, das nur höchste Anteile vergleicht, sieht also fast nichts vom w-Anteil und kann die Trivialität von C_i nicht erzwingen.

Was ein Beweis leisten müsste: aus der gemeinsamen Gleichung c_i·j ≡ a_i·κ(j) (i = 1, 2, j ∈ w·P_2) und der Gestalt aus E2-B zeigen, dass die Abweichungen δ_{i,j} := (a_jC_i − C′, a_jE_i − E′) aus Schritt 2, die Relationen sind, verschwinden. Ihre höchsten Anteile sind (φ_jφ_i·σ, x_jx_i·η) mit festen σ, η (aus κ). Ein Ausschluss bräuchte, dass der Raum der höchsten Anteile von Relationen der Stufe 3 keine solche Familie (für j, i ∈ {1, 2}) enthält. Das habe ich nicht gezeigt.

---

## 8. Rechnung

### 8.1 Vorgehen

Exakt über GF(32003) in 64-Bit-Ganzzahlen (Gauß-Elimination modulo p, Anhang A, eigener Code, unabhängig von S4-07 geschrieben). Eine Lage besteht aus 34 a-Punkten, w (0 genau auf Z) und u_1, u_2. Daraus J := w·P_2 + ⟨u_1, u_2⟩, K′ := J + a_1J + a_2J, K″ := K′ + a_1K′ + a_2K′. **Zulässig** heißt: dim J = 7, dim K′ = 13, dim K″ = 21, dim N = 3, dim ker L = 8 (die Werte, die E2-B erzwingt). Für zulässige Lagen wird (C′) als lineares System in (c_1, c_2, κ) gelöst (κ_k ∈ K′ in einer Basis), die Dimension der Lösungsmenge V_C, der Rang ihrer Projektion auf (c_1, c_2) und der Rang zusammen mit den 8 trivialen Richtungen (ℓ_1 + a_1μ, ℓ_2 + a_2μ) bestimmt, und für zwei zufällige Lösungen der Rang von Θ auf ker L modulo K′. Ein Verfahren verlangt Rang 8.

Familien:
- **fam** (`e2fam.py`): Punkte von Σ auf einem Kegelschnitt (Parabel a_2 = a_1², Hyperbel a_1a_2 = 1 oder allgemeiner Kegelschnitt aus zufälligen φ_i), 9 bis 34 verschiedene Punkte mit Fasern, |Z| von 0 bis 12; Z-Punkte (a) höchstens 3 Punkte mit allgemeinem u, (b) je höchstens 3 Punkte nur für u_1 bzw. nur für u_2, (c) auf dem Kegelschnitt; u auf Σ zufällig, halb null oder null.
- **inj** (`e2inj.py`): Lagen mit **absichtlich verletzter (INJ-B)**: zufällige F ∈ P_{3..5}, G ∈ P_{1..3}² (manchmal G_2 = 0), Σ auf der Parabel, u auf Σ zufällig (teils halb null), w := −(u·G)/F auf Σ (nur Lagen mit F ≠ 0 und u·G ≠ 0 auf Σ); auf Z ist u(t) := λ_t·(G_2, −G_1)(a(t)), also u·G = 0 dort. Dann gilt w·F + u·G = 0 mit Graden ≤ 5 und ≤ 3. Lagen, in denen die Relation schon in w·P_4 + u·P_2 fällt, verwirft die Zulässigkeitsprüfung (dim K″ < 21).

### 8.2 Ergebnisse (C′)

Rechenblock 1 (60 s je Lauf, ein Kern):

| Lauf | Lagen | zulässig | Ergebnis in allen zulässigen Lagen (dim V_C, Rang c, Rang mit trivial, Rang Θ) |
|---|---|---|---|
| fam, Saat 1 | 8 496 | 3 506 | (57, 8, 8, 0) |
| inj, Saat 1 | 11 613 | 3 147 | (57, 8, 8, 0), aufgeteilt nach (deg F, deg G): (4,3) 678, (5,3) 648, (5,2) 630, (3,3) 622, (5,1) 569 |

Rechenblock 2 (300 s je Lauf, vier Läufe parallel auf 4 Kernen): Tabelle in Abschnitt 8.5.

**Deutung:** dim V_C = 57 ist genau die triviale Lösungsmenge (49 Dimensionen κ mit Werten in J bei c = 0, dazu 8 für c = (ℓ_1 + a_1μ, ℓ_2 + a_2μ)), wie in S4-07 bei e = 3. Die Projektion auf (c_1, c_2) hat Rang 8 und ändert sich durch Hinzunehmen der trivialen Richtungen nicht, liegt also im trivialen Raum. Θ hat Rang 0.

### 8.3 Teilsysteme und Sättigung (Rechenblock 1)

`e2sub.py`, 1 585 zulässige inj-Lagen (Saat 2): Löst man (C′) nur für j ∈ w·P_2, bleibt c auf Σ trivial (Rang 8 = trivial, Θ Rang 0). Nur für j ∈ {w, wa_1, wa_2} bleiben 12 bis 14 Dimensionen (nicht trivial, Θ Rang 2 bis 5), nur für j = w 16 bis 28 Dimensionen. Also braucht die Trivialität die Gleichungen für ganz w·P_2, und mehr als (C′) für j ∈ w·P_2 braucht sie nicht.

`e2colon2.py` (Saat 4, 10 442 zulässige Lagen): Der Raum {v : Träger in Σ, P_2·v ⊆ K″} hat in 5 842 Lagen die Dimension 5 (= w·P_2), in den übrigen 6 bis 19. Weg 1 aus Abschnitt 7 ist also nicht gangbar. `e2colon.py` (Saat 3): {v : P_1·v ⊆ K′} = J in allen 10 663 Lagen (das ist beweisbar, siehe 9.1).

`e2sigma.py` (Saat 6, 5 238 zulässige Lagen): (C′) nur auf Σ (durch w geteilt, K′ und K″ auf Σ eingeschränkt). In 4 952 Lagen (dort ist der auf Σ eingeschränkte Raum K″|_Σ 19-dimensional) nur triviale Lösungen; in 286 Lagen mit kleinerem K″|_Σ (15 bis 18) Lösungsrang 16 bis 32. Weg 2 aus Abschnitt 7 ist also nicht gangbar.

### 8.4 Gegenproben

- **Löser nicht blind** (`gegenprobe.py`, eigener Code): Nach zufälligem Basiswechsel und Skalierung (Brent-Gleichungen danach fehlerfrei geprüft) liefert derselbe Löser an den echten Verfahren (dim V_C, dim J³_0, Rang Θ) = (77, 7, 7) für `3x2x7-r35-hk71.json`, (60, 6, 6) für `3x2x6-r30-hk71.json`, (45, 5, 5) für `3x2x5-r25-hk71.json`. Voller Rang, wo ein Verfahren existiert. Die ersten beiden Zahlen stimmen mit S4-07, Abschnitt 7.1, überein.
- **Alle Punkte auf C_0** (`z0.py`, 300 Lagen mit Z = ∅): immer dim K″ = 19, nie zulässig, wie E2-B, Teil 5, verlangt.

### 8.5 Rechenblock 2

Start 10:10:04, Ende 10:15:04 UTC (nach Commit eaaa753), vier Läufe parallel, je 300 s, 4 Kerne.

| Lauf | Lagen | zulässig | Ergebnis in allen zulässigen Lagen (dim V_C, Rang c, Rang mit trivial, Rang Θ) |
|---|---|---|---|
| fam, Saat 11 | 42 582 | 17 542 | (57, 8, 8, 0) |
| fam, Saat 12 | 44 067 | 18 242 | (57, 8, 8, 0) |
| inj, Saat 11 | 58 229 | 15 977 | (57, 8, 8, 0); (deg F, deg G): (3,3) 3 348, (4,3) 3 328, (5,3) 3 322, (5,2) 3 098, (5,1) 2 881 |
| inj, Saat 12 | 56 319 | 15 657 | (57, 8, 8, 0); (3,3) 3 167, (4,3) 3 240, (5,3) 3 375, (5,2) 3 120, (5,1) 2 755 |

Unzulässige Lagen scheitern meist an dim K″ < 21 (vor allem 19 und 20) oder dim K′ < 13. Zusammen mit Block 1: **74 071 zulässige Lagen, davon 34 265 mit verletzter (INJ-B), in keiner eine nicht triviale Lösung von (C′), Rang Θ immer 0.** Die Stichprobe ist nicht erschöpfend: Alle inj-Lagen haben Σ auf der Parabel, und die Relationen sind von der einen gebauten Art.

---

## 9. Gescheiterte Ansätze (mit Grund)

### 9.1 Sättigung (K″ : P_2) ∩ K^Σ = w·P_2

Idee: c_i·w liegt in X := {v : Träger in Σ, P_2·v ⊆ K″}. Wäre X = w·P_2, dann c_i ∈ P_2 auf Σ ohne (INJ-B), und Schritte 4 bis 7 laufen. Die analoge Aussage eine Stufe tiefer, {v ∈ K′ : a_1v, a_2v ∈ K′} = J, ist richtig (Beweis: v = w·F + u·H mit F ∈ P_3, H ∈ P_1²; a_jv ∈ K′ ⊆ K″ direkt zerlegt gibt φ_jF̂ ∈ φ_0S^6 für j = 1, 2, also nach Hilfssatz T F ∈ P_2, und a_jH ∈ P_1², also H konstant). **Gescheitert:** X ist in fast der Hälfte der zulässigen Lagen größer als w·P_2 (Abschnitt 8.3). Grund: Eine Stufe höher fehlt die Direktheit von w·P_5 + u·P_3.

### 9.2 Einschränkung auf Σ

Idee: Auf Σ ist w ≠ 0; mit ψ := u/w wird (C′) zu c_ig ≡ a_ik(g) modulo P_3 + ψ·P_1² mit k(g) ∈ P_3 + ψ·P_1², und P_d ist auf Σ der Raum der binären Formen vom Grad 2d. **Gescheitert:** In 286 von 5 238 Lagen hat das eingeschränkte System nicht triviale Lösungen, die erst durch die Bedingungen auf Z verschwinden (Abschnitt 8.3).

### 9.3 Höchste Anteile (graduierter Modul)

Idee: (C′) modulo K′ ist eine Aussage über die Abbildung j ↦ [c_ij] ∈ K″/K′ = gr_2, und dort gilt [c_ij] = a_i·κ̄(j) mit κ̄ : J → K′/J = gr_1. (D′) verlangt, dass Θ̄ = a_1κ̄(j_1) + a_2κ̄(j_2) von ker L nach gr_2 (beide 8-dimensional) bijektiv ist. **Gescheitert:** gr_d hat bei e = 2 einen w-Anteil der Dimension 2 und einen u-Anteil der Dimension 2(d + 1). Für den u-Anteil braucht man, dass κ̄_u(w·P_2) mindestens 3-dimensional ist; das widerspricht nichts, solange man nur höchste Anteile vergleicht. Die Information, die die Trivialität erzwingt, steckt in den niedrigeren Anteilen und in den Relationen der Stufe 3.

### 9.4 Zählung über Z

Idee: Teil 4 und 5 von E2-B mit einer Zählung pro Faser wie in S4-07, Abschnitt 4.4.3, zu einem Widerspruch führen. **Gescheitert:** Bei e = 2 gibt es zwei Vektoren u_1, u_2, und die Bedingung (u·P_2)|_Z = (u·P_1)|_Z erlaubt bis zu 6 Punkte (je 3 für die beiden Richtungen von u) oder mehr Punkte mit gemischten Richtungen; die Schranken |Z| ≤ 12 und |Σ| ≥ 22 vertragen sich mit 34. Ein Widerspruch aus Zählung allein ergibt sich nicht.

---

## 10. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Rechenblock 1: einzelne Läufe zwischen etwa 09:59 und 10:09 UTC, zusammen etwa 7 Minuten Rechenzeit auf einem Kern, ohne Commit dazwischen, deshalb als ein Block gezählt (Wandzeit etwa 10 Minuten). Danach Commit eaaa753 (10:09:57 UTC).
- Rechenblock 2: 10:10:04 bis 10:15:04 UTC, vier Läufe parallel auf 4 Kernen, je 300 s. Danach nur noch Auswertung, kein weiterer Block.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs.

---

## Anhang A: Programme (Python 3, numpy, keine Gleitkommazahlen)

Alle rechnen modulo p = 32003. Aufrufe aus einem Verzeichnis mit allen Dateien: `python3 e2fam.py <Saat> <Sekunden>`, `python3 e2inj.py <Saat> <Sekunden>`, `python3 e2sub.py 2 60`, `python3 e2colon.py 3 60`, `python3 e2colon2.py 4 45`, `python3 e2sigma.py 6 45`, `python3 z0.py`, `python3 gegenprobe.py <Verfahrensdatei> 1`. Die Hilfsmodule `e2fam_gen.py` und `e2inj_gen.py` entstehen aus `e2fam.py` bzw. `e2inj.py` durch Abschneiden ab der Zeile `t0=time.time()` und Ersetzen der Zeile `seed=…` durch `rng=None` (sed-Befehl unten). Die Laufzeitgrenze macht die Zahl der Lagen maschinenabhängig.

```sh
sed -e 's/^seed=int(sys.argv\[1\]).*$/rng=None/' -e '/^t0=time.time()/,$d' e2inj.py > e2inj_gen.py
sed -e 's/^seed=int(sys.argv\[1\]).*$/rng=None/' -e '/^t0=time.time()/,$d' e2fam.py > e2fam_gen.py
```

### ff.py

SHA-256 `5a9b6cf0e553461ed611fbb17e67a48a4ffb8bb3c4192ca052b611cc1cbfad30`

```python
import numpy as np
P=32003
def rref(M,p=P):
    M=np.array(M,dtype=np.int64)%p
    if M.ndim==1: M=M[None,:]
    r=0;piv=[];rows,cols=M.shape
    for c in range(cols):
        if r==rows: break
        nz=np.nonzero(M[r:,c])[0]
        if len(nz)==0: continue
        k=r+nz[0]
        if k!=r: M[[r,k]]=M[[k,r]]
        inv=pow(int(M[r,c]),p-2,p)
        M[r]=(M[r]*inv)%p
        col=M[:,c].copy();col[r]=0
        nzr=np.nonzero(col)[0]
        if len(nzr): M[nzr]=(M[nzr]-np.outer(col[nzr],M[r]))%p
        piv.append(c);r+=1
    return M[:r],piv
def rank(M,p=P):
    M=np.asarray(M)
    if M.size==0: return 0
    return len(rref(M,p)[1])
def nullspace(M,p=P):
    M=np.array(M,dtype=np.int64)%p
    n=M.shape[1]
    R,piv=rref(M,p)
    free=[c for c in range(n) if c not in piv]
    N=np.zeros((len(free),n),dtype=np.int64)
    for a,f in enumerate(free):
        N[a,f]=1
        for i,c in enumerate(piv): N[a,c]=(-R[i,f])%p
    return N
def basis(M):
    M=np.asarray(M)
    if M.size==0: return M.reshape(0,M.shape[-1] if M.ndim>1 else 0)
    return rref(M)[0]
```

### lage.py

SHA-256 `6afc986659a5f26b4fd1a78e36d0a72d4b4ecd483550c1fd2711af319c57c300`

```python
import numpy as np
from ff import *
def mons(a1,a2,d):
    out=[]
    for tot in range(d+1):
        for i in range(tot+1):
            out.append(pow_vec(a1,i)*pow_vec(a2,tot-i)%P)
    return np.array(out,dtype=np.int64)
def pow_vec(v,e):
    r=np.ones_like(v)
    for _ in range(e): r=r*v%P
    return r
def mulsp(vecs,R):  # span of products of rows
    return np.array([(x*y)%P for x in vecs for y in R],dtype=np.int64)
def analyse(a1,a2,J,rng,trials=2,full=True):
    """J: rows spanning J (any number). returns dict"""
    r=len(a1);info={}
    Jb=basis(J);info['dimJ']=len(Jb)
    if len(Jb)!=7: return info
    A=[np.ones(r,dtype=np.int64),a1,a2]
    Kp=basis(np.vstack([Jb,a1*Jb%P,a2*Jb%P]));info['dimK1']=len(Kp)
    if len(Kp)!=13: return info
    Kpp=basis(np.vstack([Kp,a1*Kp%P,a2*Kp%P]));info['dimK2']=len(Kpp)
    # N: y in K^7 with a_i*(y J) in J
    AnnJ=nullspace(Jb)
    M1=(AnnJ*a1[None,:]%P)@Jb.T%P; M2=(AnnJ*a2[None,:]%P)@Jb.T%P
    N=nullspace(np.vstack([M1,M2]));info['dimN']=len(N)
    KL=nullspace(np.hstack([M1,M2]));info['dimkerL']=len(KL)
    if not full: return info
    # (C') system
    m=7;kd=13;Ann=nullspace(Kp);nun=2*r+m*kd;eqs=[]
    for i in range(2):
        for k in range(m):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*r:(i+1)*r]=Ann*Jb[k][None,:]%P
            Mi=(Ann*A[i+1][None,:]%P)@Kp.T%P
            blk[:,2*r+kd*k:2*r+kd*(k+1)]=(-Mi)%P
            eqs.append(blk)
    V=nullspace(np.vstack(eqs));info['dimVC']=len(V)
    C=V[:,:2*r]; info['rankC']=rank(C) if len(C) else 0
    # trivial c's: (l1 + a1 mu, l2 + a2 mu), l,mu in P1  restricted
    P1=[A[0],a1,a2]
    triv=[np.concatenate([l,np.zeros(r,dtype=np.int64)]) for l in P1]+[np.concatenate([np.zeros(r,dtype=np.int64),l]) for l in P1]+[np.concatenate([a1*mu%P,a2*mu%P]) for mu in P1]
    triv=np.array(triv)
    info['rankTriv']=rank(triv)
    info['rankC+Triv']=rank(np.vstack([C,triv])) if len(C) else rank(triv)
    best=0
    for _ in range(trials):
        x=rng.integers(0,P,len(V))@V%P
        c1=x[:r];c2=x[r:2*r]
        Th=[(c1*(z[:7]@Jb%P)+c2*(z[7:]@Jb%P))%P for z in KL]
        if len(Th): best=max(best,rank(np.vstack([Kp,np.array(Th)]))-len(Kp))
    info['rankTheta']=best
    return info
```

### e2fam.py

SHA-256 `884e716d0b66b61a93e3f8ff4a60cf6c22f809116592cc764559f0d778017ee2`

```python
import numpy as np,sys,time
from ff import *
from lage import *
seed=int(sys.argv[1]);T=float(sys.argv[2]);rng=np.random.default_rng(seed)
r=34
def R(n): return rng.integers(0,P,n)
def NZ(n): return rng.integers(1,P,n)
def conic_pts(k,kind):
    if kind=='par':
        t=rng.choice(P,k,replace=False); return t%P, t*t%P
    if kind=='hyp':
        t=rng.choice(np.arange(1,P),k,replace=False); return t%P, np.array([pow(int(x),P-2,P) for x in t])
    # general: random phi
    while True:
        Phi=R(9).reshape(3,3)
        if rank(Phi)==3: break
    a1=[];a2=[]
    while len(a1)<k:
        s,t=R(2)
        v=[(Phi[i,0]*s*s+Phi[i,1]*s*t+Phi[i,2]*t*t)%P for i in range(3)]
        if v[0]==0: continue
        i0=pow(int(v[0]),P-2,P);a1.append(v[1]*i0%P);a2.append(v[2]*i0%P)
    return np.array(a1),np.array(a2)
def make():
    kind=rng.choice(['par','hyp','gen'])
    nZ=int(rng.integers(0,13)); nS=r-nZ
    kS=int(rng.integers(9,nS+1))
    p1,p2=conic_pts(kS,kind)
    idx=np.concatenate([np.arange(kS),rng.integers(0,kS,nS-kS)])
    a1=list(p1[idx]);a2=list(p2[idx])
    w=list(NZ(nS))
    mode=rng.integers(0,3)
    # Z points
    if nZ:
        if mode==0:   # <=3 points, u generic
            npz=int(rng.integers(1,4));zp=R(2*npz).reshape(npz,2)
            zi=rng.integers(0,npz,nZ); a1+=list(zp[zi,0]);a2+=list(zp[zi,1])
            Uz=R(2*nZ).reshape(2,nZ)
        elif mode==1: # 3 pts for u1, 3 pts for u2
            zp=R(12).reshape(6,2);zi=rng.integers(0,6,nZ)
            a1+=list(zp[zi,0]);a2+=list(zp[zi,1])
            Uz=np.zeros((2,nZ),dtype=np.int64)
            Uz[0,zi<3]=NZ(int((zi<3).sum()));Uz[1,zi>=3]=NZ(int((zi>=3).sum()))
        else:          # Z on the conic too (but w=0 there)
            npz=int(rng.integers(1,7));zp1,zp2=conic_pts(npz,'par' if kind=='par' else kind)
            zi=rng.integers(0,npz,nZ);a1+=list(zp1[zi]);a2+=list(zp2[zi])
            Uz=R(2*nZ).reshape(2,nZ)
    else: Uz=np.zeros((2,0),dtype=np.int64)
    a1=np.array(a1)%P;a2=np.array(a2)%P
    w=np.concatenate([w,np.zeros(nZ,dtype=np.int64)])
    smode=rng.integers(0,3)
    Us=R(2*nS).reshape(2,nS)
    if smode==1: Us[:,rng.random(nS)<0.5]=0
    if smode==2: Us[:]=0
    U=np.hstack([Us,Uz])
    J=np.vstack([mons(a1,a2,2)*w%P,U])
    return dict(kind=kind,nZ=nZ,kS=kS,mode=int(mode),smode=int(smode)),a1,a2,J
t0=time.time();stats={};n=0
while time.time()-t0<T:
    meta,a1,a2,J=make();n+=1
    inf=analyse(a1,a2,J,rng,full=False)
    key=tuple(inf.get(k) for k in ['dimJ','dimK1','dimK2','dimN','dimkerL'])
    if key==(7,13,21,3,8):
        inf=analyse(a1,a2,J,rng)
        key=('OK',inf['dimVC'],inf['rankC'],inf['rankTriv'],inf['rankC+Triv'],inf['rankTheta'])
    stats[key]=stats.get(key,0)+1
print('seed',seed,'n',n)
for k,v in sorted(stats.items(),key=lambda x:-x[1]): print(k,v)
```

### e2inj.py

SHA-256 `bbd0d1744a3fbc1e18992aca0aeae607feb337292009178b46750499d3cefe96`

```python
import numpy as np,sys,time
from ff import *
from lage import *
seed=int(sys.argv[1]);T=float(sys.argv[2]);rng=np.random.default_rng(seed)
r=34
def R(n): return rng.integers(0,P,n)
def NZ(n): return rng.integers(1,P,n)
def inv(v): return np.array([pow(int(x),P-2,P) for x in v],dtype=np.int64)
def conic_pts(k):
    t=rng.choice(P,k,replace=False); return t%P, t*t%P   # parabola a2=a1^2
def poly_eval(coef,a1,a2,d):
    return coef@mons(a1,a2,d)%P
def make():
    dF=int(rng.integers(3,6)); dG=int(rng.integers(1,4))
    nm=lambda d:(d+1)*(d+2)//2
    Fc=R(nm(dF)); G1=R(nm(dG)); G2=R(nm(dG))
    if rng.random()<0.3: G2[:]=0
    nZ=int(rng.integers(0,13)); nS=r-nZ
    kS=int(rng.integers(9,nS+1))
    p1,p2=conic_pts(kS)
    idx=np.concatenate([np.arange(kS),rng.integers(0,kS,nS-kS)])
    s1=p1[idx];s2=p2[idx]
    Us=R(2*nS).reshape(2,nS)
    if rng.random()<0.4: Us[:,rng.random(nS)<0.5]=0
    F=poly_eval(Fc,s1,s2,dF); uG=(Us[0]*poly_eval(G1,s1,s2,dG)+Us[1]*poly_eval(G2,s1,s2,dG))%P
    ok=(F!=0)&(uG!=0)
    if not ok.all(): return None
    w=(-uG*inv(F))%P
    # Z
    zmode=rng.integers(0,3)
    if nZ:
        if zmode==0: npz=int(rng.integers(1,4))
        elif zmode==1: npz=int(rng.integers(4,7))
        else: npz=nZ
        zp=R(2*npz).reshape(npz,2);zi=np.concatenate([np.arange(min(npz,nZ)),rng.integers(0,npz,max(0,nZ-npz))])[:nZ]
        z1=zp[zi,0];z2=zp[zi,1]
        g1=poly_eval(G1,z1,z2,dG);g2=poly_eval(G2,z1,z2,dG)
        lam=NZ(nZ);Uz=np.vstack([g2*lam%P,(-g1*lam)%P])
        if (np.all(Uz==0,axis=0)).any(): return None
    else:
        z1=z2=np.zeros(0,dtype=np.int64);Uz=np.zeros((2,0),dtype=np.int64)
    a1=np.concatenate([s1,z1])%P;a2=np.concatenate([s2,z2])%P
    w=np.concatenate([w,np.zeros(nZ,dtype=np.int64)]);U=np.hstack([Us,Uz])
    J=np.vstack([mons(a1,a2,2)*w%P,U])
    return dict(dF=dF,dG=dG,nZ=nZ,kS=kS,zmode=int(zmode)),a1,a2,J
t0=time.time();stats={};n=0;keep=[]
while time.time()-t0<T:
    x=make()
    if x is None: continue
    meta,a1,a2,J=x;n+=1
    inf=analyse(a1,a2,J,rng,full=False)
    key=tuple(inf.get(k) for k in ['dimJ','dimK1','dimK2','dimN','dimkerL'])
    if key==(7,13,21,3,8):
        inf=analyse(a1,a2,J,rng)
        key=('OK',meta['dF'],meta['dG'],inf['dimVC'],inf['rankC'],inf['rankC+Triv'],inf['rankTheta'])
    else: key=('bad',)+key
    stats[key]=stats.get(key,0)+1
print('seed',seed,'n',n)
for k,v in sorted(stats.items(),key=lambda x:-x[1]): print(k,v)
```

### sub.py

SHA-256 `09436a6c1fbe17a1c57eb6d166f403c9efaba745549897049bada9f7b46bd657`

```python
import numpy as np,sys
from ff import *
from lage import *
def subsystem(a1,a2,J,Jsub,Sigma,rng):
    """solve c_i*j - a_i*kappa(j) in K' for j in rows Jsub only; return rank of c|Sigma projection vs trivial, and Theta rank"""
    r=len(a1);Jb=basis(J);A=[a1,a2]
    Kp=basis(np.vstack([Jb,a1*Jb%P,a2*Jb%P]));kd=len(Kp);Ann=nullspace(Kp)
    m=len(Jsub);nun=2*r+m*kd;eqs=[]
    for i in range(2):
        for k in range(m):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*r:(i+1)*r]=Ann*Jsub[k][None,:]%P
            Mi=(Ann*A[i][None,:]%P)@Kp.T%P
            blk[:,2*r+kd*k:2*r+kd*(k+1)]=(-Mi)%P
            eqs.append(blk)
    V=nullspace(np.vstack(eqs))
    S=np.array(Sigma)
    Cs=np.hstack([V[:,S],V[:,r+S]])
    one=np.ones(r,dtype=np.int64);P1=[one,a1,a2];z=np.zeros(len(S),dtype=np.int64)
    triv=[np.concatenate([l[S],z]) for l in P1]+[np.concatenate([z,l[S]]) for l in P1]+[np.concatenate([(a1*mu%P)[S],(a2*mu%P)[S]]) for mu in P1]
    triv=np.array(triv)
    AnnJ=nullspace(Jb)
    M1=(AnnJ*a1[None,:]%P)@Jb.T%P; M2=(AnnJ*a2[None,:]%P)@Jb.T%P
    KL=nullspace(np.hstack([M1,M2]))
    best=0
    for _ in range(2):
        x=rng.integers(0,P,len(V))@V%P;c1=x[:r];c2=x[r:2*r]
        Th=[(c1*(z_[:7]@Jb%P)+c2*(z_[7:]@Jb%P))%P for z_ in KL]
        best=max(best,rank(np.vstack([Kp,np.array(Th)]))-len(Kp))
    return rank(Cs),rank(triv),rank(np.vstack([Cs,triv])),best
```

### e2sub.py

SHA-256 `27415c38c34eec169c522b30ec7f00b16a60ab510071eb41baa2bd7d078cdf91`

```python
import numpy as np,sys,time
from ff import *
from lage import *
from sub import subsystem
import e2inj_gen as G
seed=int(sys.argv[1]);T=float(sys.argv[2]);rng=np.random.default_rng(seed);G.rng=rng
t0=time.time();stats={};n=0
while time.time()-t0<T:
    x=G.make()
    if x is None: continue
    meta,a1,a2,J=x
    inf=analyse(a1,a2,J,rng,full=False)
    key=tuple(inf.get(k) for k in ['dimJ','dimK1','dimK2','dimN','dimkerL'])
    if key!=(7,13,21,3,8): continue
    n+=1
    nS=34-meta['nZ'];Sigma=list(range(nS))
    wP2=J[:6]
    res=[]
    for name,Jsub in [('wP2',wP2),('w,wa',wP2[:3]),('w',wP2[:1]),('all',basis(J))]:
        res.append((name,)+subsystem(a1,a2,J,Jsub,Sigma,rng))
    key=tuple(res)
    stats[key]=stats.get(key,0)+1
print('seed',seed,'n',n)
for k,v in sorted(stats.items(),key=lambda x:-x[1]): print(v,k)
```

### colon.py

SHA-256 `00dce3abc3eed6dc27858cd6ab7fe58833c90a21029b897a994d7db14484b8d4`

```python
import numpy as np
from ff import *
def colon(Target,mults,r):
    """{k in K^r : m*k in span(Target) for all m in mults}"""
    Ann=nullspace(Target)
    M=np.vstack([(Ann*m[None,:])%P for m in mults])
    return nullspace(M)
```

### e2colon.py

SHA-256 `63d23ddd8a03992fb93070acd7d22baffbed8948eb7ee759511baf5ca966d3c2`

```python
import numpy as np,sys,time
from ff import *
from lage import *
from colon import colon
import e2inj_gen as G
import e2fam_gen as Fm
seed=int(sys.argv[1]);T=float(sys.argv[2]);rng=np.random.default_rng(seed);G.rng=rng;Fm.rng=rng
t0=time.time();stats={};n=0
while time.time()-t0<T:
    src='inj' if rng.random()<0.5 else 'fam'
    x=G.make() if src=='inj' else Fm.make()
    if x is None: continue
    meta,a1,a2,J=x
    inf=analyse(a1,a2,J,rng,full=False)
    key=tuple(inf.get(k) for k in ['dimJ','dimK1','dimK2','dimN','dimkerL'])
    if key!=(7,13,21,3,8): continue
    n+=1;r=34
    Jb=basis(J);Kp=basis(np.vstack([Jb,a1*Jb%P,a2*Jb%P]));Kpp=basis(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))
    one=np.ones(r,dtype=np.int64)
    P2=mons(a1,a2,2);P1=mons(a1,a2,1)
    X2=colon(Kpp,list(P2),r);X1=colon(Kpp,list(P1),r);Y1=colon(Kp,list(P1),r)
    # relations level 3: dim(wP5+uP3)
    w=J[0];U=Jb  # placeholder
    key=(src,len(X2),rank(np.vstack([X2,Jb])),len(X1),rank(np.vstack([X1,Kp])),len(Y1),rank(np.vstack([Y1,Jb])))
    stats[key]=stats.get(key,0)+1
print('seed',seed,'n',n)
for k,v in sorted(stats.items(),key=lambda x:-x[1]): print(v,k)
```

### e2colon2.py

SHA-256 `397fc5131a7665490342e7b646c3aa0c042d3bf54ca8c783165185e5668d3326`

```python
import numpy as np,sys,time
from ff import *
from lage import *
from colon import colon
import e2inj_gen as G
import e2fam_gen as Fm
seed=int(sys.argv[1]);T=float(sys.argv[2]);rng=np.random.default_rng(seed);G.rng=rng;Fm.rng=rng
t0=time.time();stats={};n=0
def restrictS(V,S,r):
    # subspace of span V supported on S: solve V^T x vanish outside S
    out=[i for i in range(r) if i not in S]
    if not out: return basis(V)
    N=nullspace(V[:,out].T)
    return basis(N@V%P) if len(N) else np.zeros((0,r),dtype=np.int64)
while time.time()-t0<T:
    src='inj' if rng.random()<0.5 else 'fam'
    x=G.make() if src=='inj' else Fm.make()
    if x is None: continue
    meta,a1,a2,J=x
    inf=analyse(a1,a2,J,rng,full=False)
    key=tuple(inf.get(k) for k in ['dimJ','dimK1','dimK2','dimN','dimkerL'])
    if key!=(7,13,21,3,8): continue
    n+=1;r=34;S=set(range(34-meta['nZ']))
    Jb=basis(J);Kp=basis(np.vstack([Jb,a1*Jb%P,a2*Jb%P]));Kpp=basis(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))
    P2=mons(a1,a2,2)
    X2=colon(Kpp,list(P2),r)
    X2S=restrictS(X2,S,r);JS=restrictS(Jb,S,r)
    key=(src,meta['nZ']>0,len(X2),len(X2S),len(JS),rank(np.vstack([X2S,JS])) if len(X2S) else 0)
    stats[key]=stats.get(key,0)+1
print('seed',seed,'n',n)
for k,v in sorted(stats.items(),key=lambda x:-x[1]): print(v,k)
```

### e2sigma.py

SHA-256 `742da00ba0b7263953eac852d7d047b5c85e7080de230495b782bb47030be5c7`

```python
import numpy as np,sys,time
from ff import *
from lage import *
import e2inj_gen as G
import e2fam_gen as Fm
seed=int(sys.argv[1]);T=float(sys.argv[2]);rng=np.random.default_rng(seed);G.rng=rng;Fm.rng=rng
def inv(v): return np.array([pow(int(x),P-2,P) for x in v],dtype=np.int64)
t0=time.time();stats={};n=0
while time.time()-t0<T:
    src='inj' if rng.random()<0.5 else 'fam'
    x=G.make() if src=='inj' else Fm.make()
    if x is None: continue
    meta,a1,a2,J=x
    inf=analyse(a1,a2,J,rng,full=False)
    key=tuple(inf.get(k) for k in ['dimJ','dimK1','dimK2','dimN','dimkerL'])
    if key!=(7,13,21,3,8): continue
    n+=1;nS=34-meta['nZ'];S=np.arange(nS)
    w=J[0][S];U=J[6:8][:,S];psi=U*inv(w)[None,:]%P
    b1=a1[S];b2=a2[S];s=len(S)
    E3=basis(np.vstack([mons(b1,b2,3)]+[psi[j]*m%P for j in range(2) for m in mons(b1,b2,1)]))
    E4=basis(np.vstack([mons(b1,b2,4)]+[psi[j]*m%P for j in range(2) for m in mons(b1,b2,2)]))
    E2=basis(np.vstack([mons(b1,b2,2)]+[psi[j] for j in range(2)]))
    gs=mons(b1,b2,2);gs=basis(gs)   # P2 on Sigma, dim 5
    kd=len(E3);Ann=nullspace(E3);ng=len(gs)
    nun=2*s+ng*kd;eqs=[]
    for i,ai in enumerate([b1,b2]):
        for k in range(ng):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*s:(i+1)*s]=Ann*gs[k][None,:]%P
            Mi=(Ann*ai[None,:]%P)@E3.T%P
            blk[:,2*s+kd*k:2*s+kd*(k+1)]=(-Mi)%P
            eqs.append(blk)
    V=nullspace(np.vstack(eqs));C=V[:,:2*s]
    one=np.ones(s,dtype=np.int64);z=np.zeros(s,dtype=np.int64)
    triv=np.array([np.concatenate([l,z]) for l in [one,b1,b2]]+[np.concatenate([z,l]) for l in [one,b1,b2]]+[np.concatenate([b1*mu%P,b2*mu%P]) for mu in [one,b1,b2]])
    key=(src,len(E2),kd,len(E4),rank(C),rank(np.vstack([C,triv])))
    stats[key]=stats.get(key,0)+1
print('seed',seed,'n',n)
for k,v in sorted(stats.items(),key=lambda x:-x[1]): print(v,k)
```

### z0.py

SHA-256 `0266ffa704df756fbd1acb1fb836aea8d653a3178c288860cfae93eba2ff6d17`

```python
import numpy as np
from ff import *
from lage import *
rng=np.random.default_rng(5)
st={}
for _ in range(300):
    k=int(rng.integers(9,35));t=rng.choice(P,k,replace=False)
    idx=np.concatenate([np.arange(k),rng.integers(0,k,34-k)])
    a1=t[idx]%P;a2=t[idx]*t[idx]%P
    w=rng.integers(1,P,34);U=rng.integers(0,P,(2,34))
    J=np.vstack([mons(a1,a2,2)*w%P,U])
    inf=analyse(a1,a2,J,rng,full=False)
    key=tuple(inf.get(k) for k in ['dimJ','dimK1','dimK2','dimN','dimkerL'])
    st[key]=st.get(key,0)+1
print(st)
```

### gegenprobe.py

SHA-256 `1c4be35e54e0d1befbd510a09fc0782c600b5b79fdad8d5b1eec59b451b777ab`

```python
# Gegenprobe: (C')-Loeser an echten Verfahren (nicht blind?)
import json,sys,numpy as np
from fractions import Fraction
from ff import *
from lage import mons
def cv(x):
    f=Fraction(x);return f.numerator*pow(f.denominator,P-2,P)%P
def load(fn):
    d=json.load(open(fn))
    U=[np.array([[cv(x) for x in row] for row in p['u']]) for p in d['products']]
    V=[np.array([[cv(x) for x in row] for row in p['v']]) for p in d['products']]
    W=[np.array([[cv(x) for x in row] for row in p['w']]) for p in d['products']]
    return d['n'],d['m'],U,V,W
def brent(n,m,U,V,W):
    bad=0
    for i in range(n):
     for j in range(2):
      for j2 in range(2):
       for k in range(m):
        for i2 in range(n):
         for k2 in range(m):
          s=sum(int(U[t][i,j])*int(V[t][j2,k])*int(W[t][i2,k2]) for t in range(len(U)))%P
          if s!=(1 if (i==i2 and j==j2 and k==k2) else 0): bad+=1
    return bad
def invm(M):
    n=len(M);R,_=rref(np.hstack([np.array(M)%P,np.eye(n,dtype=np.int64)]));return R[:,n:]
rng=np.random.default_rng(int(sys.argv[2]) if len(sys.argv)>2 else 1)
n,m,U,V,W=load(sys.argv[1]);r=len(U)
while True:
    S=rng.integers(0,P,(n,n));T=rng.integers(0,P,(2,2))
    if rank(S)==n and rank(T)==2:
        U2=[(S.T@u%P)@T.T%P for u in U]
        if all(u[0,0]!=0 for u in U2): break
Ti=invm(T);Si=invm(S)
V2=[Ti.T@v%P for v in V];W2=[Si@w%P for w in W]
for t in range(r):
    s=int(U2[t][0,0]);si=pow(s,P-2,P);U2[t]=U2[t]*si%P;W2[t]=W2[t]*s%P
print('brent fehler nach basiswechsel',brent(n,m,U2,V2,W2))
a=[np.array([U2[t][i,0] for t in range(r)]) for i in range(n)]
q=np.array([[V2[t][1,k] for t in range(r)] for k in range(m)])
Kp=nullspace(np.array([W2[t].reshape(-1) for t in range(r)]).T)
Jb=basis(q);kd=len(Kp);Ann=nullspace(Kp);nun=2*r+m*kd;eqs=[]
for i in (1,2):
    for k in range(m):
        blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
        blk[:,(i-1)*r:i*r]=Ann*Jb[k][None,:]%P
        blk[:,2*r+kd*k:2*r+kd*(k+1)]=(-((Ann*a[i][None,:]%P)@Kp.T%P))%P
        eqs.append(blk)
Vc=nullspace(np.vstack(eqs))
Z=nullspace(np.hstack([Jb.T,(a[1]*Jb%P).T,(a[2]*Jb%P).T]))
x=rng.integers(0,P,len(Vc))@Vc%P;c1=x[:r];c2=x[r:2*r]
Th=np.array([(c1*(z[m:2*m]@Jb%P)+c2*(z[2*m:]@Jb%P))%P for z in Z])
print(sys.argv[1].split('/')[-1],'dim V_C',len(Vc),'dim J3_0',len(Z),'Rang Theta mod K\'',rank(np.vstack([Kp,Th]))-kd)
```
