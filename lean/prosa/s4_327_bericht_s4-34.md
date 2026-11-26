# Bericht S4-34: Prüfung der Behauptung B-028 (Fall e = 2 bei Länge 34 für ⟨3,2,7⟩)

Rolle: Prüfer. Auftrag S4-34 vom Orchestrator. Gegenstand: `behauptungen/B-028.md` mit den Aussagen S4-28-A, S4-28-B und S4-28-C und dem Beweis in `lean/prosa/s4_327_spurA_r5_e2.md`. Dieser Bericht setzt keinen Status. Die Urteile unten sind Prüfurteile im Sinn von Protokoll Abschnitt 5; den Status setzt der Orchestrator.

---

## 0. Offenlegung

### 0.1 Was mir aus dem Projektgedächtnis eingeblendet war

Beim Start war mir automatisch eingeblendet:

- Der Index `MEMORY.md` des Projektgedächtnisses. Inhalt: Projektregeln und Arbeitsweise (Repo, Ziel, Protokollfassung 0.6, Rechte und Grenzen des Orchestrators, Budget von Stufe 4 mit 6 Runden zu je bis zu 6 Subagenten, Regeln zu Fremdmodell, Prüferaufträgen, Literaturwache, Merge-Ablauf, Bezeichnung „blind“). Er enthält nach seinem eigenen Wortlaut nichts über Behauptungen, Beweise, Status oder Zähler, und ich habe dort auch nichts dazu gesehen.
- Fünf Einzeleinträge: `aussagen-abgleich-n3` (Hinweise zur Gemini-Bridge und zum lokalen Lean-Bau), `gemini-bridge` (Bridge-Freigaben, Zeitlimit), `hk-verfahren-a10` (Verfahrensdateien 3×2×5 und 3×2×6), `lean-upper-3x2x6` (Lean-Datei zur oberen Schranke 30 für 3×2×6), `pruefer-abgleich-s1-20` (Abgleichwerkzeug der Prüfprogramme).

Keiner dieser Einträge nennt B-028, S4-28, ein Prüfurteil oder ein erwünschtes Ergebnis.

### 0.2 Spuren und Abweichungen von der Positivliste

- **Commit-Meldungen gesehen.** Mein erster Befehl hat `git log --oneline -3` auf `main` ausgegeben. Darin stehen die Meldungen „Vor Runde 6: Gedächtnisdurchsicht“ und „Runde 5 abgeschlossen: S4-29 eingetragen, B-031 angelegt, Zähler Spur A 2 von 3, Budget 5 von 6“. Zur Prüfung der Prüfsumme habe ich außerdem `git log` für die Quelldatei aufgerufen und die Meldung „S4-28: Fall e = 2 auf den Fall e = 3 zurückgeführt (Satz R bei e = 2, Gestalt, starrer Kegelschnitt)“ gesehen. Ein Urteil zu B-028 stand in keiner dieser Meldungen.
- **Überschriften gesehen.** Um die Abschnitte zu finden, habe ich die Überschriftenlisten von `PROTOKOLL.md`, `s4_327_spurA_r5_e2.md`, `s4_327_spurA_r4_m21.md`, `s4_327_spurA_r3_e2.md`, `s4_327_spurA_r2_bau.md` und `yang_n3.md` ausgegeben (nur die Zeilen mit `##`). Gelesen habe ich darüber hinaus keinen Text außerhalb der Liste.
- **Über die Liste hinaus gelesen:** In `lean/prosa/yang_n3.md` habe ich zusätzlich Abschnitt 2 (Bezeichnungen, D, ℬ, W) gelesen, weil Abschnitt 5 diese Bezeichnungen benutzt. In `s4_327_spurA_r4_m21.md`, Abschnitt 1, habe ich neben der Vorbemerkung auch die Aussage S4-21-A und den ersten Satz von S4-21-B gesehen. Beide stehen wörtlich auch in `behauptungen/B-030.md`.
- **Spuren in den gelesenen Dateien:** `behauptungen/B-028.md` verweist auf `pruefvermerke/B-028.md` (nicht geöffnet) und sagt „Lemma F hat noch kein Prüfer gelesen“. Außerdem nennt B-028 die Folgerung S4-28-D („bedingt auf den Ausschluss von e = 3 in jeder Normalform“). Daraus lässt sich ablesen, wofür S4-28-C später gebraucht werden könnte. Ein Urteil zu B-028 habe ich nirgends gesehen.
- `lean/prosa/s4_327_spurA_r5_e2.md` habe ich nur in den Abschnitten 3 bis 7 gelesen (Zeilen 72 bis 185), nicht die Abschnitte 0, 2 und 8 bis 11 und nicht den Anhang.

### 0.3 Geprüfter Stand

`lean/prosa/s4_327_spurA_r5_e2.md` auf `main` (Commit 93c0df0) hat die SHA-256-Summe 913452a2d7d194e63eb22b1b7a1a0d8235e331e4b07aa01608720b5bcb747716. Das ist die Summe, die B-028 nennt (Stand 443a3ff). Die Datei wurde zuletzt in 443a3ff geändert.

---

## 1. Ergebnis in Kürze

Ich bestätige alle Aussagen von B-028: S4-28-A (i) bis (iv), S4-28-B (i) bis (v) und S4-28-C (erster Satz und „Gleichwertig“-Satz). Für den Zusatz im zweiten Satz von S4-28-C („dicht und offen“) gilt das nur unter der Voraussetzung S4-21-A (B-030). Lücken habe ich keine gefunden. Abschnitt 7 nennt vier Ungenauigkeiten im Wortlaut. Keine davon ändert ein Urteil.

