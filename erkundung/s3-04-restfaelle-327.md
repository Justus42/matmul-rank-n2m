# S3-04: Restfälle der Stufe-2-Fallunterscheidung für 3×2×7 bei Länge 34

- Auftrag: S3-04 (Stufe 3, Erkundung nach Protokoll 0.5, Abschnitt 3), im Auftrag des Orchestrators
- Datum: 25.11.2026
- Status aller Aussagen dieser Datei: **behauptet** (Rechnung und Herleitung eines Agenten, ungeprüft). Diese Datei beweist nichts über den Rang von ⟨3,2,7⟩. Sie zählt, welche Kombinationen von Kenngrößen die Ungleichungen der Stufe 2 übrig lassen.
- Programm: [`s3-04-restfaelle-327.py`](s3-04-restfaelle-327.py) (Python 3, nur ganze Zahlen, keine Abhängigkeiten). Aufruf: `python3 erkundung/s3-04-restfaelle-327.py`, Laufzeit unter 1 Sekunde. SHA-256 der Fassung dieses Commits: `83de52bca9f8a2c996dc1140388c0869d2673a6c7ad246e2df8253bd3de4a711`.
- Gelesen: `PROTOKOLL.md`, `CLAUDE.md`, `STATUS.md`, `LOG.md` (Ende), `behauptungen/B-008.md`, `B-009.md`, `lean/prosa/yang_n4.md`, `lean/prosa/yang_n3.md` (Abschnitte 6 bis 8 und 12), `lean/prosa/s2_444_spurA_r2.md`, Kopf von `lean/YangBounds/Lemma13Prime.lean` und die Sätze in `lean/YangBounds/YangN4Haupt.lean`, `versuche/` (nach 3×2×7 durchsucht, kein früherer Versuch zu dieser Frage). Nichts unter `erkundung/` außer dieser Datei, keine PRs anderer S3-Aufträge.
- Keine Fremdmodell-Anfrage, keine Subagenten, kein Kontakt nach außen. Eingeblendet wurden mir der Gedächtnisindex und zwei Einzeleinträge (`hk-verfahren-a10`, `lean-upper-3x2x6`), beide nur Datei- und Bauhinweise. Ich habe sie nicht benutzt.

---

## 1. Ergebnis in Kürze

1. **Rolle n = 3** (A ist 3×2, B ist 2×7, dim U = 7, dim Q = 34 − 28 = 6): Es bleibt **genau ein Restfall**,

   **(ρ, rk L, rk H) = (4, 6, 4)**, mit s = 0, dim N = 3, Δ = 2 und dim S = 1.

   Ohne Yangs eigene Bedingung für n = 3 (Lemma I, siehe 2.3) wären es zwei Fälle: dazu (3, 5, 3). Lemma I schließt (3, 5, 3) aus.
2. **Rolle n = 7** (transponiert: A ist 7×2, B ist 2×3, dim U = 3, dim Q = 34 − 24 = 10): Es bleiben **201 Tripel (ρ, rk L, rk H)**, mit s gezählt 666 Quadrupel. Sie verteilen sich auf 10 Paare (ρ, rk L) mit ρ ∈ {2, 3} und rk L ∈ {6, …, 10}. In dieser Rolle tragen die Ungleichungen fast nichts: Sie lassen schon Länge 30 zu. Die Rolle liefert also für Länge 34 keine Einschränkung, die man als kurze Fallliste nutzen könnte.
3. **Probe an 4×2×4, r = 25:** Das Programm liefert genau die Liste aus B-008 (ρ = 3, (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}) und mit dem Filter aus Satz B genau die Liste aus B-009 ({(3,6), (5,8)}). Weitere Proben in Abschnitt 4.
4. Eine Zerlegung der Länge 34 von ⟨3,2,7⟩ liefert durch Transponieren eine von ⟨7,2,3⟩ derselben Länge. Beide Analysen gelten also für dieselbe Zerlegung zugleich. Eine Kopplung zwischen den Kenngrößen beider Rollen kenne ich nicht. Ohne Kopplung ist die Restliste das Produkt: 1 × 201 Tripel. Die nutzbare Information steckt aber ganz in Rolle n = 3.
5. **Wichtigste Unsicherheit:** Der Schritt, der bei 4×2×4 von vier auf zwei Fälle führte (Satz B mit Lemma V und Lemma S), braucht dim U = n und ρ = m − 1. Beides gilt bei 3×2×7 in keiner Rolle. Der eine Restfall der Rolle n = 3 ist also mit den Mitteln der Stufe 2 nicht weiter zerlegt. Ob er sich so angreifen lässt wie die Fälle (3,6) und (5,8) bei 4×2×4, ist offen (Abschnitt 6).

