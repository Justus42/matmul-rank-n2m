# A7-Z: Wiederholter Zweitlauf zum Lean-Satz `YangBounds.Transponiert444.rank_four_two_four_ge_26`

Rolle: Prüfer. Gegenstand: Merge-Commit `62c3dc60b44680e9367fbe3052f287c8f7e8f882` auf `main`,
verglichen mit seinem ersten Elternteil `ce94c42e15a0ab27d768bb52e8e18389880a7f3d`.
Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Eingeblendetes Projektgedächtnis.** Mir war der Index des Projektgedächtnisses eingeblendet
(Regeln zum Projekt, Rollen, Fremdmodell-Zugang, Umgebung; nach eigener Aussage nichts über
Behauptungen, Beweise oder Status). Zusätzlich wurden mir während der Arbeit zwei Einzeleinträge
eingeblendet: „gemini-bridge“ (Zugang der Bridge, Zeitlimit) und „aussagen-abgleich-n3“
(Hinweise zu Bridge und lokalem Lean-Bau). Keiner enthielt ein Urteil zu diesem Umbau.

**Auftrag.** Der Auftrag enthielt eine Entscheidung des Repository-Eigentümers im Wortlaut. Daraus
wusste ich, dass im Umbau Beweisschritte ab `SatzB444.lean` Zeile 414 durch Mathlib ersetzt
werden durften und dass nach diesem Zweitlauf eine Textänderung in README und
`ergebnisse/rang-444.md` folgen soll.

**Über die Positivliste hinaus gesehen.**
- Abschnittsüberschriften von `PROTOKOLL.md` (nur die Gliederung, um Abschnitt 5 zu finden).
- Die Ausgabe von `git diff --stat` und das Verzeichnis `lean/prosa/` zeigten den Dateinamen
  `lean/prosa/auflage7_entkopplung_s4-26.md` und die Namen älterer Berichte. Ich habe keine
  davon geöffnet.
- `git log` von `main` zeigte Betreffzeilen der letzten Commits (u. a. von PR 131 und PR 142).
- Den Quelltext des externen Pakets `fallnlove/mm325_proof` bei Commit `759cf4a` habe ich nur
  für die Importzeilen gelesen (Punkt 2).
- Den Inhalt von PR 131, `STATUS.md`, `LOG.md`, `pruefvermerke/` und `archiv/` habe ich nicht
  gelesen.

## 1. Zweitlauf in GitHub Actions

**Urteil: bestätigt.**

- Workflow `.github/workflows/zweitlauf.yml`, ausgelöst per `workflow_dispatch` auf `main`
  mit Eingabe `ref = 62c3dc60b44680e9367fbe3052f287c8f7e8f882`.
- **Lauf 45833618872, Job 139956567190**, Start 2026-11-26 13:54:00 UTC, Ende 14:14:26 UTC,
  Ergebnis `success`, alle Schritte grün.
- Gelesen im Job-Log (selbst, nicht aus einer Zusammenfassung):
  - `TARGET_SHA: 62c3dc60b44680e9367fbe3052f287c8f7e8f882` (aus `git rev-parse HEAD` des frischen
    Checkouts). Der Schritt, der vor dem Bau das Fehlen von `.olean`/`.ilean`/`.trace` und von
    `lean/.lake` erzwingt, endete erfolgreich. Seine Einzelzeilen liegen am Anfang des Logs, den
    das Werkzeug mir nicht ausgegeben hat; ich stütze mich hier auf den Schrittstatus.
  - Toolchain `leanprover/lean4:v4.19.0`, lean4checker Tag `v4.19.0`, Commit
    `e11f65c651edd58d68ba260015d2bfde5102cd7f`.
  - Bau: `Build completed successfully.`; `lines with 'sorry': 0`, `(no line contains 'sorry')`,
    `lines with 'error': 0`, 15 Warnungszeilen (Linter: `<;>`, ungenutzte Variablen,
    `simpa`, `congr 1`; davon 9 im externen Paket), keine betrifft ein `sorry` oder Axiom.
  - lean4checker über alle 28 Projektmodule und das Abhängigkeitsmodul
    `MatrixMultiplicationLowerBound25`: `L4C-SUMMARY|checked=29|ok=29|failed=0`.
  - `#check` und `#print axioms`:
    ```
    YangBounds.Transponiert444.rank_four_two_four_ge_26 : ∀ (K : Type u_1) [inst : Field K],
      26 ≤ YangBounds.tensorRank K 4 2 4
    'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]
    ```
  - `lean4checker --fresh YangBounds.Transponiert444`: `L4C-FRESH|YangBounds.Transponiert444|exit=0`
    (14:02:23 bis 14:14:22 UTC).

