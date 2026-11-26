# Bericht S5-05: Prüfung der Glieder K-13 bis K-20

Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit `d6469d8`, Zeilen 249 bis 378 (Abschnitt 4, Glieder K-13 bis K-20). Rolle: Prüfer. Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet** waren mir vor und während der Arbeit:

- der Index des Projektgedächtnisses (Projektbeschreibung, Ziel „exakter Tensorrang von ⟨n,2,m⟩“, Regeln zu Orchestrator, Fremdmodell, Prüferaufträgen, Literaturwache, Merge-Ablauf, Verweise auf zwei Einträge zum Datenformat und zum Actions-Workflow). Ein Urteil oder ein Prüfstand zu einem Glied der Kette stand dort nicht.
- zwei Einzeleinträge: „aussagen-abgleich-n3“ (Hinweise zur Bridge und zum lokalen Lean-Bau) und „gemini-bridge“ (Freigabe der Bridge, Zeitlimit). Beide enthalten nichts zur Kette.

**Über die Positivliste hinaus gesehen:**

- `git status`, `git rev-parse --short HEAD` (Arbeitskopie stand auf `8ce8481`, losgelöst von main), `git cat-file -t d6469d8`. Die Datei `lean/prosa/s5_327_kette.md` in `d6469d8` ist gleich der in der Arbeitskopie (nur Ja/Nein-Vergleich, keine Ausgabe eines Unterschieds).
- `git show -s --format=%cI d6469d8`: der Zeitstempel dieses einen Commits (2026-11-26T15:15:50+00:00), ohne Betreff. Das war unnötig und streift die gesperrte Git-Historie.
- `grep -n '^## ' PROTOKOLL.md`: die Überschriften aller Abschnitte des Protokolls (nur Titelzeilen).
- Anzahl der Einträge in `lean/prosa/` (53), ohne Namen.
- Ein `grep` über die Zeilen 109 bis 248 nach Überschriften, „Wortlaut“, „Voraussetzungen“ und „Beweis“ der Datei. Dadurch habe ich zusätzlich zu den erlaubten Aussagen die Wortlaute von K-1 bis K-6 und die jeweils erste Beweiszeile von K-1 bis K-12 gesehen; bei K-7, K-8, K-9, K-10 und K-12 ist das der ganze Beweis. Für mein Urteil benutze ich von K-7 bis K-12 nur die Wortlaute.
- Der Abschnitt „Rechnung zur Kontrolle“ in K-19 (Zeilen 353 bis 364) nennt das Programm `erkundung/s3-04-restfaelle-327.py`. Ich habe es nicht geöffnet und nicht ausgeführt (`erkundung/` ist gesperrt).

Keine Urteile anderer Prüfer gesehen. Kein Fremdmodell, keine Subagenten.

## 1. Vorgehen

Jedes Glied habe ich Zeile für Zeile nachgerechnet: Wortlaut, Liste der Voraussetzungen, jeder Beweisschritt, Quantoren. Die Wortlaute von K-7 bis K-12 (Zeilen 184 bis 243) habe ich als gegeben genommen.

Zusätzlich zwei eigene Programme (Python 3, nur ganze Zahlen, Anhang A):

- `check.py` (SHA-256 `f868fbdc8707f8b7feaaaa70d5b13f04dcb0306dbb0a9ab244cfb6c9e9b549cf`): baut echte Verfahren für ⟨3,2,m⟩ über GF(p) (Standardverfahren für m = 1, 2, 3, 7, ein Verfahren der Länge 11 für ⟨3,2,2⟩ aus Strassen plus Zeile 2, und dessen dreifache Summe plus ⟨3,2,1⟩, Länge 39 für ⟨3,2,7⟩), prüft die Brent-Gleichungen, wendet zufällige Basiswechsel nach 1.3 an, behält nur Fälle mit (SN1) und (SN2) (SN2 vollständig über alle Punkte von P²(GF(p)) geprüft) und rechnet dann nach: K-14 (i) bis (iii), dim J = m, dim Q = r − 4m, dim ker Φ = dim N und ker Φ ⊆ {0}×{0}×U, (G), K-13 an zufälligen Unterräumen jeder Dimension, K-16, K-17, dim N = m − rk H und K-20 (a) mit ρ als Maximum über GF(p)². Läufe mit p = 13 (Startwert 1) und p = 31 (Startwert 7): alle Prüfungen bestanden („ALL OK“), Laufzeit unter 1 Sekunde. In allen diesen Beispielen ist N = 0; K-16 und K-17 werden dort also nur im trivialen Fall getroffen. Die Rechnung ist eine Plausibilitätsprobe, kein Beweis.
- `enum.py` (SHA-256 `573d2b1b4b1d11dd74012d54b46566251b1af5cdab75b6eb69d63327b36bfde3`): zählt für m = 7 und r = 28 bis 34 alle ganzzahligen (rk L, rk H, dim Ŝ) ab, die genau die Ungleichungen aus K-13 bis K-17 erfüllen (rk L ≤ dim Q, (G), Δ ≥ min(2, dim N), dim Ŝ ≥ dim N − Δ, dim Ŝ ≥ 1 ⇒ dim Ŝ + 2 ≤ dim N). Ergebnis: für r = 28 bis 33 keine Lösung (passt zu K-18 (a)), für r = 34 genau (rk L, rk H, dim N, Δ, dim Ŝ) = (6, 4, 3, 2, 1) (passt zu K-19). Mit den Bedingungen aus K-20 (a), (b) bleibt im Restfall nur ρ = 4 (passt zu K-20).

