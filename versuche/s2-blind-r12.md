# S2-60: Blind-Suche zum Rang von ⟨4,2,4⟩, Runde 12

Auftrag S2-60, Blind-Sucher, 25.11.2026. Status aller Aussagen hier: **behauptet** bzw. **vermutet**, bis der Orchestrator nach Prüfung anders entscheidet.

## 1. Eingeblendete Hinweise (wörtlich)

Mir wurden ohne eigenes Zutun folgende Inhalte des Projektgedächtnisses eingeblendet. Ich gebe sie wörtlich wieder, wie gefordert.

### 1.1 Index `team/silo/MEMORY.md` (zu Sitzungsbeginn)

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von &lt;n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 25.11.2026 Version 0.4.1 (von Justus).
- Person schreibt Deutsch.
- Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
- Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
- Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4: kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, Stufe 3 nur mit Budget. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert oder ausgelegt werden müsste.
- Justus am 25.11.2026, wörtlich: „Freigabe zu weiteren Runden nach deinem Ermessen“. Stufe 3 braucht ein eigenes Budget.
- Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
- Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
- Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
- Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
- Protokoll Abschnitt 6: höchstens 6 Subagenten pro Runde (Stufe 2 ab Runde 9), 24 Runden für Stufe 2, Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
- Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung, letzte am 25.11.2026 11:47 UTC.
- Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
- Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
- [[verfahren-datenformat]]: Datenformat der Verfahren
- [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht
```

### 1.2 Einzeleinträge (eingeblendet nach dem ersten Repo-Zugriff)

`git-regeln.md`:
```
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

`verfahren-datenformat.md`:
```
---
name: verfahren-datenformat
description: Stand von A-07 (Datenformat für Verfahren in verfahren/README.md): Entwurf, Kernentscheidungen, offen für Freigabe
metadata:
  type: project
  modified: 2026-11-24T23:40:35.041Z
---

A-07 Entwurf (24.11.2026) liegt auf Branch `claude/project-thread-by3y8e`, PR #1 am 24.11.2026 nach main gemergt. Nachtrag PR #3 gemergt; Orchestrator hat die zehn Annahmen am 24.11.2026 unverändert bestätigt. Kopie: /mnt/project-files/a07/verfahren-README.md.

Kernentscheidungen (als Annahmen markiert, Justus muss bestätigen): JSON, englische Schlüssel, Koeffizienten als Zeichenketten "a/b", dichte Matrizen u (n×k), v (k×m), w (n×m, NICHT transponiert), ring ∈ Z | Q | GF(p), Status nicht in der Datei sondern in behauptungen/, Prüfer-Ausgabe ANGENOMMEN/ABGELEHNT/FEHLERHAFT mit Exit 0/1/2, Dateiname `<n>x<k>x<m>-r<rank>-<kurzname>.json`.

**How to apply:** A-08/A-09 (Prüfprogramme) und A-10 bauen auf diesem Format auf; vorher prüfen, ob der Orchestrator die Annahmen bestätigt hat (seit Protokoll 0.2 seine Rolle).
```

`verfahren-randfaelle-s1-04.md`:
```
---
name: verfahren-randfaelle-s1-04
description: S1-04 (25.11.2026): Randfälle des Verfahrensformats in verfahren/README.md Abschnitt 9/10 festgelegt, PR #12 gemergt
metadata:
  type: project
  modified: 2026-11-25T00:37:53.462Z
---

S1-04, 25.11.2026: `verfahren/README.md` um Abschnitt 9 (Randfälle, strengere Lesart) und 10 (Anpassungsbedarf der Prüfer) ergänzt, PR #12 gemergt (e8d9cb0). Formatversion bleibt 1.

- Orchestrator-Vorgaben: Zusatzschlüssel überall FEHLERHAFT (auch origin), ungültiges Kalenderdatum FEHLERHAFT, doppelte JSON-Schlüssel FEHLERHAFT. "-0", "-0/5", "0/5" bleiben erlaubt (Orchestrator bestätigt).
- GF(p): p < 2^64. Leere Zeichenketten in origin/claim/notes FEHLERHAFT, null bei optionalen Feldern FEHLERHAFT.
- Muss-Anpassungen: Python (Kalenderdatum, p ≥ 2^64 ablehnen), Rust (Zusatzschlüssel in origin ablehnen). Weitere Prüfpunkte in Abschnitt 10. Programme ändern ist getrennter Auftrag.

**How to apply:** Neue Verfahrensdateien und Prüfer-Aufträge an Abschnitt 9 ausrichten. Verwandt: [[verfahren-datenformat]], [[hk-verfahren-a10]]
```

`hk-verfahren-a10.md`:
```
---
name: hk-verfahren-a10
description: A-10: Verfahrensdateien 3x2x5 r25 und 3x2x6 r30 (ring Z) liegen in verfahren/, PR #11; Formatfallen
metadata:
  type: project
---

A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 (cac2c55).

**How to apply:** Bekannte Verfahren nicht neu bauen; bei neuen Verfahrensdateien Zusatzschlüssel in origin und ungültige Daten meiden (siehe verfahren/README.md Abschnitt 9). Verwandt: [[verfahren-datenformat]]
```

### 1.3 Sonstige Hinweise

- Die Repo-Datei `CLAUDE.md` wurde automatisch eingeblendet (erlaubt laut Positivliste).
- Aus dem Repo habe ich sonst nichts gelesen. Einzige Berührung: Ich habe beim Anlegen des Zweigs geprüft, ob der Pfad `versuche/s2-blind-r12.md` schon existiert (Dateiliste von `versuche/` gezählt, nicht gelesen).
- Einfluss auf meine Arbeit: Die Einträge enthalten nichts zu <4,2,4> selbst außer der Zielangabe im Index. Das Format-Wissen aus `verfahren-datenformat` habe ich nicht verwendet; das Verfahren in Abschnitt 4 steht in meinem eigenen Bitformat.

## 2. Gewählter Weg

Zweigleisig: (a) kurzer Blick in die öffentliche Literatur nach dem Stand der unteren Schranke, (b) eine eigene Flip-Graph-Suche über GF(2) (Zufallswanderung im Raum der Verfahren nach Kauers und Moosbauer), mit dem Ziel, aus dem Standardverfahren (32 Produkte) über 26 zu einem Verfahren mit 25 Produkten zu kommen. Keine Fremdmodell-Anfragen. Ein Subagent (Webseiten-Leser) für die Literatur.

## 3. Literatur (öffentlich, von mir nicht geprüft)

- J. Yang, „New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6“, arXiv:2609.14393 (Sept. 2026). Satz 2 laut Text: für m ≥ n ≥ 4 gilt R(⟨n,2,m⟩) ≥ (n+2)m + (n−3), über beliebigen Körpern. Für ⟨4,2,4⟩ ergibt das **R ≥ 25**. Der Autor schreibt, die Schranke liege eins unter der bekannten oberen Schranke. Satz 1: R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉.
- Obere Schranke 26 nach Hopcroft und Kerr (1971), Formel ⌈(3nm + max(n,m))/2⌉.
- C. Wang, arXiv:2603.07280 (automatisierte untere Schranken über F₂) behandelt ⟨4,2,4⟩ nicht.

Damit wäre die Lücke laut Literatur genau 25 gegen 26. Diese Schranke habe ich nicht nachgerechnet; sie ist hier nur **vermutet**, bis jemand den Beweis prüft.

## 4. Eigene Suche: Flip-Graph über GF(2)

### 4.1 Verfahren

- Darstellung: jedes Produkt als Tripel (a, b, c) von Bitmasken. a: Bit i·2+j für A_ij (4×2), b: Bit j·4+k für B_jk (2×4), c: Bit i·4+k für C_ik (4×4, nicht transponiert). Verfahren ist korrekt, wenn Σ a⊗b⊗c = Σ_{i,j,k} e(A_ij)⊗e(B_jk)⊗e(C_ik) über GF(2). Es gilt also C_ik = Σ_r c_r[ik]·(a_r·A)(b_r·B).
- Züge: Flip (zwei Produkte mit gleichem Faktor in einer Stelle: (x,y,z)+(x,y',z') → (x,y+y',z)+(x,y',z'+z)), Reduktion (zwei Produkte stimmen in zwei Stellen überein → zusammenfassen), bei Sackgasse oder nach langer Plateauphase ein „Plus“-Zug (Rang +1), Neustart vom Standardverfahren nach erfolgloser Plateauphase.
- Jedes gefundene Verfahren mit Rang ≤ 26 wurde mit einer unabhängigen Python-Routine gegen den Tensor geprüft (0 Fehler).

### 4.2 Läufe

| Lauf | Kerne | Dauer | Plateau | Ergebnis |
|---|---|---|---|---|
| Vortests | 1–4 | ca. 2 + 4 Min. | 1e5, 1e6, 5e6 | Rang 27 bei Plateau 1e5, Rang 26 ab Plateau 1e6 |
| Hauptlauf | 4 | ca. 32 Min. Wanduhr (21:44–22:16 UTC) | 2e6 | bester Rang **26**, kein Rang 25 |
| Raten-Messung | 1 | 20 s | 2e6 | ca. 0,5 Mio. Züge/s je Kern |

**Regelverstoß, offen gemeldet:** Der Hauptlauf war auf 25 Minuten angelegt, aber die Zeitprüfung im Programm saß nur in der äußeren Schleife. Die Läufe blieben im Rang-26-Plateau hängen, liefen etwa 32 Minuten und wurden von mir von Hand abgebrochen. Damit habe ich die Grenze von 30 Minuten um etwa 2 Minuten überschritten. Der Fehler ist im Programm behoben (Zeitprüfung alle 65536 Züge). Beim Abbruch ging gepufferte Ausgabe verloren, darunter die Zählerstände der Züge; die Zahl der Züge ist daher nur geschätzt.

Geschätzter Umfang des Hauptlaufs: 4 Kerne × ca. 1900 s × ca. 0,5 Mio. Züge/s ≈ **4·10⁹ Flip-Züge**. Wie viele davon auf Rang 26 lagen, ist wegen der verlorenen Zähler unbekannt.

### 4.3 Vorrat

- **186** verschiedene Verfahren mit Rang 26 über GF(2) (verschieden als Termlisten, alle verifiziert).
- Als Invariante unter der Symmetriegruppe (GL₄ × GL₂ × GL₄ als Basiswechsel und Transposition, die die Rollen von a und b tauscht) habe ich das Rangprofil benutzt: die Multimenge der Tripel (Rang a als 4×2-Matrix, Rang b als 2×4-Matrix, Rang c als 4×4-Matrix). Es gibt **21 verschiedene Rangprofile**, also mindestens 21 nicht äquivalente 26er-Verfahren. Wie viele Bahnen die 186 Verfahren genau bilden, habe ich nicht bestimmt.
- Auffällig (**vermutet**, nur beobachtet): Jedes der 186 Verfahren hat genau **6 Produkte mit Profil (2,2,2)**, der Rest hat in a und b Rang 1 (bis auf höchstens zwei Ausnahmen mit Rang 2 in einer Stelle). 12–14 Produkte haben das Profil (1,1,1). Das passt zu einem Aufbau aus Strassen-artigen Bausteinen plus Rang-1-Korrekturen.

Häufigkeiten der Rangprofile (Anzahl Verfahren: Profil):

- 19: [((1, 1, 1), 13), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 1, 2), 1)]
- 19: [((1, 1, 1), 13), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 1, 4), 1)]
- 16: [((1, 1, 1), 13), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 4), 1), ((1, 2, 4), 1)]
- 16: [((1, 1, 1), 13), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 2), 1), ((1, 1, 4), 1)]
- 13: [((1, 1, 1), 13), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 4), 2)]
- 13: [((1, 1, 1), 14), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 4), 1)]
- 13: [((1, 1, 1), 12), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 1, 4), 2)]
- 12: [((1, 1, 1), 12), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 1, 2), 1), ((1, 1, 4), 1)]
- 10: [((1, 1, 1), 14), ((1, 1, 3), 6), ((2, 2, 2), 6)]
- 8: [((1, 1, 1), 14), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 2), 1)]
- 7: [((1, 1, 1), 13), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 2), 2)]
- 7: [((1, 1, 1), 14), ((2, 2, 2), 6), ((1, 1, 3), 4), ((1, 1, 4), 2)]
- 5: [((1, 1, 1), 14), ((2, 2, 2), 6), ((1, 1, 3), 4), ((1, 1, 2), 1), ((1, 1, 4), 1)]
- 5: [((1, 1, 1), 12), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 1, 2), 2)]
- 5: [((1, 1, 1), 12), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 2, 4), 1), ((2, 1, 4), 1)]
- 4: [((1, 1, 1), 12), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 2, 1), 1), ((2, 1, 4), 1)]
- 4: [((1, 1, 1), 13), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 4), 1), ((1, 2, 1), 1)]
- 4: [((1, 1, 1), 13), ((2, 2, 2), 6), ((1, 1, 3), 5), ((1, 1, 4), 1), ((1, 2, 3), 1)]
- 3: [((1, 1, 1), 12), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 2, 1), 1), ((2, 1, 1), 1)]
- 2: [((1, 1, 1), 14), ((2, 2, 2), 6), ((1, 1, 3), 4), ((1, 1, 2), 2)]
- 1: [((1, 1, 1), 12), ((1, 1, 3), 6), ((2, 2, 2), 6), ((1, 1, 4), 1), ((1, 2, 1), 1)]

