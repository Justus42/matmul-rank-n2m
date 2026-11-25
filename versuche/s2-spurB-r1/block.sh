#!/bin/sh
# Run one search block: four processes in parallel, each for SECS seconds.
# Usage: block.sh NAME SECS "args1" "args2" "args3" "args4"
# Each args string is passed to flip (p seed ... options). Output goes to
# $OUT/NAME/<i>.log (full) ; the binary is $FLIP.
NAME=$1; SECS=$2; shift 2
mkdir -p "$OUT/$NAME"
i=0
for a in "$@"; do
  i=$((i+1))
  set -- $a
  p=$1; seed=$2; shift 2
  timeout $((SECS+60)) "$FLIP" $p $seed $SECS --out "$OUT/$NAME/found$i.txt" "$@" > "$OUT/$NAME/$i.log" 2>&1 &
done
wait
