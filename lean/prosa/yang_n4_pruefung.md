# Prüfbericht S1-06: Prosa-Beweis für R(⟨n,2,m⟩) ≥ (n+2)·m + n − 3, m ≥ n ≥ 4

- Auftrag: S1-06 (Stufe 1, Runde 2), Rolle Prüfer nach Protokoll Abschnitt 4
- Geprüftes Artefakt: `lean/prosa/yang_n4.md` auf `main`, Stand Commit a5d351b (25.11.2026)
- Vergleichsquelle: Jason Yang, arXiv:2609.14393v3 (12.10.2026), Volltext über alphaXiv gelesen am 25.11.2026, Abschnitte 2 bis 4.2.1
- Nicht gelesen, wie vom Protokoll verlangt: `LOG.md`, `STATUS.md`, andere Prüfurteile, `lean/prosa/yang_n3.md`
- Fremdmodell: gemini-4-carbon über die Gemini Bridge, zwei Anfragen, ohne mein Urteil (Abschnitt 4 unten)

## 1. Urteil

**Keine Einwände.** Ich habe jeden Schritt der Datei selbst nachgerechnet und keinen mathematischen Fehler und keine Lücke gefunden. Es bleiben nur Anmerkungen ohne Einfluss auf die Aussage (Abschnitt 3, A1 bis A5).

Zu den drei Schwerpunktfragen des Auftrags:

1. **Befund über das Paper (L5): stimmt.** Der Beweis von Lemma 13 ist in Yang v3 wörtlich gelesen falsch aufgeschrieben. Jede einzelne Beobachtung der Datei habe ich am Paper bestätigt (Abschnitt 2.6).
2. **Reparatur über den Quotienten Q / im F₁: lückenlos.** Jeder Schritt 1 bis 4 ist korrekt, auch in Charakteristik 2 und für d = 2.
3. **Aussage von Lemma 13: stimmt** (2·rk H ≥ d·ρ + (d−2)·rk L, über jedem Körper, für jedes d ≥ 2).

Damit sehe ich keinen Anlass für einen Halt nach Abbruchregel 4 wegen Lemma 13. Ob ein Darstellungsfehler im Paper, dessen Aussage stimmt, als „Fehler in einer Quelle“ im Sinne von Regel 4 zählt, entscheidet der Orchestrator, nicht der Prüfer.

Status nach Protokoll 5.1: Ein Prosa-Beweis kann nicht **geprüft** werden. Die Ausarbeitung bleibt **behauptet**; dieser Bericht ist das Prüferurteil vor der Formalisierung.

## 2. Nachrechnung Schritt für Schritt

Abschnittsnummern beziehen sich auf `yang_n4.md`.

### 2.1 Aussage und Reduktionen (Abschnitte 0 bis 2)

- Aussage (Abschnitt 0) stimmt mit Satz 2 des Paper überein: m ≥ n ≥ 4, beliebiger Körper, Schranke (n+2)m + n − 3. Die Sonderfälle 25 und 31 für ⟨4,2,4⟩ und ⟨4,2,5⟩ sind 6m + 1. In Ordnung.
- (Z) ⇔ (Z′): nachgerechnet.
- **R1** (Körpererweiterung): Beide Seiten von (Z) sind L-bilinear und stimmen auf den Basispaaren überein. Korrekt. Die Länge r bleibt gleich, also überträgt sich jede untere Schranke über dem algebraischen Abschluss auf K. **Damit gilt die Aussage über beliebigen Körpern**, auch endlichen.
- **R2**: korrekt; die Reihenfolge R1 vor R2 ist unkritisch, weil eine Form über K genau dann null ist, wenn ihre Fortsetzung null ist.
- **R3**: nachgerechnet, S·(S⁻¹AT)(T⁻¹B) = AB. **L1 bestätigt**: Das Paper schreibt in Abschnitt 2 C′ = S⁻¹C, das passt nicht zu α′(A) = α(S⁻¹AT).
- **L2 bestätigt**: Das Paper sagt nur „ohne Einschränkung 𝔽 unendlich (sonst algebraischer Abschluss)“. Für einen unendlichen, nicht abgeschlossenen Körper wie ℚ ist damit nicht gesagt, dass man zum Abschluss übergeht, Lemma 9 verlangt ihn aber. R1 schließt das.

