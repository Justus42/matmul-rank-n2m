# Prüfbericht S5-04: Glieder K-1 bis K-12 der Kette zu 3×2×7

Gegenstand: `lean/prosa/s5_327_kette.md`, Stand Commit d6469d8 (SHA-256 der Datei c70e8053…cacc7a; auf `main` zum Zeitpunkt der Prüfung unverändert). Geprüft wurden Wortlaut, Voraussetzungen und jeder Beweisschritt der Glieder K-1 bis K-12 (Zeilen 109 bis 248), dazu die Begriffe in den Zeilen 12 bis 108 und die Zeilen der Tabelle in Abschnitt 11 (Zeilen 753 bis 806), soweit sie K-1 bis K-12 betreffen. Dieser Bericht setzt keinen Status.

## 0. Offenlegung

**Aus dem Projektgedächtnis eingeblendet.** Mir war der Index `MEMORY.md` des Projektgedächtnisses eingeblendet. Er enthält Projekt- und Verfahrensregeln: Repo, Ziel des Projekts (exakter Tensorrang von ⟨n,2,m⟩ für 4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6), Protokollfassung 0.6, Rechte und Grenzen des Orchestrators, Budget von Stufe 4, Regeln zum Fremdmodell, zu Prüfaufträgen, zu unabhängigen Suchern, zur Literaturwache und zu erreichbaren Webseiten, Hinweise zu Merges. Er enthält nach seinem eigenen Wortlaut nichts über Behauptungen, Beweise, Status oder Prüfurteile, und ich habe dort auch nichts dergleichen gesehen. Zusätzlich wurden mir drei Einzeleinträge eingeblendet: `aussagen-abgleich-n3` (Bridge-Freigabe, lokaler Lean-Bau), `gemini-bridge` (Bridge-Zeitlimit, Repo-Freigabe) und `lean-build-cloud` (Lean-Toolchain und mathlib-Cache in der Cloud). Keiner davon nennt ein Urteil zu einem Glied der Kette.

**Über die Positivliste hinaus gesehen.**
- `ls` des Repo-Wurzelverzeichnisses: nur die Namen der Einträge (unter anderem `LOG.md`, `STATUS.md`, `pruefvermerke`, `pruefer`, `entwurf`, `versuche`). Keinen dieser Inhalte gelesen.
- `grep` nach Überschriften in `PROTOKOLL.md`: Ich habe dabei die Überschriften aller Abschnitte gesehen, darunter „Stufe 4: 3×2×7 (34 oder 35?), enger Angriff auf den einen Restfall“ und „Stufe 5: Portierung für das Register Palomar und Festigung der Kette zu 3×2×7“. Gelesen habe ich nur Abschnitt 5 (Zeilen 206 bis 260).
- Git: `git status`, `git rev-parse`, `git fetch origin main`, Auschecken von `origin/main`, Prüfung, dass d6469d8 Vorfahre von `main` ist, `git diff --stat` und SHA-256 der Kettendatei zwischen d6469d8 und `main` (kein Unterschied). Kein `git log`, keine Commit-, PR- oder Zweiglisten.
- `ls lean/prosa/ | grep -c .`: nur die Anzahl der Einträge (53), keine Namen.
- Aus dem Auftrag weiß ich, dass andere Prüfer unabhängig an derselben Datei arbeiten. Ein Urteil eines anderen Prüfers oder ein erwünschtes Ergebnis kenne ich nicht.

## 1. Vorgehen

Jedes Glied wurde von Hand Schritt für Schritt nachvollzogen. Zusätzlich habe ich ein eigenes Python-Programm mit exakter Arithmetik (Brüche über ℚ, Restklassen über GF(p)) geschrieben (Anhang A). Es prüft:

| Prüfung | Ergebnis |
|---|---|
| K-3: Rang der Abbildung 𝒮_2³ → 𝒮_3, dim ℛ, Rang von δ_K, Bild von δ_K in ℛ, über ℚ, GF(2), GF(3), GF(5) | 10, 8, 8, ja (in allen vier Körpern) |
| K-4 (c): Dimension der Kegelschnitte durch 5 Punkte in allgemeiner Lage, 2000 Zufallsversuche über ℚ | höchstens 1 |
| K-5: Nullstellenzahl binärer Formen auf P¹(GF(7)) | stets ≤ d + 1 |
| K-10: V^{(S,T)} erfüllt die Brent-Gleichungen; Koeffizientenmatrix Sᵀα_tTᵀ; Werte auf e_{i0}, e_{i1} (m = 1, 2, 3, zufällige S, T über ℚ) | alles bestätigt |
| K-11 Schritt 2: Injektivität von x ↦ D(xp)ℬ(v) genau dann, wenn M_{supp(v)}(p) Rang 3 hat; Injektivität bei pv ≠ 0 (vollständige Aufzählung über GF(11), m = 1, und GF(7), m = 2) | bestätigt |
| K-11 Schritt 4/5 und K-12: Ist α_t(s_0p) ≠ 0 für alle t und hat jedes M_Σ(p) Rang 3, dann gelten (SN1), (SN2) für V^{(S,T)} und für die Normalform, a_0 = 1, f̂_0 = ℬ̂, f̂_i = a_i·f̂_0 (vollständige Aufzählung aller x ≠ 0, 35 bzw. 20 Paare (S, T)) | bestätigt |

