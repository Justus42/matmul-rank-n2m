# S3-07: Einschätzung 4×2×5 bei Länge 31

- Auftrag: S3-07, Stufe 3 (Erkundung nach Protokoll 0.5, Abschnitt 3), Runde 2. Rolle: Erkunder.
- Datum: 26.11.2026
- Status: Diese Datei fasst zusammen und schätzt ein. Sie beweist nichts und prüft nichts. Jede inhaltliche Aussage hat den Status, den sie im zitierten Bericht hat (**behauptet** oder **vermutet**). Eigene Einschätzungen dieser Datei sind **vermutet**. Den Status setzt nur der Orchestrator.
- Gelesen: `CLAUDE.md`, `PROTOKOLL.md`, `STATUS.md`, `LOG.md` (Einträge zu Protokoll 0.5 und Beginn Stufe 3), `erkundung/s3-01-restfaelle-425.md` mit `s3-01-restfaelle.py`, `erkundung/s3-02-restfaelle-425.md` mit `s3-02-restfaelle.py`, `erkundung/s3-05-uebertragung.md`, `erkundung/s3-06-blind-425.md`. Zur Klärung eines Widerspruchs (Abschnitt 2.3) die Kopfkommentare und die Aussage von `lemmaV'` in `lean/YangBounds/SatzB444.lean` und Abschnitt 5 von `lean/prosa/s2_444_spurA_r2.md`, dazu `versuche/s2-blind-r4.md` (Lemma ρ). Keine Dateien s3-08 oder s3-09.
- Kontrollrechnungen: Ich habe die beiden Programme von S3-01 und S3-02 und die Kopfrechnung aus S3-05 Abschnitt 4.4 laufen lassen (zusammen unter 5 Sekunden). Nichts Neues gerechnet.
- Keine Subagenten, keine Fremdmodell-Anfrage, kein Kontakt nach außen.

---

## 0. Ergebnis in Kürze

1. **Restfälle:** In der Rolle n = 4, m = 5 bleiben **7 Fälle**, in der transponierten Rolle ⟨5,2,4⟩ **20 Fälle**. S3-01 und S3-02 stimmen Fall für Fall überein, in beiden Rollen, auch in s_max und im Spielraum von Ungleichung (1). Die Kopfrechnung von S3-05 ergibt dieselben Listen. (behauptet)
2. **Lean-Kette:** Übertragbar ist der Unterbau (Normalform, Yangs Ungleichungen, Lemma 13′ mit demselben d = 3, Lemma K, Klassenzählen, Gradsatz `deg_eq_one`, `transp`, Basiswechsel). Nicht übertragbar ist alles ab Satz B, weil es n = m benutzt oder dass die Transponierte im selben Format liegt. S3-05 schätzt etwa 1 500 von 8 753 Zeilen der Kette als formatfrei. (Lesebefund, behauptet)
3. **Abzählargument:** Rechnerisch trägt es (16 verschiedene Punkte gegen höchstens 13 Schnittpunkte, Reserve 2 wie bei 4×2×4). Seine Voraussetzungen können aber nur in **einem** der 7 Fälle zugleich gelten, (3, 6, 9). In fünf Fällen ist ein gemeinsamer Kern erzwungen, in einem fehlt rk L = dim Q. (behauptet bzw. vermutet)
4. **Gegenrichtung:** Die blinde Suche hat kein Verfahren mit 31 gefunden, auch keines mit 32. Sie hat nach eigener Angabe einen kleinen Teil des Suchraums abgedeckt, fast nur über GF(2), wo vielleicht schon 32 unerreichbar ist. Das ist kein Hinweis gegen 31. (behauptet)
5. **Empfehlung: Angriff lohnt nicht**, jedenfalls nicht als Übertragung der Kette zu 4×2×4. Begründung in Abschnitt 5. (vermutet)

---

## 1. Restfälle: beide Rechnungen nebeneinander

### 1.1 Was gerechnet wurde

