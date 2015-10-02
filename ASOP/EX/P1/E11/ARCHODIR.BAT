@ECHO OFF
rem Archivo: ARCHODIR.BAT
rem Autor: Alomsimoy

IF "%1"=="" goto help
if "%0"=="archodir/?" goto help
IF "%1"=="/?" goto help

:loop
if "%1" == "" goto end
DIR "%1" >NUL 2>&1
IF ERRORLEVEL 1 (echo %1 es un directorio)
DIR "%1" /AD >NUL 2>&1
IF ERRORLEVEL 1 (echo %1 es un archivo)
shift
goto loop

:help
echo Blablabla
:end
