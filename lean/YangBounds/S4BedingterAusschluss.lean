import YangBounds.Basic
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.Degrees

/-!
# S4-07-D: conditional exclusion for `⟨3,2,7⟩` of length 34 (case e = 3 with (INJ5))

Task S4-18 (stage 4, track A, role: formaliser).
Claim file: `behauptungen/B-021.md`, statement D, **first sentence only**:

> In der Lage von S4-07-C gibt es kein Verfahren der Länge 34, falls zusätzlich gilt:
> (INJ5) aus w·F + u·G = 0 (als Vektor in K^34) mit deg F ≤ 5 und deg G ≤ 3 folgt
> F = 0 und G = 0.

Prose proof: `lean/prosa/s4_327_spurA_r2_bau.md`, Section 6 (6.2), using Section 2 ((A), (C),
(D), (C′)), 3.3 ((D′)), 4.1 and 4.2. Notation follows Section 1.2 of the prose.

## Setting in Lean

* `K` is an arbitrary field; `alg : BilinearAlgorithm K 3 2 7 34` (from `YangBounds/Basic.lean`)
  is an algorithm `A B = ∑_t α_t(A) β_t(B) C_t` of length 34 for `⟨3,2,7⟩`.
* Vectors in `K^34` are functions `Fin 34 → K`; the componentwise product `·` of the prose is
  the ring multiplication `*` of `Fin 34 → K`.
* `aVec alg i = (α_t(e_{i0}))_t`, `bVec alg i = (α_t(e_{i1}))_t`, `pVec alg k = (β_t(e_{0k}))_t`,
  `qVec alg k = (β_t(e_{1k}))_t` (prose 1.2: `a_i, b_i, p_k, q_k`). The prose indices
  `k = 1, …, 7` are `k : Fin 7` here; `i = 0, 1, 2` is `i : Fin 3`.
* `Wmap alg v = ∑_t v_t C_t`, `Kprime alg = ker W` (prose `K′`), `Jspace alg = span(q_1, …, q_7)`
  (prose `J`).
* Polynomials in the `a`-coordinates are **formal** polynomials
  `MvPolynomial (Fin 2) K` in the variables `X 0 ↔ a_1`, `X 1 ↔ a_2`; "deg" is `totalDegree`.
  `ev a₁ a₂ F` is the evaluation of `F` at the 34 `a`-points `(a_1(t), a_2(t))`, a vector in
  `K^34`. `mulP a₁ a₂ v d` is the prose `v·P_d = {v·f : f ∈ P_d}`.

## Hypotheses of `s4_07_D` and where they stand in the prose

| Lean hypothesis | Prose (`s4_327_spurA_r2_bau.md`) |
|---|---|
| `alg : BilinearAlgorithm K 3 2 7 34`, `K` any field | "Verfahren der Länge 34 für ⟨3,2,7⟩", 1.1 |
| `hnorm : ∀ t, alg.alpha t (unitMatrix 0 0) = 1` | Skalierung in 1.1: `a_0 = (1, …, 1)` |
| `w u : Fin 34 → K` | the vectors `w` (3.1) and `u` (4.1: `J = w·P_2 ⊕ ⟨u⟩`) |
| `hJ : Jspace alg = mulP a₁ a₂ w 2 ⊔ K ∙ u` | S4-07-C / 4.1: `J = w·P_2 ⊕ ⟨u⟩` (contains B(ii): `w·P_2 ⊆ J`) |
| `hK : Kprime alg ≤ J ⊔ a_1·J ⊔ a_2·J` | 1.2, from R-327 (`rk L = 6`): `K′ = J + a_1·J + a_2·J` |
| `hINJ5 : INJ5 a₁ a₂ w u` | (INJ5), as a statement about **formal** polynomials |

`INJ5 a₁ a₂ w u` says: for all `F G : MvPolynomial (Fin 2) K` with `totalDegree F ≤ 5`,
`totalDegree G ≤ 3` and `w * ev F + u * ev G = 0` (equality of vectors in `K^34`) we have
`F = 0` and `G = 0`. The hypothesis of the equation is an equation of evaluated vectors in
`K^34`; the conclusion is about the formal polynomials `F`, `G` themselves, not about their
evaluations. (A weaker reading, injectivity only on spaces of already evaluated functions,
would not suffice for the degree reduction in 6.2, steps 2 and 3.)

## What is derived inside the file instead of being assumed

* The Brent equations (A), (C), (D) of prose Section 2 for the needed index pairs
  (`brent`, `W_aq`, `W_ap`, `W_bq`): from `alg.correct` with matrix units.