Die Rechnungen über endlichen Körpern prüfen nur die körperunabhängigen Schritte (Kriterium in Schritt 2, Schluss in Schritt 4 und 5, Skalierung). Die Existenz einer guten Stelle (K-1 (a)) braucht einen unendlichen Körper und wurde nicht numerisch, sondern von Hand geprüft. Laufzeit des Programms: etwa 4 Sekunden.

## 2. Urteile je Glied

| Glied | Urteil |
|---|---|
| K-1 | bestätigt |
| K-2 | bestätigt |
| K-3 | bestätigt |
| K-4 | bestätigt |
| K-5 | bestätigt |
| K-6 | bestätigt |
| K-7 | bestätigt |
| K-8 | bestätigt (kleine Beweislücke bei „Proportionalität“, siehe 2.8, ohne Folgen für die Richtigkeit) |
| K-9 | bestätigt |
| K-10 | bestätigt |
| K-11 | bestätigt |
| K-12 | bestätigt |

Keine echte Lücke gefunden. Alle Ungenauigkeiten sind unten je Glied unter „Kleine Ungenauigkeiten“ getrennt aufgeführt; keine davon ändert die Richtigkeit eines Wortlauts in der Lesart, in der die Datei ihn benutzt.

### 2.1 K-1 (Polynome über unendlichen Körpern), Zeilen 111 bis 124

**Voraussetzungen:** „keine“ ist richtig; benutzt wird nur Elementares (Nullstellenzahl eines Polynoms in einer Variablen, Nullteilerfreiheit von Polynomringen).

**Beweis.** (a) Induktion über n: Basis n = 1 richtig (höchstens d Nullstellen, K unendlich). Schritt: Wahl eines j mit P_j ≠ 0, Stelle x′ mit P_j(x′) ≠ 0 nach Induktion; dann ist P(x′, x_n) ein Polynom ≠ 0 in x_n. Richtig. (b) richtig. (c) U_i ≠ ∅ liefert ein f_i ∈ M_i, das an einer Stelle von X nicht verschwindet, also f_i ≠ 0 als Polynom, und {x ∈ X : f_i(x) ≠ 0} ⊆ U_i. Mit (b) ist f_1f_2h ≠ 0, mit (a) gibt es eine Stelle, an der alle drei nicht verschwinden; sie liegt in X (wegen h) und in U_1 ∩ U_2. Offenheit des Durchschnitts: U_1 ∩ U_2 = {x ∈ X : nicht alle f·g mit f ∈ M_1, g ∈ M_2 verschwinden}. Richtig. Die Anwendung auf 𝒢 ⊆ K^13 mit h = det S·det T ≠ 0 ist richtig.

**Kleine Ungenauigkeiten.**
- Zeile 116: „Zariski-offen“ ist nicht festgelegt als offen in K^n oder offen in X. Der Beweis (Zeile 122) liest es relativ zu X, wie die Definition für 𝒢 in Abschnitt 1.3 (Zeile 77). Beide Lesarten führen zum selben Ergebnis, weil eine in K^n offene Teilmenge von X auch in X offen ist.
- Der Fall n = 0 (konstante Polynome) ist in (a) nicht genannt; er ist trivial.

### 2.2 K-2 (Interpolation), Zeilen 126 bis 132

**Voraussetzungen:** „keine“ ist richtig. Beliebiger Körper genügt.

**Beweis.** λ_{ξ′}(ξ′) = 0 und λ_{ξ′}(ξ) = ξ_i − ξ′_i ≠ 0. Der Nenner ist ein Produkt von Elementen ≠ 0. Für Π = {ξ} ist χ_ξ = 1 (leeres Produkt), auch richtig. Die Interpolationsformel ist richtig.

**Kleine Ungenauigkeiten.** Keine.

### 2.3 K-3 (Koszul im Grad 2), Zeilen 134 bis 144

**Voraussetzungen:** „keine“ ist richtig; benutzt wird die Faktorialität von 𝒮 (Standardalgebra, kein Glied).

**Beweis.** Surjektivität 𝒮_2³ → 𝒮_3 und dim ℛ = 18 − 10 = 8: richtig. Die drei Komponenten von δ_K ergeben Σ X_i·(Komponente i) = 0: von Hand nachgerechnet. Kern: Aus Ψ_{01}X_1 = −Ψ_{02}X_2 folgt X_2 | Ψ_{01} (X_2 prim, teilt X_1 nicht), also Ψ_{01} = cX_2, Ψ_{02} = −cX_1; aus der zweiten Komponente Ψ_{12} = cX_0. Umgekehrt verschwinden für (cX_2, −cX_1, cX_0) alle drei Komponenten (die dritte: cX_1X_0 − cX_0X_1 = 0). Kern Dimension 1, Bild Dimension 8 = dim ℛ. Die Umschreibung mit Ψ_{ii} = 0, Ψ_{ki} = −Ψ_{ik} gibt genau Φ_i = Σ_k Ψ_{ik}X_k. Es wird an keiner Stelle durch 2 geteilt; die Aussage gilt in jeder Charakteristik. Programm: Ränge 10, 8, 8 über ℚ, GF(2), GF(3), GF(5).

**Kleine Ungenauigkeiten.** Keine.

### 2.4 K-4 (Geraden und Kegelschnitte), Zeilen 146 bis 158

**Voraussetzungen:** „K-1“ ist richtig (benutzt wird K-1 (a) in (a)).

