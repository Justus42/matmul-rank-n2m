# Anforderungen des Registers Palomar an eine Einreichung

Auftrag S5-02 (Stufe 5, Runde 1, Spur P). Gelesen am 26.11.2026 ab 14:52 UTC (Klone der Repos).

Gegenstand der späteren Einreichung: das Lean-Projekt in `lean/`, Endsatz
`YangBounds.Transponiert444.rank_four_two_four_ge_26` (`26 ≤ tensorRank K 4 2 4` für jeden Körper `K`).

Diese Datei beschreibt nur, was Palomar verlangt. Sie füllt keine Felder aus und entscheidet nichts.
Die Felder für Autoren und verantwortliche Betreuer füllt nur der Repository-Eigentümer.
Kein Agent reicht ein und kein Agent ruft das Einreichformular auf (CLAUDE.md Regel 9).

## 1. Quellen

| Kürzel | Repo | Commit (vollständig) | Commit-Zeit | Geladen über |
| --- | --- | --- | --- | --- |
| **Pol** | PalomarRegistry/PalomarPolicy | `5bd35cddcfc940532bb5f55e399d68b49b0986a5` | 2026-11-26T15:14:52+11:00 | `git clone https://github.com/PalomarRegistry/PalomarPolicy.git` |
| **Sub** | PalomarRegistry/PalomarSubmission | `046554302064b2c83c2b924bea6db87fc5900c68` | 2026-11-26T16:24:27+11:00 | `git clone https://github.com/PalomarRegistry/PalomarSubmission.git` |
| **FY** | mathlib-initiative/formalization.yaml | `99c678e569c7c4c0772db297c5ddd5e4c9b6322e` | 2026-08-25T11:06:01-06:00 | `git clone --depth 1 …` (nur zur Information, siehe unten) |

Gelesene Dateien und warum sie gelten:

- `Pol/CONTRIBUTING.md`: der Einreichungsstandard (Auftrag).
- `Sub/toolchains.json`: die Mindestversion (Auftrag).
- `Pol/docs/specification.md`: CONTRIBUTING.md Z. 55–57 nennt sie „the binding statement“, wo CONTRIBUTING zusammenfasst.
- `Pol/taxonomies/classification-guide.md`: laut specification.md Z. 8–9 „binding interpretation for classification review“.
- `Pol/rubric.json`: laut specification.md Z. 5–7 maschinenlesbarer Prüfvertrag (Mindestwert 4, Pflichtwert Notability).
- `Sub/taxonomies/arxiv-categories.json`, `Sub/taxonomies/msc2020-codes.json`: von CONTRIBUTING.md Z. 516–522 als Liste der zulässigen Codes genannt.
- `Sub/licence-supplement/README.md`: von CONTRIBUTING.md Z. 388–392 als Teil der zulässigen Lizenzen genannt.
- `Sub/README.md` (Abschnitte „Required source layout“ und „Lean source requirements“, Z. 250–460): Mechanik der Prüfung. CONTRIBUTING verweist auf das Repo, die Datei selbst wird nicht als verbindlich bezeichnet. Sie wird hier nur dort zitiert, wo sie eine Prüfregel nennt, die CONTRIBUTING nicht nennt.
- `Sub/docs/comparator-declaration-closure.md`: wie Comparator Challenge und Solution vergleicht. Nicht als verbindlich bezeichnet, beschreibt aber das Prüfprogramm.
- `Sub/allowed-challenge-repositories.json`, `Sub/verification-profile.json`, `Sub/execution-profiles.json`, `Sub/checker-revisions.json`, `Sub/formalization-profile.json`: Konfiguration der Prüfung, nur zur Information.
- `FY/schema/v0.4.schema.json`: Grundformat, auf das CONTRIBUTING.md Z. 425–433 aufsetzt. Liegt nicht in einem der beiden Palomar-Repos.

Schemata für `comparator.json` und `formalization.yaml` gibt es in Pol und Sub nicht als eigene Datei. `Pol/schemas/` enthält nur Schemata für Prüfberichte und Registerkorrekturen. Die Regeln für beide Dateien stehen im Fließtext von CONTRIBUTING.md (Abschnitte 2.3 und 3).

Nicht geladen:

- `https://submit.palomar-registry.org/llms.txt` (CONTRIBUTING.md Z. 50–53, 60): Adressen unter submit.palomar-registry.org sind nach Auftrag gesperrt. Nicht aufgerufen.
- Die Website palomar-registry.org und die Organisationsseite: nach Auftrag in dieser Umgebung gesperrt, nicht versucht.
- `PalomarRegistry/PalomarTemplate`: laut specification.md Z. 20 „Reusable submission starter“, ausdrücklich ohne bindende Wirkung. Nicht gelesen.

Lizenz der Quellen: Pol ist CC0 1.0 (`Pol/LICENSE`), Sub ist MIT (`Sub/LICENSE`), FY ist Apache-2.0. Diese Datei enthält nur kurze Zitate mit Quelle (Protokoll 11.3), keine Kopie fremder Dateien.

Zeilenangaben „C Z. n“ beziehen sich auf `Pol/CONTRIBUTING.md`, „Spec Z. n“ auf `Pol/docs/specification.md`, „SubR Z. n“ auf `Sub/README.md`, jeweils beim oben genannten Commit.

## 2. Lesart

- **Muss**: Die Quelle nennt die Regel als „Mechanical requirement“, „must“ oder als Grund für Ablehnung. Verstoß heißt `verification-failed` oder Ablehnung.
- **Soll**: Die Quelle empfiehlt („should“, „prefer“) oder die Regel wird nur redaktionell von der KI-Prüfung bewertet, ohne harten Ausschluss. Ein Verstoß kann trotzdem zu `revision_required` führen.
- **Hinweis**: Folge einer Regel für dieses Projekt oder ein Ablauf, den Justus kennen sollte.
- **Offene Frage**: Der Wortlaut lässt mehr als eine Lesart zu. Nicht ausgelegt, siehe Abschnitt 4.