### 2.2 Normalisierung (Abschnitt 3)

- G1 bis G4: nachgerechnet (G2 über e_{i,0}·e_{0,j} = e_{i,j}).
- **Lemma 6**, Schritt 1: α′_t(e_{i,0}) = α_t(S⁻¹e_i e_0ᵀT) = α_t(u_i p), da die erste Zeile von T gleich p ist; Σγ_i f′_i(x) = D((Σγ_i u_i)p)·ℬ(T⁻¹x), weil D linear ist. Korrekt. Schritt 2: Der t-te Eintrag ist α_t(ap)·ℬ(x)_t, Injektivität ⇔ voller Spaltenrang ⇔ ein n×n-Minor ≠ 0. Korrekt. Schritt 3: Mit p = e_k für eine Zeile k ≠ 0 von x ist px ≠ 0, und a(px) = 0 erzwingt a = 0. Korrekt. Schritt 4: endlich viele Träger, jedes q_Σ und jedes a_t ist nicht das Nullpolynom, Produkt ≠ 0, Nichtnullstelle über unendlichem Körper. Korrekt. **L3 bestätigt.**
- G5, G6, Folgerung 7: korrekt.
- **Lemma 8**: j ≥ 1 minimal, X ∩ E_{j−1} = 0 und Kodimension 1 geben dim X = 1; T ⊆ E_j, weil die P_i diagonal sind; f₀(S) ∩ T = X. Korrekt.
- **Lemma 9**: P_i bildet V = f₀(S) in sich ab, Eigenvektor über algebraisch abgeschlossenem K, Widerspruch zu Folgerung 7 mit γ = e_i − λe_0. Korrekt.

### 2.3 Räume und Lemma 10 (Abschnitte 4 und 5)

- Lemma 4.1 (i) bis (iii): nachgerechnet. Bei (ii) sind beide Terme die Matrix mit Zeile 1 von x in Zeile 0.
- **Lemma 10**: Der h-Term verschwindet (Diagonale null, Paare (i,j), (j,i) heben sich, Diagonalmatrizen vertauschen). Linke Seite: D(e_{0,1})D(e_{i,0}) − D(e_{i,0})D(e_{0,1}) fällt weg, übrig bleibt D(e_{0,0})·Σ D(e_{i,0})ℬ(e_{0,1}u_i). Nach Kürzen von D(e_{0,0}) und Anwenden von W stehen links in Zeile i die Zeilen 1 der u_i, rechts in den Zeilen 1, …, n−1 nur Nullen (Zeile 0 der y_i ist 0). Korrekt. Die Bemerkung, dass Lemma 10 nur (N1) braucht, stimmt.
- Gleichungen (1) und (2): Rangsatz und im Φ ⊆ im L × Q^{n−1}, nachgerechnet.

### 2.4 Lemma 11

- Injektivität von μ: Die Induktion über |p − q| ist korrekt. Für c_{p,q} (p < q) braucht R(p,q) nur p ≤ d − 1, für c′_{q,p} braucht R(q−1,p) nur 2 ≤ q ≤ d. Keine Division durch 2. **L4 bestätigt.**
- Dimensionen: beide Seiten d(d−1)·dim V. Abschluss über τ: korrekt.
- Fall d = 1 ist in der Datei ausdrücklich abgedeckt (U^{∧1} = 0). Das wird in Lemma 13 für d = 2 gebraucht und ist damit erledigt (siehe Fremdmodell, Frage Q6).

### 2.5 Lemma 13 und Reparatur (Abschnitt 6)

