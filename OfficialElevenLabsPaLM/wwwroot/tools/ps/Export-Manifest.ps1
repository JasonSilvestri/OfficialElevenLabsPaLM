
param(
  [Parameter(Mandatory=$true)][string]$SessionPath
)
$proc = Join-Path $SessionPath '01_processed'
$manifests = Join-Path $SessionPath 'manifests'
New-Item -ItemType Directory -Force -Path $manifests | Out-Null
$csvPath = Join-Path $manifests 'manifest.csv'
$jsonPath = Join-Path $manifests 'manifest.json'

$ffprobe = Get-Command ffprobe -ErrorAction SilentlyContinue

$rows = @()
Get-ChildItem -Path $proc -Recurse -File -Include *.wav,*.flac,*.mp3 | ForEach-Object {
  $emotion = Split-Path $_.DirectoryName -Leaf
  $duration = ''
  $samplerate = ''
  if ($ffprobe) {
    try {
      $meta = ffprobe -v quiet -print_format json -show_streams -show_format -- $_.FullName | ConvertFrom-Json
      $duration = [math]::Round([double]$meta.format.duration,2)
      $samplerate = ($meta.streams | Where-Object {$_.codec_type -eq 'audio'} | Select-Object -First 1).sample_rate
    } catch { }
  }
  $rows += [pscustomobject]@{
    File = $_.FullName
    Emotion = $emotion
    Name = $_.Name
    DurationSec = $duration
    SampleRate = $samplerate
    SizeKB = [math]::Round($_.Length/1kb,2)
    Modified = $_.LastWriteTime.ToString('o')
  }
}
$rows | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8
$rows | ConvertTo-Json -Depth 5 | Set-Content -Path $jsonPath -Encoding UTF8
Write-Host "Manifest written:"
Write-Host " - $csvPath"
Write-Host " - $jsonPath"
