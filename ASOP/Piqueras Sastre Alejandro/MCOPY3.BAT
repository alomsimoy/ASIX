@echo off
rem Examen ASOP
rem Ejercicio 1
rem Autor: Alejandro Piqueras Sastre
rem Fecha: 22/10/2015

if "%2"=="" goto errpar
if "%1"=="" goto errpar

if not exist "%1" goto errorig

set c=0
:copy
if "%2"=="" goto copyok
if exist "%2\" goto copy2
if not exist "%2\" echo Error: destino %2 no valido
shift /2
goto copy
:copy2
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

:errorig
echo Error: origen %1 no valido
goto end

:end
set c=