# S4-24: Aussagen-Abgleich `YangBounds.S4BedingterAusschluss.s4_07_D` gegen B-021, Aussage S4-07-D (erster Satz)

Rolle: Prüfer, Aussagen-Abgleich nach Protokoll 5.1 Punkt 3. Ich prüfe nicht den Lean-Beweis und nicht den Prosa-Beweis, nur ob die Aussagen übereinstimmen und was der Lean-Satz nicht abdeckt. Ich setze keinen Status.

## 0. Offenlegung

### 0.1 Eingeblendete Gedächtniseinträge

- Zu Beginn eingeblendet: der Index `team/silo/MEMORY.md` des Projektgedächtnisses (Projektregeln, Rollen, Fremdmodell, Literaturwache, Merge-Hinweise). Er enthält keine Aussage über B-021, S4-07-D oder (INJ5). Er nennt die Einträge `verfahren-datenformat` und `lean-project-ci` nur dem Namen nach.
- Während der Arbeit (nach dem Lesen der Positivliste begonnen) wurden mir drei Einzeleinträge eingeblendet: `aussagen-abgleich-n3` (Hinweise zur Bridge und zum lokalen Lean-Bau), `gemini-bridge` (Repo-Freigabe, Zeitlimit) und `lean-build-cloud` (Toolchain- und mathlib-Bau in der Cloud). Keiner enthält ein Urteil oder einen Befund zu B-021 oder zu `s4_07_D`. Nur der Name `aussagen-abgleich-n3` zeigt, dass es frühere Abgleiche gab.
- CLAUDE.md wurde automatisch eingeblendet (steht ohnehin auf der Positivliste).
- Ich habe selbst keinen Gedächtniseintrag geschrieben.

### 0.2 Spuren nach Protokoll 5.4 (nicht nachgelesen)

