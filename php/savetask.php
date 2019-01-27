<?php 

session_start();
require_once('db.php');

if (!isset($_SESSION['user_data']))
{
    header('Location: /todolist/login.php');
    die();
}

$user_id = $_SESSION['user_data']['id'];

$parent_id = $_POST['parent_id'];
$name = $_POST['name'];
$deadline = $_POST['deadline'];
$observations = $_POST['observations'];

if (strlen($parent_id) == 0)
    $parent_id = 0;

$query = "INSERT INTO task(name, deadline, observations, parent, user_id, status) VALUES('$name', '$deadline', '$observations', '$parent_id', '$user_id', '0');";
$query_result = run_query($query);

if ($query_result === TRUE) echo 1;
else echo 0;

?>
