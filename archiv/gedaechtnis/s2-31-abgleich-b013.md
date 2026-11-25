---
name: s2-31-abgleich-b013
description: S2-31 (25.11.2026): Aussagen-Abgleich B-013, Satz E (satzE) geprüft, Lemma P/C2-offene-Menge/Unterfall B/Kubiken behauptet; PR #62 gemergt
metadata:
  type: project
  modified: 2026-11-25T17:16:42.129Z
---

S2-31, Stufe 2 Runde 8, Spur A, Prüfer. PR #62 gemergt (26241ed). Bericht `lean/prosa/s2_444_spurA_r4_abgleich_b013.md`, GPT-Belege `versuche/s2-31-abgleich/`. B-013.md Status nachgetragen.
- Actions 45658431578 auf b8cee48 grün, SORRY 0, Standard-Axiome.
- Prüfer und GPT 6.2 Sol (Batch high, 8 min, 0,05 $): `satzE` entspricht Satz E, stärker. Geprüft: Satz E, dazu `commonKernel_trivial`, `sDim_eq_one` als Teilaussage.
- Behauptet: Lemma P (nur `LemmaPStatement`), C2 offene Menge P_ns (Chevalley fehlt), nur Unterfall B (bedingt), Transponierte, Kubiken.
- Hinweise für spätere Aufträge: `LemmaPStatement` ist für beliebigen Körper formuliert, Beweis über IsAlgClosed zeigen; gilt für alle Normalformen mit N=0, nicht nur generische u_0. `satzE_global`/`nur_unterfallB_global` binden alg' nicht an alg; für die Verkettung mit B-012 braucht es einen Satz, der Nicht-Symmetrie auf alg' überträgt.
- Unabhängigkeit: B-013.md-Prüfzeile (S2-23) und Gedächtnis zu S2-23 vor eigenem Urteil gesehen, offengelegt; GPT bekam nichts davon.

Verwandt: [[s2-27-satzE-lean]], [[gemini-bridge]]
