# S4-31: Prüfbericht zu B-030 (Normalform, Lemma O, Satz G, Lemma F, Formeln)

Rolle: Prüfer. Auftrag S4-31 vom Orchestrator. Geprüfter Stand: `behauptungen/B-030.md` auf main (Commit 93c0df0) und `lean/prosa/s4_327_spurA_r4_m21.md` (SHA-256 348a79865dd7b5f159163a7b03d2b0df9aeef4e551ae16ee7dde74fabf1710a5, stimmt mit der Angabe in B-030 überein). Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet.** Mir war beim Start der Index des Projektgedächtnisses eingeblendet. Er enthält Projektregeln: Ziel des Projekts, Rollen, Rechte und Grenzen des Orchestrators, Budget von Stufe 4 (6 Runden zu je bis zu 6 Subagenten), Regeln zu Fremdmodellen, Literaturwachen und Merges, die Vorgabe zu „blind“ und „unabhängiger Sucher“, Verweise auf zwei Einzeleinträge (Datenformat der Verfahren, Lean-CI). Über B-030, ihre Aussagen oder ein Prüfurteil stand dort nichts. Später wurden drei Einzeleinträge eingeblendet: „gemini-bridge“ (Bridge-Freigabe und Zeitlimit), „aussagen-abgleich-n3“ (Bridge und lokaler Lean-Bau) und „hk-verfahren-a10“ (Verfahrensdateien 3×2×5 und 3×2×6 in `verfahren/`). Auch darin steht nichts zu B-030. Ich habe ins Gedächtnis nichts geschrieben.

**Spuren und Wissen um Abhängigkeiten (Protokoll 5.4).**
- `behauptungen/B-030.md` selbst sagt unter „Wer was benutzt“, dass S4-27 (B-029) und S4-28 (B-028) sich auf Lemma O, Lemma F, Satz G und die Formeln stützen, und verweist auf `pruefvermerke/B-030.md`. Ich weiß damit aus der Positivliste, was von meinem Urteil abhängt. Ein Urteil zu B-030 habe ich nicht gesehen; `pruefvermerke/` habe ich nicht geöffnet.
- Beim Wechsel auf den Arbeitszweig habe ich mit `git log --oneline -3` die drei letzten Commit-Titel von main gesehen, darunter „Runde 5 abgeschlossen: S4-29 eingetragen, B-031 angelegt, Zähler Spur A 2 von 3, Budget 5 von 6“ und „Vor Runde 6: Gedächtnisdurchsicht“. Daraus ergibt sich nichts über B-030.
- Der Auftrag nennt einen zweiten, unabhängigen Prüfer derselben Behauptung.
- Ich habe mit `grep` die Überschriften der vier Quelldateien aufgelistet. Dabei sah ich Abschnittsnamen außerhalb der erlaubten Abschnitte (etwa „8.1 Die Lücke L-21 genau“, Namen der Anhänge), aber keinen Text daraus.

**Abweichung von der Positivliste.** In `lean/prosa/yang_n3.md` habe ich zusätzlich Abschnitt 2 (Bezeichnungen: D(A), ℬ, W, (Z′), (D1), (D2)) gelesen, um Lemma A in Abschnitt 5 lesen zu können. Er enthält nur Bezeichnungen. In `s4_327_spurA_r4_m21.md` habe ich die Zeilen ab Abschnitt 1 bis Ende Abschnitt 5 gelesen, nicht Abschnitt 0 und nichts ab Abschnitt 6. Abschnitt 1 der Quelle enthält den Wortlaut von S4-21-C, -D, -E, -V und L-21; den habe ich gesehen, aber nicht geprüft. Aus `s4_327_spurA_r3_e3.md` habe ich die Abschnitte 2 bis 5 gelesen (Abschnitt 1 nur in der Wiedergabe in B-026). Sonst habe ich keine Datei des Repos gelesen.

## 1. Was ich als Voraussetzung benutzt habe

Ohne eigene vollständige Prüfung übernommen (nach dem Auftrag erlaubt):

