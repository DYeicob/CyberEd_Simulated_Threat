@echo off
Title SimuThreat Cleanup and Reversion Tool
echo =========================================================
echo [SIMUTHREAT] Consequence Cleanup Initiated
echo =========================================================

:: 1. Stops any scheduled shutdown
echo > Stopping any scheduled shutdown...
shutdown /a
echo    -> Shutdown canceled (if it was active).

:: 2. Closes Magnifier (Color inversion)
echo > Closing the Magnifier tool (magnify)...
taskkill /IM magnify.exe /F 2>nul
echo    -> Screen inversion disabled.

:: 3. Restores the keyboard layout (Example: to LCID 1033 - English US)
:: NOTE: It is recommended to use the LCID of your specific test environment (e.g., 3082 for Spanish - Spain)
echo > Restoring keyboard settings (LCID 1033 - US Default)...
powershell -Command "$List = Get-WinUserLanguageList; $DefaultLCID = 1033; $Culture = Get-Culture; $Culture.KeyboardLayoutId = $DefaultLCID; $Culture | Set-Culture; Write-Host '   -> Keyboard restored (check layout).'"

echo.
echo =========================================================
echo Cleanup complete. The testing environment is stable.
echo =========================================================

pause
