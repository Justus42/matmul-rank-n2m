# Protokoll: Exakter Rang kleiner Matrixmultiplikations-Formate

Stand: 26.11.2026 · Version 0.7 · Diese Datei ist das Gedächtnis des Projekts. Jeder Chat und jeder Subagent liest sie zuerst.

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
| 3×2×7 | 34 | 35 | untere Schranke: folgt aus B-002 (Lean, geprüft). Obere: Verfahren hier nachgerechnet (B-020, geprüft). Bis Version 0.6: noch nicht nachgerechnet |
| 4×2×4 | 26 | 26 | untere Schranke: Lean-Satz in diesem Repo (B-016), obere: Hopcroft-Kerr, hier nachgeprüft (B-010). Bis Version 0.4.1: 25 nach Yang v3 |
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

**Stufenwechsel:** Der Orchestrator wechselt von Stufe 0 zu 1 und von Stufe 1 zu 2 selbst, sobald das Fertig-Kriterium erfüllt und im Logbuch belegt ist. Stufe 3 hat seit Version 0.5 ein Budget. Sie beginnt, sobald die Auflagen aus Justus' Freigabe zu Stufe 2 erledigt sind. Nach Stufe 3 hält der Orchestrator an. Stufe 4 hat Justus mit Version 0.6 beschlossen. Sie beginnt mit seiner Startnachricht. Nach Stufe 4 hält der Orchestrator an. Stufe 5 hat Justus mit Version 0.7 beschlossen. Sie beginnt mit seiner Startnachricht. Nach Stufe 5 hält der Orchestrator an. Stufe 6 beginnt nur mit einer eigenen Startnachricht von Justus.

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

Endet eine Spur nach Abbruchregel 2, läuft die andere weiter. Ein Auftrag der Spur A darf einen Restfall der Fallunterscheidung in beide Richtungen angreifen: ihn ausschließen oder aus ihm ein Verfahren mit 25 bauen.

### Stufe 3: Erkundung 4×2×5 und 3×2×7

Bis Version 0.4.1 war Stufe 3 der volle Angriff auf 3×2×7. Seit Version 0.5 ist sie eine kurze Erkundung. Sie soll klären, ob sich der Angriff auf ein weiteres Format lohnt, und beweist selbst nichts.

Fragen je Format (4×2×5 bei Länge 31, 3×2×7 bei Länge 34):

- Welche Teile der Lean-Kette zu 4×2×4 gelten unabhängig vom Format, welche sind auf 4×2×4 zugeschnitten?
- Wie viele Restfälle bleiben, wenn man die Fallunterscheidung aus Stufe 2 auf das Format anwendet? Das ist eine Rechnung. Zwei Subagenten führen sie unabhängig voneinander durch, mit eigenen Programmen
- Trägt das Abzählargument am Ende der Kette (Schnittpunkte gegen verschiedene Punkte), oder geht die Rechnung dort nicht auf?

Dazu für 4×2×5 die Gegenrichtung: Suche nach einem Verfahren mit 31, geprüft nach 5.2.

Nichts aus Stufe 3 erhält den Status geprüft, außer einem nach 5.2 bestätigten Verfahren. Alles andere bleibt vermutet oder behauptet.

**Fertig, wenn:** je Format eine Einschätzung unter `erkundung/` liegt: Zahl und Liste der Restfälle mit beiden Rechnungen, übertragbare und nicht übertragbare Teile, Empfehlung „Angriff lohnt" oder „lohnt nicht" mit Begründung. Oder wenn das Budget erschöpft ist.

### Stufe 4: 3×2×7 (34 oder 35?), enger Angriff auf den einen Restfall

Grundlage ist die Einschätzung `erkundung/s3-08-einschaetzung-327.md`. Danach bleibt bei Länge 34 genau ein Restfall. Die Kette zu 4×2×4 überträgt sich nicht. Gebraucht wird ein neues Argument oder ein Verfahren. Die Erfolgschance ist gering. Ein sauber begründetes Scheitern ist ein zulässiges Ergebnis dieser Stufe.

**Runde 1 ist nur Prüfung der Grundlage.** Es laufen ausschließlich:

- Prüfer für die Restfall-Rechnung, für Lemma 15(b) bei d = 2 und für die Übertragung von Lemma I auf die Normalform
- die Nachrechnung des bekannten Verfahrens mit 35 für 3×2×7 nach 5.2. Ohne geprüfte obere Schranke lässt sich der Rang am Ende nicht benennen
- der unabhängige Sucher (bis Version 0.6: Blind-Sucher)

