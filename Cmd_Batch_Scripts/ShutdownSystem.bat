@echo off
:PrintMsg
shutdown /s /f /t 2700
set /p ProcessGoOn="Your computer is about to shutdown in 45 mins do you want to abort (y/n): "
if %ProcessGoOn% equ y (
    shutdown /a
    timeout /t 2700 /nobreak
    goto PrintMsg
)
exit /b