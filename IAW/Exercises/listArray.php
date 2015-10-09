<!DOCTYPE html>
<html>
    <head>
        <title>List Array</title>
        <meta charset='utf-8'>
    </head>
    <body>
<?php
$list = array("Element1", "Element2", "Element3");

echo listArray($list);


// Return an array as ordered list in html format
function listArray($a) {
    $htmlList = "<ol>\n";
    foreach ($a as $e) {
        $htmlList .= "<li>".$e."</li>\n";
    }
    $htmlList .= "</ol>\n";
    return $htmlList;
}
?>
    </body>
</html>