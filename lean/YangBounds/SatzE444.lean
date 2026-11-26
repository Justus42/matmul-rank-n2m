module

public import YangBounds.SatzA444
public import YangBounds.SatzB444Final
public import Mathlib.FieldTheory.IsAlgClosed.Basic
public import Mathlib.RingTheory.Polynomial.Basic

@[expose] public section

/-!
# Satz E for `⟨4,2,4⟩` at length 25: sub-case A of the case (5,8) is impossible

Task S2-27 (stage 2, round 7, track A, role: formaliser).
Claim file: `behauptungen/B-013.md`.

Sources: prose `lean/prosa/s2_444_spurA_r4.md` (task S2-16), Section 5.2 (Satz E, steps A2 to
A8), in a frame form that bypasses Lemma P and needs no Kronecker normal form.

## Setting (notation of `YangN4Haupt.lean`, `d = 3`, `m = 4`)

* `alg : BilinearAlgorithm K 4 2 4 r` with (N1) `SN1` and (N2) `SN2`; `U` is parametrised by
  `y : Fin 4 → K` (`emb y = (0; y)`), `u_0 = e_0`.
* `Ψ(u, y) = ∑_i u_i f_i(y)` is `psi alg u y`; in coordinates
  `Ψ(u, y)_t = (a_t·u) β_t(emb y)` (`psi_apply_apply`), with `a_t = SatzB444.avecs alg t`.
* `J = Ψ(e_0, U)` is `J alg`, `Ĵ = Ψ(K⁴, U)` is `SatzA444.JHat alg`, `Q = ker W / J` lives in
  `(Fin r → K) ⧸ J alg`, `F_i = Fq alg i`.

## The form that is proved

`satzE_rahmen`: over an algebraically closed field, if there are a two-dimensional subspace
`S ⊆ U` and a subspace `P` of dimension at most 5 that contains `J` and all `Ψ(u, x)`,
`x ∈ S`, then `dim Ĵ ≤ 8`, hence `rk L ≤ 4`.

Sub-case A of Lemma P (prose Section 5.1) gives such an `S` (namely `K*`) with
`P = J + K·q̂`: this is `UnterfallA` below, in a form that is weaker than the prose (no
condition on `γ*` and on the kernel vectors), so that the exclusion `satzE` is stronger than the
prose statement. In the case (5,8) we have `rk L = 5`, so `UnterfallA` is impossible.

## The proof, and how it differs from the prose

* **A3 without Kronecker** (`exists_chain`): for the pencil `M_1 = Ψ(·, x_1)`,
  `M_2 = Ψ(·, x_2)` with values in `P` (`dim P ≤ 5`) a dimension count gives a nonzero chain
  `u^0, …, u^3` with `M_2 u^k = M_1 u^{k+1}` (16 unknowns, at most 15 equations). The chain is
  linearly independent: a relation `∑ c_k u^k = 0` is a polynomial `p` of degree `≤ 3`; a root
  `μ` of `p` (algebraically closed) and `p = (X − μ) q` give `(M_2 − μ M_1)(∑ q_k u^k) = 0`, so
  `∑ q_k u^k = 0` by (N2), and induction on the degree ends at `u^0 = 0`, which forces the whole
  chain to vanish. In the basis `u^k` this is the multiplication `S³ × S¹ → S⁴`
  (`Ψ(u^k, x_1) = v_k`, `Ψ(u^k, x_2) = v_{k+1}`).
* **A2** (`J ⊆ span v`): `P` is spanned by `v_0, …, v_4` by Lemma 8 (`dim Ψ(K⁴, S) ≥ 5`).
* **A4 to A7 without the Hankel lemma** (`point_lemma`): coordinate `t` of the chain relations
  says `A_k B_2 = A_{k+1} B_1` with `A_k = a_t·u^k`, `(B_1, B_2) = (b_t(x_1), b_t(x_2))`. Hence
  `A_k = κ B_1^{3−k} B_2^k` (the parameter `σ_t` of the prose is `(B_1 : B_2)`), and with
  (N1) `a_t·e_0 ≠ 0` and `J ⊆ span v` the form `b_t` is `κ/(a_t·e_0)` times a form of degree 4
  in `σ_t`. The degenerate case `B_1 = B_2 = 0` (where the prose uses `b_t ≠ 0`) is harmless:
  then `b_t = 0` and the coordinate `t` of `Ĵ` vanishes.
* **A8** (`JHat_le_span_w`): every `Ψ(u^k, y)` lies in the span of the eight vectors
  `w_m = (c_t B_1^{7−m} B_2^m)_t`, `m = 0, …, 7` (binary forms of degree 7). The prose's
  identity `dim Ĵ = dim span{a_t ⊗ b_t}` (clarification R4) is not needed: the bound is proved
  for `Ĵ` directly.
* Not needed at all: non-symmetry, `s = 1`, Lemma P, the case (5,8) beyond `rk L = 5`,
  `b_t ≠ 0` (R3), `q ≠ 0`.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzE444

open Module YangN4Haupt SatzA444 Polynomial

universe u

/-! ## A3 without Kronecker: chains of a nonsingular pencil -/

section Chain

variable {K : Type u} [Field K] {W : Type*} [AddCommGroup W] [Module K W]
  {V : Type*} [AddCommGroup V] [Module K V]

