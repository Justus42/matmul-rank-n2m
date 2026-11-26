# S4-07: Struktur der starren Lage bei Länge 34 und Versuch, daraus ein Verfahren für ⟨3,2,7⟩ zu bauen

- Auftrag: S4-07, Stufe 4, Runde 2, Spur A in Gegenrichtung (Protokoll 0.6, Abschnitt 3). Rolle: Beweissucher.
- Datum: 26.11.2026. Beginn und Ende stehen in den Git-Zeitstempeln dieses Zweigs (`claude/project-thread-lini7y`).
- **Status aller Aussagen dieser Datei: behauptet oder ausdrücklich vermutet.** Den Status setzt nur der Orchestrator. Die beiden Wörter, die das Protokoll dem Status geprüft vorbehält, kommen nicht vor.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md`, `STATUS.md`, `LOG.md` (Ende), `versuche/s4-blind-r1.md`, `erkundung/s3-08-einschaetzung-327.md`, Ausschnitte aus `erkundung/s3-03-restfaelle-327.md` und `erkundung/s3-04-restfaelle-327.md` (Abschnitte zu R-327), `behauptungen/B-017.md` bis `B-019.md`, Anfang der Prüfberichte `lean/prosa/s4_327_bericht_s4-01.md` bis `s4-03.md` (Offenlegung und Urteile im Logbuch), `lean/prosa/yang_n3.md`, `lean/prosa/yang_n4.md`, `verfahren/README.md` (Anfang), `behauptungen/B-001.md`, `behauptungen/B-006.md` und die Statuszeilen von `pruefvermerke/B-001.md` und `pruefvermerke/B-006.md` (für die benutzten Ränge von ⟨3,2,5⟩ und ⟨3,2,6⟩). Benutzt als Rechendaten: `verfahren/3x2x5-r25-hk71.json`, `verfahren/3x2x6-r30-hk71.json`, `verfahren/3x2x7-r35-hk71.json`. Keine Datei, die in Runde 2 neu entstanden ist.
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Kein Lean.
- Offenlegung: Eingeblendet wurden mir der Index des Projektgedächtnisses und die Einzeleinträge `hk-verfahren-a10`, `verfahren-randfaelle-s1-04`, `verfahren-datenformat` und `git-regeln` (Datei- und Formathinweise, kein Urteil zu R-327). Ich habe sie nicht für die Mathematik benutzt.

---

## 0. Ergebnis in Kürze

**Ein Verfahren der Länge 34 habe ich nicht gebaut.** Der Bau scheitert an einer linearen Bedingung, die ich (D′) nenne. Sie ist notwendig für jedes Verfahren der Länge 34 und lässt sich aus dem Restfall heraus genau angeben. In allen geprüften Lagen ist sie verletzt. Daraus wird ein **bedingter Ausschluss**: Unter einer zusätzlichen Annahme (e = 3 und Injektivität (INJ5), Abschnitt 6) gibt es kein Verfahren. Die beiden offenen Annahmen sind der Ansatzpunkt für einen vollständigen Ausschluss. Daneben steht ein **unbedingtes Teilergebnis** (Satz X), das über jedem Körper gilt.

### 0.1 Aussagen im Wortlaut, die ich für gezeigt halte (Status behauptet)

Bezeichnungen: siehe Abschnitt 1. „Normalform“ heißt: nach R1 (algebraisch abgeschlossener Körper), R2, Lemma A aus `yang_n3.md` und der Skalierung α_t(e_{00}) = 1 (Abschnitt 1.1).

**Aussage S4-07-A (Umformulierung).** Seien α_t, β_t (t = 1, …, r) Linearformen auf K^{3×2} bzw. K^{2×m}. Schreibe a_i(t) = α_t(e_{i0}), b_i(t) = α_t(e_{i1}), p_k(t) = β_t(e_{0k}), q_k(t) = β_t(e_{1k}) als Vektoren in K^r und · für das komponentenweise Produkt. Für einen Unterraum K′ ⊆ K^r der Dimension r − 3m gibt es genau dann Matrizen C_t mit AB = Σ_t α_t(A)β_t(B)C_t und ker W = K′, wenn gilt: (A) a_i·q_k ∈ K′, (B) b_i·p_k ∈ K′, (C) a_i·p_k − b_i·q_k ∈ K′ für alle i, k, und (D) die 3m Vektoren b_i·q_k sind linear unabhängig modulo K′.

**Aussage S4-07-B (Zerlegungssatz).** In jeder Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ im Restfall R-327 gilt mit K′ = ker W, J = span(q_1, …, q_7), K″ := K′ + a_1·K′ + a_2·K′:
 (i) K^34 = K″ + b_0·K′, insbesondere dim K″ ≥ 21.
 (ii) Es gibt w ∈ J mit w·P_2 ⊆ J und w·P_1 = f_0(N), dim w·P_1 = 3 (P_d = Polynome vom Grad ≤ d in a_1, a_2, als Vektoren in K^34).
 (iii) Für die 8-dimensionale Menge J³_0 := {(j_0, j_1, j_2) ∈ J³ : j_0 + a_1·j_1 + a_2·j_2 = 0} ist die Abbildung Θ(j) := c_1·j_1 + c_2·j_2 mit c_i := b_i − a_i·b_0 injektiv modulo K′, und K′ ⊕ Θ(J³_0) ⊆ K″. Das ist Bedingung (D′).

**Aussage S4-07-C (Gestalt im Fall e = 3).** Ist in einer solchen Normalform dim w·P_2 = 6 („e = 3“), dann gilt: J = w·P_2 ⊕ ⟨u⟩ für ein u ∈ J, K′ = w·P_3 ⊕ u·P_1 mit dim w·P_3 = 10, K″ = w·P_4 ⊕ u·P_2 mit dim 15 + 6 = 21, K^34 = K″ ⊕ b_0·K′. In geeigneten Basen von U/N ≅ S² ⊕ K und Q ≅ S³ ⊕ S¹ (S^d = binäre Formen vom Grad d) sind F_1 und F_2 die Multiplikation mit den Variablen x bzw. y; das Büschel s·F_1 + t·F_2 hat die Kronecker-Gestalt L^T_3 ⊕ L^T_1, jede Kombination ≠ 0 hat Rang 4 und Kern N. Höchstens 6 Produkte liegen außerhalb des Trägers von w, sie sitzen auf höchstens 3 verschiedenen Punkten (a_1, a_2), und mindestens 28 Produkte liegen im Träger von w.

**Aussage S4-07-D (bedingter Ausschluss).** In der Lage von S4-07-C gibt es kein Verfahren der Länge 34, falls zusätzlich gilt: (INJ5) aus w·F + u·G = 0 (als Vektor in K^34) mit deg F ≤ 5 und deg G ≤ 3 folgt F = 0 und G = 0. Gleichwertig gesagt: Jedes Verfahren der Länge 34 für ⟨3,2,7⟩ hat in jeder Normalform e ≤ 2, oder es verletzt (INJ5).

**Aussage S4-07-E (Satz X, über jedem Körper).** Sei K ein beliebiger Körper und AB = Σ_{t=1}^{34} α_t(A)β_t(B)C_t ein Verfahren für ⟨3,2,7⟩ über K. Dann gibt es zu jedem Zeilenvektor h ∈ K^{1×7}, h ≠ 0, höchstens **zwei** Indizes t, für die β_t die Form β_t(B) = s_t·B·h^T mit s_t ∈ K^{1×2} hat. Insbesondere entsteht kein Verfahren der Länge 34 dadurch, dass man ein Verfahren der Länge 30 oder 31 für ⟨3,2,6⟩ um 4 bzw. 3 Produkte ergänzt, die nur die siebte Spalte von B lesen.

### 0.2 Vermutet (Rechnung, kein Beweis)

**Vermutung S4-07-V.** Im Fall e = 3 hat das lineare System (C) auch ohne (INJ5) nur die trivialen Lösungen aus Abschnitt 6.2; dann gibt es im Fall e = 3 kein Verfahren der Länge 34. Beleg: In 39 772 zulässigen Lagen über GF(32003), darunter 14 897 mit verletzter (INJ5), hat (C) nur triviale Lösungen und (D′) Rang 0 statt 8 (Abschnitt 7). Die Gegenprobe an echten Verfahren (3×2×6 mit 30, 3×2×7 mit 35, 3×2×5 mit 25) liefert dort den vollen Rang, das Prüfverfahren ist also nicht blind.

### 0.3 Lücken (ausdrücklich)

- **L-1:** Der Fall e ≤ 2 (die Punkte des Trägers von w liegen auf einem Kegelschnitt oder in noch speziellerer Lage) ist nur durch eine Stichprobe (Abschnitt 7.2) berührt, nicht behandelt.
- **L-2:** Im Fall e = 3 fehlt der Schritt von (INJ5) zu allen Lagen (Vermutung S4-07-V).
- **L-3:** Alles in den Abschnitten 2 bis 6 setzt den Restfall R-327 voraus, also B-017 bis B-019 (Status behauptet, von je einem Prüfer bestätigt). Satz X (S4-07-E) setzt R-327 nicht voraus, wohl aber R(⟨3,2,6⟩) = 30 (B-006).
- **L-4:** Bedingung (B) habe ich für den Ausschluss nicht gebraucht. Sie ist eine weitere, ungenutzte Einschränkung.

Ein Verfahren lege ich deshalb nicht bei. Der Zahlbereich aller Rechnungen ist GF(32003) (Primzahl), exakt in ganzen Zahlen gerechnet.

---

## 1. Bezeichnungen und Normalform

### 1.1 Normalform

Gegeben sei ein Verfahren AB = Σ_{t=1}^{34} α_t(A)β_t(B)C_t über einem Körper K. Nach R1 und R2 aus `yang_n3.md` (Körpererweiterung auf den algebraischen Abschluss, Streichen von Nullformen; die Länge wird dabei nicht größer, und da 34 die untere Schranke ist, bleibt sie 34) und Lemma A (starke Normalisierung) gilt (SN1) α_t(e_{00}) ≠ 0 für alle t und (SN2). Nach B-017 liegt dann jede solche Normalform im Restfall R-327: (ρ, rk L, rk H) = (4, 6, 4), s = 0, dim N = 3, Δ = 2, dim S = 1.

**Skalierung.** Ersetze α_t durch α_t / α_t(e_{00}) und C_t durch α_t(e_{00})·C_t. Das ist wieder ein Verfahren. Alle Räume aus `yang_n3.md` gehen dabei durch die invertierbare Diagonalmatrix D(e_{00})^{−1} über (f_i ↦ D^{−1} f_i, ker W ↦ D^{−1} ker W, J ↦ D^{−1} J), also bleiben alle Dimensionen und der Restfall erhalten, ebenso (SN2). **Ab hier gilt a_0 := (α_t(e_{00}))_t = (1, …, 1).**

### 1.2 Vektoren und Räume

Alle Vektoren liegen in K^34 und werden als Funktionen auf der Indexmenge T = {1, …, 34} der Produkte gelesen. „·“ ist das komponentenweise Produkt.

- a_i := (α_t(e_{i0}))_t, b_i := (α_t(e_{i1}))_t für i = 0, 1, 2. Also a_0 = 1. Für jedes t ist α_t die 3×2-Matrix mit Spalten a(t) = (1, a_1(t), a_2(t)) und b(t) = (b_0(t), b_1(t), b_2(t)). Den Punkt (a_1(t), a_2(t)) ∈ K² nenne ich den **a-Punkt** von t.
- q_k := (β_t(e_{1k}))_t, p_k := (β_t(e_{0k}))_t für k = 1, …, 7. Für y ∈ K^7: j_y := Σ y_k q_k, π_y := Σ y_k p_k.
- In der Sprache von `yang_n3.md`: f_0(x) = ℬ(x), also für x = (0; y) ∈ U: f_0(x) = j_y. Damit **J = f_0(U) = span(q_1, …, q_7)**, dim J = 7 (G4). Weiter f_i(x) = a_i·f_0(x), F_i(x) = [a_i·j_y] ∈ Q.
- W : K^34 → K^{3×7}, W(v) = Σ_t v_t C_t, **K′ := ker W**, dim K′ = 34 − 21 = 13.
- P_d := span{a_1^μ a_2^ν : μ + ν ≤ d} ⊆ K^34 (Polynome vom Grad ≤ d in den a-Koordinaten, ausgewertet an den 34 a-Punkten). Für einen Vektor v ist v·P_d = {v·f : f ∈ P_d}.
- K″ := K′ + a_1·K′ + a_2·K′.
- c_i := b_i − a_i·b_0 für i = 1, 2 (und c_0 = 0).

Aus R-327 übernehme ich (S3-03, Abschnitt 6, S3-04, Abschnitt 5.1, behauptet): rk L = 6 = dim Q, also **K′ = J + a_1·J + a_2·J** (Ĵ = ker W); dim N = 3 und N = {y : a_1·j_y ∈ J und a_2·j_y ∈ J}; dim S = 1 mit S = span(v) und f_0(N) = span(f_0(v), f_1(v), f_2(v)).

---

## 2. Umformulierung der Brent-Gleichungen (Aussage S4-07-A)

Setzt man in AB = Σ_t α_t(A)β_t(B)C_t die Basismatrizen ein, erhält man vier Gruppen:

- A = e_{i0}, B = e_{1k}: (e_{i0}e_{1k} = 0) W(a_i·q_k) = 0, also **(A) a_i·q_k ∈ K′**.
- A = e_{i1}, B = e_{0k}: (e_{i1}e_{0k} = 0) **(B) b_i·p_k ∈ K′**.
- A = e_{i0}, B = e_{0k}: W(a_i·p_k) = e_{ik} (Matrix mit 1 an der Stelle (i, k)).
- A = e_{i1}, B = e_{1k}: W(b_i·q_k) = e_{ik}.

Aus den letzten beiden folgt **(C) a_i·p_k − b_i·q_k ∈ K′**, und weil W surjektiv auf K^{3×7} abbildet und die 21 Bilder e_{ik} eine Basis sind, gilt **(D) die 21 Vektoren b_i·q_k sind linear unabhängig modulo K′**, und K′ ⊕ span(b_i·q_k) = K^34.

Umgekehrt: Gelten (A) bis (D) für einen Unterraum K′ der Dimension 13, so definiert man W auf K′ als 0 und auf b_i·q_k als e_{ik}. Dann gelten alle vier Gruppen, also ist (α, β, C) mit C_t := W(e_t) ein Verfahren mit ker W = K′. Die Gleichungen sind bilinear in (A, B), deshalb genügen die Basismatrizen. ∎

Für i = 0 sagt (C): p_k − b_0·q_k ∈ K′. Ich schreibe **p_k = b_0·q_k + κ_k mit κ_k ∈ K′** und κ(j_y) := Σ y_k κ_k. Für i = 1, 2 wird (C) dann zu

  **(C′) c_i·j ≡ a_i·κ(j) (mod K′) für alle j ∈ J, i = 1, 2, mit derselben linearen Abbildung κ : J → K′.**

(Rechnung: a_i·p_k − b_i·q_k = a_i·b_0·q_k + a_i·κ_k − (c_i + a_i·b_0)·q_k = a_i·κ_k − c_i·q_k.)

Bei festem (a, J, K′) ist (C′) ein **lineares** Gleichungssystem in den Unbekannten (c_1, c_2, κ). b_0 kommt darin nicht vor.

---

## 3. Struktur im Restfall (Aussage S4-07-B)

### 3.1 Der Vektor w

Sei v ∈ S, v ≠ 0, und w := j_v = f_0(v). Dann f_i(v) = a_i·w, also f_0(N) = span(w, a_1·w, a_2·w) = w·P_1, und dim w·P_1 = 3 nach (SN2). Weil jedes x ∈ N die Bedingung a_i·j_x ∈ J erfüllt, gilt a_i·(w·P_1) ⊆ J, also **w·P_2 ⊆ J**. Ich setze **e := dim(w·P_2) − 3 ∈ {0, 1, 2, 3}**.

e = 0 ist unmöglich: Dann wäre w·P_2 = w·P_1 = f_0(N), also a_i·f_0(N) ⊆ f_0(N) und damit S = N, im Widerspruch zu dim S = 1 < 3 = dim N.

### 3.2 Der Zerlegungssatz K^34 = K″ + b_0·K′

Aus (D) gilt K^34 = K′ + Σ_{i=0}^{2} b_i·J. Für j ∈ J ist nach (C′) b_i·j = c_i·j + a_i·b_0·j ∈ K′ + a_i·K′ + b_0·(a_i·J) für i = 1, 2, und b_0·j ∈ b_0·J. Wegen a_0·J + a_1·J + a_2·J = K′ folgt

  **K^34 = K″ + b_0·K′.**

Da dim b_0·K′ ≤ 13, ist **dim K″ ≥ 21**. ∎

### 3.3 Bedingung (D′)

Sei J³_0 := {(j_0, j_1, j_2) ∈ J³ : j_0 + a_1·j_1 + a_2·j_2 = 0}. Die Abbildung J³ → K′, (j_i) ↦ Σ a_i·j_i, ist surjektiv (K′ = J + a_1J + a_2J), also dim J³_0 = 21 − 13 = 8. Für (j_0, j_1, j_2) ∈ J³_0 gilt

  Σ_i b_i·j_i = b_0·(j_0 + a_1·j_1 + a_2·j_2) + c_1·j_1 + c_2·j_2 = c_1·j_1 + c_2·j_2 =: Θ(j).

Nach (D) ist J³ → K^34/K′, (j_i) ↦ [Σ b_i·j_i], injektiv (21 unabhängige Bilder). Also ist **Θ : J³_0 → K^34/K′ injektiv**, dim Θ(J³_0) = 8 und Θ(J³_0) ∩ K′ = 0. Nach (C′) ist c_i·j ∈ K′ + a_i·K′ ⊆ K″, also **K′ ⊕ Θ(J³_0) ⊆ K″**. Das ist (D′). Die Projektion (j_0, j_1, j_2) ↦ (j_1, j_2) bildet J³_0 bijektiv auf ker L ab (L(j_1, j_2) = [a_1·j_1 + a_2·j_2]), denn j_0 ist durch (j_1, j_2) bestimmt. ∎

**(D′) ist die Bedingung, an der der Bau scheitert.** Sie fordert, dass die beiden Vektoren c_1, c_2 (also die zweite Spalte b(t) der α_t, bereinigt um a(t)·b_0(t)) acht neue Richtungen in K″ erzeugen.

---

## 4. Der Fall e = 3 (Aussage S4-07-C)

Sei dim w·P_2 = 6. Wähle u ∈ J mit J = w·P_2 ⊕ ⟨u⟩.

**4.1 K′ und K″.** K′ = J + a_1J + a_2J = w·P_3 + u·P_1, Dimension 13 ≤ dim w·P_3 + 3 ≤ 10 + 3. Also gilt überall Gleichheit: **dim w·P_3 = 10, dim u·P_1 = 3, K′ = w·P_3 ⊕ u·P_1.** Ebenso K″ = w·P_4 + u·P_2, Dimension ≤ 15 + 6 = 21, und nach 3.2 ≥ 21: **K″ = w·P_4 ⊕ u·P_2, dim w·P_4 = 15, dim u·P_2 = 6, K^34 = K″ ⊕ b_0·K′.**

Folgerung: Weil dim w·P_4 = 15, bilden die a-Punkte im Träger von w eine Menge, auf der die Auswertung P_4 → Funktionen injektiv ist (mindestens 15 verschiedene Punkte, nicht auf einer Quartik). Weil dim u·P_2 = 6, liegen im Träger von u mindestens 6 verschiedene a-Punkte, nicht auf einem Kegelschnitt.

Weil die Summen direkt sind und w·P_4 bzw. u·P_2 die volle Dimension haben, darf man in K″ mit Polynomen vom Grad ≤ 4 (Faktor w) und ≤ 2 (Faktor u) wie mit formalen Polynomen rechnen; insbesondere ist K″/K′ ≅ S⁴ ⊕ S² über die homogenen Anteile höchsten Grades (S^d: homogene Formen vom Grad d in a_1, a_2).

**4.2 N, S und ker L.** Sei j = w·φ + c·u ∈ J (φ ∈ P_2). Dann a_i·j = w·a_iφ + c·a_i·u. Liegt das in J = w·P_2 ⊕ ⟨u⟩ ⊆ K′ = w·P_3 ⊕ u·P_1, so muss wegen der Direktheit c·a_i·u ∈ ⟨u⟩ (also c = 0, weil u, a_1u, a_2u unabhängig sind) und a_iφ ∈ P_2 sein. Also f_0(N) = w·P_1 (stimmt mit 3.1 überein), f_0(S) = ⟨w⟩, und

  ker L ≅ {(w·φ_1, w·φ_2) : φ_i ∈ P_2, a_1φ_1 + a_2φ_2 ∈ P_2} = {(w(ℓ_1 + a_2 h), w(ℓ_2 − a_1 h)) : ℓ_i ∈ P_1, h ∈ S¹},

Dimension 3 + 3 + 2 = 8 (die quadratischen Anteile (q_1, q_2) müssen a_1q_1 + a_2q_2 = 0 erfüllen, also q_1 = a_2h, q_2 = −a_1h). **ker L liegt ganz in (w·P_2)²; u kommt darin nicht vor.**

**4.3 Gestalt von F_1, F_2, L, H.** U/N ≅ J/f_0(N) = (w·P_2 ⊕ ⟨u⟩)/w·P_1 ≅ S² ⊕ K und Q = K′/J ≅ S³ ⊕ u·S¹. F_i bildet die Klasse von w·G (G ∈ P_2) auf die Klasse von a_i·w·G ab, das ist im Quotienten der homogene Anteil a_i·G^{(2)} ∈ S³, und u auf u·a_i. **In diesen Basen sind F_1, F_2 die Multiplikation mit x = a_1 bzw. y = a_2: S² → S³ und K → S¹.** Das Büschel s·F_1 + t·F_2 ist die Multiplikation mit s·x + t·y, also für (s, t) ≠ 0 injektiv auf U/N: **jede Kombination ≠ 0 hat Rang 4 und Kern genau N**; die Kronecker-Gestalt ist L^T_3 ⊕ L^T_1 (kein regulärer Teil). L(u_1, u_2) = F_1u_1 + F_2u_2 ist surjektiv (S² ⊗ ⟨x, y⟩ → S³ ist surjektiv, ebenso K² → S¹), H(x) = (F_2x, −F_1x) hat Rang 4. Das passt zu (ρ, rk L, rk H) = (4, 6, 4).

**4.4 Was das für die 34 Produkte heißt.**

1. Jeder Index t liegt im Träger von w oder von u. Sonst verschwänden an t alle Vektoren aus K′ und alle b_i·q_k, im Widerspruch zu K^34 = K′ ⊕ span(b_i·q_k).
2. **Mindestens 28 Produkte liegen im Träger von w:** Die 10 Vektoren w·P_3 ⊆ K′ und die 18 Vektoren b_i·w·G (G ∈ P_2, i = 0, 1, 2) sind nach (D) zusammen linear unabhängig, und alle verschwinden außerhalb des Trägers von w.
3. Sei Z_1 die Menge der Indizes außerhalb des Trägers von w. Nach (D′) liegt u·P_2 ⊆ K″ = K′ ⊕ Θ(J³_0), und alle Vektoren in Θ(J³_0) verschwinden auf Z_1 (ker L ⊆ (w·P_2)²). Eingeschränkt auf Z_1 folgt u·P_2 = u·P_1 dort, also stimmen P_2 und P_1 auf den a-Punkten von Z_1 überein: **Z_1 enthält höchstens 3 verschiedene a-Punkte** (bei 3 Punkten nicht kollinear). Eingeschränkt auf Z_1 ist K^{Z_1} = (K″ + b_0·K′)|_{Z_1} = u·(P_1 + b_0·P_1)|_{Z_1}, auf jeder Faser eines a-Punkts also höchstens 2-dimensional: **|Z_1| ≤ 6**, und zwei Produkte derselben Faser haben verschiedene b_0. Auf Z_1 ist q_t = u(t)·e_7 in der Basis q_1, …, q_6 = w·(1, a_1, a_2, a_1², a_1a_2, a_2²), q_7 = u: Diese Produkte lesen die Zeile 1 von B nur in einer Richtung.
4. Weil der Träger von u mindestens 6 a-Punkte ohne gemeinsamen Kegelschnitt braucht und Z_1 höchstens 3 davon enthält, **teilen sich die Träger von w und u mindestens 3 verschiedene a-Punkte.**
5. Bild in Lemma B und H: S = ⟨v⟩ mit j_v = w; ker L = N² + σ(N) mit σ(w·ℓ) = (a_2·w·ℓ, −a_1·w·ℓ), passend zu 4.2 (h ↔ σ).

---

## 5. Satz X: höchstens zwei Produkte je Richtung (Aussage S4-07-E)

Dieser Abschnitt braucht den Restfall nicht und gilt über jedem Körper K.

**Voraussetzungen.** R_K(⟨3,2,6⟩) = 30 (B-006, laut Prüfvermerk geprüft), R_K(⟨3,2,1⟩) = 6 (⟨3,2,1⟩ ist die Identität auf K^6 = K^{3×2}, ihre Abflachung K^6 → K^2 ⊗ K^3 hat Rang 6).

**Beweis.** Ersetze β_t(B) durch β_t(B·G) und C_t durch C_t·G^{−1} mit G ∈ GL_7. Das ist wieder ein Verfahren (Σ_t α_t(A)β_t(BG)C_tG^{−1} = ABGG^{−1} = AB), und die Form s·B·h^T wird zu s·B·(h·G^T)^T. Wähle G mit h·G^T = e_7; dann sei h = e_7, also H := {Spalten 1 bis 6}. Schreibe B = [B_H | b] mit b ∈ K² (Spalte 7), β_t(B) = β^H_t(B_H) + σ_t·b und C_t = [C^H_t | x_t] mit x_t ∈ K³. Die Identität zerfällt in

 (i) Σ_t α_t(A) β^H_t(B_H) C^H_t = A·B_H,
 (ii) Σ_t α_t(A) β^H_t(B_H) x_t = 0,
 (iv) Σ_t α_t(A) (σ_t·b) x_t = A·b

(und eine Gleichung (iii) für σ_t·b und C^H_t, die ich nicht brauche). Sei T_H := {t : β^H_t ≠ 0}; n := 34 − |T_H| ist die Zahl der t mit β_t = s_t·B·e_7^T. Sei V^⊥ := {λ ∈ K^{T_H} : Σ_{t∈T_H} λ_t α_t ⊗ β^H_t = 0} mit d := dim V^⊥.

(a) Nach (i) ist Σ_{t∈T_H} α_t ⊗ β^H_t ⊗ C^H_t der Tensor ⟨3,2,6⟩. Die Tensoren α_t ⊗ β^H_t spannen einen Raum der Dimension |T_H| − d auf; drückt man die übrigen durch eine Basis aus ihnen aus, erhält man ein Verfahren der Länge |T_H| − d. Also |T_H| − d ≥ 30, das heißt **d + n ≤ 4**.

(b) (ii) besagt: für jede Zeile i′ liegt der Vektor (x_t[i′])_{t∈T_H} in V^⊥. Mit einer Basis λ^1, …, λ^d von V^⊥ ist also x_t = Σ_l λ^l_t μ_l für t ∈ T_H mit festen μ_l ∈ K³. Damit wird der Anteil von T_H in (iv) zu Σ_l (Σ_t λ^l_t α_t ⊗ σ_t) ⊗ μ_l. Jedes N_l := Σ_t λ^l_t α_t ⊗ σ_t ∈ K^6 ⊗ K² hat Matrixrang ≤ 2, also Tensorrang ≤ 2 nach Multiplikation mit μ_l. Die übrigen n Produkte tragen je einen Rang-1-Tensor bei. Da (iv) der Tensor ⟨3,2,1⟩ ist: **6 ≤ 2d + n**.

Aus (a) und (b): 6 ≤ 2(4 − n) + n = 8 − n, also **n ≤ 2**. ∎

Zusatz: n = 2 erzwingt d = 2; n = 1 erzwingt d = 3; n = 0 erlaubt d ∈ {3, 4}. Für den Bau heißt das: Ein Verfahren der Länge 34 ist nie „ein 30er-Verfahren für 3×2×6 plus 4 Produkte für die siebte Spalte“ (dort wäre n = 4) und nie „31 plus 3“. Die Sätze 4.4.3 und X passen zusammen: Die höchstens 6 Produkte in Z_1 haben q_t ∝ e_7, aber p_t ist frei, sie sind also nicht von der Form s·B·h^T, solange p_t nicht ebenfalls ∝ e_7 ist.


## 6. Der bedingte Ausschluss (Aussage S4-07-D)

### 6.1 Triviale Lösungen von (C′) verletzen (D′) (gilt für jedes e)

Für beliebige ℓ_1, ℓ_2, μ ∈ P_1 lösen

- c_i = ℓ_i mit κ = 0 (denn ℓ_i·J ⊆ P_1·J = K′), und
- c_i = a_i·μ mit κ(j) = μ·j (denn μ·J ⊆ K′ und c_i·j − a_i·κ(j) = 0)

das System (C′), dazu jedes κ mit Werten in J und c = 0. Ich nenne die Summen solcher Lösungen **trivial**. Für eine triviale Lösung, also c_i = ℓ_i + a_i·μ, und (j_0, j_1, j_2) ∈ J³_0 gilt

  Θ(j) = ℓ_1·j_1 + ℓ_2·j_2 + μ·(a_1·j_1 + a_2·j_2) = ℓ_1·j_1 + ℓ_2·j_2 − μ·j_0 ∈ P_1·J = K′.

Also Θ(J³_0) ⊆ K′, im Widerspruch zu (D′) (dort dim Θ(J³_0) = 8 und Θ(J³_0) ∩ K′ = 0). **Ein Verfahren der Länge 34 braucht also eine nicht triviale Lösung von (C′).**

Bedeutung für die Produkte: c trivial heißt b_i = c_i + a_i·b_0 = ℓ_i(a) + a_i·(μ(a) + b_0). Mit s(t) := μ(a(t)) + b_0(t) und der festen 3×3-Matrix M mit den Zeilen (−μ, ℓ_1, ℓ_2) (als Linearformen in (1, a_1, a_2)) ist das

  **b(t) = (M + s(t)·I)·a(t) für alle t,**

das heißt, die zweite Spalte jedes α_t entsteht aus der ersten durch eine für alle Produkte gemeinsame Matrix M, bis auf ein Vielfaches der ersten Spalte. Genau diese Gestalt ist ausgeschlossen (auf dem Träger von w genügt es, siehe 6.2).

### 6.2 Unter (INJ5) sind im Fall e = 3 alle Lösungen trivial auf dem Träger von w

Voraussetzungen: e = 3 (Abschnitt 4) und (INJ5): aus w·F + u·G = 0 mit deg F ≤ 5, deg G ≤ 3 folgt F = G = 0.

Sei (c_1, c_2, κ) eine Lösung von (C′), i ∈ {1, 2}.

1. w ∈ J, also c_i·w ≡ a_i·κ(w) mod K′, also c_i·w ∈ K″ = w·P_4 ⊕ u·P_2. Schreibe eindeutig c_i·w = w·C_i + u·E_i mit deg C_i ≤ 4, deg E_i ≤ 2.
2. w·a_1 ∈ J, also ebenso c_i·w·a_1 = w·(a_1C_i) + u·(a_1E_i) ∈ K″, also = w·C′ + u·E′ mit deg C′ ≤ 4, deg E′ ≤ 2. Die Differenz w·(a_1C_i − C′) + u·(a_1E_i − E′) = 0 hat Grade ≤ 5 und ≤ 3. Nach (INJ5) ist a_1C_i = C′ und a_1E_i = E′ als Polynome, also deg C_i ≤ 3 und deg E_i ≤ 1.
3. w·a_1² ∈ J: dasselbe mit a_1²C_i (Grad ≤ 5) und a_1²E_i (Grad ≤ 3) ergibt deg C_i ≤ 2 und E_i konstant.
4. Für G ∈ P_2 ist w·G ∈ J und c_i·w·G = w·(C_iG) + u·(E_iG) mit Graden ≤ 4 und ≤ 2. Schreibe κ(w·G) = w·F_G + u·g_G (deg F_G ≤ 3, deg g_G ≤ 1). (C′) sagt: w·(C_iG − a_iF_G) + u·(E_iG − a_ig_G) ∈ K′ = w·P_3 ⊕ u·P_1. Wegen 4.1 heißt das für die homogenen Anteile höchsten Grades: C_i^{(2)}·G^{(2)} = a_i·F_G^{(3)} und E_i·G^{(2)} = a_i·g_G^{(1)}, für i = 1 und i = 2 mit denselben F_G, g_G.
5. Mit G = a_1² gilt C_1^{(2)}·a_1² = a_1·F und C_2^{(2)}·a_1² = a_2·F (F := F_G^{(3)}). Multipliziert man die erste Gleichung mit a_2 und die zweite mit a_1, folgt a_1²·(a_2·C_1^{(2)} − a_1·C_2^{(2)}) = 0, im Polynomring K[a_1, a_2] also a_2·C_1^{(2)} = a_1·C_2^{(2)}. Damit teilt a_1 die Form C_1^{(2)}: C_1^{(2)} = a_1·h und C_2^{(2)} = a_2·h mit einer Linearform h (h = 0 erlaubt). Ebenso folgt aus E_1·a_1² = a_1·g und E_2·a_1² = a_2·g die Gleichung a_2·E_1 = a_1·E_2 mit Konstanten E_i, also E_1 = E_2 = 0.
6. Damit c_i·w = w·(a_i·h + ℓ_i) mit ℓ_i := C_i − C_i^{(2)} ∈ P_1, also **c_i = a_i·h + ℓ_i auf dem Träger von w**.

Abschluss: Nach 4.2 liegen alle (j_1, j_2) aus ker L in (w·P_2)², verschwinden also außerhalb des Trägers von w. Dort, wo sie nicht verschwinden, ist c_i = a_i·h + ℓ_i, also Θ(j) = h·(a_1j_1 + a_2j_2) + ℓ_1j_1 + ℓ_2j_2 ∈ h·J + P_1·J ⊆ K′. Widerspruch zu (D′) wie in 6.1. ∎

**Wo genau scheitert der Bau:** an (D′). In jeder Lage, in der (C′) nur triviale Lösungen hat, ist Θ(J³_0) ⊆ K′ statt 8-dimensional neben K′.

---

## 7. Bauversuch durch Rechnung

### 7.1 Vorgehen

Der Zerlegungssatz macht aus der Suche nach 34 Produkten eine Suche nach einer Punktlage: Man wählt die 34 a-Punkte und die Vektoren w, u, setzt J := w·P_2 ⊕ ⟨u⟩ und K′ := J + a_1J + a_2J (Fall e = 3, im Fall e = 2 statt u zwei Vektoren), prüft die erzwungenen Dimensionen (dim J = 7, dim K′ = 13, dim K″ ≥ 21, dim N = 3) und löst dann das **lineare** System (C′) in (c_1, c_2, κ). Für eine zufällige Lösung (zwei bis drei Versuche) wird der Rang von Θ auf J³_0 modulo K′ bestimmt. Ein Verfahren verlangt Rang 8. Erst danach kämen b_0 und die quadratische Bedingung (B). So weit kam keine Lage.

Rechnung exakt über GF(32003) in 64-Bit-Ganzzahlen (Gauß-Elimination modulo p, Code in Anhang A). Ein Verfahren über GF(32003) wäre kein Widerspruch zur Literatur (die Schranke 34 gilt über jedem Körper) und hätte die Frage beantwortet.

**Gegenprobe an echten Verfahren.** Dasselbe Programm (ohne die w-u-Ansatzform, mit J und K′ aus dem echten Verfahren nach zufälligem Basiswechsel und Skalierung) auf `verfahren/3x2x7-r35-hk71.json` und `verfahren/3x2x6-r30-hk71.json`: Rang von Θ = 7 = dim J³_0 bzw. 6 = dim J³_0, also voller Rang, dim V_C = 77 bzw. 60. Für `3x2x5-r25-hk71.json` ergibt die direkte Rechnung Rang 5 = dim J³_0. Die Bedingung (D′) ist also bei echten Verfahren erfüllt und das Prüfverfahren findet nicht triviale Lösungen, wo es sie gibt. Nebenbefund: In den echten Verfahren liegen die 30 bzw. 35 Produkte auf nur 9 bzw. 17 verschiedenen a-Punkten (Produkte mit α_t vom Rang 1 sitzen in gemeinsamen Punkten).

### 7.2 Ergebnisse

| Block | Lagen | zulässig (Dimensionen wie im Restfall) | dim V_C | Rang Θ (gebraucht 8) |
|---|---|---|---|---|
| Familien (fam.py, Startwerte 11, 12) | 22 | 20 mit dim K′ = 13 | 57 | 0 |
| Block 1 (search1.py, 4 × 240 s, 4 Kerne) | 88 692 | 24 875 | immer 57 | immer 0 |
| Block 2 (noninj.py, 4 × 150 s, 4 Kerne) | 27 044 | 14 897 (alle mit verletzter (INJ5)) | immer 57 | immer 0 |

Die Familien: allgemeine Punkte mit vollen oder teilweisen Trägern; 15 bzw. 17 a-Punkte mit Fasern (mehrere Produkte im selben Punkt); Z_1 auf 3 Punkten mit Überlappung; Punkte auf Graphen y = f(x) vom Grad 3, 4, 5; drei Häufungen zu je 4 Produkten (wie bei Rang-1-α in den echten Verfahren); Fall e = 2 (Träger von w auf einem Kegelschnitt, zwei weitere Vektoren statt u). Block 1: a-Punkte aus kleinen Gittern {0, …, g−1}² (g = 3 bis 6) mit 12 bis 25 verschiedenen Punkten und Fasern, Träger von w und u zufällig verkleinert, w und u zufällig oder 1. Block 2: Lagen, in denen (INJ5) absichtlich verletzt ist: Der Träger von w ohne u liegt auf einer Kurve F = 0 (Graph einer Quintik, Quartik oder Kubik), Z_1 (bis zu 6 Produkte auf bis zu 3 Punkten) auf G = 0, und auf der Überlappung ist w = −u·G/F gesetzt, so dass w·F + u·G = 0 gilt. Die Lagen, in denen die Relation schon in w·P_4 + u·P_2 fällt, verwirft die Dimensionsprüfung (dim K″ < 21).

**dim V_C = 57 ist genau die triviale Lösungsmenge:** 49 Dimensionen κ mit Werten in J bei c = 0, dazu 8 Dimensionen für c = (ℓ_1 + a_1μ, ℓ_2 + a_2μ). Das habe ich an einer Lage nachgerechnet (vc.py): Die Projektion von V_C auf (c_1, c_2) hat Rang 8 und liegt in P_1² + {(a_1μ, a_2μ)}.

Rechenaufwand: Block 1 von 07:58 bis 08:03 UTC, Block 2 von etwa 08:03 bis 08:06 UTC. Block 2 startete kurz vor dem Zwischencommit (08:04 UTC), nicht danach. Ich zähle beide deshalb als einen Block: etwa 8½ Minuten auf höchstens 4 Kernen, unter der Grenze von 30 Minuten. Die Familien und Gegenproben jeweils unter einer Sekunde.

### 7.3 Bewertung

Die Rechnung baut kein Verfahren und schließt keines aus. Sie zeigt nur: In allen Lagen, die ich erzeugen konnte, scheitert der Bau an (D′), und zwar schon an der linearen Bedingung (C′), bevor (B) überhaupt ins Spiel kommt. Das stützt Vermutung S4-07-V. Die Stichprobe ist nicht erschöpfend: Lagen, in denen (INJ5) auf andere Weise verletzt ist als in Block 2, oder Lagen mit e ≤ 2 außerhalb der einen Familie, sind nicht systematisch erfasst.

---

## 8. Ansatzpunkte für einen Ausschluss

1. **(INJ5) loswerden (Lücke L-2).** In 6.2 wird (INJ5) nur in den Schritten 2 und 3 gebraucht, um aus c_i·w·a_1 ∈ K″ und c_i·w·a_1² ∈ K″ auf deg C_i ≤ 2 zu schließen. Ohne (INJ5) gibt es eine Relation w·F + u·G = 0 mit (deg F, deg G) = (5, ≤ 3) oder (≤ 5, 3). Zwei Wege bieten sich an: (a) Die Starrheit gilt in **jeder** allgemeinen Richtung der Spalten von A, also auch für die Punkte a(t) + λ·b(t) bei allgemeinem λ (Abschnitt 1.1 lässt sich in jeder solchen Richtung durchführen). Eine Relation vom Grad 5 müsste dann für alle λ bestehen. (b) Bedingung (B) (b_i·p_k ∈ K′) ist noch ungenutzt (Lücke L-4).
2. **Fall e ≤ 2 (Lücke L-1).** e = 2 heißt: Die a-Punkte im Träger von w liegen auf einem Kegelschnitt. Dann ist w·P_d die Auswertung binärer Formen vom Grad 2d (Dimension 2d + 1) und J = w·P_2 ⊕ C mit dim C = 2; die Dimensionen 13 und 21 lassen das zu. Der Beweis aus 6.2 müsste dort mit binären Formen neu geführt werden. e = 1 verlangt, dass P_2 auf diesen Punkten nur 4-dimensional ist, etwa viele Punkte auf einer Geraden und einer außerhalb.
3. **Satz X mit dem Zerlegungssatz verbinden.** Satz X zählt Produkte mit β_t vom Rang 1. Nach 4.4.3 haben bis zu 6 Produkte q_t ∝ e_7. Eine ähnliche Einschränkungsrechnung in der Zeile 1 von B (nicht in einer Spalte) könnte |Z_1| weiter drücken.

---

## 9. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Installiert: das Python-Paket `python-sat` (pip), am Ende **nicht benutzt** (eine SAT-Suche über GF(2) für den Fall „30 + 4“ wurde durch Satz X überflüssig).
- Rechenblöcke: zwei Läufe, die als ein Block zählen (Abschnitt 7.2), zusammen etwa 8½ Minuten auf höchstens 4 Kernen.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs.

---

## Anhang A: Programme (Python 3, numpy, keine Gleitkommazahlen)

Alle Programme rechnen in ganzen Zahlen modulo p = 32003. Aufrufe, aus einem Verzeichnis mit allen Dateien: `python3 sanity.py verfahren/3x2x7-r35-hk71.json verfahren/3x2x6-r30-hk71.json` (Gegenprobe), `python3 struk.py <Verfahrensdatei>`, `python3 fam.py 11` und `python3 fam.py 12` (Familien), `python3 search1.py <Startwert> 240` für die Startwerte 1 bis 4 (Block 1), `python3 noninj.py <Startwert> 150` für die Startwerte 1 bis 4 (Block 2), `python3 vc.py`. Ausgaben der Läufe stehen in Abschnitt 7.2. Die Laufzeitgrenze in search1.py und noninj.py macht die Zahl der Versuche maschinenabhängig; die Verteilung der Ergebnisse nicht.

Ausgaben der Gegenprobe (sanity.py, Tupel = dim V_C, dim J³_0, Rang Θ):

```
3x2x7-r35-hk71.json (77, 7, 7)
3x2x6-r30-hk71.json (60, 6, 6)
```

Ausgaben von Block 1 und 2 (wörtlich):

```
seed 1 trials 22269 valid 6256 stats(dimVC,maxrank): {(57, 0): 6256} best 0
seed 2 trials 22250 valid 6206 stats(dimVC,maxrank): {(57, 0): 6206} best 0
seed 3 trials 22563 valid 6266 stats(dimVC,maxrank): {(57, 0): 6266} best 0
seed 4 trials 21610 valid 6147 stats(dimVC,maxrank): {(57, 0): 6147} best 0
seed 1 trials 6647 {(57, 0): 3720, 'K<13': 729, 'K2<21': 2192}
seed 2 trials 6901 {'K<13': 769, (57, 0): 3729, 'K2<21': 2396}
seed 3 trials 6789 {'K<13': 728, (57, 0): 3741, 'K2<21': 2314}
seed 4 trials 6707 {(57, 0): 3707, 'K2<21': 2250, 'K<13': 745}
```

### ff.py (Gauß-Elimination modulo p = 32003)

SHA-256 `74f266b71f44b430a32dc18c88c851d15c378e649faa2b8a0994cb9171192051`

```python
import numpy as np
P=32003
def rref(M,p=P):
    M=np.array(M,dtype=np.int64)%p
    r=0;piv=[]
    rows,cols=M.shape
    for c in range(cols):
        if r==rows: break
        nz=np.nonzero(M[r:,c])[0]
        if len(nz)==0: continue
        k=r+nz[0]
        if k!=r: M[[r,k]]=M[[k,r]]
        inv=pow(int(M[r,c]),p-2,p)
        M[r]=(M[r]*inv)%p
        others=np.nonzero(M[:,c])[0]
        for o in others:
            if o!=r: M[o]=(M[o]-M[o,c]*M[r])%p
        piv.append(c);r+=1
    return M[:r],piv