---

## 2. Welche Bedingungen bestimmen die Fallliste bei 4×2×4?

Bezeichnungen wie in `lean/prosa/yang_n4.md`: Format ⟨n,2,m⟩, Länge r, d := n − 1 Abbildungen F_1, …, F_d : U → Q, dim U = m, q := dim Q = r − (n+1)·m. ρ ist der größte Rang einer Kombination Σγ_iF_i, rk L und rk H wie dort. s := dim Σ_{j≥2} F_j(ker F_1) nach dem Basiswechsel mit rk F_1 = ρ (Lemma 13′). Alles nach den Reduktionen R1 bis R3 und Lemma 6, also über algebraisch abgeschlossenem Körper, (N1), (N2), kein α_t = 0.

### 2.1 Die Bedingungen aus Satz A (B-008), verallgemeinert

Ich habe den Beweis von Satz A (`s2_444_spurA_r2.md`, Abschnitt 3) Schritt für Schritt durchgesehen und jede benutzte Ungleichung für allgemeines n, m, r aufgeschrieben. In der Spalte „Quelle“ steht, wo die allgemeine Fassung steht. Die Lean-Sätze in `YangN4Haupt.lean` sind für allgemeines d und m formuliert (Algorithmus `BilinearAlgorithm K (d + 1) 2 m r`).

| Nr. | Bedingung (allgemein) | Voraussetzung | Quelle | bei 4×2×4, r = 25 |
|---|---|---|---|---|
| B1 | q = r − (n+1)m ≥ 0 und rk L ≤ q | – | Lemma 4.1(iii) | rk L ≤ 5 |
| B2 | (n−1)(r − (n+2)m) ≥ rk H − rk L | – | Gleichung (2), Lean `ineq1` | rk H ≤ rk L + 3 |
| B3 | 2 rk H ≥ (d−1)·rk L | – | Lemma 11 | rk H ≥ rk L |
| B4 | 2 rk H ≥ d·ρ + 2s + (d−2)·rk L | d ≥ 2 | Lemma 13′, Lean `Lemma13Prime` (allgemein für d = e + 2); mit s ≥ 0 Lemma 13 | 2 rk H ≥ 3ρ + 2s + rk L |
| B5 | ρ ≥ n − 1 | m ≥ n − 1 | Lemma 14, Lean `lemma14` (`d ≤ m`) | ρ ≥ 3 |
| B6 | rk L ≥ n − 1 | m ≥ 1 | Lemma 8′, Lean `lemma8'` | rk L ≥ 3 |
| B7 | rk L ≤ d·ρ | – | Lemma 15(a) | rk L ≤ 9 |
| B8 | rk L = d·ρ ⇒ ρ = m | n ≥ 3, K algebraisch abgeschlossen | Lemma 15(b), Lean `lemma15b` (`2 ≤ d`) | greift nicht |
| B9 | 0 ≤ ρ ≤ min(m, rk L), rk H ≤ dim U^{∧d} = d(d−1)/2·m, rk H ≤ d·rk L, 0 ≤ s ≤ min((d−1)(m−ρ), rk L) | – | triviale Schranken (siehe unten) | greifen nicht |

