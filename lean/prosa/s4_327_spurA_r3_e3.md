# S4-14: Der Fall e = 3 ohne (INJ5) (Stufe 4, Runde 3, Spur A)

- Auftrag: S4-14, Protokoll 0.6, Stufe 4, Runde 3, Spur A. Rolle: Beweissucher. Darf den Fall in beide Richtungen angreifen.
- Datum: 26.11.2026. Zweig `claude/project-thread-42ulqt`. Beginn und Ende stehen in den Git-Zeitstempeln.
- **Status aller Aussagen dieser Datei: behauptet oder ausdrücklich vermutet.** Den Status setzt nur der Orchestrator. Die beiden Wörter, die das Protokoll dem Status geprüft vorbehält, verwende ich nicht für eigene Aussagen.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md`, `STATUS.md` (Anfang), `LOG.md` (Stufe 4), `versuche/README.md`, `lean/prosa/s4_327_spurA_r2_bau.md` (S4-07, ganz), `lean/prosa/s4_327_spurA_r2_ausschluss.md` (S4-06, Abschnitte 0 bis 2.1). Von `versuche/s4-blind-r2.md`, `versuche/s4-spurB-r2.md` und `lean/prosa/yang_n3.md` habe ich nur die Zusammenfassungen im Logbuch gelesen; ich stütze mich auf keine Aussage daraus außer den unten in Abschnitt 2 genannten.
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben, kein Lean.
- Offenlegung: Eingeblendet wurden mir der Index des Projektgedächtnisses und die Einzeleinträge `aussagen-abgleich-n3`, `git-regeln` und `lean-build-cloud` (Bridge-, Git- und Lean-Bauhinweise, kein Urteil zu R-327). Für die Mathematik habe ich sie nicht benutzt.

---

## 0. Ergebnis in Kürze

**Der Fall e = 3 ist nicht vollständig ausgeschlossen.** Er ist aber auf einen engen, genau beschriebenen Unterfall zurückgeführt, und die Annahme (INJ5) ist dafür nicht mehr nötig.

1. **Satz R (behauptet, Beweis in Abschnitt 4, über jedem Körper im Rahmen der Normalform):** Im Fall e = 3 folgt aus den Brent-Gleichungen (A), (C), (D) allein, ohne (INJ5) und ohne (B): Der 21-dimensionale Raum K″ ist unter der Multiplikation mit a_1 und a_2 abgeschlossen. Gleichwertig: Der von w und u erzeugte Modul M = A·w + A·u hat Dimension genau 21, und (INJ5) ist in jedem Grad-5-Paar verletzt.
2. **Folgerung:** Der bedingte Ausschluss S4-07-D ist ein Spezialfall von Satz R. Der Fall e = 3 ist für jede Lage ausgeschlossen, in der dim(w·P_5 + u·P_3) > 21 ist. Offen bleibt nur der **Unterfall (M21): dim(w·P_5 + u·P_3) = 21.**
3. **Rechnung, Gegenrichtung:** Die Vermutung S4-07-V trifft in ihrem Wortlaut („(C) hat nur die trivialen Lösungen“, Beleg dort: dim V_C = 57) nicht zu. Es gibt zulässige Lagen mit e = 3, in denen (C′) nicht triviale Lösungen hat (dim V_C = 59 bis 65). In allen gefundenen Fällen sitzen die zusätzlichen Lösungen außerhalb des Trägers von w, und (D′) scheitert trotzdem (Rang von Θ gleich 0 statt 8). Ein Verfahren entsteht daraus nicht.
4. **Lücke:** Der Unterfall (M21) ist nicht geschlossen. Ich formuliere ihn als Starrheitsaussage (Vermutung S4-14-V2, Abschnitt 6.3), die in rund 35 000 gerechneten Lagen und Moduln ausnahmslos gilt, aber nicht aus Dimensionsgründen erzwungen ist. Abschnitt 8 nennt, woran die Beweisversuche hängen.

---

## 1. Aussagen im Wortlaut

Bezeichnungen wie in S4-07, Abschnitt 1 (wiederholt in Abschnitt 3 dieser Datei). „Lage im Fall e = 3“ heißt: eine Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ im Restfall R-327, mit a_0 = (1, …, 1) und dim(w·P_2) = 6, wobei w wie in S4-07, Abschnitt 3.1, gewählt ist und J = w·P_2 ⊕ ⟨u⟩.

**Aussage S4-14-A (Satz R, behauptet).** In jeder Lage im Fall e = 3 gilt a_1·K″ ⊆ K″ und a_2·K″ ⊆ K″. Gleichwertig: A·w + A·u = K″, also dim(A·w + A·u) = 21, und w·P_5 + u·P_3 = w·P_4 ⊕ u·P_2. Benutzt werden nur (A), (C), (D), die Voraussetzungen (V1) bis (V4) aus Abschnitt 2 und dim(w·P_2) = 6. Bedingung (B) und (INJ5) werden nicht benutzt.

**Aussage S4-14-B (Folgerungen, behauptet).**
 (i) Aus (INJ5) folgt dim(w·P_5 + u·P_3) = 31 > 21. Unter (INJ5) gibt es also im Fall e = 3 kein Verfahren der Länge 34 (das ist S4-07-D, hier mit einem anderen Beweis).
 (ii) Allgemeiner: Gibt es im Fall e = 3 ein Polynompaar (F, G) mit deg F ≤ 5, deg G ≤ 3, für das w·F + u·G nicht in w·P_4 + u·P_2 liegt, dann gibt es kein Verfahren der Länge 34 in dieser Lage.
 (iii) Ein Verfahren der Länge 34 im Fall e = 3 erfüllt also (M21): dim(A·w + A·u) = 21.

**Aussage S4-14-C (Gestalt im Unterfall (M21), behauptet).** Sei eine Lage im Fall e = 3 mit (M21) gegeben. Seien Π die verschiedenen a-Punkte, T_p ⊆ {1, …, 34} die Indizes über p ∈ Π, M_p := span(w|_{T_p}, u|_{T_p}) ⊆ K^{T_p} und d_p := dim M_p. Dann gilt:
 (i) M := A·w + A·u = ⊕_p M_p = K″, Σ_p d_p = 21, und K^34 = M ⊕ b_0·K′.
 (ii) |T_p| ≤ 2·d_p für jedes p, und Σ_p (2·d_p − |T_p|) = 8.
 (iii) N_0 := ⊕_p {m ∈ M_p : b_0·m ∈ M_p} ist ein unter a_1, a_2 abgeschlossener Unterraum der Dimension 8 mit M = K′ ⊕ N_0.
 (iv) Die a-Punkte im Träger von w sind mindestens 15 und höchstens 21.

**Aussage S4-14-D (Rechnung über GF(32003) und GF(10007), behauptet).**
 (i) Die Lage L* aus Anhang B (34 Produkte auf 20 a-Punkten mit Koordinaten in {0, …, 4}) ist im Fall e = 3 zulässig im Sinn von S4-07, Abschnitt 7.1 (dim J = 7, dim K′ = 13, dim K″ = 21, dim N = 3), erfüllt (M21), und das System (C′) hat über GF(32003) einen Lösungsraum der Dimension 59 > 57. Die Projektion auf (c_1, c_2) hat Rang 10, die trivialen Lösungen aus S4-07, Abschnitt 6.1, haben Rang 8. Eingeschränkt auf den Träger von w hat die Projektion Rang 8 und stimmt dort mit den trivialen Lösungen überein. Der Rang von Θ auf J³_0 modulo K′ ist 0. Das Programm `gentest.py` aus S4-07 (SHA-256 wie dort angegeben) liefert für L* ebenfalls (59, 8, 0).
 (ii) In 9 879 zufälligen zulässigen Lagen mit (M21) über GF(32003) (Block 1) und 4 927 über GF(10007) (Block 2) war der Rang von Θ stets 0, obwohl in 547 bzw. 250 davon dim V_C > 57 war.
 (iii) In 14 289 bzw. 5 596 abstrakten A-Moduln der Dimension 21 (auch nicht halbeinfachen, mit Doppelpunkten und dicken Punkten) mit den Dimensionen 7, 13, 21 und dim N = 3 hat das System (∗) aus Abschnitt 6.3 nur die trivialen Lösungen (Lösungsraum 50 = 42 + 8), und Θ ist modulo K′ gleich 0.

**Vermutung S4-14-V1.** Im Unterfall (M21) gilt Θ(J³_0) ⊆ K′. Dann gibt es im Fall e = 3 kein Verfahren der Länge 34 (mit Satz R).

**Vermutung S4-14-V2 (rein modultheoretisch, stärker als V1).** Sei M ein endlichdimensionaler K[a_1, a_2]-Modul, erzeugt von w und u, so dass (F, G) ↦ w·F + u·G auf P_4 ⊕ P_2 injektiv ist und M = w·P_4 + u·P_2 gilt. Setze M_3 := w·P_3 + u·P_1, M_4 := M. Sind m_1, m_2 ∈ M und gibt es zu jedem G ∈ P_2 ein k_G ∈ M_3 mit G·m_i − a_i·k_G ∈ M_3 (i = 1, 2), dann gibt es ℓ_1, ℓ_2, μ ∈ P_1 mit m_i = (ℓ_i + a_i·μ)·w.

**Lücke L-2′ (ersetzt L-2 aus S4-07).** Der Fall e = 3 ist offen genau im Unterfall (M21). Er ist geschlossen, sobald V1 gezeigt ist; V2 impliziert V1 (Abschnitt 6.3).

---

## 2. Worauf sich der Beweis stützt

Alles Folgende setzt eine Normalform voraus, wie in S4-07, Abschnitt 1.1: K algebraisch abgeschlossen (R1 aus `yang_n3.md`), Länge 34 bleibt erhalten, starke Normalisierung (Lemma A), Skalierung auf a_0 = (1, …, 1). Daraus und aus dem Restfall übernehme ich ohne eigene Prüfung (Status dort: behauptet, B-017 bis B-019 von je einem Prüfer bestätigt):

- **(V1)** dim J = 7 für J := span(q_1, …, q_7), also ist q_1, …, q_7 eine Basis von J (G4 in `yang_n3.md`).
- **(V2)** K′ := ker W hat Dimension 13 (W ist surjektiv auf K^{3×7}, das folgt aus (D) unten).
- **(V3)** rk L = 6, also K′ = J + a_1·J + a_2·J (S4-07, Abschnitt 1.2, aus R-327).
- **(V4)** Es gibt w ∈ J mit w·P_1 = f_0(N), dim(w·P_1) = 3 und w·P_2 ⊆ J (S4-07, Abschnitt 3.1; das Argument dort habe ich nachgelesen: es braucht dim N = 3, dim S = 1 und (SN2)).

Selbst aus den Brent-Gleichungen hergeleitet (wie S4-07, Abschnitt 2, nachgerechnet): Mit π : J → K^34, π(q_k) := p_k (wohldefiniert nach V1) gilt für alle j ∈ J und i = 0, 1, 2:
 **(A)** a_i·j ∈ K′, **(C)** a_i·π(j) − b_i·j ∈ K′, **(D)** die 21 Vektoren b_i·q_k sind modulo K′ linear unabhängig, und K^34 = K′ ⊕ span(b_i·q_k).
Bedingung (B) (b_i·π(j) ∈ K′) brauche ich nirgends.

Über welchem Körper: Alle Schritte in Abschnitt 4 und 5 sind lineare Algebra und die Exaktheit des Koszul-Komplexes; sie gelten in jeder Charakteristik. Die Einschränkung kommt nur aus dem Rahmen (Normalform über dem algebraischen Abschluss). Damit gelten die Aussagen für Verfahren über jedem Körper, soweit der Restfall (B-017 bis B-019) für jeden Körper gilt.

---

## 3. Bezeichnungen

- Vektoren in K^34 sind Funktionen auf den 34 Indizes, „·“ ist das komponentenweise Produkt. a_i, b_i (i = 0, 1, 2) sind die beiden Spalten der α_t, a_0 = 1.
- A := K[a_1, a_2] wirkt auf K^34 durch Multiplikation. P_d ⊆ A: Polynome vom Grad ≤ d, P_{−1} = P_{−2} = 0. Für v ∈ K^34: v·P_d := {v·f : f ∈ P_d}, A·v := ∪_d v·P_d.
- M_d := w·P_d + u·P_{d−2}. Also M_2 ⊇ J, M_3 = J + a_1J + a_2J im Fall e = 3 (unten), K″ := K′ + a_1·K′ + a_2·K′.
- J³_0 := {(j_0, j_1, j_2) ∈ J³ : j_0 + a_1·j_1 + a_2·j_2 = 0}, Θ(j) := b_0·j_0 + b_1·j_1 + b_2·j_2 für j ∈ J³_0. (Für j ∈ J³_0 ist das dasselbe Θ wie in S4-07, Abschnitt 3.3: b_0·(j_0 + a_1j_1 + a_2j_2) + c_1j_1 + c_2j_2 = c_1j_1 + c_2j_2.)
- ω_{ik} := a_i·b_k − a_k·b_i für 0 ≤ i, k ≤ 2. Es ist ω_{0k} = b_k − a_k·b_0 = c_k (k = 1, 2).

---

## 4. Beweis von Satz R (Aussage S4-14-A)

Sei eine Lage im Fall e = 3 gegeben, also dim(w·P_2) = 6 und, da w·P_2 ⊆ J (V4) und dim J = 7, J = w·P_2 ⊕ ⟨u⟩ für ein u ∈ J.

**Schritt 1 (Gestalt, wie S4-07-C, hier vollständig hergeleitet).**
Nach (V3) ist K′ = J + a_1J + a_2J = w·P_3 + u·P_1. Also 13 = dim K′ ≤ dim(w·P_3) + dim(u·P_1) ≤ 10 + 3, somit dim(w·P_3) = 10, dim(u·P_1) = 3, und die Summe ist direkt. Weiter K″ = w·P_4 + u·P_2, also dim K″ ≤ 15 + 6 = 21.
Untere Schranke: Nach (D) ist K^34 = K′ + Σ_{i=0}^{2} b_i·J. Für j ∈ J ist nach (C) mit i = 0 π(j) ∈ b_0·j + K′, also nach (C) für i
 b_i·j ∈ a_i·π(j) + K′ ⊆ a_i·b_0·j + a_i·K′ + K′ = b_0·(a_i·j) + a_i·K′ + K′ ⊆ b_0·K′ + K″,
denn a_i·j ∈ K′ nach (A). Also K^34 = K″ + b_0·K′, und wegen dim(b_0·K′) ≤ 13 ist dim K″ ≥ 21.
Zusammen: **dim K″ = 21, dim(w·P_4) = 15, dim(u·P_2) = 6, K″ = w·P_4 ⊕ u·P_2, K^34 = K″ ⊕ b_0·K′.** Insbesondere ist die Abbildung
 ε : P_4 ⊕ P_2 → K″, (F, G) ↦ w·F + u·G
bijektiv, und ihre Einschränkungen auf P_3 ⊕ P_1 (Bild K′) und P_2 ⊕ P_0 (Bild J) sind injektiv.

**Schritt 2 (Gestalt von J³_0).** Sei (j_0, j_1, j_2) ∈ J³_0 und j_i = w·φ_i + s_i·u mit φ_i ∈ P_2, s_i ∈ K. Dann ist
 0 = Σ a_i·j_i = w·(φ_0 + a_1φ_1 + a_2φ_2) + u·(s_0 + s_1a_1 + s_2a_2)
mit Polynomen vom Grad ≤ 3 bzw. ≤ 1. Nach Schritt 1 (ε injektiv auf P_3 ⊕ P_1) ist **φ_0 + a_1φ_1 + a_2φ_2 = 0 als Polynom** und s_0 + s_1a_1 + s_2a_2 = 0, also s_0 = s_1 = s_2 = 0. Die Abbildung J³ → K′, (j_i) ↦ Σ a_i j_i, ist nach (V3) surjektiv, also dim J³_0 = 21 − 13 = 8.

**Schritt 3 (Koszul).** Homogenisiere: Φ_i(X_0, X_1, X_2) := X_0²·φ_i(X_1/X_0, X_2/X_0) ∈ S_2, S := K[X_0, X_1, X_2]. Die Relation aus Schritt 2 wird X_0Φ_0 + X_1Φ_1 + X_2Φ_2 = 0 in S_3. Der Koszul-Komplex der regulären Folge X_0, X_1, X_2 ist exakt, also gibt es Formen Ψ_{ik} ∈ S_1 mit Ψ_{ki} = −Ψ_{ik} und Φ_i = Σ_k Ψ_{ik}·X_k. Setze ψ_{ik} := Ψ_{ik}(1, a_1, a_2) ∈ P_1. Mit a_0 = 1 ist dann **φ_i = Σ_k ψ_{ik}·a_k** (als Polynome und als Vektoren). Daraus
 Θ(j) = Σ_i b_i·w·Σ_k ψ_{ik}a_k = w·Σ_{i<k} ψ_{ik}·(b_i a_k − b_k a_i) = − Σ_{i<k} ψ_{ik}·ω_{ik}·w.

**Schritt 4 (ω_{ik}·J ⊆ K″).** Für j ∈ J und 0 ≤ i, k ≤ 2 ist
 ω_{ik}·j = a_k·(a_i·π(j) − b_i·j) − a_i·(a_k·π(j) − b_k·j) ∈ a_k·K′ + a_i·K′ ⊆ K″
nach (C) (Ausmultiplizieren: die Terme a_ia_kπ(j) heben sich weg). Für i = 0 oder k = 0 ist a_0·K′ = K′ ⊆ K″.

**Schritt 5 (Θ(J³_0) ⊆ K″ und K″ = K′ ⊕ Θ(J³_0)).** Für j ∈ J³_0 liegt jedes ψ_{ik}·w in w·P_1 ⊆ J, also nach Schritt 3 und 4 Θ(j) ∈ K″. Nach (D) ist (j_i) ↦ [Σ b_i·j_i] ∈ K^34/K′ injektiv auf J³ (die 21 Vektoren b_i·q_k sind modulo K′ unabhängig), also Θ(J³_0) ∩ K′ = 0 und dim Θ(J³_0) = 8. Da dim K″ = 21 = 13 + 8, folgt **K″ = K′ ⊕ Θ(J³_0)**. (Das ist (D′) aus S4-07, hier in der Form „Θ(J³_0) ist ein Komplement von K′ in K″“.)

**Schritt 6 (Abschluss).** Für l ∈ {1, 2} und j ∈ J³_0 ist nach Schritt 3
 a_l·Θ(j) = − Σ_{i<k} ω_{ik}·(w·a_l·ψ_{ik}),
und w·a_l·ψ_{ik} ∈ w·P_2 ⊆ J. Nach Schritt 4 liegt jeder Summand in K″, also a_l·Θ(J³_0) ⊆ K″. Außerdem a_l·K′ ⊆ K″ nach Definition. Mit Schritt 5: **a_l·K″ = a_l·K′ + a_l·Θ(J³_0) ⊆ K″.** ∎

**Gleichwertige Formen.** Ist K″ unter a_1, a_2 abgeschlossen, dann enthält K″ den Modul A·w + A·u (denn w, u ∈ J ⊆ K″), und umgekehrt ist K″ = w·P_4 + u·P_2 ⊆ A·w + A·u. Also A·w + A·u = K″. Insbesondere w·P_5 + u·P_3 ⊆ K″ = w·P_4 ⊕ u·P_2: Zu jedem Paar (F, G) mit deg F ≤ 5, deg G ≤ 3 gibt es (F′, G′) ∈ P_4 ⊕ P_2 mit w·F + u·G = w·F′ + u·G′. Der Raum der Relationen {(F, G) ∈ P_5 ⊕ P_3 : w·F + u·G = 0} hat dann Dimension 31 − 21 = 10. Umgekehrt folgt aus A·w + A·u = K″ wieder die Abgeschlossenheit.

**Bemerkung zum Beweis.** Der Kern ist Schritt 6: Θ(J³_0) besteht aus Elementen, deren Produkt mit a_l wieder in K″ liegt. In der Sprache des graduierten Moduls gr M heißt das: Das Bild von Θ liegt im Sockel von gr M im Grad 4. (D′) verlangt, dass dieses Bild ganz gr_4 ist, und dann muss gr_5 = 0 sein.

---

## 5. Folgerungen (Aussage S4-14-B) und Gestalt im Unterfall (M21) (Aussage S4-14-C)

**B (i).** Unter (INJ5) ist ε auf P_5 ⊕ P_3 injektiv, also dim(w·P_5 + u·P_3) = 21 + 10 = 31 > 21. Nach den gleichwertigen Formen von Satz R ist dann K″ nicht abgeschlossen, also gibt es kein Verfahren. Das ist die Aussage S4-07-D. Der Beweis hier benutzt die Schritte 2 bis 6 von S4-07, Abschnitt 6.2, nicht.

**B (ii), (iii).** Direkt aus den gleichwertigen Formen von Satz R.

**C (i).** Sei Π die Menge der verschiedenen a-Punkte. Zu p ∈ Π gibt es ein Polynom e_p ∈ A mit e_p(p) = 1 und e_p(p′) = 0 für p′ ∈ Π ∖ {p} (Interpolation an endlich vielen Punkten). Als Vektor ist e_p die Indikatorfunktion von T_p. Für jeden A-Untermodul M ⊆ K^34 gilt also M = ⊕_p e_p·M, und für M = A·w + A·u ist e_p·M = span(e_p·w, e_p·u) = M_p, weil A auf K^{T_p} durch Skalare wirkt. Nach Satz R ist M = K″, also Σ d_p = 21. K^34 = K″ ⊕ b_0·K′ steht in Schritt 1.

**C (ii).** Multipliziere K^34 = M + b_0·K′ mit e_p: K^{T_p} = M_p + b_0·e_p·K′ ⊆ M_p + b_0·M_p, also |T_p| ≤ 2d_p. Die Summenformel folgt aus (iii).

**C (iii).** Die Abbildung β : M → K^34/M, m ↦ [b_0·m], zerfällt nach Punkten: β = ⊕_p β_p mit β_p : M_p → K^{T_p}/M_p. Eingeschränkt auf K′ ⊆ M ist β injektiv (b_0·K′ ∩ M = 0) und, da dim K^34/M = 13 = dim K′, bijektiv. Also ist β surjektiv, ker β = ⊕_p ker β_p =: N_0 hat Dimension 21 − 13 = 8, N_0 ∩ K′ = 0 und M = K′ ⊕ N_0. N_0 ist eine direkte Summe von Teilräumen der M_p, also unter a_1, a_2 abgeschlossen. Jedes β_p ist surjektiv, also dim ker β_p = d_p − (|T_p| − d_p) = 2d_p − |T_p|.

**C (iv).** A·w ist der Raum der Funktionen p ↦ (Skalar)·w|_{T_p} auf den a-Punkten im Träger von w, seine Dimension ist deren Anzahl. Es ist w·P_4 ⊆ A·w ⊆ M, also 15 ≤ Anzahl ≤ 21.

**Was C für das Bild bedeutet (ohne Beweis eines Widerspruchs).** Im Unterfall (M21) ist der ganze Modul schon in Grad 4 erzeugt, und gr M hat in Grad 4 nur Sockel. Das Argument von Satz R gibt dort nichts mehr her. Ein Verfahren bräuchte zwei Komplemente von K′ in M zugleich: das A-stabile N_0 (aus b_0) und Θ(J³_0) (aus c_1, c_2). Einen Widerspruch zwischen beiden habe ich nicht gefunden (Abschnitt 8).

---

## 6. Der Unterfall (M21): Rechnung und Vermutungen

### 6.1 Gegenbeispiel zum Wortlaut von S4-07-V (Aussage S4-14-D (i))

S4-07-V sagt, (C′) habe im Fall e = 3 auch ohne (INJ5) nur die trivialen Lösungen, und belegt das mit dim V_C = 57 in allen gerechneten Lagen. Die Lage L* (Anhang B) ist zulässig im Sinn von S4-07, Abschnitt 7.1, und erfüllt außerdem die Zählbedingungen aus S4-07, Abschnitt 4.4: 29 Produkte liegen im Träger von w, die übrigen (Z_1) sind 5 Indizes auf 3 nicht kollinearen a-Punkten. (Bedingungen, die b_0 betreffen, sind keine Eigenschaft der Lage und hier nicht geprüft.) Rechnung über GF(32003):

```
inspect_extra.py: dimVC 59 rank c-proj 10 rank triv 8 rank c+triv 10
                  on supp w: rank c-proj 8 with triv 8
