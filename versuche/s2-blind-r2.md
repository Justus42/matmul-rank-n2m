# S2-04: Blind-Sucher, Stufe 2, Runde 2 (4×2×4: Rang 25 oder 26?)

Datum: 25.11.2026 · Rolle: Blind-Sucher · Auftrag S2-04 vom Orchestrator

## Kurzfassung

- Kein Verfahren mit 25 Produkten gefunden, weder numerisch über ℝ und ℂ noch per SAT über GF(2) mit erzwungener Symmetrie. Status: **vermutet**, dass es über ℝ und ℂ keines gibt (nur numerischer Befund, kein Beleg).
- Rang 26 findet dasselbe numerische Verfahren zuverlässig (ℝ: 18 von 146 Starts, ℂ: 12 von 25). Rang 25: 326 Starts, bestes Residuum stets genau 1, bei beschränkten Koeffizienten. Kein Hinweis auf Grenzrang-Verhalten (wachsende Koeffizienten bei fallendem Residuum) in den untersuchten Becken.
- Kleines Lemma, Status **behauptet**: Jedes Verfahren für ⟨4,2,4⟩ über einem Körper der Charakteristik 2, das unter der Transposition τ invariant ist, hat mindestens 4 τ-feste Produkte, bei ungeradem Rang mindestens 5. Die SAT-Läufe bestätigen das für Rang 25 und 26 (sofort UNSAT bei zu wenigen Fixtermen).
- SAT über GF(2) ist hier zu schwach: Selbst Rang 26 mit Symmetrie findet cryptominisat in 5 Minuten nicht. Alle Rang-25-Läufe mit Zyklus-Symmetrie C4 enden ohne Ergebnis nach 10 Minuten.
- In Richtung eines Beweises für 26 habe ich nichts Belastbares erreicht.

Kein Verfahren gefunden, also keine Datei unter `verfahren/` und keine Prüfung nach 5.2.

## 1. Problemstellung

Tensor T von ⟨4,2,4⟩ in den Konventionen von `verfahren/README.md`: Faktoren u (4×2), v (2×4), w (4×4, nicht transponiert), Gleichungen Σ_r u_r[i][j]·v_r[j'][l]·w_r[i'][l'] = δ(i=i')δ(j=j')δ(l=l'). Gesucht: R = 25 möglich oder nicht. Geprüft ist bisher nur R ≥ 25.

## 2. Ansatz A: numerische Suche über ℝ und ℂ

Code: `s2-blind-r2/als.py`, `als2.py`, `resid.py` (`lm.py` liefert nur den Tensor; die dortige Levenberg-Marquardt-Routine war mit 110 s je Lauf zu langsam und hat in zwei Läufen nichts gefunden, sie ist nicht weiter benutzt).

Verfahren: alternierende kleinste Quadrate (ALS) mit Tikhonov-Regularisierung λ, die geometrisch von 10⁻² auf λ_end fällt (20 000 bzw. 30 000 Durchgänge), zufällige Starts (Normalverteilung, Faktor 0,5), über ℂ mit komplexen Starts.

Ergebnisse (Rohdaten in `s2-blind-r2/ergebnisse/`):

| Rang | Körper | λ_end | Starts | Residuum < 10⁻⁶ | Residuen sonst |
|---|---|---|---|---|---|
| 26 | ℝ | 10⁻⁹ | 146 | 18 (max. Koeffizient ≈ 1,2–1,4) | Plateaus |
| 26 | ℂ | 10⁻⁹ | 25 | 12 | Plateaus |
| 25 | ℝ | 10⁻⁹, 10⁻¹⁴, 10⁻⁶ | 251 | 0 | 1 (76×), √2 (76×), √3 (77×), 2 (20×), √5 (2×) |
| 25 | ℂ | 10⁻⁹, 10⁻¹², 10⁻¹⁴ | 75 | 0 | 1 (47×), √2 (21×), √3 (7×) |

Beobachtungen:

1. Die Residuen liegen fast genau auf √k. Bei Residuum 1 hat der Restensor in allen untersuchten Fällen Rang 1 in der ersten Abflachung (Singulärwerte 1, 0, 0), ist also ein Rang-1-Tensor der Norm 1. Das Becken ist „ein Rang-26-Verfahren, dem ein Produkt fehlt".
2. Auch bei λ_end = 10⁻¹⁴ (praktisch ohne Regularisierung) bleiben die Koeffizienten beschränkt (max. ≈ 1,1–1,5) und das Residuum bei 1. Bei Grenzrang 25 würde man erwarten, dass das Residuum unter 1 fällt und die Koeffizienten wachsen. Das habe ich in keinem Lauf gesehen.
3. Das ist **kein** Beleg für Grenzrang 26: ALS kann in den Becken festsitzen, und ein gezielter Grenzrang-Ansatz (Startwerte entlang einer Kurve, ε-Parametrisierung) fehlt.

