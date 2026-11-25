# S2-52: Aussagen-Abgleich der Lean-Sätze zu B-014

- Auftrag: S2-52, Rolle Prüfer (Aussagen-Abgleich nach Protokoll Abschnitt 5.1 Punkt 3), im Auftrag des Orchestrators.
- Datum: 25.11.2026
- Geprüfter Stand: `main` bei Commit `c3c3884` (derselbe Commit, den der Actions-Lauf 45699204903, Job 139504538345 gebaut hat).
- Gelesen: `PROTOKOLL.md` Abschnitt 5, `behauptungen/B-014.md`, `lean/prosa/s2_444_spurA_r6.md`, `lean/YangBounds/SatzF444.lean`, `LemmaK444.lean`, `LemmaZ444.lean`, `Transponiert444.lean`, zur Rückverfolgung von Definitionen Ausschnitte aus `Basic.lean`, `YangN4Haupt.lean`, `SatzB444.lean`, `SatzE444.lean`, `SatzE444Buendel.lean`, `Endsatz444.lean`, `LemmaP444.lean`, `Bruecke444.lean`, `SatzC444Generisch.lean`, sowie das Log des Jobs 139504538345.
- Nicht gelesen: `LOG.md`, `STATUS.md`, `pruefvermerke/`, `archiv/`, `versuche/`, Prüf- oder Berichtsdateien in `lean/prosa/`, PRs, Issues, Commit- oder Lauflisten, andere Abschnitte des Protokolls. Die Behauptungsdateien B-007 bis B-013 habe ich nicht gelesen (nicht auf der Positivliste). Wo B-014 „im Sinn von B-012/B-013“ sagt, vergleiche ich mit der Fassung im Prosa-Bericht `s2_444_spurA_r6.md`.
- Kein Fremdmodell benutzt. Kein Subagent.
- Status setze ich nicht. Dieser Bericht enthält Urteile über die Übereinstimmung von Aussagen, keine Statuswörter für B-014.

---

## 0. Eingeblendete Einträge und Hinweise (Offenlegung)

### 0.1 Projektgedächtnis, Index (wörtlich eingeblendet)

```
# Projekt: Matrizen-Multiplikation
- Repo: https://github.com/Justus42/matmul-rank-n2m (öffentlich, PROTOKOLL.md per raw.githubusercontent.com lesbar)
- Ziel: exakter Tensorrang von <n,2,m> (4×2×4, 3×2×7, 4×2×5; Lean für 3×2×6). Regeln: PROTOKOLL.md und CLAUDE.md auf main, seit 25.11.2026 Version 0.4.1 (von Justus).
- Person schreibt Deutsch.
- Dieses Gedächtnis wird jedem Thread automatisch eingeblendet. Deshalb steht hier bewusst nichts über Behauptungen, Beweise, Ansätze, Status, Zähler oder Rundenverlauf. Niemand schreibt so etwas hierher oder in Einzeleinträge, auch nicht kurz. Alles steht im Repo.
- Nur für den Orchestrator (Koordinator): Den Stand, die laufende Arbeitsrichtung und alle Entscheidungen von Justus im Wortlaut liest du aus LOG.md und STATUS.md auf main (raw.githubusercontent.com) und aus dem Projektchat, nicht aus diesem Gedächtnis. Lies beides, bevor du etwas vergibst.
- Justus am 25.11.2026: Koordinator ist der Orchestrator mit den Rechten aus Protokoll Abschnitt 11. Führt ohne Rückfragen an Justus. Grenzen 11.4: kein Budget verlängern, keine Abbruchregel aussetzen, PROTOKOLL.md/CLAUDE.md nicht ändern, nicht selbst beweisen/prüfen, nichts veröffentlichen, Stufe 3 nur mit Budget. Anhalten und berichten, wenn eine Abbruchregel greift, das Fertig-Kriterium einer Stufe erfüllt ist oder eine Regel geändert oder ausgelegt werden müsste.
- Justus am 25.11.2026, wörtlich: „Freigabe zu weiteren Runden nach deinem Ermessen“. Stufe 3 braucht ein eigenes Budget.
- Fremdmodell: GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Gemini-Bridge, high, batch), die Bridge kann das Repo nicht lesen, Texte wörtlich mitgeben. Gemini hat die Ausgabengrenze erreicht. Einsatz nur nach Protokoll 5.5.
- Vor jeder Vergabe an Prüfer oder Blind-Sucher (Anweisung von Justus, 25.11.2026): Thread „Logbuch und Status nachführen“ den Index und alle Einzeleinträge des Gedächtnisses durchsehen lassen, ob dort etwas steht, das nicht hierher gehört, und auf seine Bestätigung warten.
- Aufträge an Prüfer (Anweisung von Justus, 25.11.2026): genaue Dateipfade und die Job-Nummer des Actions-Laufs statt Verzeichnis- und Lauflisten, vom Protokoll nur Abschnitt 5, kein Gedächtniseintrag, als Erstes die eingeblendeten Einträge melden, Status setzt nur der Orchestrator über das Logbuch. Blind-Sucher lesen nur CLAUDE.md und die Problemstellung. Dauern werden aus den Git-Zeitstempeln gemessen, nicht aus Angaben der Threads.
- Koordinator kann nicht selbst mergen oder schreiben (kein GitHub-Zugriff). Threads mergen eigene PRs in seinem Auftrag. GitHub lehnt Merges manchmal minutenlang mit Fehler 500 ab, Wiederholen mit Abstand hilft. Thread „Logbuch und Status nachführen“ schreibt LOG.md, STATUS.md und pruefvermerke/ direkt auf main, nach jeder Runde dorthin melden, mit Zahl der Subagenten, Dauer und Zahl der Fremdmodell-Anfragen.
- Protokoll Abschnitt 6: höchstens 6 Subagenten pro Runde (Stufe 2 ab Runde 9), 24 Runden für Stufe 2, Aufträge einer Runde hängen nie voneinander ab, Rechenblöcke höchstens 30 Minuten auf 4 Kernen, pro Runde mindestens ein Blind-Sucher.
- Literaturwache (Abschnitt 7, auch openai/math) zu Beginn jeder Sitzung, letzte am 25.11.2026 11:47 UTC.
- Öffentlich als Ergebnis bezeichnen nur nach Freigabe durch Justus.
- Threads können stundenlang still stehen, ohne sich zu melden. Bei einem laufenden Thread ohne Meldung nachfragen.
- [[verfahren-datenformat]]: Datenformat der Verfahren
- [[lean-project-ci]]: Actions-Workflow für lean/ mit sorry- und Axiom-Bericht
```