def rank(M,p=P):
    if len(M)==0: return 0
    return len(rref(M,p)[1])
def nullspace(M,p=P):
    M=np.array(M,dtype=np.int64)%p
    n=M.shape[1]
    R,piv=rref(M,p)
    free=[c for c in range(n) if c not in piv]
    N=[]
    for f in free:
        v=np.zeros(n,dtype=np.int64);v[f]=1
        for i,c in enumerate(piv): v[c]=(-R[i,f])%p
        N.append(v)
    return np.array(N,dtype=np.int64).reshape(len(N),n)
```

### lib327.py (Polynome P_d als Vektoren (und eine frühe Testfunktion))

SHA-256 `3fd06b96ed39e2e02fcf7dad947a7a0014d4f35218835f9d68cf3e3fe888fefc`

```python
import numpy as np
from ff import *
def polys(a1,a2,d):
    r=len(a1);out=[]
    for tot in range(d+1):
        for i in range(tot+1):
            j=tot-i
            v=np.ones(r,dtype=np.int64)
            for _ in range(i): v=v*a1%P
            for _ in range(j): v=v*a2%P
            out.append(v)
    return out
def analyse(a1,a2,w,u,rng,verbose=True):
    r=len(a1)
    J=np.array([w*f%P for f in polys(a1,a2,2)]+[u])
    Kp=np.array([w*f%P for f in polys(a1,a2,3)]+[u*f%P for f in polys(a1,a2,1)])
    Kpp=np.array([w*f%P for f in polys(a1,a2,4)]+[u*f%P for f in polys(a1,a2,2)])
    info=dict(dimJ=rank(J),dimK1=rank(Kp),dimK2=rank(Kpp))
    Ann=nullspace(Kp)
    A=[a1,a2]
    nun=2*r+7*13
    eqs=[]
    for i in range(2):
        for k in range(7):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*r:(i+1)*r]=Ann*J[k][None,:]%P
            M=(Ann*A[i][None,:]%P)@Kp.T%P
            blk[:,2*r+13*k:2*r+13*(k+1)]=(-M)%P
            eqs.append(blk)
    E=np.vstack(eqs)
    V=nullspace(E)
    info['dimVC']=V.shape[0]
    # (D') rank: ker L = pairs (j1,j2) in J^2 with a1 j1 + a2 j2 in J ; compute numerically
    # unknown coefficient vectors y1,y2 in K^7: a1*J^T y1 + a2*J^T y2 in span J
    AnnJ=nullspace(J)
    M1=(AnnJ*a1[None,:]%P)@J.T%P; M2=(AnnJ*a2[None,:]%P)@J.T%P
    KL=nullspace(np.hstack([M1,M2]))
    info['dimkerL']=KL.shape[0]
    best=0
    for trial in range(3):
        coef=rng.integers(0,P,V.shape[0])
        x=coef@V%P
        c1=x[:r];c2=x[r:2*r]
        imgs=[]
        for row in KL:
            j1=row[:7]@J%P; j2=row[7:]@J%P
            imgs.append((c1*j1+c2*j2)%P)
        imgs=np.array(imgs)
        rk=rank(np.vstack([Kp,imgs]))-info['dimK1']
        best=max(best,rk)
    info['Dprime_rank']=best
    if verbose: print(info)
    return info
