# S4-08: Suche nach einem Verfahren mit 34 für ⟨3,2,7⟩ mit den Kenngrößen des Restfalls (Stufe 4, Runde 2, Spur B)

- Auftrag S4-08, Rolle Verfahrenssucher, im Auftrag des Orchestrators. Bearbeitung 26.11.2026 ab 07:42 UTC (Dauer aus den Git-Zeitstempeln ablesbar)
- Status aller Aussagen dieser Datei: **behauptet**. Den Status setzt nur der Orchestrator
- Programme: `versuche/s4-spurB-r2/` (eigener Code, Python 3; SAT-Löser und Beweisprüfer nur als externe Programme, Abschnitt 6)
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` (0.6), `STATUS.md`, `LOG.md` (Stufe 3 und 4), `versuche/s4-blind-r1.md`, `versuche/s2-spurB-r2.md` (Kopf und Abschnitte 1 bis 2), Liste von `versuche/`, `behauptungen/B-017.md`, `erkundung/s3-04-restfaelle-327.md`, `lean/prosa/yang_n3.md` (Abschnitte 2 bis 8), `verfahren/3x2x5-r25-hk71.json`, `verfahren/3x2x6-r30-hk71.json`, `verfahren/3x2x7-r35-hk71.json`, die Kopfteile von `pruefer/python/README.md` und `pruefer/rust/README.md`. Nichts, was in Runde 2 neu entstanden ist
- Keine Subagenten, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Eingeblendet wurden mir der Gedächtnisindex und die Einzeleinträge `hk-verfahren-a10`, `verfahren-datenformat`, `verfahren-randfaelle-s1-04`, `git-regeln` (nur Datei- und Formathinweise, für die Arbeit nicht benutzt)

---

## 1. Ergebnis in Kürze

1. **Kein Fund.** Kein Verfahren mit 34 für ⟨3,2,7⟩, über keinem Körper. **Kein Teilraum ist vollständig abgesucht**: Alle vier SAT-Läufe endeten an der Zeitgrenze ohne Ergebnis, es gibt kein UNSAT und kein Zertifikat. Alles in Abschnitt 4 und 5 ist Stichprobe.
2. **Eichung (Abschnitt 2):** Die Kenngrößen der bekannten Verfahren sind gemessen. Beide 35er-Verfahren haben (ρ, rk L, rk H) = (6, 7, 6), dim N = 1, dim S = 0, das Verfahren für 3×2×5 (4, 5, 4) mit s = 0, das für 3×2×6 (6, 6, 6) mit s = 0, passend zu S3-04 Probe 4. Der Restfall der Länge 34 verlangt (4, 6, 4), dim N = 3, dim S = 1. Das liegt weit von allen geeichten Verfahren entfernt.
3. **Übersetzung (Abschnitt 3, Satz K, behauptet):** Jede stark normalisierte Zerlegung der Länge 34 erfüllt nach einem Basiswechsel der Spalten von B und C die Bedingungen (K1) und (K2): Für jedes Produkt ist der Anteil von β_r an Zeile 1, Spalten 5 bis 7 von B bis auf einen Faktor der Anteil von α_r an Spalte 0 von A, und drei quadratische Vektoren liegen in J. Der Beweis braucht weder Lemma 15(b) noch einen algebraisch abgeschlossenen Körper, nur die starke Normalform.
4. **Grenze über kleinen Körpern:** Keines der bekannten Verfahren für 25, 30, 35 lässt über GF(2) die starke Normalform zu, das 35er-Verfahren auch über GF(3) nicht. Ein SAT-Ansatz über GF(2) mit (SN1), (K1), (K2) durchsucht deshalb eine Klasse, die keines der bekannten optimalen Verfahren enthält.
5. **Werkzeug nicht geeicht:** Die Positivprobe (SAT über GF(2) ohne Ansatz bei 35, wo ein Verfahren existiert) fand in 20 Minuten nichts, ebenso die Levenberg-Marquardt-Probe bei 35 in 5 Minuten nicht exakt. Ein Ausbleiben eines Funds bei 34 ist daher kein Indiz.
6. Runde 2 wurde vom Orchestrator nach Block 2 abgeschlossen (Anweisung von Justus). Kein weiterer Block, kein neuer Ansatz.

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

---

## 4. Rechenblock 1: Levenberg-Marquardt über ℝ in der Normalform (Stichprobe)

Programm `s4-spurB-r2/lm_normalform.py` (numpy, Gleitkomma, nur zur Suche; ein Treffer hätte exakt nachgerechnet werden müssen), Startskript `block_lm.sh`, 4 Kerne, je Lauf eigene Saat und harte Zeitgrenze.

| Block | Beginn bis Ende (UTC) | Inhalt | Ergebnis |
|---|---|---|---|
| 1a | 07:50:36 bis 07:55:36 | Positivprobe: freie Zerlegung mit 35, 4 Läufe je 300 s, Saaten 100, 1100, 2100, 3100 | kein exaktes Verfahren. Restnorm 2,8·10⁻³ und 3,2·10⁻³ (2 Läufe, langsam fallend), 1,0 und 1,4 (2 Läufe). Daten `daten/block1a_kontrolle35.log` |
| 1b | 07:55:54 bis 08:10:24 | Rang 34 mit (SN1), (K1), (K2) als Gleichungen, 12 Läufe je 290 s, Saaten 500 bis 502, 1500 bis 1502, 2500 bis 2502, 3500 bis 3502 | kein Fund. Restnormen 0,12 (1 Lauf), sonst 1,0, 1,41 oder 1,73, also hängen geblieben mit 1 bis 3 fehlenden Einträgen; Koeffizienten wachsen auf 22 bis 54. Daten `daten/block1b_k1_34.log` |

Zwischen 1a und 1b liegt Commit `S4-08: Block 1a` (07:55:46 UTC). Bewertung: Die Positivprobe zeigt, dass das Verfahren selbst bei 35 in 5 Minuten nicht bis zur Lösung kommt. Block 1b ist deshalb eine schwache Stichprobe, kein Indiz gegen ein Verfahren mit 34 über ℝ. Komplexe Zerlegungen sind nicht abgedeckt.

## 5. Rechenblock 2: SAT über GF(2) (Stichprobe, kein Zertifikat)

Kodierer `s4-spurB-r2/sat327.py` (eigener Code; Brent-Gleichungen als UND-Gatter und XOR-Ketten, alle 1764 Gleichungen; Ansatzschalter `--sn1`, `--k1`, `--k2`, dazu `--lex` gegen Umnummerierung der Produkte; Dekodierer rechnet jede Lösung unabhängig von der CNF nach). Probe des Kodierers an ⟨3,2,2⟩: Rang 11 SAT, Lösung vom Dekodierer mit 0 verletzten Gleichungen bestätigt. Rang 10 (UNSAT nach bekanntem Rang 11) in 200 s nicht entschieden, also selbst dort kein UNSAT in kurzer Zeit.

Löser kissat (github.com/arminbiere/kissat, Commit 8af8e56f174b778aef3aa45af9f739b2a5f492c2, MIT), nur als externes Programm, `--seed=1`. Für a34 und sn34 wurde ein DRAT-Beweis mitgeschrieben, für den Fall eines UNSAT mit drat-trim (Commit 2e3b2dc0ecf938addbd779d42877b6ed69d9a985, MIT) zu prüfen. Weil kein UNSAT kam, sind die Beweisdateien (2,6 und 3,0 GB) gelöscht. Nichts davon ist ins Repo kopiert.

Block 2: 08:10:41 bis 08:30:41 UTC, 4 Läufe parallel, je 1200 s (Commit davor 08:10:30 UTC).

| Lauf | Kodierung | Variablen / Klauseln | SHA-256 der CNF | Ergebnis |
|---|---|---|---|---|
| a34 | R = 34, `--sn1 --k1 --k2 --lex` | 123616 / 427164 | siehe unten | Zeitgrenze, 17,4 Mio. Konflikte |
| sn34 | R = 34, `--sn1 --lex` | 123065 / 425056 | siehe unten | Zeitgrenze, 17,0 Mio. Konflikte |
| sn35 | R = 35, `--sn1 --lex` (Probe: gibt es SN1 über GF(2) bei 35 überhaupt?) | 126737 / 437715 | siehe unten | Zeitgrenze, 17,7 Mio. Konflikte |
| p35 | R = 35, `--lex`, ohne Ansatz (Positivprobe, Lösung existiert) | 126737 / 437680 | siehe unten | Zeitgrenze, 17,0 Mio. Konflikte |

SHA-256: a34 `2c848cc10747f4e63a18921fa9bcfe492377c9fbf8951edff746b8df7898432b`, sn34 `6242683166957825f238eb12894e7f0310a85b56cf23761ba6206530ad9aa14c`, sn35 `bb99b10d8a86e5b8d83a24a557e4efbc264c32eee429fdcebb7712b2a73f4398`, p35 `2ec2ee2250790a48e845c44b910e3b07f630f6e762c127043cdfcb87de7d70e7`. Die CNF-Dateien (je etwa 8 MB) liegen nicht im Repo, `sat327.py encode` erzeugt sie deterministisch neu. Auszüge der Löserausgaben: `daten/block2_*.txt`, Zeiten `daten/block2_sat.log`.

Bewertung: Die Positivprobe p35 ist gescheitert. Der Löser findet in 20 Minuten nicht einmal ein Verfahren, das sicher existiert. Damit sagt das Ausbleiben eines Ergebnisses bei a34 und sn34 nichts. **Kein Teil des Suchraums ist vollständig abgesucht.**

## 6. Was gescheitert ist und warum (für `versuche/`)

1. **Vollständige SAT-Suche über GF(2) mit dem Ansatz:** zu groß. Auch mit (SN1), (K1), (K2) und Lex-Ordnung bleibt ein Problem mit über 120 000 Variablen, das kissat in 20 Minuten weder löst noch widerlegt; schon ⟨3,2,2⟩ bei Rang 10 wird in 200 s nicht widerlegt. Dazu der inhaltliche Mangel aus 3.2: Über GF(2) ist die starke Normalform eine echte Einschränkung, die keines der bekannten optimalen Verfahren erfüllt.
2. **Zyklische Symmetrie ℤ₇ auf den Spalten** (überlegt, nicht gerechnet): unbrauchbar. Bei einer Wirkung ohne Fixprodukte müsste 7 die Länge teilen. Bei der Wirkung nur auf den Spalten von B und C zerfällt F₂[ℤ₇] in F₂ × F₈ × F₈, und auf jedem F₈-Anteil braucht man mindestens 6 Bahnen, also mindestens 42 Produkte. Gleiches gilt für jede andere Wirkung der Ordnung 7 mit nichttrivialem Anteil auf den Spalten. Diese Überlegung ist behauptet und nicht nachgerechnet.
3. **Levenberg-Marquardt:** hängt in Plateaus mit Restnorm 1, √2, √3 fest; die Positivprobe bei 35 erreicht in 5 Minuten keine exakte Lösung.

## 7. Vorschläge für eine spätere Runde (nur Hinweise)

- Den Ansatz (SN1), (K1), (K2) über einem Körper prüfen, der die Normalform zulässt (GF(p) mit p ≥ 5 oder ℚ), mit kleineren Teilproblemen: etwa zuerst nur die Einschränkung auf die Spalten 5 bis 7 (ein ⟨3,2,3⟩-Teilverfahren mit an α gekoppeltem β), deren Länge und Struktur der Satz K weiter eingrenzen könnte.
- Ein SAT-Werkzeug zuerst an der Positivprobe bei 35 eichen (mehr Zeit, Symmetriebrechung, Teilbelegungen aus bekannten Verfahren), bevor man UNSAT erwartet.
- Satz K ist eine Aussage für Spur A: Er ist ohne Lemma 15(b) und über jedem Körper mit Normalform gültig und gibt dem Restfall eine konkrete Gestalt. Prüfen müsste ihn ein Prüfer.

## 8. Verbrauch

- Rechenblöcke: 1a 07:50:36 bis 07:55:36, 1b 07:55:54 bis 08:10:24, 2 08:10:41 bis 08:30:41 UTC, je 4 Kerne, jeder unter 30 Minuten, zwischen allen ein Commit. Dazu kurze Läufe unter 5 Minuten: Eichung der Kenngrößen, Normalform-Probe über GF(2) und GF(3), Probe des Kodierers an ⟨3,2,2⟩ (200 s). Nichts läuft weiter.
- Subagenten: 0. Fremdmodell-Anfragen: 0.
