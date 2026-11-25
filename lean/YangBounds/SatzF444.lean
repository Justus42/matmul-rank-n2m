import YangBounds.LemmaP444
import YangBounds.Endsatz444

/-!
# Satz F for `⟨4,2,4⟩`, case (5,8): sub-case B is impossible (with named hypotheses)

Task S2-34 (stage 2, round 9, track A, role: formaliser). Status of every statement in this
file: `behauptet` (until a statement check per protocol Section 5.1 item 3).
Claim file: `behauptungen/B-014.md`.

Sources: prose `lean/prosa/s2_444_spurA_r6.md` (task S2-24), Sections 4 and 5 (Satz F), and
the review `lean/prosa/s2_444_spurA_r6_pruefung.md` (task S2-28), repairs R-F1 to R-F3 and the
elementary replacements E2 (Bézout by fixed points) and E3 (the degree argument).

## Main results

* `deg_eq_one`: the degree argument (prose Satz F steps 2 to 4) in the elementary form E2/E3:
  for reduced pairs of binary forms `φ` of degree `d` and `ψ` of degree `e` over an
  algebraically closed field, more than `d e + 1` fixed points of `ψ ∘ φ` force `d = e = 1`.
  Bézout on `ℙ¹ × ℙ¹` is not needed.
* `satzF_kern`: Satz F for vectors `a_t, b_t ∈ K⁴` with the cubic structure on both sides and
  at least 11 pairwise distinct points `[a_t ⊗ b_t]`: there is an invertible `G` with
  `G b_t ∈ K·a_t` for all `t`.
* `kubik_seite`, `kubik_of_unterfallB`: (B0) to (B2) of the prose without the Kronecker normal
  form and without the Hankel lemma (via `SatzE444.exists_chain`). From `UnterfallB` only
  `γ* ≠ 0` and `rk F_{γ*} = 1` are used.
* `satzF`: at a normal form (`SN1`, `SN2`, algebraically closed field), `UnterfallB` together
  with the two named hypotheses `TransponiertEng` (B3′) and `VielePunkte alg 11` (Z′) gives
  `SatzB444.IsSymm alg`.
* `unterfallB_unmoeglich`, `fall58_symmetrisch`, `fall58_ausgeschlossen`: the exclusion of
  sub-case B and of the case (5,8) at non-symmetric normal forms, under (B3′) and (Z′).
* `unterfallBStatement_of`: `Endsatz444.UnterfallBStatement L` from (B3′) and (Z′) for every
  normal form in the case (5,8) that is not symmetric.

## Named hypotheses (not proved here)

* `TransponiertEng alg` (B3′): a tight pair `w₀, w₁` on the other side at the same point. In
  the prose this is sub-case B for the transposed decomposition at the same point (prose (B3),
  review repair R-F3). It needs the transposed decomposition as a normal form at the same point.
* `VielePunkte alg 11` (Z′): 11 pairwise distinct points `[a_t ⊗ b_t]`. In the prose this is
  Lemma Z (13 points at a generic point, via Lemma K and `Ĵ_p = ker W` on an open set of `p`).
  A single normal form does not see the variation of `p`.

No `sorry`, no own axiom, no `native_decide`.
-/

namespace YangBounds
namespace SatzF444

open Module Polynomial

universe u

/-! ## Binary forms through polynomials

A binary form of degree `e` is stored as a polynomial `c` with `natDegree c ≤ e`; its value at
`(s₀, s₁)` is `∑_k c_k s₁^k s₀^(e-k)` (`evalH`). The chart `s₀ = 1` gives `c.eval`. -/

section Forms

variable {K : Type u} [Field K]

/-- The binary form of degree `e` with coefficients `c.coeff k` at `s₁^k s₀^(e-k)`. -/
noncomputable def evalH (e : ℕ) (c : K[X]) (s0 s1 : K) : K :=
  ∑ k ∈ Finset.range (e + 1), c.coeff k * s1 ^ k * s0 ^ (e - k)

theorem evalH_smul (e : ℕ) (c : K[X]) (l s0 s1 : K) :
    evalH e c (l * s0) (l * s1) = l ^ e * evalH e c s0 s1 := by
  unfold evalH
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl fun k hk => ?_
  have hk' : k ≤ e := Nat.lt_succ_iff.1 (Finset.mem_range.1 hk)
  have : l ^ e = l ^ k * l ^ (e - k) := by rw [← pow_add, Nat.add_sub_cancel' hk']
  rw [this, mul_pow, mul_pow]
  ring

