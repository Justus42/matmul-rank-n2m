import YangBounds.SatzF444

/-!
# The transposed decomposition at the same point: hypothesis (B3′) of Satz F for `⟨4,2,4⟩`

Task S2-44 (stage 2, round 10, track A, role: formaliser). Status of every statement in this
file: `behauptet` (until a statement check per protocol Section 5.1 item 3).

Sources: prose `lean/prosa/s2_444_spurA_r6.md` (task S2-24), Section 4, (B3), and the repair R-T
of the report `lean/prosa/s2_444_bericht_s2-41.md` (the case (5,8) of the transposed
decomposition from Satz A and Satz B). Lean basis: `SatzF444.lean` (task S2-34), where
`TransponiertEng alg` (B3′) is a named hypothesis.

## The transposed decomposition at the same point

For a decomposition `(α_t, β_t, C_t)` of `⟨n,2,m⟩` let `M = [[0, 1], [-1, 0]]`. Then

  `transp alg = (X ↦ β_t(M Xᵀ), Y ↦ α_t(Yᵀ M⁻¹), C_tᵀ)`

is a decomposition of `⟨m,2,n⟩` of the same length (`transp`). The matrix `M` (a change of basis
in the inner dimension `2`) makes the transposition act **at the same point**: at the normal
form point `p = e₀`, the vectors of `transp alg` are `a′_t = -b_t` and `b′_t = a_t`, hence
`Ψ′(u, w) = -Ψ(w, u)` (prose (B3): `a′_t(p) = -b_t(Jp)`, `b′_t(p) = a_t(Jp)`; here the factor
`J` is absorbed into `M`).

To be a normal form again, `transp alg` needs (N1) and (N2) for the transposed data. These are
two conditions on `alg` that are **not** consequences of (N1) and (N2) of `alg`:

* `TransN1 alg`: every `b_t ≠ 0` (then over an infinite field there is `w₀` with `b_t·w₀ ≠ 0`
  for all `t`, and a change of basis `R` with `R e₀ = w₀` gives (N1));
* `TransN2 alg`: for every `4 × 2` matrix `X ≠ 0`, `u ↦ ((b_t·u) α_t(X))_t` is injective
  ((N2) of the transposed decomposition).

`transNF alg R hR := changeBasis (transp alg) R 1` is the transposed normal form. Under (N1) of
`alg`, `TransN1`, `TransN2` and non-symmetry it satisfies (N1), (N2) and is not symmetric
(`transNF_SN1`, `transNF_SN2`, `transNF_nichtSymm`). The case (5,8) follows from Satz B
(`Endsatz444.fall58_of_nichtSymmetrisch`: rk L′ = 5 is not used separately; Satz B gives
(3,6) or (5,8), and (3,6) is symmetric; this is the repair R-T in the form available in Lean).
`LemmaP444.nur_unterfallB'` then puts it into sub-case B, and its tight pair is the pair
`(w₀, R u₁)` of (B3′) (`transponiertEng_of`).

## Is the transposed generic normal form again a generic normal form?

No, not literally. `genAlgL alg = changeBasis (alg_L) S T` changes the rows of the `A`-side (by
the generic `S`) and the inner dimension (by the generic `T`), but not the columns of the
`B`-side. Transposing exchanges the roles: the rows of the new `A`-side are the columns of the
old `B`-side, which are **not** generic. So `transp (genAlgL alg)` is a change of basis of
`transp alg` with the identity on its `A`-rows, the inner matrix `M T⁻ᵀ M⁻¹`-type change and
`Sᵀ` on its `B`-columns; it is not of the form `genAlgL (transp alg)`, and its (N1) can fail
(`b_t·e₀ = 0` is possible). This is why the outer change of basis `R` is needed.

What does transfer is the point: the inner point of `genAlgL alg` on the `B`-side is
`v = T⁻¹ e₁ ∝ M p` with the generic `p = (T₀₀, T₀₁)` (`Mrot_prowL`). Therefore

* `TransN2 (genAlgL alg)` is `genInjL` of the bridge applied to `transp alg` (`transN2_genAlgL`),
* `TransN1 (genAlgL alg)` follows from `β_t ≠ 0` (length 25, via `transp` and
  `alpha_ne_zero_of_length_25`) and `beta_eq_zero_of_vT` (`transN1_genAlgL`).

## Main results

* `transponiertEng_of`: (B3′) `TransponiertEng alg` at a single normal form over an
  algebraically closed field, from (N1), (N2), non-symmetry, `TransN1` and `TransN2`.
* `transponiertEng_genAlgL`: (B3′) for the normal form `genAlgL alg` of the bridge, for every
  decomposition of length 25 over every field, **without hypothesis**.
* `keine_zerlegung_25_of_vielePunkte`, `rank_four_two_four_ge_26_of_vielePunkte`:
  `26 ≤ tensorRank K 4 2 4` over every field `K`, assuming only (Z′) `VielePunkte (genAlgL alg) 11`
  for the decompositions of length 25 over `K`.