## 2. Vergleich 62c3dc6 gegen ersten Elternteil ce94c42

**Urteil: bestätigt.** Keine Satzaussage und keine Definition hat sich geändert. Geändert haben
sich nur ein Beweiskörper, Importe, Kommentare, Axiom-Berichtsdateien und die wörtliche
Verschiebung der Brücke zu `mm325_proof` in eine eigene Datei.

Außerhalb von `lean/` ist nichts geändert. In `lean/` sind genau diese Dateien betroffen
(`git diff --stat ce94c42 62c3dc6`); `lean/prosa/auflage7_entkopplung_s4-26.md` ist neu und
kein Lean-Code.

| Datei | Zeile (alt → neu) | alter Wortlaut | neuer Wortlaut | Art |
|---|---|---|---|---|
| `lean/YangBounds/SatzB444.lean` | 414 → 414 | `have h12 : finrank K (Fin 3 → Fin 4 → K) = 12 := by simp` | `have h12 : finrank K (Fin 3 → Fin 4 → K) = 12 := by rw [Module.finrank_pi_fintype]; simp` | Beweiskörper von `eight_le_of_ker` |
| `lean/YangBounds/Basic.lean` | 5 → 5–28 | `import MatrixMultiplicationLowerBound25` | Kommentar und 21 Zeilen `import Mathlib.…` (Liste unten) | Importe |
| `lean/YangBounds/Basic.lean` | 24–27 → 47–50 | Modul-Docstring: „For `n = 3`, `l = 2` the structure coincides … `tensorRank_three_two_eq` connects the two rank notions.“ | Docstring: „This file does not import the external dependency … lives in `YangBounds/BrueckeMM325.lean` …“ | Kommentar |
| `lean/YangBounds/Basic.lean` | 125–153 → entfernt | Abschnitt „Connection to the external dependency `mm325_proof`“: `BilinearAlgorithm.toMatrixAlgorithm`, `BilinearAlgorithm.ofMatrixAlgorithm`, `tensorRank_three_two_eq`, `tpsr_lower_bound` | — | verschoben |
| `lean/YangBounds/BrueckeMM325.lean` | neu, 1–58 | — | `import YangBounds.Basic`, `import MatrixMultiplicationLowerBound25`, Docstring, `namespace`/`universe`/`variable`, dann der verschobene Abschnitt | verschoben |
| `lean/Axioms.lean` | 7–8 → entfernt | `#print axioms YangBounds.tensorRank_three_two_eq`, `#print axioms YangBounds.tpsr_lower_bound` | — | Axiom-Bericht |
| `lean/AxiomsMM325.lean` | neu, 1–7 | — | `import YangBounds.BrueckeMM325`, Kommentar, dieselben zwei `#print axioms` | Axiom-Bericht |

Selbst nachgeprüft:

- **Verschiebung wörtlich.** Der Block von `/-! ## Connection to the external dependency` bis vor
  `end YangBounds` (30 Zeilen) ist in der alten `Basic.lean` und in der neuen `BrueckeMM325.lean`
  zeichengleich (`diff` ohne Ausgabe). Kontext: alt `universe u`, `variable {K : Type u} [Field K]`,
  `variable {n l m r : ℕ}`, `open scoped BigOperators`; neu `universe u`,
  `variable {K : Type u} [Field K]`, `variable {m r : ℕ}`. Die Signaturen der vier Deklarationen
  benutzen nur `K`, `m`, `r`, sodass sich ihre Aussagen dadurch nicht ändern.
- **Ersatz-Importe.** Die 21 neuen Importe in `Basic.lean` sind genau die Mathlib-Importe von
  `MatrixMultiplicationLowerBound25.lean` (Paket-Commit `759cf4a`, 23 Mathlib-Importe) ohne die
  zwei, die `Basic.lean` schon vorher hatte (`Mathlib.Data.Matrix.Mul`, `Mathlib.Data.Nat.Find`).
  Das Paket hat sonst keine Importe.
- **Ersatz nur durch Mathlib.** Der einzige geänderte Beweisschritt benutzt
  `Module.finrank_pi_fintype` und `simp`. Im Projekt gibt es keine Deklaration dieses Namens
  (Suche in `lean/YangBounds`), und kein Modul der Importkette importiert etwas außer Mathlib
  und Projektmodulen (Punkt 3). Das Lemma stammt also aus Mathlib; es wird an acht weiteren,
  unveränderten Stellen des Projekts schon so benutzt.
- **Nichts in der Kette benutzt die verschobenen Deklarationen.** `toMatrixAlgorithm`,
  `ofMatrixAlgorithm`, `tensorRank_three_two_eq`, `tpsr_lower_bound` kommen nur in
  `BrueckeMM325.lean`, `AxiomsMM325.lean` und im Docstring von `Basic.lean` vor.
- **Aussage des Endsatzes.** `lean/YangBounds/Transponiert444.lean` ist unverändert; Zeile 655
  lautet in beiden Ständen
  `theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 :=`.
  Alle übrigen 25 Module der Importkette außer `Basic.lean` und `SatzB444.lean` sind
  unverändert; in diesen beiden sind keine Aussagen oder Definitionen geändert (siehe Tabelle).
- `lakefile.toml`, `lake-manifest.json`, `lean-toolchain` und `YangBounds.lean` sind unverändert;
  das Paket `mm325_lower_bound` bleibt Abhängigkeit (für `BrueckeMM325.lean`).

## 3. Importkette ohne `mm325_proof`

**Urteil: bestätigt.**

Eigenes Werkzeug: ein Skript, das ab `YangBounds.Transponiert444` alle `import`-Zeilen der
Quelldateien unter `lean/` transitiv verfolgt (Stand 62c3dc6). Ergebnis: 26 Projektmodule

`Basic, Bruecke444, CeilBound, Endsatz444, Lemma13Prime, LemmaK444, LemmaP444, LemmaZ444,
SatzA444, SatzB444, SatzB444Final, SatzB444Poly, SatzC444Generisch, SatzC444Kern, SatzE444,
SatzE444Buendel, SatzF444, Statements, Transponiert444, Upper3x2x6, YangN3, YangN3Teil1,
YangN3Teil2, YangN3Teil3, YangN4Haupt, YangN4Lemma13` (alle mit Präfix `YangBounds.`)

und 51 direkt importierte Mathlib-Module; **kein** Import außerhalb von Mathlib und Projekt.
`YangBounds.BrueckeMM325` ist nicht in der Kette. Das einzige Vorkommen von
`import MatrixMultiplicationLowerBound25` im Projekt steht in `lean/YangBounds/BrueckeMM325.lean`
Zeile 2. Mathlib selbst hängt nicht von dem Paket ab. Damit importiert kein Modul der Kette das
Paket direkt oder mittelbar.

Grenze dieser Prüfung: Sie liest die Quelltexte, nicht die `.olean`-Kopfdaten des Laufs.

## 4. Lauf- und Commit-Daten (UTC)

- Lauf 45833618872, Job 139956567190: 13:54:00 bis 14:14:26.
- Geprüfter Commit 62c3dc6: Commit-Zeit 2026-11-26 13:39:22 UTC. Erster Elternteil ce94c42:
  2026-11-26 13:27:37 UTC.
