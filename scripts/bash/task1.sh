#!/bin/bash

# Task 1: Big File Detector
# Checks if a file exists and if it's larger than 1MB

# Check if filename argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILENAME="$1"
MAX_SIZE=1048576  # 1MB in bytes

# Check if file exists
if [ ! -f "$FILENAME" ]; then
    echo "Error: File '$FILENAME' does not exist."
    exit 1
fi

# Get file size
FILE_SIZE=$(stat -f%z "$FILENAME" 2>/dev/null || stat -c%s "$FILENAME" 2>/dev/null)

# Display file size
echo "File: $FILENAME"
echo "Size: $FILE_SIZE bytes"

# Compare file size with threshold
if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then
    echo "Warning: File is too large"
else
    echo "File size is within limits."
fi
