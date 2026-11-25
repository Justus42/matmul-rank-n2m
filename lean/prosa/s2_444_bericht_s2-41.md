# S2-41: Prüfbericht zu B-014 (Lemma K, Lemma Z, Satz F, F1, F2)

Auftrag S2-41 des Orchestrators, Rolle Prüfer. Geprüft wird die Aussage in `behauptungen/B-014.md` gegen den Prosa-Beweis in `lean/prosa/s2_444_spurA_r6.md` §2 bis §6. Stand von `main` beim Lesen: Commit e1f0aa5. Kein Fremdmodell befragt.

Dieser Bericht setzt keinen Status. Er enthält ein Prüfurteil und benannte Reparaturen.

---

## 0. Offenlegung

### 0.1 Eingeblendete Gedächtniseinträge

Beim Start eingeblendet (dem Orchestrator vor dem ersten Lesen gemeldet):

- `team/silo/MEMORY.md` (Index): Repo und Ziel des Projekts, Rechte und Grenzen des Orchestrators, Freigaben von Justus vom 25.11.2026 (nur Spur A, Vorrang Lean, weitere Runden nach Ermessen), Angaben zum Fremdmodell, Regeln für Aufträge an Prüfer und Blind-Sucher, Rundenlimits aus Protokoll Abschnitt 6, Literaturwache, Hinweise zu Merges und zum Logbuch-Thread. Verweist auf `verfahren-datenformat` und `lean-project-ci` (nicht geöffnet, Inhalt nicht eingeblendet). Nichts zu Behauptungen, Status oder Prüfurteilen.

Später, während der Arbeit, ohne mein Zutun zusätzlich eingeblendet (nicht geöffnet, nur angezeigt):

- `yang-n4-prosa`: S1-03, Prosa-Beweis Yang v3 Satz 2 in `lean/prosa/yang_n4.md`, PR #14; der Fall n = 4 brauche einen algebraisch abgeschlossenen Körper (Lemma 9); Darstellungsfragen und Fassung von Lemma 13 in Abschnitt 6 der Datei.
- `yang-n3-prosa`: S1-02, Prosa-Beweis Yang v3 Satz 1 (n = 3) in `lean/prosa/yang_n3.md`, PR #13; n = 3 brauche nur einen unendlichen Körper; Gliederung für die Formalisierung.
- `abgleich-yang-n4-b007`: S1-19, PR #30, Datei `behauptungen/B-007.md`; Praxis-Hinweise (die Bridge kann das Repo nicht lesen; Lean-Werkzeugkette lokal nicht ladbar, mathlib-Quellen über raw.githubusercontent.com lesbar).

Keiner dieser Einträge betrifft B-012, B-013 oder B-014. Sie haben das Urteil nicht beeinflusst.

### 0.2 Gelesenes und Zugriffe außerhalb der Liste

- Gelesen: `CLAUDE.md` (eingeblendet), `PROTOKOLL.md` Zeilen 121–171 (Abschnitt 5) und dessen Überschriftenzeilen (um Abschnitt 5 zu finden), `behauptungen/B-014.md` ganz, `s2_444_spurA_r6.md` Zeilen 27–195 (§2 bis §6), `s2_444_spurA_r4.md` Zeilen 26–45 (§2) und 139–192 (§5.1 bis §5.3), `s2_444_spurA_r2.md` Zeilen 26–52 (§2), `yang_n4.md` Zeilen 43–124 (R1, R3, Lemma 6, Folgerung 7). Zum Auffinden der Abschnitte habe ich in r6, r4, r2 und yang_n4.md nur die Überschriftenzeilen gesucht. Dabei kamen in yang_n4.md auch die Zeilen 53, 143, 332, 341, 398, 410 als Suchtreffer (für „R1“ bzw. „Folgerung 7“) zur Anzeige.
- Ein Befehl `ls /home/user` zu Beginn wurde von der Umgebung abgelehnt und nicht ausgeführt.
- Ein Befehl hat den Kopf-Commit von `main` angezeigt (Hash und Zeit, eine Zeile), um den Prüfstand zu benennen. Keine Liste von Commits, PRs oder Actions-Läufen gelesen.
- Keine anderen Dateien des Repos, keine Prüfvermerke, kein `STATUS.md`, kein `LOG.md`, kein `archiv/`, kein `versuche/` (auch nicht `versuche/s2-24/klassen_lemma.py`; die Gegenprobe in §4 dieses Berichts ist eigener Code).

