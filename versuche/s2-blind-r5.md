# S2-21: Blind-Sucher Stufe 2, Runde 5 (⟨4,2,4⟩, 25 oder 26)

Datum: 25.11.2026 · Rolle: Blind-Sucher (Protokoll Abschnitt 4) · Auftrag S2-21

**Gesamtstatus:** Die untere Schranke 26 bleibt **vermutet**. Neu ist Satz R (Status **behauptet**, Prosa, ungeprüft): eine Zerlegung der Länge 25 darf in jeder Zeilenrichtung höchstens zwei „reine" Produkte haben. Die zugehörige Ungleichung ist am vorhandenen 26er-Verfahren in jeder Richtung scharf. Wie weit Satz R trägt, hängt an einer offenen Vermutung (V-R, **vermutet**).

---

## 1. Ansatz und Abgrenzung

Yang beweist seine Schranken über den Kern der Ausgabeabbildung W und injektive Abbildungen von Kopien von U in Quotienten ker(W)/J. Ich habe dort nur die Zusammenfassung von v1 gelesen, um diesen Weg zu meiden. Mein Zugang ist die klassische **Substitutionsmethode**: Ich schränke ⟨4,2,4⟩ auf ein ⟨3,2,4⟩ ein, setze R(⟨3,2,4⟩) ≥ 20 als Black Box ein (Yangs Satz 1 für n = 3, m = 4) und zähle, wie viele Produkte bei der Einschränkung wegfallen. Neu daran ist die **Projektionsungleichung** (Lemma P). Sie sagt, wie viele Produkte man mindestens zusätzlich loswird, wenn wenige reine Produkte vorliegen.

Konventionen wie in `verfahren/README.md`: AB = Σ_t U_t(A) V_t(B) W_t, mit U_t als 4×2-, V_t als 2×4- und W_t als 4×4-Matrix (W nicht transponiert). Der Körper F ist beliebig. Die Symmetrie (A,B,C) ↦ (Bᵀ,Aᵀ,Cᵀ) macht aus jeder Aussage über die A-Seite eine über die B-Seite (Zeilen von A ↔ Spalten von B).

## 2. Einschränkungslemmata (Status behauptet)

Sei ξ ∈ F^4 ungleich 0. Ein Produkt t heißt **ξ-rein**, wenn U_t = ξκ_tᵀ ist, also U_t(A) = ξᵀAκ_t. Setze A_ξ = {t : t ist ξ-rein} und a(ξ) = |A_ξ|.

**Lemma A2.** Seien t_1, …, t_d ∉ A_ξ Produkte, deren Zeilen ξᵀW_{t_i} linear unabhängig sind. Dann gilt r ≥ 20 + a(ξ) + d.

*Beweis.* Schränke A auf A′ = {A : ξᵀA = 0} ein (Kodimension 2). Dann verschwinden alle U_t mit t ∈ A_ξ. Für A ∈ A′ liegt AB in K = {M : ξᵀM = 0} (Dimension 12). Ergänze span(W_{t_i}) zu einem 4-dimensionalen G, auf dem M ↦ ξᵀM injektiv ist (etwa mit Matrizen x·eᵀ, wobei ξ(x) = 1). Dann ist M_4 = K ⊕ G, und die Projektion π : M_4 → M_4/G ist auf K injektiv. π(AB) für A ∈ A′ ist also isomorph zu ⟨3,2,4⟩ (Basis mit ξ = e_4ᵀ wählen). Die Terme mit t ∈ A_ξ oder W_t ∈ G fallen weg. Es bleiben höchstens r − a − d Terme, und das sind mindestens R(⟨3,2,4⟩) = 20. ∎

**Lemma A1.** Sei x ∈ F^4 ungleich 0, B_x = {t : W_t = x·η_tᵀ} und b(x) = |B_x|. Seien s Produkte ∉ B_x gegeben, deren Zeilen xᵀU_t ∈ F^{1×2} linear unabhängig sind. Dann gilt r ≥ 20 + b(x) + s.

*Beweis.* Projiziere die Ausgabe längs x⊗F^4. Das Bild hängt dann nur von PA ab, wobei P : F^4 → F^4/⟨x⟩. Die Terme aus B_x fallen weg. Ergänze die s Formen U_t zu einem 2-dimensionalen E, auf dem U ↦ xᵀU injektiv ist, und schränke A auf A″ = E^⊥ ein. Dann ist A″ ∩ (x⊗F^2) = 0, also ist A″ → (F^4/⟨x⟩)⊗F^2 ein Isomorphismus, und der Rest ist ⟨3,2,4⟩. ∎