```

### gentest.py (lineares System (C′) und Rang von Θ auf J³_0)

SHA-256 `b899ec70db473035ec8483bdd460e4a1d8393fc273062aae69c780d445e4bdd6`

```python
import numpy as np
from ff import *
def dprime(a1,a2,J,Kp,rng,trials=3):
    """J: m x r rows q_k ; Kp: basis rows of K'. Solve (C): c_i q_k - a_i kappa_k in K', kappa_k in K'.
    return dim V_C and max rank of Theta on J3_0 modulo K'."""
    r=len(a1);m=J.shape[0];kd=Kp.shape[0]
    Ann=nullspace(Kp)
    A=[a1,a2];nun=2*r+m*kd;eqs=[]
    for i in range(2):
        for k in range(m):
            blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
            blk[:,i*r:(i+1)*r]=Ann*J[k][None,:]%P
            M=(Ann*A[i][None,:]%P)@Kp.T%P
            blk[:,2*r+kd*k:2*r+kd*(k+1)]=(-M)%P
            eqs.append(blk)
    V=nullspace(np.vstack(eqs))
    one=np.ones(r,dtype=np.int64)
    Mz=np.hstack([J.T,(a1*J%P).T,(a2*J%P).T])
    Z=nullspace(Mz)
    best=0
    for _ in range(trials):
        x=rng.integers(0,P,V.shape[0])@V%P
        c1=x[:r];c2=x[r:2*r]
        Th=[(c1*(z[m:2*m]@J%P)+c2*(z[2*m:]@J%P))%P for z in Z]
        if len(Th)==0: break
        best=max(best,rank(np.vstack([Kp,np.array(Th)]))-rank(Kp))
    return V.shape[0],len(Z),best
