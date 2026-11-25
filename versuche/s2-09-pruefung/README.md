# S2-09: Rechnungen des Prüfers zu S2-05

Kein gescheiterter Ansatz, sondern die Gegenproben zum Prüfbericht `lean/prosa/s2_444_spurA_r2_pruefung.md`. Eigener Code, unabhängig von `versuche/s2-spurA-r2/` geschrieben (nur das Hex-Format der Verfahrenslisten übernommen).

- `gf.py`: ℤ/p, GF(2^k), GF(p^k) mit Irreduzibilitätstest, Rang, Kern, Determinante
- `pruefe.py schemes`: Yangs Größen, Lemma 13/13′, Symmetrie (Lemma V) und Lemma S Teil 4 an allen Verfahren der Länge 26 im Repo → `schemes_ausgabe.txt`
- `pruefe.py modelle p61|f2|f3`: symmetrische Modelle für Lemma S in drei Charakteristiken → `modelle_ausgabe.txt`
- `pruefe.py l13`: abstrakte Tripel für Lemma 13′ → `l13_ausgabe.txt`
- `lemma_v_suche.py`: Monomkurven-Paare als Gegenbeispielsuche zu Lemma V → `lemma_v_suche_ausgabe.txt`

Aufrufe aus diesem Ordner, Python 3 ohne Zusatzpakete. Rechenzeit insgesamt unter 25 Minuten.
