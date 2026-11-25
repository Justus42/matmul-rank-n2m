# S3-01: Restfälle der Stufe-2-Fallunterscheidung für ⟨4,2,5⟩ bei Länge 31

- Auftrag: S3-01 (Stufe 3, Runde 1), Erkundung, eine der beiden unabhängigen Rechnungen nach Protokoll Abschnitt 3
- Datum: 25.11.2026
- Status aller Aussagen dieser Datei: **behauptet** (Rechnung eines Agenten, ungeprüft), wo gesagt: **vermutet**. Diese Datei beweist nichts.
- Programm: Begleitdatei `erkundung/s3-01-restfaelle.py` (Python 3, nur ganze Zahlen, keine Abhängigkeiten, Laufzeit unter 1 Sekunde). Aufruf: `python3 erkundung/s3-01-restfaelle.py` und `python3 erkundung/s3-01-restfaelle.py --extra`.
- Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, `STATUS.md`, `LOG.md`, `behauptungen/B-008.md` bis `B-016.md`, `lean/prosa/yang_n4.md`, `lean/prosa/s2_444_spurA_r2.md`, `lean/YangBounds/SatzA444.lean`, `Lemma13Prime.lean`, die Satznamen in `YangN4Haupt.lean` und `YangN4Lemma13.lean`. Nichts unter `erkundung/` außer den eigenen Dateien, keine PRs anderer S3-Aufträge. Keine Subagenten, keine Fremdmodell-Anfrage.

---

## 1. Ergebnis in Kürze

1. **Rolle ⟨4,2,5⟩ (n = 4, m = 5), r = 31: 7 Restfälle**, gegenüber 4 bei ⟨4,2,4⟩, r = 25. In der Schreibweise (ρ; rk L, rk H):
   - ρ = 3: (3,6), (4,7), (5,7), (5,8), (6,8), (6,9)
   - ρ = 4: (6,9)

   Die vier Fälle von ⟨4,2,4⟩ kommen alle wieder vor. Neu sind die drei Fälle mit rk L = 6, möglich weil dim Q jetzt 6 statt 5 ist, darunter erstmals ein Fall mit ρ = 4.
2. **Rolle ⟨5,2,4⟩ (n = 5, m = 4, transponiert), r = 31: 20 Restfälle**, alle mit ρ = 4 = m, rk L ∈ {4, 5, 6, 7} und rk H ∈ {rk L + 8, …, rk L + 12}. In dieser Rolle ist Yangs Ungleichung (2) sehr locker (Spielraum 12 statt 3), die Rechnung grenzt fast nichts ein.
3. **Probe:** Für ⟨4,2,4⟩ bei r = 25 liefert das Programm genau {(3,6), (4,7), (5,7), (5,8)} mit ρ = 3, also die Liste aus B-008. Es liefert auch die s-Tabelle aus `lean/prosa/s2_444_spurA_r2.md` Abschnitt 4 (s = 0 in den drei ersten Fällen, s ≤ 1 in (5,8)). Die Invarianten der echten 26er-Verfahren aus Abschnitt 9 derselben Datei, (4;6,11), (4;6,10), (3;6,8), liegen in der Liste des Programms für r = 26.
4. **Schicht B (Satz B, B-009):** Von den Werkzeugen aus Satz B überträgt sich nur Lemma 13′. Es erzwingt in 5 der 7 Fälle der Rolle ⟨4,2,5⟩ einen gemeinsamen Kern N ≠ 0 der F_i, in den Fällen (3;5,8) und (3;6,9) nicht. Lemma V und Lemma S, mit denen bei ⟨4,2,4⟩ zwei Fälle wegfielen, setzen dim U = n voraus (m = n) und gehen in keiner Rolle wörtlich durch. Eine Verkürzung der Liste von 7 nach dem Muster von Satz B kann ich deshalb nicht ausrechnen.

---

## 2. Woher die Fallliste bei ⟨4,2,4⟩ kommt

Die Fallliste aus Satz A (B-008, Prosa `lean/prosa/s2_444_spurA_r2.md` Abschnitt 3, Lean `SatzA444.satzA_inequalities`) entsteht allein aus ganzzahligen Ungleichungen zwischen vier Invarianten von Yangs Normalform: dim Q, ρ, rk L, rk H. Ich habe jede Stelle des Beweises einer Ungleichung zugeordnet und geprüft, ob das Lemma in der Prosa (`lean/prosa/yang_n4.md`) und im Lean-Bestand für allgemeine n = d + 1, m, r formuliert ist.

