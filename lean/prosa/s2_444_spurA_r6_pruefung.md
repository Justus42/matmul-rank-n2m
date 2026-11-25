# S2-28: Prüfung von B-014 (Lemma K, Lemma Z, Satz F, Folgerung F1)

- Auftrag: S2-28 (Stufe 2, Runde 7, Spur A), Rolle Prüfer. Geprüft wird die Behauptung `behauptungen/B-014.md` mit dem Artefakt `lean/prosa/s2_444_spurA_r6.md` (S2-24, PR 53).
- Datum: 25.11.2026
- Status von B-014 nach dieser Prüfung: **behauptet** (unverändert). Eine Prosa-Prüfung macht nach Abschnitt 5.1 des Protokolls nichts geprüft. Wörter wie „hält“ unten sind das Urteil dieses Prüfers über den Prosa-Beweis, kein Status.
- Fremdmodell: openai/gpt-6.2-sol über die Bridge (OpenRouter, Batch, Denkstufe high), unabhängig, ohne mein Urteil. Ergebnis in Abschnitt 7.
- Code: `versuche/s2-28/` (Python, exakte Arithmetik in GF(2³¹−1) und in GF(4), GF(7), GF(8), keine Gleitkommazahlen).

---

## 0. Was ich gelesen habe (Offenlegung)

Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, `behauptungen/B-014.md` (Aussage, ohne Prüfvermerke, es gab keine), `lean/prosa/s2_444_spurA_r6.md` (ganz), `lean/prosa/s2_444_spurA_r4.md` (ganz, für Definitionen, Satz C, Folgerung C2, Lemma P, Satz E, Abschnitt 5.3), `lean/prosa/s2_444_spurA_r2.md` Abschnitte 2 bis 7 (Ψ, Satz A, Lemma 13′, Lemma V, Lemma S, Satz B), `lean/prosa/yang_n4.md` (Folgerung 7, Lemma 8, Lemma 9).

Nicht gelesen: keine Datei mit „pruefung“ im Namen außer dieser, nichts unter `versuche/s2-23-pruefung/` (nur die Dateinamen erschienen einmal in einer Verzeichnisliste), nicht `LOG.md`, keine Prüfvermerke anderer Prüfer.

Offen zu sagen ist aber: Meine Sitzung bekommt das Projektgedächtnis automatisch eingeblendet. Darin standen Kurzfassungen früherer Arbeiten, unter anderem eine Zeile zur Prüfung S2-23, nach der dort ein Vorschlag zum Schluss von Unterfall B „keinen Fehler“ zeigte, und eine Zeile zu S2-22 (Satz C hält, C1 nur generisch). Ich habe das vor Beginn der Prüfung gesehen. Ich habe es nicht benutzt: Jeder Schritt unten ist aus den Texten selbst nachvollzogen. Für die Unabhängigkeit nach Abschnitt 4 des Protokolls ist das trotzdem eine Einschränkung, die der Orchestrator kennen soll.

---

## 1. Urteil in Kürze

**Lemma K, Lemma Z, Satz F und Folgerung F1 halten mit benannten Reparaturen** (R-K, R-F1, R-F2, R-F3 in Abschnitt 4). Sie betreffen einen zu knapp begründeten Schritt in Lemma K (über endlichen Körpern), eine ausgelassene, aber mit den Voraussetzungen sofort zu schließende Folgerung in (B3) und die Formulierung von Satz F. Keine ändert eine Aussage. Eine Lücke im Sinn eines falschen oder unbegründeten Schritts habe ich nicht gefunden. Weitere knappe, aber richtige Stellen schreibe ich in Abschnitt 4 aus (E1 bis E4), damit der Formalisierer sie nicht neu finden muss.

**Fremdmodell (GPT 6.2 Sol, unabhängig):** ebenfalls „hält mit benannter Reparatur“, alle 13 Fragen mit JA beantwortet, zwei davon mit Zusatz. Es nennt dieselbe Reparatur in Lemma K und als wichtigste Lücke der Darstellung den ausgelassenen Rangschritt in (B3) (R-F3). Einzelheiten in Abschnitt 7.

Unter den Voraussetzungen aus Abschnitt 2 gilt damit: Fall (5,8) ist ausgeschlossen. Die Kette zu R(⟨4,2,4⟩) ≥ 26 ist so belastbar wie ihre schwächsten Glieder B-012 und B-013, die beide noch behauptet sind.

Eigene Rechnungen (Abschnitt 5): Lemma K ohne Ausnahme über GF(4), GF(7), GF(8) für n = 2 und über GF(4) für n = 3 (erschöpfend, neue Körper gegenüber S2-24, darunter Charakteristik 2 mit Nicht-Primkörpern). Lemma Z an den minimalen Zerlegungen von ⟨2,2,2⟩ (Strassen) und ⟨2,2,3⟩ (Länge 11) samt zufälligen äquivalenten Zerlegungen: (G) gilt, Klassen haben höchstens zwei Elemente, und die Schranke ⌈r/2⌉ wird **genau erreicht**. Die Zahl 13 in Satz F ist also keine Abschätzung mit verstecktem Spielraum, sondern die scharfe Konsequenz von Lemma Z.

