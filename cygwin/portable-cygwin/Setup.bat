@echo off
%~d0
cd %~dp0
cd..
mkdir %cd%\Packages
cls
set arch=unknown
if x%PROCESSOR_ARCHITECTURE% == xx86 set arch=x86
if x%PROCESSOR_ARCHITECTURE% == xX86 set arch=x86
if x%PROCESSOR_ARCHITECTURE% == xamd64 set arch=x86_64
if x%PROCESSOR_ARCHITECTURE% == xAMD64 set arch=x86_64
if x%PROCESSOR_ARCHITEW6432% == xamd64 set arch=x86_64
if x%PROCESSOR_ARCHITEW6432% == xAMD64 set arch=x86_64
if x%arch% == xunknown (
  cls
  echo Unknown architecture. Cannot install.
  pause
  exit )
if x%arch% == xx86_64 (
  if exist %cd%\portable-cygwin\setup-x86.exe set arch=x86 )
if x%arch% == xx86_64 (
  cls
  echo This is a 64-bit system. In order to make the installation portable across both
  echo 64-bit and 32-bit systems, you should choose the 32-bit variant.
  echo Press 3 to install the more portable 32-bit cygwin [autoselected in 10 seconds]
  echo Press 6 to install 64-bit cygwin.
  choice /c 63 /n /t 10 /d 3
  if errorlevel 2 set arch=x86
  )
portable-cygwin\wget -Oportable-cygwin\setup-%arch%.exe http://cygwin.com/setup-%arch%.exe
if not exist %cd%\portable-cygwin\setup-%arch%.exe (
  cls
  echo Failed to download http://cygwin.com/setup-%arch%.exe to portable-cygwin folder.
  echo Try to download it manually, then run this setup again.
  pause
  exit )
%cd%\portable-cygwin\setup-%arch%.exe -s ftp://ftp.sunet.se/pub/lang/cygwin -s ftp://ftp.cygwinports.org/pub/cygwinports -R %cd% -l %cd%\Packages -n -K %cd%\portable-cygwin\ports.gpg -BMP wget,rsync,libiconv,sed
pause
rmdir %cd%\home
del %cd%\Cygwin.bat
