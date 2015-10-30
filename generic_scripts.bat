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

:: Create Magento Dir-tree through batch file ::
REM Script to create multiple directory structure for Magento Modules
rem @echo off
echo %AppData%
SETLOCAL EnableDelayedExpansion
SETLOCAL EnableExtensions

SET /P packageName=Package Name ?:
SET /P moduleName=Module Name ?:

SET "TAB=	"
SET moduleApp="Magento Module\app"
SET moduleSkin="Magento Module\skin"
SET moduleJs="Magento Module\js"
SET moduleLib="Magento Module\lib"
SET moduleCore="%moduleApp%\code\local"

md %moduleApp%/code/local
md "%moduleCore%/%packageName%/%moduleName%"
md %moduleApp%/etc/modules
md %moduleApp%/design/adminhtml/default/default/layout
md %moduleApp%/design/frontend/base/default/layout

pushd %moduleApp%/etc/modules/
(
echo ^<?xml version="1.0" encoding="UTF-8"?^>
echo ^<config^>
	echo %tab%^<modules^>
		echo %tab%%tab%^<%packageName%_%moduleName%^>
			echo %tab%%tab%%tab%^<active^>true^</active^>
			echo %tab%%tab%%tab%^<codePool^>local^</codePool^>
		echo %tab%%tab%^</%packageName%_%moduleName%^>
	echo %tab%^</modules^>
echo ^</config^>
) > "%packageName%_%moduleName%.xml"

pause
