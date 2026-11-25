# S2-49: Blind-Suche ⟨4,2,4⟩, Runde 10 – Bericht

Rolle: Blind-Sucher. Auftrag S2-49 des Orchestrators. Datum: 25.11.2026, ca. 19:28–20:25 UTC.
Status aller Aussagen in diesem Bericht: **behauptet** (Rechenergebnisse) bzw. **vermutet** (Einschätzungen). Kein Ergebnis zur Frage „Rang 25 oder 26“.

## Kurzfassung

- Ich habe **kein** bilineares Verfahren mit 25 Produkten gefunden und **keinen** Beweis, dass 26 nötig sind.
- Eine Flip-Graph-Suche über GF(2) (nach Kauers–Moosbauer mit Plus-Übergängen) erreicht vom Standardverfahren (32 Produkte) aus in jedem Lauf nach 1–5 Sekunden ein Verfahren mit 26 Produkten über GF(2), danach in insgesamt etwa 100 CPU-Minuten (4 Läufe × 25 min, zusammen rund 1,1·10¹⁰ ausgeführte Flips und rund 1,4·10⁶ erneute Reduktionen auf 26) **nie** 25. Das ist schwache Evidenz gegen ein Verfahren mit 25 Produkten über GF(2), kein Beweis.
- Numerische Suche über ℝ (ALS und Levenberg–Marquardt) blieb schon bei Rang 26 in Minima mit Restfehler ≈ 1 hängen; über ℝ daher keine Aussage.
- Literaturhinweis (veröffentlicht, nur gelesen): Das Verfahren von Wang (arXiv:2603.07280) zählt für A = F₂^{2×4} nur 86 Unterraum-Bahnen (Tabelle 9). Ein Lauf dieses Programms auf ⟨2,4,4⟩ über F₂ könnte die untere Schranke 26 über F₂ liefern oder ausschließen (vermutet, nicht geprüft).

## Offenlegung

1. **Beim Start eingeblendet (vor jeder Leseaktion):** der Gedächtnisindex `team/silo/MEMORY.md` (Projektüberblick: Repo, Ziel der exakten Ränge von ⟨n,2,m⟩ mit den Formaten 4×2×4, 3×2×7, 4×2×5 und Lean für 3×2×6, Rechte und Grenzen des Orchestrators, Fremdmodell-Regeln, Grenzen aus Abschnitt 6, Anweisungen zu Prüfer- und Blind-Sucher-Aufträgen, Literaturwache, Merge-Hinweise). Er nennt die Namen `verfahren-datenformat` und `lean-project-ci` ohne Inhalt. Außerdem `CLAUDE.md` (erlaubt). Das habe ich dem Orchestrator vor jeder Arbeit gemeldet.
2. **Während der Arbeit zusätzlich eingeblendet** (automatisch, nicht von mir angefordert), drei Gedächtniseinträge:
   - `schranken-befunde`: Literaturbefunde zu Schranken, v. a. obere Schranke 32 für ⟨4,2,5⟩ (AlphaEvolve, über ½ℤ), Charakteristik 2 dort 33; untere Schranke 30 für ⟨3,2,6⟩ beruhe nur auf Yang v3; Hinweis auf Shitov ⟨2,2,m⟩; Erreichbarkeit von arxiv.org aus der Cloud.
   - `git-regeln`: Threads committen ihre Zieldatei ohne Rückfrage, PR mit Auftragsnummer.
   - `hk-verfahren-a10`: A-10 habe HK-Verfahren für 3×2×5 (25) und 3×2×6 (30) über ℤ gebaut, PR #11, mit Bauweg (Lacelle arXiv:2606.13408, Ergänzungsmatrix) und Formathinweisen.
   Keiner dieser Einträge betrifft ⟨4,2,4⟩ direkt; ich habe nichts daraus verwendet. Die Einträge `schranken-befunde` und `hk-verfahren-a10` enthalten Befunde und Zwischenstände, die nach dem Gedächtnisindex dort nicht stehen sollten.