S4-07 gentest.dprime auf L*: (dimVC, dimJ30, rankTheta) = (59, 8, 0)
cprime.analyse auf L*: dimVC 59, dim ker L 8, rank Theta 0, dim(K'' + a K'') 21
```

Also: Die Lösungsmenge ist größer als die triviale, die zusätzlichen zwei Richtungen von (c_1, c_2) verschwinden aber auf dem Träger von w (sie leben auf Z_1). In der schwächeren Lesart „trivial auf dem Träger von w“, die S4-07, Abschnitt 6.2, tatsächlich benutzt, bleibt S4-07-V in allen meinen Rechnungen richtig. Für den Ausschluss ist das ohne Folgen: Θ hat Rang 0.

### 6.2 Umfang der Rechnung (Aussage S4-14-D (ii), (iii))

Lagen mit (M21) werden gezielt gebaut (`mstable.py`): 15 + k a-Punkte für w (k = 0 bis 6), davon einige mit u parallel zu w, einige mit unabhängigem u (d_p = 2), dazu bis zu 6 − k Punkte nur für u; Fasergrößen zufällig mit |T_p| ≤ 2d_p und Summe 34; Punkte allgemein, auf einem Kegelschnitt, auf einer kubischen Kurve oder auf einem kleinen Gitter. Geprüft werden dim J = 7, dim K′ = 13, dim K″ = 21, dim N = 3 und dim(K″ + a_1K″ + a_2K″) = 21.

| Lauf | Primzahl | zulässig mit (M21) | davon dim V_C > 57 | Rang Θ |
|---|---|---|---|---|
| Block 1, `mstable.py 1 120` | 32003 | 9 879 | 547 (bis 65) | immer 0 |
| Block 2, `mstable.py 11 60` | 10007 | 4 927 | 250 | immer 0 |

Abstrakte Moduln (`absmod.py`): M = K^21 mit vertauschbaren X_1, X_2 als direkte Summe lokaler Blöcke (einfache Punkte, gekrümmte Doppelpunkte, Skalarblöcke der Dimension 2, dicke Punkte m²), w, u zufällig. Gelöst wird nur das System (∗) aus 6.3 in (m_1, m_2) ohne jede Faserbedingung. Ergebnis: Lösungsraum stets 50 = 42 (Eichung k_G ∈ J) + 8 (triviale m), Θ modulo M_3 stets 0; 14 289 Moduln über GF(32003) (Lauf `absmod2.py 3 100`, das ist `absmod.py` mit zusätzlicher Zählung der verworfenen Fälle), 5 596 über GF(10007) (`absmod.py 12 40`). Dasselbe für M = A·w allein mit 15 allgemeinen Punkten (`wonly.py`, drei Lagen): Lösungsraum 44 = 36 + 8.

Gegenprobe dafür, dass die Rangrechnung nicht blind ist: Lässt man in (∗) nur G ∈ P_1 zu (`absmod3.py`, Umgebungsvariable GD = 1), dann hat Θ in allen Moduln Rang 5 (dim Lösungsraum 39). Die Bedingungen mit quadratischem G tragen also. Die Gegenprobe von S4-07 an echten Verfahren (voller Rang von Θ bei 3×2×6 mit 30 und 3×2×7 mit 35) habe ich nicht wiederholt. Zusatz: `alin.py` lässt in L* c_1, c_2 beliebige A-lineare Abbildungen M → M sein (23 Freiheitsgrade je c); der Lösungsraum wird 61, der Rang von Θ bleibt 0.

### 6.3 Vermutungen

**V1** (Abschnitt 1) ist, was für den Ausschluss gebraucht wird.

**V2 ⇒ V1.** Im Unterfall (M21) ist (C′) für j = w·G (G ∈ P_2) genau (∗) mit m_i := c_i·w und k_G := κ(w·G), denn c_i·(w·G) = G·(c_i·w). Aus V2 folgt c_i·w = (ℓ_i + a_iμ)·w, und dann für (j_0, j_1, j_2) ∈ J³_0 mit j_i = w·φ_i (Schritt 2):
 Θ(j) = c_1·wφ_1 + c_2·wφ_2 = w·(ℓ_1φ_1 + ℓ_2φ_2 + μ·(a_1φ_1 + a_2φ_2)) = w·(ℓ_1φ_1 + ℓ_2φ_2 − μφ_0) ∈ w·P_3 ⊆ K′.

**Warum V2 nicht aus Dimensionen folgt.** Für M = A·w mit 15 Punkten in allgemeiner Lage ist (∗) ein System aus 36 Gleichungen in 30 Unbekannten mit 8-dimensionaler trivialer Lösung; Starrheit heißt Rang 22. Für spezielle Punktmengen kann der Rang fallen. Gleichwertig (Abschnitt 8, Ansatz 4): Die Einschränkung eines Schnitts s von T_{P²}(2) auf die Punkte soll nur dann für alle Quadriken G mit G·s wieder eine solche Einschränkung sein, wenn s aus sl_3 kommt. Das ist eine Starrheitsaussage über die Punktmenge, keine Zählung.

---

## 7. Rechenblöcke

Alle Blöcke auf höchstens 1 Kern (einzelne Python-Prozesse nacheinander), Zeiten UTC.

| Block | Zeit | Inhalt | Commit danach |
|---|---|---|---|
| 1 | 10:03 bis 10:07 | `socle_test.py`, `mstable.py 1 120`, Suche nach L* | 3089e78 um 10:08:40 |
| 2 | 10:08 bis 10:27 | `alin.py`, `monly.py`, `absmod.py`/`absmod2.py` (Läufe von 30 bis 100 s), `absmod3.py`, `wonly.py`, `mstable.py 11 60` (zweimal) und `absmod.py 12 40` über GF(10007), Gegenprobe mit dem Code aus S4-07 | nächster Commit dieser Datei |

Jeder Block unter 30 Minuten, zwischen den Blöcken liegt ein Commit. Einzelläufe dauerten höchstens 120 s.

---

## 8. Gescheiterte Ansätze (mit Grund)

1. **Nur Sockel im Grad 4 (Ansatz zu Satz R in schwächerer Form).** Erste Fassung: Θ(J³_0) liegt im Sockel σ von gr M in Grad 4, also Rang Θ ≤ dim σ. Das gibt nur dim σ = 8, also gr_5 = 0. Das ist Satz R, aber kein Widerspruch: Der Unterfall (M21) kommt als Lage tatsächlich vor (Abschnitt 6.2). Gescheitert an: (M21) ist möglich.
2. **Fasern und N_0.** Aus K^34 = M ⊕ b_0·K′ folgt C (ii), (iii). Ein Widerspruch zu (D′) ergibt sich nicht: N_0 hängt von b_0 ab, die Rechnung zeigt aber Rang Θ = 0 unabhängig von b_0 (b_0 kommt in (C′) nicht vor). Gescheitert an: N_0 und Θ(J³_0) sind zwei verschiedene Komplemente von K′, und nichts zwingt sie zusammen.
3. **Grad-Zählung mit der Reduktionsabbildung τ.** Im Unterfall (M21) ist M ≅ P_4 ⊕ P_2 als Vektorraum, a_l wirkt auf dem Grad-4-Teil über eine Reduktionsabbildung τ : (Formen vom Grad 5, 3) → (Grad 4, 2). Aus (∗) mit G = 1, a_1, a_2 folgt für den Leitteil h (m_i^{(4)} = x_i·h): τ(x²h) ∈ x·F_3, τ(y²h) ∈ y·F_3, 2τ(xyh) = (y/x)·τ(x²h) + (x/y)·τ(y²h) (Charakteristik ≠ 2). Daraus folgt h = 0 nur bei bekannter Gestalt von τ. Die Vertauschbarkeit von a_1 und a_2 legt τ nicht fest. Gescheitert an: keine allgemeine Aussage über τ gefunden.
4. **Vektorfeld-Formulierung.** Für M = A·w mit 15 Punkten ist (∗) gleichwertig dazu, dass c|_Π und alle G·c|_Π (G Quadrik) Einschränkungen von Schnitten von T_{P²}(2) sind; trivial sind die Schnitte aus H^0(T_{P²}) = sl_3. Ein Beweis bräuchte, dass H^0(T(4) ⊗ I_Π) + X_0²·H^0(T(2)) nichts Zusätzliches enthält. H^0(T(4) ⊗ I_Π) ist mindestens 18-dimensional, ein Zählargument reicht nicht. Gescheitert an: fehlende Kohomologie-Aussage für beliebige Punktmengen mit h-Vektor (1, 2, 3, 4, 5).
5. **Duale Formulierung mit Paaren von Funktionalen.** (C′) ist gleichwertig zu: aus (ξ, ξ′) ∈ Ann(K′)² mit a_1ξ + a_2ξ′ ∈ Ann(K′) folgt ξ(c_1 j) + ξ′(c_2 j) = 0 für alle j ∈ J. Um η(Θ(φ)) = 0 so zu erhalten, müsste (φ_1η, φ_2η) ein solches Paar sein; das verlangt η ∈ Ann(K″) = 0. Gescheitert an: zu starke Forderung, man müsste j je Summand verschieden wählen, und dafür fehlt eine Verbindung.

Was man daraus lernt: Der Unterfall (M21) ist ein Starrheitsproblem für die Punktlage zusammen mit w und u. Die Brent-Gleichungen außer (C) helfen dort nach meinem Stand nicht, weil die Rechnung schon ohne b_0 und ohne (B) Rang 0 liefert.

---

## 9. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Rechenblöcke: 2 (Abschnitt 7), je unter 30 Minuten, höchstens 1 Kern.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs.

---

## Anhang A: Programme (Python 3, numpy, exakt modulo einer Primzahl, keine Gleitkommazahlen)

Eigene Implementierung, nicht aus S4-07 übernommen (für die Gegenprobe in 6.1 habe ich zusätzlich `ff.py`, `lib327.py` und `gentest.py` aus S4-07 unverändert ausgeführt; SHA-256 stimmen mit den dort angegebenen überein). Die Primzahl ist 32003, außer die Umgebungsvariable PRIME ist gesetzt. Aufrufe aus einem Verzeichnis mit allen Dateien: `python3 mstable.py <Startwert> <Sekunden>`, `python3 inspect_extra.py L.json`, `python3 monly.py L.json`, `python3 alin.py L.json`, `python3 absmod.py <Startwert> <Sekunden>`, `GD=1 python3 absmod3.py <Startwert> <Sekunden>`, `python3 wonly.py <Startwert> <Anzahl>`. `L.json` ist die Lage aus Anhang B. `absmod2.py` und `absmod3.py` sind `absmod.py` mit zusätzlicher Statistik bzw. mit wählbarem Höchstgrad von G und hier nicht abgedruckt.

### la.py (Lineare Algebra modulo p)

SHA-256 `03b200f6ad12b822f9bfa9f5cccf8740c1c9fdb70721ccb14d65f26101ff87e6`

```python
# exact linear algebra mod prime p, own implementation (S4-14)
import numpy as np
import os
P=int(os.environ.get("PRIME","32003"))
def rref(M,p=P):
    M=np.array(M,dtype=np.int64)%p
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
def mons(d):
    return [(i,t-i) for t in range(d+1) for i in range(t+1)]
