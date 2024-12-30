#!/bin/bash
# shellcheck disable=SC2016
FF_CONFIGURE="$FF_CONFIGURE --enable-lto"

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="${CFLAGS} -flto=auto -falign-functions=32" CXXFLAGS="${CXXFLAGS} -flto=auto -falign-functions=32" LDFLAGS="${LDFLAGS} -flto=auto -falign-functions=32"'
    to_df 'ENV FFBUILD_TARGET_FLAGS="$FFBUILD_TARGET_FLAGS --ar=${FFBUILD_TOOLCHAIN}-gcc-ar --nm=${FFBUILD_TOOLCHAIN}-gcc-nm --ranlib=${FFBUILD_TOOLCHAIN}-gcc-ranlib"'
    to_df 'ENV CARGO_PROFILE_RELEASE_LTO=fat'
}
