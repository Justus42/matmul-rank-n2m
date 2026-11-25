Du bist ein unabhängiger, kritischer Prüfer eines mathematischen Prosa-Beweises. Du kannst nichts ausführen; urteile aus dem Text. Dein Ziel ist, den Beweis zu WIDERLEGEN, nicht zu bestätigen. Suche aktiv nach Lücken und Gegenbeispielen.

BEHAUPTUNG (B-012, Satz C): Über keinem Körper hat <4,2,4> (4×2-Matrix mal 2×4-Matrix) eine symmetrische Zerlegung der Länge 25. Folgerung C1: Der Restfall (rk L, rk H) = (3,6) ist über jedem Körper ausgeschlossen, weil dort nach Satz B jede Zerlegung symmetrisch ist.

ARTEFAKT: der Prosa-Beweis in Abschnitt 3 (Satz C) und Abschnitt 4 (Folgerung C1) der Datei s2_444_spurA_r4.md (unten vollständig). Die Definitionen stammen aus s2_444_spurA_r2.md (Abschnitte 2 und 5 unten wörtlich). Dazu der in Lean geprüfte Bestand: der Lean-Satz satzB_symm_unbedingt liefert im Fall (3,6) die Eigenschaft IsSymm (Definition unten wörtlich).

Beantworte jeden Punkt mit JA / NEIN / TEILWEISE und Begründung, auf Deutsch:
1. Schritt 0 (Abschnitt 3.1): Ist die rationale Wahl von M_p korrekt (Lösungsraum über K(p), polynomiale Basis, Existenz konstanter Koeffizienten c mit det ≢ 0)? Sind die μ_t wohldefinierte rationale Funktionen, und ist μ_t ≢ 0 korrekt begründet? Was gilt, wenn p = (1, s) als Karte benutzt wird, aber p′ = p + εd die Karte verlässt?
2. Schritt 1 (Abschnitt 3.2): Rechne (D), (E1), (E2) nach, insbesondere Vorzeichen, Transpositionen und die Umbenennung von u, w̃. Ist ω(p,p′) = pᵀJp′ mit J = [[0,−1],[1,0]] konsistent verwendet?
3. Schritt 2 (Abschnitt 3.3): Ist das Ableiten an „benachbarten Stellen“ p und p + εd über beliebigen Körpern (auch Charakteristik 2, endliche Körper) korrekt erklärt, d. h. dürfen die Identitäten rationaler Funktionen in K[ε]/(ε²) ausgewertet werden? Stimmt (Kl) einschließlich Vorzeichen?
4. Schritt 3 (Abschnitt 3.4): Ist die Dimensionszählung richtig (dim ker W = 9, dim Ĵ_p = dim span{a_t⊗b_t}, dim span{a_t⊗a_t} = dim span{a_t⊗b_t}, Dimension 10 der symmetrischen Tensoren in jeder Charakteristik), und gibt es die Quadrik Q? Was passiert in entarteten Lagen (a_t(p) = 0, μ_t(p) = 0, mehrfache oder kollineare Punkte a_t)?
5. Schritt 4 (Abschnitt 3.5): Folgt Q + Qᵀ = 0, und ist der Widerspruch in Charakteristik ≠ 2 und in Charakteristik 2 (Quadrat einer Linearform, Argument mit A = l pᵀ) korrekt? Darf man zum algebraischen Abschluss übergehen, und überträgt sich das Ergebnis auf beliebige Körper, auch sehr kleine endliche?
6. Symmetriebegriff: Ist die Symmetrie der Prosa (offene Menge von p, M_p invertierbar, M_p b_t(p) ∈ K̄·a_t(p)) dieselbe wie IsSymm in Lean? IsSymm ist eine Eigenschaft eines einzelnen normierten Algorithmus (also einer einzelnen Stelle p) und erlaubt μ_t = 0. Gilt Satz C auch für diese schwächere Symmetrie? Wenn ja, unter welcher Zusatzbedingung (z. B. IsSymm an allen p einer offenen Menge)? Wenn nein, warum nicht?
7. Folgerung C1 (Abschnitt 4): Ist der Schritt „Die zulässigen p bilden eine nichtleere offene Menge, in der der Fall (rk L, rk H) überall derselbe ist“ begründet? Wenn nicht: Ist das eine echte Lücke, und wie lautet eine korrekte Fassung von C1, die für das Gesamtziel (Rang von <4,2,4> ist 26) genügt?
8. Gegenbeispiele: Findest du eine Situation (Körper, Daten, Entartung), in der ein Schritt falsch ist? Ist Bemerkung C′ (symmetrische Zerlegungen von <n,2,n> haben Länge ≥ (3n²+n)/2) mit bekannten Werten verträglich (n = 2: 7, n = 3: 15)?
9. Gesamturteil: hält / hält mit benannter Reparatur / Lücke mit genauer Stelle. Nenne alle Abweichungen, auch kleine. Was bräuchte eine Lean-Formalisierung, und wo wird sie am schwersten?

==================== BEHAUPTUNG behauptungen/B-012.md (wörtlich) ====================
# B-012: Keine symmetrische Zerlegung von ⟨4,2,4⟩ der Länge 25; der Restfall (3,6) ist unmöglich (Satz C)