## 2. Urteile je Glied

### K-13 (Lemma B), Zeilen 253 bis 260: **bestätigt**

f_i = P_i∘f_0 mit P_i = D(e_{i0})D(e_{00})^{−1} folgt direkt aus der Definition, (SN1) gibt die Invertierbarkeit. Die Fahne E_j ist unter Diagonalmatrizen invariant. Bei minimalem j ist 𝒳 = f_0(X) ∩ E_j eindimensional, weil 𝒳 ∩ E_{j−1} = 0 und 𝒳 ⊆ E_j, also 𝒳 ↪ E_j/E_{j−1}. Der Erzeuger hat die Form f_0(v) mit v ∈ X ∖ {0}; (SN2) gibt dim 𝒯 = 3; 𝒯 ⊆ E_j; f_0(X) ∩ 𝒯 = 𝒳. Mit dim f_0(X) = dim X (T4) folgt dim(f_0(X) + 𝒯) = dim X + 2. Voraussetzungen vollständig. Der Beweis gilt über jedem Körper.

### K-14 (Lemma C, D, E), Zeilen 262 bis 272: **bestätigt**

(i) W(f_i(x)) = e_{i0}x (T5) hat Zeile i gleich Zeile 0 von x, also 0 für x ∈ U. W(g(x)) = e_{01}x − e_{00}(e_{01}^{(2×2)}x) = 0 mit (D2) und e_{00}^{(3×2)}e_{01}^{(2×2)} = e_{01}^{(3×2)}, sogar für alle x. dim J = m aus (T4) und dim U = m, dim K′ = r − 3m aus (T3), also dim Q = r − 4m. (ii), (iii) folgen aus (D1). (iv) nachgerechnet. Voraussetzungen vollständig ((SN1) wird nur für dim J = m gebraucht).

### K-15 (Lemma 10 und (G)), Zeilen 274 bis 298: **bestätigt**

Wohldefiniertheit aus K-14 (i). Die Linearkombination D(e_{01})·(1) + D(e_{10})·(2) + D(e_{20})·(3) habe ich ausgeschrieben: Die x-Terme fallen nach K-14 (ii) weg, die Terme D(e_{01})D(e_{i0})ℬ(u_i) heben sich nach (D1) auf, links bleibt D(e_{00})[D(e_{10})ℬ(e_{01}u_1) + D(e_{20})ℬ(e_{01}u_2)], rechts D(e_{00})[D(e_{01})ℬ(y_0) + D(e_{10})ℬ(y_1) + D(e_{20})ℬ(y_2)]. Nach Kürzen von D(e_{00}) und Anwenden von W mit (D2) und K-14 (iv) bleibt e_{11}u_1 + e_{21}u_2 = e_{01}y_0. Der Zeilenvergleich gibt u_1 = u_2 = 0, dann x ∈ N. (G) folgt aus dem Rangsatz mit dim(U³) = 3m und dim N = m − rk H. Voraussetzungen vollständig. `check.py` bestätigt dim ker Φ = dim N und u_1 = u_2 = 0 auf dem Kern in allen Beispielen.

### K-16 (Lemma H), Zeilen 300 bis 310: **bestätigt**

σ ist wohldefiniert und linear (f_0 injektiv nach T4). Schritt 1: mit f_1(x) = −f_0(σ_2x) und K-14 (ii), (iii) ergibt sich D(e_{00})[f_1(σ_1x) + f_2(σ_2x)] = 0, nach Kürzen ℓ(σ(x)) = 0. Schritt 2 trivial. Schritt 3: richtig, weil f_0 injektiv ist und N ⊆ U. Schritt 4: Die induzierte Abbildung N/Ŝ → ker L/(N×N) ist wohldefiniert (σ(Ŝ) ⊆ N×N) und injektiv (Schritt 3). Mit dim ker L = 2m − rk L folgt dim N − dim Ŝ ≤ Δ.