def polys(a1,a2,d):
    return [ (pow_v(a1,i)*pow_v(a2,j))%P for (i,j) in mons(d)]
def pow_v(v,k):
    out=np.ones_like(v)
    for _ in range(k): out=out*v%P
    return out
```

### cprime.py (Lage im Fall e = 3, System (C′), Rang von Θ)

SHA-256 `ad93564ff8dbc6f18e3dfeadd5ef29fef43fd1faf9bb9edb1d5d70d5c11f3b29`

```python
# setup e=3 position, solve (C'), compute rank of Theta on ker L modulo K'
import numpy as np
from la import *
def analyse(a1,a2,w,u,rng,trials=3,verbose=False):
    r=len(a1)
    Jg=np.array([w*f%P for f in polys(a1,a2,2)]+[u])
    if rank(Jg)!=7: return {'bad':'J'}
    J=rref(Jg)[0]
    Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
    if Kp.shape[0]!=13: return {'bad':'K1'}
    K2=rref(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))[0]
    if K2.shape[0]!=21: return {'bad':'K2'}
    K3=rank(np.vstack([K2,a1*K2%P,a2*K2%P]))
    AnnJ=null(J)
    N=null(np.vstack([(AnnJ*a1)%P@J.T%P,(AnnJ*a2)%P@J.T%P]))
    if N.shape[0]!=3: return {'bad':'N'}
    # (C'): unknowns c1,c2 (r each), kappa_k in K' coords (7 x 13)
    Ann=null(Kp)  # rows annihilate K'
    m=7;kd=13;nun=2*r+m*kd;eqs=[]
    A=[a1,a2]
    for i in range(2):
        for k in range(m):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*r:(i+1)*r]=Ann*J[k]%P
            blk[:,2*r+kd*k:2*r+kd*(k+1)]=(-((Ann*A[i])%P@Kp.T))%P
            eqs.append(blk)
    V=null(np.vstack(eqs))
    # ker L: (j1,j2) in J^2 with a1 j1 + a2 j2 in J
    KL=null(np.hstack([(AnnJ*a1)%P@J.T%P,(AnnJ*a2)%P@J.T%P]))
    best=0
    for _ in range(trials):
        x=rng.integers(0,P,V.shape[0])@V%P
        c1=x[:r];c2=x[r:2*r]
        Th=np.array([(c1*(z[:7]@J%P)+c2*(z[7:]@J%P))%P for z in KL])
        best=max(best,rank(np.vstack([Kp,Th]))-13)
    return {'dimVC':V.shape[0],'dimkerL':KL.shape[0],'rankTheta':best,'dimM5':K3}
