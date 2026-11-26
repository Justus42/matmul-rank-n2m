# Status

Zuletzt geändert: 26.11.2026 (Stufe 4, Runde 3 vergeben etwa 09:53 UTC; Zähler je 1 von 3)

## Aktuelle Stufe

**Stufe 4: enger Angriff auf 3×2×7 (34 oder 35?)** (Protokoll 0.6, Abschnitt 3): läuft. Die Pause bis 29.11.2026 (Justus, 08:23 UTC) hat Justus um 09:47 UTC aufgehoben, Runde 3 darf starten

- Von Justus gestartet am 26.11.2026, 06:43 UTC (Wortlaut im Logbuch). Protokoll 0.6 (c721297) von ihm bestätigt
- Budget: 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5. Grundlage: `erkundung/s3-08-einschaetzung-327.md`
- Runde 1 ist nur Prüfung der Grundlage: Prüfer für die Restfall-Rechnung, für Lemma 15(b) bei d = 2 und für die Übertragung von Lemma I auf die Normalform, dazu die Nachrechnung des Verfahrens mit 35 nach 5.2 und der Blind-Sucher. Ab Runde 2 Spur A (Ausschluss des Restfalls) und Spur B (Suche nach 34)
- Literaturwache vor Runde 1, außerhalb der Runde: erledigt, PR #102 (Merge 2335284), etwa 6 Minuten nach Git (06:45:26 bis 06:51:14 UTC), 1 Subagent, 0 Fremdmodell-Anfragen. Nichts zu 35 oder 34 gefunden, Abbruchregel 3 greift nicht. Nebenergebnis: Verfahren mit 35 unter MIT bei dronperminov/FastMatrixMultiplication
- Behauptungsdateien für Runde 1: `behauptungen/B-017.md` (Restfall-Rechnung), `behauptungen/B-018.md` (Lemma 15(b) bei d = 2), `behauptungen/B-019.md` (Übertragung von Lemma I, Wortlaut der Aussage vom Orchestrator). Status behauptet (`pruefvermerke/`)
- Runde 1 von 6 vergeben etwa 06:52 UTC: 5 Subagenten, 0 Fremdmodell-Anfragen. S4-01 bis S4-03 Prüfer für B-017 bis B-019, S4-04 Verfahren mit 35 anlegen und nachrechnen, S4-05 Blind-Sucher. Die Berichte S3-03 und S3-04 stehen auf keiner Positivliste
- Runde 1 von 6 abgeschlossen: 5 Subagenten, 0 Fremdmodell-Anfragen, etwa 48 Minuten nach Git (06:52 UTC bis 412ad8b um 07:40:05 UTC). Haltebedingung nicht erfüllt (Lesart c). B-017 bis B-019 behauptet, von einem Prüfer bestätigt. B-020 (obere Schranke 35) behauptet
- Abbruchregel 2: Lesart (d) des Orchestrators gilt nicht (Justus, 26.11.2026, 09:47 UTC). Die Spuren gibt es erst ab Runde 2. Zähler nach Runde 2: Spur A 1 von 3, Spur B 1 von 3
- Literaturwache vor Runde 3: PR #115 (Merge 35e2449), etwa 3 Minuten nach Git, nichts gefunden, Abbruchregel 3 greift nicht. 1 Subagent, 0 Fremdmodell-Anfragen
- Runde 3 von 6 vergeben etwa 09:53 UTC: 6 Subagenten (S4-12 bis S4-17), Fremdmodell höchstens zwei Sol-Anfragen, keine ohne Prüferbestätigung, bisher 0. Bleibt offen bis zur Sol-Antwort zu S4-07-D oder bis feststeht, dass keine Anfrage gestellt wird (Lesart f)
- Runde 2 von 6 vergeben: S4-06 bis S4-09 etwa 07:42 UTC, S4-10 und S4-11 etwa 07:43 UTC nach Durchsicht des Gedächtnisses. 6 Subagenten, Fremdmodell in dieser Runde nicht geplant
- Runde 2 von 6 abgeschlossen: 6 Subagenten, 0 Fremdmodell-Anfragen, etwa 50 Minuten nach Git (07:42 UTC bis 78ce5f9 um 08:31:52 UTC). Kein Ausschluss, kein Verfahren mit 34. Zähler nach Justus (09:47 UTC): Spur A 1 von 3, Spur B 1 von 3
- Lesart (e): Rechenblöcke direkt hintereinander ohne Commit dazwischen zählen als ein Block. S4-05 hat damit die Grenze von 30 Minuten überschritten (etwa 38 Minuten), Regelverstoß ohne weitere Folge
- B-020 (R(⟨3,2,7⟩) ≤ 35 über ℤ, also über jedem Körper): **geprüft** nach 5.2, Läufe wiederholt durch S4-10. Kein Fortschritt nach Abbruchregel 2 (Lesart des Orchestrators)
- Fertig mit einem Lean-Satz für die untere Schranke 35 über jedem Körper (geprüft nach 5.1 samt Abgleich des Endsatzes), einem nach 5.2 bestätigten Verfahren mit 34, erschöpftem Budget oder wenn eine Abbruchregel beide Spuren beendet
- Kein Kontakt nach außen. README und `ergebnisse/` bleiben unverändert

