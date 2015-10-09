<!DOCTYPE html>
<html>
    <head>
        <title>Multiplication Table</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php
$tabla=7;
for ($i = 0; $i <= 12; $i++) {
    echo $tabla . " x " . $i . " = " . $i * $tabla."<br>";
}

echo "<br><br>";

for ($i = 12; $i >= 0; $i--) {
    echo $tabla . " x " . $i . " = " . $i * $tabla."<br>";
}


?>
    </body>
</html>