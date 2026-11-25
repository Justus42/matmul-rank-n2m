# Status

Zuletzt geändert: 25.11.2026 (Stufe 1, nach Runde 1, Halt)

## Aktuelle Stufe

**Stufe 1: Yangs dritte Fassung formalisieren**

- Runden verbraucht: 1 von 8
- Runde 1 abgeschlossen, keine neue Runde vergeben
- **Halt nach Abbruchregel 4:** keine neuen Aufträge, bis Justus entschieden hat (siehe Sperren)
- Stufenwechsel 1 → 2: durch den Orchestrator, sobald das Fertig-Kriterium erfüllt ist (Protokoll Abschnitt 3 und 11)
- Stufe 3: erst nach Budget von Justus

## Aufträge für Stufe 1

| Nr. | Auftrag | Zieldatei | Stand |
|---|---|---|---|
| S1-01 | Lean-Projektgerüst | `lean/` | erledigt in Runde 1, PR #15. Drei `sorry` offen (Satz 1, Satz 2, obere Schranke 30 für 3×2×6). Der Actions-Workflow baut `lean/` noch nicht |
| S1-02 | Prosa-Beweis der Schranke für n = 3 | `lean/prosa/yang_n3.md` | erledigt in Runde 1, PR #13 |
| S1-03 | Prosa-Beweis der Schranke für m ≥ n ≥ 4 | `lean/prosa/yang_n4.md` | erledigt in Runde 1, PR #14 (Lücke L5, siehe Sperren) |
| S1-04 | Festlegung der zwei Randfälle im Format (Zusatzschlüssel, ungültige Kalenderdaten: beides FEHLERHAFT) | `verfahren/README.md` | erledigt in Runde 1, PR #12 |

Die Anpassung der beiden Prüfprogramme an die Randfälle (Abschnitt 10 von `verfahren/README.md`) wird in Stufe 1 vergeben, sobald der Halt aufgehoben ist.

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
- Budget: Justus hat am 25.11.2026 weitere Runden über das Startbudget hinaus nach Ermessen des Orchestrators freigegeben (siehe LOG.md)

## Sperren

- Halt nach Abbruchregel 4 (L5, Lemma 13 in Yang v3), Bericht an Justus, Entscheidung offen
- Keine Arbeit an Stufe 3 ohne Budget von Justus
- Fremder Code nur nach der Lizenzregel (Protokoll Abschnitt 11.3)
