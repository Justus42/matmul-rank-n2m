# S2-28: Auftrag an das Fremdmodell

- Modell: openai/gpt-6.2-sol über die Bridge (OpenRouter), Batch-Modus, Denkstufe high, Ausgabegrenze 32 000 Tokens.
- Batch-Kennung: openrouter:batch-1795621743-Shw4g2JyXlvFpQNb4aNT, abgegeben 25.11.2026 15:49 UTC.
- System-Rolle: „Du bist ein strenger mathematischer Gutachter (algebraische Geometrie, Tensorrang). Dein Ziel ist, Fehler zu finden, nicht den Beweis zu bestätigen. Antworte auf Deutsch.“
- Die Bridge kann das Repo nicht lesen. Alle Texte gingen wörtlich im Prompt mit. Das Urteil des Prüfers wurde nicht genannt.

## Aufbau des Prompts

1. Auftragstext mit den 13 Fragen (wörtlich unten).
2. TEIL A: `lean/prosa/s2_444_spurA_r6.md` vollständig und ungekürzt (Stand main, Commit a3046ac).
3. TEIL B, wörtliche Auszüge aus `lean/prosa/s2_444_spurA_r4.md`: Abschnitt 2 ganz; Satz C (nur Aussage); Folgerung C2; Einleitung von Abschnitt 5; Lemma P (Aussage und der Satz zu ℓ(u_0), ohne Beweis, als vorausgesetzt markiert); Satz E (nur Aussage); Abschnitt 5.3 ganz.
4. TEIL C, wörtliche Auszüge aus `lean/prosa/s2_444_spurA_r2.md` Abschnitt 2 (Rahmen, Ψ, (Ψ1), Ĵ, Wahl von p und u_0), Aussagen von Satz A, Folgerung A2, Lemma 13′, Definition von N(u_0), Aussage von Satz B; aus `lean/prosa/yang_n4.md` die Aussagen von Folgerung 7, Lemma 8, Lemma 9; Aussage von B-007.

Beweise der Voraussetzungen (Satz C, Lemma P, Satz E, Satz A, Satz B) gingen nicht mit; sie waren als Voraussetzungen markiert, die nicht zu prüfen sind.

## Auftragstext (wörtlich)

Unten steht ein Prosa-Beweis (Teil A, Bericht „S2-24“, wörtlich und ungekürzt) und die Definitionen und vorausgesetzten Aussagen, auf die er sich stützt (Teil B und C, wörtliche Auszüge aus zwei früheren Berichten „S2-16“ und „S2-05“ sowie aus einer Ausarbeitung von Yangs Arbeit). Es geht um die Behauptung, dass der Tensor der Matrixmultiplikation ⟨4,2,4⟩ keine Zerlegung der Länge 25 im Restfall (rk L, rk H) = (5,8), Unterfall B hat (Satz F), mit den Hilfssätzen Lemma K und Lemma Z.

Die Aussagen aus Teil B und C (Satz A, Satz B, Satz C, Folgerung C2, Lemma P, Satz E, Lemma 13′, Folgerung 7, Lemma 8, Lemma 9, B-007: R(⟨4,2,4⟩) ≥ 25 über jedem Körper) sind VORAUSSETZUNGEN. Prüfe sie nicht. Prüfe aber genau, ob der Beweis in Teil A sie korrekt und in der dort definierten Form benutzt.

Prüfe Lemma K, Lemma Z, den Abschnitt 4 (B0 bis B3) und Satz F mit Folgerung F1 Schritt für Schritt. Suche aktiv nach Gegenbeispielen und Lücken. Beantworte insbesondere jede der folgenden Fragen mit JA, NEIN oder TEILWEISE und einer Begründung:

1. Ist Lemma K richtig, über jedem Körper (auch Charakteristik 2 und 3, auch endliche Körper)?
2. Folgt in Lemma Z Schritt 1 die Konstanz von κ_t korrekt aus (G) Ĵ_p = ker W? Wird dabei (G) richtig aus dem Fall (5,8) gewonnen?
3. Folgt in Lemma Z „jede Klasse hat höchstens zwei Elemente“ korrekt aus Lemma K und der Minimalität (B-007)? Ist das Minimalitätsargument (Zusammenlegen zweier Terme mit A_{t′} = λA_t und B_{t′} = μB_t) richtig?
4. Gibt es für alle p außerhalb endlich vieler Punkte von ℙ¹ wirklich mindestens 13 paarweise verschiedene Punkte [a_t(p) ⊗ b_t(p)] an DERSELBEN Stelle p (nicht nur 13 Terme, die paarweise an irgendeiner Stelle verschieden sind)?
5. Sind (B0) bis (B2) korrekt aus Unterfall B (Definition in Teil B, Lemma P) hergeleitet: dim Ψ(D,K⁴) = 5, Kronecker-Form genau ein Block L_4ᵀ, Hankel-Rang ≤ 1 ⇒ λ_t = c_t·ev_{σ_t}, c_t ≠ 0, b_t ∝ ν_D(σ_t), σ_t = π_D([a_t])?
6. Ist (B3) korrekt: Transponierte als Zerlegung, a′_t(p) = −b_t(Jp), b′_t(p) = a_t(Jp), ker W′ = ker W, Transponierte im Fall (5,8), nicht symmetrisch, in Unterfall B, und lassen sich die Bedingungen für Zerlegung (an p) und Transponierte (an J⁻¹p) an einer gemeinsamen Stelle erfüllen? Ist der Parameter τ_t in a_t ∝ ν_E(τ_t) und in τ_t = π_E([b_t]) derselbe?
7. Satz F Schritt 1: Ist φ = π_D ∘ ν_E ein Morphismus ℙ¹ → ℙ¹ vom Grad d mit 1 ≤ d ≤ 3, und gilt σ_t = φ(τ_t) für alle t (auch wenn die Kubik ν_E die Gerade ℙ(D^⊥) trifft)? Spielt die Identifikation ℙ(D*) ≅ ℙ¹ über ι_D eine Rolle?
8. Satz F Schritt 2 und 3: Sind Γ_1, Γ_2 irreduzibel und reduziert, mit Bigrad (d,1) bzw. (1,e)? Ist die Schranke von höchstens d·e + 1 ≤ 10 verschiedenen gemeinsamen Punkten für Γ_1 ≠ Γ_2 richtig, in jeder Charakteristik, auch bei inseparablem φ oder ψ? Folgt aus 13 verschiedenen Punkten [a_t ⊗ b_t] wirklich, dass es 13 verschiedene Paare (τ_t, σ_t) in Γ_1 ∩ Γ_2 gibt?
9. Satz F Schritt 4: Folgt aus Γ_1 = Γ_2 wirklich d = e = 1 (auch in Charakteristik p > 0, wo ein Frobenius-artiges φ bijektiv auf Punkten sein kann)? Liefert das eine invertierbare Matrix M mit M b_t(p) ∈ K·a_t(p) für alle t an derselben Stelle p, und widerspricht das (V1)/Folgerung C2 in der dort definierten Form?
10. Werden alle Generizitätsannahmen an p (und an u_0) korrekt verwaltet: Schnitt endlich vieler nichtleerer offener Mengen, Übergang zum algebraischen Abschluss, K unendlich?
11. Folgt Folgerung F1 (Fall (5,8) ausgeschlossen) aus Satz F und den Voraussetzungen, so wie sie in Teil B formuliert sind?
12. Gesamturteil zu Lemma K, Lemma Z, Satz F und F1: hält / hält mit benannter Reparatur / Lücke (genaue Stelle). Nenne jede Reparatur so konkret, dass ein Formalisierer sie umsetzen kann.
13. Was ist für eine Lean-4-Formalisierung (mit mathlib) von Lemma K, Lemma Z und Satz F am schwersten, und gibt es elementarere Ersatzargumente (etwa für Bézout und Kronecker)?

Antworte strukturiert nach den Nummern 1 bis 13.
