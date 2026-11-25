import YangBounds.SatzF444

/-!
# Lemma Z for `⟨4,2,4⟩` at the generic normal form (many distinct points)

Task S2-46 (stage 2, round 10, track A, role: formaliser). Status of every statement in this
file: `behauptet`. Nothing here is `geprüft` before the check of protocol section 5.1.

Sources: prose `lean/prosa/s2_444_spurA_r6.md` (task S2-24), Section 3 (Lemma K, Lemma Z), with
the repair of Lemma Z step 2 (the explicit computation instead of “the same orbit”, because
`κ_t` depends on `t`) and the repair R-K of Lemma K (polynomial identity, cancellation in
`K[p₁, p₂]`) from the reports `lean/prosa/s2_444_spurA_r6_pruefung_r9.md` and
`lean/prosa/s2_444_bericht_s2-41.md`.

## Where Lemma Z is proved

Lemma Z needs the variation of the point `p`: in step 1, `Ĵ_p = ker W` on an open set of `p`
makes the factor `κ_t(p)` constant, and in step 2 the identity `a_t(p) ⊗ b_t(p) = κ_t
a_{t₀}(p) ⊗ b_{t₀}(p)` for all `p` is fed into Lemma K. A single normal form does not see this
variation. The generic normal form `genAlg alg` over `K(S, T)` (and `genAlgL alg` over its
algebraic closure, the normal form of the bridge) does: its point is the generic point
`p = (T₀₀, T₀₁)`, so

* an identity between quadratic forms in `p` with coefficients in `K` holds at `p` if and only
  if it holds as a polynomial identity (`generisch_quad`), and
* two points `[a_t ⊗ b_t]` of different classes are already different at `p` (no finite set of
  exceptional points has to be avoided).

Step 1 at the generic point: `ker W` of the generic normal form is cut out by equations with
coefficients in `K` (`coeff t = S⁻¹ C_t`). In the case `(5, 8)` every vector of `ker W` is a
combination of the vectors `Ψ(u, y)` (`kerW_le`); if `t ∼ s` then every such vector satisfies
`x_s = κ x_t`. A vector of `ker W` with `x_t ≠ 0` descends to a vector over `K` with the same
property (`kern_abstieg`, the linear-algebra descent of `Bruecke444.descent` without the
determinant), hence `κ ∈ K` (`kappa_in_K`).

Step 2: the polynomial identity (`quadGleich_of_rel`) and Lemma K. Lemma K is **not** proved
here; it is the named hypothesis `LemmaKStatement` (task in parallel). From Lemma K: case (i) is
excluded by minimality (`mergeAlg`, a decomposition of length 25 with a zero form `α`, against
`SatzC444.alpha_ne_zero_of_length_25`); case (ii) gives the row directions of the four
`4 × 2` matrices (`paar_struktur`). Three pairwise related terms force `l₁ ∥ l₂`
(`keine_drei`), against case (ii). This is the explicit computation of the repair of step 2.

Counting: classes of size `≤ 2` among 25 terms give at least 13 pairwise unrelated terms
(`viele_klassen`).

## Main results

* `LemmaKStatement K` (named hypothesis, definition): Lemma K of the prose with R-K, over the
  field `K`, as a polynomial identity of the coefficients.
* `lemmaZ_generisch`: under `LemmaKStatement K`, for every decomposition `alg` of length 25 over
  any field `K`, the generic normal form `genAlg alg` over `K(S, T)` satisfies
  `VielePunkte (genAlg alg) 13`.
* `lemmaZ_bruecke`: the same for the normal form of the bridge, `genAlgL alg` over
  `GBar K = AlgebraicClosure K(S, T)`: `VielePunkte (genAlgL alg) 13`, hence also `11`.
* `keine_zerlegung_25_of_lemmaK`, `rank_four_two_four_ge_26_of_lemmaK`: `26 ≤ tensorRank K 4 2 4`
  over every field `K`, assuming `LemmaKStatement K` and (B3′) `TransponiertEng (genAlgL alg)`
  for every decomposition `alg` of length 25 over `K`.
* `rank_four_two_four_ge_26_of_lemmaK_transponiert`: the same with (B3′) in the form of
  `SatzF444.rank_four_two_four_ge_26_of_hyp` (every normal form in the case (5,8) over every
  algebraically closed field); (Z′) is no longer a hypothesis.

## Named hypotheses (not proved here)

* `LemmaKStatement K` (Lemma K, prose Section 3.1 with repair R-K). The part “exactly one of the
  two cases” is not included (only “one of the two cases” is used).
* `SatzF444.TransponiertEng` (B3′), unchanged from `SatzF444.lean`.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace LemmaZ444

open Module YangN4Haupt MvPolynomial Matrix SatzC444
open YangN3Teil2 (outer outer_apply basisVec linearForm_eq_zero_of_unitMatrix)

universe u v

/-! ## Lemma K as a named hypothesis -/

section LemmaK

variable {K : Type u} [Field K]

/-- `(X p) ⊗ (Y p) = (X′ p) ⊗ (Y′ p)` as an identity of quadratic forms in `p = (p₀, p₁)`
(coefficients of `p₀²`, `p₀ p₁`, `p₁²` in every entry `(i, j)`). Over every field this is the
polynomial identity in `K[p₀, p₁]` of the prose (repair R-K). -/
def QuadGleich {n : ℕ} (X Y X' Y' : Matrix (Fin n) (Fin 2) K) : Prop :=
  ∀ i j, X i 0 * Y j 0 = X' i 0 * Y' j 0 ∧
    X i 0 * Y j 1 + X i 1 * Y j 0 = X' i 0 * Y' j 1 + X' i 1 * Y' j 0 ∧
    X i 1 * Y j 1 = X' i 1 * Y' j 1

variable (K) in
/-- **Named hypothesis: Lemma K** (prose `s2_444_spurA_r6.md` Section 3.1, with repair R-K).
For `X, Y, X′, Y′ ∈ K^{n×2}`, all `≠ 0`, with `(Xp) ⊗ (Yp) = (X′p) ⊗ (Y′p)` as a polynomial
identity in `p`: (i) `X′ = c X`, `Y′ = c⁻¹ Y` with `c ≠ 0`, or (ii) `X = x l₁ᵀ`, `Y = w l₂ᵀ`,
`X′ = c x l₂ᵀ`, `Y′ = c⁻¹ w l₁ᵀ` with `x, w ≠ 0`, `c ≠ 0` and `l₁, l₂` linearly independent.
(The prose adds that the cases exclude each other; that part is not needed and not assumed.) -/
def LemmaKStatement : Prop :=
  ∀ (n : ℕ) (X Y X' Y' : Matrix (Fin n) (Fin 2) K), X ≠ 0 → Y ≠ 0 → X' ≠ 0 → Y' ≠ 0 →
    QuadGleich X Y X' Y' →
    (∃ c : K, c ≠ 0 ∧ X' = c • X ∧ Y' = c⁻¹ • Y) ∨
    (∃ (x w : Fin n → K) (l1 l2 : Fin 2 → K) (c : K), x ≠ 0 ∧ w ≠ 0 ∧ c ≠ 0 ∧
      l1 0 * l2 1 - l1 1 * l2 0 ≠ 0 ∧
      X = vecMulVec x l1 ∧ Y = vecMulVec w l2 ∧
      X' = c • vecMulVec x l2 ∧ Y' = c⁻¹ • vecMulVec w l1)

