# S2-37: Unbeeinflusste Prüfung von B-014 (Lemma K, Lemma Z, Satz F), Stufe 2, Runde 9

- Auftrag: S2-37 des Orchestrators, Rolle Prüfer, Stufe 2, Runde 9 (Protokoll 0.4, Abschnitt 5.4, Übergang).
- Datum: 25.11.2026, 18:21 bis 18:45 UTC.
- Geprüftes Artefakt: `lean/prosa/s2_444_spurA_r6.md` (Prosa-Beweis), Aussage `behauptungen/B-014.md`.
- Kein Fremdmodell befragt. Keine Subagenten.
- Dieser Bericht setzt keinen Status. Er ist ein Prüfurteil über einen Prosa-Beweis. Nach Abschnitt 5.1 des Protokolls ersetzt er keinen Lean-Beweis.

---

## 0. Offenlegung (Unabhängigkeit)

**Gelesen:** `CLAUDE.md`; von `PROTOKOLL.md` nur Abschnitt 5 im Wortlaut, dazu einmal die Liste aller Überschriften der Datei (Suche nach Zeilen mit „#“), ohne Text anderer Abschnitte; `lean/prosa/s2_444_spurA_r6.md`; `behauptungen/B-014.md` (erst nachdem `pruefvermerke/UMBAU-FERTIG` auf main lag, geprüft nur über die Dateiliste). Lean-Quelltexte habe ich nicht gebraucht und nicht geöffnet. In der Dateiliste von `lean/prosa/` war der Dateiname `s2_444_spurA_r6_pruefung.md` sichtbar. Diese Datei habe ich nicht geöffnet.

**Nicht gelesen:** `pruefvermerke/` (außer dem Dateinamen UMBAU-FERTIG), `versuche/` (auch nicht `versuche/s2-24/klassen_lemma.py`; meine Gegenprobe ist eigener Code), `archiv/`, `LOG.md`, `STATUS.md`, andere Behauptungsdateien, Listen von Commits, Pull Requests oder Actions-Läufen.

**Beim Start ohne mein Zutun eingeblendete Gedächtniseinträge**, alle vor meinem eigenen Urteil sichtbar (so an den Orchestrator gemeldet, wörtlich übernommen):

1. MEMORY.md (Index). Enthält zu B-014 nur die Auftragsbeschreibung „S2-37 frischer Prüfer B-014“, kein Urteil zu B-014, Lemma Z, Lemma K oder Satz F. Er nennt allgemein, dass Status in pruefvermerke/ liegt, und Justus' Satz zum „falsch aufgeschriebenen Beweis von Lemma 13 (Yang v3)“.
2. s2-31-abgleich-b013: Aussagen-Abgleich B-013. Wörtlich unter anderem „Behauptet: Lemma P (nur LemmaPStatement), C2 offene Menge P_ns (Chevalley fehlt), nur Unterfall B (bedingt), Transponierte, Kubiken“, dazu Hinweise zu satzE_global und Nicht-Symmetrie. Das ist ein Befund zu Unterfall B, aber zu B-013, nicht zu B-014.
3. s2-32-lemmaP-lean: nur PR 64, Dateipfad, kein Urteil.
4. git-regeln: Arbeitsregeln, kein Befund.
5. repo-schreibrechte: Stand nach Runde 8, u. a. „Geprüft: B-001, B-002, B-003, B-006, B-007, B-010, Kern von B-008/B-009“, Zählerstände, kein Urteil zu B-014.

Der Orchestrator hat daraufhin entschieden, dass ich weiterprüfe (Abschnitt 5.4: ungültig macht nur ein früheres Urteil zur selben Behauptung). Ein früheres Urteil zu B-014 habe ich nicht gesehen. Das Artefakt selbst erwähnt kein Prüfurteil zu B-014; es nennt nur Statuswörter anderer Behauptungen (B-007, B-010 „geprüft“, B-012, B-013 „behauptet“).

---

## 1. Urteil in Kürze

| Teil | Urteil |
|---|---|
| Lemma K (über jedem Körper) | **hält.** Ein Satz im Fall rk X = 1 ist besser über Kürzen im Integritätsbereich zu begründen (Hinweis H1, keine Lücke). |
| Folgerung K1 | **hält.** |
| Lemma Z (Klassen ≤ 2, mindestens 13 verschiedene Punkte) | **hält mit benannter Reparatur R1** (Formulierung in Schritt 2, „dieselbe Bahn“; die Folgerung stimmt). |
| (B0) bis (B3), Struktur von Unterfall B | **hält, bedingt** auf die eingeführten Aussagen aus B-012 und B-013 (V1, V2, N1, dim Ψ(D, K⁴) = 5, Nichtsingularität von Ψ), die nicht Teil von B-014 sind und die ich nicht geprüft habe. Kronecker- und Hankel-Schritt sowie alle Aussagen über die Transponierte habe ich selbst nachgerechnet. |
| Satz F | **hält, bedingt wie oben.** Zählschranke d·e + 1 ≤ 10 < 13 exakt, gültig in jeder Charakteristik, die gezählten Punkte liegen an derselben Stelle p. |
| Folgerung F1, F2 | **logisch richtig zusammengesetzt**, wenn B-007 bis B-013 in der benutzten Form halten. Deren Inhalt war nicht Gegenstand dieser Prüfung. |
| **Gesamt B-014** | **hält mit benannter Reparatur R1** (redaktionell), unter den in B-014 genannten Voraussetzungen „im Sinn von B-012“ und „im Sinn von B-013“. |

Keine Stelle, an der der Beweis nicht hält. Kein Gegenbeispiel gefunden.

---

## 2. Rahmen: was ich selbst nachgerechnet habe

- **Ĵ_p ⊆ ker W** (Grundidentität, im Artefakt aus S2-16 übernommen). Direkt: Für A = u pᵀ ∈ K^{4×2} und B = (Jp) wᵀ ∈ K^{2×4} ist AB = u (pᵀJp) wᵀ = 0, weil pᵀJp = −p₁p₂ + p₂p₁ = 0 in jeder Charakteristik. Und α_t(A) = uᵀA_t p = u·a_t(p), β_t(B) = (Jp)ᵀB_t w = w·B_tᵀJp = w·b_t(p). Also Σ_t (u·a_t(p))(w·b_t(p)) C_t = 0. Gilt über jedem Körper. Probe exakt (Abschnitt 6).
- **dim ker W = 9:** Die Produkte AB spannen K^{4×4} auf, also spannen die C_t K^{4×4} auf, rk W = 16. Richtig.
- **(G):** Mit rk L = dim Ĵ_p − 4 (S2-05, übernommen) heißt rk L = 5 genau dim Ĵ_p = 9 = dim ker W, also Ĵ_p = ker W. Die Bedingung dim Ĵ_p ≥ 9 ist offen (Minoren), also gilt (G) auf einer nichtleeren offenen Menge, sobald sie an einer Stelle gilt. Richtig. B-014 nennt den Fall „(rk L, rk H) = (5,8)“; der Beweis benutzt nur rk L = 5. Das ist unschädlich.
- **Minimalität.** Aus A_{t′} = λA_t, B_{t′} = μB_t folgt α_{t′}β_{t′} = λμ α_tβ_t, Zusammenlegen ergibt Länge ≤ 24 (ist C_t + λμC_{t′} = 0, sogar 23). Widerspruch zu B-007. A_t = 0 oder B_t = 0 ebenso. Richtig. Die Reduktion auf K algebraisch abgeschlossen ist unproblematisch: Eine Zerlegung über K ist eine über K̄, und B-007 gilt über jedem Körper.

---

## 3. Lemma K

**Aussage:** (Xp) ⊗ (Yp) = (X′p) ⊗ (Y′p) als Polynomidentität, alle vier ≠ 0. Dann (i) oder (ii), und nicht beide.

- *Schritt 1* (Minoren verschwinden als Polynome): richtig. Aus der Identität folgt für ein j mit (Yp)_j ≢ 0 die Gleichung (Xp)(Yp)_j = (X′p)(Y′p)_j, mit (Y′p)_j ≢ 0, und daraus das Verschwinden aller Minoren von (Xp, X′p) in K[p₁, p₂]. Dieser Ring ist ein Integritätsbereich über jedem Körper, auch einem endlichen.
- *rk X = 2:* Auswerten an e₁, e₂, e₁ + e₂ (in jedem Körper vorhanden, auch in 𝔽₂) gibt X′e_k = λ_k Xe_k und λ₁ = λ₂ = λ₃. λ ≠ 0 wegen X′ ≠ 0. Dann Xp ⊗ (Yp − λY′p) = 0 mit Xp ≢ 0, also Y = λY′ im Integritätsbereich. Richtig.
- *rk X = 1:* Das Artefakt schließt „für jedes p mit l₁·p ≠ 0 ein Vielfaches von x, also für alle p (abgeschlossene Bedingung)“. Über einem endlichen Körper ist ein Schluss von „auf einer offenen Menge von Punkten“ auf „als Polynom“ im Allgemeinen falsch. Hier stimmt er trotzdem, aus zwei Gründen. **Hinweis H1 (bessere Begründung):** Die Minorengleichung lautet (l₁·p)·[x_i(X′p)_{i′} − x_{i′}(X′p)_i] = 0 in K[p₁, p₂]; Kürzen von l₁·p ≢ 0 im Integritätsbereich gibt x_i(X′p)_{i′} = x_{i′}(X′p)_i als Polynome, also X′ = x l₁′ᵀ. (Alternativ: Eine Linearform, die auf dem Komplement einer Geraden in K² verschwindet, verschwindet, weil dieses Komplement K² aufspannt, für jedes K.) Der Rest (Fall l₁′ ∥ l₁; sonst teilerfremde Primelemente l₁·p, l₁′·p, Teilbarkeit, Gradvergleich, w = w′) ist richtig. Die Konstruktion liefert (ii) mit λ = 1 und l₂ = l₁′.
- *Ausschluss beider Fälle:* In (ii) sind X, X′ nicht proportional. Richtig. (ii) erfüllt (K) tatsächlich, (l₁·p)(l₂·p) x ⊗ w ist symmetrisch in l₁, l₂.

**Folgerung K1:** Die Zerlegung X = x l₁ᵀ ist bis auf (x, l₁) ↦ (cx, c⁻¹l₁) eindeutig; Umskalieren ändert die Tauschbahn nicht ((cx)(l₂/d)ᵀ, (dw)(l₁/c)ᵀ) = ((c/d)·x l₂ᵀ, (d/c)·w l₁ᵀ)). Also höchstens zwei Bahnen. Richtig.

