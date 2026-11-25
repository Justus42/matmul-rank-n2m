# Brücke zum algebraisch abgeschlossenen Körper für ⟨4,2,4⟩ (S2-35)

Auftrag S2-35, Stufe 2, Runde 9, Spur A, Rolle Formalisierer. Status aller Aussagen hier: **behauptet**.
Lean: `lean/YangBounds/Bruecke444.lean`. Keine Fremdmodell-Anfrage.

## 1. Lücke

`SatzC444.folgerungC1_generisch` liefert für jede Zerlegung `alg` der Länge 25 von ⟨4,2,4⟩ über einem Körper K die Zerlegung `genAlg alg` über F = K(S,T) mit (N1), (N2), Fall (5,8) und ohne Symmetrie. `SatzE444.satzE` und `LemmaP444.nur_unterfallB'` verlangen `[IsAlgClosed K]`. F ist nicht algebraisch abgeschlossen. Beim Übergang zu einer Erweiterung L ⊇ F sind zwei Eigenschaften nicht von selbst stabil:

- (N2) ist eine Aussage „für alle w ≠ 0“; über L gibt es mehr w.
- „nicht symmetrisch“ verneint die Existenz von (G, μ); über L gibt es mehr Kandidaten.

## 2. Konstruktion

L = `GBar K` = algebraischer Abschluss von F, ι: F → L. Über L wird derselbe generische Basiswechsel gebildet:

`genAlgL alg = changeBasis (alg.baseChange L) (S.map ι) (T.map ι)`.

Auf F-Matrizen nehmen seine Formen die ι-Bilder der Formen von `genAlg alg` an (`genAlgL_alpha_map`, `genAlgL_beta_map`; benutzt (T.map ι)⁻¹ = (T⁻¹).map ι).

## 3. (N1) über L

α'_t(e_00) = ι(α_t^gen(e_00)) ≠ 0, weil ι injektiv ist und (N1) für `genAlg` gilt.

## 4. (N2) über L

Wie in `genSN2` reicht: Für jedes w ≠ 0 über L ist a ↦ (α_t(a pᵀ) β_t(w))_t injektiv, mit p = ι(T₀₀, T₀₁).

Argument (Lemma `genInjL`): Sei s = {t : β_t(w) ≠ 0}. Der Kern der Abbildung hängt nur von s ab: Er ist der Kern der Matrix N_s(p) mit Zeilen (α_t(e_a pᵀ))_a für t ∈ s und Nullzeilen sonst. Nach Yangs Lemma (`lmap_injective`) gibt es einen Punkt p₀ über L mit p₀ᵀw ≠ 0, an dem die Abbildung injektiv ist. Also hat N_s(p₀) einen invertierbaren 4×4-Minor zu Zeilen f. Derselbe Minor, mit p als Unbestimmten, ist ein Polynom P_{s,f} in zwei Variablen **mit Koeffizienten in K** (die Koeffizienten sind Werte α_t(e_ij) des Ausgangsalgorithmus, s und f sind nur Indexmengen). Es ist ≠ 0, da es bei p₀ nicht verschwindet. T₀₀, T₀₁ sind über K algebraisch unabhängig, also P_{s,f}(T₀₀, T₀₁) ≠ 0 in F und damit ι davon ≠ 0 in L. Der Minor ist am generischen Punkt invertierbar, die Abbildung injektiv.

Bemerkung zum Abgleich S2-30 (Abschnitt 4): Dort steht, der Beweis von `genSN2` nutze, dass p generisch über dem Körper der Einträge von v ist, und über dem Abschluss gelte das nicht mehr. Der Lean-Beweis braucht das nicht: w geht nur über die Trägermenge s ein, das Polynom hat Koeffizienten in K. Deshalb trägt das Argument über jeder Erweiterung von F.

## 5. Nicht-Symmetrie über L (Abstieg)

Lemma `descent`: Sei F unendlich, L ⊇ F, a, b: Fin r → Fin 4 → F. Hat das lineare System

∑_j E_ji b_tj = μ_t a_ti  (für alle t, i)

eine Lösung (E, μ) über L mit det E ≠ 0, so hat es eine über F mit det E₀ ≠ 0.

Beweis: Seien ω_1, …, ω_n eine F-Basis des F-Spans der endlich vielen Koordinaten von (E, μ). Schreibe E = ∑_k ω_k E_k, μ = ∑_k ω_k μ_k mit E_k, μ_k über F. Da das System Koeffizienten in F hat und die ω_k über F linear unabhängig sind, löst jedes (E_k, μ_k) das System. P(c) = det(∑_k c_k E_k) ist ein Polynom über F mit P(ω) = det E ≠ 0, also P ≠ 0. Da F unendlich ist, gibt es c ∈ Fⁿ mit P(c) ≠ 0; (∑ c_k E_k, ∑ c_k μ_k) ist die gesuchte Lösung über F.

