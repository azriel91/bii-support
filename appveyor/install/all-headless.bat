@echo off
setlocal

set SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

call %SCRIPT_DIR%\cmake.bat
call %SCRIPT_DIR%\biicode.bat