---

## 2. Voraussetzungen, die Satz F benutzt (genau aufgelistet)

Geprüft im Sinn von 5.1 und hier ohne Vorbehalt benutzt:
- **B-007:** R(⟨4,2,4⟩) ≥ 25 über jedem Körper. Gebraucht für die Minimalität (kein A_t, B_t null; keine zwei Terme mit A_{t′} ∥ A_t und B_{t′} ∥ B_t), und zwar über dem algebraischen Abschluss K̄.
- **Lemma R1** (yang_n4.md): Übergang zu K̄.
- **B-008 (Satz A), B-009 (Satz B), Kern:** Eine 25er-Zerlegung hat für generisches p und generisches u_0 (rk L, rk H) ∈ {(3,6), (5,8)}. Benutzt in F1 und in (B3) für die Transponierte (damit sie im Fall (5,8) liegt und rk H = 8 hat).

Nur behauptet, hier als Voraussetzung genommen und nicht geprüft:
- **Aus B-012 (Satz C, Folgerung C2):** Im Fall (5,8) gibt es eine nichtleere offene Menge P_ns zulässiger p, an denen keine invertierbare M mit M b_t(p) ∈ K·a_t(p) für alle t existiert; für p ∈ P_ns und zulässiges u_0 ist N(u_0) = 0 und s = 1. Dasselbe für die Transponierte (sie ist selbst eine 25er-Zerlegung im Fall (5,8), C2 gilt für sie unmittelbar).
- **Aus B-013 (Lemma P, Satz E):** Für p ∈ P_ns und generisches zulässiges u_0 liegt die Zerlegung in Unterfall B, das heißt: es gibt u* ∉ K·u_0 mit rk F_{u*} = 1. Benutzt wird von Unterfall B **nur** rk F_{γ*} = 1 (nicht dim K* = 3, nicht Q_2). Dasselbe für die Transponierte.
- **Aus S2-05 Abschnitt 2 und yang_n4.md:** (Ψ1) Nichtsingularität von Ψ (Folgerung 7 aus (N2)); (N1) a_t(p)·u_0 ≠ 0 für zulässige u_0; Folgerung A2 (rk L = 5 ⇒ Ĵ_p = ker W); rk L = dim Ĵ_p − 4.

Nicht benutzt (entgegen dem ersten Anschein): Vermutung B aus S2-16, Satz C direkt (nur über C2), Satz R aus `versuche/s2-blind-r5.md`, die Aussage d = e = 3.

**Benutzt die Behauptung Unterfall B genau so, wie er in S2-16 definiert ist?** Ja. Unterfall B ist in s2_444_spurA_r4.md Abschnitt 5.1 definiert durch dim K* = 3, rk F_{γ*} = 1 und F_γ(K*) ⊆ Q_2. Satz F braucht davon nur rk F_{γ*} = 1 (B0). Die Ableitung (B0) ⇒ dim Ψ(D, K⁴) = 5 habe ich nachgerechnet: F_{γ*}(x) = Ψ(u*, x) + J, also dim(J + Ψ(u*, U)) = dim J + rk F_{γ*} = 4 + 1, und Ψ(D, U) = Ψ(u_0, U) + Ψ(u*, U) wegen der Bilinearität.

---

## 3. Schritt für Schritt

### 3.1 Lemma K

Hält, über jedem Körper. Nachvollzogen:
- Schritt 1: (Y′p)_j ≠ 0 als Polynom, sonst Xp = 0 (K[p] nullteilerfrei). Daraus verschwinden alle 2×2-Minoren von [Xp | X′p] als Polynome. Richtig.
- rk X = 2: Auswertung an e_1, e_2, e_1+e_2 gibt X′ = λX. Über 𝔽₂ ist e_1 + e_2 ≠ 0, das genügt. Richtig.
- rk X = 1: X′p ∥ x auf der offenen Menge l_1·p ≠ 0, „also für alle p (abgeschlossene Bedingung)“. **Über einem endlichen Körper trägt diese Begründung nicht** (ein Polynom kann an allen Punkten außerhalb einer Geraden verschwinden, ohne null zu sein). Die Aussage stimmt trotzdem, mit der Reparatur R-K: (l_1·p)·(x ∧ X′p) = Xp ∧ X′p ist nach Schritt 1 das Nullpolynom, l_1·p ≠ 0 im Integritätsbereich K[p], also x ∧ X′p = 0 als Polynom. Für Lemma Z selbst spielt das keine Rolle, weil dort über K̄ gearbeitet wird; Lemma K ist aber „über jedem Körper“ formuliert.
- Teilbarkeit: l_1·p und l_1′·p sind nicht assoziierte Primelemente, l_1′·p teilt (l_1·p)(Yp)_k, also (Yp)_k. Richtig.
- Folgerung K1: Bei festem (X, Y) sind in Fall (ii) l_1, l_2, x, w bis auf Skalare durch X, Y festgelegt, also ist die Tauschbahn eindeutig. Richtig. (Fall (ii) setzt rk X = rk Y = 1 mit verschiedenen Zeilenräumen voraus.)

### 3.2 Lemma Z

Hält. Im Einzelnen:

**∼ und die Polynombedingung.** Lineare Abhängigkeit von a_t(p) ⊗ b_t(p) und a_{t′}(p) ⊗ b_{t′}(p) ist das Verschwinden aller 2×2-Minoren, homogene Polynome vom Grad 4 in p. Entweder alle null, oder es gibt nur endlich viele Nullstellen in ℙ¹. Richtig.

**Schritt 1 (κ_t konstant).** Für t ∈ S ist die t-Koordinate jedes Vektors von Ĵ_p gleich uᵀ(a_t b_tᵀ)w = κ_t(p)·uᵀ(a_{t_0}b_{t_0}ᵀ)w. Also liegt pr_S(Ĵ_p) in K·κ(p) und ist ≠ 0. Mit (G) ist pr_S(Ĵ_p) = pr_S(ker W) für p ∈ P_9, eine feste Gerade. Also ist κ(p) projektiv konstant, mit κ_{t_0} = 1 konstant. Richtig. **(G) wird richtig gewonnen:** Fall (5,8) heißt rk L = 5 für generisches p, also dim Ĵ_p = 9 = dim ker W auf einer nichtleeren offenen Menge (dim Ĵ_p ist ein Matrixrang mit polynomialen Einträgen in p, der Maximalwert wird auf einer offenen dichten Menge angenommen), und Ĵ_p ⊆ ker W folgt aus (D). Das ist genau Folgerung A2.

**Schritt 2 (Klassen ≤ 2).** Die Identität (A_t p) ⊗ (B_tᵀJp) = κ_t (A_{t_0}p) ⊗ (B_{t_0}ᵀJp) gilt auf einer unendlichen Menge von [p], beide Seiten sind Polynome vom Grad 2 in p, also gilt sie identisch (E1). Lemma K mit X = A_{t_0}, Y = κ_t B_{t_0}ᵀJ, X′ = A_t, Y′ = B_tᵀJ:
- Fall (i): A_t = λA_{t_0} und B_tᵀJ = λ⁻¹κ_t B_{t_0}ᵀJ, also B_t = μB_{t_0} (J invertierbar, auch in Charakteristik 2). Minimalität schließt das aus.
- Fall (ii) für zwei Terme t, t″ ∈ S ∖ {t_0}: Beide sind (λ x l_2ᵀ, λ⁻¹κ w l_1ᵀ) mit denselben x, w, l_1, l_2 (durch A_{t_0}, B_{t_0} festgelegt), also A_{t″} ∥ A_t und B_{t″} ∥ B_t. Minimalität schließt das aus.

**Das Minimalitätsargument** (Zusammenlegen): Aus A_{t′} = λA_t, B_{t′} = μB_t folgt α_{t′} = λα_t und β_{t′} = μβ_t als Linearformen, also α_{t′}β_{t′}C_{t′} = α_tβ_t·λμC_{t′}. Ersetze C_t durch C_t + λμC_{t′}, streiche t′: Länge 24 über K̄, Widerspruch zu B-007. Richtig.

**Zählen an derselben Stelle p.** Das ist der Punkt, den der Auftrag besonders nennt. Wähle einen Vertreter je Klasse, mindestens ⌈25/2⌉ = 13 Vertreter. Für jedes der höchstens 78 Paare von Vertretern ist die Minorenbedingung nicht identisch null, also gibt es für das Paar nur endlich viele Ausnahmepunkte [p]. Die Vereinigung über alle Paare ist endlich. Dazu kommen die endlich vielen [p] mit a_t(p) = 0 oder b_t(p) = 0. Außerhalb dieser endlichen Menge sind die 13 Punkte **an derselben Stelle p** paarweise verschieden. Es geht also nicht nur um Paare, die an irgendeiner Stelle verschieden sind. Richtig.

Bemerkung zu Lemma Z: Lemma Z gilt in jedem Format ⟨n,2,m⟩ mit minimaler Länge r und Ĵ_p = ker W für generisches p, mit der Schranke ⌈r/2⌉. Die Gegenproben in Abschnitt 5 zeigen, dass die Schranke an ⟨2,2,2⟩ und ⟨2,2,3⟩ angenommen wird: Strassen hat drei Klassen der Größe 2, alle vom Tauschtyp (A und B vom Rang 1). Das spricht dafür, dass Lemma Z richtig und nicht verbesserbar ist.

### 3.3 Abschnitt 4: (B0) bis (B3)

**(B0)** richtig (Abschnitt 2 oben). u* ∉ K·u_0, weil γ* ≠ 0 in den Koordinaten von u_1, u_2, u_3. Also dim D = 2.

**(B1)** richtig. Das Büschel u ↦ Ψ(u, ·) ∈ Hom(K⁴, V), V = Ψ(D, K⁴), dim V = 5, ist für jedes u ∈ D ∖ {0} injektiv (Ψ1). Kronecker über K̄ in jeder Charakteristik: L_ε-Blöcke (auch L_0, eine Nullspalte) haben überall Kern, reguläre Blöcke (endliche und unendliche Eigenwerte) werden an einer Stelle singulär. Bleiben L_ηᵀ-Blöcke (η ≥ 0, L_0ᵀ ist eine Nullzeile) mit Σ η_i = 4 und Σ (η_i + 1) = 5, also genau ein Block, und dieser ist L_4ᵀ. Die Kronecker-Äquivalenz ändert den Büschelparameter nicht, ein Basiswechsel in D ist erlaubt. L_4ᵀ ist die Multiplikation S³ → S⁴ mit der Linearform s·X + t·Y. Richtig.

