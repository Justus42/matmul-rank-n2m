# S2-02, Spur A, Runde 1: Rechnungen über 𝔽₂ für ⟨2,4,4⟩

Bericht: `lean/prosa/s2_444_spurA_r1.md`. Dieser Ordner enthält nur, was man zum Nachrechnen braucht. Alle Ergebnisse haben den Status **behauptet**.

## Inhalt

| Pfad | Was |
|---|---|
| `V-S2-02-wang-dp-allein.md` | gescheiterter Ansatz: Wangs Programm allein reicht nicht für 26 (nicht einmal für 25) |
| `code/build.sh` | baut Wangs Such- und Prüfprogramm ohne Bazel (eigenes Skript) |
| `code/run2.sh` | Aufzählung, Suche mit Zeitgrenze, Prüfung (eigenes Skript) |
| `code/shim/ng-log/logging.h` | Ersatz für die Bibliothek ng-log durch glog (eigene Datei, 5 Zeilen) |
| `daten/cert_matrix_q02_n244_lb22.pb.txt` und `.btp` | Zertifikat für R_𝔽₂(⟨2,4,4⟩) ≥ 22 |
| `daten/cert_matrix_q02_n244_basic_lb20.pb.txt` und `.btp` | Zertifikat ohne Substitution, ≥ 20 |
| `daten/tabelle_244_lb22.txt` | die 86 Orbits mit Schranke und Technik, lesbar |
| `logs/` | Protokolle der Suchläufe als `.txt` (Fortschrittszeilen entfernt; `.log` ignoriert das Repo) |

Wangs Code selbst liegt **nicht** im Repo. Er wird als externer Klon benutzt (Commit `9db3d215267932ba3e8801a10655a2d538ed13d8`, MIT-Lizenz).

## Prüfsummen (SHA-256)

```
1f1214b18f46e687acc7fe86d18038da4bc8df20ed125465ef3c6fd55a376aac  cert_matrix_q02_n244_lb22.pb.txt
c818a8fc6bd9bb1bfe34d28ff80b17f0867d73432d6056d9fb1db74ecf7ee504  cert_matrix_q02_n244_lb22.btp
62c135772b6c4f26fa369d7e571df44d419fe26c0595d63ddcd3e21e77119d80  cert_matrix_q02_n244_basic_lb20.pb.txt
b58fb9c5fd9d5f85b6f454450904282f6184b0a4fd547f5ef7c935e03033f4c8  cert_matrix_q02_n244_basic_lb20.btp
```

## Nachrechnen

Voraussetzung: Ubuntu 24.04 mit `libprotobuf-dev protobuf-compiler libgflags-dev libgoogle-glog-dev libboost-dev libboost-iostreams-dev libtbb-dev`, g++ 13.

```bash
git clone https://github.com/wcgbg/tensor-rank-lower-bound.git   # Commit 9db3d21
# in code/build.sh und code/run2.sh die Pfade SRC und B anpassen
mkdir -p $B/shim $B/gen && cp -r code/shim/* $B/shim/
protoc -I$SRC --cpp_out=$B/gen $SRC/core/certificate.proto
./code/build.sh 2 4 4
$B/bin_q2_244/verifier_main daten/cert_matrix_q02_n244_lb22.pb.txt   # erwartet: "Verified. ... is 22."
```

Das Prüfprogramm sucht die `.btp`-Datei neben der `.pb.txt`-Datei mit gleichem Stamm. Die Prüfung dauert etwa 1 Sekunde.

Neu rechnen (12 Minuten auf 4 Kernen):

```bash
./code/run2.sh 244 bt1e6 1680 --backtracking_step_limit=1000000
```

Die Suche ist bei mehreren Threads nicht deterministisch in der Reihenfolge, das Zertifikat kann sich deshalb in Einzelheiten unterscheiden. Die Schranke 22 sollte sich wiederholen.