/-- `∑_{k<4} p_k u^k` for a polynomial `p` and a sequence `u`. -/
noncomputable def chainEval (u : ℕ → V) (p : K[X]) : V :=
  ∑ k ∈ Finset.range 4, p.coeff k • u k

/-- A relation of degree `≤ 3` among the members of a chain of a nonsingular pencil is
trivial: if `M_2 u^k = M_1 u^{k+1}` for `k < 3`, `u^0 ≠ 0`, and `M_2 v = μ M_1 v` only for
`v = 0`, then `∑ p_k u^k ≠ 0` for every polynomial `p ≠ 0` of degree `≤ 3`. -/
theorem chainEval_ne_zero [IsAlgClosed K] (M1 M2 : V →ₗ[K] W)
    (hinj : ∀ (μ : K) (v : V), M2 v = μ • M1 v → v = 0)
    (u : ℕ → V) (hu0 : u 0 ≠ 0) (hrel : ∀ k < 3, M2 (u k) = M1 (u (k + 1))) :
    ∀ n : ℕ, ∀ p : K[X], p.natDegree = n → n ≤ 3 → p ≠ 0 → chainEval u p ≠ 0 := by
  intro n
  induction n with
  | zero =>
    intro p hp _ hp0
    rw [natDegree_eq_zero] at hp
    obtain ⟨c, rfl⟩ := hp
    have hc : c ≠ 0 := by rintro rfl; exact hp0 (by simp)
    simp only [chainEval, Finset.sum_range_succ, Finset.sum_range_zero, coeff_C]
    simp [hc, hu0]
  | succ n ih =>
    intro p hp hn hp0
    have hdeg : p.degree ≠ 0 := by
      rw [degree_eq_natDegree hp0, hp]
      exact_mod_cast Nat.succ_ne_zero n
    obtain ⟨μ, hμ⟩ := IsAlgClosed.exists_root p hdeg
    set q := p /ₘ (X - C μ) with hqdef
    have hpq : (X - C μ) * q = p := mul_divByMonic_eq_iff_isRoot.2 hμ
    have hq0 : q ≠ 0 := by
      intro hq
      rw [hq, mul_zero] at hpq
      exact hp0 hpq.symm
    have hqdeg : q.natDegree = n := by
      have := natDegree_mul (X_sub_C_ne_zero μ) hq0
      rw [hpq, natDegree_X_sub_C, hp] at this
      omega
    have hq3 : q.coeff 3 = 0 := coeff_eq_zero_of_natDegree_lt (by omega)
    intro hE
    apply ih q hqdeg (by omega) hq0
    -- `p = X q − μ q`, coefficientwise
    have hcoef : ∀ k, p.coeff k = (X * q).coeff k - μ * q.coeff k := by
      intro k
      rw [← hpq, sub_mul, coeff_sub, coeff_C_mul]
    have hX0 : (X * q).coeff 0 = 0 := coeff_X_mul_zero q
    have hX1 : (X * q).coeff 1 = q.coeff 0 := coeff_X_mul q 0
    have hX2 : (X * q).coeff 2 = q.coeff 1 := coeff_X_mul q 1
    have hX3 : (X * q).coeff 3 = q.coeff 2 := coeff_X_mul q 2
    -- `∑ q_k u^{k+1} = μ ∑ q_k u^k`
    have hshift : q.coeff 0 • u 1 + q.coeff 1 • u 2 + q.coeff 2 • u 3 =
        μ • chainEval u q := by
      have h := hE
      simp only [chainEval, Finset.sum_range_succ, Finset.sum_range_zero, zero_add, hcoef,
        hX0, hX1, hX2, hX3, sub_smul, smul_smul] at h ⊢
      rw [hq3, zero_smul, add_zero]
      rw [hq3] at h
      linear_combination (norm := module) h
    -- apply `M_1`
    have hM : M2 (chainEval u q) = μ • M1 (chainEval u q) := by
      rw [← map_smul, ← hshift]
      simp only [chainEval, Finset.sum_range_succ, Finset.sum_range_zero, zero_add, hq3,
        zero_smul, add_zero, map_add, map_smul]
      rw [hrel 0 (by norm_num), hrel 1 (by norm_num), hrel 2 (by norm_num)]
    exact hinj μ _ hM

