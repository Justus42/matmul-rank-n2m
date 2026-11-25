# Behauptungen

Eine Datei pro Behauptung, benannt `B-xxx.md`. Die Übersicht unten wird bei jeder Statusänderung angepasst.

## Vorlage

```
# B-xxx: Kurztitel

- Aussage: (genau, mit Format, Körper und Zahl)
- Status: vermutet | behauptet | geprüft | widerlegt | aufgegeben
- Herkunft: (Quelle oder Runde)
- Artefakt: (Pfad zu Lean-Datei, Verfahren oder Prosa-Beweis)
- Prüfung: (wer, wann, womit; bei Lean: Commit und Link zum grünen Build)
- Aussagen-Abgleich: (Prüfer und Fremdmodell, je mit Datum und Ergebnis)
- Bemerkungen:
```

## Übersicht

| Nr. | Aussage | Status | Herkunft |
|---|---|---|---|
| B-001 | Rang von ⟨3,2,5⟩ ist 25, über jedem Körper | geprüft | untere Schranke: Lean-Satz aus Tsyganov u. a., arXiv:2609.22054 (Actions-Lauf 45518440779, Aussagen-Abgleich A-03); obere Schranke: `verfahren/3x2x5-r25-hk71.json` über ℤ (A-10, beide Prüfprogramme) |
| B-002 | Rang von ⟨3,2,m⟩ ist mindestens ⌈(24m+2)/5⌉ für m ≥ 3, über jedem Körper (Yangs Satz 1) | geprüft | Yangs Satz, Quelle: Yang, arXiv:2609.14393 v3. Lean: `YangBounds.yang_theorem_one`, Actions-Lauf 45560784171, Aussagen-Abgleich in B-006 |
| B-003 | Rang von ⟨n,2,m⟩ ist mindestens (n+2)·m + n − 3 für m ≥ n ≥ 4, über jedem Körper (Yangs Satz 2) | geprüft | Yangs Satz, Quelle: Yang, arXiv:2609.14393 v3. Lean: `YangBounds.yang_theorem_two`, Actions-Lauf 45560784171, Aussagen-Abgleich in B-007 |
| B-004 | Rang von ⟨n,2,m⟩ ist höchstens ⌈(3nm + max(n,m))/2⌉ | behauptet | Hopcroft und Kerr 1971 |
| B-005 | Rang von ⟨4,2,5⟩ ist höchstens 32 | behauptet | aus Yang v3 erschlossen, Quelle des Verfahrens offen |
| B-006 | Rang von ⟨3,2,6⟩ ist 30, über jedem Körper | geprüft | untere Schranke aus Yangs Satz 1, obere nach Hopcroft und Kerr (Verfahren aus A-10). Lean: `YangBounds.rank_three_two_six`, Actions-Lauf 45560784171, Aussagen-Abgleich S1-18 |
| B-007 | Rang von ⟨4,2,4⟩ ist mindestens 25, über jedem Körper | geprüft | Folgerung aus Yangs Satz 2. Lean: `YangBounds.rank_four_two_four_ge`, Actions-Lauf 45560784171, Aussagen-Abgleich S1-19 |
| B-008 | Hat ⟨4,2,4⟩ eine Zerlegung der Länge 25, so gilt in Yangs Normalform ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)} (Satz A) | behauptet | S2-02 und S2-05, Prosa in `lean/prosa/s2_444_spurA_r2.md`. Prüfer S2-09 und GPT 6.2 Sol: hält. Kein Lean-Satz |
| B-009 | Bei Länge 25 sind die Fälle (4,7) und (5,7) unmöglich, über jedem Körper (Satz B, mit Lemma 13′, V, S) | behauptet | S2-05, Prosa in `lean/prosa/s2_444_spurA_r2.md`. Prüfer S2-09 und GPT 6.2 Sol: hält, mit Reparaturen R1 und R2. Kein Lean-Satz |
| B-010 | Rang von ⟨4,2,4⟩ ist höchstens 26, über jedem Körper | geprüft | `verfahren/4x2x4-r26-s001.json` über ℤ (S2-03), Prüfung nach 5.2 durch S2-11. Bekannter Wert, kein neues Ergebnis |
| B-011 | Über 𝔽₂ kein σ-invariantes 25er-Verfahren für ⟨4,2,4⟩ mit f ∈ {1, 3, 19, 21, 23, 25} Fixprodukten, σ(u,v,w) = (vᵀ,uᵀ,wᵀ) | behauptet | S2-06 (SAT mit DRAT), Prüfer S2-11. Abschnitt 5 kennt keinen Prüfweg für SAT-Zertifikate |

Weitere geprüfte Ergebnisse ohne eigene Behauptungsdatei:

| Aussage | Status | Beleg |
|---|---|---|
| Rang von ⟨3,2,6⟩ ist höchstens 30, über ℤ (also über jedem Körper) | geprüft | `verfahren/3x2x6-r30-hk71.json`, A-10, beide Prüfprogramme ANGENOMMEN (Runde 3 der Stufe 0) |

Aus B-002 und B-004 folgt rechnerisch: Rang von ⟨3,2,6⟩ ist 30, Rang von ⟨3,2,7⟩ ist 34 oder 35. Aus B-003 und B-004: Rang von ⟨4,2,4⟩ ist 25 oder 26.
