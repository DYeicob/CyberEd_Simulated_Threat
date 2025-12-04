@echo off
Title Informe Urgente - Ejecutando Componente...
echo Iniciando proceso de ejecucion simulada.
echo Por favor, espere...

:: Ejecuta el script de PowerShell con bypass para evitar errores de politica de ejecucion en la VM
powershell -ExecutionPolicy Bypass -File "02_Lock_Simulator.ps1"

echo.
echo Ejecucion simulada finalizada.
pause