Beide Lemmata gelten gespiegelt für die B-Seite, mit V_t = κζᵀ und W_t = η·yᵀ.

## 3. Projektionsungleichung (Status behauptet)

**Lemma P.** Sei d(ξ) = dim span{ξᵀW_t : t ∉ A_ξ}. Dann gilt a(ξ) ≥ 2·(4 − d(ξ)). Für a(ξ) = 2 mit parallelen κ_t gilt sogar d(ξ) = 4.

*Beweis.* Wähle x mit ξ(x) = 1 und setze A = xκᵀ. Dann ist ξᵀAB = κᵀB und U_t(xκᵀ) = κ_t·κ für t ∈ A_ξ. Rechnet man modulo D = span{ξᵀW_t : t ∉ A_ξ}, so stellen allein die a(ξ) reinen Terme die Bilinearabbildung (κ, B) ↦ κᵀB mod D dar. Diese ist isomorph zu ⟨1,2,4−d⟩ und hat Rang 2(4−d). Sind alle κ_t parallel, hängt die Darstellung von κ nur über eine einzige Linearform ab. Das ist für 4 − d > 0 unmöglich, weil ⟨1,2,s⟩ im ersten Faktor konzis ist. ∎

**Lemma P′ (A1-Seite).** Aus b(x) ≤ 3 folgt s(x) = 2, aus b(x) ≤ 7 folgt s(x) ≥ 1, mit s(x) = dim span{xᵀU_t : t ∉ B_x}.

*Beweis.* Ist s(x) ≤ 1, so gibt es ein κ ≠ 0 mit U_t(xκᵀ) = 0 für alle t ∉ B_x. Dann stellen die Terme aus B_x die Abbildung B ↦ κᵀB dar, die Rang 4 hat. Ist s(x) = 0, stellen sie ⟨1,2,4⟩ dar, das Rang 8 hat. ∎

## 4. Satz R (Status behauptet)

Lemma A2 und Lemma P zusammen ergeben r ≥ 20 + a + ⌈4 − a/2⌉ = 24 + ⌈a/2⌉. Die Werte für a = 1, 2, 3, 4 sind 25, 25, 26, 26. Lemma A1 und Lemma P′ ergeben r ≥ 26, sobald b ≥ 5.

**Satz R.** In jeder Zerlegung von ⟨4,2,4⟩ der Länge 25, über jedem Körper, gilt:
1. a(ξ) ≤ 2 für jedes ξ. Bei a(ξ) = 2 sind die beiden κ_t linear unabhängig, d(ξ) = 3, und es gibt keine 4 Produkte außerhalb von A_ξ, deren W in einem 4-dimensionalen, für ξ transversalen Raum liegen.
2. Bei a(ξ) = 1 ist d(ξ) = 4, und kein fünftes W liegt im selben transversalen Raum.
3. b(x) ≤ 4 für jedes x, und bei b(x) = 4 ist s(x) = 1.
4. Für jedes Paar mit ξ(x) ≠ 0 gilt |A_ξ ∪ B_x| ≤ 5, denn G = x⊗F^4 ist transversal.
5. Alles gilt gespiegelt für die B-Seite.

Satz R ist eine notwendige Bedingung. Einen benannten Fall schließt er erst aus, wenn klar ist, dass Zerlegungen mit gestreuten reinen Produkten nicht kurz sein können (Abschnitt 6).

## 5. Stützrechnungen (exakt über ℚ bzw. 𝔽_3)

Grundlage ist das Verfahren `verfahren/4x2x4-r26-s001.json`. Ich habe es mit eigenem Code exakt nachgerechnet: es ist gültig. Die Skripte lagen nur im Arbeitsverzeichnis der Sitzung. Das Kernskript steht im Anhang.

| Größe | A-Seite | B-Seite |
|---|---|---|
| reine U bzw. V | 20 von 26 | 20 von 26 |
| max a(ξ) | 3 (ξ = e_1, d = 3) | 4 (d = 2) |
| bestes Lemma A2 | 20 + 6 = **26** | 20 + 6 = **26** |
| bestes Lemma A1 (mit abhängigen Formen in E) | 25 | 26 |

