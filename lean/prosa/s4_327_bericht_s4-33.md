# S4-33: Prüfbericht zu B-029 (Aussagen S4-27-B, S4-27-C, S4-27-D)

Rolle: Prüfer nach Protokoll Abschnitt 5. Gegenstand: `behauptungen/B-029.md` und die Beweise in `lean/prosa/s4_327_spurA_r5_m21.md` (Stand 6f65290). Dieser Bericht setzt keinen Status.

---

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet** (vor und während der Arbeit, ohne mein Zutun):

- Der Index `MEMORY.md` des Projektgedächtnisses. Er nennt Ziel, Regeln und Arbeitsweise des Projekts (Stufe 4, Budget 6 Runden, Rollen, Fremdmodell, Literaturwache, Regeln für Prüferaufträge). Er nennt **keine** Behauptung, kein Prüfurteil und keinen Status zu B-029, B-030 oder B-026.
- Die Einzeleinträge `gemini-bridge`, `aussagen-abgleich-n3`, `lean-upper-3x2x6` und `hk-verfahren-a10`. Sie betreffen die Fremdmodell-Bridge, den lokalen Lean-Bau, die obere Schranke für 3×2×6 und Verfahrensdateien für 3×2×5 und 3×2×6. Nichts davon betrifft B-029.

**Weitere Spuren:**

- `git log` (drei Zeilen, beim Start zur Orientierung) zeigte die Commit-Betreffe „Vor Runde 6: Gedächtnisdurchsicht“ und „Runde 5 abgeschlossen: S4-29 eingetragen, B-031 angelegt, Zähler Spur A 2 von 3, Budget 5 von 6“. Darin steht kein Urteil zu B-029; es ist aber ein Zählerstand. Ich lege es offen.
- `behauptungen/B-029.md` nennt den Dateinamen `pruefvermerke/B-029.md`. Die Datei habe ich nicht geöffnet.
- Der Auftrag sagt, dass ein zweiter Prüfer unabhängig an derselben Behauptung arbeitet. Ein erwünschtes Ergebnis nennt er nicht.
- **Lesefehler:** Von `lean/prosa/s4_327_spurA_r4_m21.md`, Abschnitt 1, sollte ich nur die Vorbemerkung und die Aussagen A und B lesen. Ich habe den Abschnitt in einem Zug ausgegeben und dabei auch die Aussagen S4-21-C, -D, -E, die Vermutung S4-21-V, ihre Folgerung und die Lücke L-21 gesehen. Darin steht kein Prüfurteil. Für mein Urteil benutze ich daraus nichts; nur in Abschnitt 5 unten (zweiter Satz von S4-27-D) erwähne ich, dass B-029 selbst sagt, S4-21-V bleibe vermutet.
- Gelesen habe ich sonst nur die Dateien und Abschnitte der Positivliste. Die Prüfsumme der Quelle stimmt mit B-029 überein: `sha256sum lean/prosa/s4_327_spurA_r5_m21.md` = c4838c5e9e9b82eda119f11945159bf0510f0fee205b7a8d5af4ee8e89b36f6f.

---

## 1. Urteile im Überblick

| Aussage | Urteil |
|---|---|
| S4-27-B (Festlegung von κ auf Y) | **bestätigt**, unter den Voraussetzungen aus B-029 (Abschnitt 2 der Quelle). Der Beweis braucht einige Tatsachen aus S4-07 und Satz R, die die Quelle in ihren „nur“-Listen nicht nennt, die aber in den genannten Grundlagen stehen (Abschnitt 6). |
| S4-27-C (lokaler Widerspruch), beide Sätze | **bestätigt**, unter denselben Voraussetzungen. Wortlaut „aus (B) und (C) allein“: richtig nur in der Lesart „von den Brent-Gruppen nur (B) und (C)“ (Abschnitt 4.4). |
| S4-27-D, erster Satz (kein Verfahren der Länge 34 mit e = 3) | **bestätigt, bedingt** auf die Grundlagen in Abschnitt 2 der Quelle, wie die Aussage selbst sagt. |
| S4-27-D, zweiter Satz („Gleichwertig: Die Lücke L-21 … ist geschlossen, ohne S4-21-V zu benutzen“) | **bestätigt in der Lesart** „der Fall e = 3, also auch der Unterfall (M21), ist ausgeschlossen, und S4-21-V wird dafür nicht gebraucht“. Als wörtliche Gleichwertigkeit **nicht bestätigt**: S4-21-V selbst wird nicht bewiesen (Abschnitt 5). |
| Körperangabe in Abschnitt 2 der Quelle (Abschnitte 5 bis 7 gelten in jeder Charakteristik) | **bestätigt** (Abschnitt 7). |

