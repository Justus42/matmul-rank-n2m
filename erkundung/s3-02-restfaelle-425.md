# S3-02: Restfälle der Stufe-2-Fallunterscheidung für 4×2×5 bei Länge 31

- Auftrag: S3-02 (Stufe 3, Runde 1), Erkundung nach Protokoll 0.5, Abschnitt 3. Diese Datei beweist nichts.
- Datum: 25.11.2026
- Status aller Aussagen: **behauptet** (Rechnung eines Agenten, ungeprüft). Wo ausdrücklich gesagt: **vermutet**.
- Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, `STATUS.md`, `LOG.md`, `behauptungen/B-008.md`, `B-009.md`, `lean/prosa/yang_n4.md`, `lean/prosa/s2_444_spurA_r2.md` (Abschnitte 1 bis 6), Köpfe und Aussagen von `lean/YangBounds/SatzA444.lean`, `Lemma13Prime.lean`, `YangN4Haupt.lean` (Signaturen), `Transponiert444.lean` (Kopf). Nichts unter `erkundung/` außer dieser Datei, keine PRs anderer S3-Aufträge.
- Programm: `erkundung/s3-02-restfaelle.py` (Begleitdatei, Python 3, nur ganze Zahlen, keine Pakete). Laufzeit etwa 1,4 Sekunden. Keine Subagenten, keine Fremdmodell-Anfragen.

---

## 1. Ergebnis in Kürze

1. Die Fallliste von Satz A (B-008) entsteht aus **drei Ungleichungen**, die alles entscheiden: Yangs Gleichung (2), Lemma 13 und Lemma 14. Die übrigen Bedingungen (dim Q, Lemma 8′, 11, 15) sind bei 4×2×4 nicht bindend. Die Tabelle für s kommt aus Lemma 13′.
2. Verallgemeinert auf ⟨n,2,m⟩ mit Länge r liefert das Programm für **4×2×4 bei r = 25 genau die bekannte Liste** {(3,6), (4,7), (5,7), (5,8)} mit ρ = 3 und der s-Tabelle 0, 0, 0, ≤ 1. Für r = 24 liefert es keinen Fall, und für 4 ≤ n ≤ 7, n ≤ m ≤ n+3 ist das kleinste r mit einem Fall genau Yangs Schranke (n+2)m + n − 3.
3. **4×2×5 in der Rolle n = 4, m = 5 (A ist 4×2): 7 Restfälle** bei r = 31:
   (ρ, rk L, rk H) = (3,3,6), (3,4,7), (3,5,7), (3,5,8), (3,6,8), (3,6,9), (4,6,9).
4. **4×2×5 in der Rolle n = 5, m = 4 (transponiert, ⟨5,2,4⟩): 20 Restfälle** bei r = 31, alle mit ρ = 4 = m und s = 0: rk L ∈ {4, 5, 6, 7}, rk H ∈ [rk L + 8, rk L + 12]. Diese Rolle ist nicht scharf: Schon bei r = 30 bleiben dort 3 Fälle. Yangs Schranke 31 kommt nur aus der Rolle n = 4, m = 5.
5. Ein Angriff müsste in der Rolle n = 4, m = 5 die 7 Fälle ausschließen. Die vier Fälle von 4×2×4 kehren dort als Tupel wieder, aber mit dim U = 5 statt 4. Der Schritt von Satz A zu Satz B (Lemma V, Lemma S) benutzt dim U = n = 4 wesentlich und überträgt sich nicht unmittelbar (vermutet, Abschnitt 6).

---

## 2. Welche Bedingungen die Fallliste bei 4×2×4 bestimmen

Bezeichnungen wie in `lean/prosa/yang_n4.md`: d = n − 1 Abbildungen F_1, …, F_d : U → Q, dim U = m, Q = ker W / J, L : U^d → Q, H die schiefe Erweiterung, ρ = max_γ rk(Σ γ_i F_i), s = dim Σ_i F_i(ker G) für einen Maximierer G = Σ γ_i F_i (Lemma 13′).

Satz A (`lean/prosa/s2_444_spurA_r2.md`, Abschnitt 3, Punkte 1 bis 8; Lean `SatzA444.satzA_inequalities`) benutzt genau diese ganzzahligen Bedingungen. Hier in allgemeiner Form, mit der Stelle, an der sie für allgemeines n, m bewiesen sind:

| Nr. | Bedingung (allgemein) | Herkunft | Voraussetzung | bei 4×2×4, r = 25 |
|---|---|---|---|---|
| B1 | dim Q = r − (n+1)m, 0 ≤ rk L ≤ dim Q | Lemma 4.1(iii); `finrank_Kbar`, `range_Lq_le_Kbar` | (N1) | dim Q = 5 |
| B2 | d·(r − (n+2)m) ≥ rk H − rk L | Gleichung (2), Lemma 10; `ineq1` | (N1) | rk H ≤ rk L + 3 |
| B3 | 2 rk H ≥ d·ρ + (d−2)·rk L | Lemma 13 (repariert); `YangN4Lemma13` | d ≥ 2 | 2 rk H ≥ 3ρ + rk L |
| B4 | ρ ≥ n − 1 | Lemma 14; `lemma14` | m ≥ n − 1, (N1), (N2) | ρ ≥ 3 |
| B5 | rk L ≥ n − 1 | Lemma 8′; `lemma8'` | m ≥ 1, (N1), (N2) | rk L ≥ 3 |
| B6 | 2 rk H ≥ (n−2)·rk L | Lemma 11 (11′) | – | rk H ≥ rk L |
| B7 | rk L ≤ d·ρ | Lemma 15(a); `lemma15a` | – | rk L ≤ 9 |
| B8 | rk L = d·ρ ⇒ ρ = m und rk L = d·m | Lemma 15(b); `lemma15b` | n ≥ 3, K algebraisch abgeschlossen | greift nie |
| B9 | 0 ≤ ρ ≤ m, rk H ≤ dim U^{∧d} = d(d−1)/2·m, rk H ≤ d·dim Q | Dimensionen | – | 12 und 15, nicht bindend |
| B10 | d·ρ + 2s + (d−2)·rk L ≤ 2 rk H, 0 ≤ s ≤ min((d−1)(m−ρ), rk L) | Lemma 13′ (verdoppelte Form, wie `Lemma13Prime.lemma13Prime` für d = e + 2) | wie B3 | s-Tabelle |

B10 ist für d = 3 gleichwertig mit der Prosa-Form rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉ (vom Programm für kleine Werte nachgezählt). Für allgemeines d lautet die Prosa-Form rk H ≥ (d−1)ρ + s + ⌈(d−2)(rk L − ρ)/2⌉; das folgt aus demselben Beweis (dim H(Γ) = (d−1)ρ + s, dazu Lemma 11 mit d − 1 für H̄), und Lean hat genau diese verdoppelte Form für jedes e.

**Welche Bedingungen binden.** Das Programm lässt jede Bedingung einzeln weg und zählt neu (Hilfsrechnung, nicht in der Begleitdatei):

| Format, Rolle | Fälle | ohne B2 | ohne B3 | ohne B4 | ohne B5 | alle anderen einzeln weggelassen |
|---|---|---|---|---|---|---|
| 4×2×4, r = 25 | 4 | 33 | 24 | 12 | 4 | 4 |
| 4×2×5, n = 4, m = 5, r = 31 | 7 | 90 | 48 | 15 | 7 | 7 |
| 4×2×5, n = 5, m = 4, r = 31 | 20 | 46 | 40 | 84 | 40 | 20 |

Bei 4×2×4 bestimmen also B2, B3 und B4 die Liste, B10 die s-Tabelle. B8 (Lemma 15(b)) greift in keinem der drei Fälle, weil rk L = dρ dort über dim Q liegt. Zwei weitere gültige Schranken, die Satz A nicht nennt (ρ ≤ rk L, weil im G ⊆ im L; rk H ≤ d·rk L, weil jede Komponente von H in im L liegt), ändern an keiner Liste etwas.

Die Fälle sind Tupel (ρ, rk L, rk H). Zu jedem gibt das Programm die größte nach B10 erlaubte Zahl s an und den Spielraum von Ungleichung (1), also rk L + d·dim Q − d·m − rk H. Spielraum 0 heißt: Φ ist surjektiv auf im L × Q^d (Analogon von Folgerung A1).

---

## 3. Programm und Probe an 4×2×4

Das Programm `erkundung/s3-02-restfaelle.py` zählt alle ganzen Tupel (ρ, rk L, rk H) in den Grenzen von B1 und B9 auf und behält die, die B1 bis B9 erfüllen. Für jeden Fall setzt es s_max aus B10. Aufruf:

```
python3 erkundung/s3-02-restfaelle.py          # Selbstproben und die drei Tabellen
python3 erkundung/s3-02-restfaelle.py n m r    # eine Rolle, ein r
```

