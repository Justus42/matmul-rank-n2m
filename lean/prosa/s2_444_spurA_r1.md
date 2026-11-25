# S2-02: Untere Schranke 26 für ⟨4,2,4⟩ über 𝔽₂? Bericht der Spur A, Runde 1

- Auftrag: S2-02 (Stufe 2, Runde 1), Rolle Beweissucher, Spur A
- Datum: 25.11.2026
- Status aller Ergebnisse dieses Berichts: **behauptet** (Rechnungen und Überlegungen eines Agenten, keine Prüfung nach Abschnitt 5). Wo etwas nur eine Idee ist: **vermutet**
- Code, Daten, Protokolle und der gescheiterte Ansatz: `versuche/s2-spurA-r1/`

Schreibweise: ⟨4,2,4⟩, ⟨2,4,4⟩ und ⟨4,4,2⟩ haben über jedem Körper denselben Rang (zyklische Vertauschung und Transposition). Wang rechnet mit ⟨l,m,n⟩, erster Faktor A = 𝔽^{l×m}. Für dieses Format ist ⟨2,4,4⟩ mit A = 𝔽₂^{2×4} die günstige Lage (siehe 4.1).

---

## 1. Ergebnis in Kürze

1. **Mit Wangs Verfahren allein lässt sich R_𝔽₂(⟨2,4,4⟩) ≥ 26 in dieser Runde nicht zeigen.** Nach drei Rechenblöcken (zusammen etwa 68 Minuten auf 4 Kernen) steht ein vom Prüfprogramm angenommenes Zertifikat für **R_𝔽₂(⟨2,4,4⟩) ≥ 22**. Das ist schwächer als die bekannten Schranken 23 (Bläser 1999; Ja'Ja' und Takche 1985 über 𝔽₂) und 25 (Yang v3, jeder Körper). Status behauptet.
2. Die Lücke ist groß: Die zwei Hyperebenen-Orbits bekommen 21, die mittleren Schichten 14 bis 20. Selbst ⟨2,3,4⟩ als Unterraum bekommt nur 18 (wahr über 𝔽₂: 20 laut D'Ambrosio). Mehr Rechenzeit derselben Art hebt einzelne Orbits um 1, nicht die Spitze um 4.
3. Der Weg, der über 𝔽₂ wirklich zu exakten Rängen geführt hat (D'Ambrosio für ⟨2,3,4⟩, Tomar für ⟨3,3,3⟩), ist Wangs Tabelle **plus** Kapazitäten, Aufzählung der Mengen erster Faktoren und Vervollständigungssuche. Für ⟨3,3,3⟩ kostete das rund 478 000 vCPU-Stunden. Für ⟨2,4,4⟩ ist der Suchraum roh etwa 10⁴-mal kleiner, aber unsere Tabelle ist viel schwächer. Eine belastbare Aufwandsschätzung für die Widerlegung von Rang 25 kann ich nicht geben (Abschnitt 5). In Blöcken von 30 Minuten auf 4 Kernen halte ich es innerhalb des Stufenbudgets für nicht erreichbar (vermutet).
4. **Grenze des Ansatzes:** Eine Schranke über 𝔽₂ schließt nur Verfahren mit Koeffizienten in ℤ₍₂₎ (rationale Zahlen mit ungeradem Nenner) aus. Verfahren über ℚ mit ½, über ℝ, ℂ oder 𝔽₃ bleiben möglich. Rechnungen über endlichen Körpern können das Ziel des Protokolls („über beliebigen Körpern“) grundsätzlich nicht erreichen (Abschnitt 6).
5. **Yangs Beweis um 1 verschärfen:** Ich habe nachgerechnet, wo Yangs Argument für n = m = 4 bei r = 25 hängen bleibt. Übrig bleiben genau vier Zahlenfälle mit ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)}. Keines der Lemmata aus Yangs Beweis schließt sie aus (Abschnitt 7). Das ist ein genauer Ansatzpunkt für Runde 2, kein Beweis.
6. **Lizenz:** Wangs Repo steht unter MIT (Datei `LICENSE` selbst gelesen, Commit `9db3d21`). Ich habe **keinen** Code von Wang ins Repo kopiert, sondern ihn als externen Klon benutzt. Im Repo liegen nur eigene Build-Skripte, eine eigene 5-Zeilen-Ersatzdatei und die erzeugten Zertifikate. Meldung für `lit/LIZENZEN.md` in Abschnitt 10.

