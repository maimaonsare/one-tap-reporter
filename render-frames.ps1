# Renders scene1.html into PNG frames via headless Edge, then assembles scene1.mp4
param(
  [double]$Fps = 24,
  [double]$Duration = 15.4,
  [int]$Workers = 6,
  [string]$Page = "scene1.html",
  [string]$OutName = "scene1.mp4",
  [switch]$Resume
)
$ErrorActionPreference = "Stop"
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
# frames dir must have NO spaces in its path — Start-Process splits unquoted args
$frames = "$env:TEMP\scene1frames"
New-Item -ItemType Directory -Force $frames | Out-Null
if (-not $Resume) { Remove-Item "$frames\*.png" -Force -ErrorAction SilentlyContinue }

$total = [Math]::Ceiling($Fps * $Duration)
Write-Output "rendering $total frames at $Fps fps with $Workers workers..."

$i = 0
while ($i -lt $total) {
  $procs = @()
  for ($w = 0; $w -lt $Workers -and $i -lt $total; $w++, $i++) {
    $t = [Math]::Round($i / $Fps, 4)
    $out = "{0}\frame{1:D4}.png" -f $frames, $i
    if ($Resume -and (Test-Path $out)) { $w--; continue }
    $args = @(
      "--headless","--disable-gpu","--window-size=1920,1080",
      "--user-data-dir=$env:TEMP\hfrender$w",
      "--screenshot=`"$out`"",
      "http://localhost:8321/$Page`?freeze=$t"
    )
    $procs += Start-Process $edge -ArgumentList $args -PassThru -WindowStyle Hidden
  }
  $procs | Wait-Process -Timeout 30 -ErrorAction SilentlyContinue
  $procs | Where-Object { -not $_.HasExited } | Stop-Process -Force -ErrorAction SilentlyContinue
  if ($i % 60 -lt $Workers) { Write-Output "  $i / $total" }
}

$missing = $total - (Get-ChildItem "$frames\frame*.png").Count
if ($missing -gt 0) { Write-Output "WARNING: $missing frames missing" } else { Write-Output "all frames rendered" }

$ffmpeg = "$env:LOCALAPPDATA\Microsoft\WinGet\Links\ffmpeg.exe"
if (-not (Test-Path $ffmpeg)) {
  $ffmpeg = (Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter ffmpeg.exe | Select-Object -First 1).FullName
}
$out = Join-Path $PSScriptRoot $OutName
& $ffmpeg -y -v warning -framerate $Fps -i "$frames\frame%04d.png" -c:v libx264 -pix_fmt yuv420p -crf 17 -preset slow $out
Write-Output "saved: $out"
