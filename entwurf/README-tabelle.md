> **Umgesetzt am 25.11.2026** nach der Freigabe von Justus (Auflagen 1 bis 8): Die Notiz steht jetzt unter `ergebnisse/rang-444.md`, die README ist geändert. Diese Datei bleibt als Entwurf stehen und gilt nicht mehr.

# ENTWURF, NICHT FREIGEGEBEN: geänderte README-Tabelle

> **Entwurf. Nicht freigegeben. Nicht in die README übernehmen, bevor Justus freigibt.**
>
> - Auftrag: S2-59 (Stufe 2, nach Runde 11), im Auftrag des Orchestrators. Datum: 25.11.2026.
> - Die Datei `README.md` bleibt unverändert, bis Justus freigibt (Protokoll Abschnitt 9: „Ein Ergebnis wird erst nach Status geprüft und nach Freigabe durch Justus öffentlich als Ergebnis bezeichnet“).
> - Grundlage: `STATUS.md` und `pruefvermerke/README.md` auf `main` bei 6466d4d, `behauptungen/B-010.md`, `behauptungen/B-016.md`. Stand dort: B-016 (R(⟨4,2,4⟩) ≥ 26, Lean) **geprüft**, B-010 (R(⟨4,2,4⟩) ≤ 26, Verfahren über ℤ) **geprüft**. Der zweite, unabhängige Maschinenlauf (Runde 12, `pruefvermerke/B-016-zweitlauf.md`) steht aus. Die Platzhalter `[…]` unten sind nach dem Zweitlauf zu füllen.
> - Für „Rang ist 26“ gibt es keinen eigenen Lean-Satz. Die Gleichheit ist die Verbindung von B-016 (untere Schranke, Lean) und B-010 (obere Schranke, Verfahren nach 5.2). Das sagt der Entwurf ausdrücklich.
> - Unten stehen zwei Teile. Teil 1 ist die eigentlich bestellte Änderung (nur die Zeile ⟨4,2,4⟩ und der Satz unter der Tabelle). Teil 2 sind zwei Vorschläge für Stellen der README, die nach Teil 1 sonst nicht mehr stimmen. Ob Teil 2 mitkommt, entscheidet Justus.

---

## Teil 1: die Tabelle (Ersatz für den Abschnitt „## Targets“ der README)

Bisher in der README:

```
| ⟨4,2,4⟩ | 25 | 26 | open |
```

Entwurf:

```markdown
## Targets

| Format | Lower bound | Upper bound | State |
|---|---|---|---|
| ⟨3,2,6⟩ | 30 | 30 | settled by Yang (v3); goal: Lean formalization |
| ⟨4,2,4⟩ | **26** | 26 | **rank 26 over every field** (lower bound: Lean proof in this repository, status geprüft; upper bound: Hopcroft–Kerr, scheme over ℤ re-checked here). See [the note](entwurf/ergebnis-notiz-444.md) |
| ⟨3,2,7⟩ | 34 | 35 | open (gap computed from the published formulas) |
| ⟨4,2,5⟩ | 31 | 32 | open |

The lower bound 26 for ⟨4,2,4⟩ is the Lean theorem
`YangBounds.Transponiert444.rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4`
(Lean 4.19.0, mathlib `c44e0c8`, source state `c3c3884`; GitHub Actions run 45699204903, job 139504538345: no `sorry`, only the axioms `propext`, `Classical.choice`, `Quot.sound`; second independent build: [run/commit from `pruefvermerke/B-016-zweitlauf.md`]).
Its statement was compared with the claim by one reviewing model instance and, independently, by a model of another family (GPT 6.2 Sol). It has not been reviewed by a human mathematician.
The upper bound 26 is the known value of Hopcroft and Kerr (1971); the scheme `verfahren/4x2x4-r26-s001.json` (coefficients in {−1, 0, 1}) was accepted by two independently written exact checkers.
There is no single Lean theorem for "rank = 26"; the equality combines the two items above.

The other rows are taken from the literature and are not yet all re-verified here.
```

Hinweis zum Link: Der Link auf `entwurf/ergebnis-notiz-444.md` ist nur ein Platzhalter. Nach der Freigabe sollte die Notiz an ihren endgültigen Ort (oder ins Release), und der Link wird angepasst.

---

## Teil 2: Vorschläge für Stellen, die nach Teil 1 nicht mehr stimmen (optional, Entscheidung Justus)

### 2a. Statuszeile oben in der README

Bisher:

```
**Status: just started. No results yet.** See [STATUS.md](STATUS.md).
```

Vorschlag:

```markdown
**Status:** stage 2 (⟨4,2,4⟩) reached its completion criterion: R(⟨4,2,4⟩) = 26 over every field, lower bound machine-checked in Lean (see the table). Stage 3 (⟨3,2,7⟩) has not started. See [STATUS.md](STATUS.md).
```

### 2b. Zeile ⟨3,2,6⟩

Nach `STATUS.md` (Stufe 1 abgeschlossen) und `pruefvermerke/README.md` hat B-006 („Rang von ⟨3,2,6⟩ ist 30, über jedem Körper“, Lean `YangBounds.rank_three_two_six`, Actions-Lauf 45560784171, Aussagen-Abgleich S1-18) den Status **geprüft**. Die README-Zeile sagt noch „goal: Lean formalization“. Vorschlag:

```markdown
| ⟨3,2,6⟩ | 30 | 30 | settled by Yang (v3); Lean formalization of Yang's bound in this repository (status geprüft). The theorem is Yang's |
```

### 2c. Satz unter der Tabelle

Der bisherige Satz „These numbers are taken from the literature and are not yet re-verified here. Stage 0 of the project checks them.“ ist nach Stufe 0 und 1 überholt. In Teil 1 ist er schon ersetzt durch „The other rows are taken from the literature and are not yet all re-verified here.“ Bei ⟨4,2,5⟩ steht in `lit/QUELLEN.md` (A-04) außerdem der Vorschlag, die obere Schranke 32 auf Charakteristik ≠ 2 einzuschränken (Status behauptet). Dieser Entwurf übernimmt das nicht.

### 2d. KI-Hinweis in „How this project works“

Der Abschnitt nennt schon offen, dass KI-Modelle die Arbeit leisten (Protokoll Abschnitt 9). Für ⟨4,2,4⟩ wäre zu ergänzen, welche Modelle beteiligt waren: Claude-Modelle von Anthropic (Orchestrierung, Beweissuche, Formalisierung, Prüfung) und GPT 6.2 Sol von OpenAI (unabhängiger Aussagen-Abgleich). Die genauen Claude-Modellversionen trägt Justus ein; dieser Entwurf nennt sie nicht.