### 0.3 Stellen mit Statuswörtern in den gelesenen Abschnitten

Automatisch gesucht nach den fünf Statuswörtern sowie „bewiesen“ und „gelöst“:

- r6 Z. 43: B-007 „geprüft“.
- r6 Z. 45: „alles behauptet, dort bewiesen“ (zu den Übernahmen aus S2-16).
- r6 Z. 165: Folgerung F1 „behauptet“.
- r6 Z. 169: Folgerung F2 „behauptet“; B-007, B-010 „geprüft“.
- r6 Z. 173: B-007, B-010, B-008, B-009 im Kern „geprüft“; B-009-Zusatz, B-012, B-013, B-014, F2 „behauptet“.
- r4 Z. 40: B-007 „geprüft“. r4 Z. 183: Überschrift §5.3 „(behauptet)“.
- yang_n4.md Z. 6: laut Suche ein Statuswort; diese Zeile habe ich nicht gelesen.

Das sind Angaben der Autoren. Ich habe sie nicht als Vorgabe benutzt. Ein früheres Prüfurteil zu B-014 habe ich nicht gesehen.

---

## 1. Ergebnis

**Gesamturteil: hält mit benannten Reparaturen**, unter den ausdrücklich übernommenen Voraussetzungen (§2). Keine der Reparaturen ändert eine Aussage, eine Zahl oder die Beweisidee. Ich habe keine Lücke gefunden, die die Aussage von B-014 gefährdet, und kein Gegenbeispiel.

| Teil | Urteil |
|---|---|
| Rahmen §2 (Minimalität, (G)) | hält |
| Lemma K | hält mit Reparatur R-K (nur für endliche Körper nötig, im Anwendungsfall belanglos) |
| Folgerung K1 | hält |
| Lemma Z | hält |
| §4 (B0), (B1), (B2) | hält (unter den Übernahmen aus B-013 und S2-05) |
| §4 (B3) | hält mit Reparatur R-T (Fall (5,8) der Transponierten begründen) |
| Satz F | hält; Schreibweise R-N empfohlen, elementare Fassung von Schritt 3/4 in §3.7 |
| Folgerung F1 | hält, bedingt durch B-012 und B-013 |
| Folgerung F2 | hält, bedingt durch B-007, B-008, B-009, B-012, B-013 (Gleichheit 26 zusätzlich durch B-010) |

Gültigkeit über jedem Körper: Der Beweis läuft über K̄ (Lemma R1, yang_n4.md Z. 47–51). Alle Schritte nach R1 (Kronecker, Hankel, Bézout bzw. §3.7, Sym³) gelten über algebraisch abgeschlossenen Körpern jeder Charakteristik. Rechenproben in Charakteristik 2, 3, 5 und 101 in §4.

---

## 2. Benutzte Voraussetzungen aus anderen Behauptungen (nicht geprüft)

Der Beweis führt diese Voraussetzungen ausdrücklich ein. Ich habe sie nicht geprüft, nur ihren Gebrauch.

1. **B-007**: Keine Zerlegung der Länge ≤ 24 (für die Minimalität, r6 Z. 43).
2. **S2-05 Folgerung A2 / Definition von rk L**: rk L = dim Ĵ_p − 4, dim Ĵ_p = dim span{a_t(p) ⊗ b_t(p)} (r6 Z. 41, r4 Z. 38, r2 Z. 45). Für (G).
3. **Folgerung 7 / (Ψ1)** (yang_n4.md Z. 121, r2 Z. 43): Ψ nichtsingulär, bei zulässigem p. Für (B1).
4. **(N1)**: a_t(p)·u_0 ≠ 0 für alle t, bei zulässigem u_0 (r4 Z. 39). Für (B2), Satz F Schritt 1.
5. **B-012 (Satz C, C2) = (V1)**: Im Fall (5,8) ist die Zerlegung nicht symmetrisch, und es gibt die offene Menge P_ns.
6. **B-013 (Lemma P, Satz E) = (V2)**: Für p ∈ P_ns (nach Verkleinern) liegen die Zerlegung und ihre Transponierte in Unterfall B; dort rk F_{γ*} = 1, mit u* zu γ*, u* ∉ K·u_0.
7. **B-008, B-009**: nur für F2 und für Reparatur R-T.
8. **B-010**: nur für „genau 26“ in F2.