---

## 2. Rahmen und Bezeichnungen

Ich habe die Bezeichnungen aus Abschnitt 3 der Quelle mit S4-07 (Abschnitte 1 bis 4), S4-14 (Abschnitte 1 bis 4), S4-21 (Abschnitte 2, 3 und 5) und `yang_n3.md` (Abschnitte 3 bis 5) abgeglichen. Sie stimmen überein:

- a_0 = 1, a_i, b_i Spalten der α_t, c_i = b_i − a_i·b_0 (S4-07, 1.2).
- J = span(q_1, …, q_7) mit dim J = 7 (G4), π(q_k) = p_k wohldefiniert, κ(j) := π(j) − b_0·j. Dass κ(j) ∈ K′ liegt, ist (C) mit i = 0 (S4-07, Abschnitt 2).
- M_p := e_p·K″ und d_p := dim M_p wie in S4-21, Abschnitt 3. Unter (M21) ist das dasselbe wie span(w|_{T_p}, u|_{T_p}) aus S4-14-C, weil Polynome auf T_p als Skalare wirken.
- Y ist eine Vereinigung von Fasern: Nach (G4) ist jede Faser über einem a-Punkt von Z einpunktig, also besteht jede andere Faser nur aus Indizes in Y. Damit sind „Fasern über a-Punkten von Y“ und K″|_Y = ⊕_{p⊆Y} M_p sinnvoll.

**Fortsetzungsabbildung (Abschnitt 3 der Quelle).** Die Einschränkung K′ → K″|_Y ist injektiv, denn ihr Kern ist K′ ∩ K^Z = 0 (G3). dim K′ = 13 (Restfall, (V2)). dim K″|_Y = 21 − 8 = 13: K″ = ⊕_p M_p mit dim 21 (Satz R), und für z ∈ Z ist M_{p(z)} = K^{{z}} (aus K^Z ⊆ K″ nach (G3) und |T_{p(z)}| = 1 nach (G4)). Dieselbe Zahl steht in Satz G (ii) als Σ_{p⊆Y} d_p = 13. Also ist E wohldefiniert, φ_z linear und x(z) = φ_z(x|_Y) für x ∈ K′. **Bestätigt.**

Hinweis: Für S4-27-C genügt schon die Injektivität (G3). Man kann φ_z auf dem Bild K′|_Y erklären und beliebig linear auf K″|_Y fortsetzen; alle Gleichungen in Abschnitt 6 der Quelle benutzen φ_z(x|_Y) = x(z) nur für x ∈ K′ und sonst nur die Linearität.

---

## 3. S4-27-B (Abschnitt 5 der Quelle)

Ich bin jeden Schritt einzeln durchgegangen.

