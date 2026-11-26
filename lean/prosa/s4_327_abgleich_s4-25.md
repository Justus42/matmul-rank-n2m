# S4-25: Aussagen-Abgleich `YangBounds.S4BedingterAusschluss.s4_07_D` gegen B-021, Aussage S4-07-D (erster Satz)

Rolle: Prüfer, Aussagen-Abgleich nach Protokoll 5.1 Punkt 3. Geprüft wird nur, ob der Lean-Satz die behauptete Aussage ist und was er nicht abdeckt, nicht der Lean-Beweis und nicht der Prosa-Beweis. Einen Status setze ich nicht.

## 0. Offenlegung

**Eingeblendetes Projektgedächtnis.** Beim Start eingeblendet war der Index `team/silo/MEMORY.md`. Er enthält Angaben zu Repo, Protokollfassung 0.6, Stufe 4 und Budget, Rechten und Grenzen des Orchestrators, Fremdmodell und Bridge, Literaturwache, Regeln für Prüferaufträge und zur Bezeichnung „blind“. Er enthält kein Urteil und keinen Befund zu B-021 oder zu `s4_07_D`. Er verweist auf die Einträge `verfahren-datenformat` und `lean-project-ci`, deren Inhalt mir nicht eingeblendet wurde. Während der Arbeit (nach dem ersten Lesen) wurden mir außerdem drei Einzeleinträge eingeblendet: `gemini-bridge` (Bridge ohne Repo-Freigabe, Zeitgrenze 60 s), `aussagen-abgleich-n3` (Hinweise zu Bridge und lokalem Lean-Bau) und `lean-build-cloud` (Lean/mathlib-Bau in der Cloud). Keiner davon enthält ein Urteil oder einen Befund zu B-021 oder `s4_07_D`. Die eingeblendete `CLAUDE.md` gehört zur Positivliste.

**Gelesen**, jeweils auf `main` (Stand 66f11ab; die Dateien unten sind dort unverändert gegenüber 3eb57a5, geprüft mit `git diff --stat 3eb57a5 origin/main`):

- `CLAUDE.md`; `PROTOKOLL.md` Abschnitt 5 (dazu die Liste der Abschnittsüberschriften, um ihn zu finden).
- `behauptungen/B-021.md`: Vorbemerkung, Aussage C, Aussage D samt Satz zur Bedingung (INJ5). Beim Suchen der Zeilen per `grep` sind mir zusätzlich die Zeilen mit dem Wortlaut der Aussagen A, B (nur die erste Zeile) und E sowie die Artefakt-Zeile in der Ausgabe erschienen. Ich habe sie für das Urteil nicht verwendet.
- `lean/YangBounds/S4BedingterAusschluss.lean` ganz, Stand 3eb57a5.
- `lean/YangBounds/Basic.lean` Zeilen 36 bis 60 (darin `BilinearAlgorithm` und `unitMatrix`; mitgelesen der Docstring davor, `entryForm` und ein Docstring danach).
- `lean/prosa/s4_327_spurA_r2_bau.md` Abschnitte 1.1, 1.2 und 3.1. Um die Zeilen zu finden, habe ich die Liste aller Überschriften der Datei ausgegeben. Darin standen auch Kommentarzeilen aus den Programmen des Anhangs, die mit `#` beginnen. Den Text anderer Abschnitte habe ich nicht gelesen.
- Log des Jobs 139899962532 (Lauf 45817224211). Das Log nennt die Namen und Kurzbeschreibungen vieler anderer Lean-Sätze des Repos. Das sind Spuren ohne Bezug zu B-021.

**Spuren nach 5.4:** Der Kopf der Lean-Datei nennt die Auftragsnummer S4-18 und Abschnitte 2, 3.3, 4.1, 4.2, 6.2 des Prosatexts. Die Tabelle im Kopf ordnet die Hypothesen der Prosa zu. Das ist die Selbstbeschreibung des Formalisierers, kein Prüfurteil; ich habe sie nicht übernommen, sondern jede Zuordnung selbst nachvollzogen. Ein Urteil anderer Prüfer zu B-021 oder `s4_07_D` habe ich nicht gesehen.