---

## 3. Prüfung Schritt für Schritt

### 3.1 Rahmen (r6 §2)

- dim ker W = 9: W ist surjektiv (G2, yang_n4.md Z. 85), also 25 − 16. Stimmt.
- Minimalität: Aus A_{t′} = λA_t, B_{t′} = μB_t folgt α_{t′}β_{t′} = λμ α_tβ_t, Zusammenlegen ergibt Länge 24, Widerspruch zu B-007. Stimmt. a_t(p) = A_t p ≠ 0 außer auf ker A_t (höchstens eine Gerade, da A_t ≠ 0), ebenso b_t. Stimmt.
- (G): dim Ĵ_p ist der Rang einer Matrix mit in p polynomialen Einträgen, also ist {p : dim Ĵ_p ≥ 9} offen. Wegen dim Ĵ_p ≤ dim ker W = 9 und Ĵ_p ⊆ ker W ist das die Menge mit Ĵ_p = ker W. Nichtleer, sobald rk L = 5 an einer Stelle gilt. **Hält.**

### 3.2 Lemma K (r6 §3.1)

Schritt 1 (Proportionalität über K(p), 2×2-Minoren verschwinden als Polynome) ist korrekt in jedem Körper.

Fall rk X = 2: Auswertung der Minoren-Identität an e_1, e_2, e_1+e_2 ist in jedem Körper zulässig (Polynomidentität). λ_1 = λ_2 = λ_3 aus der Unabhängigkeit von Xe_1, Xe_2. λ ≠ 0 wegen X′ ≠ 0. Y = λY′ aus Xp ≠ 0 im Integritätsbereich K[p]^n. **Hält.**

Fall rk X = 1: Der Text schließt „für jedes p mit l_1·p ≠ 0 ein Vielfaches von x, also für alle p (abgeschlossene Bedingung)“. Das ist ein Argument über Werte an Stellen. Über einem endlichen Körper (Lemma K ist „für beliebiges K“ formuliert) trägt es so nicht, weil Polynome nicht durch ihre Werte bestimmt sind.

**Reparatur R-K.** Ersetze den Satz durch: „Die Minoren-Identität lautet (l_1·p)·(x_i (X′p)_{i′} − x_{i′} (X′p)_i) = 0 in K[p_1, p_2]. Da l_1·p ≠ 0 und K[p] nullteilerfrei ist, gilt x_i (X′p)_{i′} = x_{i′} (X′p)_i als Polynome. Mit x_{i_0} ≠ 0 folgt X′p = x · ((X′p)_{i_0}/x_{i_0}), also X′ = x l_1′ᵀ.“ Der Rest (Teilbarkeit durch das Primelement l_1′·p, Grad ≤ 1, w = w′) ist schon rein polynomial und korrekt. Im Anwendungsfall (K = K̄, unendlich) ist R-K belanglos.

„Genau einer der Fälle“: In (ii) sind X, X′ nicht proportional. **Hält mit R-K.**

### 3.3 Folgerung K1

In Fall (ii) sind x, l_1 durch X und l_2 (bis auf Skalare) durch Y bestimmt. Für X′ = c·x l_2ᵀ, Y′ = c′·w l_1ᵀ verlangt (K) cc′ = 1. Also genau eine Tauschbahn. **Hält.** Eigene erschöpfende Probe in §4.1.

### 3.4 Lemma Z (r6 §3.2)

