@echo off
start explorer "%APPDATA%\Sublime Text 3\Packages"
start explorer "%LOCALAPPDATA%\Sublime Text 3\Cache"
start "" "%APPDATA%\Sublime Text 3\Packages"
start "" "%LOCALAPPDATA%\Sublime Text 3\Cache"
cmd /c start ..
exit /b 1
