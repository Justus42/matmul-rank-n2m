# S2-43: Aussagen-Abgleich der Lean-Sätze zu B-012 und B-013 (Satz E)

Rolle: Prüfer. Prüfgegenstand: PROTOKOLL.md Abschnitt 5.1 Punkt 3 (Aussagen-Abgleich), dazu die Punkte 1 und 2 anhand des Protokolls von Actions-Job 139430765012 (Lauf 45678041278). Stand des Repos: `main` bei Commit `e1f0aa5` (25.11.2026, 18:51 UTC). Kein Fremdmodell angefragt. Dieser Bericht setzt keinen Status.

---

## 0. Offenlegung

### 0.1 Eingeblendete Gedächtniseinträge

Beim Start eingeblendet (vor dem ersten Dateizugriff an den Orchestrator gemeldet):

- `MEMORY.md` (Index): Projektrahmen, Rechte und Grenzen des Orchestrators, Anweisungen von Justus vom 25.11.2026, Rundenregeln, Fremdmodell-Hinweise. Er verweist auf `verfahren-datenformat` und `lean-project-ci`, deren Inhalt mir nicht eingeblendet wurde. Er enthält keine Aussage zu B-012 oder B-013.

Während der Arbeit (nach der ersten Meldung) wurden zusätzlich drei Einträge eingeblendet:

- `aussagen-abgleich-n3`: Praxis-Hinweise aus S1-18 (PR #32, `behauptungen/B-006.md`): Bridge kann das Repo nicht lesen, lokaler Lean-Bau, veraltete „(open)“-Kommentare.
- `abgleich-yang-n4-b007`: Praxis-Hinweise aus S1-19 (PR #30, `behauptungen/B-007.md`): Bridge, Lean-Werkzeugkette in der Cloud.
- `git-regeln`: Git-Regeln seit Protokoll 0.2.

Keiner dieser Einträge enthält ein Urteil, einen Status oder einen Befund zu B-012 oder B-013. Die beiden ersten nennen frühere Aussagen-Abgleiche zu anderen Behauptungen (Hinweis auf andere Prüfer), ohne deren Ergebnis.

`CLAUDE.md` wurde automatisch eingeblendet (steht auf der Positivliste).

### 0.2 Erweiterung der Positivliste

Auf meine Rückfrage hat der Orchestrator die Liste um `lean/YangBounds/YangN3.lean`, `YangN3Teil1.lean`, `YangN3Teil2.lean` und `YangN3Teil3.lean` erweitert, zum Zurückverfolgen der Definitionen. Gelesen habe ich daraus nur:

- `YangN3Teil1.lean` Zeilen 50 bis 129 (`extendForm`, `BilinearAlgorithm.baseChange`),
- `YangN3Teil2.lean` Zeilen 168 bis 177 (`outer`, `basisVec`) und 236 bis 285 (`changeBasis`, Beginn von `removeZeroAlpha`),
- `YangN3Teil3.lean` Zeilen 110 bis 121 (`emb`),
- dazu eine Suche nach den Definitionsnamen in diesen Dateien (nur Trefferzeilen). `YangN3.lean` habe ich nicht geöffnet.

### 0.3 Gelesenes außerhalb der Liste oder über sie hinaus

- `ls /home/user` und `git log -1` auf `origin/main` (nur Hash und Zeit des obersten Commits), um den Prüfstand festzuhalten.
- Die Überschriften aller Abschnitte von `PROTOKOLL.md` (`grep '^## '`), um Abschnitt 5 zu finden.
- Die Überschriften aller Abschnitte von `lean/prosa/s2_444_spurA_r4.md` (`grep '^#'`), um die Abschnitte zu finden. Damit sah ich auch die Titel von §1, §5.3 bis §11, darunter Statuswörter in Titeln (siehe 0.4). Den Text dieser Abschnitte habe ich nicht gelesen. Die Einleitung von §5 (Zeilen 135 bis 138) habe ich übersprungen.
- Zwei Suchbefehle über das ganze Verzeichnis `lean/YangBounds/` wurden von der Umgebung abgelehnt, bevor sie etwas ausgaben.
- Das Job-Protokoll wurde vollständig in eine Datei im Arbeitsverzeichnis geladen (703 Zeilen). Angesehen habe ich nur die Zeilen, die mit `SORRY` beginnen, und die Axiom-Zeilen zu den Sätzen des Auftrags.

### 0.4 Gesehene Statuswörter und Hinweise auf andere Leser

- Prosa §2: „B-007 (geprüft)“. §3: „Status behauptet“, „Bemerkung C′ (allgemeines n, behauptet)“, „Kritische Stellen für einen Prüfer“. §4: „Folgerung C1 (…, behauptet)“, „Folgerung C2 (…, behauptet)“. Überschriften: §5.3 „(behauptet)“, §5.4 „(vermutet)“, §5.5 „(behauptet, exakt gerechnet)“, §8.2 „(behauptet)“, §9 „Statusübersicht“, §10 „(vermutet)“.
- Lean-Modulkommentare: in `Basic.lean`, `SatzB444.lean`, `SatzC444Kern.lean`, `SatzC444Generisch.lean`, `SatzE444.lean` und `SatzE444Buendel.lean` jeweils „Status of every statement …: `behauptet`“. In `SatzB444.lean` zusätzlich: „the statement check, 5.1 item 3, is still open“. In `SatzE444Buendel.lean`: „see the report for what is missing“. In `Axioms.lean`: „Since S1-17 no proof is open“.
- Der Auftrag selbst nennt die Frage „offen“.
- Ein früheres Prüfurteil zu B-012 oder B-013 habe ich nicht gesehen.

---

## 1. Grundlage: Definitionen bis Mathlib

- `BilinearAlgorithm K 4 2 4 r` (Basic.lean): `alpha t` ist eine K-lineare Form auf `Matrix (Fin 4) (Fin 2) K`, `beta t` eine auf `Matrix (Fin 2) (Fin 4) K`, `coeff t : Matrix (Fin 4) (Fin 4) K`, und `A * B = ∑ t (alpha t A * beta t B) • coeff t` für alle A, B mit dem Mathlib-Matrixprodukt. Das ist das Format der Prosa §2 (A_t ∈ K^{4×2}, B_t ∈ K^{2×4}). Der Körper ist ein beliebiges `Field K`.
- `outer u p = Matrix.of (fun i j => u i * p j)`, also u pᵀ. `basisVec i` ist e_i. `unitMatrix i j` ist e_{ij}. `emb y = Matrix.of ![0, y]`, also die 2×4-Matrix (0; y) = e_1 yᵀ.
- `changeBasis alg S T` (R3): α′_t(A) = α_t(S A T), β′_t(B) = β_t(T⁻¹ B), C′_t = S⁻¹ C_t. `baseChange L`: Fortsetzung der Formen über ihre Koeffizienten auf e_{ij}, C_t eintragsweise abgebildet.
- `avecs alg t i = α_t(e_{i0})` (SatzB444.lean), also der Vektor a_t mit (a_t·y) = α_t(y e_0ᵀ).
- `SN1 alg`: α_t(e_{00}) ≠ 0 für alle t, also (N1) mit u_0 = e_0 und p = e_0. `SN2 alg`: für jedes v ≠ 0 in K^{2×4} sind die vier Vektoren (α_t(e_{i0}) β_t(v))_t, i = 0..3, linear unabhängig (N2).
- φ_i(y) = (α_t(e_{i0}) β_t(emb y))_t, J = Bild von φ_0, π die Quotientenabbildung nach K^r/J, `Fq i = π ∘ φ_{i+1}` (i = 0,1,2 entspricht F_1, F_2, F_3), `Lq = ∑ F_i ∘ proj_i`, `Hq = skewExt Lq` auf den alternierenden 3×3-Matrizen mit Diagonale 0. rk L, rk H sind `finrank` der Bilder.
- `IsSymm alg` (SatzB444.lean): es gibt einen linearen Automorphismus e von K⁴ und Skalare μ_t mit β_t(emb(e y)) = μ_t (a_t·y) für alle t, y. μ_t = 0 ist erlaubt.
- `GField K` = `FractionRing (MvPolynomial (Var 3) K)`: der Körper der rationalen Funktionen über K in den 16 Einträgen einer 4×4-Matrix S und den 4 Einträgen einer 2×2-Matrix T. `Sg`, `Tg` sind diese generischen Matrizen, `genAlg alg = changeBasis (alg.baseChange (GField K)) Sg Tg`.

**Umrechnung in die Prosa-Bezeichnungen (selbst nachgerechnet).** Für `genAlg alg` gilt a′_t·y = α_t((S y) pᵀ) mit p = (T₀₀, T₀₁), also a′_t = Sᵀ a_t(p) mit a_t(p) = A_t p. Ferner β′_t(emb z) = β_t(v zᵀ) mit v = T⁻¹e_1 = (det T)⁻¹ (−T₀₁, T₀₀) = (det T)⁻¹ J p, also β′_t(emb z) = (det T)⁻¹ (b_t(p)·z) mit b_t(p) = B_tᵀ J p. Damit ist `IsSymm (genAlg alg)` gleichwertig mit: es gibt eine invertierbare 4×4-Matrix M über K(S,T) (nämlich M = S⁻ᵀ Eᵀ, E die Matrix von e) mit M b_t(p) ∈ K(S,T)·a_t(p) für alle t, am generischen Punkt p. Indizes, Transposition und Vorzeichen stimmen.

---

## 2. B-012

### 2.1 Die Lean-Aussagen

- `satzC_kern` (Hilfssatz): Körper F mit Derivation D (additiv, Leibniz), Zerlegung der Länge r ≤ 25 mit D-konstanten Koeffizienten, p, v ∈ F² mit p·v = 0 und (Dp)·v ≠ 0, Symmetrie an der Stelle (p, v) mit einem injektiven E und Skalaren μ_t (μ_t = 0 erlaubt, Zusatzbedingung `hb` für solche t) ⇒ `False`. Die Voraussetzungen sind erfüllbar, denn `satzC_generisch` erfüllt sie. Allein sagt `satzC_kern` nichts über eine eingegebene Zerlegung über K. Er ist das Werkzeug für den nächsten Satz.
- `satzC_generisch`: für jeden Körper K, jedes r ≤ 25 und jede Zerlegung `alg` von ⟨4,2,4⟩ der Länge r über K gilt `¬ IsSymm (genAlg alg)`. Keine weiteren Voraussetzungen, nicht leer wahr.
- `folgerungC1_generisch`: für jede Zerlegung der Länge 25 über jedem Körper gilt für `genAlg alg`: SN1, SN2, (rk L, rk H) = (5, 8) (über `GField K`) und `¬ IsSymm`.
- `folgerungC1_nicht36`: (rk L, rk H) von `genAlg alg` ist ≠ (3, 6).

### 2.2 Abgleich Teil für Teil

| Teil von B-012 | Lean | Urteil |
|---|---|---|
| Format ⟨4,2,4⟩, Länge 25, beliebiger Körper K | `BilinearAlgorithm K 4 2 4 r`, `[Field K]`, r ≤ 25 bzw. r = 25 | gedeckt (r ≤ 25 ist allgemeiner) |
| a_t(p) = A_t p, b_t(p) = B_tᵀ J p, J = [[0,−1],[1,0]] | über `genAlg`: a′_t = Sᵀ a_t(p), β′_t(emb ·) = (det T)⁻¹ b_t(p)·, siehe Abschnitt 1 | gedeckt |
| Symmetrie als M b_t(p) ∈ K̄·a_t(p), M invertierbar | `IsSymm` am generischen Punkt, M über K(S,T), μ_t = 0 erlaubt | gleichwertig pro Punkt |
| **Satz C**: keine Zerlegung ist symmetrisch im Sinn „nichtleere Zariski-offene Menge von p ∈ K̄² und zu jedem p ein M_p ∈ GL_4(K̄)“ | `satzC_generisch`: keine Symmetrie **am generischen Punkt**, mit M über dem Funktionenkörper K(S,T) | **schwächer**. Symmetrie am generischen Punkt impliziert Symmetrie auf einer offenen Menge (Spezialisieren), also folgt aus B-012s Satz C der Lean-Satz, nicht umgekehrt. Der Schritt „Symmetrie auf offener Menge ⇒ Symmetrie am generischen Punkt“ (Prosa §3.1 Schritt 0, mit Abstieg von K̄ nach K) ist nicht formalisiert. Das räumt `SatzC444Generisch.lean` selbst als Abweichung 1 ein. |
| **Folgerung C1**: Länge 25 ⇒ nicht im Fall (3,6), es bleibt (5,8), dort nicht symmetrisch | `folgerungC1_generisch`, `folgerungC1_nicht36`: am generischen Punkt (5,8), SN1, SN2, nicht `IsSymm` | gedeckt **nur am generischen Punkt** über K(S,T) |
| **R-C1**: es gibt eine nichtleere Zariski-offene Menge zulässiger p ∈ K̄², an denen die Normalform im Fall (5,8) liegt | wie oben | **schwächer / nicht formalisiert**: Der Übergang vom generischen Punkt über K(S,T) zu einer offenen Menge von K̄-Punkten (Halbstetigkeit der Ränge, Offenheit von (N1), (N2)) steht in keinem der Sätze. Über einzelne Normalformen über K̄ sagt Lean in diesen Sätzen nichts. |
| „zusammen mit B-008 und B-009“ | `folgerungC1_generisch` benutzt `satzB_unbedingt`, `satzB_symm_unbedingt` und `yang_theorem_two_algorithm` als bewiesene Sätze, nicht als Voraussetzungen | gedeckt, ohne Hypothesen |

**Körperannahmen.** `satzC_generisch` gilt über jedem Körper, ohne algebraischen Abschluss. Der Rang über K(S,T) ist derselbe wie über dessen algebraischem Abschluss (lineare Algebra), deshalb verfälscht das Fehlen von K̄ die Ränge nicht. Das Problem ist allein der Übergang vom generischen Punkt zu Punkten.

**Leere Wahrheit.** Keine der Voraussetzungen ist offensichtlich unerfüllbar. `IsSymm` ist keine von vornherein falsche Eigenschaft, denn mit μ_t = 0 bleibt die Bedingung eine echte Gleichung, und e ist ein beliebiger Automorphismus. Dass es (nach B-007) keine Zerlegung mit r < 25 gibt, macht den Fall r < 25 leer, aber nicht r = 25.

### 2.3 Urteil B-012

Der Lean-Code deckt B-012 **teilweise**. Gedeckt sind Satz C und Folgerung C1 in der Fassung „am generischen Punkt“: Für jede Zerlegung der Länge 25 über jedem Körper ist die generische Normalform über K(S,T) zulässig, im Fall (5,8) und nicht symmetrisch. Schwächer als B-012 ist Satz C selbst: B-012 schließt Symmetrie auf einer offenen Menge von K̄-Punkten aus, Lean nur die Symmetrie mit rationalen Funktionen. Ebenfalls schwächer bzw. nicht formalisiert ist R-C1: die nichtleere Zariski-offene Menge von p ∈ K̄² kommt in Lean nicht vor. Der Satz `satzC_kern` trifft keine Aussage über die eingegebene Zerlegung, ist aber auch nicht als solche gemeint.

---

## 3. B-013, nur Satz E

### 3.1 Die Lean-Aussagen

- `UnterfallA alg`: es gibt einen Unterraum K* ⊆ K⁴ mit dim K* = 2 und ein q ∈ K^r/J mit F_i(x) ∈ K·q für i = 1, 2, 3 und alle x ∈ K*.
- `rkL_le_four_of_unterfallA`: K algebraisch abgeschlossen, beliebige Länge r, SN1, SN2, `UnterfallA` ⇒ rk L ≤ 4.
- `satzE_of_rkL`: K algebraisch abgeschlossen, Länge 25, SN1, SN2, rk L = 5 ⇒ `¬ UnterfallA`.
- `satzE`: K algebraisch abgeschlossen, Länge 25, SN1, SN2, (rk L, rk H) = (5, 8) ⇒ `¬ UnterfallA`.
- `satzE_global`: für jeden Körper K und jede Zerlegung der Länge 25 über K **gibt es** eine Zerlegung alg′ der Länge 25 über `AlgebraicClosure K` mit SN1, SN2 und ((rk L, rk H) = (5, 8) ⇒ ¬ UnterfallA alg′).
- `UnterfallAVoll` (SatzE444Buendel.lean): dim K*_Lean = 2 mit K*_Lean = Summe der Kerne von F_γ über alle γ mit rk F_γ = 3, ein γ* ≠ 0 mit F_{γ*}(K*) = 0, ein q ≠ 0 mit F_i(K*) ⊆ K·q. `unterfallA_of_voll`: `UnterfallAVoll ⇒ UnterfallA`.
- `commonKernel_trivial`: SN1, SN2, `NichtSymmetrisch` (= ¬ IsSymm an dieser Normalform), x mit F_i(x) = 0 für alle i ⇒ x = 0.
- `sDim_eq_one`: Länge 25, SN1, SN2, kein gemeinsamer Kernvektor, γ mit rk F_γ = 3 ⇒ s(γ) = dim ∑_i F_i(ker F_γ) = 1. Gilt über jedem Körper.

### 3.2 Ist das Lean-Prädikat für Unterfall A schwächer oder stärker als die Prosa?

**Das Prädikat ist schwächer (umfasst mehr), der Ausschluss ist damit stärker.** Unterfall A der Prosa (§5.1, B-013): dim K* = 2 für K* = span{k(γ)}, q ∈ Q, q ≠ 0, F_γ(K*) ⊆ K·q für alle γ, dazu γ* mit F_{γ*}(K*) = 0. Daraus folgt `UnterfallA`: man nimmt den Prosa-Raum K* und dasselbe q. „Für alle γ“ ist wegen F_γ = ∑ γ_i F_i dasselbe wie „für i = 1, 2, 3“. `UnterfallA` verlangt dagegen nicht, dass K* aus Kernvektoren besteht, verlangt kein γ*, erlaubt q = 0 und verlangt nicht q ∈ Q = ker W/J. Jede Lockerung macht die Menge der ausgeschlossenen Lagen größer. Die Implikation von der Prosa-Fassung zu `UnterfallA` hängt nicht an der Definition `Kstern` und gilt deshalb unabhängig davon, ob `Kstern` (Summe über alle Maximierer) genau dem Prosa-K* (Spann über generische γ) entspricht. `UnterfallAVoll` liegt zwischen beiden und wird von `unterfallA_of_voll` in `UnterfallA` überführt.

### 3.3 Welche Voraussetzungen braucht `satzE` wirklich?

- Algebraisch abgeschlossener Körper (für die Nullstelle im Kettenargument), wie die Prosa (K = K̄).
- SN1 und SN2 an der gegebenen Normalform, also ein zulässiges Paar (p, u_0).
- Länge 25 und rk L = 5 (`satzE_of_rkL`). Die Annahme rk H = 8 in `satzE` wird nur über rk L = 5 benutzt.
- **Nicht** gebraucht: fehlende Symmetrie, generisches u_0, eine offene Menge von p, s = 1, Lemma P, die Bedingungen R1 (b_t ≠ 0) und q ≠ 0. Die Prosa sagt „im Fall (5,8) ohne Symmetrie“ und „für jedes zulässige generische u_0“. Lean gilt für jede zulässige Normalform im Fall (5,8), symmetrisch oder nicht, generisch oder nicht. Das ist stärker.

Die Voraussetzungen von `satzE` sind nicht offensichtlich widersprüchlich. Ob es überhaupt eine Zerlegung der Länge 25 mit SN1, SN2 und rk L = 5 gibt, ist genau die offene Frage des Projekts. Dass der Satz im Fall ihrer Nichtexistenz leer wäre, liegt in der Natur eines Ausschlusssatzes und ist kein Formalisierungsfehler.

### 3.4 Was sagt `satzE_global` über eine eingegebene Zerlegung?

**Nichts Bestimmtes.** Die Aussage ist ein Existenzsatz: Aus „es gibt eine Zerlegung der Länge 25 über K“ folgt „es gibt irgendeine Zerlegung alg′ der Länge 25 über K̄ mit SN1, SN2 und (Fall (5,8) ⇒ ¬ UnterfallA)“. Die Aussage verbindet alg′ nicht mit alg. Dass alg′ eine Normalform von alg ist (Basiswechsel nach Körpererweiterung), steht nur im Beweis (`satzA_exists` über `exists_normalized`), nicht in der Aussage. Für ein bestimmtes zulässiges p oder u_0 von alg sagt `satzE_global` nichts. Der zweite Teil (die Implikation) ist ohnehin eine Instanz von `satzE`.

Die Aussage über die eingegebene Zerlegung liefert dagegen `satzE` selbst: Jede konkrete Normalform `changeBasis (alg.baseChange K̄) S T` mit invertierbaren S, T, die SN1 und SN2 erfüllt und im Fall (5,8) liegt, ist eine `BilinearAlgorithm K̄ 4 2 4 25` und fällt unter `satzE`. Wer B-013 für eine eingegebene Zerlegung an allen zulässigen Punkten einer offenen Menge braucht, muss sich auf `satzE` stützen, nicht auf `satzE_global`.

### 3.5 Abgleich Teil für Teil (Satz E)

| Teil von B-013 (Satz E und unmittelbare Voraussetzungen) | Lean | Urteil |
|---|---|---|
| Zerlegung von ⟨4,2,4⟩ der Länge 25, Normalform über K̄ an zulässigem (p, u_0) | `BilinearAlgorithm K 4 2 4 25`, `[IsAlgClosed K]`, SN1, SN2 | gedeckt |
| Fall (rk L, rk H) = (5,8) | `hcase` in `satzE`, nur rk L = 5 benutzt | gedeckt (Lean stärker: rk L = 5 genügt) |
| „nicht symmetrisch“ | nicht vorausgesetzt | Lean stärker |
| p aus offener Menge, u_0 generisch | jede zulässige Normalform | Lean stärker |
| Unterfall A (Prosa §5.1) | `UnterfallA` (schwächer als die Prosa-Fassung, siehe 3.2) | Ausschluss in Lean stärker |
| „Unterfall A tritt nicht auf“ | `satzE`, `satzE_of_rkL`, `rkL_le_four_of_unterfallA` | gedeckt |
| N(u_0) = 0 ohne Symmetrie (C2, Voraussetzung von Lemma P) | `commonKernel_trivial`, mit ¬IsSymm **an derselben Normalform** | gedeckt pro Normalform. Dass Nichtsymmetrie an Punkten einer offenen Menge gilt (Prosa C2 über Chevalley), ist nicht formalisiert. `satzC_generisch` liefert ¬IsSymm nur an `genAlg` über K(S,T), und dieser Körper ist nicht algebraisch abgeschlossen, also ist `satzE` dort nicht direkt anwendbar. |
| s = 1 | `sDim_eq_one`, über jedem Körper, für jedes γ mit rk F_γ = 3, ohne Annahme (5,8) | gedeckt, in den Voraussetzungen allgemeiner. Die Definition von s stammt aus Dateien außerhalb meiner Liste (Prosa `yang_n4.md`, S2-09). Ich habe sie nur gegen die Verwendung in §5.1 geprüft („s = 0 hieße k(γ) ∈ N“), und das passt. |
| `satzE_global` als Aussage über die eingegebene Zerlegung | reiner Existenzsatz, siehe 3.4 | sagt nichts über die eingegebene Zerlegung |

### 3.6 Urteil B-013, Satz E

Der Satz-E-Teil von B-013 ist **von Lean gedeckt, und zwar in stärkerer Form**, durch `satzE` (bzw. `satzE_of_rkL` und `rkL_le_four_of_unterfallA`). Gezeigt ist: An jeder zulässigen Normalform einer Zerlegung der Länge 25 über einem algebraisch abgeschlossenen Körper mit rk L = 5 liegt nicht einmal die abgeschwächte Lage `UnterfallA` vor. Das Prädikat ist schwächer als Unterfall A der Prosa, der Ausschluss also stärker. Symmetrie, Generizität und s = 1 werden nicht gebraucht. `satzE_global` trägt zur Aussage über eine eingegebene Zerlegung nichts bei: Es behauptet nur die Existenz irgendeiner Normalform über K̄, ohne sie an die Eingabe zu binden. Nicht formalisiert ist der Übergang „für p aus einer nichtleeren offenen Menge“, der in B-013 mit der Nichtsymmetrie aus B-012 verknüpft ist. Für Satz E selbst ist er unnötig, weil `satzE` für jede zulässige Normalform gilt. `commonKernel_trivial` und `sDim_eq_one` sind pro Normalform gedeckt und brauchen die Nichtsymmetrie an genau dieser Normalform als Voraussetzung.

---

## 4. Build: sorry und Axiome (Job 139430765012)

Aus dem Job-Protokoll, nur die Zeilen, die mit `SORRY` beginnen, und die Axiom-Zeilen:

- `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
- `SORRY: 0 'sorry' token(s) in the sources outside comments`
- `[propext, Classical.choice, Quot.sound]` für: `SatzC444.satzC_kern`, `SatzC444.satzC_generisch`, `SatzC444.folgerungC1_generisch`, `SatzC444.folgerungC1_nicht36`, `SatzE444.rkL_le_four_of_unterfallA`, `SatzE444.satzE`, `SatzE444.satzE_global`, `SatzE444Buendel.sDim_eq_one`, `SatzE444Buendel.commonKernel_trivial`. Die Zeilennummern im Protokoll (`SatzC444Generisch.lean:643–648`, `SatzE444.lean:650–652`, `SatzE444Buendel.lean:208–209`) stimmen mit den `#print axioms`-Zeilen der Dateien auf dem geprüften Stand überein.
- **Für `SatzE444.satzE_of_rkL` gibt es keine eigene Axiom-Zeile** (keine Datei druckt sie). Der Beweis von `satzE` ist `satzE_of_rkL alg h1 h2 _`. Die Axiome von `satzE` umfassen deshalb die von `satzE_of_rkL`, und ein `sorryAx` darin müsste in `satzE` erscheinen. Zusammen mit „0 declaration(s) with sorry“ ist `satzE_of_rkL` damit mittelbar belegt, aber nicht durch eine eigene Zeile.
- Nicht geprüft: ob der Job insgesamt grün endete und welcher Commit gebaut wurde. Diese Teile des Protokolls lagen außerhalb meines Auftrags. Belegt sind nur die Zeilennummern, und die passen zum Stand `e1f0aa5`.

---

## 5. Zusammenfassung

1. **B-012:** teilweise gedeckt. Lean beweist Satz C und Folgerung C1 am generischen Punkt (Funktionenkörper K(S,T)). Schwächer als B-012 sind die Fassung „symmetrisch auf einer offenen Menge von K̄-Punkten“ (Satz C, es fehlt Prosa-Schritt 0) und R-C1 (die offene Menge von p ∈ K̄² ist nicht formalisiert).
2. **B-013, Satz E:** gedeckt, in stärkerer Form durch `satzE`: schwächeres Prädikat `UnterfallA`, keine Annahme zu Symmetrie oder Generizität, rk L = 5 genügt. `satzE_global` sagt nichts über die eingegebene Zerlegung.
3. **Build:** 0 sorry. Alle geprüften Sätze verwenden nur propext, Classical.choice und Quot.sound. `satzE_of_rkL` ist nur mittelbar über `satzE` belegt.