Selbstproben (alle bestanden, Ausgabe wörtlich):

```
Probe <4,2,4>, r=25: [(3, 3, 6, 0), (3, 4, 7, 0), (3, 5, 7, 0), (3, 5, 8, 1)] OK
Probe <4,2,4>, r=24: empty True
Probe first r = Yang bound for 4<=n<=7, n<=m<=n+3: True
Probe Lemma 13' forms agree: True
```

- Die erste Zeile ist genau Satz A (B-008) mit der Tabelle aus `SatzA444.sDim_table`: s = 0 in (3,6), (4,7), (5,7) und s ≤ 1 in (5,8).
- Die zweite Zeile ist Yangs Satz 2 für 4×2×4 (keine Zerlegung der Länge 24).
- Die dritte Zeile prüft die Verallgemeinerung: Das kleinste r, bei dem ein Fall übrig bleibt, ist für alle 16 geprüften Formate mit m ≥ n ≥ 4 genau Yangs Schranke. Für n ≥ 5 entsteht sie dabei aus B2, B3, B4, B5 wie in yang_n4.md Abschnitt 8, für n = 4 zusätzlich mit B8.

Tabelle für 4×2×4 (Ausgabe):

```
<4,2,4>, r = 25: dim Q = 5, 4 case(s)
  rho rkL rkH  s<=  slack(1)
    3   3   6    0     0
    3   4   7    0     0
    3   5   7    0     1
    3   5   8    1     0
```

Das stimmt mit Satz A überein, auch im Spielraum (Gleichung in (3,6), (4,7), (5,8), Spielraum 1 in (5,7)).

---

## 4. Rechnung für 4×2×5 bei Länge 31

R(⟨4,2,5⟩) = R(⟨5,2,4⟩) durch Transponieren (A·B = (Bᵀ·Aᵀ)ᵀ). Eine Zerlegung der Länge 31 gibt also eine Normalform in jeder der beiden Rollen. Die äußeren Dimensionen spielen in Yangs Normalform verschiedene Rollen: n ist die Zahl der Zeilen von A (es gibt d = n − 1 Abbildungen F_i), m ist dim U.

### 4.1 Rolle n = 4, m = 5 (Format ⟨4,2,5⟩ wie gegeben)

dim Q = 31 − 25 = 6, d = 3. B2: rk H ≤ rk L + 3. B3: 2 rk H ≥ 3ρ + rk L. B4 (m = 5 ≥ 3): ρ ≥ 3. Aus B2 und B3: rk L ≥ 3ρ − 6, mit rk L ≤ 6 also ρ ≤ 4.

```
<4,2,5>, r = 31: dim Q = 6, 7 case(s)
  rho rkL rkH  s<=  slack(1)
    3   3   6    0     0
    3   4   7    0     0
    3   5   7    0     1
    3   5   8    1     0
    3   6   8    0     1
    3   6   9    1     0
    4   6   9    0     0
```

**Restfälle: 7.** Im Einzelnen:

| Fall | ρ | rk L | rk H | s nach Lemma 13′ | dim ker G = m − ρ | Spielraum (1) | rk L = dim Q (Analogon A2: Ĵ = ker W) |
|---|---|---|---|---|---|---|---|
| A-1 | 3 | 3 | 6 | 0 | 2 | 0 | nein |
| A-2 | 3 | 4 | 7 | 0 | 2 | 0 | nein |
| A-3 | 3 | 5 | 7 | 0 | 2 | 1 | nein |
| A-4 | 3 | 5 | 8 | ≤ 1 | 2 | 0 | nein |
| A-5 | 3 | 6 | 8 | 0 | 2 | 1 | ja |
| A-6 | 3 | 6 | 9 | ≤ 1 | 2 | 0 | ja |
| A-7 | 4 | 6 | 9 | 0 | 1 | 0 | ja |

s = 0 heißt: alle F_i verschwinden auf ker G, also ist der gemeinsame Kern N gleich ker G. In A-1, A-2, A-3, A-5 ist damit dim N = 2, in A-7 dim N = 1. Bei 4×2×4 war in den Fällen mit s = 0 nur dim N = 1.

Neu gegenüber 4×2×4 sind A-5, A-6 (rk L = 6, möglich wegen dim Q = 6) und A-7 (ρ = 4, möglich, weil jetzt ρ < m = 5 Platz lässt und rk L = 6 ≥ 3·4 − 6).

