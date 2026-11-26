# Prüfbericht S4-03 zu B-019

- Auftrag: S4-03 (Stufe 4), Rolle Prüfer
- Gegenstand: `behauptungen/B-019.md`
- Datum: 26.11.2026
- Gelesene Dateien (nur die Positivliste): `CLAUDE.md`, `PROTOKOLL.md` Abschnitt 5, `behauptungen/B-019.md`, `erkundung/s3-04-restfaelle-327.py`, `lean/prosa/yang_n3.md`, `lean/prosa/yang_n4.md`, `lean/YangBounds/YangN3Teil3.lean`, `lean/YangBounds/YangN4Haupt.lean`, Metadaten und Log-Ende des Actions-Jobs 139535850068
- Stand der Dateien: Zweig von `main` bei Commit 2335284. SHA-256 des Programms `83de52bc…a4711`, wie in B-019 angegeben. Die beiden Lean-Dateien und die beiden Prosadateien sind byte-gleich mit Commit ad10846, auf dem der Job 139535850068 lief (geprüft mit `git diff ad10846 HEAD -- <Datei>`). Das Programm gibt es in ad10846 noch nicht; das berührt die Prüfung nicht, weil es nicht gebaut wird.
- Keine Fremdmodell-Anfrage, keine Subagenten, kein Eintrag ins Projektgedächtnis.

---

## 0. Offenlegung: was mir eingeblendet wurde, und Spuren früherer Prüfungen

### 0.1 Eingeblendet aus dem Projektgedächtnis (wörtlich)

Der folgende Index wurde mir beim Start automatisch eingeblendet:

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von &lt;n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 26.11.2026 Version 0.6 (von Justus, Commit c721297, von ihm im Projektchat bestätigt).
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

Einzeleinträge des Gedächtnisses wurden mir nicht eingeblendet, und ich habe keine gelesen. Der Index enthält kein Urteil und keinen Status zu B-019.

### 0.2 Sonst eingeblendet

- Der Inhalt von `CLAUDE.md` (steht auf der Positivliste).
- Die Auftragsnotiz des Orchestrators. Sie nennt den Prüfgegenstand und die Positivliste, kein erwünschtes Ergebnis und nichts darüber, was von meinem Urteil abhängt.
- Projektangaben der Plattform (Projektname, Repo, Dateinamen im Projektordner: `A-01/LIZENZEN.md`, `a07/verfahren-README.md`, `schranken/QUELLEN.md`). Keine davon habe ich geöffnet.

### 0.3 Spuren früherer Prüfungen

Keine Prüfurteile zu B-019 gesehen. Bloße Spuren (Protokoll 5.4):

