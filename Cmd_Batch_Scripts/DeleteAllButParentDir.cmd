@echo off
if [%1]==[] goto exception
set DirToClean=%1
set CurrPath=%~dp0
call set DirToClean=%%%CurrPath%%DirToClean%%%
echo %DirToClean%
del /q %DirToClean%\*.*
for /d %i in (%DirToClean%\*.*) do @rmdir /s /q "%i"

:exception
@echo "Exception: %0 - No arguments passed, the script will now exit..."
pause
exit /b 1
