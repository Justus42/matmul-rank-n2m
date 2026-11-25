# S2-47: Aussagen-Abgleich Lemma P (B-013) und B-015, Bericht des Prüfers

Auftrag S2-47 des Orchestrators, Rolle Prüfer. Grundlage: `PROTOKOLL.md` Abschnitt 5.1 Punkt 3.
Gelesener Stand: `main` bei Commit `2379d6b`. Kein Fremdmodell befragt. Kein Status gesetzt.

---

## 0. Offenlegung

### 0.1 Eingeblendete Gedächtniseinträge

Beim Start eingeblendet (vor dem ersten Lesen dem Orchestrator gemeldet):

- `MEMORY.md` (Index): Projektrahmen, Rechte und Grenzen des Orchestrators, Regeln für Fremdmodelle, Vergaberegeln für Prüfer und Blind-Sucher, Hinweise zum Mergen, Budget nach Abschnitt 6, Literaturwache. Er verweist auf die Einzeleinträge `verfahren-datenformat` und `lean-project-ci`. Deren Inhalt wurde mir nicht gezeigt, ich habe sie nicht geöffnet.

Während der Arbeit zusätzlich eingeblendet (nicht von mir geöffnet):

- `aussagen-abgleich-n3`: Praxishinweise eines früheren Auftrags S1-18 (PR #32, `behauptungen/B-006.md`): veraltete „(open)“-Kommentare in `Statements.lean` und `Upper3x2x6.lean`, die Bridge kann das Repo nicht lesen, Hinweise zum lokalen Lean-Bau.
- `abgleich-yang-n4-b007`: Praxishinweise eines früheren Auftrags S1-19 (PR #30, `behauptungen/B-007.md`): Bridge kann das Repo nicht lesen, Lean-Werkzeugkette lokal nicht ladbar.
- `git-regeln`: Git-Regeln seit Protokoll 0.2 (Zieldatei ohne Rückfrage committen, PR mit Auftragsnummer, Rückfragen an den Orchestrator).

Keiner dieser Einträge enthielt ein Prüfurteil zu B-013 oder B-015. Sie haben mein Urteil nicht berührt.

### 0.2 Gelesenes außerhalb der Positivliste oder über die Abschnittsgrenzen hinaus

- `behauptungen/B-013.md`: Um den Punkt Lemma P zu finden, habe ich die Datei mit `grep` durchsucht. Dabei habe ich auch Zeile 1 (Titel), Zeile 4 (Hauptaussage mit Satz E und Unterfall B) und die Zeilen 6 bis 8 (Herkunft, Artefakt, Lean-Artefakt mit PR-Nummern #60 und #64) gesehen. Mein Urteil stützt sich nur auf den Punkt Lemma P (Zeile 5).
- Die Überschriftenlisten von `s2_444_spurA_r4.md`, `s2_444_spurA_r9_bruecke.md` und `yang_n4.md` (per `grep '^#'`), um die Zeilenbereiche zu finden. Gelesen habe ich danach nur die erlaubten Abschnitte. In `s2_444_spurA_r9_bruecke.md` habe ich §1 bis §7 ohne Zeile 31 gelesen.
- `PROTOKOLL.md`: Überschriftenliste per `grep`, dann nur Abschnitt 5.
- Ein `grep -rl baseChange` über `lean/YangBounds/` zeigte Dateinamen. Alle stehen auf der Liste.
- Job-Protokoll: Ich habe es vollständig heruntergeladen, aber nur nach `SORRY`-Zeilen und nach den Axiom-Zeilen der genannten Sätze durchsucht. Eine Abfrage der Job-Metadaten (Ergebnis, Commit) wurde von der Umgebung abgelehnt. Ob der Lauf denselben Commit gebaut hat wie den, den ich gelesen habe, konnte ich deshalb nicht prüfen.

### 0.3 Statuswörter und Hinweise auf andere Leser in den erlaubten Stellen

- `s2_444_spurA_r4.md`: In den Überschriften stehen „5.3 … (behauptet)“, „5.4 … (vermutet)“, „5.5 … (behauptet, exakt gerechnet)“, „8.2 … (behauptet)“, „10. … (vermutet)“, dazu „9. Statusübersicht“. In §2 steht „im Widerspruch zu B-007 (geprüft)“.
- `s2_444_spurA_r9_bruecke.md`, Zeile 3: „Status aller Aussagen hier: **behauptet**.“
- Dateiköpfe in Lean: `Basic.lean` („Status of every statement in this project: `behauptet`“), `SatzE444Buendel.lean`, `LemmaP444.lean` („`behauptet` (until a statement check per protocol Section 5.1 item 3)“), `Bruecke444.lean` („`behauptet`. Nothing here is `geprüft` before the check …“). `SatzC444Generisch.lean` nennt in einem Docstring „B-012, Satz C“.
- `LemmaP444.lean` verweist auf eine Prosa `versuche/s2-32/lemmaP_prosa.md`, die ich nicht gelesen habe.
- Hinweise auf andere Leser oder frühere Prüfurteile habe ich nicht gesehen.

---

## 1. Abgleich Lemma P (Punkt in `behauptungen/B-013.md`)

### 1.1 Die Lean-Seite, bis auf Mathlib zurückverfolgt

- `BilinearAlgorithm K n l m r` (`Basic.lean`): Formen `alpha t`, `beta t`, Matrizen `coeff t` mit `A * B = ∑ t, (alpha t A * beta t B) • coeff t` für alle A, B. Das ist (Z) aus `yang_n4.md` §1.
- `SN1`, `SN2` (`YangN4Haupt.lean`, `d = 3`, also 4 Zeilen): `SN1`: `alpha t (e_{0,0}) ≠ 0` für alle t, also (N1). `SN2`: für jedes `v ≠ 0` sind `fv i v = (α_t(e_{i,0}) β_t(v))_t`, i = 0..3, linear unabhängig, also (N2) aus `yang_n4.md` §3.
- `emb y` = 2×4-Matrix mit Zeile 0 gleich 0 und Zeile 1 gleich y. Das parametrisiert U = {x : Zeile 0 von x ist 0} aus §4.
- `φ i = fv i ∘ emb`, `J = range (φ 0)` = f_0(U), `Fq i = π ∘ φ (i.succ)` mit `π` der Quotientenabbildung nach `(Fin r → K) ⧸ J`. Lean-Index `i : Fin 3` entspricht dem Prosa-Index i + 1, also F_1, F_2, F_3. `Lq = sumMap Fq` ist L, `Hq = skewExt Lq` ist H (mit `skewSpace` = alternierende Matrizen mit Nulldiagonale, wie in §4).
- `Fc alg γ = ∑ γ_i • Fq i` = F_γ. `Omega` = {γ : rk F_γ = 3}. `Kstern = ⨆_{γ ∈ Omega} ker F_γ`.
- `UnterfallAVoll`: `dim Kstern = 2` ∧ ∃ γs ≠ 0 mit `Kstern ≤ ker F_{γs}` ∧ ∃ q ≠ 0 mit `F_i(Kstern) ⊆ K∙q` für i = 1, 2, 3.
- `UnterfallB`: `dim Kstern = 3` ∧ ∃ γs ≠ 0 mit `Kstern ≤ ker F_{γs}` ∧ `rk F_{γs} = 1` ∧ ∃ Q2 mit `dim Q2 = 2` und `F_i(Kstern) ⊆ Q2` für i = 1, 2, 3.
- `NichtSymmetrisch alg = ¬ IsSymm alg`, `IsSymm`: ∃ lineare Bijektion e von K⁴ und μ mit `β_t(emb (e y)) = μ_t · (a_t · y)` für alle t, y, wobei `a_t = (α_t(e_{i,0}))_i` (`avecs`).
- `LemmaPStatement K`: Für jede Zerlegung der Länge 25 über K mit `SN1`, `SN2`, `(rk Lq, rk Hq) = (5, 8)` und ohne gemeinsamen Kernvektor von F_1, F_2, F_3 gilt `UnterfallAVoll ∨ UnterfallB`.
- `lemmaP (K) [Infinite K] : LemmaPStatement K`.
- `dichotomie' [Infinite K]`: `SN1`, `SN2`, Fall (5,8), `NichtSymmetrisch` ⟹ `UnterfallAVoll ∨ UnterfallB`.
- `nur_unterfallB' [IsAlgClosed K]`: dieselben Voraussetzungen ⟹ `UnterfallB`.
- `nur_unterfallB_global' K`: Zu jedem `alg` über beliebigem K gibt es ein `alg'` über `AlgebraicClosure K` mit `SN1`, `SN2` und (Fall (5,8) → `NichtSymmetrisch` → `UnterfallB`).

Endpunkte in Mathlib: `Module.finrank`, `LinearMap.range`, `LinearMap.ker`, `Submodule` mit `⨆`, `K ∙ q` (`Submodule.span K {q}`), Quotient `⧸`, `LinearIndependent`, `LinearEquiv`, `IsAlgClosed`, `AlgebraicClosure`, `Infinite`. Keine dieser Stellen weicht von der üblichen Bedeutung ab.

### 1.2 Teil für Teil

| Teil der Prosa (Punkt Lemma P) | Lean | Urteil |
|---|---|---|
| Zerlegung von ⟨4,2,4⟩ der Länge 25 in Yangs Normalform | `BilinearAlgorithm K 4 2 4 25`, `SN1`, `SN2` | gedeckt |
| K algebraisch abgeschlossen | `lemmaP`, `dichotomie'` verlangen nur `[Infinite K]` | Lean stärker (schwächere Voraussetzung) |
| p ∈ P_ns fest, u_0 zulässig und generisch | nicht als Voraussetzung vorhanden. Lean arbeitet an der gegebenen Normalform, deren Basis die Rolle von (u_0, p) übernimmt. Eine Generizität von u_0 wird nicht verlangt | Lean stärker (Voraussetzung entfällt); siehe 1.3 a |
| N(u_0) = 0 | `∀ x, (∀ i, F_i x = 0) → x = 0` in `LemmaPStatement`; in `dichotomie'`/`nur_unterfallB'` aus `NichtSymmetrisch` abgeleitet (`commonKernel_trivial`) | gedeckt, unter dem Vorbehalt 1.3 b |
| s = 1, ρ = 3 | nicht vorausgesetzt, in Lean hergeleitet (`sDim_eq_one`, `satzA`) | Lean stärker |
| rk L = 5, rk H = 8 | `(rk Lq, rk Hq) = (5, 8)` | gedeckt |
| F_γ = Σ γ_i F_i : U → Q | `Fc alg γ`, Ziel `(Fin r → K) ⧸ J` statt Q = ker W / J | gedeckt; siehe 1.3 c |
| generisches γ: rk F_γ = 3, ker F_γ = K·k(γ) | `Omega` = alle γ mit rk 3; `finrank_ker_Fc`: dim ker = 1 | gedeckt (Lean nimmt alle γ mit Rang 3, nicht nur generische) |
| ∃ γ* ≠ 0 mit F_{γ*} k(γ) = 0 für alle generischen γ, und F_{γ*}(K*) = 0 | in beiden Unterfällen: `γs ≠ 0 ∧ Kstern ≤ ker F_{γs}` | gedeckt, für alle γ ∈ Omega, also mindestens so stark |
| K* := span{k(γ)} | `Kstern = ⨆_{γ ∈ Omega} ker F_γ` | anders gefasst, mathematisch gleich; siehe 1.3 d |
| dim K* ∈ {2, 3} | steckt in der Disjunktion (`= 2` bzw. `= 3`) | gedeckt |
| Unterfall A: dim K* = 2, q ≠ 0 mit F_γ(K*) ⊆ K·q für alle γ | `UnterfallAVoll`, Bedingung für F_1, F_2, F_3 | gedeckt (für alle γ gleichwertig, da K·q ein Unterraum ist); siehe 1.3 c |
| Unterfall B: dim K* = 3, rk F_{γ*} = 1, F_γ(K*) ⊆ Q_2 fest, dim Q_2 = 2 | `UnterfallB` | gedeckt; siehe 1.3 c |
| „in einer Basis mit γ* = e_3“ | entfällt, Lean ist basisfrei | ohne Belang |

### 1.3 Einzelheiten

a) **Generizität.** Die Prosa fixiert p ∈ P_ns und ein generisches u_0. Lean verlangt weder das eine noch das andere und beweist die Dichotomie für jede Normalform mit den übrigen Voraussetzungen. Das ist eine Verstärkung. Ein Vorbehalt in die Gegenrichtung entsteht nicht.

b) **N(u_0) und Nicht-Symmetrie.** Die Definition von N(u_0) und von P_ns steht in Texten, die ich nicht lesen durfte (S2-05, Folgerung C2 in §4 von `s2_444_spurA_r4.md`). Aus dem erlaubten §5.1 geht hervor, dass N die gemeinsamen Kernvektoren der F_i bezeichnet („Ein gemeinsamer Kernvektor ist ausgeschlossen (er läge in N)“, „k_λ ist nicht konstant, sonst wäre k ∈ N(u_0)“). Lean fasst N(u_0) = 0 genau so. `NichtSymmetrisch` ist punktweise an der gegebenen Normalform (also am festen p) formuliert, nicht als „keine offene Menge P“ wie die Definition „symmetrisch“ in §2. Für `LemmaPStatement` selbst spielt das keine Rolle, weil dort N = 0 direkt vorausgesetzt ist. Für `dichotomie'` und `nur_unterfallB'` ist `NichtSymmetrisch` eine Voraussetzung, die ich mit „p ∈ P_ns“ nur über den Wortlaut von §5 identifizieren kann.

c) **Zielraum.** `Fq` landet in `(Fin r → K) ⧸ J`, nicht im Unterraum Q = ker W / J. Die Bilder der F_i liegen in Q (f_i(U) ⊆ ker W, Lemma 4.1 (i) in `yang_n4.md`). Für Rang- und Dimensionsaussagen ändert das nichts. Bei q und Q_2 lässt Lean formal Elemente außerhalb von Q zu:
- q: Sobald ein F_i(x) ≠ 0 mit x ∈ K* existiert, liegt q in dessen Spann, also in Q. Das ist unter N = 0 und dim K* = 2 der Fall.
- Q_2: Lean verlangt nur einen zweidimensionalen Raum, der alle F_i(K*) enthält. Liegt dieser nicht in Q, kann man ihn durch einen zweidimensionalen Raum in Q ersetzen (Spann der F_i(K*) ⊆ Q, dim ≤ 2, ergänzt in Q, dim Q ≥ rk L = 5). Gleichwertig.
Die Prosa sagt für Q_2 nur „liegt in einem festen Raum“, nicht „ist gleich dem Spann“. Lean trifft diesen Wortlaut.

