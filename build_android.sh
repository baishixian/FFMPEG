#!/bin/bash
export TMPDIR=/Users/baishixian/GooglePlayApp/SupportTools
NDK=/Users/baishixian/ndk/android-ndk-r13
SYSROOT=$NDK/platforms/android-18/arch-arm/
TOOLCHAIN=/Users/baishixian/ndk/android-ndk-r13/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
CPU=arm
PREFIX=./android/$CPU
ADDI_CFLAGS="-marm"
function build_one
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-doc \
--disable-symver \
--enable-small \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}
build_one