Bezeichnungen wie in `yang_n4.md`: d = n − 1, q = dim Q = dim ker W − dim J, ρ = max_γ rk(Σ γ_i F_i), ℓ = rk L, h = rk H.

| Nr. | Bedingung, allgemein | Quelle | bei ⟨4,2,4⟩, r = 25 | allgemein in Lean? |
|---|---|---|---|---|
| (Q) | q = r − (n+1)m, ℓ ≤ q | Lemma 4.1(iii), im L ⊆ Q | q = 5, ℓ ≤ 5 | ja, `finrank_Kbar`, `range_Lq_le_Kbar` |
| (2) | h − ℓ ≤ d·(r − (n+2)m) | Yang Gleichung (2) | h ≤ ℓ + 3 | ja, `ineq1` (Form (1)) |
| (13) | 2h ≥ d·ρ + (d − 2)·ℓ | Lemma 13 | 2h ≥ 3ρ + ℓ | ja, `lemma13` |
| (11) | 2h ≥ (d − 1)·ℓ | Lemma 11 (11′) | h ≥ ℓ, schließt nichts aus | ja, `lemma11` |
| (14) | ρ ≥ d, falls m ≥ d | Lemma 14 | ρ ≥ 3 | ja, `lemma14` mit `hm : d ≤ m` |
| (8′) | ℓ ≥ d | Lemma 8′ | ℓ ≥ 3 | ja, `lemma8'` mit `1 ≤ m` |
| (15a) | ℓ ≤ d·ρ | Lemma 15(a) | ℓ ≤ 9, schließt nichts aus | ja, `lemma15a` |
| (15b) | ℓ = d·ρ ⇒ ρ = m und ℓ = d·m | Lemma 15(b), d ≥ 2, K algebraisch abgeschlossen | greift nie | ja, `lemma15b` mit `2 ≤ d` |
| (box) | 0 ≤ ρ ≤ m, 0 ≤ h ≤ min(m·d(d−1)/2, d·q) | dim U, dim U^{∧d}, dim Q^d | h ≤ 12, schließt nichts aus | Dimensionsrechnung |

Dazu der Rahmen: Reduktion auf algebraisch abgeschlossenen Körper (R1), Entfernen von Nullformen (R2), Normalform (Lemma 6). Bei R2 darf die Länge nicht sinken, sonst gälte die Aussage nicht mehr für genau r. Bei ⟨4,2,4⟩ sichert das Yangs Satz 2 (r = 25 ist die Schranke). Bei ⟨4,2,5⟩ ist r = 31 genau Yangs Schranke (n+2)m + n − 3 = 31, also gilt dasselbe.

Die ganze Herleitung von Satz A benutzt sonst nichts. Insbesondere geht in die Fallliste keine Aussage über g, C_t oder die Abhängigkeit von p ein.

**Zusatzbedingungen, die Stufe 2 nicht benutzt hat** (gültig, Schalter `--extra`):

- (X1) ρ ≤ ℓ, weil Σ γ_i F_i(x) = L(γ_1 x, …, γ_d x) in im L liegt.
- (X2) h ≤ d·ℓ, weil jede Komponente H(c)_i = L(c_{i,:}) in im L liegt.

Sie ändern keine der Listen bei r = 25 und r = 31 (nur bei ⟨4,2,4⟩, r = 26 fallen zwei Fälle mit ρ = 4 > ℓ = 3 weg). Die Zählung hängt also nicht davon ab, ob man sie mitnimmt.

**Schicht B (Lemma 13′, B-009, Lean `Lemma13Prime.lemma13Prime`):** Für einen Maximierer G = Σ γ_i F_i mit rk G = ρ und s := dim Σ_i F_i(ker G) gilt

  d·ρ + 2s + (d − 2)·ℓ ≤ 2h,  0 ≤ s ≤ min(ℓ, (d − 1)(m − ρ)).

Ist dann s = 0 erzwungen und ρ < m, so liegt ker G (Dimension m − ρ ≥ 1) im gemeinsamen Kern N der F_i (Lean `exists_common_kernel_of_sDim_eq_zero`). Die Lean-Fassung ist für beliebig viele Abbildungen formuliert (e + 2 = d), überträgt sich also wörtlich. Das Programm gibt je Fall s_max und ob N ≠ 0 erzwungen ist.

