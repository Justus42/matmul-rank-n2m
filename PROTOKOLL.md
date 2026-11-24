# Protokoll: Exakter Rang kleiner Matrixmultiplikations-Formate

Stand: 25.11.2026 · Version 0.1 · Diese Datei ist das Gedächtnis des Projekts. Jeder Chat und jeder Subagent liest sie zuerst.

---

## 1. Ziel

Wir wollen wissen, wie viele Multiplikationen man **mindestens** braucht, um eine n×2-Matrix mit einer 2×m-Matrix zu multiplizieren (Tensorrang von ⟨n,2,m⟩, über beliebigen Körpern).

Für jedes Format gibt es zwei Zahlen:

- **untere Schranke:** bewiesen, dass es mit weniger nicht geht
- **obere Schranke:** ein konkretes Verfahren, das mit so vielen auskommt

Stimmen beide überein, ist das Format gelöst. Unsere Ziele sind Formate, bei denen genau 1 fehlt.

### Nicht-Ziele

- 3×3×3 (zu viele andere Gruppen)
- Rekordjagd bei oberen Schranken großer Formate (rechenlastig, überlaufen)
- Asymptotik (ω)

---

## 2. Ausgangslage

| Format | untere Schranke | obere Schranke | Herkunft |
|---|---|---|---|
| 3×2×5 | 25 | 25 | gelöst, Lean-Beweis (Tsyganov u. a.) |
| 3×2×6 | 30 | 30 | gelöst laut Yang v3, **nicht formalisiert gefunden** |
| 3×2×7 | 34 | 35 | selbst aus den Formeln berechnet |
| 4×2×4 | 25 | 26 | Yang v3 |
| 4×2×5 | 31 | 32 | Yang v3; Quelle des 32er-Verfahrens in Stufe 0 nachtragen (Hopcroft-Kerr-Formel ergäbe 33) |

Formeln:

- untere Schranke (Yang v3): ⌈(24m+2)/5⌉ für m ≥ n = 3; (n+2)·m + n − 3 für m ≥ n ≥ 4
- obere Schranke (Hopcroft-Kerr 1971): ⌈(3nm + max(n,m))/2⌉

Quellen:

- Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393 (v3 vom 12.10.2026)
- Tsyganov, Parkina, Samsonov, Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054; Lean-Repo: github.com/fallnlove/mm325_proof (Lean 4.19.0 mit mathlib)
- Wang, *Automated Lower Bounds for Tensor Rank over Finite Fields*, arXiv:2603.07280 (Zertifikate über endlichen Körpern)
- Shitov, Beweis für 2×2×m mit GPT-5.6 (Zitat in Yang; genaue Quelle in Stufe 0 nachtragen)

Alle Zahlen dieser Tabelle gelten als **ungeprüft übernommen**, bis Stufe 0 sie bestätigt hat.

---

## 3. Stufenleiter

Jede Stufe hat ein Fertig-Kriterium, das eine Maschine entscheidet. Eine Stufe gilt erst als erreicht, wenn die Prüfung nach Abschnitt 5 bestanden ist.

### Stufe 0: Nachbau und Bestandsaufnahme

- Lean-Repo zu 3×2×5 klonen und bauen
- Axiom-Prüfung: nur Standard-Axiome
- Abgleich: Sagt der Lean-Satz dasselbe wie Satz 1 im Paper?
- Tabelle aus Abschnitt 2 gegen die Originalarbeiten prüfen, Quellen nachtragen
- Prüfprogramm für Verfahren schreiben (siehe 5.2) und an den bekannten Verfahren für 3×2×5 und 3×2×6 testen

**Fertig, wenn:** Build grün, Axiom-Bericht liegt vor, Tabelle bestätigt oder korrigiert, Prüfprogramm bestätigt mindestens zwei bekannte Verfahren.

### Stufe 1: Yangs dritte Fassung formalisieren

- Lean-Beweis der beiden Schranken aus Yang v3
- Folgerungen als eigene Lean-Sätze: Rang von 3×2×6 ist 30; Rang von 4×2×4 ist mindestens 25

**Fertig, wenn:** Build grün ohne `sorry`, Axiom-Prüfung bestanden, Aussagen-Abgleich bestanden.

