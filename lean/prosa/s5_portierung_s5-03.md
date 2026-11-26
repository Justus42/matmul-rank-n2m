# S5-03: Portierung der Lean-Bibliothek auf die Palomar-Version (Bericht)

Auftrag S5-03, Stufe 5, Runde 1, Spur P (Portierungsauftrag). Zweig
`claude/project-thread-8489do`, abgezweigt von `portierung` (zuerst 71240f8, dann auf 9539e90
mit `palomar/ANFORDERUNGEN.md` neu aufgesetzt). Ziel des Pull Requests ist `portierung`, nicht
`main`.

## 1. Kurzfassung

- Gewählt: **Lean v4.36.0** mit **Mathlib-Tag v4.36.0 = `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`**.
- Lean 4.36.0 ist lokal installiert (über GitHub-Releases). Der **Mathlib-Cache ist nicht
  ladbar**: Die einzige von dieser Mathlib-Version angefragte Cache-Domain `cache.mathlib.org`
  ist gesperrt (Proxy 403). Auf Weisung des Orchestrators habe ich Mathlib **nicht** aus den
  Quellen gebaut und nicht auf Actions ausgewichen.
- Folge: **Kein Modul der Kette ist lokal gebaut.** Alle Änderungen an Lean-Dateien sind
  ungebaut. Kein Modul gilt im Sinn des Auftrags als portiert.
- Erledigt ohne Bau: Toolchain, Lakefile, Manifest umgestellt; Brücke (`BrueckeMM325.lean`,
  `AxiomsMM325.lean`) und Abhängigkeit `mm325_proof` entfernt, samt Workflow `lean-build.yml`
  und den Einträgen in `zweitlauf.yml`; Modulkopf in jeder Lean-Datei (mechanisch, ungeprüft);
  sieben in Mathlib entfernte Namen in Beweiskörpern ersetzt; Workflows laufen auch für Push
  auf `portierung`.
- Keine Aussage und keine Definition der Kette ist im Wortlaut geändert.

## 2. Gewählte Versionen mit Fundstelle

| Gegenstand | Wert | Fundstelle |
|---|---|---|
| Palomar-Mindestversion | `"minimum": "v4.35.0-rc2"` | `toolchains.json` in PalomarRegistry/PalomarSubmission, Commit `046554302064b2c83c2b924bea6db87fc5900c68` (26.11.2026), gelesen per `git clone` |
| Regel Toolchain = Mathlib-Toolchain | „the selected project toolchain must exactly match the `lean-toolchain` in the resolved, authenticated Mathlib revision, including the patch version and release-candidate suffix“ | `CONTRIBUTING.md` in PalomarRegistry/PalomarPolicy, Commit `5bd35cddcfc940532bb5f55e399d68b49b0986a5`, Abschnitt 2.1 (P-2 in `palomar/ANFORDERUNGEN.md`) |
| Lean | `leanprover/lean4:v4.36.0` (Lean 4.36.0, Commit `611c117bfaf7`, Release) | `lean --version` lokal |
| Mathlib | Tag `v4.36.0` = `fc4f59e577feb1a4956671bc04ac18aaaf8cd842`; dessen `lean-toolchain` lautet `leanprover/lean4:v4.36.0` | `git ls-remote --tags https://github.com/leanprover-community/mathlib4`; `raw.githubusercontent.com/.../fc4f59e…/lean-toolchain` |

Begründung der Wahl: v4.36.0 ist ≥ v4.35.0-rc2 (P-1), die neueste stabile Version mit
Mathlib-Tag (vorhanden waren am 26.11.2026 u. a. `v4.35.0-rc2`, `v4.35.0`, `v4.36.0-rc1/rc2`,
`v4.36.0`, `v4.37.0-rc1`), und kein Release-Kandidat. Die Toolchain des Projekts und die der
Mathlib-Revision sind gleich (P-2). Der Orchestrator hat die Wahl bestätigt.