* (C′) of Section 2 in the form used in 6.2 step 1 to 3 (`c_mul_mem_rep`):
  `c_i·j ∈ w·P_4 + u·P_2` for `j ∈ J`, `i = 1, 2`, with `c_i = b_i − a_i·b_0`.
* The inclusion `J + a_1·J + a_2·J ⊆ K′` (from (A), `aVec_mul_mem_Kprime`), so `hK` is the
  only half of the prose equality `K′ = J + a_1J + a_2J` that is assumed.
* From 4.1: `K′ ⊆ w·P_3 + u·P_1` (`Kprime_le_rep`) and `K″ ⊆ w·P_4 + u·P_2` (in the form
  `c_mul_mem_rep`). The *directness* of the sums in 4.1 (unique polynomial representation,
  prose "eindeutig") is a consequence of (INJ5) (`rep_unique`), so it is not assumed.
  The dimension statements of S4-07-C (`dim w·P_2 = 6`, `dim K′ = 13`, `dim K″ = 21`) are not
  used.
* (D′) of 3.3 is used only for one element of `J³_0`, namely
  `(j_0, j_1, j_2) = (0, w·a_2, −w·a_1)` (it lies in `ker L`, prose 4.2, `h`-part). Its
  `Θ`-value is `c_1·w·a_2 − c_2·w·a_1`; the Lean proof shows this lies in `K′` and gets the
  contradiction directly from (D) (`W_b_eq_zero`), together with `w·a_2 ≠ 0` (from (INJ5)).

## How the Lean proof runs (prose 6.2)

Steps 1 to 3 of 6.2 are `c_mul_w_mem_rep20`: from (C′) and (INJ5), `c_i·w = w·C_i + u·E_i`
with `deg C_i ≤ 2` and `E_i` constant. Steps 4 and 5 of 6.2 (homogeneous parts, divisibility
in `K[a_1, a_2]`) are **not needed** for the single element above: with `deg C_i ≤ 2` and
`E_i` constant, `c_i·w ∈ w·P_2 + K·u = J`, so `c_1·w·a_2 − c_2·w·a_1 ∈ a_2·J + a_1·J ⊆ K′`
by (A). The rest of the prose argument (all of `J³_0`) gives a stronger intermediate statement
that the Lean theorem does not need.

## What the Lean theorem does NOT contain

* The derivation of the setting ("Lage von S4-07-C") from the residual case: B-017 to B-019
  (restfall R-327, normal form R1, R2, Lemma A of `yang_n3.md`), the existence of `w` (3.1),
  the case distinction `e ≤ 3` and the choice of `u`. These enter only as the hypotheses
  `hnorm`, `hJ`, `hK`.
* The second sentence of S4-07-D ("Gleichwertig gesagt: …").
* Any statement about whether (INJ5) can hold for an actual algorithm.
* Statements A, B, C, E of B-021 as such (only the parts listed above are derived).

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace S4BedingterAusschluss

open MvPolynomial

universe u

variable {K : Type u} [Field K]

/-! ## Polynomials evaluated at the `a`-points -/

section Poly

variable {T : Type*}

/-- Evaluation of a formal polynomial in `X 0 ↔ a_1`, `X 1 ↔ a_2` at the points
`(a_1(t), a_2(t))`, as a vector indexed by `T`. -/
noncomputable def ev (a₁ a₂ : T → K) : MvPolynomial (Fin 2) K →ₐ[K] (T → K) :=
  aeval ![a₁, a₂]

@[simp] theorem ev_X0 (a₁ a₂ : T → K) : ev a₁ a₂ (X 0) = a₁ := by
  simp [ev]

@[simp] theorem ev_X1 (a₁ a₂ : T → K) : ev a₁ a₂ (X 1) = a₂ := by
  simp [ev]

/-- The prose `v·P_d`: all vectors `v·f` with `f` a polynomial of degree `≤ d` in `a_1, a_2`. -/
noncomputable def mulP (a₁ a₂ v : T → K) (d : ℕ) : Submodule K (T → K) :=
  (restrictTotalDegree (Fin 2) K d).map
    ((LinearMap.mulLeft K v) ∘ₗ (ev a₁ a₂).toLinearMap)

/-- `w·P_m + u·P_n`. -/
noncomputable def rep (a₁ a₂ w u : T → K) (m n : ℕ) : Submodule K (T → K) :=
  mulP a₁ a₂ w m ⊔ mulP a₁ a₂ u n

