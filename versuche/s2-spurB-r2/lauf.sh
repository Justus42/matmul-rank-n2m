#!/bin/bash
# Run kissat on several CNF files in parallel with a hard time limit.
# usage: lauf.sh SECONDS file1.cnf [file2.cnf ...]   (writes file.out, file.drat if PROOF=1)
T=$1; shift
K=${KISSAT:-/tmp/kissat/build/kissat}
for c in "$@"; do
  b=${c%.cnf}
  ( s=$(date +%s); if [ "${PROOF:-0}" = 1 ]; then timeout $T $K -q --no-binary $c $b.drat > $b.out; else timeout $T $K -q $c > $b.out; fi; echo "c wall=$(( $(date +%s) - s ))s rc=$?" >> $b.out ) &
done
wait
for c in "$@"; do b=${c%.cnf}; echo "$(basename $b): $(grep '^s ' $b.out || echo 's TIMEOUT') $(grep wall $b.out)"; done
