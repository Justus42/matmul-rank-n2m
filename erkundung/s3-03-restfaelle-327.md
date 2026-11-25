# S3-03: Restfälle der Fallunterscheidung aus Stufe 2 für 3×2×7 bei Länge 34

- Auftrag: S3-03 (Stufe 3, Erkundung), im Auftrag des Orchestrators
- Datum: 25.11.2026
- Status aller Aussagen dieser Datei: **behauptet**, wo ausdrücklich gesagt **vermutet**. Nichts hier ist geprüft. Die Datei beweist nichts, sie zählt Fälle.
- Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, `STATUS.md`, `LOG.md` (Ende), `behauptungen/B-008.md`, `B-009.md`, `lean/prosa/yang_n4.md`, `lean/prosa/yang_n3.md`, `lean/prosa/s2_444_spurA_r2.md` (Abschnitte 1 bis 6), `lean/YangBounds/SatzA444.lean` (Kopf und `satzA_inequalities`), Signaturen in `YangN4Haupt.lean`, `YangN4Lemma13.lean`, `Lemma13Prime.lean`, `YangN3.lean`, `YangN3Teil3.lean`. Nichts unter `erkundung/` und keine PRs anderer S3-Aufträge.
- Kein Fremdmodell, kein Subagent. Rechenzeit des Programms unter 1 Sekunde.
- Eingeblendetes Projektgedächtnis: Index und drei Einträge zu Verfahren und Git-Regeln, ohne Urteile zu Behauptungen. Ich habe nichts davon verwendet und nichts ins Gedächtnis geschrieben.

---

## 1. Ergebnis in Kürze

1. **Rolle n = 3, m = 7 (die Rolle, in der Yangs Schranke 34 gilt): genau ein Restfall**,
   (ρ, rk L, rk H) = **(4, 6, 4)**, mit dim Q = 6, dim N = 3, Δ = 2.
   Ohne Yangs Lemma I (nur für n = 3) wären es zwei Fälle, dazu (3, 5, 3).
2. **Rolle n = 7, m = 3: 201 Fälle.** In dieser Rolle trägt die Fallunterscheidung nicht. Die Grundungleichung (2) schließt keinen einzigen Fall aus, und Lemma 14 gilt nicht (es braucht m ≥ n − 1). Die Rechnung lässt sogar Länge 30 zu (11 Fälle), liegt also unter der bekannten Schranke 34.
3. **Probe an 4×2×4 bei Länge 25:** Das Programm liefert genau die Liste aus Satz A (B-008): ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}, dazu die Tabelle aus Lemma 13′ (s = 0, 0, 0 und s ≤ 1).
4. **Was den einen Fall erzwingt:** Gleichung (2), Lemma 13, Lemma 15(a), Lemma 15(b) und Lemma I. Lässt man eine davon weg, bleiben 2 bis 40 Fälle (Abschnitt 5). Lemma 15(b) spielt bei 4×2×4 keine Rolle, hier ist es entscheidend. Das ist die wichtigste Unsicherheit der Übertragung (Abschnitt 7).
5. Der Restfall ist in jeder Ungleichung, die ihn bestimmt, scharf: (2) ist eine Gleichung, L ist surjektiv auf Q, s = 0, und Lemma H und Lemma I sind beide mit Gleichheit erfüllt (Abschnitt 6).

---

## 2. Die Fallunterscheidung aus Stufe 2

Satz A (`lean/prosa/s2_444_spurA_r2.md` Abschnitt 3, Lean `SatzA444.satzA_inequalities`) ist eine reine Ganzzahlrechnung in drei Unbekannten ρ, rk L, rk H. Sie benutzt in Yangs Normalform (über dem algebraischen Abschluss, (N1), (N2), kein α_t = 0) diese Bedingungen:

| Nr. | Bedingung bei ⟨4,2,4⟩, r = 25 | Herkunft |
|---|---|---|
| 1 | dim Q = r − 20 = 5, rk L ≤ 5 | Lemma 4.1(iii) |
| 2 | rk H ≤ rk L + 3 | Gleichung (2), aus Lemma 10 |
| 3 | 2 rk H ≥ 3ρ + rk L | Lemma 13 |
| 4 | ρ ≥ 3 | Lemma 14 (braucht m ≥ n − 1) |
| 6 | rk L ≥ 3 | Lemma 8′ |
| 7 | 2 rk H ≥ 2 rk L | Lemma 11 (dort ohne Wirkung) |
| 8 | rk L ≤ 3ρ, und rk L = 3ρ ⇒ ρ = m | Lemma 15(a), 15(b) (dort ohne Wirkung) |

Dazu als Verfeinerung Lemma 13′: rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉ mit s = dim(F_2(ker F_1) + F_3(ker F_1)). Sie schneidet keinen Fall weg, legt aber s fest.

Die weiteren Schritte der Stufe 2 (Lemma V, Lemma S, Satz B, C, E, F) sind keine Zählbedingungen. Sie benutzen die Struktur bei m = 4, ρ = 3 (ker F_1 eindimensional, dim U = n). Sie gehören nicht zu dieser Rechnung (siehe Abschnitt 7, Punkt 6).

---

## 3. Verallgemeinerung auf n×2×m bei Länge r

Bezeichnungen wie in `lean/prosa/yang_n4.md`: d = n − 1, U = Zeilen-0-freie Matrizen (dim U = m), Q = ker W / J, F_1, …, F_d : U → Q, L, H die schiefe Erweiterung auf U^{∧d}, ρ = max_γ rk(Σ γ_i F_i). Alle Lemmata sind in der Prosa und in `YangN4Haupt.lean` / `YangN4Lemma13.lean` / `Lemma13Prime.lean` für allgemeines d, m, r formuliert (`ineq1`, `lemma8'`, `lemma14` mit `d ≤ m`, `lemma15a`, `lemma15b` mit `2 ≤ d` und algebraisch abgeschlossenem K, `lemma13_statement`, `lemma11`, `lemma13Prime` mit d = e + 2).

| Kürzel | Bedingung | Herkunft | gilt wann |
|---|---|---|---|
| Q | q := dim Q = r − (n+1)m ≥ 0; 0 ≤ rk L ≤ q; 0 ≤ ρ ≤ min(m, q); 0 ≤ rk H ≤ min(d(d−1)/2·m, d·q) | Lemma 4.1(iii), Dimensionen | immer |
| (2) | d·m + rk H ≤ rk L + d·q | Lemma 10, Gl. (1) | immer, nur (N1) |
| L8′ | rk L ≥ d | Lemma 8′ | m ≥ 1 |
| L15a | rk L ≤ d·ρ | Lemma 15(a) | immer |
| L15b | rk L = d·ρ ⇒ ρ = m | Lemma 15(b) | d ≥ 2, K algebraisch abgeschlossen |
| L14 | ρ ≥ d | Lemma 14 | nur wenn m ≥ d |
| L13 | 2 rk H ≥ d·ρ + (d−2)·rk L | Lemma 13 | d ≥ 2 |
| L11 | 2 rk H ≥ (d−1)·rk L | Lemma 11 | immer |
| triv | ρ ≤ rk L, rk H ≤ d·rk L | im(Σγ_iF_i) ⊆ im L, im H ⊆ (im L)^d | immer |
| LI | 2 rk H − rk L ≥ min(2, m − rk H) | Yang Lemma I (`yang_n3.md` Abschnitt 8, Lean `YangN3Teil3.lemma_I`) | nur n = 3 (d = 2), dort ist rk H = m − dim N |

Verfeinerung (kein Ausschluss, nur Auskunft): Lemma 13′ in der Lean-Form `lemma13Prime` für beliebiges d: d·ρ + 2s + (d−2)·rk L ≤ 2 rk H, mit s = dim Σ_i F_i(ker G) für eine Kombination G vom Rang ρ. Das Programm gibt die obere Schranke für s aus. Für d = 3 ist das genau die Tabelle aus `s2_444_spurA_r2.md` Abschnitt 4. Für d = 2 ist es eine Gleichung: rk H = ρ + s.