d) **K\*.** Die Prosa spannt K* über generische γ auf, Lean über alle γ mit Rang 3. Lean-K* ⊇ Prosa-K*. Gleichheit gilt über unendlichen Körpern: Jeder Kernvektor von F_γ für γ ∈ Omega wird von einer Spalte der Adjunkten-Minoren aufgespannt, die als Polynom in γ auf der dichten generischen Menge in K·k(γ) liegt; ein lineares Funktional, das auf allen generischen k(γ) verschwindet, verschwindet daher auf allen diesen Polynomen identisch. Diese Überlegung ist meine eigene und nicht in Lean formalisiert. Sie wird nicht gebraucht, um die Lean-Sätze zu verwenden, nur um die Dimensionen der beiden K* gleichzusetzen. Für das Folgende (Satz E, Unterfall B) ist die Lean-Fassung die maßgebliche, und sie ist mindestens so stark wie die Prosa.

e) **Leere Wahrheit.** `LemmaPStatement` ist eine Implikation über alle Zerlegungen der Länge 25. Gäbe es keine, wäre sie leer wahr. Das ist im Sinn der Prosa (Widerspruchsbeweis) unschädlich. Innerhalb der Unterfälle ist nichts leer: Omega ist nichtleer (`Hyp.nonempty` aus `satzA`), und dim Kstern wird explizit gleich 2 bzw. 3 gesetzt.