- **Schritt 1**: F′_i = Σ_j ξ_{i,j}F_j ergibt L′(u) = L(uξ). Die Menge der Kombinationen ist dieselbe, also ρ′ = ρ; F′_1 = Σγ*_jF_j hat Rang ρ. ξᵀcξ ist schiefsymmetrisch mit Diagonale Σ_{i<j}ξ_{i,a}ξ_{j,a}(c_{i,j} + c_{j,i}) = 0, auch in Charakteristik 2. Die Zeile a von ξᵀcξ ist Σ_i ξ_{i,a}·(c_{i,:}ξ), also H(ξᵀcξ)_a = Σ_i ξ_{i,a}·H′(c)_i. Damit im H = ξᵀ·im H′. Korrekt.
- **Schritt 3**: im L = im F₁ + im L(0,·) ⊇ im F₁, also rk L̄ = rk L − ρ. Für i ≥ 2 ist H(c)_i = F₁(c_{i,1}) + L(0, c_{i,2}, …), modulo im F₁ also L̄(c̄_{i,:}). c̄ liegt in U^{∧(d−1)}. Korrekt.
- **Schritt 4**: rk H = dim(im H ∩ ker π) + dim π(im H) ist der Rangsatz für π eingeschränkt auf im H (sogar Gleichheit). π(im H) = im H̄, weil jedes c̄ mit Nullen in Zeile und Spalte 1 fortgesetzt werden kann. H(Γ) ⊆ ker π, und die Projektion von H(Γ) auf die Komponenten 2, …, d ist (im F₁)^{d−1}. Rechnung 2(d−1)ρ + (d−2)(rk L − ρ) = dρ + (d−2)rk L. Korrekt.
- Für d = n − 1 ist das genau die Aussage des Paper: rk H ≥ (n−1)/2·ρ + (n−3)/2·rk L.

### 2.6 Befund L5 am Paper nachgesehen

Alle Punkte der Datei treffen zu:

- Γ := {c : c_{i,:} = 0 für alle i ≥ 2}. Dann c_{i,1} = 0 für i ≥ 2, wegen Schiefsymmetrie c_{1,i} = 0, also Γ = {0}. Bestätigt.
- Die Definition „𝑊 := {c : c_{i,:} = 0 ∀ i > 1}“ unmittelbar vor Lemma 13 wird nirgends benutzt und kollidiert mit der Abbildung W. Bestätigt.
- „H(c) = (0, F₁(c_{2,1}), …)“ für c ∈ Γ: Die erste Komponente ist Σ_{j≥2}F_j(c_{1,j}), im Allgemeinen ≠ 0. Bestätigt.
- L̄(u_2, …) := L(U, u_2, …) ist eine Nebenklasse, keine lineare Abbildung; H̄(c) := [H(c + Γ)_i] hängt (bei gemeintem Γ) vom Vertreter ab. Nur über Q / im F₁ wohldefiniert. Bestätigt.
- rk H ≥ dim H(Γ) + rk H̄ steht im Paper ohne Begründung. Bestätigt.

Ergänzend (A2 unten): H̄ ist im Paper als Funktion von c ∈ U^{∧(n−1)} geschrieben, als schiefe Erweiterung von L̄ müsste es auf U^{∧(n−2)} leben.

### 2.7 Lemma 15, Lemma 8′, Lemma 14 (Abschnitte 6 und 7)

