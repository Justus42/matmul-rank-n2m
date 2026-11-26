# S4-35: Rang von ⟨3,2,7⟩, unabhängiger Sucher (nicht blind), Runde 6

Auftrag S4-35 vom Orchestrator, 26.11.2026. Frage: Tensorrang R(⟨3,2,7⟩) der Multiplikation einer 3×2- mit einer 2×7-Matrix.

Statuswörter nach CLAUDE.md Regel 6. Den Status setzt der Orchestrator; alles hier ist höchstens **behauptet**. Wo ich „nachgerechnet“ schreibe, heißt das: von einem Programm exakt (ganzzahlig) geprüft, Programm und Daten stehen hier. Wo ich „nachvollzogen“ schreibe, heißt das: ich habe jeden Schritt eines fremden Beweises selbst durchgerechnet; ein Prüfvermerk nach Protokoll Abschnitt 5 fehlt.

## 0. Offenlegung: was mir eingeblendet war und was ich davon benutzt habe

**Projektgedächtnis.** Eingeblendet waren der Index `MEMORY.md` und fünf Einzeleinträge (`hk-verfahren-a10`, `lean-upper-3x2x6`, `gemini-bridge`, `git-regeln`, `verfahren-datenformat`). Inhaltlich relevant daraus:

- Der Index nennt das Projektziel („exakter Tensorrang von ⟨n,2,m⟩ (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6)“) und als Ziele der Literaturwache die arXiv-Nummern 2609.14393 und 2609.22054 sowie die FMM-Lille-Seite zu 2×3×7. Inhalte dieser Arbeiten standen nicht im Gedächtnis.
- `hk-verfahren-a10` sagt, dass Hopcroft-Kerr-Verfahren für 3×2×5 mit 25 und 3×2×6 mit 30 Produkten im Repo liegen. `lean-upper-3x2x6` nennt eine Lean-Datei für R(3×2×6) ≤ 30.
- Die übrigen Einträge betreffen Arbeitsabläufe (Git-Regeln, Datenformat, Fremdmodell-Brücke).

Benutzt habe ich: nichts davon für die Mathematik oder die Rechnung. Das Verfahren mit 35 Produkten habe ich selbst mit einer Flip-Graph-Suche gefunden, ohne Dateien aus `verfahren/` oder `lean/`. **Einschränkung der Unabhängigkeit:** Die Arbeit arXiv:2609.22054, auf der meine untere Schranke beruht, habe ich über eine öffentliche Websuche gefunden (Suchbegriffe unten in Abschnitt 5). Ich kannte ihre Nummer aber schon aus dem eingeblendeten Index. Ich kann nicht ausschließen, dass mich das bei der Auswahl beeinflusst hat.

**Weitere Berührungen mit Projektinhalten.**

- Eine Websuche (Abschnitt 5, Suche 6) lieferte als Treffer die GitHub-Seite dieses Repos. Die Zusammenfassung des Suchwerkzeugs gab daraus wieder: ⟨3,2,6⟩ sei bei 30 erledigt, ⟨3,2,7⟩ offen mit unterer Schranke 34 und oberer 35. Die Seite selbst habe ich nicht geöffnet. Zu diesem Zeitpunkt hatte ich 34 ≤ R ≤ 35 schon selbst hergeleitet und nachgerechnet.
- Beim Anlegen des Zweigs habe ich mit `ls versuche` die Dateinamen in `versuche/` gesehen, keine Inhalte. CLAUDE.md Regel 7 verlangt, `versuche/` vor einem Ansatz zu lesen; der Auftrag verbietet es. Ich bin dem Auftrag gefolgt (strengere Lesart für die Unabhängigkeit).
- Gelesen habe ich im Repo nur `CLAUDE.md`. Nicht gelesen: STATUS.md, LOG.md, PROTOKOLL.md, behauptungen/, pruefvermerke/, lean/, versuche/ (Inhalte), lit/, ergebnisse/, archiv/, README.md, verfahren/.
- Keine Subagenten, keine Fremdmodell-Anfragen.

## 1. Ergebnis

| Aussage | Grundlage | Art |
|---|---|---|
| R(⟨3,2,7⟩) ≤ 35 über jedem Körper | eigenes Verfahren mit ganzzahligen Koeffizienten, Abschnitt 2 | nachgerechnet (exakt über ℤ) |
| R(⟨3,2,7⟩) ≥ 34 über jedem Körper | Theorem 1 aus arXiv:2609.22054 (R > 24m/5), Abschnitt 3 | Beweis Schritt für Schritt nachvollzogen |
| Also 34 ≤ R(⟨3,2,7⟩) ≤ 35 | beides zusammen | behauptet |
| Welcher der beiden Werte gilt | offen | vermutet wird nichts Bestimmtes; Abschnitt 4 |

Die obere Schranke 35 stimmt mit der Hopcroft-Kerr-Formel ⌈(3pn + max(p,n))/2⌉ = ⌈(63+7)/2⌉ = 35 überein (Literatur, Abschnitt 5), ist aber unabhängig davon konstruiert.

## 2. Obere Schranke 35: eigenes Verfahren, exakt nachgerechnet

### 2.1 Wie es gefunden wurde

1. Startpunkt mit 39 Produkten über GF(2): Strassen (7 Produkte) auf den drei 2×2-Blöcken der Zeilen 1–2 von A mit den Spaltenpaaren (1,2), (3,4), (5,6) von B, Standardprodukte für Spalte 7 (4) und Zeile 3 (14). 21 + 4 + 14 = 39.
2. Flip-Graph-Zufallsweg über GF(2) (Verfahren nach Kauers und Moosbauer, eigene Umsetzung in C, Quelltext in Abschnitt 7): Zwei Summanden mit gleichem Faktor in einer Richtung werden „geflippt“; Reduktion, sobald in einer Gruppe mit gleichem Faktor die Faktoren einer anderen Richtung linear abhängig werden; bei Stillstand ein „Plus-Schritt“ (ein Summand wird in zwei zerlegt). 35 Produkte erreichten 8 von 20 Läufen (4 Läufe zu 180 s, 16 Läufe zu 60 s) (die Läufe hielten bei 35 an).
3. Hensel-Hebung von GF(2) nach ℤ/2^30 mit allen freien Variablen 0, dann rationale Rekonstruktion jeder Zahl, dann exakte Prüfung über ℚ (Programm `lift.py`, Abschnitt 7). Von acht GF(2)-Lösungen ließen sich so fünf heben, drei hatten ein Hebungshindernis (bei Stufe 2^2 bis 2^4). Mit zufällig gewählten freien Variablen gelang die rationale Rekonstruktion nie. Für zwei der gehobenen Lösungen habe ich jeden Summanden so skaliert, dass u und v ganzzahlig mit Inhalt 1 sind; w wurde dabei in beiden Fällen ganzzahlig.

