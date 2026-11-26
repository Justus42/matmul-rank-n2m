# S4-01: Prüfbericht zu B-017 (Restfall-Rechnung ⟨3,2,7⟩, Länge 34, Rolle n = 3)

- Auftrag: S4-01, Rolle Prüfer. Geprüft wird genau `behauptungen/B-017.md`.
- Ich setze keinen Status. Die Urteile unten sind Prüfurteile im Sinne von Protokoll Abschnitt 5, den Status setzt der Orchestrator.
- Gelesen habe ich nur die Dateien der Positivliste: `CLAUDE.md`, `PROTOKOLL.md` Abschnitt 5, `behauptungen/B-017.md`, `erkundung/s3-04-restfaelle-327.py`, `lean/prosa/yang_n4.md`, `lean/prosa/yang_n3.md` (Abschnitte 6 bis 8), `lean/prosa/s2_444_spurA_r2.md` (Abschnitt 3), `lean/YangBounds/YangN4Haupt.lean`, `lean/YangBounds/Lemma13Prime.lean`, `lean/YangBounds/YangN3Teil3.lean`, Actions-Job 139535850068. Zur Feststellung, welche Abschnitte gelesen werden dürfen, habe ich die Überschriftenzeilen von `PROTOKOLL.md`, `yang_n3.md` und `s2_444_spurA_r2.md` aufgelistet. Außerdem habe ich mit `git diff` geprüft, dass die drei Lean-Dateien seit dem gebauten Commit unverändert sind (Abschnitt 4).

---

## 0. Offenlegung: Eingeblendetes und Spuren früherer Prüfungen

### 0.1 Aus dem Projektgedächtnis eingeblendet (wörtlich)

