# S2-38: Aussagen-Abgleich B-008 (Satz A) und B-009 (Satz B), unbeeinflusster Prüfer

- Auftrag: S2-38 (Stufe 2, Runde 9), Rolle Prüfer, Protokoll Abschnitt 5.1 Punkt 3
- Datum: 25.11.2026
- Stand des Repos: `main` bei `5ba150c`. Unter `lean/` und `.github/` gleich `58d7926`, dem Stand des letzten Actions-Laufs (geprüft mit `git diff 58d7926 origin/main -- lean/ .github/`, leer).
- Kein Fremdmodell befragt.
- Status setze ich nicht. Das macht der Orchestrator.

## 0. Gelesene Dateien und Offenlegung

Gelesen habe ich nur Dateien aus der Positivliste:

- `CLAUDE.md` und von `PROTOKOLL.md` Abschnitt 5. Offenlegung nach der Korrektur des Orchestrators: Gelesen habe ich außerdem Abschnitt 4 (Rollen) und die Liste aller Abschnittsüberschriften (über `grep "^#"`). Andere Abschnitte habe ich nicht gelesen. Abschnitt 4 enthält kein Urteil zu einer Behauptung.
- `behauptungen/B-008.md` und `behauptungen/B-009.md`, nachdem ich in der Dateiliste von `main` gesehen hatte, dass `pruefvermerke/UMBAU-FERTIG` existiert. Keine Datei in `pruefvermerke/` habe ich geöffnet.
- `lean/prosa/s2_444_spurA_r2.md` (die Prosa beider Behauptungen) und in `lean/prosa/yang_n4.md` die Definitionen (N1), (N2), V^{∧d}, H, g und Φ.
- Lean: `Basic.lean`, `Statements.lean`, `YangN4Haupt.lean` (Definitionen, `exists_normalized`, Schluss), `Lemma13Prime.lean` (Aussagen), `SatzA444.lean`, `SatzB444.lean` (Definitionen, Lemma V′, Satz B), `SatzB444Final.lean`, `lakefile.toml`.
- Die Liste der Actions-Läufe des Workflows `lean-project.yml` auf `main` und das Log des Jobs 139401952375.

Nicht gelesen habe ich `pruefvermerke/`, keine Datei mit „pruefung“ oder „abgleich“ im Namen, `versuche/`, `archiv/`, `LOG.md`, `STATUS.md`, `behauptungen/README.md`, andere Behauptungen, PR-Beschreibungen und Commit-Nachrichten.

**Offenlegung.** Alles Folgende habe ich vor meinem eigenen Urteil gesehen. Nichts davon enthält ein Urteil zu B-008, B-009, Satz A oder Satz B.

1. Beim Start eingeblendete Einträge des Projektgedächtnisses, wie dem Orchestrator um 18:22 UTC gemeldet:
   - `MEMORY.md` (Index). Kein Urteil zu B-008, B-009, Satz A oder Satz B. Der Index nennt aber Justus' Entscheidung zum „falsch aufgeschriebenen Beweis von Lemma 13 (Yang v3): ‚Weiter, Reparatur prüfen lassen‘“, und Lemma 13 ist ein Baustein von Satz A. Er nennt außerdem die Auftragsnummern und PRs von S2-14, S2-15 und S2-18 (nur Nummern), dass Runde 9 die Abgleiche von B-008 und B-009 mit frischen Prüfern wiederholt und dass Prüfer keine früheren Urteile sehen dürfen.
   - `s2-31-abgleich-b013`: Urteil zu B-013 (Satz E; `satzE` geprüft, Lemma P und weitere behauptet).
   - `s2-30-abgleich-b012`: Urteil zu B-012 (Satz C, Teil G geprüft), dazu der Hinweis, dass `SatzE444` `IsAlgClosed` braucht.
   - `aussagen-abgleich-n3`: Urteil zu B-006 (`yang_theorem_one`, `rank_three_two_six`).
   - `git-regeln`: Git-Regeln, ohne Befund.