Transitive Pakete laut neuem `lean/lake-manifest.json` (aus Mathlibs Manifest übernommen,
alle `https://github.com/...` mit 40-stelligem SHA, P-6): plausible `054b228c…`,
LeanSearchClient `4fb58e74…`, importGraph `8370c640…`, proofwidgets `2f0f3520…`, aesop
`66ff77cf…`, Qq `ff055a2f…`, batteries `b4b25a38…`, Cli `50810f72…`.

Zur offenen Frage OF-2 (`.git` am Ende der Mathlib-URL): strengere Lesart genommen, die URL
lautet jetzt `https://github.com/leanprover-community/mathlib4` ohne `.git` (Lakefile und
Manifest).

## 3. Werkzeugprobe und Host-Liste

Lokale Umgebung: Cloud-Sitzung, 4 Kerne, 15 GiB. Alle Zugriffe über den Proxy der Umgebung;
keine Sperre umgangen.

| Host | Zweck | Ergebnis |
|---|---|---|
| `raw.githubusercontent.com` | elan-Installer, `toolchains.json`, Mathlib-`lean-toolchain` | erreichbar |
| `github.com` (git über HTTPS) | Klonen von PalomarSubmission, PalomarPolicy, mathlib4 und allen Abhängigkeiten, `git ls-remote` | erreichbar |
| `github.com/leanprover/lean4/releases/download/...` (Weiterleitung auf `release-assets.githubusercontent.com`) | Lean-Archiv `lean-4.36.0-linux.tar.zst` | erreichbar |
| `release.lean-lang.org` | Toolchain-Download durch `elan toolchain install` | **gesperrt**: `CONNECT tunnel failed, response 403` (elan: „Could not connect to server (CONNECT tunnel failed, response 403)“) |
| `github.com/leanprover/elan/releases/latest` | Selbst-Update-Prüfung von elan | 403 (nur Warnung, nicht gebraucht) |
| `api.github.com` für fremde Repos | — | 403 „GitHub access to this repository is not enabled for this session“ (nicht gebraucht, `git ls-remote` reicht) |
| **`cache.mathlib.org`** | **Mathlib-Cache**: `lake exe cache get` lädt `https://cache.mathlib.org/mathlib4-master/f/<hash>.ltar` (9117 Dateien) | **gesperrt**: jede Datei „Transfer failed … (curl exit code: 56): CONNECT tunnel failed, response 403“ |
| `lakecache.blob.core.windows.net`, `mathlib4.lean-cache.cloud`, `reservoir.lean-lang.org`, `lean-lang.org` | — | gesperrt (CONNECT 403), werden von Mathlib v4.36.0 aber **nicht** angefragt; Quelltext `Cache/*.lean` nennt als einzige echte Cache-Adresse `https://cache.mathlib.org` |

**Wirklich gebrauchte, fehlende Domain: `cache.mathlib.org`.** `release.lean-lang.org` ist
nur für den bequemen elan-Weg nötig; der Umweg über GitHub-Releases funktioniert
(`elan toolchain link leanprover/lean4:v4.36.0 <Verzeichnis>`).

Wiederholte Proben von `cache.mathlib.org` um 15:01, 15:03 und 15:17 UTC: weiter gesperrt. Auf Weisung des Orchestrators schließt der Auftrag ohne lokalen Bau; der Bau ist ein eigener Auftrag der nächsten Runde.

## 4. Stand je Modul der Kette

Kette des Endsatzes `YangBounds.Transponiert444.rank_four_two_four_ge_26`, 26 Module, in
Importreihenfolge. „Nicht gebaut“ heißt: kein Bauversuch möglich, weil die Mathlib-Oleans
fehlen (kein Cache, Bau aus Quellen untersagt). Eine erste Fehlermeldung gibt es deshalb
nicht.

