@echo off
chcp 65001 >nul

:: Date and Hour Information
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set gun=%%a
    set ay=%%b
    set yil=%%c
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set saat=%%a
    set dakika=%%b
)

set saat=%saat::=%
set dosyaadi=gpresult_%yil%-%ay%-%gun%_%saat%-%dakika%.html

set klasor=gpresult
if not exist "%klasor%" mkdir "%klasor%"

gpresult /h "%klasor%\%dosyaadi%" /scope:computer
start "" "%klasor%\%dosyaadi%"

echo.
echo Command successfully executed: %klasor%\%dosyaadi%
pause
exit
