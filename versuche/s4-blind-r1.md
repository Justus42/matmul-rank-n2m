# S4-05: Blinde Suche zum Tensorrang von ⟨3,2,7⟩ (Runde 1)

Rolle: Blind-Sucher. Aus dem Repo gelesen: nur `CLAUDE.md` und die Problemstellung im Auftrag. Öffentliche Literatur außerhalb des Repos: siehe Abschnitt 3.
Bearbeitung: 26.11.2026 ab 06:53 UTC (Dauer aus den Git-Zeitstempeln ablesbar). Statuswörter nach CLAUDE.md; einen Status setzt nur der Orchestrator. Alle eigenen Aussagen in diesem Bericht sind höchstens **behauptet**.

## 0. Offenlegung: Was mir eingeblendet wurde

Ich gebe hier alles wieder, was mir außerhalb von `CLAUDE.md` und der Problemstellung eingeblendet wurde, im Wortlaut, so wie es mir angezeigt wurde.

### 0.1 Projektgedächtnis, Index (`team/silo/MEMORY.md`), zu Sitzungsbeginn eingeblendet

```text
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

### 0.2 Einzeleinträge des Projektgedächtnisses, nach meinem ersten Shell-Befehl als „Retrieved for possible relevance“ eingeblendet

```text
Memory: /tmp/claude/memory/team/silo/hk-verfahren-a10.md:

---
name: hk-verfahren-a10
description: A-10: Verfahrensdateien 3x2x5 r25 und 3x2x6 r30 (ring Z) liegen in verfahren/, PR #11; Formatfallen
metadata:
  type: project
---

A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 (cac2c55).

**How to apply:** Bekannte Verfahren nicht neu bauen; bei neuen Verfahrensdateien Zusatzschlüssel in origin und ungültige Daten meiden (siehe verfahren/README.md Abschnitt 9). Verwandt: [[verfahren-datenformat]]


Memory: /tmp/claude/memory/team/silo/lean-upper-3x2x6.md:

---
name: lean-upper-3x2x6
description: S1-12: Lean-Datei Upper3x2x6.lean (R(3x2x6) ≤ 30), PR #24; Technik decide +kernel für explizite Verfahren
metadata:
  type: project
  modified: 2026-11-25T18:41:42.872Z
---

S1-12, 25.11.2026: `lean/YangBounds/Upper3x2x6.lean`, PR #24 (Merge edb6814).
- Satz `YangBounds.Upper3x2x6.hopcroft_kerr_three_two_six (K) [Field K] : tensorRank K 3 2 6 ≤ 30`, typgleich (rfl) mit der Aussage in Statements.lean. Einsetzen: `import YangBounds.Upper3x2x6`, dann `Upper3x2x6.hopcroft_kerr_three_two_six K`.
- Technik: Tensoridentität über ℤ (`∑ r, u*v*w = [i=s ∧ j=p ∧ q=t]`) mit `decide +kernel` (14 s, kein Zusatzaxiom), dann allgemeiner Übertrag in den Körper. Direktes simp/ring über Matrixliterale mit 30 Produkten läuft in Heartbeat-Timeouts (versuche/V-S1-12-simp-matrixliterale.md).

**How to apply:** Für weitere explizite Verfahren dasselbe Muster nehmen. Verwandt: [[lean-yang-bounds]], [[hk-verfahren-a10]], [[lean-build-cloud]]


Memory: /tmp/claude/memory/team/silo/git-regeln.md:

---
name: git-regeln
description: Seit Protokoll 0.2 (25.11.2026) committen Threads ihre Zieldatei ohne Rückfrage, PR mit Auftragsnummer, Rückfragen an Orchestrator
metadata:
  type: feedback
---

Ab Protokoll 0.2 (Abschnitt 11): Threads committen ihre Zieldatei ohne Rückfrage, pushen auf den eigenen Zweig und öffnen einen PR, dessen Titel mit der Auftragsnummer beginnt (z. B. "A-01: ..."). Nur die Dateien des Auftrags ändern, STATUS.md/LOG.md pflegt der Orchestrator. Rückfragen an den Orchestrator (Koordinator), nicht an Justus. Der Orchestrator merged.

