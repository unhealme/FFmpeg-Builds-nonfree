#!/bin/bash
# shellcheck disable=SC2016
FF_CONFIGURE+=" --cpu=x86-64-v3 --optflags=-O3"
#FF_CFLAGS+=" -march=x86-64-v3 -O3 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -mpclmul"
#FF_CXXFLAGS+=" -march=x86-64-v3 -O3 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -mpclmul -Wp,-D_GLIBCXX_ASSERTIONS"
#FF_LDFLAGS+=" -Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,-z,pack-relative-relocs"

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="${CFLAGS} -march=x86-64-v3"'
    to_df 'ENV CXXFLAGS="${CXXFLAGS} -march=x86-64-v3 -Wp,-D_GLIBCXX_ASSERTIONS"'
    to_df 'ENV RUSTFLAGS="${RUSTFLAGS} -Copt-level=3 -Ctarget-cpu=x86-64-v3 -Clink-arg=-z -Clink-arg=pack-relative-relocs -Ccodegen-units=1"'
    to_df 'ENV GOAMD64=v3'
}