```

### mstable.py (Lagen mit (M21) erzeugen und auswerten)

SHA-256 `ec63c372efacb1da106332848ff30cb8a74c6d14f634e7d1da260b7f83f81b42`

```python
# random positions with M = Aw+Au = K'' (dim 21), test (C')
import numpy as np,sys,time
from la import *
from cprime import analyse
seed=int(sys.argv[1]);tl=float(sys.argv[2])
rng=np.random.default_rng(seed)
stats={};t0=time.time();n=0
def pts_gen(n,mode):
    if mode==0: return rng.integers(0,P,(n,2))
    if mode==1: # many on a conic y=x^2+c
        x=rng.integers(0,P,n); c=rng.integers(0,P); out=np.stack([x,(x*x+c)%P],1)
        m=rng.integers(0,n); out[:m]=rng.integers(0,P,(m,2)); return out
    if mode==2: # on a cubic graph
        x=rng.integers(0,P,n); co=rng.integers(0,P,4); y=np.zeros(n,dtype=np.int64)
        for c in co: y=(y*x+c)%P
        out=np.stack([x,y],1); m=rng.integers(0,n); out[:m]=rng.integers(0,P,(m,2)); return out
    if mode==3: # small grid
        g=rng.integers(5,9); sel=rng.choice(g*g,n,replace=False); return np.stack([sel//g,sel%g],1)
while time.time()-t0<tl:
    n+=1
    k=int(rng.integers(0,7))         # n_w = 15+k, |Pi'| = 6-k
    nw=15+k; npr=6-k
    n2=int(rng.integers(0,npr+1)); nz1=npr-n2   # Pi_2 inside Pi_w, Z1 points outside
    mode=int(rng.integers(0,4))
    pts=pts_gen(nw+nz1,mode)
    if len(set(map(tuple,pts.tolist())))<nw+nz1: continue
    # roles: first n2 of Pi_w are Pi_2; next some with u parallel w; rest u=0
    npar=int(rng.integers(0,nw-n2+1))
    roles=['2']*n2+['par']*npar+['w']*(nw-n2-npar)+['z']*nz1
    d=[2 if r=='2' else 1 for r in roles]
    # fiber sizes: |T_p|<=2 d_p, sum 34, d=2 points need >=2
    lo=[2 if x==2 else 1 for x in d]; hi=[2*x for x in d]
    if sum(lo)>34 or sum(hi)<34: continue
    sz=lo[:]; rest=34-sum(sz); idxs=list(range(len(sz)))
    while rest>0:
        i=int(rng.choice(idxs))
        if sz[i]<hi[i]: sz[i]+=1; rest-=1
    a1=[];a2=[];w=[];u=[]
    for p,(role,s) in enumerate(zip(roles,sz)):
        mu=rng.integers(1,P)
        for _ in range(s):
            a1.append(pts[p,0]);a2.append(pts[p,1])
            if role=='z': w.append(0);u.append(rng.integers(1,P))
            elif role=='2': w.append(rng.integers(1,P));u.append(rng.integers(1,P))
            elif role=='par': wv=rng.integers(1,P);w.append(wv);u.append(wv*mu%P)
            else: w.append(rng.integers(1,P));u.append(0)
    a1=np.array(a1);a2=np.array(a2);w=np.array(w);u=np.array(u)
    res=analyse(a1,a2,w,u,rng,trials=2)
    key=('bad',res['bad']) if 'bad' in res else (k,mode,res['dimM5'],res['dimVC'],res['rankTheta'])
    stats[key]=stats.get(key,0)+1
for kk in sorted(stats,key=str): print(kk,stats[kk])
print('trials',n)
```

### inspect_extra.py (Lösungen von (C′) in L* zerlegen)

SHA-256 `fbab744eb4f4ba648e8c8145681c5633ab51e3d0811ccbcf2acc8824ca1cc633`

```python
import numpy as np,json,sys
from la import *
d=json.load(open(sys.argv[1]))
a1=np.array(d['a1']);a2=np.array(d['a2']);w=np.array(d['w']);u=np.array(d['u']);r=len(a1)
J=rref(np.array([w*f%P for f in polys(a1,a2,2)]+[u]))[0]
Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
Ann=null(Kp);m=7;kd=13;nun=2*r+m*kd;eqs=[]
for i,A in enumerate([a1,a2]):
    for k in range(m):
        blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
        blk[:,i*r:(i+1)*r]=Ann*J[k]%P
        blk[:,2*r+kd*k:2*r+kd*(k+1)]=(-((Ann*A)%P@Kp.T))%P
        eqs.append(blk)
V=null(np.vstack(eqs)); C=V[:,:2*r]
one=np.ones(r,dtype=np.int64)
triv=[]
for l in [one,a1,a2]:
    triv.append(np.concatenate([l,0*l]));triv.append(np.concatenate([0*l,l]))
    triv.append(np.concatenate([a1*l%P,a2*l%P]))
triv=np.array(triv)
print('dimVC',V.shape[0],'rank c-proj',rank(C),'rank triv',rank(triv),'rank c+triv',rank(np.vstack([C,triv])))
sw=w!=0
print('on supp w: rank c-proj',rank(np.hstack([C[:,:r][:,sw],C[:,r:][:,sw]])),'with triv',rank(np.vstack([np.hstack([C[:,:r][:,sw],C[:,r:][:,sw]]),np.hstack([triv[:,:r][:,sw],triv[:,r:][:,sw]])])))
```

### monly.py (System (∗) nur in m_1, m_2, für L*)

SHA-256 `a813e4e7e9d3b18266c4a57d43232d87a7ad977eff4372846d246d87b410e9b3`

```python
# M=K'' case: unknowns m1,m2 in M only (no syzygy constraint), condition [G m_i]_4 = x_i h_G; rank of Theta
import numpy as np,json,sys
from la import *
d=json.load(open(sys.argv[1]))
a1=np.array(d['a1']);a2=np.array(d['a2']);w=np.array(d['w']);u=np.array(d['u']);r=len(a1)
P2=polys(a1,a2,2)
J=rref(np.array([w*f%P for f in P2]+[u]))[0]
Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
K2=rref(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))[0]
assert K2.shape[0]==21 and rank(np.vstack([K2,a1*K2%P,a2*K2%P]))==21
Ann=null(Kp)   # 21 rows (in K^34: annihilates K'); restrict to M via K2
# unknowns: y1,y2 in K^21 (m_i = y_i K2), kappa_G in K' coords (13) for 6 G
nun=21*2+6*13;eqs=[]
for gi,G in enumerate(P2):
    for i,A in enumerate([a1,a2]):
        blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
        blk[:,21*i:21*(i+1)]=(Ann*G%P)@K2.T%P
        blk[:,42+13*gi:42+13*(gi+1)]=(-((Ann*A)%P@Kp.T))%P
        eqs.append(blk)
V=null(np.vstack(eqs))
# Lambda basis: (1,0),(a1,0),(a2,0),(0,1),(0,a1),(0,a2),(a2a1,-a1a1),(a2a2,-a1a2)
one=np.ones(r,dtype=np.int64);z=0*one
Lam=[(one,z),(a1,z),(a2,z),(z,one),(z,a1),(z,a2),(a2*a1%P,(-a1*a1)%P),(a2*a2%P,(-a1*a2)%P)]
rng=np.random.default_rng(2);best=0
for _ in range(3):
    x=rng.integers(0,P,V.shape[0])@V%P
    m1=x[:21]@K2%P;m2=x[21:42]@K2%P
    Th=np.array([(f1*m1+f2*m2)%P for f1,f2 in Lam])
    best=max(best,rank(np.vstack([Kp,Th]))-13)
# trivial m: (l1 + a1 mu) w etc -> 8 dims ; plus?
print('dim sol',V.shape[0],'rank Theta',best)
```

### alin.py (c_1, c_2 beliebig A-linear, für L*)

SHA-256 `3e544e230bf8f2e0d91c7f80391792aa5207bee5bb0108a1bd4f20ac5d1ccf9e`

```python
# M = K'' example: allow c_i to be ANY A-linear endomorphism of M (block per a-point), solve (C'), rank Theta
import numpy as np,json,sys
from la import *
d=json.load(open(sys.argv[1]))
a1=np.array(d['a1']);a2=np.array(d['a2']);w=np.array(d['w']);u=np.array(d['u']);r=len(a1)
J=rref(np.array([w*f%P for f in polys(a1,a2,2)]+[u]))[0]
Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
K2=rref(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))[0]
assert K2.shape[0]==21 and rank(np.vstack([K2,a1*K2%P,a2*K2%P]))==21
# fibers
keys=list(dict.fromkeys(zip(a1.tolist(),a2.tolist())))
fib={k:[t for t in range(r) if (a1[t],a2[t])==k] for k in keys}
# basis of M_p: restrict K2 to fiber
blocks=[]
for k in keys:
    idx=fib[k]; B=rref(K2[:,idx])[0]  # rows: basis of M_p in coords idx
    blocks.append((idx,B))
