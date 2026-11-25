# S2-17: Blind-Sucher Runde 4 zu ⟨4,2,4⟩ (25 oder 26?)

- Auftrag: S2-17, Stufe 2, Runde 4, Rolle Blind-Sucher (Protokoll Abschnitt 4)
- Datum: 25.11.2026
- Gelesen: PROTOKOLL.md (0.3), CLAUDE.md, `lean/prosa/yang_n4.md` (Yangs Satz 2, ausgearbeitet in S1-03), die Satznamen in `lean/YangBounds/YangN4Haupt.lean` und `YangN4Lemma13.lean`, das Verfahren `verfahren/4x2x4-r26-s001.json` als Rechenbeispiel
- Nicht gelesen: `versuche/` (außer dieser Datei), `lean/prosa/s2_*`, `behauptungen/B-008` und folgende, `lit/WACHE.md`, `LOG.md`, `STATUS.md`, Literatur zu diesem Format. Was ich trotzdem gesehen habe, steht in Abschnitt 8
- Kein Fremdmodell benutzt

## 0. Ergebnis in drei Sätzen

Ich habe keinen Beweis für R(⟨4,2,4⟩) ≥ 26 und kein Verfahren mit 25 gefunden. Gefunden habe ich eine **Fallunterscheidung für eine hypothetische Zerlegung der Länge 25**, die allein aus Yangs eigenen Ungleichungen folgt: Es bleiben genau vier benannte Fälle R1 bis R4, und in allen ist die Kenngröße ρ gleich 3 statt 4 (Satz R, Status **behauptet**). Damit reduziert sich die untere Schranke 26 innerhalb von Yangs Rahmen auf eine einzige Aussage, das **Lemma ρ** („eine Kombination Σγ_iF_i ist injektiv“, Status **vermutet**). Dieselbe Aussage würde auch R(⟨4,2,5⟩) ≥ 32 liefern.

---

## 1. Bezeichnungen

Ich übernehme die Bezeichnungen aus `lean/prosa/yang_n4.md` (Abschnitte 1 bis 7) ohne Änderung: K algebraisch abgeschlossen, Zerlegung (Z′) mit W(D(A)ℬ(B)) = AB, Normalisierung (N1), (N2) nach Lemma 6, U = {x ∈ K^{2×m} : Zeile 0 = 0}, f_i(x) = D(e_{i,0})ℬ(x), J = f_0(U), Q = ker W / J, F_i : U → Q, L, H, ρ = max_γ rk(Σ_{i≥1} γ_iF_i).

Benutzte Aussagen von Yang (alle in Lean vorhanden, Namen in Klammern):

- (4.1 iii) dim Q = r − 5m bei n = 4 (`finrank_Kbar`), rk L ≤ dim Q (`range_Lq_le_Kbar`)
- (1) (n−1)m + rk H ≤ rk L + (n−1)·dim Q (`ineq1`)
- Lemma 13 mit d = 3: 2·rk H ≥ 3ρ + rk L (`lemma13`)
- Lemma 14: ρ ≥ 3 für m ≥ 3 (`lemma14`)
- ρ ≤ m (`rkComb_le`)
- Folgerung 7: Σ_{i=0}^{3} γ_i f_i ist für γ ≠ 0 auf ganz K^{2×m} injektiv

---

## 2. Satz R: Was eine Zerlegung der Länge 25 erfüllen müsste

**Satz R (Status behauptet).** Sei K algebraisch abgeschlossen und (Z′) eine normalisierte Zerlegung von ⟨4,2,m⟩, m ≥ 4, der Länge r = 6m + 1, ohne Nullform α_t. Dann gilt

  3ρ ≤ rk L + 6 ≤ m + 7,  insbesondere ρ ≤ (m+7)/3 < m.

Für m = 4 (also r = 25) folgt ρ = 3, und (rk L, rk H) ist eines der vier Paare

| Fall | rk L | rk H | d = dim Σ_i f_i(U) = 4 + rk L | Ungleichung (1) | Lemma 13 |
|---|---|---|---|---|---|
| R1 | 3 | 6 | 7 | Gleichheit | Gleichheit |
| R2 | 4 | 7 | 8 | Gleichheit | Abstand 1 |
| R3 | 5 | 7 | 9 | Abstand 1 | Gleichheit |
| R4 | 5 | 8 | 9 | Gleichheit | Abstand 2 |

