<html>
<body>

Todo list App

<br>
<br>
<b> Sign-up </b>
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

<form method='post' action='php/process_signup.php'>
Username: <input type='text' id='signup_username' name='signup_username' /> <br>
E-mail: <input type='email' id='signup_email' name='signup_email' /> <br>
Password: <input type='password' id='signup_password' name='signup_password' /> <br>
Repeat Password: <input type='password' id='signup_repeat_password' name='signup_repeat_password' /> <br>
<input type='submit' id='signup_submit' onclick='signup();' value='Submit' />
</form>

<br>
<br>
<a href='index.php'>Back</a>

</body>
</html>

