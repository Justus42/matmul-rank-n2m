# Logbuch

Nur anhängen, nie umschreiben. Ein Eintrag pro Runde.

Aufbau eines Eintrags: Datum, Rundennummer, Aufträge, gelieferte Dateien, neuer Status je Behauptung, Entscheidung für die nächste Runde.

---

## 25.11.2026 · Runde 0 (Einrichtung, zählt nicht zum Budget)

**Was geschah**

- Problemwahl nach Sichtung mehrerer Kandidaten: exakter Rang der Formate ⟨n,2,m⟩
- Repo angelegt, Protokoll Version 0.1 eingestellt
- Ordnerstruktur, STATUS.md und Startliste der Behauptungen angelegt

**Gelieferte Dateien**

- PROTOKOLL.md, STATUS.md, LOG.md, README.md, CLAUDE.md
- `behauptungen/README.md` mit fünf Startbehauptungen (alle Status behauptet)
- `lit/QUELLEN.md`, `lit/WACHE.md`

**Bekannte Lücken aus der Einrichtung**

- Das Repo fallnlove/mm325_proof ließ sich bei der Sichtung nicht öffnen. Stand und Lizenz sind unbekannt
- Die Zeile 3×2×7 der Ausgangstabelle ist aus den Formeln berechnet, nicht aus einer Arbeit übernommen
- Für 4×2×5 ist die Quelle der oberen Schranke 32 nicht belegt

**Entscheidung**

Stufe 0 ist freigegeben. Nächste Runde beginnt mit Literaturwache und den Aufträgen A-01, A-04, A-05, A-06, A-07.

---

## 25.11.2026 · Regeländerung durch Justus (Protokoll Version 0.2, zählt nicht zum Budget)

**Anlass**

Der erste Lauf blieb an zwei Stellen stehen: Threads fragten vor dem Commit nach, und Pull Requests warteten auf den Merge durch Justus.

**Geändert**

- Threads committen ihre Zieldatei ohne Rückfrage und öffnen einen Pull Request
- Der Orchestrator merged Pull Requests selbst, beantwortet Rückfragen der Threads und wechselt die Stufen 0 → 1 → 2 selbst
- Aufträge einer Runde hängen nie voneinander ab
- Lizenzfragen entscheidet der Orchestrator nach fester Regel
- Neu: Abschnitt 11 im Protokoll

**Unverändert bei Justus**

Budgets, Abbruchregeln, Änderungen an Protokoll und CLAUDE.md, Veröffentlichung, Budget für Stufe 3.

**Hinweis**

Das ist ein Test. Ob die Plattform dem Orchestrator das Mergen erlaubt, ist offen und im nächsten Logbuch-Eintrag festzuhalten.

---

## 25.11.2026 · Runde 1 (Stufe 0, Runde 1 von 2)

**Literaturwache**

`lit/WACHE.md` enthält keinen Eintrag für Runde 1. Der letzte Eintrag stammt aus der Einrichtung.

**Aufträge und Subagenten**

Drei Subagenten: A-01, A-04 bis A-06 (ein Thread), A-07.

**Gelieferte Dateien**

- A-01: `lit/LIZENZEN.md`, Pull Request #2
- A-04, A-05, A-06: `lit/QUELLEN.md`, Pull Request #4
- A-07: `verfahren/README.md`, Pull Request #1 und Nachtrag Pull Request #3

**Befunde (alle Status behauptet)**

- A-01: Das Repo fallnlove/mm325_proof ist erreichbar und hat keine Lizenz. Entscheidung des Orchestrators nach 11.3: Verweis statt Kopie.
- A-01, Nebenbefund: Die SHA-256-Prüfsumme in deren `verification.txt` passt nicht zur eingecheckten Lean-Datei.
- A-04 bis A-06: Die Tabelle in Abschnitt 2 ist gegen die Volltexte bestätigt, mit einer Präzisierung. Die obere Schranke 32 bei 4×2×5 stammt von AlphaEvolve (arXiv:2506.13131), nutzt Koeffizienten ±1/2 und gilt nicht in Charakteristik 2. Dort liegt der Rang zwischen 31 und 33.
- A-04: Die untere Schranke 30 bei 3×2×6 stützt sich nur auf Yang v3.
- A-06: Shitovs Beweis ist ein ResearchGate-Manuskript, DOI 10.13140/RG.2.2.29432.61441. Das Original wurde nicht geöffnet.
- A-07: Das Datenformat für Verfahren ist festgelegt. Der Orchestrator hat die zehn Annahmen aus Abschnitt 8 von `verfahren/README.md` unverändert bestätigt.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. Alle neuen Befunde haben den Status behauptet. Ein Merge ändert keinen Status.

**Merges**

Der Orchestrator hat entschieden, dass die Pull Requests #2, #3 und #4 die Merge-Bedingungen aus 11.2 erfüllen. Merge-Stand auf `main` beim Schreiben dieses Eintrags: #4, #2 und #3 sind am 25.11.2026 zwischen 00:52 und 00:53 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42. Ob Justus selbst gemergt hat oder eine Sitzung über dieses Konto, ist aus GitHub nicht zu unterscheiden. Pull Request #1 hat Justus vor der Regeländerung gemergt. Die Frage aus dem vorigen Eintrag, ob die Plattform dem Orchestrator das Mergen erlaubt, ist damit noch nicht eindeutig beantwortet.

**Abbruchregeln**

Abbruchregel 4 ist nicht ausgelöst. Keine Quelle enthält einen Fehler, unscharf war die eigene Tabelle im Protokoll.

**An Justus gemeldet**

- Die Zeile 4×2×5 der Protokolltabelle sollte präzisiert werden (Zahlbereich der oberen Schranke).
- Das Budget von 2 Runden für Stufe 0 reicht wegen der Abhängigkeiten nicht für A-03, A-10 und A-11.

**Entscheidung für Runde 2**

Literaturwache, dann A-02, A-08, A-09.

**Nachtrag zu Runde 1 (Angaben des Orchestrators)**

- Yang v3 nennt auf S. 1 das Format 4×2×5 „one away“ von der oberen Schranke. In Charakteristik 2 stimmt das nicht (Rang 31 bis 33). Der Orchestrator hat Justus die Auslegung von Abbruchregel 4 vorgelegt. Justus hat entschieden: kein Fundamentfehler, die Arbeit geht weiter.
- Merge-Stand: PR #2 (aa2ed0d), PR #3 (c00ccea) und PR #4 (c498f9b) liegen auf `main`.
- Die drei zugehörigen Zweige ließen sich nicht löschen, die Plattform hat es verweigert.

---

## 25.11.2026 · Budgetänderung durch Justus (zählt nicht zum Budget)

Justus hat am 25.11.2026 um 00:54 Uhr (MEZ) geschrieben:

> Freigabe zu weiteren Runden nach deinem Ermessen

Damit gibt Justus weitere Runden über das Startbudget von Stufe 0 hinaus frei, nach Ermessen des Orchestrators. Das ist eine Budgetänderung durch Justus nach Abschnitt 6, keine Verlängerung durch einen Agenten. Die Tabelle in Abschnitt 6 von PROTOKOLL.md bleibt unverändert.

---

## 25.11.2026 · Runde 2 (Stufe 0, Runde 2 des Startbudgets)

**Literaturwache**

`lit/WACHE.md`, Pull Request #5. Keines der Ziele ist anderswo gelöst, Abbruchregel 3 greift nicht. Die arXiv-Listen von cs.CC wurden nicht vollständig durchgesehen. arXiv:2603.07280 (Wang) liegt jetzt in Fassung v11 mit neuem Titel vor.

**Aufträge und Subagenten**

Vier Subagenten: Literaturwache, A-02, A-08, A-09.

**Gelieferte Dateien**

- Literaturwache: `lit/WACHE.md`, Pull Request #5
- A-02: `lean/NACHBAU.md`, Pull Request #8
- A-08: `pruefer/python/`, Pull Request #6
- A-09: `pruefer/rust/`, Pull Request #7

**Befunde (alle Status behauptet)**

- A-02: Der Build von fallnlove/mm325_proof am Commit 759cf4a lief lokal grün. `#print axioms` zeigt nur die drei Standard-Axiome `propext`, `Classical.choice` und `Quot.sound`. Die Prüfsummen-Abweichung in deren `verification.txt` ist bestätigt. Der Status bleibt behauptet, bis der Build in GitHub Actions grün ist (Protokoll 5.1 Punkt 4).
- A-08 und A-09: Beide Prüfprogramme nehmen Strassens Verfahren an und lehnen die falsche Fassung ab. Sie wurden unabhängig voneinander geschrieben. Offene Formatfälle hat jeder Subagent selbst entschieden und in seiner README notiert.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. Alle neuen Befunde haben den Status behauptet.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #5 (e0ea135), #6 (76578ec), #7 (3b40c45) und #8 (36c86ac) sind am 25.11.2026 zwischen 00:54 und 01:26 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Entscheidung für Runde 3**

Runde 3 mit A-03, A-10, A-11. Sie liegt über dem Startbudget von 2 Runden und ist durch Justus' Freigabe vom 25.11.2026 gedeckt (siehe Eintrag „Budgetänderung durch Justus“).

---

## 25.11.2026 · Runde 3 (Stufe 0, über dem Startbudget, durch Justus' Freigabe gedeckt)

**Aufträge und Subagenten**

Drei Subagenten: A-03, A-10, A-11.

**Gelieferte Dateien**