### 4.2 Rolle n = 5, m = 4 (transponiert, ⟨5,2,4⟩)

dim Q = 31 − 24 = 7, d = 4. B4 (m = 4 ≥ n − 1 = 4): ρ ≥ 4, also ρ = m = 4. Damit ker G = 0 und s = 0, Lemma 13′ sagt nichts über Lemma 13 hinaus. B3: rk H ≥ 2ρ + rk L = rk L + 8. B2: rk H ≤ rk L + 12. B5: rk L ≥ 4. B1: rk L ≤ 7.

**Restfälle: 20**, nämlich (ρ, rk L, rk H) = (4, ℓ, h) für ℓ ∈ {4, 5, 6, 7} und h ∈ {ℓ + 8, …, ℓ + 12}. Der Spielraum von (1) ist ℓ + 12 − h, also 0 bis 4. Volle Ausgabe:

```
<5,2,4>, r = 31: dim Q = 7, 20 case(s)
  rho rkL rkH  s<=  slack(1)
    4   4  12    0     4
    4   4  13    0     3
    4   4  14    0     2
    4   4  15    0     1
    4   4  16    0     0
    4   5  13    0     4
    4   5  14    0     3
    4   5  15    0     2
    4   5  16    0     1
    4   5  17    0     0
    4   6  14    0     4
    4   6  15    0     3
    4   6  16    0     2
    4   6  17    0     1
    4   6  18    0     0
    4   7  15    0     4
    4   7  16    0     3
    4   7  17    0     2
    4   7  18    0     1
    4   7  19    0     0
```

Diese Rolle ist nicht scharf. Das Programm findet schon bei r = 30 drei Fälle, (4,4,12), (4,5,13), (4,6,14):

```
first r with a case: <4,2,5> as n=4,m=5: 31 ; as n=5,m=4: 30
<4,2,5> n=4,m=5, r=30: 0 case(s); n=5,m=4: 3 case(s)
<4,2,5> n=4,m=5, r=32: 49 case(s); n=5,m=4: 45 case(s)
```

Die Schranke 31 stammt also nur aus der Rolle n = 4, m = 5. Das passt zu Yangs Satz 2, der m ≥ n verlangt. Die Rolle n = 5, m = 4 ist für die Fallunterscheidung bei 31 deutlich schwächer: 20 statt 7 Fälle, bis zu 4 Einheiten Spielraum in (1), keine Information aus s.

### 4.3 Beide Rollen zugleich

Jede Zerlegung der Länge 31 liegt in einem Fall der Rolle n = 4 und, nach Transponieren und eigener Normalisierung, in einem Fall der Rolle n = 5. Ohne eine Kopplung der beiden Normalformen ergibt das bis zu 7 · 20 = 140 Paare und keine Einschränkung über die 7 Fälle hinaus. Bei 4×2×4 wurde eine solche Kopplung im Satz F benutzt (`Transponiert444.lean`: transponierte Zerlegung „am selben Punkt“, mit zusätzlichen Bedingungen TransN1, TransN2). Dort landeten beide Rollen im selben Format mit derselben Liste. Bei 4×2×5 landet die transponierte Zerlegung in der schwächeren 20er-Liste. Ob eine Kopplung bei 4×2×5 etwas bringt, habe ich nicht untersucht.

---

## 5. Übernommene Annahmen

Ich übernehme ohne eigene Prüfung:

1. Die Reduktionen R1 (algebraischer Abschluss), R2 (keine Nullformen) und Lemma 6 (Normalform (N1), (N2)) aus yang_n4.md. Für 4×2×5 bei r = 31 bleibt die Länge bei R2 erhalten, weil 31 Yangs Schranke ist (Rolle n = 4, m = 5 erfüllt m ≥ n ≥ 4; die Transposition ändert den Rang nicht).
2. Lemma 4.1, Lemma 10 mit Gleichung (2), Lemma 11, Lemma 13 (repariert), Lemma 8′, Lemma 14, Lemma 15(a), (b) für allgemeines n ≥ 2, m ≥ 1 in der Fassung von yang_n4.md. Laut Signaturen in `YangN4Haupt.lean` sind `ineq1`, `lemma8'`, `lemma14`, `lemma15a`, `lemma15b`, `finrank_Kbar` für allgemeines d, m, r formuliert. Ich habe die Signaturen gelesen, nicht die Beweise.
3. Lemma 13′ für allgemeines d in der verdoppelten Form von `Lemma13Prime.lemma13Prime` (dort für e + 2 Abbildungen, e beliebig).
4. Die Voraussetzungen sind in beiden Rollen erfüllt: Lemma 14 braucht m ≥ n − 1 (5 ≥ 3 und 4 ≥ 4), Lemma 15(b) braucht n ≥ 3, Lemma 8′ braucht m ≥ 1.

