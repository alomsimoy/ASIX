<!DOCTYPE html>
<html>
    <head>
        <title>Hexadecimal Table</title>
        <meta charset='utf-8'>
        <style type="text/css">
table, th, td {
    border: 1px solid black;
}
        </style>
    </head>
    <body>
<?php
$x = 16;
$y = 16;

echo "<table>\n";
for ($j = -1; $j < $y; $j++) {
    if ($j != -1) {
        echo "<tr><th><em>".strtoupper(dechex($j))."</em></th>\n";
    } else {
        echo "<tr><th></th>\n";
    }
    for ($i = 0; $i < $x; $i++) {
        if ($j <0) {
            echo "<th><em>".strtoupper(dechex($i))."</em></th>\n";
        } else {
            echo "<th>".($i + $j*16 ). "</th>\n";
        }
    }
    echo "</tr>\n";
}
echo "</table>\n";
?>
    </body>
</html>