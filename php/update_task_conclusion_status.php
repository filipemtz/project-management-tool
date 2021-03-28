
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

    $task_data = run_query("SELECT * FROM task where id='$task_id'")->fetch_assoc();
    $desired_status = 1 - $task_data['status'];

    function update_task_conclusion_status($id, $user_id, $desired_status)
    {
        $query = "SELECT * FROM task where parent='$id' AND user_id='$user_id';";
        $query_result = run_query($query);
        $tasks = select2array($query_result);
        $n = count($tasks);
        $result = TRUE;
        
        // detele subtasks recursively
        for ($i = 0; $i < $n; $i++)
            $result = $result && update_task_conclusion_status($tasks[$i]['id'], $user_id, $desired_status);

        $query = "UPDATE task SET status=$desired_status, running_status='0' WHERE (id='$id' AND user_id='$user_id');";
        $result = $result && run_query($query);
        return $result;
    }
    
    $result = update_task_conclusion_status($task_id, $user_id, $desired_status);
        
    if ($result === TRUE) echo 1;
    else echo 0;

?>


