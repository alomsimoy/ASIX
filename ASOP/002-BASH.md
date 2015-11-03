BASH
====

###Variables

Definición y utilizacion de variables

```bash
$ variable=valor

```

Uso

```bash
$ echo $variable
$ echo ${variable}
```

####Orden set

> Lista todas las variables definidas en ese momento.

####Orden unset
```
$ unset destino
```
> Libera el espacio de RAM de una variable (limpia la variable).

###Ejecución de guiones

Cuando se ejecuta un guión, se crea un shell subordinado al shell que lo ha lanzado.

Contamos con dos shells:
* Uno de entrada.
* Uno subordinado generado por el de entrada para el guión.

Cuando el guión termina su ejecución tambien finaliza su shell y regresa.

Un guión puede a su vez llamar a otro guión y así sucesivamente.

Cada guión que se ejecuta supone un shell subordinado al shell que lo ha lanzado.
Es decir podemos tener varios shells, cada uno anidado dentro de otro.

Las variables que se definen en un shell sólo existen en éste, el shell que las ha creado.
Es decir, podríamos decir que una variable esta oculta dentro de su shell y que ningún otro puede hacer referencia a ella.

Podemos hacer que un shell subordinado reciba una copia de una variable definida en un shell superior.

Para ello es necesario que el shell que ha generado la variable, la "exporte".

Cuando un shell define una variable, y la exporta, todo los shells subordinados (en cualquier nivel de anidación dentro de éste) recibirán una copia de esta variable en el momento en que se abra cada shell.

Para ello el shell que genera la variable ha de ejecutar: 

```bash
$ export variable
```

Existen dos áreas de memoria incorporadas al Shell para almacenar variables:

* Área local de datos: cuando se define una variable se le asigna memoria de esta área. Las variables de esta área son privadas de este Shell.

* Entorno: las variables exportadas pasan del área anteriormente descrita a esta área de entorno, y una copia de éstas es la que recibirá cualquier Shell hijo (al crearse) en su área de entorno.

####Orden set
> Informa de las variables de las dos áreas mezcladas (área local de datos + entorno).

####Orden env
> Informa únicamente del entorno.

Ejemplos:

> HOME

> LOGNAME

> PATH

> HISTFILE

> HISTSIZk

```bash
$ man bash
```
> Aqui salen las variables y sus usos

###Delimitar

Anular el significado especial de un carácter.

* Dobles comillas (delimitan cualquier carácter especial excepto el $).

* Apóstrofos (delimitan cualquier carácter especial).

ejemplo

```bash
$ vencedor=Pep
$ noticia1="El vencedor es $vencedor"
$ noticia2='El vencedor es $vencedor'
$ echo $noticia1
    El vencedor es Pep
$ echo $noticia2
    El vencedor es $vencedor
```

Usando el carácter de escape \ podemos escapar el $

```bash
$ noticia3="$vencedor ha ganado \$100"
$ echo $noticia3
    Pep ha ganado $100
```

Se puede guardar el resultado de una orden en una variable

```bash
$ lscc1=`ls *.c`
$ lscc2='ls *.c'
$ echo lscc1
    burbuja.c contar.c
$echo $lscc2
   ls *.c
$ $lscc2
    burbuja.c contar.c
```

###Programacion del shell bash

Forma ejecución | ejemplo | Genera Shell subordinado
--------------- | ------- | --------------------
Activar el permiso de ejecución para el archivo guión| $chmod u+x guion | Si
Ejecutarlo como cualquier otro programa | $ guion | Si
Carácter "." | $ . guion | No

###Comentarios

Un comentario es una línea precedida del caracter #
Shebang (hash-bang o sharpbang)

####Orden echo

Permite la salida de datos desde un archivo guión. Envía datos a la salida estándar.

```bash
$ echo cadena
```

> La opción -n hace que el echo no salte de línea.

####Orden read

Permite que el usuario pueda introducir interactivamente el valor de una variable.

Para ello, lee la siguiente línea que haya en la entrada estándar y se la asigna a la variable indicada en la orden read.

```bash
$ read variable.
```

Ejemplo:

```bash
# archivo ~/saludo
# n.miro 12/12/10

echo -n "Introduzca su nombre: "
read invitado
echo "Hola $invitado"
```

####Operador <<

Permite que una orden incluida en un guión tome sus datos leyéndolos dentro del propio guión.

```bash
comando <<cadena
...
...
cadena
```

> Las líneas incluidas entre cadena y  cadena son consideradas como los datos para comando.

Ejemplo:

```bash
# archivo ~/creap
# n.miro 12/12/10

cat > prueba <<final
Esto es un archivo de prueba
para comprobar el funcionamiento
final
echo "Archivo creado"
```

Ejemplo:
```bash
# archivo ~/sus
# n.miro 12/12/10

vi prueba << kk
:1,$ s/archivo/fichero/g
:wq
kk
echo "operación de sustitución finalizada"
```

###Parámetros de un guión

Un guión del shell puede ser ejecutado acompañado de argumentos.

        $0      $1      $2      $3
    $   guión   arg1    arg2    arg3

Ejemplo:

```bash
# archivo ~/sus
# n.miro 12/12/10

vi $1 << kk
:1,$ s/$2/$3/g
:wq
kk
echo "Operación finalizada. Se han reemplazado todas las apariciones de la cadena $2 por $3 en el fichero $1"
```

#### $# ####

Indica el num de argumentos de la línea de comandos (cuenta incluso si hay +9).

####$* 
Representa todos los argumentos de la línea de comandos (todos incluso si hay +9).

####Símbolo $$

Devuelve un número que se corresponde con el num de proceso que se está ejecutando (PID)

Puede servirnos para crear un fichero temporal con nombre único.

####shift [n]

Permite desplazar n posiciones a la derecha la numeración de los argumentos

####Orden let

Operaciones aritméticas y lógicas de enteros.

Permite efectuar cálculos aritméticos y lógicos con valores enteros con la posibilidad de asignar el resultado a una variable.

* Operaciones aritméticas
    
    ```bash
$ let [variable=]valor1operandovalor2
    ```

* Operaciones aritméticas y lógicas

    ```bash
$ let "[variable=] valor1 operando valor2"
    ```

Ejemplo:

```bash
$ let rdo=2*7
$ echo $rdo
    14
$
```

> Como operando puede utilizarse:

>   * Enteros.

>   * Variables que contengan enteros.

> Ejemplo:

>   ```bash
> cont=0
> let cont=cont+1
>   ```

El resultado de una operación relacional será

* 0 (falso).
* 1 (verdadero).

####Orden expr

Evalúa ezpresiones donde los operandos pueden ser números o cadenas.

Mismos operadores que la oren let para las operaciones con núnmeros.

####Otras ordenes

    match cadena expresión

> Comprobaciones de cadenas.

    substr cadena posición longitud

> Devuelve la subcadena de cadena comenzando en posición con longitud máxima longitud.

    index cadena caracter

> Devuelve la primera posición de cadena donde encuentra el primer carácter caracter

    length cadena

> Devuelve la longitud de cadena.
