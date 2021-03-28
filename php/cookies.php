<?php

$secret_string = "<secret_string>";

function create_login_cookies($user_data)
{
    global $secret_string;

    // TODO: make it safe.
    $days180 = time() + 60 * 60 * 24 * 180;
    setcookie("todolist_user_name", $user_data["username"], $days180, "/");
    setcookie("todolist_login_hash", md5($secret_string . $user_data["id"]), $days180, "/");
}


function load_login_data_from_cookies()
{
    global $secret_string;   

    if (isset($_COOKIE["todolist_user_name"]) and isset($_COOKIE["todolist_login_hash"]))
    {
        require_once('db.php');

        $name = $_COOKIE["todolist_user_name"];
        $query_result = run_query("SELECT * FROM user WHERE username='$name';");
        $user_data = select2array($query_result);
        
        if (count($user_data) == 1)
        {
            $user_data = $user_data[0];

            if ($_COOKIE["todolist_login_hash"] == md5($secret_string . $user_data["id"]))
                return $user_data;
        }
    }
    
    return NULL;
}


function destroy_login_cookies()
{
    unset($_COOKIE["todolist_user_name"]);
    unset($_COOKIE["todolist_login_hash"]);
    setcookie("todolist_user_name", "", 0, "/");
    setcookie("todolist_login_hash", "", 0, "/");
}

?>

