# B-016: Zweitlauf (Stufe 2, Runde 12)

Auftrag von Justus vom 25.11.2026, 22:37 Uhr MEZ (Wortlaut in LOG.md): ein zweiter, unabhängiger Maschinenlauf, bevor der Endsatz als Ergebnis freigegeben wird. Prüfer und Fremdmodell der Runde 11 hatten sich auf denselben Actions-Lauf gestützt (Lauf 86, Job 139504538345).

- Geprüfte Aussage: `YangBounds.Transponiert444.rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4`.
- Die Quelltexte unter `lean/YangBounds/` sind unverändert seit 7597484 und auch bis 9348a8b, von der Schreibhand mit `git diff` nachgesehen.
- Die Threads S2-55 bis S2-57 haben nach Angabe des Orchestrators am Beweis nicht mitgeschrieben. Alle drei waren frische Sitzungen.
- Die Schreibhand hat die Angaben gegen die GitHub-Schnittstelle nachgesehen: Merges, Läufe, Jobs und die Job-Logs von 139530090202 und 139535849738. Was sie nicht sehen konnte, ist als solches gekennzeichnet.
- Dieser Vermerk setzt keinen Status. B-016 bleibt geprüft. Eine Freigabe als Ergebnis gibt es nicht.

## Gemeinsamer Stand

| | Wert |
|---|---|
| Toolchain | `leanprover/lean4:v4.19.0`, Lean 4.19.0, Commit 6caaee842e94; Lake 5.0.0-6caaee8 |
| mathlib | c44e0c8ee63ca166450922a373c7409c5d26b00b |
| mm325_lower_bound | 759cf4a8524d4212e7832046204c90b9361ba2bb (fallnlove/mm325_proof) |

## 1. Neubau und Kernel-Nachprüfung (S2-55, Punkte 1 und 2)

- PR #88, Merge 9348a8b. Neue Datei `.github/workflows/zweitlauf.yml`, sonst nichts geändert.
- Lauf 45706606136, Job 139530090202, 21:41:18 bis 21:59:41 UTC, Ergebnis `success`.
  - Der Lauf ist ein `pull_request`-Lauf auf dem Zweig des Auftrags (Kopf d20aa11).
  - Ausgecheckt und gebaut wurde `main` bei 667df45edbfdfb72eb9e1e88a492d36e6553d09c. So steht es im Log mit Commit-Datum und Betreff von S2-59.
- Frische Umgebung, laut Log:
  - „olean/ilean/trace files in fresh checkout: 0“;
  - kein `actions/cache`;
  - nur der offizielle mathlib-Cache (`lake exe cache get`).
- Bau: „Build completed successfully.“, „lines with 'sorry': 0“, „lines with 'error': 0“. Es gab Linter-Warnungen, darunter mehrere in `mm325_lower_bound`. Die Zahl 15 gibt der Orchestrator an, ich habe sie nicht nachgezählt.
- lean4checker, Tag v4.19.0, Commit e11f65c651edd58d68ba260015d2bfde5102cd7f:
  - `L4C-SUMMARY|checked=27|ok=27|failed=0`, das sind 26 Module `YangBounds.*` und `MatrixMultiplicationLowerBound25`;
  - `L4C-FRESH|YangBounds.Transponiert444|exit=0` (`--fresh` mit allen Importen).
- Axiome: `'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]`.
- Nach dem Merge ist kein Lauf von `zweitlauf.yml` auf `main` gelaufen. Der Workflow ist nur für Pull Requests und den Handstart eingerichtet, so zeigt es die Laufliste.

## 2. Aussage in frischer Datei (S2-56, Punkt 3)

- PR #86, Merge ad1084640af775eebd7ec6e4a173e09e7a6997b9. Dateien:
  - `lean/Zweitlauf/B016Aussage.lean`;
  - `.github/workflows/zweitlauf-b016.yml`.
- Die Datei liegt außerhalb des Globs `YangBounds.+` und gehört nicht zur Bibliothek.
- Inhalt:
  - Sie importiert nur `YangBounds.Basic` und `YangBounds.Transponiert444`, ohne Notation und ohne `open`.
  - `example (K : Type) [Field K] : 26 ≤ YangBounds.tensorRank K 4 2 4` und der gleichlautende Satz `B016Aussage.rank_four_two_four_ge_26`.
  - sha256 1c7dc8d85c7692fa82d7f68403930a1b311c824eed58597a9e8edafb96827fa4, von der Schreibhand an der Datei auf `main` nachgerechnet.
- Lauf auf dem Zweig: 45706541557, Job 139529863773, 21:40:52 bis 21:45:55 UTC, `success`. Geprüfter Commit laut Orchestrator b17319bb95f31b86d0fdd80808e6306f8a1bd6b6 (Merge-Ref von 4049d79 auf 64554f9), von der Schreibhand nicht eigens nachgesehen.
- **Lauf nach dem Merge auf `main`** (von S2-56 nicht abgewartet, von der Schreibhand nachgesehen): Lauf 45708303302 (Nr. 2), Job 139535849738, Commit ad10846, 21:52:37 bis 21:57:56 UTC, `success`. Im Log:
  - sha256 der Datei wie oben;
  - mit `pp.notation false`: `∀ (K : Type) [inst : Field K], LE.le 26 (YangBounds.tensorRank K 4 2 4)`;
  - mit `pp.all`: `@LE.le.{0} Nat instLENat (@OfNat.ofNat.{0} Nat 26 (instOfNatNat 26)) …`;
  - `'B016Aussage.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]`.
- Offen nach S2-56: `mm325_proof` wurde nicht nach Notation durchsucht.

## 3. Zweite Umgebung (S2-57, Punkt 4)

**Angaben des Threads, nicht aus Git oder einem Actions-Lauf belegbar.** Das Build-Log liegt nur in jener Sitzung. Es gibt keinen PR.

- Lokaler Bau im Cloud-Container: Ubuntu 24.04.5, x86_64, 4 Kerne, 15 GB.
- Commit 64554f9cba2d1731932184b01eaae3714304b790, Lean 4.19.0 (Commit 6caaee842e94), Lake 5.0.0-6caaee8, mathlib c44e0c8. Alle 10 Pakete gegen das Manifest abgeglichen.
- Abweichungen der Umgebung:
  - Der elan-Download von releases.lean-lang.org ist gesperrt (403). Die Toolchain kam stattdessen aus den GitHub-Releases von leanprover/lean4 (SHA-256 6fe3ce97…a813fe).
  - Der mathlib-Cache ist gesperrt (403). mathlib wurde deshalb aus den Quellen gebaut.
- Ergebnis:
  - `lake build` Exit 0, „Build completed successfully.“, 1767 Schritte, 26 Module `YangBounds`;
  - 0 Treffer für `sorry`, 0 Fehler, nur Linter-Warnungen;
  - `#print axioms` des Endsatzes über eine Wegwerf-Datei: `[propext, Classical.choice, Quot.sound]`.
- Zeiten laut Thread: 21:51:07 bis 22:14:16 UTC.
- Unter `lean/YangBounds/` ist der Commit 64554f9 gleich dem Stand von S2-55 und S2-56 (nachgesehen).

## Zusammenfassung

| Punkt | Stelle | Ergebnis | Beleg |
|---|---|---|---|
| 1 Neubau ohne Projekt-Artefakte | Actions, frischer Checkout 667df45 | Bau erfolgreich, sorry 0, error 0 | Lauf 45706606136, Job 139530090202 |
| 2 Kernel-Nachprüfung | lean4checker v4.19.0 | 27 von 27 ohne Fehler, `--fresh` Exit 0 | derselbe Job |
| 3 Aussage in frischer Datei | Actions, ad10846 auf `main` | Aussage wie behauptet, Standard-Axiome | Lauf 45708303302, Job 139535849738 (Zweig: 45706541557) |
| 4 Zweite Umgebung | Cloud-Container, Bau aus Quellen | Bau erfolgreich, sorry 0, Standard-Axiome | nur Angabe des Threads |
