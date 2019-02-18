
function remove_task(task_id, parent_id)
{
    $.ajax({method: "POST", url: "php/removetask.php", data: {"task_id": task_id},}).done(function(data){
        var result = $.parseJSON(data);
        if (result != 1) alert("fail!");
        else { 
            reload_subtasks(parent_id); 
        }
    });    
}


function get_running_icon_by_status(status)
{
    if (status == 0)
        running_icon = "play_arrow";
    else
        running_icon = "<span style='color:red'>pause</span>";    
    return running_icon;
}


function create_task_html(value, parent_id)
{
    if (value['status'] == 1)
    {
        icon = 'done_all';
        color = "style='color:gray;'";
    }
    else
    {
        icon = 'crop_square';
        color = '';
    }
    
    running_icon = get_running_icon_by_status(value['running_status']);

    str =  
        "<div id='edit_form_" + value['id']+ "' style='display:none' >" +
        "<a href='#' onclick='$(\"#task" + value['id'] + "\").show(); $(\"#edit_form_" + value['id'] + "\").hide();'><i class='material-icons tiny'>remove</i></a>" + 
        "<input type='text' id='edit_new_name" + value['id'] + "' value='" + value['name'] + "' /> " +
        "<input type='date' id='edit_new_deadline" + value['id'] + "' value='" + value['deadline'] + "' /> " + 
        "<input type='text' id='edit_new_observations" + value['id'] + "' value='" + value['observations'] + "' /> " +
        "<select id='edit_new_class" + value['id'] + "'>" + create_class_options(value['class']) + "</select> " + 
        "<input type='text' id='edit_new_duration" + value['id'] + "' value='" + value['estimated_duration'] + "' /> hours " +
        "<select id='edit_new_parent" + value['id'] + "'><option value='" + value['parent'] + "'>--</option><option value='0'>Root</option></select> " + 
        "<input onClick='update_task(" + value['id'] + ", " + parent_id + ");' type='button' value='Update' />" +
        "</div>";

    str += "<div id='task" + value['id'] + "'> " + 
            "<a href='#' onclick='toggle_subtasks(" + value['id'] + ")' " + color + ">" + 
            "<i id='icon" + value['id'] + "' class='material-icons tiny'>keyboard_arrow_right</i>" +
            "<span id='task_"+value['id']+"_name'>" + value['name'] + "</span> " +
            "(<span id='task_"+value['id']+"_deadline'>"+ value['deadline'] + "</span>)</a> " +
            "<a href='#' onclick='$(\"#edit_form_" + value['id'] + "\").show(); $(\"#new_name"+value['id']+"\").focus(); $(\"#task"+value['id']+"\").hide(); update_parent_selector(" + value['id'] + ", " + value['parent'] + ")'><i class='material-icons tiny'>edit</i></a> " + 
            "<a href='#' onclick='if(confirm(\"Are you sure you want to remove the task, and all subtasks?\")) remove_task(" + value['id'] + ", " + parent_id + "); '><i class='material-icons tiny'>close</i></a> " + 
            "<a href='#' onclick='update_running_status(" + value['id'] + ")'><i id='running_status_icon" + value['id'] + "' class='material-icons tiny'>" + running_icon + "</i></a> " +
            "<a href='#' onclick='if(confirm(\"Are you sure you want to change the conclusion status of the task, and all subtasks?\")) update_task_conclusion_status(" + value['id'] + ", " + parent_id + ");'><i class='material-icons tiny'>" + icon + "</i></a> ";
            
    if (value['observations'])
    {
        obs = value['observations'];

        if (obs.length > 200)
            obs = obs.substring(0, 200) + '...';

        str += "<span id='task_" + value['id'] + "_observations' class='dont-break-out' style='color:gray;text-align:justify;'> - " + obs + "</span>";
    }
            
    str += "</div>";
    str += "<div style='padding-left:2%' id='subtasks" + value['id'] + "'></div>";

    return str;
}