- Aussage: Sei K ein Körper. Es gibt keine Zerlegung (Z) von ⟨4,2,4⟩ der Länge 25 über K, die symmetrisch ist. Symmetrisch heißt: Mit a_t(p) = A_t p und b_t(p) = B_tᵀ J p (J = [[0,−1],[1,0]]) gibt es eine nichtleere Zariski-offene Menge von p ∈ K̄² und zu jedem solchen p eine invertierbare Matrix M_p ∈ GL_4(K̄) mit M_p b_t(p) ∈ K̄·a_t(p) für alle t (das ist Folgerung V1 aus S2-05, für alle p einer offenen Menge). Folgerung C1: Zusammen mit B-008 (Satz A) und B-009 (Satz B: im Fall (3,6) symmetrisch) liegt eine Zerlegung der Länge 25 über keinem Körper im Fall (rk L, rk H) = (3,6). Es bleibt nur der Fall (5,8), und dort ist die Zerlegung nicht symmetrisch.
- Status: **behauptet**
- Herkunft: S2-16 (Stufe 2, Runde 4, Spur A), `lean/prosa/s2_444_spurA_r4.md` Abschnitte 3 und 4.
- Artefakt: Prosa-Beweis `lean/prosa/s2_444_spurA_r4.md` Abschnitt 3 (Satz C) und Abschnitt 4 (Folgerung C1). Gegenproben der Kernidentität (Kl): `versuche/s2-16/klee.py` (Strassen, exakt über ℚ) und `versuche/s2-16/klee_f2.py` (14 symmetrische Verfahren der Länge 26 über 𝔽₂, exakt in GF(2³¹)). Kein Lean-Satz.
- Prüfung: keine. Vorgeschlagen: Prüfer und Fremdmodell (Schwerpunkte im Bericht am Ende von Abschnitt 3.5).
- Aussagen-Abgleich: entfällt, solange es keinen Lean-Satz gibt.
- Bemerkungen: Folgerung C1 hängt an B-008 und B-009 (beide behauptet). Der Beweis von Satz C selbst braucht von den Restfall-Ergebnissen nichts. Er nutzt nur die Zerlegungsgleichung, die Symmetrie auf einer offenen Menge von p, dim ker W = 9 und B-007 (geprüft; daraus folgt, dass kein Term überflüssig ist). Bemerkung C′ im Bericht: Für ⟨n,2,n⟩ hat jede symmetrische Zerlegung Länge ≥ (3n² + n)/2. Den Status setzt der Orchestrator.

==================== lean/prosa/s2_444_spurA_r4.md (Kopf und Abschnitte 1 bis 4 vollständig und wörtlich) ====================
# S2-16: Die Restfälle (3,6) und (5,8) für ⟨4,2,4⟩ bei Rang 25, Bericht der Spur A, Runde 4

- Auftrag: S2-16 (Stufe 2, Runde 4), Rolle Beweissucher, Spur A. Ein Restfall darf in beide Richtungen angegriffen werden (Protokoll 0.3, Abschnitt 3).
- Datum: 25.11.2026
- Status aller Aussagen dieses Berichts: **behauptet** (Beweise und Rechnungen eines Agenten, von niemandem geprüft), wo ausdrücklich gesagt: **vermutet**. Nichts hier ist geprüft im Sinn von Abschnitt 5 des Protokolls. Die Wörter „bewiesen“ und „gelöst“ kommen deshalb nicht vor; „Beweis“ heißt hier Prosa-Beweis.
- Grundlage: `lean/prosa/yang_n4.md` (Bezeichnungen, Lemma 8, Folgerung 7), `lean/prosa/s2_444_spurA_r2.md` (S2-05: Satz A, Satz B, Lemmata 13′, V, S, Modelle), `lean/prosa/s2_444_spurA_r2_pruefung.md` (S2-09: Reparatur R1, Fassung V′ von Lemma V), `behauptungen/B-007.md`, `B-008.md`, `B-009.md`. `versuche/` gelesen.
- Kein Fremdmodell benutzt.
- Code und Ausgaben: `versuche/s2-16/` (eigener Code, Python, exakte Arithmetik: sympy über ℚ, GF(2³¹), ℤ/(2⁶¹−1); keine Gleitkommazahlen).

---

## 1. Ergebnis in Kürze