1. **K^{T_p} = M_p ⊕ b_0·M_p.** Aus K^34 = K″ + b_0·K′ (S4-07, 3.2 und 4.1; ebenso Satz R, Schritt 1) folgt durch Multiplikation mit e_p: K^{T_p} = e_p·K″ + b_0·e_p·K′. Weil K″ ein A-Modul ist ((M21) in Satz G (ii), Satz R), ist e_p·K′ ⊆ e_p·K″ = M_p ⊆ K^{T_p}, also K^{T_p} = M_p + b_0·M_p. Mit |T_p| = 2·d_p (G2) und dim(M_p + b_0·M_p) ≤ 2·d_p folgt: die Summe ist direkt und b_0· ist auf M_p injektiv. **Richtig.** Die Quelle verweist hier auf S4-21, 5.4, also auf den Beweis von Satz G, nicht auf seine Aussage. Das ist nicht nötig: Der Schritt folgt, wie eben gezeigt, aus S4-07, 4.1, Satz R und (G2).
2. **B_p, N_p.** b_0²·m ∈ K^{T_p} hat eine eindeutige Zerlegung b_0·m′ + m″; m′ ist eindeutig wegen der Injektivität. Linearität und Eindeutigkeit der Abbildungen folgen. **Richtig.**
3. **(i) und (ii).** j ∈ J ⊆ K′ ⊆ K″ und κ(j) ∈ K′, also j_p, κ_p ∈ M_p. (B) mit i = 0 gibt b_0·π(j) ∈ K′, also e_p·b_0·π(j) ∈ M_p. Einsetzen von π(j) = b_0·j + κ(j): e_p·b_0·π(j) = b_0·(B_pj_p + κ_p) − N_pj_p. Damit liegt b_0·(B_pj_p + κ_p) in M_p ∩ b_0·M_p = 0, und wegen der Injektivität ist κ_p = −B_pj_p; dann e_p·b_0·π(j) = −N_pj_p. Summiert über p ⊆ Y: (i) und (ii). **Richtig.**
4. **Vertauschbarkeit.** g ∈ A wirkt auf M_p als Skalar g(p). **Richtig.**

Urteil: **bestätigt.**

---

## 4. S4-27-C (Abschnitt 6 der Quelle)

### 4.1 Die drei Gleichungsgruppen

Ich habe jede Herleitung nachgerechnet.

- **(P_i).** (C′) folgt aus (C): a_i·p_k − b_i·q_k = a_i·κ_k − c_i·q_k (S4-07, Abschnitt 2; nachgerechnet). x := c_i·j − a_i·κ(j) ∈ K′. Auf Y: c_i = 0 (G1), κ(j)|_Y = −B·j_Y (S4-27-B (i)), also x|_Y = a_i·B·j_Y. An z: x(z) = c_i(z)·φ(j_Y) + z_i·φ(B·j_Y). Gleichsetzen und Linearität von φ geben (P_i). **Richtig.**
- **(Q_0).** x := b_0·π(j) ∈ K′ nach (B), x|_Y = −N·j_Y (S4-27-B (ii)), x(z) = β_z·φ((β_z − B)·j_Y). **Richtig.**
- **(Q_i).** x := b_i·π(j) ∈ K′ nach (B) mit i = 1, 2; b_i = c_i + a_i·b_0; x|_Y = −a_i·N·j_Y; x(z) = (c_i(z) + z_iβ_z)·φ((β_z − B)·j_Y). Mit (Q_0) für den Term z_iβ_z·φ((β_z − B)·j_Y) = −z_i·φ(N·j_Y) folgt (Q_i). **Richtig.**

### 4.2 Richtung, Einsetzen, vier Werte

- e mit e_1c_1(z) + e_2c_2(z) = 1 gibt es, weil c(z) ≠ 0. L ∈ P_1, L(z) = 0. Die Kombinationen (P) und (Q) sind richtig gebildet.
- j = w·G mit G ∈ P_2 liegt in J (w·P_2 ⊆ J). (w·G)|_Y = G·ω liegt in K″|_Y (A-Modul). Für deg g ≤ 3 ist w·g ∈ K′ (w·P_3 ⊆ K′), also m(g) = w(z)·g(z). B und N vertauschen mit Polynomen (S4-27-B), daher φ(L·B·G·ω) = β(L·G) und φ(L·N·G·ω) = n(L·G). (P′), (Q′), (Q_0′) sind richtig.
- Die vier Werte: G = L in (P′) gibt β(L²) = 0; G = L² (Grad 2, zulässig) in (Q_0′) gibt n(L²) = 0; G = L in (Q′) gibt β(L) = 0; G = 1 in (P′) gibt β(L) = w(z). Also w(z) = 0. **Richtig.**

### 4.3 Eigene Rechnung dazu