- ∼: Lineare Abhängigkeit zweier Vektoren aus K^16, deren Einträge quadratische Formen in p sind, heißt: alle 2×2-Minoren (Formen vom Grad 4) verschwinden. Entweder identisch, oder ihre gemeinsame Nullstellenmenge in ℙ¹ ist endlich. Gilt die Bedingung auf einer nichtleeren offenen Menge, so identisch (K unendlich). Damit ist ∼ transitiv (auf der offenen Menge, wo alle Vektoren ≠ 0 sind). **Hält.**
- Schritt 1: Koordinate t eines Erzeugers von Ĵ_p ist uᵀ a_t b_tᵀ w = κ_t(p) · uᵀ a_{t_0} b_{t_0}ᵀ w. Also pr_S(Ĵ_p) ⊆ K·κ(p), Gleichheit weil a_{t_0}(p), b_{t_0}(p) ≠ 0. Mit (G) ist pr_S(Ĵ_p) = pr_S(ker W) unabhängig von p, mit κ_{t_0} = 1 also κ_t konstant. P_9 und die Menge, wo κ definiert ist, sind nichtleer offen und schneiden sich. **Hält.**
- Schritt 2: Polynomidentität auf offener Menge, also überall. Lemma K mit X = A_{t_0}, Y = κ_t B_{t_0}ᵀJ, X′ = A_t, Y′ = B_tᵀJ. Fall (i) gibt A_t ∝ A_{t_0}, B_t ∝ B_{t_0} (J invertierbar), durch Minimalität ausgeschlossen. In Fall (ii) ist nach K1 A_t ∝ x l_2ᵀ und B_tᵀJ ∝ w l_1ᵀ, unabhängig von κ_t. Zwei solche t, t″ wären also proportional in beiden Faktoren, ausgeschlossen. |S| ≤ 2. **Hält.**
- Zählen: ⌈25/2⌉ = 13 Klassen. Für Vertreter verschiedener Klassen fallen die Punkte nur an endlich vielen [p] zusammen; dazu endlich viele [p] mit a_t(p) = 0 oder b_t(p) = 0. **Die Zahl 13 stimmt exakt.**
- Die Gestaltangabe in B-014 („A_t = x l_1ᵀ, A_{t′} = x l_2ᵀ, B_tᵀJ = w l_2ᵀ, B_{t′}ᵀJ ∝ w l_1ᵀ“) folgt aus Lemma K (ii) nach Umskalieren von l_2. Stimmt.
- Nicht geprüft, weil nicht benutzt: die dritte Bemerkung (Klassen bis Größe 4 ohne (G)).

**Lemma Z hält.** Es braucht nur B-007 und (G).

### 3.5 Struktur von Unterfall B (r6 §4)

- (B0): Ψ(D, K⁴) = Ψ(u_0, K⁴) + Ψ(u*, K⁴) nach Bilinearität. dim = dim J + rk F_{γ*} = 4 + 1 = 5 (dim J = 4, da Ψ(u_0, ·) injektiv). Braucht u* ∉ K·u_0, das gilt, weil γ* ≠ 0 Koordinaten bezüglich u_1, u_2, u_3 sind. **Hält** (unter Übernahme 6).
- (B1): Ein Büschel s·M_1 + t·M_2 von 5×4-Matrizen, injektiv für alle (s:t) ∈ ℙ¹. Kronecker über K̄: L_ε-Blöcke (auch L_0 = Nullspalte) haben überall Kern; jeder reguläre Block (auch unendliche Eigenwerte) hat eine nichtkonstante Determinante als binäre Form, also eine Nullstelle in ℙ¹. Es bleiben L_ηᵀ (η ≥ 0, η = 0 ist eine Nullzeile). Aus Σ η_i = 4 und Σ(η_i + 1) = 5 folgt genau ein Block, η = 4. L_4ᵀ ist die Multiplikation S¹ × S³ → S⁴. **Hält.** Die Zählung ist exakt.
- (B2): Die 2×4-Hankelmatrix vom Rang ≤ 1 ist c·(ev_σ) für ein σ ∈ ℙ¹(K). Beweis (in jedem Körper): Ist (h_0, …, h_3) ≠ 0, so (h_1, …, h_4) = μ(h_0, …, h_3); der erste Index i mit h_i ≠ 0 muss 0 sein, also h_k = μ^k h_0. Sonst h = (0,0,0,0,h_4), der Punkt im Unendlichen. Erschöpfende Probe in §4.2. c_t ≠ 0 aus (N1) und b_t ≠ 0. b_t ∝ ν_D(σ_t): mit u = u_0 ist die linke Seite für ein w ≠ 0, also ι_D(u_0)(σ_t) ≠ 0. [a_t|_D] = [ev_{σ_t} ∘ ι_D]: mit w, b_t·w ≠ 0. **Hält.**
- (B3): Die Formeln a′_t(p) = −b_t(Jp), b′_t(p) = a_t(Jp), Ψ′_p(u,w) = −Ψ_{Jp}(w,u), W′(s) = W(s)ᵀ stimmen (symbolisch nachgerechnet, §4.4). Nicht-Symmetrie überträgt sich: aus M a ∈ K·b mit a, b ≠ 0 folgt M⁻¹ b ∈ K·a. Die Wahl p′ = J⁻¹p bringt alle Aussagen an dieselbe Stelle p; die Bedingungen sind nichtleer offen und schneiden sich. Die Übersetzung (E := D′, a_t ∝ ν_E(τ_t), τ_t = π_E([b_t])) stimmt.

  **Lücke und Reparatur R-T.** Der Satz „Sie liegt im Fall (5,8)“ ist im Text nicht begründet. rk L überträgt sich sofort (Ĵ′_p = Ĵ_{Jp}, also dim 9 generisch). rk H′ ist aber mit u_0 auf der anderen Seite gebildet, und die Gleichheit rk H′ = 8 ist nicht offensichtlich. Reparatur: „Ĵ′_p = Ĵ_{Jp}, also rk L′ = 5 generisch. Nach Satz A (B-008) ist (rk L′, rk H′) ∈ {(5,7), (5,8)}, und (5,7) schließt Satz B (B-009) aus. Also liegt die Transponierte im Fall (5,8).“ Alternativ ist die Aussage Teil der Übernahme (V2) aus B-013 („ebenso ihre Transponierte“). Dann ist sie dort zu prüfen. **Hält mit R-T.**