Zu Beginn der Sitzung wurde mir der Index des Projektgedächtnisses eingeblendet:

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von <n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 26.11.2026 Version 0.6 (von Justus, Commit c721297, von ihm im Projektchat bestätigt).
- Person schreibt Deutsch.
- Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
- Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
- Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4 (Fassung 0.6): kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, nicht über Stufe 4 hinaus weiterarbeiten, in Stufe 4 kein anderes Format als 3×2×7. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert werden müsste.
- Protokoll 0.6, Stufe 4 (von Justus am 26.11.2026 gestartet): Budget 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5. Welche Aufträge in welcher Runde laufen dürfen, steht in Abschnitt 3, vor jeder Runde dort nachlesen. Auslegungsfragen: strengere Lesart nehmen, im Logbuch vermerken, weiterarbeiten; nur anhalten und fragen, wenn die strengere Lesart eine Spur oder die Stufe beenden würde. Justus ist nicht ständig erreichbar. README und ergebnisse/ bleiben unverändert. Threads vergeben keine eigenen Subagenten (CLAUDE.md Regel 14), das in jeden Auftrag schreiben.
- Justus am 25.11.2026: kein Zenodo-Release, kein arXiv, kein Kontakt nach außen, das entscheidet er getrennt. Im Repo heißt er „the repository owner“.
- Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
- Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
- Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
- Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
- Protokoll Abschnitt 6: Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
- Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung. Wachen mit wörtlichem Suchprotokoll und Zwischen-Commits, damit die Zeiten aus Git ablesbar sind (Wunsch von Justus, 25.11.2026).
- Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
- Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
- [[verfahren-datenformat]]: Datenformat der Verfahren
- [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht
```

Später in der Sitzung wurden zwei Einzeleinträge eingeblendet (wörtlich, ohne Kopfzeilen):

```
name: lean-upper-3x2x6
description: S1-12: Lean-Datei Upper3x2x6.lean (R(3x2x6) ≤ 30), PR #24; Technik decide +kernel für explizite Verfahren

S1-12, 25.11.2026: `lean/YangBounds/Upper3x2x6.lean`, PR #24 (Merge edb6814).
- Satz `YangBounds.Upper3x2x6.hopcroft_kerr_three_two_six (K) [Field K] : tensorRank K 3 2 6 ≤ 30`, typgleich (rfl) mit der Aussage in Statements.lean. Einsetzen: `import YangBounds.Upper3x2x6`, dann `Upper3x2x6.hopcroft_kerr_three_two_six K`.
- Technik: Tensoridentität über ℤ (`∑ r, u*v*w = [i=s ∧ j=p ∧ q=t]`) mit `decide +kernel` (14 s, kein Zusatzaxiom), dann allgemeiner Übertrag in den Körper. Direktes simp/ring über Matrixliterale mit 30 Produkten läuft in Heartbeat-Timeouts (versuche/V-S1-12-simp-matrixliterale.md).

**How to apply:** Für weitere explizite Verfahren dasselbe Muster nehmen. Verwandt: [[lean-yang-bounds]], [[hk-verfahren-a10]], [[lean-build-cloud]]
```

```
name: hk-verfahren-a10
description: A-10: Verfahrensdateien 3x2x5 r25 und 3x2x6 r30 (ring Z) liegen in verfahren/, PR #11; Formatfallen

A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 (cac2c55).

**How to apply:** Bekannte Verfahren nicht neu bauen; bei neuen Verfahrensdateien Zusatzschlüssel in origin und ungültige Daten meiden (siehe verfahren/README.md Abschnitt 9). Verwandt: [[verfahren-datenformat]]
```

Keiner dieser Einträge enthält ein Urteil oder einen Status zu B-017 oder zu den hier benutzten Lemmata. Der Auftrag selbst nannte kein erwünschtes Ergebnis.

### 0.2 Spuren früherer Prüfungen in den gelesenen Dateien

- `lean/prosa/yang_n4.md`, Kopf: „Status: **behauptet**. Kein Prüfer und kein Fremdmodell hat diese Ausarbeitung gelesen“ und eine Einschätzung des Verfassers („keine mathematische Lücke“). Das ist Teil des Artefakts, ich habe mich nicht darauf gestützt.
- `lean/prosa/s2_444_spurA_r2.md`, Abschnitt 3: „Yangs Satz 2 (R ≥ 25, B-007, geprüft)“. Das betrifft B-007, nicht B-017.
- `erkundung/s3-04-restfaelle-327.py`: Proben mit den Ausgaben „matches B-008“ und „matches B-009“. Kein Urteil, nur Verweise auf andere Behauptungen.
- Zu B-017 selbst habe ich keine Spur einer früheren Prüfung gesehen.

---

## 1. Was B-017 behauptet (zerlegt)

Für eine Zerlegung von ⟨3,2,7⟩ der Länge 34, in der Rolle n = 3, m = 7 (A ist 3×2, dim U = 7, dim Q = 34 − 28 = 6):

- **T1** Unter den Bedingungen der Rechnung bleibt genau ein Tupel (ρ, rk L, rk H) = (4, 6, 4).
- **T2** Dazu gilt s = 0, dim N = 3, Δ = 2, dim S = 1.
- **T3** Ohne Lemma I (die Bedingungen nur für n = 3) wären es zwei Fälle, zusätzlich (3, 5, 3); Lemma I schließt (3, 5, 3) aus.
- **T4** Jede benutzte Bedingung ist richtig aus Prosa und Lean übertragen und gilt in diesem Format (Auftrag).
- **T5** Die Aufzählung ist vollständig (Schleifenbereiche, Randfälle).
- **T6** Das Programm gibt die behauptete Liste aus.
- **T7** Übereinstimmung der Aussage mit den Bedingungslisten B1 bis B9, C1, C2 und der Handrechnung in `erkundung/s3-04-restfaelle-327.md` sowie mit dem zweiten Programm in `erkundung/s3-03-restfaelle-327.md`.

---

## 2. Urteile in Kürze

| Teil | Urteil |
|---|---|
| T1 | **hält** |
| T2 | **hält** (dim S = 1 mit dem Zusatz, dass es aus Lemma H und dem Schluss im Beweis von Lemma I folgt, Abschnitt 3.10) |
| T3 | **hält** |
| T4 | **hält**, mit zwei benannten Hinweisen ohne Einfluss auf das Ergebnis (3.8 und 3.11) |
| T5 | **hält**, mit benannter Ergänzung zur Länge nach Entfernen von Nullformen (3.12) |
| T6 | **hält** |
| T7 | **nicht entscheidbar**: die beiden `.md`-Dateien und das eingebettete Programm standen nicht auf meiner Positivliste |

---

## 3. Begründung je Bedingung

Bezeichnungen wie in `yang_n4.md` Abschnitt 4 und `yang_n3.md` Abschnitt 6: d = n − 1 = 2, U = {x : Zeile 0 von x ist 0}, J = f_0(U), Q = ker W / J, F_i = [f_i] : U → Q (i = 1, 2), L(u_1, u_2) = F_1(u_1) + F_2(u_2), H : U → Q², H(x) = (F_2 x, −F_1 x), N = ker H, ρ = max_γ rk(γ_1 F_1 + γ_2 F_2).

### 3.1 Gleichheit der Objekte für n = 3 in beiden Quellen

`YangN4Haupt.lean` ist für allgemeines d formuliert (`BilinearAlgorithm K (d + 1) 2 m r`), auch d = 2. Dort ist H die schiefe Erweiterung `skewExt (Lq alg)` auf `skewSpace K U 2`. Ein Element von `skewSpace 2` ist durch x = c_{0,1} bestimmt (c_{0,0} = c_{1,1} = 0, c_{1,0} = −x), und `skewExt L c = (L(0, x), L(−x, 0)) = (F_2 x, −F_1 x)`. Das ist genau `YangN3Teil3.H`. J, π, Kbar und Fq sind in beiden Dateien wörtlich gleich gebaut (`YangN4Haupt` nimmt `emb` aus `YangN3Teil3`). SN1 ist wörtlich gleich, SN2 ist für d = 2 dieselbe lineare Unabhängigkeit von f_0(v), f_1(v), f_2(v). Damit sind ρ, rk L, rk H, dim N in beiden Dateien dieselben Zahlen. **Hält.** Ein Lean-Satz, der beide Dateien formal verbindet, existiert nicht; für B-017 (eine Rechnung, kein Lean-Satz) ist das kein Mangel, für eine spätere Formalisierung wäre es ein Schritt.

### 3.2 q = dim Q = r − (n+1)m = 6

Prosa: `yang_n4.md` Lemma 4.1(iii), `yang_n3.md` Lemma C. Lean: `YangN4Haupt.finrank_Kbar : finrank Kbar + (d + 2) * m = r` (braucht SN1), `YangN3Teil3.finrank_Kbar : … + 4 * m = r`. Für r = 34, m = 7: q = 6. **Hält.**

### 3.3 Triviale Schranken im Programm

- 0 ≤ ρ ≤ m: ρ ist Rang einer Abbildung auf U, dim U = m. Hält.
- ρ ≤ rk L: Bild von γ_1F_1 + γ_2F_2 liegt in im L. Hält.
- rk L ≤ q: im L ⊆ Q (`range_Lq_le_Kbar`, `rank_L_le_q`). Hält.
- rk H ≤ d(d−1)/2·m = m: Definitionsbereich hat Dimension m. Hält.
- rk H ≤ d·rk L: im H ⊆ (im L)^d. Hält (für d = 2 nie wirksam).
- 0 ≤ s ≤ min((d−1)(m−ρ), rk L): s = dim F′_2(ker G) mit dim ker G = m − ρ; F′_2(ker G) ⊆ im L. Hält.

Alle diese Schranken sind wahre Aussagen über jede Zerlegung, sie schließen also nichts Mögliches aus.

### 3.4 Gleichung (2): (n−1)(r − (n+2)m) ≥ rk H − rk L

Prosa: `yang_n4.md` Folgerung aus Lemma 10, `yang_n3.md` Ungleichung (G): 2m + rk H ≤ rk L + 2q. Mit q = r − 4m ist das 2(r − 5m) ≥ rk H − rk L, also dieselbe Ungleichung. Lean: `YangN4Haupt.ineq1` (`d * m + rk H ≤ rk L + d * dim Kbar`, nur SN1) und `YangN3Teil3.ineq_G`. Hier: rk L ≥ rk H + 2. **Hält.**

### 3.5 Lemma 11: 2 rk H ≥ (d−1) rk L

Für d = 2: 2 rk H ≥ rk L. Prosa: `yang_n4.md` Lemma 11 (d ≥ 1, jede Charakteristik), `yang_n3.md` Lemma G. Lean: `YangN3Teil3.lemma_G`. **Hält.** Im Ergebnis überflüssig (folgt aus 3.6 und 3.9).

### 3.6 Lemma 13′: 2 rk H ≥ dρ + 2s + (d−2) rk L

Die Prosa-Fassung (`s2_444_spurA_r2.md` Abschnitt 4) stand nicht auf meiner Liste; ich habe die Lean-Fassung gelesen. `Lemma13Prime.lemma13Prime` gilt für `e + 2` Abbildungen, also auch e = 0 (d = 2): `(e+2)·ρ + 2·sDim G F + e·rk L ≤ 2·rk H` für einen maximierenden γ. Voraussetzung nur `FiniteDimensional K Q`, kein spezieller Körper. sDim G F = dim Σ_i F_i(ker G). Für d = 2 ist das gleich dim F′_2(ker G) (auf ker G sind F_1 und F_2 Vielfache von F′_2, und F′_2 ist Kombination von F_1, F_2), also das s des Programms. Die Formel im Programm `2 rkH ≥ d rho + 2 s + (d-2) rkL` ist die Lean-Formel mit d = e + 2. Für d = 2: rk H ≥ ρ + s. **Hält.**

### 3.7 Lemma 14: ρ ≥ n − 1, falls m ≥ n − 1

Prosa: `yang_n4.md` Lemma 14 (nur m ≥ n − 1 nötig). Lean: `YangN4Haupt.lemma14 (hm : d ≤ m)`, SN1, SN2, beliebiger Körper. Hier 2 ≤ 7, also ρ ≥ 2. **Hält.**

### 3.8 Lemma 8′: rk L ≥ n − 1

Prosa: `yang_n4.md` Lemma 8′. Lean: `YangN4Haupt.lemma8' (hm : 1 ≤ m)`. rk L ≥ 2. **Hält.** Hinweis: im Programm ist die Bedingung an `m >= 1` gebunden, das entspricht genau der Lean-Voraussetzung.

### 3.9 Lemma 15(a) und 15(b)

(a) rk L ≤ dρ: `yang_n4.md` Lemma 15(a), Lean `lemma15a`, reine lineare Algebra. Hält.

(b) rk L = dρ ⇒ ρ = m (und dann rk L = dm): `yang_n4.md` Lemma 15(b) mit n ≥ 3 und K algebraisch abgeschlossen; Lean `lemma15b [IsAlgClosed K] … (hd : 2 ≤ d)`. Für n = 3 ist d = 2, die Voraussetzung ist erfüllt (der Beweis braucht zwei verschiedene Indizes, genau d ≥ 2). Die Bedingung im Programm `rkL == d*rho and not (rho == m and rkL == d*m)` ist genau diese Implikation. Algebraisch abgeschlossen: Übergang zum algebraischen Abschluss ändert die Länge nicht (`yang_n4.md` R1; in Lean `alg.baseChange (AlgebraicClosure K)` in `yang_theorem_two_algorithm_of_lemma13`). Hier wäre rk L = 14 > 6 nötig, also folgt rk L ≤ 2ρ − 1. **Hält.**

### 3.10 Block n = 3

(i) **rk H = ρ + s** (im Programm „d = 2 exact“). In keiner gelesenen Quelle steht diese Gleichung wörtlich; ich habe sie selbst hergeleitet. Nach dem Basiswechsel aus Lemma 13, Schritt 1 (`yang_n4.md`), mit G = F′_1 vom Rang ρ, ändern sich rk L und rk H nicht (Prosa dort; Lean `range_sumMap_mixF_le` und `finrank_range_skewExt_mixF_le`, benutzt in `lemma13Prime_of_gamma`). Der Kern von H ist ker F_1 ∩ ker F_2 = ker F′_1 ∩ ker F′_2 (ξ invertierbar). Dessen Dimension ist dim ker G − dim F′_2(ker G) = (m − ρ) − s. Mit dem Rangsatz für H : U → Q²: rk H = m − (m − ρ − s) = ρ + s. **Hält.** Für das Ergebnis T1 ist sie nicht nötig: meine Nachrechnung ohne diese Gleichung ergibt dieselbe Liste (Abschnitt 5). Sie legt nur s fest; s = 0 folgt aber auch schon aus Lemma 13′ (rk H ≥ ρ + s) im Restfall ρ = rk H = 4.

(ii) **dim N = m − rk H**: Rangsatz für H, dim U = m (`yang_n3.md` Folgerung (G), Beweis). Hält.

(iii) **Lemma I: Δ = 2 rk H − rk L ≥ min(2, dim N)**: `yang_n3.md` Lemma I; Lean `YangN3Teil3.lemma_I : rk L + min 2 (dim N) ≤ 2 * rk H` unter SN1, SN2, ohne Bedingung an m und ohne algebraischen Abschluss. Die Programmzeile `delta < min(2, dimN)` ist genau die Negation. **Hält.**

(iv) **dim S** (`n3_extra`, nur Ausgabe, keine Bedingung): untere Grenze dim N − Δ aus Lemma H (`yang_n3.md` Lemma H, Lean `lemma_H`); Ausschluss 0 < dim S < dim N − 1 aus dem Schluss im Beweis von Lemma I (S ≠ 0 ⇒ dim S + 2 ≤ dim N, mit Lemma B; im Lean-Beweis von `lemma_I` als Zwischenschritt, nicht als eigener Satz). Für dim N = 3, Δ = 2: dim S ≥ 1 und dim S ≤ 1, also dim S = 1. **Hält.**

### 3.11 Hinweis zur Programmtechnik

`residual_without_n3` ersetzt die globale Funktion `conditions` vorübergehend. Weil der n-3-Block der letzte geprüfte Block vor dem (hier abgeschalteten) Satz-B-Block ist, heißt „Rückgabe beginnt mit n3 → None“ genau „alle übrigen Bedingungen erfüllt“. Das ist richtig, aber zerbrechlich: eine später hinter den Block gesetzte Bedingung würde stillschweigend mit abgeschaltet. Kein Einfluss auf B-017.

### 3.12 Länge nach dem Normalisieren

Die Bedingungen gelten für die normalisierte Zerlegung. `YangN4Haupt.exists_normalized` liefert eine Länge r′ ≤ r (Nullformen werden entfernt). Die Rechnung setzt r = 34 ein. Das ist zulässig, weil für alle r′ ≤ 33 unter denselben Bedingungen kein Tupel übrig bleibt (Programm, Probe 3: kleinstes r mit Restfall ist 34; meine Nachrechnung: kein Fall für r = 0 bis 33). Also hat die normalisierte Zerlegung wieder Länge 34. Das sagt B-017 nicht ausdrücklich; die Aussage gilt mit dieser Ergänzung (**hält mit benannter Ergänzung**, inhaltlich keine Reparatur nötig).

---

## 4. Lean-Bau (Actions-Job 139535850068)

- Lauf 45708303245, Workflow „Lean build (own project lean/)“, Commit `ad1084640af775eebd7ec6e4a173e09e7a6997b9` auf `main`, Ergebnis **success**, 2026-11-25 21:52 bis 22:01 UTC.
- Log: `✔ Built YangBounds.Lemma13Prime`, `✔ Built YangBounds.YangN3Teil3`, `✔ Built YangBounds.YangN4Haupt`, `Build completed successfully.`
- `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`, `SORRY: 0 'sorry' token(s) in the sources outside comments`.
- Axiome: `'YangBounds.Lemma13Prime.lemma13Prime' depends on axioms: [propext, Classical.choice, Quot.sound]`. Theorem 1 (Yang n = 3, stützt sich auf `lemma_I`, `lemma_H`, `ineq_G`) und Theorem 2 (stützt sich auf `ineq1`, `lemma8'`, `lemma14`, `lemma15b`) jeweils „only propext, Classical.choice, Quot.sound“. `#print axioms` für die Einzellemmata `lemma_I`, `lemma14`, `lemma15b` steht nicht im Log; sie gehen in die genannten Hauptsätze ein, und die Dateien enthalten keine `axiom`-Deklaration.
- `git diff ad10846 HEAD` über `YangN4Haupt.lean`, `Lemma13Prime.lean`, `YangN3Teil3.lean`, `YangN4Lemma13.lean`, `Basic.lean` und die Lake-Dateien ist leer: die gelesenen Dateien sind die gebauten.

---

## 5. Unabhängige Nachrechnung

Eigenes Programm (Anhang A), unabhängig vom Programm des Artefakts geschrieben, direkt aus den Ungleichungen in Abschnitt 3 und in der Form der Lean-Sätze (z. B. (G) statt (2), Lemma I als `rk L + min(2, dim N) ≤ 2 rk H`). Alle vier Größen ρ, rk L, rk H, s laufen absichtlich über 0 bis 3m = 21, weit über die natürlichen Grenzen, damit kein Schleifenbereich etwas abschneidet. Laufzeit 37 s.

Ausgabe:

```
r=34 full: {(4, 6, 4): [0]}
r=34 without Lemma I: {(3, 5, 3): [0], (4, 6, 4): [0]}
r=34 without Lemma I and without equality: {(3, 5, 3): [0], (4, 6, 4): [0]}
r=34 without equality: {(4, 6, 4): [0]}
no case for r <= 33
dimN 3 Delta 2 dimS [1]
```

Kontrolle für m = 2 bis 11: das kleinste r mit Restfall ist jeweils ⌈(24m + 2)/5⌉ (Yang Satz 1), also widersprechen die Bedingungen nicht der bekannten Schranke und sind nicht schärfer als sie für diese m.

Handrechnung (r = 34, m = 7, q = 6):
1. (G): rk L ≥ rk H + 2. Mit rk L ≤ 6: rk H ≤ 4.
2. Lemma 13′: ρ + s ≤ rk H ≤ 4.
3. dim N = 7 − rk H ≥ 3, also Lemma I: rk L ≤ 2 rk H − 2. Mit 1: rk H + 2 ≤ 2 rk H − 2, also rk H ≥ 4. Also rk H = 4 und rk L = 6.
4. Lemma 15(b): rk L ≤ 2ρ − 1, also ρ ≥ 4; mit 2: ρ = 4, s = 0.
5. Ohne Lemma I: rk H = 2 gibt rk L = 4, ρ ≤ 2, 2ρ − 1 ≤ 3 < 4, kein Fall. rk H = 3 gibt rk L ∈ {5, 6}, ρ ≤ 3, also rk L ≤ 5: (3, 5, 3) mit s = 0. rk H = 4 gibt (4, 6, 4). Lemma 14 (ρ ≥ 2) und Lemma 8′ (rk L ≥ 2) greifen nicht zusätzlich.
6. (3, 5, 3): dim N = 4, Δ = 1 < min(2, 4) = 2, Lemma I schließt aus. (4, 6, 4): dim N = 3, Δ = 2 ≥ 2, bleibt.

Ergebnis stimmt mit dem Programm des Artefakts überein: Programmlauf (`python3 erkundung/s3-04-restfaelle-327.py`, SHA-256 der Datei `83de52bc…a4711` wie in B-017) gibt für die Rolle n = 3 aus:

```
<3,2,7> r=34 q=6 d=2: 1 residual (rho,rkL,rkH) cases
  rho=4 rkL=6 rkH=4 s in [0]  dimN=3 Delta=2 dimS in [1]
   same role without the n=3 conditions of Yang Section 4.1:
  rho=3 rkL=5 rkH=3 s in [0]
  rho=4 rkL=6 rkH=4 s in [0]
```

Alle Proben des Programms (B-008, B-009, kleinstes r, echte Verfahren) laufen ohne Assertion-Fehler durch.

---

## 6. Was dieser Bericht nicht leistet

- T7: Ob die Bedingungslisten B1 bis B9, C1, C2 und die Handrechnung in `erkundung/s3-04-restfaelle-327.md` sowie das Programm `restfaelle.py` in `erkundung/s3-03-restfaelle-327.md` mit dem Programm übereinstimmen, konnte ich nicht prüfen (nicht auf der Positivliste). Die Zahlen in den beiden Zitaten von B-017 stimmen mit meiner Rechnung überein.
- Die Prosa zu Lemma 13′ (`s2_444_spurA_r2.md` Abschnitt 4) habe ich nicht gelesen; geprüft habe ich die Lean-Fassung und den grünen Bau.
- Die Rolle n = 7 (transponiert), die das Programm ebenfalls ausgibt, ist nicht Teil von B-017 und nicht geprüft.
- B-017 ist eine Aussage über eine hypothetische Zerlegung der Länge 34; sie sagt nichts darüber, ob der Restfall (4, 6, 4) tatsächlich vorkommt.

---

## Anhang A: Programm der Nachrechnung (Python 3, ohne Abhängigkeiten)

```python
# Independent recount for <3,2,m>, role n = 3 (d = 2), length r. Exact integers only.
# Variables: rho, rkL, rkH, s, dimN; deliberately wide loops (up to 3m) to test range limits.
def admissible(m, r, rho, rkL, rkH, s, use_I=True, use_eq=True):
    q = r - 4*m                      # dim Q (Lemma C / finrank_Kbar)
    if q < 0: return False
    if not (0 <= rho <= m): return False                 # rho = rank of a map U -> Q
    if not (0 <= rkL <= q): return False                  # im L in Q
    if not (0 <= rkH <= m): return False                  # H : U -> Q^2, dim U = m
    if not (0 <= s <= m - rho): return False              # s = dim F2'(ker G), dim ker G = m - rho
    if rho > rkL: return False                            # im G in im L
    if 2*m + rkH > rkL + 2*q: return False                # (G) / ineq1 with d = 2
    if 2*rho + 2*s > 2*rkH: return False                  # Lemma 13' (e = 0)
    if use_eq and rkH != rho + s: return False            # rank of (F1,F2) = rk G + dim F2'(ker G)
    if m >= 2 and rho < 2: return False                   # Lemma 14 (d = 2 <= m)
    if m >= 1 and rkL < 2: return False                   # Lemma 8'
    if rkL > 2*rho: return False                          # Lemma 15(a)
    if rkL == 2*rho and rho != m: return False            # Lemma 15(b)
    dimN = m - rkH
    if use_I and rkL + min(2, dimN) > 2*rkH: return False # Lemma I (YangN3Teil3.lemma_I)
    return True

def cases(m, r, **kw):
    out = {}
    for rho in range(0, 3*m+1):
        for rkL in range(0, 3*m+1):
            for rkH in range(0, 3*m+1):
                for s in range(0, 3*m+1):
                    if admissible(m, r, rho, rkL, rkH, s, **kw):
                        out.setdefault((rho, rkL, rkH), []).append(s)
    return out

if __name__ == "__main__":
    print("r=34 full:", cases(7, 34))
    print("r=34 without Lemma I:", cases(7, 34, use_I=False))
    print("r=34 without Lemma I and without equality:", cases(7, 34, use_I=False, use_eq=False))
    print("r=34 without equality:", cases(7, 34, use_eq=False))
    for r in range(0, 34):
        assert not cases(7, r), r
    print("no case for r <= 33")
    # dim S for the surviving case: Lemma H (dim S >= dim N - Delta), Lemma I proof (S != 0 => dim S + 2 <= dim N)
    for (rho, rkL, rkH), ss in cases(7, 34).items():
        dimN = 7 - rkH; D = 2*rkH - rkL
        S = [k for k in range(0, dimN+1) if k >= dimN - D and (k == 0 or k + 2 <= dimN)]
        print("dimN", dimN, "Delta", D, "dimS", S)
    # cross-check other m against Yang's Theorem 1 bound ceil((24m+2)/5)
    for m in range(2, 12):
        rmin = min(r for r in range(0, 10*m) if cases(m, r))
        print(m, rmin, -(-(24*m+2)//5))
```