## Wiederaufnahme

Entscheidung von Justus vom 26.11.2026, 08:23 UTC: Runde 2 abschließen, dann Pause bis Sonntag, 29.11.2026. Die Pause zählt nicht als Runde und löst keine Abbruchregel aus. **Am 26.11.2026 um 09:47 UTC hat Justus die Pause aufgehoben, Runde 3 darf starten** (beides im Wortlaut im Logbuch).

**Stand bei der Pause** (Runde 2 abgeschlossen, 26.11.2026, 08:31 UTC)

- Budget Stufe 4: 2 von 6 Runden verbraucht (Runde 1: 5 Subagenten, Runde 2: 6 Subagenten), 0 Fremdmodell-Anfragen in der Stufe. Verbleibend: 4 Runden
- Zähler Abbruchregel 2 (Wortlaut Justus, 09:47 UTC): „Zähler nach Runde 2: Spur A 1 von 3, Spur B 1 von 3.“ Lesart (d) gilt nicht
- Laufende Fristen nach Abbruchregel 2 b): keine. In Stufe 4 gibt es bisher keine Behauptung, die ein Prüfer und ein Fremdmodell bestätigt haben
- Weitere Fristen: keine mit Datum (die Pause bis 29.11.2026 ist aufgehoben). Offener Punkt ohne Frist: Auflage 7 aus Stufe 2 (Endsatz von mm325_proof entkoppeln, „nicht jetzt“)
- Geprüft in Stufe 4: B-020 (R(⟨3,2,7⟩) ≤ 35 über ℤ und jedem Körper, nach 5.2). Behauptet, von einem Prüfer bestätigt: B-017, B-018, B-019. Axiom-Bericht für `lemma15b` und `lemma_I` seit S4-09 vorhanden
- Rang von ⟨3,2,7⟩: 34 oder 35, nicht entschieden

**Zu beachten bei der Wiederaufnahme**

- Literaturwache nach Abschnitt 7 zu Beginn der neuen Sitzung, vor jeder anderen Arbeit
- Gedächtnis-Durchsicht durch die Schreibhand vor der Vergabe an Prüfer und Blind-Sucher (für Runde 3 erledigt)
- Eine Runde 3 ohne Fortschritt bringt beide Spuren auf 2 von 3, beendet also keine Spur

**Erste Aufträge für Runde 3: Plan des Orchestrators vom 26.11.2026.** Bei Wiederaufnahme gegen Abschnitt 3 des Protokolls und den dann geltenden Stand neu zu lesen.

Vor der Runde:

