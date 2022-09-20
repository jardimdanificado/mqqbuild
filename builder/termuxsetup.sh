#!/bin/bash
pkg install build-essential clang emscripten git
rm -r raylib
rm -r build
rm -r lib
mkdir build
mkdir lib

git clone https://github.com/raysan5/raylib --depth 1

cd raylib/src
make PLATFORM=PLATFORM_WEB || make PLATFORM=PLATFORM_WEB  -e
mv libraylib.a ../../lib/
cp raylib.h ../../include
make clean || make clean -e || rm -fv *.o
cd ../..
