# S2-51: Aussagen-Abgleich des Endsatzes mit GPT 6.2 Sol

Auftrag S2-51 des Orchestrators, 25.11.2026. Gegenstand: der Lean-Satz `YangBounds.Transponiert444.rank_four_two_four_ge_26` in `lean/YangBounds/Transponiert444.lean` und die Behauptung `behauptungen/B-016.md`. Dieser Bericht gibt nur das Urteil des Fremdmodells wieder. Er setzt keinen Status.

## Angaben zur Anfrage

- Modell: `openai/gpt-6.2-sol` (laut Abholung `openai/gpt-6.2-sol-20261117`), Betreiber OpenAI, über die Gemini-Bridge per OpenRouter.
- Denkstufe: high. Batch-Auftrag `openrouter:batch-1795640759-TFqeb7yU8qmykH3i3Cn3`, abgegeben 25.11.2026 22:05, fertig 22:11 (Zeiten laut Bridge).
- Zahl der Anfragen: 1 (keine Wiederholung, keine Nachfrage).
- Tokens: Eingabe 1.250, Ausgabe 367 (davon Denken 101). Kosten laut OpenRouter: < 0,01 US-$. finish_reason: stop.
- Gelesen wurden nur: `behauptungen/B-016.md`, die Aussage des Satzes in `lean/YangBounds/Transponiert444.lean` und die Definitionen in `lean/YangBounds/Basic.lean`; zur Prüfung, dass keine weitere Definition von `tensorRank` oder `BilinearAlgorithm` und keine Instanz die Aussage berührt, eine Textsuche unter `lean/YangBounds/`. Außerdem Abschnitt 5.5 von `PROTOKOLL.md`.

## Urteil des Modells in einem Satz

Das Modell urteilt „agrees“: Die Lean-Aussage `26 ≤ tensorRank K 4 2 4` sagt genau, dass der Tensorrang von ⟨4,2,4⟩ über jedem Körper mindestens 26 ist.

## Gesendeter Text (wörtlich)

````text
You are asked to compare a formal Lean 4 statement with an informal mathematical claim. Please judge only whether the two statements say the same thing; you do not need to judge whether the theorem is true or how it is proved.

## 1. The claim in words

For every field K, the tensor rank of the matrix multiplication tensor <4,2,4> over K satisfies R_K(<4,2,4>) >= 26.

Here an R-rank decomposition of <k,l,m> over a field F is a list of linear maps alpha_r : F^{k x l} -> F, beta_r : F^{l x m} -> F and matrices C_r in F^{k x m} (0 <= r < R) such that A B = sum_r alpha_r(A) beta_r(B) C_r for all A, B; R_F(<k,l,m>) is the smallest R for which such a decomposition exists.

## 2. The Lean statement (verbatim)

Environment: Lean 4 (leanprover/lean4:v4.19.0) with Mathlib. The theorem is stated inside `namespace YangBounds` / `namespace Transponiert444`, with `universe u` declared.

```lean
theorem rank_four_two_four_ge_26 (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4
```

Here `tensorRank` resolves to `YangBounds.tensorRank` (the only project definition of that name).

## 3. All project definitions used in the statement (verbatim, in dependency order)

The file containing these definitions imports `Mathlib.Data.Matrix.Mul`, `Mathlib.Data.Nat.Find`, `Mathlib.Algebra.BigOperators.Fin`, `Mathlib.Logic.Equiv.Fin.Basic` (and an external library that is not used by these definitions). Everything else below is Mathlib.

```lean
namespace YangBounds

open scoped BigOperators

universe u

structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
  alpha : Fin r → (Matrix (Fin n) (Fin l) K →ₗ[K] K)
  beta : Fin r → (Matrix (Fin l) (Fin m) K →ₗ[K] K)
  coeff : Fin r → Matrix (Fin n) (Fin m) K
  correct : ∀ (A : Matrix (Fin n) (Fin l) K) (B : Matrix (Fin l) (Fin m) K),
    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k

variable {K : Type u} [Field K]

def entryForm {a b : ℕ} (i : Fin a) (j : Fin b) : Matrix (Fin a) (Fin b) K →ₗ[K] K where
  toFun M := M i j
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

def unitMatrix {a b : ℕ} (i : Fin a) (j : Fin b) : Matrix (Fin a) (Fin b) K :=
  Matrix.of fun i' j' => if i' = i ∧ j' = j then 1 else 0

noncomputable def standardAlgorithm (K : Type u) [Field K] (n l m : ℕ) :
    BilinearAlgorithm K n l m (Fintype.card (Fin n × Fin l × Fin m)) where
  alpha k := entryForm ((Fintype.equivFin _).symm k).1 ((Fintype.equivFin _).symm k).2.1
  beta k := entryForm ((Fintype.equivFin _).symm k).2.1 ((Fintype.equivFin _).symm k).2.2
  coeff k := unitMatrix ((Fintype.equivFin _).symm k).1 ((Fintype.equivFin _).symm k).2.2
  correct A B := by
    (proof omitted)

theorem exists_bilinearAlgorithm (K : Type u) [Field K] (n l m : ℕ) :
    ∃ r, Nonempty (BilinearAlgorithm K n l m r) :=
  ⟨_, ⟨standardAlgorithm K n l m⟩⟩

noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ := by
  classical
  exact Nat.find (exists_bilinearAlgorithm K n l m)

end YangBounds
```

(The proof of `correct` in `standardAlgorithm` is omitted here; it is a tactic proof of the field `correct`. No other project definitions, instances or notations enter the statement.)

## 4. Question

Does the Lean statement say exactly that the tensor rank of the matrix multiplication tensor <4,2,4> over every field is at least 26?

Please check in particular where the formal statement could be weaker than, vacuous relative to, or different from the claim in words, for example:
- the definition of the rank (is `tensorRank` the minimal length of a decomposition in the sense of Section 1?);
- a minimum or infimum over an empty set, or a default value;
- indices and formats (which dimension is which, the order of the arguments 4 2 4, the matrix product used);
- a restricted class of algorithms compared with arbitrary bilinear (rank-one) decompositions;
- universes;
- type class instances (e.g. which multiplication, scalar action or field structure is used).

Give your verdict as exactly one of: "agrees" / "does not agree" / "unclear", followed by your reasoning.
````

## Antwort des Modells (wörtlich)

````text
agrees

`BilinearAlgorithm K n l m r` is exactly a length-`r` decomposition of the kind described. `Fin r` indexes the terms, `alpha` and `beta` are arbitrary `K`-linear forms on the two input matrix spaces, and `coeff` gives arbitrary output matrices. The `correct` field requires the decomposition identity for every pair of inputs, using ordinary matrix multiplication and entrywise scalar multiplication by `alpha k A * beta k B`. The field instance supplies the operations throughout.

`tensorRank` uses `Nat.find` to select the **least** natural number `r` for which such a decomposition exists. The standard entrywise multiplication algorithm witnesses existence, so this is neither a minimum over an empty set nor a default value.

The arguments `4 2 4` specify a \(4\times2\) matrix multiplied by a \(2\times4\) matrix, with a \(4\times4\) output. The declaration is universe-polymorphic in `u` and takes an arbitrary `K : Type u` with a `Field K` instance, without any further restriction. Thus `26 ≤ tensorRank K 4 2 4` is exactly the stated lower bound over every field.
````