## 1. Der Lean-Satz

```lean
theorem s4_07_D (alg : BilinearAlgorithm K 3 2 7 34)
    (hnorm : ∀ t, alg.alpha t (unitMatrix 0 0) = 1)
    (w u : Fin 34 → K)
    (hJ : Jspace alg = mulP (aVec alg 1) (aVec alg 2) w 2 ⊔ K ∙ u)
    (hK : Kprime alg ≤ Jspace alg ⊔ (Jspace alg).map (LinearMap.mulLeft K (aVec alg 1)) ⊔
      (Jspace alg).map (LinearMap.mulLeft K (aVec alg 2)))
    (hINJ5 : INJ5 (aVec alg 1) (aVec alg 2) w u) : False
```

`K` ist ein beliebiger Körper (`variable {K : Type u} [Field K]`). Dazu gibt es `s4_07_D_keinVerfahren` (¬∃ alg w u mit denselben vier Bedingungen) und `s4_07_D_allg` (dieselbe Aussage für beliebiges m und r).

Die behauptete Aussage (B-021, D, erster Satz): „In der Lage von S4-07-C gibt es kein Verfahren der Länge 34, falls zusätzlich gilt: (INJ5) aus w·F + u·G = 0 (als Vektor in K^34) mit deg F ≤ 5 und deg G ≤ 3 folgt F = 0 und G = 0.“

## 2. Punkt für Punkt

### (a) Format, Länge, Körper: stimmt überein

`BilinearAlgorithm K 3 2 7 34` (Basic.lean, Zeilen 40 bis 46) besteht aus 34 Linearformen `alpha t` auf `Matrix (Fin 3) (Fin 2) K`, 34 Linearformen `beta t` auf `Matrix (Fin 2) (Fin 7) K`, 34 Matrizen `coeff t` in `Matrix (Fin 3) (Fin 7) K` und der Eigenschaft `correct`: A * B = Σ_t (α_t(A)·β_t(B)) • C_t für alle A, B, mit dem gewöhnlichen Matrixprodukt. Das ist genau „AB = Σ_{t=1}^{34} α_t(A)β_t(B)C_t“ aus Abschnitt 1.1, also ein bilineares Verfahren der Länge 34 für ⟨3,2,7⟩ (A ist 3×2, B ist 2×7). Weil beide Seiten bilinear in (A, B) sind, ist `correct` gleichwertig damit, dass die Gleichung für alle Paare von Matrixeinheiten gilt, und das sind die Brent-Gleichungen für ⟨3,2,7⟩. Nullprodukte sind erlaubt; „Länge 34“ heißt also „höchstens 34 echte Produkte“, wie üblich und wie in 1.1 (R2 streicht Nullformen, die Länge bleibt 34).

Körper: Der Satz gilt über jedem Körper. Die Prosa arbeitet nach R1 über dem algebraischen Abschluss. Der algebraische Abschluss ist selbst ein Körper (in Lean `AlgebraicClosure K : Type u`, gleiches Universum), also ist der Lean-Satz dort anwendbar. Der Lean-Satz ist hier allgemeiner als nötig.

### (b) Definitionen: stimmt überein