# unknown: for each block a dp x dp matrix X with c(m)=coords: m restricted = y@B, c m = (y@X)@B
nvar=sum(B.shape[0]**2 for _,B in blocks)
def apply_lin(v):
    # returns matrix (r x nvar): c v as linear function of variables
    out=np.zeros((r,nvar),dtype=np.int64);off=0
    for idx,B in blocks:
        dp=B.shape[0]
        # coords y of v|idx in basis B: solve y B = v|idx
        sol=null(np.vstack([B,-v[idx]%P]).T)  # (y,1)
        assert sol.shape[0]==1
        y=sol[0][:dp]*pow(int(sol[0][dp]),P-2,P)%P
        # c v |idx = sum_{a,b} y_a X_ab B_b
        for a_ in range(dp):
            for b_ in range(dp):
                out[np.array(idx),off+a_*dp+b_]=y[a_]*B[b_]%P
        off+=dp*dp
    return out
Ann=null(Kp);kd=13;m=7
nun=2*nvar+m*kd;eqs=[]
for i,A in enumerate([a1,a2]):
    for k in range(m):
        blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
        blk[:,i*nvar:(i+1)*nvar]=Ann@apply_lin(J[k])%P
        blk[:,2*nvar+kd*k:2*nvar+kd*(k+1)]=(-((Ann*A)%P@Kp.T))%P
        eqs.append(blk)
