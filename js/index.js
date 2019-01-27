
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

function create_task_html(value, parent_id)
{
    if (value['status'] == 1)
    {
        status = 'checked';
        color = "style='color:gray;'";
    }
    else
    {
        status = '';
        color = '';
    }

    str =  
        "<div id='edit_form_" + value['id']+ "' style='display:none' >" +
        "<a href='#' onclick='$(\"#task" + value['id'] + "\").show(); $(\"#edit_form_" + value['id'] + "\").hide();'><i class='material-icons tiny'>remove</i></a>" + 
        "<input type='text' id='edit_new_name" + value['id'] + "' value='" + value['name'] + "' /> " +
        "<input type='date' id='edit_new_deadline" + value['id'] + "' value='" + value['deadline'] + "' /> " + 
        "<input type='text' id='edit_new_observations" + value['id'] + "' value='" + value['observations'] + "' /> " +
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
            "<input type='checkbox' onclick='if(confirm(\"Are you sure you want to change the conclusion status of the task, and all subtasks?\")) update_task_conclusion_status(" + value['id'] + ", " + parent_id + "); ' " + status + " /> ";
            
    if (value['observations'])
        str += "<span id='task_" + value['id'] + "_observations' style='color:gray'> - " + value['observations'] + "</span>";
            
    str += "</div>";
    str += "<div style='padding-left:2%' id='subtasks" + value['id'] + "'></div>";

    return str;
}

function update_parent_selector(task_id, parent_id)
{
    $.ajax({method: "POST", url: "php/getalltasks.php"}).done(function(data) { 
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

function add_form(parent_id)
{
    $("#form_" + parent_id).html(
        "<a href='#' onclick='$(\"#form_" + parent_id + "\").html(\"\")'><i class='material-icons tiny'>remove</i></a>" + 
        "<input type='text' id='new_name" + parent_id + "' /> " +
        "<input type='date' id='new_deadline" + parent_id + "' /> " + 
        "<input type='text' id='new_observations" + parent_id + "' /> " + 
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
    // toggle icon
    icon_ref = $('#icon' + parent_id).find('i');

    if (icon_ref.text() == 'keyboard_arrow_right')
        icon_ref.text('keyboard_arrow_down');
    else
        icon_ref.text('keyboard_arrow_right');

    // toggle subtasks
    name = '#subtasks' + parent_id

    if ($(name).text().length == 0)
        reload_subtasks(parent_id);
    else
        $(name).text('');
}

function list_root_tasks()
{
    add_subtasks_to_container('#subtasks0', '0')
}

function save_task(parent_id)
{
    $.ajax({method: "POST", url: "php/savetask.php", 
        data: {"parent_id": parent_id,
                "name": $("#new_name" + parent_id).val(), 
                "deadline": $("#new_deadline" + parent_id).val(), 
                "observations": $("#new_observations" + parent_id).val()
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
    $.ajax({method: "POST", url: "php/toggle_view_incomplete.php"}).done(function(data){
        reload_subtasks(0);
    });
}



