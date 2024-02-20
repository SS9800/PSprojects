if (-not (Get-WmiObject -Class Win32_Product -Filter "Name='notepad++'")) {
    # Code to execute if Notepad++ is NOT installed
    Write-Host "Notepad++ is not installed."

    # Download and install Notepad++
    Write-Host "Downloading Notepad++..."
    $npInstallerPath = "$env:TEMP\npp.8.6.4.Installer.x64.exe"
    Invoke-WebRequest -Uri "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.4/npp.8.6.4.Installer.x64.exe" -OutFile $npInstallerPath
    Write-Host "Installing Notepad++..."
    Start-Process -FilePath $npInstallerPath -Args "/S" -Wait  # Use "/S" for silent installation
    Remove-Item $npInstallerPath
} else {
    # Code to execute if Notepad++ is already installed
    Write-Host "Notepad++ is already installed."
}
