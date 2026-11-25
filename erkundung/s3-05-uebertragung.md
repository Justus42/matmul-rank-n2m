# S3-05: Lässt sich die Lean-Kette zu 4×2×4 auf 4×2×5 (Länge 31) und 3×2×7 (Länge 34) übertragen?

- Auftrag: S3-05, Stufe 3 (Erkundung nach Protokoll 0.5, Abschnitt 3), im Auftrag des Orchestrators.
- Datum: 25./26.11.2026 (Nacht).
- Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, `STATUS.md`, `LOG.md`, `ergebnisse/rang-444.md`, alle Dateien unter `lean/YangBounds/`, die zum Endsatz `Transponiert444.rank_four_two_four_ge_26` führen (Kopfkommentare, Aussagen, an den entscheidenden Stellen die Beweise), dazu `Basic.lean`, `Statements.lean`, `YangN4Haupt.lean`, `YangN4Lemma13.lean`, `YangN3Teil3.lean` (Kopf) und die Prosa `lean/prosa/s2_444_spurA_r4.md`, `s2_444_spurA_r6.md`, `yang_n3.md` (Abschnitte 6 bis 8). `versuche/README.md` und die Fundstellen zu ⟨4,2,5⟩ in `versuche/` durchgesehen. Nichts unter `erkundung/` von anderen Threads gelesen.
- Unter `lean/` nichts geändert. Keine Subagenten, keine Fremdmodell-Anfrage, kein Kontakt nach außen.
- Rechnung: ein kleines Python-Programm mit ganzen Zahlen (Abschnitt 4.4), Laufzeit unter einer Sekunde. Es liegt nicht im Repo, der Code steht vollständig in Abschnitt 4.4.
- **Status:** Diese Datei beweist nichts. Aussagen über den Inhalt der Lean-Dateien sind Lesebefunde. Alle mathematischen Aussagen über die neuen Formate sind **behauptet** (eigene Herleitung, ungeprüft) oder ausdrücklich **vermutet**. Die Fallliste in Abschnitt 4 ist eine Kopfrechnung aus Yangs Ungleichungen. Sie ist **nicht** eine der beiden Restfall-Rechnungen nach Protokoll Abschnitt 3 und soll nicht als solche zählen.

---

## 1. Ergebnis in Kürze

1. **Allgemein formuliert ist der Unterbau:** der Rangbegriff (`Basic`), Yangs Normalform und alle Ungleichungen von Yangs Satz 2 (`YangN4Haupt`, `YangN4Lemma13`, allgemein in d, m, r), der Kern von Lemma 13′ (allgemein in der Zahl der Abbildungen), Lemma K und Folgerung K1 (allgemein in n, jeder Körper), das Klassenzählen von Lemma Z (`viele_klassen`, allgemein in r), der Gradsatz `deg_eq_one` aus Satz F (allgemein in den Graden d, e) und die Transposition `transp` (allgemein in n, m, r). Grob geschätzt sind von den 8 753 Zeilen der 16 Dateien der Kette etwa 1 500 formatfrei, dazu der ganz allgemeine Unterbau mit 2 261 Zeilen (Bilanz in Abschnitt 2.4).
2. **Fest auf 4×2×4 gebaut ist alles ab Satz B:** Satz B (Lemma S mit `K[x₀,…,x₃]`), Satz C (Quadrik im 10-dimensionalen Raum der quadratischen Formen auf K⁴), Lemma P (drei Abbildungen K⁴ → Q, Kern eindimensional), Satz E und Satz F (verdrehte Kubiken auf **beiden** Seiten, `Sym³`, ein G ∈ GL₄), die Brücke (Abstieg der Nichtsymmetrie) und `Transponiert444`. Drei Annahmen stecken tief darin: **n = m** (Symmetrie als Isomorphismus K⁴ ≅ K⁴ zwischen a-Seite und b-Seite), **die Transponierte hat dasselbe Format** (Satz A bis E werden auf sie einfach noch einmal angewandt), und **der Kern von F_γ ist eindimensional** (dim U − ρ = 4 − 3 = 1).
3. **Die Endzählung von Satz F trägt rechnerisch für beide Formate, mit derselben oder größerer Reserve als bei 4×2×4.** Unten stehen ⌈r/2⌉ verschiedene Punkte (Lemma Z), oben höchstens (n−1)(m−1)+1 Schnittpunkte (Satz F). 4×2×4: 13 gegen 10. 4×2×5: **16 gegen 13**. 3×2×7: **17 gegen 13** (Abschnitt 3, behauptet).
4. **Aber die Zählung greift nur unter Voraussetzungen, die in den neuen Formaten selten oder gar nicht vorliegen** (Abschnitt 4, behauptet, Kopfrechnung):
   - **4×2×5:** Yangs Ungleichungen mit Lemma 13′ lassen 7 Fälle (4×2×4: 4). Nur in einem davon, (ρ, rk L, rk H) = (3, 6, 9), können die beiden Voraussetzungen von Lemma Z und Satz F zugleich gelten: rk L = dim Q und kein gemeinsamer Kern. In fünf Fällen ist der gemeinsame Kern N ≠ 0 erzwungen. Dort braucht die Kette bei 4×2×4 Satz B und Satz C, und die Quadrikzählung von Satz C geht bei 4×2×5 nur noch für rk L ≤ 4 auf. Dazu kommt die Gegenseite: Die Transponierte ist ⟨5,2,4⟩, ein anderes Format mit 20 Fällen nach denselben Ungleichungen.
   - **3×2×7:** Yangs Ungleichungen für n = 3 lassen genau einen Fall, (ρ, rk L, rk H) = (4, 6, 4). Dort ist der gemeinsame Kern dreidimensional, an jeder Normalform. Die Zerlegung liegt also immer im „symmetrischen“ Zweig, den bei 4×2×4 Satz C erledigt. Satz F und damit die Endzählung kommen gar nicht zum Zug. Satz C trägt nicht: Er bräuchte eine Quadrik durch alle a_t ∈ K³, also dim Ĵ < 6, aber dim Ĵ = 13.
