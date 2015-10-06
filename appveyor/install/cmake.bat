@echo off
setlocal

echo "Downloading cmake"
powershell "wget https://s3.amazonaws.com/biibinaries/thirdparty/cmake-3.0.2-win32-x86.zip -OutFile cmake.zip"

echo "Unzipping cmake"
7z x cmake.zip -o"C:\Program Files (x86)\" -y > nul

:: 'set' sets the variable for the current batch script execution
:: 'setx' sets it externally
set PATH=%PATH%;C:\Program Files (x86)\cmake-3.0.2-win32-x86\bin
setx PATH "%PATH%;C:\Program Files (x86)\cmake-3.0.2-win32-x86\bin"
cmake --version
del cmake.zip