f) **`nur_unterfallB'`** geht über Lemma P hinaus: Es benutzt zusätzlich `SatzE444.satzE` und verlangt deshalb `[IsAlgClosed K]`. Die Aussage passt zur Folgerung „nur Unterfall B bleibt“ aus der Hauptaussage von B-013. Ob `satzE` Satz E trifft, war nicht mein Auftrag und habe ich nicht untersucht.

g) **`nur_unterfallB_global'` ist schwächer, als der Name vermuten lässt.** Das `alg'` ist nur existenzquantifiziert und in der Aussage an `alg` nicht gebunden (es stammt intern aus `satzA_exists`, dessen Aussage ebenfalls nur „es gibt ein normiertes `alg'` der Länge 25“ lautet). Die Schlussfolgerung ist bedingt: Nur falls `alg'` im Fall (5,8) liegt und nicht symmetrisch ist, liegt es in Unterfall B. Der Satz sagt also nichts darüber, ob die Normalform von `alg` selbst im Fall (5,8) liegt oder nicht symmetrisch ist. Er sagt nicht mehr als `nur_unterfallB'` plus die Existenz irgendeiner Normalform über dem Abschluss. Der Punkt Lemma P in B-013 behauptet keine globale Fassung, deshalb ist das kein Widerspruch zur Behauptung. Für einen Endsatz taugt der Satz in dieser Form nicht.

