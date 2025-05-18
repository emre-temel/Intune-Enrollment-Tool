
@echo off
chcp 65001
set /p choice="Kayıt defterindeki Enrollments silmek üzeresiniz. Silmek istediğnize emin misiniz ? (Y/N): "
if /i "%choice%"=="Y" (
    REG DELETE "HKLM\SOFTWARE\Microsoft\Enrollments" /f
    echo.
    echo Komut tamamlandı. Devam etmek için bir tuşa basın...
    pause
) else (
    echo.
    echo İşlem iptal edildi. Devam etmek için bir tuşa basın...
    pause
)
exit