## 3. Anforderungen

### A. Lean-Version und Mathlib

**P-1 (Muss) Lean-Version mindestens v4.35.0-rc2.**
Wortlaut: „The `lean-toolchain` file must name a Lean release, in the form `leanprover/lean4:<version>`, no older than the minimum recorded in `toolchains.json`“ (C Z. 200–202). `Sub/toolchains.json` enthält genau `{"schema_version": 2, "minimum": "v4.35.0-rc2"}` (letzte Änderung dieser Datei: Commit `0c76ead61b715ff5f746034854d0eb7350b579fb`, 2026-09-23). Zugelassen ist „any released or RC Lean toolchain at or above the minimum“, es gibt keine Liste (SubR Z. 354–357).
Bedeutung: `lean/lean-toolchain` muss auf eine Lean-Version ≥ 4.35.0-rc2 gehoben werden. Hinweis: Mathlib hat Tags `v4.35.0-rc2` bis `v4.37.0-rc1` (gesehen mit `git ls-remote --tags` am 26.11.2026). Welche Version gewählt wird, entscheidet die Portierung.

**P-2 (Muss) Toolchain gleich der Toolchain der Mathlib-Revision.**
Wortlaut: „If the project uses canonical Mathlib, the selected project toolchain must exactly match the `lean-toolchain` in the resolved, authenticated Mathlib revision, including the patch version and release-candidate suffix.“ (C Z. 214–220).
Bedeutung: `lean/lean-toolchain` und die Mathlib-Revision in `lean/lake-manifest.json` müssen zusammen geändert werden. Ein Tag-Name in `inputRev` zählt nicht, nur die aufgelöste Revision.

**P-3 (Muss) Ort der Toolchain-Datei.**
Wortlaut: „If the selected project has its own `lean-toolchain`, that file is used. Otherwise the repository-root `lean-toolchain` is used.“ (C Z. 808–810).
Bedeutung: Das Projekt liegt unter `lean/`, nicht an der Wurzel. Bei der Einreichung wird `lean` als „selected project“ angegeben (C Z. 803–806). `lean/lean-toolchain` gilt dann.

### B. Lake-Dateien und Abhängigkeiten

**P-4 (Muss) Genau eine Lakefile.**
Wortlaut: „The project root must contain exactly one of `lakefile.toml` and `lakefile.lean`. The Lakefile must be a regular file no larger than 1 MiB. A TOML Lakefile must be valid TOML.“ (C Z. 209–211).

**P-5 (Muss) Manifest im Repo.**
Wortlaut: „Commit `lake-manifest.json`. It is mandatory for a `lakefile.lean` project.“ (C Z. 212–213). Für ein TOML-Projekt ohne Manifest gibt es nur eine enge Ausnahme mit lokalen Pfadabhängigkeiten (C Z. 829–841). Das Projekt hat Git-Abhängigkeiten, also braucht es das Manifest (C Z. 838–840).
Hinweis: Palomar führt nie `lake update` aus (Spec Z. 404–405). Das Manifest muss also vollständig und aktuell sein.

**P-6 (Muss) Form der Git-Abhängigkeiten.**
Wortlaut: „Every Git package in `lake-manifest.json` must use a credential-free public `https://github.com/owner/repository` URL without a query or fragment, and must be pinned to a full 40-character lowercase commit SHA.“ (C Z. 328–331). Siehe Offene Frage OF-2 zur Endung `.git`.

**P-7 (Muss) Keine Git-Submodule im eingereichten Repo.**
Wortlaut: „The submitted repository and any separately named substantive formalisation must not contain Git submodules.“ (C Z. 332–335).

**P-8 (Muss) Kein Git LFS.**
Wortlaut: „Git LFS pointers are rejected in the submitted repository, every dependency, and any separately named substantive formalisation.“ (C Z. 336–339).

**P-9 (Muss) Keine übersetzten Dateien außerhalb von `.lake`.**
Wortlaut: „The verifier rejects files with compiled-artifact suffixes including `.olean`, `.ilean`, `.a`, `.bc`, `.dll`, `.dylib`, `.o`, `.obj`, `.so`, and `.trace`“ (C Z. 340–343).

**P-10 (Muss) Größe des Repos.**
Wortlaut: „The checked-out repository, excluding `.git` and symbolic links, must be no larger than 500 MiB.“ (C Z. 117–119).

**P-11 (Muss) Abhängigkeiten nur aus öffentlichen GitHub-Repos, archivierbar.**
Wortlaut: „Dependencies reached only from the Solution may come from any public GitHub repository that satisfies the requirements below.“ (C Z. 320–322). Bei der Registrierung legt Palomar von jedem gepinnten Git-Abhängigkeits-Repo eine öffentliche Gabel in `PalomarArchive` an (C Z. 1050–1054, Spec Z. 380–386).
Hinweis: Die Abhängigkeit `mm325_proof` (ohne Lizenz) entfällt nach Protokoll Abschnitt 3 auf dem Sammelzweig ohnehin. Bliebe sie, würde Palomar sie bei der Registrierung öffentlich gabeln.

**P-12 (Hinweis) Prüfumgebung ohne Netz, mit Zeitgrenze.**
Prüfung und Darstellung laufen „without credentials or network access inside Landrun, with ceilings on time, memory, processes, files, and output“ (Spec Z. 402–406). `Sub/verification-profile.json`: `job_timeout_minutes` 350, `execution_budget_seconds` 19800, Mathlib-Cache „when available“. Ressourcenmangel ist ein wiederholbarer Infrastrukturfehler, keine Ablehnung (Spec Z. 405–406).

