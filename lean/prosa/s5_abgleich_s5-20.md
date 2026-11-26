# S5-20: Aussagen-Abgleich zu B-034 (Prüfer, Protokoll 5.1 Punkt 3)

Gegenstand: Ist `MatMulRank.rank_four_two_four_eq_26` in `lean/MatMulRank/Challenge.lean` (Zweig `portierung`, Commit 03d49c7, Zeile 94) zusammen mit `BilinearAlgorithm` und `tensorRank` derselben Datei genau die Aussage von `behauptungen/B-034.md` (main, dc1c993)?

Urteil: **stimmt überein** (Begründung je Prüfpunkt in Abschnitt 2, Vorbehalte in Abschnitt 4).

## 0. Eingeblendetes und Gesehenes außerhalb der Positivliste

Offenlegung nach CLAUDE.md Regel 12 und Protokoll 5.4:

1. **Projektgedächtnis, Index `MEMORY.md`**, vollständig eingeblendet. Inhalt: Projektbeschreibung, Ziel (exakter Rang von ⟨n,2,m⟩), Regeln zu Protokoll 0.7, Rechte und Grenzen des Orchestrators, Stufe 5 mit Spur P (Portierung für Palomar) und Spur K, Budgetangaben, Hinweise zu Fremdmodell, Bridge, Literaturwache, Merge-Ablauf und Prüferaufträgen, Verweise auf `verfahren-datenformat` und `lean-project-ci`. Der Index sagt ausdrücklich, dass er nichts über Behauptungen, Beweise, Status oder Prüfurteile enthält. Ein Urteil zu B-034 oder ein erwünschtes Ergebnis stand nicht darin.
2. **Einzeleinträge** (automatisch eingeblendet): `aussagen-abgleich-n3` (Bridge-Hinweis, lokaler Lean-Bau mit `import YangBounds.Statements`), `gemini-bridge` (Repo in der Bridge nicht freigegeben, Zeitlimit 60 s), `lean-build-cloud` (Toolchain und Mathlib-Cache in der Cloud). Keiner nennt B-034, ⟨4,2,4⟩ oder ein Urteil.
3. Im Sitzungskontext standen die Namen von Dateien im Projektordner (`A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md`). Nicht geöffnet.
4. Beim Holen der Zweige zeigte Git die Zeile `c02a5bc..dc1c993 main`. Beim Suchen nach Abschnitt 5 habe ich die Überschriften aller Abschnitte von `PROTOKOLL.md` gesehen (nur Titel, z. B. „6. Budget und Abbruch“), gelesen habe ich nur Abschnitt 5.
5. Spuren in den gelesenen Dateien und im Log (Protokoll 5.4, bloße Spuren): Auftragsnummern in Kommentaren (S1-01, S4-26, S5-03, S5-08, S5-14, S5-17), Verweise auf B-010 und B-016 in B-034 und in Kommentaren, der Hinweis „The former Challenge statement `rank_four_two_four_ge_26` … up to S5-17“ in `Solution.lean`, im Job-Log die Kurzbeschreibungen der geprüften Hauptsätze (`##[notice]`-Zeilen). Keine dieser Stellen ist ein Prüfurteil zu B-034.

Sonst habe ich nur die Dateien der Positivliste und das Log von Job 140043585790 gelesen. `MatMulRank/Definitions.lean`, `YangBounds/Transponiert444.lean` und Mathlib-Quellen habe ich nicht gelesen (siehe Vorbehalte).

## 1. Die verglichenen Aussagen

**B-034 (behauptet):** Für jeden Körper K gilt R_K(⟨4,2,4⟩) = 26. In Lean: `tensorRank K 4 2 4 = 26` für jeden Körper `K`, ohne weitere Hypothese.

**Lean, `Challenge.lean` Zeile 94:**

```lean
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26 := by
  sorry
```

mit (Zeilen 68–81, Namensraum `MatMulRank`)

```lean
structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
  alpha : Fin r → (Matrix (Fin n) (Fin l) K →ₗ[K] K)
  beta : Fin r → (Matrix (Fin l) (Fin m) K →ₗ[K] K)
  coeff : Fin r → Matrix (Fin n) (Fin m) K
  correct : ∀ (A : Matrix (Fin n) (Fin l) K) (B : Matrix (Fin l) (Fin m) K),
    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k

noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ :=
  sInf {r : ℕ | Nonempty (BilinearAlgorithm K n l m r)}
```

## 2. Prüfpunkte

### 2.1 Format (Matrixgrößen, Reihenfolge der Indizes)