- **Lemma P ist in s001 in jeder Richtung scharf.** Gemessen wurde d = 4 − ⌊a/2⌋ für alle 20 Richtungen mit a ≥ 1 auf beiden Seiten (a = 1 → d = 4, a = 2 → d = 3, a = 3 → d = 3, a = 4 → d = 2). Lemma P′ ist in allen Richtungen erfüllt, dort gilt immer b ≤ 2 und s = 2.
- **s001 ist also genau durch Satz R an 26 gebunden.** Die einzige Richtung mit a = 3 (A-Seite) bzw. a = 4 (B-Seite) erzwingt 26. Alle anderen Richtungen ließen 25 zu.
- **Gemischte Substitution scheitert:** Schränkt man A auf ein allgemeines Komplement E^⊥ ein und projiziert zugleich längs eines allgemeinen transversalen G, entsteht Ψ_{m,N}(R,B) = RB + N(m(R)B). Wäre Ψ immer ≅ ⟨3,2,4⟩, folgte r ≥ 20 + 2 + 4 = 26 für jede Zerlegung. Das ist falsch, und zwar auf zwei Ebenen:
  - Für m = Zeile 1 und N = −e_1⊗· wird Ψ zu ⟨2,2,4⟩ mit Rang 14.
  - Zufällige (m,N) über 𝔽_3: Die Menge der R mit Rang der Abbildung B ↦ Ψ(R,B) ≤ 4 hat dort 32 Punkte, bei ⟨3,2,4⟩ sind es 104 (4 von 4 Zufallsversuchen). Das allgemeine Ψ ist also gar nicht äquivalent zu ⟨3,2,4⟩, und sein Rang ist unbekannt.

  Die beiden linearen Familien, also die Lemmata A2 und A1, sind damit die einzigen naheliegenden Einschränkungen auf ⟨3,2,4⟩.

## 6. Wo der Ansatz hängt, und die offene Vermutung

Satz R begrenzt reine Produkte **je Richtung**, aber nicht ihre Gesamtzahl. Eine Zerlegung, deren reine U über viele Richtungen gestreut sind (a ≤ 2 überall) oder die fast nur Rang-2-U hat, entgeht allen Schranken dieser Art. Für a ≡ 0 liefert Lemma A2 nur r ≥ 24.

Für lange Zerlegungen gibt es so etwas wirklich. Zerlegt man T über eine allgemeine Basis von A, entstehen 64 Terme ohne reines U. Eine Vermutung der Form „jede Zerlegung hat ein a(ξ) ≥ 3" ist deshalb nur für Länge ≤ 25 sinnvoll:

**Vermutung V-R (vermutet).** Jede Zerlegung von ⟨4,2,4⟩ der Länge ≤ 25 hat auf der A- oder B-Seite eine Richtung mit a ≥ 3 oder ein x bzw. y mit b ≥ 5.

Mit Satz R folgt aus V-R die Schranke 26. Ein Beweis von V-R bräuchte ein Argument, das reine Produkte erzwingt. Das habe ich nicht gefunden.

Geprüfte Ideen ohne Erfolg:
- Mittelung von #{t : ξᵀW_t = 0} ≤ 17 über alle ξ ∈ P^3(𝔽_2): Die Summe bleibt weit unter der Grenze.
- Zweistufige Kette ⟨4,2,4⟩ → ⟨3,2,4⟩ → ⟨2,2,4⟩: Sie gibt mit den bekannten Rängen nur die Summe 25 − 14 = 11 zurück.
- Reduktion auf ⟨2,2,2⟩⊕⟨2,2,2⟩ (Rang 14): zu schwach.

## 7. Vorschlag für den nächsten Schritt

