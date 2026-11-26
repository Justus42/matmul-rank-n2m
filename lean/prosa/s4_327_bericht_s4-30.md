# S4-30: Prüfbericht zu B-030 (Normalform zu (S, T), Lemma O, Satz G, Lemma F, Formeln)

Rolle: Prüfer. Auftrag S4-30 vom Orchestrator. Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet** (ohne mein Zutun, vor und während der Arbeit):

1. Der Index des Gedächtnisses (`MEMORY.md`). Er enthält Projektregeln: Repo und Ziel, Protokollfassung 0.6, Rechte und Grenzen des Orchestrators, „Stufe 4 … Budget 6 Runden mit je bis zu 6 Subagenten“, Regeln für Prüfer und unabhängige Sucher, Fremdmodell-Regeln, Literaturwache, Hinweise zum Mergen. Er enthält nach meiner Lesung kein Urteil, keinen Status und keine Aussage über B-030 oder die Quelle S4-21.
2. Fünf Einzeleinträge, die als „möglicherweise relevant“ eingeblendet wurden: `hk-verfahren-a10`, `lean-upper-3x2x6`, `pruefer-abgleich-s1-20`, `pruefer-rust`, `pruefer-python-s1-07`. Sie betreffen Verfahrensdateien für 3×2×5 und 3×2×6, eine Lean-Datei für 3×2×6 und die Prüfprogramme für Verfahren. Nichts davon betrifft B-030.

**Spuren, die ich gesehen habe:**

- Beim Auschecken von `main` zeigte `git log` die Commit-Nachricht „Runde 5 abgeschlossen: S4-29 eingetragen, B-031 angelegt, Zähler Spur A 2 von 3, Budget 5 von 6“. Das ist ein Zählerstand. Ein Urteil zu B-030 steht darin nicht.
- Ein Verzeichnislisting von `behauptungen/` und `lean/prosa/` zeigte die Dateinamen, darunter `s4_327_bericht_*`, `s4_327_abgleich_*` und `s4_327_spurA_r5_m21.md`. Geöffnet habe ich keine davon.
- `behauptungen/B-030.md` (Positivliste) sagt selbst, dass S4-27 (B-029) und S4-28 (B-028) sich auf die geprüften Aussagen stützen. Ich weiß damit, was von meinem Urteil abhängt (Protokoll 5.4). Der Orchestrator möge entscheiden, ob das die Prüfung berührt; ein Urteil zu B-030 habe ich vorher nicht gesehen.

**Gelesen:** `CLAUDE.md`; `PROTOKOLL.md` Abschnitt 5; `behauptungen/B-030.md`; `lean/prosa/s4_327_spurA_r4_m21.md` Abschnitte 1 bis 5; in Abschnitt 1 stehen auch die Wortlaute von S4-21-C, D, E und V, die ich gesehen, aber nicht geprüft habe (SHA-256 der Datei 348a7986…710a5, gleich der Angabe in B-030, Stand ad4afaa); `behauptungen/B-026.md`; `lean/prosa/s4_327_spurA_r3_e3.md` Abschnitte 1 bis 4; `lean/prosa/s4_327_spurA_r2_bau.md` Abschnitte 1 bis 4. **Abweichung:** Von dieser Datei habe ich zusätzlich Abschnitt 0 gelesen (mein Lesebefehl begann dort). Er enthält die Aussagen S4-07-A bis E im Wortlaut, Vermutung S4-07-V und die Lücken L-1 bis L-4, kein Prüfurteil und keinen Status außer der Selbstangabe „behauptet“; `lean/prosa/yang_n3.md` Abschnitte 3 bis 5.

Keine Subagenten, keine Fremdmodell-Anfragen.

## 1. Was ich als Voraussetzung benutzt habe (nicht selbst geprüft)

Erlaubt nach Auftrag: B-026 und die älteren Dateien der Liste. Benutzt habe ich genau:

- **V-R (Restfall R-327, B-017 bis B-019, über S4-07 Abschnitt 1.1 und 1.2):** In *jeder* Normalform gilt dim N = 3, dim S = 1, rk L = 6, also K′ = J + a_1J + a_2J, und f_0(N) = span(f_0(v), f_1(v), f_2(v)) für S = ⟨v⟩. Lemma O braucht das an jedem Punkt von G*, nicht nur an einem.
- **Untere Schranke 34** (über S4-07 Abschnitt 1.1): Es gibt kein Verfahren der Länge 33, also ist kein α_t die Nullform. Gebraucht für G* ≠ ∅ und in Lemma F (siehe 4.3).
- **S4-07 Abschnitt 3.1:** w := f_0(v), w·P_1 = f_0(N), w·P_2 ⊆ J, e := dim(w·P_2) − 3 ≤ 3.
- **S4-07 Abschnitt 4.2** und gleichwertig **S4-14 Schritt 2:** Für (j_0, j_1, j_2) ∈ J³_0 ist j_i = w·φ_i mit φ_i ∈ P_2 (kein u-Anteil).
- **S4-07 Abschnitt 3.3 / S4-14 Schritt 5 (D′):** dim Θ(J³_0) = 8, Θ(J³_0) ∩ K′ = 0, Θ(j) = c_1·j_1 + c_2·j_2 auf J³_0.
- **B-026, Satz R (S4-14-A)** samt S4-14 Schritt 1 und 5: im Fall e = 3 ist K″ = A·w + A·u = w·P_4 ⊕ u·P_2, dim K″ = 21, K″ unter a_1, a_2 abgeschlossen, K^34 = K″ ⊕ b_0·K′, K″ = K′ ⊕ Θ(J³_0).
- **`yang_n3.md`:** R1, R3, G4, Definition (SN1), (SN2), Lemma A.