| Nr. | Modul | Stand | Änderungen in S5-03 |
|---|---|---|---|
| 1 | YangBounds.Basic | nicht gebaut | Modulkopf; Doc-Kommentar zur entfernten Brücke |
| 2 | YangBounds.CeilBound | nicht gebaut | Modulkopf |
| 3 | YangBounds.YangN3Teil1 | nicht gebaut | Modulkopf; `Matrix.stdBasisMatrix` → `Matrix.single`, `Matrix.matrix_eq_sum_stdBasisMatrix` → `Matrix.matrix_eq_sum_single` (Beweis von `extendForm_map`) |
| 4 | YangBounds.YangN3Teil2 | nicht gebaut | Modulkopf |
| 5 | YangBounds.YangN3Teil3 | nicht gebaut | Modulkopf |
| 6 | YangBounds.YangN3 | nicht gebaut | Modulkopf |
| 7 | YangBounds.Upper3x2x6 | nicht gebaut | Modulkopf |
| 8 | YangBounds.YangN4Lemma13 | nicht gebaut | Modulkopf |
| 9 | YangBounds.YangN4Haupt | nicht gebaut | Modulkopf; `Finset.exists_mem_not_mem_of_card_lt_card` → `Finset.exists_mem_notMem_of_card_lt_card`, `Finset.card_insert_of_not_mem` → `Finset.card_insert_of_notMem` |
| 10 | YangBounds.Statements | nicht gebaut | Modulkopf |
| 11 | YangBounds.Lemma13Prime | nicht gebaut | Modulkopf |
| 12 | YangBounds.SatzA444 | nicht gebaut | Modulkopf |
| 13 | YangBounds.SatzB444Poly | nicht gebaut | Modulkopf; `Finsupp.not_mem_support_iff` → `Finsupp.notMem_support_iff` |
| 14 | YangBounds.SatzB444 | nicht gebaut | Modulkopf |
| 15 | YangBounds.SatzB444Final | nicht gebaut | Modulkopf |
| 16 | YangBounds.SatzE444 | nicht gebaut | Modulkopf |
| 17 | YangBounds.SatzE444Buendel | nicht gebaut | Modulkopf |
| 18 | YangBounds.LemmaP444 | nicht gebaut | Modulkopf; `linearIndependent_iff_not_mem_span` → `linearIndependent_iff_notMem_span` |
| 19 | YangBounds.SatzC444Kern | nicht gebaut | Modulkopf |
| 20 | YangBounds.SatzC444Generisch | nicht gebaut | Modulkopf |
| 21 | YangBounds.Endsatz444 | nicht gebaut | Modulkopf |
| 22 | YangBounds.Bruecke444 | nicht gebaut | Modulkopf |
| 23 | YangBounds.SatzF444 | nicht gebaut | Modulkopf; `eval_finset_sum` → `eval_finsetSum`, `finset_sum_coeff` → `finsetSum_coeff`, `coeff_mul_of_natDegree_le` → `coeff_mul_add_eq_of_natDegree_le` (Beweis von `coeff_homComp`) |
| 24 | YangBounds.LemmaK444 | nicht gebaut | Modulkopf |
| 25 | YangBounds.LemmaZ444 | nicht gebaut | Modulkopf |
| 26 | YangBounds.Transponiert444 | nicht gebaut | Modulkopf |

Außerhalb der Kette: `YangBounds/S4BedingterAusschluss.lean`, `YangBounds.lean`,
`Axioms.lean`, `Zweitlauf/B016Aussage.lean` haben ebenfalls den Modulkopf bekommen (P-13
verlangt ihn für jede `.lean`-Datei), sonst unverändert; nicht gebaut.

### 4.1 Wie die Namensänderungen gefunden wurden

Abgleich ohne Bau: alle Bezeichner der Quelldateien gegen die Deklarationen in den Quellen von
Mathlib `fc4f59e`, Batteries, Aesop, Qq und Lean-Kern 4.36.0 (Textsuche, mit Berücksichtigung
von `@[to_additive]`-Paaren). Die sieben Namen oben kommen in der neuen Mathlib gar nicht mehr
vor (auch nicht als `deprecated`-Alias); ihre Nachfolger habe ich in den Quellen nachgesehen,
z. B. `Polynomial.coeff_mul_add_eq_of_natDegree_le` in
`Mathlib/Algebra/Polynomial/Degree/Operations.lean` Z. 445 mit derselben Aussage. Der Abgleich
ist grob: Er findet keine geänderten Signaturen, kein geändertes `simp`-Verhalten und keine
Namen, die nur in einem anderen Namensraum noch existieren. Alle Importe der Kette gibt es in
der neuen Mathlib noch als Datei.

