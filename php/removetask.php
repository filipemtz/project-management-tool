
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

    function remove_task($id)
    {
        $query = "SELECT * FROM task where parent='$id';";

        $query_result = run_query($query);
        $tasks = select2array($query_result);
        $n = count($tasks);

        $result = TRUE;
        
        // detele subtasks recursively
        for ($i = 0; $i < $n; $i++)
            $result = $result && remove_task($tasks[$i]['id']);

        $query = "DELETE FROM task WHERE id='$id' AND user_id='$user_id';";
        $result = $result && run_query($query);
        
        return $result;
    }
    
    $result = remove_task($task_id);
        
    if ($result === TRUE) echo 1;
    else echo 0;

?>


