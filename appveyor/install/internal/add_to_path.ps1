# 'set' sets the variable for the current batch script execution
# 'setx' sets it externally, but has a 1024 character limit
# Powershell edits the registry, and broadcasts a WM_SETTINGCHANGE event necessary for applications to recognize the path change
param([string]$pathToAdd)

Write-Host "Prepending '$pathToAdd' to the PATH"

$existingPath = [Environment]::GetEnvironmentVariable('path', 'machine');
[Environment]::SetEnvironmentVariable('path', "$pathToAdd;$existingPath",'machine');