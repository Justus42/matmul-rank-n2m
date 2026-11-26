# S4-11 Blind-Sucher Runde 2: untere Schranke für R(⟨3,2,7⟩)

Auftrag S4-11, Rolle Blind-Sucher (Beweissucher). Gelesen aus dem Repo: nur `CLAUDE.md` und die Problemstellung im Auftrag. Keine Rechenblöcke, keine Fremdmodell-Anfrage, kein Kontakt nach außen, keine Subagenten.

## 0. Offenlegung: was mir eingeblendet wurde

Ohne mein Zutun wurden mir zu Beginn und während der Sitzung folgende Texte eingeblendet:

1. `CLAUDE.md` (als Sitzungskontext, das ist die erlaubte Datei).
2. Ein Sitzungskontext der Plattform mit Projektname „Matrizen-Multiplikation“, Repo-Adresse, Name „Justus“, GitHub-Login und einer E-Mail-Adresse des Kontoinhabers (die Adresse gebe ich hier absichtlich nicht wieder, weil das Repo öffentlich ist).
3. Der Index des Projektgedächtnisses (`team/silo/MEMORY.md`), wörtlich:

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

4. Später in der Sitzung vier Einzeleinträge des Gedächtnisses, wörtlich (nur Rumpf und Beschreibung, Kopfzeilen gekürzt auf name/description):

```
name: hk-verfahren-a10
description: A-10: Verfahrensdateien 3x2x5 r25 und 3x2x6 r30 (ring Z) liegen in verfahren/, PR #11; Formatfallen
A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 (cac2c55).
**How to apply:** Bekannte Verfahren nicht neu bauen; bei neuen Verfahrensdateien Zusatzschlüssel in origin und ungültige Daten meiden (siehe verfahren/README.md Abschnitt 9). Verwandt: [[verfahren-datenformat]]
```
```
name: lean-upper-3x2x6
description: S1-12: Lean-Datei Upper3x2x6.lean (R(3x2x6) ≤ 30), PR #24; Technik decide +kernel für explizite Verfahren
S1-12, 25.11.2026: `lean/YangBounds/Upper3x2x6.lean`, PR #24 (Merge edb6814).
- Satz `YangBounds.Upper3x2x6.hopcroft_kerr_three_two_six (K) [Field K] : tensorRank K 3 2 6 ≤ 30`, typgleich (rfl) mit der Aussage in Statements.lean. Einsetzen: `import YangBounds.Upper3x2x6`, dann `Upper3x2x6.hopcroft_kerr_three_two_six K`.
- Technik: Tensoridentität über ℤ (`∑ r, u*v*w = [i=s ∧ j=p ∧ q=t]`) mit `decide +kernel` (14 s, kein Zusatzaxiom), dann allgemeiner Übertrag in den Körper. Direktes simp/ring über Matrixliterale mit 30 Produkten läuft in Heartbeat-Timeouts (versuche/V-S1-12-simp-matrixliterale.md).
**How to apply:** Für weitere explizite Verfahren dasselbe Muster nehmen. Verwandt: [[lean-yang-bounds]], [[hk-verfahren-a10]], [[lean-build-cloud]]
```
```
name: git-regeln
description: Seit Protokoll 0.2 (25.11.2026) committen Threads ihre Zieldatei ohne Rückfrage, PR mit Auftragsnummer, Rückfragen an Orchestrator
Ab Protokoll 0.2 (Abschnitt 11): Threads committen ihre Zieldatei ohne Rückfrage, pushen auf den eigenen Zweig und öffnen einen PR, dessen Titel mit der Auftragsnummer beginnt (z. B. "A-01: ..."). Nur die Dateien des Auftrags ändern, STATUS.md/LOG.md pflegt der Orchestrator. Rückfragen an den Orchestrator (Koordinator), nicht an Justus. Der Orchestrator merged.
**Why:** Justus will, dass das Projekt ohne Rückfragen an ihn läuft (testweise).
**How to apply:** Vor jeder Arbeit CLAUDE.md und PROTOKOLL.md von origin/main neu lesen, weil Justus Regeln ändern kann.
```
```
name: verfahren-randfaelle-s1-04
description: S1-04 (25.11.2026): Randfälle des Verfahrensformats in verfahren/README.md Abschnitt 9/10 festgelegt, PR #12 gemergt
S1-04, 25.11.2026: `verfahren/README.md` um Abschnitt 9 (Randfälle, strengere Lesart) und 10 (Anpassungsbedarf der Prüfer) ergänzt, PR #12 gemergt (e8d9cb0). Formatversion bleibt 1.
- Orchestrator-Vorgaben: Zusatzschlüssel überall FEHLERHAFT (auch origin), ungültiges Kalenderdatum FEHLERHAFT, doppelte JSON-Schlüssel FEHLERHAFT. "-0", "-0/5", "0/5" bleiben erlaubt (Orchestrator bestätigt).
- GF(p): p < 2^64. Leere Zeichenketten in origin/claim/notes FEHLERHAFT, null bei optionalen Feldern FEHLERHAFT.
- Muss-Anpassungen: Python (Kalenderdatum, p ≥ 2^64 ablehnen), Rust (Zusatzschlüssel in origin ablehnen). Weitere Prüfpunkte in Abschnitt 10. Programme ändern ist getrennter Auftrag.
**How to apply:** Neue Verfahrensdateien und Prüfer-Aufträge an Abschnitt 9 ausrichten. Verwandt: [[verfahren-datenformat]], [[hk-verfahren-a10]]
```