- `behauptungen/B-019.md` nennt als Verwender „C2 in S3-04 (PR #95)“ und „LI in S3-03 (PR #96)“. Daraus geht hervor, dass die Bedingung in Stufe 3 verwendet wurde, nicht wie die Prüfung ausgehen soll.
- Kopf von `lean/prosa/yang_n3.md` und `lean/prosa/yang_n4.md`: Selbsteinschätzungen der Verfasser („Status: behauptet“, „Kein Prüfer … hat diese Ausarbeitung gelesen“, „keine Lücke gefunden“). Das sind Teile des Artefakts. Ich habe mich nicht darauf gestützt.
- Kopf von `lean/YangBounds/YangN4Haupt.lean`: Angabe des Verfassers zu einem lokalen `#print axioms`. Nicht verwendet; maßgeblich ist der Actions-Job.
- Das Programm `erkundung/s3-04-restfaelle-327.py` nennt in Kommentaren `B-008` und `B-009` als erwartete Ausgaben seiner Proben. Das betrifft andere Behauptungen.

---

## 1. Die zu prüfende Aussage, zerlegt

B-019: „Die Bedingung, die das Programm `erkundung/s3-04-restfaelle-327.py` für n = 3 als C2 (= LI) benutzt, gilt für jede Normalform des Rahmens von `lean/prosa/yang_n4.md` mit d = 2.“

Ich zerlege in vier Teile:

- **T1** Entsprechung der Objekte beider Rahmen bei d = 2 (n = 3), Definition für Definition, einschließlich Räume, Körper und Normalform, in Prosa.
- **T2** Dieselbe Entsprechung in Lean (`YangN3Teil3` gegen `YangN4Haupt`).
- **T3** Lemma I liefert unter dieser Entsprechung genau die Bedingung C2 des Programms, einschließlich der Art, wie das Programm dim N und Δ aus seinen Variablen berechnet.
- **T4** Lemma I in Prosa und Lean ist dieselbe Aussage, und der Lean-Beweis ist nach Abschnitt 5.1 sauber gebaut.

Ergebnis vorab: **T1 hält, T2 hält, T3 hält, T4 hält.** Eine Formulierung in B-019 („H bis aufs Vorzeichen gleich“) ist ungenau, aber unschädlich (Abschnitt 2.4).

---

## 2. T1: Entsprechung in Prosa

Rahmen A ist `yang_n3.md` (Abschnitte 5, 6, 8), Rahmen B ist `yang_n4.md` (Abschnitte 1, 3, 4) mit n = 3, also d = n − 1 = 2.

### 2.1 Zerlegung, Bezeichnungen

Beide Rahmen gehen von derselben Zerlegung (Z) von ⟨n,2,m⟩ aus, mit α_t : K^{n×2} → K, β_t : K^{2×m} → K, C_t ∈ K^{n×m}, und derselben Übersetzung D(A), ℬ, W, (Z′). Bei n = 3 sind die Definitionen wörtlich gleich (A: Abschnitt 1–2; B: Abschnitt 0–1). Indizes ab 0 in beiden.

### 2.2 Normalform und Körper

- Rahmen B, Normalform: nach R1 (K algebraisch abgeschlossen), R2 (kein α_t = 0), Lemma 6: (N1) α_t(e_{0,0}) ≠ 0 für alle t; (N2) für x ≠ 0 sind f_0(x), …, f_{n−1}(x) linear unabhängig, mit f_i(x) := D(e_{i,0}^{(n×2)}) ℬ(x).
- Rahmen A, starke Normalisierung: (SN1) D(e_{0,0}) invertierbar; (SN2) für v ≠ 0 sind f_0(v), f_1(v), f_2(v) linear unabhängig, mit derselben Definition von f_i.

Bei n = 3 ist (N1) = (SN1) und (N2) = (SN2) wörtlich. Lemma I braucht nach Abschnitt 8 von A nur SN1 und SN2 (über Lemma H: SN1, G4; über Lemma B: SN1, SN2) und keinen besonderen Körper. Die Zusatzannahmen der Normalform von B (K algebraisch abgeschlossen, kein α_t = 0) sind stärker als nötig. Jede Normalform von B mit n = 3 ist also eine stark normalisierte Zerlegung im Sinn von A. **Hält.**

Ich habe den Beweis von Lemma I in A selbst nachgerechnet (Lemma H, Schritte 1–4; Lemma B; die Fallunterscheidung S = 0 / S ≠ 0). Er ist richtig: im Fall S ≠ 0 liegt f_0(S) + f_1(S) + f_2(S) in f_0(N), also dim S + 2 ≤ dim N, und mit Lemma H Δ ≥ dim N − dim S ≥ 2; im Fall S = 0 gibt Lemma H direkt Δ ≥ dim N.

### 2.3 Räume und Abbildungen

| Objekt | Rahmen A (n = 3) | Rahmen B (d = 2) | Entsprechung |
|---|---|---|---|
| U | {x ∈ F^{2×m} : Zeile 0 null}, dim m | dasselbe | gleich |
| f_i | D(e_{i,0}) ℬ(·), i = 0, 1, 2 | dasselbe, i = 0, …, n−1 | gleich |
| g | D(e_{0,1})ℬ(x) − D(e_{0,0})ℬ(e_{0,1}x) | dasselbe | gleich (für C2 nicht gebraucht) |
| ker W | K := ker W | ker W | gleich |
| J | f_0(U) | f_0(U) | gleich |
| Q | K / J, q = R − 4m | ker W / J, dim = r − (n+1)m | gleich; bei n = 3 auch dieselbe Zahl |
| F_i | U → Q, [f_i(x)], i = 1, 2 | U → Q, f_i(x) + J, i = 1, …, n−1 | gleich |
| L | U² → Q, F_1(u_1) + F_2(u_2) | U^{n−1} → Q, Σ F_i(u_i) | gleich |
| H | U → Q², x ↦ (F_2(x), −F_1(x)) | U^{∧2} → Q², schiefe Erweiterung von L | H_B = H_A ∘ κ, siehe 2.4 |
| N | ker H_A ⊆ U | (in B nicht benannt) ker H_B ⊆ U^{∧2} | κ(ker H_B) = ker H_A |

### 2.4 Die einzige nichttriviale Stelle: H

In B ist U^{∧2} = {c = (c_{i,j})_{1≤i,j≤2}, c_{i,j} ∈ U : c_{i,i} = 0, c_{j,i} = −c_{i,j}}. Die Bedingung c_{i,i} = 0 ist ausdrücklich gefordert. Damit ist jedes c von der Form [[0, x], [−x, 0]] mit x = c_{1,2} ∈ U, in jeder Charakteristik. Die Abbildung κ : U^{∧2} → U, c ↦ c_{1,2}, ist linear und bijektiv (Umkehrung x ↦ [[0, x], [−x, 0]]; diese Matrix erfüllt beide Bedingungen, auch in Charakteristik 2).

Schiefe Erweiterung von L: H_B(c) = (L(c_{1,:}), L(c_{2,:})) = (L(0, x), L(−x, 0)) = (F_2(x), −F_1(x)) = H_A(κ(c)).

Also H_B = H_A ∘ κ mit einer linearen Bijektion κ. Folgen: rk H_B = rk H_A, und κ bildet ker H_B bijektiv auf N = ker H_A ab, dim ker H_B = dim N = m − rk H.

Zur Formulierung in B-019: „H bis aufs Vorzeichen gleich (F_2, −F_1)“. Mit der Identifikation c ↦ c_{1,2} gilt sogar Gleichheit ohne Vorzeichen; mit der Identifikation c ↦ c_{2,1} entsteht (−F_2, F_1). Die Ungenauigkeit U-5 in `yang_n3.md` betrifft das Vorzeichen im Paper, nicht einen Unterschied zwischen den beiden Prosadateien. Für C2 zählen nur rk H und dim ker H, und die sind unter jeder der beiden Identifikationen gleich. Die Formulierung ist also ungenau, aber für die Aussage ohne Belang.

Wichtig für die Charakteristik 2: Ohne die Bedingung c_{i,i} = 0 wäre U^{∧2} in Charakteristik 2 größer (dim 3m statt m), und dim ker H_B ≠ dim N. B fordert die Bedingung ausdrücklich, Lean ebenso (Abschnitt 3). **T1 hält.**

---

## 3. T2: Entsprechung in Lean

Beide Dateien arbeiten mit `BilinearAlgorithm K n 2 m r` aus `YangBounds.Basic`. `Basic.lean` steht nicht auf meiner Positivliste. Ich habe es nicht gelesen. Für den Vergleich genügt, dass beide Rahmen dieselbe Struktur mit denselben Feldern (`alpha`, `beta`, `coeff`, `correct`) benutzen; bei d = 2 ist `BilinearAlgorithm K (d+1) 2 m r` definitionsgleich mit `BilinearAlgorithm K 3 2 m r` (2 + 1 reduziert zu 3).

| Objekt | `YangN3Teil3` | `YangN4Haupt` (d = 2) | Befund |
|---|---|---|---|
| D(A)t | `avec alg A * t` | `avec alg A * t` | gleich |
| ℬ | `LinearMap.pi alg.beta` | dasselbe | gleich |
| f_i | `prodMap alg (e32 i 0)`, `prodMap` = `LinearMap.pi (α_k(A) • β_k)` | `fv alg i = prodMap alg (eA i 0)`, `prodMap x k = α_k(A) * β_k(x)` | punktweise gleich (`prodMap_apply` in beiden Dateien: `avec alg A * bvec alg x`) |
| W | `∑ k, t k • alg.coeff k` | dasselbe | gleich |
| SN1 / N1 | `∀ k, alg.alpha k (e32 0 0) ≠ 0` | `∀ k, alg.alpha k (eA 0 0) ≠ 0` | gleich |
| SN2 / N2 | `LinearIndependent K ![f 0 v, f 1 v, f 2 v]` | `LinearIndependent K (fun i => fv alg i v)` | gleich: bei d = 2 sind beide Familien `Fin 3 → (Fin r → K)` und stimmen an jeder Stelle überein |
| emb, U | `emb y = Matrix.of ![0, y]` | `abbrev emb := YangN3Teil3.emb` | dieselbe Definition |
| φ_i | `(f alg i).comp emb` | `(fv alg i) ∘ₗ emb` | gleich |
| J | `range (φ alg 0)` | dasselbe | gleich |
| π, Kbar | `J.mkQ`, `(ker W).map π` | dasselbe | gleich |
| F_i | `Fq i = π ∘ φ i`, i ∈ {1, 2} | `Fq i = π ∘ φ i.succ`, i : Fin 2 | n4-`Fq 0` = n3-`Fq 1`, n4-`Fq 1` = n3-`Fq 2` |
| L | `(Fq 1).coprod (Fq 2)` auf U × U | `sumMap Fq` auf Fin 2 → U, `u ↦ ∑ i, Fq i (u i)` | gleiche Abbildung bis auf den Isomorphismus (Fin 2 → U) ≅ U × U; gleiches Bild, also gleicher Rang |
| H | `(Fq 2).prod (−Fq 1)` auf U, Werte in Q̃ × Q̃ | `skewExt (sumMap Fq)` auf `skewSpace K U 2`, Werte in Fin 2 → Q̃ | `Hq c = (Lq (c 0), Lq (c 1)) = (n3-Fq 2 x, −n3-Fq 1 x)` mit x = c 0 1, da `c 0 0 = 0`, `c 1 1 = 0`, `c 1 0 = −c 0 1` |
| skewSpace | — | `(∀ i, c i i = 0) ∧ ∀ i j, c j i = −c i j` | Diagonalbedingung ausdrücklich, wie in der Prosa |
| N | `ker H` ⊆ Fin m → K | — | entspricht ker Hq über c ↦ c 0 1 |

Hier ist Q̃ := (Fin r → K) ⧸ J. Beide Dateien nehmen F_i, L, H mit Werten in Q̃ statt in Q = Kbar. Der Rang einer Abbildung (finrank des Bildes) hängt vom umgebenden Zielraum nicht ab, die Bilder liegen in beiden Dateien in demselben Raum Q̃. Das ändert also weder rk L noch rk H noch dim N, und es ist in beiden Rahmen gleich gemacht.

Eine Lean-Brücke zwischen beiden Rahmen gibt es nicht, wie B-019 selbst sagt. Die Entsprechung ist oben von Hand nachgeprüft, Definition für Definition. Sie ist rein definitorisch, bis auf die beiden linearen Isomorphismen (Fin 2 → U) ≅ U × U und `skewSpace K U 2` ≅ U, c ↦ c 0 1. **T2 hält.**

---

## 4. T3: Lemma I gegen C2 im Programm

### 4.1 Wie das Programm rechnet

In `conditions(n, m, r, rho, rkL, rkH, s)` ist laut Kopfkommentar die Notation die von `yang_n4.md`: rkL = rk L, rkH = rk H, U hat Dimension m. Für n = 3 (d = 2) gilt:

```
dimN = m - rkH
delta = 2 * rkH - rkL
if delta < min(2, dimN):
    return "n3 Lemma I: Delta >= min(2, dim N)"
```

- dimN = m − rkH. In Rahmen A ist N = ker H_A, H_A : U → Q², dim U = m, also nach der Dimensionsformel dim N = m − rk H_A = m − rk H_B (Abschnitt 2.4). In Rahmen B ist m − rk H_B = dim U^{∧2} − rk H_B = dim ker H_B, ebenfalls gleich dim N. Richtig.
- Die Differenz ist nicht negativ: Vor dem n-3-Block prüft das Programm `rkH > d*(d-1)//2*m` (bei d = 2: rkH > m) und verwirft solche Tupel. Wer C2 erreicht, hat rkH ≤ m, also dimN ≥ 0.
- delta = 2·rk H − rk L, ganzzahlig in Python. Das ist Δ aus Abschnitt 8 von A.
- Die Bedingung wird verletzt genau dann, wenn Δ < min(2, dim N). Lemma I sagt Δ ≥ min(2, dim N). Also verwirft C2 genau die Tupel, die Lemma I ausschließt, nicht mehr.
- In der Rolle ⟨3,2,m⟩ (A ist 3×2, U hat Dimension m) passt das Format zu beiden Rahmen. In der Rolle n = 7 wird der Block nicht ausgeführt (`if n == 3`).

### 4.2 Gleichwertigkeit mit der Lean-Form

Lean: `rk L + min 2 (dim N) ≤ 2 · rk H` in ℕ. Programm: verletzt, wenn `2·rkH − rkL < min(2, m − rkH)` in ℤ. Mit dim N = m − rkH ≥ 0 sind beide gleichwertig (Umstellen in ℤ, keine abgeschnittene Subtraktion, weil Lean `finrank N` direkt nimmt). Zusätzlich exakt nachgerechnet für alle 0 ≤ m ≤ 14, 0 ≤ rkH ≤ m, 0 ≤ rkL ≤ 3m+2: Programm-Verletzung und Negation der Lean-Ungleichung stimmen in allen 3720 Fällen überein (Wegwerf-Aufruf in Python, ganze Zahlen).

### 4.3 Was nicht zur Aussage gehört

Die Zeile davor (`rkH != rho + s`, „n3: rk H = rho + s“) und die anderen Bedingungen des Programms sind nicht Gegenstand von B-019 und nicht geprüft. Ebenso nicht, ob die Bedingungen zusammen die Restfälle richtig aufzählen.

**T3 hält.**

---

## 5. T4: Lemma I in Prosa und Lean

### 5.1 Aussagen-Abgleich

- Prosa (`yang_n3.md` §8): Für eine stark normalisierte Zerlegung (SN1, SN2) über einem Körper F gilt Δ ≥ min(2, dim N), Δ = 2·rk H − rk L, N = ker H.
- Lean (`YangN3Teil3.lean`, Zeile 665): `theorem lemma_I (h1 : SN1 alg) (h2 : SN2 alg) : finrank K (range (L alg)) + min 2 (finrank K (N alg)) ≤ 2 * finrank K (range (H alg))`, für jeden Körper K (Variable `[Field K]`), jedes m, r und jede `alg : BilinearAlgorithm K 3 2 m r`.

Die Objekte L, H, N, SN1, SN2 entsprechen den Prosa-Definitionen (Tabelle in Abschnitt 3, Spalte `YangN3Teil3`). Die Ungleichung ist die Prosa-Aussage, nach rk L umgestellt. Keine zusätzlichen Hypothesen, kein Unterschied bei Körper, Format oder Zahl. **Gleiche Aussage.**

### 5.2 Beweis und Bau

- Der Beweis von `lemma_I` folgt der Prosa: Fall `Ssub = ⊥` über `lemma_H`; sonst `lemma_B` auf das Bild von S unter `emb`, Inklusion in f_0(N), Injektivität von φ_0. Er benutzt nur `lemma_H`, `lemma_B`, `φ0_injective`, `emb_injective` aus derselben Datei und mathlib.
- In beiden Lean-Dateien steht `sorry`, `admit`, `axiom` oder `native_decide` nur in Kommentaren (Suche im Quelltext).
- Actions-Job 139535850068 (Lauf 45708303245, Workflow „Lean build (own project lean/)“, Commit ad10846, 25.11.2026 21:52–22:01 UTC): Ergebnis `success`; Schritte „Build library YangBounds (all modules)“, „Report sorry“, „#print axioms for the main theorems“ alle `success`. Das Log-Ende zeigt `TOTAL: STANDARD=56`, alle Hauptsätze nur mit `propext`, `Classical.choice`, `Quot.sound`, darunter `YangBounds.yang_theorem_one` (Theorem 1, ⟨3,2,m⟩).
- Einschränkung: `lemma_I` selbst steht nicht in der Axiomliste des Jobs. Den Inhalt des Schritts „Report sorry“ konnte ich nicht lesen: Das Log-Ende über das Werkzeug reicht nicht so weit zurück, und der Download der ganzen Log-Datei wurde vom Netz-Proxy abgelehnt (403). Ob `yang_theorem_one` über `lemma_I` läuft, kann ich ohne `Statements.lean` (nicht auf der Positivliste) nicht nachsehen. Da die Datei ohne `sorry` gebaut wurde und `lemma_I` nur Sätze derselben, `sorry`-freien Datei benutzt, sehe ich keinen Grund zum Zweifel. Ein ausdrückliches `#print axioms YangBounds.YangN3Teil3.lemma_I` in CI würde das restlos klären.

**T4 hält** (mit der genannten Einschränkung beim Axiom-Bericht).

---

## 6. Urteil

| Teil | Urteil | Kurzbegründung |
|---|---|---|
| T1 Entsprechung in Prosa (Räume, Körper, Normalform) | **hält** | Bei d = 2 gleiche f_i, U, J, Q, F_i, L; (N1), (N2) = (SN1), (SN2); H_B = H_A ∘ κ mit κ(c) = c_{1,2} bijektiv (dank c_{i,i} = 0 auch in Charakteristik 2). Lemma I braucht weder algebraischen Abschluss noch unendlichen Körper |
| T2 Entsprechung in Lean | **hält** | Definitionsgleich bis auf (Fin 2 → U) ≅ U × U und `skewSpace K U 2` ≅ U, c ↦ c 0 1; `emb` ist dieselbe Definition |
| T3 Lemma I = C2 des Programms | **hält** | dimN = m − rkH = dim N, delta = Δ; C2 verwirft genau die Tupel mit Δ < min(2, dim N); in allen 3720 Testfällen gleichwertig zur Lean-Form |
| T4 Prosa = Lean, Bau | **hält** | gleiche Aussage, gleiche Hypothesen; Bau grün, kein `sorry` im Quelltext; `lemma_I` nicht einzeln im Axiom-Bericht |
| **B-019 insgesamt** | **hält** | |

Nebenbefund ohne Folgen für die Aussage: B-019 schreibt „H bis aufs Vorzeichen gleich (F_2, −F_1)“. Genau ist: H_B = H_A ∘ κ mit κ(c) = c_{1,2}, ohne Vorzeichen; mit κ′(c) = c_{2,1} käme ein Vorzeichen hinzu. Rang und Kern sind in beiden Fällen gleich.

Empfehlung (nicht Teil des Urteils): Eine kurze Lean-Brücke, die für d = 2 `finrank (range (Hq alg)) = finrank (range (H alg))` und `finrank (range (Lq alg)) = finrank (range (L alg))` zeigt, würde die Handprüfung aus Abschnitt 3 ersetzen.

Den Status setzt der Orchestrator.
