# Records the One-Tap app demo (autoplay mode) into app-demo.mp4
param([int]$Seconds = 21)

$ErrorActionPreference = "Stop"

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win {
  [DllImport("user32.dll")] public static extern bool SetProcessDPIAware();
  [DllImport("user32.dll")] public static extern IntPtr FindWindow(string cls, string title);
  [DllImport("user32.dll")] public static extern bool GetClientRect(IntPtr h, out RECT r);
  [DllImport("user32.dll")] public static extern bool ClientToScreen(IntPtr h, ref POINT p);
  [DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr h, IntPtr after, int x, int y, int cx, int cy, uint flags);
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr h);
  [DllImport("user32.dll")] public static extern int GetSystemMetrics(int i);
  public struct RECT { public int L; public int T; public int R; public int B; }
  public struct POINT { public int X; public int Y; }
}
"@
[Win]::SetProcessDPIAware() | Out-Null
$screenW = [Win]::GetSystemMetrics(0)
$screenH = [Win]::GetSystemMetrics(1)
Write-Output "screen: ${screenW}x${screenH}"

# locate ffmpeg
$ffmpeg = "$env:LOCALAPPDATA\Microsoft\WinGet\Links\ffmpeg.exe"
if (-not (Test-Path $ffmpeg)) {
  $found = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter ffmpeg.exe -ErrorAction SilentlyContinue | Select-Object -First 1
  if ($found) { $ffmpeg = $found.FullName } else { throw "ffmpeg not found" }
}

# demo window geometry: phone is 400x830 (~0.482 ratio); leave margin for bezel glow
$winH = [Math]::Min(1000, $screenH - 80)
$winW = [Math]::Round($winH * 0.52)

$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
Start-Process $edge -ArgumentList "--app=http://localhost:8321/?autoplay=1","--window-size=$winW,$winH","--window-position=40,40"

# wait for the window
$hwnd = [IntPtr]::Zero
$deadline = (Get-Date).AddSeconds(15)
while ((Get-Date) -lt $deadline -and $hwnd -eq [IntPtr]::Zero) {
  $hwnd = [Win]::FindWindow($null, "OneTapDemo")
  Start-Sleep -Milliseconds 250
}
if ($hwnd -eq [IntPtr]::Zero) { throw "demo window never appeared" }

# pin topmost at known position/size, focused
[Win]::SetWindowPos($hwnd, [IntPtr]::new(-1), 40, 40, $winW, $winH, 0x0040) | Out-Null
[Win]::SetForegroundWindow($hwnd) | Out-Null
Start-Sleep -Milliseconds 400

# exact client area in physical screen coords (skips the title bar)
$rect = New-Object Win+RECT
[Win]::GetClientRect($hwnd, [ref]$rect) | Out-Null
$pt = New-Object Win+POINT
[Win]::ClientToScreen($hwnd, [ref]$pt) | Out-Null
$cw = ($rect.R - $rect.L) -band -2   # force even
$ch = ($rect.B - $rect.T) -band -2
Write-Output "capturing client area ${cw}x${ch} at ($($pt.X),$($pt.Y))"

$out = Join-Path $PSScriptRoot "app-demo.mp4"
& $ffmpeg -y -v warning -f gdigrab -framerate 30 -offset_x $pt.X -offset_y $pt.Y -video_size "${cw}x${ch}" -i desktop -t $Seconds `
  -c:v libx264 -pix_fmt yuv420p -crf 18 -preset veryfast $out

# close only the demo window's Edge instance (separate profile = separate processes)
Get-Process msedge -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*onetap-edge-profile*" } | Stop-Process -Force -ErrorAction SilentlyContinue
Get-Process msedge -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowTitle -eq "OneTapDemo" } | Stop-Process -Force -ErrorAction SilentlyContinue
Write-Output "saved: $out"