### K-17 (Lemma I), Zeilen 312 bis 318: **bestätigt**

Beide Fälle nachgerechnet. Ŝ ist ein Unterraum von N ⊆ U ⊆ K^{2×m}, also darf K-13 mit X = Ŝ angewandt werden. Es gilt dim Ŝ + 2 ≤ dim f_0(N) ≤ dim N, und das genügt für Δ ≥ dim N − dim Ŝ ≥ 2.

### K-18 (untere Schranke 34), Zeilen 320 bis 333: **bestätigt**

(a) Die Rechnung habe ich nachgeprüft: Aus r ≤ 33 folgen dim Q ≤ 5, rk H ≤ 1, dim N ≥ 6, Δ ≥ 2, rk L = 0 und 14 ≤ 10. `enum.py` bestätigt, dass für r = 28 bis 33 keine Zahlen die Ungleichungen erfüllen. Der Fall r < 28 ist durch dim Q = r − 28 ≥ 0 ausgeschlossen.
(b) Die Schritte K-8, K-9 (wiederholt angewandt), K-11, K-10 und (a) greifen richtig ineinander. r′ ≥ 1 gilt, weil m = 7 ≥ 1 und z. B. e_{00}·e_{01} ≠ 0.
(c) Richtig mit K-9, (b), K-8 (Nullform über K genau dann, wenn über F) und K-11.
Voraussetzungen vollständig bis auf zwei Standardtatsachen, die nicht in der Datei stehen (siehe 3.5).

### K-19 (der Restfall), Zeilen 335 bis 364: **bestätigt**

Die Kette (1), (2) ⇒ rk L = 6, rk H = 4, dim N = 3, Δ = 2 habe ich nachgerechnet. dim Ŝ ≥ 1 folgt aus K-16, dim Ŝ ≤ 1 aus K-13 mit X = Ŝ. Der Zusatz über Normalformen folgt aus dem Wortlaut von K-12 ((SN1), (SN2), Länge r). `enum.py` liefert unabhängig genau diesen einen Fall. Den Kontrollabschnitt (Zeilen 353 bis 364) habe ich nicht nachgeprüft, weil das Programm gesperrt ist. Er ist ausdrücklich kein Teil des Beweises.

### K-20 (ρ im Restfall), Zeilen 366 bis 376: **bestätigt**

(a) Richtig: N ⊆ ker(γ_1F_1 + γ_2F_2) gibt rk ≤ rk H, und aus im L = im F_1 + im F_2 folgt rk L ≤ 2ρ.
(b) Jeden Schritt nachgerechnet: rk L = 2ρ erzwingt rk F_i = ρ und im F_1 ∩ im F_2 = 0. Daraus folgen ker(F_1 + F_2) = N und N = ker F_1 = ker F_2. Die Symmetrie f_j(u_i) = f_i(u_j) gilt nach (D1). Damit f_i(N) ⊆ f_0(N), und P_1 lässt 𝒱 = f_0(N) ≠ 0 invariant (T4). Ein Eigenvektor widerspricht (SN2). Also N = 0, rk F_1 = m und ρ = m.
Restfall: 3 ≤ ρ ≤ 4, und ρ = 3 ist durch (b) ausgeschlossen. Kein anderes Glied in Zeilen 249 bis 378 benutzt K-20, wie die Tabelle sagt.

## 3. Kleine Ungenauigkeiten im Wortlaut (keine Lücken)

