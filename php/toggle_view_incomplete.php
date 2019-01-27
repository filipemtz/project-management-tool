<?php

session_start();

if (!isset($_SESSION['view_complete']))
    $_SESSION['view_complete'] = TRUE;
else if ($_SESSION['view_complete'] == FALSE)
    $_SESSION['view_complete'] = TRUE;
else
    $_SESSION['view_complete'] = FALSE;

?>
