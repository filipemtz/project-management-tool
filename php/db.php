<?php

function run_query($query)
{
    $host         = "localhost";
    $username     = "root";
    $password     = "123123qwe";
    $dbname       = "todolist_db";

    $conn = new mysqli($host, $username, $password, $dbname);

    if ($conn->connect_error) 
         die("Connection to database failed: " . $conn->connect_error);

    $result = $conn->query($query);
    $conn->close();

    return $result;
}

function select2array($result)
{
    $result_array = array();

    /* If there are results from database push to result array */
    if ($result->num_rows > 0) 
    {
        while ($row = $result->fetch_assoc()) 
            array_push($result_array, $row);
    }

    return $result_array;
}

?>
