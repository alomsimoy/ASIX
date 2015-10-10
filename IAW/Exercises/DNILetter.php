<!DOCTYPE html>
<html>
    <head>
        <title>Get DNI Letter</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php

$DNI=78221952;

echo "The letter of the DNI ".$DNI." is ".getDNILetter($DNI);

function getDNILetter ($DNI) {
    $num = $DNI % 23;
    $digit = explode(",","T,R,W,A,G,M,Y,F,P,D,X,B,N,J,Z,S,Q,V,H,L,C,K,E");
    return $digit[$num];   
}

?>

    </body>
</html>