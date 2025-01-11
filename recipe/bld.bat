: Copy all the header files, import libraries, and the shared libraries into the prefix
MOVE include\* %LIBRARY_INC%
MOVE lib\x64\* %LIBRARY_LIB%
MOVE bin\* %LIBRARY_BIN%
