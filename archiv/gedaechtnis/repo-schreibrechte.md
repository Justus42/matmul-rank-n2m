---
name: repo-schreibrechte
description: Was die Plattform im Repo matmul-rank-n2m erlaubt (Push auf main, Zweige löschen) und Projektstand (Stufe 2, Protokoll 0.3)
metadata:
  type: project
  modified: 2026-11-25T13:41:39.307Z
---

Stand 25.11.2026, 18:05 MEZ:
- Ein Thread kann direkt auf `main` pushen (LOG/STATUS/behauptungen so eingestellt, zuletzt ff2466a). Kein PR nötig für Orchestrator-Dateien nach Protokoll 11.2.
- Merges laufen über das Konto Justus42. Zweige löschen verweigert die Plattform.
- GitHub-MCP kann Actions-Läufe und Job-Logs lesen: grünen Lauf auf main vor Statuswechsel selbst prüfen.
- Protokoll 0.3: Abbruchregel 2 zählt Runden ohne Fortschritt (6.2 a/b, Frist bis Ende der übernächsten Runde); jeder Runden-Eintrag im LOG nennt Zählerstand je Spur und Frist. openai/math in der Wache (Abschnitt 7).
- Stufe 2 (4×2×4): Spur B aufgegeben. Halt nach Runde 8 (Commit d72c1b1, 8 von 12): Auslegungsfrage an Justus offen, ob ein vom Prüfer gesehenes Prosa-Urteil den Aussagen-Abgleich entwertet. Zähler milde 2 von 3, streng wäre Spur A seit Runde 5 beendet. Vorschlag pruefvermerke/ nicht freigegeben. Geprüft: B-001, B-002, B-003, B-006, B-007, B-010, Kern von B-008/B-009.
- Grenze: höchstens 4 Subagenten pro Runde (einmal verletzt und behoben).

**How to apply:** LOG.md nur anhängen; Merge-Stand und Actions-Lauf vor Statuswechsel selbst prüfen; Abweichungen vom Protokoll an den Orchestrator melden. Verwandt: [[verfahren-datenformat]], [[schranken-befunde]]