### C. Lean-Quelldateien

**P-13 (Muss) Modulsystem in jeder Lean-Datei des Repos.**
Wortlaut: „Every regular `.lean` source file in the submitted repository must use Lean's module system and contain at most **10,000 physical lines**. This includes Challenge, Solution, unused source files, generated certificates, contained projects, and local path dependencies.“ (C Z. 166–173, ebenso Spec Z. 179–181, SubR Z. 427–433). Ausgenommen sind nur Dateien namens `lakefile.lean` (nur vom Modulkopf) und Dateien unter `.git` oder `.lake` (C Z. 174–177). „The verifier scans the complete checkout before builds“ (C Z. 192–194).
Bedeutung: jede `.lean`-Datei unter `lean/`, auch `lean/Axioms.lean`, `lean/AxiomsMM325.lean`, `lean/YangBounds.lean` und `lean/Zweitlauf/B016Aussage.lean`. Nach dem Wortlaut auch Lean-Dateien außerhalb von `lean/`, siehe OF-1.

**P-14 (Muss) Höchstens 10.000 Zeilen je Lean-Datei.** Wortlaut wie P-13; Zählweise: „Blank and comment lines count. LF and CRLF each delimit one line; an unterminated final line counts, and a final newline does not add an empty line.“ (C Z. 171–173). Aufteilen statt verstecken: „do not hide them in excluded paths“ (C Z. 188–189).

**P-15 (Muss) Keine Lean-Dateien als symbolische Verknüpfung.** Wortlaut: „submitted `.lean` symbolic links are rejected“ (C Z. 176–177).

**P-16 (Soll / Hinweis) Was Portierung auf Module verlangt.**
Wortlaut: „Porting requires more than adding `module`: make the declarations needed by other modules public, use `public import` where the public interface needs an import, and expose definitions whose bodies clients need.“ (C Z. 183–189). Danach neu bauen und Comparator erneut laufen lassen.

### D. Challenge (Aussagen-Datei) und Solution (Lösungs-Modul)

**P-17 (Muss) Zwei verschiedene Modulnamen.**
Wortlaut: „The Challenge and Solution modules must be distinct dotted Lean module names. Every component must match `[A-Za-z_][A-Za-z0-9_']*`.“ (C Z. 249–250). Die Namen `Challenge.lean`/`Solution.lean` sind nur Konvention (C Z. 147–149).

**P-18 (Muss) Quelldatei im Projekt, nicht in `.lake`.**
Wortlaut: „Palomar asks Lake for its ordered source paths and selects the first regular, non-symlink source file matching each module. Each selected file must lie inside the Lean project.“ (C Z. 251–253); „Submitted `.lake` directories are discarded“ (C Z. 244–245).

**P-19 (Muss) Größe der Challenge.**
Wortlaut: „The Challenge has a hard limit of 100 KiB and 1,000 lines. A Challenge over 32 KiB or 300 lines receives a mechanical warning“ (C Z. 254–256).
Soll: Eingebettete Anzeige im Register nur bei genau einer verglichenen Deklaration und höchstens 100 Zeilen und 32 KiB (C Z. 1079–1081). Sonst eigene Seite.

**P-20 (Muss) Abhängigkeiten der Challenge nur Lean-Kern und Mathlib (oder Tau Ceti, CSLib).**
Wortlaut: „Its **transitive import closure** means the Challenge source and every Lean source file reached by following its imports recursively. Every file in that closure must be one of: Lean core; Mathlib at a verified revision in its canonical repository, together with the exact dependencies pinned by Mathlib's manifest; Tau Ceti …; CSLib …“ und „No other project-specific source may occur in the Challenge's transitive import closure.“ (C Z. 302–318). Zugelassene Wurzeln: `Sub/allowed-challenge-repositories.json` (mathlib4 Vertrauen „high“, Tau Ceti und CSLib „qualified“ mit Warnung, C Z. 232–234).
Bedeutung: Die Challenge darf kein Modul aus `YangBounds` importieren, auch nicht `YangBounds.Basic`. Die Definitionen `BilinearAlgorithm` und `tensorRank` müssen in der Challenge selbst stehen, die Challenge importiert nur Mathlib.

**P-21 (Muss) Wurzelname der Challenge darf keine Abhängigkeit verdecken.**
Wortlaut: „The Challenge module's top-level directory (or file, for a single-component module name) must not share its name with a top-level entry of any dependency … Verification refuses such a layout with `challenge.module_root_shadowed`“ (SubR Z. 264–269).

**P-22 (Soll) Gestalt der Challenge.**
Wortlaut: „Prefer imports from Mathlib alone.“, „Prefer theorem statements to new definitions.“, „Give every definition needed by a compared theorem a precise docstring and its ordinary mathematical meaning.“, „State every principal claim attributed to the formalisation. Do not hide material hypotheses, weaken quantifiers, replace a standard notion with a convenient surrogate, or present a merely supporting lemma as the advertised theorem.“ (C Z. 230–241). Die KI-Prüfung bewertet „the fidelity and auditability of every material definition and imported concept“ (C Z. 914–915).
Bedeutung: `tensorRank` ist eine eigene Definition (über `BilinearAlgorithm` und `Nat.find`). Sie braucht einen genauen Docstring, der sagt, dass dies der Tensorrang von ⟨n,l,m⟩ über K ist.