Findet die Formalisierung eine Lücke im Paper, ist das ein Ergebnis. Es wird dokumentiert, nicht überspielt.

### Stufe 2: 4×2×4 (25 oder 26?)

Zwei Spuren laufen parallel und gleichberechtigt:

- **Spur A (Beweis):** untere Schranke 26, zuerst als Prosa-Beweis, dann in Lean
- **Spur B (Verfahren):** ein Verfahren mit 25 Multiplikationen suchen

**Fertig, wenn:** entweder Lean-Beweis für 26 oder ein nach 5.2 bestätigtes Verfahren mit 25.

### Stufe 3: 3×2×7 (34 oder 35?)

Wie Stufe 2. Beginnt erst nach Entscheidung von Justus.

---

## 4. Rollen

**Orchestrator** (der Chat): plant Runden, vergibt Aufträge, führt das Logbuch, entscheidet über Fortsetzen oder Abbruch nach Abschnitt 6. Er beweist und prüft nicht selbst.

**Subagenten** bekommen genau einen Auftrag und liefern genau eine Datei:

| Rolle | Auftrag | bekommt zu sehen |
|---|---|---|
| Beweissucher | Prosa-Beweis oder Teil-Lemma | Protokoll, Quellen, Logbuch |
| Blind-Sucher | wie Beweissucher | **nur** die Problemstellung |
| Verfahrenssucher | Verfahren mit vorgegebenem Rang | Protokoll, Prüfprogramm |
| Formalisierer | Lean-Fassung eines Prosa-Beweises | Prosa-Beweis, Lean-Bestand |
| Prüfer | eine Behauptung bestätigen oder widerlegen | **nur** Behauptung und Artefakt, keine Vorgeschichte |
| Literaturwächter | neue Arbeiten zum Thema finden | Quellenliste |

Pro Runde läuft mindestens ein Blind-Sucher, sobald Stufe 2 begonnen hat. Prüfer sehen nie die Urteile früherer Prüfer.

**Fremdmodell:** Vor jeder Formalisierung eines neuen Prosa-Beweises und bei jedem Aussagen-Abgleich liest ein Modell einer anderen Familie gegen (über die Gemini Bridge oder von Justus selbst weitergereicht).

**Justus:** gibt Stufen frei, entscheidet über Veröffentlichung, kann jederzeit stoppen.

---

## 5. Prüfpflicht

Nichts gilt als wahr, weil ein Agent es sagt.

### 5.1 Beweise

1. Lean-Build läuft durch, ohne `sorry` und ohne eigene Axiome
2. `#print axioms` zeigt nur Standard-Axiome
3. Aussagen-Abgleich: Ein Prüfer und ein Fremdmodell bestätigen unabhängig, dass der Lean-Satz die behauptete Aussage ist (richtiges Format, richtiger Körper, richtige Zahl)
4. Der Build läuft zusätzlich in GitHub Actions. Maßgeblich ist das grüne Ergebnis dort, nicht ein lokaler Lauf

### 5.2 Verfahren

Ein Verfahren ist eine Liste von Produkten, die zusammen das Matrixprodukt ergeben.

1. Zwei unabhängig geschriebene Prüfprogramme in zwei verschiedenen Sprachen rechnen mit exakter Arithmetik nach (keine Gleitkommazahlen)
2. Beide Programme stammen von verschiedenen Subagenten, die den Code des anderen nicht sehen
3. Angabe, über welchem Zahlbereich das Verfahren gilt

### 5.3 Statuswörter

Nur diese fünf, überall im Repo:

- **vermutet:** Idee ohne Beleg
- **behauptet:** ein Agent hält es für gezeigt, ungeprüft
- **geprüft:** Abschnitt 5.1 oder 5.2 bestanden
- **widerlegt:** Gegenbeleg liegt vor
- **aufgegeben:** nach Abschnitt 6 beendet, Grund notiert

Die Wörter „bewiesen" und „gelöst" stehen nur bei Status **geprüft**.

---

## 6. Budget und Abbruch

Eine **Runde** ist ein Orchestrator-Durchgang mit höchstens 4 Subagenten. Rechenblöcke dauern höchstens 30 Minuten auf 4 Kernen. Nichts läuft im Hintergrund weiter, was nicht im Logbuch steht.

