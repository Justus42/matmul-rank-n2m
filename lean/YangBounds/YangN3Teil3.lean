import YangBounds.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Basis.VectorSpace
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination

/-!
# Yang v3, Theorem 1 (`n = 3`), part 3: the linear algebra after strong normalization

Task S1-11 (stage 1, round 3, role: formaliser).

Source of the proof: `lean/prosa/yang_n3.md` (task S1-02), Sections 4 to 8, which works out
the proof of Theorem 1 in J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix
multiplication with GPT-6*, arXiv:2609.14393v3. The theorem is Yang's, not ours.

Section 9 of the prose file cuts the formalisation into three independent parts. This file is
**part 3**: everything from Section 6 on, under the *assumption* that the decomposition is
strongly normalized (SN1 and SN2 are explicit hypotheses). The basic facts G1 to G4 of
Section 4 are proved here as well, because part 3 uses them and they need neither polynomials
nor an infinite field. Parts 1 (field extension, R1) and 2 (strong normalization, Lemma A with
R2, R3) are separate files; nothing from them is assumed here except SN1 and SN2.

Everything lives in the namespace `YangBounds.YangN3Teil3`, so that the three parts can be
imported together without name clashes.

## Translation of the prose notation

* Indices count from `0`. `e_{i,j}` is `unitMatrix i j` from `YangBounds.Basic`.
* `F^R` is `Fin r → K` with its pointwise ring structure. `D(A) t` is the pointwise product
  `avec alg A * t` with `avec alg A = (α_k(A))_k`; rule (D1) is commutativity of this ring.
* `ℬ` is `bvec alg`, `W` is `W alg`, `f_i` is `f alg i`, `g` is `g alg`.
* The prose space `U = {x ∈ F^{2×m} : row 0 of x is 0}` is parametrised by
  `emb : (Fin m → K) → F^{2×m}`, `y ↦ (0; y)`, an isomorphism onto `U`. All maps with domain
  `U` (or `U²`, `U² × U`) are composed with `emb`; their names carry the prose names.
* The quotient `Q = K/J` (`K = ker W`, `J = f_0(U)`) is realised inside `F^R ⧸ J` as the image
  `Kbar = (ker W).map J.mkQ`; `q = dim Q` is `finrank Kbar`. The maps `F_i`, `L`, `H`, `Φ`
  take values in `F^R ⧸ J` and have ranges inside `Kbar`, so their kernels and ranks are those
  of the prose.
* `N = ker H` and the subspace `S` of Section 8 are subspaces of `Fin m → K`, i.e. of `U`.

## Main result

`yang_n3_of_stronglyNormalized`: for every field `K`, every `m ≥ 2` and every decomposition
of `⟨3,2,m⟩` of length `r` satisfying SN1 and SN2, `24 * m + 2 ≤ 5 * r`.
-/

namespace YangBounds
namespace YangN3Teil3

open Module

universe u

variable {K : Type u} [Field K] {m r : ℕ}

/-! ## Notation and definitions (prose Section 2) -/

/-- `e_{i,j}` as a `3 × 2` matrix. -/
abbrev e32 (i : Fin 3) (j : Fin 2) : Matrix (Fin 3) (Fin 2) K := unitMatrix i j

/-- `e_{i,j}` as a `2 × 2` matrix. -/
abbrev e22 (i j : Fin 2) : Matrix (Fin 2) (Fin 2) K := unitMatrix i j

/-- The vector `(α_0(A), …, α_{R-1}(A))`; `D(A) t` is `avec alg A * t`. -/
def avec (alg : BilinearAlgorithm K 3 2 m r) (A : Matrix (Fin 3) (Fin 2) K) : Fin r → K :=
  fun k => alg.alpha k A

/-- `ℬ(B) = (β_0(B), …, β_{R-1}(B))`. -/
def bvec (alg : BilinearAlgorithm K 3 2 m r) : Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  LinearMap.pi alg.beta

/-- `x ↦ D(A) ℬ(x)` as a linear map. -/
def prodMap (alg : BilinearAlgorithm K 3 2 m r) (A : Matrix (Fin 3) (Fin 2) K) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  LinearMap.pi fun k => alg.alpha k A • alg.beta k

/-- `W(t) = ∑_r t_r C_r`. -/
def W (alg : BilinearAlgorithm K 3 2 m r) : (Fin r → K) →ₗ[K] Matrix (Fin 3) (Fin m) K where
  toFun t := ∑ k, t k • alg.coeff k
  map_add' s t := by simp [add_smul, Finset.sum_add_distrib]
  map_smul' c t := by simp [Finset.smul_sum, smul_smul]

/-- Left multiplication `x ↦ M x` of `2 × m` matrices by a `2 × 2` matrix. -/
def lmul (M : Matrix (Fin 2) (Fin 2) K) : Matrix (Fin 2) (Fin m) K →ₗ[K] Matrix (Fin 2) (Fin m) K where
  toFun x := M * x
  map_add' := Matrix.mul_add M
  map_smul' c x := Matrix.mul_smul M c x

/-- `f_i(v) = D(e_{i,0}) ℬ(v)` (prose Section 5). -/
def f (alg : BilinearAlgorithm K 3 2 m r) (i : Fin 3) :
    Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  prodMap alg (e32 i 0)

/-- `g(x) = D(e_{0,1}) ℬ(x) − D(e_{0,0}) ℬ(e_{0,1}^{(2×2)} x)` (prose Section 6). -/
def g (alg : BilinearAlgorithm K 3 2 m r) : Matrix (Fin 2) (Fin m) K →ₗ[K] (Fin r → K) :=
  prodMap alg (e32 0 1) - (prodMap alg (e32 0 0)).comp (lmul (e22 0 1))

/-- (SN1) `D(e_{0,0})` is invertible, i.e. `α_r(e_{0,0}) ≠ 0` for every `r`. -/
def SN1 (alg : BilinearAlgorithm K 3 2 m r) : Prop :=
  ∀ k, alg.alpha k (e32 0 0) ≠ 0

