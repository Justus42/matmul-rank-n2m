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
