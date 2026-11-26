# S4-28: Der Fall e = 2 ohne (INJ-B) (3×2×7, Länge 34)

- Auftrag: S4-28, Protokoll 0.6, Stufe 4, Runde 5, Spur A. Rolle: Beweissucher. Darf den Fall in beide Richtungen angreifen. Der Fall e = 3 gehört nicht zum Auftrag.
- Datum: 26.11.2026. Zweig `claude/project-thread-ot20tb`. Beginn und Ende stehen in den Git-Zeitstempeln.
- **Status aller Aussagen dieser Datei: behauptet oder ausdrücklich vermutet.** Den Status setzt nur der Orchestrator. Die beiden Wörter, die das Protokoll dem Status geprüft vorbehält, verwende ich für keine eigene Aussage.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` (ganz), `STATUS.md` (Anfang), `LOG.md` (Ende, Runde 4 und Vorbereitung Runde 5), `versuche/README.md` und die Liste in `versuche/`, `behauptungen/B-025.md`, `lean/prosa/s4_327_spurA_r3_e2.md` (S4-15, Abschnitte 0 bis 10 ganz, Anhang A teilweise), `lean/prosa/s4_327_spurA_r3_e3.md` (S4-14, Abschnitte 0 bis 9), `lean/prosa/s4_327_spurA_r4_m21.md` (S4-21, Abschnitte 0 bis 9), `lean/prosa/s4_327_spurA_r2_bau.md` (S4-07, Abschnitte 1 bis 3), `lean/prosa/yang_n3.md` (Abschnitte 4 und 5: G1 bis G4, (SN1), (SN2), Lemma A, Anfang von Lemma B).
- Kein Subagent, keine Fremdmodell-Anfrage, kein Kontakt nach außen, keine Websuche, nichts ins Projektgedächtnis geschrieben, kein Lean.
- Offenlegung: Eingeblendet wurden mir der Index des Projektgedächtnisses und die Einzeleinträge `yang-n3-prosa`, `aussagen-abgleich-n3` und `git-regeln` (Datei-, Bridge- und Git-Hinweise, kein Urteil zum Restfall). Für die Mathematik habe ich sie nicht benutzt.

---

## 0. Ergebnis in Kürze

**Der Fall e = 2 ist ohne (INJ-B) vollständig auf den Fall e = 3 zurückgeführt.** Genauer (Satz S4-28-C): Es gibt über keinem Körper ein Verfahren der Länge 34 für ⟨3,2,7⟩, bei dem **jede** Normalform e = 2 hat. Jedes Verfahren der Länge 34 hat also eine Normalform mit e = 3. Ein Verfahren, das in **einer** Normalform e = 2 und in einer anderen e = 3 hat, fällt damit in den Fall e = 3 und wird hier nicht behandelt. Das ist der genau benannte Rest: Wer den Fall „e = 3 in irgendeiner Normalform“ ausschließt (das Ziel von S4-21), hat zusammen mit diesem Satz den Restfall R-327 ganz ausgeschlossen.

Beide Ideen aus dem Fall e = 3 übertragen sich:

1. **Satz R gilt auch bei e = 2** (Aussage S4-28-A). Der Beweis aus S4-14 läuft fast wörtlich; neu ist nur, dass die Relation φ_0 + a_1φ_1 + a_2φ_2 erst modulo g_0·P_1 verschwindet, was man vor dem Koszul-Schritt abzieht. Folge: (INJ-B) ist in jeder Normalform mit e = 2 verletzt. Der bedingte Ausschluss E2-D aus S4-15 ist damit leer (seine Voraussetzung tritt nie ein), und ein Ausschluss muss ohne (INJ-B) auskommen.
2. **Die freie Wahl der Normalform** (Lemma F aus S4-21) liefert wie dort eine starre Gestalt (Aussage S4-28-B): In einer allgemeinen Normalform mit e = 2 gibt es genau 8 Produkte mit Rang 2, sie sitzen auf 8 verschiedenen a-Punkten im Träger von w, also **auf dem glatten Kegelschnitt C_0**, und mindestens 7 verschiedene a-Punkte von Rang-1-Produkten liegen ebenfalls im Träger von w.
3. **Der neue Schritt** (Satz S4-28-C): Hält man S fest und bewegt nur die erste Zeile p von T, dann bleiben die a-Punkte der Rang-1-Produkte fest, die a-Punkte der Rang-2-Produkte wandern auf festen Geraden. Mindestens 7 feste Punkte legen den Kegelschnitt C_0 fest. Ein Rang-2-Punkt müsste dann für unendlich viele p zugleich auf seiner Geraden und auf dem festen Kegelschnitt liegen. Ein glatter Kegelschnitt enthält keine Gerade. Widerspruch.

Der Beweis benutzt (C′) nur über Satz R, die Lösungsstruktur von (C′) wird nicht gebraucht. Die Rechnung in Abschnitt 9 prüft nur einen Hilfsschritt nach (die Koszul-Gestalt von J³_0 bei e = 2) und ist kein Teil des Beweises.

---

## 1. Aussagen im Wortlaut

Bezeichnungen wie in S4-07, Abschnitt 1, S4-15, Abschnitte 1 und 4, und S4-21, Abschnitt 3; Zusammenfassung in Abschnitt 3 dieser Datei. „Normalform zu (S, T)“ heißt wie in S4-21: das Verfahren über dem algebraischen Abschluss K des Grundkörpers (R1), nach dem Basiswechsel R3 mit (S, T) ∈ GL_3(K) × GL_2(K), sofern danach (SN1) und (SN2) gelten, und nach der Skalierung auf a_0 = 1. „Lage mit e = 2“ heißt: eine Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ mit dim(w·P_2) = 5.

**Aussage S4-28-A (Satz R bei e = 2, behauptet).** In jeder Lage mit e = 2 gilt:
 (i) Jedes (j_0, j_1, j_2) ∈ J³_0 hat die Form j_i = w·Σ_k ψ_{ik}·a_k (i = 0, 1, 2) mit ψ_{ik} = −ψ_{ki} ∈ P_1, und Θ(j) = −Σ_{i<k} ψ_{ik}·ω_{ik}·w mit ω_{ik} := a_i·b_k − a_k·b_i.
 (ii) K″ = K′ ⊕ Θ(J³_0), und K″ ist unter der Multiplikation mit a_1 und a_2 abgeschlossen.
 (iii) Gleichwertig zu (ii): A·w + A·u_1 + A·u_2 = K″ = w·P_4 ⊕ u·P_2, also w·P_5 + u·P_3 = w·P_4 ⊕ u·P_2, und der Raum der Relationen {(F, G_1, G_2) ∈ P_5 × P_3 × P_3 : w·F + u_1G_1 + u_2G_2 = 0} hat Dimension 41 − 21 = 20. Er enthält die 10-dimensionalen Relationen (g_0·h, 0, 0), h ∈ P_3; modulo diesen bleibt Dimension 10.
 (iv) Insbesondere ist (INJ-B) aus S4-15 in jeder Lage mit e = 2 verletzt.
Benutzt werden nur (A), (C), (D), der Restfall und die Gestalt E2-B (Teile 1 und 2) aus S4-15; nicht benutzt werden (B), (INJ-B) und die Lösungsstruktur von (C′).

**Aussage S4-28-B (Gestalt in allgemeiner Normalform bei e = 2, behauptet).** Sei eine Lage mit e = 2 gegeben, deren Basiswechsel (S, T) folgende Bedingung (ALLG) erfüllt: Für je zwei Indizes t ≠ t′, für die weder α_{t′} ein Vielfaches von α_t ist noch α_t, α_{t′} beide Rang 1 mit derselben Spalte haben, ist die erste Zeile p von T nicht in V_{tt′} (Lemma F aus S4-21: V_{tt′} ist dann eine echte abgeschlossene Teilmenge von K^{1×2}). Sei Y := {t : rk α_t = 1}, Ω := {t : rk α_t = 2} und Σ := {t : w_t ≠ 0}. Dann gilt:
 (i) c_1 = c_2 = 0 auf Y; |Y| = 26, |Ω| = 8.
 (ii) Die 8 Indizes in Ω liegen auf 8 verschiedenen a-Punkten, jeder dieser a-Punkte trägt nur diesen einen Index, und Ω ⊆ Σ. Insbesondere liegen die a-Punkte von Ω auf dem Kegelschnitt C_0 aus E2-B.
 (iii) K′ ∩ K^Ω = 0 und K″ = K′ ⊕ K^Ω = K′ ⊕ Θ(J³_0), also Θ(J³_0) = K^Ω.
 (iv) Die Menge Π_1 := {a-Punkt von t : t ∈ Y ∩ Σ} hat mindestens 7 Elemente.
 (v) Für jede Faser T_p ⊆ Y (alle Indizes über einem a-Punkt p von Y) gilt |T_p| = 2·d_p mit d_p := dim(e_p·K″), und Σ_{p ⊆ Y} d_p = 13.

**Aussage S4-28-C (Hauptsatz, behauptet).** Es gibt über keinem Körper ein Verfahren der Länge 34 für ⟨3,2,7⟩, bei dem jede Normalform e ≤ 2 hat. Gleichwertig: Jedes Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F hat eine Normalform (über dem algebraischen Abschluss von F) mit e = 3; nach S4-21-A ist dann die Menge der (S, T) mit e = 3 sogar dicht und offen.

**Folgerung S4-28-D (behauptet, bedingt).** Gilt die Aussage „Kein Verfahren der Länge 34 für ⟨3,2,7⟩ hat eine Normalform mit e = 3“, dann ist R(⟨3,2,7⟩) ≥ 35 über jedem Körper, für den der Restfall (B-017 bis B-019) gilt. Die Fallunterscheidung B-025 wird dafür nicht mehr gebraucht; es genügt E2-A (e ∈ {2, 3} in jeder Normalform).

**Aussage S4-28-E (Rechnung über GF(32003), behauptet).** In 24 334 zufällig erzeugten Lagen mit e = 2 (Σ auf einem allgemeinen Kegelschnitt, 2 bis 12 Indizes außerhalb des Trägers von w), die dim J = 7, dim K′ = 13, dim K″ = 21 erfüllen, ist der Raum J³_0 (direkt als Kern berechnet) 8-dimensional und gleich dem Raum der Tripel (w·Σ_k ψ_{ik}a_k)_i mit antisymmetrischem ψ, ψ_{ik} ∈ P_1. In 147 dieser Lagen ist K″ unter a_1, a_2 abgeschlossen, in den übrigen nicht (dim(K″ + a_1K″ + a_2K″) zwischen 22 und 31); nach S4-28-A kommen diese übrigen Lagen also von keinem Verfahren.

Keine Vermutung dieser Datei ist für den Beweis von S4-28-C nötig. Die Vermutung E2-V aus S4-15 wird für den Ausschluss nicht mehr gebraucht; ich habe sie weder bewiesen noch widerlegt.

---

## 2. Worauf sich der Beweis stützt

Ohne eigene vollständige Prüfung übernommen, mit Status im Repo „behauptet“ (Angabe nach STATUS.md, ohne eigene Wertung):

- **Restfall R-327** (B-017 bis B-019): In jeder Normalform eines Verfahrens der Länge 34 gilt rk L = 6, dim N = 3, dim S = 1, also K′ = J + a_1·J + a_2·J. Ich habe die Rechnung in S4-15, Abschnitt 2, nachgelesen, aber nicht die Lemmata aus `yang_n3.md` im Einzelnen.
- **S4-07, Abschnitte 1 bis 3**: Umformulierung (A) bis (D), (C′), der Vektor w mit w·P_1 = f_0(N), dim w·P_1 = 3, w·P_2 ⊆ J, der Zerlegungssatz K^34 = K″ + b_0·K′, dim J³_0 = 8 und die Injektivität von J³ → K^34/K′, (j_i) ↦ [Σ b_i·j_i]. Nachgerechnet (Abschnitte 2 und 3.1 bis 3.3 dort), die Herleitungen sind kurz und lineare Algebra.
- **E2-A** aus S4-15 (B-027, von einem Prüfer bestätigt): e ∈ {2, 3} in jeder Normalform. Benutzt wird nur, dass „e ≤ 2“ dasselbe ist wie „e = 2“. Stützt sich auf Lemma B aus `yang_n3.md`.
- **E2-B, Teile 1 und 2** aus S4-15 (B-027): bei e = 2 gibt es bis auf einen Faktor genau ein g_0 ∈ P_2 mit w·g_0 = 0, seine Homogenisierung ist irreduzibel, C_0 = {g_0 = 0} enthält alle a-Punkte von Σ; J = w·P_2 ⊕ ⟨u_1, u_2⟩; dim w·P_3 = 7, dim w·P_4 = 9; K′ = w·P_3 ⊕ u·P_1 und K″ = w·P_4 ⊕ u·P_2, je mit injektivem u-Anteil (die Abbildung (G_1, G_2) ↦ u_1G_1 + u_2G_2 ist auf P_2² injektiv); dim K″ = 21; K^34 = K″ ⊕ b_0·K′. Diese Teile habe ich Zeile für Zeile nachgerechnet (S4-15, 4.1 und 4.2); der Irreduzibilitätsbeweis benutzt (SN2). Den Kern der Auswertung P_3 → K^34, f ↦ w·f, bestimme ich in Abschnitt 4 selbst.
- **`yang_n3.md`**: R1 (Übergang zum algebraischen Abschluss), R3 (Basiswechsel), (SN1), (SN2), Lemma A mit seinem Beweis (Schritte 1 bis 5), G4.
- **S4-21, Lemma F** und die Formeln aus S4-21, Abschnitt 3 (a′(t) = Sᵀα_tpᵀ, b′(t) = Sᵀα_tp′ᵀ). Lemma F habe ich nachgerechnet und in Abschnitt 5.1 wiederholt. **Lemma O aus S4-21 brauche ich nicht.**
- **S4-14, Satz R**: nicht als Aussage benutzt, sondern als Vorlage; der Beweis bei e = 2 steht hier vollständig.

Neu in dieser Datei und hier vollständig ausgeschrieben: der Beweis von S4-28-A, S4-28-B und S4-28-C.

**Körper.** Alle Schritte sind lineare Algebra, Interpolation an endlich vielen Punkten, die Exaktheit des Koszul-Komplexes, die Tatsache, dass ein von null verschiedenes homogenes Polynom in zwei Variablen nur auf endlich vielen Geraden verschwindet, und der Satz, dass zwei verschiedene irreduzible Kegelschnitte höchstens 4 gemeinsame Punkte haben. Das gilt in jeder Charakteristik über dem algebraisch abgeschlossenen (also unendlichen) Körper K. Damit gilt S4-28-C für Verfahren über jedem Körper F, soweit die übernommenen Aussagen (Restfall, S4-07, E2-A, E2-B) für jeden Körper gelten.

---

## 3. Bezeichnungen

- Vektoren in K^34 sind Funktionen auf den 34 Indizes, „·“ ist das komponentenweise Produkt. a_i := (α_t(e_{i0}))_t, b_i := (α_t(e_{i1}))_t, a_0 = 1. α_t ist die 3×2-Matrix mit den Spalten a(t) = (1, a_1(t), a_2(t)) und b(t). Der a-Punkt von t ist (a_1(t), a_2(t)).
- q_k, p_k, J = span(q_k), W, K′ = ker W (dim 13), K″ := K′ + a_1K′ + a_2K′, c_i := b_i − a_i·b_0, ω_{ik} := a_i·b_k − a_k·b_i (also ω_{0k} = c_k, ω_{12} = a_1c_2 − a_2c_1), π(q_k) := p_k (linear auf J fortgesetzt).
- A := K[a_1, a_2] wirkt auf K^34 durch Multiplikation, P_d ⊆ A die Polynome vom Grad ≤ d. v·P_d := {v·f : f ∈ P_d}, A·v := ∪_d v·P_d.
- Bei e = 2: J = w·P_2 ⊕ ⟨u_1, u_2⟩; u·P_d := {u_1G_1 + u_2G_2 : G_1, G_2 ∈ P_d}; Σ := {t : w_t ≠ 0}; g_0, C_0 wie in E2-B.
- J³_0 := {(j_0, j_1, j_2) ∈ J³ : j_0 + a_1j_1 + a_2j_2 = 0}, Θ(j) := b_0j_0 + b_1j_1 + b_2j_2 = c_1j_1 + c_2j_2 für j ∈ J³_0.
- Π: die verschiedenen a-Punkte; T_p: die Indizes über p ∈ Π; e_p ∈ A ein Polynom mit e_p(p) = 1 und e_p(p′) = 0 für p′ ∈ Π ∖ {p} (Interpolation), als Vektor die Indikatorfunktion von T_p.
- K^X für eine Indexmenge X: die Vektoren mit Träger in X.

**Achtung, andere Bedeutung als in S4-15:** Dort heißt Z das Komplement von Σ. Hier kommt dieses Komplement nicht vor; Ω ist die Menge der Rang-2-Indizes (in S4-21 heißt sie Z).

---

## 4. Beweis von Satz R bei e = 2 (Aussage S4-28-A)

Sei eine Lage mit e = 2 gegeben. Ich wiederhole aus E2-B: K′ = w·P_3 ⊕ u·P_1 mit dim w·P_3 = 7, dim u·P_1 = 6; K″ = w·P_4 ⊕ u·P_2 mit dim 9 + 12 = 21.

**Schritt 0 (Kern der Auswertung auf P_3).** Die Abbildung P_3 → K^34, f ↦ w·f, hat das Bild w·P_3 der Dimension 7, also einen Kern der Dimension 10 − 7 = 3. Er enthält g_0·P_1, und g_0·P_1 hat Dimension 3 (g_0 ≠ 0 im nullteilerfreien Ring A_{formal} der Polynome; Multiplikation mit g_0 ist injektiv). Also ist der Kern **genau g_0·P_1**. (Hier sind Polynome formale Polynome in zwei Variablen; „w·f“ ist die Auswertung an den a-Punkten mal w.)

**Schritt 1 (Gestalt von J³_0, Aussage (i)).** Sei (j_0, j_1, j_2) ∈ J³_0, j_i = w·φ_i + u_1s_{i1} + u_2s_{i2} mit φ_i ∈ P_2 und s_{il} ∈ K. Dann ist
 0 = Σ_i a_i·j_i = w·(φ_0 + a_1φ_1 + a_2φ_2) + Σ_l u_l·(s_{0l} + s_{1l}a_1 + s_{2l}a_2)
mit einem Polynom vom Grad ≤ 3 im w-Teil und Polynomen vom Grad ≤ 1 im u-Teil. Weil K′ = w·P_3 ⊕ u·P_1 direkt ist und der u-Anteil auf P_1² injektiv, gilt s_{0l} + s_{1l}a_1 + s_{2l}a_2 = 0 als Polynom, also alle s_{il} = 0, und w·(φ_0 + a_1φ_1 + a_2φ_2) = 0. Nach Schritt 0 ist φ_0 + a_1φ_1 + a_2φ_2 = g_0·(λ_0 + λ_1a_1 + λ_2a_2) mit λ_i ∈ K. Setze φ′_i := φ_i − λ_i·g_0 ∈ P_2. Dann w·φ′_i = w·φ_i = j_i und
 φ′_0 + a_1φ′_1 + a_2φ′_2 = 0 als Polynom.
Homogenisiere: Φ′_i(X_0, X_1, X_2) := X_0²·φ′_i(X_1/X_0, X_2/X_0) ∈ S_2 (S := K[X_0, X_1, X_2]). Dann X_0Φ′_0 + X_1Φ′_1 + X_2Φ′_2 = 0 in S_3. Der Koszul-Komplex der regulären Folge X_0, X_1, X_2 ist exakt, also gibt es Ψ_{ik} = −Ψ_{ki} ∈ S_1 mit Φ′_i = Σ_k Ψ_{ik}X_k. Mit ψ_{ik} := Ψ_{ik}(1, a_1, a_2) ∈ P_1 ist φ′_i = Σ_k ψ_{ik}a_k, also **j_i = w·Σ_k ψ_{ik}·a_k**. Daraus
 Θ(j) = Σ_i b_i·j_i = w·Σ_{i,k} ψ_{ik}·b_i·a_k = w·Σ_{i<k} ψ_{ik}·(b_ia_k − b_ka_i) = −Σ_{i<k} ψ_{ik}·ω_{ik}·w.
Das ist dieselbe Formel wie in S4-14, Schritt 3. Der einzige Unterschied: Bei e = 3 verschwindet φ_0 + a_1φ_1 + a_2φ_2 als Polynom, bei e = 2 erst nach Abzug von g_0·(λ_0 + λ_1a_1 + λ_2a_2).

**Schritt 2 (ω_{ik}·J ⊆ K″).** Wörtlich S4-14, Schritt 4: Für j ∈ J gilt nach (C) a_i·π(j) − b_i·j ∈ K′ (i = 0, 1, 2), also
 ω_{ik}·j = a_k·(a_i·π(j) − b_i·j) − a_i·(a_k·π(j) − b_k·j) ∈ a_k·K′ + a_i·K′ ⊆ K″
(die Terme a_ia_kπ(j) heben sich weg; a_0K′ = K′).

**Schritt 3 (K″ = K′ ⊕ Θ(J³_0)).** Für j ∈ J³_0 liegt jedes ψ_{ik}·w in w·P_1 ⊆ J, also nach Schritt 1 und 2 Θ(j) ∈ K″. Nach (D) ist (j_i) ↦ [Σ b_i·j_i] ∈ K^34/K′ auf J³ injektiv, also Θ(J³_0) ∩ K′ = 0 und dim Θ(J³_0) = dim J³_0 = 8. Wegen dim K″ = 21 = 13 + 8 folgt **K″ = K′ ⊕ Θ(J³_0)**.

**Schritt 4 (Abschluss, Aussage (ii)).** Für l ∈ {1, 2} und j ∈ J³_0 ist nach Schritt 1
 a_l·Θ(j) = −Σ_{i<k} ω_{ik}·(w·a_l·ψ_{ik}),
und w·a_l·ψ_{ik} ∈ w·P_2 ⊆ J. Nach Schritt 2 liegt jeder Summand in K″. Also a_l·Θ(J³_0) ⊆ K″, und a_l·K′ ⊆ K″ nach Definition. Mit Schritt 3: **a_l·K″ ⊆ K″.** ∎

**Aussage (iii).** Ist K″ abgeschlossen, dann enthält K″ den Modul A·w + A·u_1 + A·u_2 (w, u_l ∈ J ⊆ K″), und K″ = w·P_4 + u·P_2 liegt in diesem Modul. Also Gleichheit, und w·P_5 + u·P_3 ⊆ K″ = w·P_4 ⊕ u·P_2 ⊆ w·P_5 + u·P_3. Die Abbildung P_5 × P_3 × P_3 → K″, (F, G_1, G_2) ↦ w·F + u_1G_1 + u_2G_2, ist also surjektiv auf einen Raum der Dimension 21, ihr Kern hat Dimension 21 + 10 + 10 − 21 = 20 (dim P_5 = 21, dim P_3 = 10). Davon sind 10 Dimensionen die Relationen (g_0·h, 0, 0) mit h ∈ P_3.

**Aussage (iv).** (INJ-B) verlangt: Jede Relation in diesem Kern hat G_1 = G_2 = 0 und F ∈ g_0·P_3. Dann läge der Kern in {(g_0h, 0, 0) : h ∈ P_3}, einem Raum der Dimension 10, und das Bild hätte Dimension mindestens 41 − 10 = 31 > 21. Widerspruch zu (iii). Also ist (INJ-B) in jeder Lage mit e = 2 verletzt. ∎

**Folge für E2-D (S4-15).** Die Voraussetzung von E2-D tritt in keiner Lage mit e = 2 ein, die von einem Verfahren kommt. E2-D ist damit als Implikation nicht falsch, schließt aber nichts aus. Ein Ausschluss von e = 2 muss ohne (INJ-B) auskommen.

**Bemerkung.** Satz R allein schließt nichts aus: Es gibt Lagen mit e = 2, in denen K″ abgeschlossen ist (Abschnitt 9: 147 Stück). Das ist das Gegenstück zum Unterfall (M21) bei e = 3.

---

## 5. Freie Wahl der Normalform

### 5.1 Lemma F (aus S4-21, wiederholt)

Für t ≠ t′ sei V_{tt′} := {p ∈ K^{1×2} : α_tpᵀ und α_{t′}pᵀ sind linear abhängig}. Es ist V_{tt′} = K^{1×2} genau dann, wenn (I) α_{t′} = λ·α_t für ein λ ∈ K, oder (II) α_t und α_{t′} beide Rang 1 haben und dieselbe Spalte K·x. Sonst ist V_{tt′} die Nullstellenmenge eines von null verschiedenen 2×2-Minors von (α_tpᵀ | α_{t′}pᵀ), eines homogenen Polynoms vom Grad 2 in p, also eine Vereinigung von höchstens zwei Geraden durch 0.

Beweis wie S4-21, 5.1: Hat α_t Rang 2, so ist p ↦ α_tpᵀ injektiv, aus der Abhängigkeit für alle p folgt α_{t′}pᵀ = λ(p)α_tpᵀ, und die Linearität erzwingt ein konstantes λ (Fall I). Hat α_{t′} Rang 2, ebenso mit vertauschten Rollen. Haben beide Rang 1, α_t = xyᵀ, α_{t′} = x′y′ᵀ, so wähle p mit y·p ≠ 0 ≠ y′·p; dann folgt K·x = K·x′ (Fall II). Kein α_t ist die Nullform (Länge 34 ist minimal). ∎

### 5.2 Welche (S, T) Normalformen liefern

Nach dem Beweis von Lemma A in `yang_n3.md` (Schritte 1 bis 5) gibt es ein Polynom P(u, p) ≠ 0 in (u, p) ∈ K³ × K^{1×2}, das vom Verfahren abhängt, mit: Ist P(u, p) ≠ 0, S eine invertierbare Matrix mit erster Spalte u und T eine invertierbare Matrix mit erster Zeile p, dann gelten nach dem Basiswechsel (S, T) die Bedingungen (SN1) und (SN2). P ist in p homogen (Produkt der Linearformen α_r(up) in p und der Minoren q_Σ(p), die homogen vom Grad 3 sind).

Weil P ≠ 0 ist, gibt es u_* ∈ K³ mit P(u_*, ·) ≠ 0 als Polynom in p (K ist unendlich; ein Koeffizient von P als Polynom in p ist ein von null verschiedenes Polynom in u). Sei Q(p) := P(u_*, p)·Π m_{tt′}(p), das Produkt über alle Paare t < t′, die weder (I) noch (II) erfüllen, mit je einem von null verschiedenen Minor m_{tt′} aus Lemma F. Q ist ein von null verschiedenes homogenes Polynom in den zwei Variablen von p, verschwindet also nur auf endlich vielen Geraden durch 0. **Die Menge 𝒫 := {[p] ∈ P¹(K) : Q(p) ≠ 0} ist also unendlich.**

Fixiere eine invertierbare Matrix S mit erster Spalte u_* und wähle zu jedem [p] ∈ 𝒫 einen Vertreter p und eine invertierbare Matrix T_p mit erster Zeile p. Dann ist (S, T_p) eine Normalform, die (ALLG) aus S4-28-B erfüllt.

### 5.3 Was sich mit p bewegt (Formeln aus S4-21, Abschnitt 3)

Nach R3 ist a′(t) = Sᵀα_tpᵀ und b′(t) = Sᵀα_tp′ᵀ (p′ die zweite Zeile von T), nach der Skalierung a(t) = a′(t)/a′_0(t), b(t) = b′(t)/a′_0(t). Der a-Punkt von t ist also der Punkt [Sᵀα_tpᵀ] der projektiven Ebene P², gelesen in der affinen Karte X_0 ≠ 0 ((SN1) sorgt für a′_0(t) ≠ 0).

- **Rang 1**, α_t = x_ty_tᵀ: Sᵀα_tpᵀ = (y_t·p)·Sᵀx_t. Der a-Punkt ist [Sᵀx_t], **unabhängig von p**. Außerdem b(t) = r_t·a(t) mit r_t = (y_t·p′)/(y_t·p), also b_0(t) = r_t und **c_i(t) = b_i(t) − a_i(t)b_0(t) = 0** (i = 1, 2).
- **Rang 2**: p ↦ Sᵀα_tpᵀ ist eine injektive lineare Abbildung K² → K³. Ihr Bild ist eine Ebene, also eine Gerade ℓ_t ⊆ P², und **[p] ↦ a-Punkt von t ist eine injektive Abbildung P¹ → ℓ_t**.
- **Fall I** (α_{t′} = λα_t): a′(t′) = λa′(t), b′(t′) = λb′(t), also stimmen a, b, b_0, c_1, c_2 an t und t′ überein.

Zwei Indizes haben genau dann denselben a-Punkt, wenn Sᵀα_tpᵀ und Sᵀα_{t′}pᵀ abhängig sind, also p ∈ V_{tt′}. Unter (ALLG) geschieht das nur in den Fällen (I) und (II). **Jede Faser T_p besteht also entweder nur aus paarweise proportionalen Rang-2-Formen (Klasse I) oder nur aus Rang-1-Formen (Klasse II).** Y ist die Vereinigung der Fasern der Klasse II, Ω die der Klasse I.

---

## 6. Beweis der Gestalt (Aussage S4-28-B)

Sei eine Lage mit e = 2 gegeben, die (ALLG) erfüllt.

**Schritt 1 (Zerlegung nach Punkten).** Nach S4-28-A ist K″ ein A-Untermodul von K^34. Also ist K″ = ⊕_{p ∈ Π} M_p mit M_p := e_p·K″ ⊆ K^{T_p}, und Σ_p d_p = dim K″ = 21 (d_p := dim M_p). (Für m ∈ K″ ist m = Σ_p e_p·m und e_p·m ∈ K″.)

**Schritt 2 (Fasergrößen).** Multipliziert man K^34 = K″ ⊕ b_0·K′ (E2-B, Teil 2) mit e_p, erhält man K^{T_p} = M_p + b_0·e_p·K′ ⊆ M_p + b_0·M_p (denn e_pK′ ⊆ e_pK″ = M_p). Also |T_p| ≤ 2·d_p. Auf einer Faser der Klasse I ist b_0 konstant (5.3), also b_0·M_p = M_p und |T_p| = d_p.

**Schritt 3 (Zählung).** Σ_p (|T_p| − d_p) = 34 − 21 = 13. Die Fasern der Klasse I tragen 0 bei, die der Klasse II je höchstens |T_p|/2. Also 13 ≤ |Y|/2, **|Y| ≥ 26, |Ω| ≤ 8**.

**Schritt 4 (Θ lebt auf Ω).** Für j ∈ J³_0 ist Θ(j) = c_1·j_1 + c_2·j_2, und c_1, c_2 verschwinden auf Y (5.3). Also Θ(J³_0) ⊆ K″ ∩ K^Ω = ⊕_{T_p ⊆ Ω} M_p, und dieser Raum hat die Dimension Σ_{T_p ⊆ Ω} d_p = Σ_{T_p ⊆ Ω} |T_p| = |Ω|. Nach S4-28-A, Schritt 3, ist dim Θ(J³_0) = 8. Also |Ω| ≥ 8. Mit Schritt 3: **|Ω| = 8, |Y| = 26**, in Schritt 3 gilt überall Gleichheit, also |T_p| = 2·d_p für jede Faser in Y und Σ_{T_p ⊆ Y} d_p = 13 (das ist (v)), und **Θ(J³_0) = K^Ω** (beide 8-dimensional, ⊕_{T_p ⊆ Ω} M_p = ⊕_{T_p ⊆ Ω} K^{T_p} = K^Ω). Mit K″ = K′ ⊕ Θ(J³_0) (S4-28-A) folgt **K″ = K′ ⊕ K^Ω, K′ ∩ K^Ω = 0**. Das ist (i) und (iii).

**Schritt 5 (Ω ⊆ Σ, einzelne Punkte).** Auf jeder Faser sind c_1, c_2 konstant (auf Y gleich 0, auf Klasse I nach 5.3), also gibt es durch Interpolation Polynome C_1, C_2 ∈ A mit c_i = C_i als Vektoren. Für (j_0, j_1, j_2) ∈ J³_0 ist nach S4-28-A (i) j_i ∈ w·P_2, also Θ(j) = C_1·j_1 + C_2·j_2 ∈ A·w. Damit K^Ω = Θ(J³_0) ⊆ A·w. Für eine Faser T_p ⊆ Ω folgt K^{T_p} = e_p·K^Ω ⊆ e_p·A·w = K·(e_p·w), also **|T_p| = 1 und w ≠ 0 auf T_p**. Die 8 Indizes in Ω liegen also auf 8 verschiedenen a-Punkten in Σ, und alle a-Punkte von Σ liegen auf C_0 (E2-B, Teil 1). Das ist (ii).

**Schritt 6 (mindestens 7 Punkte, Aussage (iv)).** Betrachte die Einschränkung ρ_Y : w·P_3 → K^Y, v ↦ v|_Y. Ihr Kern liegt in w·P_3 ∩ K^Ω ⊆ K′ ∩ K^Ω = 0 (w·P_3 ⊆ K′), also ist ρ_Y injektiv und hat ein 7-dimensionales Bild (dim w·P_3 = 7). Andererseits ist (w·f)_t = w_t·f(a-Punkt von t), also hängt (w·f)|_Y nur von den Werten f(p) an den Punkten p ∈ Π_1 ab (an Indizes t ∈ Y mit w_t = 0 ist der Eintrag ohnehin 0). Das Bild von ρ_Y hat also höchstens Dimension |Π_1|. Somit **|Π_1| ≥ 7**. ∎

**Übertragung auf das Ausgangsverfahren.** Rang und Proportionalität der α_t ändern sich unter R1, R3 und der Skalierung nicht (α′_t = Sᵀα_tTᵀ als Matrix, dann Multiplikation mit einem Skalar ≠ 0). Gäbe es also eine Lage wie in S4-28-B, dann hätte das Ausgangsverfahren genau 26 Rang-1- und 8 Rang-2-Formen α_t. Für den Ausschluss brauche ich das nicht.

---

## 7. Beweis des Hauptsatzes (Aussage S4-28-C)

Angenommen, es gibt ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper F, bei dem jede Normalform e ≤ 2 hat. Nach R1 ist es auch ein Verfahren über K = F̄ (algebraisch abgeschlossen, also unendlich). Nach E2-A hat jede Normalform e = 2.

Wähle S und die (S, T_p), [p] ∈ 𝒫, wie in 5.2. Jede dieser Normalformen hat e = 2 und erfüllt (ALLG). Zu jeder gehören Σ_p := {t : w_t ≠ 0} und der Kegelschnitt C_0(p) (der Vektor w und damit Σ_p hängen von T_p ab). Es gibt nur endlich viele Teilmengen von {1, …, 34}, und 𝒫 ist unendlich. Also gibt es eine Teilmenge Σ* und eine unendliche Teilmenge 𝒫* ⊆ 𝒫 mit Σ_p = Σ* für alle [p] ∈ 𝒫*.

**Schritt 1 (Der Kegelschnitt ist fest).** Y und Ω hängen nicht von p ab (Rang der α_t). Für [p] ∈ 𝒫* ist Π_1 = {[Sᵀx_t] : t ∈ Y ∩ Σ*} (5.3: die a-Punkte der Rang-1-Indizes hängen nicht von p ab), und nach S4-28-B (iv) hat Π_1 mindestens 7 Elemente. Jeder Kegelschnitt C_0(p), [p] ∈ 𝒫*, ist irreduzibel (E2-B, Teil 1) und enthält alle a-Punkte von Σ*, also Π_1. Zwei verschiedene irreduzible Kegelschnitte haben höchstens 4 gemeinsame Punkte (Begründung: Ist C = {g = 0} irreduzibel und g′ nicht proportional zu g, dann ist g′ auf der Parametrisierung P¹ ≅ C̄ eine binäre Form vom Grad 4, und sie ist nicht null, weil sonst g | g′ (C̄ ist eine irreduzible Kurve, g′ verschwindet auf ihr, Nullstellensatz) und g′ wegen gleichen Grades proportional zu g wäre; eine von null verschiedene binäre Quartik hat höchstens 4 Nullstellen in P¹). Da 7 > 4, sind **alle C_0(p), [p] ∈ 𝒫*, derselbe Kegelschnitt C***.

**Schritt 2 (Ein Rang-2-Punkt auf C*).** Ω hat 8 Elemente (S4-28-B (i)), wähle z ∈ Ω. Nach S4-28-B (ii) ist z ∈ Σ*, also liegt der a-Punkt von z in der Normalform zu (S, T_p) auf C_0(p) = C* für alle [p] ∈ 𝒫*. Nach 5.3 ist [p] ↦ a-Punkt von z eine injektive Abbildung P¹ → ℓ_z. Also enthält ℓ_z ∩ C̄* unendlich viele Punkte (C̄* der projektive Abschluss).

**Schritt 3 (Widerspruch).** Sei G* die homogene quadratische Gleichung von C̄*. Eingeschränkt auf eine Parametrisierung der Geraden ℓ_z ist G* eine binäre Form vom Grad 2 mit unendlich vielen Nullstellen in P¹, also null. Dann liegt ℓ_z ganz in C̄*, und die lineare Gleichung von ℓ_z teilt G* (Nullstellensatz, ℓ_z ist irreduzibel). G* ist dann reduzibel, im Widerspruch zu E2-B, Teil 1. ∎

**Was der Beweis wirklich braucht.** Aus S4-28-B werden nur (ii) (ein Rang-2-Index im Träger von w) und (iv) (mindestens 5 verschiedene feste Punkte im Träger von w) gebraucht. (ii) allein folgt auch ohne S4-28-A: Lägen alle Rang-2-Indizes außerhalb Σ, so wäre c_i·w = 0, also Θ(j) = c_1j_1 + c_2j_2 = 0 für j_i ∈ w·P_2 (E2-B, Teil 3), im Widerspruch zu dim Θ(J³_0) = 8. Für (iv) brauche ich dagegen K′ ∩ K^Ω = 0, und das kommt aus der ganzen Kette Satz R → Fasern → Zählung (Abschnitt 6, Schritte 1 bis 4).

**Warum das bei e = 3 nicht ebenso geht (nur zur Abgrenzung, nicht mein Auftrag).** Bei e = 3 liegen die a-Punkte von Σ auf keinem Kegelschnitt (dim w·P_2 = 6), es gibt keine feste Kurve, an der die wandernden Rang-2-Punkte hängen bleiben könnten. Der Fall „Z auf einem Kegelschnitt“ in S4-21, Lücke L-21 (b), ist eine andere Lage: Dort ist der Kegelschnitt nicht durch feste Punkte bestimmt.

---

## 8. Abgrenzung und Sicherheit des Beweises

**Was bewiesen ist und was Rechnung.** S4-28-A, -B und -C sind in den Abschnitten 4 bis 7 vollständig ausgeschrieben und benutzen keine Rechnung. S4-28-E ist nur Rechnung; sie bestätigt Schritt 1 von Abschnitt 4 an Beispielen und sagt sonst nichts.

**Verhältnis zu den gescheiterten Ansätzen in S4-15, Abschnitt 9.**
- 9.1 (Sättigung (K″ : P_2) ∩ K^Σ = w·P_2): nicht benutzt. Ich zeige nichts über c_i·w.
- 9.2 (Einschränkung von (C′) auf Σ): nicht benutzt. (C′) geht nur über (C) in Satz R ein.
- 9.3 (höchste Anteile im graduierten Modul): nicht benutzt. Satz R bei e = 2 sagt sogar, dass der graduierte Modul in Grad 5 verschwindet; das erklärt, warum dieser Ansatz dort nichts sehen konnte.
- 9.4 (Zählung über Z in einer festen Normalform): Meine Zählung (Abschnitt 6, Schritte 2 bis 4) zählt dagegen nach Fasern der Klassen I und II in einer **allgemeinen** Normalform. Die Klassen gibt es erst durch (ALLG); in einer festen Normalform können Fasern zufällig zusammenfallen, und dann gilt Schritt 2 („|T_p| = d_p auf Klasse I“) nicht. Das ist der Unterschied.

**Stellen, die ein Prüfer besonders ansehen sollte.**
1. Abschnitt 4, Schritt 0 und 1: Kern der Auswertung auf P_3 gleich g_0·P_1 und das Abziehen von λ_ig_0 vor dem Koszul-Schritt.
2. Abschnitt 5.2: dass Lemma A für jede Vervollständigung von u zu S und von p zu T funktioniert und dass S für alle p fest bleiben darf. Im Beweis von Lemma A hängt die Bedingung P(u, p) ≠ 0 nur von der ersten Spalte u von S und der ersten Zeile p von T ab; Schritt 5 dort benutzt nur, dass u_0, u_1, u_2 eine Basis sind.
3. Abschnitt 7, Schritt 1: Σ_p und w hängen von T_p ab (auch von der zweiten Zeile). Das Schubfachargument fängt das ab; gebraucht wird nur, dass C_0(p) der einzige Kegelschnitt durch die a-Punkte von Σ_p ist und dass die Rang-1-Punkte darin nicht von p abhängen.
4. Abschnitt 6, Schritt 6: Eine Faser in Y kann Indizes mit w_t = 0 und mit w_t ≠ 0 zugleich enthalten. Das stört nicht, weil (w·f)_t = w_t·f(p) an allen Indizes der Faser gilt.

**Folgerung für die Fallunterscheidung B-025.** B-025 teilt jede einzelne Normalform in „e = 3 mit (INJ5)“, „e = 3 ohne (INJ5)“, „e ≤ 2“ ein. S4-28-C schließt nicht „e ≤ 2 in einer Normalform“ aus, sondern „e ≤ 2 in jeder Normalform“. Für die untere Schranke 35 reicht das, wenn auf der Seite e = 3 bewiesen wird: „Kein Verfahren der Länge 34 hat irgendeine Normalform mit e = 3.“ So ist die Folgerung aus S4-21-V in S4-21 schon formuliert. Ein Ausschluss, der nur einzelne Normalformen mit e = 3 behandelt, reicht mit S4-28-C nicht.

---

## 9. Rechnung (Aussage S4-28-E)

Programm `chk.py` (Anhang A), eigener Code, unabhängig von S4-15 geschrieben, exakt modulo p = 32003. Eine Lage: Σ mit 9 bis 32 verschiedenen Punkten auf einem Kegelschnitt aus einer zufälligen Basis φ_0, φ_1, φ_2 von S², Fasern zufällig, w ≠ 0 genau auf Σ; 2 bis 12 weitere Indizes auf 1 bis 6 zufälligen Punkten mit w = 0; u_1, u_2 zufällig (in der Hälfte der Lagen auf etwa der Hälfte von Σ null). Zulässig heißt dim J = 7, dim K′ = 13, dim K″ = 21, dim w·P_2 = 5. Für zulässige Lagen wird J³_0 als Kern von (y_0, y_1, y_2) ↦ Σ a_i·(y_i·J) berechnet und mit dem Raum der Koszul-Tripel (w·Σ_k ψ_{ik}a_k)_i verglichen (ψ antisymmetrisch, Einträge in P_1, 9 Erzeuger); außerdem dim(K″ + a_1K″ + a_2K″).

Rechenblock 1: `python3 -I chk.py 1 90`, 12:37:27 bis 12:38:57 UTC, ein Kern, nach Commit b386450 (12:37:27 UTC). Ausgabe:

```
('OK', 8, 8, 8, 'dim(K2+aK2)', 27) 5362
('OK', 8, 8, 8, 'dim(K2+aK2)', 29) 3859
('OK', 8, 8, 8, 'dim(K2+aK2)', 28) 3601
('OK', 8, 8, 8, 'dim(K2+aK2)', 31) 3254
('OK', 8, 8, 8, 'dim(K2+aK2)', 30) 2526
('OK', 8, 8, 8, 'dim(K2+aK2)', 26) 2061
('OK', 8, 8, 8, 'dim(K2+aK2)', 25) 1441
('OK', 8, 8, 8, 'dim(K2+aK2)', 24) 1111
('OK', 8, 8, 8, 'dim(K2+aK2)', 23) 691
dimK2 406
('OK', 8, 8, 8, 'dim(K2+aK2)', 22) 280
('OK', 8, 8, 8, 'dim(K2+aK2)', 21) 147
dimK1 1
```

Lesart: In allen 24 334 zulässigen Lagen ist dim J³_0 = 8, der Koszul-Raum hat Rang 8, und die Summe hat Rang 8, also stimmen beide überein (Abschnitt 4, Schritt 1). In 147 Lagen ist K″ abgeschlossen (dim 21), in den übrigen nicht. Die Lagen sind keine Verfahren; die Rechnung prüft nur den Hilfsschritt und zeigt, dass abgeschlossene Lagen vorkommen, Satz R allein also nicht ausschließt.

---

## 10. Gescheiterte und verworfene Ansätze (mit Grund)

1. **Kegelschnitt fest ohne Satz G.** Erster Versuch für Abschnitt 7: Σ hat mindestens 9 verschiedene a-Punkte (E2-B), also sollten genug feste Rang-1-Punkte auf C_0 liegen. **Gescheitert:** Ohne die Zählung aus Abschnitt 6 lässt sich nicht ausschließen, dass die meisten Punkte von Σ Rang-2-Punkte sind, die mit p wandern. Durch höchstens 4 feste Punkte geht ein ganzes Büschel von Kegelschnitten, und eine Familie C_0(p) aus diesem Büschel könnte den wandernden Punkten folgen. Erst S4-28-B (iv) (mindestens 7 feste Punkte) schließt das. Grund: Die Schranke braucht K′ ∩ K^Ω = 0.
2. **Satz K und Satz L aus S4-21 bei e = 2 (graduierte Fassung von (C′)).** Ich habe (C′) auf Ω als Bedingung im graduierten Modul geschrieben: Mit ν : K^Ω → K″/K′ (ein Isomorphismus nach S4-28-B (iii)) und der Multiplikation μ_i : K′/J → K″/K′ lautet (C′) [c_i·w·g] = μ_i(κ̄(g)) für g ∈ P_2, und 𝒦 ⊇ P_2|_Ω hat Dimension 5 oder 6 (Satz K überträgt sich: {k ∈ K′ : a_1k, a_2k ∈ K′} = J gilt bei e = 2, S4-15, 9.1). **Verworfen, nicht zu Ende geführt:** Daraus allein ergab sich kein Widerspruch (Θ̄ : ker L → gr_4 kann bijektiv sein, μ_1(gr_3) + μ_2(gr_3) = gr_4), und das Argument aus Abschnitt 7 macht ihn überflüssig. Das ist derselbe Engpass wie in S4-15, 9.3, und S4-21, 8.2 Nr. 2.
3. **Nur die Gestalt von Θ auf Ω.** Θ(J³_0) = K^Ω heißt: Die 8 Funktionale V ↦ ⟨n_z, V(θ_z)⟩ auf (S²)³ (n_z die Gleichung von ℓ_z, θ_z der Parameter von z auf C_0) sind linear unabhängig. **Gescheitert:** Für allgemeine Richtungen ist das erfüllt; ein Widerspruch entsteht erst, wenn man p bewegt (Abschnitt 7).

---

## 11. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Kontakt nach außen: keiner. Websuche: keine.
- Rechenblöcke: 1 (Abschnitt 9), 90 Sekunden, ein Kern, 12:37:27 bis 12:38:57 UTC.
- Commits: b386450 (12:37:27 UTC, Entwurf), danach die Fassung mit dieser Datei. Dauer aus den Git-Zeitstempeln dieses Zweigs.

---

## Anhang A: Programm (Python 3, numpy, exakt modulo p = 32003, keine Gleitkommazahlen)

Aufruf: `python3 -I chk.py <Saat> <Sekunden>`. Die Laufzeitgrenze macht die Zahl der Lagen maschinenabhängig.

### chk.py

SHA-256 `3ee1471d543217f0a0bcb01c5a03161e26441843e8f076025a83a2d7074fdbac`

```python
import numpy as np, sys, time
# exact linear algebra mod P (own code)
P = 32003
def rref(M):
    M = np.array(M, dtype=np.int64) % P
    if M.ndim == 1: M = M[None, :]
    r = 0; piv = []
    for c in range(M.shape[1]):
        if r == M.shape[0]: break
        nz = np.nonzero(M[r:, c])[0]
        if len(nz) == 0: continue
        k = r + nz[0]
        if k != r: M[[r, k]] = M[[k, r]]
        M[r] = M[r] * pow(int(M[r, c]), P - 2, P) % P
        col = M[:, c].copy(); col[r] = 0
        nzr = np.nonzero(col)[0]
        if len(nzr): M[nzr] = (M[nzr] - np.outer(col[nzr], M[r])) % P
        piv.append(c); r += 1
    return M[:r], piv
