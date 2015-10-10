<!DOCTYPE html>
<html>
    <head>
        <title>Users Array</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php

$users = array(
    "Joan" => "1234",
    "Pere" => "5678",
    "Toni" => "9012"
    );

foreach ($users as $key => $value) {
    echo $key." = ".$value."<br>";
}
?>
    </body>
</html>