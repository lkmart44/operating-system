#!/bin/bash

# Task 2: Top Memory Hogs
# Lists the top 5 processes consuming the most memory

echo "Top 5 Memory-Consuming Processes"
echo "================================="
printf "%-8s %-30s %10s\n" "PID" "PROCESS NAME" "MEMORY (KB)"
echo "-------------------------------------------------"

# Use ps to get process info, sort by memory usage (descending), take top 5
ps aux --sort=-%mem | awk 'NR>1 {printf "%-8s %-30s %10s\n", $2, substr($11,1,30), $6}' | head -5
