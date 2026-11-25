---
name: yang-n4-prosa
description: S1-03 Prosa-Beweis Yang v3 Satz 2 (n≥4) in lean/prosa/yang_n4.md, PR #14 gemergt, keine echte Lücke, L5 in Lemma 13
metadata:
  type: project
  modified: 2026-11-25T00:40:38.116Z
---

Stand 25.11.2026: Auftrag S1-03 erledigt, `lean/prosa/yang_n4.md` auf main (PR #14, Commit 0fda45b), Status behauptet.
- Keine mathematische Lücke in Yang v3 Satz 2 gefunden, Abbruchregel 4 nicht berührt.
- Sieben Darstellungslücken L1–L7; schwerste L5: Beweis von Lemma 13 im Paper falsch aufgeschrieben (Γ wörtlich 0, L̄/H̄ nur über Quotient Q/im F₁ wohldefiniert), Reparatur in Abschnitt 6 der Datei.
- Fall n=4 braucht algebraisch abgeschlossenen Körper (Lemma 9), nicht nur unendlich.
- Vermutet: Beweis braucht nur m ≥ n−1.

**Why:** Grundlage für Lean-Formalisierung in Stufe 1.
**How to apply:** Vor Formalisierung Prüfer + Fremdmodell (Protokoll Abschn. 4) auf diese Datei ansetzen. Verwandt: [[schranken-befunde]]