Der Status dieser Bausteine steht in `pruefvermerke/`; ich habe ihn nicht nachgesehen und setze ihn nicht.

---

## 6. Unsicherheiten

1. **Was „Fallunterscheidung aus Stufe 2“ umfasst.** Ich lese sie als die Zählung von Satz A (B-008) mit der s-Tabelle aus Lemma 13′. Satz B (B-009) schließt (4,7) und (5,7) nicht durch Zählen aus, sondern mit Lemma V und Lemma S. Wer Satz B mitzählt, bekommt bei 4×2×4 die Liste {(3,6), (5,8)}; für 4×2×5 gibt es dazu keine Rechnung, weil die Übertragung offen ist (Punkt 2).
2. **Lemma V und Lemma S übertragen sich nicht unmittelbar (vermutet).** Lemma V setzt dim U = n = 4 voraus: Die Abbildung φ : K^n → U aus Schritt 1 ist dort invertierbar, weil beide Räume Dimension 4 haben. In der Rolle n = 4, m = 5 ist φ : K⁴ → U mit dim U = 5 nur injektiv. Die Folgerung V1 (Gᵀ b_t = μ_t a_t mit μ_t ≠ 0) bricht, weil Gᵀ dann einen Kern hat. Lemma S rechnet mit Ψ(u, y) = ℓ_u ℓ_y in quadratischen Formen in 4 Variablen, auch das braucht m = n. Hypothese (a) von Lemma V (dim(Ψ(u,U) + Ψ(u′,U)) = 7 = 2m − 1) hätte bei m = 5 die Form „= 9“; woher sie bei 4×2×4 kommt, habe ich nicht nachverfolgt. In der Rolle n = 5, m = 4 ist ρ = m und ker G = 0, dort fehlt der Ausgangspunkt (gemeinsamer Kern N ≠ 0) ganz.
3. **Vollständigkeit der Bedingungen.** Die Liste ist genau so stark wie B1 bis B10. Weitere Ungleichungen (etwa Lemma 13 rekursiv auf H̄ statt Lemma 11, oder die Abbildung g und die Matrizen C_t) könnten Fälle ausschließen. Ich habe nur die Bedingungen von Satz A und Lemma 13′ und zwei triviale Zusatzschranken eingesetzt (Abschnitt 2), keine neuen.
4. **s_max.** Die obere Grenze s ≤ min((d−1)(m−ρ), rk L) ist eine einfache Dimensionsschranke, die ich selbst hinzugefügt habe. Sie ändert an den gemeldeten Werten nichts, denn in allen Fällen mit ρ < m bindet B10.
5. **Verallgemeinerung von Lemma 13′ auf d = 4.** In der Rolle n = 5 ist ρ = m, also s = 0, und Lemma 13′ fällt mit Lemma 13 zusammen. Eine Unsicherheit in der allgemeinen Fassung von Lemma 13′ wirkt sich deshalb auf die 20 Fälle nicht aus.
6. **Rolle der Transposition.** Ich habe angenommen, dass die transponierte Zerlegung eine eigene Normalform nach Lemma 6 bekommt (eigene Wahl von u_0, p). Die Kopplung „am selben Punkt“ aus `Transponiert444.lean` braucht Zusatzbedingungen und ist hier nicht verwendet.

---

## 7. Einschätzung für die Frage „Angriff lohnt?“ (nur Zahlen, keine Empfehlung)

- Nach der Zählung bleiben in der guten Rolle 7 Fälle statt 4 bei 4×2×4. Drei davon (A-5, A-6, A-7) haben bei 4×2×4 kein Gegenstück.
- Der zweite Schritt der Kette von 4×2×4 (Satz B über Symmetrie) hängt an n = m und müsste für 4×2×5 neu gefunden werden (vermutet).
- Die transponierte Rolle hilft bei 4×2×5 nach der Zählung nicht, anders als bei 4×2×4, wo sie dieselbe Liste hatte.

Die Empfehlung gibt der Orchestrator nach Abschnitt 3 aus beiden Rechnungen.
