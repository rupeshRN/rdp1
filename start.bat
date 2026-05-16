@echo off
set "NGROK_URL=%~1"
set "USERNAME=%~2"
set "PASSWORD=%~3"

if "%NGROK_URL%"=="" set "NGROK_URL=null"
if "%USERNAME%"=="" set "USERNAME=administrator"
if "%PASSWORD%"=="" set "PASSWORD=OLDUSER#06"

echo Setting up RDP for user: %USERNAME%

:: Check if user is administrator
if /I "%USERNAME%"=="administrator" (
    echo Activating and setting password for administrator...
    net user administrator /active:yes > nul
    net user administrator "%PASSWORD%" > nul
) else (
    echo Creating user %USERNAME%...
    net user "%USERNAME%" "%PASSWORD%" /add > nul
    if errorlevel 1 (
        echo User already exists or failed to create. Updating password...
        net user "%USERNAME%" "%PASSWORD%" > nul
    )
    echo Adding %USERNAME% to administrators group...
    net localgroup administrators "%USERNAME%" /add > nul
)

:: Enable RDP and related services
net config server /srvcomment:"Windows Server RDP" > nul
diskperf -Y > nul
sc config Audiosrv start= auto > nul
sc start audiosrv > nul

echo Successfully installed!
echo Ngrok Tunnel URL: %NGROK_URL%
echo Username: %USERNAME%
echo Password: %PASSWORD%
echo.
echo You can now connect via RDP.
