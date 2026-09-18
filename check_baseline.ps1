# check_baseline.ps1
# Quick Windows security baseline check for the SME Risk Assessment project.
# Checks: firewall status, local password policy, and pending Windows updates.
# Run as Administrator.

Write-Host "=== Windows Security Baseline Check ===" -ForegroundColor Cyan

# 1. Firewall status
Write-Host "`n[1] Firewall Status" -ForegroundColor Yellow
Get-NetFirewallProfile | Select-Object Name, Enabled | Format-Table -AutoSize

# 2. Local password policy
Write-Host "[2] Local Password Policy" -ForegroundColor Yellow
net accounts | Select-String "Minimum password length", "Maximum password age", "Lockout threshold"

# 3. Pending Windows updates
Write-Host "`n[3] Pending Windows Updates" -ForegroundColor Yellow
try {
    $session = New-Object -ComObject Microsoft.Update.Session
    $searcher = $session.CreateUpdateSearcher()
    $result = $searcher.Search("IsInstalled=0")
    if ($result.Updates.Count -eq 0) {
        Write-Host "No pending updates found." -ForegroundColor Green
    } else {
        Write-Host "$($result.Updates.Count) update(s) pending:" -ForegroundColor Red
        foreach ($u in $result.Updates) { Write-Host " - $($u.Title)" }
    }
} catch {
    Write-Host "Could not query Windows Update (requires elevated session)." -ForegroundColor Red
}

Write-Host "`n=== Check complete ===" -ForegroundColor Cyan