Die Gültigkeit „über jedem Körper F“ hängt, wie die Quelle selbst sagt, daran, dass V-R für jeden Körper gilt. Das habe ich nicht geprüft.

## 2. Urteile in Kürze

| Teil von B-030 | Urteil |
|---|---|
| Vorbemerkung (Erklärung „Normalform zu (S, T)“, G*) | bestätigt (Definition, stimmig mit den Quellen; Bemerkung 3.1) |
| Formeln a′(t) = Sᵀα_tpᵀ, b′(t) = Sᵀα_tp′ᵀ, Skalierung, a-Punkt | bestätigt (hergeleitet und nachgerechnet) |
| Lemma F | bestätigt unter der im Zusammenhang erfüllten Voraussetzung α_t ≠ 0 ≠ α_{t′}; im isolierten Wortlaut ohne diese Voraussetzung falsch (4.3) |
| Lemma O (S4-21-A), Satz 1: G* offen und nicht leer | bestätigt |
| Lemma O, Satz 2: {e = 3} offen in GL_3 × GL_2 | bestätigt (unter V-R) |
| Lemma O, Satz 3: nicht leer ⇒ dicht | bestätigt |
| Satz G (S4-21-B) (i) | bestätigt (unter den Voraussetzungen aus Abschnitt 1) |
| Satz G (S4-21-B) (ii) | bestätigt (unter den Voraussetzungen aus Abschnitt 1) |

Ich habe keinen Fehler gefunden, der eine Aussage umwirft. Die Vorbehalte in 4.3, 5 und 6 sind Ungenauigkeiten im Beweistext oder fehlende ausdrückliche Voraussetzungen, die im Zusammenhang erfüllt sind.

## 3. Vorbemerkung und Formeln

### 3.1 Vorbemerkung

Die Erklärung von „Normalform zu (S, T)“ ist eine Definition. Sie passt zu S4-07 Abschnitt 1.1 (R1, R2, Lemma A, Skalierung): Lemma A liefert genau einen Basiswechsel R3 mit (SN1), (SN2), jedes (S, T) mit (SN1), (SN2) gibt eine Normalform im Sinn von S4-07. R2 ist in der Vorbemerkung nicht genannt; es ist überflüssig, weil wegen der unteren Schranke 34 kein α_t die Nullform ist. Ohne diese Tatsache wäre G* leer (SN1 fordert α′_t(e_{00}) ≠ 0 für alle t).

### 3.2 Formeln (Abschnitt 3 der Quelle)

Herleitung: Nach R3 ist α′_t(A) = α_t(SAT). S·e_{i0} ist die 3×2-Matrix mit erster Spalte S·e_i = u_i (i-te Spalte von S) und zweiter Spalte 0; also S·e_{i0}·T = u_i·p mit p = erste Zeile von T. Mit α_t(u·p) = uᵀα_tpᵀ folgt α′_t(e_{i0}) = u_iᵀα_tpᵀ, als Vektor über i: a′(t) = Sᵀα_tpᵀ. Ebenso S·e_{i1}·T = u_i·p′, b′(t) = Sᵀα_tp′ᵀ. Die Skalierung teilt α′_t durch a′_0(t) (≠ 0 nach SN1), also a(t) = a′(t)/a′_0(t), b(t) = b′(t)/a′_0(t), und a(t) = (1, a_1(t), a_2(t)) ist der Punkt [Sᵀα_tpᵀ] in der Karte X_0 = 1. **Bestätigt.**

Ebenfalls geprüft (Abschnitt 3 und 5.8 der Quelle, nicht Teil des Wortlauts von B-030): Als Koeffizientenmatrix ist α′_t = Sᵀα_tTᵀ; β′_t = β_t∘T^{−1}, bei der Skalierung unverändert; C_t wird zu a′_0(t)·S^{−1}C_t.

Programm `formeln.py` (Anhang): Am naiven Verfahren für ⟨3,2,7⟩ (42 Produkte, α_t = e_{ij}) mit 5 zufälligen ganzzahligen (S, T) mit (SN1), exakt in ℚ: Die Koeffizientenmatrix Sᵀα_tTᵀ stimmt mit α_t(SAT) überein, die Brent-Gleichungen gelten nach R3 und nach der Skalierung, a′(t) und b′(t) stimmen mit Sᵀα_tpᵀ, Sᵀα_tp′ᵀ überein, und für die (hier sämtlich) Rang-1-Formen ist nach Skalierung c_1 = c_2 = 0. Ausgabe: `True`. Gegenprobe `neg.py`: Die falsche Formel S·α_tpᵀ weicht an allen 42 Indizes ab, die Probe ist also nicht blind.

