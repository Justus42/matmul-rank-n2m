---
name: lean-build-cloud
description: Lean/mathlib in der Cloud-Sitzung bauen: releases.lean-lang.org und mathlib-Cache gesperrt, Umweg über GitHub-Releases und Bau aus Quellen
metadata:
  type: reference
  modified: 2026-11-25T00:08:25.736Z
---

Stand 25.11.2026 (A-02):
- elan-Installer geht, aber Toolchain-Download über releases.lean-lang.org ist per Proxy gesperrt (403). Umweg: `https://github.com/leanprover/lean4/releases/download/v4.19.0/lean-4.19.0-linux.tar.zst` laden (kein zstd-Binary: mit `pip install zstandard` + Python entpacken), dann `elan toolchain link leanprover/lean4:v4.19.0 <dir>`.
- `lake exe cache get` scheitert: lakecache.blob.core.windows.net gesperrt (403). mathlib muss aus Quellen gebaut werden, in Blöcken ≤30 min (`timeout 1800 lake build`, inkrementell).
- Nicht `lake update` benutzen (schreibt lake-manifest.json um); `lake build` holt die Pakete aus dem Manifest.
- In GitHub Actions (A-11) sollte der Cache dagegen erreichbar sein.

Verwandt: [[mm325-lizenz]]

Ergebnis A-02 (PR #8, gemergt 25.11.2026, Merge 36c86ac): Build in 14,5 min auf 4 Kernen grün, nur Standard-Axiome, Bericht in lean/NACHBAU.md (Status behauptet).

Ergebnis A-11 (PR #9, gemergt 25.11.2026, Merge 4644cfc): Workflow `.github/workflows/lean-build.yml` baut mm325_proof@759cf4a in Actions grün in ~2,5 min (mathlib-Cache geht dort). Lauf 1: https://github.com/Justus42/matmul-rank-n2m/actions/runs/45518440779 . Axiom-Prüfung Audit.lean (10/10 Standard) und eigene modulweite Prüfung (227 Sätze, Vereinigung propext/Classical.choice/Quot.sound) bestanden. Pushen von Workflow-Dateien und Mergen durch Thread erlaubt. Auslöser: PRs/Pushes auf main, die den Workflow oder lean/** ändern, plus workflow_dispatch.