**P-23 (Hinweis) Wie Comparator vergleicht.**
Wortlaut: „`Compare.loop` then walks the used-constant graph transitively and requires each ordinary declaration reached to be identical in both environments.“ (`Sub/docs/comparator-declaration-closure.md` Z. 15–17); „A named theorem is compared by statement, and its proof is not compared … a `sorry` on a declaration that is not named is still a mismatch.“ (ebd. Z. 35–42).
Bedeutung: Jede Definition, die die Aussage benutzt, muss in Challenge und Solution gleich sein (praktisch: die Solution importiert die Challenge). `tensorRank` benutzt im Rumpf den Satz `exists_bilinearAlgorithm` (`lean/YangBounds/Basic.lean` Z. 112–120). Siehe OF-3.

### E. `comparator.json`

**P-24 (Muss) Aufbau.**
Wortlaut: „`comparator.json` must be a regular JSON file containing one object and must be no larger than 1 MiB. It has four required keys“: `challenge_module`, `solution_module`, `theorem_names`, `permitted_axioms` (C Z. 272–282). „`theorem_names` must be a nonempty array. The optional `definition_names` array defaults to empty. Every entry in either array must be a nonempty string.“ „No other keys are accepted, apart from the optional `definition_names` and `enable_nanoda` keys.“ (C Z. 284–288). `enable_nanoda` wird ignoriert (C Z. 291–295).

**P-25 (Muss) Erlaubte Axiome.**
Wortlaut: „`permitted_axioms` may contain only `propext`, `Quot.sound`, and `Classical.choice`.“ (C Z. 289–290).

**P-26 (Muss) Kein `sorry`, keine eigenen Axiome, kein `ofReduceBool` in der Solution.**
Wortlaut: „Comparator must confirm that every proved Solution declaration does not depend on `sorryAx`, `Lean.ofReduceBool`, a custom axiom, or an unnamed missing definition.“ (C Z. 296–298). Jeder exportierte Beweis muss Lean-Kern und NanoDa bestehen (C Z. 773–774, Spec Z. 105–106). Absichtliche Lücken in der Challenge sind erlaubt (C Z. 296).
Bedeutung: `native_decide` ist ausgeschlossen (erzeugt `Lean.ofReduceBool`). `decide +kernel` (in `lean/YangBounds/Upper3x2x6.lean` Z. 153) erzeugt kein `ofReduceBool`; ob die Datei in der Kette des Endsatzes liegt, ist hier nicht geprüft.

**P-27 (Muss) Pfad der Konfiguration; eine Konfiguration je Eintrag.**
Wortlaut: „the required Comparator configuration path must point inside the selected project and must end in `.json`.“ (C Z. 820–821); Pfadregeln C Z. 823–827. „One submission and one Palomar entry correspond to exactly one Comparator configuration.“ (C Z. 121–127).
Bedeutung: `comparator.json` liegt unter `lean/`. Weitere Sätze (etwa „Rang gleich 26“) in derselben Konfiguration ergeben einen Eintrag, in getrennten Konfigurationen getrennte Einträge.

**P-28 (Soll) `definition_names` begründen.**
Wortlaut: „If you use this feature, explain the intended value and why the compared theorems constrain it. Editorial review may reject a definition that makes the result vacuous even when Comparator accepts it.“ (C Z. 264–268).

### F. `formalization.yaml`

**P-29 (Muss) Datei.**
Wortlaut: „The file must be UTF-8 YAML no larger than 256 KiB. It must contain one top-level mapping. Duplicate mapping keys and YAML merge keys are not accepted.“ (C Z. 448–450). Soll: „Current metadata should declare `version: v0.4`“ (C Z. 450–451). Der Dateiname muss genau `formalization.yaml` sein; ohne eigene Angabe liegt sie im gewählten Projekt (C Z. 805, 815–819).
Bedeutung: `lean/formalization.yaml`.

**P-30 (Muss) `project.name`**: „a nonempty string of at most 300 characters“ (C Z. 504–505). Öffentlicher Titel des Eintrags.

**P-31 (Muss) `project.description`**: „a nonempty string of at most 10,000 characters. This is the exact abstract shown in the Registry“ (C Z. 506–509). Soll: knapp, nennt Gegenstand und Hauptergebnisse (C Z. 655–660, 687–697).

**P-32 (Muss) `project.authors`**: „a nonempty list of nonempty name strings … Every listed author must satisfy the human-only rule“ (C Z. 510–513). Regel: „Palomar reserves `project.authors` and `project.responsible_maintainers` for humans; do not list an AI model, agent, system, session, or tool in either field.“ (C Z. 491–498). Ein Autor kann auch eine Abbildung mit `name`, optional `github` und `orcid` sein; eine ORCID darf nicht im `name` stehen und wird gegen das ORCID-Register geprüft (SubR Z. 295–306).
Bedeutung: füllt nur Justus.

**P-33 (Muss) `project.license`**: „the exact SPDX identifier detected from the root licence file“ (C Z. 514–515). Siehe P-43.

**P-34 (Muss) `classification.arxiv` und `classification.msc2020`.**
Wortlaut: „`classification.arxiv`: one to eight distinct codes from Palomar's checked-in arXiv taxonomy snapshot“; „`classification.msc2020`: up to eight distinct codes from Palomar's checked-in MSC2020 snapshot … a submission that records no MSC2020 code is accepted“ (C Z. 516–522). Die redaktionelle Prüfung ist „deliberately permissive“ und beanstandet nur „an unmistakably egregious mismatch“ (`Pol/taxonomies/classification-guide.md` Z. 88–94).
Hinweis: In den Listen vorhanden sind unter anderem `cs.CC`, `cs.SC`, `math.AG`, `math.RA` sowie `68Q17`, `68Q25`, `15A69`, `14N07`. Die Auswahl ist nicht Teil dieses Auftrags.

