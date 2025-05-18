
@echo off
chcp 65001
schtasks.exe /run /tn "Microsoft\Windows\Workplace Join\Automatic-Device-Join"
echo.
echo Command successfully executed. Press any button to continue...
pause
exit
