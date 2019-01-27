<?php

session_start();

$which = $_POST['which'];

if (!isset($_SESSION[$which]))
    $_SESSION[$which] = TRUE;
else if ($_SESSION[$which] == FALSE)
    $_SESSION[$which] = TRUE;
else
    $_SESSION[$which] = FALSE;

if ($_SESSION[$which]) echo 1;
else echo 0;

?>