### 3.6 Satz F (r6 §5)

- Wahl von p: endlich viele nichtleere offene Bedingungen in K² (bzw. Komplemente endlich vieler Geraden), K unendlich und K² irreduzibel. Stimmt.
- Schritt 1: Die beiden Kubiken (ν_E(τ)·d_1, ν_E(τ)·d_2) verschwinden nicht beide identisch, weil die verdrehte Kubik ℙ³ aufspannt. Der ggT verschwindet genau dort, wo ν_E(τ) ∈ ℙ(D^⊥). An τ_t ist ν_E(τ_t) ∝ a_t ∉ ℙ(D^⊥) wegen (N1), also stimmt φ(τ_t) mit π_D([a_t]) überein. 0 ≤ d ≤ 3, ebenso e.

  **Schreibweise R-N (keine Lücke).** π_D muss als Abbildung nach ℙ¹ über die Identifikation σ ↦ [ev_σ ∘ ι_D] aus (B2) gelesen werden, nicht über beliebige Koordinaten auf D*. Nur dann liegt φ(τ_t) in derselben Parametrisierung wie ν_D, und Schritt 4 (ν_D(φ(τ))) ist sinnvoll. Der Text meint das (r6 Z. 125), sagt es in Schritt 1 aber nicht. Die Identifikation ist linear, also bleiben f, g binäre Kubiken.
- Schritt 2: σ_1 g(τ) − σ_2 f(τ) hat Bigrad (d, 1); ein echter Faktor hätte σ-Grad 0 und teilte f und g. Also irreduzibel, Klasse d·h_1 + h_2. Ebenso Γ_2 mit h_1 + e·h_2. Gilt auch für d = 0 (Γ_1 ist dann eine Faser). **Hält.**
- Schritt 3: Γ_1·Γ_2 = de + 1 ≤ 10. Verschiedene Paare (τ_t, σ_t) für verschiedene [a_t ⊗ b_t], denn das Paar bestimmt [a_t] und [b_t]. Lemma Z gibt 13 ≥ 11. **Die Schranke stimmt exakt; Reserve 2.**
- Schritt 4: Gleiche Kurven, also gleiche Klassen: d = e = 1. φ ∈ PGL_2, ψ = φ⁻¹. m(Φτ) = Sym³(Φ) m(τ) in jeder Charakteristik, Sym³(Φ) invertierbar (Sym³(Φ⁻¹) ist invers, weil die m(τ) K⁴ aufspannen; Probe §4.3). ν_D = N_D m, ν_E = N_E m mit invertierbaren N_D, N_E (g_D, g_E Isomorphismen). Also [b_t] = [G a_t] für alle t an der Stelle p, Widerspruch zu p ∈ P_ns. Alles an derselben Stelle p. **Hält.**

### 3.7 Elementare Fassung von Schritt 3 und 4 (Vorschlag für die Formalisierung)

Bézout auf ℙ¹ × ℙ¹ lässt sich vermeiden. Die Punkte von Γ_1 sind (τ, φ(τ)), τ ∈ ℙ¹, bijektiv. Ein solcher Punkt liegt auf Γ_2 genau dann, wenn

  F(τ) := τ_1 · g′(f(τ), g(τ)) − τ_2 · f′(f(τ), g(τ)) = 0,