## 4. Lemma F (Abschnitt 5.1 der Quelle)

### 4.1 Beweis Schritt für Schritt

- V_{tt′} ist abgeschlossen: gemeinsame Nullstellen der drei 2×2-Minoren von [α_tpᵀ | α_{t′}pᵀ], quadratisch in p. Richtig.
- „⇐“: Bei (I) ist α_{t′}pᵀ = λ·α_tpᵀ, bei (II) sind beide Vektoren Vielfache von x. Richtig.
- „⇒“, α_t Rang 2: p ↦ α_tpᵀ ist injektiv, also α_tpᵀ ≠ 0 für p ≠ 0 und α_{t′}pᵀ = λ(p)·α_tpᵀ mit eindeutigem λ(p). Für eine Basis p_1, p_2 vergleicht man α_{t′}(p_1 + p_2)ᵀ auf zwei Arten; weil α_tp_1ᵀ, α_tp_2ᵀ unabhängig sind, ist λ(p_1) = λ(p_1 + p_2) = λ(p_2), und α_{t′} = λ·α_t auf der Basis, also überall. Richtig, über jedem Körper.
- α_{t′} Rang 2: symmetrisch α_t = λ·α_{t′}. Daraus folgt „α_t hat Rang 2“ nur, wenn α_t ≠ 0 (dann λ ≠ 0 und α_{t′} = λ^{−1}α_t). Die Quelle sagt das nicht, es gilt im Zusammenhang (keine Nullform).
- Beide Rang 1: α_tpᵀ = (y·p)·x. Ein p mit y·p ≠ 0 ≠ y′·p gibt es (Komplement zweier Geraden in K², über jedem Körper nicht leer). Aus der Abhängigkeit folgt K·x = K·x′. Richtig.
- Fehlende Fälle: Rang 2 gegen Rang 1 ist im ersten Fall enthalten (er erzwingt α_{t′} = λα_t, also gleichen Rang oder α_{t′} = 0).

### 4.2 Rechnung

`lemmaf.py` (Anhang) prüft die Äquivalenz für **alle** 264 628 Paare verschiedener, von 0 verschiedener 3×2-Matrizen über GF(3), mit V_{tt′} als Punktmenge in GF(3)^{1×2}: 0 Gegenbeispiele. (Der Beweis oben gilt über jedem Körper, deshalb ist auch ein endlicher Körper ein gültiger Test.)

### 4.3 Vorbehalt zum Wortlaut

B-030 nennt Lemma F „einzeln beurteilbar“ und zitiert es ohne die Voraussetzung α_t, α_{t′} ≠ 0. In dieser isolierten Form ist es falsch: Für α_t = 0 und α_{t′} ≠ 0 ist V_{tt′} = K^{1×2}, aber weder (I) (α_{t′} = λ·0) noch (II) (Rang 0) gilt. In der Quelle sind die α_t die Formen eines Verfahrens der Länge 34, und dort gibt es keine Nullform (Abschnitt 1). **Urteil: bestätigt für von 0 verschiedene α_t, α_{t′}, also im Zusammenhang der Quelle.** Für eine Formalisierung sollte die Voraussetzung ausdrücklich dastehen.

Nebenbemerkung zum Text nach Lemma F: „Jedes solche V_{tt′} ist die Nullstellenmenge eines … 2×2-Minors“ ist ungenau; richtig ist „liegt in der Nullstellenmenge eines vom Nullpolynom verschiedenen Minors“. Für „G_gen offen und dicht“ genügt das (V_{tt′} abgeschlossen, Komplement enthält eine nicht leere offene Menge, G irreduzibel).

## 5. Lemma O (S4-21-A, Abschnitt 4 der Quelle)

**Satz 1: G* offen und nicht leer.** (SN1) ist Π_t u_0ᵀα_tpᵀ ≠ 0, offen. (SN2): f′_i(v) = (α′_t(e_{i0})·β′_t(v))_t = (u_iᵀα_tpᵀ·β_t(T^{−1}v))_t; das stimmt mit Lemma A, Schritt 5, in `yang_n3.md` überein. Die Verletzung von (SN2) heißt: alle 3×3-Minoren der 34×3-Matrix [f′_0(v) f′_1(v) f′_2(v)] verschwinden für ein v ≠ 0. Die Minoren sind regulär in (S, T) (T^{−1} ist regulär auf GL_2) und homogen in v, definieren also eine abgeschlossene Teilmenge von G × P^{13}; deren Bild unter der Projektion ist abgeschlossen, weil P^{13} vollständig ist. Also ist die (SN2)-Menge offen. G* ≠ ∅ nach Lemma A (K unendlich; keine Nullform, siehe 3.1). **Bestätigt.**

