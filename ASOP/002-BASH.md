Definición y utilizacion de variables
    $ variable=valor

    uso
    $ echo $variable
    $ echo ${variable}

Orden set
    lista todas las variables definidas en ese momento

Orden unset
    $ unset destino
    libera el espacio de RAM de una variable (limpia la variable)

Cuando se ejecuta un guión, se crea un shell subordinado al shell que lo ha lanzado.
    Contamos con dos shells
    uno de entrada
Uno subordinado generado por el de entrada para el guión

Cuando el guión termina su ejecución tambien finaliza su shell y regresa

Un guión puede a su vez llamar a otro guión y así sucesivamente.
Cada guión que se ejecuta supone un shell subordinado al shell que lo ha lanzado.
Es decir podemos tener varios shells, cada uno anidado dentro de otro.

Las variables que se definen en un shell sólo existen en éste, el shell que las ha creado.
Es decir, podríamos decir que una variable esta oculta dentro de su shell y que ningún otro puede hacer referencia a ella.

Podemos hacer que un shell subordinado reciba una copia de una variable definida en un shell superior.

Para ello es necesario que el shell que ha generado la variable, la "exporte".

Cuando un shell define una variable, y la exporta, todo los shells subordinados (en cualquier nivel de anidación dentro de éste) recibirán una copia de esta variable en el momento en que se abra cada shell.

Para ello el shell que genera la variable ha de ejecutar: 
   $ export variable

Existen dos áreas de memoria incorporadas al Shell para almacenar variables:
    Área local de datos: cuando se define una variable se le asigna memoria de esta área. Las variables de esta área son privadas de este Shell.
    Entorno: las variables exportadas pasan del área anteriormente descrita a esta área de entorno, y una copia de éstas es la que recibirá cualquier Shell hijo (al crearse) en su área de entorno.

Orden set
    informa de las variables de las dos áreas mezcladas (área local de datos + entorno)

Orden env
    informa únicamente del entorno.

Ejemplos
    HOME
    LOGNAME
    PATH
    HISTFILE
    HISTSIZk

$ man bash
    Aqui salen las variables y sus usos

Delimitar: anular el significado especial de un carácter.
    Dobles comillas (delimitan cualquier carácter especial excepto el $)
    Apóstrofos (delimitan cualquier carácter especial)
ejemplo
$ vencedor=Pep
$ noticia1="El vencedor es $vencedor"
$ noticia2='El vencedor es $vencedor'
$ echo $noticia1
    El vencedor es Pep
$ echo $noticia2
    El vencedor es $vencedor

    usando el carácter de escape \ podemos escapar el $
$ noticia3="$vencedor ha ganado \$100"
$ echo $noticia3
    Pep ha ganado $100

Se puede guardar el resultado de una orden en una variable
$ lscc1=`ls *.c`
$ lscc2='ls *.c'
$ echo lscc1
burbuja.c contar.c
$echo $lscc2
   ls *.c
$ $lscc2
burbuja.c contar.c

Programacion del shell bash

|Forma ejecución | ejemplo | Genera Shell subordinado |
| Actibar el permiso de ejecución para el archivo guión| $chmod u+x guion | Si|
| Ejecutarlo como cualquier otro programa | $ guion | Si |
| Carácter "." | $ . guion | NO |