/-- (INJ5) as a statement about formal polynomials: from `w·F + u·G = 0` (as a vector) with
`deg F ≤ 5` and `deg G ≤ 3` it follows that `F = 0` and `G = 0`. -/
def INJ5 (a₁ a₂ w u : T → K) : Prop :=
  ∀ F G : MvPolynomial (Fin 2) K, F.totalDegree ≤ 5 → G.totalDegree ≤ 3 →
    w * ev a₁ a₂ F + u * ev a₁ a₂ G = 0 → F = 0 ∧ G = 0

variable {a₁ a₂ w u : T → K}

theorem mem_mulP {v x : T → K} {d : ℕ} :
    x ∈ mulP a₁ a₂ v d ↔ ∃ F : MvPolynomial (Fin 2) K, F.totalDegree ≤ d ∧ v * ev a₁ a₂ F = x := by
  simp only [mulP, Submodule.mem_map, mem_restrictTotalDegree, LinearMap.coe_comp,
    Function.comp_apply, AlgHom.toLinearMap_apply, LinearMap.mulLeft_apply]

theorem mem_rep {x : T → K} {m n : ℕ} :
    x ∈ rep a₁ a₂ w u m n ↔ ∃ F G : MvPolynomial (Fin 2) K,
      F.totalDegree ≤ m ∧ G.totalDegree ≤ n ∧ w * ev a₁ a₂ F + u * ev a₁ a₂ G = x := by
  simp only [rep, Submodule.mem_sup, mem_mulP]
  constructor
  · rintro ⟨_, ⟨F, hF, rfl⟩, _, ⟨G, hG, rfl⟩, rfl⟩
    exact ⟨F, G, hF, hG, rfl⟩
  · rintro ⟨F, G, hF, hG, rfl⟩
    exact ⟨_, ⟨F, hF, rfl⟩, _, ⟨G, hG, rfl⟩, rfl⟩

theorem rep_mono {m n m' n' : ℕ} (hm : m ≤ m') (hn : n ≤ n') :
    rep a₁ a₂ w u m n ≤ rep a₁ a₂ w u m' n' := by
  intro x hx
  obtain ⟨F, G, hF, hG, rfl⟩ := mem_rep.mp hx
  exact mem_rep.mpr ⟨F, G, hF.trans hm, hG.trans hn, rfl⟩

/-- Multiplication by `a_1` or `a_2` raises both degree bounds by one. -/
theorem X_mul_mem_rep (i : Fin 2) {x : T → K} {m n : ℕ} (hx : x ∈ rep a₁ a₂ w u m n) :
    ev a₁ a₂ (X i) * x ∈ rep a₁ a₂ w u (m + 1) (n + 1) := by
  obtain ⟨F, G, hF, hG, rfl⟩ := mem_rep.mp hx
  refine mem_rep.mpr ⟨X i * F, X i * G, ?_, ?_, ?_⟩
  · refine (totalDegree_mul _ _).trans ?_
    rw [totalDegree_X]; omega
  · refine (totalDegree_mul _ _).trans ?_
    rw [totalDegree_X]; omega
  · simp only [map_mul]; ring

theorem a₁_mul_mem_rep {x : T → K} {m n : ℕ} (hx : x ∈ rep a₁ a₂ w u m n) :
    a₁ * x ∈ rep a₁ a₂ w u (m + 1) (n + 1) := by
  simpa using X_mul_mem_rep (a₁ := a₁) (a₂ := a₂) 0 hx

theorem a₂_mul_mem_rep {x : T → K} {m n : ℕ} (hx : x ∈ rep a₁ a₂ w u m n) :
    a₂ * x ∈ rep a₁ a₂ w u (m + 1) (n + 1) := by
  simpa using X_mul_mem_rep (a₁ := a₁) (a₂ := a₂) 1 hx