### 1.4 Urteil zu Lemma P

Der Lean-Satz `lemmaP` (mit `LemmaPStatement`, `Kstern`, `UnterfallAVoll`, `UnterfallB`) **trifft** die Aussage von Lemma P in B-013. In den Voraussetzungen ist er stärker (unendlicher statt algebraisch abgeschlossener Körper, keine Generizität von u_0, s = 1 und ρ = 3 hergeleitet statt vorausgesetzt). In der Schlussfolgerung ist er gleich stark oder stärker (K* über alle γ mit Rang 3). Kein Teil des Punktes Lemma P bleibt unformalisiert. `dichotomie'` und `nur_unterfallB'` sind korrekte Anwendungen mit der Voraussetzung `NichtSymmetrisch` statt N = 0 (Vorbehalt 1.3 b zur Identifizierung mit p ∈ P_ns). `nur_unterfallB_global'` ist schwächer und an die Eingabe nicht gebunden (1.3 g).

---

## 2. Abgleich B-015

### 2.1 Die Lean-Seite, bis auf Mathlib zurückverfolgt

- `GPoly K = MvPolynomial (Var 3) K` mit `Var 3 = (Fin 4 × Fin 4) ⊕ (Fin 2 × Fin 2)`: Unbestimmte für die Einträge einer 4×4-Matrix S und einer 2×2-Matrix T. `GField K = FractionRing (GPoly K)` = K(S, T).
- `Sg = matS (xg)`: Einträge `S_{ij} = X (inl (i, j))`; `Tg = matT (xg)`: `T_{ij} = X (inr (i, j))`. `det Sg ≠ 0`, `det Tg ≠ 0` sind in Lean gezeigt.
- `GBar K = AlgebraicClosure (GField K)`, `ι = algebraMap`. Die Instanz `IsAlgClosed (AlgebraicClosure _)` kommt aus Mathlib. Der Körper ist also wirklich algebraisch abgeschlossen, und zwar der algebraische Abschluss von K(S,T).
- `BilinearAlgorithm.baseChange` (`YangN3Teil1.lean`): Formen über ihre Koeffizienten fortgesetzt (`extendForm`), `coeff` eintragsweise mit `algebraMap` abgebildet. Das ist die Fortsetzung der Skalare.
- `changeBasis alg S T` (`YangN3Teil2.lean`): `α'_t(A) = α_t(S A T)`, `β'_t(B) = β_t(T⁻¹ B)`, `C'_t = S⁻¹ C_t`, mit Korrektheitsbeweis.
- `genAlgL alg = changeBasis (alg.baseChange (GBar K)) (Sg.map ι) (Tg.map ι)`. Das ist eine **Definition als Funktion von `alg`**, kein Existenzquantor.
- `SN1`, `SN2`, `Lq`, `Hq`, `NichtSymmetrisch`, `IsSymm`, `avecs`, `emb` wie in 1.1. `basisVec j` ist der j-te Einheitsvektor; `emb (basisVec j)` ist die Matrix e_1 e_jᵀ.
- `BrueckeStatement K` (`Endsatz444.lean`): ∀ `_alg` der Länge 25 über K ∃ L (Universum von K), Körper, `IsAlgClosed L`, ∃ `alg'` der Länge 25 über L mit `SN1`, `SN2`, `NichtSymmetrisch`.

