# Status

Zuletzt geändert: 25.11.2026 (Stufe 1, Runde 4 vergeben)

## Aktuelle Stufe

**Stufe 1: Yangs dritte Fassung formalisieren**

- Runden verbraucht: 3 von 8
- Runde 4 läuft: S1-13, S1-14, S1-15, S1-16
- Stufenwechsel 1 → 2: durch den Orchestrator, sobald das Fertig-Kriterium erfüllt ist (Protokoll Abschnitt 3 und 11)
- Stufe 3: erst nach Budget von Justus

## Aufträge für Stufe 1

| Nr. | Auftrag | Zieldatei | Stand |
|---|---|---|---|
| S1-01 | Lean-Projektgerüst | `lean/` | erledigt in Runde 1, PR #15. Drei `sorry` offen (Satz 1, Satz 2, obere Schranke 30 für 3×2×6). Der Actions-Workflow baut `lean/` noch nicht |
| S1-02 | Prosa-Beweis der Schranke für n = 3 | `lean/prosa/yang_n3.md` | erledigt in Runde 1, PR #13 |
| S1-03 | Prosa-Beweis der Schranke für m ≥ n ≥ 4 | `lean/prosa/yang_n4.md` | erledigt in Runde 1, PR #14 (Lücke L5, Reparatur in S1-06 ohne Einwände) |
| S1-04 | Festlegung der zwei Randfälle im Format (Zusatzschlüssel, ungültige Kalenderdaten: beides FEHLERHAFT) | `verfahren/README.md` | erledigt in Runde 1, PR #12 |
| S1-05 | Prüfung des Prosa-Beweises für n = 3, Prüfer und Fremdmodell | `lean/prosa/yang_n3_pruefung.md` | erledigt in Runde 2, PR #20. Gegenlesen durch das Fremdmodell nur schwach (gekürzte Fassung), strenger Nachtrag entfällt nach Entscheidung von Justus |
| S1-06 | Prüfung des Prosa-Beweises für n ≥ 4, Schwerpunkt L5, Prüfer und Fremdmodell | `lean/prosa/yang_n4_pruefung.md` | erledigt in Runde 2, PR #18 |
| S1-07 | Python-Prüfprogramm an Abschnitt 9 und 10 des Formats anpassen | `pruefer/python/` | erledigt in Runde 2, PR #16 und #19 |
| S1-08 | Rust-Prüfprogramm an Abschnitt 9 und 10 des Formats anpassen | `pruefer/rust/` | erledigt in Runde 2, PR #17 |
| S1-09 | Formalisierung von Yangs Satz 1, Teil 1 nach Abschnitt 9 von `lean/prosa/yang_n3.md` | `lean/YangBounds/YangN3Teil1.lean` | erledigt in Runde 3, PR #21 |
| S1-10 | Formalisierung von Yangs Satz 1, Teil 2 | `lean/YangBounds/YangN3Teil2.lean` | erledigt in Runde 3, PR #23 |
| S1-11 | Formalisierung von Yangs Satz 1, Teil 3 | `lean/YangBounds/YangN3Teil3.lean` | erledigt in Runde 3, PR #22 |
| S1-12 | Obere Schranke 30 für 3×2×6 in Lean, aus dem Verfahren von A-10 | `lean/YangBounds/Upper3x2x6.lean` | erledigt in Runde 3, PR #24 |
| S1-13 | Satz 1 zusammensetzen und in `Statements.lean` einsetzen, dazu die obere Schranke 30 für 3×2×6 aus `Upper3x2x6.lean` einsetzen | `YangN3.lean` | vergeben in Runde 4 |
| S1-14 | Actions-Workflow für `lean/` mit Axiom-Bericht je Satz | `.github/workflows/` | vergeben in Runde 4 |
| S1-15 | Lemma 13 in reparierter Fassung | `YangN4Lemma13.lean` | vergeben in Runde 4 |
| S1-16 | Hauptbeweis von Satz 2 mit Lemma 13 als Hypothese | `YangN4Haupt.lean` | vergeben in Runde 4 |

Offen für spätere Runden:

- Beide Prüfprogramme auf denselben Testfällen abgleichen
- Rückgabewert bei internem Fehler im Format festlegen (Python nutzt bisher 3, eigene Entscheidung)
- In `Statements.lean` stehen noch drei `sorry`: Satz 1 (Einsetzen in S1-13 vergeben), Satz 2 (S1-15 und S1-16 arbeiten daran) und die obere Schranke 30 für 3×2×6 (in `Upper3x2x6.lean` bewiesen, Einsetzen in S1-13 vergeben)

## Fertig-Kriterium Stufe 1

