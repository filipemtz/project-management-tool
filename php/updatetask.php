<?php 

require_once('db.php');

$id = $_POST['id'];
$name = $_POST['name'];
$deadline = $_POST['deadline'];
$observations = $_POST['observations'];

$query = "UPDATE task SET name='$name', deadline='$deadline', observations='$observations' WHERE id='$id';";
$query_result = run_query($query);

if ($query_result === TRUE) echo 1;
else echo 0;

?>