- Literaturwache nach Abschnitt 7 (neue Sitzung)
- Gedächtnisdurchsicht vor der Vergabe an Prüfer und Blind-Sucher
- Antwort von Justus zu Lesart (d): **erfüllt** (26.11.2026, 09:47 UTC, Lesart (d) gilt nicht)
- Gedächtnisdurchsicht: **erledigt** (etwa 09:52 UTC, nichts gefunden, was nicht hingehört)

Aufträge:

1. Spur A: Ausschluss im Fall e = 3 ohne (INJ5), also S4-07-V bzw. L-2, als Prosa-Beweis
2. Spur A: der Fall e ≤ 2 (L-1), Ausschluss oder Bau
3. Prüfer: S4-07 Teile A bis E, vor allem der bedingte Ausschluss D und Satz X
4. Prüfer: S4-06 A1 bis A6 zusammen mit Satz G aus S4-11 und Satz K aus S4-08, soweit sie dieselbe Struktur behaupten (genaue Dateipfade im Auftrag)
5. Spur B: Suche nach 34 mit den erzwungenen Kenngrößen, erst nach bestandener Positivprobe bei 35 mit demselben Werkzeug und über einem Körper, über dem die starke Normalform für die bekannten Verfahren zulässig ist
6. Blind-Sucher für 3×2×7

**Vorgaben von Justus für Runde 3 (26.11.2026, 09:47 UTC), zusätzlich zum Plan:**

1. Der Prüfer für S4-07 hat Vorrang. Bestätigt er den bedingten Ausschluss S4-07-D, wird die Fallunterscheidung des Restfalls als eigene Behauptung angelegt (e = 3 mit (INJ5), e = 3 ohne (INJ5), e ≤ 2) und eine Sol-Anfrage zu S4-07-D eingeholt. Bestätigen beide, zählt das als Fortschritt von Spur A nach 2 b) in Runde 3, mit der üblichen Frist (Status geprüft bis Ende der übernächsten Runde, also Ende Runde 5)
2. Satz X (S4-07-E) zählt nicht als Fortschritt
3. Höchstens zwei Sol-Anfragen in der Runde, keine ohne vorherige Bestätigung durch einen Prüfer
4. Spur B: zuerst die Positivprobe bei 35. Findet das Werkzeug das bekannte Verfahren nicht, endet der Auftrag mit diesem Befund und sucht nicht bei 34

Sonst gilt der Plan oben.

Lesart (f) des Orchestrators: Die Sol-Anfrage zu S4-07-D ist eine Anfrage des Orchestrators nach 5.5, kein Subagenten-Auftrag nach Abschnitt 6. Runde 3 bleibt offen, bis die Sol-Antwort da ist oder feststeht, dass keine Anfrage gestellt wird.

Behauptungsdateien für die Prüfer von Runde 3: B-021 (S4-07-A bis E, D einzeln), B-022 (S4-06 A1 bis A6), B-023 (Satz G), B-024 (Satz K), alle behauptet. Nächste freie Auftragsnummer: S4-12

Für alle: Aufträge hängen nicht voneinander ab. Rechenblöcke höchstens 30 Minuten auf 4 Kernen, mit Commit dazwischen (Lesart e, in jeden Auftrag). Keine eigenen Subagenten. Fremdmodell nur nach 5.5, falls ein Ausschluss aus 1 oder 2 als Fortschritt nach 2 b) zählen soll.

## Aufträge für Stufe 4

