@echo off
%~d0
cd %~dp0
cd ..
chcp > portable-cygwin\session-chcp
bin\bash.exe -i /portable-cygwin/session-init
if exist bin\mintty.exe goto minttyexists
goto minttydoesntexist
:minttyexists
cmd /c start bin\mintty.exe -
if errorlevel 1 goto helpmintty
goto quit
:helpmintty
echo Something went wrong starting mintty.
echo Trying to setup the environment before starting mintty.
PATH=%cd%\usr\local\bin;%cd%\usr\bin;%PATH%
HOME=/home
cd home
cmd /c start ..\bin\mintty.exe
goto quit
:minttydoesntexist
echo Mintty isn't installed.
echo Running bash in the command window.
bin\bash.exe --login -i
:quit
