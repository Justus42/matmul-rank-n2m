---
name: s2-24-unterfall-b-58
description: S2-24 (25.11.2026): Satz F schließt Unterfall B von (5,8) aus (Zählung 13 > 10), B-014 behauptet, damit Kette zu R(4x2x4) ≥ 26; PR #53 gemergt
metadata:
  type: project
  modified: 2026-11-25T15:15:21.089Z
---

S2-24, Stufe 2 Runde 6, Spur A, Beweissucher. PR #53 gemergt (48bd413). Bericht `lean/prosa/s2_444_spurA_r6.md`, `behauptungen/B-014.md` (behauptet, README-Übersicht nicht angefasst), Code `versuche/s2-24/klassen_lemma.py`.
- Lemma K/Z: im Fall (5,8) (Ĵ_p = ker W) + Minimalität (B-007) fallen höchstens 2 Terme in a_t(p)⊗b_t(p) identisch zusammen (Tauschgestalt x l1ᵀ / x l2ᵀ) ⇒ ≥ 13 verschiedene Punkte für generisches p.
- Satz F: Unterfall B legt (τ_t,σ_t) auf Graphen vom Bigrad (d,1),(1,e), d,e ≤ 3 ⇒ ≤ de+1 ≤ 10 Schnittpunkte, sonst Graphen gleich ⇒ symmetrisch ⇒ Widerspruch zu C2. Vermutung B wird nicht gebraucht.
- F2: mit B-007..B-013 folgt R(⟨4,2,4⟩) ≥ 26, nur so belastbar wie B-012/B-013 (behauptet, Prüfung S2-22/S2-23).
- Kein Verfahren gesucht (Struktur leer). Vorschlag Runde 7: Prüfer + GPT für B-014; Lean zuerst Lemma K, Bézout für Graphen elementar über Fixpunkte von ψ∘φ.

Verwandt: [[s2-16-restfaelle-36-58]]
