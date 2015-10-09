<!DOCTYPE html>
<html>
    <head>
        <title> </title>
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