@echo off
chcp 65001 >nul
title portMrker
cd /d "%~dp0"
set PORT=8080

rem Find Python (installed on this PC)
set PY=python
where python >nul 2>nul || set PY="%LOCALAPPDATA%\Programs\Python\Python312\python.exe"

echo ================================================
echo   portMrker is running
echo.
echo   On this computer:  http://localhost:%PORT%/
echo.
echo   On your phone (same Wi-Fi), open one of these:
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do for /f "tokens=*" %%b in ("%%a") do echo      http://%%b:%PORT%/
echo.
echo   Close this window to stop the app.
echo ================================================
echo.

start "" "http://localhost:%PORT%/"
%PY% -m http.server %PORT% --bind 0.0.0.0
pause