| Nr. | Auftrag | Rolle | Zieldatei | Stand |
|---|---|---|---|---|
| S4-01 | Prüfung B-017 (Restfall-Rechnung, alle Bedingungen samt C1) | Prüfer | `lean/prosa/s4_327_bericht_s4-01.md` | erledigt, PR #106 (Merge 9541f51). B-017 hält (T7 nicht entscheidbar). Behauptet, von einem Prüfer bestätigt |
| S4-02 | Prüfung B-018 (Lemma 15(b) bei d = 2) | Prüfer | `lean/prosa/s4_327_bericht_s4-02.md` | erledigt, PR #105 (Merge ed289e7). B-018 hält, Zahlenform mit Reparatur, Axiom-Bericht für `lemma15b` fehlt. Behauptet, von einem Prüfer bestätigt |
| S4-03 | Prüfung B-019 (Übertragung von Lemma I) | Prüfer | `lean/prosa/s4_327_bericht_s4-03.md` | erledigt, PR #103 (Merge c2b1de9). B-019 hält, Axiom-Bericht für `lemma_I` fehlt. Behauptet, von einem Prüfer bestätigt |
| S4-04 | Verfahren mit 35 für 3×2×7 anlegen und nachrechnen (5.2) | Rechner | Datei unter `verfahren/`, `verfahren/3x2x7-r35-nachrechnung.md` | erledigt, PR #104 (Merge 0e3327f), `verfahren/3x2x7-r35-hk71.json`. Beide Prüfprogramme ANGENOMMEN, vom Ersteller gestartet. Behauptet bis zur Wiederholung durch einen getrennten Prüfer (Runde 2) |
| S4-05 | Blind-Sucher | Blind-Sucher | `versuche/s4-blind-r1.md` | erledigt, PR #107 (Merge 412ad8b), `versuche/s4-blind-r1.md`. Nicht entschieden, alles behauptet |
| S4-06 | Spur A: Ausschluss des Restfalls | Beweissucher | `lean/prosa/s4_327_spurA_r2_ausschluss.md` | erledigt, PR #111 (Merge dfd239e). Restfall nicht ausgeschlossen, Lücke Λ, A1 bis A6 behauptet |
| S4-07 | Spur A, Gegenrichtung: aus dem Restfall ein Verfahren mit 34 bauen oder Hindernis benennen | Beweissucher | `lean/prosa/s4_327_spurA_r2_bau.md` | erledigt, PR #113 (Merge 81fa438). Kein Verfahren gebaut, S4-07-A bis E behauptet, Vermutung S4-07-V, Lücken L-1 bis L-4 |
| S4-08 | Spur B: Suche nach 34 mit den erzwungenen Kenngrößen | Verfahrenssucher | `versuche/s4-spurB-r2.md` | erledigt, PR #114 (Merge 78ce5f9). Kein Verfahren mit 34, Werkzeug nicht geeicht (Positivprobe bei 35 ohne Fund). Satz K behauptet |
| S4-09 | Axiom-Bericht für `lemma15b` und `lemma_I` in Actions (nur Workflow) | Lean-Wartung | Workflow | erledigt, PR #108 (Merge 1e4f7b8) und #112 (Merge 645af03). Lauf 45778891656, Job 139769322302: `lemma15b_core`, `lemma15b`, `lemma_I` nur Standard-Axiome, SORRY 0 |
| S4-10 | Prüfung B-020, Wiederholung beider Läufe | Prüfer | `verfahren/3x2x7-r35-pruefung-s4-10.md` | erledigt, PR #109 (Merge e715211). B-020 geprüft nach 5.2 |
| S4-11 | Blind-Sucher | Blind-Sucher | `versuche/s4-blind-r2.md` | erledigt, PR #110 (Merge 0ee499f). Satz G behauptet, keine Schranke über 34. Blindheit eingeschränkt (vier Einzeleinträge eingeblendet) |
| S4-12 | Prüfung B-021 (D zuerst und einzeln) | Prüfer | `lean/prosa/s4_327_bericht_s4-12.md` | vergeben in Runde 3 |
| S4-13 | Prüfung B-022, B-023, B-024 | Prüfer | `lean/prosa/s4_327_bericht_s4-13.md` | vergeben in Runde 3 |
| S4-14 | Spur A: e = 3 ohne (INJ5), beide Richtungen | Beweissucher | `lean/prosa/s4_327_spurA_r3_e3.md` | vergeben in Runde 3 |
| S4-15 | Spur A: e ≤ 2, Ausschluss oder Bau | Beweissucher | `lean/prosa/s4_327_spurA_r3_e2.md` | vergeben in Runde 3 |
| S4-16 | Spur B: Positivprobe bei 35, nur bei Bestehen Suche nach 34 | Verfahrenssucher | `versuche/s4-spurB-r3.md` | vergeben in Runde 3 |
| S4-17 | Blind-Sucher | Blind-Sucher | `versuche/s4-blind-r3.md` | vergeben in Runde 3 |

