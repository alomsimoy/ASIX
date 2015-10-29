@echo off
rem Examen ASOP
rem Ejercicio 1
rem Autor: Alejandro Piqueras Sastre
rem Fecha: 22/10/2015

if "%2"=="" goto errpar
if "%1"=="" goto errpar

:tratpar
set param=%param% %1
if "%3"=="" goto setdest
shift
goto tratpar

:setdest
set destino=%2

if not exist "%destino%" goto errordest

echo @echo off >~helper.bat
echo set numcopiados=0 >>~helper.bat
echo set numnocopiados=0 >>~helper.bat
echo :copy >>~helper.bat
echo if "%%2"=="" goto copyok >>~helper.bat
echo if exist "%%2" goto copy2 >>~helper.bat
echo set nocopiados=%%nocopiados%% %%2 >>~helper.bat
echo set /a numnocopiados=%%numnocopiados%% + 1 >>~helper.bat
echo shift /2 >>~helper.bat
echo goto :copy >>~helper.bat
echo :copy2 >>~helper.bat
echo echo copy %%2 %%1 >>~helper.bat
echo set copiados=%%copiados%% %%2 >>~helper.bat
echo set /a numcopiados=%%numcopiados%% + 1 >>~helper.bat
echo shift /2 >>~helper.bat
echo goto :copy >>~helper.bat
echo :copyok >>~helper.bat
echo if %%numcopiados%%==0 goto nocopy >>~helper.bat
echo echo Se han copiado %%numcopiados%% archivos en %%1: >>~helper.bat
echo echo %%copiados%% >>~helper.bat
echo goto nocopy >>~helper.bat
echo :nocopy >>~helper.bat
echo if %%numnocopiados%%==0 goto end >>~helper.bat
echo echo No se han copiado %%numnocopiados%% archivos: >>~helper.bat
echo echo %%nocopiados%% >>~helper.bat
echo :end >>~helper.bat


call ~helper %2 %param%
if exist ~helper.bat del ~helper.bat
goto end

:errpar
echo Error 01: numero de parametros insuficiente
goto end

:errordest
echo Error 02: destino %1 inexistente
goto end

:end
set param=
set numcopiados=
set numnocopiados=
set copiados=
set nocopiados=