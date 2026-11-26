module

public import YangBounds.YangN3Teil1
public import YangBounds.YangN3Teil2
public import YangBounds.YangN3Teil3

@[expose] public section

/-!
# Yang v3, Theorem 1 (`n = 3`): assembly of the three parts

Task S1-13 (stage 1, round 4, role: formaliser).

Source: J. Yang, *New lower bounds on tensor rank of (n,2,m) matrix multiplication with GPT-6*,
arXiv:2609.14393v3 (12.10.2026), Theorem 1. The result is Yang's; this file only puts together
the formalisation of his proof (protocol section 9), following `lean/prosa/yang_n3.md`.

The three parts:

* part 1 (`YangN3Teil1.lean`): step R1, `yang_theorem_one_of_infinite` reduces Theorem 1 to
  algorithms over infinite fields (hypothesis `hinf`);
* part 2 (`YangN3Teil2.lean`): steps R2, R3 and Lemma A, `YangN3Teil2.exists_stronglyNormalized`
  turns an algorithm over an infinite field into a strongly normalized one of length `r' ≤ r`;
* part 3 (`YangN3Teil3.lean`): `YangN3Teil3.yang_n3_of_stronglyNormalized` proves
  `24 m + 2 ≤ 5 r` for strongly normalized algorithms and `m ≥ 2`.

Interface between parts 2 and 3: SN1 is the same proposition in both files (`e32 0 0` is an
abbreviation of `unitMatrix 0 0`). SN2 differs only in how the three vectors are written:
part 2 uses `fun i k => α_k(e_{i,0}) * β_k(v)`, part 3 uses `![f 0 v, f 1 v, f 2 v]` with
`f i v = (α_k(e_{i,0}) • β_k(v))_k`. `sn2_of_stronglyNormalized` shows the two families are
equal.

Main results:

* `yang_n3_infinite`: over every infinite field, every algorithm of length `r` for `⟨3,2,m⟩`
  with `m ≥ 2` satisfies `24 m + 2 ≤ 5 r` (this is hypothesis `hinf` of part 1).
* `yang_theorem_one_proof`: the statement of `yang_theorem_one` in `Statements.lean`, used
  there to replace the `sorry`.
-/

namespace YangBounds
namespace YangN3

universe u

variable {K : Type u} [Field K] {m r : ℕ}

/-- SN1 of part 2 gives SN1 of part 3 (the two are the same proposition). -/
theorem sn1_of_stronglyNormalized {alg : BilinearAlgorithm K 3 2 m r}
    (h : YangN3Teil2.StronglyNormalized alg) : YangN3Teil3.SN1 alg :=
  h.1

/-- The three vectors of SN2 in part 2 are the vectors `![f 0 v, f 1 v, f 2 v]` of part 3. -/
theorem sn2_family_eq (alg : BilinearAlgorithm K 3 2 m r) (v : Matrix (Fin 2) (Fin m) K) :
    (fun i : Fin 3 => fun k => alg.alpha k (unitMatrix i 0) * alg.beta k v) =
      ![YangN3Teil3.f alg 0 v, YangN3Teil3.f alg 1 v, YangN3Teil3.f alg 2 v] := by
  funext i k
  fin_cases i <;> simp [YangN3Teil3.f_apply, YangN3Teil3.avec, YangN3Teil3.bvec]

/-- SN2 of part 2 gives SN2 of part 3. -/
theorem sn2_of_stronglyNormalized {alg : BilinearAlgorithm K 3 2 m r}
    (h : YangN3Teil2.StronglyNormalized alg) : YangN3Teil3.SN2 alg := by
  intro v hv
  have hli := h.2 v hv
  rwa [sn2_family_eq alg v] at hli

/-- **Theorem 1 over infinite fields.** Over every infinite field, every algorithm of length
`r` for `⟨3,2,m⟩` with `m ≥ 2` satisfies `24 m + 2 ≤ 5 r` (part 2, then part 3). -/
theorem yang_n3_infinite (L : Type u) [Field L] [Infinite L] (hm : 2 ≤ m) (r : ℕ)
    (alg : BilinearAlgorithm L 3 2 m r) : 24 * m + 2 ≤ 5 * r := by
  obtain ⟨r', hr', alg', hSN⟩ := YangN3Teil2.exists_stronglyNormalized alg
  have h := YangN3Teil3.yang_n3_of_stronglyNormalized alg' hm
    (sn1_of_stronglyNormalized hSN) (sn2_of_stronglyNormalized hSN)
  omega

/-- **Yang v3, Theorem 1.** Same statement as `yang_theorem_one` in `Statements.lean`:
for every field `K` and every `m ≥ 3`, `⌈(24m + 2) / 5⌉ ≤ R_K(⟨3, 2, m⟩)`
(part 1 with hypothesis `hinf` supplied by `yang_n3_infinite`). -/
theorem yang_theorem_one_proof (K : Type u) [Field K] (m : ℕ) (hm : 3 ≤ m) :
    ⌈((24 * m + 2 : ℚ) / 5)⌉₊ ≤ tensorRank K 3 2 m :=
  yang_theorem_one_of_infinite m
    (fun L _ _ r alg => yang_n3_infinite L (by omega) r alg) K

end YangN3
end YangBounds