- **Lemma 15(a)**: im L = Σ im F_i. Korrekt.
- **Lemma 15(b)**: Gleichheit erzwingt rk F_i = ρ und direkte Summe. ker σ = N wegen Direktheit; rk σ ≤ ρ gibt dim N ≥ m − ρ = dim ker F_i, also N = ker F_i. Aus f₀(u_i) = f_i(v) folgt durch Multiplikation mit D(e_{0,0})⁻¹ direkt ℬ(u_i) = D(e_{0,0})⁻¹D(e_{i,0})ℬ(v) (dazu braucht es nur (N1), nicht G1). f_j(u_i) = f_i(u_j), also F_j(u_i) ∈ im F_i ∩ im F_j = 0, u_i ∈ ker F_j = N; ein j ≠ i existiert wegen n − 1 ≥ 2. Lemma 9 mit S = N gibt N = 0. Korrekt. **L6 bestätigt.**
- **Lemma 8′**: im L = (Σ_{i≥0} f_i(U))/J, Lemma 8 mit S = U. Korrekt. **L7 bestätigt.**
- **Lemma 14**: Wahl von I aus m linear unabhängigen Zeilen einer Basismatrix von J (braucht m ≥ n − 1), γ ≠ 0 aus n − 1 Gleichungen in n Unbekannten, f′ injektiv nach Folgerung 7, Projektion auf K^I hat f′(U) im Kern und ist auf J surjektiv. F′ = Σ_{i≥1}γ_iF_i, weil f₀(U) = J. Korrekt.

### 2.8 Abschluss (Abschnitt 8)

- **Fall n ≥ 5**: 2(n−1)(r − (n+2)m) ≥ (n−1)ρ + (n−5)rk L ≥ (n−1)² + (n−5)(n−1) = 2(n−1)(n−3). Die Abschätzung von rk L nach unten ist zulässig, weil n − 5 ≥ 0. Korrekt.
- **Fall n = 4**: (2) und (11′) geben r ≥ 6m. Bei r = 6m folgt rk H = rk L, aus Lemma 13 rk L ≥ 3ρ, mit 15(a) Gleichheit, mit 15(b) rk L = 3m ≤ dim Q = m, also m = 0. Korrekt. Ganzzahligkeit gibt r ≥ 6m + 1.
- **Algebraisch abgeschlossener Körper bei n = 4**: Wird für diesen Beweis wirklich gebraucht, und nur dort: Lemma 15(b) stützt sich auf Lemma 9, das einen Eigenwert von P_i auf V braucht. Über einem nur unendlichen Körper (etwa ℝ) kann P_i|_V ohne Eigenvektor sein. Der Fall n ≥ 5 braucht nur einen unendlichen Körper. Weil R1 jeden Körper auf seinen Abschluss zurückführt, ist das für die Aussage über beliebigen Körpern unschädlich.

### 2.9 Nebenbehauptung „m ≥ n − 1 genügt“ (vermutet in der Datei)

- Ich habe alle Stellen durchgesehen, an denen m vorkommt. Gebraucht wird: m ≥ 1 (Lemma 8′, Fall n = 4 am Ende) und m ≥ n − 1 (nur Lemma 14, nur Fall n ≥ 5). Sonst nirgends m ≥ n. **Keine Einwände** gegen die Nebenbehauptung: n ≥ 5 braucht m ≥ n − 1, n = 4 braucht m ≥ 1.
- **Sie bringt aber keine neue Schranke.** Die zusätzlichen Fälle sind:
  - n = 4, m = 1, 2, 3: Schranken 7, 13, 19. Bekannt sind R(⟨4,2,1⟩) = 8, R(⟨4,2,2⟩) = R(⟨2,2,4⟩) = 14 (Shitov, 7m/2), R(⟨4,2,3⟩) = R(⟨3,2,4⟩) = 20 (Yang Satz 1 mit Hopcroft-Kerr). Kein Widerspruch, aber schwächer als bekannt.
  - n ≥ 5, m = n − 1: Schranke n² + 2n − 5. Durch Vertauschen ist ⟨n,2,n−1⟩ gleichrangig mit ⟨n−1,2,n⟩, und Satz 2 selbst gibt dafür (n+1)n + n − 4 = n² + 2n − 4. Also ebenfalls schwächer.
- Folgerung für die Formalisierung: Die Nebenbehauptung kann man formalisieren, wenn es die Lean-Fassung vereinfacht, für die Zielaussagen des Projekts ist sie wertlos.

## 3. Anmerkungen ohne Einfluss auf die Aussage

