# V-S2-06: SAT-Suche nach einem Verfahren mit 25 Produkten für ⟨4,2,4⟩ (Spur B, Runde 2)

- Ziel: Stufe 2, Spur B. Ein Verfahren mit 25 Multiplikationen für ⟨4,2,4⟩, oder ein prüfbarer Ausschluss einer klar umrissenen Klasse
- Ergebnis: **kein Fund.** Über 𝔽₂ ist unter dem Symmetrieansatz A ↔ Bᵀ für 7 von 13 möglichen Zahlen f von Fixprodukten gezeigt, dass es kein Verfahren mit 25 Produkten gibt, jeweils mit DRAT-Beweis, den `drat-trim` annimmt (Status **behauptet**, Prüfung nach 5 steht aus). Offen bleiben f = 5 bis 17. Die Fälle 5, 7, 9 und 13 liefen je 25 Minuten ohne Ergebnis, 11, 15 und 17 nur 2 Minuten.
- Teilbericht: Die 𝔽₃-Suche und die Flip-Graph-Suche von vielen unabhängigen Starts sind nur als kurze Probe gelaufen (Abschnitt 5 und 6). Das sind die benannten Lücken dieser Runde
- Runde und Datum: Stufe 2, Runde 2, 25.11.2026, Auftrag S2-06, Verfahrenssucher
- Rechenaufwand: vier Blöcke auf 4 Kernen, zusammen 58 Minuten Wandzeit (10, 8, 25 und 15 Minuten), jeder unter 30 Minuten. Dazu 20 Sekunden drat-trim und kurze Tests an ⟨2,2,2⟩ (unter 5 Minuten). Nichts läuft weiter

Gelesen vor Beginn: `PROTOKOLL.md` (0.2), `CLAUDE.md`, `versuche/s2-spurB-r1.md`, `versuche/README.md`, `verfahren/README.md`. Hinweis des Orchestrators aus S2-07: Der Grenzrang von ⟨4,2,4⟩ liegt laut Literatur bei höchstens 24, numerische Näherungen mit 25 über ℝ sagen also nichts. Deshalb keine numerischen Läufe.

---

## 1. Werkzeuge

- Kodierer und Dekodierer: `s2-spurB-r2/sat444.py` (eigener Code). Er schreibt eine CNF-Datei und eine Zuordnungsdatei. Der Dekodierer liest die Belegung des Lösers, rechnet alle Brent-Gleichungen unabhängig von der CNF nach und schreibt das Verfahren im Ausgabeformat von `flip.c` (damit passt `s2-spurB-r1/to_json.py`).
- SAT-Löser: kissat (github.com/arminbiere/kissat, Commit 8af8e56f174b778aef3aa45af9f739b2a5f492c2, MIT-Lizenz), nur als externes Programm benutzt, nichts ins Repo kopiert.
- Beweisprüfer: drat-trim (github.com/marijnheule/drat-trim, MIT-Lizenz), ebenso nur extern.
- `s2-spurB-r2/lauf.sh`: startet kissat auf mehreren CNF-Dateien parallel mit harter Zeitgrenze, mit `PROOF=1` auch mit DRAT-Ausgabe.

Kodierung über 𝔽_p (p = 2 oder 3): jeder Koeffizient ein Element von 𝔽_p, dargestellt durch p − 1 Variablen „Wert = c“ (höchstens eine wahr, alle falsch heißt 0). Produkte u·v (für jedes Produkt einmal je Paar von u- und v-Index, über den w-Index geteilt), dann ·w, dann eine Summenkette über alle R Produkte, jeder Schritt ein Gatter mit vollständiger Wahrheitstabelle. Am Ende der Kette wird der Wert der Brent-Gleichung festgesetzt (1 bei i = i′, j = j′, l = l′, sonst 0). Alle 8·8·16 = 1024 Gleichungen werden kodiert, auch solche, die unter der Symmetrie doppelt vorkommen.

Test an ⟨2,2,2⟩ (wörtliche Ergebnisse aus der Sitzung): Rang 7 über 𝔽₂ und 𝔽₃ SAT (Verfahren vom Dekodierer nachgerechnet), Rang 6 über 𝔽₂ UNSAT, Rang 6 über 𝔽₃ mit Ansatz T UNSAT. Das passt zum bekannten Rang 7.

## 2. Der Symmetrieansatz T (A ↔ Bᵀ)

Für n = m gilt C = AB genau dann, wenn Cᵀ = BᵀAᵀ. Daraus folgt: Ist {(u_r, v_r, w_r)} ein Verfahren für ⟨n,2,n⟩, so auch {σ(u_r, v_r, w_r)} mit

  σ(u, v, w) = (vᵀ, uᵀ, wᵀ).

