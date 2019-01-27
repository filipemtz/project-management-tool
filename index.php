<?php 

session_start();

if (!isset($_SESSION['user_data']))
{
    header('Location: /todolist/login.php');
    die();
}
?>

<html>
<head>
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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

<div id='main' style='display:inline-block;float:left;text-align:justify;'> 
<div id="root"> 
<div id="subtasks0"></div> 
<div id="new"></div> 
</div> 
</div>

<div id='next_deadlines' style='display:inline-block;float:right;text-align:justify;'> 
</div> 


<script type="text/javascript" src="http://www.fmtz.com.br/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript"> 
$(function(){
    list_root_tasks();

    <?php 
    if (isset($_SESSION['view_next_deadlines'])) 
        if ($_SESSION['view_next_deadlines']) 
            echo 'list_next_deadlines()'; 
    ?> 
}); 
</script> 

</body>
</html>