**P-35 (Muss) `automation.methods`**: „a nonempty list of mappings, each with a nonempty `method`“ (C Z. 523–524). Soll: Werte `manual`, `copilot`, `agent`, `autonomous` oder `other` (C Z. 470–476). „Record each material automated method and model role honestly.“ (C Z. 486–489). KI-Beiträge gehören hierher und in die Erzählung, nicht in Autorenfelder (C Z. 491–494).
Bedeutung: Hier stehen die KI-Systeme (Protokoll Abschnitt 3, Spur P, und Abschnitt 9).

**P-36 (Muss) `review.status`**: „a nonempty string“ (C Z. 525). Soll: beschreibt die Prüfung vor der Einreichung, nicht die von Palomar; Beispiele `unchecked`, `agent-reviewed`, `self-assessed`, `peer-reviewed`, `author-verified`; `review.reviewers` und `review.notes` bei eigenständiger Prüfung; „Do not imply a separate review merely because the authors checked their own work“ (C Z. 477–484).

**P-37 (Muss) `project.responsible_maintainers`**: „a nonempty list of nonempty name strings … Every listed maintainer must satisfy the human-only rule above“ (C Z. 551–557).
Bedeutung: füllt nur Justus.

**P-38 (Muss) `sources`.**
Wortlaut: „`sources`: a nonempty list in which every entry has a nonempty `title` and a `relationship` of exactly `formalizes`, `adapts`, `independently-proves`, `background`, or `other`“; `type`, falls angegeben, aus `paper`, `book`, `web discussion`, `folklore`, `original-proof`, `other`; `contributors` mit `name` und `role` (≤ 200 Zeichen) (C Z. 569–576).

**P-39 (Muss) Herkunft genau eindeutig.**
Wortlaut: „The source list must satisfy exactly one of these alternatives: 1. Original: at least one entry has `type: original-proof`; every such entry has `relationship: other`; and every source relationship is `background` or `other`. … 2. Source-based: no entry has `type: original-proof`, and at least one entry has relationship `formalizes`, `adapts`, or `independently-proves`.“ (C Z. 578–592). Ein neuer Beweis eines bekannten Ergebnisses ist `independently-proves`, nicht `original-proof` (C Z. 540–541).
Bedeutung: Siehe OF-4.

**P-40 (Muss) `repository` weglassen, wenn kein dünner Wrapper.**
Wortlaut: „`repository` is omitted when the submitted repository contains the substantive development“ (C Z. 558–568).

**P-41 (Muss, falls vorhanden) `related_formalizations`**: „Each entry in `related_formalizations` must have an `id`.“ (C Z. 644–647). Soll: `note` erklärt das Verhältnis (C Z. 634–636).

**P-42 (Soll, redaktionell geprüft) Erzählender Teil.**
Ort: Modul-Dokumentation der Challenge, Docstrings der verglichenen Deklarationen, README des gewählten Projekts (sonst der Wurzel) oder `formalization.yaml` (C Z. 651–656). Bei gewähltem Projekt `lean` ist das `lean/README.md`.
Inhalt: „a plain-language account of every compared theorem; every known mismatch with the cited source, extra assumption, permitted axiom, scope restriction, degenerate case, and other limitation; an explanation of the mathematical sources …; what is original, translated, adapted, proved, or still missing; the relation to previous formalisations; the authorship and production process, including AI involvement and human review; the repository licence.“ (C Z. 673–685). „Do not claim novelty without a credible literature search. If novelty has not been established, say that it is unknown.“ (C Z. 699–700). Ein Beweisbericht ist freiwillig; wenn vorhanden, muss er den tatsächlichen Lean-Beweis beschreiben (C Z. 716–720).

### G. Lizenz

**P-43 (Muss) Genau eine Lizenzdatei an der Repo-Wurzel, vollständiger Text, gleich `project.license`.**
Wortlaut: „The repository root must contain exactly one conventional licence file.“ Namen `LICENSE`, `LICENCE`, `COPYING`, `UNLICENSE`, `OFL`, optional mit `.md`, `.markdown`, `.txt`. „It must contain the complete licence text … Palomar's licence detector must find exactly one accepted licence, and its identifier must match `project.license` in `formalization.yaml` exactly.“ (C Z. 400–413). Die Lizenzdatei bleibt an der Wurzel, auch wenn das Projekt in einem Unterverzeichnis liegt (C Z. 810–811). Zugelassen ist unter anderem `Apache-2.0` (C Z. 374–376); nicht zugelassen sind NoDerivatives und eigene Bedingungen (C Z. 392–396). Die Lizenz muss Gabelung, Anzeige und KI-Prüfung erlauben (C Z. 353–363).

### H. Eignung und redaktionelle Prüfung

**P-44 (Muss) Forschungsinteresse.**
Wortlaut: „It could plausibly warrant a research paper or a serious research note.“ und „The reviewer can identify a credible research area and a plausible kind of mathematician in a research department who could reasonably find it interesting or relevant.“ „Both tests are required.“ (C Z. 65–77). „A clear failure of either research-interest test leads to `rejected`“ (C Z. 92–93). Notability unter 4 führt zur Ablehnung (C Z. 946–952, 995–997; `Pol/rubric.json`: `minimum_score` 4, `mandatory_reject_below_minimum` `notability`).

**P-45 (Muss) Ausschlussliste.**
Wortlaut: „Palomar does not index: trivial results presented as research contributions; theories whose definitions have been designed merely to manufacture the advertised conclusions; purported solutions of famous open problems without …; duplicated or lightly repackaged work without useful provenance; deceptive, materially incomplete, or promotional metadata; submissions whose mathematical content cannot be identified from the Challenge and the informal account.“ (C Z. 79–90).