Zu B9: rk H ≤ d·rk L gilt, weil jede Komponente H(c)_i = L(c_{i,:}) in im L liegt. s ≤ rk L gilt, weil Σ F_j(ker F_1) ⊆ im L. s ≤ (d−1)(m−ρ) ist die Dimension des Urbilds. Die Schranken rk H ≤ d·rk L und s ≤ rk L stehen in Satz A nicht. Sie ändern die Probe nicht (Abschnitt 4), in Rolle n = 7 schneiden sie die Liste nach oben ab.

Zu B4: In `s2_444_spurA_r2.md` steht Lemma 13′ für d = 3 in der Form rk H ≥ 2ρ + s + ⌈(rk L − ρ)/2⌉. Die allgemeine Fassung rk H ≥ (d−1)ρ + s + ⌈(d−2)(rk L − ρ)/2⌉ ergibt sich mit demselben Beweis: Auf Γ (nur Zeile und Spalte 1 besetzt) ist dim H(Γ) = (d−1)ρ + s, und Lemma 11 mit d − 1 Abbildungen gibt 2 rk H̄ ≥ (d−2)(rk L − ρ). Verdoppelt ist das B4. Genau diese verdoppelte Form ist in `Lemma13Prime.lean` für allgemeines e = d − 2 formuliert (laut Kopfkommentar dort; den Lean-Beweis selbst habe ich nicht nachgeprüft).

Satz A benutzt B1 bis B7 (Schritte 1 bis 7 seines Beweises) und erwähnt B8 und die Obergrenzen aus B9 als „schließen nichts aus“ (Schritt 8). Lemma 13′ mit s kam in Satz A noch nicht vor, sondern erst in der Vorbereitung von Satz B. Mit s = 0 ist B4 die Bedingung aus Satz A. Das Programm listet deshalb die erlaubten s mit, ohne dass s die Liste der Tripel ändert (bei 4×2×4 nicht, siehe Probe).

### 2.2 Der Schritt zu Satz B (B-009)

Satz B schließt aus der Tabelle in Abschnitt 4 von `s2_444_spurA_r2.md`: s = 0 bedeutet N ≠ 0, dann gibt Lemma V Symmetrie, dann gibt Lemma S rk H = 8 bei rk L ∈ {4, 5}. Im Programm ist das als Filter `satzB` umgesetzt, **nur** für n = m = 4 und ρ = 3:

- s = 0 und rk L = 5 ⇒ rk H = 8
- s = 0 und rk L = 4 ⇒ rk H = 8 (für generisches u_0, wie im Beweis von Satz B)

Lemma V braucht dim U = n (die Abbildung φ : K^n → U muss invertierbar sein) und dim I(u, u′) = 2m − (m + ρ) = m − ρ = 1. Lemma S rechnet mit Quadriken in vier Variablen, also mit n = 4. Für 3×2×7 übertrage ich diesen Schritt deshalb nicht (Abschnitt 6).

### 2.3 Zusätzliche Bedingungen für n = 3 (Yang v3, Abschnitt 4.1)

Für n = 3 ist d = 2. Dann ist U^{∧2} ≅ U, und es gilt genau (nicht nur als Ungleichung):

- **C1:** rk H = m − dim N mit N = ker F_1 ∩ ker F_2 (`yang_n3.md`, Abschnitt 6), und nach dem Basiswechsel mit rk F_1 = ρ ist dim N = (m − ρ) − s, also **rk H = ρ + s**. Das ist B4 mit Gleichheit.
- **C2 (Lemma I):** Δ := 2 rk H − rk L ≥ min(2, dim N) (`yang_n3.md`, Abschnitt 8, Lemmata H und I).

