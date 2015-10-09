<!DOCTYPE html>
<html>
    <head>
        <title>Isosceles Triangle</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php

$x = 7;
for ($j = 1; $j <= $x; $j++) {
    for ($i = 1; $i <= -(abs((($x + 1) / 2) - $j) - (($x + 1) / 2)) ; $i++) {
        echo " * ";
    }
    echo "<br>";
}
?>
    </body>
</html>