**P-46 (Soll, mit Mindestwert) Prüfschritte der KI-Prüfung.**
Geprüft werden Klassifikation, Metadaten und Herkunft, Übereinstimmung jedes verglichenen Satzes mit seiner Beschreibung, Treue der Definitionen, Literatur und Forschungsinteresse; optional der Beweisbericht (C Z. 905–919; `Pol/rubric.json`). Jeder Pflichtschritt braucht mindestens 4 von 5 (C Z. 946–952). Ein Wert 4 „requires concrete positive evidence, not merely successful compilation, populated fields, familiar terminology“ (C Z. 947–949).

### I. Berechtigung und Ablauf (nur Justus)

**P-47 (Muss) Berechtigung des Einreichers.**
Wortlaut: „You must either: be a responsible author or maintainer of the substantive formalisation; or have approval from one.“ (C Z. 727–731). „Answering falsely is a material misrepresentation.“ (C Z. 741).

**P-48 (Muss) Nachweis des Schreibrechts.**
Wortlaut: „a browser sign-in, or, for an agent with no browser, a tag at the submitted commit together with a gist“ (C Z. 745–751; Spec Z. 48–61).
Hinweis: Der Weg über Tag und Gist ist der Weg für Agenten. In diesem Projekt reicht nur Justus ein (Protokoll Abschnitt 9, CLAUDE.md Regel 9). Kein Agent legt ein solches Tag oder einen solchen Gist an.

**P-49 (Muss) Angaben bei der Einreichung.**
Wortlaut: „Submit the repository as `owner/name` together with the full 40-character SHA of the commit to be reviewed, and explicitly select the repository-relative Comparator configuration path … Branch names and tags are not accepted as substitutes for a commit.“ (C Z. 114–119). Dazu das gewählte Projekt (`lean`) (C Z. 803–806).

**P-50 (Hinweis) Öffentlichkeit.**
„the repository, the commit, and the fact that they were mechanically checked are public from the moment of submission“ (C Z. 1034–1037). Eine Registrierung ist dauerhaft: „a registration is permanent publication history from the moment it merges“ (C Z. 1062–1067). Keine Rücknahme auf Wunsch (Spec Z. 356–358).
Bedeutung: Schon die Einreichung macht Repo und Commit öffentlich als geprüft sichtbar. Das betrifft Protokoll Abschnitt 9 (Veröffentlichung nur nach Freigabe durch Justus).

**P-51 (Soll) Spätere Fassungen.**
Wortlaut: „Automated registration requires the same source repository, selected project path, and Comparator configuration path as the current version.“ (C Z. 1096–1101).
Bedeutung: Pfade (`lean`, `lean/comparator.json`) vor der ersten Einreichung festlegen und danach nicht ändern.

### J. Was eine Einreichung unzulässig macht (Zusammenfassung)

Mechanisch (`verification-failed`, vor jeder KI-Prüfung): Lean-Version unter v4.35.0-rc2 oder abweichend von Mathlib (P-1, P-2); keine oder zwei Lakefiles, fehlendes Manifest (P-4, P-5); Git-Abhängigkeit nicht als öffentliche GitHub-URL mit vollem SHA (P-6); Submodule, LFS, übersetzte Dateien, über 500 MiB (P-7 bis P-10); eine `.lean`-Datei ohne Modulkopf, über 10.000 Zeilen oder als Verknüpfung (P-13 bis P-15); Challenge über 1.000 Zeilen oder 100 KiB, mit projekteigenem Import oder verdeckendem Wurzelnamen (P-19 bis P-21); `comparator.json` mit fremden Schlüsseln oder Axiomen außerhalb der drei erlaubten (P-24, P-25); Solution mit `sorryAx`, `Lean.ofReduceBool` oder eigenem Axiom (P-26); fehlende oder falsch geformte Pflichtfelder in `formalization.yaml`, Codes außerhalb der Listen, uneindeutige Herkunft (P-29 bis P-39); fehlende, doppelte, unvollständige oder abweichende Lizenzdatei (P-43).

Redaktionell (`rejected`): fehlendes Forschungsinteresse, Notability unter 4 (P-44); ein Fall der Ausschlussliste (P-45). Andere festgestellte Mängel führen zu `revision_required` (C Z. 928–931, 1009–1013). Es gibt keinen Einspruch (C Z. 1015–1017).

## 4. Offene Fragen

**OF-1 Gilt die Modulpflicht auch für Lean-Dateien außerhalb des gewählten Projekts?** C Z. 166 sagt „Every regular `.lean` source file in the submitted repository“, C Z. 192–193 „The verifier scans the complete checkout“. Zugleich wird bei einem Unterprojekt „everything but the licence … resolved inside it“ (SubR Z. 275–276). Im Repo liegt außerhalb von `lean/` die Datei `versuche/s2-19-abgleich/Check.lean` (66 Zeilen, ohne Modulkopf). Nach dem Wortlaut wäre sie betroffen. Spur P darf nach Protokoll nur Dateien unter `lean/` ändern.

**OF-2 Ist die Endung `.git` in der Mathlib-URL zulässig?** `lean/lake-manifest.json` nennt `https://github.com/leanprover-community/mathlib4.git`. C Z. 329–330 verlangt „a … `https://github.com/owner/repository` URL without a query or fragment“. Ob `.git` am Ende zulässig ist oder normalisiert wird, sagt der Text nicht.