1. **Satz C (neu): Über keinem Körper hat ⟨4,2,4⟩ eine symmetrische Zerlegung der Länge 25.** „Symmetrisch“ heißt wie in Folgerung V1 von S2-05: Für p aus einer nichtleeren offenen Menge gibt es eine invertierbare Matrix G_p mit G_pᵀ b_t(p) ∥ a_t(p) für alle Terme t. Der Beweis (Abschnitt 3) leitet die Zerlegungsgleichung an zwei benachbarten Stellen p und p + εd ab und erhält eine Identität (Kl), in der nur die Punkte a_t(p) vorkommen. Eine Quadrik durch alle a_t(p) gibt es bei Länge 25 immer (dim Ĵ ≤ 9 < 10), und (Kl) verbietet sie. Die Identität (Kl) habe ich exakt nachgerechnet: an Strassens Verfahren über ℚ und an den 14 symmetrischen Verfahren der Länge 26 über 𝔽₂ aus S2-05.
2. **Folgerung: Der Fall (3,6) ist über jedem Körper ausgeschlossen.** Nach Satz B (B-009) ist eine Zerlegung im Fall (3,6) symmetrisch, nach Satz C gibt es keine solche. Damit bleibt von Yangs vier Restfällen nur **(5,8)**.
3. **Fall (5,8), eingegrenzt.** Ist die Zerlegung symmetrisch, greift Satz C. Sonst ist nach V′ (S2-09) der gemeinsame Kern N(u_0) für jedes zulässige u_0 null, und nach Lemma 13′ ist s = 1. Daraus folgt eine Büschelstruktur (Lemma P, Abschnitt 5.1): Die Kernvektoren k(γ) der F_γ spannen einen Raum K* der Dimension 2 (Unterfall A) oder 3 (Unterfall B).
4. **Satz E (neu): Unterfall A ist unmöglich.** Dort ist Ψ auf K⁴ × K* eine „enge“ nichtsinguläre Abbildung nach K⁵. Nach Kronecker ist sie die Multiplikation kubischer mit linearen binären Formen. Daraus folgt: Alle a_t liegen auf einer verdrehten Kubik, alle b_t auf einer rationalen Kurve vom Grad 4, mit demselben Parameter σ_t. Dann liegen die a_t ⊗ b_t in einem Raum der Dimension ≤ 8, aber dim Ĵ = 9 (Abschnitt 5.2).
5. **Offen bleibt genau ein Unterfall:** (5,8), nicht symmetrisch, s = 1, Unterfall B, und zwar für die Zerlegung und für ihre Transponierte zugleich (Abschnitt 5.3). Dort liegen alle b_t auf einer verdrehten Kubik, und alle a_t ebenso. Die Gradzählung aus Satz E ergibt hier genau 9 und schließt nichts aus. Was fehlt, steht in Abschnitt 5.4.
6. **Richtung zwei (Bau eines Verfahrens):** Im Fall (3,6) gibt es nach Satz C kein Verfahren. Die Modelle M1, M3 und K(0,1,2,5) aus S2-05 sind symmetrisch (a_t = b_t). Keine Zerlegung, die auf einer offenen Menge von p symmetrisch ist, setzt sie fort. Für (5,8) ist nur noch der Unterfall B möglich. Er gibt eine konkrete Gestalt der Daten vor (Abschnitt 6), eine Suche danach habe ich in dieser Runde nicht gerechnet. Ein Verfahren mit 25 Produkten habe ich nicht gefunden.
7. **Daten (Abschnitt 7):** In allen 14 Verfahren der Länge 26 mit ρ = 3 über 𝔽₂ hängt G_p nicht von p ab. 19 der 26 Matrizen A_t haben Rang 1. Die Verfahren sind fast invariant unter der Involution (A, B, C) ↦ (G⁻¹BᵀJ, JAᵀGᵀ, Cᵀ): 25 der 26 Terme gehen in Terme über, 7 Terme bleiben fest.

Für die Abbruchregel: Satz C mit seiner Folgerung schließt einen benannten Fall der Fallunterscheidung aus, (3,6). Fortschritt nach Regel 2 b) wird es erst nach Bestätigung durch Prüfer und Fremdmodell. Die Behauptungen stehen in `behauptungen/B-012.md` (Satz C) und `behauptungen/B-013.md` (Lemma P und Satz E).

---

## 2. Rahmen und Bezeichnungen

Alles wie in `lean/prosa/yang_n4.md` und S2-05 Abschnitt 2, mit n = m = 4, r = 25, K algebraisch abgeschlossen (Lemma R1). Zusätzlich brauche ich die Abhängigkeit von p ausdrücklich. Das ist dieselbe Zerlegung, nur ohne Basiswechsel geschrieben.

- Die Zerlegung ist A·B = Σ_t α_t(A) β_t(B) C_t mit α_t(A) = Σ_{i,k} A_t[i,k] A[i,k] und β_t(B) = Σ_{k,j} B_t[k,j] B[k,j], also A_t ∈ K^{4×2}, B_t ∈ K^{2×4}.
- J := [[0, −1], [1, 0]], ω(p, p′) := pᵀ J p′ für p, p′ ∈ K² (alternierend, ω(p,p) = 0, ω(p,p′) ≠ 0 für unabhängige p, p′).
- **a_t(p) := A_t p ∈ K⁴** und **b_t(p) := B_tᵀ J p ∈ K⁴**. Beide sind linear in p. Mit v_p := Jp gilt p·v_p = 0. Das ist bis auf die Basis die Lage aus S2-05: Ψ_p(u, w)_t = α_t(u pᵀ) β_t(v_p wᵀ) = (a_t(p)·u)(b_t(p)·w).
- **Grundidentität (D).** Für A = u pᵀ und B = v′ wᵀ ist A·B = (p·v′) u wᵀ. Mit v′ = J p′ folgt für alle p, p′ ∈ K² und u, w ∈ K⁴:

  Σ_t (a_t(p)·u)(b_t(p′)·w) C_t = ω(p, p′) · u wᵀ.   (D)

  Für p′ = p ist das die bekannte Aussage Ĵ_p ⊆ ker W.