- A-11: `.github/workflows/lean-build.yml`, Pull Request #9
- A-03: `behauptungen/B-001.md`, Pull Request #10
- A-10: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json`, Pull Request #11

**Befunde**

- A-11: Der Lean-Build von fallnlove/mm325_proof am Commit 759cf4a ist in GitHub Actions grün, Lauf 45518440779 (https://github.com/Justus42/matmul-rank-n2m/actions/runs/45518440779, Ergebnis success, am Kopf-Commit ecd0032 von PR #9). Die Axiom-Prüfung zeigt nur `propext`, `Classical.choice` und `Quot.sound`.
- A-03: Prüfer und Fremdmodell (`gemini-4-carbon` über die Gemini Bridge, unabhängig eingeholt) bestätigen, dass `theorem_one_tensorRank` Satz 1 aus arXiv:2609.22054v1 ist: R > 24m/5 über jedem Körper, für m = 5 also R ≥ 25. Die obere Schranke ≤ 25 ist dort nicht formalisiert.
- A-10: Die beiden Verfahren liegen über ℤ vor. Sie sind nach dem Bauplan von Hopcroft und Kerr neu konstruiert, mit den Bausteinen aus Lacelle, arXiv:2606.13408, Abschnitt 7.1. Das Original HK71 wurde nicht gelesen. Beide Prüfprogramme (Python und Rust, von verschiedenen Subagenten unabhängig geschrieben) geben ANGENOMMEN. Die Ausgaben der Prüfläufe sind in Pull Request #11 und in der Commit-Nachricht belegt, nicht als eigene Datei im Repo.
- A-10, Nebenbefund: Die Programme urteilen in zwei Fällen verschieden, die das Format offen lässt. Bei einem Zusatzschlüssel in `origin` sagt Python FEHLERHAFT und Rust ANGENOMMEN. Bei einem ungültigen Datum wie 2026-02-30 sagt Python ANGENOMMEN und Rust FEHLERHAFT. Die gelieferten Verfahrensdateien sind davon nicht betroffen.

**Neuer Status je Behauptung (nach Abschnitt 5, Belege oben)**

- Obere Schranken 25 für 3×2×5 und 30 für 3×2×6 über ℤ, durch die Verfahren aus A-10: **geprüft** nach 5.2 Punkt 1 bis 3. Nach `verfahren/README.md` Abschnitt 4 gilt ein Verfahren über ℤ über jedem Körper.
- Untere Schranke R(⟨3,2,5⟩) ≥ 25 über jedem Körper: **geprüft** nach 5.1 Punkt 1 bis 4 (Build und Axiome in Actions durch A-11, Aussagen-Abgleich durch A-03).
- B-001 „Rang von ⟨3,2,5⟩ ist 25, über jedem Körper“: **geprüft**. Die Aussage ist durch die beiden vorigen Punkte vollständig gedeckt, die untere Schranke durch den Lean-Satz und die obere durch das ℤ-Verfahren mit 25 Produkten.
- B-002 bis B-005: unverändert **behauptet**. Für das Verfahren mit 30 Produkten gibt es keine eigene Behauptungsdatei. Es ist in der Übersicht in `behauptungen/README.md` vermerkt. Der Rang 30 von ⟨3,2,6⟩ ist damit nicht geprüft, weil die untere Schranke (B-002) noch behauptet ist.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #10 (bdf95e7), #9 (4644cfc) und #11 (cac2c55) sind am 25.11.2026 zwischen 01:31 und 01:33 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Fertig-Kriterium Stufe 0**

Alle vier Punkte sind erfüllt: Lean-Build grün (Lauf 45518440779), Axiom-Bericht (`lean/NACHBAU.md` und Lauf 45518440779), Tabelle bestätigt oder korrigiert (`lit/QUELLEN.md`), beide Prüfprogramme bestätigen mindestens zwei bekannte Verfahren (3×2×5 mit 25 und 3×2×6 mit 30, dazu Strassen).

Stufe 0 ist nach 3 Runden abgeschlossen. Die dritte Runde lag über dem Startbudget von 2 und war durch Justus' Freigabe vom 25.11.2026 gedeckt.

**Entscheidungen des Orchestrators**

- Stufenwechsel nach Abschnitt 3: Wechsel zu Stufe 1 (Yangs dritte Fassung formalisieren), Rundenbudget 8.
- Format: Unbekannte Zusatzschlüssel gelten überall als FEHLERHAFT, ungültige Kalenderdaten ebenfalls. Die Anpassung von Format und Prüfprogrammen wird in Stufe 1 vergeben.

**Entscheidung für Runde 1 der Stufe 1**

Vergeben: S1-01 Lean-Projektgerüst (`lean/`), S1-02 Prosa-Beweis der Schranke für n = 3, S1-03 Prosa-Beweis der Schranke für m ≥ n ≥ 4, S1-04 Festlegung der zwei Randfälle im Format (`verfahren/README.md`).

---

## 25.11.2026 · Stufe 1, Runde 1, Zwischenstand und Halt

**Aufträge und Subagenten**

Vier Subagenten: S1-01, S1-02, S1-03, S1-04. S1-01 (Lean-Projektgerüst) läuft beim Schreiben dieses Eintrags noch.

**Gelieferte Dateien**

- S1-04: `verfahren/README.md`, Pull Request #12
- S1-02: `lean/prosa/yang_n3.md`, Pull Request #13
- S1-03: `lean/prosa/yang_n4.md`, Pull Request #14

**Befunde**

- S1-04: Die Randfälle sind in strenger Lesart festgelegt (Abschnitt 9 des Formats). „-0“ bleibt erlaubt, das hat der Orchestrator bestätigt. Was die Prüfprogramme anpassen müssen, steht in Abschnitt 10.
- S1-02: Prosa-Beweis für n = 3. Der Beweissucher fand keine Lücke und sechs Ungenauigkeiten im Paper ohne Einfluss auf die Aussage, darunter einen Schreibfehler in der Basiswechsel-Formel in Abschnitt 2. Status behauptet.
- S1-03: Prosa-Beweis für m ≥ n ≥ 4. Der Beweissucher fand sieben Darstellungslücken L1 bis L7. Die schwerste ist L5: Der Beweis von Lemma 13 ist im Paper falsch aufgeschrieben. Wörtlich genommen ist Γ = 0, H(Γ) ist falsch angegeben, und L̄ und H̄ sind nicht wohldefiniert. Nach Einschätzung des Beweissuchers stimmt die Aussage von Lemma 13. Er hat eine Reparatur über den Quotienten Q/im F₁ aufgeschrieben und hält L5 nicht für eine Lücke im Sinne von Abbruchregel 4. Status behauptet, die Reparatur ist ungeprüft.
- S1-03, Nebenbefund, Status vermutet: Die Voraussetzung m ≥ n − 1 könnte genügen.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. Alle neuen Befunde haben den Status behauptet, der Nebenbefund zu m ≥ n − 1 hat den Status vermutet.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #12 (e8d9cb0), #13 (d003ed0) und #14 (0fda45b) sind am 25.11.2026 zwischen 01:37 und 01:41 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Entscheidung des Orchestrators: Halt nach 11.4**

L5 ist ein Fehler im Beweis einer Quelle (Lemma 13 in Yang v3), gefunden in Stufe 1. Damit steht Abbruchregel 4 in Frage. Der Orchestrator darf keine Abbruchregel aussetzen und legt sie nicht selbst zu seinen Gunsten aus. Er hält deshalb nach 11.4 an und berichtet an Justus. Bis Justus entschieden hat, werden keine neuen Aufträge vergeben. S1-01 darf seine laufende Lieferung abschließen.

---

## 25.11.2026 · Stufe 1, Runde 1, Abschluss

**Gelieferte Dateien**

- S1-01: Lean-Projekt in `lean/` (`lakefile`, `YangBounds/Basic.lean`, `YangBounds/Statements.lean`, `YangBounds.lean`, `Axioms.lean`), Pull Request #15

**Befunde (alle Status behauptet)**

- S1-01: Das Lean-Projekt baut lokal. fallnlove/mm325_proof am Commit 759cf4a ist als Lake-Abhängigkeit per Git-URL eingebunden, also Verweis statt Kopie nach 11.3. Das Projekt enthält Definitionen und die Aussagen von Yangs Satz 1 und Satz 2. Die Folgerungen „Rang von 3×2×6 ist 30“ und „Rang von 4×2×4 ist mindestens 25“ sind daraus hergeleitet.
- Offen sind genau drei `sorry` in `lean/YangBounds/Statements.lean`: Satz 1, Satz 2 und die obere Schranke 30 für 3×2×6.
- Der Actions-Workflow baut `lean/` noch nicht. Ein lokaler Build zählt nach 5.1 Punkt 4 nicht.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. Alle Sätze des Lean-Projekts haben den Status behauptet.

**Merges**

PR #15 (ed591d1) ist am 25.11.2026 um 02:05 Uhr (MEZ) gemergt, unter dem GitHub-Konto Justus42.

**Runden**

Runde 1 der Stufe 1 ist abgeschlossen. Verbraucht in Stufe 1: 1 von 8.

**Entscheidung**

Der Halt nach Abbruchregel 4 (L5, Lemma 13 in Yang v3) besteht weiter. Justus ist gefragt. Es ist keine neue Runde vergeben.

---

## 25.11.2026 · Entscheidung von Justus zum Halt, Stufe 1, Runde 2 vergeben

**Entscheidung von Justus**

Der Orchestrator hat Justus gefragt, ob Abbruchregel 4 wegen des falsch aufgeschriebenen Beweises von Lemma 13 in Yang v3 (L5) greift. Justus hat am 25.11.2026 auf der Entscheidungskarte gewählt: „Weiter, Reparatur prüfen lassen“. Die Angabe stammt vom Orchestrator, der die Karte gestellt hat. Damit ist der Halt aufgehoben.

**Literaturwache**

Seit dem Eintrag zu Runde 2 der Stufe 0 läuft dieselbe Sitzung des Orchestrators. Es gibt deshalb keinen neuen Eintrag in `lit/WACHE.md`.

**Aufträge für Runde 2 der Stufe 1**

- S1-05: Prüfung des Prosa-Beweises für n = 3, Prüfer und Fremdmodell, Zieldatei `lean/prosa/yang_n3_pruefung.md`
- S1-06: Prüfung des Prosa-Beweises für n ≥ 4 mit Schwerpunkt L5, Prüfer und Fremdmodell, Zieldatei `lean/prosa/yang_n4_pruefung.md`
- S1-07: Python-Prüfprogramm an Abschnitt 9 und 10 des Formats anpassen, Zieldatei `pruefer/python/`
- S1-08: Rust-Prüfprogramm ebenso anpassen, Zieldatei `pruefer/rust/`

---

## 25.11.2026 · Stufe 1, Runde 2, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S1-05, S1-06, S1-07, S1-08.

**Gelieferte Dateien**

- S1-05: `lean/prosa/yang_n3_pruefung.md`, Pull Request #20
- S1-06: `lean/prosa/yang_n4_pruefung.md`, Pull Request #18
- S1-07: `pruefer/python/`, Pull Requests #16 und #19
- S1-08: `pruefer/rust/`, Pull Request #17

**Befunde (alle Status behauptet)**

- S1-05: Der Prüfer hat keine Einwände gegen den Prosa-Beweis für n = 3. Die Aussage über jedem Körper und die Bedingung m ≥ 2 sind bestätigt. Neuer Befund im Paper: Yangs Einleitung gibt das Ergebnis von Tsyganov u. a. als R > ⌈24m/5⌉ wieder statt als R > 24m/5. Das berührt den Beweis nicht.
- S1-05, Fremdmodell: `gemini-4-carbon` hat nur eine gekürzte Fassung gelesen, auf niedriger Denkstufe. Der Orchestrator hat deshalb einen Nachtrag verlangt, bei dem das Fremdmodell die ungekürzte Datei als Batch-Auftrag liest. Die Formalisierung von n = 3 wartet auf diesen Nachtrag.
- S1-06: Der Prüfer hat keine Einwände gegen den Prosa-Beweis für n ≥ 4. Befund L5 ist bestätigt: Der Beweis von Lemma 13 ist im Paper wörtlich falsch. Die Reparatur über Q/im F₁ ist nach dem Prüfbericht lückenlos, und die Aussage gilt über jedem Körper. `gemini-4-carbon` stimmt unabhängig zu. Es nennt zwei Vorbehalte (den Fall d = 2 und einen Schritt in Lemma 15(b)), die laut Bericht keine Einwände sind. Gegen den Nebenbefund m ≥ n − 1 gibt es keine Einwände, er bringt aber keine neue Schranke. Es gab Rechenproben an 420 Zufallsfällen, dabei blieb Bedingung (N2) ungeprüft.
- S1-07: Das Python-Prüfprogramm ist an Abschnitt 9 und 10 des Formats angepasst und hat 89 Tests. Die Grenze von 4300 Stellen ist behoben. Bei einem internen Fehler gibt das Programm den eigenen Rückgabewert 3 zurück. Das hat der Subagent selbst entschieden, das Format legt es nicht fest.
- S1-08: Das Rust-Prüfprogramm ist angepasst und hat 41 Tests. Der Zeilenumbruch durch Steuerzeichen ist behoben.
- Beide Programme geben für `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` weiter ANGENOMMEN.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. Die Prosa-Prüfungen erfüllen 5.1 nicht, weil es noch keinen Lean-Beweis gibt. Alle neuen Befunde haben den Status behauptet.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #17 (1265218), #16 (9440cca), #18 (4e3d275), #19 (1c1d996) und #20 (ddebdc0) sind am 25.11.2026 zwischen 05:55 und 06:08 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Runden**

Verbraucht in Stufe 1: 2 von 8.

**Offen für spätere Runden**

- Nachtrag des Fremdmodells zu S1-05 mit der ungekürzten Datei, darauf wartet die Formalisierung von n = 3
- Beide Prüfprogramme auf denselben Testfällen abgleichen
- Rückgabewert bei internem Fehler im Format festlegen
- Actions-Workflow für `lean/`

---

## 25.11.2026 · Fremdmodell nicht verfügbar, Stufe 1, Runde 3 vergeben

**Nachtrag des Fremdmodells zu S1-05 gescheitert**

Der Nachtrag, bei dem das Fremdmodell die ungekürzte Fassung von `lean/prosa/yang_n3.md` lesen sollte, ist gescheitert. Das Gemini-Projekt hat seine monatliche Ausgabengrenze erreicht.

Entscheidung des Orchestrators: Er weicht nicht auf ein anderes Konto (OpenRouter) aus. Eine Ausgabengrenze ist eine Budgetgrenze von Justus. Der Vorgang ist an Justus gemeldet.

Das bisherige Gegenlesen zu n = 3 gilt als erfolgt und ist als **schwach** vermerkt, weil das Modell nur die gekürzte Fassung auf niedriger Denkstufe gelesen hat. Der strenge Nachtrag bleibt offen. Im vorigen Eintrag stand, dass die Formalisierung von n = 3 auf diesen Nachtrag wartet. Nach dieser Entscheidung beginnt sie auf Grundlage des schwachen Gegenlesens.

**Aufträge für Runde 3 der Stufe 1**

- S1-09, S1-10, S1-11: Formalisierung von Yangs Satz 1 in den drei Teilen nach Abschnitt 9 von `lean/prosa/yang_n3.md`, Zieldateien `YangN3Teil1.lean`, `YangN3Teil2.lean`, `YangN3Teil3.lean`
- S1-12: Obere Schranke 30 für 3×2×6 in Lean, aus dem Verfahren von A-10, Zieldatei `Upper3x2x6.lean`

**Hinweis für spätere Aussagen-Abgleiche**

Ein Aussagen-Abgleich nach 5.1 Punkt 3 braucht das Fremdmodell. Dafür muss Justus entweder die Ausgabengrenze anheben oder den Text selbst an ein Fremdmodell weitergeben.

---

## 25.11.2026 · Entscheidung von Justus zu Fremdmodellen (zählt nicht zum Budget)

Justus hat am 25.11.2026 um 06:34 Uhr (MEZ) geschrieben:

> Arbeit ohne Fremdmodelle vorerst. Bei kritischen Punkten GPT 6.2 Sol high via Bridge batch

**Auslegung des Orchestrators**

- Als kritisch gelten die Aussagen-Abgleiche nach 5.1 Punkt 3, weil ohne sie kein Status geprüft möglich ist. Ebenso kritisch sind Befunde, die eine Abbruchregel berühren. Dafür wird GPT 6.2 Sol mit hoher Denkstufe als Batch-Auftrag über die Bridge eingesetzt.
- Das Gegenlesen von Prosa-Beweisen durch ein Fremdmodell vor einer Formalisierung (Abschnitt 4) entfällt vorerst.
- Der strenge Nachtrag des Fremdmodells zu n = 3 (S1-05) entfällt ebenfalls.

---

## 25.11.2026 · Stufe 1, Runde 3, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S1-09, S1-10, S1-11, S1-12.

**Gelieferte Dateien**

- S1-09: `lean/YangBounds/YangN3Teil1.lean`, Pull Request #21 (dazu `globs` im Lakefile)
- S1-10: `lean/YangBounds/YangN3Teil2.lean`, Pull Request #23
- S1-11: `lean/YangBounds/YangN3Teil3.lean`, Pull Request #22
- S1-12: `lean/YangBounds/Upper3x2x6.lean`, Pull Request #24, dazu `versuche/V-S1-12-simp-matrixliterale.md` (gescheiterter erster Ansatz)

**Befunde (alle Status behauptet)**

- S1-09: Körpererweiterung und `yang_theorem_one_of_infinite`, ohne `sorry`.
- S1-10: `exists_stronglyNormalized`, ohne `sorry`. Bei der Wahl der Determinante weicht der Beweis von der Prosa ab. Das hat keine Folgen für die Aussage.
- S1-11: `yang_n3_of_stronglyNormalized`, ohne `sorry`. Aus m ≥ 2, SN1 und SN2 folgt 24m + 2 ≤ 5r.
- S1-12: `tensorRank K 3 2 6 ≤ 30` über jedem Körper, aus dem Verfahren von A-10, mit `decide +kernel`, ohne `sorry`.
- In allen vier Dateien zeigt die lokale Axiom-Prüfung nur `propext`, `Classical.choice` und `Quot.sound`.
- Die drei `sorry` in `lean/YangBounds/Statements.lean` (Satz 1, Satz 2, obere Schranke 30 für 3×2×6) stehen beim Schreiben dieses Eintrags noch. Die neuen Sätze sind dort noch nicht eingesetzt.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. Alle Status bleiben behauptet, weil Actions `lean/` noch nicht baut und der Aussagen-Abgleich fehlt.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #21 (ea6b650), #23 (747a2ad), #22 (640685f) und #24 (edb6814) sind am 25.11.2026 zwischen 06:28 und 06:36 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Runden**

Verbraucht in Stufe 1: 3 von 8.

**Entscheidung für Runde 4 der Stufe 1**

- S1-13: Satz 1 zusammensetzen und in `Statements.lean` einsetzen, Zieldatei `YangN3.lean`
- S1-14: Actions-Workflow für `lean/` mit Axiom-Bericht je Satz
- S1-15: Lemma 13 in reparierter Fassung, Zieldatei `YangN4Lemma13.lean`
- S1-16: Hauptbeweis von Satz 2 mit Lemma 13 als Hypothese, Zieldatei `YangN4Haupt.lean`

---

## 25.11.2026 · Stufe 1, Runde 4, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S1-13, S1-14, S1-15, S1-16.

**Gelieferte Dateien**

- S1-13: `lean/YangBounds/YangN3.lean`, `lean/YangBounds/CeilBound.lean`, Änderung an `lean/YangBounds/Statements.lean`, Pull Request #27
- S1-14: `.github/workflows/lean-project.yml`, Pull Request #25
- S1-15: `lean/YangBounds/YangN4Lemma13.lean`, Pull Request #26
- S1-16: `lean/YangBounds/YangN4Haupt.lean`, Pull Request #28

**Befunde (alle Status behauptet)**

- S1-13: Satz 1 ist zusammengesetzt und die obere Schranke 30 eingesetzt. `yang_theorem_one` und `rank_three_two_six` kommen ohne `sorry` aus. Der Actions-Lauf 45556926418 (success, am Kopf-Commit a5e302c von PR #27) meldet dafür nur Standard-Axiome. `ceil_bound_iff` wurde unverändert nach `CeilBound.lean` verschoben, um einen Importzyklus zu vermeiden.
- S1-14: Der Workflow „Lean build (own project lean/)“ baut `lean/` und stuft je Hauptsatz die Axiome ein. Erster Lauf ist 45555275380 (success, am Kopf-Commit 07b57b2 von PR #25).
- S1-15: Lemma 13 ist in der reparierten Fassung bewiesen, ohne `sorry`. Die Reparatur trägt. Abweichend von der Prosa ist Lemma 11 per Induktion zusammen mit Lemma 13 bewiesen.
- S1-16: Der Hauptbeweis von Satz 2 steht, mit Lemma 13 als Hypothese und ohne `sorry`. Er weicht an zwei Stellen von der Prosa ab, ohne Folgen für die Aussage.
- Das einzige verbleibende `sorry` ist `yang_theorem_two` in `lean/YangBounds/Statements.lean`, weil das Einsetzen noch fehlt. Ich habe das auf `main` nachgezählt.
- Beide genannten Actions-Läufe liefen auf den Zweigen der Pull Requests, nicht auf `main` nach dem Merge.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. Alle Status bleiben behauptet, weil die Aussagen-Abgleiche fehlen.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #25 (5090735), #26 (28b2fb3), #27 (d9d1e04) und #28 (502fb1a) sind am 25.11.2026 zwischen 06:43 und 07:07 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Runden**

Verbraucht in Stufe 1: 4 von 8.

**Entscheidung für Runde 5 der Stufe 1**

- S1-17: Satz 2 in `Statements.lean` einsetzen und `lean/README.md` nachführen
- S1-18: Aussagen-Abgleich für Satz 1 und für „Rang von 3×2×6 ist 30“, durch Prüfer und GPT 6.2 Sol
- S1-19: Aussagen-Abgleich für Satz 2 und für „Rang von 4×2×4 ist mindestens 25“, durch Prüfer und GPT 6.2 Sol
- S1-20: Abgleich beider Prüfprogramme, Zieldatei `pruefer/abgleich/`

---

## 25.11.2026 · Stufe 1, Runde 5, Abschluss und Wechsel zu Stufe 2

**Aufträge und Subagenten**

Vier Subagenten: S1-17, S1-18, S1-19, S1-20.

**Gelieferte Dateien**

- S1-17: `lean/` (`Statements.lean`, `README.md`, `Axioms.lean`, `YangN4Haupt.lean`), Pull Request #29
- S1-18: `behauptungen/B-006.md`, Pull Request #32
- S1-19: `behauptungen/B-007.md`, Pull Request #30
- S1-20: `pruefer/abgleich/`, Pull Request #31

**Befunde**

- S1-17: `yang_theorem_two` ist eingesetzt, im Projekt steht kein `sorry` mehr. `lean/README.md` ist nachgeführt. Ein altbekannter Mangel bleibt: `Axioms.lean` importiert das Wurzelmodul und lässt sich mit `lake env lean` nicht direkt ausführen.
- S1-18: Prüfer und GPT 6.2 Sol (über die Bridge, unabhängig, hohe Denkstufe, Batch) bestätigen, dass `yang_theorem_one` Satz 1 aus Yang v3 ist und dass `rank_three_two_six` sagt: Der Rang von ⟨3,2,6⟩ ist 30 über jedem Körper. Im Auftrag an das Fremdmodell fehlten der Kopfkommentar und der Beweis des Feldes `correct` in `Upper3x2x6.lean`. Nebenbefund: In `Statements.lean` und `Upper3x2x6.lean` stehen veraltete Kommentare „open“.
- S1-19: Prüfer und GPT 6.2 Sol bestätigen, dass `yang_theorem_two` Satz 2 ist und dass `rank_four_two_four_ge` sagt: Der Rang von ⟨4,2,4⟩ ist mindestens 25 über jedem Körper. Die Subtraktion n − 3 schneidet nicht ab. Das Fremdmodell hat einen Vorbehalt: Es hat Instanzen und Axiome in den Importen nur per Textsuche gesucht. Das deckt der Actions-Lauf ab. Der Prüfer konnte Lean lokal nicht ausführen.
- S1-20: Auf 278 gemeinsamen Fällen stimmen beide Prüfprogramme im ersten Wort und im Rückgabewert überein, und beide stimmen mit dem Format. Abweichungen gibt es nur bei nicht schreibbarer Ausgabe und bei Speichermangel. Kein Programm gibt dabei fälschlich ANGENOMMEN.

**Prüfung vor der Statusänderung (selbst nachgesehen)**

1. PR #29 (46f1038), #30 (7b04255), #31 (90d46c1) und #32 (25492a5) sind auf `main`, gemergt am 25.11.2026 zwischen 07:11 und 07:29 Uhr (MEZ), jeweils unter dem GitHub-Konto Justus42.
2. Der Workflow „Lean build (own project lean/)“ lief auf `main` am Merge-Commit von PR #29: Lauf 45560784171, Ereignis push, Ergebnis success (https://github.com/Justus42/matmul-rank-n2m/actions/runs/45560784171). Die Zusammenfassung meldet `SORRY: 0` im Build-Log und in den Quellen. Für `yang_theorem_one`, `yang_theorem_two`, `rank_three_two_six`, `rank_four_two_four_ge`, `hopcroft_kerr_three_two_six` und `Upper3x2x6.hopcroft_kerr_three_two_six` meldet sie nur `propext`, `Classical.choice` und `Quot.sound` (`TOTAL: STANDARD=6`). Nach 46f1038 hat sich unter `lean/` und `.github/` nichts mehr geändert.
3. B-006 und B-007 wurden am Stand `502fb1a` abgeglichen. `git diff 502fb1a 46f1038` zeigt: `Basic.lean` (mit `BilinearAlgorithm` und `tensorRank`) und `CeilBound.lean` sind unverändert. In `Statements.lean` haben sich nur Beweise, Importe und Kommentare geändert. Die Aussagen von `yang_theorem_one`, `yang_theorem_two`, `rank_three_two_six` und `rank_four_two_four_ge` sind wörtlich gleich.

**Neuer Status je Behauptung (nach 5.1 Punkt 1 bis 4)**

- B-006 „Rang von ⟨3,2,6⟩ ist 30, über jedem Körper“: **geprüft**
- B-007 „Rang von ⟨4,2,4⟩ ist mindestens 25, über jedem Körper“: **geprüft**
- Yangs Satz 1 (B-002) und Yangs Satz 2 (B-003): **geprüft**, als Yangs Sätze mit Quelle arXiv:2609.14393 v3 (Protokoll Abschnitt 9). B-002 und B-003 sind keine eigenen Dateien, sondern Zeilen der Übersicht in `behauptungen/README.md`. Ihr Wortlaut ist genau Satz 1 und Satz 2. Dort sind sie auf geprüft gesetzt, mit Verweis auf B-006 und B-007.
- B-004 und B-005: unverändert **behauptet**

**Entscheidungen des Orchestrators**

- Format: Rückgabewert 3 mit der ersten Zeile INTERNER-FEHLER wird Teil des Formats. FEHLERHAFT gilt nur für Eigenschaften der Datei. Ein Lauf zählt nur, wenn erstes Wort und Rückgabewert zusammenpassen, sonst gilt er als „kein Ergebnis“. Die Einarbeitung in `verfahren/README.md` und in die Programme wird in Stufe 2 vergeben.
- Das Fertig-Kriterium der Stufe 1 ist erfüllt (Build grün ohne `sorry`, Axiom-Prüfung, Aussagen-Abgleich), nach 5 von 8 Runden.
- Stufenwechsel nach Abschnitt 3: Wechsel zu Stufe 2, 4×2×4 (25 oder 26), Budget 12 Runden für beide Spuren zusammen. Runde 1 der Stufe 2 beginnt mit der Literaturwache.

---

## 25.11.2026 · Stufe 2, Runde 1 vergeben

**Literaturwache**

`lit/WACHE.md`, Pull Request #33 (auf `main` gemergt als 50d2b34). Der Rang von 4×2×4 ist nirgends bestimmt, Abbruchregel 3 greift nicht. Die beste obere Schranke ist 26 über ℤ und ℚ, die beste untere ist Yangs 25. Ansatz für Spur A: Zertifikatsmethoden über 𝔽₂ (Wang und Nachfolger). ⟨2,4,4⟩ ist dort noch nicht behandelt. Grenze dieses Ansatzes: Eine Schranke über 𝔽₂ schließt kein Verfahren über ℚ mit Nenner 2 aus.

**Aufträge (4 Subagenten mit der Literaturwache)**

- S2-01: Blind-Sucher, sieht nur die Problemstellung, Zieldatei `versuche/s2-blind-r1.md`
- S2-02: Spur A, Schranke 26 über 𝔽₂ mit Zertifikaten, Zieldateien `lean/prosa/s2_444_spurA_r1.md` und `versuche/s2-spurA-r1/`
- S2-03: Spur B, Suche nach einem Verfahren mit 25 Produkten, Zieldateien `versuche/s2-spurB-r1.md` und `verfahren/`

---

## 25.11.2026 · Stufe 2, Runde 1, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: Literaturwache, S2-01, S2-02, S2-03.

**Gelieferte Dateien**

- Literaturwache: `lit/WACHE.md`, Pull Request #33 (Inhalt siehe Eintrag „Stufe 2, Runde 1 vergeben“). Nichts Überholendes, Abbruchregel 3 greift nicht.
- S2-01: `versuche/s2-blind-r1.md` mit `versuche/s2-blind-r1/`, Pull Request #34
- S2-02: `lean/prosa/s2_444_spurA_r1.md` mit `versuche/s2-spurA-r1/`, Pull Request #35
- S2-03: `versuche/s2-spurB-r1.md` mit `versuche/s2-spurB-r1/` und `verfahren/4x2x4-r26-s001.json`, Pull Request #36

**Befunde**

- S2-01 (Blind-Sucher): Er fand kein Verfahren mit 25 Produkten und keinen Beweis für 26. Eine Flip-Graph-Suche über 𝔽₂ erreicht 26 zuverlässig, aber nie weniger. Über 𝔽₃ hat der Sucher aufgegeben. Er nennt ein offenes Lemma M und liefert fünf Ausnahmen als Daten. Status vermutet oder behauptet. Einschränkung laut Orchestrator: Der Sucher war nicht ganz blind, weil ihm das Projektgedächtnis den Literaturstand mitgab. Im Repo hat er nach eigener Angabe nur `CLAUDE.md` gelesen.
- S2-02 (Spur A): Mit Wangs Verfahren erreicht das Zertifikat über 𝔽₂ nur R ≥ 22 (Status behauptet). Das Ziel 26 ist nicht erreicht. Der Sucher behauptet eine Verschärfung von Yang: Bei Rang 25 bleiben vier Restfälle mit ρ = 3. Die Regressionsprobe an ⟨3,2,4⟩ ist nicht fertig, und Wangs eigene Zertifikate waren nicht abrufbar.
- S2-03 (Spur B): Es gibt kein Verfahren mit 25 Produkten über 𝔽₂, 𝔽₃, 𝔽₅ oder ℤ in den durchsuchten Bereichen. Das neue Verfahren `verfahren/4x2x4-r26-s001.json` über ℤ nehmen beide Prüfprogramme an. Es erreicht den bekannten besten Wert 26, nicht weniger. Status behauptet, eine Behauptungsdatei dazu gibt es nicht.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert.

**Abbruchregel 2 (Stillstand)**

In Runde 1 hat keine Spur ein neues Artefakt mit Status geprüft geliefert.

- Spur A: kein geprüftes Artefakt. Zähler: 1 Runde ohne geprüftes Artefakt (von 3).
- Spur B: kein geprüftes Artefakt. Das 26er-Verfahren hat Status behauptet. Zähler: 1 Runde ohne geprüftes Artefakt (von 3).
- Der Blind-Sucher gehört zu keiner Spur.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #33 (50d2b34), #34 (8b2417a), #35 (e97f1be) und #36 (5bfa2d5) sind am 25.11.2026 zwischen 07:33 und 09:30 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Runden**

Verbraucht in Stufe 2: 1 von 12.

**Runde 2 der Stufe 2, vergeben**

- S2-04: Blind-Sucher, Zieldatei `versuche/s2-blind-r2.md`
- S2-05: Spur A, Yangs vier Restfälle und Lemma M, Zieldatei `lean/prosa/s2_444_spurA_r2.md`
- S2-06: Spur B, SAT-Suche mit Symmetrieansatz und Flip-Graph über viele Familien, Zieldatei `versuche/s2-spurB-r2.md`
- S2-07: Literaturwache, mit der Frage nach dem Grenzrang von ⟨2,4,4⟩

**Nachtrag zu Stufe 2, Runde 1: Entscheidung des Orchestrators zu Abbruchregel 2**

Das 26er-Verfahren `verfahren/4x2x4-r26-s001.json` setzt den Zähler von Spur B nicht zurück. Begründung des Orchestrators: Das Verfahren bestätigt nur den bekannten Wert 26 und bringt die Frage „25 oder 26“ nicht voran. Eine großzügigere Auslegung käme dem Aussetzen einer Abbruchregel gleich, und das darf er nach 11.4 nicht. Die Zähler bleiben bei 1 von 3 für Spur A und 1 von 3 für Spur B.

Die Behauptungsdatei für „R(⟨4,2,4⟩) ≤ 26“ mit Prüfung nach 5.2 vergibt der Orchestrator als Nebenauftrag in einer späteren Runde. Für S2-07 ist `lit/WACHE.md` als Zieldatei bestätigt.

---

## 25.11.2026 · Stufe 2, Runde 2, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S2-04, S2-05, S2-06, S2-07.

**Gelieferte Dateien**

- S2-07 (Literaturwache): `lit/WACHE.md`, Pull Request #37
- S2-05 (Spur A): `lean/prosa/s2_444_spurA_r2.md` mit `versuche/s2-spurA-r2/`, Pull Request #38
- S2-04 (Blind-Sucher): `versuche/s2-blind-r2.md`, Pull Request #39
- S2-06 (Spur B): `versuche/s2-spurB-r2.md` mit `versuche/s2-spurB-r2/`, Pull Request #40 (Teilbericht)

**Befunde (Status behauptet, wo nicht anders gesagt)**

- S2-07: Nichts Überholendes, Abbruchregel 3 greift nicht. Den Grenzrang von ⟨4,2,4⟩ gibt die Literatur mit 22 bis 24 an. Die obere Grenze 24 stammt von Smirnov 2013 und ist nur zitiert, das Original wurde nicht gelesen. Der Grenzrang liegt damit unter dem Rang.
- S2-05: Satz A: Bei Rang 25 bleiben in Yangs Normalform ρ = 3 und die vier Restfälle (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}. Satz B: Die Fälle (4,7) und (5,7) sind über jedem Körper ausgeschlossen. Dafür braucht es drei neue Lemmata: Lemma 13′, Lemma V und Lemma S. Offen bleiben (3,6) und (5,8). Für diese beiden Fälle gibt es Modelle der F-Daten, die alle bisherigen Lemmata erfüllen. Lemma M aus S2-01 ist nach dem Bericht gleichwertig mit dem Ziel selbst. Fremdmodell: keines benutzt.
- S2-04: Der Blind-Sucher fand kein Verfahren mit 25 Produkten und keinen Beweis für 26, weder numerisch über ℝ und ℂ noch per SAT über 𝔽₂ mit Symmetrie. Status vermutet für „kein Verfahren über ℝ und ℂ“. Er war nur eingeschränkt blind, weil ihm das Projektgedächtnis Runde 1 zusammenfasste.
- S2-06: SAT über 𝔽₂ mit dem Symmetrieansatz A ↔ Bᵀ. Die Fälle f = 1, 3, 19, 21, 23 und 25 sind mit DRAT-Beweis ausgeschlossen, `drat-trim` nimmt die Beweise an. Die Fälle f = 5 bis 17 sind offen. Die Methode ist nicht geeicht, und die Suche über 𝔽₃ war zu langsam. kissat und drat-trim (MIT-Lizenz) liefen nur als externe Programme. Vier Rechenblöcke, jeder unter 30 Minuten. Der Thread stand nach Angabe des Orchestrators von 09:39 bis 11:44 Uhr (MEZ) still und lief nach seiner Nachfrage weiter.

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert.

**Abbruchregel 2 (Stillstand)**

Keine Spur hat in Runde 2 ein neues Artefakt mit Status geprüft geliefert. Zählerstand: Spur A 2 von 3, Spur B 2 von 3.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #37 (a87b8fa), #38 (545a8d6), #39 (37ba635) und #40 (3dcc887) sind am 25.11.2026 zwischen 09:34 und 12:43 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Runden**

Verbraucht in Stufe 2: 2 von 12.

**Hinweis von Justus (25.11.2026, 11:43 Uhr MEZ, übermittelt vom Orchestrator)**

Justus hat selbst zu openai/math recherchiert (Familien 107 und 379, ω = 9/4). Status behauptet. Abbruchregel 3 greift danach nicht. Es gibt keinen Auftrag, die laufende Runde zu ändern. Entscheidung von Justus: openai/math kommt dauerhaft in die Literaturwache nach Abschnitt 7.

**Runde 3 der Stufe 2, vergeben (Angabe des Orchestrators)**

- S2-08: Blind-Sucher, Zieldatei `versuche/s2-blind-r3.md`
- S2-09: Prüfer Spur A für Satz A, Satz B und die drei Lemmata 13′, V und S, mit GPT 6.2 Sol als zweitem Leser
- S2-10: Spur A, Restfälle (3,6) und (5,8), Zieldatei `lean/prosa/s2_444_spurA_r3.md`
- S2-11: Prüfer Spur B für die DRAT-Ergebnisse, dazu die Behauptungsdatei R(⟨4,2,4⟩) ≤ 26
- S2-12: Spur B, Eichung und Zerlegung der offenen SAT-Fälle, Zieldatei `versuche/s2-spurB-r3.md`
- S2-13: Literaturwache mit Nachprüfung von Justus' Hinweis

Das sind sechs Aufträge. Abschnitt 6 des Protokolls lässt höchstens 4 Subagenten pro Runde zu. Das ist an den Orchestrator gemeldet.

**Nachtrag zu Runde 3 der Stufe 2: Verstoß gegen Abschnitt 6 behoben**

Der Verstoß gegen Abschnitt 6 (sechs statt höchstens vier Subagenten) wurde bemerkt und vor jeder Lieferung behoben. Der Orchestrator hat S2-10 (Spur A, Restfälle) und S2-12 (Spur B, Zerlegung der SAT-Fälle) am 25.11.2026 um 12:46 Uhr (MEZ) zurückgezogen. Beide hatten bis dahin nichts geliefert. Runde 3 hat damit vier Aufträge: S2-08, S2-09, S2-11 und S2-13. Die Nummern S2-10 und S2-12 bleiben als zurückgezogen stehen. Ihre Arbeit wird in Runde 4 neu vergeben. Die Zieldateien von S2-09 und S2-11 wählen die Prüfer selbst.

---

## 25.11.2026 · Stufe 2, Runde 3, Abschluss und Halt

**Aufträge und Subagenten**

Vier Subagenten: S2-08, S2-09, S2-11, S2-13. S2-10 und S2-12 wurden vor jeder Lieferung zurückgezogen und haben nichts im Repo geändert, das haben beide bestätigt.

**Gelieferte Dateien**

- S2-13 (Literaturwache): `lit/WACHE.md` und `lit/LIZENZEN.md`, Pull Request #41
- S2-09 (Prüfer Spur A): `behauptungen/B-008.md`, `behauptungen/B-009.md`, `lean/prosa/s2_444_spurA_r2_pruefung.md`, `versuche/s2-09-pruefung/`, Pull Request #42
- S2-11 (Prüfer Spur B): `behauptungen/B-010.md`, `behauptungen/B-011.md`, `behauptungen/B-011-anhang/`, Pull Request #43
- S2-08 (Blind-Sucher): `versuche/s2-blind-r3.md` mit `versuche/s2-blind-r3/`, Pull Request #44

**Befunde**

- S2-13: Abbruchregel 3 greift nicht. Justus' Hinweis zu openai/math ist bestätigt, mit vier kleinen Abweichungen ohne Folgen. Die verbindliche Quellenliste der Wache steht nur in PROTOKOLL.md Abschnitt 7, und die kann nur Justus ändern.
- S2-09: Satz A (B-008) und Satz B (B-009) halten nach dem Prüfer und, unabhängig davon, nach GPT 6.2 Sol. Lemma V hält mit Reparatur R1 und in einer einfacheren Fassung. Der Status bleibt behauptet, weil ein Prosa-Beweis nach 5.1 nicht geprüft sein kann, solange es keinen Lean-Beweis gibt.
- S2-11: B-010 „Rang von ⟨4,2,4⟩ ist höchstens 26“ hat Status **geprüft** nach 5.2 (das Verfahren aus S2-03). B-011 (SAT-Ausschlüsse f = 1, 3, 19, 21, 23, 25) gilt nur für die Involution σ(u,v,w) = (vᵀ,uᵀ,wᵀ). Der Status bleibt behauptet, weil Abschnitt 5 für SAT-Zertifikate keinen Prüfweg kennt. Der Löser ist nicht geeicht, Zeitüberschreitungen sagen nichts.
- S2-08: Der Blind-Sucher fand kein 25er-Verfahren. Er untersuchte Symmetrien der Ordnung 3, 5 und 7 über 𝔽₂: 29 Läufe UNSAT, 30 an der Zeitgrenze. Behauptung S2-08-a hat Status behauptet, der DRAT-Beweis ist ungeprüft. Er war nur eingeschränkt blind.

**Neuer Status je Behauptung**

- B-010: neu, **geprüft** (bekannter Wert 26)
- B-008, B-009, B-011: neu, **behauptet**
- Übersicht in `behauptungen/README.md` um B-008 bis B-011 ergänzt

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #41 (93a0f06), #42 (d972567), #43 (f6435f1) und #44 (f5fc9de) sind am 25.11.2026 zwischen 12:47 und 13:29 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Runden**

Verbraucht in Stufe 2: 3 von 12.

**Abbruchregel 2 (Lesart des Orchestrators)**

- Spur A hat in drei Runden in Folge kein Artefakt mit Status geprüft geliefert und endet damit.
- Spur B hat in Runde 3 nur B-010 als geprüft. Nach der Entscheidung des Orchestrators zu Runde 1 setzt B-010 den Zähler nicht zurück. Damit endet auch Spur B.

**Entscheidung des Orchestrators: Halt nach 11.4**

Der Orchestrator vergibt keine neuen Aufträge und legt Justus die Entscheidung vor, weil er nach 11.4 keine Abbruchregel aussetzen darf.

---

## 25.11.2026 · Regeländerung durch Justus (Protokoll Version 0.3, zählt nicht zum Budget)

Eingetragen im Auftrag von Justus aus einem Chat außerhalb des Projekts, 14:34 Uhr (MEZ).

**Anlass**

Abbruchregel 2 verlangte binnen drei Runden ein Artefakt mit Status geprüft. Ein Beweis braucht aber je eine Runde zum Finden, zum Gegenlesen und für Lean. Die Regel hätte Spur A trotz Fortschritt beendet. Zugleich ließ ihr Wortlaut offen, ob die Bestätigung eines bekannten Werts zählt.

**Geändert in PROTOKOLL.md**

- Abschnitt 6, Abbruchregel 2: Fortschritt ist jetzt bestimmt. Es zählt a) ein geprüftes Artefakt, das eine Schranke des Zielformats ändert oder einen benannten Fall ausschließt, oder b) eine solche Behauptung, die Prüfer und Fremdmodell unabhängig bestätigt haben, mit Frist für Status geprüft bis zum Ende der übernächsten Runde. Die Bestätigung eines bekannten Werts zählt nicht
- Übergang: B-008 und B-009 zählen als Fortschritt von Spur A in Runde 3, Frist Ende Runde 5. B-010 zählt nicht. Die strenge Lesart des Orchestrators zu B-010 ist damit Regel
- Abschnitt 3, Stufe 2: Endet eine Spur, läuft die andere weiter. Ein Auftrag der Spur A darf einen Restfall in beide Richtungen angreifen
- Abschnitt 7: openai/math steht jetzt in der verbindlichen Quellenliste der Literaturwache

**Folge für den Zählerstand (vom Orchestrator im nächsten Runden-Eintrag zu bestätigen)**

Spur A: Zähler nach Runde 3 bei 0. Spur B: 3 von 3, die Spur endet nach der Regel.

STATUS.md ist durch diesen Eintrag nicht geändert. Das übernimmt der Orchestrator.

---

## 25.11.2026 · Entscheidung von Justus, Protokoll 0.3, Stufe 2, Runde 4 vergeben

**Entscheidung von Justus (25.11.2026, 14:39 Uhr MEZ)**

> Nur Spur A weiterführen. Vorrang in Runde 4 hat die Lean-Formalisierung von Satz A, Satz B und den Lemmata 13′, V (reparierte Fassung) und S. Höchstens ein Auftrag greift (3,6) und (5,8) an, in beide Richtungen: Ausschluss oder Bau eines 25er-Verfahrens aus den Modellen der F-Daten. Die allgemeine SAT- und Flip-Graph-Suche endet mit Status aufgegeben. Deine strenge Lesart zu B-010 gilt. Die Regeländerung kommt als Protokoll 0.3.

**Protokoll 0.3**

PROTOKOLL.md liegt in Version 0.3 auf `main` (f8bb748). Geändert sind Abschnitt 3, 6 und 7:

- Abschnitt 3: Endet eine Spur nach Abbruchregel 2, läuft die andere weiter. Ein Auftrag der Spur A darf einen Restfall in beide Richtungen angreifen, also ihn ausschließen oder aus ihm ein Verfahren mit 25 bauen.
- Abschnitt 6, Abbruchregel 2: Sie zählt jetzt Runden ohne Fortschritt. Als Fortschritt zählt a) ein neues geprüftes Artefakt, das eine Schranke ändert oder einen benannten Fall ausschließt, oder b) eine solche Behauptung, die ein Prüfer und ein Fremdmodell unabhängig bestätigt haben. Für b) gilt eine Frist: Status geprüft bis zum Ende der übernächsten Runde. Die Bestätigung eines schon bekannten Werts zählt nicht. Übergangsregel: B-008 und B-009 zählen als Fortschritt von Spur A in Runde 3, mit Frist bis zum Ende von Runde 5. B-010 zählt nicht.
- Abschnitt 7: openai/math gehört jetzt zur Literaturwache.

**Folgen (Angaben des Orchestrators)**

- Der Halt nach Abbruchregel 2 ist aufgehoben. Nur Spur A läuft weiter.
- Spur A: Zähler 0. Fortschritt nach 6.2 b) in Runde 3 durch B-008 und B-009. Frist für Status geprüft: Ende von Runde 5 der Stufe 2.
- Spur B endet mit Status **aufgegeben**. Die allgemeine SAT- und Flip-Graph-Suche endet ebenfalls mit Status **aufgegeben**. Grund: drei Runden ohne Fortschritt nach Abbruchregel 2, der Löser ist nicht geeicht, und es gibt keinen Prüfweg. B-011 und S2-08-a bleiben behauptet. B-010 zählt nicht als Fortschritt, die strenge Lesart des Orchestrators gilt.
- Die zurückgezogenen Aufträge S2-10 und S2-12 werden nicht neu vergeben. S2-10 geht in S2-16 auf.

**Runde 4 der Stufe 2, vergeben (Start 14:45 Uhr MEZ, vier Aufträge)**

- S2-14 (Formalisierer, Spur A): Lemma 13′ und Satz A (B-008) in Lean, eigene Dateien unter `lean/`
- S2-15 (Formalisierer, Spur A): Lemma V (reparierte, einfachere Fassung), Lemma S und Satz B (B-009) in Lean, eigene Dateien. Die Aussagen aus S2-14 gehen als ausdrückliche Hypothesen ein
- S2-16 (Beweissucher, Spur A): Restfälle (3,6) und (5,8) in beide Richtungen, Zieldatei `lean/prosa/s2_444_spurA_r4.md`
- S2-17 (Blind-Sucher als Beweissucher): Zieldatei `versuche/s2-blind-r4.md`

In dieser Runde läuft keine eigene Literaturwache. Die letzte war S2-13 heute um 12:47 Uhr (MEZ), PR #41, in derselben Sitzung des Orchestrators. Geplant für Runde 5: die Lean-Teile zusammensetzen und den Aussagen-Abgleich nach 5.1 Punkt 3 für B-008 und B-009 durchführen.

**Zählerstand nach Abbruchregel 2 (Protokoll 0.3)**

Spur A steht bei 0, die Frist für B-008 und B-009 läuft bis zum Ende von Runde 5. Spur B ist aufgegeben.

---

## 25.11.2026 · Stufe 2, Runde 4, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S2-14, S2-15, S2-16, S2-17.

**Gelieferte Dateien**

- S2-14 (Formalisierer, Spur A): `lean/YangBounds/Lemma13Prime.lean`, `lean/YangBounds/SatzA444.lean`, Pull Request #45
- S2-15 (Formalisierer, Spur A): `lean/YangBounds/SatzB444.lean`, `lean/YangBounds/SatzB444Poly.lean`, Pull Request #48
- S2-16 (Beweissucher, Spur A): `lean/prosa/s2_444_spurA_r4.md`, `behauptungen/B-012.md`, `behauptungen/B-013.md`, Pull Request #47
- S2-17 (Blind-Sucher): `versuche/s2-blind-r4.md`, Pull Request #46

**Befunde (alle Status behauptet)**

- S2-14: Lemma 13′ und Satz A (B-008) sind in Lean ohne `sorry`. Laut Bericht ist der Actions-Lauf 45629108828 grün und meldet nur Standard-Axiome. Der Aussagen-Abgleich fehlt noch.
- S2-15: Satz B (B-009) ist in Lean ohne `sorry`, unter den Hypothesen `SatzAHyp` und `CommonKernelHyp`. Laut Bericht ist der Actions-Lauf 45632519420 grün. Reparatur R1 wurde nicht gebraucht. Teil 3 von Lemma S ist durch ein neues Argument ersetzt.
- S2-16: Zwei neue Behauptungen. B-012 (Satz C): Es gibt keine symmetrische Zerlegung der Länge 25, damit ist Fall (3,6) ausgeschlossen. B-013 (Satz E): Unterfall A von (5,8) ist ausgeschlossen. Beide sind noch von niemandem geprüft. Unterfall B von (5,8) bleibt offen. Ein 25er-Verfahren wurde nicht gefunden.
- S2-17: Kein Ergebnis zu 25 oder 26. Der Blind-Sucher kommt unabhängig auf die vier Restfälle (Satz R, behauptet) und vermutet ρ = 4 als Schlüssel. Er war nur eingeschränkt blind.
- Auf `main` steht in `lean/` kein `sorry` (nachgezählt).

**Neuer Status je Behauptung**

Kein Statuswort hat sich geändert. B-012 und B-013 sind neu, mit Status behauptet, und in der Übersicht nachgetragen.

**Merges**

Merge-Stand auf `main` beim Schreiben dieses Eintrags: PR #46 (bc0b63b), #45 (9a49624), #47 (9c80933) und #48 (c42939b) sind am 25.11.2026 zwischen 14:52 und 15:24 Uhr (MEZ) gemergt, jeweils unter dem GitHub-Konto Justus42.

**Runden**

Verbraucht in Stufe 2: 4 von 12.

**Zählerstand nach Abbruchregel 2 (Fassung 0.3)**

- Spur A: Runde 4 bringt keinen Fortschritt nach a) oder b). B-012 und B-013 sind noch nicht von Prüfer und Fremdmodell bestätigt, und keine Lean-Datei hat Status geprüft. **Zähler 1 von 3.** Frist für B-008 und B-009 (Fortschritt nach b) aus Runde 3): **Ende von Runde 5**.
- Spur B: aufgegeben.

**Runde 5 der Stufe 2, vergeben (Start 15:30 Uhr MEZ, vier Aufträge)**

- S2-18 (Formalisierer): unbedingte Fassung von Satz B aus Satz A und Satz B zusammensetzen, neue Datei unter `lean/YangBounds/`, Actions grün auf `main`
- S2-19 (Prüfer): Aussagen-Abgleich für B-008 mit GPT 6.2 Sol
- S2-20 (Prüfer): Aussagen-Abgleich für B-009 mit GPT 6.2 Sol. Der Prüfer prüft die Hypothesen selbst und hängt nicht von S2-18 ab
- S2-21 (Blind-Sucher als Beweissucher): Zieldatei `versuche/s2-blind-r5.md`

Geplant für Runde 6: Prüfer und Fremdmodell für B-012 und B-013, dazu ein Angriff auf Unterfall B von (5,8).

---

## 25.11.2026 · Stufe 2, Runde 5, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S2-18, S2-19, S2-20, S2-21.

**Gelieferte Dateien**

- S2-18 (Formalisierer): `lean/YangBounds/SatzB444Final.lean` mit `satzB_unbedingt`, `satzB_symm_unbedingt`, `satzB_global_unbedingt`, Pull Request #49
- S2-19 (Prüfer): Aussagen-Abgleich in `behauptungen/B-008.md`, Pull Request #52
- S2-20 (Prüfer): Aussagen-Abgleich in `behauptungen/B-009.md`, Pull Request #51
- S2-21 (Blind-Sucher): `versuche/s2-blind-r5.md`, Pull Request #50

**Befunde**

- S2-18: Satz B ist ohne Hypothesen zusammengesetzt. Hinweis aus S2-19: Der Workflow schlägt bei `sorry` nicht fehl. Maßgeblich ist die Zeile „SORRY“ im Log, nicht die grüne Farbe.
- S2-19: Der Kern von B-008 ist bestanden, Prüfer und GPT 6.2 Sol kommen unabhängig zum gleichen Ergebnis. Der Isomorphie-Teil von Folgerung A1 hat keinen Lean-Satz und bleibt behauptet. `satzA_global` bindet die Normalform nicht an die eingegebene Zerlegung. Das ist unschädlich, weil `satzA_statement` jede Normalform abdeckt.
- S2-20: Der Kern von B-009 ist bestanden: Die Fälle (4,7) und (5,7) sind über jedem Körper unmöglich. Prüfer und GPT 6.2 Sol kommen unabhängig zum gleichen Ergebnis. Der Symmetrie-Zusatz im Fall (3,6) mit μ_t ≠ 0 bleibt behauptet, weil `IsSymm` auch μ_t = 0 erlaubt.
- S2-21: Kein Beweis für 26. Satz R (höchstens 2 reine Produkte je Richtung bei Länge 25) hat Status behauptet. Der Sucher war nur eingeschränkt blind.

**Prüfung vor der Statusänderung (selbst nachgesehen)**

1. PR #49 (1ca01a5), #50 (c2b4b9a), #51 (dfb6976) und #52 (8485c54) sind auf `main`, gemergt am 25.11.2026 zwischen 15:32 und 16:05 Uhr (MEZ), jeweils unter dem GitHub-Konto Justus42. Unter `lean/` und `.github/` hat sich nach 1ca01a5 nichts mehr geändert.
2. Der Actions-Lauf 45635237494 lief auf `main` am Merge-Commit 1ca01a5 und endete mit success. Im Log steht `Build completed successfully` und `SORRY: 0` (Build-Log und Quellen). Die `#print axioms`-Ausgaben im Build zeigen für `lemma13Prime`, `satzA`, `satzA_statement`, `satzA_exists`, `satzA_global`, `corollaryA1`, `corollaryA2`, `sDim_table`, `exists_common_kernel`, `satzB`, `satzB_symm`, `satzB_global`, `satzB_unbedingt`, `satzB_symm_unbedingt` und `satzB_global_unbedingt` jeweils nur `propext`, `Classical.choice` und `Quot.sound`. Der Axiom-Bericht des Workflows meldet `TOTAL: STANDARD=9`.
3. Den Aussagen-Abgleich haben je ein Prüfer und GPT 6.2 Sol unabhängig gemacht (S2-19 für B-008, S2-20 für B-009).
4. Der grüne Lauf auf `main` ist der unter 2 genannte.

