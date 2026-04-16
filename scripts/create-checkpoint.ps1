# ARTILORA Checkpoint Creation Script
# Creates a numbered checkpoint of the entire project state

param(
    [Parameter(Mandatory=$true)]
    [string]$Description
)

$ErrorActionPreference = "Stop"

# Get the next checkpoint number
$checkpointDir = ".checkpoints"
if (-not (Test-Path $checkpointDir)) {
    New-Item -ItemType Directory -Path $checkpointDir | Out-Null
}

$existingCheckpoints = Get-ChildItem -Path $checkpointDir -Directory | 
    Where-Object { $_.Name -match '^checkpoint-(\d+)$' } |
    ForEach-Object { [int]$Matches[1] }

$nextNumber = if ($existingCheckpoints) { ($existingCheckpoints | Measure-Object -Maximum).Maximum + 1 } else { 1 }

$checkpointName = "checkpoint-$nextNumber"
$checkpointPath = Join-Path $checkpointDir $checkpointName
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Host "Creating Checkpoint $nextNumber..." -ForegroundColor Cyan
Write-Host "Description: $Description" -ForegroundColor Yellow

# Create checkpoint directory
New-Item -ItemType Directory -Path $checkpointPath | Out-Null

# Copy all important files and directories
$itemsToCopy = @(
    "components",
    "pages",
    "public",
    "assets",
    "composables",
    "layouts",
    "plugins",
    "middleware",
    "app.vue",
    "app.config.ts",
    "nuxt.config.ts",
    "package.json",
    "tailwind.config.js",
    ".kiro"
)

foreach ($item in $itemsToCopy) {
    if (Test-Path $item) {
        Write-Host "  Copying $item..." -ForegroundColor Gray
        if (Test-Path $item -PathType Container) {
            Copy-Item -Path $item -Destination $checkpointPath -Recurse -Force
        } else {
            Copy-Item -Path $item -Destination $checkpointPath -Force
        }
    }
}

# Create checkpoint metadata
$gitCommit = try { git rev-parse HEAD 2>$null } catch { "not-a-git-repo" }
$metadata = @{
    checkpoint_number = $nextNumber
    description = $Description
    timestamp = $timestamp
    created_by = $env:USERNAME
    git_commit = $gitCommit
} | ConvertTo-Json

$metadata | Out-File -FilePath (Join-Path $checkpointPath "checkpoint-info.json") -Encoding UTF8

# Update checkpoint registry
$registryPath = Join-Path $checkpointDir "checkpoint-registry.json"
$registry = if (Test-Path $registryPath) {
    Get-Content $registryPath -Raw | ConvertFrom-Json
} else {
    @{ checkpoints = @() }
}

$registry.checkpoints += @{
    number = $nextNumber
    description = $Description
    timestamp = $timestamp
    path = $checkpointName
}

$registry | ConvertTo-Json -Depth 10 | Out-File -FilePath $registryPath -Encoding UTF8

Write-Host ""
Write-Host "Checkpoint $nextNumber created successfully!" -ForegroundColor Green
Write-Host "Location: $checkpointPath" -ForegroundColor Gray
$restoreCmd = ".\scripts\restore-checkpoint.ps1 -Number $nextNumber"
Write-Host "To restore: $restoreCmd" -ForegroundColor Cyan
