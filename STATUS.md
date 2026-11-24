# Status

Zuletzt geändert: 25.11.2026

## Aktuelle Stufe

**Stufe 0: Nachbau und Bestandsaufnahme**

- Runden verbraucht: 0 von 2
- Stufenwechsel 0 → 1 → 2: durch den Orchestrator, sobald das Fertig-Kriterium erfüllt ist (Protokoll Abschnitt 3 und 11)
- Stufe 3: erst nach Budget von Justus

## Offene Aufträge für Stufe 0

| Nr. | Auftrag | Rolle | Zieldatei | Stand |
|---|---|---|---|---|
| A-01 | Lizenz des Repos fallnlove/mm325_proof feststellen. Vorher wird nichts daraus übernommen | Literaturwächter | `lit/LIZENZEN.md` | offen |
| A-02 | Lean-Repo zu 3×2×5 bauen, Axiom-Prüfung, Bericht | Formalisierer | `lean/NACHBAU.md` | offen, wartet auf A-01 |
| A-03 | Aussagen-Abgleich: Lean-Satz gegen Satz 1 in arXiv:2609.22054 | Prüfer | `behauptungen/B-001.md` | offen, wartet auf A-02 |
| A-04 | Tabelle aus Abschnitt 2 des Protokolls gegen die Originalarbeiten prüfen | Literaturwächter | `lit/QUELLEN.md` | offen |
| A-05 | Quelle des Verfahrens mit 32 Multiplikationen für 4×2×5 finden | Literaturwächter | `lit/QUELLEN.md` | offen |
| A-06 | Genaue Fundstelle von Shitovs Beweis für 2×2×m | Literaturwächter | `lit/QUELLEN.md` | offen |
| A-07 | Datenformat für Verfahren festlegen | Verfahrenssucher | `verfahren/README.md` | offen |
| A-08 | Prüfprogramm 1 (exakte Arithmetik) | Verfahrenssucher | `pruefer/` | offen, wartet auf A-07 |
| A-09 | Prüfprogramm 2 in anderer Sprache, ohne Blick auf Programm 1 | Verfahrenssucher | `pruefer/` | offen, wartet auf A-07 |
| A-10 | Hopcroft-Kerr-Verfahren für 3×2×5 und 3×2×6 als Dateien anlegen und mit beiden Programmen prüfen | Verfahrenssucher | `verfahren/` | offen, wartet auf A-08 und A-09 |
| A-11 | Lean-Build in GitHub Actions einrichten | Formalisierer | `.github/workflows/` | offen, wartet auf A-02 |

## Fertig-Kriterium Stufe 0

- [ ] Lean-Build grün
- [ ] Axiom-Bericht liegt vor
- [ ] Tabelle in Abschnitt 2 bestätigt oder korrigiert
- [ ] Beide Prüfprogramme bestätigen mindestens zwei bekannte Verfahren

## Sperren

- Keine Arbeit an Stufe 3 ohne Budget von Justus
- Fremder Code nur nach der Lizenzregel (Protokoll Abschnitt 11.3)
