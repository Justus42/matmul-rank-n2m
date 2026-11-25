# S2-54: Blind-Suche zu R(<4,2,4>), Runde 11

Auftrag: S2-54 (Blind-Sucher, Runde 11). Datum: 25.11.2026, Rechenzeit 21:07 bis 21:32 UTC.
Status dieses Berichts: vermutet bzw. leeres Ergebnis. Den Status setzt der Orchestrator.

## 1. Eingeblendete Hinweise (Offenlegung nach CLAUDE.md Punkt 1 und 12)

Aus dem Repo habe ich nur `CLAUDE.md` gelesen (Positivliste). Trotzdem wurden mir folgende Inhalte automatisch eingeblendet, ohne dass ich sie angefordert habe:

- Der Inhalt von `CLAUDE.md` (erwartet).
- Der Index des Projektgedächtnisses und vier Einzeleinträge, die das System als „möglicherweise relevant“ einblendete. Sie folgen unten wörtlich. Ich habe sie für die Suche nicht benutzt; sie enthalten nichts zu 4×2×4.
- Eine Liste verfügbarer Werkzeuge, darunter eine „Gemini_Bridge“. Ich habe sie nicht benutzt (keine Fremdmodell-Anfragen).

Beim Sichern der eingeblendeten Einträge habe ich das Gedächtnisverzeichnis kopiert und dabei die Dateinamen aller Einträge gesehen. Die übrigen Einträge habe ich ungelesen gelöscht. Die Namen lauteten: aussagen-abgleich-n3, gemini-bridge, lean-build-cloud, lean-project-ci, lean-satz2-eingesetzt, lean-upper-3x2x6, lean-yang-bounds, lean-yang-n3-zusammensetzung, mm325-lizenz, pruefer-python-s1-07, pruefer-rust, repo-schreibrechte, verfahren-datenformat, yang-n3-prosa, yang-n3-teil1-lean, yang-n3-teil2-lean, yang-n3-teil3-lean.

### 1.1 Index (MEMORY.md), wörtlich

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von <n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 25.11.2026 Version 0.4.1 (von Justus).
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

### Eintrag hk-verfahren-a10, wörtlich

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

### Eintrag verfahren-randfaelle-s1-04, wörtlich

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

### Eintrag git-regeln, wörtlich

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

### Eintrag pruefer-abgleich-s1-20, wörtlich

```
---
name: pruefer-abgleich-s1-20
description: S1-20: Abgleichwerkzeug für Python- und Rust-Prüfer unter pruefer/abgleich/, PR #31; Bedienung und offener Formatvorschlag
metadata:
  type: project
  modified: 2026-11-25T18:41:53.910Z
---

S1-20, 25.11.2026: `pruefer/abgleich/` (gen_cases.py, faelle/, abgleich.py, BERICHT.md), PR #31 (90d46c1), 278 Testfälle.
- Offener Formatvorschlag beim Orchestrator: Rückgabewert 3 + `INTERNER-FEHLER` ins Format; FEHLERHAFT nur für Dateieigenschaften; Auswertung nur bei passendem Paar (ANGENOMMEN/0, ABGELEHNT/1, FEHLERHAFT/2), sonst „kein Ergebnis“.
- Beide Prüfer brauchen ~1 min für Koeffizienten mit 200 000 Stellen.

**How to apply:** Nach Änderungen an einem Prüfer `python3 pruefer/abgleich/abgleich.py` laufen lassen (Rust vorher bauen). Verwandt: [[pruefer-python-s1-07]], [[pruefer-rust]]
```

## 2. Vorgehen

Gewählter Weg: Suche nach einem Verfahren mit 25 Multiplikationen über GF(2) mit einer Zufallswanderung im Flip-Graphen (Ansatz nach Kauers und Moosbauer, eigene Umsetzung ohne fremden Code).

