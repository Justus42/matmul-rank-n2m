# S4-21: Der Unterfall (M21) bei e = 3 (Stufe 4, Runde 4, Spur A)

- Auftrag: S4-21, Protokoll 0.6, Stufe 4, Runde 4, Spur A. Rolle: Beweissucher. Zweig `claude/project-thread-bltpw6`.
- **Zwischenstand (Entwurf).** Die endgültige Fassung folgt in späteren Commits dieser Datei.
- Status aller Aussagen: behauptet oder ausdrücklich vermutet. Den Status setzt nur der Orchestrator.

## Kern des neuen Ansatzes (Entwurf)

Die Normalform hängt von der Wahl der ersten Zeile p von T ∈ GL_2 (Lemma A in `yang_n3.md`) ab. Die Menge der Wahlen mit e = 3 ist Zariski-offen. Für eine allgemeine Wahl von p fallen zwei a-Punkte nur zusammen, wenn die beiden α_t proportional sind oder beide Rang 1 mit derselben Spalte haben. Daraus folgt mit Satz R aus S4-14: genau 26 Produkte mit Rang-1-α, 8 mit Rang 2, c = 0 auf den 26, und die β_t der 8 Rang-2-Produkte spannen höchstens 6 Dimensionen auf.

Rechenblock 1 (11:40 bis 11:41 UTC, ein Kern): `czonly.py 1 60` über GF(32003), 5 632 zulässige reduzierte Lagen, in allen erzwingt (C′) c = 0 auf Z.
