# S2-40: Aussagen-Abgleich B-012 (generische Fassung) und B-013 (Satz E), Runde 9

- Auftrag: S2-40 (Stufe 2, Runde 9), Rolle Prüfer, Ersatz für einen abgebrochenen Prüfer. Aussagen-Abgleich nach Protokoll 5.1 Punkt 3.
- Datum: 25.11.2026, Beginn 18:24 UTC.
- Kein Fremdmodell, kein Subagent.
- Dieser Bericht setzt keinen Status. Er enthält das Urteil eines Prüfers. Den Status setzt der Orchestrator.
- Stand des Codes: `origin/main` bei `aa20f64`. Unter `lean/` gibt es keinen Unterschied zu `58d7926`. Für diesen Stand liegt der Actions-Lauf 45669881460 vor („Lean build (own project lean/)“, Job 139401952375, Ergebnis success).

## 0. Offenlegung (vor den Urteilen zu lesen)

1. **Projektgedächtnis beim Start.** Eingeblendet wurde der Index `team/silo/MEMORY.md`. Er enthält kein Urteil und keinen Befund zu B-012, B-013, Satz C, Satz E oder Unterfall A. Er nennt nur Auftragsnamen, die Existenz früherer GPT-Urteile (ohne Inhalt) und den Satz „Bestätigen sie, gelten die Fristen als gehalten“. Ich weiß also, dass eine Bestätigung für die Fristen erwünscht wäre. Kurz danach hat das System drei weitere Einträge eingeblendet: `aussagen-abgleich-n3` (B-006), `abgleich-yang-n4-b007` (B-007) und `git-regeln`. Sie betreffen nicht B-012 oder B-013. Gemeldet habe ich das an den Orchestrator vor dem ersten Lesen einer Datei (zuerst nur der Index).
2. **Protokoll.** Vor der Korrektur des Orchestrators habe ich außer Abschnitt 5 auch Abschnitt 4 („Rollen“) und die Überschriftenliste von `PROTOKOLL.md` gelesen. Darin steht kein Urteil.
3. **Lean-Kommentare.** Die Modulkommentare von `SatzC444Kern.lean`, `SatzC444Generisch.lean`, `SatzB444.lean`, `SatzE444.lean` und `SatzE444Buendel.lean` verweisen auf frühere Prosa-Prüfungen (`s2_444_spurA_r4_pruefung.md`, S2-22; `s2_444_spurA_r4_pruefung_b013.md`, S2-23; `s2_444_spurA_r2_pruefung.md`). Sie nennen deren Reparaturvorschläge (etwa „repair R-C1“, „review P2“, „GPT supplement E2“, „review Section 8, item 1“). Ein Urteil über einen Aussagen-Abgleich steht dort nicht. Gesehen habe ich das beim Lesen der Quelltexte, also vor meinem Urteil. Die genannten Prüfdateien habe ich nicht geöffnet.
4. **Commit-Nachrichten in der Liste der Actions-Läufe.** Wörtlich, wie an den Orchestrator gemeldet: „Beim Abrufen der Actions-Läufe auf main zeigte die Liste die Commit-Nachrichten früherer Merges, darunter wörtlich ‚S2-31: Aussagen-Abgleich B-013 (Satz E), Satz E geprüft, Lemma P bleibt behauptet‘ und ‚S2-30: Aussagen-Abgleich B-012 (Satz C, C1 generisch), Prüfer und GPT 6.2 Sol‘ (die zweite ohne Urteil). Zeitpunkt: NACH meiner vollständigen Durchsicht der Lean-Quellen von Satz C und Satz E (Definitionen bis Mathlib) und nach Bildung meiner Befunde, aber VOR dem Niederschreiben des Berichts.“ Die erste Nachricht enthält ein früheres Ergebnis zu B-013 (Satz E). Ob Teil 2 dieses Berichts nach Protokoll 5.4 gültig ist, entscheidet Justus. Teil 1 (B-012) ist davon nicht berührt, denn die Nachricht zu B-012 nennt kein Urteil.

