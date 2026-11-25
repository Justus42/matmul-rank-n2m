# Prosa-Beweis: R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉ (Yang v3, Satz 1)

- Auftrag: S1-02, Stufe 1, Runde 1
- Rolle: Beweissucher
- Datum: 25.11.2026
- Status des ganzen Beweises: **behauptet**
- Quelle: Jason Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*, arXiv:2609.14393v3 vom 12.10.2026, Abschnitte 2, 3 und 4.1 (Volltext über alphaXiv gelesen am 25.11.2026). Der Satz ist Yangs Satz, diese Datei arbeitet nur seinen Beweis aus (Protokoll Abschnitt 9).
- Zweck: Vorlage für die Lean-Formalisierung. Jeder Schritt soll ohne das Paper umsetzbar sein.

---

## 0. Ergebnis der Durchsicht in Kürze

1. **Keine Lücke gefunden, die die Aussage gefährdet.** Jeder Schritt des Papers für n = 3 ließ sich lückenlos ausschreiben. Abbruchregel 4 ist aus Sicht dieses Auftrags nicht berührt. Das ist ein Urteil des Beweissuchers (Status behauptet), keine Prüfung.
2. **Sechs Ungenauigkeiten** im Paper, alle ohne Einfluss auf das Ergebnis, sind in Abschnitt 11 gesammelt (U-1 bis U-6). Die erheblichste: Die Formel für den Basiswechsel in Abschnitt 2 des Papers ist falsch notiert (U-1). Die richtige Formel steht hier in R3.
3. **Für n = 3 braucht der Beweis nur einen unendlichen Körper**, keinen algebraisch abgeschlossenen. Lemma 9 des Papers (das einzige mit algebraischem Abschluss) wird für n = 3 nicht benutzt.
4. **Der Beweis gilt schon ab m ≥ 2** (behauptet, Abschnitt 8). Das Paper verlangt m ≥ 3, weil es den Fall n = 3 als Teil von m ≥ n formuliert.
5. **Verhältnis zum Lean-Satz von Tsyganov u. a.:** Deren Satz liefert 5R ≥ 24m + 1. Das ergibt Yangs Schranke bereits für alle m mit m ≢ 1 (mod 5). Neu ist Yangs Argument nur für m ≡ 1 (mod 5), also m = 6, 11, 16, … Darunter fällt genau 3×2×6. Einzelheiten in Abschnitt 10.
6. Eine Zahlenprobe der Zwischengrößen an den HK-Verfahren für 3×2×5 und 3×2×6 aus `verfahren/` passt zu allen Ungleichungen (Abschnitt 12). Sie ist kein Beweis.

---

## 1. Der Satz

