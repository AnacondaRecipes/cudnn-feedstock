REM Copy all files from the archive - conda-build will select the right files for each output package
REM based on the files: patterns in meta.yaml
REM Windows archives use Library/bin, Library/include, Library/lib structure

REM Copy header files
if exist Library\include\* (
    MOVE Library\include\* %LIBRARY_INC%
)

REM Copy import libraries
if exist Library\lib\* (
    MOVE Library\lib\* %LIBRARY_LIB%
)

REM Copy DLLs
if exist Library\bin\* (
    MOVE Library\bin\* %LIBRARY_BIN%
)
