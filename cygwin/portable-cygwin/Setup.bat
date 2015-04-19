@echo off
%~d0
cd %~dp0
cd..
mkdir %cd%\Packages
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
portable-cygwin\wget -Oportable-cygwin\setup-%arch%.exe http://cygwin.com/setup-%arch%.exe
if not exist %cd%\portable-cygwin\setup-%arch%.exe (
  cls
  echo setup-%arch%.exe does not exist in portable-cygwin folder.
  echo Download http://cygwin.com/setup-%arch%.exe and try again.
  pause
  exit )
%cd%\portable-cygwin\setup-%arch%.exe -s ftp://ftp.sunet.se/pub/lang/cygwin -s ftp://ftp.cygwinports.org/pub/cygwinports -R %cd% -l %cd%\Packages -n -K %cd%\portable-cygwin\ports.gpg -MP wget,rsync,libiconv,sed
rmdir %cd%\home
del %cd%\Cygwin.bat