Diese beiden Bedingungen gehören nicht zur Fallunterscheidung der Stufe 2, sondern zu Yangs Beweis für n = 3. Da die Schranke 34 für 3×2×7 aus genau diesem Beweis kommt, nehme ich sie dazu und weise beide Zählungen aus. Abgeleitete Größen für n = 3: dim N = m − rk H, Δ, und der Bereich von dim S aus Lemma H (dim S ≥ dim N − Δ) und Lemma B (S ≠ 0 ⇒ dim S + 2 ≤ dim N).

---

## 3. Das Programm

[`s3-04-restfaelle-327.py`](s3-04-restfaelle-327.py). Kern ist die Funktion `conditions(n, m, r, ρ, rkL, rkH, s)`: Sie prüft B1 bis B9, für n = 3 zusätzlich C1 und C2, auf Wunsch den Satz-B-Filter, und gibt den Namen der ersten verletzten Bedingung zurück. `residual(n, m, r)` zählt alle ganzzahligen (ρ, rk L, rk H, s) in den Bereichen 0 ≤ ρ ≤ m, 0 ≤ rk L ≤ q, 0 ≤ rk H ≤ dim U^{∧d}, 0 ≤ s ≤ (d−1)(m−ρ) vollständig ab. Es gibt keine Heuristik und keine Zufallszahlen. Ein Restfall ist ein Tripel (ρ, rk L, rk H), zu dem mindestens ein s alle Bedingungen erfüllt, wie die Paare in B-008.

Ausgabe des Laufs (gekürzt bei Rolle n = 7, die vollständige Liste erzeugt das Programm):

```
== Probe 1: <4,2,4>, r = 25 (expected B-008: rho=3, (3,6),(4,7),(5,7),(5,8)) ==
<4,2,4> r=25 q=5 d=3: 4 residual (rho,rkL,rkH) cases
  rho=3 rkL=3 rkH=6 s in [0]
  rho=3 rkL=4 rkH=7 s in [0]
  rho=3 rkL=5 rkH=7 s in [0]
  rho=3 rkL=5 rkH=8 s in [0, 1]
  -> matches B-008
== Probe 2: <4,2,4>, r = 25 with Satz B (expected B-009: (3,6),(5,8)) ==
<4,2,4> r=25 q=5 d=3 +SatzB: 2 residual (rho,rkL,rkH) cases
  rho=3 rkL=3 rkH=6 s in [0]
  rho=3 rkL=5 rkH=8 s in [0, 1]
  -> matches B-009
== Probe 3: smallest feasible r equals Yang's bounds ==
  <3,2,5>: smallest r with a residual case = 25, Yang = 25
  <3,2,6>: smallest r with a residual case = 30, Yang = 30
  <3,2,7>: smallest r with a residual case = 34, Yang = 34
  <4,2,4>: smallest r with a residual case = 25, Yang = 25
  <4,2,5>: smallest r with a residual case = 31, Yang = 31
  <5,2,5>: smallest r with a residual case = 37, Yang = 37
== Probe 4: data of real decompositions survive ==
  <4,2,4> r=26 (4, 6, 11, 0): ok
  <4,2,4> r=26 (4, 6, 10, 0): ok
  <4,2,4> r=26 (3, 6, 8, 0): ok
  <3,2,5> r=25 rkL=5 rkH=4: admissible (rho,s) = [(3, 1), (4, 0)]
  <3,2,6> r=30 rkL=6 rkH=6: admissible (rho,s) = [(4, 2), (5, 1), (6, 0)]

== Main: <3,2,7>, r = 34, role n=3 (A is 3x2, U has dim 7) ==
<3,2,7> r=34 q=6 d=2: 1 residual (rho,rkL,rkH) cases
  rho=4 rkL=6 rkH=4 s in [0]  dimN=3 Delta=2 dimS in [1]
   same role without the n=3 conditions of Yang Section 4.1:
  rho=3 rkL=5 rkH=3 s in [0]
  rho=4 rkL=6 rkH=4 s in [0]
== Main: <7,2,3>, r = 34, role n=7 (transposed, U has dim 3) ==
<7,2,3> r=34 q=10 d=6: 201 residual (rho,rkL,rkH) cases
  rho=2 rkL=6 rkH=18 s in [0]
  ...
  rho=3 rkL=10 rkH=45 s in [0]
   with s: 666 (rho,rkL,rkH,s) tuples
   smallest r with a residual case in role n=7, m=3: 30
   distinct (rho, rkL): [(2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10)]
```

