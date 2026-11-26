# S4-09: Axiom-Bericht für `lemma15b`, `lemma15b_core` und `lemma_I`

Stufe 4, Runde 2. Rolle: Formalisierer (nur Bau und Bericht). Dieser Bericht gibt wieder, was der Actions-Lauf ausgibt. Er enthält kein Urteil über die Lemmata.

## Änderung

PR #108 (Merge `1e4f7b80a00067db68cc347d2522f241cbf7c219`):

- `.github/scripts/lean_report.py`: drei Einträge in `MAIN_THEOREMS`, damit der vorhandene Axiom-Schritt von `.github/workflows/lean-project.yml` für sie `#print axioms` ausführt, eine Zeile `AXIOM-RESULT|…` schreibt und sie einstuft (STANDARD, SORRY, OTHER, MISSING):
  - `YangBounds.YangN4Haupt.lemma15b_core` (`lean/YangBounds/YangN4Haupt.lean`, Zeile 235)
  - `YangBounds.YangN4Haupt.lemma15b` (`lean/YangBounds/YangN4Haupt.lean`, Zeile 878)
  - `YangBounds.YangN3Teil3.lemma_I` (`lean/YangBounds/YangN3Teil3.lean`, Zeile 665)
- `.github/workflows/lean-project.yml`: Der Schritt „#print axioms for the main theorems“ gibt zuerst `commit: <sha>` aus.

An `lean/YangBounds/` ist nichts geändert.

## Lauf auf main

- Workflow: „Lean build (own project lean/)“ (`.github/workflows/lean-project.yml`)
- Lauf: 45778891656 (Laufnummer 106), Ereignis `push` auf `main`
- Job: 139769322302 („Build lean/ and report axioms“), Ergebnis `success`, 07:55:22 bis 08:01:48 UTC am 26.11.2026
- Commit: `dfd239ea5b5668400f2035134a7df91047f90520` (Merge von PR #111)
- Link: https://github.com/Justus42/matmul-rank-n2m/actions/runs/45778891656/job/139769322302

Hinweis zur Wahl des Laufs: Der Lauf für den Merge-Commit von PR #108 selbst (Lauf 45778205882, Laufnummer 104, Commit `1e4f7b8`) wurde durch die `concurrency`-Regel des Workflows abgebrochen (`cancelled`), weil kurz danach PR #111 auf main gemergt wurde. Zwischen `1e4f7b8` und `dfd239e` hat sich nur Prosa geändert (`lean/prosa/s4_327_spurA_r2_ausschluss.md`, `versuche/s4-blind-r2.md`), unter `lean/YangBounds/` und an Workflow und Skript nichts. SHA-256 der beiden Quelldateien bei `dfd239e`:

- `lean/YangBounds/YangN4Haupt.lean`: `cce4c61e201681bd6c012a25328d97fd37503e2dd1511cd2fd4c85fda5b9edb0`
- `lean/YangBounds/YangN3Teil3.lean`: `ed426a33cba9b929f050441013016a4dd4a2ad4dc07de63a92bf746e0b46dd16`

## Wörtliche Zeilen aus dem Log von Job 139769322302

Schritt „Report sorry (number and locations)“:

```
2026-11-26T08:00:18.5447319Z SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log
2026-11-26T08:00:18.5447711Z SORRY: 0 'sorry' token(s) in the sources outside comments
```

Schritt „#print axioms for the main theorems“:

```
2026-11-26T08:00:18.5605531Z commit: dfd239ea5b5668400f2035134a7df91047f90520
...
2026-11-26T08:01:43.8623996Z 'YangBounds.YangN4Haupt.lemma15b_core' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-26T08:01:43.8624355Z AXIOM-RESULT|YangBounds.YangN4Haupt.lemma15b_core|propext, Quot.sound, Classical.choice
2026-11-26T08:01:43.8624700Z 'YangBounds.YangN4Haupt.lemma15b' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-26T08:01:43.8625046Z AXIOM-RESULT|YangBounds.YangN4Haupt.lemma15b|propext, Quot.sound, Classical.choice
2026-11-26T08:01:43.8625410Z 'YangBounds.YangN3Teil3.lemma_I' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-26T08:01:43.8625745Z AXIOM-RESULT|YangBounds.YangN3Teil3.lemma_I|propext, Quot.sound, Classical.choice
```

Schritt „Axiom result per main theorem“:

```
2026-11-26T08:01:43.9493684Z   [STANDARD] YangBounds.YangN4Haupt.lemma15b_core
2026-11-26T08:01:43.9493886Z              Lemma 15(b), abstract core (YangN4Haupt.lean)
2026-11-26T08:01:43.9494174Z              axioms: ['Classical.choice', 'Quot.sound', 'propext']  -- only propext, Classical.choice, Quot.sound
2026-11-26T08:01:43.9494452Z   [STANDARD] YangBounds.YangN4Haupt.lemma15b
2026-11-26T08:01:43.9494673Z              Lemma 15(b): rk L = d*rho implies rho = m (YangN4Haupt.lean)
2026-11-26T08:01:43.9494987Z              axioms: ['Classical.choice', 'Quot.sound', 'propext']  -- only propext, Classical.choice, Quot.sound
2026-11-26T08:01:43.9495268Z   [STANDARD] YangBounds.YangN3Teil3.lemma_I
2026-11-26T08:01:43.9495569Z              Lemma I: rk L + min(2, dim N) <= 2 rk H (YangN3Teil3.lean)
2026-11-26T08:01:43.9495869Z              axioms: ['Classical.choice', 'Quot.sound', 'propext']  -- only propext, Classical.choice, Quot.sound
2026-11-26T08:01:43.9496129Z TOTAL: STANDARD=59
```

Zum Auffinden im Log: nach `lemma15b` oder `lemma_I` suchen; die Zeitstempel oben sind eindeutig.

## Was der Lauf ausgibt

Alle drei Sätze sind im Lauf vorhanden (nicht MISSING) und zeigen genau die drei Standard-Axiome `propext`, `Classical.choice`, `Quot.sound`, kein `sorryAx` und kein weiteres Axiom. Der sorry-Bericht desselben Jobs meldet 0 und 0. Ob die Lean-Sätze die behaupteten Aussagen sind (Protokoll 5.1, Punkt 3), ist nicht Teil dieses Auftrags.

## Verbrauch

Keine Subagenten, keine Fremdmodell-Anfragen. Ein PR-Lauf (45777321918, Job 139764031444, Commit `57f4bef`) als Vorprüfung mit denselben Ergebnissen für die drei Sätze.
