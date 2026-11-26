# S5-08: Aussagen-Datei, Lösungs-Modul, `comparator.json` und `formalization.yaml` für 4×2×4 (Bericht)

Auftrag S5-08, Stufe 5, Runde 2, Spur P (Portierungsauftrag). Zweig
`claude/project-thread-w5qsn6`, abgezweigt von `portierung` bei
`c4339fbd0ffee3b7ca224f989d5a6563cdfbf6cf`. Ziel des Pull Requests ist `portierung`.

## 1. Kurzfassung

- **Nicht gebaut.** `cache.mathlib.org` ist weiter gesperrt (Proxy 403, Abschnitt 2). Mathlib
  wurde nicht aus den Quellen gebaut, Actions wurde nicht als Ersatz benutzt. Keine der neuen
  Lean-Dateien ist von Lean übersetzt worden. Alle Aussagen über Lean-Code in diesem Bericht
  sind Lesebefunde.
- Angelegt (alle unter `lean/`):
  - `MatMulRank/Challenge.lean`: Aussagen-Datei, importiert vier Mathlib-Module, sonst nichts.
    Definitionen `MatMulRank.BilinearAlgorithm`, `MatMulRank.tensorRank`, Satz
    `MatMulRank.rank_four_two_four_ge_26` mit `sorry` (gewollte Lücke der Challenge).
  - `MatMulRank/Definitions.lean`: dieselben Definitionen Zeichen für Zeichen, mit denselben
    Importen, ohne den Satz. Wird von der Solution importiert (Grund in Abschnitt 4.3).
  - `MatMulRank/Solution.lean`: Brücke zu den Projektdefinitionen und Beweis des Satzes aus
    `YangBounds.Transponiert444.rank_four_two_four_ge_26`.
  - `comparator.json`, `formalization.yaml` (mit markierten Platzhaltern für den
    Repository-Eigentümer).
- Geändert: `lean/lakefile.toml` (neue Bibliothek `MatMulRank`, in `defaultTargets`),
  `.github/workflows/lean-project.yml` (ein Schritt, der die gemeinsamen Definitionen von
  Challenge und `Definitions.lean` vergleicht; Name des Bau-Schritts). Kein Modul der Kette
  ist angefasst.
- Eine Abweichung im Wortlaut gegenüber dem Projekt: `tensorRank` ist in der Challenge als
  `sInf` statt mit `Nat.find` und `exists_bilinearAlgorithm` geschrieben (Abschnitt 4.2). Die
  Solution beweist die Gleichheit beider Definitionen für alle `K, n, l, m`.
- Mit Palomars eigenem Prüfcode (Repo PalomarSubmission, lokal, ohne Netz zu Palomar) geprüft:
  `comparator.json` wird angenommen; `formalization.yaml` scheitert genau an den drei
  Platzhaltern und besteht in beiden vorbereiteten Fassungen (Abschnitt 6); die Quellprüfung
  bemängelt nur `versuche/s2-19-abgleich/Check.lean` (OF-1).

## 2. Mathlib-Cache (Probe zu Beginn und am Ende)

Toolchain: Lean 4.36.0 aus dem GitHub-Release `lean-4.36.0-linux.tar.zst` (Commit
`611c117bfaf7`), wie in S5-03. Abhängigkeiten von `lake` über `github.com` geholt (erreichbar).

| Zeit (UTC) | Probe | Ergebnis |
| --- | --- | --- |
| 15:23:37 | `lake exe cache get` in `lean/` | Paket `mathlib` bei `fc4f59e…` geholt, Werkzeug `cache` gebaut, dann „Attempting to download 9117 file(s) from leanprover-community/mathlib4 cache at https://cache.mathlib.org/mathlib4-master“; keine Datei geladen, Prozess nach etwa 3 Minuten ohne Fortschritt abgebrochen |
| 15:26 | `curl https://cache.mathlib.org/` | `curl: (56) CONNECT tunnel failed, response 403` |
| 15:28:39 | `lake exe cache get` erneut (Zeitgrenze 120 s) | wieder ohne geladene Datei, nach 120 s beendet |
| 15:30:39 | `curl https://cache.mathlib.org/` | `CONNECT tunnel failed, response 403` |

**Fehlende Domain: `cache.mathlib.org`** (dieselbe wie in S5-03). Keine weitere Domain
fehlte für diesen Auftrag.

