#!/bin/bash
pkg install build-essential clang emscripten git
#rm -r raylib
#git clone https://github.com/raysan5/raylib --depth 1

cd raylib/src
make PLATFORM=PLATFORM_WEB || make PLATFORM=PLATFORM_WEB  -e
mv libraylib.a ../../lib/$TARGET
cp raylib.h ../../include
make clean || make clean -e || rm -fv *.o
cd ../..
