#!/bin/bash

# Copy all files from the archive - conda-build will select the right files for each output package
# based on the files: patterns in meta.yaml

# Copy header files
mkdir -p $PREFIX/include
cp -r include/* $PREFIX/include/ 2>/dev/null || true

# Copy library files (including symlinks)
mkdir -p $PREFIX/lib
cp --no-dereference lib/libcudnn*.so* $PREFIX/lib/ 2>/dev/null || true