## 3. Angelegte und geänderte Dateien

| Datei | Zeilen | Stand |
| --- | --- | --- |
| `lean/MatMulRank/Challenge.lean` | 98 (4.378 Byte) | angelegt, nicht gebaut |
| `lean/MatMulRank/Definitions.lean` | 58 | angelegt, nicht gebaut |
| `lean/MatMulRank/Solution.lean` | 80 | angelegt, nicht gebaut; braucht die Kette, die auf `portierung` noch nicht baut |
| `lean/comparator.json` | 6 | angelegt; von Palomars `load_comparator_config` angenommen |
| `lean/formalization.yaml` | – | angelegt mit drei markierten Platzhaltern (Abschnitt 6) |
| `lean/lakefile.toml` | – | `[[lean_lib]] name = "MatMulRank"`, `globs = ["MatMulRank.+"]`; `defaultTargets = ["YangBounds", "MatMulRank"]` |
| `.github/workflows/lean-project.yml` | – | neuer Schritt „Shared definitions of Challenge and Solution are identical (S5-08)“ vor dem Bau; der Bau-Schritt heißt jetzt „Build libraries YangBounds and MatMulRank (all modules)“, der Befehl `lake build` ist unverändert |

Modulnamen: `MatMulRank.Challenge`, `MatMulRank.Solution`, `MatMulRank.Definitions`.
Namensraum der Deklarationen: `MatMulRank`. Gewählt, weil `YangBounds.*` im Umfeld der
Solution schon belegt ist und kein Paket der Abhängigkeiten einen Eintrag `MatMulRank` an
seiner Wurzel hat (P-21, Abschnitt 5).

Nicht geändert: `.github/scripts/lean_report.py`. Folge: Der Axiom-Bericht in Actions nennt
`MatMulRank.rank_four_two_four_ge_26` noch nicht (die Liste `MAIN_THEOREMS` ist im Skript
fest). Der `sorry`-Bericht wird das gewollte `sorry` der Challenge mitzählen. Beides ist eine
Folgearbeit, falls der Orchestrator das Skript zum Auftrag rechnet.

## 4. Die Aussagen-Datei

### 4.1 Wortlaut im Vergleich mit dem Projekt

Quelle im Projekt: `lean/YangBounds/Basic.lean` (Zweig `portierung`, `c4339fb`) und
`lean/YangBounds/Transponiert444.lean` Z. 659.

| Deklaration | Projekt (alt) | Challenge (neu) | Grund |
| --- | --- | --- | --- |
| Struktur | `YangBounds.BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ)` mit den Feldern `alpha`, `beta`, `coeff`, `correct` | `MatMulRank.BilinearAlgorithm`, Felder und Typen wörtlich gleich | nur der Namensraum (Name im Umfeld der Solution frei) |
| Docstring der Struktur | „A bilinear algorithm of length `r` … Here `A * B` is the ordinary mathlib matrix product.“ | derselbe Text, „Mathlib“ groß, und der Zusatz „In the usual language of algebraic complexity this is a decomposition of the matrix multiplication tensor `⟨n, l, m⟩` into `r` tensors of rank one.“ | P-22 verlangt einen genauen Docstring mit der üblichen Bedeutung |
| Rang | `noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ := by classical; exact Nat.find (exists_bilinearAlgorithm K n l m)` | `noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ := sInf {r : ℕ \| Nonempty (BilinearAlgorithm K n l m r)}` | offene Frage OF-3, Abschnitt 4.2 |
| Docstring des Rangs | „`R_K(⟨n, l, m⟩)`: the smallest length of a bilinear algorithm for `⟨n, l, m⟩` over `K`. The minimum exists because of the schoolbook algorithm.“ | „`R_K(⟨n, l, m⟩)`, the tensor rank of `⟨n, l, m⟩` matrix multiplication over the field `K`: the smallest length `r` …“ mit Erklärung, dass die Menge nie leer ist und die Konvention `sInf ∅ = 0` nicht greift | P-22 |
| Satz | `theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4` in `YangBounds.Transponiert444` | derselbe Wortlaut in `MatMulRank` | nur der Namensraum |
| Hilfsdefinitionen | `entryForm`, `unitMatrix`, `standardAlgorithm`, `exists_bilinearAlgorithm` | entfallen | werden mit `sInf` nicht gebraucht |
| Importe | `Basic.lean`: 25 Mathlib-Module | `Mathlib.Algebra.Field.Defs`, `Mathlib.Algebra.Module.LinearMap.Defs`, `Mathlib.Data.Matrix.Mul`, `Mathlib.Order.Lattice.Nat` | nur was die Aussage braucht; `Mathlib.Data.Nat.Lattice` ist in dieser Mathlib als veraltet markiert (`deprecated_module (since := "2026-06-09")`), daher `Mathlib.Order.Lattice.Nat`, das die Instanz `InfSet ℕ` enthält |