**Satz (Yang v3, Satz 1).** Sei F ein Körper und m ≥ 3. Dann gilt R_F(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉.

Gleichwertig, weil R eine ganze Zahl ist: **5·R ≥ 24m + 2** für jede Zerlegung der Länge R.

**Definition (Zerlegung, Rang).** Eine Zerlegung der Länge R von ⟨3,2,m⟩ über F besteht aus

- Linearformen α_r : F^{3×2} → F,
- Linearformen β_r : F^{2×m} → F,
- Matrizen C_r ∈ F^{3×m},

für r = 0, …, R−1, so dass für alle A ∈ F^{3×2}, B ∈ F^{2×m} gilt:

  AB = Σ_r α_r(A) β_r(B) C_r.                                                        (Z)

R_F(⟨3,2,m⟩) ist die kleinste Länge einer Zerlegung. Das ist dieselbe Definition wie Gleichung (1) in TPSR26 und wie `matrix_algorithm_rank_ge25` im Lean-Repo von Tsyganov u. a. (siehe `lean/NACHBAU.md`, `behauptungen/B-001.md`).

Was zu formalisieren ist: Für jeden Körper F, jedes m ≥ 3 (oder m ≥ 2) und jede Zerlegung der Länge R gilt 24m + 2 ≤ 5R.

---

## 2. Bezeichnungen

Indizes zählen ab 0. Zeilen von A heißen 0, 1, 2, Spalten 0, 1. Zeilen von B heißen 0, 1.

- e_{i,j} ist die Matrix mit einer 1 an Stelle (i, j) und sonst 0. Ihre Größe ergibt sich aus dem Zusammenhang. Wo es zählt, steht sie dabei: e_{i,j}^{(3×2)} oder e_{0,1}^{(2×2)}.
- F^R ist der Raum der Spaltenvektoren der Länge R (in Lean `Fin R → F`).
- D(A) ∈ F^{R×R} ist die Diagonalmatrix mit Einträgen α_0(A), …, α_{R−1}(A). D ist linear in A.
- ℬ(B) ∈ F^R ist der Vektor (β_0(B), …, β_{R−1}(B)). ℬ ist linear.
- W : F^R → F^{3×m}, W(t) = Σ_r t_r C_r. W ist linear.

Mit diesen Bezeichnungen ist (Z) gleichwertig zu

  W(D(A) ℬ(B)) = AB  für alle A, B.                                               (Z')

**Rechenregeln, die immer wieder gebraucht werden:**

- (D1) Diagonalmatrizen kommutieren: D(A)D(A') = D(A')D(A).
- (D2) Aus (Z') und Linearität: W(D(A) ℬ(y)) = Ay für jedes y ∈ F^{2×m}.

---

## 3. Reduktionen (ohne Einschränkung)

Jede Reduktion macht aus einer Zerlegung der Länge R eine Zerlegung der Länge **höchstens** R mit einer Zusatzeigenschaft. Weil wir eine untere Schranke für R zeigen, reicht es, sie für die reduzierte Zerlegung zu zeigen.

### R1: F ist unendlich

Ist K ⊇ F eine Körpererweiterung, dann ist jede Zerlegung über F auch eine Zerlegung über K derselben Länge: Man setzt die Koeffizienten der α_r, β_r, C_r unverändert ein. Die Identität (Z) ist bilinear in (A, B). Sie gilt deshalb genau dann, wenn sie für alle Paare von Basismatrizen (e_{a,b}, e_{c,d}) gilt. Das ist ein endliches System von Gleichungen zwischen den Koeffizienten, das sich bei Körpererweiterung nicht ändert. Also R_K ≤ R_F, und eine untere Schranke über K gilt auch über F.

Als K genügt jeder unendliche Erweiterungskörper, etwa der algebraische Abschluss (Yang) oder der Körper der rationalen Funktionen F(t) (so TPSR26).

> Ungenauigkeit U-2: Das Paper sagt nur „otherwise we can replace 𝔽 with its algebraic closure“ und begründet nicht, warum der Rang dabei nicht steigt. Die Begründung oben ist kurz und vollständig.

**Für Lean:** Stellt man Linearformen durch Koeffizientenmatrizen dar (α_r(A) = Σ a_{r,ij} A_{ij}), ist der Übergang ein `Matrix.map` mit dem Körperhomomorphismus F → K. Die Identität (Z) zwischen den Koeffizienten lautet

  Σ_r a_{r,ij} · b_{r,j'l} · c_{r,i'l'} = [i = i'] · [j = j'] · [l = l']

und bleibt unter einem injektiven Ringhomomorphismus erhalten.

### R2: Kein α_r ist die Nullform

Ist α_r = 0, dann trägt der Term r in (Z) nichts bei und kann gestrichen werden. Die Länge sinkt um 1. Nach endlich vielen Schritten ist kein α_r mehr die Nullform.

### R3: Basiswechsel

Seien S ∈ F^{3×3} und T ∈ F^{2×2} invertierbar. Setze

  α'_r(A) := α_r(S A T),  β'_r(B) := β_r(T^{−1} B),  C'_r := S^{−1} C_r.

Dann ist (α', β', C') wieder eine Zerlegung derselben Länge, denn

  Σ_r α_r(SAT) β_r(T^{−1}B) S^{−1}C_r = S^{−1} · (SAT)(T^{−1}B) = AB.

Es gilt D'(A) = D(SAT), ℬ'(B) = ℬ(T^{−1}B), W' = S^{−1} ∘ W. Insbesondere ker W' = ker W. Ist kein α_r die Nullform, gilt das auch für α'_r.

> Ungenauigkeit U-1: Das Paper (Abschnitt 2) schreibt (α_r(S^{−1}AT), β_r(T^{−1}B), S^{−1}C_r). Damit ergibt die Summe S^{−2}AB statt AB. Richtig ist entweder die Form oben oder (α_r(S^{−1}AT), β_r(T^{−1}B), S C_r). Für den Beweis zählt nur, dass ein passender Basiswechsel existiert. Das ist ein Schreibfehler, keine Lücke.

---

## 4. Grundtatsachen

Ab hier sei eine Zerlegung der Länge R gegeben.

**G1. ℬ ist injektiv.** Ist ℬ(B) = 0, dann AB = W(D(A)·0) = 0 für alle A. Mit A = e_{0,0}^{(3×2)} und A = e_{0,1}^{(3×2)} folgt, dass beide Zeilen von B null sind, also B = 0.

**G2. W ist surjektiv.** Für jedes (i, l) ist e_{i,l}^{(3×m)} = e_{i,0}^{(3×2)} · e_{0,l}^{(2×m)} = W(D(e_{i,0}) ℬ(e_{0,l})). Also liegt jede Basismatrix im Bild.

**G3. dim ker W = R − 3m.** Aus G2 und der Dimensionsformel (Rang plus Defekt).

**G4. Ist D(e_{0,0}) invertierbar** (das heißt α_r(e_{0,0}) ≠ 0 für alle r), dann ist f_0 := D(e_{0,0}) ∘ ℬ injektiv. Das folgt aus G1.

---

## 5. Starke Normalisierung (Paper Abschnitt 3, nur der Fall k = 3, l = 2)

Für i = 0, 1, 2 sei

  f_i : F^{2×m} → F^R,  f_i(v) := D(e_{i,0}^{(3×2)}) ℬ(v).

**Definition (stark normalisiert).** Die Zerlegung heißt stark normalisiert, wenn

- (SN1) D(e_{0,0}) invertierbar ist, und
- (SN2) für jedes v ∈ F^{2×m} mit v ≠ 0 die drei Vektoren f_0(v), f_1(v), f_2(v) linear unabhängig sind.

### Lemma A (= Paper Lemma 6). 

*Voraussetzungen:* F unendlich, kein α_r ist die Nullform. *Aussage:* Es gibt einen Basiswechsel nach R3, nach dem die Zerlegung stark normalisiert ist.

*Beweis.* Schreibe Vektoren a ∈ F^3 als Spalten und p ∈ F^{1×2} als Zeilen, sodass ap ∈ F^{3×2} eine Matrix vom Rang ≤ 1 ist.

*Schritt 1 (eine Bedingung an (u, p)).* Für jedes r ist (u, p) ↦ α_r(up) = Σ_{i,j} a_{r,ij} u_i p_j ein Polynom in den fünf Variablen u_0, u_1, u_2, p_0, p_1. Es ist nicht das Nullpolynom, weil seine Koeffizienten genau die a_{r,ij} sind und α_r ≠ 0 ist. Also ist auch das Produkt

  P_1(u, p) := Π_r α_r(up)

nicht das Nullpolynom (Polynomringe über Körpern sind nullteilerfrei).

*Schritt 2 (Injektivität für ein festes v).* Für v ∈ F^{2×m} sei supp(v) := {r : ℬ(v)_r ≠ 0}. Für eine Teilmenge Σ ⊆ {0, …, R−1} und p ∈ F^{1×2} sei M_Σ(p) die |Σ| × 3-Matrix mit Einträgen (M_Σ(p))_{r,i} = α_r(e_i p) für r ∈ Σ, i = 0, 1, 2. Ihre Einträge sind linear in p.

Behauptung 2a: Die Abbildung a ↦ D(ap) ℬ(v) (von F^3 nach F^R) ist genau dann injektiv, wenn M_{supp(v)}(p) Rang 3 hat. Grund: Der r-te Eintrag von D(ap)ℬ(v) ist α_r(ap) · ℬ(v)_r. Für r ∉ supp(v) ist er 0, für r ∈ supp(v) ist er genau dann 0, wenn α_r(ap) = (M_{supp(v)}(p) a)_r = 0 ist.

Behauptung 2b: Ist v ≠ 0 und pv ≠ 0 (als Zeile in F^{1×m}), dann ist a ↦ D(ap)ℬ(v) injektiv. Grund: Aus D(ap)ℬ(v) = 0 folgt mit (D2) 0 = W(D(ap)ℬ(v)) = (ap)v = a(pv). Weil pv ≠ 0, folgt a = 0.

*Schritt 3 (endlich viele Bedingungen an p).* Es gibt nur endlich viele Teilmengen Σ ⊆ {0, …, R−1}. Sei 𝒮 die Menge der Σ, die als supp(v) für ein v ≠ 0 vorkommen. Für jedes Σ ∈ 𝒮 wähle ein v_Σ ≠ 0 mit supp(v_Σ) = Σ und ein p_Σ mit p_Σ v_Σ ≠ 0 (gibt es, weil v_Σ ≠ 0). Nach 2b und 2a hat M_Σ(p_Σ) Rang 3. Also gibt es drei Zeilen r_1, r_2, r_3 ∈ Σ, deren 3×3-Minor bei p_Σ nicht verschwindet. Dieser Minor q_Σ(p) ist ein Polynom in p_0, p_1 und nicht das Nullpolynom.

> Ungenauigkeit U-3: Das Paper sagt „non-constant polynomial“. Gebraucht wird nur „nicht das Nullpolynom“. (Der Minor ist homogen vom Grad 3 und daher tatsächlich nicht konstant, das spielt aber keine Rolle.)

*Schritt 4 (Wahl).* Das Polynom P(u, p) := P_1(u, p) · Π_{Σ ∈ 𝒮} q_Σ(p) ist nicht das Nullpolynom. Weil F unendlich ist, gibt es (u, p) ∈ F^3 × F^{1×2} mit P(u, p) ≠ 0. Dann gilt:

- α_r(up) ≠ 0 für alle r. Insbesondere up ≠ 0, also u ≠ 0 und p ≠ 0.
- Für jedes v ≠ 0 ist q_{supp(v)}(p) ≠ 0, also hat M_{supp(v)}(p) Rang 3, also ist a ↦ D(ap)ℬ(v) injektiv (2a).

*Schritt 5 (Basiswechsel).* Ergänze u = u_0 zu einer Basis u_0, u_1, u_2 von F^3 und p zu einer Basis von F^{1×2}. Sei S die Matrix mit den Spalten u_0, u_1, u_2 und T die invertierbare 2×2-Matrix mit erster Zeile p. Dann ist S e_{i,0}^{(3×2)} T = u_i · (erste Zeile von T) = u_i p. Nach dem Basiswechsel R3 gilt also

  D'(e_{i,0}) = D(u_i p),  ℬ'(v) = ℬ(T^{−1} v),  f'_i(v) = D(u_i p) ℬ(T^{−1} v).

(SN1): D'(e_{0,0}) = D(up) ist invertierbar.
(SN2): Sei v ≠ 0 und w := T^{−1}v ≠ 0. Ist Σ_i γ_i f'_i(v) = 0, dann D((Σ_i γ_i u_i) p) ℬ(w) = 0. Nach Schritt 4 folgt Σ_i γ_i u_i = 0, und weil die u_i eine Basis sind, γ = 0. ∎

> Ungenauigkeit U-4: Das Paper sagt nur „apply a change of basis that maps u_i p ↦ e_{i,0}“. Dass dafür T eine Matrix mit erster Zeile p sein muss, steht nicht da. Schritt 5 ergänzt das.

**Für Lean:** Schritt 4 braucht den Satz „ein von 0 verschiedenes Polynom in endlich vielen Variablen über einem unendlichen Integritätsbereich hat eine Stelle, an der es nicht verschwindet“. In mathlib gibt es dazu Aussagen über `MvPolynomial` über unendlichen Integritätsbereichen (etwa `MvPolynomial.funext`). Den genauen Namen stellt der Formalisierer fest. Statt eines Produkts von Minoren kann man auch für jedes Σ ∈ 𝒮 den Minor als `Matrix.det` der Untermatrix nehmen. Die Menge 𝒮 kann man durch alle Teilmengen Σ ersetzen, für die ein v ≠ 0 mit supp(v) = Σ existiert (klassisch entscheidbar, `Finset.filter` mit `Classical.dec`).

### Lemma B (= Paper Lemma 8, Fall k = 3).

*Voraussetzung:* Die Zerlegung ist stark normalisiert. *Aussage:* Für jeden Unterraum S ⊆ F^{2×m} mit S ≠ 0 gilt

  dim(f_0(S) + f_1(S) + f_2(S)) ≥ dim S + 2.

*Beweis.* Sei P_i := D(e_{i,0}) D(e_{0,0})^{−1}. Das ist eine Diagonalmatrix, und f_i = P_i ∘ f_0. Sei E_j ⊆ F^R (j = 0, …, R) der Raum der Vektoren, deren Einträge mit Index ≥ j null sind. Dann 0 = E_0 ⊂ E_1 ⊂ … ⊂ E_R = F^R, dim E_j = j, und jede Diagonalmatrix bildet jedes E_j in sich ab.

Weil f_0 injektiv ist (G4) und S ≠ 0, ist f_0(S) ≠ 0. Sei j minimal mit X := f_0(S) ∩ E_j ≠ 0 (es gibt ein solches j, weil E_R = F^R; j ≥ 1). Dann ist dim X = 1: Die Abbildung X → E_j / E_{j−1} ist injektiv, weil X ∩ E_{j−1} = 0 nach Minimalität von j, und E_j / E_{j−1} hat Dimension 1.

Also X = span{f_0(v)} für ein v ∈ S, v ≠ 0. Setze T := span{f_0(v), f_1(v), f_2(v)}. Nach (SN2) ist dim T = 3. Weil f_0(v) ∈ E_j und f_i(v) = P_i f_0(v), liegt T in E_j. Also f_0(S) ∩ T ⊆ f_0(S) ∩ E_j = X, und X ⊆ T. Damit f_0(S) ∩ T = X und

  dim(f_0(S) + T) = dim f_0(S) + dim T − dim X = dim S + 3 − 1.

Weil f_0(S) + T ⊆ f_0(S) + f_1(S) + f_2(S), folgt die Behauptung. ∎

Paper-Korollar 7 und Lemma 9 werden für n = 3 nicht gebraucht.

---

## 6. Die Hauptkonstruktion (Paper Abschnitt 2 und 4, n = 3)

Ab hier sei die Zerlegung stark normalisiert (nach R1, R2, Lemma A). Alle Räume sind endlichdimensional.

**Räume und Abbildungen.**

- U := {x ∈ F^{2×m} : Zeile 0 von x ist null}. dim U = m.
- f_0, f_1, f_2 wie in Abschnitt 5.
- g : F^{2×m} → F^R, g(x) := D(e_{0,1}^{(3×2)}) ℬ(x) − D(e_{0,0}^{(3×2)}) ℬ(e_{0,1}^{(2×2)} x).
  Dabei ist e_{0,1}^{(2×2)} x die Matrix, deren Zeile 0 die Zeile 1 von x ist und deren Zeile 1 null ist.
- K := ker W ⊆ F^R. dim K = R − 3m (G3).
- J := f_0(U). dim J = m (G4).
- Q := K / J. Setze q := dim Q.

**Lemma C (Inklusionen).** Für x ∈ U gilt f_0(x), f_1(x), f_2(x), g(x) ∈ K. Insbesondere J ⊆ K und q = R − 4m.

*Beweis.* Nach (D2): W(f_i(x)) = e_{i,0}^{(3×2)} x. Das ist die 3×m-Matrix, deren Zeile i die Zeile 0 von x ist, sonst null. Für x ∈ U ist das 0. Weiter W(g(x)) = e_{0,1}^{(3×2)} x − e_{0,0}^{(3×2)} e_{0,1}^{(2×2)} x = e_{0,1}x − e_{0,1}x = 0, weil e_{0,0}^{(3×2)} e_{0,1}^{(2×2)} = e_{0,1}^{(3×2)}. Aus J ⊆ K, dim K = R − 3m und dim J = m folgt q = R − 4m. ∎

Insbesondere ist R ≥ 4m. Das wird nicht gebraucht, folgt aber.

**Weitere Abbildungen.** Für y ∈ U schreibe [y] für die Klasse in Q. Definiere

- F_i : U → Q, F_i(x) := [f_i(x)] für i = 1, 2.
- ℓ : U² → K, ℓ(u_1, u_2) := f_1(u_1) + f_2(u_2).
- L : U² → Q, L(u) := [ℓ(u)] = F_1(u_1) + F_2(u_2).
- h : U → K², h(x) := (f_2(x), −f_1(x)).
- H : U → Q², H(x) := ([f_2(x)], [−f_1(x)]) = (F_2(x), −F_1(x)).
- N := ker H = ker F_1 ∩ ker F_2 ⊆ U.

> Ungenauigkeit U-5: Das Paper definiert h über einen Raum U^{∧2} schiefsymmetrischer 2×2-Matrizen mit Einträgen in U und schreibt dann h(x) = (−f_2(x), f_1(x)). Für d = 2 ist U^{∧2} ≅ U (die Matrix [[0, x], [−x, 0]] entspricht x). Mit der Definition h(c) = (ℓ(c_{1,:}), ℓ(c_{2,:})) des Papers ergibt sich h(x) = (f_2(x), −f_1(x)), also das entgegengesetzte Vorzeichen. Das Vorzeichen ändert weder Kern noch Rang. Diese Datei nutzt die Form oben und vermeidet U^{∧2} ganz.

**Die Abbildung Φ.**

  Φ : U² × U → im(L) × Q × Q,
  Φ(u_1, u_2, x) := ( [ℓ(u_1, u_2)],  [−g(u_1) + f_2(x)],  [−g(u_2) − f_1(x)] ).

Sie ist wohldefiniert und linear (Lemma C).

**Lemma D (Schiefe Auslöschung).** Für jedes x ∈ F^{2×m} gilt D(e_{1,0}) f_2(x) − D(e_{2,0}) f_1(x) = 0.

*Beweis.* Beide Terme sind D(e_{1,0}) D(e_{2,0}) ℬ(x), nach (D1). ∎

**Lemma E (Verschiebung).** Für alle i und y gilt D(e_{i,0}) f_0(y) = D(e_{0,0}) f_i(y).

*Beweis.* (D1). ∎

---

## 7. Der Kern von Φ und die Grundungleichung

### Lemma F (= Paper Lemma 10). ker Φ = {(0, 0, x) : x ∈ N}.

*Beweis.* „⊇“: Für x ∈ N ist Φ(0, 0, x) = (0, F_2(x), −F_1(x)) = 0.

„⊆“: Sei Φ(u_1, u_2, x) = 0. Dann gibt es y_0, y_1, y_2 ∈ U mit

  ℓ(u_1, u_2) = f_0(y_0),  −g(u_1) + f_2(x) = f_0(y_1),  −g(u_2) − f_1(x) = f_0(y_2).

Bilde D(e_{0,1}) · (erste Gleichung) + D(e_{1,0}) · (zweite) + D(e_{2,0}) · (dritte).

*Linke Seite.* Die Terme mit x fallen nach Lemma D weg. Es bleibt

  D(e_{0,1}) [D(e_{1,0})ℬ(u_1) + D(e_{2,0})ℬ(u_2)]
  − D(e_{1,0}) [D(e_{0,1})ℬ(u_1) − D(e_{0,0})ℬ(e_{0,1}u_1)]
  − D(e_{2,0}) [D(e_{0,1})ℬ(u_2) − D(e_{0,0})ℬ(e_{0,1}u_2)].

Nach (D1) heben sich die Terme mit D(e_{0,1})D(e_{i,0}) weg. Es bleibt

  D(e_{0,0}) [D(e_{1,0}) ℬ(e_{0,1}u_1) + D(e_{2,0}) ℬ(e_{0,1}u_2)].

*Rechte Seite.* Mit (D1) gleich D(e_{0,0}) [D(e_{0,1})ℬ(y_0) + D(e_{1,0})ℬ(y_1) + D(e_{2,0})ℬ(y_2)].

Weil D(e_{0,0}) invertierbar ist (SN1), darf man es kürzen:

  D(e_{1,0}) ℬ(e_{0,1}u_1) + D(e_{2,0}) ℬ(e_{0,1}u_2) = D(e_{0,1})ℬ(y_0) + D(e_{1,0})ℬ(y_1) + D(e_{2,0})ℬ(y_2).

W anwenden, mit (D2):

  e_{1,0} e_{0,1} u_1 + e_{2,0} e_{0,1} u_2 = e_{0,1} y_0 + e_{1,0} y_1 + e_{2,0} y_2.

Für y ∈ U ist e_{i,0}^{(3×2)} y = 0 (die Zeile 0 von y ist null). Außerdem e_{i,0}^{(3×2)} e_{0,1}^{(2×2)} = e_{i,1}^{(3×2)}. Also

  e_{1,1} u_1 + e_{2,1} u_2 = e_{0,1} y_0.

Links steht eine 3×m-Matrix mit Zeile 0 gleich null, Zeile 1 gleich Zeile 1 von u_1, Zeile 2 gleich Zeile 1 von u_2. Rechts steht eine Matrix, die nur in Zeile 0 von null verschieden sein kann. Also sind die Zeilen 1 von u_1 und u_2 null. Weil u_1, u_2 ∈ U, sind auch ihre Zeilen 0 null. Also u_1 = u_2 = 0.

Dann Φ(0, 0, x) = (0, F_2(x), −F_1(x)) = 0, also x ∈ N. ∎

### Folgerung (Grundungleichung, Paper Gl. 1 mit n = 3).

Setze rk L := dim im(L) und rk H := dim im(H). Dann

  2m + rk H ≤ rk L + 2q.                                                          (G)

*Beweis.* Dimensionsformel für Φ: dim im Φ = dim(U² × U) − dim ker Φ = 3m − dim N (Lemma F). Und dim im Φ ≤ dim(im L × Q × Q) = rk L + 2q. Dimensionsformel für H: dim N = m − rk H. Einsetzen ergibt (G). ∎

### Lemma G (= Paper Lemma 11, Fall d = 2). 2·rk H ≥ rk L.

*Beweis (direkt, einfacher als im Paper).* im L = im F_1 + im F_2, also rk L ≤ rk F_1 + rk F_2. Die Projektionen von im H auf die beiden Faktoren Q sind im F_2 und im F_1 (das Vorzeichen ändert das Bild nicht). Also rk H ≥ max(rk F_1, rk F_2) ≥ (rk F_1 + rk F_2)/2 ≥ rk L / 2. ∎

Das Paper beweist die allgemeine Fassung für beliebiges d über eine Bijektion μ. Für n = 3 genügt der direkte Beweis.

Mit Lemma G allein folgt aus (G): 2m ≤ rk L − rk H + 2q ≤ rk L / 2 + 2q ≤ q/2 + 2q, also 4m ≤ 5q = 5(R − 4m), also 5R ≥ 24m. Das ist die alte Schranke. Die Verbesserung braucht Abschnitt 8.

---

## 8. Die Verbesserung um 2

Setze Δ := 2·rk H − rk L. Nach Lemma G ist Δ ≥ 0.

Setze S := {x ∈ N : f_1(x) ∈ f_0(N) und f_2(x) ∈ f_0(N)}. Das ist ein Unterraum von N.

> Hinweis: Das Paper benutzt den Buchstaben S dreimal (Basiswechsel, Träger, dieser Unterraum). Hier heißt nur noch dieser Unterraum S.

### Lemma H (= Paper Lemma 12). dim S ≥ dim N − Δ.

*Beweis.* Sei x ∈ N. Dann F_1(x) = F_2(x) = 0, also f_1(x), f_2(x) ∈ J = f_0(U). Weil f_0 injektiv ist (G4), gibt es eindeutige σ_1(x), σ_2(x) ∈ U mit

  f_0(σ_1(x)) = f_2(x),  f_0(σ_2(x)) = −f_1(x).

σ := (σ_1, σ_2) : N → U² ist linear (Verkettung von h mit der Umkehrung von f_0 auf J).

*Schritt 1: σ(N) ⊆ ker ℓ ⊆ ker L.* Nach Lemma D und Lemma E:
0 = D(e_{1,0}) f_2(x) − D(e_{2,0}) f_1(x) = D(e_{1,0}) f_0(σ_1 x) + D(e_{2,0}) f_0(σ_2 x) = D(e_{0,0}) [f_1(σ_1 x) + f_2(σ_2 x)].
Kürzen von D(e_{0,0}) ergibt ℓ(σ(x)) = 0.

*Schritt 2: N × N ⊆ ker L.* Für (a, b) ∈ N × N ist L(a, b) = F_1(a) + F_2(b) = 0.

*Schritt 3: S = σ^{−1}(N × N).* Für x ∈ N gilt: f_2(x) = f_0(σ_1 x) liegt genau dann in f_0(N), wenn σ_1(x) ∈ N (Injektivität von f_0). Ebenso f_1(x) = f_0(−σ_2 x) ∈ f_0(N) genau dann, wenn σ_2(x) ∈ N.

*Schritt 4: Zählen.* σ : N → ker L und N × N ⊆ ker L. Die induzierte Abbildung N / σ^{−1}(N × N) → ker L / (N × N) ist injektiv. Also

  dim N − dim S ≤ dim ker L − 2·dim N = (2m − rk L) − 2(m − rk H) = 2·rk H − rk L = Δ. ∎

### Lemma I (Fallunterscheidung). Δ ≥ min(2, dim N).

*Beweis.* Ist S = 0, dann gibt Lemma H Δ ≥ dim N. Ist S ≠ 0: Es gilt f_0(S) ⊆ f_0(N) (weil S ⊆ N) und f_1(S), f_2(S) ⊆ f_0(N) (Definition von S). Also f_0(S) + f_1(S) + f_2(S) ⊆ f_0(N), und mit Lemma B: dim S + 2 ≤ dim f_0(N) = dim N. Mit Lemma H: Δ ≥ dim N − dim S ≥ 2. ∎

### Abschluss: 5R ≥ 24m + 2.

*Fall 1: Δ ≥ 2.* Dann rk H ≥ rk L / 2 + 1. Aus (G):
2m ≤ rk L − rk H + 2q ≤ rk L / 2 − 1 + 2q ≤ q/2 − 1 + 2q (weil rk L ≤ q).
Mal 2: 4m + 2 ≤ 5q = 5R − 20m. Also **5R ≥ 24m + 2**.

*Fall 2: Δ ≤ 1.* Nach Lemma I ist dann dim N ≤ Δ ≤ 1, also rk H = m − dim N ≥ m − 1. Aus (G) und rk L ≤ q:
2m + m − 1 ≤ 3q = 3R − 12m, also 3R ≥ 15m − 1, also R ≥ 5m − 1/3, und weil R ganz ist, **R ≥ 5m**. Für m ≥ 2 gilt 25m ≥ 24m + 2, also **5R ≥ 24m + 2**.

> Ungenauigkeit U-6: Das Paper schließt im Fall 2 nur dim N ≤ 2 und rechnet mit rk H ≥ m − 2. Das ist schwächer als nötig, aber richtig, und ergibt ebenfalls R ≥ 5m − 2/3, also R ≥ 5m.

In beiden Fällen 5R ≥ 24m + 2, also R ≥ ⌈(24m+2)/5⌉. Mit den Reduktionen R1 bis R3 gilt das für jede Zerlegung über jedem Körper. ∎

**Wo m ≥ 3 benutzt wird:** nirgends. Gebraucht wird nur m ≥ 2 im letzten Schritt von Fall 2 (behauptet). Für m = 1 versagt Fall 2 (R ≥ 5 statt 6). Für die Formalisierung empfehle ich, den Satz für m ≥ 2 zu beweisen und die Fassung m ≥ 3 als Folgerung zu notieren. Ob man die stärkere Fassung will, entscheidet der Orchestrator.

---

## 9. Abhängigkeiten

```
R1 (unendlicher Körper)   R2 (keine Nullform)   R3 (Basiswechsel)
          \                    |                  /
           \                   |                 /
            +------ Lemma A (starke Normalisierung) ----+
                                                         |
G1 (ℬ injektiv) -- G4 (f_0 injektiv) --------------------+
G2 (W surjektiv) -- G3 (dim ker W)                       |
                                                         |
Lemma B (Dimensionszuwachs) <---- SN1, SN2, G4           |
Lemma C (Inklusionen) <---- (D2)                         |
Lemma D, Lemma E <---- (D1)                              |
Lemma F (Kern von Φ) <---- C, D, SN1, (D2)               |
Ungleichung (G) <---- F, G3, G4                          |
Lemma G (2 rk H ≥ rk L) <---- Definitionen               |
Lemma H (dim S) <---- D, E, G4, SN1                      |
Lemma I (Δ ≥ min(2, dim N)) <---- B, H                   |
Abschluss <---- (G), G, I, C (q = R − 4m)
```

Reihenfolge für die Formalisierung: Definitionen und (D1), (D2) → G1 bis G4 → R3 → Lemma A (mit R1, R2) → Lemma B → Lemmata C bis E → Lemma F → (G) → G → H → I → Abschluss → R1 zum Schluss als Übertragung auf beliebige Körper.

Unabhängig voneinander formalisierbar (gut für parallele Aufträge in einer Runde):

- Teil 1: R1 (Körpererweiterung) für sich.
- Teil 2: Lemma A (starke Normalisierung) mit R2, R3.
- Teil 3: Alles ab Abschnitt 6 unter der **Annahme** einer stark normalisierten Zerlegung (SN1, SN2 als Hypothesen). Dieser Teil braucht keine Polynome und keinen unendlichen Körper.

---

## 10. Verhältnis zum Lean-Satz von Tsyganov u. a.

Der Lean-Satz `matrix_algorithm_rank_strict` aus `fallnlove/mm325_proof` (Commit 759cf4a, siehe `lean/NACHBAU.md`, `behauptungen/B-001.md`) sagt: Für jeden Körper K, jedes m > 0 und jede Zerlegung der Länge r von ⟨3,2,m⟩ gilt 24m < 5r, also 5r ≥ 24m + 1.

**Rechnung:** ⌈(24m+1)/5⌉ und ⌈(24m+2)/5⌉ unterscheiden sich genau dann, wenn 5 die Zahl 24m+1 teilt, also wenn 4m + 1 ≡ 0 (mod 5), also wenn **m ≡ 1 (mod 5)**. Für alle anderen m folgt Yangs Schranke schon aus dem Lean-Satz von Tsyganov u. a., durch reine Ganzzahl-Arithmetik.

| m | 3 | 4 | 5 | 6 | 7 | 11 |
|---|---|---|---|---|---|---|
| Yang ⌈(24m+2)/5⌉ | 15 | 20 | 25 | **30** | 34 | **54** |
| TPSR ⌊24m/5⌋ + 1 | 15 | 20 | 25 | **29** | 34 | **53** |

Folgerungen für die Formalisierung:

1. **3×2×6 (m = 6) braucht Yangs neues Argument.** Der Lean-Satz von Tsyganov u. a. reicht dort nicht (29 statt 30). Das passt zum Befund in `lit/QUELLEN.md`.
2. **3×2×7 (m = 7):** Yangs Schranke 34 folgt bereits aus dem Lean-Satz von Tsyganov u. a. (⌊168/5⌋ + 1 = 34). Für Stufe 3 ist das eine nützliche Abkürzung.
3. Als Baustein in Yangs Beweis selbst ersetzt der Satz von Tsyganov u. a. keinen Schritt: Fall 1 braucht die volle Verbesserung um 2, Fall 2 ist eigenständig.
4. Das Repo `fallnlove/mm325_proof` hat keine Lizenz (`lit/LIZENZEN.md`). Nach Protokoll 11.3 darf nichts daraus kopiert werden. Nutzen geht nur als externe Abhängigkeit (Verweis). Ob dort Hilfssätze liegen, die Teile dieses Beweises abdecken (Basiswechsel, ker W, Normalisierung), habe ich nicht geprüft. Auch das ginge nur per Verweis.

---

## 11. Liste der Lücken und Ungenauigkeiten

**Lücken (Schritt fehlt oder ist nicht nachvollziehbar): keine gefunden.**

Ungenauigkeiten im Paper, alle ohne Einfluss auf die Aussage. In jedem Fall gibt diese Datei die richtige Fassung:

| Nr. | Stelle im Paper | Was | Behoben in |
|---|---|---|---|
| U-1 | Abschnitt 2, Basiswechsel | Formel (α_r(S^{−1}AT), β_r(T^{−1}B), S^{−1}C_r) ergibt S^{−2}AB statt AB. Schreibfehler | R3 |
| U-2 | Abschnitt 2, „WLOG infinite“ | Warum der Rang bei Körpererweiterung nicht steigt, steht nicht da | R1 |
| U-3 | Lemma 6 | „non-constant polynomial“ statt „nicht das Nullpolynom“ | Lemma A, Schritt 3 |
| U-4 | Lemma 6 | Wahl von T (erste Zeile p) nicht ausgeführt | Lemma A, Schritt 5 |
| U-5 | Abschnitt 4.1 | h(x) = (−f_2(x), f_1(x)) widerspricht im Vorzeichen der eigenen Definition von h. Unerheblich | Abschnitt 6 |
| U-6 | Abschnitt 4.1, letzter Fall | dim N ≤ 2 statt ≤ 1. Schwächer, aber richtig | Abschnitt 8, Fall 2 |

Weitere Hinweise, keine Fehler:

- Das Paper verwendet den Buchstaben S dreimal und W in Abschnitt 4.2 doppelt (für n = 3 ohne Belang).
- Für n = 3 wird Lemma 9 (algebraischer Abschluss) nicht gebraucht, auch nicht Korollar 7.
- Die Herleitung gilt für m ≥ 2, das Paper nennt m ≥ 3.

---

## 12. Zahlenprobe (kein Beweis)

Um Vorzeichen und Definitionen zu prüfen, habe ich die Zwischengrößen dieses Beweises an den beiden HK-Verfahren aus `verfahren/` ausgerechnet, exakt über ℚ (Python, `fractions`), nach einem zufälligen ganzzahligen Basiswechsel mit invertierbarem D(e_{0,0}). Das Skript war ein Wegwerf-Skript und liegt nicht im Repo.

Geprüft: f_i(U), g(U) ⊆ ker W; dim J = m; dim ker W = R − 3m; Rang von Φ = 3m − dim N (Lemma F); Ungleichung (G); 2 rk H ≥ rk L; Δ ≥ min(2, dim N).

| Verfahren | R | m | q | rk L | rk H | dim N | Δ | rk Φ | 5R ≥ 24m+2 |
|---|---|---|---|---|---|---|---|---|---|
| `3x2x5-r25-hk71` (drei Basiswechsel) | 25 | 5 | 5 | 5 | 4 | 1 | 3 | 14 | 125 ≥ 122 |
| `3x2x6-r30-hk71` | 30 | 6 | 6 | 6 | 6 | 0 | 6 | 18 | 150 ≥ 146 |

Alle Prüfungen bestanden. Nicht geprüft: SN2 (die starke Normalisierung selbst) und Lemma B, weil SN2 eine Aussage über alle v ≠ 0 ist.

---

## 13. Hinweise für den Formalisierer

- Den Satz in der Form von `matrix_algorithm_rank_strict` formulieren (nur mathlib-Matrizen, Linearformen, `Fin R`), damit der Aussagen-Abgleich einfach bleibt: `24 * m + 2 ≤ 5 * r`.
- Quotienten: `Submodule.mkQ`, `Submodule.finrank_quotient_add_finrank`. Wer Quotienten vermeiden will (Paper Remark 4): rk L = dim(J + f_1(U) + f_2(U)) − m und rk H = dim(span{(f_2 x, −f_1 x)} + J × J) − 2m. So rechnet auch die Zahlenprobe.
- Dimensionsformel: `LinearMap.finrank_range_add_finrank_ker`.
- Diagonalmatrizen: Statt D(A) als Matrix kann man das punktweise Produkt von Vektoren nehmen: D(A)t = (α_r(A) · t_r)_r. (D1) ist dann Kommutativität der Multiplikation in F.
- Lemma B: Die Fahne E_j sind die Vektoren mit Träger in {0, …, j−1}. Das minimale j existiert per `Nat.find`.
- Lemma A ist der aufwendigste Teil (Polynome, endliche Menge der Träger). Teil 3 aus Abschnitt 9 ist rein lineare Algebra.

---

## 14. Was diese Datei nicht leistet

- Keine Prüfung nach Protokoll 5.1. Status bleibt **behauptet**, bis eine Lean-Fassung den Abschnitt 5.1 besteht.
- Der Fall n ≥ 4 (Paper Satz 2) ist nicht Teil dieses Auftrags.
- Das Lean-Repo von Tsyganov u. a. wurde nicht gelesen, nur die Satzaussagen aus `lean/NACHBAU.md` verwendet.
- Kein Gegenlesen durch ein Fremdmodell. Das Protokoll verlangt es vor der Formalisierung (Abschnitt 4).
