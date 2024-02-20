# Specify the registry path for PowerShell logging
$registryPath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"

# Check if the registry path exists, and create it if not
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Enable script block logging
Set-ItemProperty -Path $registryPath -Name "EnableScriptBlockLogging" -Value 1

# Specify the path for the log file
$logFilePath = "C:\Path\To\Your\Log\Directory\PowerShellScriptBlock.log"

# Check if the log file path exists, and create it if not
if (-not (Test-Path $logFilePath)) {
    New-Item -ItemType File -Path $logFilePath -Force
}

# Enable script block logging to the specified log file
Set-ItemProperty -Path $registryPath -Name "LogPath" -Value $logFilePath
Set-ItemProperty -Path $registryPath -Name "LogScriptBlockText" -Value 1

Write-Host "PowerShell script block logging has been enabled. Log file path: $logFilePath"