| Lean | Definition | Prosa 1.2 | Befund |
|---|---|---|---|
| `aVec alg i` | t ↦ α_t(unitMatrix i 0) | a_i = (α_t(e_{i0}))_t | gleich; `unitMatrix i j` hat die 1 an (i, j), Basic.lean Z. 56–57 |
| `bVec alg i` | t ↦ α_t(unitMatrix i 1) | b_i = (α_t(e_{i1}))_t | gleich (geht nur über `cVec` in den Beweis ein) |
| `qVec alg k` | t ↦ β_t(unitMatrix 1 k) | q_k = (β_t(e_{1k}))_t | gleich; Prosa zählt k = 1, …, 7, Lean `k : Fin 7`, reine Umbenennung |
| `Wmap alg v` | Σ_t v_t • C_t | W(v) = Σ_t v_t C_t | gleich, K-linear |
| `Kprime alg` | `LinearMap.ker (Wmap alg)` | K′ = ker W | gleich |
| `Jspace alg` | `Submodule.span K (Set.range (qVec alg))` | J = span(q_1, …, q_7) | gleich |
| `ev a₁ a₂` | `aeval ![a₁, a₂]` in die Algebra `Fin 34 → K` | Auswertung an den a-Punkten | `aeval` ist der K-Algebren-Homomorphismus mit X 0 ↦ a₁, X 1 ↦ a₂; da die Operationen in `Fin 34 → K` punktweise sind, ist (ev F)(t) = F(a_1(t), a_2(t)) |
| `mulP a₁ a₂ v d` | Bild von `restrictTotalDegree (Fin 2) K d` unter F ↦ v * ev F | v·P_d mit P_d = span{a_1^μ a_2^ν : μ + ν ≤ d} | `restrictTotalDegree` ist der Untermodul der Polynome vom Totalgrad ≤ d, aufgespannt von den Monomen vom Grad ≤ d; sein Bild unter ev ist P_d, mal v ergibt v·P_d. Gleich |
| `K ∙ u` | `Submodule.span K {u}` | ⟨u⟩ | gleich |
| `⊔`, `.map (mulLeft K a)` | Summe von Untermoduln, a·J | +, a_i·J | gleich; „·“ der Prosa ist das komponentenweise Produkt, in Lean `*` auf `Fin 34 → K` |
| `INJ5` | siehe (c) | (INJ5) | siehe (c) |

### (c) Hypothesen gegen die Lage von S4-07-C: stimmt überein (mit Vorbehalt zur Lesart von (INJ5), siehe unten)

Die „Lage von S4-07-C“ ist laut Vorbemerkung und Aussage C: eine Normalform (nach R1, R2, Lemma A und Skalierung α_t(e_{00}) = 1) eines Verfahrens der Länge 34 für ⟨3,2,7⟩ im Restfall R-327 mit dim w·P_2 = 6, für die C behauptet: J = w·P_2 ⊕ ⟨u⟩ für ein u ∈ J, K′ = w·P_3 ⊕ u·P_1 mit dim w·P_3 = 10, K″ = w·P_4 ⊕ u·P_2 mit Dimension 21, sowie die weiteren Gestaltaussagen.

