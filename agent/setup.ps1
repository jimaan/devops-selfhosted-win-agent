New-Item "\azp\agent" -ItemType directory -ErrorAction SilentlyContinue | Out-Null
Set-Location agent

Write-Host "1. Downloading and installing Azure Pipelines agent..." -ForegroundColor Cyan

$packageUrl = "https://vstsagentpackage.azureedge.net/agent/${env:AGENT_VERSION}/vsts-agent-win-x64-${env:AGENT_VERSION}.zip"
Write-Host "packageUrl: $packageUrl"

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($packageUrl, "$(Get-Location)\agent.zip")

Expand-Archive -Path "agent.zip" -DestinationPath "\azp\agent"

Write-Host "2. Downloading and installing Custom PreReqs/Tools..." -ForegroundColor Cyan

Set-Location "\azp"
powershell -executionpolicy unrestricted -file "\azp\scripts\setup\setup.ps1"
