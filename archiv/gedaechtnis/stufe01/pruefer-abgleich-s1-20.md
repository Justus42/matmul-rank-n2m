---
name: pruefer-abgleich-s1-20
description: S1-20 (25.11.2026): Abgleich Python- gegen Rust-Prüfer auf 278 Fällen, alle gleich; PR #31 gemergt; Vorschlag Rückgabewert 3 offen beim Orchestrator
metadata:
  type: project
  modified: 2026-11-25T06:28:18.735Z
---

S1-20, 25.11.2026: `pruefer/abgleich/` (gen_cases.py, faelle/, abgleich.py, BERICHT.md), PR #31 gemergt (90d46c1). 278 Fälle, beide Prüfer stimmen in erstem Wort und Rückgabewert überall überein und mit der Erwartung. Status behauptet.

- Befund 1: Ausgabe nicht schreibbar (/dev/full, Broken pipe): Python Rückgabewert 1 (wie ABGELEHNT, entgegen eigener README), Rust 101 (Panik).
- Befund 2: Speichermangel: Rust FEHLERHAFT/2 beim Einlesen oder Abbruch 134; Python INTERNER-FEHLER/3.
- Vorschlag: 3 + `INTERNER-FEHLER` ins Format; FEHLERHAFT nur für Dateieigenschaften; Auswertung nur bei passendem Paar (ANGENOMMEN/0, ABGELEHNT/1, FEHLERHAFT/2), sonst „kein Ergebnis“.
- Beide Prüfer brauchen ~1 min für Koeffizienten mit 200 000 Stellen.

**How to apply:** Nach Änderungen an einem Prüfer `python3 pruefer/abgleich/abgleich.py` laufen lassen (Rust vorher bauen). Verwandt: [[pruefer-python-s1-07]], [[pruefer-rust]]
