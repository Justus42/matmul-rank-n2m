# S2-31: Aussagen-Abgleich für B-013 (Satz E, Lemma P als Hypothese)

- Auftrag: S2-31 (Stufe 2, Runde 8, Spur A), Rolle Prüfer, Aussagen-Abgleich nach Protokoll 5.1 Punkt 3.
- Datum: 25.11.2026
- Gegenstand: `lean/YangBounds/SatzE444.lean` und `lean/YangBounds/SatzE444Buendel.lean` (S2-27, PR #60, Merge `b8cee48`) gegen `behauptungen/B-013.md` (Zeile „Aussage“) und den Prosa-Bericht `lean/prosa/s2_444_spurA_r4.md` (S2-16), Abschnitte 2, 4 (Folgerung C2), 5.1 bis 5.3.
- Belege: `versuche/s2-31-abgleich/` (Auftrag an das Fremdmodell, wörtlich, und seine Antwort).

## 0. Gelesen, nicht gelesen, Offenlegung

Gelesen: `PROTOKOLL.md` (0.3), `CLAUDE.md`, `behauptungen/B-013.md`, die Prosa `lean/prosa/s2_444_spurA_r4.md` (Abschnitte 1, 2, 4, 5, 8.2, 9), die beiden Lean-Dateien vollständig und die benutzten Definitionen in `Basic.lean`, `YangN3Teil3.lean` (`emb`), `YangN4Haupt.lean` (Objekte, `SN1`, `SN2`, `Fq`, `Lq`, `Hq`, `rkComb`, `lemma8`, `finrank_J`), `SatzA444.lean` (`JHat`, `finrank_JHat`, `satzA`, `satzA_exists`, `sDim_table`), `SatzB444.lean` (`avecs`, `IsSymm`, `lemmaV'`), `Lemma13Prime.lean` (`sDim`). Den Actions-Lauf 45658431578 samt Log.

Nicht gelesen: `lean/prosa/s2_444_spurA_r4_pruefung*.md`, `versuche/s2-23-pruefung/`, andere Prüfberichte, `LOG.md`, `STATUS.md`.

Offenlegung: (1) Die Datei `behauptungen/B-013.md` enthält in der Zeile „Prüfung“ das Urteil von S2-23 über den **Prosa**-Beweis („hält mit benannter Reparatur“, Satz E A2 bis A8 ohne Reparatur, Satz E unabhängig von Satz C). Diese Zeile stand beim Öffnen vor mir. (2) Die Kopfkommentare der beiden Lean-Dateien verweisen auf Abschnitte 2, 3 und 8 jenes Prüfberichts als Vorlage der Lean-Form. (3) Die Sitzung blendete mir kurze Projektnotizen ein, darunter eine zu S2-23 (gleiches Urteil, „GPT-Vorschlag schließt Unterfall B“) und eine zu S2-27 (Inhalt der Lean-Dateien, wie in deren Kopfkommentar). Alle drei betreffen die Prosa oder die Herkunft, nicht die Frage dieses Abgleichs. Mein Urteil stützt sich nur auf den Quelltext, die Prosa und das Actions-Log. Dem Fremdmodell habe ich weder diese Urteile noch mein eigenes gegeben.

Zeitliche Reihenfolge, genau: Die Gedächtnis-Notizen (3) waren ab Beginn der Sitzung eingeblendet, vor jeder eigenen Arbeit. Die Zeile „Prüfung“ in `B-013.md` (1) habe ich zu Beginn gelesen, als ich die Datei vollständig ausgab, also ebenfalls **vor** meinem eigenen Urteil; der Hinweis des Orchestrators, Prüfvermerke zu überspringen, kam erst danach (17:14 UTC, nach dem Entwurf dieses Berichts). Die Verweise in den Lean-Kopfkommentaren (2) sah ich beim Lesen des Artefakts, ebenfalls vorher. Keines dieser Urteile betrifft einen Aussagen-Abgleich der Lean-Sätze; ein früheres Urteil über den Abgleich von B-013 gibt es nach meinem Wissen nicht. Das Fremdmodell bekam von B-013 nur die Zeile „Aussage“ (ohne „Prüfung“ und „Status“), keine Gedächtnis-Notizen und kein Prüfurteil. Mitgegeben habe ich allerdings den gekürzten Kopfkommentar von `SatzE444.lean` mit der Angabe des Formalisierers, `UnterfallA` sei schwächer und Satz E brauche nur rk L = 5; das ist Teil des Artefakts und genau die Angabe, die beide prüfen sollten.

## 1. Punkte 1, 2 und 4 von 5.1: Build, sorry, Axiome, Actions

- Lauf [45658431578](https://github.com/Justus42/matmul-rank-n2m/actions/runs/45658431578), Workflow „Lean build (own project lean/)“, Ereignis push auf `main`, Commit `b8cee487e84e7e73eff41285f536a519d1fbeca6` (= aktueller Stand von `main` beim Abgleich), Ergebnis **success**. Lean 4.19.0, mathlib `c44e0c8`.
- Build: `YangBounds.SatzE444` und `YangBounds.SatzE444Buendel` gebaut (Schritte [1720/1723] und [1721/1723]), „Build completed successfully.“ Bei `SatzE444` nur zwei Linter-Warnungen (`tac1 <;> tac2`), keine „declaration uses sorry“.
- sorry-Zeilen im Log, selbst gelesen: „SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log“ und „SORRY: 0 'sorry' token(s) in the sources outside comments“.
- Axiome: `#print axioms` im Build für `exists_chain`, `point_lemma`, `finrank_JHat_le_eight`, `rkL_le_four_of_unterfallA`, `satzE`, `satzE_global`, `sDim_eq_one`, `commonKernel_trivial`, `dichotomie`, `nur_unterfallB`, `nur_unterfallB_global`: jeweils nur `propext`, `Classical.choice`, `Quot.sound`. Der Axiom-Bericht des Workflows führt `satzE`, `satzE_global` und `nur_unterfallB` als [STANDARD].
- Quelltext: In beiden Dateien kein `sorry`, kein `axiom`, kein `native_decide`, kein `implemented_by`/`extern`/`opaque` (grep). Lemma P ist kein Axiom, sondern die Definition `LemmaPStatement : Prop`, die als ausdrückliches Argument `hP` in `dichotomie`, `nur_unterfallB`, `nur_unterfallB_global` eingeht.

Punkte 1, 2 und 4 sind für alle genannten Sätze erfüllt. Lokal habe ich nicht gebaut; maßgeblich ist nach 5.1 Punkt 4 der Lauf in Actions.

## 2. Abgleich Satz E (`satzE`, `satzE_global`)

### 2.1 Die Lean-Aussagen

```lean
def UnterfallA : Prop :=
  ∃ (Kst : Submodule K (Fin 4 → K)) (q : (Fin r → K) ⧸ J (d := 3) alg),
    finrank K Kst = 2 ∧ ∀ (i : Fin 3), ∀ x ∈ Kst, Fq (d := 3) alg i x ∈ K ∙ q

theorem satzE [IsAlgClosed K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8)) : ¬ UnterfallA alg

theorem satzE_global (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      ((rk L, rk H von alg') = (5, 8) → ¬ UnterfallA alg')
```

dazu `satzE_of_rkL` (nur `rk L = 5`) und `rkL_le_four_of_unterfallA` (ohne Länge, ohne Fall: Unterfall A ⇒ `rk L ≤ 4`).

### 2.2 Prüfpunkte

| Punkt | Prosa / B-013 | Lean | Befund |
|---|---|---|---|
| Format | ⟨4,2,4⟩ | `BilinearAlgorithm K 4 2 4 25`; `correct : A * B = ∑ (α_k A · β_k B) • C_k` mit A ∈ K^{4×2}, B ∈ K^{2×4} | stimmt |
| Länge | 25 | `r = 25` in `satzE`; `rkL_le_four_of_unterfallA` gilt für jedes `r` | stimmt |
| Körper | „über einem Körper“, Normalform über K̄ (Abschnitt 2: K algebraisch abgeschlossen) | `satzE`: jeder algebraisch abgeschlossene Körper; `satzE_global`: jeder Körper, Normalform über `AlgebraicClosure K` | stimmt |
| Normalform | Yangs Normalform an zulässigem p und u_0: (N1) a_t·u_0 ≠ 0, (N2) | `SN1`: `alpha k (e_{0,0}) ≠ 0`; `SN2`: für `v ≠ 0` sind `f_0(v),…,f_3(v)` linear unabhängig. p = e_0 ∈ K², v_p = J p = e_1, `emb y = (0; y)` = e_1 yᵀ, u_0 = e_0 ∈ K⁴. `avecs alg t i = α_t(e_{i,0})` = a_t(p), `β_t(emb y)` = b_t(p)·y | stimmt, dieselben Definitionen wie in den geprüften B-008, B-009 |
| F_i, Q | F_i = [f_i] : U → Q = ker W / J, i = 1, 2, 3 | `Fq i = π ∘ φ (i.succ)`, `i : Fin 3`, Werte in `(Fin r → K) ⧸ J` | Indizes stimmen (`i.succ` ∈ {1,2,3}). Der Zielraum ist der ganze Quotient statt Q; da alle `f_i(y)` in ker W liegen, liegen alle `Fq i x` in `Kbar` = Q. Für die Ränge und für „F_i(K*) ⊆ K·q“ ändert das nichts, außer dass q in Lean nicht in Q liegen muss (schwächere Hypothese) |
| Fall | (rk L, rk H) = (5,8) | `hcase`, rk L = `finrank (range Lq)`, rk H = `finrank (range Hq)`; benutzt wird nur rk L = 5 (`satzE` ruft `satzE_of_rkL` mit `(Prod.mk.inj hcase).1` auf) | stimmt; der Satz ist stärker (gilt für jedes rk L = 5) |
| Symmetrie | Satz E: „im Fall (5,8) **ohne Symmetrie**“; Abschnitt 5 setzt p ∈ P_ns, generisches u_0, N = 0, s = 1 voraus | keine dieser Hypothesen | stärker; die Prosa-Hypothesen werden für Satz E nicht gebraucht |
| Unterfall A | Prosa 5.1: dim K* = 2, K* = span{k(γ)}, γ* ≠ 0 mit F_{γ*}(K*) = 0, q ∈ Q, q ≠ 0, F_γ(K*) ⊆ K·q für alle γ | `UnterfallA`: es gibt **irgendeinen** zweidimensionalen Teilraum `Kst` ⊆ K⁴ und irgendein `q` (auch 0, auch außerhalb Q) mit `Fq i x ∈ K ∙ q` für i = 1, 2, 3 und x ∈ Kst | Prosa-Unterfall A ⇒ `UnterfallA` (F_γ(K*) ⊆ K·q für alle γ ist wegen Linearität dasselbe wie für γ = e_1, e_2, e_3; die übrigen Bedingungen werden weggelassen). `UnterfallA` ist also schwächer, `¬ UnterfallA` stärker als die Prosa. In Lean belegt durch `unterfallA_of_voll : UnterfallAVoll alg → UnterfallA alg` |
| Leere Aussage? | – | Die Hypothesen `SN1`, `SN2`, Länge 25 sind genau die von Satz A; `satzA_exists` (geprüft mit B-008) erzeugt sie aus jeder Zerlegung der Länge 25 über jedem Körper. Leer ist die Aussage nur, wenn es gar keine Zerlegung der Länge 25 gibt, und das ist das Ziel | keine künstliche Verschärfung |

Zur Lesart von B-013 („für p aus einer nichtleeren offenen Menge und jedes zulässige generische u_0“): `satzE` gilt für **jede** Normalform mit (N1), (N2), also nach Basiswechsel für jedes zulässige p und jedes zulässige u_0, nicht nur generische. Die Übersetzung „zulässiges (p, u_0) ↦ Normalform `alg`“ ist ein Basiswechsel, der in Lean nicht als Satz steht. Das ist dieselbe Lage wie bei B-008 und B-009; `satzE_global` verknüpft `alg'` nicht ausdrücklich mit `alg` (reine Existenzform), das ist unschädlich, weil `satzE` für jede Normalform gilt.

### 2.3 Plausibilität des Rahmensatzes

Ohne den Beweis nachzuvollziehen (dafür ist der Build da): Die Aussage `finrank_JHat_le_eight` (zwei unabhängige x_1, x_2 ∈ U, ein Raum P mit dim P ≤ 5, der J und alle f_i(x_1), f_i(x_2) enthält ⇒ dim Ĵ ≤ 8) ist genau der Kern der Prosa-Schritte A2 bis A8 mit S = K*, P = J + K·q̂. `rkL_le_four_of_unterfallA` setzt P = J ⊔ K∙q̂ mit dim ≤ 4 + 1 und benutzt `finrank_JHat : dim Ĵ = rk L + 4`. Die Zahlen passen zur Prosa (dim Ĵ = rk L + 4 = 9 im Fall (5,8), Widerspruch zu ≤ 8).

### 2.4 Urteil Satz E

**Bestanden.** `satzE` und `satzE_global` sagen mindestens, was Satz E in B-013 und in Prosa 5.2 sagt: richtiges Format, richtige Länge, richtiger Körper (jeder Körper über die Normalform über dem Abschluss), richtiger Fall. Die Lean-Fassung ist in drei Richtungen stärker: schwächeres Prädikat `UnterfallA` (kein γ*, kein K* = span{k(γ)}, q beliebig), keine Hypothese zu Symmetrie, N oder s, und nur rk L = 5 statt (5,8). Beide Angaben des Formalisierers treffen zu.

Abweichungen, alle unschädlich:
- E1: q liegt in `(Fin r → K) ⧸ J` statt in Q; schwächere Hypothese.
- E2: `satzE_global` ist eine Existenzaussage ohne Bezug zur Eingabe `alg`; `satzE` selbst gilt für jede Normalform.
- E3: „generisches u_0“ und „p aus offener Menge“ sind in Lean nicht nötig; `satzE` gilt für alle Normalformen.

## 3. Abgleich des Restes von B-013 (`SatzE444Buendel.lean`)

### 3.1 Folgerung C2 (N(u_0) = 0, s = 1)

- `commonKernel_trivial`: (N1), (N2), `NichtSymmetrisch alg` ⇒ gemeinsamer Kern von F_1, F_2, F_3 ist 0. Ohne offene Hypothese hergeleitet (Build ohne sorry) (über `lemmaV'`).
- `sDim_eq_one`: Länge 25, (N1), (N2), N = 0 ⇒ für jedes γ mit rk F_γ = 3 ist s(γ) = dim Σ_i F_i(ker F_γ) = 1. Ohne offene Hypothese hergeleitet (Build ohne sorry). Es gilt für alle γ ∈ Ω, nicht nur generische (stärker).
- `NichtSymmetrisch alg := ¬ SatzB444.IsSymm alg` ist **punktweise** an einer Normalform: es gibt keinen Automorphismus e und keine Skalare μ_t mit β_t(emb(e y)) = μ_t (a_t·y). Die Prosa (Abschnitt 2) nennt eine Zerlegung symmetrisch, wenn es eine **nichtleere offene Menge** von p mit invertierbarem M_p, M_p b_t(p) ∈ K·a_t(p), gibt. Bis auf die Basis ist IsSymm an der Stelle p genau „es gibt M_p“ mit M_p = eᵀ (Abweichung: `IsSymm` erlaubt μ_t = 0; die Prosa schreibt „∈ K·a_t(p)“ und erlaubt 0 ebenfalls, für zulässiges p ist b_t(p) ≠ 0 und damit μ_t ≠ 0 automatisch; in Lean fehlt die Bedingung b_t ≢ 0 in `SN1`/`SN2`, daher ist `IsSymm` höchstens weiter und `NichtSymmetrisch` höchstens enger als die punktweise Prosa-Fassung).
- **Nicht formalisiert** ist der Schritt der Folgerung C2 von „nicht symmetrisch im Sinn von B-012“ (keine offene Menge) zu „es gibt eine offene Menge P_ns zulässiger p ohne Symmetrie“ (Chevalley-Argument). Er ist in Lean nur dadurch umgangen, dass `NichtSymmetrisch` als Hypothese an der Normalform verlangt wird.

Befund C2: Die punktweise Fassung „an einer Normalform ohne Symmetrie gilt N = 0 und s = 1 für alle γ ∈ Ω“ ist in Lean ohne offene Hypothese hergeleitet (Build ohne sorry) und entspricht der Prosa (C2, Teil nach „Für p ∈ P_ns gilt …“). Die B-013-Fassung mit „nicht symmetrisch im Sinn von B-012“ und „p aus einer nichtleeren offenen Menge“ ist **nicht** abgedeckt.

### 3.2 Lemma P (Dichotomie)

`LemmaPStatement K` ist eine Definition (Prop), kein Satz. `dichotomie`, `nur_unterfallB`, `nur_unterfallB_global` nehmen sie als Argument. **Lemma P ist in Lean nicht bewiesen**; jede Folgerung daraus ist bedingt.

Passt die Aussage zur Prosa (damit ein späterer Beweis das Richtige beweist)?

- `Omega alg = {γ : rk F_γ = 3}`, `Kstern alg = Σ_{γ ∈ Ω} ker F_γ`. Die Prosa nimmt K* = span{k(γ) : γ generisch}. Über einem algebraisch abgeschlossenen (also unendlichen) Körper ist Ω nach Satz A (ρ = 3) eine nichtleere Zariski-offene Menge, auf ihr ist γ ↦ ker F_γ eine reguläre Abbildung nach ℙ³, und „ker F_γ ⊆ V“ ist auf Ω abgeschlossen. Daher ist die Summe über ganz Ω dieselbe wie über eine dichte offene Teilmenge. **Passt.** Für einen Lean-Beweis bedeutet es, dass Aussagen „für generisches γ“ auf ganz Ω hochgezogen werden müssen.
- `UnterfallAVoll`: dim K* = 2, γ* ≠ 0, K* ⊆ ker F_{γ*}, q ≠ 0, F_i(K*) ⊆ K·q. Wörtlich Prosa 5.1 Unterfall A samt „F_{γ*}(K*) = 0“. **Passt.** (q im ganzen Quotienten, siehe E1; da F_i(K*) ⊆ Q, kann q in Q gewählt werden.)
- `UnterfallB`: dim K* = 3, γ* ≠ 0, K* ⊆ ker F_{γ*}, rk F_{γ*} = 1, ein Q_2 mit dim 2 und F_i(K*) ⊆ Q_2. Wörtlich Prosa 5.1 Unterfall B. **Passt.** Als Prädikat, das später auszuschließen ist, ist es eher weiter als die Prosa (Q_2 muss nicht in Q liegen), ein Ausschluss wäre also mindestens so stark wie nötig.
- Hypothesen von `LemmaPStatement`: Länge 25, (N1), (N2), (rk L, rk H) = (5,8), N = 0. Gegenüber der Prosa (Abschnitt 5: p ∈ P_ns, u_0 zulässig **und generisch**, N = 0, s = 1, ρ = 3, rk L = 5, rk H = 8):
  - L1 (Körper): `LemmaPStatement K` ist für **jeden** Körper K formuliert, die Prosa (Kronecker-Normalform, Gradargument in 5.1 (2), Lemma R1) nur für algebraisch abgeschlossenes K. Für nicht abgeschlossene Körper trägt der Prosa-Beweis nicht (Ω ist nach Satz A zwar nie leer, über endlichen Körpern aber endlich, und „generisch“, Gradargument und Kronecker-Normalform greifen nicht); ob die Aussage dort gilt, ist offen. Verwendet wird sie nur mit `[IsAlgClosed K]` (`nur_unterfallB`) bzw. für `AlgebraicClosure K` (`nur_unterfallB_global`). Unschädlich für die Verwendung, aber ein späterer Beweis muss `∀ K [IsAlgClosed K], LemmaPStatement K` zeigen, nicht `∀ K, LemmaPStatement K`. Ich empfehle, die Annahme `IsAlgClosed` bei der Formalisierung von Lemma P in die Aussage aufzunehmen oder ausdrücklich so zu instanziieren.
  - L2 (u_0): `LemmaPStatement` verlangt die Dichotomie für **jede** Normalform mit N = 0, die Prosa nur für generisches u_0. Der Prosa-Beweis von Lemma P (Schritte 1 bis 4) benutzt von u_0 nach meiner Lesung nur N(u_0) = 0, s = 1 (folgt aus N = 0, siehe `sDim_eq_one`), ρ = 3 und Lemma 9; „generisch“ für u_0 kommt im Beweis nicht vor. Die Lean-Fassung ist also formal stärker, nach dem Prosa-Beweis aber nicht schwerer. Ob die Prosa „generisch“ irgendwo stillschweigend braucht, kann nur der Beweis von Lemma P zeigen; das ist **ein Risiko, kein Fehler**.
  - L3 (s = 1): fehlt als Hypothese, folgt aber in Lean aus N = 0 (`sDim_eq_one`). Kein Unterschied.
  - L4: rk H = 8 steht in den Hypothesen; die Prosa braucht es nur für s ≤ 1, Lean hat das in `sDim_table`. Kein Unterschied.
- `NichtSymmetrisch` zur Prosa: siehe 3.1. Für die Kette Satz C ⇒ NichtSymmetrisch ⇒ N = 0 muss ein späterer Satz `NichtSymmetrisch` an der Normalform zeigen; Satz C (B-012) spricht in der Prosa über offene Mengen von p. Diese Brücke (C2, Chevalley) fehlt in Lean.

Befund Lemma P: `LemmaPStatement`, `UnterfallAVoll`, `UnterfallB`, `Kstern`, `Omega` treffen die Prosa-Aussage von Lemma P. Abweichungen L1 (beliebiger Körper; für die Verwendung unschädlich, beim Beweis beachten) und L2 (alle statt generische u_0; formal stärker, nach dem Prosa-Beweis nicht schwerer). Lemma P selbst ist **unbewiesen**.

### 3.3 Folgerungen aus Lemma P

- `dichotomie`: Lemma P ∧ (N1) ∧ (N2) ∧ (5,8) ∧ NichtSymmetrisch ⇒ `UnterfallAVoll ∨ UnterfallB`. Bedingt.
- `nur_unterfallB`, `nur_unterfallB_global`: zusätzlich mit Satz E ⇒ `UnterfallB`. Bedingt durch `LemmaPStatement` und `NichtSymmetrisch`. Die Implikation selbst ist korrekt formuliert und entspricht Prosa 5.2/5.3 (Zerlegung in Unterfall B).
- Nicht formalisiert: die transponierte Zerlegung (B3), „die Zerlegung **und ihre Transponierte** liegen in Unterfall B“, und „alle a_t(p) und b_t(p) liegen auf verdrehten Kubiken“ (B1, B2, B3). Dazu gibt es keinen Lean-Satz.

## 4. Was den Status geprüft bekommen kann

Nach 5.1 braucht Status geprüft: Build ohne sorry, Standard-Axiome, grünes Actions (alle erfüllt, Abschnitt 1) und den Aussagen-Abgleich durch Prüfer und Fremdmodell unabhängig. Mein Teil des Abgleichs:

| Teil von B-013 | Lean | Urteil Prüfer | Status nach 5.1, wenn das Fremdmodell zustimmt |
|---|---|---|---|
| **Satz E**: Im Fall (5,8) tritt Unterfall A nicht auf (über jedem Körper, Normalform über K̄) | `satzE`, `satzE_global` (sogar: rk L = 5 genügt, keine Nicht-Symmetrie, schwächeres Prädikat) | entspricht, stärker; Abweichungen E1 bis E3 unschädlich | **geprüft** |
| C2 punktweise: an einer Normalform ohne Symmetrie ist N = 0 und s = 1 | `commonKernel_trivial`, `sDim_eq_one` | entspricht (Teilaussage) | geprüft als Teilaussage |
| C2 in der Form von B-013 (nicht symmetrisch im Sinn von B-012 ⇒ offene Menge P_ns) | fehlt | nicht abgedeckt | **behauptet** |
| Lemma P (γ*, K*, Dichotomie A/B) | nur `LemmaPStatement` als Hypothese | Aussage passt (L1, L2), Beweis fehlt | **behauptet** |
| „Die Zerlegung liegt in Unterfall B“ | `nur_unterfallB` unter `LemmaPStatement` und `NichtSymmetrisch` | bedingt | **behauptet** (die Implikation „Lemma P ∧ NichtSymmetrisch ⇒ Unterfall B“ ist als bedingter Satz korrekt) |
| Transponierte in Unterfall B, a_t und b_t auf verdrehten Kubiken | fehlt | nicht abgedeckt | **behauptet** |

Zusammengefasst: **Satz E ist der Teil von B-013, der den Status geprüft bekommen kann**, in der stärkeren Lean-Form. Alles, was an Lemma P hängt (die Dichotomie, die Folgerung „nur Unterfall B“, die Transponierte, die Kubiken) und der Chevalley-Schritt von C2 bleiben behauptet.

Hinweis für die Einordnung (keine Entscheidung des Prüfers): Satz E schließt „Unterfall A“ aus. Als benannter Fall der Fallunterscheidung existiert Unterfall A erst durch Lemma P. Der geprüfte Lean-Satz `rkL_le_four_of_unterfallA` gilt aber unabhängig davon: Jede Normalform, in der F_1, F_2, F_3 einen zweidimensionalen Teilraum in eine Gerade abbilden, hat rk L ≤ 4. Ob das als Fortschritt nach Abbruchregel 2 a) zählt, entscheidet der Orchestrator.

Abschnitte 0 bis 4 standen fertig, bevor die Antwort des Fremdmodells einging (Ausnahme: der Absatz „Zeitliche Reihenfolge“ in Abschnitt 0, nach dem Hinweis des Orchestrators ergänzt).

## 5. Urteil des Fremdmodells

GPT 6.2 Sol (`openai/gpt-6.2-sol`, Batch, Denkstufe high, 25.11.2026, fertig nach 8 Minuten, 0,05 US-$). Auftrag und Antwort wörtlich in `versuche/s2-31-abgleich/`. Das Modell kannte weder mein Urteil noch frühere Prüfurteile.

Urteile je Teil (seine Tabelle, Abschnitt 4):

| Teil | Urteil GPT |
|---|---|
| `satzE` / `satzE_of_rkL` gegen Satz E in 5.2 | **entspricht**; stärker (schwächeres A, nur rk L = 5, keine Nicht-Symmetrie), unschädlich |
| `satzE_global` als Satz über die eingegebene Zerlegung | **entspricht nicht**: Bezug zwischen `alg` und `alg'` fehlt im Typ |
| C2 (N = 0, s = 1) an einer festen Normalform | entspricht mit Abweichung: lokal korrekt, offene p-Menge und Übergang zu allen u_0 fehlen |
| `Omega`, `Kstern`, `UnterfallAVoll`, `UnterfallB` | **entspricht** (größerer Quotient und ganzer Rang-3-Ort unschädlich) |
| `LemmaPStatement` | Formulierung entspricht mit Abweichung (beliebiger Körper, alle Normalformen statt generischer u_0); als bewiesener Teil: entspricht nicht (nur Hypothese) |
| `NichtSymmetrisch` | punktweise entspricht, global (offene Menge) entspricht nicht |
| Unterfall B für die Zerlegung | entspricht mit Abweichung: nur unter `LemmaPStatement` und `NichtSymmetrisch` |
| Transponierte, verdrehte Kubiken | entspricht nicht: fehlt |

Weitere Einzelbefunde des Modells: Format, Länge, Körper, Indizes (`i.succ`), Parametrisierung `emb y = (0; y)` und die Lage von p, u_0 stimmen; der größere Quotient ändert keine Ränge; `skewSpace` verlangt Nulldiagonale und ist damit auch in Charakteristik 2 die richtige schiefe Erweiterung; kein definitorischer Widerspruch in den Hypothesen; `Kstern` über ganz Ω ist gleich dem Spann über eine dichte offene Teilmenge (Abgeschlossenheitsargument); in `UnterfallAVoll` liegt q automatisch in Q, in `UnterfallB` wird Q_2 vom Bild eines Rang-3-F_γ ausgefüllt.

## 6. Vergleich und Ergebnis

Prüfer und Fremdmodell stimmen unabhängig überein:

1. **Satz E**: `satzE` (und `satzE_of_rkL`) ist die Aussage von Satz E aus B-013 und Prosa 5.2, in stärkerer Form. Beide bestätigen beide Angaben des Formalisierers (schwächeres `UnterfallA`, nur rk L = 5 nötig).
2. **Lemma P** ist nur Hypothese; `LemmaPStatement`, `UnterfallAVoll`, `UnterfallB`, `Kstern`, `Omega` passen als Aussagen zur Prosa, mit denselben zwei Abweichungen (beliebiger Körper; alle Normalformen statt generischer u_0). Ein späterer Beweis muss `LemmaPStatement` über algebraisch abgeschlossenen Körpern zeigen.
3. **NichtSymmetrisch** ist die punktweise Fassung; der Chevalley-Schritt von C2 (offene Menge P_ns) fehlt.
4. Transponierte und verdrehte Kubiken fehlen.

Einziger Unterschied in der Bewertung: `satzE_global`. Ich habe die fehlende Bindung von `alg'` an `alg` als unschädlich eingestuft (E2), GPT als „entspricht nicht“, gemessen an dem, was der Name verspricht. Beide sehen denselben Sachverhalt. Für den Status von Satz E ist das ohne Folgen, weil die Aussage von Satz E in `satzE` steht, das für **jede** Normalform gilt, und `satzA_exists` (geprüft mit B-008) zu jeder Zerlegung der Länge 25 über jedem Körper eine Normalform über dem Abschluss liefert. Ich übernehme GPTs schärfere Lesart als Hinweis: `satzE_global` sagt über die eingegebene Zerlegung nichts, was nicht schon aus `satzA_exists` und `satzE` folgt, und darf nicht als „Satz E für die gegebene Zerlegung“ zitiert werden. Wer später B-012 (Nicht-Symmetrie der gegebenen Zerlegung) mit diesen Sätzen verkettet, braucht einen Lean-Satz, der `alg'` an `alg` bindet (Basiswechsel, Skalarerweiterung) und die Nicht-Symmetrie überträgt.

**Ergebnis nach 5.1:** Punkte 1, 2 und 4 erfüllt (Abschnitt 1), Punkt 3 für **Satz E** von Prüfer und Fremdmodell unabhängig bestätigt. Damit hat der Teil **Satz E von B-013 den Status geprüft**, in der Lean-Form `YangBounds.SatzE444.satzE`: Über jedem algebraisch abgeschlossenen Körper gibt es keine Normalform (N1), (N2) einer Zerlegung von ⟨4,2,4⟩ der Länge 25 mit rk L = 5 (insbesondere im Fall (5,8)), in der F_1, F_2, F_3 einen zweidimensionalen Teilraum von U in eine Gerade K·q abbilden. Ebenso geprüft als Teilaussage: `commonKernel_trivial` und `sDim_eq_one` (an einer Normalform ohne Symmetrie ist N = 0 und s(γ) = 1 für alle γ ∈ Ω).

**Behauptet bleiben**: Folgerung C2 in der Form von B-013 (globale Nicht-Symmetrie ⇒ offene Menge P_ns), Lemma P (Dichotomie), „die Zerlegung liegt in Unterfall B“ (in Lean nur bedingt, `nur_unterfallB`), die Transponierte in Unterfall B und die verdrehten Kubiken.