V=null(np.vstack(eqs))
AnnJ=null(J)
KL=null(np.hstack([(AnnJ*a1)%P@J.T%P,(AnnJ*a2)%P@J.T%P]))
rng=np.random.default_rng(1);best=0
for _ in range(3):
    x=rng.integers(0,P,V.shape[0])@V%P
    Th=[]
    for z in KL:
        j1=z[:7]@J%P;j2=z[7:]@J%P
        Th.append((apply_lin(j1)@x[:nvar]+apply_lin(j2)@x[nvar:2*nvar])%P)
    best=max(best,rank(np.vstack([Kp,np.array(Th)]))-13)
print('nvar per c',nvar,'dim solutions',V.shape[0],'rank Theta',best)
```

### absmod.py (abstrakte Moduln der Dimension 21)

SHA-256 `fcbef9cb98af2f870b739228a51f76b5b50ccb568a82df5684434e8d8eddaf30`

```python
# abstract A-module M=K^N with commuting X1,X2 (direct sum of local blocks), generic w,u.
# Test: e=3 dims, M_4 = M, then m-only system and rank Theta.
import numpy as np,sys,time
from la import *
rng=np.random.default_rng(int(sys.argv[1]));tl=float(sys.argv[2])
def block(kind):
    p=rng.integers(0,P,2)
    if kind==0: return [np.array([[p[0]]]),np.array([[p[1]]])]
    if kind==1: # curvilinear double point
        d=rng.integers(0,P,2); X1=np.array([[p[0],d[0]],[0,p[0]]]);X2=np.array([[p[1],d[1]],[0,p[1]]]);return [X1,X2]
    if kind==2: # scalar 2-dim block (d_p=2 reduced)
        return [p[0]*np.eye(2,dtype=np.int64),p[1]*np.eye(2,dtype=np.int64)]
    if kind==3: # fat point m^2 : basis 1,e1,e2 ; X_l = p_l + mult by e_l
        X1=np.zeros((3,3),dtype=np.int64);X2=np.zeros((3,3),dtype=np.int64)
        for i in range(3): X1[i,i]=p[0];X2[i,i]=p[1]
        X1[0,1]=1;X2[0,2]=1  # acting on column vectors: coefficient vector (c0,c1,c2) ; x*e? keep nilpotent commuting
        return [X1,X2]
