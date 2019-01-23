
<?php 
    require_once('db.php');

    $id = $_POST['task_id'];
    $query = "DELETE FROM task WHERE id='$id';";
    $query_result = run_query($query);

    if ($query_result === TRUE) echo 1;
    else echo 0;

?>