Ergebnis: zwei verschiedene ganzzahlige Verfahren mit 35 Produkten; das unten abgedruckte hat Koeffizienten vom Betrag ≤ 5 und 585 von null verschiedene Einträge. Weil die Identität über ℤ gilt, gilt sie über jedem kommutativen Ring, insbesondere über jedem Körper.

### 2.2 Das Verfahren

Bezeichnungen: A = (a_ik) ist 3×2, B = (b_kj) ist 2×7, C = AB = (c_ij) ist 3×7.

```
P01 = (-a21 + a31) * (-b11 + 3*b12 - b13 - b14 + b15 - 2*b16 + b17 - b21 + 3*b22 - b23 - b24 + b25 - 2*b26 + b27)
P02 = (-a21 + a22 + a31 - a32) * (-b21 + b24 - b25 + b26 + 2*b27)
P03 = (-a11) * (-b11 - b12 + b14 - b15 + 2*b16 + b17 - b21 - b22 + b24 - b25 + 2*b26 + b27)
P04 = (-a11) * (-b12 + b14 - b15 + b16 - b22 + b24 - b25 + b26)
P05 = (-a21 + a22) * (-b11 + b12 - b15 + b16 + 2*b17)
P06 = (-a11 + a12 + a31 - a32) * (-b11 - b12 + b14 + b16 + b17)
P07 = (a12 - a22) * (b22)
P08 = (-a31) * (-b12 + b14)
P09 = (-a31) * (3*b12 - b13 - 2*b14 + b15 - 2*b16)
P10 = (a22) * (b11 - 2*b12 + b14 + b16 - 2*b17 + b21 - 2*b22 + b24 + b26 - 2*b27)
P11 = (-a12 + a32) * (-b11 - 3*b12 + b13 + 2*b14 - 2*b15 + 4*b16 + b17 - b21 - 3*b22 + b23 + 2*b24 - 2*b25 + 4*b26 + b27)
P12 = (-a22) * (-b11 + b12 + b17 - b21 + b22 + b27)
P13 = (-a11 + a12 - a32) * (-b11 - 3*b12 + b13 + 2*b14 - 2*b15 + 4*b16 + b17 - b21 - b22 + b24 - b25 + 2*b26 + b27)
P14 = (-a11 + a21) * (b16)
P15 = (a21 - a22 - a31) * (-b11 + b12 - b15 + b16 + 2*b17 - b21 + b24 - b25 + b26 + 2*b27)
P16 = (-a11 + a12) * (-b21 + b26 + b27)
P17 = (a12 - a32) * (-2*b11 - 4*b12 + b13 + 3*b14 - 2*b15 + 5*b16 + 2*b17 - 2*b21 - 4*b22 + b23 + 3*b24 - 2*b25 + 5*b26 + 2*b27)
P18 = (a11 - a22) * (-b12 + b14 - b15 + 2*b16 - b22 + b24 - b25 + b26)
P19 = (a11 - a12 + a32) * (-b11 - b12 + b14 + b16 + b17 - b21 + b26 + b27)
P20 = (a11 - a12 - a31 + a32) * (-b11 - b12 + b16)
P21 = (a12 - a21 + a31 - a32) * (-2*b12 + b13 + 2*b14 - 2*b15 + 3*b16 + b17 - 3*b22 + b23 + 2*b24 - 2*b25 + 3*b26 + b27)
P22 = (a21 - a22 - a31 + a32) * (-3*b22 + b23 + 2*b24 - 2*b25 + 3*b26 + b27)
P23 = (a21 - a22) * (b12 - b14 + b15 - 2*b16)
P24 = (a21 - a31) * (-b11 + b14 - b15 + b16 + 2*b17 - b21 + b24 - b25 + b26 + 2*b27)
P25 = (a32) * (2*b22 - b23 - b24 + b25 - 2*b26)
P26 = (a11 - a12) * (-b22 + b24 - b25 + b26)
P27 = (-a21 + a22 + a31) * (-b15 + b16 + b17 - 3*b22 + b23 + 2*b24 - 2*b25 + 3*b26 + b27)
P28 = (-a11 + a21) * (b12)
P29 = (-a12 + a32) * (-2*b12 + b13 + 2*b14 - 2*b15 + 3*b16 + b17 - 2*b22 + b23 + 2*b24 - 2*b25 + 3*b26 + b27)
P30 = (a21 - a22) * (-b15 + b16 + b17)
P31 = (a11 - a12 - a31 + a32) * (-2*b12 + b13 + 2*b14 - 2*b15 + 3*b16 + b17)
P32 = (a12 - a22) * (b26)
P33 = (a11 - a22) * (-b11 + b12 + b17 - b21 + b26 + b27)
P34 = (-a22) * (2*b11 - b12 - b14 + b15 - 2*b16 - 2*b17 + 2*b21 - b22 - b24 + b25 - 2*b26 - 2*b27)
P35 = (a32) * (b22 - b23 + b25 - 2*b26)
c11 = P01 + P04 + P09 + P11 + 2*P12 + P13 - P16 + P18 + P21 + P22 + P24 + P25 + P26 + P27 + P28 + P30 + P31 + P32 + P34
c12 = P03 + P07 + P12 + P18 + P33 + P34
c13 = 2*P03 + P07 - P11 - P12 - P13 - P25 + P26 - P32 + P33
c14 = 2*P03 - P04 + P07 + P11 + P12 + P17 + P18 + P19 - P25 + P33 + P34 + P35
c15 = P03 + P04 + P11 + 2*P12 + P17 + P18 + P19 - P25 + P26 + P32 + P34 + P35
c16 = P04 + 2*P12 + P18 + P32 + P34
c17 = P01 - P03 + P04 + P09 + P11 + P13 + P21 + P22 + P24 + P25 + P26 + P27 + P28 + P30 + P31
c21 = P03 + P04 + P05 - P08 + 3*P12 + P14 - P15 + 2*P18 + P23 + P24 + P28 + 2*P30 + P33 + P34
c22 = P03 + P12 + P18 + P28 + P33 + P34
c23 = P01 + P03 + P08 + P09 - 2*P12 + P15 + P18 + P23 + P27 + P28 + P33
c24 = P03 - P08 + P10 - P12 - P15 + P18 + P24 + P28 + P33
c25 = 2*P04 - P08 + P10 + 2*P14 - P15 + 2*P18 + P23 + P24
c26 = P04 + 2*P12 + P14 + P18 + P34
c27 = P04 - P08 + P12 + P14 - P15 + P18 + P23 + P24 + P30
c31 = P01 + P02 + P03 + P05 + P06 + P07 + P08 + P09 + P12 + P13 + P15 + P18 + P19 + P20 + P21 + 2*P22 + P24 + 2*P25 + P26 + 2*P27 + P28 + P29 + 2*P30 + P31 + P33 + P34
c32 = P01 + P03 + P07 + P12 + P18 + P21 + P24 + P28 + P29 + P33 + P34
c33 = -P02 - P05 + 2*P08 + 2*P09 + P13 - P15 - P16 + P20 - P22 - 2*P25 + P26 - P27 - P30 + P31
c34 = P01 + P03 + P07 - P08 + P12 + P18 + P21 + P24 - P25 + P28 + P29 + P33 + P34 + P35
c35 = P01 + P02 + P03 + P05 + 2*P06 + P07 + 2*P08 + P09 + P12 + P13 + P15 + P16 + P18 + 2*P19 + P20 + P21 + P22 + P24 + P26 + P27 + P28 + P29 + P30 + P31 + P33 + P34 + P35
c36 = P01 + P02 + P03 + P05 + P06 + P07 + P08 + P12 + P15 + P16 + P18 + P19 + P21 + P22 + P24 + P25 + P27 + P28 + P29 + P30 + P33 + P34
c37 = P06 + P08 + P09 + P13 + P19 + P20 + P22 + P25 + P26 + P27 + P30 + P31
```