**Beweis.** (a) Drei verschiedene Punkte auf ℒ geben drei verschiedene Parameter s; ein Polynom vom Grad ≤ 2 in s mit drei Nullstellen ist null, also g = 0 auf ℒ. Nach affiner Koordinatenänderung mit a′_1 = λ (möglich, weil λ Grad genau 1 hat) ist g = a′_1g′ + h(a′_2), h verschwindet auf ganz K, also h = 0; Gradvergleich gibt g′ ∈ P_1. Richtig. (b) Aus g = λg′ mit Grad g = 2 folgt Grad g′ = 1, und die Homogenisierung ist multiplikativ: ĝ = λ̂·ĝ′ mit zwei Formen vom Grad 1, Widerspruch zur Irreduzibilität. Der Zusatz „nicht unendlich viele“ folgt. Richtig. (c) Wahl von η auf ℒ_{12} verschieden von ξ_1, ξ_2; Kombination h ≠ 0 mit h(η) = 0; (a) gibt h = λ_{12}h′; λ_{12}(ξ_j) ≠ 0 für j = 3, 4, 5, also h′(ξ_j) = 0; h′ konstant oder vom Grad 1 führt zu h′ = 0 bzw. zu drei kollinearen Punkten. Richtig. Programm: Dimension höchstens 1 in 2000 Zufallsversuchen.

**Kleine Ungenauigkeiten.**
- Zeile 148: „irreduzibel“ ohne Angabe des Rings; gemeint ist offenbar 𝒮 = K[X_0, X_1, X_2] über demselben K. Bei algebraisch abgeschlossenem K (Abschnitt 1.3) ist das eindeutig.
- Die Variablen von P_2 (1.4: „zwei Variablen“, gemeint a_1, a_2) werden in der Homogenisierung stillschweigend mit X_1, X_2 identifiziert.
- (a) gilt über jedem Körper; „unendlich“ wird erst in (c) gebraucht (Wahl von η). Kein Fehler.

### 2.5 K-5 (homogene Polynome in zwei Variablen), Zeilen 160 bis 166

**Voraussetzungen:** „keine“ ist richtig.

**Beweis.** Q(λp) = λ^dQ(p); Q(x, 1) = Σ q_ix^i ist nicht das Nullpolynom, hat also höchstens d Nullstellen; dazu höchstens [1 : 0]. Die [x : 1] sind paarweise verschieden und unendlich viele, davon höchstens d Nullstellen. Richtig. Programm: auf P¹(GF(7)) stets höchstens d + 1 Nullstellen.

**Kleine Ungenauigkeiten.** Zeile 166: „Die übrigen Elemente von P¹(K) sind die [x : 1] und [1 : 0]“ ist unglücklich formuliert; gemeint ist „P¹(K) besteht aus den [x : 1], x ∈ K, und [1 : 0]“.

### 2.6 K-6 (Zerlegung eines 𝒜-Moduls nach Fasern), Zeilen 168 bis 181

**Voraussetzungen:** „K-2“ ist richtig.

**Beweis.** (i) richtig. (ii) Zerlegung v = Σ_ξ χ_ξ·v, Direktheit wegen disjunkter Träger, M ∩ K^{T_ξ} = χ_ξ·M: richtig. (iii) Weil X Vereinigung von Fasern ist, liegt jede Faser ganz in X oder ganz außerhalb; daraus folgen die Zerlegung von M ∩ K^X, die Bijektivität der Einschränkung und die Dimensionsformel. Richtig. (iv) richtig, siehe unten.

**Kleine Ungenauigkeiten.**
- Zeile 177: „Weil M ein 𝒜-Modul ist, gilt χ_ξ·M ⊆ M.“ Die Definition in 1.4 (Zeile 97) verlangt nur a_1·M ⊆ M und a_2·M ⊆ M. Der Schritt zu f·M ⊆ M für alle f ∈ 𝒜 braucht die (fehlende, aber triviale) Bemerkung, dass die Wirkung mit Summe und Produkt verträglich ist ((fg)·v = f·(g·v)) und M ein Unterraum ist.
- Zeile 179 (iv): Gezeigt ist nur „⊆“. „⊇“ folgt mit f = Konstante c; nicht ausgeschrieben.
- Zeile 170: Π, T_ξ, χ_ξ werden „wie in 1.4“ genommen, 1.4 definiert sie aber nur für eine Normalform mit r = 34. Die Übertragung auf beliebige Punkte ξ(t), t = 1, …, r, ist offensichtlich gemeint. Ebenso hat M_ξ in K-6 eine andere (allgemeinere) Bedeutung als M_ξ := χ_ξ·K″ in 1.4 (Zeile 104); die Bedeutungen stimmen für M = K″ überein.

### 2.7 K-7 (Grundtatsachen über Verfahren), Zeilen 187 bis 201

**Voraussetzungen:** „Nur (Z)“ ist richtig; (SN1) steht als Annahme im Wortlaut von (T4).

**Beweis.** (D1) richtig. (D2): W(D(A)ℬ(y)) = Σ_t α_t(A)β_t(y)C_t, also (Z). (T1): Zeile 0 von e_{00}B ist Zeile 0 von B, Zeile 0 von e_{01}B ist Zeile 1 von B; richtig. (T2): e_{il}^{(3×m)} = e_{i0}e_{0l} liegt im Bild; Basis. (T3): Rangsatz. (T4): Komposition einer invertierbaren mit einer injektiven Abbildung. (T5): (D2) mit A = e_{i0}; e_{i0}^{(3×2)}·x hat in Zeile i die Zeile 0 von x. Alles richtig.