Ein Verfahren mit 26 Produkten aus dem Vorrat (hexadezimal, je Produkt a,b,c im Format von 4.1, über GF(2)):

```
1,33,cf0d 7b,dc,1890 41,44,cc00 4,6,1fd0 c1,40,5f94 a8,80,808 
ab,3b,9198 f3,d0,880 6b,4c,9790 fb,db,1310 2a,cc,9090 cf,2,ee0 
ff,b,1110 54,8,e00 8b,32,2103 c3,40,28e4 cb,42,2ce0 aa,bb,9398 
8a,22,303 51,dd,300 8,60,2020 1,37,5f94 3f,c,1f90 88,10,2893 3,30,2002 
44,1,1100
```

### 4.4 Ergebnis

Kein Verfahren mit 25 Produkten über GF(2) gefunden. Das ist **kein** Beweis, dass 25 nicht reichen: Die Zufallswanderung deckt den Raum nicht systematisch ab, und sie findet nur Verfahren, die über GF(2) existieren. Ein Verfahren über Q oder einem anderen Körper mit 25 Produkten bleibt durch diese Suche unberührt.

Einordnung: Mit etwa 4·10⁹ Zügen und mindestens 21 verschiedenen Bahnen im Rang-26-Plateau ist das Ergebnis ein schwaches Indiz (**vermutet**), dass es über GF(2) im vom Standardverfahren aus erreichbaren Teil des Flip-Graphen keinen Rang 25 gibt. Bei anderen Formaten finden solche Suchen Verbesserungen oft erst nach deutlich mehr Rechenzeit.

