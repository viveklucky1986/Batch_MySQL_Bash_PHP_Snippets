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

:: Apply full permissions to any file/folder ::
REM --v2 -----------------------------------------------------------
takeown /r /d y /f %1
icacls %1 /t /grant Everyone:F

REM takeown /r /d y /f will set the owner to the Administrators group recursively.
REM /t makes it recursive
REM /grant Sets the permision to the following user, replaces existing permissions for the specified uesr.
REM :f Grants full controll permission.
REM ----------------------------------------------------------------

REM --v1 -----------------------------------------------------------
REM cacls %1 /t /e /g Everyone:f

REM /t makes it recursive
REM /e Edits the ACL instead of replaceing it
REM /g Grants permissions to the following users
REM :f Grants full controll permission.
REM ----------------------------------------------------------------

