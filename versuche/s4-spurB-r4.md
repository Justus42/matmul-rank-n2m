# S4-22: Positivprobe bei 35 mit exaktem Ergebnis, danach Suche bei 34 für ⟨3,2,7⟩ (Stufe 4, Runde 4, Spur B)

- Auftrag S4-22, Rolle Verfahrenssucher, im Auftrag des Orchestrators. Bearbeitung 26.11.2026 ab 11:23 UTC (Zeiten der Commits und Rechenblöcke in Abschnitt 8)
- Status aller Aussagen dieser Datei: **behauptet**. Den Status setzt nur der Orchestrator. Die Prüfung nach 5.2 habe ich nicht gemacht
- Programme und Daten: `versuche/s4-spurB-r4/` (eigener Code: C und Python 3; dazu eigene Projektprogramme aus `versuche/s4-spurB-r3/` (S4-16) und `versuche/s4-spurB-r2/` (S4-08) als Bibliotheken, unverändert; kein fremder Code)
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md` (0.6, ganz), `STATUS.md` (Kopf), `LOG.md` (Einträge zu Spur B), `versuche/s4-spurB-r3.md` mit den Programmen in `versuche/s4-spurB-r3/` (Auszüge), `versuche/s4-spurB-r2.md` mit Auszügen aus `kenngroessen.py`, `verfahren/README.md` (Abschnitte 1 bis 3), `verfahren/3x2x7-r35-hk71.json` (nur Kopf). `lean/prosa/s4_327_spurA_r2_bau.md` habe ich nicht gelesen, weil der Weg dieses Auftrags die Bauanleitung nicht braucht
- Keine Subagenten, keine Fremdmodell-Anfrage, kein Kontakt nach außen, nichts ins Projektgedächtnis geschrieben. Eingeblendet wurden mir der Gedächtnisindex und die Einzeleinträge `pruefer-abgleich-s1-20`, `pruefer-rust`, `pruefer-python-s1-07`, `hk-verfahren-a10`, `verfahren-randfaelle-s1-04` (Datei- und Formathinweise). Für die Arbeit habe ich sie nicht benutzt

---

## 1. Ergebnis in Kürze

1. **Die Positivprobe bei 35 ist bestanden** (behauptet). Das Werkzeug hat ohne Kenntnis einer Lösung, vom Standardverfahren mit 42 Produkten aus, ein Verfahren mit 35 Produkten für ⟨3,2,7⟩ über ℚ geliefert: `versuche/s4-spurB-r4/daten/3x2x7-r35-s422a.json`. Es ist exakt nachgerechnet (alle 1764 Brent-Gleichungen mit `fractions.Fraction`, 0 verletzt) und erfüllt die Annahmebedingung: Die Normalform (SN1)+(K1) lässt sich exakt über ℚ herstellen (0 verletzte Gleichungen nach der Umformung, (SN1) und (K1) erfüllt). Das Python-Prüfprogramm aus `pruefer/python/` nimmt die Datei an. Das ist nur eine Probe des Formats, keine Prüfung nach 5.2. Das Verfahren ist kein neuer Wert.
2. **Suche bei 34:** **kein Fund.** Ein Rechenblock von 23 Minuten auf 4 Kernen (Flip-Graph über GF(2), 4 Saaten, zusammen etwa 2,9·10⁹ Schritte) erreichte die Länge 34 nicht; ein Lauf kam bis 35, drei blieben bei 36 und 37. **Kein Teil des Suchraums ist vollständig abgesucht.** Der Flip-Graph ist eine Zufallssuche, das Ausbleiben eines Funds ist kein Indiz gegen ein Verfahren mit 34, über keinem Körper (Abschnitt 6).
3. **Was die Vorgaben hier bedeuten (ausdrücklich, wie vom Orchestrator verlangt):** Die Vorgaben (SN1)+(K1) und die Kenngrößen des Restfalls gehen **nicht** in die Kodierung der Suche ein. Sie dienen nur als **nachträgliche Annahmebedingung**, die bei 35 und bei 34 gleich angewandt wird, und **verkleinern den Suchraum nicht**. Die Kenngrößen werden bei jedem Fund exakt gemessen.
4. Nebenbefund (behauptet): Das gefundene 35er-Verfahren hat andere Kenngrößen als die beiden bekannten 35er-Verfahren aus S4-08: (ρ, rk L, rk H) = (5, 7, 5), dim N = 2, dim S = 0 statt (6, 7, 6), dim N = 1, dim S = 0. Abschnitt 5.

---

## 2. Wahl des Wegs (vor dem Rechnen festgelegt und dem Orchestrator um 11:27 UTC gemeldet, von ihm um 11:28 UTC gebilligt)

Die Schwäche von S4-16 war der zweite Schritt: Gleitkomma-Funde lagen auf Lösungsmengen positiver Dimension, und das Festlegen einzelner Koordinaten endete an Punkten mit irrationalen Koordinaten. Ich habe deshalb einen Weg gewählt, auf dem jeder Schritt exakt ist und kein Runden vorkommt:

- **Suche:** Flip-Graph nach Kauers und Moosbauer (Idee aus arXiv:2212.01175, kein Code übernommen), eigener C-Code `flip.c`. Start beim Standardverfahren mit n·k·m = 42 Produkten. Züge: Flip zweier Produkte mit gemeinsamem Faktor, danach alle Reduktionen (Produkt mit Nullfaktor fällt weg, zwei Produkte mit zwei gleichen Faktoren werden zusammengelegt), bei Stillstand ein Plus-Übergang (Länge + 1). Arithmetik exakt modulo p oder über ℤ mit Koeffizientenschranke. Jedes ausgegebene Verfahren rechnet das Programm selbst exakt gegen den Tensor nach.
- **Hebung:** Ein Fund über GF(2) wird mit Hensel-Hebung modulo 2^K gehoben und durch rationale Rekonstruktion nach ℚ gebracht (`hensel.py`, nur ganze Zahlen und Brüche). Das Ergebnis wird exakt über ℚ nachgerechnet.
- **Annahmebedingung** (`annahme.py`, gleich bei 35 und 34): exakte Nachrechnung über ℚ; Normalform (SN1)+(K1) über ℚ herstellbar (Programm `nf_check.normal_form` von S4-16) und nach der Umformung erneut exakt nachgerechnet; Kenngrößen exakt über GF(2³¹ − 1) gemessen (Programm `kenngroessen.measure` von S4-08). Bei 34 wäre ein Fund zusätzlich mit den Kenngrößen des Restfalls (4, 6, 4), dim N = 3, dim S = 1 verglichen worden; abweichende Werte hätten einen Fehler in Werkzeug oder Restfall-Rechnung angezeigt.
- **Warum über GF(2) suchen und nicht über GF(p), p ≥ 5, oder ℤ:** Abschnitt 4. Kurz: Über größeren Körpern und über ℤ kommt der Flip-Graph kaum voran. Die Normalform wird nicht über GF(2) verlangt, sondern erst nach der Hebung über ℚ geprüft. Damit entfällt auch das Problem aus S4-08 (Normalform über GF(2) nicht zulässig).

---

## 3. Eichung an 3×2×5 (Block 0)

- Strassen ⟨2,2,2⟩ mit 7: über GF(2), GF(5) und ℤ (Schranke 1) jeweils in unter einer Sekunde gefunden.
- ⟨3,2,5⟩ mit 25 über GF(2): nach dem Beschleunigen des Programms (Partnerwahl in O(R) statt O(R²)) in 7 und 20 Sekunden aus 2 von 4 Saaten. Der Fund aus Saat 3 lässt sich schon mit Vorzeichen allein nach ℤ heben (`lift.py`, Versuch 0): `daten/3x2x5-r25-s422e.json`, ring Z, vom Python-Prüfprogramm angenommen (nur Formatprobe). Kenngrößen: (ρ, rk L, rk H) = (5, 5, 5), dim N = 0, dim S = 0. Wegen dim N = 0 ist (K1) für diesen Fund **nicht** herstellbar; er besteht die Annahmebedingung also nicht. Das zeigt, dass die Annahmebedingung wirklich etwas aussiebt.

---

## 4. Positivprobe bei 35 (Blöcke 1 und 2)

### 4.1 Über welchem Zahlbereich suchen

Kurzläufe an ⟨3,2,5⟩ (je 30 bis 60 s, ein Kern, Ziel 25, Start 30):

| Zahlbereich | bestes Ergebnis |
|---|---|
| GF(2) | 25 (nach Beschleunigung), vorher 26 |
| GF(3) | 28 |
| GF(5) | 30 (keine einzige Reduktion) |
| ℤ, Koeffizienten ≤ 1 | 26 (nach Beschleunigung), vorher 30 |
| ℤ, Koeffizienten ≤ 2 oder 3 | 30 |

Grund (vermutet): Über großen Körpern und über ℤ entstehen nach einem Flip fast nie wieder zwei gleiche Faktoren, die Reduktionen bleiben aus. Über GF(2) gibt es nur 2⁶ − 1 = 63 Faktoren auf der A-Seite, gleiche Faktoren entstehen ständig.

### 4.2 Block 1: Flip-Graph über GF(2), Ziel 35

Vier Läufe, je ein Kern, Saaten 11 bis 14, Schritt-Grenze L = 50 000, Plus-Übergänge bis Länge 37. Saat 11 erreichte 35 nach 146 s (6,8·10⁷ Schritte) und gab danach 50 benachbarte Verfahren mit 35 aus (`daten/block1_s11.txt`). Die Saaten 12 bis 14 standen bei Abbruch des Blocks auf 36. Ich habe den Block nach knapp 5 Minuten beendet, weil die Funde für die Probe reichten.

Zuerst versuchte Hebung nur mit Vorzeichen (`lift.py`): Für alle 17 geprüften der 50 Funde ist das System modulo 4 bei gleichem Träger unlösbar, auch mit erlaubten Einträgen ±2 fand sich in je 40 bis 300 Versuchen keine Hebung nach ℤ. Daraus folgt nur, dass diese Funde keine Hebung mit Koeffizienten in {−1, 0, 1} auf demselben Träger haben.

### 4.3 Block 2: Flip-Graph direkt über ℤ (abgebrochen)

Als Ausweg startete ich vier Läufe über ℤ (Schranke 1: Saaten 21, 22; Schranke 2: Saaten 23, 24). Nach gut 5 Minuten standen sie bei 39, 39, 41, 41. Währenddessen gelang die Hensel-Hebung (4.4), ich habe Block 2 deshalb abgebrochen. Diese Läufe sind für das Ergebnis ohne Bedeutung.

### 4.4 Hensel-Hebung und Annahme: bestanden

`hensel.py` auf Verfahren 0 aus `daten/block1_s11.txt`, K = 40: Jede Stufe modulo 2 lösbar, rationale Rekonstruktion für alle 1435 Koeffizienten erfolgreich, exakte Nachrechnung über ℚ: 0 verletzte Gleichungen. Höhe der Brüche höchstens 12, Nenner nur mit Primteilern 3 und 5, 650 von 1435 Koeffizienten ungleich 0. Laufzeit 11 s.

Annahme (`annahme.py`, Ausgabe in `daten/annahme_probe35.txt`):

- exakte Nachrechnung über ℚ: 0 verletzte Gleichungen
- (SN1)+(K1) über ℚ: im ersten Versuch hergestellt, nach der Umformung 0 verletzte Gleichungen, (SN1) und (K1) erfüllt
- Kenngrößen (6 Ziehungen, alle gleich): q = 7, ρ = 5, rk F₁ = rk F₂ = 5, rk L = 7, rk H = 5, s = 0, dim N = 2, Δ = 3, dim S = 0

**Zahlbereich des Probeverfahrens:** ℚ. Weil nur die Nenner 3 und 5 vorkommen, gilt es auch über jedem Körper, dessen Charakteristik nicht 3 oder 5 ist (die Nenner sind dort invertierbar und die Gleichungen bleiben richtig); über GF(2) ist es das Ausgangsverfahren selbst. Das ist eine Folgerung, keine eigene Rechnung über diesen Körpern.

---

## 5. Kenngrößen: Vergleich

| Verfahren | R | ρ | rk L | rk H | dim N | dim S | (K1) über ℚ |
|---|---|---|---|---|---|---|---|
| `3x2x7-r35-hk71` (S4-08) | 35 | 6 | 7 | 6 | 1 | 0 | ja (S4-16) |
| `daten/3x2x7-r35-s422a.json` (dieser Auftrag) | 35 | 5 | 7 | 5 | 2 | 0 | ja |
| Restfall der Länge 34 (B-017) | 34 | 4 | 6 | 4 | 3 | 1 | erzwungen |

Das neue 35er-Verfahren liegt in den Kenngrößen zwischen den bekannten 35ern und dem Restfall (dim N = 2 statt 1). Ob das etwas über 34 sagt, weiß ich nicht. Die Messung ist exakt über GF(2³¹ − 1) nach zufälligem Basiswechsel, also mit der Einschränkung aus S4-08 (generische Wahl ersetzt durch Zufall).

---

## 6. Suche bei 34 (Block 3)

Dasselbe Werkzeug wie bei der Probe: `flip.c` über GF(2), Start beim Standardverfahren (42), Ziel 34, Plus-Übergänge bis Länge 36, L = 50 000, Saaten 31 bis 34, je ein Kern, 1380 s. Ein Fund wäre mit `hensel.py` gehoben und mit `annahme.py` geprüft worden, mit Vergleich der Kenngrößen gegen den Restfall.

| Saat | Schritte | beste Länge | erreicht nach |
|---|---|---|---|
| 31 | 6,9·10⁸ | 36 | 54 s |
| 32 | 7,3·10⁸ | 36 | 37 s |
| 33 | 7,2·10⁸ | 37 | 14 s |
| 34 | 7,3·10⁸ | 35 | 500 s |

Protokolle: `daten/block3.log`, `daten/block3_s31.log` bis `…_s34.log`. Kein Verfahren mit 34, deshalb keine Datei unter `verfahren/`.

**Was abgesucht ist und was nicht:**

- **Vollständig abgesucht: nichts.** Weder über GF(2) noch über einem anderen Körper ist irgendein Teil des Raums der Zerlegungen der Länge 34 vollständig durchsucht. Es gibt kein UNSAT und kein Zertifikat.
- **Stichprobe:** die Zufallswege des Flip-Graphen über GF(2) ab dem Standardverfahren in vier Läufen. Nur ein Lauf hat überhaupt die Höhe 35 erreicht, und das erst nach 500 s; die Zeit danach (etwa 15 Minuten auf einem Kern) ist der einzige Teil, in dem ein Schritt zu 34 überhaupt möglich war.
- **Nicht abgedeckt:** Verfahren, die nur über anderen Körpern als GF(2) existieren oder sich nicht über GF(2) reduzieren lassen (etwa mit Nenner 2), und Verfahren über GF(2), die im Flip-Graph nicht von den besuchten 35ern aus erreichbar sind. Die Kenngrößen des Restfalls haben den Suchraum **nicht** verkleinert, sie wären nur nachträglich verglichen worden.
- Zur Einordnung: Das Werkzeug erreichte 35 in Block 1 in 1 von 4 Läufen nach 146 s, in Block 3 in 1 von 4 Läufen nach 500 s. Selbst die Probenhöhe wird also nur in einem Teil der Läufe erreicht. Für 34 wäre eine Suche nötig, die von vielen verschiedenen 35ern aus startet (Startdatei statt Standardverfahren) und viel länger läuft. Das ist eine Frage des Rechenbudgets, nicht dieses Auftrags.


---

## 7. Für `versuche/` (gescheitert, mit Grund)

1. **Flip-Graph über GF(p), p ≥ 3, und über ℤ mit Schranke ≥ 2:** keine oder kaum Reduktionen (4.1).
2. **Hebung von GF(2) nach ℤ nur mit Vorzeichen:** für die Funde bei 35 unmöglich (System modulo 4 unlösbar).
3. Die volle Hensel-Hebung mit rationaler Rekonstruktion funktionierte dagegen beim ersten Versuch.

---

## 8. Zeiten und Verbrauch

Commits auf dem Zweig `claude/project-thread-dylbd4` (Zeiten UTC aus Git):

| Commit | Zeit | Inhalt |
|---|---|---|
| 919d602 | 11:36:50 | Werkzeug, Vorzeichenhebung, Eichung an 3×2×5 |
| 352e3db | 11:41:54 | Block 1, Hebung mit ±2 |
| 1133a16 | 11:47:47 | Hensel-Hebung, Annahmebedingung, Positivprobe bestanden |
| (Bericht-Commit, Hash und Zeit im PR) | nach 12:11 | Block 3, Bericht |

Rechenblöcke (Anfang und Ende aus Shell-Zeitstempeln, UTC; zwischen je zwei Blöcken liegt ein Commit; alle unter 30 Minuten):

| Block | Anfang bis Ende | Inhalt |
|---|---|---|
| 0 | 11:29:24 bis 11:36:01 | Kurzläufe: Strassen, ⟨3,2,5⟩ über GF(2), GF(3), GF(5), ℤ (je 20 bis 60 s, bis 4 Kerne), Vorzeichenhebung |
| 1 | 11:37:00 bis 11:41:47 | Flip-Graph über GF(2) bei 35, 4 Kerne, vorzeitig beendet; darin Hebungsversuche und ein Kurzlauf an ⟨3,2,5⟩ über GF(3) und ℤ auf dem freien Kern |
| 2 | 11:42:01 bis 11:47:31 | Flip-Graph über ℤ bei 35, 4 Kerne, vorzeitig beendet; darin Hensel-Hebung (11 s) und Annahme (1 s). Während der 11 s der Hebung liefen 5 Prozesse auf 4 Kernen |
| 3 | 11:47:56 bis 12:10:56 | Flip-Graph über GF(2) bei 34, 4 Kerne, 1380 s |

Danach nur Schreibarbeit. Nichts läuft im Hintergrund weiter.

Subagenten: 0. Fremdmodell-Anfragen: 0.
