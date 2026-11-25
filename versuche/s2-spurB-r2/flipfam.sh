#!/bin/bash
# Many independent flip-graph runs from the standard algorithm (32 products), each with its own seed.
# usage: flipfam.sh FLIP P FIRSTSEED COUNT SECONDS OUTDIR [extra flip options]
FLIP=$1; P=$2; S0=$3; N=$4; T=$5; OUT=$6; shift 6
mkdir -p $OUT
for s in $(seq $S0 $((S0+N-1))); do
  timeout $((T+30)) $FLIP $P $s $T --out $OUT/found$s.txt "$@" > $OUT/$s.log 2>&1
done