function update_running_status(task_id)
{
    $.ajax({method: "POST", url: "php/update_running_status.php", data: {"task_id": task_id}}).done(function(data) { 
        if (data == 0 || data == 1) 
            $("#running_status_icon" + task_id).html(get_running_icon_by_status(data));
        else
            alert("fail!");
    });
}


function update_parent_selector(task_id, parent_id)
{
    $.ajax({method: "POST", url: "php/getalltasks.php", data: {"sort_by": "name"}}).done(function(data) { 
        var tasks = $.parseJSON(data);
        var string = "<option value='0'>Root</option>";

        // from result create a string of data and append to the div 
        $.each(tasks, function(key, value) {
            if (value['id'] != task_id)
                string += "<option value='" + value['id'] + "'>" + value['name'].substring(0,40) + "</option>";
        });

        $("#edit_new_parent" + task_id).html(string); 
        $("#edit_new_parent" + task_id).val(parent_id);
    });
}


function create_class_options(selected_item)
{
    classes = ["Development", "Reading", "Skimming", "Experimenting", "Studying", "Planning", "Bureaucracy", "Miscelaneous"];
    str = "";
    
    for (i = 0; i < classes.length; i++)
    {
        str += "<option value=" + i + " ";
        if (i == selected_item)
            str += "selected";
        str += ">" + classes[i] + "</option>\n";
    }
    
    if (selected_item == 100)
        str += "<option value=100 selected>Unitialized</option>"
    
    return str;
}


function add_form(parent_id)
{
    $("#form_" + parent_id).html(
        "<a href='#' onclick='$(\"#form_" + parent_id + "\").html(\"\")'><i class='material-icons tiny'>remove</i></a>" + 
        "<input type='text' id='new_name" + parent_id + "' /> " +
        "<input type='date' id='new_deadline" + parent_id + "' /> " + 
        "<input type='text' id='new_observations" + parent_id + "' /> " +
        "<select id='new_class" + parent_id + "' > " + create_class_options(-1) + " </select>" + 
        "<input type='text' id='new_duration" + parent_id + "' /> hours " +  
        "<input onClick='save_task(" + parent_id + ")' type='button' value='Add' />"
    );

    $("#new_name" + parent_id).focus();
}


function add_subtasks_to_container(name, parent_id)
{
    $.ajax({method: "POST", url: "php/gettasks.php", data: {'parent_id': parent_id}}).done(function(data) { 
        var tasks = $.parseJSON(data);
        var string = ' ';

        // from result create a string of data and append to the div 
        $.each(tasks, function(key, value) {
             string += create_task_html(value, parent_id); 
        });

        string += "<div id='form_" + parent_id + "'></div>";
        string += "<a href='#' onclick='add_form(" + parent_id + ")'> <i class='material-icons tiny'>add</i></a>";

        $(name).html(string); 
    });
}


function reload_subtasks(parent_id)
{
    name = '#subtasks' + parent_id
    add_subtasks_to_container(name, parent_id);
}


function toggle_subtasks(parent_id)
{
    // toggle subtasks
    name = '#subtasks' + parent_id

    if ($(name).text().length == 0)
        reload_subtasks(parent_id);
    else
        $(name).text('');

    // toggle icon
    icon_ref = $('#icon' + parent_id);

    if (icon_ref.text() == 'keyboard_arrow_right')
        icon_ref.text('keyboard_arrow_down');
    else
        icon_ref.text('keyboard_arrow_right');

}


function list_root_tasks()
{
    add_subtasks_to_container('#subtasks0', '0')
}


