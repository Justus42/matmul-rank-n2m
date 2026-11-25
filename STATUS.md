# Status

Zuletzt geändert: 25.11.2026 (Stufe 2, Runde 8 läuft)

## Aktuelle Stufe

**Stufe 2: 4×2×4 (25 oder 26?)**

- Runden verbraucht: 7 von 12 (beide Spuren zusammen)
- Runde 8 läuft: S2-30, S2-31, S2-32, S2-33
- Abbruchregel 2 (Protokoll 0.3), Spur A: Runde 6 bringt Fortschritt nach b), Runde 7 nicht, weil der Prüfer von B-014 frühere Prüfurteile gesehen hat (Lesart des Orchestrators, siehe LOG.md). Zähler: **1 von 3**. Frist: B-012 und B-013 geprüft bis Ende Runde 8; hält nur ein Teil, trägt dieser Teil Runde 6, solange er einen benannten Fall ausschließt. Runde 8 zählt nichts neu; ohne anderes Ergebnis steht Spur A danach bei 2 von 3. B-014 wird in Runde 9 von einem unbeeinflussten Prüfer und GPT neu geprüft. **Spur B: aufgegeben** (drei Runden ohne Fortschritt)
- Fertig, wenn: entweder Lean-Beweis für 26 oder ein nach 5.2 bestätigtes Verfahren mit 25. Dann hält der Orchestrator an und berichtet an Justus (11.4)
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
| S2-31 | Spur A: Aussagen-Abgleich B-013 (Satz E), mit GPT 6.2 Sol | Prüfer | `behauptungen/B-013.md` | vergeben in Runde 8 |
| S2-32 | Spur A: Lemma P in Lean | Formalisierer | eigene Dateien unter `lean/YangBounds/` | vergeben in Runde 8 |
| S2-33 | Blind-Sucher | Blind-Sucher | `versuche/s2-blind-r8.md` | vergeben in Runde 8 |
| S2-13 | Literaturwache mit Nachprüfung von Justus' Hinweis zu openai/math | Literaturwächter | `lit/WACHE.md` | erledigt in Runde 3, PR #41 |

Grenze von Spur A (Literaturwache): Eine Schranke über 𝔽₂ schließt kein Verfahren über ℚ mit Nenner 2 aus.

## Fertig-Kriterium Stufe 2

- [ ] Lean-Beweis für 26 oder ein nach 5.2 bestätigtes Verfahren mit 25

## Offene Kleinigkeiten

- Veraltete Kommentare „open“ in `lean/YangBounds/Statements.lean` und `lean/YangBounds/Upper3x2x6.lean` (Nebenbefund S1-18)
- `lean/Axioms.lean` importiert das Wurzelmodul und lässt sich mit `lake env lean` nicht direkt ausführen
- Formatnachtrag: Rückgabewert 3 mit erster Zeile INTERNER-FEHLER, FEHLERHAFT nur für Eigenschaften der Datei, ein Lauf zählt nur, wenn erstes Wort und Rückgabewert zusammenpassen. Einarbeitung in `verfahren/README.md` und beide Programme wird in Stufe 2 vergeben

## Stufe 1: abgeschlossen

Abgeschlossen am 25.11.2026 nach 5 von 8 Runden.

Fertig-Kriterium Stufe 1, alle Punkte erfüllt:

- [x] Build grün ohne `sorry`: Actions-Lauf 45560784171 auf `main` (46f1038), `SORRY: 0`
- [x] Axiom-Prüfung bestanden: derselbe Lauf, für alle Hauptsätze nur `propext`, `Classical.choice`, `Quot.sound`
- [x] Aussagen-Abgleich bestanden: B-006 (S1-18) und B-007 (S1-19), je Prüfer und GPT 6.2 Sol

Ergebnisse mit Status geprüft: Yangs Satz 1 (B-002) und Satz 2 (B-003) als Yangs Sätze, B-006 (Rang von ⟨3,2,6⟩ ist 30), B-007 (Rang von ⟨4,2,4⟩ ist mindestens 25). Übersicht in `behauptungen/README.md`.

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

Ergebnisse mit Status geprüft: B-001 (Rang von ⟨3,2,5⟩ ist 25, über jedem Körper) und die obere Schranke 30 für ⟨3,2,6⟩ über ℤ. Übersicht in `behauptungen/README.md`.

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