### 2.2 Teil „Brücke“

| Teil von B-015 | Lean (`bruecke`) | Urteil |
|---|---|---|
| K beliebiger Körper, (Z) Zerlegung der Länge 25 über K | `{K} [Field K] (alg : BilinearAlgorithm K 4 2 4 25)` | gedeckt |
| F = K(S,T), S 4×4, T 2×2 von Unbestimmten | `GField K` mit `Var 3` | gedeckt |
| L = algebraischer Abschluss von F | `GBar K = AlgebraicClosure (GField K)` | gedeckt; algebraisch abgeschlossen nach Mathlib |
| generische Normalform = Fortsetzung auf L und Basiswechsel mit S, T | `genAlgL alg` | gedeckt und **an die eingegebene Zerlegung gebunden** |
| erfüllt (N1) | `SN1 (genAlgL alg)` | gedeckt |
| erfüllt (N2) | `SN2 (genAlgL alg)`, für alle v ≠ 0 über L | gedeckt |
| Fall (rk L, rk H) = (5,8) | `(rk Lq, rk Hq) = (5, 8)` über `GBar K` | gedeckt |
| nicht symmetrisch: kein invertierbares G über L, keine μ_t ∈ L (0 erlaubt) mit Gᵀ b_t = μ_t a_t, a_t = (α_t(e_{i0}))_i, b_t = (β_t(e_1 e_jᵀ))_j | `NichtSymmetrisch (genAlgL alg)` | gedeckt, siehe 2.5 |

