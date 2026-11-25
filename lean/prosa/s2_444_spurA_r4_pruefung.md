# S2-22: Prüfung von B-012 (Satz C und Folgerung C1)

- Auftrag: S2-22 (Stufe 2, Runde 6, Spur A), Rolle Prüfer.
- Datum: 25.11.2026
- Geprüft: Behauptung `behauptungen/B-012.md`; Artefakt `lean/prosa/s2_444_spurA_r4.md` Abschnitt 2 (Bezeichnungen), Abschnitt 3 (Satz C) und Abschnitt 4 (Folgerung C1); Definitionen aus `lean/prosa/s2_444_spurA_r2.md` Abschnitt 2 und 5; Lean-Bestand `lean/YangBounds/SatzB444.lean` (Definition `IsSymm`, `avecs`), `lean/YangBounds/SatzB444Final.lean` (`satzB_symm_unbedingt`), `lean/YangBounds/YangN4Haupt.lean` (`SN1`, `SN2`, `fv`), `lean/YangBounds/Basic.lean` (`BilinearAlgorithm`).
- Nicht gelesen (Protokoll Abschnitt 4): frühere Prüfberichte, Prüfvermerke, `LOG.md`. Die Gegenproben `versuche/s2-16/klee*.py` habe ich nicht benutzt, sondern eigenen Code geschrieben.
- Fremdmodell: openai/gpt-6.2-sol, Denkstufe high, Batch über die Bridge. Auftrag wörtlich in `versuche/s2-22/gpt_auftrag.md`, Antwort in `versuche/s2-22/gpt_antwort.md`. Mein Urteil stand nicht im Auftrag.
- Status nach dieser Prüfung: **behauptet** (Prosa kann nach Protokoll 5.1 nicht geprüft werden).

---

## 1. Urteil

**Satz C hält.** Ich habe jeden Schritt nachgerechnet und keinen Fehler gefunden. Zwei kleine Präzisierungen (P1, P2 unten) ändern nichts am Beweis.

**Folgerung C1 hält mit benannter Reparatur R-C1.** Der Satz „Die zulässigen p bilden eine nichtleere offene Menge, in der der Fall (rk L, rk H) überall derselbe ist“ ist im Artefakt nicht begründet und folgt auch nicht aus dem Bestand. Richtig und ausreichend ist die generische Fassung:

> **C1 (repariert).** Hat ⟨4,2,4⟩ über einem Körper K eine Zerlegung der Länge 25, dann gibt es eine nichtleere Zariski-offene Menge zulässiger p ∈ K̄² (also eine dichte Menge), an denen die Normalform im Fall (5,8) liegt. An einzelnen zulässigen p kann der Fall (3,6) nicht ausgeschlossen werden.

Für das Gesamtziel (Rang 26) genügt das, denn der Rest der Spur A (Folgerung C2, Abschnitt 5 des Artefakts) arbeitet ohnehin an generischem p. Die Aussage „Eine Zerlegung der Länge 25 liegt im Fall (5,8)“ unter Folgerung C1 muss entsprechend „liegt für generisches p im Fall (5,8)“ heißen.

**Schwächere Symmetrie in Lean (μ_t = 0 erlaubt): Satz C gilt auch für sie, aber nur, wenn sie an allen p einer nichtleeren offenen Menge gilt.** Für `IsSymm` an einem einzelnen normierten Algorithmus (einer einzelnen Stelle p) zeigt der Beweis nichts, denn er leitet nach p ab. Zusammen mit `satzB_symm_unbedingt` schließt Satz C also (3,6) genau in der Fassung R-C1 aus: Liegt eine Zerlegung an allen zulässigen p im Fall (3,6), so liefert `satzB_symm_unbedingt` `IsSymm` an jedem davon, das ist Symmetrie auf einer offenen Menge, und Satz C gibt den Widerspruch.

## 2. Schritt für Schritt

Bezeichnungen wie im Artefakt: a_t(p) = A_t p, b_t(p) = B_tᵀ J p, J = [[0,−1],[1,0]], ω(p,p′) = pᵀ J p′.

### 2.1 Grundidentität (D) — hält

