@echo off
echo Monitoring RDP Session...
:check
tasklist | find /i "ngrok.exe" >Nul || (
    echo Ngrok is not running. Checking again in 30 seconds...
)
ping 127.0.0.1 -n 31 > nul
goto check
