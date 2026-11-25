# V-S2-16: Fall (5,8) nur mit den Abbildungen F_i ausschließen

- Ziel: Restfall (5,8) für ⟨4,2,4⟩ bei Länge 25 (Stufe 2, Spur A, B-013), allein aus Eigenschaften der Abbildungen F_1, F_2, F_3 : U → Q (ρ = 3, rk L = 5, rk H = 8, s = 1, N = 0) und der Büschelstruktur aus Lemma P.
- Idee: Mit der Büschelstruktur (K*, q, γ*) zerfällt rk H in dim(im H ∩ (Kq)³) + rk H′. Vielleicht erzwingt das rk H ≥ 9.
- Woran es scheiterte: Abstrakte Tripel mit Büschelstruktur erreichen (ρ, rk L, rk H, s, dim N) = (3, 5, 8, 1, 0), in Unterfall A (Kernelement von H′ vom Typ (i)) und in Unterfall B (L_2-Block), je in allen Zufallsproben (300 von 300). Rechnung exakt in ℤ/(2⁶¹−1): `versuche/s2-16/buesche_fall_i.py`, `buesche_k3.py`, Ausgaben daneben. Nur der allgemeine Unterfall A ohne Kernelement gibt rk H = 9 (`buesche_test.py`).
- Was man daraus lernt: Wie schon bei den Modellen aus S2-05 reichen die F-Daten nicht. Unterfall A fällt erst mit der Bilinearform Ψ selbst (Lemma 8 eng, Kronecker, Gradzählung; Satz E in `lean/prosa/s2_444_spurA_r4.md`). Für Unterfall B muss man ebenso mit Ψ arbeiten.
- Runde und Datum: Stufe 2, Runde 4, 25.11.2026 (S2-16)