**(B2)** richtig. Die Hankel-Aussage habe ich selbst nachgerechnet: Rang ≤ 1 der Matrix [[h_0,h_1,h_2,h_3],[h_1,h_2,h_3,h_4]]. Ist h_0 ≠ 0, ist die zweite Zeile ein Vielfaches r der ersten, also h_k = h_0 r^k. Ist h_0 = 0, geben die Minoren h_0h_2 − h_1², h_1h_3 − h_2², h_2h_4 − h_3² nacheinander h_1 = h_2 = h_3 = 0, also Auswertung im Punkt ∞. Das gilt in jeder Charakteristik. c_t ≠ 0 wegen b_t ≠ 0 und a_t·u_0 ≠ 0. b_t ∝ ν_D(σ_t): Setze u = u_0; die linke Seite (a_t·u_0)(b_t·w) ist als Linearform in w ≠ 0, also ι_D(u_0)(σ_t) ≠ 0, und b_t ist proportional zu ν_D(σ_t). [a_t|_D] = [ev_{σ_t} ∘ ι_D]: Wähle w mit b_t·w ≠ 0. Richtig.

**(B3)** richtig nach Ergänzung R-F3. Nachgerechnet: B ᵀAᵀ = Σ α_t(A)β_t(B) C_tᵀ; in den Veränderlichen A′ = Bᵀ, B′ = Aᵀ ist α′_t(A′) = β_t(A′ᵀ) mit Matrix B_tᵀ, β′_t(B′) = α_t(B′ᵀ) mit Matrix A_tᵀ. Also a′_t(p) = B_tᵀp = b_t(J⁻¹p) = −b_t(Jp) (J⁻¹ = −J) und b′_t(p) = (A_tᵀ)ᵀJp = a_t(Jp). ker W′ = ker W. Ĵ′_p ist Ĵ_{Jp} (Vorzeichen egal), also ist die Transponierte im Fall rk L = 5, nach Satz A also in (5,7) oder (5,8), nach Satz B nicht in (5,7), also in (5,8) mit rk H′ = 8. **Diesen Schritt lässt der Bericht aus** („Sie liegt im Fall (5,8)“ ohne Begründung); er ist aber nötig, weil C2 und Lemma P rk H = 8 (für s = 1) brauchen. Reparatur R-F3. Nicht symmetrisch: Symmetrie der Transponierten an p heißt M a_t(Jp) ∥ b_t(Jp), also M⁻¹ b_t(Jp) ∥ a_t(Jp), Symmetrie des Originals an Jp. Die Transponierte ist aber ohnehin eine 25er-Zerlegung im Fall (5,8), also gilt C2 für sie direkt. Die gemeinsame Stelle: Original an p, Transponierte an J⁻¹p, J⁻¹(offen) ist offen, der Schnitt zweier nichtleerer offener Mengen in ℙ¹ ist nichtleer. Der Parameter τ_t: (B2) für die Transponierte liefert **mit denselben** Kronecker-Daten (ι_{D′}, g_{D′}) sowohl b′_t ∝ ν_{D′}(τ_t) als auch τ_t = π_{D′}([a′_t]). Zurückübersetzt ist das a_t(p) ∝ ν_E(τ_t) und τ_t = π_E([b_t(p)]) mit E := D′. Also derselbe Parameter. Richtig. Das zulässige u′_0 der Transponierten erfüllt b_t(p)·u′_0 ≠ 0, daher [b_t] ∉ ℙ(E^⊥).

### 3.4 Satz F

**Schritt 1** richtig, mit der Klarstellung R-F2 (Identifikation). φ(τ) in den Koordinaten von ℙ(D*) ist [g_E(d_1)(τ) : g_E(d_2)(τ)] für eine Basis d_1, d_2 von D. g_E(d_1), g_E(d_2) sind linear unabhängige Kubiken (g_E Isomorphismus), also ist nach Kürzen des größten gemeinsamen Teilers h der Grad d ∈ {1, 2, 3}, nicht 0. An τ_t ist (g_E(d_1)(τ_t), g_E(d_2)(τ_t)) ≠ 0, weil ν_E(τ_t)·u_0 ≠ 0 (a_t·u_0 ≠ 0, u_0 ∈ D), also h(τ_t) ≠ 0 und φ(τ_t) = π_D(ν_E(τ_t)). Trifft die Kubik ℙ(D^⊥) an anderen Stellen, ändert das nichts. Richtig.

**Schritt 2** richtig. σ_1 g(τ) − σ_2 f(τ) ist bihomogen vom Bigrad (d, 1). Irreduzibel: Ein Faktor hat σ-Grad 0, ist also ein Polynom in τ, das f und g teilt, also konstant. Reduziert, weil irreduzibel. Die Nullstellenmenge ist genau der Graph, weil (f(τ), g(τ)) ≠ 0 für jedes τ. Für Γ_2 ebenso mit Bigrad (1, e).

