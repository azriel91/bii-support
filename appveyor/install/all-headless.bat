@echo off
setlocal

set SCRIPT_DIR=%~dp0

%SCRIPT_DIR%/cmake.bat
%SCRIPT_DIR%/biicode.bat
