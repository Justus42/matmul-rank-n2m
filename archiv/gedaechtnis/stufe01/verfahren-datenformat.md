---
name: verfahren-datenformat
description: Stand von A-07 (Datenformat für Verfahren in verfahren/README.md): Entwurf, Kernentscheidungen, offen für Freigabe
metadata:
  type: project
  modified: 2026-11-24T23:40:35.041Z
---

A-07 Entwurf (24.11.2026) liegt auf Branch `claude/project-thread-by3y8e`, PR #1 am 24.11.2026 nach main gemergt. Nachtrag PR #3 gemergt; Orchestrator hat die zehn Annahmen am 24.11.2026 unverändert bestätigt. Kopie: /mnt/project-files/a07/verfahren-README.md.

Kernentscheidungen (als Annahmen markiert, Justus muss bestätigen): JSON, englische Schlüssel, Koeffizienten als Zeichenketten "a/b", dichte Matrizen u (n×k), v (k×m), w (n×m, NICHT transponiert), ring ∈ Z | Q | GF(p), Status nicht in der Datei sondern in behauptungen/, Prüfer-Ausgabe ANGENOMMEN/ABGELEHNT/FEHLERHAFT mit Exit 0/1/2, Dateiname `<n>x<k>x<m>-r<rank>-<kurzname>.json`.

**How to apply:** A-08/A-09 (Prüfprogramme) und A-10 bauen auf diesem Format auf; vorher prüfen, ob der Orchestrator die Annahmen bestätigt hat (seit Protokoll 0.2 seine Rolle).