Einfluss auf diese Arbeit: Die Einträge nennen eine Lean-Familie „YangBounds“ und Verfahren 3×2×5 mit Rang 25 und 3×2×6 mit Rang 30. Das stimmt mit der öffentlichen Literatur überein, die ich unabhängig gefunden habe (Abschnitt 1). Inhalte aus dem Repo jenseits von `CLAUDE.md` habe ich nicht gelesen, auch keine Commit-Listen.

## 1. Literaturstand (öffentlich, außerhalb des Repos)

Suchprotokoll: zwei Websuchen (Stichworte „lower bound tensor rank matrix multiplication 3x2 by 2xn substitution method Bläser Alekseyev“ und „rank of <2,3,n> matrix multiplication lower bound 3n Hopcroft Kerr optimal“), eine erweiterte Suche („3,2,7 … tensor rank 34 35 lower bound“), dann Volltexte über alphaXiv.

* **Obere Schranke.** Hopcroft–Kerr (1971): R(⟨n,2,m⟩) ≤ ⌈(3nm + max(n,m))/2⌉, für ⟨3,2,7⟩ also **35** (z. B. als direkte Summe ⟨3,2,3⟩ ⊕ ⟨3,2,4⟩ mit 15 + 20).
* **Yang**, arXiv:2609.14393 (v3 vom 12.10.2026): R(⟨3,2,m⟩) ≥ ⌈(24m+2)/5⌉ für m ≥ 3, über beliebigen Körpern. Für m = 7: (168+2)/5 = **34**.
* **Tsyganov, Parkina, Samsonov, Rakhuba**, arXiv:2609.22054: R(⟨3,2,m⟩) > 24m/5 (für m = 7 ebenfalls 34). Gleichheitsfall-Analyse mit gemeinsamem Eigenvektor; Lean-geprüft laut Autoren.
* **Wang**, arXiv:2603.07280: automatische Schranken nur über F₂ (u. a. Ja’Ja’–Takche R_{F₂}(⟨3,2,n⟩) ≥ ⌈105n/23⌉, für n = 7 also 32); für beliebige Körper nicht stärker.

Literaturstand für beliebige Körper also: **34 ≤ R(⟨3,2,7⟩) ≤ 35**. Eine Arbeit, die 35 als untere Schranke zeigt, habe ich nicht gefunden.