wobei ψ = [f′ : g′]. F ist eine binäre Form vom Grad de + 1 ≤ 10. Ist F ≢ 0, so hat F höchstens de + 1 Nullstellen in ℙ¹, und die 13 verschiedenen Paare haben 13 verschiedene τ_t (Γ_1 ist ein Graph). Also F ≡ 0, das heißt Γ_1 ⊆ Γ_2. Beide Polynome sind irreduzibel, nach dem Nullstellensatz also assoziiert, und die Bigrade (d, 1) und (1, e) stimmen überein: d = e = 1. Das gilt in jeder Charakteristik, auch wenn φ inseparabel wäre (das wird durch d = 1 ausgeschlossen). Probe zu deg F = de + 1 in §4.3.

### 3.8 Folgerungen F1 und F2

- F1: Im Fall (5,8) gibt B-012 die Nicht-Symmetrie und P_ns, B-013 Unterfall B für Zerlegung und Transponierte, Satz F schließt das aus. Logisch korrekt, bedingt durch B-012, B-013 (und R-T bzw. B-013 für die Transponierte).
- F2: Länge ≤ 24 durch B-007; Länge 25 über K gibt Länge 25 über K̄ (R1); dort einer der vier Fälle (B-008); (4,7), (5,7) durch B-009, (3,6) durch B-012 (C1), (5,8) durch F1. Damit R ≥ 26 über jedem Körper. „Genau 26“ zusätzlich mit B-010. Die Aufzählung der benutzten Behauptungen in B-014 ist vollständig. Logisch korrekt.

---

## 4. Eigene Rechenproben (exakte Arithmetik)

Eigener Code, unabhängig von `versuche/s2-24/` geschrieben (dieses Verzeichnis habe ich nicht gelesen). Python 3.13, sympy 1.14. Gesamtrechenzeit unter einer Minute auf einem Kern.

### 4.1 Lemma K und K1, erschöpfend über 𝔽_q

Alle Paare (X, Y) von n×2-Matrizen ≠ 0, gruppiert nach den Koeffizienten (nicht den Werten) von p ↦ (Xp) ⊗ (Yp). In jeder Faser: Zahl der Bahnen unter (λX, λ⁻¹Y) und bei zwei Bahnen die Tauschgestalt (alle vier Rang 1, Zeilenräume über Kreuz gleich, X und X′ nicht proportional).

| n | q | Fasern ≠ 0 | höchstens Bahnen | Fasern mit 2 Bahnen | Abweichungen |
|---|---|---|---|---|---|
| 1 | 2 | 6 | 2 | 3 | 0 |
| 1 | 3 | 20 | 2 | 12 | 0 |
| 2 | 2 | 198 | 2 | 27 | 0 |
| 2 | 3 | 3 008 | 2 | 192 | 0 |
| 2 | 5 | 95 184 | 2 | 2 160 | 0 |
| 3 | 2 | 3 822 | 2 | 147 | 0 |
| 3 | 3 | 262 964 | 2 | 2 028 | 0 |
| 4 | 2 | 64 350 | 2 | 675 | 0 |

Die Zahlen für n ≥ 2 stimmen mit der Tabelle in r6 §6 überein.

### 4.2 Hankel 2×4

Über 𝔽_2, 𝔽_3, 𝔽_5, 𝔽_7 alle h ∈ 𝔽_q⁵: Rang ≤ 1 genau dann, wenn h = c·ev_σ, σ ∈ ℙ¹(𝔽_q). Anzahl jeweils q² = 1 + (q−1)(q+1). Keine Abweichung.

### 4.3 Sym³ und Gradformel

- Sym³(Φ) invertierbar für alle Φ ∈ GL_2(𝔽_q), q = 2, 3, 5.
- Zufällige N_D, N_E ∈ GL_4, D, E ⊆ K⁴ über 𝔽_2, 𝔽_3, 𝔽_5, 𝔽_101 (je 30 Versuche, entartete verworfen): deg F = de + 1 in allen Fällen, F nie ≡ 0. Das bestätigt nur die Gradzählung in §3.7, nicht Satz F.

### 4.4 Transponierte

Symbolisch für zufällige ganzzahlige A_t, B_t: a′_t(p) = −b_t(Jp), b′_t(p) = a_t(Jp). Stimmt.