```

### real.py (echte Verfahren laden, Basiswechsel, Skalierung, Brent-Probe)

SHA-256 `a28f739dcadddff6a6ceacdbb58487758be667a6d0f54d1ec7f699c2af944275`

```python
import json,sys,numpy as np
from fractions import Fraction
from ff import *
def inv_mat(M):
    n=len(M);A=np.hstack([np.array(M)%P,np.eye(n,dtype=np.int64)])
    R,piv=rref(A);return R[:,n:]
def load(fn):
    d=json.load(open(fn))
    def cv(x):
        f=Fraction(x);return f.numerator*pow(f.denominator,P-2,P)%P
    U=[np.array([[cv(x) for x in row] for row in pr['u']]) for pr in d['products']]
    V=[np.array([[cv(x) for x in row] for row in pr['v']]) for pr in d['products']]
    W=[np.array([[cv(x) for x in row] for row in pr['w']]) for pr in d['products']]
    return d['n'],d['m'],U,V,W
def check(n,m,U,V,W):
    r=len(U);bad=0
    T=np.zeros((n*2,2*m,n*m),dtype=np.int64)
    for t in range(r):
        T=(T+np.einsum('a,b,c->abc',U[t].reshape(-1),V[t].reshape(-1),W[t].reshape(-1)))%P
    for i in range(n):
     for j in range(2):
      for j2 in range(2):
       for k in range(m):
        for i2 in range(n):
         for k2 in range(m):
          want=1 if (i==i2 and j==j2 and k==k2) else 0
          if T[i*2+j,j2*m+k,i2*m+k2]!=want: bad+=1
    return bad
