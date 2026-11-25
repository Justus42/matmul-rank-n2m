---
name: wache-openai-math
description: S2-13 Literaturwache 25.11.2026: openai/math an Commit 3344da5 geprüft, PR #41 gemergt, keine Bedeutung für die Ziele
metadata:
  type: project
  modified: 2026-11-25T11:47:38.766Z
---

S2-13 (25.11.2026), PR #41 gemergt (93a0f06), Dateien lit/WACHE.md und lit/LIZENZEN.md.
- openai/math ist jetzt beobachtete Quelle (Entscheidung Justus). Geprüfter Stand: 3344da59991ed94f9ba711217b29c1d760badfa6, Lizenz Apache-2.0. Beim nächsten Durchgang `git ls-remote https://github.com/openai/math.git HEAD` vergleichen, neue Familien in CONTENTS.md durchsuchen.
- Die Quellenliste steht nur in PROTOKOLL.md Abschnitt 7, nicht in lit/WACHE.md; dem Orchestrator gemeldet.
- Klonen mit `--filter=blob:none --no-checkout` geht schnell, LaTeX-Quellen liegen unter preprints/*/build.

**Why:** Später müssen Wachen den Stand vergleichen können.
**How to apply:** Verwandt: [[wache-stufe2-4x2x4]]
