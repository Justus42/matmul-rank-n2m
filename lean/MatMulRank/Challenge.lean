module

public import Mathlib.Algebra.Field.Defs
public import Mathlib.Algebra.Module.LinearMap.Defs
public import Mathlib.Data.Matrix.Mul
public import Mathlib.Order.Lattice.Nat

@[expose] public section

/-!
# Challenge: the tensor rank of `⟨4, 2, 4⟩` matrix multiplication is 26

This is the statement file (Challenge) for the Palomar registry. It imports only Mathlib.

## The notion

For a field `K` and natural numbers `n, l, m`, a *bilinear algorithm of length `r`* for
`⟨n, l, m⟩` is a family of `r` linear forms `α_k` on `n × l` matrices, `r` linear forms `β_k`
on `l × m` matrices and `r` matrices `C_k` of size `n × m` such that

  `A * B = ∑_{k < r} α_k(A) β_k(B) C_k`   for all `A ∈ K^{n×l}`, `B ∈ K^{l×m}`.

The *tensor rank* `R_K(⟨n, l, m⟩)` is the smallest such `r`. Equivalently, it is the tensor
rank of the matrix multiplication tensor `⟨n, l, m⟩` over `K`, i.e. the least number of
multiplications of a bilinear (non-commutative) algorithm for the product of an `n × l` and
an `l × m` matrix over `K`.

`MatMulRank.BilinearAlgorithm K n l m r` formalises a bilinear algorithm of length `r`, and
`MatMulRank.tensorRank K n l m` formalises `R_K(⟨n, l, m⟩)`.

## The claim

`MatMulRank.rank_four_two_four_eq_26`: for every field `K` (no assumption on the
characteristic, finiteness or algebraic closedness), `R_K(⟨4, 2, 4⟩) = 26`.

In words: two matrices of sizes `4 × 2` and `2 × 4` can be multiplied by a bilinear algorithm
with 26 multiplications, but not by one with 25 or fewer, over any field.

The upper bound `R(⟨4, 2, 4⟩) ≤ 26` is the known bound of Hopcroft and Kerr (1971); the
Solution proves it with an explicit algorithm with 26 products and integer coefficients. The
lower bound `26 ≤ R_K(⟨4, 2, 4⟩)` is the substantial part. The previously known lower bound
was 25 (J. Yang, arXiv:2609.14393, Theorem 2).

## Limitations of the statement

* The statement concerns bilinear algorithms (tensor rank), not border rank, not symmetric
  rank and not commutative algorithms.
* `tensorRank` is written as `sInf` of the set of lengths of bilinear algorithms. With Mathlib's
  convention `sInf ∅ = 0`, an empty set would make `tensorRank K 4 2 4 = 26` false, not true,
  so the convention cannot make the claim vacuous. The set is not empty (schoolbook algorithm).
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

namespace MatMulRank

universe u

/-- **The tensor rank of `⟨4, 2, 4⟩`.** For every field `K`, the least number of
multiplications of a bilinear algorithm for the product of a `4 × 2` matrix and a `2 × 4`
matrix over `K` is 26: `R_K(⟨4, 2, 4⟩) = 26`. -/
theorem rank_four_two_four_eq_26 (K : Type u) [Field K] : tensorRank K 4 2 4 = 26 := by
  sorry

end MatMulRank