Beide Rechnungen übertragen die Fallunterscheidung von Satz A (B-008) auf ⟨n,2,m⟩ mit Länge r. Ein Fall ist ein Tripel (ρ, rk L, rk H). Dazu geben beide je Fall die größte nach Lemma 13′ erlaubte Zahl s an und den Spielraum von Yangs Ungleichung (1). Satz B (Lemma V, Lemma S) zählen beide nicht mit, weil er sich nicht unmittelbar überträgt (Abschnitt 2.3).

Beide Programme bestehen ihre Selbstproben: Für 4×2×4 bei r = 25 kommt genau die Liste von Satz A heraus, mit der s-Tabelle aus `SatzA444.sDim_table`. Für mehrere Formate mit m ≥ n ≥ 4 ist das kleinste r mit einem Fall genau Yangs Schranke. Ich habe beide Programme erneut laufen lassen, die Ausgaben stimmen mit den Berichten überein.

### 1.2 Rolle n = 4, m = 5 (das Format wie gegeben), r = 31

d = 3, dim Q = 6, Spielraum in Yangs Gleichung (2): 3.

| Nr. | ρ | rk L | rk H | S3-01: s_max | S3-02: s ≤ | S3-01: Spielraum (1) | S3-02: Spielraum (1) | N ≠ 0 erzwungen | rk L = dim Q | bei 4×2×4 |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3 | 3 | 6 | 0 | 0 | 0 | 0 | ja | nein | ja |
| 2 | 3 | 4 | 7 | 0 | 0 | 0 | 0 | ja | nein | ja |
| 3 | 3 | 5 | 7 | 0 | 0 | 1 | 1 | ja | nein | ja |
| 4 | 3 | 5 | 8 | 1 | 1 | 0 | 0 | nein | nein | ja |
| 5 | 3 | 6 | 8 | 0 | 0 | 1 | 1 | ja | ja | neu |
| 6 | 3 | 6 | 9 | 1 | 1 | 0 | 0 | nein | ja | neu |
| 7 | 4 | 6 | 9 | 0 | 0 | 0 | 0 | ja | ja | neu |

**Zahl der Restfälle: 7.** Übereinstimmung Fall für Fall: **ja**, in allen Spalten. Die Kopfrechnung von S3-05 (Abschnitt 4.1 dort) gibt dieselben 7 Tripel mit denselben s_max.

Ein Unterschied in der Wortwahl: S3-01 schreibt bei s = 0 „dim N ≥ 2“ (Fälle 1, 2, 3, 5) und „dim N ≥ 1“ (Fall 7), S3-02 schreibt „dim N = 2“ bzw. „dim N = 1“. Das widerspricht sich nicht. Weil der gemeinsame Kern N immer in ker G liegt und s = 0 umgekehrt ker G ⊆ N gibt, ist N = ker G und dim N = m − ρ. S3-02 ist hier also genauer.

### 1.3 Rolle n = 5, m = 4 (transponiert, ⟨5,2,4⟩), r = 31

d = 4, dim Q = 7, Spielraum in (2): 12. Lemma 14 gibt ρ ≥ 4, also ρ = m = 4, s = 0, ker G = 0.

| ρ | rk L | rk H (beide Rechnungen) |
|---|---|---|
| 4 | 4 | 12, 13, 14, 15, 16 |
| 4 | 5 | 13, 14, 15, 16, 17 |
| 4 | 6 | 14, 15, 16, 17, 18 |
| 4 | 7 | 15, 16, 17, 18, 19 |

**Zahl der Restfälle: 20.** Übereinstimmung Fall für Fall: **ja**, auch im Spielraum (1), der in beiden Ausgaben rk L + 12 − rk H ist. S3-05 kommt ebenfalls auf 20.

Beide Rechnungen stellen fest, dass diese Rolle nicht scharf ist: Schon bei r = 30 bleiben 3 Fälle, (4,4,12), (4,5,13), (4,6,14). Die Schranke 31 kommt allein aus der Rolle n = 4, m = 5. Das passt zu Yangs Satz 2, der m ≥ n verlangt.

