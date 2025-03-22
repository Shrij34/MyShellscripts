#!/bin/bash

##### Run : Chmod +x system_health.sh #### Execute ./system_health.sh

# Check if the script is running on Windows
if [[ "$OS" == "Windows_NT" ]]; then
  echo "This script is designed to run on Linux systems only. Exiting."
  exit 1
fi

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