## 5. Aussichtsreichster nächster Schritt

1. **Untere Schranke prüfen lassen.** Wenn Satz 2 aus arXiv:2609.14393 hält, ist die Frage auf 25 gegen 26 eingeengt. Ein Prüfer sollte den Beweis für den Fall n = m = 4 nachrechnen, insbesondere die Normalisierungs- und Substitutionsschritte. Ein Lean-Formalisieren nur des Falls ⟨4,2,4⟩ wäre der belastbarste Schritt.
2. **Die Schranke um eins heben (Richtung 26).** Der Beweis von Satz 2 scheint durch Dimensionszählen zu verlieren. Für n = m = 4 wäre zu prüfen, an welcher Stelle eine Fallunterscheidung nach dem Typ der Produkte (etwa: gibt es ein Produkt, dessen a-Faktor Rang 2 hat?) eins mehr liefert. Die Beobachtung aus 4.3, dass alle gefundenen 26er-Verfahren genau 6 Produkte vom Typ (2,2,2) haben, könnte einen Ansatzpunkt für diese Fallunterscheidung geben.
3. **Über F₂ eine vollständige Rechnung.** Der Ansatz von Wang (Dynamische Programmierung über eingeschränkte erste Matrizen mit Substitution und Rückverfolgung) könnte R_{F₂}(⟨4,2,4⟩) ≥ 26 vollständig per Rechner zeigen. Das wäre ein belastbarer Teilschritt, aber nur über F₂.
4. **Suche weiterführen** nur gezielt: Flip-Graph über GF(3) oder über Z mit Startpunkten aus dem Vorrat, und Hensel-Lifting eines etwaigen F₂-Funds. Mehr Zufallswanderung über GF(2) halte ich für wenig aussichtsreich.

