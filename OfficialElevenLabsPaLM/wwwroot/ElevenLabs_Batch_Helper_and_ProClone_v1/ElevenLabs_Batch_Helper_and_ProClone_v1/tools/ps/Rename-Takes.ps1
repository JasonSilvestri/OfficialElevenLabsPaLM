
param(
  [Parameter(Mandatory=$true)][string]$SessionPath,
  [Parameter(Mandatory=$true)][string]$VoiceName,
  [string]$DateTag = (Get-Date -Format 'yyyyMMdd')
)
$raw = Join-Path $SessionPath '00_raw'
if (-not (Test-Path $raw)) { throw "Raw folder not found: $raw" }

$takeMap = @{} # per-emotion counter
Get-ChildItem -Path $raw -Recurse -File -Include *.wav,*.mp3,*.m4a | ForEach-Object {
  $emotion = Split-Path $_.DirectoryName -Leaf
  if (-not $takeMap.ContainsKey($emotion)) { $takeMap[$emotion] = 0 }
  $takeMap[$emotion]++
  $take = '{0:d2}' -f $takeMap[$emotion]
  $ext = $_.Extension.ToLower()
  $newName = "{0}_{1}_{2}_t{3}{4}" -f $VoiceName,$emotion,$DateTag,$take,$ext
  Rename-Item -Path $_.FullName -NewName $newName
  Write-Host "Renamed -> $newName"
}