Der Beweis braucht an einer Stelle mehr als den Wortlaut einer Voraussetzung, nämlich den **Beweis** von Lemma A aus `yang_n3.md`, nicht nur seine Aussage (Abschnitt 4.1). Diesen Beweis (Schritte 1 bis 5) habe ich selbst nachvollzogen; er liefert, was S4-28 braucht.

| Aussage | Urteil |
|---|---|
| S4-28-A (i) | bestätigt (Hinweis 7.1 zur Charakteristik 2) |
| S4-28-A (ii) | bestätigt |
| S4-28-A (iii) | bestätigt |
| S4-28-A (iv) | bestätigt |
| S4-28-A, Satz „Benutzt werden nur …“ | bestätigt, mit Hinweis 7.3 |
| S4-28-B (i) bis (v) | bestätigt |
| S4-28-B, Klammer zu Lemma F in (ALLG) | bestätigt (Lemma F nach B-030 vorausgesetzt und zusätzlich selbst nachgeprüft, Hinweis 7.2) |
| S4-28-C, erster Satz | bestätigt |
| S4-28-C, „Gleichwertig: … hat eine Normalform mit e = 3“ | bestätigt |
| S4-28-C, Zusatz „dicht und offen“ | bestätigt unter der Voraussetzung S4-21-A (B-030), nicht selbst geprüft |

---

## 2. Benutzte Voraussetzungen (ungeprüft übernommen, wie im Auftrag erlaubt)

Wörtlich so übernommen, wie sie in den genannten Dateien stehen:

1. **Restfall R-327** (B-017, mit B-018 und B-019): Jede Normalform eines Verfahrens der Länge 34 hat rk L = 6, dim N = 3, dim S = 1. Gebraucht nur mittelbar über S4-07 und E2-B.
2. **S4-07, Abschnitte 1 bis 3** (`s4_327_spurA_r2_bau.md`): Normalform und Skalierung (1.1), (A) bis (D) und (C′) (Abschnitt 2), K′ = J + a_1J + a_2J (1.2, aus dem Restfall), w·P_2 ⊆ J (3.1), K^34 = K″ + b_0K′ (3.2), dim J³_0 = 8 und (D′) (3.3).
3. **E2-A** und **E2-B, Teile 1 und 2** (B-027): e ∈ {2, 3}; bei e = 2 ein bis auf einen Faktor eindeutiges g_0 ∈ P_2 mit w·g_0 = 0, irreduzibel, alle a-Punkte von Σ auf C_0; J = w·P_2 ⊕ ⟨u_1, u_2⟩, K′ = w·P_3 ⊕ u·P_1 (7 + 6), K″ = w·P_4 ⊕ u·P_2 (9 + 12), K^34 = K″ ⊕ b_0K′, Injektivität von (G_1, G_2) ↦ u_1G_1 + u_2G_2 auf P_2².
4. **Aus `yang_n3.md`:** R1, R2, R3, G4, (SN1), (SN2), Lemma A **samt Beweis** (Schritte 1 bis 5).
5. **Aus B-030:** Lemma F (Aussage), die Formeln a′(t) = Sᵀα_tpᵀ, b′(t) = Sᵀα_tp′ᵀ aus Abschnitt 3 von S4-21, und für den Zusatz in S4-28-C die Aussage S4-21-A. Satz G (S4-21-B) wird nicht gebraucht.
6. Die untere Schranke R(⟨3,2,7⟩) ≥ 34 (damit kein α_t die Nullform ist). Sie steht in den gelesenen Dateien als Voraussetzung von S4-07 und E2-B.

Lemma F und die Formeln aus Abschnitt 3 von S4-21 habe ich zusätzlich selbst nachgeprüft (Abschnitt 4.1). Alles andere in dieser Liste habe ich nicht geprüft.

**Braucht der Beweis mehr, als dort wörtlich steht?**

- **Ja, an einer Stelle: Lemma A.** Abschnitt 5.2 der Quelle braucht ein Polynom P(u, p) ≠ 0, das in p homogen ist und für **jedes** S mit erster Spalte u und **jedes** T mit erster Zeile p (SN1) und (SN2) liefert. Die Aussage von Lemma A gibt nur einen passenden Basiswechsel. Der Beweis (Schritte 1 bis 5) gibt das Stärkere: P = Π_r α_r(up) · Π_Σ q_Σ(p), und Schritt 5 funktioniert mit jeder Ergänzung von u zu einer Basis und jedem T mit erster Zeile p. Homogenität in p: α_r(up) ist linear in p, q_Σ(p) ist ein 3×3-Minor mit in p linearen Einträgen, also homogen vom Grad 3. Das habe ich nachgeprüft (Abschnitt 4.1).
- **Formale und ausgewertete Polynome.** In S4-07 und S4-15 ist P_d ein Raum von Vektoren in K^34 (ausgewertete Polynome), in S4-28 ein Raum formaler Polynome. Die benutzten Aussagen von E2-B gelten auch formal: Aus dim u·P_2 = 12 = dim P_2² folgt, dass (G_1, G_2) ↦ u_1G_1 + u_2G_2 auf formalen Paaren injektiv ist, und dim w·P_3 = 7 bei dim P_3 = 10 gibt einen Kern der Dimension 3. Das ist kein Mehrbedarf, nur eine Übersetzung (Hinweis 7.4).
- Sonst nicht. Insbesondere werden (B), (INJ-B), E2-B Teile 3 bis 5 und Satz G in den Beweisen der drei Aussagen nicht gebraucht. E2-B Teil 3 kommt nur in der Bemerkung „Was der Beweis wirklich braucht“ (Abschnitt 7 der Quelle) vor, die nicht Teil der Aussagen ist.

