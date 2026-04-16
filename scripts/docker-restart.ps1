# Restart Docker containers without rebuilding
Import-Module Posh-SSH -ErrorAction Stop

$cred = New-Object System.Management.Automation.PSCredential('frank', (ConvertTo-SecureString 'VMware1!' -AsPlainText -Force))
$session = New-SSHSession -ComputerName '192.168.10.66' -Credential $cred -AcceptKey -Force

Write-Host "Restarting containers..." -ForegroundColor Yellow
$r = Invoke-SSHCommand -SessionId $session.SessionId -Command 'cd /mnt/website && docker compose restart' -TimeOut 60
Write-Host $r.Output

Write-Host "`nContainer Status:" -ForegroundColor Cyan
$r = Invoke-SSHCommand -SessionId $session.SessionId -Command 'cd /mnt/website && docker compose ps' -TimeOut 30
Write-Host $r.Output

Remove-SSHSession -SessionId $session.SessionId | Out-Null
Write-Host "`nDone! Website: http://192.168.10.66:3009" -ForegroundColor Green