---

## 3. Das Programm

`erkundung/s3-01-restfaelle.py` zählt für gegebenes (n, m, r) alle ganzzahligen Tripel (ρ, ℓ, h), die alle Bedingungen aus Abschnitt 2 erfüllen. Es rechnet zweimal unabhängig voneinander: einmal durch volle Aufzählung aller Tripel im Kasten, einmal über die geschlossene Formel für das Intervall von h zu festem (ρ, ℓ), mit Aufrundung durch ganzzahlige Division. Es bricht ab, wenn beide Rechnungen verschieden sind.

Selbsttests im Programm:

- ⟨4,2,4⟩, r = 25 ergibt genau {(3;3,6), (3;4,7), (3;5,7), (3;5,8)}, mit und ohne Zusatzbedingungen.
- ⟨4,2,4⟩, r = 26 enthält die Invarianten (4;6,11), (4;6,10), (3;6,8) der echten Verfahren aus `s2_444_spurA_r2.md` Abschnitt 9.
- Für 4 ≤ n ≤ 7, n ≤ m ≤ 8 und r = (n+2)m + n − 4 (eins unter Yangs Schranke) ist die Liste leer. Das Programm reproduziert also Yangs Satz 2 in diesem Bereich.

---

## 4. Probe an ⟨4,2,4⟩, r = 25

Ausgabe des Programms (Spalte slack(1) ist der Spielraum in Yangs Ungleichung (1), d·m + h ≤ ℓ + d·q):

| ρ | rk L | rk H | s_max | N ≠ 0 erzwungen | Spielraum (1) |
|---|---|---|---|---|---|
| 3 | 3 | 6 | 0 | ja | 0 |
| 3 | 4 | 7 | 0 | ja | 0 |
| 3 | 5 | 7 | 0 | ja | 1 |
| 3 | 5 | 8 | 1 | nein | 0 |

Das ist genau Satz A (B-008) mit der Spielraum-Angabe dort (0, 0, 1, 0) und die Tabelle zu Lemma 13′ in `s2_444_spurA_r2.md` Abschnitt 4 (`SatzA444.sDim_table`).

---

## 5. ⟨4,2,5⟩ bei r = 31

Der Rang ist transpositionsinvariant: Aus einer Zerlegung von ⟨4,2,5⟩ wird durch (AB)ᵀ = BᵀAᵀ eine von ⟨5,2,4⟩ derselben Länge. Yangs Normalform hängt aber an der Rolle der Dimensionen: n ist die Zeilenzahl von A (Zahl der F_i ist n − 1), m die Spaltenzahl von B (dim U = m). Eine Zerlegung der Länge 31 liefert also zwei Normalformen, eine in jeder Rolle, und muss in beiden Listen einen Fall treffen.

### 5.1 Rolle n = 4, m = 5

d = 3, dim Q = 31 − 25 = 6, Spielraum in (2): 3·(31 − 30) = 3. Von Hand: (14) gibt ρ ≥ 3, (2) und (13) geben 2ℓ + 6 ≥ 3ρ + ℓ, also ℓ ≥ 3ρ − 6. Mit ℓ ≤ 6 folgt ρ ≤ 4. Für ρ = 4 bleibt nur ℓ = 6 und h = 9. Für ρ = 3 ist ℓ ∈ {3, …, 6} und ⌈(9 + ℓ)/2⌉ ≤ h ≤ ℓ + 3. (15b) greift nie (ℓ = 3ρ ≥ 9 > 6).

| Nr. | ρ | rk L | rk H | s_max | N ≠ 0 erzwungen | Spielraum (1) | auch bei ⟨4,2,4⟩ |
|---|---|---|---|---|---|---|---|
| 1 | 3 | 3 | 6 | 0 | ja, dim N ≥ 2 | 0 | ja |
| 2 | 3 | 4 | 7 | 0 | ja, dim N ≥ 2 | 0 | ja |
| 3 | 3 | 5 | 7 | 0 | ja, dim N ≥ 2 | 1 | ja |
| 4 | 3 | 5 | 8 | 1 | nein | 0 | ja |
| 5 | 3 | 6 | 8 | 0 | ja, dim N ≥ 2 | 1 | neu |
| 6 | 3 | 6 | 9 | 1 | nein | 0 | neu |
| 7 | 4 | 6 | 9 | 0 | ja, dim N ≥ 1 | 0 | neu |

