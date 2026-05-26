#!/bin/bash

#thresholds
CPU_THRESHOLD=90
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90

#check CPU usage
for i in $(seq 1 5); do
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        echo " Alert ⚠️   CPU usage is above threshold: $CPU_USAGE%"
    else
        echo "CPU usage is within acceptable limits: $CPU_USAGE%"
fi  
    sleep 5
done