**Satz 2: {e = 3} offen.** Geprüft:
- q_k(t) = β′_t(e_{1k}) = β_t(T^{−1}e_{1k}) und a_i(t) = u_iᵀα_tpᵀ / u_0ᵀα_tpᵀ sind auf G* regulär; Q hat Rang 7 nach G4. Richtig.
- ker Ξ: a_1Qy = Qy′, a_2Qy = Qy″. Weil Q injektiv ist, sind y′, y″ durch y bestimmt und die Projektion auf y bildet ker Ξ bijektiv auf N ab. Nach V-R ist dim N = 3 auf ganz G*, also rk Ξ = 21 − 3 = 18, rk Ξ³ = 54, dim ker Ξ³ = 9. Richtig.
- Γ(ker Ξ³) = Q(N) + a_1Q(N) + a_2Q(N) = w·P_1 + a_1w·P_1 + a_2w·P_1 = w·P_2 (mit f_0(N) = Q(N) = w·P_1 aus S4-07, 3.1). Richtig.
- e + 3 = dim ker Ξ³ − dim(ker Ξ³ ∩ ker Γ) = 9 − (63 − rk[Ξ³; Γ]) = rk[Ξ³; Γ] − 54. Richtig (ker Ξ³ ∩ ker Γ = ker[Ξ³; Γ], Definitionsbereich 63).
- Mit e ≤ 3 ist {e = 3} = G* ∩ {rk ≥ 60} = G* ∩ {ein 60×60-Minor ≠ 0}; die Minoren sind regulär auf G*, also offen in G*, und G* ist offen in G. Richtig.

Rechnung `lemmao.py` (Anhang, modulo 32003): Lagen mit 34 Punkten, J = w·P_2 + (7 − dim w·P_2) Zufallsvektoren, zufällige Basis Q von J. 40 Lagen mit allgemeinen Punkten (e = 3) und 40 Lagen, in denen der Träger von w auf einem Kegelschnitt liegt (e = 2). In allen 80: dim N = 3, rk Ξ³ = 54, rk[Ξ³; Γ] = 57 + e (60 bzw. 59), dim Γ(ker Ξ³) = dim w·P_2, und Γ(ker Ξ³) = w·P_2 als Raum. Das prüft die lineare Algebra der Formel, nicht den Restfall.

**Satz 3: nicht leer ⇒ dicht.** GL_3 × GL_2 ist offen in einem affinen Raum, also irreduzibel, und jede nicht leere offene Teilmenge ist dicht. **Bestätigt.**

Abhängigkeit: Satz 2 braucht V-R (dim N = 3, dim S = 1) an *jedem* Punkt von G*, nicht nur an dem gegebenen.

## 6. Satz G (S4-21-B, Abschnitte 5.2 bis 5.8 der Quelle)

### 6.1 Wahl (5.2)

Nach Voraussetzung gibt es (S_0, T_0) ∈ G* mit e = 3; nach Lemma O ist {e = 3} offen, nicht leer, dicht; G_gen ist offen und dicht (4.3); der Durchschnitt ist nicht leer und offen und dicht. In jeder Normalform zu (S, T) aus dem Durchschnitt gelten nach Satz R und S4-14 Schritt 1, 5 die in 5.2 aufgezählten Gleichungen. Richtig.

Fasern: Zwei Indizes haben denselben a-Punkt genau dann, wenn Sᵀα_tpᵀ und Sᵀα_{t′}pᵀ (beide ≠ 0 nach SN1) proportional sind, also genau dann, wenn p ∈ V_{tt′}. In G_gen passiert das nur bei (I) oder (II). Rang 2 und Rang 1 können nicht in einer Faser liegen ((I) würde α = 0 erzwingen), zwei Rang-2-Formen nur bei (I), zwei Rang-1-Formen genau dann, wenn sie dieselbe Spalte haben ((I) für Rang 1 impliziert dieselbe Spalte; umgekehrt gibt dieselbe Spalte für jedes p denselben Punkt). Also sind die Fasern rein: Klasse I = Rang 2, paarweise proportional; Klasse II = Rang 1, gleiche Spalte; Y = Rang 1, Z = Rang 2. Richtig.

### 6.2 Klassen (5.3)

Klasse I: α_{t′} = λα_t mit λ ≠ 0 gibt a(t′) = a(t), b(t′) = b(t) nach Skalierung. Klasse II: α_t = xyᵀ gibt a′(t) = (y·p)Sᵀx, b′(t) = (y·p′)Sᵀx, y·p ≠ 0 nach SN1, b(t) = r_t·a(t), b_0(t) = r_t, c_i(t) = 0. Richtig, auch numerisch (formeln.py, letzter Teil).

### 6.3 Zählung (5.4)

