#!/bin/bash

source config.sh

rm -r build/*
FLAGS="$FLAGS $RELEASE_FLAGS"
CC="em++"
EXT=".html"
PLATFORM="PLATFORM_WEB"
TARGET_FLAGS="-s MINIFY_HTML=0 -s ASYNCIFY -s USE_GLFW=3 -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1 --shell-file raylib/src/minshell.html --preload-file assets"

$CC ../src/maqquina/maqquina.cc -o ./build/maqquina.o -c -L./lib -lraylib -D$PLATFORM $FLAGS $TARGET_FLAGS
$CC $SRC -Iinclude -Llib/$TARGET -o build/$NAME$EXT -L./lib -lraylib -D$PLATFORM $FLAGS $TARGET_FLAGS
 mv build/$NAME.html build/index.html