5. **Vorläufige Einschätzung (vermutet):** Für **keines** der beiden Formate lohnt ein Angriff als Übertragung der Kette. Bei 4×2×5 wäre der Aufwand eine zweite, größere Fallunterscheidung plus neue Sätze für den halbsymmetrischen Zweig und für die Seite ⟨5,2,4⟩. Bei 3×2×7 ist die Lage anders: Es bleibt nur **ein einziger, stark strukturierter Fall**. Ein Angriff lohnt dort nur mit einem neuen Argument für diesen Fall, nicht mit der Kette. Näheres in Abschnitt 5.

---

## 2. Tabelle je Datei

Spalte „Art“: **allgemein** (in n, m bzw. d, m, r formuliert), **leicht verallgemeinerbar** (Idee allgemein, Indizes oder Zahlen fest, Umbau mechanisch), **fest** (Aussage oder Beweis hängt an 4, 2, 4, Länge 25 oder an n = m). Spalte „Kosten“ ist eine Schätzung für eine Übertragung, nicht gemessen: gering (Neuinstanziierung, Zahlen und `omega`), mittel (Umbau der Indizes, neue Lemmata ähnlicher Länge), hoch (neue Mathematik nötig). Zeilenzahlen aus `wc -l` auf `main` bei efc2eee.

### 2.1 Unterbau

| Datei (Zeilen) | Hauptsätze | Art | Format-Bezug | Übertragung |
|---|---|---|---|---|
| `Basic.lean` (155) | `BilinearAlgorithm K n l m r`, `tensorRank`, `le_tensorRank_iff`; `tensorRank_three_two_eq`, `tpsr_lower_bound` | allgemein | keiner. Das Paket `mm325_proof` wird hier importiert, aber nur für die beiden letzten Sätze (n = 3) gebraucht. Die 4×2×4-Kette benutzt nichts daraus, nur den Import (`grep`: keine andere Datei nennt `MatrixMultiplicationLowerBound`) | 0 |
| `YangN4Haupt.lean` (1 407, nicht in der Liste, aber Grundlage von allem) | Normalform `SN1`, `SN2` (`lemma6`, `exists_normalized`), `J`, `Kbar` (= Q), `Fq`, `Lq`, `Hq`, `Φ`, `ineq1`, `lemma8'`, `lemma9`, `lemma14`, `lemma15a`, `lemma15b`, `G3`, `finrank_Kbar` | allgemein in d, m, r (n = d + 1). `lemma14` braucht m ≥ d, `lemma15b` d ≥ 2 | keiner | 0 für 4×2×5 (d = 3, m = 5). Für 3×2×7 mit d = 2 benutzbar, aber zu schwach: Yangs Verbesserung für n = 3 (Lemma H, I) steht nur in `YangN3Teil3.lean`, mit eigenen Definitionen in eigenem Namensraum. Anschluss mittel |
| `YangN4Lemma13.lean` (603) | Lemma 13 (Yang), `lemma13_statement` | allgemein in d | keiner | 0 |
| `Statements.lean` (96) | `yang_theorem_one`, `yang_theorem_two(_algorithm)` | allgemein | keiner | 0. Liefert die Minimalität: Länge 30 für 4×2×5 ist nach Satz 2 unmöglich, Länge 33 für 3×2×7 nach Satz 1 |
| `Lemma13Prime.lean` (374) | `lemma13Prime_core`, `lemma13Prime` (allgemein für e + 2 Abbildungen), `exists_common_kernel_of_sDim_eq_zero`; `Lemma13PrimeStatement` | Kern allgemein, nur das Statement fest auf d = 3 (`Fin 3`) | d = 3 | 4×2×5 hat ebenfalls d = 3: direkt nutzbar. 3×2×7: e = 0 instanziieren, gering |

### 2.2 Fallunterscheidung (Satz A, Satz B)