Gelesen habe ich `CLAUDE.md`, `PROTOKOLL.md` Abschnitt 5 (und Abschnitt 4, siehe Punkt 2), `behauptungen/B-012.md`, `behauptungen/B-013.md`, `lean/prosa/s2_444_spurA_r4.md` Abschnitte 1 bis 5.4 und die Lean-Quelltexte unter `lean/YangBounds/`, soweit sie für die Definitionen nötig sind: Basic, YangN3Teil1, YangN3Teil2, YangN3Teil3 (emb, finrank_J), YangN4Haupt, SatzA444, SatzB444, SatzB444Final, SatzC444Kern, SatzC444Generisch, SatzE444, SatzE444Buendel. Dazu kommt das Log des oben genannten Jobs. Nicht gelesen habe ich `pruefvermerke/`, Prüf- und Abgleichdateien, `versuche/`, `archiv/`, `LOG.md`, `STATUS.md` und PR-Beschreibungen.

## 1. Build, `sorry` und Axiome (Actions-Log, selbst gelesen)

Job 139401952375, Lauf 45669881460 auf `main` (`58d7926`, unter `lean/` gleich dem aktuellen `aa20f64`):

- Schritt „Build library YangBounds (all modules)“: success.
- Sorry-Bericht: `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log` und `SORRY: 0 'sorry' token(s) in the sources outside comments`.
- `#print axioms` im Build-Log (Zeilen 308 bis 326) und im eigenen Axiom-Schritt (Zeilen 519 bis 536): `satzC_kern`, `genSN1`, `genSN2`, `satzC_generisch`, `folgerungC1_generisch`, `folgerungC1_nicht36`, `exists_chain`, `point_lemma`, `finrank_JHat_le_eight`, `rkL_le_four_of_unterfallA`, `satzE` und `satzE_global` hängen jeweils nur von `[propext, Classical.choice, Quot.sound]` ab.

Damit sind auch die Hilfssätze, die `folgerungC1_generisch` benutzt (`satzB_unbedingt`, `satzB_symm_unbedingt` und Yangs Schranke `yang_theorem_two_algorithm`), ohne `sorryAx` gebaut, denn ein `sorry` dort zeigte sich als `sorryAx` in den Axiomen. Für `rkL_le_four_of_unterfallA` (Satz E ohne Fall) gilt dasselbe.

## 2. Gemeinsame Definitionen, bis auf Mathlib verfolgt

- `BilinearAlgorithm K n l m r` (Basic.lean): Linearformen `alpha t` auf `n×l`, `beta t` auf `l×m`, Matrizen `coeff t` mit `A * B = Σ_t (alpha t A * beta t B) • coeff t` für alle `A`, `B`. Das ist Mathlibs Matrixprodukt. Format ⟨4,2,4⟩: `A ∈ K^{4×2}`, `B ∈ K^{2×4}`. Die Definition stimmt mit Abschnitt 2 der Prosa überein (`α_t(A) = Σ A_t[i,k] A[i,k]`).
- Normalform (YangN4Haupt, d = 3, m = 4): `eA i j` ist die Einheitsmatrix `e_{ij}` in `K^{4×2}`, `emb y = (0; y)` (Zeile 0 null, Zeile 1 gleich `y`). Es ist `fv i x = (α_t(e_{i0}) β_t(x))_t` und `φ i = fv i ∘ emb`. Die Prosa liest man in dieser Lage mit `p = e_0` (Zeile 0 von `K²`), `v = e_1` (also `p·v = 0`) und `u_0 = e_0 ∈ K⁴`. Dann ist `Ψ(u, y)_t = (a_t·u) β_t(emb y)` (`psi_apply_apply`) mit `a_t = avecs t = (α_t(e_{i0}))_i`.
- `SN1`: `α_t(e_{00}) ≠ 0` für alle `t`, das ist (N1) `a_t·u_0 ≠ 0`. `SN2`: Für jedes `v ≠ 0` sind `f_0(v), …, f_3(v)` linear unabhängig, das ist (N2).
- `W t = Σ t_k C_k`. `J = range φ_0 = Ψ(u_0, U)`. Es gilt `Fq i = π ∘ φ (i+1)` in den Quotienten `K^r ⧸ J` für `i = 1, 2, 3`. Weiter ist `Lq = Σ Fq_i` auf `U³` und `Hq = skewExt Lq` auf den schiefen 3×3-Matrizen mit Einträgen in `U` (Diagonale ausdrücklich null). Die Bilder von `Fq` liegen in `ker W / J`, denn `Σ_t α_t(e_{i0}) β_t((0;y)) C_t = e_{i0}·(0;y) = 0`. Der Rang in den vollen Quotienten ist also der Rang in Q. Das Paar `(rk L, rk H)` ist `(finrank (range Lq), finrank (range Hq))`. `finrank_JHat` gibt `dim Ĵ = rk L + 4` mit `Ĵ = ⨆_i range φ_i`, wie in der Prosa.
- `changeBasis alg S T`: `α'_t(A) = α_t(S A T)`, `β'_t(B) = β_t(T⁻¹ B)`, `C'_t = S⁻¹ C_t`. `baseChange`: Fortsetzung über die Koeffizienten `α_t(e_{ij})`.

