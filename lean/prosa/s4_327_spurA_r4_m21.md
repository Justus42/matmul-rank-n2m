# S4-21: Der Unterfall (M21) bei e = 3 (Stufe 4, Runde 4, Spur A)

- Auftrag: S4-21, Protokoll 0.6, Stufe 4, Runde 4, Spur A. Rolle: Beweissucher. Darf den Unterfall in beide Richtungen angreifen.
- Datum: 26.11.2026. Zweig `claude/project-thread-bltpw6`. Beginn und Ende stehen in den Git-Zeitstempeln.
- **Status aller Aussagen dieser Datei: behauptet oder ausdrücklich vermutet.** Den Status setzt nur der Orchestrator. Die beiden Wörter, die das Protokoll dem Status geprüft vorbehält, verwende ich für keine eigene Aussage.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md`, `STATUS.md` (Anfang und Auftragstabelle), `LOG.md` (Stufe 4), `versuche/README.md` und die Liste in `versuche/`, `lean/prosa/s4_327_spurA_r3_e3.md` (S4-14, ganz), `lean/prosa/s4_327_spurA_r2_bau.md` (S4-07, Abschnitte 0 bis 6.2), `lean/prosa/s4_327_spurA_r3_e2.md` (S4-15, Abschnitte 0 und 1), `lean/prosa/yang_n3.md` (Abschnitte 1 bis 6, vor allem R1 bis R3 und Lemma A). Von `lean/prosa/s4_327_spurA_r2_ausschluss.md` (S4-06) habe ich nur die Verweise in S4-07 und S4-15 gelesen; ich stütze mich auf nichts daraus außer dem dort festgehaltenen Restfall, den auch S4-07 benutzt.
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben, kein Lean.
- Offenlegung: Eingeblendet wurden mir der Index des Projektgedächtnisses und die Einzeleinträge `yang-n3-prosa`, `yang-n3-teil3-lean`, `aussagen-abgleich-n3` und `git-regeln` (Datei-, Bau- und Git-Hinweise, kein Urteil zu R-327). Für die Mathematik habe ich sie nicht benutzt.

---

## 0. Ergebnis in Kürze

**Der Unterfall (M21) ist nicht vollständig ausgeschlossen. Ein Verfahren habe ich nicht gefunden.** Neu ist ein Werkzeug, das in S4-07 und S4-14 nicht benutzt wurde: die **Freiheit in der Wahl der Normalform**. Lemma A aus `yang_n3.md` liefert die Normalform durch einen Basiswechsel (S, T) ∈ GL_3 × GL_2, und fast jede Wahl ist zulässig. Ich zeige, dass „e = 3“ eine offene Bedingung an (S, T) ist. Hat ein Verfahren also in einer Normalform e = 3, dann auch in einer **allgemeinen** Normalform, und dort fallen zwei a-Punkte nur aus inneren Gründen zusammen. Zusammen mit Satz R und der Zerlegung K^34 = K″ ⊕ b_0·K′ aus S4-14 erzwingt das eine sehr enge Gestalt:

1. **Satz G (behauptet).** Hat ein Verfahren der Länge 34 für ⟨3,2,7⟩ in irgendeiner Normalform e = 3, dann haben **genau 26 der 34 Formen α_t Rang 1 und genau 8 Rang 2**. Die 8 Rang-2-Formen sind paarweise nicht proportional, ihre 8 Matrizen C_t sind linear unabhängig. In einer allgemeinen Normalform gilt außerdem c_1 = c_2 = 0 auf den 26 Rang-1-Produkten, die 8 Rang-2-Produkte sitzen auf 8 verschiedenen a-Punkten im Träger von w, und K″ = K′ ⊕ K^Z.
2. **Satz K (behauptet).** In dieser Lage spannen die 8 Formen β_t der Rang-2-Produkte **höchstens 6 Dimensionen** auf. Benutzt wird dafür erstmals die Brent-Gruppe (B).
3. **Satz L (behauptet).** Liegen die 8 a-Punkte der Rang-2-Produkte in der allgemeinen Normalform nicht auf einem Kegelschnitt, dann wird der Wert jedes Elements von K′ an einem solchen Punkt z schon von seinen Werten auf den Fasern über der Spaltengeraden ℓ_z von α_z festgelegt. Insbesondere liegen auf ℓ_z mindestens 4 a-Punkte der Rang-1-Produkte aus dem Träger von w.
4. **Rechnung (behauptet).** In 32 990 zufälligen Lagen mit der Gestalt aus Satz G über GF(32003) und GF(10007), darunter Lagen mit Z auf einem Kegelschnitt oder einer Geraden und Lagen mit 4 Punkten von Y auf einer Geraden, hat (C′) nur Lösungen mit c = 0 auf den 8 Rang-2-Produkten. Das widerspricht dem Rang 2. Ein Beweis dafür fehlt.
5. **Lücke L-21:** Es fehlt genau der Schritt „in der Gestalt von Satz G erzwingt (C′) c = 0 auf Z“ (Vermutung S4-21-V). Mit ihr wäre e = 3 in jeder Normalform ausgeschlossen. Satz L schließt den Fall nicht, er verlagert ihn auf Geraden; den Fall „Z auf einem Kegelschnitt“ behandelt er nicht.

---

## 1. Aussagen im Wortlaut

Bezeichnungen wie in S4-07, Abschnitt 1, und S4-14, Abschnitt 3; Ergänzungen in Abschnitt 3 dieser Datei. „Normalform zu (S, T)“ heißt: das Verfahren über dem algebraischen Abschluss K (R1), nach dem Basiswechsel R3 mit (S, T) ∈ GL_3(K) × GL_2(K), sofern danach (SN1) und (SN2) gelten, und nach der Skalierung auf a_0 = 1 (S4-07, Abschnitt 1.1). G* ⊆ GL_3 × GL_2 ist die Menge dieser (S, T).

**Aussage S4-21-A (Offenheit von e = 3, behauptet).** G* ist Zariski-offen und nicht leer. Die Menge {(S, T) ∈ G* : e = 3 in der Normalform zu (S, T)} ist Zariski-offen in GL_3 × GL_2. Ist sie nicht leer, ist sie dicht.

**Aussage S4-21-B (Satz G, behauptet).** Es gebe ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F und eine Normalform mit e = 3. Dann gilt:
 (i) Genau 26 der Formen α_t haben Rang 1 (als 3×2-Matrizen), genau 8 haben Rang 2. Die 8 Rang-2-Formen sind paarweise nicht proportional, und ihre Matrizen C_t sind linear unabhängig. Schreibt man die Rang-1-Formen als α_t = x_t·y_tᵀ, dann zerfallen die 26 Indizes nach der Geraden K·x_t in Klassen der Größe 2 oder 4; die Zahl der Klassen liegt zwischen 7 und 13.
 (ii) Es gibt eine dichte offene Menge von (S, T), so dass in der Normalform zu (S, T) mit Y := {t : rk α_t = 1}, Z := {t : rk α_t = 2} gilt: e = 3 und (M21); c_1 = c_2 = 0 auf Y; die 8 Indizes in Z liegen auf 8 verschiedenen a-Punkten, jeder davon trägt nur diesen einen Index, w ist dort ≠ 0, und (c_1(z), c_2(z)) ≠ (0, 0); die Fasern über den a-Punkten von Y haben |T_p| = 2·d_p mit Σ_{p ⊆ Y} d_p = 13; K′ ∩ K^Z = 0, K″ = K′ ⊕ K^Z und Θ(J³_0) = K^Z.

**Aussage S4-21-C (Satz K, behauptet).** In einer Normalform wie in S4-21-B (ii) sei
 𝒦 := {λ ∈ K^Z : es gibt k ∈ K′ mit c_i·λ·w − a_i·k ∈ K′ für i = 1, 2}
(λ·w ist der Vektor, der auf Z gleich λ·w und auf Y gleich 0 ist). Dann ist dim 𝒦 ≤ 6, und 𝒦 enthält j|_Z / w|_Z für jedes j ∈ J (aus (C)) und π(j)|_Z / w|_Z für jedes j ∈ J (aus (B)). Folglich spannen die 8 Formen β_t, t ∈ Z, einen Raum der Dimension höchstens 6 auf; das gilt dann für das ursprüngliche Verfahren über F. Liegen die 8 a-Punkte von Z nicht auf einem Kegelschnitt, dann ist 𝒦 = P_2|_Z, u|_Z ∈ (w·P_2)|_Z, p_k|_Z ∈ (w·P_2)|_Z für alle k, und die β_t, t ∈ Z, spannen genau 6 Dimensionen auf.

**Aussage S4-21-D (Satz L, behauptet).** In einer Normalform wie in S4-21-B (ii) sei dim 𝒦 = 6 (das gilt nach S4-21-C, wenn die a-Punkte von Z nicht auf einem Kegelschnitt liegen). Für z ∈ Z sei ℓ_z die affine Gerade durch z mit Richtung (c_1(z), c_2(z)); das ist die Gerade in P², die zur Spaltenebene von α_z gehört. Dann gilt für jedes z ∈ Z:
 (i) Verschwindet ein k ∈ K′ auf allen Indizes über den a-Punkten von Y, die auf ℓ_z liegen, dann ist k(z) = 0.
 (ii) Auf ℓ_z liegen mindestens 4 a-Punkte von Y im Träger von w, und Σ d_p über die a-Punkte p von Y auf ℓ_z ist höchstens 6.

**Aussage S4-21-E (Rechnung über GF(32003) und GF(10007), behauptet).** In 32 990 zufällig erzeugten Lagen, die die Bedingungen von S4-21-B (ii) an a-Punkte, Fasern, w und u erfüllen (dim J = 7, dim K′ = 13, dim K″ = 21, K″ abgeschlossen, dim N = 3, K′ ∩ K^Z = 0), hat das lineare System (C′) mit c_1, c_2 nur auf Z als Unbekannten (κ frei) ausschließlich Lösungen mit c_1 = c_2 = 0. Davon 25 355 über GF(32003), 7 635 über GF(10007); 9 712 der Lagen über GF(32003) sind Sonderlagen (Z auf einem Kegelschnitt, Z auf einer Geraden, 4 Punkte von Z und 4 Punkte von Y auf einer Geraden, Z auf einem Kegelschnitt und 4 Punkte von Y auf einer Geraden).

**Vermutung S4-21-V.** In jeder Lage mit der Gestalt aus S4-21-B (ii) hat (C′) nur Lösungen mit c_1 = c_2 = 0 auf Z.

**Folgerung aus S4-21-V (behauptet, bedingt).** Gilt S4-21-V, dann gibt es kein Verfahren der Länge 34 für ⟨3,2,7⟩, das in irgendeiner Normalform e = 3 hat. Grund: Nach S4-21-B (ii) ist (c_1(z), c_2(z)) ≠ (0, 0) auf Z, und (C′) muss gelten.

**Lücke L-21 (ersetzt L-2′ aus S4-14 für den Zweck dieses Auftrags).** Offen ist genau S4-21-V. Ein Beweis müsste die Fälle „dim 𝒦 = 6“ (dort hilft S4-21-D) und „die a-Punkte von Z liegen auf einem Kegelschnitt“ behandeln. Abschnitt 8 nennt, woran die Versuche hängen.

---

## 2. Worauf sich der Beweis stützt

Ohne eigene Prüfung übernommen (Status dort: behauptet):

- **Restfall R-327** (B-017 bis B-019): In jeder Normalform gilt dim N = 3, dim S = 1, rk L = 6, also K′ = J + a_1J + a_2J.
- **S4-07**, Abschnitte 1 bis 3 und 4.1 bis 4.2: die Umformulierung (A) bis (D) und (C′), der Vektor w mit w·P_1 = f_0(N), w·P_2 ⊆ J, e := dim(w·P_2) − 3 ≤ 3, und im Fall e = 3: J = w·P_2 ⊕ ⟨u⟩, K′ = w·P_3 ⊕ u·P_1, ker L ⊆ (w·P_2)², J³_0 ⊆ (w·P_2)³. Diese Teile habe ich Zeile für Zeile nachgerechnet.
- **S4-14**, Satz R und Abschnitt 4 (B-026): im Fall e = 3 ist K″ = w·P_4 ⊕ u·P_2 = A·w + A·u, dim K″ = 21, K″ unter a_1, a_2 abgeschlossen, K^34 = K″ ⊕ b_0·K′, K″ = K′ ⊕ Θ(J³_0). Den Beweis dort (Schritte 1 bis 6) habe ich nachgerechnet.
- **`yang_n3.md`**: R1 (Körpererweiterung), R2, R3 (Basiswechsel α′_t(A) = α_t(SAT), β′_t(B) = β_t(T^{−1}B), C′_t = S^{−1}C_t), G4, Definition von (SN1), (SN2) und Lemma A (es gibt (S, T) mit (SN1), (SN2)).

Neu in dieser Datei und hier vollständig bewiesen: Lemma O, Lemma F, Satz G, Satz K, Satz L. Die Brent-Gruppe (B) wird in Satz K benutzt, b_0 in Satz G (über K^34 = K″ ⊕ b_0·K′ und die Fasern), die Symmetrie GL_2 der mittleren Dimension in Lemma O und Satz G.

**Körper.** Alle Schritte sind lineare Algebra, Interpolation an endlich vielen Punkten und Zariski-Offenheit über dem algebraischen Abschluss K. Sie gelten in jeder Charakteristik. Damit gelten die Aussagen für Verfahren über jedem Körper F, soweit die übernommenen Aussagen (Restfall, S4-07, Satz R) für jeden Körper gelten. Die Aussagen (i) von Satz G und die Rangaussage von Satz K sind invariant unter R1 und R3 und gelten dann für das ursprüngliche Verfahren über F.

---

## 3. Bezeichnungen

- Die Koeffizientenmatrix von α_t heißt wieder α_t ∈ K^{3×2}, also α_t(X) = Σ_{i,j} (α_t)_{ij} X_{ij}. Für u ∈ K³, p ∈ K^{1×2} ist α_t(u·p) = uᵀ·α_t·pᵀ.
- Nach R3 mit (S, T) ist α′_t(e_{i0}) = α_t(S e_{i0} T) = u_iᵀ α_t pᵀ, wobei u_i die Spalten von S und p die erste Zeile von T sind; ebenso α′_t(e_{i1}) = u_iᵀ α_t p′ᵀ mit der zweiten Zeile p′ von T. In Vektorform: **a′(t) = Sᵀ α_t pᵀ, b′(t) = Sᵀ α_t p′ᵀ.** Nach der Skalierung ist a(t) = a′(t)/a′_0(t), b(t) = b′(t)/a′_0(t). Der a-Punkt von t ist also der Punkt [Sᵀ α_t pᵀ] der projektiven Ebene, in der affinen Karte X_0 = 1.
- β wird bei der Skalierung nicht verändert; nach R3 ist β′_t = β_t ∘ T^{−1}. C_t wird zu a′_0(t)·S^{−1}C_t.
- Π: Menge der verschiedenen a-Punkte, T_p ⊆ {1, …, 34} die Indizes über p, e_p ∈ A das Polynom mit Wert 1 auf T_p und 0 sonst (Interpolation), M_p := e_p·K″ ⊆ K^{T_p}, d_p := dim M_p.
- K^Z: Vektoren mit Träger in Z. ρ : K″ = K′ ⊕ K^Z → K^Z die Projektion längs K′ (nur in der Lage von Satz G (ii) erklärt).
- Sonst wie S4-14, Abschnitt 3: A = K[a_1, a_2], P_d, M_d, J³_0, Θ, c_i = b_i − a_i·b_0, π(j) = b_0·j + κ(j) mit κ : J → K′.

---

## 4. Lemma O: e = 3 ist eine offene Bedingung (Aussage S4-21-A)

Sei G := GL_3(K) × GL_2(K). G ist eine irreduzible Varietät.

**G* ist offen.** (SN1) heißt u_0ᵀ α_t pᵀ ≠ 0 für alle t, eine offene Bedingung. (SN2) verletzt heißt: Es gibt v ≠ 0 in K^{2×7}, so dass die drei Vektoren f′_i(v) = (u_iᵀ α_t pᵀ · β_t(T^{−1}v))_t linear abhängig sind. Die Menge der Paare ((S, T), [v]) ∈ G × P(K^{2×7}) mit verschwindenden 3×3-Minoren ist abgeschlossen, und die Projektion G × P^{13} → G ist abgeschlossen (P^{13} ist vollständig). Also ist die Menge, auf der (SN2) gilt, offen. G* ≠ ∅ nach Lemma A.

**Regularität.** Auf G* sind q_k(t) = β_t(T^{−1}e_{1k}) und a_i(t) = u_iᵀα_tpᵀ / u_0ᵀα_tpᵀ reguläre Funktionen von (S, T). Q sei die 34×7-Matrix mit den Spalten q_k; sie hat auf G* Rang 7 (G4).

**Die Größe e als Rang.** Sei Ξ : (K^7)³ → (K^34)², (y, y′, y″) ↦ (a_1·Qy − Qy′, a_2·Qy − Qy″). Weil Q injektiv ist, bildet die Projektion (y, y′, y″) ↦ y den Kern von Ξ bijektiv auf N = {y : a_1Qy ∈ J, a_2Qy ∈ J} ab. Nach dem Restfall ist dim N = 3 auf G*, also rk Ξ = 18 konstant. Nach S4-07, Abschnitt 3.1, ist f_0(N) = Q(N) = w·P_1, also w·P_2 = Q(N) + a_1·Q(N) + a_2·Q(N). Mit Ξ³ := Ξ ⊕ Ξ ⊕ Ξ (Rang 54) und Γ : ((K^7)³)³ → K^34, ((y_0, ·, ·), (y_1, ·, ·), (y_2, ·, ·)) ↦ Qy_0 + a_1Qy_1 + a_2Qy_2 ist w·P_2 = Γ(ker Ξ³), also
 e + 3 = dim Γ(ker Ξ³) = dim ker Ξ³ − dim(ker Ξ³ ∩ ker Γ) = 9 − (63 − rk[Ξ³; Γ]) = rk[Ξ³; Γ] − 54,
wobei [Ξ³; Γ] die untereinander gestellten Matrizen sind. Nach S4-07, Abschnitt 3.1, ist e ≤ 3. Also ist {e = 3} = G* ∩ {rk[Ξ³; Γ] ≥ 60}, und rk ≥ 60 heißt, dass einer der 60×60-Minoren (reguläre Funktionen) nicht verschwindet: eine offene Bedingung. In der irreduziblen Varietät G ist jede nicht leere offene Menge dicht. ∎

---

## 5. Satz G (Aussage S4-21-B)

### 5.1 Lemma F (wann a-Punkte für alle Wahlen zusammenfallen)

Für t ≠ t′ sei V_{tt′} := {p ∈ K^{1×2} : die Vektoren α_t pᵀ und α_{t′} pᵀ sind linear abhängig}, eine abgeschlossene Menge (2×2-Minoren). **Es ist V_{tt′} = K^{1×2} genau dann, wenn (I) α_{t′} = λ·α_t für ein λ ∈ K, oder (II) beide Rang 1 haben und dieselbe Spalte K·x.**

Beweis. „⇐“ ist klar. „⇒“: Hat α_t Rang 2, dann ist p ↦ α_t pᵀ injektiv, und für jedes p ≠ 0 ist α_{t′}pᵀ = λ(p)·α_tpᵀ. Für unabhängige p_1, p_2 folgt aus der Linearität λ(p_1)α_tp_1ᵀ + λ(p_2)α_tp_2ᵀ = λ(p_1 + p_2)(α_tp_1ᵀ + α_tp_2ᵀ) und der Unabhängigkeit von α_tp_1ᵀ, α_tp_2ᵀ, dass λ(p_1) = λ(p_1 + p_2) = λ(p_2). Also ist λ konstant und α_{t′} = λα_t (Fall I). Hat α_{t′} Rang 2, ebenso mit vertauschten Rollen; dann hat auch α_t Rang 2 (Fall I). Haben beide Rang 1, α_t = x y ᵀ, α_{t′} = x′ y′ᵀ, dann wähle p mit y·p ≠ 0 ≠ y′·p; aus der Abhängigkeit von (y·p)x und (y′·p)x′ folgt K·x = K·x′ (Fall II). ∎

Sei G_gen ⊆ G die Menge der (S, T), deren erste Zeile p in keinem der endlich vielen echten Teilmengen V_{tt′} (Paare, die weder (I) noch (II) erfüllen) liegt. Jedes solche V_{tt′} ist die Nullstellenmenge eines vom Nullpolynom verschiedenen 2×2-Minors in p, also ist G_gen offen und dicht in G.

### 5.2 Wahl der Normalform

Nach Voraussetzung hat eine Normalform e = 3. Nach Lemma O ist {e = 3} offen, nicht leer und dicht; G_gen ist offen und dicht. Wähle (S, T) im Durchschnitt (nicht leer, weil G irreduzibel ist). In der Normalform zu (S, T) gilt e = 3, also nach Satz R (S4-14) (M21): K″ = A·w + A·u, dim K″ = 21, K″ abgeschlossen, K^34 = K″ ⊕ b_0·K′, K″ = K′ ⊕ Θ(J³_0).

Zwei Indizes haben genau dann denselben a-Punkt, wenn Sᵀα_tpᵀ und Sᵀα_{t′}pᵀ abhängig sind, also p ∈ V_{tt′}. Wegen (S, T) ∈ G_gen geschieht das nur in den Fällen (I) und (II). Jede Faser T_p besteht also entweder nur aus Rang-2-Formen, die paarweise proportional sind (**Klasse I**), oder nur aus Rang-1-Formen mit derselben Spalte (**Klasse II**). Y ist die Vereinigung der Fasern der Klasse II, Z die der Klasse I.

### 5.3 Was die Klassen für a, b, c bedeuten

- **Klasse I.** Ist α_{t′} = λα_t, dann a′(t′) = λa′(t), b′(t′) = λb′(t), nach der Skalierung a(t′) = a(t) und b(t′) = b(t). Auf einer Faser der Klasse I sind a, b, also auch b_0 und c_1, c_2 konstant.
- **Klasse II.** Ist α_t = x yᵀ, dann a′(t) = (y·p)·Sᵀx und b′(t) = (y·p′)·Sᵀx, nach der Skalierung b(t) = r_t·a(t) mit r_t = (y·p′)/(y·p). Also b_0(t) = r_t (wegen a_0 = 1) und **c_i(t) = b_i(t) − a_i(t)b_0(t) = 0** auf Y.

### 5.4 Zählung über die Fasern

Weil K″ ein A-Modul ist, gilt K″ = ⊕_p M_p, Σ_p d_p = 21, und M_p = span(e_p·w, e_p·u), also d_p ≤ 2. Multipliziert man K^34 = K″ + b_0·K′ mit e_p, erhält man K^{T_p} = M_p + b_0·e_p·K′ ⊆ M_p + b_0·M_p (denn e_pK′ ⊆ e_pK″ = M_p). Also:
- |T_p| ≤ 2·d_p für jede Faser;
- auf einer Faser der Klasse I ist b_0 konstant, also b_0·M_p = M_p und **|T_p| = d_p**.

Summiert: 13 = 34 − 21 = Σ_p (|T_p| − d_p) = Σ_{p ⊆ Y} (|T_p| − d_p) ≤ Σ_{p ⊆ Y} |T_p|/2 = |Y|/2, also **|Y| ≥ 26**.

### 5.5 Θ lebt auf Z

Für (j_0, j_1, j_2) ∈ J³_0 ist Θ(j) = c_1·j_1 + c_2·j_2, und c_1, c_2 verschwinden auf Y. Also Θ(J³_0) ⊆ K″ ∩ K^Z = ⊕_{p ⊆ Z} M_p, und das hat die Dimension Σ_{p ⊆ Z} d_p = Σ_{p ⊆ Z} |T_p| = |Z|. Nach (D) ist dim Θ(J³_0) = 8. Also |Z| ≥ 8, zusammen mit 5.4: **|Y| = 26, |Z| = 8**, in 5.4 gilt überall Gleichheit, also **|T_p| = 2d_p auf Y** und Σ_{p⊆Y} d_p = 13, und **Θ(J³_0) = K^Z**. Mit Satz R folgt **K″ = K′ ⊕ K^Z**, insbesondere **K′ ∩ K^Z = 0**.

### 5.6 Die Fasern der Klasse I sind einzelne Punkte im Träger von w

Nach 5.3 ist c_i auf jeder Faser konstant (auf Y gleich 0, auf Z je Faser konstant). Durch Interpolation an den endlich vielen a-Punkten gibt es Polynome C_i ∈ A mit c_i = C_i als Vektoren. Nach S4-07, Abschnitt 4.2, ist ker L ⊆ (w·P_2)², also j_1 = w·φ_1, j_2 = w·φ_2 und Θ(j) = w·(C_1φ_1 + C_2φ_2) ∈ A·w. Also K^Z = Θ(J³_0) ⊆ A·w. Für eine Faser T_p ⊆ Z folgt K^{T_p} = e_p·K^Z ⊆ e_p·A·w = K·(e_p w). Also **|T_p| = 1 und w ≠ 0 auf T_p.** Die 8 Indizes in Z liegen auf 8 verschiedenen a-Punkten; nach Lemma F sind die 8 Rang-2-Formen paarweise nicht proportional.

### 5.7 Rang 2 und die Matrizen C_t

Für z ∈ Z ist α_z (nach Skalierung) die Matrix mit den Spalten a(z) = (1, z_1, z_2) und b(z) = b_0(z)·a(z) + (0, c_1(z), c_2(z)). Rang 2 heißt **(c_1(z), c_2(z)) ≠ (0, 0)**. Die Spaltenebene von α_z ist in der affinen Karte die Gerade ℓ_z durch z mit Richtung (c_1(z), c_2(z)).

K′ ∩ K^Z = 0 heißt: Kein von 0 verschiedener Vektor mit Träger in Z liegt in ker W, also sind die W(e_t) = C_t (t ∈ Z) linear unabhängig. Das überträgt sich auf das ursprüngliche Verfahren, weil C_t dort nur um den Faktor a′_0(t) ≠ 0 und die Matrix S^{−1} verändert ist.

### 5.8 Zusammenfassung und Übergang zum Ausgangsverfahren

Rang, Proportionalität und gleiche Spalten der α_t ändern sich unter R1 und R3 nicht (α′_t = Sᵀ α_t Tᵀ als Matrix, mit invertierbaren Faktoren). Also gilt (i) für das Ausgangsverfahren. Die Klassengrößen in (i): Klassen der Rang-1-Formen nach der Spalte sind die Fasern über Y, mit |T_p| = 2d_p ∈ {2, 4} und Σ d_p = 13, also zwischen 7 und 13 Klassen. (ii) ist 5.2 bis 5.7. ∎

**Bemerkung.** Satz G braucht von (D) nur dim Θ(J³_0) = 8 und von b_0 nur die Zerlegung K^34 = K″ ⊕ b_0·K′. Der Kern ist, dass b_0 auf einer Faser der Klasse I konstant sein muss und c auf einer Faser der Klasse II verschwindet. In einer festen Normalform (S4-14, Abschnitt 8, Ansatz 2) gibt es diese Unterscheidung nicht, weil dort Fasern auch zufällig entstehen können.

---

## 6. Satz K (Aussage S4-21-C)

Sei eine Normalform wie in Satz G (ii) gegeben.

**Schritt 1 (𝒦 enthält J und π(J)).** Für j ∈ J ist c_i·j = c_i·(j|_Z), weil c_i auf Y verschwindet. Nach (C′) ist c_i·j − a_i·κ(j) ∈ K′, also j|_Z / w|_Z ∈ 𝒦 mit k = κ(j). Nach (B) mit i = 0 ist ν(j) := b_0·π(j) ∈ K′, und nach (B) mit i = 1, 2 ist b_i·π(j) = c_i·π(j) + a_i·ν(j) ∈ K′, also c_i·π(j) − a_i·(−ν(j)) ∈ K′ und π(j)|_Z / w|_Z ∈ 𝒦. (Division durch w ist erlaubt, weil w auf Z nicht verschwindet, Satz G (ii).)

**Schritt 2 (die k mit a_1k, a_2k ∈ K′).** Sei k ∈ K′, k = w·F + u·G mit F ∈ P_3, G ∈ P_1 (eindeutig, S4-07, 4.1). Dann a_ik = w·a_iF + u·a_iG ∈ w·P_4 ⊕ u·P_2, und diese Darstellung ist eindeutig (ε bijektiv, S4-14, Schritt 1). a_ik ∈ K′ = w·P_3 ⊕ u·P_1 gilt also genau dann, wenn deg(a_iF) ≤ 3 und deg(a_iG) ≤ 1. Für i = 1 und 2 zusammen heißt das deg F ≤ 2 und deg G ≤ 0, also k ∈ J. Umgekehrt a_i·J ⊆ K′ nach (A). Also **{k ∈ K′ : a_1k ∈ K′ und a_2k ∈ K′} = J.**

**Schritt 3 (dim 𝒦 ≤ 6).** Zu λ ∈ 𝒦 wähle k_λ wie in der Definition. Sind k, k′ beide zulässig, dann a_i(k − k′) ∈ K′ für i = 1, 2, also k − k′ ∈ J nach Schritt 2. Damit ist Γ : 𝒦 → K′/J, λ ↦ [k_λ], wohldefiniert und linear. Ist Γ(λ) = 0, also k_λ ∈ J, dann a_ik_λ ∈ K′ und c_i·λ·w ∈ K′ ∩ K^Z = 0. Weil (c_1(z), c_2(z)) ≠ 0 und w(z) ≠ 0 für jedes z ∈ Z, folgt λ = 0. Γ ist injektiv, und **dim 𝒦 ≤ dim K′/J = 13 − 7 = 6.**

**Schritt 4 (Rang der β_t auf Z).** J + π(J) = span(q_1, …, q_7, p_1, …, p_7) = {(β_t(B))_t : B ∈ K^{2×7}}. Nach Schritt 1 und 3 hat die Einschränkung dieses Raums auf Z höchstens Dimension 6. Das heißt: Die 8 Linearformen β_t, t ∈ Z, spannen höchstens 6 Dimensionen auf. Unter R3 wird β_t zu β_t ∘ T^{−1}, die Skalierung ändert β nicht; die Aussage gilt also auch für das Ausgangsverfahren.

**Schritt 5 (Z nicht auf einem Kegelschnitt).** Dann ist dim P_2|_Z = 6, und 𝒦 ⊇ (w·P_2)|_Z / w|_Z = P_2|_Z. Mit Schritt 3 ist 𝒦 = P_2|_Z. Nach Schritt 1 liegen u|_Z und alle p_k|_Z in w·P_2|_Z, und die β_t, t ∈ Z, spannen genau 6 Dimensionen auf. ∎

---

## 7. Satz L (Aussage S4-21-D)

Sei dim 𝒦 = 6. Dann ist Γ aus Satz K, Schritt 3, bijektiv.

**Schritt 1.** Für k ∈ K′ ist a_i·k ∈ K″, also ρ(a_ik) erklärt. Für j ∈ J ist ρ(a_ij) = 0, weil a_ij ∈ K′. Zu k ∈ K′ gibt es λ ∈ 𝒦 mit k − k_λ ∈ J (Γ surjektiv), also ρ(a_ik) = ρ(a_ik_λ). Nach Definition von 𝒦 ist c_iλw − a_ik_λ ∈ K′ und c_iλw ∈ K^Z, also ρ(a_ik_λ) = c_i·λ·w. Damit gilt **c_2·ρ(a_1k) = c_1·ρ(a_2k) punktweise auf Z, für alle k ∈ K′.**

**Schritt 2.** Für z ∈ Z sei ℓ̃_z := c_1(z)·(a_2 − z_2) − c_2(z)·(a_1 − z_1) ∈ P_1; ℓ_z = {ℓ̃_z = 0} ist die Gerade aus Satz G, 5.7. Für k ∈ K′ ist ℓ̃_z·k ∈ K″ und, weil ρ(k) = 0,
 ρ(ℓ̃_zk)(z) = c_1(z)·ρ(a_2k)(z) − c_2(z)·ρ(a_1k)(z) = 0
nach Schritt 1. Andererseits ist ρ(m) = m − m′ mit dem eindeutigen m′ ∈ K′, das auf Y mit m übereinstimmt (K′ → K″|_Y ist bijektiv, weil K′ ∩ K^Z = 0 und dim K″|_Y = 21 − 8 = 13). Für m = ℓ̃_zk ist m(z) = 0, also verschwindet das Element m′ ∈ K′ mit m′|_Y = (ℓ̃_z k)|_Y an der Stelle z.

**Schritt 3 (Aussage (i)).** K″|_Y = ⊕_{p ⊆ Y} M_p, und ℓ̃_z wirkt auf M_p als Skalar ℓ̃_z(p). Wenn k über ganz K′ läuft, läuft k|_Y über ganz K″|_Y, und (ℓ̃_zk)|_Y über ⊕_{p ⊆ Y, p ∉ ℓ_z} M_p. Schritt 2 sagt also: Jedes Element von K′, das auf allen Fasern über a-Punkten von Y auf ℓ_z verschwindet, verschwindet an z. Das ist (i).

**Schritt 4 (Aussage (ii)).** Seien y_1, …, y_m die a-Punkte von Y auf ℓ_z, an denen w nicht verschwindet. Ist m ≤ 3, so wähle für jedes y_r eine affine Funktion, die an y_r verschwindet und an z nicht (z ≠ y_r), und sei F ihr Produkt (Grad ≤ 3). Dann ist w·F ∈ K′ und verschwindet auf allen Fasern über a-Punkten von Y auf ℓ_z (auf denen mit w = 0 ohnehin), aber (wF)(z) = w(z)F(z) ≠ 0, im Widerspruch zu (i). Also m ≥ 4. Für die obere Schranke: Für j ∈ J ist ℓ̃_z·j ∈ P_1·J ⊆ K′, und es verschwindet auf allen Fasern über ℓ_z. Die Abbildung J → K″|_{Y ∖ ℓ_z}, j ↦ (ℓ̃_zj)|_{Y∖ℓ_z}, ist injektiv: sonst gäbe es ein j ≠ 0 mit ℓ̃_zj ∈ K′ ∩ K^Z = 0, aber ℓ̃_z j ≠ 0, weil ε auf P_3 ⊕ P_1 injektiv ist. Also Σ_{p ⊆ Y, p ∉ ℓ_z} d_p ≥ 7 und Σ_{p ⊆ Y, p ∈ ℓ_z} d_p ≤ 13 − 7 = 6. ∎

**Bemerkung zur Lage auf Geraden.** Im Fall dim 𝒦 = 6 ist die ganze Bedingung (C′) auf Z „längs der Geraden ℓ_z“ lokalisiert: Mit einem Parameter τ auf ℓ_z (τ(z) = 0, a = z + τ·(c_1(z), c_2(z))) ist ρ(a_ik)(z) = −c_i(z)·m′_τ(z), wo m′_τ ∈ K′ ein Element ist, das auf den Fasern über den a-Punkten von Y auf ℓ_z mit τ·k übereinstimmt (es existiert, weil K′ → K″|_Y bijektiv ist; der Wert an z hängt nach (i) nicht von der Wahl ab). Herleitung: Auf diesen Fasern ist a_i = z_i + τ·c_i(z), und nach (i) hängt m′(z) nur von m′ auf diesen Fasern ab. Auf der Geraden ist K′ der Raum {w·F̄ + u·Ḡ : deg F̄ ≤ 3, deg Ḡ ≤ 1} in einer Variablen, J ist {w·F̄ + c·u : deg F̄ ≤ 2}. Das ist dieselbe Lage wie in S4-14, Abschnitt 8, Ansatz 3 (Reduktion vom Grad 5), nur eindimensional.

---

## 8. Was fehlt, und gescheiterte Ansätze (mit Grund)

### 8.1 Die Lücke L-21 genau

Zu zeigen bleibt S4-21-V: In der Gestalt von Satz G (ii) folgt aus (C′) c = 0 auf Z. Mit Satz K und Satz L ist das gleichwertig dazu, die beiden folgenden Fälle auszuschließen:
 (a) dim 𝒦 = 6: dann gilt Satz L für alle 8 Punkte von Z, und zusätzlich muss Θ(J³_0) = K^Z gelten;
 (b) dim 𝒦 ≤ 5: dann liegen die 8 a-Punkte von Z auf einem Kegelschnitt (Satz K, Schritt 5), und zwar in der Normalform zu jedem (S, T) aus einer dichten offenen Menge. Die 8 Punkte bewegen sich dabei mit p linear auf ihren festen Geraden ℓ_z, die Punkte von Y bleiben fest.

### 8.2 Gescheiterte Ansätze

1. **Unterbestimmte Zählungen durch Einsetzen (Substitution).** Ziel: aus Satz K einen Widerspruch durch Rangabschätzung. Setzt man B in U := {B : β_t(B) = 0 für t ∈ Z} (dim U ≥ 8) und A = v·sᵀ, bleibt nur der Anteil der 26 Rang-1-Produkte, und man erhält 3·dim(sᵀU) ≤ 26 − #{t ∈ Y : y_t·s = 0}. Wegen dim(sᵀU) ≤ 7 ist das mit 21 ≤ 26 verträglich. Ebenso A mit xᵀA = 0 (Rest ⟨2,2,7⟩ eingeschränkt auf U) oder A mit Spalten in einer Geraden (Rest ⟨1,2,7⟩, Rang 14): alle Schranken bleiben erfüllt. Gescheitert an: Zählungen sehen die Bedingung (C′) nicht.
2. **Fall (a) über die Funktionale ζ_z.** Sei ζ_z(g) := ρ(m)(z)/w(z) für m ∈ K″ mit Klasse g in K″/K′ ≅ gr_4 = S⁴ ⊕ S² (S4-14, Abschnitt 4). Aus Satz L, Schritt 1, folgt, dass ζ_z auf L_z·gr_3 verschwindet, L_z := c_1(z)y − c_2(z)x. Im Fall (a) ist ζ_z also von der Form α_z·ev⁴_{c(z)} + β_z·ev²_{c(z)} (Auswertung der binären Formen in Richtung c(z)). Acht solche Funktionale können eine Basis von gr_4* bilden, und Θ(J³_0) = K^Z verlangt nur das. Ein Widerspruch müsste aus der Bedingung kommen, dass ζ_z Eigenfunktional der Multiplikation mit a_1, a_2 ist. Diese Multiplikation hängt aber von der Reduktion vom Grad 5 auf Grad 4 ab, also von derselben unbekannten Abbildung τ wie in S4-14, Abschnitt 8, Ansatz 3. Gescheitert an: keine allgemeine Aussage über τ, auch nicht auf einer Geraden.
3. **Bewegung der Punkte von Z mit p.** Idee: Satz L muss für alle allgemeinen p gelten, während sich z auf ℓ_z bewegt. In nicht skalierten Koordinaten (K′_0 = ker W, unabhängig von p) lautet Satz L (i): Der Eintrag eines Elements von K′_0 am Index z ist eine Linearkombination seiner Einträge auf den Fasern über ℓ_z. Das hängt von p nicht ab. Gescheitert an: Die Bewegung erzeugt keine neue Bedingung.
4. **Fall (b): 8 bewegliche Punkte auf einem Kegelschnitt.** Gesucht war eine Einteilung, wann die Punkte [α_t pᵀ] (t ∈ Z, je auf ihrer Geraden) für alle p auf einem Kegelschnitt liegen. Ein Beispiel ist der Fall, dass alle ℓ_z zusammenfallen (dann liegen sie sogar auf einer Geraden). Eine vollständige Einteilung habe ich nicht gefunden. Gescheitert an: fehlende Klassifikation.
5. **Untere Schranke 7 für den Rang der β_t auf Z.** Damit wäre Satz K sofort ein Widerspruch. Weder (D) noch die Unabhängigkeit der C_t (t ∈ Z) noch die Gestalt span{C_t : t ∈ Z} = {Y ∈ K^{3×7} : Σ_{i,k} Y_{ik}·a_i·q_k = 0} (das ist W(K^Z) = W(Θ(J³_0))) liefert eine solche Schranke. Gescheitert an: kein Argument gefunden.

Abgrenzung zu S4-14, Abschnitt 8: Ansatz 2 dort (N_0 gegen Θ in einer festen Normalform) wiederhole ich nicht; neu ist der Wechsel der Normalform (Lemma O, Lemma F). Ansatz 3 dort (Reduktion τ) taucht in 8.2 Nr. 2 wieder auf; ich benutze ihn nicht, sondern nenne ihn als Hindernis. Ansätze 1, 4 und 5 dort benutze ich nicht.

### 8.3 Hinweise für die Fortsetzung (vermutet)

- Satz G gibt Spur B eine scharfe Vorgabe: Ein Verfahren der Länge 34 mit e = 3 hätte genau 26 Rang-1- und 8 Rang-2-Formen α_t, die Rang-1-Formen in 7 bis 13 Spaltenklassen der Größe 2 oder 4, und die β der 8 Rang-2-Produkte vom Rang höchstens 6.
- Lemma O und Lemma F hängen nicht an e = 3. Ob sich der Fall e = 2 (S4-15) mit derselben Technik ähnlich einengen lässt, habe ich nicht untersucht (nicht mein Auftrag).

---

## 9. Rechnung (Aussage S4-21-E)

Lagen mit der Gestalt aus Satz G (ii) werden gezielt gebaut (`redgen.py`, `czspec.py`): 8 a-Punkte für Z mit je einem Index, w ≠ 0, u beliebig; dazu a-Punkte für Y, davon n_2 mit d_p = 2 (4 Indizes, w und u zufällig) und 13 − 2n_2 mit d_p = 1 (2 Indizes, Faser aufgespannt von einem Vektor ohne Nullen; u parallel zu w, u = 0 oder w = 0), höchstens 3 Punkte außerhalb des Trägers von w, mindestens 7 Punkte von Y im Träger von w. Geprüft werden dim J = 7, dim K′ = 13, dim K″ = 21, K″ unter a_1, a_2 abgeschlossen, dim N = 3 und K′ ∩ K^Z = 0 (Rang von K′ auf Y gleich 13). Dann wird (C′) mit den Unbekannten c_1|_Z, c_2|_Z (16) und κ (7·13) gelöst und der Rang der Projektion des Lösungsraums auf (c_1|_Z, c_2|_Z) bestimmt.

| Block | Lauf | Primzahl | Punktwahl | zulässige Lagen | Rang der c-Projektion |
|---|---|---|---|---|---|
| 1 | `czonly.py 1 60` | 32003 | allgemein / Gitter / teils auf Kegelschnitt | 5 632 | immer 0 |
| 2 | `PRIME=10007 czonly.py 2 90` | 10007 | wie oben | 7 635 | immer 0 |
| 2 | `czonly.py 3 120` | 32003 | wie oben | 10 011 | immer 0 |
| 2 | `czspec.py 4 100` | 32003 | Z auf Kegelschnitt (2 662), Z auf Gerade (2 622), 4 Punkte von Z und 4 von Y auf einer Geraden (1 793), Z auf Kegelschnitt und 4 Punkte von Y auf einer Geraden (2 635) | 9 712 | immer 0 |

Verworfene Lagen (nicht zulässig) sind in den Ausgaben mitgezählt; der häufigste Grund ist K′ ∩ K^Z ≠ 0. Die Rechnung ist kein Beweis von S4-21-V. Sie zeigt nur, dass in den erzeugten Lagen schon (C′) allein c = 0 auf Z erzwingt; die Bedingungen (B), (D) und b_0 werden in der Rechnung nicht benutzt.

**Rechenblöcke** (je ein Kern, einzelne Python-Prozesse nacheinander, Zeiten UTC):

| Block | Zeit | Inhalt | Commit danach |
|---|---|---|---|
| 1 | 11:40 bis 11:41 | `czonly.py 1 60` | 4eee558 um 11:43:01 |
| 2 | 11:45:26 bis 11:51:21 | `czonly.py 2 90` (GF(10007)), `czonly.py 3 120`, `czspec.py 4 100` | nächster Commit dieser Datei |

---

## 10. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Rechenblöcke: 2 (Abschnitt 9), je unter 30 Minuten, je ein Kern, Commit dazwischen.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs.

---

## Anhang: Programme (Python 3, numpy, exakt modulo einer Primzahl, keine Gleitkommazahlen)

Eigene Implementierung. Die Primzahl ist 32003, außer die Umgebungsvariable PRIME ist gesetzt. Aufrufe aus einem Verzeichnis mit allen vier Dateien: `python3 czonly.py <Startwert> <Sekunden>`, `python3 czspec.py <Startwert> <Sekunden>`.

### la.py

SHA-256 `42537d06ed04b5baf64d9a13b1764053b452f46a6b76a4e048536fadbbc53f51`

```python
# exact linear algebra mod prime p (S4-21, own implementation)
import numpy as np, os
P=int(os.environ.get("PRIME","32003"))
def rref(M,p=P):
    M=np.array(M,dtype=np.int64)%p
    if M.ndim==1: M=M[None,:]
    rows,cols=M.shape; r=0; piv=[]
    for c in range(cols):
        if r==rows: break
        nz=np.nonzero(M[r:,c])[0]
        if len(nz)==0: continue
        k=r+nz[0]
        if k!=r: M[[r,k]]=M[[k,r]]
        M[r]=M[r]*pow(int(M[r,c]),p-2,p)%p
        col=M[:,c].copy(); col[r]=0
        nzr=np.nonzero(col)[0]
        if len(nzr): M[nzr]=(M[nzr]-np.outer(col[nzr],M[r]))%p
        piv.append(c); r+=1
    return M[:r],piv