- `alg`: Die Normalform ist wieder ein Verfahren der Länge 34 für ⟨3,2,7⟩ über einem Körper (1.1: „Das ist wieder ein Verfahren“). Erfüllt.
- `hnorm`: Das ist die Skalierung aus 1.1, „ab hier gilt a_0 = (1, …, 1)“. Erfüllt.
- `w u`, `hJ`: C sagt J = w·P_2 ⊕ ⟨u⟩. Daraus folgt die Gleichheit von Untermoduln J = w·P_2 + K·u, und das ist `hJ`. Lean verlangt die Direktheit nicht, ebenso nicht w = j_v mit v ∈ S, v ≠ 0, nicht u ∈ J einzeln (folgt aus hJ) und nicht dim w·P_2 = 6. Die Hypothese ist also schwächer als das, was C liefert. Erfüllt.
- `hK`: K′ ⊆ J + a_1·J + a_2·J. In 1.2 steht die Gleichheit K′ = J + a_1·J + a_2·J (aus R-327 übernommen). Unabhängig davon folgt sie aus C selbst: Mit J = w·P_2 + K·u ist J + a_1·J + a_2·J = w·P_3 + u·P_1, weil jedes Monom vom Grad ≤ 3 entweder Grad ≤ 2 hat oder a_i mal ein Monom vom Grad ≤ 2 ist, und C sagt K′ = w·P_3 ⊕ u·P_1. Lean nimmt nur die Inklusion ⊆ an. Erfüllt.
- `hINJ5`: Lean-Definition: für alle F, G ∈ K[X_0, X_1] mit `totalDegree F ≤ 5`, `totalDegree G ≤ 3` und w·ev F + u·ev G = 0 (Gleichung in `Fin 34 → K`, also in K^34) gilt F = 0 und G = 0 als formale Polynome. Abgleich mit dem Wortlaut in B-021:
  - Gleichung „w·F + u·G = 0 (als Vektor in K^34)“: entspricht `w * ev F + u * ev G = 0` in `Fin 34 → K`. Gleich.
  - Gradgrenzen „deg F ≤ 5“ und „deg G ≤ 3“: entsprechen `totalDegree F ≤ 5`, `totalDegree G ≤ 3`. „deg“ eines Polynoms in zwei Variablen ist der Totalgrad, passend zu P_d = span{a_1^μ a_2^ν : μ + ν ≤ d}. Gleich, Grenzen 5 und 3 richtig zugeordnet (5 zu w, 3 zu u).
  - Folgerung „F = 0 und G = 0“: Lean liest F, G als formale Polynome und „= 0“ als Nullpolynom. Das passt zum Wortlaut, weil „deg F“ nur für ein Polynom selbst erklärt ist und weil der Zusatz „(als Vektor in K^34)“ gerade die Gleichung von der Aussage über F, G abhebt.

  **Vorbehalt zur Lesart.** Der Wortlaut lässt eine zweite Lesart zu: F als Element von P_5, G als Element von P_3 (Vektoren, Abschnitt 1.2 nennt P_d „Polynome … ausgewertet an den 34 a-Punkten“), und „F = 0“ als Nullvektor. In dieser Lesart ist die Prosa-Bedingung schwächer als die Lean-Bedingung (formal F = 0 ⇒ ev F = 0, nicht umgekehrt), und der Lean-Satz deckt dann genau die Lagen nicht ab, in denen ein von 0 verschiedenes Polynom vom Grad ≤ 5 an allen 34 a-Punkten verschwindet oder eines vom Grad ≤ 3 mit u·ev G = 0 existiert (dort ist die Lean-Bedingung verletzt, die Vektor-Lesart aber womöglich erfüllt). In der Lage von C fallen beide Lesarten für die kleineren Grade zusammen: dim w·P_4 = 15 und dim u·P_2 = 6 (aus dim K″ = 15 + 6) bedeuten, dass F ↦ w·ev F auf Polynomen vom Grad ≤ 4 und G ↦ u·ev G auf Grad ≤ 2 injektiv ist. Ein Unterschied kann also nur in den Graden 5 (für F) und 3 (für G) auftreten. Ich halte die formale Lesart für die gemeinte, weil sonst „deg F“ nicht erklärt ist; entscheiden kann das nur der Wortlaut der Quelle, den Abschnitt 6 festlegt, und den durfte ich nicht lesen. Ich vermerke das als Auslegungsfrage, nicht als Abweichung.

Ergebnis zu (c): Jede Lage von S4-07-C, in der (INJ5) in der Lesart formaler Polynome gilt, liefert Werte (alg, w, u), auf die `s4_07_D` anwendbar ist. Die Lean-Hypothesen sind höchstens schwächer als die Lage, mit Ausnahme von `hINJ5` in der oben beschriebenen Vektor-Lesart.

### (d) Schluss: stimmt überein

Der Satz hat die Form „für jedes `alg` und alle w, u mit hnorm, hJ, hK, hINJ5 gilt `False`“. Das ist logisch dasselbe wie `s4_07_D_keinVerfahren`: Es gibt kein Verfahren der Länge 34 für ⟨3,2,7⟩ über irgendeinem Körper mit a_0 = 1 und Vektoren w, u, sodass J = w·P_2 + K·u, K′ ⊆ J + a_1J + a_2J und (INJ5) gelten. Weil die Lage von S4-07-C eine Aussage über Normalformen ist und eine Normalform selbst ein Verfahren der Länge 34 ist, sagt das genau „in der Lage von S4-07-C gibt es kein Verfahren der Länge 34, falls (INJ5) gilt“. Der Schritt „gibt es ein Verfahren in dieser Lage, so gibt es eine Normalform mit diesen Eigenschaften“ gehört zur Lage selbst (Vorbemerkung, 1.1, Aussage C) und ist nicht Teil des ersten Satzes von D.