/-- **A3 without Kronecker.** Let `M_1, M_2 : K⁴ → W` take values in a subspace `P` of
dimension `≤ 5`, `M_1` injective and `M_2 − μ M_1` injective for every `μ` (over an
algebraically closed field). Then there is a basis `u^0, …, u^3` of `K⁴` with
`M_2 u^k = M_1 u^{k+1}` for `k = 0, 1, 2`. -/
theorem exists_chain [IsAlgClosed K] {r : ℕ} (M1 M2 : (Fin 4 → K) →ₗ[K] (Fin r → K))
    (P : Submodule K (Fin r → K)) (hP : finrank K P ≤ 5)
    (h1 : ∀ v, M1 v ∈ P) (h2 : ∀ v, M2 v ∈ P)
    (hM1 : ∀ v, M1 v = 0 → v = 0) (hinj : ∀ (μ : K) v, M2 v = μ • M1 v → v = 0) :
    ∃ u : Fin 4 → (Fin 4 → K), LinearIndependent K u ∧
      ∀ k : Fin 3, M2 (u k.castSucc) = M1 (u k.succ) := by
  classical
  -- the linear system `M_2 v_k − M_1 v_{k+1} = 0` (`k < 3`) with values in `P³`
  let T : (Fin 4 → Fin 4 → K) →ₗ[K] (Fin 3 → P) :=
    LinearMap.pi fun k : Fin 3 =>
      (M2 ∘ₗ LinearMap.proj k.castSucc - M1 ∘ₗ LinearMap.proj k.succ).codRestrict P
        (fun v => P.sub_mem (h2 _) (h1 _))
  have hdim : finrank K (Fin 3 → P) < finrank K (Fin 4 → Fin 4 → K) := by
    rw [Module.finrank_pi_fintype, Module.finrank_pi_fintype]
    simp only [Module.finrank_fin_fun, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
      smul_eq_mul]
    omega
  obtain ⟨v, hvT, hv0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot
    (LinearMap.ker_ne_bot_of_finrank_lt (f := T) hdim)
  have hrel : ∀ k : Fin 3, M2 (v k.castSucc) = M1 (v k.succ) := by
    intro k
    have h := congrArg Subtype.val (congrFun (LinearMap.mem_ker.1 hvT) k)
    simp only [T, LinearMap.pi_apply, LinearMap.codRestrict_apply, LinearMap.sub_apply,
      LinearMap.comp_apply, LinearMap.proj_apply, Pi.zero_apply, ZeroMemClass.coe_zero] at h
    exact sub_eq_zero.1 h
  -- `v_0 ≠ 0`, otherwise the whole chain vanishes
  have hv00 : v 0 ≠ 0 := by
    intro h0
    have r0 : M2 (v 0) = M1 (v 1) := hrel 0
    have r1 : M2 (v 1) = M1 (v 2) := hrel 1
    have r2 : M2 (v 2) = M1 (v 3) := hrel 2
    have e1 : v 1 = 0 := hM1 _ (by rw [← r0, h0, map_zero])
    have e2 : v 2 = 0 := hM1 _ (by rw [← r1, e1, map_zero])
    have e3 : v 3 = 0 := hM1 _ (by rw [← r2, e2, map_zero])
    apply hv0
    funext i
    fin_cases i
    · exact h0
    · exact e1
    · exact e2
    · exact e3
  -- the chain as a sequence
  let u : ℕ → (Fin 4 → K) := fun n => if h : n < 4 then v ⟨n, h⟩ else 0
  have hu : ∀ i : Fin 4, u i = v i := fun i => by simp [u, i.isLt]
  have hu0 : u 0 ≠ 0 := by simpa [u] using hv00
  have hrel' : ∀ k < 3, M2 (u k) = M1 (u (k + 1)) := by
    intro k hk
    have := hrel ⟨k, hk⟩
    simp only [u, dif_pos (show k < 4 by omega), dif_pos (show k + 1 < 4 by omega)]
    exact this
  have key := chainEval_ne_zero M1 M2 hinj u hu0 hrel'
  refine ⟨v, ?_, hrel⟩
  rw [Fintype.linearIndependent_iff]
  intro g hg
  by_contra hne
  push_neg at hne
  set p : K[X] := ((degreeLTEquiv K 4).symm g : K[X]) with hpdef
  have hpmem : p ∈ degreeLT K 4 := ((degreeLTEquiv K 4).symm g).2
  have hpc : ∀ i : Fin 4, p.coeff i = g i := by
    intro i
    exact congrFun ((degreeLTEquiv K 4).apply_symm_apply g) i
  have hp0 : p ≠ 0 := by
    intro h
    obtain ⟨i, hi⟩ := hne
    apply hi
    rw [← hpc i, h, coeff_zero]
  have hpdeg : p.natDegree ≤ 3 := by
    rw [mem_degreeLT, degree_eq_natDegree hp0] at hpmem
    have : p.natDegree < 4 := by exact_mod_cast hpmem
    omega
  apply key p.natDegree p rfl hpdeg hp0
  rw [chainEval, Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_succ,
    Finset.sum_range_succ, Finset.sum_range_zero, zero_add]
  have e := hg
  rw [Fin.sum_univ_four] at e
  have h0 := hpc 0
  have h1 := hpc 1
  have h2 := hpc 2
  have h3 := hpc 3
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, Nat.cast_ofNat] at h0 h1 h2 h3
  have h3' : p.coeff 3 = g 3 := h3
  rw [h0, h1, h2, h3', show u 0 = v 0 from hu 0, show u 1 = v 1 from hu 1,
    show u 2 = v 2 from hu 2, show u 3 = v 3 from hu 3]
  exact e

end Chain

/-! ## A4 to A7 without the Hankel lemma: one coordinate -/

section Point

variable {K : Type u} [Field K]

/-- The monomial `B_1^{7−n} B_2^n`. -/
def mono (B1 B2 : K) (n : ℕ) : K := B1 ^ (7 - n) * B2 ^ n

