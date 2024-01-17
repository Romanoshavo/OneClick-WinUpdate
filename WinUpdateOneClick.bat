@echo off
echo Creating a backup...
wbadmin start backup -backupTarget:C: -include:C:\ -allCritical -quiet

echo Checking for updates...
wuauclt /detectnow
timeout /t 10 /nobreak

echo Installing updates...
powershell -Command "Install-Module PSWindowsUpdate -Force -AllowClobber -Scope CurrentUser; Import-Module PSWindowsUpdate; Get-WUInstall -AcceptAll -Force -AutoReboot"

echo Update process completed. Press any key to exit.
pause >nul