1. **B-026, Aussage A (Satz R)** samt den „gleichwertigen Formen“: im Fall e = 3 ist K″ unter a_1, a_2 abgeschlossen und K″ = A·w + A·u, dim K″ = 21.
2. **S4-14, Abschnitt 4, Schritt 1 und Schritt 5** (B-026): K^34 = K″ ⊕ b_0·K′ und K″ = K′ ⊕ Θ(J³_0). Schritt 2 (j_i ∈ w·P_2 für (j_0, j_1, j_2) ∈ J³_0) habe ich selbst nachgerechnet: aus der Injektivität von ε auf P_3 ⊕ P_1 folgt s_0 + s_1a_1 + s_2a_2 = 0 als Polynom, also s_i = 0.
3. **S4-07 (`s4_327_spurA_r2_bau.md`)**: Abschnitt 1.1 (Normalform, Skalierung; Länge 34 ist die untere Schranke, also keine Nullform; jede Normalform liegt im Restfall R-327), 1.2 (Bezeichnungen, N = {y : a_1·j_y ∈ J, a_2·j_y ∈ J}, dim N = 3, dim S = 1, K′ = J + a_1J + a_2J), Abschnitt 2 ((A) bis (D), (C′)), 3.1 (w, f_0(N) = w·P_1, w·P_2 ⊆ J, e ≤ 3), 3.3 (Θ(j) = c_1j_1 + c_2j_2 auf J³_0, Θ injektiv modulo K′, dim Θ(J³_0) = 8), 4.2 (ker L ⊆ (w·P_2)²).
4. **Restfall R-327 (B-017 bis B-019)** nur in der Form, wie S4-07 Abschnitt 1.1 und 1.2 ihn zitiert: In jeder Normalform gilt dim N = 3, dim S = 1, rk L = 6. Die Dateien B-017 bis B-019 habe ich nicht gelesen.
5. **`yang_n3.md`**: R1, R3, G4, Definition von (SN1), (SN2), Lemma A. Den Beweis von Lemma A und die Rechnung in R3 habe ich gelesen und für richtig befunden.

## 2. Urteile im Überblick

| Teil von B-030 | Urteil |
|---|---|
| Vorbemerkung („Normalform zu (S, T)“, G*) | keine Aussage, nur Erklärung; widerspruchsfrei, eine Anmerkung (3.1) |
| S4-21-A (Lemma O), Satz 1: G* offen, nicht leer | bestätigt |
| S4-21-A, Satz 2: {e = 3} offen in GL_3 × GL_2 | bestätigt |
| S4-21-A, Satz 3: nicht leer ⇒ dicht | bestätigt |
| S4-21-B (Satz G) (i) | bestätigt |
| S4-21-B (Satz G) (ii) | bestätigt |
| Lemma F | bestätigt für Formen ≠ 0, also im Zusammenhang der Quelle; im isolierten Wortlaut ohne diese Voraussetzung falsch (Gegenbeispiel in 3.5) |
| Formeln aus Abschnitt 3 | bestätigt |

## 3. Einzelprüfung

### 3.1 Vorbemerkung

Die Erklärung von „Normalform zu (S, T)“ ist eindeutig: Zu gegebenem (S, T) ist der Basiswechsel R3 festgelegt, ebenso die Skalierung durch a′_0(t) = α′_t(e_{00}). R2 wird in der Vorbemerkung nicht genannt. Das schadet nicht: (SN1) erzwingt α_t ≠ 0 für alle t, und dass G* nicht leer ist, braucht über Lemma A, dass das Ausgangsverfahren keine Nullform hat; das folgt aus Länge 34 = untere Schranke (S4-07, 1.1; Voraussetzung).

### 3.2 Lemma O (S4-21-A), Abschnitt 4 der Quelle

**G* offen und nicht leer.** α′_t(e_{00}) = α_t(S e_{00} T) = α_t(u_0 p) = u_0ᵀα_tpᵀ, also ist (SN1) die offene Bedingung Π_t u_0ᵀα_tpᵀ ≠ 0. Für (SN2): f′_i(v) = (α_t(u_i p)·β_t(T^{−1}v))_t. Die 3×3-Minoren der 34×3-Matrix [f′_0(v), f′_1(v), f′_2(v)] sind Polynome in den Einträgen von S, T^{−1} (regulär auf G) und v, homogen in v (Grad 3). Die Menge {((S, T), [v]) : alle Minoren verschwinden} ist also abgeschlossen in G × P^{13}, und ihr Bild unter der Projektion nach G ist abgeschlossen, weil P^{13} vollständig ist. Das Komplement, wo (SN2) gilt, ist offen. Die Skalierung ändert (SN2) nicht (invertierbare Diagonalmatrix). G* ≠ ∅ nach Lemma A über K (unendlich, keine Nullform). Bestätigt.

**Regularität.** Nach der Skalierung ist q_k(t) = β_t(T^{−1}e_{1k}) (β wird nicht skaliert) und a_i(t) = u_iᵀα_tpᵀ / u_0ᵀα_tpᵀ, regulär auf G*. Nach der Skalierung ist D(e_{00}) = I, also f_0 = ℬ und q_k = f_0(e_{1k}); G4 gibt rk Q = 7. Bestätigt.