`tensorRank K 4 2 4` setzt n = 4, l = 2, m = 4. Dann ist `A : Matrix (Fin 4) (Fin 2) K` (4×2), `B : Matrix (Fin 2) (Fin 4) K` (2×4) und `A * B` sowie jedes `coeff k` sind 4×4. Das ist ⟨4,2,4⟩ in der üblichen Lesart ⟨n,l,m⟩ = (n×l)·(l×m), also die Multiplikation einer 4×2- mit einer 2×4-Matrix. Die Reihenfolge n, l, m ist in allen drei Komponenten konsistent (alpha auf n×l, beta auf l×m, coeff n×m). Da ⟨4,2,4⟩ unter Vertauschen von n und m in sich übergeht, könnte eine Verwechslung von n und m hier ohnehin nichts ändern; eine Verwechslung mit l (etwa ⟨2,4,4⟩) liegt nicht vor. **Stimmt.**

### 2.2 Körper

`(K : Type u) [Field K]`, universumspolymorph in `u`, keine weitere Typklasse, keine Hypothese über Charakteristik, Endlichkeit oder algebraische Abgeschlossenheit. `Field` ist Mathlibs Klasse (Import `Mathlib.Algebra.Field.Defs`; die Datei definiert kein eigenes `Field`, kein eigenes `Matrix`, keine Notation und keine Instanz). Mathlibs `Field` enthält die Nichttrivialität 0 ≠ 1, das ist Teil des üblichen Körperbegriffs und keine Zusatzannahme. Der Satz gilt damit für jeden Körper in jedem Universum. „Für jeden Körper K“ aus B-034 ist genau getroffen. **Stimmt.**

### 2.3 Zahl

Rechte Seite `26 : ℕ` (Literal, Typ durch `tensorRank … : ℕ` festgelegt). B-034 sagt 26. **Stimmt.**

### 2.4 Rangbegriff

Ein `BilinearAlgorithm K n l m r` besteht aus r K-linearen Formen α_k auf K^{n×l}, r K-linearen Formen β_k auf K^{l×m} und r Matrizen C_k ∈ K^{n×m} mit A·B = Σ_k α_k(A) β_k(B) C_k für alle A, B. Das ist genau eine Zerlegung des Matrixmultiplikationstensors ⟨n,l,m⟩ in r Tensoren vom Rang 1 (α_k ⊗ β_k ⊗ C_k): Beide Seiten der Gleichung sind bilinear in (A, B), Gleichheit für alle A, B ist also Gleichheit der Tensoren. Das Produkt `alpha k A * beta k B` hängt im ersten Faktor nur von A, im zweiten nur von B ab, es handelt sich also um nicht-kommutative bilineare Algorithmen, und die Koeffizienten liegen in K selbst (keine Körpererweiterung). Es ist weder Grenzrang (exakte Gleichheit, keine Approximation) noch symmetrischer Rang noch kommutative Komplexität. Das ist der Rang R_K(⟨n,l,m⟩), den B-034 meint. **Stimmt.**

### 2.5 Definition über `sInf` und Konvention für die leere Menge

Die Menge S = {r ∈ ℕ | es gibt einen Algorithmus der Länge r}. Für ℕ gilt in Mathlib: ist S nicht leer, so ist `sInf S` das kleinste Element von S; ist S leer, so ist `sInf S = 0`. Dass hier tatsächlich die ℕ-Instanz verwendet wird, zeigt der Code selbst: `Solution.lean` benutzt in `tensorRank_eq_yangBounds` die Lemmata `Nat.sInf_le` und `Nat.sInf_mem` direkt auf `tensorRank` (nach `unfold tensorRank`), und der Bau ist grün.

- S ist nicht leer: `Solution.lean` Zeile 55 (`tensorRank_set_nonempty`) beweist das, über `YangBounds.tensorRank_attained`, das letztlich auf der Schulmethode `YangBounds.standardAlgorithm` (`Basic.lean` Zeile 93) beruht.
- Damit bedeutet `tensorRank K 4 2 4 = 26` genau: 26 ∈ S (es gibt einen Algorithmus der Länge 26) und kein r < 26 liegt in S (kein Algorithmus mit 25 oder weniger Produkten). Ein Monotonieargument ist dafür nicht nötig, weil `sInf` das Minimum über alle Längen ist.
- Wäre S leer, ergäbe sich 0 ≠ 26; die Konvention kann die Aussage also nur falsch, nie leer wahr machen.

**Stimmt.**

### 2.6 Leere oder triviale Erfüllbarkeit

- Der Satz hat keine Hypothese außer `[Field K]`; es gibt keine Prämisse, die unerfüllbar sein könnte.
- `Field K` ist für viele K erfüllbar (etwa ℚ), die Aussage ist also keine Aussage über eine leere Klasse.
- Die Gleichung `= 26` ist keine Ungleichung, die schon durch eine Konvention oder einen Grenzwert (0 oder ∞) erfüllt wäre. ℕ hat kein ⊤, `sInf` kann nicht „unendlich“ ergeben.
- Die Struktur `BilinearAlgorithm` verlangt die Korrektheit für alle A, B; ein entarteter Algorithmus kurzer Länge ist nicht möglich, weil die Gleichung echte Bedingungen stellt (A·B ist für 0 ≠ 1 nicht identisch null).