### (e) Versteckte Annahmen, Leerheit: keine gefunden; Erfüllbarkeit für ⟨3,2,7⟩ der Länge 34 nicht entscheidbar

- **Versteckte Zusatzannahmen:** keine. Weitere Hypothesen als die fünf genannten gibt es nicht, `K` ist beliebig, es gibt keine `Fact`-, `Fintype`- oder Charakteristik-Annahmen, kein `sorry`, kein eigenes Axiom (siehe (f)). Hilfsannahmen wie dim w·P_2 = 6, dim K′ = 13, w ≠ 0 oder die Direktheit der Summen fehlen in der Lean-Fassung, sie wären nur weitere Einschränkungen.
- **Keine Hypothese ist schon durch die Definitionen unerfüllbar.** Das prüfe ich an der allgemeinen Fassung `s4_07_D_allg` (beliebiges m, r), weil der Lean-Satz für ⟨3,2,7⟩ genau deren Spezialfall ist:
  - hnorm, hJ und hK zusammen ohne (INJ5) sind erfüllbar, etwa für ⟨3,2,1⟩ der Länge 6: Schulverfahren für X⁻¹AY und Y⁻¹B mit X = [[2,1,1],[1,2,1],[1,1,2]], Y = [[1,1],[1,2]], jedes Produkt auf α_t(e_{00}) = 1 skaliert. Exakt mit sympy nachgerechnet: Verfahren korrekt, alle α_t(e_{00}) = 1, a_1 = (−1/3, −1/3, −3, −3, 1, 1), a_2 = (−1/3, −1/3, 1, 1, −3, −3), q = (−1, 1, −1, 1, −1, 1), dim K′ = 3, Rang von (q, a_1q, a_2q) = 3 und K′ ⊆ span(q, a_1q, a_2q). Mit w = 0, u = q gilt J = 0·P_2 + K·q, also hJ. (INJ5) ist dort verletzt (F = 1, G = 0).
  - (INJ5) allein ist erfüllbar: 34 zufällige ganzzahlige a-Punkte (Startwert 1, Koordinaten in [−50, 50]), w = (1, …, 1), u zufällig. Die 34×31-Matrix der Abbildung (F, G) ↦ w·ev F + u·ev G auf Polynomen vom Grad ≤ 5 bzw. ≤ 3 hat exakt über ℚ (Brüche, Gauß) Rang 31, die Abbildung ist also injektiv.
  - (INJ5) ist auch mit hJ in Bezug auf Dimensionen verträglich: (INJ5) erzwingt dim w·P_2 = 6 und u ∉ w·P_2, also dim (w·P_2 + K·u) = 7 = dim J, und dim J = 7 folgt aus den Brent-Gleichungen W(b_i·q_k) = e_{ik}.
- **Nicht entscheidbar:** ob es für ⟨3,2,7⟩ der Länge 34 überhaupt ein `alg` mit hnorm, hJ, hK gibt. Ob es überhaupt ein Verfahren der Länge 34 für ⟨3,2,7⟩ gibt, ist ja gerade die offene Frage. Dass die Hypothesen für m = 7, r = 34 ohne (INJ5) erfüllbar sind, lässt sich deshalb nicht an einem Beispiel zeigen. Das macht den Satz nicht falsch, aber man sollte es wissen: Der Satz könnte leer sein, weil es gar kein Verfahren in der Lage von C gibt. Für den Abgleich ist das unschädlich, denn D ist genau als bedingte Aussage über diese Lage formuliert.

### (f) Log des Jobs 139899962532: stimmt überein

Lauf 45817224211, Job 139899962532, Workflow `lean-project.yml`:

- Ausgecheckt: `3eb57a5feb8596d88a4de5245b7cbe6f823b4c31` (Logzeilen „fetch … +3eb57a5feb85…“ und „git log -1 --format=%H“ → 3eb57a5…).
- Toolchain `leanprover/lean4:v4.19.0`, mathlib `c44e0c8ee63ca166450922a373c7409c5d26b00b`.
- `✔ [1743/1764] Built YangBounds.S4BedingterAusschluss` (12:12:25Z), danach `Build completed successfully.` (12:15:28Z).
- sorry-Bericht, wörtlich:
  `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
  `SORRY: 0 'sorry' token(s) in the sources outside comments`
- Axiom-Zeilen für den Satz, wörtlich:
  `'YangBounds.S4BedingterAusschluss.s4_07_D' depends on axioms: [propext, Classical.choice, Quot.sound]`
  `AXIOM-RESULT|YangBounds.S4BedingterAusschluss.s4_07_D|propext, Quot.sound, Classical.choice`
  sowie im Bericht `[STANDARD] YangBounds.S4BedingterAusschluss.s4_07_D … axioms: ['Classical.choice', 'Quot.sound', 'propext'] -- only propext, Classical.choice, Quot.sound` und `TOTAL: STANDARD=60`.

Nur Standard-Axiome, kein `sorry`. Geprüft ist hier `s4_07_D`; für `s4_07_D_keinVerfahren` und `s4_07_D_allg` enthält das Log keine eigene Axiom-Zeile (`s4_07_D` verwendet `s4_07_D_allg`, dessen Axiome sind also in der Zeile für `s4_07_D` enthalten).

## 3. Was der Lean-Satz nicht abdeckt

1. Den Weg von einem beliebigen Verfahren zur Lage von S4-07-C: Normalform (R1, R2, Lemma A, Skalierung), Restfall R-327, Existenz von w, die Fallunterscheidung nach e, die Wahl von u und die Aussage C selbst. Diese gehen nur als Hypothesen hnorm, hJ, hK ein.
2. Den zweiten Satz von D („Gleichwertig gesagt: …“). Er braucht zusätzlich, dass jede Normalform mit e = 3 die Hypothesen hJ und hK erfüllt, also Aussage C und die Übernahme aus R-327.
3. Die Frage, ob (INJ5) für ein echtes Verfahren gelten kann.
4. (INJ5) in der Vektor-Lesart (siehe (c)), falls diese gemeint sein sollte.

## 4. Urteil

| Punkt | Urteil | Stelle |
|---|---|---|
| (a) Format, Länge, Körper | stimmt überein | Basic.lean Z. 40–46; `s4_07_D` Z. 478, `BilinearAlgorithm K 3 2 7 34`, K beliebiger Körper |
| (b) Definitionen | stimmt überein | S4BedingterAusschluss.lean Z. 109–131, 251–272 |
| (c) Hypothesen aus der Lage von S4-07-C | stimmt überein, mit Vorbehalt zur Lesart von „F = 0 und G = 0“ in (INJ5) | Z. 479–484; `INJ5` Z. 129–131 |
| (d) Schluss `False` | stimmt überein | Z. 484, gleichwertig `s4_07_D_keinVerfahren` Z. 488–496 |
| (e) versteckte Annahmen, Leerheit | keine versteckten Annahmen; Hypothesen nicht schon durch die Definitionen widersprüchlich; Erfüllbarkeit für m = 7, r = 34 nicht entscheidbar (offene Frage) | Abschnitt 2 (e) |
| (f) Log | stimmt überein: 0 sorry, nur propext, Classical.choice, Quot.sound | Job 139899962532, Commit 3eb57a5 |

**Insgesamt: stimmt überein.** `YangBounds.S4BedingterAusschluss.s4_07_D` ist der erste Satz von S4-07-D aus B-021, über jedem Körper, unter der Lesart von (INJ5) als Aussage über formale Polynome F, G vom Totalgrad ≤ 5 bzw. ≤ 3. Falls die Quelle „F = 0 und G = 0“ als Nullvektoren in K^34 meinen sollte, ist die Lean-Bedingung stärker und der Lean-Satz deckt dann die in (c) beschriebenen Lagen nicht ab.

## 5. Anhang: Rechnungen zu (e)

Python 3, exakte Arithmetik (sympy-Rationalzahlen bzw. `fractions.Fraction`), Laufzeit jeweils unter einer Minute.

```python
# bsp.py: <3,2,1>, length 6: hnorm, hJ (w = 0, u = q), hK hold
from sympy import Matrix, symbols, expand, zeros
X = Matrix([[2,1,1],[1,2,1],[1,1,2]]); Y = Matrix([[1,1],[1,2]])
Xi, Yi = X.inv(), Y.inv()
A = Matrix(3,2,symbols('A0:6')); B = Matrix(2,1,symbols('B0:2'))
alphas, betas, coeffs = [], [], []
for i in range(3):
  for j in range(2):
    al = (Xi*A*Y)[i,j]; be = (Yi*B)[j,0]
    C = zeros(3,1); C[:,0] = X[:,i]
    c00 = al.coeff(A[0,0])
    alphas.append(expand(al/c00)); betas.append(be); coeffs.append(C*c00)
