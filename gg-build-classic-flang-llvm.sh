#!/usr/bin/env bash

set -e -u -o pipefail

. ./gg-classic-flang-setup.sh

if [[ ! -d "$CFLP" ]]; then
    git clone -b release_16x https://github.com/flang-compiler/classic-flang-llvm-project.git "$CFLP"
fi

cd "$CFLP"
mkdir -p build && cd build
cmake $CMAKE_OPTIONS -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
      -DLLVM_ENABLE_CLASSIC_FLANG=ON -DLLVM_ENABLE_PROJECTS="clang;openmp" ../llvm
make $MAKE_P
make install
