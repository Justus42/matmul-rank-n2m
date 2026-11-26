module

public import Mathlib.Algebra.Field.Defs
public import Mathlib.Algebra.Module.LinearMap.Defs
public import Mathlib.Data.Matrix.Mul
public import Mathlib.Order.Lattice.Nat

@[expose] public section

/-!
# Definitions of the Challenge, for the Solution

This module repeats the definitions of `MatMulRank/Challenge.lean` (the block between the
markers `BEGIN SHARED DEFINITIONS` and `END SHARED DEFINITIONS`) character for character, with
exactly the same imports, and without the Challenge theorem.

Why this file exists: Comparator requires every declaration used by the compared statement to
be identical in the Challenge and in the Solution. The Solution cannot import the Challenge
(the Challenge contains the theorem with `sorry` under the same name). Elaborating the
definitions inside the Solution itself would happen in a larger environment (the whole
project), where instance search could choose different (definitionally equal, but not
identical) terms. Elaborating them here, in the same environment as in the Challenge, avoids
that. The workflow `lean-project.yml` checks that the two blocks are identical.
-/

-- BEGIN SHARED DEFINITIONS (identical in MatMulRank/Challenge.lean and MatMulRank/Definitions.lean)

namespace MatMulRank

open scoped BigOperators

universe u

/-- A bilinear algorithm of length `r` for `⟨n, l, m⟩` matrix multiplication over the field `K`:
linear forms `alpha k` on `n × l` matrices, linear forms `beta k` on `l × m` matrices and
fixed `n × m` matrices `coeff k` (for `k : Fin r`) with
`A * B = ∑ k, (alpha k A * beta k B) • coeff k` for all `A`, `B`.
Here `A * B` is the ordinary Mathlib matrix product. In the usual language of algebraic
complexity this is a decomposition of the matrix multiplication tensor `⟨n, l, m⟩` into `r`
tensors of rank one. -/
structure BilinearAlgorithm (K : Type u) [Field K] (n l m r : ℕ) where
  alpha : Fin r → (Matrix (Fin n) (Fin l) K →ₗ[K] K)
  beta : Fin r → (Matrix (Fin l) (Fin m) K →ₗ[K] K)
  coeff : Fin r → Matrix (Fin n) (Fin m) K
  correct : ∀ (A : Matrix (Fin n) (Fin l) K) (B : Matrix (Fin l) (Fin m) K),
    A * B = ∑ k : Fin r, (alpha k A * beta k B) • coeff k

/-- `R_K(⟨n, l, m⟩)`, the tensor rank of `⟨n, l, m⟩` matrix multiplication over the field `K`:
the smallest length `r` of a bilinear algorithm for `⟨n, l, m⟩` over `K`.
It is written as the infimum of a set of natural numbers. The set is never empty (the
schoolbook algorithm has length `n * l * m`), so the infimum is its least element; Mathlib's
convention `sInf ∅ = 0` is never used. -/
noncomputable def tensorRank (K : Type u) [Field K] (n l m : ℕ) : ℕ :=
  sInf {r : ℕ | Nonempty (BilinearAlgorithm K n l m r)}

end MatMulRank

-- END SHARED DEFINITIONS