| Datei (Zeilen) | Hauptsätze | Art | Format-Bezug | Übertragung |
|---|---|---|---|---|
| `SatzA444.lean` (407) | `satzA`, `satzA_global`, `satzA_exists`, `finrank_range_Φ`, `corollaryA1`, `corollaryA2`, `sDim_table`, `exists_common_kernel` | fest (14 × `4 2 4 25`, 111 × `d := 3`), Beweise aber nur `omega` über allgemeinen Ungleichungen. `JHat`, `finrank_JHat` sind allgemein | Zahlen dim Q = 5, 12 + rk H, die Liste der vier Fälle | gering. Neue Fallliste (Abschnitt 4: 7 Fälle für 4×2×5). Für 3×2×7 zusätzlich Lemma I aus `YangN3Teil3` anbinden (mittel) |
| `SatzB444Poly.lean` (339) | `lin`, `prime_lin`, `syz` (Syzygien in `K[x₀,…,x₃]` mit dim I ≤ 2) | fest auf 4 Variablen (20 × `Fin 4`), Zahl dim I ≤ 2 fallbezogen | n = 4 | Idee (faktorieller Ring) allgemein, Zahlen nicht. Nur im symmetrischen Zweig nützlich |
| `SatzB444.lean` (679) | `IsSymm`, `lemmaV'`, `noProd_I`, `finrank_I_add_rkL_le`, `eight_le_rkH`, `satzB` | fest. **`IsSymm` ist ein Isomorphismus `(Fin 4 → K) ≃ₗ (Fin 4 → K)` zwischen a-Seite (Kⁿ) und b-Seite (Kᵐ), setzt n = m voraus.** Lemma S (rk H ≥ 8) ist auf die Fälle (4,7), (5,7) zugeschnitten | n = m = 4, Fälle von Satz A | `lemmaV'` überträgt sich (mittel): Für n ≤ m liefert ein gemeinsamer Kernvektor eine injektive Abbildung g : Kⁿ → Kᵐ mit gᵀb_t ∥ a_t („halbsymmetrisch“, Abschnitt 4.2). Für n > m gäbe er einen Widerspruch. Lemma S: hoch, neue Mathematik |
| `SatzB444Final.lean` (88) | `satzB_unbedingt`, `satzB_symm_unbedingt`, `satzB_global_unbedingt` | Zusammensetzen | wie oben | gering, aber nur wenn es einen Satz-B-Ersatz gibt |

### 2.3 Symmetrischer Zweig (Satz C) und generischer Punkt

| Datei (Zeilen) | Hauptsätze | Art | Format-Bezug | Übertragung |
|---|---|---|---|---|
| `SatzC444Kern.lean` (489) | `IsDeriv`, `identD`, `satzC_kern` | Idee (Ableitung der Zerlegungsgleichung, Identität (Kl)) allgemein. Ausführung fest: K⁴, `r ≤ 25`, 16 = n·m, `card_UTIdx = 10` per `decide` | **n = m** (E Automorphismus von F⁴), Quadrikzählung r − nm < n(n+1)/2, also 9 < 10 | (Kl) gilt vermutlich auch im halbsymmetrischen Fall (Abschnitt 4.2, vermutet). Die Quadrikzählung trägt aber nicht: 4×2×5 nur für rk L ≤ 4, 3×2×7 nie. Hoch |
| `SatzC444Generisch.lean` (650) | `GField` = K(S, T), `genAlg`, `genSN1`, `genSN2`, `satzC_generisch`, `alpha_ne_zero_of_length_25`, `folgerungC1_generisch` | Technik allgemein (`Var d` in `YangN4Haupt` ist allgemein). Hier instanziiert mit `Var 3`, `Fin 4`, Minoren 4×4 in `genInj`. `alpha_ne_zero_of_length_25` (Minimalität) ist eine Zeile Yang-Satz-2 plus Zählen | n = 4, m = 4, Länge 25 | `genSN1`, `genSN2`, Minimalität: mittel. `satzC_generisch` hängt an Satz C |
| `Bruecke444.lean` (567) | `descent`, `isSymm_descent`, `genAlgL`, `genSN1L`, `genSN2L`, `nichtSymm_genAlgL`, `bruecke` | Abstiegstechnik allgemein, Gegenstand (`IsSymm`) fest | n = m (über `IsSymm`), `Fin 4` | mittel, sobald klar ist, welche Eigenschaft absteigen muss |

### 2.4 Fall (5,8): Lemma P, Satz E, Satz F, Lemma K, Lemma Z, Transponierte, Endsatz

