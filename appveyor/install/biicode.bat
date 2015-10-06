@echo off
setlocal

set SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

echo "Downloading biicode"
powershell "wget http://www.biicode.com/downloads/latest/win -OutFile bii-win.exe"

echo "Installing biicode"
bii-win.exe /VERYSILENT

set PATH=%PATH%;C:\Program Files (x86)\BiiCode\bii
powershell -File "%SCRIPT_DIR%\internal\add_to_path.ps1" "C:\Program Files (x86)\BiiCode\bii"
bii --version
del bii-win.exe
