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

    $cond = "AND (status=0";
    if (isset($_SESSION['view_complete']))
        if ($_SESSION['view_complete'])
            $cond .= " OR status=1";
    $cond .= ")";

    $query = "SELECT * FROM task where (parent='$parent_id' AND user_id='$user_id' $cond) ORDER BY deadline ASC;";
    $query_result = run_query($query);
    $tasks = select2array($query_result);

    echo json_encode($tasks);
?>