**Urteil Lemma K: hält** (über jedem Körper, mit H1 als Formulierungshinweis).

---

## 4. Lemma Z

- *∼ ist wohldefiniert und eine Äquivalenzrelation:* Lineare Abhängigkeit von a_t(p) ⊗ b_t(p) und a_{t′}(p) ⊗ b_{t′}(p) ist das Verschwinden von 2×2-Minoren, binäre Formen vom Grad 4 in p. Über K = K̄ also entweder identisch oder an höchstens endlich vielen [p]. Für generisches p sind beide Vektoren ≠ 0 (Minimalität: ker A_t, ker B_tᵀJ sind höchstens Geraden). Transitivität: Schnitt zweier nichtleerer offener Mengen ist nichtleer. Richtig.
- *Schritt 1 (κ_t konstant):* Für p in der endlichen Schnittmenge der offenen Mengen aller t ∈ S und P_9 ist pr_S(Ĵ_p) = K·κ(p) (Gleichheit, da ein (u, w) mit (a_{t₀}·u)(b_{t₀}·w) ≠ 0 existiert), und pr_S(Ĵ_p) = pr_S(ker W) ist eine feste Gerade ℓ. Wegen κ_{t₀} = 1 ist κ(p) der eindeutige Vektor in ℓ mit t₀-Koordinate 1. Richtig. Das ist genau die Stelle, an der (G) gebraucht wird; die Bemerkung im Artefakt, dass ohne (G) der Schritt bricht, ist zutreffend.
- *Schritt 2:* Polynomidentität (A_t p) ⊗ (B_tᵀJp) = κ_t (A_{t₀}p) ⊗ (B_{t₀}ᵀJp) aus Gleichheit auf einer Zariski-dichten Menge von K̄² (K̄ unendlich). Lemma K mit X = A_{t₀}, Y = κ_t B_{t₀}ᵀJ, X′ = A_t, Y′ = B_tᵀJ, alle ≠ 0. Fall (i) gibt A_t ∥ A_{t₀}, B_t ∥ B_{t₀}, verboten. Also Fall (ii).
  - **Reparatur R1 (Formulierung):** Der Text sagt, zwei solche t, t″ „liegen nach Folgerung K1 in derselben Bahn“. Das stimmt so nicht wörtlich, weil Y = κ_t B_{t₀}ᵀJ von t abhängt und κ_t ≠ κ_{t″} sein kann; die Bahnen von (A_t, B_tᵀJ) und (A_{t″}, B_{t″}ᵀJ) können verschieden sein. Richtig ist: Mit A_{t₀} = x l₁ᵀ, B_{t₀}ᵀJ = w l₂ᵀ (l₁, l₂ unabhängig; diese Gestalt erzwingt Fall (ii)) gibt (ii) für t und t″: A_t = λ x l₂ᵀ, B_tᵀJ = λ⁻¹κ_t w l₁ᵀ und A_{t″} = λ″ x l₂ᵀ, B_{t″}ᵀJ = λ″⁻¹κ_{t″} w l₁ᵀ. Also A_{t″} = (λ″/λ) A_t und B_{t″} = c·B_t mit c ≠ 0 (J invertierbar). Das verbietet die Minimalität für t ≠ t″. Die Folgerung |S ∖ {t₀}| ≤ 1 ist damit richtig.