- Ĵ_p := span{Ψ_p(u, w)}. Es ist dim Ĵ_p = dim span{a_t(p) ⊗ b_t(p)} (die Abbildung X ↦ (a_t(p)ᵀ X b_t(p))_t hat das Bild Ĵ_p) und rk L = dim Ĵ_p − 4 (S2-05). Wegen Ĵ_p ⊆ ker W und dim ker W = 25 − 16 = 9 gilt **dim span{a_t(p) ⊗ b_t(p)} ≤ 9**.
- **Zulässiges p** wie in S2-05 Abschnitt 2 mit Reparatur R1 aus S2-09: (N2) gilt, α_t(·⊗p) ≢ 0 und β_t(v_p⊗·) ≢ 0 für alle t. Das ist eine nichtleere offene Bedingung. Für zulässiges p ist a_t(p) ≠ 0 und b_t(p) ≠ 0 für alle t. Zulässige u_0 erfüllen a_t(p)·u_0 ≠ 0 für alle t (N1).
- Kein Term ist überflüssig: Wäre A_t = 0 oder B_t = 0, gäbe es eine Zerlegung der Länge 24, im Widerspruch zu B-007 (geprüft).

**Symmetrisch** (wie Folgerung V1 in S2-05, hier mit der Abhängigkeit von p): Es gibt eine nichtleere offene Menge P ⊆ K² und zu jedem p ∈ P eine invertierbare Matrix M_p mit M_p b_t(p) ∈ K·a_t(p) für alle t. (In S2-05 heißt M_p = G_pᵀ.)

---

## 3. Satz C: Keine symmetrische Zerlegung der Länge 25

**Satz C.** Über keinem Körper hat ⟨4,2,4⟩ eine symmetrische Zerlegung der Länge 25.

### 3.1 Schritt 0: M_p und μ_t(p) als rationale Funktionen

Die Bedingung „M b_t(p) ∈ K·a_t(p) für alle t“ ist linear in M: alle 2×2-Minoren der 4×2-Matrix [M b_t(p) | a_t(p)] verschwinden. Die Koeffizienten sind Polynome in p. Über dem Funktionenkörper K(p) (etwa p = (1, s)) hat der Lösungsraum eine Basis M_1(p), …, M_k(p) aus Polynommatrizen. Außerhalb endlich vieler s ist der Lösungsraum an der Stelle p genau span{M_i(p)}. Nach Voraussetzung enthält er für p in einer offenen Menge eine invertierbare Matrix. Also ist das Polynom det(Σ_i c_i M_i(p)) in den Variablen (c, p) nicht das Nullpolynom, und es gibt Konstanten c ∈ K^k, für die det(Σ c_i M_i(p)) als Polynom in p nicht null ist. Setze **M_p := Σ c_i M_i(p)**, **H_p := M_p⁻¹**. Dann gibt es rationale Funktionen μ_t(p) mit

  M_p b_t(p) = μ_t(p) a_t(p), also **b_t(p) = μ_t(p) H_p a_t(p)**,   (S)

nämlich μ_t(p) = (M_p b_t(p))_i / a_t(p)_i für ein i mit a_t(p)_i ≢ 0. Kein μ_t ist die Nullfunktion, sonst wäre b_t(p) = 0 für alle p, also B_t = 0. Halte ein zulässiges p fest, an dem M_p und alle μ_t definiert sind, det M_p ≠ 0 und μ_t(p) ≠ 0 für alle t gilt. Solche p bilden eine nichtleere offene Menge.

### 3.2 Schritt 1: zwei Fassungen von (D)

Setze (S) an der Stelle p′ in (D) ein: b_t(p′)·w = μ_t(p′)(a_t(p′)·H_{p′}ᵀ w). Mit w = H_{p′}⁻ᵀ w̃:

  Σ_t μ_t(p′)(a_t(p)·u)(a_t(p′)·w̃) C_t = ω(p, p′) · u w̃ᵀ H_{p′}⁻¹.   (E1)

Vertauscht man in (D) die Rollen von p und p′ und setzt (S) an der Stelle p ein, erhält man nach Umbenennen von u und w̃:

  Σ_t μ_t(p)(a_t(p)·u)(a_t(p′)·w̃) C_t = ω(p′, p) · w̃ uᵀ H_p⁻¹ = −ω(p, p′) · w̃ uᵀ H_p⁻¹.   (E2)

(E1) und (E2) gelten für alle u, w̃ und für p, p′ aus einer offenen Menge, also als Identitäten rationaler Funktionen in (p, p′).

### 3.3 Schritt 2: Ableitung, die Identität (Kl)

Ziehe (E2) von (E1) ab:

  Σ_t (μ_t(p′) − μ_t(p))(a_t(p)·u)(a_t(p′)·w̃) C_t = ω(p, p′)[u w̃ᵀ H_{p′}⁻¹ + w̃ uᵀ H_p⁻¹].

Setze p′ = p + εd mit d ∈ K², ω(p, d) ≠ 0, und rechne in K[ε]/(ε²) (alle Nenner sind an der Stelle p ungleich null, also ist das Einsetzen erlaubt). Mit δ_t := (Ableitung von μ_t an der Stelle p in Richtung d) ist die linke Seite ε Σ_t δ_t (a_t(p)·u)(a_t(p)·w̃) C_t, die rechte ε ω(p,d)(u w̃ᵀ + w̃ uᵀ) H_p⁻¹, jeweils plus O(ε²). Der Koeffizient von ε gibt:

  **Σ_t δ_t (a_t(p)·u)(a_t(p)·w̃) C_t = ω(p, d) · (u w̃ᵀ + w̃ uᵀ) · M_p**   für alle u, w̃ ∈ K⁴.   (Kl)

Die Identität (Kl) gilt für jede symmetrische Zerlegung von ⟨n,2,n⟩, jeder Länge und in jeder Charakteristik (mit K^n statt K⁴). Gegenproben in Abschnitt 3.6.

