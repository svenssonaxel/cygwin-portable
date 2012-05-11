@echo off
%~d0
cd %~dp0
cd..
mkdir %cd%\Packages
%cd%\portable-cygwin\setup.exe -s ftp://ftp.sunet.se/pub/lang/cygwin/ -s ftp://ftp.cygwinports.org/pub/cygwinports -R %cd% -l %cd%\Packages -n -K %cd%\portable-cygwin\ports.gpg -MP wget,rsync,libiconv,sed
rmdir %cd%\home