- *Zählen:* 25 Terme in Klassen der Größe ≤ 2 ergeben ⌈25/2⌉ = 13 Klassen. Für je zwei Vertreter verschiedener Klassen ist die Abhängigkeitsbedingung nicht identisch erfüllt (sonst wären sie auf einer offenen Menge projektiv gleich, also verbunden), gilt also nur an endlich vielen [p]. Zusammen mit den endlich vielen Geraden, auf denen ein a_t oder b_t verschwindet: Außerhalb endlich vieler [p] sind die 13 Punkte paarweise verschieden. Richtig, exakt 13.
- Die Gestaltangabe in `B-014.md` (A_t = x l₁ᵀ, A_{t′} = x l₂ᵀ, B_tᵀJ = w l₂ᵀ, B_{t′}ᵀJ ∝ w l₁ᵀ) stimmt bis auf Umskalieren von l₂ und w, die in der Aussage frei sind.

**Urteil Lemma Z: hält mit Reparatur R1.** Gültig über jedem Körper (Rechnung über K̄, Zerlegung über K ist eine über K̄).

---

## 5. Struktur von Unterfall B, (B0) bis (B3)

Eingeführte, hier **nicht geprüfte** Voraussetzungen: V1 (Folgerung C2 aus B-012: offene Menge P_ns ohne invertierbares M mit M b_t ∥ a_t), V2 (Lemma P, Satz E aus B-013, für Zerlegung und Transponierte), (N1) a_t·u₀ ≠ 0, dim Ψ(D, K⁴) = 5 (rk F_{γ*} = 1), Nichtsingularität von Ψ (Folgerung 7, (Ψ1)). Satz F ist in B-014 ausdrücklich relativ zu „Unterfall B im Sinn von B-013“ und „nicht symmetrisch im Sinn von B-012“ formuliert, damit ist das sauber getrennt.