3. **Aus dem Repo gelesen:** nur `CLAUDE.md` (eingeblendet). Ich habe keine weitere Datei, keine Verzeichnisliste und keine Commit-, PR- oder Actions-Listen angesehen. Für den Commit habe ich `git status`, `git fetch` des Zweigs `main` und `test -e versuche/s2-blind-r10.md` (Existenzprüfung nur dieser Zieldatei, Ergebnis: existiert nicht) ausgeführt.
4. **Literatur (veröffentlicht):** über alphaXiv gelesen: arXiv:2603.07280 (Wang, Automated Lower Bounds over F_q) und arXiv:2609.17533 (Medley u. a., GPU-Flip-Graph über F₂); in der Trefferliste gesehen (nur Kurzfassung): arXiv:2609.14393 (untere Schranke (n+2)m+n−3 für ⟨n,2,m⟩, m ≥ n ≥ 4, also 25 für ⟨4,2,4⟩, passend zur Problemstellung) und arXiv:2609.22054 (⟨3,2,m⟩ > 24m/5). Keine Anfragen an andere Modelle.

## Vorgehen und Ergebnisse

Tensor: T = Σ_{i<4,k<2,j<4} e_{(i,k)} ⊗ e_{(k,j)} ⊗ e_{(i,j)} in K⁸ ⊗ K⁸ ⊗ K¹⁶.

### 1. Numerik über ℝ (Sackgasse)

- ALS mit Tikhonov-Regularisierung und Normausgleich, Rang 26, 3 Starts: Restfehler (Frobenius) 1,02 / 1,42 / 1,41.
- Levenberg–Marquardt über alle 832 Parameter, Rang 26, abnehmende Regularisierung, 4 Starts à 600 Iterationen: Restfehler jeweils ≈ 1,000 (ein fehlender Eintrag; typisches Grenzrang-/Entartungsminimum).
- **Grund des Scheiterns:** Schon der bekannte Rang 26 wurde nicht gefunden; ohne bessere Methode (z. B. Smirnov-artige Regularisierung mit vielen Neustarts, Ganzzahl-Rundung) ist ein Fehlschlag bei 25 wertlos. Abgebrochen nach ca. 10 Minuten.

### 2. Flip-Graph über GF(2) (Hauptlauf)

Programm `flip2.c` (unten vollständig): Terme als Bitmasken (8, 8, 16 Bit). Zufälliger Flip auf zwei Termen mit gleichem Faktor; nach jedem Flip lokale Reduktion (zwei Terme mit zwei gleichen Faktoren werden zusammengelegt, Nullterme gestrichen). Kein Flip möglich oder L Schritte ohne Reduktion → Plus-Übergang (Ersetze A'⊗B'⊗C' durch (A'+A)⊗B'⊗C' + A⊗B'⊗C'). Liegt der Rang mehr als SLACK über dem besten, Rücksprung auf das beste Verfahren. Jedes neue Minimum wird gegen den Tensor geprüft (`ok=1`).

Block 1: 4 Kerne, 1500 s CPU je Lauf, Start jeweils beim Standardverfahren (32):

| Lauf | Seed | L | SLACK | erstes Erreichen von 26 | bestes Ergebnis | Reduktionen auf 26 |
|---|---|---|---|---|---|---|
| b1 | 21 | 200 000 | 2 | 4 s | 26 | 227 744 |
| b2 | 22 | 1 000 000 | 2 | 2 s | 26 | 89 475 |
| b3 | 23 | 200 000 | 3 | 5 s | 26 | 281 532 |
| b4 | 24 | 50 000 | 1 | < 1 s | 26 | 821 134 |

Jeder Lauf: rund 4,1·10¹⁰ Schleifenschritte, davon rund 2,8·10⁹ ausgeführte Flips und rund 8·10⁵ Plus-Übergänge. Rang 25 nie erreicht.

**Einschätzung (vermutet):** Das Plateau bei 26 ist über GF(2) für diesen einfachen Flip-Graphen sehr stabil. Das spricht schwach dafür, dass R_{GF(2)}(⟨4,2,4⟩) = 26, ist aber kein Beweis; Flip-Graph-Suchen haben bei anderen Formaten Verbesserungen erst nach weit mehr Rechenzeit gefunden. Ein Verfahren mit 25 Produkten über ℚ oder ℝ, das sich nicht nach GF(2) reduzieren lässt (z. B. mit Nennern 2), wird von dieser Suche grundsätzlich nicht erfasst.

