---
name: s2-11-pruefung-spurb
description: S2-11 (25.11.2026) Prüfung der SAT-Ausschlüsse S2-06 (B-011, behauptet) und R(4x2x4)<=26 (B-010, geprüft); PR #43 gemergt
metadata:
  type: project
  modified: 2026-11-25T12:22:03.436Z
---

S2-11, PR #43 gemergt (f6435f1). B-008/B-009 waren schon von S2-09 belegt, deshalb B-010 und B-011.
- B-010: verfahren/4x2x4-r26-s001.json, Python- und Rust-Prüfer ANGENOMMEN rc 0, Status geprüft (setzt Zähler Abbruchregel 2 nicht zurück).
- B-011: SAT-Ausschlüsse von S2-06 bestätigt, Status bleibt behauptet (Protokoll 5 kennt keinen Weg für SAT-Zertifikate; nötig wäre Lean-Fassung oder Protokollregel von Justus). Gilt nur für σ=(vᵀ,uᵀ,wᵀ); σ_J mit J=[[0,1],[1,0]] ist nicht konjugiert (Schulmethode σ_J-invariant mit 0 Fixprodukten) und nicht abgedeckt.
- Werkzeuge: eigener Kodierer behauptungen/B-011-anhang/genc.py, eigener LRAT-Prüfer lratchk (Rust). cake_lpr bauen lehnt der Klassifikator ab; kissat und drat-trim bauen geht.
- Eichung: kissat findet in 15 min nicht einmal die σ-invariante Schulmethode (Rang 32, f=8). Zeitüberschreitungen sagen nichts.

**How to apply:** Für weitere SAT-Spuren erst eine bessere Kodierung/Eichung, und σ_J als eigene Klasse behandeln. Verwandt: [[s2-06-sat-4x2x4]]
