<?php

session_start();
require_once("cookies.php");

unset($_SESSION['user_data']);
unset($_SESSION['view_next_deadlines']);
unset($_SESSION['view_complete']);
destroy_login_cookies();

header('Location: /todolist/login.php');
die();

?>
