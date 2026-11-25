---
name: pruefer-python-s1-07
description: S1-07 (25.11.2026): Python-Prüfer an Abschnitt 9 des Formats angepasst, PR #16 und #19 gemergt; Abgleich der beiden Prüfer noch offen
metadata:
  type: project
  modified: 2026-11-25T04:58:09.459Z
---

S1-07, 25.11.2026: `pruefer/python/` an Abschnitt 9 und 10 von `verfahren/README.md` angepasst. PR #16 (9440cca) und Nachtrag PR #19 (1c1d996) selbst gemergt. 27 → 89 Tests, Klassen `Test91Json` bis `Test97Output` nach Regelnummern benannt. Status behauptet.

- Beide Muss-Punkte erledigt: Kalenderdatum über `datetime.date` (9.3), GF(p) nur p < 2^64 (9.6.2).
- Alle „Prüfen"-Punkte aus Abschnitt 10 waren tatsächlich Abweichungen: BOM, einzelne Surrogate, `match` statt `fullmatch`, `\d` statt `[0-9]`, Leerraum-Zeichenketten, `derived_from`-Form, Kurzname-Form, Hinweiszeilen bei FEHLERHAFT, `FEHLERHAFT -` bei falscher Argumentzahl.
- Drei Funde über den Auftrag hinaus, die Programm 2 genauso betreffen könnten: (1) Pythons Grenze von 4300 Stellen bei str→int ließ ein richtiges Verfahren mit 5001-stelligem Koeffizienten mit Rückgabewert 1 (= ABGELEHNT) abstürzen, jetzt `sys.set_int_max_str_digits(0)`. (2) Ein Programmfehler gibt nun Rückgabewert 3 (`INTERNER-FEHLER`), damit ein Absturz nie wie ABGELEHNT aussieht. (3) Nachfrage des Orchestrators zu 9.7.6: der Koeffizient `"1\n"` war schon sicher (`%r`), aber ein Dateiname mit Zeilenvorschub brach die FEHLERHAFT-Zeile um; `one_line()` escapet jetzt alle nicht druckbaren Zeichen.
- `verfahren/3x2x5-r25-hk71.json` und `3x2x6-r30-hk71.json` bleiben ANGENOMMEN, Exit 0.

**How to apply:** Nach S1-08 (Rust, PR #17) sind beide Prüfer angepasst. Offen ist ein Abgleich-Auftrag, der beide Fassungen auf denselben Testfällen laufen lässt; erst dann ist Protokoll 5.2 wieder erfüllt. Verwandt: [[verfahren-randfaelle-s1-04]], [[pruefer-rust]], [[hk-verfahren-a10]]
