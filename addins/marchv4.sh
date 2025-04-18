#!/bin/bash
# shellcheck disable=SC2016
FF_CONFIGURE+=" --cpu=x86-64-v4"

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="${CFLAGS} -march=x86-64-v4"'
    to_df 'ENV CXXFLAGS="${CXXFLAGS} -march=x86-64-v4 -Wp,-D_GLIBCXX_ASSERTIONS"'
    to_df 'ENV FFLAGS="${FFLAGS} -march=x86-64-v4"'
    to_df 'ENV FCFLAGS="${FCFLAGS} -march=x86-64-v4"'
    to_df 'ENV RUSTFLAGS="${RUSTFLAGS} -Ctarget-cpu=x86-64-v4"'
    to_df 'ENV GOAMD64=v4'
}
