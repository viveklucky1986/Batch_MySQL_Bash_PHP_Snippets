@echo off
::taskkill /f /im [Process Executable Name/Image]
set /p ProcessImage=Name of Process Executable:
taskkill /f /im slack.exe
taskkill /f /im %ProcessImage%
pause > nul
exit