### 3.4 Schritt 3: eine Quadrik durch alle a_t(p)

Wegen (S) und μ_t(p) ≠ 0 ist a_t(p) ⊗ b_t(p) = μ_t(p)(I ⊗ H_p)(a_t(p) ⊗ a_t(p)). Also

  dim span{a_t(p) ⊗ a_t(p)} = dim span{a_t(p) ⊗ b_t(p)} = dim Ĵ_p ≤ 9.

Die Vektoren x ⊗ x (x ∈ K⁴) spannen in jeder Charakteristik einen Raum der Dimension 10 auf (die symmetrischen Tensoren). Also gibt es eine Matrix Q ∈ K^{4×4} mit

  a_t(p)ᵀ Q a_t(p) = 0 für alle t, aber q(x) := xᵀ Q x ist nicht die Nullform.

### 3.5 Schritt 4: der Widerspruch

Setze in (Kl) u = e_i, w̃ = e_j, multipliziere mit Q_{ij} und summiere über i, j. Links steht Σ_t δ_t (a_t(p)ᵀ Q a_t(p)) C_t = 0. Rechts steht ω(p, d)(Q + Qᵀ) M_p. Da ω(p, d) ≠ 0 und M_p invertierbar ist, folgt

  **Q + Qᵀ = 0.**

Q + Qᵀ ist die Matrix der Polarform von q, also hat q die Polarform null.
- Charakteristik ≠ 2: Dann ist q(x) = ½ xᵀ(Q + Qᵀ)x = 0, Widerspruch.
- Charakteristik 2: Eine quadratische Form mit Polarform null hat keine gemischten Glieder, q(x) = Σ c_i x_i². Über dem algebraisch abgeschlossenen K ist q = ℓ² mit der Linearform ℓ(x) = Σ c_i^{1/2} x_i ≠ 0. Dann ist ℓ(a_t(p)) = 0 für alle t. Sei ℓ(x) = l·x. Für A = l pᵀ ist α_t(A) = lᵀ A_t p = ℓ(a_t(p)) = 0 für alle t, also A·B = 0 für alle B nach der Zerlegungsgleichung. Aber A·B = l (pᵀB) ≠ 0 für passendes B. Widerspruch.

Also gibt es keine symmetrische Zerlegung der Länge 25. ∎

**Bemerkung C′ (allgemeines n, behauptet).** Derselbe Beweis zeigt für ⟨n,2,n⟩: Ist eine Zerlegung der Länge r symmetrisch, dann liegt keine Quadrik durch alle a_t(p), also n(n+1)/2 ≤ dim Ĵ_p ≤ r − n², das heißt **r ≥ n² + n(n+1)/2 = (3n² + n)/2**. Das ist genau die Hopcroft-Kerr-Zahl ⌈(3nm + max(n,m))/2⌉ für n = m. Symmetrische Verfahren kommen also nie unter die bekannte obere Schranke. Für n = 2 und n = 3 ist das mit den bekannten Rängen 7 und 15 verträglich. Strassens Verfahren ist symmetrisch (Abschnitt 3.6) und erreicht die Schranke 7.

**Wie belastbar ist das?** Status behauptet. Kritische Stellen für einen Prüfer:
1. Schritt 0: die rationale Wahl von M_p (Lösungsraum über K(p), Existenz einer invertierbaren Kombination mit konstanten Koeffizienten). Ohne sie wäre die Ableitung von μ_t nicht erklärt.
2. Schritt 2: Vorzeichen und Umbenennung in (E2). Die Gegenprobe über ℚ (Strassen) prüft genau die Vorzeichen.
3. Schritt 4 in Charakteristik 2: Polarform null ⇒ Quadrat einer Linearform; danach das elementare Argument mit A = l pᵀ.
4. Die Anwendung: dass die Symmetrie aus Satz B für p aus einer offenen Menge gilt, nicht nur für ein einzelnes p (Abschnitt 4).

### 3.6 Gegenproben (exakt)

- `versuche/s2-16/klee.py` (sympy über ℚ, p = (1, s) symbolisch): Strassens Verfahren für ⟨2,2,2⟩. Die Matrizen C_t werden aus den A_t, B_t durch exaktes Lösen bestimmt. Ergebnis: Lösungsraum für M_p über ℚ(s) eindimensional, M_p = [[0,−1],[1,0]] konstant, (Kl) gilt identisch in s, ebenso die Gleichung nullter Ordnung Σ_t μ_t a_t a_tᵀ ⊗ C_t = 0, und dim span{a_t a_tᵀ} = 3 = dim Sym²(K²). Ausgabe: `klee_ausgabe.txt`.
- `versuche/s2-16/klee_f2.py` (GF(2³¹), Ableitung mit dualen Zahlen): die 14 Verfahren der Länge 26 mit ρ = 3 aus `versuche/s2-spurA-r2/daten/rho3_rang26_f2.txt`. In allen 14 gilt (Kl) exakt, 19 der 26 Funktionen μ_t sind nicht konstant (die Ableitung wird also wirklich gebraucht), und dim span{a_t ⊗ a_t} = 10, wie Satz C für symmetrische Verfahren verlangt. Ausgabe: `klee_f2_ausgabe.txt`.

In Charakteristik 2 prüft die zweite Rechnung keine Vorzeichen. Die erste prüft sie über ℚ.

