: Copy all the header files and the shared libraries, but not the static libraries, into the prefix
MOVE include\* %LIBRARY_INC%

MOVE bin\* %LIBRARY_BIN%
