#!/bin/sh
# S4-22 compute block: 4 independent flip-graph runs over GF(2), one core each.
# usage: block.sh n k m target seconds tag seed1 seed2 seed3 seed4
set -u
n=$1; k=$2; m=$3; tgt=$4; sec=$5; tag=$6; shift 6
gcc -O2 -o /tmp/claude-0/flip "$(dirname "$0")/flip.c" || exit 1
date -u +"start %T" | tee -a daten/$tag.log
L=50000
for s in "$@"; do
  /tmp/claude-0/flip $n $k $m 2 0 $tgt $s $sec $L $((tgt + 2)) daten/${tag}_s$s.txt 50 > daten/${tag}_s$s.log 2>&1 &
done
wait
date -u +"end %T" | tee -a daten/$tag.log
