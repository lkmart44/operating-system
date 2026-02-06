#!/bin/bash

# Task 4: The Batch Renamer
# Renames all .txt files in current directory by adding OLD_ prefix

echo "Batch File Renamer"
echo "=================="
echo "Adding 'OLD_' prefix to all .txt files in current directory..."
echo ""

# Counter for renamed files
COUNT=0

# Loop through all .txt files in current directory
for file in *.txt; do
    # Check if any .txt files exist
    if [ ! -e "$file" ]; then
        echo "No .txt files found in current directory."
        exit 0
    fi
    
    # Skip if already has OLD_ prefix
    if [[ "$file" == OLD_* ]]; then
        echo "Skipping '$file' (already has OLD_ prefix)"
        continue
    fi
    
    # Create new filename with OLD_ prefix
    newname="OLD_$file"
    
    # Rename the file
    mv "$file" "$newname"
    echo "Renamed: $file -> $newname"
    ((COUNT++))
done

echo ""
echo "Total files renamed: $COUNT"
