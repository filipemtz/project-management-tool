<?php

    session_start();
    require_once('db.php');

    if (!isset($_SESSION['user_data']))
    {
        header('Location: /todolist/login.php');
        die();
    }

    $user_id = $_SESSION['user_data']['id'];
    $task_id = $_POST['task_id'];

    $task = run_query("SELECT * FROM task WHERE id='$task_id' AND user_id='$user_id';")->fetch_assoc();
    
    if ($task['running_status'] == 0)
    {
        $new_status = 1;
        $additional_update = "time_status_update=NOW()";
    }
    else
    {
        $new_status = 0;
        $additional_update = "actual_duration=actual_duration + (UNIX_TIMESTAMP(NOW()) - UNIX_TIMESTAMP(time_status_update)) / 3600., time_status_update=NOW()";
    }

    $query = "UPDATE task SET running_status='$new_status', $additional_update WHERE id='$task_id' AND user_id='$user_id';";
    $query_result = run_query($query);

    if ($query_result) 
    {
        echo $new_status;
    }
    else echo "-1";

?>


