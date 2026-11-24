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
| B-001 | Rang von ⟨3,2,5⟩ ist 25, über jedem Körper | behauptet | Tsyganov u. a., arXiv:2609.22054, mit Lean-Beweis; hier noch nicht nachgebaut |
| B-002 | Rang von ⟨3,2,m⟩ ist mindestens ⌈(24m+2)/5⌉ für m ≥ 3 | behauptet | Yang, arXiv:2609.14393 v3 |
| B-003 | Rang von ⟨n,2,m⟩ ist mindestens (n+2)·m + n − 3 für m ≥ n ≥ 4 | behauptet | Yang, arXiv:2609.14393 v3 |
| B-004 | Rang von ⟨n,2,m⟩ ist höchstens ⌈(3nm + max(n,m))/2⌉ | behauptet | Hopcroft und Kerr 1971 |
| B-005 | Rang von ⟨4,2,5⟩ ist höchstens 32 | behauptet | aus Yang v3 erschlossen, Quelle des Verfahrens offen |

Aus B-002 und B-004 folgt rechnerisch: Rang von ⟨3,2,6⟩ ist 30, Rang von ⟨3,2,7⟩ ist 34 oder 35. Aus B-003 und B-004: Rang von ⟨4,2,4⟩ ist 25 oder 26.