| Datei (Zeilen) | Hauptsätze | Art | Format-Bezug | Übertragung |
|---|---|---|---|---|
| `SatzE444Buendel.lean` (212) | `Fc`, `Omega`, `Kstern`, `UnterfallAVoll`, `UnterfallB`, `NichtSymmetrisch`, `sDim_eq_one`, `nur_unterfallB` | fest | ρ = 3, U = K⁴, dim ker F_γ = 1 | hängt an Lemma P |
| `LemmaP444.lean` (928) | `LemmaP444.main` (drei Abbildungen K⁴ → Q mit rk ≤ 3, s = 1, dim Σ F_i(K⁴) = 5), `lemmaP`, `nur_unterfallB'` | fest (34 × `fin_cases`) | **dim U − ρ = 1**: Der Beweis lebt davon, dass jedes F_γ mit γ ∈ Ω einen eindimensionalen Kern k(γ) hat | hoch. Bei 4×2×5 ist dim U − ρ = 5 − 3 = 2 im einzigen Fall, in dem Lemma P gebraucht würde: Die Kerne sind Ebenen, das Büschelargument muss neu gebaut werden |
| `SatzE444.lean` (651) | `exists_chain` (Kette u⁰,…,u³, 16 Unbekannte, ≤ 15 Gleichungen), `point_lemma`, `finrank_JHat_le_eight`, `satzE` | Idee allgemein (enges Büschel ⇒ rationale Normkurve), Zahlen fest: S³ × S¹ → S⁴, Grad 7, Raum ≤ 8 | n = m = 4 | mittel. Allgemein: Kette der Länge n, Kurve vom Grad n−1 auf der a-Seite, Grad m auf der b-Seite, Spann ≤ n + m. Die Gradzählung schließt Unterfall A aus, wenn rk L > n (4×2×5: 6 > 4, 3×2×7: 6 > 3; vermutet) |
| `SatzF444.lean` (888) | `deg_eq_one`, `satzF_kern`, `kubik_seite`, `kubik_of_unterfallB`, `TransponiertEng`, `VielePunkte`, `satzF`, `fall58_ausgeschlossen` | `deg_eq_one` **allgemein** (Grade d, e beliebig). `satzF_kern` fest: `mom` (Momentenkurve vom Grad 3), `sym3`, `Fin 4` auf beiden Seiten. Schluss: ein G ∈ GL₄ mit G b_t ∥ a_t | **n = m**, beide Kurven vom Grad 3 | mittel bis hoch. Für n ≠ m: Momentenkurven vom Grad n−1 und m−1, `Sym^k`, und ein neuer Schluss statt „symmetrisch“ (Abschnitt 3.4) |
| `LemmaK444.lean` (627) | `lemmaK`, `lemmaK_exklusiv`, `folgerungK1` (für `Matrix (Fin n) (Fin 2) K`, jeder Körper); `lemmaK_generisch` | `lemmaK`, `folgerungK1` **allgemein in n**. Nur der Anschluss an den generischen Punkt hängt an `Var 3` | keiner (Kern) | gering |
| `LemmaZ444.lean` (938) | `viele_klassen` (allgemein in r), `mergeAlg` (allgemein), `nicht_proportional`, `kerW_le`, `kerW_rel`, `quadGleich_of_rel`, `paar_struktur`, `keine_drei`, `lemmaZ_generisch`, `lemmaZ_bruecke` (13 Punkte) | gemischt: Zählen allgemein, Rest fest (`hr : r = 25`, rk L = 5, `Amat`/`Bmat` mit `Fin 4`) | **braucht rk L = dim Q** (`kerW_le`: Ĵ = ker W) | mittel, aber nur sinnvoll, wenn rk L = dim Q gilt (Abschnitt 4) |
| `Transponiert444.lean` (673) | `transp` (allgemein: ⟨n,2,m⟩ → ⟨m,2,n⟩), `Mrot`; `TransN1`, `TransN2`, `transNF`, `transponiertEng_of`, `transponiertEng_genAlgL`, `rank_four_two_four_ge_26` | `transp` allgemein, alles andere fest | **Die Transponierte von ⟨4,2,4⟩ ist wieder ⟨4,2,4⟩.** Die Datei wendet Satz B, Satz C und Lemma P einfach auf die Transponierte an (`transNF_nichtSymm`, `nur_unterfallB'`) | hoch. Bei 4×2×5 ist die Transponierte ⟨5,2,4⟩ mit anderer Normalform (d′ = 4, dim Q′ = 7, 20 Fälle nach Yangs Ungleichungen, Abschnitt 4.1). Bei 3×2×7 ist sie ⟨7,2,3⟩, und dort fehlt sogar Yangs Lemma 14 (es braucht m ≥ d, hier 3 < 6) |
| `Endsatz444.lean` (243) | `BrueckeStatement`, `UnterfallBStatement`, `fall58_of_nichtSymmetrisch`, `keine_zerlegung_25_of`, `le_tensorRank_of_algClosed` | Zusammensetzen; `le_tensorRank_of_algClosed` (Basiswechsel R1) allgemein | Fallnamen | gering, sobald die Teile da sind |

Grobe Bilanz (Zeilen aus `wc -l`, Aufteilung geschätzt nach Abschnitten, nicht nach Beweiszeilen):

- Unterbau `Basic`, `Statements`, `YangN4Haupt`, `YangN4Lemma13`: 2 261 Zeilen, ganz allgemein.
- Die 16 Dateien der Kette von `SatzA444` bis `Transponiert444`: 8 753 Zeilen. Davon formatfrei etwa 1 500: `Lemma13Prime` (374), der Kern von `LemmaK444` bis `folgerungK1` (etwa 480), der Gradteil von `SatzF444` bis `Reduced.det_ne_zero` (etwa 300), `viele_klassen`, `mergeAlg` und der Abstieg in `LemmaZ444` (etwa 200), `transp` und `Mrot` in `Transponiert444` (etwa 70). Dazu kommen die `omega`-Beweise von `SatzA444`, die sich nur neu instanziieren lassen.
- Der Rest, etwa 7 200 Zeilen, ist fest auf 4×2×4 oder auf n = m gebaut.

### 2.5 Wo die Kette die Gleichheit der äußeren Dimensionen benutzt

1. **Symmetrie** (`SatzB444.IsSymm`): ein Isomorphismus zwischen K⁴ der a-Seite und K⁴ der b-Seite. Für n ≠ m gibt es so etwas nicht. Was Lemma V′ für n < m liefert, ist eine injektive Abbildung g : Kⁿ → Kᵐ mit gᵀb_t = μ_t a_t (halbsymmetrisch).
2. **Satz C**: b_t = μ_t H a_t mit invertierbarem H, und die Zählung „r − n² < n(n+1)/2“.
3. **Satz F, Schluss**: Fallen die beiden Kurven zusammen, setzt die Kette die beiden Kubiken über `Sym³` gleich und erhält G ∈ GL₄. Das braucht n − 1 = m − 1.
4. **Transponierte**: `Transponiert444` braucht, dass die Transponierte im selben Format liegt, damit Satz A bis Lemma P für sie schon bewiesen sind.
5. **Brücke**: Sie überträgt gerade die Nichtsymmetrie (Punkt 1) auf den algebraischen Abschluss.

---

## 3. Das Abzählargument am Ende der Kette

### 3.1 Wovon die untere Zahl abhängt (Lemma Z)