---

## 4. Folgerungen für die Restfälle

**Folgerung C1 (Fall (3,6) ausgeschlossen, behauptet).** Hat ⟨4,2,4⟩ über einem Körper eine Zerlegung der Länge 25, so liegt sie in Yangs Normalform nicht im Fall (3,6).

*Beweis.* Nach Satz B (B-009, mit R1 und V′ aus S2-09) ist eine Zerlegung im Fall (3,6) für jedes zulässige p symmetrisch. Die zulässigen p bilden eine nichtleere offene Menge, in der der Fall (rk L, rk H) überall derselbe ist. Satz C schließt das aus. ∎

Zusammen mit Satz A (B-008) und Satz B (B-009): **Eine Zerlegung der Länge 25 liegt im Fall (5,8) und ist nicht symmetrisch.**

**Folgerung C2 ((5,8) ist nicht symmetrisch, behauptet).** Sei die Zerlegung im Fall (5,8). Die Menge der zulässigen p, an denen eine invertierbare M_p wie oben existiert, ist konstruierbar (Projektion einer konstruierbaren Menge, Chevalley). Wäre sie dicht, enthielte sie eine offene Menge, und Satz C gäbe einen Widerspruch. Also gibt es eine nichtleere offene Menge P_ns zulässiger p ohne Symmetrie. Für p ∈ P_ns gilt nach V′ (S2-09): **N(u_0) = 0 für jedes zulässige u_0**, und nach Lemma 13′ (rk H = 8 ≥ 7 + s): **s = 1**.

**Folgerung C3 (Modelle).** Die Modelle M1, M3 und K(0,1,2,5) aus S2-05 Abschnitt 8.3 haben a_t = b_t und sind damit an ihrer Stelle p symmetrisch. Keine Zerlegung der Länge 25, die auf einer offenen Menge von p symmetrisch ist, setzt eines davon fort. Ein Modell an einer einzelnen Stelle p ist kein generischer Punkt. Ganz ausgeschlossen sind diese Modelle deshalb nur unter dieser Zusatzannahme.

---


(Die Abschnitte 5 bis 11 dieser Datei behandeln den Fall (5,8), gehören nicht zum geprüften Artefakt und sind hier weggelassen. Abschnitte 1 bis 4 stehen oben vollständig und wörtlich.)

==================== lean/prosa/s2_444_spurA_r2.md, Abschnitt 2 und Abschnitt 5 (wörtlich) ====================
## 2. Rahmen und Bezeichnungen

Alles wie in `lean/prosa/yang_n4.md`, mit n = m = 4 und r = 25. Kurz:

- K algebraisch abgeschlossen (Lemma R1 dort: Eine Zerlegung über einem Körper ist eine über seinem algebraischen Abschluss). Kein α_t ist 0, Normalform (N1), (N2) nach Lemma 6.
- Zerlegung: A·B = Σ_t α_t(A) β_t(B) C_t. D(A) = diag(α_t(A)), ℬ(B) = (β_t(B))_t, W(s) = Σ s_t C_t.
- U = {x ∈ K^{2×4} : Zeile 0 von x ist 0}, dim U = 4. f_i(x) = D(e_{i,0})ℬ(x). J = f_0(U). Q = ker W / J, dim Q = r − 20 = 5.
- F_i : U → Q, F_i(x) = f_i(x) + J (i = 1, 2, 3). L(u_1,u_2,u_3) = Σ F_i(u_i). H die schiefe Erweiterung von L auf U^{∧3}. ρ = max_γ rk(Σ γ_i F_i).
- g wie in yang_n4.md Abschnitt 4, Φ wie in Abschnitt 5.

Zusätzlich benutze ich eine Schreibweise, die nicht von der Wahl der Basis u_0, …, u_3 abhängt. Lemma 6 wählt einen Zeilenvektor p ∈ K^{1×2} und eine Basis u_0, u_1, u_2, u_3 von K⁴ so, dass nach dem Basiswechsel R3 gilt: α′_t(e_{i,0}) = α_t(u_i·p). Für u ∈ K⁴ und x ∈ U (in den neuen Koordinaten) sei

  **Ψ(u, x) := D′(u′)·ℬ′(x) ∈ K^r**, wobei u′ = Σ_i γ_i e_{i,0} mit u = Σ_i γ_i u_i,

also Ψ(u_i, x) = f_i(x). In den alten Koordinaten ist Ψ(u, x)_t = α_t(u·p)·β_t(v·w), wobei v ∈ K² mit p·v = 0 und w die Zeile 1 von x ist. Ψ ist bilinear und hängt nur von p ab, nicht von u_0. Dann gilt:

- J = Ψ(u_0, U), f_i = Ψ(u_i, ·), F_i(x) = Ψ(u_i, x) + J.
- **(Ψ1) Ψ ist nichtsingulär:** Ψ(u, x) ≠ 0 für u ≠ 0, x ≠ 0. Das ist Folgerung 7 (aus N2), angewandt auf x ∈ U.
- Setzt man a_t := (α_t(u_i·p))_{i} ∈ K⁴ (Koordinaten bezüglich u_0, …, u_3) und b_t ∈ K⁴ so, dass β′_t(x) = b_t·w für x ∈ U mit Zeile 1 gleich w, dann ist **Ψ(u, x)_t = (a_t·u)(b_t·w)** (u in Koordinaten).
- Ĵ := Ψ(K⁴, U) (Spann aller Werte) = J + f_1(U) + f_2(U) + f_3(U). Es ist Ĵ ⊆ ker W (Lemma 4.1(i)) und **rk L = dim Ĵ − 4**, denn im L = (Σ_{i≥1} f_i(U) + J)/J = Ĵ/J.