Inhaltliche Gleichheit: Beide Rang-Definitionen sind die kleinste Länge eines Algorithmus.
`MatMulRank.tensorRank_eq_yangBounds` in der Solution sagt
`tensorRank K n l m = YangBounds.tensorRank K n l m` für alle `K, n, l, m` (ungebaut).
Die Konvention `sInf ∅ = 0` kann die Aussage nicht leer machen: Wäre die Menge leer, wäre
`26 ≤ 0` falsch, nicht wahr. Die Solution beweist außerdem, dass die Menge nicht leer ist
(`tensorRank_set_nonempty`).

Ob die Importe für die Übersetzung reichen, ist ungeprüft. Fehlt etwas, ist die sichere
Ausweichlösung `public import Mathlib` in Challenge und `Definitions.lean` zugleich (so machen
es Palomars eigene Testfälle).

### 4.2 Offene Frage OF-3 (`exists_bilinearAlgorithm` im Rumpf von `tensorRank`)

Wortlaut der Regeln:

- Verbindlich (`Pol/CONTRIBUTING.md` Z. 296–298, Commit `5bd35cd…`): „Deliberate holes in
  Challenge declarations are allowed. Comparator must confirm that every proved Solution
  declaration does not depend on `sorryAx`, `Lean.ofReduceBool`, a custom axiom, or an unnamed
  missing definition.“ Ob ein Satz, der nur im Rumpf einer Definition vorkommt, eine solche
  Lücke sein darf, sagt der Text nicht.
- Beschreibend, nicht als verbindlich bezeichnet (`Sub/docs/comparator-declaration-closure.md`
  Z. 15–17 und 35–41, Commit `0465543…`): jede erreichte gewöhnliche Deklaration muss in beiden
  Umgebungen „identical“ sein; „Configured `theorem_names` are holes in the same sense, and the
  walk treats them so wherever it reaches them. A named theorem is compared by statement, and
  its proof is not compared even when some other declaration's value mentions it.“

Nach der beschreibenden Datei dürfte `exists_bilinearAlgorithm` also als Lücke in
`theorem_names` stehen. Weil diese Datei nicht verbindlich ist, ist die Frage nach dem
verbindlichen Wortlaut **nicht geklärt**. Strengere Lesart: Ein Satz im Rumpf einer
Definition ist Teil der Definition. Er muss mit vollem Beweis in der Challenge stehen und in
der Solution identisch sein, auch im Beweisterm.

Für das alte `tensorRank` hieße das: `entryForm`, `unitMatrix`, `standardAlgorithm` (mit dem
`simp`-Beweis von `correct`) und `exists_bilinearAlgorithm` stünden in der Challenge, und ihre
Beweisterme müssten in der Solution gleich herauskommen. Das kann scheitern, weil `simp` in
einer größeren Umgebung andere Terme bauen kann, und weil Palomar die Challenge unter einem
anderen Modulnamen übersetzt (`Sub/README.md`, Abschnitt zur „per-run verifier-owned top-level
namespace“), was modulabhängige Hilfsnamen ändern kann.

Gewählt: `tensorRank` mit `sInf`. Dann kommt im Rumpf kein Satz vor, die Frage stellt sich für
die Challenge nicht, und die Challenge enthält keinen Beweis außer der gewollten Lücke. Das
erfüllt auch die strengere Lesart. Preis: eine Abweichung im Wortlaut (Abschnitt 4.1), die der
Aussagen-Abgleich nach 5.1 ansehen muss.

Ausweichlösung, falls der Orchestrator den Wortlaut `Nat.find` behalten will: die vier
Hilfsdeklarationen wörtlich in Challenge und `Definitions.lean` aufnehmen (der Abgleich im
Workflow deckt das mit ab) und auf den Lauf von Comparator warten, ob die Beweisterme gleich
herauskommen.

