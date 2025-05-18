
@echo off
chcp 65001
set /p choice="You are about to delete Enrollments from the registry. Are you sure you want to delete? (Y/N): "
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
