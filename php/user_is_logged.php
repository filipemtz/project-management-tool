<?php

session_start();

if (isset($_SESSION['user_data']))
    echo "1";
else
{
    require_once("cookies.php");
    
    $userdata = load_login_data_from_cookies();
    if (isset($userdata))
    {
        $_SESSION['user_data'] = $userdata;
        echo "1";
    }
    else
        echo "0";
}

?>




