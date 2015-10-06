@echo off
setlocal

set SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

echo "Downloading cmake"
powershell "wget https://s3.amazonaws.com/biibinaries/thirdparty/cmake-3.0.2-win32-x86.zip -OutFile cmake.zip"

echo "Unzipping cmake"
7z x cmake.zip -o"C:\Program Files (x86)\" -y > nul

set PATH=%PATH%;C:\Program Files (x86)\cmake-3.0.2-win32-x86\bin
powershell -File "%SCRIPT_DIR%\internal\add_to_path.ps1" "C:\Program Files (x86)\cmake-3.0.2-win32-x86\bin"
cmake --version
del cmake.zip
