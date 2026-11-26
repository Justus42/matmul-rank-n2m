# Status

Zuletzt geändert: 26.11.2026 (Stufe 5, Runde 3 vergeben: zweite Lesung der Kette, S5-14 Spur P; Frage an Justus zu Spur P offen)

## Aktuelle Stufe

**Stufe 5: Portierung für Palomar (Spur P) und Festigung der Kette zu 3×2×7 ohne Lean (Spur K)** (Protokoll 0.7, Abschnitt 3): von Justus gestartet am 26.11.2026, 14:32:59 UTC (Wortlaut im Logbuch). Protokoll 0.7 (1c15770) von ihm bestätigt. Budget: 6 Runden (beide Spuren zusammen), je bis zu 6 Subagenten, höchstens 4 Fremdmodell-Anfragen. Reihenfolge: Abschluss Auflage 7 (A7-Z läuft, dann Textänderung), Literaturwache, dann Runde 1. Literaturwache S5-LW erledigt (PR #145). Tag `lean-4.19`: Push mit 403 abgewiesen. Nach Entscheidung von Justus (14:50 UTC, Wortlaut im Logbuch) statt des Tags der Zweig `lean-4.19` auf 71240f8, wird nie verändert. Zweig `portierung` steht ebenfalls auf 71240f8
- ~~Lesart (j)~~ erledigt mit dem Zweig `lean-4.19`, Spur P darf starten. Früherer Wortlaut: Kein Auftrag der Spur P, bevor das Tag steht, auch nicht zu `palomar/ANFORDERUNGEN.md`. Runde 1 bleibt offen; Spur P kommt in dieselbe Runde, sobald das Tag steht und solange S5-01 läuft, sonst in Runde 2
- **Runde 1 vergeben etwa 14:49 UTC:** S5-01 (Spur K, Zusammenführung der Kette in `lean/prosa/s5_327_kette.md`); etwa 14:53 UTC dazu S5-02 (Spur P, `palomar/ANFORDERUNGEN.md`) und S5-03 (Spur P, Portierung, Bericht `lean/prosa/s5_portierung_s5-03.md`), beide mit PR an `portierung`. 3 Subagenten, kein Fremdmodell
- Runde 1, S5-01 geliefert (PR #148, etwa 27 Minuten nach Git): Kette als ein Beweis in `lean/prosa/s5_327_kette.md`, Glieder K-1 bis K-41. B-033 angelegt, behauptet; je Glied zwei unabhängige Bestätigungen vorgesehen (`pruefvermerke/B-033.md`), Urteile aus Stufe 4 zählen nicht. Fünf neue Beweiswege und Herleitungen von Hand nach Wertung des Orchestrators Teil des Auftrags, kein neuer Beweisangriff; Nebenbefund 12.16 wird nicht weiterverfolgt. S5-03 geliefert ohne lokalen Bau (PR #147 an `portierung`), Läufe failure, cache.mathlib.org gesperrt (Freigabe seit 14:59 UTC bei Justus beantragt). 
- **Runde 1 von 6 abgeschlossen:** 3 Subagenten, 0 Fremdmodell-Anfragen, etwa 29 Minuten nach Git (14:49 UTC bis c4339fb um 15:17:30 UTC). **Spur P 1 von 3, Spur K 1 von 3** (strengere Lesart; Lesart (k) im Logbuch, Entscheidung bei Justus). Budget 1 von 6 Runden verbraucht
- **Runde 2 von 6 vergeben etwa 15:22 UTC:** S5-04 bis S5-07 Prüfer der Kette (erste Lesung, je ein Block, Positivliste im Logbuch), S5-08 Spur P (Palomar-Dateien, PR an `portierung`). 5 Subagenten, kein Fremdmodell. Sechster Platz (Bau auf `portierung`) nur bei Freigabe von cache.mathlib.org, solange die Runde offen ist. `lean/prosa/s5_327_kette.md` bleibt unverändert, solange Prüfer lesen
- Runde 2, S5-04 bis S5-07 geliefert: K-1 bis K-41 haben je eine erste Bestätigung, keine echte Lücke, Ungenauigkeiten im Wortlaut gesammelt in `pruefvermerke/B-033.md` (Berichtigung später in einem Zug). Hinweis von S5-07 zur Struktur (Fallunterscheidung nach e logisch überzählig) vermerkt, Kette unverändert. Offen in Runde 2: S5-08
- **Runde 2 von 6 abgeschlossen:** 5 Subagenten (S5-04 bis S5-08), 0 Fremdmodell-Anfragen, etwa 11 Minuten nach Git (15:22 UTC bis 4cad1ca um 15:33:15 UTC). Sechster Platz leer (cache.mathlib.org nicht freigegeben). **Spur K 0 von 3** (41 Glieder mit erster Bestätigung). **Spur P 2 von 3** (kein Modul baut; Lesart (l): Beleg für P-24 im Bericht S5-08 ohne Befehl und Ausgabe). Budget 2 von 6 Runden verbraucht
- Offen aus S5-08: Platzhalter in `formalization.yaml` (Autoren, Betreuer, „original/source-based“) für Justus; P-13 wegen `versuche/s2-19-abgleich/Check.lean` (OF-1); `lean_report.py` nicht angepasst
- **Runde 3 von 6 vergeben etwa 15:38 UTC:** S5-09 bis S5-13 Prüfer der Kette (zweite Lesung, andere Prüfer, ausgeschriebene Nachrechnung je Glied verlangt), S5-14 Spur P (Cache-Probe, Belege mit Befehl und Ausgabe in `palomar/BELEGE.md`). 6 Subagenten, kein Fremdmodell
- ~~Frage an Justus (15:37 UTC) zu Spur P~~ vorerst gegenstandslos: Justus hat um 15:37 UTC cache.mathlib.org freigegeben (Wortlaut im Logbuch). S5-14: Cache auf `portierung` geladen (15:39:53 bis 15:41:11 UTC, 9.117 Dateien, Exit 0), Bau läuft. Zähler Spur P am Ende von Runde 3 aus dem Bau
- **Offene Fragen aus S5-02** (`palomar/ANFORDERUNGEN.md` auf `portierung`): (1) Modulpflicht auch für `versuche/s2-19-abgleich/Check.lean` außerhalb von `lean/`; (2) Endung `.git` an der Mathlib-URL im Manifest; (3) `tensorRank` benutzt `exists_bilinearAlgorithm`, Platz in der Challenge; (4) original oder source-based, Entscheidung von Justus; (5) Inhalt von `llms.txt` unbekannt; (6) Prüfprogramm con-ron nur bis v4.35.0 hinterlegt
- Umgebung: Freigabe für palomar-registry.org, *.palomar-registry.org und lakecache.blob.core.windows.net bei Justus beantragt (14:52 UTC). Gesperrt laut Probe des Orchestrators: lakecache.blob.core.windows.net, release.lean-lang.org, mathlib4.lean-cache.cloud, reservoir.lean-lang.org, lean-lang.org. Genauer Bedarf aus der Werkzeugprobe in S5-03

**Stufe 4: enger Angriff auf 3×2×7 (34 oder 35?)** (Protokoll 0.6, Abschnitt 3): **beendet nach Runde 6, Budget erschöpft, Fertig-Kriterium nicht erfüllt** (Zusammenfassung im Abschnitt „Abschluss Stufe 4“). Verlauf: Nach Runde 4 angehalten (Abbruchregel 2 für Spur B, Bericht an Justus), Runde 5 von Justus um 12:27 UTC freigegeben. Spur B aufgegeben, Spur A läuft. Die Pause bis 29.11.2026 (Justus, 08:23 UTC) hat Justus um 09:47 UTC aufgehoben, Runde 3 darf starten

- Von Justus gestartet am 26.11.2026, 06:43 UTC (Wortlaut im Logbuch). Protokoll 0.6 (c721297) von ihm bestätigt
- Budget: 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5. Grundlage: `erkundung/s3-08-einschaetzung-327.md`
- Runde 1 ist nur Prüfung der Grundlage: Prüfer für die Restfall-Rechnung, für Lemma 15(b) bei d = 2 und für die Übertragung von Lemma I auf die Normalform, dazu die Nachrechnung des Verfahrens mit 35 nach 5.2 und der Blind-Sucher. Ab Runde 2 Spur A (Ausschluss des Restfalls) und Spur B (Suche nach 34)
- Literaturwache vor Runde 1, außerhalb der Runde: erledigt, PR #102 (Merge 2335284), etwa 6 Minuten nach Git (06:45:26 bis 06:51:14 UTC), 1 Subagent, 0 Fremdmodell-Anfragen. Nichts zu 35 oder 34 gefunden, Abbruchregel 3 greift nicht. Nebenergebnis: Verfahren mit 35 unter MIT bei dronperminov/FastMatrixMultiplication
- Behauptungsdateien für Runde 1: `behauptungen/B-017.md` (Restfall-Rechnung), `behauptungen/B-018.md` (Lemma 15(b) bei d = 2), `behauptungen/B-019.md` (Übertragung von Lemma I, Wortlaut der Aussage vom Orchestrator). Status behauptet (`pruefvermerke/`)
- Runde 1 von 6 vergeben etwa 06:52 UTC: 5 Subagenten, 0 Fremdmodell-Anfragen. S4-01 bis S4-03 Prüfer für B-017 bis B-019, S4-04 Verfahren mit 35 anlegen und nachrechnen, S4-05 unabhängiger Sucher (nicht blind). Die Berichte S3-03 und S3-04 stehen auf keiner Positivliste
- Runde 1 von 6 abgeschlossen: 5 Subagenten, 0 Fremdmodell-Anfragen, etwa 48 Minuten nach Git (06:52 UTC bis 412ad8b um 07:40:05 UTC). Haltebedingung nicht erfüllt (Lesart c). B-017 bis B-019 behauptet, von einem Prüfer bestätigt. B-020 (obere Schranke 35) behauptet
- Abbruchregel 2: Lesart (d) des Orchestrators gilt nicht (Justus, 26.11.2026, 09:47 UTC). Die Spuren gibt es erst ab Runde 2. Zähler nach Runde 2: Spur A 1 von 3, Spur B 1 von 3
- Literaturwache vor Runde 3: PR #115 (Merge 35e2449), etwa 3 Minuten nach Git, nichts gefunden, Abbruchregel 3 greift nicht. 1 Subagent, 0 Fremdmodell-Anfragen. Lief noch mit den bisherigen Netzsperren
- **Vorgabe für die nächste Literaturwache** (Justus, 26.11.2026, 10:09 UTC, Wortlaut im Logbuch): Die Umgebung lässt jetzt arxiv.org samt Unterdomains, fmm.univ-lille.fr, eccc.weizmann.ac.il, zenodo.org, mathoverflow.net und api.semanticscholar.org durch. Die Wache liest direkt die Versionslisten von 2609.14393 und 2609.22054, die neuen Einträge in cs.CC und die FMM-Lille-Seite zu 2x3x7 und hält fest, was erreichbar war
- Runde 3 von 6 vergeben etwa 09:53 UTC: 6 Subagenten (S4-12 bis S4-17), Fremdmodell höchstens zwei Sol-Anfragen, keine ohne Prüferbestätigung, bisher 1. Bleibt offen bis zur Sol-Antwort zu S4-07-D oder bis feststeht, dass keine Anfrage gestellt wird (Lesart f)
- Runde 3, Zwischenstand: S4-12 und S4-13 geliefert. B-021 bis B-024 behauptet, von einem Prüfer bestätigt (B-024 K2 nur berichtigt). B-025 (Fallunterscheidung) angelegt, behauptet. Sol-Anfrage zu S4-07-D gestellt 10:05 UTC (1 von höchstens 2, Batch `openrouter:batch-1795687520-iFCKAiiJIQ1lIli8h29y`), Antwort da 10:11 UTC (`versuche/s4-r3-sol-d/gpt_antwort.md`): erster Satz von D hält, zweiter Satz nur je Normalform
- **Runde 3, Fortschritt Spur A nach Abbruchregel 2 b)** (Orchestrator, nach Vorgabe 1 von Justus): B-021 D (erster Satz) von Prüfer S4-12 und Fremdmodell unabhängig bestätigt, Status behauptet. Ausgeschlossen ist der benannte Fall „e = 3 mit (INJ5)“ der Fallunterscheidung B-025. **Zähler Spur A: 0 von 3. Frist: B-021 D geprüft bis Ende Runde 5**, sonst zählt es nachträglich nicht und der Zähler wird neu berechnet. Spur B: Zähler hängt an S4-16. Fremdmodell Runde 3: 1 von höchstens 2, eine zweite Anfrage ist in dieser Runde nicht mehr möglich
- Runde 3, S4-15 geliefert (PR #118, etwa 22 Minuten nach Git): kein vollständiger Ausschluss bei e ≤ 2. Behauptet E2-A (in jeder Normalform e ∈ {2, 3}, engt B-025 ein, ungeprüft), E2-B, E2-D (bedingter Ausschluss bei e = 2 unter (INJ-B)). Vermutet E2-V (nur Rechnung). Kein Prüfer in dieser Runde, kein Fortschritt nach 2 b) daraus
- Runde 3, S4-14 geliefert (PR #120, etwa 35 Minuten nach Git): Fall e = 3 nicht vollständig ausgeschlossen. Behauptet Satz R (K″ abgeschlossen unter a_1, a_2 bei e = 3, ohne (INJ5)), offen nur Unterfall (M21). Vermutung S4-07-V im Wortlaut widersprochen durch S4-14 (Lage L*, dim V_C = 59), ungeprüft, Θ dort Rang 0. Kein Fortschritt nach 2 b) daraus. Ausstehend: S4-16, S4-17
- Runde 3, S4-17 geliefert (PR #119, etwa 58 Minuten nach Git): Rang nicht bestimmt, 34 oder 35. Behauptet eigenes Verfahren mit 35 (kein neuer Wert) und Strukturaussage (rk L = 6, rk H = 4, dim N = 3, dim S = 1); vermutet R = 35. Drei Rechenblöcke, je unter 30 Minuten mit Commits dazwischen. Blindheit eingeschränkt (Gedächtnis-Index und vier Einzeleinträge eingeblendet). Ausstehend: S4-16
- Runde 3, S4-16 geliefert (PR #121, etwa 79 Minuten nach Git): Positivprobe bei 35 nicht bestanden (Gleitkomma-Funde mit (SN1)+(K1), exaktes Runden gescheitert), nach Vorgabe 4 von Justus keine Suche bei 34. Fünf Rechenblöcke, je unter 30 Minuten mit Commits dazwischen
- **Runde 3 von 6 abgeschlossen:** 6 Subagenten, 1 Fremdmodell-Anfrage (0,05 US-$), etwa 79 Minuten nach Git (09:53 UTC bis 64db857 um 11:12:03 UTC). Kein Ausschluss des Restfalls, kein Verfahren mit 34. **Zähler: Spur A 0 von 3** (Fortschritt nach 2 b), Frist B-021 D geprüft bis Ende Runde 5), **Spur B 2 von 3**. Budget 3 von 6 Runden verbraucht. Keine Abbruchregel greift, Fertig-Kriterium nicht erfüllt, weiter mit Runde 4
- Vorbereitung Runde 4: B-026 (Satz R aus S4-14, mit Folgerungen B) und B-027 (E2-A, E2-B, E2-D aus S4-15) angelegt, behauptet. Gedächtnisdurchsicht bestätigt
- Literaturwache vor Runde 4, außerhalb der Runde: PR #122 (Merge 6a4d586), etwa 8 Minuten nach Git, 1 Subagent, 0 Fremdmodell-Anfragen. Nichts gefunden, Abbruchregel 3 greift nicht. Vorgabe von Justus (10:09 UTC) erfüllt: arXiv, cs.CC, FMM-Lille 2x3x7, ECCC, Zenodo, MathOverflow direkt gelesen; Semantic Scholar gedrosselt; Google Scholar und GitHub-REST-API für fremde Repos weiter gesperrt
- **Runde 4 von 6 vergeben etwa 11:24 UTC:** 6 Subagenten (S4-18 Lean für B-021 D, S4-19 Prüfer B-026, S4-20 Prüfer B-027, S4-21 Spur A Unterfall (M21), S4-22 Spur B Positivprobe bei 35, S4-23 unabhängiger Sucher (nicht blind)). Lesart (g): Für B-021 D geprüft muss der Lean-Satz in Runde 4 grün auf main stehen, die zwei Abgleich-Prüfer laufen in Runde 5. Fremdmodell bisher 0, nur nach Prüferbestätigung eines neuen Ausschlusses
- Runde 4, S4-19 geliefert (PR #124, etwa 8 Minuten nach Git): B-026 behauptet, von einem Prüfer bestätigt (Vorbehalt zu B (i)). Keine Sol-Anfrage, kein Fortschritt nach 2 b) daraus
- Runde 4, S4-20 geliefert (PR #125, etwa 16 Minuten nach Git): B-027 behauptet, von einem Prüfer bestätigt (Vorbehalt zur Lesart von (INJ-B)). Vollständigkeit der Fallunterscheidung B-025 (0 ≤ e ≤ 3, e ≠ 0, e ≠ 1) von einem Prüfer bestätigt. Keine Sol-Anfrage, kein Fortschritt nach 2 b) daraus
- Runde 4, S4-21 geliefert (PR #127, etwa 32 Minuten nach Git): Unterfall (M21) nicht vollständig ausgeschlossen, kein Verfahren. Behauptet S4-21-G, S4-21-K, S4-21-L (Namen nicht mit Satz G aus B-023 und Satz K aus B-024 verwechseln), vermutet S4-21-V (Lücke L-21). Kein Prüfer, kein Fortschritt nach 2 b) daraus
- Runde 4, S4-18 geliefert (PR #123, etwa 20 Minuten nach Git): `YangBounds.S4BedingterAusschluss.s4_07_D` grün auf main (Lauf 45813239767, Job 139886382749, Commit fb7f197; SORRY 0, nur propext, Classical.choice, Quot.sound). B-021 D behauptet; für geprüft fehlt der Aussagen-Abgleich durch zwei Prüfer (Runde 5, Lesart g)
- Runde 4, Nacharbeit S4-18 (kein siebter Platz): Verweise auf Prüfberichte, Fremdmodell-Antworten und Urteile im Kopfkommentar der Lean-Datei werden gestrichen, eigener PR, neuer grüner Lauf. Maßgeblich für 5.1 Punkte 1, 2 und 4 wird die neue Job-Nummer (steht aus)
- Runde 4, S4-23 geliefert (PR #129, etwa 47 Minuten nach Git): Rang nicht bestimmt. Behauptet S4-23-A (Gleichheitsfall von Yangs Ungleichung), S4-23-B (Stützpunkte nicht durch Kegelschnitte trennbar); vermutet R = 35. Zwei Rechenblöcke, je unter 30 Minuten mit Commit dazwischen. Ausstehend: S4-22, Nacharbeit S4-18
- Runde 4, S4-22 geliefert (PR #130, etwa 48 Minuten nach Git): Positivprobe bei 35 bestanden (Verfahren über ℚ, `versuche/s4-spurB-r4/daten/3x2x7-r35-s422a.json`, behauptet, nicht nach 5.2 geprüft), Suche bei 34 ohne Fund. Vier Rechenblöcke, je unter 30 Minuten mit Commits dazwischen
- **Vorläufig (Orchestrator, endgültig mit dem Rundenabschluss):** Spur B ohne Fortschritt in Runde 4, Zähler **3 von 3, Abbruchregel 2 greift: Spur B endet mit Status aufgegeben** (drei Runden ohne Verfahren mit 34). Spur A **1 von 3**, Frist B-021 D geprüft bis Ende Runde 5 läuft. Nach dem Rundenabschluss hält der Orchestrator an und berichtet Justus. Ausstehend: Nacharbeit S4-18
- Runde 4, Nacharbeit S4-18 geliefert (PR #128, Merge 3eb57a5): nur Kopfkommentar geändert, keine Verweise auf Prüfberichte, Fremdmodell oder Urteile mehr. Lauf 45817224211, **Job 139899962532** (SORRY 0, nur Standard-Axiome) ist maßgeblich für 5.1 Punkte 1, 2 und 4 von B-021 D
- **Runde 4 von 6 abgeschlossen:** 6 Subagenten, 0 Fremdmodell-Anfragen, etwa 48 Minuten nach Git (11:24 UTC bis 74aa77d um 12:11:47 UTC). Kein Ausschluss des Restfalls, kein Verfahren mit 34. **Spur B: 3 von 3, Abbruchregel 2 greift, Spur B aufgegeben** (drei Runden ohne Verfahren mit 34). **Spur A: 1 von 3**, Frist B-021 D geprüft bis Ende Runde 5 (Punkt 3 von 5.1, zwei Abgleich-Prüfer, steht aus). Budget 4 von 6 Runden verbraucht. Fertig-Kriterium nicht erfüllt
- **Orchestrator hält an und berichtet Justus** (Abbruchregel gegriffen). Runde 5 erst nach seiner Antwort
- **Justus, 12:27:48 UTC:** „Runde 5 starten“ (nur Spur A und Wartungsauftrag zu Auflage 7). Gedächtnisdurchsicht vor Runde 5 bestätigt. Nächste Auftragsnummer: S4-24
- **Runde 5 von 6 vergeben etwa 12:31 UTC:** 6 Subagenten (S4-24 und S4-25 Abgleich-Prüfer für `s4_07_D` gegen B-021 D, unabhängig voneinander; S4-26 Lean-Wartung Auflage 7; S4-27 Spur A Schritt S4-21-V im Unterfall (M21); S4-28 Spur A Fall e = 2 ohne (INJ-B); S4-29 unabhängiger Sucher (nicht blind)). Keine neue Literaturwache (gleiche Sitzung, Lesart a). Spur B aufgegeben, kein Auftrag. Fremdmodell voraussichtlich 0
- Runde 5, S4-24 und S4-25 geliefert (PR #132 und #133, etwa 3 bzw. 5 Minuten nach Git, je ein Commit): beide „stimmt überein“ für `s4_07_D` gegen B-021 D (erster Satz) unter der Lesart von (INJ5) über formale Polynome; Vorbehalte V1 (Lesart) und V2 (leer über Körpern mit ≤ 5 Elementen). Unabhängigkeit von der Schreibhand geprüft: beide auf 66f11ab, keine Spur gegenseitiger Sicht oder eines Urteils zu D
- **Runde 5: B-021 D, erster Satz, geprüft nach 5.1** (Orchestrator; Job 139899962532 für Punkte 1, 2, 4; S4-24 und S4-25 für Punkt 3). Lage als Hypothesen angenommen, Herleitung aus B-017 bis B-019 nicht in Lean. **Frist Spur A gehalten.** Lesart (i): zählt in Runde 5 nicht noch einmal als neuer Fortschritt. B-025: Fall „e = 3 mit (INJ5)“ geprüft ausgeschlossen, bedingt auf die Lage
- Runde 5, S4-26 (Auflage 7): PR #131 offen, nicht gemergt. Lauf 45820627478 (Job 139911775768) rot: `SatzB444.lean:414:54: simp made no progress` ohne Paket-Import. Mindestens ein Beweisschritt in der Kette des Endsatzes nutzt ein simp-Lemma des Pakets. Nach Vorgabe von Justus kein weiterer Umbau, der Orchestrator legt es Justus vor
- Runde 5, S4-28 geliefert (PR #134, etwa 12 Minuten nach Git): behauptet, ungeprüft, S4-28-C: kein Verfahren der Länge 34, bei dem jede Normalform e ≤ 2 hat (also hat jedes eine Normalform mit e = 3). Dazu S4-28-A (Satz R bei e = 2, E2-D gegenstandslos) und S4-28-B (Gestalt). Stützt sich auf Lemma F aus S4-21 (ungeprüft). B-028 angelegt, behauptet. Ein Rechenblock, 90 Sekunden. Kein Fortschritt nach 2 b) in Runde 5 (kein Prüfer, kein Fremdmodell)
- Runde 5, S4-27 geliefert (PR #135, etwa 26 Minuten nach Git, ein Commit): behauptet, ungeprüft, S4-27-D: kein Verfahren der Länge 34, das in irgendeiner Normalform e = 3 hat, bedingt auf B-017 bis B-019, S4-07, Satz R (B-026) und Lemma O, Lemma F, Satz G aus S4-21. Neu S4-27-B und S4-27-C (über Brent-Bedingung (B), ohne S4-21-K und L). S4-21-V bleibt vermutet. B-029 und B-030 angelegt, behauptet. Ein Rechenblock, etwa 10 Minuten. Kein Fortschritt nach 2 b) in Runde 5
- Hinweis ohne Wertung: Mit S4-27 (irgendeine Normalform mit e = 3 ausgeschlossen) und S4-28 (nicht jede Normalform e ≤ 2) zusammen wäre, falls beide halten und zueinander passen, jedes Verfahren der Länge 34 ausgeschlossen, also R(⟨3,2,7⟩) ≥ 35 über jedem Körper. Das ist nirgends geprüft und wird nirgends als Ergebnis bezeichnet
- Runde 5, S4-29 geliefert (PR #136, etwa 35 Minuten nach Git, fünf Commits): Rang nicht bestimmt, 34 ≤ R ≤ 35 aus der Literatur nachgerechnet (kein neuer Wert; 35er-Verfahren aus dem FMM-Katalog Lille exakt über ℤ geprüft, Daten nicht im Repo). Eigener Beitrag im Fall r = 34 (Bezeichnungen von Tsyganov et al.): f = 5 ausgeschlossen (Satz A), f = 4 auf starre Gestalt eingegrenzt (Satz B), f = 3 offen. B-031 angelegt, behauptet. Drei Rechenblöcke, je unter 30 Minuten mit Commits dazwischen. Eingeblendet: Index und fünf Einzeleinträge
- **Runde 5 von 6 abgeschlossen:** 6 Subagenten (S4-24 bis S4-29), 0 Fremdmodell-Anfragen, etwa 36 Minuten nach Git (Vergabe etwa 12:31 UTC bis Merge e54f8c8 um 13:06:31 UTC). B-021 D (erster Satz) geprüft, Frist gehalten. **Zähler: Spur A 2 von 3** (kein neuer Fortschritt nach 2 a) oder 2 b): Statuswechsel von B-021 D zählt nach Lesart (i) nicht erneut, S4-27 und S4-28 nur behauptet), **Spur B aufgegeben**. Budget 5 von 6 Runden verbraucht. Keine weitere Abbruchregel greift, Fertig-Kriterium nicht erfüllt
- S4-26 (Auflage 7 aus Stufe 2, nicht Stufe 4): PR #131 offen, wartet auf eine Entscheidung von Justus
- Lesart-Notiz zum Zähler: Nach dem Wortlaut von Abschnitt 6 Regel 2 a) wäre nach Runde 5 auch 0 von 3 lesbar (B-021 D in Runde 5 geprüft). Eingetragen ist die strengere Lesart (i) mit 2 von 3; die Entscheidung liegt bei Justus. Praktisch ohne Folge, weil das Budget nach Runde 6 erschöpft ist
- **Runde 6 von 6 vergeben etwa 13:13 UTC (letzte Runde im Budget):** 6 Subagenten (S4-30 und S4-31 Prüfer B-030, unabhängig voneinander; S4-32 und S4-33 Prüfer B-029, unabhängig voneinander; S4-34 Prüfer B-028; S4-35 unabhängiger Sucher (nicht blind)). Keine Literaturwache (gleiche Sitzung, Lesart a). Fremdmodell nur nach 5.5, erst nach Prüferbestätigung eines Ausschlusses. Zweitlauf-Prüfer zu Auflage 7 nicht vergeben (S4-26 wartet auf Justus)
- Runde 6, S4-32 und S4-33 geliefert (PR #137, #138): B-029 von zwei Prüfern bestätigt (B, C, D erster Satz bedingt auf die Grundlagen; D zweiter Satz nur als „Fall e = 3 erledigt ohne S4-21-V“). Status behauptet, Ausschluss bedingt auf B-030, B-026, S4-07 und den Restfall. Sol-Anfrage zu B-029 gestellt 13:15 UTC (Nr. 2 in Stufe 4), Antwort 13:22 UTC (`versuche/s4-r6-sol-b029/gpt_antwort.md`): B folgt, C folgt unter der Normalform mit (C′), D folgt
- Runde 6, S4-31 und S4-30 geliefert (PR #139, #140): B-030 Lemma O, Satz G und Formeln von zwei Prüfern bestätigt, Lemma F im Wortlaut nicht (fehlende Voraussetzung α_t, α_{t′} ≠ 0, offener Punkt, Wortlaut in Runde 6 nicht geändert). Status behauptet
- Runde 6, S4-34 geliefert (PR #141): B-028 von einem Prüfer bestätigt (A, B, C; Zusatz „dicht und offen“ nur unter S4-21-A). Der Beweis braucht den Beweis von Lemma A aus `yang_n3.md`. Status behauptet. Keine Sol-Anfrage zu B-028 (5.5, Sparsamkeit)
- **Runde 6, Fortschritt Spur A nach 2 b)** (Orchestrator): Ausschluss des benannten Falls „e = 3 ohne (INJ5)“ (S4-27-D, B-029) von zwei Prüfern und dem Fremdmodell bestätigt, bedingt auf Restfall, S4-07, Satz R, Satz G. Status behauptet. Frist für geprüft (Ende der übernächsten Runde) innerhalb von Stufe 4 nicht mehr erfüllbar, weil das Budget mit Runde 6 endet. Offener Punkt: Wortlaut „aus (B) und (C) allein“ in S4-27-C zu eng. Offen in Runde 6: S4-35
- Abweichung von 5.4 (Fristen und Zähler): Die vier Prüfer sahen einen Zählerstand in einem Commit-Betreff der Schreibhand; kein Urteil sichtbar, Prüfungen gelten. Ab jetzt keine Zähler, Urteile oder Budgetstände in Commit-Betreffen
- **Auflage 7, Entscheidung von Justus 13:16 UTC (Wortlaut im Logbuch):** S4-26 darf auf PR #131 Beweiskörper ändern, die ohne das Paket nicht bauen (beginnend `SatzB444.lean` Zeile 414), nur durch Mathlib, höchstens zehn Stellen, je lokaler Ersatz; außerhalb der sechs Plätze von Runde 6, ohne Sol. Danach Zweitlauf-Prüfer (bestätigt auch: nur Beweiskörper geändert), dann Textänderung in README und `ergebnisse/rang-444.md`
- Runde 6, S4-35 geliefert (PR #142, Merge f43f265 um 13:52:20 UTC): Rang nicht bestimmt, 34 ≤ R ≤ 35. Eigenes Verfahren mit 35 (Flip-Graph über GF(2), auf ℤ gehoben, nicht unter `verfahren/`), Suche bei 34 ohne Fund. Verschärfung (7′) als B-032 angelegt, behauptet (gleiche Folgerung wie B-031 Satz A). Zwei Rechenblöcke mit Commit 00da560 dazwischen, je unter 30 Minuten; Abstand Commit zu Block 1 nur 7 Sekunden (Hinweis im Logbuch)
- **Runde 6 von 6 abgeschlossen:** 6 Subagenten (S4-30 bis S4-35), 1 Fremdmodell-Anfrage (0,03 US-$), etwa 39 Minuten nach Git (Vergabe etwa 13:13 UTC bis Merge f43f265 um 13:52:20 UTC). **Spur A 0 von 3** (Fortschritt nach 2 b) mit B-029, Frist in Stufe 4 nicht erfüllbar), **Spur B aufgegeben**. Budget 6 von 6 Runden verbraucht. **Stufe 4 endet, Budget erschöpft, Fertig-Kriterium nicht erfüllt.** Nach Stufe 4 wird nichts mehr vergeben außer dem Abschluss von Auflage 7
- **Auflage 7 (außerhalb von Stufe 4):** S4-26 gemergt (PR #131, Merge 62c3dc6 um 13:39:22 UTC). Lauf 45831268262, Job 139948343053 grün, SORRY 0/0, `rank_four_two_four_ge_26` nur Standard-Axiome, TOTAL STANDARD=60; eine Beweisänderung (`SatzB444.lean` Zeile 414), von der Schreibhand an Git und Log nachgeprüft. `lean/README.md` Zeilen 26 und 132 laut Bericht veraltet, nicht geändert. Zweitlauf-Prüfer A7-Z vergeben etwa 13:54 UTC (`lean/prosa/a7_zweitlauf_bericht.md`). Textänderung in README und `ergebnisse/rang-444.md` erst nach seinem Bericht
- **Plan für Runde 5** (Orchestrator, bei Vergabe neu zu lesen): (1) und (2) zwei Abgleich-Prüfer für `s4_07_D` gegen B-021 D, die einander nicht sehen (Positivliste im Logbuch, Job 139899962532); (3) Wartungsauftrag Auflage 7; (4) Spur A: Lücke L-21 bzw. S4-21-V im Unterfall (M21); (5) Spur A: Fall e = 2 ohne (INJ-B); (6) unabhängiger Sucher (nicht blind). Prüfer für S4-21-G, S4-21-K, S4-21-L erst in Runde 6. Vor der Runde: Literaturwache nur bei neuer Sitzung, Gedächtnisdurchsicht
- **Anweisungen von Justus (11:40 UTC, Wortlaut im Logbuch):** (1) README-Statuszeile auf Stand gebracht (PR #126, Merge aa0b426). (2) Ein Sucher heißt nur „blind“, wenn ihm nichts aus dem Projektgedächtnis eingeblendet war, sonst „unabhängiger Sucher (nicht blind)“. S4-05, S4-11, S4-17 und S4-23 waren nicht blind. Ob ein Blind-Sucher je Runde (Abschnitt 6) auf dieser Plattform möglich ist, legt der Orchestrator Justus vor. (3) Auflage 7 freigegeben: **Vorgabe für Runde 5:** ein Wartungsauftrag (zählt als einer der sechs Subagenten): Brücke zu `mm325_proof` aus `lean/YangBounds/Basic.lean` und die zugehörigen Zeilen in `lean/Axioms.lean` in eine eigene Datei außerhalb der Kette des Endsatzes, `Basic.lean` importiert das Paket nicht mehr; hängt mehr am Paket, berichten statt umbauen. Lesart (h): Axiom-Bericht läuft im Workflow des Wartungs-PRs; Prüfer für den Zweitlauf und Änderung von README und `ergebnisse/rang-444.md` frühestens in Runde 6. Runde 5 braucht außerdem zwei Plätze für die Abgleich-Prüfer zu B-021 D
- **Entscheidung von Justus (11:55 UTC, Wortlaut im Logbuch):** (1) Die Vorgabe „Blind-Sucher“ aus Abschnitt 6 ist auf dieser Plattform nicht erfüllbar (Gedächtnisindex wird jedem Thread eingeblendet); je Runde läuft weiter ein unabhängiger Sucher (nicht blind). (2) Wiederholter Zweitlauf und Änderung von README und `ergebnisse/rang-444.md` gehören zu Auflage 7 aus Stufe 2, nicht zu Stufe 4. Endet Stufe 4 vor Runde 6, werden diese beiden Aufträge trotzdem noch vergeben, als Abschluss der Auflage; sonst nichts über das Stufenende hinaus
- Runde 2 von 6 vergeben: S4-06 bis S4-09 etwa 07:42 UTC, S4-10 und S4-11 etwa 07:43 UTC nach Durchsicht des Gedächtnisses. 6 Subagenten, Fremdmodell in dieser Runde nicht geplant
- Runde 2 von 6 abgeschlossen: 6 Subagenten, 0 Fremdmodell-Anfragen, etwa 50 Minuten nach Git (07:42 UTC bis 78ce5f9 um 08:31:52 UTC). Kein Ausschluss, kein Verfahren mit 34. Zähler nach Justus (09:47 UTC): Spur A 1 von 3, Spur B 1 von 3
- Lesart (e): Rechenblöcke direkt hintereinander ohne Commit dazwischen zählen als ein Block. S4-05 hat damit die Grenze von 30 Minuten überschritten (etwa 38 Minuten), Regelverstoß ohne weitere Folge
- B-020 (R(⟨3,2,7⟩) ≤ 35 über ℤ, also über jedem Körper): **geprüft** nach 5.2, Läufe wiederholt durch S4-10. Kein Fortschritt nach Abbruchregel 2 (Lesart des Orchestrators)
- Fertig mit einem Lean-Satz für die untere Schranke 35 über jedem Körper (geprüft nach 5.1 samt Abgleich des Endsatzes), einem nach 5.2 bestätigten Verfahren mit 34, erschöpftem Budget oder wenn eine Abbruchregel beide Spuren beendet
- Kein Kontakt nach außen. README und `ergebnisse/` bleiben unverändert

## Abschluss Stufe 4

Zusammengestellt von der Schreibhand im Auftrag des Orchestrators, nur aus `LOG.md` und `pruefvermerke/`. Status setzt der Orchestrator.

**Ende:** Stufe 4 endet nach Runde 6, weil das Budget von 6 Runden erschöpft ist. Das Fertig-Kriterium (Lean-Satz für die untere Schranke 35 über jedem Körper, geprüft nach 5.1, oder ein nach 5.2 bestätigtes Verfahren mit 34) ist nicht erfüllt. Spur A: 0 von 3 nach Runde 6, nicht aufgegeben, mit der Stufe beendet. Spur B: aufgegeben nach Runde 4 (Abbruchregel 2). Nach Stufe 4 wird nichts mehr vergeben außer dem Abschluss von Auflage 7 (Zweitlauf-Prüfer A7-Z, dann Textänderung). README und `ergebnisse/` sind in Stufe 4 unverändert.

**Schranken für R(⟨3,2,7⟩):** 34 ≤ R ≤ 35.

- Untere Schranke 34 aus der Literatur: Yangs Satz 1 (B-002, geprüft), für m = 7 ist ⌈(24·7+2)/5⌉ = 34.
- Obere Schranke 35: B-020, geprüft (eigenes Verfahren `verfahren/3x2x7-r35-hk71.json` über ℤ, S4-04, Läufe wiederholt durch S4-10, nach 5.2).

**Was geprüft ist:**

- B-020 (obere Schranke 35).
- B-021 D, erster Satz: Ausschluss des Falls „e = 3 mit (INJ5)“ (über formale Polynome), Lean-Satz `YangBounds.S4BedingterAusschluss.s4_07_D`, Job 139899962532, Abgleich S4-24 und S4-25. Die Lage (B-017 bis B-019) ist dort als Hypothese angenommen, ihre Herleitung ist nicht in Lean.

**Behauptungen B-017 bis B-032:**

| Nr. | Inhalt (kurz) | Status | Bestätigt von |
|---|---|---|---|
| B-017 | Restfall-Rechnung, genau ein Restfall (4, 6, 4) | behauptet | ein Prüfer (S4-01) |
| B-018 | Lemma 15(b) bei d = 2 | behauptet | ein Prüfer (S4-02) |
| B-019 | Lemma I für jede Normalform (yang_n4, d = 2) | behauptet | ein Prüfer (S4-03) |
| B-020 | R(⟨3,2,7⟩) ≤ 35 über ℤ | geprüft | S4-04, S4-10 (5.2) |
| B-021 | S4-07-A bis E | D erster Satz geprüft; A, B, C, E und D zweiter Satz behauptet | Lean `s4_07_D` (Job 139899962532), Abgleich S4-24, S4-25; ein Prüfer (S4-12); Fremdmodell zu D (Runde 3) |
| B-022 | S4-06 A1 bis A6 | behauptet | ein Prüfer (S4-13) |
| B-023 | Satz G (Gleichheitsfall r = 34, m = 7) | behauptet | ein Prüfer (S4-13) |
| B-024 | Satz K | behauptet | ein Prüfer (S4-13; K1, K3 bestätigt, K2 berichtigt) |
| B-025 | Fallunterscheidung nach e und (INJ5) | behauptet | Fall „e = 3 mit (INJ5)“ durch B-021 D geprüft ausgeschlossen, bedingt auf die Lage; Vollständigkeit ein Prüfer (S4-20) |
| B-026 | Satz R (e = 3 ohne (INJ5)), Gestalt im Unterfall (M21) | behauptet | ein Prüfer (S4-19; Vorbehalt zu B (i)) |
| B-027 | E2-A, E2-B, E2-D (e ≤ 2) | behauptet | ein Prüfer (S4-20); E2-D laut S4-28-A gegenstandslos, ungeprüft |
| B-028 | S4-28-A bis C (jede Normalform e ≤ 2 unmöglich) | behauptet | ein Prüfer (S4-34); „dicht und offen“ nur unter S4-21-A |
| B-029 | S4-27-B bis D (Normalform mit e = 3 unmöglich) | behauptet | zwei Prüfer (S4-32, S4-33) und Fremdmodell (Runde 6), bedingt auf die Grundlagen |
| B-030 | Lemma O, Satz G, Lemma F aus S4-21 | behauptet | zwei Prüfer (S4-30, S4-31) für Lemma O, Satz G, Formeln; Lemma F im Wortlaut nicht bestätigt |
| B-031 | Fall r = 34 nach Tsyganov et al.: f = 5 unmöglich, Gestalt bei f = 4 | behauptet | kein Prüfer |
| B-032 | Verschärfung (7′), f = 5 ausgeschlossen bei r = 34 | behauptet | kein Prüfer |

**Die Kette zum Restfall:** Restfall B-017 bis B-019, S4-07 (B-021), B-026 (Satz R), B-030 (Lemma O, Satz G, Lemma F), B-029 (Normalform mit e = 3 unmöglich), B-028 (jede Normalform e ≤ 2 unmöglich). Hielten alle Glieder und passten sie zueinander, wäre jedes Verfahren der Länge 34 ausgeschlossen. **Diese Kette ist nicht geprüft und wird nicht als Ergebnis bezeichnet.**

**Offene Punkte:**

- Lemma F (B-030) braucht die Voraussetzung α_t, α_{t′} ≠ 0; der Wortlaut ist nicht geändert. B-028 stützt sich direkt darauf, B-029 über Satz G.
- Der Wortlaut „aus (B) und (C) allein“ in S4-27-C (B-029) ist zu eng gefasst (alle drei Stimmen).
- Die Glieder des Restfalls (B-017 bis B-019, B-022 bis B-024, B-026 bis B-028) haben je nur einen Prüfer.
- Die Kette ist nicht in Lean formalisiert, außer B-021 D erster Satz.
- Abweichungen von 5.4 (Fristen und Zähler): Prüfer in Runde 6 sahen Zähler- und Budgetstand in Commit-Betreffen der Schreibhand (12e461c, dazu 3815b6c mit einem Status). Kein Urteil sichtbar, die Prüfungen gelten.
- Ein Blind-Sucher nach Abschnitt 6 war auf dieser Plattform nicht erreichbar (Entscheidung von Justus, 11:55 UTC); je Runde lief ein unabhängiger Sucher (nicht blind).

**Verbrauch (aus dem Logbuch, Dauern nach Git):**

| Runde | Subagenten | Fremdmodell | Dauer nach Git |
|---|---|---|---|
| 1 | 5 | 0 | etwa 48 Minuten |
| 2 | 6 | 0 | etwa 50 Minuten |
| 3 | 6 | 1 (0,05 US-$) | etwa 79 Minuten |
| 4 | 6 | 0 | etwa 48 Minuten |
| 5 | 6 | 0 | etwa 36 Minuten |
| 6 | 6 | 1 (0,03 US-$) | etwa 39 Minuten |
| Summe Runden | 35 | 2 (0,08 US-$) | etwa 5 Stunden |

- Außerhalb der Runden: 3 Literaturwachen (PR #102, #115, #122), je 1 Subagent. Zusammen 38 Subagenten in Stufe 4. S4-26 (Auflage 7) belegte einen Platz in Runde 5 und arbeitete danach außerhalb der Plätze weiter; der Zweitlauf-Prüfer A7-Z zählt nicht zu Stufe 4.
- Dauer von Stufe 4 nach Git: Start durch Justus 06:43 UTC (erste Literaturwache ab 06:45:26 UTC) bis Merge f43f265 um 13:52:20 UTC, etwa 7 Stunden 9 Minuten, einschließlich der Pause nach Runde 2 (bis 09:47 UTC) und des Halts nach Runde 4 (bis 12:27 UTC).

## Wiederaufnahme

Entscheidung von Justus vom 26.11.2026, 08:23 UTC: Runde 2 abschließen, dann Pause bis Sonntag, 29.11.2026. Die Pause zählt nicht als Runde und löst keine Abbruchregel aus. **Am 26.11.2026 um 09:47 UTC hat Justus die Pause aufgehoben, Runde 3 darf starten** (beides im Wortlaut im Logbuch).

**Stand bei der Pause** (Runde 2 abgeschlossen, 26.11.2026, 08:31 UTC)

- Budget Stufe 4: 2 von 6 Runden verbraucht (Runde 1: 5 Subagenten, Runde 2: 6 Subagenten), 0 Fremdmodell-Anfragen in der Stufe. Verbleibend: 4 Runden
- Zähler Abbruchregel 2 (Wortlaut Justus, 09:47 UTC): „Zähler nach Runde 2: Spur A 1 von 3, Spur B 1 von 3.“ Lesart (d) gilt nicht
- Laufende Fristen nach Abbruchregel 2 b): keine (Stand bei der Pause). Seit Runde 3: B-021 D geprüft bis Ende Runde 5 (siehe „Aktuelle Stufe“)
- Weitere Fristen: keine mit Datum (die Pause bis 29.11.2026 ist aufgehoben). Offener Punkt ohne Frist: Auflage 7 aus Stufe 2 (Endsatz von mm325_proof entkoppeln, „nicht jetzt“; seit 26.11.2026, 11:40 UTC von Justus freigegeben, Wartungsauftrag in Runde 5)
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
| S4-05 | Unabhängiger Sucher (nicht blind) | Unabhängiger Sucher (nicht blind) | `versuche/s4-blind-r1.md` | erledigt, PR #107 (Merge 412ad8b), `versuche/s4-blind-r1.md`. Nicht entschieden, alles behauptet |
| S4-06 | Spur A: Ausschluss des Restfalls | Beweissucher | `lean/prosa/s4_327_spurA_r2_ausschluss.md` | erledigt, PR #111 (Merge dfd239e). Restfall nicht ausgeschlossen, Lücke Λ, A1 bis A6 behauptet |
| S4-07 | Spur A, Gegenrichtung: aus dem Restfall ein Verfahren mit 34 bauen oder Hindernis benennen | Beweissucher | `lean/prosa/s4_327_spurA_r2_bau.md` | erledigt, PR #113 (Merge 81fa438). Kein Verfahren gebaut, S4-07-A bis E behauptet, Vermutung S4-07-V, Lücken L-1 bis L-4 |
| S4-08 | Spur B: Suche nach 34 mit den erzwungenen Kenngrößen | Verfahrenssucher | `versuche/s4-spurB-r2.md` | erledigt, PR #114 (Merge 78ce5f9). Kein Verfahren mit 34, Werkzeug nicht geeicht (Positivprobe bei 35 ohne Fund). Satz K behauptet |
| S4-09 | Axiom-Bericht für `lemma15b` und `lemma_I` in Actions (nur Workflow) | Lean-Wartung | Workflow | erledigt, PR #108 (Merge 1e4f7b8) und #112 (Merge 645af03). Lauf 45778891656, Job 139769322302: `lemma15b_core`, `lemma15b`, `lemma_I` nur Standard-Axiome, SORRY 0 |
| S4-10 | Prüfung B-020, Wiederholung beider Läufe | Prüfer | `verfahren/3x2x7-r35-pruefung-s4-10.md` | erledigt, PR #109 (Merge e715211). B-020 geprüft nach 5.2 |
| S4-11 | Unabhängiger Sucher (nicht blind) | Unabhängiger Sucher (nicht blind) | `versuche/s4-blind-r2.md` | erledigt, PR #110 (Merge 0ee499f). Satz G behauptet, keine Schranke über 34. Blindheit eingeschränkt (vier Einzeleinträge eingeblendet) |
| S4-12 | Prüfung B-021 (D zuerst und einzeln) | Prüfer | `lean/prosa/s4_327_bericht_s4-12.md` | erledigt, PR #117 (Merge 5cf7f13). B-021 D hält, Vorbehalte im Vermerk |
| S4-13 | Prüfung B-022, B-023, B-024 | Prüfer | `lean/prosa/s4_327_bericht_s4-13.md` | erledigt, PR #116 (Merge bc90720). B-022 und B-023 halten, B-024 K2 wörtlich nicht |
| S4-14 | Spur A: e = 3 ohne (INJ5), beide Richtungen | Beweissucher | `lean/prosa/s4_327_spurA_r3_e3.md` | erledigt in Runde 3, PR #120. Kein vollständiger Ausschluss. Behauptet Satz R, offen Unterfall (M21); S4-07-V im Wortlaut widersprochen (Lage L*), ungeprüft |
| S4-15 | Spur A: e ≤ 2, Ausschluss oder Bau | Beweissucher | `lean/prosa/s4_327_spurA_r3_e2.md` | erledigt in Runde 3, PR #118. Kein vollständiger Ausschluss. Behauptet E2-A (e ∈ {2, 3}), E2-B, E2-D (bedingt unter (INJ-B)); vermutet E2-V |
| S4-16 | Spur B: Positivprobe bei 35, nur bei Bestehen Suche nach 34 | Verfahrenssucher | `versuche/s4-spurB-r3.md` | erledigt in Runde 3, PR #121. Positivprobe bei 35 nicht bestanden (exaktes Runden gescheitert), keine Suche bei 34 |
| S4-17 | Unabhängiger Sucher (nicht blind) | Unabhängiger Sucher (nicht blind) | `versuche/s4-blind-r3.md` | erledigt in Runde 3, PR #119. Rang nicht bestimmt. Behauptet eigenes Verfahren mit 35 und Strukturaussage für 34; vermutet R = 35. Blindheit eingeschränkt (Gedächtnis-Index und vier Einträge) |
| S4-18 | Lean-Formalisierung von B-021 D (erster Satz) mit ausdrücklichen Hypothesen | Formalisierer | `lean/YangBounds/S4BedingterAusschluss.lean` | erledigt in Runde 4, PR #123. `s4_07_D` grün auf main: Job 139886382749, SORRY 0, nur Standard-Axiome |
| S4-19 | Prüfer B-026 | Prüfer | `lean/prosa/s4_327_bericht_s4-19.md` | erledigt in Runde 4, PR #124. A (Satz R), B (ii), B (iii), C halten; B (i) hält inhaltlich, Zusatz „das ist S4-07-D“ nicht entscheidbar |
| S4-20 | Prüfer B-027 (E2-A zuerst) | Prüfer | `lean/prosa/s4_327_bericht_s4-20.md` | erledigt in Runde 4, PR #125. E2-A und E2-B halten; E2-D hält bei (INJ-B) über formale Polynome |
| S4-21 | Spur A: Unterfall (M21) bei e = 3, beide Richtungen | Beweissucher | `lean/prosa/s4_327_spurA_r4_m21.md` | erledigt in Runde 4, PR #127. (M21) nicht vollständig ausgeschlossen. Behauptet S4-21-G, S4-21-K, S4-21-L (nicht B-023/B-024); vermutet S4-21-V, Lücke L-21 |
| S4-22 | Spur B: Positivprobe bei 35 mit exaktem Ergebnis, sonst Ende mit Befund | Verfahrenssucher | `versuche/s4-spurB-r4.md` | erledigt in Runde 4, PR #130. Positivprobe bei 35 bestanden (über ℚ exakt nachgerechnet), Suche bei 34 ohne Fund |
| S4-23 | Unabhängiger Sucher (nicht blind) | Unabhängiger Sucher (nicht blind) | `versuche/s4-blind-r4.md` | erledigt in Runde 4, PR #129. Rang nicht bestimmt. Behauptet S4-23-A, S4-23-B; vermutet R = 35. Eingeblendet: Index und vier Einzeleinträge |
| S4-24 | Aussagen-Abgleich `s4_07_D` gegen B-021 D (erster Satz) | Prüfer | `lean/prosa/s4_327_abgleich_s4-24.md` | erledigt in Runde 5, PR #132. Stimmt überein (formale Lesart von (INJ5)), Vorbehalte V1, V2 |
| S4-25 | Aussagen-Abgleich `s4_07_D` gegen B-021 D, unabhängig von S4-24 | Prüfer | `lean/prosa/s4_327_abgleich_s4-25.md` | erledigt in Runde 5, PR #133. Stimmt überein (formale Lesart von (INJ5)), gleicher Lesart-Vorbehalt |
| S4-26 | Lean-Wartung Auflage 7 (Brücke zu `mm325_proof` aus der Kette des Endsatzes) | Formalisierer | `lean/prosa/auflage7_entkopplung_s4-26.md` | erledigt (Abschluss Auflage 7, außerhalb der Plätze von Runde 6), PR #131 (Merge 62c3dc6). Erster Lauf rot (Job 139911775768); nach Entscheidung von Justus (13:16 UTC) eine Beweisänderung (`SatzB444.lean` Zeile 414), Lauf 45831268262, Job 139948343053 grün, SORRY 0/0 |
| S4-27 | Spur A: Schritt S4-21-V im Unterfall (M21), beide Richtungen | Beweissucher | `lean/prosa/s4_327_spurA_r5_m21.md` | erledigt in Runde 5, PR #135. Behauptet S4-27-B, C, D (B-029): kein Verfahren mit irgendeiner Normalform e = 3, ohne S4-21-V |
| S4-28 | Spur A: Fall e = 2 ohne (INJ-B), beide Richtungen | Beweissucher | `lean/prosa/s4_327_spurA_r5_e2.md` | erledigt in Runde 5, PR #134. Behauptet S4-28-A, B, C (B-028): kein Verfahren, bei dem jede Normalform e ≤ 2 hat |
| S4-29 | Unabhängiger Sucher (nicht blind) | Unabhängiger Sucher (nicht blind) | `versuche/s4-unabhaengig-r5.md` | erledigt in Runde 5, PR #136. Rang nicht bestimmt (34 ≤ R ≤ 35). Behauptet Satz A (f = 5 unmöglich), Satz B (Gestalt bei f = 4) in B-031; vermutet R = 35. Eingeblendet: Index und fünf Einzeleinträge |
| S4-30 | Prüfer B-030 (Lemma O, Satz G, Lemma F aus S4-21) | Prüfer | `lean/prosa/s4_327_bericht_s4-30.md` | erledigt in Runde 6, PR #140. Lemma O, Satz G, Formeln bestätigt; Lemma F nur für Formen ≠ 0 |
| S4-31 | Prüfer B-030, unabhängig von S4-30 | Prüfer | `lean/prosa/s4_327_bericht_s4-31.md` | erledigt in Runde 6, PR #139. Lemma O, Satz G, Formeln bestätigt; Lemma F nur für Formen ≠ 0 |
| S4-32 | Prüfer B-029 (S4-27-B, C, D) | Prüfer | `lean/prosa/s4_327_bericht_s4-32.md` | erledigt in Runde 6, PR #137. B, C, D bestätigt (D bedingt auf die Grundlagen) |
| S4-33 | Prüfer B-029, unabhängig von S4-32 | Prüfer | `lean/prosa/s4_327_bericht_s4-33.md` | erledigt in Runde 6, PR #138. B, C, D erster Satz bestätigt (bedingt); D zweiter Satz nur in einer Lesart |
| S4-34 | Prüfer B-028 (S4-28-A, B, C) | Prüfer | `lean/prosa/s4_327_bericht_s4-34.md` | erledigt in Runde 6, PR #141. A, B, C bestätigt; Zusatz „dicht und offen“ nur unter S4-21-A |
| S4-35 | Unabhängiger Sucher (nicht blind) | Unabhängiger Sucher (nicht blind) | `versuche/s4-unabhaengig-r6.md` | erledigt, PR #142 (Merge f43f265). Rang nicht bestimmt; B-032 angelegt, behauptet |
| A7-Z | Zweitlauf-Prüfer Auflage 7 (wiederholter Lauf, nur Beweiskörper gegenüber `main` geändert) | Prüfer | `lean/prosa/a7_zweitlauf_bericht.md` | erledigt, PR #143 (Merge 7a5c077). Lauf 45833618872, Job 139956567190 auf 62c3dc6. B-016 bleibt geprüft |
| A7-T | Textänderung README und `ergebnisse/rang-444.md` (Abschluss Auflage 7) | Schreiber | `lean/prosa/a7_textaenderung.md` | erledigt, PR #144 (Merge f16a7e8). Auflage 7 abgeschlossen |
| S5-LW | Literaturwache vor Stufe 5 (Abschnitt 7, mit Palomar) | Literaturwächter | `lit/WACHE-2026-11-26-S5.md` | erledigt, PR #145 (Merge e671dad). Nichts Neues, Abbruchregel 3 greift nicht. Abweichung von CLAUDE.md Regel 9 (ein GET an die Einreich-Domain, vom Proxy abgewiesen, nichts gesendet) |
| S5-01 | Spur K: Zusammenführung der Kette zu 3×2×7 | Beweissucher | `lean/prosa/s5_327_kette.md` | erledigt, PR #148 (Merge a32831a). Glieder K-1 bis K-41, B-033 angelegt |
| S5-02 | Spur P: Anforderungen von Palomar | Bearbeiter | `palomar/ANFORDERUNGEN.md` | erledigt, PR #146 an `portierung` (Merge 9539e90). P-1 bis P-51, sechs offene Fragen (siehe Stufe 5) |
| S5-03 | Spur P: Portierung (Werkzeugprobe, Toolchain und Mathlib, Brücke und `mm325_proof` entfernen, Module in Importreihenfolge) | Formalisierer | `lean/prosa/s5_portierung_s5-03.md` | geliefert ohne lokalen Bau, PR #147 an `portierung` (Merge c4339fb). Lean v4.36.0, Mathlib v4.36.0. Läufe auf d28375f alle failure, kein Modul der Kette baut. cache.mathlib.org gesperrt |
| S5-04 | Spur K: Prüfer K-1 bis K-12 (Zeilen 109–248), erste Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-04.md` | erledigt, PR #149 (Merge 592d6d6). Eingetragen in `pruefvermerke/B-033.md` |
| S5-05 | Spur K: Prüfer K-13 bis K-20 (Zeilen 249–378), erste Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-05.md` | erledigt, PR #150 (Merge a8311ee). Eingetragen in `pruefvermerke/B-033.md` |
| S5-06 | Spur K: Prüfer K-21 bis K-31 (Zeilen 379–549), erste Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-06.md` | erledigt, PR #151 (Merge 9a77df1). Eingetragen in `pruefvermerke/B-033.md` |
| S5-07 | Spur K: Prüfer K-32 bis K-41 (Zeilen 550–752), erste Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-07.md` | erledigt, PR #152 (Merge 3565149). Eingetragen in `pruefvermerke/B-033.md`; Hinweis zur Struktur vermerkt |
| S5-08 | Spur P: Aussagen-Datei, Lösungs-Modul, `comparator.json`, `formalization.yaml` (Platzhalter) | Formalisierer | `palomar/s5-08-bericht.md` | geliefert, nicht gebaut, PR #153 an `portierung` (Merge 4cad1ca). Challenge, Definitions, Solution, `comparator.json`, `formalization.yaml` (Platzhalter für Justus) |
| S5-09 | Spur K: Prüfer K-1 bis K-12 (Zeilen 109–248), zweite Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-09.md` | erledigt, PR #156 (Merge 893eedf). K-1 bis K-12 zweite Bestätigung |
| S5-10 | Spur K: Prüfer K-13 bis K-20 (Zeilen 249–378), zweite Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-10.md` | vergeben in Runde 3, etwa 15:38 UTC |
| S5-11 | Spur K: Prüfer K-21 bis K-31 (Zeilen 379–549), zweite Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-11.md` | erledigt, PR #155 (Merge e66f391). K-21 bis K-31 zweite Bestätigung |
| S5-12 | Spur K: Prüfer K-32 bis K-35 (Zeilen 550–627), zweite Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-12.md` | erledigt, PR #154 (Merge ddb64d1). K-32 bis K-35 zweite Bestätigung |
| S5-13 | Spur K: Prüfer K-36 bis K-41 mit Prüfung der Quantoren (Zeilen 628–752, Rahmen 550–553), zweite Lesung | Prüfer | `lean/prosa/s5_kette_bericht_s5-13.md` | erledigt, PR #157 (Merge 3ec3f62). K-36 bis K-39 und K-41 zweite Bestätigung; zu K-40 Lücke gemeldet (Urteil „offen“) |
| S5-14 | Spur P: Cache-Probe, ggf. Bau der Kette auf `portierung`, Belege je Anforderung | Formalisierer | `palomar/BELEGE.md` | vergeben in Runde 3, etwa 15:38 UTC, PR an `portierung` |

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

- ~~Für später (Auflage 7 von Justus, 25.11.2026): die Kette des Endsatzes vom Paket `mm325_proof` entkoppeln.~~ Erledigt am 26.11.2026 (S4-26, A7-Z, A7-T)
- `ergebnisse/rang-444.md` Zeile 28 nennt als Lean-Quellstand noch `c3c3884` (laut Bericht A7-T)
- `lean/README.md` Zeilen 26 und 132 veraltet: Zeile 26 nennt die Abhängigkeit `mm325_lower_bound` ohne die Trennung in `BrueckeMM325.lean`, Zeile 132 drei `sorry` aus früherem Stand (laut Berichten S4-26 und A7-T)

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
