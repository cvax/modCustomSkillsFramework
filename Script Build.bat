@echo off
call BuildVariables.cmd
if not exist %PACKEDSCRIPTS%\content\scripts mkdir %PACKEDSCRIPTS%\content\scripts

echo Bundling scripts.........
set folder="%PACKEDSCRIPTS%\content\scripts"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
XCOPY "%SCRIPTS%" "%PACKEDSCRIPTS%" /S/Y
echo.
echo.
echo %NAME% generated successfully.
echo.
:choice
set /P c="Install %NAME% scripts to Witcher 3? (Y/N)"
if /I "%c%" EQU "Y" goto :movespot
if /I "%c%" EQU "N" goto :exitspot
goto :choice
:movespot
if not exist %GAMEPATH%\Mods\%NAME% mkdir %GAMEPATH%\Mods\%NAME%
set folder="%GAMEPATH%\Mods\%NAME%\content\scripts"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
XCOPY "%SCRIPTS%" "%GAMEPATH%\Mods\%NAME%" /S/Y
echo.
echo.
echo %NAME% scripts successfully installed to Witcher 3.
echo Remember to use Script Merger if you have other mods installed.
pause 
exit
:exitspot
echo.
echo.
echo %NAME% scripts generated successfully.
pause 
exit