end LemmaK

/-! ## Row directions of rank-one `n × 2` matrices -/

section Zeilen

variable {K : Type u} [Field K] {n : ℕ}

/-- `M = x lᵀ` for some `x`: `l` is a row direction of `M`. -/
def Zeile (M : Matrix (Fin n) (Fin 2) K) (l : Fin 2 → K) : Prop := ∃ x : Fin n → K, M = vecMulVec x l

/-- `det (l, l') = 0`. -/
def Par (l l' : Fin 2 → K) : Prop := l 0 * l' 1 - l 1 * l' 0 = 0

theorem smul_vecMulVec (c : K) (x : Fin n → K) (l : Fin 2 → K) :
    c • vecMulVec x l = vecMulVec (c • x) l := by
  ext i j
  simp [vecMulVec_apply, mul_assoc]

theorem zeile_par {M : Matrix (Fin n) (Fin 2) K} (hM : M ≠ 0) {l l' : Fin 2 → K}
    (h : Zeile M l) (h' : Zeile M l') : Par l l' := by
  obtain ⟨x, rfl⟩ := h
  obtain ⟨x', hx'⟩ := h'
  obtain ⟨i, j, hij⟩ : ∃ i j, vecMulVec x l i j ≠ 0 := by
    by_contra hc
    push_neg at hc
    exact hM (Matrix.ext fun i j => hc i j)
  have hxi : x i ≠ 0 := fun h0 => hij (by simp [vecMulVec_apply, h0])
  have e0 := congrFun (congrFun hx' i) 0
  have e1 := congrFun (congrFun hx' i) 1
  simp only [vecMulVec_apply] at e0 e1
  have : x i * (l 0 * l' 1 - l 1 * l' 0) = 0 := by linear_combination l' 1 * e0 - l' 0 * e1
  exact (mul_eq_zero.mp this).resolve_left hxi

theorem par_symm {l l' : Fin 2 → K} (h : Par l l') : Par l' l := by
  unfold Par at *
  linear_combination -h

theorem par_trans {a b c : Fin 2 → K} (hb : b ≠ 0) (hab : Par a b) (hbc : Par b c) : Par a c := by
  unfold Par at *
  by_cases h0 : b 0 = 0
  · have h1 : b 1 ≠ 0 := by
      intro h1
      apply hb
      funext i
      fin_cases i
      · exact h0
      · exact h1
    have : b 1 * (a 0 * c 1 - a 1 * c 0) = 0 := by linear_combination c 1 * hab + a 1 * hbc
    exact (mul_eq_zero.mp this).resolve_left h1
  · have : b 0 * (a 0 * c 1 - a 1 * c 0) = 0 := by linear_combination c 0 * hab + a 0 * hbc
    exact (mul_eq_zero.mp this).resolve_left h0

theorem ne_zero_left_of_det {l1 l2 : Fin 2 → K} (h : l1 0 * l2 1 - l1 1 * l2 0 ≠ 0) : l1 ≠ 0 := by
  rintro rfl
  simp at h

theorem ne_zero_right_of_det {l1 l2 : Fin 2 → K} (h : l1 0 * l2 1 - l1 1 * l2 0 ≠ 0) :
    l2 ≠ 0 := by
  rintro rfl
  simp at h

end Zeilen

/-! ## Minimality: merging two proportional terms -/

section Merge

variable {K : Type u} [Field K] {n l m r : ℕ}

/-- **Merging** the term `s'` into the term `s` when `α_{s'} β_{s'} = c α_s β_s`: the form
`α_{s'}` becomes `0` and `C_s` becomes `C_s + c C_{s'}`. The length stays `r`. -/
noncomputable def mergeAlg (alg : BilinearAlgorithm K n l m r) (s s' : Fin r) (hss : s ≠ s')
    (c : K) (h : ∀ A B, alg.alpha s' A * alg.beta s' B = c * (alg.alpha s A * alg.beta s B)) :
    BilinearAlgorithm K n l m r where
  alpha := Function.update alg.alpha s' 0
  beta := alg.beta
  coeff := Function.update alg.coeff s (alg.coeff s + c • alg.coeff s')
  correct A B := by
    rw [alg.correct A B, ← sub_eq_zero, ← Finset.sum_sub_distrib,
      Fintype.sum_eq_add s s' hss]
    · rw [Function.update_of_ne hss, Function.update_self, Function.update_self,
        Function.update_of_ne hss.symm, h A B, LinearMap.zero_apply, zero_mul, zero_smul,
        smul_add, smul_smul]
      have e : alg.alpha s A * alg.beta s B * c = c * (alg.alpha s A * alg.beta s B) := by ring
      rw [e]
      abel
    · rintro k ⟨hk1, hk2⟩
      rw [Function.update_of_ne hk2, Function.update_of_ne hk1, sub_self]

/-- **Minimality** (prose Section 2, with B-007 through `alpha_ne_zero_of_length_25`): in a
decomposition of length 25 no two different terms have `α_{s'} β_{s'} = c α_s β_s`. -/
theorem nicht_proportional (alg : BilinearAlgorithm K 4 2 4 25) {s s' : Fin 25} (hss : s ≠ s')
    (c : K) (h : ∀ A B, alg.alpha s' A * alg.beta s' B = c * (alg.alpha s A * alg.beta s B)) :
    False :=
  alpha_ne_zero_of_length_25 (mergeAlg alg s s' hss c h) s' (by simp [mergeAlg])

/-- In a decomposition of length 25 no form `β_t` is zero. -/
theorem beta_ne_zero_of_length_25 (alg : BilinearAlgorithm K 4 2 4 25) (t : Fin 25) :
    alg.beta t ≠ 0 := by
  intro ht
  obtain ⟨s, hs⟩ : ∃ s : Fin 25, s ≠ t := ⟨t + 1, by
    intro h
    have := congrArg Fin.val h
    simp [Fin.val_add] at this
    omega⟩
  exact nicht_proportional alg hs 0 (fun A B => by simp [ht])

end Merge

/-! ## Combinatorics: classes of size at most two -/

section Klassen

/-- **Counting.** An equivalence relation on `Fin r` with classes of size `≤ 2` has a set of at
least `r / 2` pairwise unrelated elements (one per class). -/
theorem viele_klassen {r : ℕ} (R : Fin r → Fin r → Prop) (hrefl : ∀ a, R a a)
    (hsymm : ∀ a b, R a b → R b a) (htrans : ∀ a b c, R a b → R b c → R a c)
    (h3 : ∀ a b c, a ≠ b → a ≠ c → b ≠ c → R a b → R a c → R b c → False) :
    ∃ T : Finset (Fin r), r ≤ 2 * T.card ∧ ∀ s ∈ T, ∀ t ∈ T, s ≠ t → ¬ R s t := by
  classical
  let f : Fin r → Fin r := fun x =>
    (Finset.univ.filter (R x)).min' ⟨x, Finset.mem_filter.2 ⟨Finset.mem_univ _, hrefl x⟩⟩
  have hf : ∀ x, R x (f x) := fun x =>
    (Finset.mem_filter.1 (Finset.min'_mem (Finset.univ.filter (R x)) _)).2
  have hfeq : ∀ x y, R x y → f x = f y := by
    intro x y hxy
    apply le_antisymm
    · exact Finset.min'_le _ _ (Finset.mem_filter.2 ⟨Finset.mem_univ _, htrans _ _ _ hxy (hf y)⟩)
    · exact Finset.min'_le _ _
        (Finset.mem_filter.2 ⟨Finset.mem_univ _, htrans _ _ _ (hsymm _ _ hxy) (hf x)⟩)
  refine ⟨Finset.univ.image f, ?_, ?_⟩
  · have h := Finset.card_le_mul_card_image (f := f) Finset.univ 2 (by
      intro b _
      by_contra hc
      push_neg at hc
      obtain ⟨x, y, z, hx, hy, hz, hxy, hxz, hyz⟩ := Finset.two_lt_card_iff.1 hc
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hx hy hz
      have hxb : R x b := hx ▸ hf x
      have hyb : R y b := hy ▸ hf y
      have hzb : R z b := hz ▸ hf z
      exact h3 x y z hxy hxz hyz (htrans _ _ _ hxb (hsymm _ _ hyb))
        (htrans _ _ _ hxb (hsymm _ _ hzb)) (htrans _ _ _ hyb (hsymm _ _ hzb)))
    simpa using h
  · intro s hs t ht hst hR
    obtain ⟨x, -, rfl⟩ := Finset.mem_image.1 hs
    obtain ⟨y, -, rfl⟩ := Finset.mem_image.1 ht
    exact hst (hfeq x y (htrans _ _ _ (htrans _ _ _ (hf x) hR) (hsymm _ _ (hf y))))

end Klassen

/-! ## Descent of a kernel vector -/

section Abstieg

variable {K : Type u} [Field K]

/-- **Descent of a kernel vector.** If a linear system with coefficients in `K` has a solution
`x` over an extension field `E` with `x_{t₀} ≠ 0`, it has a solution `y` over `K` with
`y_{t₀} ≠ 0`. (Write `x` in a `K`-basis of the `K`-span of its coordinates.) -/
theorem kern_abstieg {E : Type v} [Field E] [Algebra K E] {ι : Type*} {r : ℕ}
    (M : ι → Fin r → K) (x : Fin r → E) (hx : ∀ i, ∑ t, algebraMap K E (M i t) * x t = 0)
    (t0 : Fin r) (hx0 : x t0 ≠ 0) :
    ∃ y : Fin r → K, (∀ i, ∑ t, M i t * y t = 0) ∧ y t0 ≠ 0 := by
  classical
  let V : Submodule K E := Submodule.span K (Set.range x)
  haveI : FiniteDimensional K V := FiniteDimensional.span_of_finite K (Set.finite_range x)
  let ω := Module.finBasis K V
  let c : Fin r → Fin (finrank K V) → K := fun t =>
    ω.repr ⟨x t, Submodule.subset_span ⟨t, rfl⟩⟩
  have hz : ∀ t, x t = ∑ k, algebraMap K E (c t k) * (ω k : E) := by
    intro t
    have h0 := ω.sum_repr ⟨x t, Submodule.subset_span ⟨t, rfl⟩⟩
    have h1 := congrArg (fun v : V => (v : E)) h0
    simp only [Submodule.coe_sum, Submodule.coe_smul, Algebra.smul_def] at h1
    exact h1.symm
  have hli : LinearIndependent K (fun k => (ω k : E)) :=
    ω.linearIndependent.map' V.subtype (Submodule.ker_subtype V)
  have hk : ∀ k i, ∑ t, M i t * c t k = 0 := by
    intro k i
    have h2 := hx i
    simp only [hz, Finset.mul_sum] at h2
    rw [Finset.sum_comm] at h2
    have hsum : ∑ k, (∑ t, M i t * c t k) • (ω k : E) = 0 := by
      rw [← h2]
      refine Finset.sum_congr rfl fun k _ => ?_
      rw [Finset.sum_smul]
      refine Finset.sum_congr rfl fun t _ => ?_
      rw [Algebra.smul_def, map_mul]
      ring
    exact Fintype.linearIndependent_iff.mp hli _ hsum k
  obtain ⟨k, hk0⟩ : ∃ k, c t0 k ≠ 0 := by
    by_contra hc
    push_neg at hc
    apply hx0
    rw [hz t0]
    simp [hc]
  exact ⟨fun t => c t k, hk k, hk0⟩

/-- **Proportionality descends** along an injective ring homomorphism. -/
theorem prop_abstieg {F : Type u} [Field F] {L : Type v} [Field L] (ι : F →+* L) {n : ℕ}
    (a b : Fin n → F) (c : L) (h : ∀ i, ι (a i) = c * ι (b i)) : ∃ c' : F, a = c' • b := by
  classical
  by_cases hb : b = 0
  · refine ⟨0, funext fun i => ?_⟩
    have := h i
    rw [hb, Pi.zero_apply, map_zero, mul_zero] at this
    rw [hb, smul_zero, Pi.zero_apply]
    exact ι.injective (this.trans (map_zero _).symm)
  · obtain ⟨i0, hi0⟩ : ∃ i, b i ≠ 0 := by
      by_contra hc
      push_neg at hc
      exact hb (funext hc)
    have hι0 : ι (b i0) ≠ 0 := (map_ne_zero ι).2 hi0
    have hc : c = ι (a i0 / b i0) := by
      rw [map_div₀, h i0, mul_div_assoc, div_self hι0, mul_one]
    refine ⟨a i0 / b i0, funext fun i => ?_⟩
    apply ι.injective
    rw [h i, hc, Pi.smul_apply, smul_eq_mul, map_mul]

end Abstieg

/-! ## The generic point: identities of quadratic forms -/

section Generisch

variable {K : Type u} [Field K]

/-- At the generic point `p = (T₀₀, T₀₁)` a quadratic form with coefficients in `K` vanishes
only if all coefficients vanish. -/
theorem generisch_quad (c0 c1 c2 : K)
    (h : algebraMap K (GField K) c0 * prow K 0 ^ 2 +
      algebraMap K (GField K) c1 * (prow K 0 * prow K 1) +
      algebraMap K (GField K) c2 * prow K 1 ^ 2 = 0) :
    c0 = 0 ∧ c1 = 0 ∧ c2 = 0 := by
  classical
  let a : Var 3 := Sum.inr (0, 0)
  let b : Var 3 := Sum.inr (0, 1)
  let Q : GPoly K := C c0 * X a ^ 2 + C c1 * (X a * X b) + C c2 * X b ^ 2
  have hQ : algebraMap (GPoly K) (GField K) Q = 0 := by
    simp only [Q, map_add, map_mul, map_pow, algebraMap_C]
    exact h
  have hQ0 : Q = 0 := poly_eq_zero_of_algebraMap K hQ
  let ev : GPoly K →+* Polynomial K :=
    eval₂Hom Polynomial.C (Sum.elim (fun _ => 0) (fun ab => if ab.2 = 0 then 1 else Polynomial.X))
  have hev : Polynomial.C c0 + Polynomial.C c1 * Polynomial.X +
      Polynomial.C c2 * Polynomial.X ^ 2 = 0 := by
    have := congrArg ev hQ0
    simpa [Q, ev, a, b] using this
  refine ⟨?_, ?_, ?_⟩
  · have := congrArg (fun P : Polynomial K => P.coeff 0) hev
    simpa [Polynomial.coeff_X, Polynomial.coeff_X_pow, Polynomial.coeff_C] using this
  · have := congrArg (fun P : Polynomial K => P.coeff 1) hev
    simpa [Polynomial.coeff_X, Polynomial.coeff_X_pow, Polynomial.coeff_C] using this
  · have := congrArg (fun P : Polynomial K => P.coeff 2) hev
    simpa [Polynomial.coeff_X, Polynomial.coeff_X_pow, Polynomial.coeff_C] using this

/-- A linear form with coefficients in `K` vanishes at the generic point only if it is zero. -/
theorem generisch_lin (c0 c1 : K)
    (h : algebraMap K (GField K) c0 * prow K 0 + algebraMap K (GField K) c1 * prow K 1 = 0) :
    c0 = 0 ∧ c1 = 0 := by
  have h' := generisch_quad c0 c1 0 (by
    rw [map_zero, zero_mul, add_zero]
    linear_combination prow K 0 * h)
  exact ⟨h'.1, h'.2.1⟩

/-- Products of two linear forms with coefficients in `K` agree at the generic point (up to a
factor `κ ∈ K`) only if they agree as polynomials: the three coefficient identities. -/
theorem generisch_produkt (a0 a1 b0 b1 a0' a1' b0' b1' κ : K)
    (h : (algebraMap K (GField K) a0' * prow K 0 + algebraMap K (GField K) a1' * prow K 1) *
        (algebraMap K (GField K) b0' * prow K 0 + algebraMap K (GField K) b1' * prow K 1) =
      algebraMap K (GField K) κ *
        ((algebraMap K (GField K) a0 * prow K 0 + algebraMap K (GField K) a1 * prow K 1) *
          (algebraMap K (GField K) b0 * prow K 0 + algebraMap K (GField K) b1 * prow K 1))) :
    a0 * (κ * b0) = a0' * b0' ∧
      a0 * (κ * b1) + a1 * (κ * b0) = a0' * b1' + a1' * b0' ∧
      a1 * (κ * b1) = a1' * b1' := by
  have hq := generisch_quad (a0 * (κ * b0) - a0' * b0')
    (a0 * (κ * b1) + a1 * (κ * b0) - (a0' * b1' + a1' * b0')) (a1 * (κ * b1) - a1' * b1') (by
      simp only [map_sub, map_add, map_mul]
      linear_combination -h)
  exact ⟨sub_eq_zero.1 hq.1, sub_eq_zero.1 hq.2.1, sub_eq_zero.1 hq.2.2⟩

end Generisch

/-! ## Coordinates of the generic normal form -/

section Koordinaten

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- `A_t ∈ K^{4×2}`, `A_t[k, j] = α_t(e_{kj})`: `a_t(p) = A_t p` in the prose. -/
def Amat (t : Fin r) : Matrix (Fin 4) (Fin 2) K := Matrix.of fun k j => alg.alpha t (unitMatrix k j)

/-- `B̂_t ∈ K^{4×2}` with `B̂_t p = (β_t(e_{1j}) p₀ − β_t(e_{0j}) p₁)_j`: `b_t(p) = B̂_t p` in the
prose (`B_tᵀ J p`, up to the sign convention of `J`). -/
def Bmat (t : Fin r) : Matrix (Fin 4) (Fin 2) K :=
  Matrix.of fun j i => ![alg.beta t (unitMatrix 1 j), -alg.beta t (unitMatrix 0 j)] i

theorem Amat_ne_zero (t : Fin r) (ht : alg.alpha t ≠ 0) : Amat alg t ≠ 0 := by
  intro h0
  apply ht
  apply linearForm_eq_zero_of_unitMatrix
  intro i j
  have := congrFun (congrFun h0 i) j
  simpa [Amat] using this

theorem Bmat_ne_zero (t : Fin r) (ht : alg.beta t ≠ 0) : Bmat alg t ≠ 0 := by
  intro h0
  apply ht
  apply linearForm_eq_zero_of_unitMatrix
  intro i j
  fin_cases i
  · have := congrFun (congrFun h0 j) 1
    simpa [Bmat] using this
  · have := congrFun (congrFun h0 j) 0
    simpa [Bmat] using this

theorem alpha_eq_of_Amat {s t : Fin r} {c : K} (h : Amat alg s = c • Amat alg t) :
    alg.alpha s = c • alg.alpha t := by
  rw [← sub_eq_zero]
  apply linearForm_eq_zero_of_unitMatrix
  intro i j
  have := congrFun (congrFun h i) j
  simp only [Amat, Matrix.of_apply, Matrix.smul_apply, smul_eq_mul] at this
  simp [this]

theorem beta_eq_of_Bmat {s t : Fin r} {c : K} (h : Bmat alg s = c • Bmat alg t) :
    alg.beta s = c • alg.beta t := by
  rw [← sub_eq_zero]
  apply linearForm_eq_zero_of_unitMatrix
  intro i j
  fin_cases i
  · have := congrFun (congrFun h j) 1
    simp only [Bmat, Matrix.of_apply, Matrix.smul_apply, smul_eq_mul] at this
    simp at this
    simp [this]
  · have := congrFun (congrFun h j) 0
    simp only [Bmat, Matrix.of_apply, Matrix.smul_apply, smul_eq_mul] at this
    simp at this
    simp [this]

/-- The `k`-th coordinate of `a_t` of the generic normal form in the basis `S⁻¹ e_k`:
`A_t[k,0] p₀ + A_t[k,1] p₁`. -/
theorem genAlg_alpha_basis (t : Fin r) (k : Fin 4) :
    ∑ i, ((Sg K)⁻¹ *ᵥ basisVec k) i * SatzB444.avecs (genAlg alg) t i =
      algebraMap K (GField K) (Amat alg t k 0) * prow K 0 +
        algebraMap K (GField K) (Amat alg t k 1) * prow K 1 := by
  rw [genAlg_avecs, Matrix.mulVec_mulVec, Matrix.mul_nonsing_inv _ (isUnit_det_Sg K),
    Matrix.one_mulVec, baseChange_alpha, extendForm_apply]
  simp only [outer_apply, basisVec, Fin.sum_univ_two, Amat, Matrix.of_apply]
  fin_cases k <;> simp [Fin.sum_univ_four]

/-- `β_t(emb e_j)` of the generic normal form: `det(T)⁻¹ (B̂_t[j,0] p₀ + B̂_t[j,1] p₁)`. -/
theorem genAlg_beta_basis (t : Fin r) (j : Fin 4) :
    (genAlg alg).beta t (emb (basisVec j)) =
      ((Tg K).det)⁻¹ * (algebraMap K (GField K) (Bmat alg t j 0) * prow K 0 +
        algebraMap K (GField K) (Bmat alg t j 1) * prow K 1) := by
  rw [genAlg_beta_emb, baseChange_beta, extendForm_apply]
  simp only [outer_apply, basisVec, Fin.sum_univ_two, Bmat, Matrix.of_apply]
  simp only [Fin.sum_univ_four, mul_ite, mul_one, mul_zero, Fin.isValue]
  fin_cases j <;> simp [vT_zero, vT_one, prow, Fin.sum_univ_four] <;> ring

/-- `b_t ≠ 0` at the generic normal form (from `β_t ≠ 0`). -/
theorem genAlg_beta_ne (t : Fin r) (ht : alg.beta t ≠ 0) :
    ∃ j, (genAlg alg).beta t (emb (basisVec j)) ≠ 0 := by
  have hB := Bmat_ne_zero alg t ht
  by_contra hc
  push_neg at hc
  apply hB
  ext j i
  have h := hc j
  rw [genAlg_beta_basis] at h
  have h' := (mul_eq_zero.1 h).resolve_left (inv_ne_zero (det_Tg_ne_zero K))
  have := generisch_lin _ _ h'
  fin_cases i
  · exact this.1
  · exact this.2

/-- The kernel of `W` of the generic normal form is cut out by the equations of `ker W` over `K`:
`∑_t x_t C_t = 0` (entries). -/
theorem genAlg_W_eq_zero_iff (x : Fin r → GField K) :
    W (d := 3) (genAlg alg) x = 0 ↔
      ∀ ij : Fin 4 × Fin 4, ∑ t, algebraMap K (GField K) (alg.coeff t ij.1 ij.2) * x t = 0 := by
  have hS := isUnit_det_Sg K
  have hW : W (d := 3) (genAlg alg) x =
      (Sg K)⁻¹ * ∑ t, x t • (alg.coeff t).map (algebraMap K (GField K)) := by
    simp only [W, LinearMap.coe_mk, AddHom.coe_mk, genAlg, YangN3Teil2.changeBasis,
      BilinearAlgorithm.baseChange_coeff, Matrix.mul_sum, Matrix.mul_smul]
  rw [hW]
  constructor
  · intro h ij
    have h2 : ∑ t, x t • (alg.coeff t).map (algebraMap K (GField K)) = 0 := by
      have := congrArg (fun M => Sg K * M) h
      simpa [← Matrix.mul_assoc, Matrix.mul_nonsing_inv _ hS] using this
    have := congrFun (congrFun h2 ij.1) ij.2
    simp only [Matrix.sum_apply, Matrix.smul_apply, Matrix.map_apply, smul_eq_mul,
      Matrix.zero_apply] at this
    rw [← this]
    exact Finset.sum_congr rfl fun t _ => mul_comm _ _
  · intro h
    have h2 : ∑ t, x t • (alg.coeff t).map (algebraMap K (GField K)) = 0 := by
      ext i j
      have := h (i, j)
      simp only [Matrix.sum_apply, Matrix.smul_apply, Matrix.map_apply, smul_eq_mul,
        Matrix.zero_apply]
      rw [← this]
      exact Finset.sum_congr rfl fun t _ => mul_comm _ _
    rw [h2, Matrix.mul_zero]

end Koordinaten

/-! ## Step 1: in the case (5,8), `ker W` is spanned by the vectors `Ψ(u, y)` -/

section Schritt1

variable {F : Type u} [Field F] {r : ℕ} (alg : BilinearAlgorithm F 4 2 4 r)

/-- In the case `rk L = 5` (and `r = 25`): `ker W ≤ J ⊔ range ℓ` (prose (G): `Ĵ_p = ker W`). -/
theorem kerW_le (h1 : SN1 (d := 3) alg) (hr : r = 25)
    (hL : finrank F (LinearMap.range (Lq (d := 3) alg)) = 5) :
    LinearMap.ker (W (d := 3) alg) ≤ J (d := 3) alg ⊔ LinearMap.range (ell (d := 3) alg) := by
  have hK := finrank_Kbar (d := 3) alg h1
  have hKbar : finrank F (Kbar (d := 3) alg) = 5 := by omega
  have heq : LinearMap.range (Lq (d := 3) alg) = Kbar (d := 3) alg :=
    Submodule.eq_of_le_of_finrank_eq (range_Lq_le_Kbar (d := 3) alg) (by rw [hL, hKbar])
  intro x hx
  have hmem : π (d := 3) alg x ∈ LinearMap.range (Lq (d := 3) alg) := by
    rw [heq]
    exact Submodule.mem_map_of_mem hx
  obtain ⟨u, hu⟩ := hmem
  rw [Lq_apply] at hu
  have hJ : x - ell (d := 3) alg u ∈ J (d := 3) alg := by
    rw [← π_eq_zero_iff, map_sub, hu, sub_self]
  have : x = (x - ell (d := 3) alg u) + ell (d := 3) alg u := by abel
  rw [this]
  exact Submodule.add_mem _ (Submodule.mem_sup_left hJ)
    (Submodule.mem_sup_right ⟨u, rfl⟩)

/-- If `a_s = c a_t` and `b_s = c' b_t`, every vector of `ker W` (case (5,8)) satisfies
`x_s = c c' x_t` (prose Lemma Z, step 1). -/
theorem kerW_rel (h1 : SN1 (d := 3) alg) (hr : r = 25)
    (hL : finrank F (LinearMap.range (Lq (d := 3) alg)) = 5) {s t : Fin r} {c c' : F}
    (ha : SatzB444.avecs alg s = c • SatzB444.avecs alg t)
    (hb : SatzF444.bvecs alg s = c' • SatzF444.bvecs alg t) :
    ∀ x ∈ LinearMap.ker (W (d := 3) alg), x s = (c * c') * x t := by
  have hφ : ∀ i y, φ (d := 3) alg i y s = (c * c') * φ (d := 3) alg i y t := by
    intro i y
    rw [SatzB444.φ_apply_apply, SatzB444.φ_apply_apply, SatzF444.beta_emb, SatzF444.beta_emb,
      ha, hb, Pi.smul_apply, smul_eq_mul, smul_dotProduct, smul_eq_mul]
    ring
  let P : Submodule F (Fin r → F) :=
    LinearMap.ker ((LinearMap.proj s : (Fin r → F) →ₗ[F] F) -
      (c * c') • (LinearMap.proj t : (Fin r → F) →ₗ[F] F))
  have hP : ∀ x, x ∈ P ↔ x s = (c * c') * x t := by
    intro x
    simp [P, sub_eq_zero]
  have hJ : J (d := 3) alg ≤ P := by
    rintro _ ⟨y, rfl⟩
    exact (hP _).2 (hφ 0 y)
  have hell : LinearMap.range (ell (d := 3) alg) ≤ P := by
    rintro _ ⟨u, rfl⟩
    rw [hP, ell_apply, Finset.sum_apply, Finset.sum_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun i _ => hφ _ _
  intro x hx
  exact (hP x).1 (sup_le hJ hell (kerW_le alg h1 hr hL hx))

end Schritt1

/-! ## Step 1 at the generic point: `κ ∈ K`, and the polynomial identity -/

section Paar

variable {K : Type u} [Field K] (alg : BilinearAlgorithm K 4 2 4 25)

/-- Two terms are **related** at a normal form: both points coincide projectively (the negation
of the condition in `SatzF444.VielePunkte`). -/
def Rel {L : Type v} [Field L] {r : ℕ} (alg' : BilinearAlgorithm L 4 2 4 r) (s t : Fin r) : Prop :=
  (∃ c : L, SatzB444.avecs alg' s = c • SatzB444.avecs alg' t) ∧
    ∃ c : L, SatzF444.bvecs alg' s = c • SatzF444.bvecs alg' t

theorem bvecs_dot_basisVec {L : Type v} [Field L] {r : ℕ} (alg' : BilinearAlgorithm L 4 2 4 r)
    (t : Fin r) (y : Fin 4 → L) : alg'.beta t (emb y) = SatzF444.bvecs alg' t ⬝ᵥ y :=
  SatzF444.beta_emb alg' t y

set_option maxHeartbeats 1000000 in
/-- **Step 1 and the polynomial identity** (prose Lemma Z, steps 1 and 2, at the generic point).
If `s ∼ t` at the generic normal form, there is `κ ∈ K`, `κ ≠ 0`, with
`(A_s p) ⊗ (B̂_s p) = κ (A_t p) ⊗ (B̂_t p)` as a polynomial identity. -/
theorem quadGleich_of_rel {s t : Fin 25} (hrel : Rel (genAlg alg) s t) :
    ∃ κ : K, κ ≠ 0 ∧
      QuadGleich (Amat alg t) (κ • Bmat alg t) (Amat alg s) (Bmat alg s) := by
  classical
  obtain ⟨h1, h2, hcase, -⟩ := folgerungC1_generisch alg
  have hL : finrank (GField K) (LinearMap.range (Lq (d := 3) (genAlg alg))) = 5 :=
    (Prod.ext_iff.1 hcase).1
  obtain ⟨⟨c, ha⟩, ⟨c', hb⟩⟩ := hrel
  have hrelW := kerW_rel (genAlg alg) h1 rfl hL ha hb
  -- a vector of `ker W` with `x_t ≠ 0`
  obtain ⟨j0, hj0⟩ := genAlg_beta_ne alg t (beta_ne_zero_of_length_25 alg t)
  let x0 : Fin 25 → GField K := φ (d := 3) (genAlg alg) 0 (basisVec j0)
  have hx0W : W (d := 3) (genAlg alg) x0 = 0 := φ_mem_ker (d := 3) (genAlg alg) 0 _
  have hx0t : x0 t ≠ 0 := by
    show SatzB444.avecs (genAlg alg) t 0 * (genAlg alg).beta t (emb (basisVec j0)) ≠ 0
    exact mul_ne_zero (SatzB444.avecs_zero_ne _ h1 t) hj0
  obtain ⟨y, hy, hyt⟩ := kern_abstieg (fun (ij : Fin 4 × Fin 4) (t : Fin 25) => alg.coeff t ij.1 ij.2) x0
    ((genAlg_W_eq_zero_iff alg x0).1 hx0W) t hx0t
  -- `ι y ∈ ker W`, hence `κ = c c' = ι (y_s / y_t)`
  have hyW : W (d := 3) (genAlg alg) (fun t => algebraMap K (GField K) (y t)) = 0 := by
    rw [genAlg_W_eq_zero_iff]
    intro ij
    have := congrArg (algebraMap K (GField K)) (hy ij)
    simpa [map_sum, map_mul] using this
  have hκ := hrelW _ hyW
  set κ : K := y s / y t with hκdef
  have hcc : c * c' = algebraMap K (GField K) κ := by
    have hιt : algebraMap K (GField K) (y t) ≠ 0 := (map_ne_zero _).2 hyt
    rw [hκdef, map_div₀, hκ, mul_div_assoc, div_self hιt, mul_one]
  -- `κ ≠ 0`
  have hc : c ≠ 0 := by
    rintro rfl
    have := congrFun ha 0
    rw [zero_smul, Pi.zero_apply] at this
    exact SatzB444.avecs_zero_ne _ h1 s this
  obtain ⟨j1, hj1⟩ := genAlg_beta_ne alg s (beta_ne_zero_of_length_25 alg s)
  have hc' : c' ≠ 0 := by
    rintro rfl
    apply hj1
    rw [bvecs_dot_basisVec, hb, zero_smul, zero_dotProduct]
  have hκ0 : κ ≠ 0 := by
    intro h0
    have : c * c' = 0 := by rw [hcc, h0, map_zero]
    exact mul_ne_zero hc hc' this
  refine ⟨κ, hκ0, fun k j => ?_⟩
  -- the identity at the generic point
  have hA : ∀ k, ∑ i, ((Sg K)⁻¹ *ᵥ basisVec k) i * SatzB444.avecs (genAlg alg) s i =
      c * ∑ i, ((Sg K)⁻¹ *ᵥ basisVec k) i * SatzB444.avecs (genAlg alg) t i := by
    intro k
    rw [ha, Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Pi.smul_apply, smul_eq_mul]
    ring
  have hB : ∀ j, (genAlg alg).beta s (emb (basisVec j)) =
      c' * (genAlg alg).beta t (emb (basisVec j)) := by
    intro j
    rw [bvecs_dot_basisVec, bvecs_dot_basisVec, hb, smul_dotProduct, smul_eq_mul]
  have hprod := congrArg₂ (· * ·) (hA k) (hB j)
  simp only at hprod
  rw [genAlg_alpha_basis, genAlg_alpha_basis, genAlg_beta_basis, genAlg_beta_basis] at hprod
  have hdet : ((Tg K).det)⁻¹ ≠ 0 := inv_ne_zero (det_Tg_ne_zero K)
  have key := generisch_produkt (Amat alg t k 0) (Amat alg t k 1) (Bmat alg t j 0)
    (Bmat alg t j 1) (Amat alg s k 0) (Amat alg s k 1) (Bmat alg s j 0) (Bmat alg s j 1) κ (by
      rw [← hcc]
      have e : ((Tg K).det)⁻¹ *
          ((algebraMap K (GField K) (Amat alg s k 0) * prow K 0 +
              algebraMap K (GField K) (Amat alg s k 1) * prow K 1) *
            (algebraMap K (GField K) (Bmat alg s j 0) * prow K 0 +
              algebraMap K (GField K) (Bmat alg s j 1) * prow K 1)) =
          ((Tg K).det)⁻¹ * (c * c' *
            ((algebraMap K (GField K) (Amat alg t k 0) * prow K 0 +
                algebraMap K (GField K) (Amat alg t k 1) * prow K 1) *
              (algebraMap K (GField K) (Bmat alg t j 0) * prow K 0 +
                algebraMap K (GField K) (Bmat alg t j 1) * prow K 1))) := by
        linear_combination hprod
      exact mul_left_cancel₀ hdet e)
  simp only [Matrix.smul_apply, smul_eq_mul]
  exact key

/-- **Structure of a related pair** (prose Lemma Z step 2 with the repair: explicit row
directions). If `s ≠ t` are related at the generic normal form, then case (ii) of Lemma K holds,
and there are linearly independent `l₁, l₂` with row directions `A_t ∼ l₁`, `A_s ∼ l₂`,
`B̂_s ∼ l₁`, `B̂_t ∼ l₂`. Case (i) contradicts minimality. -/
theorem paar_struktur (hK : LemmaKStatement K) {s t : Fin 25} (hst : s ≠ t)
    (hrel : Rel (genAlg alg) s t) :
    ∃ l1 l2 : Fin 2 → K, l1 0 * l2 1 - l1 1 * l2 0 ≠ 0 ∧ Zeile (Amat alg t) l1 ∧
      Zeile (Amat alg s) l2 ∧ Zeile (Bmat alg s) l1 ∧ Zeile (Bmat alg t) l2 := by
  obtain ⟨κ, hκ, hq⟩ := quadGleich_of_rel alg hrel
  have hAt := Amat_ne_zero alg t (alpha_ne_zero_of_length_25 alg t)
  have hAs := Amat_ne_zero alg s (alpha_ne_zero_of_length_25 alg s)
  have hBt := Bmat_ne_zero alg t (beta_ne_zero_of_length_25 alg t)
  have hBs := Bmat_ne_zero alg s (beta_ne_zero_of_length_25 alg s)
  have hκBt : κ • Bmat alg t ≠ 0 := by
    intro h0
    exact hBt ((smul_eq_zero.1 h0).resolve_left hκ)
  rcases hK 4 _ _ _ _ hAt hκBt hAs hBs hq with ⟨c, hc, hX, hY⟩ | ⟨x, w, l1, l2, c, -, -, hc, hdet,
      hX, hY, hX', hY'⟩
  · -- case (i): `α_s = c α_t`, `β_s = c⁻¹ κ β_t`, against minimality
    exfalso
    have hα := alpha_eq_of_Amat alg hX
    have hβ := beta_eq_of_Bmat alg (s := s) (t := t) (c := c⁻¹ * κ) (by rw [hY, smul_smul])
    exact nicht_proportional alg hst.symm (c * (c⁻¹ * κ)) (fun A B => by
      rw [hα, hβ, LinearMap.smul_apply, LinearMap.smul_apply, smul_eq_mul, smul_eq_mul]
      ring)
  · refine ⟨l1, l2, hdet, ⟨x, hX⟩, ⟨c • x, by rw [hX', smul_vecMulVec]⟩,
      ⟨c⁻¹ • w, by rw [hY', smul_vecMulVec]⟩, ⟨κ⁻¹ • w, ?_⟩⟩
    rw [← smul_vecMulVec, ← hY, smul_smul, inv_mul_cancel₀ hκ, one_smul]

/-- **No three pairwise related terms** (prose Lemma Z step 2, repaired): classes of `∼` at the
generic normal form have at most two elements. -/
theorem keine_drei (hK : LemmaKStatement K) {a b c : Fin 25} (hab : a ≠ b) (hac : a ≠ c)
    (hbc : b ≠ c) (hRab : Rel (genAlg alg) a b) (hRac : Rel (genAlg alg) a c)
    (hRbc : Rel (genAlg alg) b c) : False := by
  obtain ⟨l1, l2, hl, -, -, hBa1, hBb2⟩ := paar_struktur alg hK hab hRab
  obtain ⟨m1, m2, hm, hAc1, -, hBa2, -⟩ := paar_struktur alg hK hac hRac
  obtain ⟨n1, n2, hn, hAc2, -, hBb3, -⟩ := paar_struktur alg hK hbc hRbc
  have hBa := Bmat_ne_zero alg a (beta_ne_zero_of_length_25 alg a)
  have hBb := Bmat_ne_zero alg b (beta_ne_zero_of_length_25 alg b)
  have hAc := Amat_ne_zero alg c (alpha_ne_zero_of_length_25 alg c)
  -- `l₁ ∥ m₁` (row of `B̂_a`), `m₁ ∥ n₁` (row of `A_c`), `n₁ ∥ l₂` (row of `B̂_b`)
  have p1 : Par l1 m1 := zeile_par hBa hBa1 hBa2
  have p2 : Par m1 n1 := zeile_par hAc hAc1 hAc2
  have p3 : Par n1 l2 := par_symm (zeile_par hBb hBb2 hBb3)
  have p12 : Par l1 n1 := par_trans (ne_zero_left_of_det hm) p1 p2
  have p13 : Par l1 l2 := par_trans (ne_zero_left_of_det hn) p12 p3
  exact hl p13

end Paar

/-! ## Lemma Z -/

section LemmaZ

variable {K : Type u} [Field K]

/-- `Rel` is an equivalence relation at the generic normal form (all `a_t`, `b_t` are `≠ 0`). -/
theorem rel_symm (alg : BilinearAlgorithm K 4 2 4 25) {s t : Fin 25}
    (h : Rel (genAlg alg) s t) : Rel (genAlg alg) t s := by
  obtain ⟨h1, -, -, -⟩ := folgerungC1_generisch alg
  obtain ⟨⟨c, ha⟩, ⟨c', hb⟩⟩ := h
  have hc : c ≠ 0 := by
    rintro rfl
    have := congrFun ha 0
    rw [zero_smul, Pi.zero_apply] at this
    exact SatzB444.avecs_zero_ne _ h1 s this
  obtain ⟨j1, hj1⟩ := genAlg_beta_ne alg s (beta_ne_zero_of_length_25 alg s)
  have hc' : c' ≠ 0 := by
    rintro rfl
    apply hj1
    rw [bvecs_dot_basisVec, hb, zero_smul, zero_dotProduct]
  refine ⟨⟨c⁻¹, ?_⟩, ⟨c'⁻¹, ?_⟩⟩
  · rw [ha, smul_smul, inv_mul_cancel₀ hc, one_smul]
  · rw [hb, smul_smul, inv_mul_cancel₀ hc', one_smul]

theorem rel_trans {L : Type v} [Field L] {r : ℕ} (alg' : BilinearAlgorithm L 4 2 4 r)
    {a b c : Fin r} (h : Rel alg' a b) (h' : Rel alg' b c) : Rel alg' a c := by
  obtain ⟨⟨c1, ha1⟩, ⟨c2, hb1⟩⟩ := h
  obtain ⟨⟨c3, ha2⟩, ⟨c4, hb2⟩⟩ := h'
  exact ⟨⟨c1 * c3, by rw [ha1, ha2, smul_smul]⟩, ⟨c2 * c4, by rw [hb1, hb2, smul_smul]⟩⟩

theorem rel_refl {L : Type v} [Field L] {r : ℕ} (alg' : BilinearAlgorithm L 4 2 4 r) (a : Fin r) :
    Rel alg' a a :=
  ⟨⟨1, (one_smul _ _).symm⟩, ⟨1, (one_smul _ _).symm⟩⟩

/-- **Lemma Z at the generic normal form** (prose Section 3.2, with the repair of step 2):
assuming Lemma K over `K`, for every decomposition of `⟨4,2,4⟩` of length 25 over `K` the
generic normal form over `K(S, T)` has at least 13 terms with pairwise distinct points
`[a_t ⊗ b_t]`. -/
theorem lemmaZ_generisch (hK : LemmaKStatement K) (alg : BilinearAlgorithm K 4 2 4 25) :
    SatzF444.VielePunkte (genAlg alg) 13 := by
  obtain ⟨T, hT, hpair⟩ := viele_klassen (Rel (genAlg alg)) (rel_refl _)
    (fun _ _ h => rel_symm alg h) (fun _ _ _ h h' => rel_trans _ h h')
    (fun a b c hab hac hbc hRab hRac hRbc => keine_drei alg hK hab hac hbc hRab hRac hRbc)
  exact ⟨T, by omega, hpair⟩

/-- `VielePunkte` is monotone in the number of points. -/
theorem vielePunkte_mono {L : Type v} [Field L] {r : ℕ} {alg' : BilinearAlgorithm L 4 2 4 r}
    {n n' : ℕ} (hn : n' ≤ n) (h : SatzF444.VielePunkte alg' n) : SatzF444.VielePunkte alg' n' := by
  obtain ⟨T, hT, hp⟩ := h
  exact ⟨T, hn.trans hT, hp⟩

theorem pi_single_eq_basisVec {L : Type v} [Field L] (j : Fin 4) :
    (Pi.single j 1 : Fin 4 → L) = basisVec j := by
  funext i
  simp [basisVec, Pi.single_apply, eq_comm]

/-- **Lemma Z for the normal form of the bridge** (`genAlgL alg` over `GBar K`): at least 13
pairwise distinct points. Proportionality over `GBar K` descends to `K(S, T)`. -/
theorem lemmaZ_bruecke (hK : LemmaKStatement K) (alg : BilinearAlgorithm K 4 2 4 25) :
    SatzF444.VielePunkte (Bruecke444.genAlgL alg) 13 := by
  obtain ⟨T, hT, hp⟩ := lemmaZ_generisch hK alg
  refine ⟨T, hT, fun s hs t ht hst hrel => hp s hs t ht hst ?_⟩
  obtain ⟨⟨c, ha⟩, ⟨c', hb⟩⟩ := hrel
  refine ⟨prop_abstieg (Bruecke444.ι K) _ _ c fun i => ?_,
    prop_abstieg (Bruecke444.ι K) _ _ c' fun j => ?_⟩
  · have := congrFun ha i
    simp only [Pi.smul_apply, smul_eq_mul] at this
    rw [Bruecke444.avecs_genAlgL, Bruecke444.avecs_genAlgL] at this
    exact this
  · have := congrFun hb j
    simp only [SatzF444.bvecs, Pi.smul_apply, smul_eq_mul] at this
    rw [pi_single_eq_basisVec, Bruecke444.beta_genAlgL_emb, Bruecke444.beta_genAlgL_emb]
      at this
    simpa only [SatzF444.bvecs, pi_single_eq_basisVec] using this

/-- `VielePunkte (genAlgL alg) 11`, the form used by `SatzF444.satzF`. -/
theorem lemmaZ_bruecke_11 (hK : LemmaKStatement K) (alg : BilinearAlgorithm K 4 2 4 25) :
    SatzF444.VielePunkte (Bruecke444.genAlgL alg) 11 :=
  vielePunkte_mono (by norm_num) (lemmaZ_bruecke hK alg)

end LemmaZ

/-! ## The final theorem with (Z′) discharged -/

section Endsatz

open SatzE444Buendel

/-- **No decomposition of length 25** over `K`, assuming Lemma K over `K` and (B3′) for the
normal form of the bridge. -/
theorem keine_zerlegung_25_of_lemmaK (K : Type u) [Field K] (hK : LemmaKStatement K)
    (alg : BilinearAlgorithm K 4 2 4 25)
    (hT : SatzF444.TransponiertEng (Bruecke444.genAlgL alg)) : False := by
  obtain ⟨h1, h2, -, hns⟩ := Bruecke444.bruecke alg
  exact hns (SatzF444.satzF (Bruecke444.genAlgL alg) h1 h2 (Bruecke444.bruecke_unterfallB alg)
    hT (lemmaZ_bruecke_11 hK alg))

/-- **`R(⟨4,2,4⟩) ≥ 26` over `K`, assuming Lemma K over `K` and (B3′) only for the normal form
of the bridge** (`genAlgL alg` over `GBar K`) of each decomposition of length 25 over `K`.
(Z′) is no longer a hypothesis. -/
theorem rank_four_two_four_ge_26_of_lemmaK (K : Type u) [Field K] (hK : LemmaKStatement K)
    (hT : ∀ alg : BilinearAlgorithm K 4 2 4 25,
      SatzF444.TransponiertEng (Bruecke444.genAlgL alg)) :
    26 ≤ tensorRank K 4 2 4 := by
  rw [le_tensorRank_iff]
  intro r alg
  have h25 := yang_theorem_two_algorithm K 4 4 (le_refl _) (le_refl _) alg
  norm_num at h25
  by_contra hlt
  have hr : r = 25 := by omega
  subst hr
  exact keine_zerlegung_25_of_lemmaK K hK alg (hT alg)

/-- **`R(⟨4,2,4⟩) ≥ 26` over every field, assuming Lemma K and (B3′)** in the form of
`SatzF444.rank_four_two_four_ge_26_of_hyp` (every non-symmetric normal form in the case (5,8)
over every algebraically closed field), without (Z′). -/
theorem rank_four_two_four_ge_26_of_lemmaK_transponiert
    (hK : ∀ (K : Type u) [Field K], LemmaKStatement K)
    (hT : ∀ (L : Type u) [Field L] [IsAlgClosed L] (alg : BilinearAlgorithm L 4 2 4 25),
      SN1 (d := 3) alg → SN2 (d := 3) alg →
      (finrank L (LinearMap.range (Lq (d := 3) alg)),
        finrank L (LinearMap.range (Hq (d := 3) alg))) = (5, 8) →
      NichtSymmetrisch alg → SatzF444.TransponiertEng alg)
    (K : Type u) [Field K] : 26 ≤ tensorRank K 4 2 4 :=
  rank_four_two_four_ge_26_of_lemmaK K (hK K) fun alg => by
    obtain ⟨h1, h2, hc, hns⟩ := Bruecke444.bruecke alg
    exact hT _ _ h1 h2 hc hns

end Endsatz

end LemmaZ444
end YangBounds

/-! ## Axiom check (printed in every build log, also in GitHub Actions)

Expected for each: `[propext, Classical.choice, Quot.sound]`. -/

#print axioms YangBounds.LemmaZ444.kern_abstieg
#print axioms YangBounds.LemmaZ444.generisch_quad
#print axioms YangBounds.LemmaZ444.nicht_proportional
#print axioms YangBounds.LemmaZ444.viele_klassen
#print axioms YangBounds.LemmaZ444.kerW_rel
#print axioms YangBounds.LemmaZ444.quadGleich_of_rel
#print axioms YangBounds.LemmaZ444.paar_struktur
#print axioms YangBounds.LemmaZ444.keine_drei
#print axioms YangBounds.LemmaZ444.lemmaZ_generisch
#print axioms YangBounds.LemmaZ444.lemmaZ_bruecke
#print axioms YangBounds.LemmaZ444.lemmaZ_bruecke_11
#print axioms YangBounds.LemmaZ444.keine_zerlegung_25_of_lemmaK
#print axioms YangBounds.LemmaZ444.rank_four_two_four_ge_26_of_lemmaK
#print axioms YangBounds.LemmaZ444.rank_four_two_four_ge_26_of_lemmaK_transponiert