- K″ abgeschlossen ⇒ e_pK″ ⊆ K″; Σ_p e_p = a_0 = 1 ⇒ K″ = ⊕_p e_pK″ = ⊕_p M_p, Σ d_p = 21. Die Interpolationspolynome e_p gibt es an endlich vielen verschiedenen Punkten über jedem Körper. Richtig.
- M_p = span(e_pw, e_pu): Auf T_p ist jedes f ∈ A konstant f(p), also e_p·f·w = f(p)·e_pw. Richtig, d_p ≤ 2.
- e_p·(K″ + b_0K′) = M_p + b_0·e_pK′ ⊆ M_p + b_0M_p, also |T_p| ≤ 2d_p. Richtig.
- Klasse I: b_0 auf T_p konstant ⇒ b_0M_p ⊆ M_p ⇒ |T_p| = d_p. (Die Quelle schreibt „b_0·M_p = M_p“; ist die Konstante 0, gilt nur ⊆. Für den Schluss genügt ⊆.)
- 13 = 34 − 21 = Σ_p(|T_p| − d_p) = Σ_{p⊆Y}(|T_p| − d_p) ≤ Σ_{p⊆Y}|T_p|/2 = |Y|/2. Richtig, |Y| ≥ 26.

### 6.4 Θ auf Z (5.5)

Θ(j) = c_1j_1 + c_2j_2 verschwindet auf Y, liegt in K″ (S4-14 Schritt 5), also in K″ ∩ K^Z. Ein v ∈ K″ mit Träger in Z ist Σ_p e_pv mit e_pv = 0 für p ⊆ Y, also K″ ∩ K^Z = ⊕_{p⊆Z}M_p mit Dimension Σ_{p⊆Z}d_p = |Z|. dim Θ(J³_0) = 8 ⇒ |Z| ≥ 8; mit |Y| ≥ 26 und |Y| + |Z| = 34 folgt |Y| = 26, |Z| = 8, Gleichheit in jeder Ungleichung von 6.3 (jeder Summand |T_p| − d_p ≤ |T_p|/2 muss mit Gleichheit gelten), also |T_p| = 2d_p auf Y, Σ_{p⊆Y}d_p = 13, Θ(J³_0) = K^Z, K″ = K′ ⊕ K^Z, K′ ∩ K^Z = 0. Richtig.

### 6.5 Einzelpunkte (5.6)

c_i ist auf jeder Faser konstant, also c_i = C_i für Polynome C_i ∈ A (Interpolation). Für j ∈ J³_0 ist j_i = wφ_i (S4-14 Schritt 2), also Θ(j) = w·(C_1φ_1 + C_2φ_2) ∈ A·w. Damit K^{T_p} = e_pK^Z ⊆ e_p·A·w = K·e_pw für T_p ⊆ Z, also |T_p| = 1 und w ≠ 0 dort. Verschiedene a-Punkte ⇒ nicht proportional (proportionale Formen haben für jedes p denselben a-Punkt). Richtig.

### 6.6 Rang 2 und C_t (5.7)

α_z hat die Spalten a(z) und b(z) = b_0(z)a(z) + (0, c_1(z), c_2(z)); Rang 2 ⇔ (c_1(z), c_2(z)) ≠ (0, 0). Σ_{t∈Z}λ_tC_t = W(Σλ_te_t) = 0 ⇒ Σλ_te_t ∈ K′ ∩ K^Z = 0. Übertrag: C_t^{NF} = a′_0(t)S^{−1}C_t mit a′_0(t) ≠ 0; lineare Unabhängigkeit von Vektoren aus F^{3×7} ist über K und über F dasselbe. Richtig.

### 6.7 Übertrag und Klassenzahl (5.8)

α_t^{NF} = Sᵀα_tTᵀ / a′_0(t): Rang, Proportionalität und Spaltengerade (K·x ↦ K·Sᵀx, bijektiv) bleiben erhalten; R1 ändert Rang und Proportionalität nicht. Die Klassen der 26 Rang-1-Formen nach K·x_t sind genau die Fasern über Y (6.1), mit |T_p| = 2d_p, d_p ∈ {1, 2}, also Größe 2 oder 4. Bei k Klassen und Σd_p = 13 mit d_p ∈ {1, 2}: k ≤ 13 und 2k ≥ 13, also 7 ≤ k ≤ 13. Richtig.

### 6.8 Ergebnis

(i) folgt aus 6.1 bis 6.7 für das Ausgangsverfahren über F. (ii) gilt für jedes (S, T) in der dichten offenen Menge {e = 3} ∩ G_gen. Jede Teilaussage von (ii) ist in 6.1 bis 6.6 einzeln nachgewiesen: e = 3 und (M21); c_1 = c_2 = 0 auf Y; 8 verschiedene a-Punkte mit je einem Index, w ≠ 0 dort, (c_1(z), c_2(z)) ≠ 0; |T_p| = 2d_p, Σ_{p⊆Y}d_p = 13; K′ ∩ K^Z = 0, K″ = K′ ⊕ K^Z, Θ(J³_0) = K^Z. Die Aussagen hängen nicht von der Wahl von u (in J = w·P_2 ⊕ ⟨u⟩) oder der Skalierung von w ab, weil M_p := e_p·K″ definiert ist. **Beide Teile bestätigt**, unter den Voraussetzungen aus Abschnitt 1.

