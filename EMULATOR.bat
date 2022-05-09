@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
SET count=0
FOR /F "tokens=* USEBACKQ" %%F IN (`C:\Users\User\AppData\Local\Android\Sdk\emulator\emulator.exe -list-avds`) DO (
  SET /a count=!count!+1
  SET var!count!=%%F
)
for /l %%i in (1,1,%count%) do echo %%i) !var%%i!
@echo Digit number of virtual machine to run or 'q' to quit:
set /p choice=""
if "%choice%"=="q" goto end
@echo !var%choice%!
@echo Initializing emulator...
C:\Users\User\AppData\Local\Android\Sdk\emulator\emulator.exe -avd !var%choice%!
@echo Emulator launched!
:end
ENDLOCAL