**Neuer Status je Behauptung (nach 5.1 Punkt 1 bis 4)**

- B-008: **geprüft** für den Kern (ρ = 3 und die vier Fälle), für die Surjektivität in A1 und für A2. Der Isomorphie-Teil von A1 bleibt **behauptet**.
- B-009: **geprüft** für den Rangteil ((4,7) und (5,7) unmöglich, über jedem Körper). Der Symmetrie-Zusatz mit μ_t ≠ 0 bleibt **behauptet**.
- B-010 bis B-013: unverändert.

**Merges**

Siehe Punkt 1 oben.

**Runden**

Verbraucht in Stufe 2: 5 von 12.

**Zählerstand nach Abbruchregel 2 (Fassung 0.3), Spur A**

- Die Frist für B-008 und B-009 (Fortschritt nach b) aus Runde 3, Frist Ende Runde 5) ist gehalten. Der Fortschritt aus Runde 3 bleibt gültig.
- Ob Runde 5 selbst als Fortschritt nach a) zählt, ist offen. Wörtlich liefert Runde 5 neue Artefakte mit Status geprüft, die benannte Fälle ausschließen (`SatzB444Final.lean`, B-009 geprüft). Es sind aber dieselben Aussagen, die schon in Runde 3 nach b) gezählt wurden.
  - Zählt Runde 5 nach a): Zähler **0 von 3**.
  - Zählt sie nicht: Runde 4 und Runde 5 sind ohne Fortschritt, Zähler **2 von 3**.
- Die Entscheidung ist an den Orchestrator gemeldet und wird nachgetragen.
- Spur B: aufgegeben.

**Runde 6 der Stufe 2, vergeben (Start 16:10 Uhr MEZ, vier Aufträge)**

- S2-22 (Prüfer): B-012 (Satz C, Ausschluss von (3,6)) mit GPT 6.2 Sol
- S2-23 (Prüfer): B-013 (Satz E, Unterfall A von (5,8)) mit GPT 6.2 Sol
- S2-24 (Beweissucher): Unterfall B von (5,8) in beide Richtungen, Zieldatei `lean/prosa/s2_444_spurA_r6.md`
- S2-25 (Blind-Sucher als Beweissucher): Zieldatei `versuche/s2-blind-r6.md`

Bestätigen Prüfer und Fremdmodell B-012 oder B-013, zählt das als Fortschritt nach b) für Runde 6, mit Frist bis zum Ende von Runde 8.

**Nachtrag zu Stufe 2, Runde 5: Zählerstand (Lesart des Orchestrators)**

Runde 5 zählt nicht als eigener Fortschritt. Begründung des Orchestrators: B-008 und B-009 sind dieselben Aussagen, die schon in Runde 3 nach b) gezählt wurden. Regel b) verlangt, dass sie bis zur Frist geprüft sind, damit der Fortschritt aus Runde 3 gültig bleibt. Dieselbe Aussage zweimal zu zählen wäre die großzügigere Lesart. Bei zwei Lesarten nimmt der Orchestrator die strengere, wie bei B-010.

Zähler Spur A: **2 von 3**. Runde 6 muss Fortschritt bringen, etwa durch die unabhängige Bestätigung von B-012 oder B-013 durch Prüfer und Fremdmodell. Sonst endet Spur A nach Abbruchregel 2, und der Orchestrator hält an.

---

## 25.11.2026 · Stufe 2, Runde 6, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S2-22, S2-23, S2-24, S2-25.

**Gelieferte Dateien**

- S2-22 (Prüfer): `lean/prosa/s2_444_spurA_r4_pruefung.md`, Prüfvermerk in `behauptungen/B-012.md`, Rechnungen und Fremdmodell in `versuche/s2-22/`, Pull Request #55
- S2-23 (Prüfer): `lean/prosa/s2_444_spurA_r4_pruefung_b013.md`, Prüfvermerk in `behauptungen/B-013.md`, Rechnungen und Fremdmodell in `versuche/s2-23-pruefung/`, Pull Request #56
- S2-24 (Beweissucher): `lean/prosa/s2_444_spurA_r6.md`, neue Behauptung `behauptungen/B-014.md`, Gegenprobe in `versuche/s2-24/`, Pull Request #53
- S2-25 (Blind-Sucher): `versuche/s2-blind-r6.md`, Pull Request #54

**Befunde**

- S2-22: Satz C hält, jeder Schritt nachgerechnet. Folgerung C1 hält nur mit der benannten Reparatur R-C1. Dass der Fall (rk L, rk H) auf der offenen Menge der zulässigen p konstant ist, ist nicht begründet. Richtig und ausreichend ist die generische Fassung: Eine Zerlegung der Länge 25 liegt für alle p einer nichtleeren offenen, also dichten Menge zulässiger p im Fall (5,8). An einzelnen zulässigen p ist (3,6) nicht ausgeschlossen. GPT 6.2 Sol kommt unabhängig zum gleichen Urteil (Auftrag ohne das Urteil des Prüfers).
- S2-23: Satz E (Unterfall A unmöglich) hält ohne Reparatur und hängt nicht von Satz C ab. Folgerung C2 und Lemma P halten mit den benannten Reparaturen R1, R2 und R2b. Satz C wird nur für die Nicht-Symmetrie in Folgerung C2 gebraucht. GPT 6.2 Sol kommt unabhängig zum gleichen Urteil. GPT schlägt zusätzlich einen Schluss gegen Unterfall B vor, den der Prüfer nachvollzogen hat. Das ist eine neue Behauptung, nicht Teil von B-013 (Bericht Abschnitt 7.2).
- S2-24: Neue Behauptung B-014: Unterfall B von (5,8) ist unmöglich (Lemma K, Lemma Z, Satz F). Folgerung F2 setzt daraus mit B-007 bis B-013 die Kette zu R(⟨4,2,4⟩) ≥ 26 zusammen. Alles behauptet, von niemandem gelesen. Kein Verfahren mit 25 Produkten. S2-24 lief gleichzeitig mit S2-23 und war vor dessen Bericht gemergt (PR #53 vor PR #56). Satz F ist also unabhängig vom Vorschlag aus S2-23 Abschnitt 7.2 entstanden.
- S2-25: Keine Entscheidung zwischen 25 und 26. Starrheits-Lemma (Lemma 2: höchstens 6 Produkte je Gerade ℓ ⊂ C² auf A- und B-Seite) mit Status behauptet. Der Sucher war nur eingeschränkt blind (Offenlegung in Abschnitt 7).

**Neuer Status je Behauptung**

- B-012: **behauptet**, Prüfvermerk S2-22 mit Reparatur R-C1 eingetragen.
- B-013: **behauptet**, Prüfvermerk S2-23 mit Reparaturen R1, R2, R2b eingetragen.
- B-014: neu, **behauptet**.
- Alle übrigen unverändert. Keine Statusänderung zu geprüft, daher keine Prüfung eines Actions-Laufs in dieser Runde.

**Merges**

Alle vier Pull Requests sind auf `main`, gemergt am 25.11.2026 unter dem GitHub-Konto Justus42:

- PR #53 um 16:15 Uhr (MEZ), Merge-Commit 48bd413
- PR #54 um 16:17 Uhr, Merge-Commit 072b699
- PR #55 um 16:20 Uhr, Merge-Commit fe7b183
- PR #56 um 16:37 Uhr, Merge-Commit a3046ac

**Runden**

Verbraucht in Stufe 2: 6 von 12.

**Zählerstand nach Abbruchregel 2 (Fassung 0.3), Spur A (Lesart des Orchestrators)**

- Runde 6 bringt Fortschritt nach b). B-012 und B-013 sind neue Behauptungen, die benannte Fälle ausschließen. Prüfer und Fremdmodell haben beide unabhängig bestätigt.
  - B-012 schließt (3,6) aus.
  - B-013 schließt Unterfall A von (5,8) aus.
- Die Bestätigung gilt jeweils nur in der reparierten Fassung:
  - B-012 nur in der generischen Fassung R-C1.
  - B-013 nur mit den Reparaturen R1, R2 und R2b.
  - Satz E aus B-013 hält ohne Reparatur.
- Zähler Spur A: **0 von 3**.
- Frist: B-012 und B-013 müssen bis zum Ende von Runde 8 geprüft sein, sonst zählt Runde 6 nachträglich nicht.
- B-014 ist noch nicht bestätigt und zählt in Runde 6 nicht.
- Spur B: aufgegeben.

**Runde 7 der Stufe 2, vergeben (Start 16:45 Uhr MEZ, vier Aufträge)**

- S2-26 (Formalisierer): Satz C und die generische Fassung von C1 (B-012) in Lean, eigene Dateien
- S2-27 (Formalisierer): Satz E (B-013) in Lean, Nicht-Symmetrie als ausdrückliche Hypothese
- S2-28 (Prüfer): B-014 mit GPT 6.2 Sol, Zieldatei `lean/prosa/s2_444_spurA_r6_pruefung.md`
- S2-29 (Blind-Sucher): Handkonstruktion, Zieldatei `versuche/s2-blind-r7.md`

Geplant für Runde 8: die übrigen Lean-Fassungen, Aussagen-Abgleich für B-012 und B-013, Blind-Sucher.

---

## 25.11.2026 · Stufe 2, Runde 7, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S2-26, S2-27, S2-28, S2-29.

**Gelieferte Dateien**

- S2-26 (Formalisierer): `lean/YangBounds/SatzC444Kern.lean` und `SatzC444Generisch.lean` mit `satzC_kern`, `satzC_generisch` und `folgerungC1_generisch`, Pull Request #59
- S2-27 (Formalisierer): `lean/YangBounds/SatzE444.lean` und `SatzE444Buendel.lean` mit `satzE`, `satzE_global` und `nur_unterfallB`, Pull Request #60
- S2-28 (Prüfer): `lean/prosa/s2_444_spurA_r6_pruefung.md`, Prüfvermerk in `behauptungen/B-014.md`, Code und Fremdmodell in `versuche/s2-28/`, Pull Request #58
- S2-29 (Blind-Sucher): `versuche/s2-blind-r7.md`, Pull Request #57. Der Merge gelang erst nach mehreren Fehlern 500 von GitHub.

**Befunde**

- S2-26: Satz C und Folgerung C1 in der generischen Fassung (R-C1) sind in Lean ohne sorry. Offen ist, dass die Symmetrie am generischen Punkt vorausgesetzt wird, nicht auf einer offenen Menge. Schritt 0 der Prosa ist nicht formalisiert. Der Aussagen-Abgleich fehlt.
- S2-27: Satz E (Unterfall A unmöglich) ist in Lean ohne sorry. Lemma P (die Dichotomie) steht nur als benannte Hypothese `LemmaPStatement` da und ist nicht bewiesen. Es fehlt auch die Verkettung mit Satz C (vom generischen Punkt zum algebraischen Abschluss).
- S2-28: B-014 hält mit den benannten Reparaturen R-K, R-F1, R-F2 und R-F3, keine Aussage ändert sich. GPT 6.2 Sol kommt unabhängig zum gleichen Urteil und hat alle 13 Fragen mit JA beantwortet. Offenlegung des Prüfers (Bericht Abschnitt 0): Das Projektgedächtnis hat ihm vor der Prüfung eine Kurzfassung der Urteile aus S2-22 und S2-23 eingeblendet, darunter das zum GPT-Vorschlag gegen Unterfall B. Prüfberichte hat er nicht gelesen. Das Fremdmodell sah kein Urteil.
- S2-29: Kein Verfahren mit 25 Produkten und kein Beweis. Die Hilfssätze haben Status behauptet, die Schlüsse auf 26 Status vermutet. Der Sucher war nur eingeschränkt blind, das Gedächtnis zeigte ihm Inhalte zu S2-23 und S2-24 (Bericht Abschnitt 8).

**Selbst nachgesehen**

- Die Actions-Läufe 45653961790 (am Merge-Commit 0563469) und 45658431578 (am Merge-Commit b8cee48) liefen auf `main` und endeten mit success.
- Im Lauf 45658431578 meldet der Axiom-Bericht nur `propext`, `Classical.choice` und `Quot.sound`, und zwar für `satzC_kern`, `satzC_generisch`, `folgerungC1_generisch`, `satzE`, `satzE_global` und `nur_unterfallB`. Gesamt: `TOTAL: STANDARD=15`.
- Die Zeile „SORRY“ lag außerhalb des Log-Ausschnitts, den ich abrufen konnte. In den Quellen unter `lean/YangBounds/` steht `sorry` nur in Kommentaren.
- Es gibt keine Statusänderung zu geprüft, weil der Aussagen-Abgleich fehlt.

**Neuer Status je Behauptung**

- B-012: **behauptet**. Lean-Fassung und Lauf sind in der Übersicht eingetragen.
- B-013: **behauptet**. Lean-Fassung von Satz E und Lauf sind eingetragen.
- B-014: **behauptet**, Prüfvermerk S2-28 mit Reparaturen eingetragen.
- Alle übrigen unverändert.

**Merges**

Alle vier Pull Requests sind auf `main`, gemergt am 25.11.2026 unter dem GitHub-Konto Justus42:

- PR #57 um 16:59 Uhr (MEZ), Merge-Commit 55dd86e
- PR #58 um 17:04 Uhr, Merge-Commit 142c495
- PR #59 um 17:26 Uhr, Merge-Commit 0563469
- PR #60 um 17:51 Uhr, Merge-Commit b8cee48

**Runden**

Verbraucht in Stufe 2: 7 von 12.

**Zählerstand nach Abbruchregel 2 (Fassung 0.3), Spur A (Lesart des Orchestrators)**

- Runde 7 bringt Fortschritt nach b). B-014 schließt einen benannten Fall aus, Unterfall B von (5,8). Prüfer und Fremdmodell haben B-014 mit benannten Reparaturen bestätigt.
- Zähler Spur A: **0 von 3**.
- Frist für B-014: geprüft bis Ende Runde 9.
- Frist aus Runde 6: B-012 und B-013 müssen bis Ende Runde 8 geprüft sein.
  - Bei B-013 kann bis dahin voraussichtlich nur Satz E geprüft werden, nicht Lemma P (die Dichotomie).
  - Strenge Lesart des Orchestrators: Hält B-013 die Frist nur teilweise, trägt B-012 allein den Fortschritt aus Runde 6. Dafür muss B-012 bis Ende Runde 8 geprüft sein.
- Vorbehalt zur Unabhängigkeit in S2-28 (siehe Befunde) ist an den Orchestrator gemeldet.
- Spur B: aufgegeben.

**Runde 8 der Stufe 2, vergeben (Start 17:58 Uhr MEZ, vier Aufträge)**

- S2-30 (Prüfer): Aussagen-Abgleich B-012 mit GPT 6.2 Sol
- S2-31 (Prüfer): Aussagen-Abgleich B-013 (Satz E) mit GPT 6.2 Sol
- S2-32 (Formalisierer): Lemma P in Lean
- S2-33 (Blind-Sucher): Zieldatei `versuche/s2-blind-r8.md`

Geplant für Runde 9: Lean für B-014, der Übergang vom generischen Punkt zum algebraischen Abschluss und das Zusammensetzen, Aussagen-Abgleich für Lemma P, Blind-Sucher.

**Nachtrag zu Stufe 2, Runde 7: Zählerstand (Lesart des Orchestrators)**

1. Runde 7 zählt nicht als Fortschritt nach b). Der Prüfer von S2-28 hat vor der Prüfung frühere Prüfurteile gesehen, eingeblendet aus dem Projektgedächtnis. Die Bestätigung von B-014 ist damit nicht unabhängig im Sinn von Abschnitt 6. Bei zwei Lesarten nimmt der Orchestrator die strengere.
   - Zähler Spur A: **1 von 3**.
   - Die Frist „Ende Runde 9“ für B-014 entfällt.
   - In Runde 9 prüfen ein unbeeinflusster Prüfer und GPT 6.2 Sol B-014 neu. Bestätigen beide, wäre das Fortschritt in Runde 9.
   - Der Orchestrator hat die Übersicht des Projektgedächtnisses bereinigt. Dort stehen keine Verweise auf S2-Einträge und keine Urteile mehr, dafür die Anweisung, keine Prüfurteile und Befunde einzutragen. Die verlinkten Einzeleinträge kann der Orchestrator nicht löschen.
2. S2-30 benennt genau, welcher Teil von B-012 geprüft werden kann und ob die generische Fassung für die Kette reicht. Hält nur ein Teil von B-012 oder B-013 die Frist (Ende Runde 8), trägt dieser Teil den Fortschritt aus Runde 6, solange er einen benannten Fall ausschließt. In Runde 8 wird dadurch nichts neu gezählt, denn dieselbe Aussage zählt nur einmal. Ohne anderes Ergebnis steht Spur A nach Runde 8 bei **2 von 3**.
3. Die SORRY-Zeile von Lauf 45658431578 lesen die Prüfer S2-30 und S2-31 selbst nach. Vorher wechselt kein Status.

**Nachtrag: Projektgedächtnis bereinigt (25.11.2026, Auftrag des Orchestrators)**

- Die 24 Einträge `s2-*.md` aus dem Projektgedächtnis sind wörtlich unter `archiv/gedaechtnis/` abgelegt (Commit c536897). Jede Datei ist byteweise gleich mit dem Original auf `main` angekommen, selbst nachgesehen.
- Danach sind alle 24 Einträge aus dem Gedächtnis gelöscht.
- Unangetastet bleiben: `schranken-befunde.md`, die Einträge aus Stufe 0 und 1 sowie die Übersicht `MEMORY.md`.
- Nicht erfasst ist `spurb-r1-4x2x4.md`, ein Eintrag aus Stufe 2 ohne das Präfix `s2-`. Er bleibt bis zur Entscheidung des Orchestrators im Gedächtnis.
- Prüfer und Blind-Sucher dürfen `archiv/gedaechtnis/` nicht lesen (Hinweis in der README dort).
- Ergänzung: Auf Entscheidung des Orchestrators ist auch `spurb-r1-4x2x4.md` wörtlich unter `archiv/gedaechtnis/` abgelegt, byteweise verglichen und danach aus dem Gedächtnis gelöscht. Insgesamt sind damit 25 Einträge archiviert und gelöscht.

---

## 25.11.2026 · Stufe 2, Runde 8, Zwischenstand

**S2-30 (Prüfer): Aussagen-Abgleich B-012, Pull Request #61, gemergt um 18:13 Uhr (MEZ) unter dem Konto Justus42, Merge-Commit 1daace0**

- Bericht `lean/prosa/s2_444_spurA_r8_abgleich_b012.md`, Antwort des Fremdmodells `versuche/s2-30/gpt_antwort.md`, Vermerk in `behauptungen/B-012.md`.
- Prüfer und GPT 6.2 Sol bestätigen unabhängig voneinander, dass die Lean-Sätze `satzC_generisch`, `folgerungC1_generisch` und `folgerungC1_nicht36` die generische Fassung von Satz C und von C1 nach R-C1 sind („Teil G“, über K(S,T)). Der Wortlaut mit offener Menge über K̄ ist nur über ein nicht formalisiertes Spezialisierungsargument gleichwertig.
- Die SORRY-Zeile von Lauf 45653961790 hat der Prüfer selbst nachgelesen: SORRY 0, nur Standard-Axiome.
- Satz E ist in Lean nur für algebraisch abgeschlossene Körper formuliert. Der Anschluss an Teil G ist offen.
- Offenlegung des Prüfers: Das Feld „Prüfung“ in `B-012.md` enthielt die Zusammenfassung des Prosa-Prüfurteils von S2-22. Außerdem wurden ihm Gedächtnisnotizen zu S2-22 und S2-26 eingeblendet. Das Fremdmodell sah keine Urteile.
- Der Prüfer hat den Status in `B-012.md` selbst eingetragen, obwohl die Datei sagt, dass der Orchestrator den Status setzt.

**Neuer Status**

- B-012: **geprüft** für Teil G, **unter Vorbehalt des Orchestrators** zur Unabhängigkeit des Abgleichs. Die Entscheidung über den Vorbehalt steht aus.
- Satz C im Wortlaut und R-C1 an den Punkten einer offenen Menge bleiben **behauptet**.

**Halt nach Runde 8 (Entscheidung des Orchestrators, Abschnitt 11)**

- Der Orchestrator hält nach Runde 8 an, weil eine Regel ausgelegt werden müsste. Runde 8 läuft zu Ende, Runde 9 startet nicht. Er legt die Frage Justus vor, zusammen mit dem Ergebnis von Runde 8.
- Offene Frage: Entwertet ein früheres Prosa-Prüfurteil, das der Prüfer gesehen hat, einen Aussagen-Abgleich nach 5.1 Punkt 3? Abschnitt 4 sagt, der Prüfer bekommt „nur Behauptung und Artefakt, keine Vorgeschichte“.
  - Betroffen ist B-012 (S2-30). Das Feld „Prüfung“ in `B-012.md` enthielt das Urteil von S2-22.
  - Betroffen sind auch B-008 und B-009 (S2-19, S2-20). Beim Abgleich enthielten `B-008.md` und `B-009.md` schon das Urteil von S2-09 (Commit 128221a).
  - Voraussichtlich ist auch B-013 (S2-31) betroffen.
- Die Statuseinträge bleiben, wie sie sind.
  - B-012 Teil G bleibt geprüft unter Vorbehalt.
  - B-008 und B-009 bekommen denselben Vorbehalt als Vermerk in der Übersicht, ohne Statuswechsel.
- Ein Vorschlag geht mit an Justus und ist noch nicht freigegeben: Status, Prüfvermerke und die Übersicht ziehen nach `pruefvermerke/`. `behauptungen/B-xxx.md` enthält dann nur noch Aussage, Herkunft und Artefakt. Prüfer-Aufträge nennen die lesbaren Dateien als Positivliste.

**Zählerstand Spur A in beiden Lesarten (Stand: Runde 8 läuft, S2-31 bis S2-33 offen)**

- **Milde Lesart** (ein gesehenes Prosa-Urteil entwertet den Abgleich nicht):
  - Runde 3: Fortschritt nach b), gehalten durch B-008 und B-009 in Runde 5.
  - Runde 4: kein Fortschritt (1). Runde 5: kein Fortschritt (2).
  - Runde 6: Fortschritt nach b) (0). Die Frist ist gehalten, weil B-012 Teil G bis Runde 8 geprüft ist.
  - Runde 7: kein Fortschritt (1), Entscheidung zu S2-28.
  - Runde 8: nichts neu zu zählen (2).
  - Nach Runde 8: **2 von 3**, sofern S2-31 bis S2-33 nichts Neues bringen. Runde 9 müsste Fortschritt bringen.
