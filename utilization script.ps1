    Write-Host 'Gathering system Diagnostics....'
    Get-Date | Write-Output
    
   while ($true){  # Gather CPU Util percentage
    $cpuload = Get-WmiObject win32_processor | Select-Object -ExpandProperty loadpercentage 
    Write-Output "CPU Utilization percentage: $($cpuload)"
    
    # Get RAM Usage
    $memory = Get-CimInstance win32_operatingsystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
    $usedmemory = $memory.totalvisiblememorysize - $memory.freephysicalmemory
    
    # Convert output from bytes to Gigabytes
    $usedmemorypercentage = [math]::Round(($usedmemory / $memory.TotalVisibleMemorySize) * 100, 2)
    Write-Output "RAM utilization percentage: $($usedmemorypercentage)"
    
    # Get Hard drive information, convert to GB
    $HDutil = Get-PSDrive -PSProvider FileSystem -Name 'C'
    $usedspaceGB = [math]::Round(($HDutil.used / 1GB), 2)
    $freespaceGB = [math]::Round(($HDutil.Free / 1GB), 2)
    Write-Output "Hard Disk Usage: $($usedspaceGB) GB used, $($freespaceGB) GB remaining on Drive $(Get-PSDrive -Name 'C')"
    
    # Get GPU temperature information
    $gpuTemperature = Get-CimInstance -Namespace root/cimv2 -ClassName Win32_TemperatureProbe | Where-Object { $_.Description -like '*GPU*' }
    
    # Check if GPU temperature information is available
    if ($gpuTemperature) {
        # Display GPU temperature
        Write-Host "GPU Temperature: $($gpuTemperature.CurrentReading) degrees Celsius"
    } else {
        Write-Host "Unable to retrieve GPU temperature information."
    }
    
    # Sleep for a specified interval (e.g., 5 seconds) before gathering diagnostics again
    Start-Sleep -Seconds 5
}