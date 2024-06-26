#!/bin/bash
# shellcheck disable=SC2016
FF_CONFIGURE+=" --cpu=x86-64-v3 --optflags=-O3"

ffbuild_dockeraddin() {
    to_df 'ENV RUSTFLAGS="-Copt-level=3 -Ctarget-cpu=x86-64-v3 -Clink-arg=-z -Clink-arg=pack-relative-relocs -Ccodegen-units=1" GOAMD64=v3'
}