**Rangformel.** Ker Ξ = {(y, y′, y″) : a_1·Qy = Qy′, a_2·Qy = Qy″}; weil Q injektiv ist, sind y′, y″ durch y bestimmt, und die Projektion auf y ist eine Bijektion auf N. Mit dim N = 3 (Restfall in jeder Normalform) ist rk Ξ = 21 − 3 = 18. Γ(ker Ξ³) = Q(N) + a_1·Q(N) + a_2·Q(N), und mit Q(N) = f_0(N) = w·P_1 (S4-07, 3.1) ist das w·P_2. Dimensionsrechnung: dim ker Ξ³ = 9, dim(ker Ξ³ ∩ ker Γ) = dim ker[Ξ³; Γ] = 63 − rk[Ξ³; Γ], also e + 3 = rk[Ξ³; Γ] − 54. Mit e ≤ 3 ist {e = 3} = G* ∩ {rk ≥ 60}, und das ist offen (ein 60×60-Minor aus regulären Funktionen ≠ 0). Da G* offen in G ist, ist die Menge offen in G. GL_3 × GL_2 ist eine offene Teilmenge eines affinen Raums, also irreduzibel, und jede nicht leere offene Teilmenge ist dicht. Bestätigt.

Die Rangformel habe ich zusätzlich mit eigenem Programm an künstlichen Lagen nachgerechnet (Anhang, Test T3): In 12 Lagen über GF(32003), davon 4 mit dim w·P_2 = 5 (Träger von w auf einem Kegelschnitt), war stets dim(Q(N) + a_1Q(N) + a_2Q(N)) = rk[Ξ³; Γ] − 3·rk Ξ, und bei dim N = 3 also e + 3 = rk − 54 (Werte 60 bzw. 59). Die künstlichen Lagen sind keine Verfahren; sie prüfen nur die lineare Algebra der Formel.

### 3.3 Satz G (i), Abschnitte 5.2 bis 5.8 der Quelle

Ich habe jeden Schritt nachvollzogen:

- **5.1/5.2, G_gen.** Für Paare, die weder (I) noch (II) erfüllen, verschwindet einer der drei quadratischen 2×2-Minoren in p nicht identisch; V_{tt′} liegt in seiner Nullstellenmenge. (Die Quelle sagt „ist die Nullstellenmenge“; richtig ist „liegt in“. Für die Offenheit und Dichtheit von G_gen ist das gleichgültig.) Die Bedingung „p außerhalb dieser endlich vielen echten abgeschlossenen Mengen“ ist offen und nicht leer, da K unendlich ist, und p ≠ 0 lässt sich zu einem invertierbaren T ergänzen. Der Durchschnitt mit {e = 3} ist offen, nicht leer und dicht.
- **Gleiche a-Punkte.** Der a-Punkt von t ist [Sᵀα_tpᵀ] mit a′_0(t) ≠ 0. Zwei a-Punkte sind gleich genau dann, wenn Sᵀα_tpᵀ und Sᵀα_{t′}pᵀ abhängig sind, wegen S invertierbar genau dann, wenn p ∈ V_{tt′}. Auf G_gen geschieht das nur bei (I) oder (II). Eine Faser kann keine Rang-2- und Rang-1-Form zugleich enthalten (weder (I) noch (II) möglich), Rang-2-Formen in einer Faser sind paarweise proportional, Rang-1-Formen in einer Faser haben dieselbe Spalte (bei (I) mit λ ≠ 0 ebenfalls). Rang 0 tritt wegen (SN1) nicht auf. Also Y = Vereinigung der Fasern der Klasse II = {rk = 1}, Z = {rk = 2}. Bestätigt.
- **5.3.** Klasse I: a′(t′) = λa′(t), b′(t′) = λb′(t), λ ≠ 0 wegen a′_0 ≠ 0, nach der Skalierung a(t′) = a(t), b(t′) = b(t). Klasse II: a′(t) = (y·p)Sᵀx, b′(t) = (y·p′)Sᵀx, y·p ≠ 0, also b = r_t·a, b_0 = r_t, c_i = r_ta_i − a_ir_t = 0. Bestätigt.
- **5.4.** K″ ist A-Modul (Satz R), also K″ = ⊕_p e_p·K″ mit e_p·K″ = span(e_p·w, e_p·u) (K″ = A·w + A·u, A wirkt auf K^{T_p} durch Skalare), d_p ≤ 2, Σd_p = 21. e_p·(K″ + b_0·K′) = K^{T_p} und b_0·e_p·K′ ⊆ b_0·M_p, also |T_p| ≤ 2d_p; auf Klasse I ist b_0 konstant, also |T_p| = d_p. 13 = Σ_p(|T_p| − d_p) = Σ_{p⊆Y}(|T_p| − d_p) ≤ Σ_{p⊆Y}|T_p|/2 = |Y|/2. Bestätigt.
- **5.5.** Θ(J³_0) ⊆ K″ ∩ K^Z = ⊕_{p⊆Z} M_p = ⊕_{p⊆Z} K^{T_p} = K^Z, Dimension |Z|, und dim Θ(J³_0) = 8, also |Z| ≥ 8; mit |Y| ≥ 26 und |Y| + |Z| = 34 folgt Gleichheit überall, |T_p| = 2d_p auf Y, Σ_{p⊆Y} d_p = 13, Θ(J³_0) = K^Z, K″ = K′ ⊕ K^Z, K′ ∩ K^Z = 0. Bestätigt.
- **5.6.** c_i ist auf jeder Faser konstant, also c_i = C_i mit C_i ∈ A (Interpolation). Mit j_1, j_2 ∈ w·P_2 (S4-07, 4.2, und S4-14, Schritt 2) ist Θ(j) ∈ A·w, also K^Z ⊆ A·w und für T_p ⊆ Z: K^{T_p} ⊆ K·(e_p·w), also |T_p| = 1 und w ≠ 0 dort. Zwei proportionale Rang-2-Formen hätten denselben a-Punkt (Richtung „⇐“ von Lemma F), also sind die 8 Formen paarweise nicht proportional. Bestätigt.
- **5.7.** Spalten a(z) = (1, z_1, z_2), b(z) = b_0(z)·a(z) + (0, c_1(z), c_2(z)), Rang 2 ⇔ (c_1(z), c_2(z)) ≠ (0, 0). K′ ∩ K^Z = 0 = ker W ∩ K^Z heißt, dass die C_t = W(e_t), t ∈ Z, linear unabhängig sind. In der Normalform ist C_t = a′_0(t)·S^{−1}·C_t^{alt}; das erhält lineare Unabhängigkeit, ebenso der Übergang von F nach K (die C_t haben Einträge in F). Bestätigt.
- **5.8, (i).** α′_t = Sᵀα_tTᵀ als Matrix (nachgerechnet, auch im Programm T1), also sind Rang, Proportionalität und Spaltengerade invariant unter R3, die Skalierung ändert sie nicht, und Rang sowie lineare Unabhängigkeit über F und K stimmen überein (für Vektoren über F ist K·x = K·x′ gleichwertig zu F·x = F·x′). Die Klassen der Rang-1-Formen nach K·x_t sind genau die Fasern über Y: gleiche Spalte ⇒ (II) ⇒ V = K^{1×2} ⇒ gleicher a-Punkt; umgekehrt gleicher a-Punkt in Y ⇒ gleiche Spalte. Größen |T_p| = 2d_p ∈ {2, 4}, Σ d_p = 13 mit d_p ∈ {1, 2} ergibt 7 ≤ Zahl der Klassen ≤ 13. Bestätigt.

**Urteil (i): bestätigt.** Benutzt sind Lemma O, G_gen, Satz R (B-026) und die Voraussetzungen aus Abschnitt 1.

### 3.4 Satz G (ii)

Die dichte offene Menge ist {e = 3} ∩ G_gen. Die Schritte 5.2 bis 5.7 benutzen von (S, T) nur, dass es in diesem Durchschnitt liegt; sie gelten also für jeden Punkt dieser Menge, nicht nur für den einen gewählten. Jede Einzelaussage von (ii) habe ich oben an ihrer Stelle bestätigt: e = 3 und (M21) (5.2 mit Satz R), c_1 = c_2 = 0 auf Y (5.3), 8 verschiedene a-Punkte mit je einem Index und w ≠ 0 (5.6), (c_1(z), c_2(z)) ≠ (0, 0) (5.7), |T_p| = 2d_p und Σ_{p⊆Y} d_p = 13 (5.5), K′ ∩ K^Z = 0, K″ = K′ ⊕ K^Z und Θ(J³_0) = K^Z (5.5). **Urteil (ii): bestätigt.**

### 3.5 Lemma F (Abschnitt 5.1 der Quelle)

„⇐“ ist richtig. „⇒“ für Rang 2: λ(p) ist auf einer Basis p_1, p_2 konstant (das Argument mit p_1 + p_2 ≠ 0 ist richtig), also α_{t′} = λα_t. Beide Rang 1: Es gibt p mit y·p ≠ 0 ≠ y′·p, und aus der Abhängigkeit der von 0 verschiedenen Vektoren (y·p)x, (y′·p)x′ folgt K·x = K·x′. Richtig.

