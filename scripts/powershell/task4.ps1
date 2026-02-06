# Task 4: The Batch Renamer
# Renames all .txt files in current directory by adding OLD_ prefix

Write-Host "`nBatch File Renamer" -ForegroundColor Cyan
Write-Host "==================" -ForegroundColor Cyan
Write-Host "Adding 'OLD_' prefix to all .txt files in current directory...`n"

# Counter for renamed files
$Count = 0

# Get all .txt files in current directory
$TxtFiles = Get-ChildItem -Path . -Filter "*.txt" -File

if ($TxtFiles.Count -eq 0) {
    Write-Host "No .txt files found in current directory." -ForegroundColor Yellow
    exit 0
}

foreach ($file in $TxtFiles) {
    # Skip if already has OLD_ prefix
    if ($file.Name -like "OLD_*") {
        Write-Host "Skipping '$($file.Name)' (already has OLD_ prefix)" -ForegroundColor Gray
        continue
    }
    
    # Create new filename with OLD_ prefix
    $NewName = "OLD_" + $file.Name
    $NewPath = Join-Path -Path $file.DirectoryName -ChildPath $NewName
    
    # Rename the file
    Rename-Item -Path $file.FullName -NewName $NewName
    Write-Host "Renamed: $($file.Name) -> $NewName" -ForegroundColor Green
    $Count++
}

Write-Host "`nTotal files renamed: $Count" -ForegroundColor Cyan