Ich habe den letzten Schritt unabhängig nachgerechnet, und zwar in einer **schwächeren** Form: β und n sind beliebige Linearformen auf P_3 (je 10 Unbekannte), dazu die Unbekannte W = w(z). Gefordert sind nur (P_i), (Q_i) (i = 1, 2) und (Q_0) nach dem Einsetzen j = w·G für alle G ∈ P_2, mit m(g) = W·g(z). Geprüft wird, ob jede Lösung W = 0 hat. Programm `lokal.py` und `exh.py` im Anhang, exakt modulo einer Primzahl.

- Für p ∈ {2, 3, 5} habe ich **alle** Parameter (z, c(z) ≠ 0, β_z) durchlaufen (24, 216 und 3 000 Fälle): in jedem Fall ist W = 0 erzwungen.
- Für p ∈ {2, 3, 5, 7, 10007, 32003, 1000003} je 300 Zufallsfälle (Startwert 1): W = 0 stets erzwungen.
- Gegenprobe: Lässt man eine der drei Gruppen (P), (Q), (Q_0) weg, ist W in allen 2 100 Zufallsfällen frei. Das bestätigt die Bemerkung am Ende von Abschnitt 6 der Quelle, dass jede Gruppe gebraucht wird.

Das ist keine Prüfung des Beweises, sondern eine zusätzliche Bestätigung des rein linearen Kerns, und zwar in jeder getesteten Charakteristik.

### 4.4 Zum Wortlaut

- „Genauer: Für jedes z ∈ Z mit (c_1(z), c_2(z)) ≠ (0, 0) folgt aus (B) und (C) allein w(z) = 0.“ Benutzt werden außer (B) und (C) auch: (G1), (G2) (über S4-27-B), (G3) (über φ_z), w·P_2 ⊆ J, w·P_3 ⊆ K′, K^34 = K″ + b_0·K′ und die A-Modul-Eigenschaft von K″. (G4) wird für diesen Satz nicht benutzt. „Allein“ stimmt also nur in der Lesart „von den vier Brent-Gruppen nur (B) und (C), dazu die Normalform“. In dieser Lesart **bestätigt**.
- Der erste Satz („Es gibt keinen Index z ∈ Z mit w(z) ≠ 0 und c(z) ≠ (0, 0)“) folgt unmittelbar aus dem zweiten. **Bestätigt.** Weil eine Normalform wie in S4-21-B (ii) nach (G4) auf jedem z ∈ Z w(z) ≠ 0 und c(z) ≠ 0 hat, heißt der erste Satz zusammen mit (G4): Eine solche Normalform gibt es nicht. Das ist genau der Inhalt von S4-27-D.

Urteil: **bestätigt.**

---

## 5. S4-27-D (Abschnitt 7 der Quelle)

**Erster Satz.** Gibt es ein Verfahren der Länge 34 über F und eine Normalform mit e = 3, dann liefert Satz G (ii) (vorausgesetzt) eine nicht leere, dichte offene Menge von (S, T) und damit eine Normalform mit (G1) bis (G4). Diese Normalform ist selbst ein Verfahren (R1, R3 und die Skalierung erhalten die Verfahrensidentität; S4-07, 1.1, und `yang_n3.md`, R1, R3), also gelten dort (B) und (C). Z hat 8 Elemente, ist also nicht leer. Für z ∈ Z gilt nach (G4) w(z) ≠ 0 und c(z) ≠ 0, im Widerspruch zu S4-27-C. **Richtig.** Die Bedingung „bedingt auf die Grundlagen in Abschnitt 2“ steht in der Aussage selbst.

Zu „über irgendeinem Körper F“ und „in irgendeiner Normalform“ siehe Abschnitt 7.

**Zweiter Satz („Gleichwertig: Die Lücke L-21 aus S4-21 (und damit der Unterfall (M21) aus S4-14) ist geschlossen, ohne Vermutung S4-21-V zu benutzen“).**
- Richtig ist: Der Beweis benutzt S4-21-V nicht. Der Unterfall (M21) ist ein Teilfall von e = 3 und damit mit ausgeschlossen.
- Nicht richtig in wörtlicher Lesart ist „gleichwertig“: S4-21-V ist eine Aussage über das System (C′) ohne (B), und B-029 sagt selbst, dass S4-21-V vermutet bleibt. S4-27-D beweist S4-21-V nicht. „Geschlossen“ heißt hier also: Der Fall, für den die Lücke stand, ist auf anderem Weg erledigt.

