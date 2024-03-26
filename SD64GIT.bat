@echo off
SET PATH=%PATH%;%~dp0\Tools
set WorkingCopyPath=%~dp0
cls

echo ---------------------------
echo Retrieving GIT Commit Count
echo ---------------------------
for /f "delims=" %%i in ('git rev-list HEAD --count') do set REVISIONNUMBER=%%i

:MENU
cd /d %~dp0
cls

chgcolor 0a
echo 浜様様様様様様様様様様様様様様様様融
echoj $ba
chgcolor 0f
echoj " Super Doom 64 GIT Build Compiler "
chgcolor 0a
chgcolor 0a
echoj $ba $0a
echo 藩様様様様様様様様様様様様様様様様夕

chgcolor 07
echo.
echoj "Current Path Is: "
chgcolor 0b
echo %~dp0
chgcolor 07
echoj "Current GIT Revision: "
chgcolor 0c
echo %REVISIONNUMBER%
echo.
chgcolor 0f
echoj "1. "
chgcolor 0e
echo Build Local Development Version
chgcolor 0f
echoj "2. "
chgcolor 0e
echoj "Build GIT Release "
echo.
chgcolor 0f
echoj "3. "
chgcolor 03
echo Quit
chgcolor 07

echo.
CHOICE /C 1234567 /N /M "Choose Option (Number Keys):"
IF ERRORLEVEL 3 GOTO LEAVE
IF ERRORLEVEL 2 GOTO GITCOREFULL
IF ERRORLEVEL 1 GOTO DEVCORE

:DEVCORE
echo Compiling Super Doom 64 Local Development Build...
del .\builds\SD64-DEV.pk3 /q

cd pk3
7za a -y -tzip -mx=0 -mmt -xr!.GIT -xr!*.dbs -xr!*.tmp ..\builds\SD64-DEV.pk3 .\

pause
goto MENU

:GITCOREFULL
echo Compiling Super Doom 64 GIT Release Rev#: %REVISIONNUMBER% (Full Compression)...
del .\builds\SD64-r%REVISIONNUMBER%.pk3 /q

cd pk3
7za a -y -tzip -mx=9 -mmt -xr!.GIT -xr!*.dbs -xr!*.tmp ..\builds\SD64-r%REVISIONNUMBER%.pk3 .\

pause
goto MENU

:LEAVE
cls
echo.
chgcolor 0a
echo Thanks for trying my batch script! - Jordon Moss (aka. Striker The Hedgefox)
chgcolor 0b
echo Found any bugs? E-Mail me at mossj32@gmail.com
echo or post @ http://shadowmavericks.com/forums/
chgcolor 0e
timeout 5