- **(B1) Kronecker:** Das Büschel u ↦ Ψ(u, ·), u ∈ D ≅ K², Format 5×4, ist für jedes u ≠ 0 injektiv. Kronecker-Normalform über K̄: L_ε-Blöcke (ε ≥ 0, auch die Nullspalte L₀) haben für jedes u einen Kern, ausgeschlossen. Ein regulärer Block hat det ≢ 0 homogen vom Grad ≥ 1 in (s:t), über K̄ mit Nullstelle in ℙ¹ (auch „unendlicher Eigenwert“), ausgeschlossen. Bleiben L_ηᵀ-Blöcke; Spalten Σ η_i = 4, Zeilen Σ(η_i + 1) = 5, also genau ein Block, η = 4. L₄ᵀ ist in Monombasen die Multiplikation S¹ × S³ → S⁴ (keine Binomialkoeffizienten, gilt in jeder Charakteristik). Richtig.
- **(B2) Hankel:** Die Matrix von (l, g) ↦ λ_t(l·g) ist [[h₀,h₁,h₂,h₃],[h₁,h₂,h₃,h₄]]. Rang ≤ 1 ⇔ h geometrisch: Ist h₀ ≠ 0, folgt h_k = r^k h₀. Ist h₀ = 0, erzwingen die Minoren nacheinander h₁ = h₂ = h₃ = 0, es bleibt c·ev_∞. Über jedem Körper, ohne Division durch kleine Zahlen. Exakte Probe über 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅, 𝔽₇ (Abschnitt 6): rang-≤1-Hankel = c·ev_σ, Gleichheit der Mengen. ev_σ ist multiplikativ, also (a_t·u)(b_t·w) = c_t ι(u)(σ_t) g(w)(σ_t). c_t ≠ 0 aus (N1) und b_t ≠ 0. Mit u = u₀ (a_t·u₀ ≠ 0) folgt b_t ∝ ν_D(σ_t) und ι(u₀)(σ_t) ≠ 0, dann [a_t|_D] = [ev_{σ_t} ∘ ι_D]. Richtig. ν_D(σ) = G_Dᵀ m(σ) mit invertierbarem G_D, ν_D ≠ 0 überall.
- **(B3) Transponierte:** (BᵀAᵀ) = Σ β_t(B) α_t(A) C_tᵀ, also ist (B_tᵀ, A_tᵀ, C_tᵀ) eine Zerlegung der Länge 25 mit α′ = β, β′ = α. Nachgerechnet: a′_t(p) = B_tᵀp = B_tᵀJ(J⁻¹p) = b_t(−Jp) = −b_t(Jp); b′_t(p) = (A_tᵀ)ᵀJp = a_t(Jp). Ψ′_p(u, w) = −Ψ_{Jp}(w, u); ker W′ = ker W; Ĵ′_p = Ĵ_{Jp}, also Fall (5,8). Symmetrie: M a ∥ b mit a, b ≠ 0, M invertierbar ⇔ M⁻¹ b ∥ a; also ist die Transponierte an q genau dann symmetrisch, wenn die Zerlegung an Jq symmetrisch ist. An q = J⁻¹p sind die Daten der Transponierten genau (−b_t(p), a_t(p)). Exakte Probe der Formeln über 𝔽₂, 𝔽₃ (Abschnitt 6). Die Wahl „Bedingungen an p für die Zerlegung und an J⁻¹p für die Transponierte“ ist ein Schnitt endlich vieler nichtleerer offener Teilmengen von K̄², also nichtleer.

**Urteil (B0)–(B3): hält**, bedingt auf die genannten Voraussetzungen aus B-012/B-013.

---

## 6. Satz F

