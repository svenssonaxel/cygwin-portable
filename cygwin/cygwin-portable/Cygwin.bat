@echo off

rem Go to root directory
%~d0
cd %~dp0
cd ..

rem Remember active codepage
chcp > cygwin-portable\session-chcp

rem Run session initialization script
bin\bash.exe -i /cygwin-portable/session-init

rem Use mintty if it exists, otherwise cmd
if exist bin\mintty.exe goto minttyexists
goto minttydoesntexist

rem Start a shell using mintty
:minttyexists
cmd /c start bin\mintty.exe -
if errorlevel 1 goto helpmintty
goto quit

rem If mintty failed, setup the environment and retry
:helpmintty
echo Something went wrong starting mintty.
echo Trying to setup the environment before starting mintty.
PATH=%cd%\usr\local\bin;%cd%\usr\bin;%PATH%
HOME=/home
cd home
cmd /c start ..\bin\mintty.exe
goto quit

rem If mintty doesn't exist, start a shell using cmd
:minttydoesntexist
echo Mintty isn't installed.
echo Running bash in the command window.
bin\bash.exe --login -i

:quit
