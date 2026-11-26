#!/bin/bash
# Rechenblock 1 (S4-08): 4 Kerne, harte Grenze je Lauf, Gesamtgrenze per timeout von außen.
# Aufruf: block_lm.sh MODE R SEEDSTART RUNS_PER_CORE SECONDS_PER_RUN
MODE=$1; R=$2; S0=$3; RUNS=$4; SEC=$5
D=$(dirname "$0")
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1
for c in 0 1 2 3; do
  ( for i in $(seq 0 $((RUNS-1))); do
      s=$((S0 + c*1000 + i))
      timeout $((SEC+30)) python3 "$D/lm_normalform.py" "$MODE" "$R" "$s" 100000 "$SEC"
    done ) &
done
wait