Satz G selbst lässt sich nicht an einem echten Verfahren nachrechnen, weil keines der Länge 34 vorliegt; die Prüfung von Satz G ist deshalb eine Prüfung des Beweistexts.

## 7. Rechenaufwand

Alle Programme liefen in Sekunden (lemmaf.py etwa 10 s, formeln.py etwa 25 s, lemmao.py unter 10 s). Kein Rechenblock nahe 30 Minuten. Python 3 mit numpy (nur in lemmaf.py, ganzzahlig modulo 3), sonst reine Python-Ganzzahlen und `fractions.Fraction`; keine Gleitkommazahlen.

## Anhang: Programme

SHA-256 der Programmdateien, wie sie unten stehen:

- lemmaf.py: 9df439a0bfeb03b06c6ecdf37d8f1fb024fb88302df950ab3f5e921d241f9668
- formeln.py: 56ac33296439cf434e7f1dbd979134c77ec58aed42049509971f5d0c63931bea
- lemmao.py: 88e9e986116c01cfb49885afad92a98c4d57b95b54324ef5a9bc0802feb0dbe7
- neg.py: 79f69b3b8d25117a9c32d73e60400286f2ccc6dc749d759071bf974fe1fc835d

Aufruf: `python3 lemmaf.py`, `python3 formeln.py`, `python3 lemmao.py 40`, `python3 neg.py` (neg.py liest formeln.py aus demselben Verzeichnis).

### lemmaf.py

```python
# S4-30: exhaustive check of Lemma F over GF(3) (all pairs of nonzero 3x2 matrices)
import itertools, numpy as np
q = 3
mats = [np.array(m).reshape(3, 2) for m in itertools.product(range(q), repeat=6)]
mats = [m for m in mats if m.any()]
ps = [np.array(p) for p in itertools.product(range(q), repeat=2)]
def rank(m):
    m = m.copy() % q; r = 0; rows, cols = m.shape
    for c in range(cols):
        piv = next((i for i in range(r, rows) if m[i, c]), None)
        if piv is None: continue
        m[[r, piv]] = m[[piv, r]]; inv = pow(int(m[r, c]), q - 2, q)
        m[r] = (m[r] * inv) % q
        for i in range(rows):
            if i != r and m[i, c]: m[i] = (m[i] - m[i, c] * m[r]) % q
        r += 1
    return r
rk = [rank(m) for m in mats]
# images alpha p^T for all p, as 3-vectors
imgs = [[(m @ p) % q for p in ps] for m in mats]
def dep(x, y):  # 2x2 minors of [x y] vanish
    return all((x[i]*y[j] - x[j]*y[i]) % q == 0 for i in range(3) for j in range(i+1, 3))
def col(m):  # column space line of rank-1 matrix: normalized nonzero column
    v = m[:, 0] if m[:, 0].any() else m[:, 1]
    i = next(k for k in range(3) if v[k]); return tuple((v * pow(int(v[i]), q-2, q)) % q)
def prop(a, b):  # b = lam a
    return any(((b - l*a) % q == 0).all() for l in range(q))
bad = 0; n = 0
for i in range(len(mats)):
    for j in range(i+1, len(mats)):
        n += 1
        V_all = all(dep(imgs[i][k], imgs[j][k]) for k in range(len(ps)))
        I = prop(mats[i], mats[j]) or prop(mats[j], mats[i])
        II = rk[i] == 1 and rk[j] == 1 and col(mats[i]) == col(mats[j])
        if V_all != (I or II): bad += 1
print("pairs", n, "counterexamples", bad)
```

### formeln.py

