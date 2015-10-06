@ ECHO OFF

:MAIN
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO         ###############################################
ECHO         #                                             #
ECHO         #   MENU PRINCIPAL                            #
ECHO         #                                             #
ECHO         #                                             #
ECHO         #    1. MOSTRAR ARBOL                         #
ECHO         #    2. GESTIONAR ETIQUETA                    #
ECHO         #    3. CHEQUEAR UNIDAD                       #
ECHO         #    4. SALIR AL DOS                          #
ECHO         #                                             #
ECHO         ###############################################
ECHO.
ECHO.
ECHO.
SET /P VALOR=OPCION? 
GOTO %VALOR

:1
CLS
TREE
PAUSE
GOTO MAIN

:2
CLS
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO         ###############################################
ECHO         #                                             #
ECHO         #   GESTIONAR ETIQUETA                        #
ECHO         #                                             #
ECHO         #                                             #
ECHO         #    21. ETIQUETAR UNIDAD                     #
ECHO         #    22. BORRAR EQUIQUETA                     #
ECHO         #    23. CONSULTAR ETIQUETA                   #
ECHO         #    24. VOLVER                               #
ECHO         #                                             #
ECHO         ###############################################
ECHO.
ECHO.
ECHO.

SET /P VALOR=OPCION? 
GOTO %VALOR

:3
CLS
CHKDSK
PAUSE
GOTO MAIN

:4
PROMPT
CLS

:21
LABEL
PAUSE
GOTO OPCION2

:22
ECHO. > ~TEMP
ECHO y >> ~TEMP
LABEL < ~TEMP
DEL ~TEMP
PAUSE
GOTO OPCION2

:23
ECHO. | LABEL | FIND 
PAUSE
GOTO OPCION2

:24
GOTO MAIN