**OF-3 Muss die Challenge den Beweis von `exists_bilinearAlgorithm` enthalten?** `tensorRank` verwendet im Rumpf `Nat.find (exists_bilinearAlgorithm K n l m)`. Nach `comparator-declaration-closure.md` Z. 15–17 muss jede erreichte gewöhnliche Deklaration in beiden Umgebungen gleich sein; nach Z. 35–42 werden in `theorem_names` genannte Sätze nur nach ihrer Aussage verglichen. Ob ein Satz, der nur im Rumpf einer Definition vorkommt, als Lücke in `theorem_names` genannt werden darf oder samt Beweis in der Challenge stehen muss, sagt der Text nicht ausdrücklich.

**OF-4 Ist das Ergebnis „original“ oder „source-based“?** P-39 verlangt genau eine der beiden Formen. Die Wahl hängt davon ab, ob die Schranke 26 anderswo vorher dargestellt wurde und wie sich der Beweis zu Yang (arXiv:2609.14393) und anderen Quellen verhält. Das ist eine Angabe zur Herkunft, die Justus macht (Protokoll Abschnitt 9: „Eine Formalisierung von Yangs Beweis ist Yangs Satz“).

**OF-5 Inhalt von `llms.txt`.** CONTRIBUTING.md Z. 50–53 nennt `https://submit.palomar-registry.org/llms.txt` als Pflichtlektüre für Agenten, die einreichen. Nach Auftrag nicht geladen. Da kein Agent einreicht, ist unbekannt, ob dort weitere Anforderungen an das Repo stehen.

**OF-6 `con-ron` nur bis v4.35.0 hinterlegt.** `Sub/checker-revisions.json` nennt `con-ron`-Prüfprogramme nur für `v4.35.0-rc2` bis `v4.35.0`. Nach Spec Z. 113–122 ist `con-ron` nur beratend, eine Absage blockiert nicht. Ob eine Toolchain über v4.35.0 dadurch Nachteile hat, sagt der Text nicht.

## 5. Prüfliste

Spalte „Stand im Projekt heute“: nur, was ich am 26.11.2026 auf dem Zweig `portierung` beim Commit `71240f81988ae10323af035c3273a45b5038ac3a` selbst gesehen habe. „nicht vorhanden“ heißt, die Datei gibt es dort nicht. „nicht gesehen“ heißt, ich habe es nicht geprüft. Die Spalte ist eine Beobachtung, kein Beleg im Sinne des Fertig-Kriteriums.