Ergibt die Prüfung mehr als zwei Restfälle oder einen Fehler in einem der beiden Lemmata, der sich in Runde 1 nicht beheben lässt, hält der Orchestrator an und berichtet.

**Ab Runde 2 zwei Spuren,** parallel und gleichberechtigt wie in Stufe 2:

- **Spur A (Ausschluss):** Prosa-Beweis, dass der Restfall unmöglich ist. Lean erst, wenn ein Prüfer und das Fremdmodell den Prosa-Beweis bestätigt haben
- **Spur B (Verfahren):** Suche nach einem Verfahren mit 34. Die im Restfall erzwungenen Kenngrößen dienen als Vorgabe. Zu jedem Fund gehört die Angabe, über welchen Körpern er gilt

Ein Auftrag der Spur A darf den Restfall in beide Richtungen angreifen.

**Fertig, wenn:** entweder ein Lean-Satz für die untere Schranke 35 über jedem Körper vorliegt, geprüft nach 5.1 samt Abgleich des Endsatzes, oder ein nach 5.2 bestätigtes Verfahren mit 34. Oder wenn das Budget erschöpft ist oder eine Abbruchregel beide Spuren beendet.

**Auslegungsfragen in Stufe 4:** Justus ist während dieser Stufe nicht ständig erreichbar. Löst eine Auslegungsfrage keine Abbruchregel aus, nimmt der Orchestrator die strengere Lesart, vermerkt sie im Logbuch und arbeitet weiter. Würde die strengere Lesart eine Spur oder die Stufe beenden, hält er an und fragt.

Nichts aus Stufe 4 wird ohne Freigabe von Justus öffentlich als Ergebnis bezeichnet. README und `ergebnisse/` bleiben unverändert.

### Stufe 5: Portierung für das Register Palomar und Festigung der Kette zu 3×2×7

Beschlossen von Justus mit Version 0.7. Zwei Spuren laufen parallel. Stufe 5 ist kein neuer Beweisangriff.

Ausgangslage: Der Endsatz zu 4×2×4 (B-016) ist geprüft und seit Auflage 7 vom Paket `mm325_proof` gelöst. Für 3×2×7 liegt aus Stufe 4 eine vollständige Kette von Behauptungen vor, aus der die untere Schranke 35 folgen würde. Diese Kette ist nicht geprüft.

**Spur P (Portierung, Einreichung vorbereiten)**

Ziel: Die Lean-Bibliothek erfüllt die Regeln des Registers Palomar (palomar-registry.org), so dass Justus den Endsatz zu 4×2×4 dort einreichen kann.

- Maßgeblich sind die Regeln von Palomar am Tag der Arbeit: `CONTRIBUTING.md` im Repo PalomarRegistry/PalomarPolicy und `toolchains.json` im Repo PalomarRegistry/PalomarSubmission. Der erste Auftrag der Spur liest sie und legt die Anforderungen mit Fundstellen in `palomar/ANFORDERUNGEN.md` ab. Stand 26.11.2026: mindestens Lean 4.35.0-rc2, Modulsystem in jeder Lean-Datei, die Aussagen-Datei baut nur auf Lean-Kern und Mathlib
- Vor Beginn setzt der Orchestrator das Tag `lean-4.19` auf den letzten Stand von `main` mit Lean 4.19.0
- Die Portierung läuft auf dem Sammelzweig `portierung`. Pull Requests der Spur P gehen dorthin, nicht nach `main`. `main` bleibt grün
- Ein Portierungsauftrag darf alle Dateien unter `lean/` und die zugehörigen Workflows ändern. Seine Zieldatei ist sein Bericht
- Geändert werden Importe, Syntax, Namen aus Mathlib und Beweiskörper. Aussagen und Definitionen bleiben inhaltlich gleich. Jede Änderung am Wortlaut einer Aussage oder Definition der Kette steht im Bericht, mit altem und neuem Wortlaut
- Die Brücke zu `mm325_proof` (`BrueckeMM325.lean`, `AxiomsMM325.lean`) und die Abhängigkeit selbst entfallen auf dem Sammelzweig. Sie bleiben über das Tag erreichbar
- Dazu kommen die Dateien, die Palomar verlangt: Aussagen-Datei, Lösungs-Modul, `comparator.json`, `formalization.yaml`. Die Felder für Autoren und verantwortliche Betreuer füllt nur Justus. KI-Systeme stehen im Feld für die verwendeten Methoden
- Die Aussagen-Datei enthält die Definition des Tensorrangs und die Aussage zu 4×2×4. Reicht das Budget, kommt die obere Schranke 26 als Lean-Satz dazu, so dass die Aussage „Rang gleich 26" lautet. Welche weiteren Sätze in die Einreichung kommen, entscheidet Justus
- Kein Agent reicht ein, und kein Agent ruft das Einreichformular auf