Bemerkung: m = 7 ist genau der kleinste Fall m ≥ 3 mit m ≡ 2 (mod 5), in dem Yangs Schranke (24m+2)/5 ganzzahlig ist. Dann läuft Yangs Argument für r = 34 in einen Fall, in dem **jede** Ungleichung mit Gleichheit gilt. Darauf setzt der Versuch in Abschnitt 2 bis 4 an: den Gleichheitsfall auszuschließen würde R(⟨3,2,7⟩) = 35 ergeben.

## 2. Ergebnis in Kürze

* Eine untere Schranke über 34 habe ich **nicht** bewiesen. R(⟨3,2,7⟩) ∈ {34, 35} bleibt offen.
* Behauptet (vollständig ausgeschrieben in Abschnitt 4, nicht geprüft): **Satz G.** Hat ⟨3,2,7⟩ eine Zerlegung der Länge 34 über einem Körper K, dann ist jede Ungleichung in Yangs Beweis scharf, und die Zerlegung hat nach Normierung eine sehr starre Gestalt: Es gibt einen Vektor ω ≠ 0 im Unterraum J (Dimension 7), so dass alle Produkte von ω mit Polynomen vom Grad ≤ 2 in den beiden Diagonalen p₁, p₂ wieder in J liegen; der Raum 𝒫²ω hat Dimension 5 oder 6; ω hat mindestens 28 (Fall A) bzw. 22 (Fall B) von 34 Koordinaten ungleich null; in Fall B liegen die zugehörigen Punkte auf genau einem Kegelschnitt, in Fall A auf keiner Kubik.
* Den Widerspruch aus dieser Gestalt habe ich nicht gefunden. Abschnitt 5 sagt genau, welche Beziehungen der Zerlegung Yangs Zählung nicht benutzt, und dass der Widerspruch, wenn es ihn gibt, aus ihnen kommen muss.
* Kein Verfahren gefunden, also kein maschinenlesbarer Anhang. Keine Rechnung ausgeführt.

## 3. Bezeichnungen und benutzte Tatsachen aus der Literatur

K ein Körper; ohne Einschränkung unendlich (Übergang zu K(t) erhält die Länge einer Zerlegung und macht die Schranke höchstens kleiner). m = 7, r = Länge der Zerlegung
AB = Σ_{t=1}^{r} α_t(A) β_t(B) C_t, A ∈ K^{3×2}, B ∈ K^{2×m}.

Wie bei Yang: D(A) = diag(α_t(A)) ∈ K^{r×r}, ℬ(B) = (β_t(B))_t ∈ K^r, W(z) = Σ z_t C_t, also AB = W D(A) ℬ(B). Diagonalmatrizen fasse ich als Vektoren in K^r auf; Produkt von Diagonalmatrix und Vektor ist dann das koordinatenweise Produkt, geschrieben xy. Für Unterräume X, Y ⊆ K^r ist XY der Spann aller Produkte.

**Normierung (Yang, Lemma 6, Literatur, hier nicht erneut bewiesen).** Nach Basiswechsel in Zeilen und Spalten von A und Reskalierung der Summanden gilt α_t(e₀₀) = 1 für alle t, und (starke Normierung) für jedes v ∈ K^{2×m}, v ≠ 0, sind D(e₀₀)ℬ(v), D(e₁₀)ℬ(v), D(e₂₀)ℬ(v) linear unabhängig.

Setze p_i := D(e_{i0}) (i = 1, 2), 𝒫 := span(1, p₁, p₂) ⊆ K^r, 𝒫^k := Spann aller Produkte von k Faktoren aus 𝒫 (wegen 1 ∈ 𝒫 sind das die Polynome vom Grad ≤ k in p₁, p₂). Ferner z_i := D(e_{i1}), 𝒯 := span(z₀, z₁, z₂).
U := {B : erste Zeile 0} ≅ K^m, b(v) := ℬ([0; v]), b'(v) := ℬ([v; 0]), J := b(K^m), H := ker W.

