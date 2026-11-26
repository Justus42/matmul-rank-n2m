# Prüfbericht S4-02: B-018 (Lemma 15(b) bei d = 2)

- Auftrag: S4-02 (Stufe 4), Rolle Prüfer
- Geprüfte Behauptung: `behauptungen/B-018.md`
- Begonnen: 2026-11-26 (erster Commit dieses Berichts)
- Dieser Bericht setzt keinen Status. Er enthält nur Urteile je Teil der Aussage

---

## 0. Offenlegung: Eingeblendetes und Spuren

### 0.1 Was mir eingeblendet wurde

Ohne mein Zutun wurde mir zu Beginn der Sitzung Folgendes eingeblendet:

1. `CLAUDE.md` vollständig (steht ohnehin auf meiner Positivliste).
2. Ein Hinweis auf die E-Mail-Adresse des Kontos von Justus. Ich gebe sie hier nicht wieder, weil das Repo öffentlich ist; für die Prüfung ist sie ohne Belang.
3. Der Index des Projektgedächtnisses (`MEMORY.md`), wörtlich:

> # Projekt: Matrizen-Multiplikation
> - Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
> - Ziel: exakter Tensorrang von <n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 26.11.2026 Version 0.6 (von Justus, Commit c721297, von ihm im Projektchat bestätigt).
> - Person schreibt Deutsch.
> - Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
> - Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
> - Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4 (Fassung 0.6): kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, nicht über Stufe 4 hinaus weiterarbeiten, in Stufe 4 kein anderes Format als 3×2×7. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert werden müsste.
> - Protokoll 0.6, Stufe 4 (von Justus am 26.11.2026 gestartet): Budget 6 Runden mit je bis zu 6 Subagenten, Fremdmodell nur nach 5.5. Welche Aufträge in welcher Runde laufen dürfen, steht in Abschnitt 3, vor jeder Runde dort nachlesen. Auslegungsfragen: strengere Lesart nehmen, im Logbuch vermerken, weiterarbeiten; nur anhalten und fragen, wenn die strengere Lesart eine Spur oder die Stufe beenden würde. Justus ist nicht ständig erreichbar. README und ergebnisse/ bleiben unverändert. Threads vergeben keine eigenen Subagenten (CLAUDE.md Regel 14), das in jeden Auftrag schreiben.
> - Justus am 25.11.2026: kein Zenodo-Release, kein arXiv, kein Kontakt nach außen, das entscheidet er getrennt. Im Repo heißt er „the repository owner“.
> - Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
> - Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
> - Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
> - Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
> - Protokoll Abschnitt 6: Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
> - Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung. Wachen mit wörtlichem Suchprotokoll und Zwischen-Commits, damit die Zeiten aus Git ablesbar sind (Wunsch von Justus, 25.11.2026).
> - Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
> - Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
> - [[verfahren-datenformat]]: Datenformat der Verfahren
> - [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht

4. Ein einzelner Gedächtniseintrag `aussagen-abgleich-n3`, wörtlich:

> ---
> name: aussagen-abgleich-n3
> description: Praxis-Hinweise zu Bridge und lokalem Lean-Bau für Teilziele
> metadata:
>   type: project
> ---
>
> - Bridge-Hinweis: Das Repo matmul-rank-n2m ist in der Bridge NICHT freigegeben (`repo`/`files` scheitern). Dateien wörtlich in `prompt` einfügen. Batch war nach ~1 min fertig.
> - Lean lokal: Toolchain über GitHub-Release; eine Prüfdatei braucht `import YangBounds.Statements` (YangBounds.olean wird bei Teilziel nicht gebaut).
> Verwandt: [[lean-build-cloud]]

Keiner dieser Texte enthält ein Urteil zu B-018 oder ein erwünschtes Ergebnis. Den Hinweis „Toolchain über GitHub-Release“ habe ich für den lokalen Zusatzlauf (Abschnitt 4.2) genutzt.

### 0.2 Spuren und Abweichungen

- Zu Beginn habe ich einmal `ls` im Wurzelverzeichnis des Repos ausgeführt, um meinen Zweig anzulegen. Dabei sah ich die Verzeichnisnamen (u. a. `pruefer`, `pruefvermerke`, `erkundung`, `archiv`), keine Inhalte. Das war eine Verzeichnisliste, die der Auftrag ausschließt; ich lege sie offen.
- Um festzustellen, ob die Lean-Dateien seit dem gebauten Commit `ad10846` geändert wurden, habe ich `git diff --stat ad10846 HEAD -- lean/ .github/` ausgeführt. Ergebnis: unter `lean/` nur meine eigene Berichtsdatei neu; außerdem eine neue Datei `.github/workflows/zweitlauf.yml` (Name gesehen, Inhalt nicht gelesen). Ein Verzeichnisname `lean/Zweitlauf` stand in einer Ausgabe von `ls lean/`. Ob das mit früheren Prüfungen zusammenhängt, weiß ich nicht.
- `B-018.md` nennt Dateien unter `erkundung/` (S3-03, S3-04) und zitiert daraus die Zahlenform. Die Dateien selbst habe ich nicht gelesen (gesperrt).
- Die Prosadatei nennt `behauptungen/B-001.md`; nicht gelesen.
- Der Kopf von `lean/prosa/yang_n4.md` sagt „Status: behauptet. Kein Prüfer und kein Fremdmodell hat diese Ausarbeitung gelesen“. Das ist eine Aussage des Verfassers, kein Prüfurteil. Ein Urteil zu B-018 habe ich vor meinem eigenen nicht gesehen.
- Das Job-Protokoll (Abschnitt 4) enthält eine Liste von Hauptsätzen mit Axiomenbericht; dort stehen keine Urteile zu B-018.

---

## 1. Die Aussage von B-018, in Teile zerlegt

- **T1 (Prosa):** Lemma 15(b) aus `lean/prosa/yang_n4.md` gilt für n = 3 (d = 2): Unter den Voraussetzungen des Abschnitts 3/4 (K algebraisch abgeschlossen, Zerlegung von ⟨n,2,m⟩ mit (N1), (N2)) folgt aus rk L = (n−1)·ρ, dass ρ = m und rk L = (n−1)·m.
- **T2 (Lean-Aussage):** Der Lean-Satz `lemma15b` (Zeile 878) ist diese Aussage: richtige Objekte, richtiger Körper mit seinen Voraussetzungen, richtige Zahl, Voraussetzungen des Satzes, und er ist für d = 2 anwendbar.
- **T3 (Bau):** Job 139535850068 hat die Datei ohne `sorry` gebaut.
- **T4 (Zahlenform):** „rk L = d·ρ ⇒ ρ = m“ mit Voraussetzung „n ≥ 3 bzw. d ≥ 2, K algebraisch abgeschlossen“ folgt aus dem Satz.

---

## 2. T1: Prosa-Beweis bei n = 3, Schritt für Schritt

Gelesen: `lean/prosa/yang_n4.md` Abschnitte 1 bis 6, insbesondere Lemma 15 und Lemma 9 sowie alles, was beide benutzen (G1, G5, G6, Folgerung 7, (N1), (N2), Definitionen von U, J, Q, F_i, L, ρ). Ich setze n = 3, also gibt es genau zwei Abbildungen F_1, F_2 : U → Q, dim U = m.

**Voraussetzungen der benutzten Hilfsaussagen bei n = 3.**
- Abschnitt 3 setzt nur n, m ≥ 1, K unendlich und kein α_t = 0 voraus; Abschnitt 4 setzt n ≥ 2 voraus. n = 3 erfüllt beides.
- G1 (ℬ injektiv) benutzt nur A = e_{0,0}, e_{0,1}: gilt für jedes n ≥ 1. G5 aus (N1) und G1. G6 ist eine Umformung mit D(e_{0,0})^{−1}, braucht (N1). Folgerung 7 ist (N2) wörtlich. Alles unabhängig von n.
- Die Überschrift „Lemma 9 (nur für n = 4 gebraucht)“ betrifft nur, wo der Satz 2 es braucht. Der Beweis von Lemma 9 benutzt kein n ≥ 4: Er braucht einen Index i ≠ 0 (bei n = 3 sind das i = 1, 2), (N1) über G5/G6, (N2) über Folgerung 7 und einen Eigenvektor eines Endomorphismus des endlichdimensionalen Raums V ≠ 0 über algebraisch abgeschlossenem K. Ich habe den Beweis nachgerechnet: P_i bildet V = f_0(S) nach G6 auf f_i(S) ⊆ V ab; Eigenvektor w = f_0(s), s ≠ 0 wegen w ≠ 0; dann f_i(s) − λ f_0(s) = 0 im Widerspruch zu Folgerung 7 mit γ = e_i − λe_0 ≠ 0. **Trägt bei n = 3.**

**Lemma 15(a) bei n = 3.** im L = im F_1 + im F_2, also rk L ≤ rk F_1 + rk F_2 ≤ 2ρ, weil rk F_i = rk(Σγ_jF_j) mit γ = e_i ≤ ρ. Trägt.

**Lemma 15(b) bei n = 3.**
1. Aus rk L = 2ρ und rk L ≤ rk F_1 + rk F_2 ≤ 2ρ folgt Gleichheit überall: rk F_1 = rk F_2 = ρ und dim(im F_1 + im F_2) = dim im F_1 + dim im F_2, also im F_1 ∩ im F_2 = 0. Trägt.
2. σ = F_1 + F_2, N = ker F_1 ∩ ker F_2. Ist σ(v) = 0, so F_1(v) = −F_2(v) ∈ im F_1 ∩ im F_2 = 0, also v ∈ N; umgekehrt N ⊆ ker σ. Also ker σ = N. Mit γ = (1,1): rk σ ≤ ρ, also dim N = m − rk σ ≥ m − ρ = dim ker F_i; mit N ⊆ ker F_i folgt N = ker F_1 = ker F_2. Trägt (keine Division, jede Charakteristik).
3. Sei v ∈ N (⊆ U) und i ∈ {1, 2}. F_i(v) = 0 heißt f_i(v) ∈ J = f_0(U), also f_i(v) = f_0(u_i) mit u_i ∈ U. Nach G6 ist ℬ(u_i) = D(e_{0,0})^{−1}D(e_{i,0})ℬ(v). Für i ≠ j: f_j(u_i) = D(e_{j,0})D(e_{0,0})^{−1}D(e_{i,0})ℬ(v) = f_i(u_j), da Diagonalmatrizen vertauschen. Also F_j(u_i) = F_i(u_j) ∈ im F_j ∩ im F_i = 0, also u_i ∈ ker F_j = N. Bei n = 3 ist für i = 1 der Partner j = 2 und für i = 2 der Partner j = 1; das ist genau die Stelle, an der n ≥ 3 (d ≥ 2) gebraucht wird, und bei d = 2 ist sie erfüllt. Damit f_i(v) = f_0(u_i) ∈ f_0(N), also f_i(N) ⊆ f_0(N) für i = 1, 2. Trägt.
4. N ist ein Unterraum von U ⊆ K^{2×m}. Wäre N ≠ 0, widerspräche Schritt 3 dem Lemma 9 (mit S = N, i = 1). Also N = 0, dim ker F_i = 0, ρ = rk F_i = m und rk L = 2ρ = 2m. Trägt.

Randfall m = 0: dann U = 0, ρ = 0 = m; die Aussage gilt trivial.

**Urteil T1: hält.** Der Prosa-Beweis von Lemma 15(b) trägt für n = 3 Schritt für Schritt, unter den Voraussetzungen, unter denen er steht: K algebraisch abgeschlossen und die Zerlegung erfüllt (N1) und (N2). Diese beiden Normalisierungsannahmen gehören zur Aussage (siehe T4).

---

## 3. T2: Ist der Lean-Satz die behauptete Aussage?

Gelesen: `lean/YangBounds/YangN4Haupt.lean` vollständig im Bereich der benutzten Definitionen (Zeilen 1 bis 530, 800 bis 925, 1341 bis 1407). Die Datei ist seit dem gebauten Commit `ad10846` unverändert (`git diff`, siehe 0.2); `lemma15b_core` steht dort auf Zeile 235, `lemma15b` auf Zeile 878, wie in B-018 angegeben.

Wortlaut:

```lean
theorem lemma15b [IsAlgClosed K] (h1 : SN1 alg) (h2 : SN2 alg) (hd : 2 ≤ d) {ρ : ℕ}
    (hρ : IsGreatest (Set.range (rkComb (Fq alg))) ρ)
    (hL : finrank K (LinearMap.range (Lq alg)) = d * ρ) : ρ = m
```

mit `variable {K : Type u} [Field K] {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r)`.

Abgleich Objekt für Objekt (Prosa ↔ Lean), jeweils an den Definitionen in derselben Datei geprüft:

| Prosa | Lean | Befund |
|---|---|---|
| Format ⟨n,2,m⟩, n = d+1 | `BilinearAlgorithm K (d + 1) 2 m r` | Bei d = 2 ist das ⟨3,2,m⟩. m und r frei. Stimmt |
| K Körper, algebraisch abgeschlossen | `[Field K]`, `[IsAlgClosed K]` | Stimmt. Keine weitere Voraussetzung an K (keine Charakteristik, kein „unendlich“ nötig, folgt ohnehin) |
| D(A), ℬ, W, (Z′) | `avec`, `bvec = LinearMap.pi alg.beta`, `W t = Σ t_k • alg.coeff k`; `W_mul` beweist W(D(A)ℬ(x)) = A·x aus `alg.correct` | Stimmt mit (Z′) |
| f_i(x) = D(e_{i,0})ℬ(x) | `fv alg i = prodMap alg (eA i 0)`, Eintrag k: α_k(e_{i,0})·β_k(x) | Stimmt |
| (N1) α_t(e_{0,0}) ≠ 0 ∀t | `SN1 alg := ∀ k, alg.alpha k (eA 0 0) ≠ 0` | Stimmt |
| (N2) f_0(x), …, f_{n−1}(x) lin. unabh. für x ≠ 0 | `SN2 alg := ∀ v ≠ 0, LinearIndependent K (fun i => fv alg i v)`, i : Fin (d+1) | Stimmt (alle n = d+1 Indizes) |
| U = {x : Zeile 0 = 0}, dim m | Parametrisierung `emb : (Fin m → K) → K^{2×m}`, `emb_apply_zero`/`emb_apply_one` (per `rfl`): Zeile 0 = 0, Zeile 1 = y; `emb_injective` | Stimmt (U als Bild von emb, Isomorphismus) |
| J = f_0(U) | `J alg = range (φ alg 0)`, φ i = fv i ∘ emb | Stimmt |
| Q = ker W / J, F_i : U → Q | `Fq i = π ∘ φ (i.succ)` mit Ziel `(Fin r → K) ⧸ J` statt Q | Abweichung ohne Folgen: Bild liegt in Q (`range_Lq_le_Kbar`), Ränge (`finrank` des Bildes) sind dieselben. Index i : Fin d ↔ Prosa-Index i+1 |
| L(u) = Σ F_i(u_i) | `Lq = sumMap (Fq alg)` | Stimmt |
| ρ = max_γ rk(Σγ_iF_i), γ ∈ K^{n−1} | `IsGreatest (Set.range (rkComb (Fq alg))) ρ`, `rkComb F γ = finrank (range (Σ γ_i • F_i))`, γ : Fin d → K | Stimmt (größtes Element = Maximum; Existenz: `exists_isGreatest_rkComb`) |
| n ≥ 3 | `hd : 2 ≤ d` | Stimmt (d = n−1). d = 2 erfüllt die Voraussetzung |
| rk L = (n−1)ρ | `finrank K (range (Lq alg)) = d * ρ` | Stimmt |
| Schluss ρ = m | `ρ = m` | Stimmt. Der Zusatz „rk L = (n−1)m“ der Prosa folgt daraus mit hL unmittelbar und ist in Lean nicht eigens ausgesprochen |

Zum Beweis in Lean: Er folgt der Prosa (lemma15b_core liefert gleiche Ränge, gleiche Kerne und triviale Schnitte; dann Wahl von i0 = 0, j0 = 1 in Fin d, Teilraum S = emb(ker F_{i0}), Symmetrie f_{j}(u_i) = f_i(u_j) per Kürzen mit (N1), Widerspruch zu `lemma9`). Für d = 2 ist die Wahl ⟨0⟩, ⟨1⟩ gültig. Die Korrektheit des Beweises sichert der Lean-Kern; maßgeblich ist der Bau (T3).

Nicht auf meiner Positivliste und daher nicht gelesen: die Definition von `BilinearAlgorithm` (in `YangBounds/Basic.lean`) und die Hilfen `YangN3Teil3.emb`, `YangN3Teil3.cancel_left`. Was die Aussage von `lemma15b` davon braucht, ist in der geprüften Datei sichtbar: α_k und β_k sind K-lineare Formen (`alg.alpha k ≠ 0`, `LinearMap.pi alg.beta`), C_k ist `alg.coeff k`, und `alg.correct` liefert (Z′) (Satz `W_mul`, in der Datei bewiesen). Die Eigenschaften von `emb` sind in der Datei per `rfl` festgestellt. Ich halte die Wahl der Objekte damit für zutreffend. Sollte `BilinearAlgorithm` zusätzliche einschränkende Felder haben, wäre der Satz nur für eine engere Klasse ausgesprochen; das kann ich innerhalb der Positivliste nicht ausschließen, sehe aber in der Datei keinen Hinweis darauf.

**Urteil T2: hält.** `lemma15b` ist Lemma 15(b) der Prosa für ⟨d+1,2,m⟩ mit d ≥ 2, über einem algebraisch abgeschlossenen Körper, unter (N1) und (N2), mit ρ als Maximum über γ ∈ K^d. Bei d = 2 ist es genau die Aussage für ⟨3,2,m⟩. Einschränkung der Prüftiefe: Definition von `BilinearAlgorithm` außerhalb der Positivliste, siehe oben.

---

## 4. T3: Bau im Job 139535850068

Geprüft über die GitHub-API (Job-Metadaten und vollständiges Job-Protokoll, 1211 Zeilen):

- Job „Build lean/ and report axioms“, Workflow „Lean build (own project lean/)“, Lauf 45708303245, Zweig main, `head_sha` = `ad1084640af775eebd7ec6e4a173e09e7a6997b9`, Ergebnis `success`, 2026-11-25 21:52 bis 22:01 UTC.
- Checkout holt genau `ad1084640af775eebd7ec6e4a173e09e7a6997b9`. Toolchain `leanprover/lean4:v4.19.0`, mathlib `c44e0c8ee63ca166450922a373c7409c5d26b00b`.
- Schritt `lake build`: Zeile „✔ [1745/1761] Built YangBounds.YangN4Haupt“ (ohne Warnung), am Ende „Build completed successfully.“
- Sorry-Bericht: „SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log“ und „SORRY: 0 'sorry' token(s) in the sources outside comments“.
- Die Quelldatei enthält kein `axiom`, kein `sorry`, kein `native_decide`, kein `implemented_by`/`extern`/`unsafe` (Suche im Text).

### 4.1 Axiome

Der Axiomenbericht des Jobs nennt `lemma15b` nicht einzeln. Er nennt `YangBounds.yang_theorem_two` mit nur `propext`, `Classical.choice`, `Quot.sound`. In der geprüften Datei benutzt `core` (Zeile 1341) den Satz `lemma15b` (Fall n = 4), und `yang_theorem_two_of_lemma13` hängt über `main_algClosed` an `core`. Dass `yang_theorem_two` in `Statements.lean` über diesen Weg bewiesen wird, steht nur im Kopfkommentar der Datei; `Statements.lean` ist nicht auf meiner Liste. Deshalb habe ich versucht, die Axiome von `lemma15b` zusätzlich direkt zu bestimmen (4.2).

### 4.2 Lokaler Zusatzlauf (gescheitert)

Ich habe versucht, `#print axioms YangBounds.YangN4Haupt.lemma15b` lokal auszuführen (Lean 4.19.0 aus dem GitHub-Release). Der Abruf des mathlib-Caches (`lake exe cache get`) scheiterte in meiner Umgebung an HTTP 403 für jede Datei; mathlib aus den Quellen zu bauen passt nicht in einen Rechenblock von 30 Minuten. Abgebrochen nach rund 5 Minuten. Es gibt also keinen direkten Axiomenbericht für `lemma15b`, weder aus dem Job noch lokal. Ein lokaler Lauf wäre nach Protokoll 5.1 Nr. 4 ohnehin nicht maßgeblich.

**Urteil T3: hält** für die geprüfte Frage: Der Job 139535850068 hat genau Commit `ad10846` gebaut, `YangBounds.YangN4Haupt` ist ohne Fehler und ohne Warnung gebaut, der Bau endete mit „Build completed successfully“, und es gibt 0 `sorry` im Bauprotokoll und in den Quellen. Die Datei ist seither unverändert.

**Zusatz zu Axiomen (Protokoll 5.1 Nr. 2): nicht entscheidbar innerhalb der Positivliste.** In `YangN4Haupt.lean` steht keine Axiom-Deklaration. Mittelbar spricht für Standard-Axiome, dass `yang_theorem_two` nur `propext`, `Classical.choice`, `Quot.sound` zeigt und, wenn es wie im Dateikopf beschrieben über `core` bewiesen ist, `lemma15b` einschließt. Diesen Weg über `Statements.lean` kann ich nicht nachsehen. Benannte Reparatur: `#print axioms YangBounds.YangN4Haupt.lemma15b` in den Axiomenbericht des Actions-Laufs aufnehmen.

---

## 5. T4: Zahlenform „rk L = d·ρ ⇒ ρ = m“

Die in B-018 zitierte Form lautet „rk L = d·ρ ⇒ ρ = m“ mit den Voraussetzungen „n ≥ 3 (bzw. d ≥ 2), K algebraisch abgeschlossen“. Die Dateien unter `erkundung/`, in denen sie benutzt wird, habe ich nicht gelesen; ich urteile nur über die Form, wie B-018 sie wiedergibt.

- Mit d = 2: aus rk L = 2ρ folgt ρ = m (und damit rk L = 2m). Das ist `lemma15b` mit d = 2, `hd : 2 ≤ 2`, wörtlich. Die Folgerung ist richtig.
- **Aber die Liste der Voraussetzungen ist unvollständig.** Der Satz (Prosa wie Lean) braucht zusätzlich (N1) und (N2) für genau die Zerlegung, aus der L, F_i, J und ρ gebildet werden, und ρ muss das Maximum über alle γ ∈ K^d sein (nicht über eine Auswahl). Ohne (N1) sind G5, G6 und damit J, dim J = m und die Symmetrie f_j(u_i) = f_i(u_j) nicht verfügbar; ohne (N2) fällt Lemma 9. Die Zahlenform ohne diese Annahmen ist so nicht durch den Satz gedeckt.
- Wer die Form auf eine gegebene Zerlegung der Länge r anwendet, muss beachten: Die Normalisierung (R2 und Lemma 6, in Lean `exists_normalized`, Zeile 1311) liefert eine Zerlegung der Länge **r′ ≤ r**, nicht zwingend r (Nullformen α_t fallen weg), und arbeitet über einem unendlichen, für Lemma 15(b) algebraisch abgeschlossenen Körper (Übergang zum algebraischen Abschluss). Alle Größen der Zahlenform (rk L, ρ, und daraus abgeleitete wie dim Q = r − (n+1)m) gehören zur normalisierten Zerlegung über dem Abschluss.

**Urteil T4: hält mit benannter Reparatur.** Reparatur: Die Voraussetzungen der Zahlenform lauten „d ≥ 2 (n ≥ 3), K algebraisch abgeschlossen, die Zerlegung erfüllt (N1) und (N2), ρ = max über alle γ ∈ K^d von rk(Σγ_iF_i)“; bei Anwendung auf eine Zerlegung der Länge r ist mit der normalisierten Länge r′ ≤ r zu rechnen. Ob die Restfall-Rechnung diese Annahmen tatsächlich hat, liegt außerhalb dieses Auftrags.

---

## 6. Zusammenfassung der Urteile

| Teil | Urteil |
|---|---|
| T1 Prosa-Beweis Lemma 15(b) bei n = 3 (d = 2), mit Lemma 9 | hält |
| T2 Lean-Satz `lemma15b` ist die behauptete Aussage (Objekte, Körper, Zahl, Voraussetzungen), anwendbar bei d = 2 | hält (Definition von `BilinearAlgorithm` außerhalb der Positivliste, nicht eingesehen) |
| T3 Bau in Job 139535850068 ohne `sorry` | hält |
| T3 Zusatz: nur Standard-Axiome für `lemma15b` | nicht entscheidbar innerhalb der Positivliste; Reparatur: `#print axioms` für `lemma15b` im Actions-Lauf |
| T4 Zahlenform „rk L = d·ρ ⇒ ρ = m“ | hält mit benannter Reparatur: (N1), (N2) und ρ als volles Maximum als Voraussetzungen ergänzen; Länge r′ ≤ r nach Normalisierung beachten |

Verbrauch: keine Subagenten, keine Fremdmodell-Anfrage. Ein lokaler Rechenversuch von rund 5 Minuten (abgebrochen, siehe 4.2).
