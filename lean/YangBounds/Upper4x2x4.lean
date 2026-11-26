module

public import YangBounds.Basic
public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Data.Int.Cast.Lemmas
public import Mathlib.Tactic.Ring

@[expose] public section

/-!
# Upper bound `R(⟨4, 2, 4⟩) ≤ 26` over every field

Task S5-17 (stage 5, track P, round 4, role: porting task with formalisation).

The algorithm is the integer algorithm `verfahren/4x2x4-r26-s001.json` (claim B-010, coefficient
ring `Z`, 26 products, all coefficients `0`, `1` or `-1`; the value 26 is the known upper bound
of Hopcroft and Kerr 1971). The coefficient tables `u`, `v`, `w` below were generated
mechanically from that file (SHA-256 of the JSON file
`3a8a92145de7f220f6d12edd0666cc58bc631ca6e3512d67c59eb5ef3d955ae4`), one entry per product in
the order of the file. The meaning is that of `verfahren/README.md`, Section 2:
`a_r = ∑ u r i j * A i j`, `b_r = ∑ v r j l * B j l`, `C i l += w r i l * a_r * b_r`.

The proof follows `YangBounds/Upper3x2x6.lean`:

1. `tensor_identity`: over `ℤ`, `∑ r, u r i j * v r p q * w r s t` is `1` if `i = s`, `j = p`,
   `q = t` and `0` otherwise, for all 1024 index tuples. This is a finite computation with
   integers, checked by the Lean kernel (`decide +kernel`; this is not `native_decide`, it adds
   no axiom and does not use the compiler).
2. `algorithm`: the coefficients are mapped into an arbitrary field `K` with the cast
   `ℤ → K`. Correctness follows from the tensor identity by expanding both sides into sums
   over all `(i, j, p, q)`. Nothing here depends on the characteristic of `K`.
3. `rank_four_two_four_le_26`: `tensorRank_le` applied to `algorithm`.
-/

namespace YangBounds

namespace Upper4x2x4

universe u

/-- Coefficients `u` of the 26 products: `a_r = ∑ u r i j * A i j`. -/
def u : Fin 26 → Fin 4 → Fin 2 → ℤ :=
  ![
    ![![-1, 1], ![1, -1], ![1, -1], ![0, 0]],  -- product 1
    ![![-1, 1], ![0, 0], ![0, 0], ![0, 0]],  -- product 2
    ![![1, -1], ![-1, 1], ![0, 0], ![0, 0]],  -- product 3
    ![![1, -1], ![-1, 0], ![-1, 1], ![0, 0]],  -- product 4
    ![![1, -1], ![-1, 1], ![0, 1], ![0, -1]],  -- product 5
    ![![-1, 1], ![0, 0], ![0, 1], ![-1, 0]],  -- product 6
    ![![-1, 1], ![0, 0], ![1, -1], ![0, 0]],  -- product 7
    ![![1, -1], ![-1, 1], ![-1, 1], ![1, -1]],  -- product 8
    ![![0, 1], ![0, 0], ![0, 1], ![0, 0]],  -- product 9
    ![![0, 0], ![0, -1], ![0, 0], ![0, 0]],  -- product 10
    ![![-1, 1], ![0, 0], ![0, 0], ![-1, 1]],  -- product 11
    ![![0, 0], ![0, 0], ![0, 0], ![0, -1]],  -- product 12
    ![![-1, 1], ![0, 0], ![0, 0], ![-1, 0]],  -- product 13
    ![![-1, 0], ![0, 0], ![0, 0], ![-1, 0]],  -- product 14
    ![![-1, 1], ![1, -1], ![1, -1], ![0, 1]],  -- product 15
    ![![-1, 1], ![1, 0], ![0, 0], ![0, 0]],  -- product 16
    ![![-1, 0], ![1, 0], ![1, 0], ![0, 0]],  -- product 17
    ![![0, 1], ![0, 0], ![0, 0], ![0, 0]],  -- product 18
    ![![0, 0], ![0, 0], ![-1, 0], ![1, 0]],  -- product 19
    ![![0, 0], ![0, 0], ![1, -1], ![0, 0]],  -- product 20
    ![![0, 0], ![0, 0], ![0, -1], ![0, 1]],  -- product 21
    ![![0, -1], ![0, 1], ![0, 1], ![0, -1]],  -- product 22
    ![![0, 1], ![0, 0], ![0, 0], ![0, 0]],  -- product 23
    ![![0, 0], ![1, 0], ![0, 0], ![0, 0]],  -- product 24
    ![![1, 0], ![-1, 0], ![0, 0], ![0, 0]],  -- product 25
    ![![0, 0], ![0, 0], ![0, 0], ![-1, 0]]]  -- product 26

