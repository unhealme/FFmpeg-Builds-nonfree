#!/bin/bash
# shellcheck disable=SC2016

ffbuild_dockeraddin() {
    to_df 'ENV CFLAGS="${CFLAGS} -falign-functions=32" CXXFLAGS="${CXXFLAGS} -falign-functions=32" LDFLAGS="${LDFLAGS} -falign-functions=32"'
    to_df 'ENV CARGO_PROFILE_RELEASE_LTO=fat'
}