Status: vermutet, dass R_ℝ(⟨4,2,4⟩) = R_ℂ(⟨4,2,4⟩) = 26.

Zwischenfall: Die erste komplexe Fassung hatte einen Fehler (Normalgleichung mit Gᵀ statt G; bei reellem G gleich, bei komplexem nicht). Sie divergierte auch bei Rang 26. Nach der Korrektur konvergiert Rang 26 über ℂ; nur die korrigierten Läufe stehen in den Ergebnisdateien.

## 3. Ansatz B: SAT über GF(2) mit erzwungener Symmetrie

Code: `s2-blind-r2/symsat.py` (Kodierung), `run.py` (Gruppen und Orbitstrukturen). Löser: cryptominisat 5.18 über pycryptosat, mit nativen XOR-Klauseln für die 1024 Brent-Gleichungen, Tseitin-Variablen für die Dreifachprodukte. Kalibrierung: ⟨2,2,2⟩ Rang 7 in 0,02 s, ⟨2,2,3⟩ Rang 11 in 0,26 s gefunden und nachgerechnet.

Idee: Statt den ganzen Raum zu durchsuchen, verlange ich Invarianz unter einer kleinen Gruppe von Symmetrien des Tensors. Ein UNSAT schließt dann alle Verfahren mit dieser Symmetrie und Orbitstruktur aus, ein SAT liefert direkt ein Verfahren.

Gruppen (alle wirken durch Umnummerieren der Indizes, daher über jedem Körper Symmetrien von T):

- c4: zyklische Vertauschung (0 1 2 3) gleichzeitig auf i und l, j fest
- c2: deren Quadrat
- sw: (0 1)(2 3) auf i und l, dazu j ↔ j'
- τ: (u, v, w) ↦ (vᵀ, uᵀ, wᵀ), aus (AB)ᵀ = BᵀAᵀ

Ergebnisse (`s2-blind-r2/ergebnisse/sat_gf2.txt`):

| Gruppe | Orbits | Rang | Ergebnis |
|---|---|---|---|
| τ | 13 Paare | 26 | UNSAT, sofort |
| τ | 12 Paare + 2 fest | 26 | UNSAT, sofort |
| τ | 11 + 4, 10 + 6, 9 + 8 | 26 | Zeitgrenze 20 s |
| τ | 12 + 1, 11 + 3 | 25 | UNSAT, sofort |
| τ | 10 + 5, 9 + 7, 8 + 9 | 25 | Zeitgrenze 20 s |
| c2, sw | 13 Paare | 26 | Zeitgrenze 300 s |
| c4 | 6×4 + 1×2 | 26 | Zeitgrenze 300 s |
| c4 | 6×4+1; 5×4+2×2+1; 5×4+2+3×1; 4×4+4×2+1 | 25 | Zeitgrenze 600 s |

Die sofortigen UNSAT-Fälle erklärt dieses Lemma.

**Lemma τ (behauptet).** Sei K ein Körper der Charakteristik 2 und {(u_r, v_r, w_r)} ein Verfahren für ⟨4,2,4⟩ über K, das als Multimenge unter τ invariant ist. Dann gibt es mindestens 4 τ-feste Produkte. Ist der Rang ungerade, mindestens 5.

Beweis (Skizze). Betrachte die Gleichungen mit i = l, j = j', i' = l', also Σ_r u_r[i][j]·v_r[j][i]·w_r[i'][i'] = δ(i = i'). τ bildet diese Gleichungen auf sich ab. Ein Paar (t, τt) mit t ≠ τt liefert zu jeder dieser Gleichungen zweimal denselben Beitrag, denn u_{τt}[i][j]·v_{τt}[j][i]·w_{τt}[i'][i'] = v_t[j][i]·u_t[i][j]·w_t[i'][i']. In Charakteristik 2 hebt sich das auf. Für ein festes Produkt gilt v = uᵀ, also Beitrag u[i][j]²·w[i'][i']. Damit ist die 8×4-Matrix M[(i,j), i'] = δ(i = i') (Rang 4) Summe von f Matrizen vom Rang höchstens 1 (Vektor (u[i][j]²) mal Vektor (w[i'][i'])), also f ≥ 4. Paare zählen gerade, also hat f die Parität des Rangs. ∎