## 3. Teil 1: B-012 in der generischen Fassung

### 3.1 Was die Lean-Sätze sagen

- `GField K = FractionRing (MvPolynomial (Var 3) K)`: der Körper der rationalen Funktionen über `K` in den 16 Einträgen von `S` und den 4 Einträgen von `T`. `Sg` und `Tg` sind die generischen Matrizen, ihre Determinanten sind ungleich null (`det_Sg_ne_zero`, `det_Tg_ne_zero`). Es ist `genAlg alg = changeBasis (alg.baseChange (GField K)) Sg Tg`.
- In der Prosa-Schreibweise gilt für `genAlg`:
  `avecs t i = α_t(S e_i e_0ᵀ T) = α_t((S e_i) pᵀ)` mit `p = (T₀₀, T₀₁)`, also `a′_t = Sᵀ A_t p = Sᵀ a_t(p)`. Ferner gilt
  `β′_t(emb y) = β_t(T⁻¹ (0;y)) = β_t(v yᵀ)` mit `v = T⁻¹e_1 = (−T₀₁, T₀₀)/det T`, also `v = J p / det T` (`genAlg_beta_emb`, `vT_zero`, `vT_one`). Damit ist `β′_t(emb y) = (det T)⁻¹ · b_t(p)·y` mit `b_t(p) = B_tᵀ J p` aus der Prosa. Der generische Punkt hat also `p` = Zeile 0 von `T` und `u_0` = Spalte 0 von `S`.
- `SatzB444.IsSymm alg :⇔ ∃ e : K⁴ ≃ₗ K⁴, ∃ μ, ∀ t y, β_t(emb (e y)) = μ_t · (a_t·y)`. Mit der Übersetzung oben heißt das `eᵀ b_t(p) = c μ_t Sᵀ a_t(p)` für alle `t` (c eine Konstante ungleich null). Also gilt `M b_t(p) ∈ K·a_t(p)` mit der invertierbaren Matrix `M = c⁻¹ S⁻ᵀ eᵀ`. Umgekehrt liefert jede solche invertierbare `M` ein `e`. Der Fall `μ_t = 0` ist erlaubt. Er bedeutet `b_t(p) = 0`, und das lässt auch die Prosa zu (`M b_t ∈ K·a_t` mit Vielfachem 0). **`IsSymm (genAlg alg)` ist also genau die Symmetrie der Prosa am generischen Punkt, mit `M` über dem Körper `GField K`.**
- `satzC_generisch (hr : r ≤ 25) alg : ¬ IsSymm (genAlg alg)` gilt für jeden Körper `K` und jede Länge `r ≤ 25`.
- `folgerungC1_generisch alg` für die Länge 25 über jedem Körper: `SN1 (genAlg alg) ∧ SN2 (genAlg alg) ∧ (rk L, rk H) = (5, 8) ∧ ¬ IsSymm (genAlg alg)`. Dazu kommt `folgerungC1_nicht36`: `(rk L, rk H) ≠ (3, 6)` am generischen Punkt.
- Körperannahmen: nur `[Field K]`, auch endliche Körper und Charakteristik 2. Die Ableitung `Dg = ∂/∂T₀₁` wird über `IsLocalization.lift` in die dualen Zahlen gebaut. Für jeden Körper `K` ist `GField K` unendlich.
- Keine versteckte Hypothese. `genSN1` braucht `α_t ≠ 0`. Das liefert `alpha_ne_zero_of_length_25` aus Yangs Schranke R ≥ 25, ebenfalls gebaut. `genSN2` hat keine Hypothese.
- Leere Wahrheit: Die Aussagen gelten für jede Zerlegung der Länge 25. Ob es eine gibt, ist genau die offene Frage, und daher ist eine Leere hier nicht ausgeschlossen, aber auch nicht durch die Definitionen erzwungen. `IsSymm` ist kein trivial falsches Prädikat, denn es ist eine echte lineare Bedingung an `e`. Format, Indizes und Transposition habe ich oben nachgerechnet. Die Rollen von `a` und `b` sind nicht vertauscht.