**Fertig (Spur P), wenn:** der Sammelzweig in Actions grün baut, ohne `sorry`, mit Axiom-Bericht für den Endsatz; jede Anforderung aus `palomar/ANFORDERUNGEN.md` einzeln belegt ist; der Aussagen-Abgleich nach 5.1 für die Aussagen-Datei bestanden ist (ein Prüfer und ein Fremdmodell); der Sammelzweig nach `main` gemergt und der Zweitlauf dort wiederholt ist. Dann berichtet der Orchestrator sofort an Justus und arbeitet in Spur K weiter.

**Spur K (Kette zu 3×2×7 festigen)**

Ziel: klären, ob die Kette aus Stufe 4 trägt, bevor jemand sie formalisiert. In dieser Spur entsteht kein Lean.

- Runde 1: ein zusammenhängender Beweis in einer Datei, `lean/prosa/s5_327_kette.md`. Er enthält jedes Glied mit vollständigem Wortlaut und Beweis und nennt jede Voraussetzung. Er berichtigt Lemma F (die Formen sind ungleich null) und den zu engen Wortlaut in S4-27-C. Am Ende steht eine Liste der Glieder mit ihren Abhängigkeiten
- Ab Runde 2: Jedes Glied dieser Datei lesen zwei Prüfer, die einander nicht sehen. Urteile aus Stufe 4 zählen dafür nicht
- Findet ein Prüfer eine Lücke, bekommt ein Beweissucher in der nächsten Runde den Auftrag, sie zu schließen oder zu bestätigen. Eine bestätigte Lücke ist ein Ergebnis dieser Spur
- Fremdmodell: höchstens drei Anfragen, jede zu einem Glied, das zwei Prüfer bestätigt haben

**Fertig (Spur K), wenn:** jedes Glied zwei unabhängige Bestätigungen hat, oder eine Lücke bestätigt ist, die sich in zwei Runden nicht schließen ließ. Der Status bleibt in beiden Fällen behauptet.

**Fortschritt nach Abbruchregel 2 in Stufe 5:**

- Spur P: Mindestens ein Modul der Kette baut neu auf dem Sammelzweig, oder eine Anforderung aus `palomar/ANFORDERUNGEN.md` ist neu erfüllt
- Spur K: Mindestens ein Glied erhält eine neue unabhängige Bestätigung, oder eine Lücke wird gefunden oder geschlossen

**Fertig (Stufe 5), wenn:** beide Spuren fertig sind, das Budget erschöpft ist oder Abbruchregeln beide Spuren beendet haben. Danach hält der Orchestrator an.

In Stufe 5 läuft kein unabhängiger Sucher. Die Regel zu Auslegungsfragen aus Stufe 4 gilt auch hier. Nichts aus Stufe 5 wird ohne Freigabe von Justus öffentlich als Ergebnis bezeichnet. `ergebnisse/` bleibt unverändert, die README nennt nur den Stand.

### Stufe 6: 3×2×7 in Lean (vorgesehen)

Stufe 6 beginnt nur mit einer Startnachricht von Justus nach dem Bericht zu Stufe 5, und nur, wenn Spur K ohne bestätigte Lücke geendet hat. Ziel ist ein Lean-Satz für die untere Schranke 35 über jedem Körper, geprüft nach 5.1, auf der Lean-Version aus Spur P. Einzelheiten legt Justus mit der Startnachricht fest.

---

## 4. Rollen

**Orchestrator** (der Chat): plant Runden, vergibt Aufträge, führt das Logbuch, entscheidet über Fortsetzen oder Abbruch nach Abschnitt 6. Er führt das Projekt ohne Rückfragen; seine Rechte und Grenzen stehen in Abschnitt 11. Er beweist und prüft nicht selbst.

