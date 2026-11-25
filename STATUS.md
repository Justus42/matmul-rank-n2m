# Status

Zuletzt geändert: 25.11.2026 (Stufe 2, Runde 11 abgeschlossen, Orchestrator wartet auf Justus, Protokoll 0.4.1)

## Aktuelle Stufe

**Stufe 2: 4×2×4 (25 oder 26?)**

- Runden verbraucht: 11 von 24 (beide Spuren zusammen; Budget durch Justus von 12 auf 24 erhöht, Protokoll 0.4). Ab Runde 9 bis zu 6 Subagenten pro Runde
- Runde 9 abgeschlossen: 6 zählende Subagenten (S2-34, S2-35, S2-36, S2-41, S2-42, S2-43), dazu gestartet und ersetzt S2-37 bis S2-40, 0 Sol-Anfragen, 51 Minuten nach Git (626eb7b bis 9f5a928)
- Runde 10 abgeschlossen: 6 Subagenten (S2-44 bis S2-49), 0 Sol-Anfragen, 62 Minuten nach Git (8226274 bis 32f12f6). Neu: B-016 (Endsatz in Lean ohne Hypothese, `Transponiert444.rank_four_two_four_ge_26`), behauptet, Aussagen-Abgleich in Runde 11
- Vor Runde 11, Hausarbeit außerhalb der Runde (offen ausgewiesen): Kopfkommentare gesäubert, PR #80 (c3c3884), nur Kommentare, Lauf 86 (45699204903, Job 139504538345) grün, SORRY 0. Rest: `.github/scripts/lean_report.py` Zeile 43 trägt das Label „(R-C1)“, es erscheint im Log (offengelegte Spur)
- Runde 11 abgeschlossen: 5 Subagenten (S2-50 bis S2-54), 1 Sol-Anfrage, etwa 28 Minuten nach Git (Vergabe etwa 21:05 UTC bis b64e6c8). Dauern je Aufgabe: S2-50 etwa 3, S2-52 und S2-53 je etwa 5, S2-51 etwa 8, S2-54 etwa 28 Minuten
- Der Orchestrator vergibt nichts Neues und wartet auf Justus. Offen für Justus: Fertig-Kriterium und Freigabe als Ergebnis, Frist B-014, kurze Prüferdauern in Runde 11
- **B-016 geprüft** (Lean-Endsatz R(⟨4,2,4⟩) ≥ 26 über jedem Körper; Prüfer S2-50 und GPT 6.2 Sol S2-51). B-014 geprüft in Teilen (siehe `pruefvermerke/B-014.md`)
- Abbruchregel 2, Spur A (Übergangsregel Protokoll 0.4.1, Abschnitt 6, Lesart des Orchestrators): Die vier Aussagen-Abgleiche zu B-008, B-009, B-012 und B-013 sind in Runde 9 von gültigen Prüfern bestätigt (S2-42, S2-43), die Fristen aus Runde 3 und 6 gelten als gehalten. S2-41 bestätigt B-014, das zählt als Fortschritt in Runde 9, **Frist für geprüft: Ende Runde 11**. Zähler Spur A: Runde 9 mit Fortschritt, Runde 10 ohne, Runde 11 mit Fortschritt (B-016 geprüft, ändert die Schranke), also **0 von 3**. Frist B-014: Lesart des Orchestrators „für den Teil, der die Schranke ändert (F2), gehalten“, **offen für Justus zur Bestätigung**. **Spur B: aufgegeben**
- Fertig, wenn: entweder Lean-Beweis für 26 oder ein nach 5.2 bestätigtes Verfahren mit 25. Dann hält der Orchestrator an und berichtet an Justus (11.4). **Nach Sicht des Orchestrators erfüllt (B-016 geprüft).** Er hält nach Runde 11 an und meldet an Justus. Als „Ergebnis“ gilt es erst nach Freigabe durch Justus
- Stufe 3: erst nach Budget von Justus

