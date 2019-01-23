<?php 

require_once('db.php');

$parent_id = $_POST['parent_id'];
$name = $_POST['name'];
$deadline = $_POST['deadline'];
$observations = $_POST['observations'];

if (strlen($parent_id) == 0)
    $parent_id = 0;

$query = "INSERT INTO task(name, deadline, observations, parent) VALUES('$name', '$deadline', '$observations', '$parent_id');";
$query_result = run_query($query);

if ($query_result === TRUE) echo 1;
else echo 0;

?>
