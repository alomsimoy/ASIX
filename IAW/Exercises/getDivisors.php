<!DOCTYPE html>
<html>
    <head>
        <title>Get Divisors</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php

$number = 7;


echo "The divisors of the number ".$number." are: ".implode(", ",getDivisors($number));


function getDivisors ($n) {
    $divisors = array();
    for ($i = 2; $i < $n; $i++) {
        if ($n % $i == 0) $divisors[] = $i; //Add divisor to array
    }
    if (count($divisors) == 0) $divisors[] = 0; //If the array is empty (prime number) add 0
    return $divisors;
}
?>
    </body>
</html>