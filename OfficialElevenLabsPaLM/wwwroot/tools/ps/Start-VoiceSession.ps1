
param(
  [Parameter(Mandatory=$true)][string]$Root,
  [Parameter(Mandatory=$false)][string]$SessionName = $(Get-Date -Format 'yyyy-MM-dd_HHmmss_ProClone'),
  [string[]]$Emotions = @(
    'Neutral','Warm','Hype','Urgent','Empathy','Deadpan','Whisper','Cinematic','Promo','Edge'
  )
)
$sessionPath = Join-Path $Root $SessionName
$raw = Join-Path $sessionPath '00_raw'
$proc = Join-Path $sessionPath '01_processed'
$manifests = Join-Path $sessionPath 'manifests'

New-Item -ItemType Directory -Force -Path $raw, $proc, $manifests | Out-Null
foreach ($e in $Emotions) {
  New-Item -ItemType Directory -Force -Path (Join-Path $raw $e), (Join-Path $proc $e) | Out-Null
}

$meta = [ordered]@{
  SessionName = $SessionName
  CreatedAt = (Get-Date).ToString('o')
  Emotions = $Emotions
  Structure = @{
    Raw = $raw
    Processed = $proc
    Manifests = $manifests
  }
}
$meta | ConvertTo-Json -Depth 5 | Set-Content (Join-Path $sessionPath 'session.json') -Encoding UTF8
Write-Host "Created session at $sessionPath"