---

## 2. Die Methode (Wang, arXiv:2603.07280 v11)

Volltext über alphaXiv gelesen (Abschnitte 2 bis 6, Anhang B und D), Code im Klon von github.com/wcgbg/tensor-rank-lower-bound gelesen.

### 2.1 Grundidee

Sei T ∈ A* ⊗ B* ⊗ C der Tensor, hier ⟨l,m,n⟩ mit A = 𝔽_q^{l×m}. Für einen Unterraum S ⊆ A sei T_S die Einschränkung des ersten Arguments auf S. Zwei Tatsachen (Wang, Lemma 1):

- **Monotonie:** S′ ⊆ S ⇒ R(T_S) ≥ R(T_{S′}).
- **Invarianz:** Für eine rangerhaltende Symmetrie g des ersten Arguments ist R(T_S) = R(T_{gS}). Bei Matrixmultiplikation ist das X ↦ PXQ⁻¹ mit P ∈ GL_l, Q ∈ GL_m (dazu Transposition nur bei l = m = n).

Also genügt ein Vertreter je Orbit von Unterräumen. Für A = 𝔽₂^{2×4} gibt es **86 Orbits** (Wang, Tabelle 9; von uns mit seinem Aufzählprogramm bestätigt, Schichten 1, 2, 8, 17, 30, 17, 8, 2, 1 nach Dimension 0 bis 8).

### 2.2 Das dynamische Programm

Für jede Dimension von 0 bis dim A (hier 8) bekommt jeder Orbit eine untere Schranke aus vier Techniken:

1. **Flatten:** größter Rang der drei Abflachungen von T_S.
2. **Degenerierte Reduktion:** eine weitere Bedingung, also ein Unterraum eine Dimension kleiner, dessen Schranke schon feststeht (Monotonie).
3. **Erzwungenes Produkt** (Hopcroft und Kerr, Lemma 2): Scheiben vom Rang 1 darf eine optimale Zerlegung wörtlich enthalten. Man zieht sie ab und zählt alle q^{s(t−s)} Restbelegungen durch. Wird übersprungen, wenn die Zahl 2^24 übersteigt (einstellbar).
4. **Substitution mit Rückverfolgung** (Pan): Angenommen R(T_S) = k. Jede Linearform f ≠ 0 auf S, die man null setzt, tötet alle Terme, deren erster Faktor zu f proportional ist, und führt in einen kleineren Unterraum. Das Programm zählt alle möglichen Listen erster Faktoren als Baum auf (aufsteigend sortiert, also jede Multimenge einmal). Ein Knoten ist geschlossen, wenn eine Teilmenge seiner Kette mit s Termen in einen Unterraum mit Schranke b führt und s + b ≥ k + 1. Sind alle Zweige geschlossen, gilt R(T_S) ≥ k + 1. Eine Schrittgrenze bricht zu große Suchen ab; ein abgebrochener Zweig gilt als gescheitert, das kostet Stärke, nie Korrektheit.

Die Schranke des Orbits S = A ist die Schranke für T.

### 2.3 Was ein Zertifikat ist

Ein Zertifikat besteht aus zwei Dateien:

- `cert_*.pb.txt` (Protocol-Buffer-Text): Kopf mit Problemname, Charakteristik, Erweiterungsgrad, Dimensionen; dann je Orbit ein Eintrag mit dem Vertreter (reduzierte Zeilenstufenform der Bedingungen, als Bytes), der behaupteten Schranke und der Art des Beweises.
- `cert_*.btp`: Archiv mit den Rückverfolgungsbäumen, je Orbit ein gzip-Block.

Je Beweisart steht nur, was das Prüfprogramm nicht billig selbst rechnen kann:

| Technik | im Zertifikat |
|---|---|
| Flatten | nichts, wird neu gerechnet |
| Erzwungenes Produkt | welche der drei zyklischen Lagen gewonnen hat (0, 1, 2) |
| Degenerierte Reduktion | die zusätzliche Bedingung und das Zeugenpaar (κ, σ), das den kleineren Unterraum seinem Orbitvertreter zuordnet: c = σ⁻¹(κ(S)) |
| Substitution | je geschlossenem Blatt: Tiefe, Teilmenge der Kette (Bitmaske), Zeugenpaar des Zielorbits, in Tiefensuchreihenfolge |