- **Strenge Lesart** (der Abgleich ist entwertet):
  - B-008 und B-009 hatten bis Ende Runde 5 keinen gültigen Abgleich. Der Fortschritt aus Runde 3 fällt nachträglich weg.
  - Damit waren die Runden 1 bis 5 ohne Fortschritt. Selbst gezählt erst ab Runde 3 sind es 3 von 3.
  - Spur A hätte nach Abbruchregel 2 spätestens mit Ende von Runde 5 geendet. Die Runden 6 bis 8 lagen dann jenseits der Regel.
  - Auch der Fortschritt aus Runde 6 hielte die Frist nicht, weil der Abgleich für B-012 ebenso betroffen ist und für B-013 voraussichtlich auch.
  - B-008, B-009 und B-012 fielen in den betroffenen Teilen auf behauptet zurück, bis ein unbeeinflusster Abgleich vorliegt. Widerlegt ist dadurch nichts.

---

## 25.11.2026 · Stufe 2, Runde 8, Abschluss

**Aufträge und Subagenten**

Vier Subagenten: S2-30, S2-31, S2-32, S2-33.

**Gelieferte Dateien**

- S2-30 (Prüfer): `lean/prosa/s2_444_spurA_r8_abgleich_b012.md`, Pull Request #61 (siehe Zwischenstand oben)
- S2-31 (Prüfer): `lean/prosa/s2_444_spurA_r4_abgleich_b013.md`, Vermerk in `behauptungen/B-013.md`, Fremdmodell in `versuche/s2-31-abgleich/`, Pull Request #62
- S2-32 (Formalisierer): `lean/YangBounds/LemmaP444.lean` mit `lemmaP`, `nur_unterfallB'` und `nur_unterfallB_global'`, Gegenlesen der Prosa durch GPT in `versuche/s2-32/`, Pull Request #64. Die Datei trägt die neuen Sätze auch in `.github/scripts/lean_report.py` und `lean/Axioms.lean` ein.
- S2-33 (Blind-Sucher): `versuche/s2-blind-r8.md`, Pull Request #63

**Befunde**

- S2-31: Prüfer und GPT 6.2 Sol bestätigen unabhängig voneinander, dass `satzE` Satz E aus B-013 ist, in einer stärkeren Form. Dasselbe gilt für die punktweise Teilaussage von C2 (`commonKernel_trivial`, `sDim_eq_one`).
  - Abweichung bei `satzE_global`: GPT sagt, der Satz entspricht der Aussage nicht, weil `alg'` nicht an `alg` gebunden ist. Der Prüfer vermerkt dasselbe als Hinweis E2.
  - Behauptet bleiben Lemma P, C2 mit offener Menge, „nur Unterfall B“, die Transponierte und die Kubiken.
  - Offenlegung des Prüfers: Die Zeile „Prüfung“ in `B-013.md` mit dem Prosa-Urteil von S2-23 stand vor seinem Urteil vor ihm. Das ist derselbe Vorbehalt wie bei B-012.
  - Der Prüfer hat den Status in `B-013.md` selbst gesetzt.
- S2-32: `lemmaP` beweist `LemmaPStatement` für unendliche Körper (`[Infinite K]`), nicht für endliche. GPT hat die Prosa vorher gegengelesen, Urteil „hält“. Status behauptet, der Aussagen-Abgleich fehlt.
- S2-33: Keine Entscheidung. Gewichtslemma und Reduktion auf eine Einschränkung haben Status behauptet. Der Sucher war nur eingeschränkt blind.

**Selbst nachgesehen**

- Alle vier Pull Requests sind auf `main`, gemergt am 25.11.2026 unter dem Konto Justus42:
  - PR #61 um 18:13 Uhr (MEZ), Merge-Commit 1daace0
  - PR #62 um 18:16 Uhr, Merge-Commit 26241ed
  - PR #63 um 18:20 Uhr, Merge-Commit 5a5b130
  - PR #64 um 18:55 Uhr, Merge-Commit 58d7926
- Lauf 45669881460 lief auf `main` am Merge-Commit 58d7926 und endete mit success.
- In `LemmaP444.lean` steht kein `sorry` außerhalb von Kommentaren.
- Die SORRY-Zeile von Lauf 45658431578 hat der Prüfer S2-31 nach eigener Angabe nachgelesen.

**Neuer Status je Behauptung**

- B-012: geprüft für Teil G, **unter Vorbehalt** (siehe Zwischenstand).
- B-013: **geprüft** für Satz E (`satzE`) und die punktweise Teilaussage von C2, **unter Vorbehalt des Orchestrators** zur Unabhängigkeit des Abgleichs. Alles Übrige bleibt **behauptet**.
- B-008 und B-009: unverändert, mit Vorbehalt vermerkt.
- B-014: unverändert **behauptet**.

**Runden**

Verbraucht in Stufe 2: 8 von 12.

**Zählerstand Spur A**

- In Runde 8 zählt nichts neu.
- Milde Lesart: **2 von 3**.
- Strenge Lesart: Spur A wäre mit Ende von Runde 5 beendet (Rechnung im Zwischenstand oben).
- Spur B: aufgegeben.

**Halt**

Runde 9 startet nicht. Der Orchestrator legt Justus die Auslegungsfrage vor. Betroffen sind B-008, B-009, B-012 und B-013. Mit vorgelegt wird der Vorschlag `pruefvermerke/`.

---

## 25.11.2026 · Regeländerung durch Justus (Protokoll Version 0.4, zählt nicht zum Budget)

Eingetragen im Auftrag von Justus aus einem Chat außerhalb des Projekts, 19:19 Uhr (MEZ).

**Anlass**

Die Prüfer der Aussagen-Abgleiche hatten frühere Prosa-Urteile vor sich, weil das Feld „Prüfung" in der Behauptungsdatei stand, die sie lesen mussten. Der Fehler lag in der Dateivorlage, nicht bei den Prüfern. Dazu kommt: Justus hat diese Woche reichlich Claude-Kontingent, Anfragen an Fremdmodelle kosten ihn dagegen eigenes Geld.

**Entscheidung zur Auslegungsfrage**

Abgleiche neu, sauber getrennt, ohne neue Fremdmodell-Anfragen. Die vorhandenen Urteile von GPT 6.2 Sol gelten weiter, weil das Fremdmodell kein Urteil gesehen hat. Ersetzt werden nur die beeinflussten Prüfer.

**Geändert in PROTOKOLL.md**

- Abschnitt 4: Positivliste für Prüfer und Blind-Sucher. `STATUS.md`, `LOG.md`, `pruefvermerke/` und `archiv/` sind für sie gesperrt. Keine Urteile ins Projektgedächtnis
- Abschnitt 5.1 Punkt 3: Beim Endsatz einer Stufe gleichen ein Prüfer und ein Fremdmodell ab. Bei Zwischenaussagen genügen zwei Prüfer, die einander nicht sehen
- Abschnitt 5.3: Den Status setzt nur der Orchestrator
- Neu 5.4: Prüfvermerke getrennt in `pruefvermerke/`. Eine Prüfung mit gesehenem früheren Urteil ist ungültig und wird wiederholt. Übergangsregel für B-008, B-009, B-012, B-013 und B-014
- Neu 5.5: Fremdmodelle nur für den Abgleich des Endsatzes und für neue Prosa-Beweise, die eine Abbruchregel berühren
- Abschnitt 6: Stufe 2 hat 24 statt 12 Runden. Ab Runde 9 der Stufe 2 bis zu 6 Subagenten pro Runde
- Abschnitt 8: Jeder Runden-Eintrag nennt den Verbrauch (Subagenten, Dauer, Fremdmodell-Anfragen)

**Geändert in CLAUDE.md**

Ausnahmen für Prüfer und Blind-Sucher bei Regel 1 und 7, Status nur durch den Orchestrator, keine Urteile ins Projektgedächtnis, Fremdmodelle nur nach 5.5.

**Offen für den Orchestrator**

- Umzug von Status, Prüfurteilen und Übersicht nach `pruefvermerke/`, Vorlage in `behauptungen/README.md` anpassen
- Zählerstand nach der Übergangsregel in 5.4 im nächsten Runden-Eintrag bestätigen
- STATUS.md nachführen

---

## 25.11.2026 · Entscheidung von Justus zur Auslegungsfrage, Umbau, Stufe 2 Runde 9 vergeben

**Entscheidung von Justus (19:19 Uhr MEZ), wörtlich**

> Abgleiche neu, aber ohne neue Sol-Anfragen: Die vorhandenen GPT-Urteile gelten weiter, nur die Claude-Prüfer werden durch unbeeinflusste ersetzt. Bestätigen sie, gelten die Fristen als gehalten. pruefvermerke/ mit Positivliste ist freigegeben. Budgetänderung: Stufe 2 hat 24 Runden, ab Runde 9 bis zu 6 Subagenten pro Runde. Runde 9: drei Plätze für Lean (Unterfall B, Brücke, Zusammensetzen), drei für frische Prüfer (B-014, dazu die vier Abgleiche gebündelt). Ziel bleibt ein einziger Lean-Satz für die Schranke 26. Lass prüfen, ob die Brücke über „Rang fällt bei Körpererweiterung" einfacher wird. Sol nur noch für den Abgleich des Endsatzes und für neue Prosa-Beweise, die eine Abbruchregel berühren. Schreib in jeden Runden-Eintrag Zahl der Subagenten, Dauer und Zahl der Sol-Anfragen.

**Festgehalten**

- Die vorhandenen GPT-Urteile gelten weiter. Nur die Claude-Prüfer werden durch unbeeinflusste ersetzt. Bestätigen sie, gelten die Fristen aus Runde 3 und Runde 6 als gehalten.
- Stufe 2 hat 24 Runden. Ab Runde 9 sind bis zu 6 Subagenten pro Runde erlaubt.
- Sol (GPT 6.2 Sol) gibt es nur noch für den Abgleich des Endsatzes und für neue Prosa-Beweise, die eine Abbruchregel berühren.
- Jeder Runden-Eintrag nennt ab jetzt die Zahl der Subagenten, die Dauer und die Zahl der Sol-Anfragen.
- Protokoll 0.4 (Commit 626eb7b, im Auftrag von Justus eingetragen) enthält diese Regeln bereits: Abschnitte 4, 5.1, 5.3 bis 5.5, 6 und 8. Das Budget von 24 Runden und die 6 Subagenten stehen damit auch in PROTOKOLL.md. Den Wortlaut von PROTOKOLL.md ändert nur Justus.
- Nach Justus' Platzvergabe hat Runde 9 keinen Blind-Sucher. Abschnitt 6 verlangt mindestens einen Blind-Sucher pro Runde, die ausdrückliche Platzvergabe von Justus geht hier vor.
- Die Brücke (S2-35) wird ohne Sol-Gegenlesen formalisiert. Das entspricht 5.5, weil sie kein neuer Prosa-Beweis ist, der eine Abbruchregel berührt.

**Umbau nach Protokoll 5.4 (Commit d905704)**

- `behauptungen/B-xxx.md` enthält nur noch Aussage, Herkunft und Artefakt.
  - B-012 hat dazu die Fassung R-C1 als Teil der Aussage bekommen.
  - B-012 und B-013 haben eine neutrale Zeile „Lean-Artefakt“ bekommen.
- `pruefvermerke/B-xxx.md` ist jeweils die wörtliche Kopie der früheren Behauptungsdatei.
- Die Übersicht mit Status steht jetzt in `pruefvermerke/README.md`.
- Das Signal für die Prüfer ist die Datei `pruefvermerke/UMBAU-FERTIG`.

**Zählerstand nach der Übergangsregel in 5.4 (vom Orchestrator zu bestätigen)**

- Bestätigen die neuen Prüfer die vier Abgleiche, gilt:
  - Runde 3 hat Fortschritt gebracht.
  - Runde 4 und 5 brachten keinen.
  - Runde 6 hat Fortschritt gebracht.
  - Runde 7 und 8 brachten keinen.
  - Damit steht Spur A nach Runde 8 bei **2 von 3**.
- Bestätigt der neue Prüfer B-014, zählt das als Fortschritt in Runde 9. B-014 muss dann bis Ende Runde 11 geprüft sein.
- Bis dahin bleiben die Statuseinträge mit Vorbehalt stehen.

**Runde 9 der Stufe 2, vergeben (Start 19:22 Uhr MEZ, sechs Subagenten, 0 Sol-Anfragen geplant)**

- S2-34 (Formalisierer): Unterfall B in Lean (B-014)
- S2-35 (Formalisierer): Brücke vom generischen Punkt zum algebraisch abgeschlossenen Körper in Lean. Justus' Auftrag: prüfen, ob die Brücke über „Rang fällt bei Körpererweiterung“ einfacher wird.
- S2-36 (Formalisierer): Zusammensetzen zum Endsatz mit benannten Hypothesen
- S2-37 (frischer Prüfer): B-014
- S2-38 (frischer Prüfer): Aussagen-Abgleiche B-008 und B-009
- S2-39 (frischer Prüfer): Aussagen-Abgleiche B-012 und Satz E aus B-013

Die Prüfer setzen keinen Status. Der Orchestrator meldet die Ergebnisse, danach trägt die Schreibhand den Status ein.

**Nachtrag zu Runde 9: Ersatz von S2-39, zweite Bereinigung des Projektgedächtnisses**

- S2-39 wurde nach unter einer Minute abgebrochen und durch S2-40 ersetzt (frischer Prüfer, Aussagen-Abgleiche B-012 und Satz E aus B-013). Grund: Beim Start wurden ihm Gedächtniseinträge mit früheren Urteilen eingeblendet. Die Threads der Runde 8 hatten sie nach der ersten Bereinigung neu angelegt. Es arbeiten weiter sechs Subagenten.
- Wörtlich unter `archiv/gedaechtnis/` abgelegt, byteweise verglichen und danach aus dem Gedächtnis gelöscht (Commit 5ba150c): `s2-30-abgleich-b012`, `s2-31-abgleich-b013`, `s2-32-lemmaP-lean`, `s2-33-blind-r8`, `grenzrang-244`, `wache-openai-math` und `wache-stufe2-4x2x4`.
- `repo-schreibrechte` ist archiviert und auf die Schreibrechte gekürzt, ohne Status, Zähler und Halt.
- Die 24 Einträge aus Stufe 0 und 1 sind vorsorglich wörtlich unter `archiv/gedaechtnis/stufe01/` abgelegt (Commit 607f925). Ihre Kürzung um Prüfurteile und Statusangaben steht noch aus.
- S2-40 ist um 19:25 Uhr (MEZ) gestartet.
- Offener Punkt für Justus: Die Einträge aus Stufe 0 und 1 im Projektgedächtnis enthalten weiter Prüfurteile und Statusangaben zu B-001 bis B-007 und zu den Yang-Prosabeweisen. Der Sicherheitsfilter der Sitzung hat ihre Kürzung abgelehnt, der Orchestrator umgeht das nicht. Sie betreffen nicht die Behauptungen, die in Runde 9 geprüft werden. Wörtliche Kopien liegen unter `archiv/gedaechtnis/stufe01/`. Soll gekürzt werden?

---

## 25.11.2026 · Korrektur durch Justus (Protokoll Version 0.4.1, zählt nicht zum Budget)

Eingetragen im Auftrag von Justus aus einem Chat außerhalb des Projekts, 19:36 Uhr (MEZ).

**Fehler in Version 0.4**

Der Übergangsabsatz zu den wiederholten Prüfungen stand in Abschnitt 5.4. Abschnitt 5 ist der Teil, den Prüfer lesen dürfen. Der Absatz nannte die betroffenen Behauptungen und sagte, dass frühere Urteile des Fremdmodells weiter gelten. Ein Prüfer konnte daraus schließen, dass es frühere Prüfungen gab und wie sie ausgingen. Der Fehler liegt beim Verfasser der Protokolländerung, nicht beim Orchestrator oder bei den Prüfern.

**Geändert in PROTOKOLL.md**

- Der Absatz steht wortgleich in Abschnitt 6 bei Abbruchregel 2, mit einem Hinweis auf die Verschiebung
- Abschnitt 5.4 sagt jetzt nur noch, dass Abschnitt 5 keine einzelne Behauptung und keinen Prüfstand nennt

Am Inhalt der Regeln ändert sich nichts.

**Folge für Runde 9 (Entscheidung beim Orchestrator nach 5.4)**

Die Prüfer S2-37, S2-38 und S2-40 haben Abschnitt 5 in der Fassung 0.4 gelesen oder konnten ihn lesen. Empfehlung an Justus: alle drei abbrechen und durch neue ersetzen, die die Fassung 0.4.1 lesen. Die Formalisierer S2-34 bis S2-36 sind nicht betroffen.

---

## 25.11.2026 · Anweisung von Justus zu Protokoll 0.4.1, Ersatz der Prüfer in Runde 9

**Anweisung von Justus (19:39 Uhr MEZ), wörtlich**

> Protokoll 0.4.1 liegt auf main. Der Übergangsabsatz stand in Abschnitt 5.4 und hat den Prüfern verraten, dass es frühere Prüfungen gab. Er steht jetzt in Abschnitt 6. Brich die Prüfer S2-37, S2-38 und S2-40 ab und ersetze sie durch neue, die Abschnitt 5 in der Fassung 0.4.1 lesen. Die Formalisierer laufen weiter. Runde 9 ohne Blind-Sucher ist genehmigt. Prüfe vor jeder Vergabe an Prüfer oder Blind-Sucher, ob das Projektgedächtnis Urteile enthält.

**Festgehalten**

