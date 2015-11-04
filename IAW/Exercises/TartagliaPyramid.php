<!DOCTYPE html>
<html>
<head>
    <title>Tartaglia Pyramid</title>
    <meta charset='utf-8'>
    <!--
    <link rel="stylesheet" type="text/css" href="FIXME">
    <script type="text/javascript" src="FIXME"></script>
    -->
    <style type="text/css">
    table {
        text-align: center;
    }
    .square {
        border: 1px solid black;
    }
    </style>

</head>
<body>
<?php

$n = 10;
drawPyramid(createPyramid($n));

// Return an array of arrays with the pyramid
function createPyramid($n) {
    $pyramid = array(array(1), array(1, 1));
    for ($i = 2; $i <= $n; $i++) {
        $pyramid[] = range(1, $i, 1);
        $pyramid[$i][end($pyramid[$i])] = 1;
        for ($j = 1; $j < count($pyramid[$i]) - 1; $j++) {
            $pyramid[$i][$j] = $pyramid[$i - 1][$j - 1] + $pyramid[$i - 1][$j];
        }
    }
    return $pyramid;
}

// Draw the pyramid in a table using colspans to center it
function drawPyramid($pyramid){
    $lenght = count(end($pyramid));
    echo "<table>\n";
    for ($i = 0; $i < $lenght; $i++){
        echo "<tr>\n";
        $col=0;
        for ($j = 0; $j < $lenght - $i; $j++){
            $col++;
        }
        echo "    <td colspan='".$col."'></td>\n"; // blankspaces are for indentation
        for ($k = 0; $k < count($pyramid[$i]); $k++) {
            echo "    <td class='square' colspan='2'>".$pyramid[$i][$k]."</td>\n";
        }
        echo "    <td colspan='".$col."'></td>\n";
        echo "</tr>\n";
    }
    echo "</table>\n";
}

?>
</body>
</html>