## 6. Verbrauch

- Subagenten: 1 (Webseiten-Leser für die zwei arXiv-Arbeiten).
- Fremdmodell-Anfragen: 0.
- Rechenzeit: Hauptblock ca. 32 Minuten auf 4 Kernen (Überschreitung, siehe 4.2), dazu Vortests von zusammen ca. 6 Minuten.

## Anhang: Programm (C, GF(2)-Flip-Graph)

Der Vorrat liegt nur im flüchtigen Arbeitsverzeichnis dieser Sitzung und ist nicht dauerhaft gesichert. Mit dem folgenden Programm ist er reproduzierbar (Aufruf `./fg <seed> <sekunden> 25 2000000`; Zeilen `S26 …` sind Verfahren mit Rang 26).

```c
// Flip-graph random walk over GF(2) for <N,K,M> = <4,2,4>.
// term: a (N*K bits, A_ij at i*K+j), b (K*M bits, B_jk at j*M+k), c (N*M bits, C_ik at i*M+k)
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#define N 4
#define K 2
#define M 4
#define MAXR 64
typedef struct { uint32_t f[3]; } term;
static term T[MAXR]; static int R;
static uint64_t s[2];
static inline uint64_t rnd(void){uint64_t s1=s[0];const uint64_t s0=s[1];s[0]=s0;s1^=s1<<23;s[1]=s1^s0^(s1>>17)^(s0>>26);return s[1]+s0;}
static int verify(void){
  // T = sum e(A_ij) x e(B_jk) x e(C_ik)
  static uint8_t t[N*K][K*M][N*M]; memset(t,0,sizeof t);
  for(int r=0;r<R;r++) for(int x=0;x<N*K;x++) if(T[r].f[0]>>x&1) for(int y=0;y<K*M;y++) if(T[r].f[1]>>y&1) for(int z=0;z<N*M;z++) if(T[r].f[2]>>z&1) t[x][y][z]^=1;
  for(int i=0;i<N;i++)for(int j=0;j<K;j++)for(int k=0;k<M;k++) t[i*K+j][j*M+k][i*M+k]^=1;
  for(int x=0;x<N*K;x++)for(int y=0;y<K*M;y++)for(int z=0;z<N*M;z++) if(t[x][y][z]) return 0;
  return 1;
}
static void standard(void){R=0;for(int i=0;i<N;i++)for(int j=0;j<K;j++)for(int k=0;k<M;k++){T[R].f[0]=1u<<(i*K+j);T[R].f[1]=1u<<(j*M+k);T[R].f[2]=1u<<(i*M+k);R++;}}
static void del(int i){T[i]=T[--R];}
// try reductions: two terms sharing two factors -> merge
static int reduce(void){
  for(int i=0;i<R;i++)for(int j=i+1;j<R;j++){
    for(int s0=0;s0<3;s0++){int s1=(s0+1)%3,s2=(s0+2)%3;
      if(T[i].f[s1]==T[j].f[s1]&&T[i].f[s2]==T[j].f[s2]){T[i].f[s0]^=T[j].f[s0];del(j);if(T[i].f[s0]==0)del(i);return 1;}}
  }
  return 0;
}
// flip: terms i,j with f[s] equal: (a,b,c)+(a,b',c') -> (a,b+b',c)+(a,b',c'+c)
static int flip(void){
  for(int tries=0;tries<1000;tries++){
    int i=rnd()%R,j=rnd()%R; if(i==j)continue;
    int sl=rnd()%3; if(T[i].f[sl]!=T[j].f[sl])continue;
    int u=(sl+1+(rnd()&1))%3, v=3-sl-u;
    T[i].f[u]^=T[j].f[u]; T[j].f[v]^=T[i].f[v];
    if(T[i].f[u]==0){del(i);} else if(T[j].f[v]==0){del(j);}
    return 1;
  }
  return 0;
}
// faster flip using pair list
static int pairs[MAXR*MAXR*3][3]; 
static int flip2(void){
  int np=0;
  for(int i=0;i<R;i++)for(int j=0;j<R;j++) if(i!=j) for(int sl=0;sl<3;sl++) if(T[i].f[sl]==T[j].f[sl]){pairs[np][0]=i;pairs[np][1]=j;pairs[np][2]=sl;np++;}
  if(!np) return 0;
  int p=rnd()%np; int i=pairs[p][0],j=pairs[p][1],sl=pairs[p][2];
  int u=(sl+1+(rnd()&1))%3, v=3-sl-u;
  T[i].f[u]^=T[j].f[u]; T[j].f[v]^=T[i].f[v];
  if(T[i].f[u]==0) del(i); else if(T[j].f[v]==0) del(j);
  return 1;
}
// plus transition: split a term to escape: (a,b,c) -> (a',b,c)+(a+a',b,c) then flip with another
static void plus(void){
  int i=rnd()%R,j; do j=rnd()%R; while(j==i);
  int sl=rnd()%3; int u=(sl+1)%3,v=(sl+2)%3;
  // a x b x c + a' x b' x c' = a x b x (c) ... use: (a,b,c)+(a',b',c') = (a-a',b,c)+(a',b-b',c)?? use standard: 
  // a⊗b⊗c + a'⊗b'⊗c' = (a-a')⊗b⊗c + a'⊗(b-b')⊗c + a'⊗b'⊗(c+c')  -> wait recheck sign over GF2
  uint32_t a=T[i].f[sl],b=T[i].f[u],c=T[i].f[v],a2=T[j].f[sl],b2=T[j].f[u],c2=T[j].f[v];
  if(a==a2) return;
  // a b c + a2 b2 c2 = (a+a2) b c + a2 b c + a2 b2 c2 = (a+a2) b c + a2 (b+b2) c + a2 b2 (c+c2)  (GF2)
  // check: a2 b c + a2 b2 c2 = a2(b+b2)c + a2 b2 c + a2 b2 c2 = a2(b+b2)c + a2 b2 (c+c2). ok
  T[i].f[sl]=a^a2; T[j].f[sl]=a2; T[j].f[u]=b^b2; T[j].f[v]=c; 
  T[R].f[sl]=a2;T[R].f[u]=b2;T[R].f[v]=c^c2; R++;
  for(int q=R-1;q>=0;q--) if(!T[q].f[0]||!T[q].f[1]||!T[q].f[2]) del(q);
}
int main(int argc,char**argv){
  uint64_t seed=argc>1?atoll(argv[1]):time(0); double secs=argc>2?atof(argv[2]):60; int target=argc>3?atoi(argv[3]):25;
  long plateau=argc>4?atol(argv[4]):200000;
  s[0]=seed*0x9E3779B97F4A7C15ull+1;s[1]=seed^0xdeadbeef;for(int i=0;i<10;i++)rnd();
  clock_t st=clock(); long hist[MAXR]={0}; int best=99; long restarts=0; long steps=0, steps26=0;
  while((double)(clock()-st)/CLOCKS_PER_SEC<secs){
    standard(); restarts++;
    long since=0;
    while(1){
      while(reduce()) since=0;
      if(R<best){best=R;}
      if(R<=target){ if(!verify()){fprintf(stderr,"BUG\n");return 2;}
        printf("FOUND rank %d seed %llu\n",R,(unsigned long long)seed);
        for(int r=0;r<R;r++)printf("%x %x %x\n",T[r].f[0],T[r].f[1],T[r].f[2]); fflush(stdout); return 0;}
      if(!flip2()) { plus(); }
      since++; steps++;
      if((steps&0xffff)==0 && (double)(clock()-st)/CLOCKS_PER_SEC>=secs) break;
      if(R==26 && steps%100000==0){ printf("S26"); for(int r=0;r<R;r++)printf(" %x,%x,%x",T[r].f[0],T[r].f[1],T[r].f[2]); printf("\n"); }
      if(R==26) steps26++;
      if(since>plateau){ 
        if(R<=26){ hist[R]++; 
          // dump a 26 to pool
          if(R==26){ printf("R26"); for(int r=0;r<R;r++)printf(" %x,%x,%x",T[r].f[0],T[r].f[1],T[r].f[2]); printf("\n"); fflush(stdout);} }
        if(R<=27 && (rnd()%4)) { plus(); since=0; continue; }
        break; }
    }
    if((double)(clock()-st)/CLOCKS_PER_SEC>=secs) break;
  }
  fprintf(stderr,"seed %llu restarts %ld best %d steps %ld steps_at_26 %ld\n",(unsigned long long)seed,restarts,best,steps,steps26);
  return 1;
}
```