/-- (SN2) For every `v ≠ 0` the vectors `f_0(v), f_1(v), f_2(v)` are linearly independent. -/
def SN2 (alg : BilinearAlgorithm K 3 2 m r) : Prop :=
  ∀ v : Matrix (Fin 2) (Fin m) K, v ≠ 0 → LinearIndependent K ![f alg 0 v, f alg 1 v, f alg 2 v]

/-- The decomposition is strongly normalized (prose Section 5): SN1 and SN2. -/
structure StronglyNormalized (alg : BilinearAlgorithm K 3 2 m r) : Prop where
  sn1 : SN1 alg
  sn2 : SN2 alg

/-- Parametrisation of `U`: `y ↦` the `2 × m` matrix with row 0 zero and row 1 equal to `y`. -/
def emb : (Fin m → K) →ₗ[K] Matrix (Fin 2) (Fin m) K where
  toFun y := Matrix.of ![0, y]
  map_add' y z := by ext i j; fin_cases i <;> simp
  map_smul' c y := by ext i j; fin_cases i <;> simp

/-! ## Elementary facts -/

section Basics

variable (alg : BilinearAlgorithm K 3 2 m r)

theorem prodMap_apply (A : Matrix (Fin 3) (Fin 2) K) (x : Matrix (Fin 2) (Fin m) K) :
    prodMap alg A x = avec alg A * bvec alg x := by
  ext k; simp [prodMap, avec, bvec]

theorem f_apply (i : Fin 3) (x : Matrix (Fin 2) (Fin m) K) :
    f alg i x = avec alg (e32 i 0) * bvec alg x :=
  prodMap_apply alg _ x

theorem lmul_emb (y : Fin m → K) :
    lmul (e22 0 1) (emb y) = (Matrix.of ![y, 0] : Matrix (Fin 2) (Fin m) K) := by
  ext i j
  fin_cases i <;> simp [lmul, emb, unitMatrix, Matrix.mul_apply, Fin.sum_univ_two]

theorem g_emb (y : Fin m → K) :
    g alg (emb y) = avec alg (e32 0 1) * bvec alg (emb y)
      - avec alg (e32 0 0) * bvec alg (Matrix.of ![y, 0]) := by
  simp only [g, LinearMap.sub_apply, LinearMap.comp_apply, lmul_emb, prodMap_apply]

/-- (D2): `W(D(A) ℬ(x)) = A x`. -/
theorem W_mul (A : Matrix (Fin 3) (Fin 2) K) (x : Matrix (Fin 2) (Fin m) K) :
    W alg (avec alg A * bvec alg x) = A * x := by
  rw [alg.correct A x]
  simp [W, avec, bvec]

theorem emb_injective : Function.Injective (emb : (Fin m → K) →ₗ[K] _) := by
  intro y z h
  funext j
  have := congrFun (congrFun h 1) j
  simpa [emb] using this

/-- Cancelling a vector without zero entries (used with SN1). -/
theorem cancel_left {c v w : Fin r → K} (hc : ∀ k, c k ≠ 0) (h : c * v = c * w) : v = w := by
  funext k
  have := congrFun h k
  simp only [Pi.mul_apply] at this
  exact mul_left_cancel₀ (hc k) this

/-- **G1.** `ℬ` is injective. -/
theorem G1_bvec_injective : Function.Injective (bvec alg) := by
  refine (injective_iff_map_eq_zero (bvec alg)).2 fun x hx => ?_
  have h : ∀ A : Matrix (Fin 3) (Fin 2) K, A * x = 0 := fun A => by
    rw [← W_mul alg A x, hx, mul_zero, map_zero]
  ext i j
  have h0 := congrFun (congrFun (h (e32 0 0)) 0) j
  have h1 := congrFun (congrFun (h (e32 0 1)) 0) j
  simp [unitMatrix, Matrix.mul_apply, Fin.sum_univ_two] at h0 h1
  fin_cases i
  · simpa using h0
  · simpa using h1

/-- **G2.** `W` is surjective. -/
theorem G2_W_surjective : Function.Surjective (W alg) := by
  intro M
  refine ⟨∑ i : Fin 3, avec alg (e32 i 0) * bvec alg (Matrix.of ![M i, 0]), ?_⟩
  rw [map_sum]
  simp only [W_mul]
  ext a l
  fin_cases a <;>
    simp [Matrix.sum_apply, Matrix.mul_apply, unitMatrix, Fin.sum_univ_two, Fin.sum_univ_three]

/-- **G3.** `dim ker W = R − 3m`, in the form `dim ker W + 3m = R`. -/
theorem G3_finrank_ker_W : finrank K (LinearMap.ker (W alg)) + 3 * m = r := by
  have h := LinearMap.finrank_range_add_finrank_ker (W alg)
  rw [LinearMap.range_eq_top.2 (G2_W_surjective alg), finrank_top, Module.finrank_matrix,
    Module.finrank_fin_fun] at h
  simp only [Fintype.card_fin, Module.finrank_self, mul_one] at h
  omega

/-- **G4.** Under SN1, `f_0 = D(e_{0,0}) ∘ ℬ` is injective. -/
theorem G4_f0_injective (h1 : SN1 alg) : Function.Injective (f alg 0) := by
  refine (injective_iff_map_eq_zero (f alg 0)).2 fun x hx => ?_
  rw [f_apply] at hx
  have : bvec alg x = bvec alg 0 := by
    rw [map_zero]
    exact cancel_left (c := avec alg (e32 0 0)) h1 (by rw [hx, mul_zero])
  exact G1_bvec_injective alg this

end Basics

/-! ## General finrank lemmas -/

section FinrankLemmas

variable {V V₁ V₂ : Type*} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
  [AddCommGroup V₁] [Module K V₁] [FiniteDimensional K V₁]
  [AddCommGroup V₂] [Module K V₂] [FiniteDimensional K V₂]