def transform(n,m,U,V,W,rng):
    while True:
        S=rng.integers(0,P,(n,n));T=rng.integers(0,P,(2,2))
        if rank(S)==n and rank(T)==2: break
    Si=inv_mat(S);Ti=inv_mat(T)
    U2=[(S.T@u%P)@T.T%P for u in U]
    V2=[Ti.T@v%P for v in V]
    W2=[Si@w%P for w in W]
    # normalize alpha(e00)=1
    for t in range(len(U2)):
        s=int(U2[t][0,0]); assert s!=0
        si=pow(s,P-2,P);U2[t]=U2[t]*si%P;W2[t]=W2[t]*s%P
    return U2,V2,W2
if __name__=='__main__':
    n,m,U,V,W=load(sys.argv[1])
    print('check',check(n,m,U,V,W))
    rng=np.random.default_rng(3)
    U2,V2,W2=transform(n,m,U,V,W,rng)
    print('check2',check(n,m,U2,V2,W2))
```

### sanity.py (Gegenprobe (D′) an echten Verfahren)

SHA-256 `5621ca21c2334000b8cfb1cf7d6524ccbaaf343a7238e792621ea8a4f753357c`

```python
import sys,numpy as np
from ff import *
from real import *
from gentest import dprime
for fn in sys.argv[1:]:
    n,m,U,V,W=load(fn);rng=np.random.default_rng(7)
    U,V,W=transform(n,m,U,V,W,rng);r=len(U)
    a1=np.array([U[t][1,0] for t in range(r)]);a2=np.array([U[t][2,0] for t in range(r)])
    q=np.array([[V[t][1,k] for t in range(r)] for k in range(m)])
    Wm=np.array([W[t].reshape(-1) for t in range(r)]);Kp=nullspace(Wm.T)
    print(fn.split('/')[-1],dprime(a1,a2,q,Kp,rng))
