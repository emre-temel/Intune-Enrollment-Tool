
@echo off
chcp 65001
set /p choice="Are you sure you want to Leave the device from Enrollment? (Y/N): "
if /i "%choice%"=="Y" (
    dsregcmd /leave
    echo.
    echo Command successfully executed. Press any button to continue...
    pause
) else (
    echo.
    echo Job cancelled. Press any button to continue...
    pause
)
exit
