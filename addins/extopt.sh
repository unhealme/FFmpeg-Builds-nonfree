#!/bin/bash
# shellcheck disable=SC2016
FF_CONFIGURE+=" --optflags=-O3"

if [[ "$TARGET" == 'linux64' ]]; then
    FF_CFLAGS+=" -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -mpclmul"
    FF_CXXFLAGS+=" -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -mpclmul"
    FF_LDFLAGS+=" -Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,-z,pack-relative-relocs"
fi

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="$CFLAGS -O3" CXXFLAGS="$CXXFLAGS -O3"'
    to_df 'ENV RUSTFLAGS="${RUSTFLAGS} -Copt-level=3 -Clink-arg=-z -Clink-arg=pack-relative-relocs -Ccodegen-units=1"'
}