**Schritt 3** richtig. Zwei verschiedene irreduzible Kurven haben keine gemeinsame Komponente, Bézout auf ℙ¹ × ℙ¹ gibt höchstens d·e + 1 verschiedene Schnittpunkte, in jeder Charakteristik und auch bei inseparablem φ oder ψ (die Schnittzahl zählt mit Vielfachheit, die Zahl verschiedener Punkte ist höchstens so groß). Elementarer und für Lean besser: E2. **13 verschiedene Paare:** Die Zuordnung Paar ↦ Punkt [a_t ⊗ b_t] = [ν_E(τ_t) ⊗ ν_D(σ_t)] ist eine Funktion. 13 verschiedene Punkte haben also 13 verschiedene Urbild-Paare. Die Paare liegen auf Γ_1 und auf Γ_2 nach Schritt 1. Richtig.

**Schritt 4** richtig, mit der Klarstellung E3. Aus Γ_1 = Γ_2 folgt d = e = 1. Die Begründung über „Grad der Projektion“ stimmt, wenn man den Grad als Grad der Körpererweiterung liest (inseparabler Anteil eingeschlossen). Mengentheoretisch wäre sie in Charakteristik p falsch: Ein Frobenius-artiges φ(τ) = [τ_1^p : τ_2^p] (in Charakteristik 3 mit d = 3) ist bijektiv auf Punkten. Der Schluss bleibt trotzdem richtig, siehe E3. Dann Φ ∈ GL_2, m(Φτ) = Sym³(Φ) m(τ) mit invertierbarem Sym³(Φ) (die Monome m(τ) sind linear unabhängige Polynome, Sym³(Φ)Sym³(Φ⁻¹) = I folgt durch Koeffizientenvergleich), ν_D(σ) = N_D m(σ) mit N_D = (Koeffizientenmatrix von g_D)ᵀ invertierbar. Also [b_t] = [G a_t] mit G ∈ GL_4 für alle t **an derselben Stelle p**. Das widerspricht p ∈ P_ns nach der Definition in C2 (punktweise: keine invertierbare M an p). Richtig.

### 3.5 Folgerung F1

Hält, mit R-F1 (Formulierung von Satz F). Buchführung der offenen Mengen: P_9 (G), P_ns (C2), die zulässigen p für Original und Transponierte, die Menge der p, an denen für generisches u_0 Unterfall B gilt (nach Lemma P und Satz E ist das jedes p ∈ P_ns, nach Wahl eines generischen u_0), dieselben Mengen für die Transponierte an J⁻¹p, dazu die endliche Ausnahmemenge von Lemma Z. Alle sind nichtleer offen in ℙ¹ (Komplemente endlicher Mengen), endlich viele, K̄ ist unendlich: Der Schnitt ist nichtleer. Richtig.

Zusätzliche Robustheit: Satz F zeigt für **jedes** p dieses Schnitts eine invertierbare M_p. Damit wäre die Zerlegung auf einer offenen Menge symmetrisch, und Satz C gibt den Widerspruch auch direkt, ohne den Konstruierbarkeitsschritt von C2. C2 bleibt aber nötig, weil Lemma P N(u_0) = 0 und s = 1 voraussetzt.

### 3.6 Körperannahmen

- Charakteristik 2: J = [[0,1],[1,0]] ist invertierbar, ω bleibt alternierend, Hankel und Kronecker gelten. Lemma K über GF(2), GF(4), GF(8) gegengeprüft. Kein Schritt dividiert durch 2.
- Charakteristik 3: Einziger Ort, an dem es eine Rolle spielt, ist Schritt 4 (inseparables φ möglich). Mit E3 erledigt.
- Kleine endliche Körper: Alle generischen Wahlen geschehen über K̄ (Lemma R1). Die Minimalität kommt aus B-007 über K̄. Lemma K ist über jedem Körper richtig, mit der Reparatur R-K für den Rang-1-Fall.

---

## 4. Reparaturen und Ergänzungen

**R-K (Lemma K, Rang-1-Fall).** „Also für alle p (abgeschlossene Bedingung)“ ersetzen durch das Integritätsbereich-Argument aus 3.1 oder durch das Argument des Fremdmodells: q mit l_1(q) = 1 wählen; für v ∈ ker l_1 liegen X′q und X′(q+v) in Kx, also auch X′v; mit K² = Kq ⊕ ker l_1 folgt X′ = x l_1′ᵀ. Beides gilt über jedem Körper.

**R-F3 ((B3), Fall der Transponierten).** Ausschreiben: dim Ĵ′_q = dim Ĵ_{Jq} = 9 auf einer offenen Menge, also rk L′ = 5; Satz A (B-008) lässt (5,7) und (5,8); Satz B (B-009) schließt (5,7) aus; also rk H′ = 8. Erst damit sind C2, Lemma P und Satz E auf die Transponierte anwendbar. Lemma P und Satz E werden auf beide Zerlegungen getrennt angewandt, mit getrennt gewählten u_0 und u′_0.