| Nr. | Stelle | Anmerkung |
|---|---|---|
| A1 | Paper, Lemma 11, Definition von μ | Die erste Komponente heißt dort „c_{1,:} + c_{2,:}“, gemeint ist c′_{2,:}. Fehlt in der Lückenliste der Datei (Schreibfehler, gering). |
| A2 | Paper, Lemma 13, H̄ | H̄ ist als Funktion von c ∈ U^{∧(n−1)} notiert, als schiefe Erweiterung von L̄ gehört es auf U^{∧(n−2)}. Gehört zu L5, in der Datei nicht einzeln genannt. Die Reparatur über c̄ behebt es. |
| A3 | Datei, Lemma 15(b) | „Mit G6: ℬ(u_i) = …“ – die Gleichung folgt direkt aus f₀(u_i) = f_i(v) und (N1), nicht aus G6. Nur der Verweis ist ungenau. |
| A4 | Datei, Lemma 13, Schritt 4 | „rk H ≥ dim(im H ∩ ker π) + dim π(im H)“ gilt sogar mit Gleichheit. Für den Formalisierer ist die Gleichheit (Rangsatz für π auf im H) der direkte Weg. |
| A5 | Datei, Abschnitt 0 | Verweis auf `behauptungen/B-001.md` für `matrix_algorithm_rank_strict` habe ich nicht verfolgt (nicht Teil des Artefakts). |

## 4. Fremdmodell (Gemini Bridge)

Modell gemini-4-carbon, Denkstufe low, zwei Anfragen am 25.11.2026 (je etwa 0,06 $). Ein erster Versuch mit Denkstufe medium brach nach 60 s ab, Ergebnis unbekannt. Dem Fremdmodell habe ich mein Urteil nicht gezeigt. Es bekam die Definitionen, den Wortlaut des Paper-Beweises von Lemma 13 und die Reparatur der Datei, dazu Fragen mit JA/NEIN/TEILWEISE. In einer zweiten Anfrage bekam es Lemma 9, Lemma 15, die Abschlussrechnungen und die Reduktion auf den Abschluss.

Antworten, knapp wiedergegeben:

| Frage | Antwort Gemini | Mein Urteil |
|---|---|---|
| Q1 Γ wörtlich = {0}? | JA | gleich |
| Q2 erste Komponente von H(c) auf Γ = 0? | NEIN, Gegenbeispiel d = 2, F₁ = F₂ = id | gleich |
| Q3 L̄, H̄ wörtlich wohldefiniert? | NEIN, Nebenklassen; zusätzlich falscher Definitionsbereich von H̄ | gleich, A2 übernommen |
| Q4 rk H ≥ dim H(Γ) + rk H̄ im Paper begründet? | NEIN | gleich |
| Q5 WLOG-Schritt korrekt, auch Char. 2? | JA | gleich |
| Q6 Reparatur vollständig? | TEILWEISE: „im Wesentlichen ja“, einzige Lücke: Lemma 11 für d − 1 = 1 bei d = 2 | Kein Einwand: Die Datei behandelt d = 1 in Lemma 11 ausdrücklich („Für d = 1 ist nichts zu zeigen“). Gemini kannte nur die Fassung „d ≥ 2“ aus meiner Anfrage. |
| Q7 Lemma 13 wahr für jeden Körper, d ≥ 2? | JA | gleich |
| Q8 Gesamturteil Paper-Beweis | „fixable write-up error“: Idee tragfähig, Satz wahr, wörtlich mehrere falsche Aussagen | gleich |
| R1 Lemma 15(b) korrekt? | TEILWEISE: Für ℬ(u_i) = D(e_{0,0})⁻¹D(e_{i,0})ℬ(v) brauche es die Injektivität von ℬ | Kein Einwand: Die Gleichung folgt durch Multiplikation mit D(e_{0,0})⁻¹ in K^r unmittelbar, Injektivität von ℬ wird dafür nicht gebraucht. Siehe A3. |
| R2 Fall n = 4 korrekt, Abschluss nötig? | JA; algebraisch abgeschlossen wirklich nötig für Lemma 9 | gleich |
| R3 Reduktion auf den Abschluss gültig? | JA | gleich |
| R4 Rechnung n ≥ 5 korrekt? | JA | gleich |
| R5 m ≥ n − 1 bzw. m ≥ 1 genügt? | TEILWEISE: in den gezeigten Schritten ja; Vorbehalt, die nicht gezeigten Lemmata zu prüfen. Kein Widerspruch zu bekannten Rängen (7 ≤ 8, 13 ≤ 14, 19 ≤ 20) | Die übrigen Lemmata habe ich geprüft (2.9), dort wird m ≥ n nicht gebraucht. Gemini schwankte in der Antwort kurz bei R(⟨2,2,4⟩) und kam selbst wieder auf 14. |