Aus der Zerlegungsgleichung mit A = Einheitsmatrizen e_{ij} und B = [0;v] bzw. [v;0] folgt sofort (vollständige Liste):

(R1) W(b(v)) = 0 und W(p_i b(v)) = 0, also 𝒫J ⊆ H.
(R2) W(z_i b(v)) = e_i ⊗ v (i = 0,1,2).
(R3) W(b'(v)) = e₀ ⊗ v, W(p_i b'(v)) = e_i ⊗ v.
(R4) W(z_i b'(v)) = 0, also 𝒯J' ⊆ H mit J' := b'(K^m).

Folgerungen: W ist surjektiv, dim H = r − 3m; b ist injektiv, dim J = m; aus (R2): die Abbildung 𝒯 ⊗ J → K^r/H, z ⊗ y ↦ zy + H ist injektiv (ihr Bild unter W ist ganz K^{3×m}). Insbesondere gilt für jeden Unterraum J₀ ⊆ J:

(C4) dim 𝒯J₀ = 3·dim J₀ und 𝒯J₀ ∩ H = 0.

Aus (R2), (R3): (E) z_i b(v) − p_i b'(v) ∈ H für i = 0,1,2 (mit p₀ := 1).

Yangs Größen (in dieser Schreibweise; f₀ = b, J = f₀(U)): Q := H/J, q := dim Q = r − 4m; F_i : J → Q, y ↦ p_i y + J; s := dim(F₁(J) + F₂(J)) = dim(𝒫J) − m ≤ q; N := {y ∈ J : p₁y, p₂y ∈ J}, n₀ := dim N; rk 𝐇 = m − n₀ (𝐇(y) = (F₂y, −F₁y)); Δ := 2(m − n₀) − s.

Benutzte Aussagen aus Yang (arXiv:2609.14393 v3), deren Beweise ich nachgerechnet habe:
* (Y-Gl.1, Lemma 10) 2m + (m − n₀) ≤ s + 2q.
* (Y-L8) Für jeden Unterraum 0 ≠ S ⊆ J: dim 𝒫S ≥ dim S + 2. (Beweis über die Fahne der Koordinatenunterräume und starke Normierung.)
* (Y-L12) Mit S := {y ∈ N : p₁y, p₂y ∈ N} gilt dim S ≥ n₀ − Δ. (Die Abbildung τ : N → ker L, y ↦ (σ₂y, −σ₁y) ist injektiv, ker L hat Dimension 2m − s, enthält N×N, und S = τ⁻¹(N×N).)
* Folgerung Δ ≥ min(2, n₀): Ist S ≠ 0, liefert Y-L8 auf S wegen 𝒫S ⊆ N die Ungleichung n₀ ≥ dim S + 2 ≥ n₀ − Δ + 2.

## 4. Satz G (Gleichheitsfall r = 34 für m = 7) mit Beweis

**Satz G.** Sei m = 7 und eine Zerlegung der Länge r = 34 wie in Abschnitt 3 normiert. Setze J_k := {y ∈ J : 𝒫^k y ⊆ J} (also J₀ = J, J₁ = N). Dann gilt:

(a) 𝒫J = H, dim H = 13, s = q = 6.
(b) dim J₁ = 3, Δ = 2.
(c) dim J₂ = 1, J₂ = ⟨ω⟩, und J₁ = 𝒫ω.
(d) J₃ = 0. Insbesondere enthält J keinen von p₁, p₂ invarianten Unterraum ≠ 0, und 𝒫²ω ⊄ J₁.
(e) 𝒫²ω ⊆ J und dim 𝒫²ω ∈ {5, 6}.
(f) Fall A (dim 𝒫²ω = 6): J = 𝒫²ω ⊕ ⟨u⟩, dim 𝒫³ω = 10, H = 𝒫³ω ⊕ 𝒫u.
    Fall B (dim 𝒫²ω = 5): Es gibt bis auf Skalar genau ein Polynom Q₀ ≠ 0 vom Grad ≤ 2 mit Q₀(p₁,p₂)ω = 0; J = 𝒫²ω ⊕ ⟨u₁,u₂⟩, dim 𝒫³ω = 7, H = 𝒫³ω ⊕ 𝒫u₁ ⊕ 𝒫u₂.
(g) Sei Σ := {t : ω_t ≠ 0}. Dann ist 𝒫³ω ⊕ 𝒯𝒫²ω eine direkte Summe von Vektoren mit Träger in Σ, der Dimension 28 (Fall A) bzw. 22 (Fall B). Also |Σ| ≥ 28 bzw. |Σ| ≥ 22. In Fall A liegen die Punkte (p₁(t), p₂(t)), t ∈ Σ, auf keiner affinen Kubik (mindestens 10 verschiedene Punkte); in Fall B liegen sie alle auf dem Kegelschnitt Q₀ = 0.

**Beweis.** q = r − 4m = 6. Nach Y-Gl.1: 21 − n₀ ≤ s + 12, also n₀ ≥ 9 − s ≥ 3 wegen s ≤ q = 6.

Fall Δ ≤ 1: dann n₀ ≤ Δ ≤ 1 (aus Δ ≥ min(2,n₀)), Widerspruch zu n₀ ≥ 3. Also Δ ≥ 2, d. h. 2(7 − n₀) − s ≥ 2, also n₀ ≤ 6 − s/2. Zusammen mit n₀ ≥ 9 − s: 9 − s ≤ 6 − s/2, also s ≥ 6. Mit s ≤ 6 folgt s = 6, dann n₀ ≥ 3 und n₀ ≤ 3, also n₀ = 3 und Δ = 2(7−3) − 6 = 2. Damit (b).

(a): s = q heißt dim(𝒫J/J) = dim(H/J), und 𝒫J ⊆ H nach (R1), also 𝒫J = H.

(c): Yangs S ist {y ∈ J₁ : p₁y, p₂y ∈ J₁} = {y ∈ J₁ : 𝒫y ⊆ J₁}. Für y ∈ J gilt 𝒫y ⊆ J₁ genau dann, wenn 𝒫y ⊆ J und 𝒫²y ⊆ J, also genau dann, wenn y ∈ J₂ (da 1 ∈ 𝒫, ist J₂ ⊆ J₁). Also S = J₂. Nach Y-L12 ist dim J₂ ≥ n₀ − Δ = 1. Nach Y-L8 angewandt auf S = J₂ ≠ 0 mit 𝒫J₂ ⊆ J₁: dim J₂ + 2 ≤ dim J₁ = 3, also dim J₂ ≤ 1. Sei J₂ = ⟨ω⟩. Dann 𝒫ω ⊆ J₁, und dim 𝒫ω = 3 nach starker Normierung, also 𝒫ω = J₁.

(d): Sei y ∈ J₃, y ≠ 0. Dann y ∈ J₂ und für jedes ℓ ∈ 𝒫 ist 𝒫²(ℓy) ⊆ 𝒫³y ⊆ J, also ℓy ∈ J₂. Somit 𝒫y ⊆ J₂ = ⟨ω⟩, dim 𝒫y ≤ 1, Widerspruch zur starken Normierung. Ein p-invarianter Unterraum V ≠ 0 von J läge in jedem J_k, insbesondere in J₃. Wäre 𝒫²ω ⊆ J₁, dann wäre J₁ = 𝒫ω invariant (𝒫J₁ = 𝒫²ω ⊆ J₁), Widerspruch.

(e): ω ∈ J₂ heißt 𝒫²ω ⊆ J. Y-L8 auf J₁ = 𝒫ω: dim 𝒫²ω = dim 𝒫J₁ ≥ 3 + 2 = 5. Und 𝒫² hat Dimension ≤ 6 (1, p₁, p₂, p₁², p₁p₂, p₂²).

(f): Nach (a) und (e) ist H = 𝒫J ⊇ 𝒫(𝒫²ω) = 𝒫³ω. Fall A: J = 𝒫²ω ⊕ ⟨u⟩, also H = 𝒫³ω + 𝒫u, 13 ≤ dim 𝒫³ω + 3, also dim 𝒫³ω ≥ 10; und ≤ 10, da es 10 Monome vom Grad ≤ 3 in zwei Variablen gibt. Dann ist die Summe direkt. Fall B: Die Auswertung g ↦ g(p₁,p₂)ω auf Polynomen vom Grad ≤ 2 hat einen eindimensionalen Kern ⟨Q₀⟩. Dann liegen Q₀, p₁Q₀, p₂Q₀ (linear unabhängig, Grad ≤ 3) im Kern der Auswertung auf Grad ≤ 3, also dim 𝒫³ω ≤ 10 − 3 = 7. J = 𝒫²ω ⊕ ⟨u₁,u₂⟩ gibt 13 ≤ dim 𝒫³ω + 6, also = 7 und die Summe ist direkt.

(g): 𝒫³ω ⊆ H nach (f). 𝒫²ω ⊆ J, also nach (C4): dim 𝒯𝒫²ω = 3·dim 𝒫²ω (18 bzw. 15) und 𝒯𝒫²ω ∩ H = 0. Also ist 𝒫³ω + 𝒯𝒫²ω direkt, mit Dimension 10 + 18 = 28 bzw. 7 + 15 = 22. Alle diese Vektoren sind Produkte mit ω, haben also Träger in Σ; ein Raum von Vektoren mit Träger in Σ hat Dimension ≤ |Σ|. Die Aussagen über die Punkte: Die Auswertung der Polynome vom Grad ≤ 3 an den Punkten (p₁(t), p₂(t)), t ∈ Σ, gewichtet mit ω_t ≠ 0, ist in Fall A injektiv; das heißt, keine Kubik verschwindet an allen diesen Punkten, und es sind mindestens 10 verschiedene. In Fall B verschwindet Q₀ an allen diesen Punkten. ∎

**Lücken im Beweis von Satz G.** Keine bekannte; benutzt werden nur (R1)–(R4), Yangs Lemma 6 (Normierung, inklusive der Wahl über unendlichem Körper), Lemma 8, Lemma 10 (Gl. 1) und Lemma 12. Diese Lemmata habe ich Zeile für Zeile nachgerechnet, sie aber nicht formalisiert. Prüfbedarf: ob Yangs Lemma 6 tatsächlich gleichzeitig α_t(e₀₀) = 1 für alle t und die starke Normierung liefert (es liefert D(e₀₀) invertierbar; die Reskalierung auf 1 ist eine Diagonalskalierung von α_t und C_t, die die starke Normierung erhält, weil sie J, p_i J nur koordinatenweise mit einer festen invertierbaren Diagonale multipliziert).

**Symmetrie (vermutet, nicht ausgeschrieben).** Vertauscht man die beiden Spalten von A und die beiden Zeilen von B, erhält man wieder eine Zerlegung von ⟨3,2,7⟩ der Länge 34. Nach Normierung mit z₀ statt 1 gilt dann Satz G auch für (𝒯, J'): 𝒯J' = H, ein ω' mit 𝒯²ω' ⊆ z₀J' usw. Ebenso für jede generische Spaltenkombination. Für eine Normierung braucht man z₀ invertierbar; das ist eine generische Bedingung an den Spaltenbasiswechsel, den Lemma 6 ohnehin generisch wählt. Ich habe nicht ausgeschrieben, dass beide Normierungen gleichzeitig mit derselben Zerlegung möglich sind.
