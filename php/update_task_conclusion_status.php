
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

    function update_task_conclusion_status($id, $user_id)
    {
        $query = "SELECT * FROM task where parent='$id' AND user_id='$user_id';";
        //echo $query . '<br>';
        $query_result = run_query($query);
        $tasks = select2array($query_result);
        $n = count($tasks);
        $result = TRUE;
        
        // detele subtasks recursively
        for ($i = 0; $i < $n; $i++)
            $result = $result && update_task_conclusion_status($tasks[$i]['id'], $user_id);

        $query = "UPDATE task SET status=1-status WHERE (id='$id' AND user_id='$user_id');";
        //echo $query . '<br>';
        $result = $result && run_query($query);
        return $result;
    }
    
    $result = update_task_conclusion_status($task_id, $user_id);
        
    if ($result === TRUE) echo 1;
    else echo 0;

?>


