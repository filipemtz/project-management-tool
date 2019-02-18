<?php
session_start();
require_once("cookies.php");
?>
<html>
<body>
<?php

echo "<b>Session Data:</b><br>";

foreach($_SESSION as $key => $value)
    echo "$key $value <BR>";

echo "<BR><BR>";
echo "<b>Cookies Data:</b><BR>";

$userdata = load_login_data_from_cookies();

foreach($userdata as $key => $value)
    echo "$key $value <BR>";

?>
</body>
</html>