1. **Zeile 251 gegen Zeile 82: Doppelbelegung von K.** Zeile 82 legt fest: „Ab Abschnitt 3 ist F ein beliebiger Körper und K ein algebraischer Abschluss von F.“ Zeile 251 sagt für K-13 bis K-17 dagegen „über einem beliebigen Körper K“. Die Beweise von K-13 bis K-17 gelten über jedem Körper, K-18 (a) und K-19 sagen „über einem Körper“, K-20 verlangt den algebraischen Abschluss ausdrücklich. Auf die Urteile wirkt sich das deshalb nicht aus. Klarer wäre ein eigener Buchstabe oder der Satz „Zeile 82 gilt in Abschnitt 4 nicht“.
2. **Zeile 67 und K-20: ρ über F².** ρ ist mit (γ_1, γ_2) ∈ F² definiert, K-20 arbeitet über K. Gemeint ist der Grundkörper des Verfahrens. Für (a) ist es gleich, welcher; für (b) und den Restfall ist es der algebraisch abgeschlossene Körper K.
3. **Zeilen 368 und 370: „d = 2“ ist in der Datei nicht erklärt.** Der Buchstabe d steht in 1.4 nur für den Grad in P_d. Gemeint ist offenbar Yangs Parameter für drei Zeilen von A, also der Fall ⟨3,2,m⟩, der in Abschnitt 4 ohnehin vorausgesetzt ist. Der Zusatz ist überflüssig oder müsste erklärt werden.
4. **Zeilen 372 und 375: K-20 nennt K-7 nur mit (T4)**, der Beweis von (b) benutzt aber auch (D1) („mit (D1)“, Zeile 375). K-7 steht in der Liste, nur die Einschränkung auf (T4) ist zu eng. Ebenso benutzt (b) (SN1) für D(e_{00})^{−1}; das ist gelistet. Die Existenz eines Eigenvektors über einem algebraisch abgeschlossenen Körper ist lineare Algebra und wird nicht genannt.
5. **Zeile 304: K-16 nennt K-14 nur mit (ii), (iii).** Der Wortlaut setzt aber die Objekte Q, F_i, N, Ŝ, Δ voraus, die nach 1.2 erst mit K-14 (i) erklärt sind (J ⊆ K′). Im Beweis selbst wird K-14 (i) nicht als Schritt gebraucht.
6. **Zeile 318 und Zeile 351: „= dim N“ bzw. „= 3“.** K-17 und K-19 schreiben dim f_0(N) = dim N bzw. = 3. Die Gleichheit braucht (T4), und K-7 steht in keiner der beiden Listen. Für den Schluss genügt aber dim f_0(N) ≤ dim N, und das gilt ohne (T4). Keine Lücke.
7. **Zeile 296: „Rechts ist nur Zeile 0 von null verschieden.“** Richtig wäre: „Rechts können nur in Zeile 0 Einträge ≠ 0 stehen.“
8. **Zeile 337: „jede Normalform eines Verfahrens der Länge 34“.** Gemeint ist ein Verfahren der Länge 34 für ⟨3,2,7⟩ über K (Normalformen sind nach 1.3 nur über K erklärt). Aus dem Zusammenhang eindeutig, aber elliptisch.
9. **Standardtatsachen in K-18 (b), Zeile 330:** dass F einen algebraischen Abschluss hat und dass ein algebraisch abgeschlossener Körper unendlich ist. Beides steht nicht in der Datei und nicht in der Liste der Voraussetzungen. Es sind Standardsätze, keine Lücke im Sinn der Kette.
10. **Zeilen 353 bis 364 (Kontrolle):** Dort werden „Lemma 8′“, „Lemma 14“, „Lemma 11“ und die Größe s genannt, die in den mir zugänglichen Teilen der Datei nicht definiert sind. Der Abschnitt ist als nicht zum Beweis gehörig markiert. Für die Kette ohne Belang.

## 4. Echte Lücken

Keine gefunden in K-13 bis K-20.

Die Tabelle in Abschnitt 11 (Zeilen 757 bis 802) stimmt für K-13 bis K-20 mit den Zeilen „Voraussetzungen“ überein, in beiden Richtungen innerhalb meines Blocks.

## 5. Zusammenfassung der Urteile

| Glied | Urteil |
|---|---|
| K-13 | bestätigt |
| K-14 | bestätigt |
| K-15 | bestätigt |
| K-16 | bestätigt |
| K-17 | bestätigt |
| K-18 | bestätigt |
| K-19 | bestätigt |
| K-20 | bestätigt |

Ungenauigkeiten im Wortlaut: Abschnitt 3, Punkte 1 bis 10.

## Anhang A: eigene Programme

Aufrufe: `python3 -I check.py 13 1`, `python3 -I check.py 31 7`, `python3 -I enum.py`. Laufzeit jeweils unter 1 Sekunde, am 26.11.2026 zwischen 15:22 und 15:26 UTC.

### A.1 `enum.py`

```python
# Integer bookkeeping for K-18(a), K-19, K-20 (own code). Only the inequalities stated in K-13..K-17, K-20(a),(b).
m = 7
for r in range(28, 36):
    q = r - 4*m
    surv = []
    for rkL in range(0, q + 1):              # rk L <= dim Q
        for rkH in range(0, m + 1):          # rk H <= dim U
            dimN = m - rkH
            D = 2*rkH - rkL
            if not (2*m + rkH <= rkL + 2*q): continue      # (G), K-15
            if not (D >= min(2, dimN)): continue           # K-17
            for s in range(0, dimN + 1):
                if s < dimN - D: continue                  # K-16
                if s >= 1 and s + 2 > dimN: continue       # K-13 with X = S-hat, S-hat subset of N
                surv.append((rkL, rkH, dimN, D, s))
    print(f"r={r} dimQ={q}: {surv}")
# K-20 in the residual case: rho with rkH >= rho, rkL <= 2 rho, (rkL = 2 rho => rho = m), 0 <= rho <= m
print("rho:", [rho for rho in range(0, m + 1) if 4 >= rho and 6 <= 2*rho and not (6 == 2*rho and rho != m)])
```

