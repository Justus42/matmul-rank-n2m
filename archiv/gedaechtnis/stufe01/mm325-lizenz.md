---
name: mm325-lizenz
description: fallnlove/mm325_proof hat keine Lizenz; nur extern klonen/als Lake-Abhängigkeit, nicht ins Repo kopieren
metadata:
  type: project
  modified: 2026-11-24T23:40:10.392Z
---

Stand 24.11.2026 (Auftrag A-01): github.com/fallnlove/mm325_proof ist öffentlich klonbar (git clone geht, GitHub-API für fremde Repos in Cloud-Sitzungen gesperrt, arXiv-Host per Proxy gesperrt). Ein Commit 759cf4a (18.09.2026). Keine Lizenzdatei.

**Why:** Ohne Lizenz volles Urheberrecht; CLAUDE.md Regel 9 verbietet Übernahme ohne geklärte Lizenz.
**How to apply:** Für Build/Actions extern am festen Commit klonen oder per lakefile `[[require]]` mit Git-URL einbinden; keine .lean-Datei ins Repo kopieren. Lizenzanfrage an Autoren nur durch Justus. Nebenbefund: SHA-256 in verification.txt passt nicht zur eingecheckten Lean-Datei. lit/LIZENZEN.md in PR #2 (A-01).