Beide Urteile sind getrennt entstanden und stimmen in allen Punkten zu Lemma 13 überein. Die beiden Einwände des Fremdmodells (Q6, R1) halte ich aus den genannten Gründen nicht für Einwände gegen die Datei.

## 5. Rechnerische Stichproben

Keine Beweiskraft, nur Plausibilität. Die Skripte liegen nicht im Repo (eine Zieldatei); der Kern des ersten steht im Anhang.

1. **Lemma 11, Lemma 13, Lemma 15(a) als reine lineare Algebra**: 420 Zufallsfälle über GF(2), GF(3), GF(5), d = 2, 3, 4, dim U ≤ 4, dim Q ≤ 7, F_i mit vorgegebenem kleinem Rang, ρ durch vollständige Aufzählung aller γ. Keine Verletzung von 2·rk H ≥ (d−1)·rk L, 2·rk H ≥ d·ρ + (d−2)·rk L, rk L ≤ d·ρ. GF(2) prüft dabei Charakteristik 2.
2. **Ganze Kette an echten Zerlegungen** über GF(1000003) nach zufälligem Basiswechsel R3: Standardverfahren für ⟨4,2,4⟩ (r = 32), ⟨5,2,5⟩ (50), ⟨4,2,3⟩ (24) und Strassen-Blöcke für ⟨4,2,4⟩ (28) und ⟨4,2,6⟩ (42). Jede Zerlegung erfüllt (Z). Geprüft wurden (N1), rk Φ = (n−1)m + rk H (also Lemma 10), Gleichung (2), Lemma 11, 13, 15(a), 8′, 14 (ρ über zufälliges γ) und die Endschranke. Alle erfüllt. (N2) wurde nicht geprüft.

## 6. Was dieser Bericht nicht leistet

- Status geprüft gibt es erst nach Lean-Build, Axiom-Prüfung und Aussagen-Abgleich (Protokoll 5.1).
- Den Fall n = 3 (Satz 1, `yang_n3.md`) habe ich nicht gelesen.

## Anhang: Kern der Stichprobe 1 (Python)

```python
# H as matrix over GF(p): basis of U^{wedge d} is E_{ij} (x) u for i<j,
# with c_ij = u, c_ji = -u; then H(c)_i = F_j u and H(c)_j = -F_i u.
def check(F, d, a, b, p):
    L = [sum((F[i][row] for i in range(d)), []) for row in range(b)]
    pairs = [(i, j) for i in range(d) for j in range(i + 1, d)]
    H = [[0] * (len(pairs) * a) for _ in range(d * b)]
    for k, (i, j) in enumerate(pairs):
        for u in range(a):
            for row in range(b):
                H[i * b + row][k * a + u] += F[j][row][u]
                H[j * b + row][k * a + u] -= F[i][row][u]
    rL, rH = rank(L, p), rank(H, p)
    rho = max(rank(comb(F, g, p), p) for g in itertools.product(range(p), repeat=d))
    return 2 * rH >= (d - 1) * rL and 2 * rH >= d * rho + (d - 2) * rL and rL <= d * rho
```