2. Die Kopfkommentare zweier Lean-Dateien verweisen auf frühere Prüfungen. Wörtlich:
   - `lean/YangBounds/SatzA444.lean`: „Source: `lean/prosa/s2_444_spurA_r2.md` (task S2-05), Section 3 (Satz A, Folgerung A1, A2) and Section 4 (Lemma 13′, application table); checked in `lean/prosa/s2_444_spurA_r2_pruefung.md` (task S2-09), Sections 2.2 to 2.4.“
   - `lean/YangBounds/YangN4Haupt.lean`: „Source of the proof: `lean/prosa/yang_n4.md` (task S1-03, checked in S1-06, `lean/prosa/yang_n4_pruefung.md`)“, dazu „Lemma 13 (in the repaired form of Section 6 of the prose file)“.
   
   Ein Urteil steht in keinem der beiden Kommentare. Die genannten Prüfdateien habe ich nicht geöffnet.
3. Der Kopfkommentar von `lean/YangBounds/SatzB444.lean` beschreibt den Inhalt einer früheren Prosa-Prüfung (S2-09). Er sagt, dort sei ein einfacheres Lemma V′ vorgeschlagen worden („As agreed with the orchestrator, the repaired simpler version is formalised: Lemma V′ instead of Lemma V“, „as recommended in the review (Section 7, item 3)“, „as the review's V′ remark predicts“). Außerdem steht dort: „in particular the statement check, 5.1 item 3, is still open“. Das sind Angaben zum Beweisweg, kein Urteil über den Aussagen-Abgleich. Ich habe den Kommentar zu Ende gelesen, weil er die Abweichungen der Lean-Fassung von der Prosa dokumentiert. Diese Abweichungen habe ich selbst am Quelltext nachgeprüft (Abschnitt 2).
4. Die Titel der Actions-Läufe enthalten Commit-Titel früherer Prüfungen anderer Behauptungen: „S2-31: Aussagen-Abgleich B-013 (Satz E), Satz E geprüft, Lemma P bleibt behauptet“ und „S2-30: Aussagen-Abgleich B-012 … Prüfer und GPT 6.2 Sol“. Zu B-008 und B-009 stand dort nichts.
5. Die Statustabelle der Prosa (Abschnitt 12) vermerkt zu Satz A „bestätigt S2-02“. S2-02 war ein Beweissucher, kein Prüfer.

## 1. Build und Axiome (Protokoll 5.1 Punkte 1, 2, 4)

Actions-Lauf 45669881460 („Lean build (own project lean/)“) auf `main` bei `58d7926`, Job 139401952375, Ergebnis `success`. Selbst im Log nachgelesen:

- `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
- `SORRY: 0 'sorry' token(s) in the sources outside comments`
- `#print axioms` gibt für jeden der folgenden Sätze genau `[propext, Classical.choice, Quot.sound]` aus: `Lemma13Prime.lemma13Prime`, `SatzA444.lemma13Prime_statement`, `satzA`, `satzA_statement`, `satzA_exists`, `satzA_global`, `corollaryA1`, `corollaryA2`, `sDim_table`, `exists_common_kernel` (SatzA444.lean Zeilen 400 bis 409), `SatzB444.satzB`, `satzB_symm`, `satzB_global`, `lemmaV'`, `eight_le_rkH`, `eight_le_rkH_of_four_le_rkL`, `finrank_I_add_rkL_le`, `noProd_I`, `SatzB444Poly.syz` (SatzB444.lean Zeilen 671 bis 679) und `satzAHyp_holds`, `commonKernelHyp_holds`, `satzB_unbedingt`, `satzB_symm_unbedingt`, `satzB_global_unbedingt` (SatzB444Final.lean Zeilen 82 bis 86).
- `grep` über `lean/` findet kein `axiom`, `sorry` oder `native_decide` außerhalb von Kommentaren. Die externe Abhängigkeit `mm325_proof` wird über `Basic.lean` importiert. Weil `#print axioms` transitiv arbeitet, wäre ein Axiom aus ihr in der obigen Ausgabe sichtbar.

Einen eigenen lokalen Build konnte ich nicht machen, weil der Proxy den Download der Lean-Toolchain abgewiesen hat (CONNECT 403). Maßgeblich ist nach 5.1 Punkt 4 ohnehin der Actions-Lauf.

## 2. Gemeinsame Definitionen, bis Mathlib zurückverfolgt

| Prosa | Lean | Befund |
|---|---|---|
| Zerlegung (Z) von ⟨4,2,4⟩ der Länge 25 über K | `BilinearAlgorithm K 4 2 4 25` (Basic.lean): `alpha t : Matrix (Fin 4) (Fin 2) K →ₗ K`, `beta t : Matrix (Fin 2) (Fin 4) K →ₗ K`, `coeff t : Matrix (Fin 4) (Fin 4) K`, `A * B = ∑ (alpha t A * beta t B) • coeff t` mit dem Mathlib-Matrixprodukt | stimmt. Format n×l = 4×2 für A, l×m = 2×4 für B, nicht transponiert. `d := 3` mit `d + 1 = 4` ist definitorisch. |
| (N1): α_t(e_{0,0}) ≠ 0 für alle t | `SN1`: `∀ k, alg.alpha k (eA 0 0) ≠ 0`, `eA i j = unitMatrix i j` | stimmt |
| (N2): für x ∈ K^{2×m}, x ≠ 0, sind f_0(x), …, f_{n−1}(x) linear unabhängig | `SN2`: `∀ v ≠ 0, LinearIndependent K (fun i => fv alg i v)`, `fv i x = (α_t(e_{i,0}) β_t(x))_t` | stimmt, für alle v ∈ K^{2×4} wie in yang_n4.md |
| U = {x : Zeile 0 von x ist 0} | parametrisiert durch `emb y = (0; y)` | stimmt |
| f_i, J = f_0(U), W | `φ alg i = fv alg i ∘ emb`, `J = range (φ alg 0)`, `W t = ∑ t_k • coeff k` | stimmt |
| Q = ker W / J, F_i (i = 1, 2, 3) | `Kbar = (ker W).map J.mkQ` in `(Fin 25 → K) ⧸ J`; `Fq i = π ∘ φ (i.succ)`, i : Fin 3 | stimmt. Indexverschiebung `i.succ` richtig: F_1, F_2, F_3 gehören zu den Zeilen 1, 2, 3. |
| L, H | `Lq = sumMap Fq`, `Hq = skewExt Lq` auf `skewSpace` (c_{ii} = 0 und c_{ji} = −c_{ij}), `skewExt λ c i = λ (c i)` | stimmt mit yang_n4.md, auch in Charakteristik 2 |
| rk | `finrank K (LinearMap.range ·)` | Wertebereich ist `(Fin 25 → K) ⧸ J` statt Q, `range_Lq_le_Kbar`. Am Rang ändert das nichts. |
| ρ = max_γ rk(Σγ_iF_i) | `IsGreatest (Set.range (rkComb (Fq alg))) ρ`, γ ∈ K³ | stimmt. Ein solches ρ existiert (`exists_isGreatest_rkComb`), deshalb ist „∀ ρ, IsGreatest … → …“ nicht leer. |
| Φ | `Φ = (Lq ∘ fst).prod Φ₂`, `Φ₂ i = [−g(u_i) + ℓ(c_i)]` in Kbar | stimmt. Die erste Komponente liegt im Quotienten statt in Q, am Rang ändert das nichts. |
| g | `gU` = g eingeschränkt auf U | in Lean nur auf U definiert, in der Prosa auf ganz K^{2×4} |
| Ĵ = J + f_1(U) + f_2(U) + f_3(U) | `JHat = ⨆ i : Fin 4, range (φ alg i)` | stimmt |
| Übergang zu K̄, Längenerhalt | `exists_normalized` (über unendlichem Körper, Basiswechsel R3 und Streichen nach R2), `alg.baseChange (AlgebraicClosure K)`, `yang_theorem_two_algorithm` (aus `Statements.lean`, bedingungslos bewiesen) | stimmt |

**Leere Wahrheit.** (N1) und (N2) sind zusammen erfüllbar. `exists_normalized`, angewandt auf `standardAlgorithm (AlgebraicClosure ℚ) 4 2 4` (Länge 32), liefert ein Verfahren mit `SN1` und `SN2` einer Länge zwischen 25 und 32. Das habe ich aus vorhandenen Sätzen gefolgert und nicht kompiliert. Die Voraussetzung „Länge genau 25“ ist die offene Frage selbst. Sie steht genauso in der Prosa („Hat ⟨4,2,4⟩ … eine Zerlegung der Länge 25“) und ist keine Schwäche der Formalisierung.

**„Für jedes zulässige u_0“.** Die Lean-Sätze sprechen über jedes Verfahren mit `SN1` und `SN2` über jedem Körper. Das ist mindestens so stark wie die Prosa: Zu jedem zulässigen Paar (p, u_0) gehört nach dem Basiswechsel R3 ein Verfahren mit (N1) und (N2) (Beweis von Lemma 6 in yang_n4.md). Diese Übersetzung steht nur im Kommentar und ist kein eigener Lean-Satz. Sie ist aber definitorisch, denn das umgeformte Verfahren ist eine Zerlegung mit (N1) und (N2), und auf jede solche Zerlegung ist der Lean-Satz anwendbar.

**Globale Fassungen.** `satzA_global` und `satzB_global_unbedingt` sagen „es gibt ein normalisiertes `alg'` über `AlgebraicClosure K`“. Dass `alg'` aus `alg` entsteht, steht nicht in der Aussage, nur im Beweis. Für den Inhalt ist das unerheblich: Die ∀-Fassungen (`satzA_statement`, `satzB_unbedingt`) gelten für jede Normalform jedes Verfahrens.

## 3. Abgleich B-008 (Satz A samt Lemma 13′, Folgerungen A1 und A2)

**Urteil: bestätigt für Satz A, Lemma 13′ und Folgerung A2. Folgerung A1 ist nur zur Hälfte gedeckt.**

- **Satz A.** `SatzA444.SatzAStatement K` bzw. `satzA` sagt: Für jedes `alg : BilinearAlgorithm K 4 2 4 25` mit `SN1`, `SN2` und jedes ρ = max rk(Σγ_iF_i) gilt ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}, dazu dim Q = 5. Das ist die Aussage von B-008. Die Lean-Fassung ist sogar stärker, weil sie über jedem Körper gilt, ohne algebraischen Abschluss. `satzA_statement K` gilt für jedes K, `satzA_global` liefert die Normalform über dem Abschluss. Paare, Reihenfolge (rk L, rk H) und Zahlen stimmen.
- **rk Φ = 12 + rk H** (Prosa, „Außerdem“): `finrank_range_Φ`, gedeckt.
- **Folgerung A1.** `corollaryA1`: Aus rk H = rk L + 3 folgt range Φ = im L × Q³. Nach `cases_A1_iff` sind das unter Satz A genau die Fälle (3,6), (4,7), (5,8). Die erste Hälfte ist also gedeckt. **Nicht gedeckt ist die zweite Hälfte**, „ker L → Q³/im H ist ein Isomorphismus“. Der Kopfkommentar sagt das selbst.
- **Folgerung A2.** `corollaryA2`: Aus rk L = 5 folgt Ĵ = ker W. Gedeckt. Der Zusatz „insbesondere g(x) ∈ Ĵ“ ist in Lean nur für x ∈ U ausgesprochen (`gU`), in der Prosa steht er für x ∈ K^{2×4}. Mathematisch folgt der allgemeine Zusatz aus Ĵ = ker W und g(x) ∈ ker W. In Lean ist er nur für U formuliert. Die Aussage von B-008 selbst nennt nur Ĵ = ker W.
- **Lemma 13′.** `Lemma13PrimeStatement` / `lemma13Prime_statement`: Für endlichdimensionale U, Q, F : Fin 3 → (U →ₗ Q), ρ = max rk(Σγ_iF_i) und jedes γ mit rk(Σγ_iF_i) = ρ gilt 3ρ + 2s + rk L ≤ 2 rk H mit s = dim Σ_i F_i(ker Σ_jγ_jF_j).
  - Gleichwertig zu rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉: In die eine Richtung multipliziert man mit 2. In die andere ist rk H ganzzahlig, deshalb darf man aufrunden. Es gilt rk L ≥ ρ, weil L auf Vektoren der Form (γ_1x, γ_2x, γ_3x) die Abbildung Σγ_iF_i ergibt. Damit ist der Ausdruck in der Klammer nicht negativ.
  - s ist basisfrei formuliert. Nach dem Basiswechsel der Prosa (F′_1 = Σγ_jF_j, ξ ∈ GL_3) ist Σ_i F_i(ker F′_1) = Σ_i F′_i(ker F′_1) = F′_2(ker F′_1) + F′_3(ker F′_1), weil F′_1 seinen eigenen Kern auf 0 abbildet. Das ist das s der Prosa.
  - Der allgemeine Satz `Lemma13Prime.lemma13Prime` gilt für e + 2 Abbildungen und verallgemeinert die Prosa.