**Vorbehalt (genaue Stelle).** Der Beweis behandelt nur die Ränge 1 und 2. Ist eine der beiden Formen die Nullform, ist der isolierte Wortlaut falsch: Für α_t = 0 und α_{t′} mit Rang 2 (oder Rang 1) ist V_{tt′} = K^{1×2}, aber weder (I) (α_{t′} = λ·0 = 0) noch (II) gilt. Die Lücke steckt im Satz „Hat α_{t′} Rang 2, ebenso mit vertauschten Rollen; dann hat auch α_t Rang 2 (Fall I)“: Mit vertauschten Rollen erhält man α_t = λ′·α_{t′}, und daraus α_{t′} = λ′^{−1}·α_t nur für λ′ ≠ 0, also α_t ≠ 0. Im Zusammenhang der Quelle sind alle α_t Formen eines Verfahrens der Länge 34 (keine Nullform, S4-07 1.1) bzw. einer Normalform ((SN1)); dort gilt Lemma F. Mein Programm (T2) hat in 60 000 zufälligen Paaren ganzzahliger 3×2-Matrizen die identische Verschwindung der Minoren mit (I) ∨ (II) verglichen; alle Abweichungen (7 983) betrafen ein Paar mit einer Nullform, keine ein Paar zweier Formen ≠ 0.

**Urteil: bestätigt für α_t ≠ 0 ≠ α_{t′}** (so, wie Satz G es benutzt). Als isolierte Aussage über beliebige 3×2-Matrizen fehlt diese Voraussetzung. Ob S4-27 und S4-28 Lemma F nur für Formen ≠ 0 benutzen, kann ich nicht beurteilen; diese Dateien lagen mir nicht vor.

### 3.6 Formeln aus Abschnitt 3

S e_{i0} T = (S e_i)(e_0ᵀ T) = u_i·p, und α_t(u·p) = Σ_{ij}(α_t)_{ij}u_ip_j = uᵀα_tpᵀ. Also α′_t(e_{i0}) = u_iᵀα_tpᵀ, α′_t(e_{i1}) = u_iᵀα_tp′ᵀ, in Vektorform a′(t) = Sᵀα_tpᵀ, b′(t) = Sᵀα_tp′ᵀ (die Zeilen von Sᵀ sind die u_iᵀ). Skalierung: a(t) = a′(t)/a′_0(t), b(t) = b′(t)/a′_0(t), der a-Punkt ist [Sᵀα_tpᵀ] in der Karte X_0 = 1. Programm T1: 200 zufällige (α, S, T) mit exakten Brüchen, dazu R3 und Skalierung am naiven Verfahren der Länge 42 für ⟨3,2,7⟩ mit Brent-Probe auf allen Basispaaren (zwei von drei Zufallswahlen; eine verletzte (SN1) und wurde übersprungen). **Urteil: bestätigt.**

## 4. Kleinere Ungenauigkeiten (ohne Einfluss auf die Urteile)

1. Abschnitt 5.1: „Jedes solche V_{tt′} ist die Nullstellenmenge eines … Minors“ – richtig ist „liegt in der Nullstellenmenge“.
2. Abschnitt 5.6: „nach Lemma F sind die 8 Rang-2-Formen paarweise nicht proportional“ braucht nur die Richtung „⇐“.
3. Lemma F: fehlende Voraussetzung α_t, α_{t′} ≠ 0 (siehe 3.5).

## 5. Verbrauch

- Subagenten: 0. Fremdmodell-Anfragen: 0.
- Rechnung: ein Lauf von check_b030.py, Laufzeit etwa 3,5 Sekunden auf einem Kern.
- Dauer: aus den Git-Zeitstempeln dieses Zweigs abzulesen (der Auftrag kam um 13:10 UTC).

## Anhang: Programm (Python 3, nur Standardbibliothek, exakte Arithmetik: Brüche und Restklassen modulo 32003)

### check_b030.py