/-- **One coordinate `t`** (prose A4 to A7, replacing the Hankel lemma). With
`A_k = a_t·u^k`, `(B_1, B_2) = (b_t(x_1), b_t(x_2))`, `a_0 = a_t·e_0 ≠ 0` (N1) and the chain
relations `A_k B_2 = A_{k+1} B_1`: there is a constant `c` such that, whenever
`a_0 b = ∑_l h_l v_l` with `v = (A_0 B_1, A_1 B_1, A_2 B_1, A_3 B_1, A_3 B_2)` (that is,
`Ψ(e_0, y)_t = ∑ h_l (v_l)_t` with `b = b_t(y)`), then `A_k b = c ∑_l h_l B_1^{7−k−l} B_2^{k+l}`
for every `k < 4`. -/
theorem point_lemma (A : ℕ → K) (B1 B2 a0 : K) (ha0 : a0 ≠ 0)
    (hc0 : A 0 * B2 = A 1 * B1) (hc1 : A 1 * B2 = A 2 * B1) (hc2 : A 2 * B2 = A 3 * B1) :
    ∃ c : K, ∀ (b : K) (h : Fin 5 → K),
      a0 * b = h 0 * (A 0 * B1) + h 1 * (A 1 * B1) + h 2 * (A 2 * B1) + h 3 * (A 3 * B1) +
        h 4 * (A 3 * B2) →
      ∀ k < 4, A k * b = c * (h 0 * mono B1 B2 (k + 0) + h 1 * mono B1 B2 (k + 1) +
        h 2 * mono B1 B2 (k + 2) + h 3 * mono B1 B2 (k + 3) + h 4 * mono B1 B2 (k + 4)) := by
  by_cases hB1 : B1 = 0
  · by_cases hB2 : B2 = 0
    · -- `b_t` vanishes on `S`, hence everywhere
      refine ⟨0, fun b h hb k _ => ?_⟩
      simp only [hB1, hB2, mul_zero, add_zero] at hb
      have : b = 0 := by
        rcases mul_eq_zero.1 hb with h' | h'
        · exact absurd h' ha0
        · exact h'
      simp [this]
    · -- `σ_t = (0 : 1)`
      have e0 : A 0 = 0 := by
        have := hc0; rw [hB1, mul_zero] at this
        exact (mul_eq_zero.1 this).resolve_right hB2
      have e1 : A 1 = 0 := by
        have := hc1; rw [hB1, mul_zero] at this
        exact (mul_eq_zero.1 this).resolve_right hB2
      have e2 : A 2 = 0 := by
        have := hc2; rw [hB1, mul_zero] at this
        exact (mul_eq_zero.1 this).resolve_right hB2
      refine ⟨A 3 ^ 2 / (a0 * B2 ^ 6), fun b h hb k hk => ?_⟩
      simp only [hB1, e0, e1, e2, mul_zero, zero_mul, zero_add, add_zero] at hb
      have hb' : b = h 4 * (A 3 * B2) / a0 := by
        rw [eq_div_iff ha0, mul_comm]
        exact hb
      subst hb'
      interval_cases k <;> simp [mono, hB1, e0, e1, e2] <;> field_simp <;> ring
  · -- `σ_t = (B_1 : B_2)` with `B_1 ≠ 0`
    have e1 : A 1 = A 0 * B2 / B1 := by field_simp; rw [hc0]
    have e2 : A 2 = A 0 * B2 ^ 2 / B1 ^ 2 := by
      field_simp
      have : A 2 * B1 = A 1 * B2 := hc1.symm
      rw [e1] at this
      field_simp at this
      linear_combination this
    have e3 : A 3 = A 0 * B2 ^ 3 / B1 ^ 3 := by
      field_simp
      have : A 3 * B1 = A 2 * B2 := hc2.symm
      rw [e2] at this
      field_simp at this
      linear_combination this
    refine ⟨A 0 ^ 2 / (a0 * B1 ^ 6), fun b h hb k hk => ?_⟩
    have hb' : b = (h 0 * (A 0 * B1) + h 1 * (A 1 * B1) + h 2 * (A 2 * B1) +
        h 3 * (A 3 * B1) + h 4 * (A 3 * B2)) / a0 := by
      rw [eq_div_iff ha0, mul_comm]
      exact hb
    subst hb'
    interval_cases k <;> simp only [mono, e1, e2, e3] <;> norm_num only <;> field_simp <;>
      rw [div_eq_iff (by simp [hB1, ha0])] <;> ring

end Point

/-! ## Ψ and the frame form of Satz E -/