---

## 3. Prüfung von S4-28-A (Satz R bei e = 2)

Rahmen: eine Normalform eines Verfahrens der Länge 34 mit e = 2. Den Körper muss man hier nicht weiter einschränken: Er ist der algebraische Abschluss K eines beliebigen Grundkörpers, jede Charakteristik ist zugelassen.

**Schritt 0 (Kern von f ↦ w·f auf P_3 ist g_0·P_1).** P_3 hat Dimension 10, w·P_3 hat Dimension 7 (E2-B Teil 2), also hat der Kern Dimension 3. g_0·P_1 liegt im Kern (w·g_0 = 0), hat Grad ≤ 3 und Dimension 3, weil die Multiplikation mit g_0 ≠ 0 in K[a_1, a_2] injektiv ist. Also ist der Kern genau g_0·P_1. **Bestätigt.**

**Schritt 1, Aussage (i).** Mit j_i = w·φ_i + Σ_l s_{il}u_l (Zerlegung J = w·P_2 ⊕ ⟨u_1, u_2⟩) ist Σ_i a_ij_i = w·(Σ a_iφ_i) + Σ_l u_l·(s_{0l} + s_{1l}a_1 + s_{2l}a_2). Der erste Summand liegt in w·P_3, der zweite in u·P_1, die Summe ist direkt (E2-B Teil 2). Also sind beide Summanden null. Weil (G_1, G_2) ↦ u_1G_1 + u_2G_2 auf P_1² injektiv ist, sind alle s_{il} = 0. Nach Schritt 0 ist Σ a_iφ_i = g_0·(λ_0 + λ_1a_1 + λ_2a_2), und φ′_i := φ_i − λ_ig_0 erfüllt w·φ′_i = j_i und Σ a_iφ′_i = 0 als Polynom.

Die Homogenisierung gibt X_0Φ′_0 + X_1Φ′_1 + X_2Φ′_2 = X_0³·(Σ a_iφ′_i)(X_1/X_0, X_2/X_0) = 0 in S_3. Die Koszul-Folge von X_0, X_1, X_2 ist exakt, also stammt jede Syzygie aus Λ²: Φ′_i = Σ_k Ψ_{ik}X_k mit alternierendem Ψ (Ψ_{ii} = 0, Ψ_{ik} = −Ψ_{ki}) und Ψ_{ik} ∈ S_1 (die Folge ist graduiert). Dehomogenisieren gibt φ′_i = Σ_k ψ_{ik}a_k mit a_0 = 1, also j_i = w·Σ_k ψ_{ik}a_k.

Die Formel für Θ: Σ_i b_ij_i = w·Σ_{i,k} ψ_{ik}b_ia_k = w·Σ_{i<k} ψ_{ik}(b_ia_k − b_ka_i) = −Σ_{i<k} ψ_{ik}·ω_{ik}·w mit ω_{ik} = a_ib_k − a_kb_i. Θ(j) = Σ_i b_ij_i auf J³_0 gilt nach S4-07, 3.3. Nachgerechnet.

Eigene Rechnung (Anhang, Prüfung 1): Für (φ_0, φ_1, φ_2) ∈ P_2³ hat die Abbildung zu Σ a_iφ_i ∈ P_3 den Rang 10 und einen Kern der Dimension 8. Das Bild der alternierenden (ψ_{01}, ψ_{02}, ψ_{12}) ∈ P_1³ hat Dimension 8 und liegt im Kern. Die Gleichheit gilt modulo 2, 3 und 32003, also auch in Charakteristik 2. **Bestätigt** (Hinweis 7.1).

**Schritt 2 (ω_{ik}·J ⊆ K″).** Aus (C) und der Linearität von π: a_iπ(j) − b_ij ∈ K′ für j ∈ J, i = 0, 1, 2. Dann a_k(a_iπ(j) − b_ij) − a_i(a_kπ(j) − b_kj) = a_ib_kj − a_kb_ij = ω_{ik}·j ∈ a_kK′ + a_iK′ ⊆ K″ (a_0K′ = K′). Nachgerechnet. **Bestätigt.**

**Schritt 3 (K″ = K′ ⊕ Θ(J³_0)).** ψ_{ik}·w ∈ w·P_1 ⊆ J, also liegt Θ(j) nach den Schritten 1 und 2 in K″. Nach (D) ist Θ auf J³_0 injektiv modulo K′, dim J³_0 = 8 (S4-07, 3.3), dim K″ = 21 = 13 + 8. **Bestätigt** (steht so auch schon in E2-B Teil 2).

**Schritt 4, Aussage (ii).** a_l·Θ(j) = −Σ_{i<k} ω_{ik}·(w·a_lψ_{ik}) mit w·a_lψ_{ik} ∈ w·P_2 ⊆ J, also nach Schritt 2 in K″. Mit a_lK′ ⊆ K″ und Schritt 3 folgt a_lK″ ⊆ K″. **Bestätigt.**