A = u pᵀ, B = v′ wᵀ: α_t(A) = Σ A_t[i,k] u_i p_k = uᵀ A_t p = a_t(p)·u; β_t(B) = v′ᵀ B_t w = (B_tᵀ v′)·w, mit v′ = J p′ also b_t(p′)·w; A·B = (pᵀ v′) u wᵀ = ω(p, p′) u wᵀ. Damit (D) für alle p, p′, u, w, direkt aus der Zerlegungsgleichung, ohne Annahmen. Auf p′ = p folgt Σ (a_t·u)(b_t·w) C_t = 0, also Ĵ_p ⊆ ker W.

### 2.2 Schritt 0 (rationale Wahl von M_p) — hält, Präzisierung P1

- Die Bedingung M b_t(p) ∈ K̄·a_t(p) ist für festes p linear in M (2×2-Minoren). Über K̄(s) mit p = (1, s) gibt es eine Kernbasis aus Polynommatrizen M_i(s). An allen s außer endlich vielen ist der Kern an der Stelle gleich span{M_i(s)} (Rang der Koeffizientenmatrix gleich dem generischen Rang, M_i(s) linear unabhängig). Eine offene Menge P aus der Voraussetzung ist über K̄ kofinit, also schneidet sie diese Menge; dort gibt es eine invertierbare Kombination. Das Polynom det(Σ c_i M_i(s)) in (c, s) ist daher nicht null, und weil K̄ unendlich ist, gibt es c ∈ K̄^k mit det ≢ 0 in s. Richtig.
- μ_t(p) = (M_p b_t(p))_i / a_t(p)_i ist wohldefiniert und unabhängig von i, weil M_p b_t(p) ∥ a_t(p) identisch in s gilt. A_t ≠ 0, also a_t(p) ≢ 0. μ_t ≢ 0, weil sonst M_p b_t(p) ≡ 0, mit det M_p ≢ 0 also b_t ≡ 0 und B_t = 0. Richtig.
- **P1 (Karte).** Das Artefakt schreibt p = (1, s), setzt aber später p′ = p + εd, das die Karte verlässt. Unschädlich: Die Bedingung ist homogen in p (a_t, b_t sind linear in p), man setzt M_p := M_{(1, p_1/p_0)}. Das ist eine rationale Funktion vom Grad 0 auf {p_0 ≠ 0}, und p_0 + εd_0 ist in K̄[ε]/(ε²) invertierbar. Eine Lean-Fassung sollte gleich homogen oder mit dem Funktionenkörper arbeiten (Abschnitt 4).
- **P2 (B-007 entbehrlich).** Der Beweis braucht B-007 nicht. Ist A_t = 0 oder B_t = 0, lässt man den Term weg. Die kürzere Zerlegung ist weiter symmetrisch, und Schritt 3 gilt für jede Länge r ≤ 25 (dim ker W = r − 16 ≤ 9). Satz C gilt also für alle Längen ≤ 25, ohne Bezug auf andere Behauptungen.

### 2.3 Schritt 1, (E1) und (E2) — hält

(S) an p′: b_t(p′)·w = μ_t(p′) a_t(p′)ᵀ H_{p′}ᵀ w. Mit w̃ = H_{p′}ᵀ w wird die rechte Seite von (D) ω u w̃ᵀ H_{p′}⁻¹. Das ist (E1).
(D) mit vertauschten Rollen: Σ (a_t(p′)·u′)(b_t(p)·w′) C_t = ω(p′,p) u′ w′ᵀ. Mit (S) an p und u := H_pᵀ w′, w̃ := u′ folgt Σ μ_t(p)(a_t(p)·u)(a_t(p′)·w̃) C_t = ω(p′,p) w̃ uᵀ H_p⁻¹ = −ω(p,p′) w̃ uᵀ H_p⁻¹. Das ist (E2). Vorzeichen und Transpositionen stimmen.

(E1), (E2) gelten auf einer offenen dichten Menge von (p, p′) ∈ K̄² × K̄². Nach Multiplikation mit den Nennern sind es Polynomidentitäten, also gelten sie in jeder K̄-Algebra, solange die Nenner dort invertierbar sind.

### 2.4 Schritt 2, Ableitung und (Kl) — hält

Differenz von (E1) und (E2), p′ = p + εd in K̄[ε]/(ε²): ω(p, p + εd) = ε ω(p, d), μ_t(p+εd) − μ_t(p) = ε δ_t, a_t(p+εd) = a_t(p) + ε A_t d, H_{p+εd}⁻¹ = M_p + O(ε). Der Koeffizient von ε ist (Kl):

  Σ_t δ_t (a_t(p)·u)(a_t(p)·w̃) C_t = ω(p, d)(u w̃ᵀ + w̃ uᵀ) M_p.