### 1.4 Beide Rollen zugleich

Jede Zerlegung der Länge 31 liegt in einem Fall von 1.2 und, nach eigener Normalisierung der Transponierten, in einem Fall von 1.3. Eine Kopplung der beiden Normalformen kennt keiner der Berichte. Ohne Kopplung sind das bis zu 7 · 20 = 140 Paare, und die Rolle 1.3 schränkt nichts weiter ein. Bei 4×2×4 lagen beide Rollen im selben Format mit derselben Liste, das hat `Transponiert444.lean` benutzt. Bei 4×2×5 fehlt das.

### 1.5 Was die Übereinstimmung bedeutet und was nicht

- Die beiden Programme sind unabhängig geschrieben und rechnen jeweils doppelt (S3-01: Aufzählung und geschlossene Formel; S3-02: Aufzählung mit Selbstproben). Die Arithmetik ist damit gut abgesichert.
- **Die Auswahl der Bedingungen ist nicht unabhängig.** Beide haben dieselbe Vorlage gelesen (`lean/prosa/yang_n4.md`, `s2_444_spurA_r2.md`, `SatzA444.lean`) und daraus dieselben Ungleichungen genommen. Ein Lesefehler in der Vorlage würde beide gleich treffen. S3-02 zeigt, dass nur drei Bedingungen die Liste bestimmen: Yangs Gleichung (2), Lemma 13 und Lemma 14.
- Beide übernehmen die allgemeinen Fassungen von Yangs Lemmata nach den **Signaturen** der Lean-Sätze, ohne deren Beweise oder Prüfstand nachzusehen.
- Die Liste ist eine obere Grenze für die Fallunterscheidung nach Satz A, nicht mehr. Weder ist gezeigt, dass jeder Fall eine Zerlegung hat, noch, dass weitere gültige Ungleichungen die Liste nicht kürzen würden. Feinere Unterfälle (wie bei 4×2×4 die Unterfälle A und B von (5,8)) rechnet keines der Programme.
- Zwei Stellen nennen beide Berichte als unsicher: dass R2 (Entfernen von Nullformen) in der Rolle n = 5 die Länge 31 nicht senkt, was erst über die Transposition aus Yangs Schranke für ⟨4,2,5⟩ folgt, und dass Lemma 14 bei m = n − 1 gilt (die Lean-Fassung hat genau `d ≤ m`).

---

## 2. Welche Teile der Lean-Kette übertragbar sind

Quelle ist S3-05 (Abschnitte 2 und 5). Es sind Lesebefunde, keine Rechnung.

### 2.1 Übertragbar

| Teil | Datei | Bemerkung |
|---|---|---|
| Rangbegriff, Basiswechsel R1 | `Basic.lean`, `Endsatz444.le_tensorRank_of_algClosed` | allgemein |
| Yangs Normalform und alle Ungleichungen von Satz 2 | `YangN4Haupt.lean`, `YangN4Lemma13.lean`, `Statements.lean` | allgemein in d, m, r. Liefert auch die Minimalität (keine Zerlegung der Länge 30) |
| Lemma 13′ und gemeinsamer Kern bei s = 0 | `Lemma13Prime.lean` | Kern allgemein, das Statement ist auf d = 3 festgelegt, und 4×2×5 hat ebenfalls d = 3 |
| Fallliste von Satz A | `SatzA444.lean` | Beweise nur `omega` über allgemeinen Ungleichungen, mit neuer Liste neu instanziierbar, gering |
| Lemma K, Folgerung K1 | `LemmaK444.lean` | allgemein in n, jeder Körper |
| Klassenzählen, Zusammenlegen proportionaler Terme | `LemmaZ444.viele_klassen`, `mergeAlg` | allgemein in r |
| Gradsatz | `SatzF444.deg_eq_one` | allgemein in den Graden |
| Transposition | `Transponiert444.transp`, `Mrot` | allgemein in n, m, r |
| Technik des generischen Punkts | `SatzC444Generisch.lean`, `Bruecke444.lean` | Technik allgemein, Instanzen fest, mittlerer Aufwand |

