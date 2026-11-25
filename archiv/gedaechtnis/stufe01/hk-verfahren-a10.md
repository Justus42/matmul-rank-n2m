---
name: hk-verfahren-a10
description: A-10 (25.11.2026): HK-Verfahren 3x2x5 r25 und 3x2x6 r30 über Z gebaut, PR #11 gemergt; Prüfer weichen in zwei Formatlücken ab
metadata:
  type: project
  modified: 2026-11-25T00:32:55.581Z
---

A-10, 25.11.2026: `verfahren/3x2x5-r25-hk71.json` und `verfahren/3x2x6-r30-hk71.json` (ring Z), PR #11 gemergt (cac2c55). Beide Prüfer ANGENOMMEN. Status behauptet, Statusentscheidung beim Orchestrator.

- HK71-Original (Cornell TR 69-44, hdl 1813/5902) aus der Cloud nicht abrufbar (Proxy 403). Bauplan aus Lacelle arXiv:2606.13408v3 Abschn. 7.1 (via alphaXiv lesbar); Paarprodukte (Lemma 2) per eigener Suche, Ergänzungsmatrix M=[e0;e1;e2;e0+e1;e1+e2].
- 3x2x6 = zwei 3x2x3-Blöcke à 15.
- Befund: Python-Prüfer lehnt Zusatzschlüssel in `origin` als FEHLERHAFT ab, Rust nimmt an; ungültiges Datum (2026-02-30) nimmt Python an, Rust lehnt ab. An Orchestrator gemeldet.

**How to apply:** Weitere bekannte Verfahren für Stufe 0 nicht neu bauen; bei neuen Verfahrensdateien Zusatzschlüssel in origin und ungültige Daten meiden, bis das Format entschieden ist. Verwandt: [[verfahren-datenformat]]