```

### struk.py (Kenngrößen echter Verfahren (rk L, dim J³_0, Rang Θ, dim N, a-Punkte))

SHA-256 `7dc3aa5a5a6ada895fe1dd2975e97d2dbbfa31fd6a32faa053f81a33993b34c9`

```python
import sys,numpy as np
from ff import *
from real import *
from lib327 import polys
def inspan(Mrows,v):
    return rank(np.vstack([Mrows,v]))==rank(Mrows)
def structure(fn,seed=3):
    n,m,U,V,W=load(fn)
    rng=np.random.default_rng(seed)
    U,V,W=transform(n,m,U,V,W,rng)
    r=len(U)
    a=[np.array([U[t][i,0] for t in range(r)]) for i in range(n)]
    b=[np.array([U[t][i,1] for t in range(r)]) for i in range(n)]
    q=np.array([[V[t][1,k] for t in range(r)] for k in range(m)])
    p=np.array([[V[t][0,k] for t in range(r)] for k in range(m)])
    Wm=np.array([W[t].reshape(-1) for t in range(r)])  # r x nm
    Kp=nullspace(Wm.T)   # vectors v with v@Wm=0
    print(fn.split('/')[-1],'r',r,'dim kerW',Kp.shape[0])
    aJ=np.vstack([a[i]*q%P for i in range(n)])
    rkL=rank(aJ)-m
    print(' rkL',rkL,'q',r-(n+1)*m)
    kap=(p-b[0]*q)%P
    print(' kappa in K\':',all(inspan(Kp,k) for k in kap))
    c=[(b[i]-a[i]*b[0])%P for i in range(n)]
    # J^3_0
    nun=3*m
    M=np.hstack([ (a[i]*q%P).T for i in range(n)])  # r x 3m
    Z=nullspace(M)
    Th=[]
    for z in Z:
        v=np.zeros(r,dtype=np.int64)
        for i in range(n): v=(v+b[i]*(z[i*m:(i+1)*m]@q%P))%P
        Th.append(v)
    print(' dim J3_0',len(Z),' rank Theta mod Kp',rank(np.vstack([Kp,np.array(Th)]))-Kp.shape[0])
    # N, w
    AnnJ=nullspace(q)
    N=nullspace(np.vstack([(AnnJ*a[1][None,:]%P)@q.T%P,(AnnJ*a[2][None,:]%P)@q.T%P]))
    print(' dim N',N.shape[0])
    # distinct points
    pts=set(zip(a[1].tolist(),a[2].tolist()))
    print(' distinct a-points',len(pts))
    return dict(a=a,b=b,q=q,p=p,Kp=Kp,c=c,N=N)
