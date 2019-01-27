<?php 
    session_start();
    require_once('db.php');

    if (!isset($_SESSION['user_data']))
    {
        header('Location: /todolist/login.php');
        die();
    }

    $user_id = $_SESSION['user_data']['id'];

    $query = "SELECT * FROM task where (user_id='$user_id') ORDER BY name ASC;";
    $query_result = run_query($query);
    $tasks = select2array($query_result);

    echo json_encode($tasks);
?>



