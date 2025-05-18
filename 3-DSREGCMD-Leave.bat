
@echo off
chcp 65001
set /p choice="Cihazı Leave yapmak istediğinize emin misiniz? (Y/N): "
if /i "%choice%"=="Y" (
    dsregcmd /leave
    echo.
    echo Komut tamamlandı. Devam etmek için bir tuşa basın...
    pause
) else (
    echo.
    echo İşlem iptal edildi. Devam etmek için bir tuşa basın...
    pause
)
exit