**Wahl von p und u_0.** Lemma 6 Schritt 4 liefert: Die zulässigen Paare (u_0, p) bilden eine nichtleere Zariski-offene Menge. Ich halte ein p fest, für das (N2) gilt und für das α_t(·⊗p) für kein t identisch verschwindet. Dann ist u_0 zulässig genau dann, wenn Π_t α_t(u_0·p) ≠ 0. Die zulässigen u_0 bilden eine offene dichte Menge O_p ⊆ K⁴, und u_1, u_2, u_3 ergänzen u_0 beliebig zu einer Basis. Yangs Beweis und alle folgenden Aussagen gelten für **jedes** u_0 ∈ O_p. Größen, die von u_0 abhängen (ρ, rk H, N), schreibe ich bei Bedarf als ρ(u_0), rk H(u_0), N(u_0).

Bemerkung zur Basisunabhängigkeit: ρ und rk H hängen nur von u_0 ab, nicht von der Ergänzung u_1, u_2, u_3. Ein Wechsel der Ergänzung ersetzt (F_1, F_2, F_3) durch Σ_j ξ_{ij} F_j mit ξ ∈ GL_3 (Vielfache von u_0 ändern F_i nicht, weil Ψ(u_0, x) ∈ J). Nach Lemma 13 Schritt 1 in yang_n4.md bleiben rk L, ρ und rk H dabei gleich.

---

## 5. Lemma V: Gemeinsamer Kern erzwingt Symmetrie

Für u_0 ∈ O_p sei N(u_0) := {x ∈ U : Ψ(u, x) ∈ Ψ(u_0, U) für alle u ∈ K⁴}. Das ist genau der gemeinsame Kern der F_i, die zu u_0 gehören (für u = u_0 ist die Bedingung leer, für u = u_1, u_2, u_3 heißt sie F_i(x) = 0, dazwischen linear).

**Lemma V.** Sei K algebraisch abgeschlossen, Ψ : K⁴ × U → K^r bilinear und nichtsingulär (Ψ1), dim U = 4. Es gelte:

- (a) Für Paare (u, u′) aus einer offenen dichten Teilmenge von K⁴ × K⁴ ist dim(Ψ(u, U) + Ψ(u′, U)) = 7.
- (b) Für u′ aus einer offenen dichten Teilmenge O ⊆ K⁴ ist N(u′) ≠ 0.

Dann gibt es eine invertierbare lineare Abbildung G : K⁴ → U mit

  **Ψ(u, G u′) = Ψ(u′, G u) für alle u, u′ ∈ K⁴.**

*Beweis.* Für u, u′ ∈ K⁴ sei I(u, u′) := {(x, x′) ∈ U² : Ψ(u, x) = Ψ(u′, x′)}. Die Abbildung U² → K^r, (x, x′) ↦ Ψ(u, x) − Ψ(u′, x′), hat das Bild Ψ(u, U) + Ψ(u′, U). Unter (a) ist also dim I(u, u′) = 8 − 7 = 1.

*Schritt 1 (eine lineare Abbildung zu festem u′).* Sei u′ ∈ O und v′ ∈ N(u′), v′ ≠ 0. Für jedes u ist Ψ(u, v′) ∈ Ψ(u′, U). Da Ψ(u′, ·) injektiv ist (Ψ1, u′ ≠ 0), gibt es genau ein φ(u) ∈ U mit Ψ(u, v′) = Ψ(u′, φ(u)), und φ ist linear (beide Seiten linear in u, Ψ(u′, ·) injektiv). φ ist injektiv: Aus φ(u) = 0 folgt Ψ(u, v′) = 0, mit v′ ≠ 0 also u = 0. Also ist φ invertierbar (dim K⁴ = dim U = 4). Mit u = u′ folgt φ(u′) = v′.

*Schritt 2 (v(u) ist zu φ(u) proportional).* Sei u ∈ O so, dass (u, u′) zur offenen Menge aus (a) gehört, und v(u) ∈ N(u), v(u) ≠ 0. Dann liegen zwei Elemente in I(u, u′):
- (v′, φ(u)), denn Ψ(u, v′) = Ψ(u′, φ(u));
- (y, v(u)) für ein y ∈ U, denn Ψ(u′, v(u)) ∈ Ψ(u, U).
Beide sind ≠ 0. Da I(u, u′) eindimensional ist, sind sie proportional, insbesondere ist v(u) ein Vielfaches ≠ 0 von φ(u). Das gilt für alle u aus einer offenen dichten Menge.

*Schritt 3 (unabhängig von u′).* Sei u″ ∈ O ein zweiter Punkt, φ″ die Abbildung aus Schritt 1 zu u″. Nach Schritt 2 ist v(u) für u aus einer offenen dichten Menge zugleich Vielfaches von φ(u) und von φ″(u). Also ist jeder Vektor einer offenen dichten Menge ein Eigenvektor von M := φ^{−1}φ″. Die Vektoren y mit My ∧ y = 0 bilden eine Zariski-abgeschlossene Menge; sie enthält eine dichte Menge, also alle y. Eine lineare Abbildung, für die jeder Vektor ein Eigenvektor ist, ist ein Vielfaches der Identität. Also φ″ = c·φ mit c ≠ 0.

