<?php 

session_start();
require_once("php/cookies.php");

if (!isset($_SESSION["user_data"]))
{
    $userdata = load_login_data_from_cookies();
    
    if (isset($userdata))
        $_SESSION["user_data"] = $userdata;
    else
    {
        header("Location: /todolist/login.php");
        die();
    }
}

?>

<html>
<head>
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <style>
    .dont-break-out {
      /* These are technically the same, but use both */
      overflow-wrap: break-word;
      word-wrap: break-word;
      -ms-word-break: break-all;
      /* This is the dangerous one in WebKit, as it breaks things wherever */
      word-break: break-all;
      /* Instead use this non-standard one: */
      word-break: break-word;
      /* Adds a hyphen where the word breaks, if supported (No Blink) */
      -ms-hyphens: auto;
      -moz-hyphens: auto;
      -webkit-hyphens: auto;
      hyphens: auto;
    }
    </style>
</head>
<body>

<div>
<div style='display:inline-block;width:49%;'> <u> TODO List </u> </div>
<div style='display:inline-block;width:49%;text-align:right;'> 
    <a href='php/logout.php'>Logout</a> 
</div>
</div>

<div>
<br>
<input type='checkbox' onclick='toggle_view_complete_tasks()' 
<?php 
if (isset($_SESSION['view_complete'])) 
    if ($_SESSION['view_complete']) 
        echo 'checked'; 
?> 
/> View Concluded Tasks
<br>
<input type='checkbox' onclick='toggle_view_next_deadlines()' 
<?php 
if (isset($_SESSION['view_next_deadlines'])) 
    if ($_SESSION['view_next_deadlines']) 
        echo 'checked'; 
?> 
/> View Next Deadlines
<br>
</div>

<br>
<br>

<div style='width:90%'>
    <div id='main' style='display:inline-block;float:left;'> 
        <div id="root"> 
        <div id="subtasks0"></div> 
        <div id="new"></div> 
        </div> 
    </div>
    <div id='next_deadlines' style='display:inline-block;float:right;'> 
    </div> 
</div> 

<script type="text/javascript" src="http://www.fmtz.com.br/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript"> 
$(function(){
    list_root_tasks();

    setInterval(function() { 
        $.ajax({method: "POST", url: "php/user_is_logged.php"}).done(function(data) {
            if (data == 0) {
                window.location.replace('php/logout.php');
            }
        });
    }, 5000);
    
    <?php 

    $view_deadlines_active = FALSE;

    if (isset($_SESSION['view_next_deadlines'])) 
    {
        if ($_SESSION['view_next_deadlines']) 
        {            
            $view_deadlines_active = TRUE;
            echo 'list_next_deadlines()'; 
        }
    }

    if (! $view_deadlines_active)
    {
        echo "$('#next_deadlines').hide();\n";
        echo "$('#main').css('width', '99%');";
    }

    ?>     
}); 
</script> 

</body>
</html>