---

## 4. Probe

1. **4×2×4, r = 25, Bedingungen B1 bis B9:** genau die vier Fälle aus B-008, alle mit ρ = 3. Die erlaubten s stimmen mit der Tabelle in `s2_444_spurA_r2.md` Abschnitt 4 überein (s = 0 in (3,6), (4,7), (5,7); s ≤ 1 in (5,8)). Das Programm bricht mit einem Fehler ab, wenn die Liste abweicht (`assert`).
2. **Mit dem Satz-B-Filter:** genau {(3,6), (5,8)} wie in B-009.
3. **Kleinste zulässige Länge:** Für 3×2×5, 3×2×6, 3×2×7, 4×2×4, 4×2×5 und 5×2×5 ist die kleinste Länge r, bei der überhaupt ein Restfall bleibt, genau Yangs Schranke (⌈(24m+2)/5⌉ für n = 3, (n+2)m + n − 3 für m ≥ n ≥ 4). Die Bedingungen reproduzieren also Yangs Sätze 1 und 2 als reine Zahlenrechnung. Für 3×2×7 ist 34 die kleinste zulässige Länge, und dort bleibt genau ein Fall.
4. **Echte Daten:** Die an echten Zerlegungen gemessenen Kenngrößen aus dem Repo verletzen keine Bedingung: drei Verfahren der Länge 26 für 4×2×4 (`s2_444_spurA_r2.md`, Abschnitt 9) und die Hopcroft-Kerr-Verfahren für 3×2×5 (r = 25) und 3×2×6 (r = 30) aus `yang_n3.md` Abschnitt 12 (dort ohne ρ und s, das Programm findet zulässige Werte). Das zeigt, dass meine Zusatzschranken aus B9 und die n = 3-Bedingungen an diesen Beispielen nicht zu scharf sind. Es ist kein Beweis ihrer Richtigkeit.

---

## 5. Die Restfälle für 3×2×7 bei Länge 34

### 5.1 Rolle n = 3, m = 7 (q = 6, d = 2)

Von Hand nachgerechnet, passend zur Programmausgabe:

- B2: 2·(34 − 35) = −2 ≥ rk H − rk L, also **rk H ≤ rk L − 2**. Die Grundungleichung hat hier negativen Spielraum, anders als bei 4×2×4.
- B1: rk L ≤ 6. Also rk H ≤ 4, dim N = 7 − rk H ≥ 3.
- C2: dim N ≥ 3 ≥ 2, also Δ ≥ 2, das heißt 2 rk H ≥ rk L + 2. Mit rk H ≤ rk L − 2: rk L − 2 ≥ (rk L + 2)/2, also rk L ≥ 6. Damit **rk L = 6, rk H = 4**.
- B4/C1: ρ ≤ rk H = 4. B7: 6 ≤ 2ρ, also ρ ≥ 3. B8: ρ = 3 gäbe rk L = 2ρ und damit ρ = m = 7, Widerspruch. Also **ρ = 4** und s = rk H − ρ = 0.

**Restfall:** (ρ, rk L, rk H) = (4, 6, 4), s = 0, dim N = 3, Δ = 2, dim S = 1. In diesem Fall gilt jede benutzte Ungleichung mit Gleichheit:

- rk L = q: im L = Q, analog zu Folgerung A2 also f_0(U) + f_1(U) + f_2(U) = ker W.
- Grundungleichung (G) mit Gleichheit (2m + rk H = 18 = rk L + 2q): Φ ist surjektiv auf im L × Q², analog zu Folgerung A1.
- Δ = 2 und dim S = dim N − Δ = 1: Lemma H mit Gleichheit, und Lemma B mit Gleichheit, also f_0(S) + f_1(S) + f_2(S) = f_0(N).
- s = 0 mit rk F_1 = ρ = 4: ker F_1 = N. Jede Kombination vom Rang 4 hat den Kern N, die F_i faktorisieren über U/N (Dimension 4) nach Q (Dimension 6).
- Yangs Schlussrechnung: 5r = 170 = 24m + 2, also Fall 1 seines Abschlusses mit Gleichheit.

Ohne C1 und C2 (nur die Stufe-2-Bedingungen B1 bis B9) bleibt zusätzlich **(3, 5, 3)** mit s = 0. Diesen Fall schließt Lemma I aus: dort ist dim N = 4 und Δ = 1 < 2.

### 5.2 Rolle n = 7, m = 3 (q = 10, d = 6)

- B5 (Lemma 14) greift nicht, weil m = 3 < n − 1 = 6.
- B6: rk L ≥ 6. B7 und B8: ρ = 1 hieße rk L ≤ 6, also rk L = 6 = dρ, und B8 verlangt dann ρ = m = 3. Also ρ ∈ {2, 3}.
- B2 gibt rk H ≤ rk L + 42 und schneidet nichts ab. Nach oben begrenzen nur rk H ≤ 6·rk L und rk H ≤ dim U^{∧6} = 45.
- Nach unten begrenzt B4: rk H ≥ 5ρ + s + 2(rk L − ρ) = 3ρ + 2 rk L + s.

Restfälle: 201 Tripel, 666 mit s. Übersicht nach (ρ, rk L), mit dem Bereich von rk H:

| ρ | rk L | rk H von bis | Anzahl Tripel | s |
|---|---|---|---|---|
| 2 | 6 | 18 bis 36 | 19 | 0 bis 5 (rk H ≥ 18 + s) |
| 2 | 7 | 20 bis 42 | 23 | 0 bis 5 |
| 2 | 8 | 22 bis 45 | 24 | 0 bis 5 |
| 2 | 9 | 24 bis 45 | 22 | 0 bis 5 |
| 2 | 10 | 26 bis 45 | 20 | 0 bis 5 |
| 3 | 6 | 21 bis 36 | 16 | 0 |
| 3 | 7 | 23 bis 42 | 20 | 0 |
| 3 | 8 | 25 bis 45 | 21 | 0 |
| 3 | 9 | 27 bis 45 | 19 | 0 |
| 3 | 10 | 29 bis 45 | 17 | 0 |

Die kleinste Länge, bei der in dieser Rolle ein Restfall bleibt, ist 30 (bei r = 30 noch 11 Tripel). Die Rolle n = 7 liegt damit unter der Schranke 34 und gibt über Länge 34 keine nutzbare Auskunft. Das passt dazu, dass Yangs Satz 2 m ≥ n verlangt.

### 5.3 Beide Rollen zusammen

Eine Zerlegung von ⟨3,2,7⟩ der Länge 34 gibt durch A·B = (BᵀAᵀ)ᵀ eine Zerlegung von ⟨7,2,3⟩ der Länge 34. Für sie gelten beide Analysen. Ich kenne keine Bedingung, die die Kenngrößen beider Rollen verbindet. Die Restliste für das Paar ist daher 1 × 201. Praktisch heißt das: Die Fallunterscheidung lässt in Rolle n = 3 einen einzigen, ganz starren Fall übrig, und Rolle n = 7 fügt nichts hinzu.

Zum Vergleich, was eine Länge mehr ausmacht: Bei r = 35 bleiben in Rolle n = 3 schon 26 Tripel, in Rolle n = 7 234.

---

## 6. Übernommene Annahmen und Unsicherheiten der Übertragung