Das Einsetzen ist erlaubt, weil die Nenner an (p, p) invertierbar sind (nur der Wert bei ε = 0 zählt). Das gilt über jedem Körper, auch in Charakteristik 2; ein Grenzwert wird nicht gebraucht. Bemerkung: Der Widerspruch braucht δ_t ≠ 0 nicht; es zählt nur, dass die rechte Seite nicht verschwindet.

### 2.5 Schritt 3, Quadrik — hält

- dim ker W = 25 − 16 = 9, weil W surjektiv ist (die Matrizen A·B spannen K̄^{4×4}, also auch die C_t).
- dim Ĵ_p = dim span{a_t ⊗ b_t}: Ĵ_p ist das Bild von X ↦ (a_tᵀ X b_t)_t, sein Rang ist der Rang der Familie der Funktionale X ↦ a_tᵀ X b_t.
- a_t ⊗ b_t = μ_t (I ⊗ H_p)(a_t ⊗ a_t) mit μ_t(p) ≠ 0 für alle t (generisches p): gleicher Spann bis auf den Isomorphismus I ⊗ H_p. Also dim span{a_t ⊗ a_t} ≤ 9.
- span{x ⊗ x} hat in jeder Charakteristik Dimension 10 (e_i ⊗ e_i und e_i ⊗ e_j + e_j ⊗ e_i liegen darin, schon über 𝔽₂). Ein Funktional auf diesem Raum, das auf span{a_t ⊗ a_t} verschwindet und nicht null ist, setzt sich auf K̄^{16} fort; das ist Q.
- Entartete Lagen: Mehrfache oder kollineare Punkte a_t verkleinern nur span{a_t ⊗ a_t} und machen die Quadrik leichter. a_t(p) = 0 oder μ_t(p) = 0 tritt nur an endlich vielen p auf und wird durch die Wahl von p vermieden. Ich finde keine Lage, in der der Schritt versagt.

### 2.6 Schritt 4, Widerspruch — hält

Σ_{i,j} Q_ij · (Kl)(e_i, e_j): links Σ_t δ_t (a_tᵀ Q a_t) C_t = 0, rechts ω(p,d)(Q + Qᵀ) M_p. Also Q + Qᵀ = 0.
- Charakteristik ≠ 2: Q schief, xᵀ Q x ≡ 0, gegen die Wahl von Q.
- Charakteristik 2: Q symmetrisch, q(x) = Σ Q_ii x_i², nicht null, also ein Q_ii ≠ 0. K̄ ist vollkommen, q = ℓ² mit ℓ ≠ 0. ℓ(a_t(p)) = 0 für alle t; A = l pᵀ hat α_t(A) = 0 für alle t, also A·B = 0 für alle B; aber A·B = l (pᵀ B) ≠ 0 für B mit pᵀB ≠ 0. Richtig.
- Körper: Eine Zerlegung über K ist eine über K̄. Die Symmetrie ist in B-012 ohnehin über K̄ definiert. Kleine endliche Körper machen also keine Schwierigkeit; alle Generizitätsargumente laufen über K̄.

### 2.7 Symmetriebegriff Prosa gegen Lean

- Punktweise sind beide gleich. `IsSymm alg` sagt: Es gibt e ∈ GL_4 und μ_t mit β_t(emb(e y)) = μ_t (a_t·y), also eᵀ b_t = μ_t a_t. Das ist M b_t ∈ K·a_t mit M = eᵀ invertierbar, also genau die punktweise Bedingung aus B-012, die μ_t = 0 ebenfalls zulässt. Die Prosa-Fassung V1 aus S2-05 (μ_t ≠ 0) ist stärker, wird aber für Satz C nicht gebraucht: Ist e invertierbar, ist μ_t(p) = 0 gleichbedeutend mit b_t(p) = 0, und das passiert bei B_t ≠ 0 nur an einem Punkt von ℙ¹. Auf einer offenen Menge mit schwacher Symmetrie gilt also nach Verkleinern die starke.
- Der Unterschied liegt woanders: `IsSymm` ist eine Eigenschaft **eines** normierten Algorithmus, also einer Stelle p (in Lean p = e_0, v = e_1 über `emb`). Satz C braucht Symmetrie auf einer offenen Menge von p. Für die Brücke braucht man: (i) zu jeder Zerlegung und jedem zulässigen p einen normierten Algorithmus alg_p (Basiswechsel R3), (ii) `IsSymm alg_p` ⇔ es gibt M ∈ GL_4 mit M b_t(p) ∈ K̄·a_t(p) (Rechnung: Basiswechsel P auf der u-Seite, g ∈ GL_2 mit g e_0 ∝ p, R auf der w-Seite; M = P⁻ᵀ eᵀ R bis auf Skalar), (iii) die zulässigen p bilden eine nichtleere offene Menge, (iv) R-C1.