/-- Coefficients `v` of the 26 products: `b_r = ∑ v r j l * B j l`. -/
def v : Fin 26 → Fin 2 → Fin 4 → ℤ :=
  ![
    ![![0, 0, 0, 0], ![0, 1, 0, 0]],  -- product 1
    ![![1, 1, 0, 0], ![0, 0, 0, 0]],  -- product 2
    ![![0, 0, 0, 0], ![1, 0, 0, 0]],  -- product 3
    ![![0, 1, 1, 0], ![0, 1, 0, 0]],  -- product 4
    ![![0, 0, 0, -1], ![-1, 0, 0, 0]],  -- product 5
    ![![0, 1, 1, 0], ![-1, 1, 1, 1]],  -- product 6
    ![![0, -1, -1, 0], ![0, 0, 0, 0]],  -- product 7
    ![![0, 0, 0, 1], ![0, 0, 0, 0]],  -- product 8
    ![![0, -1, -1, 0], ![0, -1, -1, 0]],  -- product 9
    ![![0, 0, 0, 0], ![0, 0, 1, 0]],  -- product 10
    ![![0, 0, 0, 0], ![1, -1, -1, -1]],  -- product 11
    ![![0, 0, 0, 0], ![0, 1, 0, 1]],  -- product 12
    ![![-1, 0, 1, 0], ![-1, 1, 1, 1]],  -- product 13
    ![![-1, 1, 1, 1], ![-1, 1, 1, 1]],  -- product 14
    ![![0, 0, 0, 1], ![0, -1, 0, 0]],  -- product 15
    ![![-1, 0, 1, 0], ![-1, 0, 0, 0]],  -- product 16
    ![![0, 1, 0, 0], ![0, 1, 0, 0]],  -- product 17
    ![![0, -1, -1, 0], ![0, -1, -1, 0]],  -- product 18
    ![![-1, 0, 0, 1], ![0, 0, 0, 0]],  -- product 19
    ![![0, -1, -1, 0], ![0, 0, 0, 0]],  -- product 20
    ![![0, 0, 0, 0], ![-1, 0, 0, 1]],  -- product 21
    ![![0, 0, 0, 1], ![0, 0, 0, 1]],  -- product 22
    ![![1, 1, 0, 0], ![1, 1, 0, 0]],  -- product 23
    ![![0, 0, -1, 0], ![0, 0, 0, 0]],  -- product 24
    ![![-1, 0, 0, 0], ![-1, 0, 0, 0]],  -- product 25
    ![![0, 1, 0, 1], ![0, 0, 0, 0]]]  -- product 26

/-- Coefficients `w` of the 26 products: `C i l += w r i l * a_r * b_r` (not transposed). -/
def w : Fin 26 → Fin 4 → Fin 4 → ℤ :=
  ![
    ![![0, 0, 0, 0], ![0, -1, 0, 0], ![1, 0, 0, 1], ![1, -1, 1, 1]],  -- product 1
    ![![-1, 0, 0, 0], ![-1, 0, 0, 0], ![1, 0, 0, 0], ![1, 0, 0, 0]],  -- product 2
    ![![0, 0, 0, 0], ![1, 0, 0, 1], ![-1, 0, 0, -1], ![0, 0, 0, 0]],  -- product 3
    ![![0, 0, 0, 0], ![0, -1, 0, 0], ![0, 1, -1, 0], ![0, 0, 0, 0]],  -- product 4
    ![![0, 0, 0, 0], ![0, 0, 0, 1], ![-1, 0, 0, -1], ![0, 0, 0, 0]],  -- product 5
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![-1, 0, 0, 0], ![-1, 0, -1, 0]],  -- product 6
    ![![-1, 1, 0, -1], ![-1, 1, 0, -1], ![0, 0, 0, 0], ![0, 0, -1, 0]],  -- product 7
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![0, 0, 0, 0], ![1, -1, 1, 1]],  -- product 8
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![-1, 0, -1, 0], ![-1, 0, -1, 0]],  -- product 9
    ![![0, 0, 0, 0], ![0, 0, -1, 0], ![0, 0, 0, 0], ![0, 0, 0, 0]],  -- product 10
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![0, 0, 0, 0], ![0, 0, -1, 0]],  -- product 11
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![-1, 0, 0, -1], ![-1, 0, 0, -1]],  -- product 12
    ![![0, 0, 0, 1], ![0, 0, 0, 1], ![1, 0, 0, 0], ![1, 0, 0, 0]],  -- product 13
    ![![0, 0, 0, -1], ![0, 0, 0, -1], ![0, 0, 0, 0], ![0, 0, 0, 0]],  -- product 14
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![1, 0, 0, 1], ![1, -1, 1, 1]],  -- product 15
    ![![-1, 1, -1, -1], ![-1, 0, 0, -1], ![0, 1, -1, 0], ![0, 0, 0, 0]],  -- product 16
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![0, 1, -1, 0], ![0, 0, 0, 0]],  -- product 17
    ![![0, 0, -1, 1], ![0, 0, 0, 1], ![1, 0, 1, 0], ![1, 0, 1, 0]],  -- product 18
    ![![0, 0, 0, 0], ![0, 0, 0, 0], ![1, 0, 0, 0], ![0, 0, 0, 0]],  -- product 19
    ![![1, -1, 0, 1], ![1, 0, 0, 1], ![0, -1, 0, 0], ![0, 0, 1, 0]],  -- product 20
    ![![0, 0, 0, 0], ![0, 0, 0, 1], ![-1, 0, 0, -1], ![-1, 0, -1, 0]],  -- product 21
    ![![0, 0, 0, 0], ![0, 0, 0, 1], ![0, 0, 0, 0], ![0, 0, 0, 0]],  -- product 22
    ![![0, 1, -1, 0], ![0, 0, 0, 0], ![0, 1, -1, 0], ![0, 0, 0, 0]],  -- product 23
    ![![-1, 1, -1, -1], ![-1, 1, -1, -1], ![0, 0, 0, 0], ![0, 0, 0, 0]],  -- product 24
    ![![-1, 1, -1, -1], ![0, 0, 0, -1], ![0, 1, -1, 0], ![0, 0, 0, 0]],  -- product 25
    ![![0, 0, 0, 1], ![0, 0, 0, 1], ![1, 0, 0, 0], ![1, -1, 1, 0]]]  -- product 26

