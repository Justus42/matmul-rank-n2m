#!/bin/sh
# S4-22 compute block: independent flip-graph runs (at most 4), one core each.
# Block 1 ran an earlier version with P = 2, B = 0 fixed.
# usage: block.sh n k m target seconds tag P B seed1 seed2 ...   (P = 0: over Z with |coef| <= B)
set -u
n=$1; k=$2; m=$3; tgt=$4; sec=$5; tag=$6; P=$7; B=$8; shift 8
gcc -O2 -o /tmp/claude-0/flip "$(dirname "$0")/flip.c" || exit 1
date -u +"start %T" | tee -a daten/$tag.log
L=50000
for s in "$@"; do
  /tmp/claude-0/flip $n $k $m $P $B $tgt $s $sec $L $((tgt + 2)) daten/${tag}_s$s.txt 50 > daten/${tag}_s$s.log 2>&1 &
done
wait
date -u +"end %T" | tee -a daten/$tag.log