if __name__=='__main__':
    for fn in sys.argv[1:]: structure(fn)
```

### fam.py (Familien von Lagen)

SHA-256 `0fb467bd0b3ddc868aa7da865fd8a8114b787d9117e5fd551415901e3bcc754a`

```python
import numpy as np,sys
from ff import *
from lib327 import polys
from gentest import dprime
rng=np.random.default_rng(int(sys.argv[1]) if len(sys.argv)>1 else 11)
r=34
def R(n): return rng.integers(0,P,n)
def nz(n): return rng.integers(1,P,n)
def curve_points(deg,n):
    # random points on a random plane curve of given degree: pick x random, solve? use parametrized rational curves for deg<=2, else use y=f(x) graph (deg in x)
    x=R(n);co=R(deg+1);y=np.zeros(n,dtype=np.int64)
    for c in co: y=(y*x+c)%P
    return x,y
def run(name,a1,a2,w,u,extraC=None):
    Jl=[w*f%P for f in polys(a1,a2,2)]
    if extraC is None: Jl+= [u]
    else: Jl+=extraC
    J=np.array(Jl);J=rref(J)[0]
    if J.shape[0]!=7: print(name,'dimJ',J.shape[0]);return
    Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
    K2=rank(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))
    # N dim
    AnnJ=nullspace(J)
    N=nullspace(np.vstack([(AnnJ*a1[None,:]%P)@J.T%P,(AnnJ*a2[None,:]%P)@J.T%P]))
    res=dprime(a1,a2,J,Kp,rng)
    print(f"{name:40s} dimK'={Kp.shape[0]} dimK''={K2} dimN={N.shape[0]} dimVC={res[0]} dimJ30={res[1]} maxrank(D')={res[2]}  (need 8)")
w=nz(r);u=nz(r)
run('generic, full supports',R(r),R(r),w,u)
w2=w.copy();w2[28:]=0;u2=u.copy();u2[:22]=0
run('generic, supp w=0..27, supp u=22..33',R(r),R(r),w2,u2)
w3=w.copy();w3[30:]=0;u3=u.copy();u3[:24]=0
run('generic, supp w=0..29, supp u=24..33',R(r),R(r),w3,u3)
# fibers: 15 points
idx=np.concatenate([np.arange(15),np.arange(15),np.arange(4)]);p1,p2=R(15),R(15)
run('15 a-points with fibers',p1[idx],p2[idx],w,u)
idx=np.concatenate([np.arange(17),np.arange(17)]);p1,p2=R(17),R(17)
run('17 a-points doubled',p1[idx],p2[idx],w,u)
# Z1 with <=3 points: indices 28..33 on 3 points (doubled), others generic, w zero on Z1
a1=R(r);a2=R(r);a1[31:]=a1[28:31];a2[31:]=a2[28:31]
w4=w.copy();w4[28:]=0;u4=u.copy();u4[:20]=0
run('Z1 = 3 points doubled, overlap 8',a1,a2,w4,u4)
for deg in (3,4,5):
    x,y=curve_points(deg,r)
    run(f'points on graph y=f(x), deg {deg}',x,y,w,u)