def rank(M):
    M=np.atleast_2d(np.array(M,dtype=np.int64))
    if M.size==0: return 0
    return len(rref(M)[1])
def null(M):
    M=np.atleast_2d(np.array(M,dtype=np.int64))%P
    n=M.shape[1]; R,piv=rref(M)
    free=[c for c in range(n) if c not in piv]
    out=np.zeros((len(free),n),dtype=np.int64)
    for i,f in enumerate(free):
        out[i,f]=1
        for j,c in enumerate(piv): out[i,c]=(-R[j,f])%P
    return out
def mons(d): return [(i,t-i) for t in range(d+1) for i in range(t+1)]
def pw(v,k):
    o=np.ones_like(v)
    for _ in range(k): o=o*v%P
    return o
def polys(a1,a2,d): return [pw(a1,i)*pw(a2,j)%P for (i,j) in mons(d)]
```

### redgen.py

SHA-256 `3d7944657232e226253e3e7693c5c68ce6f89378a89486414c11a51f70df912f`

```python
# S4-21: random positions with the reduced structure of Satz G
# Z: 8 single indices on distinct a-points in supp w; Y: fibres with |T_p| = 2 d_p, sum d_p = 13.
import numpy as np
from la import *
def gen(rng,mode=0):
    n2=int(rng.integers(0,7)); n1=13-2*n2
    nz1=int(rng.integers(0,min(3,n1)+1))
    if n2+ (n1-nz1) < 7: return None
    npts=8+n2+n1
    if mode==0: pts=rng.integers(0,P,(npts,2))
    elif mode==1:
        g=int(rng.integers(5,9)); sel=rng.choice(g*g,npts,replace=False); pts=np.stack([sel//g,sel%g],1)
    else:
        x=rng.integers(0,P,npts); c=rng.integers(0,P,3); pts=np.stack([x,(c[0]*x*x+c[1]*x+c[2])%P],1)
        m=int(rng.integers(0,npts)); pts[:m]=rng.integers(0,P,(m,2))
    if len(set(map(tuple,pts.tolist())))<npts: return None
    a1=[];a2=[];w=[];u=[];kind=[]
    for k in range(8):
        a1.append(pts[k,0]);a2.append(pts[k,1]);w.append(rng.integers(1,P));u.append(rng.integers(0,P));kind.append('Z')
    for k in range(8,8+n2):
        for _ in range(4):
            a1.append(pts[k,0]);a2.append(pts[k,1]);w.append(rng.integers(0,P));u.append(rng.integers(0,P));kind.append('Y')
    for k in range(8+n2,npts):
        v=rng.integers(1,P,2); z1=(k-8-n2)<nz1
        if z1: s=(0,1)
        else:
            s=(1,int(rng.integers(0,P)) if rng.random()<0.6 else 0)
        for t in range(2):
            a1.append(pts[k,0]);a2.append(pts[k,1]);w.append(v[t]*s[0]%P);u.append(v[t]*s[1]%P);kind.append('Y')
    return np.array(a1),np.array(a2),np.array(w),np.array(u),np.array(kind)
def check(a1,a2,w,u,kind):
    J=rref(np.array([w*f%P for f in polys(a1,a2,2)]+[u]))[0]
    if J.shape[0]!=7: return None,'J'
    Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
    if Kp.shape[0]!=13: return None,'K1'
    K2=rref(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))[0]
    if K2.shape[0]!=21: return None,'K2'
    if rank(np.vstack([K2,a1*K2%P,a2*K2%P]))!=21: return None,'M21'
    AnnJ=null(J)
    N=null(np.vstack([(AnnJ*a1)%P@J.T%P,(AnnJ*a2)%P@J.T%P]))
    if N.shape[0]!=3: return None,'N'
    Y=kind=='Y'
    if rank(Kp[:,Y])!=13: return None,'KZ'   # K' meets K^Z
    return (J,Kp,K2),'ok'
```

### czonly.py

SHA-256 `e0397bb6e7c260818e04d16a4066c3ba94042ee3b1bcdda6868103fa5204572b`

```python
# S4-21: solve (C') with c_1, c_2 supported on Z (Satz G), report dim of c-part
import numpy as np,sys,time
from la import *
from redgen import gen,check
seed=int(sys.argv[1]);tl=float(sys.argv[2]);rng=np.random.default_rng(seed)
stats={};t0=time.time()
while time.time()-t0<tl:
    mode=int(rng.integers(0,3))
    g=gen(rng,mode)
    if g is None: continue
    a1,a2,w,u,kind=g
    sp,msg=check(a1,a2,w,u,kind)
    if sp is None: stats[('bad',msg)]=stats.get(('bad',msg),0)+1; continue
    J,Kp,K2=sp
    Z=np.nonzero(kind=='Z')[0]; r=len(a1)
    Ann=null(Kp); nz=len(Z); nun=2*nz+7*13; eqs=[]
    for i,A in enumerate([a1,a2]):
        for k in range(7):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*nz:(i+1)*nz]=Ann[:,Z]*J[k][Z]%P
            blk[:,2*nz+13*k:2*nz+13*(k+1)]=(-((Ann*A)%P@Kp.T))%P
            eqs.append(blk)
    V=null(np.vstack(eqs))
    cr=rank(V[:,:2*nz]) if V.shape[0] else 0
    key=(mode,cr); stats[key]=stats.get(key,0)+1
