@echo off
setlocal

echo "Downloading biicode"
powershell "wget http://www.biicode.com/downloads/latest/win -OutFile bii-win.exe"

echo "Installing biicode"
bii-win.exe /VERYSILENT

:: 'set' sets the variable for the current batch script execution
:: 'setx' sets it externally
set PATH=%PATH%;C:\Program Files (x86)\BiiCode\bii
setx PATH "%PATH%;C:\Program Files (x86)\BiiCode\bii"
bii --version
del bii-win.exe
