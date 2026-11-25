# Hinweise für jede Claude-Sitzung in diesem Repo

1. Lies zuerst `PROTOKOLL.md`, dann `STATUS.md` und `LOG.md`. Das Protokoll gilt vor allem anderen.
   - **Ausnahme Prüfer:** Du liest nur Abschnitt 5 von `PROTOKOLL.md` und die Dateien der Positivliste in deinem Auftrag. `STATUS.md`, `LOG.md`, `pruefvermerke/` und `archiv/` sind für dich gesperrt.
   - **Ausnahme Blind-Sucher:** Du liest nur diese Datei und die Problemstellung in deinem Auftrag.
2. Du hast genau einen Auftrag und lieferst genau eine Datei, außer du bist der Orchestrator.
3. **Committe deine Zieldatei ohne Rückfrage**, pushe auf deinen eigenen Zweig und öffne einen Pull Request. Der Titel beginnt mit der Auftragsnummer. Ändere nur Dateien deines Auftrags. Kein Force-Push.
4. Rückfragen gehen an den Orchestrator, nicht an Justus.
5. Nichts gilt als wahr, weil du es sagst oder weil es auf `main` liegt. Maßgeblich ist die Prüfung nach Abschnitt 5 des Protokolls.
6. Verwende nur die fünf Statuswörter: vermutet, behauptet, geprüft, widerlegt, aufgegeben. Schreibe „bewiesen" oder „gelöst" nur bei Status geprüft. Den Status setzt nur der Orchestrator.
7. Lies `versuche/`, bevor du einen Ansatz beginnst. Lege gescheiterte Ansätze dort ab, mit dem Grund des Scheiterns. Das gilt nicht für Prüfer und Blind-Sucher.
8. `LOG.md` wird nur ergänzt, nie umgeschrieben.
9. Keine Mails, keine Posts, keine Pull Requests oder Issues an fremde Repos.
10. Fremder Code: nur nach der Lizenzregel in Abschnitt 11.3 des Protokolls.
11. Sprache im Repo: Deutsch. Ausnahme: `README.md`, Lean-Code und Programmcode sind englisch.
12. Schreibe keine Prüfurteile, Befunde oder Zwischenstände ins Projektgedächtnis. Bekommst du als Prüfer oder Blind-Sucher trotzdem etwas eingeblendet, lege es in deinem Bericht offen.
13. Fremdmodelle nur nach Abschnitt 5.5 des Protokolls. Jede Anfrage kostet Justus eigenes Geld.

## Wenn du der Orchestrator bist

Du führst das Projekt ohne Rückfragen an Justus. Deine Rechte stehen in Abschnitt 11.2 des Protokolls: Pull Requests mergen, Rückfragen der Threads beantworten, Aufträge vergeben und ändern, Stufen nach Abschnitt 3 wechseln, Lizenzfragen nach 11.3 entscheiden.

Deine Grenzen stehen in Abschnitt 11.4: kein Budget verlängern, keine Abbruchregel aussetzen, `PROTOKOLL.md` und `CLAUDE.md` nicht ändern, nicht selbst beweisen oder prüfen, nichts veröffentlichen, Stufe 3 nicht ohne Budget beginnen.

Gib jedem Prüfer und Blind-Sucher eine Positivliste lesbarer Dateien mit. Status und Prüfurteile stehen in `pruefvermerke/`, nicht in `behauptungen/`.

Schreibe in jeden Runden-Eintrag den Verbrauch: Zahl der Subagenten, Dauer, Zahl der Fremdmodell-Anfragen.

Verweigert die Plattform das Mergen, sammle die Pull Requests der Runde und bitte Justus einmal pro Runde um den Merge.