**Kleine Ungenauigkeiten.** 1.2 ist für einen Körper F geschrieben, K-7 für K; die Bezeichnungen übertragen sich wörtlich.

### 2.8 K-8 (R1: Körpererweiterung), Zeilen 203 bis 209

**Voraussetzungen:** „keine“ ist richtig.

**Beweis.** Brent-Gleichungen sind Gleichungen in den Koeffizienten, gelten also über K; (Z) über K folgt aus der Äquivalenz in 1.1, die über jedem Körper gilt. Rang ist invariant unter Körpererweiterung (Rang über Minoren). α_t = 0 über K genau dann, wenn über F: trivial. Richtig.

**Kleine Ungenauigkeiten (Beweis unvollständig in einem Nebenpunkt).**
- Zeile 205/209: Der Wortlaut behauptet, „Proportionalität“ ändere sich nicht; der Beweis sagt dazu nichts. Der Begriff ist in den Zeilen 12 bis 108 nicht definiert. In der naheliegenden Lesart (α_s = c·α_t mit c ∈ K bzw. c ∈ F, oder: das Paar hat Rang ≤ 1) ist die Aussage richtig: Ist α_t ≠ 0 und α_s = cα_t mit c ∈ K, dann ist c Quotient zweier Einträge aus F, also c ∈ F; in der Rang-Lesart folgt es aus der Rang-Invarianz. Ein Satz im Beweis würde die Lücke schließen.

### 2.9 K-9 (R2: Nullformen streichen), Zeilen 211 bis 217

**Voraussetzungen:** „keine“ ist richtig. **Beweis:** richtig.

**Kleine Ungenauigkeiten.** Der Wortlaut nennt V, r, m und den Körper nicht ausdrücklich; sie ergeben sich aus dem Zusammenhang (K-8, 1.1).

### 2.10 K-10 (R3: Basiswechsel), Zeilen 219 bis 225

**Voraussetzungen:** „keine“ ist richtig.

**Beweis.** Σ_tα_t(SAT)β_t(T^{−1}B)S^{−1}C_t = S^{−1}(SAT)(T^{−1}B) = AB: richtig. Koeffizientenmatrix: Σ_{ij}M_{ij}X_{ij} = Spur(MᵀX) und Spur(α_tᵀSAT) = Spur(Tα_tᵀSA) = Spur((Sᵀα_tTᵀ)ᵀA): richtig. Rang, Proportionalität, Spaltenräume (Spaltenraum von Sᵀα_tTᵀ ist Sᵀ·Spaltenraum von α_t): richtig. S·e_{i0}·T = s_i·p, S·e_{i1}·T = s_i·p′ und α(xp) = xᵀαpᵀ: richtig. Programm: alle Teilaussagen für m = 1, 2, 3 und zufällige S, T bestätigt.

**Kleine Ungenauigkeiten.** Wie bei K-9 nennt der Wortlaut V nicht selbst; es ist das V aus 1.3 (Zeile 69), dort über „einem Körper K“, also nicht notwendig dem algebraischen Abschluss. Das ist richtig so, weil K-10 über jedem Körper gilt.

### 2.11 K-11 (Lemma A′: starke Normalisierung, mit Polynom), Zeilen 227 bis 240

**Voraussetzungen:** „K-1, K-7 (D2), K-10“ ist vollständig: K-1 (b) in Schritt 4, K-1 (a) im Zusatz, (D2) in Schritt 2, K-10 in Schritt 5. Die Annahme „kein α_t ist die Nullform“ wird in Schritt 1 benutzt, „r ≥ 1“ im Zusatz (s_0 ≠ 0, p ≠ 0 aus α_1(s_0p) ≠ 0).

**Beweis.**
- Schritt 1: α_t(s_0p) = Σ(α_t)_{ij}(s_0)_ip_j; die Monome (s_0)_ip_j sind paarweise verschieden, also ist das Polynom ≠ 0 genau dann, wenn α_t ≠ 0. Homogen vom Grad 1 in p. Richtig.
- Schritt 2: (D(xp)ℬ(v))_t = α_t(xp)ℬ(v)_t und α_t(xp) = Σ_i x_iα_t(e_ip) = (M(p)x)_t, also ist die Abbildung genau dann injektiv, wenn M_{supp(v)}(p) (3 Spalten) Rang 3 hat. Bei pv ≠ 0 folgt aus D(xp)ℬ(v) = 0 mit (D2) x·(pv) = 0 (äußeres Produkt), also x = 0. Richtig. Programm: Kriterium und Folgerung über GF(11) und GF(7) vollständig bestätigt.
- Schritt 3: 𝒮 endlich, Wahl von v_Σ und p_Σ (ein Einheitsvektor reicht, weil v_Σ ≠ 0), Rang 3 gibt einen Minor q_Σ mit q_Σ(p_Σ) ≠ 0, homogen vom Grad 3 in p. Richtig. Entscheidend und richtig: Das Injektivitätskriterium hängt nur von supp(v) ab, daher deckt ein Polynom je Träger alle v mit diesem Träger ab.
- Schritt 4: Λ ≠ 0 nach K-1 (b), homogen in p (Grad r + 3|𝒮|). Richtig.
- Schritt 5: D′(e_{i0}) = D(s_ip), ℬ′(v) = ℬ(T^{−1}v), (SN1) und (SN2) folgen, weil Σγ_iD(s_ip) = D((Σγ_is_i)p) und S invertierbar ist. Richtig. Programm: unter den Bedingungen von Schritt 4 gelten (SN1) und (SN2) in allen geprüften Fällen.
- Zusatz: K-1 (a) braucht K unendlich und Λ ≠ 0; Ergänzung von s_0 ≠ 0 und p ≠ 0 zu invertierbaren S, T. Richtig.