**Aussage (iii).** w, u_1, u_2 ∈ J ⊆ K′ ⊆ K″ (J ⊆ K′ = J + a_1J + a_2J). Ist K″ unter A abgeschlossen, enthält K″ den Modul A·w + A·u_1 + A·u_2. Umgekehrt ist K″ = w·P_4 + u·P_2 in diesem Modul enthalten. Daraus folgt w·P_5 + u·P_3 ⊆ K″ = w·P_4 ⊕ u·P_2 ⊆ w·P_5 + u·P_3. Die Abbildung P_5 × P_3 × P_3 → K″ ist also surjektiv auf einen Raum der Dimension 21. Ihr Kern hat Dimension 21 + 10 + 10 − 21 = 20. Er enthält {(g_0h, 0, 0) : h ∈ P_3} der Dimension 10 (g_0h ∈ P_5, Multiplikation mit g_0 injektiv). **Bestätigt.**

**Aussage (iv).** (INJ-B) in der Fassung aus B-027 verlangt, dass der Kern in diesem 10-dimensionalen Raum liegt. Das widerspricht der Dimension 20. **Bestätigt.**

**Satz „Benutzt werden nur (A), (C), (D), der Restfall und die Gestalt E2-B (Teile 1 und 2) …; nicht benutzt werden (B), (INJ-B) und die Lösungsstruktur von (C′).“** Der Beweis benutzt (A) (für J ⊆ K′ und dim J³_0 = 8), (C) (Schritt 2), (D) (Schritt 3), den Restfall (K′ = J + a_1J + a_2J, w·P_2 ⊆ J), E2-B Teile 1 und 2, und (INJ-B) nur als Gegenstand von (iv). (B) und die Lösungsstruktur von (C′) kommen nicht vor. **Bestätigt**, mit Hinweis 7.3.

---

## 4. Prüfung von S4-28-B (Gestalt in allgemeiner Normalform)

### 4.1 Vorarbeit: Abschnitt 5 der Quelle

**5.1 (Lemma F, Wiederholung).** Nach B-030 vorausgesetzt. Zusätzlich selbst nachgeprüft: Den Beweis habe ich Schritt für Schritt nachvollzogen (Rang 2: λ(p) ist auf zwei unabhängigen p gleich, also α_{t′} = λα_t; gemischter Rang: dann Fall I und gleicher Rang, Widerspruch; beide Rang 1: p mit y·p ≠ 0 ≠ y′·p gibt K·x = K·x′). Die Aussage gilt sogar als Polynomidentität: „alle drei 2×2-Minoren von (α_tpᵀ | α_{t′}pᵀ) sind als Polynome in p null“ genau dann, wenn (I) oder (II) gilt. Das habe ich für alle Paare von 3×2-Matrizen ≠ 0 über GF(2) (3 969 Paare) und GF(3) (529 984 Paare) erschöpfend nachgerechnet, ohne Abweichung (Anhang, Prüfung 2). Zum Wortlaut „V_{tt′} ist die Nullstellenmenge eines Minors“ siehe Hinweis 7.2.

**5.2 (Welche (S, T) Normalformen liefern).** Nachgeprüft am Beweis von Lemma A (`yang_n3.md`, Abschnitt 5, Schritte 1 bis 5):

- Aus P(u, p) ≠ 0 folgt α_r(up) ≠ 0 für alle r, also (SN1) für **jedes** S mit erster Spalte u und **jedes** T mit erster Zeile p, denn D′(e_{00}) = D(up).
- (SN2): Für v ≠ 0 ist w := T^{−1}v ≠ 0 und supp(w) ∈ 𝒮, also q_{supp(w)}(p) ≠ 0 und a ↦ D(ap)ℬ(w) injektiv. Aus Σ γ_if′_i(v) = 0 folgt D((Σ γ_iu_i)p)ℬ(w) = 0, also Σ γ_iu_i = 0 und γ = 0, weil die Spalten von S eine Basis sind. Die Wahl der übrigen Spalten von S und der zweiten Zeile von T spielt keine Rolle.
- P ist in p homogen (Grad 34 + 3·|𝒮|). Existenz von u_*: P ist als Polynom in p mit Koeffizienten in K[u] nicht null, K ist unendlich. Aus P(u_*, ·) ≠ 0 folgt u_* ≠ 0, also lässt sich u_* zu einem invertierbaren S ergänzen.
- Q(p) = P(u_*, p)·Π m_{tt′}(p) ist ein homogenes Polynom ≠ 0 in zwei Variablen, das Produkt von Polynomen ≠ 0. Über K algebraisch abgeschlossen verschwindet es auf endlich vielen Geraden durch 0. Q(p) ≠ 0 erzwingt p ≠ 0 (Q ist homogen vom Grad > 0). 𝒫 ist also unendlich, und für [p] ∈ 𝒫 gilt p ∉ V_{tt′} für alle Paare ohne (I) oder (II).

**Bestätigt.**