for k in sorted(stats,key=str): print(k,stats[k])
```

### czspec.py

SHA-256 `f25f1612bf1db844e3bae2ea16d42c883b7ac3294dcef3a4a2ae005d2691b2b2`

```python
# S4-21: like czonly.py, but Z (8 points) placed specially: mode 0 on a conic, 1 on a line,
# 2 four Z points and four Y points on one line, 3 Z on conic and Y with 4 points on a line
import numpy as np,sys,time
from la import *
from redgen import check
seed=int(sys.argv[1]);tl=float(sys.argv[2]);rng=np.random.default_rng(seed)
def gen(mode):
    n2=int(rng.integers(0,7)); n1=13-2*n2
    nz1=int(rng.integers(0,min(3,n1)+1))
    if n2+(n1-nz1)<7: return None
    ny=n2+n1
    Y=rng.integers(0,P,(ny,2))
    if mode in (0,3):
        x=rng.integers(0,P,8); c=rng.integers(0,P,3); Zp=np.stack([x,(c[0]*x*x+c[1]*x+c[2])%P],1)
    elif mode==1:
        x=rng.integers(0,P,8); c=rng.integers(0,P,2); Zp=np.stack([x,(c[0]*x+c[1])%P],1)
    else:
        Zp=rng.integers(0,P,(8,2))
    if mode in (2,3):
        x=rng.integers(0,P,8); c=rng.integers(0,P,2); L=np.stack([x,(c[0]*x+c[1])%P],1)
        if mode==2: Zp[:4]=L[:4]
        k=min(4,ny); Y[:k]=L[4:4+k]
    pts=np.vstack([Zp,Y])
    if len(set(map(tuple,pts.tolist())))<len(pts): return None
    a1=[];a2=[];w=[];u=[];kind=[]
    for k in range(8):
        a1.append(pts[k,0]);a2.append(pts[k,1]);w.append(rng.integers(1,P));u.append(rng.integers(0,P));kind.append('Z')
    order=list(range(ny)); rng.shuffle(order)
    for idx,k0 in enumerate(order):
        k=8+k0
        if idx<n2:
            for _ in range(4):
                a1.append(pts[k,0]);a2.append(pts[k,1]);w.append(rng.integers(0,P));u.append(rng.integers(0,P));kind.append('Y')
        else:
            v=rng.integers(1,P,2); z1=(idx-n2)<nz1
            s=(0,1) if z1 else (1,int(rng.integers(0,P)) if rng.random()<0.6 else 0)
            for t in range(2):
                a1.append(pts[k,0]);a2.append(pts[k,1]);w.append(v[t]*s[0]%P);u.append(v[t]*s[1]%P);kind.append('Y')
    return np.array(a1),np.array(a2),np.array(w),np.array(u),np.array(kind)
stats={};t0=time.time()
while time.time()-t0<tl:
    mode=int(rng.integers(0,4)); g=gen(mode)
    if g is None: continue
    a1,a2,w,u,kind=g
    sp,msg=check(a1,a2,w,u,kind)
    if sp is None: stats[(mode,'bad',msg)]=stats.get((mode,'bad',msg),0)+1; continue
    J,Kp,K2=sp; Z=np.nonzero(kind=='Z')[0]
    Ann=null(Kp); nz=len(Z); nun=2*nz+7*13; eqs=[]
    for i,A in enumerate([a1,a2]):
        for k in range(7):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*nz:(i+1)*nz]=Ann[:,Z]*J[k][Z]%P
            blk[:,2*nz+13*k:2*nz+13*(k+1)]=(-((Ann*A)%P@Kp.T))%P
            eqs.append(blk)
    V=null(np.vstack(eqs)); cr=rank(V[:,:2*nz]) if V.shape[0] else 0
    stats[(mode,cr)]=stats.get((mode,cr),0)+1
for k in sorted(stats,key=str): print(k,stats[k])
```