section Frame

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- `Ψ(u, y) = ∑_i u_i f_i(y)` (prose Section 2: `Ψ_p(u, w)`). -/
noncomputable def psi : (Fin 4 → K) →ₗ[K] (Fin 4 → K) →ₗ[K] (Fin r → K) :=
  LinearMap.mk₂ K (fun u y => ∑ i, u i • φ (d := 3) alg i y)
    (fun u u' y => by simp [add_smul, Finset.sum_add_distrib])
    (fun c u y => by simp [Finset.smul_sum, smul_smul])
    (fun u y y' => by simp [Finset.sum_add_distrib])
    (fun c u y => by simp [Finset.smul_sum, smul_comm c])

theorem psi_apply (u y : Fin 4 → K) : psi alg u y = ∑ i, u i • φ (d := 3) alg i y := rfl

/-- `Ψ(u, y)_t = (a_t·u) β_t(emb y)`. -/
theorem psi_apply_apply (u y : Fin 4 → K) (t : Fin r) :
    psi alg u y t = (∑ i, u i * SatzB444.avecs alg t i) * alg.beta t (emb y) := by
  rw [psi_apply, Finset.sum_apply, Finset.sum_mul]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Pi.smul_apply, smul_eq_mul, SatzB444.φ_apply_apply]
  ring

/-- `Ψ(e_i, y) = f_i(y)`. -/
theorem psi_single (i : Fin 4) (y : Fin 4 → K) : psi alg (Pi.single i 1) y = φ (d := 3) alg i y := by
  rw [psi_apply, Finset.sum_eq_single i]
  · simp
  · intro j _ hj; simp [Pi.single_apply, hj]
  · simp

/-- (Ψ1) from (N2): `Ψ(u, y) = 0` with `y ≠ 0` forces `u = 0`. -/
theorem psi_eq_zero (h2 : SN2 (d := 3) alg) (u y : Fin 4 → K) (hy : y ≠ 0)
    (h : psi alg u y = 0) : u = 0 := by
  apply SatzB444.psi_nonsing alg h2 u y hy
  intro t
  rw [← psi_apply_apply, h, Pi.zero_apply]

/-- If `u` runs through a spanning family, `Ψ(·, y)` maps into the span of its values. -/
theorem psi_mem_of_span {ι : Type*} (u : ι → (Fin 4 → K))
    (hu : Submodule.span K (Set.range u) = ⊤) (Z : Submodule K (Fin r → K)) (y : Fin 4 → K)
    (hZ : ∀ i, psi alg (u i) y ∈ Z) (v : Fin 4 → K) : psi alg v y ∈ Z := by
  have : Submodule.span K (Set.range u) ≤ Z.comap ((psi alg).flip y) := by
    rw [Submodule.span_le, Set.range_subset_iff]
    intro i
    exact hZ i
  rw [hu] at this
  exact this Submodule.mem_top

/-- **Satz E, frame form**. Over an algebraically closed field, under
(N1), (N2): let `x_1, x_2 ∈ U` be linearly independent and `P` a subspace of dimension at most 5
that contains `J` and all `f_i(x_1)`, `f_i(x_2)`. Then `dim Ĵ ≤ 8`. -/
theorem finrank_JHat_le_eight [IsAlgClosed K] (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (x1 x2 : Fin 4 → K) (hx : ∀ a b : K, a • x1 + b • x2 = 0 → a = 0 ∧ b = 0)
    (P : Submodule K (Fin r → K)) (hP : finrank K P ≤ 5)
    (hΨ : ∀ i, φ (d := 3) alg i x1 ∈ P ∧ φ (d := 3) alg i x2 ∈ P) (hJ : J (d := 3) alg ≤ P) :
    finrank K (JHat (d := 3) alg) ≤ 8 := by
  classical
  have hx1 : x1 ≠ 0 := by
    intro h
    have := (hx 1 0 (by simp [h])).1
    exact one_ne_zero this
  -- the pencil `M_1 = Ψ(·, x_1)`, `M_2 = Ψ(·, x_2)`
  set M1 := (psi alg).flip x1 with hM1def
  set M2 := (psi alg).flip x2 with hM2def
  have hPsi : ∀ v (x : Fin 4 → K), (∀ i, φ (d := 3) alg i x ∈ P) → psi alg v x ∈ P := by
    intro v x hx'
    rw [psi_apply]
    exact P.sum_mem fun i _ => P.smul_mem _ (hx' i)
  have hP1 : ∀ v, M1 v ∈ P := fun v => hPsi v x1 fun i => (hΨ i).1
  have hP2 : ∀ v, M2 v ∈ P := fun v => hPsi v x2 fun i => (hΨ i).2
  have hinj1 : ∀ v, M1 v = 0 → v = 0 := fun v hv => psi_eq_zero alg h2 v x1 hx1 hv
  have hinj : ∀ (μ : K) v, M2 v = μ • M1 v → v = 0 := by
    intro μ v hv
    have hne : x2 - μ • x1 ≠ 0 := by
      intro h
      have := (hx (-μ) 1 (by rw [neg_smul, one_smul, neg_add_eq_sub]; exact h)).2
      exact one_ne_zero this
    apply psi_eq_zero alg h2 v _ hne
    rw [map_sub, map_smul]
    have : psi alg v x2 = μ • psi alg v x1 := hv
    rw [this, sub_self]
  -- the chain `u^0, …, u^3` (a basis of `K⁴`)
  obtain ⟨u, hu, hrel⟩ := exists_chain M1 M2 P hP hP1 hP2 hinj1 hinj
  have hspan : Submodule.span K (Set.range u) = ⊤ :=
    hu.span_eq_top_of_card_eq_finrank (by simp)
  have hrel' : ∀ k : Fin 3, psi alg (u k.castSucc) x2 = psi alg (u k.succ) x1 := hrel
  -- the vectors `v_0, …, v_4`
  let vv : Fin 5 → (Fin r → K) :=
    ![psi alg (u 0) x1, psi alg (u 1) x1, psi alg (u 2) x1, psi alg (u 3) x1, psi alg (u 3) x2]
  set Vs := Submodule.span K (Set.range vv) with hVs
  have hvv : ∀ l, vv l ∈ Vs := fun l => Submodule.subset_span ⟨l, rfl⟩
  have hk1 : ∀ k, psi alg (u k) x1 ∈ Vs := by
    intro k
    fin_cases k
    · exact hvv 0
    · exact hvv 1
    · exact hvv 2
    · exact hvv 3
  have r0 : psi alg (u 0) x2 = psi alg (u 1) x1 := hrel' 0
  have r1 : psi alg (u 1) x2 = psi alg (u 2) x1 := hrel' 1
  have r2 : psi alg (u 2) x2 = psi alg (u 3) x1 := hrel' 2
  have hk2 : ∀ k, psi alg (u k) x2 ∈ Vs := by
    intro k
    fin_cases k
    · show psi alg (u 0) x2 ∈ Vs
      rw [r0]; exact hvv 1
    · show psi alg (u 1) x2 ∈ Vs
      rw [r1]; exact hvv 2
    · show psi alg (u 2) x2 ∈ Vs
      rw [r2]; exact hvv 3
    · exact hvv 4
  -- A2: `P = span v`, by Lemma 8
  have hVsP : Vs ≤ P := by
    rw [hVs, Submodule.span_le, Set.range_subset_iff]
    intro l
    fin_cases l
    · exact hP1 _
    · exact hP1 _
    · exact hP1 _
    · exact hP1 _
    · exact hP2 _
  have hPVs : P ≤ Vs := by
    set S : Submodule K (Matrix (Fin 2) (Fin 4) K) :=
      Submodule.span K (Set.range ![emb x1, emb x2]) with hS
    have hli : LinearIndependent K ![(emb x1 : Matrix (Fin 2) (Fin 4) K), emb x2] := by
      rw [Fintype.linearIndependent_iff]
      intro g hg
      rw [Fin.sum_univ_two] at hg
      simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons] at hg
      have hg' : emb (g 0 • x1 + g 1 • x2) = (emb 0 : Matrix (Fin 2) (Fin 4) K) := by
        rw [map_add, map_smul, map_smul, hg, map_zero]
      have := hx (g 0) (g 1) (emb_injective hg')
      intro i
      fin_cases i
      · exact this.1
      · exact this.2
    have hSdim : finrank K S = 2 := by
      rw [hS, finrank_span_eq_card hli]
      simp
    have hSne : S ≠ ⊥ := by
      intro h
      rw [h, finrank_bot] at hSdim
      omega
    have h8 := lemma8 (d := 3) alg h1 h2 S hSne
    have hle : (⨆ i, S.map (fv (d := 3) alg i) : Submodule K (Fin r → K)) ≤ Vs := by
      refine iSup_le fun i => ?_
      rw [hS, Submodule.map_span, Submodule.span_le]
      rintro _ ⟨_, ⟨j, rfl⟩, rfl⟩
      have hmem : ∀ x : Fin 4 → K, (∀ k, psi alg (u k) x ∈ Vs) →
          fv (d := 3) alg i (emb x) ∈ Vs := by
        intro x hxk
        have : fv (d := 3) alg i (emb x) = psi alg (Pi.single i 1) x := (psi_single alg i x).symm
        rw [this]
        exact psi_mem_of_span alg u hspan Vs x hxk _
      fin_cases j
      · exact hmem x1 hk1
      · exact hmem x2 hk2
    have := Submodule.finrank_mono hle
    exact (Submodule.eq_of_le_of_finrank_le hVsP (by omega)).ge
  have hJVs : J (d := 3) alg ≤ Vs := hJ.trans hPVs
  -- `Ψ(e_0, y) = ∑_l h_l(y) v_l`
  have hJmem : ∀ y : Fin 4 → K, ∃ h : Fin 5 → K, ∑ l, h l • vv l = φ (d := 3) alg 0 y := by
    intro y
    exact (Submodule.mem_span_range_iff_exists_fun K).1 (hJVs ⟨y, rfl⟩)
  choose hf hhf using hJmem
  -- one coordinate at a time
  have hpt : ∀ t : Fin r, ∃ c : K, ∀ (b : K) (h : Fin 5 → K),
      SatzB444.avecs alg t 0 * b =
        h 0 * ((∑ i, u 0 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
        h 1 * ((∑ i, u 1 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
        h 2 * ((∑ i, u 2 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
        h 3 * ((∑ i, u 3 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
        h 4 * ((∑ i, u 3 i * SatzB444.avecs alg t i) * alg.beta t (emb x2)) →
      ∀ k : Fin 4, (∑ i, u k i * SatzB444.avecs alg t i) * b =
        c * (h 0 * mono (alg.beta t (emb x1)) (alg.beta t (emb x2)) (k.val + 0) +
          h 1 * mono (alg.beta t (emb x1)) (alg.beta t (emb x2)) (k.val + 1) +
          h 2 * mono (alg.beta t (emb x1)) (alg.beta t (emb x2)) (k.val + 2) +
          h 3 * mono (alg.beta t (emb x1)) (alg.beta t (emb x2)) (k.val + 3) +
          h 4 * mono (alg.beta t (emb x1)) (alg.beta t (emb x2)) (k.val + 4)) := by
    intro t
    have hc : ∀ k : Fin 3, (∑ i, u k.castSucc i * SatzB444.avecs alg t i) * alg.beta t (emb x2) =
        (∑ i, u k.succ i * SatzB444.avecs alg t i) * alg.beta t (emb x1) := by
      intro k
      have := congrFun (hrel' k) t
      rwa [psi_apply_apply, psi_apply_apply] at this
    have hc0 : (∑ i, u 0 i * SatzB444.avecs alg t i) * alg.beta t (emb x2) =
        (∑ i, u 1 i * SatzB444.avecs alg t i) * alg.beta t (emb x1) := hc 0
    have hc1 : (∑ i, u 1 i * SatzB444.avecs alg t i) * alg.beta t (emb x2) =
        (∑ i, u 2 i * SatzB444.avecs alg t i) * alg.beta t (emb x1) := hc 1
    have hc2 : (∑ i, u 2 i * SatzB444.avecs alg t i) * alg.beta t (emb x2) =
        (∑ i, u 3 i * SatzB444.avecs alg t i) * alg.beta t (emb x1) := hc 2
    open Fin.NatCast in
    obtain ⟨c, hcc⟩ := point_lemma (fun k : ℕ => ∑ i, u (k : Fin 4) i * SatzB444.avecs alg t i)
      (alg.beta t (emb x1)) (alg.beta t (emb x2)) _ (SatzB444.avecs_zero_ne alg h1 t)
      (by simpa using hc0) (by simpa using hc1) (by simpa using hc2)
    refine ⟨c, fun b h hb k => ?_⟩
    have := hcc b h (by simpa using hb) k.val k.isLt
    simpa using this
  choose c hc using hpt
  -- the eight vectors `w_m`
  let w : ℕ → (Fin r → K) := fun m t =>
    c t * mono (alg.beta t (emb x1)) (alg.beta t (emb x2)) m
  set Ws := Submodule.span K (Set.range fun m : Fin 8 => w m) with hWs
  have hwW : ∀ m < 8, w m ∈ Ws := fun m hm => Submodule.subset_span ⟨⟨m, hm⟩, rfl⟩
  -- A8: `Ψ(u^k, y) ∈ span w`
  have hkW : ∀ (k : Fin 4) (y : Fin 4 → K), psi alg (u k) y ∈ Ws := by
    intro k y
    have hrepr : psi alg (u k) y =
        hf y 0 • w (k.val + 0) + hf y 1 • w (k.val + 1) + hf y 2 • w (k.val + 2) +
          hf y 3 • w (k.val + 3) + hf y 4 • w (k.val + 4) := by
      funext t
      rw [psi_apply_apply]
      have hb : SatzB444.avecs alg t 0 * alg.beta t (emb y) =
          hf y 0 * ((∑ i, u 0 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
          hf y 1 * ((∑ i, u 1 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
          hf y 2 * ((∑ i, u 2 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
          hf y 3 * ((∑ i, u 3 i * SatzB444.avecs alg t i) * alg.beta t (emb x1)) +
          hf y 4 * ((∑ i, u 3 i * SatzB444.avecs alg t i) * alg.beta t (emb x2)) := by
        have := congrFun (hhf y) t
        rw [SatzB444.φ_apply_apply] at this
        rw [← this, Finset.sum_apply, Fin.sum_univ_five]
        simp only [Pi.smul_apply, smul_eq_mul]
        rw [show vv 0 = psi alg (u 0) x1 from rfl, show vv 1 = psi alg (u 1) x1 from rfl,
          show vv 2 = psi alg (u 2) x1 from rfl, show vv 3 = psi alg (u 3) x1 from rfl,
          show vv 4 = psi alg (u 3) x2 from rfl]
        simp only [psi_apply_apply]
      rw [hc t _ _ hb k]
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, w]
      ring
    rw [hrepr]
    refine Ws.add_mem (Ws.add_mem (Ws.add_mem (Ws.add_mem ?_ ?_) ?_) ?_) ?_ <;>
      exact Ws.smul_mem _ (hwW _ (by omega))
  have hJW : JHat (d := 3) alg ≤ Ws := by
    refine iSup_le fun i => ?_
    rintro _ ⟨y, rfl⟩
    rw [← psi_single]
    exact psi_mem_of_span alg u hspan Ws y (fun k => hkW k y) _
  calc finrank K (JHat (d := 3) alg) ≤ finrank K Ws := Submodule.finrank_mono hJW
    _ ≤ Fintype.card (Fin 8) := finrank_range_le_card _
    _ = 8 := by simp

end Frame

/-! ## Sub-case A and Satz E -/

section SatzE

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- **Sub-case A** (prose Lemma P, “Unterfall A”, in the weak form that Satz E needs): there are
a two-dimensional subspace `K* ⊆ U` and an element `q ∈ Q` with `F_i(K*) ⊆ K·q` for
`i = 1, 2, 3`. (The prose sub-case A has in addition `γ* ≠ 0` with `F_{γ*}(K*) = 0`, `q ≠ 0`
and `K* = span{k(γ)}`; see `SatzE444Buendel.UnterfallAVoll`. Excluding the weak form is the
stronger statement.) -/
def UnterfallA : Prop :=
  ∃ (Kst : Submodule K (Fin 4 → K)) (q : (Fin r → K) ⧸ J (d := 3) alg),
    finrank K Kst = 2 ∧ ∀ (i : Fin 3), ∀ x ∈ Kst, Fq (d := 3) alg i x ∈ K ∙ q

/-- **Satz E, frame form applied to sub-case A** (prose A2: `V_5 ⊆ J + K·q̂`): over an
algebraically closed field, under (N1), (N2), sub-case A forces `dim Ĵ ≤ 8`, that is
`rk L ≤ 4`. No assumption on the length, the case, symmetry or `s`. -/
theorem rkL_le_four_of_unterfallA [IsAlgClosed K] (h1 : SN1 (d := 3) alg)
    (h2 : SN2 (d := 3) alg) (hA : UnterfallA alg) :
    finrank K (LinearMap.range (Lq (d := 3) alg)) ≤ 4 := by
  classical
  obtain ⟨Kst, q, hdim, hq⟩ := hA
  obtain ⟨qh, rfl⟩ := Submodule.Quotient.mk_surjective _ q
  -- a basis `x_1, x_2` of `K*`
  let b := Module.finBasisOfFinrankEq K Kst hdim
  have hx : ∀ a c : K, a • (b 0 : Fin 4 → K) + c • (b 1 : Fin 4 → K) = 0 → a = 0 ∧ c = 0 := by
    intro a c h
    have hli := Fintype.linearIndependent_iff.1 b.linearIndependent ![a, c] (by
      rw [Fin.sum_univ_two]
      apply Subtype.ext
      simpa using h)
    exact ⟨by simpa using hli 0, by simpa using hli 1⟩
  -- `P = J + K·q̂`
  set P : Submodule K (Fin r → K) := J (d := 3) alg ⊔ K ∙ qh with hPdef
  have hP : finrank K P ≤ 5 := by
    have h : finrank K P ≤ finrank K (J (d := 3) alg) + finrank K (K ∙ qh) :=
      Submodule.finrank_add_le_finrank_add_finrank (J (d := 3) alg) (K ∙ qh)
    have hJ : finrank K (J (d := 3) alg) = 4 := finrank_J (d := 3) alg h1
    have hs : finrank K (K ∙ qh) ≤ 1 := by
      simpa using finrank_span_le_card ({qh} : Set (Fin r → K))
    omega
  have hmem : ∀ i (x : Fin 4 → K), x ∈ Kst → φ (d := 3) alg i x ∈ P := by
    intro i x hxK
    refine Fin.cases ?_ (fun j => ?_) i
    · exact Submodule.mem_sup_left ⟨x, rfl⟩
    · obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.1 (hq j x hxK)
      have hJ : φ (d := 3) alg j.succ x - c • qh ∈ J (d := 3) alg := by
        rw [← π_eq_zero_iff, map_sub, map_smul]
        have : π (d := 3) alg (φ (d := 3) alg j.succ x) = Fq (d := 3) alg j x := rfl
        rw [this, ← hc]
        simp [π]
      have : φ (d := 3) alg j.succ x = (φ (d := 3) alg j.succ x - c • qh) + c • qh := by abel
      rw [this]
      exact Submodule.add_mem_sup hJ (Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self qh))
  have h8 := finrank_JHat_le_eight alg h1 h2 (b 0) (b 1) hx P hP
    (fun i => ⟨hmem i _ (b 0).2, hmem i _ (b 1).2⟩) le_sup_left
  have hJH := finrank_JHat (d := 3) alg h1
  omega

/-- **Satz E** (prose Section 5.2, B-013): for a normalized decomposition of `⟨4,2,4⟩` of
length 25 over an algebraically closed field with `rk L = 5` (in particular in the case
`(rk L, rk H) = (5, 8)`), sub-case A does not occur. -/
theorem satzE_of_rkL [IsAlgClosed K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hL : finrank K (LinearMap.range (Lq (d := 3) alg)) = 5) : ¬ UnterfallA alg := by
  intro hA
  have := rkL_le_four_of_unterfallA alg h1 h2 hA
  omega

/-- **Satz E** (prose Section 5.2, B-013), stated for the case (5,8): for a normalized
decomposition of `⟨4,2,4⟩` of length 25 over an algebraically closed field with
`(rk L, rk H) = (5, 8)`, sub-case A does not occur. No hypothesis on symmetry. -/
theorem satzE [IsAlgClosed K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8)) : ¬ UnterfallA alg :=
  satzE_of_rkL alg h1 h2 (Prod.mk.inj hcase).1

/-- **Satz E, global form**: every decomposition of `⟨4,2,4⟩` of length 25 over any field `K`
has a normal form over the algebraic closure (length 25, (N1), (N2)), and for every such normal
form in the case (5,8) sub-case A does not occur. -/
theorem satzE_global (K : Type u) [Field K] (alg : BilinearAlgorithm K 4 2 4 25) :
    ∃ alg' : BilinearAlgorithm (AlgebraicClosure K) 4 2 4 25,
      SN1 (d := 3) alg' ∧ SN2 (d := 3) alg' ∧
      ((finrank (AlgebraicClosure K) (LinearMap.range (Lq (d := 3) alg')),
          finrank (AlgebraicClosure K) (LinearMap.range (Hq (d := 3) alg'))) = (5, 8) →
        ¬ UnterfallA alg') := by
  obtain ⟨alg', h1, h2⟩ := satzA_exists K alg
  exact ⟨alg', h1, h2, satzE alg' h1 h2⟩

end SatzE

end SatzE444
end YangBounds

/-! ## Axiom check (output appears in the build log) -/

#print axioms YangBounds.SatzE444.exists_chain
#print axioms YangBounds.SatzE444.point_lemma
#print axioms YangBounds.SatzE444.finrank_JHat_le_eight
#print axioms YangBounds.SatzE444.rkL_le_four_of_unterfallA
#print axioms YangBounds.SatzE444.satzE
#print axioms YangBounds.SatzE444.satzE_global
