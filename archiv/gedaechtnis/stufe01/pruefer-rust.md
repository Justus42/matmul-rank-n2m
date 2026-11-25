---
name: pruefer-rust
description: Rust-Prüfprogramm pruefer/rust/: A-09 (PR #7), seit S1-08 (PR #17, 25.11.2026) an verfahren/README.md Abschnitt 9 angepasst, Status behauptet
metadata:
  type: project
  modified: 2026-11-25T04:55:48.707Z
---

A-09 geliefert: `pruefer/rust/` (cargo build --release; Binary `pruefer`), PR #7. Exakte Brüche (num-rational/num-bigint).

S1-08 (25.11.2026), PR #17 gemergt (1265218): an Abschnitt 9 angepasst. Zusatzschlüssel in origin jetzt FEHLERHAFT, leere/Leerraum-Strings, derived_from-Form, Jahr 0000, Kurzname-Bindestriche, BOM. Fund: Steuerzeichen im Grund brachen die FEHLERHAFT-Zeile um (9.7.6), jetzt als \u{a} escaped. 41 Tests grün, je Regel aus Abschnitt 9 eine Testfunktion r9_*. HK-Dateien 3x2x5-r25-hk71 und 3x2x6-r30-hk71 erneut ANGENOMMEN. Status behauptet.

**How to apply:** Beim Python-Gegenstück (Programm 1) auf denselben Zeilenumbruch-Fall achten (Koeffizient "1\n" im Grund). Siehe [[verfahren-randfaelle-s1-04]], [[verfahren-datenformat]].
