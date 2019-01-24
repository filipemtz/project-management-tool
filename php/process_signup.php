<?php

session_start();
require_once('db.php');

// TODO: basic checks

// insert user into the database
$name = $_POST['signup_username'];
$email = $_POST['signup_email'];
$password = $_POST['signup_password'];
$md5_password = md5($password);

$query = "INSERT INTO user(username, email, password) VALUES('$name', '$email', '$md5_password');";
$query_result = run_query($query);

if ($query_result === TRUE)
{
    $user_data = select2array(run_query("SELECT * FROM user WHERE email='$email';"));

    if (count($user_data) == 1)
    {
        $_SESSION['user_data'] = $user_data[0];
        header('Location: /todolist/index.php');
        die();
    }
}

header('Location: /todolist/php/logout.php');
die();
?>