Urteil: erster Satz **bestätigt (bedingt)**; zweiter Satz **bestätigt in der Lesart „Fall erledigt ohne S4-21-V“**, als Gleichwertigkeit mit einem Beweis von S4-21-V **nicht bestätigt** (Stelle: das Wort „Gleichwertig“ in S4-27-D).

---

## 6. Benutzte Voraussetzungen, und ob der Beweis mehr braucht als wörtlich steht

Als Voraussetzung ohne eigene Prüfung benutzt habe ich (wie im Auftrag erlaubt):

- **B-030:** Satz G (S4-21-B), Teil (ii), und zwar (G1) bis (G4) sowie aus dem Wortlaut von (ii) „e = 3 und (M21)“ und „Σ_{p⊆Y} d_p = 13“. Lemma O und Lemma F nur, soweit Satz G sie braucht; S4-27 benutzt sie nicht direkt.
- **B-026:** Satz R (S4-14-A): K″ ist A-Modul, dim K″ = 21, K^34 = K″ ⊕ b_0·K′.
- **Ältere Dateien:** S4-07, Abschnitte 1, 2, 3.1, 3.2 und 4.1 (Normalform, Skalierung, (A) bis (D), (C′), w·P_2 ⊆ J, K^34 = K″ + b_0·K′, w·P_3 ⊆ K′, dim K′ = 13); `yang_n3.md` R1, R3, G4.

**Braucht der Beweis mehr, als in Abschnitt 2 der Quelle wörtlich steht?** Mathematisch nein: Alles Benutzte steht in den dort genannten Grundlagen. Die Listen „Benutzt werden davon nur …“ und „Benutzt werden aus S4-21-B (ii) genau …“ sind aber **zu eng**:

1. Aus S4-07 nennt die Liste nur „w·P_2 ⊆ J, w·P_3 ⊆ K′, (B), (C) und (C′)“. Gebraucht werden zusätzlich **K^34 = K″ + b_0·K′** (S4-07, 3.2 und 4.1) in S4-27-B, **dim K′ = 13** (Restfall/(V2)) für E, und **dim J = 7** (G4) für die Wohldefiniertheit von π.
2. Aus Satz G (ii) nennt die Liste nur (G1) bis (G4). Gebraucht werden zusätzlich **(M21), also K″ ist A-Modul** (steht im Wortlaut von Satz G (ii) und in Satz R), und für die Bijektivität von E **Σ_{p⊆Y} d_p = 13** (steht im Wortlaut von Satz G (ii); folgt auch aus (G3), (G4) und dim K″ = 21).
3. „Satz R wird hier nur über Satz G benutzt“: Für die A-Modul-Eigenschaft und K^34 = K″ ⊕ b_0·K′ benutzt S4-27-B Satz R und S4-07, 4.1, faktisch direkt. Da beide in der Liste stehen, ist das keine neue Voraussetzung.
4. S4-27-B beruft sich auf S4-21, Abschnitt 5.4, also auf einen Schritt **im Beweis** von Satz G, nicht auf seine Aussage. Der dort benutzte Schluss folgt auch direkt aus S4-07, 4.1, Satz R und (G2) (Abschnitt 3, Schritt 1). Der Beweis hängt also nicht an Inhalten von S4-21, die nicht in der Aussage von Satz G stehen.

Keiner dieser Punkte ist eine Lücke. Sie sollten aber in einer Abhängigkeitsliste stehen.

---

## 7. Quantoren