**Kleine Ungenauigkeiten.**
- Zeile 229: Der Wortlaut sagt „Sei K unendlich“. Abschnitt 1.3 (Zeile 75) legt aber ab Abschnitt 3 fest, dass K der algebraische Abschluss von F ist, und definiert 𝒢* nur in diesem Rahmen (Zeile 78). Es ist damit nicht ganz eindeutig, ob K-11 für jeden unendlichen Körper oder nur für den algebraischen Abschluss gemeint ist. Beweis und Definition von 𝒢* funktionieren für jeden unendlichen Körper, also ist der Wortlaut in beiden Lesarten richtig.
- Das Polynom Λ hängt von V und von der Wahl der Minoren q_Σ ab; der Wortlaut („es gibt ein Polynom“) erlaubt das.

### 2.12 K-12 (Skalierung; Eigenschaften einer Normalform), Zeilen 242 bis 246

**Voraussetzungen:** „K-10“ ist richtig; dazu die Definition von 𝒢* ((SN1) und (SN2) für V^{(S,T)}), die im Wortlaut als Annahme (S, T) ∈ 𝒢* steht.

**Beweis.** c_t ≠ 0 nach (SN1) für V^{(S,T)}; Σ(α′_t/c_t)(A)β′_t(B)(c_tC′_t) = AB mit K-10; α̂_t(e_{00}) = 1 gibt (SN1); D̂(A) = D′(e_{00})^{−1}D′(A), ℬ̂ = ℬ′, f̂_i = D′(e_{00})^{−1}f′_i, und lineare Unabhängigkeit bleibt unter einer invertierbaren Diagonalmatrix erhalten: (SN2). Koeffizientenmatrix (1/c_t)·Sᵀα_tTᵀ, Rang wie α_t nach K-10. D̂(e_{00}) = I, D̂(e_{i0}) = diag(a_i), f̂_i(x) = a_i·ℬ̂(x) = a_i·f̂_0(x). Alles richtig. Programm: a_0 = 1, f̂_0 = ℬ̂, f̂_i = a_i·f̂_0, (SN2) für V̂ bestätigt.

**Kleine Ungenauigkeiten.** Zeile 244: „mit a_i aus 1.4“. Abschnitt 1.4 ist überschrieben „(m = 7, r = 34)“ (Zeile 88) und definiert a_i nur dort, K-12 gilt aber für beliebige r, m. Die Definition a_i := (α̂_t(e_{i0}))_t überträgt sich wörtlich; gemeint ist offenbar das.

## 3. Abgleich mit der Liste der Glieder (Abschnitt 11)

Für K-1 bis K-12 stimmt die Spalte „benutzt“ der Tabelle (Zeilen 759 bis 770) mit der Zeile „Voraussetzungen“ des jeweiligen Glieds überein (bei K-7 steht in der Tabelle „–“ für „Nur (Z)“). Innerhalb des Blocks stimmt auch die Spalte „benutzt von“: K-1 wird von K-4 und K-11 benutzt, K-2 von K-6, K-7 von K-11, K-10 von K-11 und K-12; K-3, K-5, K-8, K-9 werden im Block nicht benutzt. Jedes Glied des Blocks benutzt nur Glieder mit kleinerer Nummer. Die Einträge der Spalte „benutzt von“ außerhalb des Blocks (K-13 und höher) und die Spalte „Endsatz“ habe ich nicht geprüft, weil die zugehörigen Glieder nicht zu meinem Auftrag gehören.

Kein Glied des Blocks benutzt etwas, das in den Zeilen 12 bis 248 nirgends definiert oder bewiesen ist, mit zwei Ausnahmen, die nur den Wortlaut betreffen: der Begriff „Proportionalität“ (K-8, K-10) ist nicht definiert, und a_i sowie Π, T_ξ werden außerhalb des Rahmens von 1.4 (m = 7, r = 34) benutzt (K-6, K-12). Benutzt werden außerdem Standardtatsachen der linearen Algebra und Algebra (Rangsatz, Rang über Minoren, Faktorialität von Polynomringen, Nullstellenzahl univariater Polynome), die nicht als Glieder geführt werden; das entspricht den Lesehinweisen.

## 4. Verbrauch

Keine Subagenten, keine Fremdmodell-Anfragen. Ein Rechenblock von etwa 4 Sekunden.

## Anhang A: Prüfprogramm

Python 3, nur Standardbibliothek, exakte Arithmetik. Aufruf: `python3 -I check_k1_k12.py`.

Ausgabe:

```
K-3 over Q rank mult, dim R, rank delta, image in R: (10, 8, 8, True)
K-3 over GF(2) rank mult, dim R, rank delta, image in R: (10, 8, 8, True)
K-3 over GF(3) rank mult, dim R, rank delta, image in R: (10, 8, 8, True)
K-3 over GF(5) rank mult, dim R, rank delta, image in R: (10, 8, 8, True)
K-4(c): max dim of conics through 5 random points in general position: 1
K-5: zero count <= d+1 on P^1(GF(7)): True
K-10 checks (scheme property, S^T a T^T, values on e_i0/e_i1): True
K-11/K-12 m=1 GF(11): step-2 criterion ok, tested (S,T), SN1+SN2+scaling ok: (True, 35, True)
K-11/K-12 m=2 GF(7): step-2 criterion ok, tested (S,T), SN1+SN2+scaling ok: (True, 20, True)
```

Quelltext:

```python
"""Independent sanity checks for chain links K-3, K-4(c), K-5, K-10, K-11, K-12.

Exact arithmetic only: fractions.Fraction over Q, integers mod p over GF(p).
"""
import itertools
import random
from fractions import Fraction

random.seed(20261126)


# ---------- generic exact linear algebra ----------
def rank(rows, p=None):
    """Rank of a matrix (list of rows); over Q if p is None, else over GF(p)."""
    M = [list(r) for r in rows]
    if not M:
        return 0
    if p is None:
        M = [[Fraction(x) for x in r] for r in M]
    else:
        M = [[x % p for x in r] for r in M]
    n, m = len(M), len(M[0])
    rk = 0
    for c in range(m):
        piv = next((i for i in range(rk, n) if M[i][c] != 0), None)
        if piv is None:
            continue
        M[rk], M[piv] = M[piv], M[rk]
        inv = (1 / M[rk][c]) if p is None else pow(M[rk][c], p - 2, p)
        for i in range(n):
            if i != rk and M[i][c] != 0:
                f = M[i][c] * inv
                M[i] = [(a - f * b) if p is None else (a - f * b) % p for a, b in zip(M[i], M[rk])]
        rk += 1
    return rk


# ---------- K-3: Koszul in degree 2 ----------
def monomials(deg):
    return [e for e in itertools.product(range(deg + 1), repeat=3) if sum(e) == deg]


def k3(p):
    M1, M2, M3 = monomials(1), monomials(2), monomials(3)
    idx3 = {e: i for i, e in enumerate(M3)}
    idx2 = {e: i for i, e in enumerate(M2)}
    X = [(1, 0, 0), (0, 1, 0), (0, 0, 1)]
    add = lambda a, b: tuple(x + y for x, y in zip(a, b))
    # map S2^3 -> S3, (Phi_i) -> sum X_i Phi_i ; columns = basis of S2^3
    cols = []
    for i in range(3):
        for e in M2:
            v = [0] * len(M3)
            v[idx3[add(X[i], e)]] += 1
            cols.append(v)
    rk_mult = rank(cols, p)  # rank of the transposed matrix = rank
    dimR = 18 - rk_mult
    # delta_K : S1^3 -> S2^3, (Psi01, Psi02, Psi12)
    # components: (Psi01 X1 + Psi02 X2, -Psi01 X0 + Psi12 X2, -Psi02 X0 - Psi12 X1)
    terms = {0: [(0, 1, +1), (1, 2, +1)],      # (which Psi, which X, sign) for component 0
             1: [(0, 0, -1), (2, 2, +1)],
             2: [(1, 0, -1), (2, 1, -1)]}
    dcols = []
    for which in range(3):
        for e in M1:
            v = [0] * 18
            for comp in range(3):
                for (w, xk, s) in terms[comp]:
                    if w == which:
                        v[comp * 6 + idx2[add(e, X[xk])]] += s
            dcols.append(v)
    rk_delta = rank(dcols, p)
    # image of delta lies in R: check sum X_i comp_i = 0 for every column
    in_R = True
    for v in dcols:
        s = [0] * len(M3)
        for comp in range(3):
            for e in M2:
                c = v[comp * 6 + idx2[e]]
                if c:
                    s[idx3[add(e, X[comp])]] += c
        if any((x % p if p else x) for x in s):
            in_R = False
    return rk_mult, dimR, rk_delta, in_R


for p in (None, 2, 3, 5):
    print("K-3 over", "Q" if p is None else f"GF({p})", "rank mult, dim R, rank delta, image in R:", k3(p))


# ---------- K-4 (c): five points, no three collinear, conics through them ----------
def conic_row(x, y):
    return [1, x, y, x * x, x * y, y * y]


def collinear(a, b, c):
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0]) == 0


worst = 0
for _ in range(2000):
    pts = set()
    while len(pts) < 5:
        pts.add((random.randint(-3, 3), random.randint(-3, 3)))
    pts = list(pts)
    if any(collinear(*t) for t in itertools.combinations(pts, 3)):
        continue
    dim = 6 - rank([conic_row(*q) for q in pts])
    worst = max(worst, dim)
print("K-4(c): max dim of conics through 5 random points in general position:", worst)


# ---------- K-5: homogeneous binary forms ----------
def k5(trials=300, p=7):
    ok = True
    for _ in range(trials):
        d = random.randint(0, 4)
        q = [random.randint(0, p - 1) for _ in range(d + 1)]
        if not any(q):
            continue
        pts = [(x, 1) for x in range(p)] + [(1, 0)]  # P^1(GF(p))
        zeros = sum(1 for (a, b) in pts if sum(q[i] * pow(a, i, p) * pow(b, d - i, p) for i in range(d + 1)) % p == 0)
        if zeros > d + 1:
            ok = False
    return ok
print("K-5: zero count <= d+1 on P^1(GF(7)):", k5())


# ---------- schemes for <3,2,m> ----------
def standard_scheme(m):
    """alpha_t = e_ij (3x2), beta_t = e_jl (2xm), C_t = e_il (3xm)."""
    sch = []
    for i in range(3):
        for j in range(2):
            for l in range(m):
                a = [[0] * 2 for _ in range(3)]; a[i][j] = 1
                b = [[0] * m for _ in range(2)]; b[j][l] = 1
                c = [[0] * m for _ in range(3)]; c[i][l] = 1
                sch.append((a, b, c))
    return sch


def mat_mul(A, B):
    return [[sum(A[i][k] * B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]


def transpose(A):
    return [list(r) for r in zip(*A)]


def form(coef, X):
    return sum(coef[i][j] * X[i][j] for i in range(len(X)) for j in range(len(X[0])))


def is_scheme(sch, m, p=None):
    """Brent equations, exact."""
    for i in range(3):
        for j in range(2):
            for k in range(2):
                for l in range(m):
                    A = [[0] * 2 for _ in range(3)]; A[i][j] = 1
                    B = [[0] * m for _ in range(2)]; B[k][l] = 1
                    lhs = [[0] * m for _ in range(3)]
                    for (a, b, c) in sch:
                        s = form(a, A) * form(b, B)
                        for u in range(3):
                            for v in range(m):
                                lhs[u][v] += s * c[u][v]
                    rhs = mat_mul(A, B)
                    for u in range(3):
                        for v in range(m):
                            x = lhs[u][v] - rhs[u][v]
                            if (x % p if p else x) != 0:
                                return False
    return True


def inv2(T):
    d = Fraction(T[0][0] * T[1][1] - T[0][1] * T[1][0])
    return [[T[1][1] / d, -T[0][1] / d], [-T[1][0] / d, T[0][0] / d]]


def inv3(S):
    a = [[Fraction(x) for x in r] + [Fraction(int(i == j)) for j in range(3)] for i, r in enumerate(S)]
    for c in range(3):
        piv = next(i for i in range(c, 3) if a[i][c] != 0)
        a[c], a[piv] = a[piv], a[c]
        f = a[c][c]
        a[c] = [x / f for x in a[c]]
        for i in range(3):
            if i != c and a[i][c] != 0:
                g = a[i][c]
                a[i] = [x - g * y for x, y in zip(a[i], a[c])]
    return [r[3:] for r in a]


def rand_inv(n):
    while True:
        M = [[random.randint(-3, 3) for _ in range(n)] for _ in range(n)]
        if rank(M) == n:
            return M


def coef_of_transformed(alpha, S, T):
    """Coefficient matrix of A -> alpha(S A T), computed by evaluation on basis matrices."""
    out = [[0] * 2 for _ in range(3)]
    for i in range(3):
        for j in range(2):
            A = [[0] * 2 for _ in range(3)]; A[i][j] = 1
            out[i][j] = form(alpha, mat_mul(mat_mul(S, A), T))
    return out


def transform(sch, S, T, m):
    """V^{(S,T)} with coefficient matrices: alpha' = coefficient of A->alpha(SAT),
    beta' = coefficient of B->beta(T^{-1}B), C' = S^{-1} C."""
    Ti, Si = inv2(T), inv3(S)
    new = []
    for (a, b, c) in sch:
        a2 = coef_of_transformed(a, S, T)
        b2 = [[0] * m for _ in range(2)]
        for k in range(2):
            for l in range(m):
                B = [[0] * m for _ in range(2)]; B[k][l] = 1
                b2[k][l] = form(b, mat_mul(Ti, B))
        c2 = mat_mul(Si, c)
        new.append((a2, b2, c2))
    return new


# K-10: coefficient matrix S^T alpha T^T, values on e_i0, e_i1, scheme property
ok10 = True
for m in (1, 2, 3):
    sch = standard_scheme(m)
    for _ in range(5):
        S, T = rand_inv(3), rand_inv(2)
        new = transform(sch, S, T, m)
        if not is_scheme(new, m):
            ok10 = False
        for (a, _, _), (a2, _, _) in zip(sch, new):
            if a2 != mat_mul(mat_mul(transpose(S), a), transpose(T)):
                ok10 = False
            for i in range(3):
                s_i = [S[r][i] for r in range(3)]
                for row, jj in ((T[0], 0), (T[1], 1)):
                    val = sum(s_i[x] * a[x][y] * row[y] for x in range(3) for y in range(2))
                    if a2[i][jj] != val:
                        ok10 = False
        # random non-standard alpha too
        for _ in range(5):
            a = [[random.randint(-3, 3) for _ in range(2)] for _ in range(3)]
            if coef_of_transformed(a, S, T) != mat_mul(mat_mul(transpose(S), a), transpose(T)):
                ok10 = False
print("K-10 checks (scheme property, S^T a T^T, values on e_i0/e_i1):", ok10)


# K-11 / K-12 on the standard scheme (and a randomly transformed one) over GF(p), brute force
def k11_k12(m, p, trials):
    sch0 = standard_scheme(m)
    # make a scheme whose alphas are not unit matrices: transform by random (S0,T0) over Q,
    # then clear denominators is unnecessary since we work with Fractions -> reduce mod p
    S0, T0 = rand_inv(3), rand_inv(2)
    sch = transform(sch0, S0, T0, m)

    def red(x):
        x = Fraction(x)
        return (x.numerator * pow(x.denominator, p - 2, p)) % p

    sch = [([[red(x) for x in r] for r in a], [[red(x) for x in r] for r in b], [[red(x) for x in r] for r in c])
           for (a, b, c) in sch]
    assert is_scheme(sch, m, p)
    r = len(sch)
    allx = [x for x in itertools.product(range(p), repeat=2 * m) if any(x)]

    def calB(sch_, x):
        X = [list(x[:m]), list(x[m:])]
        return [form(b, X) % p for (_, b, _) in sch_]

    # step 2 criterion: injectivity of x -> D(xp) B(v)  <=>  rank M_supp(v)(p) = 3
    crit_ok = True
    for _ in range(trials):
        pv = [random.randrange(p) for _ in range(2)]
        v = random.choice(allx)
        Bv = calB(sch, v)
        supp = [t for t in range(r) if Bv[t]]
        Msupp = [[sum(sch[t][0][i][j] * pv[j] for j in range(2)) % p for i in range(3)] for t in supp]
        inj = all(any((sum(sch[t][0][i][j] * x[i] * pv[j] for i in range(3) for j in range(2)) * Bv[t]) % p
                      for t in range(r))
                  for x in itertools.product(range(p), repeat=3) if any(x))
        if inj != (rank(Msupp, p) == 3):
            crit_ok = False
        # v != 0 and pv*v != 0 => injective
        V = [list(v[:m]), list(v[m:])]
        pvv = [(pv[0] * V[0][l] + pv[1] * V[1][l]) % p for l in range(m)]
        if any(pvv) and not inj:
            crit_ok = False

    # step 4/5: whenever every alpha_t(s0 p) != 0 and every M_Sigma(p) has rank 3,
    # the transformed scheme satisfies SN1 and SN2 (brute force); also K-12 scaling identities
    supps = {tuple(t for t, val in enumerate(calB(sch, x)) if val) for x in allx}
    tested, good = 0, True
    for _ in range(trials):
        s0 = [random.randrange(p) for _ in range(3)]
        pv = [random.randrange(p) for _ in range(2)]
        lam1 = all(sum(a[i][j] * s0[i] * pv[j] for i in range(3) for j in range(2)) % p for (a, _, _) in sch)
        lamq = all(rank([[sum(sch[t][0][i][j] * pv[j] for j in range(2)) % p for i in range(3)] for t in Sg], p) == 3
                   for Sg in supps)
        if not (lam1 and lamq):
            continue
        # complete to invertible S, T over GF(p)
        while True:
            S = [[s0[0], random.randrange(p), random.randrange(p)],
                 [s0[1], random.randrange(p), random.randrange(p)],
                 [s0[2], random.randrange(p), random.randrange(p)]]
            if rank(S, p) == 3:
                break
        while True:
            T = [pv, [random.randrange(p), random.randrange(p)]]
            if rank(T, p) == 2:
                break
        tested += 1
        # transformed alphas and betas mod p: alpha' = S^T a T^T ; beta'(B) = beta(T^{-1}B)
        detT = (T[0][0] * T[1][1] - T[0][1] * T[1][0]) % p
        di = pow(detT, p - 2, p)
        Ti = [[T[1][1] * di % p, -T[0][1] * di % p], [-T[1][0] * di % p, T[0][0] * di % p]]
        newa = [[[x % p for x in rr] for rr in mat_mul(mat_mul(transpose(S), a), transpose(T))] for (a, _, _) in sch]

        def betap(t, x):
            X = [list(x[:m]), list(x[m:])]
            return form(sch[t][1], mat_mul(Ti, X)) % p

        # SN1
        c = [newa[t][0][0] for t in range(r)]
        if not all(c):
            good = False
            continue
        # normal form: hat alpha = alpha'/c ; a_i = hat alpha(e_i0)
        cinv = [pow(ct, p - 2, p) for ct in c]
        ahat = [[[x * cinv[t] % p for x in rr] for rr in newa[t]] for t in range(r)]
        a_vec = [[ahat[t][i][0] for t in range(r)] for i in range(3)]
        if any(a_vec[0][t] != 1 for t in range(r)):
            good = False
        for x in allx:
            bp = [betap(t, x) for t in range(r)]
            f = [[newa[t][i][0] * bp[t] % p for t in range(r)] for i in range(3)]       # f'_i
            fh = [[ahat[t][i][0] * bp[t] % p for t in range(r)] for i in range(3)]      # hat f_i
            if rank(f, p) != 3 or rank(fh, p) != 3:                                    # SN2 for V^(S,T) and hat V
                good = False
            if fh[0] != bp:                                                            # hat f_0 = hat B
                good = False
            for i in range(3):
                if fh[i] != [a_vec[i][t] * fh[0][t] % p for t in range(r)]:          # hat f_i = a_i . hat f_0
                    good = False
    return crit_ok, tested, good


for (m, p, trials) in ((1, 11, 60), (2, 7, 40)):
    print(f"K-11/K-12 m={m} GF({p}): step-2 criterion ok, tested (S,T), SN1+SN2+scaling ok:", k11_k12(m, p, trials))
```
