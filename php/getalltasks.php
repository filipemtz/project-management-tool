<?php 
    session_start();
    require_once('db.php');

    if (!isset($_SESSION['user_data']))
    {
        header('Location: /todolist/login.php');
        die();
    }

    $user_id = $_SESSION['user_data']['id'];

    $sort_field = $_POST['sort_by'];
    $query = "SELECT * FROM task where (user_id='$user_id' AND status=0) ORDER BY $sort_field ASC;";
    $query_result = run_query($query);
    $tasks = select2array($query_result);

    echo json_encode($tasks);
?>



