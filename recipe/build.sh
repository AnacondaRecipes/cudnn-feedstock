#!/bin/bash

# Copy all the header files and the shared libraries (including symlinks), but not the static libraries, into the prefix
mkdir -p $PREFIX/include
cp include/* $PREFIX/include/

mkdir -p $PREFIX/lib
cp --no-dereference lib/libcudnn*so* $PREFIX/lib/
