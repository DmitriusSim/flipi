@echo off
timeout /t 1 /nobreak

setlocal enabledelayedexpansion
set /a iterations=66

for /l %%i in (1,1,%iterations%) do (
  taskkill /f /im explorer.exe >nul 2>&1
  timeout /t 0 /nobreak
  start explorer.exe
  timeout /t 3 /nobreak
)