(Im eingeblendeten Original stand `&lt;n,2,m>` statt `<n,2,m>`.)

### 0.2 Einzeleinträge, die während der Arbeit eingeblendet wurden (wörtlich)

`aussagen-abgleich-n3.md`:

```
---
name: aussagen-abgleich-n3
description: Praxis-Hinweise zu Bridge und lokalem Lean-Bau für Teilziele
metadata:
  type: project
---

- Bridge-Hinweis: Das Repo matmul-rank-n2m ist in der Bridge NICHT freigegeben (`repo`/`files` scheitern). Dateien wörtlich in `prompt` einfügen. Batch war nach ~1 min fertig.
- Lean lokal: Toolchain über GitHub-Release; eine Prüfdatei braucht `import YangBounds.Statements` (YangBounds.olean wird bei Teilziel nicht gebaut).
Verwandt: [[lean-build-cloud]]
```

`gemini-bridge.md`:

```
---
name: gemini-bridge
description: Gemini Bridge fürs Fremdmodell-Gegenlesen: Repo-Freigabe fehlt für matmul-rank-n2m und fallnlove, Zeitlimit 60 s
metadata:
  type: reference
  modified: 2026-11-25T00:32:01.590Z
---

Stand 25.11.2026 (A-03):
- `ask_gemini` mit `repo`/`files` geht nur für freigegebene Repos. Justus42/matmul-rank-n2m und fallnlove/mm325_proof sind **nicht** freigegeben. Inhalte deshalb wörtlich in `prompt` einfügen (Auszüge, Beweise weglassen).
- Das MCP-Werkzeug bricht nach 60 s ab (Ergebnis unbekannt). Mit Denkstufe high und ca. 12 KB Eingabe: Zeitüberschreitung. Mit Denkstufe low und `max_output_tokens` 8000: Antwort in Ordnung (~0,03 $).
- Für Unabhängigkeit nach Protokoll 4/5.1: dem Fremdmodell kein eigenes Urteil zeigen, offene Fragen mit JA/NEIN/TEILWEISE stellen.

Verwandt: [[git-regeln]]

Stand 25.11.2026 05:10 (S1-05 Nachtrag): Gemini-Projekt hat die **monatliche Ausgabengrenze** erreicht, Batch-Auftrag abgelehnt. Orchestrator: kein Ausweichen auf OpenRouter (Budgetgrenze von Justus). Wenn Justus die Grenze anhebt: yang_n3.md ungekürzt als Batch (gemini-4-carbon, high) erneut abgeben, Ergebnis als Nachtrag in lean/prosa/yang_n3_pruefung.md, PR „S1-05 Nachtrag“.
```

`lean-build-cloud.md`:

```
---
name: lean-build-cloud
description: Lean/mathlib in der Cloud-Sitzung bauen: releases.lean-lang.org und mathlib-Cache gesperrt, Umweg über GitHub-Releases und Bau aus Quellen
metadata:
  type: reference
  modified: 2026-11-25T18:41:28.814Z
---

Stand 25.11.2026 (A-02):
- elan-Installer geht, aber Toolchain-Download über releases.lean-lang.org ist per Proxy gesperrt (403). Umweg: `https://github.com/leanprover/lean4/releases/download/v4.19.0/lean-4.19.0-linux.tar.zst` laden (kein zstd-Binary: mit `pip install zstandard` + Python entpacken), dann `elan toolchain link leanprover/lean4:v4.19.0 <dir>`.
- `lake exe cache get` scheitert: lakecache.blob.core.windows.net gesperrt (403). mathlib muss aus Quellen gebaut werden, in Blöcken ≤30 min (`timeout 1800 lake build`, inkrementell).
- Nicht `lake update` benutzen (schreibt lake-manifest.json um); `lake build` holt die Pakete aus dem Manifest.
- In GitHub Actions ist der mathlib-Cache erreichbar (~2,5 min pro Lauf). Workflows: `.github/workflows/lean-build.yml` (A-11, PR #9) und `lean-project.yml` (S1-14).
Verwandt: [[mm325-lizenz]], [[lean-project-ci]]
```

`git-regeln.md`:

```
---
name: git-regeln
description: Seit Protokoll 0.2 (25.11.2026) committen Threads ihre Zieldatei ohne Rückfrage, PR mit Auftragsnummer, Rückfragen an Orchestrator
metadata:
  type: feedback
---

Ab Protokoll 0.2 (Abschnitt 11): Threads committen ihre Zieldatei ohne Rückfrage, pushen auf den eigenen Zweig und öffnen einen PR, dessen Titel mit der Auftragsnummer beginnt (z. B. "A-01: ..."). Nur die Dateien des Auftrags ändern, STATUS.md/LOG.md pflegt der Orchestrator. Rückfragen an den Orchestrator (Koordinator), nicht an Justus. Der Orchestrator merged.

**Why:** Justus will, dass das Projekt ohne Rückfragen an ihn läuft (testweise).
**How to apply:** Vor jeder Arbeit CLAUDE.md und PROTOKOLL.md von origin/main neu lesen, weil Justus Regeln ändern kann.
```

Bewertung: Keiner dieser Einträge enthält ein Prüfurteil oder einen Status zu B-014 oder zu einer anderen Behauptung. `aussagen-abgleich-n3` trägt im Namen das Wort „Aussagen-Abgleich“, enthält aber nur Werkzeughinweise.

### 0.3 Sonstige Hinweise, die wie ein Urteil oder ein gewünschtes Ergebnis aussehen könnten

- Der Auftrag des Orchestrators sagt ausdrücklich, dass kein bestimmtes Ergebnis erwünscht ist.
- Die Lean-Dateien enthalten Kopfkommentare ihrer Formalisierer mit Selbstauskünften, zum Beispiel „No `sorry`, no own axiom“, „**without hypothesis**“ (`Transponiert444.lean`, zu `rank_four_two_four_ge_26`) und „(Z′) and Lemma K are no longer hypotheses“. Das sind Behauptungen der Autoren. Ich habe sie an den Aussagen und am Log nachgeprüft (Abschnitte 2 und 3), nicht übernommen.
- Der Prosa-Bericht `s2_444_spurA_r6.md` nennt B-007, B-010 „geprüft“ und B-012, B-013, B-014 „behauptet“. Das ist eine Statusangabe aus der Prosa, kein Prüfurteil zu B-014. Ich habe es nicht verwendet.
- Der Axiom-Bericht im Actions-Log markiert jede Zeile mit `[STANDARD]`. Das ist eine Maschinenausgabe, die ich an den Rohzeilen nachgeprüft habe (Abschnitt 3).
- Ein früheres Prüfurteil zu B-014 habe ich nicht gesehen.

---

## 1. Zuordnung: Teil der Behauptung ↔ Lean-Satz

Bezeichnungen in Lean (zurückverfolgt):

- `BilinearAlgorithm K n l m r` (`Basic.lean:40`): Linearformen `alpha t` auf `n×l`, `beta t` auf `l×m`, Matrizen `coeff t` mit `A * B = ∑ t, (alpha t A * beta t B) • coeff t` für alle `A, B`. Das ist eine Zerlegung von ⟨n,l,m⟩ der Länge r im Sinn der Prosa (`α_t`, `β_t`, `C_t`).
- `tensorRank K n l m` (`Basic.lean:95`): `Nat.find` der kleinsten Länge; `le_tensorRank_iff`: `c ≤ tensorRank` genau dann, wenn jede Zerlegung Länge ≥ c hat. Nicht leer erfüllbar (Schulbuchverfahren existiert, `tensorRank_le_mul`).
- Normalform: `SN1`, `SN2` (`YangN4Haupt.lean:340–346`). Der Punkt der Normalform ist p = e₀: `SatzB444.avecs alg t i = α_t(e_{i,0})`, also a_t = A_t e₀, und `SatzF444.bvecs alg t · y = β_t(emb y)` mit `emb y = (0; y)`, also b_t = B_tᵀ e₁ = B_tᵀ J e₀. Das ist a_t(p), b_t(p) der Prosa an p = e₀.
- `psi alg u y t = (a_t·u)(b_t·y)` (`SatzE444.lean:312`, `SatzF444.psi_dot`): Ψ der Prosa.
- `SatzB444.IsSymm alg` (`SatzB444.lean:168`): es gibt einen Automorphismus e von K⁴ und μ_t mit b_t·(e y) = μ_t (a_t·y), also eᵀ b_t = μ_t a_t. Das ist genau „es gibt invertierbares M mit M b_t ∈ K·a_t für alle t“ (Prosa (V1)). `NichtSymmetrisch := ¬ IsSymm` (`SatzE444Buendel.lean:79`).
- `UnterfallB alg` (`SatzE444Buendel.lean:69`): dim K* = 3, γ* ≠ 0 mit K* ⊆ ker F_{γ*}, rk F_{γ*} = 1, ein zweidimensionales Q₂ mit F_i(K*) ⊆ Q₂. In Satz F wird davon nur γ* ≠ 0 und rk F_{γ*} = 1 benutzt (`kubik_of_unterfallB`), wie in Prosa (B0).
- Fall (5,8): `(finrank (range Lq), finrank (range Hq)) = (5, 8)`.
- Generische Normalform: `SatzC444.genAlg alg` über `GField K = K(S,T)` und `Bruecke444.genAlgL alg` über `GBar K = AlgebraicClosure K(S,T)`, jeweils Basiswechsel mit generischen Matrizen S (4×4) und T (2×2). Der Punkt ist p = (T₀₀, T₀₁) (`prow`), algebraisch unabhängig über K (`LemmaK444.aeval_prow_injective`, `aeval_prowL_injective`). Nachgerechnet: die Koordinaten von a_t sind A_t p in der Basis S⁻¹e_k (`LemmaZ444.genAlg_alpha_basis`), und b_t = det(T)⁻¹ · B̂_t p mit B̂_t p = B_tᵀ J p (`genAlg_beta_basis`, `Bmat`: (β_t(e_{1j}) p₀ − β_t(e_{0j}) p₁)_j, das ist mit J = [[0,−1],[1,0]] genau B_tᵀJp).

| Teil von B-014 | Lean-Satz (Datei) |
|---|---|
| Lemma K (Teil von Lemma Z; Prosa 3.1) | `LemmaK444.lemmaK`, `lemmaK_exklusiv`, `folgerungK1` (`LemmaK444.lean`) |
| Lemma Z, „mindestens 13 verschiedene Punkte“ | `LemmaZ444.lemmaZ_generisch_unbedingt` (über K(S,T)), `lemmaZ_bruecke_unbedingt` (über GBar K) |
| Lemma Z, „zwei zusammenfallende Terme haben die Gestalt …, mehr als zwei nie“ | `LemmaZ444.paar_struktur` (mit `lemmaKStatement_gilt`), `LemmaZ444.keine_drei` |
| Satz F | `SatzF444.satzF`, `SatzF444.unterfallB_unmoeglich`; Kern `satzF_kern`, `deg_eq_one`, `kubik_seite`, `kubik_of_unterfallB` |
| Aussage über die Transponierte ((B3) der Prosa, in Satz F „zugleich mit ihrer Transponierten“) | `Transponiert444.transp` (Definition), `Transponiert444.transponiertEng_of`, `Transponiert444.transponiertEng_genAlgL` |
| Folgerung F1 (Fall (5,8) ausgeschlossen) | `SatzF444.fall58_ausgeschlossen` (bedingt), `Transponiert444.keine_zerlegung_25_of_vielePunkte` mit `LemmaZ444.lemmaZ_bruecke_unbedingt`; unbedingt nur über F2 (siehe 2.6) |
| Folgerung F2 (R(⟨4,2,4⟩) ≥ 26 über jedem Körper) | `Transponiert444.rank_four_two_four_ge_26` |

---

## 2. Abgleich je Teil

### 2.1 Lemma K: **stimmt überein**

- Wort (Prosa 3.1): K beliebiger Körper, n ≥ 1, X, Y, X′, Y′ ∈ K^{n×2}, alle ≠ 0, (Xp)⊗(Yp) = (X′p)⊗(Y′p) als Polynomidentität. Dann genau einer der Fälle (i) X′ = λX, Y′ = λ⁻¹Y, λ ≠ 0; (ii) X = x l₁ᵀ, Y = w l₂ᵀ, X′ = λ x l₂ᵀ, Y′ = λ⁻¹ w l₁ᵀ, x, w ≠ 0, λ ≠ 0, l₁, l₂ linear unabhängig.
- Lean: `lemmaK {K} [Field K] {n} {X Y X' Y' : Matrix (Fin n) (Fin 2) K} (hX : X ≠ 0) (hY : Y ≠ 0) (h : PolyEq X Y X' Y') : FallI X Y X' Y' ∨ FallII X Y X' Y'` und `lemmaK_exklusiv : ¬ (FallI ∧ FallII)`.
- `PolyEq`: `lin (X i) * lin (Y j) = lin (X' i) * lin (Y' j)` in `MvPolynomial (Fin 2) K` für alle i, j, mit `lin a = a₀p₀ + a₁p₁`. Das ist (K) als Polynomidentität, Eintrag (i, j) des Tensors.
- `FallI`, `FallII` stimmen Wort für Wort mit (i), (ii) überein (`vecMulVec x l = x lᵀ`, `det2 l₁ l₂ ≠ 0` = linear unabhängig).
- Hypothesen: Lean braucht nur X, Y ≠ 0 (X′, Y′ ≠ 0 folgt, `PolyEq.ne_zero`). Kein Körper-Zusatz, n beliebig (auch n = 0 ist leer harmlos, weil X ≠ 0 dann unmöglich ist). Lean ist also mindestens so stark wie die Wortfassung.
- Folgerung K1 (Prosa: höchstens zwei Bahnen): `folgerungK1` sagt: von drei Lösungen (X,Y), (X′,Y′), (X″,Y″) liegen zwei in derselben Bahn (`FallI` zwischen ihnen). Das ist „höchstens zwei Bahnen“. Stimmt überein.

### 2.2 Lemma Z, Zählaussage: **stimmt überein, mit benannter Abweichung in der Form (generischer Punkt)**

- Wort (B-014): Eine Zerlegung von ⟨4,2,4⟩ der Länge 25 über einem Körper im Fall (5,8) hat über K̄ für alle p ∈ ℙ¹ außerhalb endlich vieler Punkte mindestens 13 paarweise verschiedene Punkte [a_t(p) ⊗ b_t(p)].
- Lean: `lemmaZ_generisch_unbedingt (alg : BilinearAlgorithm K 4 2 4 25) : VielePunkte (genAlg alg) 13` für jeden Körper K, ebenso `lemmaZ_bruecke_unbedingt` für `genAlgL alg` über GBar K.
- `VielePunkte alg n` (`SatzF444.lean:761`): es gibt T ⊆ Fin r mit |T| ≥ n, und für s ≠ t in T gilt nicht zugleich a_s ∈ K·a_t und b_s ∈ K·b_t. Für Vektoren ≠ 0 ist das genau [a_s⊗b_s] ≠ [a_t⊗b_t] (zwei Rang-1-Tensoren sind genau dann proportional, wenn beide Faktoren proportional sind). An `genAlg` sind alle a_t ≠ 0 (SN1) und alle b_t ≠ 0 (`genAlg_beta_ne` aus β_t ≠ 0 bei Länge 25), also ist die Lesart richtig.
- Abweichungen:
  1. **Generischer Punkt statt „alle p außerhalb endlich vieler Punkte“.** Lean macht die Aussage an einem einzigen Punkt, dem generischen Punkt p = (T₀₀, T₀₁) über K(S,T) bzw. dessen algebraischem Abschluss. Die Wortfassung (für fast alle p ∈ ℙ¹(K̄)) folgt daraus mathematisch durch Spezialisierung, aber dieser Schluss ist in Lean nicht ausgeführt. Als Lean-Satz ist Lemma Z also die generische Fassung, nicht die Fassung „für alle p bis auf endlich viele“. Für den weiteren Gebrauch (Satz F an `genAlgL`) ist die generische Fassung genau die benötigte.
  2. **Keine Hypothese „Fall (5,8)“.** Lean verlangt den Fall (5,8) nicht als Voraussetzung, sondern leitet ihn an der generischen Normalform her (`SatzC444.folgerungC1_generisch` in `quadGleich_of_rel`). Damit ist der Lean-Satz für jede Zerlegung der Länge 25 formuliert, also stärker als die Wortfassung. Er hängt dafür an den Lean-Sätzen zu B-008, B-009 und B-012 (`satzB_unbedingt`, `satzB_symm_unbedingt`, `satzC_generisch`). Deren Aussagen-Abgleich ist nicht Teil dieses Auftrags. Für die Gültigkeit von Lemma Z in Lean zählt nur, dass sie ohne `sorry` und mit Standard-Axiomen gebaut sind (Abschnitt 3); für die *Bedeutung* des Lean-Satzes `lemmaZ_generisch_unbedingt` spielen ihre Aussagen keine Rolle, weil der Satz keine Hypothese hat.
  3. Die Zahl 13 stimmt überein. Satz F braucht nur 11 (`lemmaZ_bruecke_11`), siehe 2.4.

### 2.3 Lemma Z, Gestalt zusammenfallender Paare: **stimmt nicht vollständig überein (Lean-Fassung schwächer)**

- Wort (B-014): Zwei Terme, deren Punkte für alle p zusammenfallen, haben die Gestalt A_t = x l₁ᵀ, A_{t′} = x l₂ᵀ, B_tᵀJ = w l₂ᵀ, B_{t′}ᵀJ ∝ w l₁ᵀ, und mehr als zwei Terme fallen nie so zusammen.
- Lean: `paar_struktur (hK) (hst : s ≠ t) (hrel : Rel (genAlg alg) s t) : ∃ l1 l2, det2 l1 l2 ≠ 0 ∧ Zeile (Amat alg t) l1 ∧ Zeile (Amat alg s) l2 ∧ Zeile (Bmat alg s) l1 ∧ Zeile (Bmat alg t) l2` mit `Zeile M l := ∃ x, M = vecMulVec x l`. Dazu `keine_drei`: drei paarweise verbundene verschiedene Terme gibt es nicht.
- `Rel (genAlg alg) s t` ist „a_s ∥ a_t und b_s ∥ b_t am generischen Punkt“. Wegen der algebraischen Unabhängigkeit von p ist das gleichwertig mit „für alle p“ (vgl. `LemmaK444.polyEq_of_eval`). Das passt.
- Abweichung: `paar_struktur` sagt nur, dass die vier Matrizen Rang ≤ 1 mit den Zeilenrichtungen l₁, l₂ wie angegeben haben (mit t der Prosa = t, t′ = s). Dass A_t und A_{t′} **denselben** Vektor x und B_tᵀJ und B_{t′}ᵀJ **denselben** Vektor w haben, steht im Lean-Satz nicht. Es steht in `FallII` von Lemma K (und wird im Beweis von `paar_struktur` auch erzeugt), wird aber nicht exportiert. Die Gestaltaussage ist in Lean daher schwächer als in Worten. Das betrifft nur diese Zusatzaussage. Für die Zählung (13 Klassen) und für Satz F wird sie nicht gebraucht; „mehr als zwei nie“ (`keine_drei`) stimmt überein.

### 2.4 Satz F: **stimmt nicht wörtlich überein (benannte Hypothesen statt Unterfall B der Transponierten und statt Lemma Z); in der Anwendung an der Normalform der Brücke voll getragen**

- Wort (B-014): Eine Zerlegung von ⟨4,2,4⟩ der Länge 25 über einem Körper im Fall (5,8), die nicht symmetrisch ist, liegt nicht zugleich mit ihrer Transponierten in Unterfall B. (Prosa 5: an einer Stelle p aus einer offenen Menge, über K̄.)
- Lean:
  - `satzF [IsAlgClosed K] (h1 : SN1 alg) (h2 : SN2 alg) (hB : UnterfallB alg) (hT : TransponiertEng alg) (hZ : VielePunkte alg 11) : SatzB444.IsSymm alg`
  - `unterfallB_unmoeglich … (hns : NichtSymmetrisch alg) (hT) (hZ) : ¬ UnterfallB alg`
  - beide für beliebiges r, an einer einzelnen Normalform über einem algebraisch abgeschlossenen Körper.
- `TransponiertEng alg` (`SatzF444.lean:752`): es gibt w₀ ≠ 0 mit b_t·w₀ ≠ 0 für alle t, w₁ ∉ K·w₀ und einen Unterraum P der Dimension ≤ 5 mit Ψ(u, w₀), Ψ(u, w₁) ∈ P für alle u. Das ist (B0) auf der Seite von w, also das enge Paar E der Prosa (B3), an derselben Stelle.
- Abweichungen:
  1. Statt „die Transponierte liegt in Unterfall B“ steht die schwächere Folge `TransponiertEng` als Hypothese. Das macht den Lean-Satz in diesem Punkt stärker (er braucht weniger), aber die Brücke „Transponierte in Unterfall B ⇒ TransponiertEng“ steht nicht als eigener Satz da. Sie ist in `Transponiert444.transponiertEng_of` enthalten, das TransponiertEng direkt herleitet (siehe 2.5).
  2. Lemma Z geht als Hypothese `VielePunkte alg 11` an derselben Normalform ein, nicht als Teil des Satzes. Eine einzelne Normalform „sieht“ die Variation von p nicht; das sagt der Kopfkommentar selbst.
  3. Die Hypothesen Länge 25 und Fall (5,8) fehlen in `satzF` (allgemeiner). In `fall58_symmetrisch`, `fall58_ausgeschlossen` ist der Fall (5,8) Hypothese, und daraus folgt Unterfall B über `LemmaP444.nur_unterfallB'`.
  4. Die Prosa schließt über Bézout auf ℙ¹×ℙ¹; Lean zählt Fixpunkte (`deg_eq_one`). Das betrifft den Beweis, nicht die Aussage.
- Ist die Lean-Aussage leer erfüllbar? An der Normalform der Brücke nicht: `Bruecke444.bruecke` liefert für jede Zerlegung der Länge 25 SN1, SN2, Fall (5,8) und NichtSymmetrisch für `genAlgL alg`, `bruecke_unterfallB` liefert UnterfallB, `transponiertEng_genAlgL` liefert TransponiertEng, `lemmaZ_bruecke_unbedingt` liefert VielePunkte 13. Alle Hypothesen von `satzF` sind dort also bewiesen, und `LemmaZ444.keine_zerlegung_25_of_lemmaK` bzw. `Transponiert444.keine_zerlegung_25_of_vielePunkte` ziehen daraus `False`. Die Hypothesen sind also nicht widersprüchlich gewählt, sondern an genau der Stelle erfüllt, an der der Satz gebraucht wird (abgesehen davon, dass am Ende keine solche Zerlegung existiert, was das Ziel ist).
- Urteil: Als einzelner Lean-Satz ist Satz F an zwei benannte Hypothesen gebunden, die die Wortfassung so nicht hat, und er gilt an einer einzelnen Normalform, nicht „für p aus einer offenen Menge“. Zusammen mit 2.2 und 2.5 ist die Aussage aber an der generischen Normalform jeder Zerlegung der Länge 25 ohne Hypothese angewandt. Die Wortfassung von Satz F (über alle Zerlegungen der Länge 25) folgt in Lean nur noch auf dem Umweg über F2: weil `rank_four_two_four_ge_26` keine Zerlegung der Länge 25 über irgendeinem Körper zulässt, gilt jede Aussage über solche Zerlegungen, auch Satz F, leer. Ein Lean-Satz in der wörtlichen Form „jede solche Zerlegung über einem Körper, nicht symmetrisch, mit Transponierter in Unterfall B, existiert nicht“ steht nicht in den vier Dateien.

### 2.5 Aussage über die Transponierte: **stimmt überein, mit benannten Zusatzvoraussetzungen an einer einzelnen Normalform, die an der Normalform der Brücke bewiesen sind**

- Wort (Prosa (B3), in B-014 „zugleich mit ihrer Transponierten“): (B_tᵀ, A_tᵀ, C_tᵀ) ist eine Zerlegung der Länge 25; an einer geeigneten gemeinsamen Stelle ist sie im Fall (5,8), nicht symmetrisch, in Unterfall B, und liefert ein enges Paar E auf der Seite von w mit a′_t(p) = −b_t(Jp), b′_t(p) = a_t(Jp).
- Lean:
  - `transp alg : BilinearAlgorithm K m 2 n r` mit α′_t(X) = β_t(M Xᵀ), β′_t(Y) = α_t(Yᵀ M⁻¹), C′_t = C_tᵀ, M = [[0,1],[−1,0]]. Die Korrektheit ist Teil der Struktur (`correct`), also ist `transp alg` beweisbar eine Zerlegung von ⟨m,2,n⟩ derselben Länge. Der Faktor M nimmt J auf, sodass die Transponierte an derselben Stelle p = e₀ betrachtet wird (Kopfkommentar: a′_t = −b_t, b′_t = a_t, Ψ′(u, w) = −Ψ(w, u); `psi_transNF`).
  - `transponiertEng_of [IsAlgClosed L] (alg : BilinearAlgorithm L 4 2 4 25) (h1 : SN1 alg) (hns : NichtSymmetrisch alg) (hT1 : TransN1 alg) (hT2 : TransN2 alg) : TransponiertEng alg`. Im Beweis: transponierte Normalform `transNF`, dort SN1, SN2, NichtSymmetrisch, Fall (5,8) (`Endsatz444.fall58_of_nichtSymmetrisch`), Unterfall B (`nur_unterfallB'`), enges Paar (`eng_of_unterfallB`), zurückübersetzt.
  - `transponiertEng_genAlgL (alg : BilinearAlgorithm K 4 2 4 25) : TransponiertEng (genAlgL alg)`, ohne Hypothese.
- Abweichungen:
  1. `TransN1` (alle b_t ≠ 0) und `TransN2` ((N2) der Transponierten) sind an einer einzelnen Normalform Zusatzvoraussetzungen, die die Prosa nicht nennt. Die Prosa löst das durch die Wahl von p in einer offenen Menge („wähle p so, dass die Bedingungen … gelten“). Lean löst es am generischen Punkt (`transN1_genAlgL`, `transN2_genAlgL`). Das entspricht sich.
  2. „Die Transponierte liegt in Unterfall B“ ist in Lean ein Zwischenschritt im Beweis (`hUB`), kein exportierter Satz. Exportiert wird nur die in Satz F benutzte Folge `TransponiertEng`. Für Satz F reicht das.
- Urteil: Der Teil der Behauptung, den Satz F von der Transponierten braucht, ist an der Normalform der Brücke ohne Hypothese bewiesen.

### 2.6 Folgerungen F1 und F2: **F2 stimmt überein; F1 nur bedingt als eigener Satz, unbedingt über F2**

- F2 Wort: Über keinem Körper hat ⟨4,2,4⟩ eine Zerlegung der Länge 25, also R(⟨4,2,4⟩) ≥ 26 über jedem Körper.
- Lean: `Transponiert444.rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4`. Ohne Hypothese, für jeden Körper (auch endliche), universenpolymorph. Mit `le_tensorRank_iff` heißt das: jede Zerlegung von ⟨4,2,4⟩ über K hat Länge ≥ 26, insbesondere keine der Länge 25. Format ⟨4,2,4⟩ (n = 4, l = 2, m = 4), Zahl 26, Körper beliebig: stimmt. Die Aussage hängt nur an den Definitionen `BilinearAlgorithm` und `tensorRank`, beide oben geprüft; Zwischendefinitionen (UnterfallB, TransponiertEng, VielePunkte usw.) gehen in die Aussage nicht ein.
- Der Zusatz „mit B-010: genau 26“ ist nicht Teil dieser Lean-Sätze (und in B-014 als Folge mit B-010 formuliert).
- F1 Wort: Im Fall (5,8) gibt es keine Zerlegung der Länge 25, über jedem Körper. Lean: `fall58_ausgeschlossen` ist an TransponiertEng und VielePunkte gebunden; ein unbedingter Satz genau dieser Form steht nicht in den vier Dateien. F1 folgt unbedingt aus `rank_four_two_four_ge_26` (dann gibt es überhaupt keine Zerlegung der Länge 25).

### 2.7 Tragen die Lean-Sätze zusammen den Ausschluss von Unterfall B im behaupteten Umfang?

Ja, im folgenden Sinn: Für jede Zerlegung der Länge 25 über jedem Körper K ist die Normalform `genAlgL alg` (über dem algebraischen Abschluss von K(S,T), am generischen Punkt) in Fall (5,8), nicht symmetrisch und in Unterfall B, und Satz F mit Lemma Z und der Aussage über die Transponierte schließt genau das aus. Ergebnis ist der hypothesenfreie Satz `rank_four_two_four_ge_26`. Die Abweichungen von der Wortfassung (generischer Punkt statt offener Menge, benannte Hypothesen in `satzF`, schwächere Gestaltaussage in `paar_struktur`) ändern daran nichts, weil sie an der Stelle, an der Satz F angewandt wird, alle entladen sind.

Grenze des Abgleichs: Dass die Lean-Definitionen `UnterfallB` und `NichtSymmetrisch` die Begriffe „Unterfall B im Sinn von B-013“ und „symmetrisch im Sinn von B-012“ wiedergeben, habe ich nur gegen die Prosa `s2_444_spurA_r6.md` geprüft (IsSymm passt genau zu (V1); von UnterfallB benutzt Satz F nur γ* ≠ 0 und rk F_{γ*} = 1 wie in (B0)). Gegen die Wortlaute von B-012 und B-013 habe ich nicht abgeglichen, weil sie nicht auf meiner Positivliste stehen. Für F2 ist das ohne Belang, weil der Endsatz diese Definitionen nicht enthält.

---

## 3. Log von Job 139504538345 (Lauf 45699204903)

- Job „Build lean/ and report axioms“, Workflow „Lean build (own project lean/)“, Ergebnis `success`, Commit `c3c3884028c840d0afd9c14944394aee21fd5729` (Zweig main), 20:53 bis 21:00 UTC am 25.11.2026. „Build completed successfully.“
- SORRY-Zeilen, wörtlich:
  - `SORRY: 0 declaration(s) with 'declaration uses sorry' in the build log`
  - `SORRY: 0 'sorry' token(s) in the sources outside comments`
- Axiome: Für alle `#print axioms`-Zeilen der vier Dateien (SatzF444: 9 Sätze, LemmaZ444: 19, Transponiert444: 11) und für alle `AXIOM-RESULT`-Zeilen zu SatzF444, LemmaK444 (`lemmaK`, `lemmaK_exklusiv`, `folgerungK1`, `lemmaKStatement`, `folgerungK1Statement`, `lemmaK_generisch`, `lemmaK_generischL`, `folgerungK1_generisch`, `folgerungK1_generischL`), LemmaZ444 und Transponiert444 lautet die Liste genau `propext, Classical.choice, Quot.sound` (Reihenfolge teils `propext, Quot.sound, Classical.choice`). Kein `sorryAx`, kein eigenes Axiom, kein `MISSING`. Insbesondere:
  - `'YangBounds.Transponiert444.rank_four_two_four_ge_26' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'YangBounds.SatzF444.satzF' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'YangBounds.LemmaZ444.lemmaZ_bruecke_unbedingt' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'YangBounds.Transponiert444.transponiertEng_genAlgL' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `AXIOM-RESULT|YangBounds.LemmaK444.lemmaK|propext, Classical.choice, Quot.sound`
- Für `LemmaK444.lemmaK` selbst gibt es keine `#print axioms`-Zeile im Bauteil des Logs (LemmaK444.lean druckt keine), wohl aber die `AXIOM-RESULT`-Zeile oben.
- Einzige Warnung in den vier Dateien: `SatzF444.lean:543:6: 'congr 1' tactic does nothing` (harmlos).
- Lokal gebaut habe ich nicht: Der Toolchain-Server und der mathlib-Cache sind aus dieser Sitzung gesperrt (HTTP 403), ein Bau von mathlib aus Quellen hätte Stunden gedauert. Maßgeblich ist nach Protokoll 5.1 Punkt 4 ohnehin der Lauf in GitHub Actions.

---

## 4. Urteil je Teil

| Teil | Urteil | Kurzbegründung |
|---|---|---|
| Lemma K | stimmt überein | `lemmaK`, `lemmaK_exklusiv`, `folgerungK1`: gleiche Fälle, jeder Körper, Hypothesen nicht stärker als in Worten |
| Lemma Z, ≥ 13 verschiedene Punkte | stimmt überein (Form abweichend) | `lemmaZ_generisch_unbedingt`/`lemmaZ_bruecke_unbedingt`: am generischen Punkt statt „für alle p bis auf endlich viele“; Fall (5,8) wird hergeleitet statt vorausgesetzt |
| Lemma Z, Gestalt zusammenfallender Paare | stimmt nicht vollständig überein | `paar_struktur` gibt nur die Zeilenrichtungen, nicht den gemeinsamen Vektor x bzw. w; „mehr als zwei nie“ (`keine_drei`) stimmt |
| Satz F | stimmt nicht wörtlich überein, Umfang getragen | `satzF`/`unterfallB_unmoeglich` an einer Normalform mit Hypothesen `TransponiertEng` und `VielePunkte 11`; an `genAlgL` sind alle Hypothesen bewiesen; Wortfassung folgt nur leer aus F2 |
| Aussage über die Transponierte | stimmt überein (Zusatzvoraussetzungen benannt) | `transp`, `transponiertEng_of` (mit TransN1, TransN2), `transponiertEng_genAlgL` ohne Hypothese |
| F1 | unklar als eigener Satz, unbedingt über F2 | `fall58_ausgeschlossen` bedingt; folgt aus `rank_four_two_four_ge_26` |
| F2 (R ≥ 26 über jedem Körper) | stimmt überein | `rank_four_two_four_ge_26 (K) [Field K] : 26 ≤ tensorRank K 4 2 4`, ohne Hypothese |
| Log: SORRY 0, nur Standard-Axiome | ja | siehe Abschnitt 3 |

Gesamt: Die Lean-Sätze tragen den Ausschluss von Unterfall B in dem Umfang, den B-014 für F1 und F2 behauptet, und F2 steht als hypothesenfreier Lean-Satz mit Standard-Axiomen da. Wörtlich deckungsgleich mit den Einzelaussagen von B-014 sind sie nicht: Lemma Z ist generisch formuliert, die Gestaltaussage für Paare ist schwächer, und Satz F steht als Satz mit benannten Hypothesen da, die erst an der Normalform der Brücke entladen werden.

Rechenaufwand: keine Rechnung, kein Subagent, keine Fremdmodell-Anfrage.