Zwei Terme t, t′ heißen verbunden, wenn [a_t(p) ⊗ b_t(p)] = [a_{t′}(p) ⊗ b_{t′}(p)] für generisches p. Lemma Z (Prosa S2-24, Lean `LemmaZ444.lean`) zeigt: Jede Klasse hat höchstens zwei Elemente. Also gibt es mindestens **⌈r/2⌉** paarweise verschiedene Punkte. Bei 4×2×4: ⌈25/2⌉ = 13 (`lemmaZ_bruecke`, 13 Punkte).

Dafür braucht die Kette drei Dinge:

- **(Z1) Minimalität:** keine Zerlegung der Länge r − 1. Sonst ließen sich zwei proportionale Terme zusammenlegen (`mergeAlg`, `nicht_proportional`). Das gilt genau dann, wenn r die bekannte untere Schranke ist. Bei 4×2×5 ist r = 31 = Yangs Satz 2 für (n, m) = (4, 5), bei 3×2×7 ist r = 34 = Yangs Satz 1. Beide sind in Lean formalisiert. **Trägt für beide Formate.**
- **(Z2) Lemma K:** allgemein in n, jeder Körper (`LemmaK444.lemmaK`). **Trägt.**
- **(Z3) Ĵ = ker W an der generischen Stelle,** das heißt **rk L = dim Q** (Prosa (G), Lean `kerW_le` mit rk L = 5). Ohne (Z3) hängt der Faktor κ_t(p) von p ab, und Klassen bis zur Größe 4 sind möglich. Das gäbe nur ⌈r/4⌉ Punkte (8 bzw. 9), viel zu wenig.

Ohne Lemma Z bleibt als untere Zahl nur dim span{a_t ⊗ b_t} = dim Ĵ = m + rk L ≤ dim ker W = r − nm. Das reicht in keinem der drei Formate (Tabelle 3.3).

### 3.2 Wovon die obere Zahl abhängt (Satz F)

Allgemein, mit a_t ∈ Kⁿ und b_t ∈ Kᵐ (Herleitung wie Prosa S2-24, Abschnitt 4 und 5, mit n, m statt 4, 4; behauptet):

- Ein **enges Paar** auf der Seite von u ist ein zweidimensionaler Raum D ⊆ Kⁿ mit dim Ψ(D, Kᵐ) = m + 1. Dann ist das Büschel w ↦ Ψ(u, w) (u ∈ D) vom Format (m+1)×m und überall injektiv. Nach Kronecker ist es ein einziger Block L_mᵀ, also die Multiplikation S¹ × S^{m−1} → S^m. Daraus: **alle b_t liegen auf einer rationalen Normkurve vom Grad m − 1 in ℙ^{m−1}**, mit Parameter σ_t = π_D([a_t]).
- Ebenso auf der Seite von w: ein zweidimensionaler Raum E ⊆ Kᵐ mit dim Ψ(Kⁿ, E) = n + 1. Dann **liegen alle a_t auf einer rationalen Normkurve vom Grad n − 1**, mit Parameter τ_t = π_E([b_t]).
- φ = π_D ∘ ν_E hat Grad d ≤ n − 1 (Projektion einer Kurve vom Grad n − 1 von einem Unterraum der Kodimension 2 aus). ψ = π_E ∘ ν_D hat Grad e ≤ m − 1.
- Die Paare (τ_t, σ_t) liegen auf zwei Kurven vom Bigrad (d, 1) und (1, e) in ℙ¹ × ℙ¹. Sind sie verschieden, haben sie höchstens **d·e + 1 ≤ (n−1)(m−1) + 1** gemeinsame Punkte. Lean (`SatzF444.deg_eq_one`) formuliert das als Fixpunktzählung für ψ ∘ φ und verlangt **mehr als** d·e + 1 Punkte. Bei 4×2×4: 3·3 + 1 = 10, verlangt sind 11 (`VielePunkte alg 11`).

Ein enges Paar ist genau ein F_γ vom Rang 1 (dim Ψ(D, Kᵐ) = m + rk F_γ). Das liefert bei 4×2×4 der Unterfall B von Lemma P, auf beiden Seiten. Hat das „engste“ Paar nur Rang k ≥ 2, dann hat das Büschel k Kronecker-Blöcke, und b_t liegt nicht mehr auf einer Kurve, sondern auf einer rationalen Regelfläche (je Block ein freier Faktor). Dann gibt es keine obere Zahl dieser Art (vermutet).

### 3.3 Die Zahlen für beide Formate

| | 4×2×4, r = 25 | 4×2×5, r = 31 | 3×2×7, r = 34 |
|---|---|---|---|
| n, m | 4, 4 | 4, 5 | 3, 7 |
| dim Q = r − (n+1)m | 5 | 6 | 6 |
| dim ker W = r − nm | 9 | 11 | 13 |
| unten, Lemma Z: ⌈r/2⌉ (braucht rk L = dim Q) | 13 | **16** | **17** |
| unten ohne Lemma Z: m + rk L | ≤ 9 | ≤ 11 | ≤ 13 |
| oben: (n−1)(m−1) + 1 | 10 | **13** | **13** |
| Bedarf in Lean-Form: (n−1)(m−1) + 2 | 11 | 14 | 14 |
| Reserve ⌈r/2⌉ − Bedarf | 2 | 2 | 3 |

Allgemein für n = 4 an Yangs Schranke r = 6m + 1: ⌈r/2⌉ = 3m + 1 gegen 3(m−1) + 2 = 3m − 1, Reserve immer 2. Für n = 3 an r = ⌈(24m+2)/5⌉: ⌈r/2⌉ ≈ 2,4 m gegen 2m, die Reserve wächst mit m.

