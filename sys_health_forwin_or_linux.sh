#!/bin/bash

##### Run : Chmod +x system_health.sh #### Execute ./system_health.sh

echo "Please select the operating system:"
echo "1) Linux"
echo "2) Windows"
read -p "Enter your choice (1 or 2): " os_choice

if [[ $os_choice -eq 1 ]]; then
  echo "Running on Linux"

  echo "Hostname and IP : $(hostname) $(hostname -I)"

  echo "Uptime : $(uptime -p)"

  echo "CPU Usage top 5 processes:" 
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

  echo "Memory usage:"
  free -h

  echo "Disk space free:"
  df -h

  echo "Network Information"
  ip addr show | grep "inet "

  echo "Open ports (listening services)"
  ss -tuln | grep LISTEN

  echo "Running services"
  service --status-all | grep +

elif [[ $os_choice -eq 2 ]]; then
  echo "Running on Windows"
  
  echo "Hostname and IP:"
  hostname
  ipconfig | findstr /R /C:"IPv4 Address"

  echo "Uptime:"
  systeminfo | findstr /C:"System Boot Time"

  echo "CPU Usage top 5 processes:"
  wmic path win32_perfformatteddata_perfproc_process get idprocess,percentprocessortime | sort /R /+1

  echo "Memory usage:"
  wmic os get FreePhysicalMemory,TotalVisibleMemorySize

  echo "Disk space free:"
  wmic logicaldisk get size,freespace,caption

  echo "Network Information:"
  ipconfig /all

  echo "Open ports (listening services):"
  netstat -an | findstr /R /C:"LISTEN"

  echo "Running services:"
  net start
else
  echo "Invalid choice. Exiting."
  exit 1
fi