omit [FiniteDimensional K V₁] in
/-- Rank–nullity for the restriction of `φ` to a subspace `p`. -/
theorem finrank_map_add_finrank_inf_ker (φ : V →ₗ[K] V₁) (p : Submodule K V) :
    finrank K (p.map φ) + finrank K (p ⊓ LinearMap.ker φ : Submodule K V) = finrank K p := by
  have h := LinearMap.finrank_range_add_finrank_ker (φ.domRestrict p)
  rw [LinearMap.range_domRestrict, LinearMap.ker_domRestrict] at h
  rw [← h, ← (Submodule.comapSubtypeEquivOfLe (inf_le_left : p ⊓ LinearMap.ker φ ≤ p)).finrank_eq,
    Submodule.comap_inf, Submodule.comap_subtype_self, top_inf_eq]

/-- `dim (p / q) + dim q = dim p` for `q ≤ p`, with `p / q` realised inside `V ⧸ q`. -/
theorem finrank_map_mkQ_add (p q : Submodule K V) (hqp : q ≤ p) :
    finrank K (p.map q.mkQ) + finrank K q = finrank K p := by
  have h := finrank_map_add_finrank_inf_ker q.mkQ p
  rwa [Submodule.ker_mkQ, inf_eq_right.2 hqp] at h

omit [FiniteDimensional K V₁] [FiniteDimensional K V₂] in
/-- The rank of `x ↦ (φ x, ψ x)` is at most the sum of the ranks. -/
theorem finrank_range_prod_le (φ : V →ₗ[K] V₁) (ψ : V →ₗ[K] V₂) :
    finrank K (LinearMap.range (φ.prod ψ)) ≤
      finrank K (LinearMap.range φ) + finrank K (LinearMap.range ψ) := by
  have h1 : LinearMap.range (φ.prod ψ) ≤
      (LinearMap.range φ).map (LinearMap.inl K V₁ V₂) ⊔
        (LinearMap.range ψ).map (LinearMap.inr K V₁ V₂) := by
    rintro _ ⟨x, rfl⟩
    refine Submodule.mem_sup.2 ⟨(φ x, 0), ⟨φ x, ⟨x, rfl⟩, rfl⟩, (0, ψ x),
      ⟨ψ x, ⟨x, rfl⟩, rfl⟩, by simp⟩
  calc finrank K (LinearMap.range (φ.prod ψ))
      ≤ finrank K ((LinearMap.range φ).map (LinearMap.inl K V₁ V₂) ⊔
          (LinearMap.range ψ).map (LinearMap.inr K V₁ V₂) : Submodule K (V₁ × V₂)) :=
        Submodule.finrank_mono h1
    _ ≤ finrank K ((LinearMap.range φ).map (LinearMap.inl K V₁ V₂)) +
          finrank K ((LinearMap.range ψ).map (LinearMap.inr K V₁ V₂)) :=
        Submodule.finrank_add_le_finrank_add_finrank _ _
    _ ≤ _ := add_le_add (Submodule.finrank_map_le _ _) (Submodule.finrank_map_le _ _)

/-- `p × q` as a submodule of `V₁ × V₂` is isomorphic to `p × q`. -/
def prodSubmoduleEquiv (p : Submodule K V₁) (q : Submodule K V₂) :
    (p.prod q) ≃ₗ[K] p × q where
  toFun x := (⟨x.1.1, x.2.1⟩, ⟨x.1.2, x.2.2⟩)
  invFun y := ⟨(y.1.1, y.2.1), ⟨y.1.2, y.2.2⟩⟩
  map_add' _ _ := rfl
  map_smul' _ _ := rfl
  left_inv _ := rfl
  right_inv _ := rfl

theorem finrank_prod_submodule (p : Submodule K V₁) (q : Submodule K V₂) :
    finrank K (p.prod q) = finrank K p + finrank K q := by
  rw [(prodSubmoduleEquiv p q).finrank_eq, Module.finrank_prod]

end FinrankLemmas

/-! ## Lemma B (= Paper Lemma 8, case k = 3) -/

section LemmaB

variable (alg : BilinearAlgorithm K 3 2 m r)

/-- `E_j`: vectors whose entries with index `≥ j` vanish. -/
def flag (j : ℕ) : Submodule K (Fin r → K) where
  carrier := {t | ∀ k : Fin r, j ≤ k.val → t k = 0}
  zero_mem' := fun _ _ => rfl
  add_mem' := fun ha hb k hk => by simp [ha k hk, hb k hk]
  smul_mem' := fun c t ht k hk => by simp [ht k hk]

