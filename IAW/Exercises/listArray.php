<!DOCTYPE html>
<html>
    <head>
        <title> </title>
    </head>
    <body>
<?php
$list = array("Element1", "Element2", "Element3");

echo listArray($list);


// Return an array as ordered list in html format
function listArray($a) {
    $htmlList = "<ol>";
    foreach ($a as $e) {
        $htmlList .= "<li>".$e."</li>";
    }
    $htmlList .= "</ol>";
    return $htmlList;
}
?>
    </body>
</html>