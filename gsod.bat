@echo off
title GSOD - Green Screen of Death
color 02
cls
mode con: cols=80 lines=25

setlocal enabledelayedexpansion
set psfile=%TEMP%\gsod_effect.ps1

echo Add-Type -AssemblyName PresentationFramework > "%psfile%"
echo Add-Type -AssemblyName System.Windows.Forms >> "%psfile%"
echo $w = New-Object Windows.Window >> "%psfile%"
echo $w.WindowStyle = 'None' >> "%psfile%"
echo $w.WindowState = 'Maximized' >> "%psfile%"
echo $w.Topmost = $true >> "%psfile%"
echo $img = New-Object Windows.Controls.Image >> "%psfile%"
echo $img.Source = New-Object Windows.Media.Imaging.BitmapImage([Uri]'%~dp0image copy.png') >> "%psfile%"
echo $img.Stretch = 'UniformToFill' >> "%psfile%"
echo $w.Content = $img >> "%psfile%"
echo $w.ShowDialog() >> "%psfile%"

powershell -ExecutionPolicy Bypass -NoProfile -File "%psfile%"
del /q "%psfile%" 2>nul

pause