/-- **Lemma B** (prose Section 5). If the decomposition is strongly normalized, then for every
subspace `S ≠ 0` of `F^{2×m}`: `dim(f_0(S) + f_1(S) + f_2(S)) ≥ dim S + 2`. -/
theorem lemma_B (h1 : SN1 alg) (h2 : SN2 alg) (S : Submodule K (Matrix (Fin 2) (Fin m) K))
    (hS : S ≠ ⊥) :
    finrank K S + 2 ≤
      finrank K (S.map (f alg 0) ⊔ S.map (f alg 1) ⊔ S.map (f alg 2) : Submodule K _) := by
  classical
  set X := S.map (f alg 0) with hXdef
  have hinj := G4_f0_injective alg h1
  -- existence of a nonzero element of `X` in some `E_j`
  obtain ⟨v₀, hv₀S, hv₀⟩ := (Submodule.ne_bot_iff S).1 hS
  have hex : ∃ j, ∃ w ∈ X, w ≠ 0 ∧ w ∈ flag (K := K) (r := r) j :=
    ⟨r, f alg 0 v₀, Submodule.mem_map_of_mem hv₀S,
      fun h => hv₀ (hinj (by rw [h, map_zero])), fun k hk => absurd k.isLt (by omega)⟩
  set j₀ := Nat.find hex with hj₀
  obtain ⟨w, hwX, hw0, hwE⟩ := Nat.find_spec hex
  replace hwE : w ∈ flag (K := K) (r := r) j₀ := hwE
  have hmin : ∀ j < j₀, ¬ ∃ w ∈ X, w ≠ 0 ∧ w ∈ flag (K := K) (r := r) j :=
    fun j hj => Nat.find_min hex hj
  have hj₀r : j₀ ≤ r := Nat.find_min' hex
    ⟨f alg 0 v₀, Submodule.mem_map_of_mem hv₀S,
      fun h => hv₀ (hinj (by rw [h, map_zero])), fun k hk => absurd k.isLt (by omega)⟩
  have hj₀pos : 0 < j₀ := by
    rcases Nat.eq_zero_or_pos j₀ with h | h
    · exfalso; apply hw0; funext k; exact hwE k (by rw [h]; exact Nat.zero_le _)
    · exact h
  set k₀ : Fin r := ⟨j₀ - 1, by omega⟩ with hk₀
  have hwk₀ : w k₀ ≠ 0 := by
    intro hz
    apply hmin (j₀ - 1) (by omega)
    refine ⟨w, hwX, hw0, fun k hk => ?_⟩
    rcases Nat.lt_or_ge k.val j₀ with h | h
    · have : k = k₀ := Fin.ext (by simp [hk₀]; omega)
      rw [this, hz]
    · exact hwE k h
  -- `X ∩ E_{j₀} ⊆ span {w}`
  have hXE : X ⊓ flag j₀ ≤ K ∙ w := by
    rintro w' ⟨hw'X, hw'E⟩
    rw [Submodule.mem_span_singleton]
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
  -- `w = f_0(v)` with `v ∈ S`, `v ≠ 0`
  obtain ⟨v, hvS, rfl⟩ := Submodule.mem_map.1 hwX
  have hv : v ≠ 0 := fun h => hw0 (by rw [h, map_zero])
  set T := Submodule.span K (Set.range ![f alg 0 v, f alg 1 v, f alg 2 v]) with hT
  have hTdim : finrank K T = 3 := by
    rw [hT, finrank_span_eq_card (h2 v hv)]; simp
  have hTE : T ≤ flag j₀ := by
    rw [hT, Submodule.span_le, Set.range_subset_iff]
    intro i k hk
    have hk0 : f alg 0 v k = 0 := hwE k hk
    rw [f_apply] at hk0
    have hb : bvec alg v k = 0 := by
      simp only [Pi.mul_apply] at hk0
      exact (mul_eq_zero.1 hk0).resolve_left (h1 k)
    fin_cases i <;> simp [f_apply, hb]
  have hXT : finrank K (X ⊓ T : Submodule K _) ≤ 1 := by
    calc finrank K (X ⊓ T : Submodule K _) ≤ finrank K (K ∙ f alg 0 v) :=
          Submodule.finrank_mono (le_trans (inf_le_inf_left X hTE) hXE)
      _ = 1 := finrank_span_singleton hw0
  have hXdim : finrank K X = finrank K S :=
    ((Submodule.equivMapOfInjective _ hinj S).finrank_eq).symm
  have hsup := Submodule.finrank_sup_add_finrank_inf_eq X T
  have hle : X ⊔ T ≤ X ⊔ S.map (f alg 1) ⊔ S.map (f alg 2) := by
    refine sup_le (le_sup_left.trans le_sup_left) ?_
    rw [hT, Submodule.span_le, Set.range_subset_iff]
    intro i
    fin_cases i
    · exact Submodule.mem_sup_left (Submodule.mem_sup_left (Submodule.mem_map_of_mem hvS))
    · exact Submodule.mem_sup_left (Submodule.mem_sup_right (Submodule.mem_map_of_mem hvS))
    · exact Submodule.mem_sup_right (Submodule.mem_map_of_mem hvS)
  have := Submodule.finrank_mono hle
  omega

end LemmaB

/-! ## Sections 6 to 8: the main construction -/

section Main

variable (alg : BilinearAlgorithm K 3 2 m r)

/-- `f_i` restricted to `U` (through `emb`). -/
def φ (i : Fin 3) : (Fin m → K) →ₗ[K] (Fin r → K) := (f alg i).comp emb

/-- `g` restricted to `U` (through `emb`). -/
def γ : (Fin m → K) →ₗ[K] (Fin r → K) := (g alg).comp emb

/-- `J = f_0(U)`. -/
def J : Submodule K (Fin r → K) := LinearMap.range (φ alg 0)

/-- The quotient map `F^R → F^R ⧸ J`; on `ker W` it is the map `K → Q = K/J`. -/
def π : (Fin r → K) →ₗ[K] (Fin r → K) ⧸ J alg := (J alg).mkQ

/-- `Q = K / J`, realised inside `F^R ⧸ J`. -/
def Kbar : Submodule K ((Fin r → K) ⧸ J alg) := (LinearMap.ker (W alg)).map (π alg)