Vorstufen mit Programmfehlern (dokumentiert, Ergebnisse verworfen): Version 1 war zu langsam (volle Reduktion O(R²) je Schritt) und blieb bei 27; Version 2 vor der Korrektur hatte einen fehlerhaften Plus-Übergang (der neue Term teilte zwei Faktoren mit dem alten und wurde sofort zurückverschmolzen) und blieb ebenfalls bei 27. Diese Läufe sagen nichts aus.

### 3. Flip-Graph über GF(3) (Sackgasse)

Programm `flip3.c` mit projektiv normierten Faktoren und Skalar je Term. Ergebnis: Die Verfahren bleiben korrekt (geprüft im Programm), aber die Irrfahrt diffundiert sofort zu dichten Vektoren; in 10⁷ Flips keine einzige Reduktion unter 32 (nur Rückreduktionen nach Plus-Übergängen). Eine erste Fassung mit Fehler im Plus-Übergang meldete Rang 24/25, die Prüfung ergab `ok=0`; das ist ein Programmfehler, kein Ergebnis.
**Grund des Scheiterns:** Über GF(3) braucht es eine Einschränkung der Koeffizienten (etwa nur Flips mit μ = ±1 und Zurückweisen dichter Vektoren wie bei Perminovs ternären Flip-Graphen) oder Hensel-Heben aus GF(2). Aus Zeitgründen nicht weiter verfolgt.

## Empfehlungen (vermutet)

1. **Untere Schranke über F₂:** Wangs Programm (arXiv:2603.07280, Code laut Arbeit unter github.com/wcgbg/tensor-rank-lower-bound; Lizenz nach Protokoll 11.3 prüfen) arbeitet über Bahnen von Unterräumen des ersten Arguments. Für A = F₂^{2×4} gibt es laut Tabelle 9 nur 86 Bahnen. Mit ⟨2,4,4⟩ (erstes Argument 2×4) ist ein Lauf vermutlich klein. Ergibt er ≥ 26, wäre R_{F₂}(⟨4,2,4⟩) = 26 bewiesen (nur F₂, nicht jeder Körper).
2. **Obere Richtung:** längere Flip-Graph-Läufe über GF(2) mit verallgemeinerten Flips (Medley u. a., Anhang B) und Neustarts aus einem Pool verschiedener 26er-Verfahren; außerdem ternäre Suche über ℤ mit Koeffizienten in {−1,0,1}.

## Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0.
- Rechenblöcke: ein Block 4 Kerne × 25 min (GF(2)); daneben kurze Tests (zusammen etwa 15 Kernminuten, einzeln höchstens 5 Minuten auf 4 Kernen).

## Anhang: `flip2.c` (Endfassung, GF(2))

Aufruf: `./flip2 <Zielrang> <Seed> <Sekunden> <L> <SLACK>`. Die Zeilen mit `dbg`-Ausgaben sind Diagnose.

