@echo off
rem ---------------------------------------------------------------------------
rem  ICO 3D Stereo - setup and launcher for Windows.
rem
rem    setup.bat D:\path\to\your.iso
rem
rem  Tells the game where your own ICO disc image is (PAL, SCES-50760) and
rem  starts it. You can also drop the .iso file onto this script, or put it
rem  beside the script (or in x64\) and just double-click. With no image
rem  found, the game asks for one itself.
rem
rem  The first start checks the image and builds the game's data once; after
rem  that, x64\ico_pc_x64.exe starts the game directly.
rem ---------------------------------------------------------------------------
setlocal EnableExtensions
cd /d "%~dp0"

set "EXE=%~dp0x64\ico_pc_x64.exe"
set "INI=%~dp0x64\ico-pc.ini"

if not exist "%EXE%" (
    echo Cannot find x64\ico_pc_x64.exe beside this file.
    echo Keep the folders from the zip together and try again.
    pause
    exit /b 1
)

rem The disc image: the first argument, else an .iso found near the script.
set "ISO=%~1"
if defined ISO (
    if exist "%~1\" goto fromfolder
    if exist "%~1" goto save
    echo Cannot find the disc image "%~1".
    pause
    exit /b 1
)

for %%F in ("%~dp0Ico*.iso" "%~dp0*.iso" "%~dp0x64\*.iso") do (
    if not defined ISO if exist "%%~fF" set "ISO=%%~fF"
)
if not defined ISO goto askgame
goto save

:fromfolder
set "ISO="
for %%F in ("%~1\*.iso") do if not defined ISO if exist "%%~fF" set "ISO=%%~fF"
if not defined ISO (
    echo No .iso file in "%~1".
    pause
    exit /b 1
)

:save
rem Keep any other lines of ico-pc.ini; replace (or add) the iso= line.
for %%F in ("%ISO%") do set "ISO=%%~fF"
set "TMP=%INI%.tmp"
if exist "%INI%" (
    findstr /V /I /B "iso=" "%INI%" > "%TMP%"
) else (
    type nul > "%TMP%"
)
>>"%TMP%" echo iso=%ISO%
move /Y "%TMP%" "%INI%" >nul
echo Disc image: %ISO%
echo Starting ICO 3D. The first start builds the game's data; this takes a
echo minute or two.
start "" "%EXE%"
exit /b 0

:askgame
echo No .iso found near setup.bat. Starting the game: choose your ICO disc
echo image (PAL, SCES-50760) in the window that opens.
start "" "%EXE%"
exit /b 0
