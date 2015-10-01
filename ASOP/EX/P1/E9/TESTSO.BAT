@ ECHO OFF

if EXIST %1\Documents and settings\ goto xp
if EXIST %1\Users\ goto w7

echo La unidad %1 no contiene ningun SO WXP ni W7
goto end

:xp
echo La unidad %1 posiblemente contiene una instalacion de Windows XP
goto end

:w7
echo La unidad %1 posiblemente contiene una instalacion de Windows7
goto end

:end