```python
# S4-30: check of the formulas in section 3 of S4-21 on the naive <3,2,7> scheme (42 products),
# exact rational arithmetic. alpha_t(A) = sum alpha[t][i][j] A[i][j].
from fractions import Fraction as Fr
import random
random.seed(430)
n, m = 2, 7
def mat(r, c, f): return [[f(i, j) for j in range(c)] for i in range(r)]
def mul(A, B): return [[sum(A[i][k]*B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
def tr(A): return [list(r) for r in zip(*A)]
def inv(M):
    k = len(M); A = [[Fr(x) for x in r] + [Fr(int(i == j)) for j in range(k)] for i, r in enumerate(M)]
    for c in range(k):
        p = next(i for i in range(c, k) if A[i][c] != 0); A[c], A[p] = A[p], A[c]
        A[c] = [x / A[c][c] for x in A[c]]
        for i in range(k):
            if i != c and A[i][c] != 0: A[i] = [x - A[i][c]*y for x, y in zip(A[i], A[c])]
    return [r[k:] for r in A]
def E(r, c, i, j): return mat(r, c, lambda a, b: Fr(int((a, b) == (i, j))))
# naive scheme: for i<3, j<2, l<7: alpha = e_ij, beta = e_jl, C = e_il
alpha, beta, C = [], [], []
for i in range(3):
    for j in range(2):
        for l in range(m):
            alpha.append(E(3, 2, i, j)); beta.append(E(2, m, j, l)); C.append(E(3, m, i, l))
R = len(alpha)
def ev(form, A): return sum(form[i][j]*A[i][j] for i in range(len(A)) for j in range(len(A[0])))
def brent(al, be, Cs):
    for i in range(3):
        for j in range(2):
            for jj in range(2):
                for l in range(m):
                    A = E(3, 2, i, j); B = E(2, m, jj, l); AB = mul(A, B)
                    S = mat(3, m, lambda a, b: sum(ev(al[t], A)*ev(be[t], B)*Cs[t][a][b] for t in range(R)))
                    if S != AB: return False
    return True
assert brent(alpha, beta, C)
ok = True
for trial in range(5):
    while True:
        S = mat(3, 3, lambda a, b: Fr(random.randint(-3, 3))); T = mat(2, 2, lambda a, b: Fr(random.randint(-3, 3)))
        try: Si, Ti = inv(S), inv(T)
        except StopIteration: continue
        # (SN1) on this scheme: a'_0(t) != 0 for all t
        if all(ev(al, mul(mul(S, E(3, 2, 0, 0)), T)) != 0 for al in alpha): break
    # R3 as in yang_n3.md: alpha'(A) = alpha(SAT), beta'(B) = beta(T^-1 B), C' = S^-1 C
    alp = [mul(mul(tr(S), al), tr(T)) for al in alpha]       # claimed coefficient matrix S^T alpha T^T
    for t in range(R):
        for _ in range(3):
            A = mat(3, 2, lambda a, b: Fr(random.randint(-5, 5)))
            ok &= ev(alp[t], A) == ev(alpha[t], mul(mul(S, A), T))
    bep = [mul(tr(Ti), be) for be in beta]  # beta'(B) = beta(T^-1 B): coeff (T^-1)^T beta
    for t in range(R):
        B = mat(2, m, lambda a, b: Fr(random.randint(-5, 5)))
        ok &= ev(bep[t], B) == ev(beta[t], mul(Ti, B))
    Cp = [mul(Si, c) for c in C]
    ok &= brent(alp, bep, Cp)
    p, pp = T[0], T[1]
    for t in range(R):
        ap = [ev(alp[t], E(3, 2, i, 0)) for i in range(3)]; bp = [ev(alp[t], E(3, 2, i, 1)) for i in range(3)]
        Sa = mul(mul(tr(S), alpha[t]), [[x] for x in p]); Sb = mul(mul(tr(S), alpha[t]), [[x] for x in pp])
        ok &= ap == [r[0] for r in Sa] and bp == [r[0] for r in Sb]
    # scaling: alpha/a'_0, C * a'_0 ; check Brent and Klasse II formula c_i = 0, b = r_t a
    a0 = [ev(alp[t], E(3, 2, 0, 0)) for t in range(R)]
    als = [[[x / a0[t] for x in row] for row in alp[t]] for t in range(R)]
    Cs = [[[x * a0[t] for x in row] for row in Cp[t]] for t in range(R)]
    ok &= brent(als, bep, Cs)
    for t in range(R):
        a = [als[t][i][0] for i in range(3)]; b = [als[t][i][1] for i in range(3)]
        ok &= a[0] == 1 and all(b[i] - a[i]*b[0] == 0 for i in (1, 2))   # rank-1 alpha: c_i = 0
print("formulas and Brent identity after R3 and scaling:", ok)
```

### lemmao.py