**Beide Rollen.** ⟨3,2,7⟩ und ⟨7,2,3⟩ haben denselben Rang (Transponieren: (AB)ᵀ = BᵀAᵀ). Eine Zerlegung der Länge 34 gibt also zwei Normalformen, eine mit (n, m) = (3, 7) und eine mit (n, m) = (7, 3), und beide Fallisten gelten gleichzeitig. Die mittlere 2 ist in diesem Rahmen fest, andere Vertauschungen (etwa ⟨3,7,2⟩) kommen nicht vor.

---

## 4. Probe an 4×2×4 und weitere Kontrollen

Ausgabe des Programms (Anhang A), wörtlich:

```
== Probe: <4,2,4>, r = 25 ==
<4,2,4> r=25: dim Q=5, cases=4
   {'rho': 3, 'rkL': 3, 'rkH': 6, 'smax': 0, 'slack1': 0, 'dimKerL': 9}
   {'rho': 3, 'rkL': 4, 'rkH': 7, 'smax': 0, 'slack1': 0, 'dimKerL': 8}
   {'rho': 3, 'rkL': 5, 'rkH': 7, 'smax': 0, 'slack1': 1, 'dimKerL': 7}
   {'rho': 3, 'rkL': 5, 'rkH': 8, 'smax': 1, 'slack1': 0, 'dimKerL': 7}
  probe OK: list = Satz A, s bound = table of Lemma 13'
== Controls: Yang says no decomposition, so no case may remain ==
  <4,2,4> r=24: 0 cases  OK
  <3,2,7> r=33: 0 cases  OK
  <3,2,6> r=29: 0 cases  OK
  <4,2,5> r=30: 0 cases  OK
== Controls: a decomposition exists, so a case must remain ==
  <3,2,5> r=25: measured (rkL,rkH)=(5,4) is in the list  OK
  <3,2,6> r=30: measured (rkL,rkH)=(6,6) is in the list  OK
  <4,2,4> r=26: list not empty  OK
  <3,2,7> r=35: list not empty  OK
  <7,2,3> r=35: list not empty  OK
== Target: 3x2x7, r = 34 ==
-- role n=3, m=7 --
<3,2,7> r=34: dim Q=6, cases=2 (without LI)
   {'rho': 3, 'rkL': 5, 'rkH': 3, 'smax': 0, 'slack1': 0, 'dimKerL': 9, 'dimN': 4, 'Delta': 1}
   {'rho': 4, 'rkL': 6, 'rkH': 4, 'smax': 0, 'slack1': 0, 'dimKerL': 8, 'dimN': 3, 'Delta': 2}
<3,2,7> r=34: dim Q=6, cases=1
   {'rho': 4, 'rkL': 6, 'rkH': 4, 'smax': 0, 'slack1': 0, 'dimKerL': 8, 'dimN': 3, 'Delta': 2}
-- role n=7, m=3 --
<7,2,3> r=34: dim Q=10, cases=201
   rho=2 rkL=6: rkH in 18..36 (19 values)
   rho=2 rkL=7: rkH in 20..42 (23 values)
   rho=2 rkL=8: rkH in 22..45 (24 values)
   rho=2 rkL=9: rkH in 24..45 (22 values)
   rho=2 rkL=10: rkH in 26..45 (20 values)
   rho=3 rkL=6: rkH in 21..36 (16 values)
   rho=3 rkL=7: rkH in 23..42 (20 values)
   rho=3 rkL=8: rkH in 25..45 (21 values)
   rho=3 rkL=9: rkH in 27..45 (19 values)
   rho=3 rkL=10: rkH in 29..45 (17 values)
== Ablation: number of cases if one condition is dropped ==
  <4,2,4> r=25: (2):25  L8':4  L15a:4  L15b:4  L14:12  L13:20  L11:4  triv:4  LI:4
  <3,2,7> r=34: (2):40  L8':1  L15a:2  L15b:2  L14:1  L13:3  L11:1  triv:1  LI:2
  <7,2,3> r=34: (2):201  L8':311  L15a:413  L15b:223  L14:201  L13:234  L11:201  triv:225  LI:201
  <3,2,7> r=34 without L15a: [(2, 6, 4), (4, 6, 4)]
  <3,2,7> r=34 without L15b: [(3, 6, 4), (4, 6, 4)]
  <3,2,7> r=34 without L13: [(4, 6, 4), (5, 6, 4), (6, 6, 4)]
  <3,2,7> r=34 without LI: [(3, 5, 3), (4, 6, 4)]
== Context: neighbouring lengths ==
  r=30: role (3,7): 0   role (7,3): 11
  r=31: role (3,7): 0   role (7,3): 44
  r=32: role (3,7): 0   role (7,3): 99
  r=33: role (3,7): 0   role (7,3): 162
  r=34: role (3,7): 1   role (7,3): 201
  r=35: role (3,7): 26   role (7,3): 234
  r=36: role (3,7): 51   role (7,3): 247
```

