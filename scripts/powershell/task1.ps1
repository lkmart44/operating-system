# Task 1: Big File Detector
# Checks if a file exists and if it's larger than 1MB

param(
    [Parameter(Mandatory=$true)]
    [string]$Filename
)

$MaxSize = 1048576  # 1MB in bytes

# Check if file exists
if (-Not (Test-Path -Path $Filename -PathType Leaf)) {
    Write-Host "Error: File '$Filename' does not exist." -ForegroundColor Red
    exit 1
}

# Get file size
$FileInfo = Get-Item -Path $Filename
$FileSize = $FileInfo.Length

# Display file information
Write-Host "File: $Filename" -ForegroundColor Cyan
Write-Host "Size: $FileSize bytes" -ForegroundColor Cyan

# Compare file size with threshold
if ($FileSize -gt $MaxSize) {
    Write-Host "Warning: File is too large" -ForegroundColor Yellow
} else {
    Write-Host "File size is within limits." -ForegroundColor Green
}