**Subagenten** bekommen genau einen Auftrag und liefern genau eine Datei:

| Rolle | Auftrag | bekommt zu sehen |
|---|---|---|
| Beweissucher | Prosa-Beweis oder Teil-Lemma | Protokoll, Quellen, Logbuch |
| Unabhängiger Sucher (bis Version 0.6: Blind-Sucher) | wie Beweissucher | **nur** die Problemstellung |
| Verfahrenssucher | Verfahren mit vorgegebenem Rang | Protokoll, Prüfprogramm |
| Formalisierer | Lean-Fassung eines Prosa-Beweises | Prosa-Beweis, Lean-Bestand |
| Prüfer | eine Behauptung bestätigen oder widerlegen | **nur** Behauptung und Artefakt, keine Vorgeschichte |
| Literaturwächter | neue Arbeiten zum Thema finden | Quellenliste |

In den Stufen 2 bis 4 läuft pro Runde mindestens ein unabhängiger Sucher. Die Plattform blendet jedem Thread den Index des Projektgedächtnisses ein. „Blind" heißt ein Sucher deshalb nur, wenn ihm nachweislich nichts eingeblendet war. Prüfer sehen nie die Urteile früherer Prüfer.

**Positivliste:** Jeder Auftrag an einen Prüfer oder unabhängigen Sucher nennt die Dateien, die er lesen darf. Alles andere ist für ihn gesperrt, ausdrücklich auch `STATUS.md`, `LOG.md`, `pruefvermerke/` und `archiv/`. Ein Prüfer liest von diesem Protokoll nur Abschnitt 5. Ein unabhängiger Sucher liest nur `CLAUDE.md` und die Problemstellung in seinem Auftrag.

Die Positivliste nennt genaue Dateipfade und, wo nötig, die Nummer eines Actions-Jobs. Verzeichnislisten, Lauflisten und Commit-Listen gehören nicht hinein. Ein Auftrag an einen Prüfer nennt weder Fristen noch Zählerstände noch ein erwünschtes Ergebnis.

**Projektgedächtnis:** Prüfurteile, Befunde und Zwischenstände gehören nicht ins Projektgedächtnis. Sie stehen im Repo. Wer als Prüfer oder unabhängiger Sucher trotzdem etwas eingeblendet bekommt, legt es in seinem Bericht offen.

**Fremdmodell:** Ein Modell einer anderen Familie liest gegen, über die Bridge oder von Justus selbst weitergereicht. Wann, regelt Abschnitt 5.5.

**Justus:** legt Budgets fest, ändert Protokoll und CLAUDE.md, entscheidet über Veröffentlichung und Kontakt nach außen, kann jederzeit stoppen.

---

## 5. Prüfpflicht

Nichts gilt als wahr, weil ein Agent es sagt.

### 5.1 Beweise

1. Lean-Build läuft durch, ohne `sorry` und ohne eigene Axiome
2. `#print axioms` zeigt nur Standard-Axiome
3. Aussagen-Abgleich: Zwei Leser bestätigen unabhängig voneinander, dass der Lean-Satz die behauptete Aussage ist (richtiges Format, richtiger Körper, richtige Zahl). Beim Endsatz einer Stufe sind das ein Prüfer und ein Fremdmodell. Bei Zwischenaussagen genügen zwei Prüfer, die einander nicht sehen
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

Den Status setzt nur der Orchestrator, nie der Prüfer selbst.

### 5.4 Trennung der Prüfvermerke

- `behauptungen/B-xxx.md` enthält nur Aussage, Herkunft und Artefakt
- Status, Prüfurteile, Vorbehalte und die Übersicht stehen in `pruefvermerke/`
- Eine Prüfung ist ungültig, wenn der Prüfer vor seinem Urteil ein Urteil zur selben Behauptung gesehen hat oder wusste, welches Ergebnis erwünscht ist oder was von seinem Urteil abhängt
- Bloße Spuren früherer Prüfungen (Dateinamen, Verweise in Quelltext-Kommentaren) machen eine Prüfung nicht ungültig. Der Prüfer legt sie offen
- Eine ungültige Prüfung wird einmal mit einem unbeeinflussten Prüfer wiederholt. Ist auch die Wiederholung ungültig, zählt ein vorhandenes unbeeinflusstes Urteil des Fremdmodells allein, mit Vermerk. Fehlt ein solches, bleibt der Status behauptet
- Ein Urteil des Fremdmodells bleibt gültig, wenn das Fremdmodell selbst weder ein Urteil gesehen hat noch das erwünschte Ergebnis kannte