def rank(M):
    M = np.asarray(M)
    return 0 if M.size == 0 else len(rref(M)[1])
def null(M):
    M = np.array(M, dtype=np.int64) % P; n = M.shape[1]
    R, piv = rref(M); free = [c for c in range(n) if c not in piv]
    N = np.zeros((len(free), n), dtype=np.int64)
    for a, f in enumerate(free):
        N[a, f] = 1
        for i, c in enumerate(piv): N[a, c] = (-R[i, f]) % P
    return N
def mons(a1, a2, d):
    out = []
    for tot in range(d + 1):
        for i in range(tot + 1):
            out.append(np.array([pow(int(x), i, P) * pow(int(y), tot - i, P) % P for x, y in zip(a1, a2)]))
    return np.array(out, dtype=np.int64)

rng = np.random.default_rng(int(sys.argv[1])); T = float(sys.argv[2]); r = 34
def lage():
    # Sigma on parabola a2=a1^2 or general conic via random phi, Z off conic, w=0 on Z, u random
    nZ = int(rng.integers(2, 13)); nS = r - nZ; kS = int(rng.integers(9, nS + 1))
    Phi = rng.integers(0, P, (3, 3))
    pts = []
    while len(pts) < kS:
        s, t = rng.integers(0, P, 2); v = Phi @ np.array([s * s % P, s * t % P, t * t % P]) % P
        if v[0] == 0: continue
        i0 = pow(int(v[0]), P - 2, P); pts.append((v[1] * i0 % P, v[2] * i0 % P))
    pts = np.array(pts)
    idx = np.concatenate([np.arange(kS), rng.integers(0, kS, nS - kS)])
    npz = int(rng.integers(1, 7)); zp = rng.integers(0, P, (npz, 2)); zi = rng.integers(0, npz, nZ)
    a1 = np.concatenate([pts[idx, 0], zp[zi, 0]]) % P; a2 = np.concatenate([pts[idx, 1], zp[zi, 1]]) % P
    w = np.concatenate([rng.integers(1, P, nS), np.zeros(nZ, dtype=np.int64)])
    U = rng.integers(0, P, (2, r))
    if rng.random() < 0.5: U[:, :nS][:, rng.random(nS) < 0.5] = 0
    return a1, a2, w, U