### 4.3 Warum `Definitions.lean`

Comparator verlangt gleiche Deklarationen in Challenge und Solution
(`comparator-declaration-closure.md` Z. 15–17). Die Solution kann die Challenge nicht
importieren, denn die Challenge enthält den Satz mit `sorry` unter demselben Namen. Würde die
Solution die Definitionen selbst ausschreiben, liefe die Elaboration in der Umgebung der ganzen
Kette; die Instanzsuche könnte dort andere, nur definitorisch gleiche Terme wählen.
`Definitions.lean` hat dieselben Importe und denselben Text wie die Challenge, also dieselbe
Umgebung. Der neue Workflow-Schritt vergleicht mit `diff` den Kopf bis
`@[expose] public section` und den Block zwischen `-- BEGIN SHARED DEFINITIONS` und
`-- END SHARED DEFINITIONS`. Lokal mit denselben Befehlen ausgeführt: gleich.

Restrisiko, nur mit Comparator prüfbar: Der Satz selbst (`26 ≤ tensorRank K 4 2 4`) wird in
der Solution in der größeren Umgebung elaboriert. `≤` und `26` auf `ℕ` sollten dort dieselben
Instanzen finden, belegt ist das nicht.

## 5. Stand je Anforderung

Beobachtet auf dem Zweig `claude/project-thread-w5qsn6` nach Commit `4181f59`. „Lokaler
Palomar-Code“ heißt: Funktion aus PalomarSubmission `0465543…`, lokal auf dieses Repo
angewendet. „offen“ heißt: ohne Bau oder ohne die Entscheidung eines anderen nicht feststellbar.