```python
# S4-30: check of the rank formula in Lemma O (S4-21, section 4) on constructed positions mod p.
# dim Gamma(ker Xi^3) = rk[Xi^3; Gamma] - rk Xi^3, and Gamma(ker Xi^3) = Q(N) + a1 Q(N) + a2 Q(N).
import random, sys
P = 32003
def rank(rows):
    M = [list(r) for r in rows]; r = 0
    ncol = len(M[0]) if M else 0
    for c in range(ncol):
        piv = next((i for i in range(r, len(M)) if M[i][c] % P), None)
        if piv is None: continue
        M[r], M[piv] = M[piv], M[r]; iv = pow(M[r][c], P-2, P); M[r] = [x*iv % P for x in M[r]]
        for i in range(len(M)):
            if i != r and M[i][c] % P:
                f = M[i][c]; M[i] = [(x - f*y) % P for x, y in zip(M[i], M[r])]
        r += 1
    return r
def kernel(rows, n):  # basis of {x : rows x = 0}
    M = [list(r) for r in rows]; piv = []; r = 0
    for c in range(n):
        p_ = next((i for i in range(r, len(M)) if M[i][c] % P), None)
        if p_ is None: continue
        M[r], M[p_] = M[p_], M[r]; iv = pow(M[r][c], P-2, P); M[r] = [x*iv % P for x in M[r]]
        for i in range(len(M)):
            if i != r and M[i][c] % P:
                f = M[i][c]; M[i] = [(x - f*y) % P for x, y in zip(M[i], M[r])]
        piv.append(c); r += 1
    free = [c for c in range(n) if c not in piv]; B = []
    for f in free:
        x = [0]*n; x[f] = 1
        for i, c in enumerate(piv): x[c] = (-M[i][f]) % P
        B.append(x)
    return B
R = 34
def trial(mode):
    if mode == 3:
        pts = [(random.randrange(P), random.randrange(P)) for _ in range(R)]
    else:  # w-support on a conic x2 = x1^2 for 20 indices, rest generic (w = 0 there)
        pts = [(x, x*x % P) for x in random.sample(range(P), 20)] + [(random.randrange(P), random.randrange(P)) for _ in range(R-20)]
    a1 = [p[0] for p in pts]; a2 = [p[1] for p in pts]
    w = [random.randrange(1, P) for _ in range(R)]
    if mode != 3: w = w[:20] + [0]*(R-20)
    mons = [(0,0),(1,0),(0,1),(2,0),(1,1),(0,2)]
    wP2 = [[w[t]*pow(a1[t],i,P)*pow(a2[t],j,P) % P for t in range(R)] for i, j in mons]
    extra = [[random.randrange(P) for _ in range(R)] for _ in range(7 - rank(wP2))]
    gens = [v for v in wP2 + extra]
    # basis of J (7 vectors), mixed by a random matrix
    basis = []
    for v in gens:
        if rank(basis + [v]) > len(basis): basis.append(v)
    assert len(basis) == 7
    mix = [[random.randrange(P) for _ in range(7)] for _ in range(7)]
    while rank(mix) < 7: mix = [[random.randrange(P) for _ in range(7)] for _ in range(7)]
    Qcols = [[sum(mix[k][l]*basis[l][t] for l in range(7)) % P for t in range(R)] for k in range(7)]
    Q = [[Qcols[k][t] for k in range(7)] for t in range(R)]  # 34 x 7
    # Xi : (y, y', y'') -> (a1 Qy - Qy', a2 Qy - Qy''), as 68 x 21 matrix
    Xi = []
    for i, a in enumerate((a1, a2)):
        for t in range(R):
            row = [a[t]*Q[t][k] % P for k in range(7)] + [0]*14
            off = 7 + 7*i
            for k in range(7): row[off+k] = (-Q[t][k]) % P
            Xi.append(row)
    rkXi = rank(Xi); dimN = 21 - rkXi
    Xi3 = [[0]*21*b + r + [0]*21*(2-b) for b in range(3) for r in Xi]
    # build Gamma explicitly: blocks (y_b, y_b', y_b'') -> coeff of y_b
    Gam = []
    for t in range(R):
        row = []
        for b, a in enumerate(([1]*R, a1, a2)):
            row += [a[t]*Q[t][k] % P for k in range(7)] + [0]*14
        Gam.append(row)
    rk_big = rank(Xi3 + Gam); rkXi3 = rank(Xi3)
    lhs = rk_big - rkXi3
    # direct: N = projection of ker Xi to y, Q(N) + a1 Q(N) + a2 Q(N)
    K = kernel(Xi, 21); N = [x[:7] for x in K]
    QN = [[sum(Q[t][k]*y[k] for k in range(7)) % P for t in range(R)] for y in N]
    span = QN + [[a1[t]*v[t] % P for t in range(R)] for v in QN] + [[a2[t]*v[t] % P for t in range(R)] for v in QN]
    direct = rank(span)
    ewP2 = rank(wP2)
    contains = rank(span + wP2) == direct == ewP2  # equal spaces when N gives exactly wP1
    return dimN, rkXi3, rk_big, lhs, direct, ewP2, contains
random.seed(4300)
for mode in (3, 2):
    for _ in range(int(sys.argv[1])):
        dimN, rkXi3, rk_big, lhs, direct, ewP2, contains = trial(mode)
        print(mode, "dimN", dimN, "rkXi3", rkXi3, "rk[Xi3;Gam]", rk_big, "rk-rkXi3", lhs, "dim Gamma(ker)", direct, "dim wP2", ewP2, "same space", contains)
```

### neg.py

```python
# negative control: the wrong formula a'(t) = S alpha_t p^T must fail for a non-symmetric S
exec(open('formeln.py').read().split('ok = True')[0])
S = [[Fr(1),Fr(2),Fr(0)],[Fr(0),Fr(1),Fr(3)],[Fr(1),Fr(0),Fr(1)]]; T = [[Fr(1),Fr(1)],[Fr(0),Fr(1)]]
fails = 0
for t in range(R):
    alp = mul(mul(tr(S), alpha[t]), tr(T))
    ap = [ev(alp, E(3,2,i,0)) for i in range(3)]
    wrong = [r[0] for r in mul(mul(S, alpha[t]), [[x] for x in T[0]])]
    fails += ap != wrong
print("indices where wrong formula differs:", fails, "of", R)
```
