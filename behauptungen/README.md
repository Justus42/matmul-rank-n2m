# Behauptungen

Eine Datei pro Behauptung, benannt `B-xxx.md`. Eine Behauptungsdatei enthält nur Aussage, Herkunft und Artefakt. Status, Prüfvermerke und die Übersicht mit Status stehen in `pruefvermerke/`. Prüfer lesen `pruefvermerke/` nicht.

## Vorlage

```
# B-xxx: Kurztitel

- Aussage: (genau, mit Format, Körper und Zahl)
- Herkunft: (Quelle oder Runde)
- Artefakt: (Pfad zu Lean-Datei, Verfahren oder Prosa-Beweis)
```

## Liste

| Nr. | Aussage |
|---|---|
| B-001 | Rang von ⟨3,2,5⟩ ist 25, über jedem Körper |
| B-002 | Rang von ⟨3,2,m⟩ ist mindestens ⌈(24m+2)/5⌉ für m ≥ 3, über jedem Körper (Yangs Satz 1) |
| B-003 | Rang von ⟨n,2,m⟩ ist mindestens (n+2)·m + n − 3 für m ≥ n ≥ 4, über jedem Körper (Yangs Satz 2) |
| B-004 | Rang von ⟨n,2,m⟩ ist höchstens ⌈(3nm + max(n,m))/2⌉ |
| B-005 | Rang von ⟨4,2,5⟩ ist höchstens 32 |
| B-006 | Rang von ⟨3,2,6⟩ ist 30, über jedem Körper |
| B-007 | Rang von ⟨4,2,4⟩ ist mindestens 25, über jedem Körper |
| B-008 | Hat ⟨4,2,4⟩ eine Zerlegung der Länge 25, so gilt in Yangs Normalform ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)} (Satz A) |
| B-009 | Bei Länge 25 sind die Fälle (4,7) und (5,7) unmöglich, über jedem Körper (Satz B) |
| B-010 | Rang von ⟨4,2,4⟩ ist höchstens 26, über jedem Körper |
| B-011 | Über 𝔽₂ kein σ-invariantes 25er-Verfahren für ⟨4,2,4⟩ mit f ∈ {1, 3, 19, 21, 23, 25} Fixprodukten, σ(u,v,w) = (vᵀ,uᵀ,wᵀ) |
| B-012 | Keine symmetrische Zerlegung von ⟨4,2,4⟩ der Länge 25, damit ist der Restfall (3,6) ausgeschlossen, über jedem Körper (Satz C) |
| B-013 | Im Restfall (5,8) ist Unterfall A unmöglich (Lemma P, Satz E). Unterfall B bleibt offen |
| B-014 | Im Restfall (5,8) ist Unterfall B unmöglich (Lemma K, Lemma Z, Satz F). Folgerung F2: mit B-007 bis B-013 R(⟨4,2,4⟩) ≥ 26 über jedem Körper |
| B-015 | Brücke: Zu jeder Zerlegung von ⟨4,2,4⟩ der Länge 25 über einem Körper K erfüllt die generische Normalform über dem algebraischen Abschluss von K(S,T) (N1), (N2), liegt im Fall (5,8) und ist nicht symmetrisch |
| B-016 | R(⟨4,2,4⟩) ≥ 26 über jedem Körper, Lean-Endsatz `Transponiert444.rank_four_two_four_ge_26` |
| B-017 | Restfall-Rechnung ⟨3,2,7⟩ bei Länge 34, Rolle n = 3: genau ein Restfall (ρ, rk L, rk H) = (4, 6, 4); ohne Lemma I zusätzlich (3, 5, 3) |
| B-018 | Lemma 15(b) bei d = 2: rk L = d·ρ ⇒ ρ = m, über algebraisch abgeschlossenem Körper |
| B-019 | Lemma I (Δ ≥ min(2, dim N), Rahmen yang_n3) gilt für jede Normalform des Rahmens yang_n4 mit d = 2, so wie C2 im Programm S3-04 es benutzt |
| B-020 | Rang von ⟨3,2,7⟩ ist höchstens 35 über ℤ, Verfahren `verfahren/3x2x7-r35-hk71.json` |
| B-021 | S4-07-A bis E: Umformulierung, Zerlegungssatz, Gestalt bei e = 3, bedingter Ausschluss D (e = 3 unter (INJ5)), Satz X |
| B-022 | S4-06 A1 bis A6: Strukturaussagen zum Restfall (4, 6, 4) bei Länge 34 |
| B-023 | Satz G: Gleichheitsfall r = 34 für m = 7 |
| B-024 | Satz K: Gestalt des Restfalls in den Faktoren, ohne Lemma 15(b) |
| B-025 | Fallunterscheidung des Restfalls R-327: „e = 3 mit (INJ5)“, „e = 3 ohne (INJ5)“, „e ≤ 2“ schöpfen den Restfall aus |
| B-026 | Satz R (Fall e = 3: K″ abgeschlossen unter a_1, a_2, ohne (INJ5)), Folgerungen und Gestalt im Unterfall (M21) |
| B-027 | E2-A (nur e = 2 oder e = 3), E2-B (Gestalt bei e = 2), E2-D (bedingter Ausschluss bei e = 2 unter (INJ-B)) |