**5.3 (Was sich mit p bewegt).** Die Formel a′(t) = Sᵀα_tpᵀ habe ich selbst hergeleitet: α_t(u_ip) = u_iᵀα_tpᵀ. Für Rang 1, α_t = xyᵀ, ist a′(t) = (y·p)Sᵀx und b′(t) = (y·p′)Sᵀx. Daraus folgt b(t) = r_t·a(t), also c_1(t) = c_2(t) = 0, und der a-Punkt [Sᵀx] hängt nicht von T ab. Für Rang 2 ist [p] ↦ [Sᵀα_tpᵀ] injektiv auf P¹, das Bild liegt auf einer Geraden ℓ_t. Im Fall I, α_{t′} = λα_t mit λ ≠ 0, stimmen a und b an t und t′ nach der Skalierung überein. Gleicher a-Punkt bedeutet p ∈ V_{tt′}, denn beide Vektoren sind wegen (SN1) ≠ 0. Unter (ALLG) bleiben nur die Paare (I) und (II). Ein gemischtes Paar (Rang 1 und Rang 2) erfüllt weder (I) (gleicher Rang nötig) noch (II), also ist jede Faser rein. Eigene Stichprobe modulo 32003 (Anhang, Prüfung 3 und 4): 200 zufällige Rang-1-Formen mit zufälligen (S, T): stets c_1 = c_2 = 0, der a-Punkt ist bei zwei verschiedenen T gleich, und Fall I gibt gleiche a, b. Injektivität für Rang 2 in 50 Stichproben bestätigt. **Bestätigt.**

### 4.2 Abschnitt 6 der Quelle

- **Schritt 1.** K″ ist ein A-Modul (S4-28-A (ii)). Die Interpolationspolynome e_p gibt es für endlich viele verschiedene Punkte über jedem Körper. Also ist K″ = ⊕_p e_pK″ mit Σ d_p = 21. **Bestätigt.**
- **Schritt 2.** e_p·(K″ ⊕ b_0K′) = M_p + b_0·e_pK′ ⊆ M_p + b_0M_p, also |T_p| ≤ 2d_p. Auf einer Faser der Klasse I ist b_0 konstant (5.3, Fall I), also ist b_0M_p ⊆ M_p, und mit M_p ⊆ K^{T_p} folgt |T_p| = d_p. **Bestätigt.**
- **Schritt 3.** Σ_p(|T_p| − d_p) = 34 − 21 = 13. Eine Faser der Klasse I trägt 0 bei, eine der Klasse II höchstens |T_p|/2. Also ist |Y| ≥ 26. **Bestätigt.**
- **Schritt 4.** Θ(J³_0) ⊆ K″ ∩ K^Ω, weil c_1 = c_2 = 0 auf Y. Wegen der direkten Zerlegung nach Fasern ist K″ ∩ K^Ω = ⊕_{T_p ⊆ Ω} M_p = ⊕_{T_p ⊆ Ω} K^{T_p} = K^Ω (Schritt 2). Mit dim Θ(J³_0) = 8 folgt |Ω| ≥ 8, also |Ω| = 8 und |Y| = 26. In Schritt 3 gilt dann überall Gleichheit, also |T_p| = 2d_p für jede Faser in Y und Σ_{T_p ⊆ Y} d_p = 13. Weiter ist Θ(J³_0) = K^Ω, und aus S4-28-A folgt K″ = K′ ⊕ K^Ω. **Bestätigt**, damit (i), (iii) und (v).
- **Schritt 5.** c_1 und c_2 sind auf jeder Faser konstant, also gibt es C_i ∈ A mit c_i = C_i als Vektoren. Nach S4-28-A (i) ist j_i ∈ w·P_2 für (j_0, j_1, j_2) ∈ J³_0, also Θ(j) ∈ A·w und K^Ω ⊆ A·w. Für T_p ⊆ Ω gilt e_p·f·w = f(p)·e_p·w, also K^{T_p} ⊆ K·(e_pw). Daraus folgen |T_p| = 1 und w ≠ 0 auf T_p. Mit E2-B Teil 1 liegen diese Punkte auf C_0. **Bestätigt**, damit (ii).
- **Schritt 6.** w·P_3 ⊆ K′, also ist ker ρ_Y ⊆ K′ ∩ K^Ω = 0, und das Bild von ρ_Y hat Dimension 7. ρ_Y faktorisiert über f ↦ (f(q))_{q ∈ Π_1} ∈ K^{Π_1}, weil (w·f)_t = w_t·f(a-Punkt von t) und w_t = 0 für t ∈ Y ∖ Σ. Also ist |Π_1| ≥ 7. **Bestätigt**, damit (iv).

**Urteil S4-28-B:** (i) bis (v) **bestätigt**, für jede Normalform mit e = 2, deren (S, T) die Bedingung (ALLG) erfüllt, über dem algebraischen Abschluss eines beliebigen Körpers. Die Klammer in (ALLG) („V_{tt′} ist dann eine echte abgeschlossene Teilmenge“) ist Lemma F; der Beweis von S4-28-B selbst braucht sie nicht, nur die Bedingung p ∉ V_{tt′}.

---

## 5. Prüfung von S4-28-C (Hauptsatz)

**Annahme.** Ein Verfahren der Länge 34 über F, bei dem jede Normalform (über K = F̄, für alle zulässigen (S, T)) e ≤ 2 hat. Nach R1 ist es ein Verfahren über K, nach E2-A hat jede Normalform e = 2.

**Wahl.** Die (S, T_p) mit [p] ∈ 𝒫 aus 5.2 sind Normalformen (Abschnitt 4.1), haben also e = 2 und erfüllen (ALLG). S ist für alle p **dieselbe** Matrix; das braucht Schritt 1. Der Träger Σ_p von w ist wohldefiniert, weil w nur bis auf einen Faktor bestimmt ist (dim S = 1). Weil es nur endlich viele Teilmengen von {1, …, 34} gibt, liefert das Schubfachprinzip eine unendliche Teilmenge 𝒫* mit festem Träger Σ*. **Bestätigt.**