**Ergebnis zu Frage 2 (behauptet):** Rechnerisch geht die Zählung in beiden Formaten auf, mit Lemma Z. Ohne Lemma Z geht sie nirgends auf, auch bei 4×2×4 nicht.

### 3.4 Der Schluss nach der Zählung, wenn n ≠ m

Bei 4×2×4 folgt aus „die Kurven fallen zusammen“: d = e = 1, die Zerlegung ist symmetrisch, Widerspruch zu Satz C. Für n ≠ m gibt es keine Symmetrie. Ein Ersatz (vermutet, einfach): Bei d = e = 1 ist φ ein Automorphismus von ℙ¹, also a_t ∝ ν_E(τ_t) (Grad n − 1) und b_t ∝ ν_D(φ(τ_t)) (Grad m − 1) mit demselben Parameter. Dann liegt jedes a_t ⊗ b_t auf einer Kurve, deren Koordinaten binäre Formen vom Grad n + m − 2 sind, also dim span{a_t ⊗ b_t} ≤ n + m − 1. Mit rk L = dim Q ist aber dim span{a_t ⊗ b_t} = dim ker W.

| | 4×2×4 | 4×2×5 | 3×2×7 |
|---|---|---|---|
| n + m − 1 | 7 | 8 | 9 |
| dim ker W | 9 | 11 | 13 |

In allen drei Formaten ein Widerspruch. Satz C wird an dieser Stelle also nicht gebraucht, auch bei 4×2×4 nicht (vermutet; die Lean-Kette geht den Weg über Satz C, weil die Nichtsymmetrie ohnehin für Lemma P vorliegt).

---

## 4. Wo die Voraussetzungen der Zählung herkommen, ohne Restfall-Liste

Satz F braucht an derselben Stelle: (Z3) rk L = dim Q, kein gemeinsamer Kern N(u₀) = ker F_1 ∩ … ∩ ker F_d (sonst ist man im symmetrischen bzw. halbsymmetrischen Zweig), ein enges Paar auf der a-Seite (ein F_γ vom Rang 1) und eines auf der b-Seite (dasselbe für die Transponierte). Welche Restfälle das erfüllen, entscheidet die Restfall-Liste. Ohne sie kann man aus Yangs Ungleichungen schon ablesen, in welchen Kennzahl-Fällen die Voraussetzungen überhaupt möglich sind. Das tut dieser Abschnitt, als **Kopfrechnung (behauptet)**.

### 4.1 Die Kennzahl-Fälle nach Yangs Ungleichungen und Lemma 13′

Benutzt (alle in Lean vorhanden, Abschnitt 2.1), mit q = dim Q, d = n − 1:
`ineq1`: d·m + rk H ≤ rk L + d·q; rk L ≤ q; `lemma8'`: rk L ≥ d; `lemma14`: ρ ≥ d (falls m ≥ d); `lemma15a`: rk L ≤ d·ρ; `lemma15b`: rk L = d·ρ ⇒ ρ = m; Lemma 13′: d·ρ + 2s + (d−2)·rk L ≤ 2·rk H. Für n = 3 zusätzlich Yangs Lemma G/I (`yang_n3.md` Abschnitt 8): Δ := 2 rk H − rk L ≥ min(2, m − rk H). s_max ist das größte s, das Lemma 13′ zulässt.

Gegenprobe: Für 4×2×4 bei 25 ergibt das genau die vier Fälle von Satz A, mit s ≤ 1 nur in (5,8). Für 4×2×4 bei 24, 4×2×5 bei 30 und 3×2×7 bei 33 ergibt es keinen Fall, passend zu Yangs Schranken.

| Format | Fälle (ρ, rk L, rk H), dazu s_max |
|---|---|
| 4×2×4, r = 25 | (3,3,6) s=0; (3,4,7) s=0; (3,5,7) s=0; (3,5,8) s≤1 |
| **4×2×5, r = 31** | (3,3,6) s=0; (3,4,7) s=0; (3,5,7) s=0; (3,5,8) s≤1; (3,6,8) s=0; (3,6,9) s≤1; (4,6,9) s=0 |
| **3×2×7, r = 34** | (4,6,4) s=0, einziger Fall |
| ⟨5,2,4⟩, r = 31 (Transponierte von 4×2×5) | 20 Fälle, alle mit ρ = 4, rk L ∈ {4,…,7}, rk H ∈ {rk L + 8, …, rk L + 12} |

Ist s = 0 und ρ < dim U, dann haben F_1, …, F_d einen gemeinsamen Kernvektor (`Lemma13Prime.exists_common_kernel_of_sDim_eq_zero`).

Diese Liste ersetzt **nicht** die beiden Restfall-Rechnungen der Stufe 3. Sie benutzt nur Yangs Ungleichungen und Lemma 13′, nicht die weiteren Sätze der Fallunterscheidung.

### 4.2 4×2×5: was die Zählung abdeckt

| Fall | rk L = dim Q (Z3) | N = 0 möglich | Lage |
|---|---|---|---|
| (3,3,6), (3,4,7) | nein | nein (s = 0) | halbsymmetrisch, Satz-C-Ersatz denkbar (s. u.) |
| (3,5,7) | nein | nein | halbsymmetrisch, rk L + m = 10, kein Werkzeug der Kette |
| (3,5,8) | nein | ja | Gegenstück zu (5,8) bei 4×2×4, aber **ohne (Z3)**: Lemma Z greift nicht, unten nur m + rk L = 10 < 14 |
| (3,6,8), (4,6,9) | ja | nein | halbsymmetrisch, kein Werkzeug der Kette |
| **(3,6,9)** | ja | ja | **einziger Fall, in dem Satz F mit Lemma Z greifen kann** (16 > 13) |