**Zahl der Restfälle: 7.** (Mit und ohne Zusatzbedingungen X1, X2 dieselbe Liste.)

Bei rk L = 6 = dim Q ist im L = Q, also Ĵ = ker W (Gegenstück zu Folgerung A2). Das betrifft die Fälle 5 bis 7.

### 5.2 Rolle n = 5, m = 4 (transponiert)

d = 4, dim Q = 31 − 24 = 7, Spielraum in (2): 4·(31 − 28) = 12. (14) gibt ρ ≥ 4 (m = 4 ≥ d = 4, Lean `lemma14` braucht nur d ≤ m), mit ρ ≤ m also ρ = 4. (13) gibt 2h ≥ 16 + 2ℓ, also h ≥ ℓ + 8. (2) gibt h ≤ ℓ + 12. ℓ ∈ {4, …, 7}.

| ρ | rk L | rk H |
|---|---|---|
| 4 | 4 | 12, 13, 14, 15, 16 |
| 4 | 5 | 13, 14, 15, 16, 17 |
| 4 | 6 | 14, 15, 16, 17, 18 |
| 4 | 7 | 15, 16, 17, 18, 19 |

**Zahl der Restfälle: 20.** Lemma 13′ gibt hier nichts: ρ = m, also ker G = 0 und s = 0 von selbst. Grund für die lange Liste: Yangs Schranke gilt in dieser Rolle nicht (sie setzt m ≥ n voraus), die Ungleichungen allein geben in dieser Rolle nur r ≥ 30 (das Programm findet für r = 29 keinen, für r = 30 drei Fälle). Bei r = 31 bleibt deshalb viel Spielraum.

### 5.3 Beide Rollen zusammen

Jede Zerlegung der Länge 31 liegt in einem Fall der Liste 5.1 und zugleich in einem Fall der Liste 5.2. Eine Kopplung zwischen beiden Normalformen kenne ich nicht. Ohne Kopplung sind das 7 · 20 = 140 Paare. Für den Angriff ist die Liste 5.1 maßgeblich, weil sie kurz ist. Die Rolle 5.2 ist nur dann nützlich, wenn ein späteres Argument (wie Satz F bei ⟨4,2,4⟩) die Transponierte braucht.

---

## 6. Was aus Satz B übertragbar ist (Schicht B)

Bei ⟨4,2,4⟩ fielen (4,7) und (5,7) über die Kette Lemma 13′ ⇒ N ≠ 0 ⇒ Lemma V (Symmetrie) ⇒ Lemma S (rk H = 8) weg.

- **Lemma 13′:** überträgt sich wörtlich (Lean für beliebiges d). Ergebnis in Tabelle 5.1: N ≠ 0 in den Fällen 1, 2, 3, 5, 7.
- **Lemma V:** braucht eine invertierbare Abbildung G : Kⁿ → U, also dim U = m = n, und dim I(u, u′) = 1, also dim(Ψ(u,U) + Ψ(u′,U)) = 2m − 1. In der Rolle 5.1 ist m = 5 ≠ n = 4. Bei ρ = 3 ist dim(Ψ(u,U) + Ψ(u′,U)) = m + ρ = 8, also dim I(u,u′) = 2, und Schritt 2 des Beweises (Proportionalität aus eindimensionalem I) fällt aus. Bei ρ = 4 (Fall 7) ist dim I = 1, aber die Abbildung φ aus Schritt 1 geht von K⁴ nach U ≅ K⁵, ist nur injektiv, und Schritt 3 (φ⁻¹φ″) braucht gleiche Bilder. **Vermutet:** Im Fall 7 lässt sich eine Fassung „Ψ(u, Gu′) = Ψ(u′, Gu) mit injektivem G“ retten. Ungeprüft.
- **Lemma S:** rechnet rk H im symmetrischen Fall über Quadriken in K[x_0, …, x_3] mit dim U = 4 aus. Ohne Lemma V keine Anwendung.
- **Rolle 5.2:** ρ = m, kein Kern, Lemma 13′ und Lemma V greifen nicht.

Folge: Ein Gegenstück zu Satz B, das die 7 Fälle maschinell verkürzt, gibt es nicht. Wer die Liste 5.1 verkürzen will, braucht ein neues Gegenstück zu Lemma V für m = n + 1.

