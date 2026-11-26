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

(wird fortgesetzt)

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
