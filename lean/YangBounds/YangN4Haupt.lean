import YangBounds.Basic
import YangBounds.YangN3Teil1
import YangBounds.YangN3Teil2
import YangBounds.YangN3Teil3
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.Eigenspace.Triangularizable
import Mathlib.LinearAlgebra.Dual.Lemmas

/-!
# Yang v3, Theorem 2 (`m ≥ n ≥ 4`): the main proof, with Lemma 13 as a hypothesis

Task S1-16 (stage 1, round 4, role: formaliser).

Source of the proof: `lean/prosa/yang_n4.md` (task S1-03), which works out the proof of Theorem 2 in
J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*,
arXiv:2609.14393v3 (12.10.2026). The theorem is Yang's, not ours (protocol section 9).

Lemma 13 (in the form of Section 6 of the prose file) is formalised separately, in
`YangN4Lemma13.lean`. Here it is an **explicit hypothesis** `Lemma13Statement` of the main
theorem (not an axiom, not a `sorry`), with exactly the statement and the assumptions of
Section 6 of the prose file:

> Let `U`, `Q` be finite-dimensional, `d ≥ 2`, `F_1, …, F_d : U → Q` linear,
> `L(u) := ∑ F_i(u_i)` on `U^d`, `H` the skew extension of `L`,
> `ρ := max_γ rk(∑ γ_i F_i)`. Then `2·rk H ≥ d·ρ + (d−2)·rk L`.

Indices of the prose start at `1` (`F_1, …, F_d`); here they are `Fin d` (`0, …, d-1`).

## Translation of the prose notation

* `n = d + 1` throughout the linear algebra (rows `0, …, d` of `A`); the prose index
  `i = 1, …, n − 1` is `Fin.succ i` with `i : Fin d`.
* `F^r` is `Fin r → K` with its pointwise ring structure; `D(A) t` is `avec alg A * t`.
* `U` is parametrised by `emb : (Fin m → K) → K^{2×m}`, `y ↦ (0; y)` (as in `YangN3Teil3`).
* `Q = ker W / J` is realised inside `(Fin r → K) ⧸ J` as `Kbar = (ker W).map J.mkQ`.
* `ρ` is not defined as a maximum; instead `IsGreatest (set of ranks) ρ` is used, which is the
  same thing (prose Section 9, last remark).

## Main results

* `yang_theorem_two_of_lemma13`: from the Lemma 13 hypothesis, the statement of
  `yang_theorem_two` (Statements.lean), word for word.
* `yang_theorem_two_algorithm_of_lemma13`: the same bound for every single algorithm.

Imports (S1-17): this file no longer imports `YangBounds.Statements` (nothing from it was used);
`Statements.lean` now imports this file and `YangN4Lemma13.lean` to close `yang_theorem_two`,
so the old import would have been an import cycle.

No `sorry`, no own axiom, no `native_decide`. `#print axioms yang_theorem_two_of_lemma13`:
`propext`, `Classical.choice`, `Quot.sound` (local build, 25.11.2026).

Deviation from the prose: inequality (11′) for `n = 4` is not taken from Lemma 11 but derived
from Lemma 13 and Lemma 15(a) (`2 rk H ≥ dρ + (d−2) rk L ≥ (d−1) rk L` since `rk L ≤ dρ`);
Lemma 11 is therefore not needed in this file. Lemma 14 chooses the coordinate set `I`
greedily (`exists_coords`) instead of through a basis matrix of `J`.
-/

namespace YangBounds
namespace YangN4Haupt

open Module

universe u v w

/-! ## Skew-symmetric matrices, skew extension, and the statement of Lemma 13 -/

section Skew

variable (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V]

/-- `V^{∧d}`: the `d × d` matrices `c` with entries in `V` such that `c_{i,i} = 0` and
`c_{j,i} = -c_{i,j}` (prose Section 4; the diagonal condition is required explicitly, which
matters in characteristic 2). -/
def skewSpace (d : ℕ) : Submodule K (Fin d → Fin d → V) where
  carrier := {c | (∀ i, c i i = 0) ∧ ∀ i j, c j i = -c i j}
  zero_mem' := ⟨fun _ => rfl, fun _ _ => by simp⟩
  add_mem' := by
    rintro a b ⟨ha1, ha2⟩ ⟨hb1, hb2⟩
    refine ⟨fun i => by simp [ha1 i, hb1 i], fun i j => ?_⟩
    simp only [Pi.add_apply, ha2 i j, hb2 i j, neg_add]
  smul_mem' := by
    rintro c a ⟨ha1, ha2⟩
    refine ⟨fun i => by simp [ha1 i], fun i j => ?_⟩
    simp only [Pi.smul_apply, ha2 i j, smul_neg]

variable {K V}

/-- The skew extension `h : V^{∧d} → Y^d`, `h(c) = (λ(c_{1,:}), …, λ(c_{d,:}))`, of a linear
map `λ : V^d → Y` (prose Section 4). -/
def skewExt {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ}
    (lam : (Fin d → V) →ₗ[K] Y) : skewSpace K V d →ₗ[K] (Fin d → Y) :=
  LinearMap.pi fun i => lam ∘ₗ (LinearMap.proj i) ∘ₗ (skewSpace K V d).subtype

@[simp] theorem skewExt_apply {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ}
    (lam : (Fin d → V) →ₗ[K] Y) (c : skewSpace K V d) (i : Fin d) :
    skewExt lam c i = lam ((c : Fin d → Fin d → V) i) := rfl

/-- `L(u_1, …, u_d) = ∑ F_i(u_i)` on `U^d`. -/
def sumMap {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ} (F : Fin d → V →ₗ[K] Y) :
    (Fin d → V) →ₗ[K] Y :=
  ∑ i, F i ∘ₗ LinearMap.proj i

@[simp] theorem sumMap_apply {Y : Type w} [AddCommGroup Y] [Module K Y] {d : ℕ}
    (F : Fin d → V →ₗ[K] Y) (u : Fin d → V) : sumMap F u = ∑ i, F i (u i) := by
  simp [sumMap]

end Skew

/-- **Statement of Lemma 13** (prose `lean/prosa/yang_n4.md`, Section 6), for a
field `K` and spaces `U`, `Q`: if `U`, `Q` are finite-dimensional, `d ≥ 2`,
`F_1, …, F_d : U → Q` are linear, `L = sumMap F`, `H = skewExt L`, and `ρ` is the maximum of
`rk(∑ γ_i F_i)` over `γ ∈ K^d`, then `2·rk H ≥ d·ρ + (d−2)·rk L`.

This is a `Prop`, used only as a hypothesis; it is proved (or not) in `YangN4Lemma13.lean`. -/
def Lemma13Statement (K : Type u) [Field K] (U : Type v) (Q : Type w)
    [AddCommGroup U] [Module K U] [AddCommGroup Q] [Module K Q] : Prop :=
  FiniteDimensional K U → FiniteDimensional K Q →
  ∀ (d : ℕ), 2 ≤ d → ∀ (F : Fin d → U →ₗ[K] Q) (ρ : ℕ),
    IsGreatest (Set.range fun γ : Fin d → K => finrank K (LinearMap.range (∑ i, γ i • F i))) ρ →
    d * ρ + (d - 2) * finrank K (LinearMap.range (sumMap F)) ≤
      2 * finrank K (LinearMap.range (skewExt (sumMap F)))

/-! ## Abstract linear algebra for Lemma 15 -/

section Abstract

variable {K : Type u} [Field K] {U : Type v} [AddCommGroup U] [Module K U] [FiniteDimensional K U]
  {Q : Type w} [AddCommGroup Q] [Module K Q] {d : ℕ}

/-- `∑ dim ker F_i ≤ dim ker L`: the product of the kernels embeds into `ker L`. -/
theorem sum_finrank_ker_le (F : Fin d → U →ₗ[K] Q) :
    ∑ i, finrank K (LinearMap.ker (F i)) ≤ finrank K (LinearMap.ker (sumMap F)) := by
  classical
  let Ψ : (∀ i, LinearMap.ker (F i)) →ₗ[K] (Fin d → U) :=
    LinearMap.pi fun i => (LinearMap.ker (F i)).subtype ∘ₗ LinearMap.proj i
  have hinj : Function.Injective Ψ := by
    intro x y hxy
    funext i
    apply Subtype.ext
    exact congrFun hxy i
  have hle : LinearMap.range Ψ ≤ LinearMap.ker (sumMap F) := by
    rintro _ ⟨x, rfl⟩
    simp only [LinearMap.mem_ker, sumMap_apply]
    apply Finset.sum_eq_zero
    intro i _
    exact (x i).2
  have h1 := LinearMap.finrank_range_of_inj hinj
  rw [Module.finrank_pi_fintype] at h1
  rw [← h1]
  exact Submodule.finrank_mono hle

/-- Under the same embedding: if `dim ker L = ∑ dim ker F_i`, then `L u = 0` forces
`F_i(u_i) = 0` for every `i`. -/
theorem ker_sumMap_of_finrank_eq (F : Fin d → U →ₗ[K] Q)
    (h : finrank K (LinearMap.ker (sumMap F)) ≤ ∑ i, finrank K (LinearMap.ker (F i)))
    (u : Fin d → U) (hu : sumMap F u = 0) (i : Fin d) : F i (u i) = 0 := by
  classical
  let Ψ : (∀ i, LinearMap.ker (F i)) →ₗ[K] (Fin d → U) :=
    LinearMap.pi fun i => (LinearMap.ker (F i)).subtype ∘ₗ LinearMap.proj i
  have hinj : Function.Injective Ψ := by
    intro x y hxy
    funext i
    apply Subtype.ext
    exact congrFun hxy i
  have hle : LinearMap.range Ψ ≤ LinearMap.ker (sumMap F) := by
    rintro _ ⟨x, rfl⟩
    simp only [LinearMap.mem_ker, sumMap_apply]
    apply Finset.sum_eq_zero
    intro i _
    exact (x i).2
  have h1 := LinearMap.finrank_range_of_inj hinj
  rw [Module.finrank_pi_fintype] at h1
  have heq : LinearMap.range Ψ = LinearMap.ker (sumMap F) :=
    Submodule.eq_of_le_of_finrank_le hle (by rw [h1]; exact h)
  have hmem : u ∈ LinearMap.range Ψ := by rw [heq]; exact hu
  obtain ⟨x, rfl⟩ := hmem
  exact (x i).2