### 2.3 Teil „Existenzfassung“

`bruecke_exists`: ∃ L : Type u, Körper, `IsAlgClosed L`, ∃ `alg'` der Länge 25 über L mit `SN1`, `SN2`, Fall (5,8), `NichtSymmetrisch`. Das ist **gedeckt**, wörtlich wie in B-015. Weder B-015 noch `bruecke_exists` binden `alg'` an `alg`; die Bindung steht im Teil „Brücke“ (`bruecke`, über `genAlgL alg`). Zusatz: L liegt im selben Universum wie K, B-015 sagt dazu nichts.

`BrueckeStatement` (und `brueckeStatement : ∀ K, BrueckeStatement K`) ist **schwächer** als die Existenzfassung: Der Fall (5,8) fehlt (er folgt über `Endsatz444.fall58_of_nichtSymmetrisch`, das ich nur dem Namen nach gesehen habe), und `alg'` ist ausdrücklich nicht an `_alg` gebunden (Unterstrich). Als Hypothese des Endsatzes genügt das, weil der Endsatz nur einen Widerspruch braucht. Als Wiedergabe von B-015 trifft `brueckeStatement` nur die Existenzfassung ohne den Fall (5,8).

### 2.4 Teil „Abstieg“

`descent`: F unendlicher Körper, L Körper mit `[Algebra F L]` (also eine Körpererweiterung, der Strukturhomomorphismus ist injektiv), `a b : Fin r → Fin 4 → F`, `E : Matrix (Fin 4) (Fin 4) L` mit `det E ≠ 0`, `μ : Fin r → L`, und `∑_j E j i · b_{tj} = μ_t · a_{ti}` für alle t, i (mit `algebraMap` eingebettet). Dann gibt es `E₀`, `μ₀` über F mit `det E₀ ≠ 0` und demselben System. **Gedeckt**, mit genau den Indizes von B-015 (∑_j E_ji b_tj = μ_t a_ti).

`isSymm_descent` überträgt das auf `IsSymm`: Stimmen `avecs` und `β_t(emb e_j)` bis auf `algebraMap` überein, folgt aus `IsSymm B'` über L `IsSymm B` über F. `nichtSymm_genAlgL` (für alle r ≤ 25) wendet das mit `satzC_generisch` an. B-015 nennt diese Anwendung nicht als eigenen Teil; sie liefert die Nicht-Symmetrie im Teil „Brücke“.

### 2.5 Format, Indizes, Transposition