Halbsymmetrisch heißt: Ein gemeinsamer Kernvektor x ≠ 0 liefert wie in `SatzB444.lemmaV'` eine injektive lineare Abbildung g : K⁴ → K⁵ mit gᵀ b_t = μ_t a_t (der Beweis von `lemmaV'` benutzt n = m nur, um aus der Injektivität einen Isomorphismus zu machen). Die Identität (Kl) von Satz C sollte sich übertragen, mit gᵀ statt M_p rechts: Σ_t δ_t (a_t·u)(a_t·w) C_t = ω(p, d)(u wᵀ + w uᵀ) gᵀ (vermutet; gᵀ ist surjektiv, also folgt aus einer Quadrik durch alle a_t wie bei 4×2×4 Q + Qᵀ = 0). Eine Quadrik durch alle a_t mit μ_t ≠ 0 gibt es, wenn die Werte (μ_t q(a_t))_t = (Ψ(u, g w)_t) in Ĵ, einem Raum der Dimension m + rk L < 10 = dim Sym²(K⁴), liegen. Das ist rk L ≤ 4: nur (3,3,6) und (3,4,7). Bei 4×2×4 erledigte Lemma S (Satz B) die Fälle (4,7), (5,7). Ein Gegenstück für (3,5,7), (3,6,8), (4,6,9) fehlt.

Zusätzlich braucht (3,6,9) Lemma P neu (Kerne der F_γ sind Ebenen, weil dim U − ρ = 2) und die Gegenseite: ein enges Paar für die Transponierte ⟨5,2,4⟩, deren Normalform eine eigene, größere Fallunterscheidung hat (Tabelle 4.1).

### 4.3 3×2×7: die Zählung kommt nicht zum Zug

Im einzigen Fall (ρ, rk L, rk H) = (4, 6, 4) gilt:

- rk L = 6 = dim Q, also (Z3) und Lemma Z mit 17 Punkten (behauptet).
- **dim N = dim ker H = m − rk H = 7 − 4 = 3** (bei n = 3 ist H = (F_2, −F_1), also ker H = ker F_1 ∩ ker F_2). Der gemeinsame Kern ist also an **jeder** Normalform dreidimensional. Damit liegt jede Zerlegung der Länge 34 im halbsymmetrischen Zweig: Für jedes x ∈ N gibt es eine injektive Abbildung g_x : K³ → K⁷ mit g_xᵀ b_t = μ_t(x) a_t, und g_x hängt linear von x ab.
- Satz F setzt N = 0 voraus (über Lemma P). Die Endzählung wird also nicht gebraucht und kann nicht angewandt werden.
- Den Zweig erledigt bei 4×2×4 Satz C. Dessen Quadrikzählung bräuchte dim Ĵ < dim Sym²(K³) = 6, aber dim Ĵ = m + rk L = 13. **Satz C trägt nicht.**

Was bleibt, ist ein einziger, stark strukturierter Fall: Die Abbildung (x, u) ↦ g_x(u), N ⊗ K³ → K⁷, schickt nach Transposition jedes b_t auf einen Tensor vom Rang 1, (b_t|_N) ⊗ a_t (bis auf Skalare). Ob das zu einem Widerspruch führt, habe ich nicht untersucht (vermutet: es ist die naheliegende Stelle für einen neuen Ansatz).

### 4.4 Code der Kopfrechnung

Python 3, nur ganze Zahlen, Laufzeit unter einer Sekunde:

```python
def faelle(n, m, r):
    d = n - 1; q = r - (n + 1) * m
    out = []
    for rho in range(0, min(m, q) + 1):
        for rL in range(0, q + 1):
            for rH in range(0, d * q + 1):
                if d * m + rH > rL + d * q: continue          # ineq1
                if rL < d: continue                            # Lemma 8'
                if m >= d and rho < d: continue                # Lemma 14
                if rL > d * rho: continue                      # Lemma 15a
                if rL == d * rho and rho != m: continue        # Lemma 15b
                if n == 3 and 2 * rH - rL < min(2, m - rH): continue   # Yang n=3, Lemma G/I
                smax = None
                for s in range(0, q + 1):
                    if d * rho + 2 * s + (d - 2) * rL <= 2 * rH: smax = s
                if smax is None: continue                       # Lemma 13'
                out.append((rho, rL, rH, smax))
    return q, out
```

Aufrufe: `faelle(4,4,25)`, `faelle(4,4,24)`, `faelle(4,5,31)`, `faelle(4,5,30)`, `faelle(3,7,34)`, `faelle(3,7,33)`, `faelle(5,4,31)`. Ausgabe wie in Tabelle 4.1.

---

## 5. Vorläufige Einschätzung je Format (vermutet)

### 4×2×5 bei Länge 31

