# S2-30: Aussagen-Abgleich B-012 (Satz C, Folgerung C1), Stufe 2, Runde 8

- Auftrag: S2-30 des Orchestrators, Rolle Prüfer, Aussagen-Abgleich nach Protokoll 5.1 Punkt 3.
- Datum: 25.11.2026
- Gegenstand: `lean/YangBounds/SatzC444Kern.lean` (`satzC_kern`) und `lean/YangBounds/SatzC444Generisch.lean` (`satzC_generisch`, `folgerungC1_generisch`, `folgerungC1_nicht36`, `genAlg`, `GField`), Stand `main` bei `b8cee48` (die beiden Dateien sind seit dem Merge `0563469` von PR #59 unverändert).
- Abgeglichen gegen: `behauptungen/B-012.md` (Feld „Aussage“ und die dort genannte Reparatur R-C1) und `lean/prosa/s2_444_spurA_r4.md`, Abschnitte 2, 3 und 4.
- Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, `behauptungen/B-012.md`, `behauptungen/README.md`, `behauptungen/B-009.md` (nur als Formvorlage, Abschnitt „Abgleich Punkt für Punkt“), die genannten Prosa-Abschnitte, den Lean-Code von `Basic.lean`, `YangN3Teil1.lean` (`extendForm`, `baseChange`), `YangN3Teil2.lean` (`outer`, `basisVec`, `changeBasis`), `YangN3Teil3.lean` (`emb`), `YangN4Haupt.lean` (Objekte, `SN1`, `SN2`, `Lq`, `Hq`, `Var`, `matS`, `matT`), `SatzB444.lean` (`avecs`, `IsSymm`), `SatzB444Final.lean`, `SatzC444Kern.lean`, `SatzC444Generisch.lean` und die Aussagen in `SatzE444.lean` (nur für Frage 5).
- Nicht gelesen: `LOG.md`, `STATUS.md`, `lean/prosa/s2_444_spurA_r4_pruefung.md` und alle anderen Dateien mit „pruefung“ im Namen.
- **Offenlegung.** (1) Das Feld „Prüfung“ in `B-012.md` enthält eine Zusammenfassung des Prosa-Prüfurteils von S2-22 (Satz C hält, C1 mit Reparatur R-C1). Es stand beim Öffnen der Behauptung vor mir. (2) Die Sitzung hat mir ungefragt Projektnotizen eingeblendet, darunter eine kurze Notiz zur Prosa-Prüfung S2-22 (Inhalt wie in (1), dazu: „Lean-IsSymm reicht, wenn an allen p einer offenen Menge“) und eine Notiz des Formalisierers S2-26 (wie in der Moduldoku). Beides betrifft die Prosa-Prüfung bzw. die Selbstauskunft, nicht die Frage, ob der Lean-Satz die behauptete Aussage ist. Mein Urteil unten stützt sich nur auf den Quelltext. Dem Fremdmodell habe ich keine dieser Notizen und kein Prüfurteil gegeben.
- Status dieses Berichts: Urteil eines Prüfers und eines Fremdmodells im Sinn von 5.1 Punkt 3. Was danach als **geprüft** gilt, steht in Abschnitt 6.

---

## 1. Lauf in GitHub Actions (5.1 Punkte 1, 2, 4)

Selbst nachgesehen, nicht aus dem Bericht des Formalisierers übernommen.

- Lauf **45653961790** („Lean build (own project lean/)“), Ereignis `push` auf `main`, Commit `0563469` (Merge von PR #59), Ergebnis **success**, Job 139345533177.
- Build-Schritt: `Built YangBounds.SatzC444Kern`, `Built YangBounds.SatzC444Generisch`, `Build completed successfully.`
- sorry-Zeilen im Log, wörtlich:
  `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log` und
  `SORRY: 0 'sorry' token(s) in the sources outside comments`.
- Axiome, wörtlich aus dem Log: `satzC_kern`, `genSN1`, `genSN2`, `satzC_generisch`, `folgerungC1_generisch`, `folgerungC1_nicht36` hängen je nur von `[propext, Classical.choice, Quot.sound]` ab; der Axiom-Bericht schließt mit `TOTAL: STANDARD=12`.
- Der nächste Lauf auf `main` (45658431578, Commit `b8cee48`, Merge von PR #60) ist ebenfalls grün. Zwischen `0563469` und `b8cee48` hat sich unter `lean/` nur `SatzE444*.lean`, `YangBounds.lean` und `Axioms.lean` geändert (je nur Zusätze), die abgeglichenen Dateien nicht.
- In `SatzC444Kern.lean` und `SatzC444Generisch.lean` steht kein `sorry`, kein `axiom`, kein `native_decide` außerhalb von Kommentaren.
- Eine eigene lokale Lean-Probe war in diesem Container nicht möglich (keine Lean-Werkzeugkette). Die Übersetzung in Abschnitt 2 habe ich von Hand aus den Definitionen nachgerechnet.

Punkte 1, 2 und 4 von 5.1 sind damit für diese Sätze erfüllt.

---

## 2. Was die Lean-Sätze sagen (Definitionen aufgelöst)

Bezeichnungen der Prosa: A_t ∈ K^{4×2}, B_t ∈ K^{2×4} mit α_t(A) = Σ A_t[i,k] A[i,k], β_t(B) = Σ B_t[k,j] B[k,j]; a_t(p) = A_t p, b_t(p) = B_tᵀ J p, J = [[0,−1],[1,0]].

**Format.** `BilinearAlgorithm K 4 2 4 r` ist eine Zerlegung A·B = Σ_t α_t(A) β_t(B) C_t für A ∈ K^{4×2}, B ∈ K^{2×4} (mathlib-Produkt, nicht transponiert), Länge r. Das ist ⟨4,2,4⟩.

**Generische Normalform.** `GField K` ist der Körper K(S,T) der rationalen Funktionen in den 16 + 4 Einträgen einer 4×4-Matrix S und einer 2×2-Matrix T (`Var 3`). `genAlg alg` ist `changeBasis` von `alg` (nach Körpererweiterung auf K(S,T)) mit diesen generischen S, T, also

  α′_t(A) = α_t(S A T),  β′_t(B) = β_t(T⁻¹ B).

Nachgerechnet:
- `avecs (genAlg alg) t i` = α′_t(e_i e_0ᵀ) = α_t((S e_i) pᵀ) mit **p = Tᵀe_0 = (T₀₀, T₀₁)**, also `avecs` = Sᵀ a_t(p) und Σ_i y_i·avecs_i = a_t(p)·(S y).
- `(genAlg alg).beta t (emb y)` = β_t(T⁻¹ (0; y)) = β_t(v yᵀ) mit v = T⁻¹e_1 = (det T)⁻¹ (−T₀₁, T₀₀) = (det T)⁻¹ J p. Also β′_t(emb y) = (det T)⁻¹ b_t(p)·y.

**`IsSymm (genAlg alg)`** heißt: Es gibt e ∈ GL_4(K(S,T)) und μ_t ∈ K(S,T) mit (det T)⁻¹ b_t(p)·(e y) = μ_t a_t(p)·(S y) für alle y, also (det T)⁻¹ eᵀ b_t(p) = μ_t Sᵀ a_t(p). Mit **M := S⁻ᵀ eᵀ** ist das

  **M b_t(p) = (μ_t det T) · a_t(p) für alle t, M ∈ GL_4(K(S,T)),**

und umgekehrt gibt jedes solche M ein e = Mᵀ S. `IsSymm (genAlg alg)` ist also genau die Symmetrie der Prosa (M_p b_t(p) ∈ K̄·a_t(p), M_p invertierbar) **an dem einen generischen Punkt p = (T₀₀, T₀₁)**, mit M über dem Körper K(S,T) statt über K̄, und ohne μ_t ≠ 0. Das S fällt heraus.

**`satzC_generisch`** (für jeden Körper K, jedes r ≤ 25, jede Zerlegung `alg` von ⟨4,2,4⟩ der Länge r über K): `¬ IsSymm (genAlg alg)`. In Prosa: Es gibt kein M ∈ GL_4(K(S,T)) mit M b_t(p) ∈ K(S,T)·a_t(p) für alle t am generischen Punkt p.

**`folgerungC1_generisch`** (für jeden Körper K und jede Zerlegung der Länge 25): Die generische Normalform `genAlg alg`, eine Zerlegung von ⟨4,2,4⟩ der Länge 25 über dem Körper K(S,T), erfüllt (N1) (`SN1`), (N2) (`SN2`), hat (rk L, rk H) = (5, 8) (`finrank` der Bilder von `Lq`, `Hq` über K(S,T)) und ist nicht symmetrisch. `folgerungC1_nicht36` ist die Kurzform (rk L, rk H) ≠ (3, 6).

**`satzC_kern`** (Hilfssatz, ohne Bezug auf einen generischen Punkt): Ist F ein Körper mit einer Abbildung D : F → F, die additiv ist und die Leibnizregel erfüllt, `alg` eine Zerlegung von ⟨4,2,4⟩ der Länge r ≤ 25 über F, deren Koeffizienten α_t(e_ij), β_t(e_ij) von D vernichtet werden, sind p, v ∈ F² mit p·v = 0 und (Dp)·v ≠ 0, verschwindet für jeden Term mit β_t(v zᵀ) ≡ 0 auch β_t((Dv) zᵀ), und gibt es eine injektive lineare Abbildung E von F⁴ und μ_t mit β_t(v (E x)ᵀ) = μ_t α_t(x pᵀ) für alle t, x, dann `False`. Das ist die Symmetrie an einem Punkt eines Differentialkörpers, also Schritt 1 bis 4 der Prosa in der Ableitungsfassung. Die Hypothesen sind nicht widersprüchlich gewählt (in `satzC_generisch` werden sie mit D = ∂/∂T₀₁ erfüllt, alle Nebenbedingungen sind dort nachgewiesen), der Satz ist also nicht leer wahr in einem uninteressanten Sinn.

---

## 3. Abgleich Punkt für Punkt

1. **Format und Zahl.** ⟨4,2,4⟩ mit 4×2 mal 2×4, nicht transponiert. Satz C für jede Länge r ≤ 25 (stärker als „25“), Folgerung C1 für Länge 25. Richtig.
2. **Körper.** `{K : Type u} [Field K]` ohne weitere Klasse. Jeder Körper, auch Charakteristik 2 und endliche Körper. Die Prosa rechnet über K̄; Lean braucht das nicht. Richtig.
3. **Symmetrie.** Siehe Abschnitt 2: `IsSymm (genAlg alg)` ist die Prosa-Symmetrie am generischen Punkt, mit M ∈ GL_4(K(S,T)), μ_t = 0 erlaubt. Die Erlaubnis μ_t = 0 schwächt die Voraussetzung, also stärkt sie `¬ IsSymm`. Unschädlich.
4. **Generischer Punkt statt offener Menge (Abweichung G1).** B-012 definiert „symmetrisch“ über eine nichtleere Zariski-offene Menge von p ∈ K̄² mit M_p ∈ GL_4(K̄). Lean spricht vom generischen Punkt. Die beiden Fassungen sind gleichwertig, aber nur durch ein Spezialisierungsargument, das **nicht formalisiert** ist:
   - Prosa ⇒ Lean (das braucht man, damit `satzC_generisch` die Prosa-Fassung von Satz C ergibt): Die Bedingung M b_t(p) ∧ a_t(p) = 0 ist ein lineares Gleichungssystem für M mit Koeffizienten in K[p]. Auf einer nichtleeren offenen Menge ist der Lösungsraum an der Stelle p die Spezialisierung des Lösungsraums über K(p) (Basis M_1, …, M_k). Enthält er dort an einem Punkt eine invertierbare Matrix, so ist det(Σ c_i M_i) als Polynom in (c, p) nicht null, und weil K(p) unendlich ist, gibt es c ∈ K(p)^k mit invertierbarem Σ c_i M_i ∈ GL_4(K(p)) ⊆ GL_4(K(S,T)). Das ist genau Schritt 0 der Prosa (3.1), dort mit c ∈ K, hier mit c ∈ K(p), was für unendliche und endliche K gleichermaßen geht.
   - Lean ⇒ Prosa (Umkehrung, für die Gleichwertigkeit): Ein M ∈ GL_4(K(S,T)) mit der Symmetrie lässt sich an einer Stelle (S₀,T₀) mit definierten Nennern und det ≠ 0 spezialisieren; die Menge solcher Stellen ist offen und nichtleer, ihre Projektion auf p enthält eine offene Menge.
   Ergebnis: `satzC_generisch` ist eine gleichwertige Umformulierung von Satz C aus B-012, nicht die wörtliche Aussage. Die Gleichwertigkeit ist ein Standardargument, aber Prosa.
5. **Fall (5,8) und Reparatur R-C1 (Abweichung G2).** Lean zeigt (rk L, rk H) = (5,8) für die eine generische Normalform über K(S,T). R-C1 sagt: an allen p einer nichtleeren offenen dichten Menge (5,8). Der Übergang ist wieder ein Spezialisierungsargument: rk L = rk[ℓ | f_0] − rk f_0 und rk H sind Ränge von Matrizen, deren Einträge rationale Funktionen in (S,T) sind; der Rang am generischen Punkt wird auf einer nichtleeren offenen Menge angenommen. Nicht formalisiert. Lean ist in einer Hinsicht stärker als R-C1: auch S (also u_0 und die Ergänzung u_1, u_2, u_3) und die zweite Zeile von T sind generisch, nicht nur p.
6. **Folgerung C1 in der unreparierten Fassung.** Der Satz in B-012 „liegt eine Zerlegung der Länge 25 über keinem Körper im Fall (3,6)“ (wörtlich: in Yangs Normalform, also für jede zulässige Wahl) zeigt Lean nicht. Lean sagt nichts über einzelne spezielle Normalformen. Das deckt sich mit der Reparatur R-C1 („an einzelnen zulässigen p ist (3,6) nicht ausgeschlossen“).
7. **Abhängigkeiten.** `folgerungC1_generisch` benutzt im Beweis `satzB_unbedingt` und `satzB_symm_unbedingt`. Für den Abgleich zählt nur die Aussage; sie enthält keine Hypothese aus B-008 oder B-009. Die Aussage ist also ohne Bedingung bewiesen, sofern Actions grün ist (Abschnitt 1). Inhaltlich hängen nur die Bedeutungen von `SN1`, `SN2`, `Lq`, `Hq` an den Definitionen aus `YangN4Haupt.lean`; diese sind (N1), (N2), L = [ℓ] in K^r/J mit J = f_0(U) und die schiefe Erweiterung H, wie in der Prosa (S2-05, yang_n4). Dass das Ziel K^r/J statt ker W/J ist, ändert keinen Rang.
8. **Keine leeren oder falschen Stellen gefunden.** `GField K` ist wirklich der Körper der rationalen Funktionen (`FractionRing (MvPolynomial (Var 3) K)`), `Sg`, `Tg` sind die generischen Matrizen (`matS`, `matT` über `xg`), die Invertierbarkeit ist bewiesen, nicht angenommen. Indizes geprüft: `prow` ist Zeile 0 von T, `vT` ist Spalte 1 von T⁻¹, p·v = 0. Die Transposition in `IsSymm` (e wirkt auf das Argument von β) passt zu Gᵀ b_t = μ_t a_t. `genAlg` hat dieselbe Länge r wie `alg`. Keine Hypothese ist vakuös: für Satz C gibt es nur „r ≤ 25“, für C1 nur die Existenz der Zerlegung.
9. **Bemerkung C′, Folgerungen C2, C3.** Nicht formalisiert, nicht Teil des Abgleichs.

---

## 4. Reicht die generische Fassung für die weitere Kette?

Ziel der Kette ist: keine Zerlegung von ⟨4,2,4⟩ der Länge 25 über irgendeinem Körper. Dafür genügt es, **eine** Normalform zum Widerspruch zu führen. `genAlg alg` ist eine echte Zerlegung der Länge 25 über dem Körper K(S,T) mit (N1), (N2), Fall (5,8) und ohne Symmetrie. Ein späterer Lean-Satz der Form „für jeden Körper F und jede Zerlegung der Länge 25 über F mit `SN1`, `SN2`, (5,8) und `¬ IsSymm` folgt `False`“ ließe sich mit F = K(S,T) direkt anschließen. Insofern reicht die generische Fassung, und Schritt 0 der Prosa wird nicht gebraucht.

**Fallstrick (wichtig für die nächsten Aufträge):** Die vorhandene Lean-Fassung von Satz E (`SatzE444.lean`: `satzE`, `finrank_JHat_le_eight`, `exists_chain`) setzt `[IsAlgClosed K]` voraus. K(S,T) ist nicht algebraisch abgeschlossen. Der Übergang zu `AlgebraicClosure (GField K)` ist nicht geschenkt:
- `SN1` überträgt sich sofort.
- Die Ränge (5,8) und `¬ IsSymm` übertragen sich bei Körpererweiterung (Rang ist invariant; die Symmetriebedingung ist ein lineares System über K(S,T), und K(S,T) ist unendlich). Beides ist aber nicht formalisiert.
- `SN2` überträgt sich **nicht automatisch**: (N2) quantifiziert über alle v ≠ 0 im größeren Körper, und Nichtsingularität einer Bilinearabbildung bleibt bei Körpererweiterung im Allgemeinen nicht erhalten. Der Beweis von `genSN2` nutzt, dass p generisch über dem Körper der Einträge von v ist; über dem algebraischen Abschluss von K(S,T) gilt das nicht mehr. Ob (N2) dort trotzdem gilt, habe ich nicht entschieden.
Wege: (a) die (5,8)-Sätze ohne `IsAlgClosed` formulieren (Wurzeln durch eine endliche Erweiterung ersetzen und (N2) dort neu zeigen), (b) die Spezialisierung von Abschnitt 3, Punkte 4 und 5, formalisieren und dann an einer Stelle über K̄ arbeiten, oder (c) die generische Konstruktion gleich über K̄ ansetzen und die Stelle, an der Wurzeln gebraucht werden, auf einen Punkt einer offenen Menge verlegen. Jeder dieser Wege braucht zusätzliche Lean-Arbeit; der Orchestrator sollte das beim Zuschnitt von „Lean für B-014 und Zusammensetzen“ berücksichtigen.

Für die Nicht-Symmetrie selbst (Prosa Folgerung C2, V′, s = 1) reicht die generische Fassung ohne Weiteres: `lemmaV'` ist für jeden Körper formuliert, und aus `¬ IsSymm (genAlg alg)` folgt mit `lemmaV'` direkt, dass der gemeinsame Kern N(u_0) der generischen Normalform null ist.

---

## 5. Urteil des Prüfers

1. `satzC_generisch` und `folgerungC1_generisch` sind richtig formuliert: Format ⟨4,2,4⟩, jeder Körper, Länge ≤ 25 bzw. 25, keine versteckte Zusatzannahme, nicht leer wahr. Sie sagen genau: Die generische Normalform (über K(S,T)) jeder solchen Zerlegung ist nicht symmetrisch (auch nicht mit μ_t = 0), und bei Länge 25 erfüllt sie (N1), (N2) und liegt im Fall (5,8).
2. Das ist **die generische Fassung** von Satz C und von Folgerung C1 nach Reparatur R-C1. Gegenüber dem Wortlaut von B-012 (offene Menge über K̄) ist es eine gleichwertige Umformulierung, deren Gleichwertigkeit ein nicht formalisiertes Spezialisierungsargument braucht (Abweichungen G1, G2).
3. Die unreparierte Folgerung C1 („in Yangs Normalform nie (3,6)“, für jede zulässige Wahl) ist nicht gezeigt und bleibt behauptet.
4. Für die Kette reicht die generische Fassung im Prinzip, mit dem Fallstrick aus Abschnitt 4 (`IsAlgClosed` in Satz E, Übertragung von (N2)).

---

## 6. Urteil des Fremdmodells

openai/gpt-6.2-sol über OpenRouter (Gemini-Bridge), Denkstufe high, Batch, getrennt von mir. Die Bridge liest das Repo nicht; das Modell bekam die Fragen 1 bis 6 unten, das Feld „Aussage“ von B-012 und den Wortlaut von R-C1, die Prosa-Abschnitte 2 bis 4 (3.3 bis 3.5 leicht gekürzt, Formeln vollständig), alle benutzten Lean-Definitionen und die Lean-Aussagen wörtlich sowie die Abweichungsliste des Formalisierers. Mein Urteil und frühere Prüfurteile bekam es nicht. Antwort wörtlich: `versuche/s2-30/gpt_antwort.md`.

Fragen an das Modell (Kurzform): (1) Was sagen die vier Sätze mit aufgelösten Definitionen? (2) Ist `¬ IsSymm (genAlg alg)` gleich, stärker oder schwächer als Satz C in B-012, welches Argument braucht Lean ⇒ Prosa, ist es formalisiert? (3) Ist `folgerungC1_generisch` die Folgerung C1 bzw. R-C1, was fehlt zur offenen Menge? (4) Welcher Teil kann geprüft werden, genaue Formulierung? (5) Reicht die generische Fassung für die Kette, Fallstricke? (6) Definitionsfallen?

Urteil des Fremdmodells, zusammengefasst:
1. **Übersetzung wie in Abschnitt 2 dieses Berichts**, unabhängig hergeleitet: p = (T₀₀, T₀₁), v = Jp/det T, `avecs` = Sᵀa_t, `IsSymm (genAlg alg)` ⇔ M b_t = λ_t a_t mit M = S⁻ᵀEᵀ ∈ GL_4(K(S,T)). „Die Transposition ist also richtig.“ Ränge: rk L = dim Ĵ_p − 4, H die alternierende Erweiterung; die Nulldiagonale in `skewSpace` ist für Charakteristik 2 wesentlich und vorhanden.
2. **Satz C:** „Der Ausschluss generischer Symmetrie ist mathematisch äquivalent zu Satz C in B-012“, aber „nicht schon durch Ausfalten der Definitionen“. Die Brücke (Kernbasis über K(p), Spezialisierung, Determinantenpolynom, K(p) unendlich) ist „in den vorgelegten Aussagen nicht formalisiert“.
3. **C1:** `folgerungC1_generisch` ist „die Funktionenkörperfassung von R-C1“, nicht die unreparierte Lesart und nicht selbst eine Aussage über alle Punkte einer offenen Menge. Das Modell skizziert den Übergang zur offenen Fassung (offene Menge der Nichtsymmetrie, (N2) als endlich viele Rangbedingungen offen in p, dann punktweise Satz B).
4. **Prüfbarer Teil:** wörtlich vorgeschlagen: „Für jeden Körper K und jede Zerlegung der Matrixmultiplikation ⟨4,2,4⟩ mit 25 Summanden gilt: Nach Skalarerweiterung auf K(s_ij, t_kl) und dem Basiswechsel α′_t(A) = α_t(SAT), β′_t(B) = β_t(T⁻¹B), C′_t = S⁻¹C_t erfüllt die Zerlegung `SN1` und `SN2`. Die Bildränge der Quotientenabbildung L und ihrer alternierenden Erweiterung H sind (5,8). Am generischen Punkt p = (T₀₀, T₀₁)ᵀ gibt es über diesem Funktionenkörper kein invertierbares M mit M b_t(p) ∈ K(s_ij, t_kl) a_t(p) für alle t. Der letzte Ausschluss gilt auch für Zerlegungen mit r ≤ 25.“ Die geometrische Form von Satz C und R-C1 nicht als Lean-geprüft führen; die unreparierte C1 und C2 bleiben unbelegt.
5. **Kette:** „Ja, sofern der nächste Schritt den generischen bzw. offen-geometrischen Fall (5,8) ohne Symmetrie ausschließt.“ Braucht er einen algebraisch abgeschlossenen Körper, muss man über K̄ an Punkten einer offenen Menge arbeiten (also die Brücke benutzen); K(S,T) ist nicht algebraisch abgeschlossen. Über endlichem K hat die offene Menge nicht unbedingt K-rationale Punkte. Ableitungen setzen sich in positiver Charakteristik nicht ungeprüft auf den algebraischen Abschluss fort.
6. **Definitionsfallen:** keine gefunden. Nebenbefund: Die Hypothese `hb` von `satzC_kern` folgt schon aus `hβ` (redundant, nicht schädlich). Die Lean-Symmetrie ist bei a_t = 0 sogar sauberer als die Minorenbedingung der Prosa.

Gesamturteil des Modells, wörtlich: „Der Lean-Kern trifft den generischen mathematischen Inhalt; es gibt keinen erkennbaren Format-, Längen-, Index- oder Transpositionsfehler. Der wesentliche Unterschied ist die Quantifizierung: Funktionenkörper in Lean, geometrisch offene Menge in B-012. Diese Lücke lässt sich schließen, ist aber in den gezeigten Sätzen nicht selbst formalisiert. Für eine nachfolgende Ausschlusskette auf einer offenen Menge reicht die reparierte Fassung; für einen Ausschluss an jedem zulässigen Einzelpunkt nicht.“

**Vergleich der Urteile.** Prüfer und Fremdmodell stimmen in allen Punkten überein: gleiche Übersetzung, gleiche Abweichung (generischer Punkt statt offener Menge, Brücke nicht formalisiert), gleicher prüfbarer Teil, keine Definitionsfalle. Unterschiede nur in der Betonung: Das Modell nennt zusätzlich die Redundanz von `hb` und den Hinweis zu endlichen Körpern; ich nenne zusätzlich, dass (N2) sich nicht automatisch auf den algebraischen Abschluss von K(S,T) überträgt. Beides widerspricht sich nicht.

---

## 7. Statusentscheidung

Protokoll 5.1: Punkte 1, 2 und 4 sind erfüllt (Abschnitt 1). Punkt 3 verlangt, dass Prüfer und Fremdmodell unabhängig bestätigen, dass der Lean-Satz die behauptete Aussage ist. Beide bestätigen das für die **generische Fassung**, beide verneinen es für den Wortlaut mit offener Menge und für die unreparierte Folgerung C1. Der Auftrag nennt als Gegenstand ausdrücklich „Satz C und Folgerung C1 in der generischen Fassung, Reparatur R-C1“. Ich setze daher, nach dem Muster von B-008 und B-009 (Kern geprüft, Rest behauptet):

**Geprüft** (Teil G von B-012): Für jeden Körper K gilt:
- (G-C) Für jede Zerlegung von ⟨4,2,4⟩ der Länge r ≤ 25 über K ist die generische Normalform `genAlg alg` (Körpererweiterung auf K(S,T), Basiswechsel α′_t(A) = α_t(SAT), β′_t(B) = β_t(T⁻¹B) mit generischen S ∈ K(S,T)^{4×4}, T ∈ K(S,T)^{2×2}) nicht symmetrisch: Es gibt kein M ∈ GL_4(K(S,T)) und keine μ_t mit M b_t(p) = μ_t a_t(p) für alle t am generischen Punkt p = (T₀₀, T₀₁). Lean: `YangBounds.SatzC444.satzC_generisch`.
- (G-C1) Für jede Zerlegung von ⟨4,2,4⟩ der Länge 25 über K erfüllt die generische Normalform (N1) und (N2), liegt im Fall (rk L, rk H) = (5, 8) (Ränge über K(S,T)) und ist nicht symmetrisch; insbesondere liegt sie nicht im Fall (3, 6). Lean: `YangBounds.SatzC444.folgerungC1_generisch`, `folgerungC1_nicht36`.

**Behauptet** bleiben:
- Satz C im Wortlaut von B-012 (Symmetrie auf einer nichtleeren Zariski-offenen Menge von p ∈ K̄² mit M_p ∈ GL_4(K̄)) und R-C1 in der Fassung „an allen p einer nichtleeren offenen dichten Menge“. Beide folgen aus Teil G durch ein Spezialisierungsargument (Abschnitt 3, Punkte 4 und 5; Fremdmodell Abschnitte 2 und 3), das nicht formalisiert ist.
- Die unreparierte Folgerung C1 („in Yangs Normalform nie (3,6)“, für jede zulässige Wahl). Dafür gibt es keinen Beleg.
- Bemerkung C′ und die Folgerungen C2, C3 des Prosa-Berichts.

Ob Teil G als Fortschritt nach Abbruchregel 2 zählt (Ausschluss des benannten Falls (3,6) in der generischen Normalform), entscheidet der Orchestrator. Den Wortlaut des Felds „Aussage“ in B-012 habe ich nicht geändert, nur Status und Abgleich nachgetragen.

**Hinweis für die Kette** (Abschnitt 4): Satz E ist in Lean nur für algebraisch abgeschlossene Körper formuliert. Um Teil G dort anzuschließen, braucht es entweder (5,8)-Sätze über beliebigen Körpern oder die formalisierte Spezialisierung auf Punkte einer offenen Menge über K̄. (N2) überträgt sich nicht automatisch auf den algebraischen Abschluss von K(S,T).