## Aufträge für Stufe 2

| Nr. | Auftrag | Rolle | Zieldatei | Stand |
|---|---|---|---|---|
| S2-01 | Blind-Suche, nur mit der Problemstellung | Blind-Sucher | `versuche/s2-blind-r1.md` | erledigt in Runde 1, PR #34 |
| S2-02 | Spur A: Schranke 26 über 𝔽₂ mit Zertifikaten | Beweissucher | `lean/prosa/s2_444_spurA_r1.md`, `versuche/s2-spurA-r1/` | erledigt in Runde 1, PR #35. Zertifikat nur ≥ 22 über 𝔽₂ |
| S2-03 | Spur B: Suche nach einem Verfahren mit 25 Produkten | Verfahrenssucher | `versuche/s2-spurB-r1.md`, `verfahren/` | erledigt in Runde 1, PR #36. Kein 25er-Verfahren, dazu `verfahren/4x2x4-r26-s001.json` (behauptet) |
| S2-04 | Blind-Suche, Runde 2 | Blind-Sucher | `versuche/s2-blind-r2.md` | erledigt in Runde 2, PR #39 |
| S2-05 | Spur A: Yangs vier Restfälle und Lemma M | Beweissucher | `lean/prosa/s2_444_spurA_r2.md` | erledigt in Runde 2, PR #38. Satz A, Satz B; offen (3,6) und (5,8) |
| S2-06 | Spur B: SAT-Suche mit Symmetrieansatz, Flip-Graph über viele Familien | Verfahrenssucher | `versuche/s2-spurB-r2.md` | erledigt in Runde 2, PR #40 (Teilbericht). f = 5 bis 17 offen |
| S2-07 | Literaturwache, mit Frage nach dem Grenzrang von ⟨2,4,4⟩ | Literaturwächter | `lit/WACHE.md` | erledigt in Runde 2, PR #37. Grenzrang 22 bis 24 |
| S2-08 | Blind-Suche, Runde 3 | Blind-Sucher | `versuche/s2-blind-r3.md` | erledigt in Runde 3, PR #44 |
| S2-09 | Prüfung Spur A: Satz A, Satz B, Lemmata 13′, V, S, mit GPT 6.2 Sol | Prüfer | `behauptungen/B-008.md`, `B-009.md`, `lean/prosa/s2_444_spurA_r2_pruefung.md` | erledigt in Runde 3, PR #42 |
| S2-10 | Spur A: Restfälle (3,6) und (5,8) | Beweissucher | `lean/prosa/s2_444_spurA_r3.md` | zurückgezogen (Abschnitt 6), nichts geliefert, geht in S2-16 auf |
| S2-11 | Prüfung Spur B: DRAT-Ergebnisse, dazu Behauptungsdatei R(⟨4,2,4⟩) ≤ 26 | Prüfer | `behauptungen/B-010.md`, `B-011.md` | erledigt in Runde 3, PR #43 |
| S2-12 | Spur B: Eichung und Zerlegung der offenen SAT-Fälle | Verfahrenssucher | `versuche/s2-spurB-r3.md` | zurückgezogen (Abschnitt 6), nichts geliefert, wird nicht neu vergeben |
| S2-14 | Spur A: Lemma 13′ und Satz A (B-008) in Lean | Formalisierer | `lean/YangBounds/Lemma13Prime.lean`, `SatzA444.lean` | erledigt in Runde 4, PR #45 |
| S2-15 | Spur A: Lemma V (repariert), Lemma S und Satz B (B-009) in Lean, Aussagen aus S2-14 als Hypothesen | Formalisierer | `lean/YangBounds/SatzB444.lean`, `SatzB444Poly.lean` | erledigt in Runde 4, PR #48 |
| S2-16 | Spur A: Restfälle (3,6) und (5,8) in beide Richtungen | Beweissucher | `lean/prosa/s2_444_spurA_r4.md`, `behauptungen/B-012.md`, `B-013.md` | erledigt in Runde 4, PR #47. (3,6) und Unterfall A von (5,8) ausgeschlossen (behauptet), Unterfall B offen |
| S2-17 | Blind-Sucher als Beweissucher | Blind-Sucher | `versuche/s2-blind-r4.md` | erledigt in Runde 4, PR #46 |
| S2-18 | Spur A: unbedingte Fassung von Satz B aus Satz A und Satz B zusammensetzen | Formalisierer | `lean/YangBounds/SatzB444Final.lean` | erledigt in Runde 5, PR #49 |
| S2-19 | Spur A: Aussagen-Abgleich B-008, mit GPT 6.2 Sol | Prüfer | `behauptungen/B-008.md` | erledigt in Runde 5, PR #52. B-008 im Kern geprüft |
| S2-20 | Spur A: Aussagen-Abgleich B-009, mit GPT 6.2 Sol, prüft die Hypothesen selbst | Prüfer | `behauptungen/B-009.md` | erledigt in Runde 5, PR #51. B-009 im Rangteil geprüft |
| S2-21 | Blind-Sucher als Beweissucher | Blind-Sucher | `versuche/s2-blind-r5.md` | erledigt in Runde 5, PR #50 |
| S2-22 | Spur A: Prüfung B-012 (Satz C, Ausschluss von (3,6)), mit GPT 6.2 Sol | Prüfer | `lean/prosa/s2_444_spurA_r4_pruefung.md`, `versuche/s2-22/` | erledigt in Runde 6, PR #55. Satz C hält, C1 nur generisch (R-C1) |
| S2-23 | Spur A: Prüfung B-013 (Satz E, Unterfall A von (5,8)), mit GPT 6.2 Sol | Prüfer | `lean/prosa/s2_444_spurA_r4_pruefung_b013.md`, `versuche/s2-23-pruefung/` | erledigt in Runde 6, PR #56. Satz E hält, C2 und Lemma P mit Reparaturen |
| S2-24 | Spur A: Unterfall B von (5,8) in beide Richtungen | Beweissucher | `lean/prosa/s2_444_spurA_r6.md`, `behauptungen/B-014.md` | erledigt in Runde 6, PR #53. Satz F (Unterfall B unmöglich), neue Behauptung B-014; kein 25er-Verfahren |
| S2-25 | Blind-Sucher als Beweissucher | Blind-Sucher | `versuche/s2-blind-r6.md` | erledigt in Runde 6, PR #54. Lemma 2 (Starrheit), behauptet |
| S2-26 | Spur A: Satz C und generische Fassung von C1 (B-012) in Lean | Formalisierer | `lean/YangBounds/SatzC444Kern.lean`, `SatzC444Generisch.lean` | erledigt in Runde 7, PR #59. Ohne sorry; Symmetrie nur am generischen Punkt |
| S2-27 | Spur A: Satz E (B-013) in Lean, Nicht-Symmetrie als Hypothese | Formalisierer | `lean/YangBounds/SatzE444.lean`, `SatzE444Buendel.lean` | erledigt in Runde 7, PR #60. Ohne sorry; Lemma P nur als Hypothese |
| S2-28 | Spur A: Prüfung B-014 (Satz F), mit GPT 6.2 Sol | Prüfer | `lean/prosa/s2_444_spurA_r6_pruefung.md` | erledigt in Runde 7, PR #58. Hält mit Reparaturen R-K, R-F1 bis R-F3 |
| S2-29 | Blind-Sucher, Handkonstruktion | Blind-Sucher | `versuche/s2-blind-r7.md` | erledigt in Runde 7, PR #57. Kein 25er-Verfahren |
| S2-30 | Spur A: Aussagen-Abgleich B-012, mit GPT 6.2 Sol | Prüfer | `lean/prosa/s2_444_spurA_r8_abgleich_b012.md`, `behauptungen/B-012.md` | erledigt in Runde 8, PR #61. Teil G geprüft, unter Vorbehalt (Prüfer sah früheres Prüfurteil) |
| S2-31 | Spur A: Aussagen-Abgleich B-013 (Satz E), mit GPT 6.2 Sol | Prüfer | `lean/prosa/s2_444_spurA_r4_abgleich_b013.md`, `behauptungen/B-013.md` | erledigt in Runde 8, PR #62. Satz E geprüft, unter Vorbehalt (Prüfer sah früheres Prüfurteil) |
| S2-32 | Spur A: Lemma P in Lean | Formalisierer | `lean/YangBounds/LemmaP444.lean` | erledigt in Runde 8, PR #64. Ohne sorry, nur für unendliche Körper; Abgleich fehlt |
| S2-33 | Blind-Sucher | Blind-Sucher | `versuche/s2-blind-r8.md` | erledigt in Runde 8, PR #63. Keine Entscheidung |
| S2-34 | Spur A: Unterfall B in Lean (B-014) | Formalisierer | `lean/YangBounds/SatzF444.lean` | erledigt in Runde 9, PR #73 (9f5a928). Satz F mit benannten Hypothesen `TransponiertEng` und `VielePunkte alg 11`, Lemma K nicht formalisiert. Lauf 67 grün, SORRY 0, nur Standard-Axiome |
| S2-35 | Spur A: Brücke generisch zu algebraisch abgeschlossen in Lean, Weg über „Rang fällt bei Körpererweiterung“ prüfen | Formalisierer | `lean/YangBounds/Bruecke444.lean`, `lean/prosa/s2_444_spurA_r9_bruecke.md` | erledigt in Runde 9, PR #69 (deaea2e). Lauf 65 auf main grün (Job 139440176459), alle 27 Hauptsätze nur Standard-Axiome |
| S2-36 | Spur A: Zusammensetzen zum Endsatz mit benannten Hypothesen | Formalisierer | `lean/YangBounds/Endsatz444.lean` | erledigt in Runde 9, PR #65 (Merge 50e9ec1). Endsatz mit zwei benannten Hypothesen (Brücke, Unterfall B), Lauf 56 grün, 0 sorry (Lauf 57) |
| S2-37 | Spur A: frischer Prüfer B-014 | Prüfer | wählt der Prüfer | ungültig (Gedächtnis-Index und Abschnitt 5.4 in Fassung 0.4 verrieten das erwünschte Ergebnis), PR #68, ersetzt durch S2-41 |
| S2-38 | Spur A: frischer Prüfer, Aussagen-Abgleiche B-008 und B-009 | Prüfer | wählt der Prüfer | ungültig (wie S2-37), PR #66, ersetzt durch S2-42 |
| S2-39 | Spur A: frischer Prüfer, Aussagen-Abgleiche B-012 und Satz E aus B-013 | Prüfer | – | abgebrochen in Runde 9 nach unter einer Minute (Gedächtnis zeigte frühere Urteile), ersetzt durch S2-40 |
| S2-40 | Spur A: frischer Prüfer, Aussagen-Abgleiche B-012 und Satz E aus B-013 (Ersatz für S2-39) | Prüfer | wählt der Prüfer | ungültig (wie S2-37, Abgleich von Satz E gilt nicht), PR #67, ersetzt durch S2-43 |
| S2-41 | Spur A: Prüfer B-014 (letzte Wiederholung, Ersatz für S2-37) | Prüfer | `lean/prosa/s2_444_bericht_s2-41.md` | erledigt in Runde 9, PR #72. B-014 hält mit Reparaturen R-K, R-T, R-N. Gültig |
| S2-42 | Spur A: Prüfer, Aussagen-Abgleiche B-008 und B-009 (letzte Wiederholung, Ersatz für S2-38) | Prüfer | `lean/prosa/s2_444_bericht_s2-42.md` | erledigt in Runde 9, PR #70. B-008 und B-009 in den genannten Teilen bestätigt. Gültig |
| S2-43 | Spur A: Prüfer, Aussagen-Abgleiche B-012 und Satz E aus B-013 (letzte Wiederholung, Ersatz für S2-40) | Prüfer | `lean/prosa/s2_444_bericht_s2-43.md` | erledigt in Runde 9, PR #71. B-012 generisch und Satz E bestätigt. Gültig |
| S2-44 | Spur A: `TransponiertEng` (B3′) in Lean | Formalisierer | `lean/YangBounds/Transponiert444.lean` | erledigt in Runde 10, PR #77 (32f12f6). `rank_four_two_four_ge_26` ohne Hypothese, Lauf 84 (Job 139490596774), SORRY 0 |
| S2-45 | Spur A: Lemma K in Lean | Formalisierer | `lean/YangBounds/LemmaK444.lean` | erledigt in Runde 10, PR #78 (62fdd0a), Job 139468468902, SORRY 0 |
| S2-46 | Spur A: Lemma Z (`VielePunkte`) in Lean, Lemma K als benannte Hypothese | Formalisierer | `lean/YangBounds/LemmaZ444.lean` | erledigt in Runde 10, PR #75 (2f82634), Job 139479127631, SORRY 0 |
| S2-47 | Spur A: Prüfer, Aussagen-Abgleiche Lemma P (B-013) und Brücke (B-015) | Prüfer | `lean/prosa/s2_444_bericht_s2-47.md` | erledigt in Runde 10, PR #74. Lemma P und B-015 gedeckt. Gültig |
| S2-48 | Spur A: zweiter Prüfer, Aussagen-Abgleiche Lemma P (B-013) und Brücke (B-015), sieht S2-47 nicht | Prüfer | `lean/prosa/s2_444_bericht_s2-48.md` | erledigt in Runde 10, PR #76. Lemma P und B-015 gedeckt. Gültig |
| S2-49 | Blind-Suche, Runde 10 | Blind-Sucher | `versuche/s2-blind-r10.md` | erledigt in Runde 10, PR #79. Kein Verfahren mit 25, kein Beweis |
| S2-50 | Spur A: Prüfer, Aussagen-Abgleich B-016 (Endsatz) | Prüfer | `lean/prosa/s2_444_bericht_s2-50.md` | erledigt in Runde 11, PR #81. Alle drei Punkte stimmen überein |
| S2-51 | Spur A: Fremdmodell GPT 6.2 Sol, Aussagen-Abgleich B-016 | Fremdmodell-Abfrage | `lean/prosa/s2_444_bericht_s2-51.md` | erledigt in Runde 11, PR #84. 1 Anfrage, Urteil „agrees“ |
| S2-52 | Spur A: Prüfer, Aussagen-Abgleich B-014 | Prüfer | `lean/prosa/s2_444_bericht_s2-52.md` | erledigt in Runde 11, PR #83 |
| S2-53 | Spur A: zweiter Prüfer, Aussagen-Abgleich B-014, sieht S2-52 nicht | Prüfer | `lean/prosa/s2_444_bericht_s2-53.md` | erledigt in Runde 11, PR #82 |
| S2-54 | Blind-Suche, Runde 11 | Blind-Sucher | `versuche/s2-blind-r11.md` | erledigt in Runde 11, PR #85 (b64e6c8). Flip-Graph über GF(2), 4 × 25 Minuten, alle 26, keiner 25, kein Beweis. Gedächtnis-Einträge gelöscht (siehe LOG) |
| S2-13 | Literaturwache mit Nachprüfung von Justus' Hinweis zu openai/math | Literaturwächter | `lit/WACHE.md` | erledigt in Runde 3, PR #41 |

