---
name: s2-02-spurA-f2-wang
description: S2-02 (25.11.2026): Wangs F2-Programm für <2,4,4> liefert nur ≥22, Ziel 26 verfehlt; Yang-Restfälle bei r=25; PR #35 gemergt
metadata:
  type: project
  modified: 2026-11-25T08:10:58.072Z
---

S2-02, Stufe 2 Runde 1, Spur A, PR #35 gemergt (e97f1be). Bericht `lean/prosa/s2_444_spurA_r1.md`, Daten `versuche/s2-spurA-r1/`. Status behauptet.

- Wangs Code (github.com/wcgbg/tensor-rank-lower-bound, Commit 9db3d21, MIT) ohne Bazel gebaut: Bazel-Registry ist per Proxy gesperrt, Git LFS des fremden Repos auch. apt geht. Build: g++ + Ubuntu-Pakete (protobuf, gflags, glog statt ng-log per Shim, boost, tbb), Skript `versuche/s2-spurA-r1/code/build.sh`.
- Ergebnis: R_F2(<2,4,4>) ≥ 22 (Schrittgrenze 1 Mio., 12 min auf 4 Kernen), unter bekannten 23/25. Schrittgrenze 10 Mio. schafft die mittlere Schicht nicht in 28 min. Orientierung A=2x4 nehmen (Abfrageseite GL2), nicht 4x2.
- Yang n=m=4 bei r=25: Restfälle ρ=3, (rkL,rkH) ∈ {(3,6),(4,7),(5,7),(5,8)}.
- Kein Wang-Code kopiert; Zeile für lit/LIZENZEN.md im Bericht Abschnitt 10 vorgeschlagen.
- Hintergrund-Bash: `timeout` bei run_in_background ist die Laufzeitgrenze (ich hatte 10 min gesetzt, Lauf wurde gekillt).

**Why:** Grundlage für Spur A in Runde 2.
**How to apply:** Vor neuen F2-Rechnungen den Bericht lesen; Verwandt: [[wache-stufe2-4x2x4]], [[abgleich-yang-n4-b007]]
