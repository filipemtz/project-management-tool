<?php 

session_start();
require_once('db.php');

if (!isset($_SESSION['user_data']))
{
    header('Location: /todolist/login.php');
    die();
}

$user_id = $_SESSION['user_data']['id'];

$id = $_POST['id'];
$name = $_POST['name'];
$deadline = $_POST['deadline'];
$observations = $_POST['observations'];

$query = "UPDATE task SET name='$name', deadline='$deadline', observations='$observations' WHERE id='$id' AND user_id='$user_id';";
$query_result = run_query($query);

if ($query_result === TRUE) echo 1;
else echo 0;

?>
