
param(
  [Parameter(Mandatory=$true)][string]$SessionPath,
  [ValidateSet('wav','flac','mp3')][string]$Format='wav',
  [switch]$DoLoudnorm = $true
)
$ffmpeg = Get-Command ffmpeg -ErrorAction SilentlyContinue
if (-not $ffmpeg) {
  Write-Warning "ffmpeg not found on PATH. Skipping normalization."
  return
}
$raw = Join-Path $SessionPath '00_raw'
$proc = Join-Path $SessionPath '01_processed'
$filters = @()
if ($DoLoudnorm) { $filters += 'loudnorm=I=-16:TP=-1.5:LRA=11' }
$filterArg = $filters -join ','
Get-ChildItem -Path $raw -Recurse -File -Include *.wav,*.mp3,*.m4a | ForEach-Object {
  $emotion = Split-Path $_.DirectoryName -Leaf
  $outDir = Join-Path $proc $emotion
  $base = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
  $outPath = Join-Path $outDir ("{0}_norm.{1}" -f $base,$Format)
  $args = @('-y','-i', $_.FullName, '-ac','1','-ar','44100')
  if ($Format -eq 'wav') { $args += @('-sample_fmt','s16') }
  if ($filterArg) { $args += @('-af', $filterArg) }
  $args += $outPath
  & ffmpeg @args | Out-Null
  Write-Host "Normalized -> $outPath"
}