### 4.5 Was die Proben nicht abdecken

Lemma Z und Satz F selbst sind nicht durch Rechnung geprüft (es gibt keine Zerlegung der Länge 25, an der man rechnen könnte). Die Prüfung dieser Teile ist die Prüfung der Prosa in §3.

### 4.6 Code

```python
# lemmak.py: exhaustive check of Lemma K / K1 over F_q (polynomial identity)
import itertools, sys
from collections import defaultdict
def mats(n,q):
    for e in itertools.product(range(q), repeat=2*n):
        if any(e): yield tuple(tuple(e[2*i:2*i+2]) for i in range(n))
def quad(X,Y,q,n):
    return tuple(((X[i][0]*Y[j][0])%q, (X[i][0]*Y[j][1]+X[i][1]*Y[j][0])%q, (X[i][1]*Y[j][1])%q) for i in range(n) for j in range(n))
def rank(M,q,n):
    c0=[r[0] for r in M]; c1=[r[1] for r in M]
    if not any(c0) and not any(c1): return 0
    for i in range(n):
        for j in range(n):
            if (c0[i]*c1[j]-c0[j]*c1[i])%q: return 2
    return 1
def scal(M,l,q): return tuple(tuple((l*x)%q for x in r) for r in M)
def run(n,q):
    fib=defaultdict(list)
    for X in mats(n,q):
        for Y in mats(n,q):
            fib[quad(X,Y,q,n)].append((X,Y))
    inv={l:pow(l,q-2,q) for l in range(1,q)}
    maxorb=0; two=0; bad=0
    for k,L in fib.items():
        if not any(any(c) for c in k): continue
        seen=set(); orbs=[]
        for (X,Y) in L:
            if (X,Y) in seen: continue
            o={(scal(X,l,q),scal(Y,inv[l],q)) for l in range(1,q)}
            seen|=o; orbs.append((X,Y))
        maxorb=max(maxorb,len(orbs))
        if len(orbs)==2:
            two+=1
            (X,Y),(X2,Y2)=orbs
            ok = all(rank(M,q,n)==1 for M in (X,Y,X2,Y2))
            def rowsp(M): return [x for x in M if any(x)][0]
            def par(u,v): return (u[0]*v[1]-u[1]*v[0])%q==0
            ok = ok and par(rowsp(X),rowsp(Y2)) and par(rowsp(Y),rowsp(X2)) and not par(rowsp(X),rowsp(X2))
            if not ok: bad+=1
        if len(orbs)>2: bad+=1
    nz=sum(1 for k in fib if any(any(c) for c in k))
    print(f"n={n} q={q} fibres={nz} max_orbits={maxorb} two_orbit_fibres={two} bad={bad}")
for n,q in [(1,2),(1,3),(2,2),(2,3),(2,5),(3,2),(3,3),(4,2)]:
    run(n,q); sys.stdout.flush()
```

```python
# rest.py: Hankel 2x4 rank<=1 and Sym^3 invertibility
import itertools
from sympy import symbols, Matrix, Poly, expand
# (1) Hankel 2x4 rank<=1  <=> h = c*ev_sigma, exhaustive over F_q
def hank(q):
    evs=set()
    for c in range(q):
        for s in [(1,a) for a in range(q)]+[(0,1)]:
            evs.add(tuple((c*pow(s[0],4-k,q)*pow(s[1],k,q))%q for k in range(5)))
    cnt=0
    for h in itertools.product(range(q),repeat=5):
        rows=[h[0:4],h[1:5]]
        r1 = all((rows[0][i]*rows[1][j]-rows[0][j]*rows[1][i])%q==0 for i in range(4) for j in range(4))
        if r1 != (h in evs): return False
        cnt+=r1
    return cnt
for q in [2,3,5,7]: print("Hankel q=",q,"rank<=1 count",hank(q), "(expected 1+(q-1)(q+1)=",1+(q-1)*(q+1),")")
# (2) Sym^3(Phi) invertible for all Phi in GL2(F_q), and m(Phi tau)=Sym3(Phi) m(tau)
t1,t2=symbols('t1 t2')
def m(a,b): return [a**3,a**2*b,a*b**2,b**3]
def sym3(P,q):
    a,b,c,d=P
    imgs=m(a*t1+b*t2,c*t1+d*t2)
    mons=m(t1,t2)
    M=[[Poly(expand(f),t1,t2).coeff_monomial(mo)%q for mo in mons] for f in imgs]
    return Matrix(M)
for q in [2,3,5]:
    ok=True
    for P in itertools.product(range(q),repeat=4):
        if (P[0]*P[3]-P[1]*P[2])%q==0: continue
        if Matrix(sym3(P,q)).det()%q==0: ok=False
    print("Sym3 invertible over F_%d:"%q, ok)
```

