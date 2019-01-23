<?php 
    require_once('db.php');

    $parent_id = $_POST['parent_id'];

    if (strlen($parent_id) == 0) 
        $parend_it = 0;

    $query_result = run_query("SELECT * FROM task where parent='$parent_id'");
    $tasks = select2array($query_result);

    echo json_encode($tasks);
?>



