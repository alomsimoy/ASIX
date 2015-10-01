@ ECHO OFF

if "%1"=="" goto help
if EXIST %1\ goto direxist

MD %1
CD %1
goto end

:direxist
echo El nuevo directorio actual ya existia con anterioridad
CD %1
goto end

:help
echo Esta orden crea un directorio y entra en el

:end