- **Dieselbe Stelle:** p wird einmal gewählt im Schnitt von P_ns ∩ P_9, der V2-Menge für die Zerlegung, J·(V2-Menge der Transponierten), dem Komplement der Ausnahmepunkte von Lemma Z und der Nullstellen der a_t, b_t. Alles nichtleere Zariski-offene Teilmengen von K̄², Schnitt nichtleer. Lemma Z zählt Punkte [a_t(p) ⊗ b_t(p)], (B2) und (B3) sprechen über dieselben Vektoren a_t(p), b_t(p). Die gezählten Punkte sind also an derselben Stelle verschieden. Richtig.
- **Schritt 1:** φ = π_D ∘ ν_E ist in Koordinaten [F₁ : F₂] mit F_i = g_E(d_i) (d₁, d₂ Basis von D), zwei linear unabhängige Kubiken (g_E Isomorphismus), danach die lineare Identifikation ℙ(D*) ≅ ℙ¹ über ι_D. Gemeinsame Nullstellen von F₁, F₂ sind genau die τ mit ν_E(τ) ⊥ D. Nach Kürzen des ggT: [f : g] teilerfremd, Grad d mit 1 ≤ d ≤ 3 (d = 0 hieße F₁, F₂ linear abhängig). An τ_t ist ν_E(τ_t) ∝ a_t, a_t·u₀ ≠ 0, also kein gemeinsamer Nullpunkt, und φ(τ_t) = π_D([a_t]) = σ_t. Ebenso ψ(σ_t) = τ_t mit [b_t] ∉ ℙ(E^⊥). Richtig.
- **Schritt 2:** Γ₁ = V(σ₁g(τ) − σ₂f(τ)), linear in σ und primitiv, nach Gauß irreduzibel, Bigrad (d, 1), Klasse d h₁ + h₂. Γ₂ Bigrad (1, e). Auch bei inseparablem φ (Charakteristik 2 oder 3, etwa φ = Frobenius) ist das Polynom irreduzibel und die Kurve reduziert. Richtig.
- **Schritt 3:** (d, 1)·(1, e) = d·e + 1 ≤ 10. Bézout auf ℙ¹ × ℙ¹ für zwei verschiedene irreduzible Kurven über K̄ in jeder Charakteristik. Elementar ohne Schnitttheorie: Γ₁ ∩ Γ₂ entspricht bijektiv (über τ) den Fixpunkten von ψ ∘ φ = [F : G], Grad k ≤ d·e; ist ψ ∘ φ ≠ id, so ist τ₂F − τ₁G ≢ 0 vom Grad k + 1 ≤ d·e + 1. Ist ψ ∘ φ = id, liegt Γ₁ in Γ₂, beide irreduzibel, also gleich. Scharfes Beispiel in Charakteristik 2: φ(τ) = τ², ψ(σ) = σ², Schnitt = {τ : τ⁴ = τ} = 𝔽₄ ∪ {∞}, 5 = 2·2 + 1 Punkte; die Schranke ist also exakt, nicht zu klein. Mindestens 13 verschiedene [a_t ⊗ b_t] ⇒ mindestens 13 verschiedene Paare (τ_t, σ_t), weil das Paar den Punkt bestimmt. 13 > 10 ⇒ Γ₁ = Γ₂. Richtig.
- **Schritt 4:** Γ₁ = Γ₂ als irreduzible Hyperflächen ⇒ definierende Polynome bis auf Skalar gleich ⇒ gleicher Bigrad ⇒ d = e = 1. (Das Gradargument über Γ·h₂ ist gleichwertig. Wichtig in Charakteristik p: Die Frobenius-Abbildung ist punktweise bijektiv, hat aber Grad p; der Schluss läuft über die Polynome bzw. Klassen, nicht über Bijektivität, und ist deshalb richtig.) φ = [Φ], Φ ∈ GL₂. m(Φτ) = Sym³(Φ) m(τ) mit ganzzahligen Koeffizienten, Sym³(Φ⁻¹) invers, in jeder Charakteristik. G = N_D Sym³(Φ) N_E⁻¹ ∈ GL₄, [b_t] = [G a_t], M = G⁻¹ invertierbar mit M b_t ∈ K·a_t für alle t an der Stelle p ∈ P_ns. Widerspruch zu V1. Richtig.

**Urteil Satz F: hält**, bedingt auf V1, V2 und die eingeführten Eigenschaften (B0), (N1), Nichtsingularität von Ψ.

**Folgerungen F1, F2:** Die Verkettung ist logisch richtig: (5,8) ⇒ nicht symmetrisch und P_ns (B-012) ⇒ Unterfall B für Zerlegung und Transponierte (B-013) ⇒ Widerspruch (Satz F); F2 aus der Fallliste von B-008 und den Ausschlüssen B-009, B-012, F1, untere Schranke B-007. Ob B-008 bis B-013 in genau der hier benutzten Form gelten, habe ich nicht geprüft (nicht in der Positivliste). Hinweis für die Verkettung: Satz F braucht V1 an einer Stelle p, an der zugleich V2 für die Zerlegung (an p) und die Transponierte (an J⁻¹p) gilt. Wer B-012/B-013 formalisiert, sollte die offene Menge der Transponierten ausdrücklich als J⁻¹ der offenen Menge der Zerlegung (oder als irgendeine nichtleere offene Menge) ausweisen.

