<!DOCTYPE html>
<html>
    <head>
        <title>Divisible Checker</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php
$a = 27;
$b = 3;
$c = $a % $b;
$d = $a / $b;
$r = "The number $a is ";
$r2 = "divisible with $b";
$r3 = ", and the result is $d";

if ($c != 0) {
    $r .= "not " . $r2;
} else {
    $r .= $r2 . $r3;
}

echo $r;
?>
    </body>
</html>