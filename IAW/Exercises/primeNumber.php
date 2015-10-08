<?php

$number = 5;

// If the number is not prime, adds a "not" to the output sentence
$result = "";
if (!isPrime($number)) $result = " not";

echo "The number ".$number." is".$result." prime.";


// Check if a number is prime (boolean)
function isPrime ($n) {
    for ($prime = true, $i = 2; $i <= $n/2; $i++) {
        if ($n % $i == 0) $prime = false;
    }
    return $prime;
}
?>