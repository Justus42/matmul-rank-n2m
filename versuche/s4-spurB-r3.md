# S4-16: Positivprobe bei 35 für ein Suchwerkzeug mit Vorgaben aus dem Restfall (Stufe 4, Runde 3, Spur B)

- Auftrag S4-16, Rolle Verfahrenssucher, im Auftrag des Orchestrators. Bearbeitung 26.11.2026 ab 09:52 UTC (Zeiten der Commits und Rechenblöcke in Abschnitt 7)
- Status aller Aussagen dieser Datei: **behauptet**. Den Status setzt nur der Orchestrator
- Programme und Daten: `versuche/s4-spurB-r3/` (eigener Code, Python 3 mit numpy, kein fremder Code)
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` (0.6, ganz), `STATUS.md` (Kopf), `LOG.md` (Einträge zu Spur B und Ende), `versuche/s4-spurB-r2.md`, Auszüge aus `versuche/s4-spurB-r2/kenngroessen.py` und `lm_normalform.py`, `lean/prosa/s4_327_spurA_r2_bau.md` (Abschnitte 0 und 1), `lean/prosa/yang_n3.md` (Abschnitte 1 bis 7), `verfahren/README.md` (Abschnitte 1 bis 6), `verfahren/3x2x5-r25-hk71.json`, `verfahren/3x2x6-r30-hk71.json`, `verfahren/3x2x7-r35-hk71.json`. Die übrigen Dateien in `versuche/` nur nach Namen
- Keine Subagenten, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Eingeblendet wurden mir der Gedächtnisindex und die Einzeleinträge `hk-verfahren-a10`, `verfahren-randfaelle-s1-04`, `pruefer-python-s1-07`, `pruefer-rust` und `git-regeln` (Datei- und Formathinweise). Für die Arbeit habe ich sie nicht benutzt

---

## 1. Ergebnis in Kürze

1. **Die Positivprobe bei 35 ist nicht bestanden.** Das Werkzeug hat kein exakt nachgerechnetes Verfahren mit 35 für ⟨3,2,7⟩ gefunden. Nach Punkt 2 des Auftrags endet der Auftrag damit. **Bei 34 wurde nicht gesucht.**
2. **Woran es lag:** Die Gleitkomma-Suche selbst funktioniert. Mit den Vorgaben (SN1) und (K1) findet sie über ℝ ohne Kenntnis einer Lösung Zerlegungen der Länge 35 mit Restnorm etwa 4·10⁻¹⁵ und Koeffizienten unter 2,5 (4 Funde aus 6 Saaten, der schnellste nach 9 Sekunden, Abschnitt 4). Es scheitert der zweite Schritt, das exakte Runden: Aus keinem der vier Funde bei 35 und keinem der zwei Funde bei 25 ließ sich ein Verfahren mit rationalen Koeffizienten gewinnen. Jeder Rundungsversuch endet an einem isolierten Punkt mit irrationalen Koordinaten (Abschnitt 5). Ohne exakte Nachrechnung gilt die Probe nach Auftrag nicht als bestanden.
3. **Zulässigkeit der Vorgaben (exakt über ℚ, Abschnitt 3):** Die Normalform (SN1) mit Skalierung α_r(e₀₀) = 1 zusammen mit (K1) aus Satz K ist für das bekannte Verfahren `3x2x7-r35-hk71` über ℚ zulässig: Ein Basiswechsel (S, T) und ein Spaltenwechsel P über ℚ bringen es in diese Form, exakt nachgerechnet (0 verletzte Gleichungen, (SN1) und (K1) erfüllt). Ebenso für `3x2x5-r25-hk71`. Für `3x2x6-r30-hk71` ist (K1) **nicht** zulässig, weil dort dim N = 0 ist. Die Eichung an 3×2×6 entfällt deshalb. (K2) ist für die bekannten 35er-Verfahren nicht erfüllt und war deshalb nicht Teil der Probe.
4. Kein Fund, kein Verfahren unter `verfahren/`. Die exakten Normalformen der bekannten Verfahren liegen nur als Belege unter `versuche/s4-spurB-r3/daten/`. Sie sind keine neuen Verfahren.

---

## 2. Das Werkzeug und seine Vorgaben

Kodierung, für jedes Format und jede Länge gleich (Bezeichnungen wie in `verfahren/README.md`): Produkt r hat u_r (3×2), v_r (2×m), w_r (3×m). Spalten von B und C zählen ab 0, Spalte m−1 entspricht e₇ aus Satz K, m−2 entspricht e₆, m−3 entspricht e₅.

Vorgaben (Schalter):

- **(SN1)** u_r[0][0] = 1 für alle r. Das ist (SN1) aus `lean/prosa/yang_n3.md` Abschnitt 5 nach der Skalierung α_r ↦ α_r/α_r(e₀₀).
- **(K1)** v_r[1][m−2] = κ_r·u_r[1][0] und v_r[1][m−3] = κ_r·u_r[2][0] mit κ_r := v_r[1][m−1]. Das ist (K1) aus Satz K in `versuche/s4-spurB-r2.md` Abschnitt 3.1.
- **(K2)** im Programm vorhanden (`lmsearch.py --k2`), für die Probe nicht benutzt, siehe 3.3.

Bei 34 hätte ich genau dieselbe Kodierung mit denselben Vorgaben (SN1) und (K1) benutzt, wahlweise ergänzt um (K2).

Ablauf:

1. **Suche** (`search.py`, `varpro.py`): zufälliger Start aus einer festen Saat, keine Kenntnis einer Lösung. Die w_r werden als lineare Ausgleichsrechnung eliminiert (variable Projektion nach Golub und Pereyra mit der Jacobi-Näherung von Kaufman). Levenberg-Marquardt läuft auf den freien Einträgen von u und v. Ein Ridge-Term auf w und ein Tichonow-Term auf u, v werden während jedes Versuchs auf 0 abgesenkt, damit die Suche nicht in entartete Näherungen mit wachsenden Koeffizienten läuft. Danach Nachpolieren mit dem vollen Levenberg-Marquardt (`lmsearch.py`, dieselben Vorgaben). Ein Kandidat gilt als gefunden bei Restnorm < 10⁻¹¹.
2. **Exaktes Runden** (`rounding.py`): u und v werden schrittweise auf Brüche festgelegt, w wird am Ende **exakt über ℚ** als Lösung eines linearen Gleichungssystems berechnet (für feste u, v sind die Brent-Gleichungen linear in w).
3. **Exakte Prüfung** (`exact.py`): alle 1764 Brent-Gleichungen mit `fractions.Fraction`, dazu (SN1), (K1), (K2). Keine Gleitkommazahl in diesem Schritt.

Die Schritte 1 und 2 sind Heuristiken mit Gleitkommazahlen. Gilt eine Aussage nur für Gleitkomma-Funde, sage ich das.

---

## 3. Zulässigkeit der Vorgaben für die bekannten Verfahren (exakt)

Programm `nf_check.py`: zufälliger ganzzahliger Basiswechsel (S, T) mit Einträgen in [−40, 40] nach R3 aus `yang_n3.md`, Prüfung von (SN1), Skalierung, Berechnung von N = {x : ΛMx ∈ im M und μMx ∈ im M} mit M[r][l] = v_r[1][l], Λ = diag(u_r[1][0]), μ = diag(u_r[2][0]). Ist x₀ ∈ N und sind x₀, y₁, y₂ (mit ΛMx₀ = My₁, μMx₀ = My₂) linear unabhängig, dann bringt der Spaltenwechsel Q = [·, y₂, y₁, x₀] (v ↦ vQ, w ↦ wQ⁻ᵀ) die Zerlegung in die Form (K1). Alles exakt über ℚ, danach exakte Nachrechnung.

| Verfahren | dim N | Ergebnis | Beleg |
|---|---|---|---|
| `3x2x7-r35-hk71` | 1 | 0 verletzte Gleichungen, (SN1) ja, (K1) ja, (K2) nein | `daten/nf_check_hk35.txt`, `daten/3x2x7-r35-nf-hk71.json` |
| `3x2x5-r25-hk71` | 1 | 0 verletzte Gleichungen, (SN1) ja, (K1) ja, (K2) nein | `daten/nf_check_hk25.txt`, `daten/3x2x5-r25-nf-hk71.json` |
| `3x2x6-r30-hk71` | 0 | (K1) nicht herstellbar (fünf Basiswechsel, jeweils dim N = 0) | `daten/nf_check_hk30.txt` |

Die beiden Dateien `daten/3x2x*-nf-hk71.json` sind exakte Basiswechsel der bekannten Verfahren im Datenformat des Repos (ring Q). Das Python-Prüfprogramm aus `pruefer/python/` nimmt beide an. Das ist nur eine Probe des Formats, keine Prüfung nach 5.2, und sie sind keine neuen Verfahren.

**3.1 Zahlbereich.** Die Vorgabe ist über ℚ für das bekannte 35er-Verfahren zulässig, also ist ℝ (der Zahlbereich der Suche) ein Körper, über dem die Vorgabe für das bekannte Verfahren zulässig ist. Über GF(2) und GF(3) ist sie es nach S4-08 nicht.

**3.2 Kleine Basiswechsel.** Mit S = [[1,1,−1],[1,1,1],[1,−2,0]] und T = [[2,−1],[0,2]] hat die Normalform von `3x2x7-r35-hk71` Einträge der Höhe höchstens 5 (u), 9 (v), 12 (w), Nenner nur 1 bis 6 (`nf_klein.py`, `daten/nf_klein_hk35.txt`). Es gibt also in dieser Normalform 35er-Verfahren mit kleinen Brüchen. Das Runden in Abschnitt 5 hätte grundsätzlich ein Ziel.

**3.3 (K2) bei 35.** (K2) folgt in Satz K aus dim N = 3. Die bekannten 35er-Verfahren haben dim N = 1 und erfüllen (K2) nicht. Eine Probe bei 35 mit (K2) hätte also nach einer Klasse gesucht, die das bekannte Verfahren nicht enthält. Deshalb lief die Probe mit (SN1) und (K1). Bei 34 wäre (K2) eine zusätzliche Vorgabe gewesen, die die Probe nicht abdeckt. Ich hätte bei 34 deshalb zuerst ohne (K2) gesucht.

---

## 4. Gleitkomma-Suche: funktioniert

**Eichung an 3×2×5 mit 25 (Kurzläufe, Abschnitt 7):** Mit (SN1) und (K1) fand `search.py` in 100 Sekunden auf 4 Kernen 2 Kandidaten aus 4 Saaten (Restnorm 3·10⁻¹⁵, Koeffizienten unter 1,9). Ohne Ridge-Term (erste Fassung) liefen alle Versuche in entartete Näherungen mit Koeffizienten bis 10¹¹. Plain Levenberg-Marquardt ohne Elimination von w (`lmsearch.py` allein) blieb in 14 Versuchen bei Restnorm 1,000 hängen, wie bei S4-08.

**Bei 35 mit (SN1) und (K1)** (Rechenblöcke 1 und 2):

| Saat | Ergebnis | Zeit bis zum Fund | Datei |
|---|---|---|---|
| 11 | Fund, Restnorm 4,0·10⁻¹⁵, max. Koeffizient 1,75 | 300 s (5. Versuch) | `daten/kand35_s11.json` |
| 12 | kein Fund, Block vorzeitig beendet nach 4 Versuchen | – | `daten/block1_s12.log` |
| 13 | kein Fund, Block vorzeitig beendet nach 6 Versuchen | – | `daten/block1_s13.log` |
| 14 | Fund, Restnorm 4,2·10⁻¹⁵, max. 2,48 | 215 s (4. Versuch) | `daten/kand35_s14.json` |
| 21 | Fund, Restnorm 5,8·10⁻¹⁵, max. 2,00 | 9 s (1. Versuch) | `daten/kand35_s21.json` |
| 22 | Fund, Restnorm 4,2·10⁻¹⁵, max. 1,48 | 236 s (5. Versuch) | `daten/kand35_s22.json` |

Diese Funde sind **Gleitkommazahlen** und damit keine Verfahren im Sinn des Auftrags. Sie zeigen nur, dass der Suchteil das Ziel bei 35 trifft, im Unterschied zu S4-08 (SAT über GF(2) und Levenberg-Marquardt ohne Elimination fanden dort bei 35 nichts).

Struktur der Funde bei 35 (gemessen mit Rangschwelle 10⁻⁷, Gleitkomma): 28 der 35 α_r haben Rang 1, 26 der β_r haben Rang 1. Die 28 Rang-1-Formen α_r = a_r b_rᵀ verteilen sich auf 7 verschiedene b-Punkte. Die lokale Dimension der Lösungsmenge (Kern der Jacobi-Matrix aller Parameter einschließlich w) ist 93 bei 35 und 55 bei 25.

---

## 5. Exaktes Runden: gescheitert

### 5.1 Was versucht wurde

Alle Fassungen stehen in `rounding.py` (nur die letzte ist aktiv; die Reihenfolge war):

1. **Gierig auf einfache Werte:** freien Parameter mit kleinstem Abstand zu {0, ±1, ±2, ±1/2, …} festlegen, nachlösen, bei Erfolg behalten. An 3×2×5: festgefahren nach etwa 125 bis 180 Festlegungen, 98 bis 200 Parameter bleiben frei und lassen sich nicht auf einfache Werte legen.
2. **Phasen (erst 0, dann ±1, dann weitere) und erst u, dann v:** schlechter, festgefahren mit 136 bis 163 freien Parametern.
3. **Rationale Rekonstruktion am Ende** (Kettenbrüche mit Nennern bis 10⁶): Die Restwerte lassen sich nur mit Nennern um 10⁶ auf 10⁻¹¹ annähern, das ist das Verhalten irrationaler Zahlen. Die exakte Lösung für w ist dann jedesmal unlösbar („inconsistent“).
4. **Eichnormierung der Rang-1-Struktur:** Die b-Punkte (u_r[0][1] der Rang-1-Formen) werden durch Fortsetzung in kleinen Schritten auf einfache Brüche gelegt (zwei durch eine affine Eichung auf 0 und 1, die übrigen auf Brüche mit kleinem Nenner). Das gelingt immer, die b-Punkte sind also freie Moduln. Drei a-Punkte (u_r[1][0], u_r[2][0]) werden auf ganzzahlige Punkte nahe ihrer Lage gelegt (affine Eichung). Das gelingt nach einer Korrektur ebenfalls (eine direkte Fortsetzung auf (0,0), (1,0), (0,1) lief durch eine entartete Lage). Danach Festlegen in einer Leiter wachsender Nenner (1, 2, 4, 12, 50, 200, 1000) mit Fortsetzung. Ergebnis: festgefahren, rationale Rekonstruktion scheitert.

### 5.2 Ergebnis der Rundung

| Kandidat | Versuche | Ergebnis |
|---|---|---|
| 3×2×5, zwei Kandidaten | viele Durchläufe in den Kurzläufen (Abschnitt 7) | kein exaktes Verfahren |
| 3×2×7, `kand35_s11` | 31 Durchläufe in Block 2 | kein exaktes Verfahren, festgefahren mit 327 bis 333 freien Parametern |
| 3×2×7, `kand35_s14` | 13 Durchläufe | kein exaktes Verfahren, festgefahren mit 80 bis 358 freien Parametern |
| 3×2×7, `kand35_s21` | 6 Durchläufe | kein exaktes Verfahren |
| 3×2×7, `kand35_s22` | 5 Durchläufe | kein exaktes Verfahren |

Protokolle: `daten/block2_round_s11.log`, `…_s14.log`, `…_s21.log`, `…_s22.log`.

### 5.3 Deutung (behauptet, aus Gleitkomma-Messungen)

- Die Funde liegen auf Lösungsmengen positiver Dimension (55 bei 25, 93 bei 35). Davon ist ein Teil die Eichgruppe, die (SN1) und (K1) erhält: Skalierung β_r ↔ w_r (R Dimensionen), Spaltenwechsel auf den Spalten 0 bis m−4 (m(m−3) + 1) und (S, T) (12). Das ergibt grob 47 bei 25 und 76 bei 35. Der Rest sind echte Moduln, bei 25 etwa 8, bei 35 etwa 17.
- Legt man Koordinaten auf rationale Werte, landet man nach etwa so vielen Festlegungen, wie die Dimension angibt, auf einem isolierten Punkt. Dessen übrige Koordinaten sind algebraische Zahlen und in allen Versuchen nicht rational. In einem Diagnoselauf an 3×2×5 (`diag_u.py`, Kandidat aus Block 0b, nicht im Repo) waren danach fast alle Einträge von u rational mit Nennern bis 413 (Fehler 10⁻¹⁶), nur die Einträge zweier Produkte nicht (Fehler 10⁻⁶ gegen jeden Bruch mit Nenner bis 1000). Das passt zu einer quadratischen Bedingung zwischen den Moduln, bei der eine rationale Wahl der einen Koordinate eine irrationale der anderen erzwingt.
- Die Normalform selbst verhindert rationale Lösungen nicht (Abschnitt 3.2). Es fehlt eine Rundung, die die Moduln so wählt, dass der Endpunkt rational ist.

---

## 6. Für `versuche/` und eine spätere Runde (nur Hinweise)

Gescheitert, mit Grund:

1. **Levenberg-Marquardt ohne Elimination von w** (wie S4-08): hängt bei Restnorm 1 fest, auch mit (SN1) und (K1).
2. **Variable Projektion ohne Ridge auf w:** läuft in entartete Näherungen (Koeffizienten von w bis 10¹¹). Das ist das bekannte Grenzrang-Verhalten.
3. **Exaktes Runden durch Festlegen einzelner Koordinaten** in der Normalform (SN1)+(K1): landet auf irrationalen Punkten, Gründe in 5.3.

Was als Nächstes helfen könnte (vermutet, nicht versucht):

- Die Rang-1-Struktur ausnutzen und die Zerlegung als a_r ⊗ b_r, c_r ⊗ d_r parametrisieren. Dann sind die Moduln Punktlagen in P¹ und P², und man kann gezielt rationale Lagen wählen, die die Inzidenzen erhalten (Geraden durch rationale Punkte, Schnittpunkte), statt einzelne Koordinaten festzulegen.
- Erst ohne Vorgaben in einer dünnen Lage runden (bekannte Methode für ⟨n,m,p⟩-Zerlegungen) und die exakte Normalform danach mit `nf_check.py` herstellen. Dann sind die Vorgaben bei der Suche aber nur Filter, nicht Teil der Kodierung. Ob das für Punkt 1 des Auftrags reicht, müsste der Orchestrator entscheiden.
- Hochgenaues Nachrechnen (mpmath) und Minimalpolynome der Restkoordinaten (PSLQ), um die quadratische Bedingung aus 5.3 sichtbar zu machen.

Der Suchteil (`search.py` mit `varpro.py`) ist ein brauchbarer Baustein. Er findet bei 35 mit (SN1) und (K1) in Minuten Gleitkomma-Lösungen.

---

## 7. Zeiten und Verbrauch

Commits auf dem Zweig `claude/project-thread-hc677g` (Zeiten UTC aus Git):

| Commit | Zeit | Inhalt |
|---|---|---|
| fddb109 | 10:05:16 | Werkzeuge, Entwurf |
| 822631d | 10:22:26 | variable Projektion mit Ridge, Runden |
| 3602b88 | 10:30:01 | Block 1 |
| 026d6a3 | 10:50:53 | Runden mit Eichnormierung, Startskript Block 2 |
| b0b4a94 | 11:10:23 | Block 2, Normalformen |

Rechenblöcke (Anfang und Ende aus Shell-Zeitstempeln, UTC; zwischen je zwei Blöcken liegt ein Commit; alle unter 30 Minuten, höchstens 4 Kerne):

| Block | Anfang bis Ende | Inhalt |
|---|---|---|
| 0a | 09:55:27 bis 10:04:20 | Kurzläufe zur Eichung an 3×2×5: Levenberg-Marquardt 180 s (1 Kern), variable Projektion 100 s (1 Kern), Suche mit Polieren 4 × 150 s |
| 0b | 10:05:16 bis vor 10:22:26 | Suche an 3×2×5 4 × 100 s (2 Kandidaten), Rundungsversuche (je höchstens 300 s auf 2 bis 4 Kernen), Dünnbesetzungsversuch |
| 1 | 10:22:30 bis 10:29:35 | Suche bei 35 mit (SN1)+(K1), 4 Saaten parallel, je 1 Kern. Saaten 11 und 14 mit Fund beendet, 12 und 13 von mir vorzeitig abgebrochen. Protokoll `daten/block1.log` |
| 1b | 10:30:26 bis 10:50:34 | Weiterentwicklung des Rundens an 3×2×5 (Kurzläufe bis 280 s, 2 bis 4 Kerne) und Diagnoseläufe |
| 2 | 10:50:59 bis 11:09:53 | Runden der Kandidaten s11 und s14 (je 1120 s), dazu zwei Läufe Suche plus Runden (Saaten 21 und 22). Startskript `block2.sh`, Protokoll `daten/block2.log` |

Danach nur exakte Normalform-Rechnungen von wenigen Sekunden vor dem Commit b0b4a94. Nichts läuft im Hintergrund weiter.

Subagenten: 0. Fremdmodell-Anfragen: 0.