```python
# S4-31: independent checks for B-030 (formulas, Lemma F, rank identity of Lemma O).
# Exact arithmetic only: Fractions and integers mod a prime. No floating point.
import random, itertools
from fractions import Fraction as Fr

P = 32003
rnd = random.Random(31)

def matmul(A, B):
    return [[sum(A[i][k]*B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
def transpose(A):
    return [list(r) for r in zip(*A)]
def det(A):
    n = len(A); M = [[Fr(x) for x in r] for r in A]; d = Fr(1)
    for c in range(n):
        piv = next((r for r in range(c, n) if M[r][c] != 0), None)
        if piv is None: return Fr(0)
        if piv != c: M[c], M[piv] = M[piv], M[c]; d = -d
        d *= M[c][c]
        for r in range(c+1, n):
            f = M[r][c]/M[c][c]
            M[r] = [M[r][k]-f*M[c][k] for k in range(n)]
    return d
def inv(A):
    n = len(A); M = [[Fr(x) for x in r]+[Fr(int(i == j)) for j in range(n)] for i, r in enumerate(A)]
    for c in range(n):
        piv = next(r for r in range(c, n) if M[r][c] != 0)
        M[c], M[piv] = M[piv], M[c]
        pv = M[c][c]; M[c] = [x/pv for x in M[c]]
        for r in range(n):
            if r != c and M[r][c] != 0:
                f = M[r][c]; M[r] = [M[r][k]-f*M[c][k] for k in range(2*n)]
    return [r[n:] for r in M]
def E(n, m, i, j):
    return [[Fr(int(a == i and b == j)) for b in range(m)] for a in range(n)]
def form(alpha, X):  # alpha(X) = sum alpha_ij X_ij
    return sum(alpha[i][j]*X[i][j] for i in range(len(X)) for j in range(len(X[0])))
def rand_inv(n):
    while True:
        A = [[Fr(rnd.randint(-5, 5)) for _ in range(n)] for _ in range(n)]
        if det(A) != 0: return A

# ---------- T1: formulas of section 3 ----------
def t1(trials=200):
    for _ in range(trials):
        al = [[Fr(rnd.randint(-5, 5)) for _ in range(2)] for _ in range(3)]
        S = rand_inv(3); T = rand_inv(2)
        # coefficient matrix of alpha'(X) = alpha(S X T)
        alp = [[form(al, matmul(matmul(S, E(3, 2, i, j)), T)) for j in range(2)] for i in range(3)]
        assert alp == matmul(matmul(transpose(S), al), transpose(T))
        p = [T[0]]; pp = [T[1]]
        a1 = matmul(matmul(transpose(S), al), transpose(p))  # S^T alpha p^T
        b1 = matmul(matmul(transpose(S), al), transpose(pp))
        assert [r[0] for r in a1] == [alp[i][0] for i in range(3)]
        assert [r[0] for r in b1] == [alp[i][1] for i in range(3)]
    # full R3 + scaling on the naive scheme for <3,2,7> (42 products)
    m = 7
    scheme = []
    for i in range(3):
        for j in range(2):
            for l in range(m):
                scheme.append((E(3, 2, i, j), E(2, m, j, l), E(3, m, i, l)))
    for _ in range(3):
        S = rand_inv(3); T = rand_inv(2); Si = inv(S); Ti = inv(T)
        new = []
        for al, be, C in scheme:
            alp = matmul(matmul(transpose(S), al), transpose(T))
            bep = matmul(transpose(Ti), be)          # beta'(B) = beta(T^{-1} B)  <=> coeff = (T^{-1})^T beta
            Cp = matmul(Si, C)
            a0 = alp[0][0]
            if a0 == 0: break
            new.append(([[x/a0 for x in r] for r in alp], bep, [[x*a0 for x in r] for r in Cp]))
        else:
            # Brent check on all basis pairs: sum alpha(E_ij) beta(E_jl) C = E_ij E_jl
            for i, j, j2, l in itertools.product(range(3), range(2), range(2), range(m)):
                A = E(3, 2, i, j); B = E(2, m, j2, l)
                tot = [[Fr(0)]*m for _ in range(3)]
                for al, be, C in new:
                    s = form(al, A)*form(be, B)
                    if s: tot = [[tot[r][c]+s*C[r][c] for c in range(m)] for r in range(3)]
                assert tot == matmul(A, B)
            continue
        print('T1: skipped one (S,T) because a0 = 0 (SN1 violated)')
    print('T1 ok: alpha\' = S^T alpha T^T, a\' = S^T alpha p^T, b\' = S^T alpha p\'^T; R3+scaling keeps Brent identity')

# ---------- T2: Lemma F ----------
def Vall(A, B):
    # all 2x2 minors of [A p | B p] vanish identically as polynomials in p (coefficients of p0^2, p0p1, p1^2)
    for i, j in itertools.combinations(range(3), 2):
        c00 = A[i][0]*B[j][0]-A[j][0]*B[i][0]
        c11 = A[i][1]*B[j][1]-A[j][1]*B[i][1]
        c01 = A[i][0]*B[j][1]+A[i][1]*B[j][0]-A[j][0]*B[i][1]-A[j][1]*B[i][0]
        if c00 or c11 or c01: return False
    return True
def rank(A):
    M = [list(map(Fr, r)) for r in A]; rk = 0; rows = len(M); cols = len(M[0])
    for c in range(cols):
        piv = next((r for r in range(rk, rows) if M[r][c] != 0), None)
        if piv is None: continue
        M[rk], M[piv] = M[piv], M[rk]
        for r in range(rows):
            if r != rk and M[r][c] != 0:
                f = M[r][c]/M[rk][c]; M[r] = [M[r][k]-f*M[rk][k] for k in range(cols)]
        rk += 1
    return rk
def proportional(A, B):  # B = lam * A for some lam (lam may be 0)
    if all(x == 0 for r in B for x in r): return True
    flatA = [x for r in A for x in r]; flatB = [x for r in B for x in r]
    k = next((i for i in range(6) if flatA[i] != 0), None)
    if k is None: return False
    lam = Fr(flatB[k], 1)/flatA[k]
    return all(flatB[i] == lam*flatA[i] for i in range(6))
def col_line(A):
    for c in range(2):
        v = [A[i][c] for i in range(3)]
        if any(v): return v
def same_line(x, y):
    return rank([x, y]) == 1
def gen(kind):
    r = lambda: rnd.randint(-2, 2)
    if kind == 0: return [[0, 0], [0, 0], [0, 0]]
    if kind == 1:
        x = [r() for _ in range(3)]; y = [r() for _ in range(2)]
        return [[x[i]*y[j] for j in range(2)] for i in range(3)]
    return [[r() for _ in range(2)] for _ in range(3)]
def t2(trials=60000):
    stats = {'agree': 0, 'counter_rank0': 0}
    for _ in range(trials):
        A = gen(rnd.choice([0, 1, 1, 2])); 
        mode = rnd.randint(0, 3)
        if mode == 0:
            lam = rnd.randint(-3, 3); B = [[lam*x for x in row] for row in A]
        elif mode == 1 and rank(A) == 1:
            x = col_line(A); y = [rnd.randint(-2, 2) for _ in range(2)]
            B = [[x[i]*y[j] for j in range(2)] for i in range(3)]
        else:
            B = gen(rnd.choice([0, 1, 2]))
        rA, rB = rank(A), rank(B)
        crit = proportional(A, B) or (rA == 1 and rB == 1 and same_line(col_line(A), col_line(B)))
        if Vall(A, B) == crit:
            stats['agree'] += 1
        else:
            assert rA == 0 or rB == 0, (A, B)   # only possible mismatch: a zero form
            stats['counter_rank0'] += 1
    print('T2 Lemma F:', stats, '(mismatches occur only with a zero form, excluded by SN1/R2)')

# ---------- T3: rank identity of Lemma O (mod P) ----------
def rank_p(M):
    M = [[x % P for x in r] for r in M]; rk = 0
    rows = len(M); cols = len(M[0]) if M else 0
    for c in range(cols):
        piv = next((r for r in range(rk, rows) if M[r][c]), None)
        if piv is None: continue
        M[rk], M[piv] = M[piv], M[rk]
        iv = pow(M[rk][c], P-2, P); M[rk] = [x*iv % P for x in M[rk]]
        for r in range(rows):
            if r != rk and M[r][c]:
                f = M[r][c]; M[r] = [(M[r][k]-f*M[rk][k]) % P for k in range(cols)]
        rk += 1
    return rk
def kernel_p(M, ncols):
    # basis of {x : M x = 0}
    M = [[x % P for x in r] for r in M]; rk = 0; pivs = []
    rows = len(M)
    for c in range(ncols):
        piv = next((r for r in range(rk, rows) if M[r][c]), None)
        if piv is None: continue
        M[rk], M[piv] = M[piv], M[rk]
        iv = pow(M[rk][c], P-2, P); M[rk] = [x*iv % P for x in M[rk]]
        for r in range(rows):
            if r != rk and M[r][c]:
                f = M[r][c]; M[r] = [(M[r][k]-f*M[rk][k]) % P for k in range(ncols)]
        pivs.append(c); rk += 1
    free = [c for c in range(ncols) if c not in pivs]; basis = []
    for f in free:
        x = [0]*ncols; x[f] = 1
        for i, c in enumerate(pivs): x[c] = (-M[i][f]) % P
        basis.append(x)
    return basis
def t3(trials=12):
    R = 34
    for trial in range(trials):
        variant = trial % 3
        pts = [(rnd.randrange(P), rnd.randrange(P)) for _ in range(R)]
        if variant == 2:   # put w's support on a conic a2 = a1^2 so that dim w P_2 = 5 (e = 2)
            pts = [(x, x*x % P) for x, _ in pts]
        a1 = [x for x, _ in pts]; a2 = [y for _, y in pts]
        mons = [lambda t: 1, lambda t: a1[t], lambda t: a2[t], lambda t: a1[t]**2, lambda t: a1[t]*a2[t], lambda t: a2[t]**2]
        w = [rnd.randrange(1, P) for _ in range(R)]
        extra = 1 if variant != 2 else 2
        gens = [[w[t]*m(t) % P for t in range(R)] for m in mons] + [[rnd.randrange(P) for _ in range(R)] for _ in range(extra)]
        # J = span(gens) (dim 7 generically); Q = random basis of J
        basisJ = gens[:7] if variant != 2 else [gens[i] for i in (0, 1, 2, 4, 5, 6, 7)]
        if variant == 1:  # random mixture (still a basis of J)
            Mx = [[rnd.randrange(P) for _ in range(7)] for _ in range(7)]
            basisJ = [[sum(Mx[i][k]*basisJ[k][t] for k in range(7)) % P for t in range(R)] for i in range(7)]
        Q = transpose(basisJ)   # 34 x 7
        assert rank_p(Q) == 7
        # Xi: K^21 -> K^68
        Xi = []
        for i, a in enumerate((a1, a2)):
            for t in range(R):
                row = [a[t]*Q[t][k] % P for k in range(7)] + [0]*14
                off = 7 + 7*i
                for k in range(7): row[off+k] = (-Q[t][k]) % P
                Xi.append(row)
        rkXi = rank_p(Xi)
        kerXi = kernel_p(Xi, 21); nN = len(kerXi)
        # direct: QN + a1 QN + a2 QN
        QN = [[sum(Q[t][k]*v[k] for k in range(7)) % P for t in range(R)] for v in kerXi]
        span = QN + [[a1[t]*x[t] % P for t in range(R)] for x in QN] + [[a2[t]*x[t] % P for t in range(R)] for x in QN]
        direct = rank_p(span) if span else 0
        # [Xi^3 ; Gamma] : 63 columns
        big = []
        for b in range(3):
            for row in Xi:
                big.append([0]*(21*b) + row + [0]*(21*(2-b)))
        for t in range(R):
            row = [0]*63
            for b, a in enumerate((None, a1, a2)):
                f = 1 if a is None else a[t]
                for k in range(7): row[21*b+k] = f*Q[t][k] % P
            big.append(row)
        rk = rank_p(big)
        assert direct == rk - 3*rkXi, (direct, rk, rkXi)
        wP2 = rank_p(gens[:6])
        print(f'T3 trial {trial} variant {variant}: dim N = {nN}, rk Xi = {rkXi}, rk[Xi^3;Gamma] = {rk}, '
              f'dim(QN+a1QN+a2QN) = {direct}, dim wP2 = {wP2}' + (f', e+3 = rk-54 = {rk-54}' if nN == 3 else ''))

t1(); t2(); t3()
```