| Nr. | Stand | Beleg oder Grund |
| --- | --- | --- |
| P-1 | erfüllt | `lean/lean-toolchain` = `leanprover/lean4:v4.36.0` (≥ v4.35.0-rc2), aus S5-03 |
| P-2 | erfüllt | Manifest: Mathlib `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`; dessen `lean-toolchain` (geholt nach `lean/.lake/packages/mathlib/`) = `leanprover/lean4:v4.36.0` |
| P-3 | erfüllt | `lean/lean-toolchain` im gewählten Projekt `lean` |
| P-4 | erfüllt | nur `lean/lakefile.toml`; mit Python `tomllib` gelesen |
| P-5 | erfüllt, Vollständigkeit offen | `lean/lake-manifest.json` vorhanden, 9 Pakete; `lake` hat beim Holen nichts daran geändert (`git status` sauber). Ob es ohne Netz vollständig baut: ohne Bau offen |
| P-6 | erfüllt | alle 9 URLs `https://github.com/…`, keine mit `.git`, alle mit 40-stelligem SHA |
| P-7 | erfüllt | keine `.gitmodules` |
| P-8 | offen | keine `.gitattributes` im Repo; Abhängigkeiten nicht geprüft |
| P-9 | erfüllt | keine `.olean`, `.ilean`, `.o`, `.so`, `.a`, `.trace` außerhalb von `lean/.lake` (`find`) |
| P-10 | erfüllt | 11 MB ohne `.git` und `.lake` (`du`) |
| P-11 | erfüllt | `mm325_proof` nicht mehr im Manifest (S5-03) |
| P-12 | offen | kein Bau möglich |
| P-13 | nicht erfüllt | lokaler Palomar-Code `inspect_lean_sources`: 34 Dateien geprüft, einziger Fehler `versuche/s2-19-abgleich/Check.lean must begin with the module header keyword`. Liegt außerhalb von `lean/` (OF-1), nicht in meinem Auftrag. Die drei neuen Dateien haben den Modulkopf |
| P-14 | erfüllt | derselbe Lauf, Grenze 10.000 Zeilen, kein Fehler |
| P-15 | erfüllt | keine symbolischen Verknüpfungen außerhalb `.git`/`.lake` (`find -type l`) |
| P-16 | offen | `public import`, `@[expose] public section` gesetzt; ob es so übersetzt, ist ohne Bau offen |
| P-17 | erfüllt | `MatMulRank.Challenge` ≠ `MatMulRank.Solution`, beide Teile passen zu `[A-Za-z_][A-Za-z0-9_']*` |
| P-18 | erfüllt nach Lesart | Dateien unter `lean/MatMulRank/`, Bibliothek mit `globs = ["MatMulRank.+"]`, Quellverzeichnis `lean/`; Lake selbst nicht befragt |
| P-19 | erfüllt | Challenge 98 Zeilen, 4.378 Byte (unter der Warnschwelle 300 Zeilen / 32 KiB und unter 100 Zeilen / 32 KiB für die eingebettete Anzeige) |
| P-20 | erfüllt nach Text, Übersetzung offen | Challenge importiert nur vier Mathlib-Module (Abschnitt 4.1) |
| P-21 | erfüllt | kein Paket der Abhängigkeiten (Cli, LeanSearchClient, Qq, aesop, batteries, importGraph, mathlib, plausible, proofwidgets) hat einen Eintrag `MatMulRank` an seiner Wurzel (`ls`) |
| P-22 | erfüllt nach Lesart, redaktionell offen | nur Mathlib-Importe; eine Struktur und eine Definition, beide mit Docstring; Modul-Dokumentation mit Aussage und Grenzen |
| P-23 | offen | durch `Definitions.lean` und den Workflow-Abgleich vorbereitet (Abschnitt 4.3); Gleichheit nur durch einen Lauf von Comparator belegbar |
| P-24 | erfüllt | lokaler Palomar-Code `load_comparator_config` nimmt die Datei an; genau die vier Pflichtschlüssel |
| P-25 | erfüllt | `["propext", "Quot.sound", "Classical.choice"]` |
| P-26 | offen | kein Bau, kein Axiom-Bericht. Die Solution enthält kein `sorry`, kein `axiom`, kein `native_decide` (Text) |
| P-27 | erfüllt | `lean/comparator.json`, im gewählten Projekt, endet auf `.json`, eine Konfiguration |
| P-28 | entfällt | kein `definition_names` |
| P-29 | erfüllt | `lean/formalization.yaml`: UTF-8, eine Abbildung, keine doppelten Schlüssel (Palomars `UniqueKeySafeLoader`), `version: v0.4` |
| P-30 | erfüllt | `project.name` gesetzt (78 Zeichen) |
| P-31 | erfüllt | `project.description` gesetzt (1.042 Zeichen) |
| P-32 | nicht erfüllt (Platzhalter) | `project.authors: []` mit Markierung; füllt nur der Repository-Eigentümer |
| P-33 | Wert gesetzt, Abgleich offen | `project.license: Apache-2.0`; `LICENSE` an der Wurzel beginnt mit „Apache License Version 2.0“; Palomars Lizenzerkennung (`detect_license.rb`) nicht ausgeführt |
| P-34 | erfüllt | `arxiv: [cs.CC, math.AG, math.RA]`, `msc2020: [68Q17, 15A69, 14N07]`, alle in Palomars Listen. Vorschlag, siehe Abschnitt 7 |
| P-35 | erfüllt | drei Einträge (`agent`, zweimal `other`) mit Modellen laut README und `ergebnisse/rang-444.md` Abschnitt 8 |
| P-36 | erfüllt | `review.status: agent-reviewed` mit `reviewers` und `notes` |
| P-37 | nicht erfüllt (Platzhalter) | `project.responsible_maintainers: []` mit Markierung |
| P-38 | nicht erfüllt (Platzhalter) | ein Platzhalter-Eintrag und ein Platzhalter-`relationship` bei Yang; alle übrigen Einträge mit `title` und gültigem `relationship` |
| P-39 | nicht erfüllt (Platzhalter) | Entscheidung des Repository-Eigentümers; beide Fassungen bestehen den lokalen Palomar-Code (Abschnitt 6) |
| P-40 | erfüllt | kein Schlüssel `repository` |
| P-41 | erfüllt | ein Eintrag mit `id` (`fallnlove/mm325_proof`) und `note` |
| P-42 | teilweise | Modul-Dokumentation der Challenge und `formalization.yaml` enthalten Aussage, Grenzen, Quellen, KI-Beteiligung; `lean/README.md` ist nicht angepasst (nicht in meinem Auftrag) |
| P-43 | offen | genau eine Lizenzdatei `LICENSE` an der Wurzel; Erkennung durch Palomar nicht ausgeführt |
| P-44 bis P-46 | offen | redaktionell, nicht vorab prüfbar |
| P-47 bis P-49 | Sache des Repository-Eigentümers | kein Agent reicht ein; Pfade bei Einreichung: Projekt `lean`, Konfiguration `lean/comparator.json` |
| P-50 | Hinweis | unverändert |
| P-51 | Hinweis | Pfade `lean` und `lean/comparator.json` sind mit diesem Auftrag festgelegt; Modulnamen `MatMulRank.Challenge`, `MatMulRank.Solution` |

