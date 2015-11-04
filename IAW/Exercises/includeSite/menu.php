<div class="left">
<?php
$file = getFileName($_SERVER['REQUEST_URI']);

function getFileName($URL) {
    return end(explode("/", $URL));
}
?>
<ul>
    <li <?php if ($file == "page1.php") echo "class='current'"; ?> ><a href="page1.php">Page 1</a></li>
    <li <?php if ($file == "page2.php") echo "class='current'"; ?> ><a href="page2.php">Page 2</a></li>
    <li <?php if ($file == "page3.php") echo "class='current'"; ?> ><a href="page3.php">Page 3</a></li>
</div>