Abschnitt 5 nennt keine einzelne Behauptung und keinen Prüfstand, weil Prüfer ihn lesen. Übergangsregeln stehen in Abschnitt 6.

### 5.5 Fremdmodelle sparsam

Anfragen an ein Fremdmodell kosten Justus eigenes Geld. Ein Fremdmodell wird nur eingesetzt für:

- den Aussagen-Abgleich des Endsatzes einer Stufe
- neue Prosa-Beweise, die als Fortschritt nach Abbruchregel 2 b) zählen sollen oder sonst eine Abbruchregel berühren

Ein vorhandenes, unbeeinflusstes Urteil wird weiterverwendet und nicht neu angefragt. Standard ist GPT 6.2 Sol mit hoher Denkstufe als Batch über die Bridge.

---

## 6. Budget und Abbruch

Eine **Runde** ist ein Orchestrator-Durchgang mit höchstens 4 Subagenten, ab Runde 9 der Stufe 2 mit höchstens 6. Aufträge einer Runde hängen nie voneinander ab; Abhängigkeiten gibt es nur zwischen Runden. Rechenblöcke dauern höchstens 30 Minuten auf 4 Kernen. Nichts läuft im Hintergrund weiter, was nicht im Logbuch steht.

Subagenten vergeben keine eigenen Subagenten. Braucht ein Auftrag Hilfe, meldet der Thread das dem Orchestrator, und der vergibt einen eigenen Platz.

| Stufe | Rundenbudget |
|---|---|
| 0 | 2 |
| 1 | 8 |
| 2 | 24 (beide Spuren zusammen; bis Version 0.3: 12) |
| 3 | 2, je bis zu 6 Subagenten, keine Fremdmodell-Anfrage |
| 4 | 6, je bis zu 6 Subagenten, Fremdmodell nur nach 5.5 |
| 5 | 6 (beide Spuren zusammen), je bis zu 6 Subagenten, höchstens 4 Fremdmodell-Anfragen (eine für den Abgleich in Spur P, drei in Spur K) |
| 6 | 12, je bis zu 6 Subagenten, erst nach Startnachricht von Justus |

Die Zahlen sind Startwerte. Nur Justus ändert sie.

**Abbruchregeln:**

1. **Budget erschöpft:** Stufe endet, Abschlussbericht mit dem Erreichten
2. **Stillstand:** 3 Runden in Folge ohne Fortschritt: Spur endet mit Status aufgegeben. Als Fortschritt einer Runde zählt nur:
   - a) ein neues Artefakt mit Status geprüft, das eine Schranke des Zielformats ändert oder einen benannten Fall der Fallunterscheidung ausschließt
   - b) eine neue Behauptung dieser Art mit Status behauptet, die ein Prüfer und ein Fremdmodell unabhängig voneinander bestätigt haben. Sie muss bis zum Ende der übernächsten Runde Status geprüft haben. Sonst zählt sie nachträglich nicht, und der Zähler wird neu berechnet

   In Stufe 5 gilt stattdessen die Fortschrittsregel aus Abschnitt 3.

   Die Bestätigung eines schon bekannten Werts zählt nicht. Jeder Runden-Eintrag im Logbuch nennt den Zählerstand je Spur und, bei Fortschritt nach b), die Frist.

   Übergang zu Version 0.3: B-008 und B-009 zählen als Fortschritt von Spur A in Runde 3 der Stufe 2. Ihre Frist für Status geprüft ist das Ende von Runde 5. B-010 zählt nicht.

   Übergang zu Version 0.4 (bis Version 0.4 in Abschnitt 5.4, verschoben, weil Prüfer Abschnitt 5 lesen): Die Aussagen-Abgleiche zu B-008, B-009, B-012 und B-013 und die Prosa-Prüfung von B-014 werden in Runde 9 der Stufe 2 mit unbeeinflussten Prüfern wiederholt. Die vorhandenen Urteile von GPT 6.2 Sol gelten weiter. Bestätigen die neuen Prüfer die vier Abgleiche, gelten die Fristen aus Runde 3 und Runde 6 als gehalten. Bestätigt der neue Prüfer B-014, zählt das als Fortschritt in Runde 9, mit Frist Ende Runde 11. Bis dahin bleiben die Statuseinträge mit Vorbehalt stehen.
