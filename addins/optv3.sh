#!/bin/bash
FF_CONFIGURE+=" --cpu=x86-64-v3 --optflags=-O3"

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="$CFLAGS -march=x86-64-v3 -mtune=znver2 -O3" CXXFLAGS="$CXXFLAGS -mtune=znver2 -O3" RUSTFLAGS="-Copt-level=3 -Ctarget-cpu=x86-64-v3 -Clink-arg=-z -Clink-arg=pack-relative-relocs -Ccodegen-units=1" GOAMD64=v3'
}
