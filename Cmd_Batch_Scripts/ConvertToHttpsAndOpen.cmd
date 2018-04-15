@echo off
setlocal EnableDelayedExpansion
set /p Url="Enter Url to Convert: "
set HttpsUrl=%Url:http=https%
echo %HttpsUrl%
start firefox %HttpsUrl%
exit /b