- **Welche Verfahren:** Verfahren der Länge 34 für ⟨3,2,7⟩. Die Normalform setzt voraus, dass beim Übergang zum algebraischen Abschluss und beim Streichen von Nullformen (R2) die Länge 34 bleibt; das ist Teil von S4-07, 1.1 (untere Schranke 34) und gehört zu den übernommenen Grundlagen.
- **Welche Normalformen:** S4-27-B und S4-27-C gelten für jede Normalform, in der die Gestalt aus S4-21-B (ii) gilt; benutzt werden nur die Eigenschaften, nicht die Dichtheit der Menge. S4-27-D setzt „irgendeine Normalform mit e = 3“ voraus; das ist genau die Voraussetzung von Satz G. Der Begriff „Normalform“ ist der aus der Vorbemerkung von S4-21 (algebraischer Abschluss, R3 mit (S, T) ∈ G*, Skalierung). e ist wohldefiniert, weil w bis auf einen Faktor festliegt (dim S = 1).
- **Welcher Körper:** Die Schritte in den Abschnitten 5 bis 7 der Quelle sind lineare Algebra über K. Die einzige Division ist die durch einen Körperwert (Wahl von e mit e·c(z) = 1, Inverse von b_0· auf M_p). Keine Division durch ganze Zahlen. Meine Rechnung (Abschnitt 4.3) bestätigt den linearen Kern auch in Charakteristik 2, 3 und 5 vollständig. Die Aussage „für jeden Körper F“ ist daher richtig **bedingt**: soweit Restfall, S4-07, Satz R und Satz G für jeden Körper gelten. So steht es in der Quelle.

---

## 8. Ergebnis

S4-27-B und S4-27-C sind bestätigt. Der erste Satz von S4-27-D ist bestätigt, bedingt auf die Grundlagen, die B-029 nennt. Der zweite Satz von S4-27-D ist nur in der Lesart „Fall e = 3 erledigt, ohne S4-21-V zu benutzen“ bestätigt, nicht als Gleichwertigkeit mit S4-21-V. Die Listen der benutzten Voraussetzungen sind zu eng (Abschnitt 6), ohne dass eine Voraussetzung außerhalb der genannten Grundlagen nötig wäre.

---

## 9. Verbrauch

- Keine Subagenten, keine Fremdmodell-Anfragen.
- Rechnung: zwei Programmläufe, zusammen unter 10 Sekunden auf einem Kern.
- Zeiten: siehe Git-Zeitstempel dieses Commits.

---

## Anhang: Programme (Python 3, ohne Zusatzpakete, exakt modulo einer Primzahl, keine Gleitkommazahlen)

Aufruf: `python3 -I lokal.py 1 300`, dann `python3 exh.py` im selben Verzeichnis.

SHA-256: `lokal.py` 1d5f2bf53bf9deec11d3a9c584d1578148d8009ff8cf4401b4ee349e4a55d52c, `exh.py` a94cb8b4f7b4b17e7352cbbbd75d461f0688b27d19aaa58f5fc407928515d74a.

### lokal.py

