#!/bin/bash

# Task 3: Security Log Investigator
# Counts how many lines contain the word "Error" in a log file

LOGFILE="server.log"

# Check if log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found!"
    exit 1
fi

# Count lines containing "Error"
ERROR_COUNT=$(grep -c "Error" "$LOGFILE")

# Display results
echo "Security Log Investigation Report"
echo "=================================="
echo "Log File: $LOGFILE"
echo "Lines containing 'Error': $ERROR_COUNT"

# Show the actual error lines
if [ "$ERROR_COUNT" -gt 0 ]; then
    echo ""
    echo "Error lines found:"
    echo "------------------"
    grep -n "Error" "$LOGFILE"
fi
