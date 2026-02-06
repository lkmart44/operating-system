#!/bin/bash

# Task 5: System Health Snapshot
# Generates a system health report with key metrics

echo "╔════════════════════════════════════════════════════════════╗"
echo "║           SYSTEM HEALTH SNAPSHOT REPORT                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# 1. Current Date and Time
echo "📅 Current Date and Time:"
echo "   $(date '+%A, %B %d, %Y at %I:%M:%S %p %Z')"
echo ""

# 2. Hostname
echo "💻 Hostname:"
echo "   $(hostname)"
echo ""

# 3. Current User
echo "👤 Current User:"
echo "   $(whoami)"
echo ""

# 4. Disk Usage for root filesystem
echo "💾 Disk Usage (Root Filesystem /):"
df -h / | awk 'NR==1 {print "   " $0} NR==2 {
    printf "   %-15s %8s %8s %8s %5s %s\n", $1, $2, $3, $4, $5, $6
    printf "\n   Total Space: %s\n", $2
    printf "   Used Space:  %s\n", $3
    printf "   Free Space:  %s\n", $4
    printf "   Usage:       %s\n", $5
}'

echo ""
echo "════════════════════════════════════════════════════════════"
echo "Report generated successfully!"