- S2-37 (B-014, PR #68), S2-38 (B-008 und B-009, PR #66) und S2-40 (B-012 und Satz E aus B-013, PR #67) waren beim Abbruch schon fertig. Ihre Berichte gelten als **ungültig**, die Dateien bleiben im Repo.
- Ersatz: S2-41, S2-42 und S2-43, frische Prüfer mit Abschnitt 5 in der Fassung 0.4.1. Sie starten erst, wenn das Gedächtnis bereinigt ist.
- In Runde 9 sind damit zehn Aufträge gestartet, sechs zählen:
  - zählend: S2-34, S2-35, S2-36, S2-41, S2-42, S2-43
  - nicht zählend: S2-37, S2-38, S2-39 und S2-40
- Runde 9 ohne Blind-Sucher ist von Justus genehmigt.
- Die Karte des Orchestrators zur Gültigkeit von S2-40 ist zurückgezogen, sie ist gegenstandslos.

**Vorbereitung der Ersatzprüfer (Schreibhand)**

- Gedächtnis:
  - Alle Einzeleinträge sind durchgesehen. Wörtliche Kopien liegen unter `archiv/gedaechtnis/` und `archiv/gedaechtnis/stufe01/`.
  - Gelöscht ist `pruefung-yang-n4`. Auf den Sachinhalt gekürzt sind 19 Einträge, Prüfurteile, Status- und Ergebnisangaben sind entfernt.
  - Unverändert bleiben `git-regeln`, `gemini-bridge`, `mm325-lizenz`, `schranken-befunde`, `verfahren-datenformat`, `verfahren-randfaelle-s1-04` und `lean-yang-bounds`. Sie enthalten nur Verfahrens-, Format- und Literaturangaben.
- Lean (Commit 08854c3): In 12 Dateien unter `lean/YangBounds/` sind Kommentarverweise auf frühere Prüfberichte entfernt („review“, „checked in …_pruefung.md“, „GPT supplement“, „repaired as R-C1“). Am Code ist nichts geändert.
- `behauptungen/B-012.md`: Der Hinweis „Gegenstand des Aussagen-Abgleichs“ ist entfernt. Die Zeile heißt jetzt „Folgerung C1, generische Fassung (R-C1)“.
- Prosa-Berichte, die als Herkunft genannt sind, bleiben unverändert. Sie zitieren aber frühere Urteile oder Status:
  - `lean/prosa/s2_444_spurA_r4.md`: Abschnitt 1 (V′ aus S2-09), Abschnitt 2 (Reparatur R1 aus S2-09, „B-007 (geprüft)“) und Abschnitt 4 (Beweis von C1: „mit R1 und V′ aus S2-09“).
  - `lean/prosa/s2_444_spurA_r6.md`: Abschnitt 5 (F2: „B-007 und B-010 (beide geprüft)“, „Geprüft sind …, im Kern B-008 und B-009“, laufende Prüfungen S2-22 und S2-23) und Abschnitt 11 (Vorschläge zu Prüfungen).
  - `lean/prosa/s2_444_spurA_r2.md`: Statusübersicht („bestätigt S2-02“, das ist ein Suchergebnis und kein Prüfurteil).
  - `versuche/s2-32/lemmaP_prosa.md`: Zeile 3 nennt die Reparaturen aus dem Prüfbericht S2-23.
  - `lean/prosa/yang_n4.md`: ohne Fund.

---

## 25.11.2026 · Anweisung von Justus: letzte Wiederholung der drei Prüfungen in Runde 9

**Anweisung von Justus (19:45 Uhr MEZ), Inhalt**

- Der Abgleich von Satz E (aus S2-40) gilt nicht.
- Alle drei Prüfer S2-37, S2-38 und S2-40 wussten aus dem Gedächtnis-Index und aus Abschnitt 5.4 in der Fassung 0.4, dass eine Bestätigung erwünscht ist. Alle drei Prüfungen werden deshalb **einmal** wiederholt, als letzte Wiederholung.
- Vorher wird aus dem Gedächtnis-Index jeder Hinweis auf frühere Urteile, auf die Wiederholung und auf Fristen entfernt.
- Die Prüfer bekommen genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten. Sie lesen Abschnitt 5 in der Fassung 0.4.1.
- Ungültig ist danach nur noch, wer ein Urteil zur selben Behauptung gesehen hat oder das erwünschte Ergebnis kannte. Spuren früherer Prüfungen werden offengelegt und hingenommen.
- Eine weitere Wiederholung gibt es nicht. Scheitert auch diese, zählt das vorhandene GPT-Urteil allein, mit Vermerk.
- Dauern werden künftig aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.

**Festgehalten**

- Die Wiederholung übernehmen S2-41 (B-014), S2-42 (B-008 und B-009) und S2-43 (B-012 und Satz E aus B-013).
- Die Prüferaufträge nennen Dateipfade je Behauptung und den Actions-Lauf 57 auf main (Commit 08854c3, Job 139430765012).
- Offengelegte Spuren in den Herkunftsdateien sind im vorigen Eintrag aufgezählt. Sie werden nach dieser Anweisung hingenommen.

---

## 25.11.2026 · Runde 9: Start der letzten Wiederholung, S2-36 erledigt

**Vergabe (Orchestrator, 19:54 Uhr MEZ)**

- S2-41 (B-014), S2-42 (B-008 und B-009) und S2-43 (B-012 und Satz E aus B-013) sind gestartet, mit Abschnitt 5 in der Fassung 0.4.1, genauen Dateipfaden und Job 139430765012 (Lauf 57, Commit 08854c3).
- Berichte: `lean/prosa/s2_444_bericht_s2-41.md` bis `lean/prosa/s2_444_bericht_s2-43.md`.
- S2-42 bekommt `lean/prosa/s2_444_spurA_r6.md` nicht, weil dort Abschnitt 5 ein Urteil zu B-008 und B-009 nennt.
- Vorher hat der Orchestrator im Gedächtnis-Index die Zeile zum Ziel der Schranke und die Zeile zur Prüfung des Gedächtnisses auf Urteile neutral gefasst.

**Lauf 57, von der Schreibhand nachgesehen**

- Grün, alle Schritte erfolgreich.
- SORRY: 0 Deklarationen und 0 Vorkommen in den Quellen.
- Achsen: 21 Hauptsätze, jeweils nur propext, Classical.choice und Quot.sound.

**Lesart des Orchestrators**

- Der Achsenbericht im Job-Protokoll nennt den Endsatz („Final theorem R<4,2,4> >= 26, assuming bridge and sub-case B“). Das gilt als offengelegte Spur. Es ist kein Urteil und kein erwünschtes Ergebnis einer Prüfung.
- Der Laufname nennt frühere Prüfungen. Ein neuer Lauf mit neutralem Namen ist nicht nötig, weil die Prüfer nur das Job-Protokoll abrufen.

**S2-36 erledigt**

- PR #65 ist gemergt (50e9ec1, 19:34 Uhr MEZ). Er bringt `lean/YangBounds/Endsatz444.lean` mit zwei benannten Hypothesen.
- Lauf 56 auf main ist grün.
- Dauer nach Git-Zeitstempeln: vom Vergabe-Commit bis zum Commit e0cc761 (19:25 Uhr MEZ), siehe Rundenabschluss.

---

## 25.11.2026 · Runde 9: Ergebnis der letzten Wiederholung, Status B-008, B-009, B-012, B-013, B-014

**Berichte (von der Schreibhand nachgelesen, Merges nachgesehen)**

- S2-42, B-008 und B-009: `lean/prosa/s2_444_bericht_s2-42.md`, PR #70 (Merge c4af749).
- S2-43, B-012 und Satz E aus B-013: `lean/prosa/s2_444_bericht_s2-43.md`, PR #71 (Merge c17315a).
- S2-41, B-014: `lean/prosa/s2_444_bericht_s2-41.md`, PR #72 (Merge 2d6df41).
- Alle drei nennen `main` bei e1f0aa5 als Prüfstand. S2-42 und S2-43 werten Job 139430765012 aus (SORRY 0, nur propext, Classical.choice, Quot.sound).

**Dauer nach Git-Zeitstempeln**

- Messbeginn: Commit e1f0aa5 (19:51:26 Uhr MEZ), den alle drei als Stand lesen. Der Vergabe-Eintrag 284d933 folgt um 19:53:28 Uhr MEZ.
- S2-42: Bericht-Commit 2347673 um 19:57:34 Uhr MEZ, also höchstens 6 Minuten.
- S2-43: Bericht-Commit 278a558 um 19:58:52 Uhr MEZ, also höchstens 7½ Minuten.
- S2-41: Bericht-Commit e31df0f um 19:58:57 Uhr MEZ, also höchstens 7½ Minuten.

**Gültigkeit (Entscheidung des Orchestrators nach der Regel von Justus, 19:45 Uhr MEZ)**

- Alle drei Prüfungen gelten. Keiner der Prüfer hat ein Urteil zur selben Behauptung gesehen oder das erwünschte Ergebnis gekannt.
- Offengelegte und hingenommene Spuren:
  - S2-42 sah über `git diff c2b4b9a origin/main` die entfernten Kopfkommentare mit Verweisen auf Prosa-Prüfungen. Das ist kein Urteil zum Abgleich.
  - Alle drei sahen Statuswörter in Prosa und Überschriften.
  - S2-41 und S2-43 bekamen während der Arbeit gekürzte Gedächtniseinträge aus Stufe 0 und 1 eingeblendet. Die Schreibhand hat `yang-n4-prosa`, `yang-n3-prosa`, `abgleich-yang-n4-b007` und `aussagen-abgleich-n3` nachgelesen: kein Urteil, kein Status, kein Ergebnis zu einer Behauptung.
- Die Berichte von S2-37 (PR #68), S2-38 (PR #66) und S2-40 (PR #67) bleiben ungültig.

**Status (gesetzt vom Orchestrator)**

- B-008: **geprüft** für Satz A, Lemma 13′, A2 und die Surjektivität in A1. Der Vorbehalt entfällt. **behauptet** bleiben der Isomorphismus in A1 und die globale Fassung als Aussage über die gegebene Zerlegung.
- B-009: **geprüft** für die Fallliste (3,6) oder (5,8). Der Vorbehalt entfällt. **behauptet** bleiben die Symmetrie mit μ_t ≠ 0, Lemma V und der volle Wortlaut von Lemma S.
- B-012: **geprüft** für die generische Fassung über K(S,T) (nicht symmetrisch, Fall (5,8), nicht (3,6)). Der Vorbehalt entfällt. **behauptet** bleiben die Fassung mit offener Menge und Schritt 0.
- B-013: **geprüft** für Satz E (`satzE`) samt `commonKernel_trivial` und `sDim_eq_one` je Normalform. Der Vorbehalt entfällt. **behauptet** bleibt der Rest. Vermerk: `satzE_global` sagt nichts über die eingegebene Zerlegung.
- B-014: bleibt **behauptet**. Der neue Prüfer S2-41 urteilt „hält mit Reparaturen R-K, R-T, R-N“, zusammen mit dem vorhandenen GPT-Urteil.
- Eingetragen in `pruefvermerke/B-008.md`, `B-009.md`, `B-012.md`, `B-013.md`, `B-014.md` und in der Übersicht `pruefvermerke/README.md`.

**Zählerstand nach Abbruchregel 2, Spur A (Lesart des Orchestrators, Übergangsregel Abschnitt 6)**

- Die vier Aussagen-Abgleiche sind bestätigt. Die Fristen aus Runde 3 und Runde 6 gelten als gehalten.
- B-014 zählt als Fortschritt in Runde 9, Frist für Status geprüft: **Ende Runde 11**.
- Runde 7 und 8 ohne Fortschritt, Runde 9 mit Fortschritt. Zähler Spur A: **0 von 3**.
- Gegengelesen von der Schreibhand gegen Abschnitt 6 (Fassung 0.4.1): gleiche Lesart. Abbruchregel 2 verlangt drei Runden in Folge ohne Fortschritt, und der Fortschritt in Runde 9 unterbricht die Folge.
- Hinweise der Schreibhand für die Frist:
  - R-T in B-014 stützt sich auf Satz A und auf die Fallliste aus Satz B, die beide jetzt geprüft sind.
  - F1 und F2 stützen sich zusätzlich auf Teile von B-012 und B-013, die behauptet bleiben (offene Menge P_ns, Lemma P, C2). Bis Ende Runde 11 muss B-014 entweder mit diesen Teilen geprüft sein oder ohne sie auskommen.

**Weiteres in Runde 9**

- S2-35 (Brücke, `lean/YangBounds/Bruecke444.lean`) ist mit PR #69 gemergt (deaea2e, 19:59 Uhr MEZ). Der Lean-Lauf auf main läuft noch, Ergebnis folgt.
- S2-34 ist offen.
- Verbrauch bisher: 6 zählende Subagenten (10 gestartet), 0 Sol-Anfragen.

---

## 25.11.2026 · Runde 9: S2-35 erledigt

- PR #69 (Merge deaea2e, 19:59 Uhr MEZ) bringt `lean/YangBounds/Bruecke444.lean` und `lean/prosa/s2_444_spurA_r9_bruecke.md`.
- Lauf 65 auf main ist grün (Job 139440176459), von der Schreibhand nachgesehen.
- Der Achsenbericht nennt TOTAL STANDARD=27. Alle Hauptsätze, auch die sechs neuen aus `Bruecke444.lean`, benutzen nur propext, Classical.choice und Quot.sound. Neu sind `bruecke`, `bruecke_exists`, `bruecke_unterfallB`, `bruecke_nicht_unterfallA`, `brueckeStatement` und `rank_four_two_four_ge_26_of_unterfallB`.
- In `Bruecke444.lean` steht `sorry` nur im Kommentar.
- Der Endsatz `Bruecke444.rank_four_two_four_ge_26_of_unterfallB` trägt nur noch die Hypothese zu Unterfall B (laut Achsenbericht: „bridge discharged, assuming sub-case B“). Den Status setzt der Orchestrator.

---

## 25.11.2026 · Stufe 2, Runde 9 abgeschlossen

**S2-34 erledigt (von der Schreibhand nachgesehen)**

- PR #73 ist gemergt (9f5a928, 20:12 Uhr MEZ). Er bringt `lean/YangBounds/SatzF444.lean`.
- Lauf 67 auf main ist grün (Run 45682937335, Job 139447937419).
- Die SORRY-Zeilen lauten wörtlich: „SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log“ und „SORRY: 0 'sorry' token(s) in the sources outside comments“.
- Achsenbericht: TOTAL STANDARD=31. Neu sind `SatzF444.satzF`, `fall58_symmetrisch`, `unterfallBStatement_of` und `rank_four_two_four_ge_26_of_hyp`. Alle benutzen nur propext, Classical.choice und Quot.sound.
- Der Ausschluss von Unterfall B und `rank_four_two_four_ge_26_of_hyp` hängen an zwei benannten Hypothesen: `TransponiertEng` (B3′) und `VielePunkte alg 11` (Z′). Lemma K ist nicht formalisiert.

**Status (Orchestrator)**

- B-014 bleibt **behauptet**.
- Frist für Status geprüft: Ende Runde 11.

**Verbrauch Runde 9**

- 6 zählende Subagenten: S2-34, S2-35, S2-36, S2-41, S2-42 und S2-43.
- Gestartet und ersetzt wurden S2-37, S2-38, S2-39 und S2-40.
- Sol-Anfragen: 0.

**Dauer nach Git-Zeitstempeln**

- Von Protokoll 0.4 (626eb7b, 19:21:25 Uhr MEZ, Grundlage aller Aufträge der Runde) bis zum letzten Merge der Runde (9f5a928, 20:12:46 Uhr MEZ): 51 Minuten. Der Vergabe-Eintrag b4ab3c8 stammt von 19:22:49 Uhr MEZ.
- Die letzten Lieferungen je Auftrag (MEZ):
  - S2-36: e0cc761, 19:25
  - S2-38: eb9a69b, 19:26
  - S2-40: c288079, 19:28
  - S2-37: 51a99ec, 19:30
  - S2-35: a6fb7f7, 19:50
  - S2-42: 2347673, 19:57
  - S2-43: 278a558, 19:58
  - S2-41: e31df0f, 19:58
  - S2-34: 2980f1f, 20:10 und 3eeef70, 20:12
- Start-Commits einzelner Aufträge gibt es in Git nicht. Dauern je Auftrag sind daher nur als Obergrenze ab 626eb7b messbar, für S2-41 bis S2-43 ab e1f0aa5.

**Zählerstand nach Abbruchregel 2 (Lesart des Orchestrators)**

- Spur A: **0 von 3**, Fortschritt in Runde 9 durch B-014, Frist Ende Runde 11.
- Spur B: aufgegeben.

---

## 25.11.2026 · Stufe 2, Runde 10 vergeben (Meldung des Orchestrators)

**Start: 20:24 Uhr MEZ. Sechs Aufträge, 0 Sol-Anfragen geplant.**

- S2-44: Lean, `TransponiertEng`
- S2-45: Lean, Lemma K
- S2-46: Lean, Lemma Z (`VielePunkte`, Lemma K als benannte Hypothese)
- S2-47 und S2-48: zwei Prüfer, die einander nicht sehen. Sie machen die Aussagen-Abgleiche nach 5.1 Punkt 3 (Zwischenaussagen, zwei Prüfer) zu Lemma P (`lean/YangBounds/LemmaP444.lean`, B-013) und zur Brücke (`lean/YangBounds/Bruecke444.lean`, B-015).
- S2-49: Blind-Sucher, `versuche/s2-blind-r10.md`

Die drei Lean-Aufträge laufen schon. S2-47 bis S2-49 starten erst nach der Durchsicht des Gedächtnisses.

**Vorbereitung durch die Schreibhand**

- Neue Behauptung `behauptungen/B-015.md` (Brücke), angelegt im Auftrag des Orchestrators aus Abschnitt 7 der Prosa von S2-35 und dem Lean-Dateikopf. Dazu `pruefvermerke/B-015.md` mit Status **behauptet** und Einträge in beiden Übersichten.
- Gedächtnis:
  - Die Einträge `s2-34-satzF-lean`, `s2-35-bruecke-lean` und `s2-36-endsatz-lean` aus Runde 9 sind wörtlich nach `archiv/gedaechtnis/` kopiert und aus dem Gedächtnis gelöscht.
  - Index und übrige Einzeleinträge sind durchgesehen. Sie enthalten keine Urteile, keinen Status und kein erwünschtes Ergebnis zu einer Behauptung. Restpunkte stehen in der Meldung an den Orchestrator.

---

## 25.11.2026 · Runde 10: Vorbereitung von S2-47 bis S2-49 abgeschlossen

**Gedächtnis (im Auftrag des Orchestrators)**

- Aus dem Gedächtnis gelöscht: `yang-n4-prosa`, `lean-yang-n4-haupt`, `lean-lemma13-n4` und `abgleich-yang-n4-b007`. Sie nennen Yangs Methode für n = 4 und hätten dem Blind-Sucher eine Richtung gezeigt.
- Die ungekürzten Fassungen lagen schon unter `archiv/gedaechtnis/stufe01/`. Die gekürzten Fassungen weichen davon ab und liegen jetzt zusätzlich als `…-gekuerzt.md` dort.
- Der Orchestrator hat die Index-Zeile zur Spur gestrichen.

**B-013**

- Lemma P ist jetzt ein eigener, abgegrenzter Punkt der Aussage. Er gibt den Wortlaut von `lean/prosa/s2_444_spurA_r4.md` Abschnitt 5.1 wieder, mit den Voraussetzungen vom Anfang von Abschnitt 5 und aus Abschnitt 2 (K algebraisch abgeschlossen).
- Ohne Urteil und ohne Bezug auf die Lean-Fassung. Der übrige Text ist inhaltlich gleich, der alte Satz zu Lemma P verweist auf den neuen Punkt.

**Festgehalten**

- Blind-Sucher S2-49 liest nur `CLAUDE.md` und die Problemstellung im Auftrag.

---

## 25.11.2026 · Runde 10: Aussagen-Abgleiche Lemma P (B-013) und Brücke (B-015)

**Berichte (von der Schreibhand nachgelesen, Merges nachgesehen)**

- S2-47: `lean/prosa/s2_444_bericht_s2-47.md`, PR #74 (Merge 31ac0f2).
- S2-48: `lean/prosa/s2_444_bericht_s2-48.md`, PR #76 (Merge 2cc0b05).
- Beide lesen `main` bei 2379d6b und werten Job 139447937419 aus (SORRY 0, nur propext, Classical.choice, Quot.sound).
- Den Commit des Jobs konnten die Prüfer nicht abfragen. Lauf 67 hat 9f5a928 gebaut, und unter `lean/` ist bis 2cc0b05 nichts geändert (von der Schreibhand nachgesehen).

**Dauer nach Git-Zeitstempeln**

- Messbeginn: 2379d6b (20:27:09 Uhr MEZ), den Stand nennen beide.
- S2-47: Bericht-Commit 5b90727 um 20:32:39 Uhr MEZ, höchstens 5½ Minuten.
- S2-48: Bericht-Commit f28dd73 um 20:33:14 Uhr MEZ, höchstens 6 Minuten.

**Gültigkeit (Entscheidung des Orchestrators)**

- Beide gelten. Sie haben einander nicht gesehen, und keiner sah ein Urteil zur selben Behauptung.
- Offengelegte Spuren:
  - Statuswörter in Lean-Dateiköpfen und Prosa-Überschriften.
  - Die Überschrift von §8 der Brücken-Prosa (S2-48).
  - Eingeblendete Gedächtniseinträge aus Stufe 1 ohne Urteil zu B-013 oder B-015. S2-47 bekam `aussagen-abgleich-n3`, `abgleich-yang-n4-b007` und `git-regeln` eingeblendet, S2-48 bekam `aussagen-abgleich-n3` und `gemini-bridge`.
  - **Hinweis der Schreibhand:** `abgleich-yang-n4-b007` war um 20:27 Uhr MEZ gelöscht und wurde S2-47 trotzdem eingeblendet. Die Löschung wirkt beim Einblenden offenbar verzögert.

**Abgleich der beiden Berichte (Schreibhand)**

- In den Urteilen stimmen beide überein:
  - Lemma P ist durch `lemmaP` gedeckt, in den Voraussetzungen stärker.
  - K* ist über alle γ mit Rang 3 gebildet. Beide geben ein eigenes, nicht formalisiertes Argument für die Gleichheit mit dem K* der Prosa.
  - `nur_unterfallB_global'` bindet alg' nicht an alg.
  - B-015 ist in allen drei Teilen gedeckt. `brueckeStatement` ist schwächer.
- Einzige Abweichung: Nur S2-47 macht einen Vorbehalt zur Identifizierung des punktweisen `NichtSymmetrisch` mit p ∈ P_ns (Bericht 1.3 b). S2-48 wertet diesen Teil ohne Vorbehalt als gedeckt.

**Status (gesetzt vom Orchestrator)**

- B-013, Punkt Lemma P: **geprüft** für `lemmaP` (unendlicher Körper) und `nur_unterfallB'`. Vermerke: `NichtSymmetrisch` ist punktweise formuliert. K* wird über alle γ mit rk F_γ = 3 gebildet. `nur_unterfallB_global'` bindet alg' nicht an alg und gehört nicht zum geprüften Umfang.
- B-015: **geprüft** in allen drei Teilen (`bruecke`, `bruecke_exists`, `descent`). Vermerk: `brueckeStatement` ist schwächer als die Behauptung.
- Eingetragen in `pruefvermerke/B-013.md`, `pruefvermerke/B-015.md` und in der Übersicht.

**Zähler (Lesart des Orchestrators, von der Schreibhand gegengelesen)**

- Kein Fortschritt nach Abbruchregel 2 a): B-015 und Lemma P ändern keine Schranke und schließen für sich keinen benannten Fall aus.
- Nach b) zählen sie ebenfalls nicht, weil sie keine neue Behauptung der geforderten Art sind.
- Gleiche Lesart.

### 25.11.2026, Stufe 2, Runde 10 abgeschlossen (Schreibhand im Auftrag des Orchestrators)

**Abschluss (Angaben des Orchestrators, von der Schreibhand nachgesehen)**

- Runde 10 endet mit dem Merge von PR #77 (32f12f6).
- Verbrauch: 6 Subagenten (S2-44 bis S2-49), 0 Fremdmodell-Anfragen.
- Dauer nach Git-Zeitstempeln: von 8226274 (Vergabe von Runde 10, 20:25:26 Uhr MEZ) bis 32f12f6 (21:27:40 Uhr MEZ), **62 Minuten**.

**Lieferungen**

- S2-44: PR #77 (Merge 32f12f6, 21:27:40 Uhr MEZ), `lean/YangBounds/Transponiert444.lean`.
  - `transponiertEng_genAlgL` ohne Hypothese.
  - `Transponiert444.rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4` ohne Hypothese.
  - Lauf 84 auf main (45695177248, Job 139490596774): grün. SORRY 0 Deklarationen und 0 `sorry` im Quelltext. `TOTAL: STANDARD=56`. Beide Sätze nur mit propext, Classical.choice, Quot.sound.
  - Letzte Commits der Lieferung: 29c322a (20:36 Uhr MEZ), c6659a2 (21:20:23 Uhr MEZ, main eingemischt).
- S2-45: PR #78 (Merge 62fdd0a, 20:48:24 Uhr MEZ), `lean/YangBounds/LemmaK444.lean`. Lauf 45688812310, Job 139468468902, SORRY 0. Lieferung 776f67b (20:48:01 Uhr MEZ).
- S2-46: PR #75 (Merge 2f82634, 21:07:19 Uhr MEZ), `lean/YangBounds/LemmaZ444.lean`. Lauf 45691870535, Job 139479127631, SORRY 0. Commits 37c685d (20:32:50 Uhr MEZ) bis abe0919 (20:55:40 Uhr MEZ).
- S2-47 (PR #74) und S2-48 (PR #76): Aussagen-Abgleiche zu Lemma P und B-015, oben eingetragen.
- S2-49: Blind-Sucher, PR #79 (f472bfd, 21:18:28 Uhr MEZ), `versuche/s2-blind-r10.md`. Kein Verfahren mit 25, kein Beweis.
- Die Läufe auf main zu 62fdd0a, 2f82634 und 32f12f6 sind grün. Im Lauf 84 bauen alle vier neuen Dateien (SatzF444, LemmaK444, LemmaZ444, Transponiert444) zusammen.

**Neue Behauptung**

- `behauptungen/B-016.md` angelegt: Für jeden Körper K gilt R_K(⟨4,2,4⟩) ≥ 26. Artefakt `Transponiert444.rank_four_two_four_ge_26`, PR #77.
- Status behauptet. Der Aussagen-Abgleich steht aus (Runde 11).
- In B-014 als Artefakte ergänzt: `SatzF444.lean`, `LemmaK444.lean`, `LemmaZ444.lean`, `Transponiert444.lean`.

**Status (gesetzt vom Orchestrator)**

- Unverändert. B-014 bleibt behauptet, B-016 ist behauptet.

**Zähler (Lesart des Orchestrators, von der Schreibhand gegengelesen)**

- Runde 10 bringt kein neues geprüftes Artefakt, das eine Schranke ändert. Zähler Spur A: **1 von 3**.
- Gegenlesen: Runde 9 hatte Fortschritt, Runde 10 keinen. 1 von 3 ist folgerichtig. Gleiche Lesart.
- Frist B-014: geprüft bis Ende Runde 11.
- Runden verbraucht: 10 von 24.

**Hinweis der Schreibhand**

- `rank_four_two_four_ge_26` ist ohne Hypothese formuliert. Wird B-016 geprüft, ist das Fertig-Kriterium von Stufe 2 erfüllt (Lean-Beweis für 26). Dann hält der Orchestrator nach 11.4 an und berichtet an Justus.

**Gedächtnis (Durchsicht vor Runde 11)**

- `schranken-befunde`: Literaturbefunde aus Stufe 0. Kopie nach `archiv/gedaechtnis/stufe01/schranken-befunde.md`, aus dem Gedächtnis gelöscht. Der Inhalt steht in `lit/QUELLEN.md`.
- `hk-verfahren-a10`: Bauweg der HK-Verfahren (Bauplan, eigene Suche der Paarprodukte, Ergänzungsmatrix) entfernt. Es bleiben Dateinamen, PR und Formathinweis. Stand vorher in `archiv/gedaechtnis/stufe01/hk-verfahren-a10-stand-r10.md`.
- `yang-n3-prosa`: Beweisinhalt (Körperbedingung, Gliederung) entfernt, es bleibt der Verweis auf die Datei. Stand vorher archiviert als `…/yang-n3-prosa-stand-r10.md`.
- `aussagen-abgleich-n3`: Nebenbefund zu Lean-Kommentaren und Herkunftszeile entfernt. Stand vorher archiviert als `…/aussagen-abgleich-n3-stand-r10.md`.
- `lean-yang-bounds`: Zwischenstand zu offenen `sorry` und zur Folgerung für ⟨4,2,4⟩ entfernt. Das Original liegt schon in `archiv/gedaechtnis/stufe01/lean-yang-bounds.md`.
- In Runde 10 ist kein Einzeleintrag neu angelegt oder geändert worden (letzte Änderung 19:42 Uhr MEZ). Der Index wurde um 20:27 Uhr MEZ geändert und enthält keine Urteile. Grundlage ist die Kopie des Gedächtnisses in dieser Sitzung.
- Übrige Einträge: technische Hinweise zu Werkzeugen, Format und Bau, ohne Urteile zu Behauptungen.

**Kopfkommentare der neuen Lean-Dateien (Durchsicht der Schreibhand)**

Kein Prüfurteil, aber Hinweise auf frühere Prüfungen:

- Alle vier Dateien nennen im Kopf das Statuswort `behauptet`. LemmaZ444 sagt zusätzlich „Nothing here is `geprüft` before the check of protocol section 5.1“.
- `SatzF444.lean`, Zeilen 8 bis 10 und 38: verweist auf `lean/prosa/s2_444_spurA_r6_pruefung.md` (Prüfbericht S2-28) und nennt die Reparaturen R-F1 bis R-F3 sowie die Ersatzargumente E2 und E3 („review repair R-F3“).
- `LemmaK444.lean`, Zeilen 8 bis 9 und 50: Reparatur R-K mit Verweis auf `lean/prosa/s2_444_bericht_s2-41.md` (Prüferbericht S2-41) und `s2_444_spurA_r6_pruefung.md`.
- `LemmaZ444.lean`, Zeilen 7 bis 11 und 39: Reparatur von Schritt 2 und R-K, Verweis auf `s2_444_bericht_s2-41.md`.
- `Transponiert444.lean`, Zeilen 7 bis 9 und 36: Reparatur R-T mit Verweis auf `s2_444_bericht_s2-41.md`.
- Die Verweise nennen Prüfberichte zu B-014. Ein Prüfer für B-014 oder B-016, der diese Köpfe liest, sieht, dass B-014 geprüft und repariert wurde, und kann die Berichte öffnen. Das Urteil selbst steht nicht in den Köpfen.

### 25.11.2026, vor Runde 11: Hausarbeit „Kopfkommentare säubern“ (Schreibhand im Auftrag des Orchestrators)

- Außerhalb der Runde, offen ausgewiesen, zählt nicht als Auftrag einer Runde.
- PR #80 (Commit 90409c5, 21:44:38 Uhr MEZ; Merge c3c3884, 21:53:13 Uhr MEZ). Statuswörter, Verweise auf Prüfberichte und Reparaturbezeichnungen (R-K, R-T, R-F1 bis R-F3, E2, E3, R-C1, „repaired“) aus den Kommentaren von 26 Dateien unter `lean/YangBounds/` entfernt.
- Nachgesehen (Schreibhand): Unter `lean/` sind nur Kommentarzeilen geändert. Lauf 86 auf main (45699204903, Job 139504538345) zu c3c3884: grün, SORRY 0.
- Rest, als Spur offengelegt: `.github/scripts/lean_report.py` Zeile 43 trägt das Label „Folgerung C1 (R-C1)“. Es erscheint im Actions-Log, das Prüfer lesen.

### 25.11.2026, Stufe 2, Runde 11, Zwischenstand (Schreibhand im Auftrag des Orchestrators)

**Vergabe und Verbrauch (Angaben des Orchestrators)**

- Beginn mit der Vergabe um 21:05 UTC (22:05 Uhr MEZ).
- Bisher 5 Subagenten (S2-50 bis S2-53, dazu S2-54), 1 Fremdmodell-Anfrage.
- Der Blind-Sucher S2-54 läuft noch. Dauer und Abschluss folgen.

**Lieferungen (Merges nachgesehen)**

- S2-50, Prüfer, Aussagen-Abgleich B-016: `lean/prosa/s2_444_bericht_s2-50.md`, Commit 26d1fb7 (22:07:45 Uhr MEZ), PR #81 (Merge c5566af, 22:07:59 Uhr MEZ).
- S2-53, Prüfer B-014: `lean/prosa/s2_444_bericht_s2-53.md`, Commit 0fae88a (22:09:56 Uhr MEZ), PR #82 (Merge e22e337, 22:10:10 Uhr MEZ).
- S2-52, Prüfer B-014: `lean/prosa/s2_444_bericht_s2-52.md`, Commit 2951e0d (22:09:55 Uhr MEZ), PR #83 (Merge eff7679, 22:10:22 Uhr MEZ).
- S2-51, GPT 6.2 Sol zu B-016: `lean/prosa/s2_444_bericht_s2-51.md`, Commit 7597484 (22:12:53 Uhr MEZ), PR #84 (Merge a4c71cf, 22:13:07 Uhr MEZ).
  - Modell `openai/gpt-6.2-sol-20261117`, Denkstufe high, Batch.
  - 1 Anfrage, Urteil „agrees“.
- Alle vier lesen `main` bei c3c3884 und werten Job 139504538345 aus.
- B-016.md um Commit c3c3884 und Job 139504538345 ergänzt.

**Abgleich der Berichte mit der Zusammenfassung des Orchestrators (Schreibhand)**

- Kein Widerspruch.
- S2-50: drei Punkte „stimmt überein“.
- S2-52 und S2-53 übereinstimmend:
  - Lemma K stimmt.
  - Lemma Z mit 13 Punkten stimmt am generischen Punkt.
  - `keine_drei` stimmt.
  - Die Transponierte stimmt an `genAlgL` ohne Hypothese.
  - F2 stimmt.
- Abweichend:
  - Paarstruktur: S2-52 „nicht vollständig“, S2-53 „mit Vorbehalt“ über `quadGleich_of_rel` und `lemmaK`.
  - Satz F: S2-52 „nicht wörtlich, Umfang getragen“. S2-53 urteilt „stimmt überein“, aber **mit Vorbehalt**: An einer einzelnen Normalform steht die Hypothese `VielePunkte 11`. Diesen Vorbehalt nennt die Zusammenfassung nicht. Er ändert die Einstufung nicht, denn die Wortfassung für eine einzelne Normalform bleibt behauptet.
- Beide melden:
  - F1 hat keinen eigenen unbedingten Satz.
  - Die Fassung mit offener Menge ist nicht formalisiert.
  - `UnterfallB` und `NichtSymmetrisch` sind nur gegen die Prosa abgeglichen, nicht gegen B-012 und B-013.
- Offenlegungen:
  - Alle sahen Gedächtnis-Index und Einträge ohne Urteil zur jeweiligen Behauptung.
  - S2-52 sah Statusangaben in der Prosa `s2_444_spurA_r6.md` (B-014 „behauptet“) und hat sie nach eigener Angabe nicht verwendet.
  - Niemand sah ein früheres Prüfurteil zur selben Behauptung.

**Status (gesetzt vom Orchestrator)**

- B-016: **geprüft**. Lean-Bau ohne sorry, nur Standard-Axiome, grüner Lauf. Abgleich durch einen Prüfer (S2-50) und das Fremdmodell (S2-51) nach 5.1.
- B-014 (strengere Lesart bei abweichenden Urteilen):
  - **Geprüft:** Lemma K; Lemma Z (mindestens 13 Punkte am generischen Punkt, nie mehr als zwei); Transponierte an der generischen Normalform; F2.
  - **Behauptet:** Gestalt des zusammenfallenden Paares mit gemeinsamem x und w; Satz F in der Wortfassung für eine einzelne Normalform; F1 als eigene Aussage; Fassung mit offener Menge.
- Eingetragen in `pruefvermerke/B-014.md`, `pruefvermerke/B-016.md` und in der Übersicht.

**Frist B-014 (geprüft bis Ende Runde 11)**

- Lesart des Orchestrators: gehalten für den Teil, der die Schranke ändert (F2).
- **Offener Punkt für Justus zur Bestätigung.**

**Zähler (Lesart des Orchestrators, von der Schreibhand gegengelesen)**

- B-016 ist ein neues geprüftes Artefakt, das die Schranke ändert. Das ist Fortschritt nach Abbruchregel 2 a). Zähler Spur A: **0 von 3**.
- Gleiche Lesart.

**Fertig-Kriterium Stufe 2**

- Nach Sicht des Orchestrators erfüllt: Lean-Beweis für 26, geprüft als B-016.
- Der Orchestrator hält nach Runde 11 an und meldet an Justus (11.4).
- Als „Ergebnis“ gilt es erst nach Freigabe durch Justus.

**Hinweis der Schreibhand zur Dauer**

- Die Bericht-Commits liegen 2¾ bis 8 Minuten nach der angegebenen Vergabe um 21:05 UTC: S2-50 um 21:07:45 UTC, S2-52 und S2-53 um 21:09:55 UTC, S2-51 um 21:12:53 UTC.
- Job 139504538345 endete laut S2-52 um 21:00 UTC.
- Für die Dauer der Runde fehlt ein Git-Commit, der den Beginn markiert. Ich messe beim Abschluss ab dem Zeitpunkt, den der Orchestrator bestätigt.

### 25.11.2026, Stufe 2, Runde 11, Nachtrag zur Dauer je Aufgabe (Schreibhand im Auftrag des Orchestrators)

