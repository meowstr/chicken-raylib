#!/bin/sh

"$CHICKEN_CSC" $@ -C "`pkg-config --cflags raylib`"
