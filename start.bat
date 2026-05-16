@echo off
set "NGROK_URL=%~1"
set "USERNAME=%~2"
set "PASSWORD=%~3"

if "%NGROK_URL%"=="" set "NGROK_URL=null"
if "%USERNAME%"=="" set "USERNAME=runneradmin"
if "%PASSWORD%"=="" set "PASSWORD=RDPPassword123!"

echo Setting up RDP for user: %USERNAME%

:: Add user and set as administrator
net user "%USERNAME%" "%PASSWORD%" /add > nul
net localgroup administrators "%USERNAME%" /add > nul

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
