#!/usr/bin/env bash
set -e

check-glibc lib/lib*.so*

# Copy all the header files and the shared libraries (including symlinks), but not the static libraries, into the prefix
mkdir -p $PREFIX/include
cp -vp include/cudnn*.h $PREFIX/include/

mkdir -p $PREFIX/lib
cp -vpP lib/libcudnn*.so* $PREFIX/lib/