Gelesen:

- **Probe bestanden.** Für ⟨4,2,4⟩, r = 25 kommt genau die Liste aus Satz A heraus, mit ρ = 3. Die Schranke für s stimmt mit der Tabelle aus Lemma 13′ überein. Das Programm bricht ab (`assert`), wenn das nicht so ist.
- **Kontrollen ohne Zerlegung:** Wo Yangs Sätze keine Zerlegung zulassen (⟨4,2,4⟩ bei 24, ⟨3,2,7⟩ bei 33, ⟨3,2,6⟩ bei 29, ⟨4,2,5⟩ bei 30), bleibt kein Fall. Das zeigt nur, dass die Rechnung Yangs Schlüsse nachvollzieht, und ist kein neuer Befund.
- **Kontrollen mit Zerlegung:** Wo eine Zerlegung bekannt ist, muss ein Fall bleiben. Für ⟨3,2,5⟩ bei 25 und ⟨3,2,6⟩ bei 30 liegen die gemessenen Werte (rk L, rk H) = (5, 4) und (6, 6) aus `yang_n3.md` Abschnitt 12 in der Liste. Diese Messwerte stammen aus einem Wegwerf-Skript eines früheren Auftrags und sind behauptet. Für ⟨4,2,4⟩ bei 26 und ⟨3,2,7⟩ bei 35 ist die Liste nicht leer.

---

## 5. Ergebnis für 3×2×7 bei Länge 34

### 5.1 Rolle n = 3, m = 7

d = 2, q = 34 − 28 = 6. Die Bedingungen lauten:

- (2): 14 + rk H ≤ rk L + 12, also **rk H ≤ rk L − 2**
- L11: 2 rk H ≥ rk L
- L13: rk H ≥ ρ
- L15a, L15b: rk L ≤ 2ρ, und rk L = 2ρ nur bei ρ = 7, also rk L = 14 > q. Damit **rk L ≤ 2ρ − 1**
- L14: ρ ≥ 2; L8′: rk L ≥ 2; Q: rk L ≤ 6, ρ ≤ 6
- LI: 2 rk H − rk L ≥ min(2, 7 − rk H)

Von Hand: Aus rk H ≤ rk L − 2 und 2 rk H ≥ rk L folgt rk L ≥ 4. Es bleiben (rk L, rk H) ∈ {(4,2), (5,3), (6,3), (6,4)}.

| (rk L, rk H) | ρ aus L13 und L15 | Lemma I: Δ ≥ min(2, dim N) | Ergebnis |
|---|---|---|---|
| (4, 2) | ρ ≤ 2 und ρ ≥ 2,5 | | ausgeschlossen (L15b) |
| (5, 3) | ρ = 3 | Δ = 1, dim N = 4, verlangt 2 | ausgeschlossen (LI) |
| (6, 3) | ρ ≤ 3 und ρ ≥ 3,5 | | ausgeschlossen (L15b) |
| **(6, 4)** | **ρ = 4** | Δ = 2, dim N = 3, verlangt 2 | **bleibt** |

**Restfall R-327: ρ = 4, rk L = 6, rk H = 4.** Abgeleitete Größen: dim Q = 6, dim N = 7 − 4 = 3, Δ = 2, dim ker L = 8, s = 0, Spielraum in (2) gleich 0.

### 5.2 Rolle n = 7, m = 3

d = 6, q = 34 − 24 = 10. (2) lautet rk H ≤ rk L + 42 und greift nie, weil rk H ≤ dim U^{∧6} = 45 und rk L ≥ 6. Lemma 14 gilt nicht (m = 3 < d = 6), also nur ρ ≥ 1 aus den übrigen Bedingungen, und mit L15b ρ ≥ 2. Lemma I gibt es für n = 7 nicht. Es bleiben **201 Fälle**:

| ρ | rk L | rk H | Anzahl |
|---|---|---|---|
| 2 | 6 | 18 bis 36 | 19 |
| 2 | 7 | 20 bis 42 | 23 |
| 2 | 8 | 22 bis 45 | 24 |
| 2 | 9 | 24 bis 45 | 22 |
| 2 | 10 | 26 bis 45 | 20 |
| 3 | 6 | 21 bis 36 | 16 |
| 3 | 7 | 23 bis 42 | 20 |
| 3 | 8 | 25 bis 45 | 21 |
| 3 | 9 | 27 bis 45 | 19 |
| 3 | 10 | 29 bis 45 | 17 |

Bei Länge 30 sind es in dieser Rolle schon 11 Fälle, bei 31 sind es 44 (Abschnitt „Context“ der Ausgabe). Diese Rolle sieht also nicht einmal die bekannte Schranke 34. Sie liefert keine Einschränkung, die über die Rolle (3, 7) hinausgeht. Ihre Liste gilt zusätzlich, ist aber leer an Information.

### 5.3 Welche Bedingungen tragen (Ablation)

Zahl der Fälle, wenn man genau eine Bedingung weglässt (aus der Ausgabe):

| weggelassen | ⟨4,2,4⟩, 25 | ⟨3,2,7⟩, 34 | ⟨7,2,3⟩, 34 |
|---|---|---|---|
| keine | 4 | 1 | 201 |
| (2) | 25 | 40 | 201 |
| L8′ | 4 | 1 | 311 |
| L15a | 4 | 2 | 413 |
| L15b | 4 | 2 | 223 |
| L14 | 12 | 1 | 201 |
| L13 | 20 | 3 | 234 |
| L11 | 4 | 1 | 201 |
| triv | 4 | 1 | 225 |
| LI | 4 | 2 | 201 |

Bei ⟨4,2,4⟩ tragen (2), L13 und L14. Bei ⟨3,2,7⟩ in der Rolle (3, 7) tragen (2), L13, L15a, L15b und LI. L14 und L8′ sind dort überflüssig.

---

## 6. Was im Restfall R-327 sonst noch gilt

Alles **behauptet**, jeweils mit einer Zeile Begründung aus den genannten Lemmata (Bezeichnungen aus `yang_n3.md` Abschnitte 6 bis 8).

1. **L ist surjektiv auf Q, und Ĵ := J + f_1(U) + f_2(U) = ker W.** rk L = 6 = q. Ĵ ⊆ ker W (Lemma C) und dim Ĵ = m + rk L = 13 = r − 3m = dim ker W. Das ist das Gegenstück zu Folgerung A2.
2. **Φ ist surjektiv auf Q³.** (G) ist eine Gleichung: 2·7 + 4 = 18 = 6 + 2·6. Also rk Φ = 3m − dim N = 18 = dim(im L × Q × Q). Das ist das Gegenstück zu Folgerung A1.
3. **s = 0, und alle F_i verschwinden auf N; N ist der Kern jeder Kombination vom Rang ρ.** Für d = 2 ist rk H = ρ + s. Mit rk H = ρ = 4 folgt s = 0, also F_1(ker G) = F_2(ker G) = 0 für eine Kombination G vom Rang 4, also ker G ⊆ N. Beide haben Dimension 3, also ker G = N. F_1 und F_2 faktorisieren über U/N (Dimension 4) nach Q (Dimension 6).
4. **dim S = 1, und f_0(N) = span(f_0(v), f_1(v), f_2(v)) für S = span(v).** Lemma H gibt dim S ≥ dim N − Δ = 1. Wäre S = 0, gäbe Lemma H Δ ≥ dim N = 3. Also S ≠ 0, und Lemma B gibt dim S + 2 ≤ dim N = 3. Also dim S = 1, und in Lemma B gilt Gleichheit: Der Raum f_0(S) + f_1(S) + f_2(S) liegt in f_0(N), und beide haben Dimension 3.
5. **Lemma H ist scharf:** Die Abbildung N/S → ker L/(N × N) aus dem Beweis von Lemma H ist ein Isomorphismus (beide Dimension 2: 3 − 1 = 8 − 6).

