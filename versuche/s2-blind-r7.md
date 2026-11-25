# S2-29: Blind-Sucher Stufe 2, Runde 7 (Gegenrichtung: Bau eines Verfahrens mit 25 Produkten)

Datum: 25.11.2026 · Rolle: Blind-Sucher · Auftrag S2-29 vom Orchestrator

**Gesamtstatus: kein Verfahren mit 25 Produkten gefunden.** Alle vier Bauwege bleiben bei 26 oder 28 stehen. Die Hilfssätze unten haben Status **behauptet** (eigene Begründung, ungeprüft). Der Ansatz „Bau von Hand“ ist für diese Runde beendet. Die Schlüsse auf die Gegenrichtung (26) haben Status **vermutet**.

Problemstellung, wie sie mir gegeben wurde: Ist R(⟨4,2,4⟩) über beliebigen Körpern 25 oder 26? Geprüft sind R ≥ 25 und R ≤ 26.

---

## 1. Werkzeug: Umformulierung über den Bildraum F

Bezeichnungen: Ein Produkt ist (u, v, w) mit u ∈ K^{4×2}, v ∈ K^{2×4}, w ∈ K^{4×4} wie in `verfahren/README.md`. Die Spalten von u heißen x₁, x₂ ∈ K⁴, die Zeilen von v heißen y₁, y₂ ∈ K⁴.