def dsum(bl):
    N=sum(b[0].shape[0] for b in bl);X1=np.zeros((N,N),dtype=np.int64);X2=X1.copy();o=0
    for b in bl:
        n=b[0].shape[0];X1[o:o+n,o:o+n]=b[0];X2[o:o+n,o:o+n]=b[1];o+=n
    return X1%P,X2%P
def mons_apply(X1,X2,v,d):
    out=[]
    for (i,j) in mons(d):
        x=v.copy()
        for _ in range(i): x=X1@x%P
        for _ in range(j): x=X2@x%P
        out.append(x)
    return out
stats={};t0=time.time()
while time.time()-t0<tl:
    kinds=[];N=0
    while N<21:
        k=int(rng.choice([0,0,0,1,2,3]));n=[1,2,2,3][k]
        if N+n>21: continue
        kinds.append(k);N+=n
    X1,X2=dsum([block(k) for k in kinds])
    assert (X1@X2%P==X2@X1%P).all()
    w=rng.integers(0,P,21);u=rng.integers(0,P,21)
    if rng.random()<0.5:  # sparsify u
        u[rng.random(21)<0.5]=0
    Jg=np.array(mons_apply(X1,X2,w,2)+[u])
    if rank(Jg)!=7: continue
    Kpg=np.array(mons_apply(X1,X2,w,3)+mons_apply(X1,X2,u,1))
    if rank(Kpg)!=13: continue
    K2g=np.array(mons_apply(X1,X2,w,4)+mons_apply(X1,X2,u,2))
    if rank(K2g)!=21: continue
    J=rref(Jg)[0];Kp=rref(Kpg)[0];K2=rref(K2g)[0]
    # dim N: y in J-coords with X_l j in J
    AnnJ=null(J)
    Nn=null(np.vstack([AnnJ@X1%P@J.T%P,AnnJ@X2%P@J.T%P]))  # rows are vectors; X acts on columns: vector v -> X v ; row form: v@X.T
    if Nn.shape[0]!=3: stats['N']=stats.get('N',0)+1;continue
    Ann=null(Kp)
    P2=[(i,j) for (i,j) in mons(2)]
    def G_apply(G,v):
        x=v.copy()
        for _ in range(G[0]): x=x@X1.T%P
        for _ in range(G[1]): x=x@X2.T%P
        return x
    nun=42+6*13;eqs=[]
    for gi,G in enumerate(P2):
        for i,X in enumerate([X1,X2]):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            GK=np.array([G_apply(G,row) for row in K2])
            blk[:,21*i:21*(i+1)]=Ann@GK.T%P
            blk[:,42+13*gi:42+13*(gi+1)]=(-(Ann@(Kp@X.T%P).T))%P
            eqs.append(blk)
    V=null(np.vstack(eqs))
    best=0
    for _ in range(2):
        x=rng.integers(0,P,V.shape[0])@V%P
        m1=x[:21]@K2%P;m2=x[21:42]@K2%P
        z=0*m1
        A1=lambda v:v@X1.T%P; A2=lambda v:v@X2.T%P
        Th=[m1,A1(m1),A2(m1),m2,A1(m2),A2(m2),(A1(A2(m1))-A1(A1(m2)))%P,(A2(A2(m1))-A1(A2(m2)))%P]
        best=max(best,rank(np.vstack([Kp,np.array(Th)]))-13)
    key=(tuple(sorted(set(kinds))),V.shape[0],best)
    stats[key]=stats.get(key,0)+1
