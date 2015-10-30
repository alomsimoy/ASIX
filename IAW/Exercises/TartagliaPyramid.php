<!DOCTYPE html>
<html>
<head>
    <title>Tartaglia Pyramid</title>
    <meta charset='utf-8'>
    <!--
    <link rel="stylesheet" type="text/css" href="FIXME">
    <script type="text/javascript" src="FIXME"></script>
    <style type="text/css">
    </style>
    -->
</head>
<body>
<?php

$n = 20;
drawPyramid(createPyramid($n));

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

function drawPyramid($pyramid){
    $lenght = count(end($pyramid));
    echo "<table border='1px' style='text-align: center'>";
    for ($i = 0; $i < $lenght; $i++){
        echo "<tr>";
        $col=0;
        for ($j = 0; $j < $lenght - $i; $j++){
            $col++;
        }
        echo "<td colspan='".$col."'/>";
        for ($k = 0; $k < count($pyramid[$i]); $k++) {
            echo "<td colspan='2'>".$pyramid[$i][$k]."</td>";
        }
        echo "<td colspan='".$col."'/>";
        echo "</tr>";
    }
    echo "</code>";
}

?>
</body>
</html>