*Beweis.* dim Q = r − 5m = m + 1. Aus (1) mit n = 4: 3m + rk H ≤ rk L + 3(m+1), also rk H ≤ rk L + 3. Mit Lemma 13: 3ρ + rk L ≤ 2 rk H ≤ 2 rk L + 6, also 3ρ ≤ rk L + 6 ≤ dim Q + 6 = m + 7. Für m = 4: 3ρ ≤ 11, also ρ ≤ 3, und mit Lemma 14 ρ = 3. Dann rk L ≥ 3ρ − 6 = 3 und rk L ≤ 5, und rk H liegt zwischen ⌈(9 + rk L)/2⌉ und rk L + 3. Das gibt genau die vier Zeilen. Die Spalte d: Σ_i f_i(U) ⊇ J und (Σ_i f_i(U))/J = im L. ∎

Bemerkung zur Vollständigkeit: Eine Zerlegung der Länge 25 mit Nullform ergäbe eine der Länge ≤ 24, ausgeschlossen durch Yangs Satz 2 (geprüft). Die Normalisierung nach Lemma 6 ändert r nicht. Also fällt jede Zerlegung der Länge 25 über jedem Körper nach Übergang zum algebraischen Abschluss unter Satz R.

**Folgerung R′ (Status behauptet).** Gilt in einer normalisierten Zerlegung von ⟨4,2,m⟩ (m ≥ 4) der Länge 6m + 1 die Gleichung ρ = m, so ist das ein Widerspruch (m ≤ (m+7)/3 heißt m ≤ 3). Also:

> **Lemma ρ (Status vermutet).** In jeder normalisierten Zerlegung von ⟨4,2,m⟩ der Länge 6m + 1, m ∈ {4, 5}, gibt es γ ∈ K³ mit Σγ_iF_i : U → Q injektiv.
>
> Lemma ρ ⇒ R(⟨4,2,4⟩) ≥ 26 und R(⟨4,2,5⟩) ≥ 32.

Für m = 4 reicht schon ρ ≥ 4, für m = 5 braucht man ρ = 5.

Warum Satz R einfach zu formalisieren sein sollte: Er ist eine Rechnung in ℤ aus fünf Lean-Sätzen, die es schon gibt (Abschnitt 1). Ich habe das nicht in Lean geschrieben, weil der Auftrag einen Ansatz verlangt, keine Formalisierung.

---

## 3. Was ρ ≤ 3 geometrisch heißt

### 3.1 Koordinaten

Nach (N1) darf man jedes Produkt so skalieren, dass α_t(e_{0,0}) = 1 (α_t durch α_t(e_{0,0}) teilen, C_t damit multiplizieren; (N1), (N2) bleiben erhalten, weil sich keine Träger ändern). Setze

- a_t := (α_t(e_{i,0}))_{i<4} ∈ K⁴, also a_t[0] = 1, und P_i = diag(a_t[i]),
- b_t := (β_t(e_{1,j}))_{j<4} ∈ K⁴ (Koeffizienten von Zeile 1 von B).

Dann ist J = {(⟨b_t, y⟩)_t : y ∈ K⁴} und f_i(e_1 y) = (a_t[i]·⟨b_t, y⟩)_t. Sei X := span{a_t ⊗ b_t : t < r} ⊆ K⁴ ⊗ K⁴. Die r×16-Matrix mit Zeilen a_t ⊗ b_t hat als Spaltenraum Σ_i f_i(U) und als Zeilenraum X, also **dim X = d = 4 + rk L**. Ich identifiziere (K⁴⊗K⁴)* mit 4×4-Matrizen G über (a ⊗ b) ↦ aᵀGb und schreibe X^⊥ für den Annullator (dim 16 − d).

### 3.2 Lemma A (Status behauptet)

Für γ ∈ K⁴ ∖ K·e_0 sind gleichwertig:
 (i) Σ_{i≥1} γ_i F_i ist nicht injektiv;
 (ii) es gibt x ∈ K⁴ ∖ 0 und y ∈ K⁴ mit G := γxᵀ − e_0yᵀ ∈ X^⊥.

*Beweis.* F_γ(e_1x) = 0 heißt Σ_i γ_i f_i(e_1x) ∈ J (der Summand i = 0 liegt ohnehin in J), also gibt es y mit ⟨a_t,γ⟩⟨b_t,x⟩ = ⟨b_t,y⟩ = a_t[0]⟨b_t,y⟩ für alle t, das ist a_tᵀ G b_t = 0 für alle t. ∎