- **Anwendungstabelle und gemeinsamer Kern** (Prosa Abschnitt 4): `sDim_table` gibt s = 0 in (3,6), (4,7), (5,7) und s ≤ 1, für (5,8) wie in der Prosa. `exists_common_kernel` gibt N ≠ 0 in diesen drei Fällen. Gedeckt.
- **Nicht durch Lean gedeckt:** die zweite Hälfte von A1 und die Bemerkung, Ungleichung (1) sei in drei Fällen eine Gleichung (über rk Φ = 12 + rk H und A1 hinaus). Die Übersetzung „zulässiges u_0 ↔ SN1 ∧ SN2“ ist kein eigener Satz, siehe Abschnitt 2.

## 4. Abgleich B-009 (Satz B, Fassung `satzB_unbedingt`)

**Urteil: Der erste Teil ist bestätigt. Der Symmetrie-Teil weicht ab, die Lean-Fassung ist schwächer als der Text von B-009. Die Bausteine sind nur teilweise gedeckt.**

- **Erster Teil (Fallliste).** `satzB_unbedingt`: Für jedes `alg : BilinearAlgorithm K 4 2 4 25` mit `SN1` und `SN2` über jedem Körper K ist (rk L, rk H) = (3,6) oder (5,8). B-009 sagt dasselbe „für jedes zulässige p und generisches u_0“ über dem Abschluss. Lean gilt für jedes zulässige Paar, nicht nur generisch, und über jedem Körper, ist also stärker. `satzB_global_unbedingt` liefert die Normalform über `AlgebraicClosure K`. Keine Hypothesen mehr: `SatzAHyp` und `CommonKernelHyp` sind in `SatzB444Final.lean` durch `satzA_statement` und `exists_common_kernel` bewiesen. Beide Definitionen stimmen Zeichen für Zeichen mit `SatzAStatement` und der Aussage von `exists_common_kernel` überein, das habe ich verglichen. Die Axiome sind Standard (Abschnitt 1). **Gedeckt.**
- **Symmetrie im Fall (3,6).** `satzB_symm_unbedingt` folgert `IsSymm alg`. Dabei ist `IsSymm alg :≡ ∃ e : K⁴ ≃ₗ K⁴, ∃ μ : Fin 25 → K, ∀ t y, β_t(emb (e y)) = μ_t · Σ_i y_i a_{t,i}` mit a_{t,i} = α_t(e_{i,0}). Mit b_t·w = β_t(emb w) heißt das b_t·(G y) = μ_t (a_t·y), also Gᵀb_t = μ_t a_t mit G = e ∈ GL_4. Index, Transposition und Rolle von a_t und b_t stimmen. **Abweichung:** B-009 verlangt μ_t ≠ 0 für alle t, `IsSymm` verlangt das nicht. Der Kopfkommentar von SatzB444.lean sagt das auch („We do not require μ_t ≠ 0“). μ_t = 0 bedeutet, dass β_t auf U verschwindet. Dass das ausgeschlossen ist, braucht in der Prosa die generische Wahl von p (Folgerung V1). In Lean wird das für ein beliebiges zulässiges Paar nicht gezeigt. `IsSymm` ist trotzdem nicht trivial: μ ≡ 0 hieße β_t(emb y) = 0 für alle t und y, und dann wären die f_i(emb y) alle 0, im Widerspruch zu `SN2`. Gedeckt ist also nur die schwächere Aussage „Gᵀb_t = μ_t a_t mit μ_t ∈ K“, nicht „μ_t ≠ 0“.
- **Bausteine, die B-009 nennt:**
  - Lemma 13′: gedeckt (Abschnitt 3).
  - Lemma V (gemeinsamer Kern auf einer offenen dichten Menge, mit Bedingung (a), erzwingt Symmetrie): **nicht formalisiert.** Stattdessen gibt es `lemmaV'`: Ein gemeinsamer Kernvektor x ≠ 0 der F_1, F_2, F_3 an einem zulässigen Punkt erzwingt `IsSymm` (mit μ_t = β_t(emb x)/a_{t,0}, das kann 0 sein). Das ist eine andere, für Satz B ausreichende Aussage, aber nicht Lemma V.
  - Lemma S: **nur teilweise.** Gedeckt sind im symmetrischen Fall `noProd_I`, `dim I + rk L ≤ 6` (Prosa: Gleichung) und rk H ≥ 8 bei rk L ≥ 4 (`eight_le_rkH_of_four_le_rkL`), und zwar für jedes zulässige u_0. Nicht gedeckt sind rk H ≤ 8, „rk H = 8 − dim Syz₁“ (Teil 4) und die Gleichung dim I = 6 − rk L. Für Satz B reicht die Richtung ≥ 8.
- **Nicht durch Lean gedeckt:** μ_t ≠ 0 im Symmetrie-Teil, Lemma V in der Prosa-Fassung, Lemma S Teil 4 und die Gleichheiten in Lemma S.

## 5. Zusammenfassung für den Orchestrator

| Behauptung | Teil | Lean-Satz | Abgleich |
|---|---|---|---|
| B-008 | Satz A (ρ = 3, vier Fälle) | `satzA_statement`, `satzA`, `satzA_global` | bestätigt (Lean stärker: jeder Körper) |
| B-008 | rk Φ = 12 + rk H | `finrank_range_Φ` | bestätigt |
| B-008 | Lemma 13′ | `lemma13Prime_statement` | bestätigt (gleichwertige verdoppelte Form) |
| B-008 | A1 Surjektivität | `corollaryA1` | bestätigt |
| B-008 | A1 Isomorphismus ker L → Q³/im H | — | nicht gedeckt |
| B-008 | A2 (rk L = 5 ⇒ Ĵ = ker W) | `corollaryA2` | bestätigt (Zusatz zu g nur auf U) |
| B-009 | Fallliste {(3,6), (5,8)} | `satzB_unbedingt`, `satzB_global_unbedingt` | bestätigt (Lean stärker: jedes zulässige u_0, jeder Körper) |
| B-009 | Symmetrie in (3,6) mit μ_t ≠ 0 | `satzB_symm_unbedingt` | **Abweichung:** Lean ohne μ_t ≠ 0, schwächer |
| B-009 | Lemma V | (`lemmaV'`, andere Aussage) | nicht gedeckt |
| B-009 | Lemma S | `eight_le_rkH_of_four_le_rkL`, `noProd_I`, `finrank_I_add_rkL_le` | teilweise (nur rk H ≥ 8 bei rk L ≥ 4) |

Vorschlag (vermutet, nicht geprüft): Wenn B-009 „μ_t ≠ 0“ behalten soll, braucht es einen Lean-Satz, der für geeignete Normalformen β_t|_U ≠ 0 zeigt. Sonst kann man den Text von B-009 an `IsSymm` anpassen. Das entscheidet der Orchestrator.
