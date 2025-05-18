
@echo off
chcp 65001
schtasks.exe /run /tn "Microsoft\Windows\Workplace Join\Automatic-Device-Join"
echo.
echo Komut tamamlandı. Devam etmek için bir tuşa basın...
pause
exit