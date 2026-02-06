# Task 5: System Health Snapshot
# Generates a system health report with key metrics

Write-Host "`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║           SYSTEM HEALTH SNAPSHOT REPORT                    ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

# 1. Current Date and Time
Write-Host "📅 Current Date and Time:" -ForegroundColor Yellow
Write-Host "   $(Get-Date -Format 'dddd, MMMM dd, yyyy at hh:mm:ss tt')`n"

# 2. Hostname
Write-Host "💻 Hostname:" -ForegroundColor Yellow
Write-Host "   $env:COMPUTERNAME`n"

# 3. Current User
Write-Host "👤 Current User:" -ForegroundColor Yellow
Write-Host "   $env:USERNAME`n"

# 4. Disk Usage for C: drive
Write-Host "💾 Disk Usage (C: Drive):" -ForegroundColor Yellow

$Disk = Get-PSDrive -Name C | Select-Object Used, Free
$TotalGB = [math]::Round(($Disk.Used + $Disk.Free) / 1GB, 2)
$UsedGB = [math]::Round($Disk.Used / 1GB, 2)
$FreeGB = [math]::Round($Disk.Free / 1GB, 2)
$PercentUsed = [math]::Round(($UsedGB / $TotalGB) * 100, 2)

Write-Host "   Total Space: $TotalGB GB"
Write-Host "   Used Space:  $UsedGB GB"
Write-Host "   Free Space:  $FreeGB GB"
Write-Host "   Usage:       $PercentUsed%"

Write-Host "`n════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "Report generated successfully!" -ForegroundColor Green
