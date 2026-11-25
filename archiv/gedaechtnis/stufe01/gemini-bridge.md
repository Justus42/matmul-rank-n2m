---
name: gemini-bridge
description: Gemini Bridge fürs Fremdmodell-Gegenlesen: Repo-Freigabe fehlt für matmul-rank-n2m und fallnlove, Zeitlimit 60 s
metadata:
  type: reference
  modified: 2026-11-25T00:32:01.590Z
---

Stand 25.11.2026 (A-03):
- `ask_gemini` mit `repo`/`files` geht nur für freigegebene Repos. Justus42/matmul-rank-n2m und fallnlove/mm325_proof sind **nicht** freigegeben. Inhalte deshalb wörtlich in `prompt` einfügen (Auszüge, Beweise weglassen).
- Das MCP-Werkzeug bricht nach 60 s ab (Ergebnis unbekannt). Mit Denkstufe high und ca. 12 KB Eingabe: Zeitüberschreitung. Mit Denkstufe low und `max_output_tokens` 8000: Antwort in Ordnung (~0,03 $).
- Für Unabhängigkeit nach Protokoll 4/5.1: dem Fremdmodell kein eigenes Urteil zeigen, offene Fragen mit JA/NEIN/TEILWEISE stellen.

Verwandt: [[git-regeln]]

Stand 25.11.2026 05:10 (S1-05 Nachtrag): Gemini-Projekt hat die **monatliche Ausgabengrenze** erreicht, Batch-Auftrag abgelehnt. Orchestrator: kein Ausweichen auf OpenRouter (Budgetgrenze von Justus). Wenn Justus die Grenze anhebt: yang_n3.md ungekürzt als Batch (gemini-4-carbon, high) erneut abgeben, Ergebnis als Nachtrag in lean/prosa/yang_n3_pruefung.md, PR „S1-05 Nachtrag“.