**Schritt 1.** Y und Ω hängen nur von den Rängen der ursprünglichen α_t ab. Die a-Punkte der Rang-1-Indizes sind [Sᵀx_t] und hängen bei festem S nicht von p ab. Also ist Π_1 = {[Sᵀx_t] : t ∈ Y ∩ Σ*} für alle [p] ∈ 𝒫* dieselbe Menge, mit |Π_1| ≥ 7 nach S4-28-B (iv). Jedes C_0(p) ist irreduzibel und enthält Π_1 (E2-B Teil 1, Π_1 ⊆ a-Punkte von Σ*). Zwei nicht proportionale irreduzible Kegelschnittgleichungen haben höchstens 4 gemeinsame Nullstellen. Das Argument der Quelle dafür ist richtig: Die Einschränkung auf die Parametrisierung P¹ ≅ C̄ ist eine binäre Quartik. Ist sie null, teilt g die Gleichung g′ (g irreduzibel, Nullstellensatz), und g′ ist wegen gleichen Grades proportional zu g. Das gilt in jeder Charakteristik. Da 7 > 4, sind alle g_0(p) proportional, und C* ist fest. **Bestätigt.**

**Schritt 2.** Ω ≠ ∅ (|Ω| = 8). Für z ∈ Ω ist z ∈ Σ* nach S4-28-B (ii). Der a-Punkt von z in der Normalform zu (S, T_p) ist [Sᵀα_zpᵀ] und liegt auf C̄*. Die Gerade ℓ_z hängt nur von S und α_z ab, und [p] ↦ [Sᵀα_zpᵀ] ist injektiv (5.3). Also enthält ℓ_z ∩ C̄* unendlich viele Punkte. **Bestätigt.**

**Schritt 3.** Die Einschränkung von G* auf ℓ_z ist eine binäre quadratische Form mit unendlich vielen Nullstellen, also null. Dann teilt die Gleichung von ℓ_z die Form G*, und G* ist reduzibel, im Widerspruch zu E2-B Teil 1. **Bestätigt.**

**Urteil S4-28-C:**

- **Erster Satz** („Es gibt über keinem Körper ein Verfahren der Länge 34 für ⟨3,2,7⟩, bei dem jede Normalform e ≤ 2 hat.“): **bestätigt**, unter den Voraussetzungen aus Abschnitt 2.
- **„Gleichwertig: Jedes Verfahren … hat eine Normalform (über dem algebraischen Abschluss von F) mit e = 3“:** **bestätigt**. Die Verneinung von „jede Normalform hat e ≤ 2“ ist „es gibt eine Normalform mit e ≥ 3“, nach E2-A also e = 3. Es gibt überhaupt Normalformen (Lemma A), die Aussage ist also nicht leer erfüllt.
- **Zusatz „nach S4-21-A ist dann die Menge der (S, T) mit e = 3 sogar dicht und offen“:** folgt unmittelbar aus S4-21-A (B-030). **Bestätigt unter der Voraussetzung S4-21-A**, die ich nicht geprüft habe. Für den ersten Satz ist der Zusatz nicht nötig.

---

## 6. Quantoren

- **Körper.** Alle drei Aussagen gelten für Verfahren über einem beliebigen Körper F, mit Normalformen über K = F̄. Ich habe nirgends eine Einschränkung der Charakteristik gefunden. Die benutzten Hilfsmittel (Koszul-Exaktheit, Interpolation an endlich vielen Punkten, glatter Kegelschnitt ≅ P¹, Endlichkeit der Nullstellen einer binären Form ≠ 0) gelten in jeder Charakteristik; Hinweis 7.1 betrifft nur den Wortlaut.
- **Verfahren.** Länge genau 34. Dass kein α_t null ist, folgt aus der Minimalität (R(⟨3,2,7⟩) ≥ 34, vorausgesetzt).
- **Normalformen.** S4-28-A: **jede** Normalform mit e = 2. S4-28-B: jede Normalform mit e = 2, deren (S, T) (ALLG) erfüllt. S4-28-C schließt nur Verfahren aus, bei denen **jede** Normalform e ≤ 2 hat. Er sagt nichts gegen ein Verfahren, das eine Normalform mit e = 2 und eine andere mit e = 3 hat. So steht es auch im Quantorenhinweis von B-028, und so beweist es die Quelle. Der Beweis braucht die Annahme sogar nur für die unendlich vielen Normalformen (S, T_p) mit festem S, [p] ∈ 𝒫, die (ALLG) erfüllen.

---

## 7. Hinweise (keine Lücken, ändern kein Urteil)

**7.1 Charakteristik 2 in S4-28-A (i).** Die Aussage sagt „ψ_{ik} = −ψ_{ki}“. In Charakteristik 2 erzwingt das nicht ψ_{ii} = 0. Die Formel Θ(j) = −Σ_{i<k} ψ_{ik}ω_{ik}w braucht aber ψ_{ii} = 0. Der Beweis liefert über den Koszul-Komplex ein alternierendes Ψ, also ψ_{ii} = 0. Als Existenzaussage ist (i) deshalb richtig. Genauer wäre „alternierend (ψ_{ii} = 0, ψ_{ik} = −ψ_{ki})“.

