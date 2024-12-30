#!/bin/bash
# shellcheck disable=SC2016
FF_CONFIGURE+=" --cpu=x86-64-v3 --optflags=-O3"

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="${CFLAGS} -march=x86-64-v3 -O3 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -mpclmul"'
    to_df 'ENV CXXFLAGS="${CXXFLAGS} ${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"'
    to_df 'ENV LDFLAGS="${LDFLAGS} -Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,-z,pack-relative-relocs"'
    to_df 'ENV RUSTFLAGS="${RUSTFLAGS} -Copt-level=3 -Ctarget-cpu=x86-64-v3 -Clink-arg=-z -Clink-arg=pack-relative-relocs -Ccodegen-units=1"'
    to_df 'ENV FCFLAGS="$CFLAGS" FFLAGS="$CFLAGS" GOAMD64=v3'
}