*Schritt 4 (Symmetrie).* Setze G := φ (zu einem festen u′ ∈ O). Für jedes u″ ∈ O ist nach Schritt 1 Ψ(u, φ″(u″)) = Ψ(u, v″) = Ψ(u″, φ″(u)) für alle u, mit v″ = φ″(u″). Mit φ″ = cG und Division durch c: Ψ(u, Gu″) = Ψ(u″, Gu) für alle u ∈ K⁴ und alle u″ ∈ O. Beide Seiten sind bilinear in (u, u″), also Polynome, die auf der dichten Menge K⁴ × O übereinstimmen. Also überall. ∎

**Folgerung V1 (Koordinatenform).** In Koordinaten ist Ψ(u, x)_t = (a_t·u)(b_t·w). Die Gleichung aus Lemma V heißt (a_t·u)(b_t·G u′) = (a_t·u′)(b_t·G u) für alle u, u′ (G als Matrix auf den Koordinaten w). Die Matrix a_t (Gᵀb_t)ᵀ vom Rang ≤ 1 ist also symmetrisch. Da a_t ≠ 0 (wegen N1: a_t·u_0 ≠ 0) und b_t ≠ 0 (sonst wäre β_t(v·w) = 0 für alle w und das generisch gewählte v; dann ist β_t = 0 und der Term überflüssig, Widerspruch zu R ≥ 25), folgt

  **Gᵀ b_t = μ_t a_t mit μ_t ≠ 0, für alle t.**

Das nenne ich „symmetrisch“. Es ist eine Eigenschaft der Zerlegung und von p, nicht von u_0.

---


==================== Lean (Lean 4, mathlib): Definitionen und Satzaussagen (wörtlich) ====================
```lean
structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
  alpha : Fin r → (Matrix (Fin n) (Fin l) K →ₗ[K] K)
  beta : Fin r → (Matrix (Fin l) (Fin m) K →ₗ[K] K)
  coeff : Fin r → Matrix (Fin n) (Fin m) K
  correct : ∀ (A : Matrix (Fin n) (Fin l) K) (B : Matrix (Fin l) (Fin m) K),
    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k

abbrev eA (i : Fin (d + 1)) (j : Fin 2) : Matrix (Fin (d + 1)) (Fin 2) K := unitMatrix i j

def emb : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K where
  toFun y := Matrix.of ![0, y]
  map_add' y z := by ext i j; fin_cases i <;> simp
  map_smul' c y := by ext i j; fin_cases i <;> simp
def avec (alg : BilinearAlgorithm K (d + 1) 2 m r) (A : Matrix (Fin (d + 1)) (Fin 2) K) :
    Fin r → K :=
  fun k => alg.alpha k A

/-- `ℬ(B) = (β_0(B), …, β_{r-1}(B))`. -/
def bvec (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  LinearMap.pi alg.beta

/-- `x ↦ D(A) ℬ(x)`. -/
def prodMap (alg : BilinearAlgorithm K (d + 1) 2 m r) (A : Matrix (Fin (d + 1)) (Fin 2) K) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) where
  toFun x k := alg.alpha k A * alg.beta k x
  map_add' x y := by ext k; simp [mul_add]
  map_smul' c x := by
    ext k
    simp only [map_smul, smul_eq_mul, Pi.smul_apply, RingHom.id_apply]
    ring

/-- `f_i(x) = D(e_{i,0}) ℬ(x)` (prose Section 3). -/
def fv (alg : BilinearAlgorithm K (d + 1) 2 m r) (i : Fin (d + 1)) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  prodMap alg (eA i 0)

def SN1 (alg : BilinearAlgorithm K (d + 1) 2 m r) : Prop :=
  ∀ k, alg.alpha k (eA 0 0) ≠ 0

/-- (N2): for `v ≠ 0` the vectors `f_0(v), …, f_d(v)` are linearly independent. -/
def SN2 (alg : BilinearAlgorithm K (d + 1) 2 m r) : Prop :=
  ∀ v : Matrix (Fin 2) (Fin m) K, v ≠ 0 → LinearIndependent K (fun i => fv alg i v)

/-- `a_t = (α_t(e_{i,0}))_i`. -/
def avecs (t : Fin r) : Fin 4 → K := fun i => alg.alpha t (eA (d := 3) i 0)
/-- **Symmetric** (prose Folgerung V1, `Gᵀ b_t = μ_t a_t`): there are an automorphism `e` of
`K⁴` and scalars `μ_t` with `β_t(emb (e y)) = μ_t (a_t · y)`. -/
def IsSymm : Prop :=
  ∃ (e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K)) (μ : Fin r → K),
    ∀ t y, alg.beta t (emb (e y)) = μ t * ∑ i, y i * avecs alg t i

/-- **Satz B, second part,** without hypotheses: statement of `satzB_symm` without `hN`. -/
theorem satzB_symm_unbedingt (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (h : (finrank K (LinearMap.range (Lq (d := 3) alg)),
        finrank K (LinearMap.range (Hq (d := 3) alg))) = (3, 6)) : IsSymm alg :=
  satzB_symm (commonKernelHyp_holds K) alg h1 h2 h

```