- Beginn bestätigt durch den Orchestrator:
  - Die Säuberung (PR #80) meldete sich um 21:04:13 UTC.
  - Die fünf Aufgaben wurden unmittelbar danach vergeben, etwa um 21:05 UTC (22:05 Uhr MEZ).
- Dauer je Aufgabe nach Git, von etwa 21:05 UTC bis zum Bericht-Commit:

| Aufgabe | Bericht-Commit (UTC) | Dauer |
|---|---|---|
| S2-50, Prüfer B-016 | 26d1fb7, 21:07:45 | etwa 3 Minuten |
| S2-52, Prüfer B-014 | 2951e0d, 21:09:55 | etwa 5 Minuten |
| S2-53, Prüfer B-014 | 0fae88a, 21:09:56 | etwa 5 Minuten |
| S2-51, GPT 6.2 Sol zu B-016 | 7597484, 21:12:53 | etwa 8 Minuten |

- S2-51 nennt als Batch-Zeiten der Bridge „abgegeben 22:05, fertig 22:11“ (MEZ).
- Der Blind-Sucher S2-54 wird beim Abschluss der Runde nachgetragen.

### 25.11.2026, Stufe 2, Runde 11 abgeschlossen (Schreibhand im Auftrag des Orchestrators)

**Abschluss**

- Runde 11 endet mit dem Squash-Commit b64e6c8 von PR #85 (22:33:10 Uhr MEZ).
- Verbrauch: 5 Subagenten (S2-50 bis S2-54), 1 Fremdmodell-Anfrage (S2-51).
- Dauer nach Git: von der Vergabe um etwa 21:05 UTC (vom Orchestrator bestätigt, kein eigener Commit) bis b64e6c8 um 21:33:10 UTC, **etwa 28 Minuten**.
- Runden verbraucht: 11 von 24.

**S2-54, Blind-Sucher**

- PR #85, Squash-Commit b64e6c8, `versuche/s2-blind-r11.md`.
- Flip-Graph-Wanderung über GF(2), eigener Code: 4 Prozesse, je 25 Minuten, Rechenblock 21:07 bis 21:32 UTC.
- Alle vier Prozesse erreichen 26, keiner 25. Kein Beweis.
- 0 Fremdmodell-Anfragen.
- Dauer nach Git: etwa 28 Minuten, von etwa 21:05 UTC bis 21:33:10 UTC. Die Rechnung selbst brauchte davon 25 Minuten.

**Dauer je Aufgabe**

| Aufgabe | Dauer |
|---|---|
| S2-50 | etwa 3 Minuten |
| S2-52 | etwa 5 Minuten |
| S2-53 | etwa 5 Minuten |
| S2-51 | etwa 8 Minuten |
| S2-54 | etwa 28 Minuten |

**Offenlegung S2-54**

- S2-54 bekam den Gedächtnis-Index und vier Einzeleinträge eingeblendet: `hk-verfahren-a10`, `verfahren-randfaelle-s1-04`, `git-regeln` und `pruefer-abgleich-s1-20`. Sie sind wörtlich im Bericht wiedergegeben und enthalten nichts zu 4×2×4.
- Beim Kopieren des Gedächtnisordners sah S2-54 die Dateinamen aller Einträge und hat nach eigener Angabe 17 Einträge ungelesen gelöscht:
  - aussagen-abgleich-n3, gemini-bridge, lean-build-cloud, lean-project-ci, lean-satz2-eingesetzt, lean-upper-3x2x6;
  - lean-yang-bounds, lean-yang-n3-zusammensetzung, mm325-lizenz, pruefer-python-s1-07, pruefer-rust;
  - repo-schreibrechte, verfahren-datenformat, yang-n3-prosa, yang-n3-teil1-lean, yang-n3-teil2-lean, yang-n3-teil3-lean.
- S2-54 hat das Gedächtnis entgegen CLAUDE.md Punkt 12 und dem Auftrag eines Blind-Suchers verändert.

**Wiederherstellung des Gedächtnisses (Schreibhand)**

- Ob die Löschung den gemeinsamen Speicher erreicht hat oder nur die Kopie von S2-54, kann ich von hier nicht sehen.
- Meine Arbeitskopie hat alle 21 Einzeleinträge und den Index im neutralen Stand der Durchsicht vor Runde 11. Ich habe alle 21 Einträge neu geschrieben, damit sie erneut in den gemeinsamen Speicher gehen. Der Inhalt ist unverändert, nur eine Leerzeile wurde angehängt.
- Den Index hat S2-54 nicht verändert.
- Sicherung meines Stands vor dem Neuschreiben: Arbeitsverzeichnis der Schreibhand. Die archivierten Fassungen liegen in `archiv/gedaechtnis/stufe01/`.

**Status und Zähler**

- Unverändert gegenüber dem Zwischenstand: B-016 geprüft, B-014 in Teilen geprüft, Zähler Spur A 0 von 3.
- Fertig-Kriterium Stufe 2 nach Sicht des Orchestrators erfüllt.
- Der Orchestrator vergibt nichts Neues und wartet auf Justus. Offene Punkte für Justus:
  - Bestätigung des Fertig-Kriteriums und Freigabe, es als Ergebnis zu bezeichnen;
  - Frist B-014 (Lesart: gehalten für F2);
  - die kurzen Dauern der Prüfer in Runde 11.

### 25.11.2026, Entscheidung von Justus nach Runde 11 (Wortlaut, 22:37 Uhr MEZ)

> Stufe 2: Das Fertig-Kriterium erkenne ich an. B-016 bleibt geprüft. Deine Lesart zu B-014 bestätige ich: Die Frist gilt als gehalten, weil der Teil, der die Schranke ändert, geprüft ist. Die abweichenden Prosa-Teile bleiben behauptet.
>
> Noch keine Freigabe als Ergebnis. Vorher will ich einen zweiten, unabhängigen Maschinenlauf, weil Prüfer und GPT sich auf denselben Actions-Lauf gestützt haben. Das ist Runde 12, ohne Sol-Anfrage. Vergib dafür an Threads, die am Beweis nicht mitgeschrieben haben:
>
> 1. Neubau: frischer Checkout des aktuellen Commits, Bau ohne übernommene Build-Artefakte des Projekts. Der offizielle mathlib-Cache ist erlaubt.
> 2. Kernel-Nachprüfung: lean4checker (oder das passende Gegenstück zur verwendeten Lean-Version) über alle Module des Projekts. Falls es für die Toolchain nicht verfügbar ist, halte das fest und brich nicht ab.
> 3. Aussage in frischer Datei: eine neue Datei, die nur Basic und den Endsatz importiert, ohne eigene Notation, mit example (K : Type) [Field K] : 26 ≤ YangBounds.tensorRank K 4 2 4 := … und #print axioms. Das soll ausschließen, dass Notation in der Beweisdatei die Aussage verschiebt.
> 4. Zweite Umgebung: Versuche zusätzlich einen lokalen Bau in einer frischen Sitzung. Wenn die Umgebung das verweigert, halte es fest.
> 5. Literaturwache jetzt: gezielt nach 4×2×4 und <2,4,4> mit Rang 26 suchen, Eintrag in lit/WACHE.md.
>
> An den Quelltexten unter lean/YangBounds/ ändert niemand etwas. Ergebnis mit Commit, Toolchain, mathlib-Stand und Lauf-Nummern in pruefvermerke/B-016-zweitlauf.md.
>
> Bereite außerdem Entwürfe vor, ohne sie einzustellen: die geänderte README-Tabelle und eine kurze englische Ergebnis-Notiz mit Quellenangaben (Yang, Tsyganov u. a., Hopcroft-Kerr) und dem KI-Hinweis. Beides unter entwurf/. Die README selbst bleibt unverändert, bis ich freigebe.
>
> Der Blind-Sucher von Runde 11 läuft zu Ende. Stufe 3 beginnt nicht. Halte nach Runde 12 an und berichte.

**Einordnung (Schreibhand)**

- Fertig-Kriterium Stufe 2: von Justus anerkannt.
- B-016 bleibt geprüft.
- Frist B-014: gilt als gehalten. Die abweichenden Prosa-Teile bleiben behauptet.
- **Noch keine Freigabe als Ergebnis.**
- Runde 12 ist der Zweitlauf, ohne Sol-Anfrage. Danach hält der Orchestrator an und berichtet. Stufe 3 beginnt nicht.

**Geplante Vergabe für Runde 12 (Angabe des Orchestrators)**

- S2-55: Neubau und Kernel-Nachprüfung.
- S2-56: Aussage in frischer Datei.
- S2-57: zweite Umgebung.
- S2-58: Literaturwache.
- S2-59: Entwürfe unter `entwurf/`.
- S2-60: Blind-Sucher.
- `pruefvermerke/B-016-zweitlauf.md` schreibt die Schreibhand am Ende aus den Meldungen von S2-55 bis S2-57.

**Gedächtnis (Durchsicht vor Runde 12, Schreibhand)**

- Index unverändert seit 20:27 Uhr MEZ.
- Gekürzt, weil sie Urteile oder Zwischenstände enthielten. Vorheriger Stand jeweils in `archiv/gedaechtnis/stufe01/…-stand-r12.md`:
  - `pruefer-rust`: Satz „HK-Dateien … erneut ANGENOMMEN. Status behauptet.“ entfernt (Prüfergebnis und Statuswort).
  - `pruefer-python-s1-07`: Zwischenstand „Offen ist ein Abgleich-Auftrag … erst dann ist Protokoll 5.2 wieder erfüllt“ ersetzt durch einen neutralen Hinweis.
- Übrige Einträge: technische Hinweise zu Werkzeugen, Format und Bau. Keine Urteile zu Behauptungen und keine Zwischenstände von Stufe 2.
- Verbliebene Nebenbefunde zu Werkzeugen, nicht zu Behauptungen:
  - `lean-satz2-eingesetzt`: Axioms.lean;
  - `mm325-lizenz`: SHA-256 in verification.txt;
  - `pruefer-abgleich-s1-20`: offener Formatvorschlag.

### 25.11.2026, Stufe 2, Runde 12, Zwischenstand (Schreibhand im Auftrag des Orchestrators)

**Vergabe und Verbrauch (Angaben des Orchestrators)**

- Beginn 21:38 UTC (S2-58, S2-59) und 21:39 UTC (übrige).
- 6 Subagenten (S2-55 bis S2-60), 0 Fremdmodell-Anfragen.
- Keiner der Threads hat am Beweis mitgeschrieben. Alle waren frische Sitzungen.
- Der Blind-Sucher S2-60 läuft noch.

**Lieferungen (nachgesehen über die GitHub-Schnittstelle)**

- S2-55, Neubau und Kernel-Nachprüfung: PR #88 (Merge 9348a8b, 23:00:20 Uhr MEZ), `.github/workflows/zweitlauf.yml`.
  - Lauf 45706606136, Job 139530090202, 21:41 bis 21:59 UTC, grün.
  - Gebaut wurde 667df45. Ohne Projekt-Artefakte, lean4checker 27 von 27, `--fresh` Exit 0.
- S2-56, Aussage in frischer Datei: PR #86 (Merge ad10846, 22:52:34 Uhr MEZ), `lean/Zweitlauf/B016Aussage.lean` und `.github/workflows/zweitlauf-b016.yml`.
  - Lauf auf dem Zweig: 45706541557, Job 139529863773.
  - Lauf auf `main` nach dem Merge, von der Schreibhand nachgetragen: 45708303302, Job 139535849738, grün. Aussage und Axiome wie behauptet.
- S2-57, zweite Umgebung: kein PR. Lokaler Bau aus den Quellen auf 64554f9, erfolgreich. **Nur Angabe des Threads, nicht aus Git belegbar.**
- S2-58, Literaturwache: PR #87 (d4b1303, 22:41:00 Uhr MEZ), `lit/WACHE.md`.
  - Nicht gefunden.
  - Veröffentlichter Stand: untere Schranke 25 (Yang, arXiv:2609.14393 v3), obere Schranke 26 (Hopcroft-Kerr).
  - Die einzigen Treffer mit 26 sind Eigentreffer des öffentlichen Repos, darunter PR #65.
- S2-59, Entwürfe: PR #89 (Squash 667df45, 22:41:16 Uhr MEZ), `entwurf/README-tabelle.md` und `entwurf/ergebnis-notiz-444.md`.
  - `README.md` ist unverändert, letzte Änderung cbc6d61.
  - Offen für Justus: Modellversionen im KI-Hinweis, Erwähnung der Reparatur von Yangs Lemma 13.
- Unter `lean/YangBounds/` ist nichts geändert, nachgesehen von 7597484 bis 9348a8b.
- Ergebnis in `pruefvermerke/B-016-zweitlauf.md`.

**Dauer je Aufgabe nach Git (vom Beginn bis zur letzten Lieferung)**

| Aufgabe | Beginn (UTC) | letzte Lieferung (UTC) | Dauer |
|---|---|---|---|
| S2-58 | 21:38 | d4b1303, 21:41:00 | etwa 3 Minuten |
| S2-59 | 21:38 | 667df45, 21:41:16 | etwa 3 Minuten |
| S2-56 | 21:39 | Commit 4049d79 21:40:30, Merge 21:52:34 | etwa 1½ Minuten bis zum Commit, etwa 13½ Minuten bis zum Merge |
| S2-55 | 21:39 | Commit d20aa11 21:40:58, Lauf bis 21:59:41, Merge 22:00:20 | etwa 2 Minuten bis zum Workflow, etwa 21 Minuten bis zum Merge |
| S2-57 | 21:39 | kein Commit | laut Thread Bau 21:51:07 bis 22:14:16 UTC |

**Hinweise der Schreibhand**

- `lit/WACHE.md` nennt im Kopf des Eintrags von S2-58 „21:38 bis 21:55 UTC“. Der Commit d4b1303 und der Merge liegen aber schon um 21:41 UTC. Die Zeitangabe im Eintrag passt nicht zu Git.
- Den Workflow `zweitlauf.yml` gab es nach dem Merge von PR #88 nicht als Lauf auf `main`. Er startet nur bei Pull Requests und von Hand. Der Beleg ist der Lauf auf dem Zweig, der `main` bei 667df45 ausgecheckt hat.

**Status:** unverändert. B-016 geprüft, keine Freigabe als Ergebnis.

### 25.11.2026, Stufe 2, Runde 12 abgeschlossen (Schreibhand im Auftrag des Orchestrators)

**Abschluss**

- Runde 12 endet mit dem Merge von PR #90 (8594f30, 23:18:47 Uhr MEZ).
- Verbrauch: **7 Subagenten** (S2-55 bis S2-60 und ein Subagent, den S2-60 selbst gestartet hat), 0 Fremdmodell-Anfragen.
- Dauer nach Git: vom Beginn um 21:38 UTC bis 8594f30 um 22:18:47 UTC, **etwa 41 Minuten**.
- Runden verbraucht: 12 von 24.

**S2-60, Blind-Sucher**

- PR #90, Merge 8594f30, `versuche/s2-blind-r12.md`.
- Flip-Graph-Wanderung über GF(2), eigener Code, bester Rang 26.
- Ein Vorrat von 186 verschiedenen, geprüften Verfahren mit 26 Termen, darunter 21 verschiedene Rangprofile.
- Kein Verfahren mit 25, kein Beweis. 0 Fremdmodell-Anfragen.
- Dauer nach Git: etwa 40 Minuten, von 21:39 UTC bis 22:18:47 UTC.

**Regelverstöße in Runde 12 (offen eingetragen)**

1. **Rechenblock über 30 Minuten (Protokoll Abschnitt 6).** Der Hauptlauf von S2-60 lief etwa 32 Minuten auf 4 Kernen, von 21:44 bis 22:16 UTC, und wurde von Hand abgebrochen. Die Zeitprüfung saß nur in der äußeren Schleife. Nach Angabe von S2-60 ist der Fehler im Programm behoben. Die Zahl der Züge ist nur geschätzt, weil gepufferte Ausgabe verloren ging.
2. **Mehr Subagenten als erlaubt (höchstens 6 pro Runde).** S2-60 hat selbst einen Subagenten (Webseiten-Leser) für zwei arXiv-Arbeiten gestartet. Die Runde hatte damit 7 Subagenten.

**Zähler (Lesart des Orchestrators, von der Schreibhand gegengelesen)**

- Nach Runde 11: 0 von 3.
- Runde 12 war ein von Justus angeordneter Zweitlauf ohne neues Artefakt zur Schranke. Nach strenger Lesart zählt sie als Runde ohne Fortschritt: **1 von 3**.
- Gegenlesen: Nach Abbruchregel 2 a) gibt es kein neues geprüftes Artefakt, das eine Schranke ändert, und nach b) keine neue bestätigte Behauptung. 1 von 3 ist folgerichtig. Gleiche Lesart.

**Status:** unverändert. B-016 geprüft, B-014 in Teilen geprüft, keine Freigabe als Ergebnis.

**Halt nach Runde 12**

- Der Orchestrator hält an, wie Justus angeordnet hat, und berichtet an Justus. Es wird nichts Neues vergeben. Stufe 3 beginnt nicht.

**Punkte für Justus**

1. Freigabe als Ergebnis nach dem Zweitlauf (`pruefvermerke/B-016-zweitlauf.md`).
2. Entwürfe unter `entwurf/`: Modellversionen im KI-Hinweis, Erwähnung der Reparatur von Yangs Lemma 13.
3. Die zwei Regelverstöße von S2-60: Rechenblock 32 statt 30 Minuten und ein eigener Subagent, also 7 statt 6.
4. Die Zeitangabe von S2-58 in `lit/WACHE.md` („21:38 bis 21:55 UTC“) widerspricht Git (Commit und Merge um 21:41 UTC).
5. Die kurzen Dauern:
   - Runde 11: Prüfer etwa 3 bis 8 Minuten.
   - Runde 12: S2-58 und S2-59 je etwa 3 Minuten. S2-56 committete nach etwa 1½ Minuten, S2-55 legte seinen Workflow nach etwa 2 Minuten an.

### 25.11.2026, Entscheidung von Justus nach Runde 12 (Wortlaut, 23:42 Uhr MEZ)

> Freigabe unter einer Bedingung: Wiederhole zuerst die Literaturwache, mit Zeiten aus Git und wörtlichem Suchprotokoll. Findet sie nichts, ist B-016 als Ergebnis freigegeben, mit diesen Auflagen:
>
> 1. README nach Entwurf Teil 1 und 2 ändern. Die Notiz zieht ohne Entwurfskopf nach ergebnisse/rang-444.md, der Link wird angepasst.
> 2. In Notiz und README: „new here" wird zu „to our knowledge new (literature check of 25/26 November 2026)". Daten des Zweitlaufs eintragen. „Human review: none" bleibt.
> 3. Lemma 13 bleibt erwähnt, aber neutral: Die Modelle konnten einen Schritt des geschriebenen Beweises nicht nachvollziehen, die Formalisierung nutzt ein anderes Argument für dieselbe Aussage.
> 4. KI-Hinweis: Trag ein, welche Modellbezeichnung du und die Threads selbst melden. Mich nennst du „the repository owner".
> 5. Kein Zenodo-Release, kein arXiv, kein Kontakt nach außen. Das entscheide ich getrennt.
> 6. Die zwei Regelverstöße des Blind-Suchers kommen ins Logbuch, ohne weitere Folge.
> 7. Notiere als offenen Punkt für später: die Kette des Endsatzes vom Paket mm325_proof entkoppeln. Nicht jetzt beginnen.
>
> Danach halte an. Stufe 3 beginnt nicht.

**Einordnung (Schreibhand im Auftrag des Orchestrators)**

- Die Freigabe als Ergebnis ist **bedingt und noch nicht eingetreten**. Erst muss die wiederholte Literaturwache nichts finden.
- Diese Arbeiten sind ein **von Justus angeordneter Abschluss nach Runde 12, keine eigene Runde**. Sie zählen nicht als Runde nach Abschnitt 6.
- Die wiederholte Literaturwache läuft seit 22:43 UTC in einem neuen Thread: 1 Subagent, 0 Fremdmodell-Anfragen.
- Erst nach der Meldung „nichts gefunden“ ändert ein weiterer Thread README und Notiz nach den Auflagen 1 bis 4.
- Auflage 5: kein Zenodo-Release, kein arXiv, kein Kontakt nach außen.

**Auflage 6, erledigt:** Die zwei Regelverstöße von S2-60 stehen im Abschluss von Runde 12: Rechenblock etwa 32 statt höchstens 30 Minuten, ein eigener Subagent und damit 7 statt 6 Subagenten. Nach Entscheidung von Justus haben sie **keine weitere Folge**.

**Auflage 7, offener Punkt für später:** Die Kette des Endsatzes vom Paket `mm325_proof` (mm325_lower_bound, fallnlove/mm325_proof@759cf4a) entkoppeln. **Nicht jetzt beginnen.**

**Halt:** Nach dem bedingten Abschluss hält der Orchestrator an. Stufe 3 beginnt nicht.

---

## 25.11.2026 · Regeländerung durch Justus (Protokoll Version 0.5, zählt nicht zum Budget)

Eingetragen im Auftrag von Justus aus einem Chat außerhalb des Projekts, 23:49 Uhr (MEZ).

**Anlass**

Justus will vor einem Schritt nach außen wissen, ob sich die Methode aus Stufe 2 auf weitere Formate überträgt. Dafür reicht eine Erkundung. Ein voller Angriff auf 3×2×7 wäre zu groß. Dazu kommen zwei Klarstellungen aus Runde 9 und Runde 12.

**Geändert in PROTOKOLL.md**

- Abschnitt 2: Zeile 4×2×4 auf den Stand B-016 und B-010 gebracht
- Abschnitt 3: Stufe 3 ist jetzt eine Erkundung zu 4×2×5 (Länge 31) und 3×2×7 (Länge 34). Sie beweist nichts. Jede Restfall-Rechnung machen zwei Subagenten unabhängig. Für 4×2×5 kommt die Suche nach einem Verfahren mit 31 dazu. Fertig ist die Stufe mit je einer Einschätzung unter `erkundung/`
- Abschnitt 3 und 11.4: Stufe 3 beginnt, sobald die Auflagen aus der Freigabe zu Stufe 2 erledigt sind. Danach hält der Orchestrator an. Kein voller Beweisangriff in Stufe 3
- Abschnitt 4: Positivlisten nennen genaue Dateipfade. Aufträge an Prüfer nennen keine Fristen, Zählerstände oder erwünschten Ergebnisse
- Abschnitt 5.4: Ungültig ist eine Prüfung bei gesehenem Urteil zur selben Behauptung oder bei bekanntem Wunschergebnis. Bloße Spuren früherer Prüfungen werden offengelegt und hingenommen. Eine ungültige Prüfung wird einmal wiederholt; danach zählt ein unbeeinflusstes Urteil des Fremdmodells allein, mit Vermerk
- Abschnitt 6: Budget Stufe 3 sind 2 Runden mit je bis zu 6 Subagenten, ohne Fremdmodell-Anfrage. Subagenten vergeben keine eigenen Subagenten
- Abschnitt 8: Dauern stammen aus Git-Zeitstempeln

**Geändert in CLAUDE.md**

Neue Regeln 14 (keine eigenen Subagenten) und 15 (Rechenblöcke höchstens 30 Minuten). Hinweise für den Orchestrator an Stufe 3 und an die Positivliste angepasst.

**Damit überholt**

Der Satz „Stufe 3 beginnt nicht" aus der Entscheidung von 23:42 Uhr galt für den Abschluss von Stufe 2. Für die Erkundung gilt jetzt Abschnitt 3 in der Fassung 0.5. Die übrigen Auflagen der Freigabe bleiben unverändert, insbesondere Auflage 5: kein Kontakt nach außen.

### 25.11.2026, Abschluss nach Runde 12: wiederholte Literaturwache (Schreibhand im Auftrag des Orchestrators)

Von Justus angeordneter Abschluss nach Runde 12, keine eigene Runde.

**Lieferung (nachgesehen)**

- PR #91, Merge 5455b47 (23:53:45 Uhr MEZ), ohne Squash, 8 Commits.
- Dateien: `lit/WACHE-WIEDERHOLUNG-2026-11-25.md` (wörtliches Suchprotokoll) und ein Eintrag in `lit/WACHE.md`.
- Zeiten aus Git: Start-Commit 14638c1 um 22:43:31 UTC, End-Commit e058d00 um 22:53:24 UTC, **etwa 10 Minuten**. Zwischen-Commits um 22:44, 22:45, 22:45, 22:50, 22:52 und 22:52 UTC.
- Umfang laut Protokoll:
  - 31 Suchanfragen: 21 Websuchen, 4 alphaXiv-Suchen, 6 GitHub-Codesuchen.
  - 25 geöffnete Quellen.
  - 1 Hilfsagent zum Abruf von vier Webseiten, 0 Fremdmodell-Anfragen.
  - Gemeldetes Modell: claude-opus-5-5.

**Ergebnis laut Protokoll**

- Kein Beweis für R(⟨4,2,4⟩) ≥ 26 und kein Verfahren mit 25 gefunden.
- **Befund G1:** Im öffentlichen Repo solven-eu/matmulcatalog steht in `docs/LOWER_BOUNDS.md`, Zeile 90, seit 16.06.2026 (Commit 0a9f83a0, HEAD 5ed2ee97) „R(<2,4,4>) ≥ 26 (Hopcroft-Kerr), UB 26 → tight“.
  - Ohne Beweis.
  - Die Zuschreibung an HK71 widerspricht Lacelles eigenem Artikel (arXiv:2606.13408 v3, Abschnitt 7.5).
  - Im selben Repo widersprochen: `paper/theory/RANK_KNOWLEDGE.md` sagt „open lower bound“.
  - Die Behauptung steht nicht in `docs/lower-bounds.json`.
- Nicht prüfbar waren: arXiv direkt, Google Scholar, Semantic Scholar, MathOverflow, FMM-Lille direkt.

**Bedingung der Freigabe (Lesart des Orchestrators)**

- Justus' Bedingung lautet „Findet sie nichts“. Ob Befund G1 als Fund zählt, ist eine Auslegung. Der Orchestrator trifft sie nicht.
- **Die Freigabe als Ergebnis ist nicht eingetreten.** Der Orchestrator legt die Frage Justus vor.
- Status unverändert: B-016 geprüft.
- README und Notiz werden nicht geändert.

**Hinweis der Schreibhand: Regeländerung während der Literaturwache**

- Auf `main` liegt Commit 61bd8d4 von 22:50:47 UTC (23:50:47 Uhr MEZ), direkt eingestellt, ohne PR.
- Er ändert `PROTOKOLL.md` (Version 0.5), `CLAUDE.md` (neue Regeln 14 und 15) und `LOG.md`.
- Laut Commit-Text und LOG-Eintrag geschah das „auf Anweisung von Justus aus einem Chat außerhalb des Projekts“.
- Autor ist eine Claude-Sitzung (session_0119JzQbRj48QjVCQPGBxPus), Co-Autor „Claude Fable 5.2“.
- Inhalt:
  - Stufe 3 wird eine Erkundung von 4×2×5 und 3×2×7.
  - Sie beginnt, sobald die Auflagen der Freigabe zu Stufe 2 erledigt sind.
  - Budget: 2 Runden.
  - Neue Regel: keine eigenen Subagenten.
  - Damit wäre der Satz „Stufe 3 beginnt nicht“ aus der Entscheidung von 23:42 Uhr MEZ überholt.
- Die Schreibhand kann die Anweisung von Justus nicht nachprüfen. Die Änderung ist hier nur festgehalten, nicht bewertet.
- Die neue Regel 14 trat während der Literaturwache in Kraft. Deren Hilfsagent war vorher vom Orchestrator vorgesehen.

### 26.11.2026, Entscheidung von Justus zur Freigabe (Wortlaut, 25.11.2026, 00:08 Uhr MEZ)

> 1. Protokoll 0.5 (Commit 61bd8d4) stammt von mir, ich habe es in einem anderen Chat eintragen lassen. Lies Abschnitt 3, 4, 5.4 und 6 und CLAUDE.md neu. Der Hilfsagent der Literaturwache bleibt ohne Folge.
> 2. Befund G1 zählt nicht als Fund im Sinn meiner Bedingung. Es ist eine Katalogzeile ohne Beweis, mit falscher Zuschreibung und im selben Repo widersprochen. Die Freigabe von B-016 als Ergebnis tritt damit ein, mit den Auflagen 1 bis 7 und einer achten.
> 3. Auflage 8: Die Notiz bekommt einen Abschnitt „Related claims". Nenne G1 mit Datei, Zeile, Commit und Datum. Schreibe sachlich, dass dort kein Beweis steht, dass dasselbe Repo die Schranke an anderer Stelle als offen führt und dass Lacelles Artikel (arXiv:2606.13408, Abschnitt 7.5) Hopcroft und Kerr untere Schranken nur für <2,2,n> und <2,3,3> zuschreibt. Aus „to our knowledge new" wird „to our knowledge the first proof".
> 4. Eine unabhängige Recherche mit Gemini Deep Research vom 25.11.2026 fand ebenfalls keinen Beweis für 26. Vermerke das in lit/WACHE.md als Angabe von mir. Der Bericht liegt nicht im Repo. Nicht abgedeckt waren dort ECCC, Zenodo, Zulip und MathOverflow.
> 5. Danach beginnt Stufe 3 nach Protokoll 0.5. Auflage 5 bleibt: kein Kontakt nach außen.

(Die Nachricht kam am 26.11.2026 um 00:08 Uhr MEZ, 23:08 UTC. Die Datumsangabe in der Überschrift ist zu lesen als: Nacht vom 25. auf den 26.11.2026.)

**Einordnung (Schreibhand im Auftrag des Orchestrators)**

- **Protokoll 0.5** (Commit 61bd8d4) stammt von Justus. Der Vorbehalt der Schreibhand im vorigen Eintrag ist damit erledigt. Der Orchestrator hat die Abschnitte 3, 4, 5.4 und 6 sowie CLAUDE.md in Fassung 0.5 gelesen.
- Der Hilfsagent der wiederholten Literaturwache bleibt **ohne Folge**.
- **Befund G1 zählt nicht als Fund** im Sinn der Bedingung.
- **Die Freigabe von B-016 als Ergebnis ist eingetreten**, mit den Auflagen 1 bis 7 und der neuen Auflage 8 („Related claims“; „to our knowledge the first proof“).
- **Stufe 2 ist abgeschlossen**, mit 12 von 24 Runden.

**Umsetzung (Abschluss nach Runde 12, keine eigene Runde)**

- Ein neuer Thread „Ergebnis zu 4×2×4 in README eintragen“ setzt die Auflagen 1 bis 4 und 8 und den Vermerk zu Gemini Deep Research in `lit/WACHE.md` um.
- Gestartet um 23:10 UTC, 1 Subagent, 0 Fremdmodell-Anfragen. Der Merge wird nachgetragen.
- Auflagen 5 bis 7 sind schon erledigt oder vermerkt. Auflage 5 gilt weiter: kein Kontakt nach außen.

**Danach:** Stufe 3 nach Protokoll 0.5.

- Erkundung von 4×2×5 und 3×2×7, ohne Beweisangriff.
- 2 Runden mit je bis zu 6 Subagenten, keine Fremdmodell-Anfrage.
- Die Threads vergeben keine eigenen Subagenten.

**Gedächtnis (Durchsicht vor Stufe 3, Schreibhand)**

- Index und 21 Einzeleinträge sind unverändert seit der Durchsicht vor Runde 12. Der Abgleich lief um 23:09:17 UTC, es gibt keinen neuen Eintrag.
- Keine Urteile, Befunde oder Zwischenstände zu Behauptungen.
- Für Stufe 3 sind die Einträge zu 3×2×5, 3×2×6 und Yang n = 3 (`hk-verfahren-a10`, `lean-upper-3x2x6`, `yang-n3-*`) sachliche Datei- und Bauhinweise ohne Urteil.
- Veraltet im Index, aber ohne Urteil:
  - Die Zeile zu Protokoll Abschnitt 6 nennt nur Stufe 2.
  - Die Literaturwache steht dort noch mit 11:47 UTC.

### 26.11.2026, Auflagen der Freigabe erledigt, Beginn Stufe 3 (Schreibhand im Auftrag des Orchestrators)

