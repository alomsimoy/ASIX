<!DOCTYPE html>
<html>
    <head>
        <title>Get DNI Letter</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php

$DNI=$_POST[number];
$letter=$_POST[letter];

echo $DNI;
echo $letter;
// checkDNI($DNI, $letter);

// checkDNI returns 1 if correct, 0 if not, -1 if number is not a number
// and/or contain any char that is not a num, and -2 if letter is not a
// single letter
function checkDNI($number, $letter) {
    $error=false;
    echo $number.$letter;
    if (!preg_match(\d(8), $number)) {
        printMessage(2);
        $error=true;
    } 
    if (!preg_match([a-zA-Z], $letter)) {
        printMessage(3);
        $error=true;
    }
    if (!$error) {
        if (getDNILetter($number)==$letter) { 
            printMessage(1);
        } else {
            printMessage(0);
        }
    }
}

function printMessage ($num) {
    switch ($num) {
        case 2:
            echo "You must insert a valid DNI number (8 digits).<br/>";
            break;
        case 3:
            echo "You must use a valid character between A and Z.<br/>";
            break;
        case 1:
            echo "The letter match with the DNI number.<br/>";
            break;
        case 0:
            echo "The letter does not match with the DNI number.<br/>";
            break;
        default:
            echo "Unknown error.";
    }
}
function getDNILetter ($DNI) {
    $num = $DNI % 23;
    $digit = explode(",","T,R,W,A,G,M,Y,F,P,D,X,B,N,J,Z,S,Q,V,H,L,C,K,E");
    return $digit[$num];   
}

?>

    </body>
</html>
