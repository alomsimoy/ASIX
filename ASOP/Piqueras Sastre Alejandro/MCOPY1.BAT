@echo off
rem Examen ASOP
rem Ejercicio 1
rem Autor: Alejandro Piqueras Sastre
rem Fecha: 22/10/2015

set c=0
:copy
if "%2"=="" goto end
echo copy %1 %2
set /a c=%c% + 1
shift /2
goto :copy

:end
echo %c% copias realizadas del archivo %1
set c=