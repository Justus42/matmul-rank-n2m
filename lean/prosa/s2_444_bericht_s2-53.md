# S2-53: Aussagen-Abgleich der Lean-Sätze zu B-014 (Prüferbericht)

- Auftrag: S2-53, Rolle Prüfer, im Auftrag des Orchestrators. Aussagen-Abgleich nach Protokoll Abschnitt 5.1 Punkt 3 für B-014 (Lemma K, Lemma Z, Satz F, Transponierte, Folgerungen F1 und F2).
- Datum: 25.11.2026
- Geprüfter Stand: `main` bei Commit `c3c3884028c840d0afd9c14944394aee21fd5729`. Das ist auch der Commit, den der Actions-Job 139504538345 (Lauf 45699204903) ausgecheckt hat (`git log -1` im Log).
- Kein Fremdmodell benutzt. Kein Subagent. Kein Status gesetzt.

## 0. Offenlegung: was mir eingeblendet wurde oder was ich gesehen habe

**Projektgedächtnis, Index (`MEMORY.md`), wörtlich eingeblendet:**

> # Projekt: Matrizen-Multiplikation
> - Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
> - Ziel: exakter Tensorrang von <n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 25.11.2026 Version 0.4.1 (von Justus).
> - Person schreibt Deutsch.
> - Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
> - Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
> - Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4: kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, Stufe 3 nur mit Budget. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert oder ausgelegt werden müsste.
> - Justus am 25.11.2026, wörtlich: „Freigabe zu weiteren Runden nach deinem Ermessen“. Stufe 3 braucht ein eigenes Budget.
> - Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
> - Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
> - Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
> - Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
> - Protokoll Abschnitt 6: höchstens 6 Subagenten pro Runde (Stufe 2 ab Runde 9), 24 Runden für Stufe 2, Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
> - Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung, letzte am 25.11.2026 11:47 UTC.
> - Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
> - Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
> - [[verfahren-datenformat]]: Datenformat der Verfahren
> - [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht

**Einzeleinträge, die mir eingeblendet wurden (wörtlich):**

`aussagen-abgleich-n3.md`:

> - Bridge-Hinweis: Das Repo matmul-rank-n2m ist in der Bridge NICHT freigegeben (`repo`/`files` scheitern). Dateien wörtlich in `prompt` einfügen. Batch war nach ~1 min fertig.
> - Lean lokal: Toolchain über GitHub-Release; eine Prüfdatei braucht `import YangBounds.Statements` (YangBounds.olean wird bei Teilziel nicht gebaut).
> Verwandt: [[lean-build-cloud]]

`gemini-bridge.md`:

> Stand 25.11.2026 (A-03):
> - `ask_gemini` mit `repo`/`files` geht nur für freigegebene Repos. Justus42/matmul-rank-n2m und fallnlove/mm325_proof sind **nicht** freigegeben. Inhalte deshalb wörtlich in `prompt` einfügen (Auszüge, Beweise weglassen).
> - Das MCP-Werkzeug bricht nach 60 s ab (Ergebnis unbekannt). Mit Denkstufe high und ca. 12 KB Eingabe: Zeitüberschreitung. Mit Denkstufe low und `max_output_tokens` 8000: Antwort in Ordnung (~0,03 $).
> - Für Unabhängigkeit nach Protokoll 4/5.1: dem Fremdmodell kein eigenes Urteil zeigen, offene Fragen mit JA/NEIN/TEILWEISE stellen.
>
> Verwandt: [[git-regeln]]
>
> Stand 25.11.2026 05:10 (S1-05 Nachtrag): Gemini-Projekt hat die **monatliche Ausgabengrenze** erreicht, Batch-Auftrag abgelehnt. Orchestrator: kein Ausweichen auf OpenRouter (Budgetgrenze von Justus). Wenn Justus die Grenze anhebt: yang_n3.md ungekürzt als Batch (gemini-4-carbon, high) erneut abgeben, Ergebnis als Nachtrag in lean/prosa/yang_n3_pruefung.md, PR „S1-05 Nachtrag“.

`lean-build-cloud.md`:

> Stand 25.11.2026 (A-02):
> - elan-Installer geht, aber Toolchain-Download über releases.lean-lang.org ist per Proxy gesperrt (403). Umweg: `https://github.com/leanprover/lean4/releases/download/v4.19.0/lean-4.19.0-linux.tar.zst` laden (kein zstd-Binary: mit `pip install zstandard` + Python entpacken), dann `elan toolchain link leanprover/lean4:v4.19.0 <dir>`.
> - `lake exe cache get` scheitert: lakecache.blob.core.windows.net gesperrt (403). mathlib muss aus Quellen gebaut werden, in Blöcken ≤30 min (`timeout 1800 lake build`, inkrementell).
> - Nicht `lake update` benutzen (schreibt lake-manifest.json um); `lake build` holt die Pakete aus dem Manifest.
> - In GitHub Actions ist der mathlib-Cache erreichbar (~2,5 min pro Lauf). Workflows: `.github/workflows/lean-build.yml` (A-11, PR #9) und `lean-project.yml` (S1-14).
> Verwandt: [[mm325-lizenz]], [[lean-project-ci]]

Keiner dieser Einträge enthält ein Urteil über B-014 oder ein gewünschtes Ergebnis.

**Sonstiges, das wie ein Urteil oder Status aussieht und mir begegnet ist:**

- Der Auftrag des Orchestrators selbst sagt: „Ob die Behauptung stimmt und ob der Abgleich aufgeht, ist offen. Ein bestimmtes Ergebnis ist nicht erwünscht.“
- Die Prosa-Datei `lean/prosa/s2_444_spurA_r6.md` (Positivliste) nennt Statuswörter zu anderen Behauptungen, wörtlich z. B.: „B-007 (R ≥ 25 über jedem Körper, geprüft)“, „Mit B-007 und B-010 (beide geprüft)“, „Geprüft sind B-007, B-010, im Kern B-008 und B-009 (Rangteil …)“, „Nur behauptet sind B-012 …, B-013 … und B-014“, „Die Prüfungen von B-012 und B-013 laufen in Runde 6 (S2-22, S2-23)“. Zu B-014 selbst steht dort nur „behauptet“. Ich habe von dieser Datei nur die Abschnitte 1 bis 5 gelesen, nicht 6 bis 12 (darunter „Kritische Stellen für den Prüfer“ und „Statusübersicht“).
- Die Kopfkommentare der Lean-Dateien beschreiben ihre eigenen Sätze (z. B. „without hypothesis“). Das sind Angaben der Formalisierer, keine Prüfurteile. Ich habe jede solche Angabe an der Signatur nachgesehen.
- Ein früheres Prüfurteil zu B-014 habe ich nicht gesehen.

## 1. Was ich gelesen und getan habe

- `PROTOKOLL.md` Abschnitt 5; `behauptungen/B-014.md`; `lean/prosa/s2_444_spurA_r6.md` Abschnitte 1 bis 5.
- `lean/YangBounds/SatzF444.lean`, `LemmaK444.lean`, `LemmaZ444.lean`, `Transponiert444.lean` vollständig in den Aussagen und Definitionen.
- Zur Rückverfolgung der Definitionen (nur Definitionen und Signaturen): `Basic.lean` (`BilinearAlgorithm`, `tensorRank`, `le_tensorRank_iff`), `YangN4Haupt.lean` (`W`, `SN1`, `SN2`, `φ`, `J`, `π`, `Kbar`, `ell`, `Lq`, `Hq`), `SatzB444.lean` (`avecs`, `IsSymm`, `psi_nonsing`), `SatzE444.lean` (`psi`), `SatzE444Buendel.lean` (`Fc`, `Kstern`, `UnterfallB`, `NichtSymmetrisch`), `SatzC444Generisch.lean` (`genAlg`, `alpha_ne_zero_of_length_25`, `folgerungC1_generisch`), `Bruecke444.lean` (`GBar`, `genAlgL`, `bruecke`, `bruecke_unterfallB`, `rank_four_two_four_ge_26_of_unterfallB`), `Endsatz444.lean` (`UnterfallBStatement`, `fall58_of_nichtSymmetrisch`), `LemmaP444.lean` (`nur_unterfallB'`), `Statements.lean` (`yang_theorem_two_algorithm`), `lakefile.toml`, `lean-toolchain`.
- Suche nach `axiom`, `opaque`, `sorry`, `admit`, `native_decide` in den Quellen unter `lean/`: nur Vorkommen in Kommentaren.
- Log des Jobs 139504538345 über die GitHub-Schnittstelle.
- **Nicht** gemacht: ein lokaler Bau. mathlib müsste in dieser Umgebung aus Quellen gebaut werden (mehrere Stunden). Maßgeblich ist nach Protokoll 5.1 Punkt 4 ohnehin der Actions-Lauf. Mein Urteil zu Teil 3 stützt sich deshalb allein auf das Log.

## 2. Gegenüberstellung je Teil

Bezeichnungen in Lean: `avecs alg t` ist a_t (Spalte 0 von A_t, also a_t(p) an der Stelle p = e₀ der Normalform), `bvecs alg t` ist b_t mit `b_t · y = β_t(emb y)`. `genAlg alg` ist die Normalform nach einem generischen Basiswechsel (S, T) über K(S, T), `genAlgL alg` dieselbe über dem algebraischen Abschluss `GBar K`. Ihr Punkt ist der generische Punkt p = (T₀₀, T₀₁).

### Teil 1: Lemma K

**Wort (B-014 und Prosa 3.1):** X, Y, X′, Y′ ∈ K^{n×2}, alle ≠ 0, (Xp) ⊗ (Yp) = (X′p) ⊗ (Y′p) als Polynomidentität. Dann genau einer der Fälle (i) X′ = λX, Y′ = λ⁻¹Y; (ii) X = x l₁ᵀ, Y = w l₂ᵀ, X′ = λ x l₂ᵀ, Y′ = λ⁻¹ w l₁ᵀ, x, w ≠ 0, λ ≠ 0, l₁, l₂ unabhängig. Folgerung K1: höchstens zwei Bahnen.

**Lean:** `LemmaK444.lemmaK : X ≠ 0 → Y ≠ 0 → PolyEq X Y X' Y' → FallI X Y X' Y' ∨ FallII X Y X' Y'` über jedem Körper, jedem n; `lemmaK_exklusiv : ¬ (FallI ∧ FallII)`; `folgerungK1` (von drei Lösungen liegen zwei in einer Bahn). `PolyEq` ist `lin (X i) * lin (Y j) = lin (X' i) * lin (Y' j)` in `MvPolynomial (Fin 2) K` für alle i, j, also genau die Polynomidentität (K) eintragsweise. `FallI`, `FallII` entsprechen (i) und (ii) wörtlich (Linearunabhängigkeit als `det2 l₁ l₂ ≠ 0`).

**Urteil: stimmt überein.** Die Lean-Fassung ist sogar etwas stärker: sie braucht X′, Y′ ≠ 0 nicht als Voraussetzung (folgt aus (K), `PolyEq.ne_zero`). „Genau einer“ ist `lemmaK` zusammen mit `lemmaK_exklusiv`. Keine leere Erfüllbarkeit: die Hypothesen sind erfüllbar (z. B. X′ = X, Y′ = Y). `LemmaZ444.lemmaKStatement_gilt` überträgt das richtig in die Koeffizientenform `QuadGleich` (über `polyEq_iff_quadEq`, die Reihenfolge der drei Koeffizienten wird dabei korrekt umgestellt).

### Teil 2: Lemma Z (mindestens 13 verschiedene Punkte, Paarstruktur, keine drei)

**Wort (B-014):** Eine Zerlegung von ⟨4,2,4⟩ der Länge 25 im Fall (5,8) hat über K̄ für alle p ∈ ℙ¹ außerhalb endlich vieler Punkte mindestens 13 paarweise verschiedene Punkte [a_t(p) ⊗ b_t(p)], a_t(p) = A_t p, b_t(p) = B_tᵀJp. Zwei Terme, deren Punkte für alle p zusammenfallen, haben die Gestalt A_t = x l₁ᵀ, A_{t′} = x l₂ᵀ, B_tᵀJ = w l₂ᵀ, B_{t′}ᵀJ ∝ w l₁ᵀ, und mehr als zwei Terme fallen nie so zusammen.

**Lean:**
- `LemmaZ444.lemmaZ_generisch_unbedingt (alg : BilinearAlgorithm K 4 2 4 25) : VielePunkte (genAlg alg) 13`, ebenso `lemmaZ_bruecke_unbedingt` für `genAlgL alg` über `GBar K`. `VielePunkte n` heißt: es gibt T mit |T| ≥ n und für s ≠ t in T nicht zugleich a_s ∈ K·a_t und b_s ∈ K·b_t.
- `quadGleich_of_rel`: hängen s und t an der generischen Normalform zusammen (`Rel`, beide Punkte projektiv gleich), so gibt es κ ∈ K, κ ≠ 0, mit `QuadGleich (A_t) (κ B̂_t) (A_s) (B̂_s)`, also (A_s p) ⊗ (B̂_s p) = κ (A_t p) ⊗ (B̂_t p) als Polynomidentität. Dabei ist `Bmat` = B̂_t mit B̂_t p = (β_t(e_{1j}) p₀ − β_t(e_{0j}) p₁)_j. Das ist genau B_tᵀJp mit J = [[0, −1], [1, 0]] und B_t[k, j] = β_t(e_{kj}) (nachgerechnet).
- `paar_struktur`: für s ≠ t verbunden gibt es unabhängige l₁, l₂ mit Zeilenrichtungen A_t ∼ l₁, A_s ∼ l₂, B̂_s ∼ l₁, B̂_t ∼ l₂.
- `keine_drei`: keine drei paarweise verbundenen Terme.

**Abweichungen, genau benannt:**

1. *Generischer Punkt statt „alle p außer endlich vielen“.* Lean beweist die Aussage an einem einzigen Punkt, dem generischen Punkt p = (T₀₀, T₀₁) über K(S, T) bzw. dessen Abschluss, nicht für alle p ∈ ℙ¹(K̄) außerhalb einer endlichen Menge. Inhaltlich sind beide gleichwertig: Alle Koordinaten von a_t(p), b_t(p) sind linear in p mit Koeffizienten in K (`genAlg_alpha_basis`, `genAlg_beta_basis`; der Basiswechsel S und der Faktor det(T)⁻¹ ändern projektive Punkte und Gleichheit von Punkten nicht), also ist „Punkte von s und t fallen zusammen“ eine polynomiale Bedingung in p mit Koeffizienten in K, und am generischen Punkt gilt sie genau dann, wenn sie als Polynomidentität gilt (`generisch_quad`). Die Übersetzung in die punktweise Fassung „außerhalb endlich vieler [p]“ ist aber **nicht** formalisiert. Für die Kette wird sie nicht gebraucht, weil Satz F in Lean am selben generischen Punkt angewendet wird (Teil 3).
2. *Keine Voraussetzung „Fall (5,8)“.* Lean nimmt keinen Fall an, sondern zeigt für **jede** Zerlegung der Länge 25, dass ihre generische Normalform im Fall (5,8) liegt (`folgerungC1_generisch`, aus der Formalisierung von Satz B und Satz C, nicht Teil von B-014). Die Lean-Aussage ist darin stärker als die Wortfassung, stützt sich aber auf diese früheren Lean-Sätze. Diese sind gebaut und axiomfrei im Sinn von Teil 6, ihren Aussagen-Abgleich habe ich nicht gemacht (nicht Teil des Auftrags).
3. *Paarstruktur nur in Zeilenrichtungen.* `paar_struktur` sagt nur, welche Zeilenrichtung jede der vier Matrizen hat. Dass A_t und A_{t′} denselben Spaltenvektor x haben und B_tᵀJ, B_{t′}ᵀJ denselben Vektor w, steht in keinem einzelnen Lean-Satz. Es folgt aber direkt aus zwei Lean-Sätzen: `quadGleich_of_rel` liefert (K) mit X = A_t, Y = κB̂_t, X′ = A_{t′}, Y′ = B̂_{t′}, und `lemmaK` (Fall (i) ist durch `nicht_proportional`, die Minimalität, ausgeschlossen) liefert Fall (ii): A_t = x l₁ᵀ, A_{t′} = c x l₂ᵀ, B̂_t = κ⁻¹ w l₂ᵀ, B̂_{t′} = c⁻¹ w l₁ᵀ. Mit l₂′ = c l₂ und w′ = κ⁻¹c⁻¹w ist das genau die Wortgestalt A_t = x l₁ᵀ, A_{t′} = x l₂′ᵀ, B_tᵀJ = w′ l₂′ᵀ, B_{t′}ᵀJ = κ w′ l₁ᵀ ∝ w′ l₁ᵀ. (Die Wortfassung schreibt bei A_{t′} „=“ statt „∝“; nach Umskalieren von l₂ ist das richtig.)
4. *„Für alle p zusammenfallen“* ist in Lean `Rel` am generischen Punkt. Gleichwertig aus demselben Grund wie in 1.
5. *Verschiedenheit von Punkten* ist in Lean „nicht zugleich a_s ∥ a_t und b_s ∥ b_t“ (`∃ c, a_s = c • a_t`). Für Vektoren ≠ 0 ist das genau [a_s ⊗ b_s] ≠ [a_t ⊗ b_t]. An der generischen Normalform sind alle a_t, b_t ≠ 0 (`SN1`, `genAlg_beta_ne`), die Relation ist dort symmetrisch (`rel_symm`).

**Urteil: stimmt überein, mit Vorbehalt 1 (generischer Punkt statt Zariski-offene Menge) und Vorbehalt 3 (Paarstruktur nur als Kombination zweier Sätze).** Nicht leer erfüllbar: Die Aussage hat außer der Länge 25 keine Hypothese. Ob es überhaupt eine Zerlegung der Länge 25 gibt, ist genau die Frage; das macht den Satz nicht schwächer als die Wortfassung, die dieselbe Voraussetzung hat.

### Teil 3: Satz F (Unterfall B ausgeschlossen)

**Wort (B-014):** Eine Zerlegung von ⟨4,2,4⟩ der Länge 25 im Fall (5,8), die nicht symmetrisch ist (Sinn von B-012), liegt nicht zugleich mit ihrer Transponierten in Unterfall B (Sinn von B-013).

**Lean:**
- `SatzF444.satzF [IsAlgClosed K] (h1 : SN1 alg) (h2 : SN2 alg) (hB : UnterfallB alg) (hT : TransponiertEng alg) (hZ : VielePunkte alg 11) : IsSymm alg` für jede Normalform beliebiger Länge r.
- `unterfallB_unmoeglich`: dasselbe mit `NichtSymmetrisch alg` als Voraussetzung und `¬ UnterfallB alg` als Schluss.
- `fall58_ausgeschlossen`: Länge 25, SN1, SN2, Fall (5,8), nicht symmetrisch, `TransponiertEng`, `VielePunkte 11` ⟹ False.

**Definitionen nachverfolgt:**
- `IsSymm alg`: es gibt einen Automorphismus e von K⁴ und μ_t mit β_t(emb (e y)) = μ_t (a_t · y) für alle t, y. Das heißt Eᵀ b_t = μ_t a_t, also M b_t ∈ K·a_t mit M = Eᵀ invertierbar. Das ist „symmetrisch“ der Prosa (V1, Satz F Schritt 4). `NichtSymmetrisch := ¬ IsSymm`. Stimmt.
- `UnterfallB alg` (SatzE444Buendel): dim K* = 3, γ* ≠ 0 mit K* ⊆ ker F_{γ*}, rk F_{γ*} = 1, ein Q₂ der Dimension 2 mit F_i(K*) ⊆ Q₂. Die Prosa von B-014 (Abschnitt 4, (B0)) benutzt aus Unterfall B nur rk F_{γ*} = 1 mit γ* ≠ 0, und der Lean-Beweis ebenso (`kubik_of_unterfallB`, `eng_of_unterfallB` verwerfen die übrigen Konjunkte). Ob die übrigen Konjunkte genau die Definition von Unterfall B in B-013 sind, kann ich nicht prüfen, weil B-013 nicht auf meiner Positivliste steht. Für die Stärke von Satz F ist das unerheblich in dieser Richtung: Satz F gilt in Lean schon unter der schwächeren Annahme rk F_{γ*} = 1.
- Fall (5,8): `(finrank (range Lq), finrank (range Hq)) = (5, 8)` an der Normalform.
- `TransponiertEng alg` (B3′): es gibt w₀ ≠ 0 mit b_t·w₀ ≠ 0 für alle t, w₁ ∉ K w₀, und einen Raum P der Dimension ≤ 5, der Ψ(u, w₀) und Ψ(u, w₁) für alle u enthält. Das ist (B0) für die Transponierte, also das enge Paar E = span(w₀, w₁) auf der Seite von w.
- `VielePunkte alg 11`: wie oben. Satz F braucht 11 statt 13, weil die Lean-Fassung statt Bézout Fixpunkte von ψ ∘ φ zählt (Schranke d·e + 1 ≤ 10, `deg_eq_one`).

**Abweichungen, genau benannt:**

1. *„Transponierte in Unterfall B“ ist durch die schwächere Annahme `TransponiertEng` ersetzt.* Das macht `satzF` stärker, nicht schwächer, sofern „Transponierte in Unterfall B“ `TransponiertEng` impliziert. Das tut sie in Lean: `eng_of_unterfallB` gibt aus `UnterfallB` der transponierten Normalform ein enges Paar, und `psi_transNF` (Ψ′(u, w) = −Ψ(w, R u)) übersetzt es zurück; beides ist in `transponiertEng_of` zusammengesetzt. Ein eigener Satz der Form „`UnterfallB (transNF alg R hR)` ⟹ `TransponiertEng alg`“ fehlt, die Implikation steckt im Beweis von `transponiertEng_of`.
2. *Fall (5,8) und Nicht-Symmetrie sind in `satzF` nicht Voraussetzung*, der Schluss ist IsSymm. Mit Nicht-Symmetrie (`unterfallB_unmoeglich`) ist das genau „nicht in Unterfall B“. Stärker als die Wortfassung.
3. *An einer einzelnen Normalform bleibt `VielePunkte alg 11` eine Hypothese.* Das ist die Stelle, an der Lemma Z eingeht. Satz F in Lean sagt also: „Unterfall B ∧ Transponierte eng ∧ 11 verschiedene Punkte an dieser Stelle ⟹ symmetrisch“. Die Wortfassung von Satz F hat diese Hypothese nicht, ihr Beweis wählt aber ebenfalls einen Punkt p außerhalb der Ausnahmepunkte von Lemma Z. Unbedingt (ohne `VielePunkte` und ohne `TransponiertEng` als Annahme) gilt der Ausschluss in Lean nur an der generischen Normalform `genAlgL alg` jeder Zerlegung der Länge 25, und zwar in der Form `False` (es gibt die Zerlegung nicht), siehe Teil 5. Die Aussage „für die Zerlegung an p aus einer nichtleeren offenen Menge“ ist nicht formalisiert; formalisiert ist sie am generischen Punkt.
4. *Transponierte.* Die Prosa nimmt (B_tᵀ, A_tᵀ, C_tᵀ) an der Stelle Jp. Lean nimmt `transp alg` mit der Drehung M = [[0, 1], [−1, 0]] in der inneren Dimension (also an derselben Stelle) und einem äußeren Basiswechsel R mit R e₀ = w₀ (`transNF`). Das ist dieselbe Transponierte nach einem Basiswechsel; Unterfall B, (N1), (N2), Symmetrie sind unter solchen Wechseln in Lean ausdrücklich übertragen (`transNF_SN1`, `transNF_SN2`, `transNF_nichtSymm`, `psi_transNF`). Inhaltlich gleich.

**Urteil: stimmt überein, mit Vorbehalt 3** (an einer einzelnen Normalform ist Lemma Z als Hypothese `VielePunkte 11` mitgeführt; ohne Hypothese gilt Satz F in Lean nur an der generischen Normalform, dort aber vollständig). Leere Erfüllbarkeit: die Hypothesen von `satzF` widersprechen einander nicht von vornherein (sie sind alle nach außen offene Existenz- bzw. Rangbedingungen); ihre gemeinsame Unerfüllbarkeit für Länge 25 ist gerade der Inhalt der Behauptung.

### Teil 4: Die Aussage über die Transponierte ((B3), Datei `Transponiert444.lean`)

**Wort (Prosa (B3), in B-014 als Teil von Satz F):** Die Transponierte einer Zerlegung im Fall (5,8), die nicht symmetrisch ist, ist eine Zerlegung der Länge 25, liegt im Fall (5,8), ist nicht symmetrisch und liegt nach (V2) in Unterfall B; zurückübersetzt gibt das das enge Paar E auf der Seite von w.

**Lean:**
- `transp alg : BilinearAlgorithm K m 2 n r` mit `correct` bewiesen: die Transponierte ist eine Zerlegung gleicher Länge. Stimmt.
- `transponiertEng_of [IsAlgClosed L] (alg : … 25) (h1 : SN1 alg) (hns : NichtSymmetrisch alg) (hT1 : TransN1 alg) (hT2 : TransN2 alg) : TransponiertEng alg`. Im Beweis: transNF ist eine Normalform (SN1, SN2), nicht symmetrisch, im Fall (5,8) (`fall58_of_nichtSymmetrisch`), in Unterfall B (`nur_unterfallB'`), daraus das enge Paar.
- `transponiertEng_genAlgL (alg : BilinearAlgorithm K 4 2 4 25) : TransponiertEng (genAlgL alg)` ohne weitere Hypothese, über jedem Körper K.

**Abweichung:** An einer einzelnen Normalform braucht Lean zwei Zusatzbedingungen `TransN1` (alle b_t ≠ 0) und `TransN2` ((N2) der Transponierten), die die Prosa nicht ausdrücklich nennt. Die Prosa löst das durch die Wahl von p „so, dass die Bedingungen an p für die Zerlegung und an J⁻¹p für die Transponierte gelten“. Lean löst es am generischen Punkt: `transN1_genAlgL`, `transN2_genAlgL` beweisen beide Bedingungen dort ohne Hypothese. Das entspricht genau dieser Wahl von p.

**Urteil: stimmt überein**, für die generische Normalform ohne Hypothese; an einer beliebigen Normalform nur unter `TransN1`, `TransN2` (benannt, nicht versteckt).

### Teil 5: Folgerungen F1 und F2 und der Gesamtumfang

**Wort:** F1: Mit B-012 und B-013 ist der Fall (5,8) ausgeschlossen, über jedem Körper. F2: ⟨4,2,4⟩ hat über keinem Körper eine Zerlegung der Länge 25, also R(⟨4,2,4⟩) ≥ 26 über jedem Körper (mit B-010 genau 26).

**Lean:**
- `Transponiert444.rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4`, **ohne jede Hypothese**. Beweis: `LemmaZ444.rank_four_two_four_ge_26_of_transponiertEng K (fun alg => transponiertEng_genAlgL alg)`; dieser Satz nimmt Lemma K aus `lemmaKStatement_gilt`, Lemma Z aus `lemmaZ_bruecke_11`, und wendet `satzF` auf `genAlgL alg` an mit `bruecke` (SN1, SN2, (5,8), nicht symmetrisch) und `bruecke_unterfallB`.
- `tensorRank K n l m` (Basic.lean) ist `Nat.find` der kleinsten Länge r, für die es einen `BilinearAlgorithm K n l m r` gibt; `BilinearAlgorithm` sind Linearformen α_t auf n×l-, β_t auf l×m-Matrizen und Matrizen C_t mit A·B = Σ α_t(A) β_t(B) C_t für alle A, B. Das ist der bilineare Rang (Tensorrang) von ⟨n, l, m⟩ über K. `le_tensorRank_iff` übersetzt „≥ c“ in „jede Zerlegung hat Länge ≥ c“.
- `keine_zerlegung_25_of_vielePunkte` mit `lemmaZ_bruecke_11`: keine Zerlegung der Länge 25 über K (kein eigener Satzname für die unbedingte Fassung, aber im Beweis von `rank_four_two_four_ge_26` enthalten und durch dessen Aussage mit abgedeckt: aus 26 ≤ R folgt, dass es keine Zerlegung der Länge 25 gibt).

**Abweichungen:** F1 als eigener Satz „eine Zerlegung der Länge 25 liegt nicht im Fall (5,8)“ (Fall im Sinn der offenen Menge von p über K̄) gibt es in Lean nicht. Er folgt aber trivial aus F2, weil es nach `rank_four_two_four_ge_26` keine Zerlegung der Länge 25 gibt. F2 selbst ist **wörtlich** formalisiert: richtiges Format ⟨4,2,4⟩ (`tensorRank K 4 2 4`), jeder Körper (`K : Type u`, `[Field K]`, universumspolymorph, also auch endliche Körper und Charakteristik 2), richtige Zahl 26. Der Zusatz „mit B-010: genau 26“ gehört zu B-010 und ist nicht Gegenstand dieses Abgleichs.

**Urteil: stimmt überein.** Wichtig für die Gesamtfrage: Da der Endsatz `rank_four_two_four_ge_26` keine Hypothese hat und nur von `BilinearAlgorithm` und `tensorRank` abhängt, können Abweichungen in Zwischendefinitionen (`UnterfallB`, `TransponiertEng`, `VielePunkte`, generischer Punkt statt offene Menge) den Endsatz nicht verfälschen: Eine zu schwache oder falsche Zwischendefinition könnte höchstens bewirken, dass ein Zwischensatz etwas anderes sagt als sein Wortteil, aber nicht, dass der Endsatz etwas Falsches oder Schwächeres sagt. Für den Endsatz zählt nur, dass `BilinearAlgorithm` und `tensorRank` richtig definiert sind (oben nachgesehen) und dass der Bau ohne `sorry` und nur mit Standard-Axiomen durchläuft (Teil 6).

### Teil 6: Log des Jobs 139504538345 (Lauf 45699204903)

- Ausgecheckt: `main`, Commit `c3c3884028c840d0afd9c14944394aee21fd5729`. Lean 4.19.0, mathlib `c44e0c8ee63ca166450922a373c7409c5d26b00b`.
- `lake build`: „Build completed successfully.“ (Logzeile 427).
- Wörtlich (Logzeilen 436, 437):
  - `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
  - `SORRY: 0 'sorry' token(s) in the sources outside comments`
- Axiom-Listen: Jede `#print axioms`-Zeile der vier Dateien zeigt `[propext, Classical.choice, Quot.sound]`, im Bau-Teil (Zeilen 376 bis 426) und im eigenen Axiom-Bericht (Zeilen 869 bis 939). Darunter insbesondere:
  - `YangBounds.LemmaK444.lemmaK`, `lemmaK_exklusiv`, `folgerungK1`, `lemmaKStatement`, `folgerungK1Statement`, `lemmaK_generisch`, `lemmaK_generischL`, `folgerungK1_generisch`, `folgerungK1_generischL`;
  - `YangBounds.LemmaZ444.quadGleich_of_rel`, `paar_struktur`, `keine_drei`, `lemmaZ_generisch`, `lemmaZ_bruecke`, `lemmaZ_bruecke_11`, `lemmaKStatement_gilt`, `lemmaZ_generisch_unbedingt`, `lemmaZ_bruecke_unbedingt`, `rank_four_two_four_ge_26_of_transponiertEng` und weitere;
  - `YangBounds.SatzF444.deg_eq_one`, `satzF_kern`, `kubik_of_unterfallB`, `satzF`, `unterfallB_unmoeglich`, `fall58_symmetrisch`, `fall58_ausgeschlossen`, `unterfallBStatement_of`, `rank_four_two_four_ge_26_of_hyp`;
  - `YangBounds.Transponiert444.transp`, `transNF_SN2`, `transNF_nichtSymm`, `transponiertEng_of`, `transN1_genAlgL`, `transN2_genAlgL`, `transponiertEng_genAlgL`, `keine_zerlegung_25_of_vielePunkte`, `rank_four_two_four_ge_26_of_vielePunkte`, `rank_four_two_four_ge_26_of_hyp'`, **`rank_four_two_four_ge_26`**.
  
  Einige Zeilen sind im Log umbrochen (`[propext,` / `Classical.choice,` / `Quot.sound]`); ich habe die Fortsetzungen nachgesehen, sie enthalten nichts weiter. Kein `sorryAx`, keine weiteren Axiome. Die externe Abhängigkeit `mm325_proof` geht in die transitiven Axiom-Listen ein und bringt ebenfalls nichts Zusätzliches.
- Nicht im `#print axioms` der Dateien aufgeführt sind die Hilfssätze `eng_of_unterfallB`, `exists_w0`, `transNF_SN1`, `psi_transNF`; sie gehen aber in `transponiertEng_of` und `rank_four_two_four_ge_26` ein, deren Listen sauber sind.

**Urteil: stimmt (SORRY 0, nur propext, Classical.choice, Quot.sound).**

## 3. Zusammenfassung der Urteile

| Teil | Wortaussage | Lean | Urteil |
|---|---|---|---|
| 1 Lemma K (mit K1, „genau einer“) | Prosa 3.1 | `LemmaK444.lemmaK`, `lemmaK_exklusiv`, `folgerungK1` | stimmt überein (Lean etwas stärker) |
| 2 Lemma Z (≥ 13 Punkte, Paarstruktur, keine drei) | B-014, Prosa 3.2 | `LemmaZ444.lemmaZ_generisch_unbedingt`, `lemmaZ_bruecke_unbedingt`, `quadGleich_of_rel`, `paar_struktur`, `keine_drei` | stimmt überein, Vorbehalte: generischer Punkt statt „alle p außer endlich vielen“ (gleichwertig, Übersetzung nicht formalisiert); Paarstruktur mit gemeinsamem x, w nur als Kombination `quadGleich_of_rel` + `lemmaK` |
| 3 Satz F | B-014, Prosa 5 | `SatzF444.satzF`, `unterfallB_unmoeglich`, `fall58_ausgeschlossen` | stimmt überein, Vorbehalt: an einer einzelnen Normalform mit Hypothese `VielePunkte 11`; ohne Hypothese nur an der generischen Normalform. `UnterfallB` gegen B-013 nicht abgeglichen (B-013 nicht auf der Positivliste), für Satz F unerheblich |
| 4 Transponierte | Prosa (B3) | `Transponiert444.transp`, `transponiertEng_of`, `transponiertEng_genAlgL` | stimmt überein (generisch ohne Hypothese; einzeln unter benannten `TransN1`, `TransN2`) |
| 5 F1, F2 | B-014 | `Transponiert444.rank_four_two_four_ge_26 : 26 ≤ tensorRank K 4 2 4` für jeden Körper, ohne Hypothese | F2 stimmt wörtlich überein; F1 nicht eigens formalisiert, folgt trivial aus F2 |
| 6 Log | | Job 139504538345 | SORRY 0, nur propext, Classical.choice, Quot.sound |

**Tragen die Lean-Sätze zusammen den Ausschluss von Unterfall B im Umfang von B-014?** Ja, für das, wofür B-014 ihn braucht. Der Ausschluss ist in Lean an der generischen Normalform jeder Zerlegung der Länge 25 über jedem Körper ohne Hypothese bewiesen, und daraus ist F2, R(⟨4,2,4⟩) ≥ 26 über jedem Körper, als hypothesenfreier Satz `Transponiert444.rank_four_two_four_ge_26` formalisiert. Nicht formalisiert ist die punktweise Fassung „für alle p aus einer nichtleeren offenen Menge“ von Lemma Z und Satz F. Das ist eine Abweichung in der Form der Zwischenaussagen, nicht im Endergebnis.

**Nicht geprüft:** der Aussagen-Abgleich der Vorgänger-Sätze (`bruecke`, `folgerungC1_generisch`, `nur_unterfallB'`, `fall58_of_nichtSymmetrisch`, `yang_theorem_two_algorithm`), die nur als Beweisschritte eingehen; die Richtigkeit der Prosa-Beweise; der Zusatz „genau 26“ (B-010). Kein lokaler Bau.