---

## 7. Proberechnungen (eigener Code, exakte Arithmetik, keine Gleitkommazahlen)

Code im Anhang. Gesamtrechenzeit etwa 5 Minuten auf einem Kern.

**Lemma K / K1, erschöpfend:** alle Paare (X, Y) von n×2-Matrizen ≠ 0 über 𝔽_q, gruppiert nach den Koeffizienten der Polynomabbildung p ↦ (Xp) ⊗ (Yp); je Faser höchstens zwei Bahnen unter (λX, λ⁻¹Y), und bei zwei Bahnen Tauschgestalt (Rang 1, vertauschte Zeilenräume, gleiche Spaltenvektoren). Neu gegenüber dem Artefakt: 𝔽₄ (kein Primkörper) und n = 3 über 𝔽₄.

| n | q | Fasern | max. Bahnen | Fasern mit 2 Bahnen | ohne Tauschgestalt |
|---|---|---|---|---|---|
| 2 | 2 | 198 | 2 | 27 | 0 |
| 2 | 3 | 3 008 | 2 | 192 | 0 |
| 2 | 4 | 20 925 | 2 | 750 | 0 |
| 2 | 5 | 95 184 | 2 | 2 160 | 0 |
| 3 | 2 | 3 822 | 2 | 147 | 0 |
| 3 | 3 | 262 964 | 2 | 2 028 | 0 |
| 3 | 4 | 5 576 445 | 2 | 13 230 | 0 |
| 4 | 2 | 64 350 | 2 | 675 | 0 |

**Hankel (B2), erschöpfend:** Für q ∈ {2, 3, 4, 5, 7} ist die Menge der h ∈ 𝔽_q⁵ mit Rang ≤ 1 gleich {c·(σ₁^{4−k}σ₂^k)_k} (je q² Elemente). Keine Ausnahme.

**Grundidentität und Transponierte, erschöpfend:** Für die naive Zerlegung von ⟨4,2,4⟩ (32 Terme) über 𝔽₂ und 𝔽₃, alle p, u, w: Σ_t (u·a_t(p))(w·b_t(p)) C_t = 0, a′_t(p) = −b_t(Jp), b′_t(p) = a_t(Jp). 0 Verstöße.

**Graphen (Satz F, Schritt 3/4), Stichprobe:** je 20 000 zufällige Paare (φ, ψ) aus Kubikpaaren über 𝔽_q, q ∈ {2, 3, 5, 7, 11, 13}, rationale Schnittpunkte von Γ₁ und Γ₂ gezählt. Nie mehr als d·e + 1, außer bei d = e = 1 und Γ₁ = Γ₂. 0 Verstöße. (Nur rationale Punkte, schwache Probe; der Beweis selbst ist elementar, Abschnitt 6.)

---

## 8. Zusammenfassung für den Orchestrator

- **Gesamt: B-014 hält mit benannter Reparatur R1**, unter den Voraussetzungen aus B-012 (Nicht-Symmetrie, P_ns) und B-013 (Unterfall B für Zerlegung und Transponierte, mit (N1), dim Ψ(D, K⁴) = 5, Nichtsingularität), die ich nicht geprüft habe.
- **R1** (Lemma Z, Schritt 2): „dieselbe Bahn“ ersetzen durch die explizite Rechnung A_{t″} ∝ A_t, B_{t″} ∝ B_t (Abschnitt 4). Redaktionell, die Aussage ändert sich nicht.
- **H1** (Lemma K, Fall rk X = 1): Begründung über Kürzen in K[p₁, p₂] statt „abgeschlossene Bedingung“. Kein Fehler.
- Gültig über jedem Körper und in jeder Charakteristik (alles über K̄ gerechnet, kein Schritt teilt durch 2 oder 3, Inseparabilität in Schritt 4 berücksichtigt). Zählschranken exakt: 13 = ⌈25/2⌉, d·e + 1 ≤ 10, in Charakteristik 2 scharf erreicht.

Status setzt der Orchestrator. Nach Abschnitt 5.1 ist das kein Ersatz für Lean.

---

## Anhang: Code der Proberechnungen

Aufruf jeweils `python3 <datei>` im selben Verzeichnis (Python 3, keine Pakete).

### gf.py
```python
# small finite fields GF(q), q in {2,3,4,5,7}; elements 0..q-1
def make(q):
    if q in (2,3,5,7):
        add=lambda a,b:(a+b)%q; mul=lambda a,b:(a*b)%q; neg=lambda a:(-a)%q
    elif q==4:  # GF(4)=F2[x]/(x^2+x+1), element = b0+2*b1
        def mul(a,b):
            a0,a1=a&1,a>>1; b0,b1=b&1,b>>1
            c0=a0*b0; c1=a0*b1+a1*b0; c2=a1*b1
            c0=(c0+c2)%2; c1=(c1+c2)%2
            return c0+2*c1
        add=lambda a,b:a^b; neg=lambda a:a
    inv={a:next(b for b in range(q) if mul(a,b)==1) for a in range(1,q)}
    return add,mul,neg,inv
```

