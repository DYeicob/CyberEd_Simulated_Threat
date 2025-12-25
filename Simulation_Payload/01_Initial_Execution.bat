@echo off
Title Urgent Report - Executing Component...
echo Initiating simulated execution process.
echo Please wait...

:: Executes the PowerShell script with bypass to avoid execution policy errors within the VM
powershell -ExecutionPolicy Bypass -File "02_Lock_Simulator.ps1"

echo.
echo Simulated execution finalized.
pause
