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
$parent = $_POST['parent'];
$duration = $_POST['duration'];
$act_duration = $_POST['act_duration'];
$class = $_POST['class'];

$query = "UPDATE task SET name='$name', deadline='$deadline', observations='$observations', parent='$parent', estimated_duration='$duration', class='$class', actual_duration='$act_duration' WHERE id='$id' AND user_id='$user_id';";
$query_result = run_query($query);

if ($query_result === TRUE) echo 1;
else echo 0;

?>