### 3.3 Lemma B (Status behauptet): X^⊥ enthält keine Matrix vom Rang 1

*Beweis.* Wäre γyᵀ ∈ X^⊥ mit γ, y ≠ 0, so wäre Σ_i γ_i f_i(e_1y) = (⟨a_t,γ⟩⟨b_t,y⟩)_t = 0, im Widerspruch zu Folgerung 7. ∎

Also hat G aus Lemma A genau Rang 2 und den Spaltenraum span(γ, e_0).

### 3.4 Lemma C (Status behauptet): ρ ≤ 3 gilt für alle Ebenen

Für jede 2-dimensionale Ebene Λ ⊆ K⁴ gibt es G ∈ X^⊥ ∖ 0 mit Spaltenraum in Λ.

*Beweis.* Ein weiterer Basiswechsel nach R3 mit S′ ∈ GL_4 und T = I lässt die b_t fest und ersetzt a_t durch S′^{−⊤}a_t bis auf Skalierung; die S′, für die (N1) und (N2) gelten, enthalten nach Lemma 6, Schritt 4, eine nichtleere Zariski-offene, also dichte Teilmenge von GL_4. Für jedes solche S′ gilt Satz R, also ρ ≤ 3, und Lemma A liefert G für alle Ebenen durch den neuen Punkt e_0, das ist im alten System ein Punkt u′, der eine dichte offene Teilmenge von K⁴ durchläuft. Die Ebenen durch solche u′ bilden eine dichte Teilmenge der Grassmannschen G(2,4). Die Bedingung „X^⊥ ∩ (Λ ⊗ K⁴) ≠ 0“ ist abgeschlossen in Λ (Rangabfall eines linearen Systems). Also gilt sie für alle Λ. ∎

Dasselbe mit dem Basiswechsel T ∈ GL_2 gibt die Aussage für die ganze Familie X_p := span{(p_0a_t + p_1a′_t) ⊗ (p_0b_t − p_1b⁰_t)} (a′_t Spalte-1-Koeffizienten von α_t, b⁰_t Zeile-0-Koeffizienten von β_t) für p aus einer dichten offenen Menge von P¹. Die Transpositionssymmetrie (A, B, C) ↦ (Bᵀ, Aᵀ, Cᵀ) von ⟨4,2,4⟩ gibt für generisches p zusätzlich die Zeilenfassung: für jede Ebene Λ′ der b-Seite ein G ∈ X_p^⊥ ∖ 0 mit Zeilenraum in Λ′. (Rechnung: die transponierte Zerlegung hat als X-Raum gerade X_{p^⊥}ᵀ mit p^⊥ = (−p_1, p_0).)

### 3.5 Folgerung D: was in den Fällen R1 bis R4 übrig bleibt

- **Fall R1 (d = 7):** Lemma C ist leer, denn dim X^⊥ = 9 und 9 + 8 > 16. Die Bedingung ρ ≤ 3 sagt hier nichts Neues (ρ ≤ rk L = 3 ist trivial). Übrig bleiben die Gleichheiten in (1) und Lemma 13. Aus Gleichheit in (1) folgt, dass Φ (Prosa Abschnitt 5) **surjektiv auf im L × Q³** ist. Daraus: alle F_i bilden in denselben 3-dimensionalen Raum Q_0 = im L ab, und mit G := g mod J ist u ↦ (G(u_1), G(u_2), G(u_3)) mod Q_0 auf ker L ⊆ U³ (Dimension 9) surjektiv auf (Q/Q_0)³ (Dimension 6), weil im H ⊆ Q_0³. Status behauptet, Herleitung eine Zeile aus (1) und Lemma 10.
- **Fälle R2 bis R4 (d ∈ {8, 9}):** Y := X^⊥ hat Dimension 8 bzw. 7, enthält keine Matrix vom Rang 1 (Lemma B), aber für jede Ebene Λ ⊆ K⁴ eine Matrix vom Rang 2 mit Spaltenraum Λ (Lemma C), für generisches p auch mit jedem Zeilenraum. Die Rang-≤2-Matrizen in P(Y) bilden also eine Varietät der Dimension ≥ 4 = dim G(2,4), erwartet wären 7 − 4 = 3 bzw. 6 − 4 = 2. Y muss also sehr speziell sein.

