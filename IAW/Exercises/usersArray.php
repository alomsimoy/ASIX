<!DOCTYPE html>
<html>
    <head>
        <title> </title>
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