### Ausgabe

```
T1: skipped one (S,T) because a0 = 0 (SN1 violated)
T1 ok: alpha' = S^T alpha T^T, a' = S^T alpha p^T, b' = S^T alpha p'^T; R3+scaling keeps Brent identity
T2 Lemma F: {'agree': 52017, 'counter_rank0': 7983} (mismatches occur only with a zero form, excluded by SN1/R2)
T3 trial 0 variant 0: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 1 variant 1: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 2 variant 2: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 59, dim(QN+a1QN+a2QN) = 5, dim wP2 = 5, e+3 = rk-54 = 5
T3 trial 3 variant 0: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 4 variant 1: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 5 variant 2: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 59, dim(QN+a1QN+a2QN) = 5, dim wP2 = 5, e+3 = rk-54 = 5
T3 trial 6 variant 0: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 7 variant 1: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 8 variant 2: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 59, dim(QN+a1QN+a2QN) = 5, dim wP2 = 5, e+3 = rk-54 = 5
T3 trial 9 variant 0: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 10 variant 1: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 60, dim(QN+a1QN+a2QN) = 6, dim wP2 = 6, e+3 = rk-54 = 6
T3 trial 11 variant 2: dim N = 3, rk Xi = 18, rk[Xi^3;Gamma] = 59, dim(QN+a1QN+a2QN) = 5, dim wP2 = 5, e+3 = rk-54 = 5
```