---

## 7. Annahmen und Unsicherheiten

Übernommen (aus Stufe 2, dort behauptet oder geprüft, hier nicht nachgeprüft):

- Yangs Lemmata 4.1, 6, 8, 8′, 9, 10, 11, 13, 14, 15 in der allgemeinen Form aus `yang_n4.md`. Die Lean-Sätze in `YangN4Haupt.lean` und `YangN4Lemma13.lean` sind nach ihren Signaturen für allgemeine d, m, r formuliert. Ich habe nur die Signaturen gelesen, nicht die Beweise.
- Lemma 13′ in der allgemeinen Lean-Fassung `Lemma13Prime.lemma13Prime`.
- Yangs Satz 2 für ⟨4,2,5⟩ (R ≥ 31), damit R2 die Länge 31 nicht senkt.

Unsicher bei der Übertragung:

1. **Rolle n = 5, m = 4:** Hier gilt Yangs Satz 2 nicht direkt (m < n). Dass die Länge nach R2 bei 31 bleibt, folgt erst über die Transposition aus der Schranke für ⟨4,2,5⟩. Eine allgemeine Lean-Aussage „Rang von ⟨n,2,m⟩ = Rang von ⟨m,2,n⟩“ habe ich nicht gesucht. `Transponiert444.lean` enthält Hilfssätze für allgemeine n, m (etwa `transp_baseChange_alpha`), der Endsatz dort betrifft 4×2×4; ob die Teile für 4×2×5 reichen, habe ich nicht geprüft.
2. **Lemma 14 bei m = n − 1:** In der Rolle 5.2 ist m = 4 = d. `yang_n4.md` sagt, Lemma 14 braucht nur m ≥ n − 1, und die Lean-Fassung hat genau `hm : d ≤ m`. Ohne Lemma 14 wäre ρ ∈ {0, …, 4} offen und die Liste länger.
3. **Fallbegriff:** Ein „Fall“ ist hier ein Tripel (ρ, rk L, rk H). Bei ⟨4,2,4⟩ zerfiel (5,8) später weiter (Unterfälle A und B, B-013). Solche feineren Aufteilungen rechnet das Programm nicht.
4. **Generizität:** Die Invarianten hängen von p und u_0 ab. Die Liste gilt wie Satz A für jedes zulässige u_0. Satz B nimmt für h den generischen Höchstwert. Daran ändert die Übertragung nichts, ich habe es aber nicht neu durchdacht.
5. **Vollständigkeit der Bedingungen:** Ich habe nur die Ungleichungen aufgenommen, die Satz A benutzt, dazu X1 und X2. Weitere gültige Ungleichungen könnten die Listen verkürzen. Umgekehrt ist nicht gezeigt, dass jeder gelistete Fall eine Zerlegung hat.
6. **Schicht B:** Die Aussagen zu Lemma V in Abschnitt 6 sind eine Lektüre des Beweises, keine Rechnung.

---

## 8. Anhang: Ausgabe des Programms (ohne `--extra`)

```
<4,2,4> r=25  d=3  dim Q=5  slack(2)=3  extra=off  cases=4
  rho  rkL  rkH  s_max  N!=0 forced  slack(1)
    3    3    6      0  yes             0
    3    4    7      0  yes             0
    3    5    7      0  yes             1
    3    5    8      1  no              0

<4,2,5> r=31  d=3  dim Q=6  slack(2)=3  extra=off  cases=7
  rho  rkL  rkH  s_max  N!=0 forced  slack(1)
    3    3    6      0  yes             0
    3    4    7      0  yes             0
    3    5    7      0  yes             1
    3    5    8      1  no              0
    3    6    8      0  yes             1
    3    6    9      1  no              0
    4    6    9      0  yes             0

<5,2,4> r=31  d=4  dim Q=7  slack(2)=12  extra=off  cases=20
  (20 Zeilen, rho = 4, rkL = 4..7, rkH = rkL+8 .. rkL+12, s_max = 0, rho = m)

self-tests passed: <4,2,4> r=25 gives exactly [(3, 3, 6), (3, 4, 7), (3, 5, 7), (3, 5, 8)]
```

Die Liste für ⟨4,2,4⟩ bei r = 26 (30 Fälle, mit `--extra` 28) gibt das Programm ebenfalls aus. Sie dient nur der Probe gegen die echten 26er-Verfahren.