**README-Thread (Abschluss nach Runde 12, keine eigene Runde)**

- PR #92, Commit 78c13f2 (00:11:23 Uhr MEZ), Merge efc2eee (00:11:40 Uhr MEZ). Kein Release, kein Tag.
- Geändert:
  - `ergebnisse/rang-444.md` (neu);
  - `README.md`;
  - `lit/WACHE.md` (Vermerk zu Gemini Deep Research als Angabe von Justus);
  - Köpfe der beiden Dateien in `entwurf/`.
- Unter `lean/` ist nichts geändert (`git diff 86debe9 efc2eee -- lean` leer).
- Verbrauch: 1 Subagent, 0 Fremdmodell-Anfragen.
- Dauer nach Git: Start um 23:10 UTC laut Orchestrator, Commit um 23:11:23 UTC, Merge um 23:11:40 UTC, also **etwa 1½ Minuten**.
- Stichprobe der Schreibhand in README und Notiz:
  - „to our knowledge the first proof“ und ein Abschnitt „Related claims“ sind vorhanden.
  - „Human review: none“ bzw. „Human review | none“ ist vorhanden.
  - „the repository owner“ steht in der Notiz.
  - Lauf 45706606136 des Zweitlaufs ist genannt.
  - „new here“ kommt nicht mehr vor.
  - Den Inhalt im Einzelnen hat die Schreibhand nicht geprüft.
- Ohne eigene Auflage wurde in der README der Plan-Punkt zu Stufe 3 an Protokoll 0.5 angepasst. Der Orchestrator hat das Justus gemeldet.
- **Damit sind die Auflagen 1 bis 8 der Freigabe erledigt.**

**Stufe 3 begonnen (Protokoll 0.5, Abschnitt 3)**

- Erkundung von 4×2×5 (Länge 31) und 3×2×7 (Länge 34), kein Beweisangriff.
- Budget 2 Runden mit je bis zu 6 Subagenten, keine Fremdmodell-Anfrage. Die Threads vergeben keine eigenen Subagenten.
- Runde 1 von 2 vergeben um etwa 23:15 UTC, 6 Subagenten. Alle liefern nach `erkundung/`.
  - S3-01 und S3-02: Restfall-Rechnung 4×2×5 bei Länge 31, unabhängig voneinander.
  - S3-03 und S3-04: Restfall-Rechnung 3×2×7 bei Länge 34, unabhängig voneinander.
  - S3-05: Übertragbarkeit der Lean-Kette und Abzählargument für beide Formate.
  - S3-06: Blind-Sucher, mit Suche nach einem Verfahren mit 31 für 4×2×5.

### 26.11.2026, Stufe 3, Runde 1 von 2 abgeschlossen (Schreibhand im Auftrag des Orchestrators)

**Abschluss**

- Vergabe um etwa 23:15 UTC (Angabe des Orchestrators). Ende mit dem Merge von PR #98 (a0f4ae5) um 00:02:32 UTC.
- Dauer nach Git: **etwa 47 Minuten**.
- Verbrauch: 6 Subagenten (S3-01 bis S3-06), 0 Fremdmodell-Anfragen.
- Eigene Subagenten der Threads: keine gemeldet. S3-05 und S3-06 schreiben das ausdrücklich.
- Unter `lean/` ist nichts geändert (nachgesehen, aa9f011 bis a0f4ae5).

**Lieferungen (auf main nachgesehen; Inhalt laut Threads, alles Status behauptet)**

| Auftrag | PR, Merge | Dateien | Bericht-Commit (UTC) | Dauer nach Git |
|---|---|---|---|---|
| S3-01, Restfälle 4×2×5, Länge 31 | #93, 96407db | `erkundung/s3-01-restfaelle-425.md`, `erkundung/s3-01-restfaelle.py` | bf3e092, 23:16:27 | etwa 1½ Minuten |
| S3-02, Restfälle 4×2×5, Länge 31 | #94, a94018c | `erkundung/s3-02-restfaelle-425.md`, `erkundung/s3-02-restfaelle.py` | e710ce4, 23:16:44 | etwa 2 Minuten |
| S3-04, Restfälle 3×2×7, Länge 34 | #95, 43d0410 | `erkundung/s3-04-restfaelle-327.md`, `erkundung/s3-04-restfaelle-327.py` | 37c4809, 23:18:09 | etwa 3 Minuten |
| S3-03, Restfälle 3×2×7, Länge 34 | #96, 9fa3ac8 | `erkundung/s3-03-restfaelle-327.md` | f6ff18a, 23:18:35 | etwa 3½ Minuten |
| S3-05, Übertragbarkeit der Lean-Kette | #97, 0486edb | `erkundung/s3-05-uebertragung.md` | 644eeb7, 23:23:20 | etwa 8 Minuten |
| S3-06, Blind-Sucher 4×2×5 | #98, a0f4ae5 | `erkundung/s3-06-blind-425.md` | 3c59dc1, 00:02:14 | etwa 47 Minuten |

- S3-01 und S3-02, unabhängig voneinander: je 7 Restfälle in der Rolle n = 4, m = 5. In der transponierten Lage ⟨5,2,4⟩ sind es 20 Fälle.
- S3-03 und S3-04, unabhängig voneinander: je genau ein Restfall (ρ, rk L, rk H) = (4, 6, 4) in der Rolle n = 3. In der transponierten Lage sind es 201 Fälle.
- S3-05: Der Unterbau ist allgemein formuliert. Ab Satz B ist alles fest auf 4×2×4 gebaut. Unter `lean/` hat S3-05 nichts geändert.
- S3-06: kein Verfahren mit 31 oder 32. Über GF(2) 13 Verfahren mit 33.
  - Rechenblöcke höchstens 10 Minuten, 0 eigene Subagenten (Angabe des Threads).
  - Eingeblendet waren der Gedächtnis-Index und die Einträge `hk-verfahren-a10`, `verfahren-randfaelle-s1-04`, `verfahren-datenformat` und `git-regeln`. Das ist in Abschnitt 0 des Berichts offengelegt.
- Hinweis der Schreibhand: Die Bericht-Commits von S3-01 bis S3-04 liegen 1½ bis 3½ Minuten nach der Vergabe.

**Status (Orchestrator):** alles behauptet. Nichts wird geprüft.

**Fertig-Kriterium Stufe 3:** noch nicht erfüllt. Die Einschätzung je Format mit Empfehlung fehlt.

**Runde 2 von 2 (letzte Runde, danach hält der Orchestrator an)**

- Keine Fremdmodell-Anfrage, keine eigenen Subagenten der Threads.
- S3-07: Einschätzung 4×2×5, Ziel `erkundung/s3-07-einschaetzung-425.md`. Vergeben um etwa 00:10 UTC.
- S3-08: Einschätzung 3×2×7, Ziel `erkundung/s3-08-einschaetzung-327.md`. Vergeben um etwa 00:10 UTC.
- S3-09: Blind-Sucher, Verfahren mit 31 für 4×2×5 über Körpern der Charakteristik ungleich 2, Ziel `erkundung/s3-09-blind-425.md`. Vergabe erst nach der Bestätigung der Schreibhand.

**Gedächtnis (Durchsicht vor S3-09, Schreibhand)**

- Index nach dem Abgleich um 00:04 UTC: vom Orchestrator um 23:13 UTC neu gefasst (Protokoll 0.5, Auflage 5, Wunsch zu Literaturwachen). Er enthält keine Urteile, Befunde oder Zwischenstände.
- 21 Einzeleinträge, unverändert seit der letzten Durchsicht. Keine Urteile, Befunde oder Zwischenstände.
- Kein Eintrag nennt Schranken oder Verfahren zu 4×2×5 oder 3×2×7. Der frühere Eintrag `schranken-befunde` mit der Schranke 32 für 4×2×5 ist seit der Durchsicht vor Runde 11 gelöscht.

### 26.11.2026, Stufe 3, Runde 2: S3-09 vergeben (Schreibhand im Auftrag des Orchestrators)

- S3-09 (Blind-Sucher, Verfahren mit 31 für 4×2×5 über Körpern der Charakteristik ungleich 2, Ziel `erkundung/s3-09-blind-425.md`) wurde um etwa 00:05 UTC vergeben, nach der Durchsicht des Gedächtnisses.
- Runde 2 hat damit 3 Subagenten (S3-07, S3-08, S3-09), 0 Fremdmodell-Anfragen.
- Hinweis der Schreibhand: Für S3-07 und S3-08 nannte der Orchestrator um 00:03 UTC als Vergabezeit „etwa 00:10 UTC“. Die Angabe liegt nach der Meldung selbst und muss beim Abschluss der Runde geklärt werden.

- Nachtrag (Orchestrator, 00:05 UTC): Die Angabe „etwa 00:10 UTC“ war ein Fehler des Orchestrators. S3-07 und S3-08 wurden um etwa 00:03 bis 00:04 UTC vergeben. Runde 2 wird ab 00:03 UTC gemessen, sonst nach den ersten Commits der Threads.

### 26.11.2026, Stufe 3, Runde 2: Einschätzungen geliefert, Fertig-Kriterium Stufe 3 (Schreibhand im Auftrag des Orchestrators)

**Lieferungen (auf main nachgesehen; Inhalt laut Threads, alles Status behauptet)**

| Auftrag | PR, Merge | Datei | Commits (UTC) | Dauer nach Git ab 00:03 UTC |
|---|---|---|---|---|
| S3-07, Einschätzung 4×2×5 | #99, 57010c8 (00:06:51) | `erkundung/s3-07-einschaetzung-425.md` | bfd43c5 00:04:13, f55ade5 00:06:33 | etwa 4 Minuten |
| S3-08, Einschätzung 3×2×7 | #100, 2e2d268 (00:07:17) | `erkundung/s3-08-einschaetzung-327.md` | 699cdf8 00:04:47, 45ff117 00:07:02 | etwa 4 Minuten |

- Beide Threads melden 0 eigene Subagenten und 0 Fremdmodell-Anfragen.
- S3-07 (4×2×5, Länge 31): **Empfehlung „Angriff lohnt nicht“** als Übertragung der Kette zu 4×2×4.
  - 7 Restfälle, in der transponierten Lage 20. Beide Rechnungen stimmen Fall für Fall überein.
  - Fünf Fälle liegen im halbsymmetrischen Zweig, ohne Gegenstück zu Satz B, Lemma S und Satz C.
  - Abzählargument: rechnerisch 16 gegen 13, greift nur im Fall (3, 6, 9).
  - Offen: S3-01 und S3-02 beurteilen Lemma V anders als S3-05.
- S3-08 (3×2×7, Länge 34): **Empfehlung „Angriff lohnt“**, eng gefasst auf den einen Restfall (4, 6, 4).
  - Die Kette ist nicht übertragbar.
  - Der Fall hängt an Lemma 15(b) bei d = 2 und an Lemma I. Beide sind ungeprüft.
  - Abzählargument: rechnerisch 17 gegen 13, kommt wegen dim N = 3 nicht zum Zug.
- Unter `lean/` ist nichts geändert.

**Fertig-Kriterium Stufe 3 (Lesart des Orchestrators, von der Schreibhand gegengelesen)**

- Je Format liegt unter `erkundung/` eine Einschätzung mit den Restfällen aus beiden Rechnungen, den übertragbaren und nicht übertragbaren Teilen und einer Empfehlung. Damit ist das Fertig-Kriterium nach Protokoll 0.5, Abschnitt 3 erfüllt.
- Gegenlesen: Beide Dateien enthalten alle drei verlangten Teile. Gleiche Lesart.
- **Der Orchestrator vergibt nichts mehr und hält an** (Protokoll 0.5, Abschnitt 3 und 11.4). Er berichtet an Justus.
- S3-09 (Blind-Sucher) läuft noch zu Ende. Der Abschluss von Runde 2 folgt mit seiner Meldung.
- Status: alles behauptet.

### 26.11.2026, Stufe 3, Runde 2 abgeschlossen, Stufe 3 abgeschlossen (Schreibhand im Auftrag des Orchestrators)

**S3-09, Blind-Sucher (auf main nachgesehen; Inhalt laut Thread, alles Status behauptet)**

- PR #101, Merge 5bcb484 (01:47:06 UTC), 5 Commits, nur `erkundung/s3-09-blind-425.md`.
- Commits (UTC): 2af58ae 00:05:32, 79df788 00:11:33, 8d00703 00:56:11, fb505ed 01:23:32, 945e05a 01:46:45.
- Dauer nach Git: von der Vergabe um etwa 00:05 UTC bis zum Merge um 01:47:06 UTC, **etwa 1 Stunde 42 Minuten**.
- Ergebnis laut Thread:
  - Kein Verfahren mit 31 oder 32.
  - Flip-Graph über GF(2) bis 33, über GF(3) bis 34.
  - Keines von 221 verschiedenen 33er-Verfahren über GF(2) lässt sich mit gleichem Träger und Vorzeichen ±1 nach ℤ heben (SAT). Andere Hebungen sind nicht ausgeschlossen.
  - Eine falsche Aussage zum Hebungsschritt modulo 4 aus einer Zwischenfassung ist im Bericht berichtigt.
- Verbrauch laut Thread: 0 Subagenten, 0 Fremdmodell-Anfragen.
- Rechenblöcke laut Thread: 4, je höchstens 25 Minuten (00:10–00:34, 00:35–00:55, 00:56–01:20, 01:22–01:46 UTC). Die Zwischen-Commits passen zu diesen Blöcken.
- **Zeitangabe:** Als Endzeit nennt der Thread 01:52 UTC. Der letzte Commit liegt um 01:46:45 UTC, der Merge um 01:47:06 UTC, und gemeldet hat er um 01:47 UTC. Maßgeblich sind die Git-Zeiten.
- **Offengelegte Spuren (Abschnitt 0 des Berichts):**
  - der Gedächtnis-Index und vier Einzeleinträge;
  - drei Commit-Betreffzeilen von `main`, darunter die zu S3-06, aus `git log --oneline | head -3` beim Anlegen des Zweigs;
  - Titel einer Websuche.
  - Hingenommen nach Protokoll 0.5, Abschnitt 5.4 (bloße Spuren).

**Runde 2 von 2**

- Verbrauch: 3 Subagenten (S3-07, S3-08, S3-09), 0 Fremdmodell-Anfragen.
- Dauer nach Git: von 00:03 UTC bis 5bcb484 um 01:47:06 UTC, **etwa 1 Stunde 44 Minuten**. Ohne den Blind-Sucher endete die Runde mit 2e2d268 um 00:07:17 UTC.

**Stufe 3 abgeschlossen**

- Budget verbraucht: 2 von 2 Runden, zusammen 9 Subagenten, 0 Fremdmodell-Anfragen.
- Runde 1 dauerte etwa 47 Minuten, Runde 2 etwa 1 Stunde 44 Minuten.
- Fertig-Kriterium erfüllt (Einschätzungen S3-07 und S3-08). Alles bleibt behauptet.
- Der Orchestrator hat angehalten, Justus berichtet und vergibt nichts mehr (Protokoll 0.5, Abschnitt 3 und 11.4). Eine weitere Stufe gibt es nur nach neuer Entscheidung von Justus.

---

## 26.11.2026 · Regeländerung durch Justus (Protokoll Version 0.6, zählt nicht zum Budget)

Eingetragen im Auftrag von Justus aus einem Chat außerhalb des Projekts, 07:24 Uhr (MEZ). Wie bei Version 0.5 kann der Orchestrator das von hier nicht nachprüfen. Maßgeblich ist die Startnachricht von Justus im Projekt.

**Entscheidung**

Justus beschließt eine Stufe 4: einen engen Angriff auf 3×2×7 bei Länge 34, wie von S3-08 empfohlen. Er ist während der Stufe nicht ständig erreichbar.

**Geändert in PROTOKOLL.md**

- Abschnitt 2: Zeile 3×2×7 nennt jetzt die Herkunft der unteren Schranke (B-002) und dass das Verfahren mit 35 hier noch nicht nachgerechnet ist
- Abschnitt 3: neue Stufe 4. Runde 1 ist nur Prüfung der Grundlage (Restfall-Rechnung, Lemma 15(b) bei d = 2, Übertragung von Lemma I), dazu die Nachrechnung des Verfahrens mit 35 und der Blind-Sucher. Ab Runde 2 zwei Spuren: Ausschluss des Restfalls und Suche nach einem Verfahren mit 34. Fertig mit einem Lean-Satz für 35 oder einem bestätigten Verfahren mit 34, sonst bei erschöpftem Budget oder Abbruch
- Abschnitt 3, Auslegungsfragen in Stufe 4: strengere Lesart nehmen, vermerken, weiterarbeiten. Nur wenn die strengere Lesart eine Spur oder die Stufe beenden würde, anhalten und fragen
- Abschnitt 6: Budget Stufe 4 sind 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5
- Abschnitt 11.4: Grenze ist jetzt Stufe 4 und das Format 3×2×7

**Geändert in CLAUDE.md**

Hinweis für den Orchestrator an Stufe 4 angepasst.

**Nicht Teil von Stufe 4**

Das lesbare Aufschreiben des Beweises zu 4×2×4, das Entkoppeln vom Paket mm325_proof und ein Zenodo-Release. Kein Kontakt nach außen.

---

## 26.11.2026 · Start von Stufe 4 durch Justus (Protokoll 0.6)

**Nachricht von Justus im Projektchat (Wortlaut, 26.11.2026, 06:43 UTC):**

> Protokoll 0.6 (Commit c721297) stammt von mir. Lies Abschnitt 3, 6 und 11.4 und CLAUDE.md neu und starte Stufe 4.

Damit ist Protokoll 0.6 von Justus bestätigt. Stufe 4: 3×2×7 bei Länge 34, Budget 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5. Runde 1 ist nur Prüfung der Grundlage.

**Lesart des Orchestrators (strengere Lesart, nach Protokoll Abschnitt 3 vermerkt):**

- (a) Die Literaturwache (Abschnitt 7) läuft vor Runde 1, außerhalb der Runde, und wird offen ausgewiesen: Thread „Literatur zu 3×2×7 sichten“, vergeben etwa 06:47 UTC, 1 Subagent, 0 Fremdmodell-Anfragen. Runde 1 wird erst nach ihrer Meldung vergeben.
- (b) Prüfer bekommen nur Behauptung und Artefakt. Für die drei Prüfgegenstände der Runde 1 gab es noch keine Behauptungsdateien. Sie werden nach 5.4 angelegt (nur Aussage, Herkunft, Artefakt), mit wörtlich übernommenen Aussagen.

**Gegengelesen (Schreibhand):** (a) und (b) widersprechen Abschnitt 3 und 6 nicht. Beide sind strenger als der Wortlaut. Die Wache zählt nach (a) nicht zum Rundenbudget, ihr Verbrauch steht hier.

**Behauptungsdateien angelegt (Auftrag des Orchestrators):**

- `behauptungen/B-017.md`: Restfall-Rechnung ⟨3,2,7⟩ bei Länge 34, Rolle n = 3, mit und ohne Lemma I. Aussage wörtlich aus S3-04 und S3-03, Abschnitt 1, Punkt 1.
- `behauptungen/B-018.md`: Lemma 15(b) bei d = 2. Aussage wörtlich aus `lean/prosa/yang_n4.md` und dem Lean-Satz `lemma15b`, dazu die Form B8 aus S3-04 und L15b aus S3-03.
- Übertragung von Lemma I auf die Normalform des yang_n4-Rahmens: **keine Datei angelegt.** Die Aussage steht in den Quellen nicht eindeutig. S3-03, Abschnitt 7, Punkt 2 sagt nur, die Objekte „sollten übereinstimmen“, und „Eine Lean-Brücke zwischen beiden Rahmen gibt es nicht“. S3-04 führt die Lemmata G, H, I unter „Übernommen (ohne eigene Prüfung)“ und formuliert keine Übertragung. Dem Orchestrator gemeldet.
- Keine Prüfvermerke angelegt. Den Status setzt der Orchestrator.

**Gedächtnis:** Index (Fassung 0.6, synchronisiert 06:45 UTC) und alle 21 Einzeleinträge durchgesehen. Nichts über Behauptungen, Prüfurteile, Befunde oder Zwischenstände. Nichts geändert.

**Nachtrag 26.11.2026, etwa 06:55 UTC:** Auf Anweisung des Orchestrators `behauptungen/B-019.md` angelegt (Übertragung von Lemma I auf die Normalform des Rahmens yang_n4 mit d = 2). Der Wortlaut der Aussage stammt vom Orchestrator. Dazu stehen C2 im Wortlaut des Programms S3-04, Lemma I im Wortlaut von `yang_n3.md` und die Lean-Fassung `lemma_I`. Geplante Runde 1 laut Orchestrator: S4-01 bis S4-03 Prüfer für B-017 bis B-019, S4-04 Verfahren mit 35 für 3×2×7 anlegen und nachrechnen, S4-05 Blind-Sucher. Die Berichte S3-03 und S3-04 kommen auf keine Positivliste.

---

## 26.11.2026 · Literaturwache vor Stufe 4, Runde 1 (außerhalb der Runde)

- Auftrag: Thread „Literatur zu 3×2×7 sichten“, Pflichtpunkte nach Abschnitt 7 und gezielt 3×2×7 (Schranke 35 oder Verfahren mit 34), Nebenfrage nach dem Verfahren mit 35.
- Ergebnis: `lit/WACHE-2026-11-26.md` und Eintrag in `lit/WACHE.md`, PR #102 (Merge 2335284). **Kein Beweis von 35 und kein Verfahren mit 34 gefunden. Abbruchregel 3 greift nicht.** Pflichtpunkte ohne Neues (mm325_proof unverändert bei 759cf4a, openai/math unverändert, keine neue Fassung von 2609.14393 oder 2609.22054 gefunden). Status: behauptet.
- Lücken laut Bericht: arxiv.org, export.arxiv.org und fmm.univ-lille.fr per curl gesperrt, GitHub-REST-API für fremde Repos 403. Versionslisten nur über Websuche und alphaXiv.
- Nebenergebnis (Abschnitt D): Verfahren mit 35 für ⟨2,3,7⟩ unter MIT bei dronperminov/FastMatrixMultiplication (Commit f70078cd, `schemes/results/ZT/2x3x7_m35_ZT.json`). solven-eu/matmulcatalog (Commit 5ed2ee97, nach Hopcroft-Kerr gebaut) ohne Lizenzangabe. FMM-Lille nicht gelesen. Übernahme nur nach Protokoll 11.3.
- Dauer nach Git: erster Commit 7aaa039 um 06:45:26 UTC, letzter Commit 0eb9e70 um 06:50:46 UTC, Merge um 06:51:14 UTC. Also etwa 6 Minuten.
- **Widerspruch:** Der Orchestrator nannte als Vergabe „etwa 06:47 UTC“. Der erste Commit der Wache liegt um 06:45:26 UTC, also vorher. Die Vergabe muss spätestens um 06:45 UTC gewesen sein.
- Verbrauch: 1 Subagent (der Thread selbst, keine eigenen Subagenten), 0 Fremdmodell-Anfragen. Gemeldetes Modell: claude-opus-5-5.

## 26.11.2026 · Stufe 4, Runde 1 von 6 vergeben (etwa 06:52 UTC)

Nur Prüfung der Grundlage (Protokoll 0.6, Abschnitt 3). 5 Subagenten, keine Fremdmodell-Anfrage, keine eigenen Subagenten der Threads.

| Nr. | Auftrag | Zieldatei |
|---|---|---|
| S4-01 | Prüfer B-017 (Restfall-Rechnung). Laut Auftrag jede Bedingung des Programms, auch C1 (rk H = ρ + s) im Block für n = 3. Deshalb keine eigene Behauptung für C1 | `lean/prosa/s4_327_bericht_s4-01.md` |
| S4-02 | Prüfer B-018 (Lemma 15(b) bei d = 2) | `lean/prosa/s4_327_bericht_s4-02.md` |
| S4-03 | Prüfer B-019 (Übertragung von Lemma I) | `lean/prosa/s4_327_bericht_s4-03.md` |
| S4-04 | Verfahren mit 35 für 3×2×7 als Datei anlegen, mit beiden Prüfprogrammen nachrechnen (5.2) | Datei unter `verfahren/`, Bericht `verfahren/3x2x7-r35-nachrechnung.md` |
| S4-05 | Blind-Sucher | `versuche/s4-blind-r1.md` |

- Positivlisten wie von der Schreibhand genannt. Die Berichte S3-03 und S3-04 stehen auf keiner Liste.
- Gedächtnis vor der Vergabe durchgesehen (siehe Eintrag „Start von Stufe 4“): nichts gefunden, was nicht hingehört.
- Prüfvermerke `pruefvermerke/B-017.md` bis `B-019.md` mit Status behauptet angelegt, im Auftrag des Orchestrators.

## 26.11.2026 · Stufe 4, Runde 1: Zwischenstand (4 von 5 Aufträgen geliefert, S4-05 läuft)

**Lieferungen (auf main nachgesehen)**

| Nr. | PR | Merge | Zieldatei | erster Commit | Merge-Zeit | Dauer ab Vergabe (etwa 06:52 UTC) |
|---|---|---|---|---|---|---|
| S4-03 | #103 | c2b1de9 | `lean/prosa/s4_327_bericht_s4-03.md` | 06:53:40 | 06:56:21 | etwa 4 Minuten |
| S4-04 | #104 | 0e3327f | `verfahren/3x2x7-r35-hk71.json`, `verfahren/3x2x7-r35-nachrechnung.md` | 06:53:32 | 06:56:42 | etwa 5 Minuten |
| S4-02 | #105 | ed289e7 | `lean/prosa/s4_327_bericht_s4-02.md` | 06:55:57 | 06:56:55 | etwa 5 Minuten |
| S4-01 | #106 | 9541f51 | `lean/prosa/s4_327_bericht_s4-01.md` | 06:55:26 | 06:57:23 | etwa 5 Minuten |

Alle UTC, aus Git. Alle vier melden 0 eigene Subagenten und 0 Fremdmodell-Anfragen.

**Urteile der Prüfer (aus den Berichten, gegengelesen)**

- S4-01 zu B-017: T1 bis T6 hält. T4: C1 (rk H = ρ + s) steht in keiner Quelle wörtlich, der Prüfer hat sie hergeleitet, die Liste hängt nach seiner Nachrechnung nicht davon ab. T5 mit Ergänzung: die normalisierte Länge kann sinken, für Längen bis 33 bleibt kein Fall. T7 (Abgleich mit S3-03 und S3-04) nicht entscheidbar, nicht auf der Positivliste. Eingeblendet: Index und zwei Einzeleinträge (`lean-upper-3x2x6`, `hk-verfahren-a10`).
- S4-02 zu B-018: Prosa hält, Lean-Satz hält, Bau hält. Axiom-Bericht für `lemma15b` einzeln fehlt: nicht entscheidbar. Zahlenform hält mit Reparatur ((N1), (N2), ρ als volles Maximum, Länge r′ ≤ r). Offengelegt: einmal `ls` im Wurzelverzeichnis, Namen `zweitlauf.yml` und `lean/Zweitlauf` in einer Diff-Ausgabe gesehen.
- S4-03 zu B-019: hält in allen vier Teilen. H stimmt mit der Identifikation c ↦ c_{1,2} sogar ohne Vorzeichen. `lemma_I` nicht einzeln im Axiom-Bericht. Der Prüfer konnte den sorry-Abschnitt des Logs wegen 403 nicht lesen. Die Schreibhand hat diesen Abschnitt im selben Job selbst gelesen: „SORRY: 0“ in beiden Zeilen.
- S4-04: Verfahren selbst nach Hopcroft-Kerr gebaut, über ℤ, Koeffizienten −2 bis 2. Beide Prüfprogramme ANGENOMMEN, Rückgabewert 0. Gegenprobe mit Vorzeichenfehler von beiden abgelehnt. Keine fremden Daten. SHA-256 der Datei auf main stimmt mit dem Bericht überein (8a2445a6…). Beide Läufe hat der Ersteller selbst gestartet.

**Statusentscheidungen des Orchestrators (strengere Lesart)**

1. B-017, B-018, B-019 bleiben **behauptet**, mit Vermerk „von einem Prüfer bestätigt“ samt den genannten Ergänzungen und Reparaturen. Geprüft nach 5.1 setzt er nicht, weil je nur ein Leser vorliegt, Prosa-Teile dabei sind und der Axiom-Bericht für `lemma15b` und `lemma_I` einzeln fehlt.
2. Verfahren mit 35 (obere Schranke 35 für 3×2×7): bleibt **behauptet**, bis ein Prüfer, der die Datei nicht gebaut hat, die beiden Läufe wiederholt. Vergabe in Runde 2.
3. Haltebedingung von Runde 1 (mehr als zwei Restfälle oder nicht behebbarer Fehler in einem der beiden Lemmata): nach den Berichten nicht erfüllt. Weiter mit Runde 2 nach Abschluss von S4-05.

**Gegengelesen (Schreibhand):** Die Urteile finden sich so in den Berichten. Zu Punkt 2: In Stufe 0 hat A-10 die Verfahren für 3×2×5 und 3×2×6 gebaut und beide Prüfprogramme selbst laufen lassen. Ein getrennter Prüfer hat die Läufe nicht wiederholt, der Status wurde trotzdem auf geprüft gesetzt (Eintrag Stufe 0, Runde 3). Bei B-010 (4×2×4 mit 26) hat dagegen ein getrennter Prüfer (S2-11) die Läufe wiederholt. Die strengere Lesart folgt dem Muster von B-010.