```python
# satzf.py: degree of F in Section 3.7 for random data; transpose identities
import random
from sympy import symbols, Matrix, Poly, expand, gcd
t1,t2,s1,s2,p1,p2=symbols('t1 t2 s1 s2 p1 p2')
def m(a,b): return Matrix([a**3,a**2*b,a*b**2,b**3])
def rinv(q):
    while True:
        N=Matrix(4,4,lambda i,j: random.randrange(q))
        if N.det()%q: return N
def comp(q):
    NE,ND=rinv(q),rinv(q)
    D=Matrix(4,2,lambda i,j: random.randrange(q)); E=Matrix(4,2,lambda i,j: random.randrange(q))
    nuE=NE*m(t1,t2); nuD=ND*m(s1,s2)
    f=Poly(expand((nuE.T*D)[0]),t1,t2,modulus=q); g=Poly(expand((nuE.T*D)[1]),t1,t2,modulus=q)
    fp=Poly(expand((nuD.T*E)[0]),s1,s2,modulus=q); gp=Poly(expand((nuD.T*E)[1]),s1,s2,modulus=q)
    if f.is_zero or g.is_zero or fp.is_zero or gp.is_zero: return None
    h=gcd(f,g); f=f.quo(h); g=g.quo(h)
    h2=gcd(fp,gp); fp=fp.quo(h2); gp=gp.quo(h2)
    d=f.total_degree(); e=fp.total_degree()
    F=expand(t1*gp.as_expr().subs({s1:f.as_expr(),s2:g.as_expr()},simultaneous=True)-t2*fp.as_expr().subs({s1:f.as_expr(),s2:g.as_expr()},simultaneous=True))
    PF=Poly(F,t1,t2,modulus=q)
    return d,e,(None if PF.is_zero else PF.total_degree())
random.seed(1)
for q in [2,3,5,101]:
    res=[comp(q) for _ in range(30)]
    res=[r for r in res if r]
    bad=[r for r in res if r[2] is not None and r[2]!=r[0]*r[1]+1]
    zero=[r for r in res if r[2] is None]
    print(q, "samples",len(res),"deg(F)!=de+1:",len(bad),"F==0:",zero, "example",res[:4])
# transpose identities
A=[Matrix(4,2,lambda i,j: random.randint(-5,5)) for _ in range(3)]
B=[Matrix(2,4,lambda i,j: random.randint(-5,5)) for _ in range(3)]
J=Matrix([[0,-1],[1,0]]); p=Matrix([p1,p2])
ok=True
for At,Bt in zip(A,B):
    a=lambda v: At*v; b=lambda v: Bt.T*J*v
    At2,Bt2=Bt.T,At.T
    a2=At2*p; b2=Bt2.T*J*p
    ok &= (expand(a2+b(J*p))==Matrix([0]*4)) and (expand(b2-a(J*p))==Matrix([0]*4))
print("transpose identities a'_t(p)=-b_t(Jp), b'_t(p)=a_t(Jp):",ok)
```

---

## 5. Zusammenfassung für den Orchestrator

- Gesamt: hält mit benannten Reparaturen R-K, R-T und der Schreibweise R-N, bedingt durch die in §2 genannten Übernahmen (B-007, S2-05 A2, Folgerung 7, (N1), B-012, B-013; für F2 zusätzlich B-008, B-009, B-010).
- R-K: Lemma K, Fall rk X = 1, polynomial statt punktweise argumentieren (nur über endlichen Körpern nötig).
- R-T: Fall (5,8) der Transponierten aus rk L′ = 5, Satz A und Satz B herleiten, oder ausdrücklich aus B-013 übernehmen.
- R-N: π_D und π_E über die Identifikationen aus (B2) lesen.
- Zahlen: 13 Klassen exakt, de + 1 ≤ 10 exakt, Kronecker-Zählung exakt.
- Vorschlag: §3.7 als elementarer Ersatz für Bézout in der Lean-Formalisierung.