```c
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#define N 4
#define M 2
#define P 4
#define MAXR 64
int SLACK=1;
typedef struct {uint32_t f[3];} term;
term S[MAXR],B[MAXR]; int R,BR;
static uint64_t rs;
static inline uint64_t rnd(){rs^=rs<<13;rs^=rs>>7;rs^=rs<<17;return rs;}
int verify(term*S,int R){
  static uint8_t A[N*M][M*P][N*P]; memset(A,0,sizeof A);
  for(int t=0;t<R;t++) for(int x=0;x<N*M;x++) if(S[t].f[0]>>x&1) for(int y=0;y<M*P;y++) if(S[t].f[1]>>y&1) for(int z=0;z<N*P;z++) if(S[t].f[2]>>z&1) A[x][y][z]^=1;
  for(int i=0;i<N;i++)for(int k=0;k<M;k++)for(int j=0;j<P;j++) A[i*M+k][k*P+j][i*P+j]^=1;
  for(int x=0;x<N*M;x++)for(int y=0;y<M*P;y++)for(int z=0;z<N*P;z++) if(A[x][y][z]) return 0;
  return 1;
}
// local reduction around term i; returns 1 if rank dropped
int reduce_at(int i){
  if(!S[i].f[0]||!S[i].f[1]||!S[i].f[2]){S[i]=S[--R];return 1;}
  for(int j=0;j<R;j++) if(j!=i){
    int e0=S[i].f[0]==S[j].f[0],e1=S[i].f[1]==S[j].f[1],e2=S[i].f[2]==S[j].f[2];
    if(e0+e1+e2>=2){
      if(!e0) S[j].f[0]^=S[i].f[0]; else if(!e1) S[j].f[1]^=S[i].f[1]; else if(!e2) S[j].f[2]^=S[i].f[2]; else S[j].f[0]=0;
      S[i]=S[--R];
      int jj=(j==R)?i:j; // j moved if it was last
      reduce_at(jj<R?jj:i);
      return 1;
    }
  }
  return 0;
}
int full_reduce(){int any=0,ch=1;while(ch){ch=0;for(int i=0;i<R;i++) if(reduce_at(i)){ch=any=1;break;}}return any;}
int main(int argc,char**argv){
  int target=atoi(argv[1]); rs=atoll(argv[2])*2654435761ULL+12345; double tl=atof(argv[3]);
  long L=atol(argv[4]); if(argc>5) SLACK=atoi(argv[5]);
  clock_t t0=clock();
  R=0; for(int i=0;i<N;i++)for(int k=0;k<M;k++)for(int j=0;j<P;j++){S[R].f[0]=1u<<(i*M+k);S[R].f[1]=1u<<(k*P+j);S[R].f[2]=1u<<(i*P+j);R++;}
  memcpy(B,S,sizeof S); BR=R; long nflip=0,nplus=0,steps=0,since=0,plat=0,miss=0; long cnt[MAXR]={0};
  while(1){
    if((steps&0xffff)==0 && (double)(clock()-t0)/CLOCKS_PER_SEC>tl) break;
    steps++; since++; if((steps%100000000)==0) fprintf(stderr,"dbg steps %ld R %d nflip %ld nplus %ld\n",steps,R,nflip,nplus);
    // random flip: pick random i, random k, find j with same f[k]
    int i=rnd()%R,k=rnd()%3,j=-1; int cand[MAXR],nc=0;
    for(int t=0;t<R;t++) if(t!=i && S[t].f[k]==S[i].f[k]) cand[nc++]=t;
    if(!nc){ if(++miss>2000){since=L+1;miss=0;} } else miss=0;
    if(nc){ nflip++; j=cand[rnd()%nc];
      int k1=(k+1)%3,k2=(k+2)%3; if(rnd()&1){int t=k1;k1=k2;k2=t;}
      S[i].f[k2]^=S[j].f[k2]; S[j].f[k1]^=S[i].f[k1];
      int a=i,b=j; if(a<b){int t=a;a=b;b=t;} // reduce higher index first
      int d=reduce_at(a); if(b<R) d|=reduce_at(b); if(d) d|=full_reduce();
      if(d){ since=0;
        if(R<BR){ BR=R; memcpy(B,S,sizeof(term)*R); fprintf(stderr,"rank %d step %ld t=%.0f ok=%d\n",R,steps,(double)(clock()-t0)/CLOCKS_PER_SEC,verify(S,R));
          if(R<=target){ printf("FOUND %d\n",R); for(int t=0;t<R;t++) printf("%u %u %u\n",S[t].f[0],S[t].f[1],S[t].f[2]); return 0;} }
        cnt[R]++;
      }
    }
    if(since>L){ since=0;
      if(R>BR+SLACK){ memcpy(S,B,sizeof(term)*BR); R=BR; }
      else { nplus++; // plus
        int a=rnd()%R,b; do b=rnd()%R; while(b==a); int kk=rnd()%3;
        term t=S[b]; t.f[kk]=S[a].f[kk]; S[b].f[kk]^=S[a].f[kk]; S[R++]=t; }
    }
  }
  fprintf(stderr,"best %d steps %ld\n",BR,steps); for(int r=0;r<MAXR;r++) if(cnt[r]) fprintf(stderr,"cnt %d %ld\n",r,cnt[r]);
  return 2;
}
```