### 2.8 Folgerung C1 — Lücke, Reparatur R-C1

rk L = dim Ĵ_p − 4 hängt nur von p ab. dim Ĵ_p ist der Rang einer Matrix, deren Einträge Polynome in p sind, also nach unten halbstetig: {p : dim Ĵ_p ≥ 9} ist offen, {dim Ĵ_p ≤ 7} abgeschlossen. Nach Satz B (für jedes zulässige p) nimmt dim Ĵ_p auf der zulässigen Menge U nur die Werte 7 und 9 an. Daraus folgt nicht, dass der Wert konstant ist: Möglich ist generisch 9 und an endlich vielen zulässigen p der Wert 7. An solchen p liefert Satz B Symmetrie nur an einzelnen Punkten, und Satz C greift nicht.

Reparatur: Sei O := {p ∈ U : dim Ĵ_p = 9}, offen in U. Ist O leer, so liegt jedes p ∈ U im Fall (3,6), ist dort symmetrisch (B-009 bzw. `satzB_symm_unbedingt`), also symmetrisch auf der offenen Menge U, Widerspruch zu Satz C. Also ist O nicht leer und, da ℙ¹ irreduzibel ist, dicht. Das ist R-C1. Mehr gibt der Beweis nicht her, und mehr braucht das Gesamtziel nicht.

Belege, dass der Rang an Sonderstellen fällt (nur zur Illustration, an nicht zulässigen p): In den 14 symmetrischen Verfahren der Länge 26 über 𝔽₂ ist dim span{a_t ⊗ b_t} generisch 10, an den drei 𝔽₂-rationalen Stellen 3 oder 4 (`versuche/s2-22/kl_pruef_ausgabe.txt`; dort verschwindet jeweils ein a_t oder b_t). Ein zulässiges Beispiel mit Sprung bei Länge 25 kann es nur geben, wenn es eine Zerlegung der Länge 25 gibt; die Lücke ist eine des Arguments, kein gefundenes Gegenbeispiel.

### 2.9 Bemerkung C′ — verträglich

Der Beweis gibt für symmetrische Zerlegungen von ⟨n,2,n⟩: n(n+1)/2 ≤ dim span{a_t ⊗ a_t} ≤ r − n², also r ≥ (3n² + n)/2. n = 2: 7 (Strassen, symmetrisch, erreicht die Schranke). n = 3: 15, der bekannte Rang von ⟨3,2,3⟩. n = 4: 26. Kein Widerspruch zu bekannten Werten. Die Bemerkung ist nicht Teil von B-012 und hier nur auf Verträglichkeit geprüft.

## 3. Eigene Rechnungen

`versuche/s2-22/kl_pruef.py` (eigener Code, Python 3 ohne Zusatzpakete, exakt in GF(2⁶¹−1) und GF(2³¹) = GF(2)[x]/(x³¹+x³+1), Ableitung mit dualen Zahlen). Ausgabe `versuche/s2-22/kl_pruef_ausgabe.txt`. Aufruf aus `versuche/s2-22/`: `python3 kl_pruef.py`, Laufzeit unter 2 Sekunden.

Vorgehen je Verfahren: Brent-Gleichungen exakt prüfen; zufällige p, d; Lösungsraum für M an p; zufällige invertierbare Kombination M_0; erste Ordnung M_1 aus L(p) M_1 = −L′(p; d) M_0; μ_t in dualen Zahlen, Proportionalität M b_t ∥ a_t bis zur ersten Ordnung geprüft; (Kl) für alle (i, j) und alle Einträge; Gleichung nullter Ordnung; dim span{a_t ⊗ a_t} und dim span{a_t ⊗ b_t}.

