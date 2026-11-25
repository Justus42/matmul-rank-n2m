# S2-32: Lemma P in Lean (Stufe 2, Runde 8, Spur A, Formalisierer)

Status aller Aussagen: **behauptet** (bis zu einem Aussagen-Abgleich nach Protokoll 5.1 Punkt 3).

- `lemmaP_prosa.md`: die Prosa-Fassung von Lemma P, die formalisiert wurde (elementar: Endlichkeit auf Geraden über ein Eigenwertargument, Schubfach, Eigenwertargument statt Kronecker, rk L = 5 statt Lemma 9; nur „K unendlich“).
- `gpt_auftrag.md`, `gpt_antwort.md`: Gegenlesen durch GPT 6.2 Sol (openai/gpt-6.2-sol über OpenRouter in der Bridge, Batch, Denkstufe high, 25.11.2026, 0,03 US-$) vor der Formalisierung. Urteil wörtlich: „Gesamturteil: Der Beweis hält. Lemma P ist unter (H1)–(H3) über jedem unendlichen Körper bewiesen.“ Keine inhaltliche Reparatur verlangt; Hinweis, den Endomorphismus in 8(c) anders zu benennen als die Indexmenge T (in Lean heißt er `Tm`).
- Lean: `lean/YangBounds/LemmaP444.lean`.

## Hauptsätze (Lean, Wortlaut)

```lean
theorem lemmaP (K : Type u) [Field K] [Infinite K] : LemmaPStatement K

theorem nur_unterfallB' [IsAlgClosed K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hns : NichtSymmetrisch alg) : UnterfallB alg

theorem nur_unterfallB_global' (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      ((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8) →
        NichtSymmetrisch alg' → UnterfallB alg')
```

## Abweichung von der Aussage `LemmaPStatement`

`LemmaPStatement K` ist für einen beliebigen Körper K formuliert (Definition in `SatzE444Buendel.lean`, unverändert). Bewiesen ist sie für jeden **unendlichen** Körper (`lemmaP`), insbesondere für jeden algebraisch abgeschlossenen. Für endliche Körper ist nichts gezeigt; der Beweis braucht unendlich viele Parameter t. Für `nur_unterfallB` und `nur_unterfallB_global` genügt das, weil beide ohnehin über einem algebraisch abgeschlossenen Körper arbeiten.

Nicht Teil des Auftrags und nicht gezeigt: der Übergang von Satz C (generischer Punkt) zur Nicht-Symmetrie (`NichtSymmetrisch` bleibt Voraussetzung) und Unterfall B (B-014).