### lemmaK.py
```python
# Independent check of Lemma K / Folgerung K1: for all nonzero X,Y in K^{n x 2},
# group by coefficients of the quadratic map p -> (Xp) (x) (Yp) (as polynomial),
# check each fibre has <=2 orbits under (X,Y)->(lX,l^-1 Y), and if 2, then tausch form.
import itertools,sys
from gf import make
def run(n,q):
    add,mul,neg,inv=make(q)
    mats=[m for m in itertools.product(range(q),repeat=2*n) if any(m)]
    # X as rows (x_i1,x_i2); (Xp)_i = x_i1 p1 + x_i2 p2
    fib={}
    for X in mats:
        for Y in mats:
            # coefficient of p1^2, p1p2, p2^2 in (Xp)_i (Yp)_j
            key=[]
            for i in range(n):
                a,b=X[2*i],X[2*i+1]
                for j in range(n):
                    c,d=Y[2*j],Y[2*j+1]
                    key+= [mul(a,c), add(mul(a,d),mul(b,c)), mul(b,d)]
            fib.setdefault(tuple(key),[]).append((X,Y))
    def orbit(X,Y):
        return frozenset((tuple(mul(l,x) for x in X),tuple(mul(inv[l],y) for y in Y)) for l in range(1,q))
    def rank1(X):
        rows=[(X[2*i],X[2*i+1]) for i in range(n)]
        nz=[r for r in rows if r!=(0,0)]
        return all(add(mul(r[0],nz[0][1]),neg(mul(r[1],nz[0][0])))==0 for r in nz)
    def rowsp(X):
        r=next((X[2*i],X[2*i+1]) for i in range(n) if (X[2*i],X[2*i+1])!=(0,0))
        l=inv[r[0]] if r[0] else inv[r[1]]
        return (mul(l,r[0]),mul(l,r[1]))
    def colvec(X):
        # x with X = x l^T, normalised
        l=rowsp(X); k=0 if l[0] else 1
        x=[X[2*i+k] for i in range(n)]
        return x
    mx=0; two=0; bad=0
    for key,L in fib.items():
        orbs={orbit(*xy) for xy in L}
        mx=max(mx,len(orbs))
        if len(orbs)==2:
            two+=1
            o1,o2=list(orbs); X,Y=next(iter(o1)); X2,Y2=next(iter(o2))
            ok= all(rank1(M) for M in (X,Y,X2,Y2)) and rowsp(X)!=rowsp(Y) and rowsp(X2)==rowsp(Y) and rowsp(Y2)==rowsp(X)
            # also same column vectors up to scalar
            def proj(v):
                f=next(a for a in v if a); return tuple(mul(inv[f],a) for a in v)
            ok = ok and proj(colvec(X))==proj(colvec(X2)) and proj(colvec(Y))==proj(colvec(Y2))
            if not ok: bad+=1
    print(f"n={n} q={q} fasern={len(fib)} max_bahnen={mx} fasern_mit_2={two} ohne_tauschgestalt={bad}",flush=True)
for n,q in [(2,2),(2,3),(2,4),(2,5),(3,2),(3,3),(3,4),(4,2)]:
    run(n,q)
```

### hankel.py
```python
# All h in K^5: 2x4 Hankel [[h0..h3],[h1..h4]] of rank<=1  <=>  h = c*(s1^(4-k) s2^k) for some c, (s1:s2) in P^1(K)
import itertools
from gf import make
for q in (2,3,4,5,7):
    add,mul,neg,inv=make(q)
    def pw(a,k):
        r=1
        for _ in range(k): r=mul(r,a)
        return r
    geo=set()
    pts=[(1,r) for r in range(q)]+[(0,1)]
    for c in range(q):
        for s1,s2 in pts:
            geo.add(tuple(mul(c,mul(pw(s1,4-k),pw(s2,k))) for k in range(5)))
    r1=set()
    for h in itertools.product(range(q),repeat=5):
        M=[h[0:4],h[1:5]]
        if all(add(mul(M[0][i],M[1][j]),neg(mul(M[0][j],M[1][i])))==0 for i in range(4) for j in range(4)):
            r1.add(h)
    print(f"q={q}: rang<=1 {len(r1)}, geometrisch {len(geo)}, gleich {r1==geo}")
```