Bei 4×2×4 war der Weg nach Satz A: Lemma 13′ gibt einen gemeinsamen Kern N ≠ 0, Lemma V macht daraus Symmetrie, Lemma S rechnet rk H aus. Bei 3×2×7 liegt der gemeinsame Kern (Punkt 3, dim N = 3) schon vor. Ob ein Gegenstück zu Lemma V existiert, ist offen (Abschnitt 7, Punkt 6).

---

## 7. Annahmen und Unsicherheiten

Übernommen aus der Fallunterscheidung der Stufe 2, ohne eigene Prüfung:

- Reduktionen R1 bis R3 und Lemma 6 (Normalform über dem algebraischen Abschluss, (N1), (N2), kein α_t = 0).
- Die Länge bleibt nach R2 bei 34. Wie in Satz A braucht das die untere Schranke selbst, hier R(⟨3,2,7⟩) ≥ 34 (Yang Satz 1; laut `yang_n3.md` Abschnitt 10 auch aus dem Lean-Satz von Tsyganov u. a.).
- Die Liste gilt für jedes zulässige u_0, wie Satz A. ρ und rk H können von u_0 abhängen, aber jedes zulässige u_0 landet im selben einen Fall.

Wo die Übertragung selbst unsicher ist:

1. **Lemma 15(b) bei d = 2.** In der Kette zu 4×2×4 ist es ohne Wirkung, hier schließt es (4,2) und (6,3) aus. Die Prosa (`yang_n4.md`, Lemma 15) und der Lean-Satz `YangN4Haupt.lemma15b` (Voraussetzung `2 ≤ d`) decken d = 2 ab. Benutzt wurde es für d = 2 aber noch nirgends. Es braucht den algebraisch abgeschlossenen Körper (über Lemma 9). Für n = 3 kommt Yangs eigener Beweis ohne das aus.
2. **Zwei Rahmen für n = 3.** Lemma I steht im Rahmen von `yang_n3.md` / `YangN3Teil3.lean`, die übrigen Lemmata im allgemeinen Rahmen `yang_n4.md` / `YangN4Haupt.lean` mit d = 2. Die Objekte sollten übereinstimmen (gleiche f_i, J, Q, F_i, L; H bei d = 2 ist bis aufs Vorzeichen (F_2, −F_1), siehe U-5 in `yang_n3.md`). Eine Lean-Brücke zwischen beiden Rahmen gibt es nicht. Ohne Lemma I bleiben zwei Fälle statt einem.
3. **Lemma 14 und Lemma 13 bei d = 2** sind formal abgedeckt (`lemma14` mit `d ≤ m`, `lemma13_statement` mit d ≥ 2), wurden aber nur mit d = 3 benutzt. Für das Ergebnis ist L14 hier ohnehin überflüssig.
4. **Lemma 13′ für allgemeines d.** Die Prosa hat nur d = 3, die Lean-Fassung `Lemma13Prime.lemma13Prime` hat beliebiges d = e + 2. Ich benutze sie nur zur Auskunft über s, nicht zum Ausschluss.
5. **Vollständigkeit der Bedingungen.** Ich habe nur die Bedingungen der Tabelle in Abschnitt 3 benutzt. Weitere Ganzzahl-Bedingungen, die in der Stufe 2 nicht vorkamen, könnten die Liste in der Rolle (7, 3) verkürzen. In der Rolle (3, 7) ist die Liste schon auf einen Fall herunter.
6. **Nicht übertragbar ohne neue Arbeit (vermutet):** Lemma V setzt dim U = n voraus (eine invertierbare Abbildung G : Kⁿ → U). Bei 3×2×7 ist dim U = 7 und n = 3. Lemma S rechnet mit Quadriken in vier Variablen (n = 4). Beides lässt sich nicht wörtlich übernehmen.
7. **Rolle (7, 3).** Dass hier 201 Fälle bleiben, liegt an den Bedingungen, nicht am Programm: (2) hat bei r = 34 den Spielraum d·(r − (n+2)m) = 6·7 = 42. Yangs Satz 2 setzt m ≥ n voraus und gilt hier nicht.
8. **Programm.** Es rechnet nur die Ganzzahl-Logik nach. Die Bedingungen habe ich von Hand aus Prosa und Lean-Signaturen übertragen. Ein Übertragungsfehler würde die Probe an 4×2×4 nur dann bemerken, wenn er dort wirkt. L15a, L15b und LI wirken bei 4×2×4 nicht (Abschnitt 5.3) und sind deshalb durch die Probe nicht abgesichert. Für sie gibt es nur die Kontrollen in Abschnitt 4 und die Handrechnung in 5.1.