/-- The tensor identity of the algorithm over `ℤ`: the 26 products together give exactly the
matrix multiplication tensor of `⟨4, 2, 4⟩`. Checked by the kernel. -/
theorem tensor_identity :
    ∀ (i : Fin 4) (j p : Fin 2) (q : Fin 4) (s : Fin 4) (t : Fin 4),
      ∑ r : Fin 26, u r i j * v r p q * w r s t = if i = s ∧ j = p ∧ q = t then 1 else 0 := by
  decide +kernel

variable {K : Type u} [Field K]

/-- The linear form `A ↦ ∑ i j, M i j * A i j` with integer coefficients `M`. -/
def intForm {a b : ℕ} (M : Fin a → Fin b → ℤ) : Matrix (Fin a) (Fin b) K →ₗ[K] K where
  toFun A := ∑ i, ∑ j, (M i j : K) * A i j
  map_add' A B := by
    simp only [Matrix.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' c A := by
    simp only [Matrix.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
    ring

theorem intForm_apply {a b : ℕ} (M : Fin a → Fin b → ℤ) (A : Matrix (Fin a) (Fin b) K) :
    intForm M A = ∑ i, ∑ j, (M i j : K) * A i j := rfl

/-- The algorithm `verfahren/4x2x4-r26-s001.json` for `⟨4, 2, 4⟩` with 26 products, valid over
every field. -/
def algorithm (K : Type u) [Field K] : BilinearAlgorithm K 4 2 4 26 where
  alpha r := intForm (u r)
  beta r := intForm (v r)
  coeff r := Matrix.of fun s t => (w r s t : K)
  correct A B := by
    ext s t
    simp only [Matrix.sum_apply, Matrix.smul_apply, smul_eq_mul, intForm_apply,
      Matrix.of_apply]
    -- Right-hand side as a sum over `(i, j, p, q)` with the integer coefficient of the tensor.
    have hR : (∑ r : Fin 26, (∑ i, ∑ j, (u r i j : K) * A i j) *
          (∑ p, ∑ q, (v r p q : K) * B p q) * (w r s t : K)) =
        ∑ p, ∑ q, ∑ i, ∑ j,
          A i j * B p q * ((∑ r : Fin 26, u r i j * v r p q * w r s t : ℤ) : K) := by
      simp only [Finset.sum_mul, Finset.mul_sum, Int.cast_sum, Int.cast_mul]
      -- Move the sum over the products `r` innermost.
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl fun p _ => ?_
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl fun q _ => ?_
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun r _ => ?_
      ring
    rw [hR]
    simp only [tensor_identity]
    simp only [Matrix.mul_apply, apply_ite (Int.cast : ℤ → K), Int.cast_one, Int.cast_zero,
      mul_ite, mul_one, mul_zero, ite_and]
    simp [Finset.sum_ite_eq']

/-- **Upper bound for `⟨4, 2, 4⟩`.** For every field `K` there is a bilinear algorithm with 26
products for the product of a `4 × 2` and a `2 × 4` matrix: `R_K(⟨4, 2, 4⟩) ≤ 26`. -/
theorem rank_four_two_four_le_26 (K : Type u) [Field K] :
    tensorRank K 4 2 4 ≤ 26 :=
  tensorRank_le (algorithm K)

end Upper4x2x4

end YangBounds
