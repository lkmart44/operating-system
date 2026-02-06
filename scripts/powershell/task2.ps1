# Task 2: Top Memory Hogs
# Lists the top 5 processes consuming the most memory

Write-Host "`nTop 5 Memory-Consuming Processes" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan

# Get all processes, sort by WorkingSet (memory), and select top 5
Get-Process | 
    Sort-Object -Property WorkingSet -Descending | 
    Select-Object -First 5 -Property Id, ProcessName, @{
        Name='Memory (MB)'; 
        Expression={[math]::Round($_.WorkingSet / 1MB, 2)}
    } | 
    Format-Table -AutoSize

Write-Host "Note: Memory shown in megabytes (MB)" -ForegroundColor Gray