### 2.4 Wie ein Zertifikat unabhängig nachgeprüft wird

**Wangs Prüfprogramm** (`verifier/`) wiederholt die Schichten von unten nach oben mit einer schlichten Tabelle Orbit → Schranke. Flatten und erzwungenes Produkt rechnet es neu. Bei degenerierter Reduktion und Substitution rekonstruiert es den kleineren Unterraum aus dem Zeugenpaar und schlägt dessen schon geprüfte Schranke nach. Den Rückverfolgungsbaum läuft es deterministisch nach und verlangt an jedem Knoten, der kein Blatt ist, alle Kinder. Ein Zertifikat, das einen Fall auslässt, fällt durch. Zu vertrauen ist nur `verifier/`, `core/` und `problems/` (Tensor und Symmetriegruppe), nicht das Suchprogramm.

Selbst ausprobiert: Ändert man im Zertifikat die oberste Schranke von 22 auf 23, bricht das Prüfprogramm mit `Check failed: rank_lower_bound_ <= proved (23 vs. 22)` und Rückgabewert 134 ab.

**Unabhängige Nachprüfung im Sinn dieses Projekts** wäre eine der folgenden, aufsteigend nach Strenge:

1. Ein zweites Prüfprogramm, von einem anderen Agenten ohne Blick auf Wangs `verifier/` aus der Beschreibung in 2.2 und 2.3 geschrieben, in anderer Sprache. Das hat Beuchert für Wangs ⟨3,3,3⟩-Zertifikat gemacht (Zenodo, doi:10.5281/zenodo.20691957, laut Tomar). Das Format der Bäume (Reihenfolge der kanonischen Formen, Reihenfolge der Teilmengen) müsste man dazu genau aus dem Code ablesen; das ist Arbeit, aber klein.
2. Ein Prüfprogramm in Lean mit Korrektheitsbeweis, ausgewertet durch den Kern (`decide +kernel`), wie es Rudich und Rousseau (arXiv:2610.01639) und Tomar (arXiv:2610.11823, Abschnitt 9) für ihre eigenen Formate gebaut haben. Erst das erfüllt Abschnitt 5.1.

Für eine Schranke wie 22, die unter der bekannten liegt, lohnt keins von beiden.

---

## 3. Lizenz von Wangs Code

- Repo: github.com/wcgbg/tensor-rank-lower-bound, Commit `9db3d215267932ba3e8801a10655a2d538ed13d8` vom 29.10.2026 (öffentlicher `git clone`).
- Datei `LICENSE`: **MIT License, Copyright (c) 2026 Chengu Wang**, Volltext gelesen. Die Lizenz ist klar und erlaubt Übernahme mit Lizenzhinweis (Fall 1 der Regel 11.3).
- Die Zertifikate im Repo liegen in Git LFS. Das Nachladen aus der Sitzung verweigert der Git-Proxy (Repo nicht freigegeben). Ich habe Wangs eigene Zertifikate deshalb nicht prüfen können, sondern die kleinen Formate selbst neu erzeugt (Abschnitt 4.2).
- Zweites Repo github.com/wcgbg/matrix-multiplication-n333r21f2 (Wangs ≥ 21 für ⟨3,3,3⟩) geklont, Lizenz nicht nachgelesen, nicht benutzt.
- **Entscheidung:** Nichts von Wang kopiert. Benutzung nur als externer Klon. Eigene Dateien tragen im Kopf Quelle und Lizenz des benutzten Codes.

---

## 4. Die Rechnung dieser Runde

### 4.1 Aufbau

- Umgebung: 4 Kerne, Ubuntu 24.04, g++ 13.3, keine Bazel-Registry erreichbar (Proxy). Ich habe Wangs drei Programme (`orbit_enumerator_main`, `rank_lower_bound_main`, `verifier_main`) direkt mit g++ gebaut, gegen die Ubuntu-Pakete für protobuf, gflags, glog, Boost und TBB. Wangs Code bindet `ng-log` ein, ein Abzweig von glog; eine Ersatzdatei mit 5 Zeilen leitet das auf glog um. Skripte in `versuche/s2-spurA-r1/code/`.
- Das Problem wird wie bei Wang zur Übersetzungszeit gewählt (`-DCP_MATRIX -DCP_P=2 -DCP_M=1 -DCP_N0=… -DCP_N1=… -DCP_N2=…`).
- Lage: Bei ⟨2,4,4⟩ ist A = 2×4, die Abfrageseite des Halbierungstricks ist GL₂ (6 Elemente), die Speicherseite GL₄ (20 160). Bei ⟨4,2,4⟩ wäre es umgekehrt, jede Abfrage kostet dann 20 160 Proben. Gerechnet habe ich deshalb ⟨2,4,4⟩. ⟨4,4,2⟩ (A = 4×4) hat über 10¹¹ Orbits und scheidet aus.

