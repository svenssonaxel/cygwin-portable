@echo off

rem Go to root directory
%~d0
cd %~dp0
cd..

rem Create temporary directory for packages
mkdir %cd%\Packages

rem Find out architecture of current machine
cls
set arch=unknown
if x%PROCESSOR_ARCHITECTURE% == xx86 set arch=x86
if x%PROCESSOR_ARCHITECTURE% == xX86 set arch=x86
if x%PROCESSOR_ARCHITECTURE% == xamd64 set arch=x86_64
if x%PROCESSOR_ARCHITECTURE% == xAMD64 set arch=x86_64
if x%PROCESSOR_ARCHITEW6432% == xamd64 set arch=x86_64
if x%PROCESSOR_ARCHITEW6432% == xAMD64 set arch=x86_64

rem Quit if unknown architecture
if %arch% == unknown (
  cls
  echo Unknown architecture. Cannot install.
  pause
  exit
)

rem Find out what architecture was previously chosen
set ac=none
if exist %cd%\portable-cygwin\archchosen-x86_64 (
  set ac=x86_64
)
if exist %cd%\portable-cygwin\archchosen-x86 (
  set ac=x86
)

rem On x86_64, let the user choose architecture if not already chosen
if %arch% == x86_64 (
if %ac% == none (
  cls
  echo This is a 64-bit system. In order to make the installation portable across both
  echo 64-bit and 32-bit systems, you should choose the 32-bit variant.
  echo Press 3 to install the more portable 32-bit cygwin [autoselected in 10 seconds]
  echo Press 6 to install 64-bit cygwin.
  set ac=x86_64
  choice /c 63 /n /t 10 /d 3
  if errorlevel 2 set ac=x86
)
)

rem On x86, refuse to continue if x86_64 was previously chosen
if %arch% == x86 (
if %ac% == x86_64 (
  cls
  echo This system is 32-bit, but the installed cygwin is 64-bit. Cannot continue.
  pause
  exit
)
)

rem Save choice of architecture
echo .> %cd%\portable-cygwin\archchosen-%ac%

rem Download installer if it does not exist
if exist %cd%\portable-cygwin\setup-%ac%.exe (
  echo Found existing installer for %ac%.
) else (
  echo Downloading installer
  wscript portable-cygwin\dl.vbs https://cygwin.com/setup-%ac%.exe portable-cygwin\setup-%ac%.exe
)

rem Refuse to continue without installer
if not exist %cd%\portable-cygwin\setup-%ac%.exe (
  cls
  echo Failed to download http://cygwin.com/setup-%ac%.exe to folder %cd%\portable-cygwin
  echo Try to download it manually, then run this setup again.
  pause
  exit
)

rem Run setup
echo Running installer
%cd%\portable-cygwin\setup-%ac%.exe -R %cd% -l %cd%\Packages -n -BMP wget,rsync,libiconv,sed
pause

rem Delete unneeded files created by installer
rmdir %cd%\home
del %cd%\Cygwin.bat
cls