σ ist eine Involution auf den Rang-1-Tensoren. Ein Verfahren heißt T-symmetrisch, wenn σ die Menge seiner Rang-1-Tensoren auf sich abbildet.

Warum die Fallunterscheidung nach f vollständig ist: Ein Verfahren mit 25 Produkten ist minimal, weil 25 die untere Schranke ist (B-007, geprüft). In einem minimalen Verfahren sind alle Rang-1-Tensoren ungleich null und paarweise nicht proportional (sonst ließen sich zwei zusammenlegen). σ zerlegt sie also in f Fixpunkte und (25 − f)/2 Paare, f ungerade, 1 ≤ f ≤ 25.

Form der Fixprodukte: σ(u, v, w) = (λu, μv, νw) mit λμν = 1. Aus vᵀ = λu und uᵀ = μv folgt λμ = 1, also ν = 1, also w = wᵀ und v = λuᵀ mit λ = ±1. Wegen u ⊗ (λuᵀ) ⊗ w = u ⊗ uᵀ ⊗ (λw) darf man λ = 1 annehmen. Kodiert wird also: v = uᵀ, w symmetrisch, u frei. Für Paare: Partner P′ = σ(P) exakt (Skalierung des Partners ist frei wählbar, also keine Einschränkung).

Symmetriebrechung (`--brk`): Die Basisprodukte der Paare sind nach ihrem Koeffizientenvektor (die Bits der Kodierung) streng lexikographisch aufsteigend geordnet. Das ist zulässig, weil man die Paare beliebig umnummerieren darf und zwei Paare in einem minimalen Verfahren nie dasselbe Basisprodukt haben. Andere Brechungen gibt es nicht.

**Was ein UNSAT unter (p, R, T, f) ausschließt:** ein Verfahren mit R Produkten über 𝔽_p (also über jedem Körper der Charakteristik p, dessen Koeffizienten in 𝔽_p liegen), das T-symmetrisch ist und genau f Fixprodukte hat. Es schließt keine Verfahren ohne diese Symmetrie aus und keine über Erweiterungskörpern wie 𝔽₄.

## 3. Ergebnisse über 𝔽₂

### 3.1 Kalibrierung mit Rang 26 (Block 1, 10:44 bis 10:54 UTC, 600 s je Fall)

| f | Ergebnis | Zeit |
|---|---|---|
| 0 | UNSAT | 1 s |
| 2 | UNSAT | 1 s |
| 4 | offen (Zeitgrenze) | 600 s |
| 6 | offen (Zeitgrenze) | 600 s |

Ein T-symmetrisches 26er über 𝔽₂ wurde also nicht gefunden. Die Kalibrierung ist damit nicht gelungen: Es bleibt offen, ob der Löser ein T-symmetrisches Verfahren dieser Größe überhaupt in 10 Minuten findet, falls es eines gibt.

### 3.2 Rang 25 (Block 2, 10:54 bis 11:02 UTC, 120 s je Fall, mit DRAT)

| f | Ergebnis | Zeit | DRAT geprüft (drat-trim) |
|---|---|---|---|
| 1 | UNSAT | 1 s | VERIFIED |
| 3 | UNSAT | 1 s | VERIFIED |
| 5 bis 17 | offen (Zeitgrenze 120 s) | | |
| 19 | UNSAT | 7 s | VERIFIED |
| 21 | UNSAT | 1 s | VERIFIED |
| 23 | UNSAT | 1 s | VERIFIED |
| 25 | UNSAT | 0 s | VERIFIED |

Block 3 (11:00 bis 11:25 UTC, 1500 s je Fall, ohne DRAT, weil die Beweisdateien in 2 Minuten schon 0,7 bis 1,1 GB groß wurden):

| f | Ergebnis |
|---|---|
| 5 | offen (Zeitgrenze 1500 s) |
| 7 | offen (Zeitgrenze 1500 s) |
| 9 | offen (Zeitgrenze 1500 s) |
| 13 | offen (Zeitgrenze 1500 s) |

Wörtliche Ausgaben aller Blöcke: `s2-spurB-r2/daten/sat_bloecke.txt`.