Fasst man u ⊗ v als Element von K^{4×4} ⊗ gl₂ auf (Eintrag (i,l) ist die 2×2-Matrix (u_{ij} v_{j'l})_{j,j'}), dann ist die C-Scheibe zu c_{il} genau E_{il} ⊗ I₂. Mit

- L = K^{4×4} ⊗ I₂ (Dimension 16),
- W = span{u_r ⊗ v_r} (Dimension ≤ R),
- φ: K^{4×4} ⊗ gl₂ → K^{4×4} ⊗ (gl₂ / K·I₂), also φ(u⊗v) = (x₁y₂ᵀ, x₂y₁ᵀ, x₁y₁ᵀ − x₂y₂ᵀ),

gilt: Die w_r lassen sich genau dann passend wählen, wenn L ⊆ W. Weil ker φ = L ist, folgt dann dim W = 16 + dim φ(W). Also

> **R(⟨4,2,4⟩) = 16 + min dim F**, wobei F = φ(W) über alle Familien von Produkten u_r ⊗ v_r läuft, deren Spann L enthält.

Für 25 braucht man einen Bildraum F der Dimension 9, für 26 genügt 10. (Strassen ⟨2,2,2⟩: 7 = 4 + 3.)

**Nachgerechnet** (exakt über ℚ, Skript in Anhang A) am vorhandenen Verfahren `verfahren/4x2x4-r26-s001.json`: dim W = 26, L ⊆ W, dim F = 10. Nebenbefund: 20 der 26 Produkte haben rank u = rank v = 1, die übrigen 6 haben rank u = rank v = 2.

Diese Form ist für beide Richtungen nützlich: Ein 25er-Verfahren ist ein 9-dimensionaler Raum F im 48-dimensionalen Raum K^{16} ⊗ sl₂, dessen Urbild unter den Produkten u ⊗ v einen 25-dimensionalen Raum aufspannt.

## 2. Weg 1: Kleinere Formate verkleben

| Zerlegung | Teilränge | Summe | hängt bei |
|---|---|---|---|
| Zeilen 2+2: ⟨2,2,4⟩ + ⟨2,2,4⟩ | 14 + 14 | 28 | 28 ohne geteilte Produkte |
| Zeilen 1+3: ⟨1,2,4⟩ + ⟨3,2,4⟩ | 8 + 20 | 28 | 28 |
| Spalten analog | 14 + 14, 8 + 20 | 28 | 28 |
| ⟨3,2,3⟩ + ⟨3,2,1⟩ + ⟨1,2,3⟩ + ⟨1,2,1⟩ | 15 + 6 + 6 + 2 | 29 | 29 |

Herkunft der Teilränge: R(⟨1,2,m⟩) = R(⟨n,2,1⟩) = 2·(Länge), weil der Tensor dann knapp (concise) mit 2m- bzw. 2n-dimensionalem Faktor ist. R(⟨2,2,4⟩) = 14 und R(⟨3,2,3⟩) = 15 übernehme ich aus dem Gedächtnis (Hopcroft-Kerr-Formel als obere Schranke, untere aus der Literatur zu ⟨2,2,n⟩ bzw. ⟨3,2,3⟩, hier **nicht geprüft**). R(⟨3,2,4⟩) = 20 folgt aus der Yang-Formel ⌈(24m+2)/5⌉ in Protokoll Abschnitt 2 und Hopcroft-Kerr.

**Hilfssatz B (Verklebungszählung), behauptet.** Hat ein Verfahren R Produkte und ist K⁴ = V₁ ⊕ V₂ eine beliebige Zerlegung des Zeilenraums von A (und C), so gilt mit im(u) = Spaltenraum von u:

- #{r : im(u_r) ⊆ ℓ} ≤ R − 20 für jede Gerade ℓ,
- #{r : im(u_r) ⊆ V} ≤ R − 14 für jede Ebene V,
- #{r : im(u_r) ⊆ H} ≤ R − 8 für jede Hyperebene H,
- und für jede Zerlegung 2+2 oder 1+3: mindestens 28 − R Produkte sind „gemischt“ (im(u) liegt weder in V₁ noch in V₂).

Begründung: Eine lineare Abbildung P: K⁴ → K⁴/V mit Kern V auf den Zeilenindex von A angewandt macht aus ⟨4,2,4⟩ einen zu ⟨4 − dim V, 2, 4⟩ äquivalenten Tensor. Genau die Produkte mit im(u) ⊆ V verschwinden. Spaltenseite (B, C) gleich.

Für 25 heißt das: höchstens 5 Produkte auf einer Zeilengeraden, höchstens 11 in einer Zeilenebene, mindestens 3 gemischte Produkte für jede Zerlegung. Beim 26er sind es in den Koordinatenzerlegungen 13, 16 und 15 gemischte Produkte (Anhang A), also weit mehr als die nötigen 2. Die Zählung schließt 25 nicht aus.

**Wo es hängt:** Ein geteiltes Produkt spart nur dann, wenn es in beiden Hälften gleichzeitig ein optimales Teilverfahren ergänzt. Zwei Produkte a·b_J ⊗ w_J und a·b_{J'} ⊗ w_{J'} aus disjunkten Blöcken lassen sich nie zu einem Rang-1-Term zusammenlegen, weil b_J ⊗ w_J + b_{J'} ⊗ w_{J'} Rang 2 hat. Sparen geht also nur über Basiswechsel, die Hälften mischen. Ich habe keine Mischung gefunden, die mehr als 2 spart, und keinen allgemeinen Grund, warum 3 unmöglich wären. Hier bleibt der Weg bei 26 stehen.

## 3. Weg 2: Strassen-Blöcke, ⟨4,2,4⟩ = ⟨2,2,2⟩ ⊗ ⟨2,1,2⟩

Vier Strassen-Blöcke ergeben 28.

**Hilfssatz C, behauptet.** Liegt bei jedem Produkt u in einem Zeilenblock (Zeilen {0,1} oder {2,3}) und v in einem Spaltenblock, so hat das Verfahren mindestens 28 Produkte. Begründung: Projektion auf Block (I,J) lässt genau die Produkte des Blocks übrig, und diese ergeben ⟨2,2,2⟩, also mindestens 7 je Block.

Erlaubt man Produkte, deren u in einem Zeilenblock liegt, deren v aber beide Spaltenblöcke berührt (oder umgekehrt), so zählt ein Produkt in zwei Blöcken. Die reine Zählung ergibt dann nur Σ ≥ 28 bei Gewichten ≤ 2, also keine Schranke über 14. Die Sparmöglichkeit hängt an der Frage, ob zwei Strassen-Verfahren benachbarter Blöcke (alle 7er-Verfahren für ⟨2,2,2⟩ sind zueinander äquivalent) ein Produkt gemeinsam haben können. Das 26er spart gegenüber 28 zwei Produkte. Ob es das über gemeinsame Blockprodukte tut, habe ich nicht untersucht.

**Wo es hängt:** bei 26. Ein drittes gemeinsames Produkt würde verlangen, dass drei der vier Blockpaare (horizontal oder vertikal benachbart) je ein Produkt teilen, ohne dass die Basiswechsel der Blöcke sich widersprechen. Die Basiswechsel in der Mitte (GL₂ auf dem Index j) sind für alle vier Blöcke dieselben, weil die Mitte gemeinsam ist. Ich vermute, dass genau diese gemeinsame Mitte die dritte Ersparnis verhindert (**vermutet**, ohne Begründung).

## 4. Weg 3: Symmetrie in der Mitte (GL₂ auf dem Index j)

Eine Gruppe G ⊂ GL₂ wirkt durch (u, v, w) ↦ (u Q⁻¹, Q v, w). Ist ein Verfahren G-invariant (als Menge von Produkten bis auf Skalare), so ist F G-invariant. G wirkt auf gl₂/K·I durch Konjugation.

**Hilfssatz A (Mittelsymmetrie), behauptet.** Ist F von der Form S ⊗ (gl₂/K·I) mit einem Unterraum S ⊆ K^{4×4}, so ist dim S ≥ 4, also R ≥ 16 + 12 = 28. Das gilt in jeder Charakteristik.

Begründung: Die Bedingung φ(u⊗v) ∈ S ⊗ (gl₂/K·I) heißt x₁y₂ᵀ ∈ S, x₂y₁ᵀ ∈ S, x₁y₁ᵀ − x₂y₂ᵀ ∈ S. Aus L ⊆ W folgt, dass die Matrizen x₁y₁ᵀ (oberer linker Block) über alle Produkte ganz K^{4×4} aufspannen. Ist eines von x₁, x₂, y₁, y₂ null, so ist x₁y₁ᵀ null oder liegt in S. Sonst sind x₁y₂ᵀ und x₂y₁ᵀ Rang-1-Matrizen in S, also liegt x₁ in Lft(S) und y₁ in Rgt(S), den Mengen der linken bzw. rechten Faktoren von Rang-1-Matrizen in S. Rang-1-Matrizen mit linear unabhängigen linken Faktoren sind linear unabhängig. Deshalb ist dim span Lft(S) ≤ dim S, und ebenso rechts. Bei dim S = 3 folgt dim span{x₁y₁ᵀ} ≤ 3 + 3·3 = 12 < 16. Ein Widerspruch. Weil dim F = 3·dim S ist, scheiden dim F = 9 und alle Werte unter 12 aus.

**Folgerung, behauptet.** Wirkt G auf sl₂ absolut irreduzibel (zum Beispiel ist das Bild von G in PGL₂ A₄, S₄ oder A₅, über Körpern, die diese Gruppen enthalten), so ist jedes G-invariante F von der Form S ⊗ sl₂ (Schur, End_G = K). Also brauchen solche mittelsymmetrischen Verfahren mindestens 28 Produkte.

**Grenzen:** Für zyklische oder diedrische Mittelsymmetrie zerfällt sl₂ in 1+1+1 bzw. 1+2. Dieselbe Zählung ergibt dann nur s₀ + a·b ≥ 16 mit f = s₀ + s₁₂ + s₂₁, also höchstens R ≥ 24. Das liegt unter der geprüften Schranke 25 und sagt nichts. Über ℚ hat GL₂ nur zyklische und diedrische endliche Untergruppen, Hilfssatz A greift dort also nicht.

**Wo es hängt:** bei 28, und zwar aus einem sauberen Grund. Ein 25er-Verfahren muss in der Mitte unsymmetrisch sein. Es braucht Rang-1-Bausteine x₁y₂ᵀ, x₂y₁ᵀ, deren linke und rechte Faktoren zusammen ganz K⁴ aufspannen, und das passt nicht in drei Dimensionen pro Richtung. Das 26er hat dim F = 10, ist also nicht von der Form S ⊗ sl₂ (10 ist kein Vielfaches von 3).

## 5. Weg 4: Symmetrie auf A, B, C und Bahnen zählen

Die Symmetriegruppe enthält (P, Q, R) ∈ GL₄ × GL₂ × GL₄ mit A ↦ P A Q⁻¹, B ↦ Q B R⁻¹, C ↦ P C R⁻¹, dazu das Transponieren τ: (A, B, C) ↦ (Bᵀ, Aᵀ, Cᵀ), weil n = m.

| Gruppe | Bahngrößen | 25 = … | Ergebnis |
|---|---|---|---|
| ⟨τ⟩ | 1, 2 | ungerade Anzahl τ-fester Produkte | kein Widerspruch: feste Produkte gibt es (u⊗λuᵀ⊗w mit w = ±wᵀ) |
| ℤ₅ über ℚ mit P, R vom Minimalpolynom Φ₅, Q = 1 | nur 5, denn Φ₅ ist über ℚ irreduzibel, P u = λ u hat keine Lösung u ≠ 0 | 5 · 5 | kein Widerspruch, 5 Bahnvertreter bleiben unbestimmt |
| ℤ₃ mit Q Drehung um 120°, P, R mit Block diag(Q-Typ, …) | 1, 3 | 3·8 + 1 oder 3·7 + 4 … | kein Widerspruch |
| A₄, S₄, A₅ in der Mitte | | | ausgeschlossen durch Hilfssatz A (≥ 28) |

**Wo es hängt:** Die Bahnzählung allein schließt bei keiner kleinen Gruppe 25 aus. Die ℤ₅-Form ist auffällig, weil 25 = 5·5 ohne feste Punkte aufgeht. Mit 5 Bahnvertretern (je 30 Parameter) und den ℤ₅-invarianten Gleichungen ist sie aber ein nichtlineares System mit etwa 150 Unbekannten. Das löst man nicht von Hand, und eine Suche darin wäre die aufgegebene Computersuche. Hier habe ich aufgehört.

## 6. Was das für die Gegenrichtung (26) nahelegt

**Status: vermutet.**

1. Die Umformulierung aus Abschnitt 1 macht die Frage zu: Hat jeder Raum F von 9 Dimensionen in K^{16} ⊗ sl₂ ein zu kleines Urbild? Hilfssatz A erledigt die GL₂-stabilen F. Der Beweis zeigt, wo die Kraft liegt: Der Block x₁y₁ᵀ muss ganz K^{4×4} erreichen, aber die Faktoren kommen aus Rang-1-Elementen eines kleinen Raums. Ein Beweis für 26 könnte diese Zählung ohne Symmetrie führen. F wird dann nach einer Basis der Mitte in drei Projektionen F₁₂, F₂₁, F₀ zerlegt, und die Rang-1-Elemente in F₁₂ und F₂₁ werden gezählt. Die naive Fassung gibt nur 24 (Abschnitt 4, Grenzen). Es fehlt eine Zählung, die nutzt, dass F₁₂, F₂₁, F₀ Projektionen *eines* 9-dimensionalen Raums sind und nicht unabhängig wählbar.
2. Hilfssatz B gibt harte Obergrenzen für Produkte auf Zeilengeraden und -ebenen (5 bzw. 11 bei 25). Im 26er haben 20 Produkte rank u = 1. Ein 25er müsste seine Rang-1-u auf mindestens ⌈20/5⌉ = 4 verschiedene Geraden verteilen, wenn es ähnlich gebaut ist. Das ist kein Widerspruch, aber eine Fallunterscheidung nach der Anzahl der Produkte mit rank u = 2 (beim 26er 6) wirkt aussichtsreich.
3. Bei allen drei Bauwegen ist die gemeinsame Mitte (der Index j, auf dem GL₂ für alle Blöcke gleich wirken muss) das, was die dritte Ersparnis verhindert.

## 7. Vorschlag für den nächsten Schritt

- Hilfssatz A ist kurz und elementar. Er eignet sich als kleiner Lean-Baustein oder als Prüfauftrag. Er ändert keine Schranke und zählt deshalb nach Abschnitt 6 nicht als Fortschritt.
- Ein Beweissucher könnte die Bildraum-Form (Abschnitt 1) ohne Symmetrie angreifen: Zeigen, dass für dim F = 9 die Rang-1-Faktoren der Projektionen F₁₂, F₂₁ den Block x₁y₁ᵀ nicht auf 16 Dimensionen bringen.
- Gegenrichtung: Wenn überhaupt noch eine gezielte Rechnung, dann eine exakte Prüfung des ℤ₅-Ansatzes (Abschnitt 5) über einem kleinen Körper der Charakteristik ≠ 5, in dem Φ₅ irreduzibel bleibt (etwa GF(2) oder GF(3)). Das wäre eine Suche in einem kleinen, fest umrissenen Ansatz, keine allgemeine. Ob das unter die Aufgabe der allgemeinen Suche fällt, entscheidet der Orchestrator.

## 8. Offenlegung: Was ich trotz Blindheit gesehen habe

- **Projektgedächtnis beim Start:** Die Übersicht nennt die Behauptungen B-008 bis B-014, die Statuswerte geprüfter Behauptungen, die Begriffe „Unterfall“, „Fall (5,8)“, „Lemma 13“ und „letzter offener Unterfall“ sowie den Plan für Runde 7.
- **Automatisch eingeblendete Gedächtniseinträge** (nicht von mir geöffnet, aber gezeigt): S2-24 (ein „Satz F“ schließe Unterfall B von (5,8) aus, Zählung 13 > 10, Graphen vom Bigrad (d,1), (1,e), daraus eine Kette zu R ≥ 26, alles behauptet), S2-23 (Prüfung von B-013 mit Lemma P und Satz E, GPT-Vorschlag für Unterfall B) sowie kurze Einträge zu S2-17, S2-21, S2-25 ohne Inhalt. Ich habe nichts davon benutzt. Meine Wege (Bildraum F, Mittelsymmetrie, Verklebung) stammen nicht daraus. Ob die Einträge mich unbewusst gelenkt haben, kann ich nicht ausschließen. Mein Vorschlag in Abschnitt 6 (Fallunterscheidung nach Zählung) ähnelt im Stil einer Zählung „13 > 10“.
- **Gelesene Dateien:** `CLAUDE.md`, `PROTOKOLL.md` (nennt B-007, B-010, Spuren A/B), `verfahren/README.md`, `pruefer/README.md`, `verfahren/4x2x4-r26-s001.json` (die Notiz darin nennt Flip-Graph, Kauers-Moosbauer und den Perminov-Katalog). Den Inhalt von `versuche/` habe ich nicht gelesen. Ein `ls versuche` lief einmal, die Ausgabe habe ich verworfen.
- Keine Literatur zu ⟨4,2,4⟩, kein Fremdmodell, kein Git-Log, keine Pull Requests gelesen.

---

## Anhang A: Skript (exakt über ℚ, sympy)

Aufruf `python3 chk.py verfahren/4x2x4-r26-s001.json`. Laufzeit unter 10 Sekunden. Ausgabe am 25.11.2026:

```
dim W 26 dim W+L 26
dim F 10
rank u: [1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
rank v: [1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
split (0, 1) mixed 13
split (0, 2) mixed 16
split (0, 3) mixed 15
```

```python
import json, sys
from sympy import Matrix, Rational

d = json.load(open(sys.argv[1]))
P = [tuple(Matrix([[Rational(c) for c in r] for r in p[k]]) for k in ("u", "v", "w"))
     for p in d["products"]]
n, m = d["n"], d["m"]

# u⊗v in K^{n×m} ⊗ gl2, coordinates (i, l, j, j')
def vec(u, v):
    return [u[i, j] * v[jj, l] for i in range(n) for l in range(m)
            for j in range(2) for jj in range(2)]

W = Matrix([vec(u, v) for u, v, w in P]).T
L = Matrix([[1 if (i == a and l == b and j == jj) else 0
             for i in range(n) for l in range(m) for j in range(2) for jj in range(2)]
            for a in range(n) for b in range(m)]).T
print("dim W", W.rank(), "dim W+L", W.row_join(L).rank())

# phi: drop identity part -> (x1y2, x2y1, x1y1 - x2y2)
def phi(col):
    out = []
    for k in range(n * m):
        a, b, c, e = col[4 * k:4 * k + 4]
        out += [b, c, a - e]
    return out

F = Matrix([phi(list(W[:, r])) for r in range(W.shape[1])]).T
print("dim F", F.rank())
print("rank u:", [u.rank() for u, v, w in P])
print("rank v:", [v.rank() for u, v, w in P])
for S in [(0, 1), (0, 2), (0, 3)]:
    T = [i for i in range(4) if i not in S]
    mix = sum(1 for u, v, w in P
              if any(u[i, j] != 0 for i in S for j in range(2))
              and any(u[i, j] != 0 for i in T for j in range(2)))
    print("split", S, "mixed", mix)
```