**Beispiel E (Status behauptet, Rechnung von Hand).** Folgerung D allein gibt noch keinen Widerspruch: Y = Alt_4 ⊕ ⟨S_1, S_2⟩ mit schiefsymmetrischen Matrizen Alt_4 (Dimension 6) und einem allgemeinen Büschel symmetrischer Matrizen S_1, S_2 (Charakteristik ≠ 2) hat keine Rang-1-Elemente (sonst enthielte das Büschel eine symmetrische Matrix vom Rang ≤ 2, Kodimension 3 in P⁹), und u∧v hat Spalten- und Zeilenraum span(u,v). Y^⊥ besteht aus symmetrischen Matrizen mit tr(S S_1) = tr(S S_2) = 0, die Punkte (a_t, b_t) müssten b_t ∥ a_t erfüllen und auf dem Schnitt der Quadriken aᵀS_1a = aᵀS_2a = 0 liegen, einer elliptischen Raumkurve vom Grad 4. Ob so ein Bild zu einer echten Zerlegung passt, habe ich nicht untersucht.

**Vermutung D′ (Status vermutet).** In den Fällen R2 bis R4 ist Y bis auf Basiswechsel von der Form Alt_4·Ψ ⊕ (Rest), das heißt b_t ∥ Ψa_t für alle t. Hinweis: Eine Geradenfamilie in Y über G(2,4), die linear in den Plücker-Koordinaten ist, ist ein Schnitt von S^*⊗K⁴ (S tautologisches Bündel), und H⁰(S^*) = K⁴*; das gibt genau die Form Λ ↦ (u∧v)·Ψ. Höhere Grade habe ich nicht ausgeschlossen.

---

## 4. Stützrechnungen

Ich habe Yangs Kenngrößen an bekannten Verfahren ausgerechnet: zufälliger Basiswechsel (S, T) als Normalisierung, alle Ränge exakt über F_1000003, je drei Zufallsnormalisierungen mit gleichem Ergebnis. Die Verfahren haben ganzzahlige Koeffizienten und gelten über jedem Körper. Es sind Werte einer Normalisierung über diesem Primkörper; dass sie die generischen Werte sind, ist **vermutet**.

| Verfahren | r | dim ker W | dim Q | ρ | rk L | rk H | d |
|---|---|---|---|---|---|---|---|
| `verfahren/4x2x4-r26-s001.json` | 26 | 10 | 6 | **4** | 6 | 11 | 10 |
| 4× Strassen auf 2×2-Blöcken | 28 | 12 | 8 | **4** | 8 | 12 | 12 |
| 2× Strassen + 2× Schulmethode | 30 | 14 | 10 | **4** | 10 | 12 | 14 |
| Schulmethode | 32 | 16 | 12 | **4** | 12 | 12 | 16 |

Beobachtungen:

- In allen bekannten Verfahren ist ρ = m = 4. Satz R sagt: ein 25er müsste ρ = 3 haben. Das ist die schärfste Trennlinie, die ich gefunden habe.
- Beim 26er ist rk L = dim Q = 6 (L surjektiv), (1) hat Abstand 1, Lemma 13 Abstand 4. Ein 25er bräuchte rk L ≤ 5 bei ρ = 3.
- Beim 26er ist für zufälliges p der Raum S_p (Spaltenraum zu X_p) schon ganz ker W (dim 10), und S_p + S_q + S_s ändert daran nichts. Für p = (1,0), (0,1), (1,1) ist dim S_p = 3, 4, 3 (nicht normalisiert, daher kleiner als Yangs Schranke 7).
- Warnung zur Reichweite von Lemma ρ: Bei Strassens ⟨2,2,2⟩ (r = 7) ist dim Q = 1 < m = 2, also ρ < m. Eine Aussage „ρ = m immer“ ist für andere Formate falsch. Lemma ρ muss die Länge 6m + 1 benutzen.

Rechenaufwand: unter einer Minute auf einem Kern. Der Code steht im Anhang.

---

## 5. Sackgassen

1. **Lemma 14 auf ρ ≥ 4 heben.** Yangs Beweis wählt 3 Koordinaten I, auf die J surjektiv projiziert, und ein γ, das die a_t mit t ∈ I annulliert. Mit |I| = 4 bräuchte man 4 linear abhängige a_t unter Koordinaten, auf denen J bijektiv projiziert. Das ist nicht erzwungen. Aufgegeben.
2. **Umformulierung r = 16 + dim span{φ_t}** mit φ_t = Bild von α_t ⊗ β_t in K⁴ ⊗ sl_2* ⊗ K⁴. Das ist nur die bekannte Charakterisierung „Spann von r Rang-1-Tensoren enthält die 16 Scheiben“ in anderer Form und gibt nichts Neues. Aufgegeben.
3. **Lemma C im Fall R1.** Bei d = 7 ist die Bedingung „ρ ≤ 3“ leer. Fall R1 braucht ein anderes Werkzeug, nämlich die beiden Gleichheiten (Abschnitt 3.5).
4. **Struktur von Y über Dimensionszählung allein.** Die Zählung zeigt nur, dass Y speziell ist, nicht dass es Y nicht gibt (Beispiel E).

