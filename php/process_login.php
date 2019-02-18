<?php

session_start();
require_once('db.php');
require_once('cookies.php');

// TODO: basic checks

// insert user into the database
$name = $_POST['login_username'];
$password = $_POST['login_password'];
$stay_connected = $_POST['stay_connected'];
$md5_password = md5($password);

$query = "SELECT * FROM user WHERE (username='$name' AND password='$md5_password');";
$query_result = run_query($query);
$user_data = select2array($query_result);

if (count($user_data) == 1)
{
    $user_data = $user_data[0];
    $_SESSION['user_data'] = $user_data;

    if (isset($stay_connected))
    {
        create_login_cookies($user_data);
    }

    header('Location: /todolist/index.php');
    die();
}

header('Location: /todolist/php/logout.php');
die();

?>