- Git-Commitnachrichten, die beim Bestimmen des Stands sichtbar wurden: 66f11ab „Vor Runde 5: Entscheidung von Justus (Runde 5 starten), Gedächtnisdurchsicht“, a6e8eac „Runde 4 abgeschlossen: Spur B aufgegeben (Abbruchregel 2), Nacharbeit S4-18 (Job 139899962532), Plan Runde 5“, ea72b35 „Runde 4: S4-22 eingetragen, vorläufige Feststellung Abbruchregel 2 für Spur B“, 3eb57a5 (Merge von PR #128) „S4-18: Kopfkommentar von S4BedingterAusschluss.lean ohne Quellenverweise zu (INJ5)“. Keine davon enthält ein Urteil über den Abgleich von `s4_07_D`.
- Der Kopfkommentar der Lean-Datei nennt „Task S4-18“ und B-017 bis B-019.
- Beim Suchen der Abschnittsgrenzen sah ich die Überschriftenliste von `s4_327_spurA_r2_bau.md` (u. a. „7. Bauversuch durch Rechnung“, Anhang „noninj.py (Block 2: Lagen mit verletzter (INJ5))“) und die jeweils erste Zeile von S4-07-A, S4-07-B und S4-07-E in B-021. Inhalt dieser Abschnitte habe ich nicht gelesen. Den ersten Satz von S4-07-B („In jeder Normalform eines Verfahrens der Länge 34 für ⟨3,2,7⟩ im Restfall R-327 gilt mit K′ = ker W, J = span(q_1, …, q_7), K″ := K′ + a_1·K′ + a_2·K′“) habe ich gesehen; er ist nötig, um „einer solchen Normalform“ in Aussage C aufzulösen.
- In `lean/YangBounds/Basic.lean` habe ich die Zeilen 30 bis 60 gesehen (etwas mehr als Zeilen 40 bis 46 und 56 bis 57: Docstring, `entryForm`, Anfang des Docstrings zum Schulbuchverfahren).
- Das Job-Log nennt Namen und Kurzbeschreibungen anderer Sätze des Projekts (⟨4,2,4⟩, ⟨3,2,6⟩).
- Eine Dateizählung in `lean/prosa/` zeigte, dass es dort vier weitere Dateien mit „abgleich“ im Namen gibt. Nicht geöffnet.

Ein Urteil zu dieser Behauptung oder zu diesem Lean-Satz habe ich vor meinem Urteil nicht gesehen.

### 0.3 Gelesene Stände

- `behauptungen/B-021.md` und `lean/prosa/s4_327_spurA_r2_bau.md` auf main, Stand 66f11ab.
- `lean/YangBounds/S4BedingterAusschluss.lean` und `lean/YangBounds/Basic.lean`: Stand 3eb57a5; beide Dateien sind auf main (66f11ab) unverändert (`git diff 3eb57a5 origin/main` leer).
- Log des Jobs 139899962532 (Lauf 45817224211, Workflow „Lean build (own project lean/)“, Commit 3eb57a5feb85…, Abschluss „success“, 12:10:44 bis 12:16:53 UTC), geholt über die GitHub-Schnittstelle.

## 1. Die beiden Aussagen

**Prosa (B-021, S4-07-D, erster Satz):** „In der Lage von S4-07-C gibt es kein Verfahren der Länge 34, falls zusätzlich gilt: (INJ5) aus w·F + u·G = 0 (als Vektor in K^34) mit deg F ≤ 5 und deg G ≤ 3 folgt F = 0 und G = 0.“

**Lean (Zeilen 478 bis 485):**

```lean
theorem s4_07_D (alg : BilinearAlgorithm K 3 2 7 34)
    (hnorm : ∀ t, alg.alpha t (unitMatrix 0 0) = 1)
    (w u : Fin 34 → K)
    (hJ : Jspace alg = mulP (aVec alg 1) (aVec alg 2) w 2 ⊔ K ∙ u)
    (hK : Kprime alg ≤ Jspace alg ⊔ (Jspace alg).map (LinearMap.mulLeft K (aVec alg 1)) ⊔
      (Jspace alg).map (LinearMap.mulLeft K (aVec alg 2)))
    (hINJ5 : INJ5 (aVec alg 1) (aVec alg 2) w u) : False
```

mit `{K : Type u} [Field K]` aus Zeile 99.

## 2. Abgleich Punkt für Punkt

### (a) Format, Länge, Körper: stimmt überein

- `BilinearAlgorithm K 3 2 7 34` (Basic.lean Z. 40 bis 46): 34 Linearformen `alpha t` auf 3×2-Matrizen, 34 Linearformen `beta t` auf 2×7-Matrizen, 34 Matrizen `coeff t` vom Format 3×7, und `correct : ∀ A B, A * B = ∑ t, (alpha t A * beta t B) • coeff t` mit dem gewöhnlichen Matrixprodukt von mathlib. Das ist wörtlich die Form „AB = Σ_{t=1}^{34} α_t(A)β_t(B)C_t“ aus 1.1 für ⟨3,2,7⟩ (A ∈ K^{3×2}, B ∈ K^{2×7}). Die Indexmenge {1, …, 34} der Prosa ist `Fin 34`; das ist bloß eine Umbenennung.
- `alg.correct` entspricht den Brent-Gleichungen: Die Identität ist bilinear in (A, B), gilt also für alle A, B genau dann, wenn sie für alle Paare von Matrixeinheiten (e_{ij}, e_{j'k}) gilt; das sind genau die Brent-Gleichungen Σ_t α_t(e_{ij}) β_t(e_{j'k}) C_t = δ_{jj'} e_{ik}. Die Datei leitet die benötigten Fälle so ab (`brent`, `W_aq`, `W_ap`, `W_bq`); ich prüfe diese Beweise nicht, aber die Gleichwertigkeit ist elementar.
- Länge genau 34 und Format ⟨3,2,7⟩ stehen im Typ von `alg`. Die Länge wird nicht als „höchstens 34“ gelesen; das entspricht der Prosa, die nur Länge 34 behandelt (1.1: 34 ist die untere Schranke, die Länge bleibt 34).
- Körper: Der Satz gilt für jeden Körper `K` (beliebiges Universum `u`). Die Lage von S4-07-C ist nach 1.1 und der Vorbemerkung von B-021 eine Normalform über dem algebraischen Abschluss (R1). Ein algebraisch abgeschlossener Körper ist ein Körper, also ist der Lean-Satz dort anwendbar. Die Allgemeinheit über allen Körpern ist kein Mangel, siehe aber (e) zu sehr kleinen endlichen Körpern.

### (b) Definitionen: stimmen überein

Prosa 1.2 gegen Lean (Zeilen 107 bis 131 und 250 bis 272):

| Lean | Definition in Lean | Prosa (1.2 bzw. 3.1) | Urteil |
|---|---|---|---|
| `unitMatrix i j` | Matrix mit 1 an (i, j), sonst 0 (Basic.lean Z. 56/57) | e_{ij} | stimmt |
| `aVec alg i` | `t ↦ alpha t (unitMatrix i 0)` | a_i = (α_t(e_{i0}))_t, i = 0, 1, 2 | stimmt; i : Fin 3 ist 0, 1, 2 wie in der Prosa |
| `qVec alg k` | `t ↦ beta t (unitMatrix 1 k)` | q_k = (β_t(e_{1k}))_t | stimmt; Prosa k = 1, …, 7, Lean k : Fin 7 = 0, …, 6, bloße Umbenennung, J hängt nur von der Menge aller q_k ab |
| `Wmap alg` | `v ↦ ∑ t, v t • coeff t` | W(v) = Σ_t v_t C_t | stimmt |
| `Kprime alg` | `LinearMap.ker (Wmap alg)` | K′ := ker W | stimmt |
| `Jspace alg` | `Submodule.span K (Set.range (qVec alg))` | J = span(q_1, …, q_7) | stimmt |
| `ev a₁ a₂` | `aeval ![a₁, a₂]` in die Algebra `T → K` | Auswertung eines Polynoms in den a-Koordinaten an den 34 a-Punkten (a_1(t), a_2(t)) | stimmt: In der Pi-Algebra `T → K` sind Addition und Multiplikation komponentenweise, also ist `(ev a₁ a₂ F) t = F(a₁ t, a₂ t)`; `X 0 ↦ a_1`, `X 1 ↦ a_2` |
| `mulP a₁ a₂ v d` | Bild von `restrictTotalDegree (Fin 2) K d` unter `F ↦ v * ev F` | v·P_d = {v·f : f ∈ P_d}, P_d = span{a_1^μ a_2^ν : μ + ν ≤ d} | stimmt: `restrictTotalDegree` ist in mathlib der Untermodul der Polynome mit `totalDegree ≤ d` (aufgespannt von den Monomen vom Gesamtgrad ≤ d); sein Bild unter der linearen Auswertung ist der Spann der ausgewerteten Monome, also P_d; „deg“ in zwei Variablen ist der Gesamtgrad μ + ν |
| `LinearMap.mulLeft K v` | `x ↦ v * x` | Multiplikation mit v (komponentenweise) | stimmt; `(Jspace alg).map (mulLeft K a_i)` ist a_i·J |
| `K ∙ u` | `Submodule.span K {u}` | ⟨u⟩ | stimmt |
| `·` der Prosa | `*` in `Fin 34 → K` | komponentenweises Produkt | stimmt |
| `INJ5 a₁ a₂ w u` | `∀ F G : MvPolynomial (Fin 2) K, F.totalDegree ≤ 5 → G.totalDegree ≤ 3 → w * ev F + u * ev G = 0 → F = 0 ∧ G = 0` | (INJ5), siehe (c) | stimmt mit dem Wortlaut, Vorbehalt V1 |

Nicht in den Satz gehen ein: `bVec`, `pVec`, `cVec`, `rep` (Hilfsgrößen des Beweises). `bVec`, `pVec` sind gleichwohl korrekt definiert (b_i = α_t(e_{i1}), p_k = β_t(e_{0k})).

Die Größen w und u: In Lean sind `w u : Fin 34 → K` beliebige Vektoren, die nur über `hJ` und `hINJ5` eingeschränkt sind. In der Prosa ist w = j_v für v ∈ S, v ≠ 0 (3.1), und u ∈ J mit J = w·P_2 ⊕ ⟨u⟩ (Aussage C). Weil der Lean-Satz für alle w, u mit den Hypothesen gilt, deckt er die Prosa-Wahl ab, gleich welches v ∈ S (dim S = 1, w also bis auf einen Faktor festgelegt) und welches zulässige u gewählt wird.

### (c) Hypothesen: Jede folgt aus der Lage von S4-07-C; (INJ5) stimmt mit dem Wortlaut überein (Vorbehalt V1)

- **`hnorm : ∀ t, alpha t (e_{00}) = 1`.** Folgt aus der Normalform: Die Vorbemerkung von B-021 nimmt die Skalierung α_t(e_{00}) = 1 ausdrücklich in den Begriff „Normalform“ auf, 1.1 setzt a_0 = (1, …, 1). Aussage C spricht von „einer solchen Normalform“. Stimmt.
- **`hJ : J = w·P_2 ⊔ ⟨u⟩`.** Aussage C: „J = w·P_2 ⊕ ⟨u⟩ für ein u ∈ J“. Lean verlangt nur die Summe (⊔), nicht die Direktheit; die Lean-Hypothese ist also schwächer und folgt aus C. Stimmt.
- **`hK : K′ ≤ J + a_1·J + a_2·J`.** Folgt auf zwei Wegen aus der Lage: (1) 1.2 übernimmt aus R-327 „K′ = J + a_1·J + a_2·J“, und Aussage C setzt über Aussage B den Restfall R-327 voraus. (2) Unmittelbar aus Aussage C: K′ = w·P_3 ⊕ u·P_1; wegen P_3 = P_2 + a_1·P_2 + a_2·P_2 und w·P_2 ⊆ J, u ∈ J gilt w·P_3 + u·P_1 ⊆ J + a_1·J + a_2·J. Lean nimmt nur die Inklusion „≤“ an. Stimmt.
- **`hINJ5`.** Wortlaut B-021: „aus w·F + u·G = 0 (als Vektor in K^34) mit deg F ≤ 5 und deg G ≤ 3 folgt F = 0 und G = 0.“ Lean: für alle formalen Polynome F, G in zwei Variablen mit Gesamtgrad ≤ 5 bzw. ≤ 3 folgt aus `w * ev F + u * ev G = 0` (Gleichung in `Fin 34 → K`, also in K^34) `F = 0 ∧ G = 0` als formale Polynome. Gleichung als Vektorgleichung in K^34: stimmt. Gradgrenzen 5 und 3: stimmt (Gesamtgrad, wie P_d). Folgerung über die Polynome selbst: stimmt. Die Auswertungspunkte sind (a_1(t), a_2(t)) mit a_1 = `aVec alg 1`, a_2 = `aVec alg 2`, also die a-Punkte aus 1.2: stimmt. Die Variablen F, G sind allquantifiziert, w und u sind die festen Vektoren der Lage: stimmt.

  **Vorbehalt V1 (Lesart von F, G).** Der Wortlaut lässt eine zweite Lesart zu: F ∈ P_5 und G ∈ P_3 als Vektoren in K^34 (1.2 nennt P_d „Polynome vom Grad ≤ d …, ausgewertet“), und „F = 0“ als Vektorgleichung. Die beiden Lesarten sind nicht gleichwertig. Genau gilt:

  (INJ5 formal, Lean) ⇔ (INJ5 als Vektoren) und dim P_5 = 21, d. h. kein Polynom ≠ 0 vom Grad ≤ 5 verschwindet an allen a-Punkten.

  Begründung: „⇒“: Ist f ∈ P_5, g ∈ P_3 mit w·f + u·g = 0, wähle F, G mit ev F = f, ev G = g und den Gradschranken; dann F = G = 0, also f = g = 0. Mit G = 0 und ev F = 0 folgt F = 0, also ist ev auf den Polynomen vom Grad ≤ 5 injektiv. „⇐“: Aus w·ev F + u·ev G = 0 folgt nach der Vektorlesart ev F = 0 und ev G = 0, wegen der Injektivität F = 0 und G = 0.

  Aussage C, soweit sie mir vorliegt, liefert dim w·P_4 = 15, also dim P_4 = 15, aber nichts über dim P_5. Unter der Vektorlesart deckt der Lean-Satz deshalb nur die Lagen mit dim P_5 = 21 ab, nicht etwa Lagen, deren a-Punkte alle auf einer Kurve vom Grad ≤ 5 liegen (z. B. höchstens 20 verschiedene a-Punkte). Ob es solche Lagen mit vektoriell erfülltem (INJ5) gibt, kann ich aus den mir erlaubten Stellen nicht entscheiden.

  Für die formale Lesart spricht der Wortlaut: „deg F“ ist ein Begriff für Polynome, nicht für Vektoren (ein Vektor in P_5 hat keinen wohlbestimmten Grad), und der Zusatz „(als Vektor in K^34)“ ist nur nötig, wenn F und G selbst keine Vektoren sind. Ich lese den Wortlaut daher wie Lean. Urteil zu (INJ5): stimmt überein mit der formalen Lesart; stimmt nicht überein, falls B-021 die Vektorlesart meint.

Damit gilt: Jede Lage, von der D spricht, ist eine, auf die der Lean-Satz anwendbar ist, unter der formalen Lesart von (INJ5). Lean braucht dafür weder e = 3 (dim w·P_2 = 6) noch die Dimensionsangaben, die Direktheit der Summen, die Kronecker-Gestalt oder die Aussagen über den Träger von w aus Aussage C, ebenso nicht (SN1), (SN2) oder R1; der Lean-Satz ist in diesen Punkten allgemeiner als D.

### (d) Schluss: stimmt überein

`False` unter allen Hypothesen, allquantifiziert über `alg`, `w`, `u`, ist gleichbedeutend mit der Nichtexistenz eines Verfahrens der Länge 34 für ⟨3,2,7⟩ in Normalform zusammen mit Vektoren w, u, die die Lage und (INJ5) erfüllen. Die Datei formuliert das zusätzlich als `s4_07_D_keinVerfahren : ¬ ∃ alg w u, … ` (Zeilen 488 bis 496); dieser Satz erscheint nicht im Axiom-Bericht, ist aber ein direkter Aufruf von `s4_07_D`.

Abgrenzung: „kein Verfahren“ in D bezieht sich auf Verfahren in der Lage von C, also auf Normalformen. Dass ein beliebiges Verfahren der Länge 34 über einem beliebigen Körper in eine solche Normalform übergeht (R1, R2, Lemma A, Skalierung, Restfall R-327, Existenz von w, Wahl von u), ist nicht Teil des Lean-Satzes. Das ist auch nicht Teil des ersten Satzes von D, der „in der Lage von S4-07-C“ voraussetzt; der Kopfkommentar der Datei (Zeilen 79 bis 87) nennt diese Grenze ausdrücklich.

### (e) Versteckte Zusatzannahmen, Leerheit: keine versteckten Annahmen; leer nur über Körpern mit höchstens 5 Elementen (Vorbehalt V2)

- Der Satz hat keine weiteren Typklassen- oder Instanzannahmen als `[Field K]`. Kein `variable` mit verborgener Hypothese geht in `s4_07_D` ein: Die Abschnittsvariablen `{m r} (alg)` aus `section Main` werden in `s4_07_D` durch das explizite `alg : BilinearAlgorithm K 3 2 7 34` ersetzt; `w u` sind explizit.
- `hJ` und `hK` sind für sich erfüllbar (z. B. Gleichheit statt Inklusion, wie in der Lage). `hnorm` ist eine Normierung. Dass alle Hypothesen zusammen unerfüllbar sind, ist der Inhalt des Satzes.
- **Vorbehalt V2.** Über einem endlichen Körper F_q mit q ≤ 5 ist `INJ5` nie erfüllt: F = X_0^q − X_0 ist ein formales Polynom ≠ 0 vom Gesamtgrad q ≤ 5, das an jedem Punkt von K² verschwindet, also ist mit G = 0 die Prämisse `w * ev F + u * ev G = 0` erfüllt, aber F ≠ 0. Über F_2, F_3, F_4, F_5 ist der Lean-Satz daher leer. Für den Abgleich ist das ohne Folgen, weil die Lage von S4-07-C über einem algebraisch abgeschlossenen Körper liegt (R1); es zeigt aber, dass die Angabe „Over every field“ im Docstring (Zeile 477) nur über unendlichen Körpern bzw. Körpern mit mehr als 5 Elementen Inhalt hat. Unter der Vektorlesart von (INJ5) gäbe es diese Leerheit nicht (siehe V1).
- Kein `sorry`, keine eigenen Axiome, kein `native_decide` im Quelltext der Datei (gelesen) und im Log (siehe (f)).

### (f) Log des Jobs 139899962532: bestätigt

Lauf 45817224211, Job 139899962532 „Build lean/ and report axioms“, Workflow „Lean build (own project lean/)“, Ergebnis success. Wörtliche Zeilen:

- Checkout: `3eb57a5feb8596d88a4de5245b7cbe6f823b4c31` (Logzeit 12:10:46.4344658Z); vor der Axiomprüfung `commit: 3eb57a5feb8596d88a4de5245b7cbe6f823b4c31` (12:15:28.8400436Z).
- Bau: `✔ [1743/1764] Built YangBounds.S4BedingterAusschluss` (12:12:25.1317061Z), `Build completed successfully.` (12:15:28.7113947Z).
- sorry-Bericht (projektweit):
  - `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log` (12:15:28.8240499Z)
  - `SORRY: 0 'sorry' token(s) in the sources outside comments` (12:15:28.8240753Z)
- Axiome für diesen Satz:
  - `'YangBounds.S4BedingterAusschluss.s4_07_D' depends on axioms: [propext, Classical.choice, Quot.sound]` (12:16:52.8899287Z)
  - `AXIOM-RESULT|YangBounds.S4BedingterAusschluss.s4_07_D|propext, Quot.sound, Classical.choice` (12:16:52.8899701Z)
  - `[STANDARD] YangBounds.S4BedingterAusschluss.s4_07_D` mit `axioms: ['Classical.choice', 'Quot.sound', 'propext']  -- only propext, Classical.choice, Quot.sound` (12:16:52.9766032Z bis …6849Z)
- Im Log keine Zeile mit `error`, `ofReduceBool` oder `native` für diese Datei.

Nur Standard-Axiome, kein sorry. Bestätigt.

## 3. Was der Lean-Satz nicht abdeckt

1. Den Übergang von einem beliebigen Verfahren zur Lage von S4-07-C (R1, R2, Lemma A, Skalierung, Restfall R-327, Existenz von w, Fallunterscheidung nach e, Wahl von u). Diese Teile gehen nur als Hypothesen `hnorm`, `hJ`, `hK` ein; `hK` stützt sich in der Prosa auf R-327 (bzw. auf Aussage C).
2. Den zweiten Satz von S4-07-D („Gleichwertig gesagt: …“).
3. Die Frage, ob (INJ5) für irgendein Verfahren gilt.
4. Unter der Vektorlesart von (INJ5): die Lagen mit dim P_5 < 21 (V1).
5. Über F_2 bis F_5 hat der Satz keinen Inhalt (V2); für die Lage von C ohne Belang.

## 4. Urteil

| Punkt | Urteil | Stelle |
|---|---|---|
| (a) Format, Länge, Körper | stimmt überein | Basic.lean Z. 40 bis 46; S4BedingterAusschluss.lean Z. 99, 478 |
| (b) Definitionen | stimmt überein | Z. 107 bis 131, 250 bis 272 gegen Prosa 1.2, 3.1 |
| (c) Hypothesen `hnorm`, `hJ`, `hK` | stimmt überein (Lean jeweils schwächer oder gleich) | Z. 479, 481 bis 483 gegen Vorbemerkung B-021, 1.1, 1.2, Aussage C |
| (c) Hypothese `hINJ5` | stimmt überein mit dem Wortlaut in der formalen Lesart; Vorbehalt V1: bei Lesart von F, G als Vektoren in P_5, P_3 stimmt nicht überein (Lean deckt dann nur dim P_5 = 21 ab) | Z. 129 bis 131, 484 gegen B-021 S4-07-D |
| (d) Schluss | stimmt überein | Z. 484, 488 bis 496 |
| (e) Zusatzannahmen, Leerheit | keine versteckten Annahmen; Vorbehalt V2 (leer über Körpern mit ≤ 5 Elementen, für die Lage ohne Belang) | Z. 99, 129 bis 131, 477 |
| (f) Log | bestätigt: 0 sorry, nur propext, Classical.choice, Quot.sound | Job 139899962532, Zeilen oben |

**Gesamturteil: stimmt überein**, mit Vorbehalt V1. Der Lean-Satz `YangBounds.S4BedingterAusschluss.s4_07_D` ist die Aussage des ersten Satzes von S4-07-D in B-021, wenn (INJ5) so gelesen wird, wie der Wortlaut nahelegt: F, G sind Polynome vom Grad ≤ 5 bzw. ≤ 3 in a_1, a_2, die Gleichung gilt nach Auswertung als Vektor in K^34, die Folgerung betrifft die Polynome selbst. Jede Lage von S4-07-C mit (INJ5) in dieser Lesart erfüllt die Hypothesen des Lean-Satzes. Ist (INJ5) dagegen für Vektoren F ∈ P_5, G ∈ P_3 gemeint, ist die Lean-Hypothese strikt stärker, nämlich um die Bedingung dim P_5 = 21; dann stimmt die Aussage nicht überein. Welche Lesart B-021 meint, entscheidet der Orchestrator.
