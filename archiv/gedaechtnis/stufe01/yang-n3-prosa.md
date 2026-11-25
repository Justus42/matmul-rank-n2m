---
name: yang-n3-prosa
description: S1-02 Prosa-Beweis Yang v3 Satz 1 (n=3) in lean/prosa/yang_n3.md, PR #13 gemergt; keine Lücke, TPSR-Lean reicht für m≢1 mod 5
metadata:
  type: project
  modified: 2026-11-25T00:40:01.889Z
---

Stand 25.11.2026, Auftrag S1-02 (Stufe 1, Runde 1): `lean/prosa/yang_n3.md` auf main (PR #13, Merge d003ed0). Status behauptet.
- Keine Lücke in Yang v3 für n=3 gefunden; sechs Ungenauigkeiten U-1..U-6 (u. a. falsche Basiswechsel-Formel in Abschn. 2, Schreibfehler).
- n=3 braucht nur unendlichen Körper (Lemma 9 / alg. Abschluss unnötig); Beweis gilt schon für m ≥ 2.
- TPSR-Lean-Satz (5R ≥ 24m+1) ergibt Yangs Schranke schon für m ≢ 1 (mod 5); neues Argument nur für m ≡ 1 mod 5 (u. a. 3×2×6). 3×2×7-Schranke 34 folgt schon aus TPSR.
- Formalisierung lässt sich in 3 unabhängige Teile schneiden (Körpererweiterung, starke Normalisierung, lineare Algebra ab SN1/SN2), siehe Abschnitt 9 der Datei.
- Fremdmodell-Gegenlesen: in S1-05 erledigt (schwach, siehe unten).

**How to apply:** Für Stufe-1-Aufträge (Formalisierer) diese Datei als Vorlage nennen. Verwandt: [[schranken-befunde]]

Prüfung S1-05 (25.11.2026, PR #20, Merge ddebdc0): lean/prosa/yang_n3_pruefung.md, Urteil **keine Einwände**, Status bleibt behauptet. Anmerkungen: U-5 nur Identifikationsfrage; Yangs Einleitung gibt TPSR falsch als R > ⌈24m/5⌉ wieder; Lemma F braucht nur SN1, SN2 nur Lemma B. Fremdmodell gemini-4-carbon (low, gekürzte Eingabe) bestätigt; strengeres Gegenlesen per Bridge-Batch mit hoher Denkstufe wäre möglich.