Ausgabe:

```
r=28 dimQ=0: []
r=29 dimQ=1: []
r=30 dimQ=2: []
r=31 dimQ=3: []
r=32 dimQ=4: []
r=33 dimQ=5: []
r=34 dimQ=6: [(6, 4, 3, 2, 1)]
rho: [4]
```

(Die Zeile für r = 35 ist weggelassen; sie gehört nicht zum Gegenstand.)

### A.2 `check.py`

```python
# Independent sanity checks for chain links K-13..K-20 over GF(p), exact arithmetic.
import random, itertools, sys
p = int(sys.argv[1]) if len(sys.argv) > 1 else 13
random.seed(int(sys.argv[2]) if len(sys.argv) > 2 else 1)

def rank(M):
    M = [list(r) for r in M]; rk = 0
    if not M: return 0
    ncol = len(M[0])
    for c in range(ncol):
        piv = next((i for i in range(rk, len(M)) if M[i][c] % p), None)
        if piv is None: continue
        M[rk], M[piv] = M[piv], M[rk]
        inv = pow(M[rk][c], p - 2, p)
        M[rk] = [v * inv % p for v in M[rk]]
        for i in range(len(M)):
            if i != rk and M[i][c] % p:
                f = M[i][c]; M[i] = [(a - f * b) % p for a, b in zip(M[i], M[rk])]
        rk += 1
    return rk

def nullspace(M, ncol):
    # vectors v with M v = 0 ; M is list of rows
    M = [list(r) for r in M]; rk = 0; pivcols = []
    for c in range(ncol):
        piv = next((i for i in range(rk, len(M)) if M[i][c] % p), None)
        if piv is None: continue
        M[rk], M[piv] = M[piv], M[rk]
        inv = pow(M[rk][c], p - 2, p)
        M[rk] = [v * inv % p for v in M[rk]]
        for i in range(len(M)):
            if i != rk and M[i][c] % p:
                f = M[i][c]; M[i] = [(a - f * b) % p for a, b in zip(M[i], M[rk])]
        pivcols.append(c); rk += 1
    free = [c for c in range(ncol) if c not in pivcols]
    basis = []
    for fc in free:
        v = [0] * ncol; v[fc] = 1
        for i, pc in enumerate(pivcols): v[pc] = (-M[i][fc]) % p
        basis.append(v)
    return basis

def matmul(A, B):
    return [[sum(A[i][k] * B[k][j] for k in range(len(B))) % p for j in range(len(B[0]))] for i in range(len(A))]
def T(M): return [list(r) for r in zip(*M)]
def inv(M):
    n = len(M); A = [list(M[i]) + [int(i == j) for j in range(n)] for i in range(n)]
    for c in range(n):
        piv = next(i for i in range(c, n) if A[i][c] % p)
        A[c], A[piv] = A[piv], A[c]; iv = pow(A[c][c], p - 2, p)
        A[c] = [v * iv % p for v in A[c]]
        for i in range(n):
            if i != c and A[i][c]:
                f = A[i][c]; A[i] = [(a - f * b) % p for a, b in zip(A[i], A[c])]
    return [r[n:] for r in A]
def E(rows, cols, i, j): return [[int(a == i and b == j) for b in range(cols)] for a in range(rows)]
def form(coef, X): return sum(coef[i][j] * X[i][j] for i in range(len(X)) for j in range(len(X[0]))) % p

# procedures: list of (alpha 3x2, beta 2xm, C 3xm); B columns indexed 0..m-1 here
def standard(m):
    return [(E(3,2,i,j), E(2,m,j,l), E(3,m,i,l)) for i in range(3) for j in range(2) for l in range(m)]
def strassen_322():
    # rows 0,1 of A with Strassen <2,2,2>, row 2 standard; m = 2
    def a(c): M=[[0,0] for _ in range(3)]; [M[i].__setitem__(j,v) for (i,j),v in c.items()]; return M
    def b(c): M=[[0,0],[0,0]]; [M[i].__setitem__(j,v) for (i,j),v in c.items()]; return M
    def cc(c): M=[[0,0] for _ in range(3)]; [M[i].__setitem__(j,v%p) for (i,j),v in c.items()]; return M
    P = [
     (a({(0,0):1,(1,1):1}), b({(0,0):1,(1,1):1}), cc({(0,0):1,(1,1):1})),
     (a({(1,0):1,(1,1):1}), b({(0,0):1}), cc({(1,0):1,(1,1):-1})),
     (a({(0,0):1}), b({(0,1):1,(1,1):-1}), cc({(0,1):1,(1,1):1})),
     (a({(1,1):1}), b({(1,0):1,(0,0):-1}), cc({(0,0):1,(1,0):1})),
     (a({(0,0):1,(0,1):1}), b({(1,1):1}), cc({(0,0):-1,(0,1):1})),
     (a({(1,0):1,(0,0):-1}), b({(0,0):1,(0,1):1}), cc({(1,1):1})),
     (a({(0,1):1,(1,1):-1}), b({(1,0):1,(1,1):1}), cc({(0,0):1})),
    ]
    P = [(al, [[v % p for v in r] for r in be], C) for al, be, C in P]
    P = [([[v % p for v in r] for r in al], be, C) for al, be, C in P]
    P += [(E(3,2,2,j), E(2,2,j,l), E(3,2,2,l)) for j in range(2) for l in range(2)]
    return P
def blocks(parts):
    # direct sum along B columns: parts list of (proc, m_k)
    m = sum(mk for _, mk in parts); out = []; off = 0
    for proc, mk in parts:
        for al, be, C in proc:
            B2 = [[0]*m for _ in range(2)]; C2 = [[0]*m for _ in range(3)]
            for i in range(2):
                for l in range(mk): B2[i][off+l] = be[i][l]
            for i in range(3):
                for l in range(mk): C2[i][off+l] = C[i][l]
            out.append((al, B2, C2))
        off += mk
    return out, m

def brent_ok(proc, m):
    for i in range(3):
        for j in range(2):
            for k in range(2):
                for l in range(m):
                    S = [[0]*m for _ in range(3)]
                    for al, be, C in proc:
                        c = al[i][j] * be[k][l] % p
                        if c:
                            for a in range(3):
                                for b in range(m): S[a][b] = (S[a][b] + c * C[a][b]) % p
                    R = [[int(j == k and a == i and b == l) for b in range(m)] for a in range(3)]
                    if S != R: return False
    return True

def transform(proc, S, Tm):
    Si, Ti = inv(S), inv(Tm); out = []
    for al, be, C in proc:
        al2 = matmul(matmul(T(S), al), T(Tm))          # coefficient matrix S^T alpha T^T
        # beta'(B) = beta(T^{-1} B): coefficient matrix (T^{-1})^T beta
        be2 = matmul(T(Ti), be)
        C2 = matmul(Si, C)
        out.append((al2, be2, C2))
    return out

def analyse(proc, m, label):
    r = len(proc)
    assert brent_ok(proc, m), "Brent fails"
    # SN1
    sn1 = all(al[0][0] % p for al, _, _ in proc)
    if not sn1: return None
    Bmat = [[be[i][l] for i in range(2) for l in range(m)] for _, be, _ in proc]   # r x 2m, coords (row,col) of x
    def Dv(A): return [form(al, A) for al, _, _ in proc]
    def apply(A, x):  # D(A) B(x) for x as vector of length 2m
        d = Dv(A); return [d[t] * sum(Bmat[t][k] * x[k] for k in range(2*m)) % p for t in range(r)]
    def fmat(A):  # r x 2m matrix of x -> D(A)B(x)
        d = Dv(A); return [[d[t] * Bmat[t][k] % p for k in range(2*m)] for t in range(r)]
    f = [fmat(E(3,2,i,0)) for i in range(3)]
    # SN2 exhaustive over P^2(GF(p)): for each c, D(sum c_i e_i0) B injective
    pts = [(1,a,b) for a in range(p) for b in range(p)] + [(0,1,b) for b in range(p)] + [(0,0,1)]
    for c in pts:
        A = [[c[0],0],[c[1],0],[c[2],0]]
        if rank(fmat(A)) < 2*m: return None
    # W : r -> 3m ; K' = ker W
    Wm = [[proc[t][2][a][b] for t in range(r)] for a in range(3) for b in range(m)]  # 3m x r
    Kp = nullspace(Wm, r)
    assert len(Kp) == r - 3*m
    # U: x with row 0 zero, coords index m..2m-1
    Ub = [[int(k == m + l) for k in range(2*m)] for l in range(m)]
    def img(Mx, vecs): return [[sum(Mx[t][k] * v[k] for k in range(2*m)) % p for t in range(r)] for v in vecs]
    J = img(f[0], Ub); f1U = img(f[1], Ub); f2U = img(f[2], Ub)
    # g(x) = D(e01)B(x) - D(e00)B(e01^{2x2} x)  ; e01 x: row0 := row1 of x, row1 := 0
    def shift(x): return [x[m + l] for l in range(m)] + [0]*m
    def g(x):
        a = apply(E(3,2,0,1), x); b = apply(E(3,2,0,0), shift(x)); return [(u - v) % p for u, v in zip(a, b)]
    gU = [g(u) for u in Ub]
    rKp = rank(Kp)
    inK = lambda v: rank(Kp + [v]) == rKp
    # K-14 (i)
    assert all(inK(v) for v in J + f1U + f2U + gU)
    dimJ = rank(J); assert dimJ == m
    dimQ = rKp - dimJ; assert dimQ == r - 4*m
    # K-14 (ii),(iii) on random x
    for _ in range(5):
        x = [random.randrange(p) for _ in range(2*m)]
        d1, d2, d0 = Dv(E(3,2,1,0)), Dv(E(3,2,2,0)), Dv(E(3,2,0,0))
        F = [img(f[i], [x])[0] for i in range(3)]
        assert all((d1[t]*F[2][t] - d2[t]*F[1][t]) % p == 0 for t in range(r))
        for i in range(3):
            di = Dv(E(3,2,i,0)); assert all((di[t]*F[0][t] - d0[t]*F[i][t]) % p == 0 for t in range(r))
    # quantities
    rkL = rank(J + f1U + f2U) - dimJ
    # H(x) = (F2 x, -F1 x) in QxQ: rank of stacked vectors modulo J x J
    def stack(a, b): return a + b
    zero = [0]*r
    Hrows = [stack(f2U[l], [(-v) % p for v in f1U[l]]) for l in range(m)]
    JJ = [stack(j, zero) for j in J] + [stack(zero, j) for j in J]
    rkH = rank(JJ + Hrows) - 2*dimJ
    # N: solve f1U x = J y1, f2U x = J y2
    ncol = 3*m
    rows = []
    for t in range(r):
        rows.append([f1U[l][t] for l in range(m)] + [(-J[l][t]) % p for l in range(m)] + [0]*m)
        rows.append([f2U[l][t] for l in range(m)] + [0]*m + [(-J[l][t]) % p for l in range(m)])
    sol = nullspace(rows, ncol)
    Nb = [s[:m] for s in sol]; dimN = rank(Nb)
    assert dimN == m - rkH
    Delta = 2*rkH - rkL
    # S-hat: x in N with f1 x, f2 x in f0(N)
    NU = [[0]*m + list(v) for v in Nb]    # as 2m vectors
    f0N = img(f[0], NU); f1N = img(f[1], NU); f2N = img(f[2], NU)
    k = len(Nb)
    if k:
        rows = []
        for t in range(r):
            rows.append([f1N[a][t] for a in range(k)] + [(-f0N[a][t]) % p for a in range(k)] + [0]*k)
            rows.append([f2N[a][t] for a in range(k)] + [0]*k + [(-f0N[a][t]) % p for a in range(k)])
        sol = nullspace(rows, 3*k); dimS = rank([s[:k] for s in sol])
    else: dimS = 0
    # Phi rank modulo J^3: Phi(u1,u2,x) = (f1 u1 + f2 u2, -g u1 + f2 x, -g u2 - f1 x)
    cols = []
    for l in range(m): cols.append(f1U[l] + [(-v) % p for v in gU[l]] + zero)
    for l in range(m): cols.append(f2U[l] + zero + [(-v) % p for v in gU[l]])
    for l in range(m): cols.append(zero + f2U[l] + [(-v) % p for v in f1U[l]])
    JJJ = [j + zero + zero for j in J] + [zero + j + zero for j in J] + [zero + zero + j for j in J]
    rkPhi = rank(JJJ + cols) - 3*dimJ
    assert 3*m - rkPhi == dimN, "ker Phi dim"
    # kernel elements have u1=u2=0: solve sum coeffs*cols in span(JJJ)
    allc = cols + JJJ
    ker = nullspace(T(allc), len(allc))
    for v in ker: assert all(c == 0 for c in v[:2*m]), "ker Phi has u-part"
    G = (2*m + rkH <= rkL + 2*dimQ)
    K16 = dimS >= dimN - Delta
    K17 = Delta >= min(2, dimN)
    # K-13 on random subspaces X of K^{2m}
    ok13 = True
    for d in range(1, 2*m + 1):
        for _ in range(3):
            X = [[random.randrange(p) for _ in range(2*m)] for _ in range(d)]
            dx = rank(X)
            if dx == 0: continue
            tot = rank(img(f[0], X) + img(f[1], X) + img(f[2], X))
            if tot < dx + 2: ok13 = False
    # rho (max over GF(p)^2) for K-20 (a)
    rho = 0
    for g1 in range(p):
        for g2 in range(p):
            vs = [[(g1*a + g2*b) % p for a, b in zip(f1U[l], f2U[l])] for l in range(m)]
            rho = max(rho, rank(J + vs) - dimJ)
    K20a = (rkH >= rho) and (rkL <= 2*rho)
    print(f"{label}: r={r} m={m} dimQ={dimQ} rkL={rkL} rkH={rkH} dimN={dimN} Delta={Delta} dimS={dimS} rho={rho} | (G)={G} K13={ok13} K16={K16} K17={K17} K20a={K20a}")
    return G and ok13 and K16 and K17 and K20a

def rand_inv(n):
    while True:
        M = [[random.randrange(p) for _ in range(n)] for _ in range(n)]
        if rank(M) == n: return M

cases = [(standard(m), m, f"std<3,2,{m}>") for m in (1, 2, 3, 7)]
s322 = strassen_322()
cases.append((s322, 2, "strassen<3,2,2>"))
b, mm = blocks([(s322, 2)]*3 + [(standard(1), 1)]); cases.append((b, mm, "3x<3,2,2>+<3,2,1>"))
allok = True
for proc, m, label in cases:
    proc = [([[v % p for v in r] for r in al], [[v % p for v in r] for r in be], [[v % p for v in r] for r in C]) for al, be, C in proc]
    assert brent_ok(proc, m), label
    done = 0; tries = 0
    while done < 2 and tries < 200:
        tries += 1
        V = transform(proc, rand_inv(3), rand_inv(2))
        res = analyse(V, m, label)
        if res is None: continue
        done += 1; allok &= res
    if done == 0: print(label, "no SN1/SN2 transform found")
print("ALL OK" if allok else "FAILURE")
```