### 2.3 Prüfung

Das Prüfprogramm `verify_alg.py` (Abschnitt 7) liest genau den Text oben, unabhängig von den Suchprogrammen, und prüft C = AB exakt in ganzen Zahlen für alle 6·14 = 84 Paare (E_ik, E_kj) von Matrixeinheiten. Wegen Bilinearität genügt das. Ausgabe:

```
products: 35
VERIFIED exact over Z
```

Das zweite gefundene Verfahren (Koeffizienten bis Betrag 6, 739 Einträge ≠ 0) besteht dieselbe Prüfung; ich drucke es nicht ab.

## 3. Untere Schranke 34: nachvollzogener Beweis

Quelle: A. Tsyganov, U. Parkina, S. Samsonov, M. Rakhuba, *A lower bound for ⟨3,2,m⟩ matrix multiplication*, arXiv:2609.22054v1 (18.09.2026), Theorem 1: Für jeden Körper K und jedes m ≥ 1 gilt R_K(⟨3,2,m⟩) > 24m/5. Die Autoren geben an, der Beweis sei in Lean 4 formalisiert (github.com/fallnlove/mm325_proof); diese Formalisierung habe ich **nicht** angesehen oder gebaut. Ich gebe den Beweis in eigener Darstellung wieder und vermerke bei jedem Schritt, was ich nachgerechnet habe. Für m = 7: 24·7/5 = 33,6, also R ≥ 34.

### 3.1 Aufbau

Ein bilinearer Algorithmus der Länge r ist eine Identität

  AB = Σ_{i=1}^r α_i(A) β_i(B) C_i für alle A ∈ K^{3×2}, B ∈ K^{2×m},

mit Linearformen α_i, β_i und festen Matrizen C_i ∈ K^{3×m}. E_ij bezeichnet Matrixeinheiten.

**Schritt 0 (unendlicher Körper).** Die Identität ist äquivalent zu endlich vielen Polynomgleichungen in den Koeffizienten (Auswerten auf Paaren von Matrixeinheiten). Ein Algorithmus über K ist also auch einer über K(t). Daher R_K ≥ R_{K(t)}, und es genügt, K unendlich anzunehmen. *Nachvollzogen.*

**Schritt 1 (keine Nullformen).** In einem Algorithmus minimaler Länge ist kein α_i = 0, sonst ließe sich der Summand streichen. *Nachvollzogen.*

### 3.2 Normalisierung (Lemma 1 der Quelle)

Schreibe A = [x y] (Spalten x, y ∈ K³) und α_i(A) = a_iᵀx + b_iᵀy.

(a) Wähle τ ∈ K so, dass (i) alle a_i + τb_i ≠ 0 und (ii) a_i + τb_i, a_j + τb_j nur dann proportional sind, wenn a_i + t b_i und a_j + t b_j für alle t linear abhängig sind. Möglich, weil (i) je Index höchstens ein τ verbietet (wegen (a_i,b_i) ≠ 0) und für (ii) jeder 2×2-Minor von [a_i + t b_i, a_j + t b_j] ein Polynom vom Grad ≤ 2 in t ist; man meidet die endlich vielen Nullstellen der nicht identisch verschwindenden Minoren. *Nachgerechnet.*

(b) Klassen: i ∼ j, wenn a_i + τb_i und a_j + τb_j proportional sind. Behauptung: In jeder Klasse spannen die α_i einen Raum der Dimension ≤ 2 auf.
- Fall 1: Für ein i der Klasse sind a_i, b_i linear unabhängig, und j ∼ i. Nach (a) ist rank[a_i + t b_i, a_j + t b_j] ≤ 1 für alle t. t = 0 gibt a_j = λa_i, t = 1 gibt a_j + b_j = μ(a_i + b_i), also b_j = (μ−λ)a_i + μb_i. Dann [a_i + tb_i, a_j + tb_j] = [a_i b_i]·M(t) mit M(t) = ((1, (1−t)λ + tμ), (t, tμ)). Da [a_i b_i] vollen Spaltenrang hat, ist det M(t) = tμ − t(1−t)λ − t²μ = t(1−t)(μ−λ) = 0 für alle t; mit t ∉ {0,1} folgt μ = λ, also α_j = λα_i. Die Klasse spannt Dimension ≤ 1. *Determinante von Hand nachgerechnet.*
- Fall 2: Für alle i der Klasse sind a_i, b_i abhängig. Dann liegen a_i, b_i auf der Geraden durch a_i + τb_i ≠ 0, und diese Gerade ist in der Klasse dieselbe (Proportionalität). Mit einem festen Vektor a auf ihr ist jedes α_i Linearkombination von aᵀx und aᵀy: Dimension ≤ 2. *Nachvollzogen.*

