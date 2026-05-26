# Thresholds
$cpu_threshold = 80
$memory_threshold = 80
$disk_threshold = 90

# CPU usage
$cpu = Get-Counter '\Processor(_Total)\% Processor Time'
$cpuUsage = [math]::Round($cpu.CounterSamples.CookedValue)

# Memory usage
$mem = Get-Counter '\Memory\% Committed Bytes In Use'
$memUsage = [math]::Round($mem.CounterSamples.CookedValue)

# Disk usage (C drive)
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$diskUsage = [math]::Round((($disk.Size - $disk.FreeSpace) / $disk.Size * 100))

Write-Output "CPU: $cpuUsage% | Memory: $memUsage% | Disk: $diskUsage%"

# Alerts
if ($cpuUsage -gt $cpu_threshold) {
    Write-Output "⚠️ Alert: CPU usage is above threshold ($cpuUsage%)"
} else {
    Write-Output "✅ CPU usage is within acceptable limits ($cpuUsage%)"
}

if ($memUsage -gt $memory_threshold) {
    Write-Output "⚠️ Alert: Memory usage is above threshold ($memUsage%)"
} else {
    Write-Output "✅ Memory usage is within acceptable limits ($memUsage%)"
}

if ($diskUsage -gt $disk_threshold) {
    Write-Output "⚠️ Alert: Disk usage is above threshold ($diskUsage%)"
} else {
    Write-Output "✅ Disk usage is within acceptable limits ($diskUsage%)"
}