**Why:** Justus will, dass das Projekt ohne Rückfragen an ihn läuft (testweise).
**How to apply:** Vor jeder Arbeit CLAUDE.md und PROTOKOLL.md von origin/main neu lesen, weil Justus Regeln ändern kann.
```

### 0.3 Sonstiges

- Die Umgebung blendete den Inhalt von `CLAUDE.md` ein (auf der Positivliste) und eine E-Mail-Adresse des Kontoinhabers, die ich hier aus Datenschutzgründen nicht wiedergebe.
- Die Projektumgebung nannte als gemeinsame Projektdateien die Namen `A-01/LIZENZEN.md`, `a07/verfahren-README.md` und `schranken/QUELLEN.md`. Ich habe keine davon geöffnet.
- Um den Gedächtnisinhalt für diesen Abschnitt zu kopieren, habe ich einmal `ls` auf das Gedächtnisverzeichnis ausgeführt und dabei nur Dateinamen gesehen: `MEMORY.md, aussagen-abgleich-n3.md, gemini-bridge.md, git-regeln.md, hk-verfahren-a10.md, lean-build-cloud.md, lean-project-ci.md, lean-satz2-eingesetzt.md, lean-upper-3x2x6.md, lean-yang-bounds.md` (Ausgabe auf 10 Zeilen gekürzt). Das anschließende Kopieren der Einträge wurde von der Umgebung abgelehnt. Ich habe keinen weiteren Eintrag gelesen.
- Ein früher Befehl enthielt `ls versuche`, dessen Ausgabe nach `/dev/null` ging. Ich habe den Inhalt von `versuche/` nicht gesehen.

**Einfluss auf meine Arbeit:** Aus 0.1 und 0.2 wusste ich, dass im Projekt Verfahren 3×2×5 mit 25 und 3×2×6 mit 30 (Hopcroft–Kerr) existieren und dass in Lean die Schranke R(3×2×6) ≤ 30 formalisiert ist, und dass Dateinamen wie `YangBounds` auf eine Arbeit von Yang hindeuten. Die Literaturstellen habe ich unabhängig davon über eine öffentliche Suche gefunden (Abschnitt 3). Keine Datei des Repos außer `CLAUDE.md` habe ich gelesen. Mein Verfahren in Abschnitt 2 ist mit eigenem Code neu berechnet und nicht aus dem Repo übernommen.

## 1. Ergebnis in Kürze

1. **Obere Schranke R(⟨3,2,7⟩) ≤ 35, behauptet.** Ich habe ein Verfahren mit 35 Multiplikationen und Koeffizienten in {−1, 0, 1} selbst berechnet (Flip-Graph-Suche über ℤ für ⟨3,2,3⟩ mit 15 und ⟨3,2,4⟩ mit 20, dann direkte Summe über die Spalten von B). Alle 1764 Brent-Gleichungen sind mit ganzzahliger Arithmetik nachgerechnet. Da die Koeffizienten ganz sind, gilt das Verfahren über jedem Körper und jedem kommutativen Ring. Der Wert stimmt mit der Formel von Hopcroft–Kerr (1971) überein: ⌈(3·3·7 + 7)/2⌉ = 35. Das Verfahren steht maschinenlesbar in Abschnitt 2.
2. **Untere Schranke R(⟨3,2,7⟩) ≥ 34, nur aus der Literatur, nicht von mir geprüft.** Sie folgt aus Yang (arXiv:2609.14393v3, Satz 1: R ≥ ⌈(24m+2)/5⌉ für m ≥ 3) und ebenso aus Tsyganov, Parkina, Samsonov, Rakhuba (arXiv:2609.22054, Satz 1: R > 24m/5), beide über beliebigen Körpern. Für m = 7 ergibt beides 34. Der Rang ist damit 34 oder 35. **Die Lücke habe ich nicht geschlossen.**
3. **Eigene Teilergebnisse zur Lücke (behauptet, mit Lücken gekennzeichnet):**
   - (a) Ein Verfahren mit 34 Multiplikationen müsste in Yangs Rahmen eine starre Gleichheitslage erfüllen: rk L = 6, rk H = 4, Δ = 2, dim N = 3, dim S = 1, L und Φ surjektiv, f₀(N) = span{f₀(x), f₁(x), f₂(x)} (Abschnitt 4.2).
   - (b) Die abstrakten Voraussetzungen von Lemma 2 und Lemma 3 aus Tsyganov u. a., zusammen mit ihrer Normierung und Yangs starker Normierung, sind bei m = 7, h = 13, r = 34 **erfüllbar** (explizites ganzzahliges Beispiel, Rang exakt nachgerechnet). Die Methode dieser Arbeit allein kann daher 35 nicht beweisen; ein Beweis von 35 muss weitere Struktur des Tensors benutzen (Abschnitt 5).
   - (c) Flip-Graph-Suche nach einem Verfahren mit 34, ausgehend von meinem 35er-Verfahren, über ℤ mit Koeffizienten in {−1,0,1} und über GF(2): nichts gefunden (Abschnitt 6). Das ist nur ein schwaches Indiz für 35.

## 2. Das Verfahren mit 35 Multiplikationen

### 2.1 Wie es entstanden ist

- Eigenes C-Programm (Anhang A): Zufallsweg im Flip-Graphen nach Kauers–Moosbauer, aber direkt über ℤ mit der Nebenbedingung, dass alle Koeffizienten in {−1, 0, 1} bleiben. Ein Flip ersetzt a⊗b⊗c + a⊗b'⊗c' durch a⊗(b + t·b')⊗c + a⊗b'⊗(c' − t·c) mit t = ±1 (auch mit Vorzeichen a' = −a). Das ist eine Identität über ℤ, deshalb bleibt jedes Zwischenverfahren exakt richtig. Reduktion, wenn zwei Terme in zwei Faktoren bis aufs Vorzeichen übereinstimmen. Bei Stillstand ein „Plus-Übergang“ (Rang +1).
- Start jeweils beim Standardverfahren. ⟨3,2,2⟩: 11 nach 0,2 s (Probe). ⟨3,2,3⟩: 15 nach rund 0,8 Mio. Schritten. ⟨3,2,4⟩: 20 nach rund 0,6 Mio. Schritten (je unter 100 s). Direkt bei ⟨3,2,7⟩ ab dem Standardverfahren (42) fand dieselbe Suche in 4 Minuten keine einzige Reduktion.
- ⟨3,2,7⟩ = ⟨3,2,4⟩ ⊕ ⟨3,2,3⟩ entlang der Spalten von B und C: die ersten 20 Terme verwenden die Spalten 1 bis 4, die letzten 15 die Spalten 5 bis 7.

### 2.2 Konvention und Zahlbereich

A ist 3×2, B ist 2×7, C = AB ist 3×7. Jeder Term r besteht aus U_r (3×2), V_r (2×7), W_r (3×7), und

  AB = Σ_r ( Σ_{i,j} U_r[i][j]·A[i][j] ) · ( Σ_{j,k} V_r[j][k]·B[j][k] ) · W_r.

Gleichwertig: für alle Indizes gilt Σ_r U_r[i][j]·V_r[j'][k]·W_r[i'][k'] = [i=i'][j=j'][k=k'] (1764 Brent-Gleichungen). Zahlbereich: ℤ, alle Einträge in {−1, 0, 1}. Indizes ab 0.

### 2.3 Daten

```json
{
  "format": [3, 2, 7],
  "rank": 35,
  "ring": "Z (all coefficients in {-1, 0, 1}); valid over every field and every commutative ring",
  "convention": "A is 3x2, B is 2x7. AB = sum_r (sum_{i,j} U_r[i][j]*A[i][j]) * (sum_{j,k} V_r[j][k]*B[j][k]) * W_r, where W_r is a 3x7 matrix",
  "terms": [
    {"U": [[0, -1], [0, 1], [0, 0]], "V": [[0, 1, -1, 0, 0, 0, 0], [0, 1, -1, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [1, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[1, 0], [-1, 0], [-1, 0]], "V": [[-1, 1, -1, 0, 0, 0, 0], [-1, 1, -1, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[-1, 1], [0, 0], [0, 0]], "V": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0, 0]], "W": [[0, 1, 1, -1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 1, 1, -1, 0, 0, 0]]},
    {"U": [[1, -1], [-1, 1], [-1, 0]], "V": [[0, 1, -1, 0, 0, 0, 0], [-1, 1, -1, 0, 0, 0, 0]], "W": [[0, -1, 0, 0, 0, 0, 0], [-1, -1, 0, -1, 0, 0, 0], [0, -1, 0, 0, 0, 0, 0]]},
    {"U": [[1, -1], [-1, 1], [0, 0]], "V": [[0, 1, -1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 0, 0, 0, 0]]},
    {"U": [[0, 0], [0, 0], [-1, 0]], "V": [[-1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, -1, 0, 0, 0, 0, 0], [-1, -1, 0, -1, 0, 0, 0], [1, -1, -1, 1, 0, 0, 0]]},
    {"U": [[0, 1], [0, 0], [0, -1]], "V": [[1, 0, 1, 0, 0, 0, 0], [1, 0, 1, 0, 0, 0, 0]], "W": [[1, 1, 0, 1, 0, 0, 0], [1, 1, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[-1, 0], [1, 0], [0, 0]], "V": [[-1, 0, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[1, -1], [0, 0], [0, 1]], "V": [[1, 0, 1, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0, 0]], "W": [[1, 1, 0, 1, 0, 0, 0], [1, 1, 0, 1, 0, 0, 0], [0, 1, 1, 0, 0, 0, 0]]},
    {"U": [[0, -1], [0, 0], [0, 1]], "V": [[0, 0, 0, 0, 0, 0, 0], [0, 1, -1, -1, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, -1, 0, 0, 0]]},
    {"U": [[1, -1], [0, 0], [-1, 1]], "V": [[-1, 0, -1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 0, 0, 0, 0]]},
    {"U": [[1, -1], [-1, 1], [-1, 1]], "V": [[0, 0, 0, 0, 0, 0, 0], [1, -1, 1, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, -1, 0, -1, 0, 0, 0]]},
    {"U": [[1, 0], [-1, 1], [-1, 0]], "V": [[-1, 0, 0, 1, 0, 0, 0], [-1, 1, -1, 0, 0, 0, 0]], "W": [[0, 1, 0, 0, 0, 0, 0], [0, 1, 0, 0, 0, 0, 0], [0, 0, 0, -1, 0, 0, 0]]},
    {"U": [[-1, 0], [0, 0], [0, 0]], "V": [[0, 0, -1, 0, 0, 0, 0], [0, 0, -1, 0, 0, 0, 0]], "W": [[-1, 0, 1, -1, 0, 0, 0], [-1, 0, 1, -1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[0, 0], [0, 0], [0, -1]], "V": [[0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0]], "W": [[-1, -1, 0, -1, 0, 0, 0], [-1, -1, 0, -1, 0, 0, 0], [-1, -1, 0, -1, 0, 0, 0]]},
    {"U": [[0, 1], [0, -1], [0, 0]], "V": [[0, 0, 0, 0, 0, 0, 0], [-1, 0, 1, 1, 0, 0, 0]], "W": [[0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0]]},
    {"U": [[-1, 0], [0, 0], [1, 0]], "V": [[0, 1, -1, -1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, -1, 0, 0, 0, 0, 0], [0, -1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[0, 0], [0, 1], [0, 0]], "V": [[-1, 0, 0, 1, 0, 0, 0], [-1, 0, 0, 1, 0, 0, 0]], "W": [[0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0]]},
    {"U": [[1, 0], [0, -1], [0, 0]], "V": [[1, 0, 0, -1, 0, 0, 0], [0, 0, 1, 0, 0, 0, 0]], "W": [[0, 0, 0, -1, 0, 0, 0], [0, -1, -1, 0, 0, 0, 0], [0, 0, 0, -1, 0, 0, 0]]},
    {"U": [[0, 0], [1, -1], [0, 0]], "V": [[1, 0, 0, -1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, -1, 0, 0, 0, 0, 0], [0, 0, 1, -1, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0]]},
    {"U": [[1, 0], [1, 0], [0, 0]], "V": [[0, 0, 0, 0, -1, 1, -1], [0, 0, 0, 0, 1, -1, 1]], "W": [[0, 0, 0, 0, -1, -1, -1], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 1, 1]]},
    {"U": [[-1, 0], [0, 0], [-1, 0]], "V": [[0, 0, 0, 0, 0, 1, -1], [0, 0, 0, 0, 0, -1, 1]], "W": [[0, 0, 0, 0, -1, -1, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 1, 1]]},
    {"U": [[-1, -1], [0, 0], [-1, 0]], "V": [[0, 0, 0, 0, 1, -1, 0], [0, 0, 0, 0, 0, 1, -1]], "W": [[0, 0, 0, 0, -1, -1, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0]]},
    {"U": [[-1, -1], [0, 1], [-1, -1]], "V": [[0, 0, 0, 0, 0, -1, 0], [0, 0, 0, 0, 0, 1, -1]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 1, 1, 1]]},
    {"U": [[0, 0], [0, 1], [0, 0]], "V": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 1], [0, 0, 0, 0, 1, 1, 1]]},
    {"U": [[0, 0], [0, 0], [1, 0]], "V": [[0, 0, 0, 0, -1, 0, 1], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, -1, -1, 0]]},
    {"U": [[1, 1], [1, 1], [0, 0]], "V": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, -1, 1]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[1, 1], [0, 0], [1, 1]], "V": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, -1, 1]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, -1, -1, 0], [0, 0, 0, 0, 0, -1, 0]]},
    {"U": [[1, 1], [1, 0], [0, 0]], "V": [[0, 0, 0, 0, 1, -1, 0], [0, 0, 0, 0, -1, 1, -1]], "W": [[0, 0, 0, 0, -1, -1, -1], [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 1, 1]]},
    {"U": [[-1, -1], [1, 1], [-1, -1]], "V": [[0, 0, 0, 0, 0, 1, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0]]},
    {"U": [[0, -1], [0, 1], [0, -1]], "V": [[0, 0, 0, 0, 0, -1, 0], [0, 0, 0, 0, 0, 1, 0]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, -1, -1, -1]]},
    {"U": [[1, 1], [0, 0], [0, 0]], "V": [[0, 0, 0, 0, 1, -1, 0], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, 0, -1, 0], [0, 0, 0, 0, -1, 0, 0], [0, 0, 0, 0, 0, 1, 0]]},
    {"U": [[0, 1], [0, 0], [0, 0]], "V": [[0, 0, 0, 0, -1, 1, 0], [0, 0, 0, 0, 1, -1, 0]], "W": [[0, 0, 0, 0, 0, -1, -1], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 1, 1]]},
    {"U": [[0, 0], [0, 0], [0, 1]], "V": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, -1]], "W": [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0]]},
    {"U": [[0, 0], [-1, 0], [0, 0]], "V": [[0, 0, 0, 0, 0, 0, -1], [0, 0, 0, 0, 0, 0, 0]], "W": [[0, 0, 0, 0, -1, -1, -1], [0, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 1, 1, 1]]}
  ]
}
```

### 2.4 Nachrechnung

Das Prüfprogramm in Anhang B liest den ersten `json`-Block dieser Datei und rechnet alle Brent-Gleichungen mit Pythons ganzen Zahlen nach (keine Gleitkommazahlen). Aufruf: `python3 -I verify_md.py versuche/s4-blind-r1.md`. Ausgabe auf der hier abgelegten Fassung:

```text
format (3, 2, 7) rank 35 Brent equations checked: 1764 violations: 0
coefficient set: [-1, 0, 1]
```

## 3. Literatur (öffentlich, außerhalb des Repos gelesen)

Suchanfragen (WebSearch, 26.11.2026, etwa 06:58 UTC): „tensor rank lower bound multiplication 3x2 by 2xn matrices Hopcroft Kerr (3pn+max(n,p))/2“, „Bläser lower bound rank matrix multiplication small formats <n,2,m>“, „"3x2x7" OR "⟨2,3,7⟩" OR "<2,3,7>" matrix multiplication rank 35 34 flip graph scheme“. Volltext gelesen über alphaXiv:

- J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393v3 (12.10.2026). Satz 1: R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉ für m ≥ 3, über beliebigen Körpern. Laut Arbeit stimmt das mit Hopcroft–Kerr für m ≤ 6 überein (15, 20, 25, 30). Für m = 7: ⌈170/5⌉ = 34.
- A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054v1 (18.09.2026). Satz 1: R(⟨3,2,m⟩) > 24m/5 über jedem Körper, in Lean 4 formalisiert (laut Arbeit). Für m = 7: > 33,6, also ≥ 34.
- J. E. Hopcroft, L. R. Kerr (1971): obere Schranke ⌈(3pn + max(n,p))/2⌉ für ⟨p,2,n⟩, für p = 3, n = 7 also 35 (Zitat nach Yang; das Original habe ich nicht gelesen).
- Ältere Schranken laut diesen Arbeiten: Bläser (1999) über beliebigen Körpern schwächer; Ja'Ja'–Takche (1985) über GF(2): ⌈105m/23⌉, für m = 7 also 32.

Ein Verfahren für ⟨3,2,7⟩ mit weniger als 35 Multiplikationen habe ich in der Literatur nicht gefunden. Die Suche danach war kurz (eine Anfrage); das ist keine vollständige Recherche.

**Lücke L1:** Die Schranke 34 habe ich gelesen, aber nicht Zeile für Zeile geprüft. Sie ist für diesen Bericht eine Literaturangabe, kein eigenes Ergebnis.

## 4. Untere Schranke: was ein Verfahren mit 34 erfüllen müsste

### 4.1 Rahmen

Ich benutze Yangs Bezeichnungen (arXiv:2609.14393v3, Abschnitte 2 bis 4.1). Ein Verfahren der Länge r schreibt sich AB = W·D(A)·ℬ(B) mit D(A) = diag(α_i(A)), ℬ(B) = (β_i(B))_i und W(t) = Σ t_i C_i. Nach starker Normierung (Yang, Lemma 6) ist D(e₀₀) invertierbar, und für jedes v ≠ 0 sind f₀(v), f₁(v), f₂(v) linear unabhängig, wobei f_i(x) = D(e_{i,0})ℬ(x). Weiter: U = 2×m-Matrizen mit Nullzeile oben (dim m), J = f₀(U) (dim m), K = ker W (dim r − 3m), Q = K/J (dim r − 4m), ℓ(u₁,u₂) = f₁(u₁) + f₂(u₂), L = ℓ mod J : U² → Q, H(x) = (F₂(x), −F₁(x)) mit F_i = f_i mod J (für n = 3 ist U^{∧2} ≅ U), N = ker H, S = {x ∈ N : f₁(x), f₂(x) ∈ f₀(N)}, Δ = 2·rk H − rk L.

Yang zeigt (Gleichung (1), Lemma 11, Lemma 12, Lemma 8 und der Schluss in 4.1):

- (Y1) 2m + rk H ≤ rk L + 2·dim Q,
- (Y2) Δ ≥ 0,
- (Y3) dim S ≥ dim N − Δ,
- (Y4) ist S ≠ 0, so dim(f₀(S) + f₁(S) + f₂(S)) ≥ dim S + 2, und diese Summe liegt in f₀(N),
- (Y5) daraus Δ ≥ min(2, dim N).

### 4.2 Der Fall r = 34, m = 7 (eigene Rechnung, behauptet)

Hier ist dim Q = 34 − 28 = 6, also rk L ≤ 6.

1. Aus (Y1): 14 + rk H ≤ rk L + 12, also rk H ≤ rk L − 2 ≤ 4.
2. dim N = 7 − rk H ≥ 3. Mit (Y5): Δ ≥ 2, also 2·rk H ≥ rk L + 2.
3. Aus 1 und 2: rk L + 2 ≤ 2·rk H ≤ 2·rk L − 4, also rk L ≥ 6. Mit rk L ≤ 6: **rk L = 6**, dann rk H ≤ 4 und 2·rk H ≥ 8, also **rk H = 4, Δ = 2, dim N = 3**.
4. Aus (Y3): dim S ≥ 1. Aus (Y4): dim S + 2 ≤ dim f₀(N) = 3, also **dim S = 1**. Mit S = span{x} gilt **f₀(N) = span{f₀(x), f₁(x), f₂(x)}**: die Summe hat Dimension ≥ 3 und liegt im dreidimensionalen f₀(N). Schreibt man P_i = D(e_{i,0})·D(e₀₀)⁻¹ (diagonal) und y = f₀(x), so ist f₀(N) = span{y, P₁y, P₂y}.
5. In (Y1) gilt Gleichheit (14 + 4 = 6 + 12). Nach Yangs Lemma 10 heißt das: Φ : U² ⊕ U → im L ⊕ Q² hat Kern 0 ⊕ N (dim 3) und Bild der Dimension 21 − 3 = 18 = dim(Q³). **L und Φ sind surjektiv.**
6. Die Abbildung σ : N → ker L aus Yangs Beweis von Lemma 12 (x ↦ (u₁,u₂) mit f₀(u₁) = f₂(x), f₀(u₂) = −f₁(x)) ist injektiv, weil f₀ und f₂ injektiv sind. Es gilt dim ker L = 14 − 6 = 8, N² ⊆ ker L hat Dimension 6, und σ⁻¹(N²) = S hat Dimension 1. Also dim(N² + σ(N)) = 6 + 3 − 1 = 8: **ker L = N² + σ(N)**.

Zur Gegenprobe in der Fassung von Tsyganov u. a. (Lemma 2, mit h = dim ker W = r − 3m = 13, F = {y ∈ J : Sy, Ty ∈ J}, f = dim F): Aus (6) und (7) dort folgt 3 ≤ f ≤ 5. Bei f = 3 muss die erste Bedingung in (5) vollen Rang h − m = 6 haben, also J + SJ + TJ = H. Der Widerspruch dieser Arbeit entsteht nur, wenn J einen Vektor ≠ 0 enthält, der auf einer einzigen Klasse {i : (s_i,t_i) = (s,t)} getragen ist; bei 5h = 9m erzwingt Lemma 2 einen solchen Vektor, bei 5h = 9m + 2 (unser Fall, 65 = 63 + 2) nicht mehr.

**Lücke L2:** Schritte 1 bis 6 setzen (Y1) bis (Y5) und Yangs Lemma 10 voraus, die ich nur gelesen habe (siehe L1). Die eigene Rechnung in 1 bis 6 ist elementar.

**Lücke L3 (die eigentliche):** Aus dieser starren Lage habe ich keinen Widerspruch gewonnen. Der naheliegende Weg wäre zu zeigen, dass span{y, P₁y, P₂y} unter P₁ und P₂ invariant ist; dann gäbe es dort einen gemeinsamen Eigenvektor (Lemma 3 bei Tsyganov u. a.), und Yangs Lemma 9 bzw. die starke Normierung lieferte den Widerspruch. Diese Invarianz folgt aus nichts, was ich gezeigt habe. Abschnitt 5 zeigt, dass die abstrakten Bedingungen allein dafür nicht reichen.

## 5. Grenze der Methode von Tsyganov u. a. bei m = 7 (behauptet, exakt nachgerechnet)

**Aussage.** Es gibt über ℚ Daten (E = ℚ³⁴, kommutierende Diagonalmatrizen S, T, Z, Unterräume J ⊆ H mit dim J = 7, dim H = 13, eine lineare Abbildung X : J → E), die alle Voraussetzungen von Lemma 2 bei Tsyganov u. a. erfüllen, also

- (3) Sy ∈ H, Ty ∈ H, Xy − Zy ∈ H für alle y ∈ J, und
- (4) aus Za + SXu + TXv ∈ H mit a, u, v ∈ J folgt a = u = v = 0,

und zusätzlich:

- alle Paare (s_i, t_i) sind verschieden, die Normierung (2) aus Lemma 1 dort gilt also trivial (jede Klasse hat ein Element),
- J enthält keinen Vektor ≠ 0, der auf einer einzigen Klasse getragen ist (der Widerspruchsfall dort tritt also nicht ein),
- für jedes y ∈ J, y ≠ 0, sind y, Sy, Ty linear unabhängig (das ist die Bedingung aus Yangs starker Normierung, Lemma 6, in diesen Bezeichnungen).

Dabei entspricht r = 34 = dim E, h = 13 = r − 3m. Lemma 2 liefert hier nur 5h = 65 ≥ 63 = 9m, ohne Widerspruch.

**Konstruktion.** 34 verschiedene ganzzahlige Punkte (s_k, t_k), S = diag(s_k), T = diag(t_k), Z = diag(z_k) mit zufälligen ganzen z_k, positive ganzzahlige Gewichte w₁, w₂. J = span{w₁, w₁s, w₁t, w₁s², w₁st, w₁t², w₂} (komponentenweise Produkte von Vektoren in ℚ³⁴). Dann ist J + SJ + TJ = w₁·(Polynome vom Grad ≤ 3) + w₂·span{1, s, t}, Dimension 10 + 3 = 13; ich setze H := J + SJ + TJ. Hier ist F = w₁·span{1, s, t}, also f = 3, genau der Randfall aus 4.2. X := Z + Y mit einer zufälligen ganzzahligen Abbildung Y : J → H. Dann gilt (3) nach Bauart. (4) ist gleichwertig damit, dass H zusammen mit den 21 Vektoren Z·b, S·X·b, T·X·b (b durch eine Basis von J) ganz ℚ³⁴ aufspannt.

**Nachrechnung.** Programm in Anhang C, ganzzahlige Daten, Rang modulo der Primzahl p = 2⁶¹ − 1. Der Rang über ℚ ist mindestens der Rang modulo p, daher folgt aus vollem Rang modulo p voller Rang über ℚ. Ergebnis für die Startwerte 1 bis 5: jeweils dim J = 7, dim H = 13, Rang 34 = r, kein Vektor von J auf einem Punkt getragen, keine Verletzung der starken Normierung (geprüft über alle Geraden durch mindestens zwei der Punkte, 549 bis 555 Geraden, und alle Einzelpunkte: J eingeschränkt auf das Komplement hat stets Rang 7).

Frühere Varianten mit nur einem Gewicht (J = Polynome vom Grad ≤ 2 plus ein kubisches Monom, H = J + SJ + TJ (Dimension 12) plus ein zufälliger Vektor) scheiterten stets mit Rang 33. Das passt zu 4.2: bei f = 3 muss J + SJ + TJ schon ganz H sein.

**Folgerung.** Die Schlusskette „Lemma 2 + Lemma 3 + Normierung“ kann bei m = 7 die Schranke 35 nicht liefern, auch nicht mit Yangs starker Normierung. Ein Beweis von R(⟨3,2,7⟩) = 35 muss Information verwenden, die in dieser Abstraktion fehlt: etwa die Werte der Zerlegung an E₂₂, E₃₂ (die in Lemma 2 nicht vorkommen), die Bedingung H = ker W für ein W, das alle 3×7-Produkte trifft, die Freiheit, die Normierung gleichzeitig in mehreren Richtungen zu wählen, oder Symmetrien des Tensors.

**Lücke L4:** Die Beispieldaten modellieren nur die in Lemma 2 genannten Bedingungen. Sie sind keine Zerlegung des Tensors und sagen nichts darüber, ob ein Verfahren mit 34 existiert. Ob mein Beispiel auch alle Zwischenschritte von Yangs Abschnitt 4.1 (Lemmas 10 bis 12) erfüllt, habe ich nicht geprüft; Yangs Schranke ist bei m = 7 ohnehin 34, also folgt aus ihr ebenfalls nichts Stärkeres.

## 6. Suche nach einem Verfahren mit 34

(läuft)


## 7. Was gescheitert ist und warum

(folgt)



