. gg-classic-flang-setup.sh

if [[ ! -d flang ]]; then
    git clone ssh:git@github.com/flang-compiler/flang.git
fi

(cd flang/runtime/libpgmath
 mkdir -p build && cd build
 cmake $CMAKE_OPTIONS ..
 make $MAKE_P
 make install)

cd flang
mkdir -p build && cd build
cmake $CMAKE_OPTIONS -DFLANG_LLVM_EXTENSIONS=ON ..
make $MAKE_P
make install