### 2.2 Nicht übertragbar

| Teil | Grund |
|---|---|
| Satz B (`SatzB444.lean`, `SatzB444Poly.lean`) | `IsSymm` ist ein Isomorphismus K⁴ ≅ K⁴ zwischen a-Seite und b-Seite, setzt n = m voraus. Lemma S rechnet in K[x₀,…,x₃] und ist auf die Fälle (4,7), (5,7) zugeschnitten |
| Satz C (`SatzC444Kern.lean`) | Quadrikzählung r − nm < n(n+1)/2 geht bei 4×2×4 knapp auf (9 < 10). Bei 4×2×5 nur noch für rk L ≤ 4, also nur in den Fällen 1 und 2 |
| Lemma P, Satz E (`LemmaP444.lean`, `SatzE444*.lean`) | Lemma P lebt davon, dass die Kerne der F_γ eindimensional sind (dim U − ρ = 1). Im einzigen Fall, in dem es bei 4×2×5 gebraucht würde, sind sie Ebenen (5 − 3 = 2) |
| Schluss von Satz F (`SatzF444.satzF_kern`) | Kubiken auf beiden Seiten, `Sym³`, ein G ∈ GL₄. Bei 4×2×5 sind die Kurven vom Grad 3 und 4 |
| Lemma Z außer dem Zählen | `hr : r = 25`, rk L = 5, `Fin 4` |
| `Transponiert444.lean` außer `transp` | wendet Satz A bis Lemma P einfach auf die Transponierte an. Die Transponierte von ⟨4,2,5⟩ ist ⟨5,2,4⟩ mit eigener Normalform und 20 Fällen |
| Brücke | überträgt gerade die Nichtsymmetrie, also den n = m-Begriff |

S3-05 schätzt: etwa 1 500 der 8 753 Zeilen der Kette von `SatzA444` bis `Transponiert444` sind formatfrei, dazu 2 261 Zeilen allgemeiner Unterbau. Etwa 7 200 Zeilen sind fest auf 4×2×4 oder auf n = m gebaut.

### 2.3 Ein offener Unterschied zwischen den Berichten: Lemma V

Die Berichte beurteilen Lemma V verschieden.

- **S3-01** (Abschnitt 6) und **S3-02** (Abschnitt 6, Punkt 2) lesen die **Prosa-Fassung** Lemma V aus `s2_444_spurA_r2.md` Abschnitt 5. Die braucht dim U = n, damit eine Abbildung K⁴ → U invertierbar ist, und dim I(u, u′) = 1. Bei ρ = 3 und m = 5 ist dim I(u, u′) = 2 (S3-01), Schritt 2 fällt aus. Urteil: überträgt sich nicht unmittelbar (vermutet).
- **S3-05** (Tabelle 2.2 und Abschnitt 4.2) liest die **Lean-Fassung** `lemmaV'` in `SatzB444.lean`. Die kommt ohne dim I aus: Ein gemeinsamer Kernvektor x gibt direkt eine lineare Abbildung g mit der Symmetrie-Gleichung. S3-05 meint, für n < m liefere derselbe Beweis eine **injektive** Abbildung g : K⁴ → K⁵ mit gᵀ b_t = μ_t a_t („halbsymmetrisch“), und n = m werde nur gebraucht, um daraus einen Isomorphismus zu machen. Urteil: überträgt sich mit mittlerem Aufwand (behauptet).

Ich habe nachgesehen: `lemmaV'` braucht tatsächlich nur den Kernvektor und (N1), (N2), nicht dim I. Die beiden Urteile betreffen also verschiedene Beweise und widersprechen sich nicht unbedingt. Offen bleibt, ob g für m = 5 wirklich injektiv ist. Beide Seiten sind sich aber einig, dass danach **Lemma S fehlt**: Bei 4×2×4 hat erst Lemma S aus der Symmetrie die Fälle (4,7) und (5,7) ausgeschlossen. Ein Gegenstück für den halbsymmetrischen Fall gibt es nicht, und S3-05 hat für die Fälle 3, 5 und 7 keine Idee.

