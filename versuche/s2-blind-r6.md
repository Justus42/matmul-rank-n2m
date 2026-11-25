# S2-25: Blind-Sucher, Stufe 2, Runde 6 (4×2×4: 25 oder 26?)

Auftrag S2-25 vom Orchestrator, Rolle Blind-Sucher (Protokoll Abschnitt 4). Datum 25.11.2026.

**Ergebnis in einem Satz:** Keine Entscheidung zwischen 25 und 26. Neu ist ein Starrheits-Lemma für die Einschränkung auf den mittleren Index: In jedem Verfahren mit 25 Produkten liegen auf jeder Geraden ℓ ⊂ C² höchstens 6 Produkte, deren A-Faktor ℓ annulliert, und höchstens 6, deren B-Faktor in ℓ ⊗ C⁴ liegt (Status **behauptet**). Das bekannte 26er-Verfahren hat an dieser Stelle die Werte 6, 7, 7, und alle seine Doppel-Einschränkungen sind scharf. Das Lemma allein trennt 25 und 26 aber nicht, siehe Abschnitt 5.

Statuswörter nach Protokoll 5.3. Nichts in dieser Datei ist geprüft.

---

## 1. Ansatz und Abgrenzung

Frühere Blind-Sucher haben laut Auftrag bei Yangs Ungleichungen und bei der Verkleinerung um eine Zeile angesetzt. Ich habe Yangs Arbeit nicht gelesen. Gewählt habe ich die Kontraktion mit dem **mittleren Index** (dem Index der Länge 2) und die Frage, wie starr die dabei entstehenden Zerlegungen von ⟨4,1,4⟩ sind. Dazu kommt eine Umformulierung, die jede Einschränkung der A-Seite als „Büschel ⊠ Einheitsmatrix“ schreibt (Abschnitt 2.3). Das verbindet den Ansatz mit der Kronecker-Normalform von 4×4-Büscheln.

## 2. Bezeichnungen und Umformulierung

### 2.1 Der Tensor

U = C⁴ (Zeilenindex i), V = C² (mittlerer Index j), W = C⁴ (Spaltenindex k), über einem beliebigen Körper K statt C.
T = ⟨4,2,4⟩ = Σ_{i,j,k} a_{ij} ⊗ b_{jk} ⊗ c_{ki} ∈ A ⊗ B ⊗ C mit dim A = dim B = 8, dim C = 16.

Ein Verfahren vom Rang r ist T = Σ_{s=1}^r u_s ⊗ v_s ⊗ w_s. Ich schreibe die Faktoren als Matrizen wie im Datenformat (verfahren/README.md): U_s ist 4×2 (A-Faktor), V_s ist 2×4 (B-Faktor), W_s ist 4×4. Ohne Einschränkung sind alle Faktoren ≠ 0.

Bilinear gelesen: PQ = p₁q₁ᵀ + p₂q₂ᵀ für P = [p₁ p₂] (4×2) und Q mit Zeilen q₁ᵀ, q₂ᵀ (2×4).

### 2.2 Symmetrien

GL₄ × GL₂ × GL₄ wirkt durch (U_s, V_s, W_s) ↦ (X U_s g, g⁻¹ V_s Y, Y⁻¹ W_s X⁻¹) (bis auf Transposition je nach Konvention). Wegen n = m kommt die Transposition (U, V, W) ↦ (Vᵀ, Uᵀ, Wᵀ) dazu, die A und B vertauscht. Insbesondere darf man jede Gerade ℓ ⊂ V durch die GL₂-Wirkung auf span(e₂) schieben.

### 2.3 Einschränkungen der A-Seite als Büschel ⊠ Einheitsmatrix (Beobachtung)

