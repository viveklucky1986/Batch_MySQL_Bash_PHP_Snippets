:: Restart Desktop Window Manager(Aero theme) ::
rem Run as 'cmd /c "$(FULL_CURRENT_PATH)"'
rem Run as 'cmd /k "$(FULL_CURRENT_PATH)"'
::goto comment
goto comment1
echo Stopping Aero Service...
net stop uxsms
echo Starting Aero Service...
net start uxsms
pause
:comment1