**R-F1 (Formulierung von Satz F in B-014).** „Liegt nicht zugleich mit ihrer Transponierten in Unterfall B“ ist ungenau, weil Unterfall B eine Eigenschaft eines Paars (p, u_0) ist. Genaue Fassung: *Es gibt kein p ∈ P_9 ∩ P_ns außerhalb der Ausnahmemenge von Lemma Z, so dass die Zerlegung an (p, u_0) für ein zulässiges u_0 in Unterfall B liegt (es gibt u* mit rk F_{u*} = 1) und die Transponierte an (J⁻¹p, u′_0) für ein zulässiges u′_0 ebenso, und J⁻¹p ∈ P′_9 ∩ P′_ns.* Der Beweis zeigt genau das. F1 liefert solche p.

**R-F2 (Identifikation in Schritt 1).** π_D bildet nach ℙ(D*) ab. Der Parameter σ lebt auf ℙ¹ über den Isomorphismus σ ↦ [ev_σ ∘ ι_D]. φ ist also [g_E(d_1) : g_E(d_2)] gefolgt von einer festen Möbius-Transformation. Der Grad d ändert sich dabei nicht. Ebenso für ψ mit ι_E. Im Bericht steht das nur implizit.

**E1 (Polynomidentität statt „offene Menge“).** Überall, wo der Bericht schließt „gilt auf einer offenen Menge, also überall“, ist gemeint: Ein homogenes Polynom in p, das an unendlich vielen Punkten von ℙ¹(K̄) verschwindet, ist null. Das ist über K̄ richtig. In Lemma K (beliebiger Körper K, auch endlich) ist stattdessen die Integritätsbereich-Fassung nötig, wie in 3.1 beschrieben.

**E2 (Bézout elementar).** Gemeinsame Punkte von Γ_1 und Γ_2 entsprechen den τ mit τ = ψ(φ(τ)). ψ ∘ φ = [F : G] mit F, G teilerfremd vom Grad d·e (ein gemeinsamer Nullpunkt τ_0 von F, G gäbe den gemeinsamen Nullpunkt (f(τ_0), g(τ_0)) ≠ 0 der Formen von ψ). Die Form τ_2 F − τ_1 G hat Grad d·e + 1. Ist sie nicht null, hat sie höchstens d·e + 1 Nullstellen in ℙ¹. Ist sie null, folgt F = τ_1 h, G = τ_2 h, mit Teilerfremdheit h konstant, also d·e = 1. Verschiedene gemeinsame Punkte haben verschiedene τ, weil σ = φ(τ). Das ersetzt Schnitttheorie vollständig und gilt in jeder Charakteristik.

**E3 (Schritt 4 in Charakteristik p).** Aus Γ_1 = Γ_2 folgt ψ(φ(τ)) = τ für alle τ, also verschwindet τ_2F − τ_1G an unendlich vielen Punkten, ist also null, und nach E2 ist d·e = 1. Ein Frobenius-artiges φ ist zwar bijektiv auf Punkten, aber seine Umkehrung ist kein Morphismus vom Grad ≤ 3, also kann es nicht als ψ⁻¹ auftreten. Alternativ: Γ_1 = Γ_2 als Mengen, beide durch irreduzible bihomogene Polynome gegeben, also sind die Polynome nach dem Nullstellensatz proportional, also gleicher Bigrad (d,1) = (1,e).

**E4 (Kronecker).** In (B1) wird die Kronecker-Normalform nur für ein 5×4-Büschel ohne Kern an jeder Stelle gebraucht. Das Fremdmodell gibt dafür einen kurzen direkten Beweis (gpt_antwort.md, Abschnitt 13), den ich nachgerechnet habe und für richtig halte: Normiere sP_0 + tP_1 zu P_0 = (I_4; 0), P_1 = (A; b). N := ∩_{i=0}^{3} ker(bAⁱ) ist nach Cayley-Hamilton A-invariant; ein Eigenvektor v von A in N gäbe (−λP_0 + P_1)v = 0, gegen die Injektivität, also N = 0. Wähle 0 ≠ v ∈ ∩_{i=0}^{2} ker(bAⁱ) (drei Gleichungen in K⁴), dann bA³v ≠ 0, v, Av, A²v, A³v sind unabhängig, und mit y_j = P_0Aʲv (j ≤ 3), y_4 = P_1A³v ist (sP_0 + tP_1)Aʲv = s·y_j + t·y_{j+1}: genau L_4ᵀ. Das ersetzt die allgemeine Normalform vollständig.

---

## 5. Eigene Rechnungen

Alle in `versuche/s2-28/`, exakte Arithmetik, keine Gleitkommazahlen, unabhängig vom Code aus S2-24 geschrieben (den ich nicht gelesen habe).

**`lemma_k_test.py`** (Ausgabe `lemma_k_ausgabe.txt`, 4 min 25 s auf einem Kern): Alle Paare (X, Y) von n×2-Matrizen ≠ 0, gruppiert nach den Koeffizienten der quadratischen Abbildung p ↦ (Xp) ⊗ (Yp), Bahnen unter (λX, λ⁻¹Y) gezählt, bei zwei Bahnen die Tauschgestalt geprüft.

