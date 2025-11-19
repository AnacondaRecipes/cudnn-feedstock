#!/bin/bash

# Copy all files from the archive - conda-build will select the right files for each output package
# based on the files: patterns in meta.yaml

# Copy header files
mkdir -p $PREFIX/include
cp -r include/* $PREFIX/include/ 2>/dev/null || true

# Copy library files (including symlinks)
mkdir -p $PREFIX/lib
cp --no-dereference lib/libcudnn*.so* $PREFIX/lib/ 2>/dev/null || true

# Remove runpaths to avoid conda-build overlinking errors
# NVIDIA libraries use $ORIGIN in their runpaths which is fine, but conda-build flags it
for lib in $PREFIX/lib/libcudnn*.so.*; do
    if [ -f "$lib" ] && [ ! -L "$lib" ]; then
        patchelf --remove-rpath "$lib" 2>/dev/null || true
    fi
done

check-glibc ${PREFIX}/${targetsDir}/lib/*.so.*