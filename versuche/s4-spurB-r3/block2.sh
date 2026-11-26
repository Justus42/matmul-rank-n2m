#!/bin/sh
# Block 2 (S4-16): exact rounding of the two float candidates at 35 from block 1,
# plus two fresh search+rounding pipelines at 35. 4 cores, hard limit 1150 s each.
cd "$(dirname "$0")"
D=daten
echo "Block 2 start $(date -u +%T)" > $D/block2.log
for s in 11 14; do
  OMP_NUM_THREADS=1 timeout 1150 python3 -u rounding.py $D/kand35_s$s.json $D/3x2x7-r35-s4-16-s$s.json 1120 > $D/block2_round_s$s.log 2>&1 &
done
for s in 21 22; do
  ( OMP_NUM_THREADS=1 timeout 600 python3 -u search.py --m 7 --R 35 --sn1 --k1 --seed $s --time 580 --try-time 60 --out $D/kand35_s$s.json > $D/block2_search_s$s.log 2>&1;
    if [ -f $D/kand35_s$s.json ]; then
      OMP_NUM_THREADS=1 timeout 540 python3 -u rounding.py $D/kand35_s$s.json $D/3x2x7-r35-s4-16-s$s.json 520 > $D/block2_round_s$s.log 2>&1
    fi ) &
done
wait
echo "Block 2 end $(date -u +%T)" >> $D/block2.log
