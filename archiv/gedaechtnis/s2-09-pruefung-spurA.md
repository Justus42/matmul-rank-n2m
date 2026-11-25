---
name: s2-09-pruefung-spurA
description: S2-09 (25.11.2026): Prüfer zu S2-05 Satz A/B; alles hält mit 2 kleinen Reparaturen, GPT gleich, B-008/B-009 behauptet; PR #42 gemergt
metadata:
  type: project
  modified: 2026-11-25T12:02:31.994Z
---

S2-09, Stufe 2 Runde 3, Prüfer Spur A, PR #42 gemergt (d972567). Bericht `lean/prosa/s2_444_spurA_r2_pruefung.md`, Code `versuche/s2-09-pruefung/`, neue Dateien `behauptungen/B-008.md` (Satz A) und `B-009.md` (Satz B), Status behauptet (Prosa kann nach 5.1 nicht geprüft werden). Übersicht in behauptungen/README.md nicht nachgetragen (Orchestrator).
- Urteil Prüfer und GPT 6.2 Sol (Batch, high) übereinstimmend: Satz A, A1, A2, Lemma 13′, Lemma S halten; Lemma V und Satz B halten mit R1 (Wahl von p: β_t(v_p⊗·) ≢ 0) und R2 (Anker in Lemma V (a)).
- GPT-Fund, nachgerechnet: V′ = ein einziges zulässiges u_0 mit N(u_0) ≠ 0 erzwingt Symmetrie (Schritt 1 genügt). Damit entfällt R2, Satz B gilt für jedes zulässige u_0. Für Lean V′ statt V nehmen.
- Bridge-Hinweis: ask_openrouter ohne Batch/mit low-Stufe wurde vom Klassifikator abgelehnt; Batch mit high und Text inline ging (9 min).
- Für geprüft fehlt Lean (Abschnitt 7 des Berichts); am schwersten Lemma S Teil 3.

Verwandt: [[s2-05-restfaelle-444]]