### 3.2 Abgleich mit der Behauptung

| Teil von B-012 | gedeckt? |
|---|---|
| Satz C für generisches p: Eine Zerlegung der Länge 25 (sogar ≤ 25) über jedem Körper ist am generischen Punkt nicht symmetrisch | **ja**, `satzC_generisch` |
| Folgerung C1, Fassung R-C1, generisch: Die Normalform liegt im Fall (5,8) und ist nicht symmetrisch, mit (N1) und (N2) | **ja**, `folgerungC1_generisch` |
| „also nicht in (3,6)“ | **ja**, `folgerungC1_nicht36` |
| Satz C in der Prosa-Fassung: Es gibt keine nichtleere Zariski-offene Menge von p ∈ K̄² mit invertierbarem M_p ∈ GL_4(K̄) punktweise | **nein, nur generisch.** Die Richtung „punktweise symmetrisch auf einer offenen Menge ⇒ symmetrisch am generischen Punkt“ ist Schritt 0 der Prosa (rationale Wahl von M_p). Der Modulkommentar sagt ausdrücklich, dass Schritt 0 nicht formalisiert ist. Für C1 wird Schritt 0 nicht gebraucht, weil Satz B direkt am generischen Punkt angewandt wird |
| R-C1 im Wortlaut „nichtleere Zariski-offene Menge zulässiger p ∈ K̄²“ | **nur generisch.** Der Übergang vom generischen Punkt zu einer offenen Menge von Spezialisierungen (Rang am generischen Punkt = Rang auf einer dichten offenen Menge, Halbstetigkeit) steht nicht in Lean. Er ist Standard, aber nicht formal |

Zwei Anmerkungen ohne Wirkung auf das Urteil:

- Die Symmetrie verlangt `M` über `GField K`, die Prosa verlangt `M` über dem algebraischen Abschluss. Das ist gleichwertig: Die Matrizen `M` mit `M b_t ∈ span(a_t)` für alle `t` bilden einen über `GField K` definierten Untervektorraum. Enthält er über dem Abschluss eine invertierbare Matrix, dann ist `det` auf ihm ein nicht verschwindendes Polynom und hat über dem unendlichen Körper `GField K` einen Punkt ungleich null. Das ist mein Argument, Lean enthält es nicht. Es wird für die generische Aussage auch nicht gebraucht.
- Die generische Normalform macht auch `S` (also `u_0`) generisch. Für die Symmetrie spielt das keine Rolle (`S` wird von `M` aufgenommen). Für (N1) ist es genau das „generische u_0“ der Prosa.

**Urteil Teil 1:** Die Lean-Sätze `satzC_generisch`, `folgerungC1_generisch` und `folgerungC1_nicht36` sagen samt aller Definitionen genau das, was B-012 für generisches p sagt: Eine Zerlegung von ⟨4,2,4⟩ der Länge 25 über jedem Körper ist am generischen Punkt nicht symmetrisch und liegt dort im Fall (5,8), nicht in (3,6). Format, Körper und Zahl stimmen. **Bestätigt für die generische Fassung.** Nicht gedeckt sind Satz C in der punktweisen Prosa-Fassung (Schritt 0) und die wörtliche Übersetzung „generischer Punkt ⇔ nichtleere offene Menge von p ∈ K̄²“.

## 4. Teil 2: B-013, Teil Satz E

