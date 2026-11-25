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
