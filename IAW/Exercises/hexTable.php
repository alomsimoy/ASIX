
<!DOCTYPE html>
<html>
    <head>
        <title> </title>
    </head>
    <style type="text/css">
    table, th, td {
        border: 1px solid black;
    }
    </style>
    <body>
<?php
$x = 16;
$y = 16;

echo "<table>";
for ($j = -1; $j < $y; $j++) {
    if ($j != -1) {
        echo "<tr><th><em>".strtoupper(dechex($j))."</em></th>";
    } else {
        echo "<tr><th></th>";
    }
    for ($i = 0; $i < $x; $i++) {
        if ($j <0) {
            echo "<th><em>".strtoupper(dechex($i))."</em></th>";
        } else {
            echo "<th>".($i + $j*16 ). "</th>";
        }
    }
    echo "</tr>";
}
echo "</table>";
?>
    </body>
</html>