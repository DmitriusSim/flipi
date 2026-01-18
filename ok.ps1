# === SETTINGS ===
$base = Split-Path -Parent $MyInvocation.MyCommand.Path
$duration = 230   # 3 min 50 sec

# === PLAY MP3 (WORKING) ===
$wmp = New-Object -ComObject WMPlayer.OCX
$wmp.settings.volume = 20
$wmp.URL = "$base\bi.mp3"
$wmp.controls.play()

# === START MENU TOGGLE ===
$ws = New-Object -ComObject WScript.Shell
$end = (Get-Date).AddSeconds($duration)

# === IMAGE SPAWN ===
Add-Type -AssemblyName PresentationFramework

$spawn = 0
while ((Get-Date) -lt $end -and $spawn -lt 70) {

    # Start menu
    $ws.SendKeys('{LWIN}')
    Start-Sleep -Seconds 1

    # Spawn flipi.png
    $w = New-Object Windows.Window
    $w.WindowStyle = 'None'
    $w.ResizeMode = 'NoResize'
    $w.Width = 200
    $w.Height = 200
    $w.Left = Get-Random 0 1600
    $w.Top = Get-Random 0 900
    $w.Topmost = $true

    $img = New-Object Windows.Controls.Image
    $img.Source = New-Object Windows.Media.Imaging.BitmapImage([Uri]"$base\flipi.png")
    $w.Content = $img

    $w.Show()
    Start-Sleep -Milliseconds 600
    $w.Close()

    $spawn++
}

# === GSOD ===
Start-Process "$base\gsod.bat"
