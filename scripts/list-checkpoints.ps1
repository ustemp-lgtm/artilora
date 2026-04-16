# ARTILORA Checkpoint List Script
# Lists all available checkpoints

$ErrorActionPreference = "Stop"

$checkpointDir = ".checkpoints"
$registryPath = Join-Path $checkpointDir "checkpoint-registry.json"

if (-not (Test-Path $registryPath)) {
    Write-Host "No checkpoints found." -ForegroundColor Yellow
    Write-Host "Create one with: .\scripts\create-checkpoint.ps1 -Description 'Your description'" -ForegroundColor Cyan
    exit 0
}

$registry = Get-Content $registryPath -Raw | ConvertFrom-Json

Write-Host "`n=== ARTILORA PROJECT CHECKPOINTS ===" -ForegroundColor Cyan
Write-Host ""

foreach ($checkpoint in $registry.checkpoints | Sort-Object number) {
    Write-Host "Checkpoint $($checkpoint.number)" -ForegroundColor Green
    Write-Host "  Description: $($checkpoint.description)" -ForegroundColor White
    Write-Host "  Created: $($checkpoint.timestamp)" -ForegroundColor Gray
    Write-Host "  Restore: .\scripts\restore-checkpoint.ps1 -Number $($checkpoint.number)" -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "Total checkpoints: $($registry.checkpoints.Count)" -ForegroundColor Cyan