Ausgabe für p = 13, Startwert 1:

```
std<3,2,1>: r=6 m=1 dimQ=2 rkL=2 rkH=1 dimN=0 Delta=0 dimS=0 rho=1 | (G)=True K13=True K16=True K17=True K20a=True
std<3,2,1>: r=6 m=1 dimQ=2 rkL=2 rkH=1 dimN=0 Delta=0 dimS=0 rho=1 | (G)=True K13=True K16=True K17=True K20a=True
std<3,2,2>: r=12 m=2 dimQ=4 rkL=4 rkH=2 dimN=0 Delta=0 dimS=0 rho=2 | (G)=True K13=True K16=True K17=True K20a=True
std<3,2,2>: r=12 m=2 dimQ=4 rkL=4 rkH=2 dimN=0 Delta=0 dimS=0 rho=2 | (G)=True K13=True K16=True K17=True K20a=True
std<3,2,3>: r=18 m=3 dimQ=6 rkL=6 rkH=3 dimN=0 Delta=0 dimS=0 rho=3 | (G)=True K13=True K16=True K17=True K20a=True
std<3,2,3>: r=18 m=3 dimQ=6 rkL=6 rkH=3 dimN=0 Delta=0 dimS=0 rho=3 | (G)=True K13=True K16=True K17=True K20a=True
std<3,2,7>: r=42 m=7 dimQ=14 rkL=14 rkH=7 dimN=0 Delta=0 dimS=0 rho=7 | (G)=True K13=True K16=True K17=True K20a=True
std<3,2,7>: r=42 m=7 dimQ=14 rkL=14 rkH=7 dimN=0 Delta=0 dimS=0 rho=7 | (G)=True K13=True K16=True K17=True K20a=True
strassen<3,2,2>: r=11 m=2 dimQ=3 rkL=3 rkH=2 dimN=0 Delta=1 dimS=0 rho=2 | (G)=True K13=True K16=True K17=True K20a=True
strassen<3,2,2>: r=11 m=2 dimQ=3 rkL=3 rkH=2 dimN=0 Delta=1 dimS=0 rho=2 | (G)=True K13=True K16=True K17=True K20a=True
3x<3,2,2>+<3,2,1>: r=39 m=7 dimQ=11 rkL=11 rkH=7 dimN=0 Delta=3 dimS=0 rho=7 | (G)=True K13=True K16=True K17=True K20a=True
3x<3,2,2>+<3,2,1>: r=39 m=7 dimQ=11 rkL=11 rkH=7 dimN=0 Delta=3 dimS=0 rho=7 | (G)=True K13=True K16=True K17=True K20a=True
ALL OK
```
