@ ECHO OFF

if "%1" == "" goto help
if NOT "%1" == "" goto help

if EXIST %1\Documents and settings\ goto xp
if EXIST %1\Users\ goto w7

echo La unidad %1 no contiene ningun SO WXP ni W7
NEWLABEL=DATOS
goto changelabel

:xp
echo La unidad %1 posiblemente contiene una instalacion de Windows XP
NEWLABEL=SYS_XP
goto changelabel

:w7
echo La unidad %1 posiblemente contiene una instalacion de Windows7
NEWLABEL=SYS_W7
goto changelabel

:help
echo TESTSO [letra_unidad:] [/L]
echo Comprueba si existe una instalacion de Windows XP o 7 en el disco indicado
echo /L  Etiqueta la unidad con SYS_XP, SYS_W7 o DATOS, segun corresponda.
goto end

:changelabel
if "%2"=="/L" LABEL %1 $NEWLABEL

:end
