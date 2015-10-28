<!DOCTYPE html>
<html>
<head>
    <title>FIXME</title>
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

$n = 5;
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
    for ($i = 0; $i < $lenght; $i++){
        for ($j = 0; $j < $lenght - $i; $j++){
            echo "&nbsp;";
        }
        for ($k = 0; $k < count($pyramid[$i]); $k++) {
            echo $pyramid[$i][$k]." ";
        }
        echo "</br>";
    }
}

?>
</body>
</html>
