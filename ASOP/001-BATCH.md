BATCH
=====


##Introducción

Concepto de ficheros por lotes

En DOS se puede trabajar de 2 maneras:

- Modo interactivo (orden por orden)
- Modo BATCH (por lotes). El sistema ejecuta varias ordenes seguidas sin intervencion del usuario. Estas ordenes se encuentran contenidas en un fichero ASCII que recibe el nombre de fichero BATCH, por lotes o BAT

Características de los ficheros BATCH
- Extension .bat
- Son ficheros ASCII, se pueden editar con cualquier editor
- No hace falta escribir la extension para ejecutarlo
- Puede darse el caso de que existan archivos BAT que tengan el mismo nombre que archivos EXE o COM. Tienen prioridad los EXE y los COM delante de los BAT
- En un proceso BAT se ejecutan las ordenes secuencialmente a menos que exista una orden que la rompa
- Se puede abortar la ejecucion de un script mediante <kbd>CTRL^C</kbd>
- Dentro de este fichero se puede insertar cualquier orden o programa que se puede usar desde PROMPT
- Existe un conjunto de ordenes de uso especifico para ficheros BATCH


##Parámetros

Los parametros que se le pasen al script han de separarse el uno del otro con espacios en blanco.

Se pueden introducir tantos como quiera. El unico limite esta en la longitud de la linea de comandos (127 caracteres).

Para identificar los parametros dentro del fichero BAT se utilizan 10 simbolos que son %n donde n es un numero del 0 al 9. Al comando de llamada en si se le atribuye %0

Hay una orden llamada SHIFT. Cuando un script encuentra una linea SHIFT mueve toda la numeracion de los parametros uno hacia la derecha.

Con SHIFT /n solo se mueven los parametros a partir de la posicion n.

##Variables del entorno
###Opciones avanzadas de la orden SET

- /A Evaluar expresiones aritméticas

      set /A xx=2+1  ->  xx almacena 3

- /P Permite solicitar un valor al usuario, almacenando la respuesta en una variable.

      set /P edad=introduzca edad:

##Ordenes
###Gestion de mensajes

1.  M. internos o comentarios

         REM [comentario]

2.  M. de llamada a una orden o eco

         @ orden

    Evita la aparicion en pantalla del mensaje de llamada de la orden a la cual precede

         ECHO [ON/OFF]

    Sin parametros muestra el estado actual del echo.

    Con parametros activa o desactiva el echo

         ECHO Mensaje

    Muestra por pantalla (independientemente del estado del echo) el mensaje escrito.

         ECHO.

    Muestra por pantalla una linea en blanco

    Observaciones: El echo afecta a los mensajes de llamada, no a los de salida.

3.  M. de salida de una orden

    Usamos el redireccionamento de salida para evitar los mensajes de salida. Redireccionaremos a NUL para enviar el mensaje a ningun lado.

###Control del proceso de ejecucion
PAUSE
	Interrumpe la ejecucion del programa y muestra el mensaje "Pulse una tecla para continuar"

GOTO
	GOTO etiqueta
	Desvia el proceso de ejecucion a otra parte del fichero identificado con una etiqueta.
	Las etiquetas empiezan con ':'
	Ejemplo:
		_______
		:etiqueta1
		_______
		_______
		_______
		GOTO :etiqueta1
		_______
	La etiqueta despues del GOTO no tiene porque tener ':'
	La longitud de la etiqueta puede ser de hasta 127 caracteres (incl. ':') aunque solo son significativos los 8 primeros.
	GOTO :EOF Salta al final del batch (ultimas versiones de la consola)

IF
	IF condicion orden
	Condicion: Existencia del fichero
		EXIST fichero
		NOT EXIST fichero
	Condicion: Igualdad de cadenas
		Cadena1==Cadena2
		NOT Cadena1==Cadena2
	Condicion: Codigo de salida
		ERRORLEVEL n (donde n es un numero)
		Comprueba el codigo de salida de la orden ejecutada previamente al if, si es mayor o igual al que se especifica en el IF, la condicion es verdadera.

CALL
	Permite hacer una llamada a otro script de manera que al finalizar la ejecucion de este script el control del programa es devuelto al proceso quer realizo la llamada.
	Si realizamos una llamada a otro programa, no es necesario hacerlo con un call, el control regresa automaticamente al script inicial.