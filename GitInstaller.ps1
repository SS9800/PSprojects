if (-not (Test-Path -Path "$env:ProgramFiles\Git\bin\git.exe")) {
    # Code to execute if Git is NOT installed
    Write-Host "Git is not installed."

    # Download and install Git
    Write-Host "Downloading Git..."
    $gitInstallerPath = "$env:TEMP\GitInstaller.exe"
    Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.33.0.windows.2/Git-2.33.0.2-64-bit.exe" -OutFile $gitInstallerPath
    Write-Host "Installing Git..."
    Start-Process -FilePath $gitInstallerPath -Args "/VERYSILENT /NORESTART" -Wait
    Remove-Item $gitInstallerPath
} else {
    # Code to execute if Git is already installed
    Write-Host "Git is already installed."
}