function list_next_deadlines()
{
    $.ajax({method: "POST", url: "php/getalltasks.php", data: {'sort_by': 'deadline'}}).done(function(data) { 
        var tasks = $.parseJSON(data);
        var string = "<table width='100%' >";
        string += "<tr><td width='40%' style='padding-left:10px;padding-right:10px;border:solid;border-width:1px;'><b>Name</b></td><td width='15%' style='padding-left:10px;padding-right:10px;border:solid;border-width:1px;'><b>Deadline</b></td><td width='43%' class='dont-break-out' style='padding-left:10px;padding-right:10px;border:solid;border-width:1px;'><b>Observations</b></td></tr>";

        // from result create a string of data and append to the div 
        $.each(tasks, function(key, value) {
            obs = value['observations'];

            if (obs.length > 200)
                obs = obs.substring(0, 200) + '...';
        
            deadline = new Date(value['deadline']);
            today = new Date();
            deadline_minus_5 = new Date(deadline);
            deadline_minus_5.setDate(deadline.getDate() - 5);

            color = "";
            if (today > deadline)
                color = "style='color:red;'";
            else if (today > deadline_minus_5)
                color = "style='color:blue;'";

            string += "<tr " + color + ">";
            string += "<td width='40%' style='padding-left:10px;padding-right:10px;border:solid;border-width:1px;'>" + value['name'] + "</td>";
            string += "<td width='15%' style='padding-left:10px;padding-right:10px;border:solid;border-width:1px;'>" + value['deadline'] + "</td>";
            string += "<td class='dont-break-out' width='43%' style='padding-left:10px;padding-right:10px;text-align:justify;border:solid;border-width:1px;'>" + obs + "</td>";
            string += "</tr>";
        });

        string += "</table>";
        $("#next_deadlines").html(string);
        $("#main").css('width', '48%');
        $("#next_deadlines").css('width', '48%');
    });
}


function save_task(parent_id)
{
    $.ajax({method: "POST", url: "php/savetask.php", 
        data: {"parent_id": parent_id,
                "name": $("#new_name" + parent_id).val(), 
                "deadline": $("#new_deadline" + parent_id).val(), 
                "observations": $("#new_observations" + parent_id).val(),
                "class": $("#new_class" + parent_id).val(),
                "duration": $("#new_duration" + parent_id).val(),                                
        },
    }).done(function(data){
        var result = $.parseJSON(data);
        if (result != 1) alert("fail!");
        else { 
            reload_subtasks(parent_id); 
            $("#form_" + parent_id).html(''); 
        }
    });
}


function update_task(id, parent_id)
{
    $.ajax({method: "POST", url: "php/updatetask.php", 
        data: {"id": id,
                "name": $("#edit_new_name" + id).val(), 
                "deadline": $("#edit_new_deadline" + id).val(), 
                "observations": $("#edit_new_observations" + id).val(),
                "parent": $("#edit_new_parent" + id).val(),
                "class": $("#edit_new_class" + id).val(),                                
                "duration": $("#edit_new_duration" + id).val(),
        },
    }).done(function(data){
        var result = $.parseJSON(data);
        if (result != 1) alert("fail!");
        else {
            /*
            $('#task_' + id + '_name').text($("#edit_new_name" + id).val());
            $('#task_' + id + '_deadline').text($("#edit_new_deadline" + id).val());
            $('#task_' + id + '_observations').text($("#edit_new_observations" + id).val());
            $('#task' + id).show();                    
            $('#edit_form_' + id).hide();
            */
            reload_subtasks(parent_id);
            reload_subtasks($("#edit_new_parent" + id).val());
        }
    });
}


function update_task_conclusion_status(id, parent_id)
{
    $.ajax({method: "POST", 
            url: "php/update_task_conclusion_status.php", 
            data: {"task_id": id, }
        }).done(function(data){
        var result = $.parseJSON(data);
        if (result != 1) alert("fail!");
        else {
            reload_subtasks(parent_id);
        }
    });
}


function toggle_view_complete_tasks()
{
    $.ajax({method: "POST", url: "php/toggle_view.php", data: {"which": "view_complete"}}).done(function(data){
        reload_subtasks(0);
    });
}


function toggle_view_next_deadlines()
{
    $.ajax({method: "POST", url: "php/toggle_view.php", data: {"which": "view_next_deadlines"}}).done(function(data){
        if (data == 1)
        {
            list_next_deadlines();
            $("#next_deadlines").show();
        }
        else
        {
            $("#next_deadlines").hide();
            $("#main").css('width', '99%');
        }
    });
}