(c) Koordinatenwechsel. Ersetze A durch A'G mit G = ((1, τ), (0, 1)), also [x y] = [x', y' + τx']. Dann α_i(A'G) = (a_i + τb_i)ᵀx' + b_iᵀy'. Wähle u ∈ K so, dass kein Polynom q_i(u) = (a_i + τb_i)ᵀ(1, u, u²)ᵀ verschwindet (jedes q_i ≠ 0 hat ≤ 2 Nullstellen), und nimm (1, u, u²)ᵀ als ersten Basisvektor von K³ (Zeilenwechsel L mit erster Spalte (1,u,u²)ᵀ). Danach ist α_i(E_11) = q_i(u) ≠ 0; teile α_i dadurch und multipliziere β_i damit. Längenerhalt: (LAG)(G⁻¹B) = LAB, also liefert der alte Algorithmus nach Linksmultiplikation mit L⁻¹ einen neuen gleicher Länge. *Nachvollzogen.*

Ergebnis: α_i(E_11) = 1 für alle i. Mit s_i = α_i(E_21), t_i = α_i(E_31) gilt: Indizes mit gleichem Paar (s_i, t_i) sind genau die Klassen aus (b) (der erste Koeffizientenvektor ist (1, s_i, t_i), Proportionalität bleibt unter L und Skalierung erhalten), also

  (N) dim span{α_i : (s_i, t_i) = (s, t)} ≤ 2 für jedes (s, t).

### 3.3 Die Räume J ⊆ H (Beweis von Theorem 1, erster Teil)

Setze S = diag(s_i), T = diag(t_i), Z = diag(α_i(E_12)) auf E = K^r; sie kommutieren paarweise. W: K^r → K^{3×m}, W(z) = Σ z_i C_i. W ist surjektiv (das Bild enthält alle AB, also alle Matrixeinheiten), daher h := dim H = r − 3m für H := ker W.

Für v ∈ K^{1×m} sei B₀(v) = (0; v) (erste Zeile null) und B₁(v) = (v; 0). Setze J = {(β_i(B₀(v)))_i : v}. Die Parametrisierung v ↦ y(v) ist injektiv: Ist y(v) = 0, so gibt A = E_12 in der Identität E_12·B₀(v) = 0, aber E_12·B₀(v) hat v als erste Zeile. Also dim J = m. Weiter X: J → K^r, X(y(v)) = (β_i(B₁(v)))_i, wohldefiniert wegen Injektivität.

Einsetzen von Matrixeinheiten in die Identität (jeweils das Produkt von Hand berechnet; „[p;q;r]“ = Matrix mit Zeilen p, q, r):

| Ausdruck | A, B | Wert von W(·) |
|---|---|---|
| W(y) = Σ α_i(E_11)β_i(B₀)C_i | E_11, B₀ | E_11B₀ = [0;0;0] |
| W(Sy) | E_21, B₀ | E_21B₀ = [0;0;0] |
| W(Ty) | E_31, B₀ | E_31B₀ = [0;0;0] |
| W(Xy) | E_11, B₁ | [v;0;0] |
| W(Zy) | E_12, B₀ | [v;0;0] |
| W(SXy) | E_21, B₁ | [0;v;0] |
| W(TXy) | E_31, B₁ | [0;0;v] |

*Alle sieben Zeilen nachgerechnet.* Daraus: J ⊆ H, und für y ∈ J gilt Sy ∈ H, Ty ∈ H, Xy − Zy ∈ H. (3)
Für u₁, u₂, u₃ ∈ J mit Parametern v₁, v₂, v₃ ist W(Zu₁ + SXu₂ + TXu₃) = [v₁; v₂; v₃]; liegt das in H, so sind alle v_k = 0, also alle u_k = 0. (4)

### 3.4 Dimensionsungleichung (Lemma 2 der Quelle)

Sei F = {y ∈ J : Sy ∈ J, Ty ∈ J}, f = dim F. Betrachte auf (u, v, c) ∈ J³ die Bedingungen

  (5a) Su + Tv ∈ J, (5b) Xu − Zu + Tc ∈ J, (5c) Xv − Zv − Sc ∈ J.

*Lösungsmenge.* Wende S auf (5b) und T auf (5c) an; beide Elemente liegen in J, also nach (3) ihre Bilder in H. Wegen der Kommutativität ist die Summe
S(Xu − Zu + Tc) + T(Xv − Zv − Sc) = SXu + TXv − Z(Su + Tv) ∈ H.
Mit a = −(Su + Tv) ∈ J (nach (5a)) liefert (4): u = v = 0. Dann verlangen (5b), (5c) nur Tc ∈ J, Sc ∈ J, also c ∈ F. Umgekehrt löst jedes (0, 0, c) mit c ∈ F das System. Lösungsraum {0}×{0}×F, Kodimension 3m − f in J³. *Nachgerechnet (die Kommutatorrechnung SZ = ZS, TZ = ZT, ST = TS von Hand ausmultipliziert).*

*Rangabschätzungen.* Nach (3) liegt jeder der drei Ausdrücke in H; „∈ J“ heißt Verschwinden in H/J, also je höchstens h − m unabhängige Bedingungen:
  3m − f ≤ 3(h − m). (6)
Der Kern von (5a) als Abbildung J×J → H/J enthält F×F, also hat (5a) Rang ≤ 2m − 2f:
  3m − f ≤ 2(m − f) + 2(h − m). (7)
Aus (6): f ≥ 6m − 3h; aus (7): f ≤ 2h − 3m. Zusammen 9m ≤ 5h. *Umformungen nachgerechnet.*

### 3.5 Schluss

Mit h = r − 3m: 5(r − 3m) ≥ 9m, also r ≥ 24m/5. Für m = 7: r ≥ 33,6, also **R(⟨3,2,7⟩) ≥ 34** über jedem Körper. Der Gleichheitsfall 5h = 9m, den die Quelle zusätzlich ausschließt, tritt bei m = 7 nicht auf (63 ist nicht durch 5 teilbar) und wird hier nicht gebraucht.

Ich habe keinen Fehler gefunden. Benutzte Voraussetzungen: nur Körperaxiome; der Übergang zu K(t) deckt endliche Körper ab, insbesondere GF(2).

## 4. Versuche, die Lücke 34/35 zu schließen

### 4.1 Rechnerisch: Suche nach 34 Produkten über GF(2)

Über GF(2) ist 34 nicht ausgeschlossen (die Schranke aus Abschnitt 3 gilt auch dort und gibt nur ≥ 34). Rechenblock 1: der Flip-Graph-Weg aus Abschnitt 2 mit Ziel 34, vier Läufe parallel auf 4 Kernen, je 1500 s, Start jeweils von einer anderen GF(2)-Lösung mit 35 Produkten, Plus-Schritt nach 500 000 Flips ohne Reduktion (solange der Rang unter best+4 liegt, sonst Neustart vom Startpunkt; best ist der beste bisher erreichte Rang).

Ergebnis (13:26:23 bis 13:51:26 UTC): Alle vier Läufe endeten mit bestem Rang 35. Keine Lösung mit 34 Produkten gefunden.

Das ist nur ein schwacher Hinweis: 100 Kernminuten sind wenig, der Weg ist zufällig, und ein Fehlschlag über GF(2) schließt ein Verfahren mit 34 Produkten über ℚ oder einem anderen Körper nicht aus.

### 4.2 Theoretisch: was die Beweismethode bei r = 34 noch zulässt (eigene Überlegung, ungeprüft)

Bei m = 7 und r = 34 ist h = 13. Die Ungleichungen (6) und (7) erlauben dann f ∈ {3, 4, 5}. Ich habe eine kleine Verschärfung von (7) gefunden. Sie schließt f = 5 aus, aber nicht f = 3, 4. Sie ist **vermutet** richtig, von niemandem geprüft, und reicht nicht für 35.

*Hilfsaussage (aus dem Gleichheitsteil der Quelle):* Kein von null verschiedenes y ∈ J hat seinen Träger in einer einzigen Klasse {i : (s_i, t_i) = (s, t)}. Denn sonst gäbe es v ≠ 0 mit AB₀(v) = Σ_{i: y_i≠0} α_i(A) y_i C_i; die rechte Seite hat als lineare Abbildung in A Rang ≤ 2 wegen (N), die linke ist A ↦ (zweite Spalte von A)·v, Rang 3. Folgerungen: (i) J enthält keinen gemeinsamen Eigenvektor von S und T; mit Lemma 3 der Quelle (diagonale Matrizen, Träger-minimaler Vektor) gibt es also keinen von null verschiedenen S- und T-invarianten Teilraum von J. (ii) Für y ∈ J, y ≠ 0, ist (Ty, Sy) ≠ (0, 0).

*Verschärfung.* Sei F₂ = {y ∈ F : Sy ∈ F, Ty ∈ F}, f₂ = dim F₂. Der Kern K₁ von (5a) als Abbildung J×J → H/J enthält F×F und Γ = {(Ty, −Sy) : y ∈ F} (denn Ty, Sy ∈ J und S·Ty − T·Sy = 0). Die Abbildung y ↦ (Ty, −Sy) ist auf F injektiv nach (ii), und Γ ∩ (F×F) ist das Bild von F₂. Also dim K₁ ≥ 2f + f − f₂ und Rang(5a) ≤ 2m − 3f + f₂. In (7) eingesetzt:

  3m − f ≤ (2m − 3f + f₂) + 2(h − m), also 2f − f₂ ≤ 2h − 3m. (7′)

Für r = 34, m = 7: 2f − f₂ ≤ 5. Wäre f = 5, so f₂ ≥ 5 = f, also F₂ = F, also F invariant unter S und T und ≠ 0, Widerspruch zu (i). Es bleiben f = 3 mit f₂ ≥ 1 und f = 4 mit f₂ ≥ 3. Um r = 34 ganz auszuschließen, müsste man zeigen, dass die absteigende Kette F ⊇ F₂ ⊇ F₃ ⊇ … (F_{k+1} = {y ∈ F_k : Sy, Ty ∈ F_k}) nicht schon vor der Null stehen bleibt, oder eine bessere Schranke für den Rang von (5b), (5c) finden. Das habe ich nicht geschafft. Mögliche weitere Hebel: dieselbe Konstruktion mit vertauschten Spalten von A (E_12 statt E_11 normiert), oder die bisher ungenutzten Einheiten E_22, E_32.

Ob R(⟨3,2,7⟩) 34 oder 35 ist, bleibt damit offen. Ich vermute keinen der beiden Werte mit Begründung.

## 5. Literatur

### 5.1 Suchprotokoll (wörtlich, 26.11.2026, Websuche des Werkzeugs, Zeiten etwa 13:12 bis 13:27 UTC)

1. `lower bound bilinear complexity rank multiplication n×2 by 2×m matrices substitution method`
2. `Hopcroft Kerr 1971 "p×2" "2×n" matrices multiplications lower bound optimal ⌈(3pn+max(n,p))/2⌉`
3. alphaXiv-Volltext von arXiv:2603.07280 (Wang), gezielt nach ⟨2,3,·⟩, ⟨3,2,·⟩, Bläser durchsucht
4. `Bläser "Lower bounds for the multiplicative complexity of matrix multiplication" computational complexity 1999 pdf`
5. `JaJa Takche "Improved lower bounds for some matrix multiplication problems" 3×2 2×n` — erster Treffer war arXiv:2609.22054, danach Volltext über alphaXiv gelesen
6. `tensor rank ⟨3,2,m⟩ OR ⟨2,3,m⟩ matrix multiplication lower bound 2026 arXiv Hopcroft-Kerr optimal "3 × 2"` (erweiterte Suche; Treffer enthielt die GitHub-Seite dieses Repos, siehe Abschnitt 0)
7. Abruf von https://fmm.univ-lille.fr/2x3x7.html mit curl, Text nach „2x3x7“ und „rank“ durchsucht

### 5.2 Was die Quellen sagen (nur 2609.22054 habe ich vollständig gelesen)

| Quelle | Aussage für ⟨3,2,7⟩ | von mir |
|---|---|---|
| Hopcroft, Kerr, SIAM J. Appl. Math. 20(1):30–36, 1971 | Verfahren für p×2 mal 2×n mit ⌈(3pn + max(n,p))/2⌉ Produkten ohne Kommutativität, also 35 | nur Abstract bzw. Zitate gelesen; eigene 35 unabhängig konstruiert |
| Bläser, Comput. Complexity 8:203–226, 1999 | R(⟨l,m,n⟩) ≥ lm + mn + l − m + n − 3 (n ≥ l ≥ 2, laut Zitat bei Wang über algebraisch abgeschlossenen Körpern); als ⟨2,3,7⟩: 6 + 21 + 2 − 3 + 7 − 3 = 30 | nur zitiert, Arbeit nicht zugänglich |
| Ja'Ja', Takche, Inf. Process. Lett. 21(3):123–127, 1985 | über GF(2): R(⟨3,2,n⟩) ≥ ⌈105n/23⌉, für n = 7 also 32 | nur zitiert (bei Wang und in 2609.22054) |
| Yang, arXiv:2609.14393 (2026) | laut Zitat in 2609.22054: R(⟨3,2,m⟩) ≥ ⌈24m/5⌉ über jedem Körper; laut Suchzusammenfassung in der aktuellen Fassung ⌈(24m+2)/5⌉ für m ≥ 3; für m = 7 beides 34 | nicht gelesen |
| Tsyganov, Parkina, Samsonov, Rakhuba, arXiv:2609.22054v1 (18.09.2026) | R(⟨3,2,m⟩) > 24m/5 über jedem Körper, also ≥ 34 für m = 7; R(⟨3,2,5⟩) = 25 | vollständig gelesen, Beweis nachvollzogen (Abschnitt 3) |
| Wang, arXiv:2603.07280v11 (2026) | automatisierte untere Schranken über GF(2); ⟨3,2,7⟩ nicht in seiner Tabelle 3 | Einleitung und Tabelle 3 gelesen |

Lizenz: Ich übernehme keine fremden Daten oder Programme ins Repo. Der Beweis in Abschnitt 3 ist in eigenen Worten wiedergegeben, mit Quellenangabe.

Nach meiner Suche ist in der öffentlichen Literatur kein Verfahren mit 34 Produkten und keine Schranke ≥ 35 für ⟨3,2,7⟩ bekannt. Die Suche war kurz (sechs Suchen, ein Seitenabruf); das ist ein Befund über meine Suche, keine Aussage über die Literatur insgesamt. Die Katalogseite https://fmm.univ-lille.fr/2x3x7.html (abgerufen 26.11.2026 gegen 13:30 UTC, HTTP 200) führt als bestes Verfahren ⟨2×3×7:35⟩, zusammengesetzt als ⟨2×3×3:15⟩ + ⟨2×3×4:20⟩. Daten von dort habe ich nicht übernommen.

## 6. Rechenblöcke und Verbrauch

Zeiten in UTC, aus `date -u` beim Start und Ende; die Commit-Zeiten stehen im Git-Verlauf dieses Zweigs.

| Block | Zeit | Kerne | Inhalt | Ergebnis |
|---|---|---|---|---|
| Vorläufe | 13:17 bis 13:26 (zusammen etwa 8 min) | 4 | Flip-Graph 39 → 35 über GF(2), 20 Läufe zu 60 bis 180 s; Hebungen nach ℤ (Sekunden) | 8 Lösungen mit 35, 5 nach ℚ/ℤ gehoben |
| Zwischencommit | 13:26:16 | – | 00da560 | – |
| Block 1 | 13:26:23 bis 13:51:26 (25 min) | 4 | Flip-Graph mit Ziel 34 über GF(2) | bester Rang 35 |

Verbrauch: 0 Subagenten, 0 Fremdmodell-Anfragen, etwa 33 Minuten Rechenzeit auf 4 Kernen, kein Block über 30 Minuten.

## 7. Programme

Alle Programme sind von mir geschrieben. Ablauf zum Nachrechnen: Verfahren aus Abschnitt 2.2 in eine Datei `alg.txt` kopieren, dann `python3 verify_alg.py alg.txt`.

### 7.1 Prüfprogramm `verify_alg.py`

```python
# Independent check: parse "Pxx = (lin A) * (lin B)" and "cij = lin P" lines and verify
# C = A*B exactly (integers) for all 6*14 pairs of matrix units, which suffices by bilinearity.
import re,sys
txt=open(sys.argv[1]).read().splitlines()
def parse_lin(s):
  d={}
  for sg,co,name in re.findall(r'([+-]?)\s*(?:(\d+)\*)?([abP]\d+)',s.replace(' ','')):
    d[name]=d.get(name,0)+(-1 if sg=='-' else 1)*(int(co) if co else 1)
  return d
P={};C={}
for L in txt:
  m=re.match(r'(P\d+) = \((.*)\) \* \((.*)\)$',L)
  if m: P[m.group(1)]=(parse_lin(m.group(2)),parse_lin(m.group(3))); continue
  m=re.match(r'(c\d\d) = (.*)$',L)
  if m: C[m.group(1)]=parse_lin(m.group(2))
assert len(C)==21
print("products:",len(P))
ok=True
for i in range(3):
 for k in range(2):
  for k2 in range(2):
   for j in range(7):
    A={f"a{i+1}{k+1}":1}; B={f"b{k2+1}{j+1}":1}
    val={p:sum(c*A.get(n,0) for n,c in la.items())*sum(c*B.get(n,0) for n,c in lb.items()) for p,(la,lb) in P.items()}
    for ii in range(3):
     for jj in range(7):
      got=sum(c*val[p] for p,c in C[f"c{ii+1}{jj+1}"].items())
      want=1 if (ii==i and jj==j and k==k2) else 0
      if got!=want: ok=False; print("FAIL",i,k,k2,j,ii,jj,got)
print("VERIFIED exact over Z" if ok else "NOT VERIFIED")
```

### 7.2 Startpunkt `mkstart.py` (39 Produkte über GF(2))

```python
# Build a 39-term start for <3,2,7> over GF(2): Strassen on rows{0,1} x cols pairs, standard elsewhere.
import sys
P,Q,N=3,2,7
def ab(i,k): return 1<<(i*Q+k)
def bb(k,j): return 1<<(k*N+j)
def cb(i,j): return 1<<(i*N+j)
terms=[]
def strassen(r0,r1,c0,c1):
    # A block rows r0,r1 cols 0,1 ; B block rows 0,1 cols c0,c1 ; GF2 signs irrelevant
    A=lambda i,k: ab([r0,r1][i],k); B=lambda k,j: bb(k,[c0,c1][j]); C=lambda i,j: cb([r0,r1][i],[c0,c1][j])
    M=[(A(0,0)^A(1,1), B(0,0)^B(1,1), C(0,0)^C(1,1)),
       (A(1,0)^A(1,1), B(0,0), C(1,0)^C(1,1)),
       (A(0,0), B(0,1)^B(1,1), C(0,1)^C(1,1)),
       (A(1,1), B(1,0)^B(0,0), C(0,0)^C(1,0)),
       (A(0,0)^A(0,1), B(1,1), C(0,0)^C(0,1)),
       (A(1,0)^A(0,0), B(0,0)^B(0,1), C(1,1)),
       (A(0,1)^A(1,1), B(1,0)^B(1,1), C(0,0))]
    terms.extend(M)
for c in range(0,6,2): strassen(0,1,c,c+1)
for i in range(2):
    for k in range(2): terms.append((ab(i,k),bb(k,6),cb(i,6)))
for k in range(2):
    for j in range(7): terms.append((ab(2,k),bb(k,j),cb(2,j)))
print(len(terms))
for t in terms: print("%x %x %x"%t)
```

### 7.3 Flip-Graph-Suche `flip2.c`

Aufruf: `./flip2 <Ziel> <Plateau> <Seed> <Sekunden> <Startdatei>`; Bitkodierung u[i*2+k], v[k*7+j], w[i*7+j].

```c
// Flip-graph random walk over GF(2) for <3,2,7>, start from file, generalized reductions.
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#define P 3
#define Q 2
#define N 7
#define MAXR 80
typedef uint32_t u32;
static u32 U[MAXR][3]; static int R; static u32 S0[MAXR][3]; static int R0;
static uint64_t rs;
static inline uint64_t rnd(){ rs^=rs<<13; rs^=rs>>7; rs^=rs<<17; return rs; }
static const u32 MASK[3]={0x3F,0x3FFF,0x1FFFFF};
static void del(int t){ for(int m=0;m<3;m++)U[t][m]=U[R-1][m]; R--; }
static int verify(){
  for(int i=0;i<P;i++)for(int k=0;k<Q;k++)for(int k2=0;k2<Q;k2++)for(int j=0;j<N;j++)for(int i2=0;i2<P;i2++)for(int j2=0;j2<N;j2++){
    int s=0; for(int t=0;t<R;t++) s^=((U[t][0]>>(i*Q+k))&(U[t][1]>>(k2*N+j))&(U[t][2]>>(i2*N+j2)))&1;
    if(s!=(k==k2&&i==i2&&j==j2)) return 0; }
  return 1; }
// generalized reduction: within a group sharing mode-m factor, if mode-m1 vectors are dependent, eliminate one.
static int reduce_once(){
  for(int t=0;t<R;t++) if(!U[t][0]||!U[t][1]||!U[t][2]){del(t);return 1;}
  for(int m=0;m<3;m++){ int m1=(m+1)%3,m2=(m+2)%3;
    for(int a=0;a<R;a++){ // group of a (only if a is smallest index in its group)
      int g[MAXR],ng=0; int skip=0;
      for(int b=0;b<R;b++) if(U[b][m]==U[a][m]){ if(b<a){skip=1;break;} g[ng++]=b; }
      if(skip||ng<2) continue;
      for(int side=0;side<2;side++){ int mv= side?m2:m1, mo= side?m1:m2;
        // gaussian elimination tracking combos (ng<=64)
        u32 vec[MAXR]; uint64_t comb[MAXR]; int piv[MAXR]; int np=0;
        for(int x=0;x<ng;x++){ u32 v=U[g[x]][mv]; uint64_t c=1ULL<<x;
          for(int p=0;p<np;p++) if((v>>piv[p])&1){ v^=vec[p]; c^=comb[p]; }
          if(!v){ // dependency: c includes x and subset of earlier members
            int cidx=g[x];
            for(int y=0;y<x;y++) if((c>>y)&1) U[g[y]][mo]^=U[cidx][mo];
            del(cidx); return 1; }
          int pb=__builtin_ctz(v); vec[np]=v; comb[np]=c; piv[np]=pb; np++;
          // keep reduced: not necessary
        }
      }
    } }
  return 0; }
static int reduce(){ int any=0; while(reduce_once()) any=1; return any; }
int main(int argc,char**argv){
  int target=atoi(argv[1]); long long plateau=atoll(argv[2]); rs=atoll(argv[3])*2654435761ULL+12345; double tlim=atof(argv[4]);
  FILE*f=fopen(argv[5],"r"); fscanf(f,"%d",&R0); for(int t=0;t<R0;t++) fscanf(f,"%x %x %x",&S0[t][0],&S0[t][1],&S0[t][2]); fclose(f);
  R=R0; for(int t=0;t<R;t++)for(int m=0;m<3;m++)U[t][m]=S0[t][m];
  if(!verify()){fprintf(stderr,"start invalid\n");return 3;}
  time_t t0=time(0); int best=R; long long it=0, since=0;
  while(difftime(time(0),t0)<tlim){
    it++; since++;
    if(since>plateau){ // plus transition: split random term into two
      if(R<best+4 && R<MAXR-1){ int t=rnd()%R; int mm=rnd()%3; u32 x=rnd()&MASK[mm];
        if(x&&x!=U[t][mm]){ for(int m=0;m<3;m++)U[R][m]=U[t][m]; U[R][mm]^=x; U[t][mm]=x; R++; } }
      else { R=R0; for(int t=0;t<R;t++)for(int m=0;m<3;m++)U[t][m]=S0[t][m]; }
      since=0; }
    int m=rnd()%3; int a=rnd()%R; int cand[MAXR],nc=0;
    for(int b=0;b<R;b++) if(b!=a&&U[b][m]==U[a][m]) cand[nc++]=b;
    if(!nc) continue;
    int b=cand[rnd()%nc]; int m1=(m+1)%3,m2=(m+2)%3;
    U[a][m2]^=U[b][m2]; U[b][m1]^=U[a][m1];
    if(reduce()){ since=0; if(R<best){best=R; fprintf(stderr,"seed %s t=%.0fs rank %d\n",argv[3],difftime(time(0),t0),R);}
      if(R<=target){ if(!verify()){fprintf(stderr,"VERIFY FAIL\n");return 1;}
        printf("%d\n",R); for(int t=0;t<R;t++) printf("%x %x %x\n",U[t][0],U[t][1],U[t][2]); fflush(stdout); return 0; } }
  }
  fprintf(stderr,"seed %s best %d\n",argv[3],best); return 2; }
```

### 7.4 Hebung nach ℤ `lift.py`

Aufruf: `python3 lift.py <GF2-Lösung> 30` (ohne dritten Parameter: freie Variablen 0).

```python
# Hensel-lift a GF(2) decomposition of <3,2,7> to Z/2^K, then try symmetric-residue / rational reconstruction over Q.
import sys, numpy as np
from fractions import Fraction
P,Q,N=3,2,7; dA,dB,dC=P*Q,Q*N,P*N
lines=open(sys.argv[1]).read().split(); R=int(lines[0]); vals=[int(x,16) for x in lines[1:]]
def bits(x,d): return [(x>>i)&1 for i in range(d)]
U=np.array([bits(vals[3*t],dA) for t in range(R)],dtype=object)
V=np.array([bits(vals[3*t+1],dB) for t in range(R)],dtype=object)
W=np.array([bits(vals[3*t+2],dC) for t in range(R)],dtype=object)
T=np.zeros((dA,dB,dC),dtype=object)
for i in range(P):
  for k in range(Q):
    for j in range(N): T[i*Q+k,k*N+j,i*N+j]=1
def resid(U,V,W): return np.einsum('ta,tb,tc->abc',U,V,W)-T
nv=R*(dA+dB+dC)
def jac(U,V,W):
  # rows: equations (a,b,c); cols: variables
  J=np.zeros((dA*dB*dC,nv),dtype=np.uint8); 
  U2,V2,W2=[np.array(M,dtype=np.int64)%2 for M in (U,V,W)]
  off=0
  for t in range(R):
    for a in range(dA):
      J[:,off+t*dA+a]=(np.einsum('b,c->bc',V2[t],W2[t])[None,:,:]*(np.arange(dA)==a)[:,None,None]).reshape(-1)%2
  off=R*dA
  for t in range(R):
    for b in range(dB):
      J[:,off+t*dB+b]=(np.einsum('a,c->ac',U2[t],W2[t])[:,None,:]*(np.arange(dB)==b)[None,:,None]).reshape(-1)%2
  off+=R*dB
  for t in range(R):
    for c in range(dC):
      J[:,off+t*dC+c]=(np.einsum('a,b->ab',U2[t],V2[t])[:,:,None]*(np.arange(dC)==c)[None,None,:]).reshape(-1)%2
  return J
def solve_gf2(J,rhs):
  A=np.concatenate([J,rhs[:,None]],axis=1).astype(np.uint8); m,n=J.shape; piv=[]; r=0
  for c in range(n):
    rows=np.nonzero(A[r:,c])[0]
    if len(rows)==0: continue
    p=r+rows[0]; A[[r,p]]=A[[p,r]]
    nz=np.nonzero(A[:,c])[0]; nz=nz[nz!=r]; A[nz]^=A[r]
    piv.append(c); r+=1
    if r==m: break
  if A[r:,n].any(): return None
  free=np.ones(n,dtype=bool); free[piv]=False
  x=np.zeros(n,dtype=np.uint8); x[free]=(RNG.random(free.sum())<0.5) if RANDFREE else 0
  # back-substitute: pivot rows are fully reduced: x_piv = rhs + sum A[i,free]*x_free
  Af=A[:len(piv),:n]; 
  for i,c in enumerate(piv): x[c]=(A[i,n]+int((Af[i].astype(np.int64)*x).sum()-x[c]*Af[i,c]))%2
  return x.astype(np.int64)
RNG=np.random.default_rng(int(sys.argv[3]) if len(sys.argv)>3 else 0); RANDFREE=len(sys.argv)>3
K=int(sys.argv[2]) if len(sys.argv)>2 else 24
J=jac(U,V,W)
mod=2
for k in range(1,K):
  F=resid(U,V,W)
  Fr=np.array([int(x)%(2*mod) for x in F.reshape(-1)],dtype=object)
  assert all(int(x)%mod==0 for x in Fr)
  rhs=np.array([(-(int(x)//mod))%2 for x in Fr],dtype=np.uint8)
  x=solve_gf2(J,rhs)
  if x is None: print("lift obstruction at",k); sys.exit(1)
  x=x.astype(object)*mod
  U=U+x[:R*dA].reshape(R,dA); V=V+x[R*dA:R*(dA+dB)].reshape(R,dB); W=W+x[R*(dA+dB):].reshape(R,dC)
  mod*=2
  U,V,W=[np.vectorize(lambda z:int(z)%mod)(M).astype(object) for M in (U,V,W)]
def ratrec(a,m):
  a%=m; r0,r1=m,a; s0,s1=0,1
  import math
  B=int(math.isqrt(m//2))
  while r1>B: q=r0//r1; r0,r1=r1,r0-q*r1; s0,s1=s1,s0-q*s1
  if abs(s1)>B or s1==0: return None
  return Fraction(r1,s1)
out=[]
for M in (U,V,W):
  Mq=np.vectorize(lambda z: ratrec(int(z),mod))(M)
  if any(z is None for z in Mq.reshape(-1)): print("ratrec failed"); sys.exit(2)
  out.append(Mq)
Uq,Vq,Wq=out
F=np.einsum('ta,tb,tc->abc',Uq,Vq,Wq)-T
print("exact over Q:", all(z==0 for z in F.reshape(-1)))
coeffs=set(z for M in out for z in M.reshape(-1)); print("coefficients:",sorted(coeffs))
import json
json.dump({"R":R,"U":[[str(z) for z in r] for r in Uq],"V":[[str(z) for z in r] for r in Vq],"W":[[str(z) for z in r] for r in Wq]},open(sys.argv[1]+".lifted.json","w"))
```

Danach je Summand: u und v durch ihren Inhalt teilen, w mit dem Produkt der Inhalte multiplizieren (`norm.py`), Ausgabe in Textform mit `fmt.py`. Beide Hilfsprogramme ändern die Identität nicht; maßgeblich ist die Prüfung mit `verify_alg.py` auf dem abgedruckten Text.