Anwendung (`isSymm_descent`, `nichtSymm_genAlgL`): `IsSymm B` ist genau dieses System mit a_ti = (a_t)_i und b_tj = β_t(emb e_j), G = E als Matrix. Für `genAlgL` und `genAlg` stimmen a und b bis auf ι überein. Eine Symmetrie von `genAlgL alg` gäbe also eine von `genAlg alg` über F = K(S,T), gegen `satzC_generisch`. F ist unendlich (Bruchkörper eines Polynomrings mit Variablen).

## 6. Fall (5,8) über L

Satz B (`satzB_unbedingt`) gilt über jedem Körper, also auch über L: Fall (3,6) oder (5,8). Im Fall (3,6) wäre `genAlgL alg` nach `satzB_symm_unbedingt` symmetrisch, gegen Abschnitt 5. Ränge müssen deshalb nicht über die Körpererweiterung transportiert werden.

## 7. Ergebnis (Lean)

- `bruecke`: Für jeden Körper K und jede Zerlegung der Länge 25 von ⟨4,2,4⟩ über K erfüllt `genAlgL alg` über dem algebraisch abgeschlossenen Körper `AlgebraicClosure K(S,T)` (N1), (N2), den Fall (5,8) und `NichtSymmetrisch`.
- `bruecke_exists`: dieselbe Aussage als Existenz über irgendeinem algebraisch abgeschlossenen Körper.
- `bruecke_unterfallB`: `nur_unterfallB'` angewandt, `genAlgL alg` liegt in Unterfall B.
- `bruecke_nicht_unterfallA`: `satzE` angewandt.
- `brueckeStatement`: `Endsatz444.BrueckeStatement K` für jeden Körper K (die Hypothese des Endsatzes aus S2-36, sogar ohne `IsAlgClosed K`).
- `rank_four_two_four_ge_26_of_unterfallB`: der Endsatz `Endsatz444.rank_four_two_four_ge_26_of` mit erledigter Brücken-Hypothese. Übrig bleibt nur `UnterfallBStatement` (Auftrag S2-34).

Keine benannte Hypothese bleibt offen.

## 8. Wahl des Weges und Antwort auf die Frage nach „Rang fällt bei Körpererweiterung“

**Frage:** Wird die Brücke einfacher über „Rang fällt bei Körpererweiterung“?

**Antwort:** Das Prinzip ist richtig und wird benutzt, es trägt aber nicht die eigentliche Last. Eine Zerlegung der Länge r über K gibt durch Basiswechsel eine der Länge r über jeder Erweiterung (`baseChange`), also R_L ≤ R_K. Damit genügt eine untere Schranke über algebraisch abgeschlossenen Körpern. Eine Zerlegung über einem abgeschlossenen Körper mit (N1) und (N2) gab es aber schon vorher (`satzA_exists`, verwendet in `satzE_global`). Was fehlt, ist eine solche Zerlegung, die zugleich **nicht symmetrisch** ist, und gerade diese Eigenschaft wird beim Basiswechsel nicht mitgenommen. Auch (N2) wird nicht mitgenommen. Die Arbeit liegt also in den Abschnitten 4 und 5, nicht im Rangvergleich.

Zu den drei vorgeschlagenen Wegen:

- (a) Zuerst K durch K̄ ersetzen, dann den generischen Punkt bilden: hilft nicht, denn K̄(S,T) ist wieder nicht abgeschlossen. Der gewählte Weg ist die zweite Hälfte von (a): Basiswechsel von K(S,T) auf seinen Abschluss. Ränge müssen dabei nicht transportiert werden (Abschnitt 6). (N2) überträgt sich mit dem Minorenargument, die Nicht-Symmetrie durch Abstieg.
- (b) Satz C direkt über dem Abschluss mit einer Derivation: scheitert in positiver Charakteristik, denn ∂/∂T₀₁ setzt sich nicht auf inseparable Elemente (etwa T₀₁^{1/p}) fort. Nicht nötig, weil der Abstieg genügt.
- (c) Satz E und Lemma P ohne `IsAlgClosed`: `lemmaP` braucht nur einen unendlichen Körper, aber `satzE` benutzt die algebraische Abgeschlossenheit wesentlich (Wurzeln). Nicht untersucht, weil der gewählte Weg ohne Änderung bestehender Sätze trägt.
