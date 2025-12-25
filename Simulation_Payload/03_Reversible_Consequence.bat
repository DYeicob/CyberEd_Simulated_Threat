@echo off
Title 💀 CONSEQUENCE - Remote Actions Initiated 💀
echo =========================================================
echo  The unlock time has expired.
echo  A simulated security consequence has been activated.
echo =========================================================
echo.

:: 1. LOLBAS Consequence - Screen Color Inversion
echo [Simulated LOLBAS] -> Using 'magnify' for Screen Inversion...
start "" "magnify" -n -inv
echo.

:: 2. Consequence: Keyboard Layout Change (Simplified Chinese LCID 2052)
echo [Configuration Modification] -> Changing keyboard layout to Chinese...
powershell -Command "Add-Type -AssemblyName System.Runtime; $ChineseLCID = 2052; $List = Get-WinUserLanguageList; if (-not ($List | Where-Object { $_.LanguageTag -eq 'zh-CN' })) { $List.Add('zh-CN'); Set-WinUserLanguageList $List -Force }; $Culture = Get-Culture; $Culture.KeyboardLayoutId = $ChineseLCID; $Culture | Set-Culture"
echo    -> Keyboard changed to 'zh-CN'.

:: 3. Fake Scheduled Shutdown (Simulated Persistence)
echo [Simulated Persistence] -> An Emergency Shutdown has been scheduled for 60 seconds.
shutdown /s /t 60
echo.

echo =========================================================
echo  REMEDIATION INSTRUCTIONS:
echo  1. Open CMD and run: shutdown /a
echo  2. Use Cleanup_Tool.bat for the rest of the cleanup.
echo =========================================================

pause > nul
exit