**Nachtrag 26.11.2026, etwa 07:00 UTC:** Auf Anweisung des Orchestrators `behauptungen/B-020.md` angelegt (R(⟨3,2,7⟩) ≤ 35 über ℤ, Artefakt `verfahren/3x2x7-r35-hk71.json` mit SHA-256, Herkunft S4-04, ohne Ausgaben der Läufe und ohne Urteil), dazu `pruefvermerke/B-020.md` mit Status behauptet. Die Zeile für die Schranke 35 in der Liste „ohne eigene Behauptungsdatei“ ist durch die Zeile B-020 in der Übersicht ersetzt. Der Orchestrator bleibt beim Muster von B-010 und vergibt die Wiederholung der Läufe in Runde 2.

## 26.11.2026 · Stufe 4, Runde 1 abgeschlossen

**S4-05 (Blind-Sucher):** `versuche/s4-blind-r1.md`, PR #107 (Merge 412ad8b um 07:40:05 UTC). Commits 20e9126 (06:53:15), 2a7e08b (07:06:59), bb81c05 (07:39:28). Nur diese eine Datei geändert.

- Inhalt laut Bericht, alles behauptet: Rang 34 oder 35, nicht entschieden. Eigenes Verfahren mit 35 über ℤ per Flip-Graph (aus ⟨3,2,3⟩ mit 15 und ⟨3,2,4⟩ mit 20, Koeffizienten −1, 0, 1), nicht als Datei unter `verfahren/` abgelegt. Untere Schranke 34 nur aus der Literatur. Ein Verfahren mit 34 müsste rk L = 6, rk H = 4, Δ = 2, dim N = 3, dim S = 1 erfüllen, ein Widerspruch wurde nicht gefunden (Lücke L3). Ein exaktes Beispiel, dass die Voraussetzungen von Lemma 2 und 3 aus Tsyganov u. a. bei r = 34 erfüllbar sind. Suche nach 34 über ℤ und über GF(2) ohne Fund.
- Offenlegung: Gedächtnis-Index und drei Einzeleinträge eingeblendet (`hk-verfahren-a10`, `lean-upper-3x2x6`, `git-regeln`). Öffentliche Literatur außerhalb des Repos gelesen (Abschnitt 3 des Berichts).
- Rechenblöcke laut Bericht: Block 1 über ℤ 20 Minuten (07:00 bis 07:20 UTC, 4 Kerne), Block 2 über GF(2) 18 Minuten (07:20 bis 07:38 UTC, 4 Kerne), dazu kürzere Läufe (4 Minuten auf 1 Kern, je 100 s auf 3 Kernen). Jeder Block für sich liegt unter 30 Minuten. Die beiden großen Blöcke liefen ohne Pause hintereinander, zusammen 38 Minuten. Aus Git ist nur der Rahmen ablesbar: Zwischen den Commits 07:06:59 und 07:39:28 liegen 32,5 Minuten, das passt zu den Angaben. Einzelne Blocklängen lassen sich aus Git nicht nachmessen.
- Verbrauch: 0 eigene Subagenten, 0 Fremdmodell-Anfragen.

**Runde 1, Abschluss**

- 5 Subagenten (S4-01 bis S4-05), 0 Fremdmodell-Anfragen.
- Dauer nach Git: Vergabe etwa 06:52 UTC bis Merge 412ad8b um 07:40:05 UTC, also etwa 48 Minuten. S4-01 bis S4-04 waren nach je etwa 4 bis 5 Minuten fertig, S4-05 nach etwa 47 Minuten.
- Status: B-017 bis B-019 behauptet, von einem Prüfer bestätigt. B-020 behauptet. Alles aus S4-05 behauptet.

**Lesarten des Orchestrators (strengere Fassung)**

- (c) Die Haltebedingung von Runde 1 (mehr als zwei Restfälle oder ein nicht behebbarer Fehler in einem der beiden Lemmata) ist nicht erfüllt. Runde 2 beginnt.
- (d) Abbruchregel 2: Die Spuren gibt es erst ab Runde 2. Streng gelesen zählt Runde 1 trotzdem als Runde ohne Fortschritt. Zähler 1 von 3 für Spur A und für Spur B. Das beendet keine Spur.

**Gegengelesen (Schreibhand):** (c) deckt sich mit den Berichten S4-01 bis S4-03. (d) ist strenger als der Wortlaut, weil Runde 1 laut Abschnitt 3 nur Prüfung ist und keine Spur hatte. Der Zähler steht damit nach Runde 1 bei 1 von 3 für beide Spuren.

## 26.11.2026 · Stufe 4, Runde 2 von 6 vergeben (S4-06 bis S4-09 etwa 07:42 UTC)

Bis zu 6 Subagenten, keine eigenen Subagenten der Threads. Fremdmodell nur nach 5.5, in dieser Runde keine Anfrage geplant.

| Nr. | Spur, Rolle | Auftrag | Zieldatei | Vergabe |
|---|---|---|---|---|
| S4-06 | Spur A, Beweissucher | Ausschluss des Restfalls | `lean/prosa/s4_327_spurA_r2_ausschluss.md` | etwa 07:42 UTC |
| S4-07 | Spur A, Beweissucher (Gegenrichtung) | aus dem Restfall ein Verfahren mit 34 bauen oder das Hindernis benennen | `lean/prosa/s4_327_spurA_r2_bau.md` | etwa 07:42 UTC |
| S4-08 | Spur B, Verfahrenssucher | Suche nach 34, mit den erzwungenen Kenngrößen als Vorgabe | `versuche/s4-spurB-r2.md` | etwa 07:42 UTC |
| S4-09 | Lean-Wartung | Axiom-Bericht für `lemma15b` und `lemma_I` im Actions-Lauf, nur Workflow, kein Quelltext unter `lean/YangBounds/` | Workflow | etwa 07:42 UTC |
| S4-10 | Prüfer | B-020, wiederholt die Läufe beider Prüfprogramme | `verfahren/3x2x7-r35-pruefung-s4-10.md` | nach Durchsicht des Gedächtnisses |
| S4-11 | Blind-Sucher | | `versuche/s4-blind-r2.md` | nach Durchsicht des Gedächtnisses |

Positivliste S4-10: `behauptungen/B-020.md`, `verfahren/3x2x7-r35-hk71.json`, `verfahren/README.md`, `pruefer/python/`, `pruefer/rust/`. Nicht darauf: `verfahren/3x2x7-r35-nachrechnung.md`.

**Gedächtnis vor S4-10 und S4-11 (Schreibhand, etwa 07:45 UTC):** Index (unverändert seit 06:45 UTC, letzte Synchronisation 06:58 UTC) und alle 21 Einzeleinträge durchgesehen. Nichts über Behauptungen, Prüfurteile, Befunde, Zähler oder Rundenverlauf von Stufe 4. Nichts geändert. Freigegeben.

**Nachtrag 26.11.2026, Runde 2:** S4-10 (Prüfer B-020) und S4-11 (Blind-Sucher, diesmal als Beweissucher) vergeben etwa 07:43 UTC. Runde 2 hat damit 6 Subagenten, 0 Fremdmodell-Anfragen.

**Lesart (e) des Orchestrators (strengere Fassung):** Rechenblöcke direkt hintereinander ohne Commit dazwischen zählen als ein Block. Danach hat S4-05 die Grenze von 30 Minuten überschritten (zwei Blöcke von 07:00 bis 07:38 UTC, etwa 38 Minuten, kein Commit dazwischen; Commits 2a7e08b um 07:06:59 und bb81c05 um 07:39:28). **Regelverstoß von S4-05 (CLAUDE.md Regel 15, Protokoll Abschnitt 6), ohne weitere Folge.** In die Aufträge S4-08 und S4-11 hat der Orchestrator geschrieben, dass zwischen zwei Blöcken ein Commit liegen muss.

## 26.11.2026 · Stufe 4, Runde 2: S4-10 geliefert, B-020 geprüft

- S4-10 (Prüfer B-020): `verfahren/3x2x7-r35-pruefung-s4-10.md`, PR #109 (Merge e715211 um 07:45:24 UTC). Commits b504f2a (07:42:42) und c1c31c2 (07:45:07). Nur diese eine Datei geändert. Dauer nach Git etwa 3 Minuten ab erstem Commit. Der erste Commit liegt vor der genannten Vergabe „etwa 07:43 UTC“, die Vergabe war also spätestens 07:42 UTC.
- Ergebnis laut Bericht, auf main nachgesehen: frischer Clone von 25561a6, SHA-256 stimmt, Python und frisch gebautes Rust je ANGENOMMEN mit Rückgabewert 0, zwei verfälschte Kopien von beiden abgelehnt, eigene Nachrechnung aller 1764 Gleichungen ohne Verletzung, Koeffizienten −2 bis 2, gilt über ℤ und jedem Körper.
- Offenlegung: Index und fünf Einzeleinträge eingeblendet (nur Prüfprogramm- und Formathinweise). Verweis auf die Nachrechnungsdatei gesehen, nicht gelesen. „forced update“ von cbc6d61 (erster Commit des Repos) in einem alten Clone der Arbeitsumgebung, kein Umschreiben von main.
- **Status (Orchestrator): B-020 geprüft** nach 5.2 Punkt 1 bis 3 (zwei unabhängig geschriebene Programme in zwei Sprachen, exakte Arithmetik, Zahlbereich ℤ), Läufe von einem Prüfer wiederholt, der die Datei nicht gebaut hat. Die obere Schranke 35 für ⟨3,2,7⟩ ist damit geprüft.
- Lesart des Orchestrators: kein Fortschritt im Sinne von Abbruchregel 2, weil es die Bestätigung eines bekannten Werts ist. Zähler unverändert.
- 0 eigene Subagenten, 0 Fremdmodell-Anfragen.

---

## 26.11.2026 · Entscheidung von Justus: Runde 2 abschließen, Pause bis Sonntag

**Nachricht von Justus im Projektchat (Wortlaut, 26.11.2026, 08:23 UTC):**

> Schließe Runde 2 ab, merge alles, führe LOG.md und STATUS.md nach und halte dann an. Pause bis Sonntag, keine Runde 3 vorher. Schreib in STATUS.md einen Abschnitt „Wiederaufnahme" mit dem Zählerstand je Spur, den laufenden Fristen und den ersten Aufträgen für Runde 3. Die Pause zählt nicht als Runde und löst keine Abbruchregel aus.

Sonntag ist der 29.11.2026. Keine Runde 3 vorher.

## 26.11.2026 · Stufe 4, Runde 2: Lieferungen S4-06, S4-07, S4-09, S4-11 (S4-08 läuft noch)

Alle Zeiten UTC, aus Git. Vergabe S4-06 bis S4-09 etwa 07:42, S4-10 und S4-11 etwa 07:43 (erste Commits von S4-07 um 07:42:02, S4-09 um 07:42:11, S4-11 um 07:42:44).

| Nr. | PR | Merge | Zieldatei | Commits | Dauer ab Vergabe |
|---|---|---|---|---|---|
| S4-09 | #108, #112 | 1e4f7b8 (07:49:33), 645af03 (08:05:32) | Workflow-Änderung, `lean/prosa/s4_327_axiome_s4-09.md` | 57f4bef 07:42:11, 591e6c8 08:05:05 | etwa 23 Minuten |
| S4-10 | #109 | e715211 (07:45:24) | `verfahren/3x2x7-r35-pruefung-s4-10.md` | siehe eigenen Eintrag | etwa 3 Minuten |
| S4-11 | #110 | 0ee499f (07:52:54) | `versuche/s4-blind-r2.md` | 9654029 07:42:44 bis bc9c772 07:52:34 | etwa 10 Minuten |
| S4-06 | #111 | dfd239e (07:55:01) | `lean/prosa/s4_327_spurA_r2_ausschluss.md` | 97a1128 07:51:51, 8c96b57 07:54:45 | etwa 13 Minuten |
| S4-07 | #113 | 81fa438 (08:10:50) | `lean/prosa/s4_327_spurA_r2_bau.md` | 382b132 07:42:02, a2671ea 08:04:05, 961f6c0 08:10:28 | etwa 29 Minuten |

Alle melden 0 eigene Subagenten und 0 Fremdmodell-Anfragen. Status von allem: **behauptet**. Der Orchestrator setzt keinen Status hoch.

- **S4-06 (Spur A, Ausschluss):** Restfall (4, 6, 4) nicht ausgeschlossen. Lücke „Λ“ (Abschnitt 8). Behauptet A1 bis A6. Offen außerdem Lücke B (Unterfall B mit glattem Kegelschnitt, Abschnitt 5) und Lücke A5-iii (Abschnitt 7.1). Gescheiterte Ansätze in Abschnitt 9, darunter die Invarianz von f₀(N) unter s und t (Weg aus `versuche/s4-blind-r1.md`, Lücke L3), die im Restfall falsch ist. A5-iii war laut Orchestrator in der ersten Fassung als gezeigt angenommen und wurde zurückgenommen. Keine Rechenblöcke. Eingeblendet: Index und Einzeleinträge `git-regeln`, `lean-upper-3x2x6`.
- **S4-07 (Spur A, Gegenrichtung):** Kein Verfahren gebaut. Behauptet S4-07-A bis C, bedingter Ausschluss S4-07-D (e = 3 unter (INJ5)), Satz X (S4-07-E). Vermutung S4-07-V nur durch Rechnung gestützt. Lücken L-1 (Fall e ≤ 2), L-2 (von (INJ5) zu allen Lagen), L-3 (setzt B-017 bis B-019 voraus), L-4 (Bedingung (B) ungenutzt). Eingeblendet: Index und Einzeleinträge `hk-verfahren-a10`, `verfahren-randfaelle-s1-04`, `verfahren-datenformat`, `git-regeln`. Hat das Python-Paket `python-sat` per pip installiert und nicht benutzt.
  - **Rechenblöcke gegen Lesart (e):** Laut Bericht Block 1 von 07:58 bis 08:03, Block 2 von etwa 08:03 bis 08:06. Der Zwischencommit a2671ea um 08:04:05 liegt während Block 2, also nicht zwischen den Blöcken. Nach Lesart (e) ist das ein Block von etwa 8 Minuten (07:58 bis 08:06), wie der Thread selbst zählt. Selbst der ganze Rahmen von Commit 382b132 (07:42:02) bis 961f6c0 (08:10:28) ist mit 28,5 Minuten unter 30. **Kein Verstoß.**
- **S4-09 (Axiom-Bericht):** `.github/scripts/lean_report.py` (drei Einträge in `MAIN_THEOREMS`) und `.github/workflows/lean-project.yml` geändert, kein Quelltext unter `lean/YangBounds/`. Maßgeblicher Lauf 45778891656 (Nr. 106, Commit dfd239e), Job 139769322302, success. Der Lauf für 1e4f7b8 (45778205882) wurde durch die concurrency-Regel abgebrochen. Selbst im Log nachgesehen: „AXIOM-RESULT|YangBounds.YangN4Haupt.lemma15b_core|propext, Quot.sound, Classical.choice“, ebenso für `lemma15b` und `YangN3Teil3.lemma_I`, „SORRY: 0“ in beiden Zeilen, „TOTAL: STANDARD=59“. Damit ist die in den Vermerken zu B-018 und B-019 genannte Lücke beim Axiom-Bericht geschlossen. Am Status ändert das nichts (Entscheidung des Orchestrators).
- **S4-11 (Blind-Sucher, als Beweissucher):** Keine Schranke über 34 bewiesen. Satz G (Gleichheitsfall r = 34) behauptet, fünf gescheiterte Ansätze, Vorschläge in Abschnitt 6. 0 Rechenblöcke. **Einschränkung der Blindheit:** Offengelegt sind der Gedächtnis-Index und vier Einzeleinträge (`hk-verfahren-a10`, `lean-upper-3x2x6`, `git-regeln`, `verfahren-randfaelle-s1-04`). Daraus kannte der Blind-Sucher die Verfahren für 3×2×5 mit 25 und 3×2×6 mit 30 und den Namen der Lean-Datei YangBounds.
- **S4-08 (Spur B):** läuft noch. Zweig `claude/project-thread-irkx8w`, noch ohne PR. Commits 3c6af4d (07:45:27), 0083762 (07:49:46), d9cea16 (07:55:46, Block 1a 07:50:36 bis 07:55:36), 0ca1e58 (08:10:30, Block 1b). Nachtrag folgt.

**Offene Pull Requests (26.11.2026, etwa 08:30 UTC):** keiner. Alte Zweige aus Stufe 2 sind per Squash gemergt und haben keinen offenen PR.

## 26.11.2026 · Stufe 4, Runde 2 abgeschlossen

**S4-08 (Spur B, Suche nach 34):** `versuche/s4-spurB-r2.md` mit `versuche/s4-spurB-r2/` (Programme und Daten), PR #114 (Merge 78ce5f9 um 08:31:52 UTC). Commits 3c6af4d (07:45:27), 0083762 (07:49:46), d9cea16 (07:55:46), 0ca1e58 (08:10:30), b9c134c (08:31:36). Dauer ab Vergabe (etwa 07:42) etwa 50 Minuten.

- Inhalt laut Bericht, alles behauptet: Kein Verfahren mit 34. Kein Teil des Suchraums vollständig abgesucht, kein UNSAT, kein Zertifikat. Die Positivprobe bei 35 fand ebenfalls nichts. Das Werkzeug ist damit nicht geeicht, das Ausbleiben eines Funds ist kein Indiz gegen 34. Behauptet: Eichwerte (6, 7, 6) der bekannten 35er gegen (4, 6, 4) im Restfall, Satz K (K1, K2, ohne Lemma 15(b), ohne algebraischen Abschluss), Grenze der starken Normalform über GF(2) und GF(3).
- **Rechenblöcke gegen Lesart (e) und Git:** 1a 07:50:36 bis 07:55:36 (5 Minuten), Commit d9cea16 um 07:55:46; 1b 07:55:54 bis 08:10:24 (14,5 Minuten), Commit 0ca1e58 um 08:10:30; Block 2 08:10:41 bis 08:30:41 (20 Minuten), Commit b9c134c um 08:31:36. Je 4 Kerne. Zwischen allen Blöcken liegt ein Commit, die Commit-Zeiten passen zu den Angaben. Jeder Block unter 30 Minuten. **Kein Verstoß.**
- Eingeblendet: Gedächtnis-Index und Einzeleinträge (Datei- und Formathinweise, Abschnitt 0 des Berichts). 0 eigene Subagenten, 0 Fremdmodell-Anfragen.

**Runde 2, Abschluss**

- 6 Subagenten (S4-06 bis S4-11), 0 Fremdmodell-Anfragen.
- Dauer nach Git: Vergabe etwa 07:42 UTC (erster Commit 07:42:02) bis Merge 78ce5f9 um 08:31:52 UTC, also etwa 50 Minuten.
- Ergebnis: B-020 geprüft (S4-10). Kein Ausschluss des Restfalls, kein Verfahren mit 34. Alles Übrige behauptet.
- **Zählerstand Abbruchregel 2** (Lesart (d) des Orchestrators): Spur A 2 von 3, Spur B 2 von 3. Kein Fortschritt nach a) oder b) in Runde 2. B-020 zählt nicht (Bestätigung eines bekannten Werts). Ohne Lesart (d) je 1 von 3. Laufende Fristen nach 2 b): keine.
- Budget: 2 von 6 Runden verbraucht.
- Offene Pull Requests: keine.
- Der Orchestrator legt Justus Lesart (d) vor, weil nach ihr eine Runde 3 ohne Fortschritt beide Spuren und die Stufe beenden würde (Protokoll Abschnitt 3). Ohne seine Antwort beginnt Runde 3 nicht.

**Der Orchestrator hält an.** Pause bis Sonntag, 29.11.2026, auf Anweisung von Justus. Keine Vergabe vorher. Die Pause zählt nicht als Runde und löst keine Abbruchregel aus.

**Plan des Orchestrators für Runde 3 (26.11.2026),** bei Wiederaufnahme gegen Abschnitt 3 und den dann geltenden Stand neu zu lesen: steht in STATUS.md unter „Wiederaufnahme“.

---

## 26.11.2026 · Entscheidung von Justus: Pause aufgehoben, Lesart (d) gilt nicht, Vorgaben für Runde 3

**Nachricht von Justus im Projektchat (Wortlaut, 26.11.2026, 09:47 UTC):**

> Pause aufgehoben, Runde 3 kann starten. Lesart (d) gilt nicht: Abbruchregel 2 zählt je Spur, und die Spuren gibt es laut Abschnitt 3 erst ab Runde 2. Zähler nach Runde 2: Spur A 1 von 3, Spur B 1 von 3. Trag das mit diesem Wortlaut ins Logbuch ein.
>
> Zu Runde 3:
>
> 1. Der Prüfer für S4-07 hat Vorrang. Bestätigt er den bedingten Ausschluss S4-07-D, lege die Fallunterscheidung des Restfalls als eigene Behauptung an (e = 3 mit (INJ5), e = 3 ohne (INJ5), e ≤ 2) und hole eine Sol-Anfrage zu S4-07-D ein. Bestätigen beide, zählt das als Fortschritt von Spur A nach 2 b) in Runde 3, mit der üblichen Frist.
> 2. Satz X zählt nicht als Fortschritt.
> 3. Höchstens zwei Sol-Anfragen in der Runde, keine ohne vorherige Bestätigung durch einen Prüfer.
> 4. Spur B: zuerst die Positivprobe bei 35. Findet das Werkzeug das bekannte Verfahren nicht, endet der Auftrag mit diesem Befund und sucht nicht bei 34.
>
> Sonst gilt dein Plan aus „Wiederaufnahme".

**Folgen:**

- Die Pause ist aufgehoben. Runde 3 darf starten.
- **Lesart (d) gilt nicht. Zähler nach Runde 2: Spur A 1 von 3, Spur B 1 von 3.** Die Angaben „2 von 3“ in den Einträgen zu Runde 1 und Runde 2 oben sind damit überholt (das Logbuch wird nicht umgeschrieben).
- Die Vorbedingung „Antwort von Justus zu Lesart (d)“ aus „Wiederaufnahme“ ist erfüllt.
- Vorgaben 1 bis 4 für Runde 3 gelten zusätzlich zum Plan des Orchestrators. Sie stehen in STATUS.md unter „Wiederaufnahme“.
- Die Literaturwache für diese Sitzung vergibt der Orchestrator vor der Runde. Nach der bisherigen Lesart zählt sie nicht als Aufgabe der Runde.

**Gedächtnis vor der Vergabe an Prüfer und Blind-Sucher (Schreibhand, etwa 09:52 UTC):** Index (unverändert seit 06:45 UTC) und alle 21 Einzeleinträge durchgesehen. Nichts über Behauptungen, Prüfurteile, Befunde, Zähler, Lesarten oder Rundenverlauf von Stufe 4. Die Einträge `hk-verfahren-a10` und `lean-upper-3x2x6` enthalten nur Dateipfade, PR-Nummern und Bautechnik zu 3×2×5, 3×2×6 und der Lean-Datei. Sie verraten einem Blind-Sucher aber, dass das Projekt Verfahren für 3×2×5 und 3×2×6 und eine Lean-Familie YangBounds hat. Kein Urteil. Nichts geändert. Freigegeben.

## 26.11.2026 · Vorbereitung Runde 3: Behauptungen B-021 bis B-024, Lesart (f)

**Behauptungsdateien** (Auftrag des Orchestrators, nach 5.4 nur Aussage, Herkunft, Artefakt, Aussagen wörtlich):

- `behauptungen/B-021.md`: S4-07-A bis E aus `lean/prosa/s4_327_spurA_r2_bau.md` (961f6c0). D steht als eigener, einzeln beurteilbarer Punkt, mit (INJ5) im Wortlaut.
- `behauptungen/B-022.md`: S4-06 A1 bis A6 aus `lean/prosa/s4_327_spurA_r2_ausschluss.md` (8c96b57).
- `behauptungen/B-023.md`: Satz G aus `versuche/s4-blind-r2.md` (bc9c772).
- `behauptungen/B-024.md`: Satz K aus `versuche/s4-spurB-r2.md` (b9c134c).
- Prüfvermerke B-021 bis B-024 mit Status behauptet. Prüfer erhalten Behauptungsdatei und Bericht als Artefakt.

**Lesart (f) des Orchestrators:** Die Sol-Anfrage zu S4-07-D ist kein Auftrag an einen Subagenten im Sinn von Abschnitt 6, sondern eine Anfrage des Orchestrators nach 5.5. Der Satz „Aufträge einer Runde hängen nie voneinander ab“ betrifft die sechs Subagenten-Aufträge, die weiterhin alle gleichzeitig und unabhängig vergeben werden. Justus hat die Reihenfolge Prüfer, dann Sol, und die Zuordnung zu Runde 3 am 26.11.2026 um 09:47 UTC ausdrücklich so vorgegeben. Seine Vorgabe geht vor. Die strengere Lesart (Sol erst in Runde 4) nimmt der Orchestrator deshalb nicht, weil sie der ausdrücklichen Anweisung widerspräche. **Runde 3 bleibt offen, bis die Sol-Antwort da ist oder feststeht, dass keine Anfrage gestellt wird.**

**Gedächtnis:** Die Einträge `hk-verfahren-a10` und `lean-upper-3x2x6` bleiben unverändert (Entscheidung des Orchestrators). Der Blind-Sucher legt offen, was ihm eingeblendet wird. Die Einschränkung der Blindheit wird wie in Runde 2 vermerkt.

Die Literaturwache dieser Sitzung läuft. Die Vergabe von Runde 3 folgt danach.

## 26.11.2026 · Literaturwache vor Runde 3 (außerhalb der Runde)

- `lit/WACHE-2026-11-26-R3.md` und Eintrag in `lit/WACHE.md`, PR #115 (Merge 35e2449 um 09:51:06 UTC). Commits 8468ba8 (09:48:20), 15719b4 (09:49:05), 213de8a (09:50:28), 58eb1a9 (09:50:41). Dauer nach Git etwa 3 Minuten. Nur diese zwei Dateien geändert.
- Ergebnis: Nichts gefunden. Keine neue Fassung von 2609.14393 oder 2609.22054, keine neue Arbeit zu ⟨n,2,m⟩ oder einer Rangschranke eines festen Formats. **Abbruchregel 3 greift nicht.** Status: behauptet.
- Weiter gesperrt: arXiv (alle Zugänge), FMM-Lille, Google Scholar, Semantic Scholar, ECCC, Zenodo, MathOverflow per curl; GitHub-REST-API für fremde Repos 403.
- Verbrauch: 1 Subagent (der Thread selbst), 0 Fremdmodell-Anfragen. Gemeldetes Modell: claude-opus-5-5.

## 26.11.2026 · Stufe 4, Runde 3 von 6 vergeben (etwa 09:53 UTC)

6 Subagenten, alle gleichzeitig und unabhängig. Keine eigenen Subagenten der Threads. Rechenblöcke höchstens 30 Minuten auf 4 Kernen mit Commit dazwischen (Lesart e). Fremdmodell: höchstens zwei Sol-Anfragen, keine ohne Prüferbestätigung (Vorgabe 3 von Justus), bisher 0.

| Nr. | Spur, Rolle | Auftrag | Zieldatei |
|---|---|---|---|
| S4-12 | Prüfer | B-021, D zuerst und einzeln. Positivliste: `CLAUDE.md`, Protokoll Abschnitt 5, `behauptungen/B-021.md`, `lean/prosa/s4_327_spurA_r2_bau.md`, `lean/prosa/yang_n3.md` | `lean/prosa/s4_327_bericht_s4-12.md` |
| S4-13 | Prüfer | B-022, B-023, B-024. Positivliste: `CLAUDE.md`, Protokoll Abschnitt 5, die drei Behauptungsdateien, die drei Artefakte, `versuche/s4-spurB-r2/`, `lean/prosa/yang_n3.md` | `lean/prosa/s4_327_bericht_s4-13.md` |
| S4-14 | Spur A, Beweissucher | e = 3 ohne (INJ5) (S4-07-V, L-2), beide Richtungen | `lean/prosa/s4_327_spurA_r3_e3.md` |
| S4-15 | Spur A, Beweissucher | e ≤ 2 (L-1), Ausschluss oder Bau | `lean/prosa/s4_327_spurA_r3_e2.md` |
| S4-16 | Spur B, Verfahrenssucher | zuerst Positivprobe bei 35; bei Nichtbestehen Ende mit Befund, keine Suche bei 34 (Vorgabe 4 von Justus) | `versuche/s4-spurB-r3.md` |
| S4-17 | Blind-Sucher | liest nur `CLAUDE.md` und die Problemstellung | `versuche/s4-blind-r3.md` |

- Laut Orchestrator wurden keinem Prüfer und dem Blind-Sucher Fristen, Zähler, das erwünschte Ergebnis oder die Nachricht von Justus mitgegeben.
- Gedächtnis vor der Vergabe durchgesehen (Eintrag oben, etwa 09:52 UTC).
- Zählerstand zu Beginn der Runde: Spur A 1 von 3, Spur B 1 von 3. Laufende Fristen nach 2 b): keine.
- Runde 3 bleibt nach Lesart (f) offen, bis die Sol-Antwort zu S4-07-D da ist oder feststeht, dass keine Anfrage gestellt wird.
