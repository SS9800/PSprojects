﻿
﻿#prompt the user on what machine they would like to connect to
Write-Host -ForegroundColor Yellow 'Please enter the hostname of the machine you would like to connect to.'
$remotehost = read-host
enter-PSSession -computername $remotehost
#once connection has been established, print some basic stats for the machine via another script on the local machine
Invoke-Command -ComputerName $remotehost -FilePath "C:\Users\schofields\Desktop\remotecomputerinfoV3.ps1"



do {
    # Display general information about the remote machine
    Get-Date
    Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object LastBootUpTime

    # Ask the user what information they are looking for on the remote machine
    Write-Host -ForegroundColor Cyan 'What information do you need? Choose from the following:'
    Write-Host '1. Network information'
    Write-Host '2. Current services'
    Write-Host '3. Event logs'

    $userInput = Read-Host

    switch ($userInput) {
        1 {
            # Gather network info for the remote machine and display in list format
            Write-Host -ForegroundColor Cyan 'Gathering Network info'
            Get-NetIPConfiguration -All | Format-List
        }
        2 {
            # Ask the user what services they would like to see
            Write-Host 'What services would you like to see?'
            Write-Host '1. Running services'
            Write-Host '2. Stopped services'
            Write-Host '3. All services'

            $serviceChoice = Read-Host

            # Display running services
            if ($serviceChoice -eq 1) {
                Get-Service | Where-Object {$_.Status -eq "Running"} | Format-List
            }
            # Display stopped services
            elseif ($serviceChoice -eq 2) {
                Get-Service | Where-Object {$_.Status -eq "Stopped"} | Format-List
            }
            # Display all services, running and stopped
            elseif ($serviceChoice -eq 3) {
                Get-Service | Format-List
            }
        }
        3 {
            # Ask the user what event logs they would like to see
            Write-Host -ForegroundColor Cyan 'What event logs would you like to see?'
            Write-Host '1. Application'
            Write-Host '2. Security'
            Write-Host '3. System'

            $logChoice = Read-Host

            # Display application logs within the last 24 hours
            if ($logChoice -eq 1) {
                Write-Host 'Displaying all application logs within the last 24 hours'
                $currentDate = Get-Date
                $startDate = $currentDate.AddHours(-24)
                Get-EventLog Application -After $startDate | Format-List
            }
            # Display security logs within the past 24 hours
            elseif ($logChoice -eq 2) {
                Write-Host 'Displaying all Security logs within the past 24 hours'
                Get-EventLog Security -After (Get-Date).AddHours(-24) | Format-List
            }
            # Add more options for other logs if needed
        }
        default {
            Write-Host 'Invalid option. Please choose a valid option (1, 2, or 3).'
        }
    }

    $response = Read-Host "Return to the original question? (yes/no)"
} while ($response -eq 'yes')