### 4.2 Regressionsprüfung

Mit denselben Programmen neu gerechnet und jeweils vom Prüfprogramm angenommen:

| Format | Orbits | unsere Schranke | Wangs Tabelle |
|---|---|---|---|
| ⟨2,2,2⟩ | 10 | 7 | 7 |
| ⟨2,2,3⟩ | 11 | 11 | 11 |
| ⟨2,2,4⟩ | 11 | 14 | 14 |
| ⟨2,3,3⟩ | 31 | 15 | 15 |
| ⟨3,2,4⟩ | 31 | nicht fertig | 19 |

⟨3,2,4⟩ habe ich mit Wangs Einstellungen (erzwungenes Produkt bis 2^32) nach 10 Minuten abgebrochen, das erzwungene Produkt allein stand bei 18 %. Wang rechnete auf 192 vCPU. Diese Regression fehlt also.

### 4.3 Ergebnisse für ⟨2,4,4⟩ über 𝔽₂

| Lauf | Einstellung | Zeit | Ergebnis |
|---|---|---|---|
| basic | ohne Substitution | < 1 s | ≥ 20, Zertifikat angenommen |
| basic ⟨4,2,4⟩ | ohne Substitution, andere Lage | 2 s | ≥ 20, Zertifikat angenommen |
| Block 1 | Schrittgrenze 10 Mio. | 28 min, abgebrochen | kam nicht über die Schicht der Dimension 4 hinaus |
| Block 2 | Schrittgrenze 1 Mio. | 12 min | **≥ 22, Zertifikat angenommen** |
| Block 3 | Block 2 fortgesetzt, nur Dimension 5 bis 8, Schrittgrenze 20 Mio. | 28 min, abgebrochen | ein Orbit der Dimension 5 von 19 auf 20, oben unverändert 22 |

Zertifikat aus Block 2: `versuche/s2-spurA-r1/daten/cert_matrix_q02_n244_lb22.pb.txt` (SHA-256 `1f1214b1…6aac`) mit `.btp` (`c818a8fc…e504`). Prüfzeit etwa 1 Sekunde.

Schranken nach Dimension des Unterraums (Block 2; volle Liste in `daten/tabelle_244_lb22.txt`):

| dim S | Orbits | Schranken |
|---|---|---|
| 0 | 1 | 0 |
| 1 | 2 | 4, 8 |
| 2 | 8 | 8 bis 16 |
| 3 | 17 | 12 bis 18 |
| 4 | 30 | 14 bis 20 |
| 5 | 17 | 17 bis 20 |
| 6 | 8 | 18, sonst 20 |
| 7 | 2 | 21, 21 |
| 8 | 1 | **22** |

Beobachtungen:

- Der Unterraum „erste Spalte 0“ (Orbit 76, dim 6) ist ⟨2,3,4⟩ mit zusätzlichen, unbenutzten Variablen. Er bekommt 18. Wang selbst erreicht für ⟨3,2,4⟩ 19, der Rang über 𝔽₂ ist 20 (D'Ambrosio, nur zitiert gesehen). Die Tabelle ist also schon in der Mitte um 1 bis 2 zu schwach.
- Die oberste Stufe kommt nur über die zwei Hyperebenen mit 21. Für 26 müsste jeder Zweig der Substitution s + b ≥ 26 erreichen; mit den heutigen Werten der oberen Schichten ist das weit weg.

---

## 5. Rechenaufwand für ⟨2,4,4⟩ bei Rang 25

Zu zeigen wäre: Es gibt über 𝔽₂ keine Zerlegung der Länge 25. Zwei Wege:

**(a) Wangs Programm allein, mit mehr Rechenzeit.** Block 1 zeigt, dass schon eine Schrittgrenze von 10 Mio. die mittlere Schicht nicht in 28 Minuten auf 4 Kernen schafft. Wang brauchte für ⟨3,4,4⟩ (158 426 Orbits) 4,9 Stunden auf 192 vCPU; bei uns sind es nur 86 Orbits, aber die Substitution ist teurer, weil die Ränge höher liegen. Selbst mit großzügiger Zeit erwarte ich nach den Erfahrungen bei ⟨2,3,4⟩ (Wang 19, wahr 20) und ⟨3,3,3⟩ (Wang 20, wahr 23) nicht, dass das reine Programm die bekannten 25 erreicht, geschweige denn 26 (vermutet).

**(b) Die Kette nach Tomar.** Schritte, angepasst an ⟨2,4,4⟩ bei r = 25:

1. Tabelle verbessern: für jeden der 86 Orbits eine möglichst gute Schranke lb(S), auch über die Quotientensicht (Tomar, Lemma 2.1: Höchstens r − R(S) erste Faktoren liegen in S, R(S) ist der Rang modulo S). Kapazität cap(S) = 25 − lb(S).
2. Weitere Bedingungen an die ersten Faktoren, etwa aus Abflachungen (bei Tomar: Summe der Ränge der ersten Faktoren ≥ 27).
3. Alle Mengen von 25 ersten Faktoren unter den 255 Matrizen ≠ 0 in 𝔽₂^{2×4} aufzählen, die alle Kapazitäten einhalten, bis auf die Symmetriegruppe GL₂(𝔽₂) × GL₄(𝔽₂) der Ordnung 120 960. Wichtig: Bei Rang 25 dürfen erste Faktoren mehrfach vorkommen, solange Tomars Unterscheidbarkeit (aus lb des Punktes) nicht greift.
4. Für jede überlebende Menge eine Vervollständigungssuche nach zweiten und dritten Faktoren (B = 𝔽₂^{4×4}, C = 𝔽₂^{4×2}).

Grobe Zahlen: C(255, 25)/120 960 ≈ 2,3 · 10²⁹ Mengen ohne jede Beschränkung, bei ⟨3,3,3⟩ war das C(511, 22)/56 448 ≈ 3,8 · 10³³. Bei ⟨3,3,3⟩ blieben nach den Kapazitäten 75 Mio. Mengen, Gesamtaufwand rund 478 000 vCPU-Stunden. Für ⟨2,4,4⟩ ist der Rohraum etwa 1,7 · 10⁴-mal kleiner, die Zahl der überlebenden Mengen hängt aber fast nur an den Kapazitäten. Mit unserer Tabelle (Hyperebenen 21, also Kapazität 4) wären sie viel schwächer als bei Tomar. **Eine belastbare Schätzung ist erst möglich, wenn Schritt 1 gemacht ist.** Die Spanne reicht nach meiner Einschätzung von einigen CPU-Tagen bis über den ⟨3,3,3⟩-Aufwand hinaus (vermutet). Mit 4 Kernen in Blöcken von 30 Minuten ist Schritt 3 und 4 in Stufe 2 nicht realistisch, Schritt 1 schon.

---

## 6. Grenze des Ansatzes

1. **Was eine 𝔽₂-Schranke ausschließt.** Hat ⟨2,4,4⟩ eine Zerlegung der Länge 25 mit Koeffizienten in ℤ₍₂₎ (rationale Zahlen mit ungeradem Nenner), so liefert Reduktion modulo 2 eine Zerlegung derselben Länge über 𝔽₂, denn der Tensor hat Einträge 0 und 1. R_𝔽₂ ≥ 26 schließt also alle solchen Verfahren aus, insbesondere alle mit ganzzahligen Koeffizienten. Rudich und Rousseau haben diese Reduktion für Blockverfahren in Lean formalisiert.
2. **Was sie nicht ausschließt.** Verfahren über ℚ mit ½ in den Koeffizienten, über ℝ, ℂ, 𝔽₃ oder jedem anderen Körper der Charakteristik ≠ 2. Das ist genau das Muster bei ⟨2,4,5⟩: 32 über ℚ mit ½, 33 über ℤ (`lit/QUELLEN.md`).
3. **Andere Charakteristiken.** Wangs Programm rechnet über jedem 𝔽_q (für ⟨2,4,4⟩ über 𝔽₃: 91 Orbits, Wang Tabelle 9). R_{𝔽_p} ≥ 26 schließt Verfahren mit Koeffizienten in ℤ₍ₚ₎ aus. Ein Verfahren über ℚ hat nur endlich viele Primzahlen in den Nennern und reduziert sich modulo jeder anderen. Um alle Verfahren über ℚ auszuschließen, bräuchte man R_{𝔽_p} ≥ 26 für unendlich viele p. Das ist mit Aufzählung nicht zu machen, und die Orbitzahlen wachsen mit p.
4. **Alle Körper.** Das Ziel des Protokolls ist der Rang über beliebigen Körpern. Wegen R_K ≥ R_{K̄} genügt eine Schranke über algebraisch abgeschlossenen Körpern jeder Charakteristik. Endliche Körper liefern nur R_{𝔽_q}, und das ist ≥ R_{𝔽̄_q}, also die schwächere Richtung. **Keine Rechnung über endlichen Körpern ergibt eine Schranke über allen Körpern.** Dafür braucht es ein strukturelles Argument wie Yangs.
5. **Nutzen trotzdem.** (a) Für Spur B: Bei R_𝔽₂ ≥ 26 müsste ein Verfahren mit 25 Nenner 2 haben, die Suche kann sich darauf beschränken. (b) Für Spur A: Ein 𝔽₂-Beweis zeigt, welche Teilfälle (Orbits, Kapazitäten) trotzdem schwer sind, und kann ein strukturelles Argument anleiten. (c) Das Fertig-Kriterium der Stufe 2 erfüllt eine 𝔽₂-Schranke nicht, sie wäre ein Teilergebnis.

---

## 7. Lässt sich Yangs Beweis um 1 verschärfen?

Bezeichnungen wie in `lean/prosa/yang_n4.md`: n = m = 4, K algebraisch abgeschlossen, (N1) und (N2) gelten, Q = ker W / J, F_i : U → Q, L, H, ρ wie dort. Yang schließt r = 6m = 24 aus. Ich nehme r = 6m + 1 = 25 an und gehe dieselben Lemmata durch:

1. dim Q = r − 5m = m + 1 = **5** (Lemma 4.1(iii)), also rk L ≤ 5.
2. Gleichung (2): 3·(r − 6m) = 3 ≥ rk H − rk L, also **rk H ≤ rk L + 3**.
3. Lemma 13 mit d = 3: 2·rk H ≥ 3ρ + rk L. Mit 2: rk L ≥ 3ρ − 6.
4. Lemma 14 (m ≥ n − 1): ρ ≥ 3. Mit 1 und 3: 3ρ − 6 ≤ 5, also ρ ≤ 3. Damit **ρ = 3**.
5. Lemma 8′: rk L ≥ 3. Lemma 15(a): rk L ≤ 3ρ = 9, hier ohne Wirkung. Lemma 15(b) greift nur bei rk L = 3ρ = 9, also nie, und damit auch Lemma 9 nicht.
6. Lemma 11 (11′) gibt rk H ≥ rk L, Lemma 13 gibt rk H ≥ (9 + rk L)/2.

Übrig bleiben genau die vier Fälle

| rk L | rk H |
|---|---|
| 3 | 6 |
| 4 | 7 |
| 5 | 7 |
| 5 | 8 |

jeweils mit ρ = 3. Alle Zahlen sind mit dim U^{∧3} = 3·4 = 12 und dim Q³ = 15 verträglich. **Keines der Lemmata aus Yangs Beweis schließt einen dieser Fälle aus** (behauptet, Rechnung oben, von niemandem nachgeprüft).

Was gebraucht würde (vermutet, nicht ausgearbeitet):

- Eine Aussage für ρ = 3 < m = 4: Kein F_i ist injektiv, jede Kombination Σγ_iF_i hat einen Kern ≠ 0. Lemma 15(b) nutzt den gemeinsamen Kern N nur im Gleichheitsfall. Eine Variante, die schon bei rk L ≤ 5 einen Unterraum S mit f_i(S) ⊆ f_0(S) + (kleiner Fehler) baut und dann Lemma 9 anwendet, könnte die Fälle mit kleinem rk L treffen.
- Eine schärfere Fassung von Lemma 13, etwa mit dem zweitgrößten Rang statt nur ρ, für die Fälle rk H ≤ rk L + 3.
- Die 𝔽₂-Rechnung kann hier helfen: Die vier Fälle sind Aussagen über Ränge von Abbildungen, die man für eine hypothetische Zerlegung über 𝔽₂ auch maschinell einschränken könnte. Über 𝔽₂ gelten aber Lemma 6 und Lemma 9 nicht (sie brauchen einen unendlichen bzw. algebraisch abgeschlossenen Körper). Das ist also kein direkter Weg.

---

## 8. Was nicht geklappt hat

- **Ziel 26 über 𝔽₂ nicht erreicht**, auch nicht die bekannten 23 oder 25. Bestes Ergebnis 22. Gescheiterter Ansatz in `versuche/s2-spurA-r1/V-S2-02-wang-dp-allein.md`.
- **Bazel nicht nutzbar:** Die Bazel-Registry ist aus der Umgebung gesperrt. Ich habe ohne Bazel gebaut, mit anderen Bibliotheksversionen und glog statt ng-log. Die Regression in 4.2 stimmt bis ⟨2,3,3⟩, ⟨3,2,4⟩ fehlt. Ein Unterschied im Verhalten gegenüber Wangs Originalbau ist nicht ausgeschlossen.
- **Wangs eigene Zertifikate nicht gelesen:** Git LFS über den Proxy verweigert.
- **Block 1 und Block 3 liefen in die Zeitgrenze.** Die Suchschritte bei hoher Schrittgrenze sind auf 4 Kernen zu teuer. Block 3 hat das in Block 2 erzeugte Zertifikat nicht verbessert.
- Ein erster Hintergrundlauf wurde von der Umgebung nach 10 Minuten beendet (falsche Zeitgrenze von mir), ohne Ergebnis. Er ist in den Blöcken oben nicht mitgezählt; die Rechenzeit war etwa 10 Minuten.
- D'Ambrosio (Zenodo), Wang arXiv:2609.06725 und Rudich-Rousseau habe ich nicht im Volltext gelesen, nur Tomars Darstellung davon.

Nichts läuft im Hintergrund weiter. Gesamte Rechenzeit dieser Runde: etwa 90 Minuten Wandzeit auf 4 Kernen (drei Blöcke mit zusammen 68 Minuten, dazu der abgebrochene Hintergrundlauf und die abgebrochene Regression ⟨3,2,4⟩ mit je etwa 10 Minuten), kein Block länger als 28 Minuten.

---

## 9. Vorschläge für Runde 2 (vermutet)

1. **Spur A, strukturell:** die vier Restfälle aus Abschnitt 7 einzeln angreifen, beginnend mit (rk L, rk H) = (3, 6). Das ist der einzige Weg zu einer Schranke über allen Körpern, den ich sehe.
2. **Spur A, 𝔽₂-Tabelle verbessern (nur wenn das Teilergebnis gewollt ist):** Die Tabelle mit sicheren Werten vorbelegen, etwa R_𝔽₂(⟨2,3,4⟩) = 20 für Orbit 76, sobald dieser Wert geprüft ist, und Wangs Substitution mit dieser Tabelle neu laufen lassen. Dazu müsste Wangs Prüfprogramm vorgegebene Schranken als Axiome annehmen, was die Vertrauensbasis ändert. Erst danach lässt sich der Aufwand aus Abschnitt 5 schätzen.
3. **Für Spur B:** Die Grenze aus Abschnitt 6 spricht dafür, Verfahren mit Nenner 2 oder über 𝔽₃ zu suchen, wenn ganzzahlige Suchen ohne Erfolg bleiben.

---

## 10. Meldung für `lit/LIZENZEN.md` (an den Orchestrator)

Vorschlag für eine Tabellenzeile:

| Quelle | Commit | Lizenz | Was wir dürfen | Stand |
|---|---|---|---|---|
| github.com/wcgbg/tensor-rank-lower-bound (Chengu Wang) | 9db3d215267932ba3e8801a10655a2d538ed13d8 | MIT, Copyright (c) 2026 Chengu Wang (Datei `LICENSE` gelesen) | übernehmen mit Lizenzhinweis; in S2-02 nur extern benutzt, nichts kopiert | geklärt am 25.11.2026 (S2-02) |

Die eigenen Dateien in `versuche/s2-spurA-r1/code/` nennen im Kopf Wangs Repo, Commit und Lizenz. Die Zertifikate in `versuche/s2-spurA-r1/daten/` sind Ausgaben von Wangs Programm, keine Kopie seines Codes.
