@echo off
setlocal

set SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%
set BLOCK_DIR=%SCRIPT_DIR%\..\..\..

set VALID=false
if [%BUILD_SHARED_LIBS%] == [ON] set VALID=true
if [%BUILD_SHARED_LIBS%] == [OFF] set VALID=true
if [%BUILD_SHARED_LIBS%] == [] set VALID=true

if [%VALID%] == [false] (
  1>&2 echo "The BUILD_SHARED_LIBS variable must be either blank, or set to ON or OFF"
  exit /B 1
)

:: Set the compilation tool used to compile wxwidgets
set BII_WX_COMPILE_TOOL=Visual Studio 12 2013

:: Initialize bii project if it isn't already
if not exist "%BLOCK_DIR%\bii\settings.bii" (
  pushd %BLOCK_DIR%
  bii init -l
  popd
)

:: Configure cmake, optionally with BUILD_SHARED_LIBS if specified
if not [%BUILD_SHARED_LIBS%] == [] set DEFINE_BUILD_MODE=-DBUILD_SHARED_LIBS=%BUILD_SHARED_LIBS%
if [%US_ENABLE_AUTOLOADING_SUPPORT%] == [] set US_ENABLE_AUTOLOADING_SUPPORT=ON

:: bii configure -G "Visual Studio 12 2013" -DUS_ENABLE_AUTOLOADING_SUPPORT=ON -DBUILD_SHARED_LIBS=ON
bii configure ^
  -G "Visual Studio 12 2013" ^
  "-DUS_ENABLE_AUTOLOADING_SUPPORT=%US_ENABLE_AUTOLOADING_SUPPORT%" ^
  %DEFINE_BUILD_MODE%

bii build