| q | n | Fasern ≠ 0 | höchstens Bahnen je Faser | Fasern mit 2 Bahnen | Verstöße |
|---|---|---|---|---|---|
| 4 | 2 | 20 925 | 2 | 750 | 0 |
| 7 | 2 | 949 248 | 2 | 10 752 | 0 |
| 8 | 2 | 2 375 163 | 2 | 20 412 | 0 |
| 4 | 3 | 5 576 445 | 2 | 13 230 | 0 |

GF(4) und GF(8) sind Körper der Charakteristik 2, die keine Primkörper sind. S2-24 hatte nur Primkörper.

**`lemma_z_test.py`** (Ausgabe `lemma_z_ausgabe.txt`, unter 1 s): Strassens Zerlegung von ⟨2,2,2⟩ (Länge 7, minimal), die Zerlegung von ⟨2,2,3⟩ der Länge 11 (Strassen plus vier Produkte, minimal, da R(⟨2,2,3⟩) = 11), je drei zufällige äquivalente Zerlegungen (A ↦ X⁻ᵀA_tYᵀ usw.), in GF(2³¹ − 1). Jede Zerlegung wird vorher an Zufallsmatrizen nachgerechnet. Ergebnis:

| Zerlegung | dim ker W | (G) Ĵ_p = ker W | Klassengrößen | Klassen | ⌈r/2⌉ |
|---|---|---|---|---|---|
| Strassen ⟨2,2,2⟩ (und 3 äquivalente) | 3 | ja | 1, 2, 2, 2 | 4 | 4 |
| ⟨2,2,3⟩, Länge 11 (und 3 äquivalente) | 5 | ja | 1, 2, 2, 2, 2, 2 | 6 | 6 |
| Negativprobe: Strassen mit verdoppeltem Term (Länge 8, nicht minimal) | 4 | nein | 2, 2, 2, 2 | 4 | 4 |

In allen Klassen der Größe 2 haben A und B Rang 1 (Tauschgestalt), und die Paare (s, t) mit dim pr_{s,t}(ker W) = 1 sind genau die Klassen, wie Schritt 1 von Lemma Z vorhersagt. In der Negativprobe fällt ein Paar vom Typ (i) zusammen (A und B vom Rang 2, proportional), genau der Fall, den die Minimalität ausschließt, und (G) gilt nicht.

Die Rechnungen prüfen weder Satz F noch die Voraussetzungen. Für ⟨4,2,4⟩ der Länge 25 gibt es nach der Behauptung kein Beispiel, an dem man rechnen könnte. Ich habe nach Gegenbeispielen zu den Einzelschritten (B1), (B2), E2, E3 gesucht, indem ich die Aussagen auf ihre allgemeinste Form gebracht habe (Abschnitt 3); dort sind es Standardaussagen, für die kein Gegenbeispiel existiert.

---

## 6. Was eine Lean-Fassung braucht und wo sie am schwersten wird

In absteigender Schwierigkeit:

1. **Die Voraussetzungen aus B-012 und B-013** (Satz C mit Funktionenkörper-Ableitung, C2 mit Konstruierbarkeit, Lemma P mit dualer Kurve und Kronecker). Das ist mit Abstand der größte Teil der Kette und liegt außerhalb von B-014. Satz F sollte in Lean mit diesen Aussagen als Hypothesen formuliert werden, damit er unabhängig fertig werden kann.
2. **Generizität.** Am einfachsten über ℙ¹: „für alle p außer endlich vielen“ als Finset von Ausnahmepunkten, oder als „ein homogenes Polynom in p ist nicht null“. Der Übergang zum algebraischen Abschluss über `AlgebraicClosure K` und R1. Die Buchführung (Abschnitt 3.5) ist mühsam, aber elementar.
3. **(B1) Kronecker für das 5×4-Büschel.** Mathlib hat keine Kronecker-Normalform. Empfehlung: der direkte Beweis aus E4 (Cayley-Hamilton, Krylov-Basis v, Av, A²v, A³v), endliche lineare Algebra über einem algebraisch abgeschlossenen Körper. Mit E4 ist das machbar, bleibt aber der schwerste Teil von B-014 selbst, zusammen mit dem Übersetzen von L_4ᵀ in die Sprache binärer Formen (ι_D, g_D, Λ_D) für (B2).
4. **(B2) Hankel Rang 1.** Elementar, drei Minoren. Leicht.
5. **Lemma Z.** Mit (G) als Hypothese ist es lineare Algebra plus „Polynom mit unendlich vielen Nullstellen ist null“. Schritt 1 (projektive Konstanz von κ) braucht eine saubere Formulierung ohne rationale Funktionen: Für je zwei p, p′ ∈ P_9 sind κ(p) und κ(p′) proportional, weil beide pr_S(ker W) aufspannen. Mittel.
6. **Lemma K.** Reine Polynomalgebra. Statt Faktorialität von K[p_1, p_2] reicht Koeffizientenvergleich der drei Koeffizienten von p_1², p_1p_2, p_2². Leicht bis mittel. Guter erster Baustein.
7. **Schritt 3 und 4 von Satz F.** Mit E2 und E3: Komposition binärer Formen, `Polynomial.card_roots'` nach Dehomogenisierung, explizite 4×4-Matrix Sym³(Φ). Mittel, ohne Schnitttheorie.

