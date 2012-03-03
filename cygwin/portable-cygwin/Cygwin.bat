%~d0
cd %~dp0
cd ..
SET PATH=%cd%\bin;%PATH%
chcp > portable-cygwin\session-chcp
bin\bash.exe /portable-cygwin/session-init
bin\bash.exe /portable-cygwin/session-start