3. **Überholt:** Der Literaturwächter findet das Ziel anderswo gelöst: Arbeit stoppt sofort. Der Rest der Runde prüft das fremde Ergebnis nach
4. **Fundamentfehler:** Stufe 0 oder 1 findet einen Fehler in einer Quelle: Stopp, Bericht an Justus, keine Weiterarbeit auf dem fehlerhaften Fundament

Kein Agent verlängert ein Budget oder setzt eine Abbruchregel aus. Das gilt auch für den Orchestrator.

---

## 7. Literaturwache

Zu Beginn jeder Sitzung, vor jeder anderen Arbeit:

- neue Fassungen von arXiv:2609.14393 und arXiv:2609.22054
- neue Commits im Repo fallnlove/mm325_proof
- neue arXiv-Arbeiten zu „tensor rank", „matrix multiplication", „lower bound" in cs.CC seit dem letzten Eintrag
- im Repo github.com/openai/math: neue Commits, neue Familien in `CONTENTS.md`, neue Verzeichnisse in `preprints/` (Entscheidung von Justus vom 25.11.2026)
- im Register Palomar (palomar-registry.org): Einträge zum Tensorrang von Matrixmultiplikations-Formaten (seit Version 0.7)

Ergebnis mit Datum in `lit/WACHE.md`, auch wenn nichts Neues da ist.

---

## 8. Aufbau des Repos

```
PROTOKOLL.md        diese Datei
CLAUDE.md           Kurzregeln, die jede Claude-Sitzung im Repo automatisch lädt
README.md           englische Übersicht für Außenstehende
STATUS.md           aktuelle Stufe, laufende Aufträge, verbrauchte Runden
LOG.md              ein Eintrag pro Runde, nur anhängen, nie umschreiben
behauptungen/       eine Datei pro Behauptung: Aussage, Herkunft, Artefakt
pruefvermerke/      Status, Prüfurteile, Vorbehalte, Übersicht (für Prüfer gesperrt)
archiv/             ausgelagerte Altbestände (für Prüfer und unabhängige Sucher gesperrt)
versuche/           gescheiterte Ansätze mit Grund des Scheiterns
lean/               Lean-Projekt
verfahren/          Verfahren als Datendateien
pruefer/            die beiden Prüfprogramme
lit/                QUELLEN.md, WACHE.md, LIZENZEN.md, Notizen
palomar/            Anforderungen des Registers und Belege (seit Stufe 5)
```

Gescheiterte Ansätze bleiben erhalten. Wer einen Ansatz beginnt, liest zuerst `versuche/`.

Ein Logbuch-Eintrag enthält: Datum, Rundennummer, Aufträge, gelieferte Dateien, neuer Status je Behauptung, Entscheidung für die nächste Runde.

Dazu der Verbrauch der Runde: Zahl der Subagenten, Dauer von der Vergabe bis zum letzten Merge, Zahl der Fremdmodell-Anfragen. Dauern stammen aus den Git-Zeitstempeln, nicht aus Angaben der Threads.

---

## 9. Veröffentlichung und Redlichkeit

- Das Repo ist öffentlich. Die README nennt offen, dass KI-Modelle die Arbeit leisten, und welche
- Fremde Ergebnisse werden mit Quelle genannt. Eine Formalisierung von Yangs Beweis ist Yangs Satz, nicht unserer
- Ein Ergebnis wird erst nach Status **geprüft** und nach Freigabe durch Justus öffentlich als Ergebnis bezeichnet
- Meldeweg nach Freigabe: Eintrag im Register Palomar und Release im Repo mit Zenodo-DOI. Bei Palomar reicht nur Justus selbst ein. Keine Mails, keine Posts, keine Einreichungen, keine Pull Requests an fremde Repos durch Agenten
- Auch negative Ergebnisse (aufgegeben, mit Begründung) werden als Release festgehalten

---

## 10. Startauftrag für den Orchestrator-Chat

