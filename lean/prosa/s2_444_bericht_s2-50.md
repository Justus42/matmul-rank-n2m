# S2-50: Aussagen-Abgleich zu B-016 (Prüferbericht)

Auftrag S2-50, Rolle Prüfer, im Auftrag des Orchestrators. Geprüfter Stand: `main` bei Commit
`c3c3884028c840d0afd9c14944394aee21fd5729` (derselbe Commit, den der Actions-Job 139504538345
ausgecheckt hat, Log-Zeile `git log -1 --format=%H`). Dieser Bericht setzt keinen Status.

## 0. Offenlegung: eingeblendete und gesehene Hinweise

### 0.1 Projektgedächtnis, Index (eingeblendet beim Start), wörtlich

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von <n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 25.11.2026 Version 0.4.1 (von Justus).
- Person schreibt Deutsch.
- Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
- Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
- Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4: kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, Stufe 3 nur mit Budget. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert oder ausgelegt werden müsste.
- Justus am 25.11.2026, wörtlich: „Freigabe zu weiteren Runden nach deinem Ermessen“. Stufe 3 braucht ein eigenes Budget.
- Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
- Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
- Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
- Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
- Protokoll Abschnitt 6: höchstens 6 Subagenten pro Runde (Stufe 2 ab Runde 9), 24 Runden für Stufe 2, Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
- Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung, letzte am 25.11.2026 11:47 UTC.
- Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
- Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
- [[verfahren-datenformat]]: Datenformat der Verfahren
- [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht
```

(Im Original sind `<n,2,m>` als `&lt;n,2,m>` kodiert.)

### 0.2 Einzeleinträge des Gedächtnisses, die mir während der Arbeit eingeblendet wurden, wörtlich

`aussagen-abgleich-n3.md`:

```
- Bridge-Hinweis: Das Repo matmul-rank-n2m ist in der Bridge NICHT freigegeben (`repo`/`files` scheitern). Dateien wörtlich in `prompt` einfügen. Batch war nach ~1 min fertig.
- Lean lokal: Toolchain über GitHub-Release; eine Prüfdatei braucht `import YangBounds.Statements` (YangBounds.olean wird bei Teilziel nicht gebaut).
Verwandt: [[lean-build-cloud]]
```

`gemini-bridge.md`:

```
Stand 25.11.2026 (A-03):
- `ask_gemini` mit `repo`/`files` geht nur für freigegebene Repos. Justus42/matmul-rank-n2m und fallnlove/mm325_proof sind **nicht** freigegeben. Inhalte deshalb wörtlich in `prompt` einfügen (Auszüge, Beweise weglassen).
- Das MCP-Werkzeug bricht nach 60 s ab (Ergebnis unbekannt). Mit Denkstufe high und ca. 12 KB Eingabe: Zeitüberschreitung. Mit Denkstufe low und `max_output_tokens` 8000: Antwort in Ordnung (~0,03 $).
- Für Unabhängigkeit nach Protokoll 4/5.1: dem Fremdmodell kein eigenes Urteil zeigen, offene Fragen mit JA/NEIN/TEILWEISE stellen.

Verwandt: [[git-regeln]]

Stand 25.11.2026 05:10 (S1-05 Nachtrag): Gemini-Projekt hat die **monatliche Ausgabengrenze** erreicht, Batch-Auftrag abgelehnt. Orchestrator: kein Ausweichen auf OpenRouter (Budgetgrenze von Justus). Wenn Justus die Grenze anhebt: yang_n3.md ungekürzt als Batch (gemini-4-carbon, high) erneut abgeben, Ergebnis als Nachtrag in lean/prosa/yang_n3_pruefung.md, PR „S1-05 Nachtrag“.
```

`lean-build-cloud.md`:

```
Stand 25.11.2026 (A-02):
- elan-Installer geht, aber Toolchain-Download über releases.lean-lang.org ist per Proxy gesperrt (403). Umweg: `https://github.com/leanprover/lean4/releases/download/v4.19.0/lean-4.19.0-linux.tar.zst` laden (kein zstd-Binary: mit `pip install zstandard` + Python entpacken), dann `elan toolchain link leanprover/lean4:v4.19.0 <dir>`.
- `lake exe cache get` scheitert: lakecache.blob.core.windows.net gesperrt (403). mathlib muss aus Quellen gebaut werden, in Blöcken ≤30 min (`timeout 1800 lake build`, inkrementell).
- Nicht `lake update` benutzen (schreibt lake-manifest.json um); `lake build` holt die Pakete aus dem Manifest.
- In GitHub Actions ist der mathlib-Cache erreichbar (~2,5 min pro Lauf). Workflows: `.github/workflows/lean-build.yml` (A-11, PR #9) und `lean-project.yml` (S1-14).
Verwandt: [[mm325-lizenz]], [[lean-project-ci]]
```

Bewertung: Keiner dieser Einträge enthält ein Urteil zu B-016. `aussagen-abgleich-n3.md` nennt durch seinen Namen einen früheren Aussagen-Abgleich zu einem anderen Gegenstand (n = 3), ohne Ergebnis. `gemini-bridge.md` nennt Auftrags- und Dateinamen (S1-05, `yang_n3.md`, `yang_n3_pruefung.md`) ohne Urteil.

### 0.3 Sonstige Hinweise, die ich gesehen habe

- Auftragstext des Orchestrators: „Ob die Behauptung stimmt und ob der Abgleich aufgeht, ist offen. Ein bestimmtes Ergebnis ist nicht erwünscht.“ Kein Urteil.
- `CLAUDE.md` (automatisch eingeblendet). Kein Urteil zu B-016.
- Der Doc-Kommentar in `Transponiert444.lean` (Positivliste) nennt den Satz „without hypothesis“; die Auswertung im Actions-Log beschriftet ihn als „Final theorem R<4,2,4> >= 26, no hypothesis“ und `[STANDARD]`. Das sind Selbstauskünfte der Autoren bzw. des Workflows; ich habe sie nicht übernommen, sondern die Aussage selbst gelesen.
- Außerhalb der Positivliste, beim Orientieren unvermeidlich gesehen: die Überschriften aller Abschnitte von `PROTOKOLL.md` (nur Titelzeilen, per `grep '^## '`), die Verzeichnisliste von `lean/` (enthält den Ordnernamen `prosa`) und `lean/YangBounds/`, die Commit-Zeile von `main` („c3c3884 Merge pull request #80: Kommentare gekürzt“), der letzte Commit, der `Transponiert444.lean`/`Basic.lean` berührt (`90409c5`, 20:44 UTC, ohne Nachricht), sowie ein alter lokaler Stand `cbc6d61 Projektgerüst: …`. Inhalte von `LOG.md`, `STATUS.md`, `pruefvermerke/`, `archiv/`, `lean/prosa/` und `versuche/` habe ich nicht gelesen. Ein früheres Urteil zu B-016 habe ich nicht gesehen.
- Zur Namensauflösung habe ich zusätzlich die Quelltexte der beiden Abhängigkeiten im Manifest-Stand nach dem Bezeichner `tensorRank` durchsucht (mathlib `c44e0c8`, `fallnlove/mm325_proof` `759cf4a`), nur per `grep`.

## 1. Entspricht die Lean-Aussage der Behauptung? — **stimmt überein**

Behauptung (`behauptungen/B-016.md`): „Für jeden Körper K gilt R_K(⟨4,2,4⟩) ≥ 26. In Lean: `26 ≤ tensorRank K 4 2 4` für jeden Körper `K`.“

Lean-Satz (`lean/YangBounds/Transponiert444.lean:655`):

```lean
theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 :=
  LemmaZ444.rank_four_two_four_ge_26_of_transponiertEng K fun alg => transponiertEng_genAlgL alg
```

Voller Name `YangBounds.Transponiert444.rank_four_two_four_ge_26` (Namespaces Zeile 86–87), wie in B-016 angegeben.

### 1.1 Definitionen (`lean/YangBounds/Basic.lean`)

```lean
structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
  alpha : Fin r → (Matrix (Fin n) (Fin l) K →ₗ[K] K)
  beta : Fin r → (Matrix (Fin l) (Fin m) K →ₗ[K] K)
  coeff : Fin r → Matrix (Fin n) (Fin m) K
  correct : ∀ (A : Matrix (Fin n) (Fin l) K) (B : Matrix (Fin l) (Fin m) K),
    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k

theorem exists_bilinearAlgorithm (K : Type u) [Field K] (n l m : ℕ) :
    ∃ r, Nonempty (BilinearAlgorithm K n l m r) :=
  ⟨_, ⟨standardAlgorithm K n l m⟩⟩

noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ := by
  classical
  exact Nat.find (exists_bilinearAlgorithm K n l m)
```

Alles darunter ist Mathlib: `Matrix`, `Fin`, `→ₗ[K]` (lineare Abbildungen), das Mathlib-Matrixprodukt `*`, `Finset.sum`, `•`, `Nat.find`. Die Datei definiert keine eigenen Instanzen, keine Notation und kein Axiom; `Field` ist die Mathlib-Klasse.

Einzelpunkte:

- **Begriff.** Ein `BilinearAlgorithm K n l m r` ist genau eine Zerlegung `A·B = Σ_{k<r} α_k(A) β_k(B) C_k` mit beliebigen K-Linearformen α_k auf K^{n×l}, β_k auf K^{l×m} und beliebigen Matrizen C_k ∈ K^{n×m}, gültig für alle A, B über K. Das ist eine Darstellung des Matrixmultiplikationstensors ⟨n,l,m⟩ ∈ (K^{n×l})* ⊗ (K^{l×m})* ⊗ K^{n×m} als Summe von r Tensoren vom Rang 1 (α_k ⊗ β_k ⊗ C_k). Umgekehrt liefert jede Rang-1-Zerlegung eine solche Liste. `tensorRank` ist also der übliche Tensorrang (= bilineare Komplexität) von ⟨n,l,m⟩ über K.
- **Keine eingeschränkte Klasse.** α, β, C sind ohne Nebenbedingung (keine Normalform, keine Ganzzahligkeit, keine Kommutativität der Algorithmen, keine Beschränkung von r außer r ∈ ℕ). Die Gleichung gilt über K selbst, nicht über einer Erweiterung.
- **Minimum, keine leere Menge.** `Nat.find` liefert das kleinste r mit einer Zerlegung der Länge r. Die Menge ist nichtleer, belegt durch den Schulalgorithmus `standardAlgorithm` (ein bewiesenes `def`, kein Axiom). Es gibt also keinen Standardwert 0 für ein leeres Infimum; `tensorRank_attained` und `le_tensorRank_iff` (`c ≤ tensorRank ↔ ∀ r, BilinearAlgorithm K n l m r → c ≤ r`) bestätigen das in der Datei.
- **Formate.** In `tensorRank K 4 2 4` ist n = 4, l = 2, m = 4: A ist 4×2, B ist 2×4, das Produkt 4×4. Das ist ⟨4,2,4⟩ in der Konvention ⟨n,l,m⟩ = (n×l)·(l×m), die auch die Docstring-Zeile von `Basic.lean` angibt. (⟨4,2,4⟩ ist in n und m ohnehin symmetrisch, ein Vertauschen der äußeren Indizes änderte nichts; die innere 2 steht an der richtigen Stelle.)
- **Zahl und Vergleich.** `26 ≤ …` in ℕ, keine Subtraktion, keine Division, kein Cast.
- **Namensauflösung.** Am Ort des Satzes (nach `end Endsatz`, außerhalb aller `section`s) sind geöffnet: `YangBounds`, `YangBounds.Transponiert444` sowie `Module Matrix YangN4Haupt SatzE444 SatzE444Buendel SatzF444` und ausgewählte Namen aus `YangN3Teil2` (Zeile 89–90). Ein `def tensorRank` gibt es im Repo nur in `Basic.lean` (Namespace `YangBounds`); in mathlib `c44e0c8` und in `mm325_proof` `759cf4a` kommt der Bezeichner `tensorRank` nicht vor (die Abhängigkeit hat `MatrixMultiplicationLowerBound.matrixTensorRank`, nicht geöffnet). `tensorRank` ist also eindeutig `YangBounds.tensorRank`. Zusätzlich benutzt dieselbe Datei in `rank_four_two_four_ge_26_of_vielePunkte` mit demselben Ausdruck `rw [le_tensorRank_iff]`, was nur mit `YangBounds.tensorRank` gelingt.
- **Universen.** `K : Type u` mit freier Universumsvariable `u`: der Satz gilt für Körper in jedem Universum, keine Einschränkung.

## 2. Keine Hypothese außer dem Körper? — **stimmt überein**

Die Binder sind genau `(K : Type u) [Field K]`. Der Satz steht außerhalb aller `section`s (Abschnitt `Endsatz` endet Zeile 648, Satz Zeile 655); auf Dateiebene gibt es kein `variable`, in der Datei kein `include`, kein `omit`, kein `attribute`, keine lokale oder `scoped` Instanz. Die `variable {K : Type u} [Field K]` der Abschnitte `Trans` und `Generic` sind am Satzort nicht mehr in Kraft und würden ohnehin durch den expliziten Binder `K` verdeckt. Der Beweisterm ist eine Anwendung von `LemmaZ444.rank_four_two_four_ge_26_of_transponiertEng` auf `K` und den Beweis `transponiertEng_genAlgL`; die Hypothese jenes Hilfssatzes wird also im Beweis erfüllt und taucht in der Aussage nicht auf. (Ob die Hilfssätze inhaltlich stimmen, ist nicht Gegenstand des Aussagen-Abgleichs; das sichert der Kernel-Check des Builds.)

## 3. Log: SORRY 0 und nur Standard-Axiome? — **stimmt überein**

Actions-Job 139504538345 (Lauf 45699204903), ausgecheckter Commit `c3c3884028c840d0afd9c14944394aee21fd5729`, Toolchain `leanprover/lean4:v4.19.0`, mathlib `c44e0c8ee63ca166450922a373c7409c5d26b00b`, mm325_lower_bound `759cf4a…`.

- `✔ … Built YangBounds.Transponiert444` (`[1760/1761]`), dann `Build completed successfully.`
- Wörtlich:
  ```
  SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
  SORRY: 0 'sorry' token(s) in the sources outside comments
  ```
- Im Build-Log (aus dem `#print axioms` am Dateiende, Zeile 673):
  ```
  info: ././././YangBounds/Transponiert444.lean:673:0: 'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
- Im separaten Axiom-Check des Workflows:
  ```
  'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
  AXIOM-RESULT|YangBounds.Transponiert444.rank_four_two_four_ge_26|propext, Quot.sound, Classical.choice
  ```

Die Zeilennummer 673 im Log stimmt mit der lokalen Datei auf `c3c3884` überein. Kein `sorryAx`, kein eigenes Axiom.

**Lokaler Bau:** nicht durchgeführt. In dieser Umgebung sind der Lean-Toolchain-Server und der mathlib-Cache gesperrt; mathlib müsste aus Quellen gebaut werden (Stunden). Nach Protokoll 5.1 Punkt 4 ist das grüne Ergebnis in GitHub Actions maßgeblich; `#print axioms` habe ich deshalb nur aus dem Log gelesen, nicht selbst ausgeführt.

## 4. Nebenbefund (ohne Einfluss auf das Urteil)

B-016 nennt als Artefakt „PR #77 (Merge 32f12f6)“. Geprüft habe ich den Stand `c3c3884`, auf dem `Transponiert444.lean` zuletzt in `90409c5` geändert wurde (`main` steht auf dem Merge „Merge pull request #80: Kommentare gekürzt“). Ob sich die Aussage zwischen `32f12f6` und `c3c3884` geändert hat, habe ich nicht geprüft (Commit-Listen außerhalb der Positivliste). Mein Urteil gilt für die Aussage auf `c3c3884`.

## 5. Gesamturteil

| Punkt | Urteil |
|---|---|
| 1. Lean-Aussage = Behauptung (Tensorrang ⟨4,2,4⟩ ≥ 26 über jedem Körper) | stimmt überein |
| 2. Keine Hypothese außer `[Field K]` | stimmt überein |
| 3. SORRY 0, Axiome nur propext, Classical.choice, Quot.sound | stimmt überein |

Ich habe keine Stelle gefunden, an der die Aussage leer oder schwächer wird.
