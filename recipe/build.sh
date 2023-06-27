#!/bin/bash

# Copy all the header files, and the shared libraries, into the prefix
mkdir -p $PREFIX/include
cp include/* $PREFIX/include/

mkdir -p $PREFIX/lib
cp lib/libcudnn*so* $PREFIX/lib/

# All these sos are provided directly
#ln -s $PREFIX/lib/libcudnn.so.8.2.1 $PREFIX/lib/libcudnn.so.8
#ln -s $PREFIX/lib/libcudnn.so.8 $PREFIX/lib/libcudnn.so