## 6. Offene Entscheidungen des Repository-Eigentümers

### 6.1 Autoren und verantwortliche Betreuer

In `lean/formalization.yaml` stehen `project.authors: []` und
`project.responsible_maintainers: []`, je mit einem Kommentar `TODO-REPOSITORY-OWNER`.
Verlangt ist je eine nicht leere Liste von Namen (Zeichenketten), nur Menschen, kein
KI-Modell, Agent, System, keine Sitzung, kein Werkzeug (`Pol/CONTRIBUTING.md` Z. 491–498,
510–513, 551–557). Ein Eintrag darf auch eine Abbildung mit `name` und optional `github` und
`orcid` sein; eine ORCID gehört nicht in `name` und wird gegen das ORCID-Register geprüft
(`Sub/README.md` Z. 295–306).

Warum leere Listen statt Text: Ein Platzhaltertext als Name besteht Palomars mechanische
Prüfung (lokal ausprobiert). Leere Listen lassen sie scheitern, bis die Felder gefüllt sind.

### 6.2 Herkunft: „original“ oder „source-based“

In der Datei stehen dafür zwei Platzhalter: ein Eintrag mit Titel `TODO-REPOSITORY-OWNER: …`
und das `relationship` der Quelle Yang. Beide Fassungen sind vorbereitet. Mit zwei
Beispielnamen in den Personenfeldern hat Palomars lokaler Code (`load_formalization_metadata`)
beide angenommen, und beide sind gültig gegen das Schema v0.4 (`FY/schema/v0.4.schema.json`,
Commit `99c678e…`).

**Fassung A, „original“** (Palomar leitet `result_origin: original` ab):

```yaml
  - title: "Lower bound 26 for the tensor rank of <4,2,4> over every field"
    type: original-proof
    relationship: other
    note: "First presented in this repository (literature check of 25/26 November 2026)."
```

statt des Platzhalter-Eintrags, und bei Yang `relationship: background`. Alle übrigen
Einträge (Hopcroft–Kerr, Shitov: `background`; matmulcatalog: `other`) passen zu dieser Form.

**Fassung B, „source-based“** (Palomar leitet `result_origin: source-based` ab): den
Platzhalter-Eintrag streichen, bei Yang `relationship: adapts`. Die übrigen Einträge bleiben.