---

## 6. Status der Aussagen

| Aussage | Status |
|---|---|
| Satz R (ρ = 3 und Fälle R1 bis R4 bei r = 25), Folgerung R′ | behauptet |
| Lemma A, B, C, Folgerung D (Fall R1: Φ surjektiv; R2 bis R4: Y ohne Rang 1, alle Spaltenräume) | behauptet |
| Beispiel E | behauptet |
| Lemma ρ, Vermutung D′ | vermutet |
| Tabelle in Abschnitt 4 als generische Werte | vermutet |
| R(⟨4,2,4⟩) = 25 oder 26 | offen, keine neue Aussage |

Keine dieser Aussagen ändert eine Schranke. Satz R ist eine Fallunterscheidung, die Abbruchregel 2a erst dann berührt, wenn ein benannter Fall R1 bis R4 ausgeschlossen und geprüft ist.

---

## 7. Vorschlag für den nächsten Schritt

1. **Formalisierer:** Satz R in Lean, direkt aus `ineq1`, `lemma13`, `lemma14`, `rkComb_le`, `range_Lq_le_Kbar`, `finrank_Kbar`. Aufwand klein. Dann ist die Fallunterscheidung R1 bis R4 geprüft und jeder spätere Ausschluss eines Falls ein benannter Fortschritt.
2. **Beweissucher (Spur A), ein Auftrag pro Fall:**
   - R1 (rk L = 3, d = 7): Surjektivität von Φ auf im L × Q³ zusammen mit Folgerung 7 und Lemma 9 zum Widerspruch führen. Das ist der Fall mit den meisten Gleichheiten.
   - R2 bis R4 (d ∈ {8, 9}): Unterräume Y ⊂ K^{4×4} der Dimension 7 oder 8 ohne Rang-1-Elemente, deren Rang-2-Elemente alle Spalten- und Zeilenräume treffen, klassifizieren (Vermutung D′), dann den schiefen Fall b_t ∥ Ψa_t mit (N2) und den Gleichungen für Spalte 1 zum Widerspruch führen oder daraus ein 25er bauen (Protokoll 3, Stufe 2 erlaubt beide Richtungen).
3. **Konstruktionsrichtung:** Wer ein 25er sucht, sollte gezielt in der Klasse mit ρ = 3 suchen, etwa mit dem Ansatz aus Beispiel E (b_t ∥ a_t, Punkte auf einer elliptischen Quartik). Alle bekannten Verfahren liegen in der Klasse ρ = 4, die Satz R ausschließt.
4. Lemma ρ würde zugleich ⟨4,2,5⟩ ≥ 32 geben. Es lohnt sich, den Fall m = 5 im Blick zu behalten.

---

## 8. Offenlegung: was ich trotz Blindheit gesehen habe

- Das Projektgedächtnis wurde automatisch geladen, mit dem Index und fünf Einträgen zu Stufe 2 (S2-01, S2-03, S2-04, S2-08, S2-11), die mir die Plattform ohne mein Zutun angezeigt hat. Inhalt, soweit erinnerlich: Flip-Graph-Suchen über F_2, F_3, F_5 und ℤ fanden nur 26er, die 26er sind fast starr; ALS über ℝ und ℂ fand nie 25; ein Substitutionslemma „Lemma M“ mit r ≥ 16 + S_mid; ein „Lemma τ“ zu τ-invarianten Verfahren in Charakteristik 2; SAT-Ausschlüsse für σ-invariante Verfahren (B-011, behauptet) und eine Symmetrie ungerader Ordnung über GF(2) (S2-08); Behauptungen B-008 bis B-011 existieren, Inhalt von B-008 und B-009 nicht gesehen; Spur A und B nach Abbruchregel 2 angehalten.
- `git log` zeigte Commit-Titel, darunter „S2-08: … Symmetrie ungerader Ordnung über GF(2)“ und „Halt nach Abbruchregel 2“.
- Das Verfahren `verfahren/4x2x4-r26-s001.json` habe ich geöffnet; sein Notizfeld nennt Hopcroft-Kerr 1971 und einen „Perminov-Katalog“.
- CLAUDE.md Punkt 7 verlangt, `versuche/` vor jedem Ansatz zu lesen. Der Auftrag verbietet das für Blind-Sucher. Ich bin dem Auftrag gefolgt (Protokoll Abschnitt 4: Blind-Sucher sehen nur die Problemstellung). Es ist also möglich, dass Teile dieses Berichts frühere Versuche wiederholen.