* `rank_four_two_four_ge_26_of_hyp'`: the same in the shape of
  `SatzF444.rank_four_two_four_ge_26_of_hyp`, with (B3′) removed: the hypothesis is (Z′) for
  every normal form in the case (5,8), not symmetric, with `TransN1` and `TransN2`.

## Remaining named hypothesis

* (Z′) `VielePunkte _ 11` (Lemma Z of the prose). Not touched here.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace Transponiert444

open Module Matrix YangN4Haupt SatzE444 SatzE444Buendel SatzF444
open YangN3Teil2 (outer outer_apply basisVec changeBasis changeBasis_alpha_apply
  changeBasis_beta_apply mul_unitMatrix_mul linearForm_eq_zero_of_unitMatrix outer_basisVec
  outer_smul_left)

universe u v

/-! ## The transposed decomposition -/

section Trans

variable {K : Type u} [Field K]

/-- `M = [[0, 1], [-1, 0]]`. -/
def Mrot : Matrix (Fin 2) (Fin 2) K := !![0, 1; -1, 0]

/-- `M⁻¹ = [[0, -1], [1, 0]]`. -/
def Mrot' : Matrix (Fin 2) (Fin 2) K := !![0, -1; 1, 0]

theorem Mrot'_mul_Mrot : (Mrot' : Matrix (Fin 2) (Fin 2) K) * Mrot = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Mrot, Mrot', Matrix.mul_apply, Fin.sum_univ_two]

theorem Mrot_mul_Mrot' : (Mrot : Matrix (Fin 2) (Fin 2) K) * Mrot' = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Mrot, Mrot', Matrix.mul_apply, Fin.sum_univ_two]

/-- `X ↦ M Xᵀ`. -/
def trA {n : ℕ} : Matrix (Fin n) (Fin 2) K →ₗ[K] Matrix (Fin 2) (Fin n) K where
  toFun X := Mrot * Xᵀ
  map_add' X Y := by rw [Matrix.transpose_add, Matrix.mul_add]
  map_smul' c X := by rw [Matrix.transpose_smul, Matrix.mul_smul]; rfl

/-- `Y ↦ Yᵀ M⁻¹`. -/
def trB {n : ℕ} : Matrix (Fin 2) (Fin n) K →ₗ[K] Matrix (Fin n) (Fin 2) K where
  toFun Y := Yᵀ * Mrot'
  map_add' X Y := by rw [Matrix.transpose_add, Matrix.add_mul]
  map_smul' c X := by rw [Matrix.transpose_smul, Matrix.smul_mul]; rfl

