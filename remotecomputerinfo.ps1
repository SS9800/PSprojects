#prompt the user on what machine they would like to connect to
Write-Host -ForegroundColor Yellow 'Please enter the hostname of the machine you would like to connect to.'
$remotehost = read-host
enter-PSSession -computername $remotehost
#once connection has been established, print some basic stats for the machine via another script on the local machine
Invoke-Command -ComputerName $remotehost -FilePath "C:\Users\schofields\Desktop\remotecomputerinfoV3.ps1"
