<!DOCTYPE html>
<html>
    <head>
        <title>Age Arranger</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php
$age = 70;
if ( $age <= 4 ) $string = "It's a baby";
elseif ( $age <= 12 ) $string = "It's a child";
elseif ( $age <= 18 ) $string = "It's a teenager";
elseif ( $age <= 27 ) $string = "It's a young person";
elseif ( $age <= 50 ) $string = "It's an adult person";
elseif ( $age <= 65 ) $string = "It's an old person";
else $string = "It's an elder";

echo $string

?>
    </body>
</html>