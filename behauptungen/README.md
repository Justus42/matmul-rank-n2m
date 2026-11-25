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
| B-008 | Hat ⟨4,2,4⟩ eine Zerlegung der Länge 25, so gilt in Yangs Normalform ρ = 3 und (rk L, rk H) ∈ {(3,6), (4,7), (5,7), (5,8)} (Satz A) | geprüft (Kern, Surjektivität in A1, A2); Isomorphie-Teil von A1 behauptet | Lean: `SatzA444.lean`, `Lemma13Prime.lean` (S2-14). Actions-Lauf 45635237494 auf `main` (SORRY 0, nur Standard-Axiome), Aussagen-Abgleich S2-19 (Prüfer und GPT 6.2 Sol) |
| B-009 | Bei Länge 25 sind die Fälle (4,7) und (5,7) unmöglich, über jedem Körper (Satz B) | geprüft (Rangteil); Symmetrie-Zusatz im Fall (3,6) mit μ_t ≠ 0 behauptet | Lean: `SatzB444Final.lean` (`satzB_unbedingt`, `satzB_symm_unbedingt`, `satzB_global_unbedingt`, S2-18) auf `SatzB444.lean`, `SatzB444Poly.lean`, `SatzA444.lean`. Actions-Lauf 45635237494 auf `main`, Aussagen-Abgleich S2-20 (Prüfer und GPT 6.2 Sol) |
| B-010 | Rang von ⟨4,2,4⟩ ist höchstens 26, über jedem Körper | geprüft | `verfahren/4x2x4-r26-s001.json` über ℤ (S2-03), Prüfung nach 5.2 durch S2-11. Bekannter Wert, kein neues Ergebnis |
| B-011 | Über 𝔽₂ kein σ-invariantes 25er-Verfahren für ⟨4,2,4⟩ mit f ∈ {1, 3, 19, 21, 23, 25} Fixprodukten, σ(u,v,w) = (vᵀ,uᵀ,wᵀ) | behauptet | S2-06 (SAT mit DRAT), Prüfer S2-11. Abschnitt 5 kennt keinen Prüfweg für SAT-Zertifikate |
| B-012 | Keine symmetrische Zerlegung von ⟨4,2,4⟩ der Länge 25, damit ist der Restfall (3,6) ausgeschlossen, über jedem Körper (Satz C) | behauptet | S2-16, Prosa in `lean/prosa/s2_444_spurA_r4.md`. Stützt sich auf B-008 und B-009. Prüfer S2-22 und GPT 6.2 Sol unabhängig: Satz C hält, Folgerung C1 hält nur mit Reparatur R-C1 (generische Fassung: (3,6) für eine dichte offene Menge von p ausgeschlossen, nicht an jedem einzelnen p). Bericht `lean/prosa/s2_444_spurA_r4_pruefung.md`, PR #55. Lean (S2-26, PR #59): `SatzC444Kern.lean`, `SatzC444Generisch.lean` mit `satzC_kern`, `satzC_generisch`, `folgerungC1_generisch`, ohne sorry, Actions-Lauf 45653961790. Offen: Symmetrie am generischen Punkt statt auf offener Menge (Schritt 0 nicht formalisiert), Aussagen-Abgleich |
| B-013 | Im Restfall (5,8) ist Unterfall A unmöglich (Lemma P, Satz E). Unterfall B bleibt offen | behauptet | S2-16, Prosa in `lean/prosa/s2_444_spurA_r4.md`. Stützt sich auf B-008, B-009 und für die Nicht-Symmetrie in Folgerung C2 auf B-012. Prüfer S2-23 und GPT 6.2 Sol unabhängig: Satz E hält ohne Reparatur und hängt nicht von Satz C ab; Folgerung C2 und Lemma P halten mit Reparaturen R1, R2, R2b. Bericht `lean/prosa/s2_444_spurA_r4_pruefung_b013.md`, PR #56. Lean (S2-27, PR #60): `SatzE444.lean`, `SatzE444Buendel.lean` mit `satzE`, `satzE_global`, `nur_unterfallB`, ohne sorry, Actions-Lauf 45658431578. Lemma P ist dort nur Hypothese `LemmaPStatement`, die Verkettung mit Satz C fehlt. Offen: Aussagen-Abgleich |
| B-014 | Im Restfall (5,8) ist Unterfall B unmöglich (Lemma K, Lemma Z, Satz F). Folgerung F2: mit B-007 bis B-013 R(⟨4,2,4⟩) ≥ 26 über jedem Körper | behauptet | S2-24, Prosa in `lean/prosa/s2_444_spurA_r6.md`, PR #53. Stützt sich auf B-007, B-008, B-009, B-012 und B-013. Prüfer S2-28 und GPT 6.2 Sol unabhängig: hält mit benannten Reparaturen R-K, R-F1, R-F2, R-F3, keine Aussage ändert sich. Bericht `lean/prosa/s2_444_spurA_r6_pruefung.md`, PR #58. Der Prüfer war nur eingeschränkt unabhängig (Kurzfassung früherer Prüfurteile aus dem Projektgedächtnis gesehen). Kein Lean-Satz. F2 ist eine Kette von Behauptungen |

Weitere geprüfte Ergebnisse ohne eigene Behauptungsdatei:

| Aussage | Status | Beleg |
|---|---|---|
| Rang von ⟨3,2,6⟩ ist höchstens 30, über ℤ (also über jedem Körper) | geprüft | `verfahren/3x2x6-r30-hk71.json`, A-10, beide Prüfprogramme ANGENOMMEN (Runde 3 der Stufe 0) |

Aus B-002 und B-004 folgt rechnerisch: Rang von ⟨3,2,6⟩ ist 30, Rang von ⟨3,2,7⟩ ist 34 oder 35. Aus B-003 und B-004: Rang von ⟨4,2,4⟩ ist 25 oder 26.
