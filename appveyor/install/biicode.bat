@echo off

set SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

echo "Downloading biicode"
powershell "wget http://www.biicode.com/downloads/latest/win -OutFile bii-win.exe"

echo "Installing biicode"
bii-win.exe /VERYSILENT

set PATH=C:\Program Files (x86)\BiiCode\bii;%PATH%
bii --version
del bii-win.exe