# coordinate-point clusters (rank-1 alpha like HK): 3 points carrying 4 terms each
a1=R(r);a2=R(r)
for k,(x,y) in enumerate([(0,0),(1,0),(0,1)]):
    a1[k*4:(k+1)*4]=x;a2[k*4:(k+1)*4]=y
run('3 clusters of 4 + 22 generic',a1,a2,w,u)
# e=2: supp w on a conic, J = wP2 (5) + 2 extra
x,y=curve_points(2,r)
pts_on=np.arange(30)
a1=R(r);a2=R(r);a1[:30]=x[:30];a2[:30]=y[:30]
w5=w.copy();w5[30:]=0
run('e=2: supp w on conic, C=2 random',a1,a2,w5,None,[nz(r),nz(r)])
```

### search1.py (Block 1: Gitterlagen)

SHA-256 `d0a95b24e55739c7d4ca671857d86b5070fb2d62e1d4926e80dd5f021e55259b`

```python
import numpy as np,sys,time
from ff import *
from lib327 import polys
from gentest import dprime
seed=int(sys.argv[1]);tlimit=float(sys.argv[2])
rng=np.random.default_rng(seed);r=34
t0=time.time();stats={};best=(0,None)
n=0
while time.time()-t0<tlimit:
    n+=1
    g=rng.integers(3,7)          # grid size
    npts=rng.integers(12,26)
    grid=[(x,y) for x in range(g) for y in range(g)]
    sel=rng.choice(len(grid),size=min(npts,len(grid)),replace=False)
    idx=rng.choice(sel,size=r,replace=True)
    a1=np.array([grid[i][0] for i in idx],dtype=np.int64);a2=np.array([grid[i][1] for i in idx],dtype=np.int64)
    wmode=rng.integers(0,3)
    w=rng.integers(1,P,r) if wmode else np.ones(r,dtype=np.int64)
    u=rng.integers(1,P,r) if wmode!=1 else np.ones(r,dtype=np.int64)
    if rng.random()<0.7:
        k=rng.integers(0,7);w[r-k:]=0
        l=rng.integers(0,12);u[:l]=0
    J=np.array([w*f%P for f in polys(a1,a2,2)]+[u])
    if rank(J)!=7: continue
    Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
    if Kp.shape[0]!=13: continue
    K2=rank(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))
    if K2<21: continue
    AnnJ=nullspace(J)
    N=nullspace(np.vstack([(AnnJ*a1[None,:]%P)@J.T%P,(AnnJ*a2[None,:]%P)@J.T%P]))
    if N.shape[0]!=3: continue
    vc,z,rk=dprime(a1,a2,J,Kp,rng,trials=2)
    stats[(vc,rk)]=stats.get((vc,rk),0)+1
    if rk>best[0]: best=(rk,(a1.tolist(),a2.tolist()))
print('seed',seed,'trials',n,'valid',sum(stats.values()),'stats(dimVC,maxrank):',stats,'best',best[0])
```

### noninj.py (Block 2: Lagen mit verletzter (INJ5))

SHA-256 `247eda43c41ec65cb5f7fb5576bee4a066a0777b300b426e87d830b5595175ac`

```python
import numpy as np,sys,time
from ff import *
from lib327 import polys
from gentest import dprime
seed=int(sys.argv[1]);tlimit=float(sys.argv[2])
rng=np.random.default_rng(seed);r=34
def ev(coeffs,x):  # polynomial in x
    y=np.zeros_like(x)
    for c in coeffs: y=(y*x+c)%P
    return y
t0=time.time();stats={};n=0
while time.time()-t0<tlimit:
    n+=1
    nZ1=rng.integers(0,7); nZ2=rng.integers(0,34-nZ1-5); nO=r-nZ1-nZ2
    dF=rng.integers(3,6); dG=rng.integers(1,4)
    fco=rng.integers(0,P,dF+1); gco=rng.integers(0,P,dG+1)
    # F = y - f(x), G = y - g(x) (graphs); Z2 on F=0, Z1 on G=0 (Z1 on <=3 distinct x)
    x2=rng.integers(0,P,nZ2); y2=ev(fco,x2)
    k=rng.integers(1,4); base=rng.integers(0,P,k); x1=base[rng.integers(0,k,nZ1)]; y1=ev(gco,x1)
    xo=rng.integers(0,P,nO); yo=rng.integers(0,P,nO)
    a1=np.concatenate([x2,x1,xo]).astype(np.int64); a2=np.concatenate([y2,y1,yo]).astype(np.int64)
    w=np.zeros(r,dtype=np.int64);u=np.zeros(r,dtype=np.int64)
    w[:nZ2]=rng.integers(1,P,nZ2)
    u[nZ2:nZ2+nZ1]=rng.integers(1,P,nZ1)
    uo=rng.integers(1,P,nO); Fo=(yo-ev(fco,xo))%P; Go=(yo-ev(gco,xo))%P
    if np.any(Fo==0) or np.any(Go==0): continue
    wo=(P-uo*Go%P*np.array([pow(int(f),P-2,P) for f in Fo]))%P
    w[nZ2+nZ1:]=wo;u[nZ2+nZ1:]=uo
    J=np.array([w*f%P for f in polys(a1,a2,2)]+[u])
    if rank(J)!=7: stats['J<7']=stats.get('J<7',0)+1;continue
    Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
    if Kp.shape[0]!=13: stats['K<13']=stats.get('K<13',0)+1;continue
    K2=rank(np.vstack([Kp,a1*Kp%P,a2*Kp%P]))
    if K2<21: stats['K2<21']=stats.get('K2<21',0)+1;continue
    AnnJ=nullspace(J)
    N=nullspace(np.vstack([(AnnJ*a1[None,:]%P)@J.T%P,(AnnJ*a2[None,:]%P)@J.T%P]))
    if N.shape[0]!=3: stats['N!=3']=stats.get('N!=3',0)+1;continue
    vc,z,rk=dprime(a1,a2,J,Kp,rng,trials=2)
    stats[(int(vc),int(rk))]=stats.get((int(vc),int(rk)),0)+1
print('seed',seed,'trials',n,stats)
```

### vc.py (Zerlegung der Lösungsmenge V_C)

SHA-256 `6c985cd567109a223423419083dc9c686010591ebab26d39ad9e998f440baa19`

```python
import numpy as np
from ff import *
from lib327 import polys
rng=np.random.default_rng(3);r=34
a1=rng.integers(0,P,r);a2=rng.integers(0,P,r);w=rng.integers(1,P,r);u=rng.integers(1,P,r)
J=np.array([w*f%P for f in polys(a1,a2,2)]+[u])
Kp=rref(np.vstack([J,a1*J%P,a2*J%P]))[0]
Ann=nullspace(Kp);A=[a1,a2];m=7;kd=13;nun=2*r+m*kd;eqs=[]
for i in range(2):
    for k in range(m):
        blk=np.zeros((Ann.shape[0],nun),dtype=np.int64)
        blk[:,i*r:(i+1)*r]=Ann*J[k][None,:]%P
        M=(Ann*A[i][None,:]%P)@Kp.T%P
        blk[:,2*r+kd*k:2*r+kd*(k+1)]=(-M)%P
        eqs.append(blk)
V=nullspace(np.vstack(eqs))
C=V[:,:2*r]
print('dim c-projection',rank(C))
# candidate: c_i = a_i*mu + (something)?  test c-projection vs span{(a1*mu, a2*mu): mu in M}
one=np.ones(r,dtype=np.int64)
cands=[]
basis_mu=[one,a1,a2,a1*a1%P,a1*a2%P,a2*a2%P]
for mu in basis_mu: cands.append(np.concatenate([a1*mu%P,a2*mu%P]))
cands=np.array(cands)
print('rank cands',rank(cands),'rank C+cands',rank(np.vstack([C,cands])))
# which of the first 3 (mu in P1) inside
print('rank C + P1-cands',rank(np.vstack([C,cands[:3]])))
# what else? check c with c1 = mu1 arbitrary? print rank of c1-part alone
print('rank c1 part',rank(C[:,:r]),'rank c2 part',rank(C[:,r:]))
```