---

## 7. Fremdmodell (GPT 6.2 Sol, high, Batch)

Antwort wörtlich in `versuche/s2-28/gpt_antwort.md`, Auftrag in `versuche/s2-28/gpt_auftrag.md`. Abgegeben 15:49 UTC, fertig 15:53 UTC, 0,06 US-$. Das Fremdmodell bekam den Bericht S2-24 ungekürzt, die vorausgesetzten Definitionen und Aussagen wörtlich, 13 Fragen und nicht mein Urteil.

**Urteil des Fremdmodells:** Lemma K hält mit Reparatur des Beweises, Lemma Z hält, Satz F hält mit benannter Ergänzung, F1 hält nach derselben Ergänzung. Alle 13 Fragen JA (Frage 6 und 10 mit Zusatz).

Abgleich mit meinem Urteil:

| Punkt | Prüfer | Fremdmodell |
|---|---|---|
| Lemma K, Rang-1-Fall über endlichen Körpern | Reparatur R-K | dieselbe Lücke, Reparatur über q, q + v |
| Lemma Z, Konstanz von κ, (G) aus (5,8) | hält | hält; Projektion erst für Erzeuger, dann für den Spann formulieren |
| 13 Punkte an derselben Stelle p | hält | hält, gleiche Begründung (eine endliche Ausnahmemenge) |
| (B0) bis (B2) | hält | hält, Hankel mit anderem, gleichwertigem Argument |
| (B3), Fall (5,8) der Transponierten | ausgelassener Schritt, R-F3 | „wichtigste ausgelassene Schlussfolgerung“, dieselbe Ergänzung |
| φ, ψ und Identifikation über ι_D | R-F2 | dieselbe Präzisierung |
| Bézout, 13 verschiedene Paare | hält, E2 | hält, Fixpunktargument wie E2 |
| d = e = 1 in Charakteristik p | hält, E3 | hält, gleiche Begründung (Grad des Morphismus, nicht Punktzahl) |
| Widerspruch an einer Stelle p | widerspricht C2 punktweise | ebenso; betont, dass Satz C allein an einer Stelle nicht reichte |
| Generizität | hält, R-F1 | hält; p in der affinen Ebene wählen, danach u_0 getrennt für beide Zerlegungen |

Abweichungen: keine in der Sache. Zwei Ergänzungen des Fremdmodells übernehme ich: den direkten Beweis der Kronecker-Gestalt (E4) und die Bemerkung, dass Satz F an einer einzelnen Stelle nur C2 widerspricht, nicht Satz C. Mein Hinweis in 3.5 (Satz F gilt an jedem p einer offenen Menge, also wäre auch Satz C direkt verletzt) ist damit verträglich: Er braucht den ganzen offenen Schnitt, nicht eine Stelle.

**Unabhängigkeit:** Das Fremdmodell sah mein Urteil nicht. Ich habe meinen Bericht bis auf diesen Abschnitt und die Reparaturen R-K, R-F3 und E4 vor dem Eintreffen der Antwort geschrieben. Die Lücke in Lemma K hatte ich vorher gefunden (als Ergänzung E1 eingestuft, jetzt als Reparatur R-K), den ausgelassenen Rangschritt in (B3) hatte ich in 3.3 nachgerechnet, aber erst nach der Antwort als Reparatur benannt.

---

## 8. Statusübersicht

| Aussage | Urteil dieses Prüfers | Status |
|---|---|---|
| Lemma K | hält mit Reparatur R-K | behauptet |
| Lemma Z | hält (E1) | behauptet |
| (B0) bis (B3) | hält mit Ergänzung R-F3, benutzt Unterfall B nur über rk F_{γ*} = 1 | behauptet |
| Satz F | hält mit Reparatur R-F1 (Formulierung) und R-F2 (Identifikation), Ergänzungen E2, E3 | behauptet |
| Folgerung F1 | hält unter B-012, B-013, mit R-F3 | behauptet |
| Folgerung F2 | folgt aus F1 und B-007 bis B-013; so belastbar wie B-012, B-013 | behauptet |

---

## 9. Dateien

- `lean/prosa/s2_444_spurA_r6_pruefung.md`: dieser Bericht.
- `behauptungen/B-014.md`: Prüfvermerk ergänzt, Status unverändert behauptet.
- `versuche/s2-28/lemma_k_test.py`, `lemma_k_ausgabe.txt`: Lemma K über GF(4), GF(7), GF(8).
- `versuche/s2-28/lemma_z_test.py`, `lemma_z_ausgabe.txt`: Lemma Z an ⟨2,2,2⟩ und ⟨2,2,3⟩.
- `versuche/s2-28/gpt_auftrag.md`, `gpt_antwort.md`: Auftrag an das Fremdmodell (wörtlich) und Antwort.

Aufrufe aus `versuche/s2-28/`: `python3 lemma_k_test.py`, `python3 lemma_z_test.py` (Python 3, keine weiteren Pakete). Rechenzeit insgesamt unter 5 Minuten auf einem Kern. Nichts läuft im Hintergrund weiter.