t0 = time.time(); stats = {}
while time.time() - t0 < T:
    a1, a2, w, U = lage()
    one = np.ones(r, dtype=np.int64); A = [one, a1, a2]
    J = rref(np.vstack([mons(a1, a2, 2) * w % P, U]))[0]
    if len(J) != 7: stats['dimJ'] = stats.get('dimJ', 0) + 1; continue
    Kp = rref(np.vstack([J, a1 * J % P, a2 * J % P]))[0]
    if len(Kp) != 13: stats['dimK1'] = stats.get('dimK1', 0) + 1; continue
    Kpp = rref(np.vstack([Kp, a1 * Kp % P, a2 * Kp % P]))[0]
    if len(Kpp) != 21: stats['dimK2'] = stats.get('dimK2', 0) + 1; continue
    if rank(mons(a1, a2, 2) * w % P) != 5: stats['e'] = stats.get('e', 0) + 1; continue
    # J3_0 directly: (y0,y1,y2) in (K^7)^3 with sum a_i * (y_i J) = 0
    Mbig = np.hstack([(A[i][None, :] * J % P).T for i in range(3)])  # r x 21
    Z = null(Mbig)  # rows: coefficient vectors (21)
    J30 = np.array([np.concatenate([z[7 * i:7 * i + 7] @ J % P for i in range(3)]) for z in Z])
    # Koszul family: psi antisymmetric, entries in P_1: psi_01, psi_02, psi_12 each in span(1,a1,a2)
    P1 = [one, a1, a2]; fam = []
    for (i, k) in [(0, 1), (0, 2), (1, 2)]:
        for l in P1:
            comp = [np.zeros(r, dtype=np.int64) for _ in range(3)]
            # j_i += w*psi_ik*a_k ; j_k += w*psi_ki*a_i = -w*psi_ik*a_i
            comp[i] = (comp[i] + w * l % P * A[k]) % P
            comp[k] = (comp[k] - w * l % P * A[i]) % P
            fam.append(np.concatenate(comp))
    fam = np.array(fam)
    d30 = len(J30); dfam = rank(fam); dsum = rank(np.vstack([J30, fam]))
    closed = rank(np.vstack([Kpp, a1 * Kpp % P, a2 * Kpp % P]))
    key = ('OK', d30, dfam, dsum, 'dim(K2+aK2)', closed)
    stats[key] = stats.get(key, 0) + 1
for k, v in sorted(stats.items(), key=lambda x: -x[1]): print(k, v)
```