| Verfahren | Körper | Lösungsraum | (Kl) | 0. Ordnung | dim a⊗a | dim a⊗b |
|---|---|---|---|---|---|---|
| Strassen ⟨2,2,2⟩, 3 zufällige p | GF(2⁶¹−1) | 1 | gilt | gilt | 3 | 3 |
| Strassen, 3 zufällige p | GF(2³¹) | 1 | gilt | gilt | 3 | 3 |
| 14 Verfahren Länge 26, ρ = 3 (`rho3_rang26_f2.txt`) | GF(2³¹) | je 1 | gilt in allen 14 | gilt | 10 | 10 |
| `verfahren/4x2x4-r26-s001.json` | GF(2⁶¹−1), GF(2³¹) | 0 (nicht symmetrisch) | entfällt | entfällt | – | – |

In allen 14 Verfahren der Länge 26 sind 19 der 26 Ableitungen δ_t ungleich null, die Ableitung trägt also. Die Vorzeichen prüft die Rechnung in GF(2⁶¹−1). Ein erster Lauf meines Programms meldete dort „(Kl) falsch“; Ursache war mein eigener Vorzeichenfehler bei ω (p₀d₁ − p₁d₀ statt pᵀJd = p₁d₀ − p₀d₁). Mit der Definition des Artefakts gilt (Kl) exakt. Die Daten für ⟨4,2,4⟩ im Charakteristik-0-Fall fehlen: Das einzige ganzzahlige Verfahren im Repo ist nicht symmetrisch.

Gegenbeispielsuche: Bei Länge 26 verlangt Satz C (über C′) dim span{a_t ⊗ a_t} = 10 für jedes symmetrische Verfahren; alle 14 erfüllen das. Ein symmetrisches Verfahren kürzerer Länge, an dem der Beweis versagen würde, ist mir nicht bekannt und wäre selbst ein Verfahren mit 25 Termen.

## 4. Was eine Lean-Fassung braucht

1. **Satz C selbst, punktweise Algebra.** Aus (Kl) an einer Stelle und der Quadrik den Widerspruch ziehen: reine lineare Algebra, mittelschwer. Die Dimension 10 von span{x ⊗ x} und die Existenz von Q sind Rang-Rechnungen. In Charakteristik 2 braucht der Schluss q = ℓ² Quadratwurzeln der Q_ii, also einen vollkommenen oder algebraisch abgeschlossenen Körper (`PerfectField`, `IsAlgClosed`).
2. **Die Ableitung (am schwersten).** Man braucht μ_t und M_p als rationale Funktionen in p und ihre Ableitung. Vorschlag: nicht über offene Mengen reden, sondern die Zerlegung auf den Funktionenkörper L = K̄(s) heben, p = (1, s) als L-Punkt nehmen und mit der K̄-Derivation d/ds auf L arbeiten (`Polynomial.derivative`, `RatFunc`, `Derivation`). Dann ist (S) eine Gleichung über L, und (Kl) entsteht, wenn man (S) nach s ableitet (Produktregel statt dualer Zahlen) und in (D) mit p und p′ = d = (0, 1) einsetzt, einmal in jeder Reihenfolge. Dafür muss die Symmetrie **am generischen Punkt über L** vorliegen.
3. **Brücke zu Satz B.** `satzB_symm_unbedingt` über dem Körper L am Punkt p = (1, s) anwenden. Dazu: Normalform über L (Basiswechsel, Lemma `IsSymm` ⇔ M b_t ∥ a_t), SN1 und SN2 am generischen Punkt über L und rk L = 3 am generischen Punkt. SN2 am generischen Punkt folgt, wenn SN2 an einem K̄-Punkt gilt (der Fehlerort ist abgeschlossen), muss aber bewiesen werden; das ist der zweitschwerste Teil, weil SN2 über alle v ≠ 0 quantifiziert.
4. **R-C1 in Lean.** Am generischen Punkt ist rk L der generische Wert. Mit 2 und 3 lautet der Satz dann: „Am generischen Punkt ist der Fall nicht (3,6)“. Das ist genau R-C1 und genügt für den weiteren Weg, wenn die Behandlung von (5,8) ebenfalls am generischen Punkt formalisiert wird.

