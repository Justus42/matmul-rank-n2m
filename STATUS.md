# Status

Zuletzt geändert: 25.11.2026 (nach Runde 2)

## Aktuelle Stufe

**Stufe 0: Nachbau und Bestandsaufnahme**

- Runden verbraucht: 2 (Startbudget 2)
- Budget: Justus hat am 25.11.2026 weitere Runden über das Startbudget hinaus nach Ermessen des Orchestrators freigegeben (siehe LOG.md). Die Tabelle in PROTOKOLL.md Abschnitt 6 ist unverändert
- Runde 3 läuft: A-03, A-10, A-11 (über dem Startbudget, durch Justus' Freigabe gedeckt)
- Stufenwechsel 0 → 1 → 2: durch den Orchestrator, sobald das Fertig-Kriterium erfüllt ist (Protokoll Abschnitt 3 und 11)
- Stufe 3: erst nach Budget von Justus

## Aufträge für Stufe 0

| Nr. | Auftrag | Rolle | Zieldatei | Stand |
|---|---|---|---|---|
| A-01 | Lizenz des Repos fallnlove/mm325_proof feststellen. Vorher wird nichts daraus übernommen | Literaturwächter | `lit/LIZENZEN.md` | erledigt in Runde 1, PR #2 |
| A-02 | Lean-Repo zu 3×2×5 bauen, Axiom-Prüfung, Bericht | Formalisierer | `lean/NACHBAU.md` | erledigt in Runde 2, PR #8 |
| A-03 | Aussagen-Abgleich: Lean-Satz gegen Satz 1 in arXiv:2609.22054 | Prüfer | `behauptungen/B-001.md` | vergeben in Runde 3 |
| A-04 | Tabelle aus Abschnitt 2 des Protokolls gegen die Originalarbeiten prüfen | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-05 | Quelle des Verfahrens mit 32 Multiplikationen für 4×2×5 finden | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-06 | Genaue Fundstelle von Shitovs Beweis für 2×2×m | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-07 | Datenformat für Verfahren festlegen | Verfahrenssucher | `verfahren/README.md` | erledigt in Runde 1, PR #1 und #3 |
| A-08 | Prüfprogramm 1 (exakte Arithmetik) | Verfahrenssucher | `pruefer/python/` | erledigt in Runde 2, PR #6 |
| A-09 | Prüfprogramm 2 in anderer Sprache, ohne Blick auf Programm 1 | Verfahrenssucher | `pruefer/rust/` | erledigt in Runde 2, PR #7 |
| A-10 | Hopcroft-Kerr-Verfahren für 3×2×5 und 3×2×6 als Dateien anlegen und mit beiden Programmen prüfen | Verfahrenssucher | `verfahren/` | vergeben in Runde 3 |
| A-11 | Lean-Build in GitHub Actions einrichten | Formalisierer | `.github/workflows/` | vergeben in Runde 3 |

## Fertig-Kriterium Stufe 0

- [ ] Lean-Build grün
- [x] Axiom-Bericht liegt vor: siehe `lean/NACHBAU.md` (PR #8, auf `main`). Lokaler Lauf, Status behauptet bis zum grünen Actions-Lauf aus A-11
- [x] Tabelle in Abschnitt 2 bestätigt oder korrigiert: siehe `lit/QUELLEN.md` (PR #4, auf `main`). Präzisierung bei 4×2×5, Status behauptet
- [ ] Beide Prüfprogramme bestätigen mindestens zwei bekannte Verfahren

## Hinweise

- Erledigt heißt: Datei geliefert und auf `main`. Ein Merge ändert keinen Status, alle Befunde aus Runde 1 und 2 haben Status behauptet
- An Justus gemeldet: Das Budget von 2 Runden reicht wegen der Abhängigkeiten nicht für A-03, A-10 und A-11

## Sperren

- Keine Arbeit an Stufe 3 ohne Budget von Justus
- Fremder Code nur nach der Lizenzregel (Protokoll Abschnitt 11.3)