**7.2 Wortlaut von Lemma F in S4-28, 5.1.** Dort steht, V_{tt′} sei „sonst die Nullstellenmenge eines von null verschiedenen 2×2-Minors“. Genau ist: V_{tt′} ist die gemeinsame Nullstellenmenge aller drei Minoren und liegt deshalb in der Nullstellenmenge eines von null verschiedenen Minors, also in höchstens zwei Geraden durch 0. Der Beweis braucht nur diese Inklusion (Q(p) ≠ 0 ⇒ p ∉ V_{tt′}).

**7.3 Liste „Benutzt werden nur“ in S4-28-A.** Zu den genannten Grundlagen kommen w·P_2 ⊆ J (S4-07, 3.1), dim J³_0 = 8 und (D′) (S4-07, 3.3) sowie K′ = J + a_1J + a_2J hinzu. Sie folgen aus dem Restfall, (A) und (D) und stehen in Abschnitt 2 der Quelle unter „S4-07 Abschnitte 1 bis 3“ (Abschnitt 2 habe ich nach Auftrag nicht gelesen; die Angabe steht so in B-028). Keine Lücke, nur eine unvollständige Aufzählung in der Aussage selbst.

**7.4 Bedeutung von P_d.** S4-28 liest P_d als formale Polynome, S4-07 und S4-15 als ausgewertete Vektoren. Abschnitt 2 dieses Berichts zeigt, dass die übernommenen Aussagen von E2-B auch formal gelten. Für die Lesbarkeit wäre ein ausdrücklicher Satz dazu in der Quelle hilfreich.

---

## 8. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0.
- Rechnung: ein Rechenblock von etwa 5 Sekunden auf einem Kern (Anhang). Keine Gleitkommazahlen.
- Zeiten: aus den Git-Zeitstempeln dieses Berichts ablesbar.

---

## Anhang: Prüfprogramm (Python 3, nur Standardbibliothek, exakt modulo Primzahlen)

Aufruf: `python3 -I pruef_b028.py`. Ausgabe meines Laufs:

```
Koszul p=2: rank L=10, dim ker=8, dim image(psi)=8, image in ker: True
Koszul p=3: rank L=10, dim ker=8, dim image(psi)=8, image in ker: True
Koszul p=32003: rank L=10, dim ker=8, dim image(psi)=8, image in ker: True
Lemma F over GF(2): 3969 ordered pairs of nonzero 3x2 matrices, mismatches: 0
Lemma F over GF(3): 529984 ordered pairs of nonzero 3x2 matrices, mismatches: 0
5.3 rank 1: c_1=c_2=0: True; a-point independent of T: True; case I equal a,b: True
5.3 rank 2: injectivity on P^1 (sample): True
```

Prüfung 1 ist Schritt 1 von S4-28-A (Koszul in Grad 2). Prüfung 2 ist Lemma F als Polynomidentität, erschöpfend über GF(2) und GF(3). Prüfung 3 und 4 sind die Formeln aus 5.3 an Stichproben modulo 32003. Die Rechnung ersetzt keinen Beweisschritt. Sie prüft die Stellen, an denen ein Rechen- oder Vorzeichenfehler am ehesten stecken könnte.