Was für die Wahl zählt, aus dem Wortlaut der Regeln (`Pol/CONTRIBUTING.md` Z. 534–543):
„`type: original-proof` only when the formalisation is the first presentation of the result“;
„A new proof of a known result is source-based“; „Prior work that the recorded result
substantively formalises or adapts likewise makes the result source-based.“ Für A spricht die
Literaturprüfung des Projekts (`ergebnisse/rang-444.md` Abschnitt 6: kein Beweis von 26
gefunden). Für B spricht, dass die Kette Yangs Normalform und Yangs Satz 2 benutzt
(`ergebnisse/rang-444.md` Abschnitt 3 und 7: „steps 1 to 6 rely on Yang's normal form“) und
Protokoll Abschnitt 9 („Eine Formalisierung von Yangs Beweis ist Yangs Satz“). Die Entscheidung
trifft der Repository-Eigentümer.

### 6.3 Weitere Angaben, die er prüfen sollte

- `classification` (Abschnitt 7) ist ein Vorschlag.
- `review.notes` sagt, dass Aussagen-Abgleich und Bau der Challenge noch ausstehen; nach diesen
  Schritten ist der Text nachzuführen.
- `related_formalizations` nennt `fallnlove/mm325_proof` als frühere Vorlage. Wenn das nicht
  erwünscht ist, kann der Eintrag entfallen (das Feld ist freiwillig).

## 7. Belege für die übrigen Felder von `formalization.yaml`

Nur aus dem Repo belegte Angaben, nichts erfunden:

| Feld | Wert | Beleg |
| --- | --- | --- |
| `project.license` | `Apache-2.0` | `LICENSE`, README Abschnitt „License“ |
| Quelle Yang | arXiv:2609.14393, Fassung 3 vom 12.10.2026 | `lit/QUELLEN.md` Z. 12; `ergebnisse/rang-444.md` Abschnitt 7 |
| Quelle Hopcroft–Kerr | doi:10.1137/0120004, SIAM J. Appl. Math. 20(1) (1971), 30–36; Original nicht gelesen | `lit/QUELLEN.md` Z. 11 |
| Quelle Shitov | doi:10.13140/RG.2.2.29432.61441; Dokument nicht gelesen | `lit/QUELLEN.md` Z. 14 |
| matmulcatalog | Commit `0a9f83a…`, `docs/LOWER_BOUNDS.md` Z. 90 | `ergebnisse/rang-444.md` Abschnitt 6 |
| `automation.methods` | Claude Fable 5.2, Claude Opus 5.5, Claude Code; GPT 6.2 Sol; `gemini-4-carbon` | README „How this project works“; `ergebnisse/rang-444.md` Abschnitt 8 |
| `review` | Abgleich durch Modelle, kein menschlicher Gutachter | README; `ergebnisse/rang-444.md` Abschnitt 2 und 8 |
| `classification` | `cs.CC` (Yang26 ist in cs.CC), `math.AG` (Normalformen, Kurven in ℙ¹ × ℙ¹), `math.RA`; MSC `68Q17` (untere Schranken), `15A69` (multilineare Algebra, Tensoren), `14N07` (Tensorrang) | Codes in `Sub/taxonomies/*.json` nachgesehen; Auswahl ist Vorschlag |

## 8. Was für „Rang gleich 26“ in der Challenge anders wäre

- Aussage: `theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26`
  (oder zusätzlich `tensorRank K 4 2 4 ≤ 26`). Die Definitionen blieben gleich.
- `comparator.json`: der neue Name in `theorem_names`. In derselben Datei bleibt es ein
  Register-Eintrag; als eigene Datei wäre es ein eigener Eintrag (P-27).
- Solution: dazu ein Algorithmus der Länge 26 als Lean-Term (etwa aus
  `verfahren/4x2x4-r26-s001.json`, Koeffizienten in {−1, 0, 1}) mit Korrektheitsbeweis, nach
  dem Muster von `lean/YangBounds/Upper3x2x6.lean` (`decide +kernel`, erzeugt kein
  `Lean.ofReduceBool`; ob die Prüfprogramme von Palomar das in vertretbarer Zeit nachrechnen,
  ist offen). Die Gleichheit folgt dann mit `le_antisymm` aus der unteren Schranke und
  `Nat.sInf_le`.
- `formalization.yaml`: Name, Beschreibung und die Rolle von Hopcroft–Kerr (dann formalisiert:
  `formalizes` oder `independently-proves` für die obere Schranke) wären anzupassen.

## 9. Commits und Verbrauch

| Commit | Zeit (UTC) | Inhalt |
| --- | --- | --- |
| `8bd7dd0` | 2026-11-26 15:26:34 | Challenge, Definitions, Solution, Lakefile, Workflow-Schritt |
| `4181f59` | 2026-11-26 15:28:37 | `comparator.json`, `formalization.yaml` |
| (dieser Bericht) | siehe Git | Bericht |

Verbrauch: keine Subagenten, keine Fremdmodell-Anfragen. Rechenblöcke: zwei Proben von
`lake exe cache get` (etwa 3 Minuten und 2 Minuten), sonst nur Lese- und Prüfskripte.
Gelesene Fremd-Repos (nur gelesen, nichts kopiert): PalomarPolicy `5bd35cd…`,
PalomarSubmission `0465543…`, mathlib-initiative/formalization.yaml `99c678e…`. Palomars
Python-Prüfcode lief lokal im Arbeitsverzeichnis der Sitzung, nicht im Repo. Kein Aufruf von
palomar-registry.org oder submit.palomar-registry.org.

Eingeblendetes Projektgedächtnis: Der Index und die Einträge `aussagen-abgleich-n3`,
`git-regeln`, `hk-verfahren-a10`, `lean-upper-3x2x6` wurden mir eingeblendet. Ich habe nichts
ins Gedächtnis geschrieben.
