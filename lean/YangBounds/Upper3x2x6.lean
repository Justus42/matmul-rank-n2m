import YangBounds.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Int.Cast.Lemmas
import Mathlib.Tactic.Ring

/-!
# Upper bound `R(⟨3, 2, 6⟩) ≤ 30` over every field

Task S1-12 (stage 1, round 3, role: formaliser).

This file proves the statement of the open `sorry` `YangBounds.hopcroft_kerr_three_two_six`
in `YangBounds/Statements.lean`, word for word, under the name
`YangBounds.Upper3x2x6.hopcroft_kerr_three_two_six`, so that the `sorry` can later be replaced
by `Upper3x2x6.hopcroft_kerr_three_two_six K`.

The algorithm is the integer algorithm `verfahren/3x2x6-r30-hk71.json` (task A-10, coefficient
ring `Z`, 30 products, Hopcroft–Kerr 1971 construction, two independent `⟨3, 2, 3⟩` blocks of
15 products). The coefficient tables `u`, `v`, `w` below were generated mechanically from that
file (state of `main` at commit `97f98a2`, SHA-256 of the JSON file
`6c8fb92da3a05092040def6619c09798ee3352b65b6b869c1efe37622dd7ba16`), one entry per product in
the order of the file. The meaning is that of `verfahren/README.md`, Section 2:
`a_r = ∑ u r i j * A i j`, `b_r = ∑ v r j l * B j l`, `C i l += w r i l * a_r * b_r`.
All coefficients are `0`, `1` or `-1`.

## Proof

1. `tensor_identity`: over `ℤ`, `∑ r, u r i j * v r p q * w r s t` is `1` if `i = s`, `j = p`,
   `q = t` and `0` otherwise, for all 1296 index tuples. This is a finite computation with
   integers, checked by the Lean kernel (`decide +kernel`; this is not `native_decide`, it adds
   no axiom and does not use the compiler).
2. `algorithm`: the coefficients are mapped into an arbitrary field `K` with the cast
   `ℤ → K`. Correctness follows from the tensor identity by expanding both sides into sums
   over all `(i, j, p, q)` and applying the ring homomorphism `ℤ → K`. Nothing here depends
   on the characteristic of `K`.
3. `hopcroft_kerr_three_two_six`: `tensorRank_le` applied to `algorithm`.
-/

namespace YangBounds

namespace Upper3x2x6

universe u

/-- Coefficients `u` of the 30 products: `a_r = ∑ u r i j * A i j`. -/
def u : Fin 30 → Fin 3 → Fin 2 → ℤ :=
  ![
    ![![0, 1], ![0, 0], ![0, 0]],  -- product 1
    ![![1, -1], ![0, 0], ![0, 0]],  -- product 2
    ![![0, 0], ![1, -1], ![0, 0]],  -- product 3
    ![![0, 0], ![1, 0], ![0, 0]],  -- product 4
    ![![0, 0], ![0, 0], ![0, 1]],  -- product 5
    ![![0, 0], ![0, 0], ![1, 0]],  -- product 6
    ![![0, 1], ![-1, 0], ![0, 0]],  -- product 7
    ![![0, 1], ![0, -1], ![0, 0]],  -- product 8
    ![![1, 0], ![-1, 0], ![0, 0]],  -- product 9
    ![![0, 0], ![0, 1], ![0, -1]],  -- product 10
    ![![0, 0], ![1, -1], ![-1, 1]],  -- product 11
    ![![0, 0], ![1, -1], ![0, 1]],  -- product 12
    ![![-1, 1], ![0, 0], ![1, -1]],  -- product 13
    ![![-1, 0], ![0, 0], ![1, 0]],  -- product 14
    ![![-1, 1], ![0, 0], ![1, 0]],  -- product 15
    ![![0, 1], ![0, 0], ![0, 0]],  -- product 16
    ![![1, -1], ![0, 0], ![0, 0]],  -- product 17
    ![![0, 0], ![1, -1], ![0, 0]],  -- product 18
    ![![0, 0], ![1, 0], ![0, 0]],  -- product 19
    ![![0, 0], ![0, 0], ![0, 1]],  -- product 20
    ![![0, 0], ![0, 0], ![1, 0]],  -- product 21
    ![![0, 1], ![-1, 0], ![0, 0]],  -- product 22
    ![![0, 1], ![0, -1], ![0, 0]],  -- product 23
    ![![1, 0], ![-1, 0], ![0, 0]],  -- product 24
    ![![0, 0], ![0, 1], ![0, -1]],  -- product 25
    ![![0, 0], ![1, -1], ![-1, 1]],  -- product 26
    ![![0, 0], ![1, -1], ![0, 1]],  -- product 27
    ![![-1, 1], ![0, 0], ![1, -1]],  -- product 28
    ![![-1, 0], ![0, 0], ![1, 0]],  -- product 29
    ![![-1, 1], ![0, 0], ![1, 0]]]  -- product 30