### ident.py
```python
# Naive 32-term decomposition of <4,2,4> and a random-ish dense change (A_t,B_t,C_t) via GL action;
# check Psi_p(u,w) in ker W and transpose identities a'_t(p)=-b_t(Jp), b'_t(p)=a_t(Jp), over F_q exhaustive p,u,w (q=2,3).
import itertools,random
def run(q):
    J=[[0,q-1],[1,0]]
    terms=[]
    for i in range(4):
        for k in range(2):
            for j in range(4):
                A=[[1 if (r,c)==(i,k) else 0 for c in range(2)] for r in range(4)]
                B=[[1 if (r,c)==(k,j) else 0 for c in range(4)] for r in range(2)]
                C=[[1 if (r,c)==(i,j) else 0 for c in range(4)] for r in range(4)]
                terms.append((A,B,C))
    mv=lambda M,v:[sum(M[r][c]*v[c] for c in range(len(v)))%q for r in range(len(M))]
    T=lambda M:[list(x) for x in zip(*M)]
    dot=lambda a,b:sum(x*y for x,y in zip(a,b))%q
    bad=0
    for p in itertools.product(range(q),repeat=2):
        Jp=mv(J,p)
        for u in itertools.product(range(q),repeat=4):
            for w in itertools.product(range(q),repeat=4):
                S=[[0]*4 for _ in range(4)]
                for A,B,C in terms:
                    s=dot(mv(A,p),u)*dot(mv(T(B),Jp),w)
                    for r in range(4):
                        for c in range(4): S[r][c]=(S[r][c]+s*C[r][c])%q
                if any(any(r) for r in S): bad+=1
        for A,B,C in terms:
            ap=mv(T(B),p); bp=mv(T(T(A)),Jp) # transposed: A'=B^T, B'=A^T -> a'=B^T p, b'=(A^T)^T J p
            bJ=mv(T(B),mv(J,Jp)); aJ=mv(A,Jp)
            if ap!=[(-x)%q for x in bJ] or bp!=aJ: bad+=1
    print(f"q={q}: Verstoesse {bad}")
run(2); run(3)
```

### graphs.py
```python
# Probe for Satz F, Schritt 2-4: phi=[F1:F2], psi=[G1:G2] from random pairs of linearly independent binary cubics over F_q.
# After removing gcd, d=deg phi, e=deg psi. Count rational points of Gamma1 cap Gamma2 = {(t,s): s=phi(t), t=psi(s)} in P^1xP^1(F_q).
# Check: if count > d*e+1 then the graphs coincide (psi∘phi = id on all of P^1(F_q^k)?) and d=e=1.
import random,itertools
def pdiv_gcd(a,b,q):
    # univariate gcd over F_q prime, coeff lists low->high
    def trim(x):
        while x and x[-1]%q==0: x=x[:-1]
        return x
    a,b=trim([c%q for c in a]),trim([c%q for c in b])
    while b:
        while len(a)>=len(b) and a:
            f=a[-1]*pow(b[-1],q-2,q)%q; sh=len(a)-len(b)
            a=trim([(a[i]-(f*b[i-sh] if i>=sh else 0))%q for i in range(len(a))])
        a,b=b,a
    return a
def bideg(F1,F2,q):
    # homogeneous cubic forms as coeff lists [c0..c3] of t1^(3-k) t2^k. gcd degree of the forms:
    # degree of gcd of dehomogenised polys + common power of t2 (root at infinity t2=0? ) handle: forms in x=t2/t1 plus multiplicity of t1
    g=pdiv_gcd(F1,F2,q); dg=len(g)-1
    # common factor t1 <=> top coefficient (k=3) zero in both -> handled: dehomogenised deg drop
    def lowdeg(F):
        F=[c%q for c in F]; return 3-max([k for k in range(4) if F[k]],default=-1)
    dg+=min(lowdeg(F1),lowdeg(F2))
    return 3-dg
def ev(F,t,q): return sum(F[k]*pow(t[0],3-k,q)*pow(t[1],k,q) for k in range(4))%q
def norm(v,q):
    if v[0]%q: i=pow(v[0],q-2,q); return (1,v[1]*i%q)
    return (0,1) if v[1]%q else None
def phi(F1,F2,t,q):
    v=norm((ev(F1,t,q),ev(F2,t,q)),q)
    if v is None: return 'cancel'
    return v
for q in (2,3,5,7,11,13):
    pts=[(1,r) for r in range(q)]+[(0,1)]
    viol=0; maxc=0; trials=0; eq=0
    rnd=random.Random(q)
    for _ in range(20000):
        while True:
            F1,F2,G1,G2=[[rnd.randrange(q) for _ in range(4)] for _ in range(4)]
            if bideg(F1,F2,q)>=1 and bideg(G1,G2,q)>=1 and any(F1) and any(F2) and any(G1) and any(G2): break
        # skip pairs with cancellation at rational points (value undefined there in naive eval)
        d,e=bideg(F1,F2,q),bideg(G1,G2,q)
        cnt=0; ok=True
        for t in pts:
            s=phi(F1,F2,t,q)
            if s=='cancel': ok=False;break
            t2=phi(G1,G2,s,q)
            if t2=='cancel': ok=False;break
            if t2==t: cnt+=1
        if not ok: continue
        trials+=1; maxc=max(maxc,cnt)
        if cnt>d*e+1:
            if not(d==1 and e==1 and cnt==q+1): viol+=1
            else: eq+=1
    print(f"q={q}: Versuche {trials}, max Schnittpunkte {maxc}, Faelle Gleichheit (d=e=1) {eq}, Verstoesse {viol}")
```