/-- Directness of `w·P_m + u·P_n` for `m ≤ 5`, `n ≤ 3` (prose 4.1, "eindeutig"),
as a consequence of (INJ5). -/
theorem rep_unique (hinj : INJ5 a₁ a₂ w u) {F G F' G' : MvPolynomial (Fin 2) K}
    (hF : F.totalDegree ≤ 5) (hG : G.totalDegree ≤ 3)
    (hF' : F'.totalDegree ≤ 5) (hG' : G'.totalDegree ≤ 3)
    (h : w * ev a₁ a₂ F + u * ev a₁ a₂ G = w * ev a₁ a₂ F' + u * ev a₁ a₂ G') :
    F = F' ∧ G = G' := by
  have h1 := hinj (F - F') (G - G')
    ((totalDegree_sub _ _).trans (max_le hF hF'))
    ((totalDegree_sub _ _).trans (max_le hG hG'))
    (by simp only [map_sub]; linear_combination h)
  exact ⟨sub_eq_zero.mp h1.1, sub_eq_zero.mp h1.2⟩

/-- A degree bound for `X i * p` gives a degree bound for `p`. -/
theorem totalDegree_le_of_X_mul {i : Fin 2} {p : MvPolynomial (Fin 2) K} {d : ℕ}
    (h : (X i * p).totalDegree ≤ d + 1) : p.totalDegree ≤ d := by
  unfold totalDegree
  apply Finset.sup_le
  intro s hs
  have hs' : Finsupp.single i 1 + s ∈ (X i * p).support := by
    rw [mem_support_iff, coeff_X_mul]
    exact mem_support_iff.mp hs
  have h2 := (le_totalDegree hs').trans h
  rw [Finsupp.sum_add_index' (fun _ => rfl) (fun _ _ _ => rfl),
    Finsupp.sum_single_index rfl] at h2
  omega

/-- One reduction step of prose 6.2 (steps 2 and 3): if `v = w·C + u·E` with
`deg C ≤ 4`, `deg E ≤ 2` and `a_1·v ∈ w·P_4 + u·P_2`, then (INJ5) forces
`deg (a_1 C) ≤ 4` and `deg (a_1 E) ≤ 2` (as formal polynomials). -/
theorem reduce_step (hinj : INJ5 a₁ a₂ w u) {C E : MvPolynomial (Fin 2) K}
    (hC : C.totalDegree ≤ 4) (hE : E.totalDegree ≤ 2)
    (h : a₁ * (w * ev a₁ a₂ C + u * ev a₁ a₂ E) ∈ rep a₁ a₂ w u 4 2) :
    (X 0 * C).totalDegree ≤ 4 ∧ (X 0 * E).totalDegree ≤ 2 := by
  obtain ⟨C', E', hC', hE', hrep⟩ := mem_rep.mp h
  have hXC : (X 0 * C).totalDegree ≤ 5 := by
    refine (totalDegree_mul _ _).trans ?_
    rw [totalDegree_X]; omega
  have hXE : (X 0 * E).totalDegree ≤ 3 := by
    refine (totalDegree_mul _ _).trans ?_
    rw [totalDegree_X]; omega
  have hu := rep_unique hinj hXC hXE (hC'.trans (by norm_num)) (hE'.trans (by norm_num))
    (by rw [hrep]; simp only [map_mul, ev_X0]; ring)
  exact ⟨hu.1 ▸ hC', hu.2 ▸ hE'⟩

/-- Prose 6.2, steps 1 to 3: if `c·w`, `c·w·a_1`, `c·w·a_1²` all lie in `w·P_4 + u·P_2`, then
under (INJ5) `c·w = w·C + u·E` with `deg C ≤ 2` and `E` constant. -/
theorem mem_rep20_of (hinj : INJ5 a₁ a₂ w u) {c : T → K}
    (h0 : c * w ∈ rep a₁ a₂ w u 4 2)
    (h1 : a₁ * (c * w) ∈ rep a₁ a₂ w u 4 2)
    (h2 : a₁ * (a₁ * (c * w)) ∈ rep a₁ a₂ w u 4 2) :
    c * w ∈ rep a₁ a₂ w u 2 0 := by
  obtain ⟨C, E, hC, hE, hCE⟩ := mem_rep.mp h0
  rw [← hCE] at h1 h2
  obtain ⟨hC1, hE1⟩ := reduce_step hinj hC hE h1
  have h2' : a₁ * (w * ev a₁ a₂ (X 0 * C) + u * ev a₁ a₂ (X 0 * E)) ∈ rep a₁ a₂ w u 4 2 := by
    convert h2 using 2
    simp only [map_mul, ev_X0]; ring
  obtain ⟨hC2, hE2⟩ := reduce_step hinj hC1 hE1 h2'
  have hC3 : C.totalDegree ≤ 2 :=
    totalDegree_le_of_X_mul (i := 0) (d := 2)
      (totalDegree_le_of_X_mul (i := 0) (p := X 0 * C) (d := 3) hC2)
  have hE3 : E.totalDegree ≤ 0 :=
    totalDegree_le_of_X_mul (i := 0) (d := 0)
      (totalDegree_le_of_X_mul (i := 0) (p := X 0 * E) (d := 1) hE2)
  exact mem_rep.mpr ⟨C, E, hC3, hE3, hCE⟩

end Poly

/-! ## Vectors and spaces of an algorithm for `⟨3,2,m⟩` (prose 1.2) -/

section Alg

variable {m r : ℕ} (alg : BilinearAlgorithm K 3 2 m r)

/-- `a_i = (α_t(e_{i0}))_t`. -/
def aVec (i : Fin 3) : Fin r → K := fun t => alg.alpha t (unitMatrix i 0)

/-- `b_i = (α_t(e_{i1}))_t`. -/
def bVec (i : Fin 3) : Fin r → K := fun t => alg.alpha t (unitMatrix i 1)

/-- `p_k = (β_t(e_{0k}))_t`. -/
def pVec (k : Fin m) : Fin r → K := fun t => alg.beta t (unitMatrix 0 k)

/-- `q_k = (β_t(e_{1k}))_t`. -/
def qVec (k : Fin m) : Fin r → K := fun t => alg.beta t (unitMatrix 1 k)

/-- `W(v) = ∑_t v_t C_t`. -/
def Wmap : (Fin r → K) →ₗ[K] Matrix (Fin 3) (Fin m) K where
  toFun v := ∑ t, v t • alg.coeff t
  map_add' v v' := by simp [add_smul, Finset.sum_add_distrib]
  map_smul' c v := by simp [Finset.smul_sum, smul_smul]

/-- `K′ = ker W`. -/
def Kprime : Submodule K (Fin r → K) := LinearMap.ker (Wmap alg)

/-- `J = span(q_1, …, q_m)`. -/
def Jspace : Submodule K (Fin r → K) := Submodule.span K (Set.range (qVec alg))

/-- The algorithm identity, read through `W`: `W((α_t(A))_t · (β_t(B))_t) = A B`. -/
theorem brent (A : Matrix (Fin 3) (Fin 2) K) (B : Matrix (Fin 2) (Fin m) K) :
    Wmap alg ((fun t => alg.alpha t A) * (fun t => alg.beta t B)) = A * B := by
  rw [alg.correct A B]
  rfl

theorem unitMatrix_mul_unitMatrix (i : Fin 3) (j j' : Fin 2) (k : Fin m) :
    (unitMatrix i j : Matrix (Fin 3) (Fin 2) K) * unitMatrix j' k =
      if j = j' then unitMatrix i k else 0 := by
  ext a b
  simp only [Matrix.mul_apply, unitMatrix, Matrix.of_apply, Fin.sum_univ_two]
  by_cases h : j = j'
  · subst h
    fin_cases j <;> by_cases ha : a = i <;> by_cases hb : b = k <;> simp [ha, hb]
  · fin_cases j <;> fin_cases j' <;> simp_all

/-- Brent equation (A): `W(a_i·q_k) = 0`. -/
theorem W_aq (i : Fin 3) (k : Fin m) : Wmap alg (aVec alg i * qVec alg k) = 0 := by
  show Wmap alg ((fun t => alg.alpha t (unitMatrix i 0)) * (fun t => alg.beta t (unitMatrix 1 k))) = 0
  rw [brent, unitMatrix_mul_unitMatrix]; simp

/-- `W(a_i·p_k) = e_{ik}`. -/
theorem W_ap (i : Fin 3) (k : Fin m) : Wmap alg (aVec alg i * pVec alg k) = unitMatrix i k := by
  show Wmap alg ((fun t => alg.alpha t (unitMatrix i 0)) * (fun t => alg.beta t (unitMatrix 0 k))) = _
  rw [brent, unitMatrix_mul_unitMatrix]; simp

/-- `W(b_i·q_k) = e_{ik}`. -/
theorem W_bq (i : Fin 3) (k : Fin m) : Wmap alg (bVec alg i * qVec alg k) = unitMatrix i k := by
  show Wmap alg ((fun t => alg.alpha t (unitMatrix i 1)) * (fun t => alg.beta t (unitMatrix 1 k))) = _
  rw [brent, unitMatrix_mul_unitMatrix]; simp

theorem mem_Jspace {j : Fin r → K} :
    j ∈ Jspace alg ↔ ∃ y : Fin m → K, ∑ k, y k • qVec alg k = j :=
  Submodule.mem_span_range_iff_exists_fun K

theorem W_mul_sum (x : Fin r → K) (v : Fin m → Fin r → K) (y : Fin m → K) :
    Wmap alg (x * ∑ k, y k • v k) = ∑ k, y k • Wmap alg (x * v k) := by
  rw [Finset.mul_sum, map_sum]
  simp only [mul_smul_comm, map_smul]

/-- (A) for all of `J`: `a_i·J ⊆ K′`. -/
theorem aVec_mul_mem_Kprime (i : Fin 3) {j : Fin r → K} (hj : j ∈ Jspace alg) :
    aVec alg i * j ∈ Kprime alg := by
  obtain ⟨y, rfl⟩ := (mem_Jspace alg).mp hj
  show Wmap alg _ = 0
  rw [W_mul_sum]
  simp [W_aq]

/-- (C) for combinations: with `j = ∑ y_k q_k` and `π = ∑ y_k p_k`,
`a_i·π − b_i·j ∈ K′`. -/
theorem C_mem_Kprime (i : Fin 3) (y : Fin m → K) :
    aVec alg i * (∑ k, y k • pVec alg k) - bVec alg i * (∑ k, y k • qVec alg k)
      ∈ Kprime alg := by
  show Wmap alg _ = 0
  rw [map_sub, W_mul_sum, W_mul_sum]
  simp [W_ap, W_bq]

/-- (D) for the element `b_1·j_1 + b_2·j_2`: if its `W`-image vanishes, then `j_1 = 0`. -/
theorem W_b_eq_zero {j₁ j₂ : Fin r → K} (h₁ : j₁ ∈ Jspace alg) (h₂ : j₂ ∈ Jspace alg)
    (h : Wmap alg (bVec alg 1 * j₁ + bVec alg 2 * j₂) = 0) : j₁ = 0 := by
  obtain ⟨y, rfl⟩ := (mem_Jspace alg).mp h₁
  obtain ⟨z, rfl⟩ := (mem_Jspace alg).mp h₂
  rw [map_add, W_mul_sum, W_mul_sum] at h
  simp only [W_bq] at h
  have hy : ∀ k, y k = 0 := by
    intro k
    have := congrFun (congrFun h 1) k
    simp [Matrix.sum_apply, unitMatrix, Finset.sum_ite_eq'] at this
    simpa using this
  simp [hy]

end Alg

/-! ## The conditional exclusion -/

section Main

variable {m r : ℕ} (alg : BilinearAlgorithm K 3 2 m r)

/-- `c_i = b_i − a_i·b_0` (prose 1.2). -/
def cVec (i : Fin 3) : Fin r → K := bVec alg i - aVec alg i * bVec alg 0

variable {alg} {w u : Fin r → K}

/-- `K′ ⊆ w·P_3 + u·P_1`, from `K′ ⊆ J + a_1J + a_2J` and `J ⊆ w·P_2 + u·P_0`. -/
theorem Kprime_le_rep
    (hJ : Jspace alg ≤ rep (aVec alg 1) (aVec alg 2) w u 2 0)
    (hK : Kprime alg ≤ Jspace alg ⊔ (Jspace alg).map (LinearMap.mulLeft K (aVec alg 1)) ⊔
      (Jspace alg).map (LinearMap.mulLeft K (aVec alg 2))) :
    Kprime alg ≤ rep (aVec alg 1) (aVec alg 2) w u 3 1 := by
  refine hK.trans (sup_le (sup_le ?_ ?_) ?_)
  · exact hJ.trans (rep_mono (by norm_num) (by norm_num))
  · rintro _ ⟨j, hj, rfl⟩
    exact a₁_mul_mem_rep (hJ hj)
  · rintro _ ⟨j, hj, rfl⟩
    exact a₂_mul_mem_rep (hJ hj)

/-- (C′) in the form of prose 6.2 step 1: for `j ∈ J` and `i = 1, 2`,
`c_i·j ≡ a_i·κ(j) (mod K′)` with `κ(j) ∈ K′`, hence `c_i·j ∈ K″ ⊆ w·P_4 + u·P_2`. -/
theorem c_mul_mem_rep (hnorm : ∀ t, alg.alpha t (unitMatrix 0 0) = 1)
    (hKr : Kprime alg ≤ rep (aVec alg 1) (aVec alg 2) w u 3 1)
    (i : Fin 3) (hi : i = 1 ∨ i = 2) {j : Fin r → K} (hj : j ∈ Jspace alg) :
    cVec alg i * j ∈ rep (aVec alg 1) (aVec alg 2) w u 4 2 := by
  obtain ⟨y, rfl⟩ := (mem_Jspace alg).mp hj
  set π := ∑ k, y k • pVec alg k
  set jj := ∑ k, y k • qVec alg k
  have ha0 : aVec alg 0 = 1 := funext hnorm
  -- κ := π − b_0·j ∈ K′ (prose: p_k = b_0·q_k + κ_k)
  have hκ : π - bVec alg 0 * jj ∈ Kprime alg := by
    have := C_mem_Kprime alg 0 y
    rwa [ha0, one_mul] at this
  have hx : aVec alg i * π - bVec alg i * jj ∈ Kprime alg := C_mem_Kprime alg i y
  have heq : cVec alg i * jj =
      aVec alg i * (π - bVec alg 0 * jj) - (aVec alg i * π - bVec alg i * jj) := by
    simp only [cVec]; ring
  rw [heq]
  refine Submodule.sub_mem _ ?_ (rep_mono (by norm_num) (by norm_num) (hKr hx))
  rcases hi with rfl | rfl
  · exact a₁_mul_mem_rep (hKr hκ)
  · exact a₂_mul_mem_rep (hKr hκ)

/-- Prose 6.2 steps 1 to 3: under (INJ5), `c_i·w ∈ w·P_2 + u·P_0` for `i = 1, 2`. -/
theorem c_mul_w_mem_rep20 (hnorm : ∀ t, alg.alpha t (unitMatrix 0 0) = 1)
    (hKr : Kprime alg ≤ rep (aVec alg 1) (aVec alg 2) w u 3 1)
    (hwJ : mulP (aVec alg 1) (aVec alg 2) w 2 ≤ Jspace alg)
    (hinj : INJ5 (aVec alg 1) (aVec alg 2) w u)
    (i : Fin 3) (hi : i = 1 ∨ i = 2) :
    cVec alg i * w ∈ rep (aVec alg 1) (aVec alg 2) w u 2 0 := by
  set a₁ := aVec alg 1
  have hw : ∀ F : MvPolynomial (Fin 2) K, F.totalDegree ≤ 2 →
      w * ev a₁ (aVec alg 2) F ∈ Jspace alg := fun F hF => hwJ (mem_mulP.mpr ⟨F, hF, rfl⟩)
  have j0 : w ∈ Jspace alg := by simpa using hw 1 (by simp)
  have j1 : w * a₁ ∈ Jspace alg := by
    simpa using hw (X 0) (by rw [totalDegree_X]; norm_num)
  have j2 : w * (a₁ * a₁) ∈ Jspace alg := by
    simpa using hw (X 0 * X 0)
      ((totalDegree_mul _ _).trans (by rw [totalDegree_X]))
  apply mem_rep20_of hinj
  · exact c_mul_mem_rep hnorm hKr i hi j0
  · have := c_mul_mem_rep hnorm hKr i hi j1
    convert this using 1; ring
  · have := c_mul_mem_rep hnorm hKr i hi j2
    convert this using 1; ring

/-- `w·P_2 + u·P_0 ⊆ J` when `J = w·P_2 + K·u`. -/
theorem rep20_le (hJ : Jspace alg = mulP (aVec alg 1) (aVec alg 2) w 2 ⊔ K ∙ u) :
    rep (aVec alg 1) (aVec alg 2) w u 2 0 ≤ Jspace alg := by
  intro x hx
  obtain ⟨F, G, hF, hG, rfl⟩ := mem_rep.mp hx
  rw [hJ]
  refine Submodule.add_mem _ (Submodule.mem_sup_left (mem_mulP.mpr ⟨F, hF, rfl⟩))
    (Submodule.mem_sup_right ?_)
  have hG0 : G = C (coeff 0 G) := totalDegree_eq_zero_iff_eq_C.mp (Nat.le_zero.mp hG)
  rw [hG0, Submodule.mem_span_singleton]
  refine ⟨coeff 0 G, ?_⟩
  ext t
  simp [ev, mul_comm]

/-- `J ⊆ w·P_2 + u·P_0` when `J = w·P_2 + K·u`. -/
theorem le_rep20 (hJ : Jspace alg = mulP (aVec alg 1) (aVec alg 2) w 2 ⊔ K ∙ u) :
    Jspace alg ≤ rep (aVec alg 1) (aVec alg 2) w u 2 0 := by
  rw [hJ]
  refine sup_le le_sup_left ?_
  rw [Submodule.span_le, Set.singleton_subset_iff]
  exact mem_rep.mpr ⟨0, 1, by simp, by simp, by simp⟩

/-- **S4-07-D, first sentence, for `⟨3,2,m⟩` and any length `r`.** -/
theorem s4_07_D_allg
    (hnorm : ∀ t, alg.alpha t (unitMatrix 0 0) = 1)
    (hJ : Jspace alg = mulP (aVec alg 1) (aVec alg 2) w 2 ⊔ K ∙ u)
    (hK : Kprime alg ≤ Jspace alg ⊔ (Jspace alg).map (LinearMap.mulLeft K (aVec alg 1)) ⊔
      (Jspace alg).map (LinearMap.mulLeft K (aVec alg 2)))
    (hINJ5 : INJ5 (aVec alg 1) (aVec alg 2) w u) : False := by
  set a₁ := aVec alg 1
  set a₂ := aVec alg 2
  have hJr := le_rep20 hJ
  have hrJ := rep20_le hJ
  have hwJ : mulP a₁ a₂ w 2 ≤ Jspace alg := hJ ▸ le_sup_left
  have hKr := Kprime_le_rep hJr hK
  -- prose 6.2 steps 1 to 3
  have hc1 := c_mul_w_mem_rep20 hnorm hKr hwJ hINJ5 1 (Or.inl rfl)
  have hc2 := c_mul_w_mem_rep20 hnorm hKr hwJ hINJ5 2 (Or.inr rfl)
  -- the element (0, w·a_2, −w·a_1) of J³_0 and its Θ-value
  have hj1 : w * a₂ ∈ Jspace alg := hwJ (mem_mulP.mpr ⟨X 1, by rw [totalDegree_X]; norm_num, by simp⟩)
  have hj2 : -(w * a₁) ∈ Jspace alg :=
    Submodule.neg_mem _ (hwJ (mem_mulP.mpr ⟨X 0, by rw [totalDegree_X]; norm_num, by simp⟩))
  have hΘ : bVec alg 1 * (w * a₂) + bVec alg 2 * -(w * a₁) =
      a₂ * (cVec alg 1 * w) - a₁ * (cVec alg 2 * w) := by
    simp only [cVec, a₁, a₂]; ring
  have hΘK : bVec alg 1 * (w * a₂) + bVec alg 2 * -(w * a₁) ∈ Kprime alg := by
    rw [hΘ]
    exact Submodule.sub_mem _ (aVec_mul_mem_Kprime alg 2 (hrJ hc1))
      (aVec_mul_mem_Kprime alg 1 (hrJ hc2))
  -- (D): w·a_2 = 0
  have hzero : w * a₂ = 0 := W_b_eq_zero alg hj1 hj2 hΘK
  -- but (INJ5) with F = X 1, G = 0 gives X 1 = 0
  have := (hINJ5 (X 1) 0 (by rw [totalDegree_X]; norm_num) (by simp)
    (by simpa using hzero)).1
  exact X_ne_zero 1 this

/-- **S4-07-D (first sentence).** In the setting of S4-07-C there is no algorithm of length 34
for `⟨3,2,7⟩` if (INJ5) holds in addition. Here the setting of S4-07-C is given by the named
hypotheses `hnorm` (`a_0 = 1`), `hJ` (`J = w·P_2 ⊕ ⟨u⟩`) and `hK` (`K′ ⊆ J + a_1J + a_2J`),
see the table in the module header; (INJ5) is about formal polynomials. Over every field. -/
theorem s4_07_D (alg : BilinearAlgorithm K 3 2 7 34)
    (hnorm : ∀ t, alg.alpha t (unitMatrix 0 0) = 1)
    (w u : Fin 34 → K)
    (hJ : Jspace alg = mulP (aVec alg 1) (aVec alg 2) w 2 ⊔ K ∙ u)
    (hK : Kprime alg ≤ Jspace alg ⊔ (Jspace alg).map (LinearMap.mulLeft K (aVec alg 1)) ⊔
      (Jspace alg).map (LinearMap.mulLeft K (aVec alg 2)))
    (hINJ5 : INJ5 (aVec alg 1) (aVec alg 2) w u) : False :=
  s4_07_D_allg hnorm hJ hK hINJ5

/-- The same as a non-existence statement. -/
theorem s4_07_D_keinVerfahren :
    ¬ ∃ (alg : BilinearAlgorithm K 3 2 7 34) (w u : Fin 34 → K),
      (∀ t, alg.alpha t (unitMatrix 0 0) = 1) ∧
      Jspace alg = mulP (aVec alg 1) (aVec alg 2) w 2 ⊔ (K ∙ u) ∧
      Kprime alg ≤ Jspace alg ⊔ (Jspace alg).map (LinearMap.mulLeft K (aVec alg 1)) ⊔
        (Jspace alg).map (LinearMap.mulLeft K (aVec alg 2)) ∧
      INJ5 (aVec alg 1) (aVec alg 2) w u := by
  rintro ⟨alg, w, u, hnorm, hJ, hK, hINJ5⟩
  exact s4_07_D alg hnorm w u hJ hK hINJ5

end Main

end S4BedingterAusschluss
end YangBounds