T = ⟨4,2,1⟩ ⊠ ⟨1,1,4⟩, wobei ⟨1,1,4⟩ die 4×4-Einheitsmatrix in B-Index k und C-Index k ist. Schränkt man A auf einen Unterraum A' ⊂ A ein, so ist T|_{A'} = π_{A'} ⊠ I₄, wobei π_{A'} ∈ A'* ⊗ K² ⊗ K⁴ das Büschel ist, das die Inklusion A' ⊂ K⁴ ⊗ K² beschreibt. Für dim A' = 4 ist das ein 4×4-Büschel (X, Y) mit A' = {[Xp, Yp]}. Die Substitutionsschranke lautet dann

  r ≥ R(π_{A'} ⊠ I₄) + #{s : u_s verschwindet auf A'}.

Fälle: (X, Y) = (I, λI) gibt ⟨4,1,4⟩, Rang 16. Ein diagonalisierbares Büschel gibt ebenfalls Rang 16 (vier Zeilen, je ⟨1,1,4⟩). Für ein Büschel mit Jordan-Block ist R(π ⊠ I₄) zwischen 16 und 4·R(π); für (I, J₄) also zwischen 16 und 20. Der genaue Wert ist offen (vermutet: 20). Rang ist unter ⊠ mit I₄ nicht allgemein multiplikativ, denn R(⟨4,2,1⟩) · 4 = 32 > 26.

In dieser Arbeit verwende ich nur den Fall (I, λI), also die Kontraktion mit einer Geraden des mittleren Index.

### 2.4 Zählgrößen je Gerade

Für eine Gerade ℓ = span(η) ⊂ V:

- K_A(ℓ) = {s : U_s η = 0} (nur Produkte mit Rang U_s = 1 und Kern ℓ), a(ℓ) = |K_A(ℓ)|
- K_B(ℓ) = {s : alle Spalten von V_s liegen in ℓ} (nur Rang V_s = 1), b(ℓ) = |K_B(ℓ)|
- c(ℓ) = |K_A(ℓ) ∩ K_B(ℓ)|

## 3. Aussagen

### Lemma 1 (Einzel- und Doppel-Einschränkung) — Status: behauptet

Für jedes Verfahren vom Rang r und alle Geraden ℓ, ℓ' ⊂ V gilt

(a) a(ℓ) ≤ r − 16 und b(ℓ) ≤ r − 16,
(b) |K_A(ℓ) ∪ K_B(ℓ')| ≤ r − 16, falls ℓ ≠ ℓ'.

*Beweisskizze.* (a) Setze P = p ηᵀ. Dann ist PQ = p (ηᵀQ), die Einschränkung ist ⟨4,1,4⟩ mit Rang 16 (die C-Abflachung ist ein Isomorphismus K^16 → K⁴ ⊗ K⁴). Genau die Produkte in K_A(ℓ) verschwinden. Für B setze Q = ζ qᵀ mit ζ ≠ 0 und ζᵀx = 0 für x ∈ ℓ; dann verschwinden genau die Produkte in K_B(ℓ), und PQ = (Pζ) qᵀ ist wieder ⟨4,1,4⟩.
(b) Beide Einsetzungen zugleich: PQ = p (ηᵀζ) qᵀ, und ηᵀζ ≠ 0 genau dann, wenn η ∉ ℓ', also ℓ ≠ ℓ'. Rang 16, die Produkte aus K_A(ℓ) ∪ K_B(ℓ') verschwinden. ∎

Teil (a) ist die bekannte Art Schranke r ≥ 16 + (Zahl der getöteten Produkte). Neu ist erst Lemma 2.

### Lemma 2 (Starrheit) — Status: behauptet

Sei r = 16 + e ein Verfahren und ℓ eine Gerade mit a(ℓ) = e − k, also mit 16 + k überlebenden Produkten bei der Einsetzung aus Lemma 1(a). Dann gilt

  b(ℓ) − c(ℓ) ≥ 16 − 4·min(k, 4).

Symmetrisch: Aus b(ℓ) = e − k folgt a(ℓ) − c(ℓ) ≥ 16 − 4·min(k, 4).

*Beweis (Skizze, aber vollständig gemeint).* Nach GL₂ sei η = e₂, also P = [0 p]. Überlebende S = {s : u_{s2} ≠ 0}, |S| = 16 + k, wobei u_{s2} = U_s e₂ die zweite Spalte ist. Zerlege v_s = (v_{s1}, v_{s2}) in die beiden Zeilen von V_s. Die eingeschränkte Identität in K⁴ ⊗ B ⊗ C zerfällt nach den beiden Zeilen von B:

 (i) Σ_{s∈S} R_s ⊗ w_s = M mit R_s = u_{s2} v_{s2}ᵀ ∈ K⁴ ⊗ K⁴ und M dem ⟨4,1,4⟩-Tensor,
 (ii) Σ_{s∈S} Z_s ⊗ w_s = 0 mit Z_s = u_{s2} v_{s1}ᵀ.

Aus (i): M ist als Abbildung C* → K⁴⊗K⁴ ein Isomorphismus. Mit W: X ↦ (⟨w_s, X⟩)_s und R: e_s ↦ R_s gilt R ∘ W = M. Also spannen die R_s (s ∈ S) den ganzen 16-dimensionalen Raum auf, und die w_s (s ∈ S) spannen C auf; der Raum D der linearen Relationen unter den w_s hat Dimension k.

Aus (ii): Für jede Linearform φ auf K⁴⊗K⁴ liegt (φ(Z_s))_s in D. Also liegen alle Z_s in einem Raum 𝒵 = span(Z¹, …, Z^k) der Dimension ≤ k.

Sei G = {s ∈ S : v_{s1} ≠ 0} und N₀ = S \ G. Für s ∈ G ist Z_s = u_{s2} v_{s1}ᵀ eine Matrix vom Rang 1 in 𝒵. Wählt man unter den u_{s2} (s ∈ G) linear unabhängige aus, sind die zugehörigen Z_s linear unabhängig. Daher hat A_𝒵 = span{u_{s2} : s ∈ G} höchstens die Dimension min(k, 4). Für s ∈ G liegt R_s in A_𝒵 ⊗ K⁴. Also

  16 = dim span{R_s : s ∈ S} ≤ 4·dim A_𝒵 + |N₀| ≤ 4·min(k,4) + |N₀|.

Schließlich ist N₀ = {s ∈ S : v_{s1} = 0} ⊆ K_B(ℓ) \ K_A(ℓ). ∎

### Folgerung 3 — Status: behauptet (folgt aus Lemma 1 und 2)

Sei M_max das Maximum von a(ℓ) und b(ℓ) über alle Geraden ℓ.

- **r = 25 (e = 9):** M_max ≤ 6. Denn wäre etwa a(ℓ) = 9 − k mit k ∈ {0, 1, 2}, dann b(ℓ) ≥ 16 − 4k ≥ 8 > 9 − k ≥ b(ℓ) für k = 2, und für k ≤ 1 widerspricht b(ℓ) ≥ 12 schon Lemma 1(a). Ferner gilt: Aus a(ℓ) = 6 folgt b(ℓ) − c(ℓ) ≥ 4, aus b(ℓ) = 6 folgt a(ℓ) − c(ℓ) ≥ 4.
- **r = 26 (e = 10):** M_max ≤ 8, und a(ℓ) = 8 erzwingt b(ℓ) − c(ℓ) ≥ 8.

Damit: In einem 25er-Verfahren überleben bei jeder Einsetzung P = p ηᵀ mindestens 19 Produkte, ebenso bei Q = ζ qᵀ. Dazu kommt Lemma 1(b) mit der Schranke 9 für jedes Paar verschiedener Geraden.

## 4. Gezielte Rechnungen

Werkzeug: Python mit `fractions` und `sympy`, exakt über Q, Laufzeit unter einer Sekunde. Code im Anhang. Gerechnet am Verfahren `verfahren/4x2x4-r26-s001.json` (Rang 26, Koeffizienten −1, 0, 1). Die Brent-Gleichungen rechnet das Skript zuerst exakt nach: erfüllt.

**Typen der 26 Produkte** (Rang U, Rang V, Rang W): (1,1,1) 13-mal, (1,1,2) 1-mal, (1,1,3) 6-mal, (2,2,2) 6-mal. Die sechs Produkte mit Rang-2-Faktor in A sind genau die mit Rang-2-Faktor in B.

**Profil je Gerade:**

| Gerade η | a | b | c |
|---|---|---|---|
| (0, 1) | 6 | 6 | 0 |
| (1, 0) | 7 | 7 | 0 |
| (1, 1) | 7 | 7 | 0 |

Die 20 Produkte mit Rang-1-A-Faktor liegen auf nur drei Geraden. Das ist mit Folgerung 3 für r = 26 verträglich (M_max = 7 ≤ 8).

**Doppel-Einschränkungen (Lemma 1(b)):** Für alle sechs Paare ℓ ≠ ℓ' ist |K_A(ℓ) ∪ K_B(ℓ')| = 10 = r − 16. Das 26er-Verfahren ist also in jeder Doppel-Einschränkung scharf; nach jeder solchen Einsetzung bleibt eine minimale Zerlegung von ⟨4,1,4⟩ mit genau 16 Produkten übrig.

**Innere Größen aus Lemma 2** (Skript `rigid.py`):

| η | a | k | dim span w | dim span R | dim 𝒵 | \|G\| | \|N₀\| | dim A_𝒵 |
|---|---|---|---|---|---|---|---|---|
| (0, 1) | 6 | 4 | 16 | 16 | 4 | 14 | 6 | 3 |
| (1, 0) | 7 | 3 | 16 | 16 | 3 | 12 | 7 | 3 |
| (1, 1) | 7 | 3 | 16 | 16 | 3 | 12 | 7 | 3 |

Alle Aussagen im Beweis von Lemma 2 treffen zu (dim 𝒵 ≤ k, dim A_𝒵 ≤ min(k,4), |N₀| ≥ 16 − 4k). Das ist eine Plausibilitätsprobe, keine Prüfung.

## 5. Sackgassen und Grenzen

1. **Lemma 2 trennt 25 und 26 lokal nicht.** Der kritische Fall für r = 25 ist a(ℓ) = 6, also k = 3. Genau diese lokale Lage (k = 3, |N₀| = 7, dim A_𝒵 = 3) kommt im 26er-Verfahren bei a(ℓ) = 7 vor. Die Starrheit einer einzelnen Geraden reicht also nicht. Gebraucht wird ein globales Zählargument über alle Geraden zusammen, oder eine untere Schranke für die Zahl der Produkte mit Rang-1-Faktoren.
2. **Substitution nur auf der C-Seite (Büschel diag(X,X)).** Schränkt man C* auf einen d-dimensionalen Raum S ⊂ Mat₄ ein, ist T|_S = S ⊕ S (zwei Kopien des Matrixraums). Für die Schranke 26 bräuchte man R(S ⊕ S) ≥ 10 + d für ein S, das von den Faktoren W_s bestimmt wird. Bei allgemeiner Lage der W_s ist S allgemein, und R(S ⊕ S) ist zu klein (d = 2: 8 statt 12; d = 3: höchstens 12 statt 13). **aufgegeben** als alleiniger Weg.
3. **Allgemeine Büschel-Einschränkung P = [p, Jp] mit diagonalisierbarem J.** Rang der Einschränkung 16, aber ein Produkt mit Rang-2-Faktor zu töten kostet 4 Gleichungen an J (16 Parameter). Man tötet so nur etwa 4 Produkte mit Rang-2-Faktor, viel zu wenig. Mit Jordan-Block wäre der Rang der Einschränkung größer (Abschnitt 2.3), aber dafür fehlt mir R(π_J ⊠ I₄). Nicht weiter verfolgt, Status vermutet.
4. **Konstruktion eines 25er-Verfahrens.** Ich habe keine strukturelle Begründung gefunden, die für 25 spricht. Das 26er-Verfahren ist in allen Doppel-Einschränkungen scharf (Abschnitt 4). Ein 25er-Verfahren müsste dieselbe Zahl Rang-16-Einschränkungen mit einem Produkt weniger tragen und dabei auf jeder Geraden höchstens 6 Rang-1-Faktoren haben, während das 26er-Verfahren 6, 7, 7 hat. Das ist ein Hinweis in Richtung 26, kein Beleg. Keine Suche gestartet (Auftrag).

## 6. Vorschlag für den nächsten Schritt

1. **Lemma 2 prüfen lassen** (Prüfer, dann Lean). Die Aussage ist reine lineare Algebra über einem beliebigen Körper und eignet sich gut zur Formalisierung. Danach Folgerung 3.
2. **Globales Zählargument:** Für r = 25 ist zu zeigen, dass die Bedingungen a(ℓ), b(ℓ) ≤ 6, „a = 6 ⇒ b − c ≥ 4“ und Lemma 1(b) mit Schranke 9 zusammen mit einer unteren Schranke für die Zahl der Rang-1-Faktoren unerfüllbar sind. Fehlt: eine Ungleichung, die Produkte mit Rang-2-Faktor (Typ (2,2,·)) teuer macht. Kandidat: Lemma 2 für die Doppel-Einschränkung durchrechnen (dort sind beide Seiten eingeschränkt, und das 26er-Verfahren zeigt, dass scharfe Fälle die Regel sind).
3. **R((I, J₄) ⊠ I₄) bestimmen** (vermutet 20). Wäre das richtig, gäbe die Einsetzung P = [p, Jp] mit nilpotentem J eine zusätzliche Ungleichung: höchstens r − 20 = 5 Produkte mit u_{s1} + Jᵀu_{s2} = 0.

## 7. Offenlegung: was ich trotz Blindheit gesehen habe

- **Projektgedächtnis (automatisch beim Start):** der Index mit Stand der Stufe 2, Namen B-008 (Satz A), B-009 (Satz B), B-012, B-013, „Lemma 13“, „Restfälle“, „verbleibender Unterfall“, „μ_t≠0-Zusatz“, „A1-Isomorphismus“, dass Spur B und die SAT- und Flip-Graph-Suche aufgegeben sind. Außerdem wurden mir ohne Zutun fünf verlinkte Einträge eingeblendet: zu S2-01 (Flip-Graph über GF(2) fand nur Rang 26; Substitution r ≥ 16 + S_mid mit offenem „Lemma M“, S_mid ≥ 10), S2-04 (ALS über R und C fand nie 25; „Lemma τ“ zu transpositionsinvarianten Verfahren in Charakteristik 2), S2-08 (Symmetrie ungerader Ordnung über GF(2), kein 25er), S2-17 und S2-21 (nur Dateinamen und PR-Nummern). Inhalte von Satz A, Satz B oder den Restfällen kenne ich nicht.
- **Gelesen:** PROTOKOLL.md, CLAUDE.md, den Anfang von verfahren/README.md (Datenformat) und verfahren/4x2x4-r26-s001.json. Dessen Feld `notes` nennt versuche/s2-spurB-r1/flip.c, Hopcroft-Kerr 1971 und den Perminov-Katalog.
- **Gesehen, nicht geöffnet:** die Dateinamen im Ordner versuche/ (ein `ls`, um meine Datei abzulegen).
- **Nicht gelesen:** STATUS.md, LOG.md (entgegen CLAUDE.md Punkt 1, weil der Auftrag nach Protokoll Abschnitt 4 Blindheit verlangt), versuche/*, lean/, behauptungen/, lit/, Git-Log, Pull Requests, Yangs Arbeit und sonstige Literatur.
- Ob Lemma 1(a) oder Lemma 2 schon bei Yang oder in früheren Aufträgen steht, weiß ich deshalb nicht. Lemma 1(a) ist sicher Standard; Lemma 2 ist möglicherweise nicht neu.
- Fremdmodelle: keine benutzt.

---

## Anhang: Code

Python 3, `sympy` (pip). Aufruf jeweils mit dem Pfad zu einer Verfahrensdatei.

### profile.py

```python
"""Line profile of a <n,2,m> decomposition (exact arithmetic).

For a line l = span(eta) in the middle space C^2:
  K_A(l) = products whose A-factor U (n x 2) satisfies U eta = 0
  K_B(l) = products whose B-factor V (2 x m) has all columns in span(eta)
Prints a = |K_A|, b = |K_B|, c = |K_A & K_B| for every line that occurs.
Usage: python3 profile.py <scheme.json>
"""
import json, sys
from fractions import Fraction as F

def mat(x): return [[F(e) for e in row] for row in x]

def check(prods, n, m):
    # Brent equations, exact
    for i in range(n):
        for j in range(2):
            for j2 in range(2):
                for l in range(m):
                    for i2 in range(n):
                        for l2 in range(m):
                            s = sum(p['u'][i][j]*p['v'][j2][l]*p['w'][i2][l2] for p in prods)
                            want = 1 if (i == i2 and j == j2 and l == l2) else 0
                            if s != want: return False
    return True

def norm(v):
    for x in v:
        if x != 0: return tuple(y / x for y in v)
    return None

def line_key_from_kernel(U):
    # U is n x 2; kernel line if rank 1
    rows = [r for r in U if any(r)]
    r0 = rows[0]
    if all(r0[0]*r[1] - r0[1]*r[0] == 0 for r in rows):
        return norm((-r0[1], r0[0]))  # eta with U eta = 0
    return None

def line_key_from_columns(V):
    cols = [(V[0][l], V[1][l]) for l in range(len(V[0])) if V[0][l] or V[1][l]]
    c0 = cols[0]
    if all(c0[0]*c[1] - c0[1]*c[0] == 0 for c in cols):
        return norm(c0)
    return None

def main(path):
    d = json.load(open(path))
    n, m = d['n'], d['m']
    prods = [{k: mat(p[k]) for k in 'uvw'} for p in d['products']]
    print('scheme', d['id'], 'rank', len(prods), 'brent ok:', check(prods, n, m))
    KA, KB = {}, {}
    for s, p in enumerate(prods):
        a = line_key_from_kernel(p['u'])
        if a is not None: KA.setdefault(a, set()).add(s)
        b = line_key_from_columns(p['v'])
        if b is not None: KB.setdefault(b, set()).add(s)
    rkU = sum(1 for p in prods if line_key_from_kernel(p['u']) is None)
    rkV = sum(1 for p in prods if line_key_from_columns(p['v']) is None)
    print('rank-2 A-factors:', rkU, ' rank-2 B-factors:', rkV)
    for l in sorted(set(KA) | set(KB)):
        A, B = KA.get(l, set()), KB.get(l, set())
        print('line', tuple(str(x) for x in l), 'a =', len(A), 'b =', len(B), 'c =', len(A & B))

if __name__ == '__main__':
    main(sys.argv[1])


def cross(path):
    """|K_A(l) u K_B(l')| for l != l' (double restriction, must be <= r-16)."""
    d = json.load(open(path))
    prods = [{k: mat(p[k]) for k in 'uvw'} for p in d['products']]
    KA, KB = {}, {}
    for s, p in enumerate(prods):
        a = line_key_from_kernel(p['u'])
        if a is not None: KA.setdefault(a, set()).add(s)
        b = line_key_from_columns(p['v'])
        if b is not None: KB.setdefault(b, set()).add(s)
    for l in KA:
        for l2 in KB:
            if l != l2:
                print('A-line', tuple(map(str, l)), 'B-line', tuple(map(str, l2)),
                      '|K_A|', len(KA[l]), '|K_B|', len(KB[l2]), 'union', len(KA[l] | KB[l2]))
```

### rigid.py

```python
"""Consistency check of the rigidity lemma (versuche/s2-blind-r6.md, Lemma 2)
on a given decomposition, for every line l with a(l) > 0.

After a GL_2 change of the middle basis, l = span(e2). Survivors S are the
products with U eta != 0. Computes (exactly, over Q):
  k        = |S| - 16
  dim span{w_s : s in S}         (lemma: 16)
  dim span{R_s = u_s2 v_s2^T}    (lemma: 16)
  dim Z = span{u_s2 v_s1^T}      (lemma: <= k)
  |G|, dim A_Z (span of u_s2, s in G)   (lemma: dim A_Z <= min(k,4))
Usage: python3 rigid.py <scheme.json>
"""
import json, sys
from fractions import Fraction as F
import sympy as sp

def M(x): return sp.Matrix([[sp.Rational(str(F(e))) for e in r] for r in x])

def rank(vecs):
    if not vecs: return 0
    return sp.Matrix.hstack(*[v.reshape(len(v), 1) for v in vecs]).rank()

def main(path):
    d = json.load(open(path))
    P = [{k: M(p[k]) for k in 'uvw'} for p in d['products']]
    r = len(P)
    lines = set()
    for p in P:
        U = p['u']
        if U.rank() == 1:
            ns = U.nullspace()[0]
            lines.add(tuple(ns / (ns[0] if ns[0] != 0 else ns[1])))
    for eta in sorted(lines, key=str):
        eta = sp.Matrix(eta)
        # basis change g with g e2 = eta: U -> U g, V -> g^{-1} V
        other = sp.Matrix([1, 0]) if eta[1] != 0 else sp.Matrix([0, 1])
        g = sp.Matrix.hstack(other, eta)
        gi = g.inv()
        S = [s for s in range(r) if (P[s]['u'] * eta) != sp.zeros(4, 1)]
        k = len(S) - 16
        Us = {s: P[s]['u'] * g for s in S}
        Vs = {s: gi * P[s]['v'] for s in S}
        w = [P[s]['w'].reshape(16, 1) for s in S]
        R = [(Us[s][:, 1] * Vs[s][1, :]).reshape(16, 1) for s in S]
        Z = [(Us[s][:, 1] * Vs[s][0, :]).reshape(16, 1) for s in S]
        G = [s for s in S if Vs[s][0, :] != sp.zeros(1, 4)]
        AZ = rank([Us[s][:, 1] for s in G])
        print('eta', list(eta), 'a =', r - len(S), 'k =', k,
              'dim w =', rank(w), 'dim R =', rank(R), 'dim Z =', rank(Z),
              '|G| =', len(G), '|N0| =', len(S) - len(G), 'dim A_Z =', AZ)

if __name__ == '__main__':
    main(sys.argv[1])
```