**Nicht leer und nicht trivial.**

### 2.7 `comparator.json` und Solution: derselbe Satz?

`lean/comparator.json`:

```json
{ "challenge_module": "MatMulRank.Challenge",
  "solution_module": "MatMulRank.Solution",
  "theorem_names": ["MatMulRank.rank_four_two_four_eq_26"],
  "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"] }
```

- Der genannte Name ist genau `MatMulRank.rank_four_two_four_eq_26`, Challenge-Modul und Solution-Modul passen zu den Dateien.
- `Solution.lean` Zeile 89: `theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26`, im Namensraum `MatMulRank`, Wortlaut der Aussage zeichengleich mit Challenge Zeile 94. `tensorRank` löst dort zu `MatMulRank.tensorRank` auf (Namensraum `MatMulRank`, `YangBounds` wird nicht geöffnet).
- `MatMulRank.tensorRank` und `MatMulRank.BilinearAlgorithm` kommen in der Solution aus `MatMulRank/Definitions.lean`, nicht aus der Challenge. Die Gleichheit der Definitionsblöcke habe ich nicht an der Datei selbst geprüft (nicht auf der Positivliste), sondern am Job-Log: Schritt „Shared definitions of Challenge and Solution are identical (S5-08)“ vergleicht mit `diff` den Block zwischen `-- BEGIN SHARED DEFINITIONS` und `-- END SHARED DEFINITIONS` sowie den Kopf bis `@[expose] public section` (die Importe) beider Dateien und meldet „shared definitions and imports identical“ (Log-Zeile 284). Siehe Vorbehalt 4.1.
- Die `permitted_axioms` sind genau die drei Standardaxiome.

**Derselbe Satz.**

### 2.8 `MatMulRank.tensorRank` und `YangBounds.tensorRank`

- Die Strukturen `MatMulRank.BilinearAlgorithm` (Challenge Z. 68–73) und `YangBounds.BilinearAlgorithm` (`Basic.lean` Z. 67–72) haben Feld für Feld dieselben Namen und Typen und dieselbe Korrektheitsgleichung.
- `YangBounds.tensorRank` (`Basic.lean` Z. 127–129) ist `Nat.find (exists_bilinearAlgorithm K n l m)`, also das kleinste r mit `Nonempty (BilinearAlgorithm K n l m r)`. Das ist derselbe Begriff wie das Minimum über `sInf` in der Challenge; dass die Menge nicht leer ist, liefert `exists_bilinearAlgorithm` über die Schulmethode.
- Die Solution zeigt die Gleichheit in `MatMulRank.tensorRank_eq_yangBounds` (`Solution.lean` Z. 63–76) für alle K, n, l, m: `≤` über `Nat.sInf_le` und die Umwandlung `ofYangBounds` eines minimalen Algorithmus, `≥` über `Nat.sInf_mem` und `YangBounds.tensorRank_le` nach `toYangBounds`. Beide Umwandlungen (Z. 37–50) kopieren die Felder unverändert, die Länge r bleibt gleich.
- Der Endsatz der Solution (Z. 89–91) schreibt mit diesem Lemma um und benutzt `YangBounds.Gleich444.rank_four_two_four_eq_26` (`Gleich444.lean` Z. 27: `tensorRank K 4 2 4 = 26` im Namensraum `YangBounds`, also mit `YangBounds.tensorRank`), das aus `Upper4x2x4.rank_four_two_four_le_26` (Z. 188–190, `tensorRank_le (algorithm K)` mit einem expliziten Algorithmus der Länge 26) und `Transponiert444.rank_four_two_four_ge_26` per `le_antisymm` folgt.

**Derselbe Begriff; die Brücke steht in `Solution.lean` Z. 63–76.**

### 2.9 Weitere Angaben aus B-034

Die in B-034 genannten Signaturen von `YangBounds.Upper4x2x4.rank_four_two_four_le_26` (`Upper4x2x4.lean` Z. 188), `YangBounds.Gleich444.rank_four_two_four_eq_26` (`Gleich444.lean` Z. 27) und `MatMulRank.rank_four_two_four_eq_26` (Challenge Z. 94, Solution Z. 89) stimmen mit dem Code überein, ebenso die Zeilennummern. Der Beweis von `Upper4x2x4.tensor_identity` läuft mit `decide +kernel` (Z. 138), kein `native_decide`.

## 3. Job-Log 140043585790 (Lauf 45858657049)

