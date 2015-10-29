@echo off
rem Examen ASOP
rem Ejercicio 1
rem Autor: Alejandro Piqueras Sastre
rem Fecha: 22/10/2015

if "%2"=="" goto errpar
if "%1"=="" goto errpar

set c=0
:copy
if "%2"=="" goto copyok
echo copy %1 %2
set /a c=%c% + 1
shift /2
goto :copy

:copyok
echo %c% copias realizadas del archivo %1
goto end

:errpar
echo Error: numero de parametros incorrecto
goto end

:end
set c=