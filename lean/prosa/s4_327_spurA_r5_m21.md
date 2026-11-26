# S4-27: Der letzte Schritt im Unterfall (M21) bei e = 3 (Stufe 4, Runde 5, Spur A)

- Auftrag: S4-27, Protokoll 0.6, Stufe 4, Runde 5, Spur A. Rolle: Beweissucher. Darf den Unterfall in beide Richtungen angreifen.
- Datum: 26.11.2026. Zweig `claude/project-thread-xs00zi`. Beginn und Ende stehen in den Git-Zeitstempeln.
- **Status aller Aussagen dieser Datei: behauptet oder ausdrücklich vermutet.** Den Status setzt nur der Orchestrator. Die beiden Wörter, die das Protokoll dem Status geprüft vorbehält, verwende ich für keine eigene Aussage.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` (ganz), `STATUS.md` (Abschnitt Stufe 4 und Auftragstabelle), `versuche/README.md` und die Liste in `versuche/`, `lean/prosa/s4_327_spurA_r4_m21.md` (S4-21, ganz, mit Programmen), `lean/prosa/s4_327_spurA_r3_e3.md` (S4-14, Abschnitte 0 bis 8), `lean/prosa/s4_327_spurA_r2_bau.md` (S4-07, Abschnitte 0 bis 8). Von `lean/prosa/yang_n3.md` und `LOG.md` habe ich nur die Stellen gelesen, auf die S4-07, S4-14 und S4-21 verweisen; ich stütze mich auf keine Aussage daraus außer den in Abschnitt 2 genannten. Die in Runde 5 neu gemergte Datei zu S4-28 habe ich nicht gelesen.
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben, kein Lean.
- Offenlegung: Eingeblendet wurden mir der Index des Projektgedächtnisses und die Einzeleinträge `aussagen-abgleich-n3`, `lean-build-cloud` und `git-regeln` (Bridge-, Bau- und Git-Hinweise, kein Urteil zu R-327). Für die Mathematik habe ich sie nicht benutzt.

---

## 0. Ergebnis in Kürze

**Behauptet: Der Fall e = 3 ist ausgeschlossen.** In der Gestalt aus Satz G (S4-21-B (ii)) führen die Brent-Gleichungen (B) und (C) an **jedem einzelnen** Index z der 8 Rang-2-Produkte zu w(z) = 0 oder c(z) = 0. Satz G verlangt aber w(z) ≠ 0 und c(z) ≠ 0. Also gibt es kein Verfahren der Länge 34 für ⟨3,2,7⟩, das in irgendeiner Normalform e = 3 hat, soweit die Grundlagen in Abschnitt 2 tragen.

Das neue Werkzeug ist **Bedingung (B) mit i = 0** (b_0·p_k ∈ K′). Auf den Fasern der Rang-1-Produkte gilt nach Satz G K^{T_p} = M_p ⊕ b_0·M_p. Damit legt (B) die bisher freie Abbildung κ aus (C′) auf diesen Fasern vollständig fest: κ(j) = −B·j dort, wobei B ein fester, faserweise erklärter Operator ist, der nur von b_0 abhängt (Satz S4-27-B). Danach reichen drei Gleichungen an einem Punkt z und vier Polynome (1, L, L, L²) für den Widerspruch (Satz S4-27-C).

Abgrenzung: **Die Vermutung S4-21-V selbst (dass schon (C′) allein c = 0 auf Z erzwingt) zeige ich nicht.** Ich zeige dieselbe Folgerung c = 0 auf Z unter (C′) **und** (B). Für den Ausschluss von e = 3 genügt das, weil (B) für jedes Verfahren gilt. S4-21-V bleibt vermutet.

Kritische Nachrechnung von S4-21: Die Beweise von S4-21-A, S4-21-B (Satz G), S4-21-C (Satz K) und S4-21-D (Satz L) habe ich Schritt für Schritt nachgerechnet und keinen Fehler gefunden (Abschnitt 4). Mein Beweis braucht von S4-21 nur Lemma O, Lemma F und Satz G, nicht Satz K und nicht Satz L.

---

## 1. Aussagen im Wortlaut

Bezeichnungen wie in S4-07, Abschnitt 1, S4-14, Abschnitt 3, und S4-21, Abschnitt 3; Ergänzungen in Abschnitt 3 dieser Datei.

**Aussage S4-27-A (Nachrechnung von S4-21, behauptet).** In den Beweisen von S4-21-A (Lemma O), S4-21-B (Satz G mit Lemma F), S4-21-C (Satz K) und S4-21-D (Satz L) habe ich keinen Fehler gefunden. Die Anmerkungen in Abschnitt 4 betreffen nur Formulierungen.

**Aussage S4-27-B (Festlegung von κ auf Y, behauptet).** Es liege eine Normalform wie in S4-21-B (ii) vor. Für jede Faser T_p über einem a-Punkt p von Y sei M_p := e_p·K″ ⊆ K^{T_p}. Dann gilt K^{T_p} = M_p ⊕ b_0·M_p, und es gibt eindeutig bestimmte lineare Abbildungen B_p, N_p : M_p → M_p mit
 b_0²·m = b_0·(B_p m) − N_p m für alle m ∈ M_p.
Sei B (bzw. N) der Operator auf K″|_Y = ⊕_{p⊆Y} M_p, der auf M_p als B_p (bzw. N_p) wirkt. Dann gilt für jedes j ∈ J:
 (i) κ(j)|_Y = −B·(j|_Y),
 (ii) (b_0·π(j))|_Y = −N·(j|_Y).
B und N vertauschen mit der Multiplikation mit jedem Polynom g ∈ A.

**Aussage S4-27-C (lokaler Widerspruch, behauptet).** Es liege eine Normalform wie in S4-21-B (ii) vor. Dann gibt es keinen Index z ∈ Z mit w(z) ≠ 0 und (c_1(z), c_2(z)) ≠ (0, 0). Genauer: Für jedes z ∈ Z mit (c_1(z), c_2(z)) ≠ (0, 0) folgt aus (B) und (C) allein w(z) = 0.

**Aussage S4-27-D (Ausschluss von e = 3, behauptet, bedingt auf die Grundlagen in Abschnitt 2).** Es gibt kein Verfahren der Länge 34 für ⟨3,2,7⟩ über irgendeinem Körper F, das in irgendeiner Normalform e = 3 hat. Gleichwertig: Die Lücke L-21 aus S4-21 (und damit der Unterfall (M21) aus S4-14) ist geschlossen, ohne Vermutung S4-21-V zu benutzen.

**Aussage S4-27-E (Rechnung über GF(32003) und GF(10007), behauptet).** In 233 zufälligen zulässigen Lagen mit der Gestalt aus S4-21-B (ii) (Erzeuger `redgen.py` aus S4-21, unverändert) und zufälligem b_0 auf Y (verschieden innerhalb jeder Faser) gilt: (1) Die Bedingung „b_0·π(w) liegt auf jeder Faser von Y in M_p“ hat genau eine Lösung κ(w) ∈ K′, und diese erfüllt κ(w)|_Y = −B·(w|_Y) (S4-27-B). (2) An einem zufälligen z ∈ Z mit zufälligem c(z) ≠ 0 und zufälligem b_0(z) ist das lineare System aus (P_i), (Q_i), (Q_0) (Abschnitt 6) in den Unbekannten B, N (beliebige faserweise lineare Abbildungen, also mehr Freiheit als in S4-27-B) unlösbar. Gegenproben: mit c(z) = 0 und b_0(z) = 0 lösbar (49 von 49); ohne (Q_0) meist lösbar (69 von 70); ohne (Q_1), (Q_2) lösbar (97 von 97). Die Rechnung ist kein Beweis; sie bestätigt die Rechenschritte von S4-27-B und S4-27-C an Beispielen und zeigt, dass jede der drei Gleichungsgruppen gebraucht wird.

---

## 2. Worauf sich der Beweis stützt

Ohne eigene Prüfung übernommen (Status dort: behauptet):

- **Restfall R-327** (B-017 bis B-019): In jeder Normalform gilt dim N = 3, dim S = 1, rk L = 6, also K′ = J + a_1J + a_2J.
- **S4-07**, Abschnitte 1 bis 4.1: Umformulierung (A) bis (D), Zerlegung p_k = b_0·q_k + κ_k mit κ_k ∈ K′ und (C′), der Vektor w mit w·P_2 ⊆ J, im Fall e = 3: J = w·P_2 ⊕ ⟨u⟩ und K′ = w·P_3 ⊕ u·P_1. Benutzt werden davon nur: **w·P_2 ⊆ J, w·P_3 ⊆ K′, (B), (C) und (C′).** Die Herleitung von (B), (C), (C′) aus den Brent-Gleichungen habe ich nachgerechnet.
- **S4-14**, Satz R (B-026): Im Fall e = 3 ist K″ = A·w + A·u ein A-Modul der Dimension 21 und K^34 = K″ ⊕ b_0·K′. Den Beweis (Schritte 1 bis 6) habe ich nachgelesen; Satz R wird hier nur über Satz G benutzt.
- **S4-21**, Lemma O, Lemma F und Satz G (S4-21-A, S4-21-B). Diese Beweise habe ich nachgerechnet (Abschnitt 4). Benutzt werden aus S4-21-B (ii) genau: (G1) c_1 = c_2 = 0 auf Y; (G2) |T_p| = 2·d_p für jede Faser über einem a-Punkt von Y; (G3) K″ = K′ ⊕ K^Z, insbesondere K′ ∩ K^Z = 0; (G4) jedes z ∈ Z ist ein eigener a-Punkt mit genau einem Index, w(z) ≠ 0 und (c_1(z), c_2(z)) ≠ (0, 0).
- **`yang_n3.md`**: R1 (Körpererweiterung), R2, R3 (Basiswechsel), Lemma A (starke Normalisierung), so wie S4-07, Abschnitt 1.1, und S4-21, Abschnitt 2, sie benutzen.

Nicht benutzt: Satz K, Satz L, die Vermutungen S4-14-V1, S4-14-V2, S4-21-V, der Vektor u (außer über Satz G), Θ (außer über Satz G), (D) (außer über Satz G und Satz R).

**Körper.** Die Schritte in Abschnitt 5 und 6 sind lineare Algebra über dem algebraischen Abschluss K, ohne Division durch eine ganze Zahl. Sie gelten in jeder Charakteristik. Damit gilt S4-27-D für Verfahren über jedem Körper F, soweit die übernommenen Aussagen (Restfall, S4-07, Satz R, Satz G) für jeden Körper gelten.

---

## 3. Bezeichnungen

- Vektoren in K^34 sind Funktionen auf den Indizes 1, …, 34, „·“ ist das komponentenweise Produkt. a_0 = 1, a_1, a_2, b_0, b_1, b_2 sind die Spalten der α_t, c_i := b_i − a_i·b_0 (i = 1, 2). Für z ∈ Z schreibe ich z = (z_1, z_2) := (a_1(z), a_2(z)) für den a-Punkt.
- A = K[a_1, a_2], P_d = Polynome vom Grad ≤ d. Ein Polynom g wirkt auf K^34 durch Multiplikation mit dem Vektor (g(a_1(t), a_2(t)))_t.
- J = span(q_1, …, q_7), π : J → K^34 mit π(q_k) = p_k, κ(j) := π(j) − b_0·j ∈ K′ (S4-07, Abschnitt 2).
- Y, Z, T_p, e_p, M_p := e_p·K″, d_p := dim M_p wie in S4-21, Abschnitt 3. Für x ∈ K^34 ist x|_Y die Einschränkung auf die Indizes in Y; K″|_Y = ⊕_{p⊆Y} M_p.
- **Fortsetzungsabbildung.** Nach (G3) ist die Einschränkung K′ → K″|_Y injektiv (Kern K′ ∩ K^Z = 0), und beide Räume haben Dimension 13 (dim K′ = 13, dim K″|_Y = Σ_{p⊆Y} d_p = 21 − 8 = 13). Sei E : K″|_Y → K′ die Umkehrung und für z ∈ Z
 φ_z : K″|_Y → K, φ_z(y) := E(y)(z).
 Dann gilt: **Für jedes x ∈ K′ ist x(z) = φ_z(x|_Y)** (denn E(x|_Y) = x). Mehr wird von φ_z nicht gebraucht.

---

## 4. Nachrechnung von S4-21 (Aussage S4-27-A)

Ich habe die Beweise in S4-21, Abschnitte 4 bis 7, Zeile für Zeile nachgerechnet. Ergebnis je Teil:

- **Lemma O.** Die Offenheit von (SN1) und (SN2) und die Darstellung e + 3 = rk[Ξ³; Γ] − 54 stimmen: ker Ξ hat Dimension 3 (N), ker Ξ³ Dimension 9, Γ(ker Ξ³) = w·P_1 + a_1·w·P_1 + a_2·w·P_1 = w·P_2. Die Menge {e = 3} ist eine Rangbedingung, also offen. Kein Fehler.
- **Lemma F.** Beide Richtungen stimmen; auch der Fall, dass genau eine der beiden Formen Rang 2 hat, ist durch die Vertauschung der Rollen gedeckt. G_gen ist offen und dicht, weil jede echte Menge V_{tt′} in der Nullstellenmenge eines vom Nullpolynom verschiedenen 2×2-Minors liegt. Kein Fehler.
- **Satz G.** 5.2: Fasern bestehen nur aus Paaren der Arten (I) oder (II); eine Faser mit einer Rang-2- und einer Rang-1-Form ist dadurch ausgeschlossen, weil (I) gleichen Rang verlangt und (II) Rang 1. 5.3: a′(t) = Sᵀα_tpᵀ ist richtig (α′_t(e_{i0}) = u_iᵀα_tpᵀ mit der ersten Zeile p von T). 5.4: Aus K^34 = K″ + b_0K′ und e_pK′ ⊆ M_p folgt K^{T_p} = M_p + b_0M_p; auf Klasse I ist b_0 konstant. Die Summenrechnung 13 = Σ(|T_p| − d_p) ≤ |Y|/2 stimmt. 5.5: K″ ∩ K^Z = ⊕_{p⊆Z} M_p, weil K″ = ⊕_p e_pK″; mit dim Θ(J³_0) = 8 (D′) folgen |Z| = 8, Gleichheit überall und Θ(J³_0) = K^Z. 5.6: c_i ist auf Fasern konstant, also ein Polynom auf den a-Punkten; mit ker L ⊆ (w·P_2)² liegt Θ(J³_0) in A·w, und e_pK^Z ⊆ K·e_pw gibt |T_p| = 1 und w ≠ 0 auf Z. 5.7: Rang 2 heißt c(z) ≠ 0; K′ ∩ K^Z = 0 heißt Unabhängigkeit der C_t, t ∈ Z. Kein Fehler.
- **Satz K.** Schritt 1 (mit (C′) und (B)), Schritt 2 (Eindeutigkeit der Darstellung in w·P_4 ⊕ u·P_2), Schritt 3 (Injektivität von Γ, weil c(z) ≠ 0 und w(z) ≠ 0) und Schritt 4 stimmen. Kein Fehler.
- **Satz L.** Schritt 1 braucht die Surjektivität von Γ, also dim 𝒦 = 6; das ist vorausgesetzt. Schritte 2 bis 4 stimmen; in Schritt 4 ist F = 1 für m = 0 zulässig. Kein Fehler.

Anmerkungen ohne Einfluss auf die Gültigkeit: (a) In S4-21-B (i) ist „zwischen 7 und 13 Klassen“ die Folge aus |T_p| = 2d_p ∈ {2, 4} und Σ d_p = 13; das steht in 5.8 richtig. (b) Satz L (i) heißt in der Sprache von Abschnitt 3 dieser Datei: φ_z verschwindet auf allen M_p mit p ∉ ℓ_z. Das benutze ich nicht.

---

## 5. Beweis von S4-27-B (Festlegung von κ auf Y)

Sei p ein a-Punkt von Y. Nach Satz G (ii) und S4-21, 5.4, ist K^{T_p} = M_p + b_0·e_pK′ ⊆ M_p + b_0·M_p (denn e_pK′ ⊆ e_pK″ = M_p), und |T_p| = 2d_p (G2). Also hat M_p + b_0·M_p die Dimension 2d_p, die Summe ist direkt, und die Multiplikation mit b_0 bildet M_p injektiv auf b_0·M_p ab:

 **K^{T_p} = b_0·M_p ⊕ M_p.**

Für m ∈ M_p liegt b_0²·m in K^{T_p}, hat also eine eindeutige Zerlegung b_0²·m = b_0·m′ + m″ mit m′, m″ ∈ M_p. Setze B_pm := m′ und N_pm := −m″. Beide Abbildungen sind linear (Eindeutigkeit der Zerlegung und Injektivität von b_0· auf M_p).

Sei j ∈ J. Dann j ∈ K′ ⊆ K″ und κ(j) ∈ K′ ⊆ K″, also j_p := e_p·j ∈ M_p und κ_p := e_p·κ(j) ∈ M_p. Nach (B) mit i = 0 ist b_0·p_k ∈ K′ für alle k, also b_0·π(j) ∈ K′ ⊆ K″ und e_p·(b_0·π(j)) ∈ M_p. Mit π(j) = b_0·j + κ(j):

 e_p·(b_0·π(j)) = b_0²·j_p + b_0·κ_p = b_0·(B_pj_p + κ_p) − N_pj_p.

Der erste Summand liegt in b_0·M_p, der zweite in M_p, die Summe in M_p. Wegen b_0·M_p ∩ M_p = 0 ist b_0·(B_pj_p + κ_p) = 0, und wegen der Injektivität **κ_p = −B_pj_p**. Dann ist e_p·(b_0·π(j)) = −N_pj_p. Das gilt für jede Faser von Y; das sind (i) und (ii).

Vertauschbarkeit: Ein Polynom g wirkt auf M_p als der Skalar g(p), B_p und N_p sind linear. ∎

**Bemerkung.** (C′) allein bestimmt κ nur bis auf Abbildungen mit Werten in J (S4-21, Satz K, Schritt 3). Mit S4-27-B ist κ eindeutig: κ(j) = E(−B·(j|_Y)). Das ist der Unterschied zu allen bisherigen Rechnungen, die (B) und b_0 nicht benutzt haben (S4-07, Abschnitt 7.3; S4-14, Abschnitt 8, Ansatz 2; S4-21, Abschnitt 9).

---

## 6. Beweis von S4-27-C (lokaler Widerspruch)

Sei z ∈ Z mit c(z) := (c_1(z), c_2(z)) ≠ (0, 0). Kurz: φ := φ_z, β_z := b_0(z), und für j ∈ J sei j_Y := j|_Y. Nach Abschnitt 3 ist j(z) = φ(j_Y) und κ(j)(z) = φ(κ(j)|_Y) = −φ(B·j_Y), weil j und κ(j) in K′ liegen.

**Drei Gleichungen.** Für alle j ∈ J und i = 1, 2:

**(P_i) c_i(z)·φ(j_Y) = φ((a_i − z_i)·B·j_Y).**
Herleitung: Nach (C′) ist x := c_i·j − a_i·κ(j) ∈ K′, also x(z) = φ(x|_Y). Auf Y ist c_i = 0 (G1), also x|_Y = −a_i·κ(j)|_Y = a_i·B·j_Y. An z ist x(z) = c_i(z)j(z) − z_i·κ(j)(z) = c_i(z)φ(j_Y) + z_iφ(B·j_Y). Gleichsetzen gibt (P_i).

**(Q_0) φ((β_z² − β_z·B + N)·j_Y) = 0.**
Herleitung: Nach (B) mit i = 0 ist x := b_0·π(j) ∈ K′, also x(z) = φ(x|_Y) = −φ(N·j_Y) nach S4-27-B (ii). An z ist x(z) = β_z·π(j)(z) = β_z·(β_z·j(z) + κ(j)(z)) = β_z·φ((β_z − B)·j_Y). Also β_z·φ((β_z − B)j_Y) + φ(N j_Y) = 0.

**(Q_i) c_i(z)·φ((β_z − B)·j_Y) + φ((a_i − z_i)·N·j_Y) = 0.**
Herleitung: Nach (B) mit i ∈ {1, 2} ist x := b_i·π(j) ∈ K′. Es ist b_i = c_i + a_i·b_0, also x = c_i·π(j) + a_i·(b_0·π(j)). Auf Y ist c_i = 0, also x|_Y = a_i·(b_0π(j))|_Y = −a_i·N·j_Y. An z ist x(z) = (c_i(z) + z_iβ_z)·π(j)(z) mit π(j)(z) = φ((β_z − B)j_Y). Aus x(z) = φ(x|_Y) folgt c_i(z)·φ((β_z − B)j_Y) + z_i·β_zφ((β_z − B)j_Y) = −φ(a_iNj_Y). Nach (Q_0) ist β_zφ((β_z − B)j_Y) = −φ(N j_Y); einsetzen gibt (Q_i).

**Eine Richtung wählen.** Wähle e = (e_1, e_2) ∈ K² mit e_1c_1(z) + e_2c_2(z) = 1 (möglich, weil c(z) ≠ 0) und setze
 L := e_1·(a_1 − z_1) + e_2·(a_2 − z_2) ∈ P_1, also L(z) = 0.
Die Kombination e_1·(P_1) + e_2·(P_2) und e_1·(Q_1) + e_2·(Q_2) ergibt für alle j ∈ J:
 (P) φ(j_Y) = φ(L·B·j_Y),
 (Q) φ((β_z − B)·j_Y) + φ(L·N·j_Y) = 0,
 (Q_0) β_z²·φ(j_Y) − β_z·φ(B·j_Y) + φ(N·j_Y) = 0.

**Einsetzen von j = w·G.** Für G ∈ P_2 ist w·G ∈ J (w·P_2 ⊆ J), und (w·G)|_Y = G·ω mit ω := w|_Y. Für Polynome g setze
 m(g) := φ(g·ω), β(g) := φ(B·(g·ω)), n(g) := φ(N·(g·ω)).
Für deg g ≤ 3 ist w·g ∈ K′ (w·P_3 ⊆ K′), also **m(g) = (w·g)(z) = w(z)·g(z)**. Weil B und N mit der Multiplikation mit Polynomen vertauschen, wird aus (P), (Q), (Q_0) mit j = w·G:
 (P′) β(L·G) = w(z)·G(z),
 (Q′) β_z·w(z)·G(z) − β(G) + n(L·G) = 0,
 (Q_0′) β_z²·w(z)·G(z) − β_z·β(G) + n(G) = 0,
jeweils für alle G ∈ P_2.

**Vier Werte.**
1. (P′) mit G = L: β(L²) = w(z)·L(z) = 0.
2. (Q_0′) mit G = L² (Grad 2): β_z²·w(z)·L(z)² − β_z·β(L²) + n(L²) = 0, also mit Schritt 1 **n(L²) = 0**.
3. (Q′) mit G = L: β_z·w(z)·L(z) − β(L) + n(L²) = 0, also **β(L) = n(L²) = 0**.
4. (P′) mit G = 1: **β(L) = w(z)**.

Aus 3 und 4 folgt w(z) = 0. ∎

**Bemerkung.** Benutzt werden von J nur die Elemente w, w·L, w·L² (also j = w·G für G ∈ {1, L, L²}), von K′ nur w·P_2 ⊆ w·P_3 und die Fortsetzbarkeit von K′ nach z. Weder u noch Θ noch die Lage der anderen sieben Punkte von Z kommen vor. Jede der drei Gleichungsgruppen wird gebraucht: ohne (Q_0) fehlt Schritt 2, ohne (Q_i) Schritt 3, ohne (P_i) die Schritte 1 und 4 (Gegenproben in Abschnitt 9).

---

## 7. Beweis von S4-27-D (Ausschluss von e = 3)

Es gebe ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F und eine Normalform mit e = 3. Nach S4-21-B (Satz G, mit Lemma O und Lemma F) gibt es eine Normalform, in der die Gestalt (ii) gilt; dort sind (G1) bis (G4) erfüllt. Die Gleichungen (B) und (C) gelten in jeder Normalform, weil sie aus der Verfahrensidentität folgen (S4-07, Abschnitt 2; die Skalierung ändert die β_t nicht und ersetzt C_t durch a_0(t)·C_t, also bleiben (A) bis (D) mit K′ = ker W gültig). Wähle ein z ∈ Z. Nach (G4) ist w(z) ≠ 0 und c(z) ≠ (0, 0), im Widerspruch zu S4-27-C. ∎

Folge für die Lückenliste: L-2′ (S4-14) und L-21 (S4-21) sind durch S4-27-C ersetzt. Die Vermutung S4-21-V wird nicht mehr gebraucht und bleibt als eigene Aussage vermutet. Den Fall e = 2 behandle ich nicht (nicht mein Auftrag).

---

## 8. Abgrenzung und gescheiterte Ansätze (mit Grund)

### 8.1 Abgrenzung zu S4-21, Abschnitt 8.2

- Ansatz 1 dort (Zählungen durch Einsetzen): nicht benutzt.
- Ansatz 2 dort (Funktionale ζ_z, Reduktion τ): Abschnitt 6 benutzt keine Reduktion vom Grad 5 auf Grad 4 und keine Aussage über τ. Neu ist, dass (B) die Abbildung κ festlegt; danach braucht man nur Werte von K′-Elementen (Grad ≤ 3), keine von K″.
- Ansatz 3 dort (Bewegung der Punkte mit p): nicht benutzt.
- Ansatz 4 dort (Klassifikation der Kegelschnittlagen): überflüssig, weil S4-27-C an einem einzelnen Punkt arbeitet und keine Annahme über die Lage von Z macht.
- Ansatz 5 dort (untere Schranke für den Rang der β_t auf Z): nicht benutzt.

### 8.2 Eigene Ansätze, die nicht zum Ziel führten

1. **(C′) allein in der Sprache der Fortsetzungsfunktionale.** Mit φ_z aus Abschnitt 3 ist (C′) gleichwertig zu: Es gibt eine lineare Abbildung ψ : J|_Y → K″|_Y mit c_i(z)·φ_z(j) = φ_z((a_i − z_i)·ψ(j)) für alle z, i, j. Ohne Festlegung von ψ ist das ein überbestimmtes System (112 Gleichungen, 16 + 42 Unbekannte modulo Eichung), aber ich habe keinen Widerspruch herleiten können: Die Bedingungen an φ_z sind „Fortsetzbarkeit bis Grad 3“, und ψ darf in die Richtungen ausweichen, die (a_i − z_i)·φ_z nicht sieht. Gescheitert an: derselben Freiheit wie in S4-21, Abschnitt 8.2, Nr. 2. Das ist der Grund, warum ich auf (B) ausgewichen bin.
2. **Entartung in der Wahl der ersten Zeile p von T.** Idee: Der a-Punkt z(p) = [Sᵀα_zpᵀ] durchläuft die ganze Gerade ℓ_z und trifft dabei die a-Punkte von Y auf ℓ_z (nach Satz L mindestens 4). Trifft er einen Punkt mit d = 2, entstünde eine Faser mit 5 Indizes und d ≤ 2, im Widerspruch zu |T_p| ≤ 2d_p. Gescheitert an: An diesem besonderen p ist nicht gesichert, dass (SN1), (SN2) und e = 3 gelten (e = 3 ist nur offen, nicht abgeschlossen), und bei d = 1 entsteht ohnehin kein Widerspruch.
3. **Linienweise Rechnung mit festgelegtem κ.** Im Fall dim 𝒦 = 6 ist φ_z nach Satz L auf ℓ_z ∩ Y getragen, und (P), (Q), (Q_0) werden zu Momentenbedingungen auf der Geraden. Das führt ebenfalls zum Widerspruch, braucht aber Satz L. Überholt durch Abschnitt 6, der ohne Satz L und ohne Fallunterscheidung nach dim 𝒦 auskommt.

---

## 9. Rechnung (Aussage S4-27-E)

Programm `hcheck.py` (Anhang), dazu `la.py` und `redgen.py` aus S4-21 **unverändert** (SHA-256 wie dort: `42537d06…f51` und `3d794465…912f`). Je Lage: Lage mit der Gestalt aus S4-21-B (ii) erzeugen und prüfen (`check` aus `redgen.py`), b_0 auf Y zufällig und innerhalb jeder Faser verschieden, B_p und N_p wie in Abschnitt 5 berechnen.

- Prüfung 1 (S4-27-B): Das lineare System „κ ∈ K′ und e_p·(b_0²·w + b_0·κ) ∈ M_p für jede Faser von Y“ hat genau eine Lösung, und diese erfüllt κ|_Y = −B·(w|_Y).
- Prüfung 2 (S4-27-C): An einem zufälligen z ∈ Z mit zufälligem c(z) ≠ 0 und zufälligem b_0(z) wird das System (P_i), (Q_i), (Q_0) für j in einer Basis von J aufgestellt, mit **beliebigen** faserweisen linearen Abbildungen B, N als Unbekannten (nicht nur den aus b_0 berechneten). Ausgegeben wird, ob es lösbar ist.

| Lauf | Primzahl | Modus | Lagen | Prüfung 1 | Prüfung 2: lösbar |
|---|---|---|---|---|---|
| `hcheck.py 1 30` | 32003 | alle Gleichungen | 37 | 37 ja | 0 |
| `hcheck.py 11 120` | 32003 | alle Gleichungen | 155 | 155 ja | 0 |
| `PRIME=10007 hcheck.py 12 60` | 10007 | alle Gleichungen | 78 | 78 ja | 0 |
| `MODE=c0 hcheck.py 13 40` | 32003 | c(z) = 0, b_0(z) = 0 (Gegenprobe) | 49 | 49 ja | 49 |
| `MODE=noQ0 hcheck.py 14 40` | 32003 | ohne (Q_0) | 70 | 70 ja | 69 |
| `MODE=noQ hcheck.py 15 40` | 32003 | ohne (Q_1), (Q_2) | 97 | 97 ja | 97 |

Zusätzlich liefen vor Block 1 drei kurze Probeläufe (`hcheck.py 2 15` in den Modi c0, noQ0, noQ) mit demselben Bild (19 von 19, 26 von 27, 37 von 39 lösbar). Ausgaben wörtlich (Tupel = Prüfung 1 eindeutig, Prüfung 1 stimmt, Prüfung 2 lösbar):

```
hcheck.py 1 30:                  (True, True, False) 37
hcheck.py 11 120:                (True, True, False) 155
PRIME=10007 hcheck.py 12 60:     (True, True, False) 78
MODE=c0 hcheck.py 13 40:         (True, True, True) 49
MODE=noQ0 hcheck.py 14 40:       (True, True, False) 1 / (True, True, True) 69
MODE=noQ hcheck.py 15 40:        (True, True, True) 97
```

Die Rechnung ist kein Beweis von S4-27-C. Sie zeigt an Beispielen, dass die Herleitungen in Abschnitt 5 und 6 rechnerisch stimmen, und dass jede der drei Gleichungsgruppen gebraucht wird (ohne eine von ihnen ist das System meist lösbar).

**Rechenblöcke** (ein Kern, Python-Prozesse nacheinander, Zeiten UTC):

| Block | Zeit | Inhalt | Commit danach |
|---|---|---|---|
| 1 | etwa 12:45 bis 12:54:48 | Probeläufe, dann die sechs Läufe der Tabelle | erster Commit dieser Datei |

---

## 10. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Rechenblöcke: 1 (Abschnitt 9), unter 30 Minuten, ein Kern.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs.

---

## Anhang: hcheck.py (Python 3, numpy, exakt modulo einer Primzahl, keine Gleitkommazahlen)

Eigene Implementierung. Braucht `la.py` und `redgen.py` aus S4-21 im selben Verzeichnis. Aufruf: `python3 hcheck.py <Startwert> <Sekunden>`, Umgebungsvariablen `PRIME` (Standard 32003) und `MODE` (`main`, `c0`, `noQ0`, `noQ`).

SHA-256 `638cd6ec9f0049d9d8659ccb2ae2874d38d26cdc6939ac7b49374702107ef101`

```python
# S4-27: numerical check of the pinning (Schritt 1) and of the local contradiction (Schritt 3)
# exact arithmetic mod prime P (la.py from S4-21); usage: python3 hcheck.py <seed> <seconds>
import numpy as np, sys, time
from la import *
from redgen import gen, check
seed=int(sys.argv[1]); tl=float(sys.argv[2]); rng=np.random.default_rng(seed)
def solve(A,b):
    # one solution x of x@A = b (A: r x n), or None
    A=np.atleast_2d(A)%P; M=np.vstack([A.T, ]).astype(np.int64)
    aug=np.hstack([A.T%P, (np.array(b)%P)[:,None]])
    if rank(aug)!=rank(A.T): return None
    N=null(aug)  # vectors (x,t) with A.T x + b t = 0
    for v in N:
        if v[-1]%P:
            return (-v[:-1]*pow(int(v[-1]),P-2,P))%P
    return None