## Stufe 3: abgeschlossen

**Stufe 3: Erkundung 4×2×5 (Länge 31) und 3×2×7 (Länge 34)** (Protokoll 0.5, Abschnitt 3): abgeschlossen

- Budget: 2 Runden mit je bis zu 6 Subagenten, keine Fremdmodell-Anfrage, keine eigenen Subagenten der Threads. Kein Beweisangriff. Nichts erhält den Status geprüft außer einem nach 5.2 bestätigten Verfahren
- Begonnen 26.11.2026, nachdem die Auflagen 1 bis 8 der Freigabe zu Stufe 2 erledigt waren (PR #92, efc2eee)
- Runde 1 von 2 abgeschlossen: 6 Subagenten, 0 Fremdmodell-Anfragen, etwa 47 Minuten nach Git (Vergabe etwa 23:15 UTC bis a0f4ae5). Alles behauptet
- Runde 2 von 2 abgeschlossen: 3 Subagenten (S3-07 bis S3-09), 0 Fremdmodell-Anfragen, etwa 1 Stunde 44 Minuten nach Git (00:03 UTC bis 5bcb484)
- **Stufe 3 abgeschlossen:** Budget 2 von 2 Runden verbraucht, 9 Subagenten, 0 Fremdmodell-Anfragen. Orchestrator hat angehalten, an Justus berichtet und vergibt nichts mehr. Weitere Stufe nur nach neuer Entscheidung von Justus
- **Fertig-Kriterium erfüllt** (Lesart des Orchestrators, gegengelesen): Einschätzungen `erkundung/s3-07-einschaetzung-425.md` (4×2×5: „Angriff lohnt nicht“ als Übertragung der Kette) und `erkundung/s3-08-einschaetzung-327.md` (3×2×7: „Angriff lohnt“, eng auf den Restfall (4, 6, 4)). Alles behauptet. Orchestrator hat angehalten und an Justus berichtet
- Fertig, wenn je Format eine Einschätzung unter `erkundung/` liegt (Restfälle mit beiden Rechnungen, übertragbare und nicht übertragbare Teile, Empfehlung) oder das Budget erschöpft ist. Danach hält der Orchestrator an
- Kein Kontakt nach außen (Auflage 5)

## Aufträge für Stufe 3

| Nr. | Auftrag | Rolle | Zieldatei | Stand |
|---|---|---|---|---|
| S3-01 | Restfall-Rechnung 4×2×5 bei Länge 31 | Rechner | `erkundung/s3-01-restfaelle-425.md`, `erkundung/s3-01-restfaelle.py` | erledigt in Runde 1, PR #93. 7 Restfälle (Rolle n = 4), transponiert 20. Behauptet |
| S3-02 | Restfall-Rechnung 4×2×5 bei Länge 31, unabhängig von S3-01 | Rechner | `erkundung/s3-02-restfaelle-425.md`, `erkundung/s3-02-restfaelle.py` | erledigt in Runde 1, PR #94. 7 Restfälle, transponiert 20. Behauptet |
| S3-03 | Restfall-Rechnung 3×2×7 bei Länge 34 | Rechner | `erkundung/s3-03-restfaelle-327.md` | erledigt in Runde 1, PR #96. Ein Restfall (4, 6, 4) (Rolle n = 3), transponiert 201. Behauptet |
| S3-04 | Restfall-Rechnung 3×2×7 bei Länge 34, unabhängig von S3-03 | Rechner | `erkundung/s3-04-restfaelle-327.md`, `erkundung/s3-04-restfaelle-327.py` | erledigt in Runde 1, PR #95. Ein Restfall (4, 6, 4), transponiert 201. Behauptet |
| S3-05 | Übertragbarkeit der Lean-Kette und Abzählargument für beide Formate | Erkunder | `erkundung/s3-05-uebertragung.md` | erledigt in Runde 1, PR #97. Behauptet |
| S3-06 | Blind-Suche, mit Suche nach einem Verfahren mit 31 für 4×2×5 | Blind-Sucher | `erkundung/s3-06-blind-425.md` | erledigt in Runde 1, PR #98. Kein Verfahren mit 31 oder 32, über GF(2) 13 mit 33 |
| S3-07 | Einschätzung 4×2×5 mit Empfehlung | Erkunder | `erkundung/s3-07-einschaetzung-425.md` | erledigt in Runde 2, PR #99 (57010c8). Empfehlung „Angriff lohnt nicht“ als Übertragung der Kette. Behauptet |
| S3-08 | Einschätzung 3×2×7 mit Empfehlung | Erkunder | `erkundung/s3-08-einschaetzung-327.md` | erledigt in Runde 2, PR #100 (2e2d268). Empfehlung „Angriff lohnt“, eng auf (4, 6, 4). Behauptet |
| S3-09 | Blind-Suche, Verfahren mit 31 für 4×2×5 über Körpern der Charakteristik ≠ 2 | Blind-Sucher | `erkundung/s3-09-blind-425.md` | erledigt in Runde 2, PR #101 (5bcb484). Kein Verfahren mit 31 oder 32; GF(2) bis 33, GF(3) bis 34; 221 33er nicht mit ±1 nach ℤ hebbar (SAT). Behauptet |

## Stufe 2: abgeschlossen

**Stufe 2: 4×2×4 (25 oder 26?)**: abgeschlossen mit 12 von 24 Runden. B-016 als Ergebnis freigegeben, Auflagen erledigt (`ergebnisse/rang-444.md`)

- Runden verbraucht: 12 von 24 (beide Spuren zusammen; Budget durch Justus von 12 auf 24 erhöht, Protokoll 0.4). Ab Runde 9 bis zu 6 Subagenten pro Runde
- Runde 9 abgeschlossen: 6 zählende Subagenten (S2-34, S2-35, S2-36, S2-41, S2-42, S2-43), dazu gestartet und ersetzt S2-37 bis S2-40, 0 Sol-Anfragen, 51 Minuten nach Git (626eb7b bis 9f5a928)
- Runde 10 abgeschlossen: 6 Subagenten (S2-44 bis S2-49), 0 Sol-Anfragen, 62 Minuten nach Git (8226274 bis 32f12f6). Neu: B-016 (Endsatz in Lean ohne Hypothese, `Transponiert444.rank_four_two_four_ge_26`), behauptet, Aussagen-Abgleich in Runde 11
- Vor Runde 11, Hausarbeit außerhalb der Runde (offen ausgewiesen): Kopfkommentare gesäubert, PR #80 (c3c3884), nur Kommentare, Lauf 86 (45699204903, Job 139504538345) grün, SORRY 0. Rest: `.github/scripts/lean_report.py` Zeile 43 trägt das Label „(R-C1)“, es erscheint im Log (offengelegte Spur)
- Runde 11 abgeschlossen: 5 Subagenten (S2-50 bis S2-54), 1 Sol-Anfrage, etwa 28 Minuten nach Git (Vergabe etwa 21:05 UTC bis b64e6c8). Dauern je Aufgabe: S2-50 etwa 3, S2-52 und S2-53 je etwa 5, S2-51 etwa 8, S2-54 etwa 28 Minuten
- **Entscheidung von Justus (22:37 Uhr MEZ, Wortlaut in LOG.md):** Fertig-Kriterium anerkannt, B-016 bleibt geprüft, Frist B-014 gehalten (abweichende Prosa-Teile bleiben behauptet). **Noch keine Freigabe als Ergebnis.** Vorher Runde 12 als zweiter, unabhängiger Maschinenlauf ohne Sol-Anfrage (Neubau, Kernel-Nachprüfung, Aussage in frischer Datei, zweite Umgebung, Literaturwache; Entwürfe unter `entwurf/`, README unverändert). Quelltexte unter `lean/YangBounds/` bleiben unverändert. Ergebnis in `pruefvermerke/B-016-zweitlauf.md`. Nach Runde 12 anhalten und berichten. Stufe 3 beginnt nicht
- Runde 12 abgeschlossen: 7 Subagenten (S2-55 bis S2-60, dazu ein von S2-60 selbst gestarteter Subagent, Regelverstoß), 0 Sol-Anfragen, etwa 41 Minuten nach Git (21:38 UTC bis 8594f30). Zweitlauf in `pruefvermerke/B-016-zweitlauf.md`: Neubau und lean4checker 27/27 grün, frische Datei grün, zweiter lokaler Bau laut Thread erfolgreich. Zweiter Regelverstoß: Rechenblock von S2-60 etwa 32 statt höchstens 30 Minuten
- **Entscheidung von Justus (23:42 Uhr MEZ, Wortlaut in LOG.md):** Freigabe von B-016 als Ergebnis **unter der Bedingung**, dass die wiederholte Literaturwache (Zeiten aus Git, wörtliches Suchprotokoll) nichts findet. Bedingung noch nicht erfüllt, Freigabe noch nicht eingetreten. Danach README und Notiz nach Auflagen 1 bis 4 (Notiz nach `ergebnisse/rang-444.md`). Kein Zenodo, kein arXiv, kein Kontakt nach außen. Regelverstöße S2-60 ohne weitere Folge. Abschluss nach Runde 12, keine eigene Runde. Danach anhalten, Stufe 3 beginnt nicht
- **Stufe 2 abgeschlossen** mit 12 von 24 Runden. **B-016 als Ergebnis freigegeben** (Entscheidung von Justus, 26.11.2026, 00:08 Uhr MEZ, Wortlaut in LOG.md): Befund G1 zählt nicht als Fund. Auflagen 1 bis 8, Auflage 8: Abschnitt „Related claims“ und „to our knowledge the first proof“. Umsetzung der Auflagen 1 bis 4, 8 und des Vermerks zu Gemini Deep Research durch Thread „Ergebnis zu 4×2×4 in README eintragen“ (seit 23:10 UTC, Abschluss nach Runde 12, keine eigene Runde). Danach Stufe 3 nach Protokoll 0.5. Kein Kontakt nach außen
- Wiederholte Literaturwache erledigt: PR #91 (5455b47), 22:43:31 bis 22:53:24 UTC nach Git, 31 Suchanfragen, 25 Quellen, 1 Hilfsagent, 0 Sol-Anfragen. Kein Beweis für ≥ 26, kein Verfahren mit 25. **Befund G1** (solven-eu/matmulcatalog, `docs/LOWER_BOUNDS.md` Zeile 90: „R(<2,4,4>) ≥ 26 (Hopcroft-Kerr)“, ohne Beweis, im selben Repo widersprochen). **Freigabe als Ergebnis nicht eingetreten**: Ob G1 als Fund zählt, entscheidet Justus
- Auf main liegt Protokoll 0.5 (Commit 61bd8d4, 23:50 Uhr MEZ, laut Commit auf Anweisung von Justus aus einem Chat außerhalb des Projekts): Stufe 3 als Erkundung mit 2 Runden nach Erledigung der Auflagen. Von Justus bestätigt (LOG.md, 26.11.2026)
- Orchestrator hielt nach Runde 12 an und berichtete an Justus. Nichts Neues vergeben. Punkte für Justus (LOG.md, Abschluss Runde 12): Freigabe als Ergebnis, offene Punkte der Entwürfe, zwei Regelverstöße, Zeitangabe S2-58, kurze Dauern
- **B-016 geprüft** (Lean-Endsatz R(⟨4,2,4⟩) ≥ 26 über jedem Körper; Prüfer S2-50 und GPT 6.2 Sol S2-51). B-014 geprüft in Teilen (siehe `pruefvermerke/B-014.md`)
- Abbruchregel 2, Spur A (Übergangsregel Protokoll 0.4.1, Abschnitt 6, Lesart des Orchestrators): Die vier Aussagen-Abgleiche zu B-008, B-009, B-012 und B-013 sind in Runde 9 von gültigen Prüfern bestätigt (S2-42, S2-43), die Fristen aus Runde 3 und 6 gelten als gehalten. S2-41 bestätigt B-014, das zählt als Fortschritt in Runde 9, **Frist für geprüft: Ende Runde 11**. Zähler Spur A: Runde 9 mit Fortschritt, Runde 10 ohne, Runde 11 mit Fortschritt (B-016 geprüft, ändert die Schranke), Runde 12 (Zweitlauf) ohne neues Artefakt zur Schranke, nach strenger Lesart also **1 von 3**. Frist B-014: gehalten, von Justus bestätigt (der Teil, der die Schranke ändert, ist geprüft). **Spur B: aufgegeben**
- Fertig, wenn: entweder Lean-Beweis für 26 oder ein nach 5.2 bestätigtes Verfahren mit 25. Dann hält der Orchestrator an und berichtet an Justus (11.4). **Von Justus anerkannt (B-016 geprüft).** Noch keine Freigabe als Ergebnis; vorher Zweitlauf in Runde 12
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
| S2-55 | Zweitlauf: Neubau und Kernel-Nachprüfung (lean4checker) | Prüfer (Maschinenlauf) | `.github/workflows/zweitlauf.yml` | erledigt in Runde 12, PR #88 (9348a8b). Lauf 45706606136, 27/27 ohne Fehler |
| S2-56 | Zweitlauf: Aussage in frischer Datei | Prüfer (Maschinenlauf) | `lean/Zweitlauf/B016Aussage.lean`, `.github/workflows/zweitlauf-b016.yml` | erledigt in Runde 12, PR #86 (ad10846). Lauf auf main 45708303302 grün |
| S2-57 | Zweitlauf: lokaler Bau in zweiter Umgebung | Prüfer (Maschinenlauf) | kein PR | erledigt in Runde 12. Bau aus Quellen erfolgreich (nur Angabe des Threads) |
| S2-58 | Literaturwache 4×2×4 Rang 26 | Literaturwächter | `lit/WACHE.md` | erledigt in Runde 12, PR #87. Nicht gefunden |
| S2-59 | Entwürfe README-Tabelle und Ergebnis-Notiz | Schreiber | `entwurf/` | erledigt in Runde 12, PR #89. Nicht eingestellt |
| S2-60 | Blind-Suche, Runde 12 | Blind-Sucher | `versuche/s2-blind-r12.md` | erledigt in Runde 12, PR #90 (8594f30). Bester Rang 26 über GF(2), 186 geprüfte 26er-Verfahren, kein 25er, kein Beweis. Regelverstöße: Rechenblock etwa 32 Minuten, eigener Subagent |
| S2-13 | Literaturwache mit Nachprüfung von Justus' Hinweis zu openai/math | Literaturwächter | `lit/WACHE.md` | erledigt in Runde 3, PR #41 |

Grenze von Spur A (Literaturwache): Eine Schranke über 𝔽₂ schließt kein Verfahren über ℚ mit Nenner 2 aus.

## Fertig-Kriterium Stufe 2

- [x] Lean-Beweis für 26 oder ein nach 5.2 bestätigtes Verfahren mit 25. B-016 geprüft, von Justus anerkannt und als Ergebnis freigegeben (26.11.2026)

## Offene Kleinigkeiten

- **Für später (Auflage 7 von Justus, 25.11.2026):** die Kette des Endsatzes vom Paket `mm325_proof` entkoppeln. Nicht jetzt beginnen

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
