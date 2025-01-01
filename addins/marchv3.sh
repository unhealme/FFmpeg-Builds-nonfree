#!/bin/bash
# shellcheck disable=SC2016
FF_CONFIGURE+=" --cpu=x86-64-v3"

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="${CFLAGS} -march=x86-64-v3"'
    to_df 'ENV CXXFLAGS="${CXXFLAGS} -march=x86-64-v3 -Wp,-D_GLIBCXX_ASSERTIONS"'
    to_df 'ENV RUSTFLAGS="${RUSTFLAGS} -Ctarget-cpu=x86-64-v3"'
    to_df 'ENV GOAMD64=v3'
}