```python
# Independent checks for claim B-028 (exact arithmetic modulo primes, no floats).
import itertools, random

def rank_mod(rows, p):
    M = [[x % p for x in r] for r in rows]
    rk, col = 0, 0
    ncols = len(M[0]) if M else 0
    for col in range(ncols):
        piv = next((i for i in range(rk, len(M)) if M[i][col]), None)
        if piv is None:
            continue
        M[rk], M[piv] = M[piv], M[rk]
        inv = pow(M[rk][col], p - 2, p)
        M[rk] = [x * inv % p for x in M[rk]]
        for i in range(len(M)):
            if i != rk and M[i][col]:
                f = M[i][col]
                M[i] = [(a - f * b) % p for a, b in zip(M[i], M[rk])]
        rk += 1
    return rk

# ---- Check 1: Koszul step (S4-28, section 4, step 1) ----
# monomials a1^i a2^j with i+j<=d
def mons(d):
    return [(i, j) for i in range(d + 1) for j in range(d + 1 - i)]
M1, M2, M3 = mons(1), mons(2), mons(3)
idx3 = {m: k for k, m in enumerate(M3)}
A = [(0, 0), (1, 0), (0, 1)]  # a_0 = 1, a_1, a_2

def mul_into(coeffs_by_mon, shift):
    return {(m[0] + shift[0], m[1] + shift[1]): c for m, c in coeffs_by_mon.items()}

def check_koszul(p):
    # map L: P_2^3 -> P_3, (phi_i) -> sum a_i phi_i ; matrix columns = basis of P_2^3
    cols = []
    for i in range(3):
        for m in M2:
            v = [0] * len(M3)
            v[idx3[(m[0] + A[i][0], m[1] + A[i][1])]] = 1
            cols.append(v)
    # rank of L
    rkL = rank_mod([list(r) for r in zip(*cols)], p)
    kerdim = 3 * len(M2) - rkL
    # image of alternating psi (psi01, psi02, psi12 in P_1): phi_i = sum_k psi_ik a_k
    pairs = [(0, 1), (0, 2), (1, 2)]
    vecs = []
    for (i, k) in pairs:
        for m in M1:
            phi = [dict(), dict(), dict()]
            # psi_ik = m, psi_ki = -m
            phi[i][(m[0] + A[k][0], m[1] + A[k][1])] = 1
            phi[k][(m[0] + A[i][0], m[1] + A[i][1])] = -1
            v = []
            for t in range(3):
                v += [phi[t].get(mm, 0) for mm in M2]
            vecs.append(v)
    rkImg = rank_mod(vecs, p)
    # each image vector lies in ker L
    inker = True
    for v in vecs:
        out = [0] * len(M3)
        for t in range(3):
            for kk, mm in enumerate(M2):
                c = v[t * len(M2) + kk]
                if c:
                    out[idx3[(mm[0] + A[t][0], mm[1] + A[t][1])]] += c
        if any(x % p for x in out):
            inker = False
    return rkL, kerdim, rkImg, inker

for p in (2, 3, 32003):
    print("Koszul p=%d: rank L=%d, dim ker=%d, dim image(psi)=%d, image in ker: %s" % ((p,) + check_koszul(p)))

# ---- Check 2: Lemma F polynomial identity, exhaustive over GF(q) ----
def minors_coeffs(a, b, q):
    # a,b: 3x2 matrices; vectors a p^T, b p^T with p=(p0,p1) as linear forms
    # minor rows (r,s): (a_r.p)(b_s.p) - (a_s.p)(b_r.p), coefficients of p0^2,p0p1,p1^2
    out = []
    for r, s in ((0, 1), (0, 2), (1, 2)):
        def prod(x, y):
            return (x[0] * y[0], x[0] * y[1] + x[1] * y[0], x[1] * y[1])
        P1 = prod(a[r], b[s]); P2 = prod(a[s], b[r])
        out += [(u - v) % q for u, v in zip(P1, P2)]
    return out

def rank3x2(m, q):
    return rank_mod([list(r) for r in m], q)

def proportional(a, b, q):
    fa = [x for r in a for x in r]; fb = [x for r in b for x in r]
    return rank_mod([fa, fb], q) <= 1

def same_column(a, b, q):
    # both rank 1, column spaces equal
    ca = [list(c) for c in zip(*a)]; cb = [list(c) for c in zip(*b)]
    return rank_mod(ca + cb, q) == 1

def lemmaF(q):
    mats = []
    for vals in itertools.product(range(q), repeat=6):
        m = (vals[0:2], vals[2:4], vals[4:6])
        if any(vals):
            mats.append(m)
    bad = 0; n = 0
    rk = {m: rank3x2(m, q) for m in mats}
    for a in mats:
        for b in mats:
            n += 1
            allzero = not any(minors_coeffs(a, b, q))
            cond = proportional(a, b, q) or (rk[a] == 1 and rk[b] == 1 and same_column(a, b, q))
            if allzero != cond:
                bad += 1
    return n, bad

for q in (2, 3):
    n, bad = lemmaF(q)
    print("Lemma F over GF(%d): %d ordered pairs of nonzero 3x2 matrices, mismatches: %d" % (q, n, bad))

# ---- Check 3: formulas of section 5.3 (rank 1: a-point independent of p, c_i = 0; case I) ----
P = 32003
rnd = random.Random(20261126)
def rmat(r, c):
    return [[rnd.randrange(P) for _ in range(c)] for _ in range(r)]
def matvec(M, v):
    return [sum(M[i][j] * v[j] for j in range(len(v))) % P for i in range(len(M))]
def transpose(M):
    return [list(r) for r in zip(*M)]
def normal_ab(alpha, S, T):
    p_, pp = T[0], T[1]
    St = transpose(S)
    a1 = matvec(St, matvec(alpha, p_)); b1 = matvec(St, matvec(alpha, pp))
    inv = pow(a1[0], P - 2, P)
    return [x * inv % P for x in a1], [x * inv % P for x in b1]
ok_r1 = ok_pt = ok_I = True
for trial in range(200):
    S = rmat(3, 3); T = rmat(2, 2); T2 = [rmat(1, 2)[0], rmat(1, 2)[0]]
    x = [rnd.randrange(P) for _ in range(3)]; y = [rnd.randrange(P) for _ in range(2)]
    alpha = [[x[i] * y[j] % P for j in range(2)] for i in range(3)]
    a, b = normal_ab(alpha, S, T)
    c1 = (b[1] - a[1] * b[0]) % P; c2 = (b[2] - a[2] * b[0]) % P
    ok_r1 &= (c1 == 0 and c2 == 0)
    a2, _ = normal_ab(alpha, S, T2)
    ok_pt &= (a == a2)
    alpha2 = rmat(3, 2); lam = rnd.randrange(1, P)
    a3, b3 = normal_ab(alpha2, S, T)
    a4, b4 = normal_ab([[lam * e % P for e in r] for r in alpha2], S, T)
    ok_I &= (a3 == a4 and b3 == b4)
print("5.3 rank 1: c_1=c_2=0: %s; a-point independent of T: %s; case I equal a,b: %s" % (ok_r1, ok_pt, ok_I))

# ---- Check 4: rank-2 a-point map [p] -> [S^T alpha p^T] is injective on P^1 (sample) ----
ok_inj = True
for trial in range(50):
    S = rmat(3, 3); alpha = rmat(3, 2)
    St = transpose(S)
    p1 = [rnd.randrange(P) for _ in range(2)]; p2 = [rnd.randrange(P) for _ in range(2)]
    v1 = matvec(St, matvec(alpha, p1)); v2 = matvec(St, matvec(alpha, p2))
    dep_p = rank_mod([p1, p2], P) <= 1
    dep_v = rank_mod([v1, v2], P) <= 1
    ok_inj &= (dep_p == dep_v)
print("5.3 rank 2: injectivity on P^1 (sample): %s" % ok_inj)
```