> Lies PROTOKOLL.md, STATUS.md und LOG.md im Repo. Du bist der Orchestrator mit den Rechten aus Abschnitt 11. Führe zuerst die Literaturwache nach Abschnitt 7 aus. Arbeite dann die aktuelle Stufe in Runden nach Abschnitt 6 ab: höchstens so viele Subagenten pro Runde, wie Abschnitt 6 erlaubt, jeder mit genau einem Auftrag und einer Zieldatei, keine Abhängigkeiten innerhalb einer Runde. Gib Prüfern und unabhängigen Suchern eine Positivliste nach Abschnitt 4. Prüfe nichts selbst, sondern vergib Prüfaufträge nach Abschnitt 5. Beantworte Rückfragen der Threads selbst und merge ihre Pull Requests nach Abschnitt 11.2. Schreibe nach jeder Runde LOG.md und STATUS.md und stelle sie ein. Wechsle die Stufe nach Abschnitt 3 selbst. Halte nur in den Fällen aus Abschnitt 11.4 an und berichte dann in fünf Sätzen.

---

## 11. Git-Regeln und Rechte des Orchestrators

Testweise seit 25.11.2026: Der Orchestrator führt das Projekt ohne Rückfragen an Justus.

### 11.1 Für jeden Thread und Subagenten

- Committe deine Zieldatei ohne Rückfrage, pushe auf deinen eigenen Zweig und öffne einen Pull Request. Der Titel beginnt mit der Auftragsnummer
- Ändere nur Dateien deines Auftrags
- Kein Force-Push, keine Änderung an der Historie
- Rückfragen gehen an den Orchestrator, nicht an Justus
- Commit-Betreffe und Titel von Pull Requests nennen Auftragsnummer und Gegenstand. Sie nennen keine Zählerstände, Fristen, Budgets, Statuswörter oder Urteile, weil Prüfer die Git-Historie sehen. Das gilt auch für den Orchestrator und seine Schreibhand
- In Spur P der Stufe 5 ist der Sammelzweig `portierung` das Ziel der Pull Requests

### 11.2 Rechte des Orchestrators

- Pull Requests der Threads mergen, schließen oder zur Nacharbeit zurückgeben
- Rückfragen der Threads selbst beantworten
- Aufträge anlegen, ändern, neu vergeben oder streichen
- STATUS.md, LOG.md und die Übersicht in `behauptungen/` pflegen und direkt einstellen
- Stufenwechsel nach Abschnitt 3
- Lizenzfragen nach 11.3 entscheiden
- GitHub Actions einrichten, Zweige nach dem Merge löschen

**Merge-Bedingungen:** Der Pull Request ändert nur Dateien seines Auftrags. Er ändert weder PROTOKOLL.md noch CLAUDE.md. LOG.md wird höchstens ergänzt.

**Ein Merge ändert keinen Status.** Was auf `main` liegt, ist damit nicht geprüft. Den Status ändert allein die Prüfung nach Abschnitt 5.

**Falls die Plattform das Mergen verweigert:** Pull Requests der Runde sammeln, Justus einmal pro Runde um den Merge bitten, im Logbuch vermerken.

### 11.3 Lizenzregel

- Fremder Code mit klarer offener Lizenz (Apache 2.0, MIT, BSD): Übernahme erlaubt, mit Quelle und Lizenz in `lit/LIZENZEN.md` und im Kopf der Datei
- Keine oder unklare Lizenz: keine Kopie ins Repo. Stattdessen als externe Abhängigkeit einbinden (Verweis statt Kopie) oder aus dem Paper neu schreiben
- Im Zweifel gilt die zweite Regel

### 11.4 Grenzen

Auch der Orchestrator darf nicht:

- ein Budget verlängern oder eine Abbruchregel aussetzen (Abschnitt 6)
- PROTOKOLL.md oder CLAUDE.md ändern
- selbst beweisen oder prüfen (Abschnitte 4 und 5)
- etwas veröffentlichen oder nach außen Kontakt aufnehmen (Abschnitt 9)
- über Stufe 5 hinaus weiterarbeiten, in Stufe 5 einen neuen Beweisangriff beginnen oder bei einem Register etwas einreichen

Er hält an und berichtet an Justus, wenn:

- eine Abbruchregel greift
- das Fertig-Kriterium von Stufe 2, 3, 4 oder 5 erfüllt ist. Ist in Stufe 5 nur Spur P fertig, berichtet er und arbeitet in Spur K weiter
- die Plattform eine nötige Aktion verweigert und es keinen Ausweg nach diesem Protokoll gibt
- eine Regel dieses Protokolls geändert werden müsste, um weiterzukommen
