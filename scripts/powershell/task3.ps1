# Task 3: Security Log Investigator
# Counts how many lines contain the word "Error" in a log file

$LogFile = "server.log"

# Check if log file exists
if (-Not (Test-Path -Path $LogFile)) {
    Write-Host "Error: Log file '$LogFile' not found!" -ForegroundColor Red
    exit 1
}

# Count lines containing "Error"
$ErrorLines = Select-String -Path $LogFile -Pattern "Error"
$ErrorCount = $ErrorLines.Count

# Display results
Write-Host "`nSecurity Log Investigation Report" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Log File: $LogFile"
Write-Host "Lines containing 'Error': $ErrorCount" -ForegroundColor Yellow

# Show the actual error lines
if ($ErrorCount -gt 0) {
    Write-Host "`nError lines found:" -ForegroundColor Red
    Write-Host "------------------" -ForegroundColor Red
    $ErrorLines | ForEach-Object {
        Write-Host "Line $($_.LineNumber): $($_.Line)"
    }
}