- `IsSymm`: `β_t(emb (e y)) = μ_t · (a_t · y)`. Mit `emb z = Σ_j z_j · emb(e_j)` ist die linke Seite Σ_j (E y)_j b_tj = Σ_i y_i Σ_j E_ji b_tj = ((Eᵀ b_t) · y). Also ist `IsSymm` genau Eᵀ b_t = μ_t a_t mit G = E. Die Transposition stimmt mit B-015 überein. Die Umrechnung zwischen linearer Bijektion e und Matrix E mit det E ≠ 0 ist in beiden Richtungen in Lean ausgeführt (`isSymm_of_coords`, `isSymm_descent` über `LinearMap.toMatrix'`).
- μ_t = 0 ist in Lean erlaubt (`μ : Fin r → K` ohne Einschränkung), wie in B-015.
- a_t = (α_t(e_{i,0}))_i: `avecs alg t i = alpha t (eA i 0)`. b_t = (β_t(e_1 e_jᵀ))_j: `beta t (emb (basisVec j))`, `emb` setzt Zeile 1. Indizes beginnen bei 0 wie in `yang_n4.md` §1.
- Richtung des Basiswechsels: Lean nimmt α'(A) = α(S A T), β'(B) = β(T⁻¹B). B-015 legt die Richtung nicht fest. Da S und T generisch sind, ist das ohne Belang.

### 2.6 Urteil zu B-015

- **Brücke:** von Lean gedeckt (`bruecke`). Die konstruierte Zerlegung `genAlgL alg` ist per Definition an die eingegebene Zerlegung gebunden. Der Körper `AlgebraicClosure (FractionRing (MvPolynomial Var K))` ist der algebraische Abschluss von K(S,T) und nach Mathlib algebraisch abgeschlossen.
- **Existenzfassung:** von Lean gedeckt (`bruecke_exists`). `brueckeStatement` deckt sie nur ohne den Fall (5,8), ist also schwächer, aber für die Rolle als Hypothese des Endsatzes ausreichend.
- **Abstieg:** von Lean gedeckt (`descent`), samt der Anwendung `isSymm_descent` und `nichtSymm_genAlgL`.
- Kein Teil von B-015 ist unformalisiert.

---

## 3. Job-Protokoll (Job 139447937419, Lauf 45682937335)

Durchsucht nur nach Zeilen, die mit `SORRY` beginnen, und nach Axiom-Zeilen der genannten Sätze.

- `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
- `SORRY: 0 'sorry' token(s) in the sources outside comments`

Axiom-Zeilen, jeweils `depends on axioms: [propext, Classical.choice, Quot.sound]`:

- `LemmaP444`: `lemmaP`, `dichotomie'`, `nur_unterfallB'`, `nur_unterfallB_global'`
- `SatzE444Buendel`: `dichotomie`, `nur_unterfallB`, `commonKernel_trivial`, `sDim_eq_one`
- `Bruecke444`: `descent`, `isSymm_descent`, `genSN1L`, `genSN2L`, `nichtSymm_genAlgL`, `bruecke`, `bruecke_exists`, `brueckeStatement`

Alle genannten Sätze sind ohne `sorry` und nur mit den drei Standard-Axiomen gebaut. Das Gesamtergebnis des Jobs und den gebauten Commit habe ich nicht abgefragt (siehe 0.2).

---

## 4. Zusammenfassung

1. **Lemma P:** `lemmaP` mit `LemmaPStatement` trifft die Behauptung; die Lean-Fassung ist in den Voraussetzungen stärker (unendlicher Körper genügt) und in der Schlussfolgerung mindestens gleich stark. Vorbehalte: `NichtSymmetrisch` ist punktweise formuliert und lässt sich mit „p ∈ P_ns“ nur über den Wortlaut von §5 identifizieren (1.3 b); `nur_unterfallB_global'` ist an die eingegebene Zerlegung nicht gebunden und hat eine bedingte Schlussfolgerung (1.3 g).
2. **B-015:** `bruecke`, `bruecke_exists` und `descent` treffen die drei Teile. Die Zerlegung ist im Teil „Brücke“ an die Eingabe gebunden, der Körper ist algebraisch abgeschlossen. `brueckeStatement` ist schwächer als die Existenzfassung (ohne Fall (5,8), ohne Bindung), was für den Endsatz genügt.
3. Job-Protokoll: keine `sorry`, nur Standard-Axiome.
