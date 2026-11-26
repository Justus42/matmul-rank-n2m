# S4-23: Blind-Suche R(⟨3,2,7⟩), Runde 4

Rolle: Blind-Sucher. Gelesen im Repo: nur `CLAUDE.md`. Keine anderen Dateien, Zweige oder Pull Requests des Repos geöffnet.
Jede eigene Aussage trägt eines der Wörter **vermutet** oder **behauptet**. Fremde Ergebnisse werden mit Quelle zitiert und sind nicht als eigene Aussage gemeint.

## 0. Offenlegung eingeblendeter Gedächtniseinträge und Fremdinformation

Eingeblendet wurden mir, ohne dass ich danach gefragt habe:

1. Der Gedächtnisindex `team/silo/MEMORY.md` (Projekt „Matrizen-Multiplikation"). Inhalt: Projektziel und Formate, Regeln und Protokollversion, Rollen von Orchestrator und Threads, Fremdmodell-Regeln, Netzfreigaben der Umgebung, Hinweise zu Literaturwachen, Verweise auf die Einzeleinträge `verfahren-datenformat` und `lean-project-ci` (deren Inhalt wurde mir nicht eingeblendet).
2. Während der Arbeit zusätzlich die Einzeleinträge `hk-verfahren-a10`, `verfahren-randfaelle-s1-04`, `git-regeln` und `lean-upper-3x2x6` (Dateinamen von Verfahrensdateien, Formatregeln, Git-Regeln, eine Lean-Datei für 3×2×6).

Ich habe den Inhalt dieser Einträge nicht benutzt. Insbesondere habe ich weder Verfahrensdateien noch Lean-Dateien des Repos gelesen.

3. Eine Websuche (Abschnitt 1) lieferte als Treffer auch die öffentliche GitHub-Seite dieses Repos; der Suchdienst zitierte daraus die Zeile „⟨3,2,7⟩ … 34 | 35 | open". Ich habe die Seite nicht geöffnet. Dieselben Zahlen ergeben sich unabhängig aus den unten zitierten Arbeiten.

## 1. Literaturstand

Bezeichnung: R_K(⟨n,l,m⟩) ist der Tensorrang über dem Körper K. Er ist invariant unter Vertauschung der drei Formatzahlen, also R(⟨3,2,7⟩) = R(⟨2,3,7⟩) = R(⟨7,2,3⟩) usw.

| Quelle | Aussage | Folgerung für ⟨3,2,7⟩ |
|---|---|---|
| Hopcroft, Kerr, SIAM J. Appl. Math. 20 (1971) 30–36 | R(⟨n,2,m⟩) ≤ ⌈(3nm + max(n,m))/2⌉ | R ≤ 35 |
| FMM-Katalog Lille, Seite `2x3x7.html` (abgerufen 26.11.2026) | bestes gelistetes Verfahren ⟨2×3×7:35⟩ = ⟨2×3×3:15⟩ + ⟨2×3×4:20⟩ | kein Verfahren mit 34 gelistet |
| J. Yang, arXiv:2609.14393 (v3, 12.10.2026) | R_K(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉ für m ≥ 3, jeder Körper | R ≥ ⌈170/5⌉ = 34 |
| A. Tsyganov u. a., arXiv:2609.22054 (v1, 18.09.2026) | R_K(⟨3,2,m⟩) > 24m/5, jeder Körper; Lean-formalisiert | R ≥ 34 |
| Bläser, Comput. Complexity 8 (1999) | R(⟨2,n,m⟩) ≥ nm + n + m − 1 | R ≥ 30 |

Stand laut diesen Quellen: **34 ≤ R_K(⟨3,2,7⟩) ≤ 35 für jeden Körper K**, offen. m = 7 ist der kleinste Fall, in dem Yangs Schranke und Hopcroft–Kerr auseinanderfallen. Ich habe keine Quelle gefunden, die 34 oder 35 als exakten Wert behauptet (Suchanfragen in Abschnitt 6).

Wichtige Beobachtung (**behauptet**, elementar): Für m = 7 ist 24m + 2 = 170 = 5 · 34. Die Lücke ist also genau der **Gleichheitsfall von Yangs Ungleichung 5r ≥ 24m + 2**. Wer r = 34 ausschließt, muss Gleichheit in Yangs Ungleichung ausschließen, so wie Tsyganov u. a. Gleichheit in 5r ≥ 24m ausgeschlossen haben.


## 2. Eigene Analyse: Was ein Verfahren mit 34 Produkten erfüllen müsste

Alles in diesem Abschnitt ist **behauptet** (eigene Herleitung, nicht geprüft). Benutzt werden Yangs Lemmata 6, 8, 10, 11, 12 und Satz 1 (arXiv:2609.14393v3) in seiner Notation; diese Lemmata habe ich nachgerechnet, aber sie sind fremde Ergebnisse.

### 2.1 Notation (nach Yang)

Ein Verfahren der Länge r für ⟨3,2,m⟩ ist AB = W·D(A)·ℬ(B) mit D(A) = diag(α_i(A)), ℬ(B) = (β_i(B))_i, W(t) = Σ t_i C_i. O. B. d. A. K unendlich (Übergang zu K(t) ändert die Länge nicht), kein α_i ≡ 0.

* U = 2×m-Matrizen mit Nullzeile oben, dim U = m.
* f_i(x) = D(e_{i,0}) ℬ(x) für i = 0,1,2; J = f_0(U) ⊆ ker W, dim J = m.
* Q = ker W / J, dim Q = q = r − 4m.
* F_i = f_i + J : U → Q (i = 1,2); L(u_1,u_2) = F_1(u_1) + F_2(u_2); N = ker F_1 ∩ ker F_2, n := dim N.
* H(c) = (−F_2(c), F_1(c)) : U → Q², also rk H = m − n.
* Δ = 2 rk H − rk L.
* Σ = {x ∈ N : f_1(x), f_2(x) ∈ f_0(N)} (bei Yang „S").

Yangs Normierung (Lemma 6): Nach Basiswechsel ist D(e_{0,0}) invertierbar und für jedes B ≠ 0 sind f_0(B), f_1(B), f_2(B) linear unabhängig.

Yang beweist: (1) 2m + rk H ≤ rk L + 2q (aus Lemma 10); Lemma 11: 2 rk H ≥ rk L; Lemma 12 mit Lemma 8: Δ ≥ min(2, n); Lemma 12: dim Σ ≥ n − Δ; Lemma 8: Σ ≠ 0 ⇒ dim(f_0(Σ)+f_1(Σ)+f_2(Σ)) ≥ dim Σ + 2.

### 2.2 Satz A (behauptet): Struktur im Gleichheitsfall 5r = 24m + 2

Sei m ≥ 3, m ≡ 2 (mod 5) und r = (24m+2)/5. Gibt es ein Verfahren der Länge r für ⟨3,2,m⟩, so gilt in Yangs Normierung:

(a) q = (4m+2)/5, n = (3m−6)/5, rk L = q (also im F_1 + im F_2 = Q), rk H = m − n, Δ = 2;
(b) dim Σ = n − 2 = (3m−16)/5 (für m = 7: dim Σ = 1);
(c) f_0(N) = f_0(Σ) + f_1(Σ) + f_2(Σ).

**Beweis.** Aus (1) und rk H = m − n: 3m − n ≤ rk L + 2q ≤ 3q, also n ≥ 3m − 3q = (3m−6)/5 ≥ 3/5 > 0 für m ≥ 3, d. h. n ≥ 1. Dann gibt Yang Δ ≥ min(2,n). Fall n = 1: aus n ≥ (3m−6)/5 folgt m ≤ 11/3, also m = 3, aber m ≡ 2 (mod 5) schließt m = 3 aus. Also n ≥ 2 und Δ ≥ 2, d. h. rk L ≤ 2(m−n) − 2. Mit rk L ≥ 3m − n − 2q aus (1):
3m − n − 2q ≤ 2m − 2n − 2, also n ≤ 2q − m − 2 = (8m+4)/5 − m − 2 = (3m−6)/5.
Zusammen n = (3m−6)/5. Einsetzen: rk L ≥ 3m − n − 2q = q, also rk L = q, und Δ = 2(m−n) − q = 2. Das ist (a).
Lemma 12: dim Σ ≥ n − Δ = n − 2. Für m = 7 ist n − 2 = 1 > 0; allgemein für m ≥ 12 ebenso. Also Σ ≠ 0 und Lemma 8 gibt dim(f_0(Σ)+f_1(Σ)+f_2(Σ)) ≥ dim Σ + 2. Diese Summe liegt in f_0(N) (Definition von Σ), und dim f_0(N) = n (f_0 injektiv). Also dim Σ ≤ n − 2, zusammen (b), und die Summe hat Dimension n, also (c). ∎

Für m = 7, r = 34 heißt das konkret (**behauptet**):
* dim ker W = 13, dim J = 7, dim Q = 6, n = dim N = 3, rk L = 6, rk H = 4, Σ = ⟨x_0⟩ eindimensional.
* Mit y_0 = f_0(x_0) und den Diagonalmatrizen P_i = D(e_{i,0}) D(e_{0,0})^{−1} (nach Skalierung D(e_{0,0}) = I, dann P_1 =: S, P_2 =: T): f_0(N) = ⟨y_0, S y_0, T y_0⟩, und S y_0, T y_0 ∈ f_0(N).
* Folglich liegen S²y_0, ST y_0, T²y_0 in J und S³y_0, S²T y_0, ST²y_0, T³y_0 in ker W (denn S J, T J ⊆ ker W).
* y_0, Sy_0, Ty_0 sind linear unabhängig (Normierung); ebenso Sy_0, S²y_0, STy_0 und Ty_0, STy_0, T²y_0.

### 2.3 Abgleich mit dem Ansatz von Tsyganov u. a. (behauptet)

In der Notation von arXiv:2609.22054 (h = dim ker W, F = f_0(N), f = dim F) liefern deren Ungleichungen (6), (7) für m = 7, h = 13 nur 3 ≤ f ≤ 5. Zusammen mit Satz A ist f = 3, und dann ist (6) mit Gleichheit erfüllt: 3m − f = 18 = 3(h − m). Folgerung: Das System (5) dort hat Rang 18, jede der drei Bedingungen hat vollen Rang h − m = 6 und die drei Ränge addieren sich. Anders gesagt ist die Abbildung
M : J³ → (ker W / J)³, (u,v,c) ↦ (Su + Tv, (X−Z)u + Tc, (X−Z)v − Sc) mod J
surjektiv mit Kern 0 × 0 × F.

Beide Normierungen (Yangs Lemma 6 und Tsyganovs Lemma 1) lassen sich gleichzeitig erreichen (**behauptet**): Tsyganovs Wechsel entspricht p = (1, τ) in Yangs Lemma 6; Yangs Ausnahmemengen sind Nullstellen endlich vieler von null verschiedener homogener Polynome in p, deren Dehomogenisierung in τ nicht null ist, also schließen beide Bedingungen nur endlich viele τ aus. Der erste Basisvektor u muss in beiden Fällen nur endlich viele Polynome vermeiden. Die Umskalierung α_i ↦ α_i/α_i(E_11), β_i ↦ α_i(E_11)β_i ändert D(a p)ℬ(B) nicht.

### 2.4 Was fehlt (Lücke)

Ein Widerspruch im Restfall von Satz A ist mir nicht gelungen. Bei Tsyganov u. a. schließt man Gleichheit aus, weil dort F unter S und T invariant wird und ein gemeinsamer Eigenvektor einen Rang-Widerspruch gibt. Hier ist nur Σ = ⟨y_0⟩ bekannt mit S Σ, T Σ ⊆ F = Σ + SΣ + TΣ. Invarianz von F würde S²y_0, STy_0, T²y_0 ∈ F verlangen, also S³y_0, S²Ty_0, ST²y_0, T³y_0 ∈ J. Das folgt aus den benutzten Ungleichungen nicht; sie sind im Restfall alle verträglich (die Zählungen in 2.2 und 2.3 lassen genau diesen Fall offen). Für einen Ausschluss braucht man eine Information, die weder Yang noch Tsyganov benutzen, etwa
* die zweite Spalte von A gleichzeitig (Rollen von e_{·,0} und e_{·,1} tauschen; liefert einen zweiten Restfall Σ' mit denselben Eigenschaften, eine Verbindung zwischen Σ und Σ' habe ich nicht gefunden), oder
* Werte von W auf Produkten wie S·Z·y, die durch die Verfahrensgleichung nicht festgelegt sind.

**Vermutet:** Der Restfall ist mit den Ungleichungen von Yang und Tsyganov u. a. allein nicht auszuschließen; es braucht eine neue Zutat. Belegt habe ich das nicht (dafür müsste man abstrakte Daten S, T, J, ker W, X, Z konstruieren, die alle benutzten Bedingungen erfüllen, aber von keinem Verfahren kommen).

Die Bedingung (c) ist für m = 7 inhaltsleer (drei unabhängige Vektoren in einem dreidimensionalen Raum). Für m ≥ 12 ist sie echt: dann ist dim Σ = n − 2 ≥ 4 und Lemma 8 gilt mit Gleichheit. Ob der Gleichheitsfall von Yangs Lemma 8 für dim Σ ≥ 2 eine invariante Teilmenge erzwingt, habe ich nicht untersucht.

### 2.5 Satz B (behauptet): Bedingung an die Stützpunkte von y_0

Voraussetzung: Restfall von Satz A für m = 7, r = 34, in der gemeinsamen Normierung aus 2.3 (D(e_{0,0}) = I, α_i = (1, s_i, t_i | λ_i) mit erster Spalte (1, s_i, t_i) und λ_i Linearform auf der zweiten Spalte z ∈ K³). Sei Ω = {i : (y_0)_i ≠ 0}, P_i = (s_i, t_i), und π_1, …, π_k die verschiedenen Punkte unter den P_i, i ∈ Ω. Setze Ĉ_j = Σ_{i∈Ω, P_i=π_j} (y_0)_i C_i und M_j(z) = Σ_{i∈Ω, P_i=π_j} λ_i(z) (y_0)_i C_i.

Dann gilt:
1. Für jedes Polynom g(s,t) vom Grad ≤ 3: Σ_j g(π_j) Ĉ_j = 0.
2. Für jedes Polynom g vom Grad ≤ 2 gibt es w_g ∈ K^{1×7} mit Σ_j g(π_j) M_j(z) = z·w_g für alle z ∈ K³, und w_g = 0 genau dann, wenn g auf allen π_j verschwindet.
3. Jedes M_j hat als lineare Abbildung K³ → K^{3×7} Rang ≤ 2.
4. Folgerung: **Kein Punkt π_j lässt sich durch Quadriken von den übrigen trennen**, d. h. jedes Polynom vom Grad ≤ 2, das auf allen π_l (l ≠ j) verschwindet, verschwindet auch in π_j. Außerdem k ≥ 3 und die π_j liegen nicht auf einer Geraden.

**Beweis.** Für deg g ≤ 2 liegt g(S,T)y_0 in J: für g = 1, s, t wegen y_0 ∈ f_0(N), für g = s², st, t² weil Sy_0, Ty_0 ∈ f_0(N) und S f_0(N), T f_0(N) ⊆ J nach Definition von N. Also g(S,T)y_0 = f_0(w_g) = ℬ((0; w_g)) für genau ein w_g (f_0 injektiv), und w_g = 0 ⇔ g(S,T)y_0 = 0 ⇔ g(P_i) = 0 für alle i ∈ Ω. Die Verfahrensgleichung mit B = (0; w_g) lautet Σ_i α_i(A) g(P_i)(y_0)_i C_i = A e_2 w_g.
Für A mit verschwindender zweiter Spalte und erster Spalte (a_1,a_2,a_3) ist α_i(A) = q(P_i) mit q = a_1 + a_2 s + a_3 t und A e_2 = 0. Produkte q·g mit deg q ≤ 1, deg g ≤ 2 spannen alle Polynome vom Grad ≤ 3 auf; Zusammenfassen nach Punkten gibt 1.
Für A = [0 | z] ist α_i(A) = λ_i(z) und A e_2 w_g = z w_g; Zusammenfassen gibt 2.
Zu 3: Nach Tsyganov u. a., Lemma 1 (2), ist dim span{α_i : P_i = π_j} ≤ 2. Alle diese α_i haben dieselbe erste Spalte φ = (1, s, t) ≠ 0, also liegt der Spann V nicht im Raum Λ der Formen auf der zweiten Spalte, und dim(V ∩ Λ) ≤ 1. Die Differenzen λ_i − λ_{i'} = α_i − α_{i'} liegen in V ∩ Λ = Kμ, also λ_i = λ_{i_0} + c_i μ und M_j(z) = λ_{i_0}(z) Ĉ_j + μ(z) Σ c_i (y_0)_i C_i. Das Bild liegt in einem höchstens zweidimensionalen Raum.
Zu 4: Gäbe es g, deg g ≤ 2, mit g(π_j) ≠ 0 und g(π_l) = 0 für l ≠ j, so wäre nach 2 g(π_j) M_j(z) = z w_g mit w_g ≠ 0, also z ↦ z w_g injektiv vom Rang 3, im Widerspruch zu 3. Nicht kollinear: y_0, Sy_0, Ty_0 sind unabhängig (Normierung). ∎

Bewertung (**vermutet**): Satz B schließt kleine oder „allgemeine" Punktmengen mit k ≤ 6 aus (für k ≤ 5 Punkte ohne vier auf einer Geraden trennen Kegelschnitte jeden Punkt), aber nicht große Stützmengen, z. B. k ≥ 7 Punkte in allgemeiner Lage. Ein vollständiger Ausschluss müsste die Rang-3-Bedingung aus 2 für alle Quadriken zusammen mit 1 ausnutzen; das habe ich nicht geschafft. Es ist ein möglicher Einstieg für eine endliche Fallunterscheidung.

## 3. Rechnungen

### 3.1 Rechenblock 1: Flip-Graph-Zufallswege über GF(2) (11:28:54 bis 11:50:33 UTC, 4 Kerne)

Programm: eigenes C-Programm (Zufallsweg im Flip-Graphen nach der Idee von Kauers und Moosbauer, mit Reduktionen und „Plus"-Übergängen bei Stillstand; Start vom Standardverfahren mit 42 Produkten; nach jeder Rangsenkung vollständige Prüfung der Tensoridentität über GF(2)). Quelltext steht unten in Anhang A.

| Lauf | Format | Zeit | Flips | bester Rang |
|---|---|---|---|---|
| Eichung, 4 Saaten | ⟨3,2,5⟩ | je ≤ 180 s | je ≤ 9·10⁷ | 25 in allen vier (bekannter Rang 25) |
| Saat 21 | ⟨3,2,7⟩ | 1200 s | 1,0·10⁹ | 35 |
| Saat 22 | ⟨3,2,7⟩ | 1200 s | 0,96·10⁹ | 35 |
| Saat 23 | ⟨3,2,7⟩ | 1200 s | 1,0·10⁹ | 36 |
| Saat 24 | ⟨3,2,7⟩ | 1200 s | 1,0·10⁹ | 35 |

Ergebnis: kein Verfahren mit 34 Produkten über GF(2) gefunden. Drei von vier Wegen erreichen 35 (das Hopcroft–Kerr-Niveau) nach 10 bis 18 Minuten. Das ist **schwache** Evidenz für 35 und nur über GF(2); die eigentliche Frage betrifft beliebige Körper. **Vermutet:** R_{GF(2)}(⟨3,2,7⟩) = 35.

### 3.2 Rechenblock 2: Levenberg–Marquardt über ℝ (11:50:51 bis 12:10:58 UTC, 4 Kerne)

Programm in Anhang B (gedämpftes Gauß–Newton mit kleiner Tikhonov-Regularisierung 1e−9, Zufallsstart, je 270 s). Eichung an ⟨3,2,3⟩ mit Rang 15: 2 von 3 Saaten konvergieren auf Residuum < 1e−14.

| Rang | Saaten | Residuum² (kleinste Werte) | max. Betrag der Faktoren |
|---|---|---|---|
| 35 (Eichung) | 100–103 | 1,0; 1,6e−3; 9,4e−4; 4,7e−4 | 10 bis 21 |
| 34 | 100–103, 200–203, 300–303 | 6,5e−4; 9,3e−4; 2,6e−3; sonst 1,0 bis 3,0 | 8 bis 16 |

Ergebnis: **ergebnislos.** Selbst für Rang 35, wo ein exaktes Verfahren existiert, erreicht kein Lauf in 270 s ein Residuum nahe null. Die kleinen Residuen bei 34 gehen mit wachsenden Faktoren einher und deuten eher auf Näherungen im Sinn des Grenzrangs als auf ein exaktes Verfahren (**vermutet**). Für eine Aussage über den Rang taugt der Block nicht; er ist hier nur der Vollständigkeit halber festgehalten.

## 4. Gescheiterte und verworfene Ansätze (mit Grund)

1. **Substitution Spalte für Spalte** (R(⟨3,2,m⟩) ≥ R(⟨3,2,m−1⟩) + 5): Die Standardsubstitution über eine Spalte von B gibt nur +2 (zwei B-Variablen); einen Zuwachs von 5 je Spalte konnte ich nicht begründen. Verworfen.
2. **Andere Lage der „2"**: ⟨3,2,7⟩ ≅ ⟨7,2,3⟩; Yangs Rahmen mit n = 7, m = 3 ergibt nur triviale Ungleichungen (dim Q = r − 24 = 10, Gleichung (1) wird 18 + rk H ≤ rk L + 60). Verworfen.
3. **F invariant machen wie bei Tsyganov u. a.**: Im Restfall ist nur die Kette Σ ⊂ F mit SΣ, TΣ ⊆ F bekannt; die nächste Stufe F_2 = Σ ist eindimensional und nicht invariant (y_0 kein Eigenvektor). Kein Widerspruch. Siehe 2.4.
4. **Satz B zu Ende führen**: Für Stützmengen mit k ≥ 7 Punkten in allgemeiner Lage liefern die Bedingungen 1 bis 3 aus 2.5 nur Zählungen wie 3·d ≤ 2k − c_3 (d = Rang der Auswertung der Quadriken, c_3 = Rang der Auswertung der Kubiken auf den π_j), die bei |Ω| ≤ 34 nicht widersprüchlich sind. Abgebrochen aus Zeitgründen, nicht widerlegt.

## 5. Ergebnis und Einschätzung

* Literatur: 34 ≤ R_K(⟨3,2,7⟩) ≤ 35 über jedem Körper (Yang; Tsyganov u. a.; Hopcroft–Kerr). Kein Beweis von 35 und kein Verfahren mit 34 gefunden.
* **Behauptet** (Satz A, Satz B): Ein Verfahren mit 34 Produkten müsste genau im Gleichheitsfall von Yangs Ungleichung liegen, mit dim N = 3, rk L = 6, dim Σ = 1, F = ⟨y_0, Sy_0, Ty_0⟩, Surjektivität von M, und die Stützpunkte von y_0 dürften sich durch Quadriken nicht trennen lassen.
* **Vermutet:** R_K(⟨3,2,7⟩) = 35 über jedem Körper. Grundlage: (i) Hopcroft–Kerr ist für m ≤ 6 exakt; (ii) Flip-Graph über GF(2) findet 35, nicht 34; (iii) Block 2 über ℝ war ergebnislos und trägt nichts bei. Ein Beweis fehlt; die Lücke ist in 2.4 und 2.5 benannt.

## 6. Suchprotokoll (wörtlich)

1. WebSearch standard: `tensor rank 2x3x7 matrix multiplication lower bound Hopcroft Kerr` → Treffer u. a. arXiv:2609.22054, 2603.07280, 2609.06725.
2. WebSearch standard: `bilinear complexity multiplication 2×3 matrix by 3×n matrix Alekseev lower bound` → arXiv:2609.22054, mathnet.ru cheb433 (Alekseev, m×2 mal 2×2).
3. Abruf https://arxiv.org/abs/2609.22054 (v1 vom 18.09.2026) und PDF; Abruf https://arxiv.org/abs/2609.14393 und PDF (v3 vom 12.10.2026).
4. Abruf https://fmm.univ-lille.fr/ und https://fmm.univ-lille.fr/2x3x7.html: ⟨2×3×7:35⟩.
5. WebSearch extended: `"3,2,7" OR "2,3,7" matrix multiplication tensor rank 35 lower bound 2026` → keine Quelle für einen exakten Wert; Treffer enthielt die GitHub-Seite dieses Repos (nicht geöffnet, siehe Abschnitt 0).

## Anhang A: Quelltext Flip-Graph (C)

```c
// Flip-graph random walk over GF(2) for <N,M,P> (A: N x M, B: M x P, C: N x P)
// tensor: sum a_{k,l} b_{l,j} c_{k,j}
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
typedef uint64_t u64;
#define MAXR 128
static int N,M,P;
static u64 A[MAXR],B[MAXR],C[MAXR]; static int R;
static u64 rs;
static inline u64 rnd(){ rs^=rs<<13; rs^=rs>>7; rs^=rs<<17; return rs; }
static int ai(int k,int l){return k*M+l;} static int bi(int l,int j){return l*P+j;} static int ci(int k,int j){return k*P+j;}
static void standard(){ R=0; for(int k=0;k<N;k++)for(int l=0;l<M;l++)for(int j=0;j<P;j++){A[R]=1ULL<<ai(k,l);B[R]=1ULL<<bi(l,j);C[R]=1ULL<<ci(k,j);R++;} }
static int verify(){ // check sum equals tensor
  for(int x=0;x<N*M;x++)for(int y=0;y<M*P;y++){ u64 acc=0; for(int r=0;r<R;r++) if(((A[r]>>x)&1)&&((B[r]>>y)&1)) acc^=C[r];
    int k=x/M,l=x%M, l2=y/P, j=y%P; u64 want = (l==l2)? (1ULL<<ci(k,j)) : 0; if(acc!=want) return 0;} return 1; }
static void delterm(int i){ R--; A[i]=A[R];B[i]=B[R];C[i]=C[R]; }
static int reduce(){ // merge terms sharing two factors; remove zero terms. return 1 if changed
  int ch=0; again:
  for(int i=0;i<R;i++){ if(!A[i]||!B[i]||!C[i]){delterm(i);ch=1;goto again;} }
  for(int i=0;i<R;i++)for(int j=i+1;j<R;j++){
    if(A[i]==A[j]&&B[i]==B[j]){C[i]^=C[j];delterm(j);ch=1;goto again;}
    if(A[i]==A[j]&&C[i]==C[j]){B[i]^=B[j];delterm(j);ch=1;goto again;}
    if(B[i]==B[j]&&C[i]==C[j]){A[i]^=A[j];delterm(j);ch=1;goto again;}
  } return ch; }
static int flip(){ // pick random pair sharing a factor; return 0 if none
  for(int tries=0;tries<1000;tries++){
    int i=rnd()%R, j=rnd()%R; if(i==j) continue;
    int w=rnd()%3;
    for(int t=0;t<3;t++,w=(w+1)%3){
      if(w==0 && A[i]==A[j]){ B[i]^=B[j]; C[j]^=C[i]; return 1; } // a(b_i+b_j)c_i + a b_j (c_j+c_i)
      if(w==1 && B[i]==B[j]){ C[i]^=C[j]; A[j]^=A[i]; return 1; }
      if(w==2 && C[i]==C[j]){ A[i]^=A[j]; B[j]^=B[i]; return 1; }
    }
  } return 0; }
static void plus(){ // increase rank by 1: split a term: a b c with a = a1+a2 ...
  int i=rnd()%R, j=rnd()%R; while(j==i) j=rnd()%R;
  // replace (a_i,b_i,c_i) by (a_i - a_j , b_i, c_i) + (a_j, b_i, c_i)
  u64 na=A[i]^A[j]; if(!na) return; A[i]=na; A[R]=A[j];B[R]=B[i];C[R]=C[i]; R++; }
int main(int argc,char**argv){
  N=atoi(argv[1]);M=atoi(argv[2]);P=atoi(argv[3]); int target=atoi(argv[4]); double tlim=atof(argv[5]); rs=strtoull(argv[6],0,10)*2654435761ULL+12345; long plateau=atol(argv[7]);
  standard(); reduce(); int best=R; time_t t0=time(0); long steps=0, since=0;
  static u64 bA[MAXR],bB[MAXR],bC[MAXR]; int bR=R; memcpy(bA,A,sizeof A);memcpy(bB,B,sizeof B);memcpy(bC,C,sizeof C);
  while(difftime(time(0),t0)<tlim){
    if(!flip()){ plus(); }
    reduce(); steps++; since++;
    if(R<best){ best=R; since=0; if(!verify()){printf("VERIFY FAIL\n");return 1;} printf("seed %s t=%.0f steps=%ld rank %d\n",argv[6],difftime(time(0),t0),steps,R); fflush(stdout);
      bR=R; memcpy(bA,A,sizeof A);memcpy(bB,B,sizeof B);memcpy(bC,C,sizeof C);
      if(R<=target){ for(int r=0;r<R;r++) printf("T %llx %llx %llx\n",(unsigned long long)A[r],(unsigned long long)B[r],(unsigned long long)C[r]); return 0; } }
    if(since>plateau){ // restart from best with a plus transition
      R=bR; memcpy(A,bA,sizeof A);memcpy(B,bB,sizeof B);memcpy(C,bC,sizeof C); plus(); since=0; }
    if(R>best+3){ R=bR; memcpy(A,bA,sizeof A);memcpy(B,bB,sizeof B);memcpy(C,bC,sizeof C); }
  }
  printf("seed %s done steps=%ld best %d\n",argv[6],steps,best); return 0; }
```

Aufruf: `./flip N M P Ziel Sekunden Saat Plateau`, Block 1: `./flip 3 2 7 34 1200 s 20000·s` für s = 21..24; Eichung `./flip 3 2 5 25 180 s 50000` für s = 11..14.

## Anhang B: Quelltext Levenberg–Marquardt (Python, numpy)

```python
import numpy as np, sys, time
def mm_tensor(n,l,m):
    T=np.zeros((n*l,l*m,n*m))
    for i in range(n):
        for j in range(l):
            for k in range(m):
                T[i*l+j, j*m+k, i*m+k]=1
    return T
def run(n,l,m,R,seed,iters=3000,tl=300,reg=1e-9):
    rng=np.random.default_rng(seed); T=mm_tensor(n,l,m); I,J,K=T.shape
    U=rng.normal(size=(I,R))*0.7;V=rng.normal(size=(J,R))*0.7;W=rng.normal(size=(K,R))*0.7
    lam=1e-2; t0=time.time()
    def res(U,V,W): return (np.einsum('ir,jr,kr->ijk',U,V,W)-T).ravel()
    r=res(U,V,W); f=r@r
    for it in range(iters):
        if time.time()-t0>tl: break
        # Jacobian
        JU=np.einsum('ia,jr,kr->ijkar',np.eye(I),V,W).reshape(I*J*K,I*R)
        JV=np.einsum('ir,ja,kr->ijkar',U,np.eye(J),W).reshape(I*J*K,J*R)
        JW=np.einsum('ir,jr,ka->ijkar',U,V,np.eye(K)).reshape(I*J*K,K*R)
        Jm=np.hstack([JU,JV,JW]); x=np.concatenate([U.ravel(),V.ravel(),W.ravel()])
        g=Jm.T@r + reg*x; A=Jm.T@Jm
        while True:
            d=np.linalg.solve(A+(lam+reg)*np.eye(A.shape[0]),-g)
            xn=x+d; Un=xn[:I*R].reshape(I,R);Vn=xn[I*R:I*R+J*R].reshape(J,R);Wn=xn[I*R+J*R:].reshape(K,R)
            rn=res(Un,Vn,Wn); fn=rn@rn
            if fn+reg*(xn@xn)<f+reg*(x@x): U,V,W,r,f=Un,Vn,Wn,rn,fn; lam=max(lam/3,1e-12); break
            lam*=4
            if lam>1e10: break
        if lam>1e10 or f<1e-24: break
    mx=max(abs(U).max(),abs(V).max(),abs(W).max())
    return f,mx,it,time.time()-t0
if __name__=="__main__":
    n,l,m,R=map(int,sys.argv[1:5]); seeds=range(int(sys.argv[5]),int(sys.argv[6])); tl=float(sys.argv[7])
    for s in seeds:
        f,mx,it,dt=run(n,l,m,R,s,tl=tl)
        print(f"fmt {n}x{l}x{m} R={R} seed={s} resid2={f:.3e} maxabs={mx:.2e} iters={it} t={dt:.0f}s",flush=True)
```

## Anhang C: Verbrauch

* Subagenten: 0. Fremdmodell-Anfragen: 0.
* Rechenblock 1: 11:28:54–11:50:33 UTC, 4 Kerne (Flip-Graph, C). Danach Commit 1313b61 (11:50:44).
* Rechenblock 2: 11:50:51–12:10:58 UTC, 4 Kerne (Levenberg–Marquardt, Python).
* Webabrufe: 3 Suchanfragen, 5 Seitenabrufe (Abschnitt 6).