- Darstellung: A ist 4×2 (8 Bit), B ist 2×4 (8 Bit), C ist 4×4 (16 Bit), jeder Term ist ein Tripel von Bitmasken. Ziel ist der Tensor Summe über i,j,k von a_ij ⊗ b_jk ⊗ c_ik.
- Start: das Standardverfahren mit 32 Termen.
- Flip: Zwei Terme mit gleichem Faktor in einer Stelle, (a,b1,c1)+(a,b2,c2) → (a,b1+b2,c1)+(a,b2,c1+c2), ebenso für die anderen Stellen.
- Reduktion: Ein Nullfaktor löscht den Term; zwei Terme mit zwei gleichen Faktoren werden zusammengelegt.
- Ausweg aus Plateaus („plus transition“): Nach L Schritten ohne Reduktion werden zwei Terme durch drei ersetzt, (a,b,c)+(a',b',c') = (a+a',b,c)+(a',b+b',c)+(a',b',c+c'). Das ist nur erlaubt, solange der Rang höchstens um 1 über dem besten liegt.
- Jeder Verbesserungsstand wird im C-Programm geprüft und zusätzlich unabhängig mit einem kleinen Python-Skript gegen den Zieltensor nachgerechnet.

Läufe: 4 Prozesse parallel auf 4 Kernen, je 1500 s (25 Minuten), Samen 11 bis 14, Plateaulänge L = 1e5, 3e5, 1e6, 3e6.

## 3. Ergebnis

| Samen | L | 26 erreicht nach | Schrittversuche gesamt | plus-Übergänge | bester Rang |
|---|---|---|---|---|---|
| 11 | 1e5 | 3 s | 1,99e10 | 198 043 | 26 |
| 12 | 3e5 | 13 s | 2,16e10 | 71 709 | 26 |
| 13 | 1e6 | 7 s | 2,79e10 | 27 832 | 26 |
| 14 | 3e6 | 65 s | 2,00e10 | 6 668 | 26 |

(„Schrittversuche“ zählt auch Versuche, bei denen der gezogene Faktor keinen Partner hatte.)

- Alle vier Läufe erreichen aus dem Standardverfahren schnell Rang 26 über GF(2). Die vier Verfahren mit 26 Termen sind mit dem Python-Skript nachgerechnet und korrekt.
- Rang 25 wurde in keinem Lauf gefunden. Das ist kein Beweis, dass 25 über GF(2) unmöglich ist, nur ein schwaches Indiz.

Beispiel eines gefundenen Verfahrens mit 26 Termen über GF(2) (Samen 14), eine Zeile je Term als Hex-Masken a b c, Bit i*2+j für A, j*4+k für B, i*4+k für C:

```
26
c2 67 9dd4
c0 b0 cc0c
28 33 d0
51 f 400
cf c0 990
2 10 9009
c7 c7 848
33 9 330
4 b 7b8
3d 23 ede
82 77 91d8
8 b0 c0
c3 7 444
3c 3 7de
a2 f0 e000
c0 d0 add4
40 66 bc08
1 1 303
62 69 edd0
45 cc 808
40 dd 61d8
3f 20 eee
22 99 e1d0
15 22 f00
6d c3 9d0
37 29 f30
```

## 4. Einordnung und Schwächen

- Öffentliche Literatur (nur kurz gesichtet, nicht geprüft): Für ⟨2,4,4⟩ führt der Katalog https://fmm.univ-lille.fr/2x4x4.html ein Verfahren mit 26 Multiplikationen; arXiv 2510.19787 („Exploring the Meta Flip Graph for Matrix Multiplication“) untersucht Flip-Graphen für kleine Formate. Ich habe nicht nachgelesen, ob dort ⟨4,2,4⟩ oder ⟨2,4,4⟩ über GF(2) schon erschöpfend mit Rang 25 versucht wurde.
- Meine Wanderung hält keinen Vorrat verschiedener 26er-Verfahren. Nach einem plus-Übergang treibt sie auf Rang 27 und kehrt zu irgendeinem 26er zurück, ohne zu protokollieren, wie viele verschiedene 26er-Verfahren (bis auf Symmetrie) sie besucht hat. Die Abdeckung des 26er-Plateaus ist daher unbekannt.
- Nur GF(2). Ein Verfahren mit 25 Termen könnte über Q oder GF(3) existieren, ohne über GF(2) zu existieren.

## 5. Aussichtsreichster nächster Schritt

1. Flip-Graph nach Kauers und Moosbauer mit einem Vorrat: alle verschiedenen 26er-Verfahren über GF(2) bis auf die Symmetriegruppe (GL-Wirkungen und Transposition) sammeln und zählen. Wenn die Komponente klein ist und vollständig abgelaufen werden kann, ergibt sich eine belastbare Teilaussage „kein 25er im erreichten Teil des Flip-Graphen“.
2. Dieselbe Suche über GF(3), weil die Lösungsräume sich unterscheiden.
3. Für die untere Schranke: Substitutionsmethode nach Pan bzw. Hopcroft und Kerr gezielt auf ⟨4,2,4⟩ anwenden, gegebenenfalls durch SAT-Fallunterscheidung über GF(2) gestützt, wenn man vorher Normalformen der Faktoren aus A festlegt (die A-Faktoren leben nur in einem 8-dimensionalen Raum).

## 6. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0. Websuche: 1.
- Rechnen: 4 Kerne × 25 Minuten (ein Block, 21:07 bis 21:32 UTC).

## Anhang: Programm (C, eigener Code)

```c
// Flip-graph random walk for <N,M,P> matrix multiplication tensor over GF(2).
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#define N 4
#define M 2
#define P 4
#define MAXR 64
static uint32_t A[MAXR],B[MAXR],C[MAXR]; static int R;
static uint64_t s[2];
static inline uint64_t rnd(void){uint64_t a=s[0],b=s[1];s[0]=b;a^=a<<23;s[1]=a^b^(a>>17)^(b>>26);return s[1]+b;}
static void del(int i){R--;A[i]=A[R];B[i]=B[R];C[i]=C[R];}
// verify: compute sum of a(x)b(x)c as bit tensor
static int verify(void){
  static uint8_t T[256][256]; // index A(8 bits) positions x B positions -> C mask 16 bits; use explicit
  uint32_t t[8][8]; memset(t,0,sizeof t);
  for(int r=0;r<R;r++) for(int x=0;x<N*M;x++) if(A[r]>>x&1) for(int y=0;y<M*P;y++) if(B[r]>>y&1) t[x][y]^=C[r];
  for(int i=0;i<N;i++)for(int j=0;j<M;j++)for(int j2=0;j2<M;j2++)for(int k=0;k<P;k++){
    uint32_t want=0; if(j==j2) want=0; // fill below
  }
  for(int x=0;x<N*M;x++)for(int y=0;y<M*P;y++){
    int i=x/M,j=x%M,j2=y/P,k=y%P; uint32_t want=(j==j2)?(1u<<(i*P+k)):0;
    if(t[x][y]!=want) return 0;}
  (void)T; return 1;
}
// reduce term i against others: zero factors, or two equal factors
static int reduce_from(int i){
  if(!A[i]||!B[i]||!C[i]){del(i);return 1;}
  for(int k=0;k<R;k++){ if(k==i) continue;
    int ea=A[k]==A[i], eb=B[k]==B[i], ec=C[k]==C[i];
    if(ea+eb+ec>=2){
      if(ea&&eb) C[k]^=C[i]; else if(ea&&ec) B[k]^=B[i]; else A[k]^=A[i];
      del(i); // careful: k may have moved if k==R(old)-1 -> now at i
      int kk = (k==R)? i : k;
      if(!A[kk]||!B[kk]||!C[kk]) del(kk);
      return 1;}
  }
  return 0;
}
static int reduce_all(void){int any=0,ch=1;while(ch){ch=0;for(int i=0;i<R;i++) if(reduce_from(i)){ch=1;any=1;break;}}return any;}
static void dump(FILE*f){fprintf(f,"%d\n",R);for(int r=0;r<R;r++)fprintf(f,"%x %x %x\n",A[r],B[r],C[r]);fflush(f);}
int main(int argc,char**argv){
  uint64_t seed=argc>1?strtoull(argv[1],0,10):1; double tl=argc>2?atof(argv[2]):60; long L=argc>3?atol(argv[3]):200000; int target=argc>4?atoi(argv[4]):25;
  s[0]=seed*0x9E3779B97F4A7C15ull+1; s[1]=seed^0xdeadbeefcafe; for(int i=0;i<20;i++)rnd();
  R=0; for(int i=0;i<N;i++)for(int j=0;j<M;j++)for(int k=0;k<P;k++){A[R]=1u<<(i*M+j);B[R]=1u<<(j*P+k);C[R]=1u<<(i*P+k);R++;}
  if(!verify()){printf("bad init\n");return 1;}
  int best=R; long since=0; long long steps=0, plus=0; time_t t0=time(0); int hist[MAXR]={0};
  char fn[64]; sprintf(fn,"best_%llu.txt",(unsigned long long)seed);
  while(difftime(time(0),t0)<tl){
    for(int it=0;it<10000;it++){
      int i=rnd()%R, sl=rnd()%3; uint32_t *F= sl==0?A:sl==1?B:C;
      int cand[MAXR],nc=0; for(int k=0;k<R;k++) if(k!=i&&F[k]==F[i]) cand[nc++]=k;
      steps++; since++;
      if(nc){ int j=cand[rnd()%nc];
        // flip: term i: other1 ^= other1_j ; term j: other2 ^= other2_i
        if(sl==0){B[i]^=B[j];C[j]^=C[i];} else if(sl==1){A[i]^=A[j];C[j]^=C[i];} else {A[i]^=A[j];B[j]^=B[i];}
        int r0=R; int hi=i>j?i:j, lo=i>j?j:i; (void)hi;(void)lo;
        if(reduce_all()) { since=0; }
        if(R<best){best=R; FILE*f=fopen(fn,"w"); if(verify()) dump(f); else fprintf(f,"VERIFY FAIL\n"); fclose(f);
          printf("seed %llu rank %d steps %lld plus %lld t=%.0f\n",(unsigned long long)seed,R,steps,plus,difftime(time(0),t0)); fflush(stdout);}
        (void)r0;
      }
      if(since>L && R<=best+1 && R<MAXR-2){ // plus transition
        int a=rnd()%R,b=rnd()%R; if(a==b) continue;
        if(A[a]==A[b]||B[a]==B[b]||C[a]==C[b]) continue;
        uint32_t a1=A[a],b1=B[a],c1=C[a],a2=A[b],b2=B[b],c2=C[b];
        A[a]=a1^a2;B[a]=b1;C[a]=c1; A[b]=a2;B[b]=b1^b2;C[b]=c1; A[R]=a2;B[R]=b2;C[R]=c1^c2;R++;
        plus++; since=0; reduce_all();
      } else if(since>L && R>best+1){ since=0; }
      if(R<=target-0 && R<best) {}
    }
    hist[R]++;
  }
  if(!verify()) printf("FINAL VERIFY FAIL\n");
  printf("seed %llu done best %d steps %lld plus %lld\n",(unsigned long long)seed,best,steps,plus);
  return 0;
}
```

Prüfskript (Python):

```python
import sys
N,M,P=4,2,4
L=open(sys.argv[1]).read().split('\n'); r=int(L[0]); T={}
for l in L[1:1+r]:
    a,b,c=(int(x,16) for x in l.split())
    for x in range(8):
        if a>>x&1:
            for y in range(8):
                if b>>y&1:
                    for z in range(16):
                        if c>>z&1: T[(x,y,z)]=T.get((x,y,z),0)^1
W={}
for i in range(N):
  for j in range(M):
    for k in range(P): W[(i*M+j,j*P+k,i*P+k)]=1
T={k:v for k,v in T.items() if v}
print("rank",r,"OK" if T==W else "FAIL")
```
