if (-not (Get-WmiObject -Class Win32_Product -Filter "Name='Microsoft Visual Studio Code'")) {
    # Code to execute if Visual Studio Code is NOT installed
    Write-Host "Visual Studio Code is not installed."

    # Download and install Visual Studio Code
    Write-Host "Downloading Visual Studio Code..."
    $vsCodeInstallerPath = "$env:TEMP\VSCodeSetup-x64.exe"
    Invoke-WebRequest -Uri "https://aka.ms/win32-x64-user-stable" -OutFile $vsCodeInstallerPath
    Write-Host "Installing Visual Studio Code..."
    Start-Process -FilePath $vsCodeInstallerPath -Args "/S" -Wait  # Use "/S" for silent installation
    Remove-Item $vsCodeInstallerPath
} else {
    # Code to execute if Visual Studio Code is already installed
    Write-Host "Visual Studio Code is already installed."
}