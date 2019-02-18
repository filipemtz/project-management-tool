<?php session_start(); ?>

<html>
<body>

Todo list App

<br>
<br>

<b> Login </b>
<br>
<br>

<?php

if (in_array('error_message', $_SESSION))
{
    if (strlen($_SESSION['error_message']) > 0)
    {
        echo "<div class='error_message'>" . $_SESSION['error_message'] . "</div>";
        echo "<br>";
        echo "<br>";
    }
}

?>

<form method='post' action='php/process_login.php'>
Username: <input type='text' id='login_username' name='login_username' /> <br>
Password: <input type='password' id='login_password' name='login_password' /> <br>
<input type='checkbox' id='stay_connected' name='stay_connected' /> Remember me <br>
<input type='submit' id='login_submit' onclick='login();' value='Submit' />
</form>

<br>
<br>
<a href='signup.php'>Sign-up</a>
<br>
<br>
<a href='#' onclick="alert('Not implemented. Contact Filipe.');">Forgot my password</a>

</body>
</html>