/-- `F_i : U → Q`, `F_i(x) = [f_i(x)]`. -/
def Fq (i : Fin 3) : (Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg := (π alg).comp (φ alg i)

/-- `L : U² → Q`, `L(u_1, u_2) = F_1(u_1) + F_2(u_2)`. -/
def L : (Fin m → K) × (Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg := (Fq alg 1).coprod (Fq alg 2)

/-- `H : U → Q²`, `H(x) = (F_2(x), −F_1(x))`. -/
def H : (Fin m → K) →ₗ[K] ((Fin r → K) ⧸ J alg) × ((Fin r → K) ⧸ J alg) :=
  (Fq alg 2).prod (-(Fq alg 1))

/-- `N = ker H`. -/
def N : Submodule K (Fin m → K) := LinearMap.ker (H alg)

/-- The coordinate projections of `U² × U`. -/
def P1 : ((Fin m → K) × (Fin m → K)) × (Fin m → K) →ₗ[K] (Fin m → K) :=
  (LinearMap.fst K _ _).comp (LinearMap.fst K _ _)

def P2 : ((Fin m → K) × (Fin m → K)) × (Fin m → K) →ₗ[K] (Fin m → K) :=
  (LinearMap.snd K _ _).comp (LinearMap.fst K _ _)

def P3 : ((Fin m → K) × (Fin m → K)) × (Fin m → K) →ₗ[K] (Fin m → K) :=
  LinearMap.snd K _ _

/-- Second component of `Φ`: `[−g(u_1) + f_2(x)]`. -/
def Φ₂ : ((Fin m → K) × (Fin m → K)) × (Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg :=
  (π alg).comp ((φ alg 2).comp (P3 (K := K)) - (γ alg).comp (P1 (K := K)))

/-- Third component of `Φ`: `[−g(u_2) − f_1(x)]`. -/
def Φ₃ : ((Fin m → K) × (Fin m → K)) × (Fin m → K) →ₗ[K] (Fin r → K) ⧸ J alg :=
  (π alg).comp (-((γ alg).comp (P2 (K := K))) - (φ alg 1).comp (P3 (K := K)))

/-- `Φ(u_1, u_2, x) = ([ℓ(u_1, u_2)], [−g(u_1) + f_2(x)], [−g(u_2) − f_1(x)])`. -/
def Φ : ((Fin m → K) × (Fin m → K)) × (Fin m → K) →ₗ[K]
    ((Fin r → K) ⧸ J alg) × (((Fin r → K) ⧸ J alg) × ((Fin r → K) ⧸ J alg)) :=
  ((L alg).comp (LinearMap.fst K _ _)).prod ((Φ₂ alg).prod (Φ₃ alg))

theorem φ_apply (i : Fin 3) (y : Fin m → K) :
    φ alg i y = avec alg (e32 i 0) * bvec alg (emb y) := f_apply alg i _

theorem γ_apply (y : Fin m → K) :
    γ alg y = avec alg (e32 0 1) * bvec alg (emb y)
      - avec alg (e32 0 0) * bvec alg (Matrix.of ![y, 0]) := g_emb alg y

theorem π_eq_zero_iff (t : Fin r → K) : π alg t = 0 ↔ ∃ y, φ alg 0 y = t := by
  simp only [π, Submodule.mkQ_apply, Submodule.Quotient.mk_eq_zero, J, LinearMap.mem_range]

/-- **Lemma C.** For `x ∈ U`, `f_0(x), f_1(x), f_2(x), g(x) ∈ ker W`. -/
theorem lemma_C_f (i : Fin 3) (y : Fin m → K) : φ alg i y ∈ LinearMap.ker (W alg) := by
  rw [LinearMap.mem_ker, φ_apply, W_mul]
  ext a j
  simp [emb, unitMatrix, Matrix.mul_apply, Fin.sum_univ_two]

theorem lemma_C_g (y : Fin m → K) : γ alg y ∈ LinearMap.ker (W alg) := by
  rw [LinearMap.mem_ker, γ_apply, map_sub, W_mul, W_mul, sub_eq_zero]
  ext a j
  fin_cases a <;> simp [emb, unitMatrix, Matrix.mul_apply, Fin.sum_univ_two]

theorem J_le_ker : J alg ≤ LinearMap.ker (W alg) := by
  rintro _ ⟨y, rfl⟩; exact lemma_C_f alg 0 y

theorem φ0_injective (h1 : SN1 alg) : Function.Injective (φ alg 0) :=
  (G4_f0_injective alg h1).comp emb_injective

theorem finrank_J (h1 : SN1 alg) : finrank K (J alg) = m := by
  rw [J, LinearMap.finrank_range_of_inj (φ0_injective alg h1), Module.finrank_fin_fun]

/-- **Lemma C**, dimension part: `q = R − 4m`, in the form `q + 4m = R`. -/
theorem finrank_Kbar (h1 : SN1 alg) : finrank K (Kbar alg) + 4 * m = r := by
  have h := finrank_map_mkQ_add (LinearMap.ker (W alg)) (J alg) (J_le_ker alg)
  have h3 := G3_finrank_ker_W alg
  rw [finrank_J alg h1] at h
  simp only [Kbar, π]
  omega

theorem range_le_Kbar {V : Type*} [AddCommGroup V] [Module K V] (ψ : V →ₗ[K] (Fin r → K))
    (hψ : ∀ v, ψ v ∈ LinearMap.ker (W alg)) :
    LinearMap.range ((π alg).comp ψ) ≤ Kbar alg := by
  rw [LinearMap.range_comp]
  exact Submodule.map_mono (by rintro _ ⟨v, rfl⟩; exact hψ v)

theorem rank_L_le_q : finrank K (LinearMap.range (L alg)) ≤ finrank K (Kbar alg) := by
  have : LinearMap.range (L alg) ≤ Kbar alg := by
    have hL : L alg = (π alg).comp ((φ alg 1).coprod (φ alg 2)) := by
      ext y <;> simp [L, Fq]
    rw [hL]
    refine range_le_Kbar alg _ fun v => ?_
    simp only [LinearMap.coprod_apply]
    exact (LinearMap.ker (W alg)).add_mem (lemma_C_f alg 1 _) (lemma_C_f alg 2 _)
  exact Submodule.finrank_mono this

/-- **Lemma D** (skew cancellation). `D(e_{1,0}) f_2(x) − D(e_{2,0}) f_1(x) = 0`. -/
theorem lemma_D (x : Matrix (Fin 2) (Fin m) K) :
    avec alg (e32 1 0) * f alg 2 x - avec alg (e32 2 0) * f alg 1 x = 0 := by
  rw [f_apply, f_apply]; ring

/-- **Lemma E** (shift). `D(e_{i,0}) f_0(y) = D(e_{0,0}) f_i(y)`. -/
theorem lemma_E (i : Fin 3) (y : Matrix (Fin 2) (Fin m) K) :
    avec alg (e32 i 0) * f alg 0 y = avec alg (e32 0 0) * f alg i y := by
  rw [f_apply, f_apply]; ring

/-- **Lemma F** (= Paper Lemma 10). `ker Φ = {(0, 0, x) : x ∈ N}`. Uses SN1 only. -/
theorem lemma_F (h1 : SN1 alg) :
    LinearMap.ker (Φ alg) = (N alg).map (LinearMap.inr K ((Fin m → K) × (Fin m → K)) _) := by
  apply le_antisymm
  · rintro ⟨⟨u₁, u₂⟩, x⟩ hker
    rw [LinearMap.mem_ker] at hker
    simp only [Φ, LinearMap.prod_apply, Pi.prod, Prod.mk_eq_zero, LinearMap.comp_apply,
      LinearMap.fst_apply] at hker
    obtain ⟨hL, h2, h3⟩ := hker
    simp only [L, Fq, LinearMap.coprod_apply, LinearMap.comp_apply, ← map_add,
      π_eq_zero_iff] at hL
    simp only [Φ₂, Φ₃, LinearMap.comp_apply, π_eq_zero_iff, LinearMap.sub_apply,
      LinearMap.neg_apply, P1, P2, P3, LinearMap.fst_apply, LinearMap.snd_apply] at h2 h3
    obtain ⟨y₀, hy₀⟩ := hL
    obtain ⟨y₁, hy₁⟩ := h2
    obtain ⟨y₂, hy₂⟩ := h3
    simp only [φ_apply, γ_apply] at hy₀ hy₁ hy₂
    -- the combination `D(e_{0,1})·(1) + D(e_{1,0})·(2) + D(e_{2,0})·(3)`, divided by `D(e_{0,0})`
    have key : avec alg (e32 1 0) * bvec alg (Matrix.of ![u₁, 0])
        + avec alg (e32 2 0) * bvec alg (Matrix.of ![u₂, 0])
        = avec alg (e32 0 1) * bvec alg (emb y₀) + avec alg (e32 1 0) * bvec alg (emb y₁)
          + avec alg (e32 2 0) * bvec alg (emb y₂) := by
      apply cancel_left (c := avec alg (e32 0 0)) h1
      linear_combination (-(avec alg (e32 0 1))) * hy₀ - avec alg (e32 1 0) * hy₁
        - avec alg (e32 2 0) * hy₂
    have hW := congrArg (W alg) key
    simp only [map_add, W_mul] at hW
    have hu₁ : u₁ = 0 := by
      funext j
      have := congrFun (congrFun hW 1) j
      simpa [emb, unitMatrix, Matrix.mul_apply, Fin.sum_univ_two] using this
    have hu₂ : u₂ = 0 := by
      funext j
      have := congrFun (congrFun hW 2) j
      simpa [emb, unitMatrix, Matrix.mul_apply, Fin.sum_univ_two] using this
    subst hu₁ hu₂
    refine ⟨x, ?_, rfl⟩
    show H alg x = 0
    have hz : (Matrix.of ![(0 : Fin m → K), 0] : Matrix (Fin 2) (Fin m) K) = 0 := by
      ext i j; fin_cases i <;> rfl
    simp only [hz, map_zero, mul_zero, sub_zero, zero_sub, neg_zero] at hy₁ hy₂
    simp only [H, LinearMap.prod_apply, Pi.prod, Fq, LinearMap.comp_apply, LinearMap.neg_apply,
      Prod.mk_eq_zero, neg_eq_zero, π_eq_zero_iff]
    constructor
    · exact ⟨y₁, by rw [φ_apply, φ_apply]; exact hy₁⟩
    · exact ⟨-y₂, by rw [map_neg, φ_apply, φ_apply, hy₂, neg_neg]⟩
  · rintro _ ⟨x, hx, rfl⟩
    replace hx : H alg x = 0 := hx
    simp only [H, LinearMap.prod_apply, Pi.prod, Prod.mk_eq_zero, LinearMap.neg_apply, neg_eq_zero,
      Fq, LinearMap.comp_apply, Pi.prod] at hx
    show Φ alg ((0, 0), x) = 0
    simp only [Φ, Φ₂, Φ₃, L, Fq, LinearMap.prod_apply, Pi.prod, LinearMap.comp_apply, LinearMap.inr_apply,
      LinearMap.fst_apply, LinearMap.coprod_apply, LinearMap.sub_apply, LinearMap.neg_apply,
      P1, P2, P3, LinearMap.snd_apply, map_zero, map_sub, map_neg, hx.1, hx.2, sub_zero, neg_zero,
      add_zero, Prod.mk_eq_zero, and_self]

/-- **Fundamental inequality (G)** (Paper eq. (1), `n = 3`): `2m + rk H ≤ rk L + 2q`. -/
theorem ineq_G (h1 : SN1 alg) :
    2 * m + finrank K (LinearMap.range (H alg)) ≤
      finrank K (LinearMap.range (L alg)) + 2 * finrank K (Kbar alg) := by
  have hΦ := LinearMap.finrank_range_add_finrank_ker (Φ alg)
  simp only [Module.finrank_prod, Module.finrank_fin_fun] at hΦ
  have hker : finrank K (LinearMap.ker (Φ alg)) ≤ finrank K (N alg) := by
    rw [lemma_F alg h1]; exact Submodule.finrank_map_le _ _
  have hH := LinearMap.finrank_range_add_finrank_ker (H alg)
  rw [Module.finrank_fin_fun] at hH
  have hrange : finrank K (LinearMap.range (Φ alg)) ≤
      finrank K (LinearMap.range (L alg)) + (finrank K (Kbar alg) + finrank K (Kbar alg)) := by
    refine (finrank_range_prod_le _ _).trans (add_le_add ?_ ?_)
    · exact Submodule.finrank_mono (LinearMap.range_comp_le_range _ _)
    · refine (finrank_range_prod_le _ _).trans (add_le_add ?_ ?_)
      · refine Submodule.finrank_mono (range_le_Kbar alg _ fun v => ?_)
        exact (LinearMap.ker (W alg)).sub_mem (lemma_C_f alg 2 _) (lemma_C_g alg _)
      · refine Submodule.finrank_mono (range_le_Kbar alg _ fun v => ?_)
        exact (LinearMap.ker (W alg)).sub_mem
          ((LinearMap.ker (W alg)).neg_mem (lemma_C_g alg _)) (lemma_C_f alg 1 _)
  have : finrank K (N alg) = finrank K (LinearMap.ker (H alg)) := rfl
  omega

/-- **Lemma G** (= Paper Lemma 11, case d = 2): `2 rk H ≥ rk L`. -/
theorem lemma_G :
    finrank K (LinearMap.range (L alg)) ≤ 2 * finrank K (LinearMap.range (H alg)) := by
  have hL : finrank K (LinearMap.range (L alg)) ≤
      finrank K (LinearMap.range (Fq alg 1)) + finrank K (LinearMap.range (Fq alg 2)) := by
    rw [L, LinearMap.range_coprod]
    exact Submodule.finrank_add_le_finrank_add_finrank _ _
  have h2 : finrank K (LinearMap.range (Fq alg 2)) ≤ finrank K (LinearMap.range (H alg)) := by
    have : Fq alg 2 = (LinearMap.fst K _ _).comp (H alg) := by ext; simp [H]
    rw [this, LinearMap.range_comp]
    exact Submodule.finrank_map_le _ _
  have h1 : finrank K (LinearMap.range (Fq alg 1)) ≤ finrank K (LinearMap.range (H alg)) := by
    have : -Fq alg 1 = (LinearMap.snd K _ _).comp (H alg) := by ext; simp [H]
    rw [← LinearMap.range_neg, this, LinearMap.range_comp]
    exact Submodule.finrank_map_le _ _
  omega

/-- The subspace `S = {x ∈ N : f_1(x) ∈ f_0(N), f_2(x) ∈ f_0(N)}` of Section 8. -/
def Ssub : Submodule K (Fin m → K) :=
  N alg ⊓ ((N alg).map (φ alg 0)).comap (φ alg 1) ⊓ ((N alg).map (φ alg 0)).comap (φ alg 2)

theorem mem_N_iff (x : Fin m → K) :
    x ∈ N alg ↔ (∃ y, φ alg 0 y = φ alg 2 x) ∧ ∃ y, φ alg 0 y = φ alg 1 x := by
  show ((Fq alg 2) x, (-(Fq alg 1)) x) = 0 ↔ _
  rw [Prod.mk_eq_zero, LinearMap.neg_apply, neg_eq_zero, Fq, Fq, LinearMap.comp_apply,
    LinearMap.comp_apply, π_eq_zero_iff, π_eq_zero_iff]

/-- **Lemma H** (= Paper Lemma 12): `dim S ≥ dim N − Δ` with `Δ = 2 rk H − rk L`,
in the form `dim N + rk L ≤ dim S + 2 rk H`. -/
theorem lemma_H (h1 : SN1 alg) :
    finrank K (N alg) + finrank K (LinearMap.range (L alg)) ≤
      finrank K (Ssub alg) + 2 * finrank K (LinearMap.range (H alg)) := by
  classical
  have hinj := φ0_injective alg h1
  obtain ⟨ψ, hψ⟩ := (φ alg 0).exists_leftInverse_of_injective (LinearMap.ker_eq_bot.2 hinj)
  have hψ' : ∀ y, ψ (φ alg 0 y) = y := fun y => congrArg (fun F => F y) hψ
  -- `σ = (σ_1, σ_2)`, defined on all of `U` through the left inverse `ψ` of `f_0`
  set σ : (Fin m → K) →ₗ[K] (Fin m → K) × (Fin m → K) :=
    (ψ.comp (φ alg 2)).prod (ψ.comp (-(φ alg 1))) with hσ
  have hσ₁ : ∀ x ∈ N alg, φ alg 0 (σ x).1 = φ alg 2 x := by
    intro x hx
    obtain ⟨⟨y, hy⟩, -⟩ := (mem_N_iff alg x).1 hx
    simp [hσ, ← hy, hψ']
  have hσ₂ : ∀ x ∈ N alg, φ alg 0 (σ x).2 = -φ alg 1 x := by
    intro x hx
    obtain ⟨-, ⟨y, hy⟩⟩ := (mem_N_iff alg x).1 hx
    simp only [hσ, LinearMap.prod_apply, Pi.prod, LinearMap.comp_apply, LinearMap.neg_apply]
    rw [← hy, ← map_neg, hψ']
  -- Step 1: `σ(N) ⊆ ker ℓ ⊆ ker L`
  have step1 : (N alg).map σ ≤ LinearMap.ker (L alg) := by
    rintro _ ⟨x, hx, rfl⟩
    have e1 := hσ₁ x hx
    have e2 := hσ₂ x hx
    rw [φ_apply, φ_apply] at e1
    rw [φ_apply, φ_apply] at e2
    have hl : φ alg 1 (σ x).1 + φ alg 2 (σ x).2 = 0 := by
      apply cancel_left (c := avec alg (e32 0 0)) h1
      rw [φ_apply, φ_apply, mul_zero]
      linear_combination avec alg (e32 1 0) * e1 + avec alg (e32 2 0) * e2
    rw [LinearMap.mem_ker]
    simp only [L, Fq, LinearMap.coprod_apply, LinearMap.comp_apply, ← map_add, hl, map_zero]
  -- Step 2: `N × N ⊆ ker L`
  have step2 : (N alg).prod (N alg) ≤ LinearMap.ker (L alg) := by
    rintro ⟨a, b⟩ ⟨ha, hb⟩
    replace ha : H alg a = 0 := ha
    replace hb : H alg b = 0 := hb
    simp only [H, LinearMap.prod_apply, Pi.prod, Prod.mk_eq_zero] at ha hb
    show L alg (a, b) = 0
    simp only [L, LinearMap.coprod_apply, hb.1]
    have := ha.2
    simp only [LinearMap.neg_apply, neg_eq_zero] at this
    simp [this]
  -- Step 3: `N ∩ σ⁻¹(N × N) ⊆ S`
  set τ := ((N alg).prod (N alg)).mkQ.comp σ with hτ
  have step3 : N alg ⊓ LinearMap.ker τ ≤ Ssub alg := by
    rintro x ⟨hxN, hxτ⟩
    replace hxτ : τ x = 0 := hxτ
    rw [hτ, LinearMap.comp_apply, Submodule.mkQ_apply,
      Submodule.Quotient.mk_eq_zero] at hxτ
    obtain ⟨hs1, hs2⟩ := hxτ
    refine ⟨⟨hxN, ?_⟩, ?_⟩
    · refine ⟨-(σ x).2, (N alg).neg_mem hs2, ?_⟩
      rw [map_neg, hσ₂ x hxN, neg_neg]
    · exact ⟨(σ x).1, hs1, hσ₁ x hxN⟩
  -- Step 4: counting
  have c1 := finrank_map_add_finrank_inf_ker τ (N alg)
  have c2 : finrank K ((N alg).map τ) ≤
      finrank K ((LinearMap.ker (L alg)).map ((N alg).prod (N alg)).mkQ) := by
    apply Submodule.finrank_mono
    rw [hτ, Submodule.map_comp]
    exact Submodule.map_mono step1
  have c3 := finrank_map_mkQ_add (LinearMap.ker (L alg)) _ step2
  rw [finrank_prod_submodule] at c3
  have c4 := LinearMap.finrank_range_add_finrank_ker (L alg)
  rw [Module.finrank_prod, Module.finrank_fin_fun] at c4
  have c5 := LinearMap.finrank_range_add_finrank_ker (H alg)
  rw [Module.finrank_fin_fun] at c5
  have c6 := Submodule.finrank_mono step3
  have : finrank K (N alg) = finrank K (LinearMap.ker (H alg)) := rfl
  omega

/-- **Lemma I** (case distinction): `Δ ≥ min(2, dim N)`, i.e. `rk L + min(2, dim N) ≤ 2 rk H`. -/
theorem lemma_I (h1 : SN1 alg) (h2 : SN2 alg) :
    finrank K (LinearMap.range (L alg)) + min 2 (finrank K (N alg)) ≤
      2 * finrank K (LinearMap.range (H alg)) := by
  have hH := lemma_H alg h1
  by_cases hS : Ssub alg = ⊥
  · rw [hS, finrank_bot] at hH
    have := min_le_right 2 (finrank K (N alg))
    omega
  · -- Lemma B applied to `S` (as a subspace of `F^{2×m}`)
    have hS' : (Ssub alg).map emb ≠ ⊥ := by
      intro h
      apply hS
      rw [eq_bot_iff]
      intro x hx
      have : emb x ∈ (Ssub alg).map emb := Submodule.mem_map_of_mem hx
      rw [h, Submodule.mem_bot] at this
      rw [Submodule.mem_bot]
      exact emb_injective (by rw [this, map_zero])
    have hB := lemma_B alg h1 h2 _ hS'
    have hdimS : finrank K ((Ssub alg).map emb) = finrank K (Ssub alg) :=
      ((Submodule.equivMapOfInjective _ emb_injective _).finrank_eq).symm
    have hle : ((Ssub alg).map emb).map (f alg 0) ⊔ ((Ssub alg).map emb).map (f alg 1) ⊔
        ((Ssub alg).map emb).map (f alg 2) ≤ (N alg).map (φ alg 0) := by
      simp only [← Submodule.map_comp]
      refine sup_le (sup_le ?_ ?_) ?_
      · exact Submodule.map_mono (fun x hx => hx.1.1)
      · rintro _ ⟨x, hx, rfl⟩; exact hx.1.2
      · rintro _ ⟨x, hx, rfl⟩; exact hx.2
    have hN : finrank K ((N alg).map (φ alg 0)) = finrank K (N alg) :=
      ((Submodule.equivMapOfInjective _ (φ0_injective alg h1) _).finrank_eq).symm
    have := Submodule.finrank_mono hle
    have := min_le_left 2 (finrank K (N alg))
    omega

/-- **Main result of part 3.** For every field `K`, every `m ≥ 2` and every decomposition of
`⟨3,2,m⟩` of length `r` that satisfies SN1 and SN2: `5r ≥ 24m + 2`
(prose Section 8, "Abschluss"). -/
theorem yang_n3_of_stronglyNormalized (hm : 2 ≤ m) (h1 : SN1 alg) (h2 : SN2 alg) :
    24 * m + 2 ≤ 5 * r := by
  have hG := ineq_G alg h1
  have hq := finrank_Kbar alg h1
  have hLq := rank_L_le_q alg
  have hI := lemma_I alg h1 h2
  have hNH := LinearMap.finrank_range_add_finrank_ker (H alg)
  rw [Module.finrank_fin_fun] at hNH
  have : finrank K (N alg) = finrank K (LinearMap.ker (H alg)) := rfl
  rcases le_or_lt 2 (finrank K (N alg)) with hn | hn
  · rw [min_eq_left hn] at hI
    omega
  · have hqm : m ≤ finrank K (Kbar alg) := by omega
    omega

/-- The same, with the hypothesis bundled as `StronglyNormalized`. -/
theorem yang_n3_of_stronglyNormalized' (hm : 2 ≤ m) (h : StronglyNormalized alg) :
    24 * m + 2 ≤ 5 * r :=
  yang_n3_of_stronglyNormalized alg hm h.sn1 h.sn2

end Main

end YangN3Teil3
end YangBounds
