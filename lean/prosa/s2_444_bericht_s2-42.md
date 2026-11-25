# S2-42: Aussagen-Abgleich der Lean-Sätze zu B-008 und B-009

Rolle: Prüfer. Auftrag des Orchestrators vom 25.11.2026, 18:52 UTC. Grundlage: `PROTOKOLL.md` Abschnitt 5.1 Punkt 3.
Gelesener Stand: `main` bei `e1f0aa5`. Kein Fremdmodell befragt. Dieser Bericht setzt keinen Status.

---

## 0. Offenlegung

**Eingeblendete Gedächtniseinträge.** Beim Start wurde mir der Index `MEMORY.md` des Projektgedächtnisses eingeblendet. Er enthält Regeln zur Projektführung: Rechte und Grenzen des Orchestrators, Fremdmodell-Angaben, Vorgaben für Prüferaufträge, Budget nach Abschnitt 6, Merge-Hinweise. Er nennt den Thread „Logbuch und Status nachführen“, der `LOG.md`, `STATUS.md` und `pruefvermerke/` schreibt, und verweist auf die Einträge `verfahren-datenformat` und `lean-project-ci`, deren Inhalt ich nicht gesehen habe. Kurz danach, noch vor dem Lesen einer Repo-Datei, wurden vier weitere Einträge eingeblendet:
- `abgleich-yang-n4-b007`: Praxis-Hinweise aus S1-19 (PR #30, B-007) zur Bridge und zur Lean-Werkzeugkette;
- `aussagen-abgleich-n3`: Praxis-Hinweise aus S1-18 (PR #32, B-006), darunter der Nebenbefund „veraltete (open)-Kommentare in Statements.lean und Upper3x2x6.lean“;
- `git-regeln`: Commit-, PR- und Rückfrageregeln;
- `lean-build-cloud`: Umwege für den Bau von Lean/mathlib in der Cloud.

Keiner dieser Einträge enthält ein Urteil oder einen Status zu B-008 oder B-009. Beides habe ich dem Orchestrator vor dem ersten Lesen gemeldet.

**Gelesenes außerhalb der Liste.**
1. Um die Abschnitte §2 bis §7 gezielt zu lesen, habe ich die Überschriftenzeilen von `lean/prosa/s2_444_spurA_r2.md` ausgegeben. Dabei sah ich auch die Überschriften von §1 und §8 bis §14, darunter „8.1 … (behauptet)“, „8.2 … (behauptet)“, „8.3 Gegenbeispiel zum Ansatz ‚nur F-Daten‘ (behauptet, exakt nachgerechnet)“ und „12. Statusübersicht“. Deren Inhalt habe ich nicht gelesen.
2. Um zu prüfen, ob die genannten Lean-Dateien seit dem in den Behauptungen genannten Stand `c2b4b9a` verändert wurden, habe ich `git diff c2b4b9a origin/main` auf die Dateien der Liste angewandt. Dabei habe ich **ältere Fassungen von Kommentaren** gesehen. Laut dem Diff sind nur Kommentare geändert, keine Aussage und kein Beweis. Die entfernten Kommentare enthielten:
   - Verweise auf `lean/prosa/s2_444_spurA_r2_pruefung.md` (Auftrag S2-09) als Prüfung der Prosa zu Satz A, Lemma 13′ und Satz B, und auf `lean/prosa/yang_n4_pruefung.md` (S1-06);
   - in `SatzB444.lean` die Wendungen „As agreed with the orchestrator, the **repaired simpler version** is formalised“, „Lemma V′ … as recommended in the review (Section 7, item 3)“, „repair R1 on the choice of p“ und „as the review's V′ remark predicts“.
   
   Ich habe also gesehen, dass es eine frühere Prüfung der **Prosa** zu B-008/B-009 gab und dass sie Lemma V′ und eine Reparatur „R1“ empfohlen hat. Ein Urteil zum **Aussagen-Abgleich der Lean-Sätze** habe ich nicht gesehen. Ob das nach Abschnitt 5.4 meine Prüfung berührt, entscheidet der Orchestrator. Die Dateien `*_pruefung.md` selbst habe ich nicht geöffnet.
3. In `lean/Axioms.lean`, das auf der Liste steht, stehen auch Namen weiterer Sätze, darunter `SatzE444`, `SatzC444`, `LemmaP444` und `Endsatz444.rank_four_two_four_ge_26_of…`. Das sind Hinweise auf andere Arbeiten. Gelesen habe ich davon nichts.
4. Das Job-Protokoll habe ich über `gh run view --job 139430765012 --log` geladen; ein direkter Abruf der Log-URL scheiterte am Proxy. Ausgewertet habe ich nur die Zeilen, die mit `SORRY` beginnen, und die Axiom-Zeilen zu den genannten Sätzen (siehe Abschnitt 3). Die Suche nach Satznamen hat auch einige Zeilen Lean-Metacode (`AXIOM-RESULT|…`) zu denselben drei Sätzen getroffen.
5. `lean/prosa/yang_n4.md` steht nicht auf der Liste. Die Behauptung B-008 verweist für die Bezeichnungen darauf. Ich habe die Definitionen nur gegen die Kurzfassung in §2 von `s2_444_spurA_r2.md` abgeglichen. Was das offen lässt, steht in 1.4.

**Statuswörter und Hinweise auf andere Leser.** Statuswörter standen an folgenden Stellen:
- in den Dateiköpfen fast aller Lean-Dateien („Status … `behauptet` (nothing here is `geprüft` …)“; in `SatzB444.lean` zusätzlich „the statement check, 5.1 item 3, is still open“);
- in der Prosa: §3 „B-007, geprüft“ und „Folgerung A1 (Starrheit, behauptet)“, §7 „Status behauptet“;
- in den Überschriften aus Punkt 1.

Die Hinweise auf andere Leser stehen unter Punkt 2 (S2-09, S1-06, „review“).

---

## 1. B-008 (Satz A, Folgerungen A1 und A2)

### 1.1 Rückverfolgung der Definitionen

Alles ist bis auf Mathlib zurückverfolgt: `BilinearAlgorithm` in `Basic.lean`, die Objekte in `YangN4Haupt.lean`, `emb` in `YangN3Teil3.lean`, `baseChange` in `YangN3Teil1.lean`.

| Behauptung / Prosa §2 | Lean | Abgleich |
|---|---|---|
| Zerlegung von ⟨4,2,4⟩ der Länge 25: A·B = Σ α_t(A)β_t(B)C_t | `BilinearAlgorithm K 4 2 4 25`: `alpha t` auf 4×2, `beta t` auf 2×4, `coeff t` 4×4, `A * B = ∑ (alpha A * beta B) • coeff` | passt (Format 4×2·2×4, keine Transposition) |
| Normalform (N1), (N2), zulässiges u_0 | `SN1`: α_t(e_{0,0}) ≠ 0 für alle t; `SN2`: für v ≠ 0 in K^{2×4} sind f_0(v),…,f_3(v) linear unabhängig | passt zu „Π_t α_t(u_0·p) ≠ 0“ und (N2) |
| U = {x : Zeile 0 = 0}, dim 4 | `emb y = Matrix.of ![0, y]`, y ∈ K⁴ | passt |
| f_i(x) = D(e_{i,0})ℬ(x), J = f_0(U) | `fv alg i = prodMap alg (eA i 0)`, `φ i = fv i ∘ emb`, `J = range (φ 0)` | passt |
| Q = ker W / J, F_i: U → Q (i = 1,2,3) | `Kbar = (ker W).map π`; `Fq i = π ∘ φ (i.succ)` mit Ziel `(Fin 25 → K) ⧸ J` | Ziel ist der ganze Quotient, nicht Q. Das Bild liegt aber in Q (`range_Lq_le_Kbar`), alle Ränge stimmen überein. Indizes 1..3 ↔ `i.succ`, passt. |
| L(u) = Σ F_i(u_i), H schiefe Erweiterung auf U^{∧3} | `Lq = sumMap Fq`, `Hq = skewExt Lq`, `skewSpace` mit c_ii = 0 und c_ji = −c_ij | passt (auch in Charakteristik 2) |
| ρ = max_γ rk(Σ γ_i F_i) | `IsGreatest (Set.range (rkComb Fq)) ρ`, γ ∈ K³ | passt; das Maximum existiert (`exists_isGreatest_rkComb`) |
| rk | `finrank K (LinearMap.range ·)` | passt |
| Ĵ = J + f_1(U) + f_2(U) + f_3(U) | `JHat = ⨆ i : Fin 4, range (φ i)` | passt |
| Φ(u,c) = (L(u), (−g(u_i) + H(c)_i)_i) in im L × Q³ | `Φ = (Lq ∘ fst).prod Φ₂`, `Φ₂ i = [−gU(u_i) + ℓ(c_i)]` in `Kbar` | passt zur Beschreibung in §3. `gU` siehe 1.4. |

### 1.2 Teilaussagen von B-008

**(a) Satz A für Normalformen: „ρ = 3 und (rk L, rk H) ∈ {(3,6),(4,7),(5,7),(5,8)}“.**
`SatzAStatement K` / `satzA_statement` / `satzA`: für jeden Körper K, jedes `alg` der Länge 25 mit `SN1` und `SN2` und jedes maximale ρ gilt ρ = 3 und die Fallliste. `satzA` liefert zusätzlich dim Q = 5.
→ **Von Lean gedeckt, stärker:** Es gilt über jedem Körper, nicht nur über dem algebraischen Abschluss. „Für jedes zulässige u_0“ entspricht dem Allquantor über alle normierten Zerlegungen, weil (N2) nur von p abhängt und (N1) genau die Zulässigkeit von u_0 ist.

**(b) Globale Form: „Hat ⟨4,2,4⟩ über K eine Zerlegung der Länge 25, so gilt in Yangs Normalform über dem algebraischen Abschluss …“.**
`satzA_exists` und `satzA_global` sagen: Zu jedem `alg` über K **gibt es** ein `alg'` über `AlgebraicClosure K` der Länge 25 mit (N1), (N2), und für dieses gilt die Folgerung.
→ **Schwächer als der Wortlaut, aber nicht leer.** Der Satz sagt nicht, dass `alg'` aus `alg` entsteht. Im Beweis entsteht es durch `baseChange`, `removeZeroAlpha` und einen Basiswechsel, die Aussage hält das aber nicht fest. Er sagt auch nichts über *jedes* zulässige u_0 *dieser* Zerlegung. Das deckt erst (a): Jede Normalform von `alg` zu einem zulässigen Paar (p, u_0) ist ein `BilinearAlgorithm` über dem Abschluss mit `SN1` und `SN2`. Sie hat die Länge 25, denn R2 verkürzt höchstens, und Yangs Satz 2 (`yang_theorem_two_algorithm`) verbietet weniger als 25. Dass diese Normalform wirklich ein solches Objekt ist, steht nicht als Lean-Satz da, sondern folgt aus der Definition der Normalform. Inhaltlich ist die Behauptung damit gedeckt. Den Teil „ist die Normalform *dieser* Zerlegung“ deckt Lean aber nicht ab.

**(c) Folgerung A1: „In (3,6), (4,7), (5,8) ist Φ surjektiv auf im L × Q³“.**
`corollaryA1`: aus `rk H = rk L + 3` (und nur `SN1`) folgt `range Φ = range Lq × ⊤`. `cases_A1_iff` zeigt, dass `rk H = rk L + 3` unter Satz A genau die drei Fälle bedeutet.
→ **Gedeckt** (schwächere Voraussetzung, gleiche Folgerung).

**(d) Folgerung A1, zweiter Teil: „ker L → Q³/im H ist ein Isomorphismus“.**
→ **Nicht formalisiert.** Der Dateikopf von `SatzA444.lean` sagt das selbst.

**(e) Folgerung A2: „rk L = 5 ⇒ Ĵ = ker W“.**
`corollaryA2`: unter `SN1` und `rk L = 5` gilt `JHat = ker W`, zusätzlich `gU y ∈ JHat` für alle y.
→ **Gedeckt.** Nebenbemerkung: Prosa §3 sagt „alle g(x), x ∈ K^{2×4}“, Lean nur g auf U. Dieser Zusatz steht aber nicht im Wortlaut von B-008.

**(f) Weitere in B-008 genannte Sätze** (gehören nicht zum Wortlaut der Aussage, aber zum Artefakt; Abgleich gegen Prosa §4):
- `lemma13Prime_statement` / `lemma13Prime`: `3ρ + 2s + rk L ≤ 2 rk H` mit s = dim Σ_i F_i(ker Σγ_jF_j) für einen Maximierer γ. Für ganze Zahlen ist das äquivalent zu rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉. Das Lean-s summiert über **alle** drei F_i, die Prosa nach dem Basiswechsel nur über F′_2, F′_3. Beide sind gleich: Auf ker G (G = F′_1) ist jedes F_i eine Linearkombination von F′_2, F′_3 und umgekehrt, weil ξ ∈ GL_3. Den Fall γ = 0 (dann ρ = 0, alle F_i = 0) behandelt Lean gesondert. Die allgemeine Fassung mit e+2 Abbildungen enthält d = 3 als e = 1. → **gedeckt**.
- `sDim_table`: s = 0 in (3,6), (4,7), (5,7) und s ≤ 1 immer, also auch in (5,8). → **gedeckt, leicht stärker** als die Tabelle.
- `exists_common_kernel`: in (3,6), (4,7), (5,7) gibt es x ∈ K⁴, x ≠ 0, mit F_i(x) = 0 für alle i, also N ≠ 0. → **gedeckt.**

### 1.3 Leere Wahrheit und Quantoren

- Die Voraussetzungen `SN1 ∧ SN2` sind nicht aus Versehen unerfüllbar: `lemma6`/`exists_normalized` erzeugen sie für jede Zerlegung über einem unendlichen Körper. Ob es eine Zerlegung der Länge 25 gibt, ist die mathematische Frage selbst. Dass die Aussage leer sein könnte, wenn R(⟨4,2,4⟩) > 25 ist, liegt in der Behauptung, nicht in einem Formalisierungsfehler.
- ρ wird allquantifiziert („jedes ρ mit IsGreatest …“). Ein solches ρ existiert. Die Fallunterscheidung in `corollaryA1` und `exists_common_kernel` steht als Voraussetzung da.
- Körperannahmen: Lean verlangt nirgends algebraische Abgeschlossenheit (stärker). Die globale Form arbeitet mit `AlgebraicClosure K`.

### 1.4 Was dieser Abgleich nicht leisten konnte

Die Definition von g (`gU`) und damit Φ konnte ich nur gegen die Kurzbeschreibung in Prosa §2 und §3 und gegen den Lean-Kommentar abgleichen („g(x) = D(e_{0,1})ℬ(x) − D(e_{0,0})ℬ(e_{0,1}x)“). Die maßgebliche Definition steht in `yang_n4.md` Abschnitt 4, und diese Datei war nicht freigegeben. Folgerung A1 hängt an dieser Definition. A1 ist im Lean-Satz für das definierte Φ bewiesen, und `ker Φ = {0} × ker H` ist dort ebenfalls bewiesen.

### 1.5 Urteil zu B-008

Die Lean-Sätze treffen die Kernaussage von B-008 (Satz A und Folgerung A2) und decken sie in stärkerer Form, nämlich über jedem Körper und für jede normierte Zerlegung. Zwei Teile weichen ab:
1. Der zweite Teil von Folgerung A1 (Isomorphismus ker L → Q³/im H) ist **nicht formalisiert**.
2. Die globale Fassung (`satzA_global`) ist **schwächer** als der Wortlaut. Sie liefert *eine* Normalform über dem Abschluss und sagt nicht, dass sie aus der gegebenen Zerlegung stammt. Der Bezug „für jedes zulässige u_0 *dieser* Zerlegung“ ergibt sich erst über den Allquantor in `SatzAStatement` zusammen mit der (nicht formalisierten) Tatsache, dass jede Normalform eine Zerlegung mit (N1), (N2) und Länge 25 ist.

Format, Indizes, Transposition und Körper sind korrekt. Leere Wahrheit liegt nicht aus Versehen vor.

---

## 2. B-009 (Satz B)

### 2.1 Zusätzliche Definitionen

- `avecs alg t = (α_t(e_{i,0}))_i` = a_t, passt zu Prosa §2.
- `IsSymm alg :⇔ ∃ e : K⁴ ≃ₗ K⁴, ∃ μ : Fin 25 → K, ∀ t y, β_t(emb (e y)) = μ_t · (a_t · y)`. Mit b_t·w = β_t(emb w) heißt das b_t·(G y) = μ_t (a_t·y), also Gᵀ b_t = μ_t a_t mit G = e ∈ GL_4. **Es fehlt die Bedingung μ_t ≠ 0** (siehe 2.2 (b)).
- `SatzAHyp` und `CommonKernelHyp` sind wortgleich mit `SatzAStatement` und mit der Aussage von `exists_common_kernel`, allquantifiziert. Beide werden in `SatzB444Final.lean` durch `satzA_statement` und `exists_common_kernel` erfüllt. Die Endsätze tragen keine offene Voraussetzung mehr.

### 2.2 Teilaussagen von B-009

**(a) „Für jedes zulässige p und generisches u_0: (rk L, rk H) ∈ {(3,6),(5,8)}“.**
`satzB_unbedingt`: für jeden Körper K und jedes `alg` der Länge 25 mit `SN1` und `SN2` gilt (rk L, rk H) = (3,6) oder (5,8).
→ **Von Lean gedeckt, stärker:** Es gilt für *jedes* zulässige u_0, nicht nur für ein generisches, und über jedem Körper. Damit fallen (4,7) und (5,7) für jede Normalform weg.

**(b) „Im Fall (3,6) ist die Zerlegung symmetrisch: Es gibt G ∈ GL_4 mit Gᵀb_t = μ_t a_t, μ_t ≠ 0, für alle t“.**
`satzB_symm_unbedingt`: aus (rk L, rk H) = (3,6) folgt `IsSymm alg`.
→ **Schwächer als die Behauptung.** `IsSymm` verlangt nicht μ_t ≠ 0. Der Beweis (`lemmaV'`) setzt μ_t = β_t(emb x)/a_{t,0}. Das ist null, sobald β_t auf dem Kernvektor x verschwindet, und Lean schließt das nicht aus. Ganz leer ist `IsSymm` nicht: μ ≡ 0 würde β_t∘emb = 0 für alle t erzwingen, im Widerspruch zu (N2). Einzelne μ_t = 0 bleiben aber möglich. Der Dateikopf von `SatzB444.lean` nennt das als bewusste Abweichung („We do not require μ_t ≠ 0“). Die Aussage „μ_t ≠ 0 für alle Terme t“ in B-009 ist also nicht formalisiert. Dass die Symmetrie für alle u_0 statt nur für generische gilt, ist dagegen stärker.

**(c) Globale Form.** `satzB_global_unbedingt`: Zu jedem `alg` über K gibt es ein `alg'` über `AlgebraicClosure K` der Länge 25 mit (N1), (N2) und ((3,6) ∧ `IsSymm alg'`) ∨ (5,8).
→ Wie bei 1.2 (b) **schwächer im Bezug auf die gegebene Zerlegung** (nur Existenz einer Normalform, nicht als Normalform von `alg` ausgewiesen). Den Symmetrieteil trifft die Einschränkung aus (b).

**(d) Bausteine, die B-009 nennt:**
- *Lemma 13′* (rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉): **gedeckt** durch `lemma13Prime` (siehe 1.2 (f)).
- *Lemma V* (gemeinsamer Kern auf einer offenen dichten Menge, Voraussetzung (a) mit Dimension 7, Zariski-Argumente): **nicht formalisiert.** An seiner Stelle steht `lemmaV'`: (N1), (N2) und *ein* gemeinsamer Kernvektor bei *einem* u_0 ergeben `IsSymm`. Die Voraussetzungen sind schwächer, die Folgerung ist schwächer (ohne μ_t ≠ 0).
- *Lemma S* („rk H = 8 − dim Syz₁, also rk H = 8 bei rk L = 5 und bei rk L = 4 für generisches u_0“): **nur teilweise formalisiert.** Gezeigt ist `eight_le_rkH_of_four_le_rkL`: symmetrisch, (N1), (N2) und rk L ≥ 4 ergeben rk H ≥ 8, für jedes zulässige u_0. Dazu `noProd_I` (kein Produkt zweier Linearformen in I) und `finrank_I_add_rkL_le` (dim I + rk L ≤ 6 statt der Gleichung). I ist mit Gewichten μ_t definiert. Nicht formalisiert sind rk H ≤ 8 und die Formel rk H = 8 − dim Syz₁ (Teil 4). Für Satz B reicht die untere Schranke, weil rk H ≤ rk L + 3 aus Satz A kommt.

### 2.3 Leere Wahrheit und Quantoren

Wie in 1.3. `satzB_symm_unbedingt` hat die Fallvoraussetzung (3,6), ein Widerspruch ist darin nicht eingebaut. Die Hypothesen `SatzAHyp` und `CommonKernelHyp` sind in den Endsätzen entfernt. Lean prüft das, und es gilt, weil `satzAHyp_holds`/`commonKernelHyp_holds` Sätze sind.

### 2.4 Urteil zu B-009

Die Hauptaussage von B-009, dass (4,7) und (5,7) unmöglich sind und nur (3,6) und (5,8) bleiben, ist von `satzB_unbedingt` gedeckt, und zwar in stärkerer Form (jedes zulässige u_0, jeder Körper). Die Lean-Sätze treffen B-009 trotzdem **nicht genau**:
1. Die Symmetrie im Fall (3,6) ist **schwächer formalisiert** als behauptet: `IsSymm` enthält „μ_t ≠ 0 für alle t“ nicht.
2. Von den genannten Bausteinen ist Lemma 13′ gedeckt. Lemma V ist **nicht formalisiert**, ersetzt durch Lemma V′. Lemma S ist **nur in der Richtung rk H ≥ 8** formalisiert.
3. Die globale Fassung ist im Bezug auf die gegebene Zerlegung **schwächer** (wie bei B-008).

Für eine Deckung des Wortlauts müsste man entweder μ_t ≠ 0 in Lean beweisen und in `IsSymm` aufnehmen oder den Wortlaut der Behauptung auf die formalisierte Symmetrie ohne μ_t ≠ 0 zurücknehmen. Die Bausteine Lemma V und Lemma S müssten man entweder formalisieren oder aus der Aussage herausnehmen.

---

## 3. Job-Protokoll (Job 139430765012, Lauf 45678041278)

Ausgewertet: nur die `SORRY`-Zeilen und die Axiom-Zeilen zu den genannten Sätzen.

- `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
- `SORRY: 0 'sorry' token(s) in the sources outside comments`
- `depends on axioms: [propext, Classical.choice, Quot.sound]` für: `Lemma13Prime.lemma13Prime`, `SatzA444.lemma13Prime_statement`, `satzA`, `satzA_statement`, `satzA_exists`, `satzA_global`, `corollaryA1`, `corollaryA2`, `sDim_table`, `exists_common_kernel` (aus `SatzA444.lean`, Zeilen 399 bis 408); `SatzB444.satzB_unbedingt`, `satzB_symm_unbedingt`, `satzB_global_unbedingt` (aus `SatzB444Final.lean`, Zeilen 84 bis 86, und erneut im Axiom-Bericht mit `AXIOM-RESULT|…|propext, Quot.sound, Classical.choice`).

Alle genannten Sätze sind ohne `sorry` und nur mit den drei Standard-Axiomen gebaut. Nicht geprüft habe ich, auf welchem Commit der Job lief und ob der Lauf insgesamt grün war, weil ich dafür andere Zeilen hätte lesen müssen. Der Abgleich ergibt nur, dass seit `c2b4b9a` in den Lean-Dateien der Liste nur Kommentare geändert wurden (Abschnitt 0, Punkt 2).

---

## 4. Zusammenfassung

| Teil | Lean | Urteil |
|---|---|---|
| B-008 Satz A (Normalform, jedes zulässige u_0) | `satzA`, `satzA_statement` | gedeckt, stärker (jeder Körper) |
| B-008 globale Form | `satzA_exists`, `satzA_global` | schwächer: Normalform nicht als die von `alg` ausgewiesen |
| B-008 A1 Surjektivität | `corollaryA1` | gedeckt |
| B-008 A1 Isomorphismus | – | nicht formalisiert |
| B-008 A2 | `corollaryA2` | gedeckt |
| Lemma 13′, Tabelle, N ≠ 0 | `lemma13Prime(_statement)`, `sDim_table`, `exists_common_kernel` | gedeckt |
| B-009 (rk L, rk H) ∈ {(3,6),(5,8)} | `satzB_unbedingt` | gedeckt, stärker (jedes u_0, jeder Körper) |
| B-009 Symmetrie in (3,6) mit μ_t ≠ 0 | `satzB_symm_unbedingt` (`IsSymm`) | schwächer: μ_t ≠ 0 fehlt |
| B-009 globale Form | `satzB_global_unbedingt` | schwächer wie bei B-008 |
| B-009 Lemma V | (`lemmaV'` statt dessen) | nicht formalisiert |
| B-009 Lemma S | `eight_le_rkH_of_four_le_rkL` u. a. | nur rk H ≥ 8 formalisiert |
| sorry / Axiome | Job 139430765012 | 0 sorry; nur propext, Classical.choice, Quot.sound |