```python
# S4-33: independent check of the final linear-algebra step of S4-27-C.
# Unknowns: linear functionals beta(g), n(g) on P_3 (monomial coordinates) and W = w(z).
# Equations for G in P_2 (from (P_i), (Q_i), (Q_0) after substituting j = w*G):
#   (P_i)  c_i(z) W G(z) = beta((a_i - z_i) G)
#   (Q_i)  c_i(z) (beta_z W G(z) - beta(G)) + n((a_i - z_i) G) = 0
#   (Q_0)  beta_z^2 W G(z) - beta_z beta(G) + n(G) = 0
# Claim: whenever c(z) != 0, every solution has W = 0. Exact arithmetic mod a prime.
import random, sys

def mons(d):
    return [(i, k - i) for k in range(d + 1) for i in range(k + 1)]

M3 = mons(3); M2 = mons(2)
idx = {m: t for t, m in enumerate(M3)}
NB = len(M3)  # 10

def rank(rows, p):
    rows = [r[:] for r in rows]; r = 0; ncol = len(rows[0]) if rows else 0
    for c in range(ncol):
        piv = next((i for i in range(r, len(rows)) if rows[i][c] % p), None)
        if piv is None: continue
        rows[r], rows[piv] = rows[piv], rows[r]
        inv = pow(rows[r][c], p - 2, p)
        rows[r] = [x * inv % p for x in rows[r]]
        for i in range(len(rows)):
            if i != r and rows[i][c] % p:
                f = rows[i][c]; rows[i] = [(x - f * y) % p for x, y in zip(rows[i], rows[r])]
        r += 1
    return r

def polymul_lin(G, i, zi):
    # (a_i - z_i) * monomial G, as dict monomial->coef
    out = {}
    sh = (G[0] + 1, G[1]) if i == 1 else (G[0], G[1] + 1)
    out[sh] = out.get(sh, 0) + 1
    out[G] = out.get(G, 0) - zi
    return out

def ev(G, z, p):
    return pow(z[0], G[0], p) * pow(z[1], G[1], p) % p

# column layout: beta[0..9], n[10..19], W at 20
def build(p, z, c, bz, groups):
    rows = []
    for G in M2:
        Gz = ev(G, z, p)
        for i in (1, 2):
            ci = c[i - 1]; zi = z[i - 1]
            lin = polymul_lin(G, i, zi)
            if 'P' in groups:
                r = [0] * (2 * NB + 1)
                for m, a in lin.items(): r[idx[m]] = (r[idx[m]] - a) % p
                r[20] = ci * Gz % p
                rows.append(r)
            if 'Q' in groups:
                r = [0] * (2 * NB + 1)
                r[20] = ci * bz * Gz % p
                r[idx[G]] = (r[idx[G]] - ci) % p
                for m, a in lin.items(): r[NB + idx[m]] = (r[NB + idx[m]] + a) % p
                rows.append(r)
        if 'Q0' in groups:
            r = [0] * (2 * NB + 1)
            r[20] = bz * bz * Gz % p
            r[idx[G]] = (r[idx[G]] - bz) % p
            r[NB + idx[G]] = (r[NB + idx[G]] + 1) % p
            rows.append(r)
    return rows

def W_forced(rows, p):
    full = rank(rows, p)
    red = rank([r[:20] for r in rows], p)
    return full == red + 1  # W column independent of the others -> W = 0 on all solutions

def run(seed, trials):
    rnd = random.Random(seed)
    stats = {}
    for p in [2, 3, 5, 7, 32003, 10007, 1000003]:
        for _ in range(trials):
            z = (rnd.randrange(p), rnd.randrange(p))
            while True:
                c = (rnd.randrange(p), rnd.randrange(p))
                if c != (0, 0): break
            bz = rnd.randrange(p)
            res = {}
            for g in (('P', 'Q', 'Q0'), ('Q', 'Q0'), ('P', 'Q0'), ('P', 'Q')):
                res[g] = W_forced(build(p, z, c, bz, g), p)
            key = (p, tuple(res[g] for g in res))
            stats[key] = stats.get(key, 0) + 1
    return stats

if __name__ == '__main__':
    seed = int(sys.argv[1]); trials = int(sys.argv[2])
    for k, v in sorted(run(seed, trials).items()):
        print(k, v)
    print('columns: all three groups, without P, without Q, without Q0')
```

Ausgabe (`python3 -I lokal.py 1 300`), Spalten: alle drei Gruppen, ohne P, ohne Q, ohne Q0; True heißt W = 0 erzwungen:

```
(2, (True, False, False, False)) 300
(3, (True, False, False, False)) 300
(5, (True, False, False, False)) 300
(7, (True, False, False, False)) 300
(10007, (True, False, False, False)) 300
(32003, (True, False, False, False)) 300
(1000003, (True, False, False, False)) 300
```

### exh.py

```python
# exhaustive over all (z, c != 0, beta_z) for small primes
import sys, itertools
sys.path.insert(0, '.')
from lokal import build, W_forced
for p in (2, 3, 5):
    bad = 0; tot = 0
    for z1, z2, c1, c2, bz in itertools.product(range(p), repeat=5):
        if (c1, c2) == (0, 0): continue
        tot += 1
        if not W_forced(build(p, (z1, z2), (c1, c2), bz, ('P', 'Q', 'Q0')), p): bad += 1
    print(p, 'cases', tot, 'not forced', bad)
```

Ausgabe:

```
2 cases 24 not forced 0
3 cases 216 not forced 0
5 cases 3000 not forced 0
```