Einfluss nach meiner Einschätzung: Mein Ansatz (Restfall von Yangs Ungleichungen) kommt aus `yang_n4.md`, nicht aus diesen Hinweisen. Die Bemerkung in Sackgasse 2 ähnelt dem Substitutionsgedanken von „Lemma M“; ich habe sie nicht weiterverfolgt. Suchverfahren habe ich nicht benutzt.

---

## Anhang: Rechencode (Python 3, nur Standardbibliothek)

`yang.py` berechnet für ein Verfahren im Datenformat von `verfahren/` (Konvention Σ_t u_t(A) v_t(B) w_t = AB) nach zufälliger Normalisierung dim ker W, dim J, ρ (Maximum über 5 Zufalls-γ), rk L, rk H und d, alles modulo 1000003.

```python
P = 1000003
def rank(rows, p=P):
    M = [[x % p for x in r] for r in rows]
    if not M: return 0
    n = len(M[0]); r = 0
    for c in range(n):
        piv = next((i for i in range(r, len(M)) if M[i][c]), None)
        if piv is None: continue
        M[r], M[piv] = M[piv], M[r]
        inv = pow(M[r][c], p-2, p); M[r] = [x*inv % p for x in M[r]]
        for i in range(len(M)):
            if i != r and M[i][c]:
                f = M[i][c]; M[i] = [(a-f*b) % p for a, b in zip(M[i], M[r])]
        r += 1
    return r

def invariants(S, rnd):
    # S: list of (u 4x2, v 2x4, w 4x4) integer lists; rnd: random.Random
    r = len(S)
    Si = rand_invertible(4, rnd); T = rand_invertible(2, rnd)        # S^{-1}, T
    Sm, Ti = matinv(Si), matinv(T)
    S2 = [(mm(mm(tr(Si), u), tr(T)), mm(tr(Ti), v), mm(Sm, w)) for u, v, w in S]
    Wrows = [[S2[t][2][a][b] for t in range(r)] for a in range(4) for b in range(4)]
    K = nullspace(Wrows, r)                                            # ker W
    f = lambda i, y: [S2[t][0][i][0] * sum(S2[t][1][1][j]*y[j] for j in range(4)) % P
                      for t in range(r)]
    E = [[int(i == j) for j in range(4)] for i in range(4)]
    J = [f(0, e) for e in E]
    def rkF(g): return rank(J + [[sum(g[i]*f(i+1, e)[t] for i in range(3)) % P
                                   for t in range(r)] for e in E]) - 4
    rho = max(rkF([rnd.randrange(P) for _ in range(3)]) for _ in range(5))
    rkL = rank(J + [f(i, e) for i in (1, 2, 3) for e in E]) - 4
    z = [0]*r; neg = lambda v: [(-x) % P for x in v]
    Hv = []                                   # c = (c12, c13, c23), H1=F2c12+F3c13, ...
    for e in E:
        Hv += [f(2, e) + neg(f(1, e)) + z, f(3, e) + z + neg(f(1, e)), z + f(3, e) + neg(f(2, e))]
    J3 = [j+z+z for j in J] + [z+j+z for j in J] + [z+z+j for j in J]
    rkH = rank(J3 + Hv) - 12
    d = rank([f(i, e) for i in range(4) for e in E])
    return dict(r=r, dimKerW=len(K), dimQ=len(K)-rank(J), rho=rho, rkL=rkL, rkH=rkH, d=d)
```

Hilfsfunktionen (`matinv`, `mm`, `tr`, `nullspace`, `rand_invertible`) sind Gauß-Elimination und Matrixprodukt modulo P. Die Verfahren mit 28, 30 und 32 Produkten habe ich aus Strassens 7 Produkten auf den vier 2×2-Blöcken C_{IJ} = A_I B_J und aus der Schulmethode zusammengesetzt und vor der Rechnung gegen die Definition geprüft.
