# S4-08: Suche nach einem Verfahren mit 34 für ⟨3,2,7⟩ mit den Kenngrößen des Restfalls (Stufe 4, Runde 2, Spur B)

- Auftrag S4-08, Rolle Verfahrenssucher, im Auftrag des Orchestrators. Bearbeitung 26.11.2026 ab 07:42 UTC (Dauer aus den Git-Zeitstempeln ablesbar)
- Status aller Aussagen dieser Datei: **behauptet**. Den Status setzt nur der Orchestrator
- Programme: `versuche/s4-spurB-r2/` (eigener Code, Python 3; SAT-Löser und Beweisprüfer nur als externe Programme, Abschnitt 6)
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` (0.6), `STATUS.md`, `LOG.md` (Stufe 3 und 4), `versuche/s4-blind-r1.md`, `versuche/s2-spurB-r2.md` (Kopf und Abschnitte 1 bis 2), Liste von `versuche/`, `behauptungen/B-017.md`, `erkundung/s3-04-restfaelle-327.md`, `lean/prosa/yang_n3.md` (Abschnitte 2 bis 8), `verfahren/3x2x5-r25-hk71.json`, `verfahren/3x2x6-r30-hk71.json`, `verfahren/3x2x7-r35-hk71.json`, die Kopfteile von `pruefer/python/README.md` und `pruefer/rust/README.md`. Nichts, was in Runde 2 neu entstanden ist
- Keine Subagenten, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Eingeblendet wurden mir der Gedächtnisindex und die Einzeleinträge `hk-verfahren-a10`, `verfahren-datenformat`, `verfahren-randfaelle-s1-04`, `git-regeln` (nur Datei- und Formathinweise, für die Arbeit nicht benutzt)

---

## 1. Ergebnis in Kürze

PLATZHALTER

---

## 2. Eichung: Kenngrößen bekannter Verfahren

Programm `s4-spurB-r2/kenngroessen.py`. Es wendet einen zufälligen Basiswechsel (S, T) über GF(p) mit p = 2³¹ − 1 an (Ersatz für die generische Wahl in Lemma A, `yang_n3.md` Abschnitt 5), skaliert auf α_r(e₀₀) = 1 und berechnet exakt über GF(p): q, ρ (größter Rang von γ₁F₁ + γ₂F₂ über zufällige γ), rk F₁, rk L, rk H, s = dim F₂(ker F₁), dim N, Δ und dim S, alles in den Bezeichnungen von `yang_n3.md` Abschnitte 6 bis 8. Je Verfahren 6 Ziehungen (Saat 1), alle 6 Ziehungen ergaben jeweils dieselben Werte.

| Verfahren | m | R | q | ρ | rk F₁ | rk L | rk H | s | dim N | Δ | dim S |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `3x2x5-r25-hk71` | 5 | 25 | 5 | 4 | 4 | 5 | 4 | 0 | 1 | 3 | 0 |
| `3x2x6-r30-hk71` | 6 | 30 | 6 | 6 | 6 | 6 | 6 | 0 | 0 | 6 | 0 |
| `3x2x7-r35-hk71` | 7 | 35 | 7 | 6 | 6 | 7 | 6 | 0 | 1 | 5 | 0 |
| 35er-Verfahren aus `versuche/s4-blind-r1.md` Abschnitt 2.3 (⟨3,2,4⟩ ⊕ ⟨3,2,3⟩) | 7 | 35 | 7 | 6 | 6 | 7 | 6 | 0 | 1 | 5 | 0 |
| Standardverfahren (42 Produkte, Probe) | 7 | 42 | 14 | 7 | 7 | 14 | 7 | 0 | 0 | 0 | 0 |
| **Restfall Länge 34** (B-017) | 7 | 34 | 6 | 4 | 4 | 6 | 4 | 0 | 3 | 2 | 1 |

Ablesbar:

1. Die Werte für 3×2×5 (ρ, s) = (4, 0) und 3×2×6 (ρ, s) = (6, 0) liegen in den zulässigen Mengen, die `erkundung/s3-04-restfaelle-327.md` Abschnitt 4, Probe 4 für diese Verfahren ausweist. Die Übersetzung von Yangs Größen in Rechnungen an den Faktoren ist damit an zwei Stellen geeicht. Beide Verfahren liegen an Yangs Schranke, aber in verschiedenen Zweigen seines Abschlusses: 3×2×5 im Fall Δ ≥ 2 mit dim N = 1, 3×2×6 im Fall Δ ≥ 2 mit dim N = 0, also nicht in einer Lage wie dem Restfall.
2. Beide bekannten Verfahren mit 35 haben dieselben Kenngrößen (ρ, rk L, rk H) = (6, 7, 6), dim N = 1, dim S = 0. Der Restfall verlangt (4, 6, 4), dim N = 3, dim S = 1. Ein Verfahren mit 34 hat also einen dreidimensionalen gemeinsamen Kern N der Abbildungen F₁, F₂ statt eines eindimensionalen und einen Raum S ≠ 0, den keines der geeichten Verfahren hat. Es ist **kein** kleiner Umbau der bekannten 35er-Verfahren in dem Sinn, dass die Kenngrößen nahe beieinander lägen.
3. Probe der Programmlogik: Beim Standardverfahren ist rk L = q = 14 und N = 0, wie es sein muss (jede Spalte von B liefert eigene Produkte).

---

## 3. Übersetzung des Restfalls in Bedingungen an die Faktoren

Bezeichnungen wie in `lean/prosa/yang_n3.md`: Produkt r ist α_r(A)·β_r(B)·C_r, mit Koeffizienten a_r[i][j] (A-Seite, 3×2), b_r[j][l] (B-Seite, 2×7), w_r[i][l] (C-Seite). Spalten von B und C heißen hier 1 bis 7.

### 3.1 Satz K (behauptet)

*Voraussetzung:* Eine Zerlegung von ⟨3,2,7⟩ der Länge 34 über einem Körper F ist stark normalisiert, (SN1) und (SN2) aus `yang_n3.md` Abschnitt 5.

*Aussage:* Es gibt einen Basiswechsel der Spalten von B und C (B ↦ BP, C ↦ CP mit P ∈ GL₇(F); er ändert (SN1), (SN2) nicht), nach dem für jedes Produkt r gilt:

- **(K1)** (b_r[1][7], b_r[1][6], b_r[1][5]) = κ_r · (a_r[0][0], a_r[1][0], a_r[2][0]) mit κ_r := b_r[1][7]/a_r[0][0].

  In Worten: Auf den drei Spalten 5, 6, 7 ist der Anteil von β_r an der Zeile 1 von B bis auf einen Faktor gleich dem Anteil von α_r an der Spalte 0 von A, mit der festen Zuordnung Spalte 7 ↔ Zeile 0, 6 ↔ 1, 5 ↔ 2.
- **(K2)** Mit λ_r := a_r[1][0]/a_r[0][0], μ_r := a_r[2][0]/a_r[0][0] liegen die drei Vektoren (κ_r λ_r²)_r, (κ_r λ_r μ_r)_r, (κ_r μ_r²)_r in J = {(Σ_l b_r[1][l] y_l)_r : y ∈ F⁷}.
- **(K3)** N = span(e₅, e₆, e₇), S = span(e₇), und die Vektoren z, Λz, μz mit z := (κ_r)_r sind linear unabhängig.

*Beweis (Skizze, behauptet).* Die Kette aus S3-04 Abschnitt 5.1 braucht für dim N = 3 und dim S = 1 nur (G), rk L ≤ q, Lemma I, Lemma H und Lemma B. Diese benutzen (SN1) und (SN2), aber weder Lemma 15(b) noch einen algebraisch abgeschlossenen Körper. Es folgen rk L = 6, rk H = 4, dim N = 3, Δ = 2, dim S ≥ 1, mit Lemma B dim S = 1 und f₀(S) + f₁(S) + f₂(S) = f₀(N). Nach Skalierung auf a_r[0][0] = 1 ist f₀(x) = Mx mit M[r][l] = b_r[1][l], f₁ = ΛM, f₂ = diag(μ)M. Sei S = span(x₀). Nach Definition von S gibt es y₁, y₂ ∈ N mit ΛMx₀ = My₁ und μMx₀ = My₂. Wegen der Gleichheit in Lemma B spannen Mx₀, My₁, My₂ den Raum MN auf, und weil M injektiv ist (G4), ist {x₀, y₁, y₂} eine Basis von N. Wähle P so, dass x₀, y₁, y₂ die Spalten 7, 6, 5 werden. Dann ist ΛMe₇ = Me₆ und μMe₇ = Me₅, das ist (K1). Weil e₆, e₅ ∈ N, liegen ΛMe₆ = Λ²z, μMe₆ = ΛMe₅ = Λμz und μMe₅ = μ²z in J, das ist (K2). (K3) ist die Wahl der Basis und (SN2) für v = e₁,₇. ∎

*Was der Satz über eine beliebige Zerlegung der Länge 34 sagt:* Über einem unendlichen Körper gibt es nach Lemma A einen Basiswechsel (S, T) zur starken Normalform. Eine Zerlegung über einem endlichen Körper ist auch eine über seinem algebraischen Abschluss. **Jede** Zerlegung der Länge 34 über **irgendeinem** Körper hat also nach einem Basiswechsel (S, T, P) über einem geeigneten Erweiterungskörper die Form (SN1), (K1), (K2). Über dem Grundkörper selbst gilt das nur, wenn er die starke Normalform zulässt.

### 3.2 Was das für die Suche bedeutet

- (K1) legt für jedes Produkt 2 der 14 B-Koeffizienten fest (b_r[1][6], b_r[1][5] aus a_r[·][0] und b_r[1][7]). (SN1) legt a_r[0][0] = 1 fest. Zusammen 3·34 = 102 Koeffizienten weniger, dazu (K2) mit 21 Zeugenvariablen und 102 Gleichungen. Der Basiswechsel P ist damit bis auf Transformationen, die e₅, e₆, e₇ festhalten, verbraucht.
- Weitere Folgerungen (nicht kodiert): Für die Punkte p_r = (λ_r, μ_r) mit κ_r ≠ 0 gilt: Sie liegen nicht alle auf einer Geraden ((K3)), und es sind mindestens vier verschiedene. Bei höchstens drei Punkten wäre jede Funktion auf ihnen affin, dann wären Λ²z, Λμz, μ²z ∈ span(z, Λz, μz) und damit e₅, e₆ ∈ S, also dim S = 3.
- **Über kleinen Körpern** greift der Satz nur für Zerlegungen, die dort selbst stark normalisierbar sind. Probe mit `s4-spurB-r2/sn_gf2.py`: Keines der vier Verfahren aus Abschnitt 2 (25, 30, 35, 35) lässt über GF(2) auch nur (SN1) zu, das 35er-Verfahren `3x2x7-r35-hk71` auch über GF(3) nicht (für jede Zeile p gibt es kein u mit α_r(u·p) ≠ 0 für alle r). Eine SAT-Suche über GF(2) mit (SN1), (K1), (K2) durchsucht also eine Klasse, in der keines der bekannten optimalen Verfahren liegt. Ein UNSAT dort sagt nichts über Zerlegungen über GF(2), die erst über GF(2ᵏ) normalisierbar sind.
- **Über ℝ** ist der Ansatz ohne Verlust: Für eine reelle Zerlegung ist die Menge der guten (S, T) Zariski-offen und nicht leer, enthält also reelle Punkte, und N, S, x₀, y₁, y₂ sind dann reell.

PLATZHALTER-SUCHE