---

## 3. Trägt das Abzählargument am Ende der Kette?

Quelle ist S3-05 Abschnitt 3 und 4 (behauptet, Teile vermutet). S3-01 und S3-02 sagen dazu nichts.

### 3.1 Die Zahlen

| | 4×2×4, r = 25 | 4×2×5, r = 31 |
|---|---|---|
| unten: verschiedene Punkte nach Lemma Z, ⌈r/2⌉ | 13 | 16 |
| oben: Schnittpunkte nach Satz F, (n−1)(m−1) + 1 | 10 | 13 |
| verlangt in der Lean-Form, (n−1)(m−1) + 2 | 11 | 14 |
| Reserve | 2 | 2 |

**Die Rechnung geht auf**, mit derselben Reserve wie bei 4×2×4. S3-05 zeigt allgemein: Für n = 4 an Yangs Schranke r = 6m + 1 ist die Reserve immer 2. Ohne Lemma Z bleibt unten nur m + rk L ≤ 11, das reicht nicht.

Die obere Zahl für n ≠ m (Kurven vom Grad n − 1 und m − 1, Kronecker-Block bei engem Paar) hat S3-05 selbst hergeleitet (behauptet), sie steht so nicht in der Kette. Auch der Schluss nach dem Zusammenfallen der Kurven muss für n ≠ m neu sein, weil es keine Symmetrie gibt. S3-05 schlägt eine Gradzählung vor: dim span{a_t ⊗ b_t} ≤ n + m − 1 = 8 gegen dim ker W = 11 (vermutet).

### 3.2 Voraussetzungen, je Restfall

Lemma Z braucht rk L = dim Q, Satz F braucht keinen gemeinsamen Kern (N = 0) und ein enges Paar auf beiden Seiten.

| Nr. | (ρ, rk L, rk H) | rk L = dim Q | N = 0 möglich | Abzählargument anwendbar? | Was stattdessen nötig wäre |
|---|---|---|---|---|---|
| 1 | (3,3,6) | nein | nein | nein | halbsymmetrischer Zweig. Satz-C-Ersatz denkbar, weil rk L ≤ 4 (vermutet) |
| 2 | (3,4,7) | nein | nein | nein | wie Fall 1 |
| 3 | (3,5,7) | nein | nein | nein | halbsymmetrischer Zweig, kein Werkzeug der Kette |
| 4 | (3,5,8) | nein | ja | **nein**, Lemma Z fehlt: unten nur m + rk L = 10 gegen Bedarf 14 | neues Argument. Das ist das Gegenstück zu (5,8) bei 4×2×4, aber ohne rk L = dim Q |
| 5 | (3,6,8) | ja | nein | nein | halbsymmetrischer Zweig, kein Werkzeug der Kette |
| 6 | (3,6,9) | ja | ja | **ja, rechnerisch** (16 gegen 13) | dazu Lemma P neu (Kerne sind Ebenen) und ein enges Paar auf der Seite ⟨5,2,4⟩, deren Fallunterscheidung 20 Fälle hat |
| 7 | (4,6,9) | ja | nein | nein | halbsymmetrischer Zweig, kein Werkzeug der Kette |

Das Abzählargument trägt also nur in Fall 6, und auch dort nur unter zwei offenen Bedingungen. Offen lässt S3-05 vor allem die Gegenseite: In allen 20 Fällen von ⟨5,2,4⟩ ist ρ = m = 4. Ob es dort überhaupt eine Kombination F_γ vom Rang 1 gibt (das braucht ein enges Paar), sagt keiner der Berichte.

**Einschätzung (vermutet):** Das Abzählargument ist nicht die Hürde. Die Hürde liegt davor, im halbsymmetrischen Zweig (Fälle 1, 2, 3, 5, 7) und in Fall 4, in dem rk L < dim Q ist.

---

## 4. Gegenrichtung: blinde Suche nach einem Verfahren mit 31

Quelle ist S3-06 (behauptet).

