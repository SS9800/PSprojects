$chromeInstallUrl = "https://dl.google.com/chrome/install/GoogleChromeStandaloneEnterprise64.msi"
$chromeInstallerPath = "$env:TEMP\ChromeInstaller.msi"

if (-not (Get-WmiObject -Class Win32_Product -Filter "Name='Google Chrome'")) {
    # Code to execute if Google Chrome is NOT installed
    Write-Host "Google Chrome is not installed."

    # Download and install Google Chrome
    Write-Host "Downloading Google Chrome..."
    Invoke-WebRequest -Uri $chromeInstallUrl -OutFile $chromeInstallerPath
    Write-Host "Installing Google Chrome..."
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $chromeInstallerPath /quiet /norestart" -Wait
    Remove-Item $chromeInstallerPath
} else {
    # Code to execute if Google Chrome is already installed
    Write-Host "Google Chrome is already installed."
}