/-- Coefficients `v` of the 30 products: `b_r = ∑ v r j l * B j l`. -/
def v : Fin 30 → Fin 2 → Fin 6 → ℤ :=
  ![
    ![![1, 0, 0, 0, 0, 0], ![1, 0, 0, 0, 0, 0]],  -- product 1
    ![![1, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 2
    ![![0, 0, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0]],  -- product 3
    ![![0, 1, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0]],  -- product 4
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 1, 0, 0, 0]],  -- product 5
    ![![0, 0, 1, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 6
    ![![1, 0, 0, 0, 0, 0], ![0, -1, 0, 0, 0, 0]],  -- product 7
    ![![0, 0, 0, 0, 0, 0], ![1, 1, 0, 0, 0, 0]],  -- product 8
    ![![1, 1, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 9
    ![![0, 1, -1, 0, 0, 0], ![0, 1, -1, 0, 0, 0]],  -- product 10
    ![![0, 1, -1, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 11
    ![![0, 1, -1, 0, 0, 0], ![0, 1, 0, 0, 0, 0]],  -- product 12
    ![![0, 0, 0, 0, 0, 0], ![-1, 0, 1, 0, 0, 0]],  -- product 13
    ![![-1, 0, 1, 0, 0, 0], ![-1, 0, 1, 0, 0, 0]],  -- product 14
    ![![-1, 0, 0, 0, 0, 0], ![-1, 0, 1, 0, 0, 0]],  -- product 15
    ![![0, 0, 0, 1, 0, 0], ![0, 0, 0, 1, 0, 0]],  -- product 16
    ![![0, 0, 0, 1, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 17
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 1, 0]],  -- product 18
    ![![0, 0, 0, 0, 1, 0], ![0, 0, 0, 0, 1, 0]],  -- product 19
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 1]],  -- product 20
    ![![0, 0, 0, 0, 0, 1], ![0, 0, 0, 0, 0, 0]],  -- product 21
    ![![0, 0, 0, 1, 0, 0], ![0, 0, 0, 0, -1, 0]],  -- product 22
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 1, 1, 0]],  -- product 23
    ![![0, 0, 0, 1, 1, 0], ![0, 0, 0, 0, 0, 0]],  -- product 24
    ![![0, 0, 0, 0, 1, -1], ![0, 0, 0, 0, 1, -1]],  -- product 25
    ![![0, 0, 0, 0, 1, -1], ![0, 0, 0, 0, 0, 0]],  -- product 26
    ![![0, 0, 0, 0, 1, -1], ![0, 0, 0, 0, 1, 0]],  -- product 27
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, -1, 0, 1]],  -- product 28
    ![![0, 0, 0, -1, 0, 1], ![0, 0, 0, -1, 0, 1]],  -- product 29
    ![![0, 0, 0, -1, 0, 0], ![0, 0, 0, -1, 0, 1]]]  -- product 30