Prüfsummen (SHA-256) der CNF-Dateien und wörtliche Urteile von drat-trim: `s2-spurB-r2/daten/drat_check.txt`. Die CNF-Dateien (je 4 MB) liegen nicht im Repo, `sat444.py` erzeugt sie deterministisch neu (Aufrufe in Abschnitt 8), die Prüfsumme zeigt, ob es dieselbe Datei ist. Die DRAT-Beweise für f = 1, 3 und 25 liegen xz-komprimiert in `s2-spurB-r2/daten/` (je unter 1 MB). Die für f = 19, 21, 23 sind 19 bis 58 MB groß und liegen nicht im Repo. kissat rechnet deterministisch, mit demselben Commit und demselben Aufruf entsteht derselbe Beweis.

### 3.3 Warum kleine f sofort scheitern (behauptet, kurzer Beweis)

Die Brent-Gleichungen, die σ auf sich selbst abbildet, sind die mit l = i, j′ = j, l′ = i′, also die 32 Gleichungen zum Index (i, j, i′). In ihnen liefern die beiden Produkte eines Paars denselben Beitrag, über 𝔽₂ zusammen 0. Es bleiben die Fixprodukte mit v = uᵀ:

  Σ_{Fixprodukte} u[i][j] · w[i′][i′] = [i = i′]   für alle i, j, i′.

Links steht die 8×4-Matrix Σ_f u_f ⊗ d_f (u_f als Vektor der Länge 8, d_f die Diagonale von w_f), rechts eine Matrix vom Rang 4. Also braucht man mindestens 4 Fixprodukte, über 𝔽₂ und bei Rang 25 (f ungerade) also f ≥ 5. Das erklärt die UNSAT-Ergebnisse für f = 1, 3 (Rang 25) und f = 0, 2 (Rang 26) ohne Löser. Über 𝔽₃ gilt das Argument nicht, weil ein Paar dort 2·t beiträgt.

## 4. Gesamtstand des Ansatzes T über 𝔽₂

| f | 1 | 3 | 5 | 7 | 9 | 11 | 13 | 15 | 17 | 19 | 21 | 23 | 25 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Rang 25, 𝔽₂ | UNSAT | UNSAT | offen | offen | offen | offen | offen | offen | offen | UNSAT | UNSAT | UNSAT | UNSAT |

Ausgeschlossen (behauptet, mit DRAT): T-symmetrische 25er über 𝔽₂ mit f ∈ {1, 3, 19, 21, 23, 25}. Damit ist **nicht** gezeigt, dass es kein T-symmetrisches 25er über 𝔽₂ gibt. Die offenen Fälle 5 bis 17 sind genau die mit den meisten Freiheiten. Kein Verfahren gefunden.

Für einen Prüfer: Zu prüfen wäre (a) dass `sat444.py` die Brent-Gleichungen und den Ansatz aus Abschnitt 2 richtig kodiert (Lesen des Codes, Gegenprobe an ⟨2,2,2⟩ und Rang 26, Prüfsumme der CNF), (b) dass drat-trim die Beweise annimmt, (c) dass die Begründung der Vollständigkeit (Minimalität, Form der Fixprodukte, Lex-Ordnung) stimmt. Punkt (c) ist mathematisch und gehört nicht in ein Prüfprogramm.

## 5. 𝔽₃

Kodierung über 𝔽₃ für Rang 25 mit Ansatz T: 105 764 Variablen und 938 631 Klauseln (f = 1), etwa doppelt so groß wie über 𝔽₂. Schon bei ⟨2,2,2⟩ war 𝔽₃ langsam: Rang 7 ohne Symmetrie 38 s, Rang 7 mit T und f = 1 UNSAT nach 230 s (𝔽₂: unter 1 s).

Block 4 (11:26 bis 11:41 UTC): f = 1 und f = 3 je 900 s, beide offen. Das Argument aus 3.3 greift über 𝔽₃ nicht, also gibt es hier keine schnellen Fälle.

Folgerung (vermutet): Mit dieser Kodierung ist 𝔽₃ für ⟨4,2,4⟩ in 30-Minuten-Blöcken nicht zu schaffen. Lücke dieser Runde.

## 6. Flip-Graph von vielen unabhängigen Starts

Probe in Block 4, auf 2 Kernen: 18 voneinander unabhängige Läufe von `s2-spurB-r1/flip.c` über ℤ (Koeffizienten −1, 0, 1), jeder von der Schulmethode (32 Produkte) mit eigenem Samen, 95 s, Plateau 3·10⁵, Slack 3, Drift an (`s2-spurB-r2/flipfam.sh`, Auswertung mit `flipfam_auswerten.py`).

| erreichter bester Rang | Läufe |
|---|---|
| 26 | 1 (Samen 106: 121 verschiedene 26er, 25 Invarianten) |
| 27 | 8 |
| 28 | 9 |
| unter 26 | 0 |