- Job „Build lean/ and report axioms“, Workflow „Lean build (own project lean/)“, Ergebnis **success**, 16:25:41 bis 16:28:39 UTC. Ausgecheckter Commit laut `git log -1`: `03d49c70014a81cf750c25073dfa498feca9717d` (Log-Zeilen 105–106 und „commit: 03d49c7…“ vor dem Axiom-Schritt). Toolchain `leanprover/lean4:v4.36.0`, Mathlib-Revision `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`.
- Bau: „Build completed successfully (4271 jobs).“ Gebaut u. a. `MatMulRank.Challenge`, `MatMulRank.Definitions`, `YangBounds.Upper4x2x4`, `YangBounds.Gleich444`, `MatMulRank.Solution`. Keine Fehlerzeile.
- `sorry`: Die einzige Warnung „declaration uses `sorry`“ im ganzen Log ist `MatMulRank/Challenge.lean:94:8` (die gewollte Lücke). Der Bericht meldet „SORRY: 0 declaration(s) … SORRY: 0 'sorry' token(s) in the sources outside comments“ und „INTENDED: 1 declaration(s) and 1 token(s) in the Palomar Challenge“, Zeilen 94 und 95.
- Axiome: Die Prüfdatei importiert `MatMulRank.Definitions` und `MatMulRank.Solution`, nicht die Challenge; geprüft wird also der bewiesene Satz der Solution. Ergebnis:
  - `'MatMulRank.rank_four_two_four_eq_26' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - ebenso für `MatMulRank.tensorRank_eq_yangBounds`, `YangBounds.Gleich444.rank_four_two_four_eq_26`, `YangBounds.Upper4x2x4.rank_four_two_four_le_26` und `MatMulRank.rank_four_two_four_ge_26`.
  - Zusammenfassung „TOTAL: STANDARD=65“, kein Satz mit anderem Axiom oder `sorryAx`.

## 4. Vorbehalte

1. **Definitions.lean nicht selbst gelesen.** Die Solution benutzt die Definitionen aus `MatMulRank/Definitions.lean`. Dass dort derselbe Definitionsblock und dieselben Importe stehen, stütze ich nur auf den `diff`-Schritt im Job-Log. Der Schritt vergleicht den markierten Block und den Kopf; was in `Definitions.lean` nach dem Block steht, prüft er nicht. Den Typ von `MatMulRank.tensorRank` könnte zusätzlicher Code nicht ändern (eine Neudefinition desselben Namens wäre ein Baufehler), Instanzen oder Attribute dort ändern den Satz nicht. Restrisiko gering, aber nicht durch eigenes Lesen ausgeschlossen.
2. **Comparator nicht gelaufen.** Der Job führt den Palomar-Comparator nicht aus. Die Gleichheit der Aussage in Challenge und Solution habe ich am Wortlaut (zeichengleich) und an der Gleichheit der Definitionen (Vorbehalt 1) festgestellt, nicht durch einen maschinellen Vergleich der elaborierten Typen.
3. **Mathlib-Konvention für `sInf` auf ℕ** habe ich nicht in der Mathlib-Quelle nachgelesen (nicht auf der Positivliste). Ich stütze mich auf die bekannte Definition (`sInf ∅ = 0`, sonst Minimum) und darauf, dass `Nat.sInf_le` und `Nat.sInf_mem` im grünen Bau auf `tensorRank` passen. Für das Urteil kommt es auf die Konvention nicht an, weil die Menge nachweislich nicht leer ist.
4. **Untere Schranke nicht geprüft.** `Transponiert444.lean` lag nicht auf der Positivliste. Das ist für den Aussagen-Abgleich nicht nötig; ob der Beweis trägt, entscheiden Bau und Axiom-Bericht (Protokoll 5.1 Punkte 1, 2, 4), nicht dieser Abgleich.
5. Kommentare habe ich nicht als Beleg benutzt; alle Aussagen oben stützen sich auf Lean-Code und Log-Zeilen.

## 5. Urteil

**Stimmt überein.** `MatMulRank.rank_four_two_four_eq_26` sagt mit den Definitionen der Challenge genau: Für jeden Körper K (jedes Universum, keine Zusatzannahme) ist die kleinste Länge eines bilinearen Algorithmus für das Produkt einer 4×2- mit einer 2×4-Matrix über K gleich 26, also R_K(⟨4,2,4⟩) = 26 im Sinn des Tensorrangs. Das ist die Aussage von B-034. `lean/comparator.json` nennt denselben Satz, die Solution beweist ihn im Wortlaut der Challenge, und `MatMulRank.tensorRank` ist nachweislich (`tensorRank_eq_yangBounds`) derselbe Begriff wie `YangBounds.tensorRank`. Vorbehalte nach Abschnitt 4.

Den Status setzt der Orchestrator.