### 4.2 Modulsystem (P-13, P-16)

Mechanisch eingeführt, nach dem Muster der Mathlib-Dateien selbst (z. B.
`Mathlib/Data/Matrix/Mul.lean` in `fc4f59e`): `module` als erste Zeile, jedes `import` als
`public import`, direkt nach den Importen `@[expose] public section`. Damit sind alle
Deklarationen öffentlich und alle Definitionsrümpfe sichtbar, wie vorher. Die vier
`private theorem` in `LemmaK444.lean` bleiben privat. **Offen:** ob alle Dateien so bauen
(z. B. `private`-Hilfssätze, `decide`/`rfl` über Modulgrenzen, `#print axioms` in
`Axioms.lean`). Das zeigt erst der Bau. Falls das Muster scheitert, ist es für einzelne
Dateien zurückzunehmen und als offen zu vermerken.

## 5. Geänderte Aussagen und Definitionen

**Keine.** Alle Änderungen an `YangBounds/*.lean` stehen in Beweiskörpern (Ersetzung von
Lemma-Namen), in Kopfzeilen (Modulsystem) oder in Kommentaren. Der Wortlaut jeder Aussage und
Definition der Kette ist unverändert. Prüfbar mit
`git diff 9539e90 -- lean/YangBounds`.

## 6. Entfernte Dateien und Einträge

- `lean/YangBounds/BrueckeMM325.lean`, `lean/AxiomsMM325.lean`: gelöscht (bleiben über das Tag
  `lean-4.19` erreichbar).
- `lean/lakefile.toml`: `[[require]] mm325_lower_bound` entfernt; Mathlib auf `fc4f59e`.
- `lean/lake-manifest.json`: Eintrag `mm325_lower_bound` entfernt, Manifest neu erzeugt
  (`lake update`, Version 1.3.0), Mathlib-URL ohne `.git`.
- `.github/workflows/lean-build.yml`: gelöscht (baute nur das fremde Repo `mm325_proof`).
- `.github/workflows/zweitlauf.yml`: Prüfung der mm325-Module entfernt; statt des Repos
  `leanprover/lean4checker` (letztes Tag `v4.29.0-rc8`, kein Tag für v4.36.0) wird der in der
  Toolchain mitgelieferte `leanchecker` benutzt (gleiche Aufrufform, lokal an einem
  Testmodul mit und ohne `--fresh` ausprobiert, Exit 0); Prüfziel bei Pull Requests und Push
  ist jetzt der geprüfte Stand selbst statt `main`, bei `workflow_dispatch` weiter die Eingabe
  (Vorgabe `main`).
- `lean-project.yml`, `zweitlauf-b016.yml`: Push-Auslöser zusätzlich für `portierung`.
  Pull-Request-Auslöser hatten schon keinen Zweigfilter, laufen also auch gegen `portierung`.
- `lean/README.md`: Versionszeile und Abschnitt zur früheren Abhängigkeit nachgeführt.

`main` ist von diesem Pull Request nicht berührt.

## 7. Lauf- und Jobnummern

Lokal kein Bau. Die drei Workflows liefen automatisch auf dem Pull Request #147, Kopf-Commit
`d28375fdd47c4d0fa2812e1eb78e4d595f0345cc` (Start 15:04:18 UTC). Sie wurden nur gelesen, nicht
als Ersatz für den lokalen Bau benutzt; es gab keine Nachbesserung über Actions.

| Workflow | Lauf | Job | Ergebnis |
|---|---|---|---|
| Lean build (own project lean/), `lean-project.yml` | 45845334184 | 139997391796 | failure: `lake build` scheitert |
| Second run B-016, `zweitlauf-b016.yml` | 45845334273 | 139997392125 | failure |
| Second run (fresh build + leanchecker), `zweitlauf.yml` | 45845334066 | 139997391393 | failure |

Der Mathlib-Cache war in Actions ladbar. Aus dem Log von Job 139997391796: `lake build`
meldet „Some required targets logged failures: YangBounds.Basic, YangBounds.SatzB444Poly,
YangBounds.YangN4Lemma13“. Erste dort sichtbare Fehlermeldungen:

- `YangBounds/YangN4Lemma13.lean:128:16: Unknown constant LinearMap.coeFn_sum` (auch Z. 191, 268)
- `YangBounds/SatzB444Poly.lean:165:43: Function expected at coeff` (der Bezeichner `coeff`
  ist unbekannt, Folgefehler Z. 167, 171, 189, 241, 255)
- `YangBounds.Basic`: Fehler im gekürzten Log nicht sichtbar (nur die letzten Zeilen gelesen)
- Warnungen: `push_neg` ist veraltet („Prefer using `push Not`“), ungenutzte `simp`-Argumente

Alle anderen Module hängen von `Basic` ab und wurden deshalb nicht gebaut. Die beiden
Zweitlauf-Jobs scheitern aus demselben Grund (sie bauen dieselbe Bibliothek); ihre Logs habe
ich nicht im Einzelnen gelesen. Damit gilt in der Tabelle in Abschnitt 4: `Basic`,
`SatzB444Poly`, `YangN4Lemma13` bauen nicht (erste Fehlermeldung wie oben, aus Actions, nicht
lokal), alle übrigen sind nicht gebaut. `CeilBound` (nur Mathlib-Importe) taucht nicht in der
Fehlerliste auf; ob es gebaut wurde, lässt der gelesene Ausschnitt nicht erkennen.

### 7.1 Was genau ungeprüft ist

- jede Änderung an Lean-Dateien: Modulköpfe, die sieben Namensersetzungen;
- ob das Muster `@[expose] public section` für alle Dateien trägt;
- `leanchecker` in `zweitlauf.yml` (lokal nur an einem Testmodul ausprobiert);
- die Axiom-Berichte (nicht gelaufen, weil der Bau scheitert);
- ob die Mathlib-URL ohne `.git` von Palomar so verlangt ist (OF-2, strengere Lesart).

## 8. Offen, und in welcher Reihenfolge es weitergehen sollte

1. `cache.mathlib.org` freigeben lassen (beantragt beim Repository-Eigentümer über den
   Orchestrator). Dann `lake exe cache get` im Verzeichnis `lean/`. Erste bekannte Baustellen:
   `Basic`, `YangN4Lemma13` (`LinearMap.coeFn_sum`), `SatzB444Poly` (`coeff`).
2. Module in der Reihenfolge der Tabelle in Abschnitt 4 einzeln bauen
   (`lake build YangBounds.Basic`, dann weiter), Fehler je Modul beheben. Erwartet: weitere
   umbenannte Lemmata, geändertes `simp`-/`field_simp`-Verhalten, Modulsystem-Fragen.
3. Wenn alle 26 Module bauen: `lake build`, `Axioms.lean`, `Zweitlauf/B016Aussage.lean`,
   Axiom-Bericht für den Endsatz; Liste der Hauptsätze in `.github/scripts/lean_report.py`
   prüfen (Namen der Brücke dort nicht vorhanden).
4. Danach die Palomar-Dateien (Aussagen-Datei, Lösungs-Modul, `comparator.json`,
   `formalization.yaml`) in einem eigenen Auftrag.

## 9. Pull Request, Commits, Verbrauch

Commits (UTC, aus Git):

- `c364523` 2026-11-26T15:01:35Z: Toolchain, Manifest, Modulköpfe und Workflows
- `1a279fb` 2026-11-26T15:02:48Z: umbenannte Mathlib-Namen in Beweiskörpern
- `d28375f` 2026-11-26T15:03:56Z: Bericht
- Nachtrag Lauf- und Jobnummern: siehe Git

Verbrauch: keine Subagenten, keine Fremdmodell-Anfrage, kein Rechenblock über 30 Minuten
(größter Block: `lake update` mit Klonen der Pakete, wenige Minuten, abgebrochen im
Cache-Schritt).

Projektgedächtnis: In diese Sitzung waren der Index und Einträge zu Lean-Bau, CI und
Git-Regeln eingeblendet; nichts davon enthält Prüfurteile. Ich habe nichts ins Gedächtnis
geschrieben.