- **Übertragbar:** der ganze Unterbau (Yangs Normalform, Ungleichungen, Lemma 13′ sogar mit demselben d = 3), Lemma K, das Klassenzählen, `deg_eq_one`, `transp`, der Basiswechsel R1, die Technik des generischen Punkts. Die Endzählung selbst trägt (16 gegen 13, Reserve wie bei 4×2×4).
- **Nicht übertragbar:** Satz B (Symmetrie als Isomorphismus, Lemma S), Satz C (Quadrikzählung nur für rk L ≤ 4), Lemma P (zweidimensionale Kerne), die Kubik-Teile von Satz E und F (Grade 3 und 4 statt 3 und 3), `Transponiert444` (die Gegenseite ist ⟨5,2,4⟩ mit 20 Kennzahl-Fällen).
- **Einschätzung:** Die Zählung am Ende deckt nach Yangs Ungleichungen höchstens einen von sieben Fällen ab. Für die anderen sechs fehlen in der Kette die Werkzeuge, für drei davon jede Idee. **Angriff als Übertragung lohnt nicht.** Er würde lohnen, wenn jemand einen Satz für den halbsymmetrischen Zweig mit n < m findet. Die Blind-Sucher-Notiz `versuche/s2-blind-r4.md` nennt dazu ein „Lemma ρ“ (eine Kombination Σγ_i F_i ist injektiv, ρ = m), das R(⟨4,2,5⟩) ≥ 32 gäbe. In allen sieben Fällen oben ist ρ ≤ 4 < 5. Das passt: Lemma ρ würde sie alle ausschließen.

### 3×2×7 bei Länge 34

- **Übertragbar:** Yangs Satz 1 als Minimalität (formalisiert, unabhängig von `mm325_proof`), Lemma K, das Klassenzählen, `deg_eq_one`, die Idee von Lemma V′. Der Unterbau von Satz 2 mit d = 2 ist benutzbar, die entscheidende Verbesserung (Lemma H, I) steht aber in `YangN3Teil3.lean` und müsste angebunden werden.
- **Nicht übertragbar:** alles ab Satz B. Die Endzählung trägt zwar rechnerisch (17 gegen 13), aber der einzige Fall liegt im halbsymmetrischen Zweig (dim N = 3), wo die Kette Satz C benutzt, und Satz C trägt nicht (13 ≥ 6). Die Gegenseite ⟨7,2,3⟩ hätte nicht einmal Yangs Lemma 14.
- **Einschätzung:** **Angriff als Übertragung der Kette lohnt nicht.** Bemerkenswert ist aber, wie klein die Fallunterscheidung ist: Nach Yangs eigenen Ungleichungen bleibt ein einziger Fall mit festen Kennzahlen (rk L = 6, rk H = 4, ρ = 4, dim N = 3). Wenn die beiden Restfall-Rechnungen das bestätigen, wäre ein gezielter Prosa-Versuch an genau diesem Fall (Abschnitt 4.3, letzter Punkt) der kleinste sinnvolle nächste Schritt. Das wäre ein neuer Ansatz, kein Übertrag.

### Gemeinsame Stelle

In beiden Formaten fehlt der Kette das, was bei 4×2×4 der symmetrische Zweig leistet: Satz B mit Lemma S und Satz C. Bei n ≠ m wird aus „symmetrisch“ ein „halbsymmetrisch“ (g : Kⁿ → Kᵐ injektiv), und die Quadrikzählung, die bei 4×2×4 mit 9 < 10 knapp aufgeht, geht dort nicht auf. Das ist die eigentliche Hürde, nicht die Zählung am Ende.

---

## 6. Kritische Stellen für einen Prüfer

1. Abschnitt 3.2: dass ein enges Paar mit Rang-1-Überschuss auch für n ≠ m einen einzigen Kronecker-Block gibt (Zeilenbilanz m + 1 = Σ(η_i + 1) bei Σ η_i = m) und dass der Grad von π_D ∘ ν_E höchstens n − 1 ist.
2. Abschnitt 3.4: die Gradzählung n + m − 1 < dim ker W als Ersatz für Satz C nach dem Zusammenfallen der Kurven.
3. Abschnitt 4.1: dass Lemma 13′ in der Form d·ρ + 2s + (d−2)·rk L ≤ 2 rk H für d = 3 und d = 2 genau `Lemma13Prime.lemma13Prime` mit e = d − 2 ist, und dass Yangs Lemma I für n = 3 an derselben Normalform gilt wie die Ungleichungen aus `YangN4Haupt` (dort SN1/SN2, in `YangN3Teil3` „stark normalisiert“; `YangN3.lean` zeigt, dass SN1 gleich ist und SN2 äquivalent).
4. Abschnitt 4.2 und 4.3: die Übertragung von `lemmaV'` auf n < m (injektives g statt Isomorphismus) und die Identität (Kl) mit gᵀ.
5. Abschnitt 4.3: dim N = m − rk H bei n = 3.

---

## 7. Statusübersicht

| Aussage | Status |
|---|---|
| Tabelle je Datei (Abschnitt 2): was allgemein, was fest ist | Lesebefund, behauptet |
| Untere Zahl ⌈r/2⌉, obere Zahl (n−1)(m−1)+1, Zahlen 16/13 und 17/13 (Abschnitt 3) | behauptet |
| Ohne Lemma Z (rk L < dim Q) reicht die Zählung in keinem Format | behauptet |
| Ersatz des Schlusses über Satz C durch die Gradzählung n + m − 1 (Abschnitt 3.4) | vermutet |
| Kennzahl-Fälle nach Yangs Ungleichungen und Lemma 13′ (Abschnitt 4.1) | behauptet (Kopfrechnung, keine Restfall-Rechnung nach Protokoll Abschnitt 3) |
| 3×2×7: einziger Fall (4,6,4), dim N = 3, halbsymmetrisch an jeder Normalform | behauptet |
| Identität (Kl) im halbsymmetrischen Fall | vermutet |
| Einschätzungen in Abschnitt 5 | vermutet |
