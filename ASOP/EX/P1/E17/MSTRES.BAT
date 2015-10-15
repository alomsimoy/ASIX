@ ECHO OFF

SET /P ORD=ORDEN:

for /f %%a in ("%ORD%") do set o=%%a


set ORD=%ORD:%o% =%
goto %o%

:listar
dir %ORD%

:copia
cp %ORD%