1. **Satz R prüfen lassen:** Prüfer, danach Lean. Die Lemmata A2, A1, P und P′ sind kurz, rein linear-algebraisch und verwenden nur R(⟨3,2,4⟩) ≥ 20 als Black Box, das schon formalisiert ist. Für die Formalisierung ist das gut geeignet.
2. **V-R an weiteren 26ern testen:** Prüfen, ob V-R in allen bekannten 26ern gilt, also ob immer eine Richtung a ≥ 3 vorkommt. Das Kernskript im Anhang reicht dafür. Ein Gegenbeispiel unter den 26ern würde zeigen, dass man mit gestreuten reinen Produkten auskommt, und wäre ein Fingerzeig für Spur A in Richtung Konstruktion.
3. **Rang des gemischten Tensors Ψ_{m,N}:** Ein Satz „R(Ψ_{m,N}) ≥ 20 außerhalb einer expliziten Ausnahmemenge Z" würde jede 25er-Zerlegung zwingen, alle Wahlen von 2 + 4 Produkten nach Z zu legen. Das ist eine sehr starke Bedingung. Dies ist ein eigener Zugang, ohne Yangs Ungleichungen, aber vermutlich schwer.

## 8. Offenlegung: was ich trotz Blindheit gesehen habe

- **Automatisch geladen:** das Projektgedächtnis (MEMORY.md) mit dem Stufe-2-Stand. Daraus kannte ich die Namen B-008 (Satz A), B-009 (Satz B), Lemma 13′, V und S, die Restfälle (3,6) und (5,8) sowie das Ende von Spur B.
- **Abrufe des Gedächtnisdienstes während der Arbeit:** Einträge zu S2-01, S2-04, S2-08, S2-16 und S2-17. Darin standen Kurzfassungen: K-Substitution r ≥ 16 + S_mid mit offenem Lemma M, ALS und Flip-Suche nie 25, Lemma τ, Satz C (keine symmetrische 25er-Zerlegung) und der offene Unterfall B zu (5,8). Davon habe ich nichts benutzt. Die K-Seiten-Substitution habe ich bewusst nicht weiterverfolgt, weil sie offenbar S2-01 entspricht.
- **Weitere gesehene Dateien:** CLAUDE.md und PROTOKOLL.md (Pflicht), Dateinamen unter `behauptungen/` (B-008 bis B-013, nicht geöffnet), `verfahren/README.md` und `verfahren/4x2x4-r26-s001.json` (benutzt), die Zusammenfassung von Yang v1 über alphaXiv.
- **Nicht gelesen:** `versuche/`, `lean/prosa/`, Lean-Dateien, LOG.md, STATUS.md, `lit/WACHE.md`, Git-Log.
- **Fremdmodelle:** keine benutzt.

## Anhang: Kernskript (Python, exakt über ℚ)

```python
# AB = sum U_t(A) V_t(B) W_t ; checks Lemma P and P' on a decomposition file
import json, sys
from fractions import Fraction as Fr

def rank(vs):
    rows=[list(v) for v in vs if any(v)]; r=0
    for c in range(len(rows[0]) if rows else 0):
        p=next((i for i in range(r,len(rows)) if rows[i][c]),None)
        if p is None: continue
        rows[r],rows[p]=rows[p],rows[r]
        for i in range(len(rows)):
            if i!=r and rows[i][c]:
                f=rows[i][c]/rows[r][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        r+=1
    return r
T=lambda M:[list(x) for x in zip(*M)]
def pure(M):                      # column factor of a rank-1 matrix, normalised
    if rank(M)!=1: return None
    c=next(col for col in T(M) if any(col)); p=next(x for x in c if x)
    return tuple(x/p for x in c)
vm=lambda xi,M:[sum(xi[i]*M[i][c] for i in range(len(M))) for c in range(len(M[0]))]
d=json.load(open(sys.argv[1]))
P=[tuple([[Fr(x) for x in row] for row in p[k]] for k in "uvw") for p in d["products"]]
for side,Q in (("A",P),("B",[(T(v),T(u),T(w)) for u,v,w in P])):
    U=[q[0] for q in Q]; W=[q[2] for q in Q]; r=len(Q)
    for xi in sorted({pure(u) for u in U}-{None}):
        A=[t for t in range(r) if pure(U[t])==xi]
        dd=rank([vm(xi,W[t]) for t in range(r) if t not in A])
        print(side,"xi",xi,"a",len(A),"d",dd,"P ok",len(A)>=2*(4-dd),"bound",20+len(A)+dd)
    for x in sorted({pure(w) for w in W}-{None}):
        B=[t for t in range(r) if pure(W[t])==x]
        s=rank([vm(x,U[t]) for t in range(r) if t not in B]); b=len(B)
        print(side,"x",x,"b",b,"s",s,"P' ok",(b>3 or s==2) and (b>7 or s>=1))
```
