@echo off
Title Herramienta de Limpieza y Reversión SimuThreat
echo =========================================================
echo [SIMUTHREAT] Limpieza de Consecuencias Iniciada
echo =========================================================

:: 1. Detiene el apagado programado
echo > Deteniendo cualquier apagado programado...
shutdown /a
echo   -> Apagado cancelado (si estaba activo).

:: 2. Cierra la Lupa (Inversion de color)
echo > Cerrando la herramienta de Lupa (magnify)...
taskkill /IM magnify.exe /F 2>nul
echo   -> Inversion de pantalla desactivada.

:: 3. Restaura la distribucion del teclado (Ejemplo: a LCID 1033 - Ingles US, si no se especifica español)
:: NOTA: Se recomienda usar el LCID de su entorno de prueba (Ej. 3082 para Espanol de Espana)
echo > Restaurando la configuracion de teclado (LCID 1033 - US Default)...
powershell -Command "$List = Get-WinUserLanguageList; $DefaultLCID = 1033; $Culture = Get-Culture; $Culture.KeyboardLayoutId = $DefaultLCID; $Culture | Set-Culture; Write-Host '   -> Teclado restaurado (comprobar la distribucion).'"

echo.
echo =========================================================
echo Limpieza completa. El entorno de prueba esta estable.
echo =========================================================

pause