| Stufe | Rundenbudget |
|---|---|
| 0 | 2 |
| 1 | 8 |
| 2 | 12 (beide Spuren zusammen) |
| 3 | nach Freigabe festlegen |

Die Zahlen sind Startwerte. Nur Justus ändert sie.

**Abbruchregeln:**

1. **Budget erschöpft:** Stufe endet, Abschlussbericht mit dem Erreichten
2. **Stillstand:** 3 Runden in Folge ohne neues Artefakt mit Status geprüft: Spur endet mit Status aufgegeben
3. **Überholt:** Der Literaturwächter findet das Ziel anderswo gelöst: Arbeit stoppt sofort. Der Rest der Runde prüft das fremde Ergebnis nach
4. **Fundamentfehler:** Stufe 0 oder 1 findet einen Fehler in einer Quelle: Stopp, Bericht an Justus, keine Weiterarbeit auf dem fehlerhaften Fundament

Kein Agent verlängert ein Budget oder setzt eine Abbruchregel aus.

---

## 7. Literaturwache

Zu Beginn jeder Sitzung, vor jeder anderen Arbeit:

- neue Fassungen von arXiv:2609.14393 und arXiv:2609.22054
- neue Commits im Repo fallnlove/mm325_proof
- neue arXiv-Arbeiten zu „tensor rank", „matrix multiplication", „lower bound" in cs.CC seit dem letzten Eintrag

Ergebnis mit Datum in `lit/WACHE.md`, auch wenn nichts Neues da ist.

---

## 8. Aufbau des Repos

```
PROTOKOLL.md        diese Datei
CLAUDE.md           Kurzregeln, die jede Claude-Sitzung im Repo automatisch lädt
README.md           englische Übersicht für Außenstehende
STATUS.md           aktuelle Stufe, laufende Aufträge, verbrauchte Runden
LOG.md              ein Eintrag pro Runde, nur anhängen, nie umschreiben
behauptungen/       eine Datei pro Behauptung: Aussage, Status, Artefakt, Prüfer
versuche/           gescheiterte Ansätze mit Grund des Scheiterns
lean/               Lean-Projekt
verfahren/          Verfahren als Datendateien
pruefer/            die beiden Prüfprogramme
lit/                QUELLEN.md, WACHE.md, LIZENZEN.md, Notizen
```

Gescheiterte Ansätze bleiben erhalten. Wer einen Ansatz beginnt, liest zuerst `versuche/`.

Ein Logbuch-Eintrag enthält: Datum, Rundennummer, Aufträge, gelieferte Dateien, neuer Status je Behauptung, Entscheidung für die nächste Runde.

---

## 9. Veröffentlichung und Redlichkeit

- Das Repo ist öffentlich. Die README nennt offen, dass KI-Modelle die Arbeit leisten, und welche
- Fremde Ergebnisse werden mit Quelle genannt. Eine Formalisierung von Yangs Beweis ist Yangs Satz, nicht unserer
- Ein Ergebnis wird erst nach Status **geprüft** und nach Freigabe durch Justus öffentlich als Ergebnis bezeichnet
- Meldeweg nach Freigabe: Release im Repo mit Zenodo-DOI. Keine Mails, keine Posts, keine Pull Requests an fremde Repos durch Agenten
- Auch negative Ergebnisse (aufgegeben, mit Begründung) werden als Release festgehalten

---

## 10. Startauftrag für den Orchestrator-Chat

> Lies PROTOKOLL.md, STATUS.md und LOG.md im Repo. Führe zuerst die Literaturwache nach Abschnitt 7 aus. Arbeite dann die aktuelle Stufe in Runden nach Abschnitt 6 ab: höchstens 4 Subagenten pro Runde, jeder mit genau einem Auftrag und einer Zieldatei. Prüfe nichts selbst, sondern vergib Prüfaufträge nach Abschnitt 5. Schreibe nach jeder Runde LOG.md und STATUS.md und pushe. Halte an, sobald eine Abbruchregel greift oder das Fertig-Kriterium der Stufe erfüllt ist, und berichte in fünf Sätzen. Beginne keine neue Stufe ohne meine Freigabe.
