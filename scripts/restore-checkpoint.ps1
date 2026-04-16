# ARTILORA Checkpoint Restoration Script
# Restores the project to a specific checkpoint state

param(
    [Parameter(Mandatory=$true)]
    [int]$Number
)

$ErrorActionPreference = "Stop"

$checkpointDir = ".checkpoints"
$checkpointName = "checkpoint-$Number"
$checkpointPath = Join-Path $checkpointDir $checkpointName

# Verify checkpoint exists
if (-not (Test-Path $checkpointPath)) {
    Write-Host "✗ Checkpoint $Number not found!" -ForegroundColor Red
    Write-Host "  Available checkpoints:" -ForegroundColor Yellow
    .\scripts\list-checkpoints.ps1
    exit 1
}

# Load checkpoint info
$infoPath = Join-Path $checkpointPath "checkpoint-info.json"
$info = Get-Content $infoPath -Raw | ConvertFrom-Json

Write-Host "Restoring Checkpoint $Number..." -ForegroundColor Cyan
Write-Host "Description: $($info.description)" -ForegroundColor Yellow
Write-Host "Created: $($info.timestamp)" -ForegroundColor Gray
Write-Host ""

# Confirm restoration
$confirm = Read-Host "This will overwrite current files. Continue? (yes/no)"
if ($confirm -ne "yes") {
    Write-Host "Restoration cancelled." -ForegroundColor Yellow
    exit 0
}

# Create backup of current state before restoring
Write-Host "`nCreating backup of current state..." -ForegroundColor Cyan
.\scripts\create-checkpoint.ps1 -Description "Auto-backup before restoring checkpoint $Number"

# Restore files
$itemsToRestore = Get-ChildItem -Path $checkpointPath -Exclude "checkpoint-info.json"

foreach ($item in $itemsToRestore) {
    $targetPath = $item.Name
    Write-Host "  Restoring $targetPath..." -ForegroundColor Gray
    
    # Remove existing item if it exists
    if (Test-Path $targetPath) {
        Remove-Item -Path $targetPath -Recurse -Force
    }
    
    # Copy from checkpoint
    Copy-Item -Path $item.FullName -Destination "." -Recurse -Force
}

Write-Host "`n✓ Checkpoint $Number restored successfully!" -ForegroundColor Green
Write-Host "  Remember to restart Docker: docker restart website-nuxt-1" -ForegroundColor Cyan
Write-Host "  And clear browser cache (Ctrl+Shift+Delete)" -ForegroundColor Cyan
