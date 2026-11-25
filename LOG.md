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