/-- **Lemma 15(a), first half.** `rk L ≤ ∑ rk F_i`. -/
theorem finrank_range_sumMap_le (F : Fin d → U →ₗ[K] Q) :
    finrank K (LinearMap.range (sumMap F)) ≤ ∑ i, finrank K (LinearMap.range (F i)) := by
  have h := sum_finrank_ker_le F
  have hL := LinearMap.finrank_range_add_finrank_ker (sumMap F)
  have hF : ∀ i, finrank K (LinearMap.range (F i)) + finrank K (LinearMap.ker (F i)) =
      finrank K U := fun i => LinearMap.finrank_range_add_finrank_ker (F i)
  rw [Module.finrank_pi_fintype] at hL
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul] at hL
  have hsum : ∑ i, finrank K (LinearMap.range (F i)) + ∑ i, finrank K (LinearMap.ker (F i)) =
      d * finrank K U := by
    rw [← Finset.sum_add_distrib]
    simp [hF]
  omega

/-- The family `γ ↦ rk(∑ γ_i F_i)`. -/
noncomputable def rkComb (F : Fin d → U →ₗ[K] Q) (γ : Fin d → K) : ℕ :=
  finrank K (LinearMap.range (∑ i, γ i • F i))

theorem rkComb_le (F : Fin d → U →ₗ[K] Q) (γ : Fin d → K) : rkComb F γ ≤ finrank K U :=
  LinearMap.finrank_range_le _

/-- The maximum `ρ` exists. -/
theorem exists_isGreatest_rkComb (F : Fin d → U →ₗ[K] Q) :
    ∃ ρ, IsGreatest (Set.range (rkComb F)) ρ := by
  refine ⟨sSup (Set.range (rkComb F)), Nat.sSup_mem ⟨_, ⟨0, rfl⟩⟩ ⟨finrank K U, ?_⟩,
    fun x hx => le_csSup ⟨finrank K U, ?_⟩ hx⟩
  · rintro _ ⟨γ, rfl⟩; exact rkComb_le F γ
  · rintro _ ⟨γ, rfl⟩; exact rkComb_le F γ

omit [FiniteDimensional K U] in
theorem rkComb_single (F : Fin d → U →ₗ[K] Q) (i : Fin d) :
    rkComb F (Pi.single i 1) = finrank K (LinearMap.range (F i)) := by
  classical
  have h : ∑ j, (Pi.single i (1 : K) : Fin d → K) j • F j = F i := by
    simp [Pi.single_apply]
  unfold rkComb
  rw [h]

omit [FiniteDimensional K U] in
theorem rkComb_one (F : Fin d → U →ₗ[K] Q) :
    rkComb F 1 = finrank K (LinearMap.range (∑ i, F i)) := by
  unfold rkComb
  rw [show (∑ i, (1 : Fin d → K) i • F i) = ∑ i, F i from
    Finset.sum_congr rfl fun i _ => one_smul K (F i)]

/-- **Lemma 15(a).** `rk L ≤ d·ρ`. -/
theorem lemma15a (F : Fin d → U →ₗ[K] Q) {ρ : ℕ} (hρ : IsGreatest (Set.range (rkComb F)) ρ) :
    finrank K (LinearMap.range (sumMap F)) ≤ d * ρ := by
  refine (finrank_range_sumMap_le F).trans ?_
  calc ∑ i, finrank K (LinearMap.range (F i)) ≤ ∑ _i : Fin d, ρ :=
        Finset.sum_le_sum fun i _ => by rw [← rkComb_single]; exact hρ.2 ⟨_, rfl⟩
    _ = d * ρ := by simp

/-- **Lemma 15(b), abstract core.** If `rk L = d·ρ`, then every `F_i` has rank `ρ`, all
`F_i` have the same kernel, and the images of `F_i`, `F_j` (`i ≠ j`) meet only in `0`. -/
theorem lemma15b_core (F : Fin d → U →ₗ[K] Q) {ρ : ℕ}
    (hρ : IsGreatest (Set.range (rkComb F)) ρ)
    (hL : finrank K (LinearMap.range (sumMap F)) = d * ρ) :
    (∀ i, finrank K (LinearMap.range (F i)) = ρ) ∧
    (∀ i j x, F i x = 0 → F j x = 0) ∧
    (∀ i j, i ≠ j → ∀ a b, F i a = F j b → F i a = 0) := by
  classical
  have hle : ∀ i, finrank K (LinearMap.range (F i)) ≤ ρ := fun i => by
    rw [← rkComb_single]; exact hρ.2 ⟨_, rfl⟩
  have hsumle := finrank_range_sumMap_le F
  have hsum_eq : ∑ i, finrank K (LinearMap.range (F i)) = ∑ _i : Fin d, ρ := by
    apply le_antisymm (Finset.sum_le_sum fun i _ => hle i)
    simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul]
    omega
  have hrk : ∀ i, finrank K (LinearMap.range (F i)) = ρ := fun i =>
    (Finset.sum_eq_sum_iff_of_le fun i _ => hle i).1 hsum_eq i (Finset.mem_univ _)
  -- the kernel of `L` is the product of the kernels
  have hF : ∀ i, finrank K (LinearMap.range (F i)) + finrank K (LinearMap.ker (F i)) =
      finrank K U := fun i => LinearMap.finrank_range_add_finrank_ker (F i)
  have hLk := LinearMap.finrank_range_add_finrank_ker (sumMap F)
  rw [Module.finrank_pi_fintype] at hLk
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul] at hLk
  have hsumF : ∑ i, finrank K (LinearMap.range (F i)) + ∑ i, finrank K (LinearMap.ker (F i)) =
      d * finrank K U := by
    rw [← Finset.sum_add_distrib]
    simp [hF]
  have hρsum : ∑ i, finrank K (LinearMap.range (F i)) = d * ρ := by
    rw [hsum_eq]; simp
  have hkerL : finrank K (LinearMap.ker (sumMap F)) ≤ ∑ i, finrank K (LinearMap.ker (F i)) := by
    omega
  have hkey := ker_sumMap_of_finrank_eq F hkerL
  refine ⟨hrk, ?_, ?_⟩
  · -- all kernels agree: `ker σ ≤ ker F_j` and `dim ker σ ≥ dim ker F_i`
    intro i j x hx
    let σ : U →ₗ[K] Q := ∑ k, F k
    have hσker : ∀ y, σ y = 0 → ∀ k, F k y = 0 := by
      intro y hy k
      apply hkey (fun _ => y)
      simpa [σ, LinearMap.coeFn_sum] using hy
    have hσle : LinearMap.ker σ ≤ LinearMap.ker (F i) := fun y hy => hσker y hy i
    have hσrk : finrank K (LinearMap.range σ) ≤ ρ := by
      rw [← rkComb_one]; exact hρ.2 ⟨_, rfl⟩
    have hσ := LinearMap.finrank_range_add_finrank_ker σ
    have heq : LinearMap.ker σ = LinearMap.ker (F i) := by
      apply Submodule.eq_of_le_of_finrank_le hσle
      have := hF i
      rw [hrk i] at this
      omega
    have hxσ : x ∈ LinearMap.ker σ := by rw [heq]; exact hx
    exact hσker x hxσ j
  · intro i j hij a b hab
    have := hkey (Pi.single i a - Pi.single j b) (by
      simp only [sumMap_apply, Pi.sub_apply, map_sub, Finset.sum_sub_distrib]
      rw [Finset.sum_eq_single i, Finset.sum_eq_single j]
      · simp [hab]
      · intro k _ hk; simp [Pi.single_apply, hk]
      · simp
      · intro k _ hk; simp [Pi.single_apply, hk]
      · simp) i
    simpa [Pi.single_apply, hij] using this

end Abstract

/-! ## The objects of the proof for `⟨d+1, 2, m⟩` (prose Sections 1, 3, 4) -/

section Objects

variable {K : Type u} [Field K] {d m r : ℕ}

/-- `e_{i,j}` as an `(d+1) × 2` matrix. -/
abbrev eA (i : Fin (d + 1)) (j : Fin 2) : Matrix (Fin (d + 1)) (Fin 2) K := unitMatrix i j

/-- The vector `(α_0(A), …, α_{r-1}(A))`; `D(A) t` is `avec alg A * t`. -/
def avec (alg : BilinearAlgorithm K (d + 1) 2 m r) (A : Matrix (Fin (d + 1)) (Fin 2) K) :
    Fin r → K :=
  fun k => alg.alpha k A

/-- `ℬ(B) = (β_0(B), …, β_{r-1}(B))`. -/
def bvec (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  LinearMap.pi alg.beta

/-- `x ↦ D(A) ℬ(x)`. -/
def prodMap (alg : BilinearAlgorithm K (d + 1) 2 m r) (A : Matrix (Fin (d + 1)) (Fin 2) K) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) where
  toFun x k := alg.alpha k A * alg.beta k x
  map_add' x y := by ext k; simp [mul_add]
  map_smul' c x := by
    ext k
    simp only [map_smul, smul_eq_mul, Pi.smul_apply, RingHom.id_apply]
    ring

/-- `f_i(x) = D(e_{i,0}) ℬ(x)` (prose Section 3). -/
def fv (alg : BilinearAlgorithm K (d + 1) 2 m r) (i : Fin (d + 1)) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  prodMap alg (eA i 0)