- **Ergebnis:** kein Verfahren mit 31 und auch keines mit 32. Gefunden wurden 13 Verfahren mit 33 über GF(2) per Flip-Graph und 40 weitere per SAT. Rang 33 ist der Wert von Hopcroft-Kerr, also nichts Neues.
- **Literatur nach S3-06:** obere Schranke 32 über ℚ (AlphaEvolve, Novikov u. a., arXiv:2506.13131, für ⟨2,4,5⟩). Das Verfahren braucht den Koeffizienten 1/2 und gilt deshalb nicht in Charakteristik 2. Über {−1, 0, 1} ist 33 das Beste (Perminov, arXiv:2511.20317). Das schließt die Lücke in Protokoll Abschnitt 2 („Quelle des 32er-Verfahrens nachtragen“), ist aber nur als Angabe von S3-06 vorhanden. Abgerufen hat S3-06 das 32er-Verfahren nicht.
- **Was gesucht wurde:** etwa 1,07 Mrd. Flips über GF(2) und GF(3), etwa 3 600 SAT-Versuche über GF(2) mit 65 % festgehaltenen Koeffizienten (alle unerfüllbar für 32), dazu ein abgebrochener numerischer Versuch über ℝ. Insgesamt grob 2 Kernstunden.
- **Wie aussagekräftig:** wenig, nach S3-06 selbst. Die Startpunkte stammen alle aus Hopcroft-Kerr-artigen Bausteinen. Die Suche über GF(3) kam nicht unter 36. Die numerische Suche fand nicht einmal die bekannte 32. Über ℚ mit 1/2, dem einzigen Bereich, in dem 32 bekannt ist, wurde nicht gesucht. S3-06 vermutet sogar, dass über GF(2) schon 32 unerreichbar ist. Dann sagt eine leere Suche über GF(2) nichts über 31 aus.
- **Nach 5.2 geprüft:** nichts, weil nichts unter 33 gefunden wurde.

**Einschätzung (vermutet):** Die Gegenrichtung ist für 4×2×5 kaum angegangen worden. Eine leere Suche dieser Größe spricht weder für 31 noch dagegen. Der von S3-06 genannte nächste Schritt (vom bekannten 32er-Verfahren aus über GF(3) oder GF(5) suchen, vorher Lizenz nach 11.3 klären) wäre die sinnvollere Form.

---

## 5. Empfehlung: Angriff lohnt nicht

**Empfehlung: „lohnt nicht“** für einen Angriff auf die untere Schranke 32 von 4×2×5 als Übertragung der Kette zu 4×2×4, im Rahmen dieses Projekts und mit dem jetzigen Werkzeug. (vermutet)

Begründung:

1. **Mehr Fälle, und die neuen passen nicht ins Muster.** 7 statt 4 Restfälle. Drei davon (5, 6, 7) gibt es bei 4×2×4 nicht, darunter erstmals einer mit ρ = 4. Beide Rechnungen sind sich darin einig.
2. **Der zweite Schritt der Kette fehlt.** Bei 4×2×4 hat Satz B mit Lemma S zwei Fälle ausgeschlossen und Satz C den symmetrischen Zweig erledigt. Beides hängt an n = m. Bei 4×2×5 liegen fünf der sieben Fälle im halbsymmetrischen Zweig. Für zwei davon (Fälle 1 und 2) ist ein Satz-C-Ersatz denkbar, für drei (Fälle 3, 5, 7) hat keiner der Berichte eine Idee.
3. **Die Gegenseite ist ein anderes Format.** Bei 4×2×4 durfte die Kette die Transponierte mit denselben Sätzen behandeln. Bei 4×2×5 ist sie ⟨5,2,4⟩ mit 20 Fällen, für die nichts vorhanden ist. Fall 6, der einzige, in dem das Abzählargument greifen kann, braucht genau diese Gegenseite.
4. **Wiederverwendbar ist wenig.** Etwa 1 500 von 8 753 Zeilen. Der wertvolle Teil der Kette (Satz B bis Satz F) müsste neu gedacht werden, nicht nur neu instanziiert.
5. **Das Abzählargument rettet es nicht.** Es geht rechnerisch auf, greift aber nur in einem von sieben Fällen.
6. **Die Gegenrichtung gibt keinen Anlass.** Die blinde Suche hat nichts gefunden, deckt aber zu wenig ab, um für oder gegen 31 zu sprechen.