(Zur Offenlegung, Punkt 4: Die Befunde unten habe ich vor dem Sehen der Commit-Nachricht gebildet und danach unverändert niedergeschrieben.)

### 4.1 Was die Lean-Sätze sagen

- `UnterfallA alg :⇔ ∃ Kst ≤ K⁴, ∃ q ∈ K^r ⧸ J, dim Kst = 2 ∧ ∀ i ∈ {1,2,3}, ∀ x ∈ Kst, F_i(x) ∈ K·q`.
- `UnterfallAVoll alg` (Buendel): `dim K* = 2` mit `K* = ⨆_{γ ∈ Ω} ker F_γ` und `Ω = {γ : rk F_γ = 3}`. Dazu ein `γ* ≠ 0` mit `K* ≤ ker F_{γ*}` und ein `q ≠ 0` mit `F_i(K*) ⊆ K·q`. Es gilt `unterfallA_of_voll : UnterfallAVoll → UnterfallA`.
- `satzE [IsAlgClosed K] (alg : Länge 25) (h1 : SN1) (h2 : SN2) (hcase : (rk L, rk H) = (5,8)) : ¬ UnterfallA alg`.
- `satzE_of_rkL`: dasselbe mit `rk L = 5` statt des Paares. `rkL_le_four_of_unterfallA`: Für jede Länge `r` folgt unter `IsAlgClosed`, SN1, SN2 und `UnterfallA` die Schranke `rk L ≤ 4`.
- `satzE_global K alg : ∃ alg′ über AlgebraicClosure K, Länge 25, SN1 alg′ ∧ SN2 alg′ ∧ ((rk L, rk H)(alg′) = (5,8) → ¬ UnterfallA alg′)`.

### 4.2 Ist das Lean-Prädikat schwächer oder stärker als die Prosa?

Unterfall A der Prosa (Lemma P, Abschnitt 5.1): `dim K* = 2` mit `K* = span{k(γ)}` (Kernvektoren generischer γ) und `q ∈ Q`, `q ≠ 0`, mit `F_γ(K*) ⊆ K·q` für alle γ. Dazu kommt `γ*`.

- `F_γ = Σ γ_i F_i` ist linear in γ. Deshalb ist „für alle γ“ gleichwertig mit „für i = 1, 2, 3“.
- `UnterfallA` verlangt nur *irgendeinen* zweidimensionalen Raum `Kst`. Es fordert nicht `Kst = span{k(γ)}`, kein `γ*`, kein `q ≠ 0`, und `q` darf im vollen Quotienten `K^r ⧸ J` liegen statt in `Q = ker W / J`.
- Jede Lage von Unterfall A der Prosa erfüllt also `UnterfallA`. Das Lean-Prädikat ist **schwächer** (es trifft auf mehr Lagen zu), und sein Ausschluss `¬ UnterfallA` ist **stärker** als der Ausschluss der Prosa. Das ist die richtige Richtung.
- `UnterfallAVoll` liegt zwischen beiden. Es nimmt `Ω` als alle Maximierer statt nur der generischen, also ist `Kstern` mindestens `span{k(γ)}`. Für den Abgleich von Satz E zählt nur, dass `UnterfallA` die Prosa-Lage umfasst, und das gilt.

### 4.3 Welche Voraussetzungen braucht `satzE` wirklich?

