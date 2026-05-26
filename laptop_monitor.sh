cpu_thresold=80
memory_threshold=80
disk_threshold=90

#check CPU usage
# CPU usage
$cpu = Get-Counter '\Processor(_Total)\% Processor Time'
$cpuUsage = [math]::Round($cpu.CounterSamples.CookedValue)

# Memory usage
$mem = Get-Counter '\Memory\% Committed Bytes In Use'
$memUsage = [math]::Round($mem.CounterSamples.CookedValue)

# Disk usage (C drive)
$disk = Get-PSDrive C
$diskUsage = [math]::Round((($disk.Used / $disk.Size) * 100))

# Write-Output "CPU: $cpuUsage% | Memory: $memUsage% | Disk: $diskUsage%"

echo "CPU usage: $cpuUsage% | Memory usage: $memUsage% | Disk usage: $diskUsage%" 

if  [ "$cpuUsage" -gt "$cpu_thresold" ]; then
    echo "Alert ⚠️   CPU usage is above threshold: $cpuUsage%"
else
    echo "CPU usage is within acceptable limits: $cpuUsage%"
fi

if [ "$memUsage" -ge "$memory_threshold" ]; then
    echo "Alert ⚠️   Memory usage is above threshold: $memUsage%"
else
    echo "Memory usage is within acceptable limits: $memUsage%"
fi
 
if [ "$diskUsage" -ge "$disk_threshold" ]; then
    echo "Alert ⚠️   Disk usage is above threshold: $diskUsage%"
else
    echo "Disk usage is within acceptable limits: $diskUsage%"
fi
