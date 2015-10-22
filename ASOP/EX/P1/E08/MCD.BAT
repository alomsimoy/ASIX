@ ECHO OFF
rem Fichero: MCD.BAT
rem Autor: Alomsimoy

if "%1"=="" goto help
if EXIST %1\NUL goto direxist

MD %1

:change
CD %1
goto end

:direxist
echo El nuevo directorio actual ya existia con anterioridad
goto change

:help
echo       MCD dir
echo Esta orden crea un directorio y entra en el.

:end
