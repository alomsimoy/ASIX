<!DOCTYPE html>
<html>
    <head>
        <title>Get DNI Letter</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php

$DNI=$PUSH[number];
$letter=$PUSH[letter];

echo "The letter of the DNI ".$DNI." is ".getDNILetter($DNI);

function getHTML() {
    switch (checkDNI) {
        case 1:
            //TODO
    }
}
// checkDNI returns 1 if correct, 0 if not, -1 if number is not a number
// and/or contain any char that is not a num, and -2 if letter is not a
// single letter
function checkDNI($number, $letter) {
    if (!preg_match(\d{8}, $number)) {
        return -1;
    } else if (!preg_match([a-zA-Z], $letter)) {
        return -2;
    } else if (getDNILetter($number)==$letter) { 
        return 1;
    } else return 0;
}

function getDNILetter ($DNI) {
    $num = $DNI % 23;
    $digit = explode(",","T,R,W,A,G,M,Y,F,P,D,X,B,N,J,Z,S,Q,V,H,L,C,K,E");
    return $digit[$num];   
}

?>

    </body>
</html>
