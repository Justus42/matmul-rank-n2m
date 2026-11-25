# S2-48: Aussagen-Abgleich zu Lemma P (B-013) und B-015

Auftrag S2-48, Rolle Prüfer, Prüfung nach `PROTOKOLL.md` Abschnitt 5.1 Punkt 3. Abzug: `main` bei Commit `2379d6b` (Beginn des Auftrags). Kein Fremdmodell, keine Anfrage an andere Modelle. Ich setze keinen Status.

## 0. Offenlegung

### 0.1 Eingeblendete Gedächtniseinträge

- Beim Start: der Index `team/silo/MEMORY.md`. Inhalt: Projektrahmen (Repo, Ziel, Protokollversion), Rechte und Grenzen des Orchestrators, Regeln zu Fremdmodell, Vergabe, Merge (Fehler 500) und Budget, Literaturwache. Er nennt zwei Einzeleinträge (`verfahren-datenformat`, `lean-project-ci`) nur mit Namen. Ich habe sie nicht geöffnet. Nichts darin betrifft B-013 oder B-015. Das habe ich dem Orchestrator vor dem ersten Dateizugriff gemeldet.
- Während der Arbeit wurden zwei weitere Einträge eingeblendet, ohne dass ich sie geöffnet habe:
  - `aussagen-abgleich-n3`: Hinweise aus S1-18 (PR #32, `behauptungen/B-006.md`). Darin ein Nebenbefund zu veralteten „(open)“-Kommentaren in `Statements.lean` und `Upper3x2x6.lean`, die Angabe, dass die Bridge das Repo nicht lesen kann, und Hinweise zum lokalen Lean-Bau. Der Eintrag betrifft eine andere Behauptung (B-006) und enthält ein Ergebnis einer früheren Prüfung dazu.
  - `gemini-bridge`: Grenzen der Gemini-Bridge (Repo nicht freigegeben, 60-s-Limit), die Ausgabengrenze des Gemini-Projekts und ein geplanter Nachtrag zu S1-05. Er betrifft weder B-013 noch B-015.

### 0.2 Gelesenes außerhalb der Positivliste oder der erlaubten Abschnitte

- `PROTOKOLL.md`: alle Überschriften (eine Überschriftensuche, um Abschnitt 5 zu finden). Gelesen habe ich nur Abschnitt 5.
- `behauptungen/B-013.md`: Eine Suche nach „Lemma P“ hat die Zeilen 1 (Titel), 4 (der vorangehende Punkt der Aussage), 5 (der Punkt Lemma P) und 7 (Artefakt) gezeigt. Ausgewertet habe ich nur Zeile 5.
- `lean/prosa/s2_444_spurA_r4.md`, `lean/prosa/s2_444_spurA_r9_bruecke.md`, `lean/prosa/yang_n4.md`: Ich habe alle Überschriften gesehen, auch die außerhalb der erlaubten Abschnitte, um die Zeilenbereiche zu finden. Gelesen habe ich nur die erlaubten Abschnitte. Zeile 31 der Brücken-Prosa habe ich ausgelassen. Von `s2_444_spurA_r4.md` habe ich auch den Vorspann von Abschnitt 5 (Zeilen 135 bis 138) gelesen, weil die Behauptung dessen Voraussetzungen ausdrücklich einbezieht.
- Job-Protokoll: Ich habe das ganze Protokoll in eine Arbeitsdatei geladen, um es zu durchsuchen. Angesehen habe ich die ersten drei Zeilen (Kopf des Runners), die zwei `SORRY`-Zeilen und die Axiom-Zeilen zu den genannten Sätzen und zu `SatzE444Buendel`.
- Zwei Befehle wurden von der Umgebung abgelehnt und nicht ausgeführt: eine Suche über alle `*.lean` des Verzeichnisses und ein `ls` des Elternverzeichnisses. Danach habe ich nur noch in den Dateien der Liste gesucht.
- Git: `git status` und `checkout` auf `origin/main` haben die Meldung „HEAD detached from refs/heads/main“ ausgegeben. Ich habe kein `git log` und kein `git diff` benutzt.

### 0.3 Statuswörter und Hinweise auf andere Leser in den gelesenen Stellen

- `lean/prosa/s2_444_spurA_r9_bruecke.md` Zeile 3: „Status aller Aussagen hier: **behauptet**“.
- `lean/prosa/s2_444_spurA_r4.md`, Überschriften: „5.3 … (behauptet)“, „5.4 … (vermutet)“, „5.5 … (behauptet, exakt gerechnet)“, „8.2 … (behauptet)“, „9. Statusübersicht“, „10. Vorschläge für Runde 5 (vermutet)“. In §2: „im Widerspruch zu B-007 (geprüft)“.
- `lean/prosa/s2_444_spurA_r9_bruecke.md`, Überschrift §8: „… Antwort auf die Frage nach ‚Rang fällt bei Körpererweiterung‘“. Das deutet auf eine Frage eines anderen Lesers hin. Den Abschnitt habe ich nicht gelesen.
- Lean-Dateiköpfe: `Basic.lean` („Status of every statement in this project: `behauptet`“), `SatzE444Buendel.lean` („`behauptet`“), `LemmaP444.lean` („`behauptet` (until a statement check per protocol Section 5.1 item 3)“), `Bruecke444.lean` („`behauptet`. Nothing here is `geprüft` before the check of protocol section 5.1“). Die beiden letzten verweisen auf eine Prüfung durch andere Leser.
- `LemmaP444.lean` nennt als Quelle `versuche/s2-32/lemmaP_prosa.md`. Diese Datei habe ich nicht gelesen.
- `yang_n4.md`, Überschriften „10. Liste der gefundenen Lücken“ und „[Lücke L3]“ in §3. Das sind keine Statuswörter.
- Ein früheres Urteil zu B-013 oder B-015 habe ich nicht gesehen.

## 1. Prüfung der Bauten (Job 139447937419, Lauf 45682937335)

- `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
- `SORRY: 0 'sorry' token(s) in the sources outside comments`
- Axiom-Zeilen, alle mit `[propext, Classical.choice, Quot.sound]`:
  - `LemmaP444`: `main`, `lemmaP`, `dichotomie'`, `nur_unterfallB'`, `nur_unterfallB_global'` (Zeilen 925 bis 929)
  - `SatzE444Buendel`: `sDim_eq_one`, `commonKernel_trivial`, `dichotomie`, `nur_unterfallB`, `nur_unterfallB_global` (Zeilen 208 bis 212)
  - `Bruecke444`: `descent`, `isSymm_descent`, `genSN1L`, `genSN2L`, `nichtSymm_genAlgL`, `bruecke`, `bruecke_exists`, `brueckeStatement` (Zeilen 555 bis 561 und 564)
- Die Zeilennummern im Protokoll stimmen mit den `#print axioms`-Zeilen der Dateien auf meinem Abzug überein. Das ist ein Hinweis, dass der Job diese Fassung gebaut hat. Den Commit des Jobs habe ich nicht abgeglichen, weil das außerhalb meiner Leseerlaubnis liegt.
- `LemmaPStatement`, `Kstern`, `UnterfallAVoll`, `UnterfallB`, `NichtSymmetrisch` und `BrueckeStatement` sind Definitionen ohne Beweisinhalt.

## 2. Zurückverfolgte Definitionen (gemeinsam für beide Teile)

- `BilinearAlgorithm K n l m r` (`Basic.lean`): `alpha t`, `beta t` sind lineare Formen auf `n×l`- und `l×m`-Matrizen, `coeff t` sind `n×m`-Matrizen, und es gilt `A * B = ∑ t (alpha t A * beta t B) • coeff t` (Mathlib-Matrixprodukt). Das ist die Zerlegung (Z) aus `yang_n4.md` §1. Hier gilt n = m = 4, l = 2, r = 25.
- `eA i j = unitMatrix i j` ist e_{i,j}. `fv alg i x = (α_t(e_{i,0}) · β_t(x))_t` ist f_i(x) = D(e_{i,0})ℬ(x) (§3). `emb y` ist die 2×4-Matrix (0; y), deren Zeile 0 null ist. Das ist U aus §4. `φ i = fv i ∘ emb` ist f_i auf U. `J = range (φ 0)` ist J = f_0(U). `Fq i = π ∘ φ (i+1)` mit `i : Fin 3` ist F_1, F_2, F_3, abgebildet in den Quotienten `(Fin 25 → K) ⧸ J`. `Lq = sumMap Fq` ist L. `Hq = skewExt Lq` auf `skewSpace` (Diagonale 0, alternierend) ist H.
- Q = ker W / J heißt in Lean `Kbar`. Die F_i bilden in den größeren Raum `(Fin 25 → K) ⧸ J` ab. Ränge von Bildern ändern sich dadurch nicht.
- `SN1`: α_t(e_{0,0}) ≠ 0 für alle t, das ist (N1). `SN2`: Für v ≠ 0 sind f_0(v), …, f_3(v) linear unabhängig, das ist (N2).
- `SatzB444.IsSymm`: Es gibt einen linearen Automorphismus e von K⁴ und μ : Fin r → K mit β_t(emb (e y)) = μ_t · ∑_i y_i a_{t,i} für alle t und y. Dabei ist `avecs t i = α_t(e_{i,0})`. Mit E als Matrix von e gilt β_t(emb(Ey)) = ∑_i y_i ∑_j E_{ji} b_{tj} mit b_{tj} = β_t(emb e_j) = β_t(e_1 e_jᵀ). Die Bedingung ist also Eᵀ b_t = μ_t a_t mit G = E, und μ_t = 0 ist erlaubt. `NichtSymmetrisch = ¬ IsSymm`.
- Benutzte Mathlib-Begriffe: `Module.finrank`, `LinearMap.range` und `ker`, `Submodule` mit `⨆` und `K ∙ q` (Spann), Quotientenmodul `⧸`, `LinearIndependent`, `LinearEquiv`, `Matrix.det`, `MvPolynomial`, `FractionRing`, `AlgebraicClosure`, `IsAlgClosed`, `Infinite`. Alle werden in ihrer üblichen Bedeutung verwendet.

## 3. Teil 1: Lemma P (Punkt in B-013)

### 3.1 Lean-Seite

- `Omega alg = {γ ∈ K³ : rk F_γ = 3}`, `Kstern alg = ⨆_{γ ∈ Ω} ker F_γ`.
- `UnterfallAVoll`: dim K* = 2, es gibt γs ≠ 0 mit K* ⊆ ker F_γs, und es gibt q ≠ 0 mit F_i(K*) ⊆ K·q für i = 1, 2, 3.
- `UnterfallB`: dim K* = 3, es gibt γs ≠ 0 mit K* ⊆ ker F_γs und rk F_γs = 1, und es gibt einen Unterraum Q2 der Dimension 2 mit F_i(K*) ⊆ Q2 für i = 1, 2, 3.
- `LemmaPStatement K`: Für jede Zerlegung der Länge 25 über K mit SN1, SN2, (rk L, rk H) = (5,8) und ohne gemeinsamen Kernvektor (∀x, (∀i, F_i x = 0) → x = 0) gilt `UnterfallAVoll ∨ UnterfallB`.
- `lemmaP (K) [Infinite K] : LemmaPStatement K`.
- `dichotomie' [Infinite K]`: Dieselbe Folgerung mit `NichtSymmetrisch alg` statt der Kern-Voraussetzung. Der Kern ist dann nach `commonKernel_trivial` trivial.
- `nur_unterfallB' [IsAlgClosed K]`: SN1, SN2, (5,8) und `NichtSymmetrisch` ergeben `UnterfallB`. Der Satz benutzt zusätzlich `satzE`.
- `nur_unterfallB_global' K alg`: Es gibt ein alg' über `AlgebraicClosure K` mit SN1 und SN2, sodass (5,8) und `NichtSymmetrisch alg'` zusammen `UnterfallB alg'` ergeben.

### 3.2 Abgleich der Voraussetzungen

| Prosa (B-013, Lemma P) | Lean | Urteil |
|---|---|---|
| Zerlegung von ⟨4,2,4⟩ der Länge 25 in Yangs Normalform | `BilinearAlgorithm K 4 2 4 25` mit `SN1`, `SN2` | gedeckt |
| K algebraisch abgeschlossen | `lemmaP`, `dichotomie'`: nur `[Infinite K]`. `nur_unterfallB'`: `[IsAlgClosed K]` | Lean ist **stärker**, weil es weniger voraussetzt. Algebraisch abgeschlossene Körper sind unendlich. Dass die Instanz greift, zeigt der Bau von `nur_unterfallB'`, der `lemmaP K` unter `[IsAlgClosed K]` aufruft. |
| p ∈ P_ns fest, u_0 zulässig und generisch | Die Normalform legt u_0 = e_0 und p fest, verlangt wird nur „zulässig“ (SN1, SN2). Generizität wird nicht verlangt. | Lean ist **stärker**: Es gilt für jede zulässige Normalform. |
| N(u_0) = 0 | `LemmaPStatement`: kein gemeinsamer Kernvektor von F_1, F_2, F_3. `dichotomie'`, `nur_unterfallB'`: `NichtSymmetrisch` | gedeckt. In `dichotomie'` wird N = 0 aus der Nicht-Symmetrie hergeleitet, wie in Folgerung C2. |
| s = 1, ρ = 3 | nicht vorausgesetzt, sondern hergeleitet (`satzA`, `sDim_eq_one`) | Lean ist stärker oder gleich. |
| rk L = 5, rk H = 8 | `hcase` = (5,8). Benutzt wird nur rk L = 5. | gedeckt |
| F_γ = ∑_{i=1}^3 γ_i F_i : U → Q | `Fc alg γ = ∑ γ_i • Fq i`, `Fq i` = F_{i+1} | gedeckt, die Indizes sind um eins verschoben und stimmen überein |
| „generisches γ“: rk F_γ = 3, ker F_γ = K·k(γ) | Ω = alle γ mit rk F_γ = 3. dim ker = 1 wird bewiesen (`finrank_ker_Fc`). | siehe 3.4 |

### 3.3 Abgleich der Aussage

| Prosa | Lean | Urteil |
|---|---|---|
| Es gibt γ* ≠ 0 mit F_{γ*} k(γ) = 0 für alle generischen γ | in beiden Unterfällen: γs ≠ 0 und `Kstern ≤ ker F_γs`. Das gilt für **alle** γ ∈ Ω. | gedeckt, für alle Maximierer statt nur für generische (stärker) |
| dim K* ∈ {2, 3} und F_{γ*}(K*) = 0 | Die Disjunktion legt dim 2 oder dim 3 fest, und `Kstern ≤ ker F_γs` gilt in beiden Fällen | gedeckt |
| Unterfall A: dim K* = 2, q ∈ Q, q ≠ 0, F_γ(K*) ⊆ K·q für alle γ | `UnterfallAVoll`: dieselben Bedingungen, mit F_i statt F_γ und mit q im Raum `(Fin 25 → K) ⧸ J` statt in Q | gleichwertig. F_γ = ∑ γ_i F_i ist linear in γ, und F_i ist F_{e_i}. Wegen N = 0 und dim K* = 2 ist F_i(K*) ≠ 0 für ein i, also ist q ein Vielfaches eines Elements von Q, und q liegt in Q. |
| Unterfall B: dim K* = 3, rk F_{γ*} = 1, F_γ(K*) ⊆ Q_2 für alle γ, dim Q_2 = 2 | `UnterfallB`: dieselben Bedingungen für dasselbe γs, mit Q2 als Unterraum von `(Fin 25 → K) ⧸ J` | gleichwertig. Formal ist die Lean-Fassung schwächer, weil Q2 nicht in Q liegen muss. Aber ∑_i F_i(K*) ⊆ Q2 ∩ Q hat Dimension ≤ 2, und es lässt sich in Q auf Dimension 2 ergänzen, weil Q ⊇ range L mit rk L = 5. Diese Umrechnung steht nicht in Lean, sie ist elementar. |
| „in einer Basis mit γ* = e_3“ | basisfrei | Das ist keine inhaltliche Bedingung. |

Die Disjunktion schließt sich in Lean wie in der Prosa wegen der verschiedenen Dimensionen von selbst aus.

### 3.4 Die eine Abweichung in der Lesart: K*

Die Prosa definiert K* = span{k(γ) : γ generisch}. Lean nimmt die Summe der Kerne über **alle** γ ∈ Ω. Also gilt K*_Prosa ⊆ `Kstern`. Die Dimensionsaussagen und die Unterfälle beziehen sich in Lean auf den möglicherweise größeren Raum.

Mein Argument für die Gleichheit (nicht formalisiert): Über einem unendlichen Körper ist Ω eine nichtleere Zariski-offene Menge in K³. „Generisch“ heißt: in einer nichtleeren offenen Teilmenge G ⊆ Ω. Zu γ ∈ Ω wählt man drei Zeilen der Koordinatenmatrix von F_γ mit Rang 3. Der Vektor c(γ′) ihrer vorzeichenbehafteten 3×3-Minoren ist polynomial in γ′ und spannt ker F_{γ′} auf, wo er nicht verschwindet und rk F_{γ′} = 3 gilt. Die linearen Bedingungen „c(γ′) ∈ K*_Prosa“ sind Polynome, die auf der nichtleeren offenen Menge G ∩ {c ≠ 0} verschwinden. Über einem unendlichen Körper sind sie deshalb das Nullpolynom, und es folgt ker F_γ ⊆ K*_Prosa. Also ist `Kstern` = K*_Prosa, für jede Lesart von „generisch“ als nichtleer offen. Die Lean-Fassung ist damit eine präzise Lesart derselben Aussage. Diese Lesart ist auch die, mit der `satzE` und `UnterfallB` in den späteren Sätzen arbeiten.

### 3.5 Die Sätze, die über den Punkt Lemma P hinausgehen

- `nur_unterfallB'` verbindet Lemma P mit Satz E (`satzE`, Unterfall A ausgeschlossen) und mit der Nicht-Symmetrie. Die Aussage lautet: algebraisch abgeschlossen, SN1, SN2, (5,8), nicht symmetrisch ⇒ `UnterfallB`. Den Teil Satz E habe ich nicht abgeglichen, er ist nicht Teil meines Auftrags. Der Teil Lemma P darin ist durch `lemmaP` gedeckt.
- `nur_unterfallB_global'`: Das existierende alg' ist im Satz **nicht an das eingegebene alg gebunden**. Im Beweis entsteht es aus der Normalisierung von `alg.baseChange` (`satzA_exists`), aber die Aussage sagt das nicht. Außerdem stehen (5,8) und die Nicht-Symmetrie als Voraussetzungen über alg′ im Satz. Inhaltlich ist der Satz deshalb nur: „Gibt es eine Zerlegung der Länge 25 über K, dann gibt es eine normalisierte über K̄, für die `nur_unterfallB'` gilt.“ Der Punkt Lemma P in B-013 behauptet keine globale Fassung. Der Satz ist also kein Mangel des Abgleichs, aber er ist schwächer, als sein Name vermuten lässt.

### 3.6 Urteil Teil 1

**Die Lean-Sätze decken den Punkt Lemma P aus B-013.** `lemmaP` mit `LemmaPStatement`, `UnterfallAVoll` und `UnterfallB` sagt das, was die Prosa sagt. Bei den Voraussetzungen ist Lean stärker: Es braucht nur einen unendlichen Körper statt eines algebraisch abgeschlossenen, und es braucht keine Generizität von u_0 und p. Bei der Aussage ist Lean gleich oder stärker: γ* gilt für alle Maximierer. Die beiden Unterfall-Prädikate sind gleichwertig mit der Prosa. Eine Lücke bleibt nur in der Lesart. K* ist in Lean über alle γ ∈ Ω gebildet und nicht über generische γ. Nach meinem Argument in 3.4 sind beide Räume gleich, das ist aber nicht formalisiert. `nur_unterfallB_global'` bindet sein alg′ nicht an das eingegebene alg (3.5).

## 4. Teil 2: B-015

### 4.1 Lean-Seite

- `GBar K = AlgebraicClosure (GField K)` mit `GField K = FractionRing (MvPolynomial (Var 3) K)` und `Var 3 = (Fin 4 × Fin 4) ⊕ (Fin 2 × Fin 2)`. Das sind 20 Unbestimmte. `Sg = matS xg` (Einträge `inl (i,j)`) ist eine 4×4-Matrix, `Tg = matT xg` (Einträge `inr (i,j)`) ist eine 2×2-Matrix. Das ist F = K(S,T) und L = sein algebraischer Abschluss nach Mathlib. `AlgebraicClosure` ist algebraisch abgeschlossen (Mathlib-Instanz, in `bruecke_exists` und `brueckeStatement` per `inferInstance` benutzt und gebaut) und algebraisch über F.
- `genAlgL alg = changeBasis (alg.baseChange (GBar K)) (Sg.map ι) (Tg.map ι)`. `baseChange` (`YangN3Teil1.lean`) setzt die Formen über ihre Koeffizienten fort und bildet `coeff` eintragsweise ab. `changeBasis` (`YangN3Teil2.lean`) ergibt α′_t(A) = α_t(S A T), β′_t(B) = β_t(T⁻¹ B) und C′_t = S⁻¹ C_t.
- `bruecke alg`: SN1, SN2, (rk L, rk H) = (5,8) und `NichtSymmetrisch`, jeweils für `genAlgL alg`.
- `bruecke_exists alg`: ∃ L : Type u, Field L, IsAlgClosed L, ∃ alg′ der Länge 25 über L mit SN1, SN2, (5,8) und `NichtSymmetrisch`.
- `brueckeStatement K : BrueckeStatement K`, mit `BrueckeStatement K := ∀ _alg, ∃ L (alg. abgeschlossen) ∃ alg′ : SN1 ∧ SN2 ∧ NichtSymmetrisch` (ohne (5,8)).
- `descent [Infinite F] [Algebra F L]`: Hat ∑_j E_{ji} b_{tj} = μ_t a_{ti} für alle t, i eine Lösung über L mit det E ≠ 0, dann hat es eine über F mit det E₀ ≠ 0.
- `isSymm_descent`: Stimmen a und b von B′ über L bis auf ι mit denen von B über dem unendlichen Körper F überein und ist B′ symmetrisch, dann ist B symmetrisch.
- `genSN1L` (Voraussetzung: kein α_t = 0), `genSN2L` (ohne Voraussetzung), `nichtSymm_genAlgL` (r ≤ 25).

### 4.2 Abgleich Teil für Teil

| B-015 | Lean | Urteil |
|---|---|---|
| **Brücke:** K beliebiger Körper, (Z) Zerlegung der Länge 25 | `bruecke {K} [Field K] (alg : BilinearAlgorithm K 4 2 4 25)` | gedeckt |
| F = K(S,T), S eine 4×4- und T eine 2×2-Matrix von Unbestimmten, L = algebraischer Abschluss von F | `GField K`, `Sg`, `Tg`, `GBar K` (4.1) | gedeckt |
| Die generische Normalform über L entsteht aus (Z) durch Skalarerweiterung und den Basiswechsel mit S, T | `genAlgL alg` ist als Term aus `alg` definiert: `changeBasis (alg.baseChange L) (S.map ι) (T.map ι)` | gedeckt. Die Zerlegung **ist an die eingegebene gebunden**, und zwar über ihre Definition. Die Form des Basiswechsels (S A T, T⁻¹ B, S⁻¹ C) legt B-015 nicht fest. Sie ist die aus `yang_n4.md` (R3). |
| L algebraisch abgeschlossen | `GBar K` ist `AlgebraicClosure …`, die Mathlib-Instanz liefert `IsAlgClosed` | gedeckt. In `bruecke` steckt das im Typ, in `bruecke_exists` steht es ausdrücklich in der Aussage. |
| erfüllt (N1) und (N2) | `SN1`, `SN2` von `genAlgL alg` | gedeckt |
| Fall (rk L, rk H) = (5,8) | `finrank (range Lq) = 5`, `finrank (range Hq) = 8` | gedeckt |
| nicht symmetrisch: keine invertierbare G über L und keine μ_t ∈ L (0 erlaubt) mit Gᵀ b_t = μ_t a_t, a_t = (α_t(e_{i0}))_i, b_t = (β_t(e_1 e_jᵀ))_j | `NichtSymmetrisch (genAlgL alg)` = ¬ `IsSymm`. Nach §2 ist das genau diese Bedingung, mit G = Matrix von e, μ beliebig, b_{tj} = β_t(emb e_j) = β_t(e_1 e_jᵀ). | gedeckt. Transposition und Indizes stimmen: ∑_j E_{ji} b_{tj} = (Eᵀ b_t)_i. |
| **Existenzfassung:** zu jeder Zerlegung über K gibt es ein algebraisch abgeschlossenes L und eine Zerlegung der Länge 25 über L mit (N1), (N2), (5,8) und nicht symmetrisch | `bruecke_exists` | gedeckt. Wie in B-015 ist alg′ hier nicht an alg gebunden („eine Zerlegung“). L liegt im selben Universum wie K. |
| — (in B-015 nicht eigens formuliert, im Artefakt genannt) | `brueckeStatement` / `BrueckeStatement` | **schwächer** als die Existenzfassung, weil (5,8) fehlt, und ebenfalls nicht an die Eingabe gebunden (`_alg` wird nicht benutzt). `Endsatz444.lean` erklärt das als Absicht: (5,8) wird dort aus der Nicht-Symmetrie über Satz B hergeleitet. Gegen B-015 ist das kein Widerspruch, weil `bruecke_exists` die volle Fassung liefert. |
| **Abstieg:** F unendlich, L ⊇ F, Lösung (E, μ) über L mit det E ≠ 0 ⇒ Lösung über F | `descent` mit `[Infinite F]`, `[Algebra F L]` (für Körper ein injektiver Homomorphismus, also eine Körpererweiterung), a, b : Fin r → Fin 4 → F, Bilder unter `algebraMap` | gedeckt, gleich in Format und Indizes (j summiert, E_{ji}) |
| (Hilfssätze) | `isSymm_descent`, `genSN1L`, `genSN2L`, `nichtSymm_genAlgL` | Das sind die Zwischenschritte aus Prosa §3 bis §5. Ihre Aussagen sind wie angegeben. `isSymm_descent` verbindet `descent` richtig mit `IsSymm` (gleiches r, Koordinaten bis auf ι gleich). |

### 4.3 Leere Wahrheit

Alle Sätze außer `descent` quantifizieren über Zerlegungen der Länge 25. Gibt es keine, sind sie leer wahr. Das gilt aber genauso für B-015 und ist der Zweck der Kette. Es ist kein Mangel der Formalisierung. Die Voraussetzungen der Sätze widersprechen sich nicht von vornherein: `bruecke` hat außer der Zerlegung keine Voraussetzung. `descent` ist nicht leer, die Voraussetzung ist zum Beispiel mit L = F und E = 1 erfüllbar, sobald b = a gilt.

### 4.4 Urteil Teil 2

**Die Lean-Sätze decken B-015 in allen drei Teilen.** `bruecke` ist die Brücke. Die Zerlegung `genAlgL alg` ist durch ihre Definition an die eingegebene gebunden, und zwar durch Skalarerweiterung und den Basiswechsel mit den generischen S und T. Der Körper `AlgebraicClosure K(S,T)` ist nach Mathlib algebraisch abgeschlossen. `bruecke_exists` ist die Existenzfassung, nicht gebunden, wie in B-015 behauptet. `descent` ist der Abstieg, gleich in der Form. `brueckeStatement` ist schwächer als die Existenzfassung, weil der Fall (5,8) fehlt und die Eingabe nicht gebunden ist. B-015 behauptet ihn nicht eigens.

## 5. Zusammenfassung

- Teil 1 (Lemma P): gedeckt, bei den Voraussetzungen stärker (unendlicher statt algebraisch abgeschlossener Körper, keine Generizität). Die einzige Abweichung ist die Lesart von K* (über alle Maximierer statt über generische γ). Nach meinem nicht formalisierten Argument sind beide Räume gleich. `nur_unterfallB_global'` bindet sein alg′ nicht an die Eingabe.
- Teil 2 (B-015): gedeckt in Brücke, Existenzfassung und Abstieg. Die Brücke ist an die Eingabe gebunden, der Körper ist algebraisch abgeschlossen. `brueckeStatement` ist schwächer (ohne (5,8), ungebunden).
- Bauten: 0 sorry. Alle genannten Sätze hängen nur von `propext`, `Classical.choice` und `Quot.sound` ab.