**Was die Einschätzung ändern würde** (vermutet, keine Empfehlung für einen Auftrag):

- Ein Satz für den halbsymmetrischen Zweig mit n < m, also ein Ersatz für Lemma S und Satz C bei injektivem g : K⁴ → K⁵. Er würde fünf der sieben Fälle abdecken.
- Das „Lemma ρ“ aus `versuche/s2-blind-r4.md` (vermutet: in jeder normalisierten Zerlegung der Länge 6m + 1 ist eine Kombination Σγ_i F_i injektiv). In allen sieben Fällen ist ρ ≤ 4 < 5, Lemma ρ würde also alle auf einmal ausschließen und R(⟨4,2,5⟩) ≥ 32 geben. Bei 4×2×4 wurde die 26 ohne Lemma ρ erreicht. Ob es dort gilt, ist offen.
- Auf der Seite der Verfahren: eine Suche, die vom bekannten 32er-Verfahren ausgeht und außerhalb von Charakteristik 2 läuft.

Zum Vergleich mit 3×2×7 sagt S3-05: Dort bleibt nach Yangs Ungleichungen nur ein einziger Fall. Der Unterschied ist für die Entscheidung, in welches Format man weiter investiert, vermutlich wichtiger als jede Einzelheit oben. Die Einschätzung zu 3×2×7 ist aber nicht Gegenstand dieses Auftrags.

---

## 6. Offene Stellen und Widersprüche, ungeglättet

1. Lemma V: Prosa-Fassung (S3-01, S3-02: überträgt sich nicht unmittelbar) gegen Lean-Fassung `lemmaV'` (S3-05: überträgt sich als halbsymmetrisch). Offen ist, ob g bei m = 5 injektiv ist (Abschnitt 2.3).
2. Die Restfall-Listen sind arithmetisch doppelt abgesichert, die Auswahl der Bedingungen aber nicht (Abschnitt 1.5).
3. Die obere Zahl (n−1)(m−1)+1 und der Schluss nach dem Zusammenfallen der Kurven sind für n ≠ m eigene Herleitungen von S3-05, nicht Teil der Kette (Abschnitt 3.1).
4. Ob es auf der Seite ⟨5,2,4⟩ ein enges Paar gibt (F_γ vom Rang 1), sagt keiner der Berichte (Abschnitt 3.2).
5. Die Literaturangaben zum 32er-Verfahren stammen nur aus S3-06. Das Verfahren selbst liegt nicht im Repo und ist nicht nach 5.2 nachgerechnet.
6. Die Kopplung beider Rollen (140 Paare) hat niemand untersucht.

---

## 7. Statusübersicht

| Aussage | Herkunft | Status |
|---|---|---|
| 7 Restfälle in der Rolle n = 4, m = 5, Liste wie in 1.2 | S3-01, S3-02, Kopfrechnung S3-05 | behauptet |
| 20 Restfälle in der Rolle n = 5, m = 4 | S3-01, S3-02, S3-05 | behauptet |
| Beide Rechnungen stimmen Fall für Fall überein | Vergleich in dieser Datei, Programme neu laufen lassen | behauptet |
| Tabelle übertragbar / nicht übertragbar | S3-05, Lesebefund | behauptet |
| Abzählargument: 16 gegen 13, Reserve 2 | S3-05 | behauptet |
| Abzählargument greift nur in Fall (3,6,9) | S3-05, Tabelle 3.2 | behauptet |
| Kein Verfahren mit 31 oder 32 gefunden | S3-06 | behauptet |
| Empfehlung „lohnt nicht“ und alle Einschätzungen | diese Datei | vermutet |