theorem evalH_one (e : ℕ) (c : K[X]) (hc : c.natDegree ≤ e) (x : K) :
    evalH e c 1 x = c.eval x := by
  rw [evalH, eval_eq_sum_range' (Nat.lt_succ_of_le hc)]
  simp

theorem evalH_of_ne (e : ℕ) (c : K[X]) (hc : c.natDegree ≤ e) (s0 s1 : K) (h0 : s0 ≠ 0) :
    evalH e c s0 s1 = s0 ^ e * c.eval (s1 / s0) := by
  have h1 : s0 * (s1 / s0) = s1 := by field_simp
  rw [← evalH_one e c hc, ← evalH_smul, mul_one, h1]

theorem evalH_zero_left (e : ℕ) (c : K[X]) (s1 : K) : evalH e c 0 s1 = c.coeff e * s1 ^ e := by
  rw [evalH, Finset.sum_eq_single e]
  · simp
  · intro k hk hke
    have : k < e := lt_of_le_of_ne (Nat.lt_succ_iff.1 (Finset.mem_range.1 hk)) hke
    rw [zero_pow (by omega), mul_zero]
  · intro h
    exact absurd (Finset.mem_range.2 (Nat.lt_succ_self e)) h

theorem evalH_deg_one (c : K[X]) (s0 s1 : K) :
    evalH 1 c s0 s1 = c.coeff 0 * s0 + c.coeff 1 * s1 := by
  simp [evalH, Finset.sum_range_succ]
  try ring

/-- The composition `F(p, q) = ∑_k c_k q^k p^(e-k)` of a form `F` of degree `e` with a pair of
polynomials (the chart of a pair of forms). -/
noncomputable def homComp (e : ℕ) (c p q : K[X]) : K[X] :=
  ∑ k ∈ Finset.range (e + 1), C (c.coeff k) * q ^ k * p ^ (e - k)

theorem eval_homComp (e : ℕ) (c p q : K[X]) (x : K) :
    (homComp e c p q).eval x = evalH e c (p.eval x) (q.eval x) := by
  simp [homComp, evalH, eval_finset_sum]

theorem natDegree_homComp_le (e d : ℕ) (c p q : K[X]) (hp : p.natDegree ≤ d)
    (hq : q.natDegree ≤ d) : (homComp e c p q).natDegree ≤ d * e := by
  unfold homComp
  apply natDegree_sum_le_of_forall_le
  intro k hk
  have hk' : k ≤ e := Nat.lt_succ_iff.1 (Finset.mem_range.1 hk)
  calc _ ≤ (C (c.coeff k) * q ^ k).natDegree + (p ^ (e - k)).natDegree := natDegree_mul_le
    _ ≤ (0 + k * d) + (e - k) * d := by
        apply add_le_add
        · exact natDegree_mul_le.trans
            (add_le_add (natDegree_C _).le (natDegree_pow_le_of_le k hq))
        · exact natDegree_pow_le_of_le _ hp
    _ = d * e := by rw [zero_add, ← add_mul, Nat.add_sub_cancel' hk', mul_comm]

theorem coeff_homComp (e d : ℕ) (c p q : K[X]) (hp : p.natDegree ≤ d) (hq : q.natDegree ≤ d) :
    (homComp e c p q).coeff (d * e) = evalH e c (p.coeff d) (q.coeff d) := by
  unfold homComp evalH
  rw [finset_sum_coeff]
  refine Finset.sum_congr rfl fun k hk => ?_
  have hk' : k ≤ e := Nat.lt_succ_iff.1 (Finset.mem_range.1 hk)
  have hidx : d * e = k * d + (e - k) * d := by
    rw [← add_mul, Nat.add_sub_cancel' hk', mul_comm]
  rw [hidx, mul_assoc, coeff_C_mul,
    coeff_mul_of_natDegree_le (natDegree_pow_le_of_le k hq) (natDegree_pow_le_of_le _ hp),
    coeff_pow_of_natDegree_le hq, coeff_pow_of_natDegree_le hp]
  ring

/-- `(p, q)` is a pair of binary forms of degree `d` without common zero on `ℙ¹`:
no common root in the chart, and not both top coefficients zero (the point at infinity). -/
def Reduced (d : ℕ) (p q : K[X]) : Prop :=
  p.natDegree ≤ d ∧ q.natDegree ≤ d ∧ (p.coeff d ≠ 0 ∨ q.coeff d ≠ 0) ∧
    ∀ x, p.eval x ≠ 0 ∨ q.eval x ≠ 0

theorem Reduced.evalH_ne {d : ℕ} {p q : K[X]} (h : Reduced d p q) {s0 s1 : K}
    (hs : s0 ≠ 0 ∨ s1 ≠ 0) : evalH d p s0 s1 ≠ 0 ∨ evalH d q s0 s1 ≠ 0 := by
  obtain ⟨hp, hq, htop, hroot⟩ := h
  by_cases h0 : s0 = 0
  · subst h0
    have h1 : s1 ≠ 0 := hs.resolve_left (by simp)
    rw [evalH_zero_left, evalH_zero_left]
    rcases htop with h | h
    · exact Or.inl (mul_ne_zero h (pow_ne_zero _ h1))
    · exact Or.inr (mul_ne_zero h (pow_ne_zero _ h1))
  · rw [evalH_of_ne d p hp _ _ h0, evalH_of_ne d q hq _ _ h0]
    rcases hroot (s1 / s0) with h | h
    · exact Or.inl (mul_ne_zero (pow_ne_zero _ h0) h)
    · exact Or.inr (mul_ne_zero (pow_ne_zero _ h0) h)

theorem natDegree_le_of_coeff_eq_zero {p : K[X]} {n : ℕ} (hp : p.natDegree ≤ n + 1)
    (h : p.coeff (n + 1) = 0) : p.natDegree ≤ n := by
  rcases Nat.lt_or_ge p.natDegree (n + 1) with h' | h'
  · omega
  · have heq : p.natDegree = n + 1 := le_antisymm hp h'
    have hl : p.leadingCoeff = 0 := by rw [leadingCoeff, heq, h]
    rw [leadingCoeff_eq_zero] at hl
    rw [hl, natDegree_zero] at heq
    omega

/-- **Removing common zeros** (the cancellation of `gcd(f, g)` in the prose, Satz F step 1):
every pair `(p, q) ≠ 0` of degree `≤ n` is `h · (p₀, q₀)` with a reduced pair of degree
`d ≤ n`. -/
theorem exists_reduced (n : ℕ) : ∀ p q : K[X], p.natDegree ≤ n → q.natDegree ≤ n →
    (p ≠ 0 ∨ q ≠ 0) → ∃ d ≤ n, ∃ h p0 q0 : K[X], p = h * p0 ∧ q = h * q0 ∧ Reduced d p0 q0 := by
  induction n with
  | zero =>
    intro p q hp hq hne
    refine ⟨0, le_rfl, 1, p, q, (one_mul p).symm, (one_mul q).symm, hp, hq, ?_, ?_⟩
    · rw [eq_C_of_natDegree_le_zero hp, eq_C_of_natDegree_le_zero hq] at hne
      rcases hne with h | h
      · exact Or.inl fun ha => h (by rw [ha, map_zero])
      · exact Or.inr fun hb => h (by rw [hb, map_zero])
    · intro x
      rw [eq_C_of_natDegree_le_zero hp, eq_C_of_natDegree_le_zero hq] at hne
      rw [eq_C_of_natDegree_le_zero hp, eq_C_of_natDegree_le_zero hq]
      simp only [eval_C]
      rcases hne with h | h
      · exact Or.inl fun ha => h (by rw [ha, map_zero])
      · exact Or.inr fun hb => h (by rw [hb, map_zero])
  | succ n ih =>
    intro p q hp hq hne
    by_cases htop : p.coeff (n + 1) = 0 ∧ q.coeff (n + 1) = 0
    · obtain ⟨d, hd, h, p0, q0, hp0, hq0, hred⟩ :=
        ih p q (natDegree_le_of_coeff_eq_zero hp htop.1)
          (natDegree_le_of_coeff_eq_zero hq htop.2) hne
      exact ⟨d, by omega, h, p0, q0, hp0, hq0, hred⟩
    · by_cases hroot : ∃ x, p.eval x = 0 ∧ q.eval x = 0
      · obtain ⟨x, hpx, hqx⟩ := hroot
        have hpe : (X - C x) * (p /ₘ (X - C x)) = p := mul_divByMonic_eq_iff_isRoot.2 hpx
        have hqe : (X - C x) * (q /ₘ (X - C x)) = q := mul_divByMonic_eq_iff_isRoot.2 hqx
        have hpd : (p /ₘ (X - C x)).natDegree ≤ n := by
          rw [natDegree_divByMonic _ (monic_X_sub_C x), natDegree_X_sub_C]
          omega
        have hqd : (q /ₘ (X - C x)).natDegree ≤ n := by
          rw [natDegree_divByMonic _ (monic_X_sub_C x), natDegree_X_sub_C]
          omega
        have hne' : p /ₘ (X - C x) ≠ 0 ∨ q /ₘ (X - C x) ≠ 0 := by
          rcases hne with h | h
          · exact Or.inl fun h0 => h (by rw [← hpe, h0, mul_zero])
          · exact Or.inr fun h0 => h (by rw [← hqe, h0, mul_zero])
        obtain ⟨d, hd, h, p0, q0, hp0, hq0, hred⟩ := ih _ _ hpd hqd hne'
        refine ⟨d, by omega, (X - C x) * h, p0, q0, ?_, ?_, hred⟩
        · rw [mul_assoc, ← hp0, hpe]
        · rw [mul_assoc, ← hq0, hqe]
      · refine ⟨n + 1, le_rfl, 1, p, q, (one_mul p).symm, (one_mul q).symm, hp, hq, ?_, ?_⟩
        · exact not_and_or.1 htop
        · intro x
          by_cases hpx : p.eval x = 0
          · exact Or.inr fun hqx => hroot ⟨x, hpx, hqx⟩
          · exact Or.inl hpx

/-- **The degree argument** (prose Satz F steps 2 to 4, in the elementary form E2, E3 of the
review). Let `Φ = (p, q)` and `Ψ = (p', q')` be reduced pairs of degrees `d` and `e` (over an
algebraically closed field). If `x · Ψ₀(Φ(x)) = Ψ₁(Φ(x))` (that is, `ψ ∘ φ` fixes `x`) for more
than `d e + 1` distinct `x`, then `d = e = 1`. -/
theorem deg_eq_one [IsAlgClosed K] {d e : ℕ} {p q p' q' : K[X]} (hΦ : Reduced d p q)
    (hΨ : Reduced e p' q') (S : Finset K) (hcard : d * e + 1 < S.card)
    (hS : ∀ x ∈ S, x * (homComp e p' p q).eval x = (homComp e q' p q).eval x) :
    d = 1 ∧ e = 1 := by
  set P := homComp e p' p q with hPdef
  set Q := homComp e q' p q with hQdef
  have hPdeg : P.natDegree ≤ d * e := natDegree_homComp_le e d p' p q hΦ.1 hΦ.2.1
  have hQdeg : Q.natDegree ≤ d * e := natDegree_homComp_le e d q' p q hΦ.1 hΦ.2.1
  -- Bézout by fixed points: `X P - Q` has more roots than its degree
  have hR : X * P - Q = 0 := by
    apply eq_zero_of_natDegree_lt_card_of_eval_eq_zero' _ S
    · intro x hx
      rw [eval_sub, eval_mul, eval_X, hS x hx, sub_self]
    · calc (X * P - Q).natDegree ≤ max (X * P).natDegree Q.natDegree := natDegree_sub_le _ _
        _ ≤ d * e + 1 := by
          apply max_le _ (by omega)
          calc (X * P).natDegree ≤ X.natDegree + P.natDegree := natDegree_mul_le
            _ ≤ 1 + d * e := add_le_add natDegree_X_le hPdeg
            _ = d * e + 1 := by ring
        _ < S.card := hcard
  have hQ : Q = X * P := (sub_eq_zero.1 hR).symm
  -- `(P, Q)` has no common zero on `ℙ¹`
  have hcommon : ∀ x, P.eval x ≠ 0 ∨ Q.eval x ≠ 0 := by
    intro x
    rw [hPdef, hQdef, eval_homComp, eval_homComp]
    exact hΨ.evalH_ne (hΦ.2.2.2 x)
  have htop : P.coeff (d * e) ≠ 0 ∨ Q.coeff (d * e) ≠ 0 := by
    rw [hPdef, hQdef, coeff_homComp e d p' p q hΦ.1 hΦ.2.1,
      coeff_homComp e d q' p q hΦ.1 hΦ.2.1]
    exact hΨ.evalH_ne hΦ.2.2.1
  -- `P` is a constant
  have hP0 : P.natDegree = 0 := by
    by_contra hne
    have hPne : P ≠ 0 := by
      intro h
      rw [h, natDegree_zero] at hne
      exact hne rfl
    obtain ⟨θ, hθ⟩ := IsAlgClosed.exists_root P (by
      rw [degree_eq_natDegree hPne]
      exact_mod_cast hne)
    have hQθ : Q.eval θ = 0 := by rw [hQ, eval_mul, hθ.eq_zero, mul_zero]
    rcases hcommon θ with h | h
    · exact h hθ.eq_zero
    · exact h hQθ
  have hPC : P = C (P.coeff 0) := eq_C_of_natDegree_eq_zero hP0
  have hc0 : P.coeff 0 ≠ 0 := by
    intro h0
    have hP : P = 0 := by rw [hPC, h0, map_zero]
    rcases hcommon 0 with h | h
    · exact h (by rw [hP, eval_zero])
    · exact h (by rw [hQ, hP, mul_zero, eval_zero])
  have hQdeg1 : Q.natDegree = 1 := by
    rw [hQ, hPC, mul_comm]
    exact natDegree_C_mul_X _ hc0
  have hde : d * e = 1 := by
    by_contra hne
    have h2 : 2 ≤ d * e := by omega
    rcases htop with h | h
    · exact h (coeff_eq_zero_of_natDegree_lt (by omega))
    · exact h (coeff_eq_zero_of_natDegree_lt (by omega))
  exact ⟨Nat.eq_one_of_mul_eq_one_right hde, Nat.eq_one_of_mul_eq_one_left hde⟩

/-- A reduced pair of degree 1 is an invertible linear map: `det ≠ 0`. -/
theorem Reduced.det_ne_zero {p q : K[X]} (h : Reduced 1 p q) :
    p.coeff 0 * q.coeff 1 - p.coeff 1 * q.coeff 0 ≠ 0 := by
  intro hdet
  by_cases hp : p.coeff 0 = 0 ∧ p.coeff 1 = 0
  · -- the point `(q₁, -q₀)`
    have hs : q.coeff 1 ≠ 0 ∨ -q.coeff 0 ≠ 0 := by
      by_contra hc
      push_neg at hc
      have := h.evalH_ne (s0 := 1) (s1 := 0) (Or.inl one_ne_zero)
      rw [evalH_deg_one, evalH_deg_one] at this
      simp [hp.1, neg_eq_zero.1 hc.2] at this
    have := h.evalH_ne hs
    rw [evalH_deg_one, evalH_deg_one, hp.1, hp.2] at this
    simp only [zero_mul, add_zero, ne_eq, not_true_eq_false, false_or] at this
    exact this (by ring)
  · -- the point `(-p₁, p₀)`
    have hs : -p.coeff 1 ≠ 0 ∨ p.coeff 0 ≠ 0 := by
      by_contra hc
      push_neg at hc
      exact hp ⟨hc.2, neg_eq_zero.1 hc.1⟩
    have := h.evalH_ne hs
    rw [evalH_deg_one, evalH_deg_one] at this
    rcases this with h1 | h1
    · exact h1 (by ring)
    · exact h1 (by linear_combination hdet)

end Forms

/-! ## The core of Satz F for vectors

`a_t, b_t ∈ K⁴`. Side 1 ((B2) of the prose): `b_t = c_t N_b m(a_t·u₀, a_t·u₁)` with the moment
vector `m(s₀, s₁) = (s₀³, s₀² s₁, s₀ s₁², s₁³)` and an invertible `N_b`. Side 2 ((B3)): the same
with the roles of `a` and `b` exchanged. With `a_t·u₀ ≠ 0` and `b_t·w₀ ≠ 0` all parameters lie in
the affine charts. -/

section Kern

variable {K : Type u} [Field K]

open Matrix

/-- The moment vector `(s₀³, s₀² s₁, s₀ s₁², s₁³)` (the twisted cubic). -/
def mom (x0 x1 : K) : Fin 4 → K := ![x0 ^ 3, x0 ^ 2 * x1, x0 * x1 ^ 2, x1 ^ 3]

theorem mom_smul (l x0 x1 : K) : mom (l * x0) (l * x1) = l ^ 3 • mom x0 x1 := by
  ext i
  fin_cases i <;> simp [mom] <;> ring

theorem mom_chart (x0 x1 : K) (h0 : x0 ≠ 0) : mom x0 x1 = x0 ^ 3 • mom 1 (x1 / x0) := by
  have h1 : x0 * (x1 / x0) = x1 := by field_simp
  rw [← mom_smul, mul_one, h1]

/-- The polynomial `v₀ + v₁ X + v₂ X² + v₃ X³`. -/
noncomputable def polyOf (v : Fin 4 → K) : K[X] :=
  C (v 0) + C (v 1) * X + C (v 2) * X ^ 2 + C (v 3) * X ^ 3

theorem natDegree_polyOf_le (v : Fin 4 → K) : (polyOf v).natDegree ≤ 3 := by
  unfold polyOf
  compute_degree!

theorem evalH_polyOf (v : Fin 4 → K) (s0 s1 : K) :
    evalH 3 (polyOf v) s0 s1 = mom s0 s1 ⬝ᵥ v := by
  simp [evalH, polyOf, Finset.sum_range_succ, mom, dotProduct, Fin.sum_univ_four, coeff_X,
    coeff_C, coeff_X_pow]
  ring

theorem mulVec_dot (N : Matrix (Fin 4) (Fin 4) K) (m u : Fin 4 → K) :
    (N *ᵥ m) ⬝ᵥ u = m ⬝ᵥ (Nᵀ *ᵥ u) := by
  rw [dotProduct_comm, dotProduct_mulVec, ← mulVec_transpose, dotProduct_comm]

theorem dot_chart (c : K) (N : Matrix (Fin 4) (Fin 4) K) (s0 s1 : K) (u : Fin 4 → K)
    (h0 : s0 ≠ 0) :
    (c • N *ᵥ mom s0 s1) ⬝ᵥ u = c * (s0 ^ 3 * (polyOf (Nᵀ *ᵥ u)).eval (s1 / s0)) := by
  rw [smul_dotProduct, mulVec_dot, ← evalH_polyOf,
    evalH_of_ne 3 _ (natDegree_polyOf_le _) _ _ h0, smul_eq_mul]

/-- `Sym³ L`: `Sym³ L · m(s) = m(L s)`. -/
def sym3 (L : Matrix (Fin 2) (Fin 2) K) : Matrix (Fin 4) (Fin 4) K :=
  !![L 0 0 ^ 3, 3 * L 0 0 ^ 2 * L 0 1, 3 * L 0 0 * L 0 1 ^ 2, L 0 1 ^ 3;
    L 0 0 ^ 2 * L 1 0, L 0 0 ^ 2 * L 1 1 + 2 * L 0 0 * L 0 1 * L 1 0,
      2 * L 0 0 * L 0 1 * L 1 1 + L 0 1 ^ 2 * L 1 0, L 0 1 ^ 2 * L 1 1;
    L 0 0 * L 1 0 ^ 2, 2 * L 0 0 * L 1 0 * L 1 1 + L 0 1 * L 1 0 ^ 2,
      L 0 0 * L 1 1 ^ 2 + 2 * L 0 1 * L 1 0 * L 1 1, L 0 1 * L 1 1 ^ 2;
    L 1 0 ^ 3, 3 * L 1 0 ^ 2 * L 1 1, 3 * L 1 0 * L 1 1 ^ 2, L 1 1 ^ 3]

theorem sym3_mulVec (L : Matrix (Fin 2) (Fin 2) K) (x0 x1 : K) :
    sym3 L *ᵥ mom x0 x1 = mom (L 0 0 * x0 + L 0 1 * x1) (L 1 0 * x0 + L 1 1 * x1) := by
  ext i
  fin_cases i <;> simp [sym3, mom, mulVec, dotProduct, Fin.sum_univ_four] <;> ring

theorem sym3_mul (A B : Matrix (Fin 2) (Fin 2) K) : sym3 (A * B) = sym3 A * sym3 B := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sym3, Matrix.mul_apply, Fin.sum_univ_four, Fin.sum_univ_two] <;> ring

theorem sym3_one : sym3 (1 : Matrix (Fin 2) (Fin 2) K) = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [sym3]

theorem isUnit_det_sym3 {L : Matrix (Fin 2) (Fin 2) K} (hL : IsUnit L.det) :
    IsUnit (sym3 L).det :=
  isUnit_det_of_right_inverse (B := sym3 L⁻¹) (by rw [← sym3_mul, mul_nonsing_inv _ hL, sym3_one])

theorem eval_deg_one (c : K[X]) (hc : c.natDegree ≤ 1) (x : K) :
    c.eval x = c.coeff 0 + c.coeff 1 * x := by
  rw [eval_eq_sum_range' (n := 2) (by omega)]
  simp [Finset.sum_range_succ]

/-- **Satz F, core** (prose Section 5, steps 1 to 4; review E2, E3). Over an algebraically
closed field: if both sides have the cubic structure of (B2) and (B3) and at least 11 of the
points `[a_t ⊗ b_t]` are pairwise distinct, then there is an invertible `G` with
`G b_t ∈ K·a_t` for all `t` (the decomposition is symmetric at this point). -/
theorem satzF_kern [IsAlgClosed K] {r : ℕ} (a b : Fin r → Fin 4 → K)
    (u0 u1 w0 w1 : Fin 4 → K) (Na Nb : Matrix (Fin 4) (Fin 4) K) (ca cb : Fin r → K)
    (hNa : IsUnit Na.det) (hNb : IsUnit Nb.det)
    (ha : ∀ t, a t = ca t • Na *ᵥ mom (b t ⬝ᵥ w0) (b t ⬝ᵥ w1))
    (hb : ∀ t, b t = cb t • Nb *ᵥ mom (a t ⬝ᵥ u0) (a t ⬝ᵥ u1))
    (hu : ∀ t, a t ⬝ᵥ u0 ≠ 0) (hw : ∀ t, b t ⬝ᵥ w0 ≠ 0)
    (T : Finset (Fin r)) (hT : 11 ≤ T.card)
    (hdist : ∀ s ∈ T, ∀ t ∈ T, s ≠ t →
      ¬ ((∃ c : K, a s = c • a t) ∧ ∃ c : K, b s = c • b t)) :
    ∃ G : Matrix (Fin 4) (Fin 4) K, IsUnit G.det ∧ ∀ t, ∃ μ : K, G *ᵥ b t = μ • a t := by
  classical
  -- affine parameters `x_t = τ₁/τ₀`, `y_t = σ₁/σ₀`
  let x : Fin r → K := fun t => (b t ⬝ᵥ w1) / (b t ⬝ᵥ w0)
  let y : Fin r → K := fun t => (a t ⬝ᵥ u1) / (a t ⬝ᵥ u0)
  let pA := polyOf (Naᵀ *ᵥ u0)
  let qA := polyOf (Naᵀ *ᵥ u1)
  let pB := polyOf (Nbᵀ *ᵥ w0)
  let qB := polyOf (Nbᵀ *ᵥ w1)
  have hA0 : ∀ t, a t ⬝ᵥ u0 = ca t * ((b t ⬝ᵥ w0) ^ 3 * pA.eval (x t)) := fun t => by
    conv_lhs => rw [ha t]
    exact dot_chart _ _ _ _ _ (hw t)
  have hA1 : ∀ t, a t ⬝ᵥ u1 = ca t * ((b t ⬝ᵥ w0) ^ 3 * qA.eval (x t)) := fun t => by
    conv_lhs => rw [ha t]
    exact dot_chart _ _ _ _ _ (hw t)
  have hB0 : ∀ t, b t ⬝ᵥ w0 = cb t * ((a t ⬝ᵥ u0) ^ 3 * pB.eval (y t)) := fun t => by
    conv_lhs => rw [hb t]
    exact dot_chart _ _ _ _ _ (hu t)
  have hB1 : ∀ t, b t ⬝ᵥ w1 = cb t * ((a t ⬝ᵥ u0) ^ 3 * qB.eval (y t)) := fun t => by
    conv_lhs => rw [hb t]
    exact dot_chart _ _ _ _ _ (hu t)
  have hca : ∀ t, ca t ≠ 0 := fun t h => hu t (by rw [hA0 t, h, zero_mul])
  have hcb : ∀ t, cb t ≠ 0 := fun t h => hw t (by rw [hB0 t, h, zero_mul])
  have hpA : ∀ t, pA.eval (x t) ≠ 0 := fun t h => hu t (by rw [hA0 t, h, mul_zero, mul_zero])
  have hpB : ∀ t, pB.eval (y t) ≠ 0 := fun t h => hw t (by rw [hB0 t, h, mul_zero, mul_zero])
  have hy : ∀ t, y t = qA.eval (x t) / pA.eval (x t) := fun t => by
    show (a t ⬝ᵥ u1) / (a t ⬝ᵥ u0) = _
    rw [hA0 t, hA1 t]
    have := hca t
    have := hw t
    have := hpA t
    field_simp
    ring
  have hx : ∀ t, x t = qB.eval (y t) / pB.eval (y t) := fun t => by
    show (b t ⬝ᵥ w1) / (b t ⬝ᵥ w0) = _
    rw [hB0 t, hB1 t]
    have := hcb t
    have := hu t
    have := hpB t
    field_simp
    ring
  -- the chart forms of `a_t` and `b_t`
  have haC : ∀ t, a t = (ca t * (b t ⬝ᵥ w0) ^ 3) • Na *ᵥ mom 1 (x t) := fun t => by
    conv_lhs => rw [ha t]
    rw [mom_chart _ _ (hw t), mulVec_smul, smul_smul]
  have hbC : ∀ t, b t = (cb t * (a t ⬝ᵥ u0) ^ 3) • Nb *ᵥ mom 1 (y t) := fun t => by
    conv_lhs => rw [hb t]
    rw [mom_chart _ _ (hu t), mulVec_smul, smul_smul]
  -- a point of `T`
  obtain ⟨t0, ht0⟩ : T.Nonempty := Finset.card_pos.1 (by omega)
  -- remove the common zeros of both cubic maps
  have hpA0 : pA ≠ 0 := fun h => hpA t0 (by rw [h, eval_zero])
  have hpB0 : pB ≠ 0 := fun h => hpB t0 (by rw [h, eval_zero])
  obtain ⟨dA, hdA, hA, pA', qA', hpAe, hqAe, redA⟩ :=
    exists_reduced 3 pA qA (natDegree_polyOf_le _) (natDegree_polyOf_le _) (Or.inl hpA0)
  obtain ⟨dB, hdB, hB, pB', qB', hpBe, hqBe, redB⟩ :=
    exists_reduced 3 pB qB (natDegree_polyOf_le _) (natDegree_polyOf_le _) (Or.inl hpB0)
  have hpA' : ∀ t, pA'.eval (x t) ≠ 0 := fun t h => hpA t (by rw [hpAe, eval_mul, h, mul_zero])
  have hhA : ∀ t, hA.eval (x t) ≠ 0 := fun t h => hpA t (by rw [hpAe, eval_mul, h, zero_mul])
  have hpB' : ∀ t, pB'.eval (y t) ≠ 0 := fun t h => hpB t (by rw [hpBe, eval_mul, h, mul_zero])
  have hhB : ∀ t, hB.eval (y t) ≠ 0 := fun t h => hpB t (by rw [hpBe, eval_mul, h, zero_mul])
  have hy' : ∀ t, y t = qA'.eval (x t) / pA'.eval (x t) := fun t => by
    rw [hy t, hpAe, hqAe, eval_mul, eval_mul, mul_div_mul_left _ _ (hhA t)]
  have hx' : ∀ t, x t = qB'.eval (y t) / pB'.eval (y t) := fun t => by
    rw [hx t, hpBe, hqBe, eval_mul, eval_mul, mul_div_mul_left _ _ (hhB t)]
  -- fixed points of `ψ ∘ φ`
  have hfix : ∀ t, x t * (homComp dB pB' pA' qA').eval (x t) =
      (homComp dB qB' pA' qA').eval (x t) := fun t => by
    rw [eval_homComp, eval_homComp, evalH_of_ne _ _ redB.1 _ _ (hpA' t),
      evalH_of_ne _ _ redB.2.1 _ _ (hpA' t), ← hy' t]
    have hxy := hx' t
    have := hpB' t
    rw [hxy]
    field_simp
    ring
  -- the parameters `x_t`, `t ∈ T`, are pairwise distinct
  have hinj : Set.InjOn x T := by
    intro s hs t ht hst
    by_contra hne
    apply hdist s hs t ht hne
    constructor
    · refine ⟨(ca s * (b s ⬝ᵥ w0) ^ 3) / (ca t * (b t ⬝ᵥ w0) ^ 3), ?_⟩
      rw [haC s, haC t, smul_smul, hst]
      congr 1
      have := hca t
      have := hw t
      field_simp
    · refine ⟨(cb s * (a s ⬝ᵥ u0) ^ 3) / (cb t * (a t ⬝ᵥ u0) ^ 3), ?_⟩
      have hys : y s = y t := by rw [hy' s, hy' t, hst]
      rw [hbC s, hbC t, smul_smul, hys]
      congr 1
      have := hcb t
      have := hu t
      field_simp
  have hcardS : (T.image x).card = T.card := Finset.card_image_of_injOn hinj
  have hde : dA * dB ≤ 9 := by
    calc dA * dB ≤ 3 * 3 := Nat.mul_le_mul hdA hdB
      _ = 9 := by norm_num
  obtain ⟨hdA1, -⟩ := deg_eq_one redA redB (T.image x) (by omega) (by
    intro z hz
    obtain ⟨t, -, rfl⟩ := Finset.mem_image.1 hz
    exact hfix t)
  subst hdA1
  -- `φ` is linear: `L`
  let L : Matrix (Fin 2) (Fin 2) K := !![pA'.coeff 0, pA'.coeff 1; qA'.coeff 0, qA'.coeff 1]
  have hL : IsUnit L.det := by
    rw [isUnit_iff_ne_zero, Matrix.det_fin_two_of]
    exact redA.det_ne_zero
  have hpl : ∀ t, pA'.eval (x t) = pA'.coeff 0 + pA'.coeff 1 * x t :=
    fun t => eval_deg_one _ redA.1 _
  have hql : ∀ t, qA'.eval (x t) = qA'.coeff 0 + qA'.coeff 1 * x t :=
    fun t => eval_deg_one _ redA.2.1 _
  -- `m(1, y_t) = (p₀ + p₁ x_t)⁻³ Sym³ L · m(1, x_t)`
  have hmom : ∀ t, mom 1 (y t) = (pA'.eval (x t))⁻¹ ^ 3 • (sym3 L *ᵥ mom 1 (x t)) := fun t => by
    have e00 : L 0 0 = pA'.coeff 0 := rfl
    have e01 : L 0 1 = pA'.coeff 1 := rfl
    have e10 : L 1 0 = qA'.coeff 0 := rfl
    have e11 : L 1 1 = qA'.coeff 1 := rfl
    rw [sym3_mulVec, e00, e01, e10, e11, mul_one, mul_one, ← hpl t, ← hql t, ← mom_smul,
      hy' t]
    have := hpA' t
    have h1 : (pA'.eval (x t))⁻¹ * pA'.eval (x t) = 1 := inv_mul_cancel₀ this
    rw [h1, div_eq_inv_mul]
  refine ⟨Na * (sym3 L)⁻¹ * Nb⁻¹, ?_, fun t => ?_⟩
  · rw [det_mul, det_mul]
    exact ((hNa.mul (isUnit_nonsing_inv_det _ (isUnit_det_sym3 hL))).mul
      (isUnit_nonsing_inv_det _ hNb))
  · obtain ⟨α, hα0, hat⟩ : ∃ α : K, α ≠ 0 ∧ a t = α • Na *ᵥ mom 1 (x t) :=
      ⟨_, mul_ne_zero (hca t) (pow_ne_zero _ (hw t)), haC t⟩
    obtain ⟨β, hbt⟩ : ∃ β : K, b t = β • Nb *ᵥ mom 1 (y t) := ⟨_, hbC t⟩
    have hG : (Na * (sym3 L)⁻¹ * Nb⁻¹) *ᵥ (Nb *ᵥ (sym3 L *ᵥ mom 1 (x t))) =
        Na *ᵥ mom 1 (x t) := by
      rw [mulVec_mulVec, mulVec_mulVec]
      congr 1
      simp only [Matrix.mul_assoc, nonsing_inv_mul_cancel_left _ _ hNb,
        nonsing_inv_mul _ (isUnit_det_sym3 hL), Matrix.mul_one]
    refine ⟨β * (pA'.eval (x t))⁻¹ ^ 3 / α, ?_⟩
    rw [hbt, hmom t, mulVec_smul, mulVec_smul, mulVec_smul, hG, smul_smul, hat, smul_smul]
    congr 1
    have := hpA' t
    field_simp
    try ring

end Kern

/-! ## (B0) to (B2) without Kronecker: the cubic structure from a tight pair

If `Ψ(u₀, ·)` and `Ψ(u₁, ·)` take values in a space of dimension `≤ 5`, the chain of Satz E
(`SatzE444.exists_chain`, the review's E4 in another form) gives a basis `v_0, …, v_3` with
`Ψ(u₁, v_k) = Ψ(u₀, v_{k+1})`; in coordinate `t` this is `A₂ B_k = A₁ B_{k+1}`, hence
`b_t·v_k = c_t A₁^{3-k} A₂^k` (the Hankel step (B2) of the prose). -/

section Seite

variable {K : Type u} [Field K]

open Matrix

theorem kubik_of_chain (A1 A2 : K) (hA1 : A1 ≠ 0) (B : Fin 4 → K)
    (hB : ∀ k : Fin 3, A2 * B k.castSucc = A1 * B k.succ) :
    B = (B 0 / A1 ^ 3) • mom A1 A2 := by
  have h0 : A2 * B 0 = A1 * B 1 := hB 0
  have h1 : A2 * B 1 = A1 * B 2 := hB 1
  have h2 : A2 * B 2 = A1 * B 3 := hB 2
  have e2 : B 2 * A1 ^ 2 = A2 ^ 2 * B 0 := by linear_combination (-A1) * h1 + (-A2) * h0
  ext i
  rw [Pi.smul_apply, smul_eq_mul, div_mul_eq_mul_div, eq_div_iff (pow_ne_zero 3 hA1)]
  fin_cases i
  · show B 0 * A1 ^ 3 = B 0 * A1 ^ 3
    ring
  · show B 1 * A1 ^ 3 = B 0 * (A1 ^ 2 * A2)
    linear_combination (-A1 ^ 2) * h0
  · show B 2 * A1 ^ 3 = B 0 * (A1 * A2 ^ 2)
    linear_combination A1 * e2
  · show B 3 * A1 ^ 3 = B 0 * A2 ^ 3
    linear_combination (-A1 ^ 2) * h2 + A2 * e2

/-- **(B2) from a tight pair.** Let `Ψ(u, w)_t = (x_t·u)(z_t·w)` be nonsingular, `x_t·u₀ ≠ 0`
for all `t`, `u₁ ∉ K u₀`, and let `Ψ(u₀, K⁴) + Ψ(u₁, K⁴)` lie in a space of dimension `≤ 5`.
Then `z_t = c_t N m(x_t·u₀, x_t·u₁)` with one invertible `N` (algebraically closed field). -/
theorem kubik_seite [IsAlgClosed K] {r : ℕ} (x z : Fin r → Fin 4 → K)
    (hns : ∀ u w : Fin 4 → K, u ≠ 0 → (∀ t, (x t ⬝ᵥ u) * (z t ⬝ᵥ w) = 0) → w = 0)
    (u0 u1 : Fin 4 → K) (hu0 : u0 ≠ 0) (h0 : ∀ t, x t ⬝ᵥ u0 ≠ 0) (h01 : ∀ c : K, u1 ≠ c • u0)
    (P : Submodule K (Fin r → K)) (hP : finrank K P ≤ 5)
    (hmem0 : ∀ w, (fun t => (x t ⬝ᵥ u0) * (z t ⬝ᵥ w)) ∈ P)
    (hmem1 : ∀ w, (fun t => (x t ⬝ᵥ u1) * (z t ⬝ᵥ w)) ∈ P) :
    ∃ (N : Matrix (Fin 4) (Fin 4) K) (c : Fin r → K), IsUnit N.det ∧
      ∀ t, z t = c t • N *ᵥ mom (x t ⬝ᵥ u0) (x t ⬝ᵥ u1) := by
  classical
  let M : (Fin 4 → K) → (Fin 4 → K) →ₗ[K] (Fin r → K) := fun u =>
    { toFun := fun w t => (x t ⬝ᵥ u) * (z t ⬝ᵥ w)
      map_add' := fun w w' => by ext t; simp [dotProduct_add, mul_add]
      map_smul' := fun c w => by ext t; simp [dotProduct_smul]; ring }
  have hM : ∀ u w t, M u w t = (x t ⬝ᵥ u) * (z t ⬝ᵥ w) := fun _ _ _ => rfl
  obtain ⟨v, hv, hrel⟩ := SatzE444.exists_chain (M u0) (M u1) P hP hmem0 hmem1
    (fun w hw => hns u0 w hu0 fun t => by rw [← hM, hw, Pi.zero_apply])
    (fun μ w hw => by
      apply hns (u1 - μ • u0) w (sub_ne_zero.2 (h01 μ))
      intro t
      have := congrFun hw t
      rw [Pi.smul_apply, hM, hM, smul_eq_mul] at this
      rw [dotProduct_sub, dotProduct_smul, smul_eq_mul, sub_mul, this]
      ring)
  -- the rows `v_k` form an invertible matrix
  let V : Matrix (Fin 4) (Fin 4) K := Matrix.of fun k i => v k i
  have hV : IsUnit V.det := by
    rw [← Matrix.isUnit_iff_isUnit_det, ← linearIndependent_rows_iff_isUnit]
    exact hv
  refine ⟨V⁻¹, fun t => (z t ⬝ᵥ v 0) / (x t ⬝ᵥ u0) ^ 3, isUnit_nonsing_inv_det _ hV,
    fun t => ?_⟩
  have hVz : V *ᵥ z t = fun k => z t ⬝ᵥ v k := by
    ext k
    simp only [V, mulVec, Matrix.of_apply]
    exact dotProduct_comm _ _
  have hchain := kubik_of_chain (x t ⬝ᵥ u0) (x t ⬝ᵥ u1) (h0 t) (fun k => z t ⬝ᵥ v k)
    (fun k => by
      have := congrFun (hrel k) t
      rw [hM, hM] at this
      exact this)
  rw [← hVz] at hchain
  calc z t = V⁻¹ *ᵥ (V *ᵥ z t) := by
        rw [mulVec_mulVec, nonsing_inv_mul _ hV, one_mulVec]
    _ = _ := by
        rw [hchain, mulVec_smul]
        simp only [hVz]

end Seite

/-! ## Application to a normal form: Satz F with named hypotheses -/

section Anwendung

open YangN4Haupt SatzA444 SatzE444 SatzE444Buendel Matrix

variable {K : Type u} [Field K] {r : ℕ} (alg : BilinearAlgorithm K 4 2 4 r)

/-- `b_t` as a vector of `K⁴`: `b_t·y = β_t(emb y)`. -/
def bvecs (t : Fin r) : Fin 4 → K := fun i => alg.beta t (emb (Pi.single i 1))

theorem beta_emb (t : Fin r) (y : Fin 4 → K) : alg.beta t (emb y) = bvecs alg t ⬝ᵥ y := by
  have h := LinearMap.pi_apply_eq_sum_univ (alg.beta t ∘ₗ emb) y
  simp only [LinearMap.comp_apply] at h
  rw [h, dotProduct]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [smul_eq_mul, mul_comm]
  congr 3
  ext j
  simp [Pi.single_apply, eq_comm]

/-- `Ψ(u, y)_t = (a_t·u)(b_t·y)` with dot products. -/
theorem psi_dot (u y : Fin 4 → K) (t : Fin r) :
    psi alg u y t = (SatzB444.avecs alg t ⬝ᵥ u) * (bvecs alg t ⬝ᵥ y) := by
  rw [psi_apply_apply, beta_emb, dotProduct]
  congr 1
  exact Finset.sum_congr rfl fun i _ => mul_comm _ _

/-- (Ψ1) with dot products. -/
theorem nonsing (h2 : SN2 (d := 3) alg) (u y : Fin 4 → K) (hy : y ≠ 0)
    (h : ∀ t, (SatzB444.avecs alg t ⬝ᵥ u) * (bvecs alg t ⬝ᵥ y) = 0) : u = 0 := by
  apply SatzB444.psi_nonsing alg h2 u y hy
  intro t
  rw [beta_emb, ← h t, dotProduct]
  congr 1
  exact Finset.sum_congr rfl fun i _ => mul_comm _ _

/-- **(B0) to (B2) for sub-case B** (prose Section 4; review: sub-case B is used only through
`rk F_{γ*} = 1`). With `u₀ = e₀` and `u* = (0, γ*)`: `b_t = c_t N m(a_t·e₀, a_t·u*)`. -/
theorem kubik_of_unterfallB [IsAlgClosed K] (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hB : UnterfallB alg) :
    ∃ (u1 : Fin 4 → K) (N : Matrix (Fin 4) (Fin 4) K) (c : Fin r → K), IsUnit N.det ∧
      ∀ t, bvecs alg t = c t • N *ᵥ
        mom (SatzB444.avecs alg t ⬝ᵥ Pi.single 0 1) (SatzB444.avecs alg t ⬝ᵥ u1) := by
  classical
  obtain ⟨-, γs, hγ0, -, hrk, -⟩ := hB
  obtain ⟨q, -, hq⟩ := LemmaP444.exists_eq_span_of_finrank_one _ hrk
  obtain ⟨q', rfl⟩ := Submodule.Quotient.mk_surjective _ q
  let u1 : Fin 4 → K := Fin.cons 0 γs
  let P : Submodule K (Fin r → K) := J (d := 3) alg ⊔ K ∙ q'
  have hP : finrank K P ≤ 5 := by
    have hJ : finrank K (J (d := 3) alg) ≤ 4 := by
      have := LinearMap.finrank_range_le (φ (d := 3) alg 0)
      rwa [Module.finrank_fin_fun] at this
    have hs : finrank K (K ∙ q') ≤ 1 := by
      have := finrank_span_le_card (R := K) ({q'} : Set (Fin r → K))
      simpa using this
    have := Submodule.finrank_add_le_finrank_add_finrank (J (d := 3) alg) (K ∙ q')
    show finrank K (J (d := 3) alg ⊔ K ∙ q' : Submodule K (Fin r → K)) ≤ 5
    omega
  -- `Ψ(u*, y) = ∑ γ_i f_{i+1}(y)` and `[Ψ(u*, y)] = F_{γ*}(y)`
  have hpsi1 : ∀ y, π (d := 3) alg (psi alg u1 y) = Fc alg γs y := by
    intro y
    rw [psi_apply, Fin.sum_univ_succ]
    simp only [u1, Fin.cons_zero, Fin.cons_succ, zero_smul, zero_add, map_sum, map_smul]
    rw [Fc_eq, LinearMap.sum_apply]
    rfl
  obtain ⟨N, c, hN, hz⟩ := kubik_seite (SatzB444.avecs alg) (bvecs alg)
    (fun u w hu h => by
      rcases eq_or_ne w 0 with hw | hw
      · exact hw
      · exact absurd (nonsing alg h2 u w hw h) hu)
    (Pi.single 0 1) u1 (by simp)
    (fun t => by
      rw [dotProduct_single, mul_one]
      exact SatzB444.avecs_zero_ne alg h1 t)
    (fun c hc => by
      apply hγ0
      funext i
      have := congrFun hc i.succ
      simpa [u1, Pi.single_apply, Fin.succ_ne_zero] using this)
    P hP
    (fun w => by
      have : (fun t => (SatzB444.avecs alg t ⬝ᵥ Pi.single 0 1) * (bvecs alg t ⬝ᵥ w)) =
          φ (d := 3) alg 0 w := by
        ext t
        rw [← psi_dot, psi_single]
      rw [this]
      exact Submodule.mem_sup_left ⟨w, rfl⟩)
    (fun w => by
      have : (fun t => (SatzB444.avecs alg t ⬝ᵥ u1) * (bvecs alg t ⬝ᵥ w)) = psi alg u1 w := by
        ext t
        rw [psi_dot]
      rw [this]
      have hmem : Fc alg γs w ∈ K ∙ Submodule.Quotient.mk q' := by
        rw [← hq]
        exact LinearMap.mem_range_self _ _
      obtain ⟨a, ha⟩ := Submodule.mem_span_singleton.1 hmem
      have hJ : psi alg u1 w - a • q' ∈ J (d := 3) alg := by
        rw [← π_eq_zero_iff, map_sub, hpsi1, map_smul, ← ha]
        simp [π]
      have : psi alg u1 w = (psi alg u1 w - a • q') + a • q' := by abel
      rw [this]
      show _ ∈ (J (d := 3) alg ⊔ K ∙ q' : Submodule K (Fin r → K))
      exact Submodule.add_mem _ (Submodule.mem_sup_left hJ)
        (Submodule.mem_sup_right (Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _))))
  exact ⟨u1, N, c, hN, hz⟩

/-- **Named hypothesis (B3′): a tight pair on the other side at the same point.** There are
`w₀, w₁` with `b_t·w₀ ≠ 0` for all `t`, `w₁ ∉ K w₀`, and `Ψ(K⁴, w₀) + Ψ(K⁴, w₁)` inside a space
of dimension `≤ 5`. This is (B0) for the transposed decomposition at the same point
(prose Section 4, (B3), with the review's repair R-F3). It is **not** proved here: deriving it
needs the transposed decomposition in normal form at the same point (case (5,8), not
symmetric, Lemma P and Satz E for it). -/
def TransponiertEng : Prop :=
  ∃ w0 w1 : Fin 4 → K, w0 ≠ 0 ∧ (∀ t, bvecs alg t ⬝ᵥ w0 ≠ 0) ∧ (∀ c : K, w1 ≠ c • w0) ∧
    ∃ P : Submodule K (Fin r → K), finrank K P ≤ 5 ∧ ∀ u, psi alg u w0 ∈ P ∧ psi alg u w1 ∈ P

/-- **Named hypothesis (Z′): many distinct points.** At least `n` terms whose points
`[a_t ⊗ b_t]` are pairwise distinct (for nonzero vectors: not both `a` and `b` proportional).
Lemma Z of the prose gives `n = 13` at a generic point in the case (5,8); Satz F needs `n = 11`.
It is **not** proved here: Lemma Z needs the variation of the point `p`, which a single normal
form does not see. -/
def VielePunkte (n : ℕ) : Prop :=
  ∃ T : Finset (Fin r), n ≤ T.card ∧ ∀ s ∈ T, ∀ t ∈ T, s ≠ t →
    ¬ ((∃ c : K, SatzB444.avecs alg s = c • SatzB444.avecs alg t) ∧
      ∃ c : K, bvecs alg s = c • bvecs alg t)

/-- **Satz F** (prose Section 5, with the repairs R-F1 to R-F3 and E2, E3 of the review): at a
normal form over an algebraically closed field, sub-case B together with (B3′) and (Z′) forces
the symmetry `IsSymm`. -/
theorem satzF [IsAlgClosed K] (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hB : UnterfallB alg) (hT : TransponiertEng alg) (hZ : VielePunkte alg 11) :
    SatzB444.IsSymm alg := by
  classical
  obtain ⟨u1, Nb, cb, hNb, hb⟩ := kubik_of_unterfallB alg h1 h2 hB
  obtain ⟨w0, w1, hw00, hw0, hw01, P, hP, hmem⟩ := hT
  obtain ⟨Na, ca, hNa, ha⟩ := kubik_seite (bvecs alg) (SatzB444.avecs alg)
    (fun u w hu h => nonsing alg h2 w u hu fun t => by rw [mul_comm]; exact h t)
    w0 w1 hw00 hw0 hw01 P hP
    (fun u => by
      have : (fun t => (bvecs alg t ⬝ᵥ w0) * (SatzB444.avecs alg t ⬝ᵥ u)) = psi alg u w0 := by
        ext t
        rw [psi_dot, mul_comm]
      rw [this]
      exact (hmem u).1)
    (fun u => by
      have : (fun t => (bvecs alg t ⬝ᵥ w1) * (SatzB444.avecs alg t ⬝ᵥ u)) = psi alg u w1 := by
        ext t
        rw [psi_dot, mul_comm]
      rw [this]
      exact (hmem u).2)
  obtain ⟨T, hT, hdist⟩ := hZ
  obtain ⟨G, hG, hGb⟩ := satzF_kern (SatzB444.avecs alg) (bvecs alg) (Pi.single 0 1) u1 w0 w1
    Na Nb ca cb hNa hNb ha hb
    (fun t => by
      rw [dotProduct_single, mul_one]
      exact SatzB444.avecs_zero_ne alg h1 t)
    hw0 T hT hdist
  choose μ hμ using hGb
  have hGt := isUnit_det_transpose _ hG
  let e : (Fin 4 → K) ≃ₗ[K] (Fin 4 → K) :=
    LinearEquiv.ofLinear (Gᵀ).mulVecLin (Gᵀ)⁻¹.mulVecLin
      (LinearMap.ext fun v => by
        show Gᵀ *ᵥ ((Gᵀ)⁻¹ *ᵥ v) = v
        rw [mulVec_mulVec, mul_nonsing_inv _ hGt, one_mulVec])
      (LinearMap.ext fun v => by
        show (Gᵀ)⁻¹ *ᵥ (Gᵀ *ᵥ v) = v
        rw [mulVec_mulVec, nonsing_inv_mul _ hGt, one_mulVec])
  refine ⟨e, μ, fun t y => ?_⟩
  have he : e y = Gᵀ *ᵥ y := rfl
  rw [he, beta_emb, dotProduct_mulVec,
    vecMul_transpose, hμ t, smul_dotProduct, smul_eq_mul, dotProduct]
  congr 1
  exact Finset.sum_congr rfl fun i _ => mul_comm _ _

/-- **Sub-case B is impossible** at a non-symmetric normal form, under (B3′) and (Z′). -/
theorem unterfallB_unmoeglich [IsAlgClosed K] (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hns : NichtSymmetrisch alg) (hT : TransponiertEng alg) (hZ : VielePunkte alg 11) :
    ¬ UnterfallB alg :=
  fun hB => hns (satzF alg h1 h2 hB hT hZ)

/-- **Folgerung F1 at a normal form** (with `LemmaP444.nur_unterfallB'`): a normal form of
length 25 over an algebraically closed field in the case (5,8) that satisfies (B3′) and (Z′)
is symmetric. Together with non-symmetry (Satz C) this excludes the case (5,8). -/
theorem fall58_symmetrisch [IsAlgClosed K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hT : TransponiertEng alg) (hZ : VielePunkte alg 11) : SatzB444.IsSymm alg := by
  by_contra hns
  exact unterfallB_unmoeglich alg h1 h2 hns hT hZ
    (LemmaP444.nur_unterfallB' alg h1 h2 hcase hns)

/-- **The case (5,8) is impossible** at a non-symmetric normal form satisfying (B3′) and (Z′). -/
theorem fall58_ausgeschlossen [IsAlgClosed K] (alg : BilinearAlgorithm K 4 2 4 25)
    (h1 : SN1 (d := 3) alg) (h2 : SN2 (d := 3) alg)
    (hcase : (finrank K (LinearMap.range (Lq (d := 3) alg)),
      finrank K (LinearMap.range (Hq (d := 3) alg))) = (5, 8))
    (hns : NichtSymmetrisch alg) (hT : TransponiertEng alg) (hZ : VielePunkte alg 11) :
    False :=
  hns (fall58_symmetrisch alg h1 h2 hcase hT hZ)

end Anwendung

/-! ## Connection to the final theorem -/

section Endsatz

open YangN4Haupt SatzE444Buendel

/-- **`UnterfallBStatement` under the named hypotheses (B3′) and (Z′).** -/
theorem unterfallBStatement_of (L : Type u) [Field L] [IsAlgClosed L]
    (hyp : ∀ alg : BilinearAlgorithm L 4 2 4 25, SN1 (d := 3) alg → SN2 (d := 3) alg →
      (finrank L (LinearMap.range (Lq (d := 3) alg)),
        finrank L (LinearMap.range (Hq (d := 3) alg))) = (5, 8) →
      NichtSymmetrisch alg → TransponiertEng alg ∧ VielePunkte alg 11) :
    Endsatz444.UnterfallBStatement L := by
  intro alg h1 h2 hcase hns hB
  obtain ⟨hT, hZ⟩ := hyp alg h1 h2 hcase hns
  exact unterfallB_unmoeglich alg h1 h2 hns hT hZ hB

end Endsatz

end SatzF444
end YangBounds

/-! ## Axiom check (output appears in the build log) -/

#print axioms YangBounds.SatzF444.deg_eq_one
#print axioms YangBounds.SatzF444.satzF_kern
#print axioms YangBounds.SatzF444.kubik_of_unterfallB
#print axioms YangBounds.SatzF444.satzF
#print axioms YangBounds.SatzF444.unterfallB_unmoeglich
#print axioms YangBounds.SatzF444.fall58_symmetrisch
#print axioms YangBounds.SatzF444.fall58_ausgeschlossen
#print axioms YangBounds.SatzF444.unterfallBStatement_of
