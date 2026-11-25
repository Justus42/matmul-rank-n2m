#!/bin/bash
# S2-02 (stage 2, track A, round 1). Own build script, not copied from upstream.
# Builds the search and verifier binaries of Chengu Wang's tensor-rank-lower-bound
# (https://github.com/wcgbg/tensor-rank-lower-bound, commit 9db3d21, MIT License,
# Copyright (c) 2026 Chengu Wang) WITHOUT Bazel, against Ubuntu 24.04 packages
# (libprotobuf-dev, protobuf-compiler, libgflags-dev, libgoogle-glog-dev,
# libboost-dev, libboost-iostreams-dev, libtbb-dev). The upstream code is used
# as an external checkout at $SRC and is not part of this repository.
# usage: build.sh N0 N1 N2 [P]   -> bin_<N0><N1><N2>/{orbit_enumerator_main,rank_lower_bound_main,verifier_main}
set -e
SRC=/tmp/claude-0/ext/tensor-rank-lower-bound
B=/tmp/claude-0/build
P=${4:-2}
OUT=$B/bin_q$P_$1$2$3; OUT=$B/bin_q${P}_$1$2$3; mkdir -p $OUT
DEF="-DCP_MATRIX -DCP_P=$P -DCP_M=1 -DCP_N0=$1 -DCP_N1=$2 -DCP_N2=$3"
FL="-std=c++20 -O3 -march=native -w -I$SRC -I$B/gen -I$B/shim"
if [ ! -f $B/common.a ]; then
  g++ $FL -c $SRC/core/backtracking_proof.cc -o $B/bp.o
  g++ $FL -c $SRC/core/dynamic_matrix.cc -o $B/dm.o
  g++ $FL -c $B/gen/core/certificate.pb.cc -o $B/pb.o
  ar rcs $B/common.a $B/bp.o $B/dm.o $B/pb.o
fi
LIBS="$B/common.a -lprotobuf -lgflags -lglog -ltbb -lboost_iostreams -lz -lpthread"
for m in search/orbit_enumerator_main search/rank_lower_bound_main verifier/verifier_main; do
  g++ $FL $DEF $SRC/$m.cc $LIBS -o $OUT/$(basename $m) &
done
wait
ls $OUT