Der Beweis ist kurz, aber von niemandem geprüft. Er sagt nichts über Verfahren ohne τ-Symmetrie und nichts über Charakteristik ≠ 2.

Folgerung für die Suche: τ-symmetrische 25er über GF(2) brauchen mindestens 5 feste Produkte. Die Fälle mit 5, 7 und 9 festen Produkten sind offen geblieben.

## 4. Gegenrichtung (Beweis für 26)

Ich habe keinen eigenen Beweisansatz über eine Skizze hinaus gebracht. Das Lemma τ ist nur ein Werkzeug zur Einschränkung der Suche. Status: keine Aussage.

## 5. Sackgassen

1. Levenberg-Marquardt mit expliziter Jacobi-Matrix (einsum): zu langsam (110 s je Lauf) und ohne Treffer. Aufgegeben zugunsten von ALS.
2. Unregularisiertes ALS über ℂ in der ersten Fassung: Rechenfehler, siehe oben.
3. SAT über GF(2): schon Rang 26 mit Symmetrie nicht in 5 Minuten lösbar. Ohne stärkere Symmetrie oder bessere Kodierung (Symmetriebrechung innerhalb der Orbits, Vorgabe von Faktorrängen) beantwortet SAT die Frage 25 nicht. Aufgegeben in dieser Form.

## 6. Vorschlag für den nächsten Schritt

1. Gezielter Grenzrang-Test über ℂ: ALS/LM mit Startwerten, die aus Rang-26-Lösungen durch Zusammenführen zweier Produkte (u₁ + ε·u₂ usw.) entstehen, und Verfolgen von Residuum gegen Koeffizientennorm. Damit wäre Beobachtung 2 aus Abschnitt 2 aussagekräftiger.
2. Lemma τ von einem Prüfer bestätigen lassen; falls es hält, die offenen τ-Fälle (5, 7, 9 feste Produkte) mit Symmetriebrechung und längeren Rechenblöcken (30 min) über GF(2) angehen. Die festen Produkte sind stark eingeschränkt (v = uᵀ, w symmetrisch), das könnte für eine vollständige Fallunterscheidung reichen.
3. Wer Rechenzeit für SAT einplant: zuerst an Rang 26 mit derselben Symmetrie kalibrieren. Solange 26 nicht gefunden wird, sagt eine Zeitgrenze bei 25 nichts.

## 7. Was ich trotz Blindheit gesehen habe

Offen nach Auftrag:

- Das Projektgedächtnis wurde beim Start automatisch mitgegeben und enthielt Stufe-2-Einträge: Zusammenfassungen von S2-01 (Flip-Graph über GF(2) findet nur 26; Substitutionsschranke mit innerem Index, offenes „Lemma M"), S2-02 (Wangs Programm liefert über F₂ nur ≥ 22; Restfälle aus Yangs Beweis bei r = 25), S2-03 (kein 25er über F₂, F₃, F₅, ℤ; numerisch über ℝ nur Näherungen mit wachsenden Koeffizienten; Empfehlung SAT mit Symmetrie A↔Bᵀ über F₃) und der Literaturwache (26 ist bestes bekanntes Verfahren, 25 beste untere Schranke). Zusätzlich hat das System während der Arbeit dieselben Einträge noch einmal als „relevant" eingeblendet.
- Ich habe nichts davon bewusst benutzt, aber die Wahl von SAT mit Transpositions-Symmetrie liegt nahe an der Empfehlung von S2-03 (dort über F₃, hier über F₂). Unabhängig ist dieser Teil also nur eingeschränkt.
- Mein numerischer Befund widerspricht der Erinnerung an S2-03 in einem Punkt: Ich sehe bei Rang 25 keine wachsenden Koeffizienten, sondern ein festes Residuum 1. Der Unterschied kann an der Regularisierung liegen (sie bestraft große Koeffizienten). Das sollte ein späterer Auftrag klären, siehe Vorschlag 1.
- Nicht gelesen: `versuche/`, Dateien mit s2 unter `lean/prosa/`, Stufe-2-Einträge in LOG.md und STATUS.md, `verfahren/4x2x4-r26-s001.json`, Literatur zum Format. Gelesen: PROTOKOLL.md, CLAUDE.md, `verfahren/README.md`, Dateiliste von `pruefer/`.

## 8. Dateien

- `versuche/s2-blind-r2.md` (dieser Bericht)
- `versuche/s2-blind-r2/*.py` (Code, englisch)
- `versuche/s2-blind-r2/ergebnisse/*.txt` (Rohausgaben)

Abhängigkeiten: numpy, pycryptosat 5.18 (MIT-Lizenz, nur per pip installiert, nicht ins Repo kopiert).