Übernommen (ohne eigene Prüfung, Stand wie in den genannten Dateien):

- Yangs Normalform und die Lemmata 4.1, 8′, 10/(2), 11, 13, 14, 15(a), 15(b) für allgemeines n, m. Die Lean-Sätze dazu (`ineq1`, `lemma8'`, `lemma14`, `lemma15b` in `YangN4Haupt.lean`) sind allgemein in d und m formuliert. Für n = 3 ist d = 2, das ist von `lemma15b` (`2 ≤ d`) gedeckt.
- Lemma 13′ für allgemeines d (B4) nach dem Kopfkommentar von `Lemma13Prime.lean`.
- Yangs Lemmata G, H, I für n = 3 aus `yang_n3.md` (Lean-Fassung in `YangN3*.lean`, nicht von mir nachgesehen).

Unsicher an der Übertragung:

1. **Satz B überträgt sich nicht.** Lemma V braucht eine invertierbare Abbildung K^n → U, also n = m, und einen eindimensionalen Raum I(u, u′), also m − ρ = 1. Im Restfall der Rolle n = 3 ist n = 3 ≠ 7 = m und m − ρ = 3. Lemma S rechnet mit Quadriken in vier Variablen. Ob es für den Restfall (4, 6, 4) ein Gegenstück gibt (etwa: der gemeinsame Kern N mit dim N = 3 erzwingt eine Symmetrie), habe ich nicht untersucht. Das wäre ein Beweisangriff und gehört nicht in Stufe 3.
2. **C1 und C2 gehören nicht zur Stufe-2-Fallunterscheidung.** Sie stammen aus Yangs Beweis für n = 3. Ohne sie sind es zwei Restfälle statt einem. Welche Zählung der Orchestrator als „Fallunterscheidung aus Stufe 2“ ansieht, ist eine Lesart. Beide Zahlen stehen oben.
3. **Zusätzliche triviale Schranken.** rk H ≤ d·rk L und s ≤ rk L stehen nicht in Satz A. Ich halte sie für offensichtlich richtig (Begründung in 2.1). In Rolle n = 3 ändern sie nichts. In Rolle n = 7 bestimmen sie die obere Grenze von rk H und damit die Zahl 201. Ohne sie wäre die Zahl größer, an der Aussage „Rolle n = 7 trägt nichts“ ändert das nichts.
4. **Abhängigkeit von der Wahl von p und u_0.** Wie Satz A gilt jede Bedingung für jedes zulässige u_0. Verschiedene zulässige Wahlen könnten bei derselben Zerlegung in verschiedenen Restfällen landen. In Rolle n = 3 gibt es nur einen Fall, da spielt das keine Rolle. In Rolle n = 7 ist die Zahl 201 eine Obergrenze für die Fälle einer Wahl, keine Aussage über eine feste Zerlegung.
5. **Die Rollen sind nicht vertauschbar.** Rolle n = 3 benutzt Yangs Beweis für n = 3 und Lemma 14 (m ≥ n − 1). Rolle n = 7 hat kein Lemma 14 und liegt unter der Schranke. Die Zahlen der beiden Rollen sind deshalb nicht vergleichbar wie bei 4×2×4, wo beide Rollen dasselbe Format sind.
6. **Ganzzahligkeit.** Alle Größen sind Dimensionen, also ganze Zahlen ≥ 0. Das Programm rechnet nur mit ganzen Zahlen. Rundungen (Lemma 13′ mit Aufrunden) sind durch die verdoppelte Form ersetzt, die gleichwertig ist.
7. **Kein Prüfer hat Programm oder Herleitung gesehen.** Die zweite, unabhängige Rechnung nach Protokoll Abschnitt 3 macht ein anderer Thread.

---

## 7. Rechenaufwand

Ein Lauf des Programms unter 1 Sekunde auf einem Kern. Keine weiteren Rechnungen, nichts läuft im Hintergrund.
