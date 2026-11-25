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
