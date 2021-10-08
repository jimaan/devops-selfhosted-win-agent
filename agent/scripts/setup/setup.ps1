New-Item "prereq" -ItemType directory | Out-Null
Set-Location prereq

$scriptUrl = ""
if($scriptUrl){
  Write-Host "scriptUrl: $scriptUrl"
  $wc = New-Object System.Net.WebClient
  $script = $wc.DownloadString($scriptUrl)
  if($script) {
    Write-Host "ScriptStart: `r`n$script`r`n:ScriptEnd"
    $script | Invoke-Expression
  }
}