/-- `W(t) = ∑_k t_k C_k`. -/
def W (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    (Fin r → K) →ₗ[K] Matrix (Fin (d + 1)) (Fin m) K where
  toFun t := ∑ k, t k • alg.coeff k
  map_add' s t := by simp [add_smul, Finset.sum_add_distrib]
  map_smul' c t := by simp [Finset.smul_sum, smul_smul]

/-- (N1): `D(e_{0,0})` is invertible. -/
def SN1 (alg : BilinearAlgorithm K (d + 1) 2 m r) : Prop :=
  ∀ k, alg.alpha k (eA 0 0) ≠ 0

/-- (N2): for `v ≠ 0` the vectors `f_0(v), …, f_d(v)` are linearly independent. -/
def SN2 (alg : BilinearAlgorithm K (d + 1) 2 m r) : Prop :=
  ∀ v : Matrix (Fin 2) (Fin m) K, v ≠ 0 → LinearIndependent K (fun i => fv alg i v)

/-- `y ↦ (y; 0)`: the `2 × m` matrix with row `0` equal to `y` and row `1` zero. -/
def top : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K where
  toFun y := Matrix.of ![y, 0]
  map_add' y z := by ext i j; fin_cases i <;> simp
  map_smul' c y := by ext i j; fin_cases i <;> simp

/-- `U` parametrised by `emb y = (0; y)` (from `YangN3Teil3`). -/
abbrev emb : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K := YangN3Teil3.emb

variable (alg : BilinearAlgorithm K (d + 1) 2 m r)

/-- `f_i` on `U`. -/
def φ (i : Fin (d + 1)) : (Fin m → K) →ₗ[K] (Fin r → K) := (fv alg i) ∘ₗ emb

/-- `g` on `U`: `g(x) = D(e_{0,1}) ℬ(x) − D(e_{0,0}) ℬ(e_{0,1}^{(2×2)} x)`, with
`e_{0,1}^{(2×2)} (0; y) = (y; 0)`. -/
def gU : (Fin m → K) →ₗ[K] (Fin r → K) :=
  (prodMap alg (eA 0 1)) ∘ₗ emb - (prodMap alg (eA 0 0)) ∘ₗ top

/-- `J = f_0(U)`. -/
def J : Submodule K (Fin r → K) := LinearMap.range (φ alg 0)

/-- The quotient map onto `(Fin r → K) ⧸ J`. -/
def π : (Fin r → K) →ₗ[K] (Fin r → K) ⧸ J alg := (J alg).mkQ

/-- `Q = ker W / J`, realised inside `(Fin r → K) ⧸ J`. -/
def Kbar : Submodule K ((Fin r → K) ⧸ J alg) := (LinearMap.ker (W alg)).map (π alg)

/-- `F_i : U → Q`, `F_i(x) = [f_i(x)]`, for the prose indices `i = 1, …, d` (here `i.succ`). -/
def Fq (i : Fin d) : (Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg := (π alg) ∘ₗ φ alg i.succ

/-- `ℓ(u_1, …, u_d) = ∑ f_i(u_i)`. -/
def ell : (Fin d → Fin m → K) →ₗ[K] (Fin r → K) := sumMap fun i => φ alg i.succ

/-- `L = [ℓ]`. -/
def Lq : (Fin d → Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg := sumMap (Fq alg)

/-- `H`, the skew extension of `L`. -/
def Hq : skewSpace K (Fin m → K) d →ₗ[K] (Fin d → (Fin r → K) ⧸ J alg) := skewExt (Lq alg)

end Objects

/-! ## Basic facts G1 to G5 and Lemma 4.1 -/

section Basics

variable {K : Type u} [Field K] {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r)

theorem prodMap_apply (A : Matrix (Fin (d + 1)) (Fin 2) K) (x : Matrix (Fin 2) (Fin m) K) :
    prodMap alg A x = avec alg A * bvec alg x := rfl

theorem fv_apply (i : Fin (d + 1)) (x : Matrix (Fin 2) (Fin m) K) :
    fv alg i x = avec alg (eA i 0) * bvec alg x := rfl

theorem φ_apply (i : Fin (d + 1)) (y : Fin m → K) :
    φ alg i y = avec alg (eA i 0) * bvec alg (emb y) := rfl

theorem gU_apply (y : Fin m → K) :
    gU alg y = avec alg (eA 0 1) * bvec alg (emb y) - avec alg (eA 0 0) * bvec alg (top y) := rfl

theorem ell_apply (u : Fin d → Fin m → K) : ell alg u = ∑ i, φ alg i.succ (u i) := by
  simp [ell]

theorem Lq_apply (u : Fin d → Fin m → K) : Lq alg u = π alg (ell alg u) := by
  simp [Lq, ell, Fq, map_sum]

theorem emb_apply_zero (y : Fin m → K) (l : Fin m) : (emb y : Matrix (Fin 2) (Fin m) K) 0 l = 0 :=
  rfl

theorem emb_apply_one (y : Fin m → K) (l : Fin m) : (emb y : Matrix (Fin 2) (Fin m) K) 1 l = y l :=
  rfl

theorem top_apply_zero (y : Fin m → K) (l : Fin m) : (top y : Matrix (Fin 2) (Fin m) K) 0 l = y l :=
  rfl

/-- A row-unit times a matrix: `(e_{i,j} X)_{a,l} = [a = i] X_{j,l}`. -/
theorem unitMatrix_mul_apply {a b c : ℕ} (i : Fin a) (j : Fin b)
    (X : Matrix (Fin b) (Fin c) K) (x : Fin a) (l : Fin c) :
    ((unitMatrix i j : Matrix (Fin a) (Fin b) K) * X) x l = if x = i then X j l else 0 := by
  simp only [Matrix.mul_apply, unitMatrix, Matrix.of_apply, ite_mul, one_mul, zero_mul]
  by_cases hx : x = i
  · simp [hx]
  · simp [hx]

/-- (Z′): `W(D(A) ℬ(x)) = A x`. -/
theorem W_mul (A : Matrix (Fin (d + 1)) (Fin 2) K) (x : Matrix (Fin 2) (Fin m) K) :
    W alg (avec alg A * bvec alg x) = A * x := by
  rw [alg.correct A x]
  simp [W, avec, bvec]

theorem W_prodMap (A : Matrix (Fin (d + 1)) (Fin 2) K) (x : Matrix (Fin 2) (Fin m) K) :
    W alg (prodMap alg A x) = A * x := W_mul alg A x

/-- **G1.** `ℬ` is injective. -/
theorem G1 : Function.Injective (bvec alg) := by
  refine (injective_iff_map_eq_zero (bvec alg)).2 fun x hx => ?_
  have h : ∀ A : Matrix (Fin (d + 1)) (Fin 2) K, A * x = 0 := fun A => by
    rw [← W_mul alg A x, hx, mul_zero, map_zero]
  ext i j
  have h0 := congrFun (congrFun (h (eA 0 0)) 0) j
  have h1 := congrFun (congrFun (h (eA 0 1)) 0) j
  rw [unitMatrix_mul_apply] at h0 h1
  fin_cases i
  · simpa using h0
  · simpa using h1

/-- **G2.** `W` is surjective. -/
theorem G2 : Function.Surjective (W alg) := by
  intro M
  refine ⟨∑ i : Fin (d + 1), avec alg (eA i 0) * bvec alg (top (M i)), ?_⟩
  rw [map_sum]
  simp only [W_mul]
  ext a l
  simp only [Matrix.sum_apply, unitMatrix_mul_apply, top_apply_zero]
  rw [Finset.sum_ite_eq]
  simp

/-- **G3.** `dim ker W + (d+1)·m = r`. -/
theorem G3 : finrank K (LinearMap.ker (W alg)) + (d + 1) * m = r := by
  have h := LinearMap.finrank_range_add_finrank_ker (W alg)
  rw [LinearMap.range_eq_top.2 (G2 alg), finrank_top, Module.finrank_matrix,
    Module.finrank_fin_fun] at h
  simp only [Fintype.card_fin, Module.finrank_self, mul_one] at h
  omega

/-- **G5.** Under (N1), `f_0` is injective. -/
theorem G5 (h1 : SN1 alg) : Function.Injective (fv alg 0) := by
  refine (injective_iff_map_eq_zero (fv alg 0)).2 fun x hx => ?_
  rw [fv_apply] at hx
  have : bvec alg x = bvec alg 0 := by
    rw [map_zero]
    exact YangN3Teil3.cancel_left (c := avec alg (eA 0 0)) h1 (by rw [hx, mul_zero])
  exact G1 alg this

theorem emb_injective : Function.Injective (emb : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K) :=
  YangN3Teil3.emb_injective

theorem φ0_injective (h1 : SN1 alg) : Function.Injective (φ alg 0) :=
  (G5 alg h1).comp emb_injective

/-- **Lemma 4.1(i).** `f_i(U) ⊆ ker W`. -/
theorem φ_mem_ker (i : Fin (d + 1)) (y : Fin m → K) : φ alg i y ∈ LinearMap.ker (W alg) := by
  rw [LinearMap.mem_ker, φ_apply, W_mul]
  ext a l
  rw [unitMatrix_mul_apply]
  split_ifs <;> rfl

/-- **Lemma 4.1(ii).** `g(x) ∈ ker W`. -/
theorem gU_mem_ker (y : Fin m → K) : gU alg y ∈ LinearMap.ker (W alg) := by
  rw [LinearMap.mem_ker, gU_apply, map_sub, W_mul, W_mul, sub_eq_zero]
  ext a l
  rw [unitMatrix_mul_apply, unitMatrix_mul_apply]
  rfl

theorem ell_mem_ker (u : Fin d → Fin m → K) : ell alg u ∈ LinearMap.ker (W alg) := by
  rw [ell_apply]
  exact Submodule.sum_mem _ fun i _ => φ_mem_ker alg _ _

theorem J_le_ker : J alg ≤ LinearMap.ker (W alg) := by
  rintro _ ⟨y, rfl⟩; exact φ_mem_ker alg 0 y

theorem finrank_J (h1 : SN1 alg) : finrank K (J alg) = m := by
  rw [J, LinearMap.finrank_range_of_inj (φ0_injective alg h1), Module.finrank_fin_fun]

/-- **Lemma 4.1(iii).** `dim Q + (d+2)·m = r`. -/
theorem finrank_Kbar (h1 : SN1 alg) : finrank K (Kbar alg) + (d + 2) * m = r := by
  have h := YangN3Teil3.finrank_map_mkQ_add (LinearMap.ker (W alg)) (J alg) (J_le_ker alg)
  have h3 := G3 alg
  rw [finrank_J alg h1] at h
  simp only [Kbar, π] at h ⊢
  rw [show (d + 2) * m = (d + 1) * m + m by ring]
  omega

theorem π_eq_zero_iff (x : Fin r → K) : π alg x = 0 ↔ x ∈ J alg :=
  Submodule.Quotient.mk_eq_zero _

theorem π_φ0 (y : Fin m → K) : π alg (φ alg 0 y) = 0 :=
  (π_eq_zero_iff alg _).2 ⟨y, rfl⟩

theorem range_Lq_le_Kbar : LinearMap.range (Lq alg) ≤ Kbar alg := by
  rintro _ ⟨u, rfl⟩
  rw [Lq_apply]
  exact Submodule.mem_map_of_mem (ell_mem_ker alg u)

end Basics

/-! ## Lemma 10 and the inequality (1) -/

section Lemma10

variable {K : Type u} [Field K] {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r)

/-- The `h`-term vanishes: `∑_{i,j} p_i p_j G(c_{i,j}) = 0` for skew `c` (no division by 2). -/
theorem skew_sum_eq_zero {R : Type*} [CommRing R] {V : Type v} [AddCommGroup V] [Module K V]
    [Module K R] (G : V →ₗ[K] R) (p : Fin d → R) (c : skewSpace K V d) :
    ∑ i, p i * ∑ j, p j * G ((c : Fin d → Fin d → V) i j) = 0 := by
  classical
  set cc : Fin d → Fin d → V := (c : Fin d → Fin d → V)
  have hc1 : ∀ i, cc i i = 0 := c.2.1
  have hc2 : ∀ i j, cc j i = -cc i j := c.2.2
  have key : ∑ x : Fin d × Fin d, p x.1 * (p x.2 * G (cc x.1 x.2)) = 0 := by
    refine Finset.sum_involution (fun x _ => (x.2, x.1)) ?_ ?_ (fun _ _ => by simp)
      (fun _ _ => rfl)
    · intro x _
      simp only
      rw [hc2 x.1 x.2, map_neg]
      ring
    · intro x _ hx heq
      apply hx
      have hx12 : x.2 = x.1 := (Prod.ext_iff.1 heq).1
      rw [hx12, hc1, map_zero, mul_zero, mul_zero]
  rw [Fintype.sum_prod_type] at key
  simpa [Finset.mul_sum] using key

/-- `(u, c) ↦ −g(u_i) + h(c)_i ∈ ker W` (before passing to `Q`). -/
def Mvec (i : Fin d) : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d →ₗ[K] (Fin r → K) :=
  -(gU alg ∘ₗ LinearMap.proj i ∘ₗ LinearMap.fst K _ _) +
    ell alg ∘ₗ LinearMap.proj i ∘ₗ (skewSpace K (Fin m → K) d).subtype ∘ₗ LinearMap.snd K _ _

theorem Mvec_apply (i : Fin d) (x : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d) :
    Mvec alg i x = -(gU alg (x.1 i)) + ell alg ((x.2 : Fin d → Fin d → Fin m → K) i) := rfl

theorem Mvec_mem (i : Fin d) (x : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d) :
    Mvec alg i x ∈ LinearMap.ker (W alg) := by
  rw [Mvec_apply]
  exact Submodule.add_mem _ (Submodule.neg_mem _ (gU_mem_ker alg _)) (ell_mem_ker alg _)

/-- The second component of `Φ`, `(u, c) ↦ [−g(u_i) + h(c)_i] ∈ Q`, with values in `Kbar`. -/
def Φ₂ : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d →ₗ[K] (Fin d → Kbar alg) :=
  LinearMap.pi fun i =>
    LinearMap.codRestrict (Kbar alg) ((π alg) ∘ₗ Mvec alg i)
      (fun x => Submodule.mem_map_of_mem (Mvec_mem alg i x))

/-- `Φ(u, c) = ([ℓ(u)], ([−g(u_i) + h(c)_i])_i)` (prose Section 5). -/
def Φ : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d →ₗ[K]
    ((Fin r → K) ⧸ J alg) × (Fin d → Kbar alg) :=
  ((Lq alg) ∘ₗ LinearMap.fst K _ _).prod (Φ₂ alg)

theorem Φ₂_apply (x : (Fin d → Fin m → K) × skewSpace K (Fin m → K) d) (i : Fin d) :
    ((Φ₂ alg x i : Kbar alg) : (Fin r → K) ⧸ J alg) =
      π alg (-(gU alg (x.1 i)) + ell alg ((x.2 : Fin d → Fin d → Fin m → K) i)) := rfl

/-- **Lemma 10, core.** Under (N1), `Φ(u, c) = 0` implies `u = 0`. -/
theorem lemma10_core (h1 : SN1 alg) (u : Fin d → Fin m → K) (c : skewSpace K (Fin m → K) d)
    (hΦ : Φ alg (u, c) = 0) : u = 0 := by
  classical
  have hA : Lq alg u = 0 := congrArg Prod.fst hΦ
  have h2 : Φ₂ alg (u, c) = 0 := congrArg Prod.snd hΦ
  have hB : ∀ i, π alg (-(gU alg (u i)) + ell alg ((c : Fin d → Fin d → Fin m → K) i)) = 0 := by
    intro i
    have h := Φ₂_apply alg (u, c) i
    rw [h2] at h
    simpa using h.symm
  rw [Lq_apply, π_eq_zero_iff] at hA
  obtain ⟨y0, hy0⟩ := LinearMap.mem_range.1 hA
  choose y hy using fun i => LinearMap.mem_range.1 ((π_eq_zero_iff alg _).1 (hB i))
  -- the `h`-term vanishes
  have hskew : ∑ i, avec alg (eA i.succ 0) * ell alg ((c : Fin d → Fin d → Fin m → K) i) = 0 := by
    have := skew_sum_eq_zero (bvec alg ∘ₗ emb) (fun i => avec alg (eA i.succ 0)) c
    simp only [ell_apply, φ_apply]
    simpa using this
  -- left side of (*)
  have hL : avec alg (eA 0 1) * ell alg u + ∑ i, avec alg (eA i.succ 0) *
      (-(gU alg (u i)) + ell alg ((c : Fin d → Fin d → Fin m → K) i)) =
      avec alg (eA 0 0) * ∑ i, avec alg (eA i.succ 0) * bvec alg (top (u i)) := by
    simp only [mul_add, Finset.sum_add_distrib, hskew, add_zero]
    rw [ell_apply, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [gU_apply, φ_apply]
    ring
  -- right side of (*)
  have hR : avec alg (eA 0 1) * φ alg 0 y0 + ∑ i, avec alg (eA i.succ 0) * φ alg 0 (y i) =
      avec alg (eA 0 0) * (avec alg (eA 0 1) * bvec alg (emb y0) +
        ∑ i, avec alg (eA i.succ 0) * bvec alg (emb (y i))) := by
    rw [mul_add, Finset.mul_sum]
    congr 1
    · rw [φ_apply]; ring
    · refine Finset.sum_congr rfl fun i _ => ?_
      rw [φ_apply]; ring
  have e1 : avec alg (eA 0 1) * ell alg u + ∑ i, avec alg (eA i.succ 0) *
      (-(gU alg (u i)) + ell alg ((c : Fin d → Fin d → Fin m → K) i)) =
      avec alg (eA 0 1) * φ alg 0 y0 + ∑ i, avec alg (eA i.succ 0) * φ alg 0 (y i) := by
    rw [hy0]
    congr 1
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [hy i]
  have key' := YangN3Teil3.cancel_left (c := avec alg (eA 0 0)) h1 (hL.symm.trans (e1.trans hR))
  have hW := congrArg (W alg) key'
  simp only [map_sum, map_add, W_mul] at hW
  funext i l
  have := congrFun (congrFun hW i.succ) l
  simp only [Matrix.sum_apply, Matrix.add_apply, unitMatrix_mul_apply, Fin.succ_inj,
    Fin.succ_ne_zero, if_false, zero_add] at this
  simpa [Finset.sum_ite_eq, Finset.sum_ite_eq', top_apply_zero, emb_apply_zero] using this

/-- `ker Φ = {0} × ker H`. -/
theorem ker_Φ (h1 : SN1 alg) :
    LinearMap.ker (Φ alg) = (LinearMap.ker (Hq alg)).map (LinearMap.inr K _ _) := by
  ext ⟨u, c⟩
  constructor
  · intro hx
    have hu := lemma10_core alg h1 u c hx
    subst hu
    refine ⟨c, ?_, rfl⟩
    show Hq alg c = 0
    funext i
    have h0 : Φ₂ alg (0, c) = 0 := congrArg Prod.snd (LinearMap.mem_ker.1 hx)
    have h2 := Φ₂_apply alg (0, c) i
    rw [h0] at h2
    simpa [Hq, Lq_apply] using h2.symm
  · rintro ⟨c', hc', heq⟩
    simp only [LinearMap.inr_apply, Prod.mk.injEq] at heq
    obtain ⟨rfl, rfl⟩ := heq
    have hc'' : Hq alg c' = 0 := hc'
    show Φ alg (0, c') = 0
    refine Prod.ext ?_ ?_
    · simp [Φ]
    · funext i
      apply Subtype.ext
      show ((Φ₂ alg (0, c') i : Kbar alg) : (Fin r → K) ⧸ J alg) = 0
      rw [Φ₂_apply]
      have := congrFun hc'' i
      simp only [Hq, skewExt_apply, Lq_apply, Pi.zero_apply] at this
      simpa using this

/-- **Inequality (1)**: `d·m + rk H ≤ rk L + d·dim Q`. -/
theorem ineq1 (h1 : SN1 alg) :
    d * m + finrank K (LinearMap.range (Hq alg)) ≤
      finrank K (LinearMap.range (Lq alg)) + d * finrank K (Kbar alg) := by
  have hrn := LinearMap.finrank_range_add_finrank_ker (Φ alg)
  have hH := LinearMap.finrank_range_add_finrank_ker (Hq alg)
  rw [ker_Φ alg h1, ← (Submodule.equivMapOfInjective _ LinearMap.inr_injective
    (LinearMap.ker (Hq alg))).finrank_eq] at hrn
  rw [Module.finrank_prod, Module.finrank_pi_fintype] at hrn
  simp only [Module.finrank_fin_fun, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    smul_eq_mul] at hrn
  have hle : finrank K (LinearMap.range (Φ alg)) ≤
      finrank K (LinearMap.range (Lq alg)) + d * finrank K (Kbar alg) := by
    refine (YangN3Teil3.finrank_range_prod_le _ _).trans (add_le_add ?_ ?_)
    · exact Submodule.finrank_mono (LinearMap.range_comp_le_range _ _)
    · refine (Submodule.finrank_le _).trans ?_
      rw [Module.finrank_pi_fintype]
      simp
  omega

end Lemma10

/-! ## Lemma 8, Lemma 8′, Lemma 9 -/

section Lemma8

variable {K : Type u} [Field K] {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r)

/-- **Lemma 8.** Under (N1), (N2): for every subspace `S ≠ 0` of `K^{2×m}`,
`dim(f_0(S) + … + f_d(S)) ≥ dim S + d`. (Generalises `YangN3Teil3.lemma_B`.) -/
theorem lemma8 (h1 : SN1 alg) (h2 : SN2 alg) (S : Submodule K (Matrix (Fin 2) (Fin m) K))
    (hS : S ≠ ⊥) :
    finrank K S + d ≤ finrank K (⨆ i, S.map (fv alg i) : Submodule K (Fin r → K)) := by
  classical
  set X := S.map (fv alg 0) with hXdef
  have hinj := G5 alg h1
  obtain ⟨v₀, hv₀S, hv₀⟩ := (Submodule.ne_bot_iff S).1 hS
  have hex : ∃ j, ∃ w ∈ X, w ≠ 0 ∧ w ∈ YangN3Teil3.flag (K := K) (r := r) j :=
    ⟨r, fv alg 0 v₀, Submodule.mem_map_of_mem hv₀S,
      fun h => hv₀ (hinj (by rw [h, map_zero])), fun k hk => absurd k.isLt (by omega)⟩
  set j₀ := Nat.find hex with hj₀
  obtain ⟨w, hwX, hw0, hwE⟩ := Nat.find_spec hex
  replace hwE : w ∈ YangN3Teil3.flag (K := K) (r := r) j₀ := hwE
  have hmin : ∀ j < j₀, ¬ ∃ w ∈ X, w ≠ 0 ∧ w ∈ YangN3Teil3.flag (K := K) (r := r) j :=
    fun j hj => Nat.find_min hex hj
  have hj₀r : j₀ ≤ r := Nat.find_min' hex
    ⟨fv alg 0 v₀, Submodule.mem_map_of_mem hv₀S,
      fun h => hv₀ (hinj (by rw [h, map_zero])), fun k hk => absurd k.isLt (by omega)⟩
  have hj₀pos : 0 < j₀ := by
    rcases Nat.eq_zero_or_pos j₀ with h | h
    · exfalso; apply hw0; funext k; exact hwE k (by rw [h]; exact Nat.zero_le _)
    · exact h
  set k₀ : Fin r := ⟨j₀ - 1, by omega⟩ with hk₀
  have hXE : X ⊓ YangN3Teil3.flag j₀ ≤ K ∙ w := by
    rintro w' ⟨hw'X, hw'E⟩
    rw [Submodule.mem_span_singleton]
    have hwk₀ : w k₀ ≠ 0 := by
      intro hz
      apply hmin (j₀ - 1) (by omega)
      refine ⟨w, hwX, hw0, fun k hk => ?_⟩
      rcases Nat.lt_or_ge k.val j₀ with h | h
      · have : k = k₀ := Fin.ext (by simp [hk₀]; omega)
        rw [this, hz]
      · exact hwE k h
    refine ⟨w' k₀ / w k₀, ?_⟩
    rcases eq_or_ne ((w' k₀ / w k₀) • w) w' with heq | hne
    · exact heq
    exfalso
    apply hmin (j₀ - 1) (by omega)
    refine ⟨w' - (w' k₀ / w k₀) • w, X.sub_mem hw'X (X.smul_mem _ hwX),
      sub_ne_zero.2 (Ne.symm hne), fun k hk => ?_⟩
    rcases Nat.lt_or_ge k.val j₀ with h | h
    · have : k = k₀ := Fin.ext (by simp [hk₀]; omega)
      subst this
      simp only [Pi.sub_apply, Pi.smul_apply, smul_eq_mul]
      field_simp
    · simp [hw'E k h, hwE k h]
  obtain ⟨v, hvS, rfl⟩ := Submodule.mem_map.1 hwX
  have hv : v ≠ 0 := fun h => hw0 (by rw [h, map_zero])
  set T := Submodule.span K (Set.range fun i => fv alg i v) with hT
  have hTdim : finrank K T = d + 1 := by
    rw [hT, finrank_span_eq_card (h2 v hv)]; simp
  have hTE : T ≤ YangN3Teil3.flag j₀ := by
    rw [hT, Submodule.span_le, Set.range_subset_iff]
    intro i k hk
    have hk0 : fv alg 0 v k = 0 := hwE k hk
    rw [fv_apply] at hk0
    have hb : bvec alg v k = 0 := by
      simp only [Pi.mul_apply] at hk0
      exact (mul_eq_zero.1 hk0).resolve_left (h1 k)
    show fv alg i v k = 0
    simp [fv_apply, hb]
  have hXT : finrank K (X ⊓ T : Submodule K _) ≤ 1 := by
    calc finrank K (X ⊓ T : Submodule K _) ≤ finrank K (K ∙ fv alg 0 v) :=
          Submodule.finrank_mono (le_trans (inf_le_inf_left X hTE) hXE)
      _ = 1 := finrank_span_singleton hw0
  have hXdim : finrank K X = finrank K S :=
    ((Submodule.equivMapOfInjective _ hinj S).finrank_eq).symm
  have hsup := Submodule.finrank_sup_add_finrank_inf_eq X T
  have hle : X ⊔ T ≤ ⨆ i, S.map (fv alg i) := by
    refine sup_le (le_iSup (fun i => S.map (fv alg i)) 0) ?_
    rw [hT, Submodule.span_le, Set.range_subset_iff]
    intro i
    exact (le_iSup (fun i => S.map (fv alg i)) i) (Submodule.mem_map_of_mem hvS)
  have := Submodule.finrank_mono hle
  omega

/-- **Lemma 8′.** Under (N1), (N2) and `m ≥ 1`: `rk L ≥ d`. -/
theorem lemma8' (h1 : SN1 alg) (h2 : SN2 alg) (hm : 1 ≤ m) :
    d ≤ finrank K (LinearMap.range (Lq alg)) := by
  classical
  set S : Submodule K (Matrix (Fin 2) (Fin m) K) := LinearMap.range emb
  have hSdim : finrank K S = m := by
    rw [LinearMap.finrank_range_of_inj emb_injective, Module.finrank_fin_fun]
  have hS : S ≠ ⊥ := by
    intro h; rw [h, finrank_bot] at hSdim; omega
  have h8 := lemma8 alg h1 h2 S hS
  set Y := (⨆ i, S.map (fv alg i) : Submodule K (Fin r → K)) with hYdef
  have hJY : J alg ≤ Y := by
    rintro _ ⟨y, rfl⟩
    exact (le_iSup (fun i => S.map (fv alg i)) 0) ⟨emb y, ⟨y, rfl⟩, rfl⟩
  have hq := YangN3Teil3.finrank_map_mkQ_add Y (J alg) hJY
  rw [finrank_J alg h1] at hq
  have hYL : Y.map (π alg) ≤ LinearMap.range (Lq alg) := by
    rw [hYdef, Submodule.map_iSup]
    refine iSup_le fun i => ?_
    rintro _ ⟨_, ⟨x, ⟨y, rfl⟩, rfl⟩, rfl⟩
    rcases Fin.eq_zero_or_eq_succ i with rfl | ⟨j, rfl⟩
    · rw [show fv alg 0 (emb y) = φ alg 0 y from rfl, π_φ0]
      exact Submodule.zero_mem _
    · refine ⟨Pi.single j y, ?_⟩
      rw [Lq_apply, ell_apply, Finset.sum_eq_single j]
      · simp [φ]
      · intro k _ hk; simp [Pi.single_apply, hk]
      · simp
  have := Submodule.finrank_mono hYL
  simp only [π] at this
  omega

/-- **Lemma 9.** Over an algebraically closed field, under (N1), (N2): there is no subspace
`S ≠ 0` and no `i ≠ 0` with `f_i(S) ⊆ f_0(S)`. -/
theorem lemma9 [IsAlgClosed K] (h1 : SN1 alg) (h2 : SN2 alg)
    (S : Submodule K (Matrix (Fin 2) (Fin m) K)) (hS : S ≠ ⊥) (i : Fin (d + 1)) (hi : i ≠ 0)
    (hsub : S.map (fv alg i) ≤ S.map (fv alg 0)) : False := by
  classical
  set V := S.map (fv alg 0) with hV
  let P : (Fin r → K) →ₗ[K] (Fin r → K) :=
    { toFun := fun t k => alg.alpha k (eA i 0) / alg.alpha k (eA 0 0) * t k
      map_add' := fun s t => by ext k; simp only [Pi.add_apply]; ring
      map_smul' := fun c t => by
        ext k; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]; ring }
  have hP : ∀ s, P (fv alg 0 s) = fv alg i s := by
    intro s
    ext k
    show alg.alpha k (eA i 0) / alg.alpha k (eA 0 0) * (alg.alpha k (eA 0 0) * alg.beta k s) =
      alg.alpha k (eA i 0) * alg.beta k s
    rw [← mul_assoc, div_mul_cancel₀ _ (h1 k)]
  have hmaps : ∀ x ∈ V, P x ∈ V := by
    rintro _ ⟨s, hs, rfl⟩
    rw [hP]
    exact hsub ⟨s, hs, rfl⟩
  let P' : Module.End K V := P.restrict hmaps
  have hVne : V ≠ ⊥ := by
    obtain ⟨v₀, hv₀S, hv₀⟩ := (Submodule.ne_bot_iff S).1 hS
    rw [Submodule.ne_bot_iff]
    exact ⟨fv alg 0 v₀, ⟨v₀, hv₀S, rfl⟩, fun h => hv₀ (G5 alg h1 (by rw [h, map_zero]))⟩
  haveI : Nontrivial V := Submodule.nontrivial_iff_ne_bot.2 hVne
  obtain ⟨μ, hμ⟩ := Module.End.exists_eigenvalue P'
  obtain ⟨w, hw⟩ := hμ.exists_hasEigenvector
  have hPw : P' w = μ • w := hw.apply_eq_smul
  have hw0 : w ≠ 0 := hw.2
  obtain ⟨s, hsS, hs⟩ := w.2
  have hs0 : s ≠ 0 := by
    rintro rfl
    apply hw0
    apply Subtype.ext
    rw [← hs, map_zero]
    rfl
  have heig : fv alg i s = μ • fv alg 0 s := by
    have := congrArg Subtype.val hPw
    simp only [P', LinearMap.restrict_coe_apply, Submodule.coe_smul] at this
    rw [← hP, hs]
    exact this
  have hli := Fintype.linearIndependent_iff.1 (h2 s hs0)
    (Pi.single i 1 - Pi.single 0 μ) (by
      simp only [Pi.sub_apply, sub_smul, Finset.sum_sub_distrib]
      rw [Finset.sum_eq_single i, Finset.sum_eq_single 0]
      · simp [heig]
      · intro j _ hj; simp [Pi.single_apply, hj]
      · simp
      · intro j _ hj; simp [Pi.single_apply, hj]
      · simp) i
  simp [Pi.single_apply, hi] at hli

end Lemma8

/-! ## Lemma 15(b) and Lemma 14 -/

section Lemma15

variable {K : Type u} [Field K] {d m r : ℕ} (alg : BilinearAlgorithm K (d + 1) 2 m r)

theorem Lq_eq_sumMap : Lq alg = sumMap (Fq alg) := rfl

/-- **Lemma 15(b).** Over an algebraically closed field, under (N1), (N2), `d ≥ 2`: if
`rk L = d·ρ`, then `ρ = m`. -/
theorem lemma15b [IsAlgClosed K] (h1 : SN1 alg) (h2 : SN2 alg) (hd : 2 ≤ d) {ρ : ℕ}
    (hρ : IsGreatest (Set.range (rkComb (Fq alg))) ρ)
    (hL : finrank K (LinearMap.range (Lq alg)) = d * ρ) : ρ = m := by
  classical
  obtain ⟨hrk, hker, hint⟩ := lemma15b_core (Fq alg) hρ hL
  obtain ⟨i0, j0, hij⟩ : ∃ i0 j0 : Fin d, j0 ≠ i0 :=
    ⟨⟨0, by omega⟩, ⟨1, by omega⟩, by simp [Fin.ext_iff]⟩
  set N := LinearMap.ker (Fq alg i0)
  set S := N.map (emb : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K)
  have hS : S = ⊥ := by
    by_contra hS
    apply lemma9 alg h1 h2 S hS i0.succ (Fin.succ_ne_zero _)
    rintro _ ⟨_, ⟨v, hv, rfl⟩, rfl⟩
    have hvall : ∀ j : Fin d, Fq alg j v = 0 := fun j => hker i0 j v hv
    have hJ : ∀ j : Fin d, φ alg j.succ v ∈ J alg := fun j => (π_eq_zero_iff alg _).1 (hvall j)
    choose u hu using fun j => LinearMap.mem_range.1 (hJ j)
    -- `a_0 f_{j+1}(u_i) = a_{j+1} a_{i+1} ℬ(v)`
    have e : ∀ i j : Fin d, avec alg (eA 0 0) * φ alg j.succ (u i) =
        avec alg (eA j.succ 0) * (avec alg (eA i.succ 0) * bvec alg (emb v)) := by
      intro i j
      have := hu i
      rw [φ_apply, φ_apply] at this
      rw [φ_apply, ← this]
      ring
    have hsym : φ alg j0.succ (u i0) = φ alg i0.succ (u j0) := by
      apply YangN3Teil3.cancel_left (c := avec alg (eA 0 0)) h1
      rw [e, e]
      ring
    have hF : Fq alg j0 (u i0) = Fq alg i0 (u j0) := by
      simp only [Fq, LinearMap.comp_apply, hsym]
    have h0 := hint j0 i0 hij _ _ hF
    have huN : u i0 ∈ N := hker j0 i0 _ h0
    refine ⟨emb (u i0), ⟨u i0, huN, rfl⟩, ?_⟩
    exact hu i0
  have hN : N = ⊥ := by
    rw [eq_bot_iff]
    intro x hx
    have : emb x ∈ S := Submodule.mem_map_of_mem hx
    rw [hS, Submodule.mem_bot] at this
    rw [Submodule.mem_bot]
    exact emb_injective (by rw [this, map_zero])
  have hrn := LinearMap.finrank_range_add_finrank_ker (Fq alg i0)
  have hN' : LinearMap.ker (Fq alg i0) = ⊥ := hN
  rw [hN', finrank_bot, Module.finrank_fin_fun, hrk i0] at hrn
  omega

/-- Vectors whose entries in `I` vanish. -/
def coordZero (I : Finset (Fin r)) : Submodule K (Fin r → K) where
  carrier := {x | ∀ t ∈ I, x t = 0}
  zero_mem' := fun _ _ => rfl
  add_mem' := fun ha hb t ht => by simp [ha t ht, hb t ht]
  smul_mem' := fun c x hx t ht => by simp [hx t ht]

theorem coordZero_anti {I I' : Finset (Fin r)} (h : I ⊆ I') :
    coordZero (K := K) I' ≤ coordZero I :=
  fun _ hx t ht => hx t (h ht)

/-- **Lemma 14, step 1.** For a subspace `Js` of `K^r` and `k ≤ dim Js` there is a set `I` of
`k` coordinates with `dim(Js ∩ {x : x_t = 0, t ∈ I}) + k ≤ dim Js` (i.e. the projection of
`Js` onto `K^I` is onto). -/
theorem exists_coords (Js : Submodule K (Fin r → K)) :
    ∀ k ≤ finrank K Js, ∃ I : Finset (Fin r), I.card = k ∧
      finrank K (Js ⊓ coordZero I : Submodule K _) + k ≤ finrank K Js := by
  classical
  intro k
  induction k with
  | zero =>
    intro _
    refine ⟨∅, rfl, ?_⟩
    have : coordZero (K := K) (∅ : Finset (Fin r)) = ⊤ := by
      ext x; simp [coordZero]
    rw [this, inf_top_eq]
    simp
  | succ k ih =>
    intro hk
    obtain ⟨I, hIc, hI⟩ := ih (by omega)
    have hJr : finrank K Js ≤ r := by
      have := Submodule.finrank_le Js
      simpa using this
    by_cases hb : Js ⊓ coordZero I = ⊥
    · obtain ⟨t, -, ht⟩ := Finset.exists_mem_not_mem_of_card_lt_card
        (s := I) (t := (Finset.univ : Finset (Fin r))) (by simp [hIc]; omega)
      refine ⟨insert t I, by rw [Finset.card_insert_of_not_mem ht, hIc], ?_⟩
      have hle : Js ⊓ coordZero (insert t I) ≤ Js ⊓ coordZero I :=
        inf_le_inf_left _ (coordZero_anti (Finset.subset_insert _ _))
      have := Submodule.finrank_mono hle
      rw [hb, finrank_bot] at this hI
      omega
    · obtain ⟨x, hx, hx0⟩ := (Submodule.ne_bot_iff _).1 hb
      obtain ⟨t, ht⟩ := Function.ne_iff.1 hx0
      have htI : t ∉ I := fun h => ht (hx.2 t h)
      refine ⟨insert t I, by rw [Finset.card_insert_of_not_mem htI, hIc], ?_⟩
      have hlt : Js ⊓ coordZero (insert t I) < Js ⊓ coordZero I := by
        refine lt_of_le_of_ne (inf_le_inf_left _ (coordZero_anti (Finset.subset_insert _ _)))
          fun h => ?_
        have : x ∈ Js ⊓ coordZero (insert t I) := by rw [h]; exact hx
        exact ht (this.2 t (Finset.mem_insert_self _ _))
      have := Submodule.finrank_lt_finrank_of_lt hlt
      omega

/-- **Lemma 14.** Under (N1), (N2) and `m ≥ d`: `ρ ≥ d`. -/
theorem lemma14 (h1 : SN1 alg) (h2 : SN2 alg) (hm : d ≤ m) {ρ : ℕ}
    (hρ : IsGreatest (Set.range (rkComb (Fq alg))) ρ) : d ≤ ρ := by
  classical
  obtain ⟨I, hIc, hI⟩ := exists_coords (J alg) d (by rw [finrank_J alg h1]; exact hm)
  rw [finrank_J alg h1] at hI
  -- choice of `γ ≠ 0` with `∑ γ_i α_t(e_{i,0}) = 0` for `t ∈ I`
  let Γ : (Fin (d + 1) → K) →ₗ[K] (I → K) :=
    { toFun := fun γ t => ∑ i, γ i * alg.alpha t (eA i 0)
      map_add' := fun γ γ' => by ext t; simp [add_mul, Finset.sum_add_distrib]
      map_smul' := fun c γ => by ext t; simp [Finset.mul_sum, mul_assoc] }
  have hΓ := LinearMap.finrank_range_add_finrank_ker Γ
  have hΓr : finrank K (LinearMap.range Γ) ≤ d := by
    refine (Submodule.finrank_le _).trans ?_
    rw [Module.finrank_fintype_fun_eq_card, Fintype.card_coe, hIc]
  rw [Module.finrank_fin_fun] at hΓ
  have hker : LinearMap.ker Γ ≠ ⊥ := by
    intro h; rw [h, finrank_bot] at hΓ; omega
  obtain ⟨γ, hγ, hγ0⟩ := (Submodule.ne_bot_iff _).1 hker
  have hγI : ∀ t ∈ I, ∑ i, γ i * alg.alpha t (eA i 0) = 0 := fun t ht =>
    congrFun (LinearMap.mem_ker.1 hγ) ⟨t, ht⟩
  -- `f' = ∑ γ_i f_i`
  let f' : Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) := ∑ i, γ i • fv alg i
  have hf'apply : ∀ x t, f' x t = (∑ i, γ i * alg.alpha t (eA i 0)) * alg.beta t x := by
    intro x t
    simp only [f', LinearMap.coeFn_sum, Finset.sum_apply, LinearMap.smul_apply, Pi.smul_apply,
      fv_apply, avec, bvec, Pi.mul_apply, LinearMap.pi_apply, smul_eq_mul, Finset.sum_mul]
    exact Finset.sum_congr rfl fun i _ => by ring
  have hf'inj : Function.Injective (f' ∘ₗ emb) := by
    refine (injective_iff_map_eq_zero _).2 fun y hy => ?_
    rcases eq_or_ne y 0 with hy0 | hy0
    · exact hy0
    exfalso
    have hx0 : emb y ≠ 0 := fun h => hy0 (emb_injective (by rw [h, map_zero]))
    apply hγ0
    have hsum : ∑ i, γ i • fv alg i (emb y) = 0 := by
      simpa [f', LinearMap.coeFn_sum] using hy
    exact funext fun i => Fintype.linearIndependent_iff.1 (h2 _ hx0) γ hsum i
  set X := LinearMap.range (f' ∘ₗ emb)
  have hXdim : finrank K X = m := by
    rw [LinearMap.finrank_range_of_inj hf'inj, Module.finrank_fin_fun]
  have hXJ : X ⊓ J alg ≤ J alg ⊓ coordZero I := by
    rintro _ ⟨⟨y, rfl⟩, hJ⟩
    refine ⟨hJ, fun t ht => ?_⟩
    simp only [LinearMap.comp_apply]
    rw [hf'apply, hγI t ht, zero_mul]
  have hrn := YangN3Teil3.finrank_map_add_finrank_inf_ker (π alg) X
  rw [show LinearMap.ker (π alg) = J alg from Submodule.ker_mkQ _] at hrn
  have h3 := Submodule.finrank_mono hXJ
  -- `[f'(U)] = range (∑_j γ_{j+1} F_j)`
  have hmap : X.map (π alg) ≤ LinearMap.range (∑ j, γ j.succ • Fq alg j) := by
    rintro _ ⟨_, ⟨y, rfl⟩, rfl⟩
    refine ⟨y, ?_⟩
    simp only [f', LinearMap.comp_apply, LinearMap.coeFn_sum, Finset.sum_apply,
      LinearMap.smul_apply, map_sum, map_smul]
    rw [Fin.sum_univ_succ]
    simp only [show ∀ y, π alg (fv alg 0 (emb y)) = 0 from fun y => π_φ0 alg y, smul_zero,
      zero_add]
    rfl
  have h4 := Submodule.finrank_mono hmap
  have h5 : finrank K (LinearMap.range (∑ j, γ j.succ • Fq alg j)) ≤ ρ :=
    hρ.2 ⟨fun j => γ j.succ, rfl⟩
  omega

end Lemma15

/-! ## Lemma 6 (strong normalization) for `⟨d+1, 2, m⟩`

This generalises `YangN3Teil2.lemmaA` (case `n = 3`) to `n = d + 1` rows, with the same
proof: the polynomial functions, outer products, R2 (`removeZeroAlpha`) and R3
(`changeBasis`) are taken from `YangN3Teil2`. -/

section Lemma6

open Matrix

open YangN3Teil2 (IsPolyFun IsNonzeroPolyFun outer basisVec outer_apply outer_add_left
  outer_smul_left outer_add_right outer_smul_right outer_mul sum_smul_outer outer_basisVec
  mul_unitMatrix_mul linearForm_eq_zero_of_unitMatrix exists_vecMul_ne_zero changeBasis
  changeBasis_alpha_apply changeBasis_beta_apply removeZeroAlpha removeZeroAlpha_alpha_ne_zero
  removeZeroAlpha_length_le)

variable {K : Type u} [Field K] {d m r : ℕ}

theorem fv_apply_apply (alg : BilinearAlgorithm K (d + 1) 2 m r) (i : Fin (d + 1))
    (x : Matrix (Fin 2) (Fin m) K) (k : Fin r) :
    fv alg i x k = alg.alpha k (unitMatrix i 0) * alg.beta k x := rfl

/-- `α(u p) = ∑ₐ u_a α(e_a p)`. -/
theorem linearForm_outer_eq_sum' {a b : ℕ} (φ : Matrix (Fin a) (Fin b) K →ₗ[K] K)
    (u : Fin a → K) (p : Fin b → K) :
    φ (outer u p) = ∑ x, u x * φ (outer (basisVec x) p) := by
  let F : (Fin a → K) →ₗ[K] K :=
    { toFun := fun u => φ (outer u p)
      map_add' := fun u v => by simp [outer_add_left]
      map_smul' := fun c u => by simp [outer_smul_left] }
  have hF : φ (outer u p) = F u := rfl
  rw [hF, F.pi_apply_eq_sum_univ u]
  rfl

variable (alg : BilinearAlgorithm K (d + 1) 2 m r)

/-- The support `{k : ℬ(w)_k ≠ 0}`. -/
noncomputable def supp (w : Matrix (Fin 2) (Fin m) K) : Finset (Fin r) := by
  classical
  exact Finset.univ.filter fun k => alg.beta k w ≠ 0

/-- `a ↦ D(a p) ℬ(w)` from `K^{d+1}` to `K^r`. -/
def lmap (p : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K) :
    (Fin (d + 1) → K) →ₗ[K] (Fin r → K) where
  toFun a k := alg.alpha k (outer a p) * alg.beta k w
  map_add' a b := by ext k; simp [outer_add_left, add_mul]
  map_smul' c a := by ext k; simp [outer_smul_left, mul_assoc]

@[simp] theorem lmap_apply (p : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K)
    (a : Fin (d + 1) → K) (k : Fin r) :
    lmap alg p w a k = alg.alpha k (outer a p) * alg.beta k w := rfl

theorem lmap_add_left (p q : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K) :
    lmap alg (p + q) w = lmap alg p w + lmap alg q w := by
  ext a k; simp [outer_add_right, add_mul]

theorem lmap_smul_left (c : K) (p : Fin 2 → K) (w : Matrix (Fin 2) (Fin m) K) :
    lmap alg (c • p) w = c • lmap alg p w := by
  ext a k; simp [outer_smul_right, mul_assoc]

theorem lmap_injective {p : Fin 2 → K} {w : Matrix (Fin 2) (Fin m) K} (hpw : p ᵥ* w ≠ 0) :
    Function.Injective (lmap alg p w) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro a ha
  have h1 : outer a p * w = 0 := by
    rw [alg.correct]
    apply Finset.sum_eq_zero
    intro k _
    have hk : alg.alpha k (outer a p) * alg.beta k w = 0 := congrFun ha k
    simp [hk]
  rw [outer_mul] at h1
  obtain ⟨l, hl⟩ : ∃ l, (p ᵥ* w) l ≠ 0 := by
    by_contra h
    push_neg at h
    exact hpw (funext h)
  funext i
  have hi : a i * (p ᵥ* w) l = 0 := by
    simpa only [outer_apply, Matrix.zero_apply] using congrFun (congrFun h1 i) l
  exact (mul_eq_zero.mp hi).resolve_right hl

theorem lmap_injective_of_supp {p : Fin 2 → K} {w w' : Matrix (Fin 2) (Fin m) K}
    (h : supp alg w = supp alg w') (hinj : Function.Injective (lmap alg p w)) :
    Function.Injective (lmap alg p w') := by
  classical
  have h' : ∀ k, alg.beta k w = 0 ↔ alg.beta k w' = 0 := by
    intro k
    have hk := Finset.ext_iff.mp h k
    simp only [supp, Finset.mem_filter, Finset.mem_univ, true_and] at hk
    exact not_iff_not.mp hk
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot'] at hinj ⊢
  intro a ha
  apply hinj a
  funext k
  have hk : alg.alpha k (outer a p) * alg.beta k w' = 0 := congrFun ha k
  simp only [lmap_apply, Pi.zero_apply, mul_eq_zero] at hk ⊢
  rcases hk with hk | hk
  · exact Or.inl hk
  · exact Or.inr ((h' k).mpr hk)

/-- The variables of the generic basis change: entries of `S` and `T`. -/
abbrev Var (d : ℕ) := (Fin (d + 1) × Fin (d + 1)) ⊕ (Fin 2 × Fin 2)

def matS (x : Var d → K) : Matrix (Fin (d + 1)) (Fin (d + 1)) K :=
  Matrix.of fun i j => x (Sum.inl (i, j))

def matT (x : Var d → K) : Matrix (Fin 2) (Fin 2) K := Matrix.of fun i j => x (Sum.inr (i, j))

def colS (x : Var d → K) : Fin (d + 1) → K := fun a => x (Sum.inl (a, 0))

def rowT (x : Var d → K) : Fin 2 → K := fun j => x (Sum.inr (0, j))

theorem rowT_add (x y : Var d → K) : rowT (x + y) = rowT x + rowT y := rfl

theorem rowT_smul (c : K) (x : Var d → K) : rowT (c • x) = c • rowT x := rfl

theorem exists_suppPoly [Infinite K] (sp : Finset (Fin r)) :
    ∃ φ : (Var d → K) → K, IsNonzeroPolyFun φ ∧ ∀ x, φ x ≠ 0 →
      ∀ w : Matrix (Fin 2) (Fin m) K, w ≠ 0 → supp alg w = sp →
        Function.Injective (lmap alg (rowT x) w) := by
  classical
  by_cases hex : ∃ w : Matrix (Fin 2) (Fin m) K, w ≠ 0 ∧ supp alg w = sp
  · obtain ⟨w0, hw0, hs0⟩ := hex
    obtain ⟨p0, hp0⟩ := exists_vecMul_ne_zero hw0
    have hinj0 := lmap_injective alg hp0
    obtain ⟨G, hG⟩ := LinearMap.exists_leftInverse_of_injective (lmap alg p0 w0)
      (LinearMap.ker_eq_bot.mpr hinj0)
    have hdet : ∀ x : Var d → K, LinearMap.det (G ∘ₗ lmap alg (rowT x) w0) =
        (Matrix.of fun i j =>
          G (lmap alg (rowT x) w0 (fun j' => if j' = j then 1 else 0)) i).det := by
      intro x
      rw [← LinearMap.det_toMatrix']
      congr 1
      ext i j
      simp [LinearMap.toMatrix'_apply]
    refine ⟨fun x => LinearMap.det (G ∘ₗ lmap alg (rowT x) w0), ⟨?_, ?_⟩, ?_⟩
    · simp only [hdet]
      apply YangN3Teil2.IsPolyFun.det
      intro i j
      apply YangN3Teil2.IsPolyFun.of_linear
      · intro x y
        simp [rowT_add, lmap_add_left]
      · intro c x
        simp [rowT_smul, lmap_smul_left]
    · refine ⟨Sum.elim 0 (fun ab => if ab.1 = 0 then p0 ab.2 else 0), ?_⟩
      have hrow : rowT (Sum.elim 0 (fun ab => if ab.1 = 0 then p0 ab.2 else 0) : Var d → K) =
          p0 := by
        funext j; simp [rowT]
      simp only [hrow, hG, LinearMap.det_id]
      exact one_ne_zero
    · intro x hx w hw hs
      have hcomp : Function.Injective (G ∘ₗ lmap alg (rowT x) w0) := by
        rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
        intro a ha
        have hmat := Matrix.eq_zero_of_mulVec_eq_zero
          (M := LinearMap.toMatrix' (G ∘ₗ lmap alg (rowT x) w0))
          (by rwa [LinearMap.det_toMatrix']) (v := a)
          (by rw [← Matrix.toLin'_apply, Matrix.toLin'_toMatrix']; exact ha)
        exact hmat
      have hL : Function.Injective (lmap alg (rowT x) w0) := by
        intro a b hab
        apply hcomp
        simp [hab]
      exact lmap_injective_of_supp alg (hs0.trans hs.symm) hL
  · refine ⟨fun _ => 1, ⟨YangN3Teil2.IsPolyFun.const 1, 0, one_ne_zero⟩, ?_⟩
    intro x _ w hw hs
    exact absurd ⟨w, hw, hs⟩ hex

theorem alpha_isNonzeroPolyFun (k : Fin r) (hk : alg.alpha k ≠ 0) :
    IsNonzeroPolyFun (fun x : Var d → K => alg.alpha k (outer (colS x) (rowT x))) := by
  classical
  refine ⟨?_, ?_⟩
  · have hfun : (fun x : Var d → K => alg.alpha k (outer (colS x) (rowT x))) =
        fun x => ∑ a, x (Sum.inl (a, 0)) * alg.alpha k (outer (basisVec a) (rowT x)) := by
      funext x
      exact linearForm_outer_eq_sum' (alg.alpha k) (colS x) (rowT x)
    rw [hfun]
    apply YangN3Teil2.IsPolyFun.sum
    intro a _
    apply (YangN3Teil2.IsPolyFun.coord _).mul
    apply YangN3Teil2.IsPolyFun.of_linear
    · intro x y; simp [rowT_add, outer_add_right]
    · intro c x; simp [rowT_smul, outer_smul_right]
  · obtain ⟨i, j, hij⟩ : ∃ i j, alg.alpha k (unitMatrix i j) ≠ 0 := by
      by_contra h
      push_neg at h
      exact hk (linearForm_eq_zero_of_unitMatrix _ h)
    refine ⟨Sum.elim (fun ab => if i = ab.1 then 1 else 0) (fun ab => if j = ab.2 then 1 else 0),
      ?_⟩
    have hcol : colS (Sum.elim (fun ab => if i = ab.1 then 1 else 0)
        (fun ab => if j = ab.2 then 1 else 0) : Var d → K) = basisVec i := rfl
    have hrow : rowT (Sum.elim (fun ab => if i = ab.1 then 1 else 0)
        (fun ab => if j = ab.2 then 1 else 0) : Var d → K) = basisVec j := rfl
    simp only [hcol, hrow, outer_basisVec]
    exact hij

theorem detS_isNonzeroPolyFun : IsNonzeroPolyFun (fun x : Var d → K => (matS x).det) := by
  classical
  refine ⟨YangN3Teil2.IsPolyFun.det _ fun i j => YangN3Teil2.IsPolyFun.coord _, ?_⟩
  refine ⟨Sum.elim (fun ab => (1 : Matrix (Fin (d + 1)) (Fin (d + 1)) K) ab.1 ab.2) 0, ?_⟩
  have h1 : matS (Sum.elim (fun ab => (1 : Matrix (Fin (d + 1)) (Fin (d + 1)) K) ab.1 ab.2) 0) =
      1 := by
    ext i j; simp [matS]
  show (matS _).det ≠ 0
  rw [h1, Matrix.det_one]
  exact one_ne_zero

theorem detT_isNonzeroPolyFun : IsNonzeroPolyFun (fun x : Var d → K => (matT x).det) := by
  classical
  refine ⟨YangN3Teil2.IsPolyFun.det _ fun i j => YangN3Teil2.IsPolyFun.coord _, ?_⟩
  refine ⟨Sum.elim 0 (fun ab => (1 : Matrix (Fin 2) (Fin 2) K) ab.1 ab.2), ?_⟩
  have h1 : matT (Sum.elim 0 (fun ab => (1 : Matrix (Fin 2) (Fin 2) K) ab.1 ab.2) :
      Var d → K) = 1 := by
    ext i j; simp [matT]
  show (matT _).det ≠ 0
  rw [h1, Matrix.det_one]
  exact one_ne_zero

/-- **Lemma 6** (strong normalization, `n = d + 1`). Over an infinite field, if no `α_k` is
the zero form, some change of basis R3 gives (N1) and (N2). -/
theorem lemma6 [Infinite K] (h : ∀ k, alg.alpha k ≠ 0) :
    ∃ (S : Matrix (Fin (d + 1)) (Fin (d + 1)) K) (T : Matrix (Fin 2) (Fin 2) K)
      (hS : IsUnit S.det) (hT : IsUnit T.det),
      SN1 (changeBasis alg S T hS hT) ∧ SN2 (changeBasis alg S T hS hT) := by
  classical
  choose φ hφ hφinj using fun sp : Finset (Fin r) => exists_suppPoly (d := d) alg sp
  have hall := (detS_isNonzeroPolyFun (K := K) (d := d)).mul
    ((detT_isNonzeroPolyFun (K := K) (d := d)).mul
    ((YangN3Teil2.IsNonzeroPolyFun.prod Finset.univ fun k _ => alpha_isNonzeroPolyFun alg k (h k)).mul
      (YangN3Teil2.IsNonzeroPolyFun.prod Finset.univ fun sp _ => hφ sp)))
  obtain ⟨x, hx⟩ := hall.2
  simp only [ne_eq, mul_eq_zero, not_or, Finset.prod_eq_zero_iff, Finset.mem_univ, true_and,
    not_exists] at hx
  obtain ⟨hxS, hxT, hxα, hxφ⟩ := hx
  have hS : IsUnit (matS x).det := isUnit_iff_ne_zero.mpr hxS
  have hT : IsUnit (matT x).det := isUnit_iff_ne_zero.mpr hxT
  refine ⟨matS x, matT x, hS, hT, ?_, ?_⟩
  · intro k
    show (changeBasis alg (matS x) (matT x) hS hT).alpha k (unitMatrix 0 0) ≠ 0
    rw [changeBasis_alpha_apply, mul_unitMatrix_mul]
    exact hxα k
  · intro v hv
    rw [Fintype.linearIndependent_iff]
    intro g hg
    have hw : (matT x)⁻¹ * v ≠ 0 := by
      intro h0
      apply hv
      rw [← Matrix.one_mul v, ← Matrix.mul_nonsing_inv (matT x) hT, Matrix.mul_assoc, h0,
        Matrix.mul_zero]
    have hinj := hφinj _ x (hxφ _) ((matT x)⁻¹ * v) hw rfl
    have hL : lmap alg (rowT x) ((matT x)⁻¹ * v) (matS x *ᵥ g) = 0 := by
      funext k
      have hk := congrFun hg k
      simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply, fv_apply_apply,
        changeBasis_alpha_apply, changeBasis_beta_apply, mul_unitMatrix_mul] at hk
      rw [Pi.zero_apply, ← hk, lmap_apply, ← sum_smul_outer, map_sum, Finset.sum_mul]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [map_smul, smul_eq_mul, mul_assoc]
      rfl
    have hSg : matS x *ᵥ g = 0 := hinj (hL.trans (map_zero _).symm)
    have hg0 : g = 0 := by
      have := congrArg (fun y => (matS x)⁻¹ *ᵥ y) hSg
      simpa [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul _ hS] using this
    intro i
    simp [hg0]

/-- **R2 and Lemma 6.** Over an infinite field, every decomposition of `⟨d+1,2,m⟩` of length
`r` gives one of length `r' ≤ r` with (N1) and (N2). -/
theorem exists_normalized [Infinite K] (alg : BilinearAlgorithm K (d + 1) 2 m r) :
    ∃ r' ≤ r, ∃ alg' : BilinearAlgorithm K (d + 1) 2 m r', SN1 alg' ∧ SN2 alg' := by
  classical
  obtain ⟨S, T, hS, hT, hSN⟩ :=
    lemma6 (removeZeroAlpha alg) (removeZeroAlpha_alpha_ne_zero alg)
  exact ⟨_, removeZeroAlpha_length_le alg, _, hSN⟩

end Lemma6

/-! ## Conclusion (prose Section 8) -/

section Conclusion

variable {K : Type u} [Field K] {d m r : ℕ}

/-- The final computation for `n = d + 1 ≥ 5` (prose Section 8). -/
theorem arith_ge5 (d m q ρ rL rH : ℕ) (hd : 4 ≤ d) (hI : d * m + rH ≤ rL + d * q)
    (h13 : d * ρ + (d - 2) * rL ≤ 2 * rH) (h8 : d ≤ rL) (h14 : d ≤ ρ) : m + d ≤ q + 2 := by
  obtain ⟨e, rfl⟩ : ∃ e, d = e + 4 := ⟨d - 4, by omega⟩
  have hsub : e + 4 - 2 = e + 2 := by omega
  rw [hsub] at h13
  by_contra hcon
  push_neg at hcon
  have F3 : (e + 4) * (e + 4) ≤ (e + 4) * ρ := Nat.mul_le_mul_left _ h14
  have F4 : e * (e + 4) ≤ e * rL := Nat.mul_le_mul_left _ h8
  have F5 : (e + 4) * (q + 1) ≤ (e + 4) * (m + e + 2) := Nat.mul_le_mul_left _ (by omega)
  nlinarith [F3, F4, F5, hI, h13]

/-- **Theorem 2 for normalized decompositions over an algebraically closed field**, given
Lemma 13 for `U = K^m` and `Q = K^r ⧸ J`. Here `n = d + 1`. -/
theorem core [IsAlgClosed K] (alg : BilinearAlgorithm K (d + 1) 2 m r) (h1 : SN1 alg)
    (h2 : SN2 alg) (h13 : Lemma13Statement K (Fin m → K) ((Fin r → K) ⧸ J alg))
    (hd : 3 ≤ d) (hm : d + 1 ≤ m) : (d + 1 + 2) * m + (d + 1 - 3) ≤ r := by
  obtain ⟨ρ, hρ⟩ := exists_isGreatest_rkComb (Fq alg)
  have h13' := h13 inferInstance inferInstance d (by omega) (Fq alg) ρ hρ
  rw [← Lq_eq_sumMap] at h13'
  change d * ρ + (d - 2) * finrank K (LinearMap.range (Lq alg)) ≤
    2 * finrank K (LinearMap.range (Hq alg)) at h13'
  have hI := ineq1 alg h1
  have hq := finrank_Kbar alg h1
  have h15a := lemma15a (Fq alg) hρ
  rw [← Lq_eq_sumMap] at h15a
  have hLQ : finrank K (LinearMap.range (Lq alg)) ≤ finrank K (Kbar alg) :=
    Submodule.finrank_mono (range_Lq_le_Kbar alg)
  have h8 := lemma8' alg h1 h2 (by omega)
  have h14 := lemma14 alg h1 h2 (by omega) hρ
  set q := finrank K (Kbar alg)
  set rL := finrank K (LinearMap.range (Lq alg))
  set rH := finrank K (LinearMap.range (Hq alg))
  rcases Nat.eq_or_lt_of_le hd with hd3 | hd4
  · -- case `n = 4`
    subst hd3
    by_contra hlt
    have hqm : q ≤ m := by omega
    have hL3 : rL = 3 * ρ := by omega
    have hρm := lemma15b alg h1 h2 (by norm_num) hρ hL3
    omega
  · -- case `n ≥ 5`
    have := arith_ge5 d m q ρ rL rH (by omega) hI h13' h8 h14
    have h3 : (d + 1 + 2) * m = (d + 2) * m + m := by ring
    omega

/-- The same for every `n ≥ 4` (no shift `n = d + 1`). -/
theorem main_algClosed (n : ℕ) [IsAlgClosed K] (hn : 4 ≤ n) (hnm : n ≤ m)
    (h13 : ∀ (U Q : Type u) [AddCommGroup U] [Module K U] [AddCommGroup Q] [Module K Q],
      Lemma13Statement K U Q)
    (alg : BilinearAlgorithm K n 2 m r) : (n + 2) * m + (n - 3) ≤ r := by
  obtain ⟨d, rfl⟩ : ∃ d, n = d + 1 := ⟨n - 1, by omega⟩
  obtain ⟨r', hr', alg', h1, h2⟩ := exists_normalized alg
  have := core alg' h1 h2 (h13 _ _) (by omega) hnm
  omega

/-- **Yang v3, Theorem 2, from Lemma 13 (single algorithm).** -/
theorem yang_theorem_two_algorithm_of_lemma13
    (h13 : ∀ (L : Type u) [Field L] (U Q : Type u) [AddCommGroup U] [Module L U]
      [AddCommGroup Q] [Module L Q], Lemma13Statement L U Q)
    (K : Type u) [Field K] (n m : ℕ) (hn : 4 ≤ n) (hnm : n ≤ m) {r : ℕ}
    (alg : BilinearAlgorithm K n 2 m r) : (n + 2) * m + (n - 3) ≤ r :=
  main_algClosed (K := AlgebraicClosure K) n hn hnm (h13 (AlgebraicClosure K))
    (alg.baseChange (AlgebraicClosure K))

/-- **Yang v3, Theorem 2, from Lemma 13.** The hypothesis `h13` is the statement of Lemma 13
(prose Section 6) for every field and all spaces in universe `u`; the conclusion is the
statement of `yang_theorem_two` (Statements.lean), word for word. -/
theorem yang_theorem_two_of_lemma13
    (h13 : ∀ (L : Type u) [Field L] (U Q : Type u) [AddCommGroup U] [Module L U]
      [AddCommGroup Q] [Module L Q], Lemma13Statement L U Q)
    (K : Type u) [Field K] (n m : ℕ) (hn : 4 ≤ n) (hnm : n ≤ m) :
    (n + 2) * m + (n - 3) ≤ tensorRank K n 2 m := by
  rw [le_tensorRank_iff]
  intro r alg
  exact yang_theorem_two_algorithm_of_lemma13 h13 K n m hn hnm alg

end Conclusion

end YangN4Haupt
end YangBounds
