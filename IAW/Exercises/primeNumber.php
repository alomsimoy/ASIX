<!DOCTYPE html>
<html>
    <head>
        <title>Prime Number</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php

$number = 13;

// If the number is not prime, adds a "not" to the output sentence
$result = "";
if (!isPrime($number)) $result = " not";

echo "The number ".$number." is".$result." prime.";


// Check if a number is prime (boolean)
function isPrime ($n) {
    for ($i = 2; $i <= $n/2; $i++) {
        if ($n % $i == 0) return false;
    }
    return true;
}
?>
    </body>
</html>