Alternative ohne Funktionenkörper: duale Zahlen K̄[ε]/(ε²) als Ring, aber dann ist `satzB_symm_unbedingt` (verlangt einen Körper) nicht direkt anwendbar. Ich halte den Weg über L = K̄(s) für den kürzeren.

## 5. Grenzen dieser Prüfung

Status bleibt **behauptet**. Geprüft im Sinn von 5.1 wird Satz C erst mit einem Lean-Satz, grünem Actions-Lauf und Aussagen-Abgleich. B-008 und B-009, auf denen C1 aufbaut, habe ich nicht erneut geprüft; ich habe nur die Lean-Aussage `satzB_symm_unbedingt` und die Definition `IsSymm` gelesen.

## 6. Fremdmodell

openai/gpt-6.2-sol, Denkstufe high, Batch (Kennung openrouter:batch-1795619613-OLOC8jmZ6SEJ8YbQUBfF, 2 Minuten, 0,06 US-$). Auftrag `versuche/s2-22/gpt_auftrag.md`, Antwort `versuche/s2-22/gpt_antwort.md`. Gesendet wurden B-012, Kopf und Abschnitte 1 bis 4 des Artefakts, Abschnitte 2 und 5 von S2-05 und die Lean-Definitionen und -Aussagen, jeweils wörtlich. Die Abschnitte 5 bis 11 des Artefakts (Fall (5,8)) fehlten, weil sie nicht zu B-012 gehören.

**Urteil des Fremdmodells: Satz C hält; C1 hält mit generischer Reparatur.** Punkte 1 bis 5 (Schritte 0 bis 4): JA. Punkt 6 (Symmetriebegriff): TEILWEISE, mit derselben Abgrenzung wie hier (punktweise gleich, μ_t = 0 unschädlich, entscheidend ist der Quantor über p; ein einzelner `IsSymm`-Zeuge genügt nicht). Punkt 7 (C1): NEIN in der wörtlichen Fassung, JA generisch, mit derselben Reparatur wie R-C1.

Übereinstimmung und Ergänzungen gegenüber meiner Prüfung:
- Beide Urteile stimmen überein, unabhängig erhoben (der Auftrag enthielt mein Urteil nicht).
- Ergänzung E1: Die Minorenbedingung ist bei a_t = 0 nicht gleichwertig zu M b_t ∈ K·a_t. Unschädlich, weil man auf a_t, b_t ≠ 0 einschränkt.
- Ergänzung E2: Der Charakteristik-2-Schritt geht ohne Quadratwurzeln. Das Argument mit A = l pᵀ zeigt, dass die a_t(p) den K⁴ aufspannen; dann folgt aus Σ_i Q_ii a_{t,i}² = 0 für alle t, dass die additive Form x ↦ Σ Q_ii x_i² auf dem Spann verschwindet. Das ist für Lean bequemer als `IsAlgClosed`.
- Ergänzung E3: Für R-C1 ist der Fall eine Eigenschaft des Paars (p, u_0), nicht nur von p (rk H könnte von u_0 abhängen). Die Reparatur läuft dann über die offene Menge der Paare. Nach Satz B ist das gleichwertig zu meiner Fassung, weil dort (3,6) genau rk L = 3 heißt und rk L nur von p abhängt; die Fassung über Paare braucht diese Zusatzüberlegung nicht.
- Ergänzung E4: Gegenbeispiel zum Übergang „Symmetrie an einer Stelle ⇒ Symmetrie auf einer offenen Menge“ an einer echten Zerlegung: Strassen mit einem aufgespaltenen Term (Länge 8) ist an s = 1 symmetrisch, generisch nicht. Das bestätigt, dass Satz C einen einzelnen `IsSymm`-Zeugen nicht ausschließt.
- Vorschlag für Lean: ein Kernlemma „Symmetrie mit Hebung über duale Zahlen an einer nichtentarteten Stelle erzwingt Länge ≥ 26“, getrennt von „offene Symmetrie liefert die Hebung“ und „generisches (3,6) liefert nach Satz B die Symmetrie“. Schwerste Teile laut Fremdmodell: rationale Kernbasis mit Spezialisierung, Skalarerweiterung und der Wechsel der Normalisierung mit dem Quotienten nach J(p, u_0). Das deckt sich mit Abschnitt 4.
