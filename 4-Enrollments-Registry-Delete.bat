
@echo off
chcp 65001
set /p choice="Kayıt defterindeki Enrollments silmek üzeresiniz. Silmek istediğnize emin misiniz ? (Y/N): "
if /i "%choice%"=="Y" (
    REG DELETE "HKLM\SOFTWARE\Microsoft\Enrollments" /f
    echo.
    echo Command successfully executed. Press any button to continue...
    pause
) else (
    echo.
    echo Job cancelled. Press any button to continue...
    pause
)
exit