| Nr. | Art | Anforderung (kurz) | Fundstelle | Stand im Projekt heute | Beleg (später) |
| --- | --- | --- | --- | --- | --- |
| P-1 | Muss | `lean-toolchain` = `leanprover/lean4:<v>`, v ≥ v4.35.0-rc2 | C Z. 200–202; Sub `toolchains.json` | `lean/lean-toolchain` = `leanprover/lean4:v4.19.0`: nicht erfüllt | |
| P-2 | Muss | Toolchain gleich Toolchain der Mathlib-Revision | C Z. 214–220 | Mathlib `c44e0c8ee63ca166450922a373c7409c5d26b00b` (laut Kommentar in `lean/lakefile.toml` Tag v4.19.0); Übereinstimmung nicht gesehen | |
| P-3 | Muss | Toolchain-Datei im gewählten Projekt `lean` | C Z. 808–810 | `lean/lean-toolchain` vorhanden | |
| P-4 | Muss | genau eine Lakefile, ≤ 1 MiB, gültiges TOML | C Z. 209–211 | nur `lean/lakefile.toml` (613 B) | |
| P-5 | Muss | `lake-manifest.json` im Repo, vollständig | C Z. 212–213, 838–840; Spec Z. 404–405 | `lean/lake-manifest.json` vorhanden (10 Pakete) | |
| P-6 | Muss | Git-Abhängigkeiten: öffentliche GitHub-URL, voller SHA | C Z. 328–331 | alle 10 Pakete auf github.com mit 40-stelligem SHA; Mathlib-URL endet auf `.git` (OF-2) | |
| P-7 | Muss | keine Submodule | C Z. 332–335 | keine `.gitmodules` | |
| P-8 | Muss | kein Git LFS (auch Abhängigkeiten) | C Z. 336–339 | keine `.gitattributes`; Abhängigkeiten nicht gesehen | |
| P-9 | Muss | keine übersetzten Dateien außerhalb `.lake` | C Z. 340–343 | keine gefunden | |
| P-10 | Muss | Repo ≤ 500 MiB ohne `.git` | C Z. 117–119 | etwa 11 MB | |
| P-11 | Muss | Abhängigkeiten öffentlich auf GitHub, archivierbar | C Z. 320–322, 1050–1054 | `mm325_proof` noch im Manifest (soll nach Protokoll entfallen) | |
| P-12 | Hinweis | Bau ohne Netz innerhalb der Zeitgrenze | Spec Z. 402–406; Sub `verification-profile.json` | nicht gesehen | |
| P-13 | Muss | Modulsystem in jeder `.lean`-Datei | C Z. 166–177; Spec Z. 179–181 | 0 von 32 Dateien unter `lean/` haben einen `module`-Kopf; dazu `versuche/s2-19-abgleich/Check.lean` (OF-1): nicht erfüllt | |
| P-14 | Muss | ≤ 10.000 Zeilen je `.lean`-Datei | C Z. 166–173 | größte Datei `lean/YangBounds/YangN4Haupt.lean` mit 1.407 Zeilen | |
| P-15 | Muss | keine `.lean`-Verknüpfungen | C Z. 176–177 | keine symbolischen Verknüpfungen gefunden | |
| P-16 | Soll | `public`, `public import`, freigelegte Definitionen | C Z. 183–189 | nicht vorhanden (keine Module) | |
| P-17 | Muss | Challenge und Solution verschiedene Modulnamen, Namensregel | C Z. 249–250 | nicht vorhanden | |
| P-18 | Muss | Quelldateien im Projekt, nicht in `.lake` | C Z. 243–253 | nicht vorhanden | |
| P-19 | Muss | Challenge ≤ 1.000 Zeilen, ≤ 100 KiB (Warnung ab 300/32 KiB) | C Z. 254–256 | nicht vorhanden | |
| P-20 | Muss | Challenge importiert nur Lean-Kern und Mathlib | C Z. 302–318 | keine Challenge. `tensorRank` liegt in `lean/YangBounds/Basic.lean` (148 Zeilen, importiert nur Mathlib); `lean/Zweitlauf/B016Aussage.lean` importiert Projektmodule und wäre so keine zulässige Challenge | |
| P-21 | Muss | Wurzelname der Challenge verdeckt keine Abhängigkeit | SubR Z. 264–269 | nicht vorhanden | |
| P-22 | Soll | Mathlib-Importe, Docstrings, keine versteckten Annahmen | C Z. 230–241 | nicht vorhanden | |
| P-23 | Hinweis | erreichte Deklarationen in beiden Umgebungen gleich | `comparator-declaration-closure.md` Z. 15–17, 35–42 | betrifft `exists_bilinearAlgorithm` (OF-3) | |
| P-24 | Muss | `comparator.json`: Objekt, vier Pflichtschlüssel, keine anderen | C Z. 272–295 | nicht vorhanden | |
| P-25 | Muss | Axiome nur `propext`, `Quot.sound`, `Classical.choice` | C Z. 289–290 | Axiom-Bericht des Endsatzes nicht gesehen | |
| P-26 | Muss | kein `sorryAx`, kein `Lean.ofReduceBool`, kein eigenes Axiom | C Z. 296–298 | `native_decide` nur in Kommentaren gefunden; kein `axiom` gefunden; Build-Log nicht gesehen | |
| P-27 | Muss | Konfiguration im gewählten Projekt, endet auf `.json`; eine je Eintrag | C Z. 121–127, 820–827 | nicht vorhanden | |
| P-28 | Soll | `definition_names` begründen | C Z. 264–268 | nicht vorhanden | |
| P-29 | Muss | `formalization.yaml`: UTF-8, ≤ 256 KiB, eine Abbildung, `version: v0.4` (Soll) | C Z. 448–451 | nicht vorhanden | |
| P-30 | Muss | `project.name` (≤ 300 Zeichen) | C Z. 504–505 | nicht vorhanden | |
| P-31 | Muss | `project.description` (≤ 10.000 Zeichen) | C Z. 506–509 | nicht vorhanden | |
| P-32 | Muss | `project.authors`, nur Menschen (füllt Justus) | C Z. 491–498, 510–513; SubR Z. 295–306 | nicht vorhanden | |
| P-33 | Muss | `project.license` = erkannte SPDX-Kennung | C Z. 514–515 | nicht vorhanden | |
| P-34 | Muss | `classification.arxiv` 1–8, `msc2020` 0–8 aus den Listen | C Z. 516–522 | nicht vorhanden | |
| P-35 | Muss | `automation.methods` nicht leer, je `method`; KI ehrlich angeben | C Z. 470–494, 523–524 | nicht vorhanden | |
| P-36 | Muss | `review.status` nicht leer, Prüfung vor Einreichung | C Z. 477–484, 525 | nicht vorhanden | |
| P-37 | Muss | `project.responsible_maintainers`, nur Menschen (füllt Justus) | C Z. 551–557 | nicht vorhanden | |
| P-38 | Muss | `sources`: `title`, `relationship` aus fester Liste | C Z. 569–576 | nicht vorhanden | |
| P-39 | Muss | Herkunft genau „original“ oder „source-based“ | C Z. 578–592 | nicht vorhanden (OF-4) | |
| P-40 | Muss | `repository` weglassen | C Z. 558–568 | nicht vorhanden | |
| P-41 | Muss | `related_formalizations[].id`, falls vorhanden | C Z. 644–647 | nicht vorhanden | |
| P-42 | Soll | erzählender Teil mit allen genannten Punkten | C Z. 651–720 | `lean/README.md` vorhanden (englisch), Inhalt gegen die Liste nicht gesehen | |
| P-43 | Muss | genau eine vollständige Lizenzdatei an der Wurzel, gleich `project.license` | C Z. 353–413, 810–811 | `LICENSE` an der Wurzel, Apache License 2.0, 201 Zeilen; Erkennung durch Licensee nicht gesehen | |
| P-44 | Muss | Forschungsinteresse (beide Tests), Notability ≥ 4 | C Z. 65–93, 946–952 | redaktionell, nicht vorab prüfbar | |
| P-45 | Muss | kein Fall der Ausschlussliste | C Z. 79–90 | redaktionell, nicht vorab prüfbar | |
| P-46 | Soll | jeder Prüfschritt ≥ 4 | C Z. 905–952; `Pol/rubric.json` | redaktionell, nicht vorab prüfbar | |
| P-47 | Muss | Einreicher berechtigt (nur Justus) | C Z. 727–743 | Sache von Justus | |
| P-48 | Muss | Schreibrecht per Anmeldung (Justus) | C Z. 745–751; Spec Z. 48–61 | Sache von Justus; kein Agent legt Tag oder Gist an | |
| P-49 | Muss | `owner/name`, voller Commit-SHA, Pfad der Konfiguration, Projekt `lean` | C Z. 114–119, 803–806 | Sache von Justus | |
| P-50 | Hinweis | Einreichung macht Repo und Commit öffentlich; Registrierung dauerhaft | C Z. 1034–1037, 1062–1067 | – | |
| P-51 | Soll | Pfade für spätere Fassungen gleich halten | C Z. 1096–1101 | nicht vorhanden | |