r = 6
S = zeros(3,1)
for t in range(r): S += alphas[t]*betas[t]*coeffs[t]
assert (S - A*B).applyfunc(expand) == zeros(3,1)
assert all(al.coeff(A[0,0]) == 1 for al in alphas)
ent = lambda f,M,i,j: f.coeff(M[i,j])
a1 = [ent(al,A,1,0) for al in alphas]; a2 = [ent(al,A,2,0) for al in alphas]
q  = [ent(be,B,1,0) for be in betas]
W = Matrix([[coeffs[t][i,0] for t in range(r)] for i in range(3)])
Kp = W.nullspace()
Ssp = Matrix.hstack(Matrix(q), Matrix([a1[t]*q[t] for t in range(r)]), Matrix([a2[t]*q[t] for t in range(r)]))
print("dim K' =", len(Kp), " rank span(q,a1q,a2q) =", Ssp.rank(),
      " K' <= span:", Matrix.hstack(Ssp, *Kp).rank() == Ssp.rank())
# Ausgabe: dim K' = 3  rank span(q,a1q,a2q) = 3  K' <= span: True
```

```python
# inj.py: INJ5 alone is satisfiable (w = 1, random points and u)
import random
from fractions import Fraction
random.seed(1)
pts = [(random.randint(-50,50), random.randint(-50,50)) for _ in range(34)]
u = [random.randint(-50,50) for _ in range(34)]
mon = lambda d: [(i,j) for i in range(d+1) for j in range(d+1-i)]
cols = [[Fraction(x**i*y**j) for (x,y) in pts] for (i,j) in mon(5)] + \
       [[Fraction(u[t]*pts[t][0]**i*pts[t][1]**j) for t in range(34)] for (i,j) in mon(3)]
def rank(rows):
    rows=[r[:] for r in rows]; rk=0; n=len(rows[0])
    for c in range(n):
        p=next((i for i in range(rk,len(rows)) if rows[i][c]!=0),None)
        if p is None: continue
        rows[rk],rows[p]=rows[p],rows[rk]
        for i in range(len(rows)):
            if i!=rk and rows[i][c]!=0:
                f=rows[i][c]/rows[rk][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[rk])]
        rk+=1
    return rk
print(len(cols), "Spalten (21+10), Rang", rank(cols))
# Ausgabe: 31 Spalten (21+10), Rang 31
```

## 6. Verbrauch

Keine Subagenten, kein Fremdmodell, kein lokaler Lean-Bau. Zwei kurze Python-Rechnungen (unter einer Minute; ein erster sympy-Versuch für inj.py wurde nach etwa zwei Minuten abgebrochen und durch die Bruchrechnung ersetzt).
