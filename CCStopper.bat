@echo off
title CCStopper
mode con: cols=99 lines=35

:: Asks for Administrator Permissions
net session >nul 2>&1
if %errorlevel% neq 0 goto elevate
cd /d "%~dp0\scripts"
goto mainMenu

set "Path=%Path%;%CD%;"

:elevate
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close)
exit

:: Unblock files
for %%a in (*.ps1) do (echo.>%%a:Zone.Identifier)

Powershell -ExecutionPolicy RemoteSigned -File .\Menu.ps1