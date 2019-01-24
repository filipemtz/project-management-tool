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

    if (strlen($parent_id) == 0) 
        $parend_it = 0;

    $query_result = run_query("SELECT * FROM task where (parent='$parent_id' AND user_id='$user_id') ORDER BY deadline ASC;");
    $tasks = select2array($query_result);

    echo json_encode($tasks);
?>