Grenze von Spur A (Literaturwache): Eine Schranke über 𝔽₂ schließt kein Verfahren über ℚ mit Nenner 2 aus.

## Fertig-Kriterium Stufe 2

- [ ] Lean-Beweis für 26 oder ein nach 5.2 bestätigtes Verfahren mit 25. Stand: B-016 geprüft; nach Sicht des Orchestrators erfüllt, Meldung an Justus nach Runde 11, Haken erst nach seiner Freigabe

## Offene Kleinigkeiten

- Label „(R-C1)“ in `.github/scripts/lean_report.py` Zeile 43, erscheint im Actions-Log (Rest aus PR #80)
- Veraltete Kommentare „open“ in `lean/YangBounds/Statements.lean` und `lean/YangBounds/Upper3x2x6.lean` (Nebenbefund S1-18)
- `lean/Axioms.lean` importiert das Wurzelmodul und lässt sich mit `lake env lean` nicht direkt ausführen
- Formatnachtrag: Rückgabewert 3 mit erster Zeile INTERNER-FEHLER, FEHLERHAFT nur für Eigenschaften der Datei, ein Lauf zählt nur, wenn erstes Wort und Rückgabewert zusammenpassen. Einarbeitung in `verfahren/README.md` und beide Programme wird in Stufe 2 vergeben

## Stufe 1: abgeschlossen

Abgeschlossen am 25.11.2026 nach 5 von 8 Runden.

Fertig-Kriterium Stufe 1, alle Punkte erfüllt:

- [x] Build grün ohne `sorry`: Actions-Lauf 45560784171 auf `main` (46f1038), `SORRY: 0`
- [x] Axiom-Prüfung bestanden: derselbe Lauf, für alle Hauptsätze nur `propext`, `Classical.choice`, `Quot.sound`
- [x] Aussagen-Abgleich bestanden: B-006 (S1-18) und B-007 (S1-19), je Prüfer und GPT 6.2 Sol

Ergebnisse mit Status geprüft: Yangs Satz 1 (B-002) und Satz 2 (B-003) als Yangs Sätze, B-006 (Rang von ⟨3,2,6⟩ ist 30), B-007 (Rang von ⟨4,2,4⟩ ist mindestens 25). Übersicht in `pruefvermerke/README.md`.

### Aufträge der Stufe 1

| Nr. | Auftrag | Zieldatei | Stand |
|---|---|---|---|
| S1-01 | Lean-Projektgerüst | `lean/` | erledigt in Runde 1, PR #15. Drei `sorry` offen (Satz 1, Satz 2, obere Schranke 30 für 3×2×6). Der Actions-Workflow baut `lean/` noch nicht |
| S1-02 | Prosa-Beweis der Schranke für n = 3 | `lean/prosa/yang_n3.md` | erledigt in Runde 1, PR #13 |
| S1-03 | Prosa-Beweis der Schranke für m ≥ n ≥ 4 | `lean/prosa/yang_n4.md` | erledigt in Runde 1, PR #14 (Lücke L5, Reparatur in S1-06 ohne Einwände) |
| S1-04 | Festlegung der zwei Randfälle im Format (Zusatzschlüssel, ungültige Kalenderdaten: beides FEHLERHAFT) | `verfahren/README.md` | erledigt in Runde 1, PR #12 |
| S1-05 | Prüfung des Prosa-Beweises für n = 3, Prüfer und Fremdmodell | `lean/prosa/yang_n3_pruefung.md` | erledigt in Runde 2, PR #20. Gegenlesen durch das Fremdmodell nur schwach (gekürzte Fassung), strenger Nachtrag entfällt nach Entscheidung von Justus |
| S1-06 | Prüfung des Prosa-Beweises für n ≥ 4, Schwerpunkt L5, Prüfer und Fremdmodell | `lean/prosa/yang_n4_pruefung.md` | erledigt in Runde 2, PR #18 |
| S1-07 | Python-Prüfprogramm an Abschnitt 9 und 10 des Formats anpassen | `pruefer/python/` | erledigt in Runde 2, PR #16 und #19 |
| S1-08 | Rust-Prüfprogramm an Abschnitt 9 und 10 des Formats anpassen | `pruefer/rust/` | erledigt in Runde 2, PR #17 |
| S1-09 | Formalisierung von Yangs Satz 1, Teil 1 nach Abschnitt 9 von `lean/prosa/yang_n3.md` | `lean/YangBounds/YangN3Teil1.lean` | erledigt in Runde 3, PR #21 |
| S1-10 | Formalisierung von Yangs Satz 1, Teil 2 | `lean/YangBounds/YangN3Teil2.lean` | erledigt in Runde 3, PR #23 |
| S1-11 | Formalisierung von Yangs Satz 1, Teil 3 | `lean/YangBounds/YangN3Teil3.lean` | erledigt in Runde 3, PR #22 |
| S1-12 | Obere Schranke 30 für 3×2×6 in Lean, aus dem Verfahren von A-10 | `lean/YangBounds/Upper3x2x6.lean` | erledigt in Runde 3, PR #24 |
| S1-13 | Satz 1 zusammensetzen und in `Statements.lean` einsetzen, dazu die obere Schranke 30 für 3×2×6 aus `Upper3x2x6.lean` einsetzen | `lean/YangBounds/YangN3.lean`, `CeilBound.lean`, `Statements.lean` | erledigt in Runde 4, PR #27 |
| S1-14 | Actions-Workflow für `lean/` mit Axiom-Bericht je Satz | `.github/workflows/lean-project.yml` | erledigt in Runde 4, PR #25 |
| S1-15 | Lemma 13 in reparierter Fassung | `lean/YangBounds/YangN4Lemma13.lean` | erledigt in Runde 4, PR #26 |
| S1-16 | Hauptbeweis von Satz 2 mit Lemma 13 als Hypothese | `lean/YangBounds/YangN4Haupt.lean` | erledigt in Runde 4, PR #28 |
| S1-17 | Satz 2 in `Statements.lean` einsetzen, `lean/README.md` nachführen | `lean/` | erledigt in Runde 5, PR #29 |
| S1-18 | Aussagen-Abgleich Satz 1 und Rang 3×2×6 = 30, Prüfer und GPT 6.2 Sol | `behauptungen/B-006.md` | erledigt in Runde 5, PR #32 |
| S1-19 | Aussagen-Abgleich Satz 2 und Rang 4×2×4 ≥ 25, Prüfer und GPT 6.2 Sol | `behauptungen/B-007.md` | erledigt in Runde 5, PR #30 |
| S1-20 | Abgleich beider Prüfprogramme | `pruefer/abgleich/` | erledigt in Runde 5, PR #31 |

## Stufe 0: abgeschlossen

Abgeschlossen am 25.11.2026 nach 3 Runden. Die dritte Runde lag über dem Startbudget von 2 und war durch Justus' Freigabe vom 25.11.2026 gedeckt (siehe LOG.md). Die Tabelle in PROTOKOLL.md Abschnitt 6 ist unverändert.

Fertig-Kriterium Stufe 0, alle Punkte erfüllt:

- [x] Lean-Build grün: GitHub Actions, Lauf 45518440779 (A-11, PR #9)
- [x] Axiom-Bericht liegt vor: `lean/NACHBAU.md` (PR #8), bestätigt im Actions-Lauf 45518440779
- [x] Tabelle in Abschnitt 2 bestätigt oder korrigiert: `lit/QUELLEN.md` (PR #4). Präzisierung bei 4×2×5, Status behauptet
- [x] Beide Prüfprogramme bestätigen mindestens zwei bekannte Verfahren: 3×2×5 mit 25 und 3×2×6 mit 30 über ℤ (A-10, PR #11), dazu Strassen

Ergebnisse mit Status geprüft: B-001 (Rang von ⟨3,2,5⟩ ist 25, über jedem Körper) und die obere Schranke 30 für ⟨3,2,6⟩ über ℤ. Übersicht in `pruefvermerke/README.md`.

### Aufträge der Stufe 0

| Nr. | Auftrag | Rolle | Zieldatei | Stand |
|---|---|---|---|---|
| A-01 | Lizenz des Repos fallnlove/mm325_proof feststellen. Vorher wird nichts daraus übernommen | Literaturwächter | `lit/LIZENZEN.md` | erledigt in Runde 1, PR #2 |
| A-02 | Lean-Repo zu 3×2×5 bauen, Axiom-Prüfung, Bericht | Formalisierer | `lean/NACHBAU.md` | erledigt in Runde 2, PR #8 |
| A-03 | Aussagen-Abgleich: Lean-Satz gegen Satz 1 in arXiv:2609.22054 | Prüfer | `behauptungen/B-001.md` | erledigt in Runde 3, PR #10 |
| A-04 | Tabelle aus Abschnitt 2 des Protokolls gegen die Originalarbeiten prüfen | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-05 | Quelle des Verfahrens mit 32 Multiplikationen für 4×2×5 finden | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-06 | Genaue Fundstelle von Shitovs Beweis für 2×2×m | Literaturwächter | `lit/QUELLEN.md` | erledigt in Runde 1, PR #4 |
| A-07 | Datenformat für Verfahren festlegen | Verfahrenssucher | `verfahren/README.md` | erledigt in Runde 1, PR #1 und #3 |
| A-08 | Prüfprogramm 1 (exakte Arithmetik) | Verfahrenssucher | `pruefer/python/` | erledigt in Runde 2, PR #6 |
| A-09 | Prüfprogramm 2 in anderer Sprache, ohne Blick auf Programm 1 | Verfahrenssucher | `pruefer/rust/` | erledigt in Runde 2, PR #7 |
| A-10 | Hopcroft-Kerr-Verfahren für 3×2×5 und 3×2×6 als Dateien anlegen und mit beiden Programmen prüfen | Verfahrenssucher | `verfahren/` | erledigt in Runde 3, PR #11 |
| A-11 | Lean-Build in GitHub Actions einrichten | Formalisierer | `.github/workflows/` | erledigt in Runde 3, PR #9 |

## Hinweise

- Literaturwache: openai/math steht seit Protokoll 0.3 in Abschnitt 7
- Erledigt: Der Halt nach Abbruchregel 2 ist aufgehoben (Entscheidung von Justus, Protokoll 0.3, siehe LOG.md)
- Erledigt heißt: Datei geliefert und auf `main`. Ein Merge ändert keinen Status. Den Status ändert nur die Prüfung nach Abschnitt 5
- Erledigt: Der Halt nach Abbruchregel 4 (L5, Lemma 13 in Yang v3) ist aufgehoben. Justus hat am 25.11.2026 entschieden: „Weiter, Reparatur prüfen lassen“ (siehe LOG.md)
- Budget: Justus hat am 25.11.2026 weitere Runden über das Startbudget hinaus nach Ermessen des Orchestrators freigegeben (siehe LOG.md)

## Sperren

- Spur B ist aufgegeben (Entscheidung von Justus, 25.11.2026). Keine allgemeine SAT- oder Flip-Graph-Suche mehr. Ein 25er-Verfahren darf nur ein Auftrag der Spur A aus den Restfällen bauen (Abschnitt 3)
- Fremdmodelle vorerst nur bei kritischen Punkten (Entscheidung von Justus, 25.11.2026, siehe LOG.md): Aussagen-Abgleiche nach 5.1 Punkt 3 und Befunde, die eine Abbruchregel berühren. Dafür GPT 6.2 Sol mit hoher Denkstufe als Batch über die Bridge. Das Gegenlesen von Prosa vor einer Formalisierung entfällt vorerst
- Keine Arbeit an Stufe 3 ohne Budget von Justus
- Fremder Code nur nach der Lizenzregel (Protokoll Abschnitt 11.3)