stats={}; t0=time.time()
while time.time()-t0<tl:
    g=gen(rng,int(rng.integers(0,3)))
    if g is None: continue
    a1,a2,w,u,kind=g
    sp,msg=check(a1,a2,w,u,kind)
    if sp is None: continue
    J,Kp,K2=sp; n=len(a1)
    Y=np.nonzero(kind=='Y')[0]; Z=np.nonzero(kind=='Z')[0]
    pts={}
    for t in Y: pts.setdefault((int(a1[t]),int(a2[t])),[]).append(t)
    fib=list(pts.values())
    Mb=[]   # basis of M_p (rows, length |T_p|)
    for T in fib:
        R=rref(K2[:,T])[0]; Mb.append(R)
    # random b0 on Y, distinct inside fibres
    b0=np.zeros(n,dtype=np.int64)
    for T in fib: b0[T]=rng.choice(np.arange(1,P),len(T),replace=False)
    ok=True; Bm=[]; Nm=[]
    for T,R in zip(fib,Mb):
        d=R.shape[0]; bb=b0[T]
        S=np.vstack([R, R*bb%P])          # basis of M + b0 M
        if rank(S)!=len(T): ok=False; break
        Bp=np.zeros((d,d),dtype=np.int64); Np=np.zeros((d,d),dtype=np.int64)
        for r in range(d):
            x=solve(S, R[r]*bb%P*bb%P)    # b0^2 m = sum x_k S_k = b0 (B m) - N m
            Np[r]=(-x[:d])%P; Bp[r]=x[d:]
        Bm.append(Bp); Nm.append(Np)
    if not ok: stats['skip']=stats.get('skip',0)+1; continue
    def coords(v):   # coordinates of v|_T_p in basis R_p, per fibre
        return [solve(R, v[T]) for T,R in zip(fib,Mb)]
    def apply(Ops,v,scal=None):  # fibrewise operator on v (v in K''), result as full vector on Y
        out=np.zeros(n,dtype=np.int64)
        for T,R,O,x in zip(fib,Mb,Ops,coords(v)):
            y=x@O%P@R%P
            if scal is not None: y=y*scal(T)%P
            out[T]=y
        return out
    # --- check 1: pinning. kappa in K' with b0^2 j + b0 kappa in M_p on every Y fibre
    j=w.copy()
    # unknown coefficients alpha (13) with kappa = alpha@Kp ; condition: (b0^2 j + b0 kappa)|_T in rowspace R
    eqs=[];rhs=[]
    for T,R in zip(fib,Mb):
        An=null(R)   # annihilator of M_p in K^T
        if An.shape[0]==0: continue
        eqs.append((An@((Kp[:,T]*b0[T]%P).T)%P)); rhs.append((-(An@(j[T]*b0[T]%P*b0[T]%P)))%P)
    E=np.vstack(eqs); r=np.concatenate(rhs)
    aug=np.hstack([E,r[:,None]])
    Nsol=null(aug)
    sols=[v for v in Nsol if v[-1]%P]
    pin_unique = (rank(E)==13) and len(sols)>0
    if sols:
        v=sols[0]; alpha=(-v[:-1]*pow(int(v[-1]),P-2,P))%P; kap=alpha@Kp%P
        Bj=apply(Bm,j)
        pin_ok=bool(np.all((kap[Y]+Bj[Y])%P==0))
    else: pin_ok=False
    # --- check 2: local system at one z: unknown B,N (fibrewise, arbitrary), given c(z)!=0, b0(z)
    KY=Kp[:,Y]
    z=Z[int(rng.integers(0,8))]
    def phi(v):  # extrapolation of v|_Y (v in K''|_Y) to index z via K'
        al=solve(KY,v[Y]); return int(al@Kp[:,z]%P)
    import os
    MODE=os.environ.get('MODE','main')
    c=rng.integers(0,P,2)
    if not c.any(): c[0]=1
    bz=int(rng.integers(0,P))
    if MODE=='c0': c=np.zeros(2,dtype=np.int64); bz=0
    dims=[R.shape[0] for R in Mb]; offB=np.cumsum([0]+[d*d for d in dims]); nB=offB[-1]
    rows=[];rr=[]
    Jb=list(J)
    for jj in Jb:
        x=coords(jj)
        # linear functional of an op-family O (unknown entries) applied to jj, times scalar function s on fibres, then phi
        def lin(sfun):
            vec=np.zeros(nB,dtype=np.int64)
            for k,(T,R,xx) in enumerate(zip(fib,Mb,x)):
                d=R.shape[0]
                for a in range(d):
                    for b in range(d):
                        y=np.zeros(n,dtype=np.int64); y[T]=xx[a]*R[b]%P*sfun(T)%P   # E_ab: (x O)_b gets x_a O_ab
                        vec[offB[k]+a*d+b]=phi(y)
            return vec
        one=lambda T: np.ones(len(T),dtype=np.int64)
        for i,A in enumerate([a1,a2]):
            zi=int(A[z]); s=lambda T,A=A,zi=zi: (A[T]-zi)%P
            # (P_i): phi((a_i-z_i) B j) = c_i phi(j)
            rows.append(np.concatenate([lin(s),np.zeros(nB,dtype=np.int64)])); rr.append(c[i]*phi(jj)%P)
            # (Q_i): c_i phi((bz - B) j) + phi((a_i-z_i) N j) = 0
            if MODE!="noQ": rows.append(np.concatenate([(-c[i]*lin(one))%P, lin(s)])); rr.append((-c[i]*bz%P*phi(jj))%P)
        # (Q_0): phi((bz^2 - bz B + N) j) = 0
        if MODE!='noQ0':
            rows.append(np.concatenate([(-bz*lin(one))%P, lin(one)])); rr.append((-bz*bz%P*phi(jj))%P)
    M=np.array(rows)%P; rv=np.array(rr)%P
    consistent = rank(np.hstack([M,rv[:,None]]))==rank(M)
    key=(pin_unique,pin_ok,consistent)
    stats[key]=stats.get(key,0)+1
for k in sorted(stats,key=str): print(k,stats[k])
```
