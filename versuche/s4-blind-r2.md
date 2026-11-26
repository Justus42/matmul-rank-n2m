# S4-11 Blind-Sucher Runde 2: untere Schranke für R(⟨3,2,7⟩)

Auftrag S4-11, Rolle Blind-Sucher (Beweissucher). Gelesen aus dem Repo: nur `CLAUDE.md` und die Problemstellung im Auftrag. Keine Rechenblöcke, keine Fremdmodell-Anfrage, kein Kontakt nach außen, keine Subagenten.

## 0. Offenlegung: was mir eingeblendet wurde

Ohne mein Zutun wurden mir zu Beginn und während der Sitzung folgende Texte eingeblendet:

1. `CLAUDE.md` (als Sitzungskontext, das ist die erlaubte Datei).
2. Ein Sitzungskontext der Plattform mit Projektname „Matrizen-Multiplikation“, Repo-Adresse, Name „Justus“, GitHub-Login und einer E-Mail-Adresse des Kontoinhabers (die Adresse gebe ich hier absichtlich nicht wieder, weil das Repo öffentlich ist).
3. Der Index des Projektgedächtnisses (`team/silo/MEMORY.md`), wörtlich:

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von &lt;n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 26.11.2026 Version 0.6 (von Justus, Commit c721297, von ihm im Projektchat bestätigt).
- Person schreibt Deutsch.
- Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
- Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
- Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4 (Fassung 0.6): kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, nicht über Stufe 4 hinaus weiterarbeiten, in Stufe 4 kein anderes Format als 3×2×7. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert werden müsste.
- Protokoll 0.6, Stufe 4 (von Justus am 26.11.2026 gestartet): Budget 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5. Welche Aufträge in welcher Runde laufen dürfen, steht in Abschnitt 3, vor jeder Runde dort nachlesen. Auslegungsfragen: strengere Lesart nehmen, im Logbuch vermerken, weiterarbeiten; nur anhalten und fragen, wenn die strengere Lesart eine Spur oder die Stufe beenden würde. Justus ist nicht ständig erreichbar. README und ergebnisse/ bleiben unverändert. Threads vergeben keine eigenen Subagenten (CLAUDE.md Regel 14), das in jeden Auftrag schreiben.
- Justus am 25.11.2026: kein Zenodo-Release, kein arXiv, kein Kontakt nach außen, das entscheidet er getrennt. Im Repo heißt er „the repository owner“.
- Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
- Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
- Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
- Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
- Protokoll Abschnitt 6: Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
- Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung. Wachen mit wörtlichem Suchprotokoll und Zwischen-Commits, damit die Zeiten aus Git ablesbar sind (Wunsch von Justus, 25.11.2026).
- Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
- Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
- [[verfahren-datenformat]]: Datenformat der Verfahren
- [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht
```

4. Später in der Sitzung vier Einzeleinträge des Gedächtnisses, wörtlich (nur Rumpf und Beschreibung, Kopfzeilen gekürzt auf name/description):

```
name: hk-verfahren-a10
description: A-10: Verfahrensdateien 3x2x5 r25 und 3x2x6 r30 (ring Z) liegen in verfahren/, PR #11; Formatfallen
A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 (cac2c55).
**How to apply:** Bekannte Verfahren nicht neu bauen; bei neuen Verfahrensdateien Zusatzschlüssel in origin und ungültige Daten meiden (siehe verfahren/README.md Abschnitt 9). Verwandt: [[verfahren-datenformat]]
```
```
name: lean-upper-3x2x6
description: S1-12: Lean-Datei Upper3x2x6.lean (R(3x2x6) ≤ 30), PR #24; Technik decide +kernel für explizite Verfahren
S1-12, 25.11.2026: `lean/YangBounds/Upper3x2x6.lean`, PR #24 (Merge edb6814).
- Satz `YangBounds.Upper3x2x6.hopcroft_kerr_three_two_six (K) [Field K] : tensorRank K 3 2 6 ≤ 30`, typgleich (rfl) mit der Aussage in Statements.lean. Einsetzen: `import YangBounds.Upper3x2x6`, dann `Upper3x2x6.hopcroft_kerr_three_two_six K`.
- Technik: Tensoridentität über ℤ (`∑ r, u*v*w = [i=s ∧ j=p ∧ q=t]`) mit `decide +kernel` (14 s, kein Zusatzaxiom), dann allgemeiner Übertrag in den Körper. Direktes simp/ring über Matrixliterale mit 30 Produkten läuft in Heartbeat-Timeouts (versuche/V-S1-12-simp-matrixliterale.md).
**How to apply:** Für weitere explizite Verfahren dasselbe Muster nehmen. Verwandt: [[lean-yang-bounds]], [[hk-verfahren-a10]], [[lean-build-cloud]]
```
```
name: git-regeln
description: Seit Protokoll 0.2 (25.11.2026) committen Threads ihre Zieldatei ohne Rückfrage, PR mit Auftragsnummer, Rückfragen an Orchestrator
Ab Protokoll 0.2 (Abschnitt 11): Threads committen ihre Zieldatei ohne Rückfrage, pushen auf den eigenen Zweig und öffnen einen PR, dessen Titel mit der Auftragsnummer beginnt (z. B. "A-01: ..."). Nur die Dateien des Auftrags ändern, STATUS.md/LOG.md pflegt der Orchestrator. Rückfragen an den Orchestrator (Koordinator), nicht an Justus. Der Orchestrator merged.
**Why:** Justus will, dass das Projekt ohne Rückfragen an ihn läuft (testweise).
**How to apply:** Vor jeder Arbeit CLAUDE.md und PROTOKOLL.md von origin/main neu lesen, weil Justus Regeln ändern kann.
```
```
name: verfahren-randfaelle-s1-04
description: S1-04 (25.11.2026): Randfälle des Verfahrensformats in verfahren/README.md Abschnitt 9/10 festgelegt, PR #12 gemergt
S1-04, 25.11.2026: `verfahren/README.md` um Abschnitt 9 (Randfälle, strengere Lesart) und 10 (Anpassungsbedarf der Prüfer) ergänzt, PR #12 gemergt (e8d9cb0). Formatversion bleibt 1.
- Orchestrator-Vorgaben: Zusatzschlüssel überall FEHLERHAFT (auch origin), ungültiges Kalenderdatum FEHLERHAFT, doppelte JSON-Schlüssel FEHLERHAFT. "-0", "-0/5", "0/5" bleiben erlaubt (Orchestrator bestätigt).
- GF(p): p < 2^64. Leere Zeichenketten in origin/claim/notes FEHLERHAFT, null bei optionalen Feldern FEHLERHAFT.
- Muss-Anpassungen: Python (Kalenderdatum, p ≥ 2^64 ablehnen), Rust (Zusatzschlüssel in origin ablehnen). Weitere Prüfpunkte in Abschnitt 10. Programme ändern ist getrennter Auftrag.
**How to apply:** Neue Verfahrensdateien und Prüfer-Aufträge an Abschnitt 9 ausrichten. Verwandt: [[verfahren-datenformat]], [[hk-verfahren-a10]]
```

Einfluss auf diese Arbeit: Die Einträge nennen eine Lean-Familie „YangBounds“ und Verfahren 3×2×5 mit Rang 25 und 3×2×6 mit Rang 30. Das stimmt mit der öffentlichen Literatur überein, die ich unabhängig gefunden habe (Abschnitt 1). Inhalte aus dem Repo jenseits von `CLAUDE.md` habe ich nicht gelesen, auch keine Commit-Listen.

## 1. Literaturstand (öffentlich, außerhalb des Repos)

Suchprotokoll: zwei Websuchen (Stichworte „lower bound tensor rank matrix multiplication 3x2 by 2xn substitution method Bläser Alekseyev“ und „rank of <2,3,n> matrix multiplication lower bound 3n Hopcroft Kerr optimal“), eine erweiterte Suche („3,2,7 … tensor rank 34 35 lower bound“), dann Volltexte über alphaXiv.

* **Obere Schranke.** Hopcroft–Kerr (1971): R(⟨n,2,m⟩) ≤ ⌈(3nm + max(n,m))/2⌉, für ⟨3,2,7⟩ also **35** (z. B. als direkte Summe ⟨3,2,3⟩ ⊕ ⟨3,2,4⟩ mit 15 + 20).
* **Yang**, arXiv:2609.14393 (v3 vom 12.10.2026): R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉ für m ≥ 3, über beliebigen Körpern. Für m = 7: (168+2)/5 = **34**.
* **Tsyganov, Parkina, Samsonov, Rakhuba**, arXiv:2609.22054: R(⟨3,2,m⟩) > 24m/5 (für m = 7 ebenfalls 34). Gleichheitsfall-Analyse mit gemeinsamem Eigenvektor; Lean-geprüft laut Autoren.
* **Wang**, arXiv:2603.07280: automatische Schranken nur über F₂ (u. a. Ja’Ja’–Takche R_{F₂}(⟨3,2,n⟩) ≥ ⌈105n/23⌉, für n = 7 also 32); für beliebige Körper nicht stärker.

Literaturstand für beliebige Körper also: **34 ≤ R(⟨3,2,7⟩) ≤ 35**. Eine Arbeit, die 35 als untere Schranke zeigt, habe ich nicht gefunden.

Bemerkung: m = 7 ist genau der kleinste Fall m ≥ 3 mit m ≡ 2 (mod 5), in dem Yangs Schranke (24m+2)/5 ganzzahlig ist. Dann läuft Yangs Argument für r = 34 in einen Fall, in dem **jede** Ungleichung mit Gleichheit gilt. Darauf setzt der Versuch in Abschnitt 2 bis 4 an: den Gleichheitsfall auszuschließen würde R(⟨3,2,7⟩) = 35 ergeben.
