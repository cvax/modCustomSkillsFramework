@echo off
call BuildVariables.cmd
if not exist %PACKED% mkdir %PACKED%

echo Encoding localization w3strings.........

cd /d "%W3STRINGSENCODER%"
call w3strings --encode %STRINGS%\locale.en.csv --id-space %W3STRINGSIDSPACE%

echo Removing debug Witcher Script files.........
del %STRINGS%\locale.en.csv.w3strings.ws

echo Renaming to proper language names...........
ren %STRINGS%\locale.en.csv.w3strings en.w3strings

echo Generating other languages from English.....
copy %STRINGS%\en.w3strings %PACKED%\ar.w3strings
copy %STRINGS%\en.w3strings %PACKED%\br.w3strings
copy %STRINGS%\en.w3strings %PACKED%\cz.w3strings
copy %STRINGS%\en.w3strings %PACKED%\de.w3strings
copy %STRINGS%\en.w3strings %PACKED%\en.w3strings
copy %STRINGS%\en.w3strings %PACKED%\es.w3strings
copy %STRINGS%\en.w3strings %PACKED%\esmx.w3strings
copy %STRINGS%\en.w3strings %PACKED%\fr.w3strings
copy %STRINGS%\en.w3strings %PACKED%\hu.w3strings
copy %STRINGS%\en.w3strings %PACKED%\it.w3strings
copy %STRINGS%\en.w3strings %PACKED%\jp.w3strings
copy %STRINGS%\en.w3strings %PACKED%\kr.w3strings
copy %STRINGS%\en.w3strings %PACKED%\pl.w3strings
copy %STRINGS%\en.w3strings %PACKED%\ru.w3strings
copy %STRINGS%\en.w3strings %PACKED%\zh.w3strings


echo.
echo Success. W3Strings packaged.



echo.
echo.
:choice
set /P c="Install %NAME% W3strings to Witcher 3? (Y/N)"
if /I "%c%" EQU "Y" goto :movespot
if /I "%c%" EQU "N" goto :exitspot
goto :choice
:movespot
if not exist %GAMEPATH%\Mods\%NAME%\content mkdir %GAMEPATH%\Mods\%NAME%\content
XCOPY "%PACKED%\*.w3strings" "%GAMEPATH%\Mods\%NAME%\content" /S/Y
echo.
echo.
echo %NAME% W3strings successfully installed to Witcher 3.
pause 
exit
:exitspot
echo.
echo.
echo %NAME% W3strings generated successfully.
pause 
exit