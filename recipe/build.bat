@echo on
@setlocal EnableDelayedExpansino

set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat
set LUA_LIB=%LIBRARY_PREFIX%\lib
set LUA_LIB_NAME=luajit
set LUA_LINK=dylib

:: build statically linked binary with Rust
cargo install --no-default-features --bins --no-track --locked --root %LIBRARY_PREFIX% --path .

:: check licenses
cargo-bundle-licenses \
    --format yaml \
    --output THIRDPARTY.yml