Mit Slack 3 kommt die Wanderung in 95 s seltener auf 26 als in Runde 1 mit Slack 1 (dort 2 von 4 Läufen in 180 s). Für eine Suche über viele unabhängige 26er-Familien braucht man also zweistufige Läufe: erst mit Slack 1 auf 26, dann ab dort mit Slack 3. Das ist nicht gelaufen. Lücke dieser Runde. Protokolle ohne `SCHEME`-Zeilen: `s2-spurB-r2/daten/flip_b4/`.

## 7. Vorschlag für den nächsten Schritt

1. **𝔽₂, Ansatz T, f = 5 bis 17 mit Würfeln (cube and conquer):** Die offenen Fälle in Teilprobleme zerlegen, etwa nach der Form der Fixprodukte. Nach 3.3 muss Σ u_f ⊗ d_f Rang 4 haben, das legt die Diagonalen der w der Fixprodukte stark fest. Man kann die Fixprodukte zusätzlich unter den Basiswechseln, die mit σ verträglich sind, in Normalform bringen (welche das genau sind, ist noch auszurechnen, vermutet). Jeder Würfel mit DRAT. Zuerst die Kalibrierung: ein T-symmetrisches 26er über 𝔽₂ finden (f = 4 oder 6), sonst sagen UNSAT-Ergebnisse wenig über die Kraft der Methode.
2. **Andere Kodierung über 𝔽₃:** etwa mit XOR-artigen Summen in einem Löser mit Modulo-Unterstützung oder über eine Darstellung als zwei 𝔽₂-Bits mit Zählern; die vollständige Wahrheitstabelle pro Gatter ist zu schwer.
3. **Flip-Graph zweistufig** (erst Slack 1 bis 26, dann Slack 3) über viele Samen, wie in Abschnitt 6. Erwartung niedrig.
4. Spur A kann 3.3 als kleines Werkzeug nutzen: Es ist ein Beispiel dafür, wie die festen Gleichungen einer Symmetrie die Zahl der Fixprodukte nach unten beschränken.

## 8. Dateien und Aufrufe

| Datei | Inhalt |
|---|---|
| `s2-spurB-r2/sat444.py` | CNF-Kodierer und Dekodierer mit unabhängiger Nachrechnung |
| `s2-spurB-r2/lauf.sh` | kissat parallel mit Zeitgrenze, optional DRAT |
| `s2-spurB-r2/flipfam.sh` | viele unabhängige `flip.c`-Läufe nacheinander |
| `s2-spurB-r2/flipfam_auswerten.py` | Auswertung dieser Läufe |
| `s2-spurB-r2/daten/sat_bloecke.txt` | Ergebnisse aller SAT-Blöcke |
| `s2-spurB-r2/daten/drat_check.txt` | SHA-256 der CNF-Dateien, Urteil von drat-trim, Größe der Beweise |
| `s2-spurB-r2/daten/f2r25f1.drat.xz`, `f2r25f3.drat.xz`, `f2r25f25.drat.xz` | DRAT-Beweise (Textformat, xz) |
| `s2-spurB-r2/daten/flip_b4/` | Protokolle der 18 Flip-Läufe ohne `SCHEME`-Zeilen, Auswertung |

Nachrechnen eines UNSAT-Falls (aus `versuche/s2-spurB-r2/`, kissat und drat-trim vom oben genannten Stand gebaut):

```
python3 sat444.py encode --p 2 --rank 25 --sym T --fixed 19 --brk --cnf f2r25f19.cnf --map f2r25f19.map
sha256sum f2r25f19.cnf                      # muss zu daten/drat_check.txt passen
kissat -q --no-binary f2r25f19.cnf f2r25f19.drat   # s UNSATISFIABLE
drat-trim f2r25f19.cnf f2r25f19.drat         # s VERIFIED
```

Für die Beweise im Repo: `xz -dk daten/f2r25f1.drat.xz` und dann `drat-trim f2r25f1.cnf daten/f2r25f1.drat`.

Weitere Aufrufe: Kalibrierung `--rank 26 --fixed 0|2|4|6`, 𝔽₃ `--p 3 --rank 25 --fixed 1|3`, alle mit `--sym T --brk`. Flip-Probe: `flipfam.sh FLIP 0 101 9 95 fa --plateau 300000 --slack 3 --drift 1` und dasselbe mit Samen ab 201.

Status aller Aussagen dieses Berichts: **behauptet** (die UNSAT-Ergebnisse mit DRAT-Beweis und das Argument in 3.3) oder **vermutet** (Deutungen). Eine Aussage „es gibt kein Verfahren mit 25“ macht dieser Bericht nicht.