/-- **The transposed decomposition** `(β_t(M Xᵀ), α_t(Yᵀ M⁻¹), C_tᵀ)` of `⟨m,2,n⟩`. -/
def transp {n m r : ℕ} (alg : BilinearAlgorithm K n 2 m r) : BilinearAlgorithm K m 2 n r where
  alpha t := (alg.beta t).comp trA
  beta t := (alg.alpha t).comp trB
  coeff t := (alg.coeff t)ᵀ
  correct X Y := by
    have h := alg.correct (Yᵀ * Mrot') (Mrot * Xᵀ)
    have e : (Yᵀ * Mrot') * (Mrot * Xᵀ) = (X * Y)ᵀ := by
      rw [Matrix.mul_assoc, ← Matrix.mul_assoc Mrot', Mrot'_mul_Mrot, Matrix.one_mul,
        Matrix.transpose_mul]
    rw [e] at h
    have h2 := congrArg Matrix.transpose h
    rw [Matrix.transpose_transpose] at h2
    rw [h2, Matrix.transpose_sum]
    refine Finset.sum_congr rfl fun t _ => ?_
    rw [Matrix.transpose_smul]
    exact congrArg (· • (alg.coeff t)ᵀ) (mul_comm _ _)

@[simp] theorem transp_alpha_apply {n m r : ℕ} (alg : BilinearAlgorithm K n 2 m r) (t : Fin r)
    (X : Matrix (Fin m) (Fin 2) K) : (transp alg).alpha t X = alg.beta t (Mrot * Xᵀ) := rfl

@[simp] theorem transp_beta_apply {n m r : ℕ} (alg : BilinearAlgorithm K n 2 m r) (t : Fin r)
    (Y : Matrix (Fin 2) (Fin n) K) : (transp alg).beta t Y = alg.alpha t (Yᵀ * Mrot') := rfl

/-- `M (u pᵀ)ᵀ = (M p) uᵀ`. -/
theorem Mrot_outer {n : ℕ} (u : Fin n → K) (p : Fin 2 → K) :
    Mrot * (outer u p)ᵀ = outer (Mrot *ᵥ p) u := by
  ext i j
  simp only [Matrix.mul_apply, Matrix.transpose_apply, outer_apply, Matrix.mulVec, dotProduct,
    Fin.sum_univ_two, Finset.sum_mul]
  ring

/-- A decomposition of `⟨4,2,4⟩` of length 25 has no zero form `β_t` (apply
`alpha_ne_zero_of_length_25` to the transposed decomposition). -/
theorem beta_ne_zero_of_length_25 (alg : BilinearAlgorithm K 4 2 4 25) (t : Fin 25) :
    alg.beta t ≠ 0 := by
  intro h
  apply SatzC444.alpha_ne_zero_of_length_25 (transp alg) t
  refine LinearMap.ext fun X => ?_
  rw [transp_alpha_apply, h]
  rfl

/-! ### Base change commutes with the transposition -/

theorem Mrot_map (L : Type v) [Field L] [Algebra K L] :
    (Mrot : Matrix (Fin 2) (Fin 2) K).map (algebraMap K L) = Mrot := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Mrot]

theorem Mrot'_map (L : Type v) [Field L] [Algebra K L] :
    (Mrot' : Matrix (Fin 2) (Fin 2) K).map (algebraMap K L) = Mrot' := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Mrot']

theorem unitMatrix_map' (L : Type v) [Field L] [Algebra K L] {a b : ℕ} (i : Fin a) (j : Fin b) :
    (unitMatrix i j : Matrix (Fin a) (Fin b) K).map (algebraMap K L) = unitMatrix i j := by
  ext x y
  simp only [Matrix.map_apply, unitMatrix, Matrix.of_apply]
  split_ifs <;> simp

theorem transp_baseChange_alpha (L : Type v) [Field L] [Algebra K L] {n m r : ℕ}
    (alg : BilinearAlgorithm K n 2 m r) (t : Fin r) (X : Matrix (Fin m) (Fin 2) L) :
    ((transp alg).baseChange L).alpha t X = (alg.baseChange L).beta t (Mrot * Xᵀ) := by
  have h : ((transp alg).baseChange L).alpha t - ((alg.baseChange L).beta t).comp trA = 0 := by
    apply linearForm_eq_zero_of_unitMatrix
    intro i j
    rw [LinearMap.sub_apply, LinearMap.comp_apply, sub_eq_zero, ← unitMatrix_map' (K := K) L,
      BilinearAlgorithm.baseChange_alpha_map, transp_alpha_apply]
    show _ = (alg.baseChange L).beta t ((Mrot : Matrix (Fin 2) (Fin 2) L) * ((unitMatrix i j).map (algebraMap K L))ᵀ)
    rw [← Mrot_map (K := K) L, ← Matrix.transpose_map, ← Matrix.map_mul,
      BilinearAlgorithm.baseChange_beta_map]
  have h2 := LinearMap.congr_fun h X
  rw [LinearMap.sub_apply, LinearMap.zero_apply, sub_eq_zero] at h2
  exact h2

theorem transp_baseChange_beta (L : Type v) [Field L] [Algebra K L] {n m r : ℕ}
    (alg : BilinearAlgorithm K n 2 m r) (t : Fin r) (Y : Matrix (Fin 2) (Fin n) L) :
    ((transp alg).baseChange L).beta t Y = (alg.baseChange L).alpha t (Yᵀ * Mrot') := by
  have h : ((transp alg).baseChange L).beta t - ((alg.baseChange L).alpha t).comp trB = 0 := by
    apply linearForm_eq_zero_of_unitMatrix
    intro i j
    rw [LinearMap.sub_apply, LinearMap.comp_apply, sub_eq_zero, ← unitMatrix_map' (K := K) L,
      BilinearAlgorithm.baseChange_beta_map, transp_beta_apply]
    show _ = (alg.baseChange L).alpha t (((unitMatrix i j).map (algebraMap K L))ᵀ * (Mrot' : Matrix (Fin 2) (Fin 2) L))
    rw [← Mrot'_map (K := K) L, ← Matrix.transpose_map, ← Matrix.map_mul,
      BilinearAlgorithm.baseChange_alpha_map]
  have h2 := LinearMap.congr_fun h Y
  rw [LinearMap.sub_apply, LinearMap.zero_apply, sub_eq_zero] at h2
  exact h2

end Trans

/-! ## The transposed normal form at a single normal form -/

section Normalform

variable {L : Type u} [Field L] {r : ℕ} (alg : BilinearAlgorithm L 4 2 4 r)

/-- **(N1) of the transposed decomposition** (up to an outer change of basis): no `b_t` is
zero. -/
def TransN1 : Prop := ∀ t, bvecs alg t ≠ 0

/-- **(N2) of the transposed decomposition**: for every `4 × 2` matrix `X ≠ 0` the map
`u ↦ ((b_t·u) α_t(X))_t` is injective. -/
def TransN2 : Prop :=
  ∀ X : Matrix (Fin 4) (Fin 2) L, X ≠ 0 → ∀ u : Fin 4 → L,
    (∀ t, (bvecs alg t ⬝ᵥ u) * alg.alpha t X = 0) → u = 0

/-- Over an infinite field there is `w₀` with `w₀ 0 ≠ 0` and `b_t·w₀ ≠ 0` for all `t`. -/
theorem exists_w0 [Infinite L] (h : TransN1 alg) :
    ∃ w0 : Fin 4 → L, w0 0 ≠ 0 ∧ ∀ t, bvecs alg t ⬝ᵥ w0 ≠ 0 := by
  classical
  let lin : (Fin 4 → L) → MvPolynomial (Fin 4) L := fun b =>
    ∑ i, MvPolynomial.C (b i) * MvPolynomial.X i
  have hev : ∀ b x, MvPolynomial.eval x (lin b) = b ⬝ᵥ x := by
    intro b x
    simp [lin, dotProduct]
  have hlin : ∀ b : Fin 4 → L, b ≠ 0 → lin b ≠ 0 := by
    intro b hb h0
    apply hb
    funext i
    have := hev b (Pi.single i 1)
    rw [h0, map_zero, dotProduct_single, mul_one] at this
    exact this.symm
  let P : MvPolynomial (Fin 4) L := MvPolynomial.X 0 * ∏ t, lin (bvecs alg t)
  have hP : P ≠ 0 := mul_ne_zero (MvPolynomial.X_ne_zero _)
    (Finset.prod_ne_zero_iff.mpr fun t _ => hlin _ (h t))
  obtain ⟨x, hx⟩ : ∃ x, MvPolynomial.eval x P ≠ 0 := by
    by_contra! hne
    exact hP (MvPolynomial.funext fun x => by rw [hne x, map_zero])
  simp only [P, map_mul, map_prod, MvPolynomial.eval_X] at hx
  refine ⟨x, left_ne_zero_of_mul hx, fun t => ?_⟩
  have h2 := right_ne_zero_of_mul hx
  rw [Finset.prod_ne_zero_iff] at h2
  rw [← hev]
  exact h2 t (Finset.mem_univ _)

/-- The change of basis with column `0` equal to `w₀` and the other columns `e_j`. -/
def Rmat (w0 : Fin 4 → L) : Matrix (Fin 4) (Fin 4) L :=
  Matrix.of fun i j => if j = 0 then w0 i else if i = j then 1 else 0

theorem det_Rmat (w0 : Fin 4 → L) : (Rmat w0).det = w0 0 := by
  rw [Matrix.det_of_lowerTriangular]
  · simp [Rmat, Fin.prod_univ_four]
  · intro i j hij
    rw [OrderDual.toDual_lt_toDual] at hij
    have hj : j ≠ 0 := (lt_of_le_of_lt (Fin.zero_le _) hij).ne'
    simp [Rmat, hj, hij.ne]

theorem Rmat_col0 (w0 : Fin 4 → L) : (fun x => Rmat w0 x 0) = w0 := by
  funext x
  simp [Rmat]

theorem Rmat_single (w0 : Fin 4 → L) : Rmat w0 *ᵥ Pi.single 0 1 = w0 := by
  funext i
  rw [Matrix.mulVec, dotProduct_single, mul_one]
  simp [Rmat]

/-- **The transposed normal form** `changeBasis (transp alg) R 1`. -/
noncomputable def transNF (R : Matrix (Fin 4) (Fin 4) L) (hR : IsUnit R.det) :
    BilinearAlgorithm L 4 2 4 r :=
  changeBasis (transp alg) R 1 hR (by rw [Matrix.det_one]; exact isUnit_one)

variable (R : Matrix (Fin 4) (Fin 4) L) (hR : IsUnit R.det)

/-- `a′_t = -Rᵀ b_t`. -/
theorem transNF_avecs (t : Fin r) (i : Fin 4) :
    SatzB444.avecs (transNF alg R hR) t i = -(bvecs alg t ⬝ᵥ fun x => R x i) := by
  show alg.beta t ((Mrot : Matrix (Fin 2) (Fin 2) L) * (R * unitMatrix i 0 * 1)ᵀ) = _
  rw [mul_unitMatrix_mul, Mrot_outer]
  have e : outer ((Mrot : Matrix (Fin 2) (Fin 2) L) *ᵥ fun y => (1 : Matrix (Fin 2) (Fin 2) L) 0 y)
      (fun x => R x i) =
      -(emb fun x => R x i) := by
    ext a b
    fin_cases a <;>
      simp [Mrot, Matrix.mulVec, dotProduct, Fin.sum_univ_two, outer_apply, Matrix.one_apply,
        emb_apply_zero, emb_apply_one]
  rw [e, map_neg, beta_emb]

theorem transNF_avecs_dot (t : Fin r) (u : Fin 4 → L) :
    ∑ i, u i * SatzB444.avecs (transNF alg R hR) t i = -(bvecs alg t ⬝ᵥ (R *ᵥ u)) := by
  simp only [transNF_avecs, dotProduct, Matrix.mulVec, Finset.mul_sum, mul_neg,
    Finset.sum_neg_distrib, neg_inj]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun i _ => by ring

/-- `b′_t = a_t`. -/
theorem transNF_beta_emb (t : Fin r) (w : Fin 4 → L) :
    (transNF alg R hR).beta t (emb w) = SatzB444.avecs alg t ⬝ᵥ w := by
  show alg.alpha t (((1 : Matrix (Fin 2) (Fin 2) L)⁻¹ * emb w)ᵀ * Mrot') = _
  rw [inv_one, Matrix.one_mul]
  have e : (emb w)ᵀ * Mrot' = outer w (basisVec 0) := by
    ext a b
    fin_cases b <;>
      simp [Mrot', Matrix.mul_apply, Fin.sum_univ_two, emb_apply_zero, emb_apply_one,
        outer_apply, basisVec]
  rw [e, linearForm_outer_eq_sum', dotProduct]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [outer_basisVec, mul_comm]
  rfl

/-- `Ψ′(u, w) = -Ψ(w, R u)`. -/
theorem psi_transNF (u w : Fin 4 → L) :
    psi (transNF alg R hR) u w = -(psi alg w (R *ᵥ u)) := by
  funext t
  rw [psi_apply_apply, transNF_beta_emb, transNF_avecs_dot, Pi.neg_apply, psi_dot]
  ring

/-- (N1) of the transposed normal form. -/
theorem transNF_SN1 (w0 : Fin 4 → L) (hw : ∀ t, bvecs alg t ⬝ᵥ w0 ≠ 0)
    (hR0 : IsUnit (Rmat w0).det) : SN1 (d := 3) (transNF alg (Rmat w0) hR0) := by
  intro t
  show SatzB444.avecs (transNF alg (Rmat w0) hR0) t 0 ≠ 0
  rw [transNF_avecs, neg_ne_zero, Rmat_col0]
  exact hw t

/-- (N2) of the transposed normal form. -/
theorem transNF_SN2 (hT2 : TransN2 alg) : SN2 (d := 3) (transNF alg R hR) := by
  intro v hv
  rw [Fintype.linearIndependent_iff]
  intro g hg
  have hX : vᵀ * Mrot' ≠ 0 := by
    intro h0
    apply hv
    have h1 := congrArg (· * Mrot) h0
    simp only [Matrix.mul_assoc, Mrot'_mul_Mrot, Matrix.mul_one, Matrix.zero_mul] at h1
    exact Matrix.transpose_eq_zero.mp h1
  have hRg : R *ᵥ g = 0 := by
    apply hT2 _ hX
    intro t
    have hk := congrFun hg t
    simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply,
      fv_apply_apply] at hk
    have h3 : (∑ i, g i * SatzB444.avecs (transNF alg R hR) t i) *
        (transNF alg R hR).beta t v = 0 := by
      rw [Finset.sum_mul, ← hk]
      refine Finset.sum_congr rfl fun i _ => ?_
      simp only [SatzB444.avecs, eA]
      ring
    rw [transNF_avecs_dot] at h3
    have hb : (transNF alg R hR).beta t v = alg.alpha t (vᵀ * Mrot') := by
      show alg.alpha t (((1 : Matrix (Fin 2) (Fin 2) L)⁻¹ * v)ᵀ * Mrot') = _
      rw [inv_one, Matrix.one_mul]
    rw [hb, neg_mul, neg_eq_zero] at h3
    exact h3
  have hg0 : g = 0 := by
    have h4 := congrArg (fun y => R⁻¹ *ᵥ y) hRg
    simpa [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul _ hR] using h4
  intro i
  simp [hg0]

/-- The transposed normal form is not symmetric if `alg` is not (with (N1) of `alg`). -/
theorem transNF_nichtSymm (h1 : SN1 (d := 3) alg) (hns : NichtSymmetrisch alg) :
    NichtSymmetrisch (transNF alg R hR) := by
  rintro ⟨e, μ, he⟩
  apply hns
  have key : ∀ t y, SatzB444.avecs alg t ⬝ᵥ (e y) = -(μ t) * (bvecs alg t ⬝ᵥ (R *ᵥ y)) := by
    intro t y
    have h := he t y
    rw [transNF_beta_emb, transNF_avecs_dot] at h
    rw [h]
    ring
  have hμ : ∀ t, μ t ≠ 0 := by
    intro t h0
    have h := key t (e.symm (Pi.single 0 1))
    rw [LinearEquiv.apply_symm_apply, h0, neg_zero, zero_mul, dotProduct_single, mul_one] at h
    exact SatzB444.avecs_zero_ne alg h1 t h
  let eR : (Fin 4 → L) ≃ₗ[L] (Fin 4 → L) :=
    Matrix.toLinearEquiv' R (Matrix.invertibleOfIsUnitDet R hR)
  refine ⟨e.symm.trans eR, fun t => -(μ t)⁻¹, fun t y => ?_⟩
  have hk := key t (e.symm y)
  rw [LinearEquiv.apply_symm_apply] at hk
  have hey : (e.symm.trans eR) y = R *ᵥ (e.symm y) := rfl
  have hsum : ∑ i, y i * SatzB444.avecs alg t i = SatzB444.avecs alg t ⬝ᵥ y := by
    rw [dotProduct]
    exact Finset.sum_congr rfl fun i _ => mul_comm _ _
  rw [hey, beta_emb, hsum, hk]
  have := hμ t
  field_simp

end Normalform

/-! ## The tight pair of sub-case B -/

section Eng

variable {L : Type u} [Field L] {r : ℕ} (alg : BilinearAlgorithm L 4 2 4 r)

/-- **(B0) of the prose as a tight pair** (taken from the proof of
`SatzF444.kubik_of_unterfallB`): in sub-case B there is `u₁ ∉ L e₀` such that `Ψ(e₀, ·)` and
`Ψ(u₁, ·)` take values in a space of dimension `≤ 5`. -/
theorem eng_of_unterfallB (hB : UnterfallB alg) :
    ∃ u1 : Fin 4 → L, (∀ c : L, u1 ≠ c • (Pi.single 0 1 : Fin 4 → L)) ∧
      ∃ P : Submodule L (Fin r → L), finrank L P ≤ 5 ∧
        ∀ w, psi alg (Pi.single 0 1 : Fin 4 → L) w ∈ P ∧ psi alg u1 w ∈ P := by
  classical
  obtain ⟨-, γs, hγ0, -, hrk, -⟩ := hB
  obtain ⟨q, -, hq⟩ := LemmaP444.exists_eq_span_of_finrank_one _ hrk
  obtain ⟨q', rfl⟩ := Submodule.Quotient.mk_surjective _ q
  let u1 : Fin 4 → L := Fin.cons 0 γs
  let P : Submodule L (Fin r → L) := J (d := 3) alg ⊔ L ∙ q'
  have hP : finrank L P ≤ 5 := by
    have hJ : finrank L (J (d := 3) alg) ≤ 4 := by
      have := LinearMap.finrank_range_le (φ (d := 3) alg 0)
      rwa [Module.finrank_fin_fun] at this
    have hs : finrank L (L ∙ q') ≤ 1 := by
      have := finrank_span_le_card (R := L) ({q'} : Set (Fin r → L))
      simpa using this
    have := Submodule.finrank_add_le_finrank_add_finrank (J (d := 3) alg) (L ∙ q')
    show finrank L (J (d := 3) alg ⊔ L ∙ q' : Submodule L (Fin r → L)) ≤ 5
    omega
  have hpsi1 : ∀ y, π (d := 3) alg (psi alg u1 y) = Fc alg γs y := by
    intro y
    rw [psi_apply, Fin.sum_univ_succ]
    simp only [u1, Fin.cons_zero, Fin.cons_succ, zero_smul, zero_add, map_sum, map_smul]
    rw [Fc_eq, LinearMap.sum_apply]
    rfl
  refine ⟨u1, fun c hc => ?_, P, hP, fun w => ⟨?_, ?_⟩⟩
  · apply hγ0
    funext i
    have := congrFun hc i.succ
    simpa [u1, Pi.single_apply, Fin.succ_ne_zero] using this
  · rw [psi_single]
    exact Submodule.mem_sup_left ⟨w, rfl⟩
  · have hmem : Fc alg γs w ∈ L ∙ Submodule.Quotient.mk q' := by
      rw [← hq]
      exact LinearMap.mem_range_self _ _
    obtain ⟨a, ha⟩ := Submodule.mem_span_singleton.1 hmem
    have hJ : psi alg u1 w - a • q' ∈ J (d := 3) alg := by
      rw [← π_eq_zero_iff, map_sub, hpsi1, map_smul, ← ha]
      simp [π]
    have : psi alg u1 w = (psi alg u1 w - a • q') + a • q' := by abel
    rw [this]
    exact Submodule.add_mem _ (Submodule.mem_sup_left hJ)
      (Submodule.mem_sup_right (Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)))

end Eng

/-! ## (B3′) at a single normal form -/

/-- **(B3′) at a single normal form** (prose (B3) with repair R-T): over an algebraically closed
field, a normal form of length 25 with (N1), (N2), not symmetric, and with the (N1), (N2) of the
transposed decomposition (`TransN1`, `TransN2`) satisfies `TransponiertEng`. -/
theorem transponiertEng_of {L : Type u} [Field L] [IsAlgClosed L]
    (alg : BilinearAlgorithm L 4 2 4 25) (h1 : SN1 (d := 3) alg) (hns : NichtSymmetrisch alg)
    (hT1 : TransN1 alg) (hT2 : TransN2 alg) : TransponiertEng alg := by
  classical
  obtain ⟨w0, hw00, hw0⟩ := exists_w0 alg hT1
  have hR : IsUnit (Rmat w0).det := by
    rw [det_Rmat]
    exact isUnit_iff_ne_zero.mpr hw00
  have hB1 := transNF_SN1 alg w0 hw0 hR
  have hB2 := transNF_SN2 alg (Rmat w0) hR hT2
  have hBns := transNF_nichtSymm alg (Rmat w0) hR h1 hns
  have hcase := Endsatz444.fall58_of_nichtSymmetrisch _ hB1 hB2 hBns
  have hUB := LemmaP444.nur_unterfallB' _ hB1 hB2 hcase hBns
  obtain ⟨u1, hu1, P, hP, hmem⟩ := eng_of_unterfallB _ hUB
  have hRinj : Function.Injective fun y => Rmat w0 *ᵥ y := by
    intro x y hxy
    have h := congrArg (fun z => (Rmat w0)⁻¹ *ᵥ z) hxy
    simpa [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul _ hR] using h
  refine ⟨w0, Rmat w0 *ᵥ u1, fun h => hw00 (by rw [h, Pi.zero_apply]), hw0, fun c hc => hu1 c ?_,
    P, hP, fun u => ⟨?_, ?_⟩⟩
  · apply hRinj
    show Rmat w0 *ᵥ u1 = Rmat w0 *ᵥ (c • (Pi.single 0 1 : Fin 4 → L))
    rw [hc, Matrix.mulVec_smul, Rmat_single]
  · have h := P.neg_mem (hmem u).1
    rwa [psi_transNF, Rmat_single, neg_neg] at h
  · have h := P.neg_mem (hmem u).2
    rwa [psi_transNF, neg_neg] at h

/-! ## The generic normal form of the bridge -/

section Generic

open Bruecke444 SatzC444

variable {K : Type u} [Field K]

theorem single_eq_basisVec {F : Type u} [Field F] (i : Fin 4) :
    (Pi.single i 1 : Fin 4 → F) = basisVec i := by
  funext j
  simp [Pi.single_apply, basisVec, eq_comm]

/-- **`TransN1` for the generic normal form** (every decomposition of length 25). -/
theorem transN1_genAlgL (alg : BilinearAlgorithm K 4 2 4 25) : TransN1 (genAlgL alg) := by
  intro t ht
  apply beta_ne_zero_of_length_25 alg t
  apply beta_eq_zero_of_vT alg t
  intro z
  rw [← genAlg_beta_emb, form_emb_expand]
  refine Finset.sum_eq_zero fun j _ => ?_
  have h := congrFun ht j
  simp only [bvecs, Pi.zero_apply, single_eq_basisVec, beta_genAlgL_emb] at h
  rw [(map_eq_zero_iff _ (ι_injective K)).mp h, mul_zero]

/-- `v = T⁻¹ e₁` over `GBar K`. -/
noncomputable def vTL : Fin 2 → GBar K := fun i => (TgL K)⁻¹ i 1

theorem vTL_eq (i : Fin 2) : vTL (K := K) i = ι K (vT K i) := by
  simp only [vTL, TgL_inv, Matrix.map_apply, vT]

theorem TgL_inv_mul_emb (u : Fin 4 → GBar K) : (TgL K)⁻¹ * emb u = outer (vTL (K := K)) u := by
  ext i k
  simp [Matrix.mul_apply, Fin.sum_univ_two, emb_apply_zero, emb_apply_one, vTL, outer_apply]

/-- `M p = -(det T) v`: the inner point of the `B`-side is the image of the generic point. -/
theorem Mrot_prowL :
    (Mrot : Matrix (Fin 2) (Fin 2) (GBar K)) *ᵥ (prowL : Fin 2 → GBar K) =
      (-(ι K (Tg K).det)) • (vTL : Fin 2 → GBar K) := by
  have hd := det_Tg_ne_zero K
  funext i
  rw [Pi.smul_apply, smul_eq_mul, vTL_eq]
  fin_cases i
  · rw [show ((⟨0, by norm_num⟩ : Fin 2)) = 0 from rfl, vT_zero]
    simp only [Mrot, Matrix.mulVec, dotProduct, Fin.sum_univ_two, prowL, prow]
    simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one, zero_mul, one_mul, zero_add]
    rw [← map_neg, ← map_mul]
    congr 1
    field_simp
  · rw [show ((⟨1, by norm_num⟩ : Fin 2)) = 1 from rfl, vT_one]
    simp only [Mrot, Matrix.mulVec, dotProduct, Fin.sum_univ_two, prowL, prow]
    simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one, zero_mul, neg_mul, one_mul,
      add_zero]
    rw [← map_neg, ← map_neg, ← map_mul]
    congr 1
    field_simp

/-- **`TransN2` for the generic normal form** (every length): `genInjL` of the bridge applied to
the transposed decomposition. -/
theorem transN2_genAlgL {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r) : TransN2 (genAlgL alg) := by
  intro X hX u hu
  have hS := isUnit_det_SgL K
  have hT := isUnit_det_TgL K
  have hX' : SgL K * X * TgL K ≠ 0 := by
    intro h0
    apply hX
    calc X = (SgL K)⁻¹ * (SgL K * X * TgL K) * (TgL K)⁻¹ := by
          rw [Matrix.mul_assoc (SgL K) X, Matrix.nonsing_inv_mul_cancel_left _ _ hS,
            Matrix.mul_assoc X, Matrix.mul_nonsing_inv _ hT, Matrix.mul_one]
      _ = 0 := by rw [h0, Matrix.mul_zero, Matrix.zero_mul]
  have hw : (SgL K * X * TgL K * (Mrot : Matrix (Fin 2) (Fin 2) (GBar K)))ᵀ ≠ 0 := by
    intro h0
    apply hX'
    have h1 : SgL K * X * TgL K * (Mrot : Matrix (Fin 2) (Fin 2) (GBar K)) = 0 :=
      Matrix.transpose_eq_zero.mp h0
    calc SgL K * X * TgL K = SgL K * X * TgL K * (Mrot : Matrix (Fin 2) (Fin 2) (GBar K)) *
          (Mrot' : Matrix (Fin 2) (Fin 2) (GBar K)) := by
          rw [Matrix.mul_assoc _ (Mrot : Matrix (Fin 2) (Fin 2) (GBar K)), Mrot_mul_Mrot', Matrix.mul_one]
      _ = 0 := by rw [h1, Matrix.zero_mul]
  apply genInjL (transp alg) _ hw
  rw [map_zero]
  funext k
  rw [lmap_apply, transp_baseChange_alpha, transp_baseChange_beta, Pi.zero_apply,
    Matrix.transpose_transpose, Matrix.mul_assoc _ (Mrot : Matrix (Fin 2) (Fin 2) (GBar K)), Mrot_mul_Mrot', Matrix.mul_one,
    Mrot_outer, Mrot_prowL, outer_smul_left, map_smul, smul_eq_mul, mul_assoc]
  have h := hu k
  rw [← beta_emb] at h
  change (alg.baseChange (GBar K)).beta k ((TgL K)⁻¹ * emb u) *
    (alg.baseChange (GBar K)).alpha k (SgL K * X * TgL K) = 0 at h
  rw [TgL_inv_mul_emb] at h
  rw [h, mul_zero]

/-- **(B3′) for the generic normal form of the bridge**, for every decomposition of length 25
over every field, without hypothesis. -/
theorem transponiertEng_genAlgL (alg : BilinearAlgorithm K 4 2 4 25) :
    TransponiertEng (genAlgL alg) := by
  obtain ⟨h1, -, -, hns⟩ := bruecke alg
  exact transponiertEng_of (genAlgL alg) h1 hns (transN1_genAlgL alg) (transN2_genAlgL alg)

end Generic

/-! ## The final theorem with (Z′) as the only hypothesis -/

section Endsatz

open Bruecke444

/-- **No decomposition of length 25 over `K`**, assuming only (Z′) for its generic normal form
`genAlgL alg` over `GBar K`. -/
theorem keine_zerlegung_25_of_vielePunkte {K : Type u} [Field K]
    (alg : BilinearAlgorithm K 4 2 4 25) (hZ : VielePunkte (genAlgL alg) 11) : False := by
  obtain ⟨h1, h2, hc, hns⟩ := bruecke alg
  exact fall58_ausgeschlossen (genAlgL alg) h1 h2 hc hns (transponiertEng_genAlgL alg) hZ

/-- **`R(⟨4,2,4⟩) ≥ 26` over every field `K`, assuming only (Z′)**: at least 11 pairwise
distinct points `[a_t ⊗ b_t]` at the generic normal form `genAlgL alg` of every decomposition
of length 25 over `K`. The bridge and (B3′) are discharged. -/
theorem rank_four_two_four_ge_26_of_vielePunkte (K : Type u) [Field K]
    (hZ : ∀ alg : BilinearAlgorithm K 4 2 4 25, VielePunkte (genAlgL alg) 11) :
    26 ≤ tensorRank K 4 2 4 := by
  rw [le_tensorRank_iff]
  intro r alg
  have h25 := yang_theorem_two_algorithm K 4 4 (le_refl _) (le_refl _) alg
  norm_num at h25
  by_contra hlt
  have hr : r = 25 := by omega
  subst hr
  exact keine_zerlegung_25_of_vielePunkte alg (hZ alg)

/-- **`R(⟨4,2,4⟩) ≥ 26` in the shape of `SatzF444.rank_four_two_four_ge_26_of_hyp`, with (B3′)
removed**: the only hypothesis is (Z′) for every normal form over an algebraically closed field
in the case (5,8) that is not symmetric and satisfies `TransN1` and `TransN2`. -/
theorem rank_four_two_four_ge_26_of_hyp'
    (hyp : ∀ (L : Type u) [Field L] [IsAlgClosed L] (alg : BilinearAlgorithm L 4 2 4 25),
      SN1 (d := 3) alg → SN2 (d := 3) alg →
      (finrank L (LinearMap.range (Lq (d := 3) alg)),
        finrank L (LinearMap.range (Hq (d := 3) alg))) = (5, 8) →
      NichtSymmetrisch alg → TransN1 alg → TransN2 alg → VielePunkte alg 11)
    (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 :=
  rank_four_two_four_ge_26_of_vielePunkte K fun alg => by
    obtain ⟨h1, h2, hc, hns⟩ := bruecke alg
    exact hyp _ (genAlgL alg) h1 h2 hc hns (transN1_genAlgL alg) (transN2_genAlgL alg)

end Endsatz

end Transponiert444
end YangBounds

/-! ## Axiom check (output appears in the build log) -/

#print axioms YangBounds.Transponiert444.transp
#print axioms YangBounds.Transponiert444.transNF_SN2
#print axioms YangBounds.Transponiert444.transNF_nichtSymm
#print axioms YangBounds.Transponiert444.transponiertEng_of
#print axioms YangBounds.Transponiert444.transN1_genAlgL
#print axioms YangBounds.Transponiert444.transN2_genAlgL
#print axioms YangBounds.Transponiert444.transponiertEng_genAlgL
#print axioms YangBounds.Transponiert444.keine_zerlegung_25_of_vielePunkte
#print axioms YangBounds.Transponiert444.rank_four_two_four_ge_26_of_vielePunkte
#print axioms YangBounds.Transponiert444.rank_four_two_four_ge_26_of_hyp'