/-- Coefficients `w` of the 30 products: `C i l += w r i l * a_r * b_r` (not transposed). -/
def w : Fin 30 → Fin 3 → Fin 6 → ℤ :=
  ![
    ![![1, 0, 1, 0, 0, 0], ![1, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 1
    ![![1, -1, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![1, 0, 0, 0, 0, 0]],  -- product 2
    ![![0, 0, 0, 0, 0, 0], ![1, -1, 0, 0, 0, 0], ![0, -1, 0, 0, 0, 0]],  -- product 3
    ![![0, 1, 0, 0, 0, 0], ![0, 1, 1, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 4
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 1, 0, 0, 0], ![1, 0, 1, 0, 0, 0]],  -- product 5
    ![![0, 0, 1, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![0, 1, 1, 0, 0, 0]],  -- product 6
    ![![0, -1, 0, 0, 0, 0], ![-1, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 7
    ![![0, 0, 0, 0, 0, 0], ![-1, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 8
    ![![0, 1, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 9
    ![![0, 0, 0, 0, 0, 0], ![0, 0, -1, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 10
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![0, -1, 0, 0, 0, 0]],  -- product 11
    ![![0, 0, 0, 0, 0, 0], ![0, 0, -1, 0, 0, 0], ![0, 1, 0, 0, 0, 0]],  -- product 12
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![1, 0, 0, 0, 0, 0]],  -- product 13
    ![![0, 0, -1, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 14
    ![![0, 0, 1, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![-1, 0, 0, 0, 0, 0]],  -- product 15
    ![![0, 0, 0, 1, 0, 1], ![0, 0, 0, 1, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 16
    ![![0, 0, 0, 1, -1, 0], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 1, 0, 0]],  -- product 17
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 1, -1, 0], ![0, 0, 0, 0, -1, 0]],  -- product 18
    ![![0, 0, 0, 0, 1, 0], ![0, 0, 0, 0, 1, 1], ![0, 0, 0, 0, 0, 0]],  -- product 19
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 1], ![0, 0, 0, 1, 0, 1]],  -- product 20
    ![![0, 0, 0, 0, 0, 1], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 1, 1]],  -- product 21
    ![![0, 0, 0, 0, -1, 0], ![0, 0, 0, -1, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 22
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, -1, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 23
    ![![0, 0, 0, 0, 1, 0], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 24
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, -1], ![0, 0, 0, 0, 0, 0]],  -- product 25
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, -1, 0]],  -- product 26
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, -1], ![0, 0, 0, 0, 1, 0]],  -- product 27
    ![![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 1, 0, 0]],  -- product 28
    ![![0, 0, 0, 0, 0, -1], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, 0, 0, 0]],  -- product 29
    ![![0, 0, 0, 0, 0, 1], ![0, 0, 0, 0, 0, 0], ![0, 0, 0, -1, 0, 0]]]  -- product 30

/-- The tensor identity of the algorithm over `ℤ`: the 30 products together give exactly the
matrix multiplication tensor of `⟨3, 2, 6⟩`. Checked by the kernel. -/
theorem tensor_identity :
    ∀ (i : Fin 3) (j p : Fin 2) (q : Fin 6) (s : Fin 3) (t : Fin 6),
      ∑ r : Fin 30, u r i j * v r p q * w r s t = if i = s ∧ j = p ∧ q = t then 1 else 0 := by
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

/-- The Hopcroft–Kerr algorithm for `⟨3, 2, 6⟩` with 30 products, valid over every field. -/
def algorithm (K : Type u) [Field K] : BilinearAlgorithm K 3 2 6 30 where
  alpha r := intForm (u r)
  beta r := intForm (v r)
  coeff r := Matrix.of fun s t => (w r s t : K)
  correct A B := by
    ext s t
    simp only [Matrix.sum_apply, Matrix.smul_apply, smul_eq_mul, intForm_apply,
      Matrix.of_apply]
    -- Right-hand side as a sum over `(i, j, p, q)` with the integer coefficient of the tensor.
    have hR : (∑ r : Fin 30, (∑ i, ∑ j, (u r i j : K) * A i j) *
          (∑ p, ∑ q, (v r p q : K) * B p q) * (w r s t : K)) =
        ∑ p, ∑ q, ∑ i, ∑ j,
          A i j * B p q * ((∑ r : Fin 30, u r i j * v r p q * w r s t : ℤ) : K) := by
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
    simp [Finset.sum_ite_eq, Finset.sum_ite_eq']

/-- **Hopcroft–Kerr 1971 for `⟨3, 2, 6⟩`:** an algorithm with 30 products over every field.
Same statement as the open `YangBounds.hopcroft_kerr_three_two_six` in
`YangBounds/Statements.lean`. -/
theorem hopcroft_kerr_three_two_six (K : Type u) [Field K] :
    tensorRank K 3 2 6 ≤ 30 :=
  tensorRank_le (algorithm K)

end Upper3x2x6

end YangBounds
