
<html>
<body>

<?php 

    require_once('../db.php');

    $query = "SELECT * FROM task WHERE status='1';";
    $query_result = run_query($query);
    $tasks = select2array($query_result);

    for ($i = 0; $i < count($tasks); $i++)
    {
        $id = $tasks[$i]['id'];
        $query = "UPDATE task SET status='1' WHERE parent='" . $id . "';";
        echo $query . '<BR>';
        run_query($query);
    }

    echo 'OK!';
    
?>

</body>
</html>

