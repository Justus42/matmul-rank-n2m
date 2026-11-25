#!/bin/bash
# S2-02 (stage 2, track A, round 1). Own build script, not copied from upstream.
# Builds the search and verifier binaries of Chengu Wang's tensor-rank-lower-bound
# (https://github.com/wcgbg/tensor-rank-lower-bound, commit 9db3d21, MIT License,
# Copyright (c) 2026 Chengu Wang) WITHOUT Bazel, against Ubuntu 24.04 packages
# (libprotobuf-dev, protobuf-compiler, libgflags-dev, libgoogle-glog-dev,
# libboost-dev, libboost-iostreams-dev, libtbb-dev). The upstream code is used
# as an external checkout at $SRC and is not part of this repository.
# usage: run2.sh N0N1N2 TAG timeout_s [extra lb args...]
B=/tmp/claude-0/build; N=$1; TAG=$2; TO=$3; shift 3
[ -x $B/bin_q2_$N/verifier_main ] || $B/build.sh ${N:0:1} ${N:1:1} ${N:2:1} >/dev/null
C=$B/runs/c${N}_$TAG.pb.txt; L=$B/logs/$N-$TAG; mkdir -p $L
echo "start $(date -u +%H:%M:%S) $N $TAG args: $*"
$B/bin_q2_$N/orbit_enumerator_main --output_path $C --log_dir $L 2>&1 | grep -E "total_count"
S=$SECONDS; timeout $TO $B/bin_q2_$N/rank_lower_bound_main $C --ignore_rank_lower_bound --log_dir $L "$@" > $L/search.out 2>&1; echo "search exit=$? $((SECONDS-S))s"
grep -E "UNCONSTRAINED" $L/search.out
S=$SECONDS; $B/bin_q2_$N/verifier_main $C --log_dir $L > $L/verify.out 2>&1; echo "verify exit=$? $((SECONDS-S))s"; grep -E "Verified\.|FATAL" $L/verify.out
