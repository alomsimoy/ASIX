<!DOCTYPE html>
<html>
<head>
    <title>Filename getter</title>
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
    
$URL="http://localhost/index.php";

echo getFileName($URL);

function getFileName($URL) {
    return end(explode("/", $URL));
}

?>
</body>
</html>