- [ ] Build grün ohne `sorry`
- [ ] Axiom-Prüfung bestanden
- [ ] Aussagen-Abgleich bestanden

## Stufe 0: abgeschlossen

Abgeschlossen am 25.11.2026 nach 3 Runden. Die dritte Runde lag über dem Startbudget von 2 und war durch Justus' Freigabe vom 25.11.2026 gedeckt (siehe LOG.md). Die Tabelle in PROTOKOLL.md Abschnitt 6 ist unverändert.

Fertig-Kriterium Stufe 0, alle Punkte erfüllt:

- [x] Lean-Build grün: GitHub Actions, Lauf 45518440779 (A-11, PR #9)
- [x] Axiom-Bericht liegt vor: `lean/NACHBAU.md` (PR #8), bestätigt im Actions-Lauf 45518440779
- [x] Tabelle in Abschnitt 2 bestätigt oder korrigiert: `lit/QUELLEN.md` (PR #4). Präzisierung bei 4×2×5, Status behauptet
- [x] Beide Prüfprogramme bestätigen mindestens zwei bekannte Verfahren: 3×2×5 mit 25 und 3×2×6 mit 30 über ℤ (A-10, PR #11), dazu Strassen

Ergebnisse mit Status geprüft: B-001 (Rang von ⟨3,2,5⟩ ist 25, über jedem Körper) und die obere Schranke 30 für ⟨3,2,6⟩ über ℤ. Übersicht in `behauptungen/README.md`.

### Aufträge der Stufe 0

| Nr. | Auftrag | Rolle | Zieldatei | Stand |
|---|---|---|---|---|
| A-01 | Lizenz des Repos fallnlove/mm325_proof feststellen. Vorher wird nichts daraus übernommen | Literaturwächter | `lit/LIZENZEN.md` | erledigt in Runde 1, PR #2 |
| A-02 | Lean-Repo zu 3×2×5 bauen, Axiom-Prüfung, Bericht | Formalisierer | `lean/NACHBAU.md` | erledigt in Runde 2, PR #8 |
| A-03 | Aussagen-Abgleich: Lean-Satz gegen Satz 1 in arXiv:2609.22054 | Prüfer | `behauptungen/B-001.md` | erledigt in Runde 3, PR #10 |
| A-04 | Tabelle aus Abschnitt 2 des Protokolls gegen die Originalarbeiten prüfen | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-05 | Quelle des Verfahrens mit 32 Multiplikationen für 4×2×5 finden | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-06 | Genaue Fundstelle von Shitovs Beweis für 2×2×m | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-07 | Datenformat für Verfahren festlegen | Verfahrenssucher | `verfahren/README.md` | erledigt in Runde 1, PR #1 und #3 |
| A-08 | Prüfprogramm 1 (exakte Arithmetik) | Verfahrenssucher | `pruefer/python/` | erledigt in Runde 2, PR #6 |
| A-09 | Prüfprogramm 2 in anderer Sprache, ohne Blick auf Programm 1 | Verfahrenssucher | `pruefer/rust/` | erledigt in Runde 2, PR #7 |
| A-10 | Hopcroft-Kerr-Verfahren für 3×2×5 und 3×2×6 als Dateien anlegen und mit beiden Programmen prüfen | Verfahrenssucher | `verfahren/` | erledigt in Runde 3, PR #11 |
| A-11 | Lean-Build in GitHub Actions einrichten | Formalisierer | `.github/workflows/` | erledigt in Runde 3, PR #9 |

## Hinweise

- Erledigt heißt: Datei geliefert und auf `main`. Ein Merge ändert keinen Status. Den Status ändert nur die Prüfung nach Abschnitt 5
- Erledigt: Der Halt nach Abbruchregel 4 (L5, Lemma 13 in Yang v3) ist aufgehoben. Justus hat am 25.11.2026 entschieden: „Weiter, Reparatur prüfen lassen“ (siehe LOG.md)
- Budget: Justus hat am 25.11.2026 weitere Runden über das Startbudget hinaus nach Ermessen des Orchestrators freigegeben (siehe LOG.md)

## Sperren

- Fremdmodelle vorerst nur bei kritischen Punkten (Entscheidung von Justus, 25.11.2026, siehe LOG.md): Aussagen-Abgleiche nach 5.1 Punkt 3 und Befunde, die eine Abbruchregel berühren. Dafür GPT 6.2 Sol mit hoher Denkstufe als Batch über die Bridge. Das Gegenlesen von Prosa vor einer Formalisierung entfällt vorerst
- Keine Arbeit an Stufe 3 ohne Budget von Justus
- Fremder Code nur nach der Lizenzregel (Protokoll Abschnitt 11.3)