for k in sorted(stats,key=str): print(k,stats[k])
```

### wonly.py (M = A·w mit 15 Punkten)

SHA-256 `c0173d436317859396d375667a7c81909e7a7e27448b2d9714f8502bdfff6d6e`

```python
# w-only: M = Aw with Hilbert fn 1,3,6,10,15, M=M_4 (15 generic points). m-only system (*) ; dim of m-part
import numpy as np,sys
from la import *
rng=np.random.default_rng(int(sys.argv[1]))
for trial in range(int(sys.argv[2])):
    n=15
    pts=rng.integers(0,P,(n,2)); a1=pts[:,0];a2=pts[:,1]; w=rng.integers(1,P,n)
    def Md(d): return rref(np.array([w*f%P for f in polys(a1,a2,d)]))[0]
    M2,M3,M4=Md(2),Md(3),Md(4)
    assert M4.shape[0]==15
    Ann=null(M3)
    P2=polys(a1,a2,2);k3=M3.shape[0];k4=15
    nun=2*k4+6*k3;eqs=[]
    for gi,G in enumerate(P2):
        for i,A in enumerate([a1,a2]):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,k4*i:k4*(i+1)]=(Ann*G%P)@M4.T%P
            blk[:,2*k4+k3*gi:2*k4+k3*(gi+1)]=(-((Ann*A)%P@M3.T))%P
            eqs.append(blk)
    V=null(np.vstack(eqs))
    mpart=rank(V[:,:2*k4])
    one=np.ones(n,dtype=np.int64);z=0*one
    Lam=[(one,z),(a1,z),(a2,z),(z,one),(z,a1),(z,a2),(a2*a1%P,(-a1*a1)%P),(a2*a2%P,(-a1*a2)%P)]
    x=rng.integers(0,P,V.shape[0])@V%P; m1=x[:k4]@M4%P;m2=x[k4:2*k4]@M4%P
    Th=np.array([(f1*m1+f2*m2)%P for f1,f2 in Lam])
    print('dimV',V.shape[0],'m-part',mpart,'rank Theta mod M3',rank(np.vstack([M3,Th]))-k3)
```

## Anhang B: Die Lage L*

34 Produkte, Einträge modulo 32003. a1, a2: a-Koordinaten je Produkt; w, u: die Vektoren w und u. Träger von w: Indizes 0 bis 28. Z_1 (u ≠ 0, w = 0): Indizes 29 bis 33 auf den a-Punkten (2, 1), (1, 2), (0, 2). Der a-Punkt (1, 4) trägt die Indizes 0 bis 2 mit d_p = 2.

SHA-256 der Zeile unten (ohne Zeilenende), gespeichert als `L.json`: `9be20eaba63bf5e54e2b51e12c954f505725e699f30d10a8862254beb5822ef7`

```json
{"a1": [1, 1, 1, 2, 4, 3, 2, 2, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 4, 4, 3, 3, 3, 4, 4, 2, 0, 1, 1, 2, 2, 1, 0, 0], "a2": [4, 4, 4, 0, 2, 3, 2, 2, 3, 3, 1, 1, 3, 3, 4, 4, 1, 1, 0, 0, 4, 4, 0, 4, 4, 3, 0, 0, 0, 1, 1, 2, 2, 2], "w": [2829, 1215, 25429, 10736, 18144, 20286, 5057, 6297, 28302, 8855, 13927, 10041, 13949, 5538, 13809, 11143, 24622, 7330, 10338, 12335, 550, 14617, 19883, 11266, 22878, 18237, 21047, 17331, 11334, 0, 0, 0, 0, 0], "u": [31195, 24932, 7936, 10791, 16193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20551, 20745, 12770, 15763, 13696], "P": 32003}
```
