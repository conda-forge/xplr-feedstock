#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=fat
export LUA_LIB=${PREFIX}/lib
export LUA_LIB_NAME=luajit
export LUA_LINK=dylib

# build statically linked binary with Rust
cargo install --no-default-features --bins --no-track --locked --root ${PREFIX} --path .

# check licenses
cargo-bundle-licenses \
    --format yaml \
    --output THIRDPARTY.yml