---

## 8. Zusammenfassung für den Orchestrator

- Zahl der Restfälle für 3×2×7 bei Länge 34: **1** in der Rolle (n, m) = (3, 7), nämlich (ρ, rk L, rk H) = (4, 6, 4); **201** in der Rolle (7, 3), die nichts einschränkt.
- Ohne Yangs Lemma I: 2 Fälle in der Rolle (3, 7).
- Probe an 4×2×4 bei 25: genau die vier Fälle aus Satz A, mit derselben s-Tabelle.
- Status: behauptet.

---

## Anhang A: Programm `restfaelle.py` (Python 3, nur Standardbibliothek, ganze Zahlen)

Aufruf: `python3 restfaelle.py` (Probe, Kontrollen, Ziel, Ablation) oder `python3 restfaelle.py n m r` (ein Parametersatz). Laufzeit unter einer Sekunde.

```python
#!/usr/bin/env python3
"""Case enumeration for Yang's normal form of <n,2,m> at an assumed length r (task S3-03).

Integer conditions only, no linear algebra. For given (n, m, r) list all triples
(rho, rkL, rkH) that survive the inequalities of "Satz A" (stage 2, <4,2,4>, r = 25),
generalised to n x 2 x m. Notation as in lean/prosa/yang_n4.md:
d = n - 1, q = dim Q = r - (n+1) m. Lemma I (Yang, n = 3 only) is optional.
Usage: python3 restfaelle.py            (probe, controls, target, ablation)
       python3 restfaelle.py n m r      (one parameter set)
"""
import sys
from collections import Counter

NAMES = ["(2)", "L8'", "L15a", "L15b", "L14", "L13", "L11", "triv", "LI"]


def conditions(n, m, r, rho, rkL, rkH):
    """Truth value of every condition for one candidate triple."""
    d = n - 1
    q = r - (n + 1) * m
    return {
        "(2)": d * m + rkH <= rkL + d * q,                       # Yang (1)/(2), Lemma 10
        "L8'": rkL >= d,                                         # Lemma 8'
        "L15a": rkL <= d * rho,                                  # Lemma 15(a)
        "L15b": not (d >= 2 and rkL == d * rho and rho != m),    # Lemma 15(b), alg. closed
        "L14": (m < d) or rho >= d,                              # Lemma 14 (needs m >= d)
        "L13": 2 * rkH >= d * rho + (d - 2) * rkL,               # Lemma 13
        "L11": 2 * rkH >= (d - 1) * rkL,                         # Lemma 11
        "triv": rho <= rkL and rkH <= d * rkL,                   # images lie in im L
        "LI": (d != 2) or 2 * rkH - rkL >= min(2, m - rkH),      # Yang Lemma I (n = 3)
    }


def cases(n, m, r, drop=()):
    d = n - 1
    q = r - (n + 1) * m                      # Lemma 4.1(iii): dim Q
    out = []
    if q < 0 or d < 1 or m < 1:
        return q, out
    dim_skew = d * (d - 1) // 2 * m          # dim U^{wedge d}
    for rho in range(0, min(m, q) + 1):      # rho <= dim U and rho <= dim Q
        for rkL in range(0, min(q, d * m) + 1):
            for rkH in range(0, min(dim_skew, d * q) + 1):
                c = conditions(n, m, r, rho, rkL, rkH)
                if not all(v for k, v in c.items() if k not in drop):
                    continue
                # Lemma 13' (Lean form, any d): d*rho + 2 s + (d-2) rkL <= 2 rkH
                smax = (2 * rkH - d * rho - (d - 2) * rkL) // 2
                smax = min(smax, (d - 1) * (m - rho), q)
                info = dict(rho=rho, rkL=rkL, rkH=rkH, smax=smax,
                            slack1=rkL + d * q - d * m - rkH, dimKerL=d * m - rkL)
                if d == 2:
                    info["dimN"] = m - rkH
                    info["Delta"] = 2 * rkH - rkL
                out.append(info)
    return q, out


def show(n, m, r, drop=(), full=True):
    q, cs = cases(n, m, r, drop)
    tag = f" (without {', '.join(drop)})" if drop else ""
    print(f"<{n},2,{m}> r={r}: dim Q={q}, cases={len(cs)}{tag}")
    if full:
        for c in cs:
            print("  ", c)
    return cs


def main():
    if len(sys.argv) == 4:
        show(*map(int, sys.argv[1:]))
        return
    print("== Probe: <4,2,4>, r = 25 ==")
    cs = show(4, 4, 25)
    got = sorted((c["rho"], c["rkL"], c["rkH"]) for c in cs)
    assert got == [(3, 3, 6), (3, 4, 7), (3, 5, 7), (3, 5, 8)], got
    smax = {(c["rkL"], c["rkH"]): c["smax"] for c in cs}
    assert smax == {(3, 6): 0, (4, 7): 0, (5, 7): 0, (5, 8): 1}, smax
    print("  probe OK: list = Satz A, s bound = table of Lemma 13'")
    print("== Controls: Yang says no decomposition, so no case may remain ==")
    for (n, m, r) in [(4, 4, 24), (3, 7, 33), (3, 6, 29), (4, 5, 30)]:
        assert len(cases(n, m, r)[1]) == 0, (n, m, r)
        print(f"  <{n},2,{m}> r={r}: 0 cases  OK")
    print("== Controls: a decomposition exists, so a case must remain ==")
    for (n, m, r, L, H) in [(3, 5, 25, 5, 4), (3, 6, 30, 6, 6)]:
        assert any((c["rkL"], c["rkH"]) == (L, H) for c in cases(n, m, r)[1]), (n, m, r)
        print(f"  <{n},2,{m}> r={r}: measured (rkL,rkH)=({L},{H}) is in the list  OK")
    for (n, m, r) in [(4, 4, 26), (3, 7, 35), (7, 3, 35)]:
        assert len(cases(n, m, r)[1]) > 0, (n, m, r)
        print(f"  <{n},2,{m}> r={r}: list not empty  OK")
    print("== Target: 3x2x7, r = 34 ==")
    print("-- role n=3, m=7 --")
    show(3, 7, 34, drop=("LI",))
    show(3, 7, 34)
    print("-- role n=7, m=3 --")
    cs = show(7, 3, 34, full=False)
    by = Counter((c["rho"], c["rkL"]) for c in cs)
    for k in sorted(by):
        hs = [c["rkH"] for c in cs if (c["rho"], c["rkL"]) == k]
        print(f"   rho={k[0]} rkL={k[1]}: rkH in {min(hs)}..{max(hs)} ({len(hs)} values)")
    print("== Ablation: number of cases if one condition is dropped ==")
    for (n, m, r) in [(4, 4, 25), (3, 7, 34), (7, 3, 34)]:
        row = []
        for k in NAMES:
            cs = cases(n, m, r, drop=(k,))[1]
            row.append(f"{k}:{len(cs)}")
        print(f"  <{n},2,{m}> r={r}: " + "  ".join(row))
    for k in ["(2)", "L15a", "L15b", "L13", "LI"]:
        cs = cases(3, 7, 34, drop=(k,))[1]
        if len(cs) <= 6:
            print(f"  <3,2,7> r=34 without {k}: "
                  + str([(c['rho'], c['rkL'], c['rkH']) for c in cs]))
    print("== Context: neighbouring lengths ==")
    for r in range(30, 37):
        a = len(cases(3, 7, r)[1])
        b = len(cases(7, 3, r)[1])
        print(f"  r={r}: role (3,7): {a}   role (7,3): {b}")


if __name__ == "__main__":
    main()
```
