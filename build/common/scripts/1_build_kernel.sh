#!/usr/bin/env bash

cd /src

# set build environment
ARCH=arm64
ASUS_BUILD_PROJECT=ZS673KS
ASUS_ZS673KS_PROJECT=true
CROSS_COMPILE="/opt/aarch64-linux-android-4.9/bin/aarch64-linux-android-"
CROSS_COMPILE_ARM32="/opt/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-"
CROSS_COMPILE_COMPAT="/opt/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-"
CLANG_TRIPLE=aarch64-linux-gnu-
PATH="/opt/clang/bin:/src/tools:${PATH}"
SUBARCH=arm64
export ARCH ASUS_BUILD_PROJECT ASUS_ZS673KS_PROJECT CROSS_COMPILE CROSS_COMPILE_ARM32 CROSS_COMPILE_COMPAT CLANG_TRIPLE PATH SUBARCH

rm -rf out/
mkdir -p out/

make -C $(pwd) \
  O=$(pwd)/out \
  LLVM=1 \
  kirisakura_defconfig

make -j$(nproc --all) -C $(pwd) \
  O=$(pwd)/out \
  LLVM=1