- Gebraucht werden: `IsAlgClosed K`, SN1, SN2 und `rk L = 5`. Die Länge 25 geht nur über die Zahl `dim Ĵ = rk L + 4 = 9 > 8` ein, und `rkL_le_four_of_unterfallA` gilt für jede Länge.
- Nicht gebraucht werden: Nicht-Symmetrie, `rk H = 8`, `s = 1`, `N(u_0) = 0`, Lemma P, `b_t ≠ 0` und `q ≠ 0`.
- `IsAlgClosed` geht nur in `chainEval_ne_zero` ein (eine Nullstelle des Kettenpolynoms). Die Prosa arbeitet ohnehin über K̄ (Lemma R1).
- Die Prosa sagt: „Im Fall (5,8) ohne Symmetrie tritt Unterfall A nicht auf“, und zwar für p aus der offenen Menge P_ns und generisches u_0. Lean sagt es für *jede* normierte Zerlegung (jede zulässige Wahl von p und u_0, die SN1 und SN2 erfüllt) mit `rk L = 5`, ohne Symmetrie-Annahme. Das umfasst die Lage der Prosa: An einem zulässigen Paar (p, u_0) aus P_ns bringt ein Basiswechsel mit `S e_0 = u_0` und Zeile 0 von `T` gleich `p` die Zerlegung in die Lean-Lage. Dort gelten SN1 und SN2, und im Fall (5,8) ist `rk L = 5`. Diesen Basiswechsel führt Lean für Satz E nicht vor. Er ist aber genau die Definition der Normalform, die die Prosa benutzt.
- Bedingung an den Körper: `satzE` ist nur über algebraisch abgeschlossenen Körpern formuliert. Den Übergang von K zu K̄ macht `satzE_global` über `satzA_exists`.

### 4.4 Sagt `satzE_global` etwas über die eingegebene Zerlegung?

**Nein, nicht über die eingegebene Zerlegung selbst.** Die Aussage ist nur „∃ alg′ über AlgebraicClosure K mit Länge 25, SN1, SN2 und (Fall (5,8) → ¬ UnterfallA alg′)“. Die Aussage stellt keine Verbindung zwischen `alg′` und `alg` her: Sie sagt nicht, dass `alg′` aus `alg` durch Körpererweiterung und Basiswechsel entsteht, nicht, an welchem Punkt p, und nicht, dass jede Normalform von `alg` betroffen ist. (Im Beweis entsteht `alg′` über `exists_normalized (alg.baseChange …)`, aber das steht nicht in der Aussage.) Logisch folgt `satzE_global` schon aus „es gibt über K̄ eine normierte Zerlegung der Länge 25“ zusammen mit `satzE`. Die Implikation ist außerdem leer wahr, wenn das gewählte `alg′` nicht im Fall (5,8) liegt. Der Docstring („for every such normal form in the case (5,8)“) beschreibt eher `satzE` als `satzE_global`. Als Aussage über die Zerlegung ist `satzE` maßgeblich, denn es gilt für jede normierte Zerlegung über einem algebraisch abgeschlossenen Körper. `satzE_global` ist nur eine Hülle und für den Abgleich nicht tragend.

### 4.5 Zusammenspiel mit Teil 1 (Hinweis, nicht Gegenstand des Urteils)

Teil 1 lebt am generischen Punkt über `GField K`, das nicht algebraisch abgeschlossen ist. `satzE` verlangt `IsAlgClosed`. Wer beide verbinden will, braucht eine Körpererweiterung von `genAlg alg` auf `AlgebraicClosure (GField K)`. Dabei muss gezeigt werden, dass SN1, SN2, die Ränge von L und H und die Nicht-Symmetrie erhalten bleiben. Für die Nicht-Symmetrie geht das mit dem Argument aus 3.2. Diese Verbindung gibt es in den abgeglichenen Dateien nicht.

**Urteil Teil 2:** `satzE` (und `satzE_of_rkL`) sagt samt der Definitionen `UnterfallA`, `Fq`, `J`, `Lq`, `Hq`, `SN1` und `SN2` mindestens das, was B-013 über den Ausschluss von Unterfall A sagt. Das Prädikat ist schwächer als Unterfall A der Prosa, der Ausschluss also stärker. Gebraucht werden nur ein algebraisch abgeschlossener Körper, (N1), (N2) und rk L = 5, keine Nicht-Symmetrie. **Bestätigt für `satzE`**, mit Gültigkeitsvorbehalt nach Offenlegung Punkt 4. `satzE_global` sagt nichts über die eingegebene Zerlegung (nur Existenz irgendeiner Normalform über K̄, ohne Bezug zu `alg`). Als Aussage über eine gegebene Zerlegung darf man es nicht zitieren. Die Dichotomie (`LemmaPStatement`) war nicht Gegenstand dieses Abgleichs.

## 5. Dauer und Verbrauch

Ein Prüfer (dieser Thread), kein Subagent, keine Fremdmodell-Anfrage. Dauer etwa 20 Minuten (18:24 bis